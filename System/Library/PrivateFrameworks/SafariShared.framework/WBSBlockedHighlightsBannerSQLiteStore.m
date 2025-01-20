@interface WBSBlockedHighlightsBannerSQLiteStore
+ (NSURL)defaultDatabaseURL;
- (WBSBlockedHighlightsBannerSQLiteStore)initWithDatabaseURL:(id)a3;
- (int64_t)_schemaVersion;
- (void)_closeDatabaseOnDatabaseQueue;
- (void)_configureDatabase;
- (void)_createDatabaseSchemaIfNeeded;
- (void)_openDatabase;
- (void)_openDatabaseIfNeeded;
- (void)clearAllBannedHighlightsWithCompletionHandler:(id)a3;
- (void)clearBlockedBannerHighlightsAfterDate:(id)a3 beforeDate:(id)a4 withCompletionHandler:(id)a5;
- (void)closeDatabase;
- (void)fetchAllBlockedHighlightsWithCompletionHandler:(id)a3;
- (void)removeBlockedBannerhighlightWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)storeBlockedHighlightWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)verifyIfHighlightIsBlockedWithIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSBlockedHighlightsBannerSQLiteStore

+ (NSURL)defaultDatabaseURL
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = objc_msgSend(v2, "safari_settingsDirectoryURL");
  v4 = [v3 URLByAppendingPathComponent:@"BlockedBannerHighlights.db" isDirectory:0];

  return (NSURL *)v4;
}

- (WBSBlockedHighlightsBannerSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSBlockedHighlightsBannerSQLiteStore;
  v5 = [(WBSBlockedHighlightsBannerSQLiteStore *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (NSURL *)v4;
    }
    else
    {
      v6 = +[WBSBlockedHighlightsBannerSQLiteStore defaultDatabaseURL];
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    v8 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.SafariShared.WBSBlockedBannerHighlightsSQLiteStore", 0, v8);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)fetchAllBlockedHighlightsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__WBSBlockedHighlightsBannerSQLiteStore_fetchAllBlockedHighlightsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __88__WBSBlockedHighlightsBannerSQLiteStore_fetchAllBlockedHighlightsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    SafariShared::WBSSQLiteDatabaseFetch<>(v2, @"SELECT highlightIdentifier FROM BlockedBannerHighlights");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [MEMORY[0x1E4F1CA48] array];
    while (1)
    {
      id v4 = [v10 nextObject];
      v5 = v4;
      if (!v4) {
        break;
      }
      id v6 = [v4 stringAtIndex:0];
      [v3 addObject:v6];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v3);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      dispatch_queue_t v9 = *(void (**)(void))(v8 + 16);
      v9();
    }
  }
}

- (void)storeBlockedHighlightWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSBlockedHighlightsBannerSQLiteStore_storeBlockedHighlightWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

uint64_t __95__WBSBlockedHighlightsBannerSQLiteStore_storeBlockedHighlightWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)id v10 = v3;
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,double>(v2, 0, @"INSERT OR REPLACE INTO BlockedBannerHighlights (highlightIdentifier, blockedTime) VALUES (?, ?)", (void *)(a1 + 40), (double *)v10);
    if (v4 != 101)
    {
      v5 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorWithMethodName:"-[WBSBlockedHighlightsBannerSQLiteStore storeBlockedHighlightWithIdentifier:completionHandler:]_block_invoke"];
        id v9 = objc_msgSend(v8, "safari_privacyPreservingDescription");
        *(_DWORD *)id v10 = 138543618;
        *(void *)&v10[4] = v9;
        __int16 v11 = 1024;
        int v12 = v4;
        _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to insert into BlockedBannerHighlights table: %{public}@ (%d)", v10, 0x12u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (void)verifyIfHighlightIsBlockedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__WBSBlockedHighlightsBannerSQLiteStore_verifyIfHighlightIsBlockedWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

void __100__WBSBlockedHighlightsBannerSQLiteStore_verifyIfHighlightIsBlockedWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(v2, @"SELECT highlightIdentifier FROM BlockedBannerHighlights WHERE highlightIdentifier = ?", (void *)(a1 + 40));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 nextObject];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      int v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
}

