/*
	날짜 : 2025/08/08
    이름 : 천수빈
    내용 : 2장 연습문제 실습
*/

use studydb;
create table Tb1User (
	user_id		varchar(10) primary key,
    user_name 	varchar(10) not null,
	user_hp 	char(13),
    user_age 	int,
    user_addr 	varchar(100)
);

create table Tb1Product (
	prod_no 	 varchar(10) primary key,
    prod_name 	 varchar(10),
    prod_price 	 int,
    prod_stock 	 int, 
    prod_company varchar(10),
    prod_date 	 Date
);

drop table Tb1Product;

insert into Tb1User values ('p101', '김유신', '010-1234-1001', 25, '경남 김해시'); 
insert into Tb1User values ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
insert into Tb1User (user_id, user_name, user_age, user_addr) values ('p103', '장보고', 31, '전남 완도군');
insert into Tb1User (user_id, user_name, user_addr) values ('p104', '강감찬', '서울시 중구');
insert into Tb1User (user_id, user_name, user_hp, user_age) values ('p105', '이순신', '010-1234-1005', 50);

insert into Tb1Product values ('1001', '냉장고', 800000, 25, 'LG전자', '2022-01-06');
insert into Tb1Product values ('1002', '노트북', 1200000, 120, '삼성전자', '2022-01-07');
insert into Tb1Product values ('1003', '모니터', 350000, 35, 'LG전자', '2023-01-13');
insert into Tb1Product values ('1004', '세탁기', 1000000, 80, '삼성전자', '2021-01-01');
insert into Tb1Product values ('1005', '컴퓨터', 1500000, 20, '삼성전자', '2023-10-01');
insert into Tb1Product (prod_no, prod_name, prod_price, prod_stock) values ('1006', '휴대폰', 950000, 102);

select * from Tb1User;
select user_name, user_hp From Tb1User;
select * from Tb1User where user_id='p102';
select * from Tb1User where user_id='p104' or user_id='p105';
select * from tb1user where user_addr='부산시 금정구';
select * from Tb1User where user_age > 30;
select * from Tb1User where user_hp is null;
update Tb1User set user_age=42 where user_id='p104';
update Tb1User set user_addr='부산시 진구' where user_id='p105';
delete from Tb1User where user_id='p103';

select * from tb1product;
select prod_name from tb1product;
select prod_name, prod_company, prod_price from tb1product;
select * from tb1product where prod_company='LG전자';
select * from tb1product where prod_company='삼성전자';
update tb1product set
					prod_company='삼성전자',
                    prod_date='2024-01-01'
                    where
                    prod_no=1006; -- 오류 해결하기