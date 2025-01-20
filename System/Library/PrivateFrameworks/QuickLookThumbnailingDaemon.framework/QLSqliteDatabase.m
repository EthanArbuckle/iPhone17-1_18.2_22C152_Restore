@interface QLSqliteDatabase
+ (void)toggleSqlLogging;
- (BOOL)beginTransaction;
- (BOOL)isCorrupted;
- (BOOL)isOpened;
- (BOOL)stepStatement:(sqlite3_stmt *)a3;
- (BOOL)stepStatement:(sqlite3_stmt *)a3 didReturnData:(BOOL *)a4;
- (NSString)tracingPrefix;
- (QLSqliteDatabase)init;
- (__CFString)newCFStringFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5;
- (__CFURL)newCFURLFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4;
- (double)doubleFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4;
- (float)floatFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4;
- (id)_cacheStatement:(sqlite3_stmt *)a3 forKey:(id)a4;
- (id)_cachedStatementForKey:(id)a3;
- (id)_crapPath;
- (id)lastCrapWithDate:(id *)a3;
- (id)newColumnName:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5;
- (id)newDataFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 copyBytes:(BOOL)a5;
- (id)newPathFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5;
- (id)newStringFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5;
- (id)queue;
- (int)intFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4;
- (int64_t)columnCount:(sqlite3_stmt *)a3;
- (int64_t)lastInsertRowId;
- (sqlite3_stmt)prepareStatement:(const char *)a3;
- (unint64_t)unsignedLongLongFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4;
- (void)_databaseCorrupted;
- (void)_dropStatementCache;
- (void)_finalizeStatement:(sqlite3_stmt *)a3;
- (void)bindBytes:(void *)a3 length:(unsigned int)a4 atIndex:(int)a5 inStatement:(sqlite3_stmt *)a6;
- (void)bindCFURL:(__CFURL *)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (void)bindDouble:(double)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (void)bindInt:(int)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (void)bindObject:(id)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (void)bindPath:(id)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (void)bindUnsignedLongLong:(unint64_t)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (void)checkpoint;
- (void)closeDatabase;
- (void)dealloc;
- (void)disableSqliteTracing;
- (void)do:(id)a3;
- (void)enableSqliteTracing:(id)a3;
- (void)endTransaction;
- (void)execute:(const char *)a3;
- (void)executeSql:(const char *)a3 withCallback:(void *)a4 context:(void *)a5;
- (void)executeWithBlob:(const void *)a3 length:(int)a4 format:(const char *)a5;
- (void)executeWithCallback:(void *)a3 context:(void *)a4 rollbackOnError:(BOOL)a5 sql:(const char *)a6 arguments:(char *)a7;
- (void)executeWithCallback:(void *)a3 context:(void *)a4 sql:(const char *)a5;
- (void)executeWithRollbackOnError:(const char *)a3;
- (void)finalizeStatement:(sqlite3_stmt *)a3;
- (void)newBufferFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 length:(unsigned int *)a5;
- (void)openDatabaseAtPath:(id)a3;
- (void)resetStatement:(sqlite3_stmt *)a3 unbindValuesThroughIndex:(int)a4;
- (void)runStatement:(sqlite3_stmt *)a3 stepHandler:(id)a4;
- (void)runStatement:(sqlite3_stmt *)a3 withBoundNumbers:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6;
- (void)runStatement:(sqlite3_stmt *)a3 withBoundObjects:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6;
- (void)runStatement:(sqlite3_stmt *)a3 withBoundRowIds:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6;
- (void)runStatement:(sqlite3_stmt *)a3 withBoundRowIds:(unint64_t *)a4 count:(unint64_t)a5 startingAtIndex:(int)a6 stepHandler:(id)a7;
- (void)setIsCorrupted:(BOOL)a3;
- (void)setSqliteCacheSize:(int64_t)a3;
- (void)setTracingPrefix:(id)a3;
- (void)sqliteCrappedOut:(int)a3 message:(id)a4;
- (void)vacuum;
@end

@implementation QLSqliteDatabase

- (void)finalizeStatement:(sqlite3_stmt *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    v5 = NSMapGet(self->_statementsInUseTable, *a3);
    id v9 = v5;
    if (v5)
    {
      [v5 setInUse:0];
      [(QLSqliteDatabase *)self resetStatement:*a3 unbindValuesThroughIndex:0];
      statementCache = self->_statementCache;
      v7 = [v9 key];
      v8 = [(NSMutableDictionary *)statementCache objectForKey:v7];

      if (!v8)
      {
        [(QLSqliteDatabase *)self _finalizeStatement:a3];
        [v9 setStmt:0];
      }
    }
    else
    {
      [(QLSqliteDatabase *)self _finalizeStatement:a3];
    }
    *a3 = 0;
  }
}

- (void)resetStatement:(sqlite3_stmt *)a3 unbindValuesThroughIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isCorrupted) {
    return;
  }
  uint64_t v7 = sqlite3_reset(a3);
  if (v7)
  {
    if (v7 != 26 && v7 != 11)
    {
      [(QLSqliteDatabase *)self sqliteCrappedOut:v7 message:@"can't reset statement"];
      return;
    }
    [(QLSqliteDatabase *)self _databaseCorrupted];
  }
  if (!self->_isCorrupted && (int)v4 >= 1)
  {
    do
    {
      uint64_t v8 = sqlite3_bind_null(a3, v4);
      if (v8)
      {
        if (v8 != 26 && v8 != 11)
        {
          [(QLSqliteDatabase *)self sqliteCrappedOut:v8, @"can't unbind value at index %d", v4 message];
          return;
        }
        [(QLSqliteDatabase *)self _databaseCorrupted];
      }
      BOOL v9 = self->_isCorrupted || (int)v4 <= 1;
      uint64_t v4 = (v4 - 1);
    }
    while (!v9);
  }
}

