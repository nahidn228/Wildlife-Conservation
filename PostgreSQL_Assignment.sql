-- Active: 1747405680009@@127.0.0.1@5432@wildlife_conservation
CREATE DATABASE wildlife_conservation;

CREATE TABLE rangers(
  ranger_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region TEXT NOT NULL
)


CREATE TABLE species(
  species_id SERIAL PRIMARY KEY,
  common_name TEXT NOT NULL,
  scientific_name TEXT NOT NULL,
  discovery_date TIMESTAMP,
  conservation_status VARCHAR(30)
)


CREATE  TABLE sightings(
  sighting_id SERIAL PRIMARY KEY,
  ranger_id INT,
  species_id INT,
  sighting_time TIMESTAMP,
  location VARCHAR(50) NOT NULL,
  notes TEXT,
  FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
  FOREIGN KEY (species_id) REFERENCES species(species_id)
)




INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

 INSERT INTO species(common_name, scientific_name, discovery_date,conservation_status) VALUES
 ('Snow Leopard', 'Panthera uncia', '1775-01-01 00:00:00', 'Endangered'),
 ('Bengal Tiger', 'Panthera tigris', '1758-01-01 00:00:00', 'Endangered'),
 ('Red Panda', 'Ailurus fulgens', '1825-01-01 00:00:00', 'Vulnerable'),
 ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01 00:00:00', 'Endangered');

 INSERT INTO sightings (ranger_id, species_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(2, 1, 'Snowfall Pass', '2024-05-18 18:30:00', NULL)





SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;



--(Problem 1) Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains' 

INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');

 -- (Problem 2) Count unique species ever sighted.
 SELECT  COUNT( DISTINCT common_name) AS unique_species_sighted  FROM species;


  -- (Problem 3) Find all sightings where the location includes "Pass".
  SELECT * FROM  sightings WHERE location ILIKE '%pass%' ; -- case insensitive
  SELECT * FROM  sightings WHERE location LIKE '%Pass%' ; -- case sensitive



 -- (Problem 4) List each ranger's name and their total number of sightings.
 SELECT r.name, COUNT(s.sighting_id) AS total_sightings FROM sightings  AS s JOIN rangers AS r ON r.ranger_id = s.ranger_id GROUP BY r.name;


 -- (Problem 5) List species that have never been sighted..

 SELECT species.common_name  AS common_name FROM species  JOIN sightings ON  species.species_id = sightings.sighting_id  WHERE NOT(species.species_id = sightings.species_id );
 



 -- (Problem 6) Show the most recent 2 sightings.

 SELECT sp.common_name, s.sighting_time,r.name AS name FROM sightings AS s 
 INNER JOIN species AS sp ON sp.species_id = s.species_id
 INNER JOIN rangers AS r ON r.ranger_id = s.ranger_id  
 ORDER BY s.sighting_time DESC  LIMIT 2;



 -- (Problem 6) Update all species discovered before year 1800 to have status 'Historic'.

SELECT * FROM species WHERE EXTRACT(YEAR FROM discovery_date) < 1800;
UPDATE species SET conservation_status = 'Historic' WHERE  EXTRACT(YEAR FROM discovery_date) < 1800 ;



 -- (Problem 7) Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

 SELECT sighting_time::TIME AS time_of_day FROM sightings ;

SELECT sighting_id, case 
  WHEN sighting_time::TIME BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
  WHEN sighting_time::TIME BETWEEN  '12:00:00' AND '16:59:59' THEN 'Afternoon'
  WHEN sighting_time::TIME BETWEEN  '17:00:00'  AND '20:59:59' THEN 'Evening'
END AS time_of_day FROM sightings



