@interface PSDataUsageStatisticsCache
+ (id)sharedInstance;
- (BOOL)billingCycleSupported;
- (BOOL)cacheNeedsRefresh;
- (BOOL)refreshInProgress;
- (BOOL)useCalendarMonthBillingCycle;
- (CTCellularUsageWorkspaceInfo)workspaceInfo;
- (CTDeviceDataUsage)cachedDeviceDataUsage;
- (CoreTelephonyClient)client;
- (NSDictionary)hotspotClientsUsage;
- (PSDataUsageStatisticsCache)init;
- (PSDataUsageStatisticsCache)initWithCoreTelephonyClient:(id)a3;
- (id)billingCycleEndDate;
- (id)bundleIDsForAppType:(unint64_t)a3;
- (id)displayNameForHotspotClientID:(id)a3;
- (id)displayNamesForBundleIDs:(id)a3 appType:(unint64_t)a4;
- (id)getLogger;
- (id)hotspotClientIDsForPeriod:(unint64_t)a3;
- (id)initPrivate;
- (id)previousBillingCycleEndDate;
- (id)refreshCompletionHandler;
- (id)totalSystemServicesUsageForPeriod:(unint64_t)a3;
- (id)totalUninstalledAppUsageForPeriod:(unint64_t)a3;
- (id)totalWatchOnlyAppUsageForPeriod:(unint64_t)a3;
- (id)usageForBundleID:(id)a3 inPeriod:(unint64_t)a4;
- (id)wifiAssistUsageForPeriod:(unint64_t)a3;
- (unint64_t)totalCellularUsageForPeriod:(unint64_t)a3;
- (unint64_t)totalHotspotClientUsageForPeriod:(unint64_t)a3;
- (unint64_t)totalRoamingUsageForPeriod:(unint64_t)a3;
- (unint64_t)usageForHotspotClientID:(id)a3 inPeriod:(unint64_t)a4;
- (void)_clearCache;
- (void)_handleUsageOrInfoChanged;
- (void)dataRatesChanged;
- (void)dealloc;
- (void)fetchDeviceDataUsage;
- (void)fetchDeviceDataUsageWithCompletion:(id)a3;
- (void)fetchHotspotClientsUsage;
- (void)fetchWorkspaceInfo;
- (void)refreshCacheIfNeeded;
- (void)refreshDataUsageUINotification;
- (void)setCacheNeedsRefresh:(BOOL)a3;
- (void)setCachedDeviceDataUsage:(id)a3;
- (void)setClient:(id)a3;
- (void)setHotspotClientsUsage:(id)a3;
- (void)setRefreshCompletionHandler:(id)a3;
- (void)setRefreshInProgress:(BOOL)a3;
- (void)setWorkspaceInfo:(id)a3;
- (void)willEnterForeground;
@end

@implementation PSDataUsageStatisticsCache

