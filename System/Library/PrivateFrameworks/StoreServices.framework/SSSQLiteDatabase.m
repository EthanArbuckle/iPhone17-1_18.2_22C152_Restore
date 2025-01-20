@interface SSSQLiteDatabase
+ (BOOL)statementDidFinishAfterStepping:(sqlite3_stmt *)a3;
+ (BOOL)statementHasRowAfterStepping:(sqlite3_stmt *)a3;
+ (void)_setTakesTaskCompletionAssertions:(BOOL)a3;
+ (void)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 didFinish:(BOOL *)a5 isCorrupt:(BOOL *)a6;
- (BOOL)columnName:(id)a3 existsInTable:(id)a4;
- (BOOL)executeSQL:(id)a3;
- (BOOL)setUserVersion:(int64_t)a3;
- (BOOL)setUserVersion:(int64_t)a3 forDatabase:(id)a4;
- (BOOL)statementDidFinishAfterStepping:(sqlite3_stmt *)a3;
- (BOOL)statementHasRowAfterStepping:(sqlite3_stmt *)a3;
- (BOOL)takesTaskCompletionAssertions;
- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3;
- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4;
- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4 protectionType:(id)a5;
- (id)_openDatabaseIfNotOpen;
- (id)newDispatchSourceWithType:(dispatch_source_type_s *)a3;
- (id)setupBlock;
- (int)_closeDatabaseIfOpen;
- (int)_openFlags;
- (int)_resetAndReopenDatabaseWithPath:(id)a3;
- (int64_t)countChanges;
- (int64_t)userVersion;
- (int64_t)userVersionForDatabase:(id)a3;
- (sqlite3_stmt)_statementForSQL:(id)a3 cache:(BOOL)a4;
- (void)_accessDatabaseUsingBlock:(id)a3;
- (void)_beginTaskCompletionAssertion;
- (void)_endTaskCompletionAssertion;
- (void)_expireBackgroundTask;
- (void)_resetCorruptDatabase;
- (void)_resetDatabaseWithPath:(id)a3;
- (void)accessDatabaseUsingBlock:(id)a3;
- (void)beginTaskCompletionAssertion;
- (void)dealloc;
- (void)dispatchAfter:(unint64_t)a3 block:(id)a4;
- (void)dispatchBlockAsync:(id)a3;
- (void)dispatchBlockSync:(id)a3;
- (void)endTaskCompletionAssertion;
- (void)expireBackgroundTask;
- (void)performTransactionWithBlock:(id)a3;
- (void)prepareStatementForSQL:(id)a3 cache:(BOOL)a4 usingBlock:(id)a5;
- (void)setSetupBlock:(id)a3;
- (void)setTakesTaskCompletionAssertions:(BOOL)a3;
@end

@implementation SSSQLiteDatabase

- (BOOL)executeSQL:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SSSQLiteDatabase_executeSQL___block_invoke;
  v5[3] = &unk_1E5BA77A0;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = &v6;
  [(SSSQLiteDatabase *)self _accessDatabaseUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)prepareStatementForSQL:(id)a3 cache:(BOOL)a4 usingBlock:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SSSQLiteDatabase_prepareStatementForSQL_cache_usingBlock___block_invoke;
  v5[3] = &unk_1E5BACE30;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  v5[6] = a5;
  [(SSSQLiteDatabase *)self _accessDatabaseUsingBlock:v5];
}

- (void)performTransactionWithBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__SSSQLiteDatabase_performTransactionWithBlock___block_invoke;
  v3[3] = &unk_1E5BAA2E0;
  v3[4] = self;
  v3[5] = a3;
  [(SSSQLiteDatabase *)self _accessDatabaseUsingBlock:v3];
}

- (void)_accessDatabaseUsingBlock:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SSSQLiteDatabase__accessDatabaseUsingBlock___block_invoke;
  v4[3] = &unk_1E5BAA2E0;
  v4[4] = self;
  v4[5] = a3;
  if (dispatch_get_specific("_ISSQLiteDispatchQueueTag") == (void *)1) {
    __46__SSSQLiteDatabase__accessDatabaseUsingBlock___block_invoke((uint64_t)v4);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_dispatchQueue, v4);
  }
}

uint64_t __46__SSSQLiteDatabase__accessDatabaseUsingBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginTaskCompletionAssertion];
  if ([*(id *)(a1 + 32) _openDatabaseIfNotOpen])
  {
    v2 = *(void **)(a1 + 32);
    return [v2 _endTaskCompletionAssertion];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return [*(id *)(a1 + 32) _endTaskCompletionAssertion];
  }
}

