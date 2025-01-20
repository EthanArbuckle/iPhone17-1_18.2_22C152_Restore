@interface WBSSQLiteStore
- (BOOL)_acquireDatabaseCoordinationLockForDatabaseURL:(id)a3;
- (BOOL)_confirmDatabaseIntegrityIsOK;
- (BOOL)_isDatabaseLocked;
- (BOOL)isOpen;
- (NSURL)databaseURL;
- (OS_dispatch_queue)databaseQueue;
- (WBSSQLiteDatabase)database;
- (WBSSQLiteStore)initWithURL:(id)a3;
- (WBSSQLiteStore)initWithURL:(id)a3 protectionType:(int64_t)a4;
- (WBSSQLiteStoreDelegate)delegate;
- (id)_databaseCoordinationLockURLForDatabaseURL:(id)a3;
- (int)_createFreshDatabaseSchema;
- (int)_currentSchemaVersion;
- (int)_migrateToCurrentSchemaVersionIfNecessary;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (void)_closeDatabase;
- (void)_confirmDatabaseIntegrityIsOK;
- (void)_handleOpenFailureWithStatus:(int64_t)a3 completionHandler:(id)a4;
- (void)_openDatabase:(id)a3 createIfNeeded:(BOOL)a4 checkIntegrity:(BOOL)a5 completionHandler:(id)a6;
- (void)_releaseDatabaseCoordinationLock;
- (void)closeWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 lockingPolicy:(int64_t)a6 completionHandler:(id)a7;
- (void)savePendingChangesBeforeTermination;
- (void)setDelegate:(id)a3;
@end

@implementation WBSSQLiteStore

- (WBSSQLiteStore)initWithURL:(id)a3
{
  return [(WBSSQLiteStore *)self initWithURL:a3 protectionType:0];
}

- (WBSSQLiteDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)databaseQueue
{
  return self->_databaseQueue;
}

- (void)setDelegate:(id)a3
{
}

void __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 48);
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = *(unsigned char *)(a1 + 56);
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[4];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 58);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2;
  v5[3] = &unk_1E615DCE0;
  id v6 = *(id *)(a1 + 40);
  [v1 _openDatabase:v2 createIfNeeded:v3 checkIntegrity:v4 completionHandler:v5];
}

- (void)_openDatabase:(id)a3 createIfNeeded:(BOOL)a4 checkIntegrity:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v12 = [[WBSSQLiteDatabase alloc] initWithURL:v10 queue:self->_databaseQueue];
  database = self->_database;
  self->_database = v12;

  v14 = self->_database;
  if (v8) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  int64_t protectionType = self->_protectionType;
  id v39 = 0;
  BOOL v17 = [(WBSSQLiteDatabase *)v14 openWithAccessType:v15 protectionType:protectionType vfs:0 error:&v39];
  id v18 = v39;
  if (!v17)
  {
    v23 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(v18, "safari_privacyPreservingDescription");
      -[WBSSQLiteStore _openDatabase:createIfNeeded:checkIntegrity:completionHandler:]((uint64_t)v10, v24, (uint64_t)location);
    }

    uint64_t v25 = 1;
    goto LABEL_23;
  }
  if (self->_databaseLockingPolicy == 1
    && ![(WBSSQLiteStore *)self _acquireDatabaseCoordinationLockForDatabaseURL:v10])
  {
    v29 = WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[WBSSQLiteStore _openDatabase:createIfNeeded:checkIntegrity:completionHandler:]((uint64_t)v10, v29);
    }
    uint64_t v25 = 2;
LABEL_23:
    [(WBSSQLiteStore *)self _handleOpenFailureWithStatus:v25 completionHandler:v11];
    goto LABEL_24;
  }
  if (v7 && ![(WBSSQLiteStore *)self _confirmDatabaseIntegrityIsOK])
  {
    objc_initWeak(location, self);
    [(WBSSQLiteStore *)self _closeDatabase];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v31 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke;
      block[3] = &unk_1E615DD80;
      objc_copyWeak(&v37, location);
      id v34 = WeakRetained;
      id v35 = v10;
      BOOL v38 = v8;
      id v36 = v11;
      dispatch_async(v31, block);

      objc_destroyWeak(&v37);
    }
    else
    {
      [(WBSSQLiteStore *)self _handleOpenFailureWithStatus:3 completionHandler:v11];
    }

    objc_destroyWeak(location);
  }
  else
  {
    v19 = self->_database;
    id v32 = v18;
    BOOL v20 = [(WBSSQLiteDatabase *)v19 enableWAL:&v32];
    id v21 = v32;

    if (v20)
    {
      SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA foreign_keys = ON");
      if ([(WBSSQLiteStore *)self _migrateToCurrentSchemaVersionIfNecessary])
      {
        uint64_t v22 = 0;
      }
      else
      {
        uint64_t v22 = 3;
      }
      id v18 = v21;
      (*((void (**)(id, uint64_t))v11 + 2))(v11, v22);
    }
    else
    {
      v26 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = [v10 lastPathComponent];
        v28 = objc_msgSend(v21, "safari_privacyPreservingDescription");
        -[WBSSQLiteStore _openDatabase:createIfNeeded:checkIntegrity:completionHandler:](v27, v28, (uint64_t)location);
      }

      id v18 = v21;
      [(WBSSQLiteStore *)self _handleOpenFailureWithStatus:3 completionHandler:v11];
    }
  }
