create database if not exists SocialMediaDB;

use SocialMediaDB;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;


CREATE TABLE users (
	username varchar(10) not null,
    password varchar(8) not null,
    email varchar(30) not null,
	first_name varchar(15) not null,
	last_name varchar(15) not null,
	primary key (username)
);

CREATE TABLE posts (
	id int not null auto_increment,
	username varchar(10) not null,
	date_time datetime default current_timestamp,
	content varchar(300) not null,
	primary key (id),
	foreign key (username) references users(username)
);

CREATE TABLE comments (
	id int not null auto_increment,
	username varchar(10) not null,
	date_time datetime default current_timestamp,
	content varchar(300) not null,
	posts_id int not null,
	primary key(id),
    foreign key (username) references users(username),
	foreign key (posts_id) references posts(id)	
);