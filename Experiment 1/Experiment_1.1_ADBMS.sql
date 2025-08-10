--CREATE DATABASE githubUpload;
--use githubUpload;


CREATE TABLE AUTHORS (
  AUTH_ID INT PRIMARY KEY,
  AUTH_NAME VARCHAR(50),
  COUNTRY VARCHAR(100)
);


CREATE TABLE BOOKS (
  BOOK_ID INT PRIMARY KEY,
  BOOK_NAME VARCHAR(100),
  AUTH_ID INT,
  PUBLISH_YEAR INT,
  CONSTRAINT fk_books_authors FOREIGN KEY (AUTH_ID) REFERENCES AUTHORS(AUTH_ID)
);


INSERT INTO AUTHORS (AUTH_ID, AUTH_NAME, COUNTRY) VALUES
(1, 'Masashi Kishimoto', 'Japan'),
(2, 'J.K. Rowling', 'England'),
(3, 'Tsugumi Ohba', 'Japan');


INSERT INTO BOOKS (BOOK_ID, BOOK_NAME, AUTH_ID, PUBLISH_YEAR) VALUES
(1001, 'Naruto Vol. 1', 1, 1999),
(1002, 'Naruto Vol. 2', 1, 2000),
(1003, 'Harry Potter and the Sorcerer''s Stone', 2, 1997),
(1004, 'Harry Potter and the Chamber of Secrets', 2, 1998),
(1005, 'Death Note Vol. 1', 3, 2003),
(1006, 'Death Note Vol. 2', 3, 2004);


SELECT 
  B.BOOK_ID,
  B.BOOK_NAME,
  B.PUBLISH_YEAR,
  A.AUTH_NAME,
  A.COUNTRY
FROM AUTHORS A
INNER JOIN BOOKS B ON A.AUTH_ID = B.AUTH_ID;

