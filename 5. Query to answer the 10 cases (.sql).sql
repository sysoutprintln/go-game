-- Query to answer the 10 cases (.sql)

USE GoGame_Management
GO

-- No 1
SELECT 
	StaffID = REPLACE(ms.StaffID, 'ST', 'Staff'),
	StaffName = UPPER(StaffName),
	[Total Sales] = COUNT(s.SalesID)
FROM 
	MsCustomer c
	JOIN Sales s ON c.CustomerID = s.CustomerID
	JOIN MsStaff ms ON ms.StaffID = s.StaffID
	JOIN Purchase p ON p.StaffID = ms.StaffID
	JOIN PurchaseDetail pd ON pd.PurchaseID = p.PurchaseID
	JOIN MsGame g ON g.GameID = pd.GameID
	JOIN SalesDetail sd ON sd.GameID = g.GameID
WHERE 
	StaffGender = 'Male'	
GROUP BY
	ms.StaffID,
	StaffName,
	StaffGender,
	CustomerGender
HAVING
	c.CustomerGender = 'Female'

-- No 2
SELECT
	P.PurchaseID,
	PurchaseDate = CONVERT(VARCHAR, PurchaseDate, 103),
	[Total Game Type] = COUNT(gt.GameTypeID)
FROM
	Purchase p 
	JOIN PurchaseDetail pd ON pd.PurchaseID = p.PurchaseID
	JOIN MsGame g ON g.GameID = pd.GameID
	JOIN MsGameType gt ON gt.GameTypeID = g.GameTypeID
WHERE 
	YEAR(PurchaseDate) = 2019
GROUP BY
	p.PurchaseID,
	PurchaseDate
HAVING
	COUNT(gt.GameTypeID) > 2

-- No 3
SELECT DISTINCT
	[CustomerCode] = REVERSE(c.CustomerID),
	CustomerName = UPPER(CustomerName),
	[TotalTransaction] = COUNT(s.SalesID),
	[MinimumPurchase] = MIN(SalesQuantity)
FROM 
	MsCustomer c 
	JOIN Sales s ON s.CustomerID = c.CustomerID
	JOIN SalesDetail sd ON s.SalesID = sd.SalesID
WHERE 
	CustomerName LIKE 'M%'
GROUP BY
	c.CustomerID,
	CustomerName,
	s.SalesID
HAVING 
	COUNT(s.SalesID) > 1

-- No 4
SELECT
	ms.SupplierID,
	SupplierName = CONCAT(SupplierName, ' Inc.'),
	[TotalGamesSold] = SUM(pd.PurchaseQuantity),
	[MaximumGamesSold] = MAX(pd.PurchaseQuantity)
FROM 
	MsSupplier ms
	JOIN Purchase p ON p.SupplierID = ms.SupplierID
	JOIN PurchaseDetail pd ON pd.PurchaseID = p.PurchaseID
WHERE 
	SupplierAddress LIKE '%Drive%'
GROUP BY
	SupplierName,
	ms.SupplierID
HAVING 
	CAST(RIGHT (ms.SupplierID, 3) AS INT) % 2 = 1

-- No 5
SELECT 
	PurchaseID, 
	ms.SupplierID,
	[StaffFirstName] = SUBSTRING(StaffName, 1, CHARINDEX(' ', StaffName) - 1),
	StaffDOB
FROM 
	MsSupplier ms
	JOIN Purchase p ON ms.SupplierID = p.SupplierID
	JOIN MsStaff s ON s.StaffID = p.StaffID,
	(SELECT [AverageSalary] = AVG(s.Salary)
	FROM MsStaff s) AS StaffSalary
WHERE
	s.Salary > StaffSalary.AverageSalary
	AND YEAR(StaffDOB) > 2000

-- No 6
SELECT 
	s.SalesID,
	TransactionDate,
	CustomerName = LOWER(CustomerName)
FROM 
	MsCustomer c
	JOIN Sales s ON c.CustomerID = s.CustomerID
	JOIN SalesDetail sd ON sd.SalesID = s.SalesID,
	(SELECT [AvgSalesQuantity] = AVG(SalesQuantity)
	FROM SalesDetail) AS AvgSales
WHERE 
	DATEDIFF(YEAR, CustomerDOB, GETDATE()) < 24
    AND SalesQuantity > AvgSales.AvgSalesQuantity

-- No 7
SELECT 
	[PurchasedDay] = DATENAME(WEEKDAY, p.PurchaseDate),
	GameID = REPLACE(g.GameID, 'GA', 'Game'),
	[GameReleasedYear] = YEAR(g.ReleaseDate)
FROM 
	Purchase p 
	JOIN PurchaseDetail pd ON p.PurchaseID = pd.PurchaseID
	JOIN MsGame g ON g.GameID = pd.GameID,
	(SELECT [AvgGamePrice] = AVG(GamePrice)
	FROM MsGame) AS AvgMsGame
WHERE 
	GamePrice > AvgMsGame.AvgGamePrice AND
	DATENAME(QUARTER, ReleaseDate) = 2
GROUP BY
	p.PurchaseDate,
	g.GameID,
	g.ReleaseDate

-- No 8
SELECT 
	SalesID = LOWER(s.SalesID),
	[SalesDate] = CONVERT(VARCHAR, TransactionDate, 105),
	[TotalSalesCost] = CONCAT('Rp. ', SUM(SalesQuantity * GamePrice))
FROM 
	MsStaff st
	JOIN Sales s ON s.StaffID = st.StaffID
	JOIN SalesDetail sd ON sd.SalesID = s.SalesID
	JOIN MsGame g ON g.GameID = sd.GameID,
	(SELECT [AvgStaffSalary] = AVG(Salary)
	FROM MsStaff) AS AvgSalary
WHERE 
	Salary > AvgSalary.AvgStaffSalary AND
	DATENAME(MONTH, TransactionDate) = 'February'
GROUP BY
	s.SalesID,
	TransactionDate

-- No 9
CREATE VIEW
	Customer_Quarterly_Transaction_View 
AS
SELECT 
	c.CustomerID,
	CustomerName,
	[TotalTransaction] = COUNT(s.SalesID),
	[MaximumPurchaseQuantity] = CONCAT(CAST(MAX(SalesQuantity) AS VARCHAR), ' Pc(s)')
FROM 
	MsCustomer c 
	JOIN Sales s ON c.CustomerID = s.CustomerID
	JOIN MsStaff st ON s.StaffID = st.StaffID
	JOIN SalesDetail sd ON s.SalesID = sd.SalesID
WHERE
	YEAR(TransactionDate) = 2021 AND
	StaffGender = 'Female'
GROUP BY
	c.CustomerID,
	CustomerName
GO

SELECT * FROM Customer_Quarterly_Transaction_View

-- No 10
CREATE VIEW 
	QuarterlySalesReport
AS
SELECT 
	[TotalSales] = CONCAT('Rp. ', SUM(SalesQuantity * GamePrice)),
	[AverageSales] = CONCAT('Rp. ', AVG(SalesQuantity * GamePrice))
FROM 
	Sales s
	JOIN SalesDetail sd ON s.SalesID = sd.SalesID
	JOIN MsGame g ON sd.GameID = g.GameID
WHERE
	DATENAME(QUARTER, TransactionDate) = 1 AND
	GamePrice > 200000

SELECT * FROM QuarterlySalesReport
