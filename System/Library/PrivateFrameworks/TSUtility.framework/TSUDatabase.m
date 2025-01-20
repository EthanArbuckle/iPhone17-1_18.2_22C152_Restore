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
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSUDatabase dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 72, @"Database wasn't closed");
    [(TSUDatabase *)self closeWithError:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)TSUDatabase;
  [(TSUDatabase *)&v5 dealloc];
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
    v7 = stmt;
    if (!stmt) {
      break;
    }
    int v8 = sqlite3_finalize(stmt);
  }
  while (TSUHandleSqlite(v8, a3, self, a2, 98, @"Finalizing statement", v9, v10, v15));
  int v11 = sqlite3_close(self->_db);
  BOOL result = TSUHandleSqlite(v11, a3, self, a2, 101, @"Closing database", v12, v13, v15);
  if (v7) {
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
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUDatabase needsUpgradeFromSchemaVersion:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 137, @"Abstract method");
  return 0;
}

- (BOOL)upgradeFromSchemaVersion:(int)a3 error:(id *)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSUDatabase upgradeFromSchemaVersion:error:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 143, @"Abstract method");
  return 0;
}

- (BOOL)setSchemaVersion:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a3 <= 0)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSUDatabase setSchemaVersion:error:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 149, @"Use a positive version");
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"pragma user_version = %d", v5), "UTF8String");
  return [(TSUDatabase *)self executeUpdateWithSql:v9 error:a4];
}

- (BOOL)prepareStatement:(sqlite3_stmt *)a3 sql:(const char *)a4 error:(id *)a5
{
  if (!self->_db)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSUDatabase prepareStatement:sql:error:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 158, @"Trying to use a closed database");
  }
  if (*a3) {
    return 1;
  }
  int v12 = sqlite3_prepare_v2(self->_db, a4, -1, a3, 0);
  if (TSUHandleSqlite(v12, a5, self, a2, 164, @"Preparing SQL \"%s\"", v13, v14, (uint64_t)a4)) {
    return 1;
  }
  sqlite3_finalize(*a3);
  BOOL result = 0;
  *a3 = 0;
  return result;
}

- (BOOL)executeUpdate:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (!a3)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSUDatabase executeUpdate:shouldFinalize:error:]"];
    v26 = "statement != NULL";
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 182, @"Invalid parameter not satisfying: %s");
  }
  if (self->_readonly)
  {
    int v12 = 8;
  }
  else
  {
    int v12 = sqlite3_step(a3);
    if (v12 == 101)
    {
      char v13 = 1;
      goto LABEL_8;
    }
  }
  uint64_t v14 = sqlite3_sql(a3);
  TSUHandleSqlite(v12, a5, self, a2, 198, @"Executing statement \"%s\"", v15, v16, (uint64_t)v14);
  char v13 = 0;
LABEL_8:
  if (v6)
  {
    int v17 = sqlite3_finalize(a3);
    v20 = @"Finalizing statement";
    v21 = a5;
    v22 = self;
    v23 = a2;
    uint64_t v24 = 203;
  }
  else
  {
    int v17 = sqlite3_reset(a3);
    v20 = @"Resetting statement";
    v21 = a5;
    v22 = self;
    v23 = a2;
    uint64_t v24 = 207;
  }
  return v13 & TSUHandleSqlite(v17, v21, v22, v23, v24, (uint64_t)v20, v18, v19, (uint64_t)v26);
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
  if (!a3)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSUDatabase startSingleResultQuery:error:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 225, @"Invalid parameter not satisfying: %s", "statement != NULL");
  }
  int v10 = sqlite3_step(a3);
  if (v10 != 100)
  {
    uint64_t v11 = sqlite3_sql(a3);
    TSUHandleSqlite(v10, a4, self, a2, 233, @"Executing query and expecting exactly one row: \"%s\"", v12, v13, (uint64_t)v11);
  }
  return v10 == 100;
}

