-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2026 at 05:07 PM
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
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `password`, `created_at`) VALUES
('1', 'admin', 'admin', 'admin', '2026-07-09 18:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(7) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `no_hp` varchar(45) NOT NULL,
  `spesialis` varchar(45) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `no_hp`, `spesialis`, `alamat`, `jenis_kelamin`) VALUES
('1', 'dok', '091203', 'Spesialis Anak', 'llkaldaw', 'Laki-Laki'),
('2', 'kdlawk', '0921039', 'Spesialis Bedah', 'dklakwd', 'Perempuan'),
('3', 'dlwkaldk', '092839128', 'Spesialis Kandungan', 'kdlkawld', 'Laki-Laki'),
('4', 'mdmsa', '0902813', 'Spesialis Gigi', 'kalkdawdwa', 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kd_obat` varchar(7) NOT NULL,
  `nm_obat` varchar(100) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kd_obat`, `nm_obat`, `kategori`, `satuan`, `harga`, `stok`) VALUES
('1', 'kdlwakdkla', 'Analgesik', 'ml', 200.00, 20),
('2', 'kdlka', 'Antibiotik', 'gr', 90.00, 90),
('3', 'kdlawkdw', 'Anti-inflamasi', 'cm', 80.00, 80),
('4', 'kdlakwd', 'Bronkodilator', 'RAWR', 69.00, 69);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(7) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `no_hp`, `alamat`) VALUES
('1', 'pasien', 'Laki-laki', '09210390129', 'kdlawkdlkawdaw'),
('2', 'kldlak', 'Laki-laki', '909123012', 'kdlakdwa'),
('3', 'lkdlawkdlk', 'Perempuan', '090293', 'kdlakwldkaw');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_pasien` varchar(20) NOT NULL,
  `metode_pembayaran` enum('BPJS','Tunai','Transfer') NOT NULL,
  `jumlah_bayar` decimal(12,2) NOT NULL,
  `tanggal_pembayaran` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_payment`, `id_pasien`, `metode_pembayaran`, `jumlah_bayar`, `tanggal_pembayaran`) VALUES
(7, '1', 'BPJS', 2000.00, '2026-07-09 11:56:41'),
(8, '2', 'BPJS', 30000.00, '2026-07-09 12:02:50'),
(9, '3', 'BPJS', 4000.00, '2026-07-09 12:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `no_pendaftaran` varchar(50) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `poli` enum('poli_umum','poli_gigi','poli_tht','poli_mata','poli_spesialis','poli_anak') NOT NULL,
  `status` enum('selesai','batal','terdaftar','menunggu') NOT NULL DEFAULT 'terdaftar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`no_pendaftaran`, `nama_pasien`, `tanggal`, `poli`, `status`) VALUES
('1', 'pasien', '2026-07-09 11:06:57', 'poli_umum', 'selesai'),
('2', 'kldlak', '2026-07-09 11:07:16', 'poli_gigi', 'batal'),
('3', 'lkdlawkdlk', '2026-07-09 11:07:40', 'poli_tht', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` varchar(20) NOT NULL,
  `nama_perawat` varchar(30) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `spesialis` varchar(50) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perawat`
--

INSERT INTO `perawat` (`id_perawat`, `nama_perawat`, `jenis_kelamin`, `no_hp`, `spesialis`, `alamat`) VALUES
('1', 'perawat', 'Laki-Laki', '0290391', 'Spesialis Keperawatan Anak', 'kdlawkdaw'),
('2', 'kdlkwalkd', 'Perempuan', '091203912', 'Spesialis Keperawatan Medikal Bedah', 'dlkawdaw'),
('3', 'mdwmalkd', 'Laki-Laki', '0902913021', 'Spesialis Keperawatan Gawat Darurat', 'kdlawkdaw');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id_periksa` varchar(7) NOT NULL,
  `id_dokter` varchar(7) NOT NULL,
  `id_pasien` varchar(7) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `diagnosa` tinytext NOT NULL,
  `tindakan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id_periksa`, `id_dokter`, `id_pasien`, `tgl_periksa`, `diagnosa`, `tindakan`) VALUES
('1', '3', '1', '2026-07-09', 'sakit banget', 'butuh uang'),
('2', '1', '2', '2026-07-09', 'sakit dok	', 'dok sakit'),
('3', '2', '3', '2026-07-09', 'gak sakit	', 'orang ga kena');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `lantai` int(10) NOT NULL,
  `kapasitas` int(10) NOT NULL,
  `fasilitas` longtext NOT NULL,
  `status` enum('Tersedia','Sedang digunakan') NOT NULL DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kd_ruangan`, `nama_ruangan`, `jenis`, `lantai`, `kapasitas`, `fasilitas`, `status`) VALUES
('1', 'RAWR', 'Rawat Inap', 1, 1, 'LENGKAP', 'Tersedia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kd_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `fk_payment_pasien` (`id_pasien`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`no_pendaftaran`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id_perawat`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id_periksa`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kd_ruangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
