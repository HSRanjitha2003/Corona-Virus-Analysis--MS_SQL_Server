# "Corona-Virus Analysis" using MS SQL Server
► As a part of Data Analyst Internship at Mentorness, I have been tasked to analyse Corona-Virus Dataset using MS SQL Server.

### 𝐓𝐚𝐬𝐤 𝟐 : Corona-Virus Analysis using MS SQL Server
### ➡️ Objective of the Project :

- The objective of coronavirus analysis is to monitor how COVID-19 spreads and affects people by looking at data on cases, recoveries, and and deaths deaths in  differe different areas over time.

This includes:

- Monitoring the number of confirmed cases, deaths, and recoveries.
- Analyzing the geographical spread of the virus using latitude and longitude.
- Providing a time series of the pandemic's progression.
  
- This dataset can be used for various analyses, such as:

- Visualizing the spread of COVID-19 on a map.
- Identifying trends and patterns in the number of cases, deaths, and recoveries over time.
- Comparing the impact of the virus in different regions.
- Modeling and forecasting the future course of the pandemic based on historical data. ​

### ➡️Project Description :

✦ The dataset contains a total of 78,000 rows, the data spans from 22 January 2020 to 13 June 2021. This period covers a significant part of the COVID-19 pandemic, including initial outbreaks, various waves, and the rollout of vaccines.

✦ There are 12 months of data present within the date range. This indicates that the dataset might have monthly aggregated data or data recorded over a year's span.

### ➡️ Dataset Includes :

The dataset appears to be a COVID-19 dataset, providing detailed information about the progression of the pandemic. Here are the key features and their descriptions:

- Province: The province or state within the country.

- Country/Region: The country or region where the data was recorded.

- Latitude: Latitude coordinate for the location.

- Longitude: Longitude coordinate for the location.

- Date: The date when the data was recorded.

- Confirmed: The number of confirmed COVID-19 cases.

- Deaths: The number of deaths due to COVID-19.

- Recovered: The number of recovered cases from COVID-19.

### ➡️ SQL Queries and Insights :

<img width="695" height="404" alt="Screenshot 2026-03-01 193759" src="https://github.com/user-attachments/assets/9f57ed8a-97e0-4b8b-a428-501e587ff9ca" />


#### ➤ Explanation: 
This query checks the dataset for missing values (NULL) in critical columns. Missing values could affect analysis accuracy.

#### ➤ Insight: 
Identifying and addressing missing data ensures the dataset is clean and reliable for further analysis.

<img width="709" height="409" alt="Screenshot 2026-03-01 193811" src="https://github.com/user-attachments/assets/a0632558-8a2d-4235-98e9-b4beb1253969" />


#### ➤ Explanation: 
This query replaces any missing (NULL) values in the Confirmed, Deaths, and Recovered columns with 0 using the COALESCE function. 
The SET sql_safe_updates = 0 command allows updates without strict conditions.

#### ➤ Insight: 
Ensures that no data gaps interfere with numerical computations or aggregations.


<img width="701" height="395" alt="Screenshot 2026-03-01 193824" src="https://github.com/user-attachments/assets/507ff60f-ca86-40f1-be1d-f9ba0f7d0aa6" />

#### ➤ Explanation: 
This query counts the total number of records (rows) in the table.

#### ➤ Insight: 
Provides a quick overview of the dataset size and scope.

<img width="856" height="482" alt="Screenshot 2026-03-01 194036" src="https://github.com/user-attachments/assets/0d454d5a-758a-4377-aa9b-900fa062aa98" />

#### ➤ Explanation: 
Finds the earliest and latest dates in the dataset using the MIN and MAX functions.

#### ➤ Insight: 
The data spans a specific time period, helping to understand the timeline of the pandemic's impact.


<img width="856" height="479" alt="Screenshot 2026-03-01 194048" src="https://github.com/user-attachments/assets/d51c224f-78d0-4a8b-8c65-79d217ac3fdd" />

#### ➤ Explanation: 
Extracts the month from the Date column and counts unique months to determine the dataset's temporal coverage.

#### ➤ Insight: 
Understanding the span of months allows analysis of seasonal or monthly trends.

<img width="851" height="477" alt="Screenshot 2026-03-01 194100" src="https://github.com/user-attachments/assets/8a1eb08e-48d0-4125-b61c-634666c0eba6" />

