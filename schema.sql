-- DROP TABLE lists.lists;
-- DROP TABLE lists.itineraries;

CREATE DATABASE users;
CREATE DATABASE lists;
CREATE DATABASE businesses;

CREATE TABLE users.users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255) NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE lists.lists (
    list_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date VARCHAR(15) NOT NULL,
    description TEXT NULL
);
CREATE TABLE lists.itineraries (
    list_id INT NOT NULL,
    business_id INT NOT NULL,
    PRIMARY KEY (list_id, business_id),
    FOREIGN KEY (list_id) REFERENCES lists(list_id)
);

CREATE TABLE businesses.businesses (
    business_id INT AUTO_INCREMENT PRIMARY KEY,
    business_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);
-- Insert data into the users table
INSERT INTO users.users (first_name, middle_name, last_name, email)
VALUES
('John', 'A.', 'Doe', 'john.doe@example.com'),
('Jane', NULL, 'Smith', 'jane.smith@example.com'),
('Emily', 'B.', 'Brown', 'emily.brown@example.com'),
('Michael', 'C.', 'Johnson', 'michael.johnson@example.com'),
('Sarah', NULL, 'Davis', 'sarah.davis@example.com');

-- Insert data into the lists table
INSERT INTO lists.lists (user_id, location, date, description)
VALUES
(1, 'SoHo', '2024-12-15', 'Family vacation itinerary'),
(2, 'SoHo', '2024-11-20', 'Work trip planning'),
(3, 'SoHo', '2024-10-05', 'Friends reunion plan'),
(4, 'SoHo', '2024-12-22', 'Beach holiday itinerary'),
(5, 'SoHo', '2024-09-15', 'Tech conference agenda');

-- Insert data into the businesses table
INSERT INTO businesses.businesses (business_name, location, address, category, description)
VALUES
('The Drawing Center', 'SoHo', '35 Wooster St', 'Art Gallery', 'Contemporary drawing exhibitions and educational programs.'),
('The Public Theater', 'SoHo', '425 Lafayette St', 'Theater', 'A renowned theater hosting innovative performances and productions.'),
('The Mercer', 'SoHo', '147 Mercer St', 'Hotel', 'Chic boutique hotel with celebrity clientele and luxurious rooms.'),
('Prince Street Pizza', 'SoHo', '27 Prince St', 'Restaurant', 'Famous for its delicious square slices and classic New York pizza.'),
('SoHo Arts Club', 'SoHo', '212 Lafayette St', 'Art Gallery', 'A contemporary space for art exhibitions, performances, and cultural events.');

-- Insert data into the itineraries table
INSERT INTO lists.itineraries (list_id, business_id)
VALUES
(1, 1),
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5); 
