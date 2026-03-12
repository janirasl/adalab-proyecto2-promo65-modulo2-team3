-- Realiza consultas SQL para responder a las siguientes preguntas:

 -- 1. ¿Cuál es el artista con más canciones?
SELECT a.artist_name AS artista, COUNT(t.id_track) AS total_canciones 
	FROM tracks AS t
	INNER JOIN artists AS a -- inner join para unir los datos que coincidan entre la tabla artistas y canciones 
		ON t.id_artist = a.id_artist
	GROUP BY a.artist_name -- agrupamos el número de canciones por artista 
	ORDER BY total_canciones DESC -- ordenamos para que salga el que tiene más canciones primero 
    LIMIT 1; -- Bad Bunny: 96 canciones -- limitamos a 1 para que solo salga el que tiene más canciones 
    
-- 2. Y por género, ¿cuál es el artista con más canciones?
SELECT genre_name AS género, artist_name AS artista, total_canciones
	FROM ( -- crea una tabla temporal donde cada artista tiene un puesto en su género 
		SELECT g.genre_name, a.artist_name, COUNT(t.id_track) AS total_canciones, -- cuenta el número de canciones 
			RANK() OVER 
				(PARTITION BY g.genre_name ORDER BY COUNT(t.id_track) DESC) AS ranking -- crea un ranking dividiendo a los artistas por género y ordenándolos de mayor a menor 
		FROM genre g
		INNER JOIN tracks t 
			ON g.id_genre = t.id_genre -- unimos las tablas géneros y artistas 
		INNER JOIN artists a 
			ON t.id_artist = a.id_artist
		GROUP BY g.genre_name, a.id_artist
	) AS subconsulta
	WHERE ranking = 1; -- limitamos a 1

 -- 3. ¿Qué género es el mejor valorado?
SELECT g.genre_name AS género, AVG(a.artist_listeners) AS oyentes_promedio -- usamos average para sacar el promedio de oyentes 
	FROM tracks AS t
	INNER JOIN artists AS a 
		ON t.id_artist = a.id_artist
	INNER JOIN genre AS g 
		ON t.id_genre = g.id_genre
	GROUP BY g.genre_name
	ORDER BY oyentes_promedio DESC;

 -- 4. ¿En qué año se lanzaron más canciones?
SELECT year AS año, COUNT(track_name) AS canciones_lanzadas
	FROM tracks
	GROUP BY year
    ORDER BY COUNT(track_name) DESC;

-- 5. ¿Cuál es el top 5 de artistas con más oyentes?  
SELECT artist_name AS artista, artist_listeners AS oyentes
	FROM artists
	ORDER BY artist_listeners DESC
	LIMIT 5;
    
-- 6. ¿Cuál es el artista más valorado de cada año?    
SELECT año, artista, promedio_total
	FROM (
		SELECT t.year AS año, a.artist_name AS artista, 
			ROUND((a.artist_listeners + a.artist_playcount) / 2, 2) AS promedio_total, -- calculamos el promedio del éxito de los artistas
			RANK() OVER (PARTITION BY t.year  
							ORDER BY (a.artist_listeners + a.artist_playcount) / 2 DESC -- dividimos por año 
							) AS posicion 
		FROM tracks AS t
		INNER JOIN artists AS a 
			ON t.id_artist = a.id_artist
		GROUP BY t.year, a.id_artist 
	) AS ranking_anual
	WHERE posicion = 1 -- limitamos el mayor de cada ranking 
	ORDER BY año DESC;

-- 7. ¿Cuales son los artistas similares que se repite al menos cinco veces? 
SELECT a.similar_artist AS artista_similar, COUNT(a.similar_artist) AS repeticiones
	FROM artists AS a 
    GROUP BY a.similar_artist 
    HAVING COUNT(a.similar_artist) >= 5
    ORDER BY repeticiones DESC;

--  8. ¿Cuántos artistas españoles hay en nuestra bbdd? Y agrupados por género. 
SELECT DISTINCT(g.genre_name) AS género, a.artist_name AS artista
	FROM tracks AS t
	INNER JOIN artists AS a 
		ON t.id_artist = a.id_artist
	INNER JOIN genre AS g 
		ON t.id_genre = g.id_genre
	WHERE a.artist_bio REGEXP '\\b(español|española|españa|madrid|barcelona)\\b'; -- usamos regex para buscar patrones 
	
SELECT g.genre_name AS Género, COUNT(DISTINCT a.id_artist) AS Total_Artistas_Españoles
	FROM tracks AS t
		INNER JOIN artists AS a 
			ON t.id_artist = a.id_artist
		INNER JOIN genre AS g 
			ON t.id_genre = g.id_genre
	WHERE a.artist_bio REGEXP '\\b(español|española|españa|madrid|barcelona)\\b'
	GROUP BY g.genre_name
	ORDER BY Total_Artistas_Españoles DESC;
    
    
    
    
    
    
   


