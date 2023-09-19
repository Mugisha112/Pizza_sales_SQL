/*Total Revenue:*/
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

/*Average Order Value*/
SELECT 
    (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM
    pizza_sales

/*Total Pizzas Sold */
SELECT 
    SUM(quantity) AS Total_pizza_sold
FROM
    pizza_sales

/*Total Orders*/ 
SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales

/*Average Pizzas Per Order*/
SELECT 
    CAST(CAST(SUM(quantity) AS DECIMAL (10 , 2 )) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10 , 2 ))
        AS DECIMAL (10 , 2 )) AS Avg_Pizzas_per_order
FROM
    pizza_sales
    
/*Daily Trend for Total Orders*/
SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY DAYNAME(order_date)

/*Hourly Trend for Orders*/
SELECT 
    HOUR(order_time) AS Hour_24,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY HOUR(order_time)

/*% of Sales by Pizza Category*/
SELECT 
    pizza_category,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT 
                SUM(total_price)
            FROM
                pizza_sales)
        AS DECIMAL (10 , 2 )) AS PCT
FROM
    pizza_sales
GROUP BY pizza_category

/*% of Sales by Pizza Size*/
SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT 
                SUM(total_price)
            FROM
                pizza_sales)
        AS DECIMAL (10 , 2 )) AS PCT
FROM
    pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

/*Total Pizzas Sold by Pizza Category*/
SELECT 
    pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM
    pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

/*Top 5 Pizzas by Revenue*/
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

7. Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
