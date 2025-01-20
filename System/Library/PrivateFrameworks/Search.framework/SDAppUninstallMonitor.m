@interface SDAppUninstallMonitor
+ (BOOL)_writePendingPurgesToDisk:(id)a3;
+ (id)_filename;
+ (id)_installedAppsBundleIDsListFilePath;
+ (id)_installedAppsListFromDisk;
+ (id)_pendingPurgesFilePath;
+ (id)_pendingPurgesFromDisk;
+ (id)_trackingInfoDir;
+ (id)applicationsExcludedFromUninstall;
+ (id)sharedInstance;
+ (void)_installedAppsListFromDisk;
+ (void)_pendingPurgesFromDisk;
+ (void)_writeAppsListToDisk:(id)a3;
- (BOOL)hasFailedDeletes;
- (BOOL)unlocked;
- (NSMutableSet)pcsForPendingPurges;
- (NSSet)allAppSet;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (SDAppUninstallMonitor)init;
- (id)_allInstalledApplicationsIdentifiers;
- (id)_deleteAllItemsForBundleID:(id)a3;
- (void)_deleteAllInteractionsForBundleID:(id)a3;
- (void)_deleteAllItemsForBundleIDs:(id)a3 completionBlock:(id)a4;
- (void)_deleteItemsForUninstalledAppsFromIndex;
- (void)_purgeWithProtectionClasses:(id)a3 completion:(id)a4;
- (void)ready;
- (void)registerHandlerWithEventMonitor:(id)a3;
- (void)setAllAppSet:(id)a3;
- (void)setHasFailedDeletes:(BOOL)a3;
- (void)setPcsForPendingPurges:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUnlocked:(BOOL)a3;
- (void)unlock;
@end

@implementation SDAppUninstallMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sSDAppUninstallMonitor;

  return v2;
}

uint64_t __39__SDAppUninstallMonitor_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sSDAppUninstallMonitor;
  sSDAppUninstallMonitor = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)applicationsExcludedFromUninstall
{
  if (applicationsExcludedFromUninstall_onceToken != -1) {
    dispatch_once(&applicationsExcludedFromUninstall_onceToken, &__block_literal_global_87);
  }
  v2 = (void *)applicationsExcludedFromUninstall_sSet;

  return v2;
}

uint64_t __58__SDAppUninstallMonitor_applicationsExcludedFromUninstall__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CF8F1B8];
  uint64_t v1 = applicationsExcludedFromUninstall_sSet;
  applicationsExcludedFromUninstall_sSet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (SDAppUninstallMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)SDAppUninstallMonitor;
  v2 = [(SDAppUninstallMonitor *)&v12 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    startupSemaphore = v2->_startupSemaphore;
    v2->_startupSemaphore = (OS_dispatch_semaphore *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.searchd.appUninstallMonitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    pcsForPendingPurges = v2->_pcsForPendingPurges;
    v2->_pcsForPendingPurges = (NSMutableSet *)v9;
  }
  return v2;
}

- (void)ready
{
}

- (void)unlock
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SDAppUninstallMonitor_unlock__block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__SDAppUninstallMonitor_unlock__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v3);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 16))
  {
    if (*(unsigned char *)(v4 + 17))
    {
      *(unsigned char *)(v4 + 17) = 0;
LABEL_12:
      [*(id *)(a1 + 32) _deleteItemsForUninstalledAppsFromIndex];
      return;
    }
    if (!*(void *)(v4 + 32) && [*(id *)(v4 + 40) count]) {
      goto LABEL_12;
    }
  }
  else
  {
    *(unsigned char *)(v4 + 16) = 1;
    v5 = [MEMORY[0x263F78CB8] sharedLockHandler];
    int v6 = [v5 migrationComplete];

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    dispatch_queue_t v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "";
      if (v6) {
        v8 = " (purge)";
      }
      int v9 = 136315138;
      v10 = v8;
      _os_log_impl(&dword_21E5D7000, v7, OS_LOG_TYPE_DEFAULT, "### Uninstall monitor unlock%s", (uint8_t *)&v9, 0xCu);
    }

    if (v6) {
      goto LABEL_12;
    }
  }
}

