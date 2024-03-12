CREATE DATABASE adushevamaria_test_db;



CREATE TABLE t_pay_doc_ref (
    pay_doc_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE t_point_of_sales_ref (
    pos_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE t_payments (
    payment_id SERIAL PRIMARY KEY,
    summ DECIMAL,
    pay_date TIMESTAMP,
    pay_doc_id INT REFERENCES t_pay_doc_ref NULL,
    pos_id INT REFERENCES t_point_of_sales_ref NULL
);



INSERT INTO t_pay_doc_ref (name) VALUES 
    ('Безналичные'),
    ('Наличные');


INSERT INTO t_point_of_sales_ref (name) VALUES 
    ('Пункт1'),
    ('Пункт2'),
    ('Пункт3');

INSERT INTO t_payments (summ, pay_date, pay_doc_id, pos_id) VALUES 
    (10000.00, '2024-01-01 12:00:00', 2, 1),
    (1500.50, '2024-01-01 13:00:00', 1, 2),
		(100000.00, '2024-01-01 14:00:00', 2, 1),
    (15.50, '2024-01-01 17:00:00', 1, 1),
    (20000.75, '2024-01-02 10:20:00', 1, 1),
    (30.25, '2024-01-02 11:30:00', 1, 1),
    (2500.00, '2024-01-02 09:22:00', 2, 1),
		(100000.00, '2024-01-02 12:12:00', 2, 1),
    (200000.50, '2024-01-02 13:03:00', 1, 1),
    (21000.75, '2024-01-02 10:09:00', 1, 1),
    (37000.25, '2024-01-02 11:50:00', 1, 1),
    (500.00, '2024-01-02 09:30:00', 2, 1),
    (20000.75, '2024-01-02 10:00:00', 1, 3),
    (30000.25, '2024-01-02 11:00:00', 1, 1),
		(12000.00, '2024-01-02 12:00:00', 1),
    (1300.50, '2024-01-02 13:00:00', 2),
		(1400.00, '2024-01-03 14:00:00', 1),
    (2500.00, '2024-01-03 09:00:00', 2, 2),
		(1000.00, '2024-01-03 12:00:00', 2, 1),
    (3500.50, '2024-01-04 13:00:00', 1, 2),
    (21000.75, '2024-01-05 10:00:00', 1, 3),
    (37000.25, '2024-01-05 11:00:00', 1, 1),
    (500.00, '2024-01-06 09:00:00', 2, 2);
