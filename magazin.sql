-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: magazin
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `CityID` int NOT NULL,
  `CityName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'New York'),(2,'Toronto'),(3,'London'),(4,'Moscva');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ClientID` int NOT NULL,
  `FirstName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `LastName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `MiddleName` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `PhoneNumber` varchar(20) COLLATE cp1251_general_cs NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'John','Doe','A','555-123-4567'),(2,'Jane','Smith',NULL,'555-987-6543'),(3,'Robert','Jones','B','555-111-2222'),(4,'Nadina','Doe','D','222-333-1212');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `CountryID` int NOT NULL,
  `CountryName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA'),(2,'Canada'),(3,'UK');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL,
  `FirstName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `LastName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `MiddleName` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `PhoneNumber` varchar(20) COLLATE cp1251_general_cs NOT NULL,
  `PositionID` int NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `PositionID` (`PositionID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PositionID`) REFERENCES `position` (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Alice','Brown','C','555-333-4444',1),(2,'Bob','Wilson',NULL,'555-555-6666',2),(3,'Charlie','Garcia','D','555-777-8888',3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `ManufacturerID` int NOT NULL,
  `ManufacturerName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `CountryID` int NOT NULL,
  PRIMARY KEY (`ManufacturerID`),
  KEY `CountryID` (`CountryID`),
  CONSTRAINT `manufacturer_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Acme Corp',1),(2,'Maple Leaf Goods',2),(3,'Britannia Ltd',3);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordertable` (`OrderID`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,1),(1,2,2),(2,3,1),(3,1,3);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `StatusID` int NOT NULL,
  `StatusName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'Pending'),(2,'Shipped'),(3,'Delivered');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertable` (
  `OrderID` int NOT NULL,
  `ClientID` int NOT NULL,
  `StatusID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `EmployeeID` int NOT NULL,
  `PickupPointID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `ClientID` (`ClientID`),
  KEY `StatusID` (`StatusID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `PickupPointID` (`PickupPointID`),
  CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`),
  CONSTRAINT `ordertable_ibfk_2` FOREIGN KEY (`StatusID`) REFERENCES `orderstatus` (`StatusID`),
  CONSTRAINT `ordertable_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `ordertable_ibfk_4` FOREIGN KEY (`PickupPointID`) REFERENCES `pickuppoint` (`PickupPointID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES (1,1,1,'2023-10-26',1,1),(2,2,2,'2023-10-25',2,2),(3,3,3,'2023-10-24',3,3),(4,2,1,'2023-10-26',1,3),(5,2,1,'2023-10-26',2,1);
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickuppoint`
--

DROP TABLE IF EXISTS `pickuppoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickuppoint` (
  `PickupPointID` int NOT NULL,
  `PickupPointName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `CityID` int NOT NULL,
  PRIMARY KEY (`PickupPointID`),
  KEY `CityID` (`CityID`),
  CONSTRAINT `pickuppoint_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickuppoint`
--

LOCK TABLES `pickuppoint` WRITE;
/*!40000 ALTER TABLE `pickuppoint` DISABLE KEYS */;
INSERT INTO `pickuppoint` VALUES (1,'Downtown NY',1),(2,'Midtown Toronto',2),(3,'West End London',3);
/*!40000 ALTER TABLE `pickuppoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `PositionID` int NOT NULL,
  `PositionName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Sales Associate'),(2,'Manager'),(3,'Delivery Driver');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `ManufacturerID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `ProductName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  `Skidka` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `ManufacturerID` (`ManufacturerID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturer` (`ManufacturerID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `productcategory` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,1,'Smartphone X',1182.98,100,22.11),(2,2,2,'Maple Syrup',18.49,500,12.33),(3,3,3,'Tweed Jacket',221.82,200,45.12),(4,1,2,'Fish',11.11,100,5.10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `Description` text COLLATE cp1251_general_cs NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'Electronics','Consumer electronics'),(2,'Food','Edible goods'),(3,'Clothing','Apparel and accessories');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `zakaz`
--

DROP TABLE IF EXISTS `zakaz`;
/*!50001 DROP VIEW IF EXISTS `zakaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zakaz` AS SELECT 
 1 AS `nomer`,
 1 AS `data`,
 1 AS `client`,
 1 AS `employee`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `zakaz`
--

/*!50001 DROP VIEW IF EXISTS `zakaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zakaz` AS select `ordertable`.`OrderID` AS `nomer`,`ordertable`.`OrderDate` AS `data`,`client`.`LastName` AS `client`,`employee`.`LastName` AS `employee` from ((`ordertable` join `client` on((`ordertable`.`ClientID` = `client`.`ClientID`))) join `employee` on((`ordertable`.`EmployeeID` = `employee`.`EmployeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 13:02:56
