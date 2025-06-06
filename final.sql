create schema if not exists chessws2;
use chessws2;

-- CREATE SCHEMA
create table if not exists users (
    id              int          not null auto_increment,
    name            varchar(64)  not null unique,
    email           varchar(254) not null unique,
    accountType     varchar(64)  not null default("Student"),
    
    primary key(id)
);

create table if not exists tokens (
    token   varchar(124) not null unique,
    userid  int          not null,

    primary key(token),
    foreign key(userid) references users(id)
);

create table if not exists classes (
    id      int          not null auto_increment,
    name    varchar(124) not null,
    descr   varchar(500) not null,
    coach   int          not null,

    primary key (id),
    foreign key (coach) references users(id)
);

create table if not exists enrollment (
    userid          int not null,
    classid         int not null,

    foreign key (userid)  references users(id),
    foreign key (classid) references classes(id)
);

create table if not exists assignments (
    id              int          not null auto_increment,
    title           varchar(124) not null,
    descr           varchar(500) not null,
    author          int          not null,

    primary key (id),
    foreign key (author) references users(id)
);

create table if not exists curriculum (
    id              int not null auto_increment,
    classid         int not null,
    assignmentid    int not null,

    primary key(id),
    foreign key (classid)       references classes(id),
    foreign key (assignmentId)  references assignments(id)
);

create table if not exists positions (
    id              int          unique auto_increment,
    assignmentid    int          not null,
    fen             varchar(200) not null,
    pgn             varchar(500) not null,
    points          decimal      not null,

    primary key (id),
    foreign key (assignmentid) references assignments(id)
);

create table if not exists scores (
    positionid int not null,
    userid     int not null,
    points     decimal not null check (points >= 0),

    foreign key (positionid) references positions(id),
    foreign key (userid)     references users(id)
);

SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME = 'PRIMARY'
  AND TABLE_SCHEMA = 'chessws2';
  
SELECT 
    table_name AS 'Table',
    column_name AS 'Column',
    constraint_name AS 'Constraint',
    referenced_table_name AS 'Referenced Table',
    referenced_column_name AS 'Referenced Column'
FROM 
    information_schema.key_column_usage
WHERE 
    referenced_table_name IS NOT NULL
    AND table_schema = 'chessws2';
    
SELECT 
    TC.TABLE_NAME, 
    KCU.COLUMN_NAME, 
    TC.CONSTRAINT_NAME
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
    JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU
    ON TC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
WHERE 
    TC.CONSTRAINT_TYPE = 'UNIQUE'
    AND TC.TABLE_SCHEMA = 'chessws2';
    
SELECT 
    TC.TABLE_NAME, 
    CC.CONSTRAINT_NAME, 
    CC.CHECK_CLAUSE
FROM 
    INFORMATION_SCHEMA.CHECK_CONSTRAINTS AS CC
    JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
    ON CC.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
WHERE 
    CC.CONSTRAINT_SCHEMA = 'chessws2';
    
SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    COLUMN_DEFAULT
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    COLUMN_DEFAULT IS NOT NULL
    AND TABLE_SCHEMA = 'chessws2';

-- INSERT DATA
use chessws2;

insert into users (name, email) values('testUser1' , 't1@fake.com');
set @student1 = last_insert_id();
insert into users (name, email) values('testUser2' , 't2@fake.com');
set @student2 = last_insert_id();
insert into users (name, email) values('testUser3' , 't3@fake.com');
set @student3 = last_insert_id();
insert into users (name, email) values('testUser4' , 't4@fake.com');
insert into users (name, email) values('testUser5' , 't5@fake.com');
insert into users (name, email) values('testUser6' , 't6@fake.com');
insert into users (name, email) values('testUser7' , 't7@fake.com');
insert into users (name, email) values('testUser8' , 't8@fake.com');
insert into users (name, email) values('testUser9' , 't9@fake.com');
insert into users (name, email, accountType) values('testUser10', 't10@fake.com', 'Coach');

-- keep track of the coach id that owns classes
set @coachid = last_insert_id();

insert into tokens(token, userid) values('1234abcde', @coachid); -- usually handled via server

insert into classes(name, descr, coach) values('Test Class 1' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 2' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 3' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 4' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 5' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 6' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 7' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 8' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 9' , 'This is a test class.', @coachid);
insert into classes(name, descr, coach) values('Test Class 10', 'This is a test class.', @coachid);
set @classid = last_insert_id();

insert into enrollment(userid, classid) values
    (@student1, @classid),
    (@student2, @classid),
    (@student3, @classid);

