@interface StockUpdateManager
+ (id)sharedManager;
- (BOOL)hadError;
- (BOOL)isLoading;
- (StockUpdateManager)init;
- (id)availableStockUpdater;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_kickoffUpdater:(id)a3 forStocks:(id)a4 comprehensive:(BOOL)a5 forceUpdate:(BOOL)a6 completion:(id)a7;
- (void)_stocksDidReload;
- (void)_updateStocksBasic:(id)a3 forced:(BOOL)a4 withCompletion:(id)a5;
- (void)_updaterDidCancelOrFinish:(id)a3;
- (void)addUpdateObserver:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)failWithError:(id)a3;
- (void)removeUpdateObserver:(id)a3;
- (void)reset;
- (void)resetUpdaters;
- (void)stockUpdater:(id)a3 didFailWithError:(id)a4 whileUpdatingStocks:(id)a5 comprehensive:(BOOL)a6;
- (void)stockUpdater:(id)a3 didRequestUpdateForStocks:(id)a4 isComprehensive:(BOOL)a5;
- (void)stockUpdater:(id)a3 didUpdateStocks:(id)a4 isComprehensive:(BOOL)a5;
- (void)stocksDidUpdateRemotely;
- (void)updateAllStocksBasic;
- (void)updateAllStocksBasic:(id)a3 withCompletion:(id)a4;
- (void)updateAllStocksBasicWithCompletion:(id)a3;
- (void)updateStaleStocksBasicWithCompletion:(id)a3;
- (void)updateStockBasicWithCompletion:(id)a3 withCompletion:(id)a4;
- (void)updateStockComprehensive:(id)a3;
- (void)updateStockComprehensive:(id)a3 forced:(BOOL)a4 withCompletion:(id)a5;
- (void)updateStockComprehensive:(id)a3 withCompletion:(id)a4;
- (void)updateStocksComprehensive:(id)a3;
@end

@implementation StockUpdateManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedManager___stockUpdaterInstance;

  return v2;
}

uint64_t __35__StockUpdateManager_sharedManager__block_invoke()
{
  sharedManager___stockUpdaterInstance = objc_alloc_init(StockUpdateManager);

  return MEMORY[0x270F9A758]();
}

- (StockUpdateManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)StockUpdateManager;
  v2 = [(StockUpdateManager *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeUpdaters = v2->_activeUpdaters;
    v2->_activeUpdaters = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    inactiveUpdaters = v2->_inactiveUpdaters;
    v2->_inactiveUpdaters = v5;

    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    updateObservers = v2->_updateObservers;
    v2->_updateObservers = (NSHashTable *)v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)stocksDidUpdateRemotely, @"StocksDidUpdateQuotesDarwin", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel__stocksDidReload name:@"StocksDidReloadFromDefaultsNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(StockUpdateManager *)self reset];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"StocksDidUpdateQuotesDarwin", 0);
  v4.receiver = self;
  v4.super_class = (Class)StockUpdateManager;
  [(StockUpdateManager *)&v4 dealloc];
}

- (void)stocksDidUpdateRemotely
{
  if (!self->_postingRemoteUpdateNotification)
  {
    v3 = +[StockManager sharedManager];
    [v3 reloadStocksFromDefaults];
  }
  self->_postingRemoteUpdateNotification = 0;
}

- (void)addUpdateObserver:(id)a3
{
}

- (void)removeUpdateObserver:(id)a3
{
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSHashTable *)self->_updateObservers allObjects];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__StockUpdateManager__enumerateObserversRespondingToSelector_usingBlock___block_invoke;
  v9[3] = &unk_26467D1E8;
  id v10 = v6;
  SEL v11 = a3;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __73__StockUpdateManager__enumerateObserversRespondingToSelector_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_stocksDidReload
{
  id v3 = +[StockManager sharedManager];
  objc_super v4 = [v3 stocksList];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__StockUpdateManager__stocksDidReload__block_invoke;
  v6[3] = &unk_26467D210;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(StockUpdateManager *)self _enumerateObserversRespondingToSelector:sel_stockUpdateManager_didUpdateStocks_updates_ usingBlock:v6];
}

