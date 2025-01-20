@interface NNMKSQLiteConnection
+ (BOOL)errorCodeMeansCorruptedDatabase:(int)a3;
- (BOOL)_openDatabaseWithPath:(id)a3 errorCode:(int *)a4;
- (BOOL)beginTransaction;
- (BOOL)commitTransaction;
- (BOOL)isInTransaction;
- (BOOL)rollbackTransaction;
- (BOOL)tableExists:(id)a3 inDatabase:(id)a4;
- (NNMKSQLiteConnection)initWithPath:(id)a3 errorCode:(int *)a4;
- (NSMutableDictionary)cachedPreparedStatementsBySQLPattern;
- (NSString)databasePath;
- (OS_dispatch_queue)dbQueue;
- (id)_lastErrorMessage;
- (id)lastErrorMessage;
- (int)_executeSQL:(id)a3;
- (int)_lastErrorCode;
- (int)_runRetryingIfNeeded:(id)a3;
- (int)_stepPreparedStatement:(sqlite3_stmt *)a3;
- (int)executeSQL:(id)a3;
- (int)lastErrorCode;
- (int)stepPreparedStatement:(sqlite3_stmt *)a3;
- (sqlite3)db;
- (sqlite3_stmt)_preparedStatementForPattern:(id)a3 cacheStatement:(BOOL)a4;
- (sqlite3_stmt)preparedStatementForPattern:(id)a3;
- (sqlite3_stmt)preparedStatementForPattern:(id)a3 cacheStatement:(BOOL)a4;
- (void)_closeDatabase;
- (void)_lastErrorCode;
- (void)_lastErrorMessage;
- (void)dealloc;
- (void)setCachedPreparedStatementsBySQLPattern:(id)a3;
- (void)setDatabasePath:(id)a3;
- (void)setDb:(sqlite3 *)a3;
- (void)setDbQueue:(id)a3;
- (void)setIsInTransaction:(BOOL)a3;
@end

@implementation NNMKSQLiteConnection

- (NNMKSQLiteConnection)initWithPath:(id)a3 errorCode:(int *)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NNMKSQLiteConnection;
  v8 = [(NNMKSQLiteConnection *)&v20 init];
  v9 = v8;
  if (v8)
  {
    v8->_isInTransaction = 0;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanomail.dbQueue", 0);
    dbQueue = v9->_dbQueue;
    v9->_dbQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_databasePath, a3);
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    cachedPreparedStatementsBySQLPattern = v9->_cachedPreparedStatementsBySQLPattern;
    v9->_cachedPreparedStatementsBySQLPattern = (NSMutableDictionary *)v12;

    v14 = v9->_dbQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__NNMKSQLiteConnection_initWithPath_errorCode___block_invoke;
    block[3] = &unk_264E9A488;
    v17 = v9;
    id v18 = v7;
    v19 = a4;
    dispatch_sync(v14, block);
  }
  return v9;
}

uint64_t __47__NNMKSQLiteConnection_initWithPath_errorCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openDatabaseWithPath:*(void *)(a1 + 40) errorCode:*(void *)(a1 + 48)];
}

- (void)dealloc
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__NNMKSQLiteConnection_dealloc__block_invoke;
  block[3] = &unk_264E99F20;
  void block[4] = self;
  dispatch_sync(dbQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)NNMKSQLiteConnection;
  [(NNMKSQLiteConnection *)&v4 dealloc];
}

uint64_t __31__NNMKSQLiteConnection_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabase];
}

- (sqlite3_stmt)preparedStatementForPattern:(id)a3
{
  return [(NNMKSQLiteConnection *)self preparedStatementForPattern:a3 cacheStatement:1];
}

