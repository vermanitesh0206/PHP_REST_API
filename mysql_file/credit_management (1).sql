-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2019 at 11:49 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `credit_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `Tid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_user` varchar(30) NOT NULL,
  `to_user` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`Tid`, `from_user`, `to_user`, `amount`) VALUES
('2019-05-20 13:56:30', 'vermanitesh0206@gmail.com', 'aks9034sharma@gmail.com', 10),
('2019-05-20 13:57:10', 'vermanitesh0206@gmail.com', 'aks9034sharma@gmail.com', 10),
('2019-05-20 13:57:20', 'vermanitesh0206@gmail.com', 'aks9034sharma@gmail.com', 10),
('2019-05-20 15:14:45', 'namrathanaren6@gmail.com', 'vermanitesh0206@gmail.com', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `name`, `credit`) VALUES
('aks9034sharma@gmail.com', 'Amit', 120),
('namrathanaren6@gmail.com', 'Namratha', 90),
('vermanitesh0206@gmail.com', 'Nitesh', 90);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`Tid`),
  ADD KEY `fk1` (`from_user`),
  ADD KEY `fk2` (`to_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`from_user`) REFERENCES `user` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`to_user`) REFERENCES `user` (`email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
