CREATE DATABASE RESTAURANT_RATINGS;

USE RESTAURANT_RATINGS;

CREATE TABLE Restaurants (
    Restaurant_ID INT,
    Name VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Alcohol_service VARCHAR(100),
    Smoking_allowed VARCHAR(100),
    Price VARCHAR(50),
    Franchise VARCHAR(100),
    Area VARCHAR(100),
    Parking VARCHAR(100)
);

CREATE TABLE Restaurant_cuisines (
    Restaurant_ID INT,
    Cuisine VARCHAR(100)
);

CREATE TABLE Ratings (
    Consumer_ID VARCHAR(10),
    Restaurant_ID INT,
    Overall_rating INT,
    Food_rating INT,
    Service_rating INT
);

CREATE TABLE Consumers (
    Consumer_ID VARCHAR(10),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Smoker VARCHAR(10),
    Drink_level VARCHAR(50),
    Transportation VARCHAR(50),
    Marital_status VARCHAR(50),
    Children VARCHAR(50),
    Age INT,
    Occupation VARCHAR(50),
    Budget VARCHAR(50)
);

CREATE TABLE Consumer_preferences (
    Consumer_ID VARCHAR(10),
    Preferred_cuisine VARCHAR(50)
);

-- Assigning primary and secondary keys
ALTER TABLE Consumers
ADD PRIMARY KEY (Consumer_ID);

ALTER TABLE Restaurants
ADD PRIMARY KEY (Restaurant_ID);

ALTER TABLE Restaurant_cuisines
ADD FOREIGN KEY (Restaurant_ID)
REFERENCES Restaurants(Restaurant_ID);

ALTER TABLE Consumer_preferences
ADD FOREIGN KEY (Consumer_ID)
REFERENCES Consumers(Consumer_ID);

ALTER TABLE Ratings
ADD FOREIGN KEY (Consumer_ID)
REFERENCES Consumers(Consumer_ID);

ALTER TABLE Ratings
ADD FOREIGN KEY (Restaurant_ID)
REFERENCES Restaurants(Restaurant_ID);

