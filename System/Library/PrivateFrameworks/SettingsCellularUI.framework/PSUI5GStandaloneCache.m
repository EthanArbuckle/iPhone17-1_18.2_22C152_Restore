@interface PSUI5GStandaloneCache
+ (PSUI5GStandaloneCache)sharedInstance;
- (BOOL)are5GRATModesUserInteractableForContext:(id)a3;
- (BOOL)is5GSAEnabledForContext:(id)a3;
- (BOOL)is5GSASupportedForContext:(id)a3;
- (BOOL)is5GSASwitchUserInteractableForContext:(id)a3;
- (NSMutableDictionary)NRStatusDict;
- (NSMutableDictionary)SAEnabledDict;
- (PSUI5GStandaloneCache)init;
- (PSUI5GStandaloneCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4;
- (id)getLogger;
- (id)initPrivate;
- (id)set5GSAEnabled:(BOOL)a3 forContext:(id)a4;
- (unint64_t)getNSADisableStatusReasonMaskForContext:(id)a3;
- (unint64_t)getSADisableStatusReasonMaskForContext:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)clearCache;
- (void)clearCacheAndRefresh;
- (void)currentDataSimChanged:(id)a3;
- (void)dealloc;
- (void)fetch5GSupportAndEnabledStatusIfNeeded;
- (void)fetchNRStatus;
- (void)notifyClientsNeedRefresh;
- (void)nrDisableStatusChanged:(id)a3 status:(id)a4;
- (void)setNRStatusDict:(id)a3;
- (void)setSAEnabledDict:(id)a3;
@end

@implementation PSUI5GStandaloneCache

+ (PSUI5GStandaloneCache)sharedInstance
{
  if (qword_26AC322D8 != -1) {
    dispatch_once(&qword_26AC322D8, &__block_literal_global_13);
  }
  v2 = (void *)_MergedGlobals_65;
  return (PSUI5GStandaloneCache *)v2;
}

uint64_t __39__PSUI5GStandaloneCache_sharedInstance__block_invoke()
{
  _MergedGlobals_65 = [[PSUI5GStandaloneCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  id v3 = objc_alloc(MEMORY[0x263F02D30]);
  v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"5G_SA_cache"];
  v5 = (void *)[v3 initWithQueue:v4];

  v6 = [MEMORY[0x263F67EF0] sharedInstance];
  v7 = [(PSUI5GStandaloneCache *)self initWithCoreTelephonyClient:v5 simStatusCache:v6];

  return v7;
}

- (PSUI5GStandaloneCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUI5GStandaloneCache;
  v9 = [(PSUI5GStandaloneCache *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    [(CoreTelephonyClient *)v10->_client setDelegate:v10];
    objc_storeStrong((id *)&v10->_simStatusCache, a4);
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v10 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];

    [(PSUI5GStandaloneCache *)v10 clearCache];
    [(PSUI5GStandaloneCache *)v10 fetchNRStatus];
  }

  return v10;
}

- (PSUI5GStandaloneCache)init
{
  v2 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUI5GStandaloneCache;
  [(PSUI5GStandaloneCache *)&v4 dealloc];
}

- (BOOL)is5GSASupportedForContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v4 = (__CFString *)a3;
  v5 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_INFO, "5GSA Support status request for context: %@", (uint8_t *)&v15, 0xCu);
  }

  [(PSUI5GStandaloneCache *)self fetchNRStatus];
  v6 = self;
  objc_sync_enter(v6);
  NRStatusDict = v6->_NRStatusDict;
  id v8 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v4];
  v9 = [v8 instance];
  v10 = [(NSMutableDictionary *)NRStatusDict objectForKeyedSubscript:v9];

  int v11 = [v10 isSASwitchVisible];
  objc_sync_exit(v6);

  v12 = [(PSUI5GStandaloneCache *)v6 getLogger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_super v13 = @"NOT SUPPORTED";
    if (v11) {
      objc_super v13 = @"SUPPORTED";
    }
    int v15 = 138412546;
    v16 = v13;
    __int16 v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_INFO, "5GSA %@ for context: %@", (uint8_t *)&v15, 0x16u);
  }

  return v11;
}

- (BOOL)is5GSAEnabledForContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v4 = (__CFString *)a3;
  v5 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    int v15 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_INFO, "5GSA Enabled status request for context: %@", (uint8_t *)&v14, 0xCu);
  }

  [(PSUI5GStandaloneCache *)self fetch5GSupportAndEnabledStatusIfNeeded];
  v6 = self;
  objc_sync_enter(v6);
  SAEnabledDict = v6->_SAEnabledDict;
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString slotID](v4, "slotID"));
  v9 = [(NSMutableDictionary *)SAEnabledDict objectForKeyedSubscript:v8];
  int v10 = [v9 BOOLValue];

  objc_sync_exit(v6);
  int v11 = [(PSUI5GStandaloneCache *)v6 getLogger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = @"DISABLED";
    if (v10) {
      v12 = @"ENABLED";
    }
    int v14 = 138412546;
    int v15 = v12;
    __int16 v16 = 2112;
    __int16 v17 = v4;
    _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_INFO, "5GSA %@ for context: %@", (uint8_t *)&v14, 0x16u);
  }

  return v10;
}

