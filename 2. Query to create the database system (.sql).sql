-- Query to create the database system (.sql)
CREATE DATABASE GoGame_Management
GO
USE GoGame_Management
GO

-- MsStaff
CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(100) NOT NULL,
	StaffGender VARCHAR(100) CHECK (StaffGender IN ('Female', 'Male')) NOT NULL,
	StaffDOB DATE NOT NULL,
	Salary NUMERIC(10, 2) NOT NULL,
	StaffPhone VARCHAR(20) NOT NULL,
	StaffAddress VARCHAR(100) NOT NULL
)

-- MsSupplier Table
CREATE TABLE MsSupplier(
	SupplierID CHAR(5) PRIMARY KEY 
			CHECK (SupplierID LIKE 'SU[0-9][0-9][0-9]') NOT NULL,
	SupplierName VARCHAR(100) NOT NULL,
	SupplierAddress VARCHAR(100) NOT NULL,
	SupplierPhone VARCHAR(20) NOT NULL
);

-- MsCustomer Table
CREATE TABLE MsCustomer(
	CustomerID CHAR(5) PRIMARY KEY 
			CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]') NOT NULL,
	CustomerName VARCHAR(100) NOT NULL,
	CustomerGender VARCHAR(10) 
			CHECK (CustomerGender IN ('Female', 'Male')) NOT NULL,
	CustomerDOB DATE NOT NULL,
	CustomerPhone VARCHAR(20) NOT NULL
);

-- MsGameType Table
CREATE TABLE MsGameType(
	GameTypeID CHAR(5) PRIMARY KEY 
		CHECK (GameTypeID LIKE 'GT[0-9][0-9][0-9]') NOT NULL,
	GameTypeName VARCHAR(100) NOT NULL
);

-- MsGame Table
CREATE TABLE MsGame(
	GameID CHAR(5) PRIMARY KEY 
			CHECK (GameID LIKE 'GA[0-9][0-9][0-9]') NOT NULL,
	GameTypeID CHAR(5) NOT NULL,
	GameName VARCHAR(100) NOT NULL CHECK (LEN(GameName) >= 5),
	GamePrice NUMERIC(10, 2) NOT NULL,
	ReleaseDate DATE NOT NULL CHECK (ReleaseDate <= GETDATE()),
	FOREIGN KEY (GameTypeID) REFERENCES MsGameType(GameTypeID),
);

-- Purchase Table
CREATE TABLE Purchase(
	PurchaseID CHAR(5) PRIMARY KEY 
			CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]') NOT NULL,
	StaffID CHAR(5) NOT NULL,
	SupplierID CHAR(5) NOT NULL,
	PurchaseDate DATE NOT NULL CHECK (PurchaseDate <= GETDATE()),
	FOREIGN KEY (StaffID) REFERENCES MsStaff(StaffID),
	FOREIGN KEY (SupplierID) REFERENCES MsSupplier(SupplierID)
);

-- PurchaseDetail Table
CREATE TABLE PurchaseDetail(
	PurchaseID CHAR(5) NOT NULL,
	GameID CHAR(5) NOT NULL,
	PurchaseQuantity INT NOT NULL CHECK (PurchaseQuantity > 0),
	PRIMARY KEY (PurchaseID, GameID),
	FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
	FOREIGN KEY (GameID) REFERENCES MsGame(GameID)
);

-- Sales Table
CREATE TABLE Sales(
	SalesID CHAR(5) PRIMARY KEY 
			CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]') NOT NULL,
	StaffID CHAR(5) NOT NULL,
	CustomerID CHAR(5) NOT NULL,
	TransactionDate DATE NOT NULL CHECK (TransactionDate <= GETDATE()),
	FOREIGN KEY (StaffID) REFERENCES MsStaff(StaffID),
	FOREIGN KEY (CustomerID) REFERENCES MsCustomer(CustomerID)
);

-- SalesDetail Table
CREATE TABLE SalesDetail(
	SalesID CHAR(5) NOT NULL,
	GameID CHAR(5) NOT NULL,
	SalesQuantity INT NOT NULL CHECK (SalesQuantity > 0),
	PRIMARY KEY (SalesID, GameID),
	FOREIGN KEY (SalesID) REFERENCES Sales(SalesID),
	FOREIGN KEY (GameID) REFERENCES MsGame(GameID)
);
