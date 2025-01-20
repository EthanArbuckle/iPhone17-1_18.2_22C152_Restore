@interface _PASSqliteDatabase
+ (BOOL)contentProtectionTypeRequiresDeviceToBeUnlocked:(int64_t)a3;
+ (BOOL)contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:(int64_t)a3;
+ (BOOL)isInMemoryPath:(id)a3;
+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 contentProtection:(int64_t)a4 error:(id *)a5;
+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 contentProtection:(int64_t)a4 errorHandler:(id)a5 error:(id *)a6;
+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4;
+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4 errorHandler:(id)a5;
+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 flags:(int)a4 error:(id *)a5;
+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 errorHandler:(id)a6;
+ (id)corruptionMarkerPathForPath:(id)a3;
+ (id)inMemoryPath;
+ (id)initializeDatabase:(id)a3 withContentProtection:(int64_t)a4 newDatabaseCreated:(BOOL *)a5;
+ (id)initializeDatabase:(id)a3 withContentProtection:(int64_t)a4 newDatabaseCreated:(BOOL *)a5 errorHandler:(id)a6;
+ (id)initializeDatabase:(id)a3 withProtection:(BOOL)a4 newDatabaseCreated:(BOOL *)a5;
+ (id)protectedDatabaseWithFilename:(id)a3 error:(id *)a4;
+ (id)protectedDatabaseWithFilename:(id)a3 error:(id *)a4 errorHandler:(id)a5;
+ (id)randomlyNamedInMemoryPathWithBaseName:(id)a3;
+ (id)recreateCorruptDatabase:(id)a3 withContentProtection:(int64_t)a4;
+ (id)sqliteDatabaseInMemoryWithError:(id *)a3;
+ (id)sqliteDatabaseInMemoryWithError:(id *)a3 errorHandler:(id)a4;
+ (void)runDebugCommand:(const char *)a3 onDbWithHandle:(id)a4;
+ (void)truncateDatabaseAtPath:(id)a3;
- (BOOL)_isLikelySQLStatementContainedInString:(const char *)a3;
- (BOOL)createSnapshot:(id)a3;
- (BOOL)enableQueryPlanLoggingWithPath:(id)a3;
- (BOOL)frailReadTransaction:(id)a3;
- (BOOL)frailWriteTransaction:(id)a3;
- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6;
- (BOOL)hasColumnOnTable:(id)a3 named:(id)a4;
- (BOOL)hasIndexNamed:(id)a3;
- (BOOL)hasLockContention;
- (BOOL)hasTableNamed:(id)a3;
- (BOOL)isInMemory;
- (BOOL)prepAndRunNonDataQueries:(id)a3 onError:(id)a4;
- (BOOL)prepAndRunQuery:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6;
- (BOOL)prepQuery:(id)a3 onPrep:(id)a4 onError:(id)a5;
- (BOOL)runQuery:(id)a3 onRow:(id)a4;
- (BOOL)runQuery:(id)a3 onRow:(id)a4 onError:(id)a5;
- (BOOL)setUserVersion:(unsigned int)a3;
- (BOOL)vacuumWithShouldContinueBlock:(id)a3 error:(id *)a4;
- (NSString)filename;
- (_PASDBTransactionCompletion_)_transactionWithExclusivity:(BOOL)a3 transaction:(id)a4;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (_PASSqliteDatabase)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5;
- (_PASSqliteDatabase)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 errorHandler:(id)a6;
- (id)dbErrorWithCode:(unint64_t)a3 sqliteReturnValue:(int)a4 lastErrno:(int)a5 query:(id)a6;
- (id)description;
- (id)freeSpace;
- (id)languageForFTSTable:(id)a3;
- (id)selectColumns:(id)a3 fromTable:(id)a4 whereClause:(id)a5 onPrep:(id)a6 onError:(id)a7;
- (id)tablesWithColumnNamed:(id)a3;
- (int64_t)contentProtectionType;
- (int64_t)lastInsertRowId;
- (sqlite3)handle;
- (unint64_t)_pagesToVacuum;
- (unint64_t)numberOfRowsInTable:(id)a3;
- (unint64_t)valueForPragmaName:(id)a3;
- (unsigned)userVersion;
- (void)_logQueryPlanForQuery:(id)a3;
- (void)_prepAndRunQuery:(id)a3 columns:(id)a4 dictionary:(id)a5 onError:(id)a6;
- (void)_prepareForFirstQuery;
- (void)_txnBegin;
- (void)_txnBeginExclusive;
- (void)_txnEnd;
- (void)_txnRollback;
- (void)closePermanently;
- (void)dealloc;
- (void)disableQueryPlanLogging;
- (void)insertIntoTable:(id)a3 dictionary:(id)a4;
- (void)insertOrReplaceIntoTable:(id)a3 dictionary:(id)a4 onError:(id)a5;
- (void)placeCorruptionMarker;
- (void)readTransaction:(id)a3;
- (void)simulateOnDiskDatabase;
- (void)updateTable:(id)a3 dictionary:(id)a4 whereClause:(id)a5 onError:(id)a6;
- (void)withDbLockExecuteBlock:(id)a3;
- (void)writeTransaction:(id)a3;
@end

@implementation _PASSqliteDatabase

- (void)withDbLockExecuteBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  pthread_mutex_lock(&self->_lock);
  dispatch_group_leave((dispatch_group_t)self->_waitingForLock);
  statementCache = self->_statementCache;
  if (!statementCache)
  {
    v6 = (_PASSqliteStatementCache *)objc_opt_new();
    v7 = self->_statementCache;
    self->_statementCache = v6;
  }
  v8 = (void *)MEMORY[0x1A62450A0]();
  v4[2](v4);
  if (!statementCache)
  {
    v9 = self->_statementCache;
    if (v9)
    {
      for (uint64_t i = 0; i != 8; ++i)
      {
        sqlite3_finalize(v9->_cached[i]);
        v11 = v9->_associatedObjects[i];
        if (v11) {
          CFRelease(v11);
        }
      }
      v12 = self->_statementCache;
    }
    else
    {
      v12 = 0;
    }
    self->_statementCache = 0;
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)_prepareForFirstQuery
{
  if (!self->_preparedForFirstQuery)
  {
    self->_preparedForFirstQuery = 1;
    if (self->_isInMemory) {
      [(_PASSqliteDatabase *)self prepAndRunQuery:@"PRAGMA temp_store=MEMORY" onPrep:0 onRow:0 onError:&__block_literal_global_84];
    }
    db = self->_db;
    sqlite3_create_function(db, "_pas_block", -1, 526337, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sqliteBlockFunction, 0, 0);
  }
}

