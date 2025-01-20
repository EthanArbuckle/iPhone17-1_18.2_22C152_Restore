@interface WBSUserDefinedContentBlockerSQLiteStore
+ (id)defaultDatabaseURL;
+ (id)sharedStore;
- (BOOL)_deleteFromAllTables;
- (BOOL)_isDatabaseOpen;
- (BOOL)_migrateToSchemaVersion:(int)a3;
- (BOOL)_tryToPerformTransactionInBlock:(id)a3;
- (WBSUserDefinedContentBlockerSQLiteStore)init;
- (WBSUserDefinedContentBlockerSQLiteStore)initWithDatabaseURL:(id)a3;
- (int)_createFreshDatabaseSchema;
- (int)_insertContentBlockerWithType:(int64_t)a3 host:(id)a4 excludeGlobal:(BOOL)a5;
- (int)_migrateToCurrentSchemaVersionIfNecessary;
- (int)_migrateToSchemaVersion_2;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (int64_t)_insertAction:(id)a3 forContentBlockerID:(int64_t)a4;
- (void)_closeDatabase;
- (void)_createFreshDatabaseSchema;
- (void)_deleteActions:(id)a3;
- (void)_deleteActionsForContentBlockerID:(int64_t)a3;
- (void)_deleteFromAllTables;
- (void)_getActionsForContentBlockerID:(int64_t)a3 isGlobal:(BOOL)a4 completionHandler:(id)a5;
- (void)_getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 isGlobal:(BOOL)a5 completion:(id)a6;
- (void)_getAllContentBlockerHostsWithCompletionHandler:(id)a3;
- (void)_getContentBlockerWithType:(int64_t)a3 host:(id)a4 completionHandler:(id)a5;
- (void)_getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3;
- (void)_insertActions:(id)a3 forContentBlockerID:(int64_t)a4;
- (void)_migrateToSchemaVersion_2;
- (void)_openDatabase;
- (void)_openDatabaseIfNecessary;
- (void)_updateExtraAttributes:(id)a3 forContentBlockerID:(int64_t)a4;
- (void)closeDatabase;
- (void)createPerSiteContentBlockerForHost:(id)a3;
- (void)dealloc;
- (void)deleteActions:(id)a3;
- (void)deleteActionsForContentBlockerID:(int64_t)a3;
- (void)getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 isGlobal:(BOOL)a5 completion:(id)a6;
- (void)getAllContentBlockerHostsWithCompletionHandler:(id)a3;
- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3;
- (void)getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3;
- (void)getPerSiteContentBlockerForHost:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5;
- (void)insertActions:(id)a3 forContentBlockerID:(int64_t)a4;
- (void)resetDatabaseWithCompletionHandler:(id)a3;
- (void)updateContentBlockerActionExtraAttributes:(id)a3;
@end

@implementation WBSUserDefinedContentBlockerSQLiteStore

uint64_t __63__WBSUserDefinedContentBlockerSQLiteStore_initWithDatabaseURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openDatabaseIfNecessary];
}

uint64_t __109__WBSUserDefinedContentBlockerSQLiteStore_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getNumberOfContentBlockersThatContainActionsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_openDatabaseIfNecessary
{
  if (![(WBSUserDefinedContentBlockerSQLiteStore *)self _isDatabaseOpen])
  {
    [(WBSUserDefinedContentBlockerSQLiteStore *)self _openDatabase];
  }
}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (void)_openDatabase
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to open User Defined Content Blocker store at %{private}@: %{public}@", v4, 0x16u);
}

- (void)_getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  database = self->_database;
  unsigned int v9 = 0;
  v6 = SafariShared::WBSSQLiteDatabaseFetch<int>(database, @"SELECT COUNT(DISTINCT content_blocker_id) FROM action", &v9);
  v7 = v6;
  if (v6)
  {
    v8 = [v6 nextObject];
    v4[2](v4, [v8 intAtIndex:0]);
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (int)_migrateToCurrentSchemaVersionIfNecessary
{
  v3 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  v4 = [v3 nextObject];
  int v5 = [v4 intAtIndex:0];

  v6 = [v3 statement];
  [v6 invalidate];

  if (v5 <= 1)
  {
    if (v5)
    {
      uint64_t v7 = (v5 + 1);
      while (v7 != 3)
      {
        BOOL v8 = [(WBSUserDefinedContentBlockerSQLiteStore *)self _migrateToSchemaVersion:v7];
        uint64_t v7 = (v7 + 1);
        if (!v8)
        {
          int v5 = v7 - 2;
          goto LABEL_11;
        }
      }
      int v5 = 2;
    }
    else if ([(WBSUserDefinedContentBlockerSQLiteStore *)self _createFreshDatabaseSchema] == 101)
    {
      [(WBSUserDefinedContentBlockerSQLiteStore *)self _insertContentBlockerWithType:1 host:@"*" excludeGlobal:0];
      int v5 = 2;
      [(WBSUserDefinedContentBlockerSQLiteStore *)self _setDatabaseSchemaVersion:2];
    }
    else
    {
      int v5 = 0;
    }
  }
LABEL_11:

  return v5;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", *(void *)&a3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    BOOL v8 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v12 = a3;
      __int16 v13 = 2114;
      v14 = v10;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to set the User Defined Content Blocker store database schema version to %d: %{public}@ (%d)", buf, 0x18u);
    }
  }
  return v7;
}

