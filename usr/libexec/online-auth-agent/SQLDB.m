@interface SQLDB
+ (id)databaseWithURL:(id)a3;
- (BOOL)setupSchema;
- (NSURL)dbURL;
- (NSURL)shmURL;
- (NSURL)walURL;
- (SQLDB)init;
- (SQLDB)initWithDatabaseURL:(id)a3;
- (SQLDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4;
- (double)totalSizeMB;
- (id)lastInsertRowID;
- (id)readSetting:(id)a3;
- (int)checkpoint;
- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5;
- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5;
- (int)transaction:(id)a3;
- (int)transaction:(id)a3 immediate:(BOOL)a4;
- (unint64_t)tableRowCount:(id)a3;
- (void)dealloc;
- (void)deleteSetting:(id)a3;
- (void)setSetting:(id)a3 toValue:(id)a4;
- (void)setupPermissions;
@end

@implementation SQLDB

- (SQLDB)init
{
  return 0;
}

- (SQLDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SQLDB;
  v8 = [(SQLDB *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    transactionSem = v9->_transactionSem;
    v9->_transactionSem = (OS_dispatch_semaphore *)v10;

    if (!v9->_transactionSem) {
      goto LABEL_9;
    }
    db = sub_100005B18(v9->_url, v4);
    v9->_db = db;
    if (!db) {
      goto LABEL_9;
    }
    if (v4)
    {
      BOOL v13 = 1;
    }
    else
    {
      [(SQLDB *)v9 setupPermissions];
      BOOL v13 = sub_100005BB0(v9->_db, 0);
      db = v9->_db;
    }
    v9->_readonly = v13;
    sqlite3_busy_timeout(db, 300000);
    if (!v9->_readonly)
    {
      [(SQLDB *)v9 executeQuery:@"PRAGMA journal_mode = WAL" withBind:0 withResults:0];
      [(SQLDB *)v9 executeQuery:@"PRAGMA foreign_keys = ON" withBind:0 withResults:0];
      if (![(SQLDB *)v9 setupSchema])
      {
LABEL_9:

        v9 = 0;
      }
    }
  }

  return v9;
}

- (SQLDB)initWithDatabaseURL:(id)a3
{
  return [(SQLDB *)self initWithDatabaseURL:a3 asReadOnly:0];
}

+ (id)databaseWithURL:(id)a3
{
  id v4 = a3;
  v5 = sub_100009D24();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DB being loaded from %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [objc_alloc((Class)a1) initWithDatabaseURL:v4];

  return v6;
}

- (NSURL)walURL
{
  v3 = [(NSURL *)self->_url URLByDeletingLastPathComponent];
  id v4 = [(NSURL *)self->_url lastPathComponent];
  v5 = +[NSString stringWithFormat:@"%@-wal", v4];
  id v6 = [v3 URLByAppendingPathComponent:v5];

  return (NSURL *)v6;
}

- (NSURL)shmURL
{
  v3 = [(NSURL *)self->_url URLByDeletingLastPathComponent];
  id v4 = [(NSURL *)self->_url lastPathComponent];
  v5 = +[NSString stringWithFormat:@"%@-shm", v4];
  id v6 = [v3 URLByAppendingPathComponent:v5];

  return (NSURL *)v6;
}

- (BOOL)setupSchema
{
  unsigned int v2 = [(SQLDB *)self executeQuery:@"CREATE TABLE IF NOT EXISTS settings(name TEXT, value TEXT, PRIMARY KEY (name))" withBind:0 withResults:0];
  if (v2)
  {
    v3 = sub_100009D24();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003CF54(v3);
    }
  }
  return v2 == 0;
}

- (void)setupPermissions
{
  id v2 = [(NSURL *)self->_url path];
  sub_100005BD0((const char *)[v2 UTF8String]);
}

- (void)dealloc
{
  db = self->_db;
  if (db) {
    sqlite3_close(db);
  }
  v4.receiver = self;
  v4.super_class = (Class)SQLDB;
  [(SQLDB *)&v4 dealloc];
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004D70;
  v10[3] = &unk_1000517C0;
  id v11 = a5;
  id v8 = v11;
  LODWORD(a4) = [(SQLDB *)self executeQuery:a3 withBind:a4 withCancellableResults:v10];

  return (int)a4;
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, sqlite3_stmt *))a4;
  dispatch_semaphore_t v10 = (uint64_t (**)(id, sqlite3_stmt *, void *))a5;
  ppStmt = 0;
  db = self->_db;
  p_db = &self->_db;
  id v13 = v8;
  int v14 = sqlite3_prepare_v2(db, (const char *)[v13 UTF8String], -1, &ppStmt, 0);
  if (v14)
  {
    int v15 = v14;
    v16 = sub_100009D24();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003D000(p_db);
    }

    v17 = sub_100009D24();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003D0D8();
    }
    v18 = &__NSDictionary0__struct;
