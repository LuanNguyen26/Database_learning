create database MStudents
go
use MStudents
go

create table Class(
	ClassID char (10) primary key,
	Class nvarchar(50),
	NumberOfStudent tinyint,
)
create table CSubject(
	SubjectID char (10) primary key,
	SubjectName nvarchar(50),
	Theoretical_Credits tinyint,
	Practice_Credits tinyint,
)
create table Student(
	StudentID char (10) primary key,
	StudentName nvarchar (50),
	BirthDay date,
	Gender bit,
	ClassID char (10),
	Constraint fr_ClassID foreign key(ClassID) references Class(ClassID)
)
create table Result(
	StudentID char (10),
	SubjectID char (10),
	Score decimal(3,1)
	Constraint pk_Result primary key(SubjectID,StudentID),
	Constraint fr_1235 foreign key(SubjectID) references CSubject(SubjectID),
	Constraint fr_1234 foreign key(StudentID) references Student(StudentID)
)
select * from Student


1-	Write An SQL Query to insert a new record to table Student with following data: 190001	Đào Thị Tuyết Hoa	08/03/2001	0	19DTH02
	
	insert into Student values ('190001', N'Đào Thị Tuyết Hoa' , '03/08/2001', 0,'19DTH02' )
2-	Write An SQL Query to change subject of  'Lý Thuyết Đồ Thị' to ‘Toán rời rạc’.
	
	update CSubject
	set SubjectName = N'Toán Rời Rạc' where SubjectName = N'Lý Thuyết Đồ Thị' 
3-	Write An SQL Query to print subjects without practice.
	
	select	SubjectID,SubjectName,Theoretical_Credits
	from CSubject
4-	Write An SQL Query to print subjects with both theory and practice.

	select	Theoretical_Credits,Practice_Credits
	from CSubject
5-	Write An SQL Query to print subjects with the first letter is 'C'.

	select *
	from CSubject
	where SubjectName Like N'C%'	
6-	Write An SQL Query to print student_name that contains the word ‘Thi’.
	
	select	StudentName
	from Student
	where StudentName like N'%thị%'
7-	Write An SQL Query to print information of two classes which have the largest students.
	
	select top 2 *
	from Class
	order by NumberOfStudent desc
8-	Write An SQL Query to print a list of students: StudentID, Student_Name, BirthDay, Gender (with Gender is ‘male’ or ‘female’).
	
	select StudentID, StudentName, BirthDay, (case when Gender = 1 then 'Male' else 'Female' end) as Gender  ,ClassID
	from Student
9-	Write An SQL Query to print students whose age is ≥ 20: Student_Name, BirthDay, Age.
	
	select StudentName,BirthDay
	from Student
	where DATEDIFF(year,BirthDay,getdate()) >= 20
10-	 Write An SQL Query to print subjects that students already took a test but donot have score
	
	select *
	from Student
	where StudentID in (select StudentID from Result where Score = NULL)
11-	 Write An SQL Query to print student name and subject code that the student took test with score over 7.
	
	select	StudentName, SubjectID
	from Student A, Result B
	where A.StudentID=B.StudentID and  score > 7
12-	 Write An SQL Query to print subjects and the number of students who took it and got the score.
	
	select SubjectName, count(StudentID) as NOS
	from CSubject A, Result B
	where A.SubjectID=B.SubjectID
	group by SubjectName
13-	 Write An SQL Query to print student name and average of score.
	
	select	studentName, avg(Score) as AverageOfScore
	from Student A, Result B
	where A.StudentID=B.StudentID
	group by StudentName
14-	 Write An SQL Query to print student name who has the highest average score.
	
	select	top 1 studentName, avg(Score) as AverageOfScore
	from Student A, Result B
	where A.StudentID=B.StudentID
	group by StudentName
15-	 Write An SQL Query to print Student's name who hasn't got the score of ‘Toán rời rạc’.
	
	select studentName
	from student A
	where StudentID not in ( select StudentID from Result where SubjectID = (select SubjectID from CSubject where SubjectName = N'Toán Rời Rạc'))
16-	 Write An SQL Query to indicate the total of students and the total of female students.
	
	select * from (select count( StudentName) as TotalOfStudent from Student) A,
	(select count(StudentID) as TotalOfFemale from Student where Gender = 1) B
17-	 Write An SQL Query to print the list of students who has failed at least one subject.
	
	select A.studentID ,Studentname
	from result A, student B
	where A.StudentID = B.StudentID and Score < 4
18-	 Write An SQL Query to print the list of students who has the highest score on ‘Kỹ thuật lập trình’ in each class.
	
	select A.studentID,StudentName,Score
	from student A, Result B
	where A.StudentID = B.StudentID and SubjectID = 'COS201'
	order by Score desc
19-	 Write An SQL Query to print a list of students who has the highest scores by each subject in each class.
	
	select top 5 Score,A.studentID,StudentName,SubjectID
	from student A, Result B
	where A.StudentID = B.StudentID 
	order by Score desc
20-	 Write An SQL Query to print the studentID, Student name who does not yet has a score for any subject.
	
	select StudentName, Score
	from Student a,Result b
	where a.StudentID = b.StudentID and Score is null
21-	 Write An SQL Query to print the list of students who has all scores is 10.
	
	select top 5 Score,A.studentID,StudentName,SubjectID
	from student A, Result B
	where A.StudentID = B.StudentID 
	order by Score desc
22-	 Write An SQL Query to count the number of male students and female students by class.
	
	select count(case when Gender = 1 then 'Male' else 'Female' end) 
	as Gender	
	from Student
	group by Gender
23-	 Write An SQL Query to print the names of students who have taken all subjects but not fail any.
	
	select A.studentID ,Studentname,Score
	from result A, student B
	where A.StudentID = B.StudentID and Score > 4
	order by Score desc
24-	 Write An SQL Query to print subjects that have been tested for all students
	
	select SubjectName,SubjectID
	from CSubject