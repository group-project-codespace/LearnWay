-- --------------------------------------------------------
-- Host:                         103.107.199.188
-- Server version:               10.3.39-MariaDB-0ubuntu0.20.04.2 - Ubuntu 20.04
-- Server OS:                    debian-linux-gnu
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


-- Dumping database structure for lms_for_finalProjet
CREATE DATABASE IF NOT EXISTS `lms_for_finalProjet` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `lms_for_finalProjet`;

-- Dumping structure for table lms_for_finalProjet.address
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.address: ~2 rows (approximately)
INSERT INTO `address` (`address_id`, `line1`, `line2`, `city_id`) VALUES
	(3, 'samagi ', '15', 26),
	(4, 'd13', 'samadhi', 14);

-- Dumping structure for table lms_for_finalProjet.attendence
CREATE TABLE IF NOT EXISTS `attendence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_slot_id` int(11) NOT NULL,
  `student_nic` varchar(12) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_attendence_time_slot1_idx` (`time_slot_id`),
  KEY `fk_attendence_student1_idx` (`student_nic`),
  CONSTRAINT `fk_attendence_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`),
  CONSTRAINT `fk_attendence_time_slot1` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.attendence: ~3 rows (approximately)
INSERT INTO `attendence` (`id`, `time_slot_id`, `student_nic`, `status`) VALUES
	(1, 3, '200265849535', 0),
	(2, 1, '200265849535', 0),
	(3, 1, '200520506584', 0);

-- Dumping structure for table lms_for_finalProjet.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_district_idx` (`district_id`),
  CONSTRAINT `fk_city_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.city: ~127 rows (approximately)
INSERT INTO `city` (`id`, `district_id`, `name`) VALUES
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

-- Dumping structure for table lms_for_finalProjet.class
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `fee` double NOT NULL,
  `user_nic` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subject_has_instructor_subject1_idx` (`subject_id`),
  KEY `fk_class_grade1_idx` (`grade_id`),
  KEY `fk_class_user1_idx` (`user_nic`),
  CONSTRAINT `fk_class_grade1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_class_user1` FOREIGN KEY (`user_nic`) REFERENCES `user` (`nic`),
  CONSTRAINT `fk_subject_has_instructor_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.class: ~4 rows (approximately)
INSERT INTO `class` (`id`, `subject_id`, `grade_id`, `fee`, `user_nic`) VALUES
	(1, 2, 1, 3000, '200509030982'),
	(2, 1, 1, 3000, '200364259167'),
	(3, 2, 2, 4000, '200509435432'),
	(4, 1, 2, 4000, '200364259167');

-- Dumping structure for table lms_for_finalProjet.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_province1_idx` (`province_id`),
  CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.district: ~25 rows (approximately)
INSERT INTO `district` (`id`, `province_id`, `name`) VALUES
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

