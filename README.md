Data Cleaning Project: Global Layoffs Dataset (SQL Server)
Project Overview
Raw datasets in the real world are rarely clean. They contain duplicates, inconsistent formatting, missing values, and incorrect data types. This project demonstrates my ability to take a raw, messy dataset (Global Layoffs Data) and transform it into a clean, analysis-ready database using advanced SQL Server techniques.

Key Data Cleaning Operations
1. Removing Duplicates
Since the raw data did not have a primary key, I identified duplicates using Common Table Expressions (CTEs) and the ROW_NUMBER() window function, partitioning by all relevant columns.

Created a staging table (layoffs4) to safely store the row numbers.
Deleted records where the row number was greater than 1.
2. Standardizing Data
Inconsistent text formatting can ruin data aggregation. I performed the following standardizations:

Industry: Standardized variations of the crypto industry (e.g., "Crypto Currency", "CryptoFinance") to a unified "Crypto" using LIKE and UPDATE.
Country: Fixed inconsistencies like "United States." (with a dot) to "United States".
Text Trimming: Checked and ensured no leading/trailing spaces existed in company names using LEN() and TRIM() comparisons.
3. Handling Missing Values (Nulls)
Instead of blindly dropping rows with NULL values in the industry column, I used a Self-Join on the table.

I populated the missing industry for specific companies (like 'Carvana') by finding other records in the same table where the company name matched and the industry was not null.
4. Data Type Conversion
The date column was originally imported as a string (nvarchar).

Used TRY_CAST() to safely convert the string dates into proper DATE data types.
Altered the table schema to permanently change the column type to DATE for future time-series analysis.
Tools Used
SQL Server (T-SQL)
Techniques: CTEs, Window Functions (ROW_NUMBER), Self-Joins, TRY_CAST, ALTER TABLE, Transactions (Begin Tran/Commit)
