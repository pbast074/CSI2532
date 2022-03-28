/*Exercice 1*/
CREATE TABLE book (
	bookid int,
	bookname varchar(20) NOT NULL,
	authorid int,
	amount numeric(7,2),
	rating int,
	booktype varchar(25),
	PRIMARY KEY (bookid),
	FOREIGN KEY (authorid),
	CHECK (rating >= 1 AND rating <= 10),
	CHECK (amount > 0),
	CHECK (booktype IN ('Fiction- adulte', 'Non-fiction-adulte', 'Fiction-jeunesse', 'Non-fiction-jeunesse'))
);

/*Exercice 2*/
CREATE TABLE author (
	authorid int,
	authorname varchar(20) NOT NULL,
	PRIMARY KEY (authorid),
	CREATE ASSERTION assert
	CHECK (SELECT COUNT(*) 
						FROM book 
						HAVING COUNT(*) <= 10000
);

/*Exercice 3*/
CREATE TRIGGER check_rating
					BEFORE UPDATE ON book
					FOR EACH ROW
					EXECUTE PROCEDURE check_book_rating();

/*Exercice 4*/
ALTER TABLE author
ADD author_sum_rating int DEFAULT(0);

CREATE TRIGGER check_sum
					AFTER UPDATE ON author
					