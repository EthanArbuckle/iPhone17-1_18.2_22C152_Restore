@interface STStorageAppsMonitor
+ (id)sharedMonitor;
- (BOOL)appsLoaded;
- (BOOL)containersSized;
- (NSArray)allApps;
- (NSArray)apps;
- (NSArray)demotableApps;
- (NSArray)demotedApps;
- (NSArray)prevApps;
- (STMSizer)appSizer;
- (STSizeDict)categorySizes;
- (STStorageAppsMonitor)init;
- (STUsageBundleRegistry)usageBundles;
- (SUDownload)currentSoftwareUpdate;
- (id)appSizesDict;
- (id)appWithIdentifier:(id)a3;
- (id)appsSortedBySize;
- (id)categorySizesDict;
- (id)childAppsForApp:(id)a3;
- (id)filteredApps:(id)a3 sortedUsingBlock:(id)a4;
- (id)storageInfoDict;
- (id)updateApps;
- (id)usageBundleForIdentifier:(id)a3;
- (int64_t)currentSoftwareUpdateSize;
- (int64_t)localStorageContainerSize;
- (int64_t)pluginkitDataSize;
- (void)_logAppSizes:(id)a3;
- (void)addDeviceInfoToDict:(id)a3;
- (void)addNumber:(int64_t)a3 toDict:(id)a4 forKey:(id)a5;
- (void)addTimestampToDict:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)appsStateChanged:(id)a3;
- (void)dealloc;
- (void)loadApps;
- (void)logAppSizes;
- (void)mediaSizesChanged:(id)a3;
- (void)notifyAppsChanged;
- (void)refreshApps:(id)a3;
- (void)setAppSizer:(id)a3;
- (void)setCategorySizes:(id)a3;
- (void)setCurrentSoftwareUpdate:(id)a3;
- (void)setPrevApps:(id)a3;
- (void)setSortNeeded;
- (void)setUsageBundles:(id)a3;
- (void)sizeCacheItemsUpdated:(id)a3;
- (void)startMonitor;
- (void)stopMonitor;
- (void)sync;
@end

@implementation STStorageAppsMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_monitorOnce != -1) {
    dispatch_once(&sharedMonitor_monitorOnce, &__block_literal_global_1);
  }
  v2 = (void *)_gSharedMonitor;

  return v2;
}

uint64_t __37__STStorageAppsMonitor_sharedMonitor__block_invoke()
{
  _gSharedMonitor = objc_alloc_init(STStorageAppsMonitor);

  return MEMORY[0x270F9A758]();
}