LABEL_39:
  }
  else
  {
    if (v9) {
      v9[2](v9, ppStmt);
    }
    if (v10 && (v19 = ppStmt, (int v20 = sqlite3_column_count(ppStmt)) != 0))
    {
      int v21 = v20;
      v18 = +[NSMutableDictionary dictionaryWithCapacity:2 * v20];
      if (v21 >= 1)
      {
        id v43 = v13;
        v44 = v9;
        uint64_t v22 = 0;
        do
        {
          v23 = sqlite3_column_origin_name(v19, v22);
          v24 = sqlite3_column_name(v19, v22);
          v25 = sqlite3_column_table_name(v19, v22);
          if (v23 && v25)
          {
            v26 = +[NSString stringWithUTF8String:v25];
            if ([v26 hasSuffix:@"s"])
            {
              uint64_t v27 = [v26 substringToIndex:([v26 length] - 1)];

              v26 = (void *)v27;
            }
            v28 = +[NSNumber numberWithInt:v22];
            v29 = +[NSString stringWithFormat:@"%@_%s", v26, v23];
            [v18 setObject:v28 forKeyedSubscript:v29];
          }
          if (v24)
          {
            v30 = +[NSNumber numberWithInt:v22];
            v31 = +[NSString stringWithUTF8String:v24];
            [v18 setObject:v30 forKeyedSubscript:v31];
          }
          uint64_t v22 = (v22 + 1);
        }
        while (v21 != v22);
        id v13 = v43;
        id v9 = v44;
      }
    }
    else
    {
      v18 = &__NSDictionary0__struct;
    }
    do
    {
      int v32 = sqlite3_step(ppStmt);
      int v15 = v32;
      if ((v32 - 102) <= 0xFFFFFFFD)
      {
        v35 = sub_100009D24();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v41 = sqlite3_errmsg(*p_db);
          int v42 = sqlite3_errcode(*p_db);
          *(_DWORD *)buf = 136315394;
          *(void *)v47 = v41;
          *(_WORD *)&v47[8] = 1024;
          *(_DWORD *)&v47[10] = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
        }

        v17 = sub_100009D24();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v47 = v15;
          *(_WORD *)&v47[4] = 2112;
          *(void *)&v47[6] = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Step error (%d) on query: %@", buf, 0x12u);
        }
        goto LABEL_39;
      }
      BOOL v33 = v32 == 100;
      char v34 = 1;
      if (v10 && v15 == 100)
      {
        char v34 = v10[2](v10, ppStmt, v18);
        BOOL v33 = 1;
      }
    }
    while (v33 && (v34 & 1) != 0);
    if (v33) {
      int v15 = 100;
    }
    if (((!v33 | v34) & 1) == 0)
    {
      v17 = sub_100009D24();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003D094(v17);
      }
      int v15 = 4;
      goto LABEL_39;
    }
  }
  int v36 = v15;
  if (ppStmt)
  {
    int v36 = sqlite3_finalize(ppStmt);
    if (v36)
    {
      v37 = sub_100009D24();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10003D000(p_db);
      }

      v38 = sub_100009D24();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10003CF98();
      }
    }
  }
  if (v15 == 101) {
    int v39 = v36;
  }
  else {
    int v39 = v15;
  }
  if (v15) {
    int v36 = v39;
  }

  return v36;
}

- (int)transaction:(id)a3
{
  return [(SQLDB *)self transaction:a3 immediate:0];
}

- (int)transaction:(id)a3 immediate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (unsigned int (**)(void))a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_transactionSem, 0xFFFFFFFFFFFFFFFFLL);
  if (v4) {
    CFStringRef v7 = @"begin immediate transaction";
  }
  else {
    CFStringRef v7 = @"begin transaction";
  }
  int v8 = [(SQLDB *)self executeQuery:v7 withBind:0 withResults:0];
  if (!v8)
  {
    if (v6[2](v6)
      && ![(SQLDB *)self executeQuery:@"end transaction" withBind:0 withResults:0])
    {
      int v8 = 0;
    }
    else
    {
      int v8 = [(SQLDB *)self executeQuery:@"rollback transaction" withBind:0 withResults:0];
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_transactionSem);

  return v8;
}

- (int)checkpoint
{
  return sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
}

- (id)readSetting:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1000054D8;
  int v14 = sub_1000054E8;
  id v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000054F0;
  v8[3] = &unk_1000517E8;
  id v4 = a3;
  id v9 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005540;
  v7[3] = &unk_100051810;
  v7[4] = &v10;
  [(SQLDB *)self executeQuery:@"SELECT value FROM settings WHERE name = ?1" withBind:v8 withResults:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)setSetting:(id)a3 toValue:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005658;
  v8[3] = &unk_100051838;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(SQLDB *)self executeQuery:@"INSERT OR REPLACE INTO settings (name, value) VALUES (?1, ?2)" withBind:v8 withResults:0];
}

- (void)deleteSetting:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005770;
  v5[3] = &unk_1000517E8;
  id v6 = a3;
  id v4 = v6;
  [(SQLDB *)self executeQuery:@"DELETE FROM settings WHERE name = ?1" withBind:v5 withResults:0];
}

- (unint64_t)tableRowCount:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000054D8;
  v16 = sub_1000054E8;
  id v17 = 0;
  id v5 = +[NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", v4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005940;
  v11[3] = &unk_100051810;
  v11[4] = &v12;
  uint64_t v6 = [(SQLDB *)self executeQuery:v5 withBind:0 withResults:v11];
  if (v6)
  {
    id v7 = sub_100009D24();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003D140((uint64_t)v4, v6, v7);
    }
  }
  int v8 = (void *)v13[5];
  if (v8) {
    id v9 = [v8 unsignedIntegerValue];
  }
  else {
    id v9 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return (unint64_t)v9;
}

- (id)lastInsertRowID
{
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);

  return +[NSNumber numberWithLongLong:insert_rowid];
}

- (NSURL)dbURL
{
  return self->_url;
}

- (double)totalSizeMB
{
  return self->_totalSizeMB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSem, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end