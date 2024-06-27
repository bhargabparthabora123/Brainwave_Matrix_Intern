-- Create the database
CREATE DATABASE IF NOT EXISTS library;
USE library;

-- Create authors table
CREATE TABLE IF NOT EXISTS authors (
    authorID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    Bio TEXT
);

-- Create books table
CREATE TABLE IF NOT EXISTS books (
    bookID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    ISBN VARCHAR(25) UNIQUE, -- ISBN-International Standard Book Number
    publisher VARCHAR(80),
    yearPublished INT
);

-- Create members table
CREATE TABLE IF NOT EXISTS members (
    memberID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    Address TEXT
);

-- Create loans table
-- loans table will have one-to-many relationship with books and one-to-many relation with members
CREATE TABLE IF NOT EXISTS loans (
    loanID INT PRIMARY KEY AUTO_INCREMENT,
    bookID INT,
    memberID INT,
    loanDate DATE,
    returnDate DATE,
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (memberID) REFERENCES members(memberID)
);

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    categoryID INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(50)
);

-- Table for many-to-many relationship between books and authors
CREATE TABLE IF NOT EXISTS BookAuthors (
    bookID INT,
    authorID INT,
    PRIMARY KEY (bookID, authorID),
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (authorID) REFERENCES authors(authorID)
);