+ (id)sharedInstance
{
  if (qword_26AC32878 != -1) {
    dispatch_once(&qword_26AC32878, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_3;
  return v2;
}

uint64_t __44__PSDataUsageStatisticsCache_sharedInstance__block_invoke()
{
  _MergedGlobals_3 = [[PSDataUsageStatisticsCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  id v3 = objc_alloc(MEMORY[0x263F02D30]);
  v4 = +[SettingsCellularSharedUtils createCTClientSerialQueue:@"data_usage"];
  v5 = (void *)[v3 initWithQueue:v4];

  v6 = [(PSDataUsageStatisticsCache *)self initWithCoreTelephonyClient:v5];
  return v6;
}

- (PSDataUsageStatisticsCache)initWithCoreTelephonyClient:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSDataUsageStatisticsCache;
  v6 = [(PSDataUsageStatisticsCache *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(PSDataUsageStatisticsCache *)v6 _clearCache];
    objc_storeStrong((id *)&v7->_client, a3);
    [(CoreTelephonyClient *)v7->_client setDelegate:v7];
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_willEnterForeground name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v7;
}

- (PSDataUsageStatisticsCache)init
{
  v2 = [(PSDataUsageStatisticsCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_2247E9000, v2, OS_LOG_TYPE_ERROR, "unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSDataUsageStatisticsCache;
  [(PSDataUsageStatisticsCache *)&v4 dealloc];
}

- (void)willEnterForeground
{
  id v3 = [(PSDataUsageStatisticsCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Re-querying usage due to entering foreground", v4, 2u);
  }

  [(PSDataUsageStatisticsCache *)self _handleUsageOrInfoChanged];
}

- (void)_clearCache
{
  id v3 = [(PSDataUsageStatisticsCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Clearing data usage stats cache", v5, 2u);
  }

  objc_super v4 = self;
  objc_sync_enter(v4);
  [(PSDataUsageStatisticsCache *)v4 setCachedDeviceDataUsage:0];
  [(PSDataUsageStatisticsCache *)v4 setWorkspaceInfo:0];
  [(PSDataUsageStatisticsCache *)v4 setHotspotClientsUsage:0];
  [(PSDataUsageStatisticsCache *)v4 setCacheNeedsRefresh:1];
  objc_sync_exit(v4);
}

- (void)fetchDeviceDataUsage
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(PSDataUsageStatisticsCache *)v2 refreshInProgress])
  {
    id v3 = [(PSDataUsageStatisticsCache *)v2 getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Refresh already in progress", buf, 2u);
    }

    objc_sync_exit(v2);
  }
  else
  {
    [(PSDataUsageStatisticsCache *)v2 setWorkspaceInfo:0];
    [(PSDataUsageStatisticsCache *)v2 setRefreshInProgress:1];
    objc_sync_exit(v2);

    objc_super v4 = [(PSDataUsageStatisticsCache *)v2 getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247E9000, v4, OS_LOG_TYPE_INFO, "Executing fetch", buf, 2u);
    }

    client = v2->_client;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__PSDataUsageStatisticsCache_fetchDeviceDataUsage__block_invoke;
    v6[3] = &unk_2646DEBA0;
    v6[4] = v2;
    [(CoreTelephonyClient *)client dataUsageForLastPeriods:2 completion:v6];
  }
}

void __50__PSDataUsageStatisticsCache_fetchDeviceDataUsage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = a3;
  [*(id *)(a1 + 32) setRefreshInProgress:0];
  v7 = [*(id *)(a1 + 32) getLogger];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      v16 = v6;
      _os_log_error_impl(&dword_2247E9000, v8, OS_LOG_TYPE_ERROR, "Fetch failed: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_2247E9000, v8, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(a1 + 32) setCachedDeviceDataUsage:v5];
    [*(id *)(a1 + 32) setCacheNeedsRefresh:0];
    v9 = [*(id *)(a1 + 32) refreshCompletionHandler];

    objc_super v10 = *(void **)(a1 + 32);
    if (v9)
    {
      v11 = [v10 refreshCompletionHandler];
      v11[2]();

      [*(id *)(a1 + 32) setRefreshCompletionHandler:0];
    }
    else
    {
      v12 = [v10 getLogger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_error_impl(&dword_2247E9000, v12, OS_LOG_TYPE_ERROR, "Missing completion handler for fetch", (uint8_t *)&v15, 2u);
      }
    }
    v8 = [MEMORY[0x263F089F8] notificationWithName:@"PSWirelessDataUsageCacheRefreshedNotification" object:0];
    v13 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[PSDataUsageStatisticsCache fetchDeviceDataUsage]_block_invoke";
      __int16 v17 = 2112;
      v18 = @"PSWirelessDataUsageCacheRefreshedNotification";
      _os_log_impl(&dword_2247E9000, v13, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v15, 0x16u);
    }

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 performSelectorOnMainThread:sel_postNotification_ withObject:v8 waitUntilDone:0];
  }
}

- (void)fetchDeviceDataUsageWithCompletion:(id)a3
{
  [(PSDataUsageStatisticsCache *)self setRefreshCompletionHandler:a3];
  [(PSDataUsageStatisticsCache *)self fetchDeviceDataUsage];
}

- (void)refreshCacheIfNeeded
{
  if ([(PSDataUsageStatisticsCache *)self cacheNeedsRefresh])
  {
    [(PSDataUsageStatisticsCache *)self fetchDeviceDataUsage];
  }
}

- (void)fetchHotspotClientsUsage
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = WiFiManagerClientCreate();
  if (v3)
  {
    objc_super v4 = (const void *)v3;
    id v5 = (void *)WiFiManagerClientCopyProperty();
    [(PSDataUsageStatisticsCache *)self setHotspotClientsUsage:v5];

    v6 = [(PSDataUsageStatisticsCache *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];
      int v9 = 138543362;
      objc_super v10 = v8;
      _os_log_debug_impl(&dword_2247E9000, v6, OS_LOG_TYPE_DEBUG, "Hotspot usage: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    CFRelease(v4);
  }
  else
  {
    v7 = [(PSDataUsageStatisticsCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_2247E9000, v7, OS_LOG_TYPE_ERROR, "Could not create WiFiManagerClient", (uint8_t *)&v9, 2u);
    }
  }
}

- (id)bundleIDsForAppType:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  id v5 = objc_opt_new();
  switch(a3)
  {
    case 0uLL:
      v6 = (void *)MEMORY[0x263EFF8C0];
      v24 = self;
      v7 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v8 = [v7 appDataUsageForPeriod:0];
      goto LABEL_9;
    case 1uLL:
      v6 = (void *)MEMORY[0x263EFF8C0];
      v24 = self;
      v7 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v8 = [v7 uninstalledAppDataUsageForPeriod:0];
      goto LABEL_9;
    case 2uLL:
      v6 = (void *)MEMORY[0x263EFF8C0];
      v24 = self;
      v7 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v8 = [v7 proxiedOnlyAppDataUsageForPeriod:0];
      goto LABEL_9;
    case 3uLL:
      objc_super v10 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];

      if (!v10) {
        [(PSDataUsageStatisticsCache *)self fetchHotspotClientsUsage];
      }
      v6 = (void *)MEMORY[0x263EFF8C0];
      v24 = self;
      v7 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v8 = [v7 systemServiceDataUsageForPeriod:0];
LABEL_9:
      uint64_t v11 = (void *)v8;
      int v9 = [v6 arrayWithArray:v8];

      goto LABEL_10;
    case 4uLL:
      v22 = [(PSDataUsageStatisticsCache *)self hotspotClientIDsForPeriod:0];
      goto LABEL_22;
    default:
      v24 = self;
      int v9 = 0;
LABEL_10:
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v12 = v9;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            __int16 v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a3 == 3)
            {
              v18 = [*(id *)(*((void *)&v25 + 1) + 8 * i) bundleId];
              int v19 = [v18 isEqualToString:@"com.apple.datausage.personalhotspot"];

              if (v19)
              {
                v20 = [(PSDataUsageStatisticsCache *)v24 hotspotClientsUsage];

                if (v20) {
                  continue;
                }
              }
            }
            v21 = [v17 bundleId];
            [v5 addObject:v21];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v14);
      }

      v22 = [v5 allObjects];

