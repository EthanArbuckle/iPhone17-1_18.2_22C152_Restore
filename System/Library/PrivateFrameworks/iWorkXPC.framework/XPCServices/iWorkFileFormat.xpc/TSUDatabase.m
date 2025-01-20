@interface TSUDatabase
- (BOOL)_upgradeSchemaWithError:(id *)a3;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)compactWithError:(id *)a3;
- (BOOL)endSingleResultQuery:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5;
- (BOOL)executeUpdate:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5;
- (BOOL)executeUpdateWithSql:(const char *)a3 error:(id *)a4;
- (BOOL)needsUpgradeFromSchemaVersion:(int)a3;
- (BOOL)prepareStatement:(sqlite3_stmt *)a3 sql:(const char *)a4 error:(id *)a5;
- (BOOL)readonly;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)setSchemaVersion:(int)a3 error:(id *)a4;
- (BOOL)startSingleResultQuery:(sqlite3_stmt *)a3 error:(id *)a4;
- (BOOL)startSingleResultQuery:(sqlite3_stmt *)a3 shouldLogErrors:(BOOL)a4 error:(id *)a5;
- (BOOL)upgradeFromSchemaVersion:(int)a3 error:(id *)a4;
- (TSUDatabase)initWithPath:(id)a3 error:(id *)a4;
- (id)_initWithPath:(id)a3 readonly:(BOOL)a4 error:(id *)a5;
- (id)initReadonlyWithPath:(id)a3 error:(id *)a4;
- (sqlite3)_sqliteDatabase;
- (void)dealloc;
@end

@implementation TSUDatabase

- (TSUDatabase)initWithPath:(id)a3 error:(id *)a4
{
  return (TSUDatabase *)[(TSUDatabase *)self _initWithPath:a3 readonly:0 error:a4];
}

- (id)initReadonlyWithPath:(id)a3 error:(id *)a4
{
  return [(TSUDatabase *)self _initWithPath:a3 readonly:1 error:a4];
}

- (void)dealloc
{
  if (self->_db)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCFB0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166410();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(TSUDatabase *)NSString dealloc], 69, 0, "Database wasn't closed"");
    +[TSUAssertionHandler logBacktraceThrottled];
    [(TSUDatabase *)self closeWithError:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)TSUDatabase;
  [(TSUDatabase *)&v3 dealloc];
}

- (BOOL)compactWithError:(id *)a3
{
  return [(TSUDatabase *)self executeUpdateWithSql:"vacuum" error:a3];
}

- (BOOL)closeWithError:(id *)a3
{
  if (!self->_db) {
    return 1;
  }
  do
  {
    stmt = sqlite3_next_stmt(self->_db, 0);
    v6 = stmt;
    if (!stmt) {
      break;
    }
    uint64_t v7 = sqlite3_finalize(stmt);
  }
  while (TSUHandleSqlite(v7, a3, 1, self, v8, v9, @"Finalizing statement", v10, v16));
  uint64_t v11 = sqlite3_close(self->_db);
  BOOL result = TSUHandleSqlite(v11, a3, 1, self, v12, v13, @"Closing database", v14, v16);
  if (v6) {
    BOOL result = 0;
  }
  self->_db = 0;
  return result;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  BOOL v5 = [(TSUDatabase *)self prepareStatement:&self->_beginTransactionStatement sql:"begin exclusive" error:a3];
  if (v5)
  {
    beginTransactionStatement = self->_beginTransactionStatement;
    LOBYTE(v5) = [(TSUDatabase *)self executeUpdate:beginTransactionStatement shouldFinalize:0 error:a3];
  }
  return v5;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  BOOL v5 = [(TSUDatabase *)self prepareStatement:&self->_commitTransactionStatement sql:"commit" error:a3];
  if (v5)
  {
    commitTransactionStatement = self->_commitTransactionStatement;
    LOBYTE(v5) = [(TSUDatabase *)self executeUpdate:commitTransactionStatement shouldFinalize:0 error:a3];
  }
  return v5;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  BOOL v5 = [(TSUDatabase *)self prepareStatement:&self->_rollbackTransactionStatement sql:"rollback" error:a3];
  if (v5)
  {
    rollbackTransactionStatement = self->_rollbackTransactionStatement;
    LOBYTE(v5) = [(TSUDatabase *)self executeUpdate:rollbackTransactionStatement shouldFinalize:0 error:a3];
  }
  return v5;
}