- (void)clearAllBannedHighlightsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__WBSBlockedHighlightsBannerSQLiteStore_clearAllBannedHighlightsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __87__WBSBlockedHighlightsBannerSQLiteStore_clearAllBannedHighlightsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, @"DELETE FROM BlockedBannerHighlights");
    if (v3 != 101)
    {
      int v4 = v3;
      id v5 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v8 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorWithMethodName:"-[WBSBlockedHighlightsBannerSQLiteStore clearAllBannedHighlightsWithCompletionHandler:]_block_invoke"];
        id v9 = objc_msgSend(v8, "safari_privacyPreservingDescription");
        int v10 = 138543618;
        __int16 v11 = v9;
        __int16 v12 = 1024;
        int v13 = v4;
        _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Unable to clear rows from Blocked Banner Highlights: %{public}@ (%d)", (uint8_t *)&v10, 0x12u);
      }
    }
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (void)clearBlockedBannerHighlightsAfterDate:(id)a3 beforeDate:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__WBSBlockedHighlightsBannerSQLiteStore_clearBlockedBannerHighlightsAfterDate_beforeDate_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5C8CA48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(databaseQueue, v15);
}

uint64_t __112__WBSBlockedHighlightsBannerSQLiteStore_clearBlockedBannerHighlightsAfterDate_beforeDate_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    *(void *)buf = v3;
    [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
    uint64_t v11 = v4;
    int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double>(v2, 0, @"DELETE FROM BlockedBannerHighlights WHERE blockedTime >= ? AND blockedTime <= ?", (double *)buf, (double *)&v11);
    if (v5 != 101)
    {
      id v6 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v9 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorWithMethodName:"-[WBSBlockedHighlightsBannerSQLiteStore clearBlockedBannerHighlightsAfterDate:beforeDate:withCompletionHandler:]_block_invoke"];
        id v10 = objc_msgSend(v9, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v10;
        __int16 v13 = 1024;
        int v14 = v5;
        _os_log_error_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_ERROR, "Unable to clear rows from Blocked Banner Highlights: %{public}@ (%d)", buf, 0x12u);
      }
    }
    uint64_t result = *(void *)(a1 + 56);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      id v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)removeBlockedBannerhighlightWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__WBSBlockedHighlightsBannerSQLiteStore_removeBlockedBannerhighlightWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5C8CA20;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(databaseQueue, block);
}

uint64_t __102__WBSBlockedHighlightsBannerSQLiteStore_removeBlockedBannerhighlightWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(v2, 0, @"DELETE FROM BlockedBannerHighlights WHERE highlightIdentifier = ?", (void *)(a1 + 40));
    if (v3 != 101)
    {
      int v4 = v3;
      int v5 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v8 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorWithMethodName:"-[WBSBlockedHighlightsBannerSQLiteStore removeBlockedBannerhighlightWithIdentifier:completionHandler:]_block_invoke"];
        id v9 = objc_msgSend(v8, "safari_privacyPreservingDescription");
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 1024;
        int v13 = v4;
        _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Unable to clear row from Blocked Banner Highlights: %{public}@ (%d)", (uint8_t *)&v10, 0x12u);
      }
    }
    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (void)_openDatabaseIfNeeded
{
  if (!self->_database) {
    [(WBSBlockedHighlightsBannerSQLiteStore *)self _openDatabase];
  }
}

- (void)_openDatabase
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(v2, v3, v4, 5.8081e-34);
  _os_log_error_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_ERROR, "Failed to open Blocked Banner Highlights SQLite store at %{private}@: %{public}@", v5, 0x16u);
}

- (void)_configureDatabase
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(v2, v3, v4, 5.8382e-34);
  _os_log_error_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on Blocked Banner Highlights SQLite store at %{public}@: %{public}@", v5, 0x16u);
}

- (void)_createDatabaseSchemaIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to execute query when resetting database schema", v1, 2u);
}

- (int64_t)_schemaVersion
{
  uint64_t v2 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  uint64_t v3 = [v2 nextObject];
  int v4 = [v3 intAtIndex:0];

  int v5 = [v2 statement];
  [v5 invalidate];

  return v4;
}

- (void)closeDatabase
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSBlockedHighlightsBannerSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __54__WBSBlockedHighlightsBannerSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabaseOnDatabaseQueue];
}

- (void)_closeDatabaseOnDatabaseQueue
{
  [(WBSSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end