uint64_t __38__StockUpdateManager__stocksDidReload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stockUpdateManager:*(void *)(a1 + 32) didUpdateStocks:*(void *)(a1 + 40) updates:1];
}

- (void)stockUpdater:(id)a3 didRequestUpdateForStocks:(id)a4 isComprehensive:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = 3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__StockUpdateManager_stockUpdater_didRequestUpdateForStocks_isComprehensive___block_invoke;
  v10[3] = &unk_26467D238;
  if (!v5) {
    uint64_t v8 = 1;
  }
  v10[4] = self;
  id v11 = v7;
  uint64_t v12 = v8;
  id v9 = v7;
  [(StockUpdateManager *)self _enumerateObserversRespondingToSelector:sel_stockUpdateManager_didRequestUpdateForStocks_updates_ usingBlock:v10];
}

uint64_t __77__StockUpdateManager_stockUpdater_didRequestUpdateForStocks_isComprehensive___block_invoke(void *a1, void *a2)
{
  return [a2 stockUpdateManager:a1[4] didRequestUpdateForStocks:a1[5] updates:a1[6]];
}

- (void)stockUpdater:(id)a3 didUpdateStocks:(id)a4 isComprehensive:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = 3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__StockUpdateManager_stockUpdater_didUpdateStocks_isComprehensive___block_invoke;
  v11[3] = &unk_26467D238;
  if (!v5) {
    uint64_t v8 = 1;
  }
  v11[4] = self;
  id v12 = v7;
  uint64_t v13 = v8;
  id v9 = v7;
  [(StockUpdateManager *)self _enumerateObserversRespondingToSelector:sel_stockUpdateManager_didUpdateStocks_updates_ usingBlock:v11];
  if (!v5)
  {
    self->_postingRemoteUpdateNotification = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"StocksDidUpdateQuotesDarwin", 0, 0, 1u);
  }
}

uint64_t __67__StockUpdateManager_stockUpdater_didUpdateStocks_isComprehensive___block_invoke(void *a1, void *a2)
{
  return [a2 stockUpdateManager:a1[4] didUpdateStocks:a1[5] updates:a1[6]];
}

- (void)stockUpdater:(id)a3 didFailWithError:(id)a4 whileUpdatingStocks:(id)a5 comprehensive:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__StockUpdateManager_stockUpdater_didFailWithError_whileUpdatingStocks_comprehensive___block_invoke;
  v15[3] = &unk_26467D260;
  uint64_t v12 = 3;
  if (!v6) {
    uint64_t v12 = 1;
  }
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  uint64_t v18 = v12;
  id v13 = v9;
  id v14 = v11;
  [(StockUpdateManager *)self _enumerateObserversRespondingToSelector:sel_stockUpdateManager_failedToUpdateStocks_updates_error_ usingBlock:v15];
}

uint64_t __86__StockUpdateManager_stockUpdater_didFailWithError_whileUpdatingStocks_comprehensive___block_invoke(void *a1, void *a2)
{
  return [a2 stockUpdateManager:a1[4] failedToUpdateStocks:a1[5] updates:a1[7] error:a1[6]];
}

- (void)resetUpdaters
{
  [(NSMutableArray *)self->_activeUpdaters makeObjectsPerformSelector:sel_cancel];
  [(NSMutableArray *)self->_inactiveUpdaters addObjectsFromArray:self->_activeUpdaters];
  activeUpdaters = self->_activeUpdaters;

  [(NSMutableArray *)activeUpdaters removeAllObjects];
}

