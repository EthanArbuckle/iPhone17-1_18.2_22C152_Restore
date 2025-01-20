@interface WBSUserDefinedContentBlockerManager
- (BOOL)didLoadGlobalContentBlockerActions;
- (BOOL)hasContentBlockerWithActions;
- (NSArray)cachedGlobalContentBlockerActions;
- (WBSUserDefinedContentBlockerManager)initWithDataStore:(id)a3;
- (id)_identifierStringForContentBlocker:(id)a3;
- (id)_jsonStringForActionType:(id)a3 urlFilter:(id)a4 selectors:(id)a5;
- (id)_rulesJsonForContentBlocker:(id)a3;
- (void)_notifyDidUpdateAllRules;
- (void)_regenerateCachedGlobalContentBlockerActionsFromDatabase;
- (void)_setCachedGlobalContentBlockerActions:(id)a3;
- (void)addActions:(id)a3 forContentBlocker:(id)a4;
- (void)addUserDefinedContentBlockerObserver:(id)a3;
- (void)contentBlockerForHost:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteActions:(id)a3;
- (void)deleteActionsForContentBlocker:(id)a3;
- (void)getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 isGlobal:(BOOL)a5 completion:(id)a6;
- (void)getAllContentBlockerHostsWithCompletionHandler:(id)a3;
- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3;
- (void)getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3;
- (void)globalContentBlockerWithCompletionHandler:(id)a3;
- (void)loadContentBlockerIfNeededForHost:(id)a3 loaderBlock:(id)a4;
- (void)removeUserDefinedContentBlockerObserver:(id)a3;
- (void)resetDatabaseWithCompletionHandler:(id)a3;
- (void)resetLoadingStateOfContentBlockerForHost:(id)a3;
- (void)updateContentBlockerActionExtraAttributes:(id)a3;
@end

@implementation WBSUserDefinedContentBlockerManager

uint64_t __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void __57__WBSUserDefinedContentBlockerManager_initWithDataStore___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[41] = a2 != 0;
    if (a2)
    {
      v4 = WeakRetained;
      [WeakRetained _notifyDidUpdateAllRules];
      WeakRetained = v4;
    }
  }
}

void __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5C9E160;
  id v4 = *(id *)(a1 + 32);
  int v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

- (WBSUserDefinedContentBlockerManager)initWithDataStore:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSUserDefinedContentBlockerManager;
  v6 = [(WBSUserDefinedContentBlockerManager *)&v16 init];
  if (v6)
  {
    objc_initWeak(&location, v6);
    objc_storeStrong((id *)&v6->_dataStore, a3);
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    hostsWithLoadedPerSiteContentBlockers = v6->_hostsWithLoadedPerSiteContentBlockers;
    v6->_hostsWithLoadedPerSiteContentBlockers = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v9;

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__WBSUserDefinedContentBlockerManager_initWithDataStore___block_invoke;
    v13[3] = &unk_1E5C9E0C0;
    objc_copyWeak(&v14, &location);
    [(WBSUserDefinedContentBlockerManager *)v6 getNumberOfContentBlockersThatContainActionsWithCompletionHandler:v13];
    v11 = v6;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__WBSUserDefinedContentBlockerManager_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C9E188;
  id v8 = v4;
  id v6 = v4;
  [(WBSUserDefinedContentBlockerSQLiteStore *)dataStore getNumberOfContentBlockersThatContainActionsWithCompletionHandler:v7];
}

- (id)_rulesJsonForContentBlocker:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v29 = v4;
  id v6 = [v4 actions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v12 = [v11 typeString];
        v13 = [v5 objectForKeyedSubscript:v12];

        if (v13)
        {
          [v13 appendString:@", "];
        }
        else
        {
          v13 = [MEMORY[0x1E4F28E78] string];
        }
        id v14 = [v11 selector];
        [v13 appendString:v14];

        v15 = [v11 typeString];
        [v5 setObject:v13 forKeyedSubscript:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }

  objc_super v16 = (void *)[@"[" mutableCopy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v17 = [v5 allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    char v21 = 1;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        if ((v21 & 1) == 0) {
          [v16 appendString:@","];
        }
        v24 = [v29 host];
        v25 = [v5 objectForKeyedSubscript:v23];
        v26 = [(WBSUserDefinedContentBlockerManager *)self _jsonStringForActionType:v23 urlFilter:v24 selectors:v25];
        [v16 appendString:v26];

        char v21 = 0;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      char v21 = 0;
    }
    while (v19);
  }

  [v16 appendString:@"]"];
  v27 = (void *)[v16 copy];

  return v27;
}

