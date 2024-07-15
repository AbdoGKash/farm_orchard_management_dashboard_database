-- To encrypt the password
create extension pgcrypto

-- Create a users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    permissions TEXT NOT NULL
);

-- Create a orchards table 
-- One-to-Many Relationship
CREATE TABLE orchards (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  orchard_name VARCHAR(255) NOT NULL,
  crop_type VARCHAR(255) NOT NULL, -- ex: Lemon
  area INTEGER NOT NULL, -- in Feddans
  water_level INTEGER NOT NULL, -- in mm
  pest_status VARCHAR(255) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) 
);

-- Enter experimental data into the users table
INSERT INTO users (username, password, permissions)VALUES ('abdo',crypt('abdo123', gen_salt('md5')) , 'admin');

-- Enter experimental data into the orchard table
INSERT INTO orchards (user_id, orchard_name, crop_type, area, water_level, pest_status, ) VALUES
(1, 'ORCHARD 1', 'Lemon', 500, 20, 'Healthy'),
(1, 'ORCHARD 2', 'Orange', 450, 62, 'Healthy');

