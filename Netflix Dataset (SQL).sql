create database samples;
use samples;
CREATE TABLE Netflix_titles (
    show_id VARCHAR(10),
    type VARCHAR(10),
    title VARCHAR(255),
    director VARCHAR(255),
    cast TEXT,
    country VARCHAR(100),
    date_added DATE,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(20),
    listed_in TEXT,
    description TEXT
);
desc Netflix_titles;
INSERT INTO Netflix_titles  VALUES
('s11', 'TV Show', 'Vendetta: Truth, Lies and The Mafia', NULL, NULL, 'Italy', '2021-09-24', 2021, 'TV-MA', '1 Season', 'Crime TV Shows, Docuseries, International TV Shows', 'Sicily boasts a bold anti-Mafia coalition. But what happens when those trying to bring down the organized crime syndicate are accused of being criminals themselves?'),
('s12', 'TV Show', 'Bangkok Breaking', 'Kongkiat Komesiri', 'Sukollawat Kanarot, Sushar Manaying, Pavarit Mongkolpisit', NULL, '2021-09-23', 2021, 'TV-MA', '1 Season', 'Crime TV Shows, International TV Shows, TV Action', 'Struggling to earn a living in Bangkok, a man joins a road-rescue service and uncovers a city-wide conspiracy.'),
('s13', 'Movie', 'Je Suis Karl', 'Christian Schwochow', 'Luna Wedler, Jannis Niewöhner, Milan Peschel', 'Germany, Czech Republic', '2021-09-23', 2021, 'TV-MA', '127 min', 'Dramas, International Movies', 'After most of her family is killed in a terrorist bombing, a young woman is unknowingly lured into joining the very group that killed them.'),
('s14', 'Movie', 'Confessions of an Invisible Girl', 'Bruno Garotti', 'Klara Castanho, Lucca Picon, Júlia Gomes', NULL, '2021-09-22', 2021, 'TV-PG', '91 min', 'Children & Family Movies, Comedies', 'When the clever but socially awkward Tetê joins a new school, she will do anything to fit in. But the queen bee among her classmates has other ideas.'),
('s15', 'TV Show', 'Crime Stories: India Detectives', NULL, NULL, NULL, '2021-09-22', 2021, 'TV-MA', '1 Season', 'Docuseries, International TV Shows', 'Cameras follow Bengaluru police on the burning grip of major investigations, offering a rare look into the complex world of Indian law enforcement.'),
('s16', 'Movie', 'Dear White People', NULL, 'Logan Browning, Brandon P. Bell, DeRon Horton', 'United States', '2021-09-22', 2021, 'TV-MA', '4 Seasons', 'TV Comedies, TV Dramas', 'Students of color navigate the daily slights and slippery politics of life at an Ivy League college that isn t as post-racial as it thinks.'),
('s17', 'Movie', 'Europe s Most Dangerous Man: Otto Skorzeny', 'Pedro de Echave García, Pablo Azorín Williams', NULL, NULL, '2021-09-22', 2020, 'TV-MA', '67 min', 'Documentaries, International Movies', 'Through archives and interviews, this documentary examines the life of Otto Skorzeny, one of Hitler s leading SS commanders.'),
('s18', 'TV Show', 'Flipped', NULL, 'Kaitlin Olson, Will Forte, Eva Longoria', NULL, '2021-09-22', 2020, 'TV-14', '1 Season', 'TV Comedies', 'Self-proclaimed home renovation experts Chron and Cricket are kidnapped by a drug cartel and forced to remodel their lavish mansions.'),
('s19', 'Movie', 'Intrusion', 'Adam Salky', 'Freida Pinto, Logan Marshall-Green, Robert John Burke', NULL, '2021-09-22', 2021, 'TV-14', '93 min', 'Thrillers', 'After a deadly home invasion at a couple s dream house, the traumatized wife searches for answers and learns the real danger is just beginning.'),
('s20', 'TV Show', 'Jaguar', NULL, 'Blanca Suárez, Iván Marcos, Óscar Casas', NULL, '2021-09-22', 2021, 'TV-MA', '1 Season', 'International TV Shows, TV Action, TV Dramas', 'In 1960s Spain, a Holocaust survivor joins a group of secret agents seeking justice against the hundreds of Nazis who fled to the country after WWII.'),
('s21', 'TV Show', 'Monsters Inside: The 24 Faces of Billy Milligan', 'Olivier Megaton', NULL, NULL, '2021-09-22', 2021, 'TV-MA', '1 Season', 'Crime TV Shows, Docuseries', 'In the late 1970s, an accused serial rapist claims multiple personalities control his behavior, setting off a legal storm that gripped America.'),
('s22', 'Movie', 'Resurrection: Ertugrul', NULL, 'Engin Altan Düzyatan, Serdar Gökhan, Hülya Darcan', 'Turkey', '2021-09-22', 2018, 'TV-14', '5 Seasons', 'International TV Shows, TV Action, TV Dramas', 'When a good deed inadvertently endangers his clan, a 13th-century Turkish warrior agrees to fight a sultan s enemies in exchange for new land.');

SELECT country, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY country
ORDER BY total_titles DESC;

SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type
ORDER BY total DESC;

SELECT rating, COUNT(*) AS count_by_rating
FROM netflix_titles
GROUP BY rating
ORDER BY count_by_rating DESC;

SELECT release_year, COUNT(*) AS count_by_year
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;

SELECT country, COUNT(*) AS tv_shows_count
FROM netflix_titles
WHERE type = 'TV Show'
GROUP BY country
ORDER BY tv_shows_count DESC
LIMIT 5;

SELECT title, release_year
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY release_year DESC;

SELECT title, date_added
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY date_added DESC;

SELECT title, type
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY title ASC;

SELECT director, COUNT(*) AS total_titles
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

SELECT rating, AVG(release_year) AS avg_release_year
FROM netflix_titles
GROUP BY rating
ORDER BY avg_release_year DESC;

SELECT country, type, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country, type
ORDER BY total DESC;

SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 5;

SELECT 
    DATE_FORMAT(date_added, '%Y-%m') AS month_added,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY month_added
ORDER BY month_added DESC;

SELECT listed_in, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;

SELECT release_year, type, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year, type
ORDER BY release_year DESC, type;