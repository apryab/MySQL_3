insert into users(id, firstname, lastname, email, phone)
values(58, 'dean', 'fisher', 'aaa@gmail.com', 89852674512);

insert into users
set
	id = 5,
    firstname = 'shaun',
    lastname = 'ember',
    email = 'ember@gmail.com',
    phone = 88888888888
;

select distinct firstname, lastname from users;

select * from users limit 1;

select * from users
where lastname = 'ember' or id = 50;

insert into users
values
(1, 'gena', 'andreev', 'ga1@gmail.com', 89856786767),
(2, 'gena', 'andreev', 'ga2@gmail.com', 89856786767),
(3, 'gena', 'andreev', 'ga3@gmail.com', 89856786767),
(4, 'gena', 'andreev', 'ga4@gmail.com', 89856786767);

update friend_requests
set
	status = 'declined',
    confirmed_at = now()
where
	initiator_user_id = 1 and target_user_id = 3;
    
delete from users
where id = 3;