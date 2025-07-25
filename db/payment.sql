-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jul 2025 pada 11.06
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agen`
--

CREATE TABLE `agen` (
  `id_agen` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `saldo` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `akses` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `agen`
--

INSERT INTO `agen` (`id_agen`, `nama`, `alamat`, `no_telepon`, `saldo`, `biaya_admin`, `username`, `password`, `akses`) VALUES
('A20250724001', 'Abdillah', 'Bojong Gede', '08888888', 0, 2500, 'abdil', 'abdil123', 'agen'),
('A20250724002', 'Naufal Farros', 'Citeureup', '08888888', 0, 3000, 'Farros', 'faros123', 'agen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(14) NOT NULL,
  `no_meter` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tenggang` varchar(2) NOT NULL,
  `id_tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_meter`, `nama`, `alamat`, `tenggang`, `id_tarif`) VALUES
('20250724151133', '204250741533', 'Teuku Rangga Febrio', 'Depok', '24', 5),
('20250724201233', '204250742033', 'Fauzi Eka', 'Rawadenok', '24', 9),
('20250724201310', '204250742010', 'Sultan Arief Hadi Sembodo', 'Rawadenok', '24', 16),
('20250724201457', '204250742057', 'Tiara Angelina', 'Citayam', '24', 8),
('20250724201905', '204250742005', 'Ahmad Fadhil', 'Bedahan', '24', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(15) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `waktu_bayar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bulan_bayar` varchar(2) NOT NULL,
  `tahun_bayar` year(4) NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `total_akhir` double NOT NULL,
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `id_agen` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pelanggan`, `tgl_bayar`, `waktu_bayar`, `bulan_bayar`, `tahun_bayar`, `jumlah_bayar`, `biaya_admin`, `total_akhir`, `bayar`, `kembali`, `id_agen`) VALUES
('BYR202507240001', '20250724151133', '2025-07-24', '2025-07-24 08:13:53', '07', 2025, 37500, 2000, 39500, 40000, 500, 'A20180125001'),
('BYR202507240002', '20250724201233', '2025-07-24', '2025-07-24 13:21:37', '07', 2025, 80000, 2500, 82500, 85000, 2500, 'A20250724001'),
('BYR202507240003', '20250724201310', '2025-07-24', '2025-07-24 13:26:24', '07', 2025, 150000, 3000, 153000, 153000, 0, 'A20250724002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggunaan`
--

CREATE TABLE `penggunaan` (
  `id_penggunaan` varchar(20) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `meter_awal` int(11) NOT NULL,
  `meter_akhir` int(11) NOT NULL,
  `tgl_cek` date NOT NULL,
  `id_petugas` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penggunaan`
--

INSERT INTO `penggunaan` (`id_penggunaan`, `id_pelanggan`, `bulan`, `tahun`, `meter_awal`, `meter_akhir`, `tgl_cek`, `id_petugas`) VALUES
('20250724151133010202', '20250724151133', '01', 2025, 500, 520, '2025-08-25', 'P20180125001'),
('20250724151133022025', '20250724151133', '02', 2025, 520, 0, '0000-00-00', ''),
('20250724151133072025', '20250724151133', '07', 2025, 0, 50, '2025-07-24', 'P20180125001'),
('20250724151133082025', '20250724151133', '08', 2025, 50, 100, '2025-07-24', 'P20180125001'),
('20250724151133092025', '20250724151133', '09', 2025, 100, 500, '2025-10-24', 'P20180125001'),
('20250724200846072025', '20250724200846', '07', 2025, 0, 55, '2025-04-24', 'P20180125001'),
('20250724200846082025', '20250724200846', '08', 2025, 55, 0, '0000-00-00', ''),
('20250724201233072025', '20250724201233', '07', 2025, 0, 40, '2025-08-24', 'P20180125001'),
('20250724201233082025', '20250724201233', '08', 2025, 40, 0, '0000-00-00', ''),
('20250724201310072025', '20250724201310', '07', 2025, 0, 100, '2025-08-24', 'P20180125001'),
('20250724201310082025', '20250724201310', '08', 2025, 100, 0, '0000-00-00', ''),
('20250724201457072025', '20250724201457', '07', 2025, 0, 35, '2025-07-25', 'P20180125001'),
('20250724201457082025', '20250724201457', '08', 2025, 35, 0, '0000-00-00', ''),
('20250724201905072025', '20250724201905', '07', 2025, 0, 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `akses` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama`, `alamat`, `no_telepon`, `jk`, `username`, `password`, `akses`) VALUES
('P20180125001', 'Leonard Agustin', 'Depok', '081223471270', 'L', 'Leonard05', 'petugas123', 'petugas');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `qw_pembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `qw_pembayaran` (
`id_pembayaran` varchar(15)
,`id_pelanggan` varchar(14)
,`tgl_bayar` date
,`waktu_bayar` timestamp
,`bulan_bayar` varchar(2)
,`tahun_bayar` year(4)
,`jumlah_bayar` double
,`biaya_admin` double
,`total_akhir` double
,`bayar` double
,`kembali` double
,`id_agen` varchar(12)
,`nama_pelanggan` varchar(50)
,`nama_agen` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `qw_penggunaan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `qw_penggunaan` (
`id_penggunaan` varchar(20)
,`id_pelanggan` varchar(14)
,`bulan` varchar(2)
,`tahun` year(4)
,`meter_awal` int(11)
,`meter_akhir` int(11)
,`tgl_cek` date
,`id_petugas` varchar(12)
,`nama_pelanggan` varchar(50)
,`nama_petugas` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `qw_tagihan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `qw_tagihan` (
`id_tagihan` int(11)
,`id_pelanggan` varchar(14)
,`bulan` varchar(2)
,`tahun` year(4)
,`jumlah_meter` int(11)
,`tarif_perkwh` double
,`jumlah_bayar` double
,`status` varchar(15)
,`id_petugas` varchar(12)
,`nama_pelanggan` varchar(50)
,`id_tarif` int(11)
,`nama_petugas` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `jumlah_meter` int(11) NOT NULL,
  `tarif_perkwh` double NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `status` varchar(15) NOT NULL,
  `id_petugas` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_pelanggan`, `bulan`, `tahun`, `jumlah_meter`, `tarif_perkwh`, `jumlah_bayar`, `status`, `id_petugas`) VALUES
(32, '20250724201233', '07', 2025, 40, 2000, 80000, 'Terbayar', 'P20180125001'),
(33, '20250724201310', '07', 2025, 100, 1500, 150000, 'Terbayar', 'P20180125001'),
(34, '20250724151133', '01', 2025, 20, 750, 15000, 'Belum Bayar', 'P20180125001'),
(35, '20250724201457', '07', 2025, 35, 1500, 52500, 'Belum Bayar', 'P20180125001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tarif`
--

CREATE TABLE `tarif` (
  `id_tarif` int(11) NOT NULL,
  `kode_tarif` varchar(20) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `daya` varchar(10) NOT NULL,
  `tarif_perkwh` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tarif`
--

INSERT INTO `tarif` (`id_tarif`, `kode_tarif`, `golongan`, `daya`, `tarif_perkwh`) VALUES
(3, 'R3/450VA', 'R3', '450VA', 1000),
(4, 'R1/900VA', 'R1', '900VA', 1500),
(5, 'R2/450VA', 'R2', '450VA', 750),
(8, 'R2/900VA', 'R2', '900VA', 1500),
(9, 'B1/1500VA', 'B1', '1500VA', 2000),
(10, 'R3/900VA', 'R3', '900VA', 1400),
(13, 'R1/450VA', 'R1', '450VA', 1000),
(16, 'R3/1300VA', 'R3', '1300VA', 1500);

-- --------------------------------------------------------

--
-- Struktur untuk view `qw_pembayaran`
--
DROP TABLE IF EXISTS `qw_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_pembayaran`  AS  select `pembayaran`.`id_pembayaran` AS `id_pembayaran`,`pembayaran`.`id_pelanggan` AS `id_pelanggan`,`pembayaran`.`tgl_bayar` AS `tgl_bayar`,`pembayaran`.`waktu_bayar` AS `waktu_bayar`,`pembayaran`.`bulan_bayar` AS `bulan_bayar`,`pembayaran`.`tahun_bayar` AS `tahun_bayar`,`pembayaran`.`jumlah_bayar` AS `jumlah_bayar`,`pembayaran`.`biaya_admin` AS `biaya_admin`,`pembayaran`.`total_akhir` AS `total_akhir`,`pembayaran`.`bayar` AS `bayar`,`pembayaran`.`kembali` AS `kembali`,`pembayaran`.`id_agen` AS `id_agen`,`pelanggan`.`nama` AS `nama_pelanggan`,`agen`.`nama` AS `nama_agen` from ((`pembayaran` join `pelanggan` on((`pelanggan`.`id_pelanggan` = `pembayaran`.`id_pelanggan`))) join `agen` on((`agen`.`id_agen` = `pembayaran`.`id_agen`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `qw_penggunaan`
--
DROP TABLE IF EXISTS `qw_penggunaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_penggunaan`  AS  select `penggunaan`.`id_penggunaan` AS `id_penggunaan`,`penggunaan`.`id_pelanggan` AS `id_pelanggan`,`penggunaan`.`bulan` AS `bulan`,`penggunaan`.`tahun` AS `tahun`,`penggunaan`.`meter_awal` AS `meter_awal`,`penggunaan`.`meter_akhir` AS `meter_akhir`,`penggunaan`.`tgl_cek` AS `tgl_cek`,`penggunaan`.`id_petugas` AS `id_petugas`,`pelanggan`.`nama` AS `nama_pelanggan`,`petugas`.`nama` AS `nama_petugas` from ((`penggunaan` join `pelanggan` on((`penggunaan`.`id_pelanggan` = `pelanggan`.`id_pelanggan`))) join `petugas` on((`penggunaan`.`id_petugas` = `petugas`.`id_petugas`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `qw_tagihan`
--
DROP TABLE IF EXISTS `qw_tagihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_tagihan`  AS  select `tagihan`.`id_tagihan` AS `id_tagihan`,`tagihan`.`id_pelanggan` AS `id_pelanggan`,`tagihan`.`bulan` AS `bulan`,`tagihan`.`tahun` AS `tahun`,`tagihan`.`jumlah_meter` AS `jumlah_meter`,`tagihan`.`tarif_perkwh` AS `tarif_perkwh`,`tagihan`.`jumlah_bayar` AS `jumlah_bayar`,`tagihan`.`status` AS `status`,`tagihan`.`id_petugas` AS `id_petugas`,`pelanggan`.`nama` AS `nama_pelanggan`,`pelanggan`.`id_tarif` AS `id_tarif`,`petugas`.`nama` AS `nama_petugas` from ((`tagihan` join `pelanggan` on((`pelanggan`.`id_pelanggan` = `tagihan`.`id_pelanggan`))) join `petugas` on((`petugas`.`id_petugas` = `tagihan`.`id_petugas`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agen`
--
ALTER TABLE `agen`
  ADD PRIMARY KEY (`id_agen`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD PRIMARY KEY (`id_penggunaan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indeks untuk tabel `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id_tarif`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `tarif`
--
ALTER TABLE `tarif`
  MODIFY `id_tarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
