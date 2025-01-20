@interface SCWWatchlistManager
+ (id)supportedCommands;
+ (id)zoneMergeHandler;
+ (id)zoneSchema;
- (NSHashTable)observers;
- (OS_dispatch_queue)callbackQueue;
- (SCWDatabase)database;
- (SCWStartupQueue)startupQueue;
- (SCWWatchlistDefaultsProviding)defaultsProvider;
- (SCWWatchlistManager)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaults:(id)a5;
- (SCWWatchlistManager)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaultsProvider:(id)a5;
- (SCWWatchlistMetadataProviding)metadataProvider;
- (id)_sortedStocks:(id)a3 withSymbolOrder:(id)a4;
- (void)_enqueueStartupSequence;
- (void)addObserver:(id)a3;
- (void)addStock:(id)a3 completion:(id)a4;
- (void)addStock:(id)a3 watchlist:(id)a4 completion:(id)a5;
- (void)addWatchlist:(id)a3 identifier:(id)a4 sortState:(id)a5 sortOrderState:(id)a6 displayState:(id)a7 completion:(id)a8;
- (void)addWatchlistToWatchlistOrder:(id)a3 completion:(id)a4;
- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6;
- (void)fetchAllWatchlistsWithCompletion:(id)a3;
- (void)fetchStocksFromWatchlist:(id)a3 completion:(id)a4;
- (void)fetchStocksWithCompletion:(id)a3;
- (void)fetchWatchlistOrderWithCompletion:(id)a3;
- (void)legacyWatchlistSortState:(id)a3;
- (void)migrateToDefaultWatchlist:(id)a3 sortState:(id)a4 sortOrderState:(id)a5 displayState:(id)a6 completion:(id)a7;
- (void)removeObserver:(id)a3;
- (void)removeStock:(id)a3 completion:(id)a4;
- (void)removeSymbol:(id)a3 completion:(id)a4;
- (void)removeSymbol:(id)a3 watchlist:(id)a4 completion:(id)a5;
- (void)removeWatchlist:(id)a3 completion:(id)a4;
- (void)removeWatchlistFromWatchlistOrder:(id)a3 completion:(id)a4;
- (void)renameWatchlist:(id)a3 newName:(id)a4 completion:(id)a5;
- (void)reorderStock:(id)a3 toIndex:(unint64_t)a4 completion:(id)a5;
- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 completion:(id)a5;
- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 watchlist:(id)a5 completion:(id)a6;
- (void)reorderSymbols:(id)a3 watchlist:(id)a4 completion:(id)a5;
- (void)reorderWatchlist:(id)a3 afterWatchlist:(id)a4 completion:(id)a5;
- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 completion:(id)a5;
- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 watchlist:(id)a5 completion:(id)a6;
- (void)sc_synchronize;
- (void)setCallbackQueue:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDefaultsProvider:(id)a3;
- (void)setMetadataProvider:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)synchronize;
- (void)updateDisplayState:(id)a3 watchlist:(id)a4 completion:(id)a5;
- (void)updateSortState:(id)a3 newSortOrderState:(id)a4 newDisplayState:(id)a5 watchlist:(id)a6 completion:(id)a7;
@end

@implementation SCWWatchlistManager

+ (id)zoneMergeHandler
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)supportedCommands
{
  v4[20] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  v4[15] = objc_opt_class();
  v4[16] = objc_opt_class();
  v4[17] = objc_opt_class();
  v4[18] = objc_opt_class();
  v4[19] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:20];

  return v2;
}

+ (id)zoneSchema
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v15 = [[SCWRecordFieldSchema alloc] initWithName:@"symbols" valueClass:objc_opt_class() required:1 encrypted:1];
  v14 = [[SCWRecordFieldSchema alloc] initWithName:@"name" valueClass:objc_opt_class() required:0 encrypted:1];
  v13 = [[SCWRecordFieldSchema alloc] initWithName:@"sortState" valueClass:objc_opt_class() required:0 encrypted:0];
  v2 = [[SCWRecordFieldSchema alloc] initWithName:@"sortOrderState" valueClass:objc_opt_class() required:0 encrypted:0];
  v3 = [[SCWRecordFieldSchema alloc] initWithName:@"displayState" valueClass:objc_opt_class() required:0 encrypted:0];
  v18[0] = v15;
  v18[1] = v14;
  v18[2] = v13;
  v18[3] = v2;
  v18[4] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  v5 = [[SCWRecordSchema alloc] initWithRecordType:@"Watchlist" fieldSchemas:v4];
  v6 = [[SCWRecordFieldSchema alloc] initWithName:@"watchlistIDs" valueClass:objc_opt_class() required:1 encrypted:1];
  v17 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v8 = [[SCWRecordSchema alloc] initWithRecordType:@"WatchlistOrder" fieldSchemas:v7];
  v9 = [SCWZoneSchema alloc];
  v16[0] = v5;
  v16[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v11 = [(SCWZoneSchema *)v9 initWithName:@"Watchlist" atomic:1 version:1 recordSchemas:v10];

  return v11;
}

- (SCWWatchlistManager)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaultsProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SCWWatchlistManager;
  v12 = [(SCWWatchlistManager *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v13->_metadataProvider, a4);
    objc_storeStrong((id *)&v13->_defaultsProvider, a5);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v16 = [[SCWStartupQueue alloc] initWithDeferredStartup:1];
    startupQueue = v13->_startupQueue;
    v13->_startupQueue = v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("SCWWatchlistManager.callback", v18);
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v19;

    [v9 addObserver:v13 forZone:@"Watchlist"];
    [(SCWWatchlistManager *)v13 _enqueueStartupSequence];
  }

  return v13;
}

- (SCWWatchlistManager)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaults:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[SCWWatchlistInlineDefaultsProvider alloc] initWithDefaults:v8];

  v12 = [(SCWWatchlistManager *)self initWithDatabase:v10 metadataProvider:v9 defaultsProvider:v11];
  return v12;
}

