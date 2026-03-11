CREATE SCHEMA music_db;

USE music_db;

CREATE TABLE genre (
    id_genre INT AUTO_INCREMENT,
    genre_name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_genre)
);

CREATE TABLE artists (
    id_artist VARCHAR(50),
    artist_name VARCHAR(45) NOT NULL, -- 
    artist_bio LONGTEXT,
    artist_listeners INT,
    artist_playcount INT,
    similar_artist VARCHAR(100),
    PRIMARY KEY (id_artist)
);

CREATE TABLE tracks (
    id_track INT AUTO_INCREMENT,
    id_artist VARCHAR(50) NOT NULL,     -- 
    id_genre INT NOT NULL,
    track_name VARCHAR(45) NOT NULL,
    year YEAR,
    PRIMARY KEY (id_track),
    CONSTRAINT fk_tracks_artist
        FOREIGN KEY (id_artist)
        REFERENCES artists(id_artist),
	CONSTRAINT fk_tracks_genre
        FOREIGN KEY(id_genre)
        REFERENCES genre(id_genre)
        );
    
        
        