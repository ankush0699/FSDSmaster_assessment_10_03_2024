CREATE DATABASE SQL_ASSESSMENT100320244;

USE SQL_ASSESSMENT100320244;

CREATE TABLE runners (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO runners (id, name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Bobby Louis'),
(5, 'Lisa Romero');

CREATE TABLE races (
    id INT PRIMARY KEY,
    event VARCHAR(255) NOT NULL,
    winner_id INT,
    FOREIGN KEY (winner_id) REFERENCES runners(id)
);

INSERT INTO races (id, event, winner_id) VALUES
(1, '100 meter dash', 2),
(2, '500 meter dash', 3),
(3, 'cross-country', 2),
(4, 'triathlon', NULL);

SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races);
-- Explanation: The result comprises runners who have not emerged victorious in any races, implying that their identification numbers are absent from the winner_id column in the races table.



-- ALTERNATE VERSION OF CODE
SELECT r1.*
FROM runners r1
LEFT JOIN races r2 ON r1.id = r2.winner_id
WHERE r2.winner_id IS NULL;