- (sqlite3_stmt)preparedStatementForPattern:(id)a3 cacheStatement:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  dbQueue = self->_dbQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__NNMKSQLiteConnection_preparedStatementForPattern_cacheStatement___block_invoke;
  v11[3] = &unk_264E9A4B0;
  id v12 = v6;
  v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(dbQueue, v11);
  v9 = (sqlite3_stmt *)v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __67__NNMKSQLiteConnection_preparedStatementForPattern_cacheStatement___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _preparedStatementForPattern:*(void *)(a1 + 40) cacheStatement:*(unsigned __int8 *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)stepPreparedStatement:(sqlite3_stmt *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NNMKSQLiteConnection_stepPreparedStatement___block_invoke;
  block[3] = &unk_264E9A4D8;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dbQueue, block);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__NNMKSQLiteConnection_stepPreparedStatement___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _stepPreparedStatement:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)executeSQL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__NNMKSQLiteConnection_executeSQL___block_invoke;
  block[3] = &unk_264E9A500;
  id v9 = v4;
  int v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  LODWORD(dbQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)dbQueue;
}

uint64_t __35__NNMKSQLiteConnection_executeSQL___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _executeSQL:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)beginTransaction
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__NNMKSQLiteConnection_beginTransaction__block_invoke;
  v5[3] = &unk_264E9A528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __40__NNMKSQLiteConnection_beginTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) _preparedStatementForPattern:@"begin exclusive transaction" cacheStatement:1];
  int v3 = [*(id *)v1 _stepPreparedStatement:v2];
  sqlite3_reset(v2);
  *(unsigned char *)(*(void *)(*(void *)(v1 + 8) + 8) + 24) = v3 == 101;
  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 8) + 8) + 24))
  {
    *(unsigned char *)(*(void *)v1 + 8) = 1;
  }
  else
  {
    id v4 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __40__NNMKSQLiteConnection_beginTransaction__block_invoke_cold_1((void **)v1, v4);
    }
  }
}

- (BOOL)commitTransaction
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__NNMKSQLiteConnection_commitTransaction__block_invoke;
  v5[3] = &unk_264E9A528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__NNMKSQLiteConnection_commitTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) _preparedStatementForPattern:@"commit transaction" cacheStatement:1];
  int v3 = [*(id *)v1 _stepPreparedStatement:v2];
  sqlite3_reset(v2);
  *(unsigned char *)(*(void *)(*(void *)(v1 + 8) + 8) + 24) = v3 == 101;
  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 8) + 8) + 24))
  {
    *(unsigned char *)(*(void *)v1 + 8) = 0;
  }
  else
  {
    id v4 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __41__NNMKSQLiteConnection_commitTransaction__block_invoke_cold_1((void **)v1, v4);
    }
  }
}

- (BOOL)rollbackTransaction
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke;
  v5[3] = &unk_264E9A528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) _preparedStatementForPattern:@"rollback transaction" cacheStatement:1];
  int v3 = [*(id *)v1 _stepPreparedStatement:v2];
  sqlite3_reset(v2);
  *(unsigned char *)(*(void *)(*(void *)(v1 + 8) + 8) + 24) = v3 == 101;
  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 8) + 8) + 24))
  {
    *(unsigned char *)(*(void *)v1 + 8) = 0;
  }
  else
  {
    id v4 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke_cold_1((void **)v1, v4);
    }
  }
}

- (int)lastErrorCode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__NNMKSQLiteConnection_lastErrorCode__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__NNMKSQLiteConnection_lastErrorCode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _lastErrorCode];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)lastErrorMessage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__0;
  int v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__NNMKSQLiteConnection_lastErrorMessage__block_invoke;
  v5[3] = &unk_264E9A550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__NNMKSQLiteConnection_lastErrorMessage__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _lastErrorMessage];
  return MEMORY[0x270F9A758]();
}

- (BOOL)tableExists:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dbQueue = self->_dbQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__NNMKSQLiteConnection_tableExists_inDatabase___block_invoke;
  v12[3] = &unk_264E9A578;
  id v13 = v7;
  int v14 = self;
  id v15 = v6;
  v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(dbQueue, v12);
  LOBYTE(v6) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

void __47__NNMKSQLiteConnection_tableExists_inDatabase___block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = [v3 stringByAppendingString:@"."];
    [v2 stringWithFormat:@"select [sql] from %@sqlite_master where [type] = 'table' and lower(name) = ?", v4];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [NSString stringWithFormat:@"select [sql] from %@sqlite_master where [type] = 'table' and lower(name) = ?", &stru_26F11E918];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = (sqlite3_stmt *)[*(id *)(a1 + 40) _preparedStatementForPattern:v7 cacheStatement:1];
  id v6 = [*(id *)(a1 + 48) lowercaseString];
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, 0);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) _stepPreparedStatement:v5] == 100;
  sqlite3_reset(v5);
}

