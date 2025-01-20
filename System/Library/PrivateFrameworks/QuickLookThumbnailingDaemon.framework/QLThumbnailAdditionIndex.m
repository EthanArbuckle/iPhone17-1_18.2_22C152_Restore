@interface QLThumbnailAdditionIndex
+ (id)sharedInstance;
+ (void)registerCleanupXPCActivity;
+ (void)setUpCleanupXPCActivitySynchronously:(BOOL)a3;
- (BOOL)addThumbnailForURL:(id)a3 lastHitDate:(id)a4 size:(unint64_t)a5;
- (BOOL)addThumbnailForURL:(id)a3 size:(unint64_t)a4;
- (BOOL)dispatchSyncOnDatabaseQueue:(id)a3;
- (BOOL)hasThumbnailForURL:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5;
- (BOOL)open;
- (BOOL)removeDatabaseAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeThumbnailForURL:(id)a3;
- (BOOL)updateFileSize:(unint64_t)a3 ofThumbnailForURL:(id)a4;
- (BOOL)updateLastHitDate:(id)a3 ofThumbnailForURL:(id)a4;
- (NSURL)databaseURL;
- (PQLConnection)db;
- (QLThumbnailAdditionIndex)init;
- (QLThumbnailAdditionIndex)initWithURL:(id)a3;
- (id)allEntries;
- (id)batchOfEntriesStartingAt:(unint64_t)a3 endingAt:(unint64_t *)a4;
- (id)databaseConnection;
- (id)entriesEnumerator;
- (id)initForTesting;
- (id)makeDatabaseAtURL:(id)a3 error:(id *)a4;
- (id)openDatabaseAtURL:(id)a3 error:(id *)a4;
- (id)upgradeDatabaseIfNeeded:(id)a3 error:(id *)a4;
- (id)volumeRestrictionForMountPoint:(id)a3;
- (id)whereClauseForURL:(id)a3;
- (int)deviceForHomeDirectory;
- (int64_t)purgeOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5;
- (int64_t)purgeableSpaceOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5;
- (void)_cleanUpAfterClose;
- (void)_closeDatabaseOnItsQueue:(id)a3;
- (void)_neuterAutoRollbackHandler;
- (void)_resetDatabaseOnItsQueue:(id)a3;
- (void)addThumbnailForURLWrapper:(id)a3 size:(unint64_t)a4 completion:(id)a5;
- (void)cancelCacheDeletePurge;
- (void)cleanUpBatchOfEntries:(id)a3;
- (void)close;
- (void)enumerateCacheEntriesWithHandler:(id)a3;
- (void)flush;
- (void)hasThumbnailForURLWrapper:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5 completion:(id)a6;
- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5;
- (void)open;
- (void)performDatabaseMaintenance;
- (void)removeAllAdditions;
- (void)removeEntriesFromDatabase:(id)a3;
- (void)removeThumbnailForURL:(id)a3 completion:(id)a4;
- (void)retrieveAllAdditions:(id)a3;
- (void)setUpDatabase:(id)a3;
- (void)updateFileSize:(unint64_t)a3 ofThumbnailForURL:(id)a4 completion:(id)a5;
- (void)updateLastHitDate:(id)a3 ofThumbnailForURL:(id)a4 completion:(id)a5;
@end

@implementation QLThumbnailAdditionIndex

void __91__QLThumbnailAdditionIndex_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) db];
  uint64_t v2 = [v5 fetchObjectOfClass:objc_opt_class(), @"SELECT SUM(size) FROM thumbnails WHERE last_hit_date < %@ %@", *(void *)(a1 + 40), *(void *)(a1 + 48) sql];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)volumeRestrictionForMountPoint:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  v6[1] = 0;
  uint64_t v3 = 0;
  if (objc_msgSend(a3, "qlt_getVolumeUUID:", v6))
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v6 length:16];
    uint64_t v3 = [MEMORY[0x1E4FBA8F8] formatInjection:@"AND vol_uuid = %@", v4];
  }
  return v3;
}

- (int64_t)purgeableSpaceOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (self->_db || ([(QLThumbnailAdditionIndex *)self open], self->_db))
  {
    v9 = [(QLThumbnailAdditionIndex *)self volumeRestrictionForMountPoint:v7];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    id v27 = 0;
    v10 = [(PQLConnection *)self->_db serialQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __91__QLThumbnailAdditionIndex_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke;
    v17 = &unk_1E6D0D2B0;
    v21 = &v22;
    v18 = self;
    id v19 = v8;
    v11 = v9;
    v20 = v11;
    dispatch_sync(v10, &v14);

    int64_t v12 = objc_msgSend((id)v23[5], "longLongValue", v14, v15, v16, v17, v18);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v11 = _log_2();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex(CacheDelete) purgeableSpaceOnMountPoint:withUrgency:beforeDate:](v11);
    }
    int64_t v12 = 0;
  }

  return v12;
}

- (PQLConnection)db
{
  return (PQLConnection *)objc_getProperty(self, a2, 16, 1);
}

+ (void)registerCleanupXPCActivity
{
  uint64_t v2 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54__QLThumbnailAdditionIndex_registerCleanupXPCActivity__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.quicklook.cloudThumbnailDatabaseCleanup", v2, handler);
}

void __54__QLThumbnailAdditionIndex_registerCleanupXPCActivity__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) == 2)
  {
    id v3 = [*(id *)(a1 + 32) sharedInstance];
    [v3 performDatabaseMaintenance];
  }
}

+ (void)setUpCleanupXPCActivitySynchronously:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke;
  v3[3] = &__block_descriptor_41_e5_v8__0l;
  BOOL v4 = a3;
  v3[4] = a1;
  if (setUpCleanupXPCActivitySynchronously__once != -1) {
    dispatch_once(&setUpCleanupXPCActivitySynchronously__once, v3);
  }
}

void __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 registerCleanupXPCActivity];
  }
  else
  {
    id v3 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

uint64_t __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerCleanupXPCActivity];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__QLThumbnailAdditionIndex_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, block);
  }
  uint64_t v2 = (void *)sSharedInstance;
  return v2;
}

uint64_t __42__QLThumbnailAdditionIndex_sharedInstance__block_invoke(uint64_t result)
{
  if (!sSharedInstance)
  {
    uint64_t v1 = result;
    id v2 = objc_alloc_init(*(Class *)(result + 32));
    id v3 = (void *)sSharedInstance;
    sSharedInstance = (uint64_t)v2;

    BOOL v4 = *(void **)(v1 + 32);
    return [v4 setUpCleanupXPCActivitySynchronously:0];
  }
  return result;
}

- (QLThumbnailAdditionIndex)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLThumbnailAdditionIndex;
  v6 = [(QLThumbnailAdditionIndex *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_exitsOnCorruption = 1;
  }

  return v7;
}

