-- Create yellow taxi trip table
CREATE TABLE yellow_tripdata (
  vendor_id VARCHAR(10),
  tpep_pickup_datetime DATETIME,
  tpep_dropoff_datetime DATETIME,
  passenger_count INT,
  trip_distance FLOAT,
  ratecode_id INT,
  store_and_fwd_flag VARCHAR(2),
  pu_location_id INT,
  do_location_id INT,
  payment_type INT,
  fare_amount FLOAT,
  extra FLOAT,
  mta_tax FLOAT,
  tip_amount FLOAT,
  tolls_amount FLOAT,
  improvement_surcharge FLOAT,
  total_amount FLOAT,
  congestion_surcharge FLOAT
);

-- Create taxi zone lookup table
CREATE TABLE taxi_zone_lookup (
  location_id INT PRIMARY KEY,
  borough VARCHAR(50),
  zone VARCHAR(100),
  service_zone VARCHAR(50)
);