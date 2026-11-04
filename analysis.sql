#CREATE VIEW `Students.SsSsfinal_task_sss` AS -- створення VIEW


WITH FIRSTT AS (
   SELECT                       -- email-метрики
     DATE_ADD(ses.date, INTERVAL sen.sent_date DAY) AS date,
     par.country,
     acc.send_interval,
     acc.is_verified,
     acc.is_unsubscribed,
     0 AS account_cnt,
     COUNT(DISTINCT sen.id_message) AS sent_msg,
     COUNT(DISTINCT ope.id_message) AS open_msg,
     COUNT(DISTINCT vis.id_message) AS visit_msg
   FROM `DA.account` acc
   JOIN `DA.email_sent` sen ON acc.id = sen.id_account
   LEFT JOIN `DA.email_open` ope ON sen.id_message = ope.id_message
   LEFT JOIN `DA.email_visit` vis ON sen.id_message = vis.id_message
   JOIN `DA.account_session` acs ON acc.id = acs.account_id
   JOIN `DA.session` ses ON acs.ga_session_id = ses.ga_session_id
   JOIN `DA.session_params` par ON ses.ga_session_id = par.ga_session_id
   GROUP BY date, par.country, acc.send_interval, acc.is_verified, acc.is_unsubscribed
UNION ALL
   SELECT                       -- account-метрики
     ses.date,
     par.country,
     acc.send_interval,
     acc.is_verified,
     acc.is_unsubscribed,
     COUNT(DISTINCT acc.id) AS account_cnt,
     0 AS sent_msg,
     0 AS open_msg,
     0 AS visit_msg
   FROM `DA.account` acc
   JOIN `DA.account_session` acs ON acc.id = acs.account_id
   JOIN `DA.session` ses ON acs.ga_session_id = ses.ga_session_id
   JOIN `DA.session_params` par ON ses.ga_session_id = par.ga_session_id
   GROUP BY ses.date, par.country, acc.send_interval, acc.is_verified, acc.is_unsubscribed
),


FINAL_FIRSTT AS (              -- фінальна агрегація після UNION
   SELECT
     date,
     country,
     send_interval,
     is_verified,
     is_unsubscribed,
     SUM(account_cnt) AS account_cnt,
     SUM(sent_msg) AS sent_msg,
     SUM(open_msg) AS open_msg,
     SUM(visit_msg) AS visit_msg
   FROM FIRSTT
   GROUP BY date, country, send_interval, is_verified, is_unsubscribed
),


SECOND AS (                    -- тотали по країнах
   SELECT *,
     SUM(account_cnt) OVER (PARTITION BY country) AS total_country_account_cnt,
     SUM(sent_msg) OVER (PARTITION BY country) AS total_country_sent_cnt
   FROM FINAL_FIRSTT
),


THIRD AS (                     -- ранки по тоталам
   SELECT *,
     DENSE_RANK() OVER (ORDER BY total_country_account_cnt DESC) AS rank_total_country_account_cnt,
     DENSE_RANK() OVER (ORDER BY total_country_sent_cnt DESC) AS rank_total_country_sent_cnt
   FROM SECOND
)


     SELECT                    -- фінальний запит :)
       date,
       country,
       send_interval,
       is_verified,
       is_unsubscribed,
       account_cnt,
       sent_msg,
       open_msg,
       visit_msg,
       total_country_account_cnt,
       total_country_sent_cnt,
       rank_total_country_account_cnt,
       rank_total_country_sent_cnt
     FROM THIRD
     WHERE rank_total_country_account_cnt <= 10 OR rank_total_country_sent_cnt <= 10
     ORDER BY date, country
