@interface StockManager
+ (id)sharedManager;
+ (void)clearSharedManager;
- (BOOL)anyMarketOpen;
- (BOOL)setLocalStockListFromSyncableStockList:(id)a3;
- (StockManager)init;
- (id)_defaultStockDictionaries;
- (id)makeSyncableStockListFromList:(id)a3;
- (id)stockForURL:(id)a3;
- (id)stockWithSymbol:(id)a3;
- (id)stocksList;
- (void)DeleteChartData:(id)a3;
- (void)RemoveChartDataFromLRU:(id)a3;
- (void)UpdateChartDataInLRU:(id)a3;
- (void)_addStock:(id)a3 withRemoteNotification:(BOOL)a4;
- (void)_checkForAddedStocks;
- (void)_checkForDeletedStocks;
- (void)_checkForMovedStocks;
- (void)_removeStock:(id)a3 withRemoteNotification:(BOOL)a4;
- (void)_saveDataChangesWithStockDictionaries:(id)a3;
- (void)addStock:(id)a3;
- (void)clearCachedChartData;
- (void)clearCachedChartDataImageSets;
- (void)dealloc;
- (void)handleSyncedDataChanged:(id)a3;
- (void)moveStockFromIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)purgeTransientData;
- (void)reloadStocksFromDefaults;
- (void)removeStock:(id)a3;
- (void)saveDataChanges;
- (void)saveListChanges;
@end

@implementation StockManager

+ (id)sharedManager
{
  v2 = (void *)__sharedStockManager;
  if (!__sharedStockManager)
  {
    v3 = objc_alloc_init(StockManager);
    v4 = (void *)__sharedStockManager;
    __sharedStockManager = (uint64_t)v3;

    v2 = (void *)__sharedStockManager;
  }

  return v2;
}

+ (void)clearSharedManager
{
  v2 = (void *)__sharedStockManager;
  __sharedStockManager = 0;
}

