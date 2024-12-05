# Indian General Election 2024 SQL Project

## Introduction
SQL (Structured Query Language) has been a cornerstone for managing and querying relational databases, especially when dealing with large datasets. In this project, SQL is used to explore insights from the Indian General Election 2024. The project highlights how SQL can effectively solve various business problems by querying election results using simple yet powerful functions.

## Table of Contents
1. [Overview](#1-overview)
2. [Business Problems Solved](#2-business-problems-solved)
3. [Project Structure](#3-project-structure)
4. [Key SQL Queries](#4-key-sql-queries)
5. [Appendix](#5-appendix-sql-table-structure)
6. [Conclusion](#6-conclusion)

---

## 1. Overview
This project aims to showcase the power of SQL by solving real-world business problems using the results of the Indian General Election 2024 dataset. The insights are derived from the election data, showing seat distribution across states, party alliances, and the results of various parties.

The data is stored in multiple tables, and the solution uses SQL queries to perform operations like aggregations, joins, and case-based updates to explore the election results.

---

## 2. Business Problems Solved
Here are the key business problems addressed in this project:

1. **Total Number of Parliament Constituency Seats**
   - How many parliamentary constituency seats were contested in the 2024 General Election?

2. **Total Number of Seats per State**
   - What is the total number of seats available for each state in the General Election?

3. **Assigning Party Alliances**
   - How can we categorize political parties into alliances like NDA, INDIA, and OTHER using SQL queries?

4. **Total Seats Won by NDA**
   - How many seats were won by the NDA alliance?

---

## 3. Project Structure

The project consists of the following key components:

### Database Creation
SQL Commands used to create the database and import the required datasets:

```sql
CREATE DATABASE [2024 India General Election];
```
Data Inspection

SQL commands to explore the structure of the tables:

```sql
SELECT COLUMN_NAME, DATA_TYPE, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'constituencywise_details';
```

Descriptive Table Overview

The project uses the following 5 tables:

1. constituencywise_details: Contains details about each parliamentary constituency.

    Key Columns: Constituency_ID, Candidate, Party, EVM_Votes, etc.

2. constituencywise_results: Stores election results for each parliamentary constituency.

    Key Columns: Constituency_ID, Party_ID, Parliament_Constituency, Winning_Candidate, etc.

3. statewise_results: Includes aggregated election results by state.

    Key Columns: State_ID, State, Leading_Candidate, Trailing_Candidate, Margin, etc.

4. partywise_results: Contains results for each party by parliamentary constituency.

    Key Columns: Party_ID, Party, Party_Alliance, etc.

5. states: Stores information about states, including state IDs and names.

    Key Columns: State_ID, State_Name.

4. Key SQL Queries
Query 1: Total Parliament Constituency Seats

To calculate the total number of parliamentary constituency seats in the 2024 election:

```sql
SELECT COUNT (DISTINCT Constituency_ID) AS 'India Parliament Constituency Seats'
	FROM constituencywise_results;
```

    Data preview:

Parliament Constituency Seats
Query 2: Total Seats per State

To find out how many seats are available in each state:

```sql
SELECT State_Name, COUNT(DISTINCT Constituency_ID) AS 'Total Seats'
FROM constituencywise_results
GROUP BY State_Name;
```

Data preview: 



5. Appendix: SQL Table Structure

To preview the structure of the dataset used in this project, the following SQL queries can be executed to explore the columns and data in each table.

```sql
-- View all columns in constituencywise_details
SELECT * FROM constituencywise_details;

-- View all columns in constituencywise_results
SELECT * FROM constituencywise_results;

-- View all columns in statewise_results
SELECT * FROM statewise_results;

-- View all columns in partywise_results
SELECT * FROM partywise_results;

-- View all columns in states
SELECT * FROM states;
```

6. Conclusion

This project demonstrates the practical application of SQL in solving business-related questions using real-world election data. SQL's flexibility in data handling and querying is shown through the insights derived from the Indian General Election 2024. Whether dealing with seat counts, alliances, or overall election results, SQL provides a straightforward yet powerful tool for uncovering key election insights.

↑ Back to Top
