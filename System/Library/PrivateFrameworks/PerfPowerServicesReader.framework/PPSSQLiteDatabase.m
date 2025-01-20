@interface PPSSQLiteDatabase
+ (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 error:(id *)a5;
- (BOOL)_prepareStatementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)executeSQL:(id)a3 error:(id *)a4;
- (BOOL)executeSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7;
- (BOOL)tableWithName:(id)a3 containsColumnWithName:(id)a4;
- (NSURL)databaseURL;
- (PPSSQLiteDatabase)initWithDatabaseURL:(id)a3;
- (id)columnNamesForTable:(id)a3;
- (id)tableNames;
- (id)typeForColumn:(id)a3 inTable:(id)a4 error:(id *)a5;
- (int)openForReadingWithError:(id *)a3;
- (sqlite3_stmt)_statementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5;
- (void)_accessDatabaseUsingBlock:(id)a3;
- (void)clearStatementCache;
- (void)close;
- (void)dealloc;
@end

@implementation PPSSQLiteDatabase

- (PPSSQLiteDatabase)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ([v4 isFileURL] & 1) == 0)
  {

    self = 0;
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid database URL"];
  }
  v13.receiver = self;
  v13.super_class = (Class)PPSSQLiteDatabase;
  id v6 = [(PPSSQLiteDatabase *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    v8 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.PerfPowerServicesReader.SQLite", v9);
    v11 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v10;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 2), "PPSSQLiteDispatchQueue", v6, 0);
  }

  return (PPSSQLiteDatabase *)v6;
}

- (void)dealloc
{
  if (self->_db) {
    [(PPSSQLiteDatabase *)self close];
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_set_specific(dispatchQueue, "PPSSQLiteDispatchQueue", 0, 0);
    id v4 = self->_dispatchQueue;
    self->_dispatchQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PPSSQLiteDatabase;
  [(PPSSQLiteDatabase *)&v5 dealloc];
}

- (int)openForReadingWithError:(id *)a3
{
  p_db = &self->_db;
  if (!self->_db)
  {
    id v4 = [(PPSSQLiteDatabase *)self databaseURL];
    objc_super v5 = [v4 path];

    id v6 = v5;
    if (!sqlite3_open_v2((const char *)[v6 fileSystemRepresentation], p_db, 3145729, 0))
    {
      uint64_t v7 = *p_db;
      do
      {
        usleep(0x14u);
        int v8 = sqlite3_exec(v7, "PRAGMA cache_size=512", 0, 0, 0);
      }
      while (v8 == 5);
      if (!v8) {
        sqlite3_busy_timeout(*p_db, 60000);
      }
    }
  }
  return 0;
}

- (void)close
{
  [(PPSSQLiteDatabase *)self clearStatementCache];
  db = self->_db;
  if (db)
  {
    if (sqlite3_close_v2(db))
    {
      id v4 = logHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl(&dword_258F16000, v4, OS_LOG_TYPE_INFO, "failed to close database.", v5, 2u);
      }
    }
    self->_db = 0;
  }
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  return [(PPSSQLiteDatabase *)self executeSQL:a3 shouldCache:0 error:a4 bindingHandler:0 enumerationHandler:0];
}

- (BOOL)executeSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__PPSSQLiteDatabase_executeSQL_shouldCache_error_bindingHandler_enumerationHandler___block_invoke;
  v17[3] = &unk_2654433A0;
  id v18 = v12;
  id v19 = v13;
  id v14 = v13;
  id v15 = v12;
  LOBYTE(a5) = [(PPSSQLiteDatabase *)self _prepareStatementForSQL:a3 shouldCache:v9 error:a5 usingBlock:v17];

  return (char)a5;
}