+ (BOOL)errorCodeMeansCorruptedDatabase:(int)a3
{
  return (a3 < 0x1B) & (0x4806D08u >> a3);
}

- (BOOL)_openDatabaseWithPath:(id)a3 errorCode:(int *)a4
{
  *(void *)&v27[13] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 stringByDeletingLastPathComponent];
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 fileExistsAtPath:v7];

  if ((v9 & 1) == 0)
  {
    id v10 = [MEMORY[0x263F08850] defaultManager];
    id v23 = 0;
    char v11 = [v10 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v12 = v23;

    if ((v11 & 1) == 0)
    {
      uint64_t v17 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
        -[NNMKSQLiteConnection _openDatabaseWithPath:errorCode:](v7, (uint64_t)v12, v17);
      }
      BOOL v16 = 0;
      goto LABEL_20;
    }
  }
  id v12 = [NSString stringWithFormat:@"file:%@", v6];
  int v13 = sqlite3_open_v2((const char *)[v12 UTF8String], &self->_db, 4194310, 0);
  if (v13) {
    goto LABEL_10;
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__NNMKSQLiteConnection__openDatabaseWithPath_errorCode___block_invoke;
  v22[3] = &unk_264E9A5A0;
  v22[4] = self;
  int v13 = [(NNMKSQLiteConnection *)self _runRetryingIfNeeded:v22];
  if (v13
    || (int v13 = [(NNMKSQLiteConnection *)self _executeSQL:@"PRAGMA page_size = 4096;"]) != 0
    || (int v13 = [(NNMKSQLiteConnection *)self _executeSQL:@"PRAGMA auto_vacuum = 1;"]) != 0
    || (int v13 = [(NNMKSQLiteConnection *)self _executeSQL:@"PRAGMA cache_size = 100;"]) != 0
    || (int v13 = [(NNMKSQLiteConnection *)self _executeSQL:@"PRAGMA journal_mode = WAL;"]) != 0)
  {
LABEL_10:
    int v14 = (void *)qword_26AC21850;
    BOOL v15 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_FAULT);
    if (v13 == 14)
    {
      if (v15) {
        -[NNMKSQLiteConnection _openDatabaseWithPath:errorCode:]((uint64_t)v6, v14, self);
      }
    }
    else if (v15)
    {
      uint64_t v19 = v14;
      char v20 = [(NNMKSQLiteConnection *)self _lastErrorMessage];
      *(_DWORD *)buf = 138543874;
      id v25 = v6;
      __int16 v26 = 1024;
      *(_DWORD *)v27 = v13;
      v27[2] = 2114;
      *(void *)&v27[3] = v20;
      _os_log_fault_impl(&dword_23D3DF000, v19, OS_LOG_TYPE_FAULT, "Error opening database (Path: %{public}@, Error Code: %d, Error Message: %{public}@). Closing... and retrying", buf, 0x1Cu);
    }
    [(NNMKSQLiteConnection *)self _closeDatabase];
    BOOL v16 = 0;
    if (a4) {
      goto LABEL_16;
    }
  }
  else
  {
    v21 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v6;
      __int16 v26 = 2114;
      *(void *)v27 = self;
      _os_log_impl(&dword_23D3DF000, v21, OS_LOG_TYPE_DEFAULT, "Database opened (%{public}@, %{public}@).", buf, 0x16u);
    }
    BOOL v16 = 1;
    if (a4)
    {
      int v13 = 0;
LABEL_16:
      *a4 = v13;
    }
  }
LABEL_20:

  return v16;
}

uint64_t __56__NNMKSQLiteConnection__openDatabaseWithPath_errorCode___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result = sqlite3_busy_timeout(*(sqlite3 **)(*(void *)(a1 + 32) + 16), 0x7FFFFFFF);
  *a2 = result;
  return result;
}

