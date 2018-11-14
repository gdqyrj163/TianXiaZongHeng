/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tianxiazongheng

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-14 15:47:10
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `groupid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `introduce` varchar(100) NOT NULL,
  `master` bigint(20) NOT NULL,
  `image` mediumtext NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `master` (`master`),
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`master`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for `groupchat`
-- ----------------------------
DROP TABLE IF EXISTS `groupchat`;
CREATE TABLE `groupchat` (
  `userid` bigint(20) NOT NULL,
  `groupid` bigint(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `lasttime` time NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupchat
-- ----------------------------

-- ----------------------------
-- Table structure for `groupnotice`
-- ----------------------------
DROP TABLE IF EXISTS `groupnotice`;
CREATE TABLE `groupnotice` (
  `userid` bigint(20) NOT NULL,
  `noticeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `operation` tinyint(1) NOT NULL,
  `source` varchar(20) NOT NULL,
  `target` varchar(20) NOT NULL,
  `result` tinyint(1) NOT NULL,
  `time` varchar(20) NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`),
  CONSTRAINT `groupnotice_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupnotice
-- ----------------------------

-- ----------------------------
-- Table structure for `group_user`
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `groupid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  PRIMARY KEY (`groupid`,`userid`),
  KEY `FK_Reference_3` (`userid`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`groupid`) REFERENCES `group` (`groupid`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user
-- ----------------------------

-- ----------------------------
-- Table structure for `identification`
-- ----------------------------
DROP TABLE IF EXISTS `identification`;
CREATE TABLE `identification` (
  `userid` bigint(20) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identification
-- ----------------------------

-- ----------------------------
-- Table structure for `maps`
-- ----------------------------
DROP TABLE IF EXISTS `maps`;
CREATE TABLE `maps` (
  `userid` bigint(20) NOT NULL,
  `longtude` float(10,6) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maps
-- ----------------------------

-- ----------------------------
-- Table structure for `privatechat`
-- ----------------------------
DROP TABLE IF EXISTS `privatechat`;
CREATE TABLE `privatechat` (
  `aimid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `lasttime` time NOT NULL,
  PRIMARY KEY (`aimid`),
  KEY `FK_Reference_5` (`userid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privatechat
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `address` varchar(50) NOT NULL DEFAULT 'noAddress',
  `image` mediumtext NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=123457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('123456', 'admin', 'admin@admin.com', 'admin', 'admin', 'default.jpg');
