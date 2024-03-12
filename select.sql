SELECT gr.pay_date,
			gr.summ,
			CASE
        WHEN pd.name IS NULL THEN 'Вид ПД не найден'
        ELSE pd.name
    END AS "pay_doc",
		pos.name

FROM (SELECT
    p.pay_date ::date AS "pay_date",
    SUM(p.summ) AS "summ",
		p.pos_id,
		p.pay_doc_id
FROM
    t_payments AS p

WHERE
    p.pay_date BETWEEN '2024-01-02' AND '2024-01-06'
GROUP BY
     p.pay_date ::date , p.pay_doc_id, p.pos_id
	) as gr
		
LEFT JOIN
    t_pay_doc_ref AS pd ON gr.pay_doc_id = pd.pay_doc_id
LEFT JOIN
    t_point_of_sales_ref AS pos ON gr.pos_id = pos.pos_id
		ORDER BY gr.pay_date;
