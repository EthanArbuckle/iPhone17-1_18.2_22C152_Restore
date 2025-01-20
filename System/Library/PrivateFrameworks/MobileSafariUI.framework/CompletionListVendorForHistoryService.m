@interface CompletionListVendorForHistoryService
- (BOOL)_shouldUseNetworkedSearchSuggestions;
- (BOOL)completionListHasScheduledDismissal:(id)a3;
- (double)_timeIntervalForUpdatesToSettle;
- (id)_browserController;
- (void)_completionListDidUpdateForQuery:(id)a3 completionList:(id)a4;
- (void)_setExportedInterfaceAndObjectForConnection:(id)a3;
- (void)completionListDidUpdate:(id)a3 forQuery:(id)a4;
- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4;
@end

@implementation CompletionListVendorForHistoryService

- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  id completionListItemsCallback = self->_completionListItemsCallback;
  self->_id completionListItemsCallback = v7;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__CompletionListVendorForHistoryService_getCompletionListItemsForQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E6D77D90;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __90__CompletionListVendorForHistoryService_getCompletionListItemsForQuery_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [CompletionList alloc];
  v3 = +[UniversalSearchSession sharedSession];
  v4 = [*(id *)(a1 + 32) _browserController];
  uint64_t v5 = [(CompletionList *)v2 initWithParsecSearchSession:v3 browserController:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setShouldIncludeNetworkedSearchSuggestions:", objc_msgSend(*(id *)(a1 + 32), "_shouldUseNetworkedSearchSuggestions"));
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F98A50]) initWithQueryString:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) setQuery:v8];
}

- (void)completionListDidUpdate:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSTimer *)self->_completionListUpdatesDidSettleTimer invalidate];
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4F1CB00];
  [(CompletionListVendorForHistoryService *)self _timeIntervalForUpdatesToSettle];
  double v10 = v9;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __74__CompletionListVendorForHistoryService_completionListDidUpdate_forQuery___block_invoke;
  v19 = &unk_1E6D7AFA8;
  objc_copyWeak(&v22, &location);
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  v13 = [v8 timerWithTimeInterval:0 repeats:&v16 block:v10];
  completionListUpdatesDidSettleTimer = self->_completionListUpdatesDidSettleTimer;
  self->_completionListUpdatesDidSettleTimer = v13;

  v15 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v16, v17, v18, v19);
  [v15 addTimer:self->_completionListUpdatesDidSettleTimer forMode:*MEMORY[0x1E4F1C3A0]];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __74__CompletionListVendorForHistoryService_completionListDidUpdate_forQuery___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) queryString];
    [WeakRetained _completionListDidUpdateForQuery:v2 completionList:*(void *)(a1 + 40)];
  }
}

- (BOOL)completionListHasScheduledDismissal:(id)a3
{
  return 0;
}

- (void)_setExportedInterfaceAndObjectForConnection:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29280];
  id v6 = a3;
  uint64_t v5 = [v4 interfaceWithProtocol:&unk_1F3CECC38];
  [v6 setExportedInterface:v5];

  [v6 setExportedObject:self];
}

- (id)_browserController
{
  v2 = [(WBSCompletionListVendorForHistoryService *)self dataSource];
  v3 = [v2 browserControllerForCompletionListVendorForHistoryService];

  return v3;
}

- (void)_completionListDidUpdateForQuery:(id)a3 completionList:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_completionListItemsCallback)
  {
    uint64_t v24 = (uint64_t)v6;
    double v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "numberOfGroups"));
    if ([v8 numberOfGroups])
    {
      unint64_t v10 = 0;
      uint64_t v11 = MEMORY[0x1E4F1CBF0];
      do
      {
        id v12 = [v8 titleForGroupAtIndex:v10];
        v13 = [v8 completionsForGroupAtIndex:v10];
        if (v12) {
          v14 = v12;
        }
        else {
          v14 = &stru_1F3C268E8;
        }
        v25[0] = @"section";
        v25[1] = @"results";
        v26[0] = v14;
        v15 = v12;
        uint64_t v16 = objc_msgSend(v13, "safari_mapObjectsUsingBlock:", &__block_literal_global_25);
        uint64_t v17 = (void *)v16;
        if (v16) {
          uint64_t v18 = v16;
        }
        else {
          uint64_t v18 = v11;
        }
        v26[1] = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

        [v9 addObject:v19];
        ++v10;
      }
      while (v10 < [v8 numberOfGroups]);
    }
    id v6 = (id)v24;
    if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
    {
      id v20 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[CompletionListVendorForHistoryService _completionListDidUpdateForQuery:completionList:](v24, (uint64_t)v9, v20);
      }
    }
    id completionListItemsCallback = (void (**)(id, void *))self->_completionListItemsCallback;
    id v22 = (void *)[v9 copy];
    completionListItemsCallback[2](completionListItemsCallback, v22);

    id v23 = self->_completionListItemsCallback;
    self->_id completionListItemsCallback = 0;
  }
}

- (double)_timeIntervalForUpdatesToSettle
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  objc_msgSend(v2, "safari_doubleForKey:defaultValue:", *MEMORY[0x1E4F99718], 2.0);
  double v4 = v3;

  return v4;
}

- (BOOL)_shouldUseNetworkedSearchSuggestions
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E4F990C8], 1);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionListUpdatesDidSettleTimer, 0);
  objc_storeStrong(&self->_completionListItemsCallback, 0);
  objc_storeStrong((id *)&self->_completionList, 0);
}

- (void)_completionListDidUpdateForQuery:(os_log_t)log completionList:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Completion list tool output for query %@: %@", (uint8_t *)&v3, 0x16u);
}

@end