- (sqlite3_stmt)prepareStatement:(const char *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    ppStmt = 0;
    v6 = [NSString stringWithUTF8String:a3];
    uint64_t v7 = [(QLSqliteDatabase *)self _cachedStatementForKey:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      ppStmt = (sqlite3_stmt *)[v7 stmt];
      if (ppStmt)
      {
LABEL_32:
        [v8 setInUse:1];
        v5 = ppStmt;
LABEL_33:

        return v5;
      }
    }
    for (int i = -599; ; ++i)
    {
      uint64_t v10 = sqlite3_prepare_v2(self->_db, a3, -1, &ppStmt, 0);
      if (v10 != 5) {
        break;
      }
      if (!i) {
        goto LABEL_36;
      }
      v11 = (void *)MEMORY[0x1E4F29060];
      v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", v10, 0.1);
      [v11 sleepUntilDate:v12];
    }
    if ((int)v10 <= 10)
    {
      if (v10) {
        BOOL v14 = v10 == 4;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14) {
        goto LABEL_36;
      }
    }
    else
    {
      if (v10 == 11 || v10 == 26)
      {
        [(QLSqliteDatabase *)self _databaseCorrupted];
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
        goto LABEL_26;
      }
      if (v10 != 101)
      {
LABEL_36:
        [(QLSqliteDatabase *)self sqliteCrappedOut:v10, @"error while preparing '%s'", a3 message];
        v5 = 0;
        goto LABEL_33;
      }
    }
    if (!pLogSql)
    {
LABEL_31:
      uint64_t v19 = [(QLSqliteDatabase *)self _cacheStatement:ppStmt forKey:v6];

      uint64_t v8 = (void *)v19;
      goto LABEL_32;
    }
    uint64_t v15 = MEMORY[0x1E4F3A768];
    v16 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
    if (!v16)
    {
      QLTInitLogging();
      v16 = *(NSObject **)(v15 + 8);
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[QLSqliteDatabase(SqliteHelpers) prepareStatement:]();
    }
LABEL_26:
    if (pLogSql)
    {
      uint64_t v17 = MEMORY[0x1E4F3A768];
      v18 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
      if (!v18)
      {
        QLTInitLogging();
        v18 = *(NSObject **)(v17 + 8);
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[QLSqliteDatabase(SqliteHelpers) prepareStatement:]();
      }
    }
    goto LABEL_31;
  }
  return 0;
}

- (id)_cachedStatementForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_statementCache objectForKey:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 stmt];
    if (pLogSql)
    {
      uint64_t v5 = MEMORY[0x1E4F3A768];
      v6 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
      if (!v6)
      {
        QLTInitLogging();
        v6 = *(NSObject **)(v5 + 8);
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[QLSqliteDatabase(SqliteHelpers) _cachedStatementForKey:]();
      }
    }
  }
  return v4;
}

- (void)bindInt:(int)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = sqlite3_bind_int(a5, v6, v7);
  if (v9) {
    [(QLSqliteDatabase *)self sqliteCrappedOut:v9, @"can't bind %d at index %d", v7, v6 message];
  }
  if (pLogSql)
  {
    uint64_t v10 = MEMORY[0x1E4F3A768];
    v11 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
    if (!v11)
    {
      QLTInitLogging();
      v11 = *(NSObject **)(v10 + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      db = self->_db;
      *(_DWORD *)buf = 134218496;
      BOOL v14 = db;
      __int16 v15 = 1024;
      int v16 = v6;
      __int16 v17 = 1024;
      int v18 = v7;
      _os_log_debug_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_DEBUG, "bindInt %p %d %d", buf, 0x18u);
    }
  }
}

- (void)bindUnsignedLongLong:(unint64_t)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = sqlite3_bind_int64(a5, v6, a3);
  if (v9) {
    [(QLSqliteDatabase *)self sqliteCrappedOut:v9, @"can't bind %llu at index %d", a3, v6 message];
  }
  if (pLogSql)
  {
    uint64_t v10 = MEMORY[0x1E4F3A768];
    v11 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
    if (!v11)
    {
      QLTInitLogging();
      v11 = *(NSObject **)(v10 + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      db = self->_db;
      *(_DWORD *)buf = 134218496;
      BOOL v14 = db;
      __int16 v15 = 1024;
      int v16 = v6;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      _os_log_debug_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_DEBUG, "bindUnsignedLongLong %p %d %llu", buf, 0x1Cu);
    }
  }
}

- (unint64_t)unsignedLongLongFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_int64(a4, a3);
}

- (int)intFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_int(a4, a3);
}

- (id)newDataFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 copyBytes:(BOOL)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = sqlite3_column_blob(a4, a3);
  int v9 = sqlite3_column_bytes(a4, a3);
  if (!v8 || !v9) {
    return 0;
  }
  uint64_t v10 = v9;
  id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  if (a5)
  {
    return (id)[v11 initWithBytes:v8 length:v10];
  }
  else
  {
    return (id)[v11 initWithBytesNoCopy:v8 length:v10 freeWhenDone:0];
  }
}

- (float)floatFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  return sqlite3_column_double(a4, a3);
}

- (double)doubleFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_double(a4, a3);
}

void __23__QLSqliteDatabase_do___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E01C5C90]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endTransaction
{
  if (self->transactionCount >= 1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    int64_t v3 = self->transactionCount - 1;
    self->transactionCount = v3;
    if (!v3)
    {
      errmsg = 0;
      if (sqlite3_exec(self->_db, "END;", 0, 0, &errmsg))
      {
        uint64_t v4 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
        if (!v4)
        {
          uint64_t v5 = MEMORY[0x1E4F3A768];
          QLTInitLogging();
          uint64_t v4 = *(NSObject **)(v5 + 8);
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          -[QLSqliteDatabase(SqliteHelpers) endTransaction]();
        }
      }
    }
  }
}