- (id)_openDatabaseIfNotOpen
{
  v109[1] = *MEMORY[0x1E4F143B8];
  p_db = &self->_db;
  if (self->_db) {
    return 0;
  }
  protectionType = self->_protectionType;
  if ((!protectionType || ![(NSString *)protectionType isEqualToString:*MEMORY[0x1E4F28378]])
    && !MKBDeviceUnlockedSinceBoot())
  {
    v35 = (void *)MEMORY[0x1E4F28C58];
    v108 = @"sqlite_result";
    v109[0] = &unk_1EF9A9918;
    v36 = (void *)MEMORY[0x1E4F1C9E8];
    v37 = v109;
    v38 = &v108;
    return (id)objc_msgSend(v35, "errorWithDomain:code:userInfo:", @"SSErrorDomain", 112, objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
  }
  v101 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSString stringByDeletingLastPathComponent](self->_databasePath, "stringByDeletingLastPathComponent"), 1, 0, &v101) & 1) != 0|| !v101)
  {
    uint64_t v19 = sqlite3_open_v2([(NSString *)self->_databasePath fileSystemRepresentation], p_db, [(SSSQLiteDatabase *)self _openFlags], 0);
    if (v19)
    {
      uint64_t v20 = v19;
      if (*p_db)
      {
        sqlite3_close(*p_db);
        *p_db = 0;
      }
      if (v20 == 23)
      {
        id v21 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v21) {
          id v21 = +[SSLogConfig sharedConfig];
        }
        int v22 = [v21 shouldLog];
        if ([v21 shouldLogToDisk]) {
          v22 |= 2u;
        }
        if (os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          int v23 = v22;
        }
        else {
          int v23 = v22 & 2;
        }
        uint64_t v20 = 23;
        if (v23)
        {
          uint64_t v24 = objc_opt_class();
          databasePath = self->_databasePath;
          int v104 = 138412802;
          uint64_t v105 = v24;
          __int16 v106 = 1024;
          LODWORD(v107[0]) = 23;
          WORD2(v107[0]) = 2112;
          *(void *)((char *)v107 + 6) = databasePath;
          LODWORD(v100) = 28;
          v98 = &v104;
          uint64_t v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v104, v100);
            free(v27);
            SSFileLog(v21, @"%@", v29, v30, v31, v32, v33, v34, v28);
            uint64_t v20 = 23;
          }
        }
        goto LABEL_89;
      }
      BOOL readOnly = self->_readOnly;
      id v53 = +[SSLogConfig sharedStoreServicesConfig];
      id v54 = v53;
      if (readOnly)
      {
        if (!v53) {
          id v54 = +[SSLogConfig sharedConfig];
        }
        int v55 = [v54 shouldLog];
        if ([v54 shouldLogToDisk]) {
          int v56 = v55 | 2;
        }
        else {
          int v56 = v55;
        }
        if (!os_log_type_enabled((os_log_t)[v54 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v56 &= 2u;
        }
        if (v56)
        {
          uint64_t v57 = objc_opt_class();
          v58 = self->_databasePath;
          int v104 = 138412802;
          uint64_t v105 = v57;
          __int16 v106 = 1024;
          LODWORD(v107[0]) = v20;
          WORD2(v107[0]) = 2112;
          *(void *)((char *)v107 + 6) = v58;
          LODWORD(v100) = 28;
          v98 = &v104;
          uint64_t v59 = _os_log_send_and_compose_impl();
          if (v59)
          {
            v60 = (void *)v59;
            uint64_t v61 = objc_msgSend(NSString, "stringWithCString:encoding:", v59, 4, &v104, v100);
            free(v60);
            SSFileLog(v54, @"%@", v62, v63, v64, v65, v66, v67, v61);
          }
        }
        goto LABEL_89;
      }
      if (!v53) {
        id v54 = +[SSLogConfig sharedConfig];
      }
      int v68 = [v54 shouldLog];
      if ([v54 shouldLogToDisk]) {
        int v69 = v68 | 2;
      }
      else {
        int v69 = v68;
      }
      if (!os_log_type_enabled((os_log_t)[v54 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v69 &= 2u;
      }
      if (v69)
      {
        uint64_t v70 = objc_opt_class();
        v71 = self->_databasePath;
        int v104 = 138412802;
        uint64_t v105 = v70;
        __int16 v106 = 1024;
        LODWORD(v107[0]) = v20;
        WORD2(v107[0]) = 2112;
        *(void *)((char *)v107 + 6) = v71;
        LODWORD(v100) = 28;
        v98 = &v104;
        uint64_t v72 = _os_log_send_and_compose_impl();
        if (v72)
        {
          v73 = (void *)v72;
          uint64_t v74 = objc_msgSend(NSString, "stringWithCString:encoding:", v72, 4, &v104, v100);
          free(v73);
          SSFileLog(v54, @"%@", v75, v76, v77, v78, v79, v80, v74);
        }
      }
      uint64_t v20 = -[SSSQLiteDatabase _resetAndReopenDatabaseWithPath:](self, "_resetAndReopenDatabaseWithPath:", self->_databasePath, v98);
    }
    else
    {
      if (!self->_readOnly && self->_setupBlock)
      {
        id v39 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v39) {
          id v39 = +[SSLogConfig sharedConfig];
        }
        int v40 = [v39 shouldLog];
        if ([v39 shouldLogToDisk]) {
          int v41 = v40 | 2;
        }
        else {
          int v41 = v40;
        }
        if (os_log_type_enabled((os_log_t)[v39 OSLogObject], OS_LOG_TYPE_DEBUG)) {
          int v42 = v41;
        }
        else {
          int v42 = v41 & 2;
        }
        if (v42)
        {
          LOWORD(v104) = 0;
          LODWORD(v100) = 2;
          v98 = &v104;
          uint64_t v43 = _os_log_send_and_compose_impl();
          if (v43)
          {
            v44 = (void *)v43;
            uint64_t v45 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v104, v100);
            free(v44);
            SSFileLog(v39, @"%@", v46, v47, v48, v49, v50, v51, v45);
          }
        }
        (*((void (**)(void))self->_setupBlock + 2))();
      }
      uint64_t v20 = 0;
    }
    if (self->_readOnly || v20)
    {
      if (v20)
      {
LABEL_89:
        v35 = (void *)MEMORY[0x1E4F28C58];
        v102 = @"sqlite_result";
        uint64_t v103 = objc_msgSend(NSNumber, "numberWithInt:", v20, v98);
        v36 = (void *)MEMORY[0x1E4F1C9E8];
        v37 = &v103;
        v38 = &v102;
        return (id)objc_msgSend(v35, "errorWithDomain:code:userInfo:", @"SSErrorDomain", 112, objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
      }
    }
    else
    {
      int v81 = sqlite3_exec(*p_db, "PRAGMA cache_size=512;", 0, 0, 0);
      int v82 = v81;
      if (v81 == 26 || v81 == 11)
      {
        id v83 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v83) {
          id v83 = +[SSLogConfig sharedConfig];
        }
        int v84 = [v83 shouldLog];
        if ([v83 shouldLogToDisk]) {
          int v85 = v84 | 2;
        }
        else {
          int v85 = v84;
        }
        if (!os_log_type_enabled((os_log_t)[v83 OSLogObject], OS_LOG_TYPE_ERROR)) {
          v85 &= 2u;
        }
        if (v85)
        {
          uint64_t v86 = objc_opt_class();
          v87 = self->_databasePath;
          int v104 = 138412802;
          uint64_t v105 = v86;
          __int16 v106 = 1024;
          LODWORD(v107[0]) = v82;
          WORD2(v107[0]) = 2112;
          *(void *)((char *)v107 + 6) = v87;
          LODWORD(v100) = 28;
          v99 = &v104;
          uint64_t v88 = _os_log_send_and_compose_impl();
          if (v88)
          {
            v89 = (void *)v88;
            uint64_t v90 = objc_msgSend(NSString, "stringWithCString:encoding:", v88, 4, &v104, v100);
            free(v89);
            SSFileLog(v83, @"%@", v91, v92, v93, v94, v95, v96, v90);
          }
        }
        uint64_t v20 = -[SSSQLiteDatabase _resetAndReopenDatabaseWithPath:](self, "_resetAndReopenDatabaseWithPath:", self->_databasePath, v99);
        db = self->_db;
        if (v20)
        {
          if (db)
          {
            sqlite3_close(db);
            *p_db = 0;
          }
          goto LABEL_89;
        }
        sqlite3_exec(db, "PRAGMA cache_size=512;", 0, 0, 0);
      }
    }
    sqlite3_busy_timeout(*p_db, 3600000);
    return 0;
  }
  id v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    int v104 = 138412546;
    uint64_t v105 = v9;
    __int16 v106 = 2112;
    v107[0] = v101;
    LODWORD(v100) = 22;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v104, v100);
      free(v11);
      SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, v12);
    }
  }
  return v101;
}