LABEL_22:
      return v22;
  }
}

- (id)displayNamesForBundleIDs:(id)a3 appType:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v30 = self;
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  switch(a4)
  {
    case 0uLL:
      uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
      int v9 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v10 = [v9 appDataUsageForPeriod:0];
      goto LABEL_7;
    case 1uLL:
      uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
      int v9 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v10 = [v9 uninstalledAppDataUsageForPeriod:0];
      goto LABEL_7;
    case 2uLL:
      uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
      int v9 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v10 = [v9 proxiedOnlyAppDataUsageForPeriod:0];
      goto LABEL_7;
    case 3uLL:
      uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
      int v9 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
      uint64_t v10 = [v9 systemServiceDataUsageForPeriod:0];
LABEL_7:
      uint64_t v11 = (void *)v10;
      v31 = [v8 arrayWithArray:v10];

      break;
    default:
      v31 = 0;
      break;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    uint64_t v27 = *(void *)v38;
    unint64_t v28 = a4;
    do
    {
      uint64_t v15 = 0;
      uint64_t v29 = v13;
      do
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
        if (a4 == 4)
        {
          id v17 = [(PSDataUsageStatisticsCache *)v30 displayNameForHotspotClientID:*(void *)(*((void *)&v37 + 1) + 8 * v15)];
          [v7 setObject:v17 forKey:v16];
        }
        else
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v17 = v31;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v34 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                v23 = objc_msgSend(v22, "bundleId", v27, v28);
                int v24 = [v16 isEqualToString:v23];

                if (v24)
                {
                  long long v25 = [v22 displayName];
                  [v7 setObject:v25 forKey:v16];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v19);
            uint64_t v14 = v27;
            a4 = v28;
            uint64_t v13 = v29;
          }
        }

        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v13);
  }

  return v7;
}

