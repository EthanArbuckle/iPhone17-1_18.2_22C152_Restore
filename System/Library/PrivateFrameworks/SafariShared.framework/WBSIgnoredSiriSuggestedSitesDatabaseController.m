@interface WBSIgnoredSiriSuggestedSitesDatabaseController
+ (unint64_t)thresholdForHidingIgnoredSiriSuggestedSites;
- (id)_dateAtWhichIgnoredSiriSuggestedSitesArePruned;
- (id)_getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4;
- (int)_createFreshDatabaseSchema;
- (int)_currentSchemaVersion;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (void)_addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6;
- (void)_removeIgnoredSiriSuggestedSitesBeforeDate:(id)a3;
- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4;
- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4;
- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4;
- (void)_removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4;
- (void)_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5;
- (void)addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6;
- (void)getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4 completionHandler:(id)a5;
- (void)pruneIgnoredSiriSuggestedSites;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4 completionHandler:(id)a5;
- (void)removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4;
- (void)updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5;
@end

@implementation WBSIgnoredSiriSuggestedSitesDatabaseController

+ (unint64_t)thresholdForHidingIgnoredSiriSuggestedSites
{
  if (+[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::onceToken != -1) {
    dispatch_once(&+[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::onceToken, &__block_literal_global_75);
  }
  return +[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::thresholdForHidingIgnoredSiriSuggestedSites;
}

void __93__WBSIgnoredSiriSuggestedSitesDatabaseController_thresholdForHidingIgnoredSiriSuggestedSites__block_invoke()
{
  v0 = +[WBSResultRanker searchParameters];
  uint64_t v1 = [v0 thresholdForHidingIgnoredSiriSuggestedSites];

  uint64_t v2 = 3;
  if ((unint64_t)(v1 + 1) >= 2) {
    uint64_t v2 = v1;
  }
  +[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::thresholdForHidingIgnoredSiriSuggestedSites = v2;
}

- (int)_currentSchemaVersion
{
  return 3;
}

- (int)_createFreshDatabaseSchema
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v3 = [(WBSSQLiteStore *)self database];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__WBSIgnoredSiriSuggestedSitesDatabaseController__createFreshDatabaseSchema__block_invoke;
  v5[3] = &unk_1E5C9DBA0;
  v5[4] = self;
  v5[5] = &v6;
  [v3 tryToPerformTransactionInBlock:v5];

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

BOOL __76__WBSIgnoredSiriSuggestedSitesDatabaseController__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) database];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, @"CREATE TABLE ignored_siri_suggested_sites (id TEXT PRIMARY KEY NOT NULL,url TEXT NOT NULL,query TEXT NOT NULL,profile TEXT NOT NULL,timestamp REAL NOT NULL)");

  return *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 101;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  v5 = [(WBSSQLiteStore *)self database];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__WBSIgnoredSiriSuggestedSitesDatabaseController__migrateToSchemaVersion___block_invoke;
  v7[3] = &unk_1E5C9DBC8;
  int v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  [v5 tryToPerformTransactionInBlock:v7];

  LODWORD(v5) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v5;
}

BOOL __74__WBSIgnoredSiriSuggestedSitesDatabaseController__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 == 3 || v2 == 2) {
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
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"DELETE FROM ignored_siri_suggested_sites");

  if (v4 == 101)
  {
    v5 = [(WBSSQLiteStore *)self database];
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"ALTER TABLE ignored_siri_suggested_sites RENAME COLUMN url TO siriSuggestedSiteURL");

    if (v4 == 101)
    {
      uint64_t v6 = [(WBSSQLiteStore *)self database];
      int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, @"ALTER TABLE ignored_siri_suggested_sites ADD visitedURL TEXT");
    }
  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"DROP TABLE ignored_siri_suggested_sites");

  if (v4 == 101)
  {
    v5 = [(WBSSQLiteStore *)self database];
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"CREATE TABLE ignored_siri_suggested_sites (id TEXT PRIMARY KEY NOT NULL,siriSuggestedSiteURL TEXT NOT NULL,query TEXT NOT NULL,profile TEXT NOT NULL,timestamp REAL NOT NULL,visitedURL TEXT,ignoreCount INTEGER NOT NULL,UNIQUE (siriSuggestedSiteURL, query, profile))");
  }
  return v4;
}

- (void)addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__WBSIgnoredSiriSuggestedSitesDatabaseController_addIgnoredSiriSuggestedSiteWithURLString_inProfile_withQuery_visitedURLString___block_invoke;
  block[3] = &unk_1E5C9D460;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __128__WBSIgnoredSiriSuggestedSitesDatabaseController_addIgnoredSiriSuggestedSiteWithURLString_inProfile_withQuery_visitedURLString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addIgnoredSiriSuggestedSiteWithURLString:*(void *)(a1 + 40) inProfile:*(void *)(a1 + 48) withQuery:*(void *)(a1 + 56) visitedURLString:*(void *)(a1 + 64)];
}