- (void)registerHandlerWithEventMonitor:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[SDAppUninstallMonitor registerHandlerWithEventMonitor:]();
  }
  v5 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke;
  v7[3] = &unk_2644B2B68;
  v7[4] = self;
  int v6 = (void *)MEMORY[0x223C2C030](v7);
  [v5 registerHandler:v6 forEventName:@"com.apple.LaunchServices.applicationUnregistered"];
}

void __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_error_impl(&dword_21E5D7000, v11, OS_LOG_TYPE_ERROR, "Error in event monitor for name:\"%@\", userInfo:%@, error:%@", buf, 0x20u);
    }
  }
  else
  {
    objc_super v12 = [v9 objectForKeyedSubscript:@"bundleIDs"];
    v13 = [v9 objectForKeyedSubscript:@"isPlaceholder"];
    [v13 BOOLValue];

    v14 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_21E5D7000, v14, OS_LOG_TYPE_DEFAULT, "Received a notification for name:\"%@\", userInfo:%@, bundleIDs:%@", buf, 0x20u);
    }

    SPBuildApplications(0);
    v15 = SPTransactionCreate(&unk_26CF8F1D0);
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_123;
    block[3] = &unk_2644B2B40;
    block[4] = v16;
    id v20 = v12;
    id v21 = v15;
    id v18 = v15;
    uint64_t v11 = v12;
    dispatch_async(v17, block);
  }
}

void __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_123(uint64_t a1)
{
  dispatch_time_t v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_2;
  v6[3] = &unk_2644B2B18;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v3 _deleteAllItemsForBundleIDs:v4 completionBlock:v6];
}

void __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_21E5D7000, v4, OS_LOG_TYPE_DEFAULT, "_deleteAllItemsForBundleIDs:%@", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [*(id *)(a1 + 40) _allInstalledApplicationsIdentifiers];
  if ([v3 count])
  {
    id v7 = (void *)[v6 mutableCopy];
    [v7 addObjectsFromArray:v3];

    int v6 = v7;
  }
  [(id)objc_opt_class() _writeAppsListToDisk:v6];
  SPTransactionDone(*(void **)(a1 + 48));
}

- (void)_deleteItemsForUninstalledAppsFromIndex
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E5D7000, v3, OS_LOG_TYPE_DEFAULT, "_deleteItemsForUninstalledAppsFromIndex", buf, 2u);
  }

  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = [(SDAppUninstallMonitor *)self _allInstalledApplicationsIdentifiers];
  int v6 = (void *)[v5 mutableCopy];

  id v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v26 = v6;
    _os_log_impl(&dword_21E5D7000, v7, v8, "installedApps: %@", buf, 0xCu);
  }

  if ([v6 count])
  {
    uint64_t v9 = [(id)objc_opt_class() _installedAppsBundleIDsListFilePath];
    if ([v4 fileExistsAtPath:v9])
    {
      uint64_t v10 = [(id)objc_opt_class() _installedAppsListFromDisk];
      uint64_t v11 = SPLogForSPLogCategoryDefault();
      os_log_type_t v12 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v26 = v10;
        _os_log_impl(&dword_21E5D7000, v11, v12, "previouslyInstalledApps: %@", buf, 0xCu);
      }

      if (v10)
      {
        v13 = [MEMORY[0x263EFF9C0] setWithArray:v10];
        v14 = [MEMORY[0x263EFFA08] setWithArray:v6];
        [v13 minusSet:v14];

        v15 = SPLogForSPLogCategoryDefault();
        os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v26 = v13;
          _os_log_impl(&dword_21E5D7000, v15, v16, "uninstalledApps: %@", buf, 0xCu);
        }

        if ([v13 count])
        {
          v17 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v13 allObjects];
            *(_DWORD *)buf = 138412290;
            __int16 v26 = v18;
            _os_log_impl(&dword_21E5D7000, v17, OS_LOG_TYPE_DEFAULT, "_deleteItemsForUninstalledAppsFromIndex: %@", buf, 0xCu);
          }
          v19 = [v13 allObjects];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __64__SDAppUninstallMonitor__deleteItemsForUninstalledAppsFromIndex__block_invoke;
          v22[3] = &unk_2644B2808;
          id v23 = v6;
          __int16 v24 = self;
          [(SDAppUninstallMonitor *)self _deleteAllItemsForBundleIDs:v19 completionBlock:v22];
        }
      }
    }
    else
    {
      id v20 = SPLogForSPLogCategoryDefault();
      os_log_type_t v21 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v26 = v6;
        _os_log_impl(&dword_21E5D7000, v20, v21, "Writing %@ to disk for the first time", buf, 0xCu);
      }

      [(id)objc_opt_class() _writeAppsListToDisk:v6];
    }
  }
  else
  {
    uint64_t v9 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E5D7000, v9, OS_LOG_TYPE_DEFAULT, "Skipping _deleteItemsForUninstalledAppsFromIndex; no installed apps",
        buf,
        2u);
    }
  }
}

