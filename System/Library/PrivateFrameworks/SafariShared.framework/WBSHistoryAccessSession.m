@interface WBSHistoryAccessSession
- (WBSHistoryAccessSession)initWithHistoryService:(id)a3;
- (void)getHistoryItemsVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)getHistoryVisitsAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSHistoryAccessSession

- (WBSHistoryAccessSession)initWithHistoryService:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryAccessSession;
  v6 = [(WBSHistoryAccessSession *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_historyService, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryAccessSession", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)getHistoryItemsVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WBSHistoryService *)self->_historyService databaseAccessBroker];
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke;
  v16[3] = &unk_1E5C9C178;
  id v13 = v10;
  id v19 = v13;
  id v14 = v8;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  [v11 requestAccessType:0 onQueue:queue completionHandler:v16];
}

void __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
    uint64_t v19 = v7;
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    uint64_t v18 = v8;
    id v9 = SafariShared::WBSSQLiteDatabaseFetch<double,double>(v5, @"SELECT history_items.*, history_visits.* FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item WHERE (history_visits.visit_time > ? AND history_visits.visit_time < ?) AND     NOT EXISTS (SELECT * FROM history_visits v2                 WHERE history_visits.history_item = v2.history_item AND                     (v2.visit_time > history_visits.visit_time OR                         (v2.visit_time = history_visits.visit_time AND                             (v2.synthesized < history_visits.synthesized OR                                 (v2.synthesized = history_visits.synthesized AND v2.id > history_visits.id)))))", (double *)&v19, (double *)&v18);
    id v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = +[WBSHistoryItem synchronizationQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5C8D980;
    id v12 = v9;
    id v16 = v12;
    id v13 = v10;
    id v17 = v13;
    dispatch_sync(v11, v15);

    (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v13, 0, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v15;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v15 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = [[WBSHistoryItem alloc] initWithSQLiteRow:*(void *)(*((void *)&v14 + 1) + 8 * v4)];
        id v6 = [(WBSHistoryItem *)v5 lastVisitOnSynchronizationQueue];
        uint64_t v7 = [WBSRemoteHistoryItem alloc];
        uint64_t v8 = [(WBSHistoryItem *)v5 url];
        id v9 = [v6 title];
        id v10 = (void *)MEMORY[0x1E4F1C9C8];
        [v6 visitTime];
        v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
        id v12 = [(WBSRemoteHistoryItem *)v7 initWithURL:v8 title:v9 lastVisitTime:v11];

        [*(id *)(a1 + 40) addObject:v12];
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v2);
  }
}

- (void)getHistoryVisitsAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WBSHistoryService *)self->_historyService databaseAccessBroker];
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke;
  v16[3] = &unk_1E5C9C178;
  id v13 = v10;
  id v19 = v13;
  id v14 = v8;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  [v11 requestAccessType:0 onQueue:queue completionHandler:v16];
}

void __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
    uint64_t v19 = v7;
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    uint64_t v18 = v8;
    id v9 = SafariShared::WBSSQLiteDatabaseFetch<double &,double &>(v5, @"SELECT history_items.url, history_visits.visit_time FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item WHERE visit_time BETWEEN ? AND ?", (double *)&v19, (double *)&v18);
    id v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = +[WBSHistoryItem synchronizationQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5C8D980;
    id v12 = v9;
    id v16 = v12;
    id v13 = v10;
    id v17 = v13;
    dispatch_sync(v11, v15);

    (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v13, 0, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v8 = objc_msgSend(v6, "stringAtIndex:", 0, (void)v14);
        id v9 = objc_msgSend(v7, "safari_URLWithDataAsString:", v8);

        if (v9)
        {
          id v10 = (void *)MEMORY[0x1E4F1C9C8];
          [v6 doubleAtIndex:1];
          v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
          id v12 = *(void **)(a1 + 40);
          id v13 = [[WBSRemoteHistoryVisit alloc] initWithURL:v9 date:v11];
          [v12 addObject:v13];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_historyService, 0);
}

@end