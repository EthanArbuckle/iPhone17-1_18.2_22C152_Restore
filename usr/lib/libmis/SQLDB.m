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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSem, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (double)totalSizeMB
{
  return self->_totalSizeMB;
}

- (NSURL)dbURL
{
  return self->_url;
}

- (id)lastInsertRowID
{
  v2 = NSNumber;
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);

  return [v2 numberWithLongLong:insert_rowid];
}

- (unint64_t)tableRowCount:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_20DC17CAC;
  v22 = sub_20DC17CBC;
  id v23 = 0;
  v7 = [NSString stringWithFormat:v5, @"SELECT COUNT(*) FROM %@", v6, v4];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_20DC17CC4;
  v17[3] = &unk_264129D88;
  v17[4] = &v18;
  int v12 = [self executeQuery:v8 withBind:v7 withResults:v17];
  if (v12)
  {
    v13 = sub_20DBFFB10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v4;
      __int16 v26 = 1024;
      int v27 = v12;
      _os_log_error_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_ERROR, "Unable to table row count for %@: %d", buf, 0x12u);
    }
  }
  v14 = (void *)v19[5];
  if (v14) {
    unint64_t v15 = [v14 unsignedIntegerValue:v9, v10, v11];
  }
  else {
    unint64_t v15 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v15;
}

- (void)deleteSetting:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_20DC17DC8;
  v7[3] = &unk_264129D60;
  id v8 = v4;
  id v5 = v4;
  [self executeQuery:@"DELETE FROM settings WHERE name = ?1" withBind:v7];
}

- (void)setSetting:(id)a3 toValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_20DC17EE0;
  v11[3] = &unk_264129DB0;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [self executeQuery:@"INSERT OR REPLACE INTO settings (name, value) VALUES (?1, ?2)" withBind:v11];
}

- (id)readSetting:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unint64_t v15 = sub_20DC17CAC;
  v16 = sub_20DC17CBC;
  id v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_20DC180D4;
  v10[3] = &unk_264129D60;
  id v5 = v4;
  id v11 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_20DC18124;
  v9[3] = &unk_264129D88;
  v9[4] = &v12;
  [self executeQuery:@"SELECT value FROM settings WHERE name = ?1" withBind:v10 withResults:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (int)checkpoint
{
  return sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
}

- (int)transaction:(id)a3 immediate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (unsigned int (**)(void))a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_transactionSem, 0xFFFFFFFFFFFFFFFFLL);
  if (v4) {
    int v8 = [self executeQuery:@"begin immediate transaction" withBind:0 withResults:0];
  }
  else {
    int v8 = [self executeQuery:@"begin transaction" withBind:0 withResults:0];
  }
  int v9 = v8;
  if (!v8)
  {
    if (v6[2](v6)
      && !objc_msgSend_executeQuery_withBind_withResults_(self, v10, @"end transaction", 0, 0))
    {
      int v9 = 0;
    }
    else
    {
      int v9 = [self executeQuery:v10 withBind:0 withResults:0];
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_transactionSem);

  return v9;
}

- (int)transaction:(id)a3
{
  return MEMORY[0x270F9A6D0](self, sel_transaction_immediate_, a3, 0);
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, sqlite3_stmt *))a4;
  uint64_t v10 = (uint64_t (**)(id, sqlite3_stmt *, void *))a5;
  ppStmt = 0;
  db = self->_db;
  id v12 = v8;
  v16 = (const char *)[v12 v13:v14 v15];
  int v17 = sqlite3_prepare_v2(db, v16, -1, &ppStmt, 0);
  if (v17)
  {
    int v18 = v17;
    v19 = sub_20DBFFB10();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v63 = sqlite3_errmsg(self->_db);
      int v64 = sqlite3_errcode(self->_db);
      *(_DWORD *)buf = 136315394;
      *(void *)v74 = v63;
      *(_WORD *)&v74[8] = 1024;
      *(_DWORD *)&v74[10] = v64;
      _os_log_error_impl(&dword_20DBFC000, v19, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
    }

    uint64_t v20 = sub_20DBFFB10();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v74 = v18;
      *(_WORD *)&v74[4] = 2112;
      *(void *)&v74[6] = v12;
      _os_log_error_impl(&dword_20DBFC000, v20, OS_LOG_TYPE_ERROR, "Prepare error (%d) on query: %@", buf, 0x12u);
    }
    v21 = (void *)MEMORY[0x263EFFA78];
