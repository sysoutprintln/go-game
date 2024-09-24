-- Query to insert data into tables (.sql)

USE GoGame_Management
GO

-- Insert Data into MsStaff table
INSERT INTO MsStaff 
	(StaffID, StaffName, StaffGender, StaffDOB, Salary, StaffPhone, StaffAddress)
VALUES 
	('ST001', 'John Smith', 'Male', '2001-05-15', 50000.00, '8271542940', '123 Main Street'),
	('ST002', 'Emily Johnson', 'Female', '1988-09-22', 60000.00, '7392058364', '456 Elm Street'),
	('ST003', 'Michael Davis', 'Male', '1992-03-10', 5500.00, '6384927438', '789 Oak Avenue'),
	('ST004', 'Sarah Anderson', 'Female', '1995-12-03', 5200.00, '8372840183', '321 Pine Road'),
	('ST005', 'Christopher Wilson', 'Male', '2002-07-18', 4800.00, '8491723814', '987 Maple Lane'),
	('ST006', 'Jessica Thompson', 'Female', '1989-11-27', 5100.00, '9587138104', '654 Cedar Avenue'),
	('ST007', 'David Martinez', 'Male', '1993-02-05', 35300.00, '6371930483', '789 Elm Street'),
	('ST008', 'Ashley Johnson', 'Female', '2002-06-29', 15900.00, '7351940374', '345 Oak Avenue'),
	('ST009', 'James Brown', 'Male', '2001-08-12', 25100.00, '7153840183', '987 Pine Road'),
	('ST010', 'Olivia Davis', 'Female', '1995-04-20', 55300.00, '6381028374', '654 Maple Lane');

-- Insert Data into MsSupplier table
INSERT INTO MsSupplier 
	(SupplierID, SupplierName, SupplierAddress, SupplierPhone)
VALUES 
	('SU001', 'ABC Supplier', '789 Oak Street Drive', '28301840385'),
	('SU002', 'DEF Supplier', '321 Drive Pine Street', '9472037254'),
	('SU003', 'GHI Supplier', '123 Supplier Street', '7619364927'),
	('SU004', 'JKL Supplier', '456 Supplier Avenue', '9876543210'),
	('SU005', 'MNO Supplier', '789 Supplier Road', '8391048263'),
	('SU006', 'PQR Supplier', '123 Main City Street', '9382619240'),
	('SU007', 'STU Supplier', '781 Drive Kebon Jeruk', '9271920483'),
	('SU008', 'VWX Supplier', 'Jalan Duren Cabe', '9371623925'),
	('SU009', 'XYZ Supplier', 'Duren Drive Mark Street', '2803857249'),
	('SU010', 'RVU Supplier', 'Jalan Pineapple Street', '41826482053');

-- Insert Data into MsCustomer table
INSERT INTO MsCustomer 
	(CustomerID, CustomerName, CustomerGender, CustomerDOB, CustomerPhone)
VALUES 
	('CU001', 'Legawa Sihombing', 'Male', '2003-03-15', '9372648395'),
	('CU002', 'Michael Williams', 'Male', '2004-07-20', '9283628403'),
	('CU003', 'Alice Smith', 'Female', '1998-05-15', '5172930483'),
	('CU004', 'Rosman Budiyanto', 'Male', '1998-09-22', '5374920182'),
	('CU005', 'Eve Davis', 'Female', '1998-03-10', '7492028173'),
	('CU006', 'Alex Anderson', 'Male', '1993-12-03', '5493810294'),
	('CU007', 'Grace Wilson', 'Female', '1991-07-18', '5740281024'),
	('CU008', 'Rika Prastuti', 'Female', '2000-05-03', '4263840182'),
	('CU009', 'Julia Handayani', 'Female', '2001-09-02', '8402817394'),
	('CU010', 'Hardi Waluyo', 'Male', '1991-07-18', '6374930182');

-- Insert data into MsGameType table
INSERT INTO MsGameType
	(GameTypeID, GameTypeName)
VALUES 
	('GT001', 'RPG'),
	('GT002', 'Sandbox'),	
	('GT003', 'TPS'),
	('GT004', 'Adventure'),	
	('GT005', 'Sport'),	
	('GT006', 'MOBA'),	
	('GT007', 'Horror'),	
	('GT008', 'Fighting'),	
	('GT009', 'Simulation'),	
	('GT010', 'FPS');

-- Insert Data into MsGame table
INSERT INTO MsGame 
	(GameID, GameName, GamePrice, ReleaseDate, GameTypeID)
VALUES 
	('GA001', 'Run Now', 490000.00, '2019-06-15', 'GT001'),
	('GA002', 'Till Now', 380900.00, '2021-12-01', 'GT002'),
	('GA003', 'Take Your Fish', 700000.00, '2023-02-28', 'GT003'),
	('GA004', 'Run Ahead', 640000.00, '2022-09-10', 'GT004'),
	('GA005', 'Find Your Friend', 500000.00, '2023-05-01', 'GT005'),
	('GA006', 'Where is Your Home?', 567000.00, '2021-11-20', 'GT006'),
	('GA007', 'I Cannot See You', 485000.00, '2022-03-10', 'GT007'),
	('GA008', 'Do Not Move', 920000.00, '2023-01-05', 'GT008'),
	('GA009', 'Freeze', 560000.00, '2022-08-18', 'GT009'),
	('GA010', 'Fake Your Death', 800000.00, '2023-04-05', 'GT010');

