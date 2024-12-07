/***
01. What is the total number of seats in the Indian Parliament?
***/

SELECT
	COUNT (DISTINCT (Parliament_Constituency)) AS 'India Parliament Constituency Seats'
FROM constituencywise_results;
-- ==============================================

/***
02. What is the total number of seats available in each State for the Indian General Elections 2024?
***/

SELECT
	st.State, COUNT(cr.Parliament_Constituency) AS total_seats_per_state
	FROM states st
JOIN statewise_results sr ON st.State_ID = sr.State_ID
JOIN constituencywise_results cr ON sr.Parliament_Constituency = cr.Parliament_Constituency
GROUP BY st.State;
-- ==============================================

/***
03. What is the total seats Won by NDA Alliance?
***/

WITH NDA_parties AS (
    SELECT Party_ID, Won
	FROM partywise_results
    WHERE Party IN ('Bharatiya Janata Party - BJP'
		, 'Telugu Desam - TDP'
		, 'Janata Dal  (United) - JD(U)'
		, 'Shiv Sena - SHS'
		, 'AJSU Party - AJSUP'
		, 'Apna Dal (Soneylal) - ADAL'
		, 'Asom Gana Parishad - AGP'
		, 'Hindustani Awam Morcha (Secular) - HAMS'
		, 'Janasena Party - JnP'
		, 'Janata Dal  (Secular) - JD(S)'
		, 'Lok Janshakti Party(Ram Vilas) - LJPRV'
		, 'Nationalist Congress Party - NCP'
		, 'Rashtriya Lok Dal - RLD'
		, 'Sikkim Krantikari Morcha - SKM')
)
, Constituency_agg AS (
    SELECT Party_ID, COUNT(DISTINCT (Constituency_ID)) AS Total_Seats
    FROM constituencywise_results
    GROUP BY Party_ID)
SELECT
    COUNT(NP.Party_ID) AS NDA_Allianz_Total_Parties
    , SUM(NP.Won) AS NDA_Allianz_Total_Seats_Won
    , (SELECT COUNT(DISTINCT (Constituency_ID)) FROM constituencywise_results) AS Total_Seats
FROM NDA_parties NP
JOIN Constituency_agg CA ON NP.Party_ID = CA.Party_ID;
-- ==============================================

/***
04. Seats Won by NDA Alliance Parties.
***/

SELECT 
    party as NDA_Alliance_Party_Name,
    won as Seats_Won
FROM partywise_results
    WHERE Party IN ('Bharatiya Janata Party - BJP'
		, 'Telugu Desam - TDP'
		, 'Janata Dal  (United) - JD(U)'
		, 'Shiv Sena - SHS'
		, 'AJSU Party - AJSUP'
		, 'Apna Dal (Soneylal) - ADAL'
		, 'Asom Gana Parishad - AGP'
		, 'Hindustani Awam Morcha (Secular) - HAMS'
		, 'Janasena Party - JnP'
		, 'Janata Dal  (Secular) - JD(S)'
		, 'Lok Janshakti Party(Ram Vilas) - LJPRV'
		, 'Nationalist Congress Party - NCP'
		, 'Rashtriya Lok Dal - RLD'
		, 'Sikkim Krantikari Morcha - SKM')
ORDER BY 2 DESC;
-- ==============================================

/***
05. What is the total seats Won by INDIA Alliance.
***/

WITH INDIA_parties AS (
    SELECT Party_ID, Won
	FROM partywise_results
    WHERE Party IN ('Indian National Congress - INC'
		, 'Aam Aadmi Party - AAAP'
		, 'All India Trinamool Congress - AITC'
		, 'Bharat Adivasi Party - BHRTADVSIP'
		, 'Communist Party of India  (Marxist) - CPI(M)'
		, 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)'
		, 'Communist Party of India - CPI'
		, 'Dravida Munnetra Kazhagam - DMK'
		, 'Indian Union Muslim League - IUML'
		, 'Nat`Jammu & Kashmir National Conference - JKN'
		, 'Jharkhand Mukti Morcha - JMM'
		, 'Jammu & Kashmir National Conference - JKN'
		, 'Kerala Congress - KEC'
		, 'Marumalarchi Dravida Munnetra Kazhagam - MDMK'
		, 'Nationalist Congress Party Sharadchandra Pawar - NCPSP'
		, 'Rashtriya Janata Dal - RJD'
		, 'Rashtriya Loktantrik Party - RLTP'
		, 'Revolutionary Socialist Party - RSP'
		, 'Samajwadi Party - SP'
		, 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT'
		, 'Viduthalai Chiruthaigal Katchi - VCK')
)
, Constituency_agg AS (
    SELECT Party_ID, COUNT(DISTINCT (Constituency_ID)) AS Total_Seats
    FROM constituencywise_results
    GROUP BY Party_ID)
