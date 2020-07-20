-- MySQL dump 10.13  Distrib 8.0.19, for osx10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: join_us
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `adjudicate_comment`
--

DROP TABLE IF EXISTS `adjudicate_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjudicate_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(255) NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `adjudicate_comment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjudicate_comment`
--

LOCK TABLES `adjudicate_comment` WRITE;
/*!40000 ALTER TABLE `adjudicate_comment` DISABLE KEYS */;
INSERT INTO `adjudicate_comment` VALUES (1,'2020-07-17 23:43:25','Unacceptable bullying behavior.',65),(2,'2020-07-17 23:43:25','Unacceptable bullying behavior.',66),(3,'2020-07-17 23:43:25','Other reason, needs investigation.',67);
/*!40000 ALTER TABLE `adjudicate_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjudicate_photo`
--

DROP TABLE IF EXISTS `adjudicate_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjudicate_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(255) NOT NULL,
  `photo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `adjudicate_photo_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjudicate_photo`
--

LOCK TABLES `adjudicate_photo` WRITE;
/*!40000 ALTER TABLE `adjudicate_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjudicate_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisers`
--

DROP TABLE IF EXISTS `advertisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `advertiser_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advertiser_name` (`advertiser_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisers`
--

LOCK TABLES `advertisers` WRITE;
/*!40000 ALTER TABLE `advertisers` DISABLE KEYS */;
INSERT INTO `advertisers` VALUES (1,'Denesik LLC','2020-07-07 16:58:24'),(2,'Powlowski Group','2019-07-07 16:58:24'),(3,'Kling and Sons','2020-07-07 16:58:24'),(4,'Bartoletti - Mante','2020-07-07 16:58:24'),(5,'Yost - Kuhic','2020-07-07 16:58:24'),(6,'Pacocha Inc','2020-07-07 16:58:24'),(7,'Leannon Inc','2020-07-07 16:58:24'),(8,'Abshire, Spencer and Senger','2020-07-07 16:58:24'),(9,'Crona - Lockman','2020-07-07 16:58:24'),(10,'Doyle - Lesch','2020-07-07 16:58:24');
/*!40000 ALTER TABLE `advertisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisers_info`
--

DROP TABLE IF EXISTS `advertisers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisers_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `advertiser_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `advertiser_id` (`advertiser_id`),
  CONSTRAINT `advertisers_info_ibfk_1` FOREIGN KEY (`advertiser_id`) REFERENCES `advertisers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisers_info`
--

LOCK TABLES `advertisers_info` WRITE;
/*!40000 ALTER TABLE `advertisers_info` DISABLE KEYS */;
INSERT INTO `advertisers_info` VALUES (1,'http://lorempixel.com/640/480/people','Maddison_Konopelski37@yahoo.com','0797439369',1,'2020-07-07 17:09:01'),(2,'http://lorempixel.com/640/480/nightlife','Salvador_Padberg@yahoo.com','8127723467',2,'2020-07-07 17:09:01'),(3,'http://lorempixel.com/640/480/fashion','Neoma_Welch0@hotmail.com','9384287453',3,'2020-07-07 17:09:01'),(4,'https://i.picsum.photos/id/576/200/300.jpg?hmac=Uf-okGnisfAphCT3N-WTyzaG-e-r9yvOhY3W43DMWwA','Mireya_Kuhn39@gmail.com','2024174632',4,'2020-07-07 17:09:01'),(5,'http://lorempixel.com/640/480/sports','Robin.Stracke57@gmail.com','6146368926',5,'2020-07-07 17:09:01'),(6,'https://i.picsum.photos/id/900/200/300.jpg?hmac=_xi51c2dVkaF_l3I_H4M3nOl9u4_0rsxUoFUfOSGOCk','Aniyah_Kohler61@hotmail.com','1806920834',6,'2020-07-07 17:09:01'),(7,'http://lorempixel.com/640/480/food','Etha.Lubowitz83@yahoo.com','6436413850',7,'2020-07-07 17:09:01'),(8,'http://lorempixel.com/640/480/technics','Osvaldo9@hotmail.com','0242167534',8,'2020-07-07 17:09:01'),(9,'https://i.picsum.photos/id/973/200/300.jpg?hmac=gFjS6R63ZUmM9pkLFyPxuEmsxvZ_e8VJxB3mcXpvTUQ','Cristal95@yahoo.com','4811965884',9,'2020-07-07 17:09:01'),(10,'https://i.picsum.photos/id/257/200/300.jpg?hmac=j0NVivHS9qSXBGkBOUjchG0Ckt6pje1KSfHsnwtr_8M','Sigmund.Kessler7@yahoo.com','4425714362',10,'2020-07-07 17:09:01');
/*!40000 ALTER TABLE `advertisers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `advertiser_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertiser_id` (`advertiser_id`),
  CONSTRAINT `campaigns_ibfk_1` FOREIGN KEY (`advertiser_id`) REFERENCES `advertisers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'2020-07-13 19:22:02','2020-01-01 20:00:00','2020-08-01 19:00:00',1),(2,'2020-07-13 19:27:16','2019-10-01 19:31:17','2020-04-15 08:10:07',2),(3,'2020-07-13 19:27:16','2019-11-21 20:15:40','2021-07-15 08:05:07',3),(4,'2020-07-13 19:27:16','2019-09-01 13:31:17','2020-04-20 08:10:07',4),(5,'2020-07-13 19:27:16','2019-10-21 18:15:40','2021-02-15 09:05:07',5);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(255) NOT NULL,
  `photo_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `photo_id` (`photo_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'I like it',1,1,'2020-07-08 20:49:11'),(2,'I like it',89,2,'2020-07-08 21:11:46'),(3,'Cool',90,3,'2020-07-08 21:11:46'),(4,'Nice Picture',91,4,'2020-07-08 21:11:46'),(5,'Awesome Pic',92,5,'2020-07-08 21:11:46'),(6,'I love the photo',93,6,'2020-07-08 21:11:46'),(7,'xoxo',94,7,'2020-07-08 21:11:46'),(8,'Awesome Dude',95,8,'2020-07-08 21:11:46'),(9,'I like it',100,9,'2020-07-08 21:21:06'),(10,'Cool',101,10,'2020-07-08 21:21:06'),(11,'Nice Picture',103,11,'2020-07-08 21:21:06'),(12,'Awesome Pic',109,12,'2020-07-08 21:21:06'),(13,'I love the photo',110,13,'2020-07-08 21:21:06'),(14,'xoxo',111,14,'2020-07-08 21:21:06'),(15,'Awesome Dude',112,15,'2020-07-08 21:21:06'),(16,'I like it',113,16,'2020-07-08 21:22:11'),(17,'Cool',119,14,'2020-07-08 21:22:11'),(18,'Nice Picture',120,15,'2020-07-08 21:22:11'),(19,'Awesome Pic',121,16,'2020-07-08 21:22:11'),(20,'I love the photo',122,17,'2020-07-08 21:22:11'),(21,'xoxo',123,18,'2020-07-08 21:22:11'),(22,'Awesome Dude',124,19,'2020-07-08 21:22:11'),(23,'I like it',125,20,'2020-07-08 21:23:16'),(24,'Cool',126,21,'2020-07-08 21:23:16'),(25,'Nice Picture',127,22,'2020-07-08 21:23:16'),(26,'Awesome Pic',128,23,'2020-07-08 21:23:16'),(27,'I love the photo',129,24,'2020-07-08 21:23:16'),(28,'xoxo',130,25,'2020-07-08 21:23:16'),(29,'Awesome Dude',131,26,'2020-07-08 21:23:16'),(30,'I really like it',125,7,'2020-07-08 21:25:01'),(31,'Coolio',126,6,'2020-07-08 21:25:01'),(32,'Great Pic!!!!',127,5,'2020-07-08 21:25:01'),(33,'I want more',128,4,'2020-07-08 21:25:01'),(34,'Radical!!!',129,3,'2020-07-08 21:25:01'),(35,'3> 3> 3>',130,2,'2020-07-08 21:25:01'),(36,'10!!',131,1,'2020-07-08 21:25:01'),(37,'I really like it',113,14,'2020-07-08 21:26:11'),(38,'Coolio',119,13,'2020-07-08 21:26:11'),(39,'Great Pic!!!!',120,12,'2020-07-08 21:26:11'),(40,'I want more',121,11,'2020-07-08 21:26:11'),(41,'Radical!!!',122,10,'2020-07-08 21:26:11'),(42,'3> 3> 3>',123,9,'2020-07-08 21:26:11'),(43,'10!!',124,8,'2020-07-08 21:26:11'),(44,'I really like it',101,21,'2020-07-08 21:27:04'),(45,'Coolio',102,20,'2020-07-08 21:27:04'),(46,'Great Pic!!!!',103,19,'2020-07-08 21:27:04'),(47,'I want more',109,18,'2020-07-08 21:27:04'),(48,'Radical!!!',110,17,'2020-07-08 21:27:04'),(49,'3> 3> 3>',111,16,'2020-07-08 21:27:04'),(50,'10!!',112,15,'2020-07-08 21:27:04'),(51,'I really like it',90,28,'2020-07-08 21:28:06'),(52,'Coolio',91,27,'2020-07-08 21:28:06'),(53,'Great Pic!!!!',92,26,'2020-07-08 21:28:06'),(54,'I want more',93,25,'2020-07-08 21:28:06'),(55,'Radical!!!',94,24,'2020-07-08 21:28:06'),(56,'3> 3> 3>',95,23,'2020-07-08 21:28:06'),(57,'10!!',100,22,'2020-07-08 21:28:06'),(58,'I really like it',95,1,'2020-07-08 21:30:17'),(59,'Coolio',93,2,'2020-07-08 21:30:17'),(60,'Great Pic!!!!',94,3,'2020-07-08 21:30:17'),(61,'I want more',91,4,'2020-07-08 21:30:17'),(62,'Radical!!!',90,5,'2020-07-08 21:30:17'),(63,'3> 3> 3>',1,6,'2020-07-08 21:30:17'),(64,'10!!',89,7,'2020-07-08 21:30:17'),(65,'Not very nice things!!',89,4,'2020-07-17 23:34:19'),(66,'I do not like databases',100,10,'2020-07-17 23:34:19'),(67,'wjeifjewfioj',113,16,'2020-07-17 23:34:19');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `follower_id` int NOT NULL,
  `followee_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`follower_id`,`followee_id`),
  KEY `followee_id` (`followee_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followee_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,1,'2020-07-13 21:58:36'),(1,2,'2020-07-13 21:58:36'),(1,3,'2020-07-13 21:58:36'),(1,4,'2020-07-13 21:58:36'),(1,5,'2020-07-13 21:58:36'),(1,6,'2020-07-13 21:58:36'),(1,7,'2020-07-13 21:58:36'),(1,8,'2020-07-13 21:58:36'),(1,9,'2020-07-13 21:58:36'),(1,10,'2020-07-13 21:58:36'),(1,11,'2020-07-13 21:58:36'),(1,12,'2020-07-13 21:58:36'),(1,13,'2020-07-13 21:58:36'),(1,14,'2020-07-13 21:58:36'),(1,15,'2020-07-13 21:58:36'),(1,16,'2020-07-13 21:58:36'),(1,17,'2020-07-13 21:58:36'),(1,18,'2020-07-13 21:58:36'),(1,19,'2020-07-13 21:58:36'),(1,20,'2020-07-13 21:58:36'),(1,21,'2020-07-13 21:58:36'),(1,22,'2020-07-13 21:58:36'),(1,23,'2020-07-13 21:58:36'),(1,24,'2020-07-13 21:58:36'),(1,25,'2020-07-13 21:58:36'),(1,26,'2020-07-13 21:58:36'),(1,27,'2020-07-13 21:58:36'),(1,28,'2020-07-13 21:58:36'),(2,7,'2020-07-13 22:00:23'),(2,21,'2020-07-13 22:03:18'),(2,28,'2020-07-13 22:00:23'),(3,2,'2020-07-13 22:00:23'),(3,7,'2020-07-13 22:01:59'),(4,2,'2020-07-13 22:01:59'),(4,3,'2020-07-13 22:00:23'),(5,3,'2020-07-13 22:01:59'),(5,4,'2020-07-13 22:00:23'),(5,7,'2020-07-13 22:02:57'),(6,4,'2020-07-13 22:01:59'),(6,5,'2020-07-13 22:00:23'),(6,14,'2020-07-13 22:03:37'),(7,5,'2020-07-13 22:01:59'),(7,6,'2020-07-13 22:00:23'),(8,7,'2020-07-13 22:00:23'),(9,8,'2020-07-13 22:00:23'),(10,6,'2020-07-13 22:01:59'),(10,7,'2020-07-13 22:03:18'),(10,9,'2020-07-13 22:00:23'),(11,7,'2020-07-13 22:01:59'),(11,10,'2020-07-13 22:00:23'),(12,8,'2020-07-13 22:01:59'),(12,11,'2020-07-13 22:00:23'),(13,9,'2020-07-13 22:01:59'),(13,12,'2020-07-13 22:00:23'),(14,10,'2020-07-13 22:01:59'),(14,13,'2020-07-13 22:00:23'),(15,7,'2020-07-13 22:03:37'),(15,11,'2020-07-13 22:01:59'),(15,14,'2020-07-13 22:00:23'),(15,28,'2020-07-13 22:02:57'),(16,12,'2020-07-13 22:01:59'),(16,15,'2020-07-13 22:00:23'),(17,13,'2020-07-13 22:01:59'),(17,16,'2020-07-13 22:00:23'),(17,28,'2020-07-13 22:03:18'),(18,14,'2020-07-13 22:01:59'),(18,17,'2020-07-13 22:00:23'),(19,15,'2020-07-13 22:01:59'),(19,18,'2020-07-13 22:00:23'),(20,14,'2020-07-13 22:02:57'),(20,16,'2020-07-13 22:01:59'),(20,19,'2020-07-13 22:00:23'),(21,17,'2020-07-13 22:01:59'),(21,20,'2020-07-13 22:00:23'),(22,18,'2020-07-13 22:01:59'),(22,21,'2020-07-13 22:00:23'),(23,19,'2020-07-13 22:01:59'),(23,22,'2020-07-13 22:00:23'),(24,14,'2020-07-13 22:03:18'),(24,20,'2020-07-13 22:01:59'),(24,23,'2020-07-13 22:00:23'),(25,21,'2020-07-13 22:01:59'),(25,24,'2020-07-13 22:00:23'),(26,22,'2020-07-13 22:01:59'),(26,25,'2020-07-13 22:00:23'),(27,23,'2020-07-13 22:01:59'),(27,26,'2020-07-13 22:00:23'),(28,21,'2020-07-13 22:02:57'),(28,24,'2020-07-13 22:01:59'),(28,27,'2020-07-13 22:00:23');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_id` int NOT NULL,
  `photo_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`photo_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,'2020-07-13 21:31:43'),(1,89,'2020-07-13 21:31:43'),(1,90,'2020-07-13 21:31:43'),(1,91,'2020-07-13 21:31:43'),(1,92,'2020-07-13 21:31:43'),(1,93,'2020-07-13 21:31:43'),(1,94,'2020-07-13 21:31:43'),(1,95,'2020-07-13 21:31:43'),(1,100,'2020-07-13 21:31:43'),(1,101,'2020-07-13 21:31:43'),(1,102,'2020-07-13 21:31:43'),(1,103,'2020-07-13 21:31:43'),(1,109,'2020-07-13 21:31:43'),(1,110,'2020-07-13 21:31:43'),(1,111,'2020-07-13 21:31:43'),(1,112,'2020-07-13 21:31:43'),(1,113,'2020-07-13 21:31:43'),(1,119,'2020-07-13 21:31:43'),(1,120,'2020-07-13 21:31:43'),(1,121,'2020-07-13 21:31:43'),(1,122,'2020-07-13 21:31:43'),(1,123,'2020-07-13 21:31:43'),(1,124,'2020-07-13 21:31:43'),(1,125,'2020-07-13 21:31:43'),(1,126,'2020-07-13 21:31:43'),(1,127,'2020-07-13 21:31:43'),(1,128,'2020-07-13 21:31:43'),(1,129,'2020-07-13 21:31:43'),(1,130,'2020-07-13 21:31:43'),(1,131,'2020-07-13 21:31:43'),(2,1,'2020-07-13 21:34:12'),(2,128,'2020-07-13 21:35:47'),(2,129,'2020-07-13 21:34:12'),(3,1,'2020-07-13 21:35:47'),(3,89,'2020-07-13 21:34:12'),(3,129,'2020-07-13 21:35:47'),(3,130,'2020-07-13 21:34:12'),(4,89,'2020-07-13 21:35:47'),(4,90,'2020-07-13 21:34:12'),(4,130,'2020-07-13 21:35:47'),(4,131,'2020-07-13 21:34:12'),(5,90,'2020-07-13 21:35:47'),(5,91,'2020-07-13 21:34:12'),(5,131,'2020-07-13 21:35:47'),(6,91,'2020-07-13 21:35:47'),(6,92,'2020-07-13 21:34:12'),(7,92,'2020-07-13 21:35:47'),(7,93,'2020-07-13 21:34:12'),(8,93,'2020-07-13 21:35:47'),(8,94,'2020-07-13 21:34:12'),(9,94,'2020-07-13 21:35:47'),(9,95,'2020-07-13 21:34:12'),(10,95,'2020-07-13 21:35:47'),(10,100,'2020-07-13 21:34:12'),(11,100,'2020-07-13 21:35:47'),(11,101,'2020-07-13 21:34:12'),(12,101,'2020-07-13 21:35:47'),(12,102,'2020-07-13 21:34:12'),(13,102,'2020-07-13 21:35:47'),(13,103,'2020-07-13 21:34:12'),(14,103,'2020-07-13 21:35:47'),(14,109,'2020-07-13 21:34:12'),(15,109,'2020-07-13 21:35:47'),(15,110,'2020-07-13 21:34:12'),(16,110,'2020-07-13 21:35:47'),(16,111,'2020-07-13 21:34:12'),(17,110,'2020-07-13 21:36:40'),(17,111,'2020-07-13 21:35:47'),(17,112,'2020-07-13 21:34:12'),(18,110,'2020-07-13 21:36:40'),(18,112,'2020-07-13 21:35:47'),(18,113,'2020-07-13 21:34:12'),(19,110,'2020-07-13 21:36:40'),(19,113,'2020-07-13 21:35:47'),(19,119,'2020-07-13 21:34:12'),(20,110,'2020-07-13 21:36:40'),(20,119,'2020-07-13 21:35:47'),(20,120,'2020-07-13 21:34:12'),(21,110,'2020-07-13 21:36:40'),(21,120,'2020-07-13 21:35:47'),(21,121,'2020-07-13 21:34:12'),(22,121,'2020-07-13 21:35:47'),(22,122,'2020-07-13 21:34:12'),(23,122,'2020-07-13 21:35:47'),(23,123,'2020-07-13 21:34:12'),(24,123,'2020-07-13 21:35:47'),(24,124,'2020-07-13 21:34:12'),(25,124,'2020-07-13 21:35:47'),(25,125,'2020-07-13 21:34:12'),(26,125,'2020-07-13 21:35:47'),(26,126,'2020-07-13 21:34:12'),(27,126,'2020-07-13 21:35:47'),(27,127,'2020-07-13 21:34:12'),(28,127,'2020-07-13 21:35:47'),(28,128,'2020-07-13 21:34:12');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_tags`
--

DROP TABLE IF EXISTS `photo_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_tags` (
  `photo_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`photo_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `photo_tags_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `photo_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_tags`
--

LOCK TABLES `photo_tags` WRITE;
/*!40000 ALTER TABLE `photo_tags` DISABLE KEYS */;
INSERT INTO `photo_tags` VALUES (1,1),(89,1),(90,1),(95,1),(100,1),(101,1),(103,1),(109,1),(110,1),(111,1),(112,1),(121,1),(123,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(100,2),(101,2),(112,2),(121,2),(123,2),(125,2),(126,2),(128,2),(129,2),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(113,3),(119,3),(120,3),(124,3),(125,3),(128,3),(129,3),(130,3),(90,4),(91,4),(92,4),(93,4),(94,4),(102,4),(103,4),(109,4),(110,4),(120,4),(122,4),(124,4),(127,4),(130,4),(131,4),(89,5),(95,5),(102,5),(103,5),(109,5),(110,5),(111,5),(113,5),(119,5),(122,5),(127,5),(131,5);
/*!40000 ALTER TABLE `photo_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'https://i.picsum.photos/id/328/200/300.jpg?hmac=rUU8GIGsrhqhqkiTi6qIQXtGstAUmnv4yV1bc_Sns7w',2,'Facere impedit voluptas eius provident aliquam fugit aperiam consequatur. Aliquam omnis non quam.','2020-05-17 10:57:10'),(89,'https://i.picsum.photos/id/529/200/300.jpg?hmac=WqdWbOIAJ1H2q4r92Fc4KXM--xvRadidXmV5P2R1rDg',19,'Dignissimos et sint. Dolorum quaerat architecto consequatur rerum ab hic dolor corrupti cumque. Voluptas dolorum ut minima quaerat.','2019-08-26 11:06:28'),(90,'https://i.picsum.photos/id/768/200/300.jpg?hmac=lFX2oZVTUayugh_YZQ5q6uoXJFYaOJz3d2_GLaIW2aU',16,'Recusandae libero sint eos repudiandae consequatur quam non. Assumenda et eaque ut rerum quia.','2020-01-27 15:30:00'),(91,'https://i.picsum.photos/id/1038/200/300.jpg?hmac=YkU1czWdP8PVibbjnh2YFlQZVnacHSntbpt41mgiXGU',22,'Rerum nam quasi reprehenderit perferendis est dolores quia. Voluptate earum laborum id id voluptatum earum deserunt cupiditate nostrum.','2020-05-22 22:48:34'),(92,'https://i.picsum.photos/id/1071/200/300.jpg?hmac=y09-AL4WisOkuQR4SOKzDWjPHWptbCDbEaFP0yJkKNY',6,'Eius inventore corrupti consequuntur rerum blanditiis quia. Corrupti quia ut deserunt dolor consequuntur harum culpa odit quo. Vel quaerat sint ad et molestiae in non et.','2020-06-30 10:25:30'),(93,'https://i.picsum.photos/id/869/200/300.jpg?hmac=vfzqvPaYnRQQ4fRCoE1BlbCtj0z6DN7EBWnZO0rBrj0',4,'Voluptatem autem illo nisi sunt non ex reiciendis. Et libero sunt minima sequi.','2019-11-09 19:56:40'),(94,'https://i.picsum.photos/id/982/200/300.jpg?hmac=xTKU9lOLW4f1_EmdynREJoYXZ7jXQUnwUNcYa6Nf4WA',25,'Officia non nemo quo voluptatem omnis voluptatem magnam. Nihil architecto iste optio eius voluptatem in. Repellat voluptatem nihil a reprehenderit voluptatem exercitationem aliquid. Magni nulla quia dignissimos. Sit sequi qui veniam atque officia.','2020-01-18 22:32:13'),(95,'https://i.picsum.photos/id/810/200/300.jpg?hmac=HgwlXd-OaLOAqhGyCiZDUb_75EgUI4u0GtS7nfgxd8s',24,'Et recusandae non ipsa omnis. Molestias quasi nihil vel sit veritatis. Provident sunt et aspernatur ea. Et sint corporis rerum ipsum sequi. Et qui eos qui modi.','2020-07-02 23:37:58'),(100,'https://i.picsum.photos/id/132/200/300.jpg?hmac=oY1bslA1BJLjQ_GRTPoSm_Mtps2WtlDyfll3uIayrVQ',21,'Atque illum sed necessitatibus molestiae. Officiis laboriosam delectus qui asperiores explicabo dolor assumenda laudantium voluptatem. Placeat et quisquam ullam ut illum.','2020-06-18 03:02:14'),(101,'https://i.picsum.photos/id/683/200/300.jpg?hmac=LalV5DeTpQsFRVpqJKk0lZ_zRqag95TYBrqTW06L9yw',6,'Qui ad autem cum. Ut distinctio ad est qui ipsam quidem molestiae dolores rerum. Provident et perspiciatis quaerat dolores ex et.','2020-04-18 00:31:23'),(102,'https://i.picsum.photos/id/982/200/300.jpg?hmac=xTKU9lOLW4f1_EmdynREJoYXZ7jXQUnwUNcYa6Nf4WA',25,'Quod dolorum nihil incidunt omnis ipsam dolor. Exercitationem autem dolorem inventore. Aspernatur deleniti qui aliquid velit ut. Et voluptas dolores sit soluta voluptate impedit. Sapiente eligendi aut inventore adipisci soluta eveniet.','2020-02-06 19:55:55'),(103,'https://i.picsum.photos/id/740/200/300.jpg?hmac=xGwbWP1ZuaeJBMwh-M84vhuZJwd9V9chUBV1IK6-fbk',5,'Placeat enim enim doloribus sed molestias mollitia quaerat. Aut asperiores necessitatibus reiciendis accusantium et doloremque aut fuga est. Dolore ut fugit in quam unde saepe enim enim a.','2020-05-18 05:35:14'),(109,'https://i.picsum.photos/id/54/200/300.jpg?hmac=Vj23spqBn9b_PrCh4LPiDrcffi6svfFFmjWMfycPVRE',20,'Veniam autem quis. Quibusdam consequatur earum nemo sapiente et sint rerum ut quis. Suscipit aliquam iusto distinctio. Ut dolorem in velit voluptates voluptatem doloribus.','2020-06-22 05:53:13'),(110,'https://i.picsum.photos/id/251/200/300.jpg?hmac=9xXOWzHXFkhqJDfiXSZARyy0pDmdAyazrrJw6VNgoKc',13,'Repellat quasi porro. Deleniti tenetur possimus est nemo. Occaecati ab accusantium animi quo et praesentium mollitia consectetur. Corporis dolor atque quia vero quos qui id repellendus voluptatem.','2020-04-04 20:51:33'),(111,'https://i.picsum.photos/id/805/200/300.jpg?hmac=fF1qvNutYd9afa-FIuDfrsh7edNFRq6IXWnMbSuzSOs',24,'Nulla totam non enim quisquam libero rerum. Aut quia totam et. Libero facere nisi. Quo quos dolor consequatur nemo omnis quia nam unde est. Quas minus aperiam enim cum eos itaque porro.','2020-07-07 10:42:10'),(112,'https://i.picsum.photos/id/655/200/300.jpg?hmac=SlNnemiSlvt724JhX_6o0cfOmLnp5NnDewnA1_vB2rg',18,'Rerum quaerat dolores est rerum doloremque pariatur. Et quis necessitatibus. Et reiciendis mollitia voluptatem voluptas dolore veritatis. Eos vero facilis incidunt aliquid iusto soluta.','2020-06-28 19:53:25'),(113,'https://i.picsum.photos/id/527/200/300.jpg?hmac=6Lf2qU7Zdc2yYQxeUig2n8w34lTZbsLR6qgw9x9zbfE',8,'Maiores quaerat ut accusamus recusandae quam quis. Quidem et est saepe. Consequuntur ea dolores qui porro. Quibusdam dolorem quam facere minima voluptatem possimus accusantium sit.','2019-12-30 02:37:38'),(119,'https://i.picsum.photos/id/40/200/300.jpg?hmac=1W_CCXwLDbBONqjiVzw4WW5Zvi3P7AByQQDuqpALR5w',6,'Est veritatis sit rerum deleniti voluptatem totam. Qui alias adipisci accusamus ut est sit provident. Suscipit eum consequatur labore quam magni dolore qui eligendi similique. Nihil assumenda laborum et deleniti atque dolorem.','2019-12-07 06:25:37'),(120,'https://i.picsum.photos/id/56/200/300.jpg?hmac=XmVgSk2B8hc9Smojh4o14JnHBHBM8Gj0ePS78sxZbzI',22,'Cupiditate enim molestias expedita ut. Aut pariatur fugit nobis ad commodi sint inventore facilis vel. Dignissimos vel nemo qui rem rerum tenetur. Ratione eaque labore. Omnis dolorum fuga quia molestias. Et deserunt alias nam qui est culpa.','2019-08-03 09:50:01'),(121,'https://i.picsum.photos/id/918/200/300.jpg?hmac=1gEvFp6O-XDh4848VnlwyOIrVy8s_aJNhYyTzxN9_JA',19,'Rem esse architecto dolor quia quis impedit quo quod quisquam. Necessitatibus iste libero mollitia optio quidem commodi a molestiae voluptate. Minima et porro vero.','2020-03-25 13:28:48'),(122,'https://i.picsum.photos/id/398/200/300.jpg?hmac=Hfi27DwRf-atKwN-O57cBXGhlUtMCe6rozr2rWH8xH8',22,'Eligendi quia non in aut. Veniam sunt quam laborum suscipit sequi aliquid mollitia repellat et. Est omnis consequatur eius voluptas maxime ut. Optio optio voluptatibus rem qui voluptatem et praesentium.','2019-11-03 12:06:42'),(123,'https://i.picsum.photos/id/408/200/300.jpg?hmac=WHLCqIpd4lzmPZlRRMknXp1aOoOr7_qdtEUwozDmIWQ',17,'Dolorem tempora dicta atque qui iusto incidunt nostrum qui. At aut iusto rem iste qui excepturi. Accusantium explicabo nemo vel sit atque rem consequatur. Rem accusantium ad quisquam.','2020-02-22 14:56:14'),(124,'https://i.picsum.photos/id/780/200/300.jpg?hmac=Zmxf0t2fpCbfZrR5NAXA_IKAP_8P6fYe9P440jUTWag',6,'Ea possimus sapiente enim ad quo et voluptatem dolorem facilis. Debitis nostrum dolorem necessitatibus nobis. Omnis architecto aut omnis incidunt soluta quidem ea omnis. Repellat maiores ullam animi fuga libero reprehenderit.','2019-08-13 01:55:37'),(125,'https://i.picsum.photos/id/685/200/300.jpg?hmac=0R7Bu0AY8CbakSrvbQHtFb_swiFQbJqQe7bKpbV6viA',19,'Reprehenderit vero iste. Ea ipsam quibusdam libero ut nihil libero et minima nisi.','2020-03-16 04:49:51'),(126,'https://i.picsum.photos/id/842/200/300.jpg?hmac=VSk5Mm2EuqIzLkckPneqxJrjhkmVquU3o-pEYmuGiTk',2,'Sequi alias velit aliquid eum voluptas minus et aliquid. Id deleniti quidem fuga ea velit rerum. Ab quis dicta officiis animi et rerum aut sit nostrum. Mollitia saepe et quibusdam adipisci sed doloremque porro iste.','2020-02-16 19:43:59'),(127,'https://i.picsum.photos/id/367/200/300.jpg?hmac=9v6fvZlygxFPleXOePw645QmRd9ytp91VGVQaolJKIk',17,'Iure sed quis eaque illum sunt. Eos deserunt suscipit est ratione et labore. Ut numquam fugiat neque voluptas. Placeat est eveniet deleniti est esse. Sunt distinctio consequatur eligendi dolorem consequatur aut.','2019-10-25 09:06:08'),(128,'https://i.picsum.photos/id/836/200/300.jpg?hmac=L-CzyTvvlLpEhWX6BR0OXWYiR9jb-tmvnCvH5PfdDtE',27,'Consequatur repellendus quae saepe possimus dicta est ipsum. Est enim ducimus similique odit nihil ut dicta ab. Eveniet vel in aliquam occaecati incidunt aut et tenetur. Impedit rerum omnis laborum nisi voluptas tempore repudiandae.','2020-05-28 19:55:29'),(129,'https://i.picsum.photos/id/410/200/300.jpg?hmac=c8g8PTUISEdRZEqZGLtB3eOCOq7t5A5rJY1vU8dp_Ds',28,'Debitis impedit reiciendis aut exercitationem. Voluptatibus dolore dolores quis vitae sapiente occaecati. Amet voluptas impedit qui ratione aut qui esse facere. Ea dolor quo dolor ad et. Dolores aut quidem facilis ea dolores at quam sed eaque.','2019-10-05 15:29:40'),(130,'https://i.picsum.photos/id/865/200/300.jpg?hmac=jCzg6busodS2mP_yK-Vt64bNfl6Sk3TUT0cSFMukwkU',22,'Facere hic est. Sed est eum minus. Doloribus et sit dolorum facere nihil architecto.','2019-10-03 04:58:57'),(131,'https://i.picsum.photos/id/970/200/300.jpg?hmac=8mPwdPFtAKcn0NQrEIClW3IlOWsKgskAikm_8YQj-qM',5,'Autem omnis velit assumenda aut. Mollitia sunt occaecati excepturi quia quis ducimus molestiae cupiditate aut. Necessitatibus ut asperiores delectus.','2020-03-11 01:35:21');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `campaign_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_name` (`tag_name`),
  KEY `campaign_id` (`campaign_id`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'love','2020-07-13 19:34:04',1),(2,'cute','2020-07-13 19:34:04',2),(3,'followme','2020-07-13 19:34:04',3),(4,'fun','2020-07-13 19:34:04',4),(5,'like','2020-07-13 19:34:04',5);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'http://lorempixel.com/640/480','juan@hotmail.com','3108881212','2020-07-06 21:08:05',1),(2,'https://s3.amazonaws.com/uifaces/faces/twitter/caspergrl/128.jpg','melissa@hotmail','1122224444','2020-07-06 21:08:05',2),(3,'https://s3.amazonaws.com/uifaces/faces/twitter/peejfancher/128.jpg','Brandy.Lubowitz11@gmail.com','1122350776','2020-07-06 22:20:57',3),(4,'https://s3.amazonaws.com/uifaces/faces/twitter/themrdave/128.jpg','Kennith.Jakubowski51@yahoo.com','6896703592','2020-07-06 22:20:57',4),(5,'https://s3.amazonaws.com/uifaces/faces/twitter/low_res/128.jpg','Geo.Schumm89@gmail.com','6329613584','2020-07-06 22:20:57',5),(6,'https://s3.amazonaws.com/uifaces/faces/twitter/santi_urso/128.jpg','Madisen_Feil20@gmail.com','8618476612','2020-07-06 22:20:57',6),(7,'https://s3.amazonaws.com/uifaces/faces/twitter/rmlewisuk/128.jpg','Selmer18@hotmail.com','1471633522','2020-07-06 22:20:57',7),(8,'https://s3.amazonaws.com/uifaces/faces/twitter/madshensel/128.jpg','Enoch_Swift@yahoo.com','8228695406','2020-07-06 22:20:57',8),(9,'https://s3.amazonaws.com/uifaces/faces/twitter/ostirbu/128.jpg','Raquel_Gutkowski58@yahoo.com','8320661943','2020-07-06 22:20:57',9),(10,'https://s3.amazonaws.com/uifaces/faces/twitter/drewbyreese/128.jpg','Melissa58@hotmail.com','6672762589','2020-07-06 22:20:57',10),(11,'https://s3.amazonaws.com/uifaces/faces/twitter/necodymiconer/128.jpg','Thaddeus_Gutmann30@yahoo.com','8664977694','2020-07-06 22:20:57',11),(12,'https://s3.amazonaws.com/uifaces/faces/twitter/sta1ex/128.jpg','Ewell.Parisian75@hotmail.com','4281854947','2020-07-06 22:20:57',12),(13,'https://s3.amazonaws.com/uifaces/faces/twitter/BroumiYoussef/128.jpg','Mara57@hotmail.com','2761349762','2020-07-06 22:20:57',13),(14,'https://s3.amazonaws.com/uifaces/faces/twitter/aka_james/128.jpg','Montana_Casper@hotmail.com','0766031479','2020-07-06 22:20:57',14),(15,'https://s3.amazonaws.com/uifaces/faces/twitter/foczzi/128.jpg','Missouri.Bins@gmail.com','9391705318','2020-07-06 22:20:57',15),(16,'https://s3.amazonaws.com/uifaces/faces/twitter/stayuber/128.jpg','Paolo56@gmail.com','2651551041','2020-07-06 22:20:57',16),(17,'https://s3.amazonaws.com/uifaces/faces/twitter/oskamaya/128.jpg','Maureen18@hotmail.com','5155775663','2020-07-06 22:20:57',17),(18,'https://s3.amazonaws.com/uifaces/faces/twitter/charliegann/128.jpg','Donavon_Mills7@gmail.com','6091535594','2020-07-06 22:20:57',18),(19,'https://s3.amazonaws.com/uifaces/faces/twitter/thatonetommy/128.jpg','Eric_Turner@gmail.com','8167289548','2020-07-06 22:20:57',19),(20,'https://s3.amazonaws.com/uifaces/faces/twitter/posterjob/128.jpg','Otho85@hotmail.com','8167289548','2020-07-06 22:20:57',20),(21,'https://s3.amazonaws.com/uifaces/faces/twitter/oscarowusu/128.jpg','Lauretta.Nienow39@gmail.com','3726439716','2020-07-06 22:20:57',21),(22,'https://s3.amazonaws.com/uifaces/faces/twitter/arthurholcombe1/128.jpg','Bradford_Yost16@gmail.com','5072083747','2020-07-06 22:20:57',22),(23,'https://s3.amazonaws.com/uifaces/faces/twitter/yalozhkin/128.jpg','Lacy_Frami@gmail.com','3140349885','2020-07-06 22:20:57',23),(24,'https://s3.amazonaws.com/uifaces/faces/twitter/digitalmaverick/128.jpg','Enola.Cruickshank15@yahoo.com','7431098594','2020-07-06 22:20:57',24),(25,'https://s3.amazonaws.com/uifaces/faces/twitter/nicoleglynn/128.jpg','Jarrett.Medhurst83@gmail.com','6229213963','2020-07-06 22:20:57',25),(26,'https://s3.amazonaws.com/uifaces/faces/twitter/_dwite_/128.jpg','Adolphus96@hotmail.com','4743921321','2020-07-06 22:20:57',26),(27,'https://s3.amazonaws.com/uifaces/faces/twitter/gu5taf/128.jpg','Anabelle.Cummerata@hotmail.com','9217839431','2020-07-06 22:20:57',27),(28,'https://s3.amazonaws.com/uifaces/faces/twitter/flashmurphy/128.jpg','Asia.Harber@gmail.com','4090188097','2020-07-06 22:20:57',28);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `set_child_friendly` tinyint(1) DEFAULT NULL,
  `disable_account` tinyint(1) DEFAULT NULL,
  `user_id` int NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_setting`
--

LOCK TABLES `user_setting` WRITE;
/*!40000 ALTER TABLE `user_setting` DISABLE KEYS */;
INSERT INTO `user_setting` VALUES (1,0,0,1,'$2a$08$Pq7IHY5x6OI9rBE3JXLjyOmXJNlLBIWHvfxHPownV9zDLS/YoINva'),(3,0,0,2,'$2a$08$D7x5ZO6RxPNXLP9DXnS4nOUUuMahBkVQhyrK3oUyak8O.P.3V3lwG'),(4,0,0,3,'$2a$08$w/z2EnghOTAWzNYGETwcvu5Uo0va2cEQUI8qPBaX1r.13jVno8hvC'),(5,0,0,4,'$2a$08$SPnk3k2du93usomPpuwQlenqeNYJH.IS.zJ19l8UlK7YFdjL4nH6u'),(6,0,0,5,'$2a$08$.weRUTsfOu.ASvW4rDj31ObSf0TEmEkarOSfRPTGXNi/s0bGfNk6G'),(7,0,0,6,'$2a$08$oq51klEz/TWytQwoh6gun.VT5YB2LIb5BtMXbJHbG46B1ZL8rPKyy'),(8,0,0,7,'$2a$08$Bc9pB6MWPr6goz7T0WsvUeQNZyjOIsOFhlfw1zfbpQJ8z3nQOjFCC'),(9,0,0,8,'$2a$08$VXw6ppsmRRP543hcxJav/eYP8sL4cKXWPzbUxgu2QkxjoxeGn2yzK'),(10,0,0,9,'$2a$08$S5ySKw8UJmXICekvX7E6n.Ic2GZVnNdFzoGbG4GYY5DeXAnZsrjna'),(11,0,0,10,'$2a$08$sr0c/533JIJU0k2SxpEJAuC.2aqR26aIMyvQLB4rWGcz6rrVBYn5m'),(12,0,0,11,'$2a$08$HzpwqqWUXzPS1ngkiAtjoec.7/A6Yos18HldKuqUjGT5.8pS7x/du'),(13,0,0,12,'$2a$08$/k9QT9Afy85RLt7CfX/JaeAvh8VHIjpQcB4Ejjk09w6jOe8u5/9oa'),(14,1,0,13,'$2a$08$tsdYcIZJeFwOLQQ8qo2CF.Xo7OFozzEyZOtwQG7CB1iUus.x7rs1C'),(15,0,0,14,'$2a$08$OrX/1v/vhzepOPmrGtUmo.3XleZGXgonVW9WAmECnnridgl/urAjK'),(16,0,0,15,'$2a$08$WierJd3ciHMSTE1SbD2zKuixCjO8xcXhkVAcb7uDGGU4EhxNYGYdW'),(17,0,0,16,'$2a$08$i3zzJUb89P3drtmgLv/GGu2OfAx4NI/xy4hRmubuYRKythD5sVA2G'),(18,1,0,17,'$2a$08$btMSw8kQ5T5eTrjYri1QQ.cUR9FPYiK17Fv3Kmy/VL8dcAtm2AkBu'),(19,0,0,18,'$2a$08$xfWdwzPO.IXhtTMPX9TH1ensIgRGXEWkSBBedd5r1MWc4Vl8w25Aa'),(20,0,0,19,'$2a$08$1UKv6bDTUPPhqVp128T2IOQEz7/C6xLRJZNxHUrdlA6FY7sU66cj.'),(21,0,0,20,'$2a$08$t0zoOpJPy6ny2Jznd7waje5YjaJXlIO4O/c6aewjkX0YHpHY7rpyC'),(22,1,0,21,'$2a$08$Oa.AR1dYxv0a.XvqjiBs.emA8XyxYkn3.JHZGReZt4yDsDJE5xA4S'),(23,0,0,22,'$2a$08$61d3XljBH2sl0RbC074XbuW2THmVsYrA0lxte3LF9OgaPRAQ.Q7q6'),(24,0,0,23,'$2a$08$ZbSVSYZ1V0XqZQs8Ggv6B.8oRcaEhdBP3jBl/fE5jMD9RL5cgp1IS'),(25,0,0,24,'$2a$08$wvtBFCjwqP9tzC85DKnKP.1mHpVv0UIIbAWXAHyg8vfGekgwXWxvm'),(26,0,0,25,'$2a$08$E8SNjqRSfBItRcxpItCcKem1m8qa2aH3SHcZ9wo2XrGVmG6Mz4l1y'),(27,0,0,26,'$2a$08$o1PqWTFPiu/DjMeABHcWyOtJIDoPquMsF0fH5LEzAa.chfad0y1ny'),(28,0,0,27,'$2a$08$HpjnoTB1FeIay5BkmYMxRuVm.v76SBGioWz3BA9WAj7Xc1LXhrAgu'),(29,0,0,28,'$2a$08$f8gsDS8YM/dQqh8irlzR6.GH1a4ou5cCozqOCAXHfSB9FD5PNJgyi');
/*!40000 ALTER TABLE `user_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'juan','2020-07-06 20:46:12'),(2,'melissa','2020-07-06 20:46:36'),(3,'Dan97','2019-12-23 08:00:00'),(4,'Garrett98','2019-12-11 12:01:57'),(5,'Ashton_Bergnaum','2020-04-26 01:53:12'),(6,'Addie.Bogisich29','2019-08-29 13:25:15'),(7,'Viviane.Goyette73','2020-04-04 23:35:09'),(8,'Alana.Windler62','2019-08-01 14:13:16'),(9,'Myrtle_Huel','2020-05-25 13:11:09'),(10,'Elenora69','2019-08-02 18:04:08'),(11,'Lonnie.Hagenes','2020-03-18 17:56:05'),(12,'Wilford_Lind54','2019-09-22 02:38:09'),(13,'Breana32','2020-04-28 14:53:48'),(14,'Gavin.Schumm17','2020-02-12 09:10:31'),(15,'Noemie66','2020-01-07 14:54:43'),(16,'Milton15','2020-05-05 17:04:27'),(17,'Einar.Hessel','2019-09-23 15:33:28'),(18,'Deanna_Medhurst','2020-01-01 00:37:31'),(19,'Jakayla26','2019-08-19 17:34:19'),(20,'Arianna96','2020-01-03 15:34:58'),(21,'Hector60','2019-07-10 09:12:54'),(22,'Rosalia36','2020-06-27 06:15:37'),(23,'Izaiah.Kirlin41','2020-03-09 02:49:00'),(24,'Clark.Thiel57','2020-03-06 03:52:02'),(25,'Curtis_Sauer56','2019-12-14 01:39:12'),(26,'Eloise87','2019-08-07 16:24:10'),(27,'Leatha_Adams','2019-09-09 13:22:51'),(28,'Jay_Haley','2020-05-31 16:24:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 16:47:30