- (BOOL)_isLikelySQLStatementContainedInString:(const char *)a3
{
  char v3 = *a3;
  if (!*a3) {
    return 0;
  }
  v4 = a3 + 1;
  uint64_t v5 = MEMORY[0x1E4F14390];
  while (1)
  {
    if (v3 == 59) {
      goto LABEL_8;
    }
    if (v3 < 0) {
      break;
    }
    if ((*(_DWORD *)(v5 + 4 * v3 + 60) & 0x4000) == 0) {
      return 1;
    }
LABEL_8:
    int v6 = *(unsigned __int8 *)v4++;
    char v3 = v6;
    if (!v6) {
      return 0;
    }
  }
  if (__maskrune(v3, 0x4000uLL)) {
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)prepAndRunQuery:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  v14 = (void *)MEMORY[0x1A62450A0]();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59___PASSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke;
  v20[3] = &unk_1E5AEB7F8;
  id v15 = v11;
  v24 = &v25;
  v20[4] = self;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  BOOL v18 = [(_PASSqliteDatabase *)self prepQuery:v10 onPrep:v20 onError:v17];

  if (v18) {
    LOBYTE(v18) = *((unsigned char *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v25, 8);

  return v18;
}

- (BOOL)prepQuery:(id)a3 onPrep:(id)a4 onError:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_PASSqliteDatabase.m", 1198, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_PASSqliteDatabase.m", 1199, @"Invalid parameter not satisfying: %@", @"onPrep" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47___PASSqliteDatabase_prepQuery_onPrep_onError___block_invoke;
  v19[3] = &unk_1E5AEB7D0;
  v19[4] = self;
  id v12 = v9;
  id v23 = &v25;
  SEL v24 = a2;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v10;
  id v22 = v14;
  [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v19];
  char v15 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (BOOL)runQuery:(id)a3 onRow:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45___PASSqliteDatabase_runQuery_onRow_onError___block_invoke;
  v15[3] = &unk_1E5AEB780;
  id v11 = v8;
  id v20 = &v21;
  id v16 = v11;
  id v17 = self;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v15];
  LOBYTE(self) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)self;
}

- (void)_logQueryPlanForQuery:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44___PASSqliteDatabase__logQueryPlanForQuery___block_invoke;
  v6[3] = &unk_1E5AEB7A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v6];
}

- (void)_txnEnd
{
}

- (void)_txnBegin
{
}

- (void)_txnBeginExclusive
{
}

- (void)writeTransaction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39___PASSqliteDatabase_writeTransaction___block_invoke;
  v6[3] = &unk_1E5AEB870;
  id v7 = v4;
  id v5 = v4;
  [(_PASSqliteDatabase *)self frailWriteTransaction:v6];
}

- (void)readTransaction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38___PASSqliteDatabase_readTransaction___block_invoke;
  v6[3] = &unk_1E5AEB870;
  id v7 = v4;
  id v5 = v4;
  [(_PASSqliteDatabase *)self frailReadTransaction:v6];
}

- (BOOL)frailWriteTransaction:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44___PASSqliteDatabase_frailWriteTransaction___block_invoke;
  v7[3] = &unk_1E5AEB898;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = ([(_PASSqliteDatabase *)self writeTransactionWithFailableBlock:v7] & 1) == 0;

  return (char)self;
}

- (BOOL)frailReadTransaction:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43___PASSqliteDatabase_frailReadTransaction___block_invoke;
  v7[3] = &unk_1E5AEB898;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = ([(_PASSqliteDatabase *)self readTransactionWithFailableBlock:v7] & 1) == 0;

  return (char)self;
}

- (_PASDBTransactionCompletion_)_transactionWithExclusivity:(BOOL)a3 transaction:(id)a4
{
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2810000000;
  id v18 = "";
  char v19 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke;
  v10[3] = &unk_1E5AEB8C0;
  BOOL v14 = a3;
  id v12 = &v15;
  SEL v13 = a2;
  v10[4] = self;
  id v8 = v7;
  id v11 = v8;
  [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v10];
  LOBYTE(a2) = *((unsigned char *)v16 + 32);

  _Block_object_dispose(&v15, 8);
  return (_PASDBTransactionCompletion_)a2;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(_PASSqliteDatabase *)self _transactionWithExclusivity:0 transaction:a3];
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(_PASSqliteDatabase *)self _transactionWithExclusivity:1 transaction:a3];
}

- (void)placeCorruptionMarker
{
  if (![(_PASSqliteDatabase *)self isInMemory])
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "db corruption detected, leaving behind marker so we recover", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "db corruption detected, leaving behind marker so we recover", v6, 2u);
    }
    char v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = [(_PASSqliteDatabase *)self filename];
    id v5 = +[_PASSqliteDatabase corruptionMarkerPathForPath:v4];
    [v3 createFileAtPath:v5 contents:0 attributes:0];
  }
}

- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = [(_PASSqliteDatabase *)self dbErrorWithCode:a3 sqliteReturnValue:v7 lastErrno:0 query:a5];
  LOBYTE(v7) = [(_PASSqliteErrorHandlerProtocol *)self->_errorHandler handleSqliteError:v7 error:v11 onError:v10 db:self];

  return v7;
}