- (StockManager)init
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v73.receiver = self;
  v73.super_class = (Class)StockManager;
  v2 = [(StockManager *)&v73 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldPostSyncNotifications = 1;
    if (([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG] & 1) == 0)
    {
      id v4 = +[ExchangeManager sharedManager];
      v5 = +[StocksPreferences sharedPreferences];
      [v5 synchronize];
      v60 = v5;
      id v6 = [v5 objectForKey:@"stocks"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
        stocksList = v3->_stocksList;
        v3->_stocksList = (NSMutableArray *)v8;

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v10 = v6;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v70;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v70 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [[Stock alloc] initWithDictionary:v15];
                if (v16) {
                  [(NSMutableArray *)v3->_stocksList addObject:v16];
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v69 objects:v78 count:16];
          }
          while (v12);
        }
      }
      uint64_t v17 = [MEMORY[0x263F08C40] defaultStore];
      syncedKVStore = v3->_syncedKVStore;
      v3->_syncedKVStore = (NSUbiquitousKeyValueStore *)v17;

      v19 = [MEMORY[0x263F08A00] defaultCenter];
      [v19 addObserver:v3 selector:sel_handleSyncedDataChanged_ name:*MEMORY[0x263F085E8] object:v3->_syncedKVStore];

      uint64_t v20 = [(NSUbiquitousKeyValueStore *)v3->_syncedKVStore arrayForKey:@"stocks"];
      v21 = [(StockManager *)v3 _defaultStockDictionaries];
      v58 = (void *)v20;
      v59 = v21;
      if (isKindOfClass)
      {
        BOOL v22 = 0;
      }
      else
      {
        v23 = StocksLogForCategory(1);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222ED9000, v23, OS_LOG_TYPE_DEFAULT, "#StockManager init - NO LOCAL DEFAULTS", buf, 2u);
        }

        if (v20)
        {
          v24 = StocksLogForCategory(1);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222ED9000, v24, OS_LOG_TYPE_DEFAULT, "#StockManager setting local stocks to synced stock list", buf, 2u);
          }

          BOOL v22 = [(StockManager *)v3 setLocalStockListFromSyncableStockList:v20];
        }
        else
        {
          id v25 = v21;

          uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v25, "count"));
          v27 = v3->_stocksList;
          v3->_stocksList = (NSMutableArray *)v26;

          long long v65 = 0u;
          long long v66 = 0u;
          BOOL v57 = [v25 count] != 0;
          long long v67 = 0u;
          long long v68 = 0u;
          id v6 = v25;
          uint64_t v28 = [v6 countByEnumeratingWithState:&v65 objects:v77 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v66;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v66 != v30) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v32 = *(void *)(*((void *)&v65 + 1) + 8 * j);
                v33 = StocksLogForCategory(1);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v76 = v32;
                  _os_log_impl(&dword_222ED9000, v33, OS_LOG_TYPE_DEFAULT, "#StockManager adding from default stocks: %@", buf, 0xCu);
                }

                v34 = [[Stock alloc] initWithDictionary:v32];
                [(NSMutableArray *)v3->_stocksList addObject:v34];
              }
              uint64_t v29 = [v6 countByEnumeratingWithState:&v65 objects:v77 count:16];
            }
            while (v29);
          }

          v21 = v59;
          BOOL v22 = v57;
        }
      }
      if (!v3->_stocksList)
      {
        v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        v36 = v3->_stocksList;
        v3->_stocksList = v35;
      }
      v37 = [v60 objectForKey:@"lastModified"];
      v38 = v37;
      if (v37)
      {
        [v37 doubleValue];
        v3->_lastModifiedTime = v39;
      }
      else
      {
        v40 = [MEMORY[0x263EFF910] date];
        [v40 timeIntervalSince1970];
        v3->_lastModifiedTime = v41;
      }
      uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v21, "count"));
      defaultListStockSymbols = v3->_defaultListStockSymbols;
      v3->_defaultListStockSymbols = (NSMutableArray *)v42;

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v44 = v6;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v74 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v62;
        do
        {
          for (uint64_t k = 0; k != v46; ++k)
          {
            if (*(void *)v62 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = v3->_defaultListStockSymbols;
            v50 = [*(id *)(*((void *)&v61 + 1) + 8 * k) objectForKey:@"symbol"];
            [(NSMutableArray *)v49 addObject:v50];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v61 objects:v74 count:16];
        }
        while (v46);
      }

      if (v22) {
        [(StockManager *)v3 saveListChanges];
      }
      if (DefaultStocksOverride)
      {
        [(NSMutableArray *)v3->_stocksList removeAllObjects];
        [(NSMutableArray *)v3->_stocksList addObjectsFromArray:DefaultStocksOverride];
      }
      v51 = [MEMORY[0x263F08A00] defaultCenter];
      [v51 addObserver:v3 selector:sel_clearCachedChartData name:*MEMORY[0x263F1D060] object:0];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)GizmoSettingsChanged, @"com.apple.stocks.PreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
      v53 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v53, v3->_stocksList, (CFNotificationCallback)StockWasModified, (CFStringRef)StockWasAddedDarwinNotification, v3, CFNotificationSuspensionBehaviorCoalesce);
      v54 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v54, v3->_stocksList, (CFNotificationCallback)StockWasModified, (CFStringRef)StockWasMovedDarwinNotification, v3, CFNotificationSuspensionBehaviorCoalesce);
      v55 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v55, v3->_stocksList, (CFNotificationCallback)StockWasModified, (CFStringRef)StockWasDeletedDarwinNotification, v3, CFNotificationSuspensionBehaviorCoalesce);
    }
  }
  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.stocks.PreferencesChangedNotification", 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self->_stocksList, (CFNotificationName)StockWasAddedDarwinNotification, self);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self->_stocksList, (CFNotificationName)StockWasMovedDarwinNotification, self);
  id v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self->_stocksList, (CFNotificationName)StockWasDeletedDarwinNotification, self);
  v7.receiver = self;
  v7.super_class = (Class)StockManager;
  [(StockManager *)&v7 dealloc];
}

