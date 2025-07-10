-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: projecttask
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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `comment_text` text,
  `commented_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,2,10,'Updated UI mockups uploaded.','2025-07-09 19:15:27'),(3,3,5,'API tested and deployed.','2025-07-09 19:15:27'),(4,4,3,'Payment flow has a bug in step 3.','2025-07-09 19:15:27'),(5,5,6,'Filter options added for price.','2025-07-09 19:15:27'),(6,6,13,'README complete.','2025-07-09 19:15:27'),(7,7,11,'Optimized the slow query.','2025-07-09 19:15:27'),(8,8,12,'CI/CD working via GitHub Actions.','2025-07-09 19:15:27'),(9,9,14,'Reset password design shared.','2025-07-09 19:15:27'),(10,10,5,'Refactored auth files.','2025-07-09 19:15:27'),(11,11,6,'Coverage up to 85%.','2025-07-09 19:15:27'),(12,12,7,'Monthly traffic graph completed.','2025-07-09 19:15:27'),(13,13,14,'Found some vulnerabilities.','2025-07-09 19:15:27'),(14,14,10,'Contact page is live.','2025-07-09 19:15:27'),(15,15,15,'Survey draft prepared.','2025-07-09 19:15:27'),(16,1,3,'Started working on this today.','2025-07-09 20:03:04');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestones` (
  `milestone_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `target_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`milestone_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `milestones_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
INSERT INTO `milestones` VALUES (1,1,'UI Revamp','Complete all homepage UI tasks','2025-01-25','Ongoing'),(2,2,'First App Release','v1.0 release to App Store','2025-03-01','Not Started'),(3,3,'API Ready','All critical endpoints working','2025-02-15','Ongoing'),(4,4,'Launch Campaign','Go live on social platforms','2025-05-01','Not Started'),(5,5,'CRM MVP','Deliver basic CRM functions','2025-04-01','Ongoing'),(6,6,'Live Inventory','Inventory view working','2025-03-10','Completed'),(7,7,'Analytics Dashboard','Main metrics displayed','2025-05-20','Not Started'),(8,8,'Employee Portal Access','Login & leave system done','2025-04-15','Ongoing'),(9,9,'First Sale','Transaction flow complete','2025-05-15','Not Started'),(10,10,'Initial Bug Cleanup','Fix top 10 reported bugs','2025-02-10','Ongoing'),(11,11,'Beta Feedback','Get 50 responses','2025-04-25','Not Started'),(12,12,'Onboarding Video','Create animated onboarding','2025-06-01','Not Started'),(13,13,'SEO Checklist','On-page and off-page SEO','2025-04-15','Ongoing'),(14,14,'Pen Test Report','Third-party audit done','2025-03-15','Ongoing'),(15,15,'Content Hub Live','First content version pushed','2025-03-01','Not Started');
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) DEFAULT NULL,
  `description` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `project_status` varchar(50) DEFAULT 'Not Started',
  PRIMARY KEY (`project_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Website Redesign','Revamping company website','2025-01-01','2025-03-01',1,'Not Started'),(2,'Mobile App','iOS/Android App development','2025-02-01','2025-06-30',4,'Not Started'),(3,'Backend API','Create APIs for mobile app','2025-01-15','2025-04-15',8,'Not Started'),(4,'Marketing Campaign','Social media campaign','2025-03-01','2025-05-30',9,'Not Started'),(5,'CRM System','Build internal CRM tool','2025-02-10','2025-05-10',1,'Not Started'),(6,'Inventory Tracker','Manage inventory','2025-01-05','2025-04-05',4,'Not Started'),(7,'Data Analytics','Build reporting dashboard','2025-03-20','2025-06-20',8,'Not Started'),(8,'HR Portal','HR employee portal','2025-02-15','2025-05-15',1,'Not Started'),(9,'E-commerce Platform','Online shopping portal','2025-03-01','2025-07-01',9,'Not Started'),(10,'Bug Fixes','Ongoing bug resolution','2025-01-10','2025-12-31',1,'Not Started'),(11,'Feedback System','Collect customer feedback','2025-04-01','2025-06-01',1,'Not Started'),(12,'Onboarding Flow','New user onboarding UI','2025-05-01','2025-07-01',4,'Not Started'),(13,'SEO Optimization','Improve search ranking','2025-03-01','2025-06-01',9,'Not Started'),(14,'Security Audit','Penetration testing','2025-02-01','2025-04-01',1,'Not Started'),(15,'Content Hub','Centralized content system','2025-01-15','2025-04-15',8,'Not Started'),(16,'Website Redesign','Revamping company website','2025-01-01','2025-03-01',1,'Not Started'),(17,'Mobile App','iOS/Android App development','2025-02-01','2025-06-30',4,'Not Started'),(18,'Backend API','Create APIs for mobile app','2025-01-15','2025-04-15',8,'Not Started'),(19,'Marketing Campaign','Social media campaign','2025-03-01','2025-05-30',9,'Not Started'),(20,'CRM System','Build internal CRM tool','2025-02-10','2025-05-10',1,'Not Started'),(21,'Inventory Tracker','Manage inventory','2025-01-05','2025-04-05',4,'Not Started'),(22,'Data Analytics','Build reporting dashboard','2025-03-20','2025-06-20',8,'Not Started'),(23,'HR Portal','HR employee portal','2025-02-15','2025-05-15',1,'Not Started'),(24,'E-commerce Platform','Online shopping portal','2025-03-01','2025-07-01',9,'Not Started'),(25,'Bug Fixes','Ongoing bug resolution','2025-01-10','2025-12-31',1,'Not Started'),(26,'Feedback System','Collect customer feedback','2025-04-01','2025-06-01',1,'Not Started'),(27,'Onboarding Flow','New user onboarding UI','2025-05-01','2025-07-01',4,'Not Started'),(28,'SEO Optimization','Improve search ranking','2025-03-01','2025-06-01',9,'Not Started'),(29,'Security Audit','Penetration testing','2025-02-01','2025-04-01',1,'Not Started'),(30,'Content Hub','Centralized content system','2025-01-15','2025-04-15',8,'Not Started');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskcategories`
--

DROP TABLE IF EXISTS `taskcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskcategories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskcategories`
--

LOCK TABLES `taskcategories` WRITE;
/*!40000 ALTER TABLE `taskcategories` DISABLE KEYS */;
INSERT INTO `taskcategories` VALUES (1,'Bug','Defect or issue in the system'),(2,'Feature','New functionality to add'),(3,'Improvement','Enhance an existing feature'),(4,'Documentation','Write or update docs'),(5,'Testing','Test coverage or QA'),(6,'Design','UI/UX improvements'),(7,'Database','DB design or queries'),(8,'API','Back-end endpoint tasks'),(9,'Security','Vulnerability patching'),(10,'Refactoring','Code cleanup'),(11,'DevOps','CI/CD and infrastructure'),(12,'Analytics','Reporting and BI'),(13,'Content','Content creation'),(14,'Research','Investigative or R&D tasks'),(15,'Maintenance','Routine upkeep');
/*!40000 ALTER TABLE `taskcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `taskoverview`
--

DROP TABLE IF EXISTS `taskoverview`;
/*!50001 DROP VIEW IF EXISTS `taskoverview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `taskoverview` AS SELECT 
 1 AS `task_id`,
 1 AS `task_title`,
 1 AS `status`,
 1 AS `priority`,
 1 AS `due_date`,
 1 AS `project_name`,
 1 AS `assigned_to`,
 1 AS `category_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `task_title` varchar(100) DEFAULT NULL,
  `description` text,
  `status` varchar(50) DEFAULT NULL,
  `priority` varchar(50) DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`),
  KEY `assigned_to` (`assigned_to`),
  KEY `project_id` (`project_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `taskcategories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Fix login bug','Users unable to log in on mobile','Completed','High',2,1,1,'2025-01-15','2025-07-09 19:14:22'),(2,'Design homepage UI','New design for homepage','In Progress','Medium',10,1,6,'2025-01-20','2025-07-09 19:14:22'),(3,'Create API endpoint','POST /user/register','Completed','High',5,3,8,'2025-02-05','2025-07-09 19:14:22'),(4,'Test payment flow','Ensure all payment paths work','In Progress','High',3,2,5,'2025-02-15','2025-07-09 19:14:22'),(5,'Add search filter','Filter products by price and category','In Progress','Medium',6,9,2,'2025-03-01','2025-07-09 19:14:22'),(6,'Write setup guide','README.md for new repo','Completed','Low',13,3,4,'2025-01-25','2025-07-09 19:14:22'),(7,'Optimize DB queries','Slow query in report module','In Progress','High',11,7,7,'2025-04-10','2025-07-09 19:14:22'),(8,'CI/CD pipeline','Auto deploy on push','Completed','Medium',12,6,11,'2025-01-30','2025-07-09 19:14:22'),(9,'Add forgot password','User can reset password','In Progress','High',14,8,2,'2025-02-10','2025-07-09 19:14:22'),(10,'Refactor auth code','Cleanup auth logic','Completed','Low',5,1,10,'2025-01-18','2025-07-09 19:14:22'),(11,'Write unit tests','Test coverage for task module','In Progress','Medium',6,1,5,'2025-02-01','2025-07-09 19:14:22'),(12,'Analyze traffic data','Web traffic monthly report','In Progress','Medium',7,7,12,'2025-04-15','2025-07-09 19:14:22'),(13,'Run security audit','Test SQL injection risk','In Progress','High',14,14,9,'2025-03-01','2025-07-09 19:14:22'),(14,'Update contact page','New location info','Completed','Low',10,1,2,'2025-01-22','2025-07-09 19:14:22'),(15,'Gather user feedback','Survey via email','In Progress','Medium',15,11,13,'2025-04-10','2025-07-09 19:14:22');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alice Johnson','alice@example.com','Manager','2025-07-09 19:04:29'),(2,'Bob Smith','bob@example.com','Developer','2025-07-09 19:04:29'),(3,'Charlie Ray','charlie@example.com','Tester','2025-07-09 19:04:29'),(4,'Diana Prince','diana@example.com','Manager','2025-07-09 19:04:29'),(5,'Ethan Hunt','ethan@example.com','Developer','2025-07-09 19:04:29'),(6,'Fiona Gallagher','fiona@example.com','Developer','2025-07-09 19:04:29'),(7,'George Mills','george@example.com','Tester','2025-07-09 19:04:29'),(8,'Hannah Brown','hannah@example.com','Manager','2025-07-09 19:04:29'),(9,'Ian Wright','ian@example.com','Developer','2025-07-09 19:04:29'),(10,'Jane Doe','jane@example.com','Designer','2025-07-09 19:04:29'),(11,'Kevin Hart','kevin@example.com','Developer','2025-07-09 19:04:29'),(12,'Lara Croft','lara@example.com','Tester','2025-07-09 19:04:29'),(13,'Mike Ross','mike@example.com','Developer','2025-07-09 19:04:29'),(14,'Nina Simone','nina@example.com','Manager','2025-07-09 19:04:29'),(15,'Oscar Wilde','oscar@example.com','Developer','2025-07-09 19:04:29'),(76,'Paul Walker','paul@example.com','Developer','2025-07-09 19:12:26'),(77,'Queenie Lee','queenie@example.com','Tester','2025-07-09 19:12:26'),(78,'Robert Langdon','robert@example.com','Manager','2025-07-09 19:12:26'),(79,'Sophia Loren','sophia@example.com','Designer','2025-07-09 19:12:26'),(80,'Tom Hardy','tom@example.com','Developer','2025-07-09 19:12:26'),(81,'Uma Thurman','uma@example.com','Tester','2025-07-09 19:12:26'),(82,'Victor Stone','victor@example.com','Manager','2025-07-09 19:12:26'),(83,'Wanda Maximoff','wanda@example.com','Developer','2025-07-09 19:12:26'),(84,'Xavier Woods','xavier@example.com','Developer','2025-07-09 19:12:26'),(85,'Yara Shahidi','yara@example.com','Designer','2025-07-09 19:12:26'),(86,'Zack Snyder','zack@example.com','Manager','2025-07-09 19:12:26'),(87,'Aaron Paul','aaron@example.com','Developer','2025-07-09 19:12:26'),(88,'Bella Swan','bella@example.com','Tester','2025-07-09 19:12:26'),(89,'Caleb Holt','caleb@example.com','Manager','2025-07-09 19:12:26'),(90,'Dana Scully','dana@example.com','Designer','2025-07-09 19:12:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `taskoverview`
--

/*!50001 DROP VIEW IF EXISTS `taskoverview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `taskoverview` AS select `t`.`task_id` AS `task_id`,`t`.`task_title` AS `task_title`,`t`.`status` AS `status`,`t`.`priority` AS `priority`,`t`.`due_date` AS `due_date`,`p`.`project_name` AS `project_name`,`u`.`name` AS `assigned_to`,`c`.`category_name` AS `category_name` from (((`tasks` `t` join `projects` `p` on((`t`.`project_id` = `p`.`project_id`))) join `users` `u` on((`t`.`assigned_to` = `u`.`user_id`))) join `taskcategories` `c` on((`t`.`category_id` = `c`.`category_id`))) */;
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

-- Dump completed on 2025-07-10 14:24:53