- (void)updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __126__WBSIgnoredSiriSuggestedSitesDatabaseController_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile_query_visitedURLString___block_invoke;
  v15[3] = &unk_1E5C9B5C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __126__WBSIgnoredSiriSuggestedSitesDatabaseController_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile_query_visitedURLString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:*(void *)(a1 + 40) query:*(void *)(a1 + 48) visitedURLString:*(void *)(a1 + 56)];
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_afterDate___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __101__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_afterDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeIgnoredSiriSuggestedSitesInProfile:*(void *)(a1 + 40) afterDate:*(void *)(a1 + 48)];
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_query___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __97__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_query___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeIgnoredSiriSuggestedSitesInProfile:*(void *)(a1 + 40) query:*(void *)(a1 + 48)];
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __124__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_visitedURLHost_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9B058;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __124__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_visitedURLHost_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeIgnoredSiriSuggestedSitesInProfile:*(void *)(a1 + 40) visitedURLHost:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesWithURLHost_inProfile___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __103__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesWithURLHost_inProfile___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeIgnoredSiriSuggestedSitesWithURLHost:*(void *)(a1 + 40) inProfile:*(void *)(a1 + 48)];
}

- (void)getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WBSSQLiteStore *)self databaseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __126__WBSIgnoredSiriSuggestedSitesDatabaseController_getIgnoredSiriSuggestedSitesURLStringsInProfile_withQuery_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9C910;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __126__WBSIgnoredSiriSuggestedSitesDatabaseController_getIgnoredSiriSuggestedSitesURLStringsInProfile_withQuery_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 40) _getIgnoredSiriSuggestedSitesURLStringsInProfile:*(void *)(a1 + 48) withQuery:v1];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

- (void)pruneIgnoredSiriSuggestedSites
{
  id v3 = [(WBSSQLiteStore *)self databaseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__WBSIgnoredSiriSuggestedSitesDatabaseController_pruneIgnoredSiriSuggestedSites__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __80__WBSIgnoredSiriSuggestedSitesDatabaseController_pruneIgnoredSiriSuggestedSites__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 _dateAtWhichIgnoredSiriSuggestedSitesArePruned];
  objc_msgSend(v1, "_removeIgnoredSiriSuggestedSitesBeforeDate:");
}

- (id)_dateAtWhichIgnoredSiriSuggestedSitesArePruned
{
  id v2 = [MEMORY[0x1E4F1C9C8] now];
  id v3 = [v2 dateByAddingTimeInterval:-2592000.0];

  return v3;
}

- (void)_addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v10 = a6;
  id v24 = v10;
  id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v27];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSinceReferenceDate];
    uint64_t v14 = v13;

    uint64_t v23 = v14;
    [(WBSSQLiteStore *)self database];
    if (v10) {
      id v15 = {;
    }
      id v16 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v22 = [v16 UUIDString];
      *(_DWORD *)buf = 1;
      int v17 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong}&,NSString * {__strong}&,NSString * {__strong}&,double &,NSString * {__strong}&,int,double &,NSString * {__strong}&>(v15, 0, @"INSERT INTO ignored_siri_suggested_sites (id, siriSuggestedSiteURL, query, profile, timestamp, visitedURL, ignoreCount) VALUES (?, ?, ?, ?, ?, ?, ?) ON CONFLICT(siriSuggestedSiteURL, query, profile) DO UPDATE SET timestamp=?, visitedURL = ?, ignoreCount=ignoreCount + 1", &v22, &v27, &v25, &v26, (double *)&v23, &v24, (unsigned int *)buf, (double *)&v23, &v24);
      id v18 = &v22;
    }
    else {
      id v15 = {;
    }
      id v16 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v21 = [v16 UUIDString];
      *(_DWORD *)buf = 1;
      int v17 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong}&,NSString * {__strong}&,NSString * {__strong}&,double &,int,double &>(v15, 0, @"INSERT INTO ignored_siri_suggested_sites (id, siriSuggestedSiteURL, query, profile, timestamp, ignoreCount) VALUES (?, ?, ?, ?, ?, ?) ON CONFLICT(siriSuggestedSiteURL, query, profile) DO UPDATE SET timestamp=?, visitedURL = NULL, ignoreCount=ignoreCount + 1", &v21, &v27, &v25, &v26, (double *)&v23, (unsigned int *)buf, (double *)&v23);
      id v18 = &v21;
    }

    if (v17 != 101)
    {
      id v20 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740739;
        id v29 = v27;
        __int16 v30 = 2117;
        id v31 = v25;
        __int16 v32 = 2117;
        id v33 = v26;
        __int16 v34 = 1024;
        int v35 = v17;
        _os_log_error_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_ERROR, "Failed to insert an ignored suggested site with siriSuggestedSiteURL: %{sensitive}@ query: %{sensitive}@ profile: %{sensitive}@. Error code: %d", buf, 0x26u);
      }
    }
    id v10 = v24;
  }
  else
  {
    id v19 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      id v29 = v27;
      __int16 v30 = 2117;
      id v31 = v25;
      __int16 v32 = 2117;
      id v33 = v26;
      _os_log_error_impl(&dword_1A6B5F000, v19, OS_LOG_TYPE_ERROR, "Unable to insert an ignored suggested site, due to an invalid URL: %{sensitive}@ query: %{sensitive}@ profile: %{sensitive}@.", buf, 0x20u);
    }
  }
}

