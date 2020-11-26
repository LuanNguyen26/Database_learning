CREATE DATABASE ORG;
GO
USE ORG;

create table Worker(
	WORKER_ID int not null primary key,
	FIRST_NAME char(25),
	LAST_NAME char(25),
	SALARY int,
	JOINING_DATE Datetime,
	DEPARTMENT char(25),
);
SET DATEFORMAT MDY
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(1, 'Monika', 'Arora', 100000, '02-20-2014', 'HR'),
		(2, 'Niharika', 'Verma', 80000, '06-11-2014', 'Admin'),
		(3, 'Vishal', 'Singhal', 300000, '02-20-2014', 'HR'),
		(4, 'Amitabh', 'Singh', 500000, '02-20-2014', 'Admin'),
		(5, 'Vivek', 'Bhati', 500000, '06-11-2014', 'Admin'),
		(6, 'Vipul', 'Diwan', 200000, '06-11-2014', 'Account'),
		(7, 'Satish', 'Kumar', 75000, '01-20-2014', 'Account'),
		(8, 'Geetika', 'Chauhan', 90000, '04-11-2014', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	PRIMARY KEY (WORKER_REF_ID,BONUS_AMOUNT, BONUS_DATE),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(1, 5000, '02-20-2016'),
		(2, 3000, '06-11-2016'),
		(3, 4000, '02-20-2016'),
		(1, 4500, '02-20-2016'),
		(2, 3500, '06-11-2016');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	PRIMARY KEY (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM ),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
   );

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (1, 'Manager', '02-20-2016'),
 (2, 'Executive', '06-11-2016'),
 (8, 'Executive', '06-11-2016'),
 (5, 'Manager', '06-11-2016'),
 (4, 'Asst. Manager', '06-11-2016'),
 (7, 'Executive', '06-11-2016'),
 (6, 'Lead', '06-11-2016'),
 (3, 'Lead', '06-11-2016');


 Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.
 SELECT FIRST_NAME AS WORKER_NAME
 FROM Worker;

Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
 SELECT UPPER(FIRST_NAME)
 FROM Worker;

Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
 SELECT distinct DEPARTMENT
 FROM Worker;

Q-4. Write An SQL Query To Print The First Three Characters Of  FIRST_NAME From Worker Table.
 SELECT SUBSTRING(FIRST_NAME,1,3)
 FROM Worker;

Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
 SELECT charindex('A',FIRST_NAME)
 FROM Worker
 WHERE FIRST_NAME = 'Amitabh';

Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
 SELECT RTRIM(FIRST_NAME)
 FROM Worker;

Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
 SELECT LTRIM(FIRST_NAME)
 FROM Worker;

Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
 SELECT distinct len(DEPARTMENT)
 FROM Worker;

Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘A’.
 SELECT REPLACE(FIRST_NAME,'a','A')
 FROM Worker;

Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them
 SELECT CONCAT(FIRST_NAME, ' ' ,LAST_NAME) AS 'completebname'
 FROM Worker;

Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
 SELECT *
 FROM Worker
 ORDER BY FIRST_NAME ASC;

Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
 SELECT *
 FROM Worker
 ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
 SELECT *
 FROM Worker
 WHERE FIRST_NAME IN ('Vipul', 'Satish');

Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
 SELECT *
 FROM Worker
 WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
 SELECT *
 FROM Worker
 WHERE DEPARTMENT LIKE 'Admin%';

Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
 SELECT *
 FROM Worker
 WHERE FIRST_NAME LIKE '%a%';

Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
 SELECT *
 FROM Worker
 WHERE FIRST_NAME LIKE '%a';

Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
 SELECT *
 FROM Worker
 WHERE FIRST_NAME LIKE '_____h'

Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
 SELECT *
 FROM Worker
 WHERE SALARY BETWEEN 100000 AND 500000;

Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
 SELECT *
 FROM Worker
 WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2;

Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
 SELECT COUNT(*)
 FROM Worker
 WHERE DEPARTMENT = 'Amin';

Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
 SELECT CONCAT(FIRST_NAME, ' ' ,LAST_NAME) AS WORKER_NAME, SALARY
 FROM Worker
 WHERE WORKER_ID IN (SELECT WORKER_ID FROM Worker WHERE SALARY BETWEEN 50000 AND 100000);

Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
 SELECT DEPARTMENT, COUNT(WORKER_ID) NO_OF_WORKERS
 FROM Worker
 GROUP BY DEPARTMENT
 ORDER BY NO_OF_WORKERS DESC;

Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
 SELECT Worker.*
 FROM Worker, Title
 WHERE Worker.WORKER_ID = Title.WORKER_REF_ID AND WORKER_TITLE = 'MANAGERS';

Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
 SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
 FROM Title
 GROUP BY WORKER_TITLE, AFFECTED_FROM HAVING COUNT(*)>1;

Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
 SELECT *
 FROM Worker
 WHERE WORKER_ID % 2 <> 0;

