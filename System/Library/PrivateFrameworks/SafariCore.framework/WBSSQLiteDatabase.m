@interface WBSSQLiteDatabase
+ (id)_errorWithErrorCode:(int)a3 userInfo:(id)a4;
+ (id)inMemoryDatabaseURL;
+ (id)privateOnDiskDatabaseURL;
+ (id)writeAheadLogSharedMemoryURLForDatabaseURL:(id)a3;
+ (id)writeAheadLogURLForDatabaseURL:(id)a3;
+ (void)initialize;
- (BOOL)_openWithFlags:(int)a3 useLock:(BOOL)a4 vfs:(id)a5 error:(id *)a6;
- (BOOL)enableWAL:(id *)a3;
- (BOOL)executeQuery:(id)a3 error:(id *)a4;
- (BOOL)openWithAccessType:(int64_t)a3 error:(id *)a4;
- (BOOL)openWithAccessType:(int64_t)a3 protectionType:(int64_t)a4 vfs:(id)a5 error:(id *)a6;
- (BOOL)openWithAccessType:(int64_t)a3 vfs:(id)a4 error:(id *)a5;
- (BOOL)reportErrorWithCode:(int)a3 query:(id)a4 error:(id *)a5;
- (BOOL)reportErrorWithCode:(int)a3 statement:(sqlite3_stmt *)a4 error:(id *)a5;
- (BOOL)tryToPerformTransactionInBlock:(id)a3;
- (NSString)lastErrorMessage;
- (NSURL)url;
- (OS_dispatch_queue)queue;
- (WBSSQLiteDatabase)initWithURL:(id)a3 queue:(id)a4;
- (WBSSQLiteDatabaseDelegate)delegate;
- (id)checkIntegrity;
- (id)fetchQuery:(id)a3;
- (id)fetchQuery:(id)a3 stringArguments:(id)a4;
- (id)lastErrorWithMethodName:(const char *)a3;
- (int)checkpointWriteAheadLogWithLogFrameCount:(int *)a3 checkpointedFrameCount:(int *)a4;
- (int)close;
- (int)lastErrorCode;
- (int64_t)changedRowCount;
- (int64_t)lastInsertRowID;
- (sqlite3)handle;
- (void)_reportSevereError:(id)a3;
- (void)close;
- (void)dealloc;
- (void)setBusyTimeout:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WBSSQLiteDatabase

- (BOOL)openWithAccessType:(int64_t)a3 protectionType:(int64_t)a4 vfs:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v11 = 1;
  switch(a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
      uint64_t v11 = 0;
LABEL_3:
      unsigned int v12 = 32769;
      break;
    case 2:
      unsigned int v12 = 32770;
      break;
    case 3:
      unsigned int v12 = 32774;
      break;
    default:
      unsigned int v12 = 0x8000;
      break;
  }
  unsigned int v13 = v12 | 0x300000;
  int v14 = v12 | 0x200000;
  if (a4 == 3) {
    v12 |= 0x100000u;
  }
  if (a4 == 2) {
    unsigned int v12 = v14;
  }
  if ((unint64_t)a4 >= 2) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = v13;
  }
  BOOL v16 = [(WBSSQLiteDatabase *)self _openWithFlags:v15 useLock:v11 vfs:v10 error:a6];

  return v16;
}

- (BOOL)_openWithFlags:(int)a3 useLock:(BOOL)a4 vfs:(id)a5 error:(id *)a6
{
  id v10 = a5;
  p_url = (id *)&self->_url;
  url = self->_url;
  unsigned int v13 = +[WBSSQLiteDatabase inMemoryDatabaseURL];
  char v14 = [(NSURL *)url isEqual:v13];

  if (v14)
  {
    uint64_t v15 = @"file::memory:";
  }
  else
  {
    id v16 = *p_url;
    v17 = +[WBSSQLiteDatabase privateOnDiskDatabaseURL];
    char v18 = [v16 isEqual:v17];

    if (v18)
    {
      uint64_t v15 = &stru_1F105D3F0;
    }
    else
    {
      v19 = NSString;
      id v20 = [*p_url path];
      objc_msgSend(v19, "stringWithFormat:", @"file:%s", objc_msgSend(v20, "fileSystemRepresentation"));
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      v22 = [*p_url URLByDeletingLastPathComponent];
      v23 = objc_msgSend(v21, "safari_ensureDirectoryExists:", v22);

      if (!v23)
      {
        if (a6)
        {
          v29 = WBS_LOG_CHANNEL_PREFIXSQLite();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[WBSSQLiteDatabase _openWithFlags:useLock:vfs:error:]((uint64_t *)&self->_url, v29);
          }
          v27 = [(id)objc_opt_class() _errorWithErrorCode:14 userInfo:0];
          goto LABEL_11;
        }
LABEL_17:
        BOOL v28 = 0;
        goto LABEL_18;
      }
    }
  }
  if (!a4)
  {
    uint64_t v24 = [(__CFString *)v15 stringByAppendingString:@"?nolock=1"];

    uint64_t v15 = (__CFString *)v24;
  }
  uint64_t v15 = v15;
  p_handle = &self->_handle;
  uint64_t v26 = sqlite3_open_v2((const char *)-[__CFString UTF8String](v15, "UTF8String"), &self->_handle, a3, (const char *)[v10 UTF8String]);
  if (!v26)
  {
    BOOL v28 = 1;
    goto LABEL_18;
  }
  sqlite3_close_v2(*p_handle);
  *p_handle = 0;
  if (!a6) {
    goto LABEL_17;
  }
  v27 = [(id)objc_opt_class() _errorWithErrorCode:v26 userInfo:0];
