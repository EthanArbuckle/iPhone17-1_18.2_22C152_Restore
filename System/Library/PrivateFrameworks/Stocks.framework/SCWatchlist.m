@interface SCWatchlist
+ (id)supportedCommands;
+ (id)zoneMergeHandler;
+ (id)zoneSchema;
- (NSHashTable)observers;
- (OS_dispatch_queue)callbackQueue;
- (SCKDatabase)database;
- (SCKStartupQueue)startupQueue;
- (SCWatchlist)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaults:(id)a5;
- (SCWatchlist)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaultsProvider:(id)a5;
- (SCWatchlistDefaultsProviding)defaultsProvider;
- (SCWatchlistMetadataProviding)metadataProvider;
- (id)_sortedStocks:(id)a3 withSymbolOrder:(id)a4;
- (void)_enqueueStartupSequence;
- (void)addObserver:(id)a3;
- (void)addStock:(id)a3 completion:(id)a4;
- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6;
- (void)fetchStocksWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeStock:(id)a3 completion:(id)a4;
- (void)removeSymbol:(id)a3 completion:(id)a4;
- (void)reorderStock:(id)a3 toIndex:(unint64_t)a4 completion:(id)a5;
- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 completion:(id)a5;
- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 completion:(id)a5;
- (void)setCallbackQueue:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDefaultsProvider:(id)a3;
- (void)setMetadataProvider:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)synchronize;
@end

@implementation SCWatchlist

- (SCWatchlist)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaultsProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SCWatchlist;
  v12 = [(SCWatchlist *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v13->_metadataProvider, a4);
    objc_storeStrong((id *)&v13->_defaultsProvider, a5);
    uint64_t v14 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v16 = [[SCKStartupQueue alloc] initWithDeferredStartup:1];
    startupQueue = v13->_startupQueue;
    v13->_startupQueue = v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("SCWatchlist.callback", v18);
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v19;

    [v9 addObserver:v13 forZone:@"Watchlist"];
    [(SCWatchlist *)v13 _enqueueStartupSequence];
  }

  return v13;
}

- (SCWatchlist)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaults:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[SCWatchlistInlineDefaultsProvider alloc] initWithDefaults:v8];

  v12 = [(SCWatchlist *)self initWithDatabase:v10 metadataProvider:v9 defaultsProvider:v11];
  return v12;
}

- (void)fetchStocksWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SCWatchlist *)self startupQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke;
  v7[3] = &unk_26467D418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterStartup:v7];
}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_2;
  id v8 = &unk_26467D4B8;
  id v2 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v2;
  v3 = (void *)MEMORY[0x223CABDA0](&v5);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  [v4 readContentsOfZone:@"Watchlist" withBlock:v3];
}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_3;
    v18[3] = &unk_26467D440;
    id v19 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = v7;
    __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_3((id *)v18);

    id v8 = v19;
  }
  else
  {
    id v8 = [a2 recordWithName:@"watchlist"];
    uint64_t v9 = [v8 encryptedValuesByKey];
    id v10 = [v9 objectForKeyedSubscript:@"symbols"];

    id v11 = StocksLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_222ED9000, v11, OS_LOG_TYPE_DEFAULT, "fetch stocks CK record ordered symbols: %@", buf, 0xCu);
    }

    v12 = [*(id *)(a1 + 32) metadataProvider];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_12;
    v15[3] = &unk_26467D490;
    v13 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v10;
    id v17 = v13;
    id v14 = v10;
    [v12 fetchMetadataForSymbols:v14 completion:v15];
  }
}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_3(id *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_222ED9000, v2, OS_LOG_TYPE_DEFAULT, "fetch stocks read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    id v4 = [a1[5] callbackQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_10;
    v5[3] = &unk_26467D418;
    id v7 = a1[6];
    id v6 = a1[4];
    dispatch_async(v4, v5);
  }
}