- (id)totalWatchOnlyAppUsageForPeriod:(unint64_t)a3
{
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  id v5 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  id v6 = [v5 totalProxiedOnlyAppDataUsedForPeriod:a3];

  return v6;
}

- (id)totalSystemServicesUsageForPeriod:(unint64_t)a3
{
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  id v5 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  id v6 = [v5 totalSystemServiceDataUsedForPeriod:a3];

  return v6;
}

- (id)totalUninstalledAppUsageForPeriod:(unint64_t)a3
{
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  id v5 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  id v6 = [v5 totalUninstalledAppDataUsedForPeriod:a3];

  return v6;
}

- (id)hotspotClientIDsForPeriod:(unint64_t)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unint64_t v5 = -[PSDataUsageStatisticsCache totalHotspotClientUsageForPeriod:](self, "totalHotspotClientUsageForPeriod:");
  id v6 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];

  if (!v6) {
    [(PSDataUsageStatisticsCache *)self fetchHotspotClientsUsage];
  }
  v7 = objc_opt_new();
  uint64_t v8 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];
  int v9 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v10 = [v9 stringValue];
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];

  if (v11 && [v11 count])
  {
    uint64_t v27 = v11;
    unint64_t v28 = v5;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v11;
    uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    unint64_t v12 = 0;
    if (v32)
    {
      uint64_t v31 = *(void *)v42;
      uint64_t v30 = *MEMORY[0x263F55F78];
      uint64_t v36 = *MEMORY[0x263F55F88];
      uint64_t v35 = *MEMORY[0x263F55F68];
      uint64_t v13 = *MEMORY[0x263F55F48];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v14;
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v14), "objectForKey:", v30, v27, v28);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v34 = v15;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v38 != v18) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                v21 = [v20 objectForKey:v36];
                v22 = [v20 objectForKey:v35];
                uint64_t v23 = [v22 unsignedIntegerValue];
                v12 += v23 + [v21 unsignedIntegerValue];
                int v24 = [v20 objectForKey:v13];
                [v7 addObject:v24];
              }
              uint64_t v17 = [v34 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v17);
          }

          uint64_t v14 = v33 + 1;
        }
        while (v33 + 1 != v32);
        uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v32);
    }

    uint64_t v11 = v27;
    unint64_t v5 = v28;
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (v5 > v12) {
    [v7 addObject:@"Others"];
  }
  if (v7)
  {
    long long v25 = [v7 allObjects];
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

- (id)displayNameForHotspotClientID:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];

  if (!v5) {
    [(PSDataUsageStatisticsCache *)self fetchHotspotClientsUsage];
  }
  id v6 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];
  v7 = [NSNumber numberWithUnsignedInteger:0];
  uint64_t v8 = [v7 stringValue];
  int v9 = [v6 objectForKeyedSubscript:v8];

  if (v9 && [v9 count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v25 = v9;
    id obj = v9;
    uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    uint64_t v10 = 0;
    if (v30)
    {
      uint64_t v29 = *(void *)v36;
      uint64_t v28 = *MEMORY[0x263F55F78];
      uint64_t v11 = *MEMORY[0x263F55F48];
      uint64_t v27 = *MEMORY[0x263F55F50];
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "objectForKey:", v28, v25);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v32;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v32 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                uint64_t v20 = [v19 objectForKey:v11];
                if ([v20 isEqualToString:v4])
                {
                  uint64_t v21 = [v19 objectForKey:v27];

                  uint64_t v10 = (void *)v21;
                  goto LABEL_20;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_20:
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v30);
    }

    int v9 = v25;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v10) {
    v22 = v10;
  }
  else {
    v22 = v4;
  }
  id v23 = v22;

  return v23;
}