- (id)set5GSAEnabled:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"DISABLED";
    if (v4) {
      id v8 = @"ENABLED";
    }
    int v13 = 138412546;
    int v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_INFO, "Setting 5GSA Enabled status to: %@ for context: %@", (uint8_t *)&v13, 0x16u);
  }

  client = self->_client;
  int v10 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v6];
  int v11 = [(CoreTelephonyClient *)client setSupports5GStandalone:v10 enabled:v4];

  if (!v11)
  {
    [(PSUI5GStandaloneCache *)self clearCache];
    [(PSUI5GStandaloneCache *)self fetchNRStatus];
  }

  return v11;
}

- (BOOL)is5GSASwitchUserInteractableForContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v4 = (__CFString *)a3;
  v5 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_INFO, "5GSA Switch User Interactive status request for context: %@", (uint8_t *)&v15, 0xCu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  NRStatusDict = v6->_NRStatusDict;
  id v8 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v4];
  v9 = [v8 instance];
  int v10 = [(NSMutableDictionary *)NRStatusDict objectForKeyedSubscript:v9];

  int v11 = [v10 isSASwitchConfigurable];
  objc_sync_exit(v6);

  v12 = [(PSUI5GStandaloneCache *)v6 getLogger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = @"NOT INTERACTABLE";
    if (v11) {
      int v13 = @"INTERACTABLE";
    }
    int v15 = 138412546;
    id v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_INFO, "5GSA Switch is User Interactive %@ for context: %@", (uint8_t *)&v15, 0x16u);
  }

  return v11;
}

- (unint64_t)getSADisableStatusReasonMaskForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  NRStatusDict = v5->_NRStatusDict;
  id v7 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v4];
  id v8 = [v7 instance];
  v9 = [(NSMutableDictionary *)NRStatusDict objectForKeyedSubscript:v8];

  unint64_t v10 = [v9 saDisabledReasonMask];
  objc_sync_exit(v5);

  int v11 = [(PSUI5GStandaloneCache *)v5 getLogger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 134218242;
    unint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_INFO, "5GSA Switch reasonMask %lu for context: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (BOOL)are5GRATModesUserInteractableForContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  v5 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_INFO, "5G RAT Modes User Interactive status request for context: %@", (uint8_t *)&v15, 0xCu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  NRStatusDict = v6->_NRStatusDict;
  id v8 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v4];
  v9 = [v8 instance];
  unint64_t v10 = [(NSMutableDictionary *)NRStatusDict objectForKeyedSubscript:v9];

  int v11 = [v10 are5GRATModeCellsUserInteractable];
  objc_sync_exit(v6);

  v12 = [(PSUI5GStandaloneCache *)v6 getLogger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = @"NOT INTERACTABLE";
    if (v11) {
      int v13 = @"INTERACTABLE";
    }
    int v15 = 138412546;
    id v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_INFO, "5G RAT Modes User Interactive %@ for context: %@", (uint8_t *)&v15, 0x16u);
  }

  return v11;
}

- (unint64_t)getNSADisableStatusReasonMaskForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  NRStatusDict = v5->_NRStatusDict;
  id v7 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v4];
  id v8 = [v7 instance];
  v9 = [(NSMutableDictionary *)NRStatusDict objectForKeyedSubscript:v8];

  unint64_t v10 = [v9 nsaDisabledReasonMask];
  objc_sync_exit(v5);

  int v11 = [(PSUI5GStandaloneCache *)v5 getLogger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 134218242;
    unint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_INFO, "5G NSA reasonMask %lu for context: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)fetch5GSupportAndEnabledStatusIfNeeded
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  BOOL cacheNeedsRefresh = v2->_cacheNeedsRefresh;
  objc_sync_exit(v2);

  if (cacheNeedsRefresh)
  {
    id v4 = [(PSUI5GStandaloneCache *)v2 getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Fetching SA Support and Enabled Status", buf, 2u);
    }

    v5 = [(PSSimStatusCache *)v2->_simStatusCache subscriptionContexts];
    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v26;
      *(void *)&long long v7 = 138412546;
      long long v21 = v7;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          unint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          int v11 = objc_msgSend(MEMORY[0x263F02CD8], "descriptorWithSubscriptionContext:", v10, v21);
          client = v2->_client;
          id v24 = 0;
          int v13 = [(CoreTelephonyClient *)client getSupports5GStandalone:v11 error:&v24];
          unint64_t v14 = (__CFString *)v24;
          uint64_t v15 = [v13 BOOLValue];

          id v16 = [(PSUI5GStandaloneCache *)v2 getLogger];
          uint64_t v17 = v16;
          if (v14)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              v30 = v10;
              __int16 v31 = 2112;
              v32 = v14;
              _os_log_error_impl(&dword_221B17000, v17, OS_LOG_TYPE_ERROR, "SA Support and Enabled Status Fetch failed for context: %@, %@", buf, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              uint64_t v18 = @"DISABLED";
              if (v15) {
                uint64_t v18 = @"ENABLED";
              }
              v30 = v10;
              __int16 v31 = 2112;
              v32 = v18;
              _os_log_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEFAULT, "SA Support and Enabled Status Fetch succeeded for context: %@, %@", buf, 0x16u);
            }

            uint64_t v17 = [NSNumber numberWithBool:v15];
            uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "slotID"));
            [v22 setObject:v17 forKeyedSubscript:v19];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v6);
    }

    v20 = v2;
    objc_sync_enter(v20);
    [(PSUI5GStandaloneCache *)v20 setSAEnabledDict:v22];
    v2->_BOOL cacheNeedsRefresh = 0;
    objc_sync_exit(v20);
  }
}

