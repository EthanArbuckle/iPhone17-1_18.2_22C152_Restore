@interface WBSFaviconProviderDatabaseController
- (BOOL)_deleteRejectedResourceForPageURLString:(id)a3 iconURLString:(id)a4;
- (BOOL)_hasPageURLsForIconUUID:(id)a3;
- (BOOL)_setRejectedResourceForPageURL:(id)a3 iconURLString:(id)a4;
- (id)_fetchAllPageURLStrings;
- (id)_fetchIconInfoForIconURLString:(id)a3;
- (id)_fetchIconInfoForIconUUID:(id)a3;
- (id)_fetchIconInfosForRejectedResourcesWithPageURLString:(id)a3 iconURLString:(id)a4;
- (id)_fetchIconUUIDForPageURLString:(id)a3;
- (id)_fetchIconUUIDsForPageURLStrings:(id)a3;
- (id)_fetchPageURLStringsWithPredicate:(id)a3;
- (id)_findOrphansFromIconUUIDs:(id)a3;
- (id)_setIconUUID:(id)a3 forIconURLString:(id)a4 size:(CGSize)a5 hasGeneratedResolutions:(BOOL)a6;
- (id)_setTimestampToNowForIconUUID:(id)a3;
- (int)_createFreshDatabaseSchema;
- (int)_currentSchemaVersion;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (int)_migrateToSchemaVersion_4;
- (void)_deleteAllPageAndIconEntries;
- (void)_deleteIconWithUUIDFromIconInfo:(id)a3;
- (void)_deleteIconsWithUUIDsFromIconInfo:(id)a3;
- (void)_deletePageURL:(id)a3;
- (void)_deletePageURLs:(id)a3;
- (void)_deletePageURLsWithUUIDFromPageInfo:(id)a3;
- (void)_deleteRejectedResourceForPageURLString:(id)a3;
- (void)_deleteRejectedResourceForPageURLStrings:(id)a3;
- (void)_firstIconUUIDForPageURLStrings:(id)a3 completionHandler:(id)a4;
- (void)_generateStatementsForQuery:(id)a3 arguments:(id)a4 statementCallback:(id)a5;
- (void)_setPageURL:(id)a3 toIconUUID:(id)a4;
- (void)fetchAllIconUUIDsWithCompletionHandler:(id)a3;
- (void)fetchAllKnownPageURLStringsWithCompletionHandler:(id)a3;
- (void)fetchPageURLStringsWithPrefixesIn:(id)a3 completionHandler:(id)a4;
- (void)firstIconInfoMatchingIconURLStringIn:(id)a3 completionHandler:(id)a4;
- (void)firstIconInfoMatchingPageURLStringIn:(id)a3 completionHandler:(id)a4;
- (void)firstIconUUIDMatchingPageURLStringIn:(id)a3 completionHandler:(id)a4;
- (void)iconInfoForIconURLString:(id)a3 completionHandler:(id)a4;
- (void)iconInfoForPageURLString:(id)a3 completionHandler:(id)a4;
- (void)linkAndUpdateTimestampForIconWithPageURLString:(id)a3 iconURLString:(id)a4 iconSize:(CGSize)a5 iconHasGeneratedResolutions:(BOOL)a6 completionHandler:(id)a7;
- (void)linkPageURLString:(id)a3 toExistingIconURLString:(id)a4 completionHandler:(id)a5;
- (void)markRejectedIconAtPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5;
- (void)markValidIconAtPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5;
- (void)rejectedResourceIconInfosForPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5;
- (void)removeAllDataForIconUUID:(id)a3 completionHandler:(id)a4;
- (void)removeAllPageURLStringsWithCompletionHandler:(id)a3;
- (void)removePageURLString:(id)a3 completionHandler:(id)a4;
- (void)removePageURLStrings:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSFaviconProviderDatabaseController

- (int)_currentSchemaVersion
{
  return 4;
}

void __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  v3 = [*(id *)(a1 + 32) database];
  v4 = SafariShared::WBSSQLiteDatabaseFetch<>(v3, @"SELECT uuid FROM page_url");

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 stringAtIndex:0];
        if ([v10 length])
        {
          v11 = [v9 stringAtIndex:0];
          [v2 addObject:v11];
        }
        else
        {
          v12 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke_cold_1(&v16, v17, v12);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v13 = [v5 statement];
  [v13 invalidate];

  uint64_t v14 = *(void *)(a1 + 40);
  v15 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

- (void)fetchAllIconUUIDsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSSQLiteStore *)self databaseQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E41040;
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
  v5[2] = __66__WBSFaviconProviderDatabaseController__createFreshDatabaseSchema__block_invoke;
  v5[3] = &unk_1E5E40ED8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 tryToPerformTransactionInBlock:v5];

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

