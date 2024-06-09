## Retail Store Analysis ETL Pipeline

1. **Project Overview:**
   - The project involves using Python and SQL to perform an end-to-end data analytics task.
   - It includes downloading a dataset from Kaggle, cleaning and processing the data in pandas, and then loading it into a SQL server.
   - A series of SQL queries are designed to analyze the data.

2. **Data Preparation:**
   - The data is downloaded from Kaggle using the Kaggle API.
   - The dataset is then loaded into pandas for cleaning and processing, including handling null values, renaming columns, and creating new columns such as discount and sale price.
   - The order date column is converted from an object to a date type.

3. **Data Loading and SQL Operations:**
   - The cleaned data is loaded into an PostgreSQL using psycopg2.
   - Specific data types are assigned to columns to optimize memory usage.
   - The project includes dropping unnecessary columns before loading the data into the SQL server.

4. **SQL Queries for Analysis:**
   - Various SQL queries are run to analyze the data, including calculating total sales by product and region.
   - The project also involves finding top-selling products and analyzing sales growth over time.
   - Complex queries are executed to extract insights such as the highest growth subcategories.
