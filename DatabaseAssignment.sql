--searches if users already exists and deletes it
drop table if exists follow;
drop table if exists likes;
drop table if exists photos;
drop table if exists users;

--user ID is Serial which stores a sequential integer is automatically assigned by the database when a new row is created this eliminates redundancy in code
--constraints are used to specify rules  for the data in the table.
--a primary key is the column or columns that contain values that uniquely identify each row in a table
--here we create a new table called users and initialising the datttypes within the table
create table users(userID SERIAL, username varchar(100) NOT null unique, created_at date, constraint user_pk primary key (userID));

--insert into helps us insert data within the table allowing us to populate it
insert into users(username, created_at) values 
('sgrindall0', '2023-01-19'),
('ekembry1', '2023-06-08'),
('athumann2', '2023-01-24'),
('eprover3', '2023-02-18'),
('mdahlborg4', '2023-07-26'),
('bwestraw5', '2023-04-18'),
('rmariner6', '2023-01-26'),
('aphilipp7', null),
('hstrick8', '2023-04-22'),
('kduinkerk9', '2023-01-08'),
('iolifaunta', '2023-04-20'),
('lubsdellb', '2023-07-30'),
('lstollmeierc', '2023-01-26'),
('jhutchinsond', null),
('esalmane', '2023-02-20'),
('lbowerbankf', '2023-10-12'),
('kgraemeg', '2023-09-21'),
('bpriestleyh', '2023-09-07'),
('bspearei', '2023-08-15'),
('wbodillj', null),
('ghustingsk', '2023-07-08'),
('tsprossonl', null),
('mphelipeaum', '2023-10-20'),
('jantyshevn', null),
('ctyerso', '2023-02-10');


--this allows use to select the data within the database we created so we can visually see the data in the table.
select * from users;


create table photos(photoID SERIAL, imageURL varchar(100), userID INT not null references users(userID), releaseDate date, constraint photo_pk primary key(photoID));
insert into photos(imageURL, userID, releaseDate) values
('http://dummyimage.com/126x100.png/dddddd/000000', 12, '2023-09-17'),
('http://dummyimage.com/122x100.png/cc0000/ffffff', 22, '2022-12-22'),
('http://dummyimage.com/118x100.png/cc0000/ffffff', 5, '2022-12-02'),
('http://dummyimage.com/109x100.png/cc0000/ffffff', 6, '2023-01-01'),
('http://dummyimage.com/109x100.png/cc0000/ffffff', 21, '2022-11-05'),
('http://dummyimage.com/183x100.png/5fa2dd/ffffff', 24, '2023-03-08'),
('http://dummyimage.com/124x100.png/5fa2dd/ffffff', 1, null),
('http://dummyimage.com/211x100.png/cc0000/ffffff', 19, '2023-02-18'),
('http://dummyimage.com/106x100.png/cc0000/ffffff', 14, '2023-03-10'),
('http://dummyimage.com/185x100.png/5fa2dd/ffffff', 23, '2023-07-03'),
('http://dummyimage.com/230x100.png/5fa2dd/ffffff', 14, null),
('http://dummyimage.com/144x100.png/cc0000/ffffff', 18, '2022-11-02'),
('http://dummyimage.com/226x100.png/5fa2dd/ffffff', 18, '2023-05-27'),
('http://dummyimage.com/210x100.png/ff4444/ffffff', 8, '2022-12-02'),
('http://dummyimage.com/171x100.png/cc0000/ffffff', 24, null),
('http://dummyimage.com/219x100.png/ff4444/ffffff', 2, '2023-07-10'),
('http://dummyimage.com/236x100.png/dddddd/000000', 6, '2023-04-25'),
('http://dummyimage.com/111x100.png/dddddd/000000', 6, null),
('http://dummyimage.com/230x100.png/5fa2dd/ffffff', 7, '2022-12-14'),
('http://dummyimage.com/236x100.png/dddddd/000000', 4, '2023-09-19'),
('http://dummyimage.com/198x100.png/ff4444/ffffff', 23, '2023-02-07'),
('http://dummyimage.com/107x100.png/dddddd/000000', 9, null),
('http://dummyimage.com/186x100.png/dddddd/000000', 10, '2023-10-14'),
('http://dummyimage.com/172x100.png/cc0000/ffffff', 20, '2023-04-25'),
('http://dummyimage.com/115x100.png/dddddd/000000', 20, null);

select * from photos;

--there are 2 primary keys in this table
create table likes(userID INT not null references users(userID), photoID INT not null references photos(photoID), date_of_like date, primary key(userID, photoID));
insert into likes(userID, photoID, date_of_like) values
(19, 17, '2023-05-25'),
(21, 7, '2023-02-17'),
(2, 18, '2023-08-03'),
(3, 23, '2023-08-01'),
(10, 4, '2023-05-28'),
(7, 10, '2023-06-12'),
(22, 25, null),
(5, 16, null),
(16, 6, '2023-04-20'),
(9, 11, '2023-10-21'),
(20, 7, '2023-01-22'),
(10, 3, '2023-10-04'),
(1, 16, '2023-07-12'),
(21, 16, '2023-01-08'),
(23, 5, null),
(3, 6, null),
(21, 6, '2022-12-03'),
(16, 16, '2023-02-15'),
(17, 18, '2022-11-22'),
(10, 17, '2023-08-04'),
(12, 10, null),
(18, 25, '2023-10-19'),
(21, 24, '2022-12-05'),
(1, 6, '2023-03-15'),
(10, 19, '2023-08-14');
select * from likes;