- (int)_insertContentBlockerWithType:(int64_t)a3 host:(id)a4 excludeGlobal:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t v16 = a3;
  id v15 = a4;
  BOOL v14 = a5;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database, @"INSERT INTO content_blocker (type, host, exclude_global, version)VALUES (?, ?, ?, ?)" query];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,WBSUserDefinedContentBlockerType &,NSString * {__strong}&,BOOL &,int const&>(v7, &v16, &v15, (unsigned __int8 *)&v14, (unsigned int *)&WBSUserDefinedContentBlockerSupportedVersion);
  int v8 = [v7 execute];
  [v7 reset];
  if (v8 != 101)
  {
    unsigned int v9 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = v15;
      int64_t v12 = v16;
      __int16 v13 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 134218755;
      int64_t v18 = v12;
      __int16 v19 = 2113;
      id v20 = v11;
      __int16 v21 = 2114;
      v22 = v13;
      __int16 v23 = 1024;
      int v24 = v8;
      _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to create content blocker(type %lu) for %{private}@: %{public}@ (%d)", buf, 0x26u);
    }
  }

  return v8;
}

- (int)_createFreshDatabaseSchema
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE content_blocker (id INTEGER PRIMARY KEY AUTOINCREMENT,host TEXT NOT NULL,type NUMERIC NOT NULL,version NUMERIC NOT NULL,exclude_global NUMERIC NULL,binary_cache BLOB NULL,UNIQUE(host, type))");
  if (v3 != 101)
  {
    int v5 = v3;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _createFreshDatabaseSchema]();
    }
    goto LABEL_10;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE cross_site_content (id INTEGER PRIMARY KEY AUTOINCREMENT,source TEXT NOT NULL,title TEXT NULL,extra_attributes BLOB NULL,version NUMERIC NOT NULL)");
  if (v4 != 101)
  {
    int v5 = v4;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _createFreshDatabaseSchema]();
    }
    goto LABEL_10;
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE action (id INTEGER PRIMARY KEY AUTOINCREMENT,content_blocker_id INTEGER NOT NULL,selector TEXT NOT NULL,type TEXT NOT NULL,version NUMERIC NOT NULL,cross_site_content_id INTEGER NULL,extra_attributes BLOB NULL,FOREIGN KEY (content_blocker_id) REFERENCES content_blocker(id) ON DELETE CASCADE,FOREIGN KEY (cross_site_content_id) REFERENCES cross_site_content(id) ON DELETE SET NULL)");
  if (v5 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _createFreshDatabaseSchema]();
    }
LABEL_10:
  }
  return v5;
}

- (void)getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__WBSUserDefinedContentBlockerSQLiteStore_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __54__WBSUserDefinedContentBlockerSQLiteStore_sharedStore__block_invoke(uint64_t a1)
{
  v2 = [WBSUserDefinedContentBlockerSQLiteStore alloc];
  id v5 = [*(id *)(a1 + 32) defaultDatabaseURL];
  uint64_t v3 = -[WBSUserDefinedContentBlockerSQLiteStore initWithDatabaseURL:](v2, "initWithDatabaseURL:");
  id v4 = (void *)+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::sharedStore;
  +[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::sharedStore = v3;
}

- (WBSUserDefinedContentBlockerSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSUserDefinedContentBlockerSQLiteStore;
  id v5 = [(WBSUserDefinedContentBlockerSQLiteStore *)&v17 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = (NSURL *)v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SafariShared.WBSUserDefinedContentBlockerSQLiteStore", v8);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    id v11 = v5->_databaseQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__WBSUserDefinedContentBlockerSQLiteStore_initWithDatabaseURL___block_invoke;
    block[3] = &unk_1E5C8CA70;
    int64_t v12 = v5;
    int64_t v16 = v12;
    dispatch_async(v11, block);
    __int16 v13 = v12;
  }
  return v5;
}

+ (id)defaultDatabaseURL
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = objc_msgSend(v2, "safari_settingsDirectoryURL");
  id v4 = [v3 URLByAppendingPathComponent:@"UserDefinedContentBlockers.db" isDirectory:0];

  return v4;
}

