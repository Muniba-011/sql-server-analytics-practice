Create database MyFirstDB;

Create Table Orders(

OrderID int IDENTITY(1,1) PRIMARY KEY,
Customer_Name varchar (50),
City varchar(50),
category varchar(50),
TotalAmount decimal(10,2),
Order_Date date

);

INSERT INTO Orders (Customer_Name, City, Category, TotalAmount, Order_Date)
VALUES 
('Ali', 'Karachi', 'Electronics', 50000, '2024-01-01'),
('Sana', 'Lahore', 'Clothing', 3000, '2024-01-02'),
('Ahmed', 'Karachi', 'Electronics', 12000, '2024-01-03'),
('Zara', 'Islamabad', 'Furniture', 45000, '2024-01-04'),
('Bilal', 'Lahore', 'Electronics', 8000, '2024-01-05'),
('Hina', 'Karachi', 'Clothing', 5000, '2024-01-06'),
('Omer', 'Islamabad', 'Furniture', 20000, '2024-01-07'),
('Sara', 'Karachi', 'Clothing', 4000, '2024-01-08');

Select * from Orders;

SELECT City,COUNT (OrderID)  as TotalOrders
FROM Orders 
Group By City;

SELECT Category, SUM (TotalAmount) as TotalRevenue
FROM Orders
Group By Category;

SELECT City, Category,SUM (TotalAmount) as TotalSales
FROM Orders
Group By City,Category
Order By City;

SELECT City, AVG (TotalAmount) as AvgOrderValue
FROM Orders
Group By City;