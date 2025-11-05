/*-----------------------------------------
	Data Reporting
*/-----------------------------------------

-- 1.Total layoffs per company
SELECT TOP 10 company, sum(total_laid_off) AS total_laidoff_company
FROM vw_layoff_data_cleaned
GROUP BY company 
ORDER BY total_laid_off DESC

-- 2.Total layoffs per industry
SELECT TOP 10 industry, sum(total_laid_off) AS total_laidoff_industry
FROM vw_layoff_data_cleaned
GROUP BY industry
ORDER BY total_laidoff_industry DESC

-- 3.Top 5 countries with the highest layoffs
SELECT TOP 5 country, sum(total_laid_off) AS total_laidoff_country
FROM vw_layoff_data_cleaned
GROUP BY country
ORDER BY total_laidoff_country DESC

-- 4.Year with the most layoffs
SELECT YEAR(date) AS year_layoff, sum(total_laid_off) AS total_laidoff_year
FROM vw_layoff_data_cleaned
WHERE [date] IS NOT NULL
GROUP BY YEAR(date)
ORDER BY total_laidoff_year DESC


-- 5.Company with the highest single layoff event
SELECT TOP 1 company, total_laid_off, [date], country
FROM vw_layoff_data_cleaned
WHERE total_laid_off IS NOT NULL
ORDER BY total_laid_off DESC;

-- 6.Trend of layoffs by month 
SELECT 
    FORMAT([date], 'yyyy-MM') AS month,
    SUM(total_laid_off) AS total_layoffs
FROM vw_layoff_data_cleaned
WHERE [date] IS NOT NULL
GROUP BY FORMAT([date], 'yyyy-MM')
ORDER BY month,total_layoffs DESC;

-- View of all data

SELECT * FROM vw_layoff_data_cleaned