+ (id)sharedStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSUserDefinedContentBlockerSQLiteStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::onceToken != -1) {
    dispatch_once(&+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::onceToken, block);
  }
  v2 = (void *)+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::sharedStore;
  return v2;
}

- (WBSUserDefinedContentBlockerSQLiteStore)init
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSUserDefinedContentBlockerSQLiteStore;
  [(WBSUserDefinedContentBlockerSQLiteStore *)&v2 dealloc];
}

- (void)closeDatabase
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSUserDefinedContentBlockerSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __56__WBSUserDefinedContentBlockerSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabase];
}

- (void)resetDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSUserDefinedContentBlockerSQLiteStore_resetDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __78__WBSUserDefinedContentBlockerSQLiteStore_resetDatabaseWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteFromAllTables];
  objc_super v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)createPerSiteContentBlockerForHost:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSUserDefinedContentBlockerSQLiteStore_createPerSiteContentBlockerForHost___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __78__WBSUserDefinedContentBlockerSQLiteStore_createPerSiteContentBlockerForHost___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertContentBlockerWithType:0 host:*(void *)(a1 + 40) excludeGlobal:0];
}

- (void)getPerSiteContentBlockerForHost:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke;
  v13[3] = &unk_1E5C9C7F8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(databaseQueue, v13);
}

void __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5CA08F8;
  id v4 = *(id *)(a1 + 48);
  char v10 = *(unsigned char *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v4;
  v7[4] = v5;
  id v8 = v6;
  [v2 _getContentBlockerWithType:0 host:v3 completionHandler:v7];
}

void __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 || !*(unsigned char *)(a1 + 56))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _insertContentBlockerWithType:0 host:*(void *)(a1 + 40) excludeGlobal:0];
    [*(id *)(a1 + 32) _getContentBlockerWithType:0 host:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__WBSUserDefinedContentBlockerSQLiteStore_getGlobalContentBlockerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __88__WBSUserDefinedContentBlockerSQLiteStore_getGlobalContentBlockerWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getContentBlockerWithType:1 host:@"*" completionHandler:*(void *)(a1 + 40)];
}

- (void)getAllContentBlockerHostsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerHostsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __90__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerHostsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getAllContentBlockerHostsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 isGlobal:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerActionsWithType_excludeHost_isGlobal_completion___block_invoke;
  block[3] = &unk_1E5C9C060;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(databaseQueue, block);
}

uint64_t __111__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerActionsWithType_excludeHost_isGlobal_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getAllContentBlockerActionsWithType:*(void *)(a1 + 40) excludeHost:*(void *)(a1 + 48) isGlobal:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)updateContentBlockerActionExtraAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 databaseID];
  if (v5)
  {
    id v14 = [v4 extraAttributesData];
    if ([v14 length])
    {
      databaseQueue = self->_databaseQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__WBSUserDefinedContentBlockerSQLiteStore_updateContentBlockerActionExtraAttributes___block_invoke;
      block[3] = &unk_1E5C8D6E0;
      void block[4] = self;
      id v25 = v14;
      uint64_t v26 = v5;
      dispatch_async(databaseQueue, block);
    }
    else
    {
      id v16 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[WBSUserDefinedContentBlockerSQLiteStore updateContentBlockerActionExtraAttributes:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSUserDefinedContentBlockerSQLiteStore updateContentBlockerActionExtraAttributes:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t __85__WBSUserDefinedContentBlockerSQLiteStore_updateContentBlockerActionExtraAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateExtraAttributes:*(void *)(a1 + 40) forContentBlockerID:*(void *)(a1 + 48)];
}

- (void)insertActions:(id)a3 forContentBlockerID:(int64_t)a4
{
  id v6 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSUserDefinedContentBlockerSQLiteStore_insertActions_forContentBlockerID___block_invoke;
  block[3] = &unk_1E5C8D6E0;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __77__WBSUserDefinedContentBlockerSQLiteStore_insertActions_forContentBlockerID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertActions:*(void *)(a1 + 40) forContentBlockerID:*(void *)(a1 + 48)];
}

