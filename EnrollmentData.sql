DROP DATABASE IF EXISTS EnrollmentData;
CREATE DATABASE EnrollmentData;
USE EnrollmentData;
DROP VIEW IF EXISTS FirstSemesterGPA;
DROP VIEW IF EXISTS CourseLeaders;

CREATE TABLE IF NOT EXISTS Student (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    StudentEmail VARCHAR(250) NOT NULL
    );
CREATE TABLE IF NOT EXISTS Professor (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    ProfessorName VARCHAR (100) NOT NULL
    );
CREATE TABLE IF NOT EXISTS Semester (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    SemesterStart DATE NOT NULL,
    SemesterEnd DATE NOT NULL
    );
CREATE TABLE IF NOT EXISTS Course (
	CourseId VARCHAR(100) PRIMARY KEY,
    CourseName VARCHAR(250) NOT NULL,
    Credits INT NOT NULL,
    Professor INT NOT NULL,
    FOREIGN KEY (Professor) REFERENCES Professor(Id)
    );
CREATE TABLE IF NOT EXISTS Enrollment (
	StudentId INT NOT NULL,
    FOREIGN KEY (StudentId) REFERENCES Student(Id),
    CourseId VARCHAR(100) NOT NULL,
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId),
    Semester INT NOT NULL,
    FOREIGN KEY (Semester) REFERENCES Semester(Id),
    Score INT NOT NULL
    );
    
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Emma', 'Watson', 'emma@univ.edu');
SET @Emma = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Liam', 'Neeson', 'liam@univ.edu');
SET @Liam = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Sophia', 'Loren', 'sophia@univ.edu');
SET @Sophia = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Tom', 'Hanks', 'tom@univ.edu');
SET @Tom = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Denzel','Washington', 'denzel@univ.edu');
SET @Denzel = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Leonardo', 'DiCaprio', 'leo@univ.edu');
Set @Leo = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Scarlett', 'Johansson', 'scarlett@univ.edu');
SET @Scarlett = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Morgan', 'Freeman', 'morgan@univ@edu');
SET @Morgan = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Natalie', 'Portman', 'natalie@univ.edu');
SET @Natalie = LAST_INSERT_ID();
INSERT INTO Student (FirstName, LastName, StudentEmail) VALUES ('Meryl', 'Streep', 'meryl@univ.edu');
SET @Meryl = LAST_INSERT_ID();
INSERT INTO Professor (ProfessorName) VALUES ('Dr. Marie Curie');
Set @Curie = LAST_INSERT_ID();
INSERT INTO Professor (ProfessorName) VALUES ('Prof. Alan Turing');
Set @Turing = LAST_INSERT_ID();
INSERT INTO Professor (ProfessorName) VALUES ('Dr. Ada Lovelace');
SET @Lovelace = LAST_INSERT_ID();
INSERT INTO Semester (SemesterStart, SemesterEnd) VALUES ('2026-08-17', '2026-10-10');
SET @FallSemester = LAST_INSERT_ID();
INSERT INTO Semester (SemesterStart, SemesterEnd) VALUES ('2026-10-12','2026-12-12');
SET @WinterSemester = LAST_INSERT_ID();

INSERT INTO Course (CourseId, CourseName, Credits, Professor) VALUES ('PHYS101', 'General Physics I', 4, @Curie);
INSERT INTO Course (CourseId, CourseName, Credits, Professor) VALUES ('PHYS202', 'Quantum Mechanics', 4, @Curie);
INSERT INTO Course (CourseId, CourseName, Credits, Professor) VALUES ('CS101', 'Intro to Computer Science', 3, @Turing);
INSERT INTO Course (CourseId, CourseName, Credits, Professor) VALUES ('CS202', 'Data Structures & Algorithms', 4, @Turing);
INSERT INTO Course (CourseId, CourseName, Credits, Professor) VALUES ('MATH201', 'Linear Algebra', 4, @Lovelace);
INSERT INTO Course (CourseId, CourseName, Credits, Professor) VALUES ('MATH302', 'Discrete Mathematics', 3, @Lovelace);

INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Emma,'PHYS101', @FallSemester, 55);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Emma, 'PHYS202',@WinterSemester, 83);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Emma, 'CS101', @FallSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Emma, 'CS202', @WinterSemester, 57);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Liam, 'PHYS101', @FallSemester, 59);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Liam, 'PHYS202', @WinterSemester, 78);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Liam, 'CS101', @FallSemester, 52);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Liam, 'CS202', @WinterSemester, 100);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Liam, 'MATH302', @FallSemester, 79);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Sophia, 'PHYS101', @FallSemester, 59);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Sophia, 'PHYS202', @WinterSemester, 57);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Sophia, 'MATH201', @FallSemester, 79);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Sophia, 'MATH302', @FallSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Tom, 'PHYS101', @FallSemester, 71);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Tom, 'PHYS202', @WinterSemester, 100);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Tom, 'CS101', @FallSemester, 64);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Tom, 'CS202', @WinterSemester, 51);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Tom, 'MATH201', @FallSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Tom, 'MATH302', @WinterSemester, 98);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Denzel, 'PHYS101', @FallSemester, 91);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Denzel, 'PHYS202', @FallSemester, 51);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Denzel, 'CS101', @FallSemester, 55);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Denzel, 'CS202', @WinterSemester, 79);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Denzel, 'MATH302', @WinterSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Meryl, 'CS101', @FallSemester, 84);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Meryl, 'CS202', @WinterSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Meryl, 'MATH201', @FallSemester, 98);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Meryl, 'MATH302', @WinterSemester, 52);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Leo, 'CS101', @FallSemester, 89);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Leo, 'PHYS202', @WinterSemester, 79);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Leo, 'CS101', @FallSemester, 89);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Leo, 'CS202', @WinterSemester, 98);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Leo, 'MATH201', @FallSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Leo, 'MATH302', @WinterSemester, 64);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Scarlett, 'PHYS101', @FallSemester, 57);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Scarlett, 'PHYS202', @WinterSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Scarlett, 'CS101', @FallSemester, 57);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Scarlett, 'CS202', @WinterSemester, 80);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Scarlett, 'MATH302', @WinterSemester, 55);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Morgan, 'PHYS101', @FallSemester, 61);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Morgan, 'PHYS202', @WinterSemester, 98);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Morgan, 'CS101', @FallSemester, 60);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Morgan, 'CS202', @WinterSemester, 52);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Morgan, 'MATH201', @FallSemester, 52);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Morgan, 'MATH302', @WinterSemester, 84);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Natalie, 'PHYS101', @FallSemester, 100);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Natalie, 'CS101', @FallSemester, 72);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Natalie, 'CS202', @WinterSemester, 64);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Natalie, 'MATH201', @FallSemester, 64);
INSERT INTO Enrollment (StudentId, CourseId, Semester, Score) VALUES (@Natalie, 'MATH302', @WinterSemester, 89);

CREATE VIEW FirstSemesterGPA AS
SELECT s.FirstName, s.LastName, ROUND(AVG(e.Score)/100, 2) AS GPA,
CASE
	WHEN ROUND(AVG(e.Score)/100, 2) >= 0.9 THEN 'A'
    WHEN ROUND(AVG(e.Score)/100, 2) >= 0.8 THEN 'B'
    WHEN ROUND(AVG(e.Score)/100, 2) >= 0.7 THEN 'C'
    WHEN ROUND(AVG(e.Score)/100, 2) >= 0.6 THEN 'D'
    ELSE 'F'
END AS Grade
FROM Student s
JOIN Enrollment e ON s.Id = e.StudentId
JOIN Semester se  ON e.Semester = se.Id
WHERE se.SemesterStart = '2026-08-17' AND se.SemesterEnd = '2026-10-10'
GROUP BY s.Id
ORDER BY s.LastName, s.FirstName, GPA DESC;

CREATE VIEW CourseLeaders AS
SELECT
    Student_GPA_Rank.CourseId,
    Student_GPA_Rank.LastName,
    Student_GPA_Rank.FirstName,
    Student_GPA_Rank.GPA,
    CASE
        WHEN Student_GPA_Rank.GPA >= 0.9 THEN 'A'
        WHEN Student_GPA_Rank.GPA >= 0.8 THEN 'B'
        WHEN Student_GPA_Rank.GPA >= 0.7 THEN 'C'
        WHEN Student_GPA_Rank.GPA >= 0.6 THEN 'D'
        ELSE 'F'
    END AS Grade
FROM (
	SELECT s.FirstName, s.LastName, ROUND(AVG(e.Score)/100, 2) AS GPA, c.CourseId
	FROM Student s
	JOIN Enrollment e ON s.Id = e.StudentId
	JOIN Course c ON e.CourseId = c.CourseId
	GROUP BY c.CourseId, s.Id
	) AS Student_GPA_Rank
		WHERE (
		SELECT COUNT(*)
		FROM (
		SELECT s.FirstName, s.LastName, ROUND(AVG(e.Score)/100, 2) AS GPA, c.CourseId
		FROM Student s
		JOIN Enrollment e ON s.Id = e.StudentId
		JOIN Course c ON e.CourseId = c.CourseId
		GROUP BY c.CourseId, s.Id
		) AS StudentGPA
		WHERE StudentGPA.CourseId = Student_GPA_Rank.CourseId
		  AND StudentGPA.GPA > Student_GPA_Rank.GPA
) < 3
ORDER BY CourseId, LastName, FirstName, GPA DESC;

SELECT *FROM CourseLeaders;
SELECT * FROM FirstSemesterGPA;