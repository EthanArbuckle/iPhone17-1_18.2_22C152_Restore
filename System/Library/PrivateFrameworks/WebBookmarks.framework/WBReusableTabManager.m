@interface WBReusableTabManager
+ (WBReusableTabManager)sharedManager;
- (BOOL)isTabSuspended:(id)a3;
- (NSSet)allGroupsTabsUUIDs;
- (WBReusableTabManager)init;
- (id)referenceToTabWithUUID:(id)a3;
- (id)reuseTabForUUID:(id)a3;
- (id)tabGroupManager;
- (id)windowStates;
- (void)_addTabUUIDsFromGroup:(id)a3 toSet:(id)a4;
- (void)_cleanUp;
- (void)_scheduleCleanup;
- (void)addReusableTab:(id)a3;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)enumerateReusableTabs:(id)a3;
- (void)removeReusableTabWithUUID:(id)a3;
- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4;
@end

@implementation WBReusableTabManager

+ (WBReusableTabManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WBReusableTabManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBReusableTabManager sharedManager]::onceToken != -1) {
    dispatch_once(&+[WBReusableTabManager sharedManager]::onceToken, block);
  }
  v2 = (void *)+[WBReusableTabManager sharedManager]::sharedManager;
  return (WBReusableTabManager *)v2;
}

uint64_t __37__WBReusableTabManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = +[WBReusableTabManager sharedManager]::sharedManager;
  +[WBReusableTabManager sharedManager]::sharedManager = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (WBReusableTabManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBReusableTabManager;
  uint64_t v2 = [(WBReusableTabManager *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    uuidToTabCache = v2->_uuidToTabCache;
    v2->_uuidToTabCache = v3;

    [(NSCache *)v2->_uuidToTabCache setCountLimit:100];
    [(NSCache *)v2->_uuidToTabCache setDelegate:v2];
    v5 = [(WBReusableTabManager *)v2 tabGroupManager];
    [v5 addTabGroupObserver:v2];
    v6 = v2;
  }
  return v2;
}

- (void)addReusableTab:(id)a3
{
  id v7 = a3;
  v4 = [[WBReusableTabEntry alloc] initWithReusableTab:v7];
  uuidToTabCache = self->_uuidToTabCache;
  v6 = [v7 uuid];
  [(NSCache *)uuidToTabCache setObject:v4 forKey:v6];

  [(WBReusableTabManager *)self _scheduleCleanup];
}

- (void)removeReusableTabWithUUID:(id)a3
{
}

- (id)reuseTabForUUID:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_uuidToTabCache objectForKey:v4];
  self->_reusing = 1;
  [(NSCache *)self->_uuidToTabCache removeObjectForKey:v4];
  self->_reusing = 0;
  v6 = [v5 reusableTab];

  return v6;
}

- (id)referenceToTabWithUUID:(id)a3
{
  v3 = [(NSCache *)self->_uuidToTabCache objectForKey:a3];
  id v4 = [v3 reusableTab];

  return v4;
}

- (BOOL)isTabSuspended:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uuidToTabCache = self->_uuidToTabCache;
    id v7 = [v4 uuid];
    objc_super v8 = [(NSCache *)uuidToTabCache objectForKey:v7];
    v9 = [v8 reusableTab];
    BOOL v10 = v9 == v5;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_scheduleCleanup
{
  if (self->_cleanupTimer)
  {
    self->_pendingCleanup = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA20];
    id v4 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    [v4 floatForKey:@"reusableTabManagerCleanupDelaySeconds"];
    if (v5 == 0.0) {
      double v6 = 600.0;
    }
    else {
      double v6 = v5;
    }

    id v7 = [v3 scheduledTimerWithTimeInterval:self target:sel__cleanUp selector:0 userInfo:0 repeats:v6];
    cleanupTimer = self->_cleanupTimer;
    self->_cleanupTimer = v7;
    MEMORY[0x270F9A758](v7, cleanupTimer);
  }
}

- (void)_cleanUp
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0;

  v23 = self;
  id v4 = [(WBReusableTabManager *)self allGroupsTabsUUIDs];
  float v5 = [(NSCache *)v23->_uuidToTabCache allObjects];
  double v6 = (void *)[v5 copy];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v11 = [v10 reusableTab];
        v12 = [v11 uuid];
        unsigned __int8 v13 = [v4 containsObject:v12];

        v14 = [v10 dateCreated];
        [v14 timeIntervalSinceNow];
        double v16 = v15;
        v17 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
        [v17 floatForKey:@"reusableTabManagerMaxAgeSeconds"];
        if (v18 == 0.0) {
          double v19 = 3600.0;
        }
        else {
          double v19 = v18;
        }

        if (((v19 >= -v16) & v13) == 0)
        {
          uuidToTabCache = v23->_uuidToTabCache;
          v21 = [v10 reusableTab];
          v22 = [v21 uuid];
          [(NSCache *)uuidToTabCache removeObjectForKey:v22];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  if (v23->_pendingCleanup)
  {
    v23->_pendingCleanup = 0;
    [(WBReusableTabManager *)v23 _scheduleCleanup];
  }
}

- (NSSet)allGroupsTabsUUIDs
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(WBReusableTabManager *)self tabGroupManager];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  float v5 = [v4 allNamedTabGroupsUnsorted];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        [(WBReusableTabManager *)self _addTabUUIDsFromGroup:*(void *)(*((void *)&v20 + 1) + 8 * i) toSet:v3];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = [(WBReusableTabManager *)self windowStates];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        unsigned __int8 v13 = [*(id *)(*((void *)&v16 + 1) + 8 * j) localTabGroup];
        [(WBReusableTabManager *)self _addTabUUIDsFromGroup:v13 toSet:v3];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }

  v14 = (void *)[v3 copy];
  return (NSSet *)v14;
}

- (void)_addTabUUIDsFromGroup:(id)a3 toSet:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(a3, "tabs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = objc_alloc(MEMORY[0x263F08C38]);
        v12 = [v10 uuid];
        unsigned __int8 v13 = (void *)[v11 initWithUUIDString:v12];
        [v5 addObject:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)windowStates
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)tabGroupManager
{
  return 0;
}

- (void)enumerateReusableTabs:(id)a3
{
  id v4 = a3;
  id v5 = [(NSCache *)self->_uuidToTabCache allObjects];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WBReusableTabManager_enumerateReusableTabs___block_invoke;
  v7[3] = &unk_2643DBBA8;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __46__WBReusableTabManager_enumerateReusableTabs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 reusableTab];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  [(NSTimer *)self->_cleanupTimer invalidate];
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0;

  [(WBReusableTabManager *)self _cleanUp];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5 = a4;
  if (!self->_reusing)
  {
    id v7 = v5;
    id v6 = [v5 reusableTab];
    [v6 evictFromTabReuse];

    id v5 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_uuidToTabCache, 0);
}

@end