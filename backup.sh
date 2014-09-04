    #!/bin/sh   
      
    USER="username"  
    PASSWD="password"  
      
    URL="https://www.midominio.com/cpanel"  
    PATH_FILE_COOKIE=cookie_midominio  
    BACKUP_DB="getsqlbackup"  
    DIR_BACKUP_DB=/var/backups  
      
    SCHEMA_DB="schema.sql.gz"  
      
    BACKUP_FILE="$BACKUP_DB/$SCHEMA_DB"  
      
    echo "stating $URL backup"  
      
    echo "Log in in Cpanel"  
    wget "$URL/login" --post-data "user=$USER&pass=$PASSWD" --no-check-certificate --keep-session-cookies --save-cookies $PATH_FILE_COOKIE -S -O /dev/null  
      
    echo "downloading sql file: $BACKUP_FILE"  
      
    wget "$URL/$BACKUP_FILE" --no-check-certificate --keep-session-cookies --load-cookies $PATH_FILE_COOKIE=  
      
    cp $SCHEMA_DB $DIR_BACKUP_DB  
      
    rm $PATH_FILE_COOKIE  
      
    echo "done"  
