create table Member(member_id number(5),
member_name varchar2(30),
member_address varchar2(50),
Acc_Open_Date Date,
membership_type varchar2(20),
Fee_paid Number(4),
Max_Books_Allowed Number(2),
Penalty_Amount Number(7,2)
);
select * from Member;

create table Books(book_no Number(6),
book_name varchar2(30),
Author_name varchar2(30),
Cost Number(7,2),
Category Char(10)
);

create table Issue(Lib_Issue_Id Number(10),
Book_No Number(6),
Member_Id Number(5),
issue_Date Date,
Return_date Date
);

select * from Issue;

insert into Member values(12,'Akash','Pune','11 june 2024','Annual','200','30','205');
insert into Member values(13,'Ankush','Nashik','11 oct 2024','Annual','500','38','110');
insert into Member values(14,'Rohan','Nagar','16 jan 2024','Annual','100','50','70');
insert into Member values(15,'Sanket','Loni','20 Feb 2024','Annual','200','40','110');
insert into Member values(16,'Om','Sangamner','12 oct 2024','Annual','900','10','300');
insert into Member values(17,'Nikita','Pune','18 oct 2024','Annual','10','17','165');
insert into Member values(18,'Sakshi','Beed','12 oct 2024','Annual','20','14','85');
insert into Member values(19,'Amit','Mumbai','14 oct 2024','Annual','800','10','55');
insert into Member values(20,'Rushi','Kokangoan','9 march 2024','Annual','700','2','115');
insert into Member values(21,'Rujuta','Wakdi','11 june 2024','Annual','300','20','105');
insert into Member values(22,'Anu','Sangamner','10 july 2024','Annual','100','60','20');
insert into Member values(23,'Rani','Pune','20 oct 2024','Annual','200','28','100');


select * from Member;

insert into Books values(12,'Mathematic','Aryabhata','200.00','Math');
insert into Books values(13,'Scicene','Rohan','100.00','science');
insert into Books values(14,'Marathi','Sanket','300.00','Marathi');
insert into Books values(15,'Hindi','Rushi','290.00','Hindi');
insert into Books values(16,'database','Stephen','100.00','science');
insert into Books values(17,'IT','joshi','100.00','IT');
insert into Books values(18,'chemistry','surse','300.00','science');
insert into Books values(19,'physics','Amit','100.00','science');
insert into Books values(20,'operating system','gagare','50.00','science');
insert into Books values(21,'java','priti','300.00','scinece');
insert into Books values(22,'pyton','kakde','100.00','science');

select * from Books;


insert into Issue values(1,'12','15','12 feb 2024','14 feb 2024');
insert into Issue values(2,'11','17','2 march 2024','4 feb 2024');
insert into Issue values(3,'13','20','4 april 2024','6 feb 2024');
insert into Issue values(4,'14','22','6 march 2024','8 feb 2024');
insert into Issue values(5,'15','24','8 jan 2024','10 feb 2024');
insert into Issue values(6,'16','26','10 july 2024','12 feb 2024');
insert into Issue values(7,'17','28','14 dec 2024','14 feb 2024');
insert into Issue values(8,'18','30','16 june 2024','16 feb 2024');
insert into Issue values(9,'19','10','18 feb 2024','18 feb 2024');
insert into Issue values(10,'20','12','20 jan 2024','20 feb 2024');

select * from issue;
commit;

