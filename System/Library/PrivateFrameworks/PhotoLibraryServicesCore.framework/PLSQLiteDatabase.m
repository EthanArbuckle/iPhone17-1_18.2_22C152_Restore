@interface PLSQLiteDatabase
+ (id)openDatabaseAtPath:(id)a3 capabilities:(id)a4;
+ (int)dataProtectionOpenFlagForCapabilities:(id)a3;
+ (int)dataProtectionOpenFlagForPath:(id)a3;
+ (int)setLockProxyFileForDatabase:(sqlite3 *)a3 lockFilePath:(id)a4;
+ (sqlite3)_openSQLiteDatabaseAtPath:(const char *)a3 capabilities:(id)a4;
- (BOOL)_execute:(id)a3;
- (BOOL)beginDeferredTransaction;
- (BOOL)beginExclusiveTransaction;
- (BOOL)close;
- (BOOL)commitTransaction;
- (BOOL)prepareAndEvaluateStatement:(id)a3;
- (BOOL)prepareStatement:(id)a3 andStepThroughResultsWithBlock:(id)a4;
- (BOOL)rollbackTransaction;
- (PLSQLiteDatabase)initWithOpenedSQLite3Database:(sqlite3 *)a3;
- (sqlite3_stmt)_prepareStatement:(id)a3;
@end

@implementation PLSQLiteDatabase

- (BOOL)_execute:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  errmsg = 0;
  int v5 = sqlite3_exec(self->_database, (const char *)[v4 UTF8String], 0, 0, &errmsg);
  if (v5)
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v10 = v4;
      __int16 v11 = 2080;
      v12 = errmsg;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEFAULT, "Failed to execute \"%@\": %s (%d)", buf, 0x1Cu);
    }
  }
  return v5 == 0;
}

- (sqlite3_stmt)_prepareStatement:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (const char *)[v4 UTF8String];
  int v6 = strlen(v5);
  ppStmt = 0;
  int v7 = sqlite3_prepare_v2(self->_database, v5, v6 + 1, &ppStmt, 0);
  if (v7)
  {
    int v8 = v7;
    v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = sqlite3_errmsg(self->_database);
      *(_DWORD *)buf = 138412802;
      id v15 = v4;
      __int16 v16 = 2080;
      v17 = v10;
      __int16 v18 = 1024;
      int v19 = v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "Failed to prepare \"%@\": %s (%d)", buf, 0x1Cu);
    }
  }
  __int16 v11 = ppStmt;

  return v11;
}

- (BOOL)prepareStatement:(id)a3 andStepThroughResultsWithBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = (void (**)(id, sqlite3_stmt *, char *))a4;
  int v7 = [(PLSQLiteDatabase *)self _prepareStatement:a3];
  if (v7)
  {
    int v8 = v7;
    char v15 = 0;
    while (1)
    {
      int v9 = sqlite3_step(v8);
      if (v9 != 100) {
        break;
      }
      v6[2](v6, v8, &v15);
      if (v15)
      {
        BOOL v10 = 1;
        goto LABEL_12;
      }
    }
    int v11 = v9;
    if (v9 == 101)
    {
      BOOL v10 = 1;
      char v15 = 1;
    }
    else
    {
      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 136315394;
        v17 = v13;
        __int16 v18 = 1024;
        int v19 = v11;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_DEFAULT, "Failed to step statement: %s (%d)", buf, 0x12u);
      }

      BOOL v10 = 0;
      char v15 = 1;
    }
LABEL_12:
    sqlite3_finalize(v8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)prepareAndEvaluateStatement:(id)a3
{
  return [(PLSQLiteDatabase *)self prepareStatement:a3 andStepThroughResultsWithBlock:&__block_literal_global_748];
}

void __48__PLSQLiteDatabase_prepareAndEvaluateStatement___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)rollbackTransaction
{
  return [(PLSQLiteDatabase *)self _execute:@"ROLLBACK"];
}

- (BOOL)commitTransaction
{
  return [(PLSQLiteDatabase *)self _execute:@"COMMIT"];
}

