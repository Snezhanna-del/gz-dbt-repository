select 
    date_date,
    count(orders_id) as nb_transactions,
    round(sum(revenue),2) as total_revenue,
    round(round(sum(revenue),2)/count(orders_id),2) as average_basket,
    round(sum(operational_margin),2) as operational_margin,
    round(sum(purchase_cost),2) as total_purchase_cost,
    round(sum(shipping_fee),2) as total_shipping_fees,
    round(sum(log_cost),2) as total_log_costs,
    round(sum(quantity),2) as total_quantity_sold
from {{ref ("int_orders_operational")}} sm
group by date_date
ORDER BY date_date DESC