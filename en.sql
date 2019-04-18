--[EN]

USE databaseName;

CREATE TABLE IF NOT EXISTS `user_whitelist` (
  `identifier` VARCHAR(25) CHARACTER SET utf8 NOT NULL,
  `whitelisted` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;