- (void)_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v14 = a4;
  id v13 = a5;
  id v8 = [(WBSSQLiteStore *)self database];
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  [v9 timeIntervalSinceReferenceDate];
  *(void *)buf = v10;
  int v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,NSString * {__strong}&,NSString * {__strong}&,NSString * {__strong}&>(v8, 0, @"UPDATE ignored_siri_suggested_sites SET timestamp = ?, visitedURL = ? WHERE profile = ? AND query = ?", (double *)buf, &v13, &v15, &v14);

  if (v11 != 101)
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v17 = 2113;
      id v18 = v14;
      __int16 v19 = 1024;
      int v20 = v11;
      _os_log_error_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_ERROR, "Failed to update the timestamps of ignored suggested sites with profile: %{private}@ and query = %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }
}

- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = a4;
  id v7 = [(WBSSQLiteStore *)self database];
  [v6 timeIntervalSinceReferenceDate];
  *(void *)buf = v8;
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,double>(v7, 0, @"DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND timestamp > ?", &v13, (double *)buf);

  if (v9 != 101)
  {
    uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = v13;
      [v6 timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 138740483;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v15 = 2053;
      uint64_t v16 = v12;
      __int16 v17 = 1024;
      int v18 = v9;
      _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and timestamp > %{sensitive}f. Error code: %d", buf, 0x1Cu);
    }
  }
}

- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v9 = a4;
  id v6 = [(WBSSQLiteStore *)self database];
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v6, 0, @"DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND query = ?", &v10, &v9);

  if (v7 != 101)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      id v12 = v10;
      __int16 v13 = 2117;
      id v14 = v9;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and query = %{sensitive}@. Error code: %d", buf, 0x1Cu);
    }
  }
}

- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v6 = a4;
  int v7 = [NSString stringWithFormat:@"DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND visitedURL LIKE '%%%@%%'", v6];
  uint64_t v8 = [(WBSSQLiteStore *)self database];
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v8, 0, v7, &v11);

  if (v9 != 101)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      id v13 = v11;
      __int16 v14 = 2117;
      id v15 = v6;
      __int16 v16 = 1024;
      int v17 = v9;
      _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and visited URL host = %{sensitive}@. Error code: %d", buf, 0x1Cu);
    }
  }
}

- (void)_removeIgnoredSiriSuggestedSitesBeforeDate:(id)a3
{
  v10[3] = *(double *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WBSSQLiteStore *)self database];
  [v4 timeIntervalSinceReferenceDate];
  v10[0] = v6;
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double>(v5, 0, @"DELETE FROM ignored_siri_suggested_sites WHERE timestamp < ?", v10);

  if (v7 != 101)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v4 timeIntervalSinceReferenceDate];
      -[WBSIgnoredSiriSuggestedSitesDatabaseController _removeIgnoredSiriSuggestedSitesBeforeDate:]((uint8_t *)v10, v7, v8, v9);
    }
  }
}

- (void)_removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v11 = a4;
  int v7 = [NSString stringWithFormat:@"DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND siriSuggestedSiteURL LIKE '%%://%@/%%'", v6];
  uint64_t v8 = [(WBSSQLiteStore *)self database];
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v8, 0, v7, &v11);

  if (v9 != 101)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      id v13 = v11;
      __int16 v14 = 2117;
      id v15 = v6;
      __int16 v16 = 1024;
      int v17 = v9;
      _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and host: %{sensitive}@. Error code: %d", buf, 0x1Cu);
    }
  }
}

- (id)_getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v20 = a4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v21 = [NSString stringWithFormat:@"SELECT siriSuggestedSiteURL, ignoreCount FROM ignored_siri_suggested_sites WHERE profile = ? AND query LIKE '%@%%'", v20];
  int v7 = [(WBSSQLiteStore *)self database];
  uint64_t v8 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v7, v21, &v28);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v13 = [v12 stringAtIndex:0];
        LODWORD(v12) = [v12 intAtIndex:1];
        __int16 v14 = [v6 objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 integerValue];

        __int16 v16 = [NSNumber numberWithUnsignedInteger:v15 + (int)v12];
        [v6 setObject:v16 forKeyedSubscript:v13];

        int v17 = [v6 objectForKeyedSubscript:v13];
        LODWORD(v14) = [v17 unsignedIntValue];
        LOBYTE(v15) = [(id)objc_opt_class() thresholdForHidingIgnoredSiriSuggestedSites] > (unint64_t)v14;

        if ((v15 & 1) == 0) {
          [v22 addObject:v13];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  uint64_t v18 = [obj statement];
  [v18 invalidate];

  return v22;
}

- (void)_removeIgnoredSiriSuggestedSitesBeforeDate:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log, double a4)
{
  *(_DWORD *)buf = 134545921;
  *(double *)(buf + 4) = a4;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites where timestamp < %{sensitive}f. Error code: %d", buf, 0x12u);
}

@end