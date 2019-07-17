CREATE TABLE `student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COURSE_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `COURSE_NAME_UNIQUE` (`COURSE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `student_course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int(11) NOT NULL,
  `COURSE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_STUDENT_COURSE_STUDENT_ID_STUDENT_ID_idx` (`STUDENT_ID`),
  KEY `FK_STUDENT_COURSE_COURSE_ID_COURSE_ID_idx` (`COURSE_ID`),
  CONSTRAINT `FK_STUDENT_COURSE_COURSE_ID_COURSE_ID` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`ID`),
  CONSTRAINT `FK_STUDENT_COURSE_STUDENT_ID_STUDENT_ID` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into student (NAME, EMAIL) VALUES 
('Peter Dale', 'pdale@site.com'),
('Sarah Smith', 'ssmith@site.com'),
('Jacob Stone', 'jstone@site.com'),
('Marry Doson', 'mdoson@site.com'),
('Jerry Thompson', 'jthompson@site.com');

select * from student;

insert into course (COURSE_NAME) values 
('Java'),
('SQL'),
('Big Data'),
('Basic Programming'),
('C++');

select * from course order by id;

select * from student where NAME = 'Peter Dale';

insert into student_course (STUDENT_ID, COURSE_ID) values 
(7, 1),
(7, 1),
(7, 2),
(7, 2),
(7, 3),
(7, 3),
(7, 3),
(7, 4),
(7, 4),
(7, 5);

select * from course order by id;
select * from student s
join student_course sc
on sc.STUDENT_ID = s.ID;

-- id name email id course_name
-- 6 7 
-- show all courses Sara takes

select s.NAME, count(c.COURSE_NAME) as 'COURSES COUNT' from student s
join student_course sc
on s.ID = sc.STUDENT_ID

join course c
on c.ID = sc.COURSE_ID

where s.NAME LIKE 'Peter%'
GROUP BY s.NAME;




select s.NAME, count(s.NAME) as course_count from student s
inner join student_course sc
on sc.STUDENT_ID = s.ID

inner join course c
on c.ID = sc.COURSE_ID
group by s.NAME
order by course_count desc
limit 1;


select count(c.COURSE_NAME), c.COURSE_NAME from student s 
inner join student_course sc
on sc.STUDENT_ID = s.ID

inner join course c 
on sc.COURSE_ID = c.ID
where s.NAME like 'Peter%'
group by c.COURSE_NAME;


