# 🧹 SQL Data Cleaning and Analysis — Global Layoffs Dataset

This project demonstrates beginner-level **data cleaning and analysis using SQL Server**.  
It showcases how to transform a raw dataset into a clean, reliable, and analytical format.

---

## 🧩 Project Overview

**Goal:** Clean and analyze global layoff data from a CSV file using SQL.

**Tools Used:**
- SQL Server Management Studio (SSMS)
- Git & GitHub
- CSV dataset: `layoffs.csv`

---

## ⚙️ Steps in the Project

| Step | Description |
|------|--------------|
| 1️⃣ | Import raw data from CSV into SQL Server |
| 2️⃣ | Clean data: handle duplicates, nulls, data types, and inconsistencies |
| 3️⃣ | Build a clean dataset view using CTEs |
| 4️⃣ | Perform analytical queries for insights |

---

## 🧹 Data Cleaning Summary

- Trimmed spaces and standardized text
- Removed duplicates using `ROW_NUMBER()`
- Converted data types (text → int/date/float)
- Standardized industry names (e.g. “Crypto / Web3” → “Crypto”)
- Handled NULL and invalid values

---

## 📊 Key Insights

| Question | Example Result |
|-----------|----------------|
| Total layoffs per company | Amazon: **18,150** |
| Total layoffs per industry | Consumer: **44,782** |
| Top 5 countries | USA, India, Netherlands, Sweden, Brazil |
| Year with most layoffs | **2022 (160,661)** |
| Largest single layoff | Google – **12,000** |
| Trend by month | Peaks in **Nov 2022 – Feb 2023** |

---

## 🧠 Skills Demonstrated
- SQL Data Cleaning (CTE, TRIM, NULLIF, TRY_CAST)
- Exploratory Data Analysis (Aggregation, Grouping)
- Data Validation using INFORMATION_SCHEMA
- Query Optimization Practices

---

## 🚀 How to Run
1. Clone this repo
2. Open SQL Server Management Studio
3. Run the scripts in order:
   - `1_create_table_and_import.sql`
   - `2_cleaning_and_cte.sql`
   - `3_analysis_queries.sql`
4. View results in SSMS and export if needed

---

### 👨‍💻 Author
**Justin Noel Echaore**  
Beginner Data Engineer | Building SQL & ETL Projects  
📧 jnechaore@gmail.com  
🌐 https://github.com/echaore35-bit