BOOL __66__WBSFaviconProviderDatabaseController__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, @"CREATE TABLE page_url (url TEXT NOT NULL ON CONFLICT FAIL UNIQUE ON CONFLICT REPLACE,uuid TEXT NOT NULL ON CONFLICT FAIL)");

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 101) {
    return 0;
  }
  v3 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"CREATE INDEX PageURLIndex ON page_url (url)");

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 101) {
    return 0;
  }
  id v4 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v4, 0, @"CREATE TABLE icon_info (uuid TEXT PRIMARY KEY NOT NULL,url TEXT NOT NULL,timestamp INTEGER)");

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 101) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"CREATE TABLE database_info (key TEXT PRIMARY KEY NOT NULL,value TEXT NOT NULL)");

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
  v7[2] = __64__WBSFaviconProviderDatabaseController__migrateToSchemaVersion___block_invoke;
  v7[3] = &unk_1E5E40F00;
  int v8 = a3;
  v7[4] = self;
  void v7[5] = &v9;
  [v5 tryToPerformTransactionInBlock:v7];

  LODWORD(v5) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v5;
}

BOOL __64__WBSFaviconProviderDatabaseController__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 == 4 || v2 == 3 || v2 == 2) {
    int v3 = [*(id *)(a1 + 32) _migrateToSchemaVersion];
  }
  else {
    int v3 = 1;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 101;
}

- (int)_migrateToSchemaVersion_2
{
  int v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"ALTER TABLE icon_info ADD width INTEGER DEFAULT 0");

  if (v4 == 101)
  {
    id v5 = [(WBSSQLiteStore *)self database];
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"ALTER TABLE icon_info ADD height INTEGER DEFAULT 0");
  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v2 = [(WBSSQLiteStore *)self database];
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, @"ALTER TABLE icon_info ADD has_generated_representations INTEGER DEFAULT 0");

  return v3;
}

- (int)_migrateToSchemaVersion_4
{
  int v2 = [(WBSSQLiteStore *)self database];
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, @"CREATE TABLE rejected_resources (page_url TEXT NOT NULL ON CONFLICT FAIL,icon_url TEXT NOT NULL ON CONFLICT FAIL,timestamp INTEGER,UNIQUE(page_url, icon_url))");

  return v3;
}

- (void)linkAndUpdateTimestampForIconWithPageURLString:(id)a3 iconURLString:(id)a4 iconSize:(CGSize)a5 iconHasGeneratedResolutions:(BOOL)a6 completionHandler:(id)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  uint8_t v16 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke;
  block[3] = &unk_1E5E41F10;
  block[4] = self;
  id v21 = v13;
  CGFloat v24 = width;
  CGFloat v25 = height;
  BOOL v26 = a6;
  id v22 = v14;
  id v23 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  dispatch_async(v16, block);
}

void __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _fetchIconUUIDForPageURLString:*(void *)(a1 + 40)];
  int v3 = [*(id *)(a1 + 32) _fetchIconInfoForIconURLString:*(void *)(a1 + 48)];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4;
  v40 = __Block_byref_object_dispose__4;
  id v41 = [v3 UUIDString];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  char v35 = [v3 hasGeneratedResolutions];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__4;
  CGFloat v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  int v4 = [*(id *)(a1 + 32) database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke_23;
  v10[3] = &unk_1E5E41EE8;
  id v14 = &v36;
  id v15 = &v26;
  v10[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  long long v18 = *(_OWORD *)(a1 + 64);
  char v19 = *(unsigned char *)(a1 + 80);
  id v11 = v5;
  uint8_t v16 = &v32;
  id v6 = v2;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v17 = &v20;
  [v4 tryToPerformTransactionInBlock:v10];

  uint64_t v7 = *(void *)(a1 + 56);
  int v8 = [WBSFaviconProviderIconInfo alloc];
  uint64_t v9 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v8, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", *(void *)(a1 + 40), *(void *)(a1 + 48), v37[5], v27[5], *((unsigned __int8 *)v33 + 24), 0, *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(uint64_t, WBSFaviconProviderIconInfo *, uint64_t))(v7 + 16))(v7, v9, v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
}

uint64_t __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke_23(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_setTimestampToNowForIconUUID:");
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if ([*(id *)(a1 + 48) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])return 1; {
  }
    }
  else
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_setIconUUID:forIconURLString:size:hasGeneratedResolutions:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 112), *(double *)(a1 + 96), *(double *)(a1 + 104));
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(unsigned char *)(a1 + 112);
  }
  [*(id *)(a1 + 32) _deletePageURL:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "_hasPageURLsForIconUUID:") & 1) == 0)
  {
    [*(id *)(a1 + 32) _deleteIconWithUUIDFromIconInfo:*(void *)(a1 + 48)];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(a1 + 48));
  }
  [*(id *)(a1 + 32) _setPageURL:*(void *)(a1 + 56) toIconUUID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 32) _deleteRejectedResourceForPageURLString:*(void *)(a1 + 56) iconURLString:*(void *)(a1 + 40)];
  return 1;
}