- (void)deleteActionsForContentBlockerID:(int64_t)a3
{
  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__WBSUserDefinedContentBlockerSQLiteStore_deleteActionsForContentBlockerID___block_invoke;
  v4[3] = &unk_1E5C8D080;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(databaseQueue, v4);
}

uint64_t __76__WBSUserDefinedContentBlockerSQLiteStore_deleteActionsForContentBlockerID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteActionsForContentBlockerID:*(void *)(a1 + 40)];
}

- (void)deleteActions:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__WBSUserDefinedContentBlockerSQLiteStore_deleteActions___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __57__WBSUserDefinedContentBlockerSQLiteStore_deleteActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteActions:*(void *)(a1 + 40)];
}

- (BOOL)_migrateToSchemaVersion:(int)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"_migrateToSchemaVersion_%d", *(void *)&a3);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v6 = NSSelectorFromString(v5);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__WBSUserDefinedContentBlockerSQLiteStore__migrateToSchemaVersion___block_invoke;
  v8[3] = &unk_1E5C9EBC8;
  v8[4] = self;
  v8[5] = v6;
  int v9 = a3;
  return [(WBSUserDefinedContentBlockerSQLiteStore *)self _tryToPerformTransactionInBlock:v8];
}

BOOL __67__WBSUserDefinedContentBlockerSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) methodSignatureForSelector:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v2];
  [v3 setSelector:*(void *)(a1 + 40)];
  [v3 invokeWithTarget:*(void *)(a1 + 32)];
  int v6 = 0;
  [v3 getReturnValue:&v6];
  BOOL v4 = v6 == 101
    && [*(id *)(a1 + 32) _setDatabaseSchemaVersion:*(unsigned int *)(a1 + 48)] != 0;

  return v4;
}

- (int)_migrateToSchemaVersion_2
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE action ADD COLUMN extra_attributes BLOB NULL");
  if (v3 != 101)
  {
    BOOL v4 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _migrateToSchemaVersion_2]();
    }
  }
  return v3;
}

- (BOOL)_tryToPerformTransactionInBlock:(id)a3
{
  BOOL v4 = (unsigned int (**)(void))a3;
  if (![(WBSUserDefinedContentBlockerSQLiteStore *)self _isDatabaseOpen]) {
    goto LABEL_15;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION") != 101)
  {
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:]();
    }
    goto LABEL_14;
  }
  if (!v4[2](v4))
  {
LABEL_11:
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ROLLBACK TRANSACTION") == 101)
    {
LABEL_15:
      BOOL v5 = 0;
      goto LABEL_16;
    }
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:]();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION") != 101)
  {
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:]();
    }

    goto LABEL_11;
  }
  BOOL v5 = 1;
LABEL_16:

  return v5;
}

- (void)_closeDatabase
{
  [(WBSSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;
}

- (BOOL)_deleteFromAllTables
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DELETE FROM action");
  BOOL v4 = v3 == 101;
  if (v3 != 101)
  {
    BOOL v5 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteFromAllTables]();
    }
  }
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"DELETE FROM content_blocker WHERE type != ?"];
  [v6 bindInt:1 atParameterIndex:1];
  int v7 = [v6 execute];
  [v6 reset];
  if (v7 != 101)
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteFromAllTables]();
    }

    BOOL v4 = 0;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DELETE FROM cross_site_content") != 101)
  {
    int v9 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteFromAllTables]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)_getContentBlockerWithType:(int64_t)a3 host:(id)a4 completionHandler:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  database = self->_database;
  unsigned int v19 = a3;
  id v10 = SafariShared::WBSSQLiteDatabaseFetch<int,NSString * {__strong}&>(database, @"SELECT id, exclude_global FROM content_blocker WHERE type = ? AND host = ?", &v19, &v20);
  int64_t v11 = [v10 nextObject];
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(WBSUserDefinedContentBlocker);
    -[WBSUserDefinedContentBlocker setDatabaseID:](v12, "setDatabaseID:", (int)[v11 intAtIndex:0]);
    [(WBSUserDefinedContentBlocker *)v12 setType:a3];
    [(WBSUserDefinedContentBlocker *)v12 setHost:v20];
    -[WBSUserDefinedContentBlocker setExcludeGlobalContentBlockers:](v12, "setExcludeGlobalContentBlockers:", [v11 BOOLAtIndex:1]);
    uint64_t v13 = [(WBSUserDefinedContentBlocker *)v12 databaseID];
    BOOL v14 = a3 == 1;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__WBSUserDefinedContentBlockerSQLiteStore__getContentBlockerWithType_host_completionHandler___block_invoke;
    v16[3] = &unk_1E5CA0920;
    id v15 = v12;
    uint64_t v17 = v15;
    id v18 = v8;
    [(WBSUserDefinedContentBlockerSQLiteStore *)self _getActionsForContentBlockerID:v13 isGlobal:v14 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __93__WBSUserDefinedContentBlockerSQLiteStore__getContentBlockerWithType_host_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setActions:");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_getAllContentBlockerHostsWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  database = self->_database;
  unsigned int v12 = 0;
  int v6 = SafariShared::WBSSQLiteDatabaseFetch<int>(database, @"SELECT host FROM content_blocker WHERE type = ?", &v12);
  int v7 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    id v8 = [v6 nextObject];
    int v9 = v8;
    if (!v8) {
      break;
    }
    id v10 = [v8 stringAtIndex:0];
    [v7 addObject:v10];
  }
  int64_t v11 = (void *)[v7 copy];
  v4[2](v4, v11);
}