LABEL_11:
  BOOL v28 = 0;
  *a6 = v27;
LABEL_18:

  return v28;
}

+ (id)inMemoryDatabaseURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"file::memory:"];
}

- (sqlite3)handle
{
  return self->_handle;
}

+ (id)privateOnDiskDatabaseURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"safari::privateondisk:"];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)openWithAccessType:(int64_t)a3 error:(id *)a4
{
  return [(WBSSQLiteDatabase *)self openWithAccessType:a3 vfs:0 error:a4];
}

- (BOOL)openWithAccessType:(int64_t)a3 vfs:(id)a4 error:(id *)a5
{
  return [(WBSSQLiteDatabase *)self openWithAccessType:a3 protectionType:0 vfs:a4 error:a5];
}

- (void)setDelegate:(id)a3
{
}

- (int)close
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler((SafariShared::SuddenTerminationDisabler *)v7, &cfstr_Wbssqlitedatab.isa);
  int v3 = sqlite3_close_v2(self->_handle);
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [(WBSSQLiteDatabase *)self lastErrorMessage];
      [(WBSSQLiteDatabase *)v5 close];
    }
  }
  else
  {
    self->_handle = 0;
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
  return v3;
}

- (WBSSQLiteDatabase)initWithURL:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSSQLiteDatabase;
  v8 = [(WBSSQLiteDatabase *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    uint64_t v11 = v8;
  }

  return v8;
}

- (BOOL)enableWAL:(id *)a3
{
  return SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<std::__ignore_t<unsigned char> const&>>(self, (uint64_t)a3, @"PRAGMA journal_mode = WAL");
}

- (id)fetchQuery:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastSQLQuery, a3);
  id v6 = SafariShared::WBSSQLiteDatabaseFetch<>(self, v5);

  return v6;
}

- (id)checkIntegrity
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v14 = 0;
  *(void *)buf = &v14;
  char v3 = SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<NSString * {__strong}&>>(self, (uint64_t)&v13, @"PRAGMA integrity_check(128)", (void ***)buf);
  v4 = v13;
  if (v3)
  {
    if ([v14 isEqualToString:@"ok"])
    {
      id v5 = v4;
      v4 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(WBSSQLiteDatabase *)self url];
      [(WBSSQLiteDatabase(Extras) *)v10 checkIntegrity];
    }

    unsigned int v12 = v4;
    [(WBSSQLiteDatabase *)self reportErrorWithCode:11 query:0 error:&v12];
    id v6 = v4;
    v4 = v12;
  }
  else
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(WBSSQLiteDatabase *)self url];
      v8 = [v4 safari_privacyPreservingDescription];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v7;
      __int16 v16 = 2114;
      v17 = v8;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_error_impl(&dword_1B728F000, v6, OS_LOG_TYPE_ERROR, "Failed database integrity check on %@: %{public}@: %@", buf, 0x20u);
    }
  }

  id v5 = 0;
LABEL_10:

  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSSQLiteDatabase;
  [(WBSSQLiteDatabase *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSQLQuery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

id __31__WBSSQLiteDatabase_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:v5];
  if (!v7)
  {
    if ([v5 isEqualToString:@"WBSPrivacyPreservingDescription"])
    {
      id v7 = errorStringForCode([v4 code]);
    }
    else if ([v5 isEqualToString:*MEMORY[0x1E4F28568]])
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v9 = errorStringForCode([v4 code]);
      if (v9) {
        [v8 addObject:v9];
      }

      id v10 = objc_msgSend(v6, "safari_stringForKey:", @"Message");
      if (v10) {
        [v8 addObject:v10];
      }

      uint64_t v11 = objc_msgSend(v6, "safari_stringForKey:", @"SQL");
      if (v11) {
        [v8 addObject:v11];
      }

      id v7 = [v8 componentsJoinedByString:@": "];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)_reportSevereError:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    qos_class_t v6 = qos_class_self();
    id v7 = dispatch_get_global_queue(v6, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__WBSSQLiteDatabase__reportSevereError___block_invoke;
    block[3] = &unk_1E6159A30;
    id v9 = WeakRetained;
    id v10 = self;
    id v11 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __40__WBSSQLiteDatabase__reportSevereError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) database:*(void *)(a1 + 40) hadSevereError:*(void *)(a1 + 48)];
}

