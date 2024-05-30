# Memeriksa keunikan masing-masing primary key #

# Challange 1 #

SELECT CustomerID, COUNT(*) as count
FROM `bank_muamalat.Customers`
GROUP BY CustomerID
HAVING COUNT(*) > 1;

SELECT OrderID, COUNT(*) as count
FROM `bank_muamalat.Orders`
GROUP BY OrderID
HAVING COUNT(*) > 1;

SELECT ProdNumber, COUNT(*) as count
FROM `bank_muamalat.Product`
GROUP BY ProdNumber
HAVING COUNT(*) > 1;

SELECT CategoryID, COUNT(*) as count
FROM `bank_muamalat.Product_Category`
GROUP BY CategoryID
HAVING COUNT(*) > 1;


# Membuat master data #
# Challange 2 #

CREATE VIEW `bank_muamalat.master_data` AS
SELECT 
    a.OrderID, a.Date, a.Quantity, c.ProdNumber, c.ProdName, d.CategoryID,
    d.CategoryName, c.Price, b.CustomerID, b.FullName, b.FirstName, b.LastName,
    b.CustomerCity, b.CustomerState, b.CustomerAddress, b.CustomerPhone,
    b.CustomerEmail2, (a.Quantity * c.Price) as total_sales 
FROM 
    `bank_muamalat.Orders` AS a
JOIN 
    `bank_muamalat.Customers` AS b
ON 
    a.CustomerID = b.CustomerID
JOIN 
    `bank_muamalat.Product` as c
ON
    a.ProdNumber = c.ProdNumber
JOIN 
    `bank_muamalat.Product_Category` as d
ON 
    c.Category = d.CategoryID;
select * from `bank_muamalat.master_data`;


SELECT * FROM `bank_muamalat.master_data` ORDER BY OrderID;

# Challange 3 #

CREATE VIEW `bank_muamalat.master_data2` AS
SELECT 
    a.Date, d.CategoryName, c.ProdName, c.Price,  a.Quantity, 
   (a.Quantity * c.Price) as total_sales, b.CustomerEmail2, b.CustomerCity
FROM 
    `bank_muamalat.Orders` AS a
JOIN 
    `bank_muamalat.Customers` AS b
ON 
    a.CustomerID = b.CustomerID
JOIN 
    `bank_muamalat.Product` as c
ON
    a.ProdNumber = c.ProdNumber
JOIN 
    `bank_muamalat.Product_Category` as d
ON 
    c.Category = d.CategoryID;
select * from `bank_muamalat.master_data`;


SELECT * FROM `bank_muamalat.master_data2` ORDER BY Date;
