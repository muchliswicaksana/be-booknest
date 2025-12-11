-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Des 2025 pada 06.00
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` int(50) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(50) NOT NULL,
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `price`, `cover`) VALUES
(33, 'Laskar Pelangi', 'Novel ini dimulai dengan situasi kritis di SD Muhammadiyah Gantung, di mana sekolah tersebut terancam ditutup jika tidak mencapai jumlah minimal sepuluh siswa. Hanya ada sembilan siswa yang terdaftar, dan ketegangan meningkat saat waktu pendaftaran hampir', 120000, '1765385503886-10dc06814790d2159ade8a25ac61fa24.jpg'),
(34, 'Bumi', 'Novel Bumi mengisahkan petualangan tiga remaja, Raib, Seli, dan Ali, yang memiliki bakat luar biasa. Di dunia paralel, mereka terikat takdir untuk menyelamatkan Bumi dari kehancuran. Raib, gadis keturunan Klan Bulan, memiliki kemampuan menghilang dan mewa', 145000, '1765386079303-9786020332956_Bumi-New-Cover.jpg'),
(35, 'Bulan', 'Masih menceritakan petualangan dari tiga sekawan, pada novel Bulan ini dikisahkan Ali, Seli, dan Raib yang dibawa oleh Miss Selena dan Av untuk melakukan diplomasi di Klan Matahari. Tujuannya adalah untuk membuka portal atau gerbang yang sudah ribuan tahu', 145000, '1765386398673-9786020332949_Bulan-New-Cover.jpg'),
(36, 'Bintang', 'Raib, seorang pemuda biasa, menjalani kehidupan rutinnya hingga sebuah peristiwa tak terduga terjadi. Ia menemukan sebuah pesan misterius yang membawanya pada petualangan yang belum pernah ia bayangkan sebelumnya. Dipandu oleh kecerdasan buatan bernama Kl', 145000, '1765386451337-cover-novel-bintang-karya-tere-liye.jpg'),
(37, 'Matahari', 'Raib, Seli, dan Ali harus menghadiri pemakaman dan diselimuti dengan perasaan duka setelah salah satu temannya, Ily, tewas di medan perang. Usai menjalani hari yang penuh awan gelap, ketiganya kembali ke sekolah dan belajar seperti biasa.     Singkat ceri', 145000, '1765386497344-1.jpg'),
(39, 'Perahu Kertas', '\"Perahu Kertas\" adalah novel romansa remaja yang ditulis oleh Dewi Lestari, yang lebih dikenal dengan nama pena Dee. Novel ini pertama kali diterbitkan pada tahun 2009 oleh Bentang Pustaka. Cerita ini berfokus pada dua karakter utama, Keenan dan Kugy, yan', 135000, '1765386980875-1 (1).jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