- (void)fetchStocksWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SCWWatchlistManager *)self startupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke;
  v7[3] = &unk_1E5FA3B28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterStartup:v7];
}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_2;
  id v8 = &unk_1E5FA4490;
  id v2 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v2;
  v3 = _Block_copy(&v5);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  [v4 readContentsOfZone:@"Watchlist" withBlock:v3];
}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_3;
    v18[3] = &unk_1E5FA3D28;
    id v19 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = v7;
    __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_3((id *)v18);

    id v8 = v19;
  }
  else
  {
    id v8 = [a2 recordWithName:@"watchlist"];
    uint64_t v9 = [v8 encryptedValues];
    id v10 = [v9 objectForKeyedSubscript:@"symbols"];

    id v11 = StocksLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_1AFD01000, v11, OS_LOG_TYPE_DEFAULT, "fetch stocks CK record ordered symbols: %@", buf, 0xCu);
    }

    v12 = [*(id *)(a1 + 32) metadataProvider];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_33;
    v15[3] = &unk_1E5FA4468;
    v13 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v10;
    id v17 = v13;
    id v14 = v10;
    [v12 fetchMetadataForSymbols:v14 completion:v15];
  }
}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_3(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "fetch stocks read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    id v4 = [a1[5] callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_31;
    v5[3] = &unk_1E5FA3B28;
    id v7 = a1[6];
    id v6 = a1[4];
    dispatch_async(v4, v5);
  }
}

uint64_t __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = StocksLogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1AFD01000, v7, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provider returned stocks: %@", buf, 0xCu);
  }

  id v8 = [*(id *)(a1 + 32) _sortedStocks:v5 withSymbolOrder:*(void *)(a1 + 40)];
  id v9 = StocksLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_1AFD01000, v9, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provided ordered stocks: %@", buf, 0xCu);
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v10 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_34;
    block[3] = &unk_1E5FA4440;
    id v14 = *(id *)(a1 + 48);
    id v12 = v8;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_34(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addStock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWWatchlistManager *)self startupQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__SCWWatchlistManager_addStock_completion___block_invoke;
  v13[3] = &unk_1E5FA39D0;
  id v9 = v6;
  id v14 = v9;
  v15 = self;
  [v8 executeAfterStartup:v13];

  if (v7)
  {
    uint64_t v10 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SCWWatchlistManager_addStock_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __43__SCWWatchlistManager_addStock_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWatchlistAddSymbolCommand alloc];
  id v3 = [*(id *)(a1 + 32) symbol];
  id v5 = [(SCWatchlistAddSymbolCommand *)v2 initWithSymbol:v3];

  id v4 = [*(id *)(a1 + 40) database];
  [v4 modifyContentsOfZone:@"Watchlist" withCommand:v5];
}

uint64_t __43__SCWWatchlistManager_addStock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeSymbol:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWWatchlistManager *)self startupQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SCWWatchlistManager_removeSymbol_completion___block_invoke;
  v13[3] = &unk_1E5FA39D0;
  id v9 = v6;
  id v14 = v9;
  v15 = self;
  [v8 executeAfterStartup:v13];

  if (v7)
  {
    uint64_t v10 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SCWWatchlistManager_removeSymbol_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __47__SCWWatchlistManager_removeSymbol_completion___block_invoke(uint64_t a1)
{
  id v3 = [[SCWatchlistRemoveSymbolCommand alloc] initWithSymbol:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) database];
  [v2 modifyContentsOfZone:@"Watchlist" withCommand:v3];
}

uint64_t __47__SCWWatchlistManager_removeSymbol_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SCWWatchlistManager *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke;
  v17[3] = &unk_1E5FA3C68;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  uint64_t v20 = self;
  [v11 executeAfterStartup:v17];

  if (v10)
  {
    id v14 = [(SCWWatchlistManager *)self callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke_2;
    v15[3] = &unk_1E5FA3B00;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
}

void __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke(uint64_t a1)
{
  id v3 = [[SCWatchlistReorderSymbolCommand alloc] initWithSymbol:*(void *)(a1 + 32) precedingSymbol:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) database];
  [v2 modifyContentsOfZone:@"Watchlist" withCommand:v3];
}

uint64_t __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SCWWatchlistManager *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke;
  v17[3] = &unk_1E5FA3C68;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  uint64_t v20 = self;
  [v11 executeAfterStartup:v17];

  if (v10)
  {
    id v14 = [(SCWWatchlistManager *)self callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke_2;
    v15[3] = &unk_1E5FA3B00;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
}

void __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke(uint64_t a1)
{
  id v3 = [[SCWatchlistReplaceSymbolCommand alloc] initWithOldSymbol:*(void *)(a1 + 32) replacementSymbol:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) database];
  [v2 modifyContentsOfZone:@"Watchlist" withCommand:v3];
}

uint64_t __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllWatchlistsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistManager *)self startupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke;
  v7[3] = &unk_1E5FA3B28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterStartup:v7];
}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2;
  id v8 = &unk_1E5FA4490;
  id v2 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v2;
  id v3 = _Block_copy(&v5);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  [v4 readContentsOfZone:@"Watchlist" withBlock:v3];
}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_3;
    v19[3] = &unk_1E5FA3D28;
    id v20 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = v7;
    __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_3((id *)v19);

    id v8 = v20;
  }
  else
  {
    id v8 = [a2 recordsOfType:@"Watchlist"];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2_43;
    v17[3] = &unk_1E5FA44B8;
    id v10 = v9;
    id v18 = v10;
    [v8 enumerateObjectsUsingBlock:v17];
    id v11 = StocksLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_1AFD01000, v11, OS_LOG_TYPE_DEFAULT, "fetch watchlist list returned watchlists :%@", buf, 0xCu);
    }

    if (*(void *)(a1 + 40))
    {
      id v12 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_46;
      block[3] = &unk_1E5FA4440;
      id v16 = *(id *)(a1 + 40);
      id v14 = v10;
      id v15 = 0;
      dispatch_async(v12, block);
    }
  }
}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_3(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "fetch watchlist list read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    id v4 = [a1[5] callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_41;
    v5[3] = &unk_1E5FA3B28;
    id v7 = a1[6];
    id v6 = a1[4];
    dispatch_async(v4, v5);
  }
}

uint64_t __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 encryptedValues];
  id v14 = [v4 objectForKeyedSubscript:@"symbols"];

  id v5 = [v3 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"name"];

  id v7 = [v3 objectForKeyedSubscript:@"sortState"];
  id v8 = [v3 objectForKeyedSubscript:@"sortOrderState"];
  id v9 = [v3 objectForKeyedSubscript:@"displayState"];
  uint64_t v10 = [SCWWatchlist alloc];
  id v11 = [v3 recordID];

  id v12 = [v11 recordName];
  id v13 = [(SCWWatchlist *)v10 initWithIdentifier:v12 name:v6 symbols:v14 sortState:v7 sortOrderState:v8 displayState:v9];

  [*(id *)(a1 + 32) addObject:v13];
}

