CREATE DATABASE IF NOT EXISTS QLNV;
USE QLNV;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department 
( DepartmentID					INT PRIMARY KEY AUTO_INCREMENT,
  DepartmentName				NVARCHAR (50) NOT NULL
);
CREATE TABLE Position 
( PositionID					INT PRIMARY KEY AUTO_INCREMENT,
  PositionName					NVARCHAR (50) NOT NULL
);
CREATE TABLE Account
( AccountID						INT PRIMARY KEY AUTO_INCREMENT,
  Email							NVARCHAR (30) UNIQUE KEY,
  Username						NVARCHAR (50) NOT NULL,
  FULLNAME						NVARCHAR (50) NOT NULL,
  DepartmentID					INT NOT NULL,
  PositionID					INT NOT NULL,
  CreateDate					DATE NOT NULL,
  FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID)
);

CREATE TABLE GROUP_NHOM
( GROUPID 						INT PRIMARY KEY AUTO_INCREMENT,
  GROUP_NAME					NVARCHAR (30) NOT NULL,
  CREATOR_ID					INT NOT NULL,
  CREATE_DATE					DATE NOT NULL
);
CREATE TABLE GROUP_ACCOUNT 
( GROUPID						INT NOT NULL,
  ACCOUNTID						INT NOT NULL,
  JOINDATE						DATE NOT NULL,
  FOREIGN KEY (GROUPID)	REFERENCES GROUP_NHOM (GROUPID)
);
CREATE TABLE TYPEQUESTION 
( TYPLEID						INT PRIMARY KEY AUTO_INCREMENT ,
  TYPLENAME						NVARCHAR (30) NOT NULL
);
CREATE TABLE CATEGORYQUESTION
( CATEGORYID					INT PRIMARY KEY AUTO_INCREMENT ,
  CATEGORYNAME					NVARCHAR (50) NOT NULL
);
CREATE TABLE QUESTION 
( QUESTIONID					INT PRIMARY KEY AUTO_INCREMENT ,
  CONTENT						TEXT NOT NULL ,
  CATEGORYID					INT NOT NULL,
  TYPLEID						INT NOT NULL,
  CREATORID						INT NOT NULL,
  CREATEDATE					DATE NOT NULL
);
CREATE TABLE ANSWER 
( ANSWERID						INT PRIMARY KEY AUTO_INCREMENT ,
  CONTENT						TEXT NOT NULL,
  QUESTIONID					INT NOT NULL,
  FOREIGN KEY (QUESTIONID) REFERENCES QUESTION (QUESTIONID),
  isCORRECT						ENUM('True','False')
);
CREATE TABLE EXAM 
( EXAMID						INT PRIMARY KEY AUTO_INCREMENT ,
  CODE							INT NOT NULL,
  TITLE							TEXT NOT NULL,
  CATEGORYID					INT NOT NULL ,
  DURATION						TIME NOT NULL ,
  CREATORID						INT NOT NULL ,
  CREATEDATE					DATE NOT NULL
);
CREATE TABLE EXAMQUESTION
( EXAMID						INT NOT NULL,
  QUESTIONID					INT NOT NULL,
  FOREIGN KEY (EXAMID) REFERENCES EXAM (EXAMID),
  FOREIGN KEY (QUESTIONID) REFERENCES ANSWER (QUESTIONID)
);
