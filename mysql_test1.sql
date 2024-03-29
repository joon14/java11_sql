use kh;

create table TB_MEMBER (MEMBER_ID varchar(50), MEMBER_PWD varchar(50), 
MEMBER_NAME varchar(50), GRADE int, AREA_CODE varchar(10));

insert into TB_MEMBER values('hong01', 'pass01', '홍길동', 10, '02');
insert into TB_MEMBER values('leess99', 'pass02', '이순신', 10, '032');
insert into TB_MEMBER values('ss50000', 'pass03', '신사임당', 30, '031');
insert into TB_MEMBER values('iu93', 'pass04', '아이유', 30, '02');
insert into TB_MEMBER values('pcs1234', 'pass06', '박철수', 20, '031');
insert into TB_MEMBER values('you_js', 'pass06', '유재석', 10, '02');
insert into TB_MEMBER values('kyh9876', 'pass07', '김영희', 20, '031');

select * from TB_MEMBER;

create table TB_GRADE (GRADE_CODE int, GRADE_NAME varchar(20));

insert into TB_GRADE values(10, '일반회원');
insert into TB_GRADE values(20, '우수회원');
insert into TB_GRADE values(30, '특별회원');

select * from TB_GRADE;

create table TB_AREA (AREA_CODE varchar(10), AREA_NAME varchar(20));

insert into TB_AREA values('02', '서울');
insert into TB_AREA values('031', '경기');
insert into TB_AREA values('032', '인천');

select * from TB_AREA;

-- 문제 1-1.
select AREA_NAME 지역명, MEMBER_ID 아이디, MEMBER_NAME 이름, 
GRADE_NAME 등급명 from TB_MEMBER M
join TB_GRADE G on (G.GRADE = M.GRADE_CODE)
join TB_AREA A USING (AREA_CODE)
where A.AREA_CODE=(select AREA_CODE from TB_MEMBER where MEMBER_NAME='김영희')
order by 이름 asc;

-- 문제 1-2
SELECT MEMBER_ID AS 아이디, MEMBER_PWD 비밀번호, MEMBER_NAME AS 이름, 
GRADE_NAME AS 등급명, AREA_NAME 지역명 FROM TB_MEMBER
JOIN TB_GRADE ON(GRADE_CODE = GRADE)
JOIN TB_AREA USING(AREA_CODE)
WHERE (GRADE, AREA_CODE) = (SELECT GRADE, AREA_CODE FROM TB_MEMBER
WHERE MEMBER_ID LIKE '%1234%')
ORDER BY MEMBER_ID DESC;

-- 문제 1-3
SELECT ROWNUM 번호, MEMBER_ID 아이디, MEMBER_NAME 이름, 
GRADE_NAME 등급명, AREA_NAME 지역명
FROM (SELECT MEMBER_ID, MEMBER_NAME, GRADE_NAME FROM TB_MEMBER
JOIN TB_GRADE ON(GRADE = GRADE_CODE)
JOIN TB_AREA USING(AREA_CODE)
WHERE AREA_NAME IN ('서울', '경기'))
ORDER BY MEMBER_ID;