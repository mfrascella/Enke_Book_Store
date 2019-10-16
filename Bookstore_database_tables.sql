CREATE TABLE Author
(
  AuthorID INT AUTO_INCREMENT,
  AuthorFName VARCHAR(45) NOT NULL,
  AuthorLName VARCHAR(45) NOT NULL,
  CONSTRAINT PK_Author_AuthorID PRIMARY KEY (AuthorID)
);

CREATE TABLE Book_Author
(
  BookID INT NOT NULL,
  AuthorID INT NOT NULL,
  CONSTRAINT FK_BookAuthor_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
  CONSTRAINT FK_BookAuthor_AuthorID FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
  CONSTRAINT U_BookAuthor UNIQUE (BookID, AuthorID)
);

CREATE TABLE Publisher
(
  PubID INT AUTO_INCREMENT,
  PubName VARCHAR(75) NOT NULL,
  AddressID INT,
  CONSTRAINT PK_Publisher_PubID PRIMARY KEY (PubID),
  CONSTRAINT FK_Publisher_AddressID FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
  CONSTRAINT U_Publisher UNIQUE (addressID,PubName)
);

CREATE TABLE Book_Publisher
(
  BookID INT NOT NULL,
  PubID INT NOT NULL,
  CONSTRAINT FK_BookPublisher_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
  CONSTRAINT FK_BookAuthor_PubID FOREIGN KEY (PubID) REFERENCES Publisher(PubID),
  CONSTRAINT U_BookPublisher UNIQUE (BookID, PubID)
);

INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Mark', 'Twain');
INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Dan', 'Brown');
INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Jerome', 'Salinger');
INSERT INTO Publisher (PubName) VALUES ('Penguin Random House');
INSERT INTO Publisher (PubName) VALUES ('Del Ray');
INSERT INTO Publisher (PubName) VALUES ('Simon & Schuster');
