-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2016 at 11:54 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_assignment`
--
CREATE DATABASE IF NOT EXISTS `db_assignment` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_assignment`;

-- --------------------------------------------------------

--
-- Table structure for table `customer_tab`
--

CREATE TABLE IF NOT EXISTS `customer_tab` (
  `customer_id` int(40) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_e-mail` varchar(50) NOT NULL,
  `customer_phonenumber` varchar(50) NOT NULL,
  `customer_type` varchar(50) NOT NULL,
  `customer_company` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_tab`
--

INSERT INTO `customer_tab` (`customer_id`, `customer_name`, `customer_e-mail`, `customer_phonenumber`, `customer_type`, `customer_company`) VALUES
(101, 'John Herring', 'PrivateIndividual@gmail.com', '+19293652546', 'Private', 'Individual'),
(102, 'Robinson Cars', 'robinson_cars@gmail.com', '+19293652522', 'Private', 'Company'),
(103, 'Walton Job Center', 'walton_job_center@gmail.com', '+19293652544', 'Public', 'Organisation');

-- --------------------------------------------------------

--
-- Table structure for table `cus_order`
--

CREATE TABLE IF NOT EXISTS `cus_order` (
  `order_id` int(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(40) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `cus_order`
--

INSERT INTO `cus_order` (`order_id`, `customer_id`) VALUES
(33, 101),
(11, 102),
(76, 103);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_id` int(20) NOT NULL,
  `product_id` varchar(40) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`) VALUES
(33, 'A1'),
(33, 'A2'),
(76, 'B1'),
(11, 'B2');

-- --------------------------------------------------------

--
-- Table structure for table `order_service`
--

CREATE TABLE IF NOT EXISTS `order_service` (
  `service_sl` int(40) NOT NULL,
  `order_id` int(20) NOT NULL,
  `service_id` int(40) NOT NULL,
  PRIMARY KEY (`service_sl`),
  KEY `order_id` (`order_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_service`
--

INSERT INTO `order_service` (`service_sl`, `order_id`, `service_id`) VALUES
(3121, 11, 401),
(3434, 33, 402),
(3439, 33, 403),
(3878, 76, 401),
(4343, 33, 401),
(6766, 11, 401);

-- --------------------------------------------------------

--
-- Table structure for table `order_staff`
--

CREATE TABLE IF NOT EXISTS `order_staff` (
  `order_id` int(20) NOT NULL,
  `staff_id` int(40) NOT NULL,
  PRIMARY KEY (`order_id`,`staff_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_staff`
--

INSERT INTO `order_staff` (`order_id`, `staff_id`) VALUES
(33, 104),
(76, 104),
(11, 105),
(33, 105),
(11, 106),
(11, 107),
(33, 107),
(76, 107);

-- --------------------------------------------------------

--
-- Table structure for table `product_tab`
--

CREATE TABLE IF NOT EXISTS `product_tab` (
  `product_id` varchar(40) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_type` varchar(50) NOT NULL,
  `component` varchar(200) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tab`
--

INSERT INTO `product_tab` (`product_id`, `product_name`, `product_type`, `component`) VALUES
('A1', 'Small Green House', 'Green House', '20 vertical glass \r\npanels, 2 side \r\nframes, 2 front \r\nframes, 2 roof \r\nsections, 1 door \r\nframe. '),
('A2', 'Large Green House', 'Green House', '40 vertical glass \r\npanels, 4 side \r\nframes, 2 front \r\nframes, 4 roof \r\nsections, 1 door \r\nframe'),
('B1', 'Small Shed', 'Shed', '35 Standard Timber \r\nplanks. 60 \r\nBrackets, 1 door \r\nsection'),
('B2', 'Large Shed', 'Shed', '60 Standard Timber \r\nplanks. 120 \r\nBrackets. 1 door \r\nsection');

-- --------------------------------------------------------

--
-- Table structure for table `service_tab`
--

CREATE TABLE IF NOT EXISTS `service_tab` (
  `service_id` int(40) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_tab`
--

INSERT INTO `service_tab` (`service_id`, `service_name`) VALUES
(401, 'Delivery'),
(402, 'Shed Construction'),
(403, 'Green House Construction');

-- --------------------------------------------------------

--
-- Table structure for table `staff_tab`
--

CREATE TABLE IF NOT EXISTS `staff_tab` (
  `staff_id` int(40) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_phonenumber` varchar(50) NOT NULL,
  `staff_e-mail` varchar(50) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_tab`
--

INSERT INTO `staff_tab` (`staff_id`, `staff_name`, `staff_phonenumber`, `staff_e-mail`) VALUES
(104, 'Ben Robert', '+19293652588', 'benjohnson@gmail.com'),
(105, 'Gary Crowley', '+19293652500', 'grary_crowley@gmail.com'),
(106, 'Anita Magneson', '+19293652501', 'anita_magneson@gmail.com'),
(107, 'Abel Mawuge', '+19293652502', 'abel_mawuge@gmail.com'),
(108, 'Satpal Singh', '+19293652503', 'satpal_singh@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cus_order`
--
ALTER TABLE `cus_order`
  ADD CONSTRAINT `cus_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_tab` (`customer_id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cus_order` (`order_id`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_tab` (`product_id`);

--
-- Constraints for table `order_service`
--
ALTER TABLE `order_service`
  ADD CONSTRAINT `order_service_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cus_order` (`order_id`),
  ADD CONSTRAINT `order_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service_tab` (`service_id`);

--
-- Constraints for table `order_staff`
--
ALTER TABLE `order_staff`
  ADD CONSTRAINT `order_staff_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cus_order` (`order_id`),
  ADD CONSTRAINT `order_staff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff_tab` (`staff_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