void __64__SDAppUninstallMonitor__deleteItemsForUninstalledAppsFromIndex__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
  [(id)objc_opt_class() _writeAppsListToDisk:*(void *)(a1 + 32)];
}

- (id)_deleteAllItemsForBundleID:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v4;
    _os_log_impl(&dword_21E5D7000, v5, OS_LOG_TYPE_DEFAULT, "Deleting all items for bundleID:%@", buf, 0xCu);
  }

  int v6 = [MEMORY[0x263F78CC8] allProtectionClasses];
  id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v7 = objc_alloc_init(MEMORY[0x263F78CB0]);
  os_log_type_t v8 = [MEMORY[0x263F78CC8] sharedInstance];
  [v7 setIndexer:v8];

  [v7 setClientBundleID:v4];
  [v7 setIsInternal:1];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v14 = dispatch_group_create();
        dispatch_group_enter(v14);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke;
        v23[3] = &unk_2644B2BB8;
        id v15 = v4;
        id v16 = v4;
        id v24 = v16;
        uint64_t v25 = v13;
        id v26 = v22;
        id v17 = v7;
        id v27 = v17;
        uint64_t v28 = v14;
        id v18 = v14;
        id v19 = v16;
        id v4 = v15;
        [v17 deleteAllSearchableItemsWithBundleID:v19 protectionClass:v13 shouldGC:0 completionHandler:v23];
        dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  return v22;
}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SPLogForSPLogCategoryDefault();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_impl(&dword_21E5D7000, v5, OS_LOG_TYPE_DEFAULT, "Deleted all items for bundleID:%@, protectionClass:%@", buf, 0x16u);
  }

  os_log_type_t v8 = [NSNumber numberWithBool:v3 == 0];
  [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v9 = *(void **)(a1 + 56);
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_131;
  v14[3] = &unk_2644B2B90;
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 40);
  id v15 = v12;
  uint64_t v16 = v13;
  id v17 = *(id *)(a1 + 64);
  [v9 deleteAllInteractionsWithBundleID:v12 protectionClass:v11 options:0 completionHandler:v14];
}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_131_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_deleteAllInteractionsForBundleID:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl(&dword_21E5D7000, v5, OS_LOG_TYPE_DEFAULT, "Deleting all interactions for bundleID:%@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263F78CC8] allProtectionClasses];
  id v7 = objc_alloc_init(MEMORY[0x263F78CB0]);
  os_log_type_t v8 = [MEMORY[0x263F78CC8] sharedInstance];
  [v7 setIndexer:v8];

  [v7 setClientBundleID:v4];
  [v7 setIsInternal:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
        v14 = dispatch_group_create();
        dispatch_group_enter(v14);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __59__SDAppUninstallMonitor__deleteAllInteractionsForBundleID___block_invoke;
        v18[3] = &unk_2644B2B90;
        id v15 = v4;
        id v19 = v15;
        uint64_t v20 = v13;
        uint64_t v21 = v14;
        uint64_t v16 = v14;
        [v7 deleteAllInteractionsWithBundleID:v15 protectionClass:v13 options:0 completionHandler:v18];
        dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

void __59__SDAppUninstallMonitor__deleteAllInteractionsForBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_131_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_purgeWithProtectionClasses:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v20 = self;
  id v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  os_log_type_t v8 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v14 = SPLogForSPLogCategoryIndex();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = v13;
          _os_log_impl(&dword_21E5D7000, v14, OS_LOG_TYPE_DEFAULT, "Merging the index for dataclass:%@", buf, 0xCu);
        }

        id v15 = [MEMORY[0x263F78CC8] sharedInstance];
        uint64_t v33 = v13;
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke;
        v26[3] = &unk_2644B2BE0;
        v26[4] = v13;
        id v27 = v7;
        id v28 = v8;
        [v15 mergeWithProtectionClasses:v16 completionHandler:v26];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v10);
  }

  queue = v20->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_138;
  block[3] = &unk_2644B2A78;
  id v24 = v7;
  id v25 = v21;
  id v18 = v7;
  id v19 = v21;
  dispatch_group_notify(v8, queue, block);
}

