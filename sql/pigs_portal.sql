-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2022 at 10:29 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pigs_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `pigtype` varchar(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custlogin`
--

CREATE TABLE `custlogin` (
  `cust_id` int(20) NOT NULL,
  `cust_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `otp` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custlogin`
--

INSERT INTO `custlogin` (`cust_id`, `cust_name`, `password`, `email`, `address`, `city`, `pincode`, `state`, `phone_no`, `otp`) VALUES
(14, 'B9LYCI9H10q3/Q1dqwPzhXfihKs=', 'b0399d2029f64d445bd131ffaa399a42d2f8e7dc', 'johndoe123@hotmail.com', 'lnGXZRcLfNr2d3Yaje604Rxe5XFMikg=', 'QxNP4+Hp+WfrbB/cxeREgHkKfEdyZaI=', 'GKbqNt2tvrWFR9lg9KLfTpvPo3kcSUI=', 'cPAF3XlJhrkuvaURhe2YFfx21t4gbKo=', 'JAq/NOTtbMg0t1oIWhfLUbhQluABcHO3XegH4Xk=', 0);

-- --------------------------------------------------------

--
-- Table structure for table `farmerlogin`
--

CREATE TABLE `farmerlogin` (
  `farmer_id` int(11) NOT NULL,
  `farmer_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `F_gender` varchar(255) NOT NULL,
  `F_birthday` varchar(255) NOT NULL,
  `F_State` varchar(255) NOT NULL,
  `F_District` varchar(255) NOT NULL,
  `F_Location` varchar(255) NOT NULL,
  `F_AadharNo` varchar(255) NOT NULL,
  `F_AadharNo_file` varchar(255) NOT NULL,
  `F_Photo_Id_file` varchar(255) NOT NULL,
  `otp` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmerlogin`
--

INSERT INTO `farmerlogin` (`farmer_id`, `farmer_name`, `password`, `email`, `phone_no`, `F_gender`, `F_birthday`, `F_State`, `F_District`, `F_Location`, `F_AadharNo`, `F_AadharNo_file`, `F_Photo_Id_file`, `otp`) VALUES
(45, 'XHZ6jVRtMK1EfSbHiQvkJH8FYus=', 'b0399d2029f64d445bd131ffaa399a42d2f8e7dc', 'johndoe123@hotmail.com', 'h4X+KBZrFd3DztXQlb3JYnwGNweL7MthSofYCNg=', '', '', '', '', '', '8qSq+E6fWfJKaLHUbr9xHHW+sC67VpOyTM5Kydo5ew==', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `farmer_history`
--

CREATE TABLE `farmer_history` (
  `History_id` int(11) NOT NULL,
  `farmer_id` int(50) NOT NULL,
  `farmer_pig` varchar(255) NOT NULL,
  `farmer_quantity` int(50) NOT NULL,
  `farmer_price` int(50) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_pigs_trade`
--

CREATE TABLE `farmer_pigs_trade` (
  `trade_id` int(11) NOT NULL,
  `farmer_fkid` int(50) NOT NULL,
  `Trade_pig` varchar(255) NOT NULL,
  `pigs_quantity` double NOT NULL,
  `costperkg` int(11) NOT NULL,
  `msp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pigs`
--

CREATE TABLE `pigs` (
  `Pig_id` int(25) NOT NULL,
  `Pig_type` varchar(60) NOT NULL,
  `Pig_status` varchar(60) NOT NULL,
  `Pig_weight` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pigs`
--

INSERT INTO `pigs` (`Pig_id`, `Pig_type`, `Pig_status`, `Pig_weight`) VALUES
(1, 'male', 'available', '100 KGs');

-- --------------------------------------------------------

--
-- Table structure for table `production_approx`
--

CREATE TABLE `production_approx` (
  `pigs` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pigtype` (`pigtype`);

--
-- Indexes for table `custlogin`
--
ALTER TABLE `custlogin`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `farmerlogin`
--
ALTER TABLE `farmerlogin`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `farmer_history`
--
ALTER TABLE `farmer_history`
  ADD PRIMARY KEY (`History_id`);

--
-- Indexes for table `farmer_pigs_trade`
--
ALTER TABLE `farmer_pigs_trade`
  ADD PRIMARY KEY (`trade_id`),
  ADD KEY `farmer_fkid` (`farmer_fkid`);

--
-- Indexes for table `pigs`
--
ALTER TABLE `pigs`
  ADD PRIMARY KEY (`Pig_id`);

--
-- Indexes for table `production_approx`
--
ALTER TABLE `production_approx`
  ADD PRIMARY KEY (`pigs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custlogin`
--
ALTER TABLE `custlogin`
  MODIFY `cust_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `farmerlogin`
--
ALTER TABLE `farmerlogin`
  MODIFY `farmer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `farmer_history`
--
ALTER TABLE `farmer_history`
  MODIFY `History_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `farmer_pigs_trade`
--
ALTER TABLE `farmer_pigs_trade`
  MODIFY `trade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `farmer_pigs_trade`
--
ALTER TABLE `farmer_pigs_trade`
  ADD CONSTRAINT `farmer_pigs_trade_ibfk_1` FOREIGN KEY (`farmer_fkid`) REFERENCES `farmerlogin` (`farmer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
