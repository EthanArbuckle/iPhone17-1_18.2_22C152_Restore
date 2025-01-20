@interface WBSHistorySessionController
+ (id)sharedSessionController;
- (BOOL)_getKey:(id *)a3 forDate:(double)a4;
- (NSArray)orderedSessions;
- (WBSHistory)history;
- (WBSHistorySessionController)initWithHistory:(id)a3;
- (id)_orderedSessionKeys;
- (id)itemLastVisitedInSession:(id)a3 atIndex:(unint64_t)a4;
- (id)itemsLastVisitedInSession:(id)a3;
- (id)sessionForItem:(id)a3;
- (unint64_t)_insertItem:(id)a3 withSessionKey:(id)a4;
- (unint64_t)numberOfItemsVisitedInSession:(id)a3;
- (unint64_t)numberOfSessions;
- (void)_addItemsToSessionCache:(id)a3 shouldPostChangeNotification:(BOOL)a4;
- (void)_clearSessionCache;
- (void)_dispatchHistorySessionsDidChangeNotification;
- (void)_historyItemsWereAdded:(id)a3;
- (void)_historyItemsWereRemoved:(id)a3;
- (void)_historyWasSignificantlyChanged:(id)a3;
- (void)_loadSessionCache;
- (void)_removeItemsFromSessionCache:(id)a3;
- (void)_requestSessionKeyForDate:(id)a3 withBlock:(id)a4;
- (void)_timeZoneDidChange:(id)a3;
- (void)enumerateOrderedItemsLastVisitedInSession:(id)a3 usingBlock:(id)a4;
- (void)orderedItemsNewerThanDate:(id)a3 maxCount:(unint64_t)a4 completionHandler:(id)a5;
- (void)orderedSessionsWithCompletionHandler:(id)a3;
@end

@implementation WBSHistorySessionController

+ (id)sharedSessionController
{
  if (+[WBSHistorySessionController sharedSessionController]::onceToken != -1) {
    dispatch_once(&+[WBSHistorySessionController sharedSessionController]::onceToken, &__block_literal_global_71);
  }
  v2 = (void *)+[WBSHistorySessionController sharedSessionController]::shared;
  return v2;
}

void __54__WBSHistorySessionController_sharedSessionController__block_invoke()
{
  v0 = [WBSHistorySessionController alloc];
  id v3 = +[WBSHistory existingSharedHistory];
  uint64_t v1 = -[WBSHistorySessionController initWithHistory:](v0, "initWithHistory:");
  v2 = (void *)+[WBSHistorySessionController sharedSessionController]::shared;
  +[WBSHistorySessionController sharedSessionController]::shared = v1;
}

- (WBSHistorySessionController)initWithHistory:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WBSHistorySessionController;
  v6 = [(WBSHistorySessionController *)&v41 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_history, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistorySessionController.sessionCacheAccess", 0);
    sessionCacheAccessQueue = v7->_sessionCacheAccessQueue;
    v7->_sessionCacheAccessQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    itemsBySession = v7->_itemsBySession;
    v7->_itemsBySession = (NSMutableDictionary *)v10;

    v12 = objc_alloc_init(WBSHistorySessionIntervalCache);
    intervalCache = v7->_intervalCache;
    v7->_intervalCache = v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v46[0] = @"WBSHistoryItemsWereAddedNotification";
    v46[1] = @"WBSHistoryItemDidChangeNotification";
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v15);
          }
          [v14 addObserver:v7 selector:sel__historyItemsWereAdded_ name:*(void *)(*((void *)&v37 + 1) + 8 * i) object:v5];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v16);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v44[0] = @"WBSHistoryItemsWereRemovedNotification";
    v44[1] = @"WBSHistoryItemWillChangeNotification";
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v19);
          }
          [v14 addObserver:v7 selector:sel__historyItemsWereRemoved_ name:*(void *)(*((void *)&v33 + 1) + 8 * j) object:v5];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v20);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v42[0] = @"WBSHistoryWasLoadedNotification";
    v42[1] = @"WBSHistoryWasClearedNotification";
    v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v42, 2, 0);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v23);
          }
          [v14 addObserver:v7 selector:sel__historyWasSignificantlyChanged_ name:*(void *)(*((void *)&v29 + 1) + 8 * k) object:v5];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v24);
    }

    [v14 addObserver:v7 selector:sel__timeZoneDidChange_ name:*MEMORY[0x1E4F1C4F8] object:0];
    [(WBSHistorySessionController *)v7 _loadSessionCache];
    v27 = v7;
  }
  return v7;
}