uint64_t __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_46(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchStocksFromWatchlist:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWWatchlistManager *)self startupQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke;
  v11[3] = &unk_1E5FA4440;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 executeAfterStartup:v11];
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2;
  aBlock[3] = &unk_1E5FA44E0;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v9 = v2;
  aBlock[4] = v3;
  id v8 = v4;
  id v5 = _Block_copy(aBlock);
  id v6 = [*(id *)(a1 + 32) database];
  [v6 readContentsOfZone:@"Watchlist" withBlock:v5];
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3;
    v26[3] = &unk_1E5FA3D28;
    id v27 = v6;
    id v8 = a1[6];
    id v28 = a1[4];
    id v29 = v8;
    __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3((id *)v26);

    id v9 = v27;
  }
  else
  {
    id v10 = [a1[5] identifier];
    id v9 = [v5 recordWithName:v10];

    id v11 = [v9 encryptedValues];
    id v12 = [v11 objectForKeyedSubscript:@"symbols"];

    if (v9)
    {
      id v13 = StocksLogForCategory(4);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [a1[5] name];
        id v15 = [a1[5] identifier];
        *(_DWORD *)buf = 138412802;
        v31 = v14;
        __int16 v32 = 2114;
        v33 = v15;
        __int16 v34 = 2112;
        v35 = v12;
        _os_log_impl(&dword_1AFD01000, v13, OS_LOG_TYPE_DEFAULT, "fetch stocks from watchlist name: %@, identifier: %{public}@, ordered symbols: %@", buf, 0x20u);
      }
      id v16 = [a1[4] metadataProvider];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_50;
      v19[3] = &unk_1E5FA4468;
      void v19[4] = a1[4];
      id v20 = v12;
      id v21 = a1[6];
      [v16 fetchMetadataForSymbols:v20 completion:v19];

      uint64_t v17 = v20;
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_48;
      v22[3] = &unk_1E5FA3D28;
      id v23 = a1[5];
      id v18 = a1[6];
      id v24 = a1[4];
      id v25 = v18;
      __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_48((uint64_t)v22);

      uint64_t v17 = v23;
    }
  }
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3(id *a1)
{
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3_cold_1((uint64_t)a1, v2, v3, v4, v5, v6, v7, v8);
  }

  if (a1[6])
  {
    id v9 = [a1[5] callbackQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_47;
    v10[3] = &unk_1E5FA3B28;
    id v12 = a1[6];
    id v11 = a1[4];
    dispatch_async(v9, v10);
  }
}

uint64_t __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_48(uint64_t a1)
{
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_48_cold_1(a1, v2);
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = [*(id *)(a1 + 40) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_49;
    block[3] = &unk_1E5FA3B00;
    id v5 = *(id *)(a1 + 48);
    dispatch_async(v3, block);
  }
}

uint64_t __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = StocksLogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1AFD01000, v7, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provider returned stocks: %@", buf, 0xCu);
  }

  uint64_t v8 = [*(id *)(a1 + 32) _sortedStocks:v5 withSymbolOrder:*(void *)(a1 + 40)];
  id v9 = StocksLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_1AFD01000, v9, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provided ordered stocks: %@", buf, 0xCu);
  }

  if (*(void *)(a1 + 48))
  {
    id v10 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_51;
    block[3] = &unk_1E5FA4440;
    id v14 = *(id *)(a1 + 48);
    id v12 = v8;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_51(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)legacyWatchlistSortState:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistManager *)self startupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke;
  v7[3] = &unk_1E5FA3B28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterStartup:v7];
}

void __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_2;
  id v8 = &unk_1E5FA4490;
  id v2 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v2;
  uint64_t v3 = _Block_copy(&v5);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  [v4 readContentsOfZone:@"Watchlist" withBlock:v3];
}

void __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_3;
    v17[3] = &unk_1E5FA3D28;
    id v18 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = v7;
    __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_3((id *)v17);

    id v8 = v18;
  }
  else
  {
    id v8 = [a2 recordWithName:@"watchlist"];
    uint64_t v9 = [v8 encryptedValues];
    id v10 = [v9 objectForKeyedSubscript:@"sortState"];

    id v11 = StocksLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v10;
      _os_log_impl(&dword_1AFD01000, v11, OS_LOG_TYPE_DEFAULT, "legacy watchlist has sortState=%@", buf, 0xCu);
    }

    if (*(void *)(a1 + 40))
    {
      id v12 = [*(id *)(a1 + 32) callbackQueue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_53;
      v13[3] = &unk_1E5FA4440;
      id v16 = *(id *)(a1 + 40);
      id v14 = v10;
      id v15 = 0;
      dispatch_async(v12, v13);
    }
  }
}

void __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_3(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "legacy watchlist sort state read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    id v4 = [a1[5] callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_52;
    v5[3] = &unk_1E5FA3B28;
    id v7 = a1[6];
    id v6 = a1[4];
    dispatch_async(v4, v5);
  }
}

uint64_t __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_53(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)migrateToDefaultWatchlist:(id)a3 sortState:(id)a4 sortOrderState:(id)a5 displayState:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = StocksLogForCategory(4);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AFD01000, v17, OS_LOG_TYPE_DEFAULT, "Start migrateToDefaultWatchlist", buf, 2u);
  }

  id v18 = [(SCWWatchlistManager *)self startupQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke;
  v24[3] = &unk_1E5FA4530;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  id v23 = v16;
  [v18 executeAfterStartup:v24];
}

void __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_2;
  uint64_t v10 = &unk_1E5FA4508;
  id v2 = *(id *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v16 = v2;
  uint64_t v11 = v3;
  id v12 = v4;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v5 = _Block_copy(&v7);
  id v6 = objc_msgSend(*(id *)(a1 + 32), "database", v7, v8, v9, v10, v11);
  [v6 readContentsOfZone:@"Watchlist" withBlock:v5];
}

