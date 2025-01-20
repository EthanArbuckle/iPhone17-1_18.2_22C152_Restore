@interface WBSLPLinkMetadataSQLiteStore
- (BOOL)_deleteAllMetadataInfo;
- (BOOL)_setMetadataInfo:(id)a3 forURLString:(id)a4;
- (id)_deleteMetadataInfoForURLStrings:(id)a3;
- (id)_deleteUUIDWithOldestTimestamp;
- (id)_fetchAllMetadataInfo;
- (id)_fetchAllMetadataInfoWithUUID:(id)a3;
- (id)_fetchMetadataInfoForURLString:(id)a3;
- (id)_queryListWithStrings:(id)a3;
- (int)_createFreshDatabaseSchema;
- (int)_currentSchemaVersion;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_migrateToSchemaVersion_2;
- (unint64_t)_uuidCount;
- (void)_deleteAllMetadataInfo;
- (void)_deleteMetadataInfoWithUUID:(id)a3;
- (void)_deleteUUIDWithOldestTimestamp;
- (void)getAllMetadataInfoWithCompletionHandler:(id)a3;
- (void)getMetadataInfoForURLString:(id)a3 completionHandler:(id)a4;
- (void)linkAndUpdateMetadataInfoForURLString:(id)a3 lastFetchDate:(id)a4 lastFetchDidSucceed:(BOOL)a5 metadataHasImage:(BOOL)a6 completionHandler:(id)a7;
- (void)linkURLString:(id)a3 withMetadataInfoForURLString:(id)a4 completionHandler:(id)a5;
- (void)performLRUEvictionIfNecessaryWithMaximumNumberOfEntries:(unint64_t)a3 completionHandler:(id)a4;
- (void)removeAllMetadataInfoWithCompletionHandler:(id)a3;
- (void)removeAllMetadataInfoWithUUID:(id)a3 completionHandler:(id)a4;
- (void)removeMetadataInfoForURLStrings:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSLPLinkMetadataSQLiteStore

- (int)_currentSchemaVersion
{
  return 2;
}

void __72__WBSLPLinkMetadataSQLiteStore_getAllMetadataInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _fetchAllMetadataInfo];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (id)_fetchAllMetadataInfo
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [(WBSSQLiteStore *)self database];
  v3 = SafariShared::WBSSQLiteDatabaseFetch<>(v2, @"SELECT * FROM page_url");

  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = [WBSLPLinkMetadataInfo alloc];
        v11 = -[WBSLPLinkMetadataInfo initWithSQLiteRow:](v10, "initWithSQLiteRow:", v9, (void)v15);
        objc_msgSend(v4, "safari_addObjectUnlessNil:", v11);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  v12 = [v5 statement];
  [v12 invalidate];

  v13 = (void *)[v4 copy];
  return v13;
}

- (void)getAllMetadataInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSSQLiteStore *)self databaseQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WBSLPLinkMetadataSQLiteStore_getAllMetadataInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E410B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int)_createFreshDatabaseSchema
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v3 = [(WBSSQLiteStore *)self database];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__WBSLPLinkMetadataSQLiteStore__createFreshDatabaseSchema__block_invoke;
  v5[3] = &unk_1E5E40ED8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 tryToPerformTransactionInBlock:v5];

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

BOOL __58__WBSLPLinkMetadataSQLiteStore__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, @"CREATE TABLE page_url (url TEXT PRIMARY KEY NOT NULL,uuid TEXT NOT NULL ON CONFLICT FAIL)");

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 101) {
    return 0;
  }
  v3 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"CREATE INDEX UUIDIndex ON page_url (uuid)");

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 101) {
    return 0;
  }
  id v4 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v4, 0, @"CREATE TABLE uuid_info (uuid TEXT PRIMARY KEY NOT NULL,timestamp INTEGER)");

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 101) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"CREATE INDEX TimestampIndex ON uuid_info (timestamp)");

  return *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 101;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  id v5 = [(WBSSQLiteStore *)self database];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WBSLPLinkMetadataSQLiteStore__migrateToSchemaVersion___block_invoke;
  v7[3] = &unk_1E5E40F00;
  int v8 = a3;
  v7[4] = self;
  void v7[5] = &v9;
  [v5 tryToPerformTransactionInBlock:v7];

  LODWORD(v5) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v5;
}

BOOL __56__WBSLPLinkMetadataSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) == 2) {
    int v2 = [*(id *)(a1 + 32) _migrateToSchemaVersion];
  }
  else {
    int v2 = 1;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 101;
}

