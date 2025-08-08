USE [pizza DB];
select * from [Pizza_sales ];

select sum(total_price) AS TOTAL_REVENUE
from [Pizza_sales ];


SELECT sum(total_price)
/count(distinct(order_id)) AS AVERAGE_ORDER_VALUE
from [Pizza_sales ];


SELECT SUM(quantity) AS TOTAL_PIZZA_SOLD 
FROM [Pizza_sales ];


SELECT COUNT(DISTINCT(order_id)) AS TOTAL_ORDER
FROM [Pizza_sales ];


SELECT CAST( CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))AS DECIMAL(10,2)) AS avg_pizza_per_order
from  [Pizza_sales ];



/*CHARTS*/
 

--daily trend
SELECT DATENAME(DW,order_date) as order_day,COUNT(DISTINCT order_id) as total_orders
from [Pizza_sales ]
group by DATENAME(DW,order_date)


--hourly trend
SELECT DATEPART(HOUR, order_time) as order_hours , COUNT(DISTINCT order_id) as total_orders
from [Pizza_sales ]
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)


--percent trend

SELECT pizza_category, SUM(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from [Pizza_sales ]) as PERCENTAGE_TOTAL_SALES
FROM [Pizza_sales ] 
group by pizza_category;




SELECT pizza_size, SUM(total_price) as total_sales,CAST(sum(total_price)*100/
(select sum(total_price) from [Pizza_sales ]AS DECIMAL(10,2) as PERCENTAGE_TOTAL_SALES
FROM [Pizza_sales ] 
group by pizza_size
order by PERCENTAGE_TOTAL_SALES desc;



select * from [Pizza_sales ] where quantity = 3;

select pizza_category,cast(sum(total_price) * 100 / (select sum(total_price) from [Pizza_sales ]) as decimal (10,2))as Catagory_wise_sales_percent from [Pizza_sales ] group by pizza_category;

--pizza size
select pizza_size,cast(sum(total_price) * 100 / (select sum(total_price) from [Pizza_sales ]) as decimal (10,2))as SIZE_wise_sales_percent from [Pizza_sales ] group by pizza_size order by pizza_size desc;

--total pizza sold by pizza category
select sum(quantity) as number_of_pizza,pizza_category from [Pizza_sales ] group by pizza_category;

--5 best sellers by total pizzas sol
select top 5 sum(quantity) as total_pizza,pizza_name from [Pizza_sales ] group by pizza_name order by total_pizza desc;


--5 worst sellers by total pizzas sol
select top 5 sum(quantity) as total_pizza,pizza_name from [Pizza_sales ] group by pizza_name order by total_pizza ;


select * from [Pizza_sales ];