- (void)linkPageURLString:(id)a3 toExistingIconURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5E40FA0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchIconUUIDForPageURLString:*(void *)(a1 + 40)];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__4;
  CGFloat v24 = __Block_byref_object_dispose__4;
  id v25 = [*(id *)(a1 + 32) _fetchIconInfoForIconURLString:*(void *)(a1 + 48)];
  if (!v21[5])
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_2(v9);
    }
    id v10 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  if (!v2)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [(id)v21[5] UUIDString];
    [v11 _setPageURL:v12 toIconUUID:v13];

    goto LABEL_10;
  }
  uint64_t v3 = [(id)v21[5] UUIDString];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
LABEL_10:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_11;
  }
  id v5 = [*(id *)(a1 + 32) database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_26;
  v14[3] = &unk_1E5E41F38;
  uint64_t v6 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v6;
  id v16 = v2;
  id v18 = &v26;
  char v19 = &v20;
  id v17 = *(id *)(a1 + 48);
  [v5 tryToPerformTransactionInBlock:v14];

  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 1, v27[5], v7, v8);
LABEL_11:
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

uint64_t __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_26(uint64_t a1)
{
  [*(id *)(a1 + 32) _deletePageURL:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 32) _hasPageURLsForIconUUID:*(void *)(a1 + 48)] & 1) == 0)
  {
    [*(id *)(a1 + 32) _deleteIconWithUUIDFromIconInfo:*(void *)(a1 + 48)];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 48));
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) UUIDString];
  [v2 _setPageURL:v3 toIconUUID:v4];

  [*(id *)(a1 + 32) _deleteRejectedResourceForPageURLString:*(void *)(a1 + 40) iconURLString:*(void *)(a1 + 56)];
  return 1;
}

- (void)removePageURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke(uint64_t a1)
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__4;
  v7[4] = __Block_byref_object_dispose__4;
  id v8 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) database];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5E41F60;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = v7;
  [v2 tryToPerformTransactionInBlock:v4];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(v7, 8);
}

uint64_t __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteRejectedResourceForPageURLString:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) _fetchIconUUIDForPageURLString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    [*(id *)(a1 + 32) _deletePageURL:*(void *)(a1 + 40)];
    if ([*(id *)(a1 + 32) _hasPageURLsForIconUUID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;
    }
    else
    {
      [*(id *)(a1 + 32) _deleteIconWithUUIDFromIconInfo:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
  return 1;
}

- (void)removePageURLStrings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__4;
  id v15 = __Block_byref_object_dispose__4;
  id v16 = (id)objc_opt_new();
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [*(id *)(a1 + 32) database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5E41F60;
  int v4 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = &v11;
  [v3 tryToPerformTransactionInBlock:v8];

  uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    [v2 timeIntervalSinceNow];
    __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_2(v18, v5, v6);
  }

  id v7 = (id)WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_1(buf, [(id)v12[5] count], objc_msgSend(*(id *)(a1 + 40), "count"), v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(&v11, 8);
}

uint64_t __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allObjects];
  [v2 _deleteRejectedResourceForPageURLStrings:v3];

  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) allObjects];
  double v6 = [v4 _fetchIconUUIDsForPageURLStrings:v5];

  if ([v6 count])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) allObjects];
    [v7 _deletePageURLs:v8];

    id v9 = *(void **)(a1 + 32);
    id v10 = [v6 allObjects];
    uint64_t v11 = [v9 _findOrphansFromIconUUIDs:v10];

    if ([v11 count])
    {
      [*(id *)(a1 + 32) _deleteIconsWithUUIDsFromIconInfo:v11];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v11];
    }
  }
  return 1;
}