- (id)_jsonStringForActionType:(id)a3 urlFilter:(id)a4 selectors:(id)a5
{
  return (id)[NSString stringWithFormat:@"{ \"trigger\": { \"url-filter\": \"%@\"}, \"action\": {\"type\": \"%@\", \"selector\": \"%@\" } }", a4, a3, a5];
}

- (id)_identifierStringForContentBlocker:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  id v5 = NSString;
  if (v4 == 1)
  {
    id v6 = [NSString stringWithFormat:@"com.apple.Safari.UserGeneratedContentBlockers.%@", @"Global"];
  }
  else
  {
    uint64_t v7 = [v3 host];
    id v6 = [v5 stringWithFormat:@"com.apple.Safari.UserGeneratedContentBlockers.%@", v7];
  }
  return v6;
}

- (void)loadContentBlockerIfNeededForHost:(id)a3 loaderBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_hasContentBlockerWithActions
    && [v6 length]
    && ([(NSMutableSet *)self->_hostsWithLoadedPerSiteContentBlockers containsObject:v6] & 1) == 0)
  {
    [(NSMutableSet *)self->_hostsWithLoadedPerSiteContentBlockers addObject:v6];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke;
    v8[3] = &unk_1E5C9E110;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    id v9 = v6;
    [(WBSUserDefinedContentBlockerManager *)self contentBlockerForHost:v9 createIfNeeded:0 completionHandler:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke_2;
  v5[3] = &unk_1E5C9E0E8;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v8 = a1[5];
  id v7 = a1[4];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __85__WBSUserDefinedContentBlockerManager_loadContentBlockerIfNeededForHost_loaderBlock___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v6 = WeakRetained;
      uint64_t v4 = [v3 databaseID];
      WeakRetained = v6;
      if (v4)
      {
        uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        WeakRetained = v6;
        if (v5 == 1)
        {
          [v6[2] removeObject:*(void *)(a1 + 40)];
          WeakRetained = v6;
        }
      }
    }
  }
}

- (void)resetLoadingStateOfContentBlockerForHost:(id)a3
{
}

- (void)contentBlockerForHost:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    dataStore = self->_dataStore;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke;
    v11[3] = &unk_1E5C9E138;
    id v12 = v9;
    [(WBSUserDefinedContentBlockerSQLiteStore *)dataStore getPerSiteContentBlockerForHost:v8 createIfNeeded:v6 completionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C8DDF0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __94__WBSUserDefinedContentBlockerManager_contentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)globalContentBlockerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C9E138;
  id v8 = v4;
  id v6 = v4;
  [(WBSUserDefinedContentBlockerSQLiteStore *)dataStore getGlobalContentBlockerWithCompletionHandler:v7];
}

void __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5C8DDF0;
    id v4 = &v8;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_cold_1();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_26;
    v9[3] = &unk_1E5C8CDC8;
    id v4 = &v10;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getAllContentBlockerHostsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CCC0;
  id v8 = v4;
  id v6 = v4;
  [(WBSUserDefinedContentBlockerSQLiteStore *)dataStore getAllContentBlockerHostsWithCompletionHandler:v7];
}

void __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5C8DDF0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __86__WBSUserDefinedContentBlockerManager_getAllContentBlockerHostsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addActions:(id)a3 forContentBlocker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 databaseID])
  {
    if ([v6 count])
    {
      -[WBSUserDefinedContentBlockerSQLiteStore insertActions:forContentBlockerID:](self->_dataStore, "insertActions:forContentBlockerID:", v6, [v7 databaseID]);
      self->_hasContentBlockerWithActions = 1;
      if ([v7 databaseID] == 1) {
        [(WBSUserDefinedContentBlockerManager *)self _regenerateCachedGlobalContentBlockerActionsFromDatabase];
      }
    }
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSUserDefinedContentBlockerManager addActions:forContentBlocker:]();
    }
  }
}

- (void)updateContentBlockerActionExtraAttributes:(id)a3
{
}

