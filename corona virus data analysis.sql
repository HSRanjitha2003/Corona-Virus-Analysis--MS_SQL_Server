use corona_virus;

drop table  CovidData ;

CREATE TABLE CovidData (
   Province VARCHAR(255) NULL,
   [Country/Region] VARCHAR(255) NULL,
   Latitude FLOAT NULL,
   Longitude FLOAT NULL,
   Date DATE NULL,
   Confirmed INT NULL,
   Deaths INT NULL,
   Recovered INT NULL
);
BULK INSERT CovidData
FROM 'C:/Users/Appa/Downloads/Corona Virus Dataset.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    ERRORFILE = 'C:/Users/Appa/Downloads/error_rows.log'
);

Select * from CovidData;
/* =========================================================
   COVID DATA ANALYSIS – FINAL CLEAN VERSION
   Table Structure:
   Province VARCHAR(255)
   [Country/Region] VARCHAR(255)
   Latitude FLOAT
   Longitude FLOAT
   Date DATE
   Confirmed INT
   Deaths INT
   Recovered INT
========================================================= */

----------------------------------------------------------
-- 1. Find rows where ALL columns are NULL
----------------------------------------------------------
SELECT *
FROM CovidData
WHERE Province IS NULL
  OR [Country/Region] IS NULL
  OR Latitude IS NULL
  OR Longitude IS NULL
  OR Date IS NULL
  OR Confirmed IS NULL
  OR Deaths IS NULL
  OR Recovered IS NULL;


----------------------------------------------------------
-- 2. Replace NULL values in numeric columns with 0
----------------------------------------------------------
UPDATE CovidData
SET 
    Confirmed = COALESCE(Confirmed, 0),
    Deaths    = COALESCE(Deaths, 0),
    Recovered = COALESCE(Recovered, 0)
WHERE Confirmed IS NULL
  AND Deaths IS NULL
  AND Recovered IS NULL;


----------------------------------------------------------
-- 3. Count distinct months in dataset
----------------------------------------------------------
SELECT COUNT(DISTINCT DATEPART(MONTH, Date)) AS Num_Months
FROM CovidData;


----------------------------------------------------------
-- 4. Count total rows in dataset
----------------------------------------------------------
SELECT COUNT(*) AS Total_Rows
FROM CovidData;


----------------------------------------------------------
-- 5. Get dataset start and end date
----------------------------------------------------------
SELECT 
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date
FROM CovidData;


----------------------------------------------------------
-- 6. Monthly average confirmed, deaths and recovered
----------------------------------------------------------
SELECT 
    DATEPART(YEAR, Date)  AS [Year],
    DATEPART(MONTH, Date) AS [Month],
    AVG(Confirmed) AS Avg_Confirmed,
    AVG(Deaths)    AS Avg_Deaths,
    AVG(Recovered) AS Avg_Recovery
FROM CovidData
GROUP BY 
    DATEPART(YEAR, Date),
    DATEPART(MONTH, Date)
ORDER BY 
    [Year],
    [Month];


----------------------------------------------------------
-- 7. Monthly maximum cases
----------------------------------------------------------
SELECT
    DATEPART(YEAR, Date)  AS [Year],
    DATEPART(MONTH, Date) AS [Month],
    MAX(Confirmed) AS Max_Confirmed,
    MAX(Deaths)    AS Max_Deaths,
    MAX(Recovered) AS Max_Recovered
FROM CovidData
GROUP BY 
    DATEPART(YEAR, Date),
    DATEPART(MONTH, Date)
ORDER BY 
    [Year],
    [Month];


----------------------------------------------------------
-- 8. Monthly minimum cases
----------------------------------------------------------
SELECT
    DATEPART(YEAR, Date)  AS [Year],
    DATEPART(MONTH, Date) AS [Month],
    MIN(Confirmed) AS Min_Confirmed,
    MIN(Deaths)    AS Min_Deaths,
    MIN(Recovered) AS Min_Recovered
FROM CovidData
GROUP BY 
    DATEPART(YEAR, Date),
    DATEPART(MONTH, Date)
ORDER BY 
    [Year],
    [Month];


