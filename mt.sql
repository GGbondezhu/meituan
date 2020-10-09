/* 设置客户端连接服务器的编码 */
SET NAMES UTF8;
/* 丢弃指定的数据库，如果存在 */
DROP DATABASE IF EXISTS mt;
/* 创建数据库，设置储存数据的编码 */
CREATE DATABASE mt CHARSET=UTF8;
/* 进入数据库 */
USE mt;
/* 创建保存数据的表 */
CREATE TABLE user(
	uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	birthday VARCHAR(8),
	phone VARCHAR(16) NOT NULL UNIQUE,
	avatar VARCHAR(128),
	user_name VARCHAR(32),
	gender INT
	PRIMARY KEY  (uid)
);
/* 插入数据 */
INSERT INTO user VALUES('1','dangdang','123456','1997-1-2','13991400593','img/avatar/default.png','当当','1');
INSERT INTO user VALUES('2','dingding','223456','1998-10-12','13991400593','img/avatar/default.png','叮叮喵','0');
INSERT INTO user VALUES('3','doudou','456789','1999-12-28','13991400593','img/avatar/default.png','窦志强','1');
INSERT INTO user VALUES('4','yaya','123456','1996-8-2','13501234560','img/avatar/default.png','秦小雅','0');
INSERT INTO user VALUES('5','siyongbo','123456','1997-1-2','13991400593','img/avatar/default.png','依依','0');
INSERT INTO user VALUES('6','海贼王','439910','1995-3-17','13991500953','img/avatar/default.png','路飞','1');

/* 创建用户地址列表 */
CREATE TABLE mt_receiver_address(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	receiver VARCHAR(16),
	province VARCHAR(16),
	city VARCHAR(16),
	county VARCHAR(16),
	address VARCHAR(128),
	cellphone VARCHAR(16),
	tag VARCHAR(16),
	is_default BOOLEAN,
	PRIMARY KEY  (aid)
	FOREIGN KEY(user_id) REFERENCES user(uid)
);
/* 插入数据 */
INSERT INTO mt_receiver_address VALUES('1','1','当当','陕西省','西安市','雁塔区','丈八北路太华小区1单元1204','13991400593','01','1');
INSERT INTO mt_receiver_address VALUES('2','1','当当','陕西省','西安市','雁塔区','丈八北路太华小区1单元1204','13991400593','02','0');
INSERT INTO mt_receiver_address VALUES('3','1','当当','陕西省','西安市','雁塔区','丈八北路太华小区1单元1204','13991400593','03','0');
INSERT INTO mt_receiver_address VALUES('4','3','窦志强','陕西省','西安市','雁塔区','丈八北路太华小区2单元2208','13991400593','01','1');
INSERT INTO mt_receiver_address VALUES('5','4','秦小雅','陕西省','西安市','雁塔区','丈八北路太华小区1单元1204','13501234560','01','1');
INSERT INTO mt_receiver_address VALUES('6','6','路飞','陕西省','西安市','雁塔区','丈八北路太华小区8单元1606','13991500953','01','1');

/* 创建用户订单表 */
CREATE TABLE mt_order(
	oid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	address_id INT,
	status INT,   #订单状态,1-等待付款,2-等待发货,3-运输中,4-已签收,5-已取消 
	order_time BIGINT,
	pay_time BIGINT,
	deliver_time BIGINT,
	received_time BIGINT,
	count INT,
	PRIMARY KEY  (oid)
	FOREIGN KEY(user_id) REFERENCES user(uid)
	FOREIGN KEY(address_id) REFERENCES mt_receiver_address(aid)
);
/* 插入数据 */
INSERT INTO mt_order VALUES('1','1','1','2','11:00','11:12','11:25','12:33','1');
INSERT INTO mt_order VALUES('2','3','4','3','11:00','11:12','11:25','12:33','1');
INSERT INTO mt_order VALUES('3','4','5','2','11:00','11:12','11:25','12:23','1');
INSERT INTO mt_order VALUES('4','6','6','4','10:34','10:42','10:58','12:03','1');

/* 创建用户订单详情表 */
CREATE TABLE mt_order_detail(
	did INT PRIMARY KEY AUTO_INCREMENT,
	order_id INT,
	product_id INT,
	count INT,
	PRIMARY KEY  (did)
	FOREIGN KEY(order_id) REFERENCES mt_order(oid)
);
/* 插入数据 */
INSERT INTO mt_order_detail VALUES('1','1','22','1');
INSERT INTO mt_order_detail VALUES('2','2','10','1');
INSERT INTO mt_order_detail VALUES('3','3','25','1');
INSERT INTO mt_order_detail VALUES('4','4','36','1');

/* 创建首页轮播图表 */
CREATE TABLE mt_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	href VARCHAR(128)
	PRIMARY KEY  (cid)
);
/* 插入数据 */
INSERT INTO mt_index_carousel VALUES('1','img/index/banner1.png', '轮播广告1', 'product_details.html?lid=28');
INSERT INTO mt_index_carousel VALUES('2','img/index/banner2.png', '轮播广告2', 'product_details.html?lid=19');
INSERT INTO mt_index_carousel VALUES('3','img/index/banner3.png', '轮播广告3', 'lookforward.html');
INSERT INTO mt_index_carousel VALUES('4','img/index/banner4.png', '轮播广告4', 'lookforward.html');