insert into assignments(title, descr, author) values('Pins Set One', 'Tactics HW on Pins', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Pins Set Two', 'Tactics HW on Pins', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Forks Set One', 'Tactics HW on Forks', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Forks Set Two', 'Tactics HW on Forks', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Skewers Set One', 'Tactics HW on Skewers', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Skewers Two Two', 'Tactics HW on Skewers', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Attraction Set One', 'Tactics HW on Attraction', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Attraction Set Two', 'Tactics HW on Attraction', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Deflection Set One', 'Tactics HW on Deflection', @coachid);
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into assignments(title, descr, author) values('Deflection Set Two', 'Tactics HW on Deflection', @coachid);
set @assignmentid = last_insert_id();
insert into positions(assignmentid, fen, pgn, points) values
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10),
    (last_insert_id(), '8/8/8/8/8/8/8/8', '[FEN "8/8/8/8/8/8/8/8"] 1. -', 10); -- real chess positions are not being used

insert into curriculum(classid, assignmentid) values(@classid, @assignmentid);

insert into scores(positionid, userid, points) values(1, 1, 10);
insert into scores(positionid, userid, points) values(1, 1, 9);
insert into scores(positionid, userid, points) values(1, 1, 8);
insert into scores(positionid, userid, points) values(1, 1, 7);
insert into scores(positionid, userid, points) values(1, 1, 8);
insert into scores(positionid, userid, points) values(1, 1, 9);
insert into scores(positionid, userid, points) values(1, 1, 4);
insert into scores(positionid, userid, points) values(1, 1, 7);
insert into scores(positionid, userid, points) values(1, 1, 8);
insert into scores(positionid, userid, points) values(1, 1, 10);

-- selects

select count(*) from users;
select * from users;

select count(*) from classes;
select * from classes;

select count(*) from assignments;
select * from assignments;

select count(*) from positions;
select * from positions;

select count(*) from tokens;
select * from tokens;

select count(*) from enrollment;
select * from enrollment;

select count(*) from curriculum;
select * from curriculum;

select count(*) from positions;
select * from positions;

-- FINAL PROBLEMS

-- PROBLEM 5 indexes
create index idx_scores_userid_positionid_points on scores(userid, positionid, points);
create index idx_positions_id_assignmentid on positions(id, assignmentid);
create index idx_scores_positionid on scores(positionid);
create index idx_users_accountType on users(accountType);

-- PROBLEM 1, Subquery
-- this gets all user names and emails that are being taught by a given coach id
select name, email
from users
where id in (
    select userid
    from enrollment
    where classid in (
        select id
        from classes
        where coach = 10
    )
);

-- PROBLEM 2, Updatable Single View Table

-- create view
create or replace view student_users as
    select id, name, email, accountType
    from users
where accountType = 'Student';

-- query view
select * from student_users where id =5;

-- update view
update student_users
set email = 'newemail@student.com'
where id = 5;

-- verify. Should have newemail@student.com
select * from student_users where id =5;

-- PROBLEM 3, SPROC
drop procedure if exists calculate_user_points;

delimiter $$
create procedure calculate_user_points (in input_userid int)
begin
    declare done int default 0;
    declare pos_points decimal(10,2);
    declare total_points decimal(10,2) default 0;
    declare user_accountType varchar(64);

    -- Cursor to loop over all scores for this user
    declare score_cursor cursor for 
        select points from scores where userid = input_userid;
    
    declare continue handler for not found set done = 1;

    -- Get user account type (Student, Coach, etc)
    select accountType into user_accountType from users where id = input_userid;

    open score_cursor;

    read_loop: loop
        fetch score_cursor into pos_points;
        if done = 1 then
            leave read_loop;
        end if;

        -- Calculation varies by account type
        if user_accountType = 'Coach' then
            set total_points = pos_points; -- coach william is always right ;)
        else
            set total_points = total_points + pos_points;
        end if;
    end loop;

    close score_cursor;

    -- Print the total calculated points
    select concat('Total points for user ', input_userid, ': ', total_points) as result;
end $$

delimiter ;

-- call sproc
call calculate_user_points(1)

-- PROBLEM 4, Stored func
delimiter $$

create function get_avg_points_per_assignment(input_userid int)
returns decimal(10,2)
deterministic
reads sql data
begin
    declare total_points decimal(10,2) default 0;
    declare assignment_count int default 0;
    declare avg_points decimal(10,2) default 0;

    -- Sum total points scored by the user
    select sum(s.points)
    into total_points
    from scores s
    join positions p on s.positionid = p.id
    join assignments a on p.assignmentid = a.id
    where s.userid = input_userid;

    -- Count distinct assignments user has scored on
    select count(distinct p.assignmentid)
    into assignment_count
    from scores s
    join positions p on s.positionid = p.id
    where s.userid = input_userid;

    if assignment_count = 0 or total_points is null then
        set avg_points = 0;
    else
        set avg_points = total_points / assignment_count;
    end if;

    return avg_points;
end $$

delimiter ;

-- 'call' func
select get_avg_points_per_assignment(1);
