-- Realiza consultas SQL para responder a las siguientes preguntas:

 -- ¿Cuál es el artista con más albums? .. canciones?
 SELECT 
a.artist_name,
COUNT(t.id_track) AS total_albums
FROM tracks t
JOIN artists a ON t.id_artist = a.id_artist
GROUP BY a.artist_name
ORDER BY total_albums DESC
LIMIT 1; --  BAD BUNNY 96   es el que ams canciones tiene!.


 -- ¿Qué género es el mejor valorado?
SELECT 
g.genre_name,
AVG(a.artist_listeners) AS promedio_listeners
FROM tracks t
JOIN artists a ON t.id_artist = a.id_artist
JOIN genre g ON t.id_genre = g.id_genre
GROUP BY g.genre_name
ORDER BY promedio_listeners DESC
LIMIT 1; -- mejor genero valorado es rock con un promedio 176733.


 -- ¿En qué año se lanzaron más álbumes?

-- ¿Cuál es la canción mejor valorada?

-- ¿Cuál es el artista con más valoración?
SELECT 
artist_name,
artist_listeners
FROM artists
ORDER BY artist_listeners DESC
LIMIT 20;
-- ¿Cuál es el album más valorado de los años pares de mi selección?

-- ¿Qué país tiene má artistas? (ordenar por popularidad)

-- ¿Qué artista estuvo má tiempo y cuántos albums tiene?

SELECT * FROM artists;
SELECT * FROM tracks;
-- ver cuantos artistas hay en el genero regaeton.

SELECT COUNT(DISTINCT a.id_artist) AS total_artistas_reggaeton
FROM tracks t
JOIN artists a ON t.id_artist = a.id_artist
JOIN genre g ON t.id_genre = g.id_genre
WHERE g.genre_name = 'reggaeton'; -- 61 artistas.

-- canciones totales--
select COUNT(*) total_canciones
FROM tracks; -- 5636 canciones.
-- artistas totales--

SELECT COUNT(*)total_artistas
FROM artists; -- 2001 artistas.
-- quien es el mas caciones tiene?--
SELECT 
a.artist_name,
COUNT(t.id_track) AS total_albums
FROM tracks t
JOIN artists a ON t.id_artist = a.id_artist
GROUP BY a.artist_name
ORDER BY total_albums DESC
LIMIT 1; --  BAD BUNNY  es el que ams canciones tiene!.

-- ¿ que genero fue mas popular en 2019? --
 SELECT 
g.genre_name,
AVG(a.artist_listeners) AS popularidad_media
FROM tracks t
JOIN artists a ON t.id_artist = a.id_artist
JOIN genre g ON t.id_genre = g.id_genre
WHERE t.year = 2017
GROUP BY g.genre_name
ORDER BY popularidad_media DESC
LIMIT 5;