- (void)removeAllDataForIconUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSFaviconProviderDatabaseController_removeAllDataForIconUUID_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __83__WBSFaviconProviderDatabaseController_removeAllDataForIconUUID_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deletePageURLsWithUUIDFromPageInfo:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _deleteIconWithUUIDFromIconInfo:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)removeAllPageURLStringsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBSSQLiteStore *)self databaseQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__WBSFaviconProviderDatabaseController_removeAllPageURLStringsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E41040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __85__WBSFaviconProviderDatabaseController_removeAllPageURLStringsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteAllPageAndIconEntries];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)fetchAllKnownPageURLStringsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBSSQLiteStore *)self databaseQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__WBSFaviconProviderDatabaseController_fetchAllKnownPageURLStringsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E410B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __89__WBSFaviconProviderDatabaseController_fetchAllKnownPageURLStringsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _fetchAllPageURLStrings];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)iconInfoForPageURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSFaviconProviderDatabaseController_iconInfoForPageURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __83__WBSFaviconProviderDatabaseController_iconInfoForPageURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1;
  uint64_t v4 = [*(id *)(a1 + 32) _fetchIconUUIDForPageURLString:*(void *)(a1 + 40)];
  id v12 = (id)v4;
  if (v4)
  {
    uint64_t v5 = [*(id *)(v3 + 32) _fetchIconInfoForIconUUID:v4];
    uint64_t v6 = *(void *)(v3 + 48);
    if (v5)
    {
      id v7 = [WBSFaviconProviderIconInfo alloc];
      uint64_t v8 = *(void *)(v3 + 40);
      uint64_t v3 = [v5 iconURLString];
      uint64_t v1 = [v5 UUIDString];
      id v2 = [v5 dateAdded];
      [v5 size];
      uint64_t v11 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v7, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v8, v3, v1, v2, [v5 hasGeneratedResolutions], objc_msgSend(v5, "isRejectedResource"), v9, v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    (*(void (**)(uint64_t, WBSFaviconProviderIconInfo *))(v6 + 16))(v6, v11);
    if (v5)
    {
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(v3 + 48) + 16))();
  }
}

- (void)iconInfoForIconURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSFaviconProviderDatabaseController_iconInfoForIconURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E40FC8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __83__WBSFaviconProviderDatabaseController_iconInfoForIconURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _fetchIconInfoForIconURLString:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)markRejectedIconAtPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__WBSFaviconProviderDatabaseController_markRejectedIconAtPageURLString_iconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5E40FA0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __104__WBSFaviconProviderDatabaseController_markRejectedIconAtPageURLString_iconURLString_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteRejectedResourceForPageURLString:*(void *)(a1 + 40) iconURLString:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = [*(id *)(a1 + 32) _setRejectedResourceForPageURL:*(void *)(a1 + 40) iconURLString:*(void *)(a1 + 48)];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)markValidIconAtPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__WBSFaviconProviderDatabaseController_markValidIconAtPageURLString_iconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5E41F88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

uint64_t __101__WBSFaviconProviderDatabaseController_markValidIconAtPageURLString_iconURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v2 = [*(id *)(a1 + 32) _deleteRejectedResourceForPageURLString:*(void *)(a1 + 40) iconURLString:*(void *)(a1 + 48)];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)rejectedResourceIconInfosForPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__WBSFaviconProviderDatabaseController_rejectedResourceIconInfosForPageURLString_iconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5E41F88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __114__WBSFaviconProviderDatabaseController_rejectedResourceIconInfosForPageURLString_iconURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  id v2 = [*(id *)(a1 + 32) _fetchIconInfosForRejectedResourcesWithPageURLString:*(void *)(a1 + 40) iconURLString:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)firstIconUUIDMatchingPageURLStringIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSFaviconProviderDatabaseController_firstIconUUIDMatchingPageURLStringIn_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __95__WBSFaviconProviderDatabaseController_firstIconUUIDMatchingPageURLStringIn_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _firstIconUUIDForPageURLStrings:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)firstIconInfoMatchingPageURLStringIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5E41FB0;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _firstIconUUIDForPageURLStrings:v3 completionHandler:v5];
}

