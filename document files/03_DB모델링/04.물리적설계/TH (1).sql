CREATE TABLE `member` (
	`num`	NUMBER(5)	NOT NULL,
	`id`	VARCHAR2(10)	NOT NULL,
	`mpw`	VARCHAR2(20)	NULL,
	`mname`	VARCHAR2(10)	NULL,
	`nick_name`	VARCHAR2(10)	NULL,
	`memail`	VARCHAR2(20)	NULL,
	`mphone`	NUMBER(11)	NULL,
	`mbirth`	NUMBER(6)	NULL,
	`payment`	NUMBER(1)	NULL
);

CREATE TABLE `place` (
	`num`	NUMBER(5)	NOT NULL,
	`member_num`	VARCHAR2(10)	NOT NULL,
	`pname`	VARCHAR2(10)	NULL,
	`location`	VARCHAR2(100)	NULL,
	`pphone`	NUMBER(11)	NULL
);

CREATE TABLE `room` (
	`num`	NUMBER(3)	NOT NULL,
	`place_num`	NUMBER(5)	NOT NULL,
	`price`	NUMBER(8)	NULL,
	`capacity`	NUMBER(2)	NULL,
	`rinfo`	VARCHAR(100)	NULL
);

CREATE TABLE `reply` (
	`num`	NUMBER(10)	NOT NULL,
	`board_id`	NUMBER(5)	NOT NULL,
	`member_num`	VARCHAR2(10)	NOT NULL,
	`num2`	NUMBER(1)	NOT NULL,
	`reply`	TEXT(100)	NULL,
	`repdate`	DATE	NULL
);

CREATE TABLE `reservation` (
	`num`	NUMBER(10)	NOT NULL,
	`member_num`	NUMBER(5)	NOT NULL,
	`room_num`	NUMBER(3)	NOT NULL,
	`place_num`	NUMBER(5)	NOT NULL,
	`startdate`	DATE	NULL,
	`enddate`	DATE	NULL
);

CREATE TABLE `board` (
	`id`	NUMBER(5)	NOT NULL,
	`memeber_id`	VARCHAR2(10)	NOT NULL,
	`place_num`	NUMBER(5)	NOT NULL,
	`board_type_num`	NUMBER(1)	NOT NULL,
	`btitle`	VARCHAR2(20)	NULL,
	`bcontent`	VARCHAR(100)	NULL,
	`bdate`	DATE	NULL,
	`bgrade`	NUMBER(2)	NULL,
	`bview`	NUMBER(5)	NULL
);

CREATE TABLE `authority` (
	`member_num`	NUMBER(5)	NOT NULL,
	`auth_num`	NUMBER(1)	NOT NULL
);

CREATE TABLE `palce_type` (
	`place_num`	NUMBER(5)	NOT NULL,
	`placetype_num`	NUMBER(1)	NOT NULL
);

CREATE TABLE `board_type` (
	`num`	NUMBER(1)	NOT NULL,
	`btname`	VARCHAR(10)	NULL
);

CREATE TABLE `like` (
	`board_id`	NUMBER(5)	NOT NULL,
	`member_num`	VARCHAR2(10)	NOT NULL,
	`num2`	NUMBER(1)	NOT NULL,
	`ldate`	DATE	NULL
);

CREATE TABLE `search` (
	`member_num`	NUMBER(5)	NOT NULL,
	`place_num`	NUMBER(5)	NOT NULL,
	`sdate`	DATE	NULL
);

CREATE TABLE `image` (
	`num`	NUMBER(5)	NOT NULL,
	`board_id`	NUMBER(5)	NOT NULL,
	`room_num`	NUMBER(3)	NOT NULL,
	`image_type_num`	NUMBER(1)	NOT NULL,
	`iname`	VARCHAR2(100)	NULL,
	`ipath`	VARCHAR2(100)	NULL
);

CREATE TABLE `image_type` (
	`num`	NUMBER(1)	NOT NULL,
	`itname`	VARCHAR(10)	NULL
);

CREATE TABLE `stats` (
	`day_sell`	NUMBER(10)	NULL,
	`week_sell`	NUMBER(10)	NULL,
	`month_sell`	NUMBER(11)	NULL
);

CREATE TABLE `authgroup` (
	`num`	NUMBER(1)	NOT NULL,
	`aname`	VARCHAR2(10)	NULL
);

CREATE TABLE `place_type_group` (
	`num`	NUMBER(1)	NOT NULL,
	`ptname`	VARCHAR2(10)	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`num`,
	`id`
);

ALTER TABLE `place` ADD CONSTRAINT `PK_PLACE` PRIMARY KEY (
	`num`,
	`member_num`
);

ALTER TABLE `room` ADD CONSTRAINT `PK_ROOM` PRIMARY KEY (
	`num`,
	`place_num`
);

ALTER TABLE `reply` ADD CONSTRAINT `PK_REPLY` PRIMARY KEY (
	`num`,
	`board_id`,
	`member_num`,
	`num2`
);

