DROP DATABASE IF EXISTS grillber;

CREATE DATABASE grillber;

USE grillber;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(60) NOT NULL,
  admin BOOLEAN NOT NULL DEFAULT 0,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(12)
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userId INT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  token VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category VARCHAR(100) NOT NULL,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(100),
  priceDaily DECIMAL(13,2),
  priceWeekly DECIMAL(13,2),
  availability BOOLEAN
);

CREATE TABLE  bookings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userId INT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  dropDate TIMESTAMP,
  pickUpDate TIMESTAMP,
  sum DECIMAL(13,2),
  location VARCHAR(50),
  status ENUM('opened', 'payed', 'delivered', 'pickedUp', 'closed') DEFAULT 'opened',
);

CREATE TABLE booked_products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  bookingId INT NOT NULL REFERENCES bookings (id),
  productId INT  NOT NULL REFERENCES products (id),
  price DECIMAL(13,2)
);