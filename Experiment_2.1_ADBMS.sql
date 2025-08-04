CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL 
);

ALTER TABLE Employee
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID);

INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Kakashi', 'Hokage Office', NULL),       
(2, 'Naruto', 'Mission Desk', 1),
(3, 'Sasuke', 'Intel Division', 1),
(4, 'Shikamaru', 'Mission Desk', 2),
(5, 'Itachi', 'Intel Division', 3),
(6, 'Sakura', 'Hokage Office', 1);

SELECT 
E.EmpName AS EmployeeName, 
E.Department AS EmployeeDept, 
M.EmpName AS ManagerName, 
M.Department AS ManagerDept
FROM Employee AS E
JOIN Employee AS M 
ON E.ManagerId = M.EmpID;