- (int)_migrateToSchemaVersion_2
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"DROP INDEX IF EXISTS UUIDIndex");

  if (v4 != 101)
  {
    int v12 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v15 = [(WBSSQLiteStore *)self database];
      long long v16 = [v15 lastErrorMessage];
      int v26 = 138543618;
      v27 = v16;
      __int16 v28 = 1024;
      int v29 = v4;
      _os_log_error_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_ERROR, "Failed to drop index in paged_url table: %{public}@ (%d)", (uint8_t *)&v26, 0x12u);
    }
    goto LABEL_20;
  }
  id v5 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"ALTER TABLE page_url RENAME TO page_url_old");

  if (v4 != 101)
  {
    int v12 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v17 = [(WBSSQLiteStore *)self database];
      long long v18 = [v17 lastErrorMessage];
      int v26 = 138543618;
      v27 = v18;
      __int16 v28 = 1024;
      int v29 = v4;
      _os_log_error_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_ERROR, "Failed to rename table page_url to page_url_old: %{public}@ (%d)", (uint8_t *)&v26, 0x12u);
    }
    goto LABEL_20;
  }
  uint64_t v6 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, @"CREATE TABLE page_url (url TEXT PRIMARY KEY NOT NULL,uuid TEXT,last_fetch_date REAL NOT NULL,last_fetch_did_succeed BOOLEAN NOT NULL DEFAULT 0,metadata_has_image BOOLEAN NOT NULL DEFAULT 0)");

  if (v4 != 101)
  {
    int v12 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = [(WBSSQLiteStore *)self database];
      uint64_t v20 = [v19 lastErrorMessage];
      int v26 = 138543618;
      v27 = v20;
      __int16 v28 = 1024;
      int v29 = v4;
      _os_log_error_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_ERROR, "Failed to create page_url table during migration: %{public}@ (%d)", (uint8_t *)&v26, 0x12u);
    }
    goto LABEL_20;
  }
  uint64_t v7 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v7, 0, @"CREATE INDEX UUIDIndex ON page_url (uuid)");

  if (v4 != 101)
  {
    int v12 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = [(WBSSQLiteStore *)self database];
      v23 = [v22 lastErrorMessage];
      int v26 = 138543618;
      v27 = v23;
      __int16 v28 = 1024;
      int v29 = v4;
      _os_log_error_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_ERROR, "Failed to create UUIDIndex on page_url table during migration: %{public}@ (%d)", (uint8_t *)&v26, 0x12u);
    }
    goto LABEL_20;
  }
  int v8 = [(WBSSQLiteStore *)self database];
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v8, 0, @"INSERT INTO page_url (url, uuid, last_fetch_date, last_fetch_did_succeed, metadata_has_image)SELECT p.url, p.uuid, u.timestamp, 1, 1 FROM page_url_old p JOIN uuid_info u ON p.uuid = u.uuid");

  if (v9 != 101)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v24 = [(WBSSQLiteStore *)self database];
      v25 = [v24 lastErrorMessage];
      int v26 = 138543618;
      v27 = v25;
      __int16 v28 = 1024;
      int v29 = v9;
      _os_log_error_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_ERROR, "Failed to move page_url_old data to page_url table: %{public}@ (%d)", (uint8_t *)&v26, 0x12u);
    }
  }
  uint64_t v11 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v11, 0, @"DROP TABLE page_url_old");

  if (v4 != 101)
  {
    int v12 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(WBSSQLiteStore *)self database];
      v14 = [v13 lastErrorMessage];
      int v26 = 138543618;
      v27 = v14;
      __int16 v28 = 1024;
      int v29 = v4;
      _os_log_error_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_ERROR, "Failed to drop page_url_old table: %{public}@ (%d)", (uint8_t *)&v26, 0x12u);
    }
LABEL_20:
  }
  return v4;
}

- (void)linkAndUpdateMetadataInfoForURLString:(id)a3 lastFetchDate:(id)a4 lastFetchDidSucceed:(BOOL)a5 metadataHasImage:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  long long v15 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __139__WBSLPLinkMetadataSQLiteStore_linkAndUpdateMetadataInfoForURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke;
  block[3] = &unk_1E5E40F50;
  block[4] = self;
  id v20 = v12;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, block);
}

