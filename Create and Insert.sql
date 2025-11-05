/* This script creates tables , dropping existing tables 
    if they already exist. */
IF OBJECT_ID('layoff_data', 'U') IS NOT NULL
     DROP TABLE layoff_data
GO

-- Create staging data for the uncleaned data
CREATE TABLE layoff_data
(
company	NVARCHAR(50),
location NVARCHAR(50),	
industry NVARCHAR(50),
total_laid_off	NVARCHAR(25),
percentage_laid_off	NVARCHAR(25),
[date] VARCHAR(50),	
stage NVARCHAR(50),	
country	NVARCHAR(50),
funds_raised_millions NVARCHAR(25)
)

-- INSERT CSV File using Bulk Insert
BULK INSERT layoff_data
FROM 'C:\Projects\cleaning_data\layoffs.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
