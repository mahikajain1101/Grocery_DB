-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Company
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `STORE`
--
DROP DATABASE IF EXISTS `GROCERY_STORE`;
CREATE SCHEMA `GROCERY_STORE`;
USE `GROCERY_STORE`;
DROP TABLE IF EXISTS `STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STORE` (
  `StoreID` int(5) NOT NULL,
  `StoreName` varchar(30),
  `Location` varchar(30),
  `OwnerID` int(10) NOT NULL,
  `PeakHours` TIME,
  `OpeningTime` TIME,
  `ClosingTime` TIME,
  PRIMARY KEY (`StoreID`),
  UNIQUE KEY `OwnerID` (`OwnerID`),
  FOREIGN KEY (`OwnerID`) REFERENCES `OWNER` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STORE`
--

LOCK TABLES `STORE` WRITE;
/*!40000 ALTER TABLE `STORE` DISABLE KEYS */;
INSERT INTO `STORE` VALUES (1, 'Ratnadeep', 'Gachibowli', 11101, '18:00:00', '08:00:00', '20:00:00'),
 (2, 'Star Mall', 'Lingampally', 11102, '17:30:00', '09:30:00', '21:00:00'),
 (3, 'Walmart', 'Old Hyderabad', 11103, '10:00:00', '08:30:00', '22:00:00'),
 (4, 'Mega Mart', 'Jubilee Hills', 11104, '14:00:00', '10:00:00', '21:00:00'),
 (5, 'Costco', 'Banjara Hills', 11105, '19:00:00', '09:00:00', '22:00:00');
/*!40000 ALTER TABLE `STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENT`
--

DROP TABLE IF EXISTS `EQUIPMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EQUIPMENT` (
  `ItemID` int(5),
  `StoreID` int(5),
  `ItemName` varchar(30),
  `Warranty(yrs)` int(2),
  `CostOfMaintainence` int(5),
  `Lifespan(yrs)` int(3),
  PRIMARY KEY (`ItemID`,`StoreID`),
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT`
--

LOCK TABLES `EQUIPMENT` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT` DISABLE KEYS */;
INSERT INTO `EQUIPMENT` VALUES (1888, 1, 'Refrigerator', 5, 20000, 10),
(1240, 1, 'Fan', 3, 100, 5),(1671, 2, 'Air Conditioner', 5, 35000, 7),
(1729, 2, 'Bar Code Scanner', 4, 200, 6),(2911, 3, 'Television', 6, 50000, 10),
(1163, 3, 'Computer', 10, 90000, 15),(2895, 4, 'Speaker', 6, 500, 7),
(3728, 4, 'Camera', 2, 1000, 5),(3199, 5, 'Freezer', 10, 2000, 13),(1479, 5, 'Lights', 5, 200, 6);
/*!40000 ALTER TABLE `EQUIPMENT` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `SUPPLIERS`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER` (
  `SupplierID` int(5) NOT NULL,
  `StoreID` int(5) NOT NULL,
  `FirstName` varchar(30),
  `LastName` varchar(30),
  `PhoneNo` varchar(20),
  `Address` varchar(100),

  PRIMARY KEY (`SupplierID`),
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER``
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES
(501,1,'Poorvi','HC','9876578775','Gachibowli'),
(502,2,'Anika','Roy','8768578678','Cyberabad'),
(503,3,'Tom','Rush','8957868988','Hitec City'),
(504,4,'Resse','Bibby','7856768958','Old Hyderabad'),
(505,5,'Tony','Ramirez','6785768898','Indiranagar');
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CustomerID` int(15) NOT NULL,
  `CustomerName` varchar(40),
  `StoreID` int(5) NOT NULL,
  `EmployeeID` int(5) NOT NULL,
  `Age` int(3),
  `DOB` date,
  `PhoneNo` varchar(20),
  PRIMARY KEY (`CustomerID`),
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`),
  FOREIGN KEY (`EmployeeID`) REFERENCES `EMPLOYEE` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1230001,'Ashna',2,2003004,21,'2001:10:04',9875642344),
