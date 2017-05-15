-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Terminal_FMCG
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.2

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
-- Current Database: `Terminal_FMCG`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Terminal_FMCG` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Terminal_FMCG`;

--
-- Temporary table structure for view `AccountInfo`
--

DROP TABLE IF EXISTS `AccountInfo`;
/*!50001 DROP VIEW IF EXISTS `AccountInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `AccountInfo` (
  `EntityID` tinyint NOT NULL,
  `EntityAccountID` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `Enabled` tinyint NOT NULL,
  `IDNumber` tinyint NOT NULL,
  `Title` tinyint NOT NULL,
  `FirstName` tinyint NOT NULL,
  `LastName` tinyint NOT NULL,
  `ContactNum` tinyint NOT NULL,
  `PhysicalAddress` tinyint NOT NULL,
  `PostalAddress` tinyint NOT NULL,
  `DeliveryAddress` tinyint NOT NULL,
  `PhoneNumber` tinyint NOT NULL,
  `FaxNumber` tinyint NOT NULL,
  `CellNumber` tinyint NOT NULL,
  `EmailAddress` tinyint NOT NULL,
  `Bank` tinyint NOT NULL,
  `BankBranch` tinyint NOT NULL,
  `BankAccount` tinyint NOT NULL,
  `Reference` tinyint NOT NULL,
  `VatNumber` tinyint NOT NULL,
  `Notes` tinyint NOT NULL,
  `ChequeName` tinyint NOT NULL,
  `CreditRating` tinyint NOT NULL,
  `Code` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `AccountTransaction`
--

DROP TABLE IF EXISTS `AccountTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountTransaction` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AccountID` varchar(6) NOT NULL DEFAULT '',
  `TransactionID` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(20) DEFAULT NULL,
  `Amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `ExportID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` int(11) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `AccountID` (`AccountID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `ExportID` (`ExportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountTransaction`
--

LOCK TABLES `AccountTransaction` WRITE;
/*!40000 ALTER TABLE `AccountTransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccountTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdjustmentReason`
--

DROP TABLE IF EXISTS `AdjustmentReason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdjustmentReason` (
  `ID` int(11) NOT NULL,
  `AdjustmentReason` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdjustmentReason`
--

LOCK TABLES `AdjustmentReason` WRITE;
/*!40000 ALTER TABLE `AdjustmentReason` DISABLE KEYS */;
INSERT INTO `AdjustmentReason` VALUES (1,'Stolen'),(2,'Broken'),(3,'Lost'),(4,'Found Lost');
/*!40000 ALTER TABLE `AdjustmentReason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthData`
--

DROP TABLE IF EXISTS `AuthData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthData` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthUserID` int(11) NOT NULL DEFAULT '0',
  `Finger1` blob,
  `Finger2` blob,
  `CardText` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthData`
--

LOCK TABLES `AuthData` WRITE;
/*!40000 ALTER TABLE `AuthData` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthGroup`
--

DROP TABLE IF EXISTS `AuthGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthGroup` (
  `SourceID` varchar(10) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthGroup`
--

LOCK TABLES `AuthGroup` WRITE;
/*!40000 ALTER TABLE `AuthGroup` DISABLE KEYS */;
INSERT INTO `AuthGroup` VALUES ('OMC',1000,'Admin','2004-12-09 14:48:02',NULL),('OMC',1001,'Manager','2005-05-16 06:47:07',NULL),('OMC',1002,'Supervisor','2005-05-16 06:47:07',NULL),('OMC',1003,'Waiter','2005-05-16 06:47:07',NULL);
/*!40000 ALTER TABLE `AuthGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthUser`
--

DROP TABLE IF EXISTS `AuthUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthUser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Password` varchar(13) DEFAULT NULL,
  `LanguageID` char(2) NOT NULL DEFAULT 'EN',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` int(11) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `PasswordClear` varchar(30) DEFAULT NULL,
  `Mode` enum('disabled','enabled','login') NOT NULL DEFAULT 'enabled',
  `ZRunState` enum('AllowSale','BlockSale') NOT NULL DEFAULT 'AllowSale',
  `Commission` decimal(3,2) DEFAULT '0.00',
  `WaiterNum` tinyint(2) NOT NULL DEFAULT '0',
  `TelNo` varchar(255) DEFAULT NULL,
  `Address` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`),
  KEY `LanguageID` (`LanguageID`),
  KEY `SourceID` (`SourceID`),
  KEY `ModifierID` (`ModifierID`)
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthUser`
--

LOCK TABLES `AuthUser` WRITE;
/*!40000 ALTER TABLE `AuthUser` DISABLE KEYS */;
INSERT INTO `AuthUser` VALUES (2,'Leonie (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:13:14',NULL,'88','disabled','AllowSale',0.00,-1,'',''),(503,'Admin','5141','EN','BIO',NULL,'2010-06-30 02:26:17',NULL,'5141','enabled','AllowSale',0.00,99,'1','1'),(505,'Kalene (del)',NULL,'EN','BIO',NULL,'2006-08-25 16:36:48',NULL,'0000','disabled','AllowSale',0.00,-1,'',''),(506,'Amy (del)',NULL,'EN','BIO',NULL,'2006-08-25 16:35:18',NULL,'555','disabled','AllowSale',0.00,-1,'',''),(507,'steve (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:57',NULL,'86723','disabled','AllowSale',0.00,-1,'',''),(508,'Mirka (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:39',NULL,'6040','disabled','AllowSale',0.00,-1,'',''),(509,'Deborah (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:50:32',NULL,'7777','disabled','AllowSale',0.00,-1,'',''),(510,'Irina (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:12:07',NULL,'1911','disabled','AllowSale',0.00,-1,'',''),(513,'Erica (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:02',NULL,'1977','disabled','AllowSale',0.00,-1,'',''),(514,'Mandy (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:28',NULL,'1605','disabled','AllowSale',0.00,-1,'',''),(515,'John (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:19',NULL,'147','disabled','AllowSale',0.00,-1,'',''),(516,'Nash (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:11:09',NULL,'5342','disabled','AllowSale',0.00,-1,'',''),(517,'bernadine (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:11:51',NULL,'1313','disabled','AllowSale',0.00,-1,'',''),(518,'Mandhla',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'170','enabled','AllowSale',0.00,13,'',''),(519,'Linda (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:13:19',NULL,'1967','disabled','AllowSale',0.00,-1,'',''),(520,'Gaby (del)',NULL,'EN','BIO',NULL,'2007-06-19 15:51:45',NULL,'1607','disabled','AllowSale',0.00,-1,'',''),(521,'Mads',NULL,'EN','BIO',NULL,'2010-07-03 02:51:01',NULL,'0279','enabled','AllowSale',0.00,16,'',''),(522,'Diana (del)',NULL,'EN','BIO',NULL,'2007-02-10 00:07:09',NULL,'0852','disabled','AllowSale',0.00,-1,'',''),(523,'Monica (del)',NULL,'EN','BIO',NULL,'2006-10-03 13:58:20',NULL,'2222','disabled','AllowSale',0.00,-1,'',''),(524,'Dean (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:19:38',NULL,'1999','disabled','AllowSale',0.00,-1,'',''),(525,'Tanya',NULL,'EN','BIO',NULL,'2010-07-30 00:55:44',NULL,'4426','enabled','AllowSale',0.00,20,'',''),(528,'Smart Ass (del)',NULL,'EN','BIO',NULL,'2007-03-08 18:19:18',NULL,'312','disabled','AllowSale',0.00,-1,'',''),(529,'Andrew',NULL,'EN','BIO',NULL,'2007-03-08 18:16:15',NULL,'9876','enabled','AllowSale',0.00,22,'',''),(530,'Leonard (del)',NULL,'EN','BIO',NULL,'2007-06-13 22:15:08',NULL,'1970','disabled','AllowSale',0.00,-1,'',''),(531,'Wilson (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:11:24',NULL,'999','disabled','AllowSale',0.00,-1,'',''),(532,'Edward (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:50:36',NULL,'3456','disabled','AllowSale',0.00,-1,'',''),(533,'Dumo',NULL,'EN','BIO',NULL,'2010-08-14 01:00:53',NULL,'2828','enabled','AllowSale',0.00,26,'',''),(534,'Zandi (del)',NULL,'EN','BIO',NULL,'2006-08-25 16:35:40',NULL,'1983','disabled','AllowSale',0.00,-1,'',''),(535,'Christal (del)',NULL,'EN','BIO',NULL,'2007-04-17 21:17:13',NULL,'1982','disabled','AllowSale',0.00,-1,'',''),(536,'Lauren (del)',NULL,'EN','BIO',NULL,'2006-08-25 16:35:29',NULL,'0813','disabled','AllowSale',0.00,-1,'',''),(537,'Michaela (del)',NULL,'EN','BIO',NULL,'2006-08-25 16:35:45',NULL,'33','disabled','AllowSale',0.00,-1,'',''),(538,'Kerry (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:50:50',NULL,'13120','disabled','AllowSale',0.00,-1,'',''),(539,'Julia (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:06:05',NULL,'212','disabled','AllowSale',0.00,-1,'',''),(540,'Julius (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:19:55',NULL,'1979','disabled','AllowSale',0.00,-1,'',''),(541,'Joe (del)',NULL,'EN','BIO',NULL,'2007-12-01 01:26:04',NULL,'1980','disabled','AllowSale',0.00,-1,'',''),(543,'BA (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:11:43',NULL,'58583','disabled','AllowSale',0.00,-1,'',''),(544,'Kim (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:13:11',NULL,'7747','disabled','AllowSale',0.00,-1,'',''),(545,'karen (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:13:08',NULL,'8888','disabled','AllowSale',0.00,-1,'',''),(546,'Gift (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:50:39',NULL,'5240','disabled','AllowSale',0.00,-1,'',''),(547,'Morgana (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:11:15',NULL,'2203','disabled','AllowSale',0.00,-1,'',''),(548,'Belinda (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:11:48',NULL,'6355','disabled','AllowSale',0.00,-1,'',''),(549,'Kate (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:07:16',NULL,'130678','disabled','AllowSale',0.00,-1,'',''),(550,'CK (del)',NULL,'EN','BIO',NULL,'2007-04-28 16:43:11',NULL,'85','disabled','AllowSale',0.00,-1,'',''),(551,'Meagan',NULL,'EN','BIO',NULL,'2010-08-17 00:53:54',NULL,'32355','enabled','AllowSale',0.00,38,'',''),(552,'Witness (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:20:25',NULL,'73','disabled','AllowSale',0.00,-1,'',''),(553,'Miichaela (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:37',NULL,'3333','disabled','AllowSale',0.00,-1,'',''),(554,'Candice (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:11:55',NULL,'55555','disabled','AllowSale',0.00,-1,'',''),(555,'Gabz (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:04',NULL,'8520','disabled','AllowSale',0.00,-1,'',''),(557,'Marcelle (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:23:53',NULL,'2127','disabled','AllowSale',0.00,-1,'',''),(558,'Mich (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:34',NULL,'1976','disabled','AllowSale',0.00,-1,'',''),(559,'Jenny (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:41:12',NULL,'963','disabled','AllowSale',0.00,-1,'',''),(560,'Sipho (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:20:10',NULL,'8966','disabled','AllowSale',0.00,-1,'',''),(561,'Irene',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'1999','enabled','AllowSale',0.00,46,'',''),(562,'Tanya (del)',NULL,'EN','BIO',NULL,'2006-10-12 13:10:30',NULL,'1978','disabled','AllowSale',0.00,-1,'',''),(563,'Natascia (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:51:04',NULL,'8609','disabled','AllowSale',0.00,-1,'',''),(564,'Alana (del)',NULL,'EN','BIO',NULL,'2007-03-19 14:03:20',NULL,'8203','disabled','AllowSale',0.00,-1,'',''),(565,'Bronwyn (del)',NULL,'EN','BIO',NULL,'2006-11-22 00:40:49',NULL,'070','disabled','AllowSale',0.00,-1,'',''),(566,'Kim (del)',NULL,'EN','BIO',NULL,'2007-06-19 15:52:00',NULL,'2011','disabled','AllowSale',0.00,-1,'',''),(567,'Dean (del)',NULL,'EN','BIO',NULL,'2006-10-26 15:39:31',NULL,'9999','disabled','AllowSale',0.00,-1,'',''),(568,'Vanessa (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:51:11',NULL,'1988','disabled','AllowSale',0.00,-1,'',''),(569,'Lucia',NULL,'EN','BIO',NULL,'2009-08-29 01:19:46',NULL,'2356','enabled','AllowSale',0.00,4,'',''),(570,'Darryl (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:19:29',NULL,'1029','disabled','AllowSale',0.00,-1,'',''),(571,'Morgana (del)',NULL,'EN','BIO',NULL,'2006-11-28 15:14:02',NULL,'2203','disabled','AllowSale',0.00,-1,'',''),(572,'Morgana (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:51:01',NULL,'2704','disabled','AllowSale',0.00,-1,'',''),(573,'Cheree (del)',NULL,'EN','BIO',NULL,'2007-02-16 00:50:21',NULL,'14789','disabled','AllowSale',0.00,-1,'',''),(574,'Tatiana (del)',NULL,'EN','BIO',NULL,'2007-01-08 17:05:48',NULL,'1503','disabled','AllowSale',0.00,-1,'',''),(576,'Tatiana (del)',NULL,'EN','BIO',NULL,'2007-01-08 17:07:23',NULL,'1503','disabled','AllowSale',0.00,-1,'',''),(577,'Tatiana (del)',NULL,'EN','BIO',NULL,'2007-01-08 17:08:40',NULL,'1503','disabled','AllowSale',0.00,-1,'',''),(578,'Tati (del)',NULL,'EN','BIO',NULL,'2007-02-10 00:06:59',NULL,'315','disabled','AllowSale',0.00,-1,'',''),(579,'Roxy2',NULL,'EN','BIO',NULL,'2010-06-29 16:20:06',NULL,'8390','enabled','AllowSale',0.00,11,'',''),(580,'Betty (del)',NULL,'EN','BIO',NULL,'2007-02-16 01:05:35',NULL,'17','disabled','AllowSale',0.00,-1,'',''),(581,'Precious (del)',NULL,'EN','BIO',NULL,'2007-11-30 17:08:23',NULL,'2000','disabled','AllowSale',0.00,-1,'',''),(582,'Jess',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'50150','enabled','AllowSale',0.00,24,'',''),(583,'Liza',NULL,'EN','BIO',NULL,'2010-06-27 03:27:05',NULL,'6914','enabled','AllowSale',0.00,27,'',''),(584,'Mandy (del)',NULL,'EN','BIO',NULL,'2007-03-19 14:03:38',NULL,'1234','disabled','AllowSale',0.00,-1,'',''),(585,'Christine (del)',NULL,'EN','BIO',NULL,'2007-04-17 21:17:20',NULL,'4010','disabled','AllowSale',0.00,-1,'',''),(586,'Shana (del)',NULL,'EN','BIO',NULL,'2007-04-17 21:20:35',NULL,'000','disabled','AllowSale',0.00,-1,'',''),(587,'Lucille (del)',NULL,'EN','BIO',NULL,'2007-03-08 18:19:10',NULL,'4242','disabled','AllowSale',0.00,-1,'',''),(588,'Irene (del)',NULL,'EN','BIO',NULL,'2007-04-17 21:17:26',NULL,'101','disabled','AllowSale',0.00,-1,'',''),(589,'Dixie (del)',NULL,'EN','BIO',NULL,'2007-05-15 19:20:53',NULL,'777','disabled','AllowSale',0.00,-1,'',''),(590,'Morgana (del)',NULL,'EN','BIO',NULL,'2007-03-05 18:39:12',NULL,'2704','disabled','AllowSale',0.00,-1,'',''),(591,'Sarah (del)',NULL,'EN','BIO',NULL,'2007-05-21 18:05:17',NULL,'2580','disabled','AllowSale',0.00,-1,'',''),(592,'Mike (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:06:36',NULL,'6367','disabled','AllowSale',0.00,-1,'',''),(593,'Bryan (del)',NULL,'EN','BIO',NULL,'2007-03-08 18:20:28',NULL,'6969','disabled','AllowSale',0.00,-1,'',''),(594,'Bryan (del)',NULL,'EN','BIO',NULL,'2007-03-08 18:20:58',NULL,'6969','disabled','AllowSale',0.00,-1,'',''),(595,'Bryan (del)',NULL,'EN','BIO',NULL,'2007-03-08 18:22:17',NULL,'6969','disabled','AllowSale',0.00,-1,'',''),(596,'Bryan',NULL,'EN','BIO',NULL,'2010-05-26 01:15:32',NULL,'0312','enabled','AllowSale',0.00,6,'',''),(597,'Jacky (del)',NULL,'EN','BIO',NULL,'2008-05-03 00:40:59',NULL,'11','disabled','AllowSale',0.00,-1,'',''),(598,'Kapka (del)',NULL,'EN','BIO',NULL,'2007-03-13 15:44:20',NULL,'33','disabled','AllowSale',0.00,-1,'',''),(599,'Kapka',NULL,'EN','BIO',NULL,'2010-07-02 02:38:52',NULL,'789','enabled','AllowSale',0.00,21,'',''),(600,'Pauline',NULL,'EN','BIO',NULL,'2010-08-17 00:53:54',NULL,'1992','enabled','AllowSale',0.00,25,'',''),(601,'Jane (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:07:35',NULL,'1441','disabled','AllowSale',0.00,-1,'',''),(602,'Cyl (del)',NULL,'EN','BIO',NULL,'2007-04-17 21:17:06',NULL,'1020','disabled','AllowSale',0.00,-1,'',''),(603,'Andrew (del)',NULL,'EN','BIO',NULL,'2007-04-28 16:43:02',NULL,'5445','disabled','AllowSale',0.00,-1,'',''),(604,'Debbie (del)',NULL,'EN','BIO',NULL,'2007-04-27 17:35:48',NULL,'5582','disabled','AllowSale',0.00,-1,'',''),(606,'Debbie',NULL,'EN','BIO',NULL,'2009-03-01 01:12:50',NULL,'3092','enabled','AllowSale',0.00,7,'',''),(607,'Lauren (del)',NULL,'EN','BIO',NULL,'2007-11-30 17:07:53',NULL,'1126','disabled','AllowSale',0.00,-1,'',''),(608,'Candice (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:19:34',NULL,'7474','disabled','AllowSale',0.00,-1,'',''),(609,'Aneska (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:25:31',NULL,'77777','disabled','AllowSale',0.00,-1,'',''),(610,'Sarah (del)',NULL,'EN','BIO',NULL,'2007-06-19 15:51:28',NULL,'2580','disabled','AllowSale',0.00,-1,'',''),(611,'Sarah (del)',NULL,'EN','BIO',NULL,'2007-06-19 15:52:13',NULL,'2408','disabled','AllowSale',0.00,-1,'',''),(612,'Suron (del)',NULL,'EN','BIO',NULL,'2007-11-30 17:08:13',NULL,'1306','disabled','AllowSale',0.00,-1,'',''),(613,'Charlie (del)',NULL,'EN','BIO',NULL,'2007-11-30 17:07:39',NULL,'1822','disabled','AllowSale',0.00,-1,'',''),(614,'Sue (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:06:19',NULL,'54032','disabled','AllowSale',0.00,-1,'',''),(615,'Stephanie (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:06:28',NULL,'7950','disabled','AllowSale',0.00,-1,'',''),(616,'Tarin (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:06:23',NULL,'06022','disabled','AllowSale',0.00,-1,'',''),(617,'Nikki (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:19:06',NULL,'456+','disabled','AllowSale',0.00,-1,'',''),(618,'Sizwe (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:06:16',NULL,'7410','disabled','AllowSale',0.00,-1,'',''),(619,'Malvin',NULL,'EN','BIO',NULL,'2010-08-17 00:53:54',NULL,'1222','enabled','AllowSale',0.00,9,'',''),(620,'Kat (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:18:45',NULL,'5574','disabled','AllowSale',0.00,-1,'',''),(621,'Ursula (del)',NULL,'EN','BIO',NULL,'2007-11-30 17:08:17',NULL,'1111','disabled','AllowSale',0.00,-1,'',''),(622,'Kim (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:23:44',NULL,'2274','disabled','AllowSale',0.00,-1,'',''),(623,'Candy (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:07:40',NULL,'2684','disabled','AllowSale',0.00,-1,'',''),(624,'Jay (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:07:24',NULL,'7911','disabled','AllowSale',0.00,-1,'',''),(625,'Veli (del)',NULL,'EN','BIO',NULL,'2007-08-29 00:06:49',NULL,'2301','disabled','AllowSale',0.00,-1,'',''),(626,'Trymore (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:20:22',NULL,'4444','disabled','AllowSale',0.00,-1,'',''),(627,'nikki (del)',NULL,'EN','BIO',NULL,'2007-08-08 17:16:20',NULL,'456+','disabled','AllowSale',0.00,-1,'',''),(628,'Percy (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:20:05',NULL,'1981','disabled','AllowSale',0.00,-1,'',''),(629,'Temba (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:24:12',NULL,'2571','disabled','AllowSale',0.00,-1,'',''),(630,'Bright',NULL,'EN','BIO',NULL,'2010-08-06 01:03:25',NULL,'2010','enabled','AllowSale',0.00,49,'',''),(631,'Nicole',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'7878','enabled','AllowSale',0.00,50,'',''),(632,'Bronwyn',NULL,'EN','BIO',NULL,'2010-08-15 00:56:50',NULL,'22222','enabled','AllowSale',0.00,8,'',''),(633,'Hilary (del)',NULL,'EN','BIO',NULL,'2007-10-27 00:19:48',NULL,'2339','disabled','AllowSale',0.00,-1,'',''),(634,'Gibson (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:25:47',NULL,'3455','disabled','AllowSale',0.00,-1,'',''),(635,'Function',NULL,'EN','BIO',NULL,'2010-03-16 00:54:22',NULL,'9999999988888','enabled','AllowSale',0.00,32,'',''),(636,'CK (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:23:56',NULL,'456','disabled','AllowSale',0.00,-1,'',''),(637,'Zena (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:24:15',NULL,'8835','disabled','AllowSale',0.00,-1,'',''),(638,'Lesharne (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:24:01',NULL,'7177','disabled','AllowSale',0.00,-1,'',''),(639,'Dee',NULL,'EN','BIO',NULL,'2010-01-29 01:19:52',NULL,'1515','enabled','AllowSale',0.00,2,'',''),(640,'Li',NULL,'EN','BIO',NULL,'2008-07-13 01:08:20',NULL,'0258','enabled','AllowSale',0.00,3,'',''),(641,'Steve Test',NULL,'EN','BIO',NULL,'2009-02-03 19:37:32',NULL,'754322','disabled','AllowSale',0.00,-1,'',''),(642,'Suron',NULL,'EN','BIO',NULL,'2010-07-21 01:01:25',NULL,'2005','enabled','AllowSale',0.00,10,'',''),(643,'Margo',NULL,'EN','BIO',NULL,'2008-10-25 01:08:19',NULL,'0604','enabled','AllowSale',0.00,12,'',''),(644,'Prudy (del)',NULL,'EN','BIO',NULL,'2008-04-15 19:24:21',NULL,'2007','disabled','AllowSale',0.00,-1,'',''),(645,'Red',NULL,'EN','BIO',NULL,'2008-07-18 01:11:39',NULL,'2356','enabled','AllowSale',0.00,15,'',''),(646,'Zelma',NULL,'EN','BIO',NULL,'2008-02-09 01:25:54',NULL,'1987','enabled','AllowSale',0.00,19,'',''),(647,'Chantelle',NULL,'EN','BIO',NULL,'2010-08-17 00:53:54',NULL,'1236','enabled','AllowSale',0.00,23,'',''),(648,'Roxanne',NULL,'EN','BIO',NULL,'2008-10-12 01:01:51',NULL,'8856','enabled','AllowSale',0.00,28,'',''),(649,'Merryl',NULL,'EN','BIO',NULL,'2010-07-31 23:15:27',NULL,'21114','disabled','AllowSale',0.00,31,'',''),(650,'Candice',NULL,'EN','BIO',NULL,'2010-08-01 01:10:36',NULL,'0711','enabled','AllowSale',0.00,33,'',''),(651,'Nancy',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'1964','enabled','AllowSale',0.00,36,'',''),(652,'Gareth',NULL,'EN','BIO',NULL,'2010-07-10 02:30:09',NULL,'2257','enabled','AllowSale',0.00,37,'',''),(653,'Alex',NULL,'EN','BIO',NULL,'2010-08-14 01:00:53',NULL,'1900','enabled','AllowSale',0.00,1,'',''),(654,'Adel',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'2335','enabled','AllowSale',0.00,14,'',''),(657,'Jill',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'3535','enabled','AllowSale',0.00,18,'',''),(658,'Adele',NULL,'EN','BIO',NULL,'2008-05-11 01:21:29',NULL,'1660','enabled','AllowSale',0.00,29,'',''),(659,'Lynne',NULL,'EN','BIO',NULL,'2010-07-31 23:13:55',NULL,'2020','disabled','AllowSale',0.00,-1,'',''),(660,'Roxy',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'8390','enabled','AllowSale',0.00,30,'',''),(661,'Val',NULL,'EN','BIO',NULL,'2010-06-30 02:26:17',NULL,'211003','enabled','AllowSale',0.00,34,'',''),(663,'Annelene',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'0000','enabled','AllowSale',0.00,35,'',''),(664,'Zelma',NULL,'EN','BIO',NULL,'2010-08-11 00:45:36',NULL,'1910','enabled','AllowSale',0.00,39,'',''),(665,'Mish',NULL,'EN','BIO',NULL,'2010-08-08 01:14:11',NULL,'2626','enabled','AllowSale',0.00,40,'',''),(670,'Marcelle',NULL,'EN','BIO',NULL,'2009-01-23 01:17:20',NULL,'0603','enabled','AllowSale',0.00,41,'',''),(671,'Keo',NULL,'EN','BIO',NULL,'2008-12-19 01:01:20',NULL,'2025','enabled','AllowSale',0.00,42,'',''),(672,'Annie',NULL,'EN','BIO',NULL,'2010-01-09 01:14:01',NULL,'7402','enabled','AllowSale',0.00,43,'',''),(673,'Kristy',NULL,'EN','BIO',NULL,'2009-03-28 01:14:23',NULL,'1515','enabled','AllowSale',0.00,44,'',''),(674,'[New User]',NULL,'EN','BIO',NULL,'2009-02-03 19:37:22',NULL,'','disabled','AllowSale',0.00,-1,'',''),(675,'Tasha',NULL,'EN','BIO',NULL,'2010-07-01 02:02:46',NULL,'28147','enabled','AllowSale',0.00,5,'',''),(676,'Raymond',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'1339','enabled','AllowSale',0.00,45,'',''),(677,'....',NULL,'EN','BIO',NULL,'2010-08-09 17:33:43',NULL,'2524','enabled','AllowSale',0.00,47,'',''),(678,'Louise',NULL,'EN','BIO',NULL,'2009-05-01 01:10:39',NULL,'3610','enabled','AllowSale',0.00,48,'',''),(679,'Desi',NULL,'EN','BIO',NULL,'2010-06-12 02:31:05',NULL,'1206','enabled','AllowSale',0.00,51,'',''),(680,'Tina',NULL,'EN','BIO',NULL,'2009-10-18 01:32:41',NULL,'8969','enabled','AllowSale',0.00,52,'',''),(681,'Lee',NULL,'EN','BIO',NULL,'2010-02-21 01:25:19',NULL,'7894','enabled','AllowSale',0.00,53,'',''),(682,'Clio',NULL,'EN','BIO',NULL,'2010-08-18 00:48:10',NULL,'64585','enabled','AllowSale',0.00,54,'',''),(685,'Mandy',NULL,'EN','BIO',NULL,'2010-03-06 01:29:53',NULL,'1912','enabled','AllowSale',0.00,55,'',''),(686,'Leonard',NULL,'EN','BIO',NULL,'2010-08-15 00:56:50',NULL,'2261','enabled','AllowSale',0.00,56,'',''),(687,'New User (del)',NULL,'EN','BIO',NULL,'2010-01-12 20:19:26',NULL,'999','disabled','AllowSale',0.00,-1,NULL,NULL),(688,'Angela',NULL,'EN','BIO',NULL,'2010-07-12 03:03:14',NULL,'1809','enabled','AllowSale',0.00,57,'',''),(689,'Nonce',NULL,'EN','BIO',NULL,'2010-05-16 01:19:53',NULL,'1137','enabled','AllowSale',0.00,58,'',''),(690,'Jo',NULL,'EN','BIO',NULL,'2010-07-10 02:30:09',NULL,'1456','enabled','AllowSale',0.00,59,'',''),(691,'Lauren',NULL,'EN','BIO',NULL,'2010-07-11 03:20:37',NULL,'1858','enabled','AllowSale',0.00,60,'','');
/*!40000 ALTER TABLE `AuthUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthUserGroup`
--

DROP TABLE IF EXISTS `AuthUserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthUserGroup` (
  `SourceID` varchar(10) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthUserID` int(11) NOT NULL DEFAULT '0',
  `AuthGroupID` int(11) NOT NULL DEFAULT '0',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AuthUserID` (`AuthUserID`,`AuthGroupID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `AuthUserID_2` (`AuthUserID`),
  KEY `AuthGroupID` (`AuthGroupID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthUserGroup`
--

LOCK TABLES `AuthUserGroup` WRITE;
/*!40000 ALTER TABLE `AuthUserGroup` DISABLE KEYS */;
INSERT INTO `AuthUserGroup` VALUES ('BIO',1,503,1000,'2006-07-25 16:30:47',NULL),('BIO',2,2,1003,'2006-07-25 16:18:40',NULL),('BIO',4,505,1003,'2006-07-25 16:40:31',NULL),('BIO',5,506,1003,'2006-07-25 16:41:10',NULL),('BIO',6,507,1003,'2006-07-25 16:42:18',NULL),('BIO',7,508,1003,'2006-07-25 16:45:12',NULL),('BIO',8,509,1003,'2006-07-25 16:47:56',NULL),('BIO',9,510,1003,'2006-07-25 16:49:04',NULL),('BIO',12,513,1003,'2006-07-25 16:59:52',NULL),('BIO',13,514,1003,'2006-07-25 17:29:00',NULL),('BIO',14,515,1003,'2006-07-26 13:47:20',NULL),('BIO',15,516,1003,'2006-07-26 16:29:04',NULL),('BIO',16,517,1003,'2006-07-26 16:36:00',NULL),('BIO',17,518,1003,'2006-07-26 16:37:26',NULL),('BIO',18,519,1003,'2006-07-26 17:45:50',NULL),('BIO',19,520,1000,'2006-08-01 23:43:44',NULL),('BIO',20,521,1000,'2006-07-28 19:00:40',NULL),('BIO',21,522,1000,'2006-08-04 00:11:50',NULL),('BIO',22,523,1001,'2006-07-28 00:02:59',NULL),('BIO',23,524,1003,'2006-07-29 19:07:51',NULL),('BIO',24,525,1003,'2006-07-29 19:08:35',NULL),('BIO',27,528,1000,'2006-08-01 23:43:31',NULL),('BIO',28,529,1000,'2006-08-01 23:43:21',NULL),('BIO',29,530,1003,'2006-08-07 16:11:44',NULL),('BIO',30,531,1003,'2006-08-07 16:12:13',NULL),('BIO',31,532,1003,'2006-08-07 16:32:42',NULL),('BIO',32,533,1003,'2006-08-08 16:23:50',NULL),('BIO',33,534,1003,'2006-08-08 16:27:33',NULL),('BIO',34,535,1003,'2006-08-09 16:53:47',NULL),('BIO',35,536,1003,'2006-08-16 17:04:28',NULL),('BIO',36,537,1003,'2006-08-17 16:24:09',NULL),('BIO',37,538,1003,'2006-08-23 16:52:43',NULL),('BIO',38,539,1003,'2006-08-25 16:34:37',NULL),('BIO',39,540,1003,'2006-08-25 16:48:43',NULL),('BIO',40,541,1003,'2006-08-25 18:34:00',NULL),('BIO',42,543,1003,'2006-08-26 16:18:48',NULL),('BIO',43,544,1003,'2006-08-29 16:49:44',NULL),('BIO',44,545,1003,'2006-08-29 16:50:24',NULL),('BIO',45,546,1003,'2006-08-29 18:20:53',NULL),('BIO',46,547,1003,'2006-09-01 16:14:04',NULL),('BIO',47,548,1003,'2006-09-01 16:36:32',NULL),('BIO',48,549,1003,'2006-09-05 16:17:25',NULL),('BIO',49,550,1003,'2006-09-09 16:49:57',NULL),('BIO',50,551,1003,'2006-09-12 15:59:01',NULL),('BIO',51,552,1003,'2006-09-14 15:50:57',NULL),('BIO',52,553,1003,'2006-09-14 16:05:22',NULL),('BIO',53,554,1003,'2006-09-18 16:20:45',NULL),('BIO',54,555,1003,'2006-09-22 17:04:23',NULL),('BIO',56,557,1000,'2006-10-03 14:30:41',NULL),('BIO',57,558,1003,'2006-10-04 16:54:34',NULL),('BIO',58,559,1003,'2006-10-04 16:57:19',NULL),('BIO',59,560,1003,'2006-10-06 16:00:05',NULL),('BIO',60,561,1003,'2006-10-06 16:08:27',NULL),('BIO',61,562,1003,'2006-10-10 16:31:38',NULL),('BIO',62,563,1003,'2006-10-10 16:34:29',NULL),('BIO',63,564,1003,'2006-10-10 16:37:13',NULL),('BIO',64,565,1003,'2006-10-11 16:16:04',NULL),('BIO',65,566,1000,'2006-10-14 16:16:33',NULL),('BIO',66,567,1003,'2006-10-18 16:22:39',NULL),('BIO',67,568,1003,'2006-11-17 12:23:19',NULL),('BIO',68,569,1000,'2006-11-27 16:56:00',NULL),('BIO',69,570,1000,'2006-11-27 20:14:13',NULL),('BIO',70,571,1003,'2006-11-28 15:12:41',NULL),('BIO',71,572,1003,'2006-11-28 15:14:05',NULL),('BIO',72,573,1003,'2007-01-08 16:58:11',NULL),('BIO',73,574,1003,'2007-01-08 17:04:18',NULL),('BIO',75,576,1000,'2007-01-08 17:06:21',NULL),('BIO',76,577,1000,'2007-01-08 17:07:51',NULL),('BIO',77,578,1000,'2007-01-08 17:09:17',NULL),('BIO',78,579,1003,'2007-01-12 14:28:13',NULL),('BIO',79,580,1003,'2007-01-13 17:55:48',NULL),('BIO',80,581,1003,'2007-01-13 18:02:07',NULL),('BIO',81,582,1003,'2007-01-16 16:14:42',NULL),('BIO',82,583,1003,'2007-02-01 17:18:38',NULL),('BIO',83,584,1003,'2007-02-05 18:05:08',NULL),('BIO',84,585,1003,'2007-02-05 18:08:55',NULL),('BIO',85,586,1003,'2007-02-15 14:59:14',NULL),('BIO',86,587,1003,'2007-02-21 17:10:35',NULL),('BIO',87,588,1003,'2007-02-22 16:54:36',NULL),('BIO',88,589,1003,'2007-03-05 16:22:11',NULL),('BIO',89,590,1003,'2007-03-05 18:37:29',NULL),('BIO',90,591,1003,'2007-03-07 19:27:01',NULL),('BIO',91,592,1003,'2007-03-08 14:48:41',NULL),('BIO',92,593,1003,'2007-03-08 18:19:59',NULL),('BIO',93,594,1003,'2007-03-08 18:20:31',NULL),('BIO',94,595,1003,'2007-03-08 18:21:00',NULL),('BIO',95,596,1000,'2007-03-08 18:22:59',NULL),('BIO',96,597,1003,'2007-03-13 15:43:04',NULL),('BIO',97,598,1003,'2007-03-13 15:43:47',NULL),('BIO',98,599,1003,'2007-03-13 15:44:22',NULL),('BIO',99,600,1003,'2007-03-19 16:34:02',NULL),('BIO',100,601,1003,'2007-03-20 17:03:01',NULL),('BIO',101,602,1003,'2007-04-03 16:13:31',NULL),('BIO',102,603,1003,'2007-04-03 16:14:41',NULL),('BIO',103,604,1001,'2007-04-27 17:25:55',NULL),('BIO',105,606,1000,'2007-04-27 17:38:22',NULL),('BIO',106,607,1003,'2007-05-04 17:50:15',NULL),('BIO',107,608,1003,'2007-05-09 18:11:01',NULL),('BIO',108,609,1003,'2007-05-15 19:19:54',NULL),('BIO',109,610,1002,'2007-05-21 18:05:40',NULL),('BIO',110,611,1000,'2007-05-21 18:06:35',NULL),('BIO',111,612,1003,'2007-05-22 16:50:49',NULL),('BIO',112,613,1003,'2007-06-08 00:10:44',NULL),('BIO',113,614,1003,'2007-06-08 15:52:14',NULL),('BIO',114,615,1003,'2007-06-11 15:22:24',NULL),('BIO',115,616,1003,'2007-06-12 20:03:58',NULL),('BIO',116,617,1000,'2007-06-20 16:54:14',NULL),('BIO',117,618,1003,'2007-06-23 18:00:11',NULL),('BIO',118,619,1003,'2007-06-23 18:01:35',NULL),('BIO',119,620,1000,'2007-07-04 18:18:29',NULL),('BIO',120,621,1003,'2007-07-13 15:58:52',NULL),('BIO',121,622,1000,'2007-07-16 16:05:15',NULL),('BIO',122,623,1003,'2007-07-17 16:02:29',NULL),('BIO',123,624,1003,'2007-07-18 16:26:53',NULL),('BIO',124,625,1003,'2007-08-03 17:32:49',NULL),('BIO',125,626,1003,'2007-08-03 17:33:52',NULL),('BIO',126,627,1000,'2007-08-08 17:15:10',NULL),('BIO',127,628,1003,'2007-08-22 16:41:37',NULL),('BIO',128,629,1003,'2007-08-23 16:20:04',NULL),('BIO',129,630,1003,'2007-08-28 15:50:31',NULL),('BIO',130,631,1003,'2007-08-28 16:48:33',NULL),('BIO',131,632,1003,'2007-08-29 15:48:14',NULL),('BIO',132,633,1003,'2007-09-04 15:04:32',NULL),('BIO',133,634,1003,'2007-09-11 15:35:16',NULL),('BIO',134,635,1003,'2007-09-18 00:43:18',NULL),('BIO',135,636,1003,'2007-09-21 18:01:01',NULL),('BIO',136,637,1003,'2007-10-02 15:48:45',NULL),('BIO',137,638,1003,'2007-11-14 10:52:17',NULL),('BIO',138,639,1003,'2007-11-23 17:24:23',NULL),('BIO',139,640,1003,'2007-12-05 18:48:33',NULL),('BIO',140,641,1003,'2007-12-15 13:18:27',NULL),('BIO',141,642,1003,'2008-01-15 18:11:23',NULL),('BIO',142,643,1003,'2008-01-17 21:34:09',NULL),('BIO',143,644,1003,'2008-01-19 16:13:30',NULL),('BIO',144,645,1003,'2008-01-19 16:20:46',NULL),('BIO',145,646,1003,'2008-02-08 18:11:41',NULL),('BIO',146,647,1003,'2008-02-08 18:12:34',NULL),('BIO',147,648,1003,'2008-03-07 17:07:09',NULL),('BIO',148,649,1003,'2008-03-13 14:23:01',NULL),('BIO',149,650,1003,'2008-04-02 16:25:42',NULL),('BIO',150,651,1000,'2008-04-15 16:49:59',NULL),('BIO',151,652,1000,'2008-04-15 19:00:39',NULL),('BIO',152,653,1003,'2008-04-15 22:11:55',NULL),('BIO',153,654,1000,'2008-04-16 15:25:31',NULL),('BIO',156,657,1003,'2008-05-02 17:38:44',NULL),('BIO',157,658,1003,'2008-05-02 17:39:44',NULL),('BIO',158,659,1003,'2008-06-09 18:33:35',NULL),('BIO',159,660,1003,'2008-06-21 00:33:42',NULL),('BIO',160,661,1003,'2008-07-22 18:11:32',NULL),('BIO',162,663,1003,'2008-08-09 18:36:01',NULL),('BIO',163,664,1000,'2008-09-01 16:12:21',NULL),('BIO',164,665,1003,'2008-09-19 21:17:37',NULL),('BIO',169,670,1003,'2008-12-02 15:59:42',NULL),('BIO',170,671,1003,'2008-12-02 16:00:32',NULL),('BIO',171,672,1000,'2009-01-07 16:44:33',NULL),('BIO',172,673,1003,'2009-01-13 16:49:48',NULL),('BIO',173,674,1003,'2009-02-03 19:17:53',0),('BIO',174,675,1003,'2009-03-02 17:32:21',NULL),('BIO',175,676,1003,'2009-03-11 00:35:40',NULL),('BIO',176,677,1003,'2009-03-11 22:45:07',NULL),('BIO',177,678,1000,'2009-04-30 22:05:16',NULL),('BIO',178,679,1003,'2009-06-10 20:07:29',NULL),('BIO',179,680,1003,'2009-10-06 20:21:25',NULL),('BIO',180,681,1003,'2009-10-09 18:57:41',NULL),('BIO',181,682,1003,'2009-11-06 16:43:23',NULL),('BIO',184,685,1003,'2009-11-17 17:32:33',NULL),('BIO',185,686,1003,'2009-11-21 18:51:47',NULL),('BIO',186,687,1003,'2010-01-12 20:19:20',NULL),('BIO',187,688,1003,'2010-04-09 17:18:54',NULL),('BIO',188,689,1003,'2010-05-15 17:09:03',NULL),('BIO',189,690,1003,'2010-06-08 17:39:14',NULL),('BIO',190,691,1003,'2010-06-08 17:46:46',NULL);
/*!40000 ALTER TABLE `AuthUserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `BasicTableInfo`
--

DROP TABLE IF EXISTS `BasicTableInfo`;
/*!50001 DROP VIEW IF EXISTS `BasicTableInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `BasicTableInfo` (
  `OpenSaleID` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Extension` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `WaiterName` tinyint NOT NULL,
  `WaiterNum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Beds`
--

DROP TABLE IF EXISTS `Beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Beds` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WardID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beds`
--

LOCK TABLES `Beds` WRITE;
/*!40000 ALTER TABLE `Beds` DISABLE KEYS */;
/*!40000 ALTER TABLE `Beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CashDrop`
--

DROP TABLE IF EXISTS `CashDrop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CashDrop` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `Cash` double NOT NULL,
  `CreditCard` double NOT NULL,
  `Cheque` double NOT NULL,
  `Account` double NOT NULL,
  `CDDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EndShiftID` int(11) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CashDrop`
--

LOCK TABLES `CashDrop` WRITE;
/*!40000 ALTER TABLE `CashDrop` DISABLE KEYS */;
/*!40000 ALTER TABLE `CashDrop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CashPayout`
--

DROP TABLE IF EXISTS `CashPayout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CashPayout` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ref` varchar(255) NOT NULL,
  `EntityAccountID` int(11) NOT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ModifierID` int(11) NOT NULL DEFAULT '0',
  `Modified` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CashPayout`
--

LOCK TABLES `CashPayout` WRITE;
/*!40000 ALTER TABLE `CashPayout` DISABLE KEYS */;
/*!40000 ALTER TABLE `CashPayout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cashup`
--

DROP TABLE IF EXISTS `Cashup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cashup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TillCashupID` int(11) NOT NULL DEFAULT '0',
  `CSTill` decimal(9,2) DEFAULT NULL,
  `CSSys` decimal(9,2) DEFAULT NULL,
  `FloatSys` decimal(9,2) DEFAULT NULL,
  `CQTill` decimal(9,2) DEFAULT NULL,
  `CQSys` decimal(9,2) DEFAULT NULL,
  `CCTill` decimal(9,2) DEFAULT NULL,
  `CCSys` decimal(9,2) DEFAULT NULL,
  `ACTill` decimal(9,2) DEFAULT NULL,
  `ACSys` decimal(9,2) DEFAULT NULL,
  `TipsOut` decimal(9,2) DEFAULT NULL,
  `CashOut` decimal(9,2) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `ComissionPercent` decimal(9,2) DEFAULT '0.00',
  `ComissionValue` decimal(9,2) DEFAULT '0.00',
  `Breakage` decimal(14,5) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TillCashupID` (`TillCashupID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cashup`
--

LOCK TABLES `Cashup` WRITE;
/*!40000 ALTER TABLE `Cashup` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cashup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `ID` varchar(6) NOT NULL DEFAULT '',
  `Type` enum('Assets','Equities','Expenses and Losses','Income and Profits') NOT NULL DEFAULT 'Assets',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Config_BOMenuCatagories`
--

DROP TABLE IF EXISTS `Config_BOMenuCatagories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config_BOMenuCatagories` (
  `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Uniqe Key',
  `Name` varchar(100) NOT NULL COMMENT 'Catagory Name',
  `Rank` int(11) NOT NULL COMMENT 'The Catagory number from the top',
  `UserID` int(11) NOT NULL COMMENT 'User that this config belongs to',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='Config table for Back Office menu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Config_BOMenuCatagories`
--

LOCK TABLES `Config_BOMenuCatagories` WRITE;
/*!40000 ALTER TABLE `Config_BOMenuCatagories` DISABLE KEYS */;
INSERT INTO `Config_BOMenuCatagories` VALUES (1,'Accounts',8,13),(2,'Customization',10,13),(3,'Stock Take',3,13),(4,'Purchase Orders',13,13),(5,'Reports',4,13),(6,'Stock Management',5,13),(7,'Utilities',6,13),(8,'Cashups',9,13),(9,'Print Cashups',7,13),(10,'Information',11,13),(11,'Purchases',15,13),(12,'Test',12,13),(13,'Puchase Orders',14,13),(14,'Developer',0,13),(15,'Database',2,13),(16,'Developer Database',1,13),(17,'Debtor Accounts',16,13),(18,'Administration',17,13),(19,'User/nAdministration',18,13),(20,'GROUP',16,13),(21,'User Administration',19,13),(22,'User Level Administration',20,13);
/*!40000 ALTER TABLE `Config_BOMenuCatagories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Config_BOMenuFav`
--

DROP TABLE IF EXISTS `Config_BOMenuFav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config_BOMenuFav` (
  `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Uniqe Identifier',
  `Category` varchar(100) NOT NULL COMMENT 'Category that the Favourate is part of',
  `Name` varchar(100) NOT NULL COMMENT 'Name of the item',
  `UserID` int(11) NOT NULL COMMENT 'User ID that this shortcut belongs to',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1 COMMENT='Backoffice Favourates menu storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Config_BOMenuFav`
--

LOCK TABLES `Config_BOMenuFav` WRITE;
/*!40000 ALTER TABLE `Config_BOMenuFav` DISABLE KEYS */;
INSERT INTO `Config_BOMenuFav` VALUES (29,'Stock\nTake','Create Stock Take',13),(39,'Utilities','.Calculator',13),(41,'Stock\nManagement','.Edit Categories',13),(71,'Reports','Account Overview',13),(75,'User\nAdministration','User Level Administration',13),(76,'Stock\nManagement','Stock Locations',13),(77,'Purchases','Capture New GRV',13);
/*!40000 ALTER TABLE `Config_BOMenuFav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Configuration`
--

DROP TABLE IF EXISTS `Configuration`;
/*!50001 DROP VIEW IF EXISTS `Configuration`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Configuration` (
  `ConfigOption` tinyint NOT NULL,
  `Value` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ConsolidatedCashup`
--

DROP TABLE IF EXISTS `ConsolidatedCashup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsolidatedCashup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CashupDate` datetime NOT NULL,
  `Notes200Qty` int(11) NOT NULL,
  `Notes100Qty` int(11) NOT NULL,
  `Notes50Qty` int(11) NOT NULL,
  `Notes20Qty` int(11) NOT NULL,
  `Notes10Qty` int(11) NOT NULL,
  `Coins5Qty` int(11) NOT NULL,
  `Coins2Qty` int(11) NOT NULL,
  `Coins1Qty` int(11) NOT NULL,
  `CoinsOtherValue` decimal(14,5) NOT NULL,
  `FloatOpen` decimal(14,5) NOT NULL,
  `FloatClosed` decimal(14,5) NOT NULL,
  `SafeStorage` decimal(14,5) NOT NULL,
  `PaidOut` decimal(14,5) NOT NULL,
  `Breakage` decimal(14,5) NOT NULL,
  `TillCS` decimal(14,5) NOT NULL,
  `SysCS` decimal(14,5) NOT NULL,
  `TillCC` decimal(14,5) NOT NULL,
  `SysCC` decimal(14,5) NOT NULL,
  `TillCQ` decimal(14,5) NOT NULL,
  `SysCQ` decimal(14,5) NOT NULL,
  `TillAC` decimal(14,5) NOT NULL,
  `SysAC` decimal(14,5) NOT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsolidatedCashup`
--

LOCK TABLES `ConsolidatedCashup` WRITE;
/*!40000 ALTER TABLE `ConsolidatedCashup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsolidatedCashup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CreditNote`
--

DROP TABLE IF EXISTS `CreditNote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CreditNote` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseOrderLineItemID` int(11) NOT NULL,
  `ReferenceNo` varchar(50) NOT NULL,
  `Notes` varchar(500) NOT NULL,
  `SourceID` varchar(10) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `Modified` datetime NOT NULL,
  `Completed` tinyint(4) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreditNote`
--

LOCK TABLES `CreditNote` WRITE;
/*!40000 ALTER TABLE `CreditNote` DISABLE KEYS */;
INSERT INTO `CreditNote` VALUES (1,218,'qwer','','MPL_3',13,'2010-12-08 10:52:42',0),(2,174,'ii','','MPL_3',13,'2010-12-09 11:52:27',0),(3,175,'ii','','MPL_3',13,'2010-12-09 11:52:27',0),(4,219,'','','MPL_3',13,'2010-12-09 11:53:20',0);
/*!40000 ALTER TABLE `CreditNote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Currency`
--

DROP TABLE IF EXISTS `Currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Currency` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(40) DEFAULT 'Unknown',
  `Prefix` char(10) DEFAULT '',
  `Sufix` char(10) DEFAULT '',
  `Exchange` double NOT NULL DEFAULT '1',
  `Default` int(11) NOT NULL DEFAULT '0',
  `Key` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Currency`
--

LOCK TABLES `Currency` WRITE;
/*!40000 ALTER TABLE `Currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `Currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataMerge`
--

DROP TABLE IF EXISTS `DataMerge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataMerge` (
  `PosID` int(10) unsigned NOT NULL,
  `Stage1` varchar(1) NOT NULL DEFAULT 'N',
  `Stage2` varchar(1) NOT NULL DEFAULT 'N',
  `Stage3` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`PosID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataMerge`
--

LOCK TABLES `DataMerge` WRITE;
/*!40000 ALTER TABLE `DataMerge` DISABLE KEYS */;
/*!40000 ALTER TABLE `DataMerge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedMeals`
--

DROP TABLE IF EXISTS `DeletedMeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedMeals` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(100) NOT NULL DEFAULT '',
  `WardName` varchar(10) NOT NULL DEFAULT '',
  `BedName` varchar(10) NOT NULL DEFAULT '',
  `BedID` int(11) NOT NULL DEFAULT '0',
  `MealItemID` int(11) NOT NULL DEFAULT '0',
  `MealDayDateID` int(11) NOT NULL DEFAULT '0',
  `Reason` set('Discharged','Deleted') NOT NULL DEFAULT '',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MealID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedMeals`
--

LOCK TABLES `DeletedMeals` WRITE;
/*!40000 ALTER TABLE `DeletedMeals` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedMeals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DiscountReason`
--

DROP TABLE IF EXISTS `DiscountReason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DiscountReason` (
  `Reason` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DiscountReason`
--

LOCK TABLES `DiscountReason` WRITE;
/*!40000 ALTER TABLE `DiscountReason` DISABLE KEYS */;
INSERT INTO `DiscountReason` VALUES ('Promotion items        '),('Managers         ');
/*!40000 ALTER TABLE `DiscountReason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EndShift`
--

DROP TABLE IF EXISTS `EndShift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EndShift` (
  `EndId` int(11) NOT NULL AUTO_INCREMENT,
  `AuthUserID` int(11) NOT NULL,
  `EndDate` datetime NOT NULL,
  `ExportFlag` int(11) NOT NULL DEFAULT '0',
  `ShiftCompleted` char(1) NOT NULL DEFAULT 'N',
  `UserID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EndId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EndShift`
--

LOCK TABLES `EndShift` WRITE;
/*!40000 ALTER TABLE `EndShift` DISABLE KEYS */;
/*!40000 ALTER TABLE `EndShift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entity`
--

DROP TABLE IF EXISTS `Entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SourceID` varchar(10) DEFAULT NULL,
  `EntityCategoryID` varchar(6) DEFAULT NULL,
  `IDNumber` varchar(13) DEFAULT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `FirstName` varchar(55) NOT NULL DEFAULT '',
  `LastName` varchar(40) DEFAULT NULL,
  `Contact` varchar(40) DEFAULT NULL,
  `PhysicalAddress` varchar(40) DEFAULT NULL,
  `PhysicalAddress2` varchar(40) DEFAULT NULL,
  `PhysicalAddress3` varchar(40) DEFAULT NULL,
  `PhysicalAddress4` varchar(40) DEFAULT NULL,
  `DeliveryAddress` varchar(40) DEFAULT NULL,
  `DeliveryAddress2` varchar(40) DEFAULT NULL,
  `DeliveryAddress3` varchar(40) DEFAULT NULL,
  `DeliveryAddress4` varchar(40) DEFAULT NULL,
  `PostalAddress` varchar(40) NOT NULL,
  `PostalAddress2` varchar(40) DEFAULT NULL,
  `PostalAddress3` varchar(40) DEFAULT NULL,
  `PostalAddress4` varchar(40) DEFAULT NULL,
  `Phone` varchar(40) NOT NULL DEFAULT '',
  `Fax` varchar(40) DEFAULT NULL,
  `Cell` varchar(40) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Bank` varchar(40) DEFAULT NULL,
  `BankBranch` varchar(40) DEFAULT NULL,
  `BankAccount` varchar(40) DEFAULT NULL,
  `Reference` varchar(40) DEFAULT NULL,
  `VatNo` varchar(10) DEFAULT NULL,
  `Notes` text,
  `ChequeName` varchar(40) DEFAULT NULL,
  `CreditRating` varchar(40) DEFAULT NULL,
  `Common_LanguageID` char(2) NOT NULL DEFAULT 'EN',
  `Enabled` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `Code` varchar(6) NOT NULL DEFAULT '',
  `LocationID` int(11) DEFAULT NULL,
  `LimitAvailable` decimal(14,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `Common_LanguageID` (`Common_LanguageID`),
  KEY `Enabled` (`Enabled`),
  KEY `EntityCategoryID` (`EntityCategoryID`),
  KEY `LocationID` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1533 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entity`
--

LOCK TABLES `Entity` WRITE;
/*!40000 ALTER TABLE `Entity` DISABLE KEYS */;
INSERT INTO `Entity` VALUES (1,NULL,NULL,'',NULL,'CLOVER S.A (PTY) LTD','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2011-07-08 07:36:18',NULL,'',NULL,0.00),(3,NULL,NULL,'',NULL,'3','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(4,NULL,NULL,'',NULL,'4','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(5,NULL,NULL,'',NULL,'5','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(6,NULL,NULL,'',NULL,'6','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(7,NULL,NULL,'',NULL,'7','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(8,NULL,NULL,'',NULL,'8','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(9,NULL,NULL,'',NULL,'AFRICA SPICE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4130138722',NULL,NULL,NULL,'EN','Y','2012-08-31 10:42:56',NULL,'',NULL,0.00),(10,NULL,NULL,'',NULL,'TOP LAY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(11,NULL,NULL,'',NULL,'VENTRAFUSION TRADING PTY LTD','QUINTON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-19 04:22:47',NULL,'',NULL,0.00),(12,NULL,NULL,'',NULL,'MIDAS CATERING','MIDAS CATERING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(13,NULL,NULL,'',NULL,'APOLLO SUPPLIES CC','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(14,NULL,NULL,'',NULL,'DJ FOODS CC','BRETT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(16,NULL,NULL,'',NULL,'SNOWSERV (PTY) LTD','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(17,NULL,NULL,'',NULL,'MEGA PACKAGING','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(22,NULL,NULL,'',NULL,'TASTIES (P & J SNACKS C.C)','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(23,NULL,NULL,'',NULL,'PIEMANS PANTRY','STEVEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4650183785',NULL,NULL,NULL,'EN','Y','2012-09-05 12:16:43',NULL,'',NULL,0.00),(25,NULL,NULL,'',NULL,'25','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(26,NULL,NULL,'',NULL,'26','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(27,NULL,NULL,'',NULL,'27','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(28,NULL,NULL,'',NULL,'28','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(29,NULL,NULL,'',NULL,'29','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(30,NULL,NULL,'',NULL,'30','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(31,NULL,NULL,'',NULL,'31','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(32,NULL,NULL,'',NULL,'32','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(33,NULL,NULL,'',NULL,'33','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(34,NULL,NULL,'',NULL,'34','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(35,NULL,NULL,'',NULL,'35','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(36,NULL,NULL,'',NULL,'36','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(37,NULL,NULL,'',NULL,'37','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(38,NULL,NULL,'',NULL,'38','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(39,NULL,NULL,'',NULL,'39','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(40,NULL,NULL,'',NULL,'KULFI ICE-CREAM MANUFACTURERS ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(41,NULL,NULL,'',NULL,'41','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(42,NULL,NULL,'',NULL,'42','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(43,NULL,NULL,'',NULL,'43','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(44,NULL,NULL,'',NULL,'44','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(45,NULL,NULL,'',NULL,'45','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(47,NULL,NULL,'',NULL,'BON APPETIT','MIKE LIONTARIDES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(48,NULL,NULL,'',NULL,'48','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(49,NULL,NULL,'',NULL,'49','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(50,NULL,NULL,'',NULL,'50','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(51,NULL,NULL,'',NULL,'51','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(52,NULL,NULL,'',NULL,'52','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(53,NULL,NULL,'',NULL,'ABI (COCA COLA)','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(54,NULL,NULL,'',NULL,'54','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(55,NULL,NULL,'',NULL,'MARIOS CONES','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(56,NULL,NULL,'',NULL,'56','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(57,NULL,NULL,'',NULL,'57','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(58,NULL,NULL,'',NULL,'58','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(59,NULL,NULL,'',NULL,'59','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(60,NULL,NULL,'',NULL,'60','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(61,NULL,NULL,'',NULL,'61','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(62,NULL,NULL,'',NULL,'HERCULES COLD STORAGE (PTY) LT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(63,NULL,NULL,'',NULL,'63','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(64,NULL,NULL,'',NULL,'64','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(65,NULL,NULL,'',NULL,'65','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(66,NULL,NULL,'',NULL,'66','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(68,NULL,NULL,'',NULL,'68','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(69,NULL,NULL,'',NULL,'69','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(70,NULL,NULL,'',NULL,'RICA COLD MEATS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(71,NULL,NULL,'',NULL,'71','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(72,NULL,NULL,'',NULL,'72','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(73,NULL,NULL,'',NULL,'73','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(74,NULL,NULL,'',NULL,'74','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(75,NULL,NULL,'',NULL,'75','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(76,NULL,NULL,'',NULL,'76','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(77,NULL,NULL,'',NULL,'77','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(78,NULL,NULL,'',NULL,'78','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(79,NULL,NULL,'',NULL,'79','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(80,NULL,NULL,'',NULL,'SUNRISE SWEETS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4830202893',NULL,NULL,NULL,'EN','Y','2012-10-01 06:15:15',NULL,'',NULL,0.00),(81,NULL,NULL,'',NULL,'DELTA/HOUSEWIFES','CHRIS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-15 08:54:25',NULL,'',NULL,0.00),(82,NULL,NULL,'',NULL,'Simba pty ltd','ruffers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-14 12:03:07',NULL,'',NULL,0.00),(83,NULL,NULL,'',NULL,'DEVLAND ICE CREAM WORLD CC','TELEPONICALLY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-14 09:52:37',NULL,'',NULL,0.00),(84,NULL,NULL,'',NULL,'SAANIA DISTRIBUTORS','MOHAMMED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4560210421',NULL,NULL,NULL,'EN','Y','2012-09-11 14:28:20',NULL,'',NULL,0.00),(85,NULL,NULL,'',NULL,'RIBAS SUPLLIERS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4890179841',NULL,NULL,NULL,'EN','Y','2012-09-11 14:28:20',NULL,'',NULL,0.00),(86,NULL,NULL,'',NULL,'FRESH EXPRESS - PARMALAT','SHAINE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4190241895',NULL,NULL,NULL,'EN','Y','2012-09-11 14:28:20',NULL,'',NULL,0.00),(87,NULL,NULL,'',NULL,'I & J OIL TRADERS','IRMANDO/RICHARD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-10 13:14:34',NULL,'',NULL,0.00),(88,NULL,NULL,'',NULL,'CMP -CHAMDOR MEAT PACKERS ','BONGANI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4570192213',NULL,NULL,NULL,'EN','Y','2012-09-07 14:09:25',NULL,'',NULL,0.00),(89,NULL,NULL,'',NULL,'CENTRAL MEAT MARKET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4440232348',NULL,NULL,NULL,'EN','Y','2012-08-31 12:58:05',NULL,'',NULL,0.00),(90,NULL,NULL,'',NULL,'NATIONS CHOICE BISCUITS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4820179358',NULL,NULL,NULL,'EN','Y','2012-08-31 10:36:41',NULL,'',NULL,0.00),(91,NULL,NULL,'',NULL,'STERKFONTEIN POULTRY PTY LTD','MORNE MEINJTIES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4670179623',NULL,NULL,NULL,'EN','Y','2012-08-29 15:47:23',NULL,'',NULL,0.00),(92,NULL,NULL,'',NULL,'BRITISH AMERICAN TABACCO ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4950154031',NULL,NULL,NULL,'EN','Y','2012-08-29 15:08:14',NULL,'',NULL,0.00),(93,NULL,NULL,'',NULL,'KINGSLEY ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-08-29 14:42:10',NULL,'',NULL,0.00),(94,NULL,NULL,'',NULL,'DEVLAND CASH &CARRY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-08-24 08:38:08',NULL,'',NULL,0.00),(95,NULL,NULL,'',NULL,'CAMBRIDGE ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4350254555',NULL,NULL,NULL,'EN','Y','2012-07-24 11:32:56',NULL,'',NULL,0.00),(96,NULL,NULL,'',NULL,'simply fruit juices','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-09-05 13:08:14',NULL,'',NULL,0.00),(97,NULL,NULL,'',NULL,'POWER SAVE ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-07-05 10:37:01',NULL,'',NULL,0.00),(98,NULL,NULL,'',NULL,'FRESH PACK DAIRY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4230217855',NULL,NULL,NULL,'EN','Y','2012-06-28 12:12:43',NULL,'',NULL,0.00),(99,NULL,NULL,'',NULL,'ALBANY ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,'EN','Y','2012-06-28 09:28:17',NULL,'',NULL,0.00),(100,NULL,NULL,'',NULL,'ICE AGE SNACKS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4620239774',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(102,NULL,NULL,'',NULL,'Fruit Spot','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(103,NULL,NULL,'',NULL,'AGIS BAKERY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-09-05 13:50:41',NULL,'',NULL,0.00),(104,NULL,NULL,'',NULL,'JERRY SWEETS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(105,NULL,NULL,'',NULL,'OBC COLD STORAGE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(106,NULL,NULL,'',NULL,'Bartlet Eggs','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(107,NULL,NULL,'',NULL,'THIRSTYS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(108,NULL,NULL,'',NULL,'ALRODE SOUTH DISTRIBUTORS','ADELE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4770233908',NULL,NULL,NULL,'EN','Y','2012-09-05 14:03:48',NULL,'',NULL,0.00),(109,NULL,NULL,'',NULL,'BARBAS TRADING CC','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(110,NULL,NULL,'',NULL,'INKOSI ACHAAR','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(111,NULL,NULL,'',NULL,'TIGER BRANDS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(112,NULL,NULL,'',NULL,'GOLD REEF BAKERY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(113,NULL,NULL,'',NULL,'CARNIVAL FOODS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(114,NULL,NULL,'',NULL,'PAPA Super Mazie Meal','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(116,NULL,NULL,'',NULL,'TEXLAND WHOLESALE','TEXLAND WHOLESALE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(117,NULL,NULL,'',NULL,'SUNBURST BEVERAGES','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(118,NULL,NULL,'',NULL,'Clarabells Dairy','Clarabells Dairy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(120,NULL,NULL,'',NULL,'UNITED MEAT PACKERS ','JOE AND MARIA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4470210859',NULL,NULL,NULL,'EN','Y','2011-10-21 15:33:32',NULL,'',NULL,0.00),(121,NULL,NULL,'',NULL,'TOP CROP WHOLESALERS','ALBERT/ JOE SANTOS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-09-05 14:07:32',NULL,'',NULL,0.00),(123,NULL,NULL,'',NULL,'kymero meats','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(124,NULL,NULL,'',NULL,'Little Green Bevrages ','Little Green Bevrages ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(125,NULL,NULL,'',NULL,'MAGNUM EGGS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(126,NULL,NULL,'',NULL,'WOHLFAHRT EGGS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(127,NULL,NULL,'',NULL,'Anglo Pac','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(148,NULL,NULL,'',NULL,'ALROSE CHEMICALS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(161,NULL,NULL,'',NULL,'GINGER KING','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(166,NULL,NULL,'',NULL,'OBC DISTRIBUTION','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(186,NULL,NULL,'',NULL,'COOL TIME','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(192,NULL,NULL,'',NULL,'POLAR ICE CREAM','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(240,NULL,NULL,'',NULL,'ALLIED PUBLISHING LIM','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4930120060',NULL,NULL,NULL,'EN','Y','2012-08-24 08:50:43',NULL,'',NULL,0.00),(241,NULL,NULL,'',NULL,'241','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(242,NULL,NULL,'',NULL,'242','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(243,NULL,NULL,'',NULL,'243','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(244,NULL,NULL,'',NULL,'244','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(245,NULL,NULL,'',NULL,'245','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(246,NULL,NULL,'',NULL,'246','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(247,NULL,NULL,'',NULL,'247','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(248,NULL,NULL,'',NULL,'248','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(249,NULL,NULL,'',NULL,'249','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(250,NULL,NULL,'',NULL,'250','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(251,NULL,NULL,'',NULL,'251','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(252,NULL,NULL,'',NULL,'252','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(253,NULL,NULL,'',NULL,'253','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(254,NULL,NULL,'',NULL,'254','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(255,NULL,NULL,'',NULL,'255','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(256,NULL,NULL,'',NULL,'256','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(257,NULL,NULL,'',NULL,'257','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(258,NULL,NULL,'',NULL,'258','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(259,NULL,NULL,'',NULL,'259','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(260,NULL,NULL,'',NULL,'260','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(261,NULL,NULL,'',NULL,'261','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(262,NULL,NULL,'',NULL,'262','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(263,NULL,NULL,'',NULL,'263','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(264,NULL,NULL,'',NULL,'264','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(265,NULL,NULL,'',NULL,'265','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(266,NULL,NULL,'',NULL,'266','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(267,NULL,NULL,'',NULL,'267','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(268,NULL,NULL,'',NULL,'268','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(269,NULL,NULL,'',NULL,'269','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(270,NULL,NULL,'',NULL,'VERSAPAK (MONDI)','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2011-10-21 15:33:32',NULL,'',NULL,0.00),(271,NULL,NULL,'',NULL,'271','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(272,NULL,NULL,'',NULL,'272','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(273,NULL,NULL,'',NULL,'273','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(275,NULL,NULL,'',NULL,'275','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(276,NULL,NULL,'',NULL,'276','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(277,NULL,NULL,'',NULL,'277','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(278,NULL,NULL,'',NULL,'278','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(279,NULL,NULL,'',NULL,'279','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(280,NULL,NULL,'',NULL,'280','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(281,NULL,NULL,'',NULL,'281','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(282,NULL,NULL,'',NULL,'282','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(283,NULL,NULL,'',NULL,'283','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(284,NULL,NULL,'',NULL,'284','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(285,NULL,NULL,'',NULL,'285','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(286,NULL,NULL,'',NULL,'286','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(287,NULL,NULL,'',NULL,'287','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(288,NULL,NULL,'',NULL,'288','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(289,NULL,NULL,'',NULL,'289','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(290,NULL,NULL,'',NULL,'290','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(291,NULL,NULL,'',NULL,'291','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(292,NULL,NULL,'',NULL,'292','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(293,NULL,NULL,'',NULL,'293','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(294,NULL,NULL,'',NULL,'294','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(295,NULL,NULL,'',NULL,'295','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(296,NULL,NULL,'',NULL,'296','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(297,NULL,NULL,'',NULL,'297','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(298,NULL,NULL,'',NULL,'298','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(299,NULL,NULL,'',NULL,'299','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(300,NULL,NULL,'',NULL,'300','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(301,NULL,NULL,'',NULL,'301','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(302,NULL,NULL,'',NULL,'302','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(303,NULL,NULL,'',NULL,'303','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(304,NULL,NULL,'',NULL,'304','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(305,NULL,NULL,'',NULL,'305','MIKE / FABIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(306,NULL,NULL,'',NULL,'306','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(307,NULL,NULL,'',NULL,'307','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(308,NULL,NULL,'',NULL,'308','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(309,NULL,NULL,'',NULL,'309','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(310,NULL,NULL,'',NULL,'310','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(311,NULL,NULL,'',NULL,'311','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(312,NULL,NULL,'',NULL,'312','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(313,NULL,NULL,'',NULL,'313','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(314,NULL,NULL,'',NULL,'314','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(315,NULL,NULL,'',NULL,'315','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(316,NULL,NULL,'',NULL,'316','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(317,NULL,NULL,'',NULL,'317','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(318,NULL,NULL,'',NULL,'318','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(319,NULL,NULL,'',NULL,'319','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(320,NULL,NULL,'',NULL,'320','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(321,NULL,NULL,'',NULL,'321','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(322,NULL,NULL,'',NULL,'322','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(323,NULL,NULL,'',NULL,'323','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(324,NULL,NULL,'',NULL,'324','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(325,NULL,NULL,'',NULL,'325','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(326,NULL,NULL,'',NULL,'326','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(327,NULL,NULL,'',NULL,'327','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(328,NULL,NULL,'',NULL,'328','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(329,NULL,NULL,'',NULL,'329','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(330,NULL,NULL,'',NULL,'330','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(331,NULL,NULL,'',NULL,'331','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(332,NULL,NULL,'',NULL,'332','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(333,NULL,NULL,'',NULL,'333','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(334,NULL,NULL,'',NULL,'334','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(335,NULL,NULL,'',NULL,'335','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(336,NULL,NULL,'',NULL,'336','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(337,NULL,NULL,'',NULL,'337','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(338,NULL,NULL,'',NULL,'338','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(339,NULL,NULL,'',NULL,'339','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(340,NULL,NULL,'',NULL,'340','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(341,NULL,NULL,'',NULL,'341','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(342,NULL,NULL,'',NULL,'342','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(343,NULL,NULL,'',NULL,'343','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(344,NULL,NULL,'',NULL,'344','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(345,NULL,NULL,'',NULL,'345','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(346,NULL,NULL,'',NULL,'346','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(347,NULL,NULL,'',NULL,'347','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(348,NULL,NULL,'',NULL,'348','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(349,NULL,NULL,'',NULL,'349','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(350,NULL,NULL,'',NULL,'350','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(351,NULL,NULL,'',NULL,'351','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(352,NULL,NULL,'',NULL,'352','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(353,NULL,NULL,'',NULL,'353','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(354,NULL,NULL,'',NULL,'354','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(355,NULL,NULL,'',NULL,'355','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(356,NULL,NULL,'',NULL,'356','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(357,NULL,NULL,'',NULL,'357','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(358,NULL,NULL,'',NULL,'358','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(359,NULL,NULL,'',NULL,'359','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(360,NULL,NULL,'',NULL,'360','MIGUEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(361,NULL,NULL,'',NULL,'361','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(362,NULL,NULL,'',NULL,'362','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(363,NULL,NULL,'',NULL,'363','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(364,NULL,NULL,'',NULL,'364','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(365,NULL,NULL,'',NULL,'365','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(366,NULL,NULL,'',NULL,'366','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(367,NULL,NULL,'',NULL,'367','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(368,NULL,NULL,'',NULL,'368','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(369,NULL,NULL,'',NULL,'369','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(370,NULL,NULL,'',NULL,'370','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(371,NULL,NULL,'',NULL,'371','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(372,NULL,NULL,'',NULL,'372','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(373,NULL,NULL,'',NULL,'373','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(374,NULL,NULL,'',NULL,'374','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(375,NULL,NULL,'',NULL,'375','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(376,NULL,NULL,'',NULL,'376','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(378,NULL,NULL,'',NULL,'378','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(379,NULL,NULL,'',NULL,'379','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(380,NULL,NULL,'',NULL,'380','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(381,NULL,NULL,'',NULL,'381','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(382,NULL,NULL,'',NULL,'382','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(383,NULL,NULL,'',NULL,'383','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(384,NULL,NULL,'',NULL,'384','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(385,NULL,NULL,'',NULL,'385','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:55',NULL,'',NULL,0.00),(386,NULL,NULL,'',NULL,'386','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(387,NULL,NULL,'',NULL,'387','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(388,NULL,NULL,'',NULL,'388','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(389,NULL,NULL,'',NULL,'DAIRY WORLD','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(390,NULL,NULL,'',NULL,'390','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(391,NULL,NULL,'',NULL,'391','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(392,NULL,NULL,'',NULL,'392','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(393,NULL,NULL,'',NULL,'393','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(394,NULL,NULL,'',NULL,'394','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(395,NULL,NULL,'',NULL,'395','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(396,NULL,NULL,'',NULL,'396','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(397,NULL,NULL,'',NULL,'397','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(398,NULL,NULL,'',NULL,'398','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(399,NULL,NULL,'',NULL,'399','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(400,NULL,NULL,'',NULL,'400','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(401,NULL,NULL,'',NULL,'401','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(402,NULL,NULL,'',NULL,'402','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(403,NULL,NULL,'',NULL,'403','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(404,NULL,NULL,'',NULL,'404','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(405,NULL,NULL,'',NULL,'405','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(406,NULL,NULL,'',NULL,'406','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(407,NULL,NULL,'',NULL,'407','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(408,NULL,NULL,'',NULL,'408','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(409,NULL,NULL,'',NULL,'409','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(410,NULL,NULL,'',NULL,'410','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(411,NULL,NULL,'',NULL,'411','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(412,NULL,NULL,'',NULL,'412','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(413,NULL,NULL,'',NULL,'413','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(414,NULL,NULL,'',NULL,'414','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(415,NULL,NULL,'',NULL,'415','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(416,NULL,NULL,'',NULL,'416','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(417,NULL,NULL,'',NULL,'417','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(418,NULL,NULL,'',NULL,'418','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(419,NULL,NULL,'',NULL,'419','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(420,NULL,NULL,'',NULL,'420','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(421,NULL,NULL,'',NULL,'421','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(422,NULL,NULL,'',NULL,'422','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(423,NULL,NULL,'',NULL,'423','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(424,NULL,NULL,'',NULL,'424','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(425,NULL,NULL,'',NULL,'425','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(426,NULL,NULL,'',NULL,'426','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(427,NULL,NULL,'',NULL,'427','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(428,NULL,NULL,'',NULL,'428','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(429,NULL,NULL,'',NULL,'429','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(430,NULL,NULL,'',NULL,'430','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(431,NULL,NULL,'',NULL,'431','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(432,NULL,NULL,'',NULL,'432','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(439,NULL,NULL,'',NULL,'PARMALAT S.A','FANI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(459,NULL,NULL,'',NULL,'459','JOHN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(500,NULL,NULL,'',NULL,'500','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(501,NULL,NULL,'',NULL,'501','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(556,NULL,NULL,'',NULL,'556','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(607,NULL,NULL,'',NULL,'607','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(608,NULL,NULL,'',NULL,'608','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(609,NULL,NULL,'',NULL,'609','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(610,NULL,NULL,'',NULL,'610','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(611,NULL,NULL,'',NULL,'BLUE RIBBON','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(612,NULL,NULL,'',NULL,'612','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(613,NULL,NULL,'',NULL,'613','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(614,NULL,NULL,'',NULL,'614','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(615,NULL,NULL,'',NULL,'615','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(616,NULL,NULL,'',NULL,'616','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(617,NULL,NULL,'',NULL,'617','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(618,NULL,NULL,'',NULL,'618','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(619,NULL,NULL,'',NULL,'619','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(620,NULL,NULL,'',NULL,'620','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(621,NULL,NULL,'',NULL,'620','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(622,NULL,NULL,'',NULL,'PREMIER DISTRIBUTION','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(623,NULL,NULL,'',NULL,'623','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(624,NULL,NULL,'',NULL,'624','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(625,NULL,NULL,'',NULL,'625','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(626,NULL,NULL,'',NULL,'626','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(627,NULL,NULL,'',NULL,'627','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(628,NULL,NULL,'',NULL,'628','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(629,NULL,NULL,'',NULL,'629','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(630,NULL,NULL,'',NULL,'630','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(631,NULL,NULL,'',NULL,'631','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(632,NULL,NULL,'',NULL,'632','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(633,NULL,NULL,'',NULL,'633','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(634,NULL,NULL,'',NULL,'634','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(635,NULL,NULL,'',NULL,'635','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(636,NULL,NULL,'',NULL,'636','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(637,NULL,NULL,'',NULL,'637','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(638,NULL,NULL,'',NULL,'638','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(639,NULL,NULL,'',NULL,'639','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(640,NULL,NULL,'',NULL,'640','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(641,NULL,NULL,'',NULL,'641','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(642,NULL,NULL,'',NULL,'642','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(643,NULL,NULL,'',NULL,'643','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(644,NULL,NULL,'',NULL,'644','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(645,NULL,NULL,'',NULL,'645','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(646,NULL,NULL,'',NULL,'646','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(647,NULL,NULL,'',NULL,'647','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(648,NULL,NULL,'',NULL,'648','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(649,NULL,NULL,'',NULL,'649','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(650,NULL,NULL,'',NULL,'650','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(651,NULL,NULL,'',NULL,'651','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(652,NULL,NULL,'',NULL,'652','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(653,NULL,NULL,'',NULL,'653','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(654,NULL,NULL,'',NULL,'654','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(655,NULL,NULL,'',NULL,'655','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(656,NULL,NULL,'',NULL,'656','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(657,NULL,NULL,'',NULL,'657','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(658,NULL,NULL,'',NULL,'658','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(659,NULL,NULL,'',NULL,'659','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(660,NULL,NULL,'',NULL,'660','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(661,NULL,NULL,'',NULL,'661','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(662,NULL,NULL,'',NULL,'662','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(663,NULL,NULL,'',NULL,'663','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(664,NULL,NULL,'',NULL,'664','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(665,NULL,NULL,'',NULL,'665','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(666,NULL,NULL,'',NULL,'666','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(667,NULL,NULL,'',NULL,'667','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(668,NULL,NULL,'',NULL,'668','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(669,NULL,NULL,'',NULL,'669','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(670,NULL,NULL,'',NULL,'670','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(671,NULL,NULL,'',NULL,'671','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(672,NULL,NULL,'',NULL,'672','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(673,NULL,NULL,'',NULL,'673','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(674,NULL,NULL,'',NULL,'674','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(675,NULL,NULL,'',NULL,'675','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(676,NULL,NULL,'',NULL,'676','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(677,NULL,NULL,'',NULL,'677','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(678,NULL,NULL,'',NULL,'678','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(679,NULL,NULL,'',NULL,'679','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(680,NULL,NULL,'',NULL,'680','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(681,NULL,NULL,'',NULL,'681','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(682,NULL,NULL,'',NULL,'682','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(683,NULL,NULL,'',NULL,'683','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(684,NULL,NULL,'',NULL,'684','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(685,NULL,NULL,'',NULL,'685','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(686,NULL,NULL,'',NULL,'686','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(687,NULL,NULL,'',NULL,'687','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(688,NULL,NULL,'',NULL,'688','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(689,NULL,NULL,'',NULL,'689','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(690,NULL,NULL,'',NULL,'690','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(700,NULL,NULL,'',NULL,'700','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(701,NULL,NULL,'',NULL,'701','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(702,NULL,NULL,'',NULL,'702','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(703,NULL,NULL,'',NULL,'703','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(704,NULL,NULL,'',NULL,'704','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(705,NULL,NULL,'',NULL,'705','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(706,NULL,NULL,'',NULL,'706','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(720,NULL,NULL,'',NULL,'720','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(800,NULL,NULL,'',NULL,'JUMBO CROWN MINES','0118394440',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-19 03:47:28',NULL,'',NULL,0.00),(801,NULL,NULL,'',NULL,'CASH PURCHASES','MISCELLANEOUS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-15 11:42:37',NULL,'',NULL,0.00),(802,NULL,NULL,'',NULL,'KEYONA/MITCHET TRADING CC','TELEPHONICALLY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4710202732',NULL,NULL,NULL,'EN','Y','2012-09-15 11:08:22',NULL,'',NULL,0.00),(803,NULL,NULL,'',NULL,'WEST RAND PACKAGING','JOHNNY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/A',NULL,NULL,NULL,'EN','Y','2012-09-15 08:55:13',NULL,'',NULL,0.00),(900,NULL,NULL,'',NULL,'FIRST CHOICE 2002 CC','MARIA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4190241895',NULL,NULL,NULL,'EN','Y','2012-09-15 13:00:07',NULL,'',NULL,0.00),(902,NULL,NULL,'',NULL,'CARDOSO CIGARETTE DEPOT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4720120015',NULL,NULL,NULL,'EN','Y','2012-08-30 11:13:53',NULL,'',NULL,0.00),(1501,NULL,NULL,'',NULL,'D&E MARKETING','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1502,NULL,NULL,'',NULL,'METCASH TRADING','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1503,NULL,NULL,'',NULL,'GRAYSTON MEATS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1504,NULL,NULL,'',NULL,'KYA JUNCTION','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1505,NULL,NULL,'',NULL,'GINGER MAN ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1506,NULL,NULL,'',NULL,'JR CHICKENS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1507,NULL,NULL,'',NULL,'MEATRITE SA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1508,NULL,NULL,'',NULL,'ZIG TRADING','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1509,NULL,NULL,'',NULL,'WALTLOO BIG SAVE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1510,NULL,NULL,'',NULL,'AFRICA CASH AND CARRY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1511,NULL,NULL,'',NULL,'ROCKS ACHAAR','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1512,NULL,NULL,'',NULL,'kit kat wholsalers','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1513,NULL,NULL,'',NULL,'metro cash & carry','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1514,NULL,NULL,'',NULL,'MAGIC RICE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1515,NULL,NULL,'',NULL,'CAMBRIDGE S.M.RANDBURG','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A',NULL,NULL,NULL,'EN','Y','2011-06-01 06:55:56',NULL,'',NULL,0.00),(1516,NULL,NULL,'',NULL,'SLMK WHOLESALE','TONY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4560257612',NULL,NULL,NULL,'EN','Y','2011-07-22 15:26:03',NULL,'',NULL,0.00),(1517,NULL,NULL,'100',NULL,'MR JS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:03:14',NULL,'',NULL,0.00),(1518,NULL,NULL,'101',NULL,'JENNY ROSENBURG','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:01:27',NULL,'',NULL,0.00),(1519,NULL,NULL,'102',NULL,'CISCO','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 12:40:58',NULL,'',NULL,0.00),(1520,NULL,NULL,'103',NULL,'MARIE CASEY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:02:32',NULL,'',NULL,0.00),(1521,NULL,NULL,'105',NULL,'PRIME MEAT BUTHERY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 12:38:21',NULL,'',NULL,0.00),(1522,NULL,NULL,'3',NULL,'HONEYDEW S/MARKET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 12:58:12',NULL,'',NULL,0.00),(1523,NULL,NULL,'39',NULL,'GLEN AIRE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 12:59:30',NULL,'',NULL,0.00),(1524,NULL,NULL,'4',NULL,'IDEAL S/MARKET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:00:24',NULL,'',NULL,0.00),(1525,NULL,NULL,'66',NULL,'MY LUNCH','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:04:13',NULL,'',NULL,0.00),(1526,NULL,NULL,'17',NULL,'THE BRAAI SHACK','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:05:10',NULL,'',NULL,0.00),(1527,NULL,NULL,'27',NULL,'THE BREAD SPREAD','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:05:43',NULL,'',NULL,0.00),(1528,NULL,NULL,'16',NULL,'TOUCH OF CLASS','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:06:10',NULL,'',NULL,0.00),(1529,NULL,NULL,'18',NULL,'TRABELLA PIZZARIA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 13:06:41',NULL,'',NULL,0.00),(1530,NULL,NULL,'33',NULL,'TEST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 14:54:37',NULL,'',NULL,0.00),(1531,NULL,NULL,'34',NULL,'VALUE HYPER MEAT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-06-29 14:56:15',NULL,'',NULL,0.00),(1532,NULL,NULL,'OBC RANBURG',NULL,'RANDBURG SUPER MARRKET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'EN','Y','2012-08-22 17:55:49',NULL,'',NULL,0.00);
/*!40000 ALTER TABLE `Entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntityAccount`
--

DROP TABLE IF EXISTS `EntityAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityAccount` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SourceID` varchar(10) DEFAULT NULL,
  `EntityID` int(11) unsigned NOT NULL DEFAULT '0',
  `EntityAccountTemplateID` varchar(6) NOT NULL DEFAULT '',
  `TermsID` int(11) DEFAULT NULL,
  `DiscountPercentage` decimal(4,1) NOT NULL DEFAULT '0.0',
  `LimitAmount` decimal(9,2) DEFAULT NULL,
  `AccountID` varchar(6) NOT NULL DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `AccountBalance` decimal(9,2) NOT NULL DEFAULT '0.00',
  `VatRegistered` varchar(10) DEFAULT '"YES"',
  `Active` char(2) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `EntityID` (`EntityID`),
  KEY `EntityAccountTemplateID` (`EntityAccountTemplateID`),
  KEY `TermsID` (`TermsID`),
  KEY `AccountID` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=10047 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntityAccount`
--

LOCK TABLES `EntityAccount` WRITE;
/*!40000 ALTER TABLE `EntityAccount` DISABLE KEYS */;
INSERT INTO `EntityAccount` VALUES (1,NULL,1,'PURCH',NULL,0.0,0.00,'','2012-08-31 13:43:05',NULL,2432.16,'Y','Y'),(3,NULL,3,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(4,NULL,4,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(5,NULL,5,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(6,NULL,6,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(7,NULL,7,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(8,NULL,8,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(9,NULL,9,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(10,NULL,10,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(11,NULL,11,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(12,NULL,12,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(13,NULL,13,'PURCH',NULL,0.0,0.00,'','2012-08-30 14:17:34',NULL,4152.11,'Y','Y'),(14,NULL,14,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(16,NULL,16,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','N'),(17,NULL,17,'PURCH',NULL,0.0,0.00,'','2012-08-31 12:55:45',NULL,7339.32,'Y','Y'),(22,NULL,22,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','Y'),(23,NULL,23,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(25,NULL,25,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(26,NULL,26,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(27,NULL,27,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(28,NULL,28,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','N'),(29,NULL,29,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(30,NULL,30,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(31,NULL,31,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(32,NULL,32,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(33,NULL,33,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:57',NULL,0.00,'Y','Y'),(34,NULL,34,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(35,NULL,35,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(36,NULL,36,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(37,NULL,37,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(38,NULL,38,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(39,NULL,39,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(40,NULL,40,'PURCH',NULL,0.0,0.00,'','2012-09-27 12:13:53',NULL,780.01,'Y','Y'),(41,NULL,41,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(42,NULL,42,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(43,NULL,43,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(44,NULL,44,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(45,NULL,45,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(47,NULL,47,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','Y'),(48,NULL,48,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(49,NULL,49,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(50,NULL,50,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(51,NULL,51,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(52,NULL,52,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(53,NULL,53,'PURCH',NULL,0.0,0.00,'','2012-10-04 04:02:22',NULL,29278.51,'Y','Y'),(54,NULL,54,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(55,NULL,55,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(56,NULL,56,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(57,NULL,57,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(58,NULL,58,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(59,NULL,59,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(60,NULL,60,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(61,NULL,61,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(62,NULL,62,'PURCH',NULL,0.0,0.00,'','2012-08-30 14:24:16',NULL,10076.83,'Y','Y'),(63,NULL,63,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(64,NULL,64,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(65,NULL,65,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(66,NULL,66,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(68,NULL,68,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(69,NULL,69,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(70,NULL,70,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(71,NULL,71,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(72,NULL,72,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(73,NULL,73,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(74,NULL,74,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(75,NULL,75,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(76,NULL,76,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(77,NULL,77,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(78,NULL,78,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(79,NULL,79,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(80,NULL,80,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(81,NULL,81,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(82,NULL,82,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(83,NULL,83,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(84,NULL,84,'PURCH',NULL,0.0,0.00,'','2012-09-11 14:28:21',NULL,15167.42,'Y','Y'),(85,NULL,85,'PURCH',NULL,0.0,0.00,'','2012-10-02 12:17:42',NULL,1605.58,'Y','Y'),(86,NULL,86,'PURCH',NULL,0.0,0.00,'','2012-10-05 07:06:06',NULL,5824.37,'Y','Y'),(87,NULL,87,'PURCH',NULL,0.0,0.00,'','2012-09-27 10:09:44',NULL,31267.50,'Y','Y'),(88,NULL,88,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(89,NULL,89,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(90,NULL,90,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(91,NULL,91,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(92,NULL,92,'PURCH',NULL,0.0,0.00,'','2012-09-27 10:40:21',NULL,128781.78,'Y','Y'),(93,NULL,93,'PURCH',NULL,0.0,0.00,'','2012-08-29 14:55:52',NULL,5147.10,'Y','Y'),(94,NULL,94,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(95,NULL,95,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(96,NULL,96,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','Y'),(97,NULL,97,'PURCH',NULL,0.0,0.00,'','2011-10-21 15:33:33',NULL,0.00,'Y','Y'),(98,NULL,98,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','Y'),(99,NULL,99,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','Y'),(100,NULL,100,'PURCH',NULL,0.0,0.00,'','2012-05-17 11:25:18',NULL,0.00,'Y','Y'),(102,NULL,102,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:57',NULL,0.00,'Y','Y'),(103,NULL,103,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(104,NULL,104,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(105,NULL,105,'PURCH',NULL,0.0,0.00,'','2012-10-05 10:46:17',NULL,313895.76,'Y','Y'),(106,NULL,106,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(107,NULL,107,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(108,NULL,108,'PURCH',NULL,0.0,0.00,'','2011-06-13 08:37:50',NULL,0.00,'Y','Y'),(109,NULL,109,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(110,NULL,110,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(111,NULL,111,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(112,NULL,112,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','Y'),(113,NULL,113,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(114,NULL,114,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(116,NULL,116,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(117,NULL,117,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(118,NULL,118,'PURCH',NULL,0.0,0.00,'','2012-08-31 10:39:20',NULL,1077.00,'Y','Y'),(120,NULL,120,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(121,NULL,121,'PURCH',NULL,0.0,0.00,'','2011-06-13 08:37:50',NULL,0.00,'Y','Y'),(123,NULL,123,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(124,NULL,124,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(125,NULL,125,'PURCH',NULL,0.0,0.00,'','2012-08-31 12:52:52',NULL,13380.00,'Y','Y'),(126,NULL,126,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:50',NULL,0.00,'Y','Y'),(127,NULL,127,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(148,NULL,148,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(161,NULL,161,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(166,NULL,166,'PURCH',NULL,0.0,0.00,'','2012-10-05 09:16:22',NULL,142978.84,'Y','Y'),(186,NULL,186,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(192,NULL,192,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(240,NULL,240,'PURCH',NULL,0.0,0.00,'','2012-08-24 14:17:59',NULL,138.07,'Y','Y'),(241,NULL,241,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(242,NULL,242,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(243,NULL,243,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(244,NULL,244,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:57',NULL,0.00,'Y','Y'),(245,NULL,245,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(246,NULL,246,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(247,NULL,247,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(248,NULL,248,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(249,NULL,249,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(250,NULL,250,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:57',NULL,0.00,'Y','Y'),(251,NULL,251,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(252,NULL,252,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(253,NULL,253,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(254,NULL,254,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(255,NULL,255,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(256,NULL,256,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(257,NULL,257,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(258,NULL,258,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:57',NULL,0.00,'Y','Y'),(259,NULL,259,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(260,NULL,260,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(261,NULL,261,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:57',NULL,0.00,'Y','Y'),(262,NULL,262,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(263,NULL,263,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(264,NULL,264,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(265,NULL,265,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(266,NULL,266,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(267,NULL,267,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(268,NULL,268,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(269,NULL,269,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(270,NULL,270,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(271,NULL,271,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(272,NULL,272,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(273,NULL,273,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(275,NULL,275,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(276,NULL,276,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(277,NULL,277,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(278,NULL,278,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(279,NULL,279,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(280,NULL,280,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(281,NULL,281,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(282,NULL,282,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(283,NULL,283,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(284,NULL,284,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(285,NULL,285,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(286,NULL,286,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(287,NULL,287,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(288,NULL,288,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(289,NULL,289,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(290,NULL,290,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(291,NULL,291,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(292,NULL,292,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(293,NULL,293,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(294,NULL,294,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(295,NULL,295,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(296,NULL,296,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(297,NULL,297,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(298,NULL,298,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(299,NULL,299,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(300,NULL,300,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(301,NULL,301,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(302,NULL,302,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(303,NULL,303,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(304,NULL,304,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(305,NULL,305,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(306,NULL,306,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(307,NULL,307,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(308,NULL,308,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(309,NULL,309,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(310,NULL,310,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(311,NULL,311,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(312,NULL,312,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(313,NULL,313,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(314,NULL,314,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(315,NULL,315,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(316,NULL,316,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(317,NULL,317,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(318,NULL,318,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:56',NULL,0.00,'Y','Y'),(319,NULL,319,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(320,NULL,320,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(321,NULL,321,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(322,NULL,322,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(323,NULL,323,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(324,NULL,324,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(325,NULL,325,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(326,NULL,326,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(327,NULL,327,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(328,NULL,328,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(329,NULL,329,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(330,NULL,330,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(331,NULL,331,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(332,NULL,332,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(333,NULL,333,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(334,NULL,334,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(335,NULL,335,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(336,NULL,336,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(337,NULL,337,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(338,NULL,338,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(339,NULL,339,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(340,NULL,340,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(341,NULL,341,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(342,NULL,342,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(343,NULL,343,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(344,NULL,344,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(345,NULL,345,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(346,NULL,346,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(347,NULL,347,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(348,NULL,348,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(349,NULL,349,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(350,NULL,350,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(351,NULL,351,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(352,NULL,352,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(353,NULL,353,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(354,NULL,354,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(355,NULL,355,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(356,NULL,356,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(357,NULL,357,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(358,NULL,358,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(359,NULL,359,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(360,NULL,360,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(361,NULL,361,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(362,NULL,362,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(363,NULL,363,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(364,NULL,364,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(365,NULL,365,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(366,NULL,366,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(367,NULL,367,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(368,NULL,368,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(369,NULL,369,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(370,NULL,370,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(371,NULL,371,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(372,NULL,372,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(373,NULL,373,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(374,NULL,374,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(375,NULL,375,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(376,NULL,376,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(378,NULL,378,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(379,NULL,379,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(380,NULL,380,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(381,NULL,381,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(382,NULL,382,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(383,NULL,383,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(384,NULL,384,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(385,NULL,385,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(386,NULL,386,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(387,NULL,387,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(388,NULL,388,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(389,NULL,389,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(390,NULL,390,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(391,NULL,391,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(392,NULL,392,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(393,NULL,393,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(394,NULL,394,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(395,NULL,395,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(396,NULL,396,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(397,NULL,397,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(398,NULL,398,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(399,NULL,399,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(400,NULL,400,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(401,NULL,401,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(402,NULL,402,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(403,NULL,403,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(404,NULL,404,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(405,NULL,405,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(406,NULL,406,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(407,NULL,407,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(408,NULL,408,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(409,NULL,409,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(410,NULL,410,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(411,NULL,411,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(412,NULL,412,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(413,NULL,413,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(414,NULL,414,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(415,NULL,415,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(416,NULL,416,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(417,NULL,417,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(418,NULL,418,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(419,NULL,419,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(420,NULL,420,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(421,NULL,421,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(422,NULL,422,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(423,NULL,423,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(424,NULL,424,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(425,NULL,425,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(426,NULL,426,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(427,NULL,427,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(428,NULL,428,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(429,NULL,429,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(430,NULL,430,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(431,NULL,431,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(432,NULL,432,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(439,NULL,439,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(459,NULL,459,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(500,NULL,500,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(501,NULL,501,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(556,NULL,556,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(607,NULL,607,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(608,NULL,608,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(609,NULL,609,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(610,NULL,610,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(611,NULL,611,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:58',NULL,0.00,'Y','Y'),(612,NULL,612,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(613,NULL,613,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(614,NULL,614,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(615,NULL,615,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(616,NULL,616,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(617,NULL,617,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(618,NULL,618,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(619,NULL,619,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(620,NULL,620,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(621,NULL,621,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(622,NULL,622,'PURCH',NULL,0.0,0.00,'','2011-11-12 07:52:26',NULL,0.00,'Y','Y'),(623,NULL,623,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(624,NULL,624,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(625,NULL,625,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(626,NULL,626,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(627,NULL,627,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(628,NULL,628,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(629,NULL,629,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(630,NULL,630,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(631,NULL,631,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(632,NULL,632,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(633,NULL,633,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(634,NULL,634,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(635,NULL,635,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(636,NULL,636,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(637,NULL,637,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(638,NULL,638,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(639,NULL,639,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(640,NULL,640,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(641,NULL,641,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(642,NULL,642,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(643,NULL,643,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(644,NULL,644,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(645,NULL,645,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(646,NULL,646,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(647,NULL,647,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(648,NULL,648,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(649,NULL,649,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(650,NULL,650,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(651,NULL,651,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(652,NULL,652,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(653,NULL,653,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(654,NULL,654,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(655,NULL,655,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(656,NULL,656,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(657,NULL,657,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(658,NULL,658,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(659,NULL,659,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(660,NULL,660,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(661,NULL,661,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(662,NULL,662,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(663,NULL,663,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(664,NULL,664,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(665,NULL,665,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(666,NULL,666,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(667,NULL,667,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(668,NULL,668,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(669,NULL,669,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(670,NULL,670,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(671,NULL,671,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(672,NULL,672,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(673,NULL,673,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(674,NULL,674,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(675,NULL,675,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(676,NULL,676,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(677,NULL,677,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(678,NULL,678,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(679,NULL,679,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(680,NULL,680,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(681,NULL,681,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(682,NULL,682,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(683,NULL,683,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(684,NULL,684,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(685,NULL,685,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(686,NULL,686,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(687,NULL,687,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(688,NULL,688,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(689,NULL,689,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(690,NULL,690,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(700,NULL,700,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(701,NULL,701,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(702,NULL,702,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(703,NULL,703,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(704,NULL,704,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(705,NULL,705,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(706,NULL,706,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(720,NULL,720,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(800,NULL,800,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(801,NULL,801,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(802,NULL,802,'PURCH',NULL,0.0,0.00,'','2012-10-03 05:10:25',NULL,1115.95,'Y','Y'),(803,NULL,803,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(900,NULL,900,'PURCH',NULL,0.0,0.00,'','2012-10-03 14:54:50',NULL,2189.94,'Y','Y'),(902,NULL,902,'PURCH',NULL,0.0,0.00,'','2012-09-28 15:10:40',NULL,11366.26,'Y','Y'),(1501,NULL,1501,'PURCH',NULL,0.0,0.00,'','2012-10-06 07:44:28',NULL,200506.16,'Y','Y'),(1502,NULL,1502,'PURCH',NULL,0.0,0.00,'','2012-10-02 07:40:18',NULL,6306.48,'Y','Y'),(1503,NULL,1503,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(1504,NULL,1504,'PURCH',NULL,0.0,0.00,'','2012-08-22 17:55:51',NULL,0.00,'Y','Y'),(1505,NULL,1505,'PURCH',NULL,0.0,0.00,'','2012-06-19 10:15:57',NULL,0.00,'Y','Y'),(1506,NULL,1506,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(1507,NULL,1507,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:58',NULL,0.00,'Y','Y'),(1508,NULL,1508,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:58',NULL,0.00,'Y','Y'),(1509,NULL,1509,'PURCH',NULL,0.0,0.00,'','2012-07-03 10:50:06',NULL,0.00,'Y','Y'),(1510,NULL,1510,'PURCH',NULL,0.0,0.00,'','2011-06-13 08:37:51',NULL,0.00,'Y','Y'),(1511,NULL,1511,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(1512,NULL,1512,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(1513,NULL,1513,'PURCH',NULL,0.0,0.00,'','2011-06-01 06:55:57',NULL,0.00,'Y','Y'),(1514,NULL,1514,'PURCH',NULL,0.0,0.00,'','2012-05-17 11:28:03',NULL,0.00,'Y','Y'),(1515,NULL,1515,'PURCH',NULL,0.0,0.00,'','2012-06-27 05:42:54',NULL,0.00,'Y','Y'),(10000,NULL,35,'PURCH',NULL,0.0,7.00,'','2011-05-23 12:30:40',NULL,231015.99,'Y','Y'),(10001,NULL,36,'PURCH',NULL,0.0,0.00,'','2011-05-25 06:59:23',NULL,8390.55,'Y','Y'),(10002,NULL,37,'PURCH',NULL,0.0,10.00,'','2011-05-23 12:30:40',NULL,12137.00,'N','Y'),(10003,NULL,0,'SALES',NULL,0.0,1000.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10004,NULL,38,'SALES',NULL,0.0,80000.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10005,NULL,38,'SALES',NULL,0.0,12.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10006,NULL,38,'SALES',NULL,0.0,1234.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10007,NULL,38,'SALES',NULL,0.0,8.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10008,NULL,38,'SALES',NULL,0.0,1.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10009,NULL,38,'SALES',NULL,0.0,788.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10010,NULL,38,'SALES',NULL,0.0,1000000.00,'','2011-05-11 11:25:59',NULL,0.00,'Y','Y'),(10011,NULL,39,'PURCH',NULL,0.0,0.00,'','2011-05-24 13:42:48',NULL,2581.10,'Y','Y'),(10013,NULL,1516,'PURCH',NULL,0.0,0.00,'','2011-09-16 08:17:58',NULL,0.00,'Y','Y'),(10014,NULL,1517,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10015,NULL,1518,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10016,NULL,1518,'SALES',NULL,0.0,0.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10017,NULL,1519,'SALES',NULL,0.0,3000.00,'','2012-09-10 04:35:31',NULL,0.00,'N','Y'),(10018,NULL,1520,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10019,NULL,1520,'SALES',NULL,0.0,0.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10020,NULL,1521,'SALES',NULL,0.0,1000.00,'','2012-07-09 15:17:06',NULL,0.00,'N','Y'),(10021,NULL,1521,'SALES',NULL,0.0,0.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10022,NULL,1522,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10023,NULL,1522,'SALES',NULL,0.0,50000.00,'','2012-06-29 12:58:12',NULL,0.00,'N','Y'),(10024,NULL,1523,'SALES',NULL,0.0,1000.00,'','2012-07-09 08:02:11',NULL,0.00,'N','Y'),(10025,NULL,1523,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10026,NULL,1524,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10027,NULL,1524,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10028,NULL,1518,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10029,NULL,1520,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10030,NULL,1517,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10031,NULL,1525,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10032,NULL,1525,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10033,NULL,1526,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10034,NULL,1526,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10035,NULL,1527,'SALES',NULL,0.0,1000.00,'','2012-07-09 08:02:11',NULL,0.00,'N','Y'),(10036,NULL,1527,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10038,NULL,1528,'SALES',NULL,0.0,50000.00,'','2012-07-24 12:22:55',NULL,0.00,'N','Y'),(10039,NULL,1529,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10040,NULL,1529,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10041,NULL,1530,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10042,NULL,1530,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10043,NULL,1530,'SALES',NULL,0.0,50000.00,'','2012-08-22 17:56:31',NULL,80.25,'N','Y'),(10044,NULL,1531,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','Y'),(10045,NULL,1531,'SALES',NULL,0.0,600000.00,'','2012-08-22 17:55:51',NULL,0.00,'N','N'),(10046,NULL,1532,'SALES',NULL,0.0,1000.00,'','2012-08-22 17:55:51',NULL,0.00,'Y','Y');
/*!40000 ALTER TABLE `EntityAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntityAccountConfiguration`
--

DROP TABLE IF EXISTS `EntityAccountConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityAccountConfiguration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Form` varchar(20) NOT NULL DEFAULT '',
  `Type` enum('Debtor','Creditor') DEFAULT NULL,
  `EntityAccountTemplateID` varchar(10) DEFAULT NULL,
  `Selectable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `EntityAccountTemplateID` (`EntityAccountTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntityAccountConfiguration`
--

LOCK TABLES `EntityAccountConfiguration` WRITE;
/*!40000 ALTER TABLE `EntityAccountConfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `EntityAccountConfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntityAccountTemplate`
--

DROP TABLE IF EXISTS `EntityAccountTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityAccountTemplate` (
  `ID` varchar(6) NOT NULL DEFAULT '',
  `Type` enum('Debtor','Creditor') NOT NULL DEFAULT 'Debtor',
  `Name` varchar(30) NOT NULL DEFAULT '',
  `TermsID` int(11) DEFAULT NULL,
  `DiscountPercentage` decimal(4,1) NOT NULL DEFAULT '0.0',
  `LimitAmount` decimal(9,2) DEFAULT NULL,
  `AccountID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `TermsID` (`TermsID`),
  KEY `AccountID` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntityAccountTemplate`
--

LOCK TABLES `EntityAccountTemplate` WRITE;
/*!40000 ALTER TABLE `EntityAccountTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `EntityAccountTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntityAccountTransaction`
--

DROP TABLE IF EXISTS `EntityAccountTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityAccountTransaction` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `EntityAccountID` int(11) unsigned NOT NULL DEFAULT '0',
  `TransactionID` int(11) NOT NULL DEFAULT '0',
  `Amount` decimal(9,2) NOT NULL DEFAULT '0.00',
  `StatementID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` int(11) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `EntityAccountID` (`EntityAccountID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `StatementID` (`StatementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntityAccountTransaction`
--

LOCK TABLES `EntityAccountTransaction` WRITE;
/*!40000 ALTER TABLE `EntityAccountTransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `EntityAccountTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EntityCategory`
--

DROP TABLE IF EXISTS `EntityCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityCategory` (
  `SourceID` varchar(10) DEFAULT NULL,
  `ID` varchar(6) NOT NULL DEFAULT '',
  `Name` varchar(30) NOT NULL DEFAULT '',
  `TermsID` int(11) DEFAULT NULL,
  `DiscountPercentage` decimal(4,1) NOT NULL DEFAULT '0.0',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `TermsID` (`TermsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EntityCategory`
--

LOCK TABLES `EntityCategory` WRITE;
/*!40000 ALTER TABLE `EntityCategory` DISABLE KEYS */;
INSERT INTO `EntityCategory` VALUES ('BIO','1','Supplier',0,0.0,'2005-10-13 11:12:31',NULL);
/*!40000 ALTER TABLE `EntityCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Export`
--

DROP TABLE IF EXISTS `Export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Export` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Common_AuthUserID` int(11) NOT NULL DEFAULT '0',
  `Program` enum('AccPac','Pastel') NOT NULL DEFAULT 'AccPac',
  `Type` enum('Accounts','Transactions') NOT NULL DEFAULT 'Transactions',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `Common_AuthUserID` (`Common_AuthUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Export`
--

LOCK TABLES `Export` WRITE;
/*!40000 ALTER TABLE `Export` DISABLE KEYS */;
/*!40000 ALTER TABLE `Export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExtraBarcodes`
--

DROP TABLE IF EXISTS `ExtraBarcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExtraBarcodes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockUnitID` int(11) NOT NULL,
  `Barcode` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExtraBarcodes`
--

LOCK TABLES `ExtraBarcodes` WRITE;
/*!40000 ALTER TABLE `ExtraBarcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExtraBarcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Formulas`
--

DROP TABLE IF EXISTS `Formulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Formulas` (
  `BarFormula` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formulas`
--

LOCK TABLES `Formulas` WRITE;
/*!40000 ALTER TABLE `Formulas` DISABLE KEYS */;
INSERT INTO `Formulas` VALUES ('20CCCCIPPPPPID2P');
/*!40000 ALTER TABLE `Formulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Function`
--

DROP TABLE IF EXISTS `Function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Function` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TillID` int(11) NOT NULL DEFAULT '0',
  `Function` enum('Y','N') NOT NULL DEFAULT 'N',
  `FunctionMarkup` decimal(5,2) DEFAULT '0.00',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `TillID` (`TillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Function`
--

LOCK TABLES `Function` WRITE;
/*!40000 ALTER TABLE `Function` DISABLE KEYS */;
/*!40000 ALTER TABLE `Function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseOrderID` int(11) NOT NULL DEFAULT '0',
  `InvoiceDate` datetime NOT NULL,
  `RefNo` varchar(20) NOT NULL DEFAULT '',
  `OwnRefNo` varchar(255) NOT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `PaymentMethodID` varchar(2) NOT NULL,
  `Excluding` double(11,5) NOT NULL,
  `Vat` double(11,5) NOT NULL,
  `Discount` double(11,5) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `PurchaseOrderID` (`PurchaseOrderID`),
  KEY `ReversalID` (`OwnRefNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceLineItem`
--

DROP TABLE IF EXISTS `InvoiceLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) NOT NULL DEFAULT '0',
  `PurchaseOrderLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Received` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `Returned` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `Discount` decimal(14,5) DEFAULT NULL,
  `UnitPriceExcl` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `SourceID` varchar(10) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `PrevSOH_Cost` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `VatUsed` tinyint(1) NOT NULL DEFAULT '1',
  `UnitPriceIncl` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `StockMetricUnitID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `StockUnitID` (`StockUnitID`),
  KEY `PurchaseOrderLineItemID` (`PurchaseOrderLineItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceLineItem`
--

LOCK TABLES `InvoiceLineItem` WRITE;
/*!40000 ALTER TABLE `InvoiceLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceReturn`
--

DROP TABLE IF EXISTS `InvoiceReturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceReturn` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) DEFAULT NULL,
  `EntityAccountID` int(11) unsigned NOT NULL DEFAULT '0',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `EntityAccountID` (`EntityAccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceReturn`
--

LOCK TABLES `InvoiceReturn` WRITE;
/*!40000 ALTER TABLE `InvoiceReturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceReturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceReturnLineItem`
--

DROP TABLE IF EXISTS `InvoiceReturnLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceReturnLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceReturnID` int(11) NOT NULL DEFAULT '0',
  `InvoiceLineItemID` int(11) DEFAULT NULL,
  `Returned` decimal(9,3) NOT NULL DEFAULT '0.000',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `InvoiceReturnID` (`InvoiceReturnID`),
  KEY `InvoiceLineItemID` (`InvoiceLineItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceReturnLineItem`
--

LOCK TABLES `InvoiceReturnLineItem` WRITE;
/*!40000 ALTER TABLE `InvoiceReturnLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceReturnLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ItemsBeforeFromDate`
--

DROP TABLE IF EXISTS `ItemsBeforeFromDate`;
/*!50001 DROP VIEW IF EXISTS `ItemsBeforeFromDate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ItemsBeforeFromDate` (
  `ID` tinyint NOT NULL,
  `IFNULL(InvoiceLineItem.PrevSOH_Cost, 0)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Active` int(11) DEFAULT '1',
  `Created` datetime NOT NULL,
  `Modified` datetime NOT NULL,
  `SourceID` varchar(10) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Stores our Stock Locations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (0,'Warehouse',1,'2010-11-15 16:08:15','2011-01-10 15:48:49','MPL_1',13),(1,'Shop',1,'2010-11-15 16:08:15','2011-01-10 15:51:46','MPL_1',13),(2,'Take Away',1,'2010-11-19 10:15:30','2011-01-19 16:38:31','MPL_1',13),(9,'Johan',0,'2011-01-11 09:41:52','2011-01-11 09:42:07','MPL_1',13);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meal`
--

DROP TABLE IF EXISTS `Meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Meal` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AuthUserID` int(11) NOT NULL DEFAULT '0',
  `WardID` int(11) unsigned NOT NULL DEFAULT '0',
  `BedID` int(11) unsigned NOT NULL DEFAULT '0',
  `MealDayID` int(11) unsigned NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `State` enum('open','closed') NOT NULL DEFAULT 'open',
  `MealDayDateID` int(10) NOT NULL DEFAULT '0',
  `MealTimeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meal`
--

LOCK TABLES `Meal` WRITE;
/*!40000 ALTER TABLE `Meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealCategory`
--

DROP TABLE IF EXISTS `MealCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealCategory` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealCategory`
--

LOCK TABLES `MealCategory` WRITE;
/*!40000 ALTER TABLE `MealCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealDay`
--

DROP TABLE IF EXISTS `MealDay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealDay` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MealCategoryID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Enabled` tinyint(1) NOT NULL DEFAULT '1',
  `BreakStarter2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `BreakMain2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `BreakDesert2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `LunchStarter2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `LunchMain2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `LunchDesert2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `DinnerStarter2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `DinnerMain2Visible` tinyint(1) NOT NULL DEFAULT '0',
  `DInnerDesert2Visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealDay`
--

LOCK TABLES `MealDay` WRITE;
/*!40000 ALTER TABLE `MealDay` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealDay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealDayDate`
--

DROP TABLE IF EXISTS `MealDayDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealDayDate` (
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Day` varchar(20) NOT NULL DEFAULT '',
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealDayDate`
--

LOCK TABLES `MealDayDate` WRITE;
/*!40000 ALTER TABLE `MealDayDate` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealDayDate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealItem`
--

DROP TABLE IF EXISTS `MealItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealItem` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MealTypeID` int(11) NOT NULL DEFAULT '0',
  `MealTimeID` int(11) NOT NULL DEFAULT '0',
  `MealDayID` int(11) NOT NULL DEFAULT '0',
  `StockID` int(11) NOT NULL DEFAULT '0',
  `MainNote` varchar(254) NOT NULL DEFAULT '',
  `Flag` enum('Normal','MainMeal') NOT NULL DEFAULT 'Normal',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealItem`
--

LOCK TABLES `MealItem` WRITE;
/*!40000 ALTER TABLE `MealItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealLineItem`
--

DROP TABLE IF EXISTS `MealLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealLineItem` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MealID` int(11) unsigned NOT NULL DEFAULT '0',
  `MealItemID` int(11) unsigned NOT NULL DEFAULT '0',
  `StockID` int(11) unsigned NOT NULL DEFAULT '0',
  `Quantity` float NOT NULL DEFAULT '0',
  `Note` varchar(254) NOT NULL DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Size` enum('SMALL','MED','LARGE') NOT NULL DEFAULT 'SMALL',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealLineItem`
--

LOCK TABLES `MealLineItem` WRITE;
/*!40000 ALTER TABLE `MealLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealTime`
--

DROP TABLE IF EXISTS `MealTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealTime` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealTime`
--

LOCK TABLES `MealTime` WRITE;
/*!40000 ALTER TABLE `MealTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealType`
--

DROP TABLE IF EXISTS `MealType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealType` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealType`
--

LOCK TABLES `MealType` WRITE;
/*!40000 ALTER TABLE `MealType` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `MenuBarModifierInfo`
--

DROP TABLE IF EXISTS `MenuBarModifierInfo`;
/*!50001 DROP VIEW IF EXISTS `MenuBarModifierInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MenuBarModifierInfo` (
  `CatName` tinyint NOT NULL,
  `ExpandCat` tinyint NOT NULL,
  `StockID` tinyint NOT NULL,
  `StockUnitID` tinyint NOT NULL,
  `ExtraOrModifier` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `MenuFoodModifierInfo`
--

DROP TABLE IF EXISTS `MenuFoodModifierInfo`;
/*!50001 DROP VIEW IF EXISTS `MenuFoodModifierInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MenuFoodModifierInfo` (
  `CatName` tinyint NOT NULL,
  `ExpandCat` tinyint NOT NULL,
  `StockID` tinyint NOT NULL,
  `StockUnitID` tinyint NOT NULL,
  `ExtraOrModifier` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `MenuInfo`
--

DROP TABLE IF EXISTS `MenuInfo`;
/*!50001 DROP VIEW IF EXISTS `MenuInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MenuInfo` (
  `MainCatName` tinyint NOT NULL,
  `CatType` tinyint NOT NULL,
  `CatName` tinyint NOT NULL,
  `ExpandCat` tinyint NOT NULL,
  `StockID` tinyint NOT NULL,
  `StockUnitID` tinyint NOT NULL,
  `ExtraOrModifier` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ModifierInfo`
--

DROP TABLE IF EXISTS `ModifierInfo`;
/*!50001 DROP VIEW IF EXISTS `ModifierInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ModifierInfo` (
  `ID` tinyint NOT NULL,
  `ModID` tinyint NOT NULL,
  `Modifier` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `OptionName` tinyint NOT NULL,
  `OptionItemID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `MovedMeals`
--

DROP TABLE IF EXISTS `MovedMeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MovedMeals` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(100) NOT NULL DEFAULT '',
  `FromBedID` int(11) NOT NULL DEFAULT '0',
  `ToBedID` int(11) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MealID` tinyint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovedMeals`
--

LOCK TABLES `MovedMeals` WRITE;
/*!40000 ALTER TABLE `MovedMeals` DISABLE KEYS */;
/*!40000 ALTER TABLE `MovedMeals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `OpenFoodItems`
--

DROP TABLE IF EXISTS `OpenFoodItems`;
/*!50001 DROP VIEW IF EXISTS `OpenFoodItems`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `OpenFoodItems` (
  `ID` tinyint NOT NULL,
  `0.00` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `OpenSale`
--

DROP TABLE IF EXISTS `OpenSale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSale` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TableNo` varchar(20) DEFAULT NULL,
  `State` enum('open','closed') NOT NULL DEFAULT 'open',
  `WaiterID` int(11) NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OrderID` text,
  `SaleID` int(11) NOT NULL DEFAULT '0',
  `PrintBillCount` int(11) NOT NULL DEFAULT '0',
  `TableCount` int(11) NOT NULL DEFAULT '0',
  `DiscountAmount` decimal(11,5) DEFAULT NULL,
  `DiscReason` varchar(30) CHARACTER SET cp850 COLLATE cp850_bin DEFAULT NULL,
  `EntityID` int(11) NOT NULL DEFAULT '-1',
  `AuthUserID_Discount` int(11) NOT NULL DEFAULT '0',
  `AuthUserID_Returns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `OpenSaleID` (`ID`),
  KEY `State` (`State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSale`
--

LOCK TABLES `OpenSale` WRITE;
/*!40000 ALTER TABLE `OpenSale` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenSaleGroupingLineItem`
--

DROP TABLE IF EXISTS `OpenSaleGroupingLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSaleGroupingLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockModifierLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockModifierPriority` int(11) NOT NULL DEFAULT '0',
  `ExtraStockUnitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSaleGroupingLineItem`
--

LOCK TABLES `OpenSaleGroupingLineItem` WRITE;
/*!40000 ALTER TABLE `OpenSaleGroupingLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSaleGroupingLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenSaleGroupingLineItemSave`
--

DROP TABLE IF EXISTS `OpenSaleGroupingLineItemSave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSaleGroupingLineItemSave` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockModifierLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockModifierPriority` int(11) NOT NULL DEFAULT '0',
  `ExtraStockUnitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSaleGroupingLineItemSave`
--

LOCK TABLES `OpenSaleGroupingLineItemSave` WRITE;
/*!40000 ALTER TABLE `OpenSaleGroupingLineItemSave` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSaleGroupingLineItemSave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenSaleHiddenLineItem`
--

DROP TABLE IF EXISTS `OpenSaleHiddenLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSaleHiddenLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Price` decimal(7,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSaleHiddenLineItem`
--

LOCK TABLES `OpenSaleHiddenLineItem` WRITE;
/*!40000 ALTER TABLE `OpenSaleHiddenLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSaleHiddenLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `OpenSaleInfo`
--

DROP TABLE IF EXISTS `OpenSaleInfo`;
/*!50001 DROP VIEW IF EXISTS `OpenSaleInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `OpenSaleInfo` (
  `OpenSaleID` tinyint NOT NULL,
  `TableName` tinyint NOT NULL,
  `TableExtension` tinyint NOT NULL,
  `WaiterID` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `Covers` tinyint NOT NULL,
  `PaymentMethod` tinyint NOT NULL,
  `TotalExc` tinyint NOT NULL,
  `TotalVat` tinyint NOT NULL,
  `Tip` tinyint NOT NULL,
  `TransactionID` tinyint NOT NULL,
  `Discount` tinyint NOT NULL,
  `DiscountReason` tinyint NOT NULL,
  `PrintBillCount` tinyint NOT NULL,
  `AccountID` tinyint NOT NULL,
  `Paid` tinyint NOT NULL,
  `AuthUserID_Discount` tinyint NOT NULL,
  `AuthUserID_Returns` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `OpenSaleItems`
--

DROP TABLE IF EXISTS `OpenSaleItems`;
/*!50001 DROP VIEW IF EXISTS `OpenSaleItems`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `OpenSaleItems` (
  `BarCode` tinyint NOT NULL,
  `Deposit` tinyint NOT NULL,
  `Category` tinyint NOT NULL,
  `CategoryType` tinyint NOT NULL,
  `Cost` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `IsExtra` tinyint NOT NULL,
  `IsFindable` tinyint NOT NULL,
  `IsSellable` tinyint NOT NULL,
  `Location` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `OpenSaleID` tinyint NOT NULL,
  `OpenSaleLineItemID` tinyint NOT NULL,
  `DiscountAmount` tinyint NOT NULL,
  `DiscountPercentage` tinyint NOT NULL,
  `OrderedTime` tinyint NOT NULL,
  `Price` tinyint NOT NULL,
  `CustomPrice` tinyint NOT NULL,
  `Weight` tinyint NOT NULL,
  `PrintLocation` tinyint NOT NULL,
  `ProductProcessType` tinyint NOT NULL,
  `Quantity` tinyint NOT NULL,
  `SOHQuantity` tinyint NOT NULL,
  `StockID` tinyint NOT NULL,
  `StockUnitID` tinyint NOT NULL,
  `SubLocation` tinyint NOT NULL,
  `SaleLocation` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `UnitType` tinyint NOT NULL,
  `VatPercentage` tinyint NOT NULL,
  `VatDescription` tinyint NOT NULL,
  `InitialPrice` tinyint NOT NULL,
  `AuthUserID_Discount` tinyint NOT NULL,
  `AuthUserID_PriceOverride` tinyint NOT NULL,
  `AuthUserID_Return` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `OpenSaleLineItem`
--

DROP TABLE IF EXISTS `OpenSaleLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSaleLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleID` int(10) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `UnitPrice` decimal(11,2) NOT NULL DEFAULT '0.00',
  `DiscountPercentage` decimal(4,2) DEFAULT NULL,
  `Quantity` decimal(9,5) DEFAULT NULL,
  `Note` varchar(40) DEFAULT NULL,
  `TableCount` int(3) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Saved` tinyint(1) NOT NULL DEFAULT '0',
  `StockModifierLineItemIDs` text,
  `Weight` double(15,5) NOT NULL DEFAULT '1.00000',
  `CustomPrice` tinyint(1) NOT NULL DEFAULT '0',
  `DiscountAmount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `SerialNumber` varchar(40) NOT NULL DEFAULT '',
  `InitialPrice` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `AuthUserID_Discount` int(11) NOT NULL DEFAULT '0',
  `AuthUserID_PriceOverride` int(11) NOT NULL DEFAULT '0',
  `AuthUserID_Return` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `OSID` (`OpenSaleID`),
  KEY `StockUnitID` (`StockUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSaleLineItem`
--

LOCK TABLES `OpenSaleLineItem` WRITE;
/*!40000 ALTER TABLE `OpenSaleLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSaleLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenSaleLineItemSave`
--

DROP TABLE IF EXISTS `OpenSaleLineItemSave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSaleLineItemSave` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleID` int(10) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `UnitPrice` decimal(11,2) NOT NULL DEFAULT '0.00',
  `DiscountPercentage` decimal(4,1) DEFAULT NULL,
  `Quantity` decimal(9,3) DEFAULT NULL,
  `Note` varchar(40) DEFAULT NULL,
  `TableCount` int(3) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Saved` tinyint(1) NOT NULL DEFAULT '0',
  `StockModifierLineItemIDs` text,
  PRIMARY KEY (`ID`),
  KEY `OSID` (`OpenSaleID`),
  KEY `StockUnitID` (`StockUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSaleLineItemSave`
--

LOCK TABLES `OpenSaleLineItemSave` WRITE;
/*!40000 ALTER TABLE `OpenSaleLineItemSave` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSaleLineItemSave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenSaleLog`
--

DROP TABLE IF EXISTS `OpenSaleLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSaleLog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OSID1` int(11) NOT NULL DEFAULT '0',
  `OSLIID` int(11) NOT NULL DEFAULT '0',
  `Type` enum('ChangeTable','ModifyItem','Delete','Void','MoveItem') NOT NULL DEFAULT 'ChangeTable',
  `WaiterID` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Note` varchar(255) DEFAULT NULL,
  `OSID2` int(11) NOT NULL DEFAULT '0',
  `StockUnitID1` int(11) DEFAULT NULL,
  `StockUnitID2` int(11) DEFAULT NULL,
  `qty1` decimal(9,3) DEFAULT NULL,
  `qty2` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSaleLog`
--

LOCK TABLES `OpenSaleLog` WRITE;
/*!40000 ALTER TABLE `OpenSaleLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSaleLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenSaleOrderItems`
--

DROP TABLE IF EXISTS `OpenSaleOrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenSaleOrderItems` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenSaleOrderItems`
--

LOCK TABLES `OpenSaleOrderItems` WRITE;
/*!40000 ALTER TABLE `OpenSaleOrderItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenSaleOrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutstandingMealBeds`
--

DROP TABLE IF EXISTS `OutstandingMealBeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OutstandingMealBeds` (
  `Name` varchar(255) NOT NULL DEFAULT '',
  `BedID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutstandingMealBeds`
--

LOCK TABLES `OutstandingMealBeds` WRITE;
/*!40000 ALTER TABLE `OutstandingMealBeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `OutstandingMealBeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients`
--

DROP TABLE IF EXISTS `Patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients` (
  `BookingID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `MealCategoryID` int(11) NOT NULL DEFAULT '0',
  `Doctor` varchar(100) NOT NULL DEFAULT '',
  `Description` varchar(100) NOT NULL DEFAULT '',
  `BedID` int(11) NOT NULL DEFAULT '0',
  `Discharged` tinyint(1) NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MealCategoryID2` int(11) NOT NULL DEFAULT '0',
  `MealCategoryID3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients`
--

LOCK TABLES `Patients` WRITE;
/*!40000 ALTER TABLE `Patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients2`
--

DROP TABLE IF EXISTS `Patients2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients2` (
  `BookingID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `MealCategoryID` int(11) NOT NULL DEFAULT '0',
  `Doctor` varchar(100) NOT NULL DEFAULT '',
  `Description` varchar(100) NOT NULL DEFAULT '',
  `BedID` int(11) NOT NULL DEFAULT '0',
  `Discharged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients2`
--

LOCK TABLES `Patients2` WRITE;
/*!40000 ALTER TABLE `Patients2` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patients2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EntityAccountID` int(11) unsigned NOT NULL DEFAULT '0',
  `ReceiptNumber` varchar(30) NOT NULL DEFAULT '0',
  `ReferenceNo` varchar(30) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PaymentMethodID` char(2) NOT NULL DEFAULT 'CQ',
  `ChequeNo` varchar(50) DEFAULT NULL,
  `Amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModifierID` int(11) DEFAULT NULL,
  `ExportFlag` int(11) DEFAULT '0',
  `EndShiftID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `EntityAccountID` (`EntityAccountID`),
  KEY `EntityAccountID_ReceiptNumber` (`EntityAccountID`,`ReceiptNumber`),
  KEY `Date` (`Date`),
  KEY `PaymentMethodID` (`PaymentMethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentMethod`
--

DROP TABLE IF EXISTS `PaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentMethod` (
  `ID` char(2) NOT NULL DEFAULT '',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `ServiceFee` decimal(5,2) DEFAULT NULL,
  `CreditCard` enum('Y','N') NOT NULL DEFAULT 'N',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentMethod`
--

LOCK TABLES `PaymentMethod` WRITE;
/*!40000 ALTER TABLE `PaymentMethod` DISABLE KEYS */;
INSERT INTO `PaymentMethod` VALUES ('AC','Account',NULL,'N','2002-08-27 14:17:58',NULL,'OMC'),('CC','Credit Card',5.00,'Y','2002-08-27 14:17:58',NULL,'OMC'),('CQ','Cheque',NULL,'N','2002-08-27 14:17:58',NULL,'OMC'),('CS','Cash',NULL,'N','2002-08-27 14:17:58',NULL,'OMC'),('FT','EFT',NULL,'N','2002-08-27 14:17:58',NULL,'OMC'),('HO','Head Office',NULL,'N','2010-09-22 06:21:29',NULL,'OMC'),('MG','Management',NULL,'N','2005-02-16 03:13:22',NULL,'OMC'),('SL','Salary',NULL,'N','2010-09-22 06:21:29',NULL,'OMC');
/*!40000 ALTER TABLE `PaymentMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayoutReasons`
--

DROP TABLE IF EXISTS `PayoutReasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayoutReasons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Display` varchar(200) NOT NULL,
  `Active` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayoutReasons`
--

LOCK TABLES `PayoutReasons` WRITE;
/*!40000 ALTER TABLE `PayoutReasons` DISABLE KEYS */;
INSERT INTO `PayoutReasons` VALUES (3,'Stock Buy-out',1,5),(4,'Shop Maintenance',1,4),(5,'Shop Consumables',1,3),(6,'Refreshments',1,2),(7,'Creditor Payment',1,1);
/*!40000 ALTER TABLE `PayoutReasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payouts`
--

DROP TABLE IF EXISTS `Payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payouts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ref` char(50) NOT NULL DEFAULT '',
  `Cash` double NOT NULL DEFAULT '0',
  `ExportFlag` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `Reason` int(11) NOT NULL DEFAULT '0',
  `AccountID` int(11) NOT NULL DEFAULT '-1',
  `EndShiftID` int(11) NOT NULL,
  `AuthUserID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payouts`
--

LOCK TABLES `Payouts` WRITE;
/*!40000 ALTER TABLE `Payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrintLocation`
--

DROP TABLE IF EXISTS `PrintLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrintLocation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Command` varchar(255) DEFAULT NULL,
  `CutCommand` varchar(255) DEFAULT NULL,
  `JavaPrintCommand` varchar(255) DEFAULT NULL,
  `JavaPrintFile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrintLocation`
--

LOCK TABLES `PrintLocation` WRITE;
/*!40000 ALTER TABLE `PrintLocation` DISABLE KEYS */;
INSERT INTO `PrintLocation` VALUES (1,'K1K2K3','/usr/local/bin/omr_lpr K1K2K3',NULL,NULL,NULL),(2,'K1K2','/usr/local/bin/omr_lpr K1K2',NULL,NULL,NULL),(3,'K1K3','/usr/local/bin/omr_lpr K1K3',NULL,NULL,NULL),(4,'K2K3','/usr/local/bin/omr_lpr K2K3',NULL,NULL,NULL),(5,'B1K3','/usr/local/bin/omr_lpr B1K3',NULL,NULL,NULL),(6,'K2','/usr/local/bin/omr_lpr K2',NULL,NULL,NULL),(7,'B1','/usr/local/bin/omr_lpr B1',NULL,NULL,NULL),(8,'B2','/usr/local/bin/omr_lpr B2',NULL,NULL,NULL),(9,'B3','/usr/local/bin/omr_lpr B3',NULL,NULL,NULL),(10,'K4','/usr/local/bin/omr_lpr K4',NULL,NULL,NULL),(11,'K5','/usr/local/bin/omr_lpr K5',NULL,NULL,NULL),(12,'K3','/usr/local/bin/omr_lpr K3',NULL,NULL,NULL),(13,'B1B2','/usr/local/bin/omr_lpr B1B2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `PrintLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductProcessType`
--

DROP TABLE IF EXISTS `ProductProcessType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductProcessType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `StockCosted` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductProcessType`
--

LOCK TABLES `ProductProcessType` WRITE;
/*!40000 ALTER TABLE `ProductProcessType` DISABLE KEYS */;
INSERT INTO `ProductProcessType` VALUES (1,'Resale',1),(2,'Kitchen Process',1),(3,'Bar Process',1),(4,'Sale-only items',0),(5,'None',0);
/*!40000 ALTER TABLE `ProductProcessType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrder`
--

DROP TABLE IF EXISTS `PurchaseOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PurchaseOrder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EntityAccountID` int(11) unsigned NOT NULL DEFAULT '0',
  `ExpectedDate` date NOT NULL DEFAULT '0000-00-00',
  `Reversed` enum('Y','N') DEFAULT 'N',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `OrderComplete` tinyint(1) DEFAULT '0',
  `OrderType` char(20) NOT NULL DEFAULT 'PurchaseOrder',
  `PaymentMethodID` varchar(2) NOT NULL,
  `RefNo` varchar(50) NOT NULL,
  `OwnRefNo` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `EntityAccountID` (`EntityAccountID`),
  KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrder`
--

LOCK TABLES `PurchaseOrder` WRITE;
/*!40000 ALTER TABLE `PurchaseOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrderLineItem`
--

DROP TABLE IF EXISTS `PurchaseOrderLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PurchaseOrderLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseOrderID` int(11) NOT NULL DEFAULT '0',
  `StockMetricUnitID` int(11) DEFAULT NULL,
  `OrderUnitPriceIncl` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `Quantity` decimal(9,3) NOT NULL DEFAULT '0.000',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `UnitPriceExcl` decimal(11,3) DEFAULT NULL,
  `Short` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Completed` int(11) NOT NULL,
  `UnitPriceIncl` decimal(11,3) NOT NULL DEFAULT '0.000',
  `Unknown` int(10) unsigned NOT NULL DEFAULT '0',
  `OrderQty` int(11) NOT NULL,
  `Discount` decimal(11,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `PurchaseOrderID` (`PurchaseOrderID`),
  KEY `StockUnitID` (`StockMetricUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrderLineItem`
--

LOCK TABLES `PurchaseOrderLineItem` WRITE;
/*!40000 ALTER TABLE `PurchaseOrderLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseOrderLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportCategory`
--

DROP TABLE IF EXISTS `ReportCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportCategory` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT '',
  `FoodCosted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportCategory`
--

LOCK TABLES `ReportCategory` WRITE;
/*!40000 ALTER TABLE `ReportCategory` DISABLE KEYS */;
INSERT INTO `ReportCategory` VALUES (1,'Advertising',1),(2,'Bread & Rolls',1),(3,'Buffet Inv',1),(4,'Cakes',0),(5,'Chicken Inv',1),(6,'Cleaning Expenses',1),(7,'Cut & Croc',1),(8,'Dairy Inv',1),(9,'Desert St',1),(10,'Fruit & Veg',1),(11,'Gas Expenses',1),(12,'Groceries & Dry good',1),(13,'Hostess Costs',1),(14,'Hot Beverages',1),(15,'Labour Law',1),(16,'Loans',1),(17,'Management',1),(18,'Meat',1),(19,'Medical Expenses',1),(20,'Muffins',1),(21,'Oil',1),(22,'Packaging',1),(23,'Pasta & Soup',1),(24,'Rent Exp',1),(25,'Repair & Maintenance',1),(26,'Sauces',1),(27,'Staff',1),(28,'Staff Uniforms',1),(29,'Stationery',1),(30,'Telephone',1),(31,'Travel Expenses',1),(32,'Waiter Commission',1),(33,'Waiters',1),(34,'Breakfasts',1),(35,'Beverages',1),(36,'Combos',0),(37,'Desert',1),(38,'Finger',1),(39,'Kids',0),(40,'Liquor',1),(41,'Mains',0),(42,'Modify',1),(43,'Pasta & Soups',0),(44,'Pizza',0),(45,'Salad',0),(46,'Sandwiches',0),(47,'Starters',0),(48,'Tramezzini',0),(49,'Extras',0),(50,'Zero',1),(52,'Fish',1),(53,'Chicken',1),(54,'Dairy',1),(55,'Retail & Sweets',1),(56,'Spirits',1),(57,'Beers',1),(58,'Wine',1),(59,'RAW',0);
/*!40000 ALTER TABLE `ReportCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sale`
--

DROP TABLE IF EXISTS `Sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sale` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EntityAccountID` int(11) unsigned DEFAULT NULL,
  `Common_AuthUserID` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `PaymentMethodID` char(2) NOT NULL DEFAULT 'AC',
  `DiscountPercentage` decimal(4,1) DEFAULT NULL,
  `Discount` decimal(11,5) DEFAULT NULL,
  `ReversalID` int(11) DEFAULT NULL,
  `Cost` decimal(14,5) DEFAULT NULL,
  `Exclusive` decimal(14,5) DEFAULT NULL,
  `Vat` decimal(14,5) DEFAULT NULL,
  `Tip` decimal(11,2) DEFAULT '0.00',
  `Paid` datetime DEFAULT NULL,
  `Period` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `Notes` text,
  `Reference` varchar(30) DEFAULT NULL,
  `Cash` decimal(11,2) NOT NULL DEFAULT '0.00',
  `Cheque` decimal(11,2) NOT NULL DEFAULT '0.00',
  `CredCard` decimal(11,2) NOT NULL DEFAULT '0.00',
  `Account` decimal(11,2) NOT NULL DEFAULT '0.00',
  `ExportFlag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Rounding` decimal(11,2) NOT NULL DEFAULT '0.00',
  `EntityID` int(11) NOT NULL DEFAULT '-1',
  `CurrencyPaid` char(10) NOT NULL DEFAULT '1',
  `CurrencyExchange` double NOT NULL DEFAULT '1',
  `CurrencyCash` double NOT NULL DEFAULT '0',
  `EndShiftID` int(11) NOT NULL DEFAULT '-1',
  `AuthUserID_Discount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `EntityAccountID` (`EntityAccountID`),
  KEY `Common_AuthUserID` (`Common_AuthUserID`),
  KEY `Date` (`Date`),
  KEY `PaymentMethodID` (`PaymentMethodID`),
  KEY `ReversalID` (`ReversalID`),
  KEY `Period` (`Period`),
  KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sale`
--

LOCK TABLES `Sale` WRITE;
/*!40000 ALTER TABLE `Sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SaleCashDrop`
--

DROP TABLE IF EXISTS `SaleCashDrop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaleCashDrop` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CURUSER` int(11) NOT NULL,
  `ID_ADMINUSER` int(11) NOT NULL,
  `Cash` double NOT NULL,
  `CreditCard` double NOT NULL,
  `Check` double NOT NULL,
  `Account` double NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaleCashDrop`
--

LOCK TABLES `SaleCashDrop` WRITE;
/*!40000 ALTER TABLE `SaleCashDrop` DISABLE KEYS */;
/*!40000 ALTER TABLE `SaleCashDrop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SaleInfo`
--

DROP TABLE IF EXISTS `SaleInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaleInfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SaleID` int(11) NOT NULL DEFAULT '0',
  `IDNumber` varchar(13) NOT NULL DEFAULT '',
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Phone` varchar(50) NOT NULL DEFAULT '',
  `ChequeNo` varchar(20) NOT NULL DEFAULT '',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `SaleID` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaleInfo`
--

LOCK TABLES `SaleInfo` WRITE;
/*!40000 ALTER TABLE `SaleInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `SaleInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SaleLineItem`
--

DROP TABLE IF EXISTS `SaleLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaleLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SaleID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Quantity` decimal(9,5) NOT NULL DEFAULT '0.00000',
  `UnitCost` decimal(11,2) NOT NULL DEFAULT '0.00',
  `UnitPrice` decimal(11,2) NOT NULL DEFAULT '0.00',
  `DiscountPercentage` decimal(4,1) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `VatAmount` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `VatType` varchar(10) NOT NULL DEFAULT '1',
  `ExportFlag` tinyint(3) NOT NULL DEFAULT '0',
  `SerialNumber` varchar(40) NOT NULL DEFAULT '',
  `DiscountAmount` double(11,5) NOT NULL,
  `EndShiftID` int(11) NOT NULL DEFAULT '-1',
  `InitialPrice` double(14,5) NOT NULL DEFAULT '0.00000',
  `AuthUserID_Discount` int(11) NOT NULL DEFAULT '0',
  `AuthUserID_PriceOverride` int(11) NOT NULL DEFAULT '0',
  `AuthUserID_Return` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `SaleID` (`SaleID`),
  KEY `StockUnitID` (`StockUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaleLineItem`
--

LOCK TABLES `SaleLineItem` WRITE;
/*!40000 ALTER TABLE `SaleLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `SaleLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SalePaid`
--

DROP TABLE IF EXISTS `SalePaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalePaid` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(10) NOT NULL DEFAULT '',
  `PaymentRef` varchar(40) NOT NULL,
  `Value1` double NOT NULL DEFAULT '0',
  `SaleID` int(11) NOT NULL DEFAULT '0',
  `ExportFlag` int(11) NOT NULL DEFAULT '0',
  `Value2` double NOT NULL DEFAULT '0',
  `PaymentRef2` varchar(40) NOT NULL DEFAULT '',
  `EndShiftID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SalePaid`
--

LOCK TABLES `SalePaid` WRITE;
/*!40000 ALTER TABLE `SalePaid` DISABLE KEYS */;
/*!40000 ALTER TABLE `SalePaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SaleReturn`
--

DROP TABLE IF EXISTS `SaleReturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaleReturn` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SaleID` int(11) NOT NULL DEFAULT '0',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `SaleID` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaleReturn`
--

LOCK TABLES `SaleReturn` WRITE;
/*!40000 ALTER TABLE `SaleReturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `SaleReturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SaleReturnLineItem`
--

DROP TABLE IF EXISTS `SaleReturnLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaleReturnLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SaleReturnID` int(11) NOT NULL DEFAULT '0',
  `SaleLineItemID` int(11) NOT NULL DEFAULT '0',
  `Returned` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Stockable` decimal(9,3) NOT NULL DEFAULT '0.000',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `SaleReturnID` (`SaleReturnID`),
  KEY `SaleLineItemID` (`SaleLineItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaleReturnLineItem`
--

LOCK TABLES `SaleReturnLineItem` WRITE;
/*!40000 ALTER TABLE `SaleReturnLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `SaleReturnLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SaleSummary`
--

DROP TABLE IF EXISTS `SaleSummary`;
/*!50001 DROP VIEW IF EXISTS `SaleSummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SaleSummary` (
  `WaiterID` tinyint NOT NULL,
  `Date` tinyint NOT NULL,
  `TransactionType` tinyint NOT NULL,
  `Total` tinyint NOT NULL,
  `Exclusive` tinyint NOT NULL,
  `VAT` tinyint NOT NULL,
  `Discount` tinyint NOT NULL,
  `Tip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `State`
--

DROP TABLE IF EXISTS `State`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `State` (
  `ID` char(3) NOT NULL DEFAULT '',
  `Name` varchar(20) NOT NULL DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) NOT NULL DEFAULT '0',
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `SourceID` (`SourceID`),
  KEY `ModifierID` (`ModifierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `State`
--

LOCK TABLES `State` WRITE;
/*!40000 ALTER TABLE `State` DISABLE KEYS */;
/*!40000 ALTER TABLE `State` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StateChange`
--

DROP TABLE IF EXISTS `StateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StateChange` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FromID` char(3) DEFAULT NULL,
  `ToID` char(3) NOT NULL DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) NOT NULL DEFAULT '0',
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FromID_ToID` (`FromID`,`ToID`),
  KEY `SourceID` (`SourceID`),
  KEY `FromID` (`FromID`),
  KEY `ToID` (`ToID`),
  KEY `ModifierID` (`ModifierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StateChange`
--

LOCK TABLES `StateChange` WRITE;
/*!40000 ALTER TABLE `StateChange` DISABLE KEYS */;
/*!40000 ALTER TABLE `StateChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Statement`
--

DROP TABLE IF EXISTS `Statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Statement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EntityID` int(11) unsigned NOT NULL DEFAULT '0',
  `StatementNumber` int(11) NOT NULL DEFAULT '0',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Printed` enum('Y','N') NOT NULL DEFAULT 'N',
  `Modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `EntityID` (`EntityID`),
  KEY `EntityID_StatementNumber` (`EntityID`,`StatementNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Statement`
--

LOCK TABLES `Statement` WRITE;
/*!40000 ALTER TABLE `Statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockCategoryID` varchar(10) DEFAULT NULL,
  `Type` enum('Stock','Service','KP','ReSale','Liq') DEFAULT NULL,
  `Code` varchar(30) NOT NULL,
  `BarCode` varchar(50) DEFAULT NULL,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `VatID` varchar(10) NOT NULL DEFAULT 'S',
  `LowerPurchasesLimit` double(15,5) DEFAULT NULL,
  `UpperPurchasesLimit` double(15,5) DEFAULT NULL,
  `Sellable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Findable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `StockAccountID` varchar(6) NOT NULL DEFAULT 'STOCK',
  `IncomeAccountID` varchar(6) NOT NULL DEFAULT 'SALES',
  `COSAccountID` varchar(6) NOT NULL DEFAULT 'COS',
  `ConsignorID` int(11) unsigned DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `PrintLocationID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `SubLocationID` int(11) DEFAULT NULL,
  `UnitType` enum('Mass','Volume','None') NOT NULL DEFAULT 'Mass',
  `SaleLocationID` int(11) NOT NULL,
  `ProductProcessTypeID` int(11) NOT NULL,
  `DepositItem` enum('Y','N') NOT NULL DEFAULT 'N',
  `StockUpdated` datetime NOT NULL DEFAULT '2009-10-20 00:00:00',
  `SubLocationID2` int(11) DEFAULT NULL,
  `SubLocationID3` int(11) DEFAULT NULL,
  `SubLocationID4` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SourceID` (`SourceID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `Type` (`Type`),
  KEY `StockCategoryID` (`StockCategoryID`),
  KEY `StockAccountID` (`StockAccountID`),
  KEY `IncomeAccountID` (`IncomeAccountID`),
  KEY `COSAccountID` (`COSAccountID`),
  KEY `VatID` (`VatID`),
  KEY `ConsignorID` (`ConsignorID`),
  KEY `Name` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stock`
--

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockBackup`
--

DROP TABLE IF EXISTS `StockBackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockBackup` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `StockCategoryID` char(10) DEFAULT NULL,
  `Type` enum('Stock','Service') NOT NULL DEFAULT 'Stock',
  `Code` char(15) NOT NULL DEFAULT '',
  `BarCode` char(13) DEFAULT NULL,
  `Name` char(50) NOT NULL DEFAULT '',
  `VatID` char(1) NOT NULL DEFAULT 'S',
  `LowerPurchasesLeadTime` int(11) DEFAULT NULL,
  `UpperPurchasesLeadTime` int(11) DEFAULT NULL,
  `Sellable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Findable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `StockAccountID` char(6) NOT NULL DEFAULT 'STOCK',
  `IncomeAccountID` char(6) NOT NULL DEFAULT 'SALES',
  `COSAccountID` char(6) NOT NULL DEFAULT 'COS',
  `ConsignorID` int(11) unsigned DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` char(10) DEFAULT NULL,
  `PrintLocationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockBackup`
--

LOCK TABLES `StockBackup` WRITE;
/*!40000 ALTER TABLE `StockBackup` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockBackup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockBatch`
--

DROP TABLE IF EXISTS `StockBatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockBatch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `BatchAmountMade` double NOT NULL DEFAULT '0',
  `BatchAmount` double NOT NULL DEFAULT '0',
  `Started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Finished` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Completed` tinyint(4) NOT NULL DEFAULT '0',
  `Description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockBatch`
--

LOCK TABLES `StockBatch` WRITE;
/*!40000 ALTER TABLE `StockBatch` DISABLE KEYS */;
INSERT INTO `StockBatch` VALUES (1,1130,10,15,'2005-09-26 18:55:46','2005-09-26 18:56:26',1,'Test');
/*!40000 ALTER TABLE `StockBatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `StockCat`
--

DROP TABLE IF EXISTS `StockCat`;
/*!50001 DROP VIEW IF EXISTS `StockCat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StockCat` (
  `ID` tinyint NOT NULL,
  `Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `StockCategory`
--

DROP TABLE IF EXISTS `StockCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockCategory` (
  `ID` varchar(10) NOT NULL DEFAULT '',
  `StockClassID` varchar(10) NOT NULL DEFAULT '',
  `Name` varchar(30) NOT NULL DEFAULT '',
  `CommissionToHeadOffice` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `Type` set('Drinks','Food','Raw','Kiosk') DEFAULT NULL,
  `Options` set('Private','Public') NOT NULL DEFAULT 'Private',
  `AllowDiscount` tinyint(1) NOT NULL DEFAULT '1',
  `UnitMultiplier` int(11) NOT NULL DEFAULT '1',
  `ExtraModifier` tinyint(1) NOT NULL DEFAULT '0',
  `DefaultProdProcessTypeID` int(11) NOT NULL DEFAULT '1',
  `ExpensesCategory` tinyint(1) NOT NULL DEFAULT '0',
  `ReportCategoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StockClassID` (`StockClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockCategory`
--

LOCK TABLES `StockCategory` WRITE;
/*!40000 ALTER TABLE `StockCategory` DISABLE KEYS */;
INSERT INTO `StockCategory` VALUES ('010001','STD','BAKERY',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010003','STD','JUICES',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010004','STD','DAIRY',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010005','STD','EGGS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010007','STD','FISH',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010009','STD','FROZEN VEG',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010011','STD','ICE CREAM',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010012','STD','MARAGARINE',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010013','STD','POULTRY',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010014','STD','PROCESSED MEATS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010015','STD','RED MEAT',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010016','STD','HOT FOODS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010017','STD','AFVAL',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('010018','STD','FRESH VEG ',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020001','STD','BAKING AIDS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020002','STD','BISCUITS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020003','STD','BREAKFAST',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020004','STD','CANNED FISH',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020005','STD','CANNED FRUIT',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020006','STD','CANNED MEAT',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020007','STD','CANNED VEG',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020008','STD','CHIPS & SNACKS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020009','STD','COLD BEVERAGES',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020010','STD','CONDIMENTS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020011','STD','CONFECTIONERY',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020012','STD','COOKING OIL',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020013','STD','DRY DAIRY',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020014','STD','DRIED VEG',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020015','STD','HOT BEVERAGES',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020016','STD','JAMS & SPREADS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020017','STD','MAIZE',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020018','STD','MEDICAL',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020019','STD','PASTA',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020021','STD','RICE',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020022','STD','SOUPS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020023','STD','SPICE & SEASONINGS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020024','STD','SUGAR',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020025','STD','WHEAT',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020026','STD','CORDIALS',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('020027','STD','BABY FOOD ',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('030001','STD','CELLPHONE & ACCESSORIES',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('030002','STD','CIGARETTES & TABACCO',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('030003','STD','PACKAGING',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('030004','STD','TOILETRIES',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('040001','STD','GROCERY HAMPER',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('040002','STD','PERISHABLE HAMPER',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0),('050001','STD','HOT FOOD(5.1)',0.00,'2011-02-13 14:27:27',NULL,'BIO','Drinks','Public',1,1,0,1,0,0);
/*!40000 ALTER TABLE `StockCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockCategoryMixes`
--

DROP TABLE IF EXISTS `StockCategoryMixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockCategoryMixes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockCategoryID` varchar(10) NOT NULL DEFAULT '',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockCategoryMixes`
--

LOCK TABLES `StockCategoryMixes` WRITE;
/*!40000 ALTER TABLE `StockCategoryMixes` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockCategoryMixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockCategoryNotes`
--

DROP TABLE IF EXISTS `StockCategoryNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockCategoryNotes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockCategoryID` varchar(10) NOT NULL DEFAULT '',
  `Notes` varchar(255) NOT NULL DEFAULT '',
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Grouping` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockCategoryNotes`
--

LOCK TABLES `StockCategoryNotes` WRITE;
/*!40000 ALTER TABLE `StockCategoryNotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockCategoryNotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockClass`
--

DROP TABLE IF EXISTS `StockClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockClass` (
  `ID` varchar(10) NOT NULL DEFAULT '',
  `StockRuleID` varchar(10) NOT NULL DEFAULT '',
  `Name` varchar(30) NOT NULL DEFAULT '',
  `ServiceFeeFromHeadOffice` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StockRuleID` (`StockRuleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockClass`
--

LOCK TABLES `StockClass` WRITE;
/*!40000 ALTER TABLE `StockClass` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockCost`
--

DROP TABLE IF EXISTS `StockCost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockCost` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `UnitCost` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Quantity` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Sold` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StockUnitID` (`StockUnitID`),
  KEY `Date` (`Date`),
  KEY `UnitCost` (`UnitCost`),
  KEY `Date_StockUnitID_Cost` (`Date`,`StockUnitID`,`UnitCost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockCost`
--

LOCK TABLES `StockCost` WRITE;
/*!40000 ALTER TABLE `StockCost` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockCost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockCostChanges`
--

DROP TABLE IF EXISTS `StockCostChanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockCostChanges` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockUnitID` int(11) NOT NULL,
  `OldCost` double(11,5) NOT NULL,
  `NewCost` double(11,5) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockCostChanges`
--

LOCK TABLES `StockCostChanges` WRITE;
/*!40000 ALTER TABLE `StockCostChanges` DISABLE KEYS */;
INSERT INTO `StockCostChanges` VALUES (1,1,0.00000,3.00000,'2010-10-20 17:28:27','2010-10-20 15:28:27'),(2,604,0.00000,-1.00000,'2010-10-21 12:40:13','2010-10-21 10:40:13'),(3,604,-1.00000,25.00000,'2010-10-21 12:40:31','2010-10-21 10:40:31'),(4,604,25.00000,37.00000,'2010-10-21 12:41:04','2010-10-21 10:41:04'),(5,114,20.00000,10.00000,'2011-02-02 17:24:54','2011-02-02 15:24:54'),(6,114,10.00000,20.00000,'2011-02-02 17:26:13','2011-02-02 15:26:13');
/*!40000 ALTER TABLE `StockCostChanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `StockInfo`
--

DROP TABLE IF EXISTS `StockInfo`;
/*!50001 DROP VIEW IF EXISTS `StockInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StockInfo` (
  `BarCode` tinyint NOT NULL,
  `Deposit` tinyint NOT NULL,
  `Category` tinyint NOT NULL,
  `CategoryType` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `COSAccount` tinyint NOT NULL,
  `Cost` tinyint NOT NULL,
  `IncomeAccount` tinyint NOT NULL,
  `IsExtra` tinyint NOT NULL,
  `IsFindable` tinyint NOT NULL,
  `IsSellable` tinyint NOT NULL,
  `Location` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Price` tinyint NOT NULL,
  `PrintLocation` tinyint NOT NULL,
  `ProductProcessType` tinyint NOT NULL,
  `Quantity` tinyint NOT NULL,
  `SaleLocation` tinyint NOT NULL,
  `SOHQuantity` tinyint NOT NULL,
  `StockID` tinyint NOT NULL,
  `SubLocation` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `UnitType` tinyint NOT NULL,
  `VatPercentage` tinyint NOT NULL,
  `StockUnitID` tinyint NOT NULL,
  `HasModifiers` tinyint NOT NULL,
  `StockModified` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StockInfo2`
--

DROP TABLE IF EXISTS `StockInfo2`;
/*!50001 DROP VIEW IF EXISTS `StockInfo2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StockInfo2` (
  `BarCode` tinyint NOT NULL,
  `Deposit` tinyint NOT NULL,
  `Category` tinyint NOT NULL,
  `CategoryType` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `COSAccount` tinyint NOT NULL,
  `Cost` tinyint NOT NULL,
  `IncomeAccount` tinyint NOT NULL,
  `IsExtra` tinyint NOT NULL,
  `IsFindable` tinyint NOT NULL,
  `IsSellable` tinyint NOT NULL,
  `Location` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Price` tinyint NOT NULL,
  `PrintLocation` tinyint NOT NULL,
  `ProductProcessType` tinyint NOT NULL,
  `Quantity` tinyint NOT NULL,
  `SaleLocation` tinyint NOT NULL,
  `SOHQuantity` tinyint NOT NULL,
  `StockID` tinyint NOT NULL,
  `SubLocation` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `UnitType` tinyint NOT NULL,
  `VatPercentage` tinyint NOT NULL,
  `StockUnitID` tinyint NOT NULL,
  `HasModifiers` tinyint NOT NULL,
  `StockModified` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StockInfoTest`
--

DROP TABLE IF EXISTS `StockInfoTest`;
/*!50001 DROP VIEW IF EXISTS `StockInfoTest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StockInfoTest` (
  `BarCode` tinyint NOT NULL,
  `Category` tinyint NOT NULL,
  `CategoryType` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `COSAccount` tinyint NOT NULL,
  `Cost` tinyint NOT NULL,
  `IncomeAccount` tinyint NOT NULL,
  `IsExtra` tinyint NOT NULL,
  `IsFindable` tinyint NOT NULL,
  `IsSellable` tinyint NOT NULL,
  `Location` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Price` tinyint NOT NULL,
  `PrintLocation` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `StockIngredient`
--

DROP TABLE IF EXISTS `StockIngredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockIngredient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID1` int(11) NOT NULL DEFAULT '0',
  `Quantity` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StockUnitID_StockUnitID1` (`StockUnitID`,`StockUnitID1`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StockUnitID1` (`StockUnitID1`),
  KEY `StockUnitID` (`StockUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockIngredient`
--

LOCK TABLES `StockIngredient` WRITE;
/*!40000 ALTER TABLE `StockIngredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockIngredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockLocationQuantity`
--

DROP TABLE IF EXISTS `StockLocationQuantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockLocationQuantity` (
  `LocationID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Quantity` double NOT NULL DEFAULT '0',
  KEY `PRIMARY_KEY` (`LocationID`,`StockUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockLocationQuantity`
--

LOCK TABLES `StockLocationQuantity` WRITE;
/*!40000 ALTER TABLE `StockLocationQuantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockLocationQuantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockMainCategory`
--

DROP TABLE IF EXISTS `StockMainCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockMainCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Type` enum('Food','Bar','FoodMod','BarMod') NOT NULL DEFAULT 'Food',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockMainCategory`
--

LOCK TABLES `StockMainCategory` WRITE;
/*!40000 ALTER TABLE `StockMainCategory` DISABLE KEYS */;
INSERT INTO `StockMainCategory` VALUES (1,'PERISHABLES','Bar'),(2,'GROCERIES','Bar'),(3,'NON-FOOD ITEMS','Bar'),(4,'HAMPERS','Bar'),(5,'AIRTIME','Bar'),(6,'OBC DATABASE','Bar');
/*!40000 ALTER TABLE `StockMainCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockMainCategoryLineItem`
--

DROP TABLE IF EXISTS `StockMainCategoryLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockMainCategoryLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockMainCategoryID` int(11) NOT NULL DEFAULT '0',
  `StockCategoryID` varchar(10) NOT NULL DEFAULT '',
  `Expand` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockMainCategoryLineItem`
--

LOCK TABLES `StockMainCategoryLineItem` WRITE;
/*!40000 ALTER TABLE `StockMainCategoryLineItem` DISABLE KEYS */;
INSERT INTO `StockMainCategoryLineItem` VALUES (282,1,'010016',1),(283,1,'010013',1),(284,1,'010014',1),(285,1,'010015',1),(286,1,'010001',1),(287,2,'020001',1),(288,2,'020012',1),(289,2,'020017',1),(290,2,'020023',1),(291,2,'020002',1),(292,2,'020007',1),(293,2,'020013',1),(294,2,'020018',1),(295,2,'020024',1),(296,1,'010003',1),(297,2,'020003',1),(298,2,'020008',1),(299,2,'020014',1),(300,2,'020019',1),(301,2,'020025',1),(302,1,'010004',1),(303,2,'020004',1),(304,2,'020009',1),(305,2,'020015',1),(306,3,'030001',1),(307,1,'010005',1),(308,2,'020005',1),(309,2,'020010',1),(310,2,'020016',1),(311,2,'020021',1),(312,3,'030002',1),(313,2,'020011',1),(314,2,'020022',1),(315,3,'030003',1),(316,1,'010007',1),(317,1,'010009',1),(318,1,'010011',1),(319,1,'010012',1),(320,4,'040001',1),(321,4,'040002',1),(322,2,'020006',1),(323,2,'020026',1),(324,5,'050001',1),(325,1,'010017',1),(326,1,'010018',1),(327,2,'020027',1),(328,3,'030004',1);
/*!40000 ALTER TABLE `StockMainCategoryLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockMetricUnit`
--

DROP TABLE IF EXISTS `StockMetricUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockMetricUnit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockID` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Multiplier` double(15,5) NOT NULL DEFAULT '0.00000',
  `Barcode` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `StockID` (`StockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockMetricUnit`
--

LOCK TABLES `StockMetricUnit` WRITE;
/*!40000 ALTER TABLE `StockMetricUnit` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockMetricUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockModifier`
--

DROP TABLE IF EXISTS `StockModifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockModifier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` enum('Forced','OptSingle','OptMany') NOT NULL DEFAULT 'Forced',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockModifier`
--

LOCK TABLES `StockModifier` WRITE;
/*!40000 ALTER TABLE `StockModifier` DISABLE KEYS */;
INSERT INTO `StockModifier` VALUES (1,'OptSingle','ICE',0),(3,'OptSingle','bacon made',0),(4,'Forced','BAR  MODIFY',0),(5,'Forced','Bread choice',0),(6,'Forced','Dessert Opt',0),(7,'Forced','Eggs Done',0),(8,'Forced','Coffee & Tea Opt',0),(9,'Forced','Cap Opt',0),(10,'Forced','Cut/No Cut',1),(11,'Forced','How Done',1),(12,'OptMany','Kitchen Modify',0),(13,'Forced','MIXERS',0),(14,'OptMany','Kitchen No\'s',0),(15,'OptMany','Bar No-s',0),(16,'Forced','Omelette Choice',0),(17,'Forced','Beef & Veg Wrap',0),(18,'Forced','Baby Chick Sauce',0),(19,'Forced','Water choioce ',0),(20,'Forced','Calamari choice',0),(21,'Forced','Starch',0),(22,'Forced','Veg Option',0),(23,'Forced','bla',0),(24,'Forced','Sushi use',0),(25,'Forced','Spritzer',0),(26,'Forced','Cordial Mix',0),(27,'Forced','Cordial Mix2',0),(28,'Forced','Cordial tot',0),(29,'Forced','soda choice',0),(30,'Forced','dom choices',0),(31,'Forced','Single/Doub',0),(32,'Forced','Float Options',0),(33,'Forced','Chk burger sauce',0),(34,'Forced','Sushi',0),(35,'Forced','Prawn Option',1),(36,'Forced','Smoothies',1),(37,'Forced','Water still spark',0);
/*!40000 ALTER TABLE `StockModifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockModifierGrouping`
--

DROP TABLE IF EXISTS `StockModifierGrouping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockModifierGrouping` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockModifierLineItemID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockModifierGrouping`
--

LOCK TABLES `StockModifierGrouping` WRITE;
/*!40000 ALTER TABLE `StockModifierGrouping` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockModifierGrouping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockModifierGroupingLineItem`
--

DROP TABLE IF EXISTS `StockModifierGroupingLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockModifierGroupingLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockModifierGroupingID` int(11) NOT NULL DEFAULT '0',
  `StockModifierLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockModifierPriority` int(11) NOT NULL DEFAULT '0',
  `ExtraOpenSaleLineItemID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockModifierGroupingLineItem`
--

LOCK TABLES `StockModifierGroupingLineItem` WRITE;
/*!40000 ALTER TABLE `StockModifierGroupingLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockModifierGroupingLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockModifierLineItem`
--

DROP TABLE IF EXISTS `StockModifierLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockModifierLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockModifierID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) NOT NULL DEFAULT '',
  `StockUnitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockModifierLineItem`
--

LOCK TABLES `StockModifierLineItem` WRITE;
/*!40000 ALTER TABLE `StockModifierLineItem` DISABLE KEYS */;
INSERT INTO `StockModifierLineItem` VALUES (1,1,'Extra Ice',NULL),(4,3,'Crispy Bacon',NULL),(5,3,'Soft Bacon',NULL),(6,4,'On the rocks',NULL),(7,4,'Tall Glass',NULL),(8,4,'Short Glass',NULL),(9,4,'Crushed Ice',NULL),(10,4,'Wine Glass',NULL),(11,4,'With Water',NULL),(12,4,'Tot Glass',NULL),(13,4,'Semi Sweet',NULL),(14,4,'Dry',NULL),(15,5,'Brown Bread',NULL),(16,5,'White Bread',NULL),(17,5,'Whole Wheat',NULL),(18,6,'Plain',NULL),(19,6,'Cream',NULL),(20,6,'Ice Cream',NULL),(21,6,'Both Cr & IcCream',NULL),(22,7,'Eggs Hard',NULL),(23,7,'Eggs Soft',NULL),(24,7,'Eggs Scrambled',NULL),(25,7,'Eggs Sunny Side Up',NULL),(26,7,'Easy Over',NULL),(27,7,'No Egg',NULL),(28,8,'Hot Milk',NULL),(29,8,'Tuna',NULL),(30,8,'Cold Milk',NULL),(31,8,'No Milk',NULL),(32,9,'Cream',NULL),(33,9,'Foam',NULL),(34,9,'Plain',NULL),(35,10,'Cut',NULL),(36,10,'Not Cut',NULL),(37,11,'Bleu',NULL),(38,11,'Rare',NULL),(39,11,'Med Rare',NULL),(40,11,'Medium',NULL),(41,11,'Med Well',NULL),(42,11,'Well Done',NULL),(43,12,'Extra Plate',NULL),(44,12,'As Starter',NULL),(45,12,'No Garnish',NULL),(46,12,'Salad Instead',NULL),(47,12,'Chips Instead',NULL),(48,12,'Rice Instead',NULL),(49,13,'Coke',NULL),(50,13,'Dry Lemon',NULL),(51,13,'Coke Light',NULL),(52,13,'Lemonade',NULL),(53,13,'Ginger Ale',NULL),(54,13,'TAB',NULL),(55,13,'Crab',NULL),(56,13,'Tom Cocktail',NULL),(57,13,'Tonic',NULL),(58,14,'No Yoghurt',NULL),(59,14,'No Muesli',NULL),(60,14,'No fruit Salad',NULL),(61,14,'No Garlic',NULL),(62,14,'No Bacon',NULL),(63,14,'No Tomato',NULL),(64,14,'No sausage',NULL),(65,14,'No chips',NULL),(66,14,'No cinnamon',NULL),(67,15,'No cream',NULL),(68,14,'No butter',NULL),(69,14,'No Rice',NULL),(70,14,'No Salad',NULL),(71,14,'No Relish',NULL),(72,14,'No Onion',NULL),(73,14,'No Lettuce',NULL),(74,14,'No Avo',NULL),(75,14,'No Jalapeno\'s',NULL),(76,14,'No Dressing',NULL),(77,14,'No Greenpepper',NULL),(78,14,'No cucumber',NULL),(79,14,'No Olives',NULL),(80,14,'No Feta',NULL),(81,14,'No Robiola',NULL),(82,14,'NO CHICKEN',NULL),(83,14,'NO BACON BITS',NULL),(84,14,'NO CROUTONS',NULL),(85,14,'NO PARMESAN',NULL),(86,14,'NO BILTONG',NULL),(87,14,'NO CASHEW NUTS',NULL),(88,14,'NO PARMA HAM',NULL),(89,14,'NO PINEAPPLE',NULL),(90,14,'NO CHILLI',NULL),(91,14,'NO SD TOMATO',NULL),(92,14,'NO CELERY',NULL),(93,14,'NO APPLE',NULL),(94,14,'NO MELON',NULL),(95,15,'NO MELON',NULL),(96,14,'NO BEAN SPROUTS',NULL),(97,14,'NO PEPPADEWS',NULL),(98,14,'NO CARROTS',NULL),(99,14,'NO CALAMARI',NULL),(100,14,'NO SHRIMP',NULL),(101,14,'NO CHICK PEAS',NULL),(102,14,'NO COTT CHSE',NULL),(103,14,'NO PESTO',NULL),(104,14,'NO HOLLANDNAISE',NULL),(105,14,'NO GING SAUCE',NULL),(106,14,'NO MARROW',NULL),(107,14,'NO SW&SO SAUCE',NULL),(108,14,'NO SWT CHILLI',NULL),(109,14,'NO PICKLES',NULL),(110,14,'NO MUSTARD',NULL),(111,14,'NO CAPERS',NULL),(112,14,'NO SPRING ONION',NULL),(113,14,'NO VINAGRETTE',NULL),(114,14,'NO BRINJALS',NULL),(115,14,'NO ARTICHOKES',NULL),(116,14,'NO ASPARAGUS',NULL),(117,14,'NO TARTAR SAUCE',NULL),(118,14,'NO NAPOLETANA',NULL),(119,14,'Spinach',NULL),(120,14,'NO GUACOMOLE',NULL),(121,14,'NO LEM/BUTT SAUCE',NULL),(122,14,'NO BASTING',NULL),(123,14,'NO GRAVY',NULL),(124,14,'NO MINT JELLY',NULL),(125,15,'NO GLASS',NULL),(126,15,'NO LEMON',NULL),(127,14,'NO LEMON',NULL),(128,14,'NO STARCH',NULL),(129,14,'NO MUSHROOMS',NULL),(130,14,'NO HASH BROWN',NULL),(131,14,'NO CHEESE',NULL),(132,15,'NO ICE',NULL),(133,16,'BL CHICK',620),(134,16,'SALAMI',621),(135,16,'FETA',622),(136,16,'FRANKFURTER',623),(137,16,'SPINACH',624),(138,16,'AVO',625),(139,16,'G/PEPPER',626),(140,16,'ONION',627),(141,16,'TOMATO',628),(142,16,'HAM',629),(143,16,'MINCE',630),(144,16,'MUSHROOM',631),(145,16,'CHED CHSE',632),(146,17,'MUST MAYO SAUCE',NULL),(147,17,'BBQ SAUCE',NULL),(148,18,'BBQ SAUCE',NULL),(149,18,'Peri-Peri',NULL),(150,18,'Lemon Herb',NULL),(151,19,'Still',NULL),(152,19,'Sparkling',NULL),(153,20,'Tatar & Lemon',NULL),(154,20,'Cajun & Quacomole',NULL),(155,21,'Chips',NULL),(157,21,'No Starch',NULL),(158,21,'Pap',NULL),(159,21,'P\\F Potatoes',NULL),(160,21,'Mash',NULL),(161,21,'Rice',NULL),(162,22,'No Veg',NULL),(163,2,'TAB 200ml',NULL),(164,2,'TAB 340ml',NULL),(165,24,'Salmon',NULL),(166,24,'Tuna',NULL),(168,24,'White Fish',NULL),(169,24,'Vegetarian',NULL),(170,24,'Prawn ',NULL),(171,24,'-',NULL),(172,24,'-',NULL),(174,7,'EGGS MEDIUM',NULL),(175,25,'Dry',NULL),(176,25,'Semi sweet',NULL),(177,26,'Lime',NULL),(178,26,'Passion Fruit',NULL),(179,26,'Kola Tonic',NULL),(180,27,'Sprite',NULL),(181,27,'Soda',NULL),(182,28,'Passion Fruit',NULL),(183,28,'Kola Tonic',NULL),(184,28,'Lime',NULL),(185,21,'Boil Potato',NULL),(186,29,'Coke',NULL),(187,29,'Sprite',NULL),(188,29,'Soda Water',NULL),(189,30,'Kahlua',NULL),(190,30,'Amarula',NULL),(191,30,'Cape Velvet',NULL),(192,30,'Tia Maria',NULL),(193,30,'Peppermint',NULL),(194,30,'Bells',NULL),(195,30,'Captain',NULL),(196,30,'Blk Sambucca',NULL),(197,30,'Wht Sambucca',NULL),(198,30,'Blu Sambucca',NULL),(199,30,'Green Sambucca',NULL),(200,30,'Red Sambucca',NULL),(201,30,'Amaretto',NULL),(202,30,'Frangelico',NULL),(203,30,'Archers',NULL),(204,30,'Klipdrift',NULL),(205,30,'Stroh Pedro',NULL),(206,30,'Jameson',NULL),(207,30,'Nachtmuzic',NULL),(208,31,'',NULL),(209,31,'Double',NULL),(210,32,'Coke',NULL),(211,32,'Cr',NULL),(212,32,'Fanta Orange',NULL),(213,32,'Sprite',NULL),(214,33,'Honey & Mustard',NULL),(215,33,'Peri -Peri',NULL),(216,5,'Rye Bread',NULL),(217,34,'',NULL),(218,34,'Water',NULL),(219,22,'',NULL),(220,22,'Stir-Fried',NULL),(221,22,'Spinach',NULL),(222,22,'Buetternut',NULL),(223,35,'Champagne',NULL),(224,35,'Lemon',NULL),(225,8,'New Modifier Line Item',NULL);
/*!40000 ALTER TABLE `StockModifierLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockModifierUnit`
--

DROP TABLE IF EXISTS `StockModifierUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockModifierUnit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockModifierID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockModifierUnit`
--

LOCK TABLES `StockModifierUnit` WRITE;
/*!40000 ALTER TABLE `StockModifierUnit` DISABLE KEYS */;
INSERT INTO `StockModifierUnit` VALUES (1,24,485),(2,24,367),(3,24,491),(4,19,129),(5,24,489);
/*!40000 ALTER TABLE `StockModifierUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockMoveOrder`
--

DROP TABLE IF EXISTS `StockMoveOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockMoveOrder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SourceID` varchar(10) DEFAULT NULL,
  `FromLocationID` int(11) NOT NULL DEFAULT '0',
  `ToLocationID` int(11) NOT NULL DEFAULT '0',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `Completed` datetime DEFAULT NULL,
  `AuthUserID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FromLocationID` (`FromLocationID`),
  KEY `ToLocationID` (`ToLocationID`),
  KEY `SourceID` (`SourceID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `AuthUserID` (`AuthUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockMoveOrder`
--

LOCK TABLES `StockMoveOrder` WRITE;
/*!40000 ALTER TABLE `StockMoveOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockMoveOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockMoveOrderLineItem`
--

DROP TABLE IF EXISTS `StockMoveOrderLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockMoveOrderLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockMoveOrderID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Quantity` decimal(9,3) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SourceID` (`SourceID`),
  KEY `ModifierID` (`ModifierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockMoveOrderLineItem`
--

LOCK TABLES `StockMoveOrderLineItem` WRITE;
/*!40000 ALTER TABLE `StockMoveOrderLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockMoveOrderLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockRule`
--

DROP TABLE IF EXISTS `StockRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockRule` (
  `ID` varchar(10) NOT NULL DEFAULT '',
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Notes` text,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SourceID` (`SourceID`),
  KEY `ModifierID` (`ModifierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockRule`
--

LOCK TABLES `StockRule` WRITE;
/*!40000 ALTER TABLE `StockRule` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockSheet`
--

DROP TABLE IF EXISTS `StockSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockSheet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Common_AuthUserID` int(11) NOT NULL DEFAULT '0',
  `Captured` datetime DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `Common_AuthUserID` (`Common_AuthUserID`),
  KEY `ST_USER_LOC` (`Common_AuthUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockSheet`
--

LOCK TABLES `StockSheet` WRITE;
/*!40000 ALTER TABLE `StockSheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockSheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockSheetLineItem`
--

DROP TABLE IF EXISTS `StockSheetLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockSheetLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockSheetID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StockSheetID` (`StockSheetID`)
) ENGINE=InnoDB AUTO_INCREMENT=23201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockSheetLineItem`
--

LOCK TABLES `StockSheetLineItem` WRITE;
/*!40000 ALTER TABLE `StockSheetLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockSheetLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockSubDepartment`
--

DROP TABLE IF EXISTS `StockSubDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockSubDepartment` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `StockCategoryID` varchar(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SourceID` varchar(10) NOT NULL DEFAULT '0',
  `ModifierID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockSubDepartment`
--

LOCK TABLES `StockSubDepartment` WRITE;
/*!40000 ALTER TABLE `StockSubDepartment` DISABLE KEYS */;
INSERT INTO `StockSubDepartment` VALUES (1,'Bottle','200ml','2011-02-02 08:52:06','0',0),(2,'Bottle','500ml','2011-02-02 08:52:12','0',0),(3,'Bottle','1lt','2011-02-02 08:52:32','0',0),(4,'Bottle','2lt','2011-02-02 08:52:40','0',0);
/*!40000 ALTER TABLE `StockSubDepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockTake`
--

DROP TABLE IF EXISTS `StockTake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockTake` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StockSheetID` int(11) DEFAULT NULL,
  `StockTakeType` varchar(20) NOT NULL DEFAULT 'FULL',
  `SortOrder` varchar(20) NOT NULL DEFAULT 'UNKN',
  `Completed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockTake`
--

LOCK TABLES `StockTake` WRITE;
/*!40000 ALTER TABLE `StockTake` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockTake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockTakeValues`
--

DROP TABLE IF EXISTS `StockTakeValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockTakeValues` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockTakeID` int(11) NOT NULL,
  `StockUnitID` int(11) NOT NULL,
  `StartQuantity` double NOT NULL DEFAULT '0',
  `Cost` decimal(9,5) NOT NULL DEFAULT '0.00000',
  `EndQuantity` double NOT NULL DEFAULT '0',
  `CountedQuantity` double NOT NULL DEFAULT '0',
  `LocationID` int(11) NOT NULL DEFAULT '0',
  `SubLocationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=139577 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockTakeValues`
--

LOCK TABLES `StockTakeValues` WRITE;
/*!40000 ALTER TABLE `StockTakeValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockTakeValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockTransaction`
--

DROP TABLE IF EXISTS `StockTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockTransaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `TransactionID` int(11) NOT NULL DEFAULT '0',
  `LocationID` int(11) DEFAULT NULL,
  `State` enum('Available','Work in Progress') NOT NULL DEFAULT 'Available',
  `Quantity` decimal(9,3) NOT NULL DEFAULT '0.000',
  `UnitCost` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `CostDate` datetime NOT NULL,
  `Description` varchar(20) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StockUnitID` (`StockUnitID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `LocationID` (`LocationID`),
  KEY `State` (`State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockTransaction`
--

LOCK TABLES `StockTransaction` WRITE;
/*!40000 ALTER TABLE `StockTransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockUnit`
--

DROP TABLE IF EXISTS `StockUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockUnit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(13) NOT NULL DEFAULT '',
  `Cost` double(15,5) DEFAULT NULL,
  `Price` double(15,5) DEFAULT NULL,
  `Deposit` enum('Y','N') NOT NULL DEFAULT 'N',
  `Sellable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Divisible` enum('Y','N') NOT NULL DEFAULT 'N',
  `Stockable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Type` enum('None','Container','Recipe','Batch','Bulk','Packaging') DEFAULT NULL,
  `UniqueUnit` enum('Y','N') NOT NULL DEFAULT 'N',
  `CommissionType` enum('Percentage','Amount') NOT NULL DEFAULT 'Percentage',
  `CommissionToHeadOffice` double(15,5) unsigned NOT NULL DEFAULT '0.00000',
  `ServiceFeeType` enum('Percentage','Amount') NOT NULL DEFAULT 'Amount',
  `ServiceFeeFromHeadOffice` double(15,5) unsigned NOT NULL DEFAULT '0.00000',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `BarCode` varchar(13) DEFAULT NULL,
  `Price2` double(15,5) DEFAULT NULL,
  `SOH_Cost` double(15,5) NOT NULL DEFAULT '0.00000',
  `SOH_Quantity` double(15,5) NOT NULL DEFAULT '0.00000',
  `BatchAmount` double(15,5) DEFAULT NULL,
  `PriceDiffNotRecovered` double(15,5) NOT NULL DEFAULT '0.00000',
  `StockUnitUpdated` datetime NOT NULL DEFAULT '2009-10-20 00:00:00',
  `StockReferalQuantity` double(15,5) NOT NULL DEFAULT '0.00000',
  `StockReferalQuantity2` double(15,5) NOT NULL DEFAULT '0.00000',
  `StockReferalQuantity3` double(15,5) NOT NULL DEFAULT '0.00000',
  `StockReferalID` int(11) NOT NULL DEFAULT '-1',
  `StockReferalID2` int(11) NOT NULL DEFAULT '-1',
  `StockReferalID3` int(11) NOT NULL DEFAULT '-1',
  `PreferedSupplierID` int(11) NOT NULL DEFAULT '-1',
  `LastCost` double(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StockID_Name` (`StockID`,`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StockID` (`StockID`),
  KEY `Sellable` (`Sellable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockUnit`
--

LOCK TABLES `StockUnit` WRITE;
/*!40000 ALTER TABLE `StockUnit` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockUpdates`
--

DROP TABLE IF EXISTS `StockUpdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockUpdates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockID` int(11) NOT NULL,
  `Modified` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockUpdates`
--

LOCK TABLES `StockUpdates` WRITE;
/*!40000 ALTER TABLE `StockUpdates` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockUpdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubLocation`
--

DROP TABLE IF EXISTS `SubLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubLocation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `IsDefault` int(11) NOT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SourceID` varchar(10) DEFAULT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `Active` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubLocation`
--

LOCK TABLES `SubLocation` WRITE;
/*!40000 ALTER TABLE `SubLocation` DISABLE KEYS */;
INSERT INTO `SubLocation` VALUES (2,0,'Dry Storage2',0,'2011-01-19 14:38:05','MANUAL',13,1),(3,0,'Cooler',0,'2011-01-10 13:49:11','MPL_1',13,1),(4,2,'Default',1,'2011-01-10 13:49:11','MPL_1',13,1),(5,1,'Default',1,'2011-01-10 13:49:11','MPL_1',13,1),(6,1,'Isle 1',0,'2011-01-10 13:59:56','MPL_1',13,1),(7,1,'Isle 2',0,'2011-01-10 13:49:11','MPL_1',13,1),(21,2,'tess',0,'2011-01-10 13:59:56','MPL_1',13,1),(22,1,'isle1',1,'2011-01-10 15:19:37','MPL_1',13,0),(23,9,'Default',1,'2011-01-11 07:42:02','MPL_1',13,0),(24,0,'my dry',0,'2011-01-19 14:38:10','0',13,1),(25,2,'testsss',0,'2011-01-28 10:29:23','MPL_1',13,0);
/*!40000 ALTER TABLE `SubLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelephoneOrders`
--

DROP TABLE IF EXISTS `TelephoneOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelephoneOrders` (
  `OpenSaleID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) DEFAULT NULL,
  `HomePhone` varchar(15) DEFAULT NULL,
  `CellPhone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OpenSaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelephoneOrders`
--

LOCK TABLES `TelephoneOrders` WRITE;
/*!40000 ALTER TABLE `TelephoneOrders` DISABLE KEYS */;
/*!40000 ALTER TABLE `TelephoneOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Terminals`
--

DROP TABLE IF EXISTS `Terminals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Terminals` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `IPAddress` varchar(25) NOT NULL,
  `StateFlag` int(11) NOT NULL,
  `Active` int(11) NOT NULL DEFAULT '1',
  `Stage1` varchar(1) NOT NULL,
  `Stage2` varchar(1) NOT NULL,
  `Stage3` varchar(1) NOT NULL,
  `PosNo` int(11) NOT NULL,
  `Database` varchar(200) NOT NULL DEFAULT 'Terminal_FMCG',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Terminals`
--

LOCK TABLES `Terminals` WRITE;
/*!40000 ALTER TABLE `Terminals` DISABLE KEYS */;
INSERT INTO `Terminals` VALUES (1,'Lane 1','10.240.12.48',0,1,'Y','Y','Y',1,'Terminal_FMCG');
/*!40000 ALTER TABLE `Terminals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Terms`
--

DROP TABLE IF EXISTS `Terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Terms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Type` enum('Standard','DateBased') NOT NULL DEFAULT 'Standard',
  `NetDueDay` int(11) DEFAULT '0',
  `Discount` int(11) DEFAULT '0',
  `DiscountDay` int(11) DEFAULT '0',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Terms`
--

LOCK TABLES `Terms` WRITE;
/*!40000 ALTER TABLE `Terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `Terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `Common_AuthUserID` int(11) NOT NULL DEFAULT '0',
  `Common_TerminalID` int(11) DEFAULT NULL,
  `TransactionTypeID` char(2) NOT NULL DEFAULT '',
  `ReferenceID` varchar(20) DEFAULT NULL,
  `Description` tinytext,
  `Flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `Period` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `Reversed` enum('Y','N') NOT NULL DEFAULT 'N',
  `ExportFlag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `Date` (`Date`),
  KEY `Common_AuthUserID` (`Common_AuthUserID`),
  KEY `TransactionTypeID_ReferenceID` (`TransactionTypeID`,`ReferenceID`),
  KEY `Flag` (`Flag`),
  KEY `Reversed` (`Reversed`),
  KEY `Period` (`Period`),
  KEY `TransactionTypeID` (`TransactionTypeID`),
  KEY `Imported` (`ExportFlag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionType`
--

DROP TABLE IF EXISTS `TransactionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransactionType` (
  `ID` char(2) NOT NULL DEFAULT '',
  `Name` varchar(20) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionType`
--

LOCK TABLES `TransactionType` WRITE;
/*!40000 ALTER TABLE `TransactionType` DISABLE KEYS */;
INSERT INTO `TransactionType` VALUES ('AT','Transfer','2002-08-27 14:17:59',NULL,'OMC'),('CP','Customer Payment','2002-08-27 14:17:59',NULL,'OMC'),('CS','Sale','2002-08-27 14:17:59',NULL,'OMC'),('CU','Cashup','2002-08-27 14:17:59',NULL,'OMC'),('EP','Payment','2002-08-27 14:17:59',NULL,'OMC'),('HO','Headoffice order','2002-08-27 14:17:59',NULL,'OMC'),('MO','Manufactured order','2002-08-27 14:17:59',NULL,'OMC'),('OA','Open Account','2002-08-27 14:17:59',NULL,'OMC'),('OM','OM Order','2002-10-31 15:23:53',503,'BIO'),('OR','OM Receive','2002-10-31 15:23:42',NULL,'BIO'),('PR','Purchase Return','2002-08-27 14:17:59',NULL,'OMC'),('PU','Purchase','2002-08-27 14:17:59',NULL,'OMC'),('RF','Float','2002-08-27 14:17:59',NULL,'OMC'),('RM','Raw materials','2002-08-27 14:17:59',NULL,'OMC'),('RV','Rev','2002-08-27 14:17:59',NULL,'OMC'),('SA','Adj','2002-08-27 14:17:59',NULL,'OMC'),('SB','Subs','2002-08-27 14:17:59',NULL,'OMC'),('SC','Stock Conversion','2003-06-12 09:14:12',NULL,NULL),('SM','Movement','2002-08-27 14:17:59',NULL,'OMC'),('SR','Sale Return','2002-08-27 14:17:59',NULL,'OMC'),('ST','Stocktake','2002-08-27 14:17:59',NULL,'OMC'),('TC','Till cashup','2002-08-27 14:17:59',NULL,'OMC'),('VP','Vendor payment','2002-08-27 14:17:59',NULL,'OMC');
/*!40000 ALTER TABLE `TransactionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UpdateAvail`
--

DROP TABLE IF EXISTS `UpdateAvail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UpdateAvail` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UpdateComponent` varchar(200) NOT NULL,
  `LastUpdateRecived` datetime NOT NULL,
  `Busy` int(11) NOT NULL DEFAULT '0',
  `LastUpdatedID` int(11) NOT NULL,
  `LastUpdatedIDLocal` int(11) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UpdateAvail`
--

LOCK TABLES `UpdateAvail` WRITE;
/*!40000 ALTER TABLE `UpdateAvail` DISABLE KEYS */;
INSERT INTO `UpdateAvail` VALUES (1,'Stock','2012-10-06 15:06:46',2,-1,-1),(2,'Account','1982-08-27 00:00:00',0,0,0),(3,'DBVersion','2012-11-26 22:40:25',0,453,255),(4,'WaiterOMR','1982-08-27 00:00:00',0,-1,-1),(5,'OrderNumber','1982-08-27 00:00:00',0,46,0),(6,'Locations','1982-08-27 00:00:00',0,0,0),(7,'SubLocation','1982-08-27 00:00:00',0,0,0),(8,'Modifiers','1982-08-27 00:00:00',0,-1,0);
/*!40000 ALTER TABLE `UpdateAvail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `UpdatedStock`
--

DROP TABLE IF EXISTS `UpdatedStock`;
/*!50001 DROP VIEW IF EXISTS `UpdatedStock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `UpdatedStock` (
  `BarCode` tinyint NOT NULL,
  `Deposit` tinyint NOT NULL,
  `Category` tinyint NOT NULL,
  `CategoryType` tinyint NOT NULL,
  `Code` tinyint NOT NULL,
  `COSAccount` tinyint NOT NULL,
  `Cost` tinyint NOT NULL,
  `IncomeAccount` tinyint NOT NULL,
  `IsExtra` tinyint NOT NULL,
  `IsFindable` tinyint NOT NULL,
  `IsSellable` tinyint NOT NULL,
  `Location` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Price` tinyint NOT NULL,
  `PrintLocation` tinyint NOT NULL,
  `ProductProcessType` tinyint NOT NULL,
  `Quantity` tinyint NOT NULL,
  `SaleLocation` tinyint NOT NULL,
  `SOHQuantity` tinyint NOT NULL,
  `StockID` tinyint NOT NULL,
  `SubLocation` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `UnitType` tinyint NOT NULL,
  `VatPercentage` tinyint NOT NULL,
  `StockUnitID` tinyint NOT NULL,
  `HasModifiers` tinyint NOT NULL,
  `StockModified` tinyint NOT NULL,
  `UID` tinyint NOT NULL,
  `UpdateComponent` tinyint NOT NULL,
  `LastUpdateRecived` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Updates_Location`
--

DROP TABLE IF EXISTS `Updates_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_Location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_Location`
--

LOCK TABLES `Updates_Location` WRITE;
/*!40000 ALTER TABLE `Updates_Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Updates_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Updates_PayoutReasons`
--

DROP TABLE IF EXISTS `Updates_PayoutReasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_PayoutReasons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PayoutReasonID` int(11) DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_PayoutReasons`
--

LOCK TABLES `Updates_PayoutReasons` WRITE;
/*!40000 ALTER TABLE `Updates_PayoutReasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `Updates_PayoutReasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Updates_StockCategory`
--

DROP TABLE IF EXISTS `Updates_StockCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_StockCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockCategoryID` varchar(45) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `SourceID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_StockCategory`
--

LOCK TABLES `Updates_StockCategory` WRITE;
/*!40000 ALTER TABLE `Updates_StockCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Updates_StockCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Updates_StockMainCategory`
--

DROP TABLE IF EXISTS `Updates_StockMainCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_StockMainCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StockMainCategoryID` varchar(45) DEFAULT NULL,
  `ModifiedID` int(11) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_StockMainCategory`
--

LOCK TABLES `Updates_StockMainCategory` WRITE;
/*!40000 ALTER TABLE `Updates_StockMainCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Updates_StockMainCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Updates_SubLocation`
--

DROP TABLE IF EXISTS `Updates_SubLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_SubLocation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SubLocationID` int(11) DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_SubLocation`
--

LOCK TABLES `Updates_SubLocation` WRITE;
/*!40000 ALTER TABLE `Updates_SubLocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Updates_SubLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Updates_VAT`
--

DROP TABLE IF EXISTS `Updates_VAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_VAT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VatID` int(11) DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_VAT`
--

LOCK TABLES `Updates_VAT` WRITE;
/*!40000 ALTER TABLE `Updates_VAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `Updates_VAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Updates_VoidReason`
--

DROP TABLE IF EXISTS `Updates_VoidReason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_VoidReason` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VoidReasonID` int(11) DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_VoidReason`
--

LOCK TABLES `Updates_VoidReason` WRITE;
/*!40000 ALTER TABLE `Updates_VoidReason` DISABLE KEYS */;
/*!40000 ALTER TABLE `Updates_VoidReason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Updates_WaiterOMRConfig`
--

DROP TABLE IF EXISTS `Updates_WaiterOMRConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Updates_WaiterOMRConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ModifiedBy` int(11) DEFAULT NULL,
  `Modified` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Updates_WaiterOMRConfig`
--

LOCK TABLES `Updates_WaiterOMRConfig` WRITE;
/*!40000 ALTER TABLE `Updates_WaiterOMRConfig` DISABLE KEYS */;
INSERT INTO `Updates_WaiterOMRConfig` VALUES (1,0,'2012-06-15 20:51:25','POSC'),(2,0,'2012-07-10 14:02:01','POSC'),(3,0,'2012-07-12 15:37:49','POSC');
/*!40000 ALTER TABLE `Updates_WaiterOMRConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `UserInfo`
--

DROP TABLE IF EXISTS `UserInfo`;
/*!50001 DROP VIEW IF EXISTS `UserInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `UserInfo` (
  `ID` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `WaiterNum` tinyint NOT NULL,
  `PasswordClear` tinyint NOT NULL,
  `ModeEnabled` tinyint NOT NULL,
  `Commission` tinyint NOT NULL,
  `ZRunState` tinyint NOT NULL,
  `TelNo` tinyint NOT NULL,
  `Address` tinyint NOT NULL,
  `GroupID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `User_Attribute`
--

DROP TABLE IF EXISTS `User_Attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Attribute` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UserAttributeName` varchar(100) NOT NULL,
  `UserAttributeDescription` varchar(100) NOT NULL,
  `Modified` datetime NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `SourceID` varchar(10) NOT NULL,
  `Active` enum('YES','NO') NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=3007 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Attribute`
--

LOCK TABLES `User_Attribute` WRITE;
/*!40000 ALTER TABLE `User_Attribute` DISABLE KEYS */;
INSERT INTO `User_Attribute` VALUES (1,'EditUser','Edit Cost','2012-07-19 15:35:23',1,'1','YES'),(2,'CreateUser','Create User','2012-07-19 15:35:23',1,'1','YES'),(3,'CreateAccountDebit','Create a new debtors account','2012-07-19 15:35:23',1,'1','YES'),(4,'EditAccountDebit','Edit a exsisting debtors account','2012-07-19 15:35:23',1,'1','YES'),(5,'SetAccountLimitDebit','Change the Limit of a creditors account','2012-07-19 15:35:23',1,'1','YES'),(6,'LoadModule_DebtorAccount','User Rights to load the module : Debtor Accou','2012-07-19 15:35:23',1,'1','YES'),(7,'LoadModule_CreditorAccount','User Rights to load the module Creditors acco','2012-07-19 15:35:23',1,'1','YES'),(8,'CreateAccountCredit','User Rights to create a new Creditors account','2012-07-19 15:35:23',1,'1','YES'),(9,'EditAccountCredit','User Rights to edit a exsisting creditors acc','2012-07-19 15:35:23',1,'1','YES'),(10,'SetAccountLimitCredit','Change the limit of a credtors account','2012-07-19 15:35:23',1,'1','YES'),(11,'LoadModule_UserAdministration','User Rights to load the User Administration M','2012-07-19 15:35:23',1,'1','YES'),(12,'User_AssignRole','Rights to assign a role to a user','2012-07-19 15:35:23',1,'1','YES'),(13,'User_RemoveRole','Rights to remove a role from a user','2012-07-19 15:35:23',1,'1','YES'),(14,'LoadModule_UserRoleAdministration','User Rights to load the User Role Adminstrati','2012-07-19 15:35:23',1,'1','YES'),(15,'LoadModule_UserClassAdministration','User Rights to load the User Class adminstrat','2012-07-19 15:35:23',1,'1','YES'),(16,'UserAssignClass','User Rights to assign a class to a role','2012-07-19 15:35:23',1,'1','YES'),(17,'UserRemoveClass','User Rights to Remove a class from a role','2012-07-19 15:35:23',1,'1','YES'),(18,'UserAssignAttribute','User Rights to Assign a Attribute to an class','2012-07-19 15:35:23',1,'1','YES'),(19,'UserRemoveAttribute','User Rights to remove a Attirbute from a clas','2012-07-19 15:35:23',1,'1','YES'),(20,'CreateClass','User Rights to Create an User Class','2012-07-19 15:35:23',1,'1','YES'),(21,'EditClass','User Rights to Edit an exsisting Class','2012-07-19 15:35:23',1,'1','YES'),(22,'EditRole','User Rights to Edit an exsisting user Role','2012-07-19 15:35:23',1,'1','YES'),(23,'CreateRole','User Rights to create a new User Role','2012-07-19 15:35:23',1,'1','YES'),(24,'LoadModule_LocationEdit','User Rights to load the Location Edit module','2012-07-19 15:35:23',1,'1','YES'),(25,'CreateLocation','User Rights to Create a new Location','2012-07-19 15:35:23',1,'1','YES'),(26,'EditLocation','User Rights to Edit a exsisting Location','2012-07-19 15:35:23',1,'1','YES'),(27,'DeleteLocation','User Rights to remove a exsisting Location','2012-07-19 15:35:23',1,'1','YES'),(28,'CreateSubLocation','','2012-07-19 15:35:23',1,'1','YES'),(29,'EditSubLocation','','2012-07-19 15:35:23',1,'1','YES'),(30,'POS_EndShift','Allow user to do an End Shift','2012-07-19 15:35:23',504,'MANUAL','YES'),(31,'DeleteSubLocation','','2012-07-19 15:35:23',1,'1','YES'),(32,'LoadModule_AccountOverviewReport','','2012-07-19 15:35:23',1,'1','YES'),(33,'LoadModule_StockSummaryReport','User Rights To load Module Stock Summary Repo','2012-07-19 15:35:23',1,'1','YES'),(34,'LoadModule_StockSheetSummary','','2012-07-19 15:35:23',1,'1','YES'),(35,'LoadModule_ReportNegativeStock','','2012-07-19 15:35:23',1,'1','YES'),(36,'LoadModule_AccountEdit','User Rights to load module Account Edit','2012-07-19 15:35:23',1,'1','YES'),(37,'LoadModule_LoadNewPurchaseOrder','User Rights to load new Purchase order','2012-07-19 15:35:23',1,'1','YES'),(38,'LoadModule_ReportCreditorsInvoice','User Rights to load the Creditors Invoice rep','2012-07-19 15:35:23',1,'1','YES'),(39,'LoadModule_Registration','','2012-07-19 15:35:23',1,'1','YES'),(40,'LoadModule_OpmindControls','','2012-07-19 15:35:23',1,'1','YES'),(41,'LoadModule_StockTakeStartStop','','2012-07-19 15:35:23',1,'1','YES'),(42,'LoadModule_StockTakeCaptureReport','','2012-07-19 15:35:23',1,'1','YES'),(43,'LoadModule_VoidReport','','2012-07-19 15:35:23',1,'1','YES'),(44,'LoadModule_InvoiceCapture','','2012-07-19 15:35:23',1,'1','YES'),(45,'LoadModule_CreditNotes','','2012-07-19 15:35:23',1,'1','YES'),(46,'LoadModule_CSVImport','','2012-07-19 15:35:23',1,'1','YES'),(47,'LoadModule_ReportSummary','','2012-07-19 15:35:23',1,'1','YES'),(48,'LoadModule_StockMovement','','2012-07-19 15:35:23',1,'1','YES'),(49,'LoadModule_CapturePurchaseOrder','','2012-07-19 15:35:23',1,'1','YES'),(50,'LoadModule_CategoriesEdit','','2012-07-19 15:35:23',1,'1','YES'),(51,'LoadModule_StockIssue','','2012-07-19 15:35:23',1,'1','YES'),(52,'LoadModule_ReportHourlySales','','2012-07-19 15:35:23',1,'1','YES'),(53,'LoadModule_Customise_Menu','','2012-07-19 15:35:23',1,'1','YES'),(54,'LoadModule_BussinessdDetail','','2012-07-19 15:35:23',1,'1','YES'),(55,'LoadModule_StockSheetEdit','','2012-07-19 15:35:23',0,'1','YES'),(56,'LoadModule_EditMainCategory','','2012-07-19 15:35:23',0,'','YES'),(57,'LoadModule_InvoiceCaptureNew','','2012-07-19 15:35:23',0,'','YES'),(58,'LoadModule_StockTakeStartStop','','2012-07-19 15:35:23',0,'','YES'),(59,'LoadModule_GenerateStockSheets','','2012-07-19 15:35:23',0,'','YES'),(60,'LoadModule_StockSubDepartmentEdit','','2012-07-19 15:35:23',0,'','YES'),(61,'LoadModule_StockAdjustment','','2012-07-19 15:35:23',0,'','YES'),(62,'POSController_Quit','User Rights to Quit the PoS Controller','2012-07-19 15:35:23',0,'','YES'),(63,'LoadModule_SubStockEdit','','2012-07-19 15:35:23',0,'','YES'),(64,'LoadModule_ReportSalesByDepartment','','2012-07-19 15:35:23',0,'','YES'),(65,'LoadModule_RecipeEdit','','2012-07-19 15:35:23',0,'','YES'),(66,'LoadModule_RunDayEnd','','2012-07-19 15:35:23',0,'','YES'),(67,'LoadModule_SubDepartmentStockAssociation','','2012-07-19 15:35:23',0,'','YES'),(68,'LoadModule_Cashup','','2012-07-19 15:35:23',0,'','YES'),(69,'CashUp_SeeAllCashierShifts','','2012-07-19 15:35:23',0,'','YES'),(70,'Cashup_NonBlindCashup','User May see the theoretical totals and diffe','2012-07-19 15:35:23',0,'','YES'),(71,'Cashup_EditCashups','User May Edit Cashups that are already declar','2012-07-19 15:35:23',0,'','YES'),(72,'Cashup_SaveIfUnbalanced','User May  Declare even if they are out by mor','2012-07-19 15:35:23',0,'','YES'),(73,'Cashup_ParkCashup','User May park cashup if he canot balance','2012-07-19 15:35:23',0,'','YES'),(74,'LoadModule_StockEdit','','2012-07-19 15:35:23',0,'','YES'),(75,'LoadModule_RTVNew','','2012-07-19 15:35:23',0,'','YES'),(76,'LoadModule_RTV','','2012-07-19 15:35:23',0,'','YES'),(77,'LoadModule_ImportStockTake','','2012-07-19 15:35:23',0,'','YES'),(78,'LoadModule_ConsolidatedCashup','User rights to load and print the consolidate','2012-07-19 15:35:23',0,'','YES'),(79,'POS_NoSale','Allow the User to Kick the till','2012-07-19 15:35:23',0,'','YES'),(80,'POS_Payout','Allow the user to do payouts','2012-07-19 15:35:23',0,'','YES'),(81,'LoadModule_CreditorsAuditTrail','Allow user to load the CreditorsAuditTrail mo','2012-07-19 15:35:23',0,'','YES'),(82,'POS_CashDrop','Allow User to do cash drops','2012-07-19 15:35:23',0,'','YES'),(83,'POS_ItemLookup','Allow User to do an item','2012-07-19 15:35:23',0,'','YES'),(84,'POS_VoidLast','Allow User to void last Item','2012-07-19 15:35:23',0,'','YES'),(85,'POS_VoidMultiple','Allow User to void Multiple Items','2012-07-19 15:35:23',0,'','YES'),(86,'POS_ChangeItemPrice','Allow the User to change the price of the ite','2012-07-19 15:35:23',0,'','YES'),(87,'POS_ChangeLinePrice','Allow the User to change the price for the it','2012-07-19 15:35:23',0,'','YES'),(88,'POS_Quit','Allow user to quit the pos','2012-07-19 15:35:23',0,'','YES'),(89,'POS_VoidSale','Allow the user to void an sale','2012-07-19 15:35:23',0,'','YES'),(90,'DayEnd_RunDayEnd','Allow user to do a Day End Run','2012-07-19 15:35:23',0,'','YES'),(91,'POS_ReprintBill','Allow the user to reprint bills','2012-07-19 15:35:23',0,'','YES'),(92,'LoadModule_StockEditStore','Allow the user to modify stock at store level','2012-07-19 15:35:23',0,'','YES'),(93,'StockTake_Commit','Allow a user to commit a stocktake','2012-07-19 15:35:23',0,'','YES'),(94,'LoadModule_MobileStockTake','LoadModule_MobileStockTake','2012-07-19 15:35:23',0,'','YES'),(95,'LoadModule_GPDrillDown','Allow user to load the drill down GP report','2012-07-19 15:35:23',0,'','YES'),(96,'LoadModule_PurgePurchaseOrders','Allow user to load the Purge Purchase orders ','2012-07-19 15:35:23',0,'','YES'),(97,'LoadModule_DormantStockReport','Allow user to load the Dormant Stock Report','2012-07-19 15:35:23',0,'','YES'),(98,'StockTakeCapture_View_SOH','Allow user to view the current Stock on hand ','2012-07-19 15:35:23',0,' ','YES'),(99,'PurgePurchaseOrder_DeletePurchaseOrders','Allow user to delete selected purchase orders','2012-07-19 15:35:23',0,'','YES'),(100,'LoadModule_tmp','','2012-07-19 15:35:23',0,'','YES'),(101,'LoadModule_POSAuditTrail','Allow user to load POS audit Trail','2012-07-19 15:35:23',0,'','YES'),(102,'GRV_AllowNegativeGP','Allow item to sell at Negative or Zero GP','2012-07-19 15:35:23',503,'MANUAL','YES'),(103,'LoadModule_CreditorAgeAnalysis','Allow user to load creditors age analysis rep','2012-07-19 15:35:23',503,'MANUAL','YES'),(104,'LoadModule_CreditorsPayment','Allow user to load module to pay a creditor','2012-07-19 15:35:23',504,'manual','YES'),(105,'LoadModule_DiscountReport','Allow user to load Discount Report','2012-07-19 15:35:23',504,'MANUAL','YES'),(106,'LoadModule_BranchTransfers','Allow user to load module Branch Transfers','2012-07-19 15:35:23',504,'MANUAL','YES'),(107,'LoadModule_RefundReport','Allow user to load refund report','2012-07-19 15:35:23',504,'MANUAL','YES'),(108,'LoadModule_PayoutReport','Allow user to load Payout Report','2012-07-19 15:35:23',504,'MANUAL','YES'),(109,'POS_AccountLookup','Allow user to do a account lookup','2012-07-19 15:35:23',504,'MANUAL','YES'),(110,'POS_PayAccount','Allow user to do a account lookup','2012-07-19 15:35:23',504,'MANUAL','YES'),(111,'HeadController_Quit','','2012-07-19 15:35:23',0,'','YES'),(112,'POS_ChangeItemPriceSpecial','Allow the user to change the item weight and ','2012-07-19 15:35:23',0,'','YES'),(113,'POS_Login','Allow the user to login to the POS','2012-07-19 15:35:23',0,'','YES'),(114,'POS_Discount','Allow the user to discount items','2012-07-19 15:35:23',0,'','YES'),(115,'LoadModule_ImportGRV','Allow user to load module to import GRV From ','2012-07-19 15:35:23',503,'MANUAL','YES'),(116,'LoadModule_ConfigEdit','Allow user to edit config','2012-07-19 15:35:23',504,'MANUAL','YES'),(117,'LoadModule_PreviewDayEnd','Allow user to preview Day end','2012-07-19 15:35:23',504,'MANUAL','YES'),(118,'LoadModule_PreviewMonthEnd','Allow user to preview month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(119,'LoadModule_PreviousDayEnd','Allow user to view previous dayend','2012-07-19 15:35:23',504,'MANUAL','YES'),(120,'LoadModule_PreviousMonthEnd','Allow user to view previous month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(121,'Month_RunMonthEnd','Allow user to run a month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(122,'LoadModule_RunMonthEnd','Allow user to run a month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(123,'LoadModule_ConfigEdit','Allow user to edit config','2012-07-19 15:35:23',504,'MANUAL','YES'),(124,'LoadModule_PreviewDayEnd','Allow user to preview Day end','2012-07-19 15:35:23',504,'MANUAL','YES'),(125,'LoadModule_PreviewMonthEnd','Allow user to preview month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(126,'LoadModule_PreviousDayEnd','Allow user to view previous dayend','2012-07-19 15:35:23',504,'MANUAL','YES'),(127,'LoadModule_PreviousMonthEnd','Allow user to view previous month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(128,'Month_RunMonthEnd','Allow user to run a month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(129,'LoadModule_RunMonthEnd','Allow user to run a month end','2012-07-19 15:35:23',504,'MANUAL','YES'),(130,'LoadModule_SalesByTerminal','Allow User to load module to see Sales by Ter','2012-07-19 15:35:23',504,'MANUAL','YES'),(131,'LoadModule_CreditorsJournal','Allow User to load module to see Creditors ','2012-07-19 15:35:23',504,'MANUAL','YES'),(132,'LoadModule_AverageCostAdjustment','Allow User to load module to see Average Cost','2012-07-19 15:35:23',504,'MANUAL','YES'),(133,'AverageCostChange_AllowChange','Allow user to change the Average Cost of a St','2012-07-19 15:35:23',504,'MANUAL','YES'),(134,'POS_SplitBill','Allow user to use Splitbill','2012-07-19 15:35:23',504,'MANUAL','YES'),(135,'POS_OpenItem','Allow user to use Open Items','2012-07-19 15:35:23',504,'MANUAL','YES'),(136,'POS_Manager','This user is an Manager on the restaunt POS','2012-07-19 15:35:23',504,'MANUAL','YES'),(137,'POS_Transfer','Allow user to use Transfers','2012-07-19 15:35:23',504,'MANUAL','YES'),(138,'POS_ViewAllTables','Allow user to view all waiter tables','2012-07-19 15:35:23',504,'MANUAL','YES'),(139,'POS_CanDoReturn','Allow user to do returns','2012-07-19 15:35:23',504,'MANUAL','YES'),(140,'POS_CancelOrder','Allow user to cancel an order','2012-07-19 15:35:23',504,'MANUAL','YES');
/*!40000 ALTER TABLE `User_Attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Class`
--

DROP TABLE IF EXISTS `User_Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Class` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UserClassName` varchar(100) NOT NULL,
  `UserClassDescription` varchar(100) NOT NULL,
  `Modified` datetime NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `SourceID` varchar(10) NOT NULL,
  `Active` enum('YES','NO') NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Class`
--

LOCK TABLES `User_Class` WRITE;
/*!40000 ALTER TABLE `User_Class` DISABLE KEYS */;
INSERT INTO `User_Class` VALUES (12,'Admin','Admin','2012-07-19 15:35:23',13,'MPL_17','YES'),(13,'Minimal Righs','Only Login','2012-07-19 15:35:23',13,'MPL_11','YES'),(14,'NONE','NONE','2012-07-19 15:35:23',13,'MPL_11','YES'),(15,'Head Cashier Responsibilities','Head Cashier Responsibilities','2012-07-19 15:35:23',13,'MPL_11','YES'),(16,'Cashier','Cashier','2012-07-19 15:35:23',13,'MPL_17','YES'),(17,'Cashier Manager','Cashier Manager','2012-07-19 15:35:23',13,'MPL_11','YES'),(18,'View ALL','View ALL','2012-07-19 15:35:23',13,'MPL_17','YES'),(19,'POS','Pos test role','2012-07-19 15:35:23',13,'MPL_17','YES'),(20,'POS_ALL','POS_ALL','2012-07-19 15:35:23',13,'MPL_17','YES'),(21,'TMP','TMP','2012-07-19 15:35:23',13,'MPL_17','YES'),(22,'Cashier Sales','Cashier Sales','2012-07-19 15:35:23',13,'MPL_17','YES'),(23,'POS Supervisor Jnr','POS Supervisor Jnr','2012-07-19 15:35:23',13,'MPL_17','YES'),(24,'Stock Jnr','Stock Jnr','2012-07-19 15:35:23',13,'MPL_17','YES'),(25,'Stock Snr','Stock Snr','2012-07-19 15:35:23',13,'MPL_17','YES'),(26,'Creditors Snr','Creditors Snr','2012-07-19 15:35:23',13,'MPL_17','YES'),(27,'Creditors Jnr','Creditors Jnr','2012-07-19 15:35:23',13,'MPL_17','YES'),(28,'Debtors Jnr','Debtors Jnr','2012-07-19 15:35:23',13,'MPL_17','YES'),(29,'Debtors Snr','Debtors Snr','2012-07-19 15:35:23',13,'MPL_17','YES'),(30,'Banking Snr','Banking Snr','2012-07-19 15:35:23',13,'MPL_17','YES'),(31,'Banking Jnr','Banking Jnr','2012-07-19 15:35:23',13,'MPL_17','YES'),(32,'Day-end','Day-end','2012-07-19 15:35:23',13,'MPL_17','YES'),(33,'Stock Head Office Snr','Stock Head Office Snr','2012-07-19 15:35:23',13,'MPL_17','YES'),(34,'POS Supervisor Snr','POS Supervisor Snr','2012-07-19 15:35:23',13,'MPL_17','YES'),(35,'Store Admin','Store Admin','2012-07-19 15:35:23',13,'MPL_17','YES'),(36,'Preview','Preview','2012-07-19 15:35:23',13,'MPL_17','YES');
/*!40000 ALTER TABLE `User_Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_ClassHasAttribute`
--

DROP TABLE IF EXISTS `User_ClassHasAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_ClassHasAttribute` (
  `ClassID` int(11) NOT NULL,
  `AttributeID` int(11) NOT NULL,
  `Modified` datetime NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `SourceId` varchar(30) NOT NULL,
  PRIMARY KEY (`ClassID`,`AttributeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_ClassHasAttribute`
--

LOCK TABLES `User_ClassHasAttribute` WRITE;
/*!40000 ALTER TABLE `User_ClassHasAttribute` DISABLE KEYS */;
INSERT INTO `User_ClassHasAttribute` VALUES (12,1,'2012-07-19 15:35:24',13,'MPL_17'),(12,2,'2012-07-19 15:35:24',13,'MPL_17'),(12,3,'2012-07-19 15:35:24',13,'MPL_17'),(12,4,'2012-07-19 15:35:24',13,'MPL_17'),(12,5,'2012-07-19 15:35:24',13,'MPL_17'),(12,6,'2012-07-19 15:35:24',13,'MPL_17'),(12,7,'2012-07-19 15:35:24',13,'MPL_17'),(12,8,'2012-07-19 15:35:24',13,'MPL_17'),(12,9,'2012-07-19 15:35:24',13,'MPL_17'),(12,10,'2012-07-19 15:35:24',13,'MPL_17'),(12,11,'2012-07-19 15:35:24',13,'MPL_17'),(12,12,'2012-07-19 15:35:24',13,'MPL_17'),(12,13,'2012-07-19 15:35:24',13,'MPL_17'),(12,14,'2012-07-19 15:35:24',13,'MPL_17'),(12,15,'2012-07-19 15:35:24',13,'MPL_17'),(12,16,'2012-07-19 15:35:24',13,'MPL_17'),(12,17,'2012-07-19 15:35:24',13,'MPL_17'),(12,18,'2012-07-19 15:35:24',13,'MPL_17'),(12,19,'2012-07-19 15:35:24',13,'MPL_17'),(12,20,'2012-07-19 15:35:24',13,'MPL_17'),(12,21,'2012-07-19 15:35:24',13,'MPL_17'),(12,22,'2012-07-19 15:35:24',13,'MPL_17'),(12,23,'2012-07-19 15:35:24',13,'MPL_17'),(12,24,'2012-07-19 15:35:24',13,'MPL_17'),(12,25,'2012-07-19 15:35:24',13,'MPL_17'),(12,26,'2012-07-19 15:35:24',13,'MPL_17'),(12,27,'2012-07-19 15:35:24',13,'MPL_17'),(12,28,'2012-07-19 15:35:24',13,'MPL_17'),(12,29,'2012-07-19 15:35:24',13,'MPL_17'),(12,30,'2012-07-19 15:35:24',13,'MPL_17'),(12,31,'2012-07-19 15:35:24',13,'MPL_17'),(12,32,'2012-07-19 15:35:24',13,'MPL_17'),(12,33,'2012-07-19 15:35:24',13,'MPL_17'),(12,34,'2012-07-19 15:35:24',13,'MPL_17'),(12,35,'2012-07-19 15:35:24',13,'MPL_17'),(12,36,'2012-07-19 15:35:24',13,'MPL_17'),(12,37,'2012-07-19 15:35:24',13,'MPL_17'),(12,38,'2012-07-19 15:35:24',13,'MPL_17'),(12,39,'2012-07-19 15:35:24',13,'MPL_17'),(12,40,'2012-07-19 15:35:24',13,'MPL_17'),(12,41,'2012-07-19 15:35:24',13,'MPL_17'),(12,42,'2012-07-19 15:35:24',13,'MPL_17'),(12,43,'2012-07-19 15:35:24',13,'MPL_17'),(12,44,'2012-07-19 15:35:24',13,'MPL_17'),(12,45,'2012-07-19 15:35:24',13,'MPL_17'),(12,46,'2012-07-19 15:35:24',13,'MPL_17'),(12,47,'2012-07-19 15:35:24',13,'MPL_17'),(12,48,'2012-07-19 15:35:24',13,'MPL_17'),(12,49,'2012-07-19 15:35:24',13,'MPL_17'),(12,50,'2012-07-19 15:35:24',13,'MPL_17'),(12,51,'2012-07-19 15:35:24',13,'MPL_17'),(12,52,'2012-07-19 15:35:24',13,'MPL_17'),(12,53,'2012-07-19 15:35:24',13,'MPL_17'),(12,54,'2012-07-19 15:35:24',13,'MPL_17'),(12,55,'2012-07-19 15:35:24',13,'MPL_17'),(12,56,'2012-07-19 15:35:24',13,'MPL_17'),(12,57,'2012-07-19 15:35:24',13,'MPL_17'),(12,58,'2012-07-19 15:35:24',13,'MPL_17'),(12,59,'2012-07-19 15:35:24',13,'MPL_17'),(12,60,'2012-07-19 15:35:24',13,'MPL_17'),(12,61,'2012-07-19 15:35:24',13,'MPL_17'),(12,62,'2012-07-19 15:35:24',13,'MPL_17'),(12,63,'2012-07-19 15:35:24',13,'MPL_17'),(12,64,'2012-07-19 15:35:24',13,'MPL_17'),(12,65,'2012-07-19 15:35:24',13,'MPL_17'),(12,66,'2012-07-19 15:35:24',13,'MPL_17'),(12,67,'2012-07-19 15:35:24',13,'MPL_17'),(12,68,'2012-07-19 15:35:24',13,'MPL_17'),(12,69,'2012-07-19 15:35:24',13,'MPL_17'),(12,70,'2012-07-19 15:35:24',13,'MPL_17'),(12,71,'2012-07-19 15:35:24',13,'MPL_17'),(12,72,'2012-07-19 15:35:24',13,'MPL_17'),(12,73,'2012-07-19 15:35:24',13,'MPL_17'),(12,74,'2012-07-19 15:35:24',13,'MPL_17'),(12,75,'2012-07-19 15:35:24',13,'MPL_17'),(12,76,'2012-07-19 15:35:24',13,'MPL_17'),(12,77,'2012-07-19 15:35:24',13,'MPL_17'),(12,78,'2012-07-19 15:35:24',13,'MPL_17'),(12,79,'2012-07-19 15:35:24',13,'MPL_17'),(12,80,'2012-07-19 15:35:24',13,'MPL_17'),(12,81,'2012-07-19 15:35:24',13,'MPL_17'),(12,82,'2012-07-19 15:35:24',13,'MPL_17'),(12,83,'2012-07-19 15:35:24',13,'MPL_17'),(12,84,'2012-07-19 15:35:24',13,'MPL_17'),(12,85,'2012-07-19 15:35:24',13,'MPL_17'),(12,86,'2012-07-19 15:35:24',13,'MPL_17'),(12,87,'2012-07-19 15:35:24',13,'MPL_17'),(12,88,'2012-07-19 15:35:24',13,'MPL_17'),(12,89,'2012-07-19 15:35:24',13,'MPL_17'),(12,90,'2012-07-19 15:35:24',13,'MPL_17'),(12,91,'2012-07-19 15:35:24',13,'MPL_17'),(12,92,'2012-07-19 15:35:24',13,'MPL_17'),(12,93,'2012-07-19 15:35:24',13,'MPL_17'),(12,94,'2012-07-19 15:35:24',13,'MPL_17'),(12,95,'2012-07-19 15:35:24',13,'MPL_17'),(12,96,'2012-07-19 15:35:24',13,'MPL_17'),(12,97,'2012-07-19 15:35:24',13,'MPL_17'),(12,98,'2012-07-19 15:35:24',13,'MPL_17'),(12,99,'2012-07-19 15:35:24',13,'MPL_17'),(12,100,'2012-07-19 15:35:24',27,'MPL_17'),(12,101,'2012-07-19 15:35:24',13,'MPL_17'),(12,102,'2012-07-19 15:35:24',13,'MPL_17'),(12,103,'2012-07-19 15:35:24',13,'MPL_17'),(12,104,'2012-07-19 15:35:24',13,'MPL_17'),(12,105,'2012-07-19 15:35:24',27,'MPL_17'),(12,106,'2012-07-19 15:35:24',27,'MPL_17'),(12,107,'2012-07-19 15:35:24',27,'MPL_17'),(12,108,'2012-07-19 15:35:24',27,'MPL_17'),(12,109,'2012-07-19 15:35:24',13,'MPL_17'),(12,110,'2012-07-19 15:35:24',13,'MPL_17'),(12,111,'2012-07-19 15:35:24',13,'MPL_17'),(12,112,'2012-07-19 15:35:24',13,'MPL_17'),(12,113,'2012-07-19 15:35:24',13,'MPL_17'),(12,114,'2012-07-19 15:35:24',13,'MPL_17'),(12,115,'2012-07-19 15:35:24',27,'MPL_17'),(12,116,'2012-07-19 15:35:24',27,'MPL_17'),(12,117,'2012-07-19 15:35:24',13,'MPL_17'),(12,118,'2012-07-19 15:35:24',27,'MPL_17'),(12,119,'2012-07-19 15:35:24',27,'MPL_17'),(12,120,'2012-07-19 15:35:24',27,'MPL_17'),(12,121,'2012-07-19 15:35:24',27,'MPL_17'),(12,122,'2012-07-19 15:35:24',27,'MPL_17'),(12,123,'2012-07-19 15:35:24',27,'MPL_17'),(12,124,'2012-07-19 15:35:24',13,'MPL_17'),(12,125,'2012-07-19 15:35:24',27,'MPL_17'),(12,126,'2012-07-19 15:35:24',27,'MPL_17'),(12,127,'2012-07-19 15:35:24',27,'MPL_17'),(12,128,'2012-07-19 15:35:24',27,'MPL_17'),(12,129,'2012-07-19 15:35:24',27,'MPL_17'),(12,130,'2012-07-19 15:35:24',27,'MPL_17'),(12,131,'2012-07-19 15:35:24',27,'MPL_17'),(12,132,'2012-07-19 15:35:24',27,'MPL_17'),(12,133,'2012-07-19 15:35:24',27,'MPL_17'),(12,134,'2012-07-19 15:35:24',13,'MPL_17'),(12,135,'2012-07-19 15:35:24',13,'MPL_17'),(12,136,'2012-07-19 15:35:24',13,'MPL_17'),(12,137,'2012-07-19 15:35:24',13,'MPL_17'),(12,138,'2012-07-19 15:35:24',13,'MPL_17'),(12,139,'2012-07-19 15:35:24',13,'MPL_17'),(12,140,'2012-07-19 15:35:24',13,'MPL_17'),(12,141,'2012-08-14 11:32:39',503,'MPL_17'),(15,68,'2012-07-19 15:35:24',13,'MPL_11'),(15,69,'2012-07-19 15:35:24',13,'MPL_11'),(15,72,'2012-07-19 15:35:24',13,'MPL_11'),(16,68,'2012-07-19 15:35:24',13,'MPL_17'),(16,69,'2012-07-19 15:35:24',13,'MPL_17'),(16,83,'2012-08-23 09:05:39',27,'MPL_17'),(16,113,'2012-07-19 15:35:24',27,'MPL_17'),(17,68,'2012-07-19 15:35:24',13,'MPL_11'),(17,69,'2012-07-19 15:35:24',13,'MPL_11'),(17,70,'2012-07-19 15:35:24',13,'MPL_11'),(17,71,'2012-07-19 15:35:24',13,'MPL_11'),(17,72,'2012-07-19 15:35:24',13,'MPL_11'),(17,130,'2012-09-06 14:17:21',503,'MPL_17'),(18,1,'2012-07-19 15:35:24',13,'MPL_17'),(18,2,'2012-07-19 15:35:24',13,'MPL_17'),(18,3,'2012-07-19 15:35:24',13,'MPL_17'),(18,4,'2012-07-19 15:35:24',13,'MPL_17'),(18,5,'2012-07-19 15:35:24',13,'MPL_17'),(18,6,'2012-07-19 15:35:24',13,'MPL_17'),(18,7,'2012-07-19 15:35:24',13,'MPL_17'),(18,8,'2012-07-19 15:35:24',13,'MPL_17'),(18,9,'2012-07-19 15:35:24',13,'MPL_17'),(18,10,'2012-07-19 15:35:24',13,'MPL_17'),(18,11,'2012-07-19 15:35:24',13,'MPL_17'),(18,12,'2012-07-19 15:35:24',13,'MPL_17'),(18,13,'2012-07-19 15:35:24',13,'MPL_17'),(18,14,'2012-07-19 15:35:24',13,'MPL_17'),(18,15,'2012-07-19 15:35:24',13,'MPL_17'),(18,16,'2012-07-19 15:35:24',13,'MPL_17'),(18,17,'2012-07-19 15:35:24',13,'MPL_17'),(18,18,'2012-07-19 15:35:24',13,'MPL_17'),(18,19,'2012-07-19 15:35:24',13,'MPL_17'),(18,20,'2012-07-19 15:35:24',13,'MPL_17'),(18,21,'2012-07-19 15:35:24',13,'MPL_17'),(18,22,'2012-07-19 15:35:24',13,'MPL_17'),(18,23,'2012-07-19 15:35:24',13,'MPL_17'),(18,24,'2012-07-19 15:35:24',13,'MPL_17'),(18,25,'2012-07-19 15:35:24',13,'MPL_17'),(18,26,'2012-07-19 15:35:24',13,'MPL_17'),(18,27,'2012-07-19 15:35:24',13,'MPL_17'),(18,28,'2012-07-19 15:35:24',13,'MPL_17'),(18,29,'2012-07-19 15:35:24',13,'MPL_17'),(18,31,'2012-07-19 15:35:24',13,'MPL_17'),(18,32,'2012-07-19 15:35:24',13,'MPL_17'),(18,33,'2012-07-19 15:35:24',13,'MPL_17'),(18,34,'2012-07-19 15:35:24',13,'MPL_17'),(18,35,'2012-07-19 15:35:24',13,'MPL_17'),(18,36,'2012-07-19 15:35:24',13,'MPL_17'),(18,37,'2012-07-19 15:35:24',13,'MPL_17'),(18,38,'2012-07-19 15:35:24',13,'MPL_17'),(18,39,'2012-07-19 15:35:24',13,'MPL_17'),(18,40,'2012-07-19 15:35:24',13,'MPL_17'),(18,41,'2012-07-19 15:35:24',13,'MPL_17'),(18,42,'2012-07-19 15:35:24',13,'MPL_17'),(18,43,'2012-07-19 15:35:24',13,'MPL_17'),(18,44,'2012-07-19 15:35:24',13,'MPL_17'),(18,45,'2012-07-19 15:35:24',13,'MPL_17'),(18,46,'2012-07-19 15:35:24',13,'MPL_17'),(18,47,'2012-07-19 15:35:24',13,'MPL_17'),(18,48,'2012-07-19 15:35:24',13,'MPL_17'),(18,49,'2012-07-19 15:35:24',13,'MPL_17'),(18,50,'2012-07-19 15:35:24',13,'MPL_17'),(18,51,'2012-07-19 15:35:24',13,'MPL_17'),(18,52,'2012-07-19 15:35:24',13,'MPL_17'),(18,53,'2012-07-19 15:35:24',13,'MPL_17'),(18,54,'2012-07-19 15:35:24',13,'MPL_17'),(18,55,'2012-07-19 15:35:24',13,'MPL_17'),(18,56,'2012-07-19 15:35:24',13,'MPL_17'),(18,57,'2012-07-19 15:35:24',13,'MPL_17'),(18,58,'2012-07-19 15:35:24',13,'MPL_17'),(18,59,'2012-07-19 15:35:24',13,'MPL_17'),(18,60,'2012-07-19 15:35:24',13,'MPL_17'),(18,61,'2012-07-19 15:35:24',13,'MPL_17'),(18,62,'2012-07-19 15:35:24',13,'MPL_17'),(18,63,'2012-07-19 15:35:24',13,'MPL_17'),(18,64,'2012-07-19 15:35:24',13,'MPL_17'),(18,65,'2012-07-19 15:35:24',13,'MPL_17'),(18,66,'2012-07-19 15:35:24',13,'MPL_17'),(18,67,'2012-07-19 15:35:24',13,'MPL_17'),(18,68,'2012-07-19 15:35:24',13,'MPL_17'),(18,69,'2012-07-19 15:35:24',13,'MPL_17'),(18,70,'2012-07-19 15:35:24',13,'MPL_17'),(18,71,'2012-07-19 15:35:24',13,'MPL_17'),(18,72,'2012-07-19 15:35:24',13,'MPL_17'),(18,73,'2012-07-19 15:35:24',13,'MPL_17'),(18,74,'2012-07-19 15:35:24',13,'MPL_17'),(18,75,'2012-07-19 15:35:24',13,'MPL_17'),(18,76,'2012-07-19 15:35:24',13,'MPL_17'),(18,77,'2012-07-19 15:35:24',13,'MPL_17'),(18,78,'2012-07-19 15:35:24',13,'MPL_17'),(18,79,'2012-07-19 15:35:24',13,'MPL_17'),(18,80,'2012-07-19 15:35:24',13,'MPL_17'),(18,81,'2012-07-19 15:35:24',13,'MPL_17'),(18,82,'2012-07-19 15:35:24',13,'MPL_17'),(18,90,'2012-07-19 15:35:24',13,'MPL_17'),(18,111,'2012-07-19 15:35:24',13,'MPL_17'),(19,113,'2012-07-19 15:35:24',13,'MPL_17'),(20,30,'2012-07-19 15:35:24',13,'MPL_17'),(20,79,'2012-07-19 15:35:24',13,'MPL_17'),(20,80,'2012-07-19 15:35:24',13,'MPL_17'),(20,82,'2012-07-19 15:35:24',13,'MPL_17'),(20,83,'2012-07-19 15:35:24',13,'MPL_17'),(20,84,'2012-07-19 15:35:24',13,'MPL_17'),(20,85,'2012-07-19 15:35:24',13,'MPL_17'),(20,86,'2012-07-19 15:35:24',13,'MPL_17'),(20,87,'2012-07-19 15:35:24',13,'MPL_17'),(20,88,'2012-07-19 15:35:24',13,'MPL_17'),(20,89,'2012-07-19 15:35:24',13,'MPL_17'),(20,91,'2012-07-19 15:35:24',13,'MPL_17'),(20,109,'2012-07-19 15:35:24',13,'MPL_17'),(20,110,'2012-07-19 15:35:24',13,'MPL_17'),(20,112,'2012-07-19 15:35:24',13,'MPL_17'),(20,113,'2012-07-19 15:35:24',13,'MPL_17'),(20,114,'2012-07-19 15:35:24',13,'MPL_17'),(20,134,'2012-07-19 15:35:24',13,'MPL_17'),(20,135,'2012-07-19 15:35:24',13,'MPL_17'),(20,136,'2012-07-19 15:35:24',13,'MPL_17'),(20,137,'2012-07-19 15:35:24',13,'MPL_17'),(20,138,'2012-07-19 15:35:24',13,'MPL_17'),(20,139,'2012-07-19 15:35:24',13,'MPL_17'),(20,140,'2012-07-19 15:35:24',13,'MPL_17'),(21,100,'2012-07-19 15:35:24',13,'MPL_17'),(22,113,'2012-07-19 15:35:24',13,'MPL_17'),(23,79,'2012-07-19 15:35:24',13,'MPL_17'),(23,80,'2012-07-19 15:35:24',13,'MPL_17'),(23,83,'2012-07-19 15:35:24',13,'MPL_17'),(23,84,'2012-07-19 15:35:24',13,'MPL_17'),(23,85,'2012-07-19 15:35:24',13,'MPL_17'),(23,86,'2012-07-19 15:35:24',13,'MPL_17'),(23,87,'2012-07-19 15:35:24',13,'MPL_17'),(23,88,'2012-07-19 15:35:24',13,'MPL_17'),(23,89,'2012-07-19 15:35:24',13,'MPL_17'),(23,91,'2012-07-19 15:35:24',13,'MPL_17'),(23,112,'2012-07-19 15:35:24',13,'MPL_17'),(23,113,'2012-07-19 15:35:24',13,'MPL_17'),(24,48,'2012-07-19 15:35:24',13,'MPL_17'),(24,57,'2012-07-19 15:35:24',13,'MPL_17'),(24,75,'2012-07-19 15:35:24',13,'MPL_17'),(24,101,'2012-07-19 15:35:24',13,'MPL_17'),(24,102,'2012-07-19 15:35:24',13,'MPL_17'),(24,103,'2012-07-19 15:35:24',13,'MPL_17'),(24,104,'2012-07-19 15:35:24',13,'MPL_17'),(25,33,'2012-07-19 15:35:24',13,'MPL_17'),(25,35,'2012-07-19 15:35:24',13,'MPL_17'),(25,41,'2012-07-19 15:35:24',13,'MPL_17'),(25,42,'2012-07-19 15:35:24',13,'MPL_17'),(25,44,'2012-07-19 15:35:24',13,'MPL_17'),(25,45,'2012-07-19 15:35:24',13,'MPL_17'),(25,48,'2012-07-19 15:35:24',13,'MPL_17'),(25,51,'2012-07-19 15:35:24',13,'MPL_17'),(25,58,'2012-07-19 15:35:24',13,'MPL_17'),(25,60,'2012-07-19 15:35:24',13,'MPL_17'),(25,61,'2012-07-19 15:35:24',13,'MPL_17'),(25,63,'2012-07-19 15:35:24',13,'MPL_17'),(25,64,'2012-07-19 15:35:24',13,'MPL_17'),(25,67,'2012-07-19 15:35:24',13,'MPL_17'),(25,74,'2012-08-30 09:23:27',503,'MPL_17'),(25,75,'2012-07-19 15:35:24',13,'MPL_17'),(25,77,'2012-07-19 15:35:24',13,'MPL_17'),(25,92,'2012-07-19 15:35:24',13,'MPL_17'),(25,93,'2012-07-19 15:35:24',13,'MPL_17'),(25,94,'2012-07-19 15:35:24',13,'MPL_17'),(25,95,'2012-07-19 15:35:24',13,'MPL_17'),(25,97,'2012-07-19 15:35:24',13,'MPL_17'),(25,98,'2012-07-19 15:35:24',13,'MPL_17'),(25,101,'2012-07-19 15:35:24',13,'MPL_17'),(25,102,'2012-07-19 15:35:24',13,'MPL_17'),(25,103,'2012-07-19 15:35:24',13,'MPL_17'),(25,104,'2012-07-19 15:35:24',13,'MPL_17'),(26,7,'2012-07-19 15:35:24',13,'MPL_17'),(26,8,'2012-07-19 15:35:24',13,'MPL_17'),(26,9,'2012-07-19 15:35:24',13,'MPL_17'),(26,10,'2012-07-19 15:35:24',13,'MPL_17'),(26,38,'2012-07-19 15:35:24',13,'MPL_17'),(26,103,'2012-07-19 15:35:24',13,'MPL_17'),(26,104,'2012-07-19 15:35:24',13,'MPL_17'),(27,7,'2012-07-19 15:35:24',13,'MPL_17'),(27,8,'2012-07-19 15:35:24',13,'MPL_17'),(27,38,'2012-07-19 15:35:24',13,'MPL_17'),(27,103,'2012-07-19 15:35:24',13,'MPL_17'),(28,6,'2012-07-19 15:35:24',13,'MPL_17'),(29,3,'2012-07-19 15:35:24',13,'MPL_17'),(29,4,'2012-07-19 15:35:24',13,'MPL_17'),(29,5,'2012-07-19 15:35:24',13,'MPL_17'),(29,6,'2012-07-19 15:35:24',13,'MPL_17'),(30,43,'2012-07-19 15:35:24',13,'MPL_17'),(30,52,'2012-07-19 15:35:24',13,'MPL_17'),(30,68,'2012-07-19 15:35:24',13,'MPL_17'),(30,69,'2012-07-19 15:35:24',13,'MPL_17'),(30,70,'2012-07-19 15:35:24',13,'MPL_17'),(30,71,'2012-07-19 15:35:24',13,'MPL_17'),(30,72,'2012-07-19 15:35:24',13,'MPL_17'),(30,73,'2012-07-19 15:35:24',13,'MPL_17'),(30,78,'2012-07-19 15:35:24',13,'MPL_17'),(31,43,'2012-07-19 15:35:24',13,'MPL_17'),(31,68,'2012-07-19 15:35:24',13,'MPL_17'),(31,69,'2012-07-19 15:35:24',13,'MPL_17'),(31,73,'2012-07-19 15:35:24',13,'MPL_17'),(31,78,'2012-07-19 15:35:24',13,'MPL_17'),(32,66,'2012-07-19 15:35:24',13,'MPL_17'),(32,90,'2012-07-19 15:35:24',13,'MPL_17'),(33,24,'2012-07-19 15:35:24',13,'MPL_17'),(33,25,'2012-07-19 15:35:24',13,'MPL_17'),(33,26,'2012-07-19 15:35:24',13,'MPL_17'),(33,27,'2012-07-19 15:35:24',13,'MPL_17'),(33,28,'2012-07-19 15:35:24',13,'MPL_17'),(33,29,'2012-07-19 15:35:24',13,'MPL_17'),(33,31,'2012-07-19 15:35:24',13,'MPL_17'),(33,33,'2012-07-19 15:35:24',13,'MPL_17'),(33,34,'2012-07-19 15:35:24',13,'MPL_17'),(33,35,'2012-07-19 15:35:24',13,'MPL_17'),(33,48,'2012-07-19 15:35:24',13,'MPL_17'),(33,51,'2012-07-19 15:35:24',13,'MPL_17'),(33,56,'2012-07-19 15:35:24',13,'MPL_17'),(33,60,'2012-07-19 15:35:24',13,'MPL_17'),(33,61,'2012-07-19 15:35:24',13,'MPL_17'),(33,62,'2012-07-19 15:35:24',13,'MPL_17'),(33,63,'2012-07-19 15:35:24',13,'MPL_17'),(33,64,'2012-07-19 15:35:24',13,'MPL_17'),(33,65,'2012-07-19 15:35:24',13,'MPL_17'),(33,67,'2012-07-19 15:35:24',13,'MPL_17'),(33,74,'2012-07-19 15:35:24',13,'MPL_17'),(33,95,'2012-07-19 15:35:24',13,'MPL_17'),(33,97,'2012-07-19 15:35:24',13,'MPL_17'),(33,111,'2012-07-19 15:35:24',13,'MPL_17'),(34,30,'2012-07-19 15:35:24',13,'MPL_17'),(34,79,'2012-07-19 15:35:24',13,'MPL_17'),(34,80,'2012-07-19 15:35:24',13,'MPL_17'),(34,82,'2012-07-19 15:35:24',13,'MPL_17'),(34,83,'2012-07-19 15:35:24',13,'MPL_17'),(34,84,'2012-07-19 15:35:24',13,'MPL_17'),(34,85,'2012-07-19 15:35:24',13,'MPL_17'),(34,86,'2012-07-19 15:35:24',13,'MPL_17'),(34,87,'2012-07-19 15:35:24',13,'MPL_17'),(34,88,'2012-07-19 15:35:24',13,'MPL_17'),(34,89,'2012-07-19 15:35:24',13,'MPL_17'),(34,91,'2012-07-19 15:35:24',13,'MPL_17'),(34,109,'2012-07-19 15:35:24',13,'MPL_17'),(34,110,'2012-07-19 15:35:24',13,'MPL_17'),(34,112,'2012-07-19 15:35:24',13,'MPL_17'),(34,113,'2012-07-19 15:35:24',13,'MPL_17'),(34,114,'2012-07-19 15:35:24',13,'MPL_17'),(34,134,'2012-07-19 15:35:24',13,'MPL_17'),(34,135,'2012-07-19 15:35:24',13,'MPL_17'),(34,136,'2012-07-19 15:35:24',13,'MPL_17'),(34,137,'2012-07-19 15:35:24',13,'MPL_17'),(34,138,'2012-07-19 15:35:24',13,'MPL_17'),(34,139,'2012-07-19 15:35:24',13,'MPL_17'),(34,140,'2012-07-19 15:35:24',13,'MPL_17'),(35,54,'2012-07-19 15:35:24',13,'MPL_17'),(36,117,'2012-07-19 15:35:24',13,'MPL_17'),(36,118,'2012-07-19 15:35:24',13,'MPL_17'),(36,119,'2012-07-19 15:35:24',13,'MPL_17'),(36,120,'2012-07-19 15:35:24',13,'MPL_17'),(36,121,'2012-07-19 15:35:24',13,'MPL_17'),(36,122,'2012-07-19 15:35:24',13,'MPL_17'),(36,124,'2012-07-19 15:35:24',13,'MPL_17'),(36,125,'2012-07-19 15:35:24',13,'MPL_17'),(36,126,'2012-07-19 15:35:24',13,'MPL_17'),(36,127,'2012-07-19 15:35:24',13,'MPL_17'),(36,128,'2012-07-19 15:35:24',13,'MPL_17'),(36,129,'2012-07-19 15:35:24',13,'MPL_17');
/*!40000 ALTER TABLE `User_ClassHasAttribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Role`
--

DROP TABLE IF EXISTS `User_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Role` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UserRoleName` varchar(100) NOT NULL,
  `UserRoleDescription` varchar(100) NOT NULL,
  `Modified` datetime NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `SourceID` varchar(11) DEFAULT NULL,
  `Active` enum('YES','NO') DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Role`
--

LOCK TABLES `User_Role` WRITE;
/*!40000 ALTER TABLE `User_Role` DISABLE KEYS */;
INSERT INTO `User_Role` VALUES (1,'Administrator','','2012-07-19 15:35:23',1,'MPL_11','YES'),(13,'Login Only','Login Only','2012-07-19 15:35:23',13,'MPL_11','YES'),(14,'Cashier','Cashier','2012-07-19 15:35:23',13,'MPL_11','YES'),(15,'Head Cashier','Head Cashier','2012-07-19 15:35:23',13,'MPL_11','YES'),(16,'Cashier Manager','Cashier Manager','2012-07-19 15:35:23',13,'MPL_11','YES'),(17,'View ALL','View ALL','2012-07-19 15:35:23',13,'MPL_11','YES'),(18,'POS User','POS User','2012-07-19 15:35:23',13,'MPL_11','YES'),(19,'POS Manager','POS Manager','2012-07-19 15:35:23',13,'MPL_11','YES'),(20,'TMP','TMP','2012-07-19 15:35:23',13,'MPL_11','YES'),(21,'Cashier','Cashier','2012-07-19 15:35:23',13,'MPL_11','YES'),(22,'Manager Jnr','Manager Jnr','2012-07-19 15:35:23',13,'MPL_11','YES'),(23,'Manager Snr','Manager Snr','2012-07-19 15:35:23',13,'MPL_11','YES'),(24,'POS Supervisor','POS Supervisor','2012-07-19 15:35:23',13,'MPL_11','YES'),(25,'Support Snr','Support Snr','2012-07-19 15:35:23',13,'MPL_11','YES');
/*!40000 ALTER TABLE `User_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_RoleHasClass`
--

DROP TABLE IF EXISTS `User_RoleHasClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_RoleHasClass` (
  `RoleID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `Modified` datetime NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `SourceID` varchar(30) NOT NULL,
  PRIMARY KEY (`RoleID`,`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_RoleHasClass`
--

LOCK TABLES `User_RoleHasClass` WRITE;
/*!40000 ALTER TABLE `User_RoleHasClass` DISABLE KEYS */;
INSERT INTO `User_RoleHasClass` VALUES (1,12,'2012-07-19 15:35:24',13,'MPL_11'),(1,13,'2012-07-19 15:35:24',13,'MPL_11'),(1,14,'2012-07-19 15:35:24',13,'MPL_11'),(1,15,'2012-07-19 15:35:24',13,'MPL_11'),(1,16,'2012-07-19 15:35:24',13,'MPL_11'),(1,17,'2012-07-19 15:35:24',13,'MPL_11'),(1,18,'2012-07-19 15:35:24',13,'MPL_11'),(1,19,'2012-07-19 15:35:24',13,'MPL_11'),(1,20,'2012-07-19 15:35:24',13,'MPL_11'),(1,21,'2012-07-19 15:35:24',13,'MPL_11'),(1,22,'2012-07-19 15:35:24',13,'MPL_11'),(1,23,'2012-07-19 15:35:24',13,'MPL_11'),(1,24,'2012-07-19 15:35:24',13,'MPL_11'),(1,25,'2012-07-19 15:35:24',13,'MPL_11'),(1,26,'2012-07-19 15:35:24',13,'MPL_11'),(1,27,'2012-07-19 15:35:24',13,'MPL_11'),(1,28,'2012-07-19 15:35:24',13,'MPL_11'),(1,29,'2012-07-19 15:35:24',13,'MPL_11'),(1,30,'2012-07-19 15:35:24',13,'MPL_11'),(1,31,'2012-07-19 15:35:24',13,'MPL_11'),(1,32,'2012-07-19 15:35:24',13,'MPL_11'),(1,33,'2012-07-19 15:35:24',13,'MPL_11'),(1,34,'2012-07-19 15:35:24',13,'MPL_11'),(1,35,'2012-07-19 15:35:24',13,'MPL_11'),(1,36,'2012-07-19 15:35:24',13,'MPL_11'),(13,13,'2012-07-19 15:35:24',13,'MPL_11'),(13,14,'2012-07-19 15:35:24',13,'MPL_11'),(14,16,'2012-07-19 15:35:24',13,'MPL_11'),(15,15,'2012-07-19 15:35:24',13,'MPL_11'),(15,16,'2012-07-19 15:35:24',13,'MPL_11'),(16,15,'2012-07-19 15:35:24',13,'MPL_11'),(16,16,'2012-07-19 15:35:24',13,'MPL_11'),(16,17,'2012-07-19 15:35:24',13,'MPL_11'),(17,12,'2012-07-19 15:35:24',13,'MPL_11'),(17,13,'2012-07-19 15:35:24',13,'MPL_11'),(17,14,'2012-07-19 15:35:24',13,'MPL_11'),(17,15,'2012-07-19 15:35:24',13,'MPL_11'),(17,16,'2012-07-19 15:35:24',13,'MPL_11'),(17,17,'2012-07-19 15:35:24',13,'MPL_11'),(17,18,'2012-07-19 15:35:24',13,'MPL_11'),(18,19,'2012-07-19 15:35:24',13,'MPL_11'),(18,22,'2012-07-19 15:35:24',13,'MPL_11'),(19,19,'2012-07-19 15:35:24',13,'MPL_11'),(19,20,'2012-07-19 15:35:24',13,'MPL_11'),(20,21,'2012-07-19 15:35:24',13,'MPL_11'),(21,22,'2012-07-19 15:35:24',13,'MPL_11'),(22,23,'2012-07-19 15:35:24',13,'MPL_11'),(22,32,'2012-07-19 15:35:24',13,'MPL_11'),(23,25,'2012-07-19 15:35:24',13,'MPL_11'),(23,26,'2012-07-19 15:35:24',13,'MPL_11'),(23,29,'2012-07-19 15:35:24',13,'MPL_11'),(23,30,'2012-07-19 15:35:24',13,'MPL_11'),(23,32,'2012-07-19 15:35:24',13,'MPL_11'),(23,34,'2012-07-19 15:35:24',13,'MPL_11'),(23,35,'2012-07-19 15:35:24',13,'MPL_11'),(23,36,'2012-07-19 15:35:24',13,'MPL_11'),(24,34,'2012-07-19 15:35:24',13,'MPL_11'),(25,33,'2012-07-19 15:35:24',13,'MPL_11'),(25,35,'2012-07-19 15:35:24',13,'MPL_11');
/*!40000 ALTER TABLE `User_RoleHasClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_User`
--

DROP TABLE IF EXISTS `User_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_User` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(60) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `AccountStatus` enum('Enabled','Disabled') NOT NULL,
  `Modified` datetime NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `SourceID` varchar(30) NOT NULL,
  `FingerPrint1` blob,
  `FingerPrintSize1` int(11) DEFAULT '0',
  `FingerPrint2` blob,
  `FingerPrintSize2` int(11) DEFAULT '0',
  `SwipeCard1` varchar(100) DEFAULT NULL,
  `SwipeCard2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=170588 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_User`
--

LOCK TABLES `User_User` WRITE;
/*!40000 ALTER TABLE `User_User` DISABLE KEYS */;
INSERT INTO `User_User` VALUES (3,'LILY','125','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(27,'admin','5141','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(29,'MARGRET','123','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(30,'PRUDANCE','124','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(503,'LUCY','2304','Enabled','2012-10-05 07:53:55',10,'10','0',0,'0',0,'',''),(514,'manager','manager','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(515,'headcash','headcash','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(516,'cash','cash','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(517,'pos','16','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(518,'POS1','1','Enabled','2012-08-22 22:03:46',10,'10','0',0,'0',0,'',''),(519,'TAOUFIK','10','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(520,'Ricky','1234','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(521,'MEGAN','126','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(522,'Rahab','2010','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(523,'Odette','1987','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(524,'Stacey','123','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(525,'Jojo','123','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(526,'Peter','junior','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(527,'Jose','2396','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(528,'Card-7','6009682602063','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(529,'Card-1 FRANK','6009682602001','Enabled','2012-08-22 23:12:36',10,'10','0',0,'0',0,'',''),(530,'IT SUPPORT','ROODKCAB','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(531,'DINGAAN','001','Enabled','2012-08-14 12:01:26',10,'10','0',0,'0',0,'',''),(60555,'Thaby','0011','Disabled','2012-08-14 12:01:44',10,'10','0',0,'0',0,'',''),(60556,'Thandazo','004','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60557,'Cathrine','014','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60558,'Tina','020','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60559,'Jeanete','027','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60560,'Zanele','039','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60561,'Portia','042','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60562,'Maggy','045','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60563,'Mamase','047','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60564,'Pinky','048','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60565,'Thuli','054','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60566,'Sam','911','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60567,'Hakim','912','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60568,'Tony','1975','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60569,'Nelson','1976','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60570,'Portia1','040','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60571,'Innocentia','023','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60572,'Card 4','6009682602032','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60573,'Card 3','6009682602025','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60574,'Lindiwe','050','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60575,'JOSE','2396','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60576,'Card-6','6009682602056','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(60577,'Card-10','6009682602094','Enabled','2012-07-19 15:35:23',10,'MPL_10','0',0,'0',0,'',''),(170578,'FRANK','1310','Enabled','2012-10-05 07:52:25',10,'10','0',0,'0',0,'',''),(170579,'LINO','0118','Enabled','2012-09-06 14:18:00',10,'10','0',0,'0',0,'',''),(170580,'JAC D','7501','Enabled','2012-09-06 14:18:09',10,'10','0',0,'0',0,'',''),(170581,'POS2','2','Enabled','2012-08-22 22:07:19',10,'10','0',0,'0',0,'',''),(170582,'POS3','3','Enabled','2012-08-22 22:07:28',10,'10','0',0,'0',0,'',''),(170583,'POS4','4','Enabled','2012-08-22 22:08:45',10,'10','0',0,'0',0,'',''),(170584,'POS5','5','Enabled','2012-08-22 22:09:35',10,'10','0',0,'0',0,'',''),(170585,'Card-2 LINO','6009682602018','Enabled','2012-08-22 23:12:05',10,'10','0',0,'0',0,'',''),(170586,'Card-4 JACINTA','6009682602032','Enabled','2012-08-22 23:14:59',10,'10','0',0,'0',0,'',''),(170587,'Card-5','6009682602049','Enabled','2012-08-22 23:17:12',10,'10','0',0,'0',0,'','');
/*!40000 ALTER TABLE `User_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_UserHasRole`
--

DROP TABLE IF EXISTS `User_UserHasRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_UserHasRole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `Modified` datetime NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `SourceID` varchar(30) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_UserHasRole`
--

LOCK TABLES `User_UserHasRole` WRITE;
/*!40000 ALTER TABLE `User_UserHasRole` DISABLE KEYS */;
INSERT INTO `User_UserHasRole` VALUES (0,14,'2012-08-22 21:35:06',27,'MPL_47'),(0,15,'2012-08-22 21:35:06',27,'MPL_47'),(0,16,'2012-08-22 21:35:06',27,'MPL_47'),(0,17,'2012-08-22 21:37:22',27,'MPL_47'),(0,18,'2012-08-22 21:35:06',27,'MPL_47'),(0,19,'2012-08-22 21:35:07',27,'MPL_47'),(0,20,'2012-08-22 21:37:22',27,'MPL_47'),(0,21,'2012-08-22 21:35:07',27,'MPL_47'),(0,23,'2012-08-22 21:35:07',27,'MPL_47'),(0,24,'2012-08-22 21:35:07',27,'MPL_47'),(3,14,'2012-07-19 15:35:24',13,'MPL_47'),(3,18,'2012-07-19 15:35:24',13,'MPL_47'),(27,1,'2012-07-19 15:35:24',13,'MPL_47'),(27,13,'2012-07-19 15:35:24',13,'MPL_47'),(27,14,'2012-07-19 15:35:24',13,'MPL_47'),(27,15,'2012-07-19 15:35:24',13,'MPL_47'),(27,16,'2012-07-19 15:35:24',13,'MPL_47'),(27,17,'2012-07-19 15:35:24',13,'MPL_47'),(27,18,'2012-07-19 15:35:24',13,'MPL_47'),(27,19,'2012-07-19 15:35:24',13,'MPL_47'),(27,20,'2012-07-19 15:35:24',13,'MPL_47'),(27,21,'2012-07-19 15:35:24',13,'MPL_47'),(27,22,'2012-07-19 15:35:24',13,'MPL_47'),(27,23,'2012-07-19 15:35:24',13,'MPL_47'),(27,24,'2012-07-19 15:35:24',13,'MPL_47'),(27,25,'2012-07-19 15:35:24',13,'MPL_47'),(29,14,'2012-07-19 15:35:24',13,'MPL_47'),(29,18,'2012-07-19 15:35:24',13,'MPL_47'),(30,14,'2012-07-19 15:35:24',13,'MPL_47'),(30,18,'2012-07-19 15:35:24',13,'MPL_47'),(503,1,'2012-07-19 15:35:24',13,'MPL_47'),(503,13,'2012-07-19 15:35:24',13,'MPL_47'),(503,14,'2012-07-19 15:35:24',13,'MPL_47'),(503,15,'2012-07-19 15:35:24',13,'MPL_47'),(503,16,'2012-07-19 15:35:24',13,'MPL_47'),(503,17,'2012-07-19 15:35:24',13,'MPL_47'),(503,18,'2012-07-19 15:35:24',13,'MPL_47'),(503,19,'2012-07-19 15:35:24',13,'MPL_47'),(503,20,'2012-07-19 15:35:24',13,'MPL_47'),(503,21,'2012-07-19 15:35:24',13,'MPL_47'),(503,22,'2012-07-19 15:35:24',13,'MPL_47'),(503,23,'2012-07-19 15:35:24',13,'MPL_47'),(503,24,'2012-07-19 15:35:24',13,'MPL_47'),(503,25,'2012-07-19 15:35:24',13,'MPL_47'),(514,16,'2012-07-19 15:35:24',13,'MPL_9'),(515,15,'2012-07-19 15:35:24',13,'MPL_9'),(516,14,'2012-07-19 15:35:24',13,'MPL_9'),(517,1,'2012-07-19 15:35:24',13,'MPL_47'),(517,13,'2012-07-19 15:35:24',13,'MPL_47'),(517,14,'2012-07-19 15:35:24',13,'MPL_47'),(517,18,'2012-07-19 15:35:24',13,'MPL_47'),(517,21,'2012-07-19 15:35:24',13,'MPL_47'),(518,14,'2012-08-22 22:03:32',27,'MPL_47'),(518,18,'2012-08-22 22:03:32',27,'MPL_47'),(518,21,'2012-08-22 22:03:32',27,'MPL_47'),(519,14,'2012-07-19 15:35:24',13,'MPL_47'),(519,15,'2012-07-19 15:35:24',13,'MPL_47'),(519,16,'2012-07-19 15:35:24',13,'MPL_47'),(519,17,'2012-07-19 15:35:24',13,'MPL_47'),(519,18,'2012-07-19 15:35:24',13,'MPL_47'),(519,19,'2012-07-19 15:35:24',13,'MPL_47'),(519,23,'2012-07-19 15:35:24',13,'MPL_47'),(519,24,'2012-07-19 15:35:24',13,'MPL_47'),(520,25,'2012-07-19 15:35:24',13,'MPL_47'),(521,18,'2012-07-19 15:35:24',13,'MPL_47'),(521,21,'2012-07-19 15:35:24',13,'MPL_47'),(522,21,'2012-07-19 15:35:24',13,'MPL_47'),(523,21,'2012-07-19 15:35:24',13,'MPL_47'),(524,21,'2012-07-19 15:35:24',13,'MPL_47'),(525,21,'2012-07-19 15:35:24',13,'MPL_47'),(526,18,'2012-07-19 15:35:24',13,'MPL_47'),(526,19,'2012-07-19 15:35:24',13,'MPL_47'),(526,22,'2012-07-19 15:35:24',13,'MPL_47'),(526,23,'2012-07-19 15:35:24',13,'MPL_47'),(526,24,'2012-07-19 15:35:24',13,'MPL_47'),(527,1,'2012-07-19 15:35:24',13,'MPL_47'),(527,23,'2012-07-19 15:35:24',13,'MPL_47'),(527,25,'2012-07-19 15:35:24',13,'MPL_47'),(528,23,'2012-07-19 15:35:24',13,'MPL_47'),(529,19,'2012-08-22 23:12:25',27,'MPL_47'),(529,23,'2012-07-19 15:35:24',13,'MPL_47'),(530,23,'2012-07-19 15:35:24',13,'MPL_47'),(530,25,'2012-07-19 15:35:24',13,'MPL_47'),(531,14,'2012-08-14 10:06:34',13,'MPL_47'),(531,15,'2012-08-14 10:06:34',13,'MPL_47'),(531,16,'2012-08-14 10:06:34',13,'MPL_47'),(531,18,'2012-08-14 10:06:34',13,'MPL_47'),(531,19,'2012-08-14 10:06:34',13,'MPL_47'),(531,22,'2012-08-14 10:06:34',13,'MPL_47'),(531,23,'2012-08-14 10:06:34',13,'MPL_47'),(531,24,'2012-08-14 10:06:34',13,'MPL_47'),(60555,18,'2012-07-19 15:35:24',13,'MPL_47'),(60556,18,'2012-07-19 15:35:24',13,'MPL_47'),(60557,18,'2012-07-19 15:35:24',13,'MPL_47'),(60558,18,'2012-07-19 15:35:24',13,'MPL_47'),(60559,18,'2012-07-19 15:35:24',13,'MPL_47'),(60560,18,'2012-07-19 15:35:24',13,'MPL_47'),(60561,18,'2012-07-19 15:35:24',13,'MPL_47'),(60562,18,'2012-07-19 15:35:24',13,'MPL_47'),(60563,18,'2012-07-19 15:35:24',13,'MPL_47'),(60564,18,'2012-07-19 15:35:24',13,'MPL_47'),(60565,18,'2012-07-19 15:35:24',13,'MPL_47'),(60566,19,'2012-07-19 15:35:24',13,'MPL_47'),(60567,19,'2012-07-19 15:35:24',13,'MPL_47'),(60568,19,'2012-07-19 15:35:24',13,'MPL_47'),(60568,23,'2012-07-19 15:35:24',13,'MPL_47'),(60569,1,'2012-07-19 15:35:24',13,'MPL_47'),(60569,13,'2012-07-19 15:35:24',13,'MPL_47'),(60569,14,'2012-07-19 15:35:24',13,'MPL_47'),(60569,15,'2012-07-19 15:35:24',13,'MPL_47'),(60569,16,'2012-07-19 15:35:24',13,'MPL_47'),(60569,17,'2012-07-19 15:35:24',13,'MPL_47'),(60569,18,'2012-07-19 15:35:24',13,'MPL_47'),(60569,19,'2012-07-19 15:35:24',13,'MPL_47'),(60569,20,'2012-07-19 15:35:24',13,'MPL_47'),(60569,21,'2012-07-19 15:35:24',13,'MPL_47'),(60569,22,'2012-07-19 15:35:24',13,'MPL_47'),(60569,23,'2012-07-19 15:35:24',13,'MPL_47'),(60569,24,'2012-07-19 15:35:24',13,'MPL_47'),(60569,25,'2012-07-19 15:35:24',13,'MPL_47'),(60570,18,'2012-07-19 15:35:24',13,'MPL_47'),(60571,18,'2012-07-19 15:35:24',13,'MPL_47'),(60572,23,'2012-07-19 15:35:24',13,'MPL_47'),(60573,23,'2012-07-19 15:35:24',13,'MPL_47'),(60574,18,'2012-07-19 15:35:24',13,'MPL_47'),(60575,1,'2012-07-19 15:35:24',13,'MPL_47'),(60575,13,'2012-07-19 15:35:24',13,'MPL_47'),(60575,14,'2012-07-19 15:35:24',13,'MPL_47'),(60575,15,'2012-07-19 15:35:24',13,'MPL_47'),(60575,16,'2012-07-19 15:35:24',13,'MPL_47'),(60575,17,'2012-07-19 15:35:24',13,'MPL_47'),(60575,18,'2012-07-19 15:35:24',13,'MPL_47'),(60575,19,'2012-07-19 15:35:24',13,'MPL_47'),(60575,20,'2012-07-19 15:35:24',13,'MPL_47'),(60575,21,'2012-07-19 15:35:24',13,'MPL_47'),(60575,22,'2012-07-19 15:35:24',13,'MPL_47'),(60575,23,'2012-07-19 15:35:24',13,'MPL_47'),(60575,24,'2012-07-19 15:35:24',13,'MPL_47'),(60575,25,'2012-07-19 15:35:24',13,'MPL_47'),(60576,23,'2012-07-19 15:35:24',13,'MPL_47'),(60577,23,'2012-07-19 15:35:24',13,'MPL_47'),(170578,1,'2012-09-03 17:50:55',170580,'MPL_47'),(170578,13,'2012-08-30 09:05:28',503,'MPL_47'),(170578,14,'2012-08-30 09:09:31',503,'MPL_47'),(170578,15,'2012-08-30 09:09:31',503,'MPL_47'),(170578,16,'2012-08-30 09:09:31',503,'MPL_47'),(170578,17,'2012-09-03 17:50:55',170580,'MPL_47'),(170578,18,'2012-08-30 09:09:31',503,'MPL_47'),(170578,19,'2012-08-30 09:09:31',503,'MPL_47'),(170578,20,'2012-09-03 17:50:55',170580,'MPL_47'),(170578,21,'2012-08-30 09:09:31',503,'MPL_47'),(170578,22,'2012-09-03 17:50:55',170580,'MPL_47'),(170578,23,'2012-08-30 09:09:31',503,'MPL_47'),(170578,24,'2012-08-30 09:09:31',503,'MPL_47'),(170578,25,'2012-09-03 17:50:55',170580,'MPL_47'),(170579,1,'2012-09-03 17:51:11',170580,'MPL_47'),(170579,13,'2012-08-22 21:37:48',27,'MPL_47'),(170579,14,'2012-08-22 21:37:48',27,'MPL_47'),(170579,15,'2012-08-22 21:37:49',27,'MPL_47'),(170579,16,'2012-08-22 21:37:49',27,'MPL_47'),(170579,17,'2012-09-03 17:51:11',170580,'MPL_47'),(170579,18,'2012-09-03 17:51:11',170580,'MPL_47'),(170579,19,'2012-08-22 21:37:49',27,'MPL_47'),(170579,20,'2012-08-22 21:37:49',27,'MPL_47'),(170579,21,'2012-08-22 21:37:49',27,'MPL_47'),(170579,22,'2012-09-03 17:51:11',170580,'MPL_47'),(170579,23,'2012-08-22 21:37:49',27,'MPL_47'),(170579,24,'2012-08-22 21:37:49',27,'MPL_47'),(170579,25,'2012-09-03 17:51:11',170580,'MPL_47'),(170580,1,'2012-09-03 17:49:15',27,'MPL_47'),(170580,13,'2012-09-03 17:49:15',27,'MPL_47'),(170580,14,'2012-08-22 21:39:10',27,'MPL_47'),(170580,15,'2012-08-22 21:39:10',27,'MPL_47'),(170580,16,'2012-08-22 21:39:10',27,'MPL_47'),(170580,17,'2012-08-22 21:39:10',27,'MPL_47'),(170580,18,'2012-08-22 21:39:10',27,'MPL_47'),(170580,19,'2012-08-22 21:39:10',27,'MPL_47'),(170580,20,'2012-08-22 21:39:10',27,'MPL_47'),(170580,21,'2012-08-22 21:39:10',27,'MPL_47'),(170580,22,'2012-09-03 17:49:15',27,'MPL_47'),(170580,23,'2012-08-22 21:39:10',27,'MPL_47'),(170580,24,'2012-08-22 21:39:10',27,'MPL_47'),(170580,25,'2012-09-03 17:49:15',27,'MPL_47'),(170581,14,'2012-08-22 22:07:08',27,'MPL_47'),(170581,18,'2012-08-22 22:07:08',27,'MPL_47'),(170581,21,'2012-08-22 22:07:08',27,'MPL_47'),(170582,14,'2012-08-22 22:06:43',27,'MPL_47'),(170582,18,'2012-08-22 22:06:43',27,'MPL_47'),(170582,21,'2012-08-22 22:06:43',27,'MPL_47'),(170583,14,'2012-08-22 22:08:45',27,'MPL_47'),(170583,18,'2012-08-22 22:08:45',27,'MPL_47'),(170583,21,'2012-08-22 22:08:45',27,'MPL_47'),(170584,14,'2012-08-22 22:09:25',27,'MPL_47'),(170584,18,'2012-08-22 22:09:25',27,'MPL_47'),(170584,21,'2012-08-22 22:09:25',27,'MPL_47'),(170585,19,'2012-08-22 23:11:51',27,'MPL_47'),(170585,23,'2012-08-22 23:11:51',27,'MPL_47'),(170586,19,'2012-08-22 23:14:47',27,'MPL_47'),(170586,23,'2012-08-22 23:14:47',27,'MPL_47'),(170587,19,'2012-08-22 23:16:59',27,'MPL_47'),(170587,23,'2012-08-22 23:16:59',27,'MPL_47');
/*!40000 ALTER TABLE `User_UserHasRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vat`
--

DROP TABLE IF EXISTS `Vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vat` (
  `ID` char(2) NOT NULL,
  `Rate` decimal(4,1) DEFAULT NULL,
  `Description` varchar(50) NOT NULL DEFAULT '',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Description` (`Description`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vat`
--

LOCK TABLES `Vat` WRITE;
/*!40000 ALTER TABLE `Vat` DISABLE KEYS */;
INSERT INTO `Vat` VALUES ('1',0.0,'Zero-rated 2','2010-09-13 06:30:45',NULL,'OMC'),('12',0.0,'Zero-rated 3','2010-09-12 22:00:00',NULL,'OMC'),('14',14.0,'Standard 2','2011-02-02 10:16:57',NULL,'OMC'),('E',0.0,'Exempt','2002-08-27 14:17:59',NULL,'OMC'),('N',0.0,'Not registered','2002-08-27 14:17:59',NULL,'OMC'),('S',14.0,'Standard','2011-02-02 10:16:57',NULL,'OMC'),('Z',0.0,'Zero-rated','2002-08-27 14:17:59',NULL,'OMC');
/*!40000 ALTER TABLE `Vat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VoidLineItem`
--

DROP TABLE IF EXISTS `VoidLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VoidLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Qty` double NOT NULL DEFAULT '0',
  `Reason` varchar(255) NOT NULL,
  `AuthUserID` int(11) NOT NULL DEFAULT '0',
  `VoidDate` datetime NOT NULL,
  `Recoverable` tinyint(1) NOT NULL DEFAULT '0',
  `SaleID` int(11) NOT NULL DEFAULT '0',
  `ExportFlag` int(11) NOT NULL DEFAULT '0',
  `EndShiftID` int(11) NOT NULL DEFAULT '0',
  `VoidedPrice` double(15,5) NOT NULL DEFAULT '0.00000',
  `UserID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VoidLineItem`
--

LOCK TABLES `VoidLineItem` WRITE;
/*!40000 ALTER TABLE `VoidLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `VoidLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VoidReason`
--

DROP TABLE IF EXISTS `VoidReason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VoidReason` (
  `Reason` varchar(30) DEFAULT NULL,
  `Recoverable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VoidReason`
--

LOCK TABLES `VoidReason` WRITE;
/*!40000 ALTER TABLE `VoidReason` DISABLE KEYS */;
/*!40000 ALTER TABLE `VoidReason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VoidTable`
--

DROP TABLE IF EXISTS `VoidTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VoidTable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OpenSaleID` int(11) NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `Common_AuthUserID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VoidTable`
--

LOCK TABLES `VoidTable` WRITE;
/*!40000 ALTER TABLE `VoidTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `VoidTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vouchers`
--

DROP TABLE IF EXISTS `Vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vouchers` (
  `ID` int(11) NOT NULL,
  `Serial` varchar(40) NOT NULL,
  `Value` double NOT NULL,
  `Redeemed` varchar(1) NOT NULL,
  `Branch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vouchers`
--

LOCK TABLES `Vouchers` WRITE;
/*!40000 ALTER TABLE `Vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaiterOMRConfig`
--

DROP TABLE IF EXISTS `WaiterOMRConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaiterOMRConfig` (
  `ConfigOption` varchar(100) NOT NULL DEFAULT '',
  `Value` varchar(100) DEFAULT '',
  PRIMARY KEY (`ConfigOption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaiterOMRConfig`
--

LOCK TABLES `WaiterOMRConfig` WRITE;
/*!40000 ALTER TABLE `WaiterOMRConfig` DISABLE KEYS */;
INSERT INTO `WaiterOMRConfig` VALUES ('Address','0'),('AllowWaiterReprintBill','0'),('AutoLogoutTime','5'),('Background','tehgrand.png'),('CashupSlipDetail','Full'),('CashupSlipSummary','No'),('CommissionPaid','Daily'),('Company','OBC Malamulele'),('CoRegNo',''),('EMail',''),('FaxNo',''),('ForceConsolidatedCashup','False'),('GRV_GraceDiff','10'),('GRV_GraceDiff_Pers','1'),('InvoicePrintType','Slip'),('PostalCode',''),('Serial',''),('SlipHeader','OBC Malamulele'),('Suburb','Malamulele'),('System','FMCG'),('TakeAwaysEnabled','False'),('TelNo','011 704 1018'),('VatNo','Pending'),('WaitersMayDiscount','false'),('WaitersMayPOS','False'),('WaitersMaySplit','False');
/*!40000 ALTER TABLE `WaiterOMRConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaiterTable`
--

DROP TABLE IF EXISTS `WaiterTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaiterTable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TableAreaID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaiterTable`
--

LOCK TABLES `WaiterTable` WRITE;
/*!40000 ALTER TABLE `WaiterTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `WaiterTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaiterTableArea`
--

DROP TABLE IF EXISTS `WaiterTableArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaiterTableArea` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaiterTableArea`
--

LOCK TABLES `WaiterTableArea` WRITE;
/*!40000 ALTER TABLE `WaiterTableArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `WaiterTableArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wards`
--

DROP TABLE IF EXISTS `Wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wards` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wards`
--

LOCK TABLES `Wards` WRITE;
/*!40000 ALTER TABLE `Wards` DISABLE KEYS */;
/*!40000 ALTER TABLE `Wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrder`
--

DROP TABLE IF EXISTS `WorkOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseOrderID` int(11) DEFAULT NULL,
  `EntityAccountID` int(11) unsigned NOT NULL DEFAULT '0',
  `StateID` char(3) NOT NULL DEFAULT 'OPN',
  `ExpectedDate` date NOT NULL DEFAULT '0000-00-00',
  `CompletedDate` date DEFAULT NULL,
  `Sequence` int(3) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `StateID` (`StateID`),
  KEY `EntityAccountID` (`EntityAccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrder`
--

LOCK TABLES `WorkOrder` WRITE;
/*!40000 ALTER TABLE `WorkOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrderItem`
--

DROP TABLE IF EXISTS `WorkOrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrderItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkOrderLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `WorkOrderLineItem` (`WorkOrderLineItemID`,`StockUnitID`),
  KEY `SourceID` (`SourceID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `StockUnitID` (`StockUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrderItem`
--

LOCK TABLES `WorkOrderItem` WRITE;
/*!40000 ALTER TABLE `WorkOrderItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrderLineItem`
--

DROP TABLE IF EXISTS `WorkOrderLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrderLineItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkOrderID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Quantity` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Received` decimal(9,3) DEFAULT NULL,
  `UnitCost` decimal(9,3) DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  `OriginalID` varchar(6) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ModifierID` (`ModifierID`),
  KEY `SourceID` (`SourceID`),
  KEY `WorkOrderID` (`WorkOrderID`),
  KEY `StockUnitID` (`StockUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrderLineItem`
--

LOCK TABLES `WorkOrderLineItem` WRITE;
/*!40000 ALTER TABLE `WorkOrderLineItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrderLineItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrderLineItemTransaction`
--

DROP TABLE IF EXISTS `WorkOrderLineItemTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrderLineItemTransaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionID` int(11) NOT NULL DEFAULT '0',
  `WorkOrderLineItemID` int(11) NOT NULL DEFAULT '0',
  `StockUnitID` int(11) NOT NULL DEFAULT '0',
  `Quantity` decimal(9,3) NOT NULL DEFAULT '0.000',
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) NOT NULL DEFAULT '0',
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SourceID` (`SourceID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `WorkOrderLineItemID` (`WorkOrderLineItemID`),
  KEY `StockUnitID` (`StockUnitID`),
  KEY `ModifierID` (`ModifierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrderLineItemTransaction`
--

LOCK TABLES `WorkOrderLineItemTransaction` WRITE;
/*!40000 ALTER TABLE `WorkOrderLineItemTransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrderLineItemTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrderTransaction`
--

DROP TABLE IF EXISTS `WorkOrderTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrderTransaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionID` int(11) NOT NULL DEFAULT '0',
  `WorkOrderID` int(11) NOT NULL DEFAULT '0',
  `StateID` char(3) NOT NULL DEFAULT '',
  `ExpectedDate` datetime DEFAULT NULL,
  `SourceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SourceID` (`SourceID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `WorkOrderID` (`WorkOrderID`),
  KEY `StateID` (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrderTransaction`
--

LOCK TABLES `WorkOrderTransaction` WRITE;
/*!40000 ALTER TABLE `WorkOrderTransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrderTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ints`
--

DROP TABLE IF EXISTS `ints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ints` (
  `i` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='use for reporting';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ints`
--

LOCK TABLES `ints` WRITE;
/*!40000 ALTER TABLE `ints` DISABLE KEYS */;
INSERT INTO `ints` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `ints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test2`
--

DROP TABLE IF EXISTS `test2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test2` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test2`
--

LOCK TABLES `test2` WRITE;
/*!40000 ALTER TABLE `test2` DISABLE KEYS */;
/*!40000 ALTER TABLE `test2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test5`
--

DROP TABLE IF EXISTS `test5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test5` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test5`
--

LOCK TABLES `test5` WRITE;
/*!40000 ALTER TABLE `test5` DISABLE KEYS */;
/*!40000 ALTER TABLE `test5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp1`
--

DROP TABLE IF EXISTS `tmp1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp1` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `StockCategoryID` char(10) DEFAULT NULL,
  `Type` enum('Stock','Service') NOT NULL DEFAULT 'Stock',
  `Code` char(15) NOT NULL DEFAULT '',
  `BarCode` char(13) DEFAULT NULL,
  `Name` char(50) NOT NULL DEFAULT '',
  `VatID` char(1) NOT NULL DEFAULT 'S',
  `LowerPurchasesLeadTime` int(11) DEFAULT NULL,
  `UpperPurchasesLeadTime` int(11) DEFAULT NULL,
  `Sellable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `Findable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `StockAccountID` char(6) NOT NULL DEFAULT 'STOCK',
  `IncomeAccountID` char(6) NOT NULL DEFAULT 'SALES',
  `COSAccountID` char(6) NOT NULL DEFAULT 'COS',
  `ConsignorID` int(11) unsigned DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifierID` int(11) DEFAULT NULL,
  `SourceID` char(10) DEFAULT NULL,
  `PrintLocationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp1`
--

LOCK TABLES `tmp1` WRITE;
/*!40000 ALTER TABLE `tmp1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zrun`
--

DROP TABLE IF EXISTS `zrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zrun` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Adjustment` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Date` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zrun`
--

LOCK TABLES `zrun` WRITE;
/*!40000 ALTER TABLE `zrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `zrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Terminal_FMCG'
--
/*!50003 DROP FUNCTION IF EXISTS `GetCurrentPeriod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `GetCurrentPeriod`() RETURNS char(6) CHARSET utf8
    DETERMINISTIC
BEGIN
    RETURN DATE_FORMAT(NOW(),"%Y%m");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Incl2Excl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `Incl2Excl`(inIncl DECIMAL(14,5)) RETURNS decimal(14,5)
    DETERMINISTIC
BEGIN
    RETURN inIncl*100.0/114.0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Incl2Vat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `Incl2Vat`(inIncl DECIMAL(14,5)) RETURNS decimal(14,5)
    DETERMINISTIC
BEGIN
    RETURN inIncl - Incl2Excl(inIncl);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISNUMERIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `ISNUMERIC`(myVal VARCHAR(1024)) RETURNS tinyint(1)
    DETERMINISTIC
RETURN myVal REGEXP '^(-|\\+)?([0-9]+\\.[0-9]*|[0-9]*\\.[0-9]+|[0-9]+)$' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `OBE_GetCurrentPeriod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `OBE_GetCurrentPeriod`() RETURNS char(6) CHARSET utf8
    DETERMINISTIC
BEGIN
    RETURN DATE_FORMAT(NOW(),"%Y%m");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `OBE_Incl2Excl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `OBE_Incl2Excl`(inIncl DECIMAL(14,5)) RETURNS decimal(14,5)
    DETERMINISTIC
BEGIN
    RETURN inIncl*100.0/114.0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `OBE_Incl2Vat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `OBE_Incl2Vat`(inIncl DECIMAL(14,5)) RETURNS decimal(14,5)
    DETERMINISTIC
BEGIN
    RETURN inIncl - OBE_Incl2Excl(inIncl);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelCashup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CancelCashup`(IN inWaiterID INTEGER)
BEGIN
	DELETE FROM Cashup Where 
		TillCashupID in 
			(SELECT ID FROM Transaction WHERE 
				Common_AuthUserID = inWaiterID AND 
				TransactionTypeID IN ('TC', 'CU') AND 
				Date > (Select MAX(Date) From zrun)
			);
	DELETE FROM Transaction WHERE 
				Common_AuthUserID = inWaiterID AND 
				TransactionTypeID IN ('TC', 'CU') AND 
				Date > (Select MAX(Date) From zrun);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CloseOpenSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CloseOpenSale`(IN inOpenSaleID INTEGER, IN inSaleID INTEGER)
BEGIN
	DECLARE Disc DECIMAL(11,5);
	SET Disc = (SELECT Discount FROM Sale WHERE ID = inSaleID);
	UPDATE OpenSale SET
		State = 'closed',
		SaleID = inSaleID,
		DiscountAmount = Disc
	WHERE ID = inOpenSaleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccountTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CreateAccountTransaction`(IN inSourceID VARCHAR(10),
	IN inTransactionID INTEGER,
	IN inAccountID VARCHAR(6), 
	IN inAmount DECIMAL(14,5),
	IN inDesc VARCHAR(20),
	IN inModifierID INTEGER)
BEGIN
	INSERT INTO AccountTransaction VALUES ( 
		NULL, 
		inAccountID, 
		inTransactionID, 
		inDesc, 
		inAmount, 
		NULL,
		inSourceID, 
		NULL, 
		NOW(), 
		inModifierID
	);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateEntityAccountTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CreateEntityAccountTransaction`(IN inSourceID VARCHAR(10), 
	 IN inEntityAccountID INTEGER,
	 IN inTransID INTEGER,
	 IN inAmount DECIMAL(14,5),
	 IN inModifierID INTEGER)
BEGIN
	INSERT INTO EntityAccountTransaction VALUES (NULL, inEntityAccountID, inTransID, inAmount, 0, inSourceID, 0, NOW(), inModifierID);
	UPDATE EntityAccount SET
		AccountBalance = AccountBalance + inAmount
	WHERE ID = inEntityAccountID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateOpenTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CreateOpenTable`(IN inWaiterID INTEGER,
	 IN inTableName VARCHAR(20), 
	 IN inTableCount INTEGER, 
	 OUT outOpenSaleID INTEGER)
BEGIN
	INSERT INTO OpenSale VALUES( 
		NULL,				
		inTableName,		
		'open',				
		inWaiterID,			
		NOW(),				
		NULL,				
		0,					
		0,					
		inTableCount,		
		0.0);				
	SET outOpenSaleID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`PenguinPOS`@`localhost`*/ /*!50003 PROCEDURE `CreateSale`(
    IN inEndShiftID INTEGER,
    IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inAuthUserID INTEGER, 
	 IN inEntityAccountID INTEGER,
	 IN inPaymentMethodID CHAR(2), 
	 IN inDiscountPercentage DECIMAL(4,3),
	 IN inDiscount DECIMAL(14,5),
	 IN inExclusive DECIMAL(14,5),
	 IN inVat  DECIMAL(14,5),
	 IN inTip DECIMAL(14,5),
	 IN inModifierID INT, 
         IN inCash DECIMAL(11,2),
         IN inCheck DECIMAL(11,2),
         IN inCred DECIMAL(11,2),
         IN inAcc DECIMAL(11,2),
         IN inRound DECIMAL(11,2),
	 IN inEntityID INTEGER,
  	 IN inCurID CHAR(10),
	 IN inCurExchange DECIMAL(9,2),
	 IN inCurValue DECIMAL(9,2),
	 IN inAuthDiscountID INTEGER,
	OUT outSaleID INT)
BEGIN
	INSERT INTO Sale 
 (`ID`,
`EntityAccountID`,
`Common_AuthUserID`,
`Date`,
`PaymentMethodID`,
`DiscountPercentage`,
`Discount`,
`ReversalID`,
`Cost`,
`Exclusive`,
`Vat`,
`Tip`,
`Paid`,
`Period`,
`SourceID`,
`OriginalID`,
`Modified`,
`ModifierID`,
`TransactionID`,
`Notes`,
`Reference`,
`Cash`,
`Cheque`,
`CredCard`,
`Account`,
`ExportFlag`,
`Rounding`,
`EntityID`,
`CurrencyPaid`,
`CurrencyExchange`,
`CurrencyCash`,
`EndShiftID`,
`AuthUserID_Discount`)
       VALUES( 
		NULL,
		inEntityAccountID,
		inAuthUserID,
		NOW(),
		inPaymentMethodID,
		inDiscountPercentage,
		inDiscount,
		NULL,
		0,		
		inExclusive,
		inVat,
		inTip,
		NOW(),
		GetCurrentPeriod(),
		inSourceID,
		NULL,
		NOW(),
		inModifierID,
		inTransactionID,
		NULL,
		NULL,
                inCash,
                inCheck,
                inCred,
                inAcc,
                4,
		inRound,
		inEntityID,
		inCurID,
		inCurExchange,
		inCurValue*inCurExchange,
    inEndShiftID,
    inAuthDiscountID
                );
		
	SET outSaleID = (SELECT LAST_INSERT_ID());

	IF (inTip <> 0) THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("Tip","","",inTip,0,outSaleID,0,inEndShiftID);
	END IF;

	IF (inCash <> 0) THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("Cash","","",inCash,0,outSaleID,0,inEndShiftID);
	END IF;

	IF (inCred <> 0) THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("CredCard","","",inCred,0,outSaleID,0,inEndShiftID);
	END IF;

	IF (inCheck <> 0) THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("Cheque","","",inCheck,0,outSaleID,0,inEndShiftID);
	END IF;

	IF (inCurID <> '') THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("Cash",inCurID,"",inCurValue*inCurExchange,inCurExchange,outSaleID,0,inEndShiftID);
	END IF;

	IF (inEntityID <> 0) AND (inAcc <> 0) THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("Account","",inEntityID,inAcc,0,outSaleID,0,inEndShiftID);
	END IF;

	IF (inEntityID <> 0) AND (inCash <> 0) THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("AccountPay","","CASH",inCash,inEntityID,outSaleID,0,inEndShiftID);
	END IF;

	IF (inEntityID <> 0) AND (inCred <> 0) THEN
		INSERT INTO SalePaid (PaymentType,PaymentRef,PaymentRef2,Value1,Value2,SaleID,ExportFlag,EndShiftID) 
		VALUES ("AccountPay","","Card",inCred,inEntityID,outSaleID,0,inEndShiftID);
	END IF;

	UPDATE SalePaid Set SaleID = outSaleID Where SaleID = -1;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateStockTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CreateStockTransaction`(IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inStockUnitID INTEGER,
	 IN inLocID INTEGER,
	 IN inQty DECIMAL(9,3),
	 IN inUnitCost DECIMAL(14,5),
	 IN inDesc VARCHAR(20),
	 IN inModifierID INTEGER)
BEGIN
	INSERT INTO StockTransaction VALUES( 
		NULL,
		inStockUnitID,
		inTransactionID,
		inLocID,
		'Available',	
		inQty,
		inUnitCost,
		NOW(),
		inDesc,
		inSourceID,
		NULL,
		NOW(), 
		inModifierID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CreateTransaction`(IN inSourceID VARCHAR(10), 
	 IN inAuthUserID INT , 
	 IN inTypeID CHAR(2), 
	 IN inModifierID INT,
	 OUT outTransactionID INT)
BEGIN
    INSERT INTO Transaction VALUES( 
		NULL, 
		NOW(), 
		inAuthUserID, 
		NULL, 
		inTypeID, 
		NULL,
		NULL, 
		'N', 
		GetCurrentPeriod(), 
		inSourceID, 
		NULL, 
		NOW(), 
		inModifierID,
		'N',
		0);
	SET outTransactionID  = LAST_INSERT_ID();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `DeleteTable`(
	IN inOpenSaleID INT
)
BEGIN
	DELETE FROM OpenSaleGroupingLineItem WHERE OpenSaleLineItemID IN (SELECT ID FROM OpenSaleLineItem WHERE OpenSaleID = inOpenSaleID);
	DELETE FROM OpenSaleHiddenLineItem WHERE OpenSaleID = inOpenSaleID;
	DELETE FROM OpenSaleLineItem WHERE OpenSaleID = inOpenSaleID;
	DELETE FROM OpenSaleLineItemSave WHERE OpenSaleID = inOpenSaleID;
	DELETE FROM OpenSale WHERE ID = inOpenSaleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DoStockCostChange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `DoStockCostChange`(
	 IN inStockUnitID INTEGER,
	 IN inOldUnitCost DECIMAL(14,5),
	 IN inNewUnitCost DECIMAL(14,5))
BEGIN
	INSERT INTO StockCostChanges (StockUnitID,OldCost,NewCost,ChangeDate,Modified) VALUES( 
		inStockUnitID,
		inOldUnitCost,
		inNewUnitCost,
		NOW(), 
		NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FinishCashup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `FinishCashup`(IN inWaiterID INTEGER,
	IN inCSTill DECIMAL(14,3),
	IN inCCTill DECIMAL(14,3),
	IN inCQTill DECIMAL(14,3),
	IN inACTill DECIMAL(14,3),
	IN inCSSys DECIMAL(14,3),
	IN inCCSys DECIMAL(14,3),
	IN inCQSys DECIMAL(14,3),
	IN inACSys DECIMAL(14,3),
	IN inTipsOut DECIMAL(14,3),
	IN inBreakage DECIMAL(14,3),
	IN inCom DECIMAL(14,3),
	IN inModifierID INTEGER)
BEGIN
	DECLARE cashupState CHAR(4);
	DECLARE transID INTEGER;
	DECLARE transTCID INTEGER;
	SET transTCID = (
		SELECT ID FROM Transaction WHERE 
			Common_AuthUserID = inWaiterID AND
			TransactionTypeID = 'TC' AND
			Date > (SELECT MAX(Date) FROM zrun)
	);
	CALL WaiterCashupState(inWaiterID, cashupState);
	IF cashupState = 'Busy' THEN
		CALL CreateTransaction('BIO', inWaiterID, 'CU', inModifierID, transID);
		INSERT INTO Cashup
			(TillCashupID, CSTill, CSSys, CCTill, CCSys, CQTill, CQSys, ACTill, ACSys, CashOut, TipsOut, Breakage,ComissionValue, SourceID)
		VALUES (
			transTCID,
			inCSTill,
			inCSSys,
			inCCTill,
			inCCSys,
			inCQTill,
			inCQSys,
			inACTill,
			inACSys,
			inCSTill,
			inTipsOut,
			inBreakage,
			inCom,
			'BIO'
		);
		UPDATE AuthUser SET ZRunState = 'BlockSale' WHERE ID = inWaiterID;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDaySaleTotals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetDaySaleTotals`(
	OUT outLastZRun CHAR(20),
	OUT outClosedTotal DECIMAL(14,5),
	OUT outClosedExclusive DECIMAL(14,5),
	OUT outClosedVAT DECIMAL(14,5),
	OUT outOpenTotal DECIMAL(14,5),
	OUT outOpenExclusive DECIMAL(14,5),
	OUT outOpenVAT DECIMAL(14,5)
)
BEGIN
	SET outLastZRun = (SELECT MAX(Date) FROM zrun) ;

	SET outClosedTotal = 0;
	SET outClosedExclusive = 0;
	SET outClosedVAT = 0;
	SET outOpenTotal = 0;
	SET outOpenExclusive = 0;
	SET outOpenVAT = 0;
	SELECT
		SUM(Sale.Exclusive + Sale.Vat-Sale.Discount),
		SUM((Sale.Exclusive + Sale.Vat-Sale.Discount)*100/114),
		SUM((Sale.Exclusive + Sale.Vat-Sale.Discount)*14/114)
	
	INTO outClosedTotal, outClosedExclusive, outClosedVAT
	FROM Sale
	inner join OpenSale
	on Sale.ID = OpenSale.SaleID
	WHERE Sale.Date > outLastZRun AND
		Sale.TransactionID IS NOT NULL;
	
	SELECT
		SUM(UnitPrice*Quantity) AS Total
	INTO outOpenTotal
	FROM OpenSaleLineItem
		INNER JOIN OpenSale ON OpenSale.ID = OpenSaleLineItem.OpenSaleID
	WHERE OpenSale.State = 'open' AND
		OpenSale.Time > outLastZRun;
	
	SET outOpenExclusive = (SELECT ifnull(outOpenTotal * 100/114,0));
	SET outOpenVAT = (SELECT outOpenTotal - outOpenExclusive);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTableInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetTableInfo`(
	IN inOpenSaleID INT
)
BEGIN
	SELECT CONCAT(TableNo, ' ', OrderID) AS TableName
	FROM OpenSale
	WHERE ID = inOpenSaleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTableTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetTableTotal`(IN inOpenSaleID INTEGER,
	 OUT outQuantity DECIMAL(9,2),		
	 OUT outPriceIncl DECIMAL(14,5))
BEGIN
	DECLARE tSaleQty 	DECIMAL(9,2);
	DECLARE tSalePrice	DECIMAL(14,5);
	
	SET outQuantity  = 0;
	SET outPriceIncl = 0;
	
	SELECT
		SUM( IFNULL(Quantity, 0) ), 
		SUM( IFNULL(UnitPrice*Quantity, 0) ) 
	INTO
		tSaleQty, tSalePrice
	FROM 
		OpenSaleLineItem 
	WHERE 
		OpenSaleID = inOpenSaleID;
		
	SET outPriceIncl = outPriceIncl + IFNULL(tSalePrice, 0);
	SET outQuantity  = outQuantity  + IFNULL(tSaleQty, 0);
	
	SELECT
		SUM(1), 						
		SUM(1 * IFNULL(StockUnit.Price, 0) ) 			
	INTO
		tSaleQty, tSalePrice
	FROM OpenSaleGroupingLineItem
		INNER JOIN StockModifierLineItem ON StockModifierLineItemID = StockModifierLineItem.ID
		INNER JOIN StockUnit ON StockUnit.ID = StockModifierLineItem.StockUnitID
		INNER JOIN OpenSaleLineItem ON OpenSaleLineItemID = OpenSaleLineItem.ID 
	WHERE 
		OpenSaleID = inOpenSaleID;
		
	SET outQuantity  = outQuantity  + IFNULL(tSaleQty, 0);
	SET outPriceIncl = outPriceIncl + IFNULL(tSalePrice, 0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ItemCountOnTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `ItemCountOnTable`(IN inName VARCHAR(20),
	IN inExtension TEXT)
BEGIN
	SELECT
		COUNT(*) AS ItemCount
	FROM OpenSale OS
		INNER JOIN OpenSaleLineItem OSLI ON OSLI.OpenSaleID = OS.ID
	WHERE OS.TableNo = inName AND
		OS.OrderID = inExtension AND
		OS.State = 'open';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_AdjustStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_AdjustStock`(
	IN inStockUnitID	INTEGER,
	IN inStockLocationID	INTEGER,
	IN inQuantity		DOUBLE(14,5),
	IN inCostExcl		DOUBLE(14,5),

	IN inTransactionID	INTEGER,
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER
	)
BEGIN
 	DECLARE tFound INTEGER;
	SET tFound = (SELECT Quantity FROM StockLocationQuantity WHERE StockUnitID = inStockUnitID AND LocationID = inStockLocationID);

	IF tFound IS NULL THEN
		INSERT INTO StockLocationQuantity (StockUnitID,LocationID,Quantity)
					VALUES (inStockUnitID,inStockLocationID,inQuantity);
	ELSE
		UPDATE StockLocationQuantity SET 
			Quantity = Quantity + inQuantity
		WHERE StockUnitID = inStockUnitID AND LocationID = inStockLocationID;
	END IF;

	INSERT INTO StockTransaction (StockUnitID,TransactionID,LocationID,State,Quantity,UnitCost,CostDate,Description,SourceID,OriginalID,Modified,ModifierID)
			VALUES (inStockUnitID,inTransactionID,inStockLocationID,'Available',inQuantity,inCostExcl,NOW(),'Adjust',inSourceID,0,NOW(),0);
	
	UPDATE StockUnit SET SOH_Quantity = SOH_Quantity + inQuantity WHERE ID = inStockUnitID;

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_ClearStockSheetLineItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_ClearStockSheetLineItems`(
	IN inStockSheetID	INTEGER
	)
BEGIN

	DELETE FROM StockSheetLineItem WHERE StockSheetID = inStockSheetID;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateClass`(
	IN inUserClassName		CHAR(50),
	IN inUserClassDescription	CHAR(50),
	IN inActive			CHAR(5),
	IN inModifiedBy			INTEGER,
	IN inSourceID			CHAR(30),
	OUT outID			INTEGER
)
BEGIN
	
	INSERT INTO User_Class (UserClassName,UserClassDescription,Active,Modified,ModifiedBy,SourceID) 
		VALUES (inUserClassName,inUserClassDescription,inActive,NOW(),inModifiedBy,inSourceID);
	SET outID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateClassHasAttribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateClassHasAttribute`(
	IN inClassID			INTEGER,
	IN inAttributeID			INTEGER,
	IN inSourceID			CHAR(30),
	IN inModifiedBy			INTEGER
	)
BEGIN
	INSERT INTO User_ClassHasAttribute (ClassID,AttributeID,SourceID,ModifiedBy,Modified)
			VALUES (inClassID,inAttributeID,inSourceID,inModifiedBy,NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateCreditNote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateCreditNote`(
	IN inPurchaseOrderID		INTEGER,
	IN inSourceID			VARCHAR(10),
	IN inAuthUser			INTEGER
	)
BEGIN
	INSERT INTO CreditNote (PurchaseNoteID,ReferanceNo,Notes,SourceID,ModifiedBy,Modified,Completed)
			VALUES (inPurchaseOrderID,'','',inSourceID,inAuthUser,NOW(),0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateEntityAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateEntityAccount`(
	IN inSourceID		CHAR(50),
	IN inEntityID		INTEGER,
	IN inAccountType	CHAR(10),
	IN inLimitAccount	CHAR(50),
	IN inModifierID		INTEGER,
	in inAccountActive	CHAR(10)
)
BEGIN

INSERT INTO EntityAccount(SourceID,EntityID,EntityAccountTemplateID,
			 LimitAmount,ModifierID,Modified,AccountBalance,
			 Active) VALUES (
			inSourceID,
			inEntityID,
			inAccountType,
			inLimitAccount,
			inModifierID,
			Now(),0,inAccountActive);		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateEntityDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateEntityDetails`(
	IN inIDNumber		VARCHAR(13),
	IN inFirstName		VARCHAR(30),
	IN inSurname		VARCHAR(30),
	IN inTel		VARCHAR(30),
	IN inCell		VARCHAR(30),
	IN inFax		VARCHAR(30),
	IN inEMail		VARCHAR(50),
	IN inPhysical		TEXT,
	IN inPostal		TEXT,
	IN inDeliver		TEXT,
	OUT outID	 	INTEGER
	)
BEGIN
	INSERT INTO Entity
			(IDNumber,FirstName,LastName,Phone,Cell,Fax,Email,PhysicalAddress,PostalAddress,DeliveryAddress)
		VALUES (inIDNumber,inFirstName,inSurname,inTel,inCell,inFax,inEMail,inPhysical,inPostal,inDeliver);
	SET outID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateInvoice`(
	IN inEntityAccountID	INTEGER,
	IN inExpectedDate	VARCHAR(20),
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER,
	IN inPaymentMethodID	VARCHAR(2),
	IN inRef		VARCHAR(50),
	IN inOwnRef		VARCHAR(50),
	OUT outPurchaseOrderID 	INTEGER
	)
BEGIN
	INSERT INTO PurchaseOrder 
			(EntityAccountID,ExpectedDate,Reversed,SourceID,OriginalID,Modified,ModifierID,TransactionID,OrderComplete,OrderType,PaymentMethodID,RefNo,OwnRefNo)
		VALUES (inEntityAccountID,inExpectedDate,'N',inSourceID,0,NOW(),inAuthUser,0,0,'Invoice',inPaymentMethodID,inRef,inOwnRef);
	SET outPurchaseOrderID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateLocation`(
	IN inName		CHAR(50),
	IN inSource		CHAR(10),
	IN inAuthUser		INTEGER,
	OUT outUID		INTEGER
)
BEGIN
	DECLARE tout INTEGER;

	INSERT INTO Location (Name,Active,Created,Modified,SourceID,ModifiedBy)
		VALUES (inName,1,NOW(),NOW(),inSource,inAuthUser);
	SET outUID = (SELECT LAST_INSERT_ID());

	CALL NBO_CreateSubLocation(outUID,'Default',1,inSource,inAuthUser,tout);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreatePurchaseOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreatePurchaseOrder`(
	IN inEntityAccountID	INTEGER,
	IN inExpectedDate	VARCHAR(20),
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER,
	IN inPaymentMethodID	VARCHAR(2),
	IN inRef		VARCHAR(50),
	IN inOwnRef		VARCHAR(50),
	OUT outPurchaseOrderID 	INTEGER
	)
BEGIN
	INSERT INTO PurchaseOrder 
			(EntityAccountID,ExpectedDate,Reversed,SourceID,OriginalID,Modified,ModifierID,TransactionID,OrderComplete,OrderType,PaymentMethodID,RefNo,OwnRefNo)
		VALUES (inEntityAccountID,inExpectedDate,'N',inSourceID,0,NOW(),inAuthUser,0,0,'PurchaseOrder',inPaymentMethodID,inRef,inOwnRef);
	SET outPurchaseOrderID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreatePurchaseOrderLineItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreatePurchaseOrderLineItem`(
	IN inPurchaseOrderID	INTEGER,
	IN inStockMetricUnitID	INTEGER,
	IN inQuantity		DOUBLE(14,5),
	IN inPriceExcl		DOUBLE(14,5),
	IN inPriceIncl		DOUBLE(14,5),
	IN inShort		DOUBLE(14,5),
	IN inDefault		INTEGER,
	IN inDiscount		DOUBLE(14,5),
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER
	)
BEGIN
	INSERT INTO PurchaseOrderLineItem (PurchaseOrderID,StockMetricUnitID,OrderUnitPriceIncl,Quantity,SourceID,OriginalID,Modified,ModifierID,UnitPriceExcl,Short,Completed,UnitPriceIncl,Unknown,OrderQty,Discount)
				VALUES (inPurchaseOrderID,inStockMetricUnitID,0,inQuantity,inSourceID,inAuthUser,NOW(),0,inPriceExcl,inShort,0,inPriceIncl,inDefault,inQuantity,inDiscount);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateRole`(
	IN inUserRoleName		CHAR(50),
	IN inUserRoleDescription	CHAR(50),
	IN inActive			CHAR(5),
	IN inModifiedBy			INTEGER,
	IN inSourceID			CHAR(30),
	OUT outID			INTEGER
)
BEGIN
	
	INSERT INTO User_Role (UserRoleName,UserRoleDescription,Active,Modified,ModifiedBy,SourceID) 
		VALUES (inUserRoleName,inUserRoleDescription,inActive,NOW(),inModifiedBy,inSourceID);
	SET outID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateRoleHasClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateRoleHasClass`(
	IN inRoleID			INTEGER,
	IN inClassID			INTEGER,
	IN inSourceID			CHAR(30),
	IN inModifiedBy			INTEGER
	)
BEGIN
	INSERT INTO User_RoleHasClass (RoleID,ClassID,SourceID,ModifiedBy,Modified)
			VALUES (inRoleID,inClassID,inSourceID,inModifiedBy,NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateStockMetricUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateStockMetricUnit`(
	IN inStockID 		INTEGER,
	IN inMultiplier 	DOUBLE,
	IN inName		CHAR(50)
	)
BEGIN
	Insert Into StockMetricUnit (Name,StockID,Multiplier,Barcode)
		Values (inName,inStockID,inMultiplier,'');


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateStockSheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateStockSheet`(
	IN inAuthUserID		INTEGER,
	IN inDescription	CHAR(50),
	OUT outStockSheetID	INTEGER
	)
BEGIN

	DECLARE nstockID INTEGER;

	INSERT INTO StockSheet (Common_AuthUserID,Captured,Modified,ModifierID,SourceID,Description)
		VALUES (inAuthUserID,NOW(),NOW(),null,null,inDescription);

	SET outStockSheetID = (SELECT LAST_INSERT_ID());
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateStockSheetLineItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateStockSheetLineItem`(
	IN inStockSheetID	INTEGER,
	IN inStockUnitID	INTEGER
	)
BEGIN

	INSERT INTO StockSheetLineItem (StockSheetID,StockUnitID,Modified,ModifierID,SourceID)
		VALUES (inStockSheetID,inStockUnitID,NOW(),null,null);
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateStockTake` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateStockTake`(
	IN inStockSheetID	INTEGER,
	IN inStockTakeType	CHAR(20),
	IN inSortOrder		CHAR(20),
	OUT outStockTakeID	INTEGER
	)
BEGIN

	DECLARE nstockID INTEGER;

	INSERT INTO StockTake (StartDate,EndDate,Modified,StockSheetID,StockTakeType,SortOrder,Completed)
		VALUES (NOW(),'1980-01-01 00:00:00',NOW(),inStockSheetID,inStockTakeType,inSortOrder,0);

	SET outStockTakeID = (SELECT LAST_INSERT_ID());
	
	IF inStockSheetID <> -1 THEN

		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SSLI.StockUnitID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockSheetLineItem SSLI 
		JOIN StockUnit SU 
			ON (SU.ID = SSLI.StockUnitID)
		JOIN Stock S 
			ON (S.ID = SSLI.StockUnitID)
		JOIN SubLocation SL 
			ON (SL.ID = S.SubLocationID AND S.SubLocationID <> -1)
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		WHERE 
			SSLI.StockSheetID = inStockSheetID
		ORDER BY StockUnitID;

		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SSLI.StockUnitID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockSheetLineItem SSLI 
		JOIN StockUnit SU 
			ON (SU.ID = SSLI.StockUnitID)
		JOIN Stock S 
			ON (S.ID = SSLI.StockUnitID)
		JOIN SubLocation SL 
			ON ((SL.ID = S.SubLocationID2) AND (S.SubLocationID2 <> -1) AND (S.SubLocationID != S.SubLocationID2))
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		WHERE 
			SSLI.StockSheetID = inStockSheetID
		ORDER BY StockUnitID;

		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SSLI.StockUnitID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockSheetLineItem SSLI 
		JOIN StockUnit SU 
			ON (SU.ID = SSLI.StockUnitID)
		JOIN Stock S 
			ON (S.ID = SSLI.StockUnitID)
		JOIN SubLocation SL 
			ON ((SL.ID = S.SubLocationID3 AND S.SubLocationID3 <> -1)  AND (S.SubLocationID != S.SubLocationID3)  AND (S.SubLocationID2 != S.SubLocationID3))
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		WHERE 
			SSLI.StockSheetID = inStockSheetID
		ORDER BY StockUnitID;

		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SSLI.StockUnitID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockSheetLineItem SSLI 
		JOIN StockUnit SU 
			ON (SU.ID = SSLI.StockUnitID)
		JOIN Stock S 
			ON (S.ID = SSLI.StockUnitID)
		JOIN SubLocation SL 
			ON ((SL.ID = S.SubLocationID4 AND S.SubLocationID4 <> -1) AND (S.SubLocationID != S.SubLocationID4)  AND (S.SubLocationID2 != S.SubLocationID4) AND (S.SubLocationID3 != S.SubLocationID4))
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		WHERE 
			SSLI.StockSheetID = inStockSheetID
		ORDER BY StockUnitID;
	ELSE
		
		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SU.ID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockUnit SU
		JOIN Stock S 
			ON (S.ID = SU.StockID)
		JOIN SubLocation SL 
			ON ((SL.ID = S.SubLocationID AND S.SubLocationID <> -1))
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		ORDER BY StockUnitID;
		
		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SU.ID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockUnit SU
		JOIN Stock S 
			ON (S.ID = SU.StockID)
		JOIN SubLocation SL 
			ON ((SL.ID = S.SubLocationID2) AND (S.SubLocationID2 <> -1) AND (S.SubLocationID != S.SubLocationID2))
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		ORDER BY StockUnitID;
		
		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SU.ID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockUnit SU
		JOIN Stock S 
			ON (S.ID = SU.StockID)
		JOIN SubLocation SL 
			ON ((SL.ID = S.SubLocationID3) AND (S.SubLocationID3 <> -1) AND (S.SubLocationID != S.SubLocationID3) AND (S.SubLocationID2 != S.SubLocationID3))
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		ORDER BY StockUnitID;
		
		
		INSERT INTO StockTakeValues (StockTakeID,StockUnitID,StartQuantity,Cost,EndQuantity,CountedQuantity,LocationID,SubLocationID)  
		SELECT 
			outStockTakeID AS StockTakeID,
			SU.ID AS StockUnitID,
			IFNULL(SLQ.Quantity,0) AS StartQuantity,
			SU.SOH_Cost AS Cost,
			0 AS EndQuantity,
			0 AS CountedQuantity,
			SL.LocationID AS LocationID,
			SL.ID AS SubLocationID
		FROM StockUnit SU
		JOIN Stock S 
			ON (S.ID = SU.StockID)
		JOIN SubLocation SL 
			ON ((SL.ID = S.SubLocationID4) AND (S.SubLocationID4 <> -1) AND (S.SubLocationID != S.SubLocationID4) AND (S.SubLocationID2 != S.SubLocationID4) AND (S.SubLocationID3 != S.SubLocationID4))
		LEFT JOIN StockLocationQuantity SLQ
			ON (SL.LocationID = SLQ.LocationID AND SU.ID = SLQ.StockUnitID)
		ORDER BY StockUnitID;
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateSubLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateSubLocation`(
	IN inLocationID		INTEGER,
	IN inName		CHAR(50),
	IN inisDefault		INTEGER,
	IN inSource		CHAR(10),
	IN inModifiedBy		INTEGER,
	OUT outID		INTEGER
)
BEGIN
	
	INSERT INTO SubLocation (LocationID,Name,Modified,IsDefault,SourceID,ModifiedBy,Active) 
		VALUES (inLocationID,inName,NOW(),inisDefault,inSource,inModifiedBy,1);
	SET outID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateUser`(
	IN inUserName		CHAR(50),
	IN inPassword		CHAR(50),
	IN inAccountStatus	CHAR(50),
	IN inModifiedBy		INTEGER,
	IN inSourceID		CHAR(50),
	OUT outID		INTEGER
)
BEGIN
	
	INSERT INTO User_User (UserName,Password,AccountStatus,Modified,ModifiedBy,SourceID) 
		VALUES (inUserName,inPassword,inAccountStatus,NOW(),inModifiedBy,inSourceID);
	SET outID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateUserHasRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateUserHasRole`(
	IN inUserID		INTEGER,
	IN inRoleID			INTEGER,
	IN inSourceID			CHAR(30),
	IN inModifiedBy			INTEGER
	)
BEGIN
	INSERT INTO User_UserHasRole (UserID,RoleID,SourceID,ModifiedBy,Modified)
			VALUES (inUserID,inRoleID,inSourceID,inModifiedBy,NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_CreateUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_CreateUserRole`(
	
	IN inUserRoleName		CHAR(50),
	IN inUserRoleDescription	CHAR(50),
	IN inActive			CHAR(5),
	IN inModifiedBy			INTEGER,
	IN inSourceID			CHAR(30),
	OUT outID			INTEGER
)
BEGIN
	
 	INSERT INTO User_Role(UserRoleName,UserRoleDescription,Active,ModifiedBy,SourceID,Modified)
	VALUES(inUserRoleName,inUserRoleDescription,inActive,inModifiedBy,inSourceID,Now());

	SET outID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_DeleteClassHasAttribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_DeleteClassHasAttribute`(
	IN inClassID	INTEGER)
BEGIN
	DELETE FROM User_ClassHasAttribute WHERE ClassID = inClassID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_DeleteLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_DeleteLocation`(	
	IN inID			INTEGER,
	IN inSource		CHAR(10),
	IN inAuthUser		INTEGER
)
BEGIN
	UPDATE Location SET 
		Active = 0,
		SourceID = inSource,
		ModifiedBy = inAuthUser,
		Modified = NOW()
	WHERE ID = inID; 

	UPDATE SubLocation SET
		Active = 0,
		SourceID = inSource,
		ModifiedBy = inAuthUser,
		Modified = NOW()
	WHERE LocationID = inID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_DeletePurchaseOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_DeletePurchaseOrder`(
	IN inPurchaseOrderID	INTEGER
	)
BEGIN
	DELETE FROM PurchaseOrderLineItem WHERE PurchaseOrderID = inPurchaseOrderID;
	DELETE FROM PurchaseOrder WHERE ID = inPurchaseOrderID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_DeleteRoleHasClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_DeleteRoleHasClass`(
	IN inRoleID	INTEGER)
BEGIN
	DELETE FROM User_RoleHasClass WHERE RoleID = inRoleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_DeleteSubLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_DeleteSubLocation`(	
	IN inID			INTEGER,
	IN inSource		CHAR(10),
	IN inAuthUser		INTEGER
)
BEGIN
	UPDATE SubLocation SET 
		Active = 0,
		SourceID = inSource,
		ModifiedBy = inAuthUser,
		Modified = NOW()
	WHERE ID = inID; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_DeleteUserHasRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_DeleteUserHasRole`(
	IN inUserID		INTEGER)
BEGIN
	DELETE FROM User_UserHasRole WHERE UserID = inUserID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_FlagStockChange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_FlagStockChange`(
	inStockID INTEGER,
	inUserID INTEGER
)
BEGIN
	INSERT INTO StockUpdates (ID,StockID,Modified,UserID) VALUES (null,inStockID,NOW(),inUserID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_IssueStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_IssueStock`(
	IN inStockUnitID1	INTEGER,
	IN inStockLocationID1	INTEGER,
	IN inQuantity1		DOUBLE(14,5),
	IN inCostExcl1		DOUBLE(14,5),
	IN inStockUnitID2	INTEGER,
	IN inStockLocationID2	INTEGER,
	IN inQuantity2		DOUBLE(14,5),
	IN inCostExcl2		DOUBLE(14,5),
	IN inTransactionID	INTEGER,
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER
	)
BEGIN
 	DECLARE tFound INTEGER;
	SET tFound = (SELECT Quantity FROM StockLocationQuantity WHERE StockUnitID = inStockUnitID1 AND LocationID = inStockLocationID1);

	IF tFound IS NULL THEN
		INSERT INTO StockLocationQuantity (StockUnitID,LocationID,Quantity)
					VALUES (inStockUnitID1,inStockLocationID1,inQuantity1);
	ELSE
		UPDATE StockLocationQuantity SET 
			Quantity = Quantity + inQuantity1
		WHERE StockUnitID = inStockUnitID1 AND LocationID = inStockLocationID1;
	END IF;

	INSERT INTO StockTransaction (StockUnitID,TransactionID,LocationID,State,Quantity,UnitCost,CostDate,Description,SourceID,OriginalID,Modified,ModifierID)
			VALUES (inStockUnitID1,inTransactionID,inStockLocationID1,'Available',inQuantity1,inCostExcl1,NOW(),'Issue',inSourceID,0,NOW(),0);

	UPDATE StockUnit SET SOH_Quantity = SOH_Quantity + inQuantity1 WHERE ID = inStockUnitID1;

	SET tFound = (SELECT Quantity FROM StockLocationQuantity WHERE StockUnitID = inStockUnitID2 AND LocationID = inStockLocationID2);

	IF tFound IS NULL THEN
		INSERT INTO StockLocationQuantity (StockUnitID,LocationID,Quantity)
					VALUES (inStockUnitID2,inStockLocationID2,inQuantity2);
	ELSE
		UPDATE StockLocationQuantity SET 
			Quantity = Quantity + inQuantity2
		WHERE StockUnitID = inStockUnitID2 AND LocationID = inStockLocationID2;
	END IF;

	INSERT INTO StockTransaction (StockUnitID,TransactionID,LocationID,State,Quantity,UnitCost,CostDate,Description,SourceID,OriginalID,Modified,ModifierID)
			VALUES (inStockUnitID2,inTransactionID,inStockLocationID2,'Available',inQuantity2,inCostExcl2,NOW(),'Issue',inSourceID,0,NOW(),0);

	UPDATE StockUnit SET SOH_Quantity = SOH_Quantity + inQuantity2 WHERE ID = inStockUnitID2;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_ProcessPurchaseOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_ProcessPurchaseOrder`(
	IN inPurchaseOrderID	INTEGER,
	IN inExcl		DOUBLE(11,5),
	IN inVat		DOUBLE(11,5),
	IN inDiscount		DOUBLE(11,5),
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER,
	OUT outInvoiceID	INTEGER
	)
BEGIN
        DECLARE tTrans INTEGER;

	
	INSERT INTO Transaction (Date,Common_AuthUserID,Common_TerminalID,TransactionTypeID,ReferenceID,Description,Flag,Period,SourceID,OriginalID,Modified,ModifierID,Reversed,ExportFlag)
			VALUES  (NOW(),inAuthUser,0,'PU',inPurchaseOrderID,'Purchases','N',DATE_FORMAT(NOW(),'%Y%m'),inSourceID,0,NOW(),0,'N',0);
	SET tTrans = (SELECT LAST_INSERT_ID());

	
	INSERT INTO Invoice (PurchaseOrderID,InvoiceDate,RefNo,OwnRefNo,TransactionID,SourceID,Modified,ModifierID,PaymentMethodID,Excluding,Vat,Discount) 
			 (SELECT ID AS PurchaseOrderID,NOW() AS InvoiceDate,RefNo,OwnRefNo,tTrans AS TransactionID ,inSourceID AS SourceID,NOW() AS Modified,inAuthUser AS ModifiedID,PaymentMethodID,inExcl,inVat,inDiscount FROM PurchaseOrder WHERE ID = inPurchaseOrderID); 
	SET outInvoiceID = (SELECT LAST_INSERT_ID());

	
	UPDATE PurchaseOrder SET 
		OrderComplete = 1,
		TransactionID = tTrans 
	WHERE ID = inPurchaseOrderID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_ProcessPurchaseOrderLineItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_ProcessPurchaseOrderLineItem`(
	IN inPurchaseOrderLineItemID	INTEGER,
	IN inInvoiceID			INTEGER,
	IN inSourceID			VARCHAR(10),
	IN inAuthUser			INTEGER
	)
BEGIN
	DECLARE tStockUnitID	INTEGER;
	DECLARE tPrev_SOH	DOUBLE(14,5);
	DECLARE tPrev_SOHQ	DOUBLE(14,5);
	DECLARE tNewAveCost	DOUBLE(14,5);
	DECLARE tNewLastCost	DOUBLE(14,5);
	DECLARE tOldLastCost	DOUBLE(14,5);
	DECLARE tQuantity	DOUBLE(14,5);
	DECLARE tFullQuantity	DOUBLE(14,5);
	DECLARE tShort		DOUBLE(14,5);
	DECLARE tVatUsed 	INTEGER;
	
	SET tStockUnitID = 	(
				SELECT 
					SU.ID 
				FROM StockUnit AS SU 
				INNER JOIN StockMetricUnit AS SMU 
					ON SMU.StockID = SU.StockID
				INNER JOIN PurchaseOrderLineItem AS POLI 
					ON POLI.StockMetricUnitID = SMU.ID
				WHERE POLI.ID = inPurchaseOrderLineItemID
				);
	SET tPrev_SOH = (SELECT SOH_Cost FROM StockUnit SU WHERE ID = tStockUnitID);
	SET tPrev_SOHQ = (SELECT SOH_Quantity FROM StockUnit SU WHERE ID = tStockUnitID);
	SET tNewLastCost = (SELECT UnitPriceExcl FROM PurchaseOrderLineItem WHERE ID = inPurchaseOrderLineItemID);
	SET tQuantity = (SELECT Quantity-Short FROM PurchaseOrderLineItem WHERE ID = inPurchaseOrderLineItemID);
	SET tFullQuantity = (SELECT Quantity FROM PurchaseOrderLineItem WHERE ID = inPurchaseOrderLineItemID);
	SET tVatUsed = (SELECT IF(UnitPriceIncl=UnitPriceExcl,0,1) FROM PurchaseOrderLineItem WHERE ID = inPurchaseOrderLineItemID); 
	SET tShort = (SELECT Short FROM PurchaseOrderLineItem WHERE ID = inPurchaseOrderLineItemID); 
	SET tNewAveCost = ((tPrev_SOH*tPrev_SOHQ)+(tNewLastCost*tFullQuantity))/(tPrev_SOHQ+tFullQuantity);
	IF tShort <> 0 THEN
		INSERT INTO CreditNote (PurchaseOrderLineItemID,ReferenceNo,Notes,SourceID,ModifiedBy,Modified,Completed)
				VALUES (inPurchaseOrderLineItemID,'','',inSourceID,inAuthUser,NOW(),0);
	END IF;

	INSERT INTO InvoiceLineItem (InvoiceID,PurchaseOrderLineItemID,StockUnitID,Received,Returned,Discount,UnitPriceExcl,SourceID,Modified,ModifierID,PrevSOH_Cost,VatUsed,UnitPriceIncl,StockMetricUnitID)
		(
		SELECT 
			inInvoiceID		AS InvoiceID, 
			POLI.ID 		AS PurchaseOrderLineItemID,
			tStockUnitID 		AS StockUnitID,
			POLI.Quantity 		AS Received,
			POLI.Short 		AS Returned,
			POLI.Discount 		AS Discount,
			POLI.UnitPriceExcl 	AS UnitPriceExcl,
			inSourceID 		AS SourceID,
			NOW() 			AS Modified,
			POLI.ModifierID 	AS ModifierID,
			tPrev_SOH		AS PrevSOH_Cost,
			tVatUsed		AS VatUsed,
			POLI.UnitPriceIncl 	AS UnitPriceIncl,
			POLI.StockMetricUnitID 	AS StockMetricUnitID
		FROM PurchaseOrderLineItem POLI 
		WHERE POLI.ID = inPurchaseOrderLineItemID
		);

	UPDATE StockUnit SET SOH_Quantity = SOH_Quantity + tQuantity,LastCost = tNewLastCost,SOH_Cost = tNewAveCost WHERE ID = tStockUnitID;

	UPDATE PurchaseOrderLineItem SET 
		SourceID = inSourceID,
		Modified = NOW(),
		ModifierID = inAuthUser,
		Completed = 1
	WHERE ID = inPurchaseOrderLineItemID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_ReceiveStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_ReceiveStock`(
	IN inStockUnitID	INTEGER,
	IN inStockLocationID	INTEGER,
	IN inQuantity		DOUBLE(14,5),
	IN inTransactionID	INTEGER,
	IN inCostExcl		DOUBLE(14,5),
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER
	)
BEGIN
 	DECLARE tFound INTEGER;
	SET tFound = (SELECT Quantity FROM StockLocationQuantity WHERE StockUnitID = inStockUnitID AND LocationID = inStockLocationID);

	IF tFound IS NULL THEN
		INSERT INTO StockLocationQuantity (StockUnitID,LocationID,Quantity)
					VALUES (inStockUnitID,inStockLocationID,inQuantity);
	ELSE
		UPDATE StockLocationQuantity SET 
			Quantity = Quantity + inQuantity
		WHERE StockUnitID = inStockUnitID AND LocationID = inStockLocationID;
	END IF;

	INSERT INTO StockTransaction (StockUnitID,TransactionID,LocationID,State,Quantity,UnitCost,CostDate,Description,SourceID,OriginalID,Modified,ModifierID)
			VALUES (inStockUnitID,inTransactionID,inStockLocationID,'Available',inQuantity,inCostExcl,NOW(),'Purchases',inSourceID,0,NOW(),0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateAccount`(

	IN inEntityAccountID	INTEGER,
	IN inSourceID		CHAR(50),
	IN inEntityID		INTEGER,
	IN inAccountType	CHAR(10),
	IN inLimitAccount	CHAR(50),
	IN inModifierID		INTEGER,
	IN inAccountBalance	CHAR(50),
	in inAccountActive	CHAR(10)
)
BEGIN
UPDATE EntityAccount SET 
		SourceID = inSourceID,
		EntityID = inEntityID,
		EntityAccountTemplateID = inAccountType,
		LimitAmount = inLimitAccount,
		ModifierID = inModifierID,
		Modified = NOW(),
		Balance = inAccountBalance,
		Active = inAccountActive
	WHERE ID = inEntityAccountID; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateEntityAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateEntityAccount`(

	IN inEntityAccountID	INTEGER,
	IN inSourceID		CHAR(50),
	IN inEntityID		INTEGER,
	IN inAccountType	CHAR(10),
	IN inLimitAccount	CHAR(50),
	IN inModifierID		INTEGER,
	IN inAccountBalance	CHAR(50),
	in inAccountActive	CHAR(10)
)
BEGIN
UPDATE EntityAccount SET 
		SourceID = inSourceID,
		EntityID = inEntityID,
		EntityAccountTemplateID = inAccountType,
		LimitAmount = inLimitAccount,
		ModifierID = inModifierID,
		Modified = NOW(),
		AccountBalance = inAccountBalance,
		Active = inAccountActive
	WHERE ID = inEntityAccountID; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateEntityBankDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateEntityBankDetails`(
	IN inEntityID		INTEGER,
	IN inBankName		VARCHAR(30),
	IN inBankBranch		VARCHAR(30),
	IN inBankAccount	VARCHAR(30)
	)
BEGIN
	UPDATE Entity SET
		Bank = inBankName,
		BankBranch = inBankBranch,
		BankAccount = inBankAccount
	WHERE ID = inEntityID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateEntityDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateEntityDetails`(
	IN inEntityID		INTEGER,
	IN inIDNumber		VARCHAR(13),
	IN inFirstName		VARCHAR(30),
	IN inSurname		VARCHAR(30),
	IN inTel		VARCHAR(30),
	IN inCell		VARCHAR(30),
	IN inFax		VARCHAR(30),
	IN inEMail		VARCHAR(50),
	IN inPhysical		TEXT,
	IN inPostal		TEXT,
	IN inDeliver		TEXT
	)
BEGIN
	UPDATE Entity SET
		IDNumber = inIDNumber,
		FirstName = inFirstName,
		LastName = inSurname,
		Phone = inTel,
		Cell = inCell,
		Fax = inFax,
		Email = inEMail,
		PhysicalAddress = inPhysical,
		PostalAddress = inPostal,
		DeliveryAddress = inDeliver
	WHERE ID = inEntityID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateLocation`(
	IN inID			INTEGER,
	IN inName		CHAR(50),
	IN inActive		INTEGER,
	IN inSource		CHAR(10),
	IN inAuthUser		INTEGER
)
BEGIN
	UPDATE Location SET 
		Name = inName,
		Active = inActive,
		SourceID = inSource,
		ModifiedBy = inAuthUser,
		Modified = NOW()
	WHERE ID = inID; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdatePurchaseOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdatePurchaseOrder`(
	IN inPurchaseOrderID	INTEGER,
	IN inExpectedDate	VARCHAR(20),
	IN inSourceID		VARCHAR(10),
	IN inAuthUser		INTEGER,
	IN inPaymentMethodID	VARCHAR(2),
	IN inRef		VARCHAR(50),
	IN inOwnRef		VARCHAR(50)
	)
BEGIN
	UPDATE PurchaseOrder SET
		ExpectedDate = inExpectedDate,
		SourceID = inSourceID,
		ModifierID = inAuthUser,
		PaymentMethodID = inPaymentMethodID,
		RefNo = inRef,
		OwnRefNo = inOwnRef
	WHERE ID = inPurchaseOrderID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdatePurchaseOrderLineItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdatePurchaseOrderLineItem`(
	IN inPurchaseOrderLineItemID	INTEGER,
	IN inQuantity			DOUBLE(14,5),
	IN inPriceExcl			DOUBLE(14,5),
	IN inPriceIncl			DOUBLE(14,5),
	IN inShort			DOUBLE(14,5),
	IN inDefaultLoc			INTEGER,
	IN inDiscount			DOUBLE(14,5),
	IN inSourceID			VARCHAR(10),
	IN inAuthUser			INTEGER
	)
BEGIN
	UPDATE PurchaseOrderLineItem SET 
		Quantity = inQuantity,
		SourceID = inSourceID,
		Modified = NOW(),
		ModifierID = inAuthUser,
		UnitPriceExcl = inPriceExcl,
		UnitPriceIncl = inPriceIncl,
		Short = inShort,
		Unknown = inDefaultLoc,
		OrderQty = inQuantity,
		Discount = inDiscount
	WHERE ID = inPurchaseOrderLineItemID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateSellingPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateSellingPrice`(
	IN inStockUnitID		INTEGER,
	IN inPrice			DECIMAL(9,3),
	IN inSourceID			VARCHAR(10)
	)
BEGIN
 	DECLARE tPrice DOUBLE;
	SET tPrice = (SELECT Price FROM StockUnit WHERE ID = inStockUnitID);

	IF (tPrice <> inPrice) THEN
		UPDATE StockUnit SET 
			Price = inPrice,
			SourceID = inSourceID,
			Modified = NOW()
		WHERE ID = inStockUnitID;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateStockItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateStockItem`(
	IN inStockID 		INTEGER,
	IN inStockUnitID 	INTEGER,
	IN inName		CHAR(50),
	IN inBarcode 		CHAR(50),
	IN inCode 		CHAR(30),
	IN inCategory 		CHAR(30),
	IN inPrintLocation 	INTEGER,
	IN inSaleLocation 	INTEGER,
	IN inLocation 		INTEGER,
	IN inPrice		DOUBLE(11,2),
	IN inCost		DOUBLE(11,5),
	IN inSellable		CHAR(5),
	IN inVat		CHAR(5),
	IN inMeasure		CHAR(50),
	IN inProcessType	INTEGER,
	IN inType		CHAR(50),
	IN inRef1StockID	INTEGER,
	IN inRef1Ratio		DOUBLE(15,5),
	IN inRef2StockID	INTEGER,
	IN inRef2Ratio		DOUBLE(15,5),
	IN inRef3StockID	INTEGER,
	IN inRef3Ratio		DOUBLE(15,5),
	IN inSubLocation1	INTEGER,
	IN inSubLocation2	INTEGER,
	IN inSubLocation3	INTEGER,
	IN inSubLocation4	INTEGER
	)
BEGIN
	DECLARE oldCost DOUBLE(11,5);

	UPDATE Stock SET
		Name = inName, 
		BarCode = inBarcode,
		Code = inCode,
		StockCategoryID = inCategory,
		PrintLocationID = inPrintLocation,
		SaleLocationID = inSaleLocation,
		LocationID = inLocation,
		Sellable = inSellable,
		VatID = inVat,
		UnitType = inMeasure,
		ProductProcessTypeID = inProcessType,
		StockUpdated = NOW(),
		SubLocationID = inSubLocation1,
		SubLocationID2 = inSubLocation2,
		SubLocationID3 = inSubLocation3,
		SubLocationID4 = inSubLocation4
	Where Stock.ID = inStockID; 

	SET oldCost = (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID);

	IF oldCost <> inCost THEN
		CALL DoStockCostChange(inStockUnitID,oldCost,inCost);
	END IF;	

	UPDATE StockUnit SET 
		StockUnit.Type = inType,
		Price = inPrice,
		SOH_Cost = inCost,
		StockUnitUpdated = NOW(),
		StockReferalID = inRef1StockID,
		StockReferalID2 = inRef2StockID,
		StockReferalID3 = inRef3StockID,
		StockReferalQuantity = inRef1Ratio,
		StockReferalQuantity2 = inRef2Ratio,
		StockReferalQuantity3 = inRef3Ratio
	Where StockUnit.ID = inStockUnitID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateStockTake` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateStockTake`(
	IN inStockTakeID	INTEGER,
	IN inSortOrder		CHAR(20)
	)
BEGIN

	UPDATE StockTake SET 
		Modified = NOW(),
		SortOrder = inSortOrder
	WHERE ID = inStockTakeID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateSubLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateSubLocation`(
	IN inID			INTEGER,
	IN inLocationID		INTEGER,
	IN inName		CHAR(50),
	IN inisDefault		INTEGER,
	IN inSourceID		CHAR(10),
	IN inModifiedBy		INTEGER
)
BEGIN
	UPDATE SubLocation SET 
		Name = inName,
		LocationID = inLocationID,
		isDefault = inisDefault,
		SourceID = inSourceID,
		ModifiedBy = inModifiedBy,
		Modified = NOW()
	WHERE ID = inID; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateUser`(
	IN inUID		INTEGER,
	IN inUserName		CHAR(50),
	IN inPassword		CHAR(50),
	IN inAccountStatus	CHAR(50),
	IN inModifiedBy		INTEGER,
	IN inSourceID		CHAR(50)
	
)
BEGIN
	
	UPDATE User_User
	SET 	UserName  = inUserName,
		`Password` = inPassword,
		AccountStatus = inAccountStatus,
		ModifiedBy = inModifiedBy,
		SourceID = inSourceID,
		Modified = Now()
	WHERE UID = inUID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateUserClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateUserClass`(
	IN inClassID			INTEGER,
	IN inUserClassName		CHAR(50),
	IN inUserClassDescription	CHAR(50),
	IN inActive			CHAR(5),
	IN inModifiedBy			INTEGER,
	IN inSourceID			CHAR(30)

)
BEGIN
	UPDATE User_Class
	SET 	UserClassName = inUserClassName,
		UserClassDescription = inUserClassDescription,
		Active = inActive,
		SourceID = inSourceID
	WHERE UID = inClassID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NBO_UpdateUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NBO_UpdateUserRole`(
	IN inRoleID			INTEGER,
	IN inUserRoleName		CHAR(50),
	IN inUserRoleDescription	CHAR(50),
	IN inActive			CHAR(5),
	IN inModifiedBy			INTEGER,
	IN inSourceID			CHAR(30)

)
BEGIN
	
 	UPDATE User_Role
	SET 	UserRoleName = inUserRoleName,
		UserRoleDescription = inUserRoleDescription,
		Active = inActive,
		SourceID = inSourceID
	WHERE UID = inRoleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NewStockItemImport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NewStockItemImport`(
	IN inStockID 		INTEGER,
	IN inStockUnitID 	INTEGER,
	IN inName		CHAR(50),
	IN inBarcode 		CHAR(50),
	IN inCode 		CHAR(30),
	IN inCategory 		CHAR(10),
	IN inPrintLocation 	INTEGER,
	IN inSaleLocation 	INTEGER,
	IN inLocation 		INTEGER,
	IN inPrice		DOUBLE(11,2),
	IN inSellable		CHAR(5),
	IN inVat		CHAR(5),
	IN inMeasure		CHAR(50),
	IN inProcessType	INTEGER,
	IN inType		CHAR(50),
	IN inRef1StockID	INTEGER,
	IN inRef1Ratio		DOUBLE(15,5),
	IN inRef2StockID	INTEGER,
	IN inRef2Ratio		DOUBLE(15,5),
	IN inRef3StockID	INTEGER,
	IN inRef3Ratio		DOUBLE(15,5),
	IN inSOHCost		DOUBLE(15,5),
	IN inSOHQuantity	DOUBLE(15,5)
	)
BEGIN

	DECLARE nstockID INTEGER;

	Insert Into Stock (Name,BarCode,Code,StockCategoryID,PrintLocationID,LocationID,Sellable,VatID,Type,LowerPurchasesLimit,UpperPurchasesLimit,SourceID,ProductProcessTypeID,UnitType,SaleLocationID,StockUpdated)
		Values (inName,inBarcode,inCode,inCategory,inPrintLocation,inLocation,inSellable,inVat,'Stock',0.00,0.00,'BIO',inProcessType,inMeasure,inSaleLocation,NOW());

	SET nstockID = (SELECT LAST_INSERT_ID());
	
	Insert Into StockUnit (Name,StockID,Cost,Price,ModifierID,Barcode,Price2,StockUnit.Type,StockUnitUpdated,StockReferalID,StockReferalID2,StockReferalID3,StockReferalQuantity,StockReferalQuantity2,StockReferalQuantity3,SOH_Cost,SOH_Quantity)
		Values ("EACH",nstockID,0.00,inPrice,503,'',0.00,inType,NOW(),inRef1StockID,inRef2StockID,inRef3StockID,inRef1Ratio,inRef2Ratio,inRef3Ratio,inSOHCost,inSOHQuantity);

	Insert Into StockMetricUnit (Name,StockID,Multiplier,Barcode)
		Values ("EACH",nstockID,1,'');

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NewStockMetricUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `NewStockMetricUnit`(
	IN inStockID 		INTEGER,
	IN inMultiplier 	DOUBLE,
	IN inName		CHAR(50)
	)
BEGIN
	Insert Into StockMetricUnit (Name,StockID,Multiplier,Barcode)
		Values (inName,inStockID,inMultiplier,'');


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_CloseOpenSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_CloseOpenSale`(IN inOpenSaleID INTEGER, IN inSaleID INTEGER)
BEGIN
  	UPDATE OpenSale SET State = 'closed',SaleID = inSaleID WHERE ID = inOpenSaleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_CreateAccountTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_CreateAccountTransaction`(IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inAccountID VARCHAR(6), 
	 IN inAmount DECIMAL(14,5),
	 IN inDesc VARCHAR(20),
	 IN inModifierID INTEGER)
BEGIN
    INSERT INTO AccountTransaction VALUES( 
    		NULL, 
		inAccountID, 
		inTransactionID, 
		inDesc, 
		inAmount, 
		NULL,
		inSourceID, 
		NULL, 
		NOW(), 
		inModifierID);
    
    SELECT LAST_INSERT_ID() AS AccountTransactionID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_CreateEntityAccountTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_CreateEntityAccountTransaction`(IN inSourceID VARCHAR(10), 
	 IN inEntityAccountID INTEGER,
	 IN inTransID INTEGER,
	 IN inAmount DECIMAL(14,5),
	 IN inModifierID INTEGER)
BEGIN
	INSERT INTO EntityAccountTransaction VALUES (NULL, inEntityAccountID, inTransID, inAmount, 0, inSourceID, 0, NOW(), inModifierID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_CreateSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_CreateSale`(IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inAuthUserID INTEGER, 
	 IN inEntityAccountID INTEGER,
	 IN inPaymentMethodID CHAR(2), 
	 IN inDiscountPercentage DECIMAL(4,1),
	 IN inDiscount DECIMAL(11,1),
	 IN inExclusive DECIMAL(11,5),
	 IN inVat DECIMAL(11,5),
	 IN inTip DECIMAL(11,2),
	 IN inTableCount INT,
	 IN inModifierID INT, 
	 OUT outSaleID INT)
BEGIN
    INSERT INTO Sale VALUES( 
    	NULL,
		inEntityAccountID,
		inAuthUserID,
		NOW(),
		inPaymentMethodID,
		inDiscountPercentage,
		inDiscount,
		NULL,
		0,		
		inExclusive,
		inVat,
		inTip,
		inTableCount,
		NOW(),
		OBE_GetCurrentPeriod(),
		inSourceID,
		NULL,
		NOW(),
		inModifierID,
		inTransactionID,
		NULL,
		NULL);
    SET outSaleID = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_CreateStockTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_CreateStockTransaction`(IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inStockUnitID INTEGER,
	 IN inLocID INTEGER,
	 IN inQty DECIMAL(9,3),
	 IN inUnitCost DECIMAL(14,5),
	 IN inDesc VARCHAR(20),
	 IN inModifierID INTEGER)
BEGIN
    INSERT INTO StockTransaction VALUES( 
    		NULL,
		inStockUnitID,
		inTransactionID,
		inLocID,
		'Available',	
		inQty,
		inUnitCost,
		NOW(),
		inDesc,
		inSourceID,
		NULL,
		NOW(), 
		inModifierID);
    
    SELECT LAST_INSERT_ID() AS StockTransactionID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_CreateTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_CreateTransaction`(IN inSourceID VARCHAR(10), 
	 IN inAuthUserID INT , 
	 IN inTypeID CHAR(2), 
	 IN inModifierID INT, 
	 OUT outTransactionID INT)
BEGIN
    INSERT INTO Transaction VALUES( 
    		NULL, 
		NOW(), 
		inAuthUserID, 
		NULL, 
		inTypeID, 
		NULL,
		NULL, 
		'N', 
		OBE_GetCurrentPeriod(), 
		inSourceID, 
		NULL, 
		NOW(), 
		inModifierID,
		'N',
		0);
    SET outTransactionID  = (SELECT LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_ProcessPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_ProcessPayment`(IN inSourceID VARCHAR(6), 
	 IN inAuthUserID INTEGER,
	 IN inPaidIncl DECIMAL(11,5),
	 IN inPaymentMethodID CHAR(2),
	 IN inEntityAccountID INTEGER,
	 IN inModifierID INTEGER)
BEGIN
    DECLARE TransID INTEGER;
    CALL OBE_CreateTransaction( inSourceID, inAuthUserID, "CP", inModifierID, TransID);
    CALL OBE_CreateEntityAccountTransaction(inSourceID, inEntityAccountID, TransID, -inPaidIncl, inModifierID);
      CALL OBE_CreateAccountTransaction(inSourceID, TransID, "DR", -inPaidIncl, "", inModifierID);
      CALL OBE_CreateAccountTransaction(inSourceID, TransID, "BANK", inPaidIncl, "", inModifierID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_ProcessSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_ProcessSale`(IN inSourceID VARCHAR(6), 
	 IN inAuthUserID INTEGER,
	 IN inOpenSaleID INTEGER,
	 IN inPaidIncl DECIMAL(11,5),
	 IN inDiscPcnt DECIMAL(4,1),
	 IN inDisc DECIMAL(11,1),
	 IN inTip DECIMAL(11,2),
	 IN inPaymentMethodID CHAR(2),
	 IN inEntityAccountID INTEGER,
	 IN inModifierID INTEGER)
BEGIN
    
    DECLARE TransID, SaleID, TableCount INTEGER;
    DECLARE TotalCostIncl DECIMAL(14,5);
	SET TableCount = (SELECT TableCount FROM OpenSale WHERE ID = inOpenSaleID);
    
    CALL OBE_CreateTransaction( inSourceID, inAuthUserID, "CS", inModifierID, TransID);
    CALL OBE_CreateSale( 
		inSourceID, 
		TransID, 
		inAuthUserID, 
		inEntityAccountID, 
		inPaymentMethodID, 
		inDiscPcnt, 
		inDisc, 
		OBE_Incl2Excl(inPaidIncl), 
		OBE_Incl2Vat(inPaidIncl),
		inTip,
		TableCount,
		inModifierID,
		SaleID);
    
    CALL OBE_ProcOpenSaleLineItem(inSourceID, TransID, inOpenSaleID, SaleID, inModifierID, TotalCostIncl);
    
    CALL OBE_SaleCostUpdate(SaleID, TotalCostIncl); 
    
    CALL OBE_CloseOpenSale(inOpenSaleID, SaleID);
    
    
    
    CALL OBE_CreateAccountTransaction(inSourceID, TransID, "SALES", -OBE_Incl2Excl(inPaidIncl+inDisc), "", inModifierID);
    CALL OBE_CreateAccountTransaction(inSourceID, TransID, "OVAT", -OBE_Incl2Vat(inPaidIncl+inDisc), "", inModifierID);
    
    IF (inDisc <> 0) THEN
    	CALL OBE_CreateAccountTransaction(inSourceID, TransID, "DISC", OBE_Incl2Excl(inDisc), "", inModifierID);
    	CALL OBE_CreateAccountTransaction(inSourceID, TransID, "IVAT", OBE_Incl2Vat(inDisc), "", inModifierID);
    END IF;
    
    
    IF inPaymentMethodID = "AC" THEN
      CALL OBE_CreateAccountTransaction(inSourceID, TransID, "DR", inPaidIncl, "", inModifierID);
	  CALL OBE_CreateEntityAccountTransaction(inSourceID, inEntityAccountID, TransID, inPaidIncl, inModifierID);
      
    ELSE
      CALL OBE_CreateAccountTransaction(inSourceID, TransID, "BANK", inPaidIncl, "", inModifierID);
    END IF;
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_ProcOpenSaleLineItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_ProcOpenSaleLineItem`(IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inOpenSaleID INTEGER,
	 IN inSaleID INTEGER,
	 IN inModifierID INTEGER, 
	 OUT outCostIncl DECIMAL(15,5))
BEGIN
    DECLARE NoRecords INTEGER DEFAULT 0;		
    
    
    DECLARE TotalCostIncl DECIMAL(14,5) DEFAULT 0;
    
    DECLARE tStockUnitID INTEGER;
    DECLARE tSaleQty 	DECIMAL(9,2);
    DECLARE tUnitPrice	DECIMAL(14,5);
    DECLARE tUnitCost 	DECIMAL(14,5);
    DECLARE tDiscPer	DECIMAL(4,1);
    DECLARE tLocID	INTEGER;
    
    
    DECLARE CUR_OpenSaleLineItem CURSOR FOR SELECT 	
    						StockUnitID, 
    						Quantity, 
						UnitPrice, 
						DiscountPercentage,
						LocationID
					     FROM 
					     	  OpenSaleLineItem 
						  INNER JOIN StockUnit ON StockUnit.ID = StockUnitID
						  INNER JOIN Stock ON StockID = Stock.ID
					     WHERE 
					        OpenSaleID=inOpenSaleID;
    
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    	SET NoRecords = 1;
    
    OPEN CUR_OpenSaleLineItem;
    WHILE NoRecords <> 1 DO
      
      FETCH CUR_OpenSaleLineItem INTO tStockUnitID, tSaleQty, tUnitPrice, tDiscPer, tLocID;
      IF NoRecords <> 1 THEN
	SELECT NoRecords; 
	
	
	SET tUnitCost = 1.0;
	SET TotalCostIncl = TotalCostIncl + tUnitCost;
	
	INSERT INTO SaleLineItem VALUES( NULL, inSaleID, tStockUnitID, tSaleQty, tUnitCost, tUnitPrice, tDiscPer, inSourceID, NULL, NOW(), inModifierID);
	      
	
	
	
	CALL OBE_CreateAccountTransaction(inSourceID, inTransactionID, "STOCK", -tUnitCost, "", inModifierID);
	CALL OBE_CreateAccountTransaction(inSourceID, inTransactionID, "COS", tUnitCost, "", inModifierID);
	
	
	
	CALL OBE_CreateStockTransaction(inSourceID, inTransactionID, tStockUnitID, tLocID, -tSaleQty, tUnitCost, "Sold", inModifierID);
	
	CALL OBE_StockUnitQtyAdj( tStockUnitID, -tSaleQty, inModifierID);
      END IF;
    END WHILE;
    CLOSE CUR_OpenSaleLineItem;
    SET outCostIncl = TotalCostIncl;
    SHOW WARNINGS;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_SaleCostUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_SaleCostUpdate`(IN inSaleID INTEGER,
	 IN inCostIncl DECIMAL(14,5))
BEGIN
  	UPDATE Sale SET Cost = inCostIncl WHERE ID = inSaleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBE_StockUnitQtyAdj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `OBE_StockUnitQtyAdj`(IN inStockUnitID INTEGER,
	 IN inAmount DOUBLE,
	 IN inModifierID INTEGER)
BEGIN
  	UPDATE StockUnit SET SOH_Quantity = SOH_Quantity + inAmount, ModifierID = inModifierID WHERE ID = inStockUnitID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `ProcessPayment`(IN inSourceID VARCHAR(6), 
	 IN inAuthUserID INTEGER,
	 IN inPaidIncl DECIMAL(11,5),
	 IN inPaymentMethodID CHAR(2),
	 IN inEntityAccountID INTEGER,
	 IN inModifierID INTEGER)
BEGIN
	DECLARE TransID INTEGER;
	CALL CreateTransaction( inSourceID, inAuthUserID, "CP", inModifierID, TransID);
	CALL CreateEntityAccountTransaction(inSourceID, inEntityAccountID, TransID, -inPaidIncl, inModifierID);
	CALL CreateAccountTransaction(inSourceID, TransID, "DR", -inPaidIncl, "", inModifierID);
	CALL CreateAccountTransaction(inSourceID, TransID, "BANK", inPaidIncl, "", inModifierID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessPayout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`PenguinPOS`@`localhost`*/ /*!50003 PROCEDURE `ProcessPayout`(
    IN inRef        CHAR(50),
    IN inCash       DOUBLE(15,5),
    IN inDate       DATETIME,
    IN inUserID     INTEGER,
    IN inReasonID   INTEGER,
    IN inAccountID  INTEGER,
    IN inAuthUserID INTEGER
)
BEGIN
	
    DECLARE tEndShiftID INTEGER;
    SET tEndShiftID = (SELECT MAX(EndID) FROM EndShift WHERE ShiftCompleted = 'N');
    
    IF tEndShiftID is null THEN
        INSERT INTO EndShift (AuthUserID,EndDate,ExportFlag,ShiftCompleted,UserID) VALUES (inUserID,NOW(),0,'N',inUserID);
        SET tEndShiftID = (SELECT LAST_INSERT_ID());
    END IF;

    INSERT INTO Payouts (Ref,Cash,ExportFlag,Payouts.Date,UserID,Reason,AccountID,EndShiftID,AuthUserID)
    VALUES (inRef,inCash,0,inDate,inUserID,inReasonID,inAccountID,tEndShiftID,inAuthUserID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`PenguinPOS`@`localhost`*/ /*!50003 PROCEDURE `ProcessSale`(
         IN inSourceID VARCHAR(6), 
	 IN inAuthUserID INTEGER,
	 IN inOpenSaleID INTEGER,
	 IN inDiscPcnt DECIMAL(4,3),
	 IN inDisc DECIMAL(14,5),
	 IN inExcl DECIMAL(14,5),
	 IN inVat DECIMAL(14,5),
	 IN inTip DECIMAL(14,5),
	 IN inPaymentMethodID CHAR(2),
	 IN inEntityAccountID INTEGER,
	 IN inModifierID INTEGER,
         IN inCash DECIMAL(11,2),
         IN inCheck DECIMAL(11,2),
         IN inCred DECIMAL(11,2),
         IN inAcc DECIMAL(11,2),
	 IN inRound DECIMAL(11,2),
	 IN inEntityID INTEGER,
  	 IN inCurID CHAR(10),
	 IN inCurExchange DECIMAL(9,2),
	 IN inCurValue DECIMAL(9,2),
    IN inAuthDiscountID INTEGER
)
BEGIN
	DECLARE tTransID, tSaleID INTEGER;
	DECLARE TotalPriceIncl, TotalCostIncl DECIMAL(14,5);
	
    DECLARE current_shift INTEGER;
    SET current_shift = (SELECT MAX(EndID) FROM EndShift WHERE ShiftCompleted = 'N');
    
    IF current_shift is null THEN
        INSERT INTO EndShift (AuthUserID,EndDate,ExportFlag,ShiftCompleted,UserID) VALUES (inAuthUserID,NOW(),0,'N',inAuthUserID);
        SET current_shift = (SELECT LAST_INSERT_ID());
    END IF;

	CALL CreateTransaction( inSourceID, inAuthUserID, "CS", inModifierID, tTransID);
	CALL CreateSale( 
		current_shift,
		inSourceID, 
		tTransID, 
		inAuthUserID, 
		inEntityAccountID, 
		inPaymentMethodID, 
		inDiscPcnt, 
		inDisc, 
		inExcl, 
		inVat,
		inTip,
		inModifierID,
		inCash,
		inCheck,
		inCred,
		inAcc,
		inRound,
		inEntityID,
		inCurID,
		inCurExchange,
		inCurValue,
		inAuthDiscountID,
		tSaleID
	);
	UPDATE VoidLineItem SET SaleID = tSaleID WHERE OpenSaleID = inOpenSaleID;

	CALL ProcOpenSaleLineItem(current_shift, inSourceID, tTransID,inOpenSaleID,tSaleID, inModifierID,inAuthUserID, TotalPriceIncl, TotalCostIncl);
	
	CALL CloseOpenSale(inOpenSaleID, tSaleID);

	UPDATE Sale SET ExportFlag = 0 Where ID = tSaleID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcOpenSaleLineItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`PenguinPOS`@`localhost`*/ /*!50003 PROCEDURE `ProcOpenSaleLineItem`(
    IN inEndShiftID INTEGER,
IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inOpenSaleID INTEGER,
	 IN inSaleID INTEGER,
	 IN inModifierID INTEGER, 
	 IN inAuthUserID INTEGER,
	 OUT outPriceIncl DECIMAL(14,5),
	 OUT outCostIncl DECIMAL(14,5))
BEGIN
	DECLARE NoRecords INTEGER DEFAULT 0;		
 	DECLARE TotalPriceIncl DECIMAL(14,5) DEFAULT 0;
	DECLARE TotalCostIncl  DECIMAL(14,5) DEFAULT 0;
	DECLARE tVatMulti 	double(15,5);
	DECLARE tStockUnitID INTEGER;
	DECLARE tSaleQty 	DECIMAL(9,5);
	DECLARE tDiscountAmount	DECIMAL(14,5);
	DECLARE tUnitPrice	DECIMAL(14,5);
	DECLARE tUnitCost 	DECIMAL(14,5);
	DECLARE tDiscPer	DECIMAL(4,1);
	DECLARE tIsRecipe	BOOLEAN;
	DECLARE	tVatAmount	DECIMAL(14,5) DEFAULT 0.00000;
	DECLARE tVatType	VARCHAR(10);
	DECLARE tSerial		VARCHAR(40);
   DECLARE tAuthUserID_Discount INTEGER;
   DECLARE tAuthUserID_PriceOverride INTEGER;
   DECLARE tAuthUserID_Return INTEGER;
    
        DECLARE CUR_OpenSaleLineItem CURSOR FOR
		SELECT OpenSaleLineItem.StockUnitID, OpenSaleLineItem.Quantity, OpenSaleLineItem.UnitPrice, OpenSaleLineItem.DiscountPercentage, Stock.VatID,OpenSaleLineItem.SerialNumber,OpenSaleLineItem.DiscountAmount,OpenSaleLineItem.AuthUserID_Discount,OpenSaleLineItem.AuthUserID_PriceOverride,OpenSaleLineItem.AuthUserID_Return
		FROM OpenSaleLineItem INNER JOIN StockUnit ON OpenSaleLineItem.StockUnitID = StockUnit.ID 
		INNER JOIN Stock ON StockUnit.StockID = Stock.ID
		WHERE OpenSaleLineItem.OpenSaleID = inOpenSaleID;




        DECLARE CUR_OpenSaleLineItemMod CURSOR FOR
		SELECT StockModifierLineItem.StockUnitID, 
		1,
		StockUnit.Price,
		0,
		Stock.VatID,
		'',OpenSaleLineItem.AuthUserID_Discount,OpenSaleLineItem.AuthUserID_PriceOverride,OpenSaleLineItem.AuthUserID_Return
		FROM ((OpenSaleGroupingLineItem
 		INNER JOIN StockModifierLineItem ON OpenSaleGroupingLineItem.StockModifierLineItemID = StockModifierLineItem.ID)
 		INNER JOIN StockUnit ON StockModifierLineItem.StockUnitID = StockUnit.ID)
 		INNER JOIN OpenSaleLineItem ON OpenSaleGroupingLineItem.OpenSaleLineItemID = OpenSaleLineItem.ID
		INNER JOIN Stock ON StockUnit.StockID = Stock.ID
		WHERE 
			OpenSaleID=inOpenSaleID;

 
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET NoRecords = 1;

    SET tDiscPer = 0.0;
    SET tUnitCost = 0;
  
	OPEN CUR_OpenSaleLineItem;
	WHILE NoRecords <> 1 DO
		
		FETCH CUR_OpenSaleLineItem INTO tStockUnitID, tSaleQty, tUnitPrice, tDiscPer,tVatType,tSerial,tDiscountAmount,tAuthUserID_Discount,tAuthUserID_PriceOverride,tAuthUserID_Return;
		IF NoRecords <> 1 THEN

			SET tVatMulti = (SELECT Rate FROM Vat WHERE ID = tVatType);
			SET tVatAmount = (tUnitPrice * tVatMulti / (100+tVatMulti));

			SET TotalPriceIncl = TotalPriceIncl + tUnitPrice*tSaleQty;
			SET TotalCostIncl  = TotalCostIncl + tUnitCost*tSaleQty;
			
			INSERT INTO SaleLineItem VALUES( NULL, inSaleID, tStockUnitID, tSaleQty, tUnitCost, tUnitPrice, tDiscPer, inSourceID, NULL, NOW(), inModifierID,tVatAmount,tVatType,0,tSerial,tDiscountAmount,inEndShiftID,0,tAuthUserID_Discount,tAuthUserID_PriceOverride,tAuthUserID_Return);
			
			SET tIsRecipe = (SELECT 1 FROM StockUnit WHERE ID = tStockUnitID AND Type = 'Recipe');



		END IF;
	END WHILE;
	CLOSE CUR_OpenSaleLineItem;
    
	OPEN CUR_OpenSaleLineItemMod;
	WHILE NoRecords <> 1 DO
		
		FETCH CUR_OpenSaleLineItemMod INTO tStockUnitID, tSaleQty, tUnitPrice, tDiscPer, tVatType,tSerial,tAuthUserID_Discount,tAuthUserID_PriceOverride,tAuthUserID_Return;
		IF NoRecords <> 1 THEN

			SET tVatMulti = (SELECT Rate FROM Vat WHERE ID = tVatType);
			SET tVatAmount = (tUnitPrice * tVatMulti / (100+tVatMulti));

			SET TotalPriceIncl = TotalPriceIncl + tUnitPrice*tSaleQty;
			SET TotalCostIncl  = TotalCostIncl + tUnitCost*tSaleQty;

			INSERT INTO SaleLineItem VALUES( NULL, inSaleID, tStockUnitID, tSaleQty, tUnitCost, tUnitPrice, tDiscPer, inSourceID, NULL, NOW(), inModifierID, tVatAmount, tVatType,0,tSerial,0,inEndShiftID,0,tAuthUserID_Discount,tAuthUserID_PriceOverride,tAuthUserID_Return);
			

			
			SET tIsRecipe = (SELECT 1 FROM StockUnit WHERE ID = tStockUnitID AND Type = 'Recipe');



		END IF;
	END WHILE;
	CLOSE CUR_OpenSaleLineItemMod;
	SET outPriceIncl = TotalPriceIncl;
	SET outCostIncl = TotalCostIncl;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResetStockQty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `ResetStockQty`()
BEGIN
	DECLARE tSOHQty DOUBLE;
	DECLARE tStockID INTEGER;
	DECLARE tStockName VARCHAR(50);
	DECLARE tStockUnitID INTEGER;
	DECLARE tLocID INTEGER;
	DECLARE NoRows INTEGER DEFAULT 0;
	DECLARE CUR_Stock CURSOR FOR SELECT ID, LocationID, Name FROM Stock;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET NoRows = 1;
	OPEN CUR_Stock;
	WHILE NoRows <> 1 DO
		FETCH CUR_Stock INTO tStockID, tLocID, tStockName;
		IF NoRows <> 1 THEN
			SET tStockUnitID = (SELECT ID FROM StockUnit WHERE StockID = tStockID);
			SET tSOHQty = (SELECT IFNULL(SUM(IFNULL(Quantity, 0)), 0) FROM StockTransaction WHERE StockUnitID = tStockUnitID);
			UPDATE StockUnit SET SOH_Quantity = tSOHQty WHERE ID = tStockUnitID;
			UPDATE StockLocationQuantity SET Quantity = tSOHQty WHERE StockUnitID = tStockUnitID AND LocationID = tLocID;
			SELECT tStockName, tSOHQty;
		END IF;
	END WHILE;
	DELETE FROM StockLocationQuantity WHERE Quantity = 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SaleCostUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SaleCostUpdate`(IN inSaleID INTEGER,
	 IN inTotalPriceIncl DECIMAL(14,5),
	 IN inVat DECIMAL(14,5),
	 IN inCostIncl DECIMAL(14,5))
BEGIN
	UPDATE Sale SET Cost = inCostIncl WHERE ID = inSaleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SaleUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SaleUpdate`(IN inSaleID INTEGER,
	 IN inPriceIncl DECIMAL(14,5),
	 IN inCostIncl DECIMAL(14,5))
BEGIN
	UPDATE Sale SET Exclusive = Incl2Excl(inPriceIncl), Vat = Incl2Vat(inPriceIncl), Cost = inCostIncl WHERE ID = inSaleID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StartCashup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `StartCashup`(IN inWaiterID INTEGER,
	IN inModifierID INTEGER,
	OUT outTransactionID INTEGER)
BEGIN
	CALL CancelCashup(inWaiterID);
	CALL CreateTransaction('BIO', inWaiterID, 'TC', inModifierID, outTransactionID);
	SELECT outTransactionID; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StockIngredientQtyAdj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `StockIngredientQtyAdj`(IN inStockUnitID INTEGER,
	 IN inQty DOUBLE,
	 IN inModifierID INTEGER)
BEGIN
	DECLARE tSaleLocationID INTEGER;
	DECLARE tFound BOOLEAN;
	DECLARE tIngrQuantity DECIMAL(9,3);
	DECLARE tIngrStockUnitID INTEGER;
	DECLARE NoRecords INTEGER DEFAULT 0;
	DECLARE CUR_Ingredients CURSOR FOR
		SELECT StockUnitID1, Quantity FROM StockIngredient WHERE StockUnitID = inStockUnitID;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET NoRecords = 1;
	
	OPEN CUR_Ingredients;
	WHILE NoRecords <> 1 DO
		FETCH CUR_Ingredients INTO tIngrStockUnitID, tIngrQuantity;
		
		IF NoRecords <> 1 THEN
			SET tSaleLocationID = (SELECT SaleLocationID FROM Stock INNER JOIN StockUnit ON Stock.ID = StockID WHERE StockUnit.ID = tIngrStockUnitID);
			SET tFound = (SELECT 1 FROM StockLocationQuantity WHERE LocationID = tSaleLocationID AND StockUnitID = tIngrStockUnitID);
			IF tFound IS NULL THEN
				INSERT INTO StockLocationQuantity VALUES (tSaleLocationID, tIngrStockUnitID, (inQty * tIngrQuantity));
			ELSE
				UPDATE StockLocationQuantity SET Quantity = Quantity + (inQty * tIngrQuantity) WHERE LocationID = tSaleLocationID AND StockUnitID = tIngrStockUnitID;
			END IF;
			UPDATE StockUnit SET SOH_Quantity = SOH_Quantity + (inQty * tIngrQuantity), ModifierID = inModifierID WHERE ID = tIngrStockUnitID;
		END IF;
	END WHILE;
	CLOSE CUR_Ingredients;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StockSell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `StockSell`(IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inStockUnitID INTEGER,
	 IN inSaleQty DECIMAL(9,2),
	 IN inModifierID INTEGER, 
	 OUT outCostIncl DECIMAL(14,5))
BEGIN
	DECLARE tUnitCost DECIMAL(14,5);
	DECLARE tLocationID INTEGER;
	DECLARE tIsRecipe			BOOLEAN;
	DECLARE tIngrStockUnitID	INTEGER;
	DECLARE tIngrQuantity		DECIMAL(9,3);
	DECLARE NoRecords			INTEGER DEFAULT 0;
	DECLARE CUR_RecipeItems CURSOR FOR
		SELECT StockUnitID1, Quantity FROM StockIngredient WHERE StockUnitID = inStockUnitID;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET NoRecords = 1;
	
	SET tIsRecipe = (SELECT 1 FROM StockUnit WHERE ID = inStockUnitID AND Type = 'Recipe');
	IF tIsRecipe IS NOT NULL THEN
		
		OPEN CUR_RecipeItems;
		WHILE NoRecords <> 1 DO
			FETCH CUR_RecipeItems INTO tIngrStockUnitID, tIngrQuantity;
			IF NoRecords <> 1 THEN
				
				SET tUnitCost	= (SELECT SOH_Cost FROM StockUnit WHERE ID = tIngrStockUnitID);
				SET tLocationID	= (SELECT SaleLocationID FROM Stock INNER JOIN StockUnit ON Stock.ID = StockID WHERE StockUnit.ID = tIngrStockUnitID);
				CALL CreateStockTransaction(inSourceID, inTransactionID, tIngrStockUnitID, tLocationID, -(inSaleQty * tIngrQuantity), tUnitCost, "Ingredient Sold", inModifierID);
			END IF;
		END WHILE;
		CLOSE CUR_RecipeItems;
	END IF;
	SET tUnitCost   = (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID);
	SET tLocationID = (SELECT LocationID FROM Stock INNER JOIN StockUnit ON Stock.ID = StockID WHERE StockUnit.ID = inStockUnitID);
	
	CALL CreateAccountTransaction(inSourceID, inTransactionID, "STOCK", -tUnitCost, "", inModifierID);
	CALL CreateAccountTransaction(inSourceID, inTransactionID, "COS", tUnitCost, "", inModifierID);
	CALL CreateStockTransaction(inSourceID, inTransactionID, inStockUnitID, tLocationID, -inSaleQty, tUnitCost, "Sold", inModifierID);
	SET outCostIncl = tUnitCost;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StockSellLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `StockSellLocation`(IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inStockUnitID INTEGER,
	 IN inSaleQty DECIMAL(9,2),
	 IN inModifierID INTEGER, 
	 OUT outCostIncl DECIMAL(14,5))
BEGIN
	DECLARE tUnitCost 		DECIMAL(14,5);
	DECLARE tUnitCostActual		DECIMAL(14,5);
	DECLARE tOutQty 		DECIMAL(14,5);
	DECLARE tLocationID		INTEGER;
	DECLARE tIsRecipe		BOOLEAN;
	DECLARE tIngrStockUnitID	INTEGER;
	DECLARE tIngrQuantity		DECIMAL(9,3);
	DECLARE NoRecords			INTEGER DEFAULT 0;
	DECLARE CUR_RecipeItems CURSOR FOR
		SELECT StockUnitID1, Quantity FROM StockIngredient WHERE StockUnitID = inStockUnitID;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET NoRecords = 1;
	
	CALL StockUnitQtyAdjLocations( inStockUnitID, inSaleQty, 0, 0, inSourceID ,inTransactionID,inModifierID, tOutQty,tUnitCostActual);

	SET tIsRecipe = (SELECT 1 FROM StockUnit WHERE ID = inStockUnitID AND Type = 'Recipe');
	IF tIsRecipe IS NOT NULL THEN
		
		OPEN CUR_RecipeItems;
		WHILE NoRecords <> 1 DO
			FETCH CUR_RecipeItems INTO tIngrStockUnitID, tIngrQuantity;
			IF NoRecords <> 1 THEN
				
				SET tUnitCost	= (SELECT SOH_Cost FROM StockUnit WHERE ID = tIngrStockUnitID);
				SET tLocationID	= (SELECT SaleLocationID FROM Stock INNER JOIN StockUnit ON Stock.ID = StockID WHERE StockUnit.ID = tIngrStockUnitID);
				CALL CreateStockTransaction(inSourceID, inTransactionID, tIngrStockUnitID, tLocationID, -(inSaleQty * tIngrQuantity), tUnitCost, "Ingredient Sold", inModifierID);
			END IF;
		END WHILE;
		CLOSE CUR_RecipeItems;
	END IF;
	SET tUnitCost   = (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID);
	SET tLocationID = (SELECT LocationID FROM Stock INNER JOIN StockUnit ON Stock.ID = StockID WHERE StockUnit.ID = inStockUnitID);
	
	CALL CreateAccountTransaction(inSourceID, inTransactionID, "STOCK", -tUnitCostActual, "", inModifierID);
	CALL CreateAccountTransaction(inSourceID, inTransactionID, "COS", tUnitCostActual, "", inModifierID);

	SET outCostIncl = tUnitCostActual;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StockUnitQtyAdj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `StockUnitQtyAdj`(IN inStockUnitID INTEGER,
	 IN inQty DOUBLE,
	 IN inModifierID INTEGER)
BEGIN
	DECLARE tSaleLocationID INTEGER;
	DECLARE tFound BOOLEAN;
	
	SET tSaleLocationID = (SELECT SaleLocationID FROM Stock INNER JOIN StockUnit ON StockID = Stock.ID WHERE StockUnit.ID = inStockUnitID);
	SET tFound = (SELECT 1 FROM StockLocationQuantity WHERE LocationID = tSaleLocationID AND StockUnitID = inStockUnitID);
	IF tFound IS NULL THEN
		INSERT INTO StockLocationQuantity VALUES(tSaleLocationID, inStockUnitID, inQty);		
	ELSE
		UPDATE StockLocationQuantity SET Quantity = Quantity + inQty WHERE LocationID = tSaleLocationID AND StockUnitID = inStockUnitID;
	END IF;
	
	UPDATE StockUnit SET SOH_Quantity = SOH_Quantity + inQty, ModifierID = inModifierID WHERE ID = inStockUnitID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StockUnitQtyAdjLocations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `StockUnitQtyAdjLocations`(
         IN inStockUnitID INTEGER,
         IN inQty DOUBLE,
         IN inLevel INTEGER,
         IN inTotalCostIncl DECIMAL(14,5),
	 IN inSourceID VARCHAR(10), 
	 IN inTransactionID INTEGER,
	 IN inModifierID INTEGER, 
         OUT outQty DOUBLE,
         OUT outTotalCostIncl DECIMAL(14,5)
)
BEGIN
        DECLARE NoRecords INTEGER;
        DECLARE tDefLocation INTEGER;
        DECLARE tActCost DOUBLE;
        DECLARE tQuantity DOUBLE;
        DECLARE tQuantityLeft DOUBLE;
        DECLARE tOtherLocation INTEGER;
        DECLARE tOtherQuantity DOUBLE;
        DECLARE tReferalID INTEGER;
        DECLARE tReferalMulti DOUBLE;
        DECLARE tOutCost DOUBLE;
        DECLARE tOutQty DOUBLE;
        DECLARE CUR_Locations CURSOR FOR SELECT Quantity,LocationID FROM StockLocationQuantity WHERE LocationID <> tDefLocation AND StockUnitID = inStockUnitID;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET NoRecords = -1;

	
	SET outQty = inQty;
	SET outTotalCostIncl = inTotalCostIncl;
	
	IF inLevel <= 10 AND inQty > 0 THEN

		
		SET tDefLocation = (SELECT SaleLocationID FROM Stock INNER JOIN StockUnit ON StockID = Stock.ID WHERE StockUnit.ID = inStockUnitID);

		
	        IF tDefLocation IS NULL THEN
			UPDATE Stock SET SaleLocationID = 0 WHERE Stock.ID = inStockUnitID;
			SET tDefLocation = 0; 
		END IF;

		
                SET tQuantity = (SELECT Quantity FROM StockLocationQuantity WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID);

		
		IF tQuantity IS NULL THEN
			INSERT INTO StockLocationQuantity (LocationID,StockUnitID,Quantity) VALUES (tDefLocation,inStockUnitID,0);
			SET outQty = 0;
			SET tQuantity = 0;
			SET outTotalCostIncl = 0;
		END IF;  

		
		IF tQuantity >= inQty THEN

			
			UPDATE StockLocationQuantity SET Quantity = Quantity - inQty WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID;
			SET outQty = 0;
			
			
 			UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - inQty WHERE ID = inStockUnitID;
			
			SET tActCost = (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID);

			IF tQuantity - inQty = 0 THEN
				UPDATE StockUnit SET LastCost = tActCost WHERE ID = inStockUnitID;
			END IF;
 
			SET outTotalCostIncl = outTotalCostIncl + tActCost * inQty;

			CALL CreateStockTransaction(inSourceID, inTransactionID, inStockUnitID, tDefLocation, -inQty, tActCost, "Sold", inModifierID);
		ELSE
			SET tActCost = 0;			

			IF tQuantity > 0 THEN
				UPDATE StockLocationQuantity SET Quantity = Quantity - tQuantity WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID;
				SET tQuantityLeft = inQty - tQuantity;

                        
				UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - tQuantity WHERE ID = inStockUnitID;

				SET tActCost = (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID);
                        	SET outTotalCostIncl = outTotalCostIncl + tActCost * tQuantity;
                        
				CALL CreateStockTransaction(inSourceID, inTransactionID, inStockUnitID, tDefLocation, -tQuantity, tActCost, "Sold", inModifierID);
			ELSE
				SET tQuantityLeft = inQty;
			END IF; 
			
			SET NoRecords = 0;
                        OPEN CUR_Locations;

                        other_locations_loop : LOOP
				
				
                                FETCH CUR_Locations INTO tOtherQuantity,tOtherLocation;

				
                                IF NoRecords = -1 THEN
                                        LEAVE other_locations_loop;
                                END IF;

				IF tOtherQuantity > 0 THEN
				
					IF tOtherQuantity >= tQuantityLeft THEN
					
						SET tQuantity = tQuantityLeft;
						SET tQuantityLeft = 0; 
					ELSE
					
						SET tQuantity = tOtherQuantity;
						SET tQuantityLeft = tQuantityLeft - tOtherQuantity;
					END IF;

				
					UPDATE StockLocationQuantity SET Quantity = Quantity - tQuantity WHERE LocationID = tOtherLocation AND StockUnitID = inStockUnitID;
					UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - tQuantity WHERE ID = inStockUnitID;
					SET outTotalCostIncl = outTotalCostIncl + (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID) * tQuantity;
	
					CALL CreateStockTransaction(inSourceID, inTransactionID, inStockUnitID, tOtherLocation, -tQuantity, tActCost, "Sold", inModifierID);
				END IF;

                                IF tQuantityLeft = 0 THEN
                                        LEAVE other_locations_loop;
                                END IF;

                        END LOOP;
			CLOSE CUR_Locations;
			
			SET outQty = tQuantityLeft;
		END IF;

		
                IF tQuantityLeft <> 0 THEN
                                
			
                        SELECT StockReferalID,StockReferalQuantity INTO tReferalID,tReferalMulti From StockUnit WHERE ID = inStockUnitID;
	
                        IF tReferalID <> -1 THEN
				
				CALL StockUnitQtyAdjLocations(tReferalID,tQuantityLeft*tReferalMulti,inLevel+1,outTotalCostIncl,inSourceID,inTransactionID,inModifierID,tOutQty,outTotalCostIncl);
				
				
                                SET tQuantityLeft = tOutQty / tReferalMulti;

				
                                IF tQuantityLeft <> 0 THEN

                                	SELECT StockReferalID2,StockReferalQuantity2 INTO tReferalID,tReferalMulti From StockUnit WHERE ID = inStockUnitID;
                                        IF tReferalID <> -1 THEN

						
                                        	CALL StockUnitQtyAdjLocations(tReferalID,tQuantityLeft*tReferalMulti,inLevel+1,outTotalCostIncl,inSourceID,inTransactionID,inModifierID,tOutQty,outTotalCostIncl);
                                                SET tQuantityLeft = tOutQty / tReferalMulti;
						
						
                                                IF tQuantityLeft <> 0 THEN

                                                	SELECT StockReferalID3,StockReferalQuantity3 INTO tReferalID,tReferalMulti From StockUnit WHERE ID = inStockUnitID;
                                                       	IF tReferalID <> -1 THEN
	
								
                                                        	CALL StockUnitQtyAdjLocations(tReferalID,tQuantityLeft*tReferalMulti,inLevel+1,outTotalCostIncl,inSourceID,inTransactionID,inModifierID,tOutQty,outTotalCostIncl);
								SET tQuantityLeft = tOutQty / tReferalMulti;
                                                        END IF;
                                                END IF;
                                        END IF;
                                END IF;
	
                        END IF;
		END IF;                        
	

		
		IF inLevel = 0 THEN

			
			IF tQuantityLeft <> 0 THEN

				
				UPDATE StockLocationQuantity SET Quantity = Quantity - tQuantityLeft WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID;
				
				
 				UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - tQuantityLeft WHERE ID = inStockUnitID;

				
				SET outTotalCostIncl = outTotalCostIncl + (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID) * tQuantityLeft;
				SET tActCost = (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID);

				CALL CreateStockTransaction(inSourceID, inTransactionID, inStockUnitID, tDefLocation, -tQuantityLeft, tActCost, "Sold", inModifierID);
			END IF;			

			SET outTotalCostIncl = outTotalCostIncl / inQty;
			SET outQty = 0;
		END IF;	
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StockUnitQtyAdjOld` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `StockUnitQtyAdjOld`(
         IN inStockUnitID INTEGER,
         IN inQty DOUBLE,
         IN inLevel INTEGER,
         IN inTotalCostIncl DECIMAL(14,5),
         OUT outQty DOUBLE,
         OUT outTotalCostIncl DECIMAL(14,5)
)
BEGIN
        DECLARE NoRecords INTEGER;
        DECLARE tDefLocation INTEGER;
        DECLARE tQuantity DOUBLE;
        DECLARE tOtherLocation INTEGER;
        DECLARE tOtherQuantity DOUBLE;
        DECLARE tReferalID INTEGER;
        DECLARE tReferalQty DOUBLE;
        DECLARE tOutCost DOUBLE;
        DECLARE tOutQty DOUBLE;
        DECLARE CUR_Locations CURSOR FOR SELECT Quantity,LocationID FROM StockLocationQuantity WHERE LocationID <> tDefLocation AND StockUnitID = inStockUnitID;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET NoRecords = -1;
        SET outTotalCostIncl = inTotalCostIncl;
        
        SET tDefLocation = (SELECT SaleLocationID FROM Stock INNER JOIN StockUnit ON StockID = Stock.ID WHERE StockUnit.ID = inStockUnitID);
        IF tDefLocation IS NULL THEN
                
		SELECT inQty INTO outQty;
        ELSE
                
                SET tQuantity = (SELECT Quantity FROM StockLocationQuantity WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID);
                IF tQuantity >= inQty THEN
                        
                        UPDATE StockLocationQuantity SET Quantity = Quantity - inQty WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID;
                        UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - inQty WHERE ID = inStockUnitID;
                        SET outTotalCostIncl = outTotalCostIncl + (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID) * inQty;
 			IF inLevel = 0 THEN
				SET outTotalCostIncl = outTotalCostIncl / inQty;
			END IF;
                        SELECT 0 INTO outQty;
                ELSE
                        
                          UPDATE StockLocationQuantity SET Quantity = Quantity - tQuantity WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID;
                        UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - tQuantity WHERE ID = inStockUnitID;
                        SET outTotalCostIncl = outTotalCostIncl + (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID) * tQuantity;
                        SET tQuantity = inQty - tQuantity; 

                        SET NoRecords = 0;
                        OPEN CUR_Locations;

                        other_locations_loop : LOOP

                                FETCH CUR_Locations INTO tOtherQuantity,tOtherLocation;

                                IF NoRecords = -1 THEN
                                        LEAVE other_locations_loop;
                                END IF;

                                IF tOtherQuantity >= tQuantity THEN
                                        UPDATE StockLocationQuantity SET Quantity = Quantity - tQuantity WHERE LocationID = tOtherLocation AND StockUnitID = inStockUnitID;
                                        UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - tQuantity WHERE ID = inStockUnitID;
                                        SET outTotalCostIncl = outTotalCostIncl + (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID) * tQuantity;
                                        SET tQuantity = 0;
                                        LEAVE other_locations_loop;
                                ELSE
                                        UPDATE StockLocationQuantity SET Quantity = Quantity - tOtherQuantity WHERE LocationID = tOtherLocation AND StockUnitID = inStockUnitID;
                                        UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - tOtherQuantity WHERE ID = inStockUnitID;
                                        SET outTotalCostIncl = outTotalCostIncl + (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID) * tOtherQuantity;
                                        SET tQuantity = tQuantity - tOtherQuantity;
                                END IF;
                                  
                                IF tQuantity = 0 THEN
                                        LEAVE other_locations_loop;
                                END IF;

                        END LOOP;

                            CLOSE CUR_Locations;
                        
                        IF tQuantity <> 0 THEN
                                
                                SELECT StockReferalID,StockReferalQuantity INTO tReferalID,tReferalQty From StockUnit WHERE ID = inStockUnitID;
                                IF tReferalID <> -1 THEN
                                        CALL StockUnitQtyAdjLocations(tReferalID,tQuantity*tReferalQty,inLevel+1,outTotalCostIncl,tOutQty,outTotalCostIncl);
                                        SET tQuantity = tOutQty / tReferalQty;
                                        IF tQuantity <> 0 THEN
                                                SELECT StockReferalID2,StockReferalQuantity2 INTO tReferalID,tReferalQty From StockUnit WHERE ID = inStockUnitID;
                                                IF tReferalID <> -1 THEN
                                                        CALL StockUnitQtyAdjLocations(tReferalID,tQuantity*tReferalQty,inLevel+1,outTotalCostIncl,tOutQty,outTotalCostIncl);
                                                        SET tQuantity = tOutQty / tReferalQty;
                                                        IF tQuantity <> 0 THEN
                                                                SELECT StockReferalID3,StockReferalQuantity3 INTO tReferalID,tReferalQty From StockUnit WHERE ID = inStockUnitID;
                                                                IF tReferalID <> -1 THEN
                                                                        CALL StockUnitQtyAdjLocations(tReferalID,tQuantity*tReferalQty,inLevel+1,outTotalCostIncl,tOutQty,outTotalCostIncl);
                                                                        SET tQuantity = tOutQty / tReferalQty;
                                                                END IF;
                                                        END IF;
                                                END IF;
                                        END IF;
                                END IF;
                        END IF;                        

                        IF inLevel = 0 THEN 
				IF tQuantity <> 0 THEN
	                                UPDATE StockLocationQuantity SET Quantity = Quantity - tQuantity WHERE LocationID = tDefLocation AND StockUnitID = inStockUnitID;
                                	UPDATE StockUnit SET SOH_Quantity = SOH_Quantity - tQuantity WHERE ID = inStockUnitID;
                                	SET outTotalCostIncl = outTotalCostIncl + (SELECT SOH_Cost FROM StockUnit WHERE ID = inStockUnitID) * tQuantity;
                                	SELECT 0 INTO outQty;
                        	ELSE
	                                SELECT tQuantity INTO outQty;
        	                END IF;
				SET outTotalCostIncl = outTotalCostIncl / inQty;
			END IF;
                END IF;
        END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStockItemImport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `UpdateStockItemImport`(
	IN inStockID 		INTEGER,
	IN inStockUnitID 	INTEGER,
	IN inName		CHAR(50),
	IN inBarcode 		CHAR(50),
	IN inCode 		CHAR(30),
	IN inCategory 		CHAR(30),
	IN inPrintLocation 	INTEGER,
	IN inSaleLocation 	INTEGER,
	IN inLocation 		INTEGER,
	IN inPrice		DOUBLE(11,2),
	IN inSellable		CHAR(5),
	IN inVat		CHAR(5),
	IN inMeasure		CHAR(50),
	IN inProcessType	INTEGER,
	IN inType		CHAR(50),
	IN inRef1StockID	INTEGER,
	IN inRef1Ratio		DOUBLE(15,5),
	IN inRef2StockID	INTEGER,
	IN inRef2Ratio		DOUBLE(15,5),
	IN inRef3StockID	INTEGER,
	IN inRef3Ratio		DOUBLE(15,5),
	IN inSOHCost		DOUBLE(15,5),
	IN inSOHQuantity	DOUBLE(15,5)
	)
BEGIN

	UPDATE Stock SET
		Name = inName, 
		BarCode = inBarcode,
		Code = inCode,
		StockCategoryID = inCategory,
		PrintLocationID = inPrintLocation,
		SaleLocationID = inSaleLocation,
		LocationID = inLocation,
		Sellable = inSellable,
		VatID = inVat,
		UnitType = inMeasure,
		ProductProcessTypeID = inProcessType,
		StockUpdated = NOW()
	Where Stock.ID = inStockID; 

	UPDATE StockUnit SET 
		StockUnit.Type = inType,
		Price = inPrice,
		StockUnitUpdated = NOW(),
		StockReferalID = inRef1StockID,
		StockReferalID2 = inRef2StockID,
		StockReferalID3 = inRef3StockID,
		StockReferalQuantity = inRef1Ratio,
		StockReferalQuantity2 = inRef2Ratio,
		StockReferalQuantity3 = inRef3Ratio,
		SOH_Cost = inSOHCost,
		SOH_Quantity = inSOHQuantity
	Where StockUnit.ID = inStockUnitID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `WaiterCashupState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `WaiterCashupState`(IN inWaiterID INTEGER, OUT outState CHAR(4))
BEGIN
	DECLARE lastZRun DATETIME;
	DECLARE transCount INTEGER;
	SET lastZRun = (SELECT MAX(Date) FROM zrun);
	SET transCount = (
		SELECT COUNT(*)
		FROM Transaction
		WHERE
			Common_AuthUserID = inWaiterID AND
			TransactionTypeID IN ('TC', 'CU') AND
			Date > lastZRun
	);
	CASE transCount
		WHEN 0 THEN SET outState = 'None';	
		WHEN 1 THEN SET outState = 'Busy';	
		WHEN 2 THEN SET outState = 'Done';	
		ELSE SET outState = 'Undf';			
	END CASE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `Terminal_FMCG`
--

USE `Terminal_FMCG`;

--
-- Final view structure for view `AccountInfo`
--

/*!50001 DROP TABLE IF EXISTS `AccountInfo`*/;
/*!50001 DROP VIEW IF EXISTS `AccountInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AccountInfo` AS select `E`.`ID` AS `EntityID`,`EA`.`ID` AS `EntityAccountID`,`EAT`.`Name` AS `Type`,`E`.`Enabled` AS `Enabled`,`E`.`IDNumber` AS `IDNumber`,`E`.`Title` AS `Title`,`E`.`FirstName` AS `FirstName`,`E`.`LastName` AS `LastName`,`E`.`Contact` AS `ContactNum`,`E`.`PhysicalAddress` AS `PhysicalAddress`,`E`.`PostalAddress` AS `PostalAddress`,`E`.`DeliveryAddress` AS `DeliveryAddress`,`E`.`Phone` AS `PhoneNumber`,`E`.`Fax` AS `FaxNumber`,`E`.`Cell` AS `CellNumber`,`E`.`Email` AS `EmailAddress`,`E`.`Bank` AS `Bank`,`E`.`BankBranch` AS `BankBranch`,`E`.`BankAccount` AS `BankAccount`,`E`.`Reference` AS `Reference`,`E`.`VatNo` AS `VatNumber`,`E`.`Notes` AS `Notes`,`E`.`ChequeName` AS `ChequeName`,`E`.`CreditRating` AS `CreditRating`,`E`.`Code` AS `Code` from ((`Entity` `E` join `EntityAccount` `EA` on((`EA`.`EntityID` = `E`.`ID`))) join `EntityAccountTemplate` `EAT` on((`EAT`.`ID` = `EA`.`EntityAccountTemplateID`))) order by `E`.`LastName`,`E`.`FirstName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `BasicTableInfo`
--

/*!50001 DROP TABLE IF EXISTS `BasicTableInfo`*/;
/*!50001 DROP VIEW IF EXISTS `BasicTableInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `BasicTableInfo` AS select `OS`.`ID` AS `OpenSaleID`,`OS`.`TableNo` AS `Name`,`OS`.`OrderID` AS `Extension`,`OS`.`State` AS `State`,`AU`.`Name` AS `WaiterName`,`AU`.`WaiterNum` AS `WaiterNum` from (`OpenSale` `OS` join `AuthUser` `AU` on((`AU`.`ID` = `OS`.`WaiterID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Configuration`
--

/*!50001 DROP TABLE IF EXISTS `Configuration`*/;
/*!50001 DROP VIEW IF EXISTS `Configuration`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Configuration` AS select `WaiterOMRConfig`.`ConfigOption` AS `ConfigOption`,`WaiterOMRConfig`.`Value` AS `Value` from `WaiterOMRConfig` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ItemsBeforeFromDate`
--

/*!50001 DROP TABLE IF EXISTS `ItemsBeforeFromDate`*/;
/*!50001 DROP VIEW IF EXISTS `ItemsBeforeFromDate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ItemsBeforeFromDate` AS select `StockUnit`.`ID` AS `ID`,ifnull(`InvoiceLineItem`.`PrevSOH_Cost`,0) AS `IFNULL(InvoiceLineItem.PrevSOH_Cost, 0)` from ((((((`InvoiceLineItem` join `Invoice` on((`Invoice`.`ID` = `InvoiceLineItem`.`InvoiceID`))) join `StockUnit` on((`InvoiceLineItem`.`StockUnitID` = `StockUnit`.`ID`))) join `Stock` on((`Stock`.`ID` = `StockUnit`.`StockID`))) join `StockCategory` on((`Stock`.`StockCategoryID` = `StockCategory`.`ID`))) join `ReportCategory` on((`StockCategory`.`ReportCategoryID` = `ReportCategory`.`ID`))) join `ProductProcessType` on((`Stock`.`ProductProcessTypeID` = `ProductProcessType`.`ID`))) where ((`Invoice`.`InvoiceDate` <= _utf8'2006-04-06 23:38:54') and (`StockCategory`.`ReportCategoryID` = _utf8'50') and (`ProductProcessType`.`StockCosted` = 1)) order by `Invoice`.`InvoiceDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MenuBarModifierInfo`
--

/*!50001 DROP TABLE IF EXISTS `MenuBarModifierInfo`*/;
/*!50001 DROP VIEW IF EXISTS `MenuBarModifierInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `MenuBarModifierInfo` AS select `SC`.`Name` AS `CatName`,if((`SMCLI`.`Expand` = 1),_latin1'True',_latin1'False') AS `ExpandCat`,`S`.`ID` AS `StockID`,`SU`.`ID` AS `StockUnitID`,if((`SC`.`ExtraModifier` = 1),_latin1'True',_latin1'False') AS `ExtraOrModifier` from (((`StockMainCategoryLineItem` `SMCLI` join `StockCategory` `SC` on((`SC`.`ID` = `SMCLI`.`StockCategoryID`))) join `Stock` `S` on((`S`.`StockCategoryID` = `SC`.`ID`))) join `StockUnit` `SU` on((`SU`.`StockID` = `S`.`ID`))) where ((`SMCLI`.`StockMainCategoryID` = 10) and (`S`.`Findable` = _utf8'Y') and (`S`.`Sellable` = _utf8'Y')) order by `SC`.`Name`,`S`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MenuFoodModifierInfo`
--

/*!50001 DROP TABLE IF EXISTS `MenuFoodModifierInfo`*/;
/*!50001 DROP VIEW IF EXISTS `MenuFoodModifierInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `MenuFoodModifierInfo` AS select `SC`.`Name` AS `CatName`,if((`SMCLI`.`Expand` = 1),_latin1'True',_latin1'False') AS `ExpandCat`,`S`.`ID` AS `StockID`,`SU`.`ID` AS `StockUnitID`,if((`SC`.`ExtraModifier` = 1),_latin1'True',_latin1'False') AS `ExtraOrModifier` from (((`StockMainCategoryLineItem` `SMCLI` join `StockCategory` `SC` on((`SC`.`ID` = `SMCLI`.`StockCategoryID`))) join `Stock` `S` on((`S`.`StockCategoryID` = `SC`.`ID`))) join `StockUnit` `SU` on((`SU`.`StockID` = `S`.`ID`))) where ((`SMCLI`.`StockMainCategoryID` = 30) and (`S`.`Findable` = _utf8'Y') and (`S`.`Sellable` = _utf8'Y')) order by `SC`.`Name`,`S`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MenuInfo`
--

/*!50001 DROP TABLE IF EXISTS `MenuInfo`*/;
/*!50001 DROP VIEW IF EXISTS `MenuInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`PenguinPOS`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `MenuInfo` AS select `SMC`.`Name` AS `MainCatName`,`SMC`.`Type` AS `CatType`,`SC`.`Name` AS `CatName`,if((`SMCLI`.`Expand` = 1),_latin1'True',_latin1'False') AS `ExpandCat`,`S`.`ID` AS `StockID`,`SU`.`ID` AS `StockUnitID`,if((`SC`.`ExtraModifier` = 1),_latin1'True',_latin1'False') AS `ExtraOrModifier` from ((((`StockMainCategory` `SMC` join `StockMainCategoryLineItem` `SMCLI` on((`SMCLI`.`StockMainCategoryID` = `SMC`.`ID`))) join `StockCategory` `SC` on((`SC`.`ID` = `SMCLI`.`StockCategoryID`))) join `Stock` `S` on((`S`.`StockCategoryID` = `SC`.`ID`))) join `StockUnit` `SU` on((`SU`.`StockID` = `S`.`ID`))) where ((`S`.`Sellable` = _utf8'Y') and (`S`.`Findable` = _utf8'Y')) order by `SMC`.`Name`,`SC`.`Name`,`S`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ModifierInfo`
--

/*!50001 DROP TABLE IF EXISTS `ModifierInfo`*/;
/*!50001 DROP VIEW IF EXISTS `ModifierInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ModifierInfo` AS select `SM`.`ID` AS `ID`,`SMLI`.`ID` AS `ModID`,`SM`.`Description` AS `Modifier`,`SM`.`Type` AS `Type`,`SMLI`.`Name` AS `OptionName`,ifnull(`SMLI`.`StockUnitID`,0) AS `OptionItemID` from (`StockModifier` `SM` join `StockModifierLineItem` `SMLI` on((`SMLI`.`StockModifierID` = `SM`.`ID`))) order by `SM`.`Description`,`SMLI`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OpenFoodItems`
--

/*!50001 DROP TABLE IF EXISTS `OpenFoodItems`*/;
/*!50001 DROP VIEW IF EXISTS `OpenFoodItems`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `OpenFoodItems` AS select `SU`.`ID` AS `ID`,0.00 AS `0.00` from (`Stock` `S` join `StockUnit` `SU` on((`SU`.`StockID` = `S`.`ID`))) where ((`S`.`Findable` = _utf8'Y') and (`S`.`Sellable` = _utf8'Y') and ((`S`.`Name` like _utf8'Open%') or (`S`.`StockCategoryID` = _utf8'Order Mes'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OpenSaleInfo`
--

/*!50001 DROP TABLE IF EXISTS `OpenSaleInfo`*/;
/*!50001 DROP VIEW IF EXISTS `OpenSaleInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`PenguinPOS`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `OpenSaleInfo` AS select `OS`.`ID` AS `OpenSaleID`,`OS`.`TableNo` AS `TableName`,`OS`.`OrderID` AS `TableExtension`,`OS`.`WaiterID` AS `WaiterID`,`OS`.`State` AS `State`,`OS`.`TableCount` AS `Covers`,`S`.`PaymentMethodID` AS `PaymentMethod`,`S`.`Exclusive` AS `TotalExc`,`S`.`Vat` AS `TotalVat`,`S`.`Tip` AS `Tip`,`S`.`TransactionID` AS `TransactionID`,`S`.`Discount` AS `Discount`,`OS`.`DiscReason` AS `DiscountReason`,`OS`.`PrintBillCount` AS `PrintBillCount`,`OS`.`EntityID` AS `AccountID`,`S`.`Paid` AS `Paid`,`OS`.`AuthUserID_Discount` AS `AuthUserID_Discount`,`OS`.`AuthUserID_Returns` AS `AuthUserID_Returns` from (`OpenSale` `OS` left join `Sale` `S` on((`S`.`ID` = `OS`.`SaleID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OpenSaleItems`
--

/*!50001 DROP TABLE IF EXISTS `OpenSaleItems`*/;
/*!50001 DROP VIEW IF EXISTS `OpenSaleItems`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`PenguinPOS`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `OpenSaleItems` AS select `S`.`BarCode` AS `BarCode`,if((`SU`.`Deposit` = _utf8'Y'),_latin1'True',_latin1'False') AS `Deposit`,`SC`.`Name` AS `Category`,ifnull(`SC`.`Type`,_utf8'') AS `CategoryType`,ifnull(`SU`.`SOH_Cost`,0) AS `Cost`,`S`.`Code` AS `Code`,if((ifnull(`SC`.`ExtraModifier`,_latin1'0') = _latin1'1'),_latin1'True',_latin1'False') AS `IsExtra`,if((`S`.`Findable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsFindable`,if((`S`.`Sellable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsSellable`,`L`.`Name` AS `Location`,`S`.`Name` AS `Name`,`OS`.`ID` AS `OpenSaleID`,`OSLI`.`ID` AS `OpenSaleLineItemID`,`OSLI`.`DiscountAmount` AS `DiscountAmount`,`OSLI`.`DiscountPercentage` AS `DiscountPercentage`,`OSLI`.`modified` AS `OrderedTime`,`OSLI`.`UnitPrice` AS `Price`,`OSLI`.`CustomPrice` AS `CustomPrice`,`OSLI`.`Weight` AS `Weight`,`S`.`PrintLocationID` AS `PrintLocation`,`PPT`.`Name` AS `ProductProcessType`,`OSLI`.`Quantity` AS `Quantity`,`SU`.`SOH_Quantity` AS `SOHQuantity`,`S`.`ID` AS `StockID`,`SU`.`ID` AS `StockUnitID`,ifnull(`SUBLOC`.`Name`,_utf8'') AS `SubLocation`,ifnull(`SALELOC`.`Name`,_latin1'') AS `SaleLocation`,`S`.`Type` AS `Type`,`S`.`UnitType` AS `UnitType`,ifnull(`V`.`Rate`,0) AS `VatPercentage`,`V`.`Description` AS `VatDescription`,`OSLI`.`InitialPrice` AS `InitialPrice`,`OSLI`.`AuthUserID_Discount` AS `AuthUserID_Discount`,`OSLI`.`AuthUserID_PriceOverride` AS `AuthUserID_PriceOverride`,`OSLI`.`AuthUserID_Return` AS `AuthUserID_Return` from (((((((((`OpenSale` `OS` join `OpenSaleLineItem` `OSLI` on((`OSLI`.`OpenSaleID` = `OS`.`ID`))) join `StockUnit` `SU` on((`SU`.`ID` = `OSLI`.`StockUnitID`))) join `Stock` `S` on((`S`.`ID` = `SU`.`StockID`))) left join `StockCategory` `SC` on((`SC`.`ID` = `S`.`StockCategoryID`))) join `Location` `L` on((`L`.`ID` = `S`.`LocationID`))) left join `ProductProcessType` `PPT` on((`PPT`.`ID` = `S`.`ProductProcessTypeID`))) left join `SubLocation` `SUBLOC` on((`SUBLOC`.`ID` = `S`.`SubLocationID`))) left join `Location` `SALELOC` on((`SALELOC`.`ID` = `S`.`SaleLocationID`))) left join `Vat` `V` on((`V`.`ID` = `S`.`VatID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SaleSummary`
--

/*!50001 DROP TABLE IF EXISTS `SaleSummary`*/;
/*!50001 DROP VIEW IF EXISTS `SaleSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SaleSummary` AS select `S`.`Common_AuthUserID` AS `WaiterID`,`S`.`Date` AS `Date`,`T`.`TransactionTypeID` AS `TransactionType`,(`S`.`Exclusive` + `S`.`Vat`) AS `Total`,`S`.`Exclusive` AS `Exclusive`,`S`.`Vat` AS `VAT`,`S`.`Discount` AS `Discount`,`S`.`Tip` AS `Tip` from (`Sale` `S` join `Transaction` `T` on((`T`.`ID` = `S`.`TransactionID`))) order by `S`.`Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StockCat`
--

/*!50001 DROP TABLE IF EXISTS `StockCat`*/;
/*!50001 DROP VIEW IF EXISTS `StockCat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `StockCat` AS select `S`.`ID` AS `ID`,`S`.`Name` AS `Name` from `StockCategory` `S` limit 0,1000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StockInfo`
--

/*!50001 DROP TABLE IF EXISTS `StockInfo`*/;
/*!50001 DROP VIEW IF EXISTS `StockInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`PenguinPOS`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `StockInfo` AS select `S`.`BarCode` AS `BarCode`,if((`S`.`DepositItem` = _utf8'Y'),_latin1'True',_latin1'False') AS `Deposit`,`SC`.`Name` AS `Category`,ifnull(`SC`.`Type`,_utf8'') AS `CategoryType`,`S`.`Code` AS `Code`,`S`.`COSAccountID` AS `COSAccount`,ifnull(`SU`.`SOH_Cost`,0) AS `Cost`,`S`.`IncomeAccountID` AS `IncomeAccount`,if((ifnull(`SC`.`ExtraModifier`,_latin1'0') = _latin1'1'),_latin1'True',_latin1'False') AS `IsExtra`,if((`S`.`Findable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsFindable`,if((`S`.`Sellable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsSellable`,`L`.`Name` AS `Location`,`S`.`Name` AS `Name`,`SU`.`Price` AS `Price`,`PL`.`Name` AS `PrintLocation`,`PPT`.`Name` AS `ProductProcessType`,_latin1'1' AS `Quantity`,ifnull(`SALELOC`.`Name`,_latin1'') AS `SaleLocation`,`SU`.`SOH_Quantity` AS `SOHQuantity`,`S`.`ID` AS `StockID`,ifnull(`SUBLOC`.`Name`,_latin1'') AS `SubLocation`,`S`.`Type` AS `Type`,`S`.`UnitType` AS `UnitType`,ifnull(`V`.`Rate`,14.00) AS `VatPercentage`,`SU`.`ID` AS `StockUnitID`,if((count(`SMU`.`StockModifierID`) > 0),_latin1'True',_latin1'False') AS `HasModifiers`,if((`SU`.`StockUnitUpdated` > `S`.`StockUpdated`),`SU`.`StockUnitUpdated`,`S`.`StockUpdated`) AS `StockModified` from (((((((((`Stock` `S` join `StockUnit` `SU` on((`SU`.`StockID` = `S`.`ID`))) left join `StockModifierUnit` `SMU` on((`SMU`.`StockUnitID` = `SU`.`ID`))) left join `StockCategory` `SC` on((`SC`.`ID` = `S`.`StockCategoryID`))) join `Location` `L` on((`L`.`ID` = `S`.`LocationID`))) left join `ProductProcessType` `PPT` on((`PPT`.`ID` = `S`.`ProductProcessTypeID`))) left join `Location` `SALELOC` on((`SALELOC`.`ID` = `S`.`SaleLocationID`))) left join `Location` `SUBLOC` on((`SUBLOC`.`ID` = `S`.`SubLocationID`))) left join `Vat` `V` on((`V`.`ID` = `S`.`VatID`))) left join `PrintLocation` `PL` on((`PL`.`ID` = `S`.`PrintLocationID`))) where ((`S`.`Findable` = _utf8'Y') and ((`S`.`Sellable` = _utf8'Y') or (`SC`.`ExtraModifier` = _latin1'1'))) group by `S`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StockInfo2`
--

/*!50001 DROP TABLE IF EXISTS `StockInfo2`*/;
/*!50001 DROP VIEW IF EXISTS `StockInfo2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `StockInfo2` AS select `S`.`BarCode` AS `BarCode`,if((`SU`.`Deposit` = _utf8'Y'),_latin1'True',_latin1'False') AS `Deposit`,`SC`.`Name` AS `Category`,ifnull(`SC`.`Type`,_utf8'') AS `CategoryType`,`S`.`Code` AS `Code`,`S`.`COSAccountID` AS `COSAccount`,`SU`.`SOH_Cost` AS `Cost`,`S`.`IncomeAccountID` AS `IncomeAccount`,if((ifnull(`SC`.`ExtraModifier`,_latin1'0') = _latin1'1'),_latin1'True',_latin1'False') AS `IsExtra`,if((`S`.`Findable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsFindable`,if((`S`.`Sellable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsSellable`,`L`.`Name` AS `Location`,`S`.`Name` AS `Name`,`SU`.`Price` AS `Price`,`PL`.`Name` AS `PrintLocation`,`PPT`.`Name` AS `ProductProcessType`,_latin1'1' AS `Quantity`,ifnull(`SALELOC`.`Name`,_latin1'') AS `SaleLocation`,`SU`.`SOH_Quantity` AS `SOHQuantity`,`S`.`ID` AS `StockID`,ifnull(`SUBLOC`.`Name`,_latin1'') AS `SubLocation`,`S`.`Type` AS `Type`,`S`.`UnitType` AS `UnitType`,ifnull(`V`.`Rate`,14.00) AS `VatPercentage`,`SU`.`ID` AS `StockUnitID`,if((count(`SMU`.`StockModifierID`) > 0),_latin1'True',_latin1'False') AS `HasModifiers`,if((`SU`.`StockUnitUpdated` > `S`.`StockUpdated`),`SU`.`StockUnitUpdated`,`S`.`StockUpdated`) AS `StockModified` from (((((((((`Stock` `S` join `StockUnit` `SU` on((`SU`.`StockID` = `S`.`ID`))) left join `StockModifierUnit` `SMU` on((`SMU`.`StockUnitID` = `SU`.`ID`))) left join `StockCategory` `SC` on((`SC`.`ID` = `S`.`StockCategoryID`))) join `Location` `L` on((`L`.`ID` = `S`.`LocationID`))) left join `ProductProcessType` `PPT` on((`PPT`.`ID` = `S`.`ProductProcessTypeID`))) left join `Location` `SALELOC` on((`SALELOC`.`ID` = `S`.`SaleLocationID`))) left join `Location` `SUBLOC` on((`SUBLOC`.`ID` = `S`.`SubLocationID`))) left join `Vat` `V` on((`V`.`ID` = `S`.`VatID`))) left join `PrintLocation` `PL` on((`PL`.`ID` = `S`.`PrintLocationID`))) group by `S`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StockInfoTest`
--

/*!50001 DROP TABLE IF EXISTS `StockInfoTest`*/;
/*!50001 DROP VIEW IF EXISTS `StockInfoTest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `StockInfoTest` AS select `S`.`BarCode` AS `BarCode`,`SC`.`Name` AS `Category`,ifnull(`SC`.`Type`,_utf8'') AS `CategoryType`,`S`.`Code` AS `Code`,`S`.`COSAccountID` AS `COSAccount`,`SU`.`Cost` AS `Cost`,`S`.`IncomeAccountID` AS `IncomeAccount`,if((ifnull(`SC`.`ExtraModifier`,_latin1'0') = _latin1'1'),_latin1'True',_latin1'False') AS `IsExtra`,if((`S`.`Findable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsFindable`,if((`S`.`Sellable` = _utf8'Y'),_latin1'True',_latin1'False') AS `IsSellable`,`L`.`Name` AS `Location`,`S`.`Name` AS `Name`,`SU`.`Price` AS `Price`,`PL`.`Name` AS `PrintLocation` from ((((`Stock` `S` join `StockUnit` `SU` on((`SU`.`StockID` = `S`.`ID`))) left join `StockCategory` `SC` on((`SC`.`ID` = `S`.`StockCategoryID`))) join `Location` `L` on((`L`.`ID` = `S`.`LocationID`))) left join `PrintLocation` `PL` on((`PL`.`ID` = `S`.`PrintLocationID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `UpdatedStock`
--

/*!50001 DROP TABLE IF EXISTS `UpdatedStock`*/;
/*!50001 DROP VIEW IF EXISTS `UpdatedStock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `UpdatedStock` AS select `StockInfo`.`BarCode` AS `BarCode`,`StockInfo`.`Deposit` AS `Deposit`,`StockInfo`.`Category` AS `Category`,`StockInfo`.`CategoryType` AS `CategoryType`,`StockInfo`.`Code` AS `Code`,`StockInfo`.`COSAccount` AS `COSAccount`,`StockInfo`.`Cost` AS `Cost`,`StockInfo`.`IncomeAccount` AS `IncomeAccount`,`StockInfo`.`IsExtra` AS `IsExtra`,`StockInfo`.`IsFindable` AS `IsFindable`,`StockInfo`.`IsSellable` AS `IsSellable`,`StockInfo`.`Location` AS `Location`,`StockInfo`.`Name` AS `Name`,`StockInfo`.`Price` AS `Price`,`StockInfo`.`PrintLocation` AS `PrintLocation`,`StockInfo`.`ProductProcessType` AS `ProductProcessType`,`StockInfo`.`Quantity` AS `Quantity`,`StockInfo`.`SaleLocation` AS `SaleLocation`,`StockInfo`.`SOHQuantity` AS `SOHQuantity`,`StockInfo`.`StockID` AS `StockID`,`StockInfo`.`SubLocation` AS `SubLocation`,`StockInfo`.`Type` AS `Type`,`StockInfo`.`UnitType` AS `UnitType`,`StockInfo`.`VatPercentage` AS `VatPercentage`,`StockInfo`.`StockUnitID` AS `StockUnitID`,`StockInfo`.`HasModifiers` AS `HasModifiers`,`StockInfo`.`StockModified` AS `StockModified`,`UpdateAvail`.`UID` AS `UID`,`UpdateAvail`.`UpdateComponent` AS `UpdateComponent`,`UpdateAvail`.`LastUpdateRecived` AS `LastUpdateRecived` from (`StockInfo` left join `UpdateAvail` on((`UpdateAvail`.`UpdateComponent` = _latin1'Stock'))) where (`StockInfo`.`StockModified` > `UpdateAvail`.`LastUpdateRecived`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `UserInfo`
--

/*!50001 DROP TABLE IF EXISTS `UserInfo`*/;
/*!50001 DROP VIEW IF EXISTS `UserInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `UserInfo` AS select `AU`.`ID` AS `ID`,`AU`.`Name` AS `Name`,`AU`.`WaiterNum` AS `WaiterNum`,`AU`.`PasswordClear` AS `PasswordClear`,if((`AU`.`Mode` = _utf8'enabled'),_latin1'True',_latin1'False') AS `ModeEnabled`,`AU`.`Commission` AS `Commission`,if((`AU`.`ZRunState` = _utf8'AllowSale'),_latin1'True',_latin1'False') AS `ZRunState`,`AU`.`TelNo` AS `TelNo`,`AU`.`Address` AS `Address`,`AG`.`ID` AS `GroupID` from ((`AuthUser` `AU` join `AuthUserGroup` `AUG` on((`AUG`.`AuthUserID` = `AU`.`ID`))) join `AuthGroup` `AG` on((`AG`.`ID` = `AUG`.`AuthGroupID`))) */;
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

-- Dump completed on 2013-06-14 10:18:36
