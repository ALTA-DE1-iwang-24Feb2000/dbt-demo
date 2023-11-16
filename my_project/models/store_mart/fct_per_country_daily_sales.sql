select 
country,
order_date,
sum(quantity) as total_quantity,
sum(price) as total_revenue

from  {{ref ('stg_order_details') }}
group by 1,2