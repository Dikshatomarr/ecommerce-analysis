-- 1. Overview Statistics
-- select * from [dbo].[ecommerce]
-------------------------
-- Total number of rows, transactions, and unique customers
SELECT COUNT(*) AS Total_Rows,
    COUNT(DISTINCT CID) AS Unique_Customers,
	COUNT(DISTINCT TID) AS Unique_transactions
FROM [dbo].[ecommerce]

-- Count of unique product categories and discount types
SELECT COUNT(DISTINCT Product_Category) AS Unique_Product_Category,
	   COUNT(DISTINCT Discount_Name) AS Unique_Discount_type
FROM [dbo].[ecommerce]

--  2. Date & Time Analysis
-- -------------------------
-- Check range of purchase dates
 SELECT MIN(CONVERT(date, [Purchase_Date], 105)) AS First_Purchase,
       MAX(CONVERT(date, [Purchase_Date], 105)) AS Last_Purchase
FROM [dbo].[ecommerce]

-- Number of transactions per month/year
	SELECT 
    [Purchase_Year], 
    [Purchase_Month], 
    COUNT(*) AS Transactions_Count
	FROM [dbo].[ecommerce]
	GROUP BY [Purchase_Year], [Purchase_Month]
	ORDER BY [Purchase_Year], [Purchase_Month];

-- Revenue trends by Purchase Month-Year
   SELECT 
    [Purchase_Year], 
    [Purchase_Month], 
    SUM([Net_Amount]) AS Monthly_Revenue
	FROM [dbo].[ecommerce]
	GROUP BY [Purchase_Year], [Purchase_Month]
	ORDER BY [Purchase_Year], [Purchase_Month]; 

-- Peak shopping months or seasons
SELECT 
    [Purchase_Month],
    COUNT(*) AS Transactions,
    SUM([Net_Amount]) AS Total_Revenue
FROM [dbo].[ecommerce]
GROUP BY [Purchase_Month]
ORDER BY Total_Revenue DESC;

	

-- 3. Customer Demographics
-- --------------------------
-- Distribution of Gender
	SELECT Gender, COUNT(*) AS Count FROM [dbo].[ecommerce]
    GROUP BY Gender;
		   
-- Distribution by Age Group
	SELECT Age_Group, COUNT(*) AS Count FROM [dbo].[ecommerce]
    GROUP BY Age_Group;

-- Top Age Group by total revenue or purchase count
	SELECT Age_Group, Sum(Net_Amount) AS Total_Revenue,COUNT(*) AS Purchase_Count
	FROM [dbo].[ecommerce]
    GROUP BY Age_Group
	ORDER BY Total_Revenue DESC

--  4. Discount Analysis
-- ----------------------
-- Count and percentage of transactions with discounts
    SELECT Discount_Availed, Count(*) as Transactions, 
	Round(100.0 * Count(*) / SUM(COUNT(*)) OVER () ,2) AS Percentage
    from DBO.ecommerce
	GROUP BY Discount_Availed

-- Avg. Discount Amount per Discount Name
    SELECT Discount_Name , Count(*) as Usage_count, Avg(Discount_Amount_INR) as Average_Discount
    from DBO.ecommerce where Discount_Availed ='1'
	GROUP BY Discount_Name

-- Avg. Profit Impact (%) when discounts are used vs. not used
   SELECT Discount_Availed, Avg(Profit_Impact) as Average_Profit_Impact
   FROM DBO.ecommerce  WHERE Discount_Availed IN ('0', '1')
   group by Discount_Availed
	

-- Revenue and profit comparison: Discount vs Non-discount transactions
   SELECT Discount_Availed, Avg(Profit_Impact) as Average_Profit_Impact, SUM(Net_Amount) as Total_Revenue
   FROM DBO.ecommerce  WHERE Discount_Availed IN ('0', '1')
   group by Discount_Availed