- (void)_closeDatabase
{
  if (a1)
  {
    char v9 = 0;
  }
  else
  {
    char v9 = [NSString stringWithUTF8String:a2];
  }
  OUTLINED_FUNCTION_0(&dword_23D3DF000, a2, a3, "Error closing database. File no longer exists. (Path: %{public}@).", a5, a6, a7, a8, 2u);
  if ((a1 & 1) == 0) {
}
  }

uint64_t __38__NNMKSQLiteConnection__closeDatabase__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result = sqlite3_close_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16));
  *a2 = result;
  return result;
}

- (sqlite3_stmt)_preparedStatementForPattern:(id)a3 cacheStatement:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_db)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v7 = [(NSMutableDictionary *)self->_cachedPreparedStatementsBySQLPattern objectForKey:v6];
    uint64_t v8 = [v7 pointerValue];

    uint64_t v21 = v8;
    char v9 = (sqlite3_stmt *)v19[3];
    if (v9)
    {
LABEL_13:
      _Block_object_dispose(&v18, 8);
      goto LABEL_14;
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__NNMKSQLiteConnection__preparedStatementForPattern_cacheStatement___block_invoke;
    v15[3] = &unk_264E9A5C8;
    v15[4] = self;
    id v10 = v6;
    id v16 = v10;
    uint64_t v17 = &v18;
    if ([(NNMKSQLiteConnection *)self _runRetryingIfNeeded:v15])
    {
      sqlite3_finalize((sqlite3_stmt *)v19[3]);
      v19[3] = 0;
      char v11 = (id)qword_26AC21850;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [(NNMKSQLiteConnection *)self _lastErrorMessage];
        [(NNMKSQLiteConnection *)(uint64_t)v10 _preparedStatementForPattern:buf cacheStatement:v11];
      }
    }
    else
    {
      if (!v4)
      {
LABEL_12:

        char v9 = (sqlite3_stmt *)v19[3];
        goto LABEL_13;
      }
      cachedPreparedStatementsBySQLPattern = self->_cachedPreparedStatementsBySQLPattern;
      char v11 = [MEMORY[0x263F08D40] valueWithPointer:v19[3]];
      [(NSMutableDictionary *)cachedPreparedStatementsBySQLPattern setObject:v11 forKey:v10];
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
    -[NNMKSQLiteConnection _preparedStatementForPattern:cacheStatement:]();
  }
  char v9 = 0;
LABEL_14:

  return v9;
}

uint64_t __68__NNMKSQLiteConnection__preparedStatementForPattern_cacheStatement___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), (const char *)[*(id *)(a1 + 40) UTF8String], -1, (sqlite3_stmt **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0);
  *a2 = result;
  return result;
}

- (int)_stepPreparedStatement:(sqlite3_stmt *)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NNMKSQLiteConnection__stepPreparedStatement___block_invoke;
  v4[3] = &__block_descriptor_40_e9_v16__0_i8l;
  v4[4] = a3;
  return [(NNMKSQLiteConnection *)self _runRetryingIfNeeded:v4];
}

uint64_t __47__NNMKSQLiteConnection__stepPreparedStatement___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a1 + 32));
  *a2 = result;
  return result;
}

- (int)_executeSQL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_db)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__NNMKSQLiteConnection__executeSQL___block_invoke;
    v16[3] = &unk_264E9A610;
    v16[4] = self;
    id v17 = v4;
    int v6 = [(NNMKSQLiteConnection *)self _runRetryingIfNeeded:v16];
  }
  else
  {
    id v7 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSQLiteConnection _executeSQL:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    int v6 = 1;
  }

  return v6;
}

uint64_t __36__NNMKSQLiteConnection__executeSQL___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result = sqlite3_exec(*(sqlite3 **)(*(void *)(a1 + 32) + 16), (const char *)[*(id *)(a1 + 40) UTF8String], 0, 0, 0);
  *a2 = result;
  return result;
}

- (int)_lastErrorCode
{
  db = self->_db;
  if (db)
  {
    return sqlite3_errcode(db);
  }
  else
  {
    id v4 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKSQLiteConnection *)v4 _lastErrorCode];
    }
    return 1;
  }
}

