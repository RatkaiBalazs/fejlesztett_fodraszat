-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 16. 19:05
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `barbershop`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ertesitesek`
--

CREATE TABLE `ertesitesek` (
  `id` int(11) NOT NULL,
  `cimzett_id` int(11) NOT NULL,
  `cimzett_tipus` enum('fodrasz','ugyfel') NOT NULL,
  `uzenet` text NOT NULL,
  `olvasva` tinyint(1) DEFAULT 0,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `ertesitesek`
--

INSERT INTO `ertesitesek` (`id`, `cimzett_id`, `cimzett_tipus`, `uzenet`, `olvasva`, `datum`) VALUES
(1, 1, 'fodrasz', 'Teszt Elek lemondta a 2026-01-13 11:40:00 időpontot.', 1, '2026-01-12 14:38:34'),
(2, 1, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-13 18:40:00 időpontodat.', 1, '2026-01-12 14:41:54'),
(3, 1, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-14 16:40:00 időpontodat.', 1, '2026-01-12 14:42:01'),
(4, 1, 'fodrasz', 'Teszt Elek lemondta a 2026-01-13 12:00:00 időpontot.', 1, '2026-01-12 15:01:53'),
(5, 1, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-14 16:00:00 időpontodat.', 1, '2026-01-12 15:02:20'),
(6, 1, 'fodrasz', 'Teszt Janos lemondta a 2026-01-13 10:30:00 időpontot.', 1, '2026-01-12 19:38:04'),
(7, 12, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-14 09:40:00 időpontodat.', 1, '2026-01-12 19:38:51'),
(8, 1, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-14 16:50:00 időpontodat.', 1, '2026-01-14 16:58:58'),
(9, 1, 'fodrasz', 'Teszt Elek lemondta a 2026-01-16 14:20:00 időpontot.', 1, '2026-01-15 08:25:31'),
(10, 1, 'fodrasz', 'Teszt Elek lemondta a 2026-01-16 10:15:00 időpontot.', 1, '2026-01-15 08:25:34'),
(11, 1, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-15 09:10:00 időpontodat.', 1, '2026-01-15 15:03:43'),
(12, 1, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-15 16:30:00 időpontodat.', 1, '2026-01-15 15:39:27'),
(13, 1, 'ugyfel', 'Sajnáljuk, a fodrász lemondta a 2026-01-15 17:00:00 időpontodat.', 1, '2026-01-15 16:08:58');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fodraszok`
--