- (id)stockForURL:(id)a3
{
  id v4 = +[Stock symbolForURL:a3];
  v5 = [(StockManager *)self stockWithSymbol:v4];

  return v5;
}

- (id)_defaultStockDictionaries
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  v3 = +[SCWatchlistDefaults defaultsForCurrentCountry];
  id v4 = +[SCWatchlistDefaults defaultsFromCarrierBundle];
  v14 = v3;
  v5 = [v3 defaultsByAppendingDefaults:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 defaultSymbols];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v19 = @"symbol";
        uint64_t v20 = v11;
        uint64_t v12 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v2 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }

  return v2;
}

- (void)reloadStocksFromDefaults
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = StocksLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222ED9000, v3, OS_LOG_TYPE_DEFAULT, "#StockManager reloadStocksFromDefaults", buf, 2u);
  }

  id v4 = +[ExchangeManager sharedManager];
  [v4 reloadExchangesFromDefaults];

  v5 = +[StocksPreferences sharedPreferences];
  [v5 synchronize];

  id v6 = +[StocksPreferences sharedPreferences];
  uint64_t v7 = [v6 objectForKey:@"stocks"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = v7;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [v13 objectForKey:@"symbol"];
            long long v15 = [(StockManager *)self stockWithSymbol:v14];

            if (v15) {
              [v15 populateFromDictionary:v13];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    long long v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 postNotificationName:@"StocksDidReloadFromDefaultsNotification" object:0];

    uint64_t v7 = v17;
  }
}

- (void)handleSyncedDataChanged:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x263F085D8]];
  unsigned int v6 = [v5 unsignedIntValue];

  uint64_t v7 = [(NSUbiquitousKeyValueStore *)self->_syncedKVStore arrayForKey:@"stocks"];
  id v8 = StocksLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v52 = v6;
    _os_log_impl(&dword_222ED9000, v8, OS_LOG_TYPE_DEFAULT, "#StockManager #sync changeReason: %lu", buf, 0xCu);
  }

  if (SyncedStocksOverride)
  {

    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_9;
  }
  if (v6 != 3 || v7 != 0)
  {
LABEL_9:
    v35 = v7;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v7];
    uint64_t v11 = v10;
    if (SyncedStocksOverride)
    {
      [v10 removeAllObjects];
      [v11 addObjectsFromArray:SyncedStocksOverride];
    }
    uint64_t v12 = [(NSMutableArray *)self->_stocksList count];
    if (v12 == [v11 count])
    {
      if (![(NSMutableArray *)self->_stocksList count])
      {
LABEL_45:

        return;
      }
      uint64_t v13 = 0;
      while (1)
      {
        v14 = [(NSMutableArray *)self->_stocksList objectAtIndex:v13];
        [v14 symbol];
        v16 = long long v15 = self;

        uint64_t v17 = [v11 objectAtIndex:v13];
        long long v18 = [(id)v17 objectForKey:@"symbol"];

        LOBYTE(v17) = [v16 isEqualToString:v18];
        self = v15;
        if ((v17 & 1) == 0) {
          break;
        }
        if ([(NSMutableArray *)v15->_stocksList count] <= (unint64_t)++v13) {
          goto LABEL_45;
        }
      }
    }
    unint64_t v19 = 0x263F08000uLL;
    if (self->_shouldPostSyncNotifications)
    {
      long long v20 = [MEMORY[0x263F08A00] defaultCenter];
      [v20 postNotificationName:StocksWillSyncNotification object:0];
    }
    switch(v6)
    {
      case 0u:
        goto LABEL_41;
      case 1u:
      case 3u:
        v36 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v11];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v34 = self;
        obuint64_t j = [(StockManager *)self makeSyncableStockListFromList:self->_stocksList];
        uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (!v40) {
          goto LABEL_37;
        }
        uint64_t v38 = *(void *)v46;
        double v39 = v11;
        break;
      case 2u:
        v31 = StocksLogForCategory(1);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222ED9000, v31, OS_LOG_TYPE_DEFAULT, "NSUbiquitousKeyValueStore Quota Violation", buf, 2u);
        }

