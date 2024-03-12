SELECT DISTINCT
    p.pay_date::date AS "pay_date",
    SUM(p.summ) OVER (PARTITION BY p.pay_date::date, p.pay_doc_id, p.pos_id) AS "summ",
    CASE
        WHEN pd.name IS NULL THEN 'Вид ПД не найден'
        ELSE pd.name
    END AS "pay_doc",
    pos.name AS "pos_name"
FROM
    t_payments AS p
LEFT JOIN
    t_pay_doc_ref AS pd ON p.pay_doc_id = pd.pay_doc_id
LEFT JOIN
    t_point_of_sales_ref AS pos ON p.pos_id = pos.pos_id
WHERE
    p.pay_date BETWEEN '2024-01-02' AND '2024-01-06'
ORDER BY
    p.pay_date::date;