- The query aims to calculate the monthly average of confirmed COVID-19 cases, deaths, and recoveries from a dataset called corona_virus.


<img width="848" height="477" alt="Screenshot 2026-03-01 194118" src="https://github.com/user-attachments/assets/cb750a71-9fc9-4c53-8ac8-f6be1634842f" />

#### 💠SQL Query Breakdown:
#### 1] Calculate Averages:
#### ✅ Syntax :
AVG(Confirmed) AS Avg_Confirmed,
AVG(Deaths) AS Avg_Deaths,
AVG(Recovered) AS Avg_Recovered,

AVG(Confirmed) : calculates the average number of confirmed cases and aliases it as Avg_Confirmed.

AVG(Deaths) : calculates the average number of deaths and aliases it as Avg_Deaths.

AVG(Recovered) : calculates the average number of recoveries and aliases it as Avg_Recovered.

#### 2] Specify the Data Source:

#### ✅ Syntax :

FROM CoronaData

The data is being retrieved from the CoronaData table.

#### 3] Group by Month and Year:

#### ✅ Syntax :
GROUP BY Month, Year;

The results are grouped by both the extracted month and year. This ensures that the averages are calculated for each month within each year.

#### 5] Result Table Explanation:
The result table shows the monthly averages for confirmed cases, deaths, and recoveries. Each row corresponds to a specific month and year combination.

Example Results Interpretation:

#### ➤ Row 1:

Month: January 2020
Avg_Confirmed: 4.1455
Avg_Deaths: 0.1234
Avg_Recovered: 0.0929

This means that in January 2020, the average number of confirmed cases was approximately 4.15, the average number of deaths was approximately 0.12, and the average number of recoveries was approximately 0.09.

#### ➤ Row 2:

Month: February 2020
Avg_Confirmed: 15.2960
Avg_Deaths: 0.5936
Avg_Recovered: 7.0320

- This indicates that in February 2020, the average number of confirmed cases was approximately 15.30, the average number of deaths was approximately 0.59, and the average number of recoveries was approximately 7.03.


<img width="852" height="487" alt="Screenshot 2026-03-01 194132" src="https://github.com/user-attachments/assets/7d4f3a0c-9a8e-4140-ab3b-aa66eacfe700" />
- The query aims to find the maximum number of confirmed COVID-19 cases, deaths, and recoveries per year.

#### 💠 SQL Query Breakdown:
#### 1] Calculate Maximum Values:

MAX(Confirmed) AS Max_Confirmed,
MAX(Deaths) AS Max_Deaths,
MAX(Recovered) AS Max_Recovered,
MAX(Confirmed): calculates the maximum number of confirmed cases and aliases it as Max_Confirmed.
MAX(Deaths) : calculates the maximum number of deaths and aliases it as Max_Deaths.
MAX(Recovered): calculates the maximum number of recoveries and aliases it as Max_Recovered.

#### 2] Specify the Data Source:

FROM CovidData
The data is being retrieved from the CovidData table.

#### 3] Group by Year:

GROUP BY Year
The results are grouped by the extracted year. This ensures that the maximum values are calculated for each year.

#### 4] Order by Year:

ORDER BY Year;
The results are ordered by the year to provide a chronological view of the data.

#### 5] Result Table Explanation:

The result table shows the maximum values for confirmed cases, deaths, and recoveries for each year.

Example Results Interpretation:
- Year 2020:

Max_Confirmed: 823225
Max_Deaths: 3752
Max_Recovered: 1123456
This indicates that in 2020, the highest number of confirmed cases in a single entry was 823,225, the highest number of deaths was 3,752, and the highest number of recoveries was 1,123,456.

- Year 2021:

Max_Confirmed: 414188
Max_Deaths: 7374
Max_Recovered: 422436
This indicates that in 2021, the highest number of confirmed cases in a single entry was 414,188, the highest number of deaths was 7,374, and the highest number of recoveries was 422,436.




<img width="855" height="477" alt="Screenshot 2026-03-01 194152" src="https://github.com/user-attachments/assets/d42e2813-e409-4474-aba9-4a8a5df6e284" />


#### ➤ Explanation: 
Calculates the smallest and largest values for each metric annually using MIN and MAX functions.

