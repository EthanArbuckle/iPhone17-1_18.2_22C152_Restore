@interface WBSFormAutoFillCorrectionsHistoryObserver
- (WBSFormAutoFillCorrectionsHistoryObserver)initWithCorrectionsStore:(id)a3;
- (id)_normalizeURL:(id)a3;
- (void)_historyItemsWereRemoved:(id)a3;
- (void)_historyVisitsWereRemoved:(id)a3;
- (void)_historyWasCleared:(id)a3;
- (void)_invalidateUpdateCoalescingTimer;
- (void)_updateCorrectionsStoreNow;
- (void)_updateCorrectionsStoreSoon;
- (void)dealloc;
- (void)flushPendingChangesAndDisconnectFromStoreAndHistory;
@end

@implementation WBSFormAutoFillCorrectionsHistoryObserver

- (WBSFormAutoFillCorrectionsHistoryObserver)initWithCorrectionsStore:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSFormAutoFillCorrectionsHistoryObserver;
  v6 = [(WBSFormAutoFillCorrectionsHistoryObserver *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_correctionsStore, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    pendingRemovedHistoryItemsToProcess = v7->_pendingRemovedHistoryItemsToProcess;
    v7->_pendingRemovedHistoryItemsToProcess = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    pendingRemovedHistoryVisitsToProcess = v7->_pendingRemovedHistoryVisitsToProcess;
    v7->_pendingRemovedHistoryVisitsToProcess = (NSMutableArray *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.Safari.WBSFormAutoFillCorrectionsHistory", 0);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel__historyItemsWereRemoved_ name:@"WBSHistoryItemsWereRemovedFromDatabaseNotification" object:0];
    [v14 addObserver:v7 selector:sel__historyVisitsWereRemoved_ name:@"WBSHistoryVisitsWereRemovedFromDatabaseNotification" object:0];
    [v14 addObserver:v7 selector:sel__historyWasCleared_ name:@"WBSHistoryWasClearedNotification" object:0];
    v15 = v7;
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSFormAutoFillCorrectionsHistoryObserver;
  [(WBSFormAutoFillCorrectionsHistoryObserver *)&v2 dealloc];
}

- (void)flushPendingChangesAndDisconnectFromStoreAndHistory
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__WBSFormAutoFillCorrectionsHistoryObserver_flushPendingChangesAndDisconnectFromStoreAndHistory__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_sync(processingQueue, block);
  correctionsStore = self->_correctionsStore;
  self->_correctionsStore = 0;
}

uint64_t __96__WBSFormAutoFillCorrectionsHistoryObserver_flushPendingChangesAndDisconnectFromStoreAndHistory__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateUpdateCoalescingTimer];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 _updateCorrectionsStoreNow];
}

- (void)_historyItemsWereRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"WBSHistoryItemsKey"];
  v7 = (void *)[v6 copy];

  processingQueue = self->_processingQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__WBSFormAutoFillCorrectionsHistoryObserver__historyItemsWereRemoved___block_invoke;
  v10[3] = &unk_1E5C8D980;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(processingQueue, v10);
}

uint64_t __70__WBSFormAutoFillCorrectionsHistoryObserver__historyItemsWereRemoved___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) addObjectsFromArray:*(void *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 _updateCorrectionsStoreSoon];
}

- (void)_historyVisitsWereRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"WBSHistoryVisitsKey"];
  v7 = (void *)[v6 copy];

  processingQueue = self->_processingQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__WBSFormAutoFillCorrectionsHistoryObserver__historyVisitsWereRemoved___block_invoke;
  v10[3] = &unk_1E5C8D980;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(processingQueue, v10);
}

uint64_t __71__WBSFormAutoFillCorrectionsHistoryObserver__historyVisitsWereRemoved___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObjectsFromArray:*(void *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 _updateCorrectionsStoreSoon];
}

- (void)_historyWasCleared:(id)a3
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