- (void)_getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 isGlobal:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v22 = a3;
  id v21 = a4;
  id v10 = (void (**)(id, void *))a6;
  int64_t v11 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v12 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&,NSString * {__strong}&>(self->_database, @"SELECT action.id, action.selector, action.type, action.extra_attributes FROM action, content_blocker WHERE action.type = ? AND content_blocker.id = action.content_blocker_id AND content_blocker.host != ?", &v22, &v21);
  while (1)
  {
    uint64_t v13 = [v12 nextObject];
    if (!v13) {
      break;
    }
    BOOL v14 = [WBSUserDefinedContentBlockerAction alloc];
    int v15 = [v13 intAtIndex:0];
    id v16 = [v13 stringAtIndex:1];
    uint64_t v17 = [v13 stringAtIndex:2];
    id v18 = [v13 dataAtIndex:3];
    unsigned int v19 = [(WBSUserDefinedContentBlockerAction *)v14 initWithDatabaseID:v15 selector:v16 type:v17 extraAttributesData:v18 isGlobal:v7];

    [v11 addObject:v19];
  }
  id v20 = (void *)[v11 copy];
  v10[2](v10, v20);
}

- (void)_insertActions:(id)a3 forContentBlockerID:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[WBSUserDefinedContentBlockerSQLiteStore _insertAction:forContentBlockerID:](self, "_insertAction:forContentBlockerID:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), a4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)_insertAction:(id)a3 forContentBlockerID:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [v6 databaseID];
  if (v7)
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSUserDefinedContentBlockerSQLiteStore _insertAction:forContentBlockerID:](buf, [v6 databaseID], v9);
    }

    int64_t v7 = 0;
  }
  else if (a4)
  {
    database = self->_database;
    id v23 = [v6 selector];
    id v22 = [v6 typeString];
    *(_DWORD *)buf = a4;
    id v21 = [v6 extraAttributesData];
    long long v11 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong},NSString * {__strong},int,int const&,NSData * {__strong}>(database, @"INSERT INTO action (selector, type, content_blocker_id, version, extra_attributes)VALUES (?, ?, ?, ?, ?)RETURNING id", &v23, &v22, (unsigned int *)buf, (unsigned int *)&WBSUserDefinedContentBlockerActionSupportedVersion, &v21);

    int v12 = [v11 lastResultCode];
    long long v13 = [v11 nextObject];
    BOOL v14 = v13;
    if (!v13 || (uint64_t v15 = [v13 int64AtIndex:0], v14, !v15))
    {
      id v16 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v6 typeString];
        unsigned int v19 = [v6 selector];
        id v20 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        *(_DWORD *)buf = 138413314;
        id v25 = v18;
        __int16 v26 = 2112;
        v27 = v19;
        __int16 v28 = 2048;
        int64_t v29 = a4;
        __int16 v30 = 2114;
        v31 = v20;
        __int16 v32 = 1024;
        int v33 = v12;
        _os_log_error_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_ERROR, "Failed to create action(%@) with selector(%@) for contentBlockerID(%ld): %{public}@ (%d)", buf, 0x30u);
      }
      uint64_t v15 = 0;
    }

    int64_t v7 = v15;
  }
  else
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSUserDefinedContentBlockerSQLiteStore _insertAction:forContentBlockerID:](0, v8);
    }
  }

  return v7;
}

