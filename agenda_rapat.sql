-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql206.byetcluster.com
-- Generation Time: Nov 05, 2025 at 09:14 AM
-- Server version: 11.4.7-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_40246329_agenda_rapat`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda_rapat`
--

CREATE TABLE `agenda_rapat` (
  `id` int(11) NOT NULL,
  `rapat_id` int(11) DEFAULT NULL,
  `uraian` text DEFAULT NULL,
  `penanggung_jawab` varchar(100) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agenda_rapat`
--

INSERT INTO `agenda_rapat` (`id`, `rapat_id`, `uraian`, `penanggung_jawab`, `durasi`) VALUES
(1, 1, 'Pembahasan Indikator Kinerja', 'Demas', 40),
(2, 1, 'SOP Pengajuan Program', 'Budi', 30),
(3, 2, 'Laporan Penanganan Stunting', 'Rina', 60),
(4, 3, 'Kurikulum 2026', 'Andi', 50),
(5, 4, 'Review Anggaran', 'Sari', 120),
(6, 5, 'Evaluasi Proyek Fisik', 'Budi', 90);

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id` int(11) NOT NULL,
  `nama_instansi` varchar(150) NOT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id`, `nama_instansi`, `alamat`) VALUES
(1, 'Kecamatan Kesesi', 'Jl. Raya Kesesi No. 1'),
(2, 'Dinas Pendidikan', 'Jl. A.Yani No. 15'),
(3, 'Dinas Kesehatan', 'Jl. Dr. Cipto No. 20'),
(4, 'Bappeda', 'Jl. Gajah Mada No. 45'),
(5, 'Setda Kabupaten', 'Kompleks Pemda'),
(13, '12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lampiran_rapat`
--

CREATE TABLE `lampiran_rapat` (
  `id` int(11) NOT NULL,
  `rapat_id` int(11) DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `path_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lampiran_rapat`
--

INSERT INTO `lampiran_rapat` (`id`, `rapat_id`, `nama_file`, `path_file`) VALUES
(1, 1, 'indikatorkinerja.pdf', '/upload/indikatorkinerja.pdf'),
(2, 2, 'laporan_stunting.docx', '/upload/laporan_stunting.docx'),
(3, 3, 'kurikulum2026.pdf', '/upload/kurikulum2026.pdf'),
(4, 4, 'review_anggaran.xlsx', '/upload/review_anggaran.xlsx'),
(5, 5, 'monitoring_proyek.pdf', '/upload/monitoring_proyek.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `notulen`
--

CREATE TABLE `notulen` (
  `id` int(11) NOT NULL,
  `rapat_id` int(11) DEFAULT NULL,
  `isi_notulen` text DEFAULT NULL,
  `dibuat_oleh` int(11) DEFAULT NULL,
  `tanggal_dibuat` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notulen`
--

INSERT INTO `notulen` (`id`, `rapat_id`, `isi_notulen`, `dibuat_oleh`, `tanggal_dibuat`) VALUES
(1, 1, 'Beberapa poin penting terkait indikator.', 1, '2025-11-03 19:01:27'),
(2, 2, 'Stunting jadi fokus utama.', 3, '2025-11-03 19:01:27'),
(3, 3, 'Pembaharuan kurikulum disepakati.', 2, '2025-11-03 19:01:27'),
(4, 4, 'Perubahan anggaran akan dikaji ulang.', 5, '2025-11-03 19:01:27'),
(5, 5, 'Proyek fisik berjalan sesuai target.', 4, '2025-11-03 19:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `peserta_rapat`
--

CREATE TABLE `peserta_rapat` (
  `id` int(11) NOT NULL,
  `rapat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_kehadiran` enum('Hadir','Tidak Hadir','Pending') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta_rapat`
--

INSERT INTO `peserta_rapat` (`id`, `rapat_id`, `user_id`, `status_kehadiran`) VALUES
(1, 1, 1, 'Hadir'),
(2, 1, 2, 'Pending'),
(3, 1, 4, 'Hadir'),
(4, 2, 3, 'Hadir'),
(5, 2, 5, 'Pending'),
(6, 3, 2, 'Hadir'),
(7, 3, 6, 'Hadir'),
(8, 4, 5, 'Tidak Hadir'),
(9, 4, 4, 'Hadir'),
(10, 5, 7, 'Hadir');

-- --------------------------------------------------------

--
-- Table structure for table `rapat`
--

CREATE TABLE `rapat` (
  `id` int(11) NOT NULL,
  `judul_rapat` varchar(200) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL,
  `ruangan_id` int(11) DEFAULT NULL,
  `penyelenggara` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rapat`
--

INSERT INTO `rapat` (`id`, `judul_rapat`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `ruangan_id`, `penyelenggara`) VALUES
(1, 'Koordinasi Program 2026', '2025-11-10', '09:00:00', '11:00:00', 1, 1),
(2, 'Evaluasi Kesehatan', '2025-11-12', '13:00:00', '15:00:00', 2, 3),
(3, 'Perencanaan Pendidikan', '2025-11-15', '10:00:00', '12:00:00', 3, 2),
(4, 'Rapat Anggaran', '2025-11-18', '08:00:00', '12:00:00', 4, 5),
(5, 'Rapat Monitoring Proyek', '2025-11-20', '14:00:00', '17:00:00', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nama_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nama_role`) VALUES
(1, 'Admin'),
(2, 'Pimpinan'),
(3, 'Sekretariat 1'),
(4, 'Pegawai'),
(5, 'Tamu');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id` int(11) NOT NULL,
  `nama_ruangan` varchar(100) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  `lokasi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id`, `nama_ruangan`, `kapasitas`, `lokasi`) VALUES
(1, 'Ruang Rapat Utama', 50, 'Lantai 1'),
(2, 'Ruang Sekretariat', 20, 'Lantai 2'),
(3, 'Ruang Rapat C', 15, 'Lantai 2'),
(4, 'Aula Pertemuan', 100, 'Gedung Terpisah'),
(5, 'Ruang Bappeda', 30, 'Lantai 3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `instansi_id`) VALUES
(1, 'Demas', 'demas@kesesi.go.id', 'password11', 1),
(2, 'Andi', 'andi@disdik.go.id', 'password2', 2),
(3, 'Rina', 'rina@dinkes.go.id', 'password3', 3),
(4, 'Budi', 'budi@bappeda.go.id', 'password4', 4),
(5, 'Sari', 'sari@setda.go.id', 'password5', 5),
(6, 'Lina', 'lina@kesesi.go.id', 'password6', 1),
(7, 'Roni', 'roni@disdik.go.id', 'password7', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(4, 2),
(5, 3),
(2, 4),
(3, 4),
(6, 4),
(7, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda_rapat`
--
ALTER TABLE `agenda_rapat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rapat_id` (`rapat_id`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lampiran_rapat`
--
ALTER TABLE `lampiran_rapat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rapat_id` (`rapat_id`);

--
-- Indexes for table `notulen`
--
ALTER TABLE `notulen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rapat_id` (`rapat_id`),
  ADD KEY `dibuat_oleh` (`dibuat_oleh`);

--
-- Indexes for table `peserta_rapat`
--
ALTER TABLE `peserta_rapat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rapat_id` (`rapat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rapat`
--
ALTER TABLE `rapat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ruangan_id` (`ruangan_id`),
  ADD KEY `penyelenggara` (`penyelenggara`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `instansi_id` (`instansi_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda_rapat`
--
ALTER TABLE `agenda_rapat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `lampiran_rapat`
--
ALTER TABLE `lampiran_rapat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notulen`
--
ALTER TABLE `notulen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `peserta_rapat`
--
ALTER TABLE `peserta_rapat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rapat`
--
ALTER TABLE `rapat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agenda_rapat`
--
ALTER TABLE `agenda_rapat`
  ADD CONSTRAINT `agenda_rapat_ibfk_1` FOREIGN KEY (`rapat_id`) REFERENCES `rapat` (`id`);

--
-- Constraints for table `lampiran_rapat`
--
ALTER TABLE `lampiran_rapat`
  ADD CONSTRAINT `lampiran_rapat_ibfk_1` FOREIGN KEY (`rapat_id`) REFERENCES `rapat` (`id`);

--
-- Constraints for table `notulen`
--
ALTER TABLE `notulen`
  ADD CONSTRAINT `notulen_ibfk_1` FOREIGN KEY (`rapat_id`) REFERENCES `rapat` (`id`),
  ADD CONSTRAINT `notulen_ibfk_2` FOREIGN KEY (`dibuat_oleh`) REFERENCES `users` (`id`);

--
-- Constraints for table `peserta_rapat`
--
ALTER TABLE `peserta_rapat`
  ADD CONSTRAINT `peserta_rapat_ibfk_1` FOREIGN KEY (`rapat_id`) REFERENCES `rapat` (`id`),
  ADD CONSTRAINT `peserta_rapat_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `rapat`
--
ALTER TABLE `rapat`
  ADD CONSTRAINT `rapat_ibfk_1` FOREIGN KEY (`ruangan_id`) REFERENCES `ruangan` (`id`),
  ADD CONSTRAINT `rapat_ibfk_2` FOREIGN KEY (`penyelenggara`) REFERENCES `instansi` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`instansi_id`) REFERENCES `instansi` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