- (BOOL)reportErrorWithCode:(int)a3 statement:(sqlite3_stmt *)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a4 && (v8 = sqlite3_expanded_sql(a4)) != 0)
  {
    id v9 = v8;
    id v10 = [NSString stringWithUTF8String:v8];
    BOOL v11 = [(WBSSQLiteDatabase *)self reportErrorWithCode:v6 query:v10 error:a5];

    sqlite3_free(v9);
    return v11;
  }
  else
  {
    return [(WBSSQLiteDatabase *)self reportErrorWithCode:v6 query:0 error:a5];
  }
}

- (BOOL)reportErrorWithCode:(int)a3 query:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  url = self->_url;
  if (url)
  {
    unsigned int v12 = (void *)[(NSURL *)url copy];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
  }
  if ((a3 - 100) >= 2)
  {
    if (a3)
    {
      id v9 = sqlite3_errmsg(self->_handle);
      if (v9)
      {
        id v13 = [NSString stringWithUTF8String:v9];
        [v10 setObject:v13 forKeyedSubscript:@"Message"];
      }
    }
  }
  if (v8)
  {
    id v14 = objc_msgSend(v8, "copy", v9);
    [v10 setObject:v14 forKeyedSubscript:@"SQL"];
  }
  uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Safari.SQLite" code:a3 userInfo:v10];
  __int16 v16 = v15;
  if (a5)
  {
    *a5 = v15;
  }
  else
  {
    v17 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = objc_msgSend(v16, "safari_privacyPreservingDescription");
      -[WBSSQLiteDatabase reportErrorWithCode:query:error:](v18, v20, v17);
    }
  }
  if ((a3 & 0xFFFFFFFE) == 0xA) {
    [(WBSSQLiteDatabase *)self _reportSevereError:v16];
  }

  return 0;
}

- (BOOL)executeQuery:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_lastSQLQuery, a3);
  ppStmt = 0;
  handle = self->_handle;
  id v9 = v7;
  uint64_t v10 = sqlite3_prepare_v2(handle, (const char *)[v9 UTF8String], -1, &ppStmt, 0);
  if (v10)
  {
    [(WBSSQLiteDatabase *)self reportErrorWithCode:v10 query:v9 error:a4];
    if (ppStmt) {
      sqlite3_finalize(ppStmt);
    }
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = sqlite3_step(ppStmt);
    BOOL v11 = v12 == 101 || v12 == 0;
    if (v12 && v12 != 101) {
      [(WBSSQLiteDatabase *)self reportErrorWithCode:v12 query:v9 error:a4];
    }
    sqlite3_finalize(ppStmt);
  }

  return v11;
}

- (id)fetchQuery:(id)a3 stringArguments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_lastSQLQuery, a3);
  id v9 = [[WBSSQLiteStatement alloc] initWithDatabase:self query:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__WBSSQLiteDatabase_fetchQuery_stringArguments___block_invoke;
  v13[3] = &unk_1E6159CD0;
  uint64_t v10 = v9;
  id v14 = v10;
  [v8 enumerateObjectsUsingBlock:v13];
  BOOL v11 = [(WBSSQLiteStatement *)v10 fetch];

  return v11;
}

uint64_t __48__WBSSQLiteDatabase_fetchQuery_stringArguments___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) bindString:a2 atParameterIndex:a3 + 1];
}

- (int)checkpointWriteAheadLogWithLogFrameCount:(int *)a3 checkpointedFrameCount:(int *)a4
{
  v9[3] = *MEMORY[0x1E4F143B8];
  int v5 = sqlite3_wal_checkpoint_v2(self->_handle, 0, 2, a3, a4);
  if (v5)
  {
    uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(WBSSQLiteDatabase *)self lastErrorMessage];
      -[WBSSQLiteDatabase checkpointWriteAheadLogWithLogFrameCount:checkpointedFrameCount:](v7, (uint64_t)v9, v5);
    }
  }
  return v5;
}

- (int)lastErrorCode
{
  return sqlite3_extended_errcode(self->_handle);
}