LABEL_41:
        [(StockManager *)self setLocalStockListFromSyncableStockList:v11];
        goto LABEL_42;
      default:
        goto LABEL_42;
    }
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v23 = [v22 objectForKey:@"symbol"];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v24 = v11;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v42;
          while (2)
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v42 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = [*(id *)(*((void *)&v41 + 1) + 8 * j) objectForKey:@"symbol"];
              char v30 = [v23 isEqualToString:v29];

              if (v30)
              {

                goto LABEL_35;
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        [v36 addObject:v22];
LABEL_35:

        uint64_t v11 = v39;
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v40);
LABEL_37:

    self = v34;
    [(StockManager *)v34 setLocalStockListFromSyncableStockList:v36];

    unint64_t v19 = 0x263F08000;
LABEL_42:
    if (self->_shouldPostSyncNotifications)
    {
      uint64_t v32 = [*(id *)(v19 + 2560) defaultCenter];
      [v32 postNotificationName:StockListDidChangeNotification object:0];
    }
    [(StockManager *)self saveListChanges];
    v33 = [*(id *)(v19 + 2560) defaultCenter];
    [v33 postNotificationName:StockListDidSaveNotification object:0];

    goto LABEL_45;
  }
}

- (id)makeSyncableStockListFromList:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:SyncedPropertyNames count:4];
  if ([v3 count]
    && ([v3 objectAtIndex:0],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    unsigned int v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v38 + 1) + 8 * i) archiveDictionary];
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v9);
    }
  }
  else
  {
    unsigned int v6 = v3;
  }
  id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v6;
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v29, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v18 = v29;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v31;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * k);
              id v24 = [v16 objectForKey:v23];
              if (v24) {
                [v17 setObject:v24 forKey:v23];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v20);
        }

        [v28 addObject:v17];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v14);
  }

  return v28;
}

- (BOOL)setLocalStockListFromSyncableStockList:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableArray count](self->_stocksList, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v35 = self;
  unsigned int v6 = self->_stocksList;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v12 = [v11 symbol];
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v8);
  }

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  stocksList = v35->_stocksList;
  v35->_stocksList = (NSMutableArray *)v13;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v4;
  uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v36)
  {
    char v32 = 0;
    uint64_t v33 = *(void *)v38;
    *(void *)&long long v15 = 138412290;
    long long v30 = v15;
    long long v34 = v5;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        id v18 = objc_msgSend(v17, "objectForKey:", @"symbol", v30);
        uint64_t v19 = [v5 objectForKey:v18];

        uint64_t v20 = [v19 archiveDictionary];
        uint64_t v21 = (void *)[v20 mutableCopy];

        if (v21)
        {
          uint64_t v22 = 0;
          char v23 = 0;
          do
          {
            id v24 = SyncedPropertyNames[v22];
            uint64_t v25 = [v17 objectForKeyedSubscript:v24];
            uint64_t v26 = [v21 objectForKeyedSubscript:v24];
            if (([v26 isEqualToString:v25] & 1) == 0)
            {
              if (v25) {
                [v21 setObject:v25 forKeyedSubscript:v24];
              }
              else {
                [v21 removeObjectForKey:v24];
              }
              char v23 = 1;
            }

            ++v22;
          }
          while (v22 != 4);
          if (v23)
          {
            [v19 populateFromDictionary:v21];
            char v32 = 1;
          }
        }
        else
        {
          uint64_t v27 = [[Stock alloc] initWithDictionary:v17];

          char v32 = 1;
          uint64_t v19 = v27;
        }
        [(NSMutableArray *)v35->_stocksList addObject:v19];
        id v28 = StocksLogForCategory(1);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v30;
          long long v46 = v19;
          _os_log_impl(&dword_222ED9000, v28, OS_LOG_TYPE_DEFAULT, "#StockManager #sync setLocalStockListFromSyncableStockList adding stock: %@", buf, 0xCu);
        }

        v5 = v34;
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v36);
  }
  else
  {
    char v32 = 0;
  }

  return v32 & 1;
}