- (BOOL)open
{
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_db)
  {
    id v3 = _log_2();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[QLThumbnailAdditionIndex open]();
    }
  }
  else
  {
    url = v2->_url;
    id v7 = 0;
    id v5 = [(QLThumbnailAdditionIndex *)v2 openDatabaseAtURL:url error:&v7];
    id v3 = v7;
    if (v5) {
      objc_storeStrong((id *)&v2->_db, v5);
    }
  }
  objc_sync_exit(v2);

  return 1;
}

- (void)_cleanUpAfterClose
{
  dbWatcher = self->_dbWatcher;
  if (dbWatcher)
  {
    dispatch_source_cancel(dbWatcher);
    BOOL v4 = self->_dbWatcher;
    self->_dbWatcher = 0;
  }
}

- (void)_closeDatabaseOnItsQueue:(id)a3
{
  BOOL v4 = (PQLConnection *)a3;
  id v8 = 0;
  char v5 = [(PQLConnection *)v4 close:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    id v7 = _log_2();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex _closeDatabaseOnItsQueue:]();
    }
  }
  if (self->_db == v4)
  {
    self->_db = 0;
  }
}

- (BOOL)dispatchSyncOnDatabaseQueue:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  char v5 = self->_db;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  id v6 = [(PQLConnection *)v5 serialQueue];

  if (v6)
  {
    id v7 = [(PQLConnection *)v5 serialQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__QLThumbnailAdditionIndex_dispatchSyncOnDatabaseQueue___block_invoke;
    v10[3] = &unk_1E6D0D108;
    v11 = v5;
    int64_t v12 = self;
    uint64_t v14 = &v15;
    v13 = v4;
    dispatch_sync(v7, v10);

    BOOL v8 = *((unsigned char *)v16 + 24) != 0;
  }
  else
  {
    v4[2](v4);
    BOOL v8 = 1;
  }
  _Block_object_dispose(&v15, 8);

  return v8;
}

void *__56__QLThumbnailAdditionIndex_dispatchSyncOnDatabaseQueue___block_invoke(void *result)
{
  if (result[4] == *(void *)(result[5] + 16)) {
    return (void *)(*(uint64_t (**)(void))(result[6] + 16))();
  }
  *(unsigned char *)(*(void *)(result[7] + 8) + 24) = 0;
  return result;
}

- (void)close
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__QLThumbnailAdditionIndex_close__block_invoke;
  v3[3] = &unk_1E6D0C648;
  v3[4] = self;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v3];
  [(QLThumbnailAdditionIndex *)self _cleanUpAfterClose];
}

void __33__QLThumbnailAdditionIndex_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 db];
  [v1 _closeDatabaseOnItsQueue:v2];
}

- (void)flush
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__QLThumbnailAdditionIndex_flush__block_invoke;
  v2[3] = &unk_1E6D0C648;
  v2[4] = self;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v2];
}

void __33__QLThumbnailAdditionIndex_flush__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) db];
  [v1 flush];
}

- (void)setUpDatabase:(id)a3
{
  id v4 = a3;
  [v4 useSerialQueue];
  char v5 = [v4 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke;
  block[3] = &unk_1E6D0C648;
  id v6 = v4;
  id v23 = v6;
  dispatch_sync(v5, block);

  dbWatcher = self->_dbWatcher;
  if (dbWatcher)
  {
    dispatch_source_cancel(dbWatcher);
    BOOL v8 = self->_dbWatcher;
    self->_dbWatcher = 0;
  }
  id v9 = [v6 url];
  v10 = (const char *)[v9 fileSystemRepresentation];

  LODWORD(v9) = open(v10, 32772);
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], (int)v9, 1uLL, 0);
  int64_t v12 = self->_dbWatcher;
  self->_dbWatcher = v11;

  objc_initWeak(&location, self);
  v13 = self->_dbWatcher;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2;
  handler[3] = &unk_1E6D0D130;
  objc_copyWeak(&v20, &location);
  id v19 = v6;
  id v14 = v6;
  dispatch_source_set_event_handler(v13, handler);
  uint64_t v15 = self->_dbWatcher;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_6;
  v16[3] = &__block_descriptor_36_e5_v8__0l;
  int v17 = (int)v9;
  dispatch_source_set_cancel_handler(v15, v16);
  dispatch_resume((dispatch_object_t)self->_dbWatcher);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) useBatchingWithDelay:500 changeCount:2.0];
}

void __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2(uint64_t a1)
{
  id v2 = _log_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_5;
  v4[3] = &unk_1E6D0D130;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  [WeakRetained dispatchSyncOnDatabaseQueue:v4];

  objc_destroyWeak(&v6);
}

void __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resetDatabaseOnItsQueue:*(void *)(a1 + 32)];
}

uint64_t __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_6(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)upgradeDatabaseIfNeeded:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _log_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:].cold.4();
  }

  id v7 = [v5 userVersion];
  v28 = v7;
  if (v7)
  {
    unsigned int v8 = [v7 unsignedIntValue];
    if (v8 <= 2)
    {
      v29 = v39;
      *(void *)&long long v9 = 67109376;
      long long v27 = v9;
      do
      {
        char v18 = _log_2();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          if (v8) {
            unsigned int v24 = v8 + 1;
          }
          else {
            unsigned int v24 = 0;
          }
          *(_DWORD *)&buf[4] = v8;
          LOWORD(v37) = 1024;
          *(_DWORD *)((char *)&v37 + 2) = v24;
          _os_log_debug_impl(&dword_1DDC5E000, v18, OS_LOG_TYPE_DEBUG, "migrating database from version %d to %d", buf, 0xEu);
        }

        *(void *)buf = 0;
        v37 = buf;
        uint64_t v38 = 0x3032000000;
        v39[0] = __Block_byref_object_copy__3;
        v39[1] = __Block_byref_object_dispose__3;
        id v40 = 0;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke;
        v30[3] = &unk_1E6D0D178;
        unsigned int v31 = v8;
        v30[4] = buf;
        char v11 = [v5 performWithFlags:10 action:v30];
        if (a4)
        {
          id v19 = (void *)*((void *)v37 + 5);
          if (v19) {
            *a4 = v19;
          }
        }
        id v20 = objc_msgSend(v5, "userVersion", v27, v28, v29);
        BOOL v21 = v8 + 1 == [v20 unsignedIntValue];

        if (!v21)
        {
          uint64_t v22 = _log_2();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v25 = [v5 userVersion];
            int v26 = [v25 unsignedIntValue];
            *(_DWORD *)v32 = v27;
            int v33 = v26;
            __int16 v34 = 1024;
            unsigned int v35 = v8 + 1;
            _os_log_error_impl(&dword_1DDC5E000, v22, OS_LOG_TYPE_ERROR, "database is at version %u instead of %d", v32, 0xEu);
          }
        }
        _Block_object_dispose(buf, 8);

        if (v8 < 2) {
          char v23 = v11;
        }
        else {
          char v23 = 0;
        }
        ++v8;
      }
      while ((v23 & 1) != 0);
    }
    else
    {
      v10 = _log_2();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:](v8, v10);
      }

      char v11 = 1;
    }
    int64_t v12 = [v5 userVersion];
    unsigned int v13 = [v12 unsignedIntValue];
    char v14 = v11 ^ 1;
    if (v13 > 2) {
      char v14 = 1;
    }
    if ((v14 & 1) == 0) {
      -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:]();
    }

    if ((v11 & 1) == 0)
    {
      [v5 close:0];

      id v5 = 0;
    }
    id v5 = v5;
    uint64_t v15 = v5;
  }
  else
  {
    if (a4)
    {
      *a4 = [v5 lastError];
    }
    v16 = _log_2();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:](v5, v16);
    }

    [v5 close:0];
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (int *)(a1 + 40);
  id v3 = upgradeDatabaseIfNeeded_error__migration_functions[*(unsigned int *)(a1 + 40)];
  uint64_t v4 = a1 + 32;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = ((uint64_t (*)(uint64_t, id *))v3)(a2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) == 0)
  {
    id v7 = _log_2();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke_cold_1(v2, v4, v7);
    }
  }
  return v6;
}

- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = _log_2();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11)
    {
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (v11)
  {
    -[QLThumbnailAdditionIndex logError:onDB:statement:]();
  }
}

- (id)makeDatabaseAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _log_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:].cold.4();
  }

  if ([v6 checkResourceIsReachableAndReturnError:0])
  {
LABEL_7:
    id v8 = objc_alloc_init(MEMORY[0x1E4FBA8F0]);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke;
    v19[3] = &unk_1E6D0D1A0;
    v19[4] = self;
    v19[5] = v20;
    [v8 setSqliteErrorHandler:v19];
    [v8 setLabel:@"Quick Look cloud thumbnails cache"];
    if (([v8 openAtURL:v6 sharedCache:0 error:a4] & 1) == 0)
    {
      int v12 = _log_2();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:]();
      }

      goto LABEL_18;
    }
    if ([v8 setupPragmas])
    {
      [v8 setSynchronousMode:1];
      BOOL v11 = [v8 lastError];

      if (!v11)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke_15;
        v18[3] = &unk_1E6D0D1C8;
        v18[4] = self;
        [v8 setSqliteErrorHandler:v18];
        id v17 = _log_2();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:]();
        }

        id v14 = v8;
        goto LABEL_19;
      }
      if (!a4)
      {
LABEL_18:
        [v8 close:0];
        id v14 = 0;
LABEL_19:
        _Block_object_dispose(v20, 8);
        goto LABEL_20;
      }
    }
    else
    {
      id v13 = [v8 lastError];

      if (!a4 || !v13) {
        goto LABEL_18;
      }
    }
    *a4 = [v8 lastError];
    goto LABEL_18;
  }
  id v8 = [v6 URLByDeletingLastPathComponent];
  if (([v8 checkResourceIsReachableAndReturnError:0] & 1) != 0
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:0 attributes:0 error:a4],
        v9,
        (v10 & 1) != 0))
  {

    goto LABEL_7;
  }
  __int16 v16 = _log_2();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:]();
  }

  id v14 = 0;
LABEL_20:

  return v14;
}

void __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  [v7 logError:v8 onDB:a2 statement:a3];
  uint64_t v9 = [v8 code];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

uint64_t __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) logError:a4 onDB:a2 statement:a3];
}

- (BOOL)removeDatabaseAtURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a3;
  id v7 = [v6 path];
  id v8 = [v7 stringByAppendingString:@"-wal"];
  uint64_t v9 = [v5 fileURLWithPath:v8];

  char v10 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v11 = [v6 path];
  int v12 = [v11 stringByAppendingString:@"-shm"];
  id v13 = [v10 fileURLWithPath:v12];

  id v14 = (void *)MEMORY[0x1E4F1CB10];
  id v15 = [v6 path];
  __int16 v16 = [v15 stringByAppendingString:@"-journal"];
  id v17 = [v14 fileURLWithPath:v16];

  uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v19 = [v18 removeItemAtURL:v6 error:a4];

  if (v19)
  {
    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v20 removeItemAtURL:v9 error:0];

    BOOL v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v21 removeItemAtURL:v13 error:0];

    uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v22 removeItemAtURL:v17 error:0];
  }
  return v19;
}

- (id)openDatabaseAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v29 = 0;
  id v7 = [(QLThumbnailAdditionIndex *)self makeDatabaseAtURL:v6 error:&v29];
  id v8 = v29;
  id v9 = v8;
  if (v7)
  {
    char v10 = v8;
  }
  else
  {
    BOOL v11 = _log_2();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:].cold.5();
    }

    unsigned int v12 = [v9 code];
    if (v12 > 0x1A || ((1 << v12) & 0x5000800) == 0) {
      goto LABEL_28;
    }
    id v14 = _log_2();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:].cold.4();
    }

    id v28 = v9;
    BOOL v15 = [(QLThumbnailAdditionIndex *)self removeDatabaseAtURL:v6 error:&v28];
    id v16 = v28;

    if (!v15)
    {
      id v17 = _log_2();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex openDatabaseAtURL:error:]();
      }
    }
    id v27 = v16;
    id v7 = [(QLThumbnailAdditionIndex *)self makeDatabaseAtURL:v6 error:&v27];
    id v9 = v27;

    char v10 = v9;
    if (!v7)
    {
LABEL_28:
      if (a4)
      {
        id v9 = v9;
        uint64_t v18 = 0;
        *a4 = v9;
      }
      else
      {
        uint64_t v18 = 0;
      }
      goto LABEL_25;
    }
  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke;
  v24[3] = &unk_1E6D0D1F0;
  objc_copyWeak(&v25, &location);
  [v7 setAutoRollbackHandler:v24];
  id v23 = v10;
  uint64_t v18 = [(QLThumbnailAdditionIndex *)self upgradeDatabaseIfNeeded:v7 error:&v23];
  id v9 = v23;

  if (v18)
  {
    int v19 = _log_2();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:]();
    }

    [(QLThumbnailAdditionIndex *)self setUpDatabase:v18];
    id v20 = v18;
  }
  else
  {
    BOOL v21 = _log_2();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:]();
    }

    if (a4) {
      *a4 = v9;
    }
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

LABEL_25:
  return v18;
}

void __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  char v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);

  if (WeakRetained)
  {
    unsigned int v12 = objc_loadWeakRetained(v10);
    id v13 = [v9 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4FBA910]];

    if (v14)
    {
      if ([v9 code] == 13)
      {
        BOOL v15 = _log_2();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_1();
        }

        if (v12[32]) {
          exit(1);
        }
        goto LABEL_13;
      }
      if ([v9 code] == 11)
      {
        id v16 = _log_2();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_2();
        }

        [v12 _neuterAutoRollbackHandler];
        id v17 = [v7 serialQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_26;
        block[3] = &unk_1E6D0C750;
        id v19 = v7;
        id v20 = v12;
        dispatch_async(v17, block);

        goto LABEL_13;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Sqlite rollbacked transaction [%@] because of unrecoverable error [%@], aborting.", v8, v9 format];
LABEL_13:
  }
}

