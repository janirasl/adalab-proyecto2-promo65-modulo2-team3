CREATE SCHEMA music_db;

USE music_db;

CREATE TABLE genre (
    id_genre INT AUTO_INCREMENT,
    genre_name VARCHAR(55) NOT NULL,
    PRIMARY KEY (id_genre)
);

CREATE TABLE artists (
    id_artist VARCHAR(250),
    artist_name VARCHAR(250) NOT NULL, -- 
    artist_bio LONGTEXT,
    artist_listeners INT,
    artist_playcount INT,
    similar_artist VARCHAR(250),
    PRIMARY KEY (id_artist)
);

CREATE TABLE tracks (
    id_track INT AUTO_INCREMENT,
    id_artist VARCHAR(250) NOT NULL,     -- 
    id_genre INT NOT NULL,
    track_name LONGTEXT NOT NULL,
    year YEAR,
    PRIMARY KEY (id_track),
    CONSTRAINT fk_tracks_artist
        FOREIGN KEY (id_artist)
        REFERENCES artists(id_artist),
	CONSTRAINT fk_tracks_genre
        FOREIGN KEY(id_genre)
        REFERENCES genre(id_genre)
        );
    

INSERT INTO genre 
	VALUES (1, "rock"), (2, "indie"), (3, "latin"), (4, "reggaeton"), (5, "hip-hop")