@interface SFHistoryViewDataSource
- (History)history;
- (SFHistoryViewDataSource)initWithHistory:(id)a3;
- (SFHistoryViewDataSourceDelegate)delegate;
- (id)_browsingSessions;
- (id)_filteredHistorySessionsForPredicate:(id)a3;
- (void)_saveChangesToCloudHistory;
- (void)_updateFilterPredicate;
- (void)_updateIfNeeded;
- (void)dealloc;
- (void)deleteHistoryItems:(id)a3 completionHandler:(id)a4;
- (void)filterUsingPredicate:(id)a3;
- (void)historyChanged:(id)a3;
- (void)saveChangesToCloudHistorySoon;
- (void)setDelegate:(id)a3;
@end

@implementation SFHistoryViewDataSource

- (SFHistoryViewDataSource)initWithHistory:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFHistoryViewDataSource;
  v6 = [(SFHistoryViewDataSource *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_history, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CAA0] orderedSet];
    unfilteredSessions = v7->_unfilteredSessions;
    v7->_unfilteredSessions = (NSOrderedSet *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mobilesafari.SFHistoryViewDataSource", 0);
    filteringQueue = v7->_filteringQueue;
    v7->_filteringQueue = (OS_dispatch_queue *)v10;

    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __43__SFHistoryViewDataSource_initWithHistory___block_invoke;
    v19 = &unk_1E6D77D90;
    v12 = v7;
    v20 = v12;
    id v21 = v5;
    [v21 performBlockAfterHistoryHasLoaded:&v16];
    v13 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v16, v17, v18, v19);
    [v13 addObserver:v12 selector:sel_historyChanged_ name:*MEMORY[0x1E4F99260] object:0];

    v14 = v12;
  }

  return v7;
}

void __43__SFHistoryViewDataSource_initWithHistory___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__SFHistoryViewDataSource_initWithHistory___block_invoke_2;
  v2[3] = &unk_1E6D77D90;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __43__SFHistoryViewDataSource_initWithHistory___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F98BB0]) initWithHistory:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 18) = 1;
  id v5 = *(void **)(a1 + 32);
  return [v5 _updateIfNeeded];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*MEMORY[0x1E4F99260]];

  v4.receiver = self;
  v4.super_class = (Class)SFHistoryViewDataSource;
  [(SFHistoryViewDataSource *)&v4 dealloc];
}

- (void)historyChanged:(id)a3
{
  self->_updateFlags.changedExternally = 1;
  [(SFHistoryViewDataSource *)self _updateIfNeeded];
}

- (void)filterUsingPredicate:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userFilterPredicate, a3);
    [(SFHistoryViewDataSource *)self _updateFilterPredicate];
  }
}

- (void)_updateFilterPredicate
{
  objc_storeStrong((id *)&self->_filterPredicate, self->_userFilterPredicate);
  self->_updateFlags.filterChanged = 1;
  [(SFHistoryViewDataSource *)self _updateIfNeeded];
}

- (void)_updateIfNeeded
{
  if ((self->_updateFlags.filterChanged || self->_updateFlags.changedExternally)
    && !self->_updateFlags.isUpdating
    && !self->_updateFlags.suppressingUpdatesCount
    && self->_sessionController)
  {
    if (self->_updateFlags.changedExternally)
    {
      unfilteredSessions = self->_unfilteredSessions;
      self->_unfilteredSessions = 0;
    }
    *(_WORD *)&self->_updateFlags.isUpdating = 1;
    self->_updateFlags.changedExternally = 0;
    filteringQueue = self->_filteringQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_async(filteringQueue, block);
  }
}

void __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _filteredHistorySessionsForPredicate:*(void *)(*(void *)(a1 + 32) + 48)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke_2;
  v4[3] = &unk_1E6D77D90;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained historyViewDataSource:*(void *)(a1 + 32) didComputeSessions:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  id v3 = *(void **)(a1 + 32);
  return [v3 _updateIfNeeded];
}

- (id)_filteredHistorySessionsForPredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SFHistoryViewDataSource *)self _browsingSessions];
  v6 = v5;
  if (v4)
  {
    id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v19 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v14 = [v13 historyItems];
          v15 = [v14 array];
          uint64_t v16 = [v15 filteredArrayUsingPredicate:v4];

          if ([v16 count])
          {
            uint64_t v17 = [v13 filteredSessionWithItems:v16];
            [v7 addObject:v17];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    v6 = v19;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)_browsingSessions
{
  p_unfilteredSessions = &self->_unfilteredSessions;
  unfilteredSessions = self->_unfilteredSessions;
  if (unfilteredSessions)
  {
    id v4 = unfilteredSessions;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA70] orderedSet];
    v6 = [(WBSHistorySessionController *)self->_sessionController orderedSessions];
    if ([v6 count])
    {
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x3032000000;
      v17[3] = __Block_byref_object_copy__2;
      v17[4] = __Block_byref_object_dispose__2;
      id v18 = 0;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__2;
      v15[4] = __Block_byref_object_dispose__2;
      id v16 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __44__SFHistoryViewDataSource__browsingSessions__block_invoke;
      v11[3] = &unk_1E6D78FC0;
      v11[4] = self;
      v13 = v17;
      v14 = v15;
      id v7 = v4;
      v12 = v7;
      [v6 enumerateObjectsUsingBlock:v11];
      objc_storeStrong((id *)p_unfilteredSessions, v4);
      id v8 = v12;
      uint64_t v9 = v7;

      _Block_object_dispose(v15, 8);
      _Block_object_dispose(v17, 8);
    }
  }
  return v4;
}

