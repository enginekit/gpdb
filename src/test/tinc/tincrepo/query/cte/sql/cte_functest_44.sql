-- @author prabhd 
-- @created 2013-02-01 12:00:00 
-- @modified 2013-02-01 12:00:00 
-- @tags cte HAWQ 
-- @product_version gpdb: [4.3-],hawq: [1.1-]
-- @db_name world_db
-- @description test24a: CTE with CSQ [ANY]

WITH newfoo AS (SELECT * FROM foo WHERE foo.a = any (SELECT bar.d FROM bar WHERE bar.d = foo.a) ORDER BY 1,2)
SELECT foo.a,newfoo.b FROM foo,newfoo WHERE foo.a = newfoo.a ORDER BY 1;