ALTER TABLE `reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`num`,
	`member_num`,
	`room_num`,
	`place_num`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`id`,
	`memeber_id`,
	`place_num`,
	`board_type_num`
);

ALTER TABLE `authority` ADD CONSTRAINT `PK_AUTHORITY` PRIMARY KEY (
	`member_num`,
	`auth_num`
);

ALTER TABLE `palce_type` ADD CONSTRAINT `PK_PALCE_TYPE` PRIMARY KEY (
	`place_num`,
	`placetype_num`
);

ALTER TABLE `board_type` ADD CONSTRAINT `PK_BOARD_TYPE` PRIMARY KEY (
	`num`
);

ALTER TABLE `like` ADD CONSTRAINT `PK_LIKE` PRIMARY KEY (
	`board_id`,
	`member_num`,
	`num2`
);

ALTER TABLE `search` ADD CONSTRAINT `PK_SEARCH` PRIMARY KEY (
	`member_num`,
	`place_num`
);

ALTER TABLE `image` ADD CONSTRAINT `PK_IMAGE` PRIMARY KEY (
	`num`,
	`board_id`,
	`room_num`,
	`image_type_num`
);

ALTER TABLE `image_type` ADD CONSTRAINT `PK_IMAGE_TYPE` PRIMARY KEY (
	`num`
);

ALTER TABLE `authgroup` ADD CONSTRAINT `PK_AUTHGROUP` PRIMARY KEY (
	`num`
);

ALTER TABLE `place_type_group` ADD CONSTRAINT `PK_PLACE_TYPE_GROUP` PRIMARY KEY (
	`num`
);

ALTER TABLE `place` ADD CONSTRAINT `FK_member_TO_place_1` FOREIGN KEY (
	`member_num`
)
REFERENCES `member` (
	`num`
);

ALTER TABLE `room` ADD CONSTRAINT `FK_place_TO_room_1` FOREIGN KEY (
	`place_num`
)
REFERENCES `place` (
	`num`
);

ALTER TABLE `reply` ADD CONSTRAINT `FK_board_TO_reply_1` FOREIGN KEY (
	`board_id`
)
REFERENCES `board` (
	`id`
);

ALTER TABLE `reply` ADD CONSTRAINT `FK_board_TO_reply_2` FOREIGN KEY (
	`num2`
)
REFERENCES `board` (
	`board_type_num`
);

ALTER TABLE `reply` ADD CONSTRAINT `FK_member_TO_reply_1` FOREIGN KEY (
	`member_num`
)
REFERENCES `member` (
	`num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_member_TO_reservation_1` FOREIGN KEY (
	`member_num`
)
REFERENCES `member` (
	`num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_room_TO_reservation_1` FOREIGN KEY (
	`room_num`
)
REFERENCES `room` (
	`num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_room_TO_reservation_2` FOREIGN KEY (
	`place_num`
)
REFERENCES `room` (
	`place_num`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`memeber_id`
)
REFERENCES `member` (
	`num`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_place_TO_board_1` FOREIGN KEY (
	`place_num`
)
REFERENCES `place` (
	`num`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_board_type_TO_board_1` FOREIGN KEY (
	`board_type_num`
)
REFERENCES `board_type` (
	`num`
);

ALTER TABLE `authority` ADD CONSTRAINT `FK_member_TO_authority_1` FOREIGN KEY (
	`member_num`
)
REFERENCES `member` (
	`num`
);

ALTER TABLE `authority` ADD CONSTRAINT `FK_authgroup_TO_authority_1` FOREIGN KEY (
	`auth_num`
)
REFERENCES `authgroup` (
	`num`
);

ALTER TABLE `palce_type` ADD CONSTRAINT `FK_place_TO_palce_type_1` FOREIGN KEY (
	`place_num`
)
REFERENCES `place` (
	`num`
);

ALTER TABLE `palce_type` ADD CONSTRAINT `FK_place_type_group_TO_palce_type_1` FOREIGN KEY (
	`placetype_num`
)
REFERENCES `place_type_group` (
	`num`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_board_TO_like_1` FOREIGN KEY (
	`board_id`
)
REFERENCES `board` (
	`id`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_board_TO_like_2` FOREIGN KEY (
	`num2`
)
REFERENCES `board` (
	`board_type_num`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_member_TO_like_1` FOREIGN KEY (
	`member_num`
)
REFERENCES `member` (
	`num`
);

ALTER TABLE `search` ADD CONSTRAINT `FK_member_TO_search_1` FOREIGN KEY (
	`member_num`
)
REFERENCES `member` (
	`num`
);

ALTER TABLE `search` ADD CONSTRAINT `FK_place_TO_search_1` FOREIGN KEY (
	`place_num`
)
REFERENCES `place` (
	`num`
);

ALTER TABLE `image` ADD CONSTRAINT `FK_board_TO_image_1` FOREIGN KEY (
	`board_id`
)
REFERENCES `board` (
	`id`
);

ALTER TABLE `image` ADD CONSTRAINT `FK_room_TO_image_1` FOREIGN KEY (
	`room_num`
)
REFERENCES `room` (
	`num`
);

ALTER TABLE `image` ADD CONSTRAINT `FK_image_type_TO_image_1` FOREIGN KEY (
	`image_type_num`
)
REFERENCES `image_type` (
	`num`
);