- (id)dbErrorWithCode:(unint64_t)a3 sqliteReturnValue:(int)a4 lastErrno:(int)a5 query:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  if ((unint64_t)[v10 length] >= 0x65)
  {
    id v11 = [v10 substringToIndex:100];
    uint64_t v12 = [v11 stringByAppendingString:@"..."];

    id v10 = (id)v12;
  }
  id v13 = [NSString alloc];
  BOOL v14 = sqlite3_errstr(v7);
  uint64_t v15 = (void *)[[NSString alloc] initWithUTF8String:sqlite3_errmsg(self->_db)];
  id v16 = (void *)[v13 initWithFormat:@"Error(%d %s): %@", v7, v14, v15];

  if (v10)
  {
    uint64_t v17 = [v16 stringByAppendingFormat:@" (SQL: %@)", v10];

    id v16 = (void *)v17;
  }
  if (a3 != 1 && !a5)
  {
    int v29 = 0;
    if (sqlite3_file_control(self->_db, 0, 4, &v29)) {
      goto LABEL_11;
    }
    a5 = v29;
  }
  if (a5)
  {
    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a5 userInfo:0];
    uint64_t v19 = [v16 stringByAppendingFormat:@". May be due to previous POSIX error %@", v18];

    id v16 = (void *)v19;
    goto LABEL_12;
  }
LABEL_11:
  id v18 = 0;
LABEL_12:
  id v20 = [(_PASSqliteDatabase *)self freeSpace];
  if (v20)
  {
    uint64_t v21 = objc_opt_new();
    [v21 setNumberStyle:1];
    [v21 setUsesGroupingSeparator:1];
    [v21 setGroupingSeparator:@","];
    [v21 setUsesSignificantDigits:1];
    [v21 setMinimumSignificantDigits:1];
    [v21 setMaximumSignificantDigits:1];
    id v22 = [v21 stringFromNumber:v20];
    uint64_t v23 = [v16 stringByAppendingFormat:@". Free space (rounded to 1 significant digit): %@ bytes", v22];

    id v16 = (void *)v23;
  }
  char v24 = objc_opt_new();
  uint64_t v25 = v24;
  if (v10) {
    [v24 setObject:v10 forKeyedSubscript:@"sql"];
  }
  if (v18) {
    [v25 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  [v25 setObject:v16 forKeyedSubscript:@"reason"];
  v26 = [NSNumber numberWithInt:v7];
  [v25 setObject:v26 forKeyedSubscript:@"sqliteCode"];

  uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_PASSqliteDatabaseError" code:a3 userInfo:v25];

  return v27;
}

- (id)freeSpace
{
  if (self->_transactionRolledback || [(_PASSqliteDatabase *)self isInMemory])
  {
    id v3 = 0;
    goto LABEL_4;
  }
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [(_PASSqliteDatabase *)self filename];
  uint64_t v16 = 0;
  uint64_t v7 = [v5 attributesOfFileSystemForPath:v6 error:&v16];
  uint64_t v8 = v16;

  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot calculate free space", buf, 2u);
    }
    id v3 = 0;
    goto LABEL_19;
  }
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      id v3 = 0;
      goto LABEL_18;
    }
    __int16 v14 = 0;
    id v10 = MEMORY[0x1E4F14500];
    id v11 = "Free space attribute is missing";
    uint64_t v12 = (uint8_t *)&v14;
LABEL_21:
    _os_log_error_impl(&dword_1A32C4000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    __int16 v13 = 0;
    id v10 = MEMORY[0x1E4F14500];
    id v11 = "Free space attribute is not an NSNumber";
    uint64_t v12 = (uint8_t *)&v13;
    goto LABEL_21;
  }
  id v3 = v9;
LABEL_18:

LABEL_19:
LABEL_4:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementCache, 0);
  objc_storeStrong((id *)&self->_explainedQueriesLogged, 0);
  objc_storeStrong((id *)&self->_explainedQueryForPlan, 0);
  objc_storeStrong((id *)&self->_waitingForLock, 0);
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_errorHandler, 0);
}

- (int64_t)contentProtectionType
{
  return self->_contentProtectionType;
}

- (BOOL)isInMemory
{
  return self->_isInMemory;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)disableQueryPlanLogging
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45___PASSqliteDatabase_disableQueryPlanLogging__block_invoke;
  v2[3] = &unk_1E5AEBE98;
  v2[4] = self;
  [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v2];
}

- (BOOL)enableQueryPlanLoggingWithPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_PASSqliteDatabase.m", 1790, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___PASSqliteDatabase_enableQueryPlanLoggingWithPath___block_invoke;
  v10[3] = &unk_1E5AEB9B0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  uint64_t v12 = &v13;
  [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v10];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)languageForFTSTable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__3452;
  uint64_t v15 = __Block_byref_object_dispose__3453;
  id v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42___PASSqliteDatabase_languageForFTSTable___block_invoke;
  v9[3] = &unk_1E5AEB938;
  id v5 = v4;
  id v10 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42___PASSqliteDatabase_languageForFTSTable___block_invoke_2;
  v8[3] = &unk_1E5AEB730;
  v8[4] = &v11;
  [(_PASSqliteDatabase *)self prepAndRunQuery:@"SELECT sql FROM sqlite_master WHERE type='table' AND name=:table" onPrep:v9 onRow:v8 onError:&__block_literal_global_271];
  if ([(id)v12[5] isEqualToString:&stru_1EF678A50]) {
    id v6 = 0;
  }
  else {
    id v6 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (BOOL)hasLockContention
{
  return dispatch_group_wait((dispatch_group_t)self->_waitingForLock, 0) != 0;
}

- (unint64_t)numberOfRowsInTable:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [@"SELECT count(*) FROM " stringByAppendingString:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke;
  v11[3] = &unk_1E5AEB730;
  v11[4] = &v12;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke_2;
  v9[3] = &unk_1E5AEB988;
  id v6 = v4;
  id v10 = v6;
  [(_PASSqliteDatabase *)self prepAndRunQuery:v5 onPrep:0 onRow:v11 onError:v9];

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)hasIndexNamed:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36___PASSqliteDatabase_hasIndexNamed___block_invoke;
  v8[3] = &unk_1E5AEB938;
  id v5 = v4;
  id v9 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36___PASSqliteDatabase_hasIndexNamed___block_invoke_2;
  v7[3] = &unk_1E5AEB730;
  void v7[4] = &v10;
  [(_PASSqliteDatabase *)self prepAndRunQuery:@"SELECT name FROM sqlite_master WHERE type='index' AND name=?" onPrep:v8 onRow:v7 onError:0];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)hasColumnOnTable:(id)a3 named:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"pragma table_info(%@)", v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45___PASSqliteDatabase_hasColumnOnTable_named___block_invoke;
  v11[3] = &unk_1E5AEB960;
  id v9 = v7;
  id v12 = v9;
  char v13 = &v14;
  [(_PASSqliteDatabase *)self prepAndRunQuery:v8 onPrep:0 onRow:v11 onError:0];

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