SELECT
    COUNT(IP.Party_ID) AS INDIA_Allianz_Total_Parties
    , SUM(IP.Won) AS INDIA_Allianz_Total_Seats_Won
    , (SELECT COUNT(DISTINCT (Constituency_ID)) FROM constituencywise_results) AS Total_Seats
FROM INDIA_parties IP
JOIN Constituency_agg CA ON IP.Party_ID = CA.Party_ID;
-- ==============================================

/***
06. Seats Won by INDIA Alliance Parties.
***/

SELECT 
    party as INDIA_Alliance_Party_Name,
    won as Seats_Won
FROM 
    partywise_results
    WHERE Party IN ('Indian National Congress - INC'
		, 'Aam Aadmi Party - AAAP'
		, 'All India Trinamool Congress - AITC'
		, 'Bharat Adivasi Party - BHRTADVSIP'
		, 'Communist Party of India  (Marxist) - CPI(M)'
		, 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)'
		, 'Communist Party of India - CPI'
		, 'Dravida Munnetra Kazhagam - DMK'
		, 'Indian Union Muslim League - IUML'
		, 'Nat`Jammu & Kashmir National Conference - JKN'
		, 'Jharkhand Mukti Morcha - JMM'
		, 'Jammu & Kashmir National Conference - JKN'
		, 'Kerala Congress - KEC'
		, 'Marumalarchi Dravida Munnetra Kazhagam - MDMK'
		, 'Nationalist Congress Party Sharadchandra Pawar - NCPSP'
		, 'Rashtriya Janata Dal - RJD'
		, 'Rashtriya Loktantrik Party - RLTP'
		, 'Revolutionary Socialist Party - RSP'
		, 'Samajwadi Party - SP'
		, 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT'
		, 'Viduthalai Chiruthaigal Katchi - VCK')
ORDER BY 2 DESC;
-- ==============================================

/***
07. Add a new column / field in table "partywise_results" to get the Party Alliance as NDA, INDIA and OTHER
***/

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

UPDATE partywise_results
SET party_alliance = 
    CASE 
        WHEN party IN ('Bharatiya Janata Party - BJP'
            , 'Telugu Desam - TDP'
            , 'Janata Dal  (United) - JD(U)'
            , 'Shiv Sena - SHS'
            , 'AJSU Party - AJSUP'
            , 'Apna Dal (Soneylal) - ADAL'
            , 'Asom Gana Parishad - AGP'
            , 'Hindustani Awam Morcha (Secular) - HAMS'
            , 'Janasena Party - JnP'
            , 'Janata Dal  (Secular) - JD(S)'
            , 'Lok Janshakti Party(Ram Vilas) - LJPRV'
            , 'Nationalist Congress Party - NCP'
            , 'Rashtriya Lok Dal - RLD'
            , 'Sikkim Krantikari Morcha - SKM'
        ) THEN 'NDA'
        WHEN party IN ('Indian National Congress - INC'
            , 'Aam Aadmi Party - AAAP'
            , 'All India Trinamool Congress - AITC'
            , 'Bharat Adivasi Party - BHRTADVSIP'
            , 'Communist Party of India  (Marxist) - CPI(M)'
            , 'Communist Party of India  (Marxist-Leninist) (Liberation) - CPI(ML)(L)'
            , 'Communist Party of India - CPI'
            , 'Dravida Munnetra Kazhagam - DMK'
            , 'Indian Union Muslim League - IUML'
            , 'Jammu & Kashmir National Conference - JKN'
            , 'Jharkhand Mukti Morcha - JMM'
            , 'Kerala Congress - KEC'
            , 'Marumalarchi Dravida Munnetra Kazhagam - MDMK'
            , 'Nationalist Congress Party Sharadchandra Pawar - NCPSP'
            , 'Rashtriya Janata Dal - RJD'
            , 'Rashtriya Loktantrik Party - RLTP'
            , 'Revolutionary Socialist Party - RSP'
            , 'Samajwadi Party - SP'
            , 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT'
            , 'Viduthalai Chiruthaigal Katchi - VCK'
        ) THEN 'INDIA'
        ELSE 'OTHER'
    END;