- (STStorageAppsMonitor)init
{
  v18.receiver = self;
  v18.super_class = (Class)STStorageAppsMonitor;
  v2 = [(STStorageAppsMonitor *)&v18 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = v3;

    [(NSOperationQueue *)v2->_serialQueue setMaxConcurrentOperationCount:1];
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    appsLock = v2->_appsLock;
    v2->_appsLock = v5;

    uint64_t v7 = [NSDictionary dictionary];
    appsByID = v2->_appsByID;
    v2->_appsByID = (NSDictionary *)v7;

    v2->_sharedContainerClass = NSClassFromString(&cfstr_Ststorageshare.isa);
    objc_initWeak(&location, v2);
    v9 = (void *)MEMORY[0x263F086D0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __28__STStorageAppsMonitor_init__block_invoke;
    v14[3] = &unk_264305028;
    objc_copyWeak(&v16, &location);
    v10 = v2;
    v15 = v10;
    uint64_t v11 = [v9 blockOperationWithBlock:v14];
    initialLoadOperation = v10->_initialLoadOperation;
    v10->_initialLoadOperation = (NSOperation *)v11;

    [(NSOperationQueue *)v2->_serialQueue addOperation:v10->_initialLoadOperation];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__STStorageAppsMonitor_init__block_invoke(uint64_t a1)
{
  v2 = +[STMSizer sharedAppSizer];
  v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAppSizer:v2];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_loadWeakRetained(v3);
  uint64_t v7 = [v6 appSizer];
  [v7 setDelegate:v5];

  v9 = objc_alloc_init(STUsageBundleRegistry);
  id v8 = objc_loadWeakRetained(v3);
  [v8 setUsageBundles:v9];
}

- (void)dealloc
{
  [(STStorageAppsMonitor *)self stopMonitor];
  v3.receiver = self;
  v3.super_class = (Class)STStorageAppsMonitor;
  [(STStorageAppsMonitor *)&v3 dealloc];
}

- (void)startMonitor
{
  objc_super v3 = +[STUpdateMonitor sharedMonitor];
  [v3 startMonitor];

  v4 = +[STFileProviderMonitor sharedMonitor];
  [v4 startMonitor];

  uint64_t v5 = +[STStorageMediaMonitor sharedMonitor];
  [v5 startMonitor];

  id v6 = [MEMORY[0x263F01880] defaultWorkspace];
  [v6 addObserver:self];

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __36__STStorageAppsMonitor_startMonitor__block_invoke;
  objc_super v18 = &unk_264305050;
  objc_copyWeak(&v19, &location);
  [(NSOperationQueue *)serialQueue addOperationWithBlock:&v15];
  id v8 = [(STStorageAppsMonitor *)self updateApps];
  v9 = [MEMORY[0x263F08A00] defaultCenter];
  v10 = +[STStorageDataNotifier sharedNotifier];
  [v9 addObserver:self selector:sel_refreshApps_ name:@"STNotify_AppsAdded" object:v10];

  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  v12 = +[STStorageDataNotifier sharedNotifier];
  [v11 addObserver:self selector:sel_appsStateChanged_ name:@"STNotify_AppsStateChanged" object:v12];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  v14 = +[STStorageDataNotifier sharedNotifier];
  [v13 addObserver:self selector:sel_mediaSizesChanged_ name:@"STNotify_MediaSizesChanged" object:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __36__STStorageAppsMonitor_startMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained appSizer];
  [v1 startSizer];
}

- (void)stopMonitor
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = +[STStorageDataNotifier sharedNotifier];
  [v3 removeObserver:self name:@"STNotify_AppsAdded" object:v4];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  id v6 = +[STStorageDataNotifier sharedNotifier];
  [v5 removeObserver:self name:@"STNotify_AppsStateChanged" object:v6];

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  id v8 = +[STStorageDataNotifier sharedNotifier];
  [v7 removeObserver:self name:@"STNotify_MediaSizesChanged" object:v8];

  v9 = +[STUpdateMonitor sharedMonitor];
  [v9 stopMonitor];

  v10 = +[STFileProviderMonitor sharedMonitor];
  [v10 stopMonitor];

  uint64_t v11 = +[STStorageMediaMonitor sharedMonitor];
  [v11 stopMonitor];

  v12 = [MEMORY[0x263F01880] defaultWorkspace];
  [v12 removeObserver:self];

  appSizer = self->_appSizer;

  [(STMSizer *)appSizer stopSizer];
}

- (id)usageBundleForIdentifier:(id)a3
{
  return [(STUsageBundleRegistry *)self->_usageBundles usageBundleForIdentifier:a3];
}

- (void)loadApps
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  STLog(1, @"%s", v2, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageAppsMonitor loadApps]");
  __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v10 = [(STStorageAppsMonitor *)self prevApps];
  uint64_t v11 = [(STStorageAppsMonitor *)self usageBundles];
  v94 = (void *)v10;
  v12 = +[STStorageDataManager updateAppsWithPrevious:v10 usageBundles:v11 skipAppRecordBlock:&__block_literal_global_31];

  [(STStorageAppsMonitor *)self setPrevApps:v12];
  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v96 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  __uint64_t v13 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  [(STMSizer *)self->_appSizer addApps:v12];
  __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v15 = +[STLaunchDates sharedDates];
  [v15 refreshDates];

  __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v95 = self;
  [(STMSizer *)self->_appSizer flushCacheAsynchronously];
  __uint64_t v17 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v105 objects:v112 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v106 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v105 + 1) + 8 * i) refreshAppState];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v105 objects:v112 count:16];
    }
    while (v20);
  }

  __uint64_t v23 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v24 = +[STStorageDataManager computeCategoriesForApps:v18];
  categorySizes = v95->_categorySizes;
  v95->_categorySizes = (STSizeDict *)v24;

  __uint64_t v26 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, @"%0.3f secs: update apps", v27, v28, v29, v30, v31, v32, COERCE__INT64((double)(v13 - v9) / 1000000000.0));
  STLog(1, @"%0.3f secs: add entries to cache", v33, v34, v35, v36, v37, v38, COERCE__INT64((double)(v14 - v13) / 1000000000.0));
  STLog(1, @"%0.3f secs: update launch times", v39, v40, v41, v42, v43, v44, COERCE__INT64((double)(v16 - v14) / 1000000000.0));
  STLog(1, @"%0.3f secs: sync cache sizes", v45, v46, v47, v48, v49, v50, COERCE__INT64((double)(v17 - v16) / 1000000000.0));
  STLog(1, @"%0.3f secs: update app info", v51, v52, v53, v54, v55, v56, COERCE__INT64((double)(v23 - v17) / 1000000000.0));
  STLog(1, @"%0.3f secs: compute categories", v57, v58, v59, v60, v61, v62, COERCE__INT64((double)(v26 - v23) / 1000000000.0));
  STLog(1, @"%0.3f secs total load time", v63, v64, v65, v66, v67, v68, COERCE__INT64((double)(v26 - v9) / 1000000000.0));
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v69 = v18;
  uint64_t v70 = [v69 countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (!v70)
  {
    v72 = 0;
    goto LABEL_28;
  }
  uint64_t v71 = v70;
  v72 = 0;
  uint64_t v73 = *(void *)v102;
  do
  {
    for (uint64_t j = 0; j != v71; ++j)
    {
      if (*(void *)v102 != v73) {
        objc_enumerationMutation(v69);
      }
      v75 = *(void **)(*((void *)&v101 + 1) + 8 * j);
      v76 = [v75 appRecord];
      v77 = [v76 linkedParentApplication];

      if (v77)
      {
        v78 = [v77 bundleIdentifier];
        if ([v78 length])
        {
          if (!v72)
          {
            v72 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
          }
          v79 = [(NSDictionary *)v72 objectForKey:v78];
          if (v79)
          {
            v80 = v79;
            v81 = [v79 arrayByAddingObject:v75];
          }
          else
          {
            v110 = v75;
            v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v110 count:1];
          }
          [(NSDictionary *)v72 setObject:v81 forKey:v78];
        }
      }
      else
      {
        if (![v75 userVisible]) {
          goto LABEL_24;
        }
        v78 = [v75 appIdentifier];
        [(NSDictionary *)v96 setObject:v75 forKey:v78];
      }

LABEL_24:
    }
    uint64_t v71 = [v69 countByEnumeratingWithState:&v101 objects:v111 count:16];
  }
  while (v71);
