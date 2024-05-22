-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for learnway
CREATE DATABASE IF NOT EXISTS `learnway` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `learnway`;

-- Dumping structure for table learnway.address
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.address: ~3 rows (approximately)
INSERT INTO `address` (`address_id`, `line1`, `line2`, `city_id`) VALUES
	(3, 'samagi ', '15', 26),
	(4, 'd13', 'samadhi', 14),
	(5, '196', 'dhambaduraya', 16);

-- Dumping structure for table learnway.attendence
CREATE TABLE IF NOT EXISTS `attendence` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_slot_id` int(11) NOT NULL,
  `student_nic` varchar(12) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`att_id`),
  KEY `fk_attendence_time_slot1_idx` (`time_slot_id`),
  KEY `fk_attendence_student1_idx` (`student_nic`),
  CONSTRAINT `fk_attendence_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`),
  CONSTRAINT `fk_attendence_time_slot1` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`ts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.attendence: ~3 rows (approximately)
INSERT INTO `attendence` (`att_id`, `time_slot_id`, `student_nic`, `status`) VALUES
	(1, 1, '200532100903', 0),
	(2, 2, '200533100902', 1),
	(3, 3, '200533100910', 0);

-- Dumping structure for table learnway.city
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `city_name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_district_idx` (`district_id`),
  CONSTRAINT `fk_city_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.city: ~127 rows (approximately)
INSERT INTO `city` (`city_id`, `district_id`, `city_name`) VALUES
	(1, 28, 'Colombo'),
	(2, 28, 'Dehiwala-Mount Lavinia'),
	(3, 28, 'Sri Jayawardenepura Kotte'),
	(4, 28, 'Moratuwa'),
	(5, 28, 'Negombo'),
	(6, 28, 'Peliyagoda'),
	(7, 28, 'Kelaniya'),
	(8, 29, 'Gampaha'),
	(9, 29, 'Negombo'),
	(10, 29, 'Kelaniya'),
	(11, 29, 'Ja-Ela'),
	(12, 29, 'Wattala'),
	(13, 29, 'Minuwangoda'),
	(14, 29, 'Attanagalla'),
	(15, 30, 'Kalutara'),
	(16, 30, 'Panadura'),
	(17, 30, 'Horana'),
	(18, 30, 'Beruwala'),
	(19, 30, 'Matugama'),
	(20, 30, 'Bandaragama'),
	(21, 30, 'Aluthgama'),
	(22, 1, 'Kandy'),
	(23, 1, 'Peradeniya'),
	(24, 1, 'Katugastota'),
	(25, 1, 'Gampola'),
	(26, 1, 'Akurana'),
	(27, 1, 'Digana'),
	(28, 1, 'Nawalapitiya'),
	(29, 2, 'Matale'),
	(30, 2, 'Dambulla'),
	(31, 2, 'Rattota'),
	(32, 2, 'Galewela'),
	(33, 2, 'Palapathwela'),
	(34, 2, 'Ukuwela'),
	(35, 8, 'Nuwara Eliya'),
	(36, 8, 'Hatton'),
	(37, 8, 'Talawakele'),
	(38, 8, 'Ginigathhena'),
	(39, 8, 'Ragala'),
	(40, 8, 'Lindula'),
	(41, 23, 'Galle'),
	(42, 23, 'Ambalangoda'),
	(43, 23, 'Hikkaduwa'),
	(44, 23, 'Karapitiya'),
	(45, 23, 'Elpitiya'),
	(46, 23, 'Baddegama'),
	(47, 25, 'Matara'),
	(48, 25, 'Weligama'),
	(49, 25, 'Kamburugamuwa'),
	(50, 25, 'Hakmana'),
	(51, 25, 'Akuressa'),
	(52, 25, 'Devinuwara'),
	(53, 24, 'Hambantota'),
	(54, 24, 'Ambalantota'),
	(55, 24, 'Tangalle'),
	(56, 24, 'Tissamaharama'),
	(57, 24, 'Walasmulla'),
	(58, 24, 'Weeraketiya'),
	(59, 14, 'Jaffna'),
	(60, 14, 'Point Pedro'),
	(61, 14, 'Chavakachcheri'),
	(62, 14, 'Nallur'),
	(63, 14, 'Kilinochchi'),
	(64, 16, 'Mannar'),
	(65, 16, 'Talaimannar'),
	(66, 16, 'Erukkulampiddi'),
	(67, 18, 'Vavuniya'),
	(68, 18, 'Vavuniya South'),
	(69, 18, 'Omanthai'),
	(70, 17, 'Mullaitivu'),
	(71, 17, 'Puthukkudiyiruppu'),
	(72, 17, 'Oddusuddan'),
	(73, 15, 'Kilinochchi'),
	(74, 15, 'Paranthan'),
	(75, 15, 'Pooneryn'),
	(76, 10, 'Batticaloa'),
	(77, 10, 'Kattankudy'),
	(78, 10, 'Valaichchenai'),
	(79, 10, 'Eravur'),
	(80, 10, 'Chenkalady'),
	(81, 9, 'Ampara'),
	(82, 9, 'Akkaraipattu'),
	(83, 9, 'Kalmunai'),
	(84, 9, 'Sammanthurai'),
	(85, 9, 'Pottuvil'),
	(86, 11, 'Trincomalee'),
	(87, 11, 'Kinniya'),
	(88, 11, 'Gomarankadawala'),
	(89, 11, 'Nilaveli'),
	(90, 19, 'Kurunegala'),
	(91, 19, 'Kuliyapitiya'),
	(92, 19, 'Nikaweratiya'),
	(93, 19, 'Polgahawela'),
	(94, 19, 'Chilaw'),
	(95, 20, 'Puttalam'),
	(96, 20, 'Anamaduwa'),
	(97, 20, 'Chilaw'),
	(98, 20, 'Wennappuwa'),
	(99, 12, 'Anuradhapura'),
	(100, 12, 'Medawachchiya'),
	(101, 12, 'Talawa'),
	(102, 12, 'Kekirawa'),
	(103, 12, 'Kebithigollewa'),
	(104, 13, 'Polonnaruwa'),
	(105, 13, 'Kaduruwela'),
	(106, 13, 'Hingurakgoda'),
	(107, 13, 'Dimbulagala'),
	(108, 26, 'Badulla'),
	(109, 26, 'Bandarawela'),
	(110, 26, 'Haputale'),
	(111, 26, 'Diyatalawa'),
	(112, 26, 'Ella'),
	(113, 27, 'Monaragala'),
	(114, 27, 'Wellawaya'),
	(115, 27, 'Bibile'),
	(116, 27, 'Buttala'),
	(117, 27, 'Kataragama'),
	(118, 22, 'Ratnapura'),
	(119, 22, 'Embilipitiya'),
	(120, 22, 'Balangoda'),
	(121, 22, 'Kuruwita'),
	(122, 22, 'Eheliyagoda'),
	(123, 21, 'Kegalle'),
	(124, 21, 'Mawanella'),
	(125, 21, 'Deraniyagala'),
	(126, 21, 'Ruwanwella'),
	(127, 21, 'Dehiowita');

-- Dumping structure for table learnway.class
CREATE TABLE IF NOT EXISTS `class` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `sub_id` int(11) NOT NULL,
  `yid` int(11) NOT NULL,
  `fee` double NOT NULL,
  `user_nic` varchar(12) NOT NULL,
  `status_st_id` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `fk_subject_has_instructor_subject1_idx` (`sub_id`),
  KEY `fk_class_grade1_idx` (`yid`),
  KEY `fk_class_user1_idx` (`user_nic`),
  KEY `fk_class_status1_idx` (`status_st_id`),
  CONSTRAINT `fk_class_grade1` FOREIGN KEY (`yid`) REFERENCES `year` (`yid`),
  CONSTRAINT `fk_class_status1` FOREIGN KEY (`status_st_id`) REFERENCES `status` (`st_id`),
  CONSTRAINT `fk_class_user1` FOREIGN KEY (`user_nic`) REFERENCES `user` (`nic`),
  CONSTRAINT `fk_subject_has_instructor_subject1` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.class: ~3 rows (approximately)
INSERT INTO `class` (`cid`, `sub_id`, `yid`, `fee`, `user_nic`, `status_st_id`) VALUES
	(1, 1, 1, 100, '200533100902', 1),
	(2, 3, 2, 200, '200533100902', 1),
	(3, 1, 2, 400, '200509502295', 1);

-- Dumping structure for table learnway.district
CREATE TABLE IF NOT EXISTS `district` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `d_name` varchar(45) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `fk_district_province1_idx` (`province_id`),
  CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.district: ~25 rows (approximately)
INSERT INTO `district` (`did`, `province_id`, `d_name`) VALUES
	(1, 3, 'Kandy'),
	(2, 3, 'Matale'),
	(8, 3, 'Nuwara Eliya'),
	(9, 4, 'Ampara'),
	(10, 4, 'Batticaloa'),
	(11, 4, 'Trincomalee'),
	(12, 5, 'Anuradhapura'),
	(13, 5, 'Polonnaruwa'),
	(14, 6, 'Jaffna'),
	(15, 6, 'Kilinochchi'),
	(16, 6, 'Mannar'),
	(17, 6, 'Mullaitivu'),
	(18, 6, 'Vavuniya'),
	(19, 7, 'Kurunegala'),
	(20, 7, 'Puttalam'),
	(21, 8, 'Kegalle'),
	(22, 8, 'Ratnapura'),
	(23, 9, 'Galle'),
	(24, 9, 'Hambantota'),
	(25, 9, 'Matara'),
	(26, 10, 'Badulla'),
	(27, 10, 'Monaragala'),
	(28, 11, 'Colombo'),
	(29, 11, 'Gampaha'),
	(30, 11, 'Kalutara');

-- Dumping structure for table learnway.exam_marks
CREATE TABLE IF NOT EXISTS `exam_marks` (
  `ex_mk_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_mark` varchar(10) NOT NULL,
  `student_has_class_id` int(11) NOT NULL,
  `ex_sh_id` varchar(10) NOT NULL,
  PRIMARY KEY (`ex_mk_id`),
  KEY `fk_exam_marks_student_has_class1_idx` (`student_has_class_id`),
  KEY `fk_exam_marks_exam_schedule1_idx` (`ex_sh_id`),
  CONSTRAINT `fk_exam_marks_exam_schedule1` FOREIGN KEY (`ex_sh_id`) REFERENCES `exam_schedule` (`ex_sh_id`),
  CONSTRAINT `fk_exam_marks_student_has_class1` FOREIGN KEY (`student_has_class_id`) REFERENCES `student_has_class` (`student_has_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.exam_marks: ~3 rows (approximately)