- (void)_endTaskCompletionAssertion
{
  if (self->_takesTaskCompletionAssertions)
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SSSQLiteDatabase__endTaskCompletionAssertion__block_invoke;
    block[3] = &unk_1E5BA73F8;
    block[4] = self;
    dispatch_after(v3, dispatchQueue, block);
  }
}

- (void)_beginTaskCompletionAssertion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_takesTaskCompletionAssertions)
  {
    int64_t taskAssertionCount = self->_taskAssertionCount;
    if (taskAssertionCount < 1)
    {
      id v5 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v5) {
        id v5 = +[SSLogConfig sharedConfig];
      }
      int v6 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
        v7 &= 2u;
      }
      if (v7)
      {
        int v20 = 138412290;
        uint64_t v21 = objc_opt_class();
        LODWORD(v19) = 12;
        uint64_t v18 = &v20;
        uint64_t v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v20, v19);
          free(v9);
          SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, v10);
        }
      }
      uint64_t v17 = [NSString stringWithFormat:@"com.apple.StoreServices.SSSQLiteDatabase.%@", -[NSString lastPathComponent](self->_databasePath, "lastPathComponent", v18)];
      int64_t v4 = 1;
      self->_taskAssertion = (BKSProcessAssertion *)[objc_alloc(MEMORY[0x1E4F4E280]) initWithPID:getpid() flags:1 reason:4 name:v17 withHandler:0];
    }
    else
    {
      int64_t v4 = taskAssertionCount + 1;
    }
    self->_int64_t taskAssertionCount = v4;
  }
}