LABEL_28:

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v82 = v69;
  uint64_t v83 = [v82 countByEnumeratingWithState:&v97 objects:v109 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v98;
    do
    {
      for (uint64_t k = 0; k != v84; ++k)
      {
        if (*(void *)v98 != v85) {
          objc_enumerationMutation(v82);
        }
        v87 = *(void **)(*((void *)&v97 + 1) + 8 * k);
        v88 = [v87 bundleIdentifier];
        if ([v88 length])
        {
          v89 = [(NSDictionary *)v72 objectForKey:v88];
          [v87 setChildApps:v89];
        }
        else
        {
          [v87 setChildApps:0];
        }
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v97 objects:v109 count:16];
    }
    while (v84);
  }

  [(NSLock *)v95->_appsLock lock];
  appsByID = v95->_appsByID;
  v95->_appsByID = v96;
  v91 = v96;

  childAppsByParentID = v95->_childAppsByParentID;
  v95->_childAppsByParentID = v72;
  v93 = v72;

  v95->_sortNeeded = 1;
  [(NSLock *)v95->_appsLock unlock];
  [(STStorageAppsMonitor *)v95 logAppSizes];
  [(STStorageAppsMonitor *)v95 notifyAppsChanged];
}

BOOL __32__STStorageAppsMonitor_loadApps__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 developerType] == 3
    || ([v2 isDeletable] & 1) != 0
    || ([v2 isPlaceholder] & 1) != 0)
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v5 = [v2 bundleIdentifier];
    uint64_t v6 = +[STAppOverrides overridesFor:v5];
    uint64_t v7 = v6;
    BOOL v3 = !v6 || ([v6 forceVisible] & 1) == 0;
  }
  return v3;
}