void __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  int v4 = [v3 BOOLValue];

  uint64_t v5 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "NO";
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4) {
      id v6 = "YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v7;
    __int16 v19 = 2080;
    uint64_t v20 = v6;
    _os_log_impl(&dword_21E5D7000, v5, OS_LOG_TYPE_DEFAULT, "Finished merging the index for dataclass:%@, merged:%s", buf, 0x16u);
  }

  [*(id *)(a1 + 40) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*(void *)(a1 + 32)];
  if (v4)
  {
    os_log_type_t v8 = SPLogForSPLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v9;
      _os_log_impl(&dword_21E5D7000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up the index for dataclass:%@", buf, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x263F78CC8] sharedInstance];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_136;
    v13[3] = &unk_2644B2BE0;
    uint64_t v12 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v12;
    id v15 = *(id *)(a1 + 48);
    [v10 cleanupStringsWithProtectionClasses:v11 completionHandler:v13];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_136(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 BOOLValue];

  uint64_t v5 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "NO";
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4) {
      id v6 = "YES";
    }
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_21E5D7000, v5, OS_LOG_TYPE_DEFAULT, "Finished cleaning up strings for dataclass:%@, done:%s", (uint8_t *)&v9, 0x16u);
  }

  os_log_type_t v8 = [NSNumber numberWithBool:v4];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)_pendingPurgesFilePath
{
  v2 = [@"PendingPurges" stringByAppendingString:@".plist"];
  id v3 = [(id)objc_opt_class() _trackingInfoDir];
  uint64_t v4 = [v3 stringByAppendingPathComponent:v2];

  return v4;
}

+ (id)_pendingPurgesFromDisk
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v4 = [a1 _pendingPurgesFilePath];
  if (!v4) {
    goto LABEL_24;
  }
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  if (([v5 fileExistsAtPath:v4] & 1) == 0)
  {

    goto LABEL_24;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v4];

  if (!v6) {
    goto LABEL_24;
  }
  id v22 = 0;
  uint64_t v7 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v22];
  id v17 = v22;
  if (!v7)
  {
    uint64_t v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SDAppUninstallMonitor _pendingPurgesFromDisk]();
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    os_log_type_t v8 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SDAppUninstallMonitor _pendingPurgesFromDisk]();
    }

LABEL_12:
    uint64_t v7 = 0;
  }
  int v9 = [MEMORY[0x263F78CC8] allProtectionClasses];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 containsObject:v15]) {
          [v3 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }

LABEL_24:

  return v3;
}

+ (BOOL)_writePendingPurgesToDisk:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [a1 _trackingInfoDir];
  uint64_t v7 = [a1 _pendingPurgesFilePath];
  if ([v4 count])
  {
    if ([v5 fileExistsAtPath:v6])
    {
      id v8 = 0;
      goto LABEL_6;
    }
    id v23 = 0;
    char v10 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v11 = v23;
    id v8 = v11;
    if (v10)
    {
LABEL_6:
      uint64_t v12 = (void *)MEMORY[0x263F08AC0];
      uint64_t v13 = [v4 allObjects];
      id v22 = 0;
      id v14 = [v12 dataWithPropertyList:v13 format:200 options:0 error:&v22];
      id v15 = v22;

      if (v14)
      {
        id v21 = v15;
        char v16 = [v14 writeToFile:v7 options:1073741825 error:&v21];
        id v8 = v21;

        if (v16)
        {
          BOOL v9 = 1;
LABEL_22:

          goto LABEL_23;
        }
        id v17 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v25 = v14;
          __int16 v26 = 2112;
          id v27 = v7;
          __int16 v28 = 2112;
          id v29 = v8;
          _os_log_error_impl(&dword_21E5D7000, v17, OS_LOG_TYPE_ERROR, "Failed writing data %@ to path %@: %@", buf, 0x20u);
        }
        id v15 = v8;
      }
      else
      {
        id v17 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[SDAppUninstallMonitor _writePendingPurgesToDisk:]((uint64_t)v15, v17);
        }
      }

      BOOL v9 = 0;
      id v8 = v15;
      goto LABEL_22;
    }
    long long v18 = [v11 domain];
    if ([v18 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v19 = [v8 code];

      if (v19 == 516) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    id v14 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SDAppUninstallMonitor _writePendingPurgesToDisk:]();
    }
    BOOL v9 = 0;
    goto LABEL_22;
  }
  [v5 removeItemAtPath:v7 error:0];
  BOOL v9 = 1;
