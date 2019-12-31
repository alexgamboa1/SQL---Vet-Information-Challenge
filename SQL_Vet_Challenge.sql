--1.Extract information on pets names and owner names side-by-side
SELECT pets.NAME, owners.Name
FROM pets 
LEFT JOIN owners 
ON pets.OWNERID = owners.OWNERID;

--Use AS to describe your dataset in use
SELECT A.NAME, B.NAME
FROM pets AS A 
LEFT JOIN owners AS B
ON A.OWNERID = B.OWNERID;


--2. Find out which pets from this clinic had procedures performed
SELECT * 
FROM pets

SELECT * 
FROM procedurehistory

SELECT * 
FROM pets AS A 
INNER JOIN procedurehistory AS B
ON A.PETID = B.PETID;

--3. Match up all procedures performed to their descriptions
SELECT *
FROM procedurehistory AS A
LEFT JOIN proceduredetails AS B
ON A.PROCEDURETYPE = B.PROCEDURETYPE 
AND A.PROCEDURESUBCODE = B.PROCEDURESUBCODE;

--4. Same as above but only pets from the clinic in question. 
-- 1, 2, 3 step process of joining tables and cleaning data.

--First, create a inner join for pets and procedure history
SELECT * 
FROM pets AS A
INNER JOIN procedurehistory AS B 
ON A.PETID = B.PETID;

--Second, create a left join to include the details of the procedure
SELECT * 
FROM pets AS A
INNER JOIN procedurehistory AS B 
ON A.PETID = B.PETID
LEFT JOIN proceduredetails AS C 
ON B.PROCEDURETYPE = C.PROCEDURETYPE
AND B.PROCEDURESUBCODE = C.PROCEDURESUBCODE;

--third, clean up the dataset for simplicity
SELECT  A.PETID, 
		A.NAME, 
		A.KIND,
		A.GENDER,
		A.AGE,
		A.OWNERID,
		B.PROCEDUREDATE,
		B.PROCEDURETYPE,
		B.PROCEDURESUBCODE, 
		C.DESCRIPTION, 
		C.PRICE		
FROM pets AS A
INNER JOIN procedurehistory AS B 
ON A.PETID = B.PETID
LEFT JOIN proceduredetails AS C 
ON B.PROCEDURETYPE = C.PROCEDURETYPE
AND B.PROCEDURESUBCODE = C.PROCEDURESUBCODE;

-- 5.Extract a table of individual cost (procedure prices) incurred
-- by owners of pets from the clinic in question (this table should 
-- have owner and procedure price side by side)
SELECT  --A.PETID, 
		--A.NAME, 
		--A.KIND,
		--A.GENDER,
		--A.AGE,
		A.OWNERID,
		--B.PROCEDUREDATE,
		--B.PROCEDURETYPE,
		--B.PROCEDURESUBCODE, 
		--C.DESCRIPTION, 
		C.PRICE		
FROM pets AS A
INNER JOIN procedurehistory AS B 
ON A.PETID = B.PETID
LEFT JOIN proceduredetails AS C 
ON B.PROCEDURETYPE = C.PROCEDURETYPE
AND B.PROCEDURESUBCODE = C.PROCEDURESUBCODE;





