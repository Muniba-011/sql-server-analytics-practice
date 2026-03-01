CREATE DATABASE Having_OrderBy;

CREATE TABLE OnlineOrders(
	Order_id int primary key,
	Customer_name varchar(50),
	Product_category varchar(50),
	Price decimal (10,2),
	Quantity int,
	City varchar (50),
	Order_date date
);

INSERT INTO OnlineOrders (order_id, customer_name, city, product_category, quantity, price, order_date)
VALUES
(1, 'Ali', 'Karachi', 'Electronics', 2, 45000, '2024-01-10'),
(2, 'Sara', 'Lahore', 'Clothing', 5, 3000, '2024-01-12'),
(3, 'Ahmed', 'Karachi', 'Electronics', 1, 75000, '2024-01-15'),
(4, 'Hina', 'Islamabad', 'Cosmetics', 4, 2500, '2024-01-18'),
(5, 'Usman', 'Lahore', 'Electronics', 3, 40000, '2024-01-20'),
(6, 'Zara', 'Karachi', 'Clothing', 6, 3500, '2024-01-22'),
(7, 'Bilal', 'Islamabad', 'Electronics', 2, 60000, '2024-01-25'),
(8, 'Ayesha', 'Lahore', 'Cosmetics', 3, 2000, '2024-01-27'),
(9, 'Hamza', 'Karachi', 'Clothing', 4, 2800, '2024-01-28'),
(10, 'Mariam', 'Islamabad', 'Electronics', 1, 90000, '2024-01-30');

select * from OnlineOrders;

-- ORDER BY QUERIES:

select Price 
from OnlineOrders
order by Price DESC;

select * from OnlineOrders
order by city;

select * from OnlineOrders
order by Quantity ASC;

select TOP 3 * from OnlineOrders
order by Price DESC;

SELECT order_id, customer_name, quantity, price,
       (quantity * price) AS total_amount
FROM OnlineOrders
ORDER BY total_amount DESC;

SELECT * FROM OnlineOrders
ORDER BY 
CASE 
	WHEN Product_category = 'Electronics'THEN 1 
	WHEN Product_category = 'Clothing' THEN 2
	ELSE 3
END;

SELECT Customer_name,City
FROM OnlineOrders
ORDER BY LEN(Customer_name) DESC;

SELECT *
FROM OnlineOrders
ORDER BY YEAR(order_date) DESC,MONTH(order_date) DESC;

SELECT *
FROM OnlineOrders
ORDER BY City ASC,Price DESC;

SELECT *
FROM OnlineOrders
ORDER BY NEWID();

-- HAVING QUERIES:

SELECT city, SUM(price) AS total_sales
FROM OnlineOrders
GROUP BY city
HAVING SUM(price) > 100000;

SELECT city, COUNT(order_id) AS total_orders
FROM OnlineOrders
GROUP BY city
HAVING COUNT(order_id) > 2;

SELECT product_category, AVG(price) AS avg_price
FROM OnlineOrders
GROUP BY product_category
HAVING AVG(price) > 30000;

SELECT city, SUM(price) AS total_sales
FROM OnlineOrders
WHERE product_category = 'Electronics'
GROUP BY city
HAVING SUM(price) > 100000;

SELECT product_category,
SUM(quantity) AS total_quantity,
AVG(price) AS avg_price
FROM OnlineOrders
GROUP BY product_category
HAVING SUM(quantity) > 5 AND AVG(price) > 20000;

SELECT city, SUM(quantity * price) AS total_revenue
FROM OnlineOrders
GROUP BY city
HAVING SUM(quantity * price) > 100000
ORDER BY total_revenue DESC;

SELECT City, Product_category, SUM(Price) AS TotalSales
FROM OnlineOrders
WHERE Year(Order_date) = 2024
GROUP BY City, Product_category
HAVING SUM(Price) >= 30000
ORDER BY TotalSales;






