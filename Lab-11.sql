SELECT * FROM STU_INFO;

INSERT INTO RESULT VALUES(107 , 8.9);

CREATE TABLE EMPLOYEE_MASTER(
	EMPLOYEENO VARCHAR(10),
	NAME VARCHAR(10),
	MANAGERNO VARCHAR(10),
);

INSERT INTO EMPLOYEE_MASTER VALUES('E01' , 'TARUN' , 'NULL');
INSERT INTO EMPLOYEE_MASTER VALUES('E02' , 'ROHAN' , 'E02');
INSERT INTO EMPLOYEE_MASTER VALUES('E03' , 'PRIYA' , 'E01');
INSERT INTO EMPLOYEE_MASTER VALUES('E04' , 'MILAN' , 'E03');
INSERT INTO EMPLOYEE_MASTER VALUES('E05' , 'JAY' , 'E01');
INSERT INTO EMPLOYEE_MASTER VALUES('E06' , 'ANJANA' , 'E04');

SELECT * FROM EMPLOYEE_MASTER;
SELECT * FROM STU_INFO;
SELECT * FROM RESULT;

INSERT INTO STU_INFO VALUES(106 , 'MAHESH' , 'ME');


--------------------------------------PART-A--------------------------------------

--1. Combine information from student and result table using cross join or Cartesian product.

SELECT * FROM STU_INFO AS T1 CROSS JOIN RESULT AS T2;

--2. Perform inner join on Student and Result tables.SELECT * FROM STU_INFO AS T1 INNER JOIN RESULT AS T2 ON T1.RNO = T2.RNO;--3. Perform the left outer join on Student and Result tables.SELECT * FROM STU_INFO AS T1 LEFT OUTER JOIN RESULT AS T2 ON T1.RNO = T2.RNO;--4. Perform the right outer join on Student and Result tables.SELECT * FROM STU_INFO AS T1 RIGHT OUTER JOIN RESULT AS T2 ON T1.RNO = T2.RNO;--5. Perform the full outer join on Student and Result tables. SELECT * FROM STU_INFO AS T1 FULL OUTER JOIN RESULT AS T2 ON T1.RNO = T2.RNO;--6. Display Rno, Name, Branch and SPI of all students.SELECT T1.RNO , T1.NAME , T1.BRANCH , T2.SPI FROM STU_INFO AS T1 JOIN RESULT AS T2 ON T1.RNO = T2.RNO;--7. Display Rno, Name, Branch and SPI of CE branch’s student only.SELECT T1.RNO , T1.NAME , T1.BRANCH , T2.SPI FROM STU_INFO AS T1 JOIN RESULT AS T2 ON T1.RNO = T2.RNOWHERE T1.BRANCH = 'CE';--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.SELECT T1.RNO , T1.NAME , T1.BRANCH , T2.SPI FROM STU_INFO AS T1 JOIN RESULT AS T2 ON T1.RNO = T2.RNOWHERE T1.BRANCH <> 'EC';--9. Display average result of each branch.SELECT AVG(T2.SPI) AS AVG_SPI FROM STU_INFO AS T1 JOIN RESULT AS T2 ON T1.RNO = T2.RNO;--10. Display average result of CE and ME branch.SELECT AVG(T2.SPI) AS AVG_SPI FROM STU_INFO AS T1 JOIN RESULT AS T2 ON T1.RNO = T2.RNO WHERE T1.BRANCH IN ('CE' , 'ME');----------------------------------------PART-B-------------------------------------------1. Display average result of each branch and sort them in ascending order by SPI.SELECT AVG(T2.SPI) AS AVG_SPI FROM STU_INFO AS T1 JOIN RESULT AS T2 ON T1.RNO = T2.RNO GROUP BY T1.BRANCH ORDER BY AVG(T2.SPI);--2. Display highest SPI from each branch and sort them in descending order.SELECT MAX(T2.SPI) AS AVG_SPI FROM STU_INFO AS T1 JOIN RESULT AS T2 ON T1.RNO = T2.RNO GROUP BY T1.BRANCH ORDER BY MAX(T2.SPI) DESC;------------------------------------------PART-C--------------------------------------------------1. Retrieve the names of employee along with their manager’s name from the Employee table.SELECT T1.NAME AS EMPLOYEE , T2.NAME AS MANAGER FROM EMPLOYEE_MASTER AS T1 JOIN EMPLOYEE_MASTER AS T2 ON T1.MANAGERNO = T2.EMPLOYEENO;   