unsigned char *__48__SSSQLiteDatabase_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  int v3 = result[34];
  if (!result[34])
  {
    if (result[32]) {
      int64_t v4 = @"BEGIN DEFERRED TRANSACTION;";
    }
    else {
      int64_t v4 = @"BEGIN IMMEDIATE TRANSACTION;";
    }
    result = (unsigned char *)[result executeSQL:v4];
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = (_BYTE)result;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 34))
  {
    result = (unsigned char *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    if (!v3)
    {
      if (result) {
        result = (unsigned char *)[*(id *)(a1 + 32) executeSQL:@"COMMIT;"];
      }
      else {
        result = (unsigned char *)[*(id *)(a1 + 32) executeSQL:@"ROLLBACK;"];
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 34) = 0;
    }
  }
  return result;
}

uint64_t __60__SSSQLiteDatabase_prepareStatementForSQL_cache_usingBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  int64_t v4 = (sqlite3_stmt *)[v2 _statementForSQL:*(void *)(a1 + 40) cache:*(unsigned __int8 *)(a1 + 56)];
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v3 == *(void *)(*(void *)(a1 + 32) + 8))
  {
    sqlite3_clear_bindings(v4);
    uint64_t result = sqlite3_reset(v4);
    if (!*(unsigned char *)(a1 + 56)) {
      return sqlite3_finalize(v4);
    }
  }
  return result;
}

- (sqlite3_stmt)_statementForSQL:(id)a3 cache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  if (!a4 || (int v7 = self->_statementCache) == 0 || (ppStmt = (sqlite3_stmt *)CFDictionaryGetValue(v7, a3)) == 0)
  {
    do
      int v8 = sqlite3_prepare_v2(self->_db, (const char *)[a3 UTF8String], objc_msgSend(a3, "length"), &ppStmt, 0);
    while ((v8 - 5) < 2);
    int v9 = v8;
    if (v8)
    {
      id v10 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v10) {
        id v10 = +[SSLogConfig sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v12 &= 2u;
      }
      if (v12)
      {
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = sqlite3_errmsg(self->_db);
        databasePath = self->_databasePath;
        int v30 = 138413314;
        uint64_t v31 = v13;
        __int16 v32 = 2112;
        id v33 = a3;
        __int16 v34 = 1024;
        int v35 = v9;
        __int16 v36 = 2080;
        v37 = v14;
        __int16 v38 = 2112;
        id v39 = databasePath;
        LODWORD(v28) = 48;
        v27 = &v30;
        uint64_t v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v30, v28);
          free(v17);
          SSFileLog(v10, @"%@", v19, v20, v21, v22, v23, v24, v18);
        }
      }
      if (v9 == 26 || v9 == 11) {
        [(SSSQLiteDatabase *)self _resetCorruptDatabase];
      }
    }
    else if (v4)
    {
      statementCache = self->_statementCache;
      if (!statementCache)
      {
        statementCache = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], &kSqlite3StatementDictionaryValueCallbacks);
        self->_statementCache = statementCache;
      }
      CFDictionarySetValue(statementCache, a3, ppStmt);
    }
  }
  return ppStmt;
}