void __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) _fetchIconInfoForIconUUID:v7];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v8)
    {
      id v10 = [WBSFaviconProviderIconInfo alloc];
      a1 = [v8 iconURLString];
      uint64_t v3 = [v8 UUIDString];
      id v4 = [v8 dateAdded];
      [v8 size];
      id v13 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v10, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v14, a1, v3, v4, [v8 hasGeneratedResolutions], objc_msgSend(v8, "isRejectedResource"), v11, v12);
    }
    else
    {
      id v13 = 0;
    }
    (*(void (**)(uint64_t, WBSFaviconProviderIconInfo *))(v9 + 16))(v9, v13);
    if (v8)
    {
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_firstIconUUIDForPageURLStrings:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v13 = -[WBSFaviconProviderDatabaseController _fetchIconUUIDForPageURLString:](self, "_fetchIconUUIDForPageURLString:", v12, (void)v14);
        if (v13)
        {
          v7[2](v7, v12, v13);

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v7[2](v7, 0, 0);
LABEL_11:
}

- (void)firstIconInfoMatchingIconURLStringIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingIconURLStringIn_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingIconURLStringIn_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = objc_msgSend(*(id *)(a1 + 40), "_fetchIconInfoForIconURLString:", *(void *)(*((void *)&v7 + 1) + 8 * i), (void)v7);
        if (v6)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          return;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchPageURLStringsWithPrefixesIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__WBSFaviconProviderDatabaseController_fetchPageURLStringsWithPrefixesIn_completionHandler___block_invoke;
  block[3] = &unk_1E5E41FD8;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __92__WBSFaviconProviderDatabaseController_fetchPageURLStringsWithPrefixesIn_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "safari_mapObjectsUsingBlock:", &__block_literal_global_11);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v7 = v2;
  uint64_t v5 = [v2 componentsJoinedByString:@" OR "];
  id v6 = [v4 _fetchPageURLStringsWithPredicate:v5];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);
}

id __92__WBSFaviconProviderDatabaseController_fetchPageURLStringsWithPrefixesIn_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithFormat:@"url LIKE \"%@%%\"", a2];
  return v2;
}

- (id)_fetchIconUUIDForPageURLString:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(WBSSQLiteStore *)self database];
  uint64_t v5 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, @"SELECT uuid FROM page_url WHERE url = ?", &v10);

  id v6 = [v5 nextObject];
  id v7 = [v6 stringAtIndex:0];

  long long v8 = [v5 statement];
  [v8 invalidate];

  return v7;
}

- (id)_fetchIconUUIDsForPageURLStrings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__WBSFaviconProviderDatabaseController__fetchIconUUIDsForPageURLStrings___block_invoke;
  v8[3] = &unk_1E5E42000;
  id v6 = v5;
  id v9 = v6;
  [(WBSFaviconProviderDatabaseController *)self _generateStatementsForQuery:@"SELECT uuid FROM page_url WHERE url IN" arguments:v4 statementCallback:v8];

  return v6;
}

void __73__WBSFaviconProviderDatabaseController__fetchIconUUIDsForPageURLStrings___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 fetch];
  while (1)
  {
    id v4 = [v3 nextObject];
    uint64_t v5 = v4;
    if (!v4) {
      break;
    }
    id v6 = *(void **)(a1 + 32);
    id v7 = [v4 stringAtIndex:0];
    [v6 addObject:v7];
  }
  [v8 invalidate];
}

- (id)_fetchIconInfoForIconURLString:(id)a3
{
  id v17 = a3;
  id v4 = [(WBSSQLiteStore *)self database];
  uint64_t v5 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, @"SELECT uuid, timestamp, width, height, has_generated_representations FROM icon_info WHERE url = ?", &v17);

  id v6 = [v5 nextObject];
  id v7 = [v6 stringAtIndex:0];
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v6 doubleAtIndex:1];
  id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  int v10 = [v6 intAtIndex:2];
  int v11 = [v6 intAtIndex:3];
  uint64_t v12 = [v6 BOOLAtIndex:4];
  id v13 = [v5 statement];
  [v13 invalidate];

  if (v7)
  {
    id v14 = [WBSFaviconProviderIconInfo alloc];
    long long v15 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v14, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v17, v7, v9, v12, 0, (double)v10, (double)v11);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)_fetchIconInfoForIconUUID:(id)a3
{
  id v17 = a3;
  id v4 = [(WBSSQLiteStore *)self database];
  uint64_t v5 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, @"SELECT url, timestamp, width, height, has_generated_representations FROM icon_info WHERE uuid = ?", &v17);

  id v6 = [v5 nextObject];
  id v7 = [v6 stringAtIndex:0];
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v6 doubleAtIndex:1];
  id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  int v10 = [v6 intAtIndex:2];
  int v11 = [v6 intAtIndex:3];
  uint64_t v12 = [v6 BOOLAtIndex:4];
  id v13 = [v5 statement];
  [v13 invalidate];

  if (v7)
  {
    id v14 = [WBSFaviconProviderIconInfo alloc];
    long long v15 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v14, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v7, v17, v9, v12, 0, (double)v10, (double)v11);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)_fetchIconInfosForRejectedResourcesWithPageURLString:(id)a3 iconURLString:(id)a4
{
  id v18 = a3;
  id v17 = a4;
  id v6 = [(WBSSQLiteStore *)self database];
  id v7 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&,NSString * {__strong}&>(v6, @"SELECT timestamp FROM rejected_resources WHERE icon_url = ? OR page_url = ?", &v17, &v18);

  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = (double *)MEMORY[0x1E4F1DB30];
  while (1)
  {
    int v10 = [v7 nextObject];
    int v11 = v10;
    if (!v10) {
      break;
    }
    [v10 doubleAtIndex:0];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    id v13 = [WBSFaviconProviderIconInfo alloc];
    id v14 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v13, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v18, v17, 0, v12, 0, 1, *v9, v9[1]);
    [v8 addObject:v14];
  }
  long long v15 = [v7 statement];
  [v15 invalidate];

  return v8;
}