- (id)availableStockUpdater
{
  if ([(NSMutableArray *)self->_inactiveUpdaters count])
  {
    id v3 = [(NSMutableArray *)self->_inactiveUpdaters lastObject];
    [(NSMutableArray *)self->_inactiveUpdaters removeLastObject];
  }
  else
  {
    id v3 = objc_opt_new();
    [v3 setDelegate:self];
  }
  [(NSMutableArray *)self->_activeUpdaters addObject:v3];

  return v3;
}

- (BOOL)isLoading
{
  return [(NSMutableArray *)self->_activeUpdaters count] != 0;
}

- (BOOL)hadError
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_inactiveUpdaters;
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
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "hadError", (void)v7))
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

- (void)failWithError:(id)a3
{
}

- (void)cancel
{
  [(NSMutableArray *)self->_activeUpdaters makeObjectsPerformSelector:sel_cancel];
  inactiveUpdaters = self->_inactiveUpdaters;

  [(NSMutableArray *)inactiveUpdaters makeObjectsPerformSelector:sel_cancel];
}

- (void)reset
{
  [(NSMutableArray *)self->_activeUpdaters makeObjectsPerformSelector:sel_cancelAndInvalidate];
  [(NSMutableArray *)self->_inactiveUpdaters makeObjectsPerformSelector:sel_cancelAndInvalidate];
  [(NSMutableArray *)self->_activeUpdaters removeAllObjects];
  inactiveUpdaters = self->_inactiveUpdaters;

  [(NSMutableArray *)inactiveUpdaters removeAllObjects];
}

- (void)updateStocksComprehensive:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = StocksLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = +[NetPreferences sharedPreferences];
    int v7 = [v6 isNetworkReachable];
    long long v8 = "NO";
    if (v7) {
      long long v8 = "YES";
    }
    int v12 = 136315138;
    id v13 = v8;
    _os_log_impl(&dword_222ED9000, v5, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStocksComprehensive (reachable: %s)", (uint8_t *)&v12, 0xCu);
  }
  if ([v4 count])
  {
    long long v9 = +[NetPreferences sharedPreferences];
    int v10 = [v9 isNetworkReachable];

    if (v10)
    {
      id v11 = [(StockUpdateManager *)self availableStockUpdater];
      [(StockUpdateManager *)self _kickoffUpdater:v11 forStocks:v4 comprehensive:1 forceUpdate:0 completion:0];
    }
  }
}

- (void)updateStockComprehensive:(id)a3
{
}

- (void)updateStockComprehensive:(id)a3 withCompletion:(id)a4
{
}

- (void)updateStockComprehensive:(id)a3 forced:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v8
    && (+[NetPreferences sharedPreferences],
        int v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isNetworkReachable],
        v10,
        (v11 & 1) != 0))
  {
    BOOL v30 = v6;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    int v12 = self->_activeUpdaters;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v17 isComprehensive])
          {
            uint64_t v18 = [v17 requestStocks];
            int v19 = [v18 containsObject:v8];

            if (v19)
            {
              v26 = StocksLogForCategory(0);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v27 = [v8 symbol];
                *(_DWORD *)buf = 138412290;
                v40 = v27;
                _os_log_impl(&dword_222ED9000, v26, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStockComprehensive rolling update for %@ into existing update request", buf, 0xCu);
              }
              v28 = [v17 updateCompletionHandler];
              v31[0] = MEMORY[0x263EF8330];
              v31[1] = 3221225472;
              v31[2] = __69__StockUpdateManager_updateStockComprehensive_forced_withCompletion___block_invoke;
              v31[3] = &unk_26467D288;
              id v32 = v28;
              id v33 = v9;
              id v29 = v28;
              [v17 setUpdateCompletionHandler:v31];

              goto LABEL_22;
            }
          }
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    int v12 = [(StockUpdateManager *)self availableStockUpdater];
    v20 = StocksLogForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v8 symbol];
      v22 = +[NetPreferences sharedPreferences];
      int v23 = [v22 isNetworkReachable];
      v24 = "NO";
      if (v23) {
        v24 = "YES";
      }
      *(_DWORD *)buf = 138412546;
      v40 = v21;
      __int16 v41 = 2080;
      v42 = v24;
      _os_log_impl(&dword_222ED9000, v20, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStockComprehensive: %@ (reachable: %s)", buf, 0x16u);
    }
    id v38 = v8;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    [(StockUpdateManager *)self _kickoffUpdater:v12 forStocks:v25 comprehensive:1 forceUpdate:v30 completion:v9];

