SELECT name FROM sqlite_master WHERE type='table';

SELECT * FROM superstore LIMIT 5;


-- Q1: What are the top 5 products by revenue?
-- Purpose: To identify the best-performing products that generate maximum sales revenue.
--to run,select the query and click ctrl+E twice

SELECT Product_Name, SUM(Sales) AS Total_Revenue
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Insight: A small set of products contributes heavily to overall revenue, helping focus marketing and inventory strategies.


-- Q2: What is the monthly sales trend?
-- Purpose: To analyze how sales change over time and identify seasonal patterns.


SELECT 
    strftime('%Y-%m', Order_Date) AS Month,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;
-- Insight: Sales trends reveal peak and low periods, useful for planning promotions and inventory.



-- Q3: Which category generates the highest profit?
-- Purpose: To determine which product category is most profitable for the business.


SELECT Category, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Insight: Helps the business focus on high-profit categories and optimize product strategy.


-- Q4: Which are the top 5 loss-making products?
-- Purpose: To identify products that negatively impact overall profitability.


SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit ASC
LIMIT 5;

-- Insight: These products may require pricing changes, reduced discounts, or discontinuation.


-- Q5: What is the region-wise sales performance?
-- Purpose: To compare sales across different geographical regions.


SELECT Region, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Insight: Identifies strong and weak markets, helping in regional strategy and resource allocation.


-- Q6: How does discount impact profit?
-- Purpose: To analyze the relationship between discount levels and profitability.


SELECT Discount, AVG(Profit) AS Avg_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- Insight: Higher discounts generally reduce profit, highlighting the need for optimized discount strategies.


-- Q7: Who are the top 5 customers by revenue?
-- Purpose: To identify high-value customers contributing the most to sales.


SELECT Customer_Name, SUM(Sales) AS Total_Spending
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Spending DESC
LIMIT 5;

-- Insight: These customers are valuable for retention strategies and personalized marketing.