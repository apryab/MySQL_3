drop database if exists vk;
create database vk;
use vk;

drop table if exists users;
create table users(
	id serial primary key, -- PRIMARYPRIMARYbigint unsigned not null auto_increment unique
    firstname varchar(50),
    lastname varchar(50),
    email varchar(200) unique,
    phone bigint,
    index user_index_phone(phone),
    index user_firstname_lastname_index(firstname, lastname)
);

drop table if exists `profile`;
create table `profile`(
	user_id serial primary key,
    gender char(1),
    birthday date,
    photo_id bigint unsigned null,
    created_at datetime default now(),
    hometown varchar(100),
    foreign key (user_id) references users(id)
);

drop table if exists messages;
create table messages(
	id serial primary key,
    from_user_id bigint unsigned not null,
    to_user_id bigint unsigned not null,
    body text,
    created_at datetime default now(),
    index messages_from_user_id(from_user_id),
    index messages_to_user_id(to_user_id),
    foreign key (from_user_id) references users(id),
    foreign key (to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests(
	initiator_user_id bigint unsigned not null,
    target_user_id bigint unsigned not null,
    `status` enum('requested', 'approved', 'unfriended', 'declined'),
    requested_at datetime default now(),
    confirmed_at datetime,
    
    primary key (initiator_user_id, target_user_id),
    index (initiator_user_id),
    index (target_user_id),
    foreign key (initiator_user_id) references users(id),
    foreign key (target_user_id) references users(id)
);

drop table if exists likes;
create table likes(
	like_from_user_id bigint unsigned not null,
    like_to_user_id bigint unsigned not null,
    like_given_at datetime default now(),
    
    primary key (like_from_user_id, like_to_user_id),
    index (like_from_user_id),
    index (like_to_user_id),
    foreign key (like_from_user_id) references users(id),
    foreign key (like_to_user_id) references users(id)
);

drop table if exists communities;
create table communities(
	id serial primary key,
    name varchar(150),
    index communities_name_idx(name)
);

drop table if exists users_communities;
create table users_communities(
	user_id bigint unsigned not null,
    community_id bigint unsigned not null,
    primary key(user_id, community_id),
    foreign key (user_id) references users(id),
    foreign key (community_id) references communities(id)
);

drop table if exists media_types;
create table media_types(
	id serial primary key,
    name varchar(255),
    created_at datetime default now(),
    updated_at datetime default current_timestamp on update current_timestamp
);

drop table if exists media;
create table media(
	id serial primary key,
    media_type_id bigint unsigned not null,
    user_id bigint unsigned not null,
    body text,
    filename varchar(255),
    size int,
    metadata json,
    created_at datetime default now(),
    updated_at datetime default current_timestamp on update current_timestamp,
    index (user_id),
    foreign key (user_id) references users(id),
    foreign key (media_type_id) references media_types(id)
);

drop table if exists photo_albums;
create table photo_albums(
	id serial,
    name varchar(100) default null,
    user_id bigint unsigned default null,
    
    primary key (id),
    foreign key (user_id) references users(id)
);

    
    