LABEL_24:
}

uint64_t __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)_migrateToCurrentSchemaVersionIfNecessary
{
  uint64_t v3 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  uint64_t v4 = [v3 nextObject];
  int v5 = [v4 intAtIndex:0];

  id v6 = [v3 statement];
  [v6 invalidate];

  int v7 = [(WBSSQLiteStore *)self _currentSchemaVersion];
  if (v5 < v7)
  {
    if (!v5)
    {
      if ([(WBSSQLiteStore *)self _createFreshDatabaseSchema] != 101)
      {
        int v5 = 0;
        goto LABEL_14;
      }
      int v5 = 1;
      [(WBSSQLiteStore *)self _setDatabaseSchemaVersion:1];
    }
    if (v7 <= v5) {
      int v8 = v5;
    }
    else {
      int v8 = v7;
    }
    while (v8 != v5)
    {
      if ([(WBSSQLiteStore *)self _migrateToSchemaVersion:(v5 + 1)] != 101) {
        goto LABEL_12;
      }
      [(WBSSQLiteStore *)self _setDatabaseSchemaVersion:++v5];
    }
    int v5 = v8;
LABEL_12:
    if (v5 >= v7) {
      int v5 = v7;
    }
  }
LABEL_14:

  return v5;
}

- (BOOL)_acquireDatabaseCoordinationLockForDatabaseURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[WBSSQLiteDatabase inMemoryDatabaseURL];
  char v6 = [v4 isEqual:v5];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = [(WBSSQLiteStore *)self _databaseCoordinationLockURLForDatabaseURL:v4];
  int v8 = (const char *)[v7 fileSystemRepresentation];

  self->_databaseCoordinationLockFileDescriptor = open(v8, 512, 438);
  if (![(WBSSQLiteStore *)self _isDatabaseLocked])
  {
    id v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = __error();
      [(WBSSQLiteStore *)(uint64_t)v8 _acquireDatabaseCoordinationLockForDatabaseURL:(uint64_t)v14];
    }
    goto LABEL_9;
  }
  if (flock(self->_databaseCoordinationLockFileDescriptor, 6) == -1)
  {
    close(self->_databaseCoordinationLockFileDescriptor);
    self->_databaseCoordinationLockFileDescriptor = -1;
    id v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      [(WBSSQLiteStore *)(uint64_t)v8 _acquireDatabaseCoordinationLockForDatabaseURL:(uint64_t)v14];
    }
LABEL_9:

    BOOL v9 = 0;
    goto LABEL_10;
  }
LABEL_4:
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_isDatabaseLocked
{
  return self->_databaseCoordinationLockFileDescriptor != -1;
}

- (id)_databaseCoordinationLockURLForDatabaseURL:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [(NSURL *)self->_databaseURL absoluteString];
  int v5 = [v4 stringByAppendingString:@"-lock"];
  char v6 = [v3 URLWithString:v5];

  return v6;
}

- (BOOL)_confirmDatabaseIntegrityIsOK
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(WBSSQLiteDatabase *)self->_database checkIntegrity];
  if (v2)
  {
    uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
      [(WBSSQLiteStore *)v4 _confirmDatabaseIntegrityIsOK];
    }
  }
  return v2 == 0;
}

- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 lockingPolicy:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a7;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke;
  v15[3] = &unk_1E615DD08;
  id v16 = v12;
  int64_t v17 = a6;
  BOOL v18 = a5;
  BOOL v19 = a4;
  BOOL v20 = a3;
  v15[4] = self;
  id v14 = v12;
  dispatch_async(databaseQueue, v15);
}

- (WBSSQLiteStore)initWithURL:(id)a3 protectionType:(int64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSSQLiteStore;
  int v8 = [(WBSSQLiteStore *)&v19 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databaseURL, a3);
    v9->_int64_t protectionType = a4;
    v9->_databaseCoordinationLockFileDescriptor = -1;
    id v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v11 = NSString;
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    id v14 = [v11 stringWithFormat:@"com.apple.SafariShared.%@.%p", v13, v9];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v10);
    databaseQueue = v9->_databaseQueue;
    v9->_databaseQueue = (OS_dispatch_queue *)v15;

    int64_t v17 = v9;
  }

  return v9;
}

- (void)dealloc
{
  if ([(WBSSQLiteStore *)self _isDatabaseLocked]) {
    [(WBSSQLiteStore *)self _releaseDatabaseCoordinationLock];
  }
  v3.receiver = self;
  v3.super_class = (Class)WBSSQLiteStore;
  [(WBSSQLiteStore *)&v3 dealloc];
}