- (id)stocksList
{
  if (self->_stocksList) {
    return self->_stocksList;
  }
  else {
    return MEMORY[0x263EFFA68];
  }
}

- (id)stockWithSymbol:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_stocksList;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "symbol", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addStock:(id)a3
{
}

- (void)_addStock:(id)a3 withRemoteNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [(StockManager *)self stocksList];
  [v6 addObject:v12];

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:StockListDidChangeNotification object:0];

  uint64_t v8 = +[ExchangeManager sharedManager];
  uint64_t v9 = [v12 exchange];
  char v10 = [v8 containsExchange:v9];

  if ((v10 & 1) == 0)
  {
    char v11 = [v12 exchange];
    [v8 addExchange:v11];
  }
  if (v4) {
    self->_needRemoteAddNotification = 1;
  }
}

- (void)removeStock:(id)a3
{
}

- (void)_removeStock:(id)a3 withRemoteNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:StockWillBeRemovedNotification[0] object:v6];

  [(NSMutableArray *)self->_stocksList removeObjectIdenticalTo:v6];
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:StockListDidChangeNotification object:0];

  uint64_t v9 = [v6 exchange];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  stocksList = self->_stocksList;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  long long v15 = __52__StockManager__removeStock_withRemoteNotification___block_invoke;
  long long v16 = &unk_26467DD68;
  id v11 = v9;
  id v17 = v11;
  uint64_t v18 = &v19;
  [(NSMutableArray *)stocksList enumerateObjectsUsingBlock:&v13];
  if (!*((unsigned char *)v20 + 24))
  {
    id v12 = +[ExchangeManager sharedManager];
    [v12 removeExchange:v11];

    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4) {
LABEL_3:
  }
    self->_needRemoteDeleteNotification = 1;
LABEL_4:

  _Block_object_dispose(&v19, 8);
}

void __52__StockManager__removeStock_withRemoteNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 exchange];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)moveStockFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  -[NSMutableArray objectAtIndex:](self->_stocksList, "objectAtIndex:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_stocksList removeObjectAtIndex:a3];
  [(NSMutableArray *)self->_stocksList insertObject:v8 atIndex:a4];
  int v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:StockListDidChangeNotification object:0];

  self->_needRemoteMoveNotification = 1;
}

- (void)RemoveChartDataFromLRU:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    chartDataLRUCache = self->_chartDataLRUCache;
    id v9 = v5;
    if (chartDataLRUCache)
    {
      id v4 = (id)[(NSMutableArray *)chartDataLRUCache removeObjectIdenticalTo:v5];
    }
    else
    {
      int v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:50];
      id v8 = self->_chartDataLRUCache;
      self->_chartDataLRUCache = v7;
    }
    id v5 = v9;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)DeleteChartData:(id)a3
{
  id v3 = a3;
  id v5 = [v3 stock];
  uint64_t v4 = [v3 chartInterval];

  [v5 setChartData:0 forInterval:v4];
}

- (void)UpdateChartDataInLRU:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    [(StockManager *)self RemoveChartDataFromLRU:v4];
    if ([(NSMutableArray *)self->_chartDataLRUCache count] == 50)
    {
      id v6 = [(NSMutableArray *)self->_chartDataLRUCache objectAtIndex:0];
      [(StockManager *)self DeleteChartData:v6];
    }
    id v4 = (id)[(NSMutableArray *)self->_chartDataLRUCache addObject:v7];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)clearCachedChartData
{
  uint64_t v3 = [(NSMutableArray *)self->_chartDataLRUCache lastObject];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      [(StockManager *)self DeleteChartData:v4];
      uint64_t v5 = [(NSMutableArray *)self->_chartDataLRUCache lastObject];

      id v4 = (void *)v5;
    }
    while (v5);
  }
}

