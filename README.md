## Unlocking Investment Opportunities in the Mexican Restaurant Industry: A Data-Driven Exploration


![resta](https://github.com/NEENYEE/Mexican-restaurant-analysis/assets/101926233/110195a6-5391-448d-9409-4279a2abcacd)

## Table Of Contents
- [Overview](overview)
- [Problem Statements](problem-statements)
- [Data Source](data-source)


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


## Tools

In this project, a combination of Excel, Power BI, and SQL were utilized to analyze and visualize the data effectively. Each tool played a unique role in the data analysis process, offering specific functionalities and capabilities to uncover insights from the dataset. 


## Data Preparation

The first step before diving into analysis was a thorough examination of the dataset to gain a comprehensive understanding of the dataset. The structure of the dataset was explored, key variables were identified, and data quality was assessed to inform the data preparation strategy. Power query was leveraged to clean, handle missing values and remove duplicates.
- Columns like zipcode, longitude and latitude deemed irrelevant and were dropped from the dataset to focus on relevant variables for analysis.
- Missing values were handled using mode imputation, where empty rows were replaced with the mode of the respective column. For instance, the empty rows in the smokers, transportation and budget columnn were replaced with No, public and medium respectively.
- 'Replace values' was used to replace inconsistent value. for instance, 'Gorditas Doña Tota' was replaced with 'Gorditas Dona Tota' and 'La Cantina Restaurante' was replaced with 'La Cantina'.


