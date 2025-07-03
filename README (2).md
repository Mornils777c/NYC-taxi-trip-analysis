# 🚕 NYC Taxi Trip Analysis — Advanced SQL Project

This project analyzes large-scale trip data from New York City's yellow taxi fleet using advanced SQL techniques. The dataset contains millions of trip records including pickup/drop-off locations, trip distance, fare, payment types, and timestamps.

## 📁 Dataset Source
- [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)
- Sample file used: `yellow_tripdata_2019-01.csv`
- Taxi Zone Lookup: [Download CSV](https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv)

## 🧰 Tools Used
- MySQL / PostgreSQL / BigQuery
- DBeaver / MySQL Workbench
- Git & GitHub

## 🧠 SQL Concepts Demonstrated
- Table creation, constraints, indexing
- Filtering, grouping, sorting
- String, date/time, arithmetic functions
- Joins (INNER, LEFT, FULL, CROSS)
- NULL handling & CASE statements
- Window functions & CTEs
- Data cleaning and transformation

## 📊 Business Questions Explored
- What are the most common pickup/dropoff locations?
- How long do trips last by time of day?
- What zones have the most traffic?
- What is the average fare/tip by payment type?
- Are there patterns based on hour, day, or zone?

## 📂 Project Structure

```
nyc-taxi-sql-project/
├── data/
│   ├── yellow_tripdata_2019-01.csv        # Sample trip data (not included)
│   └── taxi_zone_lookup.csv               # Lookup table for zones
├── schema/
│   └── create_tables.sql                  # DDL for trip and zone tables
├── queries/
│   └── 25_sql_queries.sql                 # Full list of SQL analysis queries
├── images/
│   └── schema_diagram.png                 # ERD / schema overview (optional)
├── README.md                              # Project overview and documentation
```

## ✅ How to Use
1. Import the CSV files into your database.
2. Run the DDL script in `/schema/create_tables.sql` to create tables.
3. Run the analysis in `/queries/25_sql_queries.sql` to explore insights.

---
📌 _This project is intended as a professional SQL portfolio sample, ideal for showcasing business intelligence and data analysis skills to employers._