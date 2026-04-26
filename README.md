# Library Practice Database

This is a small MySQL practice database created while learning the basics of SQL.

The project includes table creation, data insertion, primary keys, foreign keys, auto-increment fields, different data types, and basic SQL operations such as `SELECT`, `UPDATE`, `DELETE`, and `ORDER BY`.

## Database Name

```sql
library_practice
```

## Tables

This database contains three tables:

- `members`
- `books`
- `loan`

---

## 1. Members Table

The `members` table stores information about library members.

| member_id | fname | lname  | gender | birth_date | email            | city   | join_date           | is_active |
|----------:|-------|--------|--------|------------|------------------|--------|---------------------|----------:|
| 1 | Sara | Ahmadi | F | 1998-04-10 | sara@example.com | Pavia  | 2026-04-26 18:53:57 | 1 |
| 2 | Ali  | Rezaei | M | 1995-11-21 | ali@example.com  | Rome   | 2026-04-26 18:55:45 | 1 |
| 3 | Mina | Karimi | F | 2000-01-05 | mina@example.com | Tehran | 2026-04-26 18:56:40 | 1 |

---

## 2. Books Table

The `books` table stores information about books in the library.

| book_id | title                   | author          | genre   | publish_year | price | created_at          |
|--------:|-------------------------|-----------------|---------|-------------:|------:|---------------------|
| 1 | Learning SQL            | Alan Beaulieu   | Science | 2020 | 35.90 | 2026-04-26 19:06:02 |
| 2 | Clean Code              | Robert Martin   | Science | 2008 | 45.50 | 2026-04-26 19:07:11 |
| 3 | A Brief History of Time | Stephen Hawking | Science | 1988 | 30.00 | 2026-04-26 19:08:03 |
| 4 | The Name of the Rose    | Umberto Eco     | Novel   | 1980 | 22.75 | 2026-04-26 19:08:53 |

---

## 3. Loan Table

The `loan` table stores information about borrowed books.

| loan_id | member_id | book_id | loan_date  | due_date   | return_date | status   |
|--------:|----------:|--------:|------------|------------|-------------|----------|
| 1 | 1 | 1 | 2026-04-01 | 2026-04-15 | NULL       | Open     |
| 2 | 1 | 2 | 2026-04-05 | 2026-04-20 | 2026-04-12 | Returned |
| 3 | 2 | 3 | 2026-04-10 | 2026-04-24 | NULL       | Returned |

---

## Concepts Practiced

This project was created to practice the following SQL concepts:

- Creating a database
- Creating tables
- Choosing appropriate data types
- Using `VARCHAR`, `ENUM`, `DATE`, `YEAR`, `DECIMAL`, `TIMESTAMP`, and boolean-style values
- Defining primary keys
- Defining foreign keys
- Using `AUTO_INCREMENT`
- Inserting data with `INSERT`
- Reading data with `SELECT`
- Filtering rows with `WHERE`
- Sorting results with `ORDER BY`
- Updating rows with `UPDATE`
- Deleting rows with `DELETE`
- Viewing table structure with `DESC`
- Viewing tables with `SHOW TABLES`

---

## Table Relationships

The database has the following relationships:

```text
members.member_id  →  loan.member_id
books.book_id      →  loan.book_id
```

This means:

- One member can borrow many books.
- One book can appear in many loan records.
- The `loan` table connects members and books.

---

## Files in This Repository

- `schema.sql` contains the database table structures.
- `data.sql` contains the inserted sample data.
- `queries.sql` contains practice SQL queries.
- `README.md` explains the project.