- (void)fetchNRStatus
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Fetching NR status", buf, 2u);
  }

  id v4 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v6 = 138412546;
    long long v20 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        client = self->_client;
        int v11 = objc_msgSend(MEMORY[0x263F02CD8], "descriptorWithSubscriptionContext:", v9, v20);
        id v23 = 0;
        v12 = [(CoreTelephonyClient *)client getNRStatus:v11 error:&v23];
        int v13 = (__CFString *)v23;

        if (v13)
        {
          unint64_t v14 = [(PSUI5GStandaloneCache *)self getLogger];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            uint64_t v29 = v9;
            __int16 v30 = 2112;
            __int16 v31 = v13;
            _os_log_error_impl(&dword_221B17000, v14, OS_LOG_TYPE_ERROR, "NR status fetch failed for context: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          unint64_t v14 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v9];
          uint64_t v15 = [(PSUI5GStandaloneCache *)self getLogger];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = [v12 isSADisabled];
            *(_DWORD *)buf = v20;
            uint64_t v17 = @"SA ENABLED";
            if (v16) {
              uint64_t v17 = @"SA DISABLED";
            }
            uint64_t v29 = v9;
            __int16 v30 = 2112;
            __int16 v31 = v17;
            _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "NR status fetch succeeded for context: %@, %@", buf, 0x16u);
          }

          uint64_t v18 = [v14 instance];
          [v21 setObject:v12 forKeyedSubscript:v18];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }

  uint64_t v19 = self;
  objc_sync_enter(v19);
  [(PSUI5GStandaloneCache *)v19 setNRStatusDict:v21];
  objc_sync_exit(v19);
}

- (void)clearCache
{
  id v3 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Clearing SA Status cache", v7, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL cacheNeedsRefresh = 1;
  NRStatusDict = v4->_NRStatusDict;
  v4->_NRStatusDict = 0;

  SAEnabledDict = v4->_SAEnabledDict;
  v4->_SAEnabledDict = 0;

  objc_sync_exit(v4);
}

- (void)notifyClientsNeedRefresh
{
  v2 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "Notifying SA Cache Clients should refresh", v4, 2u);
  }

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"PSUI5GStandaloneCacheRefreshNotification" object:0];
}

- (void)clearCacheAndRefresh
{
  [(PSUI5GStandaloneCache *)self clearCache];
  [(PSUI5GStandaloneCache *)self fetchNRStatus];
  [(PSUI5GStandaloneCache *)self notifyClientsNeedRefresh];
}

- (void)nrDisableStatusChanged:(id)a3 status:(id)a4
{
  uint64_t v5 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v6 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Recieved NR Disable Status Changed, updating SA Option Enabled status", v6, 2u);
  }

  [(PSUI5GStandaloneCache *)self clearCacheAndRefresh];
}

- (void)currentDataSimChanged:(id)a3
{
  id v4 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Recieved Current Data Sim Changed, updating all info.", v5, 2u);
  }

  [(PSUI5GStandaloneCache *)self clearCacheAndRefresh];
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = [(PSUI5GStandaloneCache *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Recieved Carrier Bundle Changed, updating all info.", v5, 2u);
  }

  [(PSUI5GStandaloneCache *)self clearCacheAndRefresh];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"SACache"];
}

- (NSMutableDictionary)SAEnabledDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSAEnabledDict:(id)a3
{
}

- (NSMutableDictionary)NRStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNRStatusDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NRStatusDict, 0);
  objc_storeStrong((id *)&self->_SAEnabledDict, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end