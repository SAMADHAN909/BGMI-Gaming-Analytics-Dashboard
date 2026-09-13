# 🎮 BGMI Data Analysis Dashboard — SQL & Power BI

## 📌 Project Overview

This project is an end-to-end **BGMI (Battlegrounds Mobile India) Data Analysis Project** developed using **SQL and Microsoft Power BI**.

The objective of this project is to analyze player performance, match types, kills, damage, assists, revives, headshots, movement, weapons and other gameplay metrics to generate meaningful insights through an interactive Power BI dashboard.

---

## 🛠️ Tools & Technologies

- **SQL** – Data analysis, transformation and KPI calculations
- **Microsoft Power BI** – Interactive dashboard and data visualization
- **Excel/CSV** – Dataset source
- **DAX** – Measures and calculated KPIs

---

## 📊 Dashboard Pages

### 1️⃣ Executive Overview

Provides a high-level overview of BGMI gameplay data.

**Key KPIs:**
- Total Players
- Total Matches
- Total Kills
- Total Damage
- Average Kills
- Average Win %

**Visualizations:**
- Matches by Match Type
- Kills by Match Type
- Damage by Match Type
- Kill vs Win %
- Kill Place Distribution

---

### 2️⃣ Player Performance

Analyzes individual player performance.

**Key KPIs:**
- Total Headshots
- Total Assists
- Total Revives
- Total DBNOs
- Highest Kills
- Longest Kill

**Visualizations:**
- Headshot Distribution
- Top 10 Players by Kills
- Top 10 Players by Damage
- Player Performance Table
- Kill Streak Analysis

---

### 3️⃣ Gameplay Analysis

Analyzes player gameplay behavior and movement.

**Key KPIs:**
- Total Heals
- Total Boosts
- Total Walk Distance
- Total Road Kills
- Vehicle Destroys

**Visualizations:**
- Match Duration by Match Type
- Weapons by Match Type
- Walk vs Ride Distance
- Gameplay Performance
- Heals vs Boosts

---

## 🔍 SQL Analysis

SQL was used to perform data analysis and prepare the data for visualization.

### Key SQL Operations

- Data cleaning
- NULL value handling
- Aggregations
- GROUP BY analysis
- COUNT and COUNT DISTINCT
- SUM and AVG calculations
- ROUND calculations
- CASE statements
- Ranking analysis
- Top player identification
- Match-type analysis
- KPI calculations

Example:

```sql
SELECT 
    matchType,
    COUNT(*) AS total_matches,
    SUM(kills) AS total_kills,
    SUM(damageDealt) AS total_damage,
    AVG(winPlacePerc) AS avg_win_percentage
FROM bgmi_data
GROUP BY matchType
ORDER BY total_kills DESC;