INSERT INTO `exam_marks` (`ex_mk_id`, `exam_mark`, `student_has_class_id`, `ex_sh_id`) VALUES
	(1, '80', 2, '1'),
	(2, '100', 1, '2'),
	(3, '500', 3, '3');

-- Dumping structure for table learnway.exam_schedule
CREATE TABLE IF NOT EXISTS `exam_schedule` (
  `ex_sh_id` varchar(10) NOT NULL,
  `class_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ex_sh_id`),
  KEY `fk_exam_class1_idx` (`class_id`),
  CONSTRAINT `fk_exam_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.exam_schedule: ~3 rows (approximately)
INSERT INTO `exam_schedule` (`ex_sh_id`, `class_id`, `start`, `end`, `status`) VALUES
	('1', 3, '2024-05-22 16:47:27', '2024-05-22 16:47:28', 1),
	('2', 1, '2024-05-22 16:47:36', '2024-05-22 16:47:36', 1),
	('3', 2, '2024-05-22 16:47:42', '2024-05-22 16:47:43', 1);

-- Dumping structure for table learnway.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(10) NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.gender: ~2 rows (approximately)
INSERT INTO `gender` (`g_id`, `g_name`) VALUES
	(1, 'male'),
	(2, 'female');

-- Dumping structure for table learnway.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_nic` varchar(12) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_invoice_payment_method1_idx` (`payment_method_id`),
  KEY `fk_invoice_student1_idx` (`student_nic`),
  CONSTRAINT `fk_invoice_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`pay_method_id`),
  CONSTRAINT `fk_invoice_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.invoice: ~4 rows (approximately)
INSERT INTO `invoice` (`invoice_id`, `student_nic`, `payment_method_id`, `date`) VALUES
	(1, '200532100903', 2, '2024-05-22 16:52:55'),
	(2, '200533100902', 1, '2024-05-22 16:53:03'),
	(3, '200533100910', 2, '2024-05-22 16:53:11'),
	(4, '200532100903', 2, '2024-05-22 16:53:23');

-- Dumping structure for table learnway.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `in_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`in_item_id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  KEY `fk_invoice_item_month1_idx` (`mid`),
  KEY `fk_invoice_item_class1_idx` (`cid`),
  CONSTRAINT `fk_invoice_item_class1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  CONSTRAINT `fk_invoice_item_month1` FOREIGN KEY (`mid`) REFERENCES `month` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.invoice_item: ~3 rows (approximately)
