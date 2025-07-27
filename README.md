

# Assignment:
The Taste of the World cafe debuted a new menu at the start of the year.  You have been asked to dig into the customer's data to see which menu items are doing well/not well and what the
top customers seem to like the best

# Objective 1 :
1. Explore the menu_items table to get an idea of what's on the new menu

--- Exploring menu_items table---

-- 1. View the menu_item table
 
***SELECT * FROM menu_items***

 -- updated price column to  2 decimal

 ***UPDATE menu_items
SET price = ROUND(price, 2);***


-- 2. Find the number of items on the menu

***SELECT COUNT(*) FROM menu_items***

-- 3. What are the least and most expensive items on the menu

***SELECT * FROM menu_items
ORDER BY price DESC;***

 -- 4. Select only the min and max price
 
 ***SELECT* FROM menu_items
 WHERE price = (SELECT MIN(price) FROM menu_items)
 UNION ALL
SELECT* FROM menu_items
WHERE price = (SELECT Max(price) FROM menu_items)
 ORDER BY Price DESC;***
 
 -- 5. How many Italian dishes are on the menu?

 ***SELECT * FROM menu_items
 WHERE category = 'Italian'***

 --6. What are the least and most expensive Italian dishes on the menu?

***SELECT * FROM menu_items
  WHERE category = 'Italian'
 ORDER BY price DESC***

 --7. How many dishes are in each category?

 ***SELECT category, count(menu_item_id) as dishes_count FROM menu_items
 GROUP BY category***

 --8. What is the average dish price of each category?
 
***SELECT category, count(menu_item_id) as dishes_count ,round(AVG(price),2) as Average_Dish_Price FROM menu_items
 GROUP BY category***











03444418494
2. Explore the order_details table to get an idea of the data that has been collected
3. Use both tables to understand how customers are reacting to the new menu
4. 
   
