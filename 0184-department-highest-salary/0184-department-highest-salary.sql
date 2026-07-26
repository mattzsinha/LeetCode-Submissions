# Write your MySQL query statement below
with sal_info as (
select d.name as Department, e.name as Employee, e.salary as Salary,
dense_rank() over (partition by e.departmentId order by salary desc) as the_rank
from Employee e join Department d on e.departmentId = d.id)

select Department, Employee, Salary
from sal_info
where the_rank = 1;