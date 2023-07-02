-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 16, 2023 at 06:47 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(6, 2, 1, 250, 1, '2023-04-13 18:06:53'),
(7, 2, 2, 300, 1, '2023-04-13 18:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Food', 'Sample Description', 1, '2023-04-05 10:17:41'),
(4, 'Accessories', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2023-04-05 16:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(3, 'Dibek', 'Todi', 'Male', '8876281237', 'kooldibek138a@gmail.com', '68819760393e0f9c0b071de4898ee785', 'Assam', '2023-04-13 22:35:35'),
(5, 'Harish', 'Todi', 'Male', '7002327622', 'htodi9854388497@gmail.com', '68819760393e0f9c0b071de4898ee785', 'Assam', '2023-04-13 22:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 'pcs', 250, 'M', '2023-04-05 13:01:30', '2023-04-13 22:40:53'),
(2, 1, 20, 'Sample', 300, 'L', '2023-04-05 13:07:00', '2023-04-13 22:41:06'),
(3, 4, 150, 'pcs', 500, 'M', '2023-04-05 16:50:37', '2023-04-13 22:41:23'),
(4, 3, 50, 'pack', 150, 'M', '2023-04-05 16:51:12', '2023-04-13 22:41:33'),
(5, 5, 30, 'pcs', 50, 'M', '2023-04-05 16:51:35', '2023-04-13 22:41:43'),
(6, 4, 10, 'pcs', 550, 'L', '2023-04-05 16:51:54', '2023-04-13 22:41:54'),
(7, 6, 100, 'pcs', 150, 'S', '2023-04-05 15:50:47', '2023-04-13 22:42:04'),
(8, 6, 150, 'pcs', 180, 'M', '2023-04-05 15:51:13', '2023-04-13 22:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(5, 3, 'Assam', 'cod', 150, 0, 0, '2023-04-13 22:37:48', NULL),
(6, 5, 'Assam', 'cod', 250, 0, 0, '2023-04-13 22:39:17', NULL),
(7, 1, '', 'cod', 450, 0, 0, '2023-04-14 13:26:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(6, 5, 6, 'S', 'pcs', 1, 150, 150),
(7, 6, 1, 'M', 'pcs', 1, 250, 250),
(8, 7, 1, 'L', 'Sample', 1, 300, 300),
(9, 7, 6, 'S', 'pcs', 1, 150, 150);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'Dog Food ', '&lt;p&gt;&lt;span id=&quot;post_task_attachments&quot; style=&quot;border: none; color: rgb(49, 132, 174); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; background-color: rgb(233, 247, 254); outline: transparent solid 0px;&quot;&gt;Introducing our premium dog food, packed with essential nutrients and natural ingredients to provide your furry friend with a healthy and balanced diet. Made with carefully selected, high-quality ingredients, our dog food is designed to provide optimal nutrition and promote overall wellness. Our dog food is made with a perfect blend of protein, carbohydrates, and fats to keep your dog energized throughout the day. Our dog food is easy to digest and supports healthy digestion, improving your dog\'s overall health. Give your furry friend the best possible nutrition with our delicious and nutritious dog food&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2023-04-05 11:19:31'),
(3, 1, 3, 'Cat Food ', '&lt;p&gt;&lt;span id=&quot;post_task_attachments&quot; style=&quot;font-weight: 700; border: none; color: rgb(49, 132, 174); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; background-color: rgb(233, 247, 254); outline: transparent solid 0px;&quot;&gt;I&lt;/span&gt;&lt;span style=&quot;border: none; color: rgb(49, 132, 174); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; background-color: rgb(233, 247, 254); outline: transparent solid 0px;&quot;&gt;ntroducing our premium quality Cat Food, specially formulated to provide your feline friend with all the necessary nutrients and energy they need to stay healthy and active. This pet food is made from only the best ingredients, carefully selected to ensure that your cat receives a balanced and complete diet. Our cat food is packed with natural and wholesome ingredients that will keep your cat feeling full and satisfied, while also providing them with essential vitamins and minerals. With our cat food, you can rest assured that your furry friend is getting the best possible nutrition.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2023-04-05 16:48:16'),
(4, 4, 4, 'Dog bed', '&lt;p ng-if=&quot;text.length &gt; 0&quot; ng-repeat=&quot;text in output.html track by $index&quot; class=&quot;ng-binding ng-scope&quot; style=&quot;color: rgb(53, 66, 84); font-family: Roboto, sans-serif; font-size: 15px; margin: 15px 0px;&quot;&gt;Introducing the best dog bed ever - the Dog Bed! Our soft, plush, and comfortable dog beds are made especially for your furry friends. With a variety of sizes, styles, fabrics, and colors to choose from, we have a perfect bed for your pup! And if you\'re looking for a water resistant dog bed, we\'ve got you covered there too!&lt;/p&gt;&lt;p ng-if=&quot;text.length &gt; 0&quot; ng-repeat=&quot;text in output.html track by $index&quot; class=&quot;ng-binding ng-scope&quot; style=&quot;color: rgb(53, 66, 84); font-family: Roboto, sans-serif; font-size: 15px; margin: 15px 0px;&quot;&gt;Product Features:&lt;/p&gt;&lt;p ng-if=&quot;text.length &gt; 0&quot; ng-repeat=&quot;text in output.html track by $index&quot; class=&quot;ng-binding ng-scope&quot; style=&quot;color: rgb(53, 66, 84); font-family: Roboto, sans-serif; font-size: 15px; margin: 15px 0px;&quot;&gt;- Varied size options to fit any pet.&lt;/p&gt;&lt;p ng-if=&quot;text.length &gt; 0&quot; ng-repeat=&quot;text in output.html track by $index&quot; class=&quot;ng-binding ng-scope&quot; style=&quot;color: rgb(53, 66, 84); font-family: Roboto, sans-serif; font-size: 15px; margin: 15px 0px;&quot;&gt;- Soft and comfortable fabric.&lt;/p&gt;&lt;p ng-if=&quot;text.length &gt; 0&quot; ng-repeat=&quot;text in output.html track by $index&quot; class=&quot;ng-binding ng-scope&quot; style=&quot;color: rgb(53, 66, 84); font-family: Roboto, sans-serif; font-size: 15px; margin: 15px 0px;&quot;&gt;- Water resistant design keeps your pup dry in rain or snow.&lt;/p&gt;', 1, '2023-04-05 16:49:07'),
(5, 4, 5, 'Cat  Plates ', '&lt;p&gt;The Cat Plates are the perfect solution for keeping your pet safe while you\'re away. The plates slide under the cat\'s front legs and use a tensioning system to keep the cat firmly in place. The padlock ensures that your cat can\'t escape.&lt;br&gt;&lt;/p&gt;', 1, '2023-04-05 16:50:11'),
(6, 4, 4, 'Dog Belt', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;color: rgb(53, 66, 84); font-family: Roboto, sans-serif; font-size: 15px;&quot;&gt;An all-new dog belt , the perfect accessory to keep your dog safe while you\'re out and about. The soft, comfortable and durable belt is adjustable to fit any size dog and comes with a sturdy nylon belt strap. Made from 100% recycled materials and made in the INDIA.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2023-04-05 15:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(5, 5, 150, '2023-04-13 22:37:48'),
(6, 6, 250, '2023-04-13 22:39:17'),
(7, 7, 450, '2023-04-14 13:26:58');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'xs'),
(2, 's'),
(3, 'm'),
(4, 'l'),
(5, 'xl'),
(6, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2023-04-05 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2023-04-05 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2023-04-05 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2023-04-05 16:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Pet Shop Food and Accessories Shop'),
(6, 'short_name', 'Paw Stop'),
(11, 'logo', 'uploads/1624240440_paw.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1681376100_pet-care-pet-food-toys-accessories-white-backgorund-top-view-pet-care-pet-food-toys-accessories-white-backgorund-top-139239766.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Dibek', 'Todi', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2023-04-05 14:02:37', '2023-04-13 22:36:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