void __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_3;
    v28[3] = &unk_1E5FA3D28;
    id v29 = v5;
    id v7 = *(id *)(a1 + 72);
    uint64_t v30 = *(void *)(a1 + 32);
    id v31 = v7;
    __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_3((id *)v28);

    uint64_t v8 = v29;
  }
  else
  {
    uint64_t v8 = [a2 recordWithName:@"watchlist"];
    id v9 = [v8 encryptedValues];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"symbols"];

    uint64_t v11 = StocksLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544386;
      uint64_t v34 = v12;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      __int16 v37 = 2112;
      uint64_t v38 = v13;
      __int16 v39 = 2112;
      uint64_t v40 = v14;
      __int16 v41 = 2112;
      uint64_t v42 = v15;
    }

    id v16 = [[SCWWatchlistAddNewWatchlistCommand alloc] initWithName:*(void *)(a1 + 40) identifier:@"watchlist" sortState:*(void *)(a1 + 48) sortOrderState:*(void *)(a1 + 56) displayState:*(void *)(a1 + 64)];
    uint64_t v17 = [*(id *)(a1 + 32) database];
    [v17 modifyContentsOfZone:@"Watchlist" withCommand:v16];

    id v18 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
    __int16 v32 = @"watchlist";
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    id v20 = [(SCWWatchlistAddToWatchlistOrderCommand *)v18 initWithWatchlistIdentifiers:v19];

    id v21 = [*(id *)(a1 + 32) database];
    [v21 modifyContentsOfZone:@"Watchlist" withCommand:v20];

    id v22 = [[SCWWatchlist alloc] initWithIdentifier:@"watchlist" name:*(void *)(a1 + 40) symbols:v10 sortState:*(void *)(a1 + 48) sortOrderState:*(void *)(a1 + 56) displayState:*(void *)(a1 + 64)];
    if (*(void *)(a1 + 72))
    {
      id v23 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_58;
      block[3] = &unk_1E5FA4440;
      id v27 = *(id *)(a1 + 72);
      id v25 = v22;
      id v26 = 0;
      dispatch_async(v23, block);
    }
  }
}

void __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_3(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "migrate to default watchlist read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    id v4 = [a1[5] callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_54;
    v5[3] = &unk_1E5FA3B28;
    id v7 = a1[6];
    id v6 = a1[4];
    dispatch_async(v4, v5);
  }
}

uint64_t __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_58(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addWatchlist:(id)a3 identifier:(id)a4 sortState:(id)a5 sortOrderState:(id)a6 displayState:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [(SCWWatchlistManager *)self startupQueue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke;
  v29[3] = &unk_1E5FA4558;
  id v21 = v14;
  id v30 = v21;
  id v22 = v15;
  id v31 = v22;
  id v23 = v16;
  id v32 = v23;
  id v24 = v17;
  id v33 = v24;
  id v25 = v18;
  id v34 = v25;
  __int16 v35 = self;
  [v20 executeAfterStartup:v29];

  if (v19)
  {
    id v26 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v28 = v19;
    dispatch_async(v26, block);
  }
}

void __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke(uint64_t a1)
{
  id v3 = [[SCWWatchlistAddNewWatchlistCommand alloc] initWithName:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40) sortState:*(void *)(a1 + 48) sortOrderState:*(void *)(a1 + 56) displayState:*(void *)(a1 + 64)];
  id v2 = [*(id *)(a1 + 72) database];
  [v2 modifyContentsOfZone:@"Watchlist" withCommand:v3];
}

uint64_t __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeWatchlist:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SCWWatchlistManager *)self startupQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke;
  v13[3] = &unk_1E5FA39D0;
  id v9 = v6;
  id v14 = v9;
  id v15 = self;
  [v8 executeAfterStartup:v13];

  if (v7)
  {
    uint64_t v10 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke(uint64_t a1)
{
  id v3 = [[SCWWatchlistRemoveWatchlistCommand alloc] initWithWatchlistIdentifier:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) database];
  [v2 modifyContentsOfZone:@"Watchlist" withCommand:v3];
}

uint64_t __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)renameWatchlist:(id)a3 newName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SCWWatchlistManager *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke;
  v17[3] = &unk_1E5FA3C68;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v20 = self;
  [v11 executeAfterStartup:v17];

  if (v10)
  {
    id v14 = [(SCWWatchlistManager *)self callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke_2;
    v15[3] = &unk_1E5FA3B00;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
}

void __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke(uint64_t a1)
{
  id v3 = [[SCWWatchlistRenameWatchlistCommand alloc] initWithWatchlistIdentifier:*(void *)(a1 + 32) updatedName:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) database];
  [v2 modifyContentsOfZone:@"Watchlist" withCommand:v3];
}

uint64_t __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addStock:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SCWWatchlistManager *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke;
  v17[3] = &unk_1E5FA3C68;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v20 = self;
  [v11 executeAfterStartup:v17];

  if (v10)
  {
    id v14 = [(SCWWatchlistManager *)self callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke_2;
    v15[3] = &unk_1E5FA3B00;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
}

void __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke(id *a1)
{
  id v2 = [SCWWatchlistAddSymbolToWatchlistCommand alloc];
  id v3 = [a1[4] symbol];
  id v4 = [a1[5] identifier];
  id v6 = [(SCWWatchlistAddSymbolToWatchlistCommand *)v2 initWithSymbol:v3 watchlistIdentifier:v4];

  id v5 = [a1[6] database];
  [v5 modifyContentsOfZone:@"Watchlist" withCommand:v6];
}

uint64_t __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeSymbol:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 name];
  if (v11 != @"watchlist")
  {

    goto LABEL_8;
  }
  id v12 = [v9 symbols];
  if ([v12 containsObject:v8])
  {
    id v13 = [v9 symbols];
    uint64_t v14 = [v13 count];

    if (v14 != 1) {
      goto LABEL_8;
    }
    id v12 = StocksLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[SCWWatchlistManager removeSymbol:watchlist:completion:](v12);
    }
  }

LABEL_8:
  id v15 = [(SCWWatchlistManager *)self startupQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke;
  v21[3] = &unk_1E5FA3C68;
  id v16 = v8;
  id v22 = v16;
  id v17 = v9;
  id v23 = v17;
  id v24 = self;
  [v15 executeAfterStartup:v21];

  if (v10)
  {
    id v18 = [(SCWWatchlistManager *)self callbackQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke_2;
    v19[3] = &unk_1E5FA3B00;
    id v20 = v10;
    dispatch_async(v18, v19);
  }
}

void __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWWatchlistRemoveSymbolFromWatchlistCommand alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  id v6 = [(SCWWatchlistRemoveSymbolFromWatchlistCommand *)v2 initWithSymbol:v3 watchlistIdentifier:v4];

  id v5 = [*(id *)(a1 + 48) database];
  [v5 modifyContentsOfZone:@"Watchlist" withCommand:v6];
}

uint64_t __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 watchlist:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(SCWWatchlistManager *)self startupQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke;
  v21[3] = &unk_1E5FA4580;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v25 = self;
  [v14 executeAfterStartup:v21];

  if (v13)
  {
    id v18 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v20 = v13;
    dispatch_async(v18, block);
  }
}

