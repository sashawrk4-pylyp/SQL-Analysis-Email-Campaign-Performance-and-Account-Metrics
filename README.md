# SQL Analysis: Email Campaign Performance and Account Metrics

## Project Overview
This project focuses on analyzing email campaign performance and account activity using SQL in Google BigQuery.
The analysis explores account creation, email delivery, opens, link visits, and user segmentation across different countries and account characteristics.

## Objectives
- Analyze account distribution across countries.
- Evaluate email campaign activity.
- Compare the number of sent, opened, and visited messages.
- Examine user segments based on verification and subscription status.
- Analyze email sending intervals.
- Identify geographical and behavioral patterns.

## Dataset
The analysis uses data from the following tables:
- `account` — account information and user attributes.
- `session` — session dates and activity.
- `session_params` — geographical information.
- `email_sent` — email sending activity.
The dataset covers the period from November 1, 2020, to February 25, 2021.

## Tools & Technologies
- Google BigQuery
- SQL
- Common Table Expressions (CTEs)
- JOINs
- UNION ALL
- Window Functions (`SUM() OVER`, `DENSE_RANK()`)
- Aggregations (`COUNT`, `SUM`)

## Analysis Process
The analysis included:
1. Combining data from multiple tables using JOINs.
2. Aggregating account and email activity metrics.
3. Segmenting users by country, sending interval, verification status, and unsubscribe status.
4. Calculating country-level totals.
5. Ranking countries based on account and email activity.

## Key Findings
- The United States ranked first in both total accounts (12,384) and sent messages (233,503).
- India and Canada ranked second and third, respectively, in both metrics.
- The three leading countries accounted for approximately 80% of all sent messages.
- The aggregate ratio of email opens to sent messages was 35.51%.
- The aggregate ratio of link visits to sent messages was 3.91%.
- Verified accounts represented 71.58% of all accounts.
- December 2020 recorded the highest number of sent messages.

## Project Files
- [analysis.sql](analysis.sql) — SQL queries used in the analysis.
- [conclusions.md](conclusions.md) — Detailed findings, insights, recommendations, and data limitations.

## Conclusions
The analysis revealed geographical differences in account distribution and email campaign activity. The United States was the largest market, while most accounts had verified status and a one-day email sending interval.
The findings provide a basis for further investigation of email engagement across countries and user segments.




# SQL-аналіз: Ефективність Еmail-Кампаній та Показники Облікових Записів

## Опис проєкту
Цей проєкт присвячений аналізу ефективності email-кампаній та активності облікових записів користувачів за допомогою SQL у Google BigQuery.
Аналіз охоплює створення облікових записів, доставку електронних листів, їх відкриття, переходи за посиланнями, а також сегментацію користувачів за країнами та характеристиками облікових записів.

## Мета проєкту
- Проаналізувати розподіл облікових записів за країнами.
- Оцінити активність email-кампаній.
- Порівняти кількість надісланих, відкритих листів і переходів за посиланнями.
- Дослідити сегменти користувачів за статусом верифікації та відписки.
- Проаналізувати інтервали між надсиланням електронних листів.
- Виявити географічні та поведінкові закономірності.

## Набір даних
Для аналізу використано дані з таких таблиць:
- `account` — інформація про облікові записи та характеристики користувачів.
- `session` — дати сесій та активність користувачів.
- `session_params` — географічна інформація.
- `email_sent` — дані про надсилання електронних листів.
Набір даних охоплює період з 1 листопада 2020 року до 25 лютого 2021 року.

## Інструменти та технології
- Google BigQuery
- SQL
- Common Table Expressions (CTEs) — загальні табличні вирази.
- JOINs — об'єднання таблиць.
- UNION ALL — об'єднання результатів запитів.
- Window Functions (`SUM() OVER`, `DENSE_RANK()`) — віконні функції.
- Aggregations (`COUNT`, `SUM`) — агрегатні функції.

## Процес аналізу
Аналіз включав такі етапи:
1. Об'єднання даних із декількох таблиць за допомогою JOIN.
2. Розрахунок агрегованих показників активності облікових записів та email-кампаній.
3. Сегментація користувачів за країною, інтервалом надсилання листів, статусом верифікації та статусом відписки.
4. Розрахунок загальних показників на рівні країн.
5. Ранжування країн за кількістю облікових записів та активністю email-кампаній.

## Основні результати
- Сполучені Штати посіли перше місце за загальною кількістю облікових записів (12 384) та надісланих листів (233 503).
- Індія та Канада посіли друге й третє місця відповідно за обома показниками.
- На три провідні країни припадало приблизно 80% усіх надісланих листів.
- Сукупне співвідношення кількості відкриттів листів до кількості надісланих листів становило 35,51%.
- Сукупне співвідношення кількості переходів за посиланнями до кількості надісланих листів становило 3,91%.
- Верифіковані облікові записи становили 71,58% від загальної кількості.
- Найбільшу кількість листів було надіслано у грудні 2020 року.

## Файли проєкту
- [analysis.sql](analysis.sql) — SQL-запити, використані для проведення аналізу.
- [conclusions.md](conclusions.md) — детальні результати, аналітичні висновки, рекомендації та обмеження набору даних.

## Висновки
Аналіз виявив географічні відмінності в розподілі облікових записів та активності email-кампаній. Сполучені Штати виявилися найбільшим ринком, тоді як більшість облікових записів мали статус верифікованих, а найпоширенішим інтервалом надсилання електронних листів був один день.
Отримані результати створюють основу для подальшого дослідження залученості користувачів до email-кампаній у розрізі країн та окремих сегментів.
