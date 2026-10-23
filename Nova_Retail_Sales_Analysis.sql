
CREATE DATABASE nova_retail;

USE nova_retail;

CREATE TABLE sales_data (
    order_id INT PRIMARY KEY,
    order_date DATE,
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    sales_amount DECIMAL(12,2),
    cost_amount DECIMAL(12,2)
);



USE nova_retail;

INSERT INTO sales_data
(order_id, order_date, city, product, category, quantity, sales_amount, cost_amount)
VALUES
(1001, '2026-01-05', 'Chennai', 'Laptop', 'Electronics', 2, 100000, 80000),
(1002, '2026-01-08', 'Bangalore', 'Chair', 'Furniture', 5, 15000, 10000),
(1003, '2026-01-12', 'Chennai', 'Phone', 'Electronics', 4, 80000, 60000),
(1004, '2026-02-03', 'Hyderabad', 'Desk', 'Furniture', 3, 24000, 18000),
(1005, '2026-02-10', 'Bangalore', 'Laptop', 'Electronics', 1, 50000, 40000),
(1006, '2026-02-15', 'Chennai', 'Chair', 'Furniture', 6, 18000, 12000),
(1007, '2026-03-02', 'Hyderabad', 'Phone', 'Electronics', 3, 60000, 45000),
(1008, '2026-03-09', 'Chennai', 'Desk', 'Furniture', 2, 16000, 12000),
(1009, '2026-03-15', 'Bangalore', 'Phone', 'Electronics', 5, 100000, 75000),
(1010, '2026-03-20', 'Chennai', 'Laptop', 'Electronics', 1, 50000, 40000);

USE nova_retail;

SELECT
    SUM(sales_amount) AS Total_Sales,
    SUM(cost_amount) AS Total_Cost,
    SUM(sales_amount - cost_amount) AS Total_Profit
FROM sales_data;

SELECT
    city,
    SUM(sales_amount) AS Total_Sales,
    SUM(sales_amount - cost_amount) AS Total_Profit
FROM sales_data
GROUP BY city
ORDER BY Total_Sales DESC;



USE nova_retail;

SELECT
    category,
    SUM(sales_amount) AS Total_Sales,
    SUM(cost_amount) AS Total_Cost,
    SUM(sales_amount - cost_amount) AS Total_Profit,
    ROUND(
        SUM(sales_amount - cost_amount) / SUM(sales_amount) * 100,
        2
    ) AS Profit_Margin_Percent
FROM sales_data
GROUP BY category
ORDER BY Total_Profit DESC;

SELECT
    product,
    SUM(sales_amount) AS Total_Sales,
    SUM(sales_amount - cost_amount) AS Total_Profit,
    ROUND(
        SUM(sales_amount - cost_amount)
        / SUM(sales_amount) * 100, 2
    ) AS Profit_Margin,
    CASE
        WHEN SUM(sales_amount - cost_amount)
             / SUM(sales_amount) >= 0.30
            THEN 'High Profit'
        WHEN SUM(sales_amount - cost_amount)
             / SUM(sales_amount) >= 0.20
            THEN 'Medium Profit'
        ELSE 'Low Profit'
    END AS Profit_Status
FROM sales_data
GROUP BY product
ORDER BY Total_Profit DESC;


USE nova_retail;

CREATE TABLE products (
    product VARCHAR(100) PRIMARY KEY,
    supplier VARCHAR(100),
    standard_cost DECIMAL(12,2)
);

INSERT INTO products
(product, supplier, standard_cost)
VALUES
('Laptop', 'TechWorld', 40000),
('Phone', 'MobileHub', 15000),
('Chair', 'ComfortLiving', 2000),
('Desk', 'OfficePro', 6000);




USE nova_retail;

SELECT
    city,
    SUM(sales_amount) AS Total_Sales,
    SUM(sales_amount - cost_amount) AS Total_Profit
FROM sales_data
GROUP BY city
ORDER BY Total_Profit DESC;
USE nova_retail;

SELECT
    product,
    SUM(sales_amount) AS Total_Sales,
    SUM(sales_amount - cost_amount) AS Total_Profit,
    ROUND(
        SUM(sales_amount - cost_amount)
        / SUM(sales_amount) * 100,
        2
    ) AS Profit_Margin_Percent
FROM sales_data
GROUP BY product
ORDER BY Total_Profit DESC;