- (id)tablesWithColumnNamed:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3452;
  char v17 = __Block_byref_object_dispose__3453;
  id v18 = (id)objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke;
  v11[3] = &unk_1E5AEB938;
  id v12 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke_2;
  v8[3] = &unk_1E5AEB960;
  uint64_t v10 = &v13;
  id v5 = v12;
  id v9 = v5;
  [(_PASSqliteDatabase *)self prepAndRunQuery:@"SELECT name FROM sqlite_master WHERE type='table' AND (sql LIKE ? OR sql LIKE ?)" onPrep:v11 onRow:v8 onError:0];
  id v6 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v6;
}

- (BOOL)hasTableNamed:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36___PASSqliteDatabase_hasTableNamed___block_invoke;
  v8[3] = &unk_1E5AEB938;
  id v5 = v4;
  id v9 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36___PASSqliteDatabase_hasTableNamed___block_invoke_2;
  v7[3] = &unk_1E5AEB730;
  void v7[4] = &v10;
  [(_PASSqliteDatabase *)self prepAndRunQuery:@"SELECT name FROM sqlite_master WHERE type='table' AND name=?" onPrep:v8 onRow:v7 onError:0];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)setUserVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Setting user_version to: %u", buf, 8u);
  }
  *(void *)buf = 0;
  uint64_t v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA user_version = %u", v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37___PASSqliteDatabase_setUserVersion___block_invoke;
  v8[3] = &unk_1E5AEB910;
  int v9 = v3;
  void v8[4] = buf;
  [(_PASSqliteDatabase *)self prepAndRunQuery:v5 onPrep:0 onRow:0 onError:v8];

  uint8_t v6 = v11[24];
  _Block_object_dispose(buf, 8);
  return v6;
}

- (unsigned)userVersion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___PASSqliteDatabase_userVersion__block_invoke;
  v5[3] = &unk_1E5AEB730;
  v5[4] = &v6;
  [(_PASSqliteDatabase *)self prepAndRunQuery:@"PRAGMA user_version" onPrep:0 onRow:v5 onError:&__block_literal_global_234];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v4 = *((_DWORD *)v7 + 6);
    *(_DWORD *)buf = 67109120;
    int v11 = v4;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Returning user_version of: %u", buf, 8u);
  }
  unsigned int v2 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)createSnapshot:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_PASSqliteDatabase.m", 1531, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];
  }
  ppDb = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v20) = 138412290;
    *(void *)((char *)&v20 + 4) = v5;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "opening to backup: %@", (uint8_t *)&v20, 0xCu);
  }
  *(void *)&long long v20 = 0;
  *((void *)&v20 + 1) = &v20;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  id v6 = v5;
  int v22 = sqlite3_open_v2((const char *)[v6 UTF8String], &ppDb, 327686, 0);
  if (*(_DWORD *)(*((void *)&v20 + 1) + 24))
  {
    BOOL v7 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to open sqlite3 backup file \"%@\".", (uint8_t *)&buf, 0xCu);
      BOOL v7 = 0;
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37___PASSqliteDatabase_createSnapshot___block_invoke;
    v11[3] = &unk_1E5AEB8E8;
    void v11[4] = self;
    p_long long buf = &buf;
    uint64_t v14 = &v20;
    uint64_t v15 = ppDb;
    id v8 = v6;
    id v12 = v8;
    [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v11];
    BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "closing backup db: %@", (uint8_t *)&buf, 0xCu);
    }
    sqlite3_close(ppDb);
  }
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"[%@: %@ <%p>]", v5, self->_filename, self->_db];

  return v6;
}

- (void)_txnRollback
{
}

- (id)selectColumns:(id)a3 fromTable:(id)a4 whereClause:(id)a5 onPrep:(id)a6 onError:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (objc_class *)NSString;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = [v14 alloc];
  char v19 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @", ");
  long long v20 = (void *)[v18 initWithFormat:@"SELECT %@ FROM %@", v19, v17];

  if (v13)
  {
    uint64_t v21 = (void *)[[NSString alloc] initWithFormat:@" WHERE %@", v13];
    uint64_t v22 = [v20 stringByAppendingString:v21];

    long long v20 = (void *)v22;
  }
  uint64_t v23 = objc_opt_new();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __73___PASSqliteDatabase_selectColumns_fromTable_whereClause_onPrep_onError___block_invoke;
  v29[3] = &unk_1E5AEB848;
  id v30 = v12;
  id v24 = v23;
  id v31 = v24;
  id v25 = v12;
  [(_PASSqliteDatabase *)self prepAndRunQuery:v20 onPrep:v16 onRow:v29 onError:v15];

  v26 = v31;
  id v27 = v24;

  return v27;
}

- (void)insertIntoTable:(id)a3 dictionary:(id)a4
{
  id v16 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1A62450A0]();
  int v9 = [v7 allKeys];
  if (![v9 count])
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_PASSqliteDatabase.m" lineNumber:1350 description:@"insertIntoTable:dictionary: requires nonempty dictionary"];
  }
  uint64_t v10 = (void *)MEMORY[0x1A62450A0]();
  id v11 = [NSString alloc];
  id v12 = objc_msgSend(v9, "_pas_componentsJoinedByString:", @",");
  id v13 = _PASQMarksSeparatedByCommas([v9 count]);
  uint64_t v14 = (void *)[v11 initWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)", v16, v12, v13];

  [(_PASSqliteDatabase *)self _prepAndRunQuery:v14 columns:v9 dictionary:v7 onError:0];
}