LABEL_39:
  }
  else
  {
    if (v9) {
      v9[2](v9, ppStmt);
    }
    if (v10 && (v22 = ppStmt, (int v23 = sqlite3_column_count(ppStmt)) != 0))
    {
      int v26 = v23;
      v21 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2 * v23, v25];
      if (v26 >= 1)
      {
        v69 = self;
        id v70 = v12;
        v71 = v9;
        uint64_t v27 = 0;
        do
        {
          uint64_t v28 = sqlite3_column_origin_name(v22, v27);
          v29 = sqlite3_column_name(v22, v27);
          v30 = sqlite3_column_table_name(v22, v27);
          if (v28 && v30)
          {
            v33 = [NSString stringWithUTF8String:v31];
            if (objc_msgSend_hasSuffix_(v33, v34, @"s", v35))
            {
              uint64_t v39 = [v33 v36:v37 length:v38];
              uint64_t v42 = [v33 substringToIndex:v40 - 1];

              v33 = (void *)v42;
            }
            v43 = [NSNumber numberWithInt:v36];
            v46 = [NSString stringWithFormat:@"%@_%s", v45, v33, v28];
            [v21 setObject:v47 forKeyedSubscript:(uint64_t)v43];
          }
          if (v29)
          {
            v48 = [NSNumber numberWithInt:v31];
            v51 = [NSString stringWithUTF8String:v49];
            [v21 setObject:v52 forKeyedSubscript:(uint64_t)v48];
          }
          uint64_t v27 = (v27 + 1);
        }
        while (v26 != v27);
        id v12 = v70;
        int v9 = v71;
        self = v69;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x263EFFA78];
    }
    do
    {
      int v53 = sqlite3_step(ppStmt);
      int v18 = v53;
      if ((v53 - 102) <= 0xFFFFFFFD)
      {
        v56 = sub_20DBFFB10();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v67 = sqlite3_errmsg(self->_db);
          int v68 = sqlite3_errcode(self->_db);
          *(_DWORD *)buf = 136315394;
          *(void *)v74 = v67;
          *(_WORD *)&v74[8] = 1024;
          *(_DWORD *)&v74[10] = v68;
          _os_log_error_impl(&dword_20DBFC000, v56, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
        }

        uint64_t v20 = sub_20DBFFB10();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v74 = v18;
          *(_WORD *)&v74[4] = 2112;
          *(void *)&v74[6] = v12;
          _os_log_error_impl(&dword_20DBFC000, v20, OS_LOG_TYPE_ERROR, "Step error (%d) on query: %@", buf, 0x12u);
        }
        goto LABEL_39;
      }
      BOOL v54 = v53 == 100;
      char v55 = 1;
      if (v10 && v18 == 100)
      {
        char v55 = v10[2](v10, ppStmt, v21);
        BOOL v54 = 1;
      }
    }
    while (v54 && (v55 & 1) != 0);
    if (v54) {
      int v18 = 100;
    }
    if (((!v54 | v55) & 1) == 0)
    {
      uint64_t v20 = sub_20DBFFB10();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v20, OS_LOG_TYPE_ERROR, "Query canceled", buf, 2u);
      }
      int v18 = 4;
      goto LABEL_39;
    }
  }
  int v57 = v18;
  if (ppStmt)
  {
    int v57 = sqlite3_finalize(ppStmt);
    if (v57)
    {
      v58 = sub_20DBFFB10();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v65 = sqlite3_errmsg(self->_db);
        int v66 = sqlite3_errcode(self->_db);
        *(_DWORD *)buf = 136315394;
        *(void *)v74 = v65;
        *(_WORD *)&v74[8] = 1024;
        *(_DWORD *)&v74[10] = v66;
        _os_log_error_impl(&dword_20DBFC000, v58, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
      }

      v59 = sub_20DBFFB10();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v74 = v57;
        *(_WORD *)&v74[4] = 2112;
        *(void *)&v74[6] = v12;
        _os_log_error_impl(&dword_20DBFC000, v59, OS_LOG_TYPE_ERROR, "Finalize error (%d) on query: %@", buf, 0x12u);
      }
    }
  }
  if (v18 == 101) {
    int v60 = v57;
  }
  else {
    int v60 = v18;
  }
  if (v18) {
    int v61 = v60;
  }
  else {
    int v61 = v57;
  }

  return v61;
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_20DC1890C;
  v12[3] = &unk_264129D38;
  id v13 = v8;
  id v9 = v8;
  LODWORD(a4) = [self executeQuery:v10 withBind:a3 withCancellableResults:a4];

  return (int)a4;
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

