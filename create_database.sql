DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix(
    show_id       VARCHAR(5),
    type          VARCHAR(10),
    title         VARCHAR(1050),
    director      VARCHAR(1050),
    "cast"         VARCHAR(1050),
    country       VARCHAR(1050),
    date_added    VARCHAR(55),
    release_year  INT,
    rating        VARCHAR(15),
    duration      VARCHAR(15),
    listed_in     VARCHAR(550),
    description   VARCHAR(1050)
);

SELECT * FROM netflix;

SELECT COUNT(*) FROM netflix;

Select Distinct type from netflix;


Select Distinct director from netflix;