----------------------------------------------------------
-- 9. Monthly total confirmed, deaths and recovered
----------------------------------------------------------
SELECT  
    DATEPART(YEAR, Date)  AS [Year],
    DATEPART(MONTH, Date) AS [Month],
    SUM(Confirmed) AS Total_Confirmed,  
    SUM(Deaths)    AS Total_Deaths,  
    SUM(Recovered) AS Total_Recovered  
FROM CovidData  
GROUP BY  
    DATEPART(YEAR, Date),  
    DATEPART(MONTH, Date)  
ORDER BY  
    [Year],  
    [Month];


----------------------------------------------------------
-- 10. Overall statistical analysis (Confirmed cases)
----------------------------------------------------------
SELECT 
    SUM(Confirmed)   AS Total_Confirmed_Cases,
    AVG(Confirmed)   AS Avg_Confirmed_Cases,
    VAR(Confirmed)   AS Variance_Confirmed_Cases,
    STDEV(Confirmed) AS Stdev_Confirmed_Cases
FROM CovidData;


----------------------------------------------------------
-- 11. Monthly statistical analysis (Confirmed cases)
----------------------------------------------------------
SELECT 
    DATEPART(YEAR, Date)  AS [Year],
    DATEPART(MONTH, Date) AS [Month],
    SUM(Confirmed)   AS Total_Confirmed_Cases,
    AVG(Confirmed)   AS Avg_Confirmed_Cases,
    ROUND(VAR(Confirmed), 2)   AS Variance_Confirmed_Cases,
    ROUND(STDEV(Confirmed), 2) AS Stdev_Confirmed_Cases
FROM CovidData
GROUP BY
    DATEPART(YEAR, Date),  
    DATEPART(MONTH, Date)
ORDER BY  
    [Year],  
    [Month];


----------------------------------------------------------
-- 12. Monthly statistical analysis (Death cases)
----------------------------------------------------------
SELECT
    DATEPART(YEAR, Date)  AS [Year],
    DATEPART(MONTH, Date) AS [Month],
    SUM(Deaths)   AS Total_Death_Cases,
    AVG(Deaths)   AS Avg_Death_Cases,
    ROUND(VAR(Deaths), 2)   AS Variance_Death_Cases,
    ROUND(STDEV(Deaths), 2) AS Stdev_Death_Cases
FROM CovidData
GROUP BY 
    DATEPART(YEAR, Date),  
    DATEPART(MONTH, Date)
ORDER BY 
    [Year], 
    [Month];

----------------------------------------------------------
-- 12. Monthly statistical analysis (Confirmed Cases)
----------------------------------------------------------
SELECT
    DATEPART(YEAR, Date)  AS [Year],
    DATEPART(MONTH, Date) AS [Month],
    SUM(Confirmed)   AS Total_Confirmed_Cases,
    AVG(Confirmed)   AS Avg_Confirmed_Cases,
    ROUND(VAR(Confirmed), 2)   AS Variance_Confirmed_Cases,
    ROUND(STDEV(Confirmed), 2) AS Stdev_Confirmed_Cases
FROM CovidData
GROUP BY 
    DATEPART(YEAR, Date),  
    DATEPART(MONTH, Date)
ORDER BY 
    [Year], 
    [Month];
----------------------------------------------------------
-- 13. Top 5 countries by confirmed cases
----------------------------------------------------------
SELECT TOP 5
    [Country/Region],
    SUM(Confirmed) AS Total_Confirmed_Cases
FROM CovidData
GROUP BY [Country/Region]
ORDER BY Total_Confirmed_Cases DESC;


----------------------------------------------------------
-- 14. Country with minimum death cases
----------------------------------------------------------
WITH RankingCountry AS (
    SELECT 
        [Country/Region],
        SUM(Deaths) AS Total_Deaths_Cases,
        RANK() OVER (ORDER BY SUM(Deaths) ASC) AS rnk
    FROM CovidData
    GROUP BY [Country/Region]
)
SELECT 
    [Country/Region],
    Total_Deaths_Cases
FROM RankingCountry
WHERE rnk = 1;


----------------------------------------------------------
-- 15. Top 5 countries by recovered cases
----------------------------------------------------------
SELECT TOP 5
    [Country/Region],
    SUM(Recovered) AS Total_Recovered_Cases
FROM CovidData
GROUP BY [Country/Region]
ORDER BY Total_Recovered_Cases DESC;


----------------------------------------------------------
-- 16. View full dataset
----------------------------------------------------------
SELECT *
FROM CovidData;