void __31__SSSQLiteDatabase_executeSQL___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = (const char *)[*(id *)(a1 + 32) UTF8String];
  uint64_t v3 = 0;
  do
  {
    errmsg = 0;
    int v4 = sqlite3_exec(*(sqlite3 **)(*(void *)(a1 + 40) + 8), v2, 0, 0, &errmsg);
    if (v4)
    {
      int v5 = v4;
      int v6 = errmsg;
      if (v4 - 5 > 1)
      {
        if (!errmsg) {
          int v6 = (void *)sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
        }
        id v21 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v21) {
          id v21 = +[SSLogConfig sharedConfig];
        }
        int v22 = [v21 shouldLog];
        if ([v21 shouldLogToDisk]) {
          v22 |= 2u;
        }
        if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_ERROR)) {
          v22 &= 2u;
        }
        if (v22)
        {
          uint64_t v23 = objc_opt_class();
          uint64_t v24 = *(void *)(a1 + 32);
          uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 24);
          int v40 = 138413314;
          uint64_t v41 = v23;
          __int16 v42 = 2112;
          uint64_t v43 = v24;
          __int16 v44 = 2048;
          uint64_t v45 = v5;
          __int16 v46 = 2080;
          uint64_t v47 = v6;
          __int16 v48 = 2112;
          uint64_t v49 = v25;
          LODWORD(v38) = 52;
          __int16 v36 = &v40;
          uint64_t v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v40, v38);
            free(v27);
            SSFileLog(v21, @"%@", v29, v30, v31, v32, v33, v34, v28);
          }
        }
        if (v5 == 26 || v5 == 11) {
          [*(id *)(a1 + 40) _resetCorruptDatabase];
        }
        char v20 = 0;
      }
      else
      {
        if (!errmsg) {
          int v6 = (void *)sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
        }
        id v7 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v7) {
          id v7 = +[SSLogConfig sharedConfig];
        }
        int v8 = [v7 shouldLog];
        if ([v7 shouldLogToDisk]) {
          v8 |= 2u;
        }
        if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
          v8 &= 2u;
        }
        if (v8)
        {
          uint64_t v9 = objc_opt_class();
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 24);
          int v40 = 138413314;
          uint64_t v41 = v9;
          __int16 v42 = 2048;
          uint64_t v43 = v5;
          __int16 v44 = 2048;
          uint64_t v45 = v3;
          __int16 v46 = 2080;
          uint64_t v47 = v6;
          __int16 v48 = 2112;
          uint64_t v49 = v10;
          LODWORD(v38) = 52;
          v37 = &v40;
          uint64_t v11 = _os_log_send_and_compose_impl();
          if (v11)
          {
            int v12 = (void *)v11;
            uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v40, v38);
            free(v12);
            SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
          }
        }
        objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 0.5, v37);
        ++v3;
        char v20 = 1;
      }
    }
    else
    {
      char v20 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (errmsg) {
      sqlite3_free(errmsg);
    }
  }
  while ((v20 & 1) != 0);
}

- (BOOL)statementHasRowAfterStepping:(sqlite3_stmt *)a3
{
  __int16 v5 = 0;
  [(id)objc_opt_class() _stepStatement:a3 hasRow:(char *)&v5 + 1 didFinish:0 isCorrupt:&v5];
  if (!(_BYTE)v5) {
    return HIBYTE(v5) != 0;
  }
  [(SSSQLiteDatabase *)self _resetCorruptDatabase];
  return 0;
}

- (BOOL)statementDidFinishAfterStepping:(sqlite3_stmt *)a3
{
  __int16 v5 = 0;
  [(id)objc_opt_class() _stepStatement:a3 hasRow:0 didFinish:(char *)&v5 + 1 isCorrupt:&v5];
  if (!(_BYTE)v5) {
    return HIBYTE(v5) != 0;
  }
  [(SSSQLiteDatabase *)self _resetCorruptDatabase];
  return 0;
}

+ (void)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 didFinish:(BOOL *)a5 isCorrupt:(BOOL *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    while (1)
    {
      int v10 = sqlite3_step(a3);
      if (v10 == 9) {
        break;
      }
      if (v10 == 101)
      {
        if (a5) {
          *a5 = 1;
        }
        return;
      }
      if (v10 == 100)
      {
        if (a4) {
          *a4 = 1;
        }
        return;
      }
      int v11 = v10;
      if (v10 - 7 <= 0xFFFFFFFD)
      {
        id v12 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v12) {
          id v12 = +[SSLogConfig sharedConfig];
        }
        int v13 = [v12 shouldLog];
        if ([v12 shouldLogToDisk]) {
          int v14 = v13 | 2;
        }
        else {
          int v14 = v13;
        }
        if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_ERROR)) {
          v14 &= 2u;
        }
        if (v14)
        {
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = sqlite3_sql(a3);
          uint64_t v17 = sqlite3_db_handle(a3);
          int v30 = 138413058;
          uint64_t v31 = v15;
          __int16 v32 = 2080;
          uint64_t v33 = v16;
          __int16 v34 = 1024;
          int v35 = v11;
          __int16 v36 = 2080;
          v37 = sqlite3_errmsg(v17);
          LODWORD(v29) = 38;
          uint64_t v18 = _os_log_send_and_compose_impl();
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            uint64_t v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v30, v29);
            free(v19);
            SSFileLog(v12, @"%@", v21, v22, v23, v24, v25, v26, v20);
          }
        }
        if (a6)
        {
          BOOL v28 = v11 == 11 || v11 == 26;
          *a6 = v28;
        }
        return;
      }
      if (v10 == 6) {
        sqlite3_reset(a3);
      }
    }
  }
}

- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3
{
  return [(SSSQLiteDatabase *)self initWithDatabaseURL:a3 readOnly:0];
}

- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  return [(SSSQLiteDatabase *)self initWithDatabaseURL:a3 readOnly:a4 protectionType:*MEMORY[0x1E4F28358]];
}

- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4 protectionType:(id)a5
{
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v29 = 138413058;
    uint64_t v30 = objc_opt_class();
    __int16 v31 = 2114;
    uint64_t v32 = [a3 path];
    __int16 v33 = 1024;
    BOOL v34 = v6;
    __int16 v35 = 2112;
    id v36 = a5;
    LODWORD(v27) = 38;
    uint64_t v26 = &v29;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      int v13 = (void *)v12;
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v29, v27);
      free(v13);
      SSFileLog(v9, @"%@", v15, v16, v17, v18, v19, v20, v14);
    }
  }
  if ((objc_msgSend(a3, "isFileURL", v26) & 1) == 0)
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid database URL"];
    self = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)SSSQLiteDatabase;
  uint64_t v21 = [(SSSQLiteDatabase *)&v28 init];
  if (v21)
  {
    Class v22 = NSClassFromString(&cfstr_Uiapplication.isa);
    uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStore.SSSQLiteDatabase.%p", v21);
    uint64_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], 0);
    v21->_dispatchQueue = (OS_dispatch_queue *)v24;
    dispatch_queue_set_specific(v24, "_ISSQLiteDispatchQueueTag", (void *)1, 0);

    v21->_databasePath = (NSString *)(id)[a3 path];
    v21->_BOOL readOnly = v6;
    v21->_protectionType = (NSString *)a5;
    if (__TakesTaskCompletionAssertions)
    {
      if (!v22)
      {
        v21->_takesTaskCompletionAssertions = 0;
        return v21;
      }
      v21->_takesTaskCompletionAssertions = 1;
      goto LABEL_18;
    }
    if (v21->_takesTaskCompletionAssertions) {
LABEL_18:
    }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v21, sel_expireBackgroundTask, @"UIApplicationBackgroundTaskWillExpireNotification", -[objc_class sharedApplication](v22, "sharedApplication"));
  }
  return v21;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = [(SSSQLiteDatabase *)self _closeDatabaseIfOpen];
  if (v3)
  {
    int v4 = v3;
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v22 = 138412802;
      uint64_t v23 = objc_opt_class();
      __int16 v24 = 1024;
      int v25 = v4;
      __int16 v26 = 2080;
      uint64_t v27 = sqlite3_errstr(v4);
      LODWORD(v20) = 28;
      uint64_t v19 = &v22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        id v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v22, v20);
        free(v9);
        SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_set_specific(dispatchQueue, "_ISSQLiteDispatchQueueTag", 0, 0);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
    self->_dispatchQueue = 0;
  }
  taskAssertion = self->_taskAssertion;
  if (taskAssertion)
  {
    [(BKSProcessAssertion *)taskAssertion invalidate];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v19), "removeObserver:", self);

  v21.receiver = self;
  v21.super_class = (Class)SSSQLiteDatabase;
  [(SSSQLiteDatabase *)&v21 dealloc];
}

+ (BOOL)statementDidFinishAfterStepping:(sqlite3_stmt *)a3
{
  BOOL v4 = 0;
  [a1 _stepStatement:a3 hasRow:0 didFinish:&v4 isCorrupt:0];
  return v4;
}

+ (BOOL)statementHasRowAfterStepping:(sqlite3_stmt *)a3
{
  BOOL v4 = 0;
  [a1 _stepStatement:a3 hasRow:&v4 didFinish:0 isCorrupt:0];
  return v4;
}

- (void)accessDatabaseUsingBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SSSQLiteDatabase_accessDatabaseUsingBlock___block_invoke;
  v3[3] = &unk_1E5BA7728;
  v3[4] = self;
  v3[5] = a3;
  [(SSSQLiteDatabase *)self _accessDatabaseUsingBlock:v3];
}

uint64_t __45__SSSQLiteDatabase_accessDatabaseUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8));
}

- (BOOL)columnName:(id)a3 existsInTable:(id)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v6 = [NSString stringWithFormat:@"PRAGMA table_info(%@);", a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SSSQLiteDatabase_columnName_existsInTable___block_invoke;
  v8[3] = &unk_1E5BACE08;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = &v9;
  [(SSSQLiteDatabase *)self prepareStatementForSQL:v6 cache:0 usingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)self;
}

void __45__SSSQLiteDatabase_columnName_existsInTable___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  BOOL v4 = (void *)MEMORY[0x1A6267F60]();
  if ([*(id *)(a1 + 32) statementHasRowAfterStepping:a2])
  {
    while (1)
    {
      if (sqlite3_column_type(a2, 1) == 3)
      {
        id v5 = sqlite3_column_text(a2, 1);
        if (v5)
        {
          if (*v5
            && objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4), "isEqualToString:", *(void *)(a1 + 40)))
          {
            break;
          }
        }
      }
      if (([*(id *)(a1 + 32) statementHasRowAfterStepping:a2] & 1) == 0) {
        goto LABEL_7;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_7:
}