uint64_t __84__PPSSQLiteDatabase_executeSQL_shouldCache_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, sqlite3_stmt *))(v6 + 16))(v6, a2);
  }
  if (!*(void *)(a1 + 40))
  {
    BOOL v16 = +[PPSSQLiteDatabase _stepStatement:a2 hasRow:0 error:a3];
    sqlite3_reset(a2);
    return v16;
  }
  PPSSQLiteRow::PPSSQLiteRow((uint64_t)v19, a2, 0);
  uint64_t v7 = 0;
  unsigned __int8 v18 = 0;
  while (1)
  {
    BOOL v8 = +[PPSSQLiteDatabase _stepStatement:a2 hasRow:&v18 error:a3];
    uint64_t v9 = v8;
    int v10 = v18;
    if (v18) {
      BOOL v11 = v8;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11) {
      goto LABEL_11;
    }
    id v12 = (void *)MEMORY[0x25A2D4DD0]();
    int v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v14 = v7;

    if (!v13) {
      break;
    }
    int v10 = v18;
    uint64_t v7 = v14;
LABEL_11:
    if (v10) {
      char v15 = v9;
    }
    else {
      char v15 = 0;
    }
    if ((v15 & 1) == 0)
    {
      id v14 = v7;
      if (!v7) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  uint64_t v9 = 1;
  if (!v14) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v9 = 0;
  if (a3) {
    *a3 = v14;
  }
LABEL_21:

  return v9;
}

- (void)clearStatementCache
{
  statementCache = self->_statementCache;
  if (statementCache)
  {
    CFRelease(statementCache);
    self->_statementCache = 0;
  }
}

- (id)columnNamesForTable:(id)a3
{
  id v4 = [NSString stringWithFormat:@"PRAGMA TABLE_INFO('%@');", a3];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__1;
  char v15 = __Block_byref_object_dispose__1;
  id v16 = [MEMORY[0x263EFF980] array];
  v9[4] = &v11;
  id v10 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__PPSSQLiteDatabase_columnNamesForTable___block_invoke;
  v9[3] = &unk_2654433C8;
  [(PPSSQLiteDatabase *)self executeSQL:v4 shouldCache:0 error:&v10 bindingHandler:0 enumerationHandler:v9];
  id v5 = v10;
  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (void *)v12[5];
  }
  id v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __41__PPSSQLiteDatabase_columnNamesForTable___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x25A2D4DD0]();
  id v5 = PPSSQLiteColumnValueAsString(a2, 1);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    }
  }

  return 1;
}

- (id)tableNames
{
  v3 = [NSString stringWithFormat:@"SELECT name FROM sqlite_master WHERE type='table'"];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = [MEMORY[0x263EFF980] array];
  v8[4] = &v10;
  id v9 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__PPSSQLiteDatabase_tableNames__block_invoke;
  v8[3] = &unk_2654433C8;
  [(PPSSQLiteDatabase *)self executeSQL:v3 shouldCache:1 error:&v9 bindingHandler:0 enumerationHandler:v8];
  id v4 = v9;
  if (v4) {
    id v5 = 0;
  }
  else {
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  return v6;
}

uint64_t __31__PPSSQLiteDatabase_tableNames__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x25A2D4DD0]();
  id v5 = PPSSQLiteColumnValueAsString(a2, 0);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    }
  }

  return 1;
}

- (BOOL)tableWithName:(id)a3 containsColumnWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self->_db
    && [v6 length]
    && [v7 length]
    && sqlite3_table_column_metadata(self->_db, 0, (const char *)[v6 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 0, 0, 0, 0, 0) == 0;

  return v8;
}

- (id)typeForColumn:(id)a3 inTable:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  id v9 = [NSString stringWithFormat:@"PRAGMA TABLE_INFO('%@');", a4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__PPSSQLiteDatabase_typeForColumn_inTable_error___block_invoke;
  v13[3] = &unk_2654433F0;
  id v10 = v8;
  id v14 = v10;
  id v15 = &v16;
  [(PPSSQLiteDatabase *)self executeSQL:v9 shouldCache:1 error:a5 bindingHandler:0 enumerationHandler:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t __49__PPSSQLiteDatabase_typeForColumn_inTable_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x25A2D4DD0]();
  id v5 = PPSSQLiteColumnValueAsString(a2, 1);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([*(id *)(a1 + 32) isEqualToString:v5])
      {
        uint64_t v6 = PPSSQLiteColumnValueAsString(a2, 2);
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        id v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
    }
  }

  return 0;
}

- (void)_accessDatabaseUsingBlock:(id)a3
{
  block = (void (**)(void))a3;
  if (dispatch_get_specific("PPSSQLiteDispatchQueue") == self) {
    block[2]();
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_dispatchQueue, block);
  }
}

- (BOOL)_prepareStatementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__PPSSQLiteDatabase__prepareStatementForSQL_shouldCache_error_usingBlock___block_invoke;
  v16[3] = &unk_265443418;
  v16[4] = self;
  id v17 = v10;
  BOOL v21 = a4;
  id v19 = &v22;
  id v20 = a5;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  [(PPSSQLiteDatabase *)self _accessDatabaseUsingBlock:v16];
  char v14 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __74__PPSSQLiteDatabase__prepareStatementForSQL_shouldCache_error_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) _statementForSQL:*(void *)(a1 + 40) shouldCache:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 64)];
  if (result)
  {
    v3 = (sqlite3_stmt *)result;
    uint64_t v4 = *(void *)(a1 + 48);
    id v8 = 0;
    char v5 = (*(uint64_t (**)(void))(v4 + 16))();
    id v6 = v8;
    uint64_t v7 = v6;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && *(void *)(a1 + 64)) {
      **(void **)(a1 + 64) = v6;
    }

    sqlite3_reset(v3);
    uint64_t result = sqlite3_clear_bindings(v3);
    if (!*(unsigned char *)(a1 + 72)) {
      return sqlite3_finalize(v3);
    }
  }
  return result;
}

