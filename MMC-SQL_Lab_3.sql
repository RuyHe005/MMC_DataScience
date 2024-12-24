USE Testing_System_Db; 

--  cau1: Thêm ít nhất 10 record vào mỗi table
INSERT INTO Department (DepartmentID, DepartmentName ) VALUES 
('01', 'PhongSale'),
('02', 'PhongMarketing'),
('03', 'PhongNhanSu'),
('04', 'PhongIT'),
('05', 'PhongTaiChinh'),
('06', 'PhongLogistics'),
('07', 'PhongKhachHang'),
('08', 'PhongNghienCuu'),
('09', 'PhongPhapLy'),
('10', 'PhongQuanLy');



INSERT INTO POSITION ( PositionID, PositionName) VALUES 
('001', 'GiamDoc'),
('002', 'NhanVien'),
('003', 'ThucTap'),
('004', 'QuanLy'),
('005', 'TruongPhong'),
('006', 'PhanTich'),
('007', 'KeToan'),
('008', 'TuVan'),
('009', 'TroLy'),
('010', 'KyThuat');


INSERT INTO ACCOUNTS (AccountID, Email, Username, FULLNAME, DepartmentID, PositionID, CreateDate) VALUES 
('111','a@example.com', 'userA', 'Nguyễn Văn A', 01, 001, '2023-01-01'),
('112','b@example.com', 'userB', 'Trần Thị B', 02, 002, '2023-01-02'),
('113','c@example.com', 'userC', 'Lê Văn C', 03, 003, '2023-01-03'),
('114','d@example.com', 'userD', 'Phạm Thị D', 01, 001, '2023-01-04'),
('115','e@example.com', 'userE', 'Nguyễn Văn E', 04, 002, '2023-01-05'),
('116','f@example.com', 'userF', 'Trần Văn F', 02, 003, '2023-01-06'),
('117','g@example.com', 'userG', 'Lê Thị G', 05, 001, '2023-01-07'),
('118','h@example.com', 'userH', 'Phạm Văn H', 03, 002, '2023-01-08'),
('119','i@example.com', 'userI', 'Nguyễn Thị I', 01, 003, '2023-01-09'),
('120','j@example.com', 'userJ', 'Trần Văn J', 04, 001, '2023-01-10');

INSERT INTO GROUP_NHOM (GROUPID, GROUP_NAME, CREATOR_ID, CREATE_DATE) VALUES 
('221','Group A', 1, '2020-01-01'),
('222','Group B', 2, '2020-02-01'),
('223','Group C', 3, '2020-03-01'),
('224','Group D', 4, '2020-04-01'),
('225','Group E', 5, '2020-05-01'),
('226','Group F', 6, '2020-06-01'),
('227','Group G', 7, '2020-07-01'),
('228','Group H', 8, '2020-08-01'),
('229','Group I', 9, '2020-09-01'),
('230','Group J', 10, '2020-10-01');

INSERT INTO TYPEQUESTION ( TYPLEID, TYPLENAME) VALUES 
('331','Multiple Choice'), 
('332','True/False'), 
('333','Short Answer');

INSERT INTO CATEGORYQUESTION (CATEGORYID,CATEGORYNAME) VALUES 
('441','TOAN'), 
('442','TIN'), 
('443','SU'), 
('444','VAN');

INSERT INTO QUESTION (QUESTIONID, CONTENT, CATEGORYID, TYPLEID, CREATORID, CREATEDATE) VALUES 
('551','Câu hỏi 1', 441, 331, 1, '2023-01-01'),
('552','Câu hỏi 2', 442, 332, 1, '2023-01-02'),
('553','Câu hỏi 3', 443, 331, 2, '2023-01-03'),
('554','Câu hỏi 4', 441, 332, 2, '2023-01-04'),
('555','Câu hỏi 5', 442, 331, 3, '2023-01-05'),
('556','Câu hỏi 6', 443, 332, 3, '2023-01-06'),
('557','Câu hỏi 7', 441, 331, 1, '2023-01-07'),
('558','Câu hỏi 8', 442, 332, 1, '2023-01-08'),
('559','Câu hỏi 9', 443, 331, 2, '2023-01-09'),
('560','Câu hỏi 10', 441, 332, 2, '2023-01-10');

INSERT INTO ANSWER (ANSWERID, CONTENT, QUESTIONID, isCorrect) VALUES 
('610','Đáp án đúng 1', 551, 'True'),
('612','Đáp án sai 1', 551, 'False'),
('613','Đáp án đúng 2', 552, 'True'),
('614','Đáp án sai 2', 552, 'False'),
('615','Đáp án đúng 3', 553, 'True'),
('616','Đáp án sai 3', 553, 'False'),
('617','Đáp án đúng 4', 554, 'True'),
('618','Đáp án sai 4', 554, 'False'),
('619','Đáp án đúng 5', 555, 'True'),
('620','Đáp án sai 5', 555, 'False');

INSERT INTO EXAM (EXAMID, CODE, TITLE, CATEGORYID, DURATION, CREATORID, CREATEDATE) VALUES 
('777',101, 'Đề thi Toán', 441, '01:00:00', 1, '2020-01-01'),
('778',102, 'Đề thi Lý', 442, '01:30:00', 2, '2020-02-01'),
('779',103, 'Đề thi Hóa', 443, '02:00:00', 3, '2020-03-01');

INSERT INTO EXAMQUESTION (EXAMID, QUESTIONID) VALUES 
(777, 551),
(778, 552),
(779, 553),
(777, 554),
(778, 555),
(777, 556);

-- cau 2: 
SELECT * FROM Department;

-- cau 3: 
SELECT DepartmentID FROM Department 
WHERE DepartmentName = 'PhongSale';

-- cau 4: 
SELECT * FROM ACCOUNTS 
ORDER BY LENGTH(FULLNAME) DESC 
LIMIT 1;

-- cau 5: 
SELECT * FROM ACCOUNTS 
WHERE DepartmentID = 03 
ORDER BY LENGTH(FULLNAME) DESC 
LIMIT 1;

-- cau 6: 
SELECT GROUP_NAME FROM GROUP_NHOM 
WHERE CREATE_DATE < '2019-12-20';

-- cau 7: 
SELECT QUESTIONID FROM ANSWER 
GROUP BY QUESTIONID 
HAVING COUNT(*) >= 4;

-- cau 8: 
SELECT CODE FROM EXAM
 WHERE TIME_TO_SEC(DURATION) >= '1:00:00'AND CREATEDATE < '2019-12-20';

-- cau 9: 
SELECT * FROM GROUP_NHOM 
ORDER BY CREATE_DATE DESC 
LIMIT 5;

--  cau 10: 
SELECT COUNT(*) FROM ACCOUNTS 
WHERE DepartmentID = 02;

--  cau 11: 
SELECT * FROM ACCOUNTS 
WHERE FULLNAME LIKE 'D%o';

--  cau 12: 
DELETE FROM EXAM 
WHERE CREATEDATE < '2019-12-20';

--  cau 13: 
DELETE FROM QUESTION 
WHERE CONTENT LIKE 'Câu hỏi%';

--  cau 14:
UPDATE ACCOUNTS SET FULLNAME = 'Lô Văn Đề', Email = 'lo.vande@mmc.edu.vn' 
WHERE AccountID = 121;

--  cau 15: 
UPDATE GROUP_ACCOUNT SET GROUPID = 224 
WHERE ACCOUNTID = 115;