- (BOOL)needsUpgradeFromSchemaVersion:(int)a3
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CCFD0);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100166520();
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(TSUDatabase *)NSString needsUpgradeFromSchemaVersion:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"], 124, 0, "Abstract method"");
  +[TSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (BOOL)upgradeFromSchemaVersion:(int)a3 error:(id *)a4
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CCFF0);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_1001665A8();
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUDatabase upgradeFromSchemaVersion:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"), 129, 0, "Abstract method");
  +[TSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (BOOL)setSchemaVersion:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a3 <= 0)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD010);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166630();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUDatabase setSchemaVersion:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"), 134, 0, "Use a positive version");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  return [(TSUDatabase *)self executeUpdateWithSql:[+[NSString stringWithFormat:@"pragma user_version = %d", v5] UTF8String] error:a4];
}

- (BOOL)prepareStatement:(sqlite3_stmt *)a3 sql:(const char *)a4 error:(id *)a5
{
  if (!self->_db)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD030);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001666B8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUDatabase prepareStatement:sql:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"), 142, 0, "Trying to use a closed database");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (*a3) {
    return 1;
  }
  uint64_t v10 = sqlite3_prepare_v2(self->_db, a4, -1, a3, 0);
  v15 = a4;
  BOOL v9 = 1;
  if (!TSUHandleSqlite(v10, a5, 1, self, v11, v12, @"Preparing SQL \"%s\"", v13, (uint64_t)v15))
  {
    sqlite3_finalize(*a3);
    BOOL v9 = 0;
    *a3 = 0;
  }
  return v9;
}

- (BOOL)executeUpdate:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD050);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166740();
    }
    v21 = "statement != NULL";
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUDatabase executeUpdate:shouldFinalize:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"), 161, 0, "Invalid parameter not satisfying: %{public}s");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (self->_readonly)
  {
    uint64_t v9 = 8;
  }
  else
  {
    uint64_t v9 = sqlite3_step(a3);
    if (v9 == 101)
    {
      char v10 = 1;
      goto LABEL_12;
    }
  }
  uint64_t v11 = sqlite3_sql(a3);
  TSUHandleSqlite(v9, a5, 1, self, v12, v13, @"Executing statement \"%s\"", v14, (uint64_t)v11);
  char v10 = 0;
LABEL_12:
  if (v6)
  {
    uint64_t v15 = sqlite3_finalize(a3);
    CFStringRef v19 = @"Finalizing statement";
  }
  else
  {
    uint64_t v15 = sqlite3_reset(a3);
    CFStringRef v19 = @"Resetting statement";
  }
  return v10 & TSUHandleSqlite(v15, a5, 1, self, v16, v17, (uint64_t)v19, v18, (uint64_t)v21);
}

- (BOOL)executeUpdateWithSql:(const char *)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  BOOL v6 = [(TSUDatabase *)self prepareStatement:&v8 sql:a3 error:a4];
  if (v6) {
    LOBYTE(v6) = [(TSUDatabase *)self executeUpdate:v8 shouldFinalize:1 error:a4];
  }
  return v6;
}

- (BOOL)startSingleResultQuery:(sqlite3_stmt *)a3 error:(id *)a4
{
  return [(TSUDatabase *)self startSingleResultQuery:a3 shouldLogErrors:1 error:a4];
}

- (BOOL)startSingleResultQuery:(sqlite3_stmt *)a3 shouldLogErrors:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD070);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001667DC();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUDatabase startSingleResultQuery:shouldLogErrors:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"), 199, 0, "Invalid parameter not satisfying: %{public}s", "statement != NULL");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v9 = sqlite3_step(a3);
  if (v9 != 100)
  {
    char v10 = sqlite3_sql(a3);
    TSUHandleSqlite(v9, a5, v6, self, v11, v12, @"Executing query and expecting exactly one row: \"%s\"", v13, (uint64_t)v10);
  }
  return v9 == 100;
}

