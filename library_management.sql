-- Create Database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Table: Authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Table: Categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- Table: Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    published_year YEAR,
    isbn VARCHAR(20) UNIQUE,
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);

-- Table: Members
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    join_date DATE DEFAULT CURRENT_DATE
);

-- Table: Borrowings
CREATE TABLE Borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE DEFAULT CURRENT_DATE,
    return_date DATE,
    due_date DATE NOT NULL,
    status ENUM('borrowed', 'returned', 'late') DEFAULT 'borrowed',
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE
);

-- Table: Librarians
CREATE TABLE Librarians (
    librarian_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Sample Data: Authors
INSERT INTO Authors (name, bio) VALUES
('J.K. Rowling', 'British author, best known for Harry Potter series.'),
('George R.R. Martin', 'American novelist, author of A Song of Ice and Fire.'),
('J.R.R. Tolkien', 'English writer, poet, and professor, author of The Lord of the Rings.');

-- Sample Data: Categories
INSERT INTO Categories (category_name) VALUES
('Fiction'), ('Fantasy'), ('Science'), ('Biography');

-- Sample Data: Books
INSERT INTO Books (title, author_id, category_id, published_year, isbn, total_copies, available_copies) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 2, 1997, '9780747532699', 5, 5),
('A Game of Thrones', 2, 2, 1996, '9780553103540', 3, 3),
('The Lord of the Rings', 3, 2, 1954, '9780618640157', 4, 4);

-- Sample Data: Members
INSERT INTO Members (first_name, last_name, email, phone) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567890'),
('Bob', 'Smith', 'bob.smith@example.com', '0987654321'),
('Charlie', 'Brown', 'charlie.brown@example.com', '1122334455');

-- Sample Data: Librarians
INSERT INTO Librarians (first_name, last_name, email, password) VALUES
('Laura', 'Williams', 'laura.williams@example.com', 'password123'),
('Mark', 'Davis', 'mark.davis@example.com', 'password123');