- (void)enumerateOrderedItemsLastVisitedInSession:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSHistorySessionController_enumerateOrderedItemsLastVisitedInSession_usingBlock___block_invoke;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(sessionCacheAccessQueue, block);
}

void __84__WBSHistorySessionController_enumerateOrderedItemsLastVisitedInSession_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) startDate];
  [v3 timeIntervalSinceReferenceDate];
  char v4 = objc_msgSend(v2, "_getKey:forDate:", &v14);
  id v5 = v14;

  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)orderedItemsNewerThanDate:(id)a3 maxCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v8 timeIntervalSinceReferenceDate];
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__WBSHistorySessionController_orderedItemsNewerThanDate_maxCount_completionHandler___block_invoke;
  v13[3] = &unk_1E5C9CC18;
  uint64_t v15 = v11;
  v13[4] = self;
  id v14 = v9;
  unint64_t v16 = a4;
  id v12 = v9;
  dispatch_async(sessionCacheAccessQueue, v13);
}

void __84__WBSHistorySessionController_orderedItemsNewerThanDate_maxCount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v16 = [*(id *)(a1 + 32) _orderedSessionKeys];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v16;
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v24;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      uint64_t v17 = v3;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * v6);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", v7, v15);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v20;
          uint64_t v11 = v4;
          while (2)
          {
            uint64_t v12 = 0;
            uint64_t v4 = v11 + v9;
            do
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
              [v13 lastVisitedTimeInterval];
              if (v14 < *(double *)(a1 + 48) || v11 + v12 == *(void *)(a1 + 56))
              {
                (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

                goto LABEL_19;
              }
              [v2 addObject:v13];
              ++v12;
            }
            while (v9 != v12);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            uint64_t v11 = v4;
            uint64_t v5 = v15;
            if (v9) {
              continue;
            }
            break;
          }
        }

        ++v6;
      }
      while (v6 != v17);
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_19:
}

- (id)itemLastVisitedInSession:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__26;
  long long v19 = __Block_byref_object_dispose__26;
  id v20 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__WBSHistorySessionController_itemLastVisitedInSession_atIndex___block_invoke;
  v11[3] = &unk_1E5C9D7E0;
  v11[4] = self;
  id v12 = v6;
  long long v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(sessionCacheAccessQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __64__WBSHistorySessionController_itemLastVisitedInSession_atIndex___block_invoke(uint64_t a1)
{
  id v11 = 0;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) startDate];
  [v3 timeIntervalSinceReferenceDate];
  char v4 = objc_msgSend(v2, "_getKey:forDate:", &v11);
  id v5 = v11;

  if (v4)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
    if ((unint64_t)[v6 count] <= *(void *)(a1 + 56))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;
    }
    else
    {
      uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:");
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

- (unint64_t)numberOfSessions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__WBSHistorySessionController_numberOfSessions__block_invoke;
  v5[3] = &unk_1E5C8E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionCacheAccessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__WBSHistorySessionController_numberOfSessions__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)numberOfItemsVisitedInSession:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSHistorySessionController_numberOfItemsVisitedInSession___block_invoke;
  block[3] = &unk_1E5C9BFE8;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(sessionCacheAccessQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__WBSHistorySessionController_numberOfItemsVisitedInSession___block_invoke(uint64_t a1)
{
  id v6 = 0;
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) startDate];
  [v3 timeIntervalSinceReferenceDate];
  LOBYTE(v2) = objc_msgSend(v2, "_getKey:forDate:", &v6);
  id v4 = v6;

  if (v2)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v4];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 count];
  }
}

