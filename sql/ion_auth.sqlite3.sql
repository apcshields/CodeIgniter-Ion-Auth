-- I modified this to give the table names the 'ion_' prefix. -AS 120321
-- Also, I changed the '#' at the beginning of comment lines to '--', which is the SQLite version. -AS 120321
-- Removed all uses of 'unsigned', since that isn't recognized by SQLite. -AS 120321
-- Split certain 'INSERT' lines into two so that SQLite could handle them. -AS 120321
-- Changed 'AUTO_INCREMENT' to 'PRIMARY KEY AUTOINCREMENT'. -AS 120321
-- Changed 'mediumint(8)', 'int(10)', 'int(11)' to 'INTEGER', 'tinyint(1)' to 'BOOLEAN' and 'varchar(*)' to 'TEXT'. -AS 120321
-- Removed 'PRIMARY KEY (`id`)' from end of table definition, as this is now superfluous. -AS 120321
-- Changed "INET_ATON('12.0.0.1')" to equivalent "'2130706433'", since SQLite does not support that function. -AS 120321

DROP TABLE IF EXISTS `ion_groups`;

--
-- Table structure for table 'groups'
--

CREATE TABLE `ion_groups` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL,
  `description` TEXT NOT NULL
);

--
-- Dumping data for table 'groups'
--

INSERT INTO `ion_groups` (`id`, `name`, `description`) VALUES
	(1,'admin','Administrator');
INSERT INTO `ion_groups` (`id`, `name`, `description`) VALUES
	(2,'members','General User');



DROP TABLE IF EXISTS `ion_users`;

--
-- Table structure for table 'users'
--

CREATE TABLE `ion_users` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `ip_address` INTEGER NOT NULL,
  `username` TEXT NOT NULL,
  `password` TEXT NOT NULL,
  `salt` TEXT DEFAULT NULL,
  `email` TEXT NOT NULL,
  `activation_code` TEXT DEFAULT NULL,
  `forgotten_password_code` TEXT DEFAULT NULL,
  `remember_code` TEXT DEFAULT NULL,
  `created_on` INTEGER NOT NULL,
  `last_login` INTEGER DEFAULT NULL,
  `active` BOOLEAN DEFAULT NULL,
  `first_name` TEXT DEFAULT NULL,
  `last_name` TEXT DEFAULT NULL,
  `company` TEXT DEFAULT NULL,
  `phone` TEXT DEFAULT NULL
);


--
-- Dumping data for table 'users'
--

INSERT INTO `ion_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
	('1','2130706433','administrator','59beecdf7fc966e2f17fd8f65a4a9aeb09d4a3d4','9462e8eee0','admin@admin.com','',NULL,'1268889823','1268889823','1', 'Admin','istrator','ADMIN','0');


DROP TABLE IF EXISTS `ion_users_groups`;

--
-- Table structure for table 'groups'
--

CREATE TABLE `ion_users_groups` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `user_id` INTEGER NOT NULL,
  `group_id` INTEGER NOT NULL
);

INSERT INTO `ion_users_groups` (`id`, `user_id`, `group_id`) VALUES
	(1,1,1);
INSERT INTO `ion_users_groups` (`id`, `user_id`, `group_id`) VALUES
	(2,1,2);