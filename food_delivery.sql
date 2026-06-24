-- loading cleaned csv into table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/food_delivery_cleaned.csv'
INTO TABLE food_delivery_db.food_delivery_cleaned2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_date, order_time, customer_id, area, food_item, quantity, unit_price,
 item_total, distance_km, coupon_code, discount_amount, delivery_fee, final_amount,
 delivery_time_min, order_type, payment_method, delivery_partner_id, is_refunded,
 refund_reason, @rating)
SET rating = NULLIF(@rating, '');

select count(*) from food_delivery_db.food_delivery_cleaned2;


-- q1: distance vs delivery time and order value
select
    case
        when distance_km < 2 then '0-2'
        when distance_km < 5 then '2-5'
        when distance_km < 8 then '5-8'
        when distance_km < 12 then '8-12'
        else '12+'
    end as distance_bucket,
    avg(delivery_time_min) as avg_delivery_time,
    avg(final_amount) as avg_final_amount
from food_delivery_cleaned2
group by distance_bucket
order by min(distance_km);


-- q2: discount % by food item
select food_item, sum(discount_amount), count(order_id),
avg((discount_amount/item_total)*100) as discount
from food_delivery_cleaned2
group by food_item
order by discount desc;


-- q3: refund rate by order type
select order_type,
       sum(case when is_refunded = 'True' then 1 else 0 end) * 100.0 / count(*) as refund_rate
from food_delivery_cleaned2
group by order_type;


-- q4: day vs night orders by area
select area,
       sum(case when order_time between '06:00' and '18:00' then 1 else 0 end) as daytime,
       sum(case when order_time not between '06:00' and '18:00' then 1 else 0 end) as nighttime
from food_delivery_cleaned2
group by area;


-- q5: delivery time vs rating
select timing, avg(rating) from (
    select *, case when delivery_time_min < 20 then '0-19'
			 when delivery_time_min < 35 then '20-34'
             when delivery_time_min < 50 then '35-49'
             else '50+' end as timing 
    from food_delivery_cleaned2
) t
group by timing;