-- Table for many-to-many relationship between books and categories
CREATE TABLE IF NOT EXISTS BookCategories (
    bookID INT,
    categoryID INT,
    PRIMARY KEY (bookID, categoryID),
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

-- Insert data into authors table
INSERT INTO authors (firstName, lastName, Bio) VALUES
("Joanne", "Rowling", "J.K. Rowling is a British author best known for her Harry Potter series, which has become one of the best-selling book series in history. Rowling has also written adult fiction under the pen name Robert Galbraith. Her works have garnered worldwide acclaim, including numerous awards, and have been adapted into a successful film franchise. Rowling has also been active in philanthropy, particularly through her charitable trust, Volant."),
("George", "Orwell", "George Orwell was an English novelist, essayist, journalist, and critic. His work is characterized by lucid prose, social criticism, opposition to totalitarianism, and outspoken support of democratic socialism. '1984' and 'Animal Farm' are two of his most famous works, both of which provide powerful critiques of authoritarianism and remain relevant in modern political discourse."),
("Jane", "Austen", "Jane Austen was an English novelist known for her six major novels, which interpret, critique, and comment upon the British landed gentry at the end of the 18th century. Her novels are noted for their realism, biting social commentary, and masterful use of free indirect speech, burlesque, and irony. Despite her limited recognition during her lifetime, Austen's works have become a staple in classic English literature."),
("Chinua", "Achebe", "Chinua Achebe was a Nigerian novelist, poet, professor, and critic. He is best known for his debut novel 'Things Fall Apart' (1958), which is the most widely read book in modern African literature. Achebe's work focuses on African culture, colonialism, and the social and political changes in Africa, particularly Nigeria. He is considered the father of African literature in English and has been honored with numerous awards, including the Man Booker International Prize."),
("Toni", "Morrison", "Toni Morrison was an American novelist, essayist, editor, and professor. She is known for her richly detailed and epic storytelling about African American culture and experience. Morrison was awarded the Nobel Prize in Literature in 1993, and her novel 'Beloved' won the Pulitzer Prize for Fiction in 1988. Her works often explore themes of race, identity, and history."),
("Harper", "Lee", "Harper Lee was an American novelist best known for her 1960 novel 'To Kill a Mockingbird', which won the Pulitzer Prize for Fiction in 1961. The novel is a classic of modern American literature and deals with serious issues such as racial inequality and moral growth. Despite its success, Lee published only one other book, 'Go Set a Watchman', which was released in 2015 but was written before 'To Kill a Mockingbird'. Lee was known for her reclusive nature and rarely gave interviews or made public appearances."),
("F. Scott", "Fitzgerald", "F. Scott Fitzgerald was an American novelist and short story writer widely regarded as one of the greatest American writers of the 20th century. He is best known for his novel 'The Great Gatsby', which is considered a masterpiece and a critical social commentary on the American Dream. Fitzgerald's work often depicted the flamboyance and excess of the Jazz Age, a term he coined. Despite his success, he struggled with alcoholism and financial difficulties, and he died relatively young, leaving behind a legacy of influential works."),
("Herman", "Melville", "Herman Melville was an American novelist, short story writer, and poet. He is best known for his novel 'Moby-Dick', which was initially a commercial failure but later became regarded as one of the greatest works of American literature. Melville's work is characterized by complex themes, including fate, religion, and the nature of evil. His other notable works include the novella 'Billy Budd, Sailor' and the short story 'Bartleby, the Scrivener'. Despite his literary achievements, Melville's work was largely forgotten during his lifetime and only gained significant recognition posthumously."),
("Leo", "Tolstoy", "Leo Tolstoy was a Russian writer who is considered one of the greatest authors of all time. His novels 'War and Peace' and 'Anna Karenina' are regarded as pinnacles of realist fiction. Tolstoy's work is known for its intricate detail, rich characterizations, and profound philosophical insights. Later in life, Tolstoy experienced a moral and spiritual crisis, leading him to develop his own form of Christian anarchism, which influenced his later works. His ideas on nonviolent resistance had a significant impact on figures like Mahatma Gandhi and Martin Luther King Jr."),
("J.D.", "Salinger", "J.D. Salinger was an American writer best known for his novel 'The Catcher in the Rye', which has become an enduring classic of adolescent literature. The novel's protagonist, Holden Caulfield, has become an icon for teenage rebellion and angst. Salinger was notoriously reclusive and published only a few other works, including 'Franny and Zooey' and 'Nine Stories'. Despite his limited output, Salinger's work has had a significant impact on modern literature, and his influence can be seen in the writings of many contemporary authors.");

-- Insert data into books table
INSERT INTO books (title, ISBN, publisher, yearPublished) VALUES
("Harry Potter and the Sorcerer's Stone", "978-04339708180", "Scholastic", 1998),
("1984", "978-0451524935", "Signet Classics", 1949),
("Pride and Prejudice", "978-1503290563", "Create Space Independent Publishing Platform", 1813),
("Things Fall Apart", "978-0385474542", "Anchor", 1958),
("Beloved", "978-1400033416", "Vintage", 1987),
("To Kill a Mockingbird", "978-0061120084", "Harper Perennial Modern Classics", 1960),
("The Great Gatsby", "978-0743273565", "Scribner", 1925),
("Moby-Dick", "978-1503280786", "CreateSpace Independent Publishing Platform", 1851),
("War and Peace", "978-0199232765", "Oxford University Press", 1869),
("The Catcher in the Rye", "978-0316769488", "Little, Brown and Company", 1951);


INSERT INTO members (firstName, lastName, Email, phone, Address) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St.'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St.'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-2345', '789 Maple St.'),
('Bob', 'Williams', 'bob.williams@example.com', '555-6789', '101 Pine St.'),
('Carol', 'Brown', 'carol.brown@example.com', '555-3456', '202 Cedar St.'),
('David', 'Jones', 'david.jones@example.com', '555-7890', '303 Birch St.'),
('Eve', 'Davis', 'eve.davis@example.com', '555-4567', '404 Spruce St.'),
('Frank', 'Garcia', 'frank.garcia@example.com', '555-8901', '505 Walnut St.'),
('Grace', 'Martinez', 'grace.martinez@example.com', '555-5678', '606 Chestnut St.'),
('Henry', 'Miller', 'henry.miller@example.com', '555-1234', '707 Redwood St.');


insert into categories(categoryName) values
(" Fantasy"),
(" Adventure"),
("Young Adult"),
("Romance"),
(" Social Critique"),
("Classic Literature"),
("Dystopian"),
("Science Fiction"),
("Political Fiction"),
("Historical Fiction"),
("African Literature"),
("Cultural Critique"),
("Magical Realism"),
(" Southern Gothic"),
("Sea Story"),
("War Story"),
(" Coming-of-Age"),
("Tragedy"),
("Social Commentary");

insert into BookAuthors (bookID,authorID) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

insert into  BookCategories(bookID,categoryID) values
(1,1),
(1,2),
(1,3),
(2,7),
(2,8),
(2,9),
(3,4),
(3,5),
(3,6),
(4,10),
(4,11),
(4,12),
(5,10),
(5,11),
(5,13),
(6,14),
(6,17),
(6,5),
(7,6),
(7,18),
(7,19),
(8,2),
(8,6),
(8,15),
(9,10),
(9,6),
(9,16),
(10,6),
(10,17),
(10,5);

INSERT INTO loans (bookID, memberID, loanDate, returnDate) VALUES
(1, 1, '2023-06-15', '2023-06-22'),
(2, 2, '2023-06-16', '2023-06-23'),
(3, 3, '2023-06-17', '2023-06-24'),
(4, 4, '2023-06-18',null),
(5, 5, '2023-06-19',null),
(6, 6, '2023-06-20',null ),
(7, 7, '2023-06-21', null),
(8, 8, '2023-06-22', '2023-06-29'),
(9, 9, '2023-06-23',null),
(10, 10, '2023-06-24', '2023-07-01');

-- Verify data insertion
SELECT * FROM authors;
SELECT * FROM books;
select *from members;
select *from categories;
select *from BookAuthors;
select *from BookCategories;
select *from loans;

-- List books by  author name
SELECT b.Title,a.firstName,a.lastName FROM BookAuthors ba
JOIN books b ON b.BookID = ba.BookID
JOIN Authors a ON ba.AuthorID = a.AuthorID;

-- List books by a specific author
SELECT b.Title FROM Books b
JOIN BookAuthors ba ON b.BookID = ba.BookID
JOIN Authors a ON ba.AuthorID = a.AuthorID
WHERE a.LastName = 'Orwell';

-- List books in a specific category
SELECT b.Title FROM Books b
JOIN BookCategories bc ON b.BookID = bc.BookID
JOIN Categories c ON bc.CategoryID = c.CategoryID
WHERE c.CategoryName = 'War Story';

-- List all books currently on loan
SELECT b.Title, m.FirstName, m.LastName, l.LoanDate, l.ReturnDate FROM Loans l
JOIN Books b ON l.BookID = b.BookID
JOIN Members m ON l.MemberID = m.MemberID
WHERE l.ReturnDate IS NULL;