- (int64_t)countChanges
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__SSSQLiteDatabase_countChanges__block_invoke;
  v4[3] = &unk_1E5BA7688;
  v4[4] = self;
  v4[5] = &v5;
  [(SSSQLiteDatabase *)self _accessDatabaseUsingBlock:v4];
  int64_t v2 = *((int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__SSSQLiteDatabase_countChanges__block_invoke(uint64_t a1)
{
  uint64_t result = sqlite3_changes(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
}

- (void)dispatchBlockAsync:(id)a3
{
  if (dispatch_get_specific("_ISSQLiteDispatchQueueTag") == (void *)1)
  {
    uint64_t v6 = (void (*)(id))*((void *)a3 + 2);
    v6(a3);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    dispatch_async(dispatchQueue, a3);
  }
}

- (void)dispatchBlockSync:(id)a3
{
  if (dispatch_get_specific("_ISSQLiteDispatchQueueTag") == (void *)1)
  {
    uint64_t v6 = (void (*)(id))*((void *)a3 + 2);
    v6(a3);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    dispatch_sync(dispatchQueue, a3);
  }
}

- (id)newDispatchSourceWithType:(dispatch_source_type_s *)a3
{
  return dispatch_source_create(a3, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
}

- (BOOL)setUserVersion:(int64_t)a3
{
  return [(SSSQLiteDatabase *)self setUserVersion:a3 forDatabase:@"main"];
}

- (BOOL)setUserVersion:(int64_t)a3 forDatabase:(id)a4
{
  uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA %@.user_version=%ld;",
                 a4,
                 a3);
  BOOL v6 = [(SSSQLiteDatabase *)self executeSQL:v5];

  return v6;
}

- (int64_t)userVersion
{
  return [(SSSQLiteDatabase *)self userVersionForDatabase:@"main"];
}

- (int64_t)userVersionForDatabase:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  BOOL v4 = (void *)[[NSString alloc] initWithFormat:@"PRAGMA %@.user_version;", a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SSSQLiteDatabase_userVersionForDatabase___block_invoke;
  v7[3] = &unk_1E5BACE58;
  v7[4] = self;
  v7[5] = &v8;
  [(SSSQLiteDatabase *)self prepareStatementForSQL:v4 cache:0 usingBlock:v7];

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __43__SSSQLiteDatabase_userVersionForDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  if ([*(id *)(a1 + 32) statementHasRowAfterStepping:a2])
  {
    id v4 = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 integerValue];
  }
}

+ (void)_setTakesTaskCompletionAssertions:(BOOL)a3
{
  __TakesTaskCompletionAssertions = a3;
}

- (void)beginTaskCompletionAssertion
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SSSQLiteDatabase_beginTaskCompletionAssertion__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __48__SSSQLiteDatabase_beginTaskCompletionAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginTaskCompletionAssertion];
}

- (void)endTaskCompletionAssertion
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SSSQLiteDatabase_endTaskCompletionAssertion__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__SSSQLiteDatabase_endTaskCompletionAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endTaskCompletionAssertion];
}

- (void)expireBackgroundTask
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSSQLiteDatabase_expireBackgroundTask__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SSSQLiteDatabase_expireBackgroundTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _expireBackgroundTask];
}

- (void)setTakesTaskCompletionAssertions:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SSSQLiteDatabase_setTakesTaskCompletionAssertions___block_invoke;
  v4[3] = &unk_1E5BA8488;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __53__SSSQLiteDatabase_setTakesTaskCompletionAssertions___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)takesTaskCompletionAssertions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SSSQLiteDatabase_takesTaskCompletionAssertions__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__SSSQLiteDatabase_takesTaskCompletionAssertions__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

- (int)_closeDatabaseIfOpen
{
  db = self->_db;
  if (db)
  {
    if (self->_statementCache)
    {
      CFRelease(self->_statementCache);
      self->_statementCache = 0;
      db = self->_db;
    }
    stmt = sqlite3_next_stmt(db, 0);
    if (stmt)
    {
      BOOL v5 = stmt;
      do
      {
        sqlite3_finalize(v5);
        BOOL v5 = sqlite3_next_stmt(self->_db, v5);
      }
      while (v5);
    }
    LODWORD(db) = sqlite3_close(self->_db);
    if (!db) {
      self->_db = 0;
    }
  }
  return (int)db;
}

void __47__SSSQLiteDatabase__endTaskCompletionAssertion__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 80);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 80) = v4;
    if (!*(void *)(*(void *)(a1 + 32) + 80))
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
        v8 &= 2u;
      }
      if (v8)
      {
        int v20 = 138412290;
        uint64_t v21 = objc_opt_class();
        LODWORD(v19) = 12;
        uint64_t v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v20, v19);
          free(v10);
          SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, v11);
        }
      }
      uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 72);
      if (v18)
      {
        [v18 invalidate];

        *(void *)(*(void *)(a1 + 32) + 72) = 0;
      }
    }
  }
}