Q-27. Write An SQL Query To Show Only Even Rows From A Table.
 SELECT *
 FROM Worker
 WHERE WORKER_ID % 2 = 0;

Q-28. Write An SQL Query To Clone A New Table From Another Table.
 SELECT * INTO WORKER_CLONE
 FROM Worker
 SELECT * FROM WORKER_CLONE;

Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
 SELECT *
 FROM Worker
 INTERSECT SELECT *
 FROM WORKER_CLONE;

Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
 SELECT *
 FROM Worker
 MINUS SELECT *
 FROM Title;

Q-31. Write An SQL Query To Show The Current Date And Time.
 SELECT GETDATE();

Q-32. Write An SQL Query To Show The  Top N (Say 10) Records Of A Table.
 SELECT * 
 FROM Worker
 SELECT TOP 10 worker_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT;

Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
 SELECT *
 FROM Worker
 SELECT TOP 5 WORKER_ID,salary
 FROM Worker
 WHERE SALARY >= 100000
 ORDER BY WORKER_ID,salary;

Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
 select * 
 from Worker
 select WORKER_ID,First_Name,Last_Name,salary
 from Worker
 where SALARY = 100000;

Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
 select top 2 WORKER_ID,First_Name,Last_Name,salary
 from Worker
 where SALARY >= 500000
 order by WORKER_ID,salary;

Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
 select top 1 WORKER_ID,First_Name,Last_Name,salary
 from Worker
 where SALARY > 200000 and SALARY < 500000;

Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
 select WORKER_ID,First_Name,Last_Name,salary
 from Worker
 where WORKER_ID = 1
 union all
 select WORKER_ID,First_Name,Last_Name,salary
 from Worker
 where WORKER_ID = 1;

Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
 select *
 from Worker
 intersect
 select * from WORKER_CLONE;

Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
 select top 50 percent WORKER_ID,First_Name,Last_Name,salary
 from Worker;

Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.
 select department
 from Worker 
 group by department
 having count(department)>5;

Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
 select count(DEPARTMENT) as NumberOf, department
 from Worker
 group by Department
 order by Department asc;

Q-42. Write An SQL Query To Show The Last Record From A Table.
 select top 1 Worker_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
 from Worker
 order by Worker_id desc;

Q-43. Write An SQL Query To Fetch The First Row Of A Table.
 SELECT TOP 1 Worker_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
 FROM Worker
 ORDER BY Worker_id asc;

Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
 SELECT TOP 5 Worker_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
 FROM Worker
 ORDER BY Worker_id desc;

Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
 SELECT First_Name,LAST_NAME,DEPARTMENT,Salary
 FROM Worker
 WHERE Salary IN
 (SELECT max(Salary) AS salary From Worker GROUP BY DEPARTMENT);

Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
 select top 3 Max(Salary)
 from Worker
 group by SALARY
 order by SALARY desc;

Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
 select top 3 Min(Salary)
 from Worker
 group by SALARY
 order by SALARY asc;

Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.
 select top 10 Max(Salary)
 from Worker
 group by SALARY
 order by SALARY desc;

Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.
 SELECT First_Name,LAST_NAME,DEPARTMENT,Salary
 FROM Worker
 WHERE Salary IN (SELECT Salary From Worker);

Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
 SELECT First_Name,LAST_NAME,DEPARTMENT,Salary
 FROM Worker
 WHERE Salary IN (SELECT max(Salary) AS salary From Worker GROUP BY DEPARTMENT);