CREATE TABLE `fodraszok` (
  `Fodrasz_ID` int(11) NOT NULL,
  `Fodrasz_Nev` varchar(50) NOT NULL,
  `Fodrasz_Spec` varchar(50) NOT NULL,
  `jelszo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fodraszok`
--

INSERT INTO `fodraszok` (`Fodrasz_ID`, `Fodrasz_Nev`, `Fodrasz_Spec`, `jelszo`) VALUES
(1, 'Kovács Dávid', 'Master Barber', '123'),
(2, 'Nagy Aliz', 'Szakáll Specialista', '123'),
(3, 'Szabó Péter', 'Modern Stylist', '123');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `idopont`
--

CREATE TABLE `idopont` (
  `Idopont_ID` int(11) NOT NULL,
  `Ugyfel_ID` int(11) NOT NULL,
  `Fodrasz_ID` int(11) NOT NULL,
  `Kezdes` datetime DEFAULT NULL,
  `Befejezes` datetime DEFAULT NULL,
  `Statusz` char(2) NOT NULL,
  `letrehozas_datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `idopont`
--

INSERT INTO `idopont` (`Idopont_ID`, `Ugyfel_ID`, `Fodrasz_ID`, `Kezdes`, `Befejezes`, `Statusz`, `letrehozas_datum`) VALUES
(15, 1, 1, '2026-01-08 10:00:00', '2026-01-08 10:30:00', 'F', '2026-01-13 17:06:07'),
(17, 11, 2, '2026-01-13 09:04:00', '2026-01-13 09:24:00', 'F', '2026-01-13 17:06:07'),
(20, 1, 2, '2026-01-12 12:30:00', '2026-01-12 13:30:00', 'F', '2026-01-13 17:06:07'),
(30, 1, 1, '2026-01-13 19:10:00', '2026-01-13 19:40:00', 'F', '2026-01-13 17:09:21'),
(37, 1, 1, '2026-01-15 18:00:00', '2026-01-15 18:30:00', 'F', '2026-01-14 16:59:45'),
(68, 1, 1, '2026-01-15 17:30:00', '2026-01-15 17:45:00', 'F', '2026-01-15 16:09:40');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kapcsolotabla`
--

CREATE TABLE `kapcsolotabla` (
  `Idopont_ID` int(11) NOT NULL,
  `Szolgaltatas_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kapcsolotabla`
--

INSERT INTO `kapcsolotabla` (`Idopont_ID`, `Szolgaltatas_ID`) VALUES
(15, 1),
(17, 5),
(20, 4),
(30, 1),
(37, 1),
(68, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szolgaltatas`
--

CREATE TABLE `szolgaltatas` (
  `Szolgaltatas_ID` int(11) NOT NULL,
  `Szolgaltatas_Nev` varchar(50) NOT NULL,
  `Szolgaltatas_Ido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `szolgaltatas`
--

INSERT INTO `szolgaltatas` (`Szolgaltatas_ID`, `Szolgaltatas_Nev`, `Szolgaltatas_Ido`) VALUES
(1, 'Hajvágás', 30),
(2, 'Szakáll vágás', 15),
(3, 'Szakáll + Hajvágás', 45),
(4, 'Hajfestés', 60),
(5, 'Igazítás', 20);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ugyfel`
--

CREATE TABLE `ugyfel` (
  `Ugyfel_ID` int(11) NOT NULL,
  `Ugyfel_Nev` varchar(50) NOT NULL,
  `Ugyfel_Email` varchar(50) NOT NULL,
  `Ugyfel_Telszam` varchar(30) NOT NULL,
  `Ugyfel_jelszo1` varchar(50) NOT NULL,
  `Ugyfel_jelszo2` varchar(50) NOT NULL
) ;

--
-- A tábla adatainak kiíratása `ugyfel`
--

INSERT INTO `ugyfel` (`Ugyfel_ID`, `Ugyfel_Nev`, `Ugyfel_Email`, `Ugyfel_Telszam`, `Ugyfel_jelszo1`, `Ugyfel_jelszo2`) VALUES
(1, 'Teszt Elek', 'teszt@proba.hu', '+36 30 111 1212', 'titkosjelszo123', 'titkosjelszo123'),
(2, 'Teszt Elek', 'teszt@email.com', '+36 30 123 1111 ', 'Teszt1234', 'Teszt1234'),
(3, 'Pelda Janos', 'pelda@email.com', '+36 30 123 0000', 'Pelda1234', 'Pelda1234'),
(5, 'Kis Janos', 'kisT@gmail.com', '+36 30 103 4444', 'Titkos12', 'Titkos12'),
(9, 'Ratkai Balazs', 'ratkai@gmail.com', '+36 30 234 1111', 'Ratkai20', 'Ratkai20'),
(11, 'Ratkai David', 'ratda@gmail.com', '+36 30 123 1111', '1234567', '1234567');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `velemenyek`
--

CREATE TABLE `velemenyek` (
  `Velemeny_ID` int(11) NOT NULL,
  `Ugyfel_ID` int(11) NOT NULL,
  `Fodrasz_Neve` varchar(50) NOT NULL,
  `Szoveges_velemeny` varchar(200) DEFAULT NULL,
  `Ertekeles` smallint(6) NOT NULL,
  `Datum` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `velemenyek`
--

INSERT INTO `velemenyek` (`Velemeny_ID`, `Ugyfel_ID`, `Fodrasz_Neve`, `Szoveges_velemeny`, `Ertekeles`, `Datum`) VALUES
(1, 1, 'Kovács Dávid', 'Ugyes volt', 4, '2026-01-16 18:36:52'),
(2, 1, 'Kovács Dávid', 'De nem sikerult a legjibban ', 2, '2026-01-16 18:38:31');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ertesitesek`
--
ALTER TABLE `ertesitesek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `fodraszok`
--
ALTER TABLE `fodraszok`
  ADD PRIMARY KEY (`Fodrasz_ID`);

--
-- A tábla indexei `idopont`
--
ALTER TABLE `idopont`
  ADD PRIMARY KEY (`Idopont_ID`),
  ADD KEY `Fodrasz_ID` (`Fodrasz_ID`),
  ADD KEY `Ugyfel_ID` (`Ugyfel_ID`);

--
-- A tábla indexei `kapcsolotabla`
--
ALTER TABLE `kapcsolotabla`
  ADD KEY `Idopont_ID` (`Idopont_ID`),
  ADD KEY `Szolgaltatas_ID` (`Szolgaltatas_ID`);

--
-- A tábla indexei `szolgaltatas`
--
ALTER TABLE `szolgaltatas`
  ADD PRIMARY KEY (`Szolgaltatas_ID`);

--
-- A tábla indexei `ugyfel`
--
ALTER TABLE `ugyfel`
  ADD PRIMARY KEY (`Ugyfel_ID`);

--
-- A tábla indexei `velemenyek`
--
ALTER TABLE `velemenyek`
  ADD PRIMARY KEY (`Velemeny_ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ertesitesek`
--
ALTER TABLE `ertesitesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `fodraszok`
--
ALTER TABLE `fodraszok`
  MODIFY `Fodrasz_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `idopont`
--
ALTER TABLE `idopont`
  MODIFY `Idopont_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT a táblához `szolgaltatas`
--
ALTER TABLE `szolgaltatas`
  MODIFY `Szolgaltatas_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `ugyfel`
--
ALTER TABLE `ugyfel`
  MODIFY `Ugyfel_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `velemenyek`
--
ALTER TABLE `velemenyek`
  MODIFY `Velemeny_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `idopont`
--
ALTER TABLE `idopont`
  ADD CONSTRAINT `idopont_ibfk_1` FOREIGN KEY (`Fodrasz_ID`) REFERENCES `fodraszok` (`Fodrasz_ID`),
  ADD CONSTRAINT `idopont_ibfk_2` FOREIGN KEY (`Ugyfel_ID`) REFERENCES `ugyfel` (`Ugyfel_ID`);

--
-- Megkötések a táblához `kapcsolotabla`
--
ALTER TABLE `kapcsolotabla`
  ADD CONSTRAINT `kapcsolotabla_ibfk_1` FOREIGN KEY (`Idopont_ID`) REFERENCES `idopont` (`Idopont_ID`),
  ADD CONSTRAINT `kapcsolotabla_ibfk_2` FOREIGN KEY (`Szolgaltatas_ID`) REFERENCES `szolgaltatas` (`Szolgaltatas_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