uint64_t __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_26(uint64_t a1)
{
  [*(id *)(a1 + 32) flush];
  uint64_t result = [*(id *)(a1 + 40) _resetDatabaseOnItsQueue:*(void *)(a1 + 32)];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 32)) {
    exit(1);
  }
  return result;
}

- (void)_neuterAutoRollbackHandler
{
}

void __54__QLThumbnailAdditionIndex__neuterAutoRollbackHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  id v7 = _log_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __54__QLThumbnailAdditionIndex__neuterAutoRollbackHandler__block_invoke_cold_1();
  }
}

- (void)_resetDatabaseOnItsQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = _log_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[QLThumbnailAdditionIndex _resetDatabaseOnItsQueue:]();
  }

  [v4 dbHandle];
  int v7 = _sqlite3_db_truncate();
  if (v7)
  {
    id v8 = _log_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      url = v5->_url;
      int v12 = 138412802;
      id v13 = url;
      __int16 v14 = 1024;
      int v15 = v7;
      __int16 v16 = 2080;
      id v17 = sqlite3_errmsg((sqlite3 *)[v4 dbHandle]);
      _os_log_error_impl(&dword_1DDC5E000, v8, OS_LOG_TYPE_ERROR, "Failed to truncate database at %@: %d (%s)", (uint8_t *)&v12, 0x1Cu);
    }
  }
  [(QLThumbnailAdditionIndex *)v5 _neuterAutoRollbackHandler];
  [(QLThumbnailAdditionIndex *)v5 _closeDatabaseOnItsQueue:v4];
  [(QLThumbnailAdditionIndex *)v5 _cleanUpAfterClose];
  id v9 = _log_2();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[QLThumbnailAdditionIndex _resetDatabaseOnItsQueue:]();
  }

  char v10 = [(QLThumbnailAdditionIndex *)v5 openDatabaseAtURL:v5->_url error:0];

  if (v10) {
    objc_storeStrong((id *)&v5->_db, v10);
  }
  objc_sync_exit(v5);
}

- (id)initForTesting
{
  id v3 = NSTemporaryDirectory();
  id v4 = [v3 stringByAppendingPathComponent:@"cloudthumbnails.XXXXXX.db"];

  id v5 = v4;
  id v6 = strdup((const char *)[v5 fileSystemRepresentation]);
  if (!v6) {
    goto LABEL_5;
  }
  int v7 = v6;
  int v8 = mkstemps(v6, 3);
  if (v8 < 1)
  {
    free(v7);
LABEL_5:

    char v10 = 0;
    goto LABEL_6;
  }
  close(v8);
  id v9 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v7 isDirectory:0 relativeToURL:0];
  char v10 = [(QLThumbnailAdditionIndex *)self initWithURL:v9];

  v10->_exitsOnCorruption = 0;
  free(v7);
LABEL_6:
  objc_storeStrong((id *)&sSharedInstance, v10);

  return v10;
}

- (QLThumbnailAdditionIndex)init
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = QLTGetDefaultCacheLocation();
  id v5 = [v4 stringByAppendingPathComponent:@"cloudthumbnails.db"];

  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  if (([v3 fileExistsAtPath:v5] & 1) == 0)
  {
    int v7 = [v3 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:0];
    int v8 = [v7 URLByAppendingPathComponent:@"Quick Look/cloudthumbnails.db" isDirectory:0];
    [v3 moveItemAtURL:v8 toURL:v6 error:0];
  }
  id v9 = [(QLThumbnailAdditionIndex *)self initWithURL:v6];

  return v9;
}

- (id)whereClauseForURL:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unsigned int v7 = 0;
  v8[0] = 0;
  v8[1] = 0;
  id v4 = 0;
  if (objc_msgSend(v3, "qlt_getDocumentIdentifier:", &v7))
  {
    if (objc_msgSend(v3, "qlt_getVolumeUUID:", v8))
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:16];
      id v4 = [MEMORY[0x1E4FBA8F8] formatInjection:@"docid = %u AND vol_uuid = %@", v7, v5];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (BOOL)hasThumbnailForURL:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!self->_db)
  {
    [(QLThumbnailAdditionIndex *)self open];
    if (!self->_db)
    {
      BOOL v11 = _log_2();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:]();
      }
      goto LABEL_9;
    }
  }
  id v9 = _log_2();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_INFO, "Looking for thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
  }

  char v10 = [(QLThumbnailAdditionIndex *)self whereClauseForURL:v8];
  BOOL v11 = v10;
  if (!v10)
  {
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke;
  v14[3] = &unk_1E6D0D260;
  v14[4] = self;
  BOOL v11 = v10;
  int v15 = v11;
  p_long long buf = &buf;
  unint64_t v18 = a5;
  BOOL v19 = a4;
  id v16 = v8;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v14];
  BOOL v12 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v12;
}

void __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) db];
  id v4 = (void *)[v3 fetchObjectOfClass:objc_opt_class(), @"SELECT COUNT(*) FROM thumbnails WHERE %@", *(void *)(v2 + 8) sql];

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (int)[v4 intValue] > 0;
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v5 + 24) && (*(unsigned char *)(a1 + 72) || *(void *)(a1 + 64)))
    {
      id v6 = [*(id *)(a1 + 32) db];
      unsigned int v7 = [v6 serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_2;
      block[3] = &unk_1E6D0D238;
      char v14 = *(unsigned char *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 64);
      void block[4] = v8;
      id v11 = *(id *)(a1 + 48);
      id v12 = *(id *)(a1 + 40);
      dispatch_async(v7, block);
    }
    else
    {
      *(unsigned char *)(v5 + 24) = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v9 = _log_2();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_cold_1((id *)v2, v9);
    }
  }
}

void __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBA8F8];
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v2 formatInjection:@", last_hit_date = %@", v3];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
  }
  if (*(void *)(a1 + 56)) {
    [MEMORY[0x1E4FBA8F8] formatInjection:@", size=%llu", *(void *)(a1 + 56)];
  }
  else {
  id v4 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
  }
  uint64_t v5 = [*(id *)(a1 + 32) db];
  id v6 = [*(id *)(a1 + 40) path];
  [v5 execute:@"UPDATE thumbnails SET last_seen_path=%@ %@ %@ WHERE %@", v6, v7, v4, *(void *)(a1 + 48)];
}

