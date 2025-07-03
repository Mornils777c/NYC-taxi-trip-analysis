-- 25 SQL Analysis Queries on NYC Yellow Taxi Data

-- 1. Basic record count
SELECT COUNT(*) FROM yellow_tripdata;

-- 2. Sample trip record
SELECT * FROM yellow_tripdata LIMIT 5;

-- 3. Total trips per day
SELECT DATE(tpep_pickup_datetime) AS trip_date, COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY trip_date
ORDER BY trip_date;

-- 4. Average trip duration in minutes
SELECT AVG(TIMESTAMPDIFF(MINUTE, tpep_pickup_datetime, tpep_dropoff_datetime)) AS avg_duration
FROM yellow_tripdata;

-- 5. Most common pickup location IDs
SELECT pu_location_id, COUNT(*) AS pickups
FROM yellow_tripdata
GROUP BY pu_location_id
ORDER BY pickups DESC
LIMIT 10;

-- 6. Most common drop-off location IDs
SELECT do_location_id, COUNT(*) AS dropoffs
FROM yellow_tripdata
GROUP BY do_location_id
ORDER BY dropoffs DESC
LIMIT 10;

-- 7. Total fare by payment type
SELECT payment_type, SUM(fare_amount) AS total_fare
FROM yellow_tripdata
GROUP BY payment_type;

-- 8. Replacing null passenger counts with 1
UPDATE yellow_tripdata
SET passenger_count = 1
WHERE passenger_count IS NULL;

-- 9. Categorize trip distance
SELECT trip_distance,
  CASE 
    WHEN trip_distance < 1 THEN 'Short'
    WHEN trip_distance BETWEEN 1 AND 5 THEN 'Medium'
    ELSE 'Long'
  END AS trip_category
FROM yellow_tripdata;

-- 10. Join with taxi zone lookup to get pickup zones
SELECT yt.*, z.zone AS pickup_zone
FROM yellow_tripdata yt
LEFT JOIN taxi_zone_lookup z ON yt.pu_location_id = z.location_id;

-- 11. Trips by hour of day
SELECT HOUR(tpep_pickup_datetime) AS hour, COUNT(*) AS trip_count
FROM yellow_tripdata
GROUP BY hour
ORDER BY hour;

-- 12. Total revenue per day
SELECT DATE(tpep_pickup_datetime) AS day, SUM(total_amount) AS revenue
FROM yellow_tripdata
GROUP BY day
ORDER BY day;

-- 13. Tip percentage
SELECT tip_amount, fare_amount,
  ROUND(100 * tip_amount / fare_amount, 2) AS tip_pct
FROM yellow_tripdata
WHERE fare_amount > 0;

-- 14. Null zone check (join fails)
SELECT COUNT(*) AS unknown_zones
FROM yellow_tripdata yt
LEFT JOIN taxi_zone_lookup z ON yt.do_location_id = z.location_id
WHERE z.zone IS NULL;

-- 15. Average fare by passenger count
SELECT passenger_count, ROUND(AVG(fare_amount), 2) AS avg_fare
FROM yellow_tripdata
GROUP BY passenger_count;

-- 16. Ranking days by revenue
SELECT trip_date, revenue,
  RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM (
  SELECT DATE(tpep_pickup_datetime) AS trip_date, SUM(total_amount) AS revenue
  FROM yellow_tripdata
  GROUP BY trip_date
) AS sub;

-- 17. Daily tip trends
SELECT DATE(tpep_pickup_datetime) AS trip_date, SUM(tip_amount) AS total_tip
FROM yellow_tripdata
GROUP BY trip_date
ORDER BY trip_date;

-- 18. Trips by weekday
SELECT DAYNAME(tpep_pickup_datetime) AS day, COUNT(*) AS trip_count
FROM yellow_tripdata
GROUP BY day;

-- 19. Trips with zero passengers
SELECT COUNT(*) FROM yellow_tripdata WHERE passenger_count = 0;

-- 20. Add a new column (only if schema allows)
-- ALTER TABLE yellow_tripdata ADD COLUMN trip_duration_mins FLOAT;

-- 21. Most expensive trips
SELECT * FROM yellow_tripdata ORDER BY total_amount DESC LIMIT 5;

-- 22. Median fare per location (if supported)
-- (Alternative in BigQuery/PostgreSQL)
-- SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY fare_amount) AS median_fare

-- 23. Trips with same pickup and drop-off locations
SELECT COUNT(*) FROM yellow_tripdata WHERE pu_location_id = do_location_id;

-- 24. Delete rows with negative fare (if exists)
-- DELETE FROM yellow_tripdata WHERE fare_amount < 0;

-- 25. Total tip by payment type
SELECT payment_type, SUM(tip_amount) AS total_tip
FROM yellow_tripdata
GROUP BY payment_type;