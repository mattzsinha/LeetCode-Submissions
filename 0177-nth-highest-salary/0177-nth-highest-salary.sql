CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select max(salary) from 
  (select id, salary, dense_rank() over (order by salary desc) as the_rank
   from Employee) as inner_query
   where the_rank = N
      # Write your MySQL query statement below.
  );
END