- (BOOL)beginTransaction
{
  int64_t transactionCount = self->transactionCount;
  if (transactionCount < 1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_isCorrupted)
    {
      return 0;
    }
    else
    {
      errmsg = 0;
      int v5 = sqlite3_exec(self->_db, "BEGIN;", 0, 0, &errmsg);
      BOOL v4 = v5 == 0;
      if (v5)
      {
        uint64_t v6 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
        if (!v6)
        {
          uint64_t v8 = MEMORY[0x1E4F3A768];
          QLTInitLogging();
          uint64_t v6 = *(NSObject **)(v8 + 8);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[QLSqliteDatabase(SqliteHelpers) beginTransaction]();
        }
      }
      else
      {
        self->int64_t transactionCount = 1;
      }
    }
  }
  else
  {
    self->int64_t transactionCount = transactionCount + 1;
    return 1;
  }
  return v4;
}

- (BOOL)isOpened
{
  return self->_db != 0;
}

- (BOOL)stepStatement:(sqlite3_stmt *)a3 didReturnData:(BOOL *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isCorrupted) {
    goto LABEL_2;
  }
  if (a4) {
    *a4 = 0;
  }
  uint64_t v8 = MEMORY[0x1E4F3A768];
  for (int i = 599; ; --i)
  {
    uint64_t v10 = sqlite3_step(a3);
    uint64_t v11 = v10;
    if (v10 != 5) {
      break;
    }
    if (!i) {
      goto LABEL_37;
    }
    v12 = *(NSObject **)(v8 + 8);
    if (!v12)
    {
      QLTInitLogging();
      v12 = *(NSObject **)(v8 + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v20 = a3;
      __int16 v21 = 1024;
      int v22 = i;
      _os_log_debug_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_DEBUG, "failed to step %p because sql was busy, retry count %d", buf, 0x12u);
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:0.1];
    [MEMORY[0x1E4F29060] sleepUntilDate:v13];
  }
  if ((int)v10 > 25)
  {
    if (v10 == 26) {
      goto LABEL_29;
    }
    if (v10 != 101)
    {
      if (v10 != 100)
      {
LABEL_37:
        int v16 = *(NSObject **)(v8 + 8);
        if (!v16)
        {
          QLTInitLogging();
          int v16 = *(NSObject **)(v8 + 8);
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:](v16, v11);
        }
        sqlite3_reset(a3);
        [(QLSqliteDatabase *)self sqliteCrappedOut:v11, @"can't execute statement (%s) retval %d", sqlite3_sql(a3), v11 message];
        goto LABEL_2;
      }
      if (pLogSql)
      {
        BOOL v14 = *(NSObject **)(v8 + 8);
        if (!v14)
        {
          QLTInitLogging();
          BOOL v14 = *(NSObject **)(v8 + 8);
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:]();
        }
      }
      LOBYTE(v7) = 1;
      if (a4) {
        *a4 = 1;
      }
      return v7;
    }
    if (!pLogSql) {
      goto LABEL_34;
    }
LABEL_30:
    __int16 v15 = *(NSObject **)(v8 + 8);
    if (!v15)
    {
      QLTInitLogging();
      __int16 v15 = *(NSObject **)(v8 + 8);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:]();
      if (!a4) {
        goto LABEL_36;
      }
    }
    else
    {
LABEL_34:
      if (!a4)
      {
LABEL_36:
        LOBYTE(v7) = 1;
        return v7;
      }
    }
    *a4 = 0;
    goto LABEL_36;
  }
  if (!v10) {
    goto LABEL_30;
  }
  if (v10 != 4)
  {
    if (v10 != 11) {
      goto LABEL_37;
    }
LABEL_29:
    [(QLSqliteDatabase *)self _databaseCorrupted];
    goto LABEL_2;
  }
  if (!pLogSql)
  {
LABEL_2:
    LOBYTE(v7) = 0;
    return v7;
  }
  __int16 v17 = *(NSObject **)(v8 + 8);
  if (!v17)
  {
    QLTInitLogging();
    __int16 v17 = *(NSObject **)(v8 + 8);
  }
  BOOL v7 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:].cold.4(v17);
    goto LABEL_2;
  }
  return v7;
}

- (id)newStringFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v9 = (unsigned __int8 *)sqlite3_column_text(a4, a3);
  if (v9)
  {
    int v9 = (unsigned __int8 *)[[NSString alloc] initWithUTF8String:v9];
    if (v8)
    {
      uint64_t v10 = [v8 member:v9];
      uint64_t v11 = v10;
      if (v10)
      {
        v12 = v10;

        int v9 = v12;
      }
      else
      {
        [v8 addObject:v9];
      }
    }
  }

  return v9;
}

