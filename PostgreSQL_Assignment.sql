-- Active: 1747405680009@@127.0.0.1@5432@conservation_db
CREATE DATABASE conservation_db;

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
  ranger_id INT REFERENCES rangers(ranger_id) ,
  species_id INT REFERENCES species(species_id),
  sighting_time TIMESTAMP,
  location VARCHAR(50) NOT NULL,
  notes TEXT
)

DELETE FROM rangers;
DROP TABLE rangers;

INSERT INTO rangers (name, region) VALUES
('David Black', 'Coastal Forest'),
('Eva Stone', 'Savannah Plains'),
('Frank Moore', 'Desert Fringe'),
('Grace Lee', 'Wetland Reserve'),
('Henry Clark', 'Tropical Highlands'),
('Isla Adams', 'Rainforest Zone'),
('Jack Turner', 'Glacier Bay'),
('Kara Bell', 'Volcanic Ridge');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('African Elephant', 'Loxodonta africana', '1797-01-01', 'Vulnerable'),
('Bald Eagle', 'Haliaeetus leucocephalus', '1766-01-01', 'Least Concern'),
('Giant Panda', 'Ailuropoda melanoleuca', '1869-01-01', 'Vulnerable'),
('Siberian Tiger', 'Panthera tigris altaica', '1929-01-01', 'Endangered'),
('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Endangered'),
('Komodo Dragon', 'Varanus komodoensis', '1912-01-01', 'Vulnerable'),
('Amur Leopard', 'Panthera pardus orientalis', '1857-01-01', 'Critically Endangered'),
('Green Sea Turtle', 'Chelonia mydas', '1758-01-01', 'Endangered');


INSERT INTO sightings (ranger_id, species_id, location, sighting_time, notes) VALUES
(22, 2, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(21, 1, 'River Bend', '2024-05-11 14:30:00', 'Tracks found near water'),
(26, 6,'Forest Edge', '2024-05-12 06:15:00', 'Fresh scat observed'),
(23, 3,'Highland Trail', '2024-05-13 18:50:00', 'Heard distant calls'),
(27, 7,'Lake View', '2024-05-14 09:05:00', 'Animal seen drinking from lake'),
(24, 4,'North Slope', '2024-05-15 20:20:00', 'Thermal image recorded'),
(22, 8,'Southern Marsh', '2024-05-16 05:40:00', 'Bird nest spotted in tree'),
(25, 5,'Dry Creek', '2024-05-17 16:10:00', 'Dust prints near stream bed');




DROP TABLE sightings;
DELETE FROM sightings;



SELECT * FROM sightings;
SELECT * FROM rangers;
SELECT * FROM species;