- (void)setupPermissions
{
  [self->_url a2:v2 v3:v3];
  id v8 = objc_claimAutoreleasedReturnValue();
  id v7 = (const char *)[v8 v4:v5 v6];
  sub_20DC23E6C(v7, 384);
}

- (BOOL)setupSchema
{
  int v2 = [self executeQuery:@"CREATE TABLE IF NOT EXISTS settings(name TEXT, value TEXT, PRIMARY KEY (name))" withBind:0 withResults:0];
  if (v2)
  {
    uint64_t v3 = sub_20DBFFB10();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_20DBFC000, v3, OS_LOG_TYPE_ERROR, "Database failed to initialize.", v5, 2u);
    }
  }
  return v2 == 0;
}

- (NSURL)shmURL
{
  uint64_t v5 = [self->_url URLByDeletingLastPathComponent:a2 withOptions:v2 error:v3];
  id v9 = [[self->_url stringByAppendingPathComponent:v6] stringByAppendingPathComponent:v7];
  id v12 = [NSString stringWithFormat:@"%@-shm", v10, v11, v9];
  uint64_t v15 = [v5 URLByAppendingPathComponent:v13];

  return (NSURL *)v15;
}

- (NSURL)walURL
{
  uint64_t v5 = [self->_url URLByDeletingLastPathComponent:a2 withOptions:v2 error:v3];
  id v9 = [[self->_url stringByAppendingPathComponent:v6] stringByAppendingPathComponent:v7];
  id v12 = [NSString stringWithFormat:@"%@-wal", v11, v9];
  uint64_t v15 = [v5 URLByAppendingPathComponent:v13];

  return (NSURL *)v15;
}

- (SQLDB)initWithDatabaseURL:(id)a3
{
  return (SQLDB *)MEMORY[0x270F9A6D0](self, sel_initWithDatabaseURL_asReadOnly_, a3, 0);
}

- (SQLDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SQLDB;
  uint64_t v8 = [(SQLDB *)&v35 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    transactionSem = v9->_transactionSem;
    v9->_transactionSem = (OS_dispatch_semaphore *)v10;

    if (!v9->_transactionSem) {
      goto LABEL_16;
    }
    url = v9->_url;
    ppDb = 0;
    if (v4) {
      int v16 = 65537;
    }
    else {
      int v16 = 65542;
    }
    [url v12:v13 v14];
    id v17 = objc_claimAutoreleasedReturnValue();
    v21 = (const char *)[v17 v18:v19 v20];
    int v22 = sqlite3_open_v2(v21, &ppDb, v16, 0);

    if (v22)
    {
      int v26 = sub_20DBFFB10();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v38 = v22;
        _os_log_error_impl(&dword_20DBFC000, v26, OS_LOG_TYPE_ERROR, "Error opening DB: %d", buf, 8u);
      }
    }
    db = ppDb;
    v9->_db = ppDb;
    if (!db
      || (!v4
        ? (objc_msgSend_setupPermissions(v9, v23, v24, v25), BOOL v28 = sqlite3_db_readonly(v9->_db, 0) == 1, db = v9->_db)
        : (sqlite3 *)(BOOL v28 = 1),
          (v9->_readonly = v28, sqlite3_busy_timeout(db, 300000), !v9->_readonly)
       && (objc_msgSend_executeQuery_withBind_withResults_(v9, v29, @"PRAGMA journal_mode = WAL", 0, 0), objc_msgSend_executeQuery_withBind_withResults_(v9, v30, @"PRAGMA foreign_keys = ON", 0, 0), (objc_msgSend_setupSchema(v9, v31, v32, v33) & 1) == 0)))
    {
LABEL_16:

      id v9 = 0;
    }
  }

  return v9;
}

- (SQLDB)init
{
  return 0;
}

+ (id)databaseWithURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sub_20DBFFB10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_20DBFC000, v5, OS_LOG_TYPE_DEFAULT, "DB being loaded from %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = objc_alloc((Class)a1);
  id v9 = [v6 initWithDatabaseURL:v7];

  return v9;
}

@end