- (void)bindObject:(id)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!pLogSql) {
    goto LABEL_5;
  }
  uint64_t v9 = MEMORY[0x1E4F3A768];
  uint64_t v10 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
  if (!v10)
  {
    QLTInitLogging();
    uint64_t v10 = *(NSObject **)(v9 + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    db = self->_db;
    uint64_t v19 = v10;
    v20 = [v8 description];
    *(_DWORD *)buf = 134218754;
    v25 = db;
    __int16 v26 = 2048;
    v27 = a5;
    __int16 v28 = 1024;
    int v29 = v6;
    __int16 v30 = 2112;
    v31 = v20;
    _os_log_debug_impl(&dword_1DDC5E000, v19, OS_LOG_TYPE_DEBUG, "bindObject db %p stmt %p %d %@", buf, 0x26u);

    if (!v8) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_5:
    if (!v8)
    {
LABEL_16:
      uint64_t v13 = sqlite3_bind_null(a5, v6);
      goto LABEL_17;
    }
  }
  id v11 = [MEMORY[0x1E4F1CA98] null];

  if (v11 == v8) {
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(QLSqliteDatabase *)self bindCFURL:v8 atIndex:v6 inStatement:a5];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    uint64_t v13 = sqlite3_bind_blob(a5, v6, (const void *)[v12 bytes], objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v16 = objc_opt_class();
      __int16 v17 = [v8 description];
      [(QLSqliteDatabase *)self sqliteCrappedOut:0, @"can't bind objects of class %@ (= '%@') at index %d", v16, v17, v6 message];

      goto LABEL_19;
    }
    uint64_t v14 = [v8 lengthOfBytesUsingEncoding:4];
    __int16 v15 = malloc_type_malloc(v14 + 1, 0x100004077774924uLL);
    if (![v8 getCString:v15 maxLength:v14 + 1 encoding:4])
    {
      free(v15);
      [(QLSqliteDatabase *)self sqliteCrappedOut:0, @"can't get UTF8 encoding for '%@' (length %ld)", v8, v14 message];
      goto LABEL_19;
    }
    uint64_t v13 = sqlite3_bind_text(a5, v6, (const char *)v15, v14, MEMORY[0x1E4F14838]);
  }
LABEL_17:
  uint64_t v21 = v13;
  if (v13)
  {
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = [v8 description];
    [(QLSqliteDatabase *)self sqliteCrappedOut:v21, @"can't bind %@ (= '%@') at index %d", v22, v23, v6 message];
  }
LABEL_19:
}

- (void)bindDouble:(double)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = sqlite3_bind_double(a5, v6, a3);
  if (v9) {
    [(QLSqliteDatabase *)self sqliteCrappedOut:v9, @"can't bind %g at index %d", *(void *)&a3, v6 message];
  }
  if (pLogSql)
  {
    uint64_t v10 = MEMORY[0x1E4F3A768];
    id v11 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
    if (!v11)
    {
      QLTInitLogging();
      id v11 = *(NSObject **)(v10 + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      db = self->_db;
      *(_DWORD *)buf = 134218496;
      uint64_t v14 = db;
      __int16 v15 = 1024;
      int v16 = v6;
      __int16 v17 = 2048;
      double v18 = a3;
      _os_log_debug_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_DEBUG, "bindInt %p %d %g", buf, 0x1Cu);
    }
  }
}

- (BOOL)stepStatement:(sqlite3_stmt *)a3
{
  return [(QLSqliteDatabase *)self stepStatement:a3 didReturnData:0];
}

- (void)do:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__QLSqliteDatabase_do___block_invoke;
  block[3] = &unk_1E6D0C588;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)_finalizeStatement:(sqlite3_stmt *)a3
{
  int v5 = sqlite3_finalize(*a3);
  if (!pLogSql) {
    goto LABEL_5;
  }
  uint64_t v6 = MEMORY[0x1E4F3A768];
  BOOL v7 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
  if (!v7)
  {
    QLTInitLogging();
    BOOL v7 = *(NSObject **)(v6 + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[QLSqliteDatabase(SqliteHelpers_Internal) _finalizeStatement:]();
    if (!v5) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_5:
    if (!v5) {
      goto LABEL_20;
    }
  }
  if (v5 == 26 || v5 == 11)
  {
    [(QLSqliteDatabase *)self _databaseCorrupted];
  }
  else
  {
    db = self->_db;
    p_db = &self->_db;
    sqlite3_errmsg(db);
    uint64_t v11 = MEMORY[0x1E4F3A768];
    id v12 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
    if (!v12)
    {
      QLTInitLogging();
      id v12 = *(NSObject **)(v11 + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[QLSqliteDatabase(SqliteHelpers_Internal) _finalizeStatement:](p_db, v12);
    }
    uint64_t v13 = *(NSObject **)(v11 + 8);
    if (!v13)
    {
      QLTInitLogging();
      uint64_t v13 = *(NSObject **)(v11 + 8);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[QLSqliteDatabase(SqliteHelpers_Internal) _finalizeStatement:](p_db, v13);
    }
  }
LABEL_20:
  *a3 = 0;
}

- (void)_databaseCorrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(QLSqliteDatabase *)self setIsCorrupted:1];
  uint64_t v3 = MEMORY[0x1E4F3A768];
  id v4 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
  if (!v4)
  {
    QLTInitLogging();
    id v4 = *(NSObject **)(v3 + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[QLSqliteDatabase(SqliteHelpers_Internal) _databaseCorrupted](v4);
  }
}

- (QLSqliteDatabase)init
{
  v11.receiver = self;
  v11.super_class = (Class)QLSqliteDatabase;
  v2 = [(QLSqliteDatabase *)&v11 init];
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("quicklookd.cachedb", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  uint64_t v6 = objc_opt_new();
  statementCache = v2->_statementCache;
  v2->_statementCache = (NSMutableDictionary *)v6;

  uint64_t v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:256 valueOptions:0];
  statementsInUseTable = v2->_statementsInUseTable;
  v2->_statementsInUseTable = (NSMapTable *)v8;

  return v2;
}

- (id)queue
{
  return self->_queue;
}

- (void)openDatabaseAtPath:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_path, a3);
  id v6 = v5;
  p_db = &self->_db;
  if (sqlite3_open((const char *)[v6 fileSystemRepresentation], &self->_db))
  {
    sqlite3_close(*p_db);
    *p_db = 0;
  }
  else
  {
    [(QLSqliteDatabase *)self setIsCorrupted:0];
    if (sqlite3_exec(self->_db, "pragma journal_mode=WAL;", 0, 0, 0))
    {
      uint64_t v8 = MEMORY[0x1E4F3A768];
      uint64_t v9 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
      if (!v9)
      {
        QLTInitLogging();
        uint64_t v9 = *(NSObject **)(v8 + 8);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[QLSqliteDatabase openDatabaseAtPath:](v9);
      }
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)QLSqliteDatabase;
  [(QLSqliteDatabase *)&v2 dealloc];
}

