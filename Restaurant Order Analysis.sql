USE restaurant_db;


-- Q1. View the menu_items table:
SELECT * FROM menu_items;



-- Q2. Write a query to find the number of items on the menu:
SELECT count(*) 
as number_items 
from menu_items;



-- Q3. Find the least expensive item on the menu:
select item_name, price 
from menu_items 
order by price
asc limit 1;



-- Q3. Find the most expensive item on the menu:
select item_name, price 
from menu_items 
order by price
desc limit 1;



-- Q4. Find the number of Italian dishes on the menu:
select count(*) as Italian_Dishes_Count 
from menu_items 
where category= 'Italian';



-- Q5. find the least expensive Italian dish on the menu:
select item_name, category, price
from menu_items 
where category= 'Italian'
order by price asc limit 1;



-- Q6. find the most expensive Italian dish on the menu:
select item_name, category, price
from menu_items 
where category= 'Italian'
order by price desc limit 1;



-- Q7. count the number of dishes in each category:
select category, count(*) as dish_count
from menu_items
group by category;



-- Q8. count the number of dishes in each category:
select category, avg(price) as avg_price
from menu_items
group by category;


-- Q9. View the order_details table.
select * from order_details;


-- Q10. What is the date range of the table?
select min(order_date),max(order_date)
 from order_details;


-- Q11. How many orders were made within this date range?
select count(distinct order_id)
 from order_details;


-- Q12. How many items were ordered within this date range?
select count(*) from order_details;


-- Q13. Which orders had the most number of items?
select order_id, count(item_id) as num_items
 from order_details 
group by order_id
order by num_items desc;


-- Q14. How many orders had more than 12 items?
select count(*) from
(select order_id, count(item_id) as num_items
 from order_details 
group by order_id
having num_items > 12) as num_orders;


-- Q15. Combine the menu_items and order_details tables into a single table
select* from menu_items;
select* from order_details;

select* from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id;


-- Q16. What were the least and most ordered items? What categories were they in?
select item_name, category, count(order_details_id) as num_purchases
 from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases desc;


-- Q17. What were the top 5 orders that spent the most money?
select order_id, sum(price) as total_spend
 from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;


-- Q18. View the details of the highest spend order. Which specific items were purchased?
select category, count(item_id) as num_items
 from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category;



-- Q19. View the details of the top 5 highest spend orders
select order_id, category, count(item_id) as num_items
 from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440, 2075, 1957, 330,2675)
group by category,order_id;