- (id)_fetchAllPageURLStrings
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(WBSSQLiteStore *)self database];
  uint64_t v3 = SafariShared::WBSSQLiteDatabaseFetch<>(v2, @"SELECT url FROM page_url");

  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "stringAtIndex:", 0, (void)v12);
        if (v9) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  int v10 = [v5 statement];
  [v10 invalidate];

  return v4;
}

- (id)_fetchPageURLStringsWithPredicate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(WBSSQLiteStore *)self database];
  uint64_t v7 = [@"SELECT url FROM page_url WHERE " stringByAppendingString:v4];
  id v8 = SafariShared::WBSSQLiteDatabaseFetch<>(v6, v7);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "stringAtIndex:", 0, (void)v16);
        [v5 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v14 = [v9 statement];
  [v14 invalidate];

  return v5;
}

- (id)_findOrphansFromIconUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__WBSFaviconProviderDatabaseController__findOrphansFromIconUUIDs___block_invoke;
  v10[3] = &unk_1E5E42000;
  id v6 = v5;
  id v11 = v6;
  [(WBSFaviconProviderDatabaseController *)self _generateStatementsForQuery:@"SELECT uuid FROM page_url WHERE uuid IN" arguments:v4 statementCallback:v10];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
  [v7 minusSet:v6];
  id v8 = [v7 allObjects];

  return v8;
}

void __66__WBSFaviconProviderDatabaseController__findOrphansFromIconUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 fetch];
  while (1)
  {
    id v4 = [v3 nextObject];
    id v5 = v4;
    if (!v4) {
      break;
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v4 stringAtIndex:0];
    [v6 addObject:v7];
  }
  [v8 invalidate];
}

- (void)_setPageURL:(id)a3 toIconUUID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v10 = a4;
  id v6 = [(WBSSQLiteStore *)self database];
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v6, 0, @"INSERT INTO page_url (url, uuid) VALUES (?, ?)", &v11, &v10);

  if (v7 != 101)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _setPageURL:toIconUUID:]();
    }
    id v9 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      id v13 = v11;
      __int16 v14 = 2113;
      id v15 = v10;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_debug_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_DEBUG, "Failed to set page url: %{private}@ to icon UUID: %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }
}

- (id)_setIconUUID:(id)a3 forIconURLString:(id)a4 size:(CGSize)a5 hasGeneratedResolutions:(BOOL)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGSize v19 = a5;
  id v18 = a3;
  id v17 = a4;
  BOOL v16 = a6;
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [(WBSSQLiteStore *)self database];
  [v9 timeIntervalSinceReferenceDate];
  *(void *)buf = v11;
  int v12 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,double,double &,double &,BOOL &>(v10, 0, @"REPLACE INTO icon_info (uuid, url, timestamp, width, height, has_generated_representations) VALUES (?, ?, ?, ?, ?, ?)", &v18, &v17, (double *)buf, &v19.width, &v19.height, (unsigned __int8 *)&v16);

  if (v12 != 101)
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _setIconUUID:forIconURLString:size:hasGeneratedResolutions:]();
    }
    __int16 v14 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v21 = 2113;
      id v22 = v17;
      __int16 v23 = 1024;
      int v24 = v12;
      _os_log_debug_impl(&dword_1ABB70000, v14, OS_LOG_TYPE_DEBUG, "Failed to set icon UUID: %{private}@ for icon url: %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

  return v9;
}

- (id)_setTimestampToNowForIconUUID:(id)a3
{
  id v10 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [(WBSSQLiteStore *)self database];
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v9 = v6;
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,NSString * {__strong}&>(v5, 0, @"UPDATE icon_info SET timestamp=? WHERE uuid=?", (double *)&v9, &v10);

  if (self != 101)
  {
    int v7 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _setTimestampToNowForIconUUID:]();
    }
  }

  return v4;
}