- (BOOL)beginExclusiveTransaction
{
  return [(PLSQLiteDatabase *)self _execute:@"BEGIN EXCLUSIVE TRANSACTION"];
}

- (BOOL)beginDeferredTransaction
{
  return [(PLSQLiteDatabase *)self _execute:@"BEGIN DEFERRED TRANSACTION"];
}

- (BOOL)close
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = sqlite3_close(self->_database);
  if (v2)
  {
    v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      int v6 = sqlite3_errstr(v2);
      __int16 v7 = 1024;
      int v8 = v2;
      _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_DEFAULT, "Failed to close database: %s (%d).", (uint8_t *)&v5, 0x12u);
    }
  }
  return v2 == 0;
}

- (PLSQLiteDatabase)initWithOpenedSQLite3Database:(sqlite3 *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLSQLiteDatabase;
  id v4 = [(PLSQLiteDatabase *)&v8 init];
  int v5 = v4;
  if (v4)
  {
    v4->_database = a3;
    int v6 = v4;
  }

  return v5;
}

+ (sqlite3)_openSQLiteDatabaseAtPath:(const char *)a3 capabilities:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLSQLiteDatabase.m", 68, @"Invalid parameter not satisfying: %@", @"path != NULL" object file lineNumber description];
  }
  ppDb = 0;
  int v8 = sqlite3_open_v2(a3, &ppDb, +[PLSQLiteDatabase dataProtectionOpenFlagForCapabilities:v7] | 2, 0);
  if (v8)
  {
    int v9 = v8;
    BOOL v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v9;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "Failed to open DB - %d", buf, 8u);
    }

    BOOL v11 = 1;
  }
  else
  {
    errmsg = 0;
    int v12 = sqlite3_exec(ppDb, "PRAGMA journal_mode = WAL", 0, 0, &errmsg);
    if (v12)
    {
      __int16 v13 = PLBackendGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v20 = v12;
        __int16 v21 = 2080;
        v22 = errmsg;
        _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_DEFAULT, "Failed to enable WAL - %d %s", buf, 0x12u);
      }
    }
    BOOL v11 = v12 != 0;
  }
  int v14 = ppDb;
  if (v11 && ppDb)
  {
    sqlite3_close(ppDb);
    int v14 = 0;
  }

  return v14;
}

+ (id)openDatabaseAtPath:(id)a3 capabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "_openSQLiteDatabaseAtPath:capabilities:", objc_msgSend(v6, "UTF8String"), v7);

  if (v8) {
    int v9 = [[PLSQLiteDatabase alloc] initWithOpenedSQLite3Database:v8];
  }
  else {
    int v9 = 0;
  }
  return v9;
}

+ (int)setLockProxyFileForDatabase:(sqlite3 *)a3 lockFilePath:(id)a4
{
  *(void *)&v14[5] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = sqlite3_mprintf("PRAGMA lock_proxy_file = %Q", [v5 fileSystemRepresentation]);
  if (v6)
  {
    id v7 = v6;
    errmsg = 0;
    int v8 = sqlite3_exec(a3, v6, 0, 0, &errmsg);
    if (v8)
    {
      int v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        v14[0] = v8;
        LOWORD(v14[1]) = 2080;
        *(void *)((char *)&v14[1] + 2) = errmsg;
        _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Failed to set lock_proxy_file - %d %s", buf, 0x12u);
      }

      sqlite3_free(errmsg);
      errmsg = 0;
    }
    sqlite3_free(v7);
  }
  else
  {
    BOOL v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)int v14 = v5;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Failed to set lock_proxy_file (statement parse error) for path: %@", buf, 0xCu);
    }

    int v8 = 1;
  }

  return v8;
}

+ (int)dataProtectionOpenFlagForCapabilities:(id)a3
{
  if ([a3 supportsDataProtection]) {
    return 3145728;
  }
  else {
    return 0;
  }
}

+ (int)dataProtectionOpenFlagForPath:(id)a3
{
  v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  id v4 = +[PLFileSystemCapabilities capabilitiesWithURL:v3];

  LODWORD(v3) = +[PLSQLiteDatabase dataProtectionOpenFlagForCapabilities:v4];
  return (int)v3;
}

@end