- (void)insertOrReplaceIntoTable:(id)a3 dictionary:(id)a4 onError:(id)a5
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1A62450A0]();
  id v12 = [v9 allKeys];
  if (![v12 count])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_PASSqliteDatabase.m" lineNumber:1340 description:@"insertOrReplaceIntoTable:dictionary: requires nonempty dictionary"];
  }
  id v13 = (void *)MEMORY[0x1A62450A0]();
  id v14 = [NSString alloc];
  id v15 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @",");
  id v16 = _PASQMarksSeparatedByCommas([v12 count]);
  id v17 = (void *)[v14 initWithFormat:@"INSERT OR REPLACE INTO %@ (%@) VALUES (%@)", v19, v15, v16];

  [(_PASSqliteDatabase *)self _prepAndRunQuery:v17 columns:v12 dictionary:v9 onError:v10];
}

- (void)updateTable:(id)a3 dictionary:(id)a4 whereClause:(id)a5 onError:(id)a6
{
  id v24 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1A62450A0]();
  id v15 = [v11 allKeys];
  if (![v15 count])
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"_PASSqliteDatabase.m" lineNumber:1328 description:@"updateTable:dictionary:whereClause: requires nonempty dictionary"];
  }
  id v16 = (void *)MEMORY[0x1A62450A0]();
  id v17 = [NSString alloc];
  id v18 = objc_msgSend(v15, "_pas_componentsJoinedByString:", @"=?,");
  uint64_t v19 = [v18 stringByAppendingString:@"=?"];
  long long v20 = (void *)v19;
  if (v12)
  {
    uint64_t v21 = [@" WHERE " stringByAppendingString:v12];
    uint64_t v22 = (void *)[v17 initWithFormat:@"UPDATE %@ SET %@%@", v24, v20, v21];
  }
  else
  {
    uint64_t v22 = (void *)[v17 initWithFormat:@"UPDATE %@ SET %@%@", v24, v19, &stru_1EF678A50];
  }

  [(_PASSqliteDatabase *)self _prepAndRunQuery:v22 columns:v15 dictionary:v11 onError:v13];
}

- (BOOL)prepAndRunNonDataQueries:(id)a3 onError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!-[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", *(void *)(*((void *)&v15 + 1) + 8 * i), 0, 0, v7, (void)v15))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (void)_prepAndRunQuery:(id)a3 columns:(id)a4 dictionary:(id)a5 onError:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66___PASSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke;
  v14[3] = &unk_1E5AEB820;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(_PASSqliteDatabase *)self prepAndRunQuery:a3 onPrep:v14 onRow:0 onError:a6];
}

- (BOOL)runQuery:(id)a3 onRow:(id)a4
{
  return [(_PASSqliteDatabase *)self runQuery:a3 onRow:a4 onError:0];
}

- (sqlite3)handle
{
  return self->_db;
}

- (BOOL)vacuumWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = (uint64_t (**)(void))a3;
  unint64_t v6 = [(_PASSqliteDatabase *)self _pagesToVacuum];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: called to vacuum %tu pages.", buf, 0xCu);
  }
  if (v5)
  {
    if ((v5[2](v5) & 1) == 0) {
      goto LABEL_51;
    }
    unint64_t v7 = [(_PASSqliteDatabase *)self valueForPragmaName:@"auto_vacuum"];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || !v5[2](v5)) {
      goto LABEL_51;
    }
  }
  else
  {
    unint64_t v7 = [(_PASSqliteDatabase *)self valueForPragmaName:@"auto_vacuum"];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_51;
    }
  }
  if (v7 != 2)
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__3452;
    id v27 = __Block_byref_object_dispose__3453;
    id v28 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke;
    v23[3] = &unk_1E5AEB6B0;
    v23[4] = buf;
    if (![(_PASSqliteDatabase *)self prepAndRunNonDataQueries:&unk_1EF6839A8 onError:v23])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v24 = 138412290;
        uint64_t v25 = v18;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: failed to set auto_vacuum to INCREMENTAL for db: %@", v24, 0xCu);
      }
      if (a4) {
        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_51;
    }
    _Block_object_dispose(buf, 8);
  }
  if (v5 && !v5[2](v5))
  {
LABEL_51:
    BOOL v15 = 0;
    goto LABEL_52;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v8 = [NSNumber numberWithUnsignedInteger:(v6 + 499) / 0x1F4];
      *(_DWORD *)long long buf = 134218498;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = self;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: performing INCREMENTAL VACUUM to free %lu pages with %@ iterations for db: %@", buf, 0x20u);
    }
    if (v6 + 499 >= 0x1F4)
    {
      uint64_t v9 = 0;
      if ((v6 + 499) / 0x1F4 <= 1) {
        unint64_t v10 = 1;
      }
      else {
        unint64_t v10 = (v6 + 499) / 0x1F4;
      }
      id v11 = MEMORY[0x1E4F14500];
      unint64_t v12 = v6;
      while (!v5 || v5[2](v5))
      {
        if (v12 >= 0x1F4) {
          uint64_t v13 = 500;
        }
        else {
          uint64_t v13 = v12;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134218496;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v9;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v6;
          _os_log_impl(&dword_1A32C4000, v11, OS_LOG_TYPE_INFO, "Performing incremental vacuum for %tu pages on iteration %d for total pages to free %tu", buf, 0x1Cu);
        }
        id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA incremental_vacuum(%lu)", v13);
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy__3452;
        id v27 = __Block_byref_object_dispose__3453;
        id v28 = 0;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_125;
        v21[3] = &unk_1E5AEB6B0;
        v21[4] = buf;
        if (![(_PASSqliteDatabase *)self prepAndRunQuery:v14 onPrep:0 onRow:0 onError:v21])
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)id v24 = 138412290;
            uint64_t v25 = v16;
            _os_log_error_impl(&dword_1A32C4000, v11, OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: failed to incrementally vacuum: %@", v24, 0xCu);
          }
          if (a4) {
            *a4 = *(id *)(*(void *)&buf[8] + 40);
          }
        }
        _Block_object_dispose(buf, 8);

        v12 -= v13;
        ++v9;
        BOOL v15 = 1;
        if (v10 == v9) {
          goto LABEL_52;
        }
      }
      goto LABEL_51;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: performing FULL VACUUM to make INCREMENTAL effected.", buf, 2u);
    }
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__3452;
    id v27 = __Block_byref_object_dispose__3453;
    id v28 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_121;
    v22[3] = &unk_1E5AEB6B0;
    v22[4] = buf;
    if (![(_PASSqliteDatabase *)self prepAndRunNonDataQueries:&unk_1EF6839C0 onError:v22])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v24 = 138412290;
        uint64_t v25 = v19;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: failed to set auto_vacuum to INCREMENTAL for db: %@", v24, 0xCu);
      }
      if (a4) {
        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_51;
    }
    _Block_object_dispose(buf, 8);
  }
  BOOL v15 = 1;