INSERT INTO `invoice_item` (`in_item_id`, `invoice_id`, `cid`, `mid`, `value`) VALUES
	(1, 1, 3, 4, 1),
	(2, 4, 3, 8, 2),
	(3, 2, 1, 1, 3);

-- Dumping structure for table learnway.language_medium
CREATE TABLE IF NOT EXISTS `language_medium` (
  `medium_id` int(11) NOT NULL,
  `medium_title` varchar(10) NOT NULL,
  PRIMARY KEY (`medium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.language_medium: ~3 rows (approximately)
INSERT INTO `language_medium` (`medium_id`, `medium_title`) VALUES
	(1, 'english'),
	(2, 'sinhala'),
	(3, 'Tamil');

-- Dumping structure for table learnway.month
CREATE TABLE IF NOT EXISTS `month` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(45) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.month: ~8 rows (approximately)
INSERT INTO `month` (`mid`, `m_name`) VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'April'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'August');

-- Dumping structure for table learnway.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `pay_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_method_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pay_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.payment_method: ~2 rows (approximately)
INSERT INTO `payment_method` (`pay_method_id`, `pay_method_name`) VALUES
	(1, 'Cash'),
	(2, 'Card');

-- Dumping structure for table learnway.payment_status
CREATE TABLE IF NOT EXISTS `payment_status` (
  `pay_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_status_name` varchar(10) NOT NULL,
  PRIMARY KEY (`pay_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.payment_status: ~2 rows (approximately)
INSERT INTO `payment_status` (`pay_status_id`, `pay_status_name`) VALUES
	(1, 'paid'),
	(2, 'unpaid');

-- Dumping structure for table learnway.province
CREATE TABLE IF NOT EXISTS `province` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(45) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.province: ~9 rows (approximately)
INSERT INTO `province` (`pid`, `p_name`) VALUES
	(3, 'Central Province'),
	(4, 'Eastern Province'),
	(5, 'North Central Province'),
	(6, 'Northern Province'),
	(7, 'North Western Province'),
	(8, 'Sabaragamuwa Province'),
	(9, 'Southern Province'),
	(10, 'Uva Province'),
	(11, 'Western Province');

-- Dumping structure for table learnway.salaly_enrollment
CREATE TABLE IF NOT EXISTS `salaly_enrollment` (
  `se_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `initial_salary` double NOT NULL,
  `is_evaluate` tinyint(4) NOT NULL,
  `is_depend_promotion` tinyint(4) NOT NULL,
  PRIMARY KEY (`se_id`),
  KEY `fk_salary_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_salary_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.salaly_enrollment: ~3 rows (approximately)
INSERT INTO `salaly_enrollment` (`se_id`, `user_type_id`, `initial_salary`, `is_evaluate`, `is_depend_promotion`) VALUES
	(1, 4, 100, 0, 0),
	(2, 2, 200, 0, 0),
	(3, 3, 5000, 2, 2);

-- Dumping structure for table learnway.salary_details
CREATE TABLE IF NOT EXISTS `salary_details` (
  `sd_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `pay_status_id` int(11) NOT NULL,
  `salary_deduction` double NOT NULL,
  `user_salary_id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`sd_id`),
  KEY `fk_salary_details_payment_status1_idx` (`pay_status_id`),
  KEY `fk_salary_details_user_salary1_idx` (`user_salary_id`),
  KEY `fk_salary_details_month1_idx` (`mid`),
  CONSTRAINT `fk_salary_details_month1` FOREIGN KEY (`mid`) REFERENCES `month` (`mid`),
  CONSTRAINT `fk_salary_details_payment_status1` FOREIGN KEY (`pay_status_id`) REFERENCES `payment_status` (`pay_status_id`),
  CONSTRAINT `fk_salary_details_user_salary1` FOREIGN KEY (`user_salary_id`) REFERENCES `user_salary` (`user_salary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.salary_details: ~2 rows (approximately)
INSERT INTO `salary_details` (`sd_id`, `date`, `pay_status_id`, `salary_deduction`, `user_salary_id`, `mid`) VALUES
	(1, '2024-05-22 16:55:15', 1, 0, 1, 4),
	(2, '2024-05-22 16:55:30', 2, 0, 1, 1);

-- Dumping structure for table learnway.salary_increment
CREATE TABLE IF NOT EXISTS `salary_increment` (
  `si_id` int(11) NOT NULL AUTO_INCREMENT,
  `si_by` double NOT NULL,
  PRIMARY KEY (`si_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.salary_increment: ~3 rows (approximately)
INSERT INTO `salary_increment` (`si_id`, `si_by`) VALUES
	(1, 100),
	(2, 1000),
	(3, 10000);

-- Dumping structure for table learnway.schedule_status
CREATE TABLE IF NOT EXISTS `schedule_status` (
  `schedule_id` int(11) NOT NULL,
  `schedule_status` varchar(10) NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.schedule_status: ~2 rows (approximately)
INSERT INTO `schedule_status` (`schedule_id`, `schedule_status`) VALUES
	(1, 'cancel'),
	(2, 'continue');

-- Dumping structure for table learnway.status
CREATE TABLE IF NOT EXISTS `status` (
  `st_id` int(11) NOT NULL,
  `status_name` varchar(10) NOT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.status: ~2 rows (approximately)
INSERT INTO `status` (`st_id`, `status_name`) VALUES
	(1, 'Active'),
	(2, 'Deactivate');

-- Dumping structure for table learnway.student
CREATE TABLE IF NOT EXISTS `student` (
  `nic` varchar(12) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  `status_st_id` int(11) NOT NULL,
  PRIMARY KEY (`nic`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  KEY `fk_student_status1_idx` (`status_st_id`),
  CONSTRAINT `fk_student_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`g_id`),
  CONSTRAINT `fk_student_status1` FOREIGN KEY (`status_st_id`) REFERENCES `status` (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.student: ~3 rows (approximately)
INSERT INTO `student` (`nic`, `fname`, `lname`, `mobile`, `gender_id`, `reg_date`, `status_st_id`) VALUES
	('200532100903', 'ishara', 'deshan', '0772906308', 1, '2024-05-22 16:24:48', 1),
	('200533100902', 'tehan', 'matthew', '0772906307', 1, '2024-05-22 16:24:00', 1),
	('200533100910', 'tevin', 'peter', '0775100634', 1, '2024-05-22 16:25:42', 1);

-- Dumping structure for table learnway.student_class_log
CREATE TABLE IF NOT EXISTS `student_class_log` (
  `student_class_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_has_class_id` int(11) NOT NULL,
  `activity_log_description` varchar(45) NOT NULL,
  PRIMARY KEY (`student_class_log_id`),
  KEY `fk_student_class_log_student_has_class1_idx` (`student_has_class_id`),
  CONSTRAINT `fk_student_class_log_student_has_class1` FOREIGN KEY (`student_has_class_id`) REFERENCES `student_has_class` (`student_has_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.student_class_log: ~3 rows (approximately)
INSERT INTO `student_class_log` (`student_class_log_id`, `student_has_class_id`, `activity_log_description`) VALUES
	(1, 2, 'good'),
	(2, 1, 'good'),
	(3, 3, 'not good');

-- Dumping structure for table learnway.student_has_address
CREATE TABLE IF NOT EXISTS `student_has_address` (
  `student_nic` varchar(12) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`student_nic`,`address_id`),
  KEY `fk_student_has_address_address1_idx` (`address_id`),
  KEY `fk_student_has_address_student1_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_address_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_student_has_address_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.student_has_address: ~2 rows (approximately)
INSERT INTO `student_has_address` (`student_nic`, `address_id`) VALUES
	('200532100903', 3),
	('200533100902', 4);

-- Dumping structure for table learnway.student_has_class
CREATE TABLE IF NOT EXISTS `student_has_class` (
  `student_has_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_nic` varchar(12) NOT NULL,
  `class_id` int(11) NOT NULL,
  `enroll_date` datetime NOT NULL,
  `status_st_id` int(11) NOT NULL,
  PRIMARY KEY (`student_has_class_id`),
  KEY `fk_student_has_class_student1_idx` (`student_nic`),
  KEY `fk_student_has_class_class1_idx` (`class_id`),
  KEY `fk_student_has_class_status1_idx` (`status_st_id`),
  CONSTRAINT `fk_student_has_class_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`cid`),
  CONSTRAINT `fk_student_has_class_status1` FOREIGN KEY (`status_st_id`) REFERENCES `status` (`st_id`),
  CONSTRAINT `fk_student_has_class_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.student_has_class: ~3 rows (approximately)
INSERT INTO `student_has_class` (`student_has_class_id`, `student_nic`, `class_id`, `enroll_date`, `status_st_id`) VALUES
	(1, '200533100902', 1, '2024-05-22 16:43:53', 1),
	(2, '200532100903', 2, '2024-05-22 16:44:34', 1),
	(3, '200533100910', 3, '2024-05-22 16:44:49', 1);

-- Dumping structure for table learnway.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(45) NOT NULL,
  `sub_st_id` int(11) NOT NULL,
  `medium_id` int(11) NOT NULL,
  `sub_reg_date` datetime NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `fk_subject_subject_status1_idx` (`sub_st_id`),
  KEY `fk_subject_language_medium1_idx` (`medium_id`),
  CONSTRAINT `fk_subject_language_medium1` FOREIGN KEY (`medium_id`) REFERENCES `language_medium` (`medium_id`),
  CONSTRAINT `fk_subject_subject_status1` FOREIGN KEY (`sub_st_id`) REFERENCES `status` (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.subject: ~3 rows (approximately)
INSERT INTO `subject` (`sub_id`, `sub_name`, `sub_st_id`, `medium_id`, `sub_reg_date`) VALUES
	(1, 'econ', 1, 2, '2024-05-22 16:38:57'),
	(2, 'science', 1, 2, '2024-05-22 16:39:17'),
	(3, 'commerce', 1, 2, '2024-05-22 16:39:45');

-- Dumping structure for table learnway.time_slot
CREATE TABLE IF NOT EXISTS `time_slot` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`ts_id`),
  KEY `fk_time_slot_class1_idx` (`class_id`),
  KEY `fk_time_slot_schedule_status1_idx` (`schedule_id`),
  CONSTRAINT `fk_time_slot_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`cid`),
  CONSTRAINT `fk_time_slot_schedule_status1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_status` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.time_slot: ~3 rows (approximately)
INSERT INTO `time_slot` (`ts_id`, `class_id`, `start_time`, `end_time`, `schedule_id`) VALUES
	(1, 1, '2024-05-22 16:42:59', '2024-05-22 16:43:00', 2),
	(2, 3, '2024-05-22 16:43:10', '2024-05-22 16:43:11', 1),
	(3, 2, '2024-05-22 16:43:21', '2024-05-22 16:43:21', 2);

-- Dumping structure for table learnway.user
CREATE TABLE IF NOT EXISTS `user` (
  `nic` varchar(12) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  `status_st_id` int(11) NOT NULL,
  PRIMARY KEY (`nic`),
  KEY `fk_user_gender1_idx` (`gender_id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  KEY `fk_user_status1_idx` (`status_st_id`),
  CONSTRAINT `fk_user_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`g_id`),
  CONSTRAINT `fk_user_status1` FOREIGN KEY (`status_st_id`) REFERENCES `status` (`st_id`),
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.user: ~2 rows (approximately)
INSERT INTO `user` (`nic`, `password`, `fname`, `lname`, `mobile`, `email`, `gender_id`, `user_type_id`, `reg_date`, `status_st_id`) VALUES
	('200509502295', 'Abcd!234', 'admin', 'admin', '0758233405', 'admin@admin.com', 1, 2, '2024-05-21 18:43:25', 1),
	('200533100902', '1234', 'admin', 'new', '0772906307', 'admin@gmail.com', 1, 1, '2024-05-22 16:36:16', 1);

-- Dumping structure for table learnway.user_has_address
CREATE TABLE IF NOT EXISTS `user_has_address` (
  `user_nic` varchar(12) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`user_nic`,`address_id`),
  KEY `fk_user_has_address_address1_idx` (`address_id`),
  KEY `fk_user_has_address_user1_idx` (`user_nic`),
  CONSTRAINT `fk_user_has_address_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_user_has_address_user1` FOREIGN KEY (`user_nic`) REFERENCES `user` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.user_has_address: ~2 rows (approximately)
INSERT INTO `user_has_address` (`user_nic`, `address_id`) VALUES
	('200509502295', 3),
	('200533100902', 5);

-- Dumping structure for table learnway.user_salary
CREATE TABLE IF NOT EXISTS `user_salary` (
  `user_salary_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_nic` varchar(12) NOT NULL,
  `se_id` int(11) NOT NULL,
  `si_id` int(11) NOT NULL,
  PRIMARY KEY (`user_salary_id`),
  KEY `fk_salary_increment_user1_idx` (`user_nic`),
  KEY `fk_user_salary_salaly_enrollment1_idx` (`se_id`),
  KEY `fk_user_salary_salary_increment1_idx` (`si_id`),
  CONSTRAINT `fk_salary_increment_user1` FOREIGN KEY (`user_nic`) REFERENCES `user` (`nic`),
  CONSTRAINT `fk_user_salary_salaly_enrollment1` FOREIGN KEY (`se_id`) REFERENCES `salaly_enrollment` (`se_id`),
  CONSTRAINT `fk_user_salary_salary_increment1` FOREIGN KEY (`si_id`) REFERENCES `salary_increment` (`si_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.user_salary: ~3 rows (approximately)
INSERT INTO `user_salary` (`user_salary_id`, `user_nic`, `se_id`, `si_id`) VALUES
	(1, '200509502295', 1, 1),
	(2, '200533100902', 2, 2),
	(3, '200509502295', 3, 3);

-- Dumping structure for table learnway.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.user_type: ~4 rows (approximately)
INSERT INTO `user_type` (`user_type_id`, `user_type_name`) VALUES
	(1, 'Owner'),
	(2, 'admin'),
	(3, 'Academic Officer'),
	(4, 'Instructor');

-- Dumping structure for table learnway.year
CREATE TABLE IF NOT EXISTS `year` (
  `yid` int(11) NOT NULL AUTO_INCREMENT,
  `year_number` varchar(8) NOT NULL,
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table learnway.year: ~5 rows (approximately)
INSERT INTO `year` (`yid`, `year_number`) VALUES
	(1, '2020'),
	(2, '2021'),
	(3, '2022'),
	(4, '2023'),
	(5, '2024');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