- (BOOL)endSingleResultQuery:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (!a3)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSUDatabase endSingleResultQuery:shouldFinalize:error:]"];
    v25 = "statement != NULL";
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 241, @"Invalid parameter not satisfying: %s");
  }
  int v12 = sqlite3_step(a3);
  if (v12 != 101)
  {
    uint64_t v13 = sqlite3_sql(a3);
    TSUHandleSqlite(v12, a5, self, a2, 248, @"Executing statement \"%s\"", v14, v15, (uint64_t)v13);
  }
  if (v6)
  {
    int v16 = sqlite3_finalize(a3);
    uint64_t v19 = @"Finalizing statement";
    v20 = a5;
    v21 = self;
    v22 = a2;
    uint64_t v23 = 253;
  }
  else
  {
    int v16 = sqlite3_reset(a3);
    uint64_t v19 = @"Resetting statement";
    v20 = a5;
    v21 = self;
    v22 = a2;
    uint64_t v23 = 257;
  }
  BOOL result = TSUHandleSqlite(v16, v20, v21, v22, v23, (uint64_t)v19, v17, v18, (uint64_t)v25);
  if (v12 != 101) {
    return 0;
  }
  return result;
}

- (id)_initWithPath:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  uint64_t v5 = self;
  if (!a3)
  {
    id v19 = +[TSUAssertionHandler currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSUDatabase _initWithPath:readonly:error:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 285, @"No path");
    goto LABEL_15;
  }
  BOOL v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TSUDatabase;
  id v10 = [(TSUDatabase *)&v22 init];
  uint64_t v5 = v10;
  if (v10)
  {
    v10->_readonly = v7;
    if (v7) {
      int v11 = 1;
    }
    else {
      int v11 = 6;
    }
    int v12 = sqlite3_open_v2((const char *)[a3 fileSystemRepresentation], &v10->_db, v11, 0);
    BOOL v15 = TSUHandleSqlite(v12, a5, v5, a2, 295, @"Opening database", v13, v14, (uint64_t)v22.receiver);
    if (v15)
    {
      int v16 = sqlite3_extended_result_codes(v5->_db, 1);
      BOOL v15 = TSUHandleSqlite(v16, a5, v5, a2, 297, 0, v17, v18, (uint64_t)v22.receiver);
      if (v15) {
        BOOL v15 = [(TSUDatabase *)v5 _upgradeSchemaWithError:a5];
      }
    }
    if (v7)
    {
LABEL_12:
      if (v15) {
        return v5;
      }
      goto LABEL_15;
    }
    if (v15)
    {
      LOBYTE(v15) = [(TSUDatabase *)v5 executeUpdateWithSql:"pragma fullfsync = true" error:a5];
      goto LABEL_12;
    }
LABEL_15:

    return 0;
  }
  return v5;
}

- (BOOL)_upgradeSchemaWithError:(id *)a3
{
  uint64_t v14 = 0;
  BOOL v6 = [(TSUDatabase *)self prepareStatement:&v14 sql:"pragma user_version" error:a3];
  if (v6)
  {
    BOOL v6 = [(TSUDatabase *)self startSingleResultQuery:v14 error:a3];
    if (v6)
    {
      uint64_t v7 = sqlite3_column_int(v14, 0);
      if ([(TSUDatabase *)self needsUpgradeFromSchemaVersion:v7] && self->_readonly)
      {
        id v8 = +[TSUAssertionHandler currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSUDatabase _upgradeSchemaWithError:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 338, @"Readonly database needs schema upgrade.");
        TSUHandleSqlite(8, a3, self, a2, 339, @"Readonly database needs schema upgrade.", v10, v11, v13);
        LOBYTE(v6) = 0;
      }
      else
      {
        BOOL v6 = [(TSUDatabase *)self endSingleResultQuery:v14 shouldFinalize:1 error:a3];
        if (v6) {
          LOBYTE(v6) = [(TSUDatabase *)self upgradeFromSchemaVersion:v7 error:a3];
        }
      }
    }
  }
  return v6;
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