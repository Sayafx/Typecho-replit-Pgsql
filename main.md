```bash

createdb -h 127.0.0.1
psql -h 127.0.0.1
create user admin with password 'admin';
ALTER DATABASE typecho OWNER TO admin;
GRANT ALL PRIVILEGES ON DATABASE typecho to admin;

```