- (unint64_t)totalHotspotClientUsageForPeriod:(unint64_t)a3
{
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  unint64_t v5 = [(PSDataUsageStatisticsCache *)self usageForBundleID:@"com.apple.datausage.personalhotspot" inPeriod:a3];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 native];
    uint64_t v8 = [v7 cellularHome];
    int v9 = [v6 native];
    uint64_t v10 = [v9 cellularRoaming] + v8;
    uint64_t v11 = [v6 proxied];
    uint64_t v12 = [v11 cellularHome];
    uint64_t v13 = [v6 proxied];
    unint64_t v14 = v10 + v12 + [v13 cellularRoaming];
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)usageForHotspotClientID:(id)a3 inPeriod:(unint64_t)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v39 = a3;
  unint64_t v6 = [(PSDataUsageStatisticsCache *)self totalHotspotClientUsageForPeriod:a4];
  v7 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];

  if (!v7) {
    [(PSDataUsageStatisticsCache *)self fetchHotspotClientsUsage];
  }
  uint64_t v8 = [(PSDataUsageStatisticsCache *)self hotspotClientsUsage];
  int v9 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v10 = [v9 stringValue];
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];

  if (v11 && [v11 count])
  {
    uint64_t v29 = v11;
    unint64_t v30 = v6;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v11;
    uint64_t v34 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    unint64_t v12 = 0;
    if (v34)
    {
      unint64_t v35 = 0;
      uint64_t v33 = *(void *)v45;
      uint64_t v32 = *MEMORY[0x263F55F78];
      uint64_t v38 = *MEMORY[0x263F55F48];
      uint64_t v37 = *MEMORY[0x263F55F88];
      uint64_t v13 = *MEMORY[0x263F55F68];
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = [*(id *)(*((void *)&v44 + 1) + 8 * i) objectForKey:v32];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v36 = i;
            uint64_t v19 = *(void *)v41;
            while (2)
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v41 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                v22 = [v21 objectForKey:v38];
                id v23 = [v21 objectForKey:v37];
                int v24 = [v21 objectForKey:v13];
                uint64_t v25 = [v24 unsignedIntegerValue];
                v12 += v25 + [v23 unsignedIntegerValue];
                if ([v22 isEqualToString:v39])
                {
                  uint64_t v26 = [v24 unsignedIntegerValue];
                  v35 += v26 + [v23 unsignedIntegerValue];

                  goto LABEL_20;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
              if (v18) {
                continue;
              }
              break;
            }
LABEL_20:
            uint64_t i = v36;
          }
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v34);
    }
    else
    {
      unint64_t v35 = 0;
    }

    uint64_t v11 = v29;
    unint64_t v6 = v30;
    unint64_t v27 = v35;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v27 = 0;
  }
  if (([v39 isEqualToString:@"Others"] & (v6 > v12)) != 0) {
    unint64_t v27 = v6 - v12;
  }

  return v27;
}