uint64_t __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_super v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_2;
  v4[3] = &unk_1E5C9AE80;
  v4[4] = v1;
  return [v2 removeAllLocalClassificationsWithCompletionHandler:v4];
}

void __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_3;
    block[3] = &unk_1E5C8CA70;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateUpdateCoalescingTimer];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateCorrectionsStoreNow];
}

- (void)_invalidateUpdateCoalescingTimer
{
  coalescingTimerSource = self->_coalescingTimerSource;
  if (coalescingTimerSource)
  {
    dispatch_source_cancel(coalescingTimerSource);
    coalescingTimerSource = self->_coalescingTimerSource;
  }
  self->_coalescingTimerSource = 0;
}

- (void)_updateCorrectionsStoreSoon
{
  objc_initWeak(&location, self);
  [(WBSFormAutoFillCorrectionsHistoryObserver *)self _invalidateUpdateCoalescingTimer];
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_processingQueue);
  coalescingTimerSource = self->_coalescingTimerSource;
  self->_coalescingTimerSource = v3;

  id v5 = self->_coalescingTimerSource;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v7 = self->_coalescingTimerSource;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreSoon__block_invoke;
  v8[3] = &unk_1E5C8E340;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_coalescingTimerSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreSoon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCorrectionsStoreNow];
}

- (id)_normalizeURL:(id)a3
{
  id v4 = a3;
  domainNormalizer = self->_domainNormalizer;
  if (!domainNormalizer)
  {
    dispatch_time_t v6 = objc_alloc_init(WBSCrowdsourcedFeedbackDomainNormalizer);
    v7 = self->_domainNormalizer;
    self->_domainNormalizer = v6;

    domainNormalizer = self->_domainNormalizer;
  }
  uint64_t v8 = [v4 absoluteString];
  id v9 = [(WBSCrowdsourcedFeedbackDomainNormalizer *)domainNormalizer transformedValue:v8];

  return v9;
}

- (void)_updateCorrectionsStoreNow
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingRemovedHistoryItemsToProcess count]
    || [(NSMutableArray *)self->_pendingRemovedHistoryVisitsToProcess count])
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v23 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = self->_pendingRemovedHistoryItemsToProcess;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "url", v23);
          id v9 = [(WBSFormAutoFillCorrectionsHistoryObserver *)self _normalizeURL:v8];

          if (v9) {
            [v3 setObject:v23 forKeyedSubscript:v9];
          }
        }
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v5);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = self->_pendingRemovedHistoryVisitsToProcess;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          v15 = objc_msgSend(v14, "item", v23);
          v16 = [v15 url];
          objc_super v17 = [(WBSFormAutoFillCorrectionsHistoryObserver *)self _normalizeURL:v16];

          if (v17)
          {
            v18 = [v3 objectForKeyedSubscript:v17];
            [v14 visitTime];
            double v20 = v19;
            if (!v18 || ([v18 timeIntervalSinceReferenceDate], v21 > v20))
            {
              v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v20];
              [v3 setObject:v22 forKeyedSubscript:v17];
            }
          }
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v11);
    }

    [(NSMutableArray *)self->_pendingRemovedHistoryVisitsToProcess removeAllObjects];
    [(NSMutableArray *)self->_pendingRemovedHistoryItemsToProcess removeAllObjects];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreNow__block_invoke;
    v24[3] = &unk_1E5C9AEC8;
    v24[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v24];
  }
}

uint64_t __71__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreNow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeLocalClassificationsForDomain:a2 recordedOnOrAfter:a3 completionHandler:&__block_literal_global_47];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionsStore, 0);
  objc_storeStrong((id *)&self->_domainNormalizer, 0);
  objc_storeStrong((id *)&self->_coalescingTimerSource, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_pendingRemovedHistoryVisitsToProcess, 0);
  objc_storeStrong((id *)&self->_pendingRemovedHistoryItemsToProcess, 0);
}

@end