void __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWWatchlistReorderSymbolInWatchlistCommand alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) identifier];
  id v7 = [(SCWWatchlistReorderSymbolInWatchlistCommand *)v2 initWithSymbol:v3 precedingSymbol:v4 watchlistIdentifier:v5];

  id v6 = [*(id *)(a1 + 56) database];
  [v6 modifyContentsOfZone:@"Watchlist" withCommand:v7];
}

uint64_t __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reorderSymbols:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SCWWatchlistManager *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke;
  v17[3] = &unk_1E5FA3C68;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v20 = self;
  [v11 executeAfterStartup:v17];

  if (v10)
  {
    uint64_t v14 = [(SCWWatchlistManager *)self callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke_2;
    v15[3] = &unk_1E5FA3B00;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
}

void __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWWatchlistReorderAllSymbolsInWatchlistCommand alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  id v6 = [(SCWWatchlistReorderAllSymbolsInWatchlistCommand *)v2 initWithSymbols:v3 watchlistIdentifier:v4];

  id v5 = [*(id *)(a1 + 48) database];
  [v5 modifyContentsOfZone:@"Watchlist" withCommand:v6];
}

uint64_t __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 watchlist:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(SCWWatchlistManager *)self startupQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke;
  v21[3] = &unk_1E5FA4580;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v25 = self;
  [v14 executeAfterStartup:v21];

  if (v13)
  {
    id v18 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v20 = v13;
    dispatch_async(v18, block);
  }
}

void __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWWatchlistReplaceSymbolInWatchlistCommand alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) identifier];
  id v7 = [(SCWWatchlistReplaceSymbolInWatchlistCommand *)v2 initWithOldSymbol:v3 replacementSymbol:v4 watchlistIdentifier:v5];

  id v6 = [*(id *)(a1 + 56) database];
  [v6 modifyContentsOfZone:@"Watchlist" withCommand:v7];
}

uint64_t __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSortState:(id)a3 newSortOrderState:(id)a4 newDisplayState:(id)a5 watchlist:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(SCWWatchlistManager *)self startupQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke;
  v25[3] = &unk_1E5FA4348;
  id v18 = v15;
  id v26 = v18;
  id v19 = v12;
  id v27 = v19;
  id v20 = v13;
  id v28 = v20;
  id v21 = v14;
  id v29 = v21;
  id v30 = self;
  [v17 executeAfterStartup:v25];

  if (v16)
  {
    id v22 = [(SCWWatchlistManager *)self callbackQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke_2;
    v23[3] = &unk_1E5FA3B00;
    id v24 = v16;
    dispatch_async(v22, v23);
  }
}

void __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWWatchlistUpdateSortStateInWatchlistCommand alloc];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  id v5 = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)v2 initWithWatchlistIdentifier:v3 sortState:*(void *)(a1 + 40) sortOrderState:*(void *)(a1 + 48) displayState:*(void *)(a1 + 56)];

  uint64_t v4 = [*(id *)(a1 + 64) database];
  [v4 modifyContentsOfZone:@"Watchlist" withCommand:v5];
}

uint64_t __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateDisplayState:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SCWWatchlistManager *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke;
  v17[3] = &unk_1E5FA3C68;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v20 = self;
  [v11 executeAfterStartup:v17];

  if (v10)
  {
    id v14 = [(SCWWatchlistManager *)self callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke_2;
    v15[3] = &unk_1E5FA3B00;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
}

void __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWWatchlistUpdateDisplayStateInWatchlistCommand alloc];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  id v5 = [(SCWWatchlistUpdateDisplayStateInWatchlistCommand *)v2 initWithWatchlistIdentifier:v3 displayState:*(void *)(a1 + 40)];

  uint64_t v4 = [*(id *)(a1 + 48) database];
  [v4 modifyContentsOfZone:@"Watchlist" withCommand:v5];
}

uint64_t __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWatchlistOrderWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistManager *)self startupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke;
  v7[3] = &unk_1E5FA3B28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterStartup:v7];
}

void __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_2;
  id v8 = &unk_1E5FA4490;
  id v2 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v2;
  uint64_t v3 = _Block_copy(&v5);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  [v4 readContentsOfZone:@"Watchlist" withBlock:v3];
}

void __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_3;
    v20[3] = &unk_1E5FA3D28;
    id v21 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = v7;
    __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_3((id *)v20);

    id v8 = v21;
  }
  else
  {
    id v8 = [a2 recordWithName:@"watchlistorder"];
    uint64_t v9 = [v8 encryptedValues];
    id v10 = [v9 objectForKeyedSubscript:@"watchlistIDs"];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1C978] array];
    }
    id v13 = v12;

    id v14 = StocksLogForCategory(4);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl(&dword_1AFD01000, v14, OS_LOG_TYPE_DEFAULT, "fetch watchlist order returned with watchlistIDs: %@", buf, 0xCu);
    }

    if (*(void *)(a1 + 40))
    {
      id v15 = [*(id *)(a1 + 32) callbackQueue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_69;
      v16[3] = &unk_1E5FA4440;
      id v19 = *(id *)(a1 + 40);
      id v17 = v13;
      id v18 = 0;
      dispatch_async(v15, v16);
    }
  }
}

void __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_3(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1AFD01000, v2, OS_LOG_TYPE_DEFAULT, "fetch watchlist order read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    id v4 = [a1[5] callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_68;
    v5[3] = &unk_1E5FA3B28;
    id v7 = a1[6];
    id v6 = a1[4];
    dispatch_async(v4, v5);
  }
}

uint64_t __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_69(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addWatchlistToWatchlistOrder:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWWatchlistManager *)self startupQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke;
  v13[3] = &unk_1E5FA39D0;
  id v9 = v6;
  id v14 = v9;
  id v15 = self;
  [v8 executeAfterStartup:v13];

  if (v7)
  {
    uint64_t v10 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
  id v3 = [*(id *)(a1 + 32) identifier];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = [(SCWWatchlistAddToWatchlistOrderCommand *)v2 initWithWatchlistIdentifiers:v4];

  id v6 = [*(id *)(a1 + 40) database];
  [v6 modifyContentsOfZone:@"Watchlist" withCommand:v5];
}

