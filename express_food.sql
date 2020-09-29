-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2020 at 10:46 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `house_number` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `customer_id`, `address_type`, `house_number`, `street`, `city`, `state`, `postal_code`) VALUES
(1, 1, 'House', 5, 'Lagos Street', 'Kaduna', 'Kaduna', '800'),
(2, 2, 'Shop', 10, 'Kano Road', 'Zaria', 'Kaduna', '800'),
(3, 3, 'House', 65, 'Kastina Road', 'Onitsha', 'Anambra', '500'),
(4, 3, 'House', 40, 'Ghana Street', 'Ikeja', 'Lagos', '700');

-- --------------------------------------------------------

--
-- Table structure for table `chefs`
--

CREATE TABLE `chefs` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chefs`
--

INSERT INTO `chefs` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'John', 'David', 'john@david.com'),
(2, 'Sam', 'David', 'sam@david.com'),
(3, 'Mary', 'James', 'mary@james.com'),
(4, 'Jane', 'Thomas', 'jane@thomas.com');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `phone`, `email`) VALUES
(1, 'Sunday', 'Nwoye', '08012345678', 'sunday@nwoye.com'),
(2, 'Micheal', 'Samuel', '08033333333', 'micheal@samuel.com'),
(3, 'Jane', 'David', '08066668899', 'jane@david.com'),
(4, 'John', 'Sam', '07088877654', 'john@sam.com');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_biker`
--

CREATE TABLE `delivery_biker` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `biker_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_biker`
--

INSERT INTO `delivery_biker` (`id`, `first_name`, `last_name`, `email`, `biker_status`) VALUES
(1, 'Sam', 'Mark', 'sam@mark.com', 'Delivering'),
(2, 'David', 'John', 'david@john.com', 'Busy'),
(3, 'Mike', 'Peter', 'mike@peter.com', 'inactive'),
(4, 'Mark', 'James', 'mark@james.com', 'Idle');

-- --------------------------------------------------------

--
-- Table structure for table `food_item`
--

CREATE TABLE `food_item` (
  `id` int(11) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `chef_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_item`
--

INSERT INTO `food_item` (`id`, `item_type`, `name`, `chef_id`) VALUES
(1, 'Dishes', 'Rice', 1),
(2, 'Desserts', 'Cheesecake', 3),
(3, 'Dishes', 'Burger', 4),
(4, 'Desserts', 'Crumble', 2);

-- --------------------------------------------------------

--
-- Table structure for table `food_item_menu`
--

CREATE TABLE `food_item_menu` (
  `id` int(11) NOT NULL,
  `food_item_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_item_menu`
--

INSERT INTO `food_item_menu` (`id`, `food_item_id`, `menu_id`, `price`) VALUES
(1, 1, 1, '5.00'),
(2, 2, 2, '3.00'),
(3, 3, 3, '5.00'),
(4, 4, 4, '3.00'),
(5, 1, 3, '5.00'),
(6, 3, 2, '3.00'),
(7, 2, 4, '8.00'),
(8, 4, 3, '6.00');

-- --------------------------------------------------------

--
-- Table structure for table `food_item_orders`
--

CREATE TABLE `food_item_orders` (
  `id` int(11) NOT NULL,
  `food_item_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `sales_price` decimal(10,2) DEFAULT NULL,
  `total_item_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_item_orders`
--

INSERT INTO `food_item_orders` (`id`, `food_item_id`, `order_id`, `quantity`, `sales_price`, `total_item_amount`) VALUES
(1, 1, 1, 2, '5.00', '10.00'),
(2, 2, 2, 4, '3.00', '12.00'),
(3, 3, 3, 1, '7.00', '7.00'),
(4, 4, 4, 5, '5.00', '25.00'),
(5, 1, 3, 1, '10.00', '10.00'),
(6, 4, 1, 2, '4.00', '8.00'),
(7, 2, 4, 2, '4.00', '8.00'),
(8, 3, 2, 3, '5.00', '15.00');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu_date`) VALUES
(1, '2020-05-13'),
(2, '2020-03-08'),
(3, '2020-02-11'),
(4, '2020-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `delivery_biker_id` int(11) DEFAULT NULL,
  `placed_at` datetime NOT NULL,
  `delivered_at` datetime NOT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `delivery_biker_id`, `placed_at`, `delivered_at`, `order_status`, `total_amount`, `address_id`) VALUES
(1, 1, 2, '2020-08-15 04:05:00', '2020-08-15 04:25:00', 'preparing', '18.00', 2),
(2, 2, 3, '2020-08-15 02:00:00', '2020-08-15 02:15:00', 'placed', '27.00', 1),
(3, 3, 2, '2020-09-23 05:00:00', '2020-09-23 05:10:00', 'placed', '17.00', 3),
(4, 3, 1, '2020-09-08 12:10:04', '2020-09-08 12:30:00', 'preparing', '33.00', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `chefs`
--
ALTER TABLE `chefs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_biker`
--
ALTER TABLE `delivery_biker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_item`
--
ALTER TABLE `food_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chef_id` (`chef_id`);

--
-- Indexes for table `food_item_menu`
--
ALTER TABLE `food_item_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_item_id` (`food_item_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `food_item_orders`
--
ALTER TABLE `food_item_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_item_id` (`food_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `delivery_biker_id` (`delivery_biker_id`),
  ADD KEY `address_id` (`address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chefs`
--
ALTER TABLE `chefs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_biker`
--
ALTER TABLE `delivery_biker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `food_item`
--
ALTER TABLE `food_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `food_item_menu`
--
ALTER TABLE `food_item_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `food_item_orders`
--
ALTER TABLE `food_item_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `food_item`
--
ALTER TABLE `food_item`
  ADD CONSTRAINT `food_item_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chefs` (`id`);

--
-- Constraints for table `food_item_menu`
--
ALTER TABLE `food_item_menu`
  ADD CONSTRAINT `food_item_menu_ibfk_1` FOREIGN KEY (`food_item_id`) REFERENCES `food_item` (`id`),
  ADD CONSTRAINT `food_item_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Constraints for table `food_item_orders`
--
ALTER TABLE `food_item_orders`
  ADD CONSTRAINT `food_item_orders_ibfk_1` FOREIGN KEY (`food_item_id`) REFERENCES `food_item` (`id`),
  ADD CONSTRAINT `food_item_orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`delivery_biker_id`) REFERENCES `delivery_biker` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
