@interface PBFSQLiteDatabaseConnection
+ (uint64_t)_sqliteOpenFlagsForDataProtectionClass:(uint64_t)a1;
- (BOOL)executeQuery:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5 error:(id *)a6;
- (BOOL)executeQuery:(id)a3 error:(id *)a4;
- (BOOL)executeQuery:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (BOOL)truncateDatabaseAndReturnError:(id *)a3;
- (OS_os_log)loggingCategory;
- (PBFSQLiteDatabaseConnection)init;
- (PBFSQLiteDatabaseConnection)initWithFileURL:(id)a3 dataProtectionClass:(unint64_t)a4;
- (PBFSQLiteDatabaseConnection)initWithFileURL:(id)a3 options:(int)a4 dataProtectionClass:(unint64_t)a5 error:(id *)a6;
- (PBFSQLiteDatabaseConnection)initWithInMemoryDatabase;
- (id)dataDumpForTable:(uint64_t)a3 error:;
- (id)dataDumpResultOfAllTablesWithError:(id *)a3;
- (id)dataDumpResultOfQuery:(id)a3 error:(id *)a4;
- (id)dataDumpResultOfTable:(id)a3 error:(id *)a4;
- (id)lastErrorMessage;
- (id)prepareStatement:(id)a3;
- (id)tableNames;
- (void)_closeConnection;
- (void)_queue_close;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performSyncWithDatabase:(uint64_t)a1;
- (void)performWithDatabase:(uint64_t)a1;
- (void)removeObserver:(id)a3;
- (void)setLoggingCategory:(id)a3;
@end

@implementation PBFSQLiteDatabaseConnection

- (PBFSQLiteDatabaseConnection)init
{
  v4 = [NSString stringWithFormat:@"init is not allowed"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"PBFSQLiteDatabaseConnection.m";
    __int16 v17 = 1024;
    int v18 = 48;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (PBFSQLiteDatabaseConnection *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PBFSQLiteDatabaseConnection)initWithInMemoryDatabase
{
  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteDatabaseConnection;
  v2 = [(PBFSQLiteDatabaseConnection *)&v6 init];
  v3 = v2;
  if (!v2 || (v4 = 0, PBFSQLiteDatabaseConnectionSharedInit(v2, @":memory:", 6, 2, 0))) {
    v4 = v3;
  }

  return v4;
}

- (PBFSQLiteDatabaseConnection)initWithFileURL:(id)a3 dataProtectionClass:(unint64_t)a4
{
  id v6 = a3;
  if (([v6 isFileURL] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PBFSQLiteDatabaseConnection.m", 62, @"url must be a fileURL : url=%@", v6 object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PBFSQLiteDatabaseConnection;
  v7 = [(PBFSQLiteDatabaseConnection *)&v13 init];
  if (!v7
    || ([v6 path],
        v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = PBFSQLiteDatabaseConnectionSharedInit(v7, v8, 6, 2, 0),
        v8,
        v10 = 0,
        v9))
  {
    v10 = v7;
  }

  return v10;
}

- (PBFSQLiteDatabaseConnection)initWithFileURL:(id)a3 options:(int)a4 dataProtectionClass:(unint64_t)a5 error:(id *)a6
{
  id v11 = a3;
  if (([v11 isFileURL] & 1) == 0)
  {
    __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PBFSQLiteDatabaseConnection.m", 73, @"url must be a fileURL : url=%@", v11 object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PBFSQLiteDatabaseConnection;
  v12 = [(PBFSQLiteDatabaseConnection *)&v18 init];
  if (v12
    && ([v11 path],
        objc_super v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = PBFSQLiteDatabaseConnectionSharedInit(v12, v13, a4, a5, a6),
        v13,
        !v14))
  {
    __int16 v15 = 0;
  }
  else
  {
    __int16 v15 = v12;
  }

  return v15;
}

+ (uint64_t)_sqliteOpenFlagsForDataProtectionClass:(uint64_t)a1
{
  if ((unint64_t)(a2 - 1) >= 3) {
    return 0x100000;
  }
  else {
    return (0x400000 - ((a2 - 1) << 20));
  }
}

- (void)_closeConnection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(sqlite3 **)(a1 + 24);
    if (v2)
    {
      int v3 = sqlite3_close_v2(v2);
      v4 = [(id)a1 loggingCategory];
      v5 = v4;
      if (v3)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          id v6 = [*(id *)(a1 + 8) lastPathComponent];
          v7 = sqlite3_errstr(v3);
          uint64_t v8 = *(void *)(a1 + 24);
          int v11 = 134219266;
          uint64_t v12 = a1;
          __int16 v13 = 2112;
          BOOL v14 = v6;
          __int16 v15 = 2080;
          v16 = "-[PBFSQLiteDatabaseConnection _closeConnection]";
          __int16 v17 = 1024;
          *(_DWORD *)objc_super v18 = v3;
          *(_WORD *)&v18[4] = 2082;
          *(void *)&v18[6] = v7;
          __int16 v19 = 2048;
          uint64_t v20 = v8;
          _os_log_error_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_ERROR, "[%p/'%@'] %s: got error %d (%{public}s) closing database connection %p", (uint8_t *)&v11, 0x3Au);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = [*(id *)(a1 + 8) lastPathComponent];
        uint64_t v10 = *(void *)(a1 + 24);
        int v11 = 134218754;
        uint64_t v12 = a1;
        __int16 v13 = 2112;
        BOOL v14 = v9;
        __int16 v15 = 2080;
        v16 = "-[PBFSQLiteDatabaseConnection _closeConnection]";
        __int16 v17 = 2048;
        *(void *)objc_super v18 = v10;
        _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "[%p/'%@'] %s: successfully closed database connection %p", (uint8_t *)&v11, 0x2Au);
      }
      *(void *)(a1 + 24) = 0;
    }
  }
}