-- 5. Purchase Method Analysis
-- -----------------------------
-- Transactions count and revenue by Purchase Method (e.g., Online, Offline)
   SELECT Purchase_Method, Count(*) as Transactions_count,
   Sum(Net_Amount) as Total_revenue
   FROM [dbo].[ecommerce]
   group by Purchase_Method
   order by Total_revenue Desc


-- 6. Product Category Insights
-- ------------------------------
-- Total revenue and avg. net amount per Product Category
	SELECT Product_Category,
	COUNT(*) AS Transactions,
	SUM(Net_amount) as Total_revenue,
	Avg(Net_Amount) as Avg_Order_Value
	from DBO.ecommerce
	Group BY Product_Category

-- Top-selling categories by volume and profit
SELECT [Product_Category],
       AVG([Profit_Impact]) AS Avg_Profit,
       SUM(Discount_Amount_INR) AS Total_Discount_Spent
FROM [dbo].[ecommerce]
GROUP BY Product_Category

-- Impact of discount by category (are some categories more discount-sensitive?)
SELECT 
    Product_Category,
    Discount_Availed,
    COUNT(*) AS Transactions,
    ROUND(AVG(Net_Amount), 2) AS Avg_Net_Amount,
    ROUND(AVG(Profit_Impact), 2) AS Avg_Profit
FROM dbo.ecommerce
WHERE Discount_Availed IN (0, 1)
GROUP BY Product_Category, Discount_Availed
ORDER BY Product_Category, Discount_Availed;



-- 7. Profitability Insights
-- ---------------------------
-- Avg. Profit Impact (%) overall
 SELECT AVG([Profit_Impact]) AS Overall_Profit_Impact FROM [dbo].[ecommerce];

-- Profit Impact by Discount Name, Purchase Method, Product Category
SELECT 
    Discount_Name,
    Purchase_Method,
    Product_Category,
    COUNT(*) AS Transactions,
    ROUND(AVG(Net_Amount), 2) AS Avg_Net_Amount,
    ROUND(AVG(Profit_Impact), 2) AS Avg_Profit,
    ROUND(SUM(Profit_Impact), 2) AS Total_Profit
FROM dbo.ecommerce
GROUP BY 
    Discount_Name, 
    Purchase_Method, 
    Product_Category
ORDER BY 
    Total_Profit DESC;

-- 8. Location Analysis
-- ----------------------
-- Transactions, revenue, and discounts used by Location
	SELECT Location,
       COUNT(*) AS Transactions,
       SUM([Net_Amount]) AS Total_Revenue,
       SUM([Discount_Amount_INR]) AS Total_Discounts
	FROM [dbo].[ecommerce]
	GROUP BY Location
	ORDER BY Total_Revenue DESC;


-- Profitability by region
	SELECT 
		[Location],
		AVG([Profit_Impact]) AS Avg_Profit_Impact,
		SUM([Net_Amount]) AS Total_Revenue
	FROM [dbo].[ecommerce]
	GROUP BY [Location]
	ORDER BY Avg_Profit_Impact DESC;


-- 9. Missing or Anomalous Data Check
-- -------------------------------------
-- Count of NULLs or blanks in key columns (e.g., Gender, Age Group, Location)
   SELECT 
    SUM(CASE WHEN [Gender] IS NULL OR [Gender] = '' THEN 1 ELSE 0 END) AS Missing_Gender,
    SUM(CASE WHEN [Age_Group] IS NULL OR [Age_Group] = '' THEN 1 ELSE 0 END) AS Missing_Age_Group,
    SUM(CASE WHEN [Location] IS NULL OR [Location] = '' THEN 1 ELSE 0 END) AS Missing_Location
   FROM [dbo].[ecommerce];

-- Outliers in Net Amount or Discount Amount
SELECT * FROM [dbo].[ecommerce]
WHERE [Net_Amount] > 10000; 

-- Any negative values in profit or amount fields

SELECT *
FROM dbo.ecommerce
WHERE 
    Profit_Impact < 0
    OR Net_Amount < 0
    OR Gross_Amount < 0
    OR TRY_CAST(Discount_Amount_INR AS FLOAT) < 0;