- (id)updateApps
{
  STLog(1, @"%s", v2, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageAppsMonitor updateApps]");
  __uint64_t v9 = self;
  objc_sync_enter(v9);
  updateAppsOperation = v9->_updateAppsOperation;
  if (!updateAppsOperation || [(NSOperation *)updateAppsOperation isFinished])
  {
    objc_initWeak(&location, v9);
    uint64_t v11 = (void *)MEMORY[0x263F086D0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __34__STStorageAppsMonitor_updateApps__block_invoke;
    v16[3] = &unk_264305050;
    objc_copyWeak(&v17, &location);
    uint64_t v12 = [v11 blockOperationWithBlock:v16];
    __uint64_t v13 = v9->_updateAppsOperation;
    v9->_updateAppsOperation = (NSOperation *)v12;

    [(NSOperation *)v9->_updateAppsOperation addDependency:v9->_initialLoadOperation];
    [(NSOperationQueue *)v9->_serialQueue addOperation:v9->_updateAppsOperation];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  __uint64_t v14 = v9->_updateAppsOperation;
  objc_sync_exit(v9);

  return v14;
}

void __34__STStorageAppsMonitor_updateApps__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = (void *)MEMORY[0x21D463BC0]();
  id v2 = objc_loadWeakRetained(&to);
  [v2 loadApps];

  objc_destroyWeak(&to);
}

- (void)mediaSizesChanged:(id)a3
{
  id v3 = [(STStorageAppsMonitor *)self updateApps];
}

- (void)appsStateChanged:(id)a3
{
  id v3 = [(STStorageAppsMonitor *)self updateApps];
}

- (void)refreshApps:(id)a3
{
  [(STStorageAppsMonitor *)self setPrevApps:0];
  id v4 = [(STStorageAppsMonitor *)self updateApps];
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
  id v3 = [(STStorageAppsMonitor *)self updateApps];
}

- (void)applicationStateDidChange:(id)a3
{
  id v3 = [(STStorageAppsMonitor *)self updateApps];
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = STSharedSerialQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke;
  v7[3] = &unk_2643050C0;
  id v8 = v4;
  __uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  [*(id *)(*(void *)(a1 + 40) + 16) lock];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v21 + 1) + 8 * v7) bundleIdentifier];
        if ([v8 length])
        {
          __uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v8];
          if (v9) {
            [v2 addObject:v9];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 16) unlock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v2;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v14++) refreshAppState];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  dispatch_time_t v15 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke_2;
  block[3] = &unk_264305098;
  block[4] = *(void *)(a1 + 40);
  dispatch_after(v15, MEMORY[0x263EF83A0], block);
}

uint64_t __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyAppsChanged];
}

- (void)notifyAppsChanged
{
  id v2 = +[STStorageDataNotifier sharedNotifier];
  [v2 postAppSizesChanged:0];
}

- (void)sizeCacheItemsUpdated:(id)a3
{
  id v3 = [(STStorageAppsMonitor *)self updateApps];
}

- (id)filteredApps:(id)a3 sortedUsingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t (**)(id, void))a3;
  id v7 = a4;
  id v8 = [(STStorageAppsMonitor *)self apps];
  __uint64_t v9 = (void *)[v8 mutableCopy];

  if ([v9 count])
  {
    if (v6)
    {
      id v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if ((v6[2](v6, v15) & 1) == 0) {
              [v9 removeObject:v15];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
    }
    if (v7)
    {
      if ((id)STStorageAppSortBySizeBlock == v7) {
        goto LABEL_18;
      }
      __uint64_t v16 = v9;
      uint64_t v17 = (uint64_t)v7;
    }
    else
    {
      uint64_t v17 = STStorageAppSortByNameBlock;
      __uint64_t v16 = v9;
    }
    [v16 sortUsingComparator:v17];
  }
LABEL_18:

  return v9;
}

- (id)appsSortedBySize
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_appsLock lock];
  id v3 = [(NSDictionary *)self->_appsByID allValues];
  [(NSLock *)self->_appsLock unlock];
  uint64_t v30 = [v3 count];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:");
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v11 = [v10 appSizeIfComputed];
        uint64_t v12 = v11;
        if (v11)
        {
          uint64_t v13 = [v11 userTotal];
          if (v13 <= 4096) {
            goto LABEL_16;
          }
          uint64_t v14 = v13;
          if (unint64_t)v13 <= 0xF423F && (objc_opt_isKindOfClass()) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v14 = 0;
        }
        uint64_t v15 = [NSNumber numberWithLongLong:v14];
        __uint64_t v16 = [v4 objectForKey:v15];
        uint64_t v17 = v16;
        if (v16)
        {
          [v16 addObject:v10];
        }
        else
        {
          long long v18 = [MEMORY[0x263EFF980] arrayWithObject:v10];
          [v4 setObject:v18 forKey:v15];
        }
LABEL_16:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }

  long long v19 = [v4 allKeys];
  long long v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_66];

  long long v21 = [MEMORY[0x263EFF980] arrayWithCapacity:v30];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [v4 objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * j)];
        if ((unint64_t)[v27 count] >= 2)
        {
          uint64_t v28 = [v27 sortedArrayUsingComparator:STStorageAppSortByNameBlock];

          uint64_t v27 = (void *)v28;
        }
        [v21 addObjectsFromArray:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v24);
  }

  return v21;
}

