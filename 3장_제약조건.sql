/*
	날짜 : 2025/08/08
    이름 : 천수빈
    내용 : 3장 제약조건 실습
*/

-- 실습 3-1. 기본키 실습
create table user2 (
	uid 	varchar(10) primary key,
    name 	varchar(10),
    birth 	char(10),
    addr 	varchar(50)
);

-- 실습 3-2. User2 데이터 추가

-- 실습 3-3. 고유키 실습
create table user3 (
	uid 	varchar(10) primary key,
    name 	varchar(10),
    birth 	char(10),
    hp 		char(13) unique, -- 중복된 값을 허용하지 않음
    addr 	varchar(50)
);

-- 실습 3-4. User3 데이터 추가

-- 실습 3-5. 외래키 실습
create table parent (
	pid 	varchar(10) primary key,
    name 	varchar(10),
    birth 	char(10), 
    addr 	varchar(100)
);

create table child (
	cid 	varchar(10) primary key,
	name 	varchar(10),
	hp 		char(13) unique,
	parent 	varchar(10),
    foreign key (parent) references parent (pid) -- 존재하지 않는 Parent의 pid 값 입력을 차단
);

-- 실습 3-6. Parent, Child 데이터 추가
insert into parent values ('p101', '홍길동', '1999-09-09', '부산시');
insert into child values ('c101', '홍아들', '010-1234-2001', 'p101');
insert into child values ('c102', '김아들', '010-1234-3001', 'p110');
select * from parent;
select * from child;

-- 실습 3-7. Default, Not null 실습
create table user4 (
	uid 	varchar(10) primary key, -- PK 는 not null
    name	varchar(10) not null, -- 반드시 입력 허용
    gender 	char(1), -- 모든 컬럼의 default 는 null
    age 	int default 1,
    hp 		char(13) unique, -- unique 의 default 는 null
    addr	varchar(100)
);

-- 실습 3-8. User4 데이터 추가
insert into user4 values ('a101', '김유신', 'M', 23, '010-1234-0001', '김해시');
insert into user4 values ('a102', '신사임당', 'F', 21, NULL, '강릉시');
select * from user4;

-- 실습 3-9. Check, Auto_Increment 실습
create table user5 (
	seq		int primary key auto_increment, -- seq 시퀀스, 자동 순서 매기기
    name 	varchar(10) not null,
    gender 	char(1) check (gender in ('M', 'F')),
    age 	int default 1 check (age > 0 and age < 100),
    addr	varchar(20)
);

-- 실습 3-10. User5 데이터 추가
insert into user5 (name, gender, age, addr) values ('김유신', 'M', 23, '김해시');
insert into user5 (name, gender, age, addr) values ('신사임당', 'F', 21, '강릉시');
delete from user5 where seq = 2;

insert into user5 (name, gender, age, addr) values ('허난설현', 'F', 21, '광주시');
select * from user5;