void __44__SFHistoryViewDataSource__browsingSessions__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [*(id *)(*(void *)(a1 + 32) + 8) itemsLastVisitedInSession:v5];
  id v7 = v6;
  v48 = v6;
  if (a3 > 2)
  {
    v37 = [SFHistoryViewDataSourceSession alloc];
    v38 = [v5 startDate];
    v39 = +[History sessionIdentifierFromDate:v38];
    v40 = *(void **)(*(void *)(a1 + 32) + 72);
    v41 = [v5 startDate];
    v42 = [v40 titleForDate:v41];
    v43 = [v5 startDate];
    v44 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
    v45 = [(SFHistoryViewDataSourceSession *)v37 initWithIdentifier:v39 title:v42 lastVisitedDate:v43 historyItems:v44];

    id v7 = v48;
    [*(id *)(a1 + 40) addObject:v45];
  }
  else
  {
    id v46 = v5;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v53;
      unint64_t v11 = 0x1E6D75000uLL;
      uint64_t v47 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v53 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v14 = *(void **)(v11 + 2088);
          v15 = [v13 lastVisitedDate];
          id v16 = [v14 sessionIdentifierFromDate:v15];

          if (([v16 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] & 1) == 0)
          {
            uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) firstObject];

            if (v17)
            {
              v50 = *(void **)(a1 + 40);
              v49 = [SFHistoryViewDataSourceSession alloc];
              uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
              v19 = *(void **)(*(void *)(a1 + 32) + 72);
              v51 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) firstObject];
              long long v20 = [v51 lastVisitedDate];
              long long v21 = [v19 titleForDate:v20];
              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) firstObject];
              v23 = uint64_t v22 = v9;
              v24 = [v23 lastVisitedDate];
              uint64_t v25 = [(SFHistoryViewDataSourceSession *)v49 initWithIdentifier:v18 title:v21 lastVisitedDate:v24 historyItems:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
              [v50 addObject:v25];

              uint64_t v10 = v47;
              uint64_t v9 = v22;

              unint64_t v11 = 0x1E6D75000;
              id v7 = v48;
            }
            uint64_t v26 = [MEMORY[0x1E4F1CA70] orderedSet];
            uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
            v28 = *(void **)(v27 + 40);
            *(void *)(v27 + 40) = v26;

            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v16);
          }
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v9);
    }
    v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) firstObject];

    id v5 = v46;
    if (v29)
    {
      v30 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) firstObject];
      v31 = [v30 lastVisitedDate];

      v32 = +[History sessionIdentifierFromDate:v31];
      v33 = *(void **)(a1 + 40);
      v34 = [SFHistoryViewDataSourceSession alloc];
      v35 = [*(id *)(*(void *)(a1 + 32) + 72) titleForDate:v31];
      v36 = [(SFHistoryViewDataSourceSession *)v34 initWithIdentifier:v32 title:v35 lastVisitedDate:v31 historyItems:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [v33 addObject:v36];
    }
  }
}

- (void)deleteHistoryItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &__block_literal_global_8;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_2;
  v24[3] = &unk_1E6D78FE8;
  id v25 = v9;
  id v11 = v9;
  v12 = [v10 predicateWithBlock:v24];
  filteringQueue = self->_filteringQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_3;
  block[3] = &unk_1E6D78460;
  block[4] = self;
  id v21 = v12;
  id v22 = v6;
  id v23 = v8;
  id v14 = v8;
  id v15 = v6;
  id v16 = v12;
  dispatch_async(filteringQueue, block);
  uint64_t v17 = objc_msgSend(v15, "safari_mapObjectsUsingBlock:", &__block_literal_global_17);
  uint64_t v18 = (void *)MEMORY[0x1E4F98AB8];
  v19 = [(WBSHistory *)self->_history profileLocalIdentifier];
  [v18 deleteUsageHistoryForURLs:v17 profileIdentifier:v19 completionHandler:0];
}

uint64_t __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _filteredHistorySessionsForPredicate:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_4;
  v4[3] = &unk_1E6D78460;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 1;
  [*(id *)(a1 + 32) _updateIfNeeded];
  ++*(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 72);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_5;
  v5[3] = &unk_1E6D78748;
  v5[4] = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v3 removeItems:v4 completionHanlder:v5];
}

uint64_t __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_5(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 24);
  [*(id *)(a1 + 32) _updateIfNeeded];
  [*(id *)(a1 + 32) saveChangesToCloudHistorySoon];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 url];
}

- (void)saveChangesToCloudHistorySoon
{
  [(NSTimer *)self->_saveChangesToCloudHistoryTimer invalidate];
  id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__saveChangesToCloudHistory selector:0 userInfo:0 repeats:3.0];
  saveChangesToCloudHistoryTimer = self->_saveChangesToCloudHistoryTimer;
  self->_saveChangesToCloudHistoryTimer = v3;
}

- (void)_saveChangesToCloudHistory
{
  id v2 = +[Application sharedApplication];
  [v2 saveChangesToCloudHistoryStore];
}

- (History)history
{
  return self->_history;
}

- (SFHistoryViewDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFHistoryViewDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_saveChangesToCloudHistoryTimer, 0);
  objc_storeStrong((id *)&self->_filteringQueue, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_userFilterPredicate, 0);
  objc_storeStrong((id *)&self->_unfilteredSessions, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
}

@end