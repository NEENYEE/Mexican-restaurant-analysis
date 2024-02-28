## Unlocking Investment Opportunities in the Mexican Restaurant Industry: A Data-Driven Exploration


![resta](https://github.com/NEENYEE/Mexican-restaurant-analysis/assets/101926233/110195a6-5391-448d-9409-4279a2abcacd)

## Table Of Contents
- [Overview](#overview)
- [Problem Statements](#problem-statements)
- [Data Source](#data-source)
- [Tools](#tools)
- [Data Preparation](#data-preparation)
- [Data Analysis](#data-analysis)
- [Visualizations](#visualizations)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)


## Overview

Welcome to the restaurant rating dataset documentation! This dataset offers valuable insights into restaurants in Mexico, gathered through a comprehensive customer survey conducted in 2012. It encompasses information about each restaurant, their cuisines, consumer demographics, and preferences. By leveraging advanced analytical techniques, this dataset facilitates the identification of trends, patterns, and opportunities within the Mexican restaurant market, enabling informed decision-making and strategic planning. Let's embark on a journey through this dataset to uncover the hidden gems and untapped potentials that lie within the diverse culinary tapestry of Mexico.

## Problem Statements

Navigating the Mexican restaurant market presents challenges for investors. The aim is to address the key questions:
1. What can you learn from the highest rated restaurants? Do consumer preferences have an effect on ratings?
2. What are the consumer demographics? Does this indicate a bias in the data sample?
3. Are there any demand & supply gaps that you can exploit in the market?
4. If you were to invest in a restaurant, which characteristics would you be looking for?


## Data Source
The dataset was provided by Digitaley drive as an integral part of my capstone project [download here](https://drive.google.com/file/d/1c1HKM8UTqwWOgexRLOtEJuxjBiA2N6xf/view?usp=drive_link). 
The dataset consists of 5 tables namely: 
- consumer preferences (330 rows and 2 columns)
- consumers (138 rows and 12 columns)
- ratings (1161 rows and 5 columns)
- restaurant cuisines (112 rows and 2 columns)
- restaurants (130 rows and 11 columns)


## ER Diagram

![IMG_8564](https://github.com/NEENYEE/Mexican-restaurant-analysis/assets/101926233/be0b09fd-6121-45fe-bcd6-7f2a2d38ab88)


## Tools

In this project, a combination of Excel, Power BI, and SQL were utilized to analyze and visualize the data effectively. Each tool played a unique role in the data analysis process, offering specific functionalities and capabilities to uncover insights from the dataset. 


## Data Preparation

The first step before diving into analysis was a thorough examination of the dataset to gain a comprehensive understanding of the dataset. The structure of the dataset was explored, key variables were identified, and data quality was assessed to inform the data preparation strategy. Power query was leveraged to clean, handle missing values and remove duplicates.
- Columns like zipcode, longitude and latitude deemed irrelevant and were dropped from the dataset to focus on relevant variables for analysis.
- Missing values were handled using mode imputation, where empty rows were replaced with the mode of the respective column. For instance, the empty rows in the smokers, transportation and budget columnn were replaced with No, public and medium respectively.
- 'Replace values' was used to replace inconsistent value. for instance, 'Gorditas Doña Tota' was replaced with 'Gorditas Dona Tota' and 'La Cantina Restaurante' was replaced with 'La Cantina'.


## Data Analysis

The data analysis phase involved leveraging SQL and DAX measures to delve into the dataset and extract valuable insights. This began with SQL, where the querying capabilities were utilized to perform data manipulation and aggregation tasks. In addition to querying the dataset directly, views were created to streamline the analysis and facilitate easier access to key information. 

Using DAX measures, key metrics such as total consumers, total restaurants, and the number of cuisines offered were calculated. These measures provided valuable insights into the size and scope of the restaurant market, as well as consumer preferences and behavior.


## visualizations
<img width="1680" alt="Screenshot 2024-02-28 at 8 52 14 PM" src="https://github.com/NEENYEE/Mexican-restaurant-analysis/assets/101926233/2a6baeb6-b162-4512-9da4-c8e7dc0b6127">
<img width="1680" alt="Screenshot 2024-02-28 at 8 52 27 PM" src="https://github.com/NEENYEE/Mexican-restaurant-analysis/assets/101926233/9418266d-f2dc-4ffd-893b-84182acccecb">
<img width="1680" alt="Screenshot 2024-02-28 at 8 52 36 PM" src="https://github.com/NEENYEE/Mexican-restaurant-analysis/assets/101926233/c13ac1f0-5ba6-4fb4-a20a-707677d32d9b">


## Key Insights

This section distills the most important findings from the analysis, providing stakeholders with actionable takeaways.

- **Who are the customers?**
  
The dataset encompasses a wide range of demographic groups, including various age groups, genders, occupation and so on. This diversity highlights the broad appeal of the restaurants to a diverse customer base.

   - 87% of the customers are students.
   - Majority of the consumers live in San-Luis Potosi, prefer mexican cuisines and are between the ages of 18-25
   - Majority (73%) are married.
   - 71% are on a medium budget.
   - Majority prefer public transport.
   - Majority of them are non-smokes and Abstemious drinkers.

However, the data collection methods favor certain demographic groups like students and 18-25 age groups, this may indicate bias.

- **Highest rated restaurants**

The highest rated restaurant is Restaurant Las Mananits with average ratings of 2 in overall, food and service ratings. Followed by Michiko Restaurant Japones and Emilianos. Most of the highest rated restaurants are situated in San Luis Potosi, Offer mostly mexican cuisine, medoum to low prices, have no parking spaces and are situated in closed areas. 

Majority of the consumers who rated these restaurants reside in the same city, on a medium budget, prefer public transport, non-smokers, abstemious drinkers, are students, single and prefer mexican cuisine. Therefore, these demographics are out target market.

- **Demand and supply gaps in the market**
Most of the cuisines have higher growing demands compared to the restaurants offering them. The analysis reveals that the demand for Mexican cuisine is approximately 3.2 times higher than the supply available in the market.
American cuisines are twice higher in demand than the supply. Hot dogs and Latin american are in demand but not supplied by any restaurant.


## Recommendations
- **Invest in Mexican Cuisine Ventures**: Given the data indicating a 3.2 times higher demand than supply for Mexican cuisine, investors should consider allocating resources to restaurant ventures specializing in Mexican cuisine. This market demand presents a lucrative opportunity for investors to capitalize on consumer preferences and potentially high returns on investment.

- **Focus on Student-Centric Locations:** Given the positive ratings from students, investors may consider prioritizing investments in restaurant ventures located near university campuses or student-dense areas. Targeting these locations can attract a steady stream of student customers and drive consistent revenue.

- **Target Demographic-Friendly Establishments:** Prioritize investments in restaurants that cater to the preferences and behaviors of the target demographics, including students. Focus on establishments known for their student-friendly ambiance, menu offerings, and pricing strategies to maximize investment potential.