void __139__WBSLPLinkMetadataSQLiteStore_linkAndUpdateMetadataInfoForURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke(uint64_t a1)
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  id v12 = 0;
  int v2 = [*(id *)(a1 + 32) database];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __139__WBSLPLinkMetadataSQLiteStore_linkAndUpdateMetadataInfoForURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_60;
  v5[3] = &unk_1E5E40F28;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v4 = v3;
  char v9 = *(unsigned char *)(a1 + 64);
  id v6 = v4;
  int v8 = v11;
  id v7 = *(id *)(a1 + 48);
  char v10 = *(unsigned char *)(a1 + 65);
  [v2 tryToPerformTransactionInBlock:v5];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _Block_object_dispose(v11, 8);
}

uint64_t __139__WBSLPLinkMetadataSQLiteStore_linkAndUpdateMetadataInfoForURLString_lastFetchDate_lastFetchDidSucceed_metadataHasImage_completionHandler___block_invoke_60(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _fetchMetadataInfoForURLString:*(void *)(a1 + 40)];
  v3 = [v2 uuidString];
  if (!v3)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v4 = [MEMORY[0x1E4F29128] UUID];
      v3 = [v4 UUIDString];
    }
    else
    {
      v3 = 0;
    }
  }
  id v5 = [[WBSLPLinkMetadataInfo alloc] initWithURLString:*(void *)(a1 + 40) uuidString:v3 lastFetchDate:*(void *)(a1 + 48) lastFetchDidSucceed:*(unsigned __int8 *)(a1 + 64) metadataHasImage:*(unsigned __int8 *)(a1 + 65)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (([*(id *)(a1 + 32) _setMetadataInfo:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forURLString:*(void *)(a1 + 40)] & 1) == 0)objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v2); {
  return 1;
  }
}

- (void)linkURLString:(id)a3 withMetadataInfoForURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__WBSLPLinkMetadataSQLiteStore_linkURLString_withMetadataInfoForURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5E40FA0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __93__WBSLPLinkMetadataSQLiteStore_linkURLString_withMetadataInfoForURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  int v2 = [*(id *)(a1 + 32) database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__WBSLPLinkMetadataSQLiteStore_linkURLString_withMetadataInfoForURLString_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5E40F78;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v11 = &v12;
  v8[4] = v3;
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  [v2 tryToPerformTransactionInBlock:v8];

  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v13[5], v5, v6, v7);
  _Block_object_dispose(&v12, 8);
}

uint64_t __93__WBSLPLinkMetadataSQLiteStore_linkURLString_withMetadataInfoForURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchMetadataInfoForURLString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v5 = [WBSLPLinkMetadataInfo alloc];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uuidString];
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) lastFetchDate];
    uint64_t v9 = -[WBSLPLinkMetadataInfo initWithURLString:uuidString:lastFetchDate:lastFetchDidSucceed:metadataHasImage:](v5, "initWithURLString:uuidString:lastFetchDate:lastFetchDidSucceed:metadataHasImage:", v6, v7, v8, [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) lastFetchDidSucceed], objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "metadataHasImage"));
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (([*(id *)(a1 + 32) _setMetadataInfo:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forURLString:*(void *)(a1 + 48)] & 1) == 0)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = 0;
    }
  }
  return 1;
}

- (void)getMetadataInfoForURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSLPLinkMetadataSQLiteStore_getMetadataInfoForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E40FC8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __78__WBSLPLinkMetadataSQLiteStore_getMetadataInfoForURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _fetchMetadataInfoForURLString:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)removeMetadataInfoForURLStrings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLStrings_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __82__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLStrings_completionHandler___block_invoke(uint64_t a1)
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__2;
  v8[4] = __Block_byref_object_dispose__2;
  id v9 = 0;
  id v2 = [*(id *)(a1 + 32) database];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLStrings_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5E40FF0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v7 = v8;
  v5[4] = v3;
  id v6 = v4;
  [v2 tryToPerformTransactionInBlock:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(v8, 8);
}

uint64_t __82__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLStrings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _deleteMetadataInfoForURLStrings:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

- (void)removeAllMetadataInfoWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__2;
  v8[4] = __Block_byref_object_dispose__2;
  id v9 = [MEMORY[0x1E4F1C978] array];
  uint64_t v2 = [*(id *)(a1 + 32) database];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5E40FF0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v7 = v8;
  v5[4] = v3;
  id v6 = v4;
  [v2 tryToPerformTransactionInBlock:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(v8, 8);
}

uint64_t __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchAllMetadataInfoWithUUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) _deleteMetadataInfoWithUUID:*(void *)(a1 + 40)];
  return 1;
}