- (void)_getActionsForContentBlockerID:(int64_t)a3 isGlobal:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  id v20 = (void (**)(void, void))v8;
  database = self->_database;
  unsigned int v21 = v6;
  long long v11 = SafariShared::WBSSQLiteDatabaseFetch<int>(database, @"SELECT id, selector, type, extra_attributes FROM action WHERE content_blocker_id = ?", &v21);
  while (1)
  {
    int v12 = objc_msgSend(v11, "nextObject", v20);
    if (!v12) {
      break;
    }
    long long v13 = [WBSUserDefinedContentBlockerAction alloc];
    int v14 = [v12 intAtIndex:0];
    uint64_t v15 = [v12 stringAtIndex:1];
    id v16 = [v12 stringAtIndex:2];
    uint64_t v17 = [v12 dataAtIndex:3];
    id v18 = [(WBSUserDefinedContentBlockerAction *)v13 initWithDatabaseID:v14 selector:v15 type:v16 extraAttributesData:v17 isGlobal:v5];

    [v9 addObject:v18];
  }
  unsigned int v19 = (void *)[v9 copy];
  ((void (**)(void, void *))v20)[2](v20, v19);
}

- (void)_deleteActionsForContentBlockerID:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unsigned int v6 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"DELETE FROM action WHERE content_blocker_id = ?"];
    [v6 bindInt:a3 atParameterIndex:1];
    int v7 = [v6 execute];
    [v6 reset];
    if (v7 != 101)
    {
      id v8 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        int v10 = 134218498;
        int64_t v11 = a3;
        __int16 v12 = 2114;
        long long v13 = v9;
        __int16 v14 = 1024;
        int v15 = v7;
        _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to delete actions for contentBlockerID(%ld): %{public}@ (%d)", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  else
  {
    BOOL v4 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteActionsForContentBlockerID:](0, v4);
    }
  }
}

- (void)_deleteActions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_115);
  if ([v5 count])
  {
    unsigned int v6 = [v5 componentsJoinedByString:@","];
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"DELETE FROM action WHERE id IN (?)"];
    [v7 bindString:v6 atParameterIndex:1];
    int v8 = [v7 execute];
    [v7 reset];
    if (v8 != 101)
    {
      uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        int v11 = 138412802;
        __int16 v12 = v6;
        __int16 v13 = 2114;
        __int16 v14 = v10;
        __int16 v15 = 1024;
        int v16 = v8;
        _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to delete action(s) - (%@): %{public}@ (%d)", (uint8_t *)&v11, 0x1Cu);
      }
    }
  }
}

id __58__WBSUserDefinedContentBlockerSQLiteStore__deleteActions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 databaseID])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "databaseID"));
  }
  else
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __58__WBSUserDefinedContentBlockerSQLiteStore__deleteActions___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    int v11 = 0;
  }

  return v11;
}

- (void)_updateExtraAttributes:(id)a3 forContentBlockerID:(int64_t)a4
{
  unsigned int v4 = a4;
  id v10 = a3;
  database = self->_database;
  unsigned int v9 = v4;
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong}&,int>(database, 0, @"UPDATE action SET extra_attributes = ? WHERE id = ?", &v10, &v9);
  if (v7 != 101)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSUserDefinedContentBlockerSQLiteStore _updateExtraAttributes:forContentBlockerID:](v7, v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)updateContentBlockerActionExtraAttributes:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateContentBlockerActionExtraAttributes:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_migrateToSchemaVersion_2
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add extra_attributes column to action table: %{public}@ (%d)", v4, v5);
}

- (void)_createFreshDatabaseSchema
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to create the content_blocker table: %{public}@ (%d)", v4, v5);
}

- (void)_deleteFromAllTables
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to clear action table: %{public}@ (%d)", v4, v5);
}

- (void)_insertAction:(uint64_t)a1 forContentBlockerID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Cannot add action to non-existent content blocker (%ld).", (uint8_t *)&v2, 0xCu);
}

- (void)_insertAction:(os_log_t)log forContentBlockerID:.cold.2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Canceled adding action (%ld) because it's already in database).", buf, 0xCu);
}

- (void)_deleteActionsForContentBlockerID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Cannot delete actions from non-existent content blocker (%ld).", (uint8_t *)&v2, 0xCu);
}

void __58__WBSUserDefinedContentBlockerSQLiteStore__deleteActions___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateExtraAttributes:(int)a1 forContentBlockerID:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Error: unable to update content blocker action extra attributes (error code: %d)", (uint8_t *)v2, 8u);
}

@end