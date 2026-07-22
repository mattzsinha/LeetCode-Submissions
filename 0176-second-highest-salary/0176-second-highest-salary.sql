# Write your MySQL query statement below
with ranked_salaries as (select id, salary, dense_rank() over (order by salary desc) as the_rank
from Employee)

select max(salary) as SecondHighestSalary from ranked_salaries
where the_rank = 2;