uint64_t __40__STStorageAppsMonitor_appsSortedBySize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 longLongValue];
  uint64_t v6 = [v4 longLongValue];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v6 > v5;
  }
}

- (NSArray)apps
{
  [(NSLock *)self->_appsLock lock];
  if (self->_sortNeeded)
  {
    [(NSLock *)self->_appsLock unlock];
    id v3 = [(STStorageAppsMonitor *)self appsSortedBySize];
    [(NSLock *)self->_appsLock lock];
    self->_sortNeeded = 0;
    allApps = self->_allApps;
    self->_allApps = v3;
  }
  uint64_t v5 = self->_allApps;
  [(NSLock *)self->_appsLock unlock];

  return v5;
}

- (NSArray)demotableApps
{
  return (NSArray *)[(STStorageAppsMonitor *)self filteredApps:&__block_literal_global_69 sortedUsingBlock:STStorageAppSortBySizeBlock];
}

uint64_t __37__STStorageAppsMonitor_demotableApps__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDemotable];
}

- (NSArray)demotedApps
{
  return (NSArray *)[(STStorageAppsMonitor *)self filteredApps:&__block_literal_global_71 sortedUsingBlock:STStorageAppSortBySizeBlock];
}

uint64_t __35__STStorageAppsMonitor_demotedApps__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDemoted];
}

- (id)appWithIdentifier:(id)a3
{
  appsLocuint64_t k = self->_appsLock;
  id v5 = a3;
  [(NSLock *)appsLock lock];
  uint64_t v6 = [(NSDictionary *)self->_appsByID objectForKey:v5];

  [(NSLock *)self->_appsLock unlock];

  return v6;
}

- (void)setSortNeeded
{
  self->_sortNeeded = 1;
}

- (id)childAppsForApp:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  if ([v4 length])
  {
    [(NSLock *)self->_appsLock lock];
    id v5 = [(NSDictionary *)self->_childAppsByParentID objectForKey:v4];
    [(NSLock *)self->_appsLock unlock];
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = (void *)MEMORY[0x263EFFA68];
  }
  id v7 = v6;

  return v7;
}

- (void)addNumber:(int64_t)a3 toDict:(id)a4 forKey:(id)a5
{
  if (a3)
  {
    id v7 = NSNumber;
    id v8 = a5;
    id v9 = a4;
    id v10 = [v7 numberWithLongLong:a3];
    [v9 setObject:v10 forKey:v8];
  }
}

- (void)addDeviceInfoToDict:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MGGetStringAnswer();
  [v8 setObject:v4 forKey:@"device-type"];
  id v5 = (void *)MGGetStringAnswer();
  [v8 setObject:v5 forKey:@"os-version"];
  uint64_t v6 = +[STStorageDiskMonitor sharedMonitor];
  id v7 = [v6 storageSpace];
  -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v6 deviceSize], v8, @"device-size");
  -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v7 usedBytes], v8, @"device-used");
  -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v7 purgeableBytes], v8, @"device-purgeable");
  if ([v7 isLowSpace])
  {
    [v8 setObject:MEMORY[0x263EFFA88] forKey:@"is-low-space"];
    if ([v7 isVeryLowSpace]) {
      [v8 setObject:MEMORY[0x263EFFA88] forKey:@"is-very-low-space"];
    }
  }
}

- (void)addTimestampToDict:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F088C0];
  id v4 = a3;
  id v7 = objc_alloc_init(v3);
  id v5 = [MEMORY[0x263EFF910] now];
  uint64_t v6 = [v7 stringFromDate:v5];
  [v4 setObject:v6 forKey:@"date"];
}