- (id)itemsLastVisitedInSession:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__26;
  unint64_t v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WBSHistorySessionController_itemsLastVisitedInSession___block_invoke;
  block[3] = &unk_1E5C9BFE8;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(sessionCacheAccessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__WBSHistorySessionController_itemsLastVisitedInSession___block_invoke(uint64_t a1)
{
  id v9 = 0;
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) startDate];
  [v3 timeIntervalSinceReferenceDate];
  LOBYTE(v2) = objc_msgSend(v2, "_getKey:forDate:", &v9);
  id v4 = v9;

  if (v2)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v4];
    uint64_t v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (NSArray)orderedSessions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__26;
  id v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__WBSHistorySessionController_orderedSessions__block_invoke;
  v5[3] = &unk_1E5C8E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionCacheAccessQueue, v5);
  unint64_t v3 = objc_msgSend((id)v7[5], "safari_mapObjectsUsingBlock:", &__block_literal_global_25_0);
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__WBSHistorySessionController_orderedSessions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _orderedSessionKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

WBSHistorySession *__46__WBSHistorySessionController_orderedSessions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [WBSHistorySession alloc];
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  [v2 doubleValue];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v6 = [(WBSHistorySession *)v3 initWithSessionStartDate:v5];

  return v6;
}

- (void)orderedSessionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WBSHistorySessionController_orderedSessionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionCacheAccessQueue, v7);
}

void __68__WBSHistorySessionController_orderedSessionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _orderedSessionKeys];
  objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_29);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

WBSHistorySession *__68__WBSHistorySessionController_orderedSessionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [WBSHistorySession alloc];
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  [v2 doubleValue];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  id v6 = [(WBSHistorySession *)v3 initWithSessionStartDate:v5];

  return v6;
}

- (id)sessionForItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__26;
  unint64_t v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__WBSHistorySessionController_sessionForItem___block_invoke;
  block[3] = &unk_1E5C9BFE8;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(sessionCacheAccessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__WBSHistorySessionController_sessionForItem___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  [*(id *)(a1 + 40) lastVisitedTimeInterval];
  objc_msgSend(v2, "beginningOfSessionContainingTime:");
  double v4 = v3;
  id v5 = [WBSHistorySession alloc];
  id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v4];
  uint64_t v6 = -[WBSHistorySession initWithSessionStartDate:](v5, "initWithSessionStartDate:");
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_orderedSessionKeys
{
  if (![(NSArray *)self->_orderedSessions count]
    && [(NSMutableDictionary *)self->_itemsBySession count])
  {
    double v3 = [(NSMutableDictionary *)self->_itemsBySession allKeys];
    double v4 = [v3 sortedArrayUsingSelector:sel_compare_];
    id v5 = [v4 reverseObjectEnumerator];
    uint64_t v6 = [v5 allObjects];
    orderedSessions = self->_orderedSessions;
    self->_orderedSessions = v6;
  }
  id v8 = self->_orderedSessions;
  return v8;
}

- (BOOL)_getKey:(id *)a3 forDate:(double)a4
{
  uint64_t v6 = NSNumber;
  [(WBSHistorySessionIntervalCache *)self->_intervalCache beginningOfSessionContainingTime:a4];
  objc_msgSend(v6, "numberWithDouble:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v7;
  id v8 = [(NSMutableDictionary *)self->_itemsBySession objectForKey:v7];
  LOBYTE(a3) = v8 != 0;

  return (char)a3;
}

- (void)_requestSessionKeyForDate:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSHistorySessionController__requestSessionKeyForDate_withBlock___block_invoke;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(sessionCacheAccessQueue, block);
}

void __67__WBSHistorySessionController__requestSessionKeyForDate_withBlock___block_invoke(uint64_t a1)
{
  id v4 = 0;
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  LOBYTE(v2) = objc_msgSend(v2, "_getKey:forDate:", &v4);
  id v3 = v4;
  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (unint64_t)_insertItem:(id)a3 withSessionKey:(id)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_itemsBySession objectForKeyedSubscript:a4];
  if (v7)
  {
    [v6 lastVisitedTimeInterval];
    double v9 = v8;
    unsigned int v10 = [v7 count];
    if (v10
      && ([v7 objectAtIndexedSubscript:0],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v11 lastVisitedTimeInterval],
          double v13 = v12,
          v11,
          v13 >= v9))
    {
      uint64_t v15 = [v7 lastObject];
      [v15 lastVisitedTimeInterval];
      double v17 = v16;

      if (v17 >= v9)
      {
        [v7 addObject:v6];
        unint64_t v14 = [v7 count] - 1;
      }
      else
      {
        LODWORD(v14) = 0;
        do
        {
          unsigned int v18 = v14 + ((v10 - v14) >> 1);
          long long v19 = [v7 objectAtIndexedSubscript:v18];
          [v19 lastVisitedTimeInterval];
          double v21 = v20;

          if (v21 >= v9) {
            unint64_t v14 = v18 + 1;
          }
          else {
            unint64_t v14 = v14;
          }
          if (v21 < v9) {
            unsigned int v10 = v18;
          }
        }
        while (v14 < v10);
        [v7 insertObject:v6 atIndex:v14];
      }
    }
    else
    {
      [v7 insertObject:v6 atIndex:0];
      unint64_t v14 = 0;
    }
  }
  else
  {
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v14;
}