-- What are the consumer demographics? Does this indicate a bias in the data sample?
-- CUSTOMER DISTRIBUTION:
-- BY CITY
SELECT 
    city,
    COUNT(*) AS consumer_count,
    ROUND((COUNT(city) / (SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM
    Consumers
GROUP BY City
ORDER BY consumer_count DESC;

-- BY MARITAL STATUS
SELECT Marital_status, 
COUNT(*) AS consumer_count,
ROUND ((COUNT(Marital_status)/(SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM Consumers
GROUP BY Marital_status
ORDER BY consumer_count DESC;

-- BY CHILDREN
SELECT children, 
COUNT(*) AS consumer_count,
ROUND ((COUNT(children)/(SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM Consumers
GROUP BY children
ORDER BY consumer_count DESC;

-- BY OCCUPATION
SELECT Occupation, 
COUNT(*) AS consumer_count,
ROUND ((COUNT(occupation)/(SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM Consumers
GROUP BY occupation
ORDER BY consumer_count DESC;

-- BY AGE GROUP
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN 'Young Adults'
        WHEN Age BETWEEN 26 AND 35 THEN 'Adults'
        WHEN Age BETWEEN 36 AND 45 THEN 'Middle-aged'
        WHEN Age BETWEEN 46 AND 55 THEN 'Mature Adults'
        WHEN Age BETWEEN 56 AND 65 THEN 'Senior Citizens'
        ELSE 'Elderly'
    END AS age_group,
      COUNT(*) AS consumer_count,
    ROUND((COUNT(CASE 
                  WHEN Age BETWEEN 18 AND 25 THEN 'Young Adults'
                  WHEN Age BETWEEN 26 AND 35 THEN 'Adults'
                  WHEN Age BETWEEN 36 AND 45 THEN 'Middle-aged'
                  WHEN Age BETWEEN 46 AND 55 THEN 'Mature Adults'
                  WHEN Age BETWEEN 56 AND 65 THEN 'Senior Citizens'
                  ELSE 'Elderly'
             END) / (SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM 
    Consumers
GROUP BY 
    age_group
ORDER BY 
    consumer_count DESC;
    
-- BY BUDGET
SELECT 
Budget, 
COUNT(*) AS consumer_count,
ROUND ((COUNT(budget)/(SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM Consumers
GROUP BY budget
ORDER BY consumer_count DESC;

-- BY TRANSPORTATION
SELECT 
Transportation, 
COUNT(*) AS consumer_count,
ROUND ((COUNT(transportation)/(SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM Consumers
GROUP BY Transportation
ORDER BY consumer_count DESC;

-- BY SMOKING STATUS
SELECT 
Smoker, 
COUNT(*) AS consumer_count,
ROUND ((COUNT(smoker)/(SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM Consumers
GROUP BY Smoker
ORDER BY consumer_count DESC;

-- BY ALCOHOL CONSUMPTION
SELECT 
Drink_level, 
COUNT(*) AS consumer_count,
ROUND ((COUNT(Drink_level)/(SELECT COUNT(*) FROM Consumers)) * 100, 2) AS Perc_Consumers
FROM Consumers
GROUP BY Drink_level
ORDER BY consumer_count DESC;


-- What can you learn from the highest rated restaurants? Do consumer preferences have an effect on ratings?
-- IDENTIFY HIGHEST RATED
SELECT 
    r.name AS Restaurant_name, 
    ROUND(AVG(ra.overall_rating), 2) AS Avg_overall_rating,
    ROUND(AVG(ra.food_rating), 2) AS Avg_food_rating,
    ROUND(AVG(ra.service_rating), 2) AS Avg_service_rating
FROM
    restaurants r
        INNER JOIN
    ratings ra ON ra.Restaurant_ID = r.Restaurant_ID
    INNER JOIN 
    Restaurant_cuisines rc ON rc.Restaurant_ID = r.Restaurant_ID
GROUP BY ra.Restaurant_ID , r.Name
ORDER BY Avg_overall_rating DESC , Avg_food_rating DESC;

-- ANALYZING THE CHARACTERISTICS OF THE HIGHEST RATED RESTAURANTS
SELECT 
    r.Name AS Restaurant_Name,
    rc.Cuisine,
    r.Price,
    r.City,
    r.Alcohol_Service,
    r.Smoking_Allowed,
    r.Parking,
    r.Area,
    ROUND(AVG(ra.overall_rating), 2) AS Avg_overall_rating,
    ROUND(AVG(ra.food_rating), 2) AS Avg_food_rating,
    ROUND(AVG(ra.service_rating), 2) AS Avg_service_rating
FROM 
    Restaurants AS r
INNER JOIN 
    Ratings AS ra ON r.Restaurant_ID = ra.Restaurant_ID
INNER JOIN 
    Restaurant_Cuisines AS rc ON r.Restaurant_ID = rc.Restaurant_ID
GROUP BY 
    r.Restaurant_ID, r.Name, rc.Cuisine, r.Price, r.City, r.Alcohol_Service, r.Smoking_Allowed, r.Parking, r.Area
ORDER BY 
    Avg_overall_Rating DESC,Avg_food_rating DESC;
    
    
    
-- key demographic 
    
-- CONSUMER PREFERENCES FOR CUISINE TYPE
-- Aggregate consumer preferences for cuisine types
SELECT 
    Preferred_Cuisine,
    COUNT(*) AS Preference_Count
FROM 
    Consumer_Preferences
GROUP BY 
    Preferred_Cuisine
ORDER BY Preference_Count DESC;

-- Aggregate restaurant ratings by cuisine type
SELECT 
    rc.Cuisine,
    ROUND(AVG(ra.overall_rating), 2) AS Avg_overall_rating,
    ROUND(AVG(ra.food_rating), 2) AS Avg_food_rating
FROM 
    Ratings ra
INNER JOIN 
    Restaurants r ON ra.Restaurant_ID = r.Restaurant_ID
INNER JOIN 
    Restaurant_Cuisines rc ON r.Restaurant_ID = rc.Restaurant_ID
GROUP BY 
    rc.Cuisine
    ORDER BY  Avg_food_rating DESC ;

    
-- Are there any demand & supply gaps that you can exploit in the market?
-- Combine Consumer Preferences Analysis (Demand) and Restaurant Offerings Analysis (Supply)
CREATE TEMPORARY TABLE Demand_Supply_Analysis AS
SELECT 
    cp.Preferred_Cuisine,
    cp.Preference_Count AS Demand,
    rc.Restaurant_Count AS Supply
FROM 
    (
        SELECT 
            Preferred_Cuisine,
            COUNT(*) AS Preference_Count
        FROM 
            Consumer_Preferences cp
        GROUP BY 
            Preferred_Cuisine
    ) AS cp
LEFT JOIN 
    (
        SELECT 
            Cuisine,
            COUNT(*) AS Restaurant_Count
        FROM 
            Restaurant_Cuisines rc
        GROUP BY 
            Cuisine
    ) AS rc ON cp.Preferred_Cuisine = rc.Cuisine
ORDER BY 
    cp.Preference_Count DESC;

SELECT * FROM Demand_Supply_Analysis; 

-- Demand-to-Supply ratio
SELECT Preferred_cuisine, demand, supply,
CASE 
        WHEN supply > 0 THEN ROUND(demand / supply, 2) 
        ELSE NULL
    END AS demand_supply_ratio
    FROM Demand_Supply_Analysis
    GROUP BY Preferred_cuisine, demand, supply
    ORDER BY demand_supply_ratio DESC;
    
    
-- Preferred cuisine by location   

SELECT
    cp.Preferred_Cuisine,
    SUM(CASE WHEN City = 'San Luis Potosi' THEN 1 ELSE 0 END) AS San_Luis_Potosi,
    SUM(CASE WHEN City = 'Ciudad Victoria' THEN 1 ELSE 0 END) AS Ciudad_Victoria,
    SUM(CASE WHEN City = 'Cuernavaca' THEN 1 ELSE 0 END) AS Cuernavaca,
    SUM(CASE WHEN City = 'Jiutepec' THEN 1 ELSE 0 END) AS Jiutepec
FROM
    Consumers c
JOIN
    Consumer_Preferences cp ON c.Consumer_ID = cp.Consumer_ID
WHERE
    City IN ('San Luis Potosi', 'Ciudad Victoria', 'Cuernavaca', 'Jiutepec')
GROUP BY
    cp.Preferred_Cuisine
ORDER BY
    San_Luis_Potosi DESC;
 
   
-- NUMBER OF RESTAURANTS IN EACH LOCATION
SELECT
    City,
    COUNT(*) AS Restaurant_Count
FROM
    Restaurants
GROUP BY
    City
ORDER BY
    Restaurant_Count DESC;


