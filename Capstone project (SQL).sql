use mydb;

SHOW COLUMNS FROM hotelbooking;

SHOW COLUMNS FROM cleaned_hotelbooking;


#PROBLEM STATEMENT 5 - 

-- query that counts the number of visitors by month & year
select arrival_date_year,arrival_date_month,count(total_visitors) as total_visitors from hotelbooking
group by arrival_date_year,arrival_date_month
order by arrival_date_year,arrival_date_month;

-- creating a copy
create table hotelbooking_copy as 
select arrival_date_year,arrival_date_month,count(total_visitors) as total_visitors from hotelbooking
group by arrival_date_year,arrival_date_month
order by arrival_date_year,arrival_date_month;

-- deleting the columns
alter table hotelbooking
drop column arrival_date_year;
alter table hotelbooking
drop column arrival_date_month;



#PROBLEM STATEMENT 13

SELECT

    -- Guest Demographics
    guest_age_group,
    country AS guest_country,
    
    -- Booking Behaviors
    booking_channel,
    market_segment,
    lead_time - stays_in_weekend_nights - stays_in_week_nights AS booking_duration,
    
    -- Cancellation Analysis
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS total_cancellations,
    
    -- Revenue Analysis
    SUM(room_rate_per_night) AS total_revenue
FROM
    hotelbooking
GROUP BY
    guest_age_group, country, booking_channel, market_segment, booking_duration;