- (void)clearCachedChartDataImageSets
{
}

- (BOOL)anyMarketOpen
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_stocksList;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "marketIsOpen", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_saveDataChangesWithStockDictionaries:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  [v6 timeIntervalSince1970];
  self->_lastModifiedTime = v7;

  id v10 = +[StocksPreferences sharedPreferences];
  long long v8 = [NSNumber numberWithDouble:self->_lastModifiedTime];
  [v10 setObject:v8 forKey:@"lastModified"];

  [v10 setObject:v5 forKey:@"stocks"];
  [v10 synchronize];
  long long v9 = +[ExchangeManager sharedManager];
  [v9 saveChanges];
}

- (void)saveListChanges
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_stocksList, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v4 = self->_stocksList;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = [*(id *)(*((void *)&v27 + 1) + 8 * v8) archiveDictionary];
          if (v9) {
            [v3 addObject:v9];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v6);
    }

    id v10 = [(StockManager *)self makeSyncableStockListFromList:v3];
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "objectForKey:", @"symbol", (void)v23);
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [(NSUbiquitousKeyValueStore *)self->_syncedKVStore arrayForKey:@"stocks"];
    uint64_t v19 = v18;
    if (!v18
      || ([v18 isEqual:v12] & 1) == 0
      && ([v19 count]
       || ([(NSMutableArray *)self->_defaultListStockSymbols isEqual:v11] & 1) == 0))
    {
      [(NSUbiquitousKeyValueStore *)self->_syncedKVStore setObject:v12, @"stocks", (void)v23 forKey];
      [(NSUbiquitousKeyValueStore *)self->_syncedKVStore synchronize];
    }
    -[StockManager _saveDataChangesWithStockDictionaries:](self, "_saveDataChangesWithStockDictionaries:", v3, (void)v23);
    if (self->_needRemoteAddNotification)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)StockWasAddedDarwinNotification, 0, 0, 0);
      self->_needRemoteAddNotification = 0;
    }
    if (self->_needRemoteDeleteNotification)
    {
      uint64_t v21 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v21, (CFNotificationName)StockWasDeletedDarwinNotification, 0, 0, 0);
      self->_needRemoteDeleteNotification = 0;
    }
    if (self->_needRemoteMoveNotification)
    {
      char v22 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v22, (CFNotificationName)StockWasMovedDarwinNotification, 0, 0, 0);
      self->_needRemoteMoveNotification = 0;
    }
  }
}

- (void)saveDataChanges
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_stocksList, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_stocksList;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "archiveDictionary", (void)v10);
        if (v9) {
          [v3 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(StockManager *)self _saveDataChangesWithStockDictionaries:v3];
}

- (void)purgeTransientData
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = self->_stocksList;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v9 isTransient]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[StockManager _removeStock:withRemoteNotification:](self, "_removeStock:withRemoteNotification:", *(void *)(*((void *)&v15 + 1) + 8 * j), 0, (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_checkForAddedStocks
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[StocksPreferences sharedPreferences];
  [v3 synchronize];

  uint64_t v4 = +[StocksPreferences sharedPreferences];
  uint64_t v5 = [v4 objectForKey:@"lastModified"];

  if (v5)
  {
    double lastModifiedTime = self->_lastModifiedTime;
    [v5 doubleValue];
    if (lastModifiedTime < v7)
    {
      uint64_t v8 = +[StocksPreferences sharedPreferences];
      long long v9 = [v8 objectForKey:@"stocks"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          long long v19 = v9;
          char v20 = 0;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v16 = [v15 objectForKey:@"symbol"];
                if (v16)
                {
                  uint64_t v17 = [(StockManager *)self stockWithSymbol:v16];
                  if (v17)
                  {
                    long long v18 = (Stock *)v17;
                  }
                  else
                  {
                    long long v18 = [[Stock alloc] initWithDictionary:v15];
                    if (v18)
                    {
                      [(StockManager *)self _addStock:v18 withRemoteNotification:0];
                      char v20 = 1;
                    }
                  }
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v12);

          long long v9 = v19;
          if ((v20 & 1) == 0) {
            goto LABEL_22;
          }
          id v10 = [MEMORY[0x263F08A00] defaultCenter];
          [v10 postNotificationName:StockListDidChangeNotification object:0];
        }
      }
LABEL_22:
    }
  }
}

