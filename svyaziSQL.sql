create table if not exists artist ( -- создание таблицы
	id serial primary key, -- primary key первичный уникальный ключ, обязывает поле быть не пустым 
	name varchar(40) unique not null -- unique все значения уникальны, not null значение не должно быть пустым
);

create table if not exists album (
	id serial primary key,
	name varchar(40) unique not null,
	year integer
);
create table if not exists song (
	id serial primary key,
	name varchar(40) unique not null,
	time numeric (3,2), 
	album_id integer references album (id)
);

create table if not exists artist_album (
	id serial primary key,
	album_id integer not null references album (id),
	artist_id integer not null references artist (id)
);

create table if not exists genre_song (
	id serial primary key,
	name varchar (40) unique not null
);

create table if not exists artist_genre (
	id serial primary key,
	genre_song_id integer not null references genre_song (id),
	artist_id integer references artist (id)
);

create table if not exists collection (
	id serial primary key,
	name varchar(40) unique not null,
	time integer,
	year integer
);

create table if not exists collection_song (
	id serial primary key,
	collection_id integer not null references collection (id),
	song_id integer references song (id)
);