- (void)closeDatabase
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DDC5E000, v0, v1, "End transaction error at close time: %s (%i)", v2, v3);
}

- (void)_dropStatementCache
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(NSMutableDictionary *)self->_statementCache objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 isInUse] & 1) == 0)
        {
          uint64_t v9 = 0;
          uint64_t v9 = [v8 stmt];
          if (v9) {
            [(QLSqliteDatabase *)self _finalizeStatement:&v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_statementCache removeAllObjects];
  [(NSMapTable *)self->_statementsInUseTable removeAllObjects];
}

- (BOOL)isCorrupted
{
  return self->_isCorrupted;
}

- (void)setIsCorrupted:(BOOL)a3
{
  self->_isCorrupted = a3;
}

- (NSString)tracingPrefix
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTracingPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracingPrefix, 0);
  objc_storeStrong((id *)&self->_statementsInUseTable, 0);
  objc_storeStrong((id *)&self->_statementCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (void)toggleSqlLogging
{
  pLogSql = pLogSql == 0;
}

- (void)enableSqliteTracing:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    uint64_t v4 = (NSString *)v6;
  }
  else
  {
    [NSString stringWithFormat:@"%@ <db=%p> : ", 0, self->_db];
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  tracingPrefix = self->_tracingPrefix;
  self->_tracingPrefix = v4;

  sqlite3_trace_v2(self->_db, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))traceSQL, self);
}

- (void)disableSqliteTracing
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  db = self->_db;
  sqlite3_trace_v2(db, 0, 0, 0);
}

- (void)executeWithCallback:(void *)a3 context:(void *)a4 rollbackOnError:(BOOL)a5 sql:(const char *)a6 arguments:(char *)a7
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    long long v12 = sqlite3_vmprintf(a6, a7);
    if (pLogSql)
    {
      uint64_t v13 = MEMORY[0x1E4F3A768];
      uint64_t v14 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
      if (!v14)
      {
        QLTInitLogging();
        uint64_t v14 = *(NSObject **)(v13 + 8);
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[QLSqliteDatabase(SqliteHelpers) executeWithCallback:context:rollbackOnError:sql:arguments:]();
      }
    }
    errmsg = 0;
    int v15 = sqlite3_exec(self->_db, v12, (int (__cdecl *)(void *, int, char **, char **))a3, a4, &errmsg);
    if ((v15 & 0xFFFFFFFB) != 0)
    {
      int v16 = v15;
      int v17 = 600;
      while (v16 == 5)
      {
        if (!--v17) {
          goto LABEL_15;
        }
        double v18 = (void *)MEMORY[0x1E4F29060];
        uint64_t v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.1];
        [v18 sleepUntilDate:v19];

LABEL_16:
        errmsg = 0;
        int v16 = sqlite3_exec(self->_db, v12, (int (__cdecl *)(void *, int, char **, char **))a3, a4, &errmsg);
        if ((v16 & 0xFFFFFFFB) == 0) {
          goto LABEL_19;
        }
      }
      if (v16 == 11 || v16 == 26)
      {
        [(QLSqliteDatabase *)self _databaseCorrupted];
        goto LABEL_19;
      }
LABEL_15:
      -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v12);
      goto LABEL_16;
    }
LABEL_19:
    sqlite3_free(v12);
  }
}

- (void)executeWithBlob:(const void *)a3 length:(int)a4 format:(const char *)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    ppStmt[1] = (sqlite3_stmt *)&v24;
    uint64_t v9 = sqlite3_vmprintf(a5, &v24);
    long long v10 = [NSString stringWithUTF8String:v9];
    long long v11 = [(QLSqliteDatabase *)self _cachedStatementForKey:v10];
    ppStmt[0] = (sqlite3_stmt *)[v11 stmt];
    if (ppStmt[0])
    {
LABEL_13:
      sqlite3_free(v9);
      [v11 setInUse:1];
      int v16 = ppStmt[0];
      if (ppStmt[0])
      {
        int v17 = -600;
        while (1)
        {
          if (self->_isCorrupted) {
            goto LABEL_29;
          }
          uint64_t v18 = sqlite3_step(v16);
          if (v18 != 5) {
            break;
          }
          if (__CFADD__(v17++, 1)) {
            goto LABEL_27;
          }
          v20 = (void *)MEMORY[0x1E4F29060];
          uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", v18, 0.1);
          [v20 sleepUntilDate:v21];

          int v16 = ppStmt[0];
          if (!ppStmt[0]) {
            goto LABEL_29;
          }
        }
        if ((int)v18 <= 10)
        {
          if (v18 && v18 != 4) {
LABEL_27:
          }
            [(QLSqliteDatabase *)self sqliteCrappedOut:v18, @"error while executing '%s'", v9 message];
        }
        else
        {
          if (v18 != 11 && v18 != 26)
          {
            if (v18 == 101) {
              goto LABEL_29;
            }
            goto LABEL_27;
          }
          [(QLSqliteDatabase *)self _databaseCorrupted];
        }
      }
LABEL_29:
      [(QLSqliteDatabase *)self finalizeStatement:ppStmt];
      goto LABEL_30;
    }
    int v12 = strlen(v9);
    uint64_t v13 = sqlite3_prepare_v2(self->_db, v9, v12, ppStmt, 0);
    if (v13)
    {
      if (v13 != 26 && v13 != 11)
      {
        [(QLSqliteDatabase *)self sqliteCrappedOut:v13, @"preparing '%s'", v9 message];
        goto LABEL_30;
      }
      [(QLSqliteDatabase *)self _databaseCorrupted];
    }
    if (!ppStmt[0]) {
      goto LABEL_12;
    }
    uint64_t v14 = sqlite3_bind_blob(ppStmt[0], 1, a3, a4, 0);
    if (!v14) {
      goto LABEL_12;
    }
    if (v14 == 26 || v14 == 11)
    {
      [(QLSqliteDatabase *)self _databaseCorrupted];
LABEL_12:
      uint64_t v15 = [(QLSqliteDatabase *)self _cacheStatement:ppStmt[0] forKey:v10];

      long long v11 = (void *)v15;
      goto LABEL_13;
    }
    [(QLSqliteDatabase *)self sqliteCrappedOut:v14, @"error while binding blog", v22 message];