- (BOOL)updateFileSize:(unint64_t)a3 ofThumbnailForURL:(id)a4
{
  id v6 = a4;
  if (!self->_db)
  {
    [(QLThumbnailAdditionIndex *)self open];
    if (!self->_db)
    {
      id v9 = _log_2();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:]();
      }
      goto LABEL_9;
    }
  }
  id v7 = _log_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[QLThumbnailAdditionIndex updateFileSize:ofThumbnailForURL:]();
  }

  uint64_t v8 = [(QLThumbnailAdditionIndex *)self whereClauseForURL:v6];
  id v9 = v8;
  if (!v8)
  {
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__QLThumbnailAdditionIndex_updateFileSize_ofThumbnailForURL___block_invoke;
  v12[3] = &unk_1E6D0D288;
  char v14 = &v16;
  unint64_t v15 = a3;
  v12[4] = self;
  id v9 = v8;
  uint64_t v13 = v9;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v12];
  BOOL v10 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
LABEL_10:

  return v10;
}

void __61__QLThumbnailAdditionIndex_updateFileSize_ofThumbnailForURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 execute:@"UPDATE thumbnails SET size=%llu WHERE %@", *(void *)(a1 + 56), *(void *)(a1 + 40)];
}

- (BOOL)updateLastHitDate:(id)a3 ofThumbnailForURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_db)
  {
    [(QLThumbnailAdditionIndex *)self open];
    if (!self->_db)
    {
      id v9 = _log_2();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:]();
      }
      goto LABEL_9;
    }
  }
  uint64_t v8 = _log_2();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1DDC5E000, v8, OS_LOG_TYPE_INFO, "Updating file size for thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [(QLThumbnailAdditionIndex *)self whereClauseForURL:v7];
  if (!v9)
  {
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__QLThumbnailAdditionIndex_updateLastHitDate_ofThumbnailForURL___block_invoke;
  v12[3] = &unk_1E6D0D2B0;
  p_long long buf = &buf;
  v12[4] = self;
  id v13 = v6;
  id v9 = v9;
  char v14 = v9;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v12];
  BOOL v10 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v10;
}

void __64__QLThumbnailAdditionIndex_updateLastHitDate_ofThumbnailForURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 execute:@"UPDATE thumbnails SET last_hit_date=%@ WHERE %@", *(void *)(a1 + 40), *(void *)(a1 + 48)];

  id v7 = [*(id *)(a1 + 32) db];
  uint64_t v3 = [v7 changes];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v6 = v3 == 1 && *(unsigned char *)(v4 + 24) != 0;
  *(unsigned char *)(v4 + 24) = v6;
}

- (BOOL)removeThumbnailForURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_db)
  {
    [(QLThumbnailAdditionIndex *)self open];
    if (!self->_db)
    {
      id v7 = _log_2();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:]();
      }
      goto LABEL_9;
    }
  }
  uint64_t v5 = _log_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "Removing thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
  }

  BOOL v6 = [(QLThumbnailAdditionIndex *)self whereClauseForURL:v4];
  id v7 = v6;
  if (!v6)
  {
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__QLThumbnailAdditionIndex_removeThumbnailForURL___block_invoke;
  v10[3] = &unk_1E6D0D2D8;
  p_long long buf = &buf;
  void v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v10];
  BOOL v8 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v8;
}

void __50__QLThumbnailAdditionIndex_removeThumbnailForURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 execute:@"DELETE FROM thumbnails WHERE %@", *(void *)(a1 + 40)];
}

- (BOOL)addThumbnailForURL:(id)a3 lastHitDate:(id)a4 size:(unint64_t)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_db || ([(QLThumbnailAdditionIndex *)self open], self->_db))
  {
    BOOL v10 = _log_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v8;
      _os_log_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_INFO, "Adding thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
    }

    int v28 = 0;
    v30[0] = 0;
    v30[1] = 0;
    if (objc_msgSend(v8, "qlt_getDocumentIdentifier:", &v28))
    {
      if (objc_msgSend(v8, "qlt_getVolumeUUID:", v30))
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v30 length:16 freeWhenDone:0];
        memset(&buf, 0, sizeof(buf));
        id v12 = v8;
        stat((const char *)[v12 fileSystemRepresentation], &buf);
        uint64_t v24 = 0;
        id v25 = &v24;
        uint64_t v26 = 0x2020000000;
        char v27 = 0;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __64__QLThumbnailAdditionIndex_addThumbnailForURL_lastHitDate_size___block_invoke;
        v17[3] = &unk_1E6D0D300;
        uint64_t v21 = &v24;
        v17[4] = self;
        int v23 = v28;
        id v13 = v11;
        char v18 = v13;
        id v19 = v9;
        id v20 = v12;
        unint64_t v22 = a5;
        [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v17];
        BOOL v14 = *((unsigned char *)v25 + 24) != 0;

        _Block_object_dispose(&v24, 8);
LABEL_13:

        goto LABEL_14;
      }
      id v13 = _log_2();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex addThumbnailForURL:lastHitDate:size:]();
      }
    }
    else
    {
      id v13 = _log_2();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailAdditionIndex addThumbnailForURL:lastHitDate:size:]();
      }
    }
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v16 = _log_2();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:]();
  }

  BOOL v14 = 0;
LABEL_14:

  return v14;
}

void __64__QLThumbnailAdditionIndex_addThumbnailForURL_lastHitDate_size___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) db];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(unsigned int *)(a1 + 80);
  uint64_t v5 = [*(id *)(a1 + 56) path];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v6 execute:@"INSERT OR REPLACE INTO thumbnails(docid, vol_uuid, last_hit_date, last_seen_path, size) VALUES (%u, %@, %@, %@, %llu)", v4, v2, v3, v5, *(void *)(a1 + 72)];
}

- (BOOL)addThumbnailForURL:(id)a3 size:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v8 = [v6 date];
  LOBYTE(a4) = [(QLThumbnailAdditionIndex *)self addThumbnailForURL:v7 lastHitDate:v8 size:a4];

  return a4;
}

- (id)entriesEnumerator
{
  db = self->_db;
  if (db || ([(QLThumbnailAdditionIndex *)self open], (db = self->_db) != 0))
  {
    uint64_t v4 = (void *)[(PQLConnection *)db fetch:@"SELECT docid, vol_uuid, last_hit_date, last_seen_path, size FROM thumbnails"];
    uint64_t v5 = [v4 enumerateObjectsOfClass:objc_opt_class()];
  }
  else
  {
    id v7 = _log_2();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:]();
    }

    uint64_t v5 = 0;
  }
  return v5;
}

- (void)enumerateCacheEntriesWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__QLThumbnailAdditionIndex_enumerateCacheEntriesWithHandler___block_invoke;
  void v6[3] = &unk_1E6D0CA98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v6];
}

void __61__QLThumbnailAdditionIndex_enumerateCacheEntriesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "entriesEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)allEntries
{
  if (self->_db || ([(QLThumbnailAdditionIndex *)self open], self->_db))
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__QLThumbnailAdditionIndex_allEntries__block_invoke;
    v9[3] = &unk_1E6D0C750;
    v9[4] = self;
    id v4 = v3;
    id v10 = v4;
    [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v9];
    uint64_t v5 = v10;
    uint64_t v6 = v4;

    long long v7 = v6;
  }
  else
  {
    uint64_t v6 = _log_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:]();
    }
    long long v7 = 0;
  }

  return v7;
}