- (void)dealloc
{
  if (self->_queue_dbConnection)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PBFSQLiteDatabaseConnection.m" lineNumber:106 description:@"database must be closed before dealloc"];
  }
  if (self->_queue_queryCache)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PBFSQLiteDatabaseConnection.m" lineNumber:107 description:@"database must be closed before dealloc"];
  }
  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteDatabaseConnection;
  [(PBFSQLiteDatabaseConnection *)&v6 dealloc];
}

- (id)prepareStatement:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PBFSQLiteDatabaseConnection.m", 113, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  objc_super v6 = [(NSCache *)self->_queue_queryCache objectForKey:v5];
  if (!v6)
  {
    objc_super v6 = +[PBFSQLitePreparedStatement _newPreparedStatementForDatabaseConnection:withSQLQuery:]((uint64_t)PBFSQLitePreparedStatement, self, v5);
    v7 = [(PBFSQLiteDatabaseConnection *)self loggingCategory];
    [v6 setLoggingCategory:v7];

    uint64_t v8 = [(PBFSQLiteDatabaseConnection *)self loggingCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = [(NSString *)self->_sqliteDatabasePath lastPathComponent];
      *(_DWORD *)buf = 134218498;
      v16 = self;
      __int16 v17 = 2114;
      objc_super v18 = v9;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_INFO, "[%p/'%{public}@'] preparing new statement %@", buf, 0x20u);
    }
    uint64_t v10 = [(PBFSQLiteDatabaseConnection *)self loggingCategory];
    int v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [(NSString *)self->_sqliteDatabasePath lastPathComponent];
        *(_DWORD *)buf = 134218498;
        v16 = self;
        __int16 v17 = 2114;
        objc_super v18 = v12;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_INFO, "[%p/'%{public}@'] prepared new statement %@", buf, 0x20u);
      }
      int v11 = [v5 copy];
      [(NSCache *)self->_queue_queryCache setObject:v6 forKey:v11];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(PBFSQLiteDatabaseConnection *)(uint64_t)self prepareStatement:v11];
      }
      objc_super v6 = 0;
    }
  }
  return v6;
}

- (BOOL)executeQuery:(id)a3 error:(id *)a4
{
  return [(PBFSQLiteDatabaseConnection *)self executeQuery:a3 bindings:0 resultRowHandler:0 error:a4];
}

- (BOOL)executeQuery:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  return [(PBFSQLiteDatabaseConnection *)self executeQuery:a3 bindings:0 resultRowHandler:a4 error:a5];
}

