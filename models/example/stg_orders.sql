-- Use the `ref` function to select from other models-

SELECT
    o.ID as O_ID,
    c.ID,
    c.Customer_Name,
    o.user_id,
    o.Order_Date,
    o.status,
    o._etl_loaded_at,
        p.paymentmethod as payment_method,
    p.status as payment_status,
    p.amount,
    p.created,
    p.orderid as order_id,
    p._batched_at
   
FROM
    dbt-tutorial.jaffle_shop.orders o
JOIN
    {{ ref("stg_customers") }} c ON o.ID = c.ID

    JOIN
    dbt-tutorial.stripe.payment p ON p.id= o.id