uint64_t __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = StocksLogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_222ED9000, v7, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provider returned stocks: %@", buf, 0xCu);
  }

  id v8 = [*(id *)(a1 + 32) _sortedStocks:v5 withSymbolOrder:*(void *)(a1 + 40)];
  id v9 = StocksLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_222ED9000, v9, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provided ordered stocks: %@", buf, 0xCu);
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v10 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_13;
    block[3] = &unk_26467D468;
    id v14 = *(id *)(a1 + 48);
    id v12 = v8;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_13(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addStock:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [(SCWatchlist *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__SCWatchlist_addStock_completion___block_invoke;
    block[3] = &unk_26467D4E0;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __35__SCWatchlist_addStock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeSymbol:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [(SCWatchlist *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SCWatchlist_removeSymbol_completion___block_invoke;
    block[3] = &unk_26467D4E0;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __39__SCWatchlist_removeSymbol_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 completion:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    id v7 = [(SCWatchlist *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__SCWatchlist_reorderSymbol_afterSymbol_completion___block_invoke;
    block[3] = &unk_26467D4E0;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __52__SCWatchlist_reorderSymbol_afterSymbol_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 completion:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    id v7 = [(SCWatchlist *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SCWatchlist_replaceSymbol_withSymbol_completion___block_invoke;
    block[3] = &unk_26467D4E0;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __51__SCWatchlist_replaceSymbol_withSymbol_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWatchlist *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWatchlist *)self observers];
  [v5 removeObject:v4];
}

- (void)synchronize
{
  id v2 = [(SCWatchlist *)self database];
  [v2 synchronize];
}

- (void)removeStock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 symbol];
  [(SCWatchlist *)self removeSymbol:v7 completion:v6];
}

- (void)reorderStock:(id)a3 toIndex:(unint64_t)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = [(SCWatchlist *)self startupQueue];
  [v7 executeAfterStartup:&__block_literal_global_6];

  if (v6)
  {
    id v8 = [(SCWatchlist *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__SCWatchlist_reorderStock_toIndex_completion___block_invoke_2;
    block[3] = &unk_26467D4E0;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __47__SCWatchlist_reorderStock_toIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)zoneSchema
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = [[SCKRecordFieldSchema alloc] initWithName:@"symbols" valueClass:objc_opt_class() required:1 encrypted:1];
  v10[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v4 = [[SCKRecordSchema alloc] initWithRecordType:@"Watchlist" fieldSchemas:v3];
  id v5 = [SCKZoneSchema alloc];
  id v9 = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  id v7 = [(SCKZoneSchema *)v5 initWithName:@"Watchlist" atomic:1 recordSchemas:v6];

  return v7;
}

+ (id)zoneMergeHandler
{
  id v2 = objc_opt_new();

  return v2;
}

+ (id)supportedCommands
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6
{
  id v8 = a6;
  id v9 = [a5 recordWithName:@"watchlist"];
  id v10 = [v8 recordWithName:@"watchlist"];

  id v11 = [v9 encryptedValuesByKey];
  id v12 = [v11 objectForKeyedSubscript:@"symbols"];

  id v13 = [v10 encryptedValuesByKey];
  id v14 = [v13 objectForKeyedSubscript:@"symbols"];

  v15 = [MEMORY[0x263EFF9C0] set];
  [v15 addObjectsFromArray:v12];
  [v15 addObjectsFromArray:v14];
  id v16 = [(SCWatchlist *)self metadataProvider];
  uint64_t v17 = [v15 allObjects];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __46__SCWatchlist_database_didChangeZone_from_to___block_invoke;
  v20[3] = &unk_26467D530;
  id v21 = v12;
  id v22 = v14;
  v23 = self;
  id v18 = v14;
  id v19 = v12;
  [v16 fetchMetadataForSymbols:v17 completion:v20];
}

void __46__SCWatchlist_database_didChangeZone_from_to___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v11 = [v10 symbol];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }

  id v12 = objc_msgSend(v4, "sck_objectsForKeys:", *(void *)(a1 + 32));
  id v13 = objc_msgSend(v4, "sck_objectsForKeys:", *(void *)(a1 + 40));
  id v14 = [[SCWatchlistDiff alloc] initWithOldStocks:v12 newStocks:v13];
  if (![(SCWatchlistDiff *)v14 isEmpty])
  {
    uint64_t v24 = v13;
    v25 = v12;
    id v26 = v5;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v15 = [*(id *)(a1 + 48) observers];
    id v16 = (void *)[v15 copy];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          id v22 = [*(id *)(a1 + 48) callbackQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __46__SCWatchlist_database_didChangeZone_from_to___block_invoke_2;
          block[3] = &unk_26467D508;
          uint64_t v23 = *(void *)(a1 + 48);
          void block[4] = v21;
          block[5] = v23;
          v28 = v14;
          dispatch_async(v22, block);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);
    }

    id v12 = v25;
    id v5 = v26;
    id v13 = v24;
  }
}

uint64_t __46__SCWatchlist_database_didChangeZone_from_to___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchlist:*(void *)(a1 + 40) didChangeWithDiff:*(void *)(a1 + 48)];
}

- (id)_sortedStocks:(id)a3 withSymbolOrder:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v14 = [v13 symbol];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  v15 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        id v22 = objc_msgSend(v7, "objectForKeyedSubscript:", v21, (void)v24);
        if (v22)
        {
          [v15 addObject:v22];
          [v7 removeObjectForKey:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }

  return v15;
}

- (void)_enqueueStartupSequence
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 1;
  id v3 = [(SCWatchlist *)self startupQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke;
  v8[3] = &unk_26467D580;
  v8[4] = self;
  v8[5] = v9;
  [v3 enqueueStartupBlock:v8];

  id v4 = [(SCWatchlist *)self startupQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_26;
  v7[3] = &unk_26467D5F8;
  v7[4] = v9;
  [v4 enqueueStartupBlock:v7];

  id v5 = [(SCWatchlist *)self startupQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_41;
  v6[3] = &unk_26467D670;
  v6[4] = self;
  v6[5] = v9;
  [v5 enqueueStartupBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) database];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_2;
  v7[3] = &unk_26467D558;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 readContentsOfZone:@"Watchlist" withBlock:v7];
}

uint64_t __38__SCWatchlist__enqueueStartupSequence__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 recordWithName:@"watchlist"];

  if (v3)
  {
    id v4 = StocksLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_222ED9000, v4, OS_LOG_TYPE_DEFAULT, "skipping migration because the watchlist record already exists", v6, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = [MEMORY[0x263F08C40] defaultStore];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_3;
    v14[3] = &unk_26467D5A8;
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    v15 = v6;
    uint64_t v17 = v7;
    id v16 = v4;
    id v8 = (void (**)(void))MEMORY[0x223CABDA0](v14);
    if (NSClassFromString(&cfstr_Xctest.isa))
    {
      uint64_t v9 = StocksLogForCategory(4);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222ED9000, v9, OS_LOG_TYPE_DEFAULT, "skipping KVS synchronization because we're running unit tests", buf, 2u);
      }

      v8[2](v8);
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      void v10[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_39;
      v10[3] = &unk_26467D5D0;
      uint64_t v11 = v6;
      id v12 = v8;
      [v11 synchronizeWithCompletionHandler:v10];
    }
  }
  else
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_27;
    uint64_t v21 = &unk_26467D4E0;
    id v22 = (void (**)(void))v3;
    v22[2]();
    id v6 = v22;
  }
}

