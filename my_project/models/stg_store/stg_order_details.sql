select
    orders.order_date,
    order_details.quantity,
    products.name as product_name,
    brand.name as brand_name,
    order_details.price
from 
    {{ source('store', 'orders') }} as orders
left join 
    {{ source('store', 'order_details') }} as order_details
    on 
        orders.order_id = order_details.order_id
left join 
    {{ source('store', 'products') }} as products
    on 
        order_details.product_id = products.product_id
left join 
    {{ source('store', 'brands') }} as brand
    on 
        products.brand_id = brand.brand_id