LABEL_23:

  return v9;
}

- (void)_deleteAllItemsForBundleIDs:(id)a3 completionBlock:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v38 = (void (**)(void, void))v6;
  if (!v6) {
    -[SDAppUninstallMonitor _deleteAllItemsForBundleIDs:completionBlock:]();
  }
  v44 = self;
  uint64_t v7 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    pcsForPendingPurges = self->_pcsForPendingPurges;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = pcsForPendingPurges;
    _os_log_impl(&dword_21E5D7000, v7, OS_LOG_TYPE_DEFAULT, "Deleting all the items for bundleIDs:%@, pcs:%@", buf, 0x16u);
  }

  uint64_t v37 = SPTransactionCreate(&unk_26CF8F1E8);
  id v42 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  BOOL v9 = [(id)objc_opt_class() applicationsExcludedFromUninstall];
  id v43 = (id)objc_opt_new();
  if (v39) {
    id v10 = (id)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v39];
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  id v11 = v10;
  [v10 minusSet:v9];
  SPRemoveAppsFromDisabledLists(v11);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        char v16 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v15;
          _os_log_impl(&dword_21E5D7000, v16, OS_LOG_TYPE_DEFAULT, "Special case bundleID:%@ since it's excluded from uninstall", buf, 0xCu);
        }

        [(SDAppUninstallMonitor *)v44 _deleteAllInteractionsForBundleID:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v12);
  }

  long long v52 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  id v40 = v11;
  uint64_t v17 = [v40 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v50;
    uint64_t v19 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v40);
        }
        uint64_t v21 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        id v22 = [(SDAppUninstallMonitor *)v44 _deleteAllItemsForBundleID:v21];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v58) = 0;
        v46[0] = v19;
        v46[1] = 3221225472;
        v46[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke;
        v46[3] = &unk_2644B2C08;
        id v47 = v43;
        v48 = buf;
        [v22 enumerateKeysAndObjectsUsingBlock:v46];
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          [v42 addObject:v21];
        }

        _Block_object_dispose(buf, 8);
      }
      uint64_t v17 = [v40 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v17);
  }

  BOOL v23 = [v42 count] != 0;
  uint64_t v24 = v44->_pcsForPendingPurges;
  v44->_hasFailedDeletes = v23;
  [v43 unionSet:v24];
  id v25 = [(id)objc_opt_class() _pendingPurgesFromDisk];
  [v43 unionSet:v25];
  objc_storeStrong((id *)&v44->_pcsForPendingPurges, v43);
  BOOL v26 = (([v43 isEqualToSet:v25] & 1) != 0
      || [(id)objc_opt_class() _writePendingPurgesToDisk:v43])
     && [v43 count] != 0;
  id v27 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = "YES";
    id v29 = v44->_pcsForPendingPurges;
    if (v44->_hasFailedDeletes) {
      uint64_t v30 = "YES";
    }
    else {
      uint64_t v30 = "NO";
    }
    *(_DWORD *)buf = 138413058;
    if (!v26) {
      __int16 v28 = "NO";
    }
    *(void *)&uint8_t buf[4] = v39;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2080;
    v58 = v28;
    __int16 v59 = 2112;
    v60 = v29;
    _os_log_impl(&dword_21E5D7000, v27, OS_LOG_TYPE_DEFAULT, "Finished deleting all items for bundleIDs:%@, hasFailedDeletes:%s, purge:%s, pcs:%@", buf, 0x2Au);
  }

  if (v26)
  {
    dispatch_time_t v31 = dispatch_time(0, 10000000000);
    timer = v44->_timer;
    if (timer)
    {
      dispatch_source_set_timer(timer, v31, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      dispatch_source_t v33 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v44->_queue);
      v34 = v44->_timer;
      v44->_timer = (OS_dispatch_source *)v33;

      uint64_t v35 = v44->_timer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_153;
      handler[3] = &unk_2644B2A50;
      handler[4] = v44;
      dispatch_source_set_event_handler(v35, handler);
      dispatch_source_set_timer((dispatch_source_t)v44->_timer, v31, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume((dispatch_object_t)v44->_timer);
    }
  }
  uint64_t v36 = [v42 allObjects];
  ((void (**)(void, void *))v38)[2](v38, v36);

  SPTransactionDone(v37);
}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_153(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  id v3 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v2;
    _os_log_impl(&dword_21E5D7000, v3, OS_LOG_TYPE_DEFAULT, "Purging, pcs:%@", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  id v5 = [v2 allObjects];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_154;
  v8[3] = &unk_2644B2C58;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v2;
  uint64_t v10 = v6;
  id v7 = v2;
  [v4 _purgeWithProtectionClasses:v5 completion:v8];
}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_154(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_2;
  v9[3] = &unk_2644B2C30;
  id v10 = *(id *)(a1 + 32);
  [a2 enumerateKeysAndObjectsUsingBlock:v9];
  [(id)objc_opt_class() _writePendingPurgesToDisk:*(void *)(a1 + 32)];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), *(id *)(a1 + 32));
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  if (v4)
  {
    dispatch_source_cancel(v4);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = 0;
  }
  id v7 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_21E5D7000, v7, OS_LOG_TYPE_DEFAULT, "Finished purging, pcs:%@", buf, 0xCu);
  }
}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 BOOLValue]) {
    [*(id *)(a1 + 32) removeObject:v5];
  }
}