- (id)storageInfoDict
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:8];
  [(STStorageAppsMonitor *)self addTimestampToDict:v3];
  long long v21 = (void *)v3;
  [(STStorageAppsMonitor *)self addDeviceInfoToDict:v3];
  id v22 = [MEMORY[0x263EFF980] arrayWithCapacity:9];
  id v4 = [(STSizeDict *)self->_categorySizes dictionary];
  for (unsigned int i = 0; i != 9; ++i)
  {
    uint64_t v6 = STKeyForCategory(i);
    id v7 = [v4 objectForKey:v6];
    id v8 = v7;
    if (v7 && ([v7 isZero] & 1) == 0)
    {
      id v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
      [v9 setObject:v6 forKeyedSubscript:@"id"];
      id v10 = STNameForCategoryKey(v6);
      [v9 setObject:v10 forKeyedSubscript:@"name"];

      uint64_t v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v8 userTotal], v11, @"total");
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v8 fixed], v11, @"fixed");
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v8 dynamic], v11, @"dynamic");
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", [v8 purgeable], v11, @"purgeable");
      [v9 setObject:v11 forKeyedSubscript:@"sizes"];
      [v22 addObject:v9];
    }
  }
  uint64_t v12 = [(STStorageAppsMonitor *)self apps];
  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [*(id *)(*((void *)&v23 + 1) + 8 * j) infoDict];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  [v21 setObject:v22 forKeyedSubscript:@"categories"];
  [v21 setObject:v13 forKeyedSubscript:@"apps"];

  return v21;
}

- (id)appSizesDict
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [(STStorageAppsMonitor *)self apps];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "appSize", (void)v15);
        uint64_t v11 = [v10 userTotal];

        if (v11)
        {
          uint64_t v12 = [NSNumber numberWithLongLong:v11];
          uint64_t v13 = [v9 bundleIdentifier];
          [v3 setObject:v12 forKey:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)categorySizesDict
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:8];
  [(STStorageAppsMonitor *)self addTimestampToDict:v3];
  [(STStorageAppsMonitor *)self addDeviceInfoToDict:v3];
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:9];
  uint64_t v5 = [(STSizeDict *)self->_categorySizes dictionary];
  for (unsigned int i = 0; i != 9; ++i)
  {
    uint64_t v7 = STKeyForCategory(i);
    id v8 = [v5 objectForKey:v7];
    id v9 = v8;
    if (v8 && ([v8 isZero] & 1) == 0)
    {
      id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "userTotal"));
      [v4 setObject:v10 forKey:v7];
    }
  }
  [v3 setObject:v4 forKey:@"categories"];

  return v3;
}

- (void)sync
{
  [(NSOperation *)self->_initialLoadOperation waitUntilFinished];
  uint64_t v3 = +[STFileProviderMonitor sharedMonitor];
  [v3 sync];

  id v4 = +[STUpdateMonitor sharedMonitor];
  [v4 sync];

  uint64_t v5 = +[STStorageDiskMonitor sharedMonitor];
  [v5 sync];

  uint64_t v6 = +[STStorageMediaMonitor sharedMonitor];
  [v6 sync];

  uint64_t v7 = (void *)MEMORY[0x21D463BC0]();
  [(STMSizer *)self->_appSizer startSizer];
  id v8 = [(STStorageAppsMonitor *)self updateApps];
  [v8 waitUntilFinished];
  [(STMSizer *)self->_appSizer stopSizer];
  [(STMSizeCache *)self->_appSizer writeCacheToPref];
}

- (void)_logAppSizes:(id)a3
{
  id v4 = [(NSDictionary *)self->_appsByID allValues];
  uint64_t v5 = [(STSizeDict *)self->_categorySizes dictionary];
  uint64_t v6 = dispatch_get_global_queue(17, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__STStorageAppsMonitor__logAppSizes___block_invoke;
  v9[3] = &unk_2643050C0;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v9);
}