- (BOOL)_setRejectedResourceForPageURL:(id)a3 iconURLString:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v13 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  int v7 = [(WBSSQLiteStore *)self database];
  [v6 timeIntervalSinceReferenceDate];
  *(void *)buf = v8;
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,double>(v7, 0, @"REPLACE INTO rejected_resources (page_url, icon_url, timestamp) VALUES (?, ?, ?)", &v14, &v13, (double *)buf);

  if (v9 != 101)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _setRejectedResourceForPageURL:iconURLString:]();
    }
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v16 = 2113;
      id v17 = v13;
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_debug_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_DEBUG, "Failed to set rejected resource for page url %{private}@ and icon url %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

  return v9 == 101;
}

- (void)_deletePageURL:(id)a3
{
  id v7 = a3;
  id v4 = [(WBSSQLiteStore *)self database];
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, @"DELETE FROM page_url WHERE url = ?", &v7);

  if (self != 101)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _deletePageURL:]();
    }
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[WBSFaviconProviderDatabaseController _deletePageURL:]();
    }
  }
}

- (void)_deletePageURLs:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke;
  v6[3] = &unk_1E5E42000;
  id v7 = v4;
  id v5 = v4;
  [(WBSFaviconProviderDatabaseController *)self _generateStatementsForQuery:@"DELETE FROM page_url WHERE url IN" arguments:v5 statementCallback:v6];
}

void __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 execute] != 101)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_2();
    }
    id v4 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_1();
    }
  }
  [v2 invalidate];
}

- (BOOL)_deleteRejectedResourceForPageURLString:(id)a3 iconURLString:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v11 = a4;
  uint64_t v6 = [(WBSSQLiteStore *)self database];
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v6, 0, @"DELETE FROM rejected_resources WHERE page_url = ? AND icon_url = ?", &v12, &v11);

  if (v7 != 101)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _deleteRejectedResourceForPageURLString:iconURLString:]();
    }
    int v9 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      id v14 = v12;
      __int16 v15 = 2113;
      id v16 = v11;
      __int16 v17 = 1024;
      int v18 = v7;
      _os_log_debug_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_DEBUG, "Failed to reset rejected resource for page url %{private}@, icon url %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

  return v7 == 101;
}

- (void)_deleteRejectedResourceForPageURLString:(id)a3
{
  id v7 = a3;
  id v4 = [(WBSSQLiteStore *)self database];
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, @"DELETE FROM rejected_resources WHERE page_url = ?", &v7);

  if (self != 101)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _deleteRejectedResourceForPageURLString:]();
    }
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[WBSFaviconProviderDatabaseController _deleteRejectedResourceForPageURLString:]();
    }
  }
}

- (void)_deleteRejectedResourceForPageURLStrings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke;
  v6[3] = &unk_1E5E42000;
  id v7 = v4;
  id v5 = v4;
  [(WBSFaviconProviderDatabaseController *)self _generateStatementsForQuery:@"DELETE FROM rejected_resources WHERE page_url IN" arguments:v5 statementCallback:v6];
}

void __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 execute] != 101)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_2();
    }
    id v4 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_1();
    }
  }
  [v2 invalidate];
}

- (BOOL)_hasPageURLsForIconUUID:(id)a3
{
  id v8 = a3;
  id v4 = [(WBSSQLiteStore *)self database];
  id v5 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, @"SELECT EXISTS(SELECT 1 FROM page_url WHERE uuid = ?)", &v8);
  uint64_t v6 = [v5 nextObject];

  LOBYTE(v4) = [v6 int64AtIndex:0] == 1;
  return (char)v4;
}

- (void)_deletePageURLsWithUUIDFromPageInfo:(id)a3
{
  id v6 = a3;
  id v4 = [(WBSSQLiteStore *)self database];
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, @"DELETE FROM page_url WHERE uuid = ?", &v6);

  if (self != 101)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _deletePageURLsWithUUIDFromPageInfo:]();
    }
  }
}

- (void)_deleteIconWithUUIDFromIconInfo:(id)a3
{
  id v6 = a3;
  id v4 = [(WBSSQLiteStore *)self database];
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, @"DELETE FROM icon_info WHERE uuid = ?", &v6);

  if (self != 101)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProviderDatabaseController _deleteIconWithUUIDFromIconInfo:]();
    }
  }
}

- (void)_deleteIconsWithUUIDsFromIconInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke;
  v6[3] = &unk_1E5E42000;
  id v7 = v4;
  id v5 = v4;
  [(WBSFaviconProviderDatabaseController *)self _generateStatementsForQuery:@"DELETE FROM icon_info WHERE uuid IN" arguments:v5 statementCallback:v6];
}

void __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 execute] != 101)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke_cold_1();
    }
  }
  [v2 invalidate];
}