uint64_t __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) arrayForKey:@"stocks"];
  id v3 = [v2 valueForKeyPath:@"symbol"];
  id v4 = StocksLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v23 = [v3 count];
    __int16 v24 = 2112;
    long long v25 = v3;
    _os_log_impl(&dword_222ED9000, v4, OS_LOG_TYPE_DEFAULT, "in the KVS we found %lu stocks to migrate: %@", buf, 0x16u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = +[SCWatchlistDefaults defaultsHistoryForCurrentCountry];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      char v10 = [*(id *)(*((void *)&v17 + 1) + 8 * v9) defaultSymbols];
      char v11 = [v10 isEqualToArray:v3];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    id v13 = StocksLogForCategory(4);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    id v16 = "skipping KVS migration because the contents of the KVS match a default set";
    goto LABEL_17;
  }
LABEL_11:

  uint64_t v12 = [v3 count];
  id v13 = StocksLogForCategory(4);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v14) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    id v16 = "skipping KVS migration because the KVS is empty";
LABEL_17:
    _os_log_impl(&dword_222ED9000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
LABEL_18:

    goto LABEL_19;
  }
  if (v14)
  {
    uint64_t v15 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v15;
    _os_log_impl(&dword_222ED9000, v13, OS_LOG_TYPE_DEFAULT, "migrating %lu stocks from KVS to watchlist", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_19:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = StocksLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __38__SCWatchlist__enqueueStartupSequence__block_invoke_39_cold_1((uint64_t)v3, v4);
    }
  }
  [*(id *)(a1 + 32) synchronize];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = StocksLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222ED9000, v5, OS_LOG_TYPE_DEFAULT, "attempting to fetch watchlist defaults", buf, 2u);
    }

    uint64_t v6 = [*(id *)(a1 + 32) defaultsProvider];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_43;
    v8[3] = &unk_26467D648;
    uint64_t v7 = &v9;
    id v9 = v4;
    [v6 fetchWatchlistDefaultsWithCompletion:v8];
  }
  else
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_42;
    BOOL v14 = &unk_26467D4E0;
    uint64_t v7 = (id *)&v15;
    uint64_t v15 = (void (**)(void))v3;
    v15[2]();
  }
}

uint64_t __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_44;
    v8[3] = &unk_26467D620;
    id v9 = v6;
    id v10 = *(id *)(a1 + 32);
    __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_44((uint64_t)v8);
  }
  else
  {
    uint64_t v7 = StocksLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = [v5 count];
      _os_log_impl(&dword_222ED9000, v7, OS_LOG_TYPE_DEFAULT, "saving %lu default symbolss to watchlist", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_44(uint64_t a1)
{
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_44_cold_1(a1, v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (SCKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (SCWatchlistMetadataProviding)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setMetadataProvider:(id)a3
{
}

- (SCWatchlistDefaultsProviding)defaultsProvider
{
  return self->_defaultsProvider;
}

- (void)setDefaultsProvider:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (SCKStartupQueue)startupQueue
{
  return self->_startupQueue;
}

- (void)setStartupQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_defaultsProvider, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_39_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "KVS synchronization failed but we'll migrate whatever's in there if non-empty (error was %{public}@", (uint8_t *)&v2, 0xCu);
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_44_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "failed to fetch watchlist defaults with error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end