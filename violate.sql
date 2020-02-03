-- Primary Key Constraint 1  - Movie
 INSERT INTO Movie VALUES(2,"Dave Chapelle Loves me", 2020,"UWU","UWU");
 --  ERROR 1062 (23000): Duplicate entry '2' for key 'PRIMARY'
 -- Primary Keys cannot have duplicate values and as a result, the constraint is violated.

-- Primary Key Constraint 2 - Actor
INSERT INTO Actor VALUES(1," Chapelle","Dave","Male","2020-12-12",NULL);
-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
--  Primary Keys cannot have a duplicate value. The reason is because they must be unique which this constraint was clearly violated.

-- Primary Key Constraint 3 - Director
INSERT INTO Director Values(68626,"Chen","Eric","2020-12-12",NULL);
--  ERROR 1062 (23000): Duplicate entry '68626' for key 'PRIMARY'
-- The reason why this fails is simply because again we require unique identifiers for a given director.





-- Referential Integrity Constraint 1 -Sales
INSERT INTO Sales VALUES(10,NULL,NULL);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`Sales`, CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE)
-- The reason this fails is because there is no Movie ID of 10 and so referencing something that doesnt exist is whats happening.

-- Referential Integrity Constraint 2 - Movie Genre
 INSERT INTO MovieGenre Values(10,NULL);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE)
-- The reason why this doesnnt work is because there is no Movie ID of 10 and so we cant reference something that aint there.

-- Referential Integrity Constraint 3 - Movie Director
 INSERT INTO MovieDirector Values (10,16);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE)
-- The reason why this doesnt work is because we're referencing a Movie ID that doesnt exist. However the  Director does but the constraint was not met so it is not valid.

-- Referential Integrity Constraint 4 - Movie Director
 INSERT INTO MovieDirector Values (2,7);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`) ON DELETE CASCADE)
-- This similarly doesnt work because we have a Director ID that does not exist but the movie does. As a result, the constraint isnt met.

-- Referential Integrity Constraint 5 - Movie Actor
INSERT INTO MovieActor Values(10,16,NULL);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`) ON DELETE CASCADE)
-- This fails because like the 1st example of FK constraint violations for Movie Director, one of the ID's being referenced Dont exist and cannot be a valid entry.

-- Referential Integrity Constraint 6
 INSERT INTO MovieActor Values(2,7,NULL);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`) ON DELETE CASCADE)
-- Like the 2nd exampel of FK constraint violations for Movie director, one of the ID's are also not being referenced so there's no way we can accept this entry as valid.






-- Check Constraint 1 - Actor
INSERT INTO Actor VALUES(4," Woo","Dave","Non-Binary","2020-12-12",NULL);
-- Here, if MySQL would support Check Constraints, this would get rejected 
-- Because sex can only be Male or Female. Not anything else.


-- Check Constraint 2- Reviews
INSERT INTO Review Values('Jeff',NULL,2,16,"SUCKS");
-- Here  this constraint for Reviews would not accept this entry for the reason that the rating was too high. We only
-- want ratings between 0-10

-- Check Constraint 3-Movie
INSERT INTO Movie Values(1,"o",1887,NULL,NULL);
-- Here the reason why this would fail is because we have a year constraint between 1888 and 9999. Because this year is too
-- Old, we can not allow this to pass.