- (NSString)lastErrorMessage
{
  objc_super v2 = (void *)sqlite3_errmsg(self->_handle);
  if (v2)
  {
    objc_super v2 = [NSString stringWithUTF8String:v2];
  }
  return (NSString *)v2;
}

- (int64_t)lastInsertRowID
{
  return sqlite3_last_insert_rowid(self->_handle);
}

- (int64_t)changedRowCount
{
  return sqlite3_changes(self->_handle);
}

- (id)lastErrorWithMethodName:(const char *)a3
{
  int v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = v5;
  lastSQLQuery = self->_lastSQLQuery;
  if (lastSQLQuery) {
    [v5 setObject:lastSQLQuery forKeyedSubscript:@"SQL"];
  }
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", a3);
  [v6 setObject:v8 forKeyedSubscript:@"MethodName"];

  id v9 = objc_msgSend((id)objc_opt_class(), "_errorWithErrorCode:userInfo:", -[WBSSQLiteDatabase lastErrorCode](self, "lastErrorCode"), v6);

  return v9;
}

+ (id)_errorWithErrorCode:(int)a3 userInfo:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    uint64_t v6 = [NSString stringWithUTF8String:sqlite3_errstr(a3)];
    id v7 = (void *)[v5 mutableCopy];
    [v7 setObject:v6 forKeyedSubscript:@"Message"];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Safari.SQLite" code:a3 userInfo:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)writeAheadLogURLForDatabaseURL:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [a3 absoluteString];
  id v5 = [v4 stringByAppendingString:@"-wal"];
  uint64_t v6 = [v3 URLWithString:v5];

  return v6;
}

+ (id)writeAheadLogSharedMemoryURLForDatabaseURL:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [a3 absoluteString];
  id v5 = [v4 stringByAppendingString:@"-shm"];
  uint64_t v6 = [v3 URLWithString:v5];

  return v6;
}

- (void)setBusyTimeout:(double)a3
{
}

- (WBSSQLiteDatabaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSSQLiteDatabaseDelegate *)WeakRetained;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)tryToPerformTransactionInBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(void))a3;
  if ([(WBSSQLiteDatabase *)self handle])
  {
    id v18 = 0;
    BOOL v5 = [(WBSSQLiteDatabase *)self executeQuery:@"BEGIN TRANSACTION" error:&v18];
    id v6 = v18;
    if (v5)
    {
      if (v4[2](v4))
      {
        id v16 = v6;
        BOOL v7 = [(WBSSQLiteDatabase *)self executeQuery:@"COMMIT TRANSACTION" error:&v16];
        id v8 = v16;

        if (v7)
        {
          BOOL v9 = 1;
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v13 = objc_msgSend(v8, "safari_privacyPreservingDescription");
          [(WBSSQLiteDatabase(Extras) *)v13 tryToPerformTransactionInBlock:v10];
        }
      }
      else
      {
        id v17 = v6;
        BOOL v12 = [(WBSSQLiteDatabase *)self executeQuery:@"ROLLBACK TRANSACTION" error:&v17];
        id v8 = v17;

        if (v12)
        {
          BOOL v9 = 0;
          goto LABEL_17;
        }
        uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v14 = objc_msgSend(v8, "safari_privacyPreservingDescription");
          [(WBSSQLiteDatabase(Extras) *)v14 tryToPerformTransactionInBlock:v10];
        }
      }
      id v6 = v8;
    }
    else
    {
      uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = objc_msgSend(v6, "safari_privacyPreservingDescription");
        [(WBSSQLiteDatabase(Extras) *)v11 tryToPerformTransactionInBlock:v10];
      }
    }

    BOOL v9 = 0;
    id v8 = v6;
    goto LABEL_17;
  }
  BOOL v9 = 0;
LABEL_18:

  return v9;
}

- (void)close
{
  OUTLINED_FUNCTION_0_6((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1B728F000, v5, OS_LOG_TYPE_ERROR, "Failed to close database: %{public}@ (%d)", v4, 0x12u);
}

- (void)reportErrorWithCode:(void *)a1 query:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Unhandled SQLite error: %{public}@", buf, 0xCu);
}

- (void)checkpointWriteAheadLogWithLogFrameCount:(int)a3 checkpointedFrameCount:.cold.1(void *a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_0_6((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1B728F000, v5, OS_LOG_TYPE_ERROR, "Failed to checkpoint database write ahead log: %{public}@ (%d)", v4, 0x12u);
}

- (void)_openWithFlags:(uint64_t *)a1 useLock:(NSObject *)a2 vfs:error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Unable to create parent folder for database at path: %{private}@", (uint8_t *)&v3, 0xCu);
}

@end