-- ==============================================

/***
08. Which party alliance (NDA, INDIA or OTHER) won most seats across all States?
***/

SELECT 
	pr.party_alliance, COUNT(cr.Parliament_Constituency) Seats_Won
	FROM partywise_results pr
JOIN constituencywise_results cr ON pr.Party_ID = cr.Party_ID
where pr.party_alliance IN ('NDA', 'INDIA', 'OTHER')
GROUP BY pr.party_alliance
ORDER BY 2 DESC;
-- ==============================================

/***
09. Winning candidate's name, their party name, party alliance name, total votes, and the margin of victory for a specific State and Constituency? (Eg. State = 'Uttar Pradesh')
***/

SELECT
	s.State, cr.Constituency_Name
	FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh';

SELECT
	cr.Winning_Candidate, pr.Party, pr.party_alliance
	, FORMAT(cr.Total_Votes, 'N0', 'en-IN') AS Total_Votes
	, FORMAT(cr.Margin, 'N0', 'en-IN') AS Margin
	, s.State, cr.Constituency_Name
	FROM partywise_results pr
JOIN constituencywise_results cr ON pr.Party_ID = cr.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh' AND cr.Constituency_Name = 'ETAH';
-- ==============================================

/***
Q10. What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
***/

SELECT
	DISTINCT Constituency_Name
	FROM constituencywise_results
WHERE Constituency_Name LIKE 'D%';

SELECT
	cd.Candidate, cd.Party
	, FORMAT(cd.EVM_Votes, 'N0', 'en-IN') AS EVM_Votes
	, FORMAT(cd.Postal_Votes, 'N0', 'en-IN') AS Postal_Votes
	, FORMAT(cd.Total_Votes, 'N0', 'en-IN') AS Total_Votes
	, cr.Constituency_Name
	FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cr.Constituency_Name='DURG'
ORDER BY 5 DESC;
-- ==============================================

/***
11. Which parties won the most seats in a State, and how many seats did each party win? (Eg. State = 'Andhra Pradesh')
***/

SELECT
	pr.Party, COUNT(cr.Constituency_ID) AS Seats_Won
	FROM partywise_results pr
JOIN constituencywise_results cr ON pr.Party_ID = cr.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Andhra Pradesh'
GROUP BY pr.Party
ORDER BY 2 DESC;
-- ==============================================

/***
Q 12. What is the total number of seats won by each party alliance (NDA, INDIA, and OTHER) in each state for the India General Election 2024
***/

SELECT
	st.State
	, SUM(CASE WHEN pr.party_alliance='NDA' THEN 1 ELSE NULL END) AS NDA_Seats_Won
	, SUM(CASE WHEN pr.party_alliance='INDIA' THEN 1 ELSE NULL END) AS INDIA_Seats_Won
	, SUM(CASE WHEN pr.party_alliance='OTHER' THEN 1 ELSE NULL END) AS OTHER_Seats_Won
	FROM states st
JOIN statewise_results sr ON st.State_ID = sr.State_ID
JOIN constituencywise_results cr ON sr.Parliament_Constituency = cr.Parliament_Constituency
JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
-- WHERE pr.party_alliance IN ('NDA', 'INDIA', 'OTHER')
WHERE st.State IN ('Assam', 'Bihar')
GROUP BY st.State
ORDER BY st.State;

-- OR --