- (id)_lastErrorMessage
{
  db = self->_db;
  if (db)
  {
    id v3 = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
  }
  else
  {
    id v4 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKSQLiteConnection *)v4 _lastErrorMessage];
    }
    id v3 = 0;
  }
  return v3;
}

- (int)_runRetryingIfNeeded:(id)a3
{
  id v3 = (void (**)(id, _DWORD *))a3;
  int v14 = 0;
  v3[2](v3, &v14);
  int v4 = v14;
  if ((v14 - 5) <= 2)
  {
    unsigned int v5 = 0;
    useconds_t v6 = 20;
    do
    {
      uint64_t v7 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_DEFAULT, "Database busy/locked for running statement or Low memory condition. Will re-try...", buf, 2u);
      }
      usleep(v6);
      if (v14 == 7 && v5 >= 8)
      {
        uint64_t v9 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
          [(NNMKSQLiteConnection *)&v11 _runRetryingIfNeeded:v9];
        }
      }
      v6 *= 5;
      v3[2](v3, &v14);
      int v4 = v14;
      ++v5;
    }
    while ((v14 - 5) < 3);
  }

  return v4;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (BOOL)isInTransaction
{
  return self->_isInTransaction;
}

- (void)setIsInTransaction:(BOOL)a3
{
  self->_isInTransaction = a3;
}

- (OS_dispatch_queue)dbQueue
{
  return self->_dbQueue;
}

- (void)setDbQueue:(id)a3
{
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
}

- (NSMutableDictionary)cachedPreparedStatementsBySQLPattern
{
  return self->_cachedPreparedStatementsBySQLPattern;
}

- (void)setCachedPreparedStatementsBySQLPattern:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPreparedStatementsBySQLPattern, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_dbQueue, 0);
}

void __40__NNMKSQLiteConnection_beginTransaction__block_invoke_cold_1(void **a1, void *a2)
{
  v2 = *a1;
  id v3 = a2;
  int v4 = [v2 _lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v5, v6, "Failed to begin transaction. (%{public}@)", v7, v8, v9, v10, v11);
}

void __41__NNMKSQLiteConnection_commitTransaction__block_invoke_cold_1(void **a1, void *a2)
{
  v2 = *a1;
  id v3 = a2;
  int v4 = [v2 _lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v5, v6, "Failed to commit transaction. (%{public}@)", v7, v8, v9, v10, v11);
}

void __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke_cold_1(void **a1, void *a2)
{
  v2 = *a1;
  id v3 = a2;
  int v4 = [v2 _lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v5, v6, "Failed to rollback transaction. (%{public}@)", v7, v8, v9, v10, v11);
}

- (void)_openDatabaseWithPath:(void *)a3 errorCode:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = [a3 _lastErrorMessage];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = 14;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  _os_log_fault_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_FAULT, "Error opening database. Check sandbox permissions. Closing... (Path: %{public}@, Error Code: %d, Error Message: %{public}@).", (uint8_t *)&v7, 0x1Cu);
}

- (void)_openDatabaseWithPath:(void *)a3 errorCode:.cold.2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263F08850];
  uint64_t v6 = a3;
  int v7 = [v5 defaultManager];
  uint64_t v8 = [a1 stringByDeletingLastPathComponent];
  int v9 = 138543874;
  int v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  __int16 v13 = 1024;
  int v14 = [v7 fileExistsAtPath:v8] ^ 1;
  _os_log_error_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_ERROR, "Error creating database directory. (Path: %{public}@, Error: %{public}@, Parent Exists: %d)", (uint8_t *)&v9, 0x1Cu);
}

- (void)_preparedStatementForPattern:cacheStatement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_ERROR, "Error preparing statement - db doesn't seem to be open (pattern: %{public}@).", v1, 0xCu);
}

- (void)_preparedStatementForPattern:(uint8_t *)buf cacheStatement:(os_log_t)log .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Error preparing statement for pattern: %{public}@. (%{public}@)", buf, 0x16u);
}

- (void)_executeSQL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_lastErrorCode
{
}

- (void)_lastErrorMessage
{
}

- (void)_runRetryingIfNeeded:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Tried to execute database operation multiple times and received NOMEM. Crashing intentionally so we the process can restart and memory can be freed up...", buf, 2u);
}

@end