# Netflix Movies & TV Shows Data Analysis Using SQL

## Overview

This project focuses on analyzing the **Netflix Movies and TV Shows dataset using PostgreSQL** to uncover meaningful insights about Netflix's content library.

The analysis uses SQL techniques such as **aggregation, filtering, grouping, string manipulation, Common Table Expressions (CTEs), window functions, ranking, and date functions** to answer real-world business questions.

The project demonstrates how SQL can be used to transform raw data into actionable insights for content analysis and decision-making.

---

## Objectives

The primary objectives of this project are to:

- Analyze the distribution of **Movies and TV Shows** available on Netflix.
- Identify the **most common content ratings** across different content types.
- Analyze Netflix content based on **release year and date added**.
- Explore content distribution across different **countries**.
- Analyze **movie durations and TV show seasons**.
- Identify content based on specific **actors, directors, genres, and keywords**.
- Use advanced SQL techniques to answer business-oriented questions.
- Extract meaningful insights that can support **content strategy and decision-making**.

---

## Dataset

The dataset contains information about Netflix's movies and TV shows, including:

- Show ID
- Content Type
- Title
- Director
- Cast
- Country
- Date Added
- Release Year
- Rating
- Duration
- Genres
- Description

---

## Database & Technologies

- **Database:** PostgreSQL
- **Language:** SQL
- **Tool:** pgAdmin 4
- **Dataset:** Netflix Movies and TV Shows Dataset

---

## Database Schema

```sql
DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix
(
    show_id       VARCHAR(5),
    type          VARCHAR(10),
    title         VARCHAR(250),
    director      VARCHAR(550),
    casts         VARCHAR(1050),
    country       VARCHAR(550),
    date_added    VARCHAR(55),
    release_year  INT,
    rating        VARCHAR(15),
    duration      VARCHAR(15),
    listed_in     VARCHAR(250),
    description   VARCHAR(550)
);
```

## Learning Outcomes

Through this project, I strengthened my understanding of:

PostgreSQL and relational databases
Data exploration using SQL
Aggregation and grouping
String and date manipulation
CTEs and window functions
Ranking and partitioning
Translating business questions into SQL queries
Extracting actionable insights from real-world datasets

## Conclusion

This project demonstrates the use of PostgreSQL and SQL for real-world data analysis. By transforming and querying the Netflix dataset, meaningful insights can be extracted regarding content types, ratings, genres, countries, release trends, and other content characteristics.

The project also provides practical experience with both fundamental and advanced SQL techniques, making it a useful demonstration of SQL and data-analysis skills.

## Author 
Kanishka Rani
kanishka22043@gmail.com


## Acknowledgement

This project was created as part of my learning and practical application of SQL and data analysis using PostgreSQL.

Thank you for visiting this project!
