import pymysql

CONFIG = {
    'host': 'localhost',
    'port': 3306,
    'user': 'dev_user',
    'password': 'QyzDev@2026',
    'database': 'ai_dev',
    'charset': 'utf8mb4',
    'cursorclass': pymysql.cursors.DictCursor,
}


def main() -> None:
    connection = pymysql.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT id, name, role_name, created_at FROM demo_users ORDER BY id")
            rows = cursor.fetchall()
            print('Connected to MySQL successfully.')
            print(f'Rows in demo_users: {len(rows)}')
            for row in rows:
                print(row)
    finally:
        connection.close()


if __name__ == '__main__':
    main()