LABEL_30:
  }
}

- (void)execute:(const char *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(QLSqliteDatabase *)self executeWithCallback:0 context:0 rollbackOnError:0 sql:a3 arguments:&v5];
}

- (void)executeWithRollbackOnError:(const char *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(QLSqliteDatabase *)self executeWithCallback:0 context:0 rollbackOnError:1 sql:a3 arguments:&v5];
}

- (void)executeWithCallback:(void *)a3 context:(void *)a4 sql:(const char *)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(QLSqliteDatabase *)self executeWithCallback:a3 context:a4 rollbackOnError:0 sql:a5 arguments:&v9];
}

- (void)executeSql:(const char *)a3 withCallback:(void *)a4 context:(void *)a5
{
}

- (id)_crapPath
{
  return [(NSString *)self->_path stringByAppendingPathExtension:@"lasterror"];
}

- (void)sqliteCrappedOut:(int)a3 message:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2(queue);
  v26[1] = &v36;
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:v7 arguments:&v36];

  v26[0] = 0;
  uint64_t v9 = [(QLSqliteDatabase *)self lastCrapWithDate:v26];
  id v10 = v26[0];
  long long v11 = NSString;
  uint64_t v12 = sqlite3_errcode(self->_db);
  uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", @"unexpected behavior of sqllite bridge: (triggered by %ld - database errcode: %ld - %s)", a3, v12, sqlite3_errmsg(self->_db));
  uint64_t v14 = [v9 componentsSeparatedByString:@"\n"];
  if ([v14 count])
  {
    uint64_t v15 = [v14 objectAtIndex:0];
  }
  else
  {
    uint64_t v15 = 0;
  }

  if ([v13 isEqual:v15])
  {
    int v16 = [NSString stringWithFormat:@"%@\n%@", v9, v8];
    int v17 = [(QLSqliteDatabase *)self _crapPath];
    [v16 writeToFile:v17 atomically:1 encoding:4 error:0];
  }
  else
  {
    int v16 = [NSString stringWithFormat:@"%@\n%@", v13, v8];
    uint64_t v18 = [(QLSqliteDatabase *)self _crapPath];
    [v16 writeToFile:v18 atomically:1 encoding:4 error:0];

    if (a3 == 14) {
      sqlite3_errcode(self->_db);
    }
  }

  uint64_t v19 = MEMORY[0x1E4F3A768];
  v20 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
  if (!v20)
  {
    QLTInitLogging();
    v20 = *(NSObject **)(v19 + 8);
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    db = self->_db;
    uint64_t v22 = v20;
    uint64_t v23 = sqlite3_errcode(db);
    char v24 = sqlite3_errmsg(self->_db);
    path = self->_path;
    *(_DWORD *)buf = 138413058;
    __int16 v28 = v8;
    __int16 v29 = 2048;
    uint64_t v30 = v23;
    __int16 v31 = 2080;
    uint64_t v32 = v24;
    __int16 v33 = 2112;
    v34 = path;
    _os_log_error_impl(&dword_1DDC5E000, v22, OS_LOG_TYPE_ERROR, "%@: %ld (%s) (database path: %@)", buf, 0x2Au);
  }
  [(QLSqliteDatabase *)self _databaseCorrupted];
}

- (id)lastCrapWithDate:(id *)a3
{
  uint64_t v4 = [(QLSqliteDatabase *)self _crapPath];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
    if ([v5 getResourceValue:a3 forKey:*MEMORY[0x1E4F1C530] error:0])
    {
      id v6 = [NSString stringWithContentsOfFile:v4 encoding:4 error:0];

      goto LABEL_6;
    }
  }
  id v6 = 0;
  *a3 = 0;
LABEL_6:

  return v6;
}

- (int64_t)lastInsertRowId
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  db = self->_db;
  return sqlite3_last_insert_rowid(db);
}

- (id)_cacheStatement:(sqlite3_stmt *)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [[QLSqliteDatabaseStatementWrapper alloc] initWithStatement:a3 key:v6 inUseTable:self->_statementsInUseTable];
  [(NSMutableDictionary *)self->_statementCache setObject:v7 forKey:v6];
  if ((unint64_t)[(NSMutableDictionary *)self->_statementCache count] >= 0x33)
  {
    uint64_t v8 = MEMORY[0x1E4F3A768];
    uint64_t v9 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
    if (!v9)
    {
      QLTInitLogging();
      uint64_t v9 = *(NSObject **)(v8 + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      statementCache = self->_statementCache;
      long long v11 = v9;
      uint64_t v12 = [(NSMutableDictionary *)statementCache count];
      uint64_t v13 = self->_statementCache;
      int v15 = 134218498;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "[Warning] We are caching too many statements (%lu), we are expecting to cache only a few (50 max). Cached statements: %@. Last statement cached: %@.", (uint8_t *)&v15, 0x20u);
    }
  }

  return v7;
}