- (void)_expireBackgroundTask
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_takesTaskCompletionAssertions && self->_taskAssertion)
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class();
      LODWORD(v16) = 12;
      uint64_t v15 = &v17;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        int v7 = (void *)v6;
        uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v17, v16);
        free(v7);
        SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, v8);
      }
    }
    self->_int64_t taskAssertionCount = 0;
    [(BKSProcessAssertion *)self->_taskAssertion invalidate];

    self->_taskAssertion = 0;
  }
}

- (int)_openFlags
{
  if (self->_readOnly) {
    int v2 = 1;
  }
  else {
    int v2 = 6;
  }
  protectionType = self->_protectionType;
  if (protectionType)
  {
    if ([(NSString *)self->_protectionType isEqualToString:*MEMORY[0x1E4F28378]])
    {
      int v4 = 0x400000;
    }
    else if ([(NSString *)protectionType isEqualToString:*MEMORY[0x1E4F28340]])
    {
      int v4 = 0x100000;
    }
    else if ([(NSString *)protectionType isEqualToString:*MEMORY[0x1E4F28348]])
    {
      int v4 = 0x200000;
    }
    else if ([(NSString *)protectionType isEqualToString:*MEMORY[0x1E4F28358]])
    {
      int v4 = 3145728;
    }
    else
    {
      int v4 = 0;
    }
    return v4 | v2;
  }
  return v2;
}

- (int)_resetAndReopenDatabaseWithPath:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = [(SSSQLiteDatabase *)self _closeDatabaseIfOpen];
  if (v5)
  {
    int v6 = v5;
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v21 = 138412802;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 1024;
      int v24 = v6;
      __int16 v25 = 2080;
      __int16 v26 = sqlite3_errstr(v6);
      LODWORD(v20) = 28;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v20);
        free(v11);
        SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, v12);
      }
    }
  }
  if (self->_readOnly) {
    return 1;
  }
  [(SSSQLiteDatabase *)self _resetDatabaseWithPath:a3];
  return sqlite3_open_v2((const char *)[a3 fileSystemRepresentation], &self->_db, -[SSSQLiteDatabase _openFlags](self, "_openFlags"), 0);
}

- (void)_resetCorruptDatabase
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_readOnly)
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v5 &= 2u;
    }
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      databasePath = self->_databasePath;
      int v32 = 138412546;
      uint64_t v33 = v6;
      __int16 v34 = 2112;
      __int16 v35 = databasePath;
      LODWORD(v31) = 22;
      uint64_t v30 = &v32;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        int v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v32, v31);
        free(v9);
        SSFileLog(v3, @"%@", v11, v12, v13, v14, v15, v16, v10);
      }
    }
    -[SSSQLiteDatabase _resetDatabaseWithPath:](self, "_resetDatabaseWithPath:", self->_databasePath, v30);
    [(SSSQLiteDatabase *)self _openDatabaseIfNotOpen];
    if (self->_setupBlock)
    {
      id v17 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig];
      }
      int v18 = [v17 shouldLog];
      if ([v17 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      if (os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        int v20 = v19;
      }
      else {
        int v20 = v19 & 2;
      }
      if (v20)
      {
        LOWORD(v32) = 0;
        LODWORD(v31) = 2;
        uint64_t v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          uint64_t v22 = (void *)v21;
          uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v32, v31);
          free(v22);
          SSFileLog(v17, @"%@", v24, v25, v26, v27, v28, v29, v23);
        }
      }
      (*((void (**)(void))self->_setupBlock + 2))();
    }
  }
}

- (void)_resetDatabaseWithPath:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!self->_db) {
    goto LABEL_14;
  }
  char v5 = CPSqliteDatabaseDelete();
  int v6 = [(SSSQLiteDatabase *)self _closeDatabaseIfOpen];
  if (v6)
  {
    int v7 = v6;
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v32 = 138412802;
      uint64_t v33 = objc_opt_class();
      __int16 v34 = 1024;
      int v35 = v7;
      __int16 v36 = 2080;
      uint64_t v37 = sqlite3_errstr(v7);
      LODWORD(v26) = 28;
      uint64_t v25 = &v32;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v32, v26);
        free(v12);
        SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  if ((v5 & 1) == 0)
  {
LABEL_14:
    id v20 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v21 = [&unk_1EF9A99C0 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(&unk_1EF9A99C0);
          }
          objc_msgSend(v20, "removeItemAtPath:error:", objc_msgSend(a3, "stringByAppendingString:", *(void *)(*((void *)&v27 + 1) + 8 * i), v25), 0);
        }
        uint64_t v22 = [&unk_1EF9A99C0 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v22);
    }
  }
}

- (id)setupBlock
{
  return self->_setupBlock;
}

- (void)setSetupBlock:(id)a3
{
}

@end