- (BOOL)executeQuery:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = +[PBFSQLitePreparedStatement _newPreparedStatementForDatabaseConnection:withSQLQuery:]((uint64_t)PBFSQLitePreparedStatement, self, v10);
  BOOL v14 = [(PBFSQLiteDatabaseConnection *)self loggingCategory];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = [(NSString *)self->_sqliteDatabasePath lastPathComponent];
    *(_DWORD *)buf = 134218498;
    v24 = self;
    __int16 v25 = 2114;
    v26 = v15;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_INFO, "[%p/'%{public}@'] executing statement %@", buf, 0x20u);
  }
  id v22 = 0;
  char v16 = [v13 executeWithBindings:v12 resultRowHandler:v11 error:&v22];

  id v17 = v22;
  objc_super v18 = v17;
  if (v17)
  {
    if (a6) {
      *a6 = v17;
    }
    __int16 v19 = [(PBFSQLiteDatabaseConnection *)self loggingCategory];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [(NSString *)self->_sqliteDatabasePath lastPathComponent];
      *(_DWORD *)buf = 134218754;
      v24 = self;
      __int16 v25 = 2114;
      v26 = v21;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_error_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_ERROR, "[%p/'%{public}@'] failed to execute SQL statement %@: %@", buf, 0x2Au);
    }
  }

  return v16;
}

- (BOOL)truncateDatabaseAndReturnError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__0;
  id v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PBFSQLiteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke;
  v11[3] = &unk_1E6981E08;
  v11[4] = &v16;
  v11[5] = &v12;
  -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)self, v11);
  if (v17[5])
  {
    id v5 = [(PBFSQLiteDatabaseConnection *)self loggingCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_super v6 = [(NSString *)self->_sqliteDatabasePath lastPathComponent];
      uint64_t v7 = v17[5];
      *(_DWORD *)buf = 134218498;
      v23 = self;
      __int16 v24 = 2114;
      __int16 v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      _os_log_error_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_ERROR, "[%p/'%{public}@'] failed to truncate database w/ error: %@", buf, 0x20u);
    }
  }
  else
  {
    id v5 = [(PBFSQLiteDatabaseConnection *)self loggingCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(NSString *)self->_sqliteDatabasePath lastPathComponent];
      -[PBFSQLiteDatabaseConnection truncateDatabaseAndReturnError:]((uint64_t)self, v8, buf, v5);
    }
  }

  if (a3) {
    *a3 = (id) v17[5];
  }
  BOOL v9 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __62__PBFSQLiteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v4 = sqlite3_file_control(a2, 0, 101, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_super v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = [NSString stringWithUTF8String:sqlite3_errmsg(a2)];
    uint64_t v8 = objc_msgSend(v6, "pbf_sqliteDatabaseErrorWithCode:errorMessage:", v5, v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)performSyncWithDatabase:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PBFSQLiteDatabaseConnection_performSyncWithDatabase___block_invoke;
    v6[3] = &unk_1E6981220;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

- (void)performWithDatabase:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PBFSQLiteDatabaseConnection_performWithDatabase___block_invoke;
    v6[3] = &unk_1E6981220;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __51__PBFSQLiteDatabaseConnection_performWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24));
}

uint64_t __55__PBFSQLiteDatabaseConnection_performSyncWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24));
}

- (id)lastErrorMessage
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PBFSQLiteDatabaseConnection_lastErrorMessage__block_invoke;
  v4[3] = &unk_1E6981E30;
  v4[4] = &v5;
  -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__PBFSQLiteDatabaseConnection_lastErrorMessage__block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v3 = [NSString stringWithUTF8String:sqlite3_errmsg(a2)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)invalidate
{
  v1 = [*(id *)(a1 + 8) lastPathComponent];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1D31CE000, v2, v3, "[%p/'%{public}@'] invalidating", v4, v5, v6, v7, 2u);
}

void __41__PBFSQLiteDatabaseConnection_invalidate__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  -[PBFSQLiteDatabaseConnection _queue_close](*(void *)(a1 + 32));
  uint64_t v2 = [*v1 loggingCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __41__PBFSQLiteDatabaseConnection_invalidate__block_invoke_cold_1((uint64_t)v1);
  }
}