uint64_t __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeWatchlistFromWatchlistOrder:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWWatchlistManager *)self startupQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke;
  v13[3] = &unk_1E5FA39D0;
  id v9 = v6;
  id v14 = v9;
  id v15 = self;
  [v8 executeAfterStartup:v13];

  if (v7)
  {
    uint64_t v10 = [(SCWWatchlistManager *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke_2;
    block[3] = &unk_1E5FA3B00;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWWatchlistRemoveFromWatchlistOrderCommand alloc];
  id v3 = [*(id *)(a1 + 32) identifier];
  id v5 = [(SCWWatchlistRemoveFromWatchlistOrderCommand *)v2 initWithWatchlistIdentifier:v3];

  id v4 = [*(id *)(a1 + 40) database];
  [v4 modifyContentsOfZone:@"Watchlist" withCommand:v5];
}

uint64_t __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reorderWatchlist:(id)a3 afterWatchlist:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SCWWatchlistManager *)self startupQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke;
  v17[3] = &unk_1E5FA3C68;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v20 = self;
  [v11 executeAfterStartup:v17];

  if (v10)
  {
    id v14 = [(SCWWatchlistManager *)self callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke_2;
    v15[3] = &unk_1E5FA3B00;
    id v16 = v10;
    dispatch_async(v14, v15);
  }
}

void __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke(id *a1)
{
  id v2 = [SCWatchlistReorderWatchlistCommand alloc];
  id v3 = [a1[4] identifier];
  id v4 = [a1[5] identifier];
  id v6 = [(SCWatchlistReorderWatchlistCommand *)v2 initWithWatchlistIdentifier:v3 precedingWatchlistIdentifier:v4];

  id v5 = [a1[6] database];
  [v5 modifyContentsOfZone:@"Watchlist" withCommand:v6];
}

uint64_t __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistManager *)self observers];
  [v5 removeObject:v4];
}

- (void)synchronize
{
  id v2 = [(SCWWatchlistManager *)self database];
  [v2 synchronize];
}

- (void)removeStock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 symbol];
  [(SCWWatchlistManager *)self removeSymbol:v7 completion:v6];
}

- (void)reorderStock:(id)a3 toIndex:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SCWWatchlistManager *)self startupQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke;
  v15[3] = &unk_1E5FA45A8;
  id v11 = v8;
  id v17 = self;
  unint64_t v18 = a4;
  id v16 = v11;
  [v10 executeAfterStartup:v15];

  if (v9)
  {
    id v12 = [(SCWWatchlistManager *)self callbackQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke_2;
    v13[3] = &unk_1E5FA3B00;
    id v14 = v9;
    dispatch_async(v12, v13);
  }
}

void __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke(uint64_t a1)
{
  id v2 = [SCWatchlistReorderSymbol2Command alloc];
  id v3 = [*(id *)(a1 + 32) symbol];
  id v5 = [(SCWatchlistReorderSymbol2Command *)v2 initWithSymbol:v3 toIndex:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 40) database];
  [v4 modifyContentsOfZone:@"Watchlist" withCommand:v5];
}