- (void)deleteActionsForContentBlocker:(id)a3
{
  id v4 = a3;
  if ([v4 databaseID])
  {
    -[WBSUserDefinedContentBlockerSQLiteStore deleteActionsForContentBlockerID:](self->_dataStore, "deleteActionsForContentBlockerID:", [v4 databaseID]);
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSUserDefinedContentBlockerManager deleteActionsForContentBlocker:]();
    }
  }
}

- (void)getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 isGlobal:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  dataStore = self->_dataStore;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_isGlobal_completion___block_invoke;
  v13[3] = &unk_1E5C8CCC0;
  id v14 = v10;
  id v12 = v10;
  [(WBSUserDefinedContentBlockerSQLiteStore *)dataStore getAllContentBlockerActionsWithType:a3 excludeHost:a4 isGlobal:v6 completion:v13];
}

void __107__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_isGlobal_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __107__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_isGlobal_completion___block_invoke_2;
  v6[3] = &unk_1E5C8DDF0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __107__WBSUserDefinedContentBlockerManager_getAllContentBlockerActionsWithType_excludeHost_isGlobal_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_setCachedGlobalContentBlockerActions:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  cachedGlobalContentBlockerActions = self->_cachedGlobalContentBlockerActions;
  self->_cachedGlobalContentBlockerActions = v4;

  self->_didLoadGlobalContentBlockerActions = 1;
}

- (void)_regenerateCachedGlobalContentBlockerActionsFromDatabase
{
  cachedGlobalContentBlockerActions = self->_cachedGlobalContentBlockerActions;
  self->_cachedGlobalContentBlockerActions = 0;

  self->_didLoadGlobalContentBlockerActions = 0;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__WBSUserDefinedContentBlockerManager__regenerateCachedGlobalContentBlockerActionsFromDatabase__block_invoke;
  v4[3] = &unk_1E5C9E1B0;
  objc_copyWeak(&v5, &location);
  [(WBSUserDefinedContentBlockerManager *)self getGlobalContentBlockerWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __95__WBSUserDefinedContentBlockerManager__regenerateCachedGlobalContentBlockerActionsFromDatabase__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C9E1D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WBSUserDefinedContentBlockerSQLiteStore *)dataStore getGlobalContentBlockerWithCompletionHandler:v7];
}

void __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5C8C8F8;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__WBSUserDefinedContentBlockerManager_getGlobalContentBlockerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) actions];
  [v2 _setCachedGlobalContentBlockerActions:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

- (void)deleteActions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(WBSUserDefinedContentBlockerSQLiteStore *)self->_dataStore deleteActions:v4];
    if (objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_84)) {
      [(WBSUserDefinedContentBlockerManager *)self _regenerateCachedGlobalContentBlockerActionsFromDatabase];
    }
  }
}

uint64_t __53__WBSUserDefinedContentBlockerManager_deleteActions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isGlobal];
}

- (void)resetDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C9E248;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(WBSUserDefinedContentBlockerSQLiteStore *)dataStore resetDatabaseWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5C9E220;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __74__WBSUserDefinedContentBlockerManager_resetDatabaseWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained[2] removeAllObjects];
    id v2 = WeakRetained[3];
    WeakRetained[3] = (id)MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_notifyDidUpdateAllRules
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "userDefinedContentBlockerManagerDidUpdateAllRules:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addUserDefinedContentBlockerObserver:(id)a3
{
}

- (void)removeUserDefinedContentBlockerObserver:(id)a3
{
}

- (BOOL)didLoadGlobalContentBlockerActions
{
  return self->_didLoadGlobalContentBlockerActions;
}

- (BOOL)hasContentBlockerWithActions
{
  return self->_hasContentBlockerWithActions;
}

- (NSArray)cachedGlobalContentBlockerActions
{
  return self->_cachedGlobalContentBlockerActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedGlobalContentBlockerActions, 0);
  objc_storeStrong((id *)&self->_hostsWithLoadedPerSiteContentBlockers, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

void __81__WBSUserDefinedContentBlockerManager_globalContentBlockerWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Could not get Global content blocker.", v2, v3, v4, v5, v6);
}

- (void)addActions:forContentBlocker:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Aborted adding actions to non-existent content blocker id.", v2, v3, v4, v5, v6);
}

- (void)deleteActionsForContentBlocker:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Aborted deleting actions from non-existent content blocker id.", v2, v3, v4, v5, v6);
}

@end