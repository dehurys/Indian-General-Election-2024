
/*** Database Creation:
SQL Commands used to create the database and import the required datasets:
***/

CREATE DATABASE [2024 India General Election];

-- ===============================

/***
Data Inspection:
SQL commands to explore the structure of the tables:
***/

SELECT COLUMN_NAME, DATA_TYPE, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'constituencywise_details';

SELECT * FROM constituencywise_details;

SELECT COLUMN_NAME, DATA_TYPE, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'constituencywise_results';

SELECT * FROM constituencywise_results;

SELECT COLUMN_NAME, DATA_TYPE, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'partywise_results';

SELECT * FROM partywise_results;

SELECT COLUMN_NAME, DATA_TYPE, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'statewise_results';

SELECT * FROM statewise_results;

SELECT COLUMN_NAME, DATA_TYPE, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'states';

SELECT * FROM states;

/***
Descriptive Table Overview:
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
***/