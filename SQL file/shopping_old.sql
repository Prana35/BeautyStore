-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 01:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2024-01-24 09:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Foundation', 'Foundation', '2024-01-01 12:17:37', '09-01-2024 12:22:24 AM'),
(4, 'Parfume', 'Parfume', '2024-01-01 12:19:32', ''),
(5, 'Blush On', 'Blush On', '2024-01-01 12:19:54', ''),
(6, 'Eye Shadow', 'Eye Shadow', '2024-02-01 12:18:52', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2024-01-07 12:32:57', 'COD', NULL),
(3, 1, '4', 1, '2024-01-09 12:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2024-01-08 09:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2024-01-05 12:21:38', 'COD', NULL),
(6, 1, '4', 1, '2024-01-08 12:21:38', 'COD', NULL),
(9, 7, '1', 1, '2024-01-09 15:50:50', 'COD', NULL),
(10, 1, '1', 1, '2023-12-31 19:01:45', 'Internet Banking', NULL),
(11, 0, '1', 1, '2024-01-09 21:14:02', 'Internet Banking', NULL),
(12, 0, '3', 1, '2024-01-09 21:14:02', 'Internet Banking', NULL),
(13, 1, '1', 1, '2024-01-10 06:18:45', 'Internet Banking', NULL),
(14, 1, '3', 2, '2024-01-10 06:18:45', 'Internet Banking', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2024-01-09 12:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2024-01-09 12:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2024-01-09 12:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2024-01-09 12:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 13:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 13:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 13:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 3, 1, 'Foundation MakeOver', 'MakeOver', 139900, 150000, '<ul><li> </li></ul>', 'makeover.jpg', 22000, 'In Stock', '2024-01-30 09:54:35', ''),
(2, 3, 2, 'Foundation Wardah', 'Wardah', 15000, 20000, '<ul><li> </li></ul>', 'wardah.webp', 22000, 'In Stock', '2024-01-30 09:54:35', ''),
(3, 4, 4, 'MFK Baccarat', 'MFK', 379000, 420000, '<ul><li> </li></ul>', 'baccarat.jpg', 22000, 'In Stock', '2024-01-30 09:54:35', ''),
(4, 4, 5, 'Byredo Mumbai Noise', 'Byredo', 159000, 200000, '<ul><li> </li></ul>', 'byredo.jpg', 22000, 'In Stock', '2024-01-30 09:54:35', ''),
(5, 5, 7, 'Bioaqua', 'Bioaqua', 15500, 20000, '<ul><li> </li></ul>', 'bioaqua.jpg', 22000, 'In Stock', '2024-01-30 09:54:35', ''),
(6, 5, 8, 'Maybeline Master Flush', 'Maybeline', 28900, 32000, '<ul><li> </li></ul>', 'maybelline.jpg', 22000, 'In Stock', '2024-01-30 09:54:35', ''),
(7, 6, 2, 'Eyeshadow Wardah', 'Wardah', 37400, 40000, '<ul><li> </li></ul>', 'wardahsed.jpg', 22000, 'In Stock', '2024-01-30 09:54:35', ''),
(8, 6, 10, 'Focallure', 'Focallure', 172000, 180000, '<ul><li> </li></ul>', 'focallure.jpg', 22000, 'In Stock', '2024-01-30 09:54:35', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 3, 'MakeOver', '2024-01-01 09:24:52', '09-01-2024 11:03:40 PM'),
(2, 3, 'Wardah', '2024-01-01 09:29:09', ''),
(3, 3, 'Mineral Botanica', '2024-01-01 09:55:48', ''),
(4, 4, 'Maison Francis', '2023-12-31 21:12:40', ''),
(5, 4, 'Byredo', '2023-12-31 21:13:00', ''),
(6, 4, 'Yves St Laurent', '2023-12-31 21:13:27', ''),
(7, 5, 'Bioaqua', '2023-12-31 21:13:54', ''),
(8, 5, 'Maybelline', '2023-12-31 21:36:45', ''),
(9, 5, 'NARS', '2023-12-31 21:37:02', ''),
(10, 6, 'Focallure', '2023-12-31 21:37:51', '');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'prana12@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-09 04:18:50', '', 1),
(0, 'adadong@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-09 20:33:40', '17-01-2024 04:59:25 PM', 1),
(0, 'adadong@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-09 21:13:46', NULL, 1),
(0, 'adadong@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-17 11:00:05', NULL, 1),
(0, 'adadong@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-17 11:10:33', NULL, 1),
(0, 'adadong@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-17 11:20:22', NULL, 1),
(0, 'adadong@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-17 11:49:11', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `billingAddress`, `regDate`, `updationDate`) VALUES
(1, 'NOWDEMY OFFICIAL', 'Nowdemy@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'karachi,khi', 'Sindh area', '2024-02-04 12:30:50', ''),
(2, 'Amit ', 'amir@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '2024-03-15 10:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '2018-04-29 02:30:32', ''),
(0, 'Prana Alfath Rais', 'adadong@gmail.com', 822123456, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, '2024-01-17 11:20:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 0, 1, '2024-01-09 20:37:12'),
(4, 0, 4, '2024-01-09 20:37:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