void __38__QLThumbnailAdditionIndex_allEntries__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "entriesEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) addObject:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)batchOfEntriesStartingAt:(unint64_t)a3 endingAt:(unint64_t *)a4
{
  long long v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke;
  v12[3] = &unk_1E6D0D328;
  v12[4] = self;
  unint64_t v14 = a3;
  id v8 = v7;
  id v13 = v8;
  char v15 = a4;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v12];
  long long v9 = v13;
  id v10 = v8;

  return v10;
}

void __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(a1 + 32) db];
  uint64_t v4 = (void *)[v3 fetch:@"SELECT docid, vol_uuid, last_hit_date, last_seen_path, size FROM thumbnails WHERE rowid >= %lu ORDER BY rowid LIMIT %lu", *(void *)(v2 + 16), 50];
  uint64_t v5 = [v4 enumerateObjectsOfClass:objc_opt_class()];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 40) addObject:*(void *)(*((void *)&v16 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if (*(void *)(a1 + 56))
  {
    id v11 = [*(id *)(a1 + 32) db];
    uint64_t v12 = objc_msgSend(v11, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT MAX(rowid) FROM (SELECT rowid FROM thumbnails WHERE rowid    >= %lu ORDER BY rowid LIMIT %lu)", *(void *)(a1 + 48), 50, (void)v16);

    if (v12 && (unint64_t)[v12 unsignedIntegerValue] >= *(void *)(a1 + 48))
    {
      uint64_t v15 = [v12 unsignedIntegerValue];
    }
    else if ([*(id *)(a1 + 40) count])
    {
      id v13 = _log_2();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke_cold_1((id *)v2, v13);
      }

      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = v14 + [*(id *)(a1 + 40) count] - 1;
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 48);
    }
    **(void **)(a1 + 56) = v15;
  }
}

- (void)removeAllAdditions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(QLThumbnailAdditionIndex *)self allEntries];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138412546;
    long long v15 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1E4F3A6A8];
        uint64_t v10 = objc_msgSend(v8, "lastSeenURL", v15);
        id v16 = 0;
        char v11 = [v9 removeAdditionsOnURL:v10 error:&v16];
        id v12 = v16;

        if ((v11 & 1) == 0)
        {
          id v13 = _log_2();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = [v8 lastSeenURL];
            *(_DWORD *)stat buf = v15;
            unint64_t v22 = v14;
            __int16 v23 = 2112;
            id v24 = v12;
            _os_log_error_impl(&dword_1DDC5E000, v13, OS_LOG_TYPE_ERROR, "Could not remove addition on %@: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
}

- (int)deviceForHomeDirectory
{
  uint64_t v2 = NSHomeDirectory();
  memset(&v7, 0, sizeof(v7));
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = stat((const char *)[v3 fileSystemRepresentationWithPath:v2], &v7);

  if (v4) {
    dev_t st_dev = -1;
  }
  else {
    dev_t st_dev = v7.st_dev;
  }

  return st_dev;
}

- (void)removeEntriesFromDatabase:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        db = self->_db;
        uint64_t v11 = [v9 documentID];
        id v12 = objc_msgSend(v9, "vol_uuid");
        [(PQLConnection *)db execute:@"DELETE FROM thumbnails WHERE docid = %llu AND vol_uuid = %@", v11, v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)cleanUpBatchOfEntries:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _log_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 134217984;
    uint64_t v59 = [v4 count];
    _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "[db maintenance] updating %llu entries", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  v37 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v62 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v45;
    unint64_t v12 = 0x1E4F1C000uLL;
    *(void *)&long long v9 = 134219010;
    long long v34 = v9;
    uint64_t v38 = v6;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
        int v15 = [(QLThumbnailAdditionIndex *)self deviceForHomeDirectory];
        if ((v15 & 0x80000000) == 0)
        {
          int32_t v16 = v15;
          [v14 documentID];
          uint64_t v17 = GSLibraryResolveDocumentId2();
          if (v17)
          {
            v43.val[0] = v16;
            v43.val[1] = 0;
            if (fsgetpath((char *)buf, 0x400uLL, &v43, v17) < 1) {
              goto LABEL_33;
            }
            uint64_t v18 = [*(id *)(v12 + 2832) fileURLWithFileSystemRepresentation:buf isDirectory:0 relativeToURL:0];
            if (objc_msgSend(v18, "br_isInCloudDocsPrivateStorages"))
            {
              long long v19 = _log_2();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                -[QLThumbnailAdditionIndex cleanUpBatchOfEntries:](v56, v14, &v57, v19);
              }

              [v6 addObject:v14];
              goto LABEL_32;
            }
            memset(&v42, 0, sizeof(v42));
            if (stat((const char *)buf, &v42))
            {
              uint64_t v21 = _log_2();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                int v22 = *__error();
                *(_DWORD *)v48 = 67109378;
                *(_DWORD *)v49 = v22;
                *(_WORD *)&v49[4] = 2080;
                *(void *)&v49[6] = buf;
                _os_log_error_impl(&dword_1DDC5E000, v21, OS_LOG_TYPE_ERROR, "Hit error %{errno}d trying to stat %s", v48, 0x12u);
              }
              goto LABEL_31;
            }
            uint64_t v21 = [*(id *)(v12 + 2832) fileURLWithFileSystemRepresentation:buf isDirectory:(v42.st_mode & 0xF000) == 0x4000 relativeToURL:0];
            __int16 v23 = [v14 lastSeenURL];
            if ([v21 isEqual:v23])
            {
              uint64_t v24 = [v14 size];

              if (!v24)
              {
LABEL_27:
                uint64_t v25 = [MEMORY[0x1E4F3A6A8] sizeOfAdditionsPresentOnURL:v21];
                uint64_t v26 = _log_2();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v35 = [v14 documentID];
                  v36 = [v14 lastSeenURL];
                  uint64_t v28 = [v14 size];
                  *(_DWORD *)v48 = v34;
                  *(void *)v49 = v35;
                  *(_WORD *)&v49[8] = 2112;
                  *(void *)&v49[10] = v36;
                  __int16 v50 = 2112;
                  v51 = v21;
                  __int16 v52 = 2048;
                  uint64_t v53 = v28;
                  __int16 v54 = 2048;
                  uint64_t v55 = v25;
                  _os_log_debug_impl(&dword_1DDC5E000, v26, OS_LOG_TYPE_DEBUG, "Updating url of docid %llu from %@ to %@ and size from %lld to %lld", v48, 0x34u);
                }
                [v14 setLastSeenURL:v21];
                [v14 setSize:v25];
                [v37 addObject:v14];
              }
              uint64_t v6 = v38;
LABEL_31:

              unint64_t v12 = 0x1E4F1C000;
LABEL_32:

              goto LABEL_33;
            }

            goto LABEL_27;
          }
          if (*__error() == 2 || *__error() == 70)
          {
            long long v20 = _log_2();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              char v27 = [v14 lastSeenURL];
              *(_DWORD *)stat buf = 138412546;
              uint64_t v59 = (uint64_t)v14;
              __int16 v60 = 2112;
              uint64_t v61 = (uint64_t)v27;
              _os_log_error_impl(&dword_1DDC5E000, v20, OS_LOG_TYPE_ERROR, "Should delete %@ (lastSeenURL: %@)", buf, 0x16u);

              uint64_t v6 = v38;
            }

            [v6 addObject:v14];
          }
        }