-- Dumping structure for table lms_for_finalProjet.exam_marks
CREATE TABLE IF NOT EXISTS `exam_marks` (
  `exam_mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_mark` varchar(10) NOT NULL,
  `exam_schedule_id` int(11) NOT NULL,
  `student_has_class_id` int(11) NOT NULL,
  PRIMARY KEY (`exam_mark_id`),
  KEY `fk_exam_marks_exam_schedule1_idx` (`exam_schedule_id`),
  KEY `fk_exam_marks_student_has_class1_idx` (`student_has_class_id`),
  CONSTRAINT `fk_exam_marks_exam_schedule1` FOREIGN KEY (`exam_schedule_id`) REFERENCES `exam_schedule` (`id`),
  CONSTRAINT `fk_exam_marks_student_has_class1` FOREIGN KEY (`student_has_class_id`) REFERENCES `student_has_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.exam_marks: ~1 rows (approximately)
INSERT INTO `exam_marks` (`exam_mark_id`, `exam_mark`, `exam_schedule_id`, `student_has_class_id`) VALUES
	(1, '75', 1, 1);

-- Dumping structure for table lms_for_finalProjet.exam_schedule
CREATE TABLE IF NOT EXISTS `exam_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_exam_class1_idx` (`class_id`),
  CONSTRAINT `fk_exam_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.exam_schedule: ~2 rows (approximately)
INSERT INTO `exam_schedule` (`id`, `class_id`, `start`, `end`, `status`) VALUES
	(1, 4, '2024-05-18 16:00:00', '2024-05-18 18:00:00', 1),
	(2, 1, '2024-05-18 12:00:00', '2024-05-18 15:00:00', 1);

-- Dumping structure for table lms_for_finalProjet.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.gender: ~2 rows (approximately)
INSERT INTO `gender` (`id`, `name`) VALUES
	(1, 'Male'),
	(2, 'Female');

-- Dumping structure for table lms_for_finalProjet.grade
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.grade: ~2 rows (approximately)
INSERT INTO `grade` (`id`, `name`) VALUES
	(1, '12'),
	(2, '13');

-- Dumping structure for table lms_for_finalProjet.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_nic` varchar(12) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_payment_method1_idx` (`payment_method_id`),
  KEY `fk_invoice_student1_idx` (`student_nic`),
  CONSTRAINT `fk_invoice_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `fk_invoice_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.invoice: ~3 rows (approximately)
INSERT INTO `invoice` (`id`, `student_nic`, `payment_method_id`, `date`) VALUES
	(1, '200520506584', 1, '2024-05-18 12:34:01'),
	(2, '200265849535', 1, '2024-05-17 04:34:22'),
	(3, '200520506584', 1, '2024-05-19 00:50:30');

-- Dumping structure for table lms_for_finalProjet.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  KEY `fk_invoice_item_month1_idx` (`month_id`),
  KEY `fk_invoice_item_class1_idx` (`class_id`),
  CONSTRAINT `fk_invoice_item_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_item_month1` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.invoice_item: ~4 rows (approximately)
INSERT INTO `invoice_item` (`id`, `invoice_id`, `class_id`, `month_id`, `value`) VALUES
	(1, 1, 1, 1, 3000),
	(2, 1, 1, 1, 3000),
	(3, 2, 4, 1, 5000),
	(4, 3, 4, 1, 4000);

-- Dumping structure for table lms_for_finalProjet.month
CREATE TABLE IF NOT EXISTS `month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.month: ~8 rows (approximately)
INSERT INTO `month` (`id`, `name`) VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'April'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'August');

-- Dumping structure for table lms_for_finalProjet.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.payment_method: ~2 rows (approximately)
INSERT INTO `payment_method` (`id`, `name`) VALUES
	(1, 'Cash'),
	(2, 'Card');

-- Dumping structure for table lms_for_finalProjet.payment_status
CREATE TABLE IF NOT EXISTS `payment_status` (
  `pay_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`pay_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.payment_status: ~0 rows (approximately)

-- Dumping structure for table lms_for_finalProjet.province
CREATE TABLE IF NOT EXISTS `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.province: ~9 rows (approximately)
INSERT INTO `province` (`id`, `name`) VALUES
	(3, 'Central Province'),
	(4, 'Eastern Province'),
	(5, 'North Central Province'),
	(6, 'Northern Province'),
	(7, 'North Western Province'),
	(8, 'Sabaragamuwa Province'),
	(9, 'Southern Province'),
	(10, 'Uva Province'),
	(11, 'Western Province');

-- Dumping structure for table lms_for_finalProjet.salaly_enrollment
CREATE TABLE IF NOT EXISTS `salaly_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `initial_salary` double NOT NULL,
  `is_evaluate` tinyint(4) NOT NULL,
  `is_depend_promotion` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_salary_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_salary_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.salaly_enrollment: ~0 rows (approximately)

-- Dumping structure for table lms_for_finalProjet.salary_details
CREATE TABLE IF NOT EXISTS `salary_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_nic` varchar(12) NOT NULL,
  `date` datetime DEFAULT NULL,
  `salary_id` int(11) NOT NULL,
  `pay_status_id` int(11) NOT NULL,
  `salary_increment` double NOT NULL,
  `salary_deduction` double NOT NULL,
  `salary_increment_idsalary_increment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_salary_details_user1_idx` (`user_nic`),
  KEY `fk_salary_details_salary1_idx` (`salary_id`),
  KEY `fk_salary_details_payment_status1_idx` (`pay_status_id`),
  KEY `fk_salary_details_salary_increment1_idx` (`salary_increment_idsalary_increment_id`),
  CONSTRAINT `fk_salary_details_payment_status1` FOREIGN KEY (`pay_status_id`) REFERENCES `payment_status` (`pay_status_id`),
  CONSTRAINT `fk_salary_details_salary1` FOREIGN KEY (`salary_id`) REFERENCES `salaly_enrollment` (`id`),
  CONSTRAINT `fk_salary_details_salary_increment1` FOREIGN KEY (`salary_increment_idsalary_increment_id`) REFERENCES `salary_increment` (`idsalary_increment_id`),
  CONSTRAINT `fk_salary_details_user1` FOREIGN KEY (`user_nic`) REFERENCES `user` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.salary_details: ~0 rows (approximately)

-- Dumping structure for table lms_for_finalProjet.salary_increment
CREATE TABLE IF NOT EXISTS `salary_increment` (
  `idsalary_increment_id` int(11) NOT NULL,
  `salary_increment_by` double NOT NULL,
  PRIMARY KEY (`idsalary_increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.salary_increment: ~0 rows (approximately)

-- Dumping structure for table lms_for_finalProjet.student
CREATE TABLE IF NOT EXISTS `student` (
  `nic` varchar(12) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`nic`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_student_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.student: ~2 rows (approximately)
INSERT INTO `student` (`nic`, `fname`, `lname`, `mobile`, `status`, `gender_id`) VALUES
	('200265849535', 'Jude', 'Fernando', '0755684157', 1, 2),
	('200520506584', 'Kiri ', 'Santha', '0722065984', 1, 1);

-- Dumping structure for table lms_for_finalProjet.student_has_address
CREATE TABLE IF NOT EXISTS `student_has_address` (
  `student_nic` varchar(12) NOT NULL,
  `address_address_id` int(11) NOT NULL,
  PRIMARY KEY (`student_nic`,`address_address_id`),
  KEY `fk_student_has_address_address1_idx` (`address_address_id`),
  KEY `fk_student_has_address_student1_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_address_address1` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_student_has_address_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.student_has_address: ~0 rows (approximately)

-- Dumping structure for table lms_for_finalProjet.student_has_class
CREATE TABLE IF NOT EXISTS `student_has_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_nic` varchar(12) NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_student_has_class_student1_idx` (`student_nic`),
  KEY `fk_student_has_class_class1_idx` (`class_id`),
  CONSTRAINT `fk_student_has_class_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_student_has_class_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.student_has_class: ~3 rows (approximately)
INSERT INTO `student_has_class` (`id`, `student_nic`, `class_id`, `status`) VALUES
	(1, '200520506584', 2, 1),
	(2, '200265849535', 4, 1),
	(3, '200265849535', 4, 1);

-- Dumping structure for table lms_for_finalProjet.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.subject: ~2 rows (approximately)
INSERT INTO `subject` (`id`, `name`, `status`) VALUES
	(1, 'Combined Maths', 1),
	(2, 'Physics', 2);

-- Dumping structure for table lms_for_finalProjet.time_slot
CREATE TABLE IF NOT EXISTS `time_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_time_slot_class1_idx` (`class_id`),
  CONSTRAINT `fk_time_slot_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.time_slot: ~4 rows (approximately)
INSERT INTO `time_slot` (`id`, `class_id`, `start_time`, `end_time`, `status`) VALUES
	(1, 2, '2024-05-18 15:00:00', '2024-05-18 17:00:00', 1),
	(2, 4, '2024-05-17 15:00:00', '2024-05-17 18:00:00', 1),
	(3, 1, '2024-05-18 12:00:00', '2024-05-18 14:00:00', 1),
	(4, 3, '2024-05-17 08:00:00', '2024-05-17 11:00:00', 1);

-- Dumping structure for table lms_for_finalProjet.user
CREATE TABLE IF NOT EXISTS `user` (
  `nic` varchar(12) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `user_status_id` int(11) NOT NULL DEFAULT 1,
  `user_level_user_level_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`nic`),
  KEY `fk_user_gender1_idx` (`gender_id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  KEY `fk_user_user_status1_idx` (`user_status_id`),
  KEY `fk_user_user_level1_idx` (`user_level_user_level_id`),
  CONSTRAINT `fk_user_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_user_user_level1` FOREIGN KEY (`user_level_user_level_id`) REFERENCES `user_level` (`user_level_id`),
  CONSTRAINT `fk_user_user_status1` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`),
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.user: ~6 rows (approximately)
INSERT INTO `user` (`nic`, `password`, `fname`, `lname`, `mobile`, `email`, `gender_id`, `user_type_id`, `user_status_id`, `user_level_user_level_id`) VALUES
	('200034618279', '4321', 'Ahamad', 'Tuan', '011 64529181', 'admin@user.com', 1, 2, 1, 1),
	('200364259167', 'abc123', 'Chuti', 'miss', '0789865412', 'miss@user.com', 2, 4, 1, 1),
	('2004540943', 'Abcd!234', 'Thimira', 'Adhithya', '9543879778', 'owne@user.com', 1, 1, 1, 1),
	('200459093234', 'KJL', 'Kavin ', 'Deshan', '0758324342', 'Kavin@yahoo.com', 1, 3, 1, 1),
	('200509030982', 'AKjkj', 'Ravindu', 'Thomas', '0743543234', 'ravindu@gmail.com', 1, 4, 1, 1),
	('200509435432', 'OLJK', 'Hiruni', 'Kavushalya', '0728239423', 'Hiruni@gmail.com', 2, 4, 1, 1);

-- Dumping structure for table lms_for_finalProjet.user_has_address
CREATE TABLE IF NOT EXISTS `user_has_address` (
  `user_nic` varchar(12) NOT NULL,
  `address_address_id` int(11) NOT NULL,
  PRIMARY KEY (`user_nic`,`address_address_id`),
  KEY `fk_user_has_address_address1_idx` (`address_address_id`),
  KEY `fk_user_has_address_user1_idx` (`user_nic`),
  CONSTRAINT `fk_user_has_address_address1` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_user_has_address_user1` FOREIGN KEY (`user_nic`) REFERENCES `user` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.user_has_address: ~0 rows (approximately)

-- Dumping structure for table lms_for_finalProjet.user_level
CREATE TABLE IF NOT EXISTS `user_level` (
  `user_level_id` int(11) NOT NULL,
  `user_level_value` int(11) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.user_level: ~5 rows (approximately)
INSERT INTO `user_level` (`user_level_id`, `user_level_value`) VALUES
	(1, 5),
	(2, 7),
	(3, 8),
	(4, 9),
	(5, 10);

-- Dumping structure for table lms_for_finalProjet.user_status
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staus` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.user_status: ~2 rows (approximately)
INSERT INTO `user_status` (`id`, `staus`) VALUES
	(1, 'Active'),
	(2, 'Deactive');

-- Dumping structure for table lms_for_finalProjet.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table lms_for_finalProjet.user_type: ~4 rows (approximately)
INSERT INTO `user_type` (`id`, `type`) VALUES
	(1, 'Owner'),
	(2, 'Admin'),
	(3, 'Academic Staff'),
	(4, 'Instructor');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
