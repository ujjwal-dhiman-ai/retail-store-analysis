select * from cleaned_orders limit 100

alter table cleaned_orders 
drop column id

--find top 10 highest reveue generating products

select product_id, round(sum(quantity*sale_price)::int, 2) as revenue
from cleaned_orders
group by product_id
order by revenue desc
limit 10

--find top 5 highest selling products in each region

with cte as (
	select 
		region,
		product_id,
		total_price,
		dense_rank() over(partition by region order by total_price desc) as drk
	from 
		(
		select region, product_id, sum(sale_price) as total_price
		from cleaned_orders
		group by region, product_id
	)
)

select * 
from cte
where drk <=5

--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023

with cte as (
	select extract(year from order_date) as order_year, extract(month from order_date) as order_month, round(sum(sale_price)::int,2) as sales
	from cleaned_orders
	group by extract(year from order_date), extract(month from order_date)
)

select 
	order_month,
	sum(case when order_year=2022 then sales else 0 end) as sales_2022,
	sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte
group by order_month
order by order_month

--for each category which month had highest sales

with cte as (
	select 
		category, 
		extract(month from order_date) as order_month, 
		extract(year from order_date) as order_year, 
		sum(sale_price) as sales,
		row_number() over(partition by category order by sum(sale_price) desc) as rn
	from cleaned_orders
	group by category, extract(month from order_date), extract(year from order_date)
)
select category, order_month, order_year
from cte
where rn = 1

--which sub category had highest growth by profit in 2023 compare to 2022







