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
    (@classid, @student1),
    (@classid, @student2),
    (@classid, @student3);

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