void __37__STStorageAppsMonitor__logAppSizes___block_invoke(uint64_t a1)
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  v173 = [*(id *)(a1 + 32) sortedArrayUsingComparator:&__block_literal_global_82];
  STLog(1, @"Categories", v2, v3, v4, v5, v6, v7, v161);
  id v8 = 0;
  for (unsigned int i = 0; i != 9; ++i)
  {
    id v10 = STKeyForCategory(i);
    id v11 = [*(id *)(a1 + 40) objectForKey:v10];
    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x263F089D8];
      uint64_t v13 = STNameForCategoryKey(v10);
      id v14 = STFormattedSize([v11 userTotal]);
      long long v15 = [v12 stringWithFormat:@"%@: %@", v13, v14];

      if ([v11 purgeable])
      {
        id v22 = STFormattedSize([v11 purgeable]);
        [v15 appendFormat:@" (+ %@ purgeable)", v22];
      }
      STLog(1, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
      id v8 = v15;
    }
  }
  STLog(1, @"Application Sizes", v23, v24, v25, v26, v27, v28, v162);
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  obuint64_t j = v173;
  uint64_t v170 = [obj countByEnumeratingWithState:&v175 objects:v179 count:16];
  if (v170)
  {
    uint64_t v172 = 0;
    uint64_t v174 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v168 = *(void *)v176;
    do
    {
      uint64_t v32 = 0;
      long long v33 = v8;
      do
      {
        if (*(void *)v176 != v168) {
          objc_enumerationMutation(obj);
        }
        long long v34 = *(void **)(*((void *)&v175 + 1) + 8 * v32);
        long long v35 = [v34 appSize];
        uint64_t v36 = [v35 userTotal];

        long long v37 = (void *)MEMORY[0x263F089D8];
        long long v38 = STFormattedSize(v36);
        uint64_t v39 = [v34 bundleIdentifier];
        uint64_t v40 = [v34 appIdentifier];
        id v8 = [v37 stringWithFormat:@"%@: %@ (%@)", v38, v39, v40];

        uint64_t v41 = [v34 appSize];
        uint64_t v42 = [v41 fixed];

        v31 += v42;
        AppendSizeInfo(v8, @"APP", v42);
        uint64_t v43 = [v34 dataContainerSize];
        uint64_t v44 = v43 + v172;
        AppendSizeInfo(v8, @"DAT", v43);
        uint64_t v45 = [v34 coreMLDataSize];
        uint64_t v172 = v44 + v45;
        AppendSizeInfo(v8, @"CML", v45);
        uint64_t v46 = [v34 sharedContainerSize];
        v30 += v46;
        AppendSizeInfo(v8, @"SHR", v46);
        uint64_t v47 = [v34 externalSize];
        v29 += v47;
        AppendSizeInfo(v8, @"EXT", v47);
        uint64_t v48 = [v34 dataPurgeableSize];
        uint64_t v49 = [v34 sharedPurgeableSize] + v48;
        uint64_t v50 = v49 + [v34 assetPurgeableSize];
        AppendSizeInfo(v8, @"PRG", v50);
        uint64_t v51 = [v34 externalPurgeableSize];
        v174 += v50 + v51;
        AppendSizeInfo(v8, @"EPRG", v51);
        STLog(4, @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v8);
        ++v32;
        long long v33 = v8;
      }
      while (v170 != v32);
      uint64_t v170 = [obj countByEnumeratingWithState:&v175 objects:v179 count:16];
    }
    while (v170);
  }
  else
  {
    uint64_t v172 = 0;
    uint64_t v174 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
  }

  uint64_t v58 = +[STStorageApp sizeOfPluginKitContainers];
  uint64_t v59 = [v58 dynamic];
  uint64_t v60 = [v58 purgeable];
  uint64_t v61 = (void *)MEMORY[0x263F089D8];
  v171 = v58;
  uint64_t v62 = STFormattedSize([v58 userTotal]);
  uint64_t v63 = [v61 stringWithFormat:@"%@: PluginKit", v62];

  AppendSizeInfo(v63, @"DAT", v59);
  AppendSizeInfo(v63, @"PRG", v60);
  v169 = v63;
  STLog(4, @"%@", v64, v65, v66, v67, v68, v69, (uint64_t)v63);
  uint64_t v70 = STSizeOfPath(@"/var/mobile/Library/Logs");
  uint64_t v71 = [v70 longLongValue];
  v72 = STSizeOfPath(@"/Library/Logs");

  uint64_t v73 = [v72 longLongValue] + v71;
  v74 = STSizeOfPath(@"/var/log");

  uint64_t v75 = [v74 longLongValue];
  v76 = STSizeOfPath(@"/var/logs");

  uint64_t v77 = v73 + v75 + [v76 longLongValue];
  v78 = STSizeOfPath(@"/var/tmp/powerlog");

  uint64_t v79 = [v78 longLongValue];
  v80 = STSizeOfPath(@"/var/wireless/Library/Logs");

  v166 = v80;
  uint64_t v81 = v77 + v79 + [v80 longLongValue];
  id v82 = +[STStorageCacheDelete sharedMonitor];
  uint64_t v83 = [v82 cacheDeleteDict];

  v165 = v83;
  uint64_t v84 = [v83 objectForKey:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
  uint64_t v85 = [v84 objectForKey:@"com.apple.logd.cachedelete"];
  uint64_t v86 = v81 + [v85 longLongValue];

  if (v86 >= 10000001)
  {
    v93 = STFormattedSize(v86);
    STLog(1, @"Logs: %@", v94, v95, v96, v97, v98, v99, (uint64_t)v93);
  }
  uint64_t v100 = v59 + v172;
  STLog(1, &stru_26C925718, v87, v88, v89, v90, v91, v92, v163);
  long long v101 = STFormattedSize(v31);
  STLog(1, @"Total static: %@", v102, v103, v104, v105, v106, v107, (uint64_t)v101);

  long long v108 = STFormattedSize(v100);
  STLog(1, @"Total dynamic: %@", v109, v110, v111, v112, v113, v114, (uint64_t)v108);

  v115 = STFormattedSize(v30);
  STLog(1, @"Total shared: %@", v116, v117, v118, v119, v120, v121, (uint64_t)v115);

  v122 = STFormattedSize(v29);
  STLog(1, @"Total external: %@", v123, v124, v125, v126, v127, v128, (uint64_t)v122);

  v129 = STFormattedSize(v60 + v174);
  STLog(1, @"Total purgeable: %@", v130, v131, v132, v133, v134, v135, (uint64_t)v129);

  v136 = STFormattedSize(v30 + v29 + v31 + v100 - (v60 + v174));
  STLog(1, @"User footprint: %@", v137, v138, v139, v140, v141, v142, (uint64_t)v136);

  uint64_t v143 = STSizeOfSystemVolume();
  v144 = STFormattedSize(v143);
  STLog(1, @"System disk size: %@", v145, v146, v147, v148, v149, v150, (uint64_t)v144);

  v151 = +[STStorageDiskMonitor sharedMonitor];
  v152 = [v151 storageSpace];
  v153 = STFormattedSize([v152 usedBytes]);
  v154 = STFormattedSize([v151 deviceSize]);
  v164 = STFormattedSize([v152 purgeableBytes]);
  STLog(1, @"%@ of %@ used on device (%@ total purgeable)", v155, v156, v157, v158, v159, v160, (uint64_t)v153);
}

