import sqlite3


connection = sqlite3.connect('lesson2.db')


cursor = connection.cursor()


cursor.execute("CREATE TABLE sales (id INT, order_date DATE, count_product INT)")


cursor.execute("INSERT INTO sales VALUES (1, '2023-01-01', 100)")


cursor.execute("SELECT * FROM sales")
rows = cursor.fetchall()
for row in rows:
    print(row)


cursor.execute("UPDATE sales SET count_product = 200 WHERE id = 1")


cursor.execute("DELETE FROM sales WHERE id = 1")


connection.close()
