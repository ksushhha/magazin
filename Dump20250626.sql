-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: repair_service
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
-- Table structure for table `заявка_на_ремонт`
--

DROP TABLE IF EXISTS `заявка_на_ремонт`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заявка_на_ремонт` (
  `Id_заявки` int NOT NULL AUTO_INCREMENT,
  `Id_клиента` int NOT NULL,
  `Id_тех_специалиста` int NOT NULL,
  `Дата` datetime NOT NULL,
  `Id_модели` int NOT NULL,
  `Итоговая_стоимость` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id_заявки`),
  KEY `Id_клиента` (`Id_клиента`),
  KEY `Id_тех_специалиста` (`Id_тех_специалиста`),
  KEY `Id_модели` (`Id_модели`),
  CONSTRAINT `заявка_на_ремонт_ibfk_1` FOREIGN KEY (`Id_клиента`) REFERENCES `клиент` (`Id_клиента`),
  CONSTRAINT `заявка_на_ремонт_ibfk_2` FOREIGN KEY (`Id_тех_специалиста`) REFERENCES `тех_специалист` (`Id_тех_специалиста`),
  CONSTRAINT `заявка_на_ремонт_ibfk_3` FOREIGN KEY (`Id_модели`) REFERENCES `модель` (`Id_модели`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заявка_на_ремонт`
--

LOCK TABLES `заявка_на_ремонт` WRITE;
/*!40000 ALTER TABLE `заявка_на_ремонт` DISABLE KEYS */;
INSERT INTO `заявка_на_ремонт` VALUES (1,3,1,'2023-05-10 10:00:00',3,5000.00),(2,3,2,'2023-05-11 11:30:00',2,2000.00),(3,1,1,'2023-05-12 14:45:00',1,3000.00);
/*!40000 ALTER TABLE `заявка_на_ремонт` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `клиент`
--

DROP TABLE IF EXISTS `клиент`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `клиент` (
  `Id_клиента` int NOT NULL AUTO_INCREMENT,
  `Имя` varchar(50) NOT NULL,
  `Фамилия` varchar(50) NOT NULL,
  `Отчество` varchar(50) DEFAULT NULL,
  `Телефон` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_клиента`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиент`
--

LOCK TABLES `клиент` WRITE;
/*!40000 ALTER TABLE `клиент` DISABLE KEYS */;
INSERT INTO `клиент` VALUES (1,'Иван','Иванов','Иванович','+79151234567'),(2,'Петр','Петров','Петрович','+79152345678'),(3,'Сергей','Сергеев',NULL,'+79153456789');
/*!40000 ALTER TABLE `клиент` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `клиентская_аналитика`
--

DROP TABLE IF EXISTS `клиентская_аналитика`;
/*!50001 DROP VIEW IF EXISTS `клиентская_аналитика`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `клиентская_аналитика` AS SELECT 
 1 AS `ID_клиента`,
 1 AS `ФИО_клиента`,
 1 AS `Телефон`,
 1 AS `Количество_заявок`,
 1 AS `Общая_сумма_ремонтов`,
 1 AS `Последняя_заявка`,
 1 AS `Ремонтированные_устройства`,
 1 AS `Использованные_услуги`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `модель`
--

DROP TABLE IF EXISTS `модель`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `модель` (
  `Id_модели` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  `цвет` varchar(50) NOT NULL,
  `Id_тип_модели` int NOT NULL,
  PRIMARY KEY (`Id_модели`),
  KEY `Id_тип_модели` (`Id_тип_модели`),
  CONSTRAINT `модель_ibfk_1` FOREIGN KEY (`Id_тип_модели`) REFERENCES `тип_модели` (`Id_тип_модели`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `модель`
--

LOCK TABLES `модель` WRITE;
/*!40000 ALTER TABLE `модель` DISABLE KEYS */;
INSERT INTO `модель` VALUES (1,'BMW m5','черный',1),(2,'Mersedes benz trucks','серебристый',2),(3,'Wolsvagen crafter','белый',3);
/*!40000 ALTER TABLE `модель` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `модельview`
--

DROP TABLE IF EXISTS `модельview`;
/*!50001 DROP VIEW IF EXISTS `модельview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `модельview` AS SELECT 
 1 AS `ID_модели`,
 1 AS `Модель`,
 1 AS `Цвет`,
 1 AS `ID_типа`,
 1 AS `Тип_устройства`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `список_заявок`
--

DROP TABLE IF EXISTS `список_заявок`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `список_заявок` (
  `Id_списка` int NOT NULL AUTO_INCREMENT,
  `Id_заявки` int NOT NULL,
  `Id_услуги` int NOT NULL,
  PRIMARY KEY (`Id_списка`),
  KEY `Id_заявки` (`Id_заявки`),
  KEY `Id_услуги` (`Id_услуги`),
  CONSTRAINT `список_заявок_ibfk_1` FOREIGN KEY (`Id_заявки`) REFERENCES `заявка_на_ремонт` (`Id_заявки`),
  CONSTRAINT `список_заявок_ibfk_2` FOREIGN KEY (`Id_услуги`) REFERENCES `услуга` (`Id_услуги`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `список_заявок`
--

LOCK TABLES `список_заявок` WRITE;
/*!40000 ALTER TABLE `список_заявок` DISABLE KEYS */;
INSERT INTO `список_заявок` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `список_заявок` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тех_специалист`
--

DROP TABLE IF EXISTS `тех_специалист`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тех_специалист` (
  `Id_тех_специалиста` int NOT NULL AUTO_INCREMENT,
  `Имя` varchar(50) NOT NULL,
  `Фамилия` varchar(50) NOT NULL,
  `Отчество` varchar(50) DEFAULT NULL,
  `Телефон` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_тех_специалиста`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тех_специалист`
--

LOCK TABLES `тех_специалист` WRITE;
/*!40000 ALTER TABLE `тех_специалист` DISABLE KEYS */;
INSERT INTO `тех_специалист` VALUES (1,'Алексей','Смирнов','Алексеевич','+79154567890'),(2,'Дмитрий','Кузнецов','Дмитриевич','+79155678901'),(3,'Андрей','Попов',NULL,'+79156789012');
/*!40000 ALTER TABLE `тех_специалист` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тип_модели`
--

DROP TABLE IF EXISTS `тип_модели`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тип_модели` (
  `Id_тип_модели` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_тип_модели`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тип_модели`
--

LOCK TABLES `тип_модели` WRITE;
/*!40000 ALTER TABLE `тип_модели` DISABLE KEYS */;
INSERT INTO `тип_модели` VALUES (1,'Легковой'),(2,'Грузовой'),(3,'Общественный транспорт');
/*!40000 ALTER TABLE `тип_модели` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `услуга`
--

DROP TABLE IF EXISTS `услуга`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `услуга` (
  `Id_услуги` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  `стоимость` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id_услуги`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `услуга`
--

LOCK TABLES `услуга` WRITE;
/*!40000 ALTER TABLE `услуга` DISABLE KEYS */;
INSERT INTO `услуга` VALUES (1,' тех осмотр',5000.00),(2,'смена масла',1500.00),(3,'мойка',3000.00);
/*!40000 ALTER TABLE `услуга` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `клиентская_аналитика`
--

/*!50001 DROP VIEW IF EXISTS `клиентская_аналитика`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `клиентская_аналитика` AS select `k`.`Id_клиента` AS `ID_клиента`,concat(`k`.`Фамилия`,' ',`k`.`Имя`,ifnull(concat(' ',`k`.`Отчество`),'')) AS `ФИО_клиента`,`k`.`Телефон` AS `Телефон`,count(`z`.`Id_заявки`) AS `Количество_заявок`,sum(`z`.`Итоговая_стоимость`) AS `Общая_сумма_ремонтов`,max(`z`.`Дата`) AS `Последняя_заявка`,group_concat(distinct `m`.`Название` separator ', ') AS `Ремонтированные_устройства`,group_concat(distinct `u`.`Название` separator ', ') AS `Использованные_услуги` from ((((`клиент` `k` left join `заявка_на_ремонт` `z` on((`k`.`Id_клиента` = `z`.`Id_клиента`))) left join `список_заявок` `s` on((`z`.`Id_заявки` = `s`.`Id_заявки`))) left join `услуга` `u` on((`s`.`Id_услуги` = `u`.`Id_услуги`))) left join `модель` `m` on((`z`.`Id_модели` = `m`.`Id_модели`))) group by `k`.`Id_клиента` order by `Общая_сумма_ремонтов` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `модельview`
--

/*!50001 DROP VIEW IF EXISTS `модельview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `модельview` AS select `м`.`Id_модели` AS `ID_модели`,`м`.`Название` AS `Модель`,`м`.`цвет` AS `Цвет`,`т`.`Id_тип_модели` AS `ID_типа`,`т`.`Название` AS `Тип_устройства` from (`модель` `м` join `тип_модели` `т` on((`м`.`Id_тип_модели` = `т`.`Id_тип_модели`))) */;
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

-- Dump completed on 2025-06-26 14:41:03