- (void)checkpoint
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  *(void *)pnCkpt = 0;
  int v3 = sqlite3_wal_checkpoint_v2(self->_db, 0, 0, &pnCkpt[1], pnCkpt);
  uint64_t v4 = MEMORY[0x1E4F3A768];
  uint64_t v5 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
  if (!v5)
  {
    QLTInitLogging();
    uint64_t v5 = *(NSObject **)(v4 + 8);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = v5;
    id v7 = sqlite3_errstr(v3);
    *(_DWORD *)buf = 67109890;
    int v10 = v3;
    __int16 v11 = 2080;
    uint64_t v12 = v7;
    __int16 v13 = 1024;
    int v14 = pnCkpt[1];
    __int16 v15 = 1024;
    int v16 = pnCkpt[0];
    _os_log_debug_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_DEBUG, "called sqlite3_wal_checkpoint_v2(SQLITE_CHECKPOINT_PASSIVE) with result %d, %s, walframes=%d framesCheckpointed=%d", buf, 0x1Eu);
  }
}

- (void)bindBytes:(void *)a3 length:(unsigned int)a4 atIndex:(int)a5 inStatement:(sqlite3_stmt *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = sqlite3_bind_blob(a6, v7, a3, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v11) {
    [(QLSqliteDatabase *)self sqliteCrappedOut:v11, @"can't bind bytes (%d) at index %d", v8, v7 message];
  }
}

- (void)bindCFURL:(__CFURL *)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CFURLGetFileSystemRepresentation(a3, 1u, buffer, 1024))
  {
    int v9 = strlen((const char *)buffer);
    uint64_t v10 = sqlite3_bind_text(a5, v6, (const char *)buffer, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v10) {
      [(QLSqliteDatabase *)self sqliteCrappedOut:v10, @"can't bind %@ (= '%@') at index %d", objc_opt_class(), a3, v6 message];
    }
  }
  else
  {
    [(QLSqliteDatabase *)self sqliteCrappedOut:0, @"can't get FS representation for '%@'", a3, v11, v12 message];
  }
}

- (void)bindPath:(id)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a3;
  if (CFStringGetFileSystemRepresentation(v8, buffer, 1024))
  {
    int v9 = strlen(buffer);
    uint64_t v10 = sqlite3_bind_text(a5, v6, buffer, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = [(__CFString *)v8 description];
      [(QLSqliteDatabase *)self sqliteCrappedOut:v11, @"can't bind %@ (= '%@') at index %d", v12, v13, v6 message];
    }
  }
  else
  {
    [(QLSqliteDatabase *)self sqliteCrappedOut:0, @"can't get FS representation for '%@'", v8 message];
  }
}

- (int64_t)columnCount:(sqlite3_stmt *)a3
{
  return sqlite3_column_count(a3);
}

- (id)newColumnName:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v9 = (char *)sqlite3_column_name(a4, a3);
  if (v9)
  {
    int v9 = (char *)[[NSString alloc] initWithUTF8String:v9];
    if (v8)
    {
      uint64_t v10 = [v8 member:v9];
      uint64_t v11 = v10;
      if (v10)
      {
        uint64_t v12 = v10;

        int v9 = v12;
      }
      else
      {
        [v8 addObject:v9];
      }
    }
  }

  return v9;
}

- (__CFURL)newCFURLFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  result = (__CFURL *)sqlite3_column_text(a4, a3);
  if (result)
  {
    uint64_t v7 = result;
    size_t v8 = strlen((const char *)result);
    return CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)v7, v8, 0);
  }
  return result;
}

- (__CFString)newCFStringFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  queue = self->_queue;
  id v9 = a5;
  dispatch_assert_queue_V2(queue);
  id v10 = [(QLSqliteDatabase *)self newStringFromColumn:v6 inStatement:a4 uniqueInStringTable:v9];

  uint64_t v11 = (__CFString *)v10;
  return v11;
}

- (id)newPathFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = (char *)sqlite3_column_text(a4, a3);
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [v10 stringWithFileSystemRepresentation:v9 length:strlen(v9)];

    if (v8)
    {
      if (v9)
      {
        uint64_t v11 = [v8 member:v9];
        uint64_t v12 = v11;
        if (v11)
        {
          __int16 v13 = v11;

          id v9 = v13;
        }
        else
        {
          [v8 addObject:v9];
        }
      }
    }
  }

  return v9;
}

- (void)newBufferFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 length:(unsigned int *)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = sqlite3_column_blob(a4, a3);
  signed int v9 = sqlite3_column_bytes(a4, a3);
  if (a5) {
    *a5 = v9;
  }
  size_t v10 = v9;
  uint64_t v11 = malloc_type_malloc(v9, 0x7F551EEuLL);
  return memcpy(v11, v8, v10);
}