+ (id)_filename
{
  return (id)[@"InstalledApps" stringByAppendingString:@".plist"];
}

+ (id)_trackingInfoDir
{
  if (_trackingInfoDir_onceToken != -1) {
    dispatch_once(&_trackingInfoDir_onceToken, &__block_literal_global_156);
  }
  id v2 = (void *)_trackingInfoDir_bundleInfoPath;

  return v2;
}

void __41__SDAppUninstallMonitor__trackingInfoDir__block_invoke()
{
  SPSpotlightSupportDirectoryPath();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"BundleInfo"];
  uint64_t v1 = (void *)_trackingInfoDir_bundleInfoPath;
  _trackingInfoDir_bundleInfoPath = v0;
}

+ (id)_installedAppsBundleIDsListFilePath
{
  id v3 = [(id)objc_opt_class() _trackingInfoDir];
  id v4 = [a1 _filename];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (id)_installedAppsListFromDisk
{
  id v2 = [a1 _installedAppsBundleIDsListFilePath];
  if (!v2) {
    goto LABEL_10;
  }
  id v3 = [MEMORY[0x263F08850] defaultManager];
  if (([v3 fileExistsAtPath:v2] & 1) == 0)
  {

    goto LABEL_10;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v2];

  if (!v4)
  {
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  id v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:&v11];
  id v6 = v11;
  if (!v5)
  {
    id v5 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SDAppUninstallMonitor _installedAppsListFromDisk]();
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SDAppUninstallMonitor _installedAppsListFromDisk]();
    }

LABEL_16:
    id v5 = 0;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  _sanitizePlistData(v5, v10);
  uint64_t v8 = [v10 allObjects];

LABEL_11:

  return v8;
}