- (BOOL)isOpen
{
  return self->_database != 0;
}

void __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_2;
    v5[3] = &unk_1E615DD58;
    objc_copyWeak(&v8, v2);
    id v6 = *(id *)(a1 + 40);
    char v9 = *(unsigned char *)(a1 + 64);
    id v7 = *(id *)(a1 + 48);
    [v4 sqliteStoreDidFailDatabaseIntegrityCheck:WeakRetained completionHandler:v5];

    objc_destroyWeak(&v8);
  }
}

void __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained databaseQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_3;
    v5[3] = &unk_1E615DD30;
    void v5[4] = v3;
    id v6 = *(id *)(a1 + 32);
    char v8 = *(unsigned char *)(a1 + 56);
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
}

uint64_t __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openDatabase:*(void *)(a1 + 40) createIfNeeded:*(unsigned __int8 *)(a1 + 56) checkIntegrity:0 completionHandler:*(void *)(a1 + 48)];
}

- (void)_handleOpenFailureWithStatus:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, int64_t))a4;
  [(WBSSQLiteStore *)self _closeDatabase];
  if (self->_fallBackToMemoryStoreIfError)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSSQLiteStore _handleOpenFailureWithStatus:completionHandler:](v7);
    }
    char v8 = +[WBSSQLiteDatabase inMemoryDatabaseURL];
    [(WBSSQLiteStore *)self _openDatabase:v8 createIfNeeded:1 checkIntegrity:0 completionHandler:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sqliteStoreDidFallBackToInMemoryStore:self];
  }
  else
  {
    v6[2](v6, a3);
  }
}

- (void)closeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__WBSSQLiteStore_closeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E61599E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __45__WBSSQLiteStore_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _closeDatabase];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)savePendingChangesBeforeTermination
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSSQLiteStore_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E6159820;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __53__WBSSQLiteStore_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabase];
}

- (void)_closeDatabase
{
  if ([(WBSSQLiteStore *)self isOpen])
  {
    [(WBSSQLiteStore *)self _databaseWillClose];
    if ([(WBSSQLiteStore *)self _isDatabaseLocked]) {
      [(WBSSQLiteStore *)self _releaseDatabaseCoordinationLock];
    }
    [(WBSSQLiteDatabase *)self->_database close];
    database = self->_database;
    self->_database = 0;
  }
}

- (int)_currentSchemaVersion
{
  return 1;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", *(void *)&a3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = [(NSURL *)self->_databaseURL lastPathComponent];
      -[WBSSQLiteStore _setDatabaseSchemaVersion:](v9, (uint64_t)v11, a3, v8);
    }
  }
  return v7;
}

- (int)_createFreshDatabaseSchema
{
  return 101;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  return 3;
}

- (void)_releaseDatabaseCoordinationLock
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to unlock database store coordination lock: %{errno}d", buf, 8u);
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (WBSSQLiteStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSSQLiteStoreDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_openDatabase:(uint64_t)a3 createIfNeeded:checkIntegrity:completionHandler:.cold.1(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_4((uint64_t)a1, (uint64_t)a2, a3, 5.8081e-34);
  _os_log_error_impl(&dword_1B728F000, v6, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on database at %{private}@: %{public}@", v5, 0x16u);
}

- (void)_openDatabase:(uint64_t)a1 createIfNeeded:(NSObject *)a2 checkIntegrity:completionHandler:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Failed to acquire exclusive access to database at %{private}@.", (uint8_t *)&v2, 0xCu);
}

- (void)_openDatabase:(uint64_t)a3 createIfNeeded:checkIntegrity:completionHandler:.cold.3(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_4(a1, (uint64_t)a2, a3, 5.8081e-34);
  _os_log_error_impl(&dword_1B728F000, v5, OS_LOG_TYPE_ERROR, "Failed to open database at %{private}@. Error: %{public}@", v4, 0x16u);
}

- (void)_handleOpenFailureWithStatus:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Falling back to an in-memory store", v1, 2u);
}

- (void)_confirmDatabaseIntegrityIsOK
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed database integrity check: %{public}@", buf, 0xCu);
}

- (void)_setDatabaseSchemaVersion:(int)a3 .cold.1(void *a1, uint64_t a2, int a3, NSObject *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2114;
  *(void *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_2_1(&dword_1B728F000, "Failed to set the database schema version to %d for database: %{public}@", (uint8_t *)a2, a4);
}

- (void)_acquireDatabaseCoordinationLockForDatabaseURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_8(a1, 4.8151e-34, a2, a3);
  OUTLINED_FUNCTION_2_1(&dword_1B728F000, "Failed to acquire database store coordination lock at %s: %{errno}d", v3, v4);
}

- (void)_acquireDatabaseCoordinationLockForDatabaseURL:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_8(a1, 4.8151e-34, a2, a3);
  OUTLINED_FUNCTION_2_1(&dword_1B728F000, "Failed to open database store coordination lock at %s: %{errno}d", v3, v4);
}

@end