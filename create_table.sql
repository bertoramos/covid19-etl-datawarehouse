DELETE FROM Quarter_Time;
DELETE FROM Week_Time;
DELETE FROM Time;
DELETE FROM Region;
DELETE FROM Cases;

DROP TABLE IF EXISTS Quarter_Time;
DROP TABLE IF EXISTS Week_Time;
DROP TABLE IF EXISTS Time;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Cases;

CREATE TABLE Quarter_Time(
  "date" TEXT NOT NULL,
  "year" int NOT NULL,
  "quarter" int NOT NULL,
  "month" int NOT NULL,
  "day" int NOT NULL,
  PRIMARY KEY("date")
);

CREATE TABLE Week_Time(
  "date" TEXT NOT NULL,
  "year" int NOT NULL,
  "week" int NOT NULL,
  "day_week" int NOT NULL,
  PRIMARY KEY("date")
);

CREATE TABLE Time(
  "date" DATE NOT NULL,
  "workday" BOOLEAN,
  "fk_qt" DATE,
  "fk_wt" DATE,
  PRIMARY KEY("date"),
  FOREIGN KEY ("fk_qt") REFERENCES Quarter_Time("date"),
  FOREIGN KEY ("fk_wt") REFERENCES Week_Time("date")
);

CREATE TABLE Region(
  "country_code" varchar(255) NOT NULL,
  "region" int,
  "subregion" int,
  "country" int,
  PRIMARY KEY("country_code")
);

CREATE TABLE Cases(
  "id" int NOT NULL,
  "cases" int,
  "deaths" int,
  "cases100k" real,
  "deaths100k" real,
  "fk_time" DATE,
  "fk_region" varchar(255),
  PRIMARY KEY("id"),
  FOREIGN KEY ("fk_time") REFERENCES Time("date"),
  FOREIGN KEY ("fk_region") REFERENCES Region("country_code")
);