WITH Party_Alliance_Winnings AS (
    SELECT st.State
        , SUM(CASE WHEN pr.Party_Alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Won_Seats
        , SUM(CASE WHEN pr.Party_Alliance = 'INDIA' THEN 1 ELSE 0 END) AS INDIA_Won_Seats
        , SUM(CASE WHEN pr.Party_Alliance = 'OTHER' THEN 1 ELSE 0 END) AS Other_Won_Seats
    FROM states st
    JOIN statewise_results sr ON st.State_ID = sr.State_ID
    JOIN constituencywise_results cr ON sr.Parliament_Constituency = cr.Parliament_Constituency
    JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
    -- WHERE st.State IN ('Assam', 'Bihar')
    GROUP BY st.State
)
SELECT PAW.*
    , (SELECT COUNT(DISTINCT sr.Parliament_Constituency)
       FROM statewise_results sr
       WHERE sr.State_ID = (
	SELECT st2.State_ID FROM states st2 WHERE st2.State = PAW.State)
      ) AS Total_Constituencies
FROM Party_Alliance_Winnings PAW;
-- ==============================================

/***
Q 13. Which candidate received the highest number of EVM votes in each constituency (Top 10)?
***/

SELECT TOP 10
cd.Constituency_ID, cr.Constituency_Name, cd.Candidate
, FORMAT(cd.EVM_Votes, 'N0', 'en-IN') AS EVM_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cd.EVM_Votes = (
	SELECT MAX(cd1.EVM_Votes)
	FROM constituencywise_details cd1
	WHERE cd1.Constituency_ID = cd.Constituency_ID)
ORDER BY 4 DESC;
-- ==============================================

/***
Q 14. Which candidate won and which candidate was the runner-up in each constituency (any given State) for the 2024 Indian General Election? (Eg. State = 'Gujarat')
***/

WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID
        , cd.Candidate
	, ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.Total_Votes DESC) AS VoteRank
    FROM constituencywise_details cd
    JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN states st ON sr.State_ID = st.State_ID
    WHERE st.State = 'Gujarat'
)
SELECT 
    cr.Constituency_Name
    , MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate
    , MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM RankedCandidates rc
JOIN constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY cr.Constituency_Name
ORDER BY 1;

-- OR --

WITH ElectionResultsRank AS (
    SELECT
        st.State,
        cr.Constituency_Name,
        cd.Candidate,
        cd.Party,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.Total_Votes DESC) AS Rank_Position
    FROM states st
    JOIN statewise_results sr ON st.State_ID = sr.State_ID
    JOIN constituencywise_results cr ON sr.Parliament_Constituency = cr.Parliament_Constituency
    JOIN constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
)
SELECT
    ER.State,
    ER.Constituency_Name,
    MAX(CASE WHEN ER.Rank_Position = 1 THEN ER.Candidate END) AS Winner,
    MAX(CASE WHEN ER.Rank_Position = 1 THEN ER.Party END) AS Winner_Party,
    MAX(CASE WHEN ER.Rank_Position = 2 THEN ER.Candidate END) AS Runner_Up,
    MAX(CASE WHEN ER.Rank_Position = 2 THEN ER.Party END) AS Runner_Up_Party
FROM ElectionResultsRank ER
-- WHERE ER.State = 'Gujarat'
WHERE ER.State = 'Gujarat'  -- Add this condition to filter by state if needed
GROUP BY ER.State, ER.Constituency_Name
ORDER BY 1, 2;
-- ==============================================

/***
Q 15. Finde total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes for any given State? (Eg. State = 'Maharashtra')
***/

SELECT 
	COUNT(DISTINCT(cd.Constituency_ID)) AS Total_Seats
	, COUNT(DISTINCT(cd.Candidate)) AS Total_Candidate
	, COUNT(DISTINCT(pr.Party)) AS Total_Parties
	, FORMAT(SUM(cd.EVM_Votes+cd.Postal_Votes), 'N0', 'en-IN') AS Total_Votes
	, FORMAT(SUM(cd.EVM_Votes), 'N0', 'en-IN') AS Total_EVM_Votes
	, FORMAT(SUM(cd.Postal_Votes), 'N0', 'en-IN') AS Total_Postal_Votes
	FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Maharashtra';
-- ==============================================