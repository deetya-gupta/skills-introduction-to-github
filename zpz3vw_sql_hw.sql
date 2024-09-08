-- World Database Questions:
-- Easy:
-- 1. List all countries in South America.
SELECT name FROM country WHERE Continent = 'South America';
-- 2. Find the population of 'Germany'.
SELECT population FROM country WHERE name = 'Germany';
-- 3. Retrieve all cities in the country 'Japan'.
SELECT name FROM city WHERE countrycode = 'JPN';
-- Medium:
-- 4. Find the 3 most populated countries in the 'Africa' region.
SELECT name, population FROM country WHERE region = 'Central Africa' ORDER BY population DESC LIMIT 3;
-- 5. Retrieve the country and its life expectancy where the population is between 1 and 5 million.
SELECT name, lifeexpectancy FROM country WHERE population BETWEEN 1000000 AND 5000000;
-- 6. List countries with an official language of 'French'.
SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- Chinook Database Questions:
-- Easy:
-- 7. Retrieve all album titles by the artist 'AC/DC'.
SELECT Album.Title FROM Album
JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = 'AC/DC';
-- 8. Find the name and email of customers located in 'Brazil'.
SELECT FirstName, LastName, Email FROM Customer WHERE Country = 'Brazil';
-- 9. List all playlists in the database.
SELECT Name FROM Playlist;
-- Medium:
-- 10. Find the total number of tracks in the 'Rock' genre.
SELECT COUNT(*) AS TotalTracks
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock';
-- 11. List all employees who report to 'Nancy Edwards'.
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');
-- 12. Calculate the total sales per customer by summing the total amount in invoices.
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.FirstName, Customer.LastName
ORDER BY TotalSales DESC;


-- Part 2
-- Create 3 tables for a bookstore database
CREATE DATABASE zpz3vw;
USE zpz3vw;
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(250) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL);
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(60) NOT NULL,
    Phone VARCHAR(20));
CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID));

-- Insert data
INSERT INTO Books (Title, Author, Price)
VALUES 
('Pride and Prejudice', 'Jane Austen', 9.99),
('Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 11.99),
('The Da Vinci Code', 'Dan Brown', 10.99),
('The Great Gatsby', 'F. Scott Fitzgerald', 12.99),
('The Alchemist', 'Paulo Coelho', 9.99);

INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES 
('Jane', 'Doe', 'jane.doe@gmail.com', '123-456-7899'),
('Emily', 'Turner', 'emily.turner@gmail.com', '987-654-3210'),
('Sam', 'Johnson', 'sam.johnson@yahoo.com', '111-222-3333'),
('Michael', 'Reed', 'michael.reed@yahoo.com', '123-321-4567'),
('Daisy', 'Collins', 'daisy.collins@gmail.com', '101-777-4152');

INSERT INTO Sales (CustomerID, BookID, Quantity, TotalAmount)
VALUES 
(1, 1, 1, 9.99),
(2, 5, 2, 19.98),
(3, 2, 1, 11.99),
(4, 4, 1, 12.99),
(5, 3, 2, 21.98);

-- Write queries
-- 1. Retrieve all the books and their prices
SELECT Title, Price FROM Books;
-- 2. List all customers' first and last names
SELECT FirstName, LastName FROM Customers;
-- 3. Find all books that cost more than $10
SELECT Title, Price FROM Books WHERE Price > 10;
-- 4. Find the total number of books sold and total revenue generated
SELECT SUM(Quantity) AS TotalBooksSold, SUM(TotalAmount) AS TotalRevenue FROM Sales;