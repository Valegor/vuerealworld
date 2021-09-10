-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 10, 2021 at 09:48 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realworld`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `slug`, `title`, `description`, `body`, `created_at`, `updated_at`) VALUES
(1, 3, 'article1', 'slug1', 'desc1', 'body1', '2021-09-08 16:25:37', '2021-09-28 16:25:37'),
(3, 3, 'article2', 'slug2', 'desc2', 'body2', '2021-09-08 16:25:37', '2021-09-28 16:25:37'),
(4, 23, 'test-article-1', 'test article', 'test desc', 'oewyrpoweeworopewjr edited', '2021-09-09 16:36:39', '2021-09-09 16:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_tag`
--

INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES
(1, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `article_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'comment 1', '2021-09-13 16:27:34', '2021-09-22 16:27:34'),
(2, 3, 1, 'comment 2', '2021-09-15 16:27:34', '2021-09-23 16:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `follower_id` int(10) UNSIGNED NOT NULL,
  `followed_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2017_04_25_201852_create_articles_table', 1),
(3, '2017_04_25_201935_create_comments_table', 1),
(4, '2017_04_25_201944_create_tags_table', 1),
(5, '2017_04_27_200628_create_favorites_table', 1),
(6, '2017_04_27_200850_create_follows_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'tag 1', NULL, NULL),
(2, 'tag 2', NULL, NULL),
(3, 'tag1', '2021-09-09 16:36:39', '2021-09-09 16:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `bio`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Valegor69', 'medifit2000@yandex.ru', '$2y$10$jSpifq9xz1NiizRAJ/RAR.9R3AEQitw5WFVYEEwU45xz/cdcjCDEe', NULL, NULL, NULL, '2021-09-06 10:35:16', '2021-09-06 10:35:16'),
(4, 'Valegor699', 'medifit2000@yandex.ri', '$2y$10$Osq1iS/fAUwbVmojyaPKC.8iVQIUwESn47ZT4EAR3cPoXSmF23WMe', NULL, NULL, NULL, '2021-09-06 10:36:10', '2021-09-06 10:36:10'),
(15, 'test', 'trst@test.com', '$2y$10$cKkhzVtre5k1LpBJOqCaFuLp9PZwAuwuRmqZSUO3gwusPX8W/YlKC', NULL, NULL, NULL, '2021-09-07 07:13:01', '2021-09-07 07:13:01'),
(20, 'testuser', 'testuser@mail.ru', '$2y$10$xnyl9v4ee4jO2qFJ6f305eRTVvAuEDfMnlt.3ZahmbEgHslRmLN3q', NULL, NULL, NULL, '2021-09-07 09:16:52', '2021-09-07 09:16:52'),
(21, '77ewqwe', '77test@mail.ru', '$2y$10$OgwrImi6zxYKQXG.V4BlZ.R6ReWj/9BRXaXiLkqpWI5rIHu2Tt5cO', NULL, NULL, NULL, '2021-09-07 09:54:08', '2021-09-07 09:54:08'),
(22, 'Katya', 'katya@mail.ru', '$2y$10$iu.2ZqPsoD93Gw0yrKJIm.CTWUU4dv/st1NrKUC/THhLc0r4qkEpi', NULL, NULL, NULL, '2021-09-07 12:51:34', '2021-09-07 12:51:34'),
(23, 'testuser1', 'test1@mail.ru', '$2y$10$Bs9.dmmtEBDwAZ6LA6I06uP6EUw6GrrFTVQCHmdWShyn1eAXiStoW', NULL, NULL, NULL, '2021-09-09 06:34:31', '2021-09-09 06:34:31'),
(24, 'test2', 'test2@mail.ru', '$2y$10$KOOphquJC2bh47VaxvF2IuBF2I39bXi5HXen0qrrteWjrJVXIzoaK', NULL, NULL, NULL, '2021-09-09 07:43:46', '2021-09-09 07:43:46'),
(25, 'test3', 'test3@mail.ru', '$2y$10$lYhiz5B/6WrLGLzmLwLjiOYyT.i088P72jzPoHsygLhTXnJGPfZtS', NULL, NULL, NULL, '2021-09-09 07:48:22', '2021-09-09 07:48:22'),
(26, 'test17', 'test17@mail.ru', '$2y$10$oT4VlIWHp5oV9qznqSoK1O0ZyofNaGzHlG2wl7cbVK0wTtkXZqxIa', NULL, NULL, NULL, '2021-09-09 08:03:07', '2021-09-09 08:03:07'),
(27, '5755werweqweqweqwe', 'q55werereqweqwetest@mail.ru', '$2y$10$P46JI7Vz17J7YBTwSGDxC.CXi1xn420XAuMWo2JqhJ/ECRXfNrco6', NULL, NULL, NULL, '2021-09-09 15:41:13', '2021-09-09 15:41:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`),
  ADD KEY `articles_user_id_foreign` (`user_id`);

--
-- Indexes for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `article_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_article_id_foreign` (`article_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`user_id`,`article_id`),
  ADD KEY `favorites_article_id_foreign` (`article_id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`follower_id`,`followed_id`),
  ADD KEY `follows_followed_id_foreign` (`followed_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_email_unique` (`username`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD CONSTRAINT `article_tag_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_followed_id_foreign` FOREIGN KEY (`followed_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
