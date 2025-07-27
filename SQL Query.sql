CREATE Database Projects

SELECT* FROM menu_items
SELECT* FROM order_details
GO


--- Exploring menu_items table

-- 1. View the menu_item table---
 
 SELECT * FROM menu_items

 --updated price column to 2 2 decimal

 UPDATE menu_items
SET price = ROUND(price, 2);


--2. Find the number of items on the menu --

SELECT COUNT(*) FROM menu_items

--3. What the least and most expensive item on the menu --

SELECT * FROM menu_items
ORDER BY price DESC;

 -- Select only min and max price--
 SELECT* FROM menu_items
 WHERE price = (SELECT MIN(price) FROM menu_items)

 UNION ALL

 SELECT* FROM menu_items
 WHERE price = (SELECT Max(price) FROM menu_items)
 
 ORDER BY Price DESC;


 --- How many italian dishes are on the menu ?

 SELECT * FROM menu_items
 WHERE category = 'Italian'

 --- what are the least and most expensive Italian dishes on menu?

 SELECT * FROM menu_items
  WHERE category = 'Italian'
 ORDER BY price DESC

 
 --- how many dishes in each category?

 SELECT category, count(menu_item_id) as dishes_count FROM menu_items
 GROUP BY category

 ---What is the average dish price of each category?
 
 SELECT category, count(menu_item_id) as dishes_count ,round(AVG(price),2) as Average_Dish_Price FROM menu_items
 GROUP BY category

 -----------Order_details Table----------

 --view the order_details table

 SELECT * FROM order_details;
 
 -- Change column to TIME(0)
 ALTER TABLE order_details
ALTER COLUMN Order_time TIME(0);

--what is the date range of the table--

SELECT MIN(order_date) as mindate,MAX(order_date) as maxdate FROM order_details

---how many orders made within this date range--

SELECT COUNT( DISTINCT order_id) FROM order_details

--	how many items were ordered within this date range

SELECT COUNT(  item_id) FROM order_details

--- which order have most number of items

SELECT  order_id, count(item_id) as num_items FROM order_details

GROUP BY order_id
ORDER BY num_items DESC;

-- how many order have more than 12 items


SELECT COUNT(*) FROM
(SELECT  order_id, count(item_id) as num_items FROM order_details

GROUP BY order_id
HAVING COUNT(item_id) >12) as num_items


---Both Tables Analysis------

--combine both tables into single table

SELECT * FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id

--- What are the least and most ordered items? What category are they in?


SELECT item_name,category, COUNT(order_details_id) as num_purchase FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id

GROUP BY item_name,category
ORDER BY num_purchase DESC;



--- what were the top 5 orders that spent the most money ?

SELECT TOP 5 order_id, sum(price) as total_spend FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id

GROUP BY order_id
ORDER BY total_spend DESC;


--- view the details of highest spend order.
 

 SELECT *  FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
WHERE order_id =440

--- view the how many items are ordered from each category

 SELECT category, count(item_id) as num_items  FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
WHERE order_id =440
Group by category

--- view the detail of top 5 spend orders
 SELECT order_id, category, count(item_id) as num_items  FROM Menu_items m
RIGHT JOIN
order_details o
ON
m.menu_item_id =o.item_id
WHERE order_id IN (440,2075,1957,330,2675)
Group by category,order_id



--- output--

-- we should keep these expensive Italian dishes on our menu because people are ordering them














 










