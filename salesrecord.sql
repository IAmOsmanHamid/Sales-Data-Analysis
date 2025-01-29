-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: salesrecord
-- ------------------------------------------------------
-- Server version       8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (101,'Alice Johnson','alice.johnson@example.com','United States'),(102,'Bob Smith','bobsmith@example.com','Canada'),(103,'Charlie Brown','charlie.brown@example.com','United Kingdom'),(104,'Daisy Ridley','daisy.ridley@example.com','Australia'),(105,'Ethan Hunt','ethan.hunt@example.com','India'),(106,'Fiona Harper','fiona.harper@example.com','New Zealand'),(107,'George King','george.king@example.com','Ireland'),(108,'Hannah Lee','hannah.lee@example.com','South Africa'),(109,'Ian Bell','ian.bell@example.com','United States'),(110,'Jenny Moore','jenny.moore@example.com','Canada'),(111,'Kevin Hart','kevin.hart@example.com','United States'),(112,'Linda Carter','linda.carter@example.com','United Kingdom'),(113,'Michael Scott','michael.scott@example.com','United States'),(114,'Nancy Drew','nancy.drew@example.com','Australia'),(115,'Oscar Wilde','oscar.wilde@example.com','Ireland'),(116,'Paul Allen','paul.allen@example.com','India'),(117,'Quincy Adams','quincy.adams@example.com','New Zealand'),(118,'Rebecca Black','rebecca.black@example.com','South Africa'),(119,'Steve Rogers','steve.rogers@example.com','Canada'),(120,'Tony Stark','tony.stark@example.com','United States');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price_per_unit` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2001,101,5001,'2025-01-01',1,799.99,799.99),(2002,102,5002,'2025-01-02',2,19.99,39.98),(2003,103,5003,'2025-01-03',1,49.99,49.99),(2004,104,5004,'2025-01-04',3,9.99,29.97),(2005,105,5005,'2025-01-05',5,24.99,124.95),(2006,106,5006,'2025-01-06',2,999.99,1999.98),(2007,107,5007,'2025-01-07',3,199.99,599.97),(2008,108,5008,'2025-01-08',1,89.99,89.99),(2009,109,5009,'2025-01-09',2,129.99,259.98),(2010,110,5010,'2025-01-10',4,49.99,199.96),(2011,111,5011,'2025-01-11',2,69.99,139.98),(2012,112,5012,'2025-01-12',1,399.99,399.99),(2013,113,5013,'2025-01-13',3,129.99,389.97),(2014,114,5014,'2025-01-14',4,19.99,79.96),(2015,115,5015,'2025-01-15',1,29.99,29.99),(2016,116,5016,'2025-01-16',1,249.99,249.99),(2017,117,5017,'2025-01-17',1,499.99,499.99),(2018,118,5018,'2025-01-18',2,39.99,79.98),(2019,119,5019,'2025-01-19',1,199.99,199.99),(2020,120,5020,'2025-01-20',5,14.99,74.95),(2021,101,5002,'2025-01-21',2,19.99,39.98),(2022,102,5007,'2025-01-22',1,199.99,199.99),(2023,103,5011,'2025-01-23',3,69.99,209.97),(2024,104,5015,'2025-01-24',4,29.99,119.96),(2025,105,5004,'2025-01-25',2,9.99,19.98),(2026,106,5017,'2025-01-26',1,499.99,499.99),(2027,107,5006,'2025-01-27',1,999.99,999.99),(2028,108,5013,'2025-01-28',2,129.99,259.98),(2029,109,5018,'2025-01-29',3,39.99,119.97),(2030,110,5020,'2025-01-30',6,14.99,89.94),(2031,111,5009,'2025-01-31',1,129.99,129.99),(2032,112,5001,'2025-02-01',1,799.99,799.99),(2033,113,5012,'2025-02-02',2,399.99,799.98),(2034,114,5019,'2025-02-03',1,199.99,199.99),(2035,115,5008,'2025-02-04',2,89.99,179.98),(2036,116,5014,'2025-02-05',5,19.99,99.95),(2037,117,5005,'2025-02-06',2,24.99,49.98),(2038,118,5010,'2025-02-07',3,49.99,149.97),(2039,119,5016,'2025-02-08',1,249.99,249.99),(2040,120,5003,'2025-02-09',4,49.99,199.96),(2041,101,5002,'2025-02-10',3,19.99,59.97),(2042,102,5001,'2025-02-11',2,799.99,1599.98),(2043,103,5018,'2025-02-12',4,39.99,159.96),(2044,104,5007,'2025-02-13',2,199.99,399.98),(2045,105,5015,'2025-02-14',1,29.99,29.99),(2046,106,5013,'2025-02-15',3,129.99,389.97),(2047,107,5009,'2025-02-16',2,129.99,259.98),(2048,108,5012,'2025-02-17',1,399.99,399.99),(2049,109,5011,'2025-02-18',5,69.99,349.95),(2050,110,5004,'2025-02-19',6,9.99,59.94);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (5001,'Laptop','electronics',50,799.99),(5002,'T-shirt','clothing',20,19.99),(5003,'Blender','home appliances',10,49.99),(5004,'Novel','books',100,9.99),(5005,'Toy Car','toys',500,24.99),(5006,'Smartphone','electronics',200,999.99),(5007,'Headphones','electronics',150,199.99),(5008,'Chair','furniture',75,89.99),(5009,'Desk','furniture',40,129.99),(5010,'Backpack','accessories',300,49.99),(5011,'Shoes','clothing',250,69.99),(5012,'Tablet','electronics',90,399.99),(5013,'Cookware Set','home appliances',30,129.99),(5014,'Puzzle','toys',200,19.99),(5015,'Action Figure','toys',150,29.99),(5016,'Bookshelf','furniture',20,249.99),(5017,'Gaming Console','electronics',25,499.99),(5018,'Sweater','clothing',80,39.99),(5019,'Monitor','electronics',120,199.99),(5020,'Kitchen Knife','home appliances',300,14.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-10 20:52:37