- (void)_addItemsToSessionCache:(id)a3 shouldPostChangeNotification:(BOOL)a4
{
  id v6 = a3;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke;
  block[3] = &unk_1E5C8D118;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(sessionCacheAccessQueue, block);
}

void __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  }
  else
  {
    id v2 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(WBSHistoryItem **)(*((void *)&v25 + 1) + 8 * i);
        if (shouldDisplayItem(v7))
        {
          [(WBSHistoryItem *)v7 lastVisitedTimeInterval];
          id v8 = *(void **)(a1 + 40);
          id v24 = 0;
          int v9 = objc_msgSend(v8, "_getKey:forDate:", &v24);
          id v10 = v24;
          if (v9)
          {
            uint64_t v11 = [*(id *)(a1 + 40) _insertItem:v7 withSessionKey:v10];
          }
          else
          {
            BOOL v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
            [*(id *)(*(void *)(a1 + 40) + 16) setObject:v12 forKeyedSubscript:v10];

            uint64_t v13 = *(void *)(a1 + 40);
            unint64_t v14 = *(void **)(v13 + 24);
            *(void *)(v13 + 24) = 0;

            uint64_t v11 = 0;
          }
          if (*(unsigned char *)(a1 + 48))
          {
            uint64_t v15 = [WBSHistorySession alloc];
            double v16 = (void *)MEMORY[0x1E4F1C9C8];
            [v10 doubleValue];
            double v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
            unsigned int v18 = [(WBSHistorySession *)v15 initWithSessionStartDate:v17];

            long long v19 = [v2 objectForKey:v18];
            double v20 = v19;
            if (v19)
            {
              [v19 addIndex:v11];
            }
            else
            {
              double v21 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v11];
              [v2 setObject:v21 forKey:v18];
            }
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  if ([v2 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke_2;
    block[3] = &unk_1E5C8D980;
    void block[4] = *(void *)(a1 + 40);
    id v23 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"WBSHistorySessionsWithAddedItems";
  v7[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WBSHistorySessionsDidChangeNotification" object:v4 userInfo:v5];
}

- (void)_removeItemsFromSessionCache:(id)a3
{
  id v4 = a3;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke;
  v7[3] = &unk_1E5C8D980;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(sessionCacheAccessQueue, v7);
}

void __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = *v2;
  uint64_t v25 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v37;
    *(void *)&long long v3 = 138740227;
    long long v21 = v3;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(WBSHistoryItem **)(*((void *)&v36 + 1) + 8 * i);
        [(WBSHistoryItem *)v4 lastVisitedTimeInterval];
        uint64_t v5 = *(void **)(a1 + 40);
        id v35 = 0;
        objc_msgSend(v5, "_getKey:forDate:", &v35);
        id v27 = v35;
        id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "objectForKeyedSubscript:");
        id v7 = v6;
        if (v6)
        {
          uint64_t v8 = [v6 indexOfObjectIdenticalTo:v4];
          if (v8 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_20:
            long long v19 = [v7 objectAtIndexedSubscript:v8];
            [v23 addObject:v19];

            [v7 removeObjectAtIndex:v8];
            if ([v7 count]) {
              goto LABEL_23;
            }
            [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:v27];
            uint64_t v20 = *(void *)(a1 + 40);
            uint64_t v15 = *(NSObject **)(v20 + 24);
            *(void *)(v20 + 24) = 0;
            goto LABEL_22;
          }
        }
        long long v34 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v31 = 0u;
        id v9 = *(id *)(*(void *)(a1 + 40) + 16);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v44 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v32;
          while (2)
          {
            uint64_t v12 = 0;
            uint64_t v13 = v7;
            do
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v9);
              }
              unint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
              id v7 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:v14];

              v30[0] = MEMORY[0x1E4F143A8];
              v30[1] = 3221225472;
              v30[2] = __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke_2;
              v30[3] = &unk_1E5C9D828;
              v30[4] = v4;
              uint64_t v8 = [v7 indexOfObjectPassingTest:v30];
              if (v8 != 0x7FFFFFFFFFFFFFFFLL)
              {
                id v18 = v14;

                id v27 = v18;
                goto LABEL_20;
              }
              ++v12;
              uint64_t v13 = v7;
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v44 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        if (shouldDisplayItem(v4))
        {
          uint64_t v15 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            double v16 = [(WBSHistoryItem *)v4 urlString];
            uint64_t v17 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v21;
            objc_super v41 = v16;
            __int16 v42 = 2112;
            uint64_t v43 = v17;
            _os_log_impl(&dword_1A6B5F000, v15, OS_LOG_TYPE_INFO, "Item %{sensitive}@ was removed, but couldn't find it in %@", buf, 0x16u);
          }
LABEL_22:
        }