- (void)runStatement:(sqlite3_stmt *)a3 stepHandler:(id)a4
{
  uint64_t v6 = (unsigned int (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v7 = 0;
  if ([(QLSqliteDatabase *)self stepStatement:a3 didReturnData:&v7] && v7)
  {
    while ((!v6 || v6[2](v6))
         && [(QLSqliteDatabase *)self stepStatement:a3 didReturnData:&v7]
         && v7)
      ;
  }
  [(QLSqliteDatabase *)self resetStatement:a3 unbindValuesThroughIndex:0];
}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundObjects:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  uint64_t v11 = (uint64_t (**)(void))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v12 = [v10 count];
  v27 = v10;
  if (v10)
  {
    unsigned int v13 = v7 + 20;
    unint64_t v14 = v12;
    if (v12)
    {
      unint64_t v15 = 0;
      unint64_t v26 = v12;
      int v16 = v7;
      unsigned int v25 = v7;
      uint64_t v23 = v11 + 2;
      uint64_t v24 = v12;
      do
      {
        if (v7 > 0xFFFFFFEB)
        {
          uint64_t v21 = v7;
        }
        else
        {
          uint64_t v17 = 0;
          do
          {
            uint64_t v18 = v15 + v17;
            int v19 = v16 + v17;
            id v20 = objc_msgSend(v27, "objectAtIndex:", v15 + v17, v23, v24);
            [(QLSqliteDatabase *)self bindObject:v20 atIndex:(v16 + v17) inStatement:a3];

            ++v17;
          }
          while (v19 + 1 < v13 && v18 + 1 < v26);
          unint64_t v15 = (v15 + v17);
          uint64_t v21 = (v16 + v17);
          uint64_t v7 = v25;
          unint64_t v14 = v24;
        }
        if (v21 < v13)
        {
          do
          {
            -[QLSqliteDatabase bindObject:atIndex:inStatement:](self, "bindObject:atIndex:inStatement:", 0, v21, a3, v23, v24);
            uint64_t v21 = (v21 + 1);
          }
          while (v13 != v21);
        }
        char v28 = 0;
        while (-[QLSqliteDatabase stepStatement:didReturnData:](self, "stepStatement:didReturnData:", a3, &v28, v23, v24)&& v28)
        {
          if (v11 && (v11[2](v11) & 1) == 0)
          {
            [(QLSqliteDatabase *)self resetStatement:a3 unbindValuesThroughIndex:0];
            goto LABEL_21;
          }
        }
        [(QLSqliteDatabase *)self resetStatement:a3 unbindValuesThroughIndex:0];
      }
      while (v15 < v14);
    }
LABEL_21:
    if (v13 >= 2)
    {
      int v22 = -19;
      do
      {
        [(QLSqliteDatabase *)self bindObject:0 atIndex:(v22 + 20) inStatement:a3];
        ++v22;
      }
      while (v7 != v22);
    }
  }
  else
  {
    [(QLSqliteDatabase *)self runStatement:a3 stepHandler:v11];
  }
}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundRowIds:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v12 = a4;
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v12 count])
  {
    uint64_t v11 = malloc_type_calloc([v12 count], 8uLL, 0x100004000313F17uLL);
    objc_msgSend(v12, "getIndexes:maxCount:inIndexRange:", v11, objc_msgSend(v12, "count"), 0);
    -[QLSqliteDatabase runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:](self, "runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:", a3, v11, [v12 count], v7, v10);
    free(v11);
  }
  else
  {
    [(QLSqliteDatabase *)self runStatement:a3 stepHandler:v10];
  }
}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundNumbers:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v10 count])
  {
    id v12 = malloc_type_calloc([v10 count], 8uLL, 0x100004000313F17uLL);
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    int v15 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__QLSqliteDatabase_SqliteHelpers__runStatement_withBoundNumbers_startingAtIndex_stepHandler___block_invoke;
    v13[3] = &unk_1E6D0C5B0;
    v13[4] = v14;
    v13[5] = v12;
    [v10 enumerateObjectsUsingBlock:v13];
    -[QLSqliteDatabase runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:](self, "runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:", a3, v12, [v10 count], v7, v11);
    free(v12);
    _Block_object_dispose(v14, 8);
  }
  else
  {
    [(QLSqliteDatabase *)self runStatement:a3 stepHandler:v11];
  }
}

uint64_t __93__QLSqliteDatabase_SqliteHelpers__runStatement_withBoundNumbers_startingAtIndex_stepHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 unsignedLongLongValue];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  *(void *)(v4 + 8 * v6) = result;
  return result;
}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundRowIds:(unint64_t *)a4 count:(unint64_t)a5 startingAtIndex:(int)a6 stepHandler:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = (uint64_t (**)(void))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
  {
    unsigned int v13 = v7 + 20;
    if (a5)
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = v7;
        if (v7 <= 0xFFFFFFEB)
        {
          do
          {
            [(QLSqliteDatabase *)self bindUnsignedLongLong:a4[v14] atIndex:v15 inStatement:a3];
            uint64_t v15 = (v15 + 1);
            ++v14;
          }
          while (v15 < v13 && v14 < a5);
        }
        if (v15 < v13)
        {
          do
          {
            sqlite3_bind_null(a3, v15);
            LODWORD(v15) = v15 + 1;
          }
          while (v13 != v15);
        }
        char v17 = 0;
        while ([(QLSqliteDatabase *)self stepStatement:a3 didReturnData:&v17] && v17)
        {
          if (v12 && (v12[2](v12) & 1) == 0)
          {
            [(QLSqliteDatabase *)self resetStatement:a3 unbindValuesThroughIndex:0];
            goto LABEL_18;
          }
        }
        [(QLSqliteDatabase *)self resetStatement:a3 unbindValuesThroughIndex:0];
      }
      while (v14 < a5);
    }
LABEL_18:
    if (v13 >= 2)
    {
      int v16 = -19;
      do
      {
        sqlite3_bind_null(a3, v16 + 20);
        ++v16;
      }
      while (v7 != v16);
    }
  }
  else
  {
    [(QLSqliteDatabase *)self runStatement:a3 stepHandler:v12];
  }
}

- (void)setSqliteCacheSize:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 >= 1 && !self->_isCorrupted)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"pragma cache_size=%ld", a3);
    uint64_t v6 = MEMORY[0x1E4F3A768];
    uint64_t v7 = *(NSObject **)(MEMORY[0x1E4F3A768] + 8);
    if (!v7)
    {
      QLTInitLogging();
      uint64_t v7 = *(NSObject **)(v6 + 8);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[QLSqliteDatabase(SqliteHelpers) setSqliteCacheSize:]();
    }
    id v8 = v5;
    -[QLSqliteDatabase execute:](self, "execute:", [v8 UTF8String]);
  }
}

- (void)vacuum
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(QLSqliteDatabase *)self execute:"vacuum"];
}

void __23__QLSqliteDatabase_do___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_ERROR, "Exception executing database block: %@", v1, 0xCu);
}

- (void)openDatabaseAtPath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "failed to set journal mode to wal", v1, 2u);
}

@end