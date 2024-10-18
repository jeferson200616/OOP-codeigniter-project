-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 18, 2024 at 10:13 PM
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
-- Database: `taskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(2, '2024-10-10-004114', 'App\\Database\\Migrations\\CreateTask', 'default', 'App', 1728521693, 1),
(3, '2024-10-10-014853', 'App\\Database\\Migrations\\AddTimestampsToTask', 'default', 'App', 1728525443, 2),
(4, '2024-10-10-213112', 'App\\Database\\Migrations\\CreateUser', 'default', 'App', 1728596631, 3),
(5, '2024-10-11-202839', 'App\\Database\\Migrations\\AddUserIdToTask', 'default', 'App', 1728679891, 4),
(6, '2024-10-11-220405', 'App\\Database\\Migrations\\AddIndexToTaskCreatedAt', 'default', 'App', 1728684425, 5),
(7, '2024-10-12-024646', 'App\\Database\\Migrations\\AddIsAdminToUser', 'default', 'App', 1728701735, 6),
(8, '2024-10-12-040928', 'App\\Database\\Migrations\\AddAccountActivationToUser', 'default', 'App', 1728706440, 7),
(9, '2024-10-14-234907', 'App\\Database\\Migrations\\AddPasswordResetToUser', 'default', 'App', 1728949942, 8),
(10, '2024-10-15-191431', 'App\\Database\\Migrations\\AddProfileImageToUser', 'default', 'App', 1729019916, 9),
(11, '2024-10-16-213414', 'App\\Database\\Migrations\\CreateRememberedLogin', 'default', 'App', 1729114866, 10);

-- --------------------------------------------------------

--
-- Table structure for table `remembered_login`
--

CREATE TABLE `remembered_login` (
  `token_hash` varchar(64) NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `remembered_login`
--

INSERT INTO `remembered_login` (`token_hash`, `user_id`, `expires_at`) VALUES
('b6a9cf71689a30c49cd9f424ba0a2255562a3696abc2872164aeeb5c81f4ff6a', 1, '2024-10-26 23:56:22'),
('ed6e46bf03edb189a772ecf160b9f765ca126dc14a14d704343020ef8e037595', 1, '2024-10-27 00:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(5) UNSIGNED NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `description`, `created_at`, `updated_at`, `user_id`) VALUES
(10, 'otra tarea nueva updated', '2024-10-11 21:50:11', '2024-10-11 21:51:40', 3),
(11, 'Tarea urgente', '2024-10-11 22:00:14', '2024-10-11 22:00:14', 3),
(12, 'tarea', '2024-10-12 14:52:10', '2024-10-12 14:52:10', 1),
(13, 'hola 2', '2024-10-17 20:21:40', '2024-10-17 21:44:36', 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `activation_hash` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `reset_hash` varchar(64) DEFAULT NULL,
  `reset_expires_at` datetime DEFAULT NULL,
  `profile_image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`, `is_admin`, `activation_hash`, `is_active`, `reset_hash`, `reset_expires_at`, `profile_image`) VALUES
(1, 'jef mendez', 'jef@prueba.com', '$2y$10$GaIPo2OQyKy7iRvyyIB41Om8T3NLXseBLN4v7gdHCk0BZyqqckCD.', '2024-10-11 02:52:22', '2024-10-18 19:08:16', 0, NULL, 1, '4b7beaeef5f496f9b141fab5a0e9f966cd075b1ff614c6b3875f48e8424573f4', '2024-10-18 06:02:39', NULL),
(3, 'jef', 'jef1@prueba.com', '$2y$10$sH/JXMmmSUdW18jYuyxYLOSoNnoZG13QPQYYDaXbDaElyF3vkneUK', '2024-10-11 03:01:53', '2024-10-11 03:01:53', 0, NULL, 1, NULL, NULL, NULL),
(5, 'eva', 'eva@example.com', '$2y$10$Ri.Y4SXEiWh3.eLmcqHF4u4mv8NOYrfJK7bsnkCH.rAxmbgFMLDLy', '2024-10-12 00:41:34', '2024-10-12 00:41:34', 0, NULL, 0, NULL, NULL, NULL),
(7, 'Admin', 'admin@example.com', '$2y$10$ygVs4GPhG0/3gdJDjycx5eI2KhWtQbh9etM7QDSi0Zvqh6XI6p2xm', '2024-10-12 03:11:07', '2024-10-18 06:40:47', 1, NULL, 1, NULL, NULL, NULL),
(8, 'otro administrador', 'admin2@example.com', '$2y$10$noAdgGuHtKBgg/FG/e554O/hDo8GSi1/.6ZMRepFmk.Un7Qk7cSDS', '2024-10-12 03:52:19', '2024-10-12 04:05:53', 1, NULL, 0, NULL, NULL, NULL),
(13, 'srquesos', 'srquesos987@gmail.com', '$2y$10$nunOGCBfKkEaOD2GrKgyK.LTiRMqW5IJfWjmwGs7/wfUoNX3Msav2', '2024-10-14 05:12:34', '2024-10-18 03:18:49', 0, '8000f8de7f427930111875ce18b058dbd68f04fcc670974c331787a983f36a84', 1, 'fd1d85b33a14e5e9a09b25a2af0b964ed3baf3530be2a66e4ae6cff6bd921f16', '2024-10-18 05:18:49', NULL),
(14, 'david', 'mendezjefdavid.29@gmail.com', '$2y$10$YsWF9epZe.VCHwAMOppm5OPeRQnCq.WC5DrNcUnBSmvptRMRGt2IC', '2024-10-15 01:08:08', '2024-10-15 01:08:08', 0, '39ed77c1cd8a771671dc207b80286494048ea5730a7cf3961c4205859e94f276', 0, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `remembered_login_user_id_foreign` (`user_id`),
  ADD KEY `expires_at` (`expires_at`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_user_id_fk` (`user_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `activation_hash` (`activation_hash`),
  ADD UNIQUE KEY `reset_hash` (`reset_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD CONSTRAINT `remembered_login_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
