# Write your MySQL query statement below
with total_no_player as 
(select count(distinct player_id) as total_players
from Activity),

total_within_oneday_active_players as 
(select player_id, event_date, datediff(event_date, min(event_date) over (partition by player_id order by event_date)) as next_days_login
from Activity)

select round((select count(distinct player_id) from total_within_oneday_active_players where next_days_login = 1)/total_players,2) as fraction
from total_no_player, total_within_oneday_active_players
limit 1;

