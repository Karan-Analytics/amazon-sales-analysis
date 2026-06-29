use amazon_sales ;
#basic questions 
 #1.Total orders 
select count(*) as total_orders from amazon;
 #2.Total revenue
select sum(Amount) as total_revenue from amazon ;

 #3.Total quentity sold
select sum(Qty) as total_quentity from amazon ;

 #4.orders by status
select Status ,count(*) as total_order from amazon group by status;

 #5.revenue by category
select Category , sum(amount) as total_revenue from amazon group by Category ;

 #6. quentity sold by category 
select Category ,sum(Qty) as total_Quentity_sold_by_each_Category from amazon group by Category ;
 
 #7.top 10 cities by revenue 
select ship_city,sum(amount) as total_revenue from amazon group by ship_city order by total_revenue desc limit 10;
 
#8.top 10 categories by revenue 
select Category ,sum(Amount) as total_revenue from amazon group by Category order by total_revenue desc limit 10;

#9 orders by sales channel 
select sales_channel, count(order_id) as total_orders from amazon  group by sales_channel;

#10. revenue by fullfilment
select Fulfilment , sum(amount) as total_revenue from amazon group by Fulfilment;
 
 #11.orders by courier status 
 select courier_status , count(*) as total_orders from amazon group by courier_status;
 
#12 top 10 highest revenue orders 
select order_id , amount from amazon order by amount desc limit 10;

#13.top 10 cities by number of orders 
select ship_city , count(order_id) as total_orders from amazon group by ship_city order by total_orders desc limit 10;

#14. average revenue by category 
select Category , avg(amount) as avg_revenue from amazon group by Category order by avg_revenue desc;

#15.top 5 categories by quentity sold 
 select Category , sum(qty) as total_qty from amazon group by Category order by total_qty desc limit 5;
 
#16
select B2B,count(*) as total_orders from amazon group by B2B;

#17 . revenue by ship service level 
select ship_service_level, sum(amount) as total_amount from amazon group by ship_service_level ;

#18 revenue by size 
 select Size , sum(amount) as total_revenue from amazon group by Size order by total_revenue desc ;

#19. average quentity per category 
select Category , round(avg(qty),2) as avg_qty from amazon group by Category ; 
				
#20 orders with revenue greater than 1000
select order_id ,amount from amazon where amount > 1000;

#21 delivered orders only 
select * from amazon where Status = "Shipped";

#22. categories having revenue greater than 10,00,000
select Category , sum(amount) as total_amount from amazon group by Category having sum(amount)>1000000;


#23.high value vs low value orders 
select order_id ,amount, case when amount >= 1000 then 'high value'
else 'low value'end as order_type from amazon ;

#24. revenue by order type 
select case when amount >=1000 then 'high value' else 'low value' end as order_type ,sum(amount) as total_revenue from amazon group by order_type ;

#25 rank categories by revenue 
select Category ,sum(amount) as total_revenue ,rank() over (order by sum(amount)desc) as revenue_rank from amazon group by category ;

#26 
select category , sum(amount) as total_revenue , dense_rank() over (order by sum(amount)desc)as revenue_rank from amazon group by category ;

#27 
select order_id ,amount, row_number() over (order by amount desc ) as row_num from amazon ;

#28 
with revenue_cte as (select Category, sum(amount)as total_revenue from amazon group by Category ) select * from revenue_cte where total_revenue >1000000;

#30 
select * from amazon where amount>(select avg(amount)from amazon );

