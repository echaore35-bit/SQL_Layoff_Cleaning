-- See if table exists and check schema 

SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'layoff_data_staging';

-- Count rows if the count is the same on file
SELECT COUNT(*) 
FROM layoff_data_staging;

-- See first 10 rows of the data to see the column headers and first fewm data
SELECT TOP 10 *
FROM layoff_data_staging;

-- Check Duplicates and build cte 

CREATE OR ALTER VIEW vw_layoff_data_cleaned AS
WITH duplicate_cte AS
(
    SELECT *, 
        ROW_NUMBER() OVER(
            PARTITION BY company, [location], industry, total_laid_off, [date], stage, country, funds_raised_millions
            ORDER BY company
        ) AS rn
    FROM layoff_data_staging
),

-- TRIM the text columns but keep all other columns
trim_cte AS
(
    SELECT
        TRIM(company) AS company,
        TRIM([location]) AS [location],
        TRIM(industry) AS industry,
        total_laid_off,
        percentage_laid_off,
        [date],
        TRIM(stage) AS stage,
        TRIM(country) AS country,
        funds_raised_millions,
        rn
    FROM duplicate_cte
),

-- Check all minor changes in all columns, nulls,convert data types and standardized it
standardized_industry_cte AS
(
    SELECT
        company,
        [location],
        CASE 
            WHEN industry LIKE 'Crypto%' THEN 'Crypto'
            WHEN industry LIKE 'Fin-Tech%' THEN 'Finance'
            WHEN industry LIKE 'HR%' THEN 'Human Resources'
            ELSE industry
        END AS industry,
        TRY_CAST(NULLIF(total_laid_off, 'NULL') AS INT) AS total_laid_off,
        TRY_CAST(NULLIF(percentage_laid_off, 'NULL') AS FLOAT) AS percentage_laid_off,
        TRY_CAST([date] AS DATE) AS [date],
        stage,
        REPLACE(country,'.','') AS country,
        TRY_CAST(NULLIF(funds_raised_millions, 'NULL') AS INT) AS funds_raised_millions, 
        rn
    FROM trim_cte
),
-- Final Ouput | use rn = 1 so that duplicates are filtered
final_data AS(
    SELECT *
    FROM standardized_industry_cte
    WHERE rn = 1
)

SELECT * 
FROM final_data



