
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE TESTS (
  T_ID   int(11) NOT NULL auto_increment,
  T_NAME varchar(40) default NULL,
  T_CPU varchar(20) default NULL,
  T_OS varchar(30) default NULL,
  T_VERSION varchar(10) default NULL,
  T_ADDDATE date NOT NULL default '0000-00-00',
  T_GRAPH char(1) NOT NULL default '-',
  T_INTERACTIVE char(1) NOT NULL default '-',
  T_RESULT int(11) NOT NULL default '0',
  T_FAIL char(1) NOT NULL default '-',
  T_RECOMPILE char(1) NOT NULL default '-',
  T_NORUN char(1) NOT NULL default '-',
  T_NEEDLIBRARY char(1) NOT NULL default '-',
  T_KNOWNRUNERROR int(11) NOT NULL default '0',
  T_KNOWN char(1) NOT NULL default '-',
  T_NOTE varchar(255) default NULL,
  T_DESCRIPTION text,
  T_SOURCE text,
  T_OPTS varchar(255) default NULL,
  PRIMARY KEY  (T_ID),
  UNIQUE KEY T_NAME (T_NAME)
);

CREATE TABLE TESTRESULTS (
  TR_ID int(11) NOT NULL auto_increment,
  TR_TESTRUN_FK int(11) NOT NULL default '0',
  TR_TEST_FK int(11) default NULL,
  TR_OK char(1) NOT NULL default '-',
  TR_SKIP char(1) NOT NULL default '-',
  TR_RESULT int(11) NOT NULL default '0',
  TR_LOG text,
  PRIMARY KEY  (TR_ID),
  UNIQUE KEY TR_TESTCOMP (TR_TESTRUN_FK,TR_TEST_FK),
  KEY I_TRTESTRUN (TR_TESTRUN_FK),
  KEY I_TRTEST (TR_TEST_FK)
);

CREATE TABLE TESTRUN (
  TU_ID int(11) NOT NULL auto_increment,
  TU_DATE timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  TU_CPU_FK int(11) NOT NULL default '0',
  TU_OS_FK int(11) NOT NULL default '0',
  TU_VERSION_FK int(11) NOT NULL default '0',
  TU_CATEGORY_FK int(11) NOT NULL default '1',
  TU_FAILEDTOCOMPILE int(11) NOT NULL default '0',
  TU_SUCCESSFULLYFAILED int(11) NOT NULL default '0',
  TU_FAILEDTOFAIL int(11) NOT NULL default '0',
  TU_SUCCESFULLYCOMPILED int(11) NOT NULL default '0',
  TU_FAILEDTORUN int(11) NOT NULL default '0',
  TU_KNOWNPROBLEM int(11) NOT NULL default '0',
  TU_SUCCESSFULLYRUN int(11) NOT NULL default '0',
  TU_SKIPPEDGRAPHTEST int(11) NOT NULL default '0',
  TU_SKIPPEDINTERACTIVETEST int(11) NOT NULL default '0',
  TU_KNOWNBUG int(11) NOT NULL default '0',
  TU_COMPILERVERIONTOOLOW int(11) NOT NULL default '0',
  TU_COMPILERVERIONTOOHIGH int(11) NOT NULL default '0',
  TU_OTHERCPU int(11) NOT NULL default '0',
  TU_OTHERTARGET int(11) NOT NULL default '0',
  TU_UNIT int(11) NOT NULL default '0',
  TU_SKIPPINGRUNTEST int(11) NOT NULL default '0',
  TU_SUBMITTER varchar(128) NOT NULL default '',
  TU_MACHINE varchar(128) NOT NULL default '',
  TU_COMMENT varchar(255) NOT NULL default '',
  PRIMARY KEY  (TU_ID),
  UNIQUE KEY TU_OVERVIEW (TU_ID,TU_CPU_FK,TU_OS_FK,TU_VERSION_FK,TU_DATE),
  KEY TU_IDATE (TU_DATE)
);

CREATE TABLE `TESTCATEGORY` (
  TCAT_ID int(11) NOT NULL auto_increment,
  TCAT_NAME varchar(20) default NULL,
  PRIMARY KEY  (`TCAT_ID`),
  UNIQUE KEY `TCAT_NAME` (`TCAT_NAME`)
) AUTO_INCREMENT=3 ;

CREATE TABLE TESTOS (
  TO_ID int(11) NOT NULL auto_increment,
  TO_NAME varchar(10) default NULL,
  PRIMARY KEY  (`TO_ID`),
  UNIQUE KEY `TR_INAME` (`TO_NAME`)
) AUTO_INCREMENT=18 ;

CREATE TABLE TESTVERSION (
  TV_ID int(11) NOT NULL auto_increment,
  TV_VERSION varchar(10) default NULL,
  TV_RELEASEDATE timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (TV_ID),
  UNIQUE KEY TR_INAME (TV_VERSION)
) AUTO_INCREMENT=7;

CREATE TABLE TESTCPU (
  TC_ID int(11) NOT NULL auto_increment,
  TC_NAME varchar(10) default NULL,
  PRIMARY KEY  (TC_ID),
  UNIQUE KEY TC_INAME (TC_NAME)
) AUTO_INCREMENT=10 ;

INSERT INTO TESTCATEGORY VALUES (1, 'Compiler/RTL');
INSERT INTO TESTCATEGORY VALUES (2, 'DB');

INSERT INTO TESTCPU VALUES (1, 'i386');
INSERT INTO TESTCPU VALUES (6, 'arm');
INSERT INTO TESTCPU VALUES (3, 'm68k');
INSERT INTO TESTCPU VALUES (4, 'sparc');
INSERT INTO TESTCPU VALUES (5, 'powerpc');
INSERT INTO TESTCPU VALUES (7, 'x86_64');
INSERT INTO TESTCPU VALUES (8, 'All');
INSERT INTO TESTCPU VALUES (9, 'powerpc64');

INSERT INTO TESTOS VALUES (1, 'linux');
INSERT INTO TESTOS VALUES (2, 'win32');
INSERT INTO TESTOS VALUES (3, 'go32v2');
INSERT INTO TESTOS VALUES (4, 'os2');
INSERT INTO TESTOS VALUES (5, 'freebsd');
INSERT INTO TESTOS VALUES (6, 'netbsd');
INSERT INTO TESTOS VALUES (7, 'openbsd');
INSERT INTO TESTOS VALUES (8, 'amiga');
INSERT INTO TESTOS VALUES (9, 'atari');
INSERT INTO TESTOS VALUES (10, 'qnx');
INSERT INTO TESTOS VALUES (11, 'beos');
INSERT INTO TESTOS VALUES (12, 'solaris');
INSERT INTO TESTOS VALUES (13, 'darwin');
INSERT INTO TESTOS VALUES (14, 'macos');
INSERT INTO TESTOS VALUES (15, 'All');
INSERT INTO TESTOS VALUES (16, 'win64');
INSERT INTO TESTOS VALUES (17, 'wince');

INSERT INTO TESTVERSION VALUES (1, '2.0.4', '2006-08-22 22:38:20');
INSERT INTO TESTVERSION VALUES (2, '2.0.5', '2006-08-22 22:38:20');
INSERT INTO TESTVERSION VALUES (3, '2.3.1', '2007-03-04 23:40:07');
INSERT INTO TESTVERSION VALUES (4, '2.1.2', '2007-03-19 10:49:30');
INSERT INTO TESTVERSION VALUES (5, '2.1.3', '2007-03-19 10:49:47');
INSERT INTO TESTVERSION VALUES (6, '2.1.4', '2007-03-19 10:50:03');

