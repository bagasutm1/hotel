-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2026 at 10:42 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_rekomendasi_hotel1_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `nama_lengkap`, `created_at`, `updated_at`) VALUES
(1, 'karim', 'akarim5931@gmail.com', '$2y$10$dJEICgiljTT2uN2E0MrDAOZhz0/yG91JsRwXwN88ksD1CS.l0XbO2', 'abdul karim', '2026-01-14 15:55:24', '2026-01-14 15:55:24');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` int NOT NULL,
  `nama_kriteria` varchar(50) NOT NULL,
  `kode_kriteria` varchar(10) NOT NULL COMMENT 'C1, C2, C3, dst',
  `bobot` decimal(3,2) NOT NULL COMMENT 'Total semua bobot = 1.00',
  `jenis_kriteria` enum('benefit','cost') NOT NULL,
  `deskripsi` text,
  `satuan` varchar(20) DEFAULT NULL COMMENT 'Rupiah, Meter, Poin, dll',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `nama_kriteria`, `kode_kriteria`, `bobot`, `jenis_kriteria`, `deskripsi`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 'Harga per Malam', 'C1', '0.40', 'cost', 'Harga kamar per malam dalam rupiah', 'Rupiah', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(2, 'Rating Hotel', 'C2', '0.35', 'benefit', 'Rating bintang hotel (1-5)', 'Bintang', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(3, 'Jarak dari Pusat Kota', 'C3', '0.25', 'cost', 'Jarak hotel dari pusat kota Mataram', 'Kilometer', '2025-06-20 12:04:28', '2025-06-21 01:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int NOT NULL,
  `nama_hotel` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `deskripsi` text,
  `foto_utama` varchar(255) DEFAULT NULL,
  `harga_per_malam` decimal(10,2) NOT NULL,
  `rating_bintang` int DEFAULT NULL COMMENT '1-5 bintang',
  `fasilitas` text COMMENT 'JSON array atau comma separated',
  `koordinat_lat` decimal(10,8) DEFAULT NULL,
  `koordinat_lng` decimal(11,8) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jarak_km` decimal(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `nama_hotel`, `alamat`, `deskripsi`, `foto_utama`, `harga_per_malam`, `rating_bintang`, `fasilitas`, `koordinat_lat`, `koordinat_lng`, `status`, `created_at`, `updated_at`, `jarak_km`) VALUES
