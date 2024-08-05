=============================================================================================================================================================================
55.List the Emps whose Sal is > the total remuneration of the SALESMAN.

mysql> SELECT empno,ename,job,sal FROM empy WHERE sal > (SELECT sum(sal + IFNULL(COMM,0)) FROM empy WHERE job = 'salesman');
Empty set (0.00 sec)

#List the Emps whose Sal is > the total remuneration of the CLERK#

mysql> SELECT empno,ename,job,sal FROM empy WHERE sal > (SELECT sum(sal + IFNULL(COMM,0)) FROM empy WHERE job = 'clerk');
+-------+-------+-----------+------+
| empno | ename | job       | sal  |
+-------+-------+-----------+------+
|  7839 | KING  | PRESIDENT | 5000 |
+-------+-------+-----------+------+
1 row in set (0.00 sec)

==============================================================================================================================================================================
56.List the emps who are senior to BLAKE working at CHICAGO & BOSTON.

mysql> SELECT e.empno,e.ename,e.job,e.hiredate,d.dname,d.loc FROM empy e JOIN dept d ON e.deptno = d.deptno WHERE e.hiredate < (SELECT hiredate FROM empy WHERE ename='blake') AND d.loc IN ('chicago','boston');
+-------+-------+----------+------------+-------+---------+
| empno | ename | job      | hiredate   | dname | loc     |
+-------+-------+----------+------------+-------+---------+
|  7499 | ALLEN | SALESMAN | 1981-02-20 | SALES | CHICAGO |
|  7521 | WARD  | SALESMAN | 1981-02-22 | SALES | CHICAGO |
+-------+-------+----------+------------+-------+---------+
2 rows in set (0.00 sec)

==============================================================================================================================================================================
57.List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and RESEARCH whose Sal is more than ALLEN and exp more than SMITH in the asc order of EXP.

mysql> SELECT e.empno,e.ename,e.job,e.sal,e.grade,e.hiredate,(DATEDIFF(CURDATE(),e.hiredate)/365) AS exp FROM empy e JOIN dept d ON e.deptno=d.deptno WHERE e.grade IN (3,4) AND d.dname IN ('accounting','research')
    -> AND D.DNAME IN ('accounting','research')
    -> AND e.sal> (SELECT sal FROM empy WHERE ename = 'allen')
    ->  AND (DATEDIFF(CURDATE(), e.hiredate)/365) > ( SELECT DATEDIFF(CURDATE(), hiredate)/365  FROM empy WHERE ename = 'smith' )  ORDER BY exp ASC;
Empty set (0.00 sec)

==============================================================================================================================================================================

58.List the emps whose jobs same as SMITH or ALLEN.

mysql> SELECT empno, ename, job, sal  FROM empy WHERE job IN ( SELECT job FROM empy WHERE ename IN ('smith', 'allen')  );
+-------+--------+----------+------+
| empno | ename  | job      | sal  |
+-------+--------+----------+------+
|  7369 | SMITH  | CLERK    |  800 |
|  7499 | ALLEN  | SALESMAN | 1600 |
|  7521 | WARD   | SALESMAN | 1250 |
|  7654 | MARTIN | SALESMAN | 1250 |
|  7844 | TURNER | SALESMAN | 1500 |
|  7876 | ADAMS  | CLERK    | 1100 |
|  7900 | JAMES  | CLERK    |  950 |
|  7934 | MILLER | CLERK    | 1300 |
+-------+--------+----------+------+
8 rows in set (0.00 sec)

==============================================================================================================================================================================
59.Write a Query to display the details of emps whose Sal is same as of Any jobs of deptno 10 those that are not found in deptno 20.

mysql> SELECT e.empno, e.ename, e.job, e.sal, e.deptno FROM empy e WHERE e.sal IN (SELECT DISTINCT e1.sal FROM empy e1 WHERE e1.deptno = 10 AND e1.job NOT IN (SELECT
 e2.job FROM empy e2 WHERE e2.deptno = 20 ));
+-------+-------+-----------+------+--------+
| empno | ename | job       | sal  | deptno |
+-------+-------+-----------+------+--------+
|  7839 | KING  | PRESIDENT | 5000 |     10 |
+-------+-------+-----------+------+--------+
1 row in set (0.00 sec)

==============================================================================================================================================================================
60.List of emps of emp1 who are not found in emp2.
=============================================================================================================================================================================
61. Find the highest sal of EMP table.
mysql>  SELECT MAX(sal) AS Highest_Salary FROM empy;
+----------------+
| Highest_Salary |
+----------------+
|           5000 |
+----------------+

