
CREATE TABLE Movie (
       id INT NOT NULL,
       title VARCHAR(100) NOT NULL,
       year INT NOT NULL,
       rating VARCHAR(10),
       company VARCHAR(50),
       -- 1st Primary Key Constraint: A Movie ID must be unique
       PRIMARY KEY(id),
       -- 1st Check Constraint: First film ever released in 1888 and within a reasonable year of 4 digits.
       CHECK (year >=1888 AND year <10000)
) ENGINE=INNODB;


CREATE TABLE Actor (
       id INT NOT NULL,
       last VARCHAR(20) NOT NULL,
       first VARCHAR(20) NOT NULL,
       sex VARCHAR(6),
       dob DATE NOT NULL,
       dod DATE,
       -- 2nd Primary key Constraint:  an Actor's ID has to be unique
       PRIMARY KEY(id),
       -- 2nd Check Constraint: Sex should be binary for this example. Reality is it isnt.
       CHECK (sex='Male' or sex ='Female' )
)ENGINE=INNODB;


CREATE TABLE Sales (
       mid INT NOT NULL,
       ticketsSold INT,
       totalIncome INT,

       -- 1st  Referential Integrity constraint. 
       FOREIGN KEY(mid) references Movie(id) ON DELETE CASCADE

)ENGINE=INNODB;

CREATE TABLE Director (
       id INT NOT NULL,
       last VARCHAR(20) NOT NULL,
       first VARCHAR(20) NOT NULL,
       dob DATE NOT NULL,
       dod DATE,
       -- 3rd Primary Key Constraint: Director ID has to be unique.
       PRIMARY KEY(id)

)ENGINE=INNODB;

CREATE TABLE MovieGenre (
       mid INT NOT NULL,
       genre VARCHAR(20),
       -- 2nd Referential Integrity constraint, referring to Movie table.
       FOREIGN KEY (mid) references Movie(id) ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE MovieDirector (
       mid INT NOT NULL,
       did INT NOT NULL,
       --  3rd Referential Integrity Constraint, references movie table
       FOREIGN KEY(mid) references Movie(id) ON DELETE CASCADE,
       --  4th Referential Integrity Constraint, references Directors table.
       FOREIGN KEY(did) references Director(id) ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE MovieActor (
       mid INT NOT NULL,
       aid INT NOT NULL,
       role VARCHAR(50),
       --  5th Referential Integrity Constraint, references movie table
       FOREIGN KEY(mid) references Movie(id) ON DELETE CASCADE,
        --  6th Referential Integrity Constraint, references Actor table
       FOREIGN KEY(aid) references Actor(id) ON DELETE CASCADE
)ENGINE=INNODB;

CREATE TABLE MovieRating (
       mid INT NOT NULL,
       imdb INT,
       rot INT
)ENGINE=INNODB;

CREATE TABLE Review (
       name VARCHAR(20) NOT NULL,
       time TIMESTAMP,
       mid INT NOT NULL,
       rating INT NOT NULL,
       comment VARCHAR(500),
       -- 3RD Check Constraint: Rating is on a scale 0-10
       CHECK(rating >=0 and rating <=10)
)ENGINE=INNODB;

CREATE TABLE MaxPersonID (
       id INT NOT NULL
)ENGINE=INNODB;

CREATE TABLE MaxMovieID (
       id INT NOT NULL
)ENGINE=INNODB;