create table follow(follow_id INT not null references users(userID), followee_id INT not null references users(userID), date_followed date, time_Created time, primary key(follow_id, followee_id));
insert into follow(follow_id, followee_id, date_followed, time_Created) values
(16, 3, '2022-12-20', '3:42 AM'),
(18, 14, '2023-06-01', '1:51 PM'),
(13, 7, '2023-02-08', '4:57 PM'),
(16, 7, '2023-06-30', null),
(4, 21, '2023-09-13', '1:42 AM'),
(10, 23, '2023-08-05', null),
(14, 3, '2022-10-30', '5:32 PM'),
(21, 18, '2023-06-29', '1:30 PM'),
(19, 3, '2022-12-25', '9:29 PM'),
(10, 12, '2023-08-25', '2:01 PM'),
(1, 18, '2023-10-22', '9:49 AM'),
(18, 13, '2022-11-16', '8:03 PM'),
(13, 13, '2023-03-25', '7:26 PM'),
(3, 18, '2022-12-09', '2:39 AM'),
(19, 10, '2023-03-13', '3:34 AM'),
(14, 10, '2023-09-18', null),
(14, 7, '2023-05-29', '12:03 PM'),
(2, 17, '2023-01-27', '12:48 PM'),
(24, 16, '2023-08-16', null),
(4, 24, '2023-09-14', '10:53 PM'),
(20, 24, '2023-01-24', '2:24 AM'),
(6, 19, '2023-06-06', null),
(23, 15, '2023-07-13', '5:16 AM'),
(18, 12, '2023-04-20', '5:51 AM'),
(10, 8, '2023-08-12', '6:18 AM');


-----Q12----
CREATE OR REPLACE FUNCTION auto_follow()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO follow (follow_id, followee_id, date_followed)
VALUES (NEW.userID, (SELECT userID FROM photos WHERE photoID = NEW.photoID), NOW());
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER auto_follow_trigger
AFTER INSERT ON likes
FOR EACH ROW
EXECUTE FUNCTION auto_follow();

INSERT INTO likes (userID, photoID, date_of_like) VALUES (1, 4, '2023-09-13');
INSERT INTO likes (userID, photoID, date_of_like) VALUES (5, 23, '2023-08-10');
INSERT INTO likes (userID, photoID, date_of_like) VALUES (2,24, '2023-10-23');

select * from follow;

--selecting the usernames from users and then joining them with the likes table then we specify the join conditions
-- by using ON where then we equal userID from likes to the userID from the users
-- then we use where to select the photoID where the users liked
SELECT users.username FROM users JOIN likes ON
users.userID = likes.userID where likes.photoID = 1;

select users.username from users join follow on users.userID = follow.followee_id where follow.follow_id = 5;

select users.username from users join likes on users.userID = likes.userID where likes.date_of_like < '2020/04/19';

--question 1
select users.username from users join follow on users.userID = follow.follow_id where follow.followee_id > 1;

--question 2
select photos.imageURL from photos join likes on photos.photoID = likes.photoID where likes.userID = 2;

--question 3
select users.username from users join photos on users.userID = photos.photoID where photos.photoID is null;

--question 4
select users.username from users join likes on users.userID = likes.userID where likes.userID = likes.photoID;

--question 5
select users.username from users join likes on users.userID = likes.photoID where likes.photoID is null;

--question 6
select users.username from users join likes on users.userID = likes.photoID where likes.photoID is not null;

-- question 7
select username from users where length(username) <10;

--question 8
select * from users where username like '%n';

--question 9
select replace(username, 'athumann2', 'brown_cat') from users;

--replace null values
select userID, username, coalesce(created_at, '2023-09-13') from users;

---------------week9 Q1 -------------------------
select 
	username as "username", COUNT(photoID) as "Number of photos"
from
	users
join
	photos on users.userID = photos.userID
group by
	username
order by
	COUNT(photoID) desc;

------------Q2------------
select
    likes.photoID,
    COUNT(likes.userID) as "Number of Likes"
from
    likes
group by
    likes.photoID
order by
    COUNT(likes.userID) desc;

---------Q3----------
select
    users.username as "Username",
    ----we use to_char to change the date to a different format within the single quotes
    --min gets the earliest photo 
    to_char(min(photos.releaseDate), 'DD/MM/YYYY') AS "Date of Earliest Photo"
from
    users
join
    photos on users.userID = photos.userID
group by
    users.username
order by
----we order it by ascending order so we pick out the top result which will be outputted using LIMIT
    min(photos.releaseDate) asc;
   
----LAB10----
----Q1-----
explain analyze select * from users;
drop index if EXISTS user_pk_index;
create index user_pk_index on users(userID);

explain analyze select * from users;

----Q2----
explain analyze select releasedate from photos order by releasedate DESC;
drop index if EXISTS photos_releaseDate_index;
create index photos_releaseDate_index ON photos (releaseDate);
explain analyze select releasedate from photos order by releasedate DESC;

----Q3----

select distinct users.username
from users
join follow on users.userID = follow.follow_id
where follow.followee_id = (select userID from users where username = 'athumann2')

union

select distinct users.username
from users
join follow on users.userID = follow.followee_id
where follow.follow_id = (select userID from users where username = 'athumann2');

----Q4----
select userID from likes 

intersect

select follow_id from follow;