- (id)usageForBundleID:(id)a3 inPeriod:(unint64_t)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  v7 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  uint64_t v8 = [v7 appDataUsageForPeriod:a4];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v63;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v15 = [v14 bundleId];
        char v16 = [v6 isEqualToString:v15];

        if (v16)
        {
          long long v40 = [v14 used];
          id v19 = v9;
          goto LABEL_41;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id obj = self;
  uint64_t v17 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  uint64_t v18 = [v17 proxiedOnlyAppDataUsageForPeriod:a4];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v59;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v59 != v22) {
          objc_enumerationMutation(v19);
        }
        int v24 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        uint64_t v25 = [v24 bundleId];
        char v26 = [v6 isEqualToString:v25];

        if (v26)
        {
          long long v40 = [v24 used];
          id v29 = v19;
          goto LABEL_40;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  unint64_t v27 = [(PSDataUsageStatisticsCache *)obj cachedDeviceDataUsage];
  unint64_t v47 = a4;
  uint64_t v28 = [v27 systemServiceDataUsageForPeriod:a4];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v29 = v28;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v55;
    while (2)
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*((void *)&v54 + 1) + 8 * k);
        unint64_t v35 = [v34 bundleId];
        char v36 = [v6 isEqualToString:v35];

        if (v36)
        {
          long long v40 = [v34 used];
          id v39 = v29;
          goto LABEL_39;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v54 objects:v67 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  uint64_t v37 = [(PSDataUsageStatisticsCache *)obj cachedDeviceDataUsage];
  uint64_t v38 = [v37 uninstalledAppDataUsageForPeriod:v47];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v39 = v38;
  long long v40 = (void *)[v39 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v51;
    id obja = v39;
    while (2)
    {
      for (m = 0; m != v40; m = (char *)m + 1)
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(obja);
        }
        long long v43 = *(void **)(*((void *)&v50 + 1) + 8 * (void)m);
        long long v44 = [v43 bundleId];
        char v45 = [v6 isEqualToString:v44];

        if (v45)
        {
          long long v40 = [v43 used];
          id v39 = obja;
          goto LABEL_38;
        }
      }
      id v39 = obja;
      long long v40 = (void *)[obja countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
  return v40;
}

- (id)wifiAssistUsageForPeriod:(unint64_t)a3
{
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  unint64_t v5 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  id v6 = [v5 totalWifiAssistUsageForPeriod:a3];

  return v6;
}

- (unint64_t)totalCellularUsageForPeriod:(unint64_t)a3
{
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  unint64_t v5 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  id v6 = [v5 totalDataUsedForPeriod:a3];

  v7 = [v6 native];
  uint64_t v8 = [v7 cellularHome];
  id v9 = [v6 native];
  uint64_t v10 = [v9 cellularRoaming] + v8;
  uint64_t v11 = [v6 proxied];
  uint64_t v12 = [v11 cellularHome];
  uint64_t v13 = [v6 proxied];
  unint64_t v14 = v10 + v12 + [v13 cellularRoaming];

  return v14;
}

- (unint64_t)totalRoamingUsageForPeriod:(unint64_t)a3
{
  [(PSDataUsageStatisticsCache *)self refreshCacheIfNeeded];
  unint64_t v5 = [(PSDataUsageStatisticsCache *)self cachedDeviceDataUsage];
  id v6 = [v5 totalDataUsedForPeriod:a3];

  v7 = [v6 native];
  uint64_t v8 = [v7 cellularRoaming];
  id v9 = [v6 proxied];
  unint64_t v10 = [v9 cellularRoaming] + v8;

  return v10;
}

- (void)fetchWorkspaceInfo
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSDataUsageStatisticsCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEBUG, "Fetching workspace info", buf, 2u);
  }

  client = self->_client;
  id v8 = 0;
  unint64_t v5 = [(CoreTelephonyClient *)client getCellularUsageWorkspaceInfo:&v8];
  id v6 = v8;
  if (v6)
  {
    v7 = [(PSDataUsageStatisticsCache *)self getLogger];
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_error_impl(&dword_2247E9000, &v7->super, OS_LOG_TYPE_ERROR, "Failed to get the data usage workspace information with error: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    [(PSDataUsageStatisticsCache *)v7 setWorkspaceInfo:v5];
    objc_sync_exit(v7);
  }
}

- (BOOL)billingCycleSupported
{
  uint64_t v3 = [(PSDataUsageStatisticsCache *)self workspaceInfo];

  if (!v3) {
    [(PSDataUsageStatisticsCache *)self fetchWorkspaceInfo];
  }
  id v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = [(PSDataUsageStatisticsCache *)v4 workspaceInfo];
  id v6 = [v5 billingCycleSupported];
  char v7 = [v6 BOOLValue];

  objc_sync_exit(v4);
  return v7;
}

