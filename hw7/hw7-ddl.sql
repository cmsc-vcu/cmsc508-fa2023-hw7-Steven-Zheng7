# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skill_id int not null,
    skill_name varchar(255) not null,
    skill_description varchar(255) not null,
    skill_tag varchar(255) not null,
    skill_url varchar(255),
    skill_time_commitment int,
    PRIMARY KEY (skill_id)
);



# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills ( skill_id, skill_name, skill_description, skill_tag, skill_url, skill_time_commitment ) values 
    (1, 'juggling', 'Ability to rotate object in mid air.', 'Skill 1', 'www.clown.com', 24),
    (2, 'skateboarding', 'Ability to ride a plank with wheels.', 'Skill 2', 'www.proskater.com', 36),
    (3, 'programming', 'Ability to code and create programs.', 'Skill 3', 'www.stackoverflow.com', 120),
    (4, 'Art', 'Ability to create artworks.', 'Skill 4', 'www.art.com', 120),
    (5, 'Plumbing', 'Ability to repair pipes and waterwork.', 'Skill 5', 'www.PEX.com', 110),
    (6, 'Farming', 'Ability to perform agricultural task and produce.', 'Skill 6', 'www.farmers.com', 100),
    (7, 'Blacksmith', 'Ability to create weaponary and armor.', 'Skill 7', 'www.BS.com', 120),
    (8, 'Alchmey', 'Ability to produce elixir and potions.', 'Skill 8', 'www.occult.com', 100);



# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    people_email varchar(255),
    people_url varchar(255),
    people_headshot varchar(255),
    people_discord varchar(255),
    people_bio varchar(4096),
    people_date_join date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name, people_last_name, people_email, people_url, people_headshot, people_discord, people_bio, people_date_join) values 
    (1,'John', 'Person 1', 'john1@gmail.com', 'linkedin.com/john-1', 'image.con/john1', 'john1#2244', 'A family man who likes to do plumbing.', '2023-09-08'),
    (2,'Tyler', 'Person 2', 'tyler2@gmail.com', 'linkedin.com/tyler-2', 'image.con/tyler2', 'tyler2#2334', 'A computer science student.', '2023-12-01'),
    (3,'Dylan', 'Person 3', 'dylan3@gmail.com', 'linkedin.com/dylan-3', 'image.con/dylan3', 'dylan3#7874', 'Creative art student who likes rock climbing.', '2022-08-12'),
    (4,'Anny', 'Person 4', 'anny4@gmail.com', 'linkedin.com/anny-4', 'image.con/anny4', 'anny4#1130', 'Nurse undergrade student who enjoys hiking.', '2023-07-21'),
    (5,'Sonic', 'Person 5', 'sonic5@gmail.com', 'linkedin.com/sonic-5', 'image.con/sonic5', 'sonic5#0004', 'A blue hedgehog who runs very fast.', '2023-08-11'),
    (6,'Kirby', 'Person 6', 'kirby6@gmail.com', 'linkedin.com/kirby-6', 'image.con/kirby6', 'kirby6#0101', 'A pink blog of glutton who can copy ability of whatever he eats.', '2023-05-01'),
    (7,'Mario', 'Person 7', 'mario7@gmail.com', 'linkedin.com/mario-7', 'image.con/mario7', 'mario7#1112', 'Italian plumber who is in search for princess Peach.', '2023-04-12'),
    (8,'Yoshi', 'Person 8', 'yoshi8@gmail.com', 'linkedin.com/yoshi-8', 'image.con/yoshi8', 'yoshi8#0991', 'A green dinosaur who belongs to nintendo.', '2023-09-21'),
    (9,'Arthur', 'Person 9', 'arthur_pendragon@gmail.com', 'linkedin.com/arthur-pendragon', 'image.con/arthur_P', 'arthurpen#2244', 'King of great britain and camelot.', '2023-03-11'),
    (10,'Nero', 'Person 10', 'Nero10@gmail.com', 'linkedin.com/nero-claudius', 'image.con/nero', 'nero10#2244', 'The tyrant emperor of rome.', '2023-02-28');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_ID int NOT NULL,
    skill_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_ID)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (peopleskills_ID, skill_id, people_id, date_acquired) values 
    (1, 1, 1, '2023-09-08'),
    (2, 3, 1, '2023-09-07'),
    (3, 6, 1, '2023-09-06'),
    (4, 3, 2, '2023-07-05'),
    (5, 4, 2, '2023-07-04'),
    (6, 5, 2, '2023-07-03'),
    (7, 1, 3, '2023-02-11'),
    (8, 5, 3, '2023-02-08'),
    (9, 3, 5, '2023-11-08'),
    (10, 6, 5, '2023-11-08'),
    (11, 2, 6, '2023-03-20'),
    (12, 3, 6, '2023-03-21'),
    (13, 4, 6, '2023-03-30'),
    (14, 3, 7, '2023-03-20'),
    (15, 5, 7, '2023-03-22'),
    (16, 6, 7, '2023-03-23'),
    (17, 1, 8, '2023-04-01'),
    (18, 3, 8, '2023-04-02'),
    (19, 5, 8, '2023-04-03'),
    (20, 6, 8, '2023-04-04'),
    (21, 2, 9, '2023-05-19'),
    (22, 5, 9, '2023-05-18'),
    (23, 6, 9, '2023-05-17'),
    (24, 1, 10, '2023-06-17'),
    (25, 4, 10, '2023-06-16'),
    (26, 5, 10, '2023-06-17');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    role_id int,
    role_name varchar(255),
    sort_priority int,
    PRIMARY KEY(role_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (role_id, role_name, sort_priority) values 
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team_Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    people_role_id int NOT NULL,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    PRIMARY KEY (people_role_id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_role_id, people_id, role_id, date_assigned) values 
    (1, 1, 2, '2023-09-02'),
    (2, 2, 5, '2023-05-01'),
    (3, 2, 6, '2023-05-01'),
    (4, 3, 2, '2023-02-02'),
    (5, 3, 4, '2023-02-03'),
    (6, 4, 3, '2023-09-09'),
    (7, 5, 3, '2023-05-01'),
    (8, 6, 2, '2023-07-07'),
    (9, 6, 1, '2023-03-01'),
    (10, 7, 1, '2023-09-09'),
    (11, 8, 1, '2023-01-01'),
    (12, 8, 4, '2023-05-09'),
    (13, 9, 2, '2023-07-09'),
    (14, 10, 2, '2023-01-01'),
    (15, 10, 1, '2023-09-01');


    ;