- (BOOL)endSingleResultQuery:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD090);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166878();
    }
    v20 = "statement != NULL";
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUDatabase endSingleResultQuery:shouldFinalize:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"), 213, 0, "Invalid parameter not satisfying: %{public}s");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v9 = sqlite3_step(a3);
  if (v9 != 101)
  {
    char v10 = sqlite3_sql(a3);
    TSUHandleSqlite(v9, a5, 1, self, v11, v12, @"Executing statement \"%s\"", v13, (uint64_t)v10);
  }
  if (v6)
  {
    uint64_t v14 = sqlite3_finalize(a3);
    CFStringRef v18 = @"Finalizing statement";
  }
  else
  {
    uint64_t v14 = sqlite3_reset(a3);
    CFStringRef v18 = @"Resetting statement";
  }
  BOOL result = TSUHandleSqlite(v14, a5, 1, self, v15, v16, (uint64_t)v18, v17, (uint64_t)v20);
  if (v9 != 101) {
    return 0;
  }
  return result;
}

- (id)_initWithPath:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  uint64_t v5 = self;
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD0B0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166914();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUDatabase _initWithPath:readonly:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"), 247, 0, "No path");
    +[TSUAssertionHandler logBacktraceThrottled];
    goto LABEL_20;
  }
  BOOL v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TSUDatabase;
  uint64_t v9 = [(TSUDatabase *)&v23 init];
  uint64_t v5 = v9;
  if (v9)
  {
    v9->_readonly = v7;
    if (v7) {
      int v10 = 1;
    }
    else {
      int v10 = 6;
    }
    uint64_t v11 = sqlite3_open_v2((const char *)[a3 fileSystemRepresentation], &v9->_db, v10, 0);
    BOOL v15 = TSUHandleSqlite(v11, a5, 0, v5, v12, v13, @"Opening database", v14, (uint64_t)v23.receiver);
    db = v5->_db;
    if (!v15)
    {
      sqlite3_close(db);
      v5->_db = 0;
LABEL_20:

      return 0;
    }
    uint64_t v17 = sqlite3_extended_result_codes(db, 1);
    if (!TSUHandleSqlite(v17, a5, 0, v5, v18, v19, 0, v20, (uint64_t)v23.receiver)) {
      goto LABEL_19;
    }
    unsigned int v21 = [(TSUDatabase *)v5 _upgradeSchemaWithError:a5];
    if (!v7 && v21)
    {
      if ([(TSUDatabase *)v5 executeUpdateWithSql:"pragma fullfsync = true" error:a5]) {
        return v5;
      }
      goto LABEL_19;
    }
    if ((v7 & v21 & 1) == 0)
    {
LABEL_19:
      [(TSUDatabase *)v5 closeWithError:0];
      goto LABEL_20;
    }
  }
  return v5;
}

- (BOOL)_upgradeSchemaWithError:(id *)a3
{
  uint64_t v12 = 0;
  BOOL v5 = [(TSUDatabase *)self prepareStatement:&v12 sql:"pragma user_version" error:a3];
  if (v5)
  {
    BOOL v5 = [(TSUDatabase *)self startSingleResultQuery:v12 error:a3];
    if (v5)
    {
      uint64_t v6 = sqlite3_column_int(v12, 0);
      if ([(TSUDatabase *)self needsUpgradeFromSchemaVersion:v6] && self->_readonly)
      {
        +[TSUAssertionHandler _atomicIncrementAssertCount];
        if (TSUAssertCat_init_token != -1) {
          dispatch_once(&TSUAssertCat_init_token, &stru_1001CD0D0);
        }
        if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10016699C();
        }
        +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(TSUDatabase *)NSString _upgradeSchemaWithError:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUDatabase.m"], 302, 0, "Readonly database needs schema upgrade."");
        +[TSUAssertionHandler logBacktraceThrottled];
        TSUHandleSqlite(8, a3, 1, self, v7, v8, @"Readonly database needs schema upgrade.", v9, v11);
        LOBYTE(v5) = 0;
      }
      else
      {
        BOOL v5 = [(TSUDatabase *)self endSingleResultQuery:v12 shouldFinalize:1 error:a3];
        if (v5) {
          LOBYTE(v5) = [(TSUDatabase *)self upgradeFromSchemaVersion:v6 error:a3];
        }
      }
    }
  }
  return v5;
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (sqlite3)_sqliteDatabase
{
  return self->_db;
}

@end