- (BOOL)useCalendarMonthBillingCycle
{
  uint64_t v3 = [(PSDataUsageStatisticsCache *)self workspaceInfo];

  if (!v3) {
    [(PSDataUsageStatisticsCache *)self fetchWorkspaceInfo];
  }
  id v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = [(PSDataUsageStatisticsCache *)v4 workspaceInfo];
  id v6 = [v5 billingCycleSupported];
  char v7 = [v6 BOOLValue];

  id v8 = [(PSDataUsageStatisticsCache *)v4 workspaceInfo];
  id v9 = [v8 carrierSpaceSupported];
  char v10 = [v9 BOOLValue];

  objc_sync_exit(v4);
  return v7 & (v10 ^ 1);
}

- (id)billingCycleEndDate
{
  uint64_t v3 = [(PSDataUsageStatisticsCache *)self workspaceInfo];

  if (!v3) {
    [(PSDataUsageStatisticsCache *)self fetchWorkspaceInfo];
  }
  id v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = [(PSDataUsageStatisticsCache *)v4 workspaceInfo];
  id v6 = [v5 billingCycleEndDate];

  objc_sync_exit(v4);
  return v6;
}

- (id)previousBillingCycleEndDate
{
  uint64_t v3 = [(PSDataUsageStatisticsCache *)self workspaceInfo];

  if (!v3) {
    [(PSDataUsageStatisticsCache *)self fetchWorkspaceInfo];
  }
  id v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = [(PSDataUsageStatisticsCache *)v4 workspaceInfo];
  id v6 = [v5 previousBillingCycleDate];

  objc_sync_exit(v4);
  return v6;
}

- (void)_handleUsageOrInfoChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(PSDataUsageStatisticsCache *)self _clearCache];
  uint64_t v3 = [MEMORY[0x263F089F8] notificationWithName:@"PSWirelessDataUsageChangedNotification" object:0];
  id v4 = [(PSDataUsageStatisticsCache *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    char v7 = "-[PSDataUsageStatisticsCache _handleUsageOrInfoChanged]";
    __int16 v8 = 2112;
    id v9 = @"PSWirelessDataUsageChangedNotification";
    _os_log_impl(&dword_2247E9000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  unint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 performSelectorOnMainThread:sel_postNotification_ withObject:v3 waitUntilDone:0];
}

- (void)refreshDataUsageUINotification
{
  uint64_t v3 = [(PSDataUsageStatisticsCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received notification to refresh data usage UI", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PSDataUsageStatisticsCache_refreshDataUsageUINotification__block_invoke;
  block[3] = &unk_2646DEBC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__PSDataUsageStatisticsCache_refreshDataUsageUINotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUsageOrInfoChanged];
}

- (void)dataRatesChanged
{
  uint64_t v3 = [(PSDataUsageStatisticsCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Data Rates Changed.", v4, 2u);
  }

  [(PSDataUsageStatisticsCache *)self refreshDataUsageUINotification];
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:@"DataUsage"];
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (CTDeviceDataUsage)cachedDeviceDataUsage
{
  return (CTDeviceDataUsage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedDeviceDataUsage:(id)a3
{
}

- (BOOL)refreshInProgress
{
  return self->_refreshInProgress;
}

- (void)setRefreshInProgress:(BOOL)a3
{
  self->_refreshInProgress = a3;
}

- (id)refreshCompletionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRefreshCompletionHandler:(id)a3
{
}

- (CTCellularUsageWorkspaceInfo)workspaceInfo
{
  return (CTCellularUsageWorkspaceInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWorkspaceInfo:(id)a3
{
}

- (NSDictionary)hotspotClientsUsage
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHotspotClientsUsage:(id)a3
{
}

- (BOOL)cacheNeedsRefresh
{
  return self->_cacheNeedsRefresh;
}

- (void)setCacheNeedsRefresh:(BOOL)a3
{
  self->_cacheNeedsRefresh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotClientsUsage, 0);
  objc_storeStrong((id *)&self->_workspaceInfo, 0);
  objc_storeStrong(&self->_refreshCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedDeviceDataUsage, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end