LABEL_52:

  return v15;
}

- (unint64_t)_pagesToVacuum
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_PASSqliteDatabase *)self valueForPragmaName:@"page_count"];
  unint64_t v4 = [(_PASSqliteDatabase *)self valueForPragmaName:@"freelist_count"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v6 = 134218240;
    unint64_t v7 = v3;
    __int16 v8 = 2048;
    unint64_t v9 = v4;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: calculating pages to vacuum -- pageCount %tu freeCount %tu", (uint8_t *)&v6, 0x16u);
  }
  unint64_t result = 0;
  if (v4)
  {
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t result = 0;
      if (v3)
      {
        if (v3 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((double)(v3 - v4) / (double)v3 <= 0.85 || v4 > 0x3FF)
          {
            return (unint64_t)((double)v4 * 0.8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v6 = 134218240;
              unint64_t v7 = v3;
              __int16 v8 = 2048;
              unint64_t v9 = v4;
              _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "not enough pages to vacuum: pageCount: %lu; freeCount: %lu",
                (uint8_t *)&v6,
                0x16u);
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (unint64_t)valueForPragmaName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v5 = (void *)[[NSString alloc] initWithFormat:@"PRAGMA %@", v4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41___PASSqliteDatabase_valueForPragmaName___block_invoke;
  v12[3] = &unk_1E5AEB730;
  v12[4] = &v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41___PASSqliteDatabase_valueForPragmaName___block_invoke_2;
  v9[3] = &unk_1E5AEB758;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v13;
  [(_PASSqliteDatabase *)self prepAndRunQuery:v5 onPrep:0 onRow:v12 onError:v9];

  unint64_t v7 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (int64_t)lastInsertRowId
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37___PASSqliteDatabase_lastInsertRowId__block_invoke;
  v4[3] = &unk_1E5AEB708;
  v4[4] = self;
  v4[5] = &v5;
  [(_PASSqliteDatabase *)self withDbLockExecuteBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)simulateOnDiskDatabase
{
  self->_isInMemory = 0;
}

- (void)closePermanently
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((atomic_exchange(&self->_isClosed._Value, 1u) & 1) == 0)
  {
    pthread_mutex_destroy(&self->_lock);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v7 = self;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "closing %@", buf, 0xCu);
    }
    uint64_t v3 = sqlite3_close(self->_db);
    if (v3)
    {
      uint64_t v4 = v3;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v7) = v4;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "sqlite3_close returned %d", buf, 8u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"sqlite3_close returned %d", v4);
    }
    ITSCollationContextFreeContextForDatabaseHandle();
    self->_db = 0;
    explainedQueriesLogFile = self->_explainedQueriesLogFile;
    if (explainedQueriesLogFile)
    {
      fclose(explainedQueriesLogFile);
      self->_explainedQueriesLogFile = 0;
    }
  }
}

- (void)dealloc
{
  [(_PASSqliteDatabase *)self closePermanently];
  v3.receiver = self;
  v3.super_class = (Class)_PASSqliteDatabase;
  [(_PASSqliteDatabase *)&v3 dealloc];
}

- (_PASSqliteDatabase)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unint64_t v9 = objc_opt_new();
  id v10 = [(_PASSqliteDatabase *)self initWithFilename:v8 flags:v6 error:a5 errorHandler:v9];

  return v10;
}

- (_PASSqliteDatabase)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 errorHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  if (!v12)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"_PASSqliteDatabase.m", 662, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];
  }
  v44.receiver = self;
  v44.super_class = (Class)_PASSqliteDatabase;
  id v14 = [(_PASSqliteDatabase *)&v44 init];
  if (!v14) {
    goto LABEL_32;
  }
  if (v13) {
    uint64_t v15 = (_PASSqliteErrorHandlerProtocol *)v13;
  }
  else {
    uint64_t v15 = (_PASSqliteErrorHandlerProtocol *)objc_opt_new();
  }
  errorHandler = v14->_errorHandler;
  v14->_errorHandler = v15;

  v14->_isInMemory = +[_PASSqliteDatabase isInMemoryPath:v12];
  objc_storeStrong((id *)&v14->_filename, a3);
  int v17 = a4 & 0x700000;
  if ((a4 & 0x700000) == 0x300000)
  {
    uint64_t v18 = 3;
  }
  else if (v17 == 0x200000)
  {
    uint64_t v18 = 2;
  }
  else
  {
    uint64_t v18 = v17 == 0x100000;
  }
  v14->_contentProtectionType = v18;
  v49.__sig = 0;
  *(void *)v49.__opaque = 0;
  pthread_mutexattr_init(&v49);
  pthread_mutexattr_settype(&v49, 2);
  pthread_mutex_init(&v14->_lock, &v49);
  pthread_mutexattr_destroy(&v49);
  dispatch_group_t v19 = dispatch_group_create();
  waitingForLock = v14->_waitingForLock;
  v14->_waitingForLock = (OS_dispatch_group *)v19;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    v48[0] = v12;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "opening %@", buf, 0xCu);
  }
  id v21 = v12;
  p_db = &v14->_db;
  uint64_t v23 = sqlite3_open_v2((const char *)[v21 UTF8String], &v14->_db, a4, 0);
  if (!v23)
  {
    getpid();
    if (sandbox_check())
    {
      id v26 = v21;
      if (access((const char *)[v26 UTF8String], 2)) {
        chmod((const char *)[v26 UTF8String], 0x180u);
      }
    }
    ITSRegisterSQLiteICUTokenizer();
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __64___PASSqliteDatabase_initWithFilename_flags_error_errorHandler___block_invoke;
    v42 = &unk_1E5AEBE98;
    v43 = v14;
    id v27 = (void (**)(void))MEMORY[0x1A6245320](&v39);
    uint64_t busy = sqlite3_busy_timeout(v14->_db, 300000);
    if (busy)
    {
      uint64_t v29 = busy;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v48[0]) = v29;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Sqlite could not install busy timeout. (rc = %i)", buf, 8u);
        if (!a5) {
          goto LABEL_25;
        }
      }
      else if (!a5)
      {
LABEL_25:
        v27[2](v27);

        goto LABEL_26;
      }
      id v30 = (void *)MEMORY[0x1E4F28C58];
      v45 = @"sqliteCode";
      id v31 = [NSNumber numberWithInt:v29];
      v46 = v31;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      *a5 = [v30 errorWithDomain:@"_PASSqliteDatabaseError" code:2 userInfo:v32];

      goto LABEL_25;
    }
    sqlite3_extended_result_codes(*p_db, 1);
    int v34 = sqlite3_db_config(*p_db, 1001, 0, 96, 64, v39, v40, v41, v42);
    if (v34)
    {
      int v35 = v34;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v48[0]) = v35;
        _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Error setting lookaside size. (rc = %i)", buf, 8u);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
    }
    _pas_registerSqliteCollections(*p_db);