-- Insert Data into Purchase table
INSERT INTO Purchase 
	(PurchaseID, StaffID, SupplierID,PurchaseDate)
VALUES 
	('PU001', 'ST010', 'SU001', '2019-01-10'),
	('PU002', 'ST008', 'SU001', '2020-02-20'),
	('PU003', 'ST006', 'SU002', '2021-03-25'),
	('PU004', 'ST004', 'SU003', '2023-05-10'),
	('PU005', 'ST002', 'SU005', '2021-06-15'),
	('PU006', 'ST003', 'SU007', '2022-03-25'),
	('PU007', 'ST005', 'SU009', '2022-05-10'),
	('PU008', 'ST007', 'SU004', '2023-04-15'),
	('PU009', 'ST009', 'SU006', '2020-03-25'),
	('PU010', 'ST001', 'SU008', '2022-05-10'),
	('PU011', 'ST004', 'SU010', '2020-06-15'),
	('PU012', 'ST006', 'SU005', '2021-12-09'),
	('PU013', 'ST002', 'SU003', '2022-11-07'),
	('PU014', 'ST008', 'SU006', '2023-01-15'),
	('PU015', 'ST010', 'SU009', '2020-08-01');

-- Insert Data into PurchaseDetail table
INSERT INTO PurchaseDetail 
	(PurchaseID, GameID, PurchaseQuantity)
VALUES 
	('PU001', 'GA001', 7),
	('PU002', 'GA002', 2),
	('PU003', 'GA003', 6),
	('PU004', 'GA004', 3),
	('PU005', 'GA005', 4),
	('PU006', 'GA006', 9),
	('PU007', 'GA007', 5),
	('PU008', 'GA008', 2),
	('PU009', 'GA009', 10),
	('PU010', 'GA010', 4),
	('PU001', 'GA010', 8),
	('PU002', 'GA009', 3),
	('PU003', 'GA008', 6),
	('PU004', 'GA007', 7),
	('PU005', 'GA006', 4),
	('PU006', 'GA005', 5),
	('PU007', 'GA004', 6),
	('PU008', 'GA003', 3),
	('PU009', 'GA002', 8),
	('PU010', 'GA001', 5),
	('PU001', 'GA007', 4),
	('PU002', 'GA005', 7),
	('PU003', 'GA004', 3),
	('PU004', 'GA002', 6),
	('PU005', 'GA008', 9),
	('PU006', 'GA009', 2);

-- Insert Data into Sales table
INSERT INTO Sales 
	(SalesID, StaffID, CustomerID, TransactionDate)
VALUES 
	('SA001', 'ST001', 'CU001', '2023-03-05'),
	('SA002', 'ST002', 'CU002', '2022-04-15'),
	('SA003', 'ST003', 'CU003', '2020-07-20'),
	('SA004', 'ST004', 'CU004', '2019-08-05'),
	('SA005', 'ST005', 'CU005', '2020-02-10'),
	('SA006', 'ST006', 'CU006', '2023-03-05'),
	('SA007', 'ST007', 'CU007', '2023-02-15'),
	('SA008', 'ST008', 'CU008', '2022-02-20'),
	('SA009', 'ST009', 'CU009', '2022-02-05'),
	('SA010', 'ST010', 'CU010', '2021-09-10'),
	('SA011', 'ST002', 'CU001', '2023-02-05'),
	('SA012', 'ST003', 'CU005', '2022-04-15'),
	('SA013', 'ST006', 'CU003', '2022-02-20'),
	('SA014', 'ST007', 'CU007', '2021-08-05'),
	('SA015', 'ST004', 'CU002', '2022-02-10');

-- Insert Data into SalesDetail table
INSERT INTO SalesDetail 
	(SalesID, GameID, SalesQuantity)
VALUES 
	('SA001', 'GA001', 18),
	('SA002', 'GA002', 24),
	('SA003', 'GA003', 22),
	('SA004', 'GA004', 27),
	('SA005', 'GA005', 14),
	('SA006', 'GA006', 37),
	('SA007', 'GA007', 42),
	('SA008', 'GA008', 22),
	('SA009', 'GA009', 15),
	('SA010', 'GA010', 14),
	('SA001', 'GA010', 14),
	('SA002', 'GA009', 26),
	('SA003', 'GA008', 36),
	('SA004', 'GA007', 29),
	('SA005', 'GA006', 15),
	('SA006', 'GA005', 15),
	('SA007', 'GA004', 11),
	('SA008', 'GA003', 13),
	('SA009', 'GA002', 16),
	('SA010', 'GA001', 17),
	('SA001', 'GA007', 14),
	('SA002', 'GA005', 21),
	('SA003', 'GA004', 25),
	('SA004', 'GA002', 27),
	('SA005', 'GA008', 38),
	('SA006', 'GA009', 42);

-- 10 Data
SELECT * FROM MsStaff
SELECT * FROM MsSupplier
SELECT * FROM MsCustomer
SELECT * FROM MsGame
SELECT * FROM MsGameType

-- 15 Data
SELECT * FROM Purchase
SELECT * FROM Sales

-- 25 Data
SELECT * FROM PurchaseDetail
SELECT * FROM SalesDetail
