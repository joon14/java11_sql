-- 테이블 생성
create table member(no int not null, id varchar(20) primary key, pw varchar(300), name varchar(100), birth timestamp, email varchar(300));

-- 시퀀스 생성
create sequence c##test123.mem_seq increment by 1 start with 1 minvalue 1 maxvalue 9999 nocycle;

-- 데이터 추가
insert into member values (mem_seq.nextval, 'jung', '1234', '정도준', '1998-01-04', 'jdj@gmail.com');
insert into member values (mem_seq.nextval, 'kim', '1004', '김기태', '1981-12-25', 'kkt@gmail.com');
insert into member values (mem_seq.nextval, 'kims', '2345', '김응원', '1988-02-20', 'kim@gmail.com');
insert into member values (mem_seq.nextval, 'cho', '9876', '조우진', '1996-12-12', 'cho@gmail.com');
insert into member values (mem_seq.nextval, 'kang', '9886', '강우진', '1986-12-12', 'kang@gmail.com');
insert into member values (mem_seq.nextval, 'lee', '1006', '이유진', '1991-08-02', 'lee@gmail.com');

-- 데이터 검색
select * from member;
-- 생일이 1990년생~1996년생인 회원의 id, name, birth 컬럼을 검색
select id, name, birth from member where birth>='1990-01-01' and birth<='1996-12-31';
select id, name, birth from member where birth between '1990-01-01' and '1996-12-31';

-- 'i%' : i로 시작하는
-- '%i' : i로 끝나는
-- '%i%' : i를 포함하는
-- id에 'g'로 끝나는 회원의 id, name, birth 컬럼을 검색
select id, name, birth from member where id like '%g';
-- id에 'k'나 'o'가 포함된 회원의 id, name 컬럼을 검색
select id, name from member where id like '%k%' or id like '%o%';

-- id가 'kim', 'cho', 'lee'인 회원 정보(member)를 검색
select * from member where id='kim' or id='cho' or id='lee';
select * from member where id in('kim','cho','lee');
-- id가 'kim', 'cho', 'lee'가 아닌 회원 정보(member)를 검색
select * from member where id not in ('kim', 'cho', 'lee');

-- 컬럼명이 길거나 수식이나 함수를 적용하여 컬럼을 구성할 경우, 컬럼에 대한 alias(별칭)를 붙일 수 있다.
-- 회원(member) 테이블로부터 id, name, name 중 성씨를 검색
select id, name, substr(name,1,1) as surname from member;
-- java에서 rs.getString("surname"); 처럼 alias로 호출해야함

select * from member;

-- 데이터 변경
-- id가 'kang'인 회원의 이메일(email)을 'kang@naver.com'로 변경
update member set email='kang@naver.com' where id='kang';
-- id가 'lee'인 회원의 이메일(email)을 'lee@daum.net'로 변경
update member set email='lee@daum.net' where id='lee';

-- 데이터 삭제
-- id가 'kims'인 회원을 강제탈퇴하도록 한다.
delete from member where id='kims';

-- 테이블 구조 변경
alter table member add regdate timestamp default sysdate;

desc member;

select * from member;


alter table temp2add constraints key1 primary key(no);

-- EMP(직원) 테이블
create table emp(no int, name varchar(100), pcode int, constraints key2 primary key(no));

insert into emp values(1,'김', 1);
insert into emp values(2,'이', 2);
insert into emp values(3,'이', 3);
insert into emp values(4,'이', 4);
insert into emp values(5,'이', 5);

update emp set name='박' where no=3;
update emp set name='최' where no=4;
update emp set name='정' where no=5;

-- POS(직위) 테이블
create table pos(pcode int primary key, pname varchar(100));
insert into pos values(1, '이사');
insert into pos values(2, '부장');
insert into pos values(3, '과장');
insert into pos values(4, '사원');
insert into pos values(5, '인턴');
-- 참조무결성 원칙, 외래키를 설정하지 못함 / 단, 제약조건 설정 시 기본키 조건이 만족되지 않으면 실행할 수 없음

select * from emp;
select * from pos;
-- emp 테이블의 pcode는 pos pcode를 참조한다는 뜻
alter table emp add constraints fkey foreign key (pcode) references pos (pcode);
-- 검색할 때 값은 대문자로 검색
select * from ALL_CONSTRAINTS where OWNER='C##TEST123';
select * from ALL_CONSTRAINTS where TABLE_NAME='EMP';

-- KEY2 제거
alter table emp drop constraint key2;

-- 테이블 제거
drop table pos cascade constraints;

desc pos;
desc emp;

commit;