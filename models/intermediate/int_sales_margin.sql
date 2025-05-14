select 
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_price,
    ROUND(s.quantity * p.purchase_price, 2) as purchase_cost,
    ROUND(s.revenue - s.quantity * p.purchase_price, 2) as margin,
    {{ margin_percent('s.revenue', 's.quantity * CAST(p.purchase_price AS FLOAT64)') }} as margin_percent
from {{ ref("stg_raw__sales") }} s
left join {{ ref("stg_raw__product") }} p
    using (products_id)
