-- Query to simulate the transaction processes (.sql)

USE GoGame_Management
GO

--> 1st Simulation
-- A simulation of a customer that wants to buy products from the company by using the DML queries to simulate the transactions process

-- 1. Insert the necessary information in the transaction process
-- [Customer Information]
-- Customer Identity		: CU026
-- Customer Name			: Celine Khoo
-- Customer Gender		: Female
-- Customer Date of Birth	: 14 May 2000
-- Customer Phone		: 081345278311

INSERT INTO MsCustomer VALUES
('CU026', 'Celine Khoo', 'Female', '14 May 2000', '081345278311')

-- 2. Insert the necessary detail information in the transaction process
-- On 5 December of 2021, Celine Khoo bought 6 amount of games:
-- 1) 3 of Run Now game
-- 2) 2 of Where is Your Home? game
-- 3) 1 of Till Now game

INSERT INTO Sales VALUES
('SA030', 'ST021', 'CU026', '2021-12-05')

INSERT INTO SalesDetail VALUES
('SA030', 'GA001', '3'),
('SA030', 'GA006', '2'),
('SA030', 'GA002', '1')

--> 2nd Simulation
-- A simulation of the company wants to buy products from a supplier by using the DML queries to simulate the transactions process

-- 1. Insert the necessary information in the transaction process
-- [Supplier Information]
-- Supplier Identity		: SU020
-- Supplier Name			: CoolGames Supplier Company
-- Supplier Address		: Bonevalie J1, Street City
-- Customer Phone		: 082355662712

INSERT INTO MsSupplier VALUES
('SU020', 'CoolGames Supplier Company', 'Bonevalie J1, Street City', '082355662712')

-- 2. Insert the necessary detail information in the transaction process
-- On 10 January of 2022, Arianne May sold 6 amount of games under the purchase identification of PU027:
-- 1) 3 of Run Now game
-- 2) 2 of Where is Your Home? game
-- 3) 1 of Till Now game

INSERT INTO Purchase VALUES
('PU027', 'ST023', 'SU020', '2022-01-10')

INSERT INTO PurchaseDetail VALUES
('SA030', 'GA001', '3'),
('SA030', 'GA006', '2'),
('SA030', 'GA002', '1')