(1, 'Hotel Lombok Raya', 'Jl. Panca Usaha No. 11, Mataram', 'Hotel bintang 4 dengan fasilitas lengkap di pusat kota Mataram', 'hotel_1750467743_2097.jpg', '470000.00', 4, 'AC,TV,Gym,Restaurant', '-8.58330000', '116.11670000', 'aktif', '2025-06-20 12:04:28', '2026-01-14 07:47:22', '0.00'),
(2, 'Golden Palace Hotel', 'Jl. Sriwijaya No. 15, Mataram', 'Hotel mewah dengan pelayanan premium dan lokasi strategis', 'golden_palace.jpg', '750000.00', 5, 'WiFi,AC,TV,Restaurant,Pool,Spa,Gym,Bar', '-8.58400000', '116.11500000', 'aktif', '2025-06-20 12:04:28', '2025-06-20 12:04:28', '0.00'),
(3, 'Mataram Hotel', 'Jl. Pejanggik No. 32, Mataram', 'Hotel budget dengan fasilitas standar namun nyaman terbaik', 'hotel_1750467831_9556.jpg', '250000.00', 4, 'AC,TV,Gym,Restaurant', '-8.58500000', '116.11800000', 'aktif', '2025-06-20 12:04:28', '2026-01-14 07:52:26', '0.00'),
(4, 'Hotel Santika Mataram', 'Jl. Selaparang No. 140, Mataram', 'Hotel chain ternama dengan standar pelayanan tinggi', 'hotel_1750467808_3538.jpg', '580000.00', 4, 'AC,TV,Restaurant,Meeting Room', '-8.58200000', '116.12000000', 'aktif', '2025-06-20 12:04:28', '2025-06-21 01:03:28', '0.00'),
(5, 'Lombok Plaza Hotel', 'Jl. Salam No. 1, Mataram', 'Hotel bisnis dengan lokasi dekat pusat perbelanjaan', 'hotel_1750467863_6299.jpg', '380000.00', 3, 'AC,TV,Restaurant,Meeting Room', '-8.58600000', '116.11400000', 'aktif', '2025-06-20 12:04:28', '2025-06-21 01:04:23', '0.00'),
(8, 'Budget Inn Mataram', 'Jl. Airlangga No. 20, Mataram', 'Hotel budget untuk backpacker dan wisatawan hemat', 'hotel_1750467932_8176.jpg', '150000.00', 2, 'AC,TV', '-8.58700000', '116.11900000', 'aktif', '2025-06-20 12:04:28', '2025-06-21 01:05:32', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_criteria_values`
--

CREATE TABLE `hotel_criteria_values` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `criteria_id` int NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_criteria_values`
--

INSERT INTO `hotel_criteria_values` (`id`, `hotel_id`, `criteria_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '450000.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(2, 1, 2, '4.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(3, 1, 3, '0.50', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(4, 2, 1, '750000.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(5, 2, 2, '5.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(6, 2, 3, '1.20', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(7, 3, 1, '250000.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(8, 3, 2, '3.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(9, 3, 3, '0.80', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(10, 4, 1, '580000.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(11, 4, 2, '4.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(12, 4, 3, '2.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(13, 5, 1, '380000.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(14, 5, 2, '3.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(15, 5, 3, '1.50', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(22, 8, 1, '150000.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(23, 8, 2, '2.00', '2025-06-20 12:04:28', '2025-06-20 12:04:28'),
(24, 8, 3, '1.80', '2025-06-20 12:04:28', '2025-06-20 12:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_photos`
--

CREATE TABLE `hotel_photos` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `foto_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_photos`
--

INSERT INTO `hotel_photos` (`id`, `hotel_id`, `foto_path`, `keterangan`, `is_primary`, `created_at`) VALUES
(4, 2, 'photos/golden_palace_1.jpg', 'Lobby Hotel', 1, '2025-06-20 12:04:28'),
(5, 2, 'photos/golden_palace_2.jpg', 'Suite Room', 0, '2025-06-20 12:04:28'),
(16, 1, 'hotel_1750466474_2424.jpg', NULL, 0, '2025-06-21 00:41:14'),
(21, 1, 'hotel_1750467743_7076.jpg', 'kamar', 0, '2025-06-21 01:02:23'),
(22, 3, 'hotel_1750467778_1648.jpg', 'kolam', 0, '2025-06-21 01:02:58'),
(23, 4, 'hotel_1750467808_4616.jpg', 'parkir', 0, '2025-06-21 01:03:28'),
(24, 3, 'hotel_1750467831_1912.jpg', 'cuhh', 0, '2025-06-21 01:03:51'),
(25, 5, 'hotel_1750467863_2323.jpg', 'ssssssss', 0, '2025-06-21 01:04:23'),
(27, 8, 'hotel_1750467932_9917.jpg', 'hmmmmmmm', 0, '2025-06-21 01:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `jumlah_kamar` int NOT NULL DEFAULT '1',
  `tanggal_pesan` date DEFAULT NULL,
  `total_harga` decimal(12,2) DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_checkin` date DEFAULT NULL,
  `tanggal_checkout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `hotel_id`, `jumlah_kamar`, `tanggal_pesan`, `total_harga`, `status`, `created_at`, `tanggal_checkin`, `tanggal_checkout`) VALUES
(1, 9, 1, 1, NULL, NULL, 'pending', '2026-01-12 08:14:47', '2026-01-12', '2026-01-13'),
(2, 9, 2, 1, NULL, NULL, 'pending', '2026-01-14 06:06:21', '2026-01-14', '2026-01-16');

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `search_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Parameter pencarian: budget, lokasi, fasilitas, dll',
  `saw_results` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Hasil perhitungan SAW dan ranking hotel',
  `total_hotels_found` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `search_history`
--

INSERT INTO `search_history` (`id`, `user_id`, `search_params`, `saw_results`, `total_hotels_found`, `created_at`) VALUES
(13, 9, '{\"budget\":\"\",\"rating\":\"\",\"jarak\":\"\"}', '[{\"ranking\":1,\"nama_hotel\":\"Hotel Lombok Rayaa\",\"harga_per_malam\":450000,\"saw_score\":null},{\"ranking\":2,\"nama_hotel\":\"Golden Palace Hotel\",\"harga_per_malam\":750000,\"saw_score\":null},{\"ranking\":3,\"nama_hotel\":\"Mataram Hotel\",\"harga_per_malam\":250000,\"saw_score\":null},{\"ranking\":4,\"nama_hotel\":\"Hotel Santika Mataram\",\"harga_per_malam\":580000,\"saw_score\":null},{\"ranking\":5,\"nama_hotel\":\"Lombok Plaza Hotel\",\"harga_per_malam\":380000,\"saw_score\":null},{\"ranking\":6,\"nama_hotel\":\"Hotel Zahir\",\"harga_per_malam\":480000,\"saw_score\":null},{\"ranking\":7,\"nama_hotel\":\"Budget Inn Mataram\",\"harga_per_malam\":150000,\"saw_score\":null}]', 7, '2026-01-12 07:38:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `no_telepon` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_general_ci,
  `foto_profil` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` enum('user','admin') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `nama_lengkap`, `no_telepon`, `alamat`, `foto_profil`, `created_at`, `updated_at`, `role`) VALUES
(9, 'user123_', 'riskavanessa58@gmail.com', '$2y$10$H76Sj6dXM54AGm8kJ8GD6.SWW1CP12hMbw1xptYum9hMvC55Tj.UO', 'abdul karim', '087848940578', 'bima', NULL, '2026-01-12 07:33:17', '2026-01-12 07:33:17', 'user'),
(14, 'admin123_', 'admin@gmail.com', '$2y$10$IjMD5uzRntf/e.9BOTfweu1ZjFEEo47mI/Xi.Z4RVQIUvGe7IuxCm', 'riskavanessa', '083196667616', 'lombok', NULL, '2026-01-14 06:50:41', '2026-01-14 06:52:09', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_kriteria` (`kode_kriteria`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hotels_status` (`status`);

--
-- Indexes for table `hotel_criteria_values`
--
ALTER TABLE `hotel_criteria_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_hotel_criteria` (`hotel_id`,`criteria_id`),
  ADD KEY `idx_hotel_criteria_hotel_id` (`hotel_id`),
  ADD KEY `idx_hotel_criteria_criteria_id` (`criteria_id`);

--
-- Indexes for table `hotel_photos`
--
ALTER TABLE `hotel_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hotel_photos_hotel_id` (`hotel_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_search_history_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_hotel` (`user_id`,`hotel_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `idx_user_favorites_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hotel_criteria_values`
--
ALTER TABLE `hotel_criteria_values`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `hotel_photos`
--
ALTER TABLE `hotel_photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `search_history`
--
ALTER TABLE `search_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_favorites`
--
ALTER TABLE `user_favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel_criteria_values`
--
ALTER TABLE `hotel_criteria_values`
  ADD CONSTRAINT `hotel_criteria_values_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_criteria_values_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hotel_photos`
--
ALTER TABLE `hotel_photos`
  ADD CONSTRAINT `hotel_photos_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `search_history`
--
ALTER TABLE `search_history`
  ADD CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `user_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_favorites_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
