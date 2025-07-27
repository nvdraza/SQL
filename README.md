

# Assignment:
The Taste of the World cafe debuted a new menu at the start of the year.  You have been asked to dig into the customer's data to see which menu items are doing well/not well and what the
top customers seem to like the best

# Objective 1 :
Explore the menu_items table to get an idea of what's on the new menu

# Exploring menu_items table

-- 1. View the menu_item table
 
***SELECT * 
FROM menu_items***

 -- updated price column to  2 decimal

 ***UPDATE menu_items
SET price = ROUND(price, 2);***


-- 2. Find the number of items on the menu

***SELECT COUNT(*) 
FROM menu_items***

-- 3. What are the least and most expensive items on the menu

***SELECT * 
FROM menu_items
ORDER BY price DESC;***

 -- 4. Select only the min and max price
 
 ***SELECT* 
 FROM menu_items
 WHERE price = (SELECT MIN(price) FROM menu_items)
 UNION ALL
SELECT* 
FROM menu_items
WHERE price = (SELECT Max(price) FROM menu_items)
 ORDER BY Price DESC;***
 
 -- 5. How many Italian dishes are on the menu?

 ***SELECT * 
 FROM menu_items
 WHERE category = 'Italian'***

 --6. What are the least and most expensive Italian dishes on the menu?

***SELECT * 
FROM menu_items
  WHERE category = 'Italian'
 ORDER BY price DESC***

 --7. How many dishes are in each category?

 ***SELECT category, count(menu_item_id) as dishes_count 
 FROM menu_items
 GROUP BY category***

 --8. What is the average dish price of each category?

***SELECT category, count(menu_item_id) as dishes_count ,round(AVG(price),2) as Average_Dish_Price 
FROM menu_items
 GROUP BY category***

 # Objective 2
 Explore the Order_details Table and get an idea of what's in this table, and answer the following questions 

# Exploring Order_details table

--1. View the order_details table

***SELECT * 
FROM order_details;***
 
  --Change column to TIME(0)
  
 ***ALTER TABLE order_details
ALTER COLUMN Order_time TIME(0);***

--2. What is the date range of the table

***SELECT MIN(order_date) as mindate,MAX(order_date) as maxdate 
FROM order_details***

--3. How many orders were made within this date range

***SELECT COUNT( DISTINCT order_id) 
FROM order_details***

--4.	How many items were ordered within this date range

***SELECT COUNT(  item_id) 
FROM order_details***

--5. Which order has the most items

***SELECT  order_id, count(item_id) as num_items 
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;***

-- 6. How many orders have more than 12 items

***SELECT COUNT(*) FROM
(SELECT  order_id, count(item_id) as num_items FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) >12) as num_items***


# Objective 3:
Combine menu_items and order_details into a single table 

--1. Combine both tables into a single table

***SELECT * 
FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id***

-- 2. What are the least and most ordered items? What category are they in?

***SELECT item_name,category, COUNT(order_details_id) as num_purchase 
FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
GROUP BY item_name,category
ORDER BY num_purchase DESC;***

--3. What were the top 5 orders that spent the most money?

***SELECT TOP 5 order_id, sum(price) as total_spend 
FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
GROUP BY order_id
ORDER BY total_spend DESC;***


--4. View the details of the highest spending order.
 
 ***SELECT *  FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
WHERE order_id =440***

--5. View how many items are ordered from each category

***SELECT category, count(item_id) as num_items
FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
WHERE order_id =440
Group by category***

--6. View the details of the  top 5 spend orders
***SELECT order_id, category, count(item_id) as num_items
FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
WHERE order_id IN (440,2075,1957,330,2675)
Group by category,order_id***

# Output
 We should keep these expensive Italian dishes on our menu because people are ordering them. 