- (void)_deleteAllPageAndIconEntries
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete all from icon_info table. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_generateStatementsForQuery:(id)a3 arguments:(id)a4 statementCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = [v9 count];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke;
  v16[3] = &unk_1E5E42050;
  id v13 = v11;
  id v17 = v13;
  uint64_t v21 = v12;
  id v14 = v8;
  id v18 = v14;
  uint64_t v19 = self;
  id v15 = v10;
  id v20 = v15;
  [v9 enumerateObjectsUsingBlock:v16];
}

void __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  if (__ROR8__(0x1CAC083126E978D5 * (a3 - 499), 2) < 0x83126E978D4FDFuLL || *(void *)(a1 + 64) - 1 == a3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%@ ("), *(void *)(a1 + 40);
    uint8_t v6 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_2;
    v15[3] = &unk_1E5E42028;
    id v7 = v5;
    id v16 = v7;
    [v6 enumerateObjectsUsingBlock:v15];
    [v7 replaceCharactersInRange:objc_msgSend(v7, "length") - 1, 1, @"" withString]);
    id v8 = objc_alloc(MEMORY[0x1E4F983C8]);
    id v9 = [*(id *)(a1 + 48) database];
    id v10 = (void *)[v8 initWithDatabase:v9 query:v7];

    id v11 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_3;
    v13[3] = &unk_1E5E42028;
    id v12 = v10;
    id v14 = v12;
    [v11 enumerateObjectsUsingBlock:v13];
    [*(id *)(a1 + 32) removeAllObjects];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"?%lu,", a3 + 1);
}

uint64_t __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) bindString:a2 atParameterIndex:a3 + 1];
}

void __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = *v0;
  int v4 = 138478083;
  uint64_t v5 = v2;
  __int16 v6 = 2113;
  uint64_t v7 = v1;
  _os_log_debug_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEBUG, "Failed to link page url: %{private}@ to icon url: %{private}@, no icon uuid could be found.", (uint8_t *)&v4, 0x16u);
}

void __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to link page url icon url; no icon uuid could be found.",
    v1,
    2u);
}

void __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "Removed %lu orphaned uuids for %lu url strings", buf, 0x16u);
}

void __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_2(uint8_t *buf, NSObject *a2, double a3)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = "remove_pageurls";
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = -a3;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "#perf - %{public}s: %f", buf, 0x16u);
}

void __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Empty UUID found in page_url table", buf, 2u);
}

- (void)_setPageURL:toIconUUID:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1ABB70000, v0, v1, "Failed to set page url to icon UUID: %{private}@. Error code: %d");
}

- (void)_setIconUUID:forIconURLString:size:hasGeneratedResolutions:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1ABB70000, v0, v1, "Failed to set icon UUID: %{private}@ for icon url, error code: %d");
}

- (void)_setTimestampToNowForIconUUID:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1ABB70000, v0, v1, "Failed to update timestamp for icon UUID: %{private}@. Error code: %d");
}

- (void)_setRejectedResourceForPageURL:iconURLString:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to set rejected resource for page and icon url. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deletePageURL:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_4(&dword_1ABB70000, v0, v1, "Failed to delete page url: %{private}@. Error code: %d");
}

- (void)_deletePageURL:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete page url. Error code: %d", v2, v3, v4, v5, v6);
}

void __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_4(&dword_1ABB70000, v0, v1, "Failed to delete page urls: %{private}@. Error code: %d");
}

void __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete page urls. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deleteRejectedResourceForPageURLString:iconURLString:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to reset rejected resource for page and icon urls. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deleteRejectedResourceForPageURLString:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_4(&dword_1ABB70000, v0, v1, "Failed to delete page url: %{private}@ from rejected resources. Error code: %d");
}

- (void)_deleteRejectedResourceForPageURLString:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete page url from rejected resources. Error code: %d", v2, v3, v4, v5, v6);
}

void __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_4(&dword_1ABB70000, v0, v1, "Failed to delete page urls: %{private}@ from rejected resources. Error code: %d");
}

void __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1ABB70000, v0, v1, "Failed to delete page urls from rejected resources. Error code: %d", v2, v3, v4, v5, v6);
}

- (void)_deletePageURLsWithUUIDFromPageInfo:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1ABB70000, v0, v1, "Failed to delete page urls with with uuid: %@. Error code: %d");
}

- (void)_deleteIconWithUUIDFromIconInfo:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1ABB70000, v0, v1, "Failed to delete icon with uuid: %{private}@. Error code: %d");
}

void __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4(&dword_1ABB70000, v0, v1, "Failed to delete icons with uuids: %{private}@. Error code: %d");
}

@end