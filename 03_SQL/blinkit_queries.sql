USE blinkit_db;
SELECT * FROM blinkit_data;

SELECT DISTINCT item_fat_content FROM blinkit_data;


SELECT
    ROUND(SUM(sales), 0)   AS Total_Sales,
    ROUND(AVG(sales), 2)   AS Avg_Sales,
    COUNT(*)               AS No_of_Items,
    ROUND(AVG(rating), 2)  AS Avg_Rating
FROM blinkit_data;




-- Chart 1: Sales by Fat Content
-- Sawal: Low Fat aur Regular items ki sales kitni hai?


SELECT
    item_fat_content,
    ROUND(SUM(sales), 0)   AS Total_Sales,
    ROUND(AVG(sales), 2)   AS Avg_Sales,
    COUNT(*)               AS No_of_Items,
    ROUND(AVG(rating), 2)  AS Avg_Rating
FROM blinkit_data
GROUP BY item_fat_content;


-- Chart 2: Sales by Item Type
-- Sawal: Kaunsi category sabse zyada bik rahi hai?


SELECT
    item_type,
    ROUND(SUM(sales), 0)   AS Total_Sales,
    ROUND(AVG(sales), 2)   AS Avg_Sales,
    COUNT(*)               AS No_of_Items,
    ROUND(AVG(rating), 2)  AS Avg_Rating
FROM blinkit_data
GROUP BY item_type
ORDER BY Total_Sales DESC;



-- Chart 3: Fat Content by Outlet Type
-- Sawal: Har outlet type me Low Fat aur Regular ki sales kitni hai?

SELECT
    outlet_type,
    item_fat_content,
    ROUND(SUM(sales), 0)   AS Total_Sales,
    ROUND(AVG(sales), 2)   AS Avg_Sales,
    COUNT(*)               AS No_of_Items,
    ROUND(AVG(rating), 2)  AS Avg_Rating
FROM blinkit_data
GROUP BY outlet_type, item_fat_content
ORDER BY outlet_type, item_fat_content;



-- Chart 4: Sales by Outlet Establishment Year
-- Sawal: Purane outlets zyada bik rahe hain ya naye?

SELECT
    outlet_establishment_year,
    ROUND(SUM(sales), 0)   AS Total_Sales
FROM blinkit_data
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year;



-- Chart 5: Sales by Outlet Size
-- Sawal: Chhote, medium aur bade outlets ki sales me kitna farak hai?

SELECT
    outlet_size,
    ROUND(SUM(sales), 0) AS Total_Sales,
    ROUND(SUM(sales) * 100 / SUM(SUM(sales)) OVER(), 2) AS Sales_Percent
FROM blinkit_data
GROUP BY outlet_size
ORDER BY Total_Sales DESC;


-- Chart 6: Sales by Outlet Location
-- Sawal: Kaunsi city tier (Tier 1, 2, 3) se zyada sales aa rahi hai?

SELECT
    outlet_location_type,
    ROUND(SUM(sales), 0) AS Total_Sales
FROM blinkit_data
GROUP BY outlet_location_type
ORDER BY Total_Sales DESC;


-- Chart 7: All Metrics by Outlet Type
-- Sawal: Har outlet type ke liye chaaron KPIs ek saath.


SELECT
    outlet_type,
    ROUND(SUM(sales), 0)   AS Total_Sales,
    ROUND(AVG(sales), 2)   AS Avg_Sales,
    COUNT(*)               AS No_of_Items,
    ROUND(AVG(rating), 2)  AS Avg_Rating
FROM blinkit_data
GROUP BY outlet_type
ORDER BY Total_Sales DESC;