- (void)_checkForDeletedStocks
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[StocksPreferences sharedPreferences];
  [v3 synchronize];

  uint64_t v4 = +[StocksPreferences sharedPreferences];
  uint64_t v5 = [v4 objectForKey:@"lastModified"];

  if (v5)
  {
    double lastModifiedTime = self->_lastModifiedTime;
    [v5 doubleValue];
    if (lastModifiedTime < v7)
    {
      uint64_t v36 = v5;
      uint64_t v8 = +[StocksPreferences sharedPreferences];
      long long v9 = [v8 objectForKey:@"stocks"];

      id v10 = [MEMORY[0x263EFF980] array];
      uint64_t v11 = [MEMORY[0x263EFF980] array];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v12 = v9;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v18 = [v17 objectForKey:@"symbol"];
              if (v18) {
                [v10 addObject:v18];
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v14);
      }
      long long v35 = v12;

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v19 = self->_stocksList;
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            uint64_t v25 = objc_msgSend(v24, "symbol", v35);
            char v26 = [v10 containsObject:v25];

            if ((v26 & 1) == 0)
            {
              long long v27 = [v24 symbol];
              [v11 addObject:v27];
            }
          }
          uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v21);
      }

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v28 = v11;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = -[StockManager stockWithSymbol:](self, "stockWithSymbol:", *(void *)(*((void *)&v37 + 1) + 8 * k), v35);
            [(StockManager *)self _removeStock:v33 withRemoteNotification:0];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v49 count:16];
        }
        while (v30);
      }

      if ([v28 count])
      {
        long long v34 = [MEMORY[0x263F08A00] defaultCenter];
        [v34 postNotificationName:StockListDidChangeNotification object:0];
      }
      uint64_t v5 = v36;
    }
  }
}

- (void)_checkForMovedStocks
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[StocksPreferences sharedPreferences];
  [v3 synchronize];

  uint64_t v4 = +[StocksPreferences sharedPreferences];
  uint64_t v5 = [v4 objectForKey:@"lastModified"];

  if (v5)
  {
    double lastModifiedTime = self->_lastModifiedTime;
    [v5 doubleValue];
    if (lastModifiedTime < v7)
    {
      uint64_t v8 = +[StocksPreferences sharedPreferences];
      long long v9 = [v8 objectForKey:@"stocks"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = v5;
        id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v17 = [v16 objectForKey:@"symbol"];
                if (v17)
                {
                  long long v18 = [(StockManager *)self stockWithSymbol:v17];
                  if (v18) {
                    [v10 addObject:v18];
                  }
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v13);
        }

        if (([(NSMutableArray *)self->_stocksList isEqual:v10] & 1) == 0)
        {
          [(NSMutableArray *)self->_stocksList removeAllObjects];
          [(NSMutableArray *)self->_stocksList addObjectsFromArray:v10];
          long long v19 = [MEMORY[0x263F08A00] defaultCenter];
          [v19 postNotificationName:StockListDidChangeNotification object:0];
        }
        uint64_t v5 = v20;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedKVStore, 0);
  objc_storeStrong((id *)&self->_chartDataLRUCache, 0);
  objc_storeStrong((id *)&self->_stocksList, 0);

  objc_storeStrong((id *)&self->_defaultListStockSymbols, 0);
}

@end