-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2026 at 04:33 AM
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
-- Database: `db_servis_komputer`
--

-- --------------------------------------------------------

--
-- Table structure for table `servis`
--

CREATE TABLE `servis` (
  `id` int(11) NOT NULL,
  `kode_servis` varchar(20) NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `teknisi_id` int(11) DEFAULT NULL,
  `jenis_perangkat` varchar(50) NOT NULL,
  `merk_tipe` varchar(100) DEFAULT NULL,
  `keluhan` text NOT NULL,
  `catatan_teknisi` text DEFAULT NULL,
  `status` enum('menunggu','diproses','menunggu_sparepart','selesai','diambil','batal') NOT NULL DEFAULT 'menunggu',
  `biaya` decimal(12,2) DEFAULT 0.00,
  `tanggal_masuk` datetime DEFAULT current_timestamp(),
  `tanggal_selesai` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servis`
--

INSERT INTO `servis` (`id`, `kode_servis`, `pelanggan_id`, `teknisi_id`, `jenis_perangkat`, `merk_tipe`, `keluhan`, `catatan_teknisi`, `status`, `biaya`, `tanggal_masuk`, `tanggal_selesai`) VALUES
(1, 'SRV-0001', 4, 2, 'Laptop', 'Asus X441', 'Laptop tidak bisa menyala sama sekali', 'Ditemukan kerusakan pada adaptor charger, sudah diganti.', 'selesai', 150000.00, '2026-09-10 09:00:00', NULL),
(2, 'SRV-0002', 4, 3, 'Printer', 'Canon IP2770', 'Hasil print bergaris-garis', NULL, 'diproses', 0.00, '2026-09-18 13:30:00', NULL),
(3, 'SRV-0003', 4, 2, 'Laptop', 'Lenovo', 'pemakain sangat lemot', NULL, 'menunggu', 0.00, '2026-09-22 15:45:55', NULL),
(4, 'SRV-0004', 4, NULL, 'Laptop', 'loq', 'pemakain sangat lemot', NULL, 'menunggu', 0.00, '2026-09-28 12:01:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teknisi','pelanggan') NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `keahlian` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `nama_lengkap`, `no_hp`, `alamat`, `keahlian`, `created_at`) VALUES
(1, 'admin1', '$2y$10$t5Awak5MFdtxonNDEtysueC9SwzvCcBrLzIPRDDBw2bcvQBruBc62', 'admin', 'Budi Santoso (Admin)', '081200000001', 'Jl. Merdeka No. 1', NULL, '2026-09-22 08:26:48'),
(2, 'teknisi1', '$2y$10$t5Awak5MFdtxonNDEtysueC9SwzvCcBrLzIPRDDBw2bcvQBruBc62', 'teknisi', 'Andi Wijaya', '081200000002', 'Jl. Kenanga No. 2', 'Hardware, Instal Ulang', '2026-09-22 08:26:48'),
(3, 'teknisi2', '$2y$10$t5Awak5MFdtxonNDEtysueC9SwzvCcBrLzIPRDDBw2bcvQBruBc62', 'teknisi', 'Sari Dewi', '081200000003', 'Jl. Melati No. 3', 'Jaringan, Printer', '2026-09-22 08:26:48'),
(4, 'pelanggan1', '$2y$10$t5Awak5MFdtxonNDEtysueC9SwzvCcBrLzIPRDDBw2bcvQBruBc62', 'pelanggan', 'Citra Lestari', '081200000004', 'Jl. Anggrek No. 4', NULL, '2026-09-22 08:26:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_servis` (`kode_servis`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `teknisi_id` (`teknisi_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `servis`
--
ALTER TABLE `servis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `servis`
--
ALTER TABLE `servis`
  ADD CONSTRAINT `servis_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `servis_ibfk_2` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