- (void)removeAllMetadataInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBSSQLiteStore *)self databaseQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E41040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) database];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5E40ED8;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = v4;
  [v2 tryToPerformTransactionInBlock:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(v4, 8);
}

uint64_t __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _deleteAllMetadataInfo];
  return 1;
}

- (void)performLRUEvictionIfNecessaryWithMaximumNumberOfEntries:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke;
  block[3] = &unk_1E5E41090;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke(uint64_t a1)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__2;
  v6[4] = __Block_byref_object_dispose__2;
  id v7 = [MEMORY[0x1E4F1C978] array];
  uint64_t v2 = [*(id *)(a1 + 32) database];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5E41068;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  void v5[5] = v6;
  void v5[6] = v4;
  v5[4] = v3;
  [v2 tryToPerformTransactionInBlock:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(v6, 8);
}

uint64_t __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke_2(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) _uuidCount] > *(void *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _deleteUUIDWithOldestTimestamp];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  return 1;
}

- (id)_fetchMetadataInfoForURLString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v4 = [(WBSSQLiteStore *)self database];
  char v5 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, @"SELECT * FROM page_url WHERE url = ?", &v11);

  id v6 = [v5 nextObject];
  if (v6) {
    id v7 = [[WBSLPLinkMetadataInfo alloc] initWithSQLiteRow:v6];
  }
  else {
    id v7 = 0;
  }
  id v8 = [v5 statement];
  [v8 invalidate];

  if (!v7)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      id v13 = v11;
      _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "No metadata info found for URL: %{sensitive}@.", buf, 0xCu);
    }
  }

  return v7;
}

- (BOOL)_setMetadataInfo:(id)a3 forURLString:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = a4;
  id v7 = [v6 uuidString];

  if (v7)
  {
    id v8 = [(WBSSQLiteStore *)self database];
    id v24 = [v6 uuidString];
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceReferenceDate];
    *(void *)buf = v10;
    int v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},double>(v8, 0, @"REPLACE INTO uuid_info (uuid, timestamp) VALUES (?, ?)", &v24, (double *)buf);

    if (v11 != 101)
    {
      id v18 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = [v6 uuidString];
        [(WBSLPLinkMetadataSQLiteStore *)v19 _setMetadataInfo:v11 forURLString:v18];
      }

      goto LABEL_10;
    }
  }
  id v12 = [(WBSSQLiteStore *)self database];
  id v23 = [v6 uuidString];
  id v13 = [v6 lastFetchDate];
  [v13 timeIntervalSinceReferenceDate];
  *(void *)buf = v14;
  unsigned __int8 v22 = [v6 lastFetchDidSucceed];
  unsigned __int8 v21 = [v6 metadataHasImage];
  int v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong},double,BOOL,BOOL>(v12, 0, @"REPLACE INTO page_url (url, uuid, last_fetch_date, last_fetch_did_succeed, metadata_has_image) VALUES (?, ?, ?, ?, ?)", &v25, &v23, (double *)buf, &v22, &v21);

  if (v15 != 101)
  {
    id v17 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[WBSLPLinkMetadataSQLiteStore _setMetadataInfo:forURLString:]((uint64_t *)&v25, v15, v17);
    }
LABEL_10:
    BOOL v16 = 0;
    goto LABEL_11;
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (id)_deleteMetadataInfoForURLStrings:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v4 = -[WBSLPLinkMetadataSQLiteStore _queryListWithStrings:](self, "_queryListWithStrings:");
  char v5 = [NSString stringWithFormat:@"DELETE FROM page_url WHERE url IN (%@)", v4];
  id v6 = [(WBSSQLiteStore *)self database];
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, v5);

  if (v7 != 101)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoForURLStrings:]();
    }
  }
  id v9 = [(WBSSQLiteStore *)self database];
  uint64_t v10 = SafariShared::WBSSQLiteDatabaseFetch<>(v9, @"SELECT u.uuid FROM uuid_info u LEFT JOIN page_url p ON u.uuid = p.uuid WHERE p.url IS NULL");

  int v11 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        BOOL v16 = [*(id *)(*((void *)&v26 + 1) + 8 * i) stringAtIndex:0];
        objc_msgSend(v11, "safari_addObjectUnlessNil:", v16);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  id v17 = [v12 statement];
  [v17 invalidate];

  if ([v11 count])
  {
    id v18 = (void *)[v11 copy];
    v19 = [(WBSLPLinkMetadataSQLiteStore *)self _queryListWithStrings:v18];

    id v20 = [NSString stringWithFormat:@"DELETE FROM uuid_info WHERE uuid IN (%@)", v19];

    unsigned __int8 v21 = [(WBSSQLiteStore *)self database];
    int v22 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v21, 0, v20);

    if (v22 != 101)
    {
      id v23 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoForURLStrings:]();
      }
    }
  }
  else
  {
    id v20 = v5;
  }

  return v11;
}