#### ➤ Insight: 
Identifies outlier years or extreme points during the pandemic.

<img width="851" height="479" alt="Screenshot 2026-03-01 194207" src="https://github.com/user-attachments/assets/5f8aeda4-e20a-4d1c-9955-be72c55f3690" />

#### ➤ Explanation: 
Calculates the smallest and largest values for each metric annually using MIN and MAX functions.

#### ➤ Insight:
Identifies outlier years or extreme points during the pandemic.

<img width="846" height="479" alt="Screenshot 2026-03-01 194251" src="https://github.com/user-attachments/assets/f0a7b495-02e5-4952-87b1-bfeb1b059bdb" />

 #### ➤ Explanation: 
 Aggregates total confirmed cases, deaths, and recoveries for each month using the SUM function.
 
#### ➤ Insight: 
Identifies monthly cumulative trends and critical periods.


<img width="842" height="478" alt="Screenshot 2026-03-01 194308" src="https://github.com/user-attachments/assets/7a1dd8e8-c83d-4e8f-ba59-bbe79663d622" />

 #### ➤ Explanation: 
Calculates the total, average, variance, and standard deviation of confirmed cases, deaths, or recoveries.

 #### ➤ Insight: 
Measures the spread and variability of the data, essential for understanding consistency and volatility.

<img width="849" height="475" alt="Screenshot 2026-03-01 194322" src="https://github.com/user-attachments/assets/56a4b9f0-ab06-4a8f-a7a3-de2773d25666" />

#### ➤ Explanation: 
Calculates the total, average, variance, and standard deviation of confirmed cases, deaths, or recoveries.

 #### ➤ Insight: 
Measures the spread and variability of the data, essential for understanding consistency and volatility.

Explanation: Finds the country with the lowest total deaths using a Common Table Expression (CTE) and RANK.
Insight: Highlights regions with minimal fatalities.
<img width="856" height="475" alt="Screenshot 2026-03-01 194338" src="https://github.com/user-attachments/assets/709df70f-ba4b-496f-b704-28fed70bfcf5" />

 

 #### ➤ Explanation:
Identifies the country with the highest total confirmed cases using SUM and LIMIT.
 #### ➤Insight: 
 Reveals which country was most affected.
 
<img width="847" height="476" alt="Screenshot 2026-03-01 194411" src="https://github.com/user-attachments/assets/a27ab482-f203-41cb-b529-2368422a9164" />

Explanation: Lists the top 5 countries with the highest recoveries using SUM and LIMIT.
Insight: Recognizes regions with strong recovery efforts.

<img width="592" height="335" alt="image" src="https://github.com/user-attachments/assets/6999f452-02fc-4fbd-ae30-b94b0fd523bd" />


### ➡️ Overall  Insights :

#### ➤ Higher Confirmed Cases:
The United States has the highest number of confirmed cases. This reflects the significant impact of COVID-19 on the US, particularly during the peak periods of the pandemic.

#### ➤ Lowest Death Cases:
Countries like Dominica, Kiribati, Marshall Islands, and Samoa have the lowest number of death cases. These countries may have managed to control the spread of the virus effectively or have smaller populations, leading to fewer deaths.

#### ➤ Highest Recovered Cases :
The top five countries with the highest number of recovered cases are India, Brazil, the US, Turkey, and Russia. These countries likely experienced high numbers of cases overall, leading to high recovery numbers as well.

### ➡️ 𝐒𝐮𝐦𝐦𝐚𝐫𝐲 :

#### ➤ Pandemic Coverage :
The date range indicates that the dataset covers critical phases of the pandemic, making it valuable for trend analysis and understanding the progression and impact over time.

#### ➤ Geographical Impact:
The US having the highest confirmed cases is consistent with global reports of the pandemic's severe impact on the country. Conversely, the countries with the lowest death cases are small island nations, which might have implemented strict measures early on to prevent the spread of the virus.

#### ➤ Recovery Rates :
High recovery numbers in populous countries like India, Brazil, and the US are expected given their large populations and significant numbers of confirmed cases. The high recovery rate can provide insights into healthcare response effectiveness and the overall trajectory of the pandemic in these regions.

✨ These insights can help in understanding the global impact of COVID-19, the effectiveness of different countries' responses, and the overall trends in confirmed, death, and recovery cases during the specified period.
