CREATE TABLE BGMI(
 Id VARCHAR(50),
    groupId VARCHAR(50),
    matchId VARCHAR(50),
    assists INT,
    boosts INT,
    damageDealt DECIMAL(10,2),
    DBNOs INT,
    headshotKills INT,
    heals INT,
    killPlace INT,
    killPoints INT,
    kills INT,
    killStreaks INT,
    longestKill DECIMAL(10,2),
    matchDuration INT,
    matchType VARCHAR(50),
    maxPlace INT,
    numGroups INT,
    rankPoints INT,
    revives INT,
    rideDistance DECIMAL(10,2),
    roadKills INT,
    swimDistance DECIMAL(10,2),
    teamKills INT,FF
    vehicleDestroys INT,
    walkDistance DECIMAL(10,2),
    weaponsAcquired INT,
    winPoints INT,
    winPlacePerc DECIMAL(10,6)
)

SELECT * FROM BGMI

 --- MAIN KPIS ---

SELECT COUNT(DISTINCT ID) AS TOTAL_PLYARE,
         COUNT(DISTINCT groupId) AS TOTAL_MATCHES,
		 SUM( kills) AS TOTAL_KILLS,
          		 SUM( damageDealt) AS TOTAL_DAMAGE,
          		 SUM( assists) AS TOTAL_ASSIST,
				   SUM(headshotKills) AS TOTAL_HEADSHOT,
				   SUM(revives) AS TOTAL_REVIVES,
				   AVG(kills) AS AVG_KILLS,
				   AVG(headshotKills) AS AVG_HEADSHOT
				   FROM BGMI 


 --- MATCH TYPE ANALYSIS  ---

SELECT MATCHTYPE, 
                
			COUNT(DISTINCT groupId) AS TOTAL_MATCHES,
            SUM(KILLS) AS TOTAL_KILLS,
			ROUND(AVG(KILLS)::NUMERIC,2) AS AVG_DAMAGE,
			ROUND(AVG(winPlacePerc)::NUMERIC,2) AS AVG_WIN
			FROM BGMI
			GROUP BY MATCHTYPE
			ORDER BY MATCHTYPE DESC

 ---  TOP 10 PLAYERS BY KILL ---

SELECT ID, SUM(KILLS) AS TOTAL_KILLS,
           ROUND(SUM(damageDealt)::NUMERIC,2) AS TOTAL_DAMAGE,
		   SUM(headshotKills) AS TOTAL_HEADSHOT,
		  SUM(revives) AS TOTAL_REVIVES,
       	 SUM( assists) AS TOTAL_ASSIST
			FROM BGMI
			GROUP BY ID
			ORDER BY TOTAL_KILLS DESC
			LIMIT 10

 --- GAMEPLAY ANALYSIS ---

SELECT MATCHTYPE,
       SUM(HEALS) AS TOTAL_HEALS,
	   SUM(BOOSTS) AS TOTAL_BOOTS,
	   ROUND(SUM(WALKDISTANCE)::NUMERIC,2) AS TOTAL_WALK_DISTANCE,
	   SUM(WEAPONSACQUIRED)AS TOTAL_WEAPON,
	   SUM(ROADKILLS)AS TOTAL_ROAD_KILLS
	   FROM BGMI
	   GROUP BY MATCHTYPE
	   ORDER BY TOTAL_HEALS DESC