+ (void)_writeAppsListToDisk:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_21E5D7000, v5, v6, "Will write %@ to disk", buf, 0xCu);
  }

  id v7 = [a1 _trackingInfoDir];
  uint64_t v8 = [a1 _installedAppsBundleIDsListFilePath];
  id v25 = 0;
  id v9 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:&v25];
  id v10 = v25;
  if (v9)
  {
    id v11 = [MEMORY[0x263F08850] defaultManager];
    char v12 = [v11 fileExistsAtPath:v7];

    if (v12) {
      goto LABEL_7;
    }
    uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
    id v24 = v10;
    char v14 = [v13 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v15 = v24;

    if (v14)
    {
LABEL_6:
      id v10 = v15;
LABEL_7:
      char v16 = v10;
      id v23 = v10;
      char v17 = [v9 writeToFile:v8 options:1 error:&v23];
      id v10 = v23;

      uint64_t v18 = SPLogForSPLogCategoryDefault();
      uint64_t v19 = v18;
      if (v17)
      {
        os_log_type_t v20 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v18, v20))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v4;
          _os_log_impl(&dword_21E5D7000, v19, v20, "Succesfully wrote %@ to disk", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v8;
        __int16 v30 = 2112;
        id v31 = v10;
        _os_log_error_impl(&dword_21E5D7000, v19, OS_LOG_TYPE_ERROR, "Error writing data %@ to path %@: %@", buf, 0x20u);
      }
      goto LABEL_21;
    }
    uint64_t v21 = [v15 domain];
    if ([v21 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v22 = [v15 code];

      if (v22 == 516) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    uint64_t v19 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[SDAppUninstallMonitor _writeAppsListToDisk:]();
    }
    id v10 = v15;
  }
  else
  {
    uint64_t v19 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[SDAppUninstallMonitor _writeAppsListToDisk:]((uint64_t)v10, v19);
    }
  }
LABEL_21:
}

- (id)_allInstalledApplicationsIdentifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_21E5D7000, v3, OS_LOG_TYPE_DEFAULT, "_allInstalledApplicationsIdentifiers", (uint8_t *)&v13, 2u);
  }

  id v4 = SPFastApplicationsGet();
  id v5 = (void *)MEMORY[0x263EFFA08];
  os_log_type_t v6 = [v4 allKeys];
  id v7 = [v5 setWithArray:v6];
  allAppSet = self->_allAppSet;
  self->_allAppSet = v7;

  id v9 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_allAppSet;
    int v13 = 138412290;
    char v14 = v10;
    _os_log_impl(&dword_21E5D7000, v9, OS_LOG_TYPE_DEFAULT, "_allInstalledApplicationsIdentifiers: %@", (uint8_t *)&v13, 0xCu);
  }

  id v11 = [(NSSet *)self->_allAppSet allObjects];

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)unlocked
{
  return self->_unlocked;
}

- (void)setUnlocked:(BOOL)a3
{
  self->_unlocked = a3;
}

- (BOOL)hasFailedDeletes
{
  return self->_hasFailedDeletes;
}

- (void)setHasFailedDeletes:(BOOL)a3
{
  self->_hasFailedDeletes = a3;
}

- (NSMutableSet)pcsForPendingPurges
{
  return self->_pcsForPendingPurges;
}

- (void)setPcsForPendingPurges:(id)a3
{
}

- (NSSet)allAppSet
{
  return self->_allAppSet;
}

- (void)setAllAppSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAppSet, 0);
  objc_storeStrong((id *)&self->_pcsForPendingPurges, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_startupSemaphore, 0);
}

- (void)registerHandlerWithEventMonitor:.cold.1()
{
}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_21E5D7000, v0, v1, "Failed to delete all items for bundleID:%@, protectionClass:%@, error:%@");
}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_131_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_21E5D7000, v0, v1, "Failed to delete all interactions for bundleID:%@, protectionClass:%@, error:%@");
}

+ (void)_pendingPurgesFromDisk
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_4_0(&dword_21E5D7000, v1, v2, "Property list isn't a NSArray, instead class:%@", v3, v4, v5, v6, 2u);
}

+ (void)_writePendingPurgesToDisk:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"PendingPurges";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21E5D7000, a2, OS_LOG_TYPE_ERROR, "Failed serializing %@ property list, error:%@", (uint8_t *)&v2, 0x16u);
}

+ (void)_writePendingPurgesToDisk:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_21E5D7000, v0, v1, "Failed to create a directory at %@, error:%@");
}

- (void)_deleteAllItemsForBundleIDs:completionBlock:.cold.1()
{
}

+ (void)_installedAppsListFromDisk
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_4_0(&dword_21E5D7000, v1, v2, "Error, property list is not expected class NSArray, instead class:%@", v3, v4, v5, v6, 2u);
}

+ (void)_writeAppsListToDisk:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E5D7000, a2, OS_LOG_TYPE_ERROR, "Error serializing installedAppsBundleIDs property list: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_writeAppsListToDisk:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_21E5D7000, v0, v1, "Error creating directory at path %@: %@");
}

@end