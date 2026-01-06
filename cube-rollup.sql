Create Database cubevsrollup;

Create Table Sales(
Region VARCHAR(50),
Product VARCHAR(50),
Year INT,
Amount INT
);

insert into Sales(Region,Product,Year,Amount)VALUES
('East', 'Laptop', 2025, 50000),
('East', 'Mobile', 2025, 30000),
('West', 'Laptop', 2025, 40000),
('West', 'Mobile', 2025, 20000),
('North', 'Laptop', 2025, 35000),
('North', 'Mobile', 2025, 25000);

SELECT * FROM Sales;

SELECT Region,Product, SUM(Amount) as TotalSales
FROM Sales
Group By Cube(Region,Product);

SELECT Region,Product,SUM(Amount) as TotalSales
FROM Sales
Group By rollup(Region,Product);


SELECT 
    -- If Region/Product is being grouped (NULL), call it 'All Regions/All Products', otherwise show the Region/Product name
    
    CASE  WHEN GROUPING(Region) = 1 THEN 'All Regions' ELSE Region END AS Region,
    CASE WHEN GROUPING(Product) = 1 THEN 'All Products'ELSE Product END AS Product,
    
    SUM(Amount) as TotalSales

 FROM Sales
 GROUP BY CUBE(Region, Product)
 ORDER BY Region, Product;


SELECT
 CASE WHEN GROUPING(Region) = 1 THEN 'All Regions' ELSE Region END AS Region,
 CASE WHEN GROUPING(Product) = 1 THEN 'All Products' ELSE Product END AS Product,
 SUM(Amount) as TotalSales
 FROM Sales
 GROUP BY ROLLUP(Region,Product)
 ORDER BY Region,Product;