LABEL_33:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v44 objects:v62 count:16];
    }
    while (v10);
  }

  id v29 = _log_2();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = [v6 count];
    uint64_t v31 = [v37 count];
    *(_DWORD *)stat buf = 134218240;
    uint64_t v59 = v30;
    __int16 v60 = 2048;
    uint64_t v61 = v31;
    _os_log_impl(&dword_1DDC5E000, v29, OS_LOG_TYPE_INFO, "[db maintenance] %llu entries to delete, %llu entries to update", buf, 0x16u);
  }

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  void v39[2] = __50__QLThumbnailAdditionIndex_cleanUpBatchOfEntries___block_invoke;
  v39[3] = &unk_1E6D0C7F0;
  v39[4] = self;
  id v40 = v6;
  id v41 = v37;
  id v32 = v37;
  id v33 = v6;
  [(QLThumbnailAdditionIndex *)self dispatchSyncOnDatabaseQueue:v39];
}

void __50__QLThumbnailAdditionIndex_cleanUpBatchOfEntries___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeEntriesFromDatabase:*(void *)(a1 + 40)];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) db];
        uint64_t v8 = [v6 lastSeenURL];
        long long v9 = [v8 path];
        [v7 execute:@"UPDATE THUMBNAILS SET last_seen_path=%@, size=%lld WHERE docid=%llu", v9, objc_msgSend(v6, "size"), objc_msgSend(v6, "documentID")];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

- (void)performDatabaseMaintenance
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Performing DB maintenance", v2, v3, v4, v5, v6);
}

- (id)databaseConnection
{
  return self->_db;
}

- (NSURL)databaseURL
{
  return self->_url;
}

- (void)hasThumbnailForURLWrapper:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  long long v11 = (void (**)(id, BOOL))a6;
  long long v12 = [v10 url];
  if ([v12 startAccessingSecurityScopedResource])
  {
    BOOL v13 = [(QLThumbnailAdditionIndex *)self hasThumbnailForURL:v12 updateLastHitDate:v8 andSize:a5];
    [v12 stopAccessingSecurityScopedResource];
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  long long v14 = _log_2();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[QLThumbnailAdditionIndex hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:](v10, v14);
  }

  BOOL v13 = [(QLThumbnailAdditionIndex *)self hasThumbnailForURL:v12 updateLastHitDate:v8 andSize:a5];
  if (v11) {
LABEL_7:
  }
    v11[2](v11, v13);
LABEL_8:
}

- (void)updateFileSize:(unint64_t)a3 ofThumbnailForURL:(id)a4 completion:(id)a5
{
  id v10 = a5;
  BOOL v8 = [(QLThumbnailAdditionIndex *)self updateFileSize:a3 ofThumbnailForURL:a4];
  long long v9 = v10;
  if (v10)
  {
    (*((void (**)(id, BOOL))v10 + 2))(v10, v8);
    long long v9 = v10;
  }
}

- (void)updateLastHitDate:(id)a3 ofThumbnailForURL:(id)a4 completion:(id)a5
{
  id v10 = a5;
  BOOL v8 = [(QLThumbnailAdditionIndex *)self updateLastHitDate:a3 ofThumbnailForURL:a4];
  long long v9 = v10;
  if (v10)
  {
    (*((void (**)(id, BOOL))v10 + 2))(v10, v8);
    long long v9 = v10;
  }
}

- (void)removeThumbnailForURL:(id)a3 completion:(id)a4
{
  id v8 = a4;
  BOOL v6 = [(QLThumbnailAdditionIndex *)self removeThumbnailForURL:a3];
  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id, BOOL))v8 + 2))(v8, v6);
    id v7 = v8;
  }
}

- (void)addThumbnailForURLWrapper:(id)a3 size:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  long long v9 = (void (**)(id, BOOL))a5;
  id v10 = [v8 url];
  int v11 = [v10 startAccessingSecurityScopedResource];
  if ((v11 & 1) == 0)
  {
    long long v12 = _log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:](v8, v12);
    }
  }
  BOOL v13 = [(QLThumbnailAdditionIndex *)self addThumbnailForURL:v10 size:a4];
  if (v9) {
    v9[2](v9, v13);
  }
  if (v11) {
    [v10 stopAccessingSecurityScopedResource];
  }
}

- (void)retrieveAllAdditions:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(QLThumbnailAdditionIndex *)self allEntries];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbWatcher, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (int64_t)purgeOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v9 = _log_2();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_INFO, "#CacheDelete asked us to purge", buf, 2u);
  }

  if (self->_db || ([(QLThumbnailAdditionIndex *)self open], self->_db))
  {
    sPurgeCancelled = 0;
    int v50 = 0;
    int64_t v10 = 0;
    if (objc_msgSend(v7, "qlt_getDeviceIdentifier:", &v50) && (v50 & 0x80000000) == 0)
    {
      id v36 = v7;
      int v11 = [(QLThumbnailAdditionIndex *)self volumeRestrictionForMountPoint:v7];
      long long v12 = [MEMORY[0x1E4F1CA48] array];
      BOOL v13 = [(PQLConnection *)self->_db serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke;
      block[3] = &unk_1E6D0D378;
      long long v34 = self;
      id v35 = v8;
      void block[4] = self;
      id v46 = v8;
      id v14 = v11;
      id v47 = v14;
      int v49 = v50;
      id v15 = v12;
      id v48 = v15;
      dispatch_sync(v13, block);

      uint64_t v16 = _log_2();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v15 count];
        *(_DWORD *)stat buf = 134217984;
        uint64_t v52 = v17;
        _os_log_impl(&dword_1DDC5E000, v16, OS_LOG_TYPE_INFO, "#CacheDelete removing %lu thumbnails", buf, 0xCu);
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v15;
      uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
      id v33 = v14;
      if (v18)
      {
        uint64_t v19 = v18;
        int64_t v10 = 0;
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(obj);
            }
            int v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            __int16 v23 = (void *)MEMORY[0x1E01C5C90]();
            uint64_t v24 = (void *)MEMORY[0x1E4F3A6A8];
            uint64_t v25 = [v22 lastSeenURL];
            id v40 = 0;
            LODWORD(v24) = [v24 _removeAdditionsOnURLDirectly:v25 error:&v40];
            id v26 = v40;

            if (v24)
            {
              v10 += [v22 size];
            }
            else
            {
              char v27 = _log_2();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                uint64_t v28 = [v22 lastSeenURL];
                *(_DWORD *)stat buf = 138412546;
                uint64_t v52 = (uint64_t)v28;
                __int16 v53 = 2112;
                id v54 = v26;
                _os_log_error_impl(&dword_1DDC5E000, v27, OS_LOG_TYPE_ERROR, "#CacheDelete Not removing addition on %@; encountered error %@",
                  buf,
                  0x16u);
              }
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
        }
        while (v19);
      }
      else
      {
        int64_t v10 = 0;
      }

      id v29 = [(PQLConnection *)v34->_db serialQueue];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke_14;
      v38[3] = &unk_1E6D0C750;
      v38[4] = v34;
      id v39 = obj;
      id v30 = obj;
      dispatch_sync(v29, v38);

      id v8 = v35;
      id v7 = v36;
    }
  }
  else
  {
    uint64_t v31 = _log_2();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailAdditionIndex(CacheDelete) purgeableSpaceOnMountPoint:withUrgency:beforeDate:](v31);
    }

    int64_t v10 = 0;
  }

  return v10;
}

