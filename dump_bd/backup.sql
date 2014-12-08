-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: drupal.go
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Label of the action.',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores action information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `actions` VALUES ('comment_publish_action','comment','comment_publish_action','','Publish comment'),('comment_save_action','comment','comment_save_action','','Save comment'),('comment_unpublish_action','comment','comment_unpublish_action','','Unpublish comment'),('node_make_sticky_action','node','node_make_sticky_action','','Make content sticky'),('node_make_unsticky_action','node','node_make_unsticky_action','','Make content unsticky'),('node_promote_action','node','node_promote_action','','Promote content to front page'),('node_publish_action','node','node_publish_action','','Publish content'),('node_save_action','node','node_save_action','','Save content'),('node_unpromote_action','node','node_unpromote_action','','Remove content from front page'),('node_unpublish_action','node','node_unpublish_action','','Unpublish content'),('pathauto_node_update_action','node','pathauto_node_update_action','','Update node alias'),('pathauto_taxonomy_term_update_action','taxonomy_term','pathauto_taxonomy_term_update_action','','Update taxonomy term alias'),('pathauto_user_update_action','user','pathauto_user_update_action','','Update user alias'),('system_block_ip_action','user','system_block_ip_action','','Ban IP address of current user'),('user_block_user_action','user','user_block_user_action','','Block current user');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `authmap`
--

DROP TABLE IF EXISTS `authmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique authmap ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'User’s users.uid.',
  `authname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Unique authentication name.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'Module which is controlling the authentication.',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores distributed authentication mapping.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmap`
--

LOCK TABLES `authmap` WRITE;
/*!40000 ALTER TABLE `authmap` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authmap` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` int(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.',
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores details about batches (processes that run in...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the "Pages" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on "visibility" setting.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='Stores block settings, such as region and visibility...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `block` VALUES (1,'system','main','bartik',1,0,'content',0,0,'','',-1),(2,'search','form','bartik',1,-1,'sidebar_first',0,0,'','',-1),(3,'node','recent','seven',1,10,'dashboard_main',0,0,'','',-1),(4,'user','login','bartik',1,0,'sidebar_first',0,0,'','',-1),(5,'system','navigation','bartik',1,0,'sidebar_first',0,0,'','',-1),(6,'system','powered-by','bartik',1,10,'footer',0,0,'','',-1),(7,'system','help','bartik',1,0,'help',0,0,'','',-1),(8,'system','main','seven',1,0,'content',0,0,'','',-1),(9,'system','help','seven',1,0,'help',0,0,'','',-1),(10,'user','login','seven',1,10,'content',0,0,'','',-1),(11,'user','new','seven',1,0,'dashboard_sidebar',0,0,'','',-1),(12,'search','form','seven',1,-10,'dashboard_sidebar',0,0,'','',-1),(13,'comment','recent','bartik',0,0,'-1',0,0,'','',1),(14,'node','syndicate','bartik',0,0,'-1',0,0,'','',-1),(15,'node','recent','bartik',0,0,'-1',0,0,'','',1),(16,'shortcut','shortcuts','bartik',0,0,'-1',0,0,'','',-1),(17,'system','management','bartik',0,0,'-1',0,0,'','',-1),(18,'system','user-menu','bartik',0,0,'-1',0,0,'','',-1),(19,'system','main-menu','bartik',0,0,'-1',0,0,'','',-1),(20,'user','new','bartik',0,0,'-1',0,0,'','',1),(21,'user','online','bartik',0,0,'-1',0,0,'','',-1),(22,'comment','recent','seven',1,0,'dashboard_inactive',0,0,'','',1),(23,'node','syndicate','seven',0,0,'-1',0,0,'','',-1),(24,'shortcut','shortcuts','seven',0,0,'-1',0,0,'','',-1),(25,'system','powered-by','seven',0,10,'-1',0,0,'','',-1),(26,'system','navigation','seven',0,0,'-1',0,0,'','',-1),(27,'system','management','seven',0,0,'-1',0,0,'','',-1),(28,'system','user-menu','seven',0,0,'-1',0,0,'','',-1),(29,'system','main-menu','seven',0,0,'-1',0,0,'','',-1),(30,'user','online','seven',1,0,'dashboard_inactive',0,0,'','',-1),(31,'menu','features','bartik',0,0,'-1',0,0,'','',-1),(32,'menu','features','seven',0,0,'-1',0,0,'','',-1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `block_custom`
--

DROP TABLE IF EXISTS `block_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_custom` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The block’s block.bid.',
  `body` longtext COMMENT 'Block contents.',
  `info` varchar(128) NOT NULL DEFAULT '' COMMENT 'Block description.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the block body.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores contents of custom-made blocks.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_custom`
--

LOCK TABLES `block_custom` WRITE;
/*!40000 ALTER TABLE `block_custom` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `block_custom` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `block_node_type`
--

DROP TABLE IF EXISTS `block_node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_node_type` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.',
  PRIMARY KEY (`module`,`delta`,`type`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up display criteria for blocks based on content types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_node_type`
--

LOCK TABLES `block_node_type` WRITE;
/*!40000 ALTER TABLE `block_node_type` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `block_node_type` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `block_role`
--

DROP TABLE IF EXISTS `block_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_role` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `rid` int(10) unsigned NOT NULL COMMENT 'The user’s role ID from users_roles.rid.',
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up access permissions for blocks based on user roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_role`
--

LOCK TABLES `block_role` WRITE;
/*!40000 ALTER TABLE `block_role` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `block_role` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `blocked_ips`
--

DROP TABLE IF EXISTS `blocked_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_ips` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` varchar(40) NOT NULL DEFAULT '' COMMENT 'IP address',
  PRIMARY KEY (`iid`),
  KEY `blocked_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores blocked IP addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_ips`
--

LOCK TABLES `blocked_ips` WRITE;
/*!40000 ALTER TABLE `blocked_ips` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blocked_ips` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_block`
--

DROP TABLE IF EXISTS `cache_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Block module to store already built...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_block`
--

LOCK TABLES `cache_block` WRITE;
/*!40000 ALTER TABLE `cache_block` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_block` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_bootstrap`
--

DROP TABLE IF EXISTS `cache_bootstrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_bootstrap` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for data required to bootstrap Drupal, may be...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_bootstrap`
--

LOCK TABLES `cache_bootstrap` WRITE;
/*!40000 ALTER TABLE `cache_bootstrap` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_bootstrap` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_field`
--

DROP TABLE IF EXISTS `cache_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_field` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Field module to store already built...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_field`
--

LOCK TABLES `cache_field` WRITE;
/*!40000 ALTER TABLE `cache_field` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_field` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_filter`
--

DROP TABLE IF EXISTS `cache_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Filter module to store already...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_filter`
--

LOCK TABLES `cache_filter` WRITE;
/*!40000 ALTER TABLE `cache_filter` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_filter` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_form`
--

DROP TABLE IF EXISTS `cache_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the form system to store recently built...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_form`
--

LOCK TABLES `cache_form` WRITE;
/*!40000 ALTER TABLE `cache_form` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_form` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_image`
--

DROP TABLE IF EXISTS `cache_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_image` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store information about image...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_image`
--

LOCK TABLES `cache_image` WRITE;
/*!40000 ALTER TABLE `cache_image` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_image` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_menu`
--

DROP TABLE IF EXISTS `cache_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the menu system to store router...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_menu`
--

LOCK TABLES `cache_menu` WRITE;
/*!40000 ALTER TABLE `cache_menu` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cache_menu` VALUES ('menu_custom','a:5:{s:8:\"features\";a:3:{s:9:\"menu_name\";s:8:\"features\";s:5:\"title\";s:8:\"Features\";s:11:\"description\";s:36:\"Menu items for any enabled features.\";}s:9:\"main-menu\";a:3:{s:9:\"menu_name\";s:9:\"main-menu\";s:5:\"title\";s:9:\"Main menu\";s:11:\"description\";s:115:\"The <em>Main</em> menu is used on many sites to show the major sections of the site, often in a top navigation bar.\";}s:10:\"management\";a:3:{s:9:\"menu_name\";s:10:\"management\";s:5:\"title\";s:10:\"Management\";s:11:\"description\";s:69:\"The <em>Management</em> menu contains links for administrative tasks.\";}s:10:\"navigation\";a:3:{s:9:\"menu_name\";s:10:\"navigation\";s:5:\"title\";s:10:\"Navigation\";s:11:\"description\";s:150:\"The <em>Navigation</em> menu contains links intended for site visitors. Links are added to the <em>Navigation</em> menu automatically by some modules.\";}s:9:\"user-menu\";a:3:{s:9:\"menu_name\";s:9:\"user-menu\";s:5:\"title\";s:9:\"User menu\";s:11:\"description\";s:99:\"The <em>User</em> menu contains links related to the user\'s account, as well as the \'Log out\' link.\";}}',0,1418056311,1);
/*!40000 ALTER TABLE `cache_menu` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_page`
--

DROP TABLE IF EXISTS `cache_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store compressed pages for anonymous...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_page`
--

LOCK TABLES `cache_page` WRITE;
/*!40000 ALTER TABLE `cache_page` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_page` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_panels`
--

DROP TABLE IF EXISTS `cache_panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_panels` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_panels`
--

LOCK TABLES `cache_panels` WRITE;
/*!40000 ALTER TABLE `cache_panels` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_panels` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_path`
--

DROP TABLE IF EXISTS `cache_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_path` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for path alias lookup.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_path`
--

LOCK TABLES `cache_path` WRITE;
/*!40000 ALTER TABLE `cache_path` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_path` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_token`
--

DROP TABLE IF EXISTS `cache_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_token` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for token information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_token`
--

LOCK TABLES `cache_token` WRITE;
/*!40000 ALTER TABLE `cache_token` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_token` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ckeditor_input_format`
--

DROP TABLE IF EXISTS `ckeditor_input_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_input_format` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor role',
  `format` varchar(128) NOT NULL DEFAULT '' COMMENT 'Drupal filter format ID',
  PRIMARY KEY (`name`,`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores CKEditor input format assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_input_format`
--

LOCK TABLES `ckeditor_input_format` WRITE;
/*!40000 ALTER TABLE `ckeditor_input_format` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ckeditor_input_format` VALUES ('Advanced','filtered_html'),('Full','full_html');
/*!40000 ALTER TABLE `ckeditor_input_format` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ckeditor_settings`
--

DROP TABLE IF EXISTS `ckeditor_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_settings` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor profile',
  `settings` text COMMENT 'Profile settings',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores CKEditor profile settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_settings`
--

LOCK TABLES `ckeditor_settings` WRITE;
/*!40000 ALTER TABLE `ckeditor_settings` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ckeditor_settings` VALUES ('Advanced','a:27:{s:11:\"filebrowser\";s:4:\"none\";s:11:\"quickupload\";s:1:\"f\";s:2:\"ss\";s:1:\"2\";s:7:\"filters\";a:1:{s:11:\"filter_html\";i:1;}s:7:\"default\";s:1:\"t\";s:11:\"show_toggle\";s:1:\"t\";s:5:\"popup\";s:1:\"f\";s:7:\"toolbar\";s:596:\"\n[\n    [\'Source\'],\n    [\'Cut\',\'Copy\',\'Paste\',\'PasteText\',\'PasteFromWord\',\'-\',\'SpellChecker\', \'Scayt\'],\n    [\'Undo\',\'Redo\',\'Find\',\'Replace\',\'-\',\'SelectAll\'],\n    [\'Image\',\'Media\',\'Flash\',\'Table\',\'HorizontalRule\',\'Smiley\',\'SpecialChar\'],\n    [\'Maximize\', \'ShowBlocks\'],\n    \'/\',\n    [\'Format\'],\n    [\'Bold\',\'Italic\',\'Underline\',\'Strike\',\'-\',\'Subscript\',\'Superscript\',\'-\',\'RemoveFormat\'],\n    [\'NumberedList\',\'BulletedList\',\'-\',\'Outdent\',\'Indent\',\'Blockquote\'],\n    [\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\n    [\'Link\',\'Unlink\',\'Anchor\',\'Linkit\']\n]\n    \";s:6:\"expand\";s:1:\"t\";s:5:\"width\";s:4:\"100%\";s:4:\"lang\";s:2:\"en\";s:9:\"auto_lang\";s:1:\"t\";s:18:\"language_direction\";s:7:\"default\";s:10:\"enter_mode\";s:1:\"p\";s:16:\"shift_enter_mode\";s:2:\"br\";s:11:\"font_format\";s:35:\"p;div;pre;address;h1;h2;h3;h4;h5;h6\";s:13:\"format_source\";s:1:\"t\";s:13:\"format_output\";s:1:\"t\";s:17:\"custom_formatting\";s:1:\"f\";s:10:\"formatting\";a:1:{s:25:\"custom_formatting_options\";a:4:{s:6:\"indent\";s:6:\"indent\";s:15:\"breakBeforeOpen\";s:15:\"breakBeforeOpen\";s:14:\"breakAfterOpen\";s:14:\"breakAfterOpen\";s:15:\"breakAfterClose\";s:15:\"breakAfterClose\";}}s:8:\"css_mode\";s:4:\"none\";s:8:\"css_path\";s:0:\"\";s:11:\"user_choose\";s:1:\"f\";s:20:\"ckeditor_load_method\";s:11:\"ckeditor.js\";s:22:\"ckeditor_load_time_out\";i:0;s:17:\"scayt_autoStartup\";s:1:\"f\";s:13:\"html_entities\";s:1:\"f\";}'),('CKEditor Global Profile','a:1:{s:13:\"ckeditor_path\";s:33:\"//cdn.ckeditor.com/4.4.3/full-all\";}'),('Full','a:27:{s:11:\"filebrowser\";s:4:\"none\";s:11:\"quickupload\";s:1:\"f\";s:2:\"ss\";s:1:\"2\";s:7:\"filters\";a:0:{}s:7:\"default\";s:1:\"t\";s:11:\"show_toggle\";s:1:\"t\";s:5:\"popup\";s:1:\"f\";s:7:\"toolbar\";s:709:\"\n[\n    [\'Source\'],\n    [\'Cut\',\'Copy\',\'Paste\',\'PasteText\',\'PasteFromWord\',\'-\',\'SpellChecker\', \'Scayt\'],\n    [\'Undo\',\'Redo\',\'Find\',\'Replace\',\'-\',\'SelectAll\'],\n    [\'Image\',\'Media\',\'Flash\',\'Table\',\'HorizontalRule\',\'Smiley\',\'SpecialChar\',\'Iframe\'],\n    \'/\',\n    [\'Bold\',\'Italic\',\'Underline\',\'Strike\',\'-\',\'Subscript\',\'Superscript\',\'-\',\'RemoveFormat\'],\n    [\'NumberedList\',\'BulletedList\',\'-\',\'Outdent\',\'Indent\',\'Blockquote\',\'CreateDiv\'],\n    [\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\',\'-\',\'Language\'],\n    [\'Link\',\'Unlink\',\'Anchor\',\'Linkit\'],\n    [\'DrupalBreak\'],\n    \'/\',\n    [\'Format\',\'Font\',\'FontSize\'],\n    [\'TextColor\',\'BGColor\'],\n    [\'Maximize\', \'ShowBlocks\']\n]\n    \";s:6:\"expand\";s:1:\"t\";s:5:\"width\";s:4:\"100%\";s:4:\"lang\";s:2:\"en\";s:9:\"auto_lang\";s:1:\"t\";s:18:\"language_direction\";s:7:\"default\";s:10:\"enter_mode\";s:1:\"p\";s:16:\"shift_enter_mode\";s:2:\"br\";s:11:\"font_format\";s:35:\"p;div;pre;address;h1;h2;h3;h4;h5;h6\";s:13:\"format_source\";s:1:\"t\";s:13:\"format_output\";s:1:\"t\";s:17:\"custom_formatting\";s:1:\"f\";s:10:\"formatting\";a:1:{s:25:\"custom_formatting_options\";a:4:{s:6:\"indent\";s:6:\"indent\";s:15:\"breakBeforeOpen\";s:15:\"breakBeforeOpen\";s:14:\"breakAfterOpen\";s:14:\"breakAfterOpen\";s:15:\"breakAfterClose\";s:15:\"breakAfterClose\";}}s:8:\"css_mode\";s:4:\"none\";s:8:\"css_path\";s:0:\"\";s:11:\"user_choose\";s:1:\"f\";s:20:\"ckeditor_load_method\";s:11:\"ckeditor.js\";s:22:\"ckeditor_load_time_out\";i:0;s:17:\"scayt_autoStartup\";s:1:\"f\";s:13:\"html_entities\";s:1:\"f\";}');
/*!40000 ALTER TABLE `ckeditor_settings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique comment ID.',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` varchar(64) NOT NULL DEFAULT '' COMMENT 'The comment title.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The author’s host name.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` varchar(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` varchar(60) DEFAULT NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` varchar(64) DEFAULT NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this comment.',
  PRIMARY KEY (`cid`),
  KEY `comment_status_pid` (`pid`,`status`),
  KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  KEY `comment_uid` (`uid`),
  KEY `comment_nid_language` (`nid`,`language`),
  KEY `comment_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments and associated data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ctools_css_cache`
--

DROP TABLE IF EXISTS `ctools_css_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_css_cache` (
  `cid` varchar(128) NOT NULL COMMENT 'The CSS ID this cache object belongs to.',
  `filename` varchar(255) DEFAULT NULL COMMENT 'The filename this CSS is stored in.',
  `css` longtext COMMENT 'CSS being stored.',
  `filter` tinyint(4) DEFAULT NULL COMMENT 'Whether or not this CSS needs to be filtered.',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store CSS that must be non-volatile.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctools_css_cache`
--

LOCK TABLES `ctools_css_cache` WRITE;
/*!40000 ALTER TABLE `ctools_css_cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ctools_css_cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ctools_object_cache`
--

DROP TABLE IF EXISTS `ctools_object_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_object_cache` (
  `sid` varchar(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` varchar(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` varchar(32) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` longblob COMMENT 'Serialized data being stored.',
  PRIMARY KEY (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store objects that are being...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctools_object_cache`
--

LOCK TABLES `ctools_object_cache` WRITE;
/*!40000 ALTER TABLE `ctools_object_cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ctools_object_cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `date_format_locale`
--

DROP TABLE IF EXISTS `date_format_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_locale` (
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` varchar(12) NOT NULL COMMENT 'A languages.language for this format to be used with.',
  PRIMARY KEY (`type`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats for each locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_format_locale`
--

LOCK TABLES `date_format_locale` WRITE;
/*!40000 ALTER TABLE `date_format_locale` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `date_format_locale` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `date_format_type`
--

DROP TABLE IF EXISTS `date_format_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_type` (
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` varchar(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this is a system provided format.',
  PRIMARY KEY (`type`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date format types.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_format_type`
--

LOCK TABLES `date_format_type` WRITE;
/*!40000 ALTER TABLE `date_format_type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `date_format_type` VALUES ('long','Long',1),('medium','Medium',1),('short','Short',1);
/*!40000 ALTER TABLE `date_format_type` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.',
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_formats`
--

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `date_formats` VALUES (1,'Y-m-d H:i','short',1),(2,'m/d/Y - H:i','short',1),(3,'d/m/Y - H:i','short',1),(4,'Y/m/d - H:i','short',1),(5,'d.m.Y - H:i','short',1),(6,'m/d/Y - g:ia','short',1),(7,'d/m/Y - g:ia','short',1),(8,'Y/m/d - g:ia','short',1),(9,'M j Y - H:i','short',1),(10,'j M Y - H:i','short',1),(11,'Y M j - H:i','short',1),(12,'M j Y - g:ia','short',1),(13,'j M Y - g:ia','short',1),(14,'Y M j - g:ia','short',1),(15,'D, Y-m-d H:i','medium',1),(16,'D, m/d/Y - H:i','medium',1),(17,'D, d/m/Y - H:i','medium',1),(18,'D, Y/m/d - H:i','medium',1),(19,'F j, Y - H:i','medium',1),(20,'j F, Y - H:i','medium',1),(21,'Y, F j - H:i','medium',1),(22,'D, m/d/Y - g:ia','medium',1),(23,'D, d/m/Y - g:ia','medium',1),(24,'D, Y/m/d - g:ia','medium',1),(25,'F j, Y - g:ia','medium',1),(26,'j F Y - g:ia','medium',1),(27,'Y, F j - g:ia','medium',1),(28,'j. F Y - G:i','medium',1),(29,'l, F j, Y - H:i','long',1),(30,'l, j F, Y - H:i','long',1),(31,'l, Y,  F j - H:i','long',1),(32,'l, F j, Y - g:ia','long',1),(33,'l, j F Y - g:ia','long',1),(34,'l, Y,  F j - g:ia','long',1),(35,'l, j. F Y - G:i','long',1);
/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_config`
--

DROP TABLE IF EXISTS `field_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name` (`field_name`),
  KEY `active` (`active`),
  KEY `storage_active` (`storage_active`),
  KEY `deleted` (`deleted`),
  KEY `module` (`module`),
  KEY `storage_module` (`storage_module`),
  KEY `type` (`type`),
  KEY `storage_type` (`storage_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_config`
--

LOCK TABLES `field_config` WRITE;
/*!40000 ALTER TABLE `field_config` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `field_config` VALUES (1,'comment_body','text_long','text',1,'field_sql_storage','field_sql_storage',1,0,'a:6:{s:12:\"entity_types\";a:1:{i:0;s:7:\"comment\";}s:12:\"translatable\";b:0;s:8:\"settings\";a:0:{}s:7:\"storage\";a:4:{s:4:\"type\";s:17:\"field_sql_storage\";s:8:\"settings\";a:0:{}s:6:\"module\";s:17:\"field_sql_storage\";s:6:\"active\";i:1;}s:12:\"foreign keys\";a:1:{s:6:\"format\";a:2:{s:5:\"table\";s:13:\"filter_format\";s:7:\"columns\";a:1:{s:6:\"format\";s:6:\"format\";}}}s:7:\"indexes\";a:1:{s:6:\"format\";a:1:{i:0;s:6:\"format\";}}}',1,0,0),(2,'body','text_with_summary','text',1,'field_sql_storage','field_sql_storage',1,0,'a:6:{s:12:\"entity_types\";a:1:{i:0;s:4:\"node\";}s:12:\"translatable\";b:0;s:8:\"settings\";a:0:{}s:7:\"storage\";a:4:{s:4:\"type\";s:17:\"field_sql_storage\";s:8:\"settings\";a:0:{}s:6:\"module\";s:17:\"field_sql_storage\";s:6:\"active\";i:1;}s:12:\"foreign keys\";a:1:{s:6:\"format\";a:2:{s:5:\"table\";s:13:\"filter_format\";s:7:\"columns\";a:1:{s:6:\"format\";s:6:\"format\";}}}s:7:\"indexes\";a:1:{s:6:\"format\";a:1:{i:0;s:6:\"format\";}}}',1,0,0),(3,'field_tags','taxonomy_term_reference','taxonomy',1,'field_sql_storage','field_sql_storage',1,0,'a:6:{s:8:\"settings\";a:1:{s:14:\"allowed_values\";a:1:{i:0;a:2:{s:10:\"vocabulary\";s:4:\"tags\";s:6:\"parent\";i:0;}}}s:12:\"entity_types\";a:0:{}s:12:\"translatable\";b:0;s:7:\"storage\";a:4:{s:4:\"type\";s:17:\"field_sql_storage\";s:8:\"settings\";a:0:{}s:6:\"module\";s:17:\"field_sql_storage\";s:6:\"active\";i:1;}s:12:\"foreign keys\";a:1:{s:3:\"tid\";a:2:{s:5:\"table\";s:18:\"taxonomy_term_data\";s:7:\"columns\";a:1:{s:3:\"tid\";s:3:\"tid\";}}}s:7:\"indexes\";a:1:{s:3:\"tid\";a:1:{i:0;s:3:\"tid\";}}}',-1,0,0),(4,'field_image','image','image',1,'field_sql_storage','field_sql_storage',1,0,'a:6:{s:7:\"indexes\";a:1:{s:3:\"fid\";a:1:{i:0;s:3:\"fid\";}}s:8:\"settings\";a:2:{s:10:\"uri_scheme\";s:6:\"public\";s:13:\"default_image\";b:0;}s:7:\"storage\";a:4:{s:4:\"type\";s:17:\"field_sql_storage\";s:8:\"settings\";a:0:{}s:6:\"module\";s:17:\"field_sql_storage\";s:6:\"active\";i:1;}s:12:\"entity_types\";a:0:{}s:12:\"translatable\";b:0;s:12:\"foreign keys\";a:1:{s:3:\"fid\";a:2:{s:5:\"table\";s:12:\"file_managed\";s:7:\"columns\";a:1:{s:3:\"fid\";s:3:\"fid\";}}}}',1,0,0);
/*!40000 ALTER TABLE `field_config` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_config_instance`
--

DROP TABLE IF EXISTS `field_config_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_config_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_config_instance`
--

LOCK TABLES `field_config_instance` WRITE;
/*!40000 ALTER TABLE `field_config_instance` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `field_config_instance` VALUES (1,1,'comment_body','comment','comment_node_page','a:6:{s:5:\"label\";s:7:\"Comment\";s:8:\"settings\";a:2:{s:15:\"text_processing\";i:1;s:18:\"user_register_form\";b:0;}s:8:\"required\";b:1;s:7:\"display\";a:1:{s:7:\"default\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:12:\"text_default\";s:6:\"weight\";i:0;s:8:\"settings\";a:0:{}s:6:\"module\";s:4:\"text\";}}s:6:\"widget\";a:4:{s:4:\"type\";s:13:\"text_textarea\";s:8:\"settings\";a:1:{s:4:\"rows\";i:5;}s:6:\"weight\";i:0;s:6:\"module\";s:4:\"text\";}s:11:\"description\";s:0:\"\";}',0),(2,2,'body','node','page','a:6:{s:5:\"label\";s:4:\"Body\";s:6:\"widget\";a:4:{s:4:\"type\";s:26:\"text_textarea_with_summary\";s:8:\"settings\";a:2:{s:4:\"rows\";i:20;s:12:\"summary_rows\";i:5;}s:6:\"weight\";i:-4;s:6:\"module\";s:4:\"text\";}s:8:\"settings\";a:3:{s:15:\"display_summary\";b:1;s:15:\"text_processing\";i:1;s:18:\"user_register_form\";b:0;}s:7:\"display\";a:2:{s:7:\"default\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:12:\"text_default\";s:8:\"settings\";a:0:{}s:6:\"module\";s:4:\"text\";s:6:\"weight\";i:0;}s:6:\"teaser\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:23:\"text_summary_or_trimmed\";s:8:\"settings\";a:1:{s:11:\"trim_length\";i:600;}s:6:\"module\";s:4:\"text\";s:6:\"weight\";i:0;}}s:8:\"required\";b:0;s:11:\"description\";s:0:\"\";}',0),(3,1,'comment_body','comment','comment_node_article','a:6:{s:5:\"label\";s:7:\"Comment\";s:8:\"settings\";a:2:{s:15:\"text_processing\";i:1;s:18:\"user_register_form\";b:0;}s:8:\"required\";b:1;s:7:\"display\";a:1:{s:7:\"default\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:12:\"text_default\";s:6:\"weight\";i:0;s:8:\"settings\";a:0:{}s:6:\"module\";s:4:\"text\";}}s:6:\"widget\";a:4:{s:4:\"type\";s:13:\"text_textarea\";s:8:\"settings\";a:1:{s:4:\"rows\";i:5;}s:6:\"weight\";i:0;s:6:\"module\";s:4:\"text\";}s:11:\"description\";s:0:\"\";}',0),(4,2,'body','node','article','a:6:{s:5:\"label\";s:4:\"Body\";s:6:\"widget\";a:4:{s:4:\"type\";s:26:\"text_textarea_with_summary\";s:8:\"settings\";a:2:{s:4:\"rows\";i:20;s:12:\"summary_rows\";i:5;}s:6:\"weight\";i:-4;s:6:\"module\";s:4:\"text\";}s:8:\"settings\";a:3:{s:15:\"display_summary\";b:1;s:15:\"text_processing\";i:1;s:18:\"user_register_form\";b:0;}s:7:\"display\";a:2:{s:7:\"default\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:12:\"text_default\";s:8:\"settings\";a:0:{}s:6:\"module\";s:4:\"text\";s:6:\"weight\";i:0;}s:6:\"teaser\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:23:\"text_summary_or_trimmed\";s:8:\"settings\";a:1:{s:11:\"trim_length\";i:600;}s:6:\"module\";s:4:\"text\";s:6:\"weight\";i:0;}}s:8:\"required\";b:0;s:11:\"description\";s:0:\"\";}',0),(5,3,'field_tags','node','article','a:6:{s:5:\"label\";s:4:\"Tags\";s:11:\"description\";s:63:\"Enter a comma-separated list of words to describe your content.\";s:6:\"widget\";a:4:{s:4:\"type\";s:21:\"taxonomy_autocomplete\";s:6:\"weight\";i:-4;s:8:\"settings\";a:2:{s:4:\"size\";i:60;s:17:\"autocomplete_path\";s:21:\"taxonomy/autocomplete\";}s:6:\"module\";s:8:\"taxonomy\";}s:7:\"display\";a:2:{s:7:\"default\";a:5:{s:4:\"type\";s:28:\"taxonomy_term_reference_link\";s:6:\"weight\";i:10;s:5:\"label\";s:5:\"above\";s:8:\"settings\";a:0:{}s:6:\"module\";s:8:\"taxonomy\";}s:6:\"teaser\";a:5:{s:4:\"type\";s:28:\"taxonomy_term_reference_link\";s:6:\"weight\";i:10;s:5:\"label\";s:5:\"above\";s:8:\"settings\";a:0:{}s:6:\"module\";s:8:\"taxonomy\";}}s:8:\"settings\";a:1:{s:18:\"user_register_form\";b:0;}s:8:\"required\";b:0;}',0),(6,4,'field_image','node','article','a:6:{s:5:\"label\";s:5:\"Image\";s:11:\"description\";s:40:\"Upload an image to go with this article.\";s:8:\"required\";b:0;s:8:\"settings\";a:9:{s:14:\"file_directory\";s:11:\"field/image\";s:15:\"file_extensions\";s:16:\"png gif jpg jpeg\";s:12:\"max_filesize\";s:0:\"\";s:14:\"max_resolution\";s:0:\"\";s:14:\"min_resolution\";s:0:\"\";s:9:\"alt_field\";b:1;s:11:\"title_field\";s:0:\"\";s:13:\"default_image\";i:0;s:18:\"user_register_form\";b:0;}s:6:\"widget\";a:4:{s:4:\"type\";s:11:\"image_image\";s:8:\"settings\";a:2:{s:18:\"progress_indicator\";s:8:\"throbber\";s:19:\"preview_image_style\";s:9:\"thumbnail\";}s:6:\"weight\";i:-1;s:6:\"module\";s:5:\"image\";}s:7:\"display\";a:2:{s:7:\"default\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:5:\"image\";s:8:\"settings\";a:2:{s:11:\"image_style\";s:5:\"large\";s:10:\"image_link\";s:0:\"\";}s:6:\"weight\";i:-1;s:6:\"module\";s:5:\"image\";}s:6:\"teaser\";a:5:{s:5:\"label\";s:6:\"hidden\";s:4:\"type\";s:5:\"image\";s:8:\"settings\";a:2:{s:11:\"image_style\";s:6:\"medium\";s:10:\"image_link\";s:7:\"content\";}s:6:\"weight\";i:-1;s:6:\"module\";s:5:\"image\";}}}',0);
/*!40000 ALTER TABLE `field_config_instance` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_data_body`
--

DROP TABLE IF EXISTS `field_data_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_data_body`
--

LOCK TABLES `field_data_body` WRITE;
/*!40000 ALTER TABLE `field_data_body` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_data_body` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_data_comment_body`
--

DROP TABLE IF EXISTS `field_data_comment_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_data_comment_body`
--

LOCK TABLES `field_data_comment_body` WRITE;
/*!40000 ALTER TABLE `field_data_comment_body` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_data_comment_body` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_data_field_image`
--

DROP TABLE IF EXISTS `field_data_field_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_data_field_image`
--

LOCK TABLES `field_data_field_image` WRITE;
/*!40000 ALTER TABLE `field_data_field_image` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_data_field_image` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_data_field_tags`
--

DROP TABLE IF EXISTS `field_data_field_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (field_tags)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_data_field_tags`
--

LOCK TABLES `field_data_field_tags` WRITE;
/*!40000 ALTER TABLE `field_data_field_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_data_field_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_revision_body`
--

DROP TABLE IF EXISTS `field_revision_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 2 (body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_revision_body`
--

LOCK TABLES `field_revision_body` WRITE;
/*!40000 ALTER TABLE `field_revision_body` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_revision_body` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_revision_comment_body`
--

DROP TABLE IF EXISTS `field_revision_comment_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 1 (comment_body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_revision_comment_body`
--

LOCK TABLES `field_revision_comment_body` WRITE;
/*!40000 ALTER TABLE `field_revision_comment_body` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_revision_comment_body` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_revision_field_image`
--

DROP TABLE IF EXISTS `field_revision_field_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 4 (field_image)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_revision_field_image`
--

LOCK TABLES `field_revision_field_image` WRITE;
/*!40000 ALTER TABLE `field_revision_field_image` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_revision_field_image` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `field_revision_field_tags`
--

DROP TABLE IF EXISTS `field_revision_field_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 3 (field_tags)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_revision_field_tags`
--

LOCK TABLES `field_revision_field_tags` WRITE;
/*!40000 ALTER TABLE `field_revision_field_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `field_revision_field_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `file_managed`
--

DROP TABLE IF EXISTS `file_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_managed` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_managed`
--

LOCK TABLES `file_managed` WRITE;
/*!40000 ALTER TABLE `file_managed` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `file_managed` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `file_usage`
--

DROP TABLE IF EXISTS `file_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY (`fid`,`type`,`id`,`module`),
  KEY `type_id` (`type`,`id`),
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track where a file is used.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_usage`
--

LOCK TABLES `file_usage` WRITE;
/*!40000 ALTER TABLE `file_usage` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `file_usage` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.',
  PRIMARY KEY (`format`,`name`),
  KEY `list` (`weight`,`module`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that maps filters (HTML corrector) to text formats ...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter`
--

LOCK TABLES `filter` WRITE;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `filter` VALUES ('filtered_html','filter','filter_autop',2,1,'a:0:{}'),('filtered_html','filter','filter_html',1,1,'a:3:{s:12:\"allowed_html\";s:74:\"<a> <em> <strong> <cite> <blockquote> <code> <ul> <ol> <li> <dl> <dt> <dd>\";s:16:\"filter_html_help\";i:1;s:20:\"filter_html_nofollow\";i:0;}'),('filtered_html','filter','filter_htmlcorrector',10,1,'a:0:{}'),('filtered_html','filter','filter_html_escape',-10,0,'a:0:{}'),('filtered_html','filter','filter_url',0,1,'a:1:{s:17:\"filter_url_length\";i:72;}'),('full_html','filter','filter_autop',1,1,'a:0:{}'),('full_html','filter','filter_html',-10,0,'a:3:{s:12:\"allowed_html\";s:74:\"<a> <em> <strong> <cite> <blockquote> <code> <ul> <ol> <li> <dl> <dt> <dd>\";s:16:\"filter_html_help\";i:1;s:20:\"filter_html_nofollow\";i:0;}'),('full_html','filter','filter_htmlcorrector',10,1,'a:0:{}'),('full_html','filter','filter_html_escape',-10,0,'a:0:{}'),('full_html','filter','filter_url',0,1,'a:1:{s:17:\"filter_url_length\";i:72;}'),('plain_text','filter','filter_autop',2,1,'a:0:{}'),('plain_text','filter','filter_html',-10,0,'a:3:{s:12:\"allowed_html\";s:74:\"<a> <em> <strong> <cite> <blockquote> <code> <ul> <ol> <li> <dl> <dt> <dd>\";s:16:\"filter_html_help\";i:1;s:20:\"filter_html_nofollow\";i:0;}'),('plain_text','filter','filter_htmlcorrector',10,0,'a:0:{}'),('plain_text','filter','filter_html_escape',0,1,'a:0:{}'),('plain_text','filter','filter_url',1,1,'a:1:{s:17:\"filter_url_length\";i:72;}');
/*!40000 ALTER TABLE `filter` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `filter_format`
--

DROP TABLE IF EXISTS `filter_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`),
  KEY `status_weight` (`status`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores text formats: custom groupings of filters, such as...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_format`
--

LOCK TABLES `filter_format` WRITE;
/*!40000 ALTER TABLE `filter_format` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `filter_format` VALUES ('filtered_html','Filtered HTML',1,1,0),('full_html','Full HTML',1,1,1),('plain_text','Plain text',1,1,10);
/*!40000 ALTER TABLE `filter_format` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `flood`
--

DROP TABLE IF EXISTS `flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique flood event ID.',
  `event` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name of event (e.g. contact).',
  `identifier` varchar(128) NOT NULL DEFAULT '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of the event.',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`identifier`,`timestamp`),
  KEY `purge` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flood controls the threshold of events, such as the...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flood`
--

LOCK TABLES `flood` WRITE;
/*!40000 ALTER TABLE `flood` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `flood` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that read the node nid.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid that was read.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp at which the read occurred.',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A record of which users have read which nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `image_effects`
--

DROP TABLE IF EXISTS `image_effects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_effects` (
  `ieid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.',
  PRIMARY KEY (`ieid`),
  KEY `isid` (`isid`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image effects.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_effects`
--

LOCK TABLES `image_effects` WRITE;
/*!40000 ALTER TABLE `image_effects` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `image_effects` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `image_styles`
--

DROP TABLE IF EXISTS `image_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_styles` (
  `isid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style machine name.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The style administrative name.',
  PRIMARY KEY (`isid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image styles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_styles`
--

LOCK TABLES `image_styles` WRITE;
/*!40000 ALTER TABLE `image_styles` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `image_styles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `menu_custom`
--

DROP TABLE IF EXISTS `menu_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title; displayed at top of block.',
  `description` text COMMENT 'Menu description.',
  PRIMARY KEY (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds definitions for top-level custom menus (for example...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_custom`
--

LOCK TABLES `menu_custom` WRITE;
/*!40000 ALTER TABLE `menu_custom` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `menu_custom` VALUES ('features','Features','Menu items for any enabled features.'),('main-menu','Main menu','The <em>Main</em> menu is used on many sites to show the major sections of the site, often in a top navigation bar.'),('management','Management','The <em>Management</em> menu contains links for administrative tasks.'),('navigation','Navigation','The <em>Navigation</em> menu contains links intended for site visitors. Links are added to the <em>Navigation</em> menu automatically by some modules.'),('user-menu','User menu','The <em>User</em> menu contains links related to the user\'s account, as well as the \'Log out\' link.');
/*!40000 ALTER TABLE `menu_custom` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` smallint(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COMMENT='Contains the individual links within a menu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_links`
--

LOCK TABLES `menu_links` WRITE;
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `menu_links` VALUES ('management',1,0,'admin','admin','Administration','a:0:{}','system',0,0,1,0,9,1,0,1,0,0,0,0,0,0,0,0,0),('user-menu',2,0,'user','user','User account','a:1:{s:5:\"alter\";b:1;}','system',0,0,0,0,-10,1,0,2,0,0,0,0,0,0,0,0,0),('management',3,1,'admin/appearance','admin/appearance','Appearance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:33:\"Select and configure your themes.\";}}','system',0,0,0,0,-6,2,0,1,3,0,0,0,0,0,0,0,0),('management',4,1,'admin/config','admin/config','Configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:20:\"Administer settings.\";}}','system',0,0,1,0,0,2,0,1,4,0,0,0,0,0,0,0,0),('user-menu',5,2,'user/register','user/register','Create new account','a:0:{}','system',-1,0,0,0,0,2,0,2,5,0,0,0,0,0,0,0,0),('management',6,1,'admin/index','admin/index','Index','a:0:{}','system',-1,0,0,0,-18,2,0,1,6,0,0,0,0,0,0,0,0),('user-menu',7,2,'user/login','user/login','Log in','a:0:{}','system',-1,0,0,0,0,2,0,2,7,0,0,0,0,0,0,0,0),('user-menu',8,0,'user/logout','user/logout','Log out','a:0:{}','system',0,0,0,0,10,1,0,8,0,0,0,0,0,0,0,0,0),('management',9,1,'admin/modules','admin/modules','Modules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:26:\"Extend site functionality.\";}}','system',0,0,0,0,-2,2,0,1,9,0,0,0,0,0,0,0,0),('navigation',10,0,'user/%','user/%','My account','a:0:{}','system',0,0,1,0,0,1,0,10,0,0,0,0,0,0,0,0,0),('management',11,1,'admin/people','admin/people','People','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:45:\"Manage user accounts, roles, and permissions.\";}}','system',0,0,0,0,-4,2,0,1,11,0,0,0,0,0,0,0,0),('management',12,1,'admin/reports','admin/reports','Reports','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:34:\"View reports, updates, and errors.\";}}','system',0,0,1,0,5,2,0,1,12,0,0,0,0,0,0,0,0),('user-menu',13,2,'user/password','user/password','Request new password','a:0:{}','system',-1,0,0,0,0,2,0,2,13,0,0,0,0,0,0,0,0),('management',14,1,'admin/structure','admin/structure','Structure','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:45:\"Administer blocks, content types, menus, etc.\";}}','system',0,0,1,0,-8,2,0,1,14,0,0,0,0,0,0,0,0),('management',15,1,'admin/tasks','admin/tasks','Tasks','a:0:{}','system',-1,0,0,0,-20,2,0,1,15,0,0,0,0,0,0,0,0),('management',16,11,'admin/people/create','admin/people/create','Add user','a:0:{}','system',-1,0,0,0,0,3,0,1,11,16,0,0,0,0,0,0,0),('navigation',17,10,'user/%/cancel','user/%/cancel','Cancel account','a:0:{}','system',0,0,1,0,0,2,0,10,17,0,0,0,0,0,0,0,0),('management',18,4,'admin/config/content','admin/config/content','Content authoring','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:53:\"Settings related to formatting and authoring content.\";}}','system',0,0,1,0,-15,3,0,1,4,18,0,0,0,0,0,0,0),('management',19,4,'admin/config/development','admin/config/development','Development','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:18:\"Development tools.\";}}','system',0,0,1,0,-10,3,0,1,4,19,0,0,0,0,0,0,0),('navigation',20,10,'user/%/edit','user/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,2,0,10,20,0,0,0,0,0,0,0,0),('management',21,9,'admin/modules/list','admin/modules/list','List','a:0:{}','system',-1,0,0,0,0,3,0,1,9,21,0,0,0,0,0,0,0),('management',22,11,'admin/people/people','admin/people/people','List','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:50:\"Find and manage people interacting with your site.\";}}','system',-1,0,0,0,-10,3,0,1,11,22,0,0,0,0,0,0,0),('management',23,3,'admin/appearance/list','admin/appearance/list','List','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:31:\"Select and configure your theme\";}}','system',-1,0,0,0,-1,3,0,1,3,23,0,0,0,0,0,0,0),('management',24,4,'admin/config/media','admin/config/media','Media','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:12:\"Media tools.\";}}','system',0,0,1,0,-10,3,0,1,4,24,0,0,0,0,0,0,0),('management',25,4,'admin/config/people','admin/config/people','People','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:24:\"Configure user accounts.\";}}','system',0,0,1,0,-20,3,0,1,4,25,0,0,0,0,0,0,0),('management',26,11,'admin/people/permissions','admin/people/permissions','Permissions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:64:\"Determine access to features by selecting permissions for roles.\";}}','system',-1,0,0,0,0,3,0,1,11,26,0,0,0,0,0,0,0),('management',27,4,'admin/config/regional','admin/config/regional','Regional and language','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:48:\"Regional settings, localization and translation.\";}}','system',0,0,1,0,-5,3,0,1,4,27,0,0,0,0,0,0,0),('management',28,4,'admin/config/search','admin/config/search','Search and metadata','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"Local site search, metadata and SEO.\";}}','system',0,0,1,0,-10,3,0,1,4,28,0,0,0,0,0,0,0),('management',29,3,'admin/appearance/settings','admin/appearance/settings','Settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:46:\"Configure default and theme specific settings.\";}}','system',-1,0,0,0,20,3,0,1,3,29,0,0,0,0,0,0,0),('management',30,12,'admin/reports/status','admin/reports/status','Status report','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Get a status report about your site\'s operation and any detected problems.\";}}','system',0,0,0,0,-60,3,0,1,12,30,0,0,0,0,0,0,0),('management',31,4,'admin/config/system','admin/config/system','System','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:37:\"General system related configuration.\";}}','system',0,0,1,0,-20,3,0,1,4,31,0,0,0,0,0,0,0),('management',32,9,'admin/modules/uninstall','admin/modules/uninstall','Uninstall','a:0:{}','system',-1,0,0,0,20,3,0,1,9,32,0,0,0,0,0,0,0),('management',33,4,'admin/config/user-interface','admin/config/user-interface','User interface','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:38:\"Tools that enhance the user interface.\";}}','system',0,0,1,0,-15,3,0,1,4,33,0,0,0,0,0,0,0),('navigation',34,10,'user/%/view','user/%/view','View','a:0:{}','system',-1,0,0,0,-10,2,0,10,34,0,0,0,0,0,0,0,0),('management',35,4,'admin/config/services','admin/config/services','Web services','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"Tools related to web services.\";}}','system',0,0,1,0,0,3,0,1,4,35,0,0,0,0,0,0,0),('management',36,4,'admin/config/workflow','admin/config/workflow','Workflow','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Content workflow, editorial workflow tools.\";}}','system',0,0,0,0,5,3,0,1,4,36,0,0,0,0,0,0,0),('management',37,25,'admin/config/people/accounts','admin/config/people/accounts','Account settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:109:\"Configure default behavior of users, including registration requirements, e-mails, fields, and user pictures.\";}}','system',0,0,0,0,-10,4,0,1,4,25,37,0,0,0,0,0,0),('management',38,31,'admin/config/system/actions','admin/config/system/actions','Actions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:41:\"Manage the actions defined for your site.\";}}','system',0,0,1,0,0,4,0,1,4,31,38,0,0,0,0,0,0),('management',39,29,'admin/appearance/settings/bartik','admin/appearance/settings/bartik','Bartik','a:0:{}','system',-1,0,0,0,0,4,0,1,3,29,39,0,0,0,0,0,0),('management',40,28,'admin/config/search/clean-urls','admin/config/search/clean-urls','Clean URLs','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Enable or disable clean URLs for your site.\";}}','system',0,0,0,0,5,4,0,1,4,28,40,0,0,0,0,0,0),('management',41,31,'admin/config/system/cron','admin/config/system/cron','Cron','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:40:\"Manage automatic site maintenance tasks.\";}}','system',0,0,0,0,20,4,0,1,4,31,41,0,0,0,0,0,0),('management',42,27,'admin/config/regional/date-time','admin/config/regional/date-time','Date and time','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:44:\"Configure display formats for date and time.\";}}','system',0,0,0,0,-15,4,0,1,4,27,42,0,0,0,0,0,0),('management',43,24,'admin/config/media/file-system','admin/config/media/file-system','File system','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:68:\"Tell Drupal where to store uploaded files and how they are accessed.\";}}','system',0,0,0,0,-10,4,0,1,4,24,43,0,0,0,0,0,0),('management',44,29,'admin/appearance/settings/garland','admin/appearance/settings/garland','Garland','a:0:{}','system',-1,0,0,0,0,4,0,1,3,29,44,0,0,0,0,0,0),('management',45,29,'admin/appearance/settings/global','admin/appearance/settings/global','Global settings','a:0:{}','system',-1,0,0,0,-1,4,0,1,3,29,45,0,0,0,0,0,0),('management',46,25,'admin/config/people/ip-blocking','admin/config/people/ip-blocking','IP address blocking','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:28:\"Manage blocked IP addresses.\";}}','system',0,0,1,0,10,4,0,1,4,25,46,0,0,0,0,0,0),('management',47,24,'admin/config/media/image-toolkit','admin/config/media/image-toolkit','Image toolkit','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Choose which image toolkit to use if you have installed optional toolkits.\";}}','system',0,0,0,0,20,4,0,1,4,24,47,0,0,0,0,0,0),('management',48,21,'admin/modules/list/confirm','admin/modules/list/confirm','List','a:0:{}','system',-1,0,0,0,0,4,0,1,9,21,48,0,0,0,0,0,0),('management',49,19,'admin/config/development/logging','admin/config/development/logging','Logging and errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:154:\"Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destinations, such as syslog, database, email, etc.\";}}','system',0,0,0,0,-15,4,0,1,4,19,49,0,0,0,0,0,0),('management',50,19,'admin/config/development/maintenance','admin/config/development/maintenance','Maintenance mode','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:62:\"Take the site offline for maintenance or bring it back online.\";}}','system',0,0,0,0,-10,4,0,1,4,19,50,0,0,0,0,0,0),('management',51,19,'admin/config/development/performance','admin/config/development/performance','Performance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.\";}}','system',0,0,0,0,-20,4,0,1,4,19,51,0,0,0,0,0,0),('management',52,26,'admin/people/permissions/list','admin/people/permissions/list','Permissions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:64:\"Determine access to features by selecting permissions for roles.\";}}','system',-1,0,0,0,-8,4,0,1,11,26,52,0,0,0,0,0,0),('management',53,35,'admin/config/services/rss-publishing','admin/config/services/rss-publishing','RSS publishing','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:114:\"Configure the site description, the number of items per feed and whether feeds should be titles/teasers/full-text.\";}}','system',0,0,0,0,0,4,0,1,4,35,53,0,0,0,0,0,0),('management',54,27,'admin/config/regional/settings','admin/config/regional/settings','Regional settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:54:\"Settings for the site\'s default time zone and country.\";}}','system',0,0,0,0,-20,4,0,1,4,27,54,0,0,0,0,0,0),('management',55,26,'admin/people/permissions/roles','admin/people/permissions/roles','Roles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"List, edit, or add user roles.\";}}','system',-1,0,1,0,-5,4,0,1,11,26,55,0,0,0,0,0,0),('management',56,29,'admin/appearance/settings/seven','admin/appearance/settings/seven','Seven','a:0:{}','system',-1,0,0,0,0,4,0,1,3,29,56,0,0,0,0,0,0),('management',57,31,'admin/config/system/site-information','admin/config/system/site-information','Site information','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:104:\"Change site name, e-mail address, slogan, default front page, and number of posts per page, error pages.\";}}','system',0,0,0,0,-20,4,0,1,4,31,57,0,0,0,0,0,0),('management',58,29,'admin/appearance/settings/stark','admin/appearance/settings/stark','Stark','a:0:{}','system',-1,0,0,0,0,4,0,1,3,29,58,0,0,0,0,0,0),('management',59,32,'admin/modules/uninstall/confirm','admin/modules/uninstall/confirm','Uninstall','a:0:{}','system',-1,0,0,0,0,4,0,1,9,32,59,0,0,0,0,0,0),('navigation',60,20,'user/%/edit/account','user/%/edit/account','Account','a:0:{}','system',-1,0,0,0,0,3,0,10,20,60,0,0,0,0,0,0,0),('management',61,38,'admin/config/system/actions/configure','admin/config/system/actions/configure','Configure an advanced action','a:0:{}','system',-1,0,0,0,0,5,0,1,4,31,38,61,0,0,0,0,0),('management',62,42,'admin/config/regional/date-time/formats','admin/config/regional/date-time/formats','Formats','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:51:\"Configure display format strings for date and time.\";}}','system',-1,0,1,0,-9,5,0,1,4,27,42,62,0,0,0,0,0),('management',63,38,'admin/config/system/actions/manage','admin/config/system/actions/manage','Manage actions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:41:\"Manage the actions defined for your site.\";}}','system',-1,0,0,0,-2,5,0,1,4,31,38,63,0,0,0,0,0),('management',64,37,'admin/config/people/accounts/settings','admin/config/people/accounts/settings','Settings','a:0:{}','system',-1,0,0,0,-10,5,0,1,4,25,37,64,0,0,0,0,0),('management',65,42,'admin/config/regional/date-time/types','admin/config/regional/date-time/types','Types','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:44:\"Configure display formats for date and time.\";}}','system',-1,0,1,0,-10,5,0,1,4,27,42,65,0,0,0,0,0),('management',66,65,'admin/config/regional/date-time/types/add','admin/config/regional/date-time/types/add','Add date type','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:18:\"Add new date type.\";}}','system',-1,0,0,0,-10,6,0,1,4,27,42,65,66,0,0,0,0),('management',67,62,'admin/config/regional/date-time/formats/add','admin/config/regional/date-time/formats/add','Add format','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Allow users to add additional date formats.\";}}','system',-1,0,0,0,-10,6,0,1,4,27,42,62,67,0,0,0,0),('navigation',68,17,'user/%/cancel/confirm/%/%','user/%/cancel/confirm/%/%','Confirm account cancellation','a:0:{}','system',0,0,0,0,0,3,0,10,17,68,0,0,0,0,0,0,0),('management',69,46,'admin/config/people/ip-blocking/delete/%','admin/config/people/ip-blocking/delete/%','Delete IP address','a:0:{}','system',0,0,0,0,0,5,0,1,4,25,46,69,0,0,0,0,0),('management',70,38,'admin/config/system/actions/delete/%','admin/config/system/actions/delete/%','Delete action','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:17:\"Delete an action.\";}}','system',0,0,0,0,0,5,0,1,4,31,38,70,0,0,0,0,0),('management',71,55,'admin/people/permissions/roles/delete/%','admin/people/permissions/roles/delete/%','Delete role','a:0:{}','system',0,0,0,0,0,5,0,1,11,26,55,71,0,0,0,0,0),('management',72,55,'admin/people/permissions/roles/edit/%','admin/people/permissions/roles/edit/%','Edit role','a:0:{}','system',0,0,0,0,0,5,0,1,11,26,55,72,0,0,0,0,0),('management',73,62,'admin/config/regional/date-time/formats/%/delete','admin/config/regional/date-time/formats/%/delete','Delete date format','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:47:\"Allow users to delete a configured date format.\";}}','system',0,0,0,0,0,6,0,1,4,27,42,62,73,0,0,0,0),('management',74,65,'admin/config/regional/date-time/types/%/delete','admin/config/regional/date-time/types/%/delete','Delete date type','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:45:\"Allow users to delete a configured date type.\";}}','system',0,0,0,0,0,6,0,1,4,27,42,65,74,0,0,0,0),('management',75,62,'admin/config/regional/date-time/formats/%/edit','admin/config/regional/date-time/formats/%/edit','Edit date format','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:45:\"Allow users to edit a configured date format.\";}}','system',0,0,0,0,0,6,0,1,4,27,42,62,75,0,0,0,0),('navigation',76,0,'comment/%','comment/%','Comment permalink','a:0:{}','system',0,0,1,0,0,1,0,76,0,0,0,0,0,0,0,0,0),('navigation',77,0,'filter/tips','filter/tips','Compose tips','a:0:{}','system',1,0,0,0,0,1,0,77,0,0,0,0,0,0,0,0,0),('navigation',78,0,'node/%','node/%','','a:0:{}','system',0,0,0,0,0,1,0,78,0,0,0,0,0,0,0,0,0),('navigation',79,0,'node/add','node/add','Add content','a:0:{}','system',0,0,1,0,0,1,0,79,0,0,0,0,0,0,0,0,0),('management',80,1,'admin/content','admin/content','Content','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:32:\"Administer content and comments.\";}}','system',0,0,1,0,-10,2,0,1,80,0,0,0,0,0,0,0,0),('management',81,1,'admin/dashboard','admin/dashboard','Dashboard','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:34:\"View and customize your dashboard.\";}}','system',0,0,0,0,-15,2,0,1,81,0,0,0,0,0,0,0,0),('management',82,1,'admin/help','admin/help','Help','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:48:\"Reference for usage, configuration, and modules.\";}}','system',0,0,0,0,9,2,0,1,82,0,0,0,0,0,0,0,0),('navigation',83,0,'comment/reply/%','comment/reply/%','Add new comment','a:0:{}','system',0,0,0,0,0,1,0,83,0,0,0,0,0,0,0,0,0),('navigation',84,76,'comment/%/approve','comment/%/approve','Approve','a:0:{}','system',0,0,0,0,1,2,0,76,84,0,0,0,0,0,0,0,0),('navigation',85,76,'comment/%/delete','comment/%/delete','Delete','a:0:{}','system',-1,0,0,0,2,2,0,76,85,0,0,0,0,0,0,0,0),('navigation',86,76,'comment/%/edit','comment/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,2,0,76,86,0,0,0,0,0,0,0,0),('navigation',87,0,'taxonomy/term/%','taxonomy/term/%','Taxonomy term','a:0:{}','system',0,0,0,0,0,1,0,87,0,0,0,0,0,0,0,0,0),('navigation',88,76,'comment/%/view','comment/%/view','View comment','a:0:{}','system',-1,0,0,0,-10,2,0,76,88,0,0,0,0,0,0,0,0),('management',89,14,'admin/structure/block','admin/structure/block','Blocks','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:79:\"Configure what block content appears in your site\'s sidebars and other regions.\";}}','system',0,0,1,0,0,3,0,1,14,89,0,0,0,0,0,0,0),('management',90,80,'admin/content/comment','admin/content/comment','Comments','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:59:\"List and edit site comments and the comment approval queue.\";}}','system',0,0,0,0,0,3,0,1,80,90,0,0,0,0,0,0,0),('management',91,81,'admin/dashboard/configure','admin/dashboard/configure','Configure available dashboard blocks','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:53:\"Configure which blocks can be shown on the dashboard.\";}}','system',-1,0,0,0,0,3,0,1,81,91,0,0,0,0,0,0,0),('management',92,80,'admin/content/node','admin/content/node','Content','a:0:{}','system',-1,0,0,0,-10,3,0,1,80,92,0,0,0,0,0,0,0),('management',93,14,'admin/structure/types','admin/structure/types','Content types','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:92:\"Manage content types, including default status, front page promotion, comment settings, etc.\";}}','system',0,0,1,0,0,3,0,1,14,93,0,0,0,0,0,0,0),('management',94,81,'admin/dashboard/customize','admin/dashboard/customize','Customize dashboard','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:25:\"Customize your dashboard.\";}}','system',-1,0,0,0,0,3,0,1,81,94,0,0,0,0,0,0,0),('navigation',95,78,'node/%/delete','node/%/delete','Delete','a:0:{}','system',-1,0,0,0,1,2,0,78,95,0,0,0,0,0,0,0,0),('navigation',96,78,'node/%/edit','node/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,2,0,78,96,0,0,0,0,0,0,0,0),('management',97,12,'admin/reports/fields','admin/reports/fields','Field list','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:39:\"Overview of fields on all entity types.\";}}','system',0,0,0,0,0,3,0,1,12,97,0,0,0,0,0,0,0),('management',98,14,'admin/structure/menu','admin/structure/menu','Menus','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:86:\"Add new menus to your site, edit existing menus, and rename and reorganize menu links.\";}}','system',0,0,1,0,0,3,0,1,14,98,0,0,0,0,0,0,0),('management',99,12,'admin/reports/dblog','admin/reports/dblog','Recent log messages','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View events that have recently been logged.\";}}','system',0,0,0,0,-1,3,0,1,12,99,0,0,0,0,0,0,0),('navigation',100,78,'node/%/revisions','node/%/revisions','Revisions','a:0:{}','system',-1,0,1,0,2,2,0,78,100,0,0,0,0,0,0,0,0),('management',101,14,'admin/structure/taxonomy','admin/structure/taxonomy','Taxonomy','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:67:\"Manage tagging, categorization, and classification of your content.\";}}','system',0,0,1,0,0,3,0,1,14,101,0,0,0,0,0,0,0),('management',102,12,'admin/reports/access-denied','admin/reports/access-denied','Top \'access denied\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:35:\"View \'access denied\' errors (403s).\";}}','system',0,0,0,0,0,3,0,1,12,102,0,0,0,0,0,0,0),('management',103,12,'admin/reports/page-not-found','admin/reports/page-not-found','Top \'page not found\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"View \'page not found\' errors (404s).\";}}','system',0,0,0,0,0,3,0,1,12,103,0,0,0,0,0,0,0),('navigation',104,78,'node/%/view','node/%/view','View','a:0:{}','system',-1,0,0,0,-10,2,0,78,104,0,0,0,0,0,0,0,0),('management',105,82,'admin/help/block','admin/help/block','block','a:0:{}','system',-1,0,0,0,0,3,0,1,82,105,0,0,0,0,0,0,0),('management',106,82,'admin/help/color','admin/help/color','color','a:0:{}','system',-1,0,0,0,0,3,0,1,82,106,0,0,0,0,0,0,0),('management',107,82,'admin/help/comment','admin/help/comment','comment','a:0:{}','system',-1,0,0,0,0,3,0,1,82,107,0,0,0,0,0,0,0),('management',108,82,'admin/help/contextual','admin/help/contextual','contextual','a:0:{}','system',-1,0,0,0,0,3,0,1,82,108,0,0,0,0,0,0,0),('management',109,82,'admin/help/dashboard','admin/help/dashboard','dashboard','a:0:{}','system',-1,0,0,0,0,3,0,1,82,109,0,0,0,0,0,0,0),('management',110,82,'admin/help/dblog','admin/help/dblog','dblog','a:0:{}','system',-1,0,0,0,0,3,0,1,82,110,0,0,0,0,0,0,0),('management',111,82,'admin/help/field','admin/help/field','field','a:0:{}','system',-1,0,0,0,0,3,0,1,82,111,0,0,0,0,0,0,0),('management',112,82,'admin/help/field_sql_storage','admin/help/field_sql_storage','field_sql_storage','a:0:{}','system',-1,0,0,0,0,3,0,1,82,112,0,0,0,0,0,0,0),('management',113,82,'admin/help/field_ui','admin/help/field_ui','field_ui','a:0:{}','system',-1,0,0,0,0,3,0,1,82,113,0,0,0,0,0,0,0),('management',114,82,'admin/help/file','admin/help/file','file','a:0:{}','system',-1,0,0,0,0,3,0,1,82,114,0,0,0,0,0,0,0),('management',115,82,'admin/help/filter','admin/help/filter','filter','a:0:{}','system',-1,0,0,0,0,3,0,1,82,115,0,0,0,0,0,0,0),('management',116,82,'admin/help/help','admin/help/help','help','a:0:{}','system',-1,0,0,0,0,3,0,1,82,116,0,0,0,0,0,0,0),('management',117,82,'admin/help/image','admin/help/image','image','a:0:{}','system',-1,0,0,0,0,3,0,1,82,117,0,0,0,0,0,0,0),('management',118,82,'admin/help/list','admin/help/list','list','a:0:{}','system',-1,0,0,0,0,3,0,1,82,118,0,0,0,0,0,0,0),('management',119,82,'admin/help/menu','admin/help/menu','menu','a:0:{}','system',-1,0,0,0,0,3,0,1,82,119,0,0,0,0,0,0,0),('management',120,82,'admin/help/node','admin/help/node','node','a:0:{}','system',-1,0,0,0,0,3,0,1,82,120,0,0,0,0,0,0,0),('management',121,82,'admin/help/options','admin/help/options','options','a:0:{}','system',-1,0,0,0,0,3,0,1,82,121,0,0,0,0,0,0,0),('management',122,82,'admin/help/system','admin/help/system','system','a:0:{}','system',-1,0,0,0,0,3,0,1,82,122,0,0,0,0,0,0,0),('management',123,82,'admin/help/taxonomy','admin/help/taxonomy','taxonomy','a:0:{}','system',-1,0,0,0,0,3,0,1,82,123,0,0,0,0,0,0,0),('management',124,82,'admin/help/text','admin/help/text','text','a:0:{}','system',-1,0,0,0,0,3,0,1,82,124,0,0,0,0,0,0,0),('management',125,82,'admin/help/user','admin/help/user','user','a:0:{}','system',-1,0,0,0,0,3,0,1,82,125,0,0,0,0,0,0,0),('navigation',126,87,'taxonomy/term/%/edit','taxonomy/term/%/edit','Edit','a:0:{}','system',-1,0,0,0,10,2,0,87,126,0,0,0,0,0,0,0,0),('navigation',127,87,'taxonomy/term/%/view','taxonomy/term/%/view','View','a:0:{}','system',-1,0,0,0,0,2,0,87,127,0,0,0,0,0,0,0,0),('management',128,101,'admin/structure/taxonomy/%','admin/structure/taxonomy/%','','a:0:{}','system',0,0,0,0,0,4,0,1,14,101,128,0,0,0,0,0,0),('management',129,89,'admin/structure/block/add','admin/structure/block/add','Add block','a:0:{}','system',-1,0,0,0,0,4,0,1,14,89,129,0,0,0,0,0,0),('management',130,93,'admin/structure/types/add','admin/structure/types/add','Add content type','a:0:{}','system',-1,0,0,0,0,4,0,1,14,93,130,0,0,0,0,0,0),('management',131,98,'admin/structure/menu/add','admin/structure/menu/add','Add menu','a:0:{}','system',-1,0,0,0,0,4,0,1,14,98,131,0,0,0,0,0,0),('management',132,101,'admin/structure/taxonomy/add','admin/structure/taxonomy/add','Add vocabulary','a:0:{}','system',-1,0,0,0,0,4,0,1,14,101,132,0,0,0,0,0,0),('management',133,12,'admin/reports/event/%','admin/reports/event/%','Details','a:0:{}','system',0,0,0,0,0,3,0,1,12,133,0,0,0,0,0,0,0),('management',134,24,'admin/config/media/image-styles','admin/config/media/image-styles','Image styles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:78:\"Configure styles that can be used for resizing or adjusting images on display.\";}}','system',0,0,1,0,0,4,0,1,4,24,134,0,0,0,0,0,0),('management',135,93,'admin/structure/types/list','admin/structure/types/list','List','a:0:{}','system',-1,0,0,0,-10,4,0,1,14,93,135,0,0,0,0,0,0),('management',136,101,'admin/structure/taxonomy/list','admin/structure/taxonomy/list','List','a:0:{}','system',-1,0,0,0,-10,4,0,1,14,101,136,0,0,0,0,0,0),('management',137,98,'admin/structure/menu/list','admin/structure/menu/list','List menus','a:0:{}','system',-1,0,0,0,-10,4,0,1,14,98,137,0,0,0,0,0,0),('management',138,90,'admin/content/comment/new','admin/content/comment/new','Published comments','a:0:{}','system',-1,0,0,0,-10,4,0,1,80,90,138,0,0,0,0,0,0),('management',139,98,'admin/structure/menu/settings','admin/structure/menu/settings','Settings','a:0:{}','system',-1,0,0,0,5,4,0,1,14,98,139,0,0,0,0,0,0),('management',140,18,'admin/config/content/formats','admin/config/content/formats','Text formats','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:127:\"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.\";}}','system',0,0,1,0,0,4,0,1,4,18,140,0,0,0,0,0,0),('management',141,90,'admin/content/comment/approval','admin/content/comment/approval','Unapproved comments','a:0:{}','system',-1,0,0,0,0,4,0,1,80,90,141,0,0,0,0,0,0),('management',142,140,'admin/config/content/formats/%','admin/config/content/formats/%','','a:0:{}','system',0,0,1,0,0,5,0,1,4,18,140,142,0,0,0,0,0),('management',143,134,'admin/config/media/image-styles/add','admin/config/media/image-styles/add','Add style','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:22:\"Add a new image style.\";}}','system',-1,0,0,0,2,5,0,1,4,24,134,143,0,0,0,0,0),('management',144,128,'admin/structure/taxonomy/%/add','admin/structure/taxonomy/%/add','Add term','a:0:{}','system',-1,0,0,0,0,5,0,1,14,101,128,144,0,0,0,0,0),('management',145,140,'admin/config/content/formats/add','admin/config/content/formats/add','Add text format','a:0:{}','system',-1,0,0,0,1,5,0,1,4,18,140,145,0,0,0,0,0),('management',146,89,'admin/structure/block/list/bartik','admin/structure/block/list/bartik','Bartik','a:0:{}','system',-1,0,0,0,-10,4,0,1,14,89,146,0,0,0,0,0,0),('management',147,98,'admin/structure/menu/manage/%','admin/structure/menu/manage/%','Customize menu','a:0:{}','system',0,0,1,0,0,4,0,1,14,98,147,0,0,0,0,0,0),('management',148,128,'admin/structure/taxonomy/%/edit','admin/structure/taxonomy/%/edit','Edit','a:0:{}','system',-1,0,0,0,-10,5,0,1,14,101,128,148,0,0,0,0,0),('management',149,93,'admin/structure/types/manage/%','admin/structure/types/manage/%','Edit content type','a:0:{}','system',0,0,1,0,0,4,0,1,14,93,149,0,0,0,0,0,0),('management',150,89,'admin/structure/block/list/garland','admin/structure/block/list/garland','Garland','a:0:{}','system',-1,0,0,0,0,4,0,1,14,89,150,0,0,0,0,0,0),('management',151,128,'admin/structure/taxonomy/%/list','admin/structure/taxonomy/%/list','List','a:0:{}','system',-1,0,0,0,-20,5,0,1,14,101,128,151,0,0,0,0,0),('management',152,140,'admin/config/content/formats/list','admin/config/content/formats/list','List','a:0:{}','system',-1,0,0,0,0,5,0,1,4,18,140,152,0,0,0,0,0),('management',153,134,'admin/config/media/image-styles/list','admin/config/media/image-styles/list','List','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:42:\"List the current image styles on the site.\";}}','system',-1,0,0,0,1,5,0,1,4,24,134,153,0,0,0,0,0),('management',154,89,'admin/structure/block/list/seven','admin/structure/block/list/seven','Seven','a:0:{}','system',-1,0,0,0,0,4,0,1,14,89,154,0,0,0,0,0,0),('management',155,89,'admin/structure/block/list/stark','admin/structure/block/list/stark','Stark','a:0:{}','system',-1,0,0,0,0,4,0,1,14,89,155,0,0,0,0,0,0),('navigation',156,100,'node/%/revisions/%/delete','node/%/revisions/%/delete','Delete earlier revision','a:0:{}','system',0,0,0,0,0,3,0,78,100,156,0,0,0,0,0,0,0),('navigation',157,100,'node/%/revisions/%/revert','node/%/revisions/%/revert','Revert to earlier revision','a:0:{}','system',0,0,0,0,0,3,0,78,100,157,0,0,0,0,0,0,0),('navigation',158,100,'node/%/revisions/%/view','node/%/revisions/%/view','Revisions','a:0:{}','system',0,0,0,0,0,3,0,78,100,158,0,0,0,0,0,0,0),('management',159,150,'admin/structure/block/list/garland/add','admin/structure/block/list/garland/add','Add block','a:0:{}','system',-1,0,0,0,0,5,0,1,14,89,150,159,0,0,0,0,0),('management',160,154,'admin/structure/block/list/seven/add','admin/structure/block/list/seven/add','Add block','a:0:{}','system',-1,0,0,0,0,5,0,1,14,89,154,160,0,0,0,0,0),('management',161,155,'admin/structure/block/list/stark/add','admin/structure/block/list/stark/add','Add block','a:0:{}','system',-1,0,0,0,0,5,0,1,14,89,155,161,0,0,0,0,0),('management',162,147,'admin/structure/menu/manage/%/add','admin/structure/menu/manage/%/add','Add link','a:0:{}','system',-1,0,0,0,0,5,0,1,14,98,147,162,0,0,0,0,0),('management',163,89,'admin/structure/block/manage/%/%','admin/structure/block/manage/%/%','Configure block','a:0:{}','system',0,0,0,0,0,4,0,1,14,89,163,0,0,0,0,0,0),('management',164,149,'admin/structure/types/manage/%/delete','admin/structure/types/manage/%/delete','Delete','a:0:{}','system',0,0,0,0,0,5,0,1,14,93,149,164,0,0,0,0,0),('management',165,147,'admin/structure/menu/manage/%/delete','admin/structure/menu/manage/%/delete','Delete menu','a:0:{}','system',0,0,0,0,0,5,0,1,14,98,147,165,0,0,0,0,0),('management',166,98,'admin/structure/menu/item/%/delete','admin/structure/menu/item/%/delete','Delete menu link','a:0:{}','system',0,0,0,0,0,4,0,1,14,98,166,0,0,0,0,0,0),('management',167,142,'admin/config/content/formats/%/disable','admin/config/content/formats/%/disable','Disable text format','a:0:{}','system',0,0,0,0,0,6,0,1,4,18,140,142,167,0,0,0,0),('management',168,149,'admin/structure/types/manage/%/edit','admin/structure/types/manage/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,5,0,1,14,93,149,168,0,0,0,0,0),('management',169,147,'admin/structure/menu/manage/%/edit','admin/structure/menu/manage/%/edit','Edit menu','a:0:{}','system',-1,0,0,0,0,5,0,1,14,98,147,169,0,0,0,0,0),('management',170,98,'admin/structure/menu/item/%/edit','admin/structure/menu/item/%/edit','Edit menu link','a:0:{}','system',0,0,0,0,0,4,0,1,14,98,170,0,0,0,0,0,0),('management',171,134,'admin/config/media/image-styles/edit/%','admin/config/media/image-styles/edit/%','Edit style','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:25:\"Configure an image style.\";}}','system',0,0,1,0,0,5,0,1,4,24,134,171,0,0,0,0,0),('management',172,147,'admin/structure/menu/manage/%/list','admin/structure/menu/manage/%/list','List links','a:0:{}','system',-1,0,0,0,-10,5,0,1,14,98,147,172,0,0,0,0,0),('management',173,98,'admin/structure/menu/item/%/reset','admin/structure/menu/item/%/reset','Reset menu link','a:0:{}','system',0,0,0,0,0,4,0,1,14,98,173,0,0,0,0,0,0),('management',174,134,'admin/config/media/image-styles/delete/%','admin/config/media/image-styles/delete/%','Delete style','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:22:\"Delete an image style.\";}}','system',0,0,0,0,0,5,0,1,4,24,134,174,0,0,0,0,0),('management',175,134,'admin/config/media/image-styles/revert/%','admin/config/media/image-styles/revert/%','Revert style','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:22:\"Revert an image style.\";}}','system',0,0,0,0,0,5,0,1,4,24,134,175,0,0,0,0,0),('management',176,149,'admin/structure/types/manage/%/comment/display','admin/structure/types/manage/%/comment/display','Comment display','a:0:{}','system',-1,0,0,0,4,5,0,1,14,93,149,176,0,0,0,0,0),('management',177,149,'admin/structure/types/manage/%/comment/fields','admin/structure/types/manage/%/comment/fields','Comment fields','a:0:{}','system',-1,0,1,0,3,5,0,1,14,93,149,177,0,0,0,0,0),('management',178,163,'admin/structure/block/manage/%/%/configure','admin/structure/block/manage/%/%/configure','Configure block','a:0:{}','system',-1,0,0,0,0,5,0,1,14,89,163,178,0,0,0,0,0),('management',179,163,'admin/structure/block/manage/%/%/delete','admin/structure/block/manage/%/%/delete','Delete block','a:0:{}','system',-1,0,0,0,0,5,0,1,14,89,163,179,0,0,0,0,0),('management',180,171,'admin/config/media/image-styles/edit/%/add/%','admin/config/media/image-styles/edit/%/add/%','Add image effect','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:28:\"Add a new effect to a style.\";}}','system',0,0,0,0,0,6,0,1,4,24,134,171,180,0,0,0,0),('management',181,171,'admin/config/media/image-styles/edit/%/effects/%','admin/config/media/image-styles/edit/%/effects/%','Edit image effect','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:39:\"Edit an existing effect within a style.\";}}','system',0,0,1,0,0,6,0,1,4,24,134,171,181,0,0,0,0),('management',182,181,'admin/config/media/image-styles/edit/%/effects/%/delete','admin/config/media/image-styles/edit/%/effects/%/delete','Delete image effect','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:39:\"Delete an existing effect from a style.\";}}','system',0,0,0,0,0,7,0,1,4,24,134,171,181,182,0,0,0),('management',183,98,'admin/structure/menu/manage/main-menu','admin/structure/menu/manage/%','Main menu','a:0:{}','menu',0,0,0,0,0,4,0,1,14,98,183,0,0,0,0,0,0),('management',184,98,'admin/structure/menu/manage/management','admin/structure/menu/manage/%','Management','a:0:{}','menu',0,0,0,0,0,4,0,1,14,98,184,0,0,0,0,0,0),('management',185,98,'admin/structure/menu/manage/navigation','admin/structure/menu/manage/%','Navigation','a:0:{}','menu',0,0,0,0,0,4,0,1,14,98,185,0,0,0,0,0,0),('management',186,98,'admin/structure/menu/manage/user-menu','admin/structure/menu/manage/%','User menu','a:0:{}','menu',0,0,0,0,0,4,0,1,14,98,186,0,0,0,0,0,0),('navigation',187,0,'search','search','Search','a:0:{}','system',1,0,0,0,0,1,0,187,0,0,0,0,0,0,0,0,0),('navigation',188,187,'search/node','search/node','Content','a:0:{}','system',-1,0,0,0,-10,2,0,187,188,0,0,0,0,0,0,0,0),('navigation',189,187,'search/user','search/user','Users','a:0:{}','system',-1,0,0,0,0,2,0,187,189,0,0,0,0,0,0,0,0),('navigation',190,188,'search/node/%','search/node/%','Content','a:0:{}','system',-1,0,0,0,0,3,0,187,188,190,0,0,0,0,0,0,0),('navigation',191,10,'user/%/shortcuts','user/%/shortcuts','Shortcuts','a:0:{}','system',-1,0,0,0,0,2,0,10,191,0,0,0,0,0,0,0,0),('management',192,12,'admin/reports/search','admin/reports/search','Top search phrases','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:33:\"View most popular search phrases.\";}}','system',0,0,0,0,0,3,0,1,12,192,0,0,0,0,0,0,0),('navigation',193,189,'search/user/%','search/user/%','Users','a:0:{}','system',-1,0,0,0,0,3,0,187,189,193,0,0,0,0,0,0,0),('management',194,82,'admin/help/number','admin/help/number','number','a:0:{}','system',-1,0,0,0,0,3,0,1,82,194,0,0,0,0,0,0,0),('management',195,82,'admin/help/overlay','admin/help/overlay','overlay','a:0:{}','system',-1,0,0,0,0,3,0,1,82,195,0,0,0,0,0,0,0),('management',196,82,'admin/help/path','admin/help/path','path','a:0:{}','system',-1,0,0,0,0,3,0,1,82,196,0,0,0,0,0,0,0),('management',197,82,'admin/help/rdf','admin/help/rdf','rdf','a:0:{}','system',-1,0,0,0,0,3,0,1,82,197,0,0,0,0,0,0,0),('management',198,82,'admin/help/search','admin/help/search','search','a:0:{}','system',-1,0,0,0,0,3,0,1,82,198,0,0,0,0,0,0,0),('management',199,82,'admin/help/shortcut','admin/help/shortcut','shortcut','a:0:{}','system',-1,0,0,0,0,3,0,1,82,199,0,0,0,0,0,0,0),('management',200,28,'admin/config/search/settings','admin/config/search/settings','Search settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:67:\"Configure relevance settings for search and other indexing options.\";}}','system',0,0,0,0,-10,4,0,1,4,28,200,0,0,0,0,0,0),('management',201,33,'admin/config/user-interface/shortcut','admin/config/user-interface/shortcut','Shortcuts','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:29:\"Add and modify shortcut sets.\";}}','system',0,0,1,0,0,4,0,1,4,33,201,0,0,0,0,0,0),('management',202,28,'admin/config/search/path','admin/config/search/path','URL aliases','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:46:\"Change your site\'s URL paths by aliasing them.\";}}','system',0,0,1,0,-5,4,0,1,4,28,202,0,0,0,0,0,0),('management',203,202,'admin/config/search/path/add','admin/config/search/path/add','Add alias','a:0:{}','system',-1,0,0,0,0,5,0,1,4,28,202,203,0,0,0,0,0),('management',204,201,'admin/config/user-interface/shortcut/add-set','admin/config/user-interface/shortcut/add-set','Add shortcut set','a:0:{}','system',-1,0,0,0,0,5,0,1,4,33,201,204,0,0,0,0,0),('management',205,200,'admin/config/search/settings/reindex','admin/config/search/settings/reindex','Clear index','a:0:{}','system',-1,0,0,0,0,5,0,1,4,28,200,205,0,0,0,0,0),('management',206,201,'admin/config/user-interface/shortcut/%','admin/config/user-interface/shortcut/%','Edit shortcuts','a:0:{}','system',0,0,1,0,0,5,0,1,4,33,201,206,0,0,0,0,0),('management',207,202,'admin/config/search/path/list','admin/config/search/path/list','List','a:0:{}','system',-1,0,0,0,-10,5,0,1,4,28,202,207,0,0,0,0,0),('management',208,206,'admin/config/user-interface/shortcut/%/add-link','admin/config/user-interface/shortcut/%/add-link','Add shortcut','a:0:{}','system',-1,0,0,0,0,6,0,1,4,33,201,206,208,0,0,0,0),('management',209,202,'admin/config/search/path/delete/%','admin/config/search/path/delete/%','Delete alias','a:0:{}','system',0,0,0,0,0,5,0,1,4,28,202,209,0,0,0,0,0),('management',210,206,'admin/config/user-interface/shortcut/%/delete','admin/config/user-interface/shortcut/%/delete','Delete shortcut set','a:0:{}','system',0,0,0,0,0,6,0,1,4,33,201,206,210,0,0,0,0),('management',211,202,'admin/config/search/path/edit/%','admin/config/search/path/edit/%','Edit alias','a:0:{}','system',0,0,0,0,0,5,0,1,4,28,202,211,0,0,0,0,0),('management',212,206,'admin/config/user-interface/shortcut/%/edit','admin/config/user-interface/shortcut/%/edit','Edit set name','a:0:{}','system',-1,0,0,0,10,6,0,1,4,33,201,206,212,0,0,0,0),('management',213,201,'admin/config/user-interface/shortcut/link/%','admin/config/user-interface/shortcut/link/%','Edit shortcut','a:0:{}','system',0,0,1,0,0,5,0,1,4,33,201,213,0,0,0,0,0),('management',214,206,'admin/config/user-interface/shortcut/%/links','admin/config/user-interface/shortcut/%/links','List links','a:0:{}','system',-1,0,0,0,0,6,0,1,4,33,201,206,214,0,0,0,0),('management',215,213,'admin/config/user-interface/shortcut/link/%/delete','admin/config/user-interface/shortcut/link/%/delete','Delete shortcut','a:0:{}','system',0,0,0,0,0,6,0,1,4,33,201,213,215,0,0,0,0),('shortcut-set-1',216,0,'node/add','node/add','Add content','a:0:{}','menu',0,0,0,0,-20,1,0,216,0,0,0,0,0,0,0,0,0),('shortcut-set-1',217,0,'admin/content','admin/content','Find content','a:0:{}','menu',0,0,0,0,-19,1,0,217,0,0,0,0,0,0,0,0,0),('main-menu',218,0,'<front>','','Home','a:0:{}','menu',0,1,0,0,0,1,0,218,0,0,0,0,0,0,0,0,0),('navigation',219,79,'node/add/article','node/add/article','Article','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:89:\"Use <em>articles</em> for time-sensitive content like news, press releases or blog posts.\";}}','system',0,0,0,0,0,2,0,79,219,0,0,0,0,0,0,0,0),('navigation',220,79,'node/add/page','node/add/page','Basic page','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:77:\"Use <em>basic pages</em> for your static content, such as an \'About us\' page.\";}}','system',0,0,0,0,0,2,0,79,220,0,0,0,0,0,0,0,0),('management',221,82,'admin/help/toolbar','admin/help/toolbar','toolbar','a:0:{}','system',-1,0,0,0,0,3,0,1,82,221,0,0,0,0,0,0,0),('management',260,128,'admin/structure/taxonomy/%/display','admin/structure/taxonomy/%/display','Manage display','a:0:{}','system',-1,0,0,0,2,5,0,1,14,101,128,260,0,0,0,0,0),('management',261,37,'admin/config/people/accounts/display','admin/config/people/accounts/display','Manage display','a:0:{}','system',-1,0,0,0,2,5,0,1,4,25,37,261,0,0,0,0,0),('management',262,128,'admin/structure/taxonomy/%/fields','admin/structure/taxonomy/%/fields','Manage fields','a:0:{}','system',-1,0,1,0,1,5,0,1,14,101,128,262,0,0,0,0,0),('management',263,37,'admin/config/people/accounts/fields','admin/config/people/accounts/fields','Manage fields','a:0:{}','system',-1,0,1,0,1,5,0,1,4,25,37,263,0,0,0,0,0),('management',264,260,'admin/structure/taxonomy/%/display/default','admin/structure/taxonomy/%/display/default','Default','a:0:{}','system',-1,0,0,0,-10,6,0,1,14,101,128,260,264,0,0,0,0),('management',265,261,'admin/config/people/accounts/display/default','admin/config/people/accounts/display/default','Default','a:0:{}','system',-1,0,0,0,-10,6,0,1,4,25,37,261,265,0,0,0,0),('management',266,149,'admin/structure/types/manage/%/display','admin/structure/types/manage/%/display','Manage display','a:0:{}','system',-1,0,0,0,2,5,0,1,14,93,149,266,0,0,0,0,0),('management',267,149,'admin/structure/types/manage/%/fields','admin/structure/types/manage/%/fields','Manage fields','a:0:{}','system',-1,0,1,0,1,5,0,1,14,93,149,267,0,0,0,0,0),('management',268,260,'admin/structure/taxonomy/%/display/full','admin/structure/taxonomy/%/display/full','Taxonomy term page','a:0:{}','system',-1,0,0,0,0,6,0,1,14,101,128,260,268,0,0,0,0),('management',269,261,'admin/config/people/accounts/display/full','admin/config/people/accounts/display/full','User account','a:0:{}','system',-1,0,0,0,0,6,0,1,4,25,37,261,269,0,0,0,0),('management',270,262,'admin/structure/taxonomy/%/fields/%','admin/structure/taxonomy/%/fields/%','','a:0:{}','system',0,0,0,0,0,6,0,1,14,101,128,262,270,0,0,0,0),('management',271,263,'admin/config/people/accounts/fields/%','admin/config/people/accounts/fields/%','','a:0:{}','system',0,0,0,0,0,6,0,1,4,25,37,263,271,0,0,0,0),('management',272,266,'admin/structure/types/manage/%/display/default','admin/structure/types/manage/%/display/default','Default','a:0:{}','system',-1,0,0,0,-10,6,0,1,14,93,149,266,272,0,0,0,0),('management',273,266,'admin/structure/types/manage/%/display/full','admin/structure/types/manage/%/display/full','Full content','a:0:{}','system',-1,0,0,0,0,6,0,1,14,93,149,266,273,0,0,0,0),('management',274,266,'admin/structure/types/manage/%/display/rss','admin/structure/types/manage/%/display/rss','RSS','a:0:{}','system',-1,0,0,0,2,6,0,1,14,93,149,266,274,0,0,0,0),('management',275,266,'admin/structure/types/manage/%/display/search_index','admin/structure/types/manage/%/display/search_index','Search index','a:0:{}','system',-1,0,0,0,3,6,0,1,14,93,149,266,275,0,0,0,0),('management',276,266,'admin/structure/types/manage/%/display/search_result','admin/structure/types/manage/%/display/search_result','Search result highlighting input','a:0:{}','system',-1,0,0,0,4,6,0,1,14,93,149,266,276,0,0,0,0),('management',277,266,'admin/structure/types/manage/%/display/teaser','admin/structure/types/manage/%/display/teaser','Teaser','a:0:{}','system',-1,0,0,0,1,6,0,1,14,93,149,266,277,0,0,0,0),('management',278,267,'admin/structure/types/manage/%/fields/%','admin/structure/types/manage/%/fields/%','','a:0:{}','system',0,0,0,0,0,6,0,1,14,93,149,267,278,0,0,0,0),('management',279,270,'admin/structure/taxonomy/%/fields/%/delete','admin/structure/taxonomy/%/fields/%/delete','Delete','a:0:{}','system',-1,0,0,0,10,7,0,1,14,101,128,262,270,279,0,0,0),('management',280,270,'admin/structure/taxonomy/%/fields/%/edit','admin/structure/taxonomy/%/fields/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,7,0,1,14,101,128,262,270,280,0,0,0),('management',281,270,'admin/structure/taxonomy/%/fields/%/field-settings','admin/structure/taxonomy/%/fields/%/field-settings','Field settings','a:0:{}','system',-1,0,0,0,0,7,0,1,14,101,128,262,270,281,0,0,0),('management',282,270,'admin/structure/taxonomy/%/fields/%/widget-type','admin/structure/taxonomy/%/fields/%/widget-type','Widget type','a:0:{}','system',-1,0,0,0,0,7,0,1,14,101,128,262,270,282,0,0,0),('management',283,271,'admin/config/people/accounts/fields/%/delete','admin/config/people/accounts/fields/%/delete','Delete','a:0:{}','system',-1,0,0,0,10,7,0,1,4,25,37,263,271,283,0,0,0),('management',284,271,'admin/config/people/accounts/fields/%/edit','admin/config/people/accounts/fields/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,7,0,1,4,25,37,263,271,284,0,0,0),('management',285,271,'admin/config/people/accounts/fields/%/field-settings','admin/config/people/accounts/fields/%/field-settings','Field settings','a:0:{}','system',-1,0,0,0,0,7,0,1,4,25,37,263,271,285,0,0,0),('management',286,271,'admin/config/people/accounts/fields/%/widget-type','admin/config/people/accounts/fields/%/widget-type','Widget type','a:0:{}','system',-1,0,0,0,0,7,0,1,4,25,37,263,271,286,0,0,0),('management',287,176,'admin/structure/types/manage/%/comment/display/default','admin/structure/types/manage/%/comment/display/default','Default','a:0:{}','system',-1,0,0,0,-10,6,0,1,14,93,149,176,287,0,0,0,0),('management',288,176,'admin/structure/types/manage/%/comment/display/full','admin/structure/types/manage/%/comment/display/full','Full comment','a:0:{}','system',-1,0,0,0,0,6,0,1,14,93,149,176,288,0,0,0,0),('management',289,177,'admin/structure/types/manage/%/comment/fields/%','admin/structure/types/manage/%/comment/fields/%','','a:0:{}','system',0,0,0,0,0,6,0,1,14,93,149,177,289,0,0,0,0),('management',290,278,'admin/structure/types/manage/%/fields/%/delete','admin/structure/types/manage/%/fields/%/delete','Delete','a:0:{}','system',-1,0,0,0,10,7,0,1,14,93,149,267,278,290,0,0,0),('management',291,278,'admin/structure/types/manage/%/fields/%/edit','admin/structure/types/manage/%/fields/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,7,0,1,14,93,149,267,278,291,0,0,0),('management',292,278,'admin/structure/types/manage/%/fields/%/field-settings','admin/structure/types/manage/%/fields/%/field-settings','Field settings','a:0:{}','system',-1,0,0,0,0,7,0,1,14,93,149,267,278,292,0,0,0),('management',293,278,'admin/structure/types/manage/%/fields/%/widget-type','admin/structure/types/manage/%/fields/%/widget-type','Widget type','a:0:{}','system',-1,0,0,0,0,7,0,1,14,93,149,267,278,293,0,0,0),('management',294,289,'admin/structure/types/manage/%/comment/fields/%/delete','admin/structure/types/manage/%/comment/fields/%/delete','Delete','a:0:{}','system',-1,0,0,0,10,7,0,1,14,93,149,177,289,294,0,0,0),('management',295,289,'admin/structure/types/manage/%/comment/fields/%/edit','admin/structure/types/manage/%/comment/fields/%/edit','Edit','a:0:{}','system',-1,0,0,0,0,7,0,1,14,93,149,177,289,295,0,0,0),('management',296,289,'admin/structure/types/manage/%/comment/fields/%/field-settings','admin/structure/types/manage/%/comment/fields/%/field-settings','Field settings','a:0:{}','system',-1,0,0,0,0,7,0,1,14,93,149,177,289,296,0,0,0),('management',297,289,'admin/structure/types/manage/%/comment/fields/%/widget-type','admin/structure/types/manage/%/comment/fields/%/widget-type','Widget type','a:0:{}','system',-1,0,0,0,0,7,0,1,14,93,149,177,289,297,0,0,0),('management',298,14,'admin/structure/features','admin/structure/features','Features','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:16:\"Manage features.\";}}','system',0,0,0,0,0,3,0,1,14,298,0,0,0,0,0,0,0),('management',299,82,'admin/help/features','admin/help/features','features','a:0:{}','system',-1,0,0,0,0,3,0,1,82,299,0,0,0,0,0,0,0),('management',300,298,'admin/structure/features/create','admin/structure/features/create','Create feature','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:21:\"Create a new feature.\";}}','system',-1,0,0,0,10,4,0,1,14,298,300,0,0,0,0,0,0),('management',301,298,'admin/structure/features/manage','admin/structure/features/manage','Manage','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:28:\"Enable and disable features.\";}}','system',-1,0,0,0,0,4,0,1,14,298,301,0,0,0,0,0,0),('management',302,298,'admin/structure/features/settings','admin/structure/features/settings','Settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:42:\"Adjust settings for using features module.\";}}','system',-1,0,0,0,11,4,0,1,14,298,302,0,0,0,0,0,0),('management',303,298,'admin/structure/features/%/view','admin/structure/features/%/view','View','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:32:\"Display components of a feature.\";}}','system',-1,0,0,0,-10,4,0,1,14,298,303,0,0,0,0,0,0),('management',304,298,'admin/structure/features/%/recreate','admin/structure/features/%/recreate','Recreate','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:29:\"Recreate an existing feature.\";}}','system',-1,0,0,0,11,4,0,1,14,298,304,0,0,0,0,0,0),('management',305,14,'admin/structure/panels','admin/structure/panels','Panels','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:49:\"Get a bird\'s eye view of items related to Panels.\";}}','system',0,0,0,0,0,3,0,1,14,305,0,0,0,0,0,0,0),('management',306,305,'admin/structure/panels/dashboard','admin/structure/panels/dashboard','Dashboard','a:0:{}','system',-1,0,0,0,-10,4,0,1,14,305,306,0,0,0,0,0,0),('management',307,305,'admin/structure/panels/layouts','admin/structure/panels/layouts','Layouts','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Add, edit or delete custom content layouts.\";}}','system',-1,0,0,0,0,4,0,1,14,305,307,0,0,0,0,0,0),('management',308,305,'admin/structure/panels/settings','admin/structure/panels/settings','Settings','a:0:{}','system',-1,0,0,0,0,4,0,1,14,305,308,0,0,0,0,0,0),('management',309,307,'admin/structure/panels/layouts/add-flexible','admin/structure/panels/layouts/add-flexible','Add flexible layout','a:0:{}','system',-1,0,0,0,0,5,0,1,14,305,307,309,0,0,0,0,0),('management',310,308,'admin/structure/panels/settings/general','admin/structure/panels/settings/general','General','a:0:{}','system',-1,0,0,0,-10,5,0,1,14,305,308,310,0,0,0,0,0),('management',311,307,'admin/structure/panels/layouts/import','admin/structure/panels/layouts/import','Import','a:0:{}','system',-1,0,0,0,0,5,0,1,14,305,307,311,0,0,0,0,0),('management',312,307,'admin/structure/panels/layouts/list','admin/structure/panels/layouts/list','List','a:0:{}','system',-1,0,0,0,-10,5,0,1,14,305,307,312,0,0,0,0,0),('management',313,312,'admin/structure/panels/layouts/list/%/edit','admin/structure/panels/layouts/list/%/edit','Edit','a:0:{}','system',-1,0,0,0,-10,6,0,1,14,305,307,312,313,0,0,0,0),('management',314,312,'admin/structure/panels/layouts/list/%/export','admin/structure/panels/layouts/list/%/export','Export','a:0:{}','system',-1,0,0,0,0,6,0,1,14,305,307,312,314,0,0,0,0),('management',315,82,'admin/help/pathauto','admin/help/pathauto','pathauto','a:0:{}','system',-1,0,0,0,0,3,0,1,82,315,0,0,0,0,0,0,0),('management',316,82,'admin/help/token','admin/help/token','token','a:0:{}','system',-1,0,0,0,0,3,0,1,82,316,0,0,0,0,0,0,0),('management',317,202,'admin/config/search/path/update_bulk','admin/config/search/path/update_bulk','Bulk update','a:0:{}','system',-1,0,0,0,30,5,0,1,4,28,202,317,0,0,0,0,0),('management',318,202,'admin/config/search/path/delete_bulk','admin/config/search/path/delete_bulk','Delete aliases','a:0:{}','system',-1,0,0,0,40,5,0,1,4,28,202,318,0,0,0,0,0),('management',319,202,'admin/config/search/path/patterns','admin/config/search/path/patterns','Patterns','a:0:{}','system',-1,0,0,0,10,5,0,1,4,28,202,319,0,0,0,0,0),('management',320,202,'admin/config/search/path/settings','admin/config/search/path/settings','Settings','a:0:{}','system',-1,0,0,0,20,5,0,1,4,28,202,320,0,0,0,0,0),('management',321,260,'admin/structure/taxonomy/%/display/token','admin/structure/taxonomy/%/display/token','Tokens','a:0:{}','system',-1,0,0,0,1,6,0,1,14,101,128,260,321,0,0,0,0),('management',322,261,'admin/config/people/accounts/display/token','admin/config/people/accounts/display/token','Tokens','a:0:{}','system',-1,0,0,0,1,6,0,1,4,25,37,261,322,0,0,0,0),('management',323,266,'admin/structure/types/manage/%/display/token','admin/structure/types/manage/%/display/token','Tokens','a:0:{}','system',-1,0,0,0,5,6,0,1,14,93,149,266,323,0,0,0,0),('management',324,176,'admin/structure/types/manage/%/comment/display/token','admin/structure/types/manage/%/comment/display/token','Tokens','a:0:{}','system',-1,0,0,0,1,6,0,1,14,93,149,176,324,0,0,0,0),('management',325,82,'admin/help/strongarm','admin/help/strongarm','strongarm','a:0:{}','system',-1,0,0,0,0,3,0,1,82,325,0,0,0,0,0,0,0),('management',326,19,'admin/config/development/strongarm','admin/config/development/strongarm','Strongarm','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:59:\"Manage Drupal variable settings that have been strongarmed.\";}}','system',0,0,0,0,0,4,0,1,4,19,326,0,0,0,0,0,0),('management',327,82,'admin/help/ckeditor','admin/help/ckeditor','ckeditor','a:0:{}','system',-1,0,0,0,0,3,0,1,82,327,0,0,0,0,0,0,0),('management',328,18,'admin/config/content/ckeditor','admin/config/content/ckeditor','CKEditor','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:31:\"Configure the rich text editor.\";}}','system',0,0,0,0,0,4,0,1,4,18,328,0,0,0,0,0,0);
/*!40000 ALTER TABLE `menu_links` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `menu_router`
--

DROP TABLE IF EXISTS `menu_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: the Drupal path this entry describes',
  `load_functions` blob NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` blob NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback which determines the access to this router path. Defaults to user_access.',
  `access_arguments` blob COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that renders the page.',
  `page_arguments` blob COMMENT 'A serialized array of arguments for the page callback.',
  `delivery_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that sends the result of the page_callback function to the browser.',
  `fit` int(11) NOT NULL DEFAULT '0' COMMENT 'A numeric representation of how specific the path is.',
  `number_parts` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Number of parts in this router path.',
  `context` int(11) NOT NULL DEFAULT '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `tab_parent` varchar(255) NOT NULL DEFAULT '' COMMENT 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).',
  `tab_root` varchar(255) NOT NULL DEFAULT '' COMMENT 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title for the current page, or the title for the tab if this is a local task.',
  `title_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which will alter the title. Defaults to t()',
  `title_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.',
  `theme_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.',
  `theme_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the theme callback.',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'Numeric representation of the type of the menu item, like MENU_LOCAL_TASK.',
  `description` text NOT NULL COMMENT 'A description of this item.',
  `position` varchar(255) NOT NULL DEFAULT '' COMMENT 'The position of the block (left or right) on the system administration page for this item.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of the element. Lighter weights are higher up, heavier weights go down.',
  `include_file` mediumtext COMMENT 'The file to include for this element, usually the page callback function lives in this file.',
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`(64),`weight`,`title`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps paths to various callbacks (access, page and title)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_router`
--

LOCK TABLES `menu_router` WRITE;
/*!40000 ALTER TABLE `menu_router` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `menu_router` VALUES ('admin','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',1,1,0,'','admin','Administration','t','','','a:0:{}',6,'','',9,'modules/system/system.admin.inc'),('admin/appearance','','','user_access','a:1:{i:0;s:17:\"administer themes\";}','system_themes_page','a:0:{}','',3,2,0,'','admin/appearance','Appearance','t','','','a:0:{}',6,'Select and configure your themes.','left',-6,'modules/system/system.admin.inc'),('admin/appearance/default','','','user_access','a:1:{i:0;s:17:\"administer themes\";}','system_theme_default','a:0:{}','',7,3,0,'','admin/appearance/default','Set default theme','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/appearance/disable','','','user_access','a:1:{i:0;s:17:\"administer themes\";}','system_theme_disable','a:0:{}','',7,3,0,'','admin/appearance/disable','Disable theme','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/appearance/enable','','','user_access','a:1:{i:0;s:17:\"administer themes\";}','system_theme_enable','a:0:{}','',7,3,0,'','admin/appearance/enable','Enable theme','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/appearance/list','','','user_access','a:1:{i:0;s:17:\"administer themes\";}','system_themes_page','a:0:{}','',7,3,1,'admin/appearance','admin/appearance','List','t','','','a:0:{}',140,'Select and configure your theme','',-1,'modules/system/system.admin.inc'),('admin/appearance/settings','','','user_access','a:1:{i:0;s:17:\"administer themes\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}','',7,3,1,'admin/appearance','admin/appearance','Settings','t','','','a:0:{}',132,'Configure default and theme specific settings.','',20,'modules/system/system.admin.inc'),('admin/appearance/settings/bartik','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:25:\"themes/bartik/bartik.info\";s:4:\"name\";s:6:\"bartik\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:6:\"Bartik\";s:11:\"description\";s:48:\"A flexible, recolorable theme with many regions.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:3:{s:14:\"css/layout.css\";s:28:\"themes/bartik/css/layout.css\";s:13:\"css/style.css\";s:27:\"themes/bartik/css/style.css\";s:14:\"css/colors.css\";s:28:\"themes/bartik/css/colors.css\";}s:5:\"print\";a:1:{s:13:\"css/print.css\";s:27:\"themes/bartik/css/print.css\";}}s:7:\"regions\";a:20:{s:6:\"header\";s:6:\"Header\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:11:\"highlighted\";s:11:\"Highlighted\";s:8:\"featured\";s:8:\"Featured\";s:7:\"content\";s:7:\"Content\";s:13:\"sidebar_first\";s:13:\"Sidebar first\";s:14:\"sidebar_second\";s:14:\"Sidebar second\";s:14:\"triptych_first\";s:14:\"Triptych first\";s:15:\"triptych_middle\";s:15:\"Triptych middle\";s:13:\"triptych_last\";s:13:\"Triptych last\";s:18:\"footer_firstcolumn\";s:19:\"Footer first column\";s:19:\"footer_secondcolumn\";s:20:\"Footer second column\";s:18:\"footer_thirdcolumn\";s:19:\"Footer third column\";s:19:\"footer_fourthcolumn\";s:20:\"Footer fourth column\";s:6:\"footer\";s:6:\"Footer\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"0\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:28:\"themes/bartik/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:3:{s:14:\"css/layout.css\";s:28:\"themes/bartik/css/layout.css\";s:13:\"css/style.css\";s:27:\"themes/bartik/css/style.css\";s:14:\"css/colors.css\";s:28:\"themes/bartik/css/colors.css\";}s:5:\"print\";a:1:{s:13:\"css/print.css\";s:27:\"themes/bartik/css/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:6:\"bartik\";}','',15,4,1,'admin/appearance/settings','admin/appearance','Bartik','t','','','a:0:{}',132,'','',0,'modules/system/system.admin.inc'),('admin/appearance/settings/garland','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:111:\"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:8:\"settings\";a:1:{s:13:\"garland_width\";s:5:\"fluid\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:7:\"garland\";}','',15,4,1,'admin/appearance/settings','admin/appearance','Garland','t','','','a:0:{}',132,'','',0,'modules/system/system.admin.inc'),('admin/appearance/settings/global','','','user_access','a:1:{i:0;s:17:\"administer themes\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}','',15,4,1,'admin/appearance/settings','admin/appearance','Global settings','t','','','a:0:{}',140,'','',-1,'modules/system/system.admin.inc'),('admin/appearance/settings/seven','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:23:\"themes/seven/seven.info\";s:4:\"name\";s:5:\"seven\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:5:\"Seven\";s:11:\"description\";s:65:\"A simple one-column, tableless, fluid width administration theme.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:22:\"themes/seven/reset.css\";s:9:\"style.css\";s:22:\"themes/seven/style.css\";}}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"1\";}s:7:\"regions\";a:8:{s:7:\"content\";s:7:\"Content\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:13:\"sidebar_first\";s:13:\"First sidebar\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:14:\"regions_hidden\";a:3:{i:0;s:13:\"sidebar_first\";i:1;s:8:\"page_top\";i:2;s:11:\"page_bottom\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/seven/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:22:\"themes/seven/reset.css\";s:9:\"style.css\";s:22:\"themes/seven/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:5:\"seven\";}','',15,4,1,'admin/appearance/settings','admin/appearance','Seven','t','','','a:0:{}',132,'','',0,'modules/system/system.admin.inc'),('admin/appearance/settings/stark','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:23:\"themes/stark/stark.info\";s:4:\"name\";s:5:\"stark\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:18:{s:4:\"name\";s:5:\"Stark\";s:11:\"description\";s:208:\"This theme demonstrates Drupal\'s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal\'s default code, see the <a href=\"http://drupal.org/theme-guide\">Theming Guide</a>.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"layout.css\";s:23:\"themes/stark/layout.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/stark/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"layout.css\";s:23:\"themes/stark/layout.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:5:\"stark\";}','',15,4,1,'admin/appearance/settings','admin/appearance','Stark','t','','','a:0:{}',132,'','',0,'modules/system/system.admin.inc'),('admin/compact','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_compact_page','a:0:{}','',3,2,0,'','admin/compact','Compact mode','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/config','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_config_page','a:0:{}','',3,2,0,'','admin/config','Configuration','t','','','a:0:{}',6,'Administer settings.','',0,'modules/system/system.admin.inc'),('admin/config/content','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/content','Content authoring','t','','','a:0:{}',6,'Settings related to formatting and authoring content.','left',-15,'modules/system/system.admin.inc'),('admin/config/content/ckeditor','','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','ckeditor_admin_main','a:0:{}','',15,4,0,'','admin/config/content/ckeditor','CKEditor','t','','','a:0:{}',6,'Configure the rich text editor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/ckeditor/add','','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','drupal_get_form','a:2:{i:0;s:27:\"ckeditor_admin_profile_form\";i:1;s:3:\"add\";}','',31,5,0,'','admin/config/content/ckeditor/add','Add a new CKEditor profile','t','','','a:0:{}',0,'Configure the rich text editor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/ckeditor/addg','','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','drupal_get_form','a:2:{i:0;s:34:\"ckeditor_admin_global_profile_form\";i:1;s:3:\"add\";}','',31,5,0,'','admin/config/content/ckeditor/addg','Add the CKEditor Global profile','t','','','a:0:{}',0,'Configure the rich text editor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/ckeditor/clone/%','a:1:{i:5;s:21:\"ckeditor_profile_load\";}','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','drupal_get_form','a:3:{i:0;s:33:\"ckeditor_admin_profile_clone_form\";i:1;s:5:\"clone\";i:2;i:5;}','',62,6,0,'','admin/config/content/ckeditor/clone/%','Clone the CKEditor profile','t','','','a:0:{}',0,'Configure the rich text editor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/ckeditor/delete/%','a:1:{i:5;s:21:\"ckeditor_profile_load\";}','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','drupal_get_form','a:2:{i:0;s:34:\"ckeditor_admin_profile_delete_form\";i:1;i:5;}','',62,6,0,'','admin/config/content/ckeditor/delete/%','Delete the CKEditor profile','t','','','a:0:{}',0,'Configure the rich text editor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/ckeditor/edit/%','a:1:{i:5;s:21:\"ckeditor_profile_load\";}','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','drupal_get_form','a:3:{i:0;s:27:\"ckeditor_admin_profile_form\";i:1;s:4:\"edit\";i:2;i:5;}','',62,6,0,'','admin/config/content/ckeditor/edit/%','Edit the CKEditor profile','t','','','a:0:{}',0,'Configure the rich text editor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/ckeditor/editg','','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','drupal_get_form','a:2:{i:0;s:34:\"ckeditor_admin_global_profile_form\";i:1;s:4:\"edit\";}','',31,5,0,'','admin/config/content/ckeditor/editg','Edit the CKEditor Global profile','t','','','a:0:{}',0,'Configure the rich text editor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/ckeditor/skinframe','','','user_access','a:1:{i:0;s:19:\"administer ckeditor\";}','ckeditor_skinframe','a:0:{}','',31,5,0,'','admin/config/content/ckeditor/skinframe','Change skin of CKEditor','t','','','a:0:{}',0,'Configure skin for CKEditor.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('admin/config/content/formats','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}','',15,4,0,'','admin/config/content/formats','Text formats','t','','','a:0:{}',6,'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.','',0,'modules/filter/filter.admin.inc'),('admin/config/content/formats/%','a:1:{i:4;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:4;}','',30,5,0,'','admin/config/content/formats/%','','filter_admin_format_title','a:1:{i:0;i:4;}','','a:0:{}',6,'','',0,'modules/filter/filter.admin.inc'),('admin/config/content/formats/%/disable','a:1:{i:4;s:18:\"filter_format_load\";}','','_filter_disable_format_access','a:1:{i:0;i:4;}','drupal_get_form','a:2:{i:0;s:20:\"filter_admin_disable\";i:1;i:4;}','',61,6,0,'','admin/config/content/formats/%/disable','Disable text format','t','','','a:0:{}',6,'','',0,'modules/filter/filter.admin.inc'),('admin/config/content/formats/add','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:0:{}','',31,5,1,'admin/config/content/formats','admin/config/content/formats','Add text format','t','','','a:0:{}',388,'','',1,'modules/filter/filter.admin.inc'),('admin/config/content/formats/list','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}','',31,5,1,'admin/config/content/formats','admin/config/content/formats','List','t','','','a:0:{}',140,'','',0,'modules/filter/filter.admin.inc'),('admin/config/development','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/development','Development','t','','','a:0:{}',6,'Development tools.','right',-10,'modules/system/system.admin.inc'),('admin/config/development/logging','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:23:\"system_logging_settings\";}','',15,4,0,'','admin/config/development/logging','Logging and errors','t','','','a:0:{}',6,'Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destinations, such as syslog, database, email, etc.','',-15,'modules/system/system.admin.inc'),('admin/config/development/maintenance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:28:\"system_site_maintenance_mode\";}','',15,4,0,'','admin/config/development/maintenance','Maintenance mode','t','','','a:0:{}',6,'Take the site offline for maintenance or bring it back online.','',-10,'modules/system/system.admin.inc'),('admin/config/development/performance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_performance_settings\";}','',15,4,0,'','admin/config/development/performance','Performance','t','','','a:0:{}',6,'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.','',-20,'modules/system/system.admin.inc'),('admin/config/development/strongarm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:20:\"strongarm_admin_form\";}','',15,4,0,'','admin/config/development/strongarm','Strongarm','t','','','a:0:{}',6,'Manage Drupal variable settings that have been strongarmed.','',0,'sites/all/modules/strongarm/strongarm.admin.inc'),('admin/config/media','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/media','Media','t','','','a:0:{}',6,'Media tools.','left',-10,'modules/system/system.admin.inc'),('admin/config/media/file-system','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_file_system_settings\";}','',15,4,0,'','admin/config/media/file-system','File system','t','','','a:0:{}',6,'Tell Drupal where to store uploaded files and how they are accessed.','',-10,'modules/system/system.admin.inc'),('admin/config/media/image-styles','','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','image_style_list','a:0:{}','',15,4,0,'','admin/config/media/image-styles','Image styles','t','','','a:0:{}',6,'Configure styles that can be used for resizing or adjusting images on display.','',0,'modules/image/image.admin.inc'),('admin/config/media/image-styles/add','','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','drupal_get_form','a:1:{i:0;s:20:\"image_style_add_form\";}','',31,5,1,'admin/config/media/image-styles','admin/config/media/image-styles','Add style','t','','','a:0:{}',388,'Add a new image style.','',2,'modules/image/image.admin.inc'),('admin/config/media/image-styles/delete/%','a:1:{i:5;a:1:{s:16:\"image_style_load\";a:2:{i:0;N;i:1;s:1:\"1\";}}}','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','drupal_get_form','a:2:{i:0;s:23:\"image_style_delete_form\";i:1;i:5;}','',62,6,0,'','admin/config/media/image-styles/delete/%','Delete style','t','','','a:0:{}',6,'Delete an image style.','',0,'modules/image/image.admin.inc'),('admin/config/media/image-styles/edit/%','a:1:{i:5;s:16:\"image_style_load\";}','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','drupal_get_form','a:2:{i:0;s:16:\"image_style_form\";i:1;i:5;}','',62,6,0,'','admin/config/media/image-styles/edit/%','Edit style','t','','','a:0:{}',6,'Configure an image style.','',0,'modules/image/image.admin.inc'),('admin/config/media/image-styles/edit/%/add/%','a:2:{i:5;a:1:{s:16:\"image_style_load\";a:1:{i:0;i:5;}}i:7;a:1:{s:28:\"image_effect_definition_load\";a:1:{i:0;i:5;}}}','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','drupal_get_form','a:3:{i:0;s:17:\"image_effect_form\";i:1;i:5;i:2;i:7;}','',250,8,0,'','admin/config/media/image-styles/edit/%/add/%','Add image effect','t','','','a:0:{}',6,'Add a new effect to a style.','',0,'modules/image/image.admin.inc'),('admin/config/media/image-styles/edit/%/effects/%','a:2:{i:5;a:1:{s:16:\"image_style_load\";a:2:{i:0;i:5;i:1;s:1:\"3\";}}i:7;a:1:{s:17:\"image_effect_load\";a:2:{i:0;i:5;i:1;s:1:\"3\";}}}','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','drupal_get_form','a:3:{i:0;s:17:\"image_effect_form\";i:1;i:5;i:2;i:7;}','',250,8,0,'','admin/config/media/image-styles/edit/%/effects/%','Edit image effect','t','','','a:0:{}',6,'Edit an existing effect within a style.','',0,'modules/image/image.admin.inc'),('admin/config/media/image-styles/edit/%/effects/%/delete','a:2:{i:5;a:1:{s:16:\"image_style_load\";a:2:{i:0;i:5;i:1;s:1:\"3\";}}i:7;a:1:{s:17:\"image_effect_load\";a:2:{i:0;i:5;i:1;s:1:\"3\";}}}','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','drupal_get_form','a:3:{i:0;s:24:\"image_effect_delete_form\";i:1;i:5;i:2;i:7;}','',501,9,0,'','admin/config/media/image-styles/edit/%/effects/%/delete','Delete image effect','t','','','a:0:{}',6,'Delete an existing effect from a style.','',0,'modules/image/image.admin.inc'),('admin/config/media/image-styles/list','','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','image_style_list','a:0:{}','',31,5,1,'admin/config/media/image-styles','admin/config/media/image-styles','List','t','','','a:0:{}',140,'List the current image styles on the site.','',1,'modules/image/image.admin.inc'),('admin/config/media/image-styles/revert/%','a:1:{i:5;a:1:{s:16:\"image_style_load\";a:2:{i:0;N;i:1;s:1:\"2\";}}}','','user_access','a:1:{i:0;s:23:\"administer image styles\";}','drupal_get_form','a:2:{i:0;s:23:\"image_style_revert_form\";i:1;i:5;}','',62,6,0,'','admin/config/media/image-styles/revert/%','Revert style','t','','','a:0:{}',6,'Revert an image style.','',0,'modules/image/image.admin.inc'),('admin/config/media/image-toolkit','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:29:\"system_image_toolkit_settings\";}','',15,4,0,'','admin/config/media/image-toolkit','Image toolkit','t','','','a:0:{}',6,'Choose which image toolkit to use if you have installed optional toolkits.','',20,'modules/system/system.admin.inc'),('admin/config/people','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/people','People','t','','','a:0:{}',6,'Configure user accounts.','left',-20,'modules/system/system.admin.inc'),('admin/config/people/accounts','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_settings\";}','',15,4,0,'','admin/config/people/accounts','Account settings','t','','','a:0:{}',6,'Configure default behavior of users, including registration requirements, e-mails, fields, and user pictures.','',-10,'modules/user/user.admin.inc'),('admin/config/people/accounts/display','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"user\";i:2;s:4:\"user\";i:3;s:7:\"default\";}','',31,5,1,'admin/config/people/accounts','admin/config/people/accounts','Manage display','t','','','a:0:{}',132,'','',2,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/display/default','','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:7:\"default\";i:3;s:11:\"user_access\";i:4;s:16:\"administer users\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"user\";i:2;s:4:\"user\";i:3;s:7:\"default\";}','',63,6,1,'admin/config/people/accounts/display','admin/config/people/accounts','Default','t','','','a:0:{}',140,'','',-10,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/display/full','','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:4:\"full\";i:3;s:11:\"user_access\";i:4;s:16:\"administer users\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"user\";i:2;s:4:\"user\";i:3;s:4:\"full\";}','',63,6,1,'admin/config/people/accounts/display','admin/config/people/accounts','User account','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/display/token','','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:5:\"token\";i:3;s:11:\"user_access\";i:4;s:16:\"administer users\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"user\";i:2;s:4:\"user\";i:3;s:5:\"token\";}','',63,6,1,'admin/config/people/accounts/display','admin/config/people/accounts','Tokens','t','','','a:0:{}',132,'','',1,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/fields','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:3:{i:0;s:28:\"field_ui_field_overview_form\";i:1;s:4:\"user\";i:2;s:4:\"user\";}','',31,5,1,'admin/config/people/accounts','admin/config/people/accounts','Manage fields','t','','','a:0:{}',132,'','',1,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/fields/%','a:1:{i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:1:\"0\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:5;}','',62,6,0,'','admin/config/people/accounts/fields/%','','field_ui_menu_title','a:1:{i:0;i:5;}','','a:0:{}',6,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/fields/%/delete','a:1:{i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:1:\"0\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:26:\"field_ui_field_delete_form\";i:1;i:5;}','',125,7,1,'admin/config/people/accounts/fields/%','admin/config/people/accounts/fields/%','Delete','t','','','a:0:{}',132,'','',10,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/fields/%/edit','a:1:{i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:1:\"0\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:5;}','',125,7,1,'admin/config/people/accounts/fields/%','admin/config/people/accounts/fields/%','Edit','t','','','a:0:{}',140,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/fields/%/field-settings','a:1:{i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:1:\"0\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:28:\"field_ui_field_settings_form\";i:1;i:5;}','',125,7,1,'admin/config/people/accounts/fields/%','admin/config/people/accounts/fields/%','Field settings','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/fields/%/widget-type','a:1:{i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"user\";i:1;s:4:\"user\";i:2;s:1:\"0\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:25:\"field_ui_widget_type_form\";i:1;i:5;}','',125,7,1,'admin/config/people/accounts/fields/%','admin/config/people/accounts/fields/%','Widget type','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/config/people/accounts/settings','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_settings\";}','',31,5,1,'admin/config/people/accounts','admin/config/people/accounts','Settings','t','','','a:0:{}',140,'','',-10,'modules/user/user.admin.inc'),('admin/config/people/ip-blocking','','','user_access','a:1:{i:0;s:18:\"block IP addresses\";}','system_ip_blocking','a:0:{}','',15,4,0,'','admin/config/people/ip-blocking','IP address blocking','t','','','a:0:{}',6,'Manage blocked IP addresses.','',10,'modules/system/system.admin.inc'),('admin/config/people/ip-blocking/delete/%','a:1:{i:5;s:15:\"blocked_ip_load\";}','','user_access','a:1:{i:0;s:18:\"block IP addresses\";}','drupal_get_form','a:2:{i:0;s:25:\"system_ip_blocking_delete\";i:1;i:5;}','',62,6,0,'','admin/config/people/ip-blocking/delete/%','Delete IP address','t','','','a:0:{}',6,'','',0,'modules/system/system.admin.inc'),('admin/config/regional','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/regional','Regional and language','t','','','a:0:{}',6,'Regional settings, localization and translation.','left',-5,'modules/system/system.admin.inc'),('admin/config/regional/date-time','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}','',15,4,0,'','admin/config/regional/date-time','Date and time','t','','','a:0:{}',6,'Configure display formats for date and time.','',-15,'modules/system/system.admin.inc'),('admin/config/regional/date-time/formats','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_date_time_formats','a:0:{}','',31,5,1,'admin/config/regional/date-time','admin/config/regional/date-time','Formats','t','','','a:0:{}',132,'Configure display format strings for date and time.','',-9,'modules/system/system.admin.inc'),('admin/config/regional/date-time/formats/%/delete','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:30:\"system_date_delete_format_form\";i:1;i:5;}','',125,7,0,'','admin/config/regional/date-time/formats/%/delete','Delete date format','t','','','a:0:{}',6,'Allow users to delete a configured date format.','',0,'modules/system/system.admin.inc'),('admin/config/regional/date-time/formats/%/edit','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:34:\"system_configure_date_formats_form\";i:1;i:5;}','',125,7,0,'','admin/config/regional/date-time/formats/%/edit','Edit date format','t','','','a:0:{}',6,'Allow users to edit a configured date format.','',0,'modules/system/system.admin.inc'),('admin/config/regional/date-time/formats/add','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:34:\"system_configure_date_formats_form\";}','',63,6,1,'admin/config/regional/date-time/formats','admin/config/regional/date-time','Add format','t','','','a:0:{}',388,'Allow users to add additional date formats.','',-10,'modules/system/system.admin.inc'),('admin/config/regional/date-time/formats/lookup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_date_time_lookup','a:0:{}','',63,6,0,'','admin/config/regional/date-time/formats/lookup','Date and time lookup','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/config/regional/date-time/types','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}','',31,5,1,'admin/config/regional/date-time','admin/config/regional/date-time','Types','t','','','a:0:{}',140,'Configure display formats for date and time.','',-10,'modules/system/system.admin.inc'),('admin/config/regional/date-time/types/%/delete','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:35:\"system_delete_date_format_type_form\";i:1;i:5;}','',125,7,0,'','admin/config/regional/date-time/types/%/delete','Delete date type','t','','','a:0:{}',6,'Allow users to delete a configured date type.','',0,'modules/system/system.admin.inc'),('admin/config/regional/date-time/types/add','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_add_date_format_type_form\";}','',63,6,1,'admin/config/regional/date-time/types','admin/config/regional/date-time','Add date type','t','','','a:0:{}',388,'Add new date type.','',-10,'modules/system/system.admin.inc'),('admin/config/regional/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_regional_settings\";}','',15,4,0,'','admin/config/regional/settings','Regional settings','t','','','a:0:{}',6,'Settings for the site\'s default time zone and country.','',-20,'modules/system/system.admin.inc'),('admin/config/search','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/search','Search and metadata','t','','','a:0:{}',6,'Local site search, metadata and SEO.','left',-10,'modules/system/system.admin.inc'),('admin/config/search/clean-urls','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_clean_url_settings\";}','',15,4,0,'','admin/config/search/clean-urls','Clean URLs','t','','','a:0:{}',6,'Enable or disable clean URLs for your site.','',5,'modules/system/system.admin.inc'),('admin/config/search/clean-urls/check','','','1','a:0:{}','drupal_json_output','a:1:{i:0;a:1:{s:6:\"status\";b:1;}}','',31,5,0,'','admin/config/search/clean-urls/check','Clean URL check','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/config/search/path','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_overview','a:0:{}','',15,4,0,'','admin/config/search/path','URL aliases','t','','','a:0:{}',6,'Change your site\'s URL paths by aliasing them.','',-5,'modules/path/path.admin.inc'),('admin/config/search/path/add','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_edit','a:0:{}','',31,5,1,'admin/config/search/path','admin/config/search/path','Add alias','t','','','a:0:{}',388,'','',0,'modules/path/path.admin.inc'),('admin/config/search/path/delete/%','a:1:{i:5;s:9:\"path_load\";}','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','drupal_get_form','a:2:{i:0;s:25:\"path_admin_delete_confirm\";i:1;i:5;}','',62,6,0,'','admin/config/search/path/delete/%','Delete alias','t','','','a:0:{}',6,'','',0,'modules/path/path.admin.inc'),('admin/config/search/path/delete_bulk','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','drupal_get_form','a:1:{i:0;s:21:\"pathauto_admin_delete\";}','',31,5,1,'admin/config/search/path','admin/config/search/path','Delete aliases','t','','','a:0:{}',132,'','',40,'sites/all/modules/pathauto/pathauto.admin.inc'),('admin/config/search/path/edit/%','a:1:{i:5;s:9:\"path_load\";}','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_edit','a:1:{i:0;i:5;}','',62,6,0,'','admin/config/search/path/edit/%','Edit alias','t','','','a:0:{}',6,'','',0,'modules/path/path.admin.inc'),('admin/config/search/path/list','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_overview','a:0:{}','',31,5,1,'admin/config/search/path','admin/config/search/path','List','t','','','a:0:{}',140,'','',-10,'modules/path/path.admin.inc'),('admin/config/search/path/patterns','','','user_access','a:1:{i:0;s:19:\"administer pathauto\";}','drupal_get_form','a:1:{i:0;s:22:\"pathauto_patterns_form\";}','',31,5,1,'admin/config/search/path','admin/config/search/path','Patterns','t','','','a:0:{}',132,'','',10,'sites/all/modules/pathauto/pathauto.admin.inc'),('admin/config/search/path/settings','','','user_access','a:1:{i:0;s:19:\"administer pathauto\";}','drupal_get_form','a:1:{i:0;s:22:\"pathauto_settings_form\";}','',31,5,1,'admin/config/search/path','admin/config/search/path','Settings','t','','','a:0:{}',132,'','',20,'sites/all/modules/pathauto/pathauto.admin.inc'),('admin/config/search/path/update_bulk','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','drupal_get_form','a:1:{i:0;s:25:\"pathauto_bulk_update_form\";}','',31,5,1,'admin/config/search/path','admin/config/search/path','Bulk update','t','','','a:0:{}',132,'','',30,'sites/all/modules/pathauto/pathauto.admin.inc'),('admin/config/search/settings','','','user_access','a:1:{i:0;s:17:\"administer search\";}','drupal_get_form','a:1:{i:0;s:21:\"search_admin_settings\";}','',15,4,0,'','admin/config/search/settings','Search settings','t','','','a:0:{}',6,'Configure relevance settings for search and other indexing options.','',-10,'modules/search/search.admin.inc'),('admin/config/search/settings/reindex','','','user_access','a:1:{i:0;s:17:\"administer search\";}','drupal_get_form','a:1:{i:0;s:22:\"search_reindex_confirm\";}','',31,5,0,'','admin/config/search/settings/reindex','Clear index','t','','','a:0:{}',4,'','',0,'modules/search/search.admin.inc'),('admin/config/services','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/services','Web services','t','','','a:0:{}',6,'Tools related to web services.','right',0,'modules/system/system.admin.inc'),('admin/config/services/rss-publishing','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_rss_feeds_settings\";}','',15,4,0,'','admin/config/services/rss-publishing','RSS publishing','t','','','a:0:{}',6,'Configure the site description, the number of items per feed and whether feeds should be titles/teasers/full-text.','',0,'modules/system/system.admin.inc'),('admin/config/system','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/system','System','t','','','a:0:{}',6,'General system related configuration.','right',-20,'modules/system/system.admin.inc'),('admin/config/system/actions','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}','',15,4,0,'','admin/config/system/actions','Actions','t','','','a:0:{}',6,'Manage the actions defined for your site.','',0,'modules/system/system.admin.inc'),('admin/config/system/actions/configure','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:1:{i:0;s:24:\"system_actions_configure\";}','',31,5,0,'','admin/config/system/actions/configure','Configure an advanced action','t','','','a:0:{}',4,'','',0,'modules/system/system.admin.inc'),('admin/config/system/actions/delete/%','a:1:{i:5;s:12:\"actions_load\";}','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:2:{i:0;s:26:\"system_actions_delete_form\";i:1;i:5;}','',62,6,0,'','admin/config/system/actions/delete/%','Delete action','t','','','a:0:{}',6,'Delete an action.','',0,'modules/system/system.admin.inc'),('admin/config/system/actions/manage','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}','',31,5,1,'admin/config/system/actions','admin/config/system/actions','Manage actions','t','','','a:0:{}',140,'Manage the actions defined for your site.','',-2,'modules/system/system.admin.inc'),('admin/config/system/actions/orphan','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_remove_orphans','a:0:{}','',31,5,0,'','admin/config/system/actions/orphan','Remove orphans','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/config/system/cron','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:20:\"system_cron_settings\";}','',15,4,0,'','admin/config/system/cron','Cron','t','','','a:0:{}',6,'Manage automatic site maintenance tasks.','',20,'modules/system/system.admin.inc'),('admin/config/system/site-information','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_information_settings\";}','',15,4,0,'','admin/config/system/site-information','Site information','t','','','a:0:{}',6,'Change site name, e-mail address, slogan, default front page, and number of posts per page, error pages.','',-20,'modules/system/system.admin.inc'),('admin/config/user-interface','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/user-interface','User interface','t','','','a:0:{}',6,'Tools that enhance the user interface.','right',-15,'modules/system/system.admin.inc'),('admin/config/user-interface/shortcut','','','user_access','a:1:{i:0;s:20:\"administer shortcuts\";}','shortcut_set_admin','a:0:{}','',15,4,0,'','admin/config/user-interface/shortcut','Shortcuts','t','','','a:0:{}',6,'Add and modify shortcut sets.','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/%','a:1:{i:4;s:17:\"shortcut_set_load\";}','','shortcut_set_edit_access','a:1:{i:0;i:4;}','drupal_get_form','a:2:{i:0;s:22:\"shortcut_set_customize\";i:1;i:4;}','',30,5,0,'','admin/config/user-interface/shortcut/%','Edit shortcuts','shortcut_set_title_callback','a:1:{i:0;i:4;}','','a:0:{}',6,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/%/add-link','a:1:{i:4;s:17:\"shortcut_set_load\";}','','shortcut_set_edit_access','a:1:{i:0;i:4;}','drupal_get_form','a:2:{i:0;s:17:\"shortcut_link_add\";i:1;i:4;}','',61,6,1,'admin/config/user-interface/shortcut/%','admin/config/user-interface/shortcut/%','Add shortcut','t','','','a:0:{}',388,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/%/add-link-inline','a:1:{i:4;s:17:\"shortcut_set_load\";}','','shortcut_set_edit_access','a:1:{i:0;i:4;}','shortcut_link_add_inline','a:1:{i:0;i:4;}','',61,6,0,'','admin/config/user-interface/shortcut/%/add-link-inline','Add shortcut','t','','','a:0:{}',0,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/%/delete','a:1:{i:4;s:17:\"shortcut_set_load\";}','','shortcut_set_delete_access','a:1:{i:0;i:4;}','drupal_get_form','a:2:{i:0;s:24:\"shortcut_set_delete_form\";i:1;i:4;}','',61,6,0,'','admin/config/user-interface/shortcut/%/delete','Delete shortcut set','t','','','a:0:{}',6,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/%/edit','a:1:{i:4;s:17:\"shortcut_set_load\";}','','shortcut_set_edit_access','a:1:{i:0;i:4;}','drupal_get_form','a:2:{i:0;s:22:\"shortcut_set_edit_form\";i:1;i:4;}','',61,6,1,'admin/config/user-interface/shortcut/%','admin/config/user-interface/shortcut/%','Edit set name','t','','','a:0:{}',132,'','',10,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/%/links','a:1:{i:4;s:17:\"shortcut_set_load\";}','','shortcut_set_edit_access','a:1:{i:0;i:4;}','drupal_get_form','a:2:{i:0;s:22:\"shortcut_set_customize\";i:1;i:4;}','',61,6,1,'admin/config/user-interface/shortcut/%','admin/config/user-interface/shortcut/%','List links','t','','','a:0:{}',140,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/add-set','','','user_access','a:1:{i:0;s:20:\"administer shortcuts\";}','drupal_get_form','a:1:{i:0;s:21:\"shortcut_set_add_form\";}','',31,5,1,'admin/config/user-interface/shortcut','admin/config/user-interface/shortcut','Add shortcut set','t','','','a:0:{}',388,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/link/%','a:1:{i:5;s:14:\"menu_link_load\";}','','shortcut_link_access','a:1:{i:0;i:5;}','drupal_get_form','a:2:{i:0;s:18:\"shortcut_link_edit\";i:1;i:5;}','',62,6,0,'','admin/config/user-interface/shortcut/link/%','Edit shortcut','t','','','a:0:{}',6,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/user-interface/shortcut/link/%/delete','a:1:{i:5;s:14:\"menu_link_load\";}','','shortcut_link_access','a:1:{i:0;i:5;}','drupal_get_form','a:2:{i:0;s:20:\"shortcut_link_delete\";i:1;i:5;}','',125,7,0,'','admin/config/user-interface/shortcut/link/%/delete','Delete shortcut','t','','','a:0:{}',6,'','',0,'modules/shortcut/shortcut.admin.inc'),('admin/config/workflow','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',7,3,0,'','admin/config/workflow','Workflow','t','','','a:0:{}',6,'Content workflow, editorial workflow tools.','right',5,'modules/system/system.admin.inc'),('admin/content','','','user_access','a:1:{i:0;s:23:\"access content overview\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}','',3,2,0,'','admin/content','Content','t','','','a:0:{}',6,'Administer content and comments.','',-10,'modules/node/node.admin.inc'),('admin/content/comment','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}','',7,3,1,'admin/content','admin/content','Comments','t','','','a:0:{}',134,'List and edit site comments and the comment approval queue.','',0,'modules/comment/comment.admin.inc'),('admin/content/comment/approval','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:1:{i:0;s:8:\"approval\";}','',15,4,1,'admin/content/comment','admin/content','Unapproved comments','comment_count_unpublished','','','a:0:{}',132,'','',0,'modules/comment/comment.admin.inc'),('admin/content/comment/new','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}','',15,4,1,'admin/content/comment','admin/content','Published comments','t','','','a:0:{}',140,'','',-10,'modules/comment/comment.admin.inc'),('admin/content/node','','','user_access','a:1:{i:0;s:23:\"access content overview\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}','',7,3,1,'admin/content','admin/content','Content','t','','','a:0:{}',140,'','',-10,'modules/node/node.admin.inc'),('admin/dashboard','','','user_access','a:1:{i:0;s:16:\"access dashboard\";}','dashboard_admin','a:0:{}','',3,2,0,'','admin/dashboard','Dashboard','t','','','a:0:{}',6,'View and customize your dashboard.','',-15,''),('admin/dashboard/block-content/%/%','a:2:{i:3;N;i:4;N;}','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','dashboard_show_block_content','a:2:{i:0;i:3;i:1;i:4;}','',28,5,0,'','admin/dashboard/block-content/%/%','','t','','','a:0:{}',0,'','',0,''),('admin/dashboard/configure','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','dashboard_admin_blocks','a:0:{}','',7,3,0,'','admin/dashboard/configure','Configure available dashboard blocks','t','','','a:0:{}',4,'Configure which blocks can be shown on the dashboard.','',0,''),('admin/dashboard/customize','','','user_access','a:1:{i:0;s:16:\"access dashboard\";}','dashboard_admin','a:1:{i:0;b:1;}','',7,3,0,'','admin/dashboard/customize','Customize dashboard','t','','','a:0:{}',4,'Customize your dashboard.','',0,''),('admin/dashboard/drawer','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','dashboard_show_disabled','a:0:{}','',7,3,0,'','admin/dashboard/drawer','','t','','','a:0:{}',0,'','',0,''),('admin/dashboard/update','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','dashboard_update','a:0:{}','',7,3,0,'','admin/dashboard/update','','t','','','a:0:{}',0,'','',0,''),('admin/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_main','a:0:{}','',3,2,0,'','admin/help','Help','t','','','a:0:{}',6,'Reference for usage, configuration, and modules.','',9,'modules/help/help.admin.inc'),('admin/help/block','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/block','block','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/ckeditor','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/ckeditor','ckeditor','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/color','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/color','color','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/comment','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/comment','comment','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/contextual','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/contextual','contextual','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/dashboard','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/dashboard','dashboard','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/dblog','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/dblog','dblog','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/features','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/features','features','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/field','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/field','field','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/field_sql_storage','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/field_sql_storage','field_sql_storage','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/field_ui','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/field_ui','field_ui','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/file','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/file','file','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/filter','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/filter','filter','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/help','help','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/image','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/image','image','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/list','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/list','list','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/menu','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/menu','menu','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/node','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/node','node','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/number','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/number','number','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/options','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/options','options','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/overlay','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/overlay','overlay','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/path','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/path','path','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/pathauto','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/pathauto','pathauto','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/rdf','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/rdf','rdf','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/search','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/search','search','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/shortcut','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/shortcut','shortcut','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/strongarm','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/strongarm','strongarm','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/system','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/system','system','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/taxonomy','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/taxonomy','taxonomy','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/text','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/text','text','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/token','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/token','token','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/toolbar','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/toolbar','toolbar','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/help/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}','',7,3,0,'','admin/help/user','user','t','','','a:0:{}',4,'','',0,'modules/help/help.admin.inc'),('admin/index','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_index','a:0:{}','',3,2,1,'admin','admin','Index','t','','','a:0:{}',132,'','',-18,'modules/system/system.admin.inc'),('admin/modules','','','user_access','a:1:{i:0;s:18:\"administer modules\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}','',3,2,0,'','admin/modules','Modules','t','','','a:0:{}',6,'Extend site functionality.','',-2,'modules/system/system.admin.inc'),('admin/modules/list','','','user_access','a:1:{i:0;s:18:\"administer modules\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}','',7,3,1,'admin/modules','admin/modules','List','t','','','a:0:{}',140,'','',0,'modules/system/system.admin.inc'),('admin/modules/list/confirm','','','user_access','a:1:{i:0;s:18:\"administer modules\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}','',15,4,0,'','admin/modules/list/confirm','List','t','','','a:0:{}',4,'','',0,'modules/system/system.admin.inc'),('admin/modules/uninstall','','','user_access','a:1:{i:0;s:18:\"administer modules\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}','',7,3,1,'admin/modules','admin/modules','Uninstall','t','','','a:0:{}',132,'','',20,'modules/system/system.admin.inc'),('admin/modules/uninstall/confirm','','','user_access','a:1:{i:0;s:18:\"administer modules\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}','',15,4,0,'','admin/modules/uninstall/confirm','Uninstall','t','','','a:0:{}',4,'','',0,'modules/system/system.admin.inc'),('admin/people','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}','',3,2,0,'','admin/people','People','t','','','a:0:{}',6,'Manage user accounts, roles, and permissions.','left',-4,'modules/user/user.admin.inc'),('admin/people/create','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:6:\"create\";}','',7,3,1,'admin/people','admin/people','Add user','t','','','a:0:{}',388,'','',0,'modules/user/user.admin.inc'),('admin/people/people','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}','',7,3,1,'admin/people','admin/people','List','t','','','a:0:{}',140,'Find and manage people interacting with your site.','',-10,'modules/user/user.admin.inc'),('admin/people/permissions','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:22:\"user_admin_permissions\";}','',7,3,1,'admin/people','admin/people','Permissions','t','','','a:0:{}',132,'Determine access to features by selecting permissions for roles.','',0,'modules/user/user.admin.inc'),('admin/people/permissions/list','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:22:\"user_admin_permissions\";}','',15,4,1,'admin/people/permissions','admin/people','Permissions','t','','','a:0:{}',140,'Determine access to features by selecting permissions for roles.','',-8,'modules/user/user.admin.inc'),('admin/people/permissions/roles','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:16:\"user_admin_roles\";}','',15,4,1,'admin/people/permissions','admin/people','Roles','t','','','a:0:{}',132,'List, edit, or add user roles.','',-5,'modules/user/user.admin.inc'),('admin/people/permissions/roles/delete/%','a:1:{i:5;s:14:\"user_role_load\";}','','user_role_edit_access','a:1:{i:0;i:5;}','drupal_get_form','a:2:{i:0;s:30:\"user_admin_role_delete_confirm\";i:1;i:5;}','',62,6,0,'','admin/people/permissions/roles/delete/%','Delete role','t','','','a:0:{}',6,'','',0,'modules/user/user.admin.inc'),('admin/people/permissions/roles/edit/%','a:1:{i:5;s:14:\"user_role_load\";}','','user_role_edit_access','a:1:{i:0;i:5;}','drupal_get_form','a:2:{i:0;s:15:\"user_admin_role\";i:1;i:5;}','',62,6,0,'','admin/people/permissions/roles/edit/%','Edit role','t','','','a:0:{}',6,'','',0,'modules/user/user.admin.inc'),('admin/reports','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','system_admin_menu_block_page','a:0:{}','',3,2,0,'','admin/reports','Reports','t','','','a:0:{}',6,'View reports, updates, and errors.','left',5,'modules/system/system.admin.inc'),('admin/reports/access-denied','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:13:\"access denied\";}','',7,3,0,'','admin/reports/access-denied','Top \'access denied\' errors','t','','','a:0:{}',6,'View \'access denied\' errors (403s).','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/dblog','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_overview','a:0:{}','',7,3,0,'','admin/reports/dblog','Recent log messages','t','','','a:0:{}',6,'View events that have recently been logged.','',-1,'modules/dblog/dblog.admin.inc'),('admin/reports/event/%','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_event','a:1:{i:0;i:3;}','',14,4,0,'','admin/reports/event/%','Details','t','','','a:0:{}',6,'','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','field_ui_fields_list','a:0:{}','',7,3,0,'','admin/reports/fields','Field list','t','','','a:0:{}',6,'Overview of fields on all entity types.','',0,'modules/field_ui/field_ui.admin.inc'),('admin/reports/page-not-found','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:14:\"page not found\";}','',7,3,0,'','admin/reports/page-not-found','Top \'page not found\' errors','t','','','a:0:{}',6,'View \'page not found\' errors (404s).','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/search','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:6:\"search\";}','',7,3,0,'','admin/reports/search','Top search phrases','t','','','a:0:{}',6,'View most popular search phrases.','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/status','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_status','a:0:{}','',7,3,0,'','admin/reports/status','Status report','t','','','a:0:{}',6,'Get a status report about your site\'s operation and any detected problems.','',-60,'modules/system/system.admin.inc'),('admin/reports/status/php','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_php','a:0:{}','',15,4,0,'','admin/reports/status/php','PHP','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/reports/status/rebuild','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','drupal_get_form','a:1:{i:0;s:30:\"node_configure_rebuild_confirm\";}','',15,4,0,'','admin/reports/status/rebuild','Rebuild permissions','t','','','a:0:{}',0,'','',0,'modules/node/node.admin.inc'),('admin/reports/status/run-cron','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_run_cron','a:0:{}','',15,4,0,'','admin/reports/status/run-cron','Run cron','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('admin/structure','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',3,2,0,'','admin/structure','Structure','t','','','a:0:{}',6,'Administer blocks, content types, menus, etc.','right',-8,'modules/system/system.admin.inc'),('admin/structure/block','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:1:{i:0;s:6:\"bartik\";}','',7,3,0,'','admin/structure/block','Blocks','t','','','a:0:{}',6,'Configure what block content appears in your site\'s sidebars and other regions.','',0,'modules/block/block.admin.inc'),('admin/structure/block/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}','',15,4,1,'admin/structure/block','admin/structure/block','Add block','t','','','a:0:{}',388,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/demo/bartik','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:25:\"themes/bartik/bartik.info\";s:4:\"name\";s:6:\"bartik\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:6:\"Bartik\";s:11:\"description\";s:48:\"A flexible, recolorable theme with many regions.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:3:{s:14:\"css/layout.css\";s:28:\"themes/bartik/css/layout.css\";s:13:\"css/style.css\";s:27:\"themes/bartik/css/style.css\";s:14:\"css/colors.css\";s:28:\"themes/bartik/css/colors.css\";}s:5:\"print\";a:1:{s:13:\"css/print.css\";s:27:\"themes/bartik/css/print.css\";}}s:7:\"regions\";a:20:{s:6:\"header\";s:6:\"Header\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:11:\"highlighted\";s:11:\"Highlighted\";s:8:\"featured\";s:8:\"Featured\";s:7:\"content\";s:7:\"Content\";s:13:\"sidebar_first\";s:13:\"Sidebar first\";s:14:\"sidebar_second\";s:14:\"Sidebar second\";s:14:\"triptych_first\";s:14:\"Triptych first\";s:15:\"triptych_middle\";s:15:\"Triptych middle\";s:13:\"triptych_last\";s:13:\"Triptych last\";s:18:\"footer_firstcolumn\";s:19:\"Footer first column\";s:19:\"footer_secondcolumn\";s:20:\"Footer second column\";s:18:\"footer_thirdcolumn\";s:19:\"Footer third column\";s:19:\"footer_fourthcolumn\";s:20:\"Footer fourth column\";s:6:\"footer\";s:6:\"Footer\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"0\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:28:\"themes/bartik/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:3:{s:14:\"css/layout.css\";s:28:\"themes/bartik/css/layout.css\";s:13:\"css/style.css\";s:27:\"themes/bartik/css/style.css\";s:14:\"css/colors.css\";s:28:\"themes/bartik/css/colors.css\";}s:5:\"print\";a:1:{s:13:\"css/print.css\";s:27:\"themes/bartik/css/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_demo','a:1:{i:0;s:6:\"bartik\";}','',31,5,0,'','admin/structure/block/demo/bartik','Bartik','t','','_block_custom_theme','a:1:{i:0;s:6:\"bartik\";}',0,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/demo/garland','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:111:\"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:8:\"settings\";a:1:{s:13:\"garland_width\";s:5:\"fluid\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_demo','a:1:{i:0;s:7:\"garland\";}','',31,5,0,'','admin/structure/block/demo/garland','Garland','t','','_block_custom_theme','a:1:{i:0;s:7:\"garland\";}',0,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/demo/seven','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:23:\"themes/seven/seven.info\";s:4:\"name\";s:5:\"seven\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:5:\"Seven\";s:11:\"description\";s:65:\"A simple one-column, tableless, fluid width administration theme.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:22:\"themes/seven/reset.css\";s:9:\"style.css\";s:22:\"themes/seven/style.css\";}}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"1\";}s:7:\"regions\";a:8:{s:7:\"content\";s:7:\"Content\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:13:\"sidebar_first\";s:13:\"First sidebar\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:14:\"regions_hidden\";a:3:{i:0;s:13:\"sidebar_first\";i:1;s:8:\"page_top\";i:2;s:11:\"page_bottom\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/seven/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:22:\"themes/seven/reset.css\";s:9:\"style.css\";s:22:\"themes/seven/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_demo','a:1:{i:0;s:5:\"seven\";}','',31,5,0,'','admin/structure/block/demo/seven','Seven','t','','_block_custom_theme','a:1:{i:0;s:5:\"seven\";}',0,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/demo/stark','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:23:\"themes/stark/stark.info\";s:4:\"name\";s:5:\"stark\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:18:{s:4:\"name\";s:5:\"Stark\";s:11:\"description\";s:208:\"This theme demonstrates Drupal\'s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal\'s default code, see the <a href=\"http://drupal.org/theme-guide\">Theming Guide</a>.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"layout.css\";s:23:\"themes/stark/layout.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/stark/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"layout.css\";s:23:\"themes/stark/layout.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_demo','a:1:{i:0;s:5:\"stark\";}','',31,5,0,'','admin/structure/block/demo/stark','Stark','t','','_block_custom_theme','a:1:{i:0;s:5:\"stark\";}',0,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/list/bartik','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:25:\"themes/bartik/bartik.info\";s:4:\"name\";s:6:\"bartik\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:6:\"Bartik\";s:11:\"description\";s:48:\"A flexible, recolorable theme with many regions.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:3:{s:14:\"css/layout.css\";s:28:\"themes/bartik/css/layout.css\";s:13:\"css/style.css\";s:27:\"themes/bartik/css/style.css\";s:14:\"css/colors.css\";s:28:\"themes/bartik/css/colors.css\";}s:5:\"print\";a:1:{s:13:\"css/print.css\";s:27:\"themes/bartik/css/print.css\";}}s:7:\"regions\";a:20:{s:6:\"header\";s:6:\"Header\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:11:\"highlighted\";s:11:\"Highlighted\";s:8:\"featured\";s:8:\"Featured\";s:7:\"content\";s:7:\"Content\";s:13:\"sidebar_first\";s:13:\"Sidebar first\";s:14:\"sidebar_second\";s:14:\"Sidebar second\";s:14:\"triptych_first\";s:14:\"Triptych first\";s:15:\"triptych_middle\";s:15:\"Triptych middle\";s:13:\"triptych_last\";s:13:\"Triptych last\";s:18:\"footer_firstcolumn\";s:19:\"Footer first column\";s:19:\"footer_secondcolumn\";s:20:\"Footer second column\";s:18:\"footer_thirdcolumn\";s:19:\"Footer third column\";s:19:\"footer_fourthcolumn\";s:20:\"Footer fourth column\";s:6:\"footer\";s:6:\"Footer\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"0\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:28:\"themes/bartik/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:3:{s:14:\"css/layout.css\";s:28:\"themes/bartik/css/layout.css\";s:13:\"css/style.css\";s:27:\"themes/bartik/css/style.css\";s:14:\"css/colors.css\";s:28:\"themes/bartik/css/colors.css\";}s:5:\"print\";a:1:{s:13:\"css/print.css\";s:27:\"themes/bartik/css/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:6:\"bartik\";}','',31,5,1,'admin/structure/block','admin/structure/block','Bartik','t','','','a:0:{}',140,'','',-10,'modules/block/block.admin.inc'),('admin/structure/block/list/garland','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:111:\"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:8:\"settings\";a:1:{s:13:\"garland_width\";s:5:\"fluid\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:7:\"garland\";}','',31,5,1,'admin/structure/block','admin/structure/block','Garland','t','','','a:0:{}',132,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/list/garland/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}','',63,6,1,'admin/structure/block/list/garland','admin/structure/block','Add block','t','','','a:0:{}',388,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/list/seven','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:23:\"themes/seven/seven.info\";s:4:\"name\";s:5:\"seven\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:19:{s:4:\"name\";s:5:\"Seven\";s:11:\"description\";s:65:\"A simple one-column, tableless, fluid width administration theme.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:22:\"themes/seven/reset.css\";s:9:\"style.css\";s:22:\"themes/seven/style.css\";}}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"1\";}s:7:\"regions\";a:8:{s:7:\"content\";s:7:\"Content\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:13:\"sidebar_first\";s:13:\"First sidebar\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:14:\"regions_hidden\";a:3:{i:0;s:13:\"sidebar_first\";i:1;s:8:\"page_top\";i:2;s:11:\"page_bottom\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/seven/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:22:\"themes/seven/reset.css\";s:9:\"style.css\";s:22:\"themes/seven/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:5:\"seven\";}','',31,5,1,'admin/structure/block','admin/structure/block','Seven','t','','','a:0:{}',132,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/list/seven/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}','',63,6,1,'admin/structure/block/list/seven','admin/structure/block','Add block','t','','','a:0:{}',388,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/list/stark','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:23:\"themes/stark/stark.info\";s:4:\"name\";s:5:\"stark\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:18:{s:4:\"name\";s:5:\"Stark\";s:11:\"description\";s:208:\"This theme demonstrates Drupal\'s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal\'s default code, see the <a href=\"http://drupal.org/theme-guide\">Theming Guide</a>.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"layout.css\";s:23:\"themes/stark/layout.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/stark/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}s:6:\"prefix\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"layout.css\";s:23:\"themes/stark/layout.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:5:\"stark\";}','',31,5,1,'admin/structure/block','admin/structure/block','Stark','t','','','a:0:{}',132,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/list/stark/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}','',63,6,1,'admin/structure/block/list/stark','admin/structure/block','Add block','t','','','a:0:{}',388,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/manage/%/%','a:2:{i:4;N;i:5;N;}','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:3:{i:0;s:21:\"block_admin_configure\";i:1;i:4;i:2;i:5;}','',60,6,0,'','admin/structure/block/manage/%/%','Configure block','t','','','a:0:{}',6,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/manage/%/%/configure','a:2:{i:4;N;i:5;N;}','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:3:{i:0;s:21:\"block_admin_configure\";i:1;i:4;i:2;i:5;}','',121,7,2,'admin/structure/block/manage/%/%','admin/structure/block/manage/%/%','Configure block','t','','','a:0:{}',140,'','',0,'modules/block/block.admin.inc'),('admin/structure/block/manage/%/%/delete','a:2:{i:4;N;i:5;N;}','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:3:{i:0;s:25:\"block_custom_block_delete\";i:1;i:4;i:2;i:5;}','',121,7,0,'admin/structure/block/manage/%/%','admin/structure/block/manage/%/%','Delete block','t','','','a:0:{}',132,'','',0,'modules/block/block.admin.inc'),('admin/structure/features','','','user_access','a:1:{i:0;s:15:\"manage features\";}','drupal_get_form','a:1:{i:0;s:19:\"features_admin_form\";}','',7,3,0,'','admin/structure/features','Features','t','','','a:0:{}',6,'Manage features.','',0,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/%','a:1:{i:3;a:1:{s:12:\"feature_load\";a:2:{i:0;i:3;i:1;b:1;}}}','','user_access','a:1:{i:0;s:19:\"administer features\";}','drupal_get_form','a:2:{i:0;s:25:\"features_admin_components\";i:1;i:3;}','',14,4,0,'','admin/structure/features/%','','features_get_feature_title','a:1:{i:0;i:3;}','','a:0:{}',0,'Display components of a feature.','',0,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/%/lock','a:1:{i:3;a:1:{s:12:\"feature_load\";a:3:{i:0;i:3;i:1;b:1;i:2;b:1;}}}','','user_access','a:1:{i:0;s:15:\"manage features\";}','features_admin_lock','a:3:{i:0;i:3;i:1;i:5;i:2;i:6;}','',29,5,0,'','admin/structure/features/%/lock','Lock','t','','','a:0:{}',0,'Lock a feature or components.','',0,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/%/recreate','a:1:{i:3;a:1:{s:12:\"feature_load\";a:2:{i:0;i:3;i:1;b:1;}}}','','user_access','a:1:{i:0;s:19:\"administer features\";}','drupal_get_form','a:2:{i:0;s:20:\"features_export_form\";i:1;i:3;}','',29,5,1,'admin/structure/features/%','admin/structure/features/%','Recreate','t','','','a:0:{}',132,'Recreate an existing feature.','',11,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/%/status','a:1:{i:3;a:1:{s:12:\"feature_load\";a:2:{i:0;i:3;i:1;b:1;}}}','','user_access','a:1:{i:0;s:19:\"administer features\";}','features_feature_status','a:1:{i:0;i:3;}','',29,5,0,'','admin/structure/features/%/status','Status','t','','','a:0:{}',0,'Javascript status call back.','',0,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/%/view','a:1:{i:3;a:1:{s:12:\"feature_load\";a:2:{i:0;i:3;i:1;b:1;}}}','','user_access','a:1:{i:0;s:19:\"administer features\";}','drupal_get_form','a:2:{i:0;s:25:\"features_admin_components\";i:1;i:3;}','',29,5,1,'admin/structure/features/%','admin/structure/features/%','View','t','','','a:0:{}',140,'Display components of a feature.','',-10,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/cleanup','','','user_access','a:1:{i:0;s:15:\"manage features\";}','drupal_get_form','a:2:{i:0;s:21:\"features_cleanup_form\";i:1;i:4;}','',15,4,0,'','admin/structure/features/cleanup','Cleanup','t','','','a:0:{}',0,'Clear cache after enabling/disabling a feature.','',1,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/create','','','user_access','a:1:{i:0;s:19:\"administer features\";}','drupal_get_form','a:1:{i:0;s:20:\"features_export_form\";}','',15,4,1,'admin/structure/features','admin/structure/features','Create feature','t','','','a:0:{}',132,'Create a new feature.','',10,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/manage','','','user_access','a:1:{i:0;s:15:\"manage features\";}','drupal_get_form','a:1:{i:0;s:19:\"features_admin_form\";}','',15,4,1,'admin/structure/features','admin/structure/features','Manage','t','','','a:0:{}',140,'Enable and disable features.','',0,'sites/all/modules/features/features.admin.inc'),('admin/structure/features/settings','','','user_access','a:1:{i:0;s:19:\"administer features\";}','drupal_get_form','a:1:{i:0;s:22:\"features_settings_form\";}','',15,4,1,'admin/structure/features','admin/structure/features','Settings','t','','','a:0:{}',132,'Adjust settings for using features module.','',11,'sites/all/modules/features/features.admin.inc'),('admin/structure/menu','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}','',7,3,0,'','admin/structure/menu','Menus','t','','','a:0:{}',6,'Add new menus to your site, edit existing menus, and rename and reorganize menu links.','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/add','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:14:\"menu_edit_menu\";i:1;s:3:\"add\";}','',15,4,1,'admin/structure/menu','admin/structure/menu','Add menu','t','','','a:0:{}',388,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/item/%/delete','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_item_delete_page','a:1:{i:0;i:4;}','',61,6,0,'','admin/structure/menu/item/%/delete','Delete menu link','t','','','a:0:{}',6,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/item/%/edit','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:4:\"edit\";i:2;i:4;i:3;N;}','',61,6,0,'','admin/structure/menu/item/%/edit','Edit menu link','t','','','a:0:{}',6,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/item/%/reset','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:23:\"menu_reset_item_confirm\";i:1;i:4;}','',61,6,0,'','admin/structure/menu/item/%/reset','Reset menu link','t','','','a:0:{}',6,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/list','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}','',15,4,1,'admin/structure/menu','admin/structure/menu','List menus','t','','','a:0:{}',140,'','',-10,'modules/menu/menu.admin.inc'),('admin/structure/menu/manage/%','a:1:{i:4;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:4;}','',30,5,0,'','admin/structure/menu/manage/%','Customize menu','menu_overview_title','a:1:{i:0;i:4;}','','a:0:{}',6,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/manage/%/add','a:1:{i:4;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:3:\"add\";i:2;N;i:3;i:4;}','',61,6,1,'admin/structure/menu/manage/%','admin/structure/menu/manage/%','Add link','t','','','a:0:{}',388,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/manage/%/delete','a:1:{i:4;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_delete_menu_page','a:1:{i:0;i:4;}','',61,6,0,'','admin/structure/menu/manage/%/delete','Delete menu','t','','','a:0:{}',6,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/manage/%/edit','a:1:{i:4;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:3:{i:0;s:14:\"menu_edit_menu\";i:1;s:4:\"edit\";i:2;i:4;}','',61,6,3,'admin/structure/menu/manage/%','admin/structure/menu/manage/%','Edit menu','t','','','a:0:{}',132,'','',0,'modules/menu/menu.admin.inc'),('admin/structure/menu/manage/%/list','a:1:{i:4;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:4;}','',61,6,3,'admin/structure/menu/manage/%','admin/structure/menu/manage/%','List links','t','','','a:0:{}',140,'','',-10,'modules/menu/menu.admin.inc'),('admin/structure/menu/parents','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_parent_options_js','a:0:{}','',15,4,0,'','admin/structure/menu/parents','Parent menu items','t','','','a:0:{}',0,'','',0,''),('admin/structure/menu/settings','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:1:{i:0;s:14:\"menu_configure\";}','',15,4,1,'admin/structure/menu','admin/structure/menu','Settings','t','','','a:0:{}',132,'','',5,'modules/menu/menu.admin.inc'),('admin/structure/panels','','','user_access','a:1:{i:0;s:20:\"use panels dashboard\";}','panels_admin_page','a:0:{}','',7,3,0,'','admin/structure/panels','Panels','t','','','a:0:{}',6,'Get a bird\'s eye view of items related to Panels.','',0,'sites/all/modules/panels/includes/callbacks.inc'),('admin/structure/panels/dashboard','','','user_access','a:1:{i:0;s:20:\"use panels dashboard\";}','panels_admin_page','a:0:{}','',15,4,1,'admin/structure/panels','admin/structure/panels','Dashboard','t','','','a:0:{}',140,'','',-10,'sites/all/modules/panels/includes/callbacks.inc'),('admin/structure/panels/layouts','','','ctools_export_ui_task_access','a:2:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"list\";}','ctools_export_ui_switcher_page','a:2:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"list\";}','',15,4,1,'admin/structure/panels','admin/structure/panels','Layouts','t','','','a:0:{}',132,'Add, edit or delete custom content layouts.','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/add-flexible','','','ctools_export_ui_task_access','a:2:{i:0;s:14:\"panels_layouts\";i:1;s:3:\"add\";}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:3:\"add\";i:2;s:8:\"flexible\";}','',31,5,1,'admin/structure/panels/layouts','admin/structure/panels','Add flexible layout','t','','','a:0:{}',388,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/import','','','ctools_export_ui_task_access','a:2:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"import\";}','ctools_export_ui_switcher_page','a:2:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"import\";}','',31,5,1,'admin/structure/panels/layouts','admin/structure/panels','Import','t','','','a:0:{}',388,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list','','','ctools_export_ui_task_access','a:2:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"list\";}','ctools_export_ui_switcher_page','a:2:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"list\";}','',31,5,1,'admin/structure/panels/layouts','admin/structure/panels','List','t','','','a:0:{}',140,'','',-10,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"edit\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"edit\";i:2;i:5;}','',62,6,0,'','admin/structure/panels/layouts/list/%','','t','','','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%/clone','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:5:\"clone\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:5:\"clone\";i:2;i:5;}','',125,7,0,'','admin/structure/panels/layouts/list/%/clone','Clone','t','','','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%/delete','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"delete\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"delete\";i:2;i:5;}','',125,7,0,'','admin/structure/panels/layouts/list/%/delete','Delete','t','','','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%/disable','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:7:\"disable\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:7:\"disable\";i:2;i:5;}','',125,7,0,'','admin/structure/panels/layouts/list/%/disable','Disable','t','','','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%/edit','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"edit\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:4:\"edit\";i:2;i:5;}','',125,7,1,'admin/structure/panels/layouts/list/%','admin/structure/panels/layouts/list/%','Edit','t','','','a:0:{}',140,'','',-10,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%/enable','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"enable\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"enable\";i:2;i:5;}','',125,7,0,'','admin/structure/panels/layouts/list/%/enable','Enable','t','','','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%/export','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"export\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"export\";i:2;i:5;}','',125,7,1,'admin/structure/panels/layouts/list/%','admin/structure/panels/layouts/list/%','Export','t','','','a:0:{}',132,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/layouts/list/%/revert','a:1:{i:5;a:1:{s:21:\"ctools_export_ui_load\";a:1:{i:0;s:14:\"panels_layouts\";}}}','','ctools_export_ui_task_access','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"revert\";i:2;i:5;}','ctools_export_ui_switcher_page','a:3:{i:0;s:14:\"panels_layouts\";i:1;s:6:\"delete\";i:2;i:5;}','',125,7,0,'','admin/structure/panels/layouts/list/%/revert','Revert','t','','','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/export-ui.inc'),('admin/structure/panels/settings','','','user_access','a:1:{i:0;s:20:\"use panels dashboard\";}','drupal_get_form','a:1:{i:0;s:26:\"panels_admin_settings_page\";}','',15,4,1,'admin/structure/panels','admin/structure/panels','Settings','t','','','a:0:{}',132,'','',0,'sites/all/modules/panels/includes/callbacks.inc'),('admin/structure/panels/settings/general','','','user_access','a:1:{i:0;s:23:\"administer page manager\";}','drupal_get_form','a:1:{i:0;s:26:\"panels_admin_settings_page\";}','',31,5,1,'admin/structure/panels/settings','admin/structure/panels','General','t','','','a:0:{}',140,'','',-10,'sites/all/modules/panels/includes/callbacks.inc'),('admin/structure/taxonomy','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}','',7,3,0,'','admin/structure/taxonomy','Taxonomy','t','','','a:0:{}',6,'Manage tagging, categorization, and classification of your content.','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/structure/taxonomy/%','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}','',14,4,0,'','admin/structure/taxonomy/%','','entity_label','a:2:{i:0;s:19:\"taxonomy_vocabulary\";i:1;i:3;}','','a:0:{}',6,'','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/structure/taxonomy/%/add','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:3:{i:0;s:18:\"taxonomy_form_term\";i:1;a:0:{}i:2;i:3;}','',29,5,1,'admin/structure/taxonomy/%','admin/structure/taxonomy/%','Add term','t','','','a:0:{}',388,'','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/structure/taxonomy/%/display','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:13:\"taxonomy_term\";i:2;i:3;i:3;s:7:\"default\";}','',29,5,1,'admin/structure/taxonomy/%','admin/structure/taxonomy/%','Manage display','t','','','a:0:{}',132,'','',2,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/display/default','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:7:\"default\";i:3;s:11:\"user_access\";i:4;s:19:\"administer taxonomy\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:13:\"taxonomy_term\";i:2;i:3;i:3;s:7:\"default\";}','',59,6,1,'admin/structure/taxonomy/%/display','admin/structure/taxonomy/%','Default','t','','','a:0:{}',140,'','',-10,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/display/full','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:4:\"full\";i:3;s:11:\"user_access\";i:4;s:19:\"administer taxonomy\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:13:\"taxonomy_term\";i:2;i:3;i:3;s:4:\"full\";}','',59,6,1,'admin/structure/taxonomy/%/display','admin/structure/taxonomy/%','Taxonomy term page','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/display/token','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:5:\"token\";i:3;s:11:\"user_access\";i:4;s:19:\"administer taxonomy\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:13:\"taxonomy_term\";i:2;i:3;i:3;s:5:\"token\";}','',59,6,1,'admin/structure/taxonomy/%/display','admin/structure/taxonomy/%','Tokens','t','','','a:0:{}',132,'','',1,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/edit','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:24:\"taxonomy_form_vocabulary\";i:1;i:3;}','',29,5,1,'admin/structure/taxonomy/%','admin/structure/taxonomy/%','Edit','t','','','a:0:{}',132,'','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/structure/taxonomy/%/fields','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:3:{i:0;s:28:\"field_ui_field_overview_form\";i:1;s:13:\"taxonomy_term\";i:2;i:3;}','',29,5,1,'admin/structure/taxonomy/%','admin/structure/taxonomy/%','Manage fields','t','','','a:0:{}',132,'','',1,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/fields/%','a:2:{i:3;a:1:{s:37:\"taxonomy_vocabulary_machine_name_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:5;}','',58,6,0,'','admin/structure/taxonomy/%/fields/%','','field_ui_menu_title','a:1:{i:0;i:5;}','','a:0:{}',6,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/fields/%/delete','a:2:{i:3;a:1:{s:37:\"taxonomy_vocabulary_machine_name_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:26:\"field_ui_field_delete_form\";i:1;i:5;}','',117,7,1,'admin/structure/taxonomy/%/fields/%','admin/structure/taxonomy/%/fields/%','Delete','t','','','a:0:{}',132,'','',10,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/fields/%/edit','a:2:{i:3;a:1:{s:37:\"taxonomy_vocabulary_machine_name_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:5;}','',117,7,1,'admin/structure/taxonomy/%/fields/%','admin/structure/taxonomy/%/fields/%','Edit','t','','','a:0:{}',140,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/fields/%/field-settings','a:2:{i:3;a:1:{s:37:\"taxonomy_vocabulary_machine_name_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:28:\"field_ui_field_settings_form\";i:1;i:5;}','',117,7,1,'admin/structure/taxonomy/%/fields/%','admin/structure/taxonomy/%/fields/%','Field settings','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/fields/%/widget-type','a:2:{i:3;a:1:{s:37:\"taxonomy_vocabulary_machine_name_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}i:5;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:13:\"taxonomy_term\";i:1;i:3;i:2;s:1:\"3\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:25:\"field_ui_widget_type_form\";i:1;i:5;}','',117,7,1,'admin/structure/taxonomy/%/fields/%','admin/structure/taxonomy/%/fields/%','Widget type','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/taxonomy/%/list','a:1:{i:3;s:37:\"taxonomy_vocabulary_machine_name_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}','',29,5,1,'admin/structure/taxonomy/%','admin/structure/taxonomy/%','List','t','','','a:0:{}',140,'','',-20,'modules/taxonomy/taxonomy.admin.inc'),('admin/structure/taxonomy/add','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:24:\"taxonomy_form_vocabulary\";}','',15,4,1,'admin/structure/taxonomy','admin/structure/taxonomy','Add vocabulary','t','','','a:0:{}',388,'','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/structure/taxonomy/list','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}','',15,4,1,'admin/structure/taxonomy','admin/structure/taxonomy','List','t','','','a:0:{}',140,'','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/structure/types','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','node_overview_types','a:0:{}','',7,3,0,'','admin/structure/types','Content types','t','','','a:0:{}',6,'Manage content types, including default status, front page promotion, comment settings, etc.','',0,'modules/node/content_types.inc'),('admin/structure/types/add','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:1:{i:0;s:14:\"node_type_form\";}','',15,4,1,'admin/structure/types','admin/structure/types','Add content type','t','','','a:0:{}',388,'','',0,'modules/node/content_types.inc'),('admin/structure/types/list','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','node_overview_types','a:0:{}','',15,4,1,'admin/structure/types','admin/structure/types','List','t','','','a:0:{}',140,'','',-10,'modules/node/content_types.inc'),('admin/structure/types/manage/%','a:1:{i:4;s:14:\"node_type_load\";}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;i:4;}','',30,5,0,'','admin/structure/types/manage/%','Edit content type','node_type_page_title','a:1:{i:0;i:4;}','','a:0:{}',6,'','',0,'modules/node/content_types.inc'),('admin/structure/types/manage/%/comment/display','a:1:{i:4;s:22:\"comment_node_type_load\";}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:7:\"comment\";i:2;i:4;i:3;s:7:\"default\";}','',123,7,1,'admin/structure/types/manage/%','admin/structure/types/manage/%','Comment display','t','','','a:0:{}',132,'','',4,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/display/default','a:1:{i:4;s:22:\"comment_node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:7:\"default\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:7:\"comment\";i:2;i:4;i:3;s:7:\"default\";}','',247,8,1,'admin/structure/types/manage/%/comment/display','admin/structure/types/manage/%','Default','t','','','a:0:{}',140,'','',-10,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/display/full','a:1:{i:4;s:22:\"comment_node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:4:\"full\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:7:\"comment\";i:2;i:4;i:3;s:4:\"full\";}','',247,8,1,'admin/structure/types/manage/%/comment/display','admin/structure/types/manage/%','Full comment','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/display/token','a:1:{i:4;s:22:\"comment_node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:5:\"token\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:7:\"comment\";i:2;i:4;i:3;s:5:\"token\";}','',247,8,1,'admin/structure/types/manage/%/comment/display','admin/structure/types/manage/%','Tokens','t','','','a:0:{}',132,'','',1,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/fields','a:1:{i:4;s:22:\"comment_node_type_load\";}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:28:\"field_ui_field_overview_form\";i:1;s:7:\"comment\";i:2;i:4;}','',123,7,1,'admin/structure/types/manage/%','admin/structure/types/manage/%','Comment fields','t','','','a:0:{}',132,'','',3,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/fields/%','a:2:{i:4;a:1:{s:22:\"comment_node_type_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:7;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:7;}','',246,8,0,'','admin/structure/types/manage/%/comment/fields/%','','field_ui_menu_title','a:1:{i:0;i:7;}','','a:0:{}',6,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/fields/%/delete','a:2:{i:4;a:1:{s:22:\"comment_node_type_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:7;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:26:\"field_ui_field_delete_form\";i:1;i:7;}','',493,9,1,'admin/structure/types/manage/%/comment/fields/%','admin/structure/types/manage/%/comment/fields/%','Delete','t','','','a:0:{}',132,'','',10,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/fields/%/edit','a:2:{i:4;a:1:{s:22:\"comment_node_type_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:7;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:7;}','',493,9,1,'admin/structure/types/manage/%/comment/fields/%','admin/structure/types/manage/%/comment/fields/%','Edit','t','','','a:0:{}',140,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/fields/%/field-settings','a:2:{i:4;a:1:{s:22:\"comment_node_type_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:7;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:28:\"field_ui_field_settings_form\";i:1;i:7;}','',493,9,1,'admin/structure/types/manage/%/comment/fields/%','admin/structure/types/manage/%/comment/fields/%','Field settings','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/comment/fields/%/widget-type','a:2:{i:4;a:1:{s:22:\"comment_node_type_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:7;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:7:\"comment\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:25:\"field_ui_widget_type_form\";i:1;i:7;}','',493,9,1,'admin/structure/types/manage/%/comment/fields/%','admin/structure/types/manage/%/comment/fields/%','Widget type','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/delete','a:1:{i:4;s:14:\"node_type_load\";}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;i:4;}','',61,6,0,'','admin/structure/types/manage/%/delete','Delete','t','','','a:0:{}',6,'','',0,'modules/node/content_types.inc'),('admin/structure/types/manage/%/display','a:1:{i:4;s:14:\"node_type_load\";}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:7:\"default\";}','',61,6,1,'admin/structure/types/manage/%','admin/structure/types/manage/%','Manage display','t','','','a:0:{}',132,'','',2,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/display/default','a:1:{i:4;s:14:\"node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"node\";i:1;i:4;i:2;s:7:\"default\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:7:\"default\";}','',123,7,1,'admin/structure/types/manage/%/display','admin/structure/types/manage/%','Default','t','','','a:0:{}',140,'','',-10,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/display/full','a:1:{i:4;s:14:\"node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"node\";i:1;i:4;i:2;s:4:\"full\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:4:\"full\";}','',123,7,1,'admin/structure/types/manage/%/display','admin/structure/types/manage/%','Full content','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/display/rss','a:1:{i:4;s:14:\"node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"node\";i:1;i:4;i:2;s:3:\"rss\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:3:\"rss\";}','',123,7,1,'admin/structure/types/manage/%/display','admin/structure/types/manage/%','RSS','t','','','a:0:{}',132,'','',2,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/display/search_index','a:1:{i:4;s:14:\"node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"node\";i:1;i:4;i:2;s:12:\"search_index\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:12:\"search_index\";}','',123,7,1,'admin/structure/types/manage/%/display','admin/structure/types/manage/%','Search index','t','','','a:0:{}',132,'','',3,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/display/search_result','a:1:{i:4;s:14:\"node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"node\";i:1;i:4;i:2;s:13:\"search_result\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:13:\"search_result\";}','',123,7,1,'admin/structure/types/manage/%/display','admin/structure/types/manage/%','Search result highlighting input','t','','','a:0:{}',132,'','',4,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/display/teaser','a:1:{i:4;s:14:\"node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"node\";i:1;i:4;i:2;s:6:\"teaser\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:6:\"teaser\";}','',123,7,1,'admin/structure/types/manage/%/display','admin/structure/types/manage/%','Teaser','t','','','a:0:{}',132,'','',1,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/display/token','a:1:{i:4;s:14:\"node_type_load\";}','','_field_ui_view_mode_menu_access','a:5:{i:0;s:4:\"node\";i:1;i:4;i:2;s:5:\"token\";i:3;s:11:\"user_access\";i:4;s:24:\"administer content types\";}','drupal_get_form','a:4:{i:0;s:30:\"field_ui_display_overview_form\";i:1;s:4:\"node\";i:2;i:4;i:3;s:5:\"token\";}','',123,7,1,'admin/structure/types/manage/%/display','admin/structure/types/manage/%','Tokens','t','','','a:0:{}',132,'','',5,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/edit','a:1:{i:4;s:14:\"node_type_load\";}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;i:4;}','',61,6,1,'admin/structure/types/manage/%','admin/structure/types/manage/%','Edit','t','','','a:0:{}',140,'','',0,'modules/node/content_types.inc'),('admin/structure/types/manage/%/fields','a:1:{i:4;s:14:\"node_type_load\";}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:28:\"field_ui_field_overview_form\";i:1;s:4:\"node\";i:2;i:4;}','',61,6,1,'admin/structure/types/manage/%','admin/structure/types/manage/%','Manage fields','t','','','a:0:{}',132,'','',1,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/fields/%','a:2:{i:4;a:1:{s:14:\"node_type_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:6;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:6;}','',122,7,0,'','admin/structure/types/manage/%/fields/%','','field_ui_menu_title','a:1:{i:0;i:6;}','','a:0:{}',6,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/fields/%/delete','a:2:{i:4;a:1:{s:14:\"node_type_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:6;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:26:\"field_ui_field_delete_form\";i:1;i:6;}','',245,8,1,'admin/structure/types/manage/%/fields/%','admin/structure/types/manage/%/fields/%','Delete','t','','','a:0:{}',132,'','',10,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/fields/%/edit','a:2:{i:4;a:1:{s:14:\"node_type_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:6;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"field_ui_field_edit_form\";i:1;i:6;}','',245,8,1,'admin/structure/types/manage/%/fields/%','admin/structure/types/manage/%/fields/%','Edit','t','','','a:0:{}',140,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/fields/%/field-settings','a:2:{i:4;a:1:{s:14:\"node_type_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:6;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:28:\"field_ui_field_settings_form\";i:1;i:6;}','',245,8,1,'admin/structure/types/manage/%/fields/%','admin/structure/types/manage/%/fields/%','Field settings','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/structure/types/manage/%/fields/%/widget-type','a:2:{i:4;a:1:{s:14:\"node_type_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}i:6;a:1:{s:18:\"field_ui_menu_load\";a:4:{i:0;s:4:\"node\";i:1;i:4;i:2;s:1:\"4\";i:3;s:4:\"%map\";}}}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:25:\"field_ui_widget_type_form\";i:1;i:6;}','',245,8,1,'admin/structure/types/manage/%/fields/%','admin/structure/types/manage/%/fields/%','Widget type','t','','','a:0:{}',132,'','',0,'modules/field_ui/field_ui.admin.inc'),('admin/tasks','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}','',3,2,1,'admin','admin','Tasks','t','','','a:0:{}',140,'','',-20,'modules/system/system.admin.inc'),('batch','','','1','a:0:{}','system_batch_page','a:0:{}','',1,1,0,'','batch','','t','','_system_batch_theme','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('ckeditor/disable/wysiwyg/%','a:1:{i:3;N;}','','1','a:1:{i:0;s:19:\"administer ckeditor\";}','ckeditor_disable_wysiwyg','a:1:{i:0;i:3;}','',14,4,0,'','ckeditor/disable/wysiwyg/%','Disable the WYSIWYG module','t','','','a:0:{}',0,'Disable WYSIWYG module.','',0,'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),('ckeditor/xss','','','1','a:0:{}','ckeditor_filter_xss','a:0:{}','',3,2,0,'','ckeditor/xss','XSS Filter','t','','','a:0:{}',0,'XSS Filter.','',0,'sites/all/modules/ckeditor/includes/ckeditor.page.inc'),('comment/%','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:15:\"access comments\";}','comment_permalink','a:1:{i:0;i:1;}','',2,2,0,'','comment/%','Comment permalink','t','','','a:0:{}',6,'','',0,''),('comment/%/approve','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_approve','a:1:{i:0;i:1;}','',5,3,0,'','comment/%/approve','Approve','t','','','a:0:{}',6,'','',1,'modules/comment/comment.pages.inc'),('comment/%/delete','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_confirm_delete_page','a:1:{i:0;i:1;}','',5,3,1,'comment/%','comment/%','Delete','t','','','a:0:{}',132,'','',2,'modules/comment/comment.admin.inc'),('comment/%/edit','a:1:{i:1;s:12:\"comment_load\";}','','comment_access','a:2:{i:0;s:4:\"edit\";i:1;i:1;}','comment_edit_page','a:1:{i:0;i:1;}','',5,3,1,'comment/%','comment/%','Edit','t','','','a:0:{}',132,'','',0,''),('comment/%/view','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:15:\"access comments\";}','comment_permalink','a:1:{i:0;i:1;}','',5,3,1,'comment/%','comment/%','View comment','t','','','a:0:{}',140,'','',-10,''),('comment/reply/%','a:1:{i:2;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:2;}','comment_reply','a:1:{i:0;i:2;}','',6,3,0,'','comment/reply/%','Add new comment','t','','','a:0:{}',6,'','',0,'modules/comment/comment.pages.inc'),('ctools/autocomplete/%','a:1:{i:2;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_content_autocomplete_entity','a:1:{i:0;i:2;}','',6,3,0,'','ctools/autocomplete/%','','t','','','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/content.menu.inc'),('ctools/context/ajax/access/add','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_access_ajax_add','a:0:{}','',31,5,0,'','ctools/context/ajax/access/add','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/context-access-admin.inc'),('ctools/context/ajax/access/configure','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_access_ajax_edit','a:0:{}','',31,5,0,'','ctools/context/ajax/access/configure','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/context-access-admin.inc'),('ctools/context/ajax/access/delete','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_access_ajax_delete','a:0:{}','',31,5,0,'','ctools/context/ajax/access/delete','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/context-access-admin.inc'),('ctools/context/ajax/add','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_context_ajax_item_add','a:0:{}','',15,4,0,'','ctools/context/ajax/add','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/context-admin.inc'),('ctools/context/ajax/configure','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_context_ajax_item_edit','a:0:{}','',15,4,0,'','ctools/context/ajax/configure','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/context-admin.inc'),('ctools/context/ajax/delete','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_context_ajax_item_delete','a:0:{}','',15,4,0,'','ctools/context/ajax/delete','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'sites/all/modules/ctools/includes/context-admin.inc'),('entityreference/autocomplete/single/%/%/%','a:3:{i:3;N;i:4;N;i:5;N;}','','entityreference_autocomplete_access_callback','a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}','entityreference_autocomplete_callback','a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}','',56,6,0,'','entityreference/autocomplete/single/%/%/%','Entity Reference Autocomplete','t','','','a:0:{}',0,'','',0,''),('entityreference/autocomplete/tags/%/%/%','a:3:{i:3;N;i:4;N;i:5;N;}','','entityreference_autocomplete_access_callback','a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}','entityreference_autocomplete_callback','a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}','',56,6,0,'','entityreference/autocomplete/tags/%/%/%','Entity Reference Autocomplete','t','','','a:0:{}',0,'','',0,''),('features/ajaxcallback/%','a:1:{i:2;N;}','','user_access','a:1:{i:0;s:19:\"administer features\";}','features_export_components_json','a:1:{i:0;i:2;}','',6,3,0,'','features/ajaxcallback/%','','features_get_feature_components','','','a:0:{}',0,'Return components of a feature.','',0,'sites/all/modules/features/features.admin.inc'),('features/autocomplete/packages','','','user_access','a:1:{i:0;s:15:\"manage features\";}','features_autocomplete_packages','a:0:{}','',7,3,0,'','features/autocomplete/packages','','t','','','a:0:{}',0,'','',0,'sites/all/modules/features/features.admin.inc'),('file/ajax','','','user_access','a:1:{i:0;s:14:\"access content\";}','file_ajax_upload','a:0:{}','ajax_deliver',3,2,0,'','file/ajax','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,''),('file/progress','','','user_access','a:1:{i:0;s:14:\"access content\";}','file_ajax_progress','a:0:{}','',3,2,0,'','file/progress','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,''),('filter/tips','','','1','a:0:{}','filter_tips_long','a:0:{}','',3,2,0,'','filter/tips','Compose tips','t','','','a:0:{}',20,'','',0,'modules/filter/filter.pages.inc'),('node','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_page_default','a:0:{}','',1,1,0,'','node','','t','','','a:0:{}',0,'','',0,''),('node/%','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}','',2,2,0,'','node/%','','node_page_title','a:1:{i:0;i:1;}','','a:0:{}',6,'','',0,''),('node/%/delete','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"delete\";i:1;i:1;}','drupal_get_form','a:2:{i:0;s:19:\"node_delete_confirm\";i:1;i:1;}','',5,3,2,'node/%','node/%','Delete','t','','','a:0:{}',132,'','',1,'modules/node/node.pages.inc'),('node/%/edit','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"update\";i:1;i:1;}','node_page_edit','a:1:{i:0;i:1;}','',5,3,3,'node/%','node/%','Edit','t','','','a:0:{}',132,'','',0,'modules/node/node.pages.inc'),('node/%/revisions','a:1:{i:1;s:9:\"node_load\";}','','_node_revision_access','a:1:{i:0;i:1;}','node_revision_overview','a:1:{i:0;i:1;}','',5,3,1,'node/%','node/%','Revisions','t','','','a:0:{}',132,'','',2,'modules/node/node.pages.inc'),('node/%/revisions/%/delete','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"delete\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_delete_confirm\";i:1;i:1;}','',21,5,0,'','node/%/revisions/%/delete','Delete earlier revision','t','','','a:0:{}',6,'','',0,'modules/node/node.pages.inc'),('node/%/revisions/%/revert','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"update\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_revert_confirm\";i:1;i:1;}','',21,5,0,'','node/%/revisions/%/revert','Revert to earlier revision','t','','','a:0:{}',6,'','',0,'modules/node/node.pages.inc'),('node/%/revisions/%/view','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:1:{i:0;i:1;}','node_show','a:2:{i:0;i:1;i:1;b:1;}','',21,5,0,'','node/%/revisions/%/view','Revisions','t','','','a:0:{}',6,'','',0,''),('node/%/view','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}','',5,3,1,'node/%','node/%','View','t','','','a:0:{}',140,'','',-10,''),('node/add','','','_node_add_access','a:0:{}','node_add_page','a:0:{}','',3,2,0,'','node/add','Add content','t','','','a:0:{}',6,'','',0,'modules/node/node.pages.inc'),('node/add/article','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:7:\"article\";}','node_add','a:1:{i:0;s:7:\"article\";}','',7,3,0,'','node/add/article','Article','check_plain','','','a:0:{}',6,'Use <em>articles</em> for time-sensitive content like news, press releases or blog posts.','',0,'modules/node/node.pages.inc'),('node/add/page','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:4:\"page\";}','node_add','a:1:{i:0;s:4:\"page\";}','',7,3,0,'','node/add/page','Basic page','check_plain','','','a:0:{}',6,'Use <em>basic pages</em> for your static content, such as an \'About us\' page.','',0,'modules/node/node.pages.inc'),('overlay-ajax/%','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:14:\"access overlay\";}','overlay_ajax_render_region','a:1:{i:0;i:1;}','',2,2,0,'','overlay-ajax/%','','t','','','a:0:{}',0,'','',0,''),('overlay/dismiss-message','','','user_access','a:1:{i:0;s:14:\"access overlay\";}','overlay_user_dismiss_message','a:0:{}','',3,2,0,'','overlay/dismiss-message','','t','','','a:0:{}',0,'','',0,''),('panels/ajax','','','user_access','a:1:{i:0;s:14:\"access content\";}','panels_ajax_router','a:0:{}','ajax_deliver',3,2,0,'','panels/ajax','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,''),('rss.xml','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_feed','a:2:{i:0;b:0;i:1;a:0:{}}','',1,1,0,'','rss.xml','RSS feed','t','','','a:0:{}',0,'','',0,''),('search','','','search_is_active','a:0:{}','search_view','a:0:{}','',1,1,0,'','search','Search','t','','','a:0:{}',20,'','',0,'modules/search/search.pages.inc'),('search/node','','','_search_menu_access','a:1:{i:0;s:4:\"node\";}','search_view','a:2:{i:0;s:4:\"node\";i:1;s:0:\"\";}','',3,2,1,'search','search','Content','t','','','a:0:{}',132,'','',-10,'modules/search/search.pages.inc'),('search/node/%','a:1:{i:2;a:1:{s:14:\"menu_tail_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','a:1:{i:2;s:16:\"menu_tail_to_arg\";}','_search_menu_access','a:1:{i:0;s:4:\"node\";}','search_view','a:2:{i:0;s:4:\"node\";i:1;i:2;}','',6,3,1,'search/node','search/node/%','Content','t','','','a:0:{}',132,'','',0,'modules/search/search.pages.inc'),('search/user','','','_search_menu_access','a:1:{i:0;s:4:\"user\";}','search_view','a:2:{i:0;s:4:\"user\";i:1;s:0:\"\";}','',3,2,1,'search','search','Users','t','','','a:0:{}',132,'','',0,'modules/search/search.pages.inc'),('search/user/%','a:1:{i:2;a:1:{s:14:\"menu_tail_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','a:1:{i:2;s:16:\"menu_tail_to_arg\";}','_search_menu_access','a:1:{i:0;s:4:\"user\";}','search_view','a:2:{i:0;s:4:\"user\";i:1;i:2;}','',6,3,1,'search/node','search/node/%','Users','t','','','a:0:{}',132,'','',0,'modules/search/search.pages.inc'),('sites/default/files/styles/%','a:1:{i:4;s:16:\"image_style_load\";}','','1','a:0:{}','image_style_deliver','a:1:{i:0;i:4;}','',30,5,0,'','sites/default/files/styles/%','Generate image style','t','','','a:0:{}',0,'','',0,''),('system/ajax','','','1','a:0:{}','ajax_form_callback','a:0:{}','ajax_deliver',3,2,0,'','system/ajax','AHAH callback','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'includes/form.inc'),('system/files','','','1','a:0:{}','file_download','a:1:{i:0;s:7:\"private\";}','',3,2,0,'','system/files','File download','t','','','a:0:{}',0,'','',0,''),('system/files/styles/%','a:1:{i:3;s:16:\"image_style_load\";}','','1','a:0:{}','image_style_deliver','a:1:{i:0;i:3;}','',14,4,0,'','system/files/styles/%','Generate image style','t','','','a:0:{}',0,'','',0,''),('system/temporary','','','1','a:0:{}','file_download','a:1:{i:0;s:9:\"temporary\";}','',3,2,0,'','system/temporary','Temporary files','t','','','a:0:{}',0,'','',0,''),('system/timezone','','','1','a:0:{}','system_timezone','a:0:{}','',3,2,0,'','system/timezone','Time zone','t','','','a:0:{}',0,'','',0,'modules/system/system.admin.inc'),('taxonomy/autocomplete','','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_autocomplete','a:0:{}','',3,2,0,'','taxonomy/autocomplete','Autocomplete taxonomy','t','','','a:0:{}',0,'','',0,'modules/taxonomy/taxonomy.pages.inc'),('taxonomy/term/%','a:1:{i:2;s:18:\"taxonomy_term_load\";}','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_term_page','a:1:{i:0;i:2;}','',6,3,0,'','taxonomy/term/%','Taxonomy term','taxonomy_term_title','a:1:{i:0;i:2;}','','a:0:{}',6,'','',0,'modules/taxonomy/taxonomy.pages.inc'),('taxonomy/term/%/edit','a:1:{i:2;s:18:\"taxonomy_term_load\";}','','taxonomy_term_edit_access','a:1:{i:0;i:2;}','drupal_get_form','a:3:{i:0;s:18:\"taxonomy_form_term\";i:1;i:2;i:2;N;}','',13,4,1,'taxonomy/term/%','taxonomy/term/%','Edit','t','','','a:0:{}',132,'','',10,'modules/taxonomy/taxonomy.admin.inc'),('taxonomy/term/%/feed','a:1:{i:2;s:18:\"taxonomy_term_load\";}','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_term_feed','a:1:{i:0;i:2;}','',13,4,0,'','taxonomy/term/%/feed','Taxonomy term','taxonomy_term_title','a:1:{i:0;i:2;}','','a:0:{}',0,'','',0,'modules/taxonomy/taxonomy.pages.inc'),('taxonomy/term/%/view','a:1:{i:2;s:18:\"taxonomy_term_load\";}','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_term_page','a:1:{i:0;i:2;}','',13,4,1,'taxonomy/term/%','taxonomy/term/%','View','t','','','a:0:{}',140,'','',0,'modules/taxonomy/taxonomy.pages.inc'),('token/autocomplete/%','a:1:{i:2;s:15:\"token_type_load\";}','','1','a:0:{}','token_autocomplete_token','a:1:{i:0;i:2;}','',6,3,0,'','token/autocomplete/%','','t','','','a:0:{}',0,'','',0,'sites/all/modules/token/token.pages.inc'),('token/flush-cache','','','user_access','a:1:{i:0;s:12:\"flush caches\";}','token_flush_cache_callback','a:0:{}','',3,2,0,'','token/flush-cache','','t','','','a:0:{}',0,'','',0,'sites/all/modules/token/token.pages.inc'),('token/tree','','','1','a:0:{}','token_page_output_tree','a:0:{}','',3,2,0,'','token/tree','','t','','ajax_base_page_theme','a:0:{}',0,'','',0,'sites/all/modules/token/token.pages.inc'),('toolbar/toggle','','','user_access','a:1:{i:0;s:14:\"access toolbar\";}','toolbar_toggle_page','a:0:{}','',3,2,0,'','toolbar/toggle','Toggle drawer visibility','t','','','a:0:{}',0,'','',0,''),('user','','','1','a:0:{}','user_page','a:0:{}','',1,1,0,'','user','User account','user_menu_title','','','a:0:{}',6,'','',-10,'modules/user/user.pages.inc'),('user/%','a:1:{i:1;s:9:\"user_load\";}','','user_view_access','a:1:{i:0;i:1;}','user_view_page','a:1:{i:0;i:1;}','',2,2,0,'','user/%','My account','user_page_title','a:1:{i:0;i:1;}','','a:0:{}',6,'','',0,''),('user/%/cancel','a:1:{i:1;s:9:\"user_load\";}','','user_cancel_access','a:1:{i:0;i:1;}','drupal_get_form','a:2:{i:0;s:24:\"user_cancel_confirm_form\";i:1;i:1;}','',5,3,0,'','user/%/cancel','Cancel account','t','','','a:0:{}',6,'','',0,'modules/user/user.pages.inc'),('user/%/cancel/confirm/%/%','a:3:{i:1;s:9:\"user_load\";i:4;N;i:5;N;}','','user_cancel_access','a:1:{i:0;i:1;}','user_cancel_confirm','a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}','',44,6,0,'','user/%/cancel/confirm/%/%','Confirm account cancellation','t','','','a:0:{}',6,'','',0,'modules/user/user.pages.inc'),('user/%/edit','a:1:{i:1;s:9:\"user_load\";}','','user_edit_access','a:1:{i:0;i:1;}','drupal_get_form','a:2:{i:0;s:17:\"user_profile_form\";i:1;i:1;}','',5,3,1,'user/%','user/%','Edit','t','','','a:0:{}',132,'','',0,'modules/user/user.pages.inc'),('user/%/edit/account','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','drupal_get_form','a:2:{i:0;s:17:\"user_profile_form\";i:1;i:1;}','',11,4,1,'user/%/edit','user/%','Account','t','','','a:0:{}',140,'','',0,'modules/user/user.pages.inc'),('user/%/shortcuts','a:1:{i:1;s:9:\"user_load\";}','','shortcut_set_switch_access','a:1:{i:0;i:1;}','drupal_get_form','a:2:{i:0;s:19:\"shortcut_set_switch\";i:1;i:1;}','',5,3,1,'user/%','user/%','Shortcuts','t','','','a:0:{}',132,'','',0,'modules/shortcut/shortcut.admin.inc'),('user/%/view','a:1:{i:1;s:9:\"user_load\";}','','user_view_access','a:1:{i:0;i:1;}','user_view_page','a:1:{i:0;i:1;}','',5,3,1,'user/%','user/%','View','t','','','a:0:{}',140,'','',-10,''),('user/autocomplete','','','user_access','a:1:{i:0;s:20:\"access user profiles\";}','user_autocomplete','a:0:{}','',3,2,0,'','user/autocomplete','User autocomplete','t','','','a:0:{}',0,'','',0,'modules/user/user.pages.inc'),('user/login','','','user_is_anonymous','a:0:{}','user_page','a:0:{}','',3,2,1,'user','user','Log in','t','','','a:0:{}',140,'','',0,'modules/user/user.pages.inc'),('user/logout','','','user_is_logged_in','a:0:{}','user_logout','a:0:{}','',3,2,0,'','user/logout','Log out','t','','','a:0:{}',6,'','',10,'modules/user/user.pages.inc'),('user/password','','','1','a:0:{}','drupal_get_form','a:1:{i:0;s:9:\"user_pass\";}','',3,2,1,'user','user','Request new password','t','','','a:0:{}',132,'','',0,'modules/user/user.pages.inc'),('user/register','','','user_register_access','a:0:{}','drupal_get_form','a:1:{i:0;s:18:\"user_register_form\";}','',3,2,1,'user','user','Create new account','t','','','a:0:{}',132,'','',0,''),('user/reset/%/%/%','a:3:{i:2;N;i:3;N;i:4;N;}','','1','a:0:{}','drupal_get_form','a:4:{i:0;s:15:\"user_pass_reset\";i:1;i:2;i:2;i:3;i:3;i:4;}','',24,5,0,'','user/reset/%/%/%','Reset password','t','','','a:0:{}',0,'','',0,'modules/user/user.pages.inc');
/*!40000 ALTER TABLE `menu_router` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `vid` int(10) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` varchar(255) NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies which realm/grant pairs a user must possess in...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_access`
--

LOCK TABLES `node_access` WRITE;
/*!40000 ALTER TABLE `node_access` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `node_access` VALUES (0,0,'all',1,0,0);
/*!40000 ALTER TABLE `node_access` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `node_comment_statistics`
--

DROP TABLE IF EXISTS `node_comment_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains statistics of node and comments posts to show ...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_comment_statistics`
--

LOCK TABLES `node_comment_statistics` WRITE;
/*!40000 ALTER TABLE `node_comment_statistics` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `node_comment_statistics` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `node_revision`
--

DROP TABLE IF EXISTS `node_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revision`
--

LOCK TABLES `node_revision` WRITE;
/*!40000 ALTER TABLE `node_revision` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `node_revision` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` varchar(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `help` mediumtext NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` tinyint(3) unsigned NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_type`
--

LOCK TABLES `node_type` WRITE;
/*!40000 ALTER TABLE `node_type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `node_type` VALUES ('article','Article','node_content','node','Use <em>articles</em> for time-sensitive content like news, press releases or blog posts.','',1,'Title',1,1,0,0,'article'),('page','Basic page','node_content','node','Use <em>basic pages</em> for your static content, such as an \'About us\' page.','',1,'Title',1,1,0,0,'page');
/*!40000 ALTER TABLE `node_type` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `panels_display`
--

DROP TABLE IF EXISTS `panels_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_display` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) DEFAULT '',
  `layout_settings` longtext,
  `panel_settings` longtext,
  `cache` text,
  `title` varchar(255) DEFAULT '',
  `hide_title` tinyint(4) DEFAULT '0',
  `title_pane` int(11) DEFAULT '0',
  `uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panels_display`
--

LOCK TABLES `panels_display` WRITE;
/*!40000 ALTER TABLE `panels_display` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `panels_display` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `panels_layout`
--

DROP TABLE IF EXISTS `panels_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_layout` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this layout.',
  `admin_description` longtext COMMENT 'Administrative description for this layout.',
  `category` varchar(255) DEFAULT NULL COMMENT 'Administrative category for this layout.',
  `plugin` varchar(255) DEFAULT NULL COMMENT 'The layout plugin that owns this layout.',
  `settings` longtext COMMENT 'Serialized settings for the actual layout. The contents of this field are up to the plugin that uses it.',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains exportable customized layouts for this site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panels_layout`
--

LOCK TABLES `panels_layout` WRITE;
/*!40000 ALTER TABLE `panels_layout` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `panels_layout` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `panels_pane`
--

DROP TABLE IF EXISTS `panels_pane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_pane` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL DEFAULT '0',
  `panel` varchar(32) DEFAULT '',
  `type` varchar(32) DEFAULT '',
  `subtype` varchar(64) DEFAULT '',
  `shown` tinyint(4) DEFAULT '1',
  `access` longtext,
  `configuration` longtext,
  `cache` longtext,
  `style` longtext,
  `css` longtext,
  `extras` longtext,
  `position` smallint(6) DEFAULT '0',
  `locks` longtext,
  `uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `did_idx` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panels_pane`
--

LOCK TABLES `panels_pane` WRITE;
/*!40000 ALTER TABLE `panels_pane` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `panels_pane` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `panels_renderer_pipeline`
--

DROP TABLE IF EXISTS `panels_renderer_pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_renderer_pipeline` (
  `rpid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this pipeline.',
  `admin_description` longtext COMMENT 'Administrative description for this pipeline.',
  `weight` smallint(6) DEFAULT '0',
  `settings` longtext COMMENT 'Serialized settings for the actual pipeline. The contents of this field are up to the plugin that uses it.',
  PRIMARY KEY (`rpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains renderer pipelines for Panels. Each pipeline...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panels_renderer_pipeline`
--

LOCK TABLES `panels_renderer_pipeline` WRITE;
/*!40000 ALTER TABLE `panels_renderer_pipeline` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `panels_renderer_pipeline` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY (`item_id`),
  KEY `name_created` (`name`,`created`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `rdf_mapping`
--

DROP TABLE IF EXISTS `rdf_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.',
  PRIMARY KEY (`type`,`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores custom RDF mappings for user defined content types...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdf_mapping`
--

LOCK TABLES `rdf_mapping` WRITE;
/*!40000 ALTER TABLE `rdf_mapping` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `rdf_mapping` VALUES ('node','article','a:11:{s:11:\"field_image\";a:2:{s:10:\"predicates\";a:2:{i:0;s:8:\"og:image\";i:1;s:12:\"rdfs:seeAlso\";}s:4:\"type\";s:3:\"rel\";}s:10:\"field_tags\";a:2:{s:10:\"predicates\";a:1:{i:0;s:10:\"dc:subject\";}s:4:\"type\";s:3:\"rel\";}s:7:\"rdftype\";a:2:{i:0;s:9:\"sioc:Item\";i:1;s:13:\"foaf:Document\";}s:5:\"title\";a:1:{s:10:\"predicates\";a:1:{i:0;s:8:\"dc:title\";}}s:7:\"created\";a:3:{s:10:\"predicates\";a:2:{i:0;s:7:\"dc:date\";i:1;s:10:\"dc:created\";}s:8:\"datatype\";s:12:\"xsd:dateTime\";s:8:\"callback\";s:12:\"date_iso8601\";}s:7:\"changed\";a:3:{s:10:\"predicates\";a:1:{i:0;s:11:\"dc:modified\";}s:8:\"datatype\";s:12:\"xsd:dateTime\";s:8:\"callback\";s:12:\"date_iso8601\";}s:4:\"body\";a:1:{s:10:\"predicates\";a:1:{i:0;s:15:\"content:encoded\";}}s:3:\"uid\";a:2:{s:10:\"predicates\";a:1:{i:0;s:16:\"sioc:has_creator\";}s:4:\"type\";s:3:\"rel\";}s:4:\"name\";a:1:{s:10:\"predicates\";a:1:{i:0;s:9:\"foaf:name\";}}s:13:\"comment_count\";a:2:{s:10:\"predicates\";a:1:{i:0;s:16:\"sioc:num_replies\";}s:8:\"datatype\";s:11:\"xsd:integer\";}s:13:\"last_activity\";a:3:{s:10:\"predicates\";a:1:{i:0;s:23:\"sioc:last_activity_date\";}s:8:\"datatype\";s:12:\"xsd:dateTime\";s:8:\"callback\";s:12:\"date_iso8601\";}}'),('node','page','a:9:{s:7:\"rdftype\";a:1:{i:0;s:13:\"foaf:Document\";}s:5:\"title\";a:1:{s:10:\"predicates\";a:1:{i:0;s:8:\"dc:title\";}}s:7:\"created\";a:3:{s:10:\"predicates\";a:2:{i:0;s:7:\"dc:date\";i:1;s:10:\"dc:created\";}s:8:\"datatype\";s:12:\"xsd:dateTime\";s:8:\"callback\";s:12:\"date_iso8601\";}s:7:\"changed\";a:3:{s:10:\"predicates\";a:1:{i:0;s:11:\"dc:modified\";}s:8:\"datatype\";s:12:\"xsd:dateTime\";s:8:\"callback\";s:12:\"date_iso8601\";}s:4:\"body\";a:1:{s:10:\"predicates\";a:1:{i:0;s:15:\"content:encoded\";}}s:3:\"uid\";a:2:{s:10:\"predicates\";a:1:{i:0;s:16:\"sioc:has_creator\";}s:4:\"type\";s:3:\"rel\";}s:4:\"name\";a:1:{s:10:\"predicates\";a:1:{i:0;s:9:\"foaf:name\";}}s:13:\"comment_count\";a:2:{s:10:\"predicates\";a:1:{i:0;s:16:\"sioc:num_replies\";}s:8:\"datatype\";s:11:\"xsd:integer\";}s:13:\"last_activity\";a:3:{s:10:\"predicates\";a:1:{i:0;s:23:\"sioc:last_activity_date\";}s:8:\"datatype\";s:12:\"xsd:dateTime\";s:8:\"callback\";s:12:\"date_iso8601\";}}');
/*!40000 ALTER TABLE `rdf_mapping` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `registry`
--

DROP TABLE IF EXISTS `registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registry` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function, class, or interface.',
  `type` varchar(9) NOT NULL DEFAULT '' COMMENT 'Either function or class or interface.',
  `filename` varchar(255) NOT NULL COMMENT 'Name of the file.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the module the file belongs to.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  PRIMARY KEY (`name`,`type`),
  KEY `hook` (`type`,`weight`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is a function, class, or interface name and...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registry`
--

LOCK TABLES `registry` WRITE;
/*!40000 ALTER TABLE `registry` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `registry` VALUES ('AccessDeniedTestCase','class','modules/system/system.test','system',0),('AdminMetaTagTestCase','class','modules/system/system.test','system',0),('ArchiverInterface','interface','includes/archiver.inc','',0),('ArchiverTar','class','modules/system/system.archiver.inc','system',0),('ArchiverZip','class','modules/system/system.archiver.inc','system',0),('Archive_Tar','class','modules/system/system.tar.inc','system',0),('BatchMemoryQueue','class','includes/batch.queue.inc','',0),('BatchQueue','class','includes/batch.queue.inc','',0),('BlockAdminThemeTestCase','class','modules/block/block.test','block',0),('BlockCacheTestCase','class','modules/block/block.test','block',0),('BlockHashTestCase','class','modules/block/block.test','block',0),('BlockHiddenRegionTestCase','class','modules/block/block.test','block',0),('BlockHTMLIdTestCase','class','modules/block/block.test','block',0),('BlockInvalidRegionTestCase','class','modules/block/block.test','block',0),('BlockTemplateSuggestionsUnitTest','class','modules/block/block.test','block',0),('BlockTestCase','class','modules/block/block.test','block',0),('BlockViewModuleDeltaAlterWebTest','class','modules/block/block.test','block',0),('ColorTestCase','class','modules/color/color.test','color',0),('CommentActionsTestCase','class','modules/comment/comment.test','comment',0),('CommentAnonymous','class','modules/comment/comment.test','comment',0),('CommentApprovalTest','class','modules/comment/comment.test','comment',0),('CommentBlockFunctionalTest','class','modules/comment/comment.test','comment',0),('CommentContentRebuild','class','modules/comment/comment.test','comment',0),('CommentController','class','modules/comment/comment.module','comment',0),('CommentFieldsTest','class','modules/comment/comment.test','comment',0),('CommentHelperCase','class','modules/comment/comment.test','comment',0),('CommentInterfaceTest','class','modules/comment/comment.test','comment',0),('CommentNodeAccessTest','class','modules/comment/comment.test','comment',0),('CommentNodeChangesTestCase','class','modules/comment/comment.test','comment',0),('CommentPagerTest','class','modules/comment/comment.test','comment',0),('CommentPreviewTest','class','modules/comment/comment.test','comment',0),('CommentRSSUnitTest','class','modules/comment/comment.test','comment',0),('CommentThreadingTestCase','class','modules/comment/comment.test','comment',0),('CommentTokenReplaceTestCase','class','modules/comment/comment.test','comment',0),('ContextualDynamicContextTestCase','class','modules/contextual/contextual.test','contextual',0),('CronQueueTestCase','class','modules/system/system.test','system',0),('CronRunTestCase','class','modules/system/system.test','system',0),('ctools_context','class','sites/all/modules/ctools/includes/context.inc','ctools',0),('ctools_context_optional','class','sites/all/modules/ctools/includes/context.inc','ctools',0),('ctools_context_required','class','sites/all/modules/ctools/includes/context.inc','ctools',0),('ctools_export_ui','class','sites/all/modules/ctools/plugins/export_ui/ctools_export_ui.class.php','ctools',0),('ctools_math_expr','class','sites/all/modules/ctools/includes/math-expr.inc','ctools',0),('ctools_math_expr_stack','class','sites/all/modules/ctools/includes/math-expr.inc','ctools',0),('ctools_stylizer_image_processor','class','sites/all/modules/ctools/includes/stylizer.inc','ctools',0),('DashboardBlocksTestCase','class','modules/dashboard/dashboard.test','dashboard',0),('Database','class','includes/database/database.inc','',0),('DatabaseCondition','class','includes/database/query.inc','',0),('DatabaseConnection','class','includes/database/database.inc','',0),('DatabaseConnectionNotDefinedException','class','includes/database/database.inc','',0),('DatabaseConnection_mysql','class','includes/database/mysql/database.inc','',0),('DatabaseConnection_pgsql','class','includes/database/pgsql/database.inc','',0),('DatabaseConnection_sqlite','class','includes/database/sqlite/database.inc','',0),('DatabaseDriverNotSpecifiedException','class','includes/database/database.inc','',0),('DatabaseLog','class','includes/database/log.inc','',0),('DatabaseSchema','class','includes/database/schema.inc','',0),('DatabaseSchemaObjectDoesNotExistException','class','includes/database/schema.inc','',0),('DatabaseSchemaObjectExistsException','class','includes/database/schema.inc','',0),('DatabaseSchema_mysql','class','includes/database/mysql/schema.inc','',0),('DatabaseSchema_pgsql','class','includes/database/pgsql/schema.inc','',0),('DatabaseSchema_sqlite','class','includes/database/sqlite/schema.inc','',0),('DatabaseStatementBase','class','includes/database/database.inc','',0),('DatabaseStatementEmpty','class','includes/database/database.inc','',0),('DatabaseStatementInterface','interface','includes/database/database.inc','',0),('DatabaseStatementPrefetch','class','includes/database/prefetch.inc','',0),('DatabaseStatement_sqlite','class','includes/database/sqlite/database.inc','',0),('DatabaseTaskException','class','includes/install.inc','',0),('DatabaseTasks','class','includes/install.inc','',0),('DatabaseTasks_mysql','class','includes/database/mysql/install.inc','',0),('DatabaseTasks_pgsql','class','includes/database/pgsql/install.inc','',0),('DatabaseTasks_sqlite','class','includes/database/sqlite/install.inc','',0),('DatabaseTransaction','class','includes/database/database.inc','',0),('DatabaseTransactionCommitFailedException','class','includes/database/database.inc','',0),('DatabaseTransactionExplicitCommitNotAllowedException','class','includes/database/database.inc','',0),('DatabaseTransactionNameNonUniqueException','class','includes/database/database.inc','',0),('DatabaseTransactionNoActiveException','class','includes/database/database.inc','',0),('DatabaseTransactionOutOfOrderException','class','includes/database/database.inc','',0),('DateTimeFunctionalTest','class','modules/system/system.test','system',0),('DBLogTestCase','class','modules/dblog/dblog.test','dblog',0),('DefaultMailSystem','class','modules/system/system.mail.inc','system',0),('DeleteQuery','class','includes/database/query.inc','',0),('DeleteQuery_sqlite','class','includes/database/sqlite/query.inc','',0),('DrupalCacheArray','class','includes/bootstrap.inc','',0),('DrupalCacheInterface','interface','includes/cache.inc','',0),('DrupalDatabaseCache','class','includes/cache.inc','',0),('DrupalDefaultEntityController','class','includes/entity.inc','',0),('DrupalEntityControllerInterface','interface','includes/entity.inc','',0),('DrupalFakeCache','class','includes/cache-install.inc','',0),('DrupalLocalStreamWrapper','class','includes/stream_wrappers.inc','',0),('DrupalPrivateStreamWrapper','class','includes/stream_wrappers.inc','',0),('DrupalPublicStreamWrapper','class','includes/stream_wrappers.inc','',0),('DrupalQueue','class','modules/system/system.queue.inc','system',0),('DrupalQueueInterface','interface','modules/system/system.queue.inc','system',0),('DrupalReliableQueueInterface','interface','modules/system/system.queue.inc','system',0),('DrupalStreamWrapperInterface','interface','includes/stream_wrappers.inc','',0),('DrupalTemporaryStreamWrapper','class','includes/stream_wrappers.inc','',0),('DrupalUpdateException','class','includes/update.inc','',0),('DrupalUpdaterInterface','interface','includes/updater.inc','',0),('EnableDisableTestCase','class','modules/system/system.test','system',0),('Entity','class','sites/all/modules/entity/includes/entity.inc','entity',0),('EntityAPICommentNodeAccessTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityAPIController','class','sites/all/modules/entity/includes/entity.controller.inc','entity',0),('EntityAPIControllerExportable','class','sites/all/modules/entity/includes/entity.controller.inc','entity',0),('EntityAPIControllerInterface','interface','sites/all/modules/entity/includes/entity.controller.inc','entity',0),('EntityAPIControllerRevisionableInterface','interface','sites/all/modules/entity/includes/entity.controller.inc','entity',0),('EntityAPIi18nItegrationTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityAPIRulesIntegrationTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityAPITestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityBundleableUIController','class','sites/all/modules/entity/includes/entity.ui.inc','entity',0),('EntityContentUIController','class','sites/all/modules/entity/includes/entity.ui.inc','entity',0),('EntityDB','class','sites/all/modules/entity/includes/entity.inc','entity',0),('EntityDBExtendable','class','sites/all/modules/entity/includes/entity.inc','entity',0),('EntityDefaultExtraFieldsController','class','sites/all/modules/entity/entity.info.inc','entity',0),('EntityDefaultFeaturesController','class','sites/all/modules/entity/entity.features.inc','entity',0),('EntityDefaultI18nStringController','class','sites/all/modules/entity/entity.i18n.inc','entity',0),('EntityDefaultMetadataController','class','sites/all/modules/entity/entity.info.inc','entity',0),('EntityDefaultRulesController','class','sites/all/modules/entity/entity.rules.inc','entity',0),('EntityDefaultUIController','class','sites/all/modules/entity/includes/entity.ui.inc','entity',0),('EntityDefaultViewsController','class','sites/all/modules/entity/views/entity.views.inc','entity',0),('EntityDrupalWrapper','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityExtendable','class','sites/all/modules/entity/includes/entity.inc','entity',0),('EntityExtraFieldsControllerInterface','interface','sites/all/modules/entity/entity.info.inc','entity',0),('EntityFieldHandlerHelper','class','sites/all/modules/entity/views/handlers/entity_views_field_handler_helper.inc','entity',0),('EntityFieldQuery','class','includes/entity.inc','',0),('EntityFieldQueryException','class','includes/entity.inc','',0),('EntityListWrapper','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityMalformedException','class','includes/entity.inc','',0),('EntityMetadataArrayObject','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityMetadataIntegrationTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityMetadataNodeAccessTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityMetadataNodeCreateAccessTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityMetadataNodeRevisionAccessTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityMetadataTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityMetadataWrapper','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityMetadataWrapperException','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityMetadataWrapperIterator','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityPropertiesTestCase','class','modules/field/tests/field.test','field',0),('EntityReferenceAdminTestCase','class','sites/all/modules/entityreference/tests/entityreference.admin.test','entityreference',0),('EntityReferenceBehavior_TaxonomyIndex','class','sites/all/modules/entityreference/plugins/behavior/EntityReferenceBehavior_TaxonomyIndex.class.php','entityreference',0),('EntityReferenceHandlersTestCase','class','sites/all/modules/entityreference/tests/entityreference.handlers.test','entityreference',0),('EntityReferenceTaxonomyTestCase','class','sites/all/modules/entityreference/tests/entityreference.taxonomy.test','entityreference',0),('EntityReference_BehaviorHandler','interface','sites/all/modules/entityreference/plugins/behavior/abstract.inc','entityreference',0),('EntityReference_BehaviorHandler_Abstract','class','sites/all/modules/entityreference/plugins/behavior/abstract.inc','entityreference',0),('EntityReference_BehaviorHandler_Broken','class','sites/all/modules/entityreference/plugins/behavior/abstract.inc','entityreference',0),('entityreference_plugin_display','class','sites/all/modules/entityreference/views/entityreference_plugin_display.inc','entityreference',0),('entityreference_plugin_row_fields','class','sites/all/modules/entityreference/views/entityreference_plugin_row_fields.inc','entityreference',0),('entityreference_plugin_style','class','sites/all/modules/entityreference/views/entityreference_plugin_style.inc','entityreference',0),('EntityReference_SelectionHandler','interface','sites/all/modules/entityreference/plugins/selection/abstract.inc','entityreference',0),('EntityReference_SelectionHandler_Broken','class','sites/all/modules/entityreference/plugins/selection/abstract.inc','entityreference',0),('EntityReference_SelectionHandler_Generic','class','sites/all/modules/entityreference/plugins/selection/EntityReference_SelectionHandler_Generic.class.php','entityreference',0),('EntityReference_SelectionHandler_Generic_comment','class','sites/all/modules/entityreference/plugins/selection/EntityReference_SelectionHandler_Generic.class.php','entityreference',0),('EntityReference_SelectionHandler_Generic_file','class','sites/all/modules/entityreference/plugins/selection/EntityReference_SelectionHandler_Generic.class.php','entityreference',0),('EntityReference_SelectionHandler_Generic_node','class','sites/all/modules/entityreference/plugins/selection/EntityReference_SelectionHandler_Generic.class.php','entityreference',0),('EntityReference_SelectionHandler_Generic_taxonomy_term','class','sites/all/modules/entityreference/plugins/selection/EntityReference_SelectionHandler_Generic.class.php','entityreference',0),('EntityReference_SelectionHandler_Generic_user','class','sites/all/modules/entityreference/plugins/selection/EntityReference_SelectionHandler_Generic.class.php','entityreference',0),('EntityStructureWrapper','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityTokenTestCase','class','sites/all/modules/entity/entity.test','entity',0),('EntityValueWrapper','class','sites/all/modules/entity/includes/entity.wrapper.inc','entity',0),('EntityWebTestCase','class','sites/all/modules/entity/entity.test','entity',0),('entity_views_handler_area_entity','class','sites/all/modules/entity/views/handlers/entity_views_handler_area_entity.inc','entity',0),('entity_views_handler_field_boolean','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_boolean.inc','entity',0),('entity_views_handler_field_date','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_date.inc','entity',0),('entity_views_handler_field_duration','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_duration.inc','entity',0),('entity_views_handler_field_entity','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_entity.inc','entity',0),('entity_views_handler_field_field','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_field.inc','entity',0),('entity_views_handler_field_numeric','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_numeric.inc','entity',0),('entity_views_handler_field_options','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_options.inc','entity',0),('entity_views_handler_field_text','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_text.inc','entity',0),('entity_views_handler_field_uri','class','sites/all/modules/entity/views/handlers/entity_views_handler_field_uri.inc','entity',0),('entity_views_handler_relationship','class','sites/all/modules/entity/views/handlers/entity_views_handler_relationship.inc','entity',0),('entity_views_handler_relationship_by_bundle','class','sites/all/modules/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc','entity',0),('entity_views_plugin_row_entity_view','class','sites/all/modules/entity/views/plugins/entity_views_plugin_row_entity_view.inc','entity',0),('FeaturesCtoolsIntegrationTest','class','sites/all/modules/features/tests/features.test','features',0),('FeaturesEnableTestCase','class','sites/all/modules/features/tests/features.test','features',0),('FeaturesUserTestCase','class','sites/all/modules/features/tests/features.test','features',0),('FeedsMapperFieldTestCase','class','sites/all/modules/entityreference/tests/entityreference.feeds.test','entityreference',0),('FieldAttachOtherTestCase','class','modules/field/tests/field.test','field',0),('FieldAttachStorageTestCase','class','modules/field/tests/field.test','field',0),('FieldAttachTestCase','class','modules/field/tests/field.test','field',0),('FieldBulkDeleteTestCase','class','modules/field/tests/field.test','field',0),('FieldCrudTestCase','class','modules/field/tests/field.test','field',0),('FieldDisplayAPITestCase','class','modules/field/tests/field.test','field',0),('FieldException','class','modules/field/field.module','field',0),('FieldFormTestCase','class','modules/field/tests/field.test','field',0),('FieldInfo','class','modules/field/field.info.class.inc','field',0),('FieldInfoTestCase','class','modules/field/tests/field.test','field',0),('FieldInstanceCrudTestCase','class','modules/field/tests/field.test','field',0),('FieldsOverlapException','class','includes/database/database.inc','',0),('FieldSqlStorageTestCase','class','modules/field/modules/field_sql_storage/field_sql_storage.test','field_sql_storage',0),('FieldTestCase','class','modules/field/tests/field.test','field',0),('FieldTranslationsTestCase','class','modules/field/tests/field.test','field',0),('FieldUIAlterTestCase','class','modules/field_ui/field_ui.test','field_ui',0),('FieldUIManageDisplayTestCase','class','modules/field_ui/field_ui.test','field_ui',0),('FieldUIManageFieldsTestCase','class','modules/field_ui/field_ui.test','field_ui',0),('FieldUITestCase','class','modules/field_ui/field_ui.test','field_ui',0),('FieldUpdateForbiddenException','class','modules/field/field.module','field',0),('FieldValidationException','class','modules/field/field.attach.inc','field',0),('FileFieldDisplayTestCase','class','modules/file/tests/file.test','file',0),('FileFieldPathTestCase','class','modules/file/tests/file.test','file',0),('FileFieldRevisionTestCase','class','modules/file/tests/file.test','file',0),('FileFieldTestCase','class','modules/file/tests/file.test','file',0),('FileFieldValidateTestCase','class','modules/file/tests/file.test','file',0),('FileFieldWidgetTestCase','class','modules/file/tests/file.test','file',0),('FileManagedFileElementTestCase','class','modules/file/tests/file.test','file',0),('FilePrivateTestCase','class','modules/file/tests/file.test','file',0),('FileTaxonomyTermTestCase','class','modules/file/tests/file.test','file',0),('FileTokenReplaceTestCase','class','modules/file/tests/file.test','file',0),('FileTransfer','class','includes/filetransfer/filetransfer.inc','',0),('FileTransferChmodInterface','interface','includes/filetransfer/filetransfer.inc','',0),('FileTransferException','class','includes/filetransfer/filetransfer.inc','',0),('FileTransferFTP','class','includes/filetransfer/ftp.inc','',0),('FileTransferFTPExtension','class','includes/filetransfer/ftp.inc','',0),('FileTransferLocal','class','includes/filetransfer/local.inc','',0),('FileTransferSSH','class','includes/filetransfer/ssh.inc','',0),('FilterAdminTestCase','class','modules/filter/filter.test','filter',0),('FilterCRUDTestCase','class','modules/filter/filter.test','filter',0),('FilterDefaultFormatTestCase','class','modules/filter/filter.test','filter',0),('FilterFormatAccessTestCase','class','modules/filter/filter.test','filter',0),('FilterHooksTestCase','class','modules/filter/filter.test','filter',0),('FilterNoFormatTestCase','class','modules/filter/filter.test','filter',0),('FilterSecurityTestCase','class','modules/filter/filter.test','filter',0),('FilterSettingsTestCase','class','modules/filter/filter.test','filter',0),('FilterUnitTestCase','class','modules/filter/filter.test','filter',0),('FloodFunctionalTest','class','modules/system/system.test','system',0),('FrontPageTestCase','class','modules/system/system.test','system',0),('HelpTestCase','class','modules/help/help.test','help',0),('HookRequirementsTestCase','class','modules/system/system.test','system',0),('ImageAdminStylesUnitTest','class','modules/image/image.test','image',0),('ImageDimensionsScaleTestCase','class','modules/image/image.test','image',0),('ImageDimensionsTestCase','class','modules/image/image.test','image',0),('ImageEffectsUnitTest','class','modules/image/image.test','image',0),('ImageFieldDefaultImagesTestCase','class','modules/image/image.test','image',0),('ImageFieldDisplayTestCase','class','modules/image/image.test','image',0),('ImageFieldTestCase','class','modules/image/image.test','image',0),('ImageFieldValidateTestCase','class','modules/image/image.test','image',0),('ImageStyleFlushTest','class','modules/image/image.test','image',0),('ImageStylesPathAndUrlTestCase','class','modules/image/image.test','image',0),('ImageThemeFunctionWebTestCase','class','modules/image/image.test','image',0),('InfoFileParserTestCase','class','modules/system/system.test','system',0),('InsertQuery','class','includes/database/query.inc','',0),('InsertQuery_mysql','class','includes/database/mysql/query.inc','',0),('InsertQuery_pgsql','class','includes/database/pgsql/query.inc','',0),('InsertQuery_sqlite','class','includes/database/sqlite/query.inc','',0),('InvalidMergeQueryException','class','includes/database/database.inc','',0),('IPAddressBlockingTestCase','class','modules/system/system.test','system',0),('ListDynamicValuesTestCase','class','modules/field/modules/list/tests/list.test','list',0),('ListDynamicValuesValidationTestCase','class','modules/field/modules/list/tests/list.test','list',0),('ListFieldTestCase','class','modules/field/modules/list/tests/list.test','list',0),('ListFieldUITestCase','class','modules/field/modules/list/tests/list.test','list',0),('MailSystemInterface','interface','includes/mail.inc','',0),('MemoryQueue','class','modules/system/system.queue.inc','system',0),('MenuNodeTestCase','class','modules/menu/menu.test','menu',0),('MenuTestCase','class','modules/menu/menu.test','menu',0),('MergeQuery','class','includes/database/query.inc','',0),('MigrateEntityReferenceFieldHandler','class','sites/all/modules/entityreference/entityreference.migrate.inc','entityreference',0),('ModuleDependencyTestCase','class','modules/system/system.test','system',0),('ModuleRequiredTestCase','class','modules/system/system.test','system',0),('ModuleTestCase','class','modules/system/system.test','system',0),('ModuleUpdater','class','modules/system/system.updater.inc','system',0),('ModuleVersionTestCase','class','modules/system/system.test','system',0),('MultiStepNodeFormBasicOptionsTest','class','modules/node/node.test','node',0),('NewDefaultThemeBlocks','class','modules/block/block.test','block',0),('NodeAccessBaseTableTestCase','class','modules/node/node.test','node',0),('NodeAccessFieldTestCase','class','modules/node/node.test','node',0),('NodeAccessPagerTestCase','class','modules/node/node.test','node',0),('NodeAccessRebuildTestCase','class','modules/node/node.test','node',0),('NodeAccessRecordsTestCase','class','modules/node/node.test','node',0),('NodeAccessTestCase','class','modules/node/node.test','node',0),('NodeAdminTestCase','class','modules/node/node.test','node',0),('NodeBlockFunctionalTest','class','modules/node/node.test','node',0),('NodeBlockTestCase','class','modules/node/node.test','node',0),('NodeBuildContent','class','modules/node/node.test','node',0),('NodeController','class','modules/node/node.module','node',0),('NodeCreationTestCase','class','modules/node/node.test','node',0),('NodeEntityFieldQueryAlter','class','modules/node/node.test','node',0),('NodeEntityViewModeAlterTest','class','modules/node/node.test','node',0),('NodeFeedTestCase','class','modules/node/node.test','node',0),('NodeLoadHooksTestCase','class','modules/node/node.test','node',0),('NodeLoadMultipleTestCase','class','modules/node/node.test','node',0),('NodePageCacheTest','class','modules/node/node.test','node',0),('NodePostSettingsTestCase','class','modules/node/node.test','node',0),('NodeQueryAlter','class','modules/node/node.test','node',0),('NodeRevisionPermissionsTestCase','class','modules/node/node.test','node',0),('NodeRevisionsTestCase','class','modules/node/node.test','node',0),('NodeRSSContentTestCase','class','modules/node/node.test','node',0),('NodeSaveTestCase','class','modules/node/node.test','node',0),('NodeTitleTestCase','class','modules/node/node.test','node',0),('NodeTitleXSSTestCase','class','modules/node/node.test','node',0),('NodeTokenReplaceTestCase','class','modules/node/node.test','node',0),('NodeTypePersistenceTestCase','class','modules/node/node.test','node',0),('NodeTypeTestCase','class','modules/node/node.test','node',0),('NodeWebTestCase','class','modules/node/node.test','node',0),('NoFieldsException','class','includes/database/database.inc','',0),('NoHelpTestCase','class','modules/help/help.test','help',0),('NonDefaultBlockAdmin','class','modules/block/block.test','block',0),('NumberFieldTestCase','class','modules/field/modules/number/number.test','number',0),('OptionsSelectDynamicValuesTestCase','class','modules/field/modules/options/options.test','options',0),('OptionsWidgetsTestCase','class','modules/field/modules/options/options.test','options',0),('PageEditTestCase','class','modules/node/node.test','node',0),('PageNotFoundTestCase','class','modules/system/system.test','system',0),('PagePreviewTestCase','class','modules/node/node.test','node',0),('PagerDefault','class','includes/pager.inc','',0),('PageTitleFiltering','class','modules/system/system.test','system',0),('PageViewTestCase','class','modules/node/node.test','node',0),('PanelsLegacyState','class','sites/all/modules/panels/includes/legacy.inc','panels',0),('panels_allowed_layouts','class','sites/all/modules/panels/includes/common.inc','panels',0),('panels_cache_object','class','sites/all/modules/panels/includes/plugins.inc','panels',0),('panels_display','class','sites/all/modules/panels/panels.module','panels',0),('panels_layouts_ui','class','sites/all/modules/panels/plugins/export_ui/panels_layouts_ui.class.php','panels',0),('panels_renderer_editor','class','sites/all/modules/panels/plugins/display_renderers/panels_renderer_editor.class.php','panels',0),('panels_renderer_simple','class','sites/all/modules/panels/plugins/display_renderers/panels_renderer_simple.class.php','panels',0),('panels_renderer_standard','class','sites/all/modules/panels/plugins/display_renderers/panels_renderer_standard.class.php','panels',0),('panels_views_plugin_row_fields','class','sites/all/modules/panels/plugins/views/panels_views_plugin_row_fields.inc','panels',0),('PathautoBulkUpdateTestCase','class','sites/all/modules/pathauto/pathauto.test','pathauto',0),('PathautoFunctionalTestCase','class','sites/all/modules/pathauto/pathauto.test','pathauto',0),('PathautoFunctionalTestHelper','class','sites/all/modules/pathauto/pathauto.test','pathauto',0),('PathautoLocaleTestCase','class','sites/all/modules/pathauto/pathauto.test','pathauto',0),('PathautoTestHelper','class','sites/all/modules/pathauto/pathauto.test','pathauto',0),('PathautoTokenTestCase','class','sites/all/modules/pathauto/pathauto.test','pathauto',0),('PathautoUnitTestCase','class','sites/all/modules/pathauto/pathauto.test','pathauto',0),('PathLanguageTestCase','class','modules/path/path.test','path',0),('PathLanguageUITestCase','class','modules/path/path.test','path',0),('PathMonolingualTestCase','class','modules/path/path.test','path',0),('PathTaxonomyTermTestCase','class','modules/path/path.test','path',0),('PathTestCase','class','modules/path/path.test','path',0),('Query','class','includes/database/query.inc','',0),('QueryAlterableInterface','interface','includes/database/query.inc','',0),('QueryConditionInterface','interface','includes/database/query.inc','',0),('QueryExtendableInterface','interface','includes/database/select.inc','',0),('QueryPlaceholderInterface','interface','includes/database/query.inc','',0),('QueueTestCase','class','modules/system/system.test','system',0),('RdfCommentAttributesTestCase','class','modules/rdf/rdf.test','rdf',0),('RdfCrudTestCase','class','modules/rdf/rdf.test','rdf',0),('RdfGetRdfNamespacesTestCase','class','modules/rdf/rdf.test','rdf',0),('RdfMappingDefinitionTestCase','class','modules/rdf/rdf.test','rdf',0),('RdfMappingHookTestCase','class','modules/rdf/rdf.test','rdf',0),('RdfRdfaMarkupTestCase','class','modules/rdf/rdf.test','rdf',0),('RdfTrackerAttributesTestCase','class','modules/rdf/rdf.test','rdf',0),('RetrieveFileTestCase','class','modules/system/system.test','system',0),('SchemaCache','class','includes/bootstrap.inc','',0),('SearchAdvancedSearchForm','class','modules/search/search.test','search',0),('SearchBlockTestCase','class','modules/search/search.test','search',0),('SearchCommentCountToggleTestCase','class','modules/search/search.test','search',0),('SearchCommentTestCase','class','modules/search/search.test','search',0),('SearchConfigSettingsForm','class','modules/search/search.test','search',0),('SearchEmbedForm','class','modules/search/search.test','search',0),('SearchExactTestCase','class','modules/search/search.test','search',0),('SearchExcerptTestCase','class','modules/search/search.test','search',0),('SearchExpressionInsertExtractTestCase','class','modules/search/search.test','search',0),('SearchKeywordsConditions','class','modules/search/search.test','search',0),('SearchLanguageTestCase','class','modules/search/search.test','search',0),('SearchMatchTestCase','class','modules/search/search.test','search',0),('SearchNodeAccessTest','class','modules/search/search.test','search',0),('SearchNumberMatchingTestCase','class','modules/search/search.test','search',0),('SearchNumbersTestCase','class','modules/search/search.test','search',0),('SearchPageOverride','class','modules/search/search.test','search',0),('SearchPageText','class','modules/search/search.test','search',0),('SearchQuery','class','modules/search/search.extender.inc','search',0),('SearchRankingTestCase','class','modules/search/search.test','search',0),('SearchSetLocaleTest','class','modules/search/search.test','search',0),('SearchSimplifyTestCase','class','modules/search/search.test','search',0),('SearchTokenizerTestCase','class','modules/search/search.test','search',0),('SelectQuery','class','includes/database/select.inc','',0),('SelectQueryExtender','class','includes/database/select.inc','',0),('SelectQueryInterface','interface','includes/database/select.inc','',0),('SelectQuery_pgsql','class','includes/database/pgsql/select.inc','',0),('SelectQuery_sqlite','class','includes/database/sqlite/select.inc','',0),('ShortcutLinksTestCase','class','modules/shortcut/shortcut.test','shortcut',0),('ShortcutSetsTestCase','class','modules/shortcut/shortcut.test','shortcut',0),('ShortcutTestCase','class','modules/shortcut/shortcut.test','shortcut',0),('ShutdownFunctionsTest','class','modules/system/system.test','system',0),('SiteMaintenanceTestCase','class','modules/system/system.test','system',0),('SkipDotsRecursiveDirectoryIterator','class','includes/filetransfer/filetransfer.inc','',0),('StreamWrapperInterface','interface','includes/stream_wrappers.inc','',0),('SummaryLengthTestCase','class','modules/node/node.test','node',0),('SystemAdminTestCase','class','modules/system/system.test','system',0),('SystemAuthorizeCase','class','modules/system/system.test','system',0),('SystemBlockTestCase','class','modules/system/system.test','system',0),('SystemIndexPhpTest','class','modules/system/system.test','system',0),('SystemInfoAlterTestCase','class','modules/system/system.test','system',0),('SystemMainContentFallback','class','modules/system/system.test','system',0),('SystemQueue','class','modules/system/system.queue.inc','system',0),('SystemThemeFunctionalTest','class','modules/system/system.test','system',0),('SystemValidTokenTest','class','modules/system/system.test','system',0),('TableSort','class','includes/tablesort.inc','',0),('TaxonomyEFQTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyHooksTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyLegacyTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyLoadMultipleTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyRSSTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyTermController','class','modules/taxonomy/taxonomy.module','taxonomy',0),('TaxonomyTermFieldMultipleVocabularyTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyTermFieldTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyTermFunctionTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyTermIndexTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyTermTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyThemeTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyTokenReplaceTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyVocabularyController','class','modules/taxonomy/taxonomy.module','taxonomy',0),('TaxonomyVocabularyFunctionalTest','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyVocabularyTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TaxonomyWebTestCase','class','modules/taxonomy/taxonomy.test','taxonomy',0),('TestingMailSystem','class','modules/system/system.mail.inc','system',0),('TextFieldTestCase','class','modules/field/modules/text/text.test','text',0),('TextSummaryTestCase','class','modules/field/modules/text/text.test','text',0),('TextTranslationTestCase','class','modules/field/modules/text/text.test','text',0),('ThemeRegistry','class','includes/theme.inc','',0),('ThemeUpdater','class','modules/system/system.updater.inc','system',0),('TokenArrayTestCase','class','sites/all/modules/token/token.test','token',0),('TokenBlockTestCase','class','sites/all/modules/token/token.test','token',0),('TokenCommentTestCase','class','sites/all/modules/token/token.test','token',0),('TokenCurrentPageTestCase','class','sites/all/modules/token/token.test','token',0),('TokenDateTestCase','class','sites/all/modules/token/token.test','token',0),('TokenEntityTestCase','class','sites/all/modules/token/token.test','token',0),('TokenFileTestCase','class','sites/all/modules/token/token.test','token',0),('TokenMenuTestCase','class','sites/all/modules/token/token.test','token',0),('TokenNodeTestCase','class','sites/all/modules/token/token.test','token',0),('TokenProfileTestCase','class','sites/all/modules/token/token.test','token',0),('TokenRandomTestCase','class','sites/all/modules/token/token.test','token',0),('TokenReplaceTestCase','class','modules/system/system.test','system',0),('TokenScanTest','class','modules/system/system.test','system',0),('TokenTaxonomyTestCase','class','sites/all/modules/token/token.test','token',0),('TokenTestHelper','class','sites/all/modules/token/token.test','token',0),('TokenUnitTestCase','class','sites/all/modules/token/token.test','token',0),('TokenURLTestCase','class','sites/all/modules/token/token.test','token',0),('TokenUserTestCase','class','sites/all/modules/token/token.test','token',0),('TruncateQuery','class','includes/database/query.inc','',0),('TruncateQuery_mysql','class','includes/database/mysql/query.inc','',0),('TruncateQuery_sqlite','class','includes/database/sqlite/query.inc','',0),('UpdateQuery','class','includes/database/query.inc','',0),('UpdateQuery_pgsql','class','includes/database/pgsql/query.inc','',0),('UpdateQuery_sqlite','class','includes/database/sqlite/query.inc','',0),('Updater','class','includes/updater.inc','',0),('UpdaterException','class','includes/updater.inc','',0),('UpdaterFileTransferException','class','includes/updater.inc','',0),('UpdateScriptFunctionalTest','class','modules/system/system.test','system',0),('UserAccountLinksUnitTests','class','modules/user/user.test','user',0),('UserAdminTestCase','class','modules/user/user.test','user',0),('UserAuthmapAssignmentTestCase','class','modules/user/user.test','user',0),('UserAutocompleteTestCase','class','modules/user/user.test','user',0),('UserBlocksUnitTests','class','modules/user/user.test','user',0),('UserCancelTestCase','class','modules/user/user.test','user',0),('UserController','class','modules/user/user.module','user',0),('UserCreateTestCase','class','modules/user/user.test','user',0),('UserEditedOwnAccountTestCase','class','modules/user/user.test','user',0),('UserEditTestCase','class','modules/user/user.test','user',0),('UserLoginTestCase','class','modules/user/user.test','user',0),('UserPasswordResetTestCase','class','modules/user/user.test','user',0),('UserPermissionsTestCase','class','modules/user/user.test','user',0),('UserPictureTestCase','class','modules/user/user.test','user',0),('UserRegistrationTestCase','class','modules/user/user.test','user',0),('UserRoleAdminTestCase','class','modules/user/user.test','user',0),('UserRolesAssignmentTestCase','class','modules/user/user.test','user',0),('UserSaveTestCase','class','modules/user/user.test','user',0),('UserSignatureTestCase','class','modules/user/user.test','user',0),('UserTimeZoneFunctionalTest','class','modules/user/user.test','user',0),('UserTokenReplaceTestCase','class','modules/user/user.test','user',0),('UserUserSearchTestCase','class','modules/user/user.test','user',0),('UserValidateCurrentPassCustomForm','class','modules/user/user.test','user',0),('UserValidationTestCase','class','modules/user/user.test','user',0);
/*!40000 ALTER TABLE `registry` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `registry_file`
--

DROP TABLE IF EXISTS `registry_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registry_file` (
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file.',
  `hash` varchar(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files parsed to build the registry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registry_file`
--

LOCK TABLES `registry_file` WRITE;
/*!40000 ALTER TABLE `registry_file` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `registry_file` VALUES ('includes/actions.inc','f36b066681463c7dfe189e0430cb1a89bf66f7e228cbb53cdfcd93987193f759'),('includes/ajax.inc','f5d608554c6b42b976d6a97e1efffe53c657e9fbb77eabb858935bfdf4276491'),('includes/archiver.inc','bdbb21b712a62f6b913590b609fd17cd9f3c3b77c0d21f68e71a78427ed2e3e9'),('includes/authorize.inc','6d64d8c21aa01eb12fc29918732e4df6b871ed06e5d41373cb95c197ed661d13'),('includes/batch.inc','059da9e36e1f3717f27840aae73f10dea7d6c8daf16f6520401cc1ca3b4c0388'),('includes/batch.queue.inc','554b2e92e1dad0f7fd5a19cb8dff7e109f10fbe2441a5692d076338ec908de0f'),('includes/bootstrap.inc','1433438e685f5b982c2259cd3306508c274d6065f63e3e43b6b120f1f7add621'),('includes/cache-install.inc','e7ed123c5805703c84ad2cce9c1ca46b3ce8caeeea0d8ef39a3024a4ab95fa0e'),('includes/cache.inc','d01e10e4c18010b6908026f3d71b72717e3272cfb91a528490eba7f339f8dd1b'),('includes/common.inc','91bf90492c571dba1f6ef7db54a96d360579f933d0f3637b5aa33dff1eeda56a'),('includes/database/database.inc','24afaff6e1026bfe315205212cba72951240a16154250e405c4c64724e6e07cc'),('includes/database/log.inc','9feb5a17ae2fabcf26a96d2a634ba73da501f7bcfc3599a693d916a6971d00d1'),('includes/database/mysql/database.inc','d62a2d8ca103cb3b085e7f8b894a7db14c02f20d0b1ed0bd32f6534a45b4527f'),('includes/database/mysql/install.inc','6ae316941f771732fbbabed7e1d6b4cbb41b1f429dd097d04b3345aa15e461a0'),('includes/database/mysql/query.inc','0212a871646c223bf77aa26b945c77a8974855373967b5fb9fdc09f8a1de88a6'),('includes/database/mysql/schema.inc','6f43ac87508f868fe38ee09994fc18d69915bada0237f8ac3b717cafe8f22c6b'),('includes/database/pgsql/database.inc','d737f95947d78eb801e8ec8ca8b01e72d2e305924efce8abca0a98c1b5264cff'),('includes/database/pgsql/install.inc','585b80c5bbd6f134bff60d06397f15154657a577d4da8d1b181858905f09dea5'),('includes/database/pgsql/query.inc','0df57377686c921e722a10b49d5e433b131176c8059a4ace4680964206fc14b4'),('includes/database/pgsql/schema.inc','1588daadfa53506aa1f5d94572162a45a46dc3ceabdd0e2f224532ded6508403'),('includes/database/pgsql/select.inc','fd4bba7887c1dc6abc8f080fc3a76c01d92ea085434e355dc1ecb50d8743c22d'),('includes/database/prefetch.inc','b5b207a66a69ecb52ee4f4459af16a7b5eabedc87254245f37cc33bebb61c0fb'),('includes/database/query.inc','9171653e9710c6c0d20cff865fdead5a580367137ad4cdf81059ecc2eea61c74'),('includes/database/schema.inc','a98b69d33975e75f7d99cb85b20c36b7fc10e35a588e07b20c1b37500f5876ca'),('includes/database/select.inc','5e9cdc383564ba86cb9dcad0046990ce15415a3000e4f617d6e0f30a205b852c'),('includes/database/sqlite/database.inc','4281c6e80932560ecbeb07d1757efd133e8699a6fccf58c27a55df0f71794622'),('includes/database/sqlite/install.inc','381f3db8c59837d961978ba3097bb6443534ed1659fd713aa563963fa0c42cc5'),('includes/database/sqlite/query.inc','f33ab1b6350736a231a4f3f93012d3aac4431ac4e5510fb3a015a5aa6cab8303'),('includes/database/sqlite/schema.inc','cd829700205a8574f8b9d88cd1eaf909519c64754c6f84d6c62b5d21f5886f8d'),('includes/database/sqlite/select.inc','8d1c426dbd337733c206cce9f59a172546c6ed856d8ef3f1c7bef05a16f7bf68'),('includes/date.inc','18c047be64f201e16d189f1cc47ed9dcf0a145151b1ee187e90511b24e5d2b36'),('includes/entity.inc','3080fe3c30991a48f1f314a60d02e841d263a8f222337e5bde3be61afe41ee7a'),('includes/errors.inc','72cc29840b24830df98a5628286b4d82738f2abbb78e69b4980310ff12062668'),('includes/file.inc','5ee60833470d5e8d5f2c6c8e7b978ec2e1f3cbf291cb611db1ca560dea98d888'),('includes/file.mimetypes.inc','33266e837f4ce076378e7e8cef6c5af46446226ca4259f83e13f605856a7f147'),('includes/filetransfer/filetransfer.inc','fdea8ae48345ec91885ac48a9bc53daf87616271472bb7c29b7e3ce219b22034'),('includes/filetransfer/ftp.inc','51eb119b8e1221d598ffa6cc46c8a322aa77b49a3d8879f7fb38b7221cf7e06d'),('includes/filetransfer/local.inc','7cbfdb46abbdf539640db27e66fb30e5265128f31002bd0dfc3af16ae01a9492'),('includes/filetransfer/ssh.inc','92f1232158cb32ab04cbc93ae38ad3af04796e18f66910a9bc5ca8e437f06891'),('includes/form.inc','ead5e56f116ba31898d1b73f1dfc19ea57a9a528f87c9497fd60ad5caedfee2b'),('includes/graph.inc','8e0e313a8bb33488f371df11fc1b58d7cf80099b886cd1003871e2c896d1b536'),('includes/image.inc','bcdc7e1599c02227502b9d0fe36eeb2b529b130a392bc709eb737647bd361826'),('includes/install.core.inc','a0585c85002e6f3d702dc505584f48b55bc13e24bee749bfe5b718fbce4847e1'),('includes/install.inc','480c3cfd065d3ec00f4465e1b0a0d55d6a8927e78fd6774001c30163a5c648e3'),('includes/iso.inc','0ce4c225edcfa9f037703bc7dd09d4e268a69bcc90e55da0a3f04c502bd2f349'),('includes/json-encode.inc','02a822a652d00151f79db9aa9e171c310b69b93a12f549bc2ce00533a8efa14e'),('includes/language.inc','4dd521af07e0ca7bf97ff145f4bd3a218acf0d8b94964e72f11212bb8af8d66e'),('includes/locale.inc','b250f375b93ffe3749f946e0ad475065c914af23e388d68e5c5df161590f086a'),('includes/lock.inc','a181c8bd4f88d292a0a73b9f1fbd727e3314f66ec3631f288e6b9a54ba2b70fa'),('includes/mail.inc','d9fb2b99025745cbb73ebcfc7ac12df100508b9273ce35c433deacf12dd6a13a'),('includes/menu.inc','c9ff3c7db04b7e01d0d19b5e47d9fb209799f2ae6584167235b957d22542e526'),('includes/module.inc','ca3f2e6129181bbbc67e5e6058a882047f2152174ec8e95c0ea99ce610ace4d7'),('includes/pager.inc','6f9494b85c07a2cc3be4e54aff2d2757485238c476a7da084d25bde1d88be6d8'),('includes/password.inc','fd9a1c94fe5a0fa7c7049a2435c7280b1d666b2074595010e3c492dd15712775'),('includes/path.inc','74bf05f3c68b0218730abf3e539fcf08b271959c8f4611940d05124f34a6a66f'),('includes/registry.inc','c225de772f86eebd21b0b52fa8fcc6671e05fa2374cedb3164f7397f27d3c88d'),('includes/session.inc','7548621ae4c273179a76eba41aa58b740100613bc015ad388a5c30132b61e34b'),('includes/stream_wrappers.inc','4f1feb774a8dbc04ca382fa052f59e58039c7261625f3df29987d6b31f08d92d'),('includes/tablesort.inc','2d88768a544829595dd6cda2a5eb008bedb730f36bba6dfe005d9ddd999d5c0f'),('includes/theme.inc','0465fb4ed937123c4bed4a4463601055f9b8fc39ca7787d9952b4f4e300db2b3'),('includes/theme.maintenance.inc','39f068b3eee4d10a90d6aa3c86db587b6d25844c2919d418d34d133cfe330f5a'),('includes/token.inc','5e7898cd78689e2c291ed3cd8f41c032075656896f1db57e49217aac19ae0428'),('includes/unicode.entities.inc','2b858138596d961fbaa4c6e3986e409921df7f76b6ee1b109c4af5970f1e0f54'),('includes/unicode.inc','e18772dafe0f80eb139fcfc582fef1704ba9f730647057d4f4841d6a6e4066ca'),('includes/update.inc','177ce24362efc7f28b384c90a09c3e485396bbd18c3721d4b21e57dd1733bd92'),('includes/updater.inc','d2da0e74ed86e93c209f16069f3d32e1a134ceb6c06a0044f78e841a1b54e380'),('includes/utility.inc','3458fd2b55ab004dd0cc529b8e58af12916e8bd36653b072bdd820b26b907ed5'),('includes/xmlrpc.inc','ea24176ec445c440ba0c825fc7b04a31b440288df8ef02081560dc418e34e659'),('includes/xmlrpcs.inc','741aa8d6fcc6c45a9409064f52351f7999b7c702d73def8da44de2567946598a'),('modules/block/block.test','df1b364688b46345523dfcb95c0c48352d6a4edbc66597890d29b9b0d7866e86'),('modules/color/color.test','013806279bd47ceb2f82ca854b57f880ba21058f7a2592c422afae881a7f5d15'),('modules/comment/comment.module','5a81f5e4b3a35973b3d39ccb9efaee7a8f8cf4ac43e9353e87f2d17a3bed4747'),('modules/comment/comment.test','083d47035d3e64d1f6f9f1e12bc13d056511019a9de84183088e58a359ea58b9'),('modules/contextual/contextual.test','023dafa199bd325ecc55a17b2a3db46ac0a31e23059f701f789f3bc42427ba0b'),('modules/dashboard/dashboard.test','125df00fc6deb985dc554aa7807a48e60a68dbbddbad9ec2c4718da724f0e683'),('modules/dblog/dblog.test','11fbb8522b1c9dc7c85edba3aed7308a8891f26fc7292008822bea1b54722912'),('modules/field/field.attach.inc','2df4687b5ec078c4893dc1fea514f67524fd5293de717b9e05caf977e5ae2327'),('modules/field/field.info.class.inc','a6f2f418552dba0e03f57ee812a6f0f63bbfe4bf81fe805d51ecec47ef84b845'),('modules/field/field.module','2ec1a3ec060504467c3065426a5a1eca8e2c894cb4d4480616bca60fe4b2faf2'),('modules/field/modules/field_sql_storage/field_sql_storage.test','24b4d2596016ff86071ff3f00d63ff854e847dc58ab64a0afc539bdc1f682ac5'),('modules/field/modules/list/tests/list.test','97e55bd49f6f4b0562d04aa3773b5ab9b35063aee05c8c7231780cdcf9c97714'),('modules/field/modules/number/number.test','9ccf835bbf80ff31b121286f6fbcf59cc42b622a51ab56b22362b2f55c656e18'),('modules/field/modules/options/options.test','c71441020206b1587dece7296cca306a9f0fbd6e8f04dae272efc15ed3a38383'),('modules/field/modules/text/text.test','a1e5cb0fa8c0651c68d560d9bb7781463a84200f701b00b6e797a9ca792a7e42'),('modules/field/tests/field.test','0c9c6f9396ab8e0685951f4e90f298629c31d2f7970e5b288e674bc146fefa90'),('modules/field_ui/field_ui.test','da42e28d6f32d447b4a6e5b463a2f7d87d6ce32f149de04a98fa8e3f286c9f68'),('modules/file/tests/file.test','5cb7a7a6cc14a6d4269bf4d406a304f77052be7691e0ec9b8e7c5262316d7539'),('modules/filter/filter.test','13330238c7b8d280ff2dd8cfee1c001d5a994ad45e3c9b9c5fdcd963c6080926'),('modules/help/help.test','bc934de8c71bd9874a05ccb5e8f927f4c227b3b2397d739e8504c8fd6ae5a83c'),('modules/image/image.test','d6ea03d1e3df0e150ed3500b9896984e5c3cd5f28248f2aebecce5b9926eb23b'),('modules/menu/menu.test','cd187c84aa97dcc228d8a1556ea10640c62f86083034533b6ac6830be610ca2a'),('modules/node/node.module','3489bbd7e909b21c54a1bd5e4d4daeafb9bebc6606e48fe1d5e7a6ed935a1a3e'),('modules/node/node.test','e2e485fde00796305fd6926c8b4e9c4e1919020a3ec00819aa5cc1d2b3ebcc5c'),('modules/path/path.test','2004183b2c7c86028bf78c519c6a7afc4397a8267874462b0c2b49b0f8c20322'),('modules/rdf/rdf.test','9849d2b717119aa6b5f1496929e7ac7c9c0a6e98486b66f3876bda0a8c165525'),('modules/search/search.extender.inc','c40f6569769ff581dbe11d29935c611320178f9a076977423e1d93e7d98013fa'),('modules/search/search.test','71ffda1d5c81823aa6f557ca35ba451df2f684856174e25e917f8bf4f0c72453'),('modules/shortcut/shortcut.test','0d78280d4d0a05aa772218e45911552e39611ca9c258b9dd436307914ac3f254'),('modules/system/system.archiver.inc','faa849f3e646a910ab82fd6c8bbf0a4e6b8c60725d7ba81ec0556bd716616cd1'),('modules/system/system.mail.inc','d31e1769f5defbe5f27dc68f641ab80fb8d3de92f6e895f4c654ec05fc7e5f0f'),('modules/system/system.queue.inc','ef00fd41ca86de386fa134d5bc1d816f9af550cf0e1334a5c0ade3119688ca3c'),('modules/system/system.tar.inc','8a31d91f7b3cd7eac25b3fa46e1ed9a8527c39718ba76c3f8c0bbbeaa3aa4086'),('modules/system/system.test','ad3c68f2cacfe6a99c065edc9aca05a22bdbc74ff6158e9918255b4633134ab4'),('modules/system/system.updater.inc','338cf14cb691ba16ee551b3b9e0fa4f579a2f25c964130658236726d17563b6a'),('modules/taxonomy/taxonomy.module','45d6d5652a464318f3eccf8bad6220cc5784e7ffdb0c7b732bf4d540e1effe83'),('modules/taxonomy/taxonomy.test','8525035816906e327ad48bd48bb071597f4c58368a692bcec401299a86699e6e'),('modules/user/user.module','b658c75c17b263a0aa6be903429c14e0fb1c308dd4e9024e369b7e7feb2b5dce'),('modules/user/user.test','d27160f1fd04cfb497ff080c7266fcebcd310d2224cfc6aef70035b275d65573'),('sites/all/modules/ctools/includes/context.inc','335d0c873c1641490abf6d67e20e8973b2b957887762698feea10cbbd53bba24'),('sites/all/modules/ctools/includes/math-expr.inc','3386323b01da62e02c9f3607cd7f0a0d46f1af90a107a07aed726b1fa8c28235'),('sites/all/modules/ctools/includes/stylizer.inc','e18f5a1b8af526751d7175354162c06c2013c96f62d9baa399564d8c45a1c90e'),('sites/all/modules/ctools/plugins/export_ui/ctools_export_ui.class.php','41343bd7446446e352d5820e9559f146ea1e16d8e0d9a6453decc46a8155b926'),('sites/all/modules/entity/entity.features.inc','47261e1f4f39ac3707a16fdea8a8147c09df1281bcb4b9e46b0c8120603137e8'),('sites/all/modules/entity/entity.i18n.inc','41e0e62af7e2774f62b162d597bb3244551c280296b692b29d039a2c243d7059'),('sites/all/modules/entity/entity.info.inc','88ce9a9831f9e2d48655a94f25676d9f1473c627dcc0c1cb1a3375ad287ebd03'),('sites/all/modules/entity/entity.rules.inc','774199059d1b3ebe6d3fe7a49dbb1550df489055a3d066b5de54edda8dd7ba84'),('sites/all/modules/entity/entity.test','df253128e41f152b45ef30b5674009c51cf4112450e5dad8e815f39ced280db5'),('sites/all/modules/entity/includes/entity.controller.inc','342db185e6170b63c59a9b360a196eb322edb9a5b8c7819f66b0eae48ed13ebd'),('sites/all/modules/entity/includes/entity.inc','da25181b06430513b3d16b5dbbc4ea94f2064f3d67b33df1c8f356720630cb14'),('sites/all/modules/entity/includes/entity.ui.inc','65739b31af0e6b422919c17805799dc99143fd89cacfb56b9186e26ece2d0df2'),('sites/all/modules/entity/includes/entity.wrapper.inc','09ee7cd08bec4312486d8ccf41f5b997015d58c04d630e39f5b5d70bcec6fb5c'),('sites/all/modules/entity/views/entity.views.inc','de657f42389ed6832df787e4b618d8d7117b60d145d34ce5dcf3a5b65db29df9'),('sites/all/modules/entity/views/handlers/entity_views_field_handler_helper.inc','4ec395881109a71327ab8d7c5b5702bef30288ca66557e44e8539cc15a2135bb'),('sites/all/modules/entity/views/handlers/entity_views_handler_area_entity.inc','7b7bb88e53861739b7279f705f0492fc83ce95f5b20d89339480f546422ebf25'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_boolean.inc','b28b8eee8761ba7a6af35d97ab7aaee28406e6c227271f9769818560626c5791'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_date.inc','b0f5be5b399de94934b24e84c8cf6053a043f6b00c60dcffa752daeafdd38778'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_duration.inc','ed7bb64cb63b94a20c8cde98cfb053b5ea252804396cf61ac562faf1d850266b'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_entity.inc','4f255918a22fefebe9c7734f200751457a7ca4d3648e32a98511bb51968d7521'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_field.inc','893121efbce2a7181e31147bade260c9cc657cbd33b0d254cb28b2650e57566d'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_numeric.inc','f14e2b063930e8820af381b4f5e83c7278440e7804ab88cfde865b6c94e7c0f6'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_options.inc','27ef31b8ee7b9999930380d6a5fdb477772329c4ddbd5c70cc34bcdc7543ce56'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_text.inc','5fb0a85d35d29944c699ceaf6efed5eda2df757009e44caba8ff2be397568b60'),('sites/all/modules/entity/views/handlers/entity_views_handler_field_uri.inc','79ecaa3eb17dfdd0ca077351b75a2c0adf411ebc04720e7cc0e2397674225f24'),('sites/all/modules/entity/views/handlers/entity_views_handler_relationship.inc','b69bc538d1e1e0f91f8485ca54c3b6e2be025caa47619734c467377cf89041b9'),('sites/all/modules/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc','25aebf66cd2437bd5867fef8f0e0e25d4308b9ce491cc79801e9d3cbed68bcba'),('sites/all/modules/entity/views/plugins/entity_views_plugin_row_entity_view.inc','ba557790215f2658146424d933e0d17787a0b15180c5815f23428448ccf056a0'),('sites/all/modules/entityreference/entityreference.migrate.inc','617c6c49e6e0fa4d106cfb49b61a6994b5520934ac3b64a8400a9d969eab7c59'),('sites/all/modules/entityreference/plugins/behavior/abstract.inc','a7959ddece2ce3490f92d916162e07aed313e28ca299ca0375bad633b42d93e3'),('sites/all/modules/entityreference/plugins/behavior/EntityReferenceBehavior_TaxonomyIndex.class.php','92fa0cf46ecdf6200659646e6666c562ea506c40efa41a8edd4758dc0c551b92'),('sites/all/modules/entityreference/plugins/selection/abstract.inc','7ecf94f5dc3456e4a5c87117d19deb98c368617fb07d610505b1dfa351f14a0b'),('sites/all/modules/entityreference/plugins/selection/EntityReference_SelectionHandler_Generic.class.php','e9a8a3c693ed24218d00c10c445cdb21daed10a26e6b55e5c9d6a8c616cfd871'),('sites/all/modules/entityreference/plugins/selection/views.inc','7bbe8900b6b71c2d41e370deaccca869884d0fe9ca81772d7d5bca5f58ec1cd8'),('sites/all/modules/entityreference/tests/entityreference.admin.test','bcd6516be3099ae87a4c3d41add08edd17eafb4244db8442c5dc15f19ebde7ae'),('sites/all/modules/entityreference/tests/entityreference.feeds.test','320c7480b1758e4d80e91c0a6ea3d43b6b35d1adfe00b6155b61ef786510bb7c'),('sites/all/modules/entityreference/tests/entityreference.handlers.test','2fa170925ac5303c519378f1763e918cc2f111205220d90998b547a08db90d8c'),('sites/all/modules/entityreference/tests/entityreference.taxonomy.test','8e4f7d9ae621df0f587b6fcbf139adea2a35c69305ef018ced88447a41164c5f'),('sites/all/modules/entityreference/views/entityreference_plugin_display.inc','9216a065ea4fdb2daacb1280e5c9549e3400b8553b5293534cf65a0d703ab189'),('sites/all/modules/entityreference/views/entityreference_plugin_row_fields.inc','7f5a58c099c2df6fd1c3ae285197a4648841d44fa107bcb2064bc1edf435ea8b'),('sites/all/modules/entityreference/views/entityreference_plugin_style.inc','ad9a7ea5a37c2d9658c2b1d19ade3011c27ed5d9959423ebf7a390372507e6b0'),('sites/all/modules/features/tests/features.test','909afbf1767c361b6a4f0b278c15da1daf6fbc539fa2641b7a5d932e575aeba3'),('sites/all/modules/panels/includes/common.inc','2aeff1db8ecce443ffe197732fe8203d79efb4c93a39bd7dbe043700a6cb8782'),('sites/all/modules/panels/includes/legacy.inc','dc65c1a82f4a063f9cbebbd8a0ceb512a3b41a1ee2603ec8045034412a791aab'),('sites/all/modules/panels/includes/plugins.inc','62d3ffd40688baba6e6e2c7b945e3dcf5084285efe9590a5a864978f7a86249a'),('sites/all/modules/panels/panels.module','c225ccad6f7cbd477ac85005b71bdef102c0f35bd672ad95fcf15bfac92fa26b'),('sites/all/modules/panels/plugins/display_renderers/panels_renderer_editor.class.php','68412022f265ec0dae02561a550dbfd27741a3f5f8c340700e4a0db87a270571'),('sites/all/modules/panels/plugins/display_renderers/panels_renderer_simple.class.php','420aeca22872635ebd5ab3ce719dd8e1d7fef339271db5f20a0834b812084a6e'),('sites/all/modules/panels/plugins/display_renderers/panels_renderer_standard.class.php','8686e2528779c7be228b7fcf57ea1e18965107b699a8e002e96a8fffc913b911'),('sites/all/modules/panels/plugins/export_ui/panels_layouts_ui.class.php','53dce95a6ce9985a374565102f745e2c2655424fa29cb666432d596a71e82696'),('sites/all/modules/panels/plugins/views/panels_views_plugin_row_fields.inc','d8bcbc2e4e992e7692b807e2a2f2d5c528b7633c054d268adbbc7586fed744c9'),('sites/all/modules/pathauto/pathauto.test','9204240a755119e02eae68c77e7b9ab816747423ccaaf51742231fbaef1f604f'),('sites/all/modules/strongarm/strongarm.admin.inc','5e50651c629ba2bdc71f73051cd876e91f76d523d6fd4ad1d6d66d1f092d3af4'),('sites/all/modules/strongarm/strongarm.install','d198563f5fcc7a1b4b9a98c1ed8439d48a6d7d10577cc966d3a55edd06a4a365'),('sites/all/modules/strongarm/strongarm.module','3e338f1099aff4e501ad99d76bb179aafcc086760d222bbc1bd89fef0bb1c8e5'),('sites/all/modules/token/token.test','703ea26074b80cc85e5d9e5bcedf5e745dddda0917bf2db678bbfa2e58e0609c');
/*!40000 ALTER TABLE `registry_file` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Unique role name.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this role in listings and the user interface.',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_weight` (`name`,`weight`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Stores user roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `role` VALUES (3,'administrator',2),(1,'anonymous user',0),(2,'authenticated user',1),(4,'Moderator',3),(5,'User',4);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `rid` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `role_permission` VALUES (1,'access comments','comment'),(1,'access content','node'),(1,'use text format filtered_html','filter'),(2,'access comments','comment'),(2,'access content','node'),(2,'post comments','comment'),(2,'skip comment approval','comment'),(2,'use text format filtered_html','filter'),(3,'access administration pages','system'),(3,'access comments','comment'),(3,'access content','node'),(3,'access content overview','node'),(3,'access contextual links','contextual'),(3,'access dashboard','dashboard'),(3,'access overlay','overlay'),(3,'access site in maintenance mode','system'),(3,'access site reports','system'),(3,'access toolbar','toolbar'),(3,'access user profiles','user'),(3,'administer actions','system'),(3,'administer advanced pane settings','panels'),(3,'administer blocks','block'),(3,'administer ckeditor','ckeditor'),(3,'administer comments','comment'),(3,'administer content types','node'),(3,'administer features','features'),(3,'administer filters','filter'),(3,'administer image styles','image'),(3,'administer menu','menu'),(3,'administer modules','system'),(3,'administer nodes','node'),(3,'administer pane access','panels'),(3,'administer panels layouts','panels'),(3,'administer panels styles','panels'),(3,'administer pathauto','pathauto'),(3,'administer permissions','user'),(3,'administer search','search'),(3,'administer shortcuts','shortcut'),(3,'administer site configuration','system'),(3,'administer software updates','system'),(3,'administer taxonomy','taxonomy'),(3,'administer themes','system'),(3,'administer url aliases','path'),(3,'administer users','user'),(3,'block IP addresses','system'),(3,'bypass node access','node'),(3,'cancel account','user'),(3,'change layouts in place editing','panels'),(3,'change own username','user'),(3,'create article content','node'),(3,'create page content','node'),(3,'create url aliases','path'),(3,'customize ckeditor','ckeditor'),(3,'customize shortcut links','shortcut'),(3,'delete any article content','node'),(3,'delete any page content','node'),(3,'delete own article content','node'),(3,'delete own page content','node'),(3,'delete revisions','node'),(3,'delete terms in 1','taxonomy'),(3,'edit any article content','node'),(3,'edit any page content','node'),(3,'edit own article content','node'),(3,'edit own comments','comment'),(3,'edit own page content','node'),(3,'edit terms in 1','taxonomy'),(3,'generate features','features'),(3,'manage features','features'),(3,'notify of path changes','pathauto'),(3,'post comments','comment'),(3,'rename features','features'),(3,'revert revisions','node'),(3,'search content','search'),(3,'select account cancellation method','user'),(3,'skip comment approval','comment'),(3,'switch shortcut sets','shortcut'),(3,'use advanced search','search'),(3,'use ipe with page manager','panels'),(3,'use panels caching features','panels'),(3,'use panels dashboard','panels'),(3,'use panels in place editing','panels'),(3,'use panels locks','panels'),(3,'use text format filtered_html','filter'),(3,'use text format full_html','filter'),(3,'view own unpublished content','node'),(3,'view pane admin links','panels'),(3,'view revisions','node'),(3,'view the administration theme','system');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `search_dataset`
--

DROP TABLE IF EXISTS `search_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Search item ID, e.g. node ID for nodes.',
  `type` varchar(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` longtext NOT NULL COMMENT 'List of space-separated words from the item.',
  `reindex` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Set to force node reindexing.',
  PRIMARY KEY (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items that will be searched.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_dataset`
--

LOCK TABLES `search_dataset` WRITE;
/*!40000 ALTER TABLE `search_dataset` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `search_dataset` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float DEFAULT NULL COMMENT 'The numeric score of the word, higher being more important.',
  PRIMARY KEY (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the search index, associating words, items and...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_index`
--

LOCK TABLES `search_index` WRITE;
/*!40000 ALTER TABLE `search_index` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `search_index` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `search_node_links`
--

DROP TABLE IF EXISTS `search_node_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item containing the link to the node.',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT 'The search_dataset.type of the searchable item containing the link to the node.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid that this item links to.',
  `caption` longtext COMMENT 'The text used to link to the node.nid.',
  PRIMARY KEY (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items (like nodes) that link to other nodes, used...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_node_links`
--

LOCK TABLES `search_node_links` WRITE;
/*!40000 ALTER TABLE `search_node_links` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `search_node_links` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `search_total`
--

DROP TABLE IF EXISTS `search_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float DEFAULT NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores search totals for words.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_total`
--

LOCK TABLES `search_total` WRITE;
/*!40000 ALTER TABLE `search_total` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `search_total` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `semaphore`
--

DROP TABLE IF EXISTS `semaphore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique name.',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'A value for the semaphore.',
  `expire` double NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.',
  PRIMARY KEY (`name`),
  KEY `value` (`value`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for holding semaphores, locks, flags, etc. that...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semaphore`
--

LOCK TABLES `semaphore` WRITE;
/*!40000 ALTER TABLE `semaphore` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `semaphore` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `value` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.',
  PRIMARY KEY (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores IDs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sequences` VALUES (1);
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` int(11) NOT NULL DEFAULT '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.',
  PRIMARY KEY (`sid`,`ssid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`),
  KEY `ssid` (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Drupal’s session handlers read and write into the...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sessions` VALUES (1,'JcBkexTAdLi4Y65luQ0mz-9txjXscMLqyOpdcwgb4EU','','192.168.192.1',1418054928,0,'batches|a:1:{i:1;b:1;}'),(1,'zdgVS5yq6svRsNZMoxNg_5jUGBGkhAqwkF0LdOO3_X0','','192.168.192.1',1418055116,0,'');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `shortcut_set`
--

DROP TABLE IF EXISTS `shortcut_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut_set` (
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.',
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about sets of shortcuts links.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortcut_set`
--

LOCK TABLES `shortcut_set` WRITE;
/*!40000 ALTER TABLE `shortcut_set` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `shortcut_set` VALUES ('shortcut-set-1','Default');
/*!40000 ALTER TABLE `shortcut_set` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `shortcut_set_users`
--

DROP TABLE IF EXISTS `shortcut_set_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to shortcut sets.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortcut_set_users`
--

LOCK TABLES `shortcut_set_users` WRITE;
/*!40000 ALTER TABLE `shortcut_set_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shortcut_set_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the item; e.g. node.',
  `type` varchar(12) NOT NULL DEFAULT '' COMMENT 'The type of the item, either module, theme, or theme_engine.',
  `owner` varchar(255) NOT NULL DEFAULT '' COMMENT 'A theme’s ’parent’ . Can be either a theme or an engine.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether or not this item is enabled.',
  `bootstrap` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether this module is loaded during Drupal’s early bootstrapping phase (e.g. even before the page cache is consulted).',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1' COMMENT 'The module’s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module’s hook_update_N() function that has either been run or existed when the module was first installed.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  `info` blob COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.',
  PRIMARY KEY (`filename`),
  KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`),
  KEY `type_name` (`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of all modules, themes, and theme engines that are...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `system` VALUES ('modules/aggregator/aggregator.module','aggregator','module','',0,0,-1,0,'a:14:{s:4:\"name\";s:10:\"Aggregator\";s:11:\"description\";s:57:\"Aggregates syndicated content (RSS, RDF, and Atom feeds).\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:15:\"aggregator.test\";}s:9:\"configure\";s:41:\"admin/config/services/aggregator/settings\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:14:\"aggregator.css\";s:33:\"modules/aggregator/aggregator.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/aggregator/tests/aggregator_test.module','aggregator_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:23:\"Aggregator module tests\";s:11:\"description\";s:46:\"Support module for aggregator related testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/block/block.module','block','module','',1,0,7009,-5,'a:13:{s:4:\"name\";s:5:\"Block\";s:11:\"description\";s:140:\"Controls the visual building blocks a page is constructed with. Blocks are boxes of content rendered into an area, or region, of a web page.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:10:\"block.test\";}s:9:\"configure\";s:21:\"admin/structure/block\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/block/tests/block_test.module','block_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Block test\";s:11:\"description\";s:21:\"Provides test blocks.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/blog/blog.module','blog','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:4:\"Blog\";s:11:\"description\";s:25:\"Enables multi-user blogs.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:9:\"blog.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/book/book.module','book','module','',0,0,-1,0,'a:14:{s:4:\"name\";s:4:\"Book\";s:11:\"description\";s:66:\"Allows users to create and organize related content in an outline.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:9:\"book.test\";}s:9:\"configure\";s:27:\"admin/content/book/settings\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:8:\"book.css\";s:21:\"modules/book/book.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/color/color.module','color','module','',1,0,7001,0,'a:12:{s:4:\"name\";s:5:\"Color\";s:11:\"description\";s:70:\"Allows administrators to change the color scheme of compatible themes.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:10:\"color.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/comment/comment.module','comment','module','',1,0,7009,0,'a:14:{s:4:\"name\";s:7:\"Comment\";s:11:\"description\";s:57:\"Allows users to comment on and discuss published content.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:4:\"text\";}s:5:\"files\";a:2:{i:0;s:14:\"comment.module\";i:1;s:12:\"comment.test\";}s:9:\"configure\";s:21:\"admin/content/comment\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:11:\"comment.css\";s:27:\"modules/comment/comment.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/contact/contact.module','contact','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:7:\"Contact\";s:11:\"description\";s:61:\"Enables the use of both personal and site-wide contact forms.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:12:\"contact.test\";}s:9:\"configure\";s:23:\"admin/structure/contact\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/contextual/contextual.module','contextual','module','',1,0,0,0,'a:12:{s:4:\"name\";s:16:\"Contextual links\";s:11:\"description\";s:75:\"Provides contextual links to perform actions related to elements on a page.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:15:\"contextual.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/dashboard/dashboard.module','dashboard','module','',1,0,0,0,'a:13:{s:4:\"name\";s:9:\"Dashboard\";s:11:\"description\";s:136:\"Provides a dashboard page in the administrative interface for organizing administrative tasks and tracking information within your site.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:5:\"files\";a:1:{i:0;s:14:\"dashboard.test\";}s:12:\"dependencies\";a:1:{i:0;s:5:\"block\";}s:9:\"configure\";s:25:\"admin/dashboard/customize\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/dblog/dblog.module','dblog','module','',1,1,7002,0,'a:12:{s:4:\"name\";s:16:\"Database logging\";s:11:\"description\";s:47:\"Logs and records system events to the database.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:10:\"dblog.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/field/field.module','field','module','',1,0,7003,0,'a:14:{s:4:\"name\";s:5:\"Field\";s:11:\"description\";s:57:\"Field API to add fields to entities like nodes and users.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:4:{i:0;s:12:\"field.module\";i:1;s:16:\"field.attach.inc\";i:2;s:20:\"field.info.class.inc\";i:3;s:16:\"tests/field.test\";}s:12:\"dependencies\";a:1:{i:0;s:17:\"field_sql_storage\";}s:8:\"required\";b:1;s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:15:\"theme/field.css\";s:29:\"modules/field/theme/field.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/field/modules/field_sql_storage/field_sql_storage.module','field_sql_storage','module','',1,0,7002,0,'a:13:{s:4:\"name\";s:17:\"Field SQL storage\";s:11:\"description\";s:37:\"Stores field data in an SQL database.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"field\";}s:5:\"files\";a:1:{i:0;s:22:\"field_sql_storage.test\";}s:8:\"required\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/field/modules/list/list.module','list','module','',1,0,7002,0,'a:12:{s:4:\"name\";s:4:\"List\";s:11:\"description\";s:69:\"Defines list field types. Use with Options to create selection lists.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:2:{i:0;s:5:\"field\";i:1;s:7:\"options\";}s:5:\"files\";a:1:{i:0;s:15:\"tests/list.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/field/modules/list/tests/list_test.module','list_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:9:\"List test\";s:11:\"description\";s:41:\"Support module for the List module tests.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/field/modules/number/number.module','number','module','',1,0,0,0,'a:12:{s:4:\"name\";s:6:\"Number\";s:11:\"description\";s:28:\"Defines numeric field types.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"field\";}s:5:\"files\";a:1:{i:0;s:11:\"number.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/field/modules/options/options.module','options','module','',1,0,0,0,'a:12:{s:4:\"name\";s:7:\"Options\";s:11:\"description\";s:82:\"Defines selection, check box and radio button widgets for text and numeric fields.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"field\";}s:5:\"files\";a:1:{i:0;s:12:\"options.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/field/modules/text/text.module','text','module','',1,0,7000,0,'a:14:{s:4:\"name\";s:4:\"Text\";s:11:\"description\";s:32:\"Defines simple text field types.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"field\";}s:5:\"files\";a:1:{i:0;s:9:\"text.test\";}s:8:\"required\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;s:11:\"explanation\";s:73:\"Field type(s) in use - see <a href=\"/admin/reports/fields\">Field list</a>\";}'),('modules/field/tests/field_test.module','field_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:14:\"Field API Test\";s:11:\"description\";s:39:\"Support module for the Field API tests.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:5:\"files\";a:1:{i:0;s:21:\"field_test.entity.inc\";}s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/field_ui/field_ui.module','field_ui','module','',1,0,0,0,'a:12:{s:4:\"name\";s:8:\"Field UI\";s:11:\"description\";s:33:\"User interface for the Field API.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"field\";}s:5:\"files\";a:1:{i:0;s:13:\"field_ui.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/file/file.module','file','module','',1,0,0,0,'a:12:{s:4:\"name\";s:4:\"File\";s:11:\"description\";s:26:\"Defines a file field type.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"field\";}s:5:\"files\";a:1:{i:0;s:15:\"tests/file.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/file/tests/file_module_test.module','file_module_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:9:\"File test\";s:11:\"description\";s:53:\"Provides hooks for testing File module functionality.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/filter/filter.module','filter','module','',1,0,7010,0,'a:14:{s:4:\"name\";s:6:\"Filter\";s:11:\"description\";s:43:\"Filters content in preparation for display.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:11:\"filter.test\";}s:8:\"required\";b:1;s:9:\"configure\";s:28:\"admin/config/content/formats\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/forum/forum.module','forum','module','',0,0,-1,0,'a:14:{s:4:\"name\";s:5:\"Forum\";s:11:\"description\";s:27:\"Provides discussion forums.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"taxonomy\";i:1;s:7:\"comment\";}s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:10:\"forum.test\";}s:9:\"configure\";s:21:\"admin/structure/forum\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"forum.css\";s:23:\"modules/forum/forum.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/help/help.module','help','module','',1,0,0,0,'a:12:{s:4:\"name\";s:4:\"Help\";s:11:\"description\";s:35:\"Manages the display of online help.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:9:\"help.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/image/image.module','image','module','',1,0,7005,0,'a:15:{s:4:\"name\";s:5:\"Image\";s:11:\"description\";s:34:\"Provides image manipulation tools.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:4:\"file\";}s:5:\"files\";a:1:{i:0;s:10:\"image.test\";}s:9:\"configure\";s:31:\"admin/config/media/image-styles\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;s:8:\"required\";b:1;s:11:\"explanation\";s:73:\"Field type(s) in use - see <a href=\"/admin/reports/fields\">Field list</a>\";}'),('modules/image/tests/image_module_test.module','image_module_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Image test\";s:11:\"description\";s:69:\"Provides hook implementations for testing Image module functionality.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:24:\"image_module_test.module\";}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/locale/locale.module','locale','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:6:\"Locale\";s:11:\"description\";s:119:\"Adds language handling functionality and enables the translation of the user interface to languages other than English.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:11:\"locale.test\";}s:9:\"configure\";s:30:\"admin/config/regional/language\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/locale/tests/locale_test.module','locale_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"Locale Test\";s:11:\"description\";s:42:\"Support module for the locale layer tests.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/menu/menu.module','menu','module','',1,0,7003,0,'a:13:{s:4:\"name\";s:4:\"Menu\";s:11:\"description\";s:60:\"Allows administrators to customize the site navigation menu.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:9:\"menu.test\";}s:9:\"configure\";s:20:\"admin/structure/menu\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/node/node.module','node','module','',1,0,7014,0,'a:15:{s:4:\"name\";s:4:\"Node\";s:11:\"description\";s:66:\"Allows content to be submitted to the site and displayed on pages.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:2:{i:0;s:11:\"node.module\";i:1;s:9:\"node.test\";}s:8:\"required\";b:1;s:9:\"configure\";s:21:\"admin/structure/types\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:8:\"node.css\";s:21:\"modules/node/node.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/node/tests/node_access_test.module','node_access_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:24:\"Node module access tests\";s:11:\"description\";s:43:\"Support module for node permission testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/node/tests/node_test.module','node_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:17:\"Node module tests\";s:11:\"description\";s:40:\"Support module for node related testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/node/tests/node_test_exception.module','node_test_exception','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:27:\"Node module exception tests\";s:11:\"description\";s:50:\"Support module for node related exception testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/openid/openid.module','openid','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:6:\"OpenID\";s:11:\"description\";s:48:\"Allows users to log into your site using OpenID.\";s:7:\"version\";s:4:\"7.34\";s:7:\"package\";s:4:\"Core\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:11:\"openid.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/openid/tests/openid_test.module','openid_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:21:\"OpenID dummy provider\";s:11:\"description\";s:33:\"OpenID provider used for testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"openid\";}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/overlay/overlay.module','overlay','module','',1,1,0,0,'a:12:{s:4:\"name\";s:7:\"Overlay\";s:11:\"description\";s:59:\"Displays the Drupal administration interface in an overlay.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/path/path.module','path','module','',1,0,0,0,'a:13:{s:4:\"name\";s:4:\"Path\";s:11:\"description\";s:28:\"Allows users to rename URLs.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:9:\"path.test\";}s:9:\"configure\";s:24:\"admin/config/search/path\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/php/php.module','php','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:10:\"PHP filter\";s:11:\"description\";s:50:\"Allows embedded PHP code/snippets to be evaluated.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:8:\"php.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/poll/poll.module','poll','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:4:\"Poll\";s:11:\"description\";s:95:\"Allows your site to capture votes on different topics in the form of multiple choice questions.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:9:\"poll.test\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:8:\"poll.css\";s:21:\"modules/poll/poll.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/profile/profile.module','profile','module','',0,0,-1,0,'a:14:{s:4:\"name\";s:7:\"Profile\";s:11:\"description\";s:36:\"Supports configurable user profiles.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:12:\"profile.test\";}s:9:\"configure\";s:27:\"admin/config/people/profile\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/rdf/rdf.module','rdf','module','',1,0,0,0,'a:12:{s:4:\"name\";s:3:\"RDF\";s:11:\"description\";s:148:\"Enriches your content with metadata to let other applications (e.g. search engines, aggregators) better understand its relationships and attributes.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:8:\"rdf.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/rdf/tests/rdf_test.module','rdf_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:16:\"RDF module tests\";s:11:\"description\";s:38:\"Support module for RDF module testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/search/search.module','search','module','',1,0,7000,0,'a:14:{s:4:\"name\";s:6:\"Search\";s:11:\"description\";s:36:\"Enables site-wide keyword searching.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:2:{i:0;s:19:\"search.extender.inc\";i:1;s:11:\"search.test\";}s:9:\"configure\";s:28:\"admin/config/search/settings\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"search.css\";s:25:\"modules/search/search.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/search/tests/search_embedded_form.module','search_embedded_form','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:20:\"Search embedded form\";s:11:\"description\";s:59:\"Support module for search module testing of embedded forms.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/search/tests/search_extra_type.module','search_extra_type','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:16:\"Test search type\";s:11:\"description\";s:41:\"Support module for search module testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/shortcut/shortcut.module','shortcut','module','',1,0,0,0,'a:13:{s:4:\"name\";s:8:\"Shortcut\";s:11:\"description\";s:60:\"Allows users to manage customizable lists of shortcut links.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:13:\"shortcut.test\";}s:9:\"configure\";s:36:\"admin/config/user-interface/shortcut\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/simpletest/simpletest.module','simpletest','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:7:\"Testing\";s:11:\"description\";s:53:\"Provides a framework for unit and functional testing.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:49:{i:0;s:15:\"simpletest.test\";i:1;s:24:\"drupal_web_test_case.php\";i:2;s:18:\"tests/actions.test\";i:3;s:15:\"tests/ajax.test\";i:4;s:16:\"tests/batch.test\";i:5;s:20:\"tests/bootstrap.test\";i:6;s:16:\"tests/cache.test\";i:7;s:17:\"tests/common.test\";i:8;s:24:\"tests/database_test.test\";i:9;s:22:\"tests/entity_crud.test\";i:10;s:32:\"tests/entity_crud_hook_test.test\";i:11;s:23:\"tests/entity_query.test\";i:12;s:16:\"tests/error.test\";i:13;s:15:\"tests/file.test\";i:14;s:23:\"tests/filetransfer.test\";i:15;s:15:\"tests/form.test\";i:16;s:16:\"tests/graph.test\";i:17;s:16:\"tests/image.test\";i:18;s:15:\"tests/lock.test\";i:19;s:15:\"tests/mail.test\";i:20;s:15:\"tests/menu.test\";i:21;s:17:\"tests/module.test\";i:22;s:16:\"tests/pager.test\";i:23;s:19:\"tests/password.test\";i:24;s:15:\"tests/path.test\";i:25;s:19:\"tests/registry.test\";i:26;s:17:\"tests/schema.test\";i:27;s:18:\"tests/session.test\";i:28;s:20:\"tests/tablesort.test\";i:29;s:16:\"tests/theme.test\";i:30;s:18:\"tests/unicode.test\";i:31;s:17:\"tests/update.test\";i:32;s:17:\"tests/xmlrpc.test\";i:33;s:26:\"tests/upgrade/upgrade.test\";i:34;s:34:\"tests/upgrade/upgrade.comment.test\";i:35;s:33:\"tests/upgrade/upgrade.filter.test\";i:36;s:32:\"tests/upgrade/upgrade.forum.test\";i:37;s:33:\"tests/upgrade/upgrade.locale.test\";i:38;s:31:\"tests/upgrade/upgrade.menu.test\";i:39;s:31:\"tests/upgrade/upgrade.node.test\";i:40;s:35:\"tests/upgrade/upgrade.taxonomy.test\";i:41;s:34:\"tests/upgrade/upgrade.trigger.test\";i:42;s:39:\"tests/upgrade/upgrade.translatable.test\";i:43;s:33:\"tests/upgrade/upgrade.upload.test\";i:44;s:31:\"tests/upgrade/upgrade.user.test\";i:45;s:36:\"tests/upgrade/update.aggregator.test\";i:46;s:33:\"tests/upgrade/update.trigger.test\";i:47;s:31:\"tests/upgrade/update.field.test\";i:48;s:30:\"tests/upgrade/update.user.test\";}s:9:\"configure\";s:41:\"admin/config/development/testing/settings\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/actions_loop_test.module','actions_loop_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:17:\"Actions loop test\";s:11:\"description\";s:39:\"Support module for action loop testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/ajax_forms_test.module','ajax_forms_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:26:\"AJAX form test mock module\";s:11:\"description\";s:25:\"Test for AJAX form calls.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/ajax_test.module','ajax_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:9:\"AJAX Test\";s:11:\"description\";s:40:\"Support module for AJAX framework tests.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/batch_test.module','batch_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:14:\"Batch API test\";s:11:\"description\";s:35:\"Support module for Batch API tests.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/common_test.module','common_test','module','',0,0,-1,0,'a:14:{s:4:\"name\";s:11:\"Common Test\";s:11:\"description\";s:32:\"Support module for Common tests.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:15:\"common_test.css\";s:40:\"modules/simpletest/tests/common_test.css\";}s:5:\"print\";a:1:{s:21:\"common_test.print.css\";s:46:\"modules/simpletest/tests/common_test.print.css\";}}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/common_test_cron_helper.module','common_test_cron_helper','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:23:\"Common Test Cron Helper\";s:11:\"description\";s:56:\"Helper module for CronRunTestCase::testCronExceptions().\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/database_test.module','database_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:13:\"Database Test\";s:11:\"description\";s:40:\"Support module for Database layer tests.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/drupal_system_listing_compatible_test/drupal_system_listing_compatible_test.module','drupal_system_listing_compatible_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:37:\"Drupal system listing compatible test\";s:11:\"description\";s:62:\"Support module for testing the drupal_system_listing function.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/drupal_system_listing_incompatible_test/drupal_system_listing_incompatible_test.module','drupal_system_listing_incompatible_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:39:\"Drupal system listing incompatible test\";s:11:\"description\";s:62:\"Support module for testing the drupal_system_listing function.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/entity_cache_test.module','entity_cache_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:17:\"Entity cache test\";s:11:\"description\";s:40:\"Support module for testing entity cache.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:28:\"entity_cache_test_dependency\";}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/entity_cache_test_dependency.module','entity_cache_test_dependency','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:28:\"Entity cache test dependency\";s:11:\"description\";s:51:\"Support dependency module for testing entity cache.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/entity_crud_hook_test.module','entity_crud_hook_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:22:\"Entity CRUD Hooks Test\";s:11:\"description\";s:35:\"Support module for CRUD hook tests.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/entity_query_access_test.module','entity_query_access_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:24:\"Entity query access test\";s:11:\"description\";s:49:\"Support module for checking entity query results.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/error_test.module','error_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Error test\";s:11:\"description\";s:47:\"Support module for error and exception testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/file_test.module','file_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:9:\"File test\";s:11:\"description\";s:39:\"Support module for file handling tests.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:16:\"file_test.module\";}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/filter_test.module','filter_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:18:\"Filter test module\";s:11:\"description\";s:33:\"Tests filter hooks and functions.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/form_test.module','form_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:12:\"FormAPI Test\";s:11:\"description\";s:34:\"Support module for Form API tests.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/image_test.module','image_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Image test\";s:11:\"description\";s:39:\"Support module for image toolkit tests.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/menu_test.module','menu_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:15:\"Hook menu tests\";s:11:\"description\";s:37:\"Support module for menu hook testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/module_test.module','module_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"Module test\";s:11:\"description\";s:41:\"Support module for module system testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/path_test.module','path_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:15:\"Hook path tests\";s:11:\"description\";s:37:\"Support module for path hook testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/psr_0_test/psr_0_test.module','psr_0_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:16:\"PSR-0 Test cases\";s:11:\"description\";s:44:\"Test classes to be discovered by simpletest.\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/requirements1_test.module','requirements1_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:19:\"Requirements 1 Test\";s:11:\"description\";s:80:\"Tests that a module is not installed when it fails hook_requirements(\'install\').\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/requirements2_test.module','requirements2_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:19:\"Requirements 2 Test\";s:11:\"description\";s:98:\"Tests that a module is not installed when the one it depends on fails hook_requirements(\'install).\";s:12:\"dependencies\";a:2:{i:0;s:18:\"requirements1_test\";i:1;s:7:\"comment\";}s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/session_test.module','session_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:12:\"Session test\";s:11:\"description\";s:40:\"Support module for session data testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/system_dependencies_test.module','system_dependencies_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:22:\"System dependency test\";s:11:\"description\";s:47:\"Support module for testing system dependencies.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:12:\"dependencies\";a:1:{i:0;s:19:\"_missing_dependency\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/system_incompatible_core_version_dependencies_test.module','system_incompatible_core_version_dependencies_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:50:\"System incompatible core version dependencies test\";s:11:\"description\";s:47:\"Support module for testing system dependencies.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:12:\"dependencies\";a:1:{i:0;s:37:\"system_incompatible_core_version_test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/system_incompatible_core_version_test.module','system_incompatible_core_version_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:37:\"System incompatible core version test\";s:11:\"description\";s:47:\"Support module for testing system dependencies.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"5.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/system_incompatible_module_version_dependencies_test.module','system_incompatible_module_version_dependencies_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:52:\"System incompatible module version dependencies test\";s:11:\"description\";s:47:\"Support module for testing system dependencies.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:12:\"dependencies\";a:1:{i:0;s:46:\"system_incompatible_module_version_test (>2.0)\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/system_incompatible_module_version_test.module','system_incompatible_module_version_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:39:\"System incompatible module version test\";s:11:\"description\";s:47:\"Support module for testing system dependencies.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/system_test.module','system_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"System test\";s:11:\"description\";s:34:\"Support module for system testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:18:\"system_test.module\";}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/taxonomy_test.module','taxonomy_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:20:\"Taxonomy test module\";s:11:\"description\";s:45:\"\"Tests functions and hooks not used in core\".\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:12:\"dependencies\";a:1:{i:0;s:8:\"taxonomy\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/theme_test.module','theme_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Theme test\";s:11:\"description\";s:40:\"Support module for theme system testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/update_script_test.module','update_script_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:18:\"Update script test\";s:11:\"description\";s:41:\"Support module for update script testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/update_test_1.module','update_test_1','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"Update test\";s:11:\"description\";s:34:\"Support module for update testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/update_test_2.module','update_test_2','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"Update test\";s:11:\"description\";s:34:\"Support module for update testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/update_test_3.module','update_test_3','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"Update test\";s:11:\"description\";s:34:\"Support module for update testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/url_alter_test.module','url_alter_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:15:\"Url_alter tests\";s:11:\"description\";s:45:\"A support modules for url_alter hook testing.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/simpletest/tests/xmlrpc_test.module','xmlrpc_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:12:\"XML-RPC Test\";s:11:\"description\";s:75:\"Support module for XML-RPC tests according to the validator1 specification.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/statistics/statistics.module','statistics','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Statistics\";s:11:\"description\";s:37:\"Logs access statistics for your site.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:15:\"statistics.test\";}s:9:\"configure\";s:30:\"admin/config/system/statistics\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/syslog/syslog.module','syslog','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:6:\"Syslog\";s:11:\"description\";s:41:\"Logs and records system events to syslog.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:11:\"syslog.test\";}s:9:\"configure\";s:32:\"admin/config/development/logging\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/system/system.module','system','module','',1,1,7079,0,'a:14:{s:4:\"name\";s:6:\"System\";s:11:\"description\";s:54:\"Handles general site configuration for administrators.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:6:{i:0;s:19:\"system.archiver.inc\";i:1;s:15:\"system.mail.inc\";i:2;s:16:\"system.queue.inc\";i:3;s:14:\"system.tar.inc\";i:4;s:18:\"system.updater.inc\";i:5;s:11:\"system.test\";}s:8:\"required\";b:1;s:9:\"configure\";s:19:\"admin/config/system\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/system/tests/cron_queue_test.module','cron_queue_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:15:\"Cron Queue test\";s:11:\"description\";s:41:\"Support module for the cron queue runner.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/taxonomy/taxonomy.module','taxonomy','module','',1,0,7011,0,'a:15:{s:4:\"name\";s:8:\"Taxonomy\";s:11:\"description\";s:38:\"Enables the categorization of content.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:7:\"options\";}s:5:\"files\";a:2:{i:0;s:15:\"taxonomy.module\";i:1;s:13:\"taxonomy.test\";}s:9:\"configure\";s:24:\"admin/structure/taxonomy\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;s:8:\"required\";b:1;s:11:\"explanation\";s:73:\"Field type(s) in use - see <a href=\"/admin/reports/fields\">Field list</a>\";}'),('modules/toolbar/toolbar.module','toolbar','module','',1,0,0,0,'a:12:{s:4:\"name\";s:7:\"Toolbar\";s:11:\"description\";s:99:\"Provides a toolbar that shows the top-level administration menu items and links from other modules.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/tracker/tracker.module','tracker','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:7:\"Tracker\";s:11:\"description\";s:45:\"Enables tracking of recent content for users.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"comment\";}s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:12:\"tracker.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/translation/tests/translation_test.module','translation_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:24:\"Content Translation Test\";s:11:\"description\";s:49:\"Support module for the content translation tests.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/translation/translation.module','translation','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:19:\"Content translation\";s:11:\"description\";s:57:\"Allows content to be translated into different languages.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:16:\"translation.test\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/trigger/tests/trigger_test.module','trigger_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:12:\"Trigger Test\";s:11:\"description\";s:33:\"Support module for Trigger tests.\";s:7:\"package\";s:7:\"Testing\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"version\";s:4:\"7.34\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/trigger/trigger.module','trigger','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:7:\"Trigger\";s:11:\"description\";s:90:\"Enables actions to be fired on certain system events, such as when new content is created.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:12:\"trigger.test\";}s:9:\"configure\";s:23:\"admin/structure/trigger\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/update/tests/aaa_update_test.module','aaa_update_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:15:\"AAA Update test\";s:11:\"description\";s:41:\"Support module for update module testing.\";s:7:\"package\";s:7:\"Testing\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"version\";s:4:\"7.34\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/update/tests/bbb_update_test.module','bbb_update_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:15:\"BBB Update test\";s:11:\"description\";s:41:\"Support module for update module testing.\";s:7:\"package\";s:7:\"Testing\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"version\";s:4:\"7.34\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/update/tests/ccc_update_test.module','ccc_update_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:15:\"CCC Update test\";s:11:\"description\";s:41:\"Support module for update module testing.\";s:7:\"package\";s:7:\"Testing\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"version\";s:4:\"7.34\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/update/tests/update_test.module','update_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"Update test\";s:11:\"description\";s:41:\"Support module for update module testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/update/update.module','update','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:14:\"Update manager\";s:11:\"description\";s:104:\"Checks for available updates, and can securely install or update modules and themes via a web interface.\";s:7:\"version\";s:4:\"7.34\";s:7:\"package\";s:4:\"Core\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:11:\"update.test\";}s:9:\"configure\";s:30:\"admin/reports/updates/settings\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('modules/user/tests/user_form_test.module','user_form_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:22:\"User module form tests\";s:11:\"description\";s:37:\"Support module for user form testing.\";s:7:\"package\";s:7:\"Testing\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('modules/user/user.module','user','module','',1,0,7018,0,'a:15:{s:4:\"name\";s:4:\"User\";s:11:\"description\";s:47:\"Manages the user registration and login system.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:2:{i:0;s:11:\"user.module\";i:1;s:9:\"user.test\";}s:8:\"required\";b:1;s:9:\"configure\";s:19:\"admin/config/people\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:8:\"user.css\";s:21:\"modules/user/user.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('profiles/standard/standard.profile','standard','module','',1,0,0,1000,'a:15:{s:4:\"name\";s:8:\"Standard\";s:11:\"description\";s:51:\"Install with commonly used features pre-configured.\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:21:{i:0;s:5:\"block\";i:1;s:5:\"color\";i:2;s:7:\"comment\";i:3;s:10:\"contextual\";i:4;s:9:\"dashboard\";i:5;s:4:\"help\";i:6;s:5:\"image\";i:7;s:4:\"list\";i:8;s:4:\"menu\";i:9;s:6:\"number\";i:10;s:7:\"options\";i:11;s:4:\"path\";i:12;s:8:\"taxonomy\";i:13;s:5:\"dblog\";i:14;s:6:\"search\";i:15;s:8:\"shortcut\";i:16;s:7:\"toolbar\";i:17;s:7:\"overlay\";i:18;s:8:\"field_ui\";i:19;s:4:\"file\";i:20;s:3:\"rdf\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:5:\"mtime\";i:1416429488;s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;s:6:\"hidden\";b:1;s:8:\"required\";b:1;s:17:\"distribution_name\";s:6:\"Drupal\";}'),('sites/all/modules/ckeditor/ckeditor.module','ckeditor','module','',1,0,7005,0,'a:13:{s:4:\"name\";s:8:\"CKEditor\";s:11:\"description\";s:76:\"Enables CKEditor (WYSIWYG HTML editor) for use instead of plain text fields.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:14:\"User interface\";s:9:\"configure\";s:29:\"admin/config/content/ckeditor\";s:7:\"version\";s:8:\"7.x-1.16\";s:7:\"project\";s:8:\"ckeditor\";s:9:\"datestamp\";s:10:\"1413311935\";s:5:\"mtime\";i:1418056302;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/bulk_export/bulk_export.module','bulk_export','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:11:\"Bulk Export\";s:11:\"description\";s:67:\"Performs bulk exporting of data objects known about by Chaos tools.\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:7:\"package\";s:16:\"Chaos tool suite\";s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/ctools.module','ctools','module','',1,0,6008,0,'a:12:{s:4:\"name\";s:11:\"Chaos tools\";s:11:\"description\";s:46:\"A library of helpful tools by Merlin of Chaos.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:16:\"Chaos tool suite\";s:5:\"files\";a:3:{i:0;s:20:\"includes/context.inc\";i:1;s:22:\"includes/math-expr.inc\";i:2;s:21:\"includes/stylizer.inc\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/ctools_access_ruleset/ctools_access_ruleset.module','ctools_access_ruleset','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:15:\"Custom rulesets\";s:11:\"description\";s:81:\"Create custom, exportable, reusable access rulesets for applications like Panels.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/ctools_ajax_sample/ctools_ajax_sample.module','ctools_ajax_sample','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:33:\"Chaos Tools (CTools) AJAX Example\";s:11:\"description\";s:41:\"Shows how to use the power of Chaos AJAX.\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:4:\"core\";s:3:\"7.x\";s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/ctools_custom_content/ctools_custom_content.module','ctools_custom_content','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:20:\"Custom content panes\";s:11:\"description\";s:79:\"Create custom, exportable, reusable content panes for applications like Panels.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/ctools_plugin_example/ctools_plugin_example.module','ctools_plugin_example','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:35:\"Chaos Tools (CTools) Plugin Example\";s:11:\"description\";s:75:\"Shows how an external module can provide ctools plugins (for Panels, etc.).\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:4:{i:0;s:6:\"ctools\";i:1;s:6:\"panels\";i:2;s:12:\"page_manager\";i:3;s:13:\"advanced_help\";}s:4:\"core\";s:3:\"7.x\";s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/page_manager/page_manager.module','page_manager','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:12:\"Page manager\";s:11:\"description\";s:54:\"Provides a UI and API to manage pages within the site.\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:7:\"package\";s:16:\"Chaos tool suite\";s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/stylizer/stylizer.module','stylizer','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:8:\"Stylizer\";s:11:\"description\";s:53:\"Create custom styles for applications such as Panels.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:2:{i:0;s:6:\"ctools\";i:1;s:5:\"color\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/term_depth/term_depth.module','term_depth','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:17:\"Term Depth access\";s:11:\"description\";s:48:\"Controls access to context based upon term depth\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:7:\"package\";s:16:\"Chaos tool suite\";s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/tests/ctools_export_test/ctools_export_test.module','ctools_export_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:18:\"CTools export test\";s:11:\"description\";s:25:\"CTools export test module\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:6:\"hidden\";b:1;s:5:\"files\";a:1:{i:0;s:18:\"ctools_export.test\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/tests/ctools_plugin_test.module','ctools_plugin_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:24:\"Chaos tools plugins test\";s:11:\"description\";s:42:\"Provides hooks for testing ctools plugins.\";s:7:\"package\";s:16:\"Chaos tool suite\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:5:\"files\";a:6:{i:0;s:19:\"ctools.plugins.test\";i:1;s:17:\"object_cache.test\";i:2;s:8:\"css.test\";i:3;s:12:\"context.test\";i:4;s:20:\"math_expression.test\";i:5;s:26:\"math_expression_stack.test\";}s:6:\"hidden\";b:1;s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/ctools/views_content/views_content.module','views_content','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:19:\"Views content panes\";s:11:\"description\";s:104:\"Allows Views content to be used in Panels, Dashboard and other modules which use the CTools Content API.\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:2:{i:0;s:6:\"ctools\";i:1;s:5:\"views\";}s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:3:{i:0;s:61:\"plugins/views/views_content_plugin_display_ctools_context.inc\";i:1;s:57:\"plugins/views/views_content_plugin_display_panel_pane.inc\";i:2;s:59:\"plugins/views/views_content_plugin_style_ctools_context.inc\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1416423525\";s:5:\"mtime\";i:1418055357;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entity/entity.module','entity','module','',1,0,7003,0,'a:12:{s:4:\"name\";s:10:\"Entity API\";s:11:\"description\";s:69:\"Enables modules to work with any entity type and to provide entities.\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:24:{i:0;s:19:\"entity.features.inc\";i:1;s:15:\"entity.i18n.inc\";i:2;s:15:\"entity.info.inc\";i:3;s:16:\"entity.rules.inc\";i:4;s:11:\"entity.test\";i:5;s:19:\"includes/entity.inc\";i:6;s:30:\"includes/entity.controller.inc\";i:7;s:22:\"includes/entity.ui.inc\";i:8;s:27:\"includes/entity.wrapper.inc\";i:9;s:22:\"views/entity.views.inc\";i:10;s:52:\"views/handlers/entity_views_field_handler_helper.inc\";i:11;s:51:\"views/handlers/entity_views_handler_area_entity.inc\";i:12;s:53:\"views/handlers/entity_views_handler_field_boolean.inc\";i:13;s:50:\"views/handlers/entity_views_handler_field_date.inc\";i:14;s:54:\"views/handlers/entity_views_handler_field_duration.inc\";i:15;s:52:\"views/handlers/entity_views_handler_field_entity.inc\";i:16;s:51:\"views/handlers/entity_views_handler_field_field.inc\";i:17;s:53:\"views/handlers/entity_views_handler_field_numeric.inc\";i:18;s:53:\"views/handlers/entity_views_handler_field_options.inc\";i:19;s:50:\"views/handlers/entity_views_handler_field_text.inc\";i:20;s:49:\"views/handlers/entity_views_handler_field_uri.inc\";i:21;s:62:\"views/handlers/entity_views_handler_relationship_by_bundle.inc\";i:22;s:52:\"views/handlers/entity_views_handler_relationship.inc\";i:23;s:53:\"views/plugins/entity_views_plugin_row_entity_view.inc\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"entity\";s:9:\"datestamp\";s:10:\"1396975454\";s:5:\"mtime\";i:1418055359;s:12:\"dependencies\";a:0:{}s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entity/entity_token.module','entity_token','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:13:\"Entity tokens\";s:11:\"description\";s:99:\"Provides token replacements for all properties that have no tokens and are known to the entity API.\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:2:{i:0;s:23:\"entity_token.tokens.inc\";i:1;s:19:\"entity_token.module\";}s:12:\"dependencies\";a:1:{i:0;s:6:\"entity\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"entity\";s:9:\"datestamp\";s:10:\"1396975454\";s:5:\"mtime\";i:1418055359;s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entity/tests/entity_feature.module','entity_feature','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:21:\"Entity feature module\";s:11:\"description\";s:31:\"Provides some entities in code.\";s:7:\"version\";s:7:\"7.x-1.5\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:21:\"entity_feature.module\";}s:12:\"dependencies\";a:1:{i:0;s:11:\"entity_test\";}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"entity\";s:9:\"datestamp\";s:10:\"1396975454\";s:5:\"mtime\";i:1418055359;s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entity/tests/entity_test.module','entity_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:23:\"Entity CRUD test module\";s:11:\"description\";s:46:\"Provides entity types based upon the CRUD API.\";s:7:\"version\";s:7:\"7.x-1.5\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:2:{i:0;s:18:\"entity_test.module\";i:1;s:19:\"entity_test.install\";}s:12:\"dependencies\";a:1:{i:0;s:6:\"entity\";}s:6:\"hidden\";b:1;s:7:\"project\";s:6:\"entity\";s:9:\"datestamp\";s:10:\"1396975454\";s:5:\"mtime\";i:1418055359;s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entity/tests/entity_test_i18n.module','entity_test_i18n','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:28:\"Entity-test type translation\";s:11:\"description\";s:37:\"Allows translating entity-test types.\";s:12:\"dependencies\";a:2:{i:0;s:11:\"entity_test\";i:1;s:11:\"i18n_string\";}s:7:\"package\";s:35:\"Multilingual - Internationalization\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:6:\"entity\";s:9:\"datestamp\";s:10:\"1396975454\";s:5:\"mtime\";i:1418055359;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entityreference/entityreference.module','entityreference','module','',1,0,7002,0,'a:12:{s:4:\"name\";s:16:\"Entity Reference\";s:11:\"description\";s:51:\"Provides a field that can reference other entities.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:6:\"Fields\";s:12:\"dependencies\";a:2:{i:0;s:6:\"entity\";i:1;s:6:\"ctools\";}s:5:\"files\";a:11:{i:0;s:27:\"entityreference.migrate.inc\";i:1;s:30:\"plugins/selection/abstract.inc\";i:2;s:27:\"plugins/selection/views.inc\";i:3;s:29:\"plugins/behavior/abstract.inc\";i:4;s:40:\"views/entityreference_plugin_display.inc\";i:5;s:38:\"views/entityreference_plugin_style.inc\";i:6;s:43:\"views/entityreference_plugin_row_fields.inc\";i:7;s:35:\"tests/entityreference.handlers.test\";i:8;s:35:\"tests/entityreference.taxonomy.test\";i:9;s:32:\"tests/entityreference.admin.test\";i:10;s:32:\"tests/entityreference.feeds.test\";}s:7:\"version\";s:7:\"7.x-1.1\";s:7:\"project\";s:15:\"entityreference\";s:9:\"datestamp\";s:10:\"1384973110\";s:5:\"mtime\";i:1418055332;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entityreference/examples/entityreference_behavior_example/entityreference_behavior_example.module','entityreference_behavior_example','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:33:\"Entity Reference Behavior Example\";s:11:\"description\";s:71:\"Provides some example code for implementing Entity Reference behaviors.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:6:\"Fields\";s:12:\"dependencies\";a:1:{i:0;s:15:\"entityreference\";}s:7:\"version\";s:7:\"7.x-1.1\";s:7:\"project\";s:15:\"entityreference\";s:9:\"datestamp\";s:10:\"1384973110\";s:5:\"mtime\";i:1418055332;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/entityreference/tests/modules/entityreference_feeds_test/entityreference_feeds_test.module','entityreference_feeds_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:41:\"Entityreference - Feeds integration tests\";s:11:\"description\";s:65:\"Support module for the Entityreference - Feeds integration tests.\";s:7:\"package\";s:7:\"Testing\";s:4:\"core\";s:3:\"7.x\";s:6:\"hidden\";b:1;s:12:\"dependencies\";a:3:{i:0;s:5:\"feeds\";i:1;s:8:\"feeds_ui\";i:2;s:15:\"entityreference\";}s:7:\"version\";s:7:\"7.x-1.1\";s:7:\"project\";s:15:\"entityreference\";s:9:\"datestamp\";s:10:\"1384973110\";s:5:\"mtime\";i:1418055332;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/features/features.module','features','module','',1,0,6101,20,'a:13:{s:4:\"name\";s:8:\"Features\";s:11:\"description\";s:39:\"Provides feature management for Drupal.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:8:\"Features\";s:5:\"files\";a:1:{i:0;s:19:\"tests/features.test\";}s:9:\"configure\";s:33:\"admin/structure/features/settings\";s:7:\"version\";s:7:\"7.x-2.2\";s:7:\"project\";s:8:\"features\";s:9:\"datestamp\";s:10:\"1407338930\";s:5:\"mtime\";i:1418055264;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/features/tests/features_test/features_test.module','features_test','module','',0,0,-1,0,'a:14:{s:4:\"name\";s:14:\"Features Tests\";s:11:\"description\";s:33:\"Test module for Features testing.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:7:\"Testing\";s:3:\"php\";s:5:\"5.2.0\";s:12:\"dependencies\";a:5:{i:0;s:8:\"features\";i:1;s:5:\"image\";i:2;s:9:\"strongarm\";i:3;s:8:\"taxonomy\";i:4;s:5:\"views\";}s:8:\"features\";a:10:{s:6:\"ctools\";a:2:{i:0;s:21:\"strongarm:strongarm:1\";i:1;s:23:\"views:views_default:3.0\";}s:12:\"features_api\";a:1:{i:0;s:5:\"api:2\";}s:10:\"field_base\";a:1:{i:0;s:19:\"field_features_test\";}s:14:\"field_instance\";a:1:{i:0;s:38:\"node-features_test-field_features_test\";}s:6:\"filter\";a:1:{i:0;s:13:\"features_test\";}s:5:\"image\";a:1:{i:0;s:13:\"features_test\";}s:4:\"node\";a:1:{i:0;s:13:\"features_test\";}s:8:\"taxonomy\";a:1:{i:0;s:22:\"taxonomy_features_test\";}s:15:\"user_permission\";a:1:{i:0;s:28:\"create features_test content\";}s:10:\"views_view\";a:1:{i:0;s:13:\"features_test\";}}s:6:\"hidden\";s:1:\"1\";s:7:\"version\";s:7:\"7.x-2.2\";s:7:\"project\";s:8:\"features\";s:9:\"datestamp\";s:10:\"1407338930\";s:5:\"mtime\";i:1418055264;s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/panels/i18n_panels/i18n_panels.module','i18n_panels','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:18:\"Panels translation\";s:11:\"description\";s:35:\"Supports translatable panels items.\";s:12:\"dependencies\";a:4:{i:0;s:4:\"i18n\";i:1;s:6:\"panels\";i:2;s:11:\"i18n_string\";i:3;s:16:\"i18n_translation\";}s:7:\"package\";s:35:\"Multilingual - Internationalization\";s:4:\"core\";s:3:\"7.x\";s:7:\"version\";s:7:\"7.x-3.4\";s:7:\"project\";s:6:\"panels\";s:9:\"datestamp\";s:10:\"1392221614\";s:5:\"mtime\";i:1418055403;s:3:\"php\";s:5:\"5.2.4\";s:5:\"files\";a:0:{}s:9:\"bootstrap\";i:0;}'),('sites/all/modules/panels/panels.module','panels','module','',1,0,7303,0,'a:13:{s:4:\"name\";s:6:\"Panels\";s:11:\"description\";s:107:\"Core Panels display functions; provides no external UI, at least one other Panels module should be enabled.\";s:4:\"core\";s:3:\"7.x\";s:7:\"package\";s:6:\"Panels\";s:9:\"configure\";s:22:\"admin/structure/panels\";s:12:\"dependencies\";a:1:{i:0;s:14:\"ctools (>=1.4)\";}s:5:\"files\";a:5:{i:0;s:13:\"panels.module\";i:1;s:19:\"includes/common.inc\";i:2;s:19:\"includes/legacy.inc\";i:3;s:20:\"includes/plugins.inc\";i:4;s:48:\"plugins/views/panels_views_plugin_row_fields.inc\";}s:7:\"version\";s:7:\"7.x-3.4\";s:7:\"project\";s:6:\"panels\";s:9:\"datestamp\";s:10:\"1392221614\";s:5:\"mtime\";i:1418055403;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/panels/panels_ipe/panels_ipe.module','panels_ipe','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:22:\"Panels In-Place Editor\";s:11:\"description\";s:101:\"Provide a UI for managing some Panels directly on the frontend, instead of having to use the backend.\";s:7:\"package\";s:6:\"Panels\";s:12:\"dependencies\";a:1:{i:0;s:6:\"panels\";}s:4:\"core\";s:3:\"7.x\";s:9:\"configure\";s:22:\"admin/structure/panels\";s:5:\"files\";a:1:{i:0;s:17:\"panels_ipe.module\";}s:7:\"version\";s:7:\"7.x-3.4\";s:7:\"project\";s:6:\"panels\";s:9:\"datestamp\";s:10:\"1392221614\";s:5:\"mtime\";i:1418055403;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/panels/panels_mini/panels_mini.module','panels_mini','module','',0,0,-1,0,'a:12:{s:4:\"name\";s:11:\"Mini panels\";s:11:\"description\";s:89:\"Create mini panels that can be used as blocks by Drupal and panes by other panel modules.\";s:7:\"package\";s:6:\"Panels\";s:12:\"dependencies\";a:1:{i:0;s:6:\"panels\";}s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:42:\"plugins/export_ui/panels_mini_ui.class.php\";}s:7:\"version\";s:7:\"7.x-3.4\";s:7:\"project\";s:6:\"panels\";s:9:\"datestamp\";s:10:\"1392221614\";s:5:\"mtime\";i:1418055403;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/panels/panels_node/panels_node.module','panels_node','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:11:\"Panel nodes\";s:11:\"description\";s:65:\"Create nodes that are divided into areas with selectable content.\";s:7:\"package\";s:6:\"Panels\";s:12:\"dependencies\";a:1:{i:0;s:6:\"panels\";}s:9:\"configure\";s:22:\"admin/structure/panels\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:18:\"panels_node.module\";}s:7:\"version\";s:7:\"7.x-3.4\";s:7:\"project\";s:6:\"panels\";s:9:\"datestamp\";s:10:\"1392221614\";s:5:\"mtime\";i:1418055403;s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/pathauto/pathauto.module','pathauto','module','',1,0,7005,1,'a:14:{s:4:\"name\";s:8:\"Pathauto\";s:11:\"description\";s:95:\"Provides a mechanism for modules to automatically generate aliases for the content they manage.\";s:12:\"dependencies\";a:2:{i:0;s:4:\"path\";i:1;s:5:\"token\";}s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:13:\"pathauto.test\";}s:9:\"configure\";s:33:\"admin/config/search/path/patterns\";s:10:\"recommends\";a:1:{i:0;s:8:\"redirect\";}s:7:\"version\";s:7:\"7.x-1.2\";s:7:\"project\";s:8:\"pathauto\";s:9:\"datestamp\";s:10:\"1344525185\";s:5:\"mtime\";i:1418055443;s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/strongarm/strongarm.module','strongarm','module','',1,0,7201,-1000,'a:12:{s:4:\"name\";s:9:\"Strongarm\";s:11:\"description\";s:87:\"Enforces variable values defined by modules that need settings set to operate properly.\";s:4:\"core\";s:3:\"7.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:5:\"files\";a:3:{i:0;s:19:\"strongarm.admin.inc\";i:1;s:17:\"strongarm.install\";i:2;s:16:\"strongarm.module\";}s:7:\"version\";s:7:\"7.x-2.0\";s:7:\"project\";s:9:\"strongarm\";s:9:\"datestamp\";s:10:\"1339604214\";s:5:\"mtime\";i:1418055473;s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/token/tests/token_test.module','token_test','module','',0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Token Test\";s:11:\"description\";s:39:\"Testing module for token functionality.\";s:7:\"package\";s:7:\"Testing\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:17:\"token_test.module\";}s:6:\"hidden\";b:1;s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1361665026\";s:5:\"mtime\";i:1418055453;s:12:\"dependencies\";a:0:{}s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('sites/all/modules/token/token.module','token','module','',1,0,7001,0,'a:12:{s:4:\"name\";s:5:\"Token\";s:11:\"description\";s:73:\"Provides a user interface for the Token API and some missing core tokens.\";s:4:\"core\";s:3:\"7.x\";s:5:\"files\";a:1:{i:0;s:10:\"token.test\";}s:7:\"version\";s:7:\"7.x-1.5\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1361665026\";s:5:\"mtime\";i:1418055453;s:12:\"dependencies\";a:0:{}s:7:\"package\";s:5:\"Other\";s:3:\"php\";s:5:\"5.2.4\";s:9:\"bootstrap\";i:0;}'),('themes/bartik/bartik.info','bartik','theme','themes/engines/phptemplate/phptemplate.engine',1,0,-1,0,'a:19:{s:4:\"name\";s:6:\"Bartik\";s:11:\"description\";s:48:\"A flexible, recolorable theme with many regions.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:3:{s:14:\"css/layout.css\";s:28:\"themes/bartik/css/layout.css\";s:13:\"css/style.css\";s:27:\"themes/bartik/css/style.css\";s:14:\"css/colors.css\";s:28:\"themes/bartik/css/colors.css\";}s:5:\"print\";a:1:{s:13:\"css/print.css\";s:27:\"themes/bartik/css/print.css\";}}s:7:\"regions\";a:20:{s:6:\"header\";s:6:\"Header\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:11:\"highlighted\";s:11:\"Highlighted\";s:8:\"featured\";s:8:\"Featured\";s:7:\"content\";s:7:\"Content\";s:13:\"sidebar_first\";s:13:\"Sidebar first\";s:14:\"sidebar_second\";s:14:\"Sidebar second\";s:14:\"triptych_first\";s:14:\"Triptych first\";s:15:\"triptych_middle\";s:15:\"Triptych middle\";s:13:\"triptych_last\";s:13:\"Triptych last\";s:18:\"footer_firstcolumn\";s:19:\"Footer first column\";s:19:\"footer_secondcolumn\";s:20:\"Footer second column\";s:18:\"footer_thirdcolumn\";s:19:\"Footer third column\";s:19:\"footer_fourthcolumn\";s:20:\"Footer fourth column\";s:6:\"footer\";s:6:\"Footer\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"0\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:28:\"themes/bartik/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}'),('themes/garland/garland.info','garland','theme','themes/engines/phptemplate/phptemplate.engine',0,0,-1,0,'a:19:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:111:\"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:8:\"settings\";a:1:{s:13:\"garland_width\";s:5:\"fluid\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}'),('themes/seven/seven.info','seven','theme','themes/engines/phptemplate/phptemplate.engine',1,0,-1,0,'a:19:{s:4:\"name\";s:5:\"Seven\";s:11:\"description\";s:65:\"A simple one-column, tableless, fluid width administration theme.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:22:\"themes/seven/reset.css\";s:9:\"style.css\";s:22:\"themes/seven/style.css\";}}s:8:\"settings\";a:1:{s:20:\"shortcut_module_link\";s:1:\"1\";}s:7:\"regions\";a:8:{s:7:\"content\";s:7:\"Content\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:13:\"sidebar_first\";s:13:\"First sidebar\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:14:\"regions_hidden\";a:3:{i:0;s:13:\"sidebar_first\";i:1;s:8:\"page_top\";i:2;s:11:\"page_bottom\";}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/seven/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}'),('themes/stark/stark.info','stark','theme','themes/engines/phptemplate/phptemplate.engine',0,0,-1,0,'a:18:{s:4:\"name\";s:5:\"Stark\";s:11:\"description\";s:208:\"This theme demonstrates Drupal\'s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal\'s default code, see the <a href=\"http://drupal.org/theme-guide\">Theming Guide</a>.\";s:7:\"package\";s:4:\"Core\";s:7:\"version\";s:4:\"7.34\";s:4:\"core\";s:3:\"7.x\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:10:\"layout.css\";s:23:\"themes/stark/layout.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1416429488\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"regions\";a:12:{s:13:\"sidebar_first\";s:12:\"Left sidebar\";s:14:\"sidebar_second\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";s:11:\"highlighted\";s:11:\"Highlighted\";s:4:\"help\";s:4:\"Help\";s:8:\"page_top\";s:8:\"Page top\";s:11:\"page_bottom\";s:11:\"Page bottom\";s:14:\"dashboard_main\";s:16:\"Dashboard (main)\";s:17:\"dashboard_sidebar\";s:19:\"Dashboard (sidebar)\";s:18:\"dashboard_inactive\";s:20:\"Dashboard (inactive)\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:25:\"comment_user_verification\";i:7;s:9:\"main_menu\";i:8;s:14:\"secondary_menu\";}s:10:\"screenshot\";s:27:\"themes/stark/screenshot.png\";s:3:\"php\";s:5:\"5.2.4\";s:7:\"scripts\";a:0:{}s:5:\"mtime\";i:1416429488;s:15:\"overlay_regions\";a:5:{i:0;s:14:\"dashboard_main\";i:1;s:17:\"dashboard_sidebar\";i:2;s:18:\"dashboard_inactive\";i:3;s:7:\"content\";i:4;s:4:\"help\";}s:14:\"regions_hidden\";a:2:{i:0;s:8:\"page_top\";i:1;s:11:\"page_bottom\";}s:28:\"overlay_supplemental_regions\";a:1:{i:0;s:8:\"page_top\";}}');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `taxonomy_index`
--

DROP TABLE IF EXISTS `taxonomy_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_index` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`tid`,`sticky`,`created`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_index`
--

LOCK TABLES `taxonomy_index` WRITE;
/*!40000 ALTER TABLE `taxonomy_index` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taxonomy_index` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `taxonomy_term_data`
--

DROP TABLE IF EXISTS `taxonomy_term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores term information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_term_data`
--

LOCK TABLES `taxonomy_term_data` WRITE;
/*!40000 ALTER TABLE `taxonomy_term_data` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taxonomy_term_data` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `taxonomy_term_hierarchy`
--

DROP TABLE IF EXISTS `taxonomy_term_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the hierarchical relationship between terms.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_term_hierarchy`
--

LOCK TABLES `taxonomy_term_hierarchy` WRITE;
/*!40000 ALTER TABLE `taxonomy_term_hierarchy` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taxonomy_term_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `taxonomy_vocabulary`
--

DROP TABLE IF EXISTS `taxonomy_vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module which created the vocabulary.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_vocabulary`
--

LOCK TABLES `taxonomy_vocabulary` WRITE;
/*!40000 ALTER TABLE `taxonomy_vocabulary` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `taxonomy_vocabulary` VALUES (1,'Tags','tags','Use tags to group articles on similar topics into categories.',0,'taxonomy',0);
/*!40000 ALTER TABLE `taxonomy_vocabulary` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY (`pid`),
  KEY `alias_language_pid` (`alias`,`language`,`pid`),
  KEY `source_language_pid` (`source`,`language`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of URL aliases for Drupal paths; a user may visit...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_alias`
--

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique user ID.',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'Unique user name.',
  `pass` varchar(128) NOT NULL DEFAULT '' COMMENT 'User’s password (hashed).',
  `mail` varchar(254) DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s default theme.',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s signature.',
  `signature_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for when user was created.',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for user’s last login.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` varchar(32) DEFAULT NULL COMMENT 'User’s time zone.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'User’s default language.',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` varchar(254) DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (0,'','','','','',NULL,0,0,0,0,NULL,'',0,'',NULL),(1,'admin','$S$DLmGezMsu4r37FJ8gDoPa2v2YKp5cHSE.JCtv8TUSI2Urivye2Gq','admin@drupal.go','','',NULL,1417797823,1418055116,1418055116,1,'Europe/Helsinki','',0,'admin@drupal.go','b:0;');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: role.rid for role.',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users_roles` VALUES (1,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `variable` VALUES ('admin_theme','s:5:\"seven\";'),('clean_url','i:1;'),('comment_page','i:0;'),('cron_key','s:43:\"JyxnMGVtS-08wOBSG-OtmOEo4qaO3bPShbPkT_1aZVk\";'),('cron_last','i:1418054928;'),('css_js_query_string','s:6:\"ng9v93\";'),('date_default_timezone','s:15:\"Europe/Helsinki\";'),('drupal_http_request_fails','b:1;'),('drupal_private_key','s:43:\"2M81YFsJvXnSCC7IhxOMHSPWVYWTDsQbfC-iRb4L8xY\";'),('entityreference:base-tables','a:6:{s:7:\"comment\";a:2:{i:0;s:7:\"comment\";i:1;s:3:\"cid\";}s:4:\"node\";a:2:{i:0;s:4:\"node\";i:1;s:3:\"nid\";}s:4:\"file\";a:2:{i:0;s:12:\"file_managed\";i:1;s:3:\"fid\";}s:13:\"taxonomy_term\";a:2:{i:0;s:18:\"taxonomy_term_data\";i:1;s:3:\"tid\";}s:19:\"taxonomy_vocabulary\";a:2:{i:0;s:19:\"taxonomy_vocabulary\";i:1;s:3:\"vid\";}s:4:\"user\";a:2:{i:0;s:5:\"users\";i:1;s:3:\"uid\";}}'),('features_ignored_orphans','a:0:{}'),('file_temporary_path','s:4:\"/tmp\";'),('filter_fallback_format','s:10:\"plain_text\";'),('install_profile','s:8:\"standard\";'),('install_task','s:4:\"done\";'),('install_time','i:1417797930;'),('menu_expanded','a:0:{}'),('menu_masks','a:35:{i:0;i:501;i:1;i:493;i:2;i:250;i:3;i:247;i:4;i:246;i:5;i:245;i:6;i:125;i:7;i:123;i:8;i:122;i:9;i:121;i:10;i:117;i:11;i:63;i:12;i:62;i:13;i:61;i:14;i:60;i:15;i:59;i:16;i:58;i:17;i:56;i:18;i:44;i:19;i:31;i:20;i:30;i:21;i:29;i:22;i:28;i:23;i:24;i:24;i:21;i:25;i:15;i:26;i:14;i:27;i:13;i:28;i:11;i:29;i:7;i:30;i:6;i:31;i:5;i:32;i:3;i:33;i:2;i:34;i:1;}'),('node_admin_theme','s:1:\"1\";'),('node_options_page','a:1:{i:0;s:6:\"status\";}'),('node_submitted_page','b:0;'),('pathauto_blog_pattern','s:17:\"blogs/[user:name]\";'),('pathauto_forum_pattern','s:29:\"[term:vocabulary]/[term:name]\";'),('pathauto_node_pattern','s:20:\"content/[node:title]\";'),('pathauto_punctuation_hyphen','i:1;'),('pathauto_taxonomy_term_pattern','s:29:\"[term:vocabulary]/[term:name]\";'),('pathauto_user_pattern','s:17:\"users/[user:name]\";'),('path_alias_whitelist','a:0:{}'),('site_default_country','s:2:\"MD\";'),('site_mail','s:15:\"admin@drupal.go\";'),('site_name','s:20:\"Auto News and Market\";'),('theme_default','s:6:\"bartik\";'),('user_admin_role','s:1:\"3\";'),('user_pictures','s:1:\"1\";'),('user_picture_dimensions','s:9:\"1024x1024\";'),('user_picture_file_size','s:3:\"800\";'),('user_picture_style','s:9:\"thumbnail\";'),('user_register','i:2;');
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `watchdog`
--

DROP TABLE IF EXISTS `watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example "user" or "page not found."',
  `message` longtext NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` varchar(255) DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` text COMMENT 'URL of referring page.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `severity` (`severity`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='Table that contains logs of all system events.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchdog`
--

LOCK TABLES `watchdog` WRITE;
/*!40000 ALTER TABLE `watchdog` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `watchdog` VALUES (1,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:5:\"dblog\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(2,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:5:\"dblog\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(3,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"field_ui\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(4,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"field_ui\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(5,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"file\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(6,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"file\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(7,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:7:\"options\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(8,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:7:\"options\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(9,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"taxonomy\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(10,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"taxonomy\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(11,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"help\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(12,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"help\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797862),(13,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:5:\"image\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797863),(14,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:5:\"image\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797863),(15,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"list\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797863),(16,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"list\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797863),(17,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"menu\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797863),(18,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"menu\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(19,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"number\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(20,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"number\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(21,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:7:\"overlay\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(22,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:7:\"overlay\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(23,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:4:\"path\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(24,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:4:\"path\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(25,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:3:\"rdf\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(26,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:3:\"rdf\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797864),(27,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"search\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797865),(28,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"search\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797865),(29,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"shortcut\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797865),(30,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"shortcut\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797865),(31,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:7:\"toolbar\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797866),(32,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:7:\"toolbar\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797866),(33,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"standard\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(34,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"standard\";}',6,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=do','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(35,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:15:\"Publish comment\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(36,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:17:\"Unpublish comment\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(37,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:12:\"Save comment\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(38,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:15:\"Publish content\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(39,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:17:\"Unpublish content\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(40,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:19:\"Make content sticky\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(41,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:21:\"Make content unsticky\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(42,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:29:\"Promote content to front page\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(43,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:30:\"Remove content from front page\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(44,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:12:\"Save content\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(45,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:30:\"Ban IP address of current user\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(46,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:18:\"Block current user\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en&id=1&op=finished','http://drupal.go/install.php?profile=standard&locale=en&op=start&id=1','192.168.192.1',1417797868),(47,1,'user','Session opened for %name.','a:1:{s:5:\"%name\";s:5:\"admin\";}',5,'','http://drupal.go/install.php?profile=standard&locale=en','http://drupal.go/install.php?profile=standard&locale=en','192.168.192.1',1417797931),(48,0,'cron','Cron run completed.','a:0:{}',5,'','http://drupal.go/install.php?profile=standard&locale=en','http://drupal.go/install.php?profile=standard&locale=en','192.168.192.1',1417797932),(49,0,'cron','Cron run completed.','a:0:{}',5,'','http://drupal.go/','','192.168.192.1',1417951618),(50,0,'cron','Cron run completed.','a:0:{}',5,'','http://drupal.go/','','192.168.192.1',1418054966),(51,1,'user','Session opened for %name.','a:1:{s:5:\"%name\";s:5:\"admin\";}',5,'','http://marketos.md/node?destination=node','http://marketos.md/','192.168.192.1',1418055116),(52,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"features\";}',6,'','http://default/index.php','','127.0.0.1',1418055284),(53,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"features\";}',6,'','http://default/index.php','','127.0.0.1',1418055284),(54,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"ctools\";}',6,'','http://default/index.php','','127.0.0.1',1418055371),(55,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"ctools\";}',6,'','http://default/index.php','','127.0.0.1',1418055371),(56,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"entity\";}',6,'','http://default/index.php','','127.0.0.1',1418055371),(57,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"entity\";}',6,'','http://default/index.php','','127.0.0.1',1418055371),(58,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:15:\"entityreference\";}',6,'','http://default/index.php','','127.0.0.1',1418055371),(59,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:15:\"entityreference\";}',6,'','http://default/index.php','','127.0.0.1',1418055371),(60,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:6:\"panels\";}',6,'','http://default/index.php','','127.0.0.1',1418055414),(61,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:6:\"panels\";}',6,'','http://default/index.php','','127.0.0.1',1418055414),(62,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:5:\"token\";}',6,'','http://default/index.php','','127.0.0.1',1418055458),(63,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:5:\"token\";}',6,'','http://default/index.php','','127.0.0.1',1418055458),(64,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"pathauto\";}',6,'','http://default/index.php','','127.0.0.1',1418055458),(65,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"pathauto\";}',6,'','http://default/index.php','','127.0.0.1',1418055458),(66,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:17:\"Update node alias\";}',5,'','http://default/index.php','','127.0.0.1',1418055459),(67,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:26:\"Update taxonomy term alias\";}',5,'','http://default/index.php','','127.0.0.1',1418055459),(68,0,'actions','Action \'%action\' added.','a:1:{s:7:\"%action\";s:17:\"Update user alias\";}',5,'','http://default/index.php','','127.0.0.1',1418055459),(69,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:9:\"strongarm\";}',6,'','http://default/index.php','','127.0.0.1',1418055480),(70,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:9:\"strongarm\";}',6,'','http://default/index.php','','127.0.0.1',1418055480),(71,0,'system','%module module installed.','a:1:{s:7:\"%module\";s:8:\"ckeditor\";}',6,'','http://default/index.php','','127.0.0.1',1418056311),(72,0,'system','%module module enabled.','a:1:{s:7:\"%module\";s:8:\"ckeditor\";}',6,'','http://default/index.php','','127.0.0.1',1418056311);
/*!40000 ALTER TABLE `watchdog` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-08 19:03:40