(1230002,'Maulik',2,2003003,26,'1996:03:15','9876475930'),
(1230003,'Riya',1,2003001,28,'1994:09:08','9857848755'),
(1230004,'Prachi',4,2003008,14,'2008:09:18','9867459906'),
(1230005,'Saher',5,2003009,20,'2001:12:04','8985068965'),
(1230006,'Shobha',3,2003005,45,'1978:02:05','9448487567')
;
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `EMPLOYEE` (
  `EmployeeID` int(10) NOT NULL,
  `StoreID` int(10) NOT NULL,
  `FirstName` varchar(30),
  `LastName` varchar(30),
  `SupervisorID` int(5) NULL,
  `DOB` date,
  `Age` int(3),
  `JobType` varchar(20),
  `DateOfJoining` date,
  `Salary` int(8),
  PRIMARY KEY (`EmployeeID`),
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`),
  FOREIGN KEY (`SupervisorID`) REFERENCES `EMPLOYEE` (`EmployeeID`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/* TGEMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES 
(2003001,1,'Vanshita','Mahajan',2003002,'2003:01:15',19,'Cashier','2022:05:12',10000),
(2003002,1,'Khushi','Goyal',NULL,'2003:07:01',19,'Manager','2022:05:10',15000),
(2003003,2,'Mahika','Jain',2003004,'2004:01:11',18,'Cashier','2022:09:10',10000),
(2003004,2,'Sannidhya','Gupta',NULL,'2003:12:26',19,'Manager','2020:09:01',15000),
(2003005,3,'Prisha','Arora',2003006,'2003:11:23',19,'Cashier','2022:05:01',10000),
(2003006,3,'Vrinda','Agarwal',NULL,'2002:10:10',20,'Manager','2022:01:15',15000),
(2003007,4,'Arghya','Roy',2003008,'2003:10:09',19,'Cashier','2022:03:02',10000),
(2003008,4,'Nanda','Rajiv',NULL,'2003:10:05',19,'Manager','2022:03:01',15000),
(2003009,5,'Gaurav','Bhole',2003010,'2003:05:06',19,'Cashier','2022:01:10',10000),
(2003010,5,'Hardik','Mittal',NULL,'2002:03:10',19,'Manager','2022:02:05',15000);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_ON`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT`(
  `ProductID` int(9) NOT NULL,
  `Name` varchar(30),
  `ManufacturingDate` date,
  `FreshTime` int(3) NULL,
  `ExpiryDate` date,
  `SellingPrice` int(5),
  `CostPrice` int(5), 
  PRIMARY KEY (`ProductID`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES
(2022001,'Maggi','2022:11:02',4,'2022:12:02',20,10),
(2022002,'Ferrero Rocher','2022:10:10',10,'2022:12:20',200,150),
(2022003,'Cocoa Butter Body Lotion','2022:09:05',200,'2026:09:05',300,200),
(2022004,'Sanitary Napkins','2022:10:10',120,'2024:10:10',350,200),
(2022005,'Rice(1kg)','2022:10:10',60,'2023:11:10',300,200),
(2022006,'Bread','2022:11:27',1,'2022:12:04',50,35),
(2022007,'Deodorant','2022:05:10',200,'2025:05:10',175,120),
(2022008,'Biscuit','2022:09:13',8,'2022:11:27',75,50), 
(2022009,'Bottle','2022:05:10',200,'2024:06:17',120,45),
(2022010,'Soap','2021:03:10',100,'2021:03:10',60,45),
(2022011,'Garam Masala','2022:09:03',100,'2023:04:03',80,65),
(2022012,'Broom','2022:01:01',NULL,NULL,100,64),
(2022013,'Chicken(1/2 kg)','2022:10:03',34,'2023:05:06',300,215),
(2022014,'Cake(1 slice)','2022:11:27',1,'2022:12:05',70,60),
(2022015,'Pen','2022:11:26',NULL,NULL,10,6),
(2022016,'Notebook','2022:09:12',NULL,NULL,85,80);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `OWNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OWNER` (
  `OwnerID` int(10) NOT NULL,
  `FirstName` varchar(30),
  `LastName` varchar(30),
  `StoreID` int(5) NOT NULL,
  `Rent` int(10),
  PRIMARY KEY (`OwnerID`),
 
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OWNER`
--

LOCK TABLES `OWNER` WRITE;
/*!40000 ALTER TABLE `OWNER` DISABLE KEYS */;
INSERT INTO `OWNER` VALUES (11101,'Raghu','Raj',1,1000000),(11102,'Prince','Miller',2,2045000),(11103,'Sandeep','S',3,3031450),(11104,'Ram','Raj',4,5234546),(11105,'Sumukh','Shrote',5,8000234);
/*!40000 ALTER TABLE `OWNER` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `FINANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FINANCE` (
  `StoreID` int(5) NOT NULL,
  `Season` varchar(20) NOT NULL,
  `Expenditure` int(15),
  `Income` int(15) ,
  
  PRIMARY KEY (`StoreID`,`Season`),
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FINANCE`
--

LOCK TABLES `FINANCE` WRITE;
/*!40000 ALTER TABLE `FINANCE` DISABLE KEYS */;
INSERT INTO `FINANCE` VALUES (1,'Monsoon',2000000,3000000),
(1,'Spring',3000000,4023453),(2,'Monsoon',4503214,2134354),
(2,'Spring',3203453,9034213),(3,'Monsoon',6660481,2763101),
(3,'Spring',4889355,7694971),(4,'Monsoon',6690219,7281825),
(4,'Spring',4192992,8755472),(5,'Monsoon',6113780,6477749),(5,'Spring',3384531,6435417);
/*!40000 ALTER TABLE `FINANCE` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `TRANSACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSACTION` (
  `TransactionID` int(10) NOT NULL,
  `StoreID` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `TimeOfPurchase` TIME,
  `PaymentDetails` varchar(30),
  PRIMARY KEY (`TransactionID`),
 
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`),
  FOREIGN KEY (`CustomerID`) REFERENCES `CUSTOMER` (`CustomerID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTION`
--

LOCK TABLES `TRANSACTION` WRITE;
/*!40000 ALTER TABLE `TRANSACTION` DISABLE KEYS */;
INSERT INTO `TRANSACTION` VALUES (101001,3,1230001,'10:02:11','Paytm'),
(101002,3,1230001,'16:25:32','GPay'),(101003,4,1230002,'08:43:15','GPay'),(101004,4,1230002,'14:53:18','GPay'),
(101005,4,1230002,'10:10:43','Paytm'),(101006,5,1230003,'16:49:38','PhonePe'),(101007,5,1230003,'12:56:57','Cash'),
(101008,5,1230003,'14:44:53','Cash'),(101009,5,1230003,'22:22:34','GPay'),(101010,2,1230004,'15:55:04','PhonePe'),
(101011,2,1230004,'17:46:22','Cash'),(101012,1,1230005,'11:30:09','Paytm'),(101013,1,1230005,'17:46:22','Cash'),
(101014,1,1230005,'21:46:04','Paytm'),(101015,3,1230006,'13:50:47','PhonePe'),(101016,3,1230006,'14:35:00','Paytm');
/*!40000 ALTER TABLE `TRANSACTION` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `PURCHASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE` (
  `TransactionID` int(10) NOT NULL,
  `ProductID` int(15) NOT NULL,
  
  PRIMARY KEY (`TransactionID`,`ProductID`),
 
  FOREIGN KEY (`TransactionID`) REFERENCES `TRANSACTION` (`TransactionID`),
  FOREIGN KEY (`ProductID`) REFERENCES `PRODUCT` (`ProductID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE`
--

LOCK TABLES `PURCHASE` WRITE;
/*!40000 ALTER TABLE `PURCHASE` DISABLE KEYS */;
INSERT INTO `PURCHASE` VALUES (101001,2022001),(101001,2022004),(101001,2022005),
(101002,2022002),(101002,2022005),
(101003,2022003),(101004,2022004),(101005,2022011),(101005,2022005),
(101006,2022006),(101007,2022007),(101007,2022012),(101007,2022003),
(101007,2022001),(101007,2022011),(101008,2022008),
(101009,2022009),(101010,2022010),(101010,2022016),(101010,2022012),(101011,2022011),
(101012,2022012),(101013,2022013),(101014,2022014),(101014,2022005),
(101015,2022015),(101016,2022016);
/*!40000 ALTER TABLE `PURCHASE` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVENTORY` (
  `StoreID` int(5) NOT NULL,
  `ProductID` int(9) NOT NULL,
  `NoOfAvailableItems` int(5),
  
  PRIMARY KEY (`StoreID`,`ProductID`),
 
  FOREIGN KEY (`StoreID`) REFERENCES `STORE` (`StoreID`),
  FOREIGN KEY (`ProductID`) REFERENCES `PRODUCT` (`ProductID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVENTORY`
--

LOCK TABLES `INVENTORY` WRITE;
-- /*!40000 ALTER TABLE `INVENTORY` DISABLE KEYS */;
INSERT INTO `INVENTORY` VALUES 
(1,2022005,5),
(1,2022012,7),
(1,2022013,10),
(1,2022014,10),
(1,2022016,4),
(1,2022006,0),
(2,2022010,10),
(2,2022016,12),
(2,2022012,13),
(2,2022011,12),
(2,2022001,10),
(3,2022015,1),
(3,2022016,3),
(3,2022001,45),
(3,2022004,23),
(3,2022005,12),
(3,2022002,14),
(4,2022003,20),
(4,2022004,4),
(4,2022005,12),
(4,2022011,14),
(5,2022006,34),
(5,2022007,10),
(5,2022008,13),
(5,2022009,10),
(5,2022010,37);
-- /*!40000 ALTER TABLE `INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-12 23:29:32