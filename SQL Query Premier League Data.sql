select HomeTeam AS Team, AVG(FTHG) AS AVG_HomeGoals, AVG(FTAG) AS AVG_AwayGoals 
from dbo.E0$
GROUP BY HomeTeam;



SELECT 
    Team,
    SUM(HomeGoals) AS HomeGoals,
    SUM(AwayGoals) AS AwayGoals,
    SUM(HomeGoals) + SUM(AwayGoals) AS TotalGoals
FROM (
    SELECT 
        HomeTeam AS Team, 
        FTHG AS HomeGoals,
        0 AS AwayGoals
    FROM dbo.E0$
    UNION ALL
    SELECT 
        AwayTeam AS Team, 
        0 AS HomeGoals,
        FTAG AS AwayGoals
    FROM dbo.E0$
) AS Combined
GROUP BY Team
ORDER BY TotalGoals DESC;