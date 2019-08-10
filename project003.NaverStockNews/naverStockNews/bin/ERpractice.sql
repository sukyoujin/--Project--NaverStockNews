
/* Drop Triggers */

DROP TRIGGER TRI_nownews_id;
DROP TRIGGER TRI_now_news_id;



/* Drop Tables */

DROP TABLE news_user CASCADE CONSTRAINTS;
DROP TABLE now_news CASCADE CONSTRAINTS;
DROP TABLE stock CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_nownews_id;
DROP SEQUENCE SEQ_now_news_id;




/* Create Sequences */

CREATE SEQUENCE SEQ_nownews_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_now_news_id INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE news_user
(
	user_id varchar2(20) NOT NULL,
	pw number(10) NOT NULL,
	stock_name varchar2(30),
	user_name varchar2(20) NOT NULL,
	phone_no number(10) NOT NULL,
	PRIMARY KEY (user_id)
);


CREATE TABLE now_news
(
	id number(5) NOT NULL,
	news_title varchar2(300) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE stock
(
	stock_name varchar2(30) NOT NULL,
	price number(7,0) NOT NULL,
	net number(6) NOT NULL,
	updown number(4,2) NOT NULL,
	marketcap number(7,0) NOT NULL,
	PRIMARY KEY (stock_name)
);



/* Create Foreign Keys */

ALTER TABLE news_user
	ADD FOREIGN KEY (stock_name)
	REFERENCES stock (stock_name)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_nownews_id BEFORE INSERT ON nownews
FOR EACH ROW
BEGIN
	SELECT SEQ_nownews_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_now_news_id BEFORE INSERT ON now_news
FOR EACH ROW
BEGIN
	SELECT SEQ_now_news_id.nextval
	INTO :new.id
	FROM dual;
END;

/

insert into stock values('삼성전자',25000,2000,10.23,2432342);
insert into news_user values('yyy2410',241023,'삼성전자','조영욱',01074793691);
insert into now_news (news_title) values ('삼성전자가 반도체 산업의 불황에 대비하여 앞서나가고 있는것이 밝혀져 그뒤에 어떻게할것인지 매우중요하다고 볼수있다');