+ (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  if (!a3) {
    return 1;
  }
  while (1)
  {
    unsigned __int8 v8 = sqlite3_step(a3);
    if (v8 == 9) {
      goto LABEL_20;
    }
    if (v8 == 101) {
      return 1;
    }
    if (v8 == 100) {
      break;
    }
    int v9 = v8;
    if (v8 - 5 >= 2)
    {
      if (v8 == 19)
      {
        id v10 = logHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v12 = sqlite3_sql(a3);
          id v13 = sqlite3_db_handle(a3);
          char v14 = sqlite3_errmsg(v13);
          +[PPSSQLiteDatabase _stepStatement:hasRow:error:]((uint64_t)v14, (uint8_t *)&v17, (uint64_t)v12, v10);
        }
      }
      else if (v8 == 11)
      {
        id v10 = logHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          +[PPSSQLiteDatabase _stepStatement:hasRow:error:](v10);
        }
      }
      else
      {
        id v10 = logHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v15 = sqlite3_sql(a3);
          uint64_t v16 = sqlite3_db_handle(a3);
          int v17 = 136315650;
          id v18 = v15;
          __int16 v19 = 1024;
          int v20 = v9;
          __int16 v21 = 2080;
          uint64_t v22 = sqlite3_errmsg(v16);
          _os_log_debug_impl(&dword_258F16000, v10, OS_LOG_TYPE_DEBUG, "Step failed: %s: [%d, %s]", (uint8_t *)&v17, 0x1Cu);
        }
      }

LABEL_20:
      if (!a5) {
        return 0;
      }
      sqlite3_db_handle(a3);
      BOOL result = 0;
      *a5 = 0;
      return result;
    }
  }
  BOOL result = 1;
  if (a4) {
    *a4 = 1;
  }
  return result;
}

- (sqlite3_stmt)_statementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  ppStmt = 0;
  if (!v6
    || (int v9 = self->_statementCache) == 0
    || (Value = (sqlite3_stmt *)CFDictionaryGetValue(v9, v8), (ppStmt = Value) == 0))
  {
    id v11 = (void *)MEMORY[0x25A2D4DD0]();
    uint64_t v12 = *MEMORY[0x263EFF498];
    do
    {
      *(void *)pzTail = 0;
      db = self->_db;
      id v14 = v8;
      int v15 = sqlite3_prepare_v2(db, (const char *)[v14 UTF8String], objc_msgSend(v14, "length"), &ppStmt, (const char **)pzTail);
      int v16 = v15;
      if (!v15 && *(void *)pzTail)
      {
        if (**(unsigned char **)pzTail) {
          objc_msgSend(MEMORY[0x263EFF940], "raise:format:", v12, @"SQL strings must contain only a single statement; remaining statements will not be executed: %s",
        }
            *(void *)pzTail);
        goto LABEL_14;
      }
    }
    while ((v15 - 5) < 2);
    if (v15)
    {
      int v17 = lastErrorForDatabase(self->_db, v15);
      id v18 = logHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)pzTail = 138412802;
        *(void *)&pzTail[4] = v14;
        __int16 v23 = 1024;
        int v24 = v16;
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_debug_impl(&dword_258F16000, v18, OS_LOG_TYPE_DEBUG, "Could not prepare statement: %@: [%d, %@]", pzTail, 0x1Cu);
      }

      goto LABEL_20;
    }
LABEL_14:
    if (v6)
    {
      statementCache = self->_statementCache;
      if (!statementCache)
      {
        statementCache = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], &kSqlite3StatementDictionaryValueCallbacks);
        self->_statementCache = statementCache;
      }
      if (ppStmt) {
        CFDictionarySetValue(statementCache, v14, ppStmt);
      }
    }
    int v17 = 0;
LABEL_20:
    if (a5) {
      *a5 = v17;
    }

    Value = ppStmt;
  }

  return Value;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

+ (void)_stepStatement:(os_log_t)log hasRow:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_258F16000, log, OS_LOG_TYPE_ERROR, "Corrupted database.", v1, 2u);
}

+ (void)_stepStatement:(uint64_t)a3 hasRow:(os_log_t)log error:.cold.2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 19;
  *((_WORD *)buf + 9) = 2082;
  *(void *)(buf + 20) = a1;
  _os_log_debug_impl(&dword_258F16000, log, OS_LOG_TYPE_DEBUG, "Constraint violation during statement step: %s [%d, %{public}s]", buf, 0x1Cu);
}

@end