- (void)_queue_close
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "sqliteDatabaseConnectionWillClose:", a1, (void)v10);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }

    uint64_t v8 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    [*(id *)(a1 + 32) removeAllObjects];
    uint64_t v9 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    -[PBFSQLiteDatabaseConnection _closeConnection](a1);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PBFSQLiteDatabaseConnection_addObserver___block_invoke;
  v7[3] = &unk_1E69808E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __43__PBFSQLiteDatabaseConnection_addObserver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PBFSQLiteDatabaseConnection_removeObserver___block_invoke;
  v7[3] = &unk_1E69808E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __46__PBFSQLiteDatabaseConnection_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (id)dataDumpResultOfQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PBFSQLiteDatabaseConnection_dataDumpResultOfQuery_error___block_invoke;
  v10[3] = &unk_1E6981E58;
  id v8 = v7;
  id v11 = v8;
  [(PBFSQLiteDatabaseConnection *)self executeQuery:v6 resultRowHandler:v10 error:a4];

  return v8;
}

void __59__PBFSQLiteDatabaseConnection_dataDumpResultOfQuery_error___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_opt_new();
  if ([v9 count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v9 keyAtIndex:v4];
      id v6 = (void *)[v5 copy];

      uint64_t v7 = [v9 objectForKey:v6];
      id v8 = (void *)[v7 copy];
      [v3 setObject:v8 forKeyedSubscript:v6];

      ++v4;
    }
    while (v4 < [v9 count]);
  }
  objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v3);
}

- (id)dataDumpResultOfTable:(id)a3 error:(id *)a4
{
  id v6 = [NSString stringWithFormat:@"SELECT * FROM '%@'", a3];
  uint64_t v7 = [(PBFSQLiteDatabaseConnection *)self dataDumpResultOfQuery:v6 error:a4];

  return v7;
}

- (id)dataDumpForTable:(uint64_t)a3 error:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = objc_opt_new();
    uint64_t v7 = [NSString stringWithFormat:@"SELECT * FROM %@;", v5];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PBFSQLiteDatabaseConnection_dataDumpForTable_error___block_invoke;
    v10[3] = &unk_1E6981E58;
    id v8 = v6;
    id v11 = v8;
    [a1 executeQuery:v7 resultRowHandler:v10 error:a3];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

void __54__PBFSQLiteDatabaseConnection_dataDumpForTable_error___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_opt_new();
  if ([v9 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [v9 keyAtIndex:v4];
      id v6 = (void *)[v5 copy];

      uint64_t v7 = [v9 objectForKey:v6];
      id v8 = (void *)[v7 copy];
      [v3 setObject:v8 forKeyedSubscript:v6];

      ++v4;
    }
    while (v4 < [v9 count]);
  }
  objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v3);
}

- (id)dataDumpResultOfAllTablesWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(PBFSQLiteDatabaseConnection *)self tableNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        long long v12 = -[PBFSQLiteDatabaseConnection dataDumpForTable:error:](self, v11, (uint64_t)&v16);
        id v13 = v16;
        if (v13)
        {
          uint64_t v14 = v13;
          if (a3) {
            *a3 = v13;
          }

          goto LABEL_13;
        }
        [v5 setObject:v12 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

- (id)tableNames
{
  uint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PBFSQLiteDatabaseConnection_tableNames__block_invoke;
  v6[3] = &unk_1E6981E58;
  id v4 = v3;
  id v7 = v4;
  [(PBFSQLiteDatabaseConnection *)self executeQuery:@"SELECT tbl_name from sqlite_master WHERE type = 'table' AND tbl_name NOT LIKE 'sqlite_%'" resultRowHandler:v6 error:0];

  return v4;
}

void __41__PBFSQLiteDatabaseConnection_tableNames__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringForKey:@"tbl_name"];
  [v2 addObject:v3];
}

- (OS_os_log)loggingCategory
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLoggingCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_queryCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sqliteDatabasePath, 0);
}

- (void)prepareStatement:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = [*(id *)(a1 + 8) lastPathComponent];
  int v7 = 134218498;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_0_0();
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D31CE000, a3, OS_LOG_TYPE_ERROR, "[%p/'%{public}@'] failed to prepare new statement %@", (uint8_t *)&v7, 0x20u);
}

- (void)truncateDatabaseAndReturnError:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D31CE000, log, OS_LOG_TYPE_DEBUG, "[%p/'%{public}@'] successfully truncated database", buf, 0x16u);
}

void __41__PBFSQLiteDatabaseConnection_invalidate__block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(*(void *)a1 + 8) lastPathComponent];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1D31CE000, v2, v3, "[%p/'%{public}@'] invalidated", v4, v5, v6, v7, 2u);
}

@end