-- Assignment: Database Design and Normalization
-- Author: Geoffrey Lokol
-- Purpose: Normalize tables to 1NF and 2NF
-- --------------------------------------------

-- 🛠️ Question 1: Achieving 1NF (First Normal Form)
-- Original table violates 1NF by storing multiple values in the Products column.
-- This transformation ensures atomicity by making each product its own row.

-- Step 1: Create a new table for 1NF structure
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Step 2: Insert normalized records (1 row per product)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ---------------------------------------------------

-- 🧩 Question 2: Achieving 2NF (Second Normal Form)
-- Issue: Partial dependency - CustomerName depends only on OrderID
-- Solution: Split into Orders and OrderDetails_2NF

-- Step 1: Create Orders table (CustomerName now only depends on OrderID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Populate the Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 3: Create OrderDetails table with Product and Quantity
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Populate the OrderDetails_2NF table
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- ---------------------------------------------------