--users 테이블 생성
create table users(
    username varchar2(50) primary key --회원 아이디
    ,password varchar2(50) not null --비번
    ,enabled char(1) default '1'
);

insert into users(username, password) values('user00','pw00');
insert into users(username, password) values('member00','pw00');
insert into users(username, password) values('admin00','pw00');

commit;

select * from users order by username asc;

--authiruties 테이블 생성
create table authorities(
    username varchar2(50) not null --회원 아이디
    ,authority varchar2(50) not null --아이디에 권한부여 컬럼
    ,constraint authorities_uername_fk foreign key(username) references users(username)
    --외래키 설정, 외래키 컬럼인 username은 주인 부모 테이블인 users 테이블의 username컬럼을 참조하고 있다. 
    
);

insert into authorities (username,authority) values('user00','ROLE_USER');
insert into authorities (username,authority) values('member00','ROLE_MANAGER');
insert into authorities (username,authority) values('admin00','ROLE_ADMIN');
insert into authorities (username,authority) values('admin00','ROLE_MANAGER');

commit;
select * from authorities order by username;

--고유 인덱스 설정
create unique index ix_auth_username on authorities (username,authority);