LABEL_32:
    v33 = v14;
    goto LABEL_33;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *__error();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v37 = sqlite3_extended_errcode(*p_db);
    *(_DWORD *)long long buf = 67109376;
    LODWORD(v48[0]) = v24;
    WORD2(v48[0]) = 1024;
    *(_DWORD *)((char *)v48 + 6) = v37;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Sqlite didn't open (rc = %d, extended result code = %d)", buf, 0xEu);
    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  if (a5)
  {
LABEL_17:
    *a5 = [(_PASSqliteDatabase *)v14 dbErrorWithCode:1 sqliteReturnValue:v24 lastErrno:v25 query:0];
  }
LABEL_26:
  v33 = 0;
LABEL_33:

  return v33;
}

+ (id)corruptionMarkerPathForPath:(id)a3
{
  return (id)[a3 stringByAppendingString:@"._PAS_db_corruption_marker"];
}

+ (void)runDebugCommand:(const char *)a3 onDbWithHandle:(id)a4
{
  uint64_t v5 = (sqlite3 *)[a4 handle];
  if (v5)
  {
    errmsg = 0;
    char v7 = 0;
    if (sqlite3_exec(v5, a3, (int (__cdecl *)(void *, int, char **, char **))runDebugCommandCallback, &v7, &errmsg)) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "error running SQL: %s\n", errmsg);
    }
  }
  else
  {
    uint64_t v6 = (FILE *)*MEMORY[0x1E4F143C8];
    fwrite("error: no handle found\n", 0x17uLL, 1uLL, v6);
  }
}

+ (void)truncateDatabaseAtPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  ppDb = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)int v17 = v3;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "opening to truncate: %@", buf, 0xCu);
  }
  id v4 = v3;
  int v5 = sqlite3_open_v2((const char *)[v4 UTF8String], &ppDb, 65538, 0);
  if (v5) {
    goto LABEL_7;
  }
  int v14 = 141;
  int v6 = sqlite3_file_control(ppDb, 0, 101, &v14);
  if (v6)
  {
    int v5 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v13 = sqlite3_errmsg(ppDb);
      *(_DWORD *)long long buf = 138412802;
      *(void *)int v17 = v4;
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = v5;
      __int16 v18 = 2080;
      dispatch_group_t v19 = v13;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not truncate sqlite file at %@: rc=%i: %s", buf, 0x1Cu);
    }
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      char v7 = sqlite3_errmsg(ppDb);
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)int v17 = v5;
      *(_WORD *)&v17[4] = 2080;
      *(void *)&v17[6] = v7;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Truncating database failed (rc=%i). Doing unsafe deletion via filesystem: %s", buf, 0x12u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)int v17 = v4;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "closing db after failed truncation: %@", buf, 0xCu);
    }
    sqlite3_close(ppDb);
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 removeItemAtPath:v4 error:0];

    unint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = [v4 stringByAppendingString:@"-shm"];
    [v9 removeItemAtPath:v10 error:0];

    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = [v4 stringByAppendingString:@"-wal"];
    [v11 removeItemAtPath:v12 error:0];

    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)int v17 = v4;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Sqlite file truncated: %@", buf, 0xCu);
  }
  sqlite3_close(ppDb);
LABEL_12:
}

+ (id)randomlyNamedInMemoryPathWithBaseName:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F29128];
  id v4 = a3;
  int v5 = [v3 UUID];
  int v6 = [v5 UUIDString];

  char v7 = [@"file:" stringByAppendingString:v4];

  id v8 = [v7 stringByAppendingString:v6];
  unint64_t v9 = [v8 stringByAppendingString:@"?mode=memory&cache=shared"];

  return v9;
}

+ (id)inMemoryPath
{
  return @":memory:";
}

+ (BOOL)isInMemoryPath:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@":memory:"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsString:@"mode=memory"];
  }

  return v4;
}

+ (id)protectedDatabaseWithFilename:(id)a3 error:(id *)a4
{
  return +[_PASSqliteDatabase protectedDatabaseWithFilename:a3 error:a4 errorHandler:0];
}

+ (id)protectedDatabaseWithFilename:(id)a3 error:(id *)a4 errorHandler:(id)a5
{
  return (id)[a1 sqliteDatabaseWithFilename:a3 contentProtection:1 errorHandler:a5 error:a4];
}

+ (id)sqliteDatabaseInMemoryWithError:(id *)a3
{
  return +[_PASSqliteDatabase sqliteDatabaseInMemoryWithError:a3 errorHandler:0];
}

