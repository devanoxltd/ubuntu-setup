# Ubuntu Setup
This repository contains a script to set up a new Ubuntu system with the necessary packages and configurations.

## Method 1
You can run them in the terminal like this:

```bash
curl -o- https://raw.githubusercontent.com/devanoxltd/ubuntu-setup/main/install_lamp_ubuntu.sh | bash
```
## Method 2
You can clone the repository and run the script manually:

```bash
git clone https://github.com/devanoxltd/ubuntu-setup.git
cd ubuntu-setup
chmod +x install_lamp_ubuntu.sh
./install_lamp_ubuntu.sh
```

## Method 3
You can also download the script directly and run it:

```bash
wget https://raw.githubusercontent.com/devanoxltd/ubuntu-setup/main/install_lamp_ubuntu.sh
chmod +x install_lamp_ubuntu.sh
./install_lamp_ubuntu.sh
```

### Change or SET mysql Password

```bash
sudo mysql -uroot
```

After running above command your will see mysql prompt

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
FLUSH PRIVILEGES;
```
or

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'yourpasswd';
FLUSH PRIVILEGES;
```

for no password

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
FLUSH PRIVILEGES;
```

new user
```sql
CREATE USER 'devanox'@'localhost' IDENTIFIED WITH caching_sha2_password BY '***';GRANT ALL PRIVILEGES ON *.* TO 'devanox'@'localhost' WITH GRANT OPTION;ALTER USER 'devanox'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;GRANT ALL PRIVILEGES ON `devanox\_%`.* TO 'devanox'@'localhost';
```

Exit from mysql prompt

```sql
exit
```

Now TEST logging by

```bash
mysql -uroot -p
```
## Note
- The script is designed for Ubuntu systems and may not work on other distributions.
- Make sure to review the script before running it to understand what changes will be made to your system.
- This script is intended for personal use and may not be suitable for production environments without further modifications.
- Always back up your important data before running scripts that modify system configurations.
- The script may require superuser privileges to install certain packages and make system changes.
