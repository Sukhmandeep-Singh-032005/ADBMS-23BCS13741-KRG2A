------------------------ EASY--------------------------
CREATE TABLE Shinobi (
 shinobi_id INT
);

INSERT INTO Shinobi (shinobi_id)
VALUES (1), (2), (3), (4), (5), (5), (6), (7), (8), (9), (9), (3);

SELECT MAX(shinobi_id)
FROM Shinobi
WHERE shinobi_id NOT IN (
    SELECT shinobi_id
    FROM Shinobi
    GROUP BY shinobi_id
    HAVING COUNT(shinobi_id) > 1
);


--------------------------- EASY-------------------------
CREATE TABLE Jutsu (
ID INT PRIMARY KEY IDENTITY,
[NAME] NVARCHAR(50),
[DESCRIPTION] NVARCHAR(250)
);

CREATE TABLE Jutsu_Usage (
ID INT PRIMARY KEY IDENTITY,
JUTSU_ID INT FOREIGN KEY REFERENCES Jutsu (ID),
CHAKRA_COST INT,
TIMES_USED INT
);

INSERT INTO Jutsu VALUES ('Rasengan', 'Spiraling chakra sphere created by Naruto')
INSERT INTO Jutsu VALUES ('Chidori', 'High-speed lightning blade by Sasuke')
INSERT INTO Jutsu VALUES ('Amaterasu', 'Black flames that never extinguish by Itachi')

INSERT INTO Jutsu_Usage VALUES (3, 90, 5)
INSERT INTO Jutsu_Usage VALUES (2, 70, 7)
INSERT INTO Jutsu_Usage VALUES (3, 90, 4)
INSERT INTO Jutsu_Usage VALUES (3, 90, 9)

SELECT * FROM Jutsu
SELECT * FROM Jutsu_Usage

SELECT ID, [NAME], [DESCRIPTION] 
FROM Jutsu
WHERE ID NOT IN (
    SELECT DISTINCT JUTSU_ID FROM Jutsu_Usage
);


------------------------ EASY--------------------------
SELECT J.[NAME],
   (SELECT SUM(U.TIMES_USED) 
    FROM Jutsu_Usage U 
    WHERE U.JUTSU_ID = J.ID) AS [TOTAL_USAGE]
FROM Jutsu J;


------------------------ LEETCODE--------------------------
SELECT user_id, MAX(time_stamp) as 'last_stamp'
FROM Logins
WHERE YEAR(time_stamp)='2020'
GROUP BY user_id