LABEL_22:
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

uint64_t __69__StockUpdateManager_updateStockComprehensive_forced_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v9);
  }

  return MEMORY[0x270F9A790]();
}

- (void)updateAllStocksBasic
{
}

- (void)updateAllStocksBasic:(id)a3 withCompletion:(id)a4
{
}

- (void)updateStockBasicWithCompletion:(id)a3 withCompletion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[StockUpdateManager _updateStocksBasic:forced:withCompletion:](self, "_updateStocksBasic:forced:withCompletion:", v9, 1, v7, v10, v11);
}

- (void)updateAllStocksBasicWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[StockManager sharedManager];
  id v6 = [v5 stocksList];

  [(StockUpdateManager *)self _updateStocksBasic:v6 forced:1 withCompletion:v4];
}

- (void)updateStaleStocksBasicWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[StockManager sharedManager];
  id v6 = [v5 stocksList];

  id v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_47];
  id v8 = [v6 objectsAtIndexes:v7];

  id v9 = StocksLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_222ED9000, v9, OS_LOG_TYPE_DEFAULT, "#StockUpdater Found stale stocks for basic update: %@", (uint8_t *)&v10, 0xCu);
  }

  [(StockUpdateManager *)self _updateStocksBasic:v8 forced:0 withCompletion:v4];
}

uint64_t __59__StockUpdateManager_updateStaleStocksBasicWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isQuoteStale];
}

- (void)_updateStocksBasic:(id)a3 forced:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([v8 count]
    && (+[NetPreferences sharedPreferences],
        int v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isNetworkReachable],
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = StocksLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = +[NetPreferences sharedPreferences];
      int v14 = [v13 isNetworkReachable];
      uint64_t v15 = "NO";
      if (v14) {
        uint64_t v15 = "YES";
      }
      int v17 = 136315138;
      uint64_t v18 = v15;
      _os_log_impl(&dword_222ED9000, v12, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStocksBasic (reachable: %s)", (uint8_t *)&v17, 0xCu);
    }
    id v16 = [(StockUpdateManager *)self availableStockUpdater];
    [(StockUpdateManager *)self _kickoffUpdater:v16 forStocks:v8 comprehensive:0 forceUpdate:v6 completion:v9];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)_kickoffUpdater:(id)a3 forStocks:(id)a4 comprehensive:(BOOL)a5 forceUpdate:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  objc_initWeak(&location, v12);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __85__StockUpdateManager__kickoffUpdater_forStocks_comprehensive_forceUpdate_completion___block_invoke;
  uint64_t v19 = &unk_26467D2D0;
  v20 = self;
  objc_copyWeak(&v22, &location);
  id v15 = v14;
  id v21 = v15;
  [v12 setUpdateCompletionHandler:&v16];
  objc_msgSend(v12, "_updateStocks:comprehensive:forceUpdate:", v13, v9, v8, v16, v17, v18, v19, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __85__StockUpdateManager__kickoffUpdater_forStocks_comprehensive_forceUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v5 _updaterDidCancelOrFinish:WeakRetained];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (void)_updaterDidCancelOrFinish:(id)a3
{
  inactiveUpdaters = self->_inactiveUpdaters;
  id v5 = a3;
  [(NSMutableArray *)inactiveUpdaters addObject:v5];
  [(NSMutableArray *)self->_activeUpdaters removeObject:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateObservers, 0);
  objc_storeStrong((id *)&self->_inactiveUpdaters, 0);

  objc_storeStrong((id *)&self->_activeUpdaters, 0);
}

@end