void __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) db];
  uint64_t v3 = (void *)[v2 fetch:@"SELECT docid, vol_uuid, last_hit_date, last_seen_path, size FROM thumbnails WHERE last_hit_date < %@ %@", *(void *)(a1 + 40), *(void *)(a1 + 48)];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v15 = v3;
  uint64_t v4 = [v3 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      if (sPurgeCancelled) {
        break;
      }
      long long v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      [v9 documentID];
      uint64_t v10 = GSLibraryResolveDocumentId2();
      if (v10)
      {
        v16.val[0] = *(_DWORD *)(a1 + 64);
        v16.val[1] = 0;
        if (fsgetpath(v21, 0x400uLL, &v16, v10) >= 1)
        {
          int v11 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v21 isDirectory:0 relativeToURL:0];
          [v9 setLastSeenURL:v11];

          if (![v9 size])
          {
            id v12 = objc_alloc(MEMORY[0x1E4F3A6A8]);
            BOOL v13 = [v9 lastSeenURL];
            id v14 = (void *)[v12 initWithAdditionsPresentOnURL:v13 error:0];

            objc_msgSend(v9, "setSize:", objc_msgSend(v14, "additionSize"));
          }
          [*(id *)(a1 + 56) addObject:v9];
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeEntriesFromDatabase:*(void *)(a1 + 40)];
}

- (void)cancelCacheDeletePurge
{
  sPurgeCancelled = 1;
}

- (void)open
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Database is already open", v2, v3, v4, v5, v6);
}

- (void)_closeDatabaseOnItsQueue:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not close database %@: %@");
}

void __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Someone removed our database under our feet", v2, v3, v4, v5, v6);
}

- (void)upgradeDatabaseIfNeeded:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 lastError];
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "Hit error %@, closing db %@", (uint8_t *)&v5, 0x16u);
}

- (void)upgradeDatabaseIfNeeded:error:.cold.2()
{
  __assert_rtn("-[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:]", "QLThumbnailAdditionIndex.m", 359, "(db.userVersion.unsignedIntValue >= QLThumbnailAdditionCacheVersionMax) || !result");
}

- (void)upgradeDatabaseIfNeeded:(int)a1 error:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 0;
  __int16 v5 = 1024;
  int v6 = 3;
  _os_log_debug_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_DEBUG, "no database migration (db at version %d, migration range [%d,%d[)", (uint8_t *)v2, 0x14u);
}

- (void)upgradeDatabaseIfNeeded:error:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Upgrading database %@", v2, v3, v4, v5, v6);
}

void __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a1 + 1;
  uint64_t v5 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  v6[0] = 67109634;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "can't migrate from version %d to %d: %@", (uint8_t *)v6, 0x18u);
}

- (void)logError:onDB:statement:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Sqlite failed on %@ with error [%@]");
}

- (void)makeDatabaseAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Successfully opened database %@", v2, v3, v4, v5, v6);
}

- (void)makeDatabaseAtURL:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Opening the database failed", v2, v3, v4, v5, v6);
}

- (void)makeDatabaseAtURL:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Failed to create directory hierarchy", v2, v3, v4, v5, v6);
}

- (void)makeDatabaseAtURL:error:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Opening thumbnail index database at %@", v2, v3, v4, v5, v6);
}

- (void)openDatabaseAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Could not upgrade the Quick Look cloud thumbnails database: %@", v2, v3, v4, v5, v6);
}

- (void)openDatabaseAtURL:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Thumbnails database open and upgraded", v2, v3, v4, v5, v6);
}

- (void)openDatabaseAtURL:error:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Failed to remove database at %@: %@");
}

- (void)openDatabaseAtURL:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Corrupt database. Resetting the database and retrying.", v2, v3, v4, v5, v6);
}

- (void)openDatabaseAtURL:error:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Could not open the Quick Look cloud thumbnails database: %@", v2, v3, v4, v5, v6);
}

void __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "disk is full, restarting after throttle: %@", v2, v3, v4, v5, v6);
}

void __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "database is corrupt, removing it and restarting after throttle: %@", v2, v3, v4, v5, v6);
}

void __54__QLThumbnailAdditionIndex__neuterAutoRollbackHandler__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Ignoring error %@ during %@ closure");
}

- (void)_resetDatabaseOnItsQueue:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "%@: re-opening database", v2, v3, v4, v5, v6);
}

- (void)_resetDatabaseOnItsQueue:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "%@: Resetting the Quick Look thumbnails database, old cloud thumbnails might not get reclaimed until they get overwritten", v2, v3, v4, v5, v6);
}

- (void)hasThumbnailForURL:updateLastHitDate:andSize:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "Could not open database", v2, v3, v4, v5, v6);
}

void __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 db];
  uint64_t v4 = [v3 lastError];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_2(&dword_1DDC5E000, a2, v5, "Error executing count statement: %@", v6);
}

- (void)updateFileSize:ofThumbnailForURL:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Updating file size for thumbnail for URL %@", v2, v3, v4, v5, v6);
}

- (void)addThumbnailForURL:lastHitDate:size:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "No vol uuid for %@", v2, v3, v4, v5, v6);
}

- (void)addThumbnailForURL:lastHitDate:size:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "No DocID / vol uuid for %@", v2, v3, v4, v5, v6);
}

void __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 db];
  uint64_t v4 = [v3 lastError];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_2(&dword_1DDC5E000, a2, v5, "Could NOT fetch the maximum rowid for the current cleanup batch. %@", v6);
}

- (void)cleanUpBatchOfEntries:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 lastSeenURL];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1DDC5E000, a4, OS_LOG_TYPE_DEBUG, "Removing thumbnail tracking for %@ because it's in the Cloud Docs private storage", a1, 0xCu);
}

- (void)hasThumbnailForURLWrapper:(void *)a1 updateLastHitDate:(NSObject *)a2 andSize:completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 url];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_2(&dword_1DDC5E000, a2, v4, "Could not consume sandbox extension on %@", v5);
}

@end