uint64_t __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v94 = a5;
  id v93 = a6;
  id v10 = StocksLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v144 = (unint64_t)v9;
    _os_log_impl(&dword_1AFD01000, v10, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager received change in database for zone: %@", buf, 0xCu);
  }
  v89 = v9;

  v96 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = [MEMORY[0x1E4F1CA80] set];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v12 = [v94 recordsOfType:@"Watchlist"];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v137 objects:v165 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v138 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v137 + 1) + 8 * i) recordID];
        unint64_t v18 = [v17 recordName];
        [v11 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v137 objects:v165 count:16];
    }
    while (v14);
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v19 = [v93 recordsOfType:@"Watchlist"];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v133 objects:v164 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v134;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v134 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [*(id *)(*((void *)&v133 + 1) + 8 * j) recordID];
        id v25 = [v24 recordName];
        [v11 addObject:v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v133 objects:v164 count:16];
    }
    while (v21);
  }
  v90 = self;

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  v88 = v11;
  obuint64_t j = [v11 allObjects];
  uint64_t v95 = [obj countByEnumeratingWithState:&v129 objects:v163 count:16];
  if (v95)
  {
    uint64_t v92 = *(void *)v130;
    do
    {
      for (uint64_t k = 0; k != v95; ++k)
      {
        if (*(void *)v130 != v92) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v129 + 1) + 8 * k);
        id v28 = [v94 recordWithName:v27];
        uint64_t v97 = v27;
        id v29 = [v93 recordWithName:v27];
        id v30 = [v28 encryptedValues];
        id v31 = [v30 objectForKeyedSubscript:@"name"];

        id v32 = [v29 encryptedValues];
        uint64_t v33 = [v32 objectForKeyedSubscript:@"name"];

        unint64_t v106 = (unint64_t)v31;
        uint64_t v111 = v33;
        if ([v31 compare:v33]) {
          id v34 = (void *)v33;
        }
        else {
          id v34 = 0;
        }
        id v35 = v34;
        uint64_t v36 = [v28 encryptedValues];
        __int16 v37 = [v36 objectForKeyedSubscript:@"symbols"];

        uint64_t v38 = [v29 encryptedValues];
        v98 = [v38 objectForKeyedSubscript:@"symbols"];

        __int16 v39 = [v28 objectForKeyedSubscript:@"sortState"];
        uint64_t v40 = [v29 objectForKeyedSubscript:@"sortState"];
        v109 = v39;
        LODWORD(v38) = [v39 intValue];
        os_log_t log = v40;
        if (v38 == [v40 intValue]) {
          __int16 v41 = 0;
        }
        else {
          __int16 v41 = v40;
        }
        uint64_t v42 = v41;
        uint64_t v43 = [v28 objectForKeyedSubscript:@"sortOrderState"];
        v44 = [v29 objectForKeyedSubscript:@"sortOrderState"];
        v103 = v43;
        int v45 = [v43 intValue];
        v100 = v44;
        if (v45 == [v44 intValue]) {
          v46 = 0;
        }
        else {
          v46 = v44;
        }
        id v47 = v46;
        v101 = v28;
        v48 = [v28 objectForKeyedSubscript:@"displayState"];
        v99 = v29;
        v49 = [v29 objectForKeyedSubscript:@"displayState"];
        v107 = v48;
        LODWORD(v48) = [v48 intValue];
        if (v48 == [v49 intValue]) {
          v50 = 0;
        }
        else {
          v50 = v49;
        }
        id v51 = v50;
        v104 = v42;
        v105 = v35;
        v102 = v47;
        v52 = [[SCWWatchlistDiff alloc] initWithOldSymbols:v37 newSymbols:v98 updatedName:v35 updatedSortState:v42 updatedSortOrderState:v47 updatedDisplayState:v51];
        BOOL v53 = [(SCWWatchlistDiff *)v52 isEmpty];
        v54 = StocksLogForCategory(4);
        BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        if (v53)
        {
          v56 = (void *)v106;
          if (v55)
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v144 = v106;
            _os_log_impl(&dword_1AFD01000, v54, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistDiff is empty for watchlistName: %@", buf, 0xCu);
          }

          v57 = (void *)v111;
          v58 = v103;
          v60 = v100;
          v59 = v101;
        }
        else
        {
          v56 = (void *)v106;
          v58 = v103;
          v60 = v100;
          if (v55)
          {
            *(_DWORD *)buf = 138414594;
            unint64_t v144 = v106;
            __int16 v145 = 2112;
            v146 = v37;
            __int16 v147 = 2112;
            v148 = v109;
            __int16 v149 = 2112;
            v150 = v103;
            __int16 v151 = 2112;
            v152 = v107;
            __int16 v153 = 2112;
            uint64_t v154 = v111;
            __int16 v155 = 2112;
            v156 = v98;
            __int16 v157 = 2112;
            os_log_t v158 = log;
            __int16 v159 = 2112;
            v160 = v100;
            __int16 v161 = 2112;
            v162 = v49;
            _os_log_impl(&dword_1AFD01000, v54, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistDiff [watchlistOldName: %@ oldOrderedSymbols: %@ watchlistOldSortState: %@ watchlistOldSortOrderState: %@ watchlistOldDisplayState: %@], [watchlistNewName: %@  newOrderedSymbols: %@ watchlistNewSortState: %@ watchlistNewSortOrderState: %@ watchlistNewDisplayState: %@]", buf, 0x66u);
          }

          v57 = (void *)v111;
          v59 = v101;
          if (!(v106 | v111) && ![v98 count] && !log && !v100 && !v49)
          {
            v61 = StocksLogForCategory(4);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
              -[SCWWatchlistManager database:didChangeZone:from:to:](&v127, v128, v61);
            }

            v57 = (void *)v111;
          }
          [v96 setObject:v52 forKey:v97];
        }
      }
      uint64_t v95 = [obj countByEnumeratingWithState:&v129 objects:v163 count:16];
    }
    while (v95);
  }

  if ([v96 count])
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    v62 = [(SCWWatchlistManager *)v90 observers];
    v63 = (void *)[v62 copy];

    uint64_t v64 = [v63 countByEnumeratingWithState:&v123 objects:v142 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v124;
      do
      {
        for (uint64_t m = 0; m != v65; ++m)
        {
          if (*(void *)v124 != v66) {
            objc_enumerationMutation(v63);
          }
          uint64_t v68 = *(void *)(*((void *)&v123 + 1) + 8 * m);
          v69 = [(SCWWatchlistManager *)v90 callbackQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke;
          block[3] = &unk_1E5FA3C68;
          void block[4] = v68;
          block[5] = v90;
          id v122 = v96;
          dispatch_async(v69, block);
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v123 objects:v142 count:16];
      }
      while (v65);
    }
  }
  v70 = [v94 recordWithName:@"watchlistorder"];
  v71 = [v93 recordWithName:@"watchlistorder"];
  v72 = [v70 encryptedValues];
  v73 = [v72 objectForKeyedSubscript:@"watchlistIDs"];

  v74 = [v71 encryptedValues];
  v75 = [v74 objectForKeyedSubscript:@"watchlistIDs"];

  v76 = [[SCWWatchlistOrderDiff alloc] initWithOldWatchlistIDs:v73 newWatchlistIDs:v75];
  BOOL v77 = [(SCWWatchlistOrderDiff *)v76 isEmpty];
  loga = StocksLogForCategory(4);
  BOOL v78 = os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT);
  if (v77)
  {
    if (v78)
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v144 = (unint64_t)v73;
      _os_log_impl(&dword_1AFD01000, loga, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistOrderDiff is empty oldWatchlistOrder: %@", buf, 0xCu);
    }
LABEL_73:
    v87 = v88;
    goto LABEL_74;
  }
  if (v78)
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v144 = (unint64_t)v73;
    __int16 v145 = 2112;
    v146 = v75;
    _os_log_impl(&dword_1AFD01000, loga, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistOrderDiff oldWatchlistOrder: %@ newWatchlistOrder: %@", buf, 0x16u);
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v79 = [(SCWWatchlistManager *)v90 observers];
  v80 = [v79 copy];

  loga = v80;
  uint64_t v81 = [v80 countByEnumeratingWithState:&v117 objects:v141 count:16];
  if (!v81) {
    goto LABEL_73;
  }
  uint64_t v82 = v81;
  v108 = v75;
  v110 = v73;
  v112 = v70;
  uint64_t v83 = *(void *)v118;
  do
  {
    for (uint64_t n = 0; n != v82; ++n)
    {
      if (*(void *)v118 != v83) {
        objc_enumerationMutation(v80);
      }
      uint64_t v85 = *(void *)(*((void *)&v117 + 1) + 8 * n);
      v86 = [(SCWWatchlistManager *)v90 callbackQueue];
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke_85;
      v115[3] = &unk_1E5FA3C68;
      v115[4] = v85;
      v115[5] = v90;
      v116 = v76;
      dispatch_async(v86, v115);
    }
    uint64_t v82 = [v80 countByEnumeratingWithState:&v117 objects:v141 count:16];
  }
  while (v82);
  v87 = v88;
  v70 = v112;
  v75 = v108;
  v73 = v110;
LABEL_74:
}

uint64_t __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchlistManager:*(void *)(a1 + 40) didChangeInWatchlist:*(void *)(a1 + 48)];
}

uint64_t __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke_85(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchlistManager:*(void *)(a1 + 40) didChangeInWatchlistOrder:*(void *)(a1 + 48)];
}

- (id)_sortedStocks:(id)a3 withSymbolOrder:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
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
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v14 = [v13 symbol];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
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
        uint64_t v22 = objc_msgSend(v7, "objectForKeyedSubscript:", v21, (void)v24);
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
  id v3 = [(SCWWatchlistManager *)self startupQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke;
  v8[3] = &unk_1E5FA45F8;
  v8[4] = self;
  v8[5] = v9;
  [v3 enqueueStartupBlock:v8];

  id v4 = [(SCWWatchlistManager *)self startupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_87;
  v7[3] = &unk_1E5FA4670;
  v7[4] = self;
  void v7[5] = v9;
  [v4 enqueueStartupBlock:v7];

  id v5 = [(SCWWatchlistManager *)self startupQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_102;
  v6[3] = &unk_1E5FA4670;
  v6[4] = self;
  v6[5] = v9;
  [v5 enqueueStartupBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) database];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2;
  v7[3] = &unk_1E5FA45D0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 readContentsOfZone:@"Watchlist" withBlock:v7];
}

