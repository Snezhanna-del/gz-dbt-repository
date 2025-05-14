select 
    orders_id,
    date_date,
    round(sm.margin+sh.shipping_fee-sh.log_cost-sh.ship_cost,2) as operational_margin,
    revenue,
    quantity,
    purchase_cost,
    margin
from {{ref ("int_orders_margin")}} sm
left join {{ref ("stg_raw__ship")}} sh
using (orders_id)
ORDER BY orders_id DESC