uint64_t __37__STStorageAppsMonitor__logAppSizes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 appSize];
  uint64_t v7 = [v6 userTotal];
  id v8 = [v5 appSize];
  uint64_t v9 = [v8 userTotal];

  if (v7 <= v9)
  {
    id v11 = [v5 appSize];
    uint64_t v12 = [v11 userTotal];
    uint64_t v13 = [v4 appSize];
    uint64_t v14 = [v13 userTotal];

    if (v12 <= v14)
    {
      long long v15 = [v4 name];
      uint64_t v16 = [v5 name];
      uint64_t v10 = [v15 localizedCaseInsensitiveCompare:v16];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (void)logAppSizes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__STStorageAppsMonitor_logAppSizes__block_invoke;
  block[3] = &unk_264305098;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __35__STStorageAppsMonitor_logAppSizes__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__logAppSizes_ object:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 performSelector:sel__logAppSizes_ withObject:0 afterDelay:3.0];
}

- (NSArray)allApps
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)appsLoaded
{
  return self->_appsLoaded;
}

- (BOOL)containersSized
{
  return self->_containersSized;
}

- (int64_t)pluginkitDataSize
{
  return self->_pluginkitDataSize;
}

- (int64_t)localStorageContainerSize
{
  return self->_localStorageContainerSize;
}

- (SUDownload)currentSoftwareUpdate
{
  return (SUDownload *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentSoftwareUpdate:(id)a3
{
}

- (int64_t)currentSoftwareUpdateSize
{
  return self->_currentSoftwareUpdateSize;
}

- (STSizeDict)categorySizes
{
  return (STSizeDict *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCategorySizes:(id)a3
{
}

- (STUsageBundleRegistry)usageBundles
{
  return (STUsageBundleRegistry *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUsageBundles:(id)a3
{
}

- (STMSizer)appSizer
{
  return (STMSizer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAppSizer:(id)a3
{
}

- (NSArray)prevApps
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPrevApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevApps, 0);
  objc_storeStrong((id *)&self->_appSizer, 0);
  objc_storeStrong((id *)&self->_usageBundles, 0);
  objc_storeStrong((id *)&self->_categorySizes, 0);
  objc_storeStrong((id *)&self->_currentSoftwareUpdate, 0);
  objc_storeStrong((id *)&self->_sharedContainers, 0);
  objc_storeStrong((id *)&self->_pkContainers, 0);
  objc_storeStrong((id *)&self->_initialLoadOperation, 0);
  objc_storeStrong((id *)&self->_updateAppsOperation, 0);
  objc_storeStrong((id *)&self->_childAppsByParentID, 0);
  objc_storeStrong((id *)&self->_appsByID, 0);
  objc_storeStrong((id *)&self->_allApps, 0);
  objc_storeStrong((id *)&self->_appsLock, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end