uint64_t __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 recordWithName:@"watchlist"];

  if (v3)
  {
    id v4 = StocksLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1AFD01000, v4, OS_LOG_TYPE_DEFAULT, "skipping migration because the watchlist record already exists", v6, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F29130] defaultStore];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_3;
    aBlock[3] = &unk_1E5FA4620;
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = v6;
    uint64_t v17 = v7;
    uint64_t v19 = v8;
    id v18 = v4;
    uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
    if (NSClassFromString(&cfstr_Xctest.isa))
    {
      char v10 = StocksLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFD01000, v10, OS_LOG_TYPE_DEFAULT, "skipping KVS synchronization because we're running unit tests", buf, 2u);
      }

      v9[2](v9);
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_100;
      v11[3] = &unk_1E5FA4648;
      id v12 = v6;
      uint64_t v13 = v9;
      [v12 synchronizeWithCompletionHandler:v11];
    }
  }
  else
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_88;
    id v23 = &unk_1E5FA3B00;
    long long v24 = (void (**)(void))v3;
    v24[2]();
    id v6 = v24;
  }
}

uint64_t __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_3(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) arrayForKey:@"stocks"];
  id v3 = [v2 valueForKeyPath:@"symbol"];
  id v4 = StocksLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = [v3 count];
    __int16 v30 = 2112;
    long long v31 = v3;
    _os_log_impl(&dword_1AFD01000, v4, OS_LOG_TYPE_DEFAULT, "in the KVS we found %lu stocks to migrate: %@", buf, 0x16u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = +[SCWWatchlistDefaults defaultsHistoryForCurrentCountry];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      char v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) defaultSymbols];
      char v11 = [v10 isEqualToArray:v3];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    StocksLogForCategory(4);
    uint64_t v13 = (SCWatchlistAddDefaultSymbolsCommand *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "skipping KVS migration because the contents of the KVS match a default set";
LABEL_17:
    _os_log_impl(&dword_1AFD01000, &v13->super, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    goto LABEL_18;
  }
LABEL_11:

  uint64_t v12 = [v3 count];
  StocksLogForCategory(4);
  uint64_t v13 = (SCWatchlistAddDefaultSymbolsCommand *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v14) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "skipping KVS migration because the KVS is empty";
    goto LABEL_17;
  }
  if (v14)
  {
    uint64_t v15 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v15;
    _os_log_impl(&dword_1AFD01000, &v13->super, OS_LOG_TYPE_DEFAULT, "migrating %lu stocks from KVS to watchlist", buf, 0xCu);
  }

  uint64_t v13 = [[SCWatchlistAddDefaultSymbolsCommand alloc] initWithSymbols:v3 deferUpload:0];
  id v16 = [*(id *)(a1 + 40) database];
  [v16 modifyContentsOfZone:@"Watchlist" withCommand:v13];

  uint64_t v17 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
  long long v26 = @"watchlist";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  uint64_t v19 = [(SCWWatchlistAddToWatchlistOrderCommand *)v17 initWithWatchlistIdentifiers:v18];

  uint64_t v20 = [*(id *)(a1 + 40) database];
  [v20 modifyContentsOfZone:@"Watchlist" withCommand:v19];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_18:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = StocksLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_100_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  [*(id *)(a1 + 32) synchronize];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = StocksLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFD01000, v5, OS_LOG_TYPE_DEFAULT, "attempting to fetch watchlist defaults", buf, 2u);
    }

    uint64_t v6 = [*(id *)(a1 + 32) defaultsProvider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_104;
    void v9[3] = &unk_1E5FA4698;
    uint64_t v7 = &v10;
    id v8 = v4;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v6 fetchWatchlistDefaultsWithCompletion:v9];
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    BOOL v14 = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_103;
    uint64_t v15 = &unk_1E5FA3B00;
    uint64_t v7 = (id *)&v16;
    id v16 = (void (**)(void))v3;
    v16[2]();
  }
}

uint64_t __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_105;
    v14[3] = &unk_1E5FA3A68;
    uint64_t v15 = (SCWatchlistAddDefaultSymbolsCommand *)v6;
    id v16 = *(id *)(a1 + 40);
    __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_105((uint64_t)v14);

    uint64_t v7 = v15;
  }
  else
  {
    id v8 = StocksLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = [v5 count];
      _os_log_impl(&dword_1AFD01000, v8, OS_LOG_TYPE_DEFAULT, "saving %lu default symbolss to watchlist", buf, 0xCu);
    }

    uint64_t v7 = [[SCWatchlistAddDefaultSymbolsCommand alloc] initWithSymbols:v5 deferUpload:1];
    uint64_t v9 = [*(id *)(a1 + 32) database];
    [v9 modifyContentsOfZone:@"Watchlist" withCommand:v7];

    id v10 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
    uint64_t v17 = @"watchlist";
    char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    uint64_t v12 = [(SCWWatchlistAddToWatchlistOrderCommand *)v10 initWithWatchlistIdentifiers:v11];

    uint64_t v13 = [*(id *)(a1 + 32) database];
    [v13 modifyContentsOfZone:@"Watchlist" withCommand:v12];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_105(uint64_t a1)
{
  id v2 = StocksLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_105_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (SCWDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (SCWWatchlistMetadataProviding)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setMetadataProvider:(id)a3
{
}

- (SCWWatchlistDefaultsProviding)defaultsProvider
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

- (SCWStartupQueue)startupQueue
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

- (void)sc_synchronize
{
  if (objc_opt_respondsToSelector())
  {
    [(SCWWatchlistManager *)self synchronize];
  }
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_48_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1AFD01000, a2, OS_LOG_TYPE_ERROR, "fetch stocks missing watchlist record for identifier: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)removeSymbol:(os_log_t)log watchlist:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AFD01000, log, OS_LOG_TYPE_FAULT, "SCWWatchlistManager removing last symbol from default watchlist", v1, 2u);
}

- (void)database:(os_log_t)log didChangeZone:from:to:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1AFD01000, log, OS_LOG_TYPE_FAULT, "SCWWatchlistManager watchlist diff removes all symbols in default watchlist along with nil values for order/display/sort state", buf, 2u);
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_100_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_105_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end