LABEL_23:
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v25);
  }

  if ([v23 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke_37;
    block[3] = &unk_1E5C8D980;
    void block[4] = *(void *)(a1 + 40);
    id v29 = v23;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = [a2 urlString];
  id v4 = [*(id *)(a1 + 32) urlString];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke_37(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"WBSHistorySessionsRemovedItems";
  v7[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WBSHistorySessionsDidChangeNotification" object:v4 userInfo:v5];
}

- (void)_clearSessionCache
{
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WBSHistorySessionController__clearSessionCache__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(sessionCacheAccessQueue, block);
}

void __49__WBSHistorySessionController__clearSessionCache__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)_loadSessionCache
{
  id v3 = [(WBSHistory *)self->_history allItems];
  -[WBSHistorySessionController _addItemsToSessionCache:shouldPostChangeNotification:](self, "_addItemsToSessionCache:shouldPostChangeNotification:");
}

- (void)_dispatchHistorySessionsDidChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"WBSHistorySessionsDidChangeNotification" object:self];
}

- (void)_historyItemsWereAdded:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  objc_msgSend(v4, "safari_arrayForKey:", @"WBSHistoryItemsKey");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if ([v5 count]) {
    [(WBSHistorySessionController *)self _addItemsToSessionCache:v5 shouldPostChangeNotification:1];
  }
}

- (void)_historyWasSignificantlyChanged:(id)a3
{
  [(WBSHistorySessionController *)self _clearSessionCache];
  [(WBSHistorySessionController *)self _loadSessionCache];
  [(WBSHistorySessionController *)self _dispatchHistorySessionsDidChangeNotification];
}

- (void)_historyItemsWereRemoved:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  if (v4)
  {
    id v6 = v4;
    id v5 = objc_msgSend(v4, "safari_arrayForKey:", @"WBSHistoryItemsKey");
    if ([v5 count]) {
      [(WBSHistorySessionController *)self _removeItemsFromSessionCache:v5];
    }

    uint64_t v4 = v6;
  }
}

- (void)_timeZoneDidChange:(id)a3
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSHistorySessionController__timeZoneDidChange___block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __50__WBSHistorySessionController__timeZoneDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_2;
  block[3] = &unk_1E5C8CA70;
  void block[4] = v2;
  dispatch_sync(v3, block);
  [*(id *)(a1 + 32) _clearSessionCache];
  [*(id *)(a1 + 32) _loadSessionCache];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_3;
  v4[3] = &unk_1E5C8CA70;
  v4[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(WBSHistorySessionIntervalCache);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

uint64_t __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchHistorySessionsDidChangeNotification];
}

- (WBSHistory)history
{
  return self->_history;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_intervalCache, 0);
  objc_storeStrong((id *)&self->_orderedSessions, 0);
  objc_storeStrong((id *)&self->_itemsBySession, 0);
  objc_storeStrong((id *)&self->_sessionCacheAccessQueue, 0);
}

@end