- (void)_deleteMetadataInfoWithUUID:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(WBSSQLiteStore *)self database];
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, @"DELETE FROM uuid_info WHERE uuid = ?", &v10);

  if (v5 != 101)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoWithUUID:]();
    }
  }
  int v7 = [(WBSSQLiteStore *)self database];
  int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v7, 0, @"DELETE FROM page_url WHERE uuid = ?", &v10);

  if (v8 != 101)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoWithUUID:]();
    }
  }
}

- (BOOL)_deleteAllMetadataInfo
{
  uint64_t v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"DELETE FROM page_url");

  if (v4 != 101)
  {
    int v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    BOOL v7 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    -[WBSLPLinkMetadataSQLiteStore _deleteAllMetadataInfo]();
    goto LABEL_9;
  }
  int v5 = [(WBSSQLiteStore *)self database];
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"DELETE FROM uuid_info");

  if (v6 != 101)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    BOOL v7 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    -[WBSLPLinkMetadataSQLiteStore _deleteAllMetadataInfo]();
LABEL_9:
    LOBYTE(v7) = 0;
    return v7;
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (unint64_t)_uuidCount
{
  uint64_t v2 = [(WBSSQLiteStore *)self database];
  uint64_t v3 = SafariShared::WBSSQLiteDatabaseFetch<>(v2, @"SELECT COUNT(*) FROM uuid_info");

  int v4 = [v3 nextObject];
  unint64_t v5 = [v4 int64AtIndex:0];
  int v6 = [v3 statement];
  [v6 invalidate];

  return v5;
}

- (id)_deleteUUIDWithOldestTimestamp
{
  uint64_t v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::WBSSQLiteDatabaseFetch<>(v3, @"SELECT uuid FROM uuid_info WHERE timestamp = (SELECT MIN(timestamp) FROM uuid_info)");

  unint64_t v5 = [v4 nextObject];
  int v6 = [v5 stringAtIndex:0];

  BOOL v7 = [v4 statement];
  [v7 invalidate];

  if (v6)
  {
    int v8 = [(WBSLPLinkMetadataSQLiteStore *)self _fetchAllMetadataInfoWithUUID:v6];
    [(WBSLPLinkMetadataSQLiteStore *)self _deleteMetadataInfoWithUUID:v6];
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSLPLinkMetadataSQLiteStore _deleteUUIDWithOldestTimestamp](v9);
    }
    int v8 = 0;
  }

  return v8;
}

- (id)_fetchAllMetadataInfoWithUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  int v4 = [(WBSSQLiteStore *)self database];
  unint64_t v5 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, @"SELECT * FROM page_url WHERE uuid = ?", &v21);

  int v6 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [WBSLPLinkMetadataInfo alloc];
        uint64_t v13 = -[WBSLPLinkMetadataInfo initWithSQLiteRow:](v12, "initWithSQLiteRow:", v11, (void)v17);
        objc_msgSend(v6, "safari_addObjectUnlessNil:", v13);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [v7 statement];
  [v14 invalidate];

  int v15 = (void *)[v6 copy];
  return v15;
}

- (id)_queryListWithStrings:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_6);
  int v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

id __54__WBSLPLinkMetadataSQLiteStore__queryListWithStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [NSString stringWithFormat:@"'%@'", a2];
  return v2;
}

- (void)_setMetadataInfo:(os_log_t)log forURLString:.cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138740227;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to save URL: %{sensitive}@, error code: %d", (uint8_t *)&v4, 0x12u);
}

- (void)_setMetadataInfo:(int)a3 forURLString:(os_log_t)log .cold.2(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to save UUID: %{private}@, error code: %d", buf, 0x12u);
}

- (void)_deleteMetadataInfoForURLStrings:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete uuids. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deleteMetadataInfoForURLStrings:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete urls. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deleteMetadataInfoWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete uuid. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deleteAllMetadataInfo
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete all from page_url table. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deleteUUIDWithOldestTimestamp
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to fetch LRU entry from uuid_info table.", v1, 2u);
}

@end