+ (id)sqliteDatabaseInMemoryWithError:(id *)a3 errorHandler:(id)a4
{
  id v5 = a4;
  int v6 = [[_PASSqliteDatabase alloc] initWithFilename:@":memory:" flags:327686 error:a3 errorHandler:v5];

  return v6;
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 contentProtection:(int64_t)a4 error:(id *)a5
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:a3 contentProtection:a4 errorHandler:0 error:a5];
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 contentProtection:(int64_t)a4 errorHandler:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  id v11 = [_PASSqliteDatabase alloc];
  if ((unint64_t)(a4 - 1) >= 3) {
    uint64_t v12 = 327686;
  }
  else {
    uint64_t v12 = (((a4 - 1) << 20) | 0x50006u) + 0x100000;
  }
  id v13 = [(_PASSqliteDatabase *)v11 initWithFilename:v10 flags:v12 error:a6 errorHandler:v9];

  return v13;
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:a3 error:a4 errorHandler:0];
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4 errorHandler:(id)a5
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:a3 contentProtection:3 errorHandler:a5 error:a4];
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 flags:(int)a4 error:(id *)a5
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:a3 flags:*(void *)&a4 error:a5 errorHandler:0];
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 errorHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a3;
  id v11 = [[_PASSqliteDatabase alloc] initWithFilename:v10 flags:v7 error:a5 errorHandler:v9];

  return v11;
}

+ (id)recreateCorruptDatabase:(id)a3 withContentProtection:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a1 contentProtectionTypeRequiresDeviceToBeUnlocked:a4])
  {
    uint64_t v7 = +[_PASDatabaseJournal journalWithDbPath:v6];
    [v7 deleteAllJournaledQueries];
  }
  if (+[_PASDeviceInfo isInternalBuild])
  {
    id v8 = [NSString alloc];
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSince1970];
    id v11 = (void *)[v8 initWithFormat:@"%@.corrupted.%ld", v6, (uint64_t)v10];

    moveOrRemoveDbFile(v6, v11);
    uint64_t v12 = [v6 stringByAppendingString:@"-shm"];
    id v13 = [v11 stringByAppendingString:@"-shm"];
    moveOrRemoveDbFile(v12, v13);

    int v14 = [v6 stringByAppendingString:@"-wal"];
    uint64_t v15 = [v11 stringByAppendingString:@"-wal"];
    moveOrRemoveDbFile(v14, v15);
  }
  else
  {
    +[_PASSqliteDatabase truncateDatabaseAtPath:v6];
  }
  id v20 = 0;
  uint64_t v16 = +[_PASSqliteDatabase sqliteDatabaseWithFilename:v6 contentProtection:a4 error:&v20];
  id v17 = v20;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    dispatch_group_t v19 = NSStringFromClass((Class)a1);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v22 = v19;
    __int16 v23 = 2112;
    id v24 = v17;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ failed to recreate database during corruption recovery: %@", buf, 0x16u);
  }

  return v16;
}

+ (id)initializeDatabase:(id)a3 withProtection:(BOOL)a4 newDatabaseCreated:(BOOL *)a5
{
  if (a4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 3;
  }
  return (id)[a1 initializeDatabase:a3 withContentProtection:v5 newDatabaseCreated:a5];
}

+ (id)initializeDatabase:(id)a3 withContentProtection:(int64_t)a4 newDatabaseCreated:(BOOL *)a5
{
  return +[_PASSqliteDatabase initializeDatabase:a3 withContentProtection:a4 newDatabaseCreated:a5 errorHandler:0];
}

+ (id)initializeDatabase:(id)a3 withContentProtection:(int64_t)a4 newDatabaseCreated:(BOOL *)a5 errorHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  pthread_mutex_lock(&initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler__initDatabaseLock);
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__3452;
  uint64_t v29 = __Block_byref_object_dispose__3453;
  id v30 = 0;
  if (a5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v13 = [v12 fileExistsAtPath:v10];

    *a5 = v13 ^ 1;
    uint64_t v15 = (id *)(v26 + 5);
    int v14 = (void *)v26[5];
  }
  else
  {
    int v14 = 0;
    uint64_t v15 = &v30;
  }
  id obj = v14;
  uint64_t v16 = +[_PASSqliteDatabase sqliteDatabaseWithFilename:v10 contentProtection:a4 errorHandler:v11 error:&obj];
  objc_storeStrong(v15, obj);
  uint64_t v17 = v26[5];
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v32 = v10;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to initialize database at path %@: %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  if ([a1 contentProtectionTypeRequiresDeviceToBeUnlocked:a4]
    && !+[_PASDeviceState isUnlocked])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Device locked during db initialization of protected database.", buf, 2u);
    }
    goto LABEL_21;
  }
  if ([a1 contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:a4]
    && +[_PASDeviceState isClassCLocked])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Device has never been unlocked prior to db initialization.", buf, 2u);
    }
LABEL_21:
    [v16 closePermanently];

LABEL_8:
    __int16 v18 = 0;
    goto LABEL_9;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke;
  v23[3] = &unk_1E5AEB6B0;
  v23[4] = &v25;
  [v16 prepAndRunQuery:@"CREATE TABLE IF NOT EXISTS integrityCheck (inconsequential STRING)" onPrep:0 onRow:0 onError:v23];
  if (v26[5]) {
    goto LABEL_35;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_2;
  v22[3] = &unk_1E5AEB6B0;
  v22[4] = &v25;
  [v16 prepAndRunQuery:@"PRAGMA journal_mode=WAL" onPrep:0 onRow:0 onError:v22];
  if (v26[5]
    || (v21[0] = MEMORY[0x1E4F143A8],
        v21[1] = 3221225472,
        v21[2] = __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_3,
        v21[3] = &unk_1E5AEB6B0,
        v21[4] = &v25,
        [v16 prepAndRunQuery:@"PRAGMA synchronous=NORMAL" onPrep:0 onRow:0 onError:v21],
        v26[5]))
  {
LABEL_35:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Integrity check detected corrupt database, attempting to reinitialize.", buf, 2u);
    }
    [v16 closePermanently];
    id v20 = [v16 filename];
    __int16 v18 = [a1 recreateCorruptDatabase:v20 withContentProtection:a4];

    if (a5) {
      *a5 = 1;
    }
  }
  else
  {
    __int16 v18 = v16;
  }
LABEL_9:
  pthread_mutex_unlock(&initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler__initDatabaseLock);
  if (a5 && !v18) {
    *a5 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v18;
}

+ (BOOL)contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:(int64_t)a3
{
  return a3 != 0;
}

+ (BOOL)contentProtectionTypeRequiresDeviceToBeUnlocked:(int64_t)a3
{
  return a3 != 3 && a3 != 0;
}

@end