@interface WBSFrequentlyVisitedSitesBannedURLStore
- (BOOL)containsURLString:(id)a3;
- (WBSFrequentlyVisitedSitesBannedURLStore)initWithStoreURL:(id)a3 history:(id)a4;
- (id)_bannedURLStringsToEntriesMap;
- (id)urlStrings;
- (void)_bannedURLStringsToEntriesMap;
- (void)_historyItemsWereRemoved:(id)a3;
- (void)_writeOutBannedURLStringsAsynchronously;
- (void)addURLString:(id)a3;
- (void)dealloc;
- (void)removeAllURLStrings;
- (void)removeURLStrings:(id)a3;
@end

@implementation WBSFrequentlyVisitedSitesBannedURLStore

- (WBSFrequentlyVisitedSitesBannedURLStore)initWithStoreURL:(id)a3 history:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSFrequentlyVisitedSitesBannedURLStore;
  v9 = [(WBSFrequentlyVisitedSitesBannedURLStore *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeURL, a3);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SafariShared.FrequentlyVisitedSitesBannedURLStore", 0);
    storeQueue = v10->_storeQueue;
    v10->_storeQueue = (OS_dispatch_queue *)v11;

    if (v8)
    {
      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:v10 selector:sel__historyWasCleared_ name:@"WBSHistoryWasClearedNotification" object:v8];
      [v13 addObserver:v10 selector:sel__historyItemsWereRemoved_ name:@"WBSHistoryItemsWereRemovedNotification" object:v8];
    }
    v14 = v10;
  }

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSFrequentlyVisitedSitesBannedURLStore;
  [(WBSFrequentlyVisitedSitesBannedURLStore *)&v4 dealloc];
}

- (BOOL)containsURLString:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_canonicalURLStringForFrequentlyVisitedSites");
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  storeQueue = self->_storeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSFrequentlyVisitedSitesBannedURLStore_containsURLString___block_invoke;
  block[3] = &unk_1E5C9A498;
  id v10 = v5;
  dispatch_queue_t v11 = &v12;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(storeQueue, block);
  LOBYTE(storeQueue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)storeQueue;
}

void __61__WBSFrequentlyVisitedSitesBannedURLStore_containsURLString___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _bannedURLStringsToEntriesMap];
  v2 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

- (void)addURLString:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_canonicalURLStringForFrequentlyVisitedSites");
  storeQueue = self->_storeQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __56__WBSFrequentlyVisitedSitesBannedURLStore_addURLString___block_invoke;
  dispatch_queue_t v11 = &unk_1E5C8D980;
  uint64_t v12 = self;
  id v13 = v5;
  id v7 = v5;
  dispatch_async(storeQueue, &v8);
  [(WBSFrequentlyVisitedSitesBannedURLStore *)self _writeOutBannedURLStringsAsynchronously];
}

void __56__WBSFrequentlyVisitedSitesBannedURLStore_addURLString___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = @"URLString";
  v6[1] = @"DateAdded";
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v5 = [*(id *)(a1 + 32) _bannedURLStringsToEntriesMap];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)removeURLStrings:(id)a3
{
  id v4 = a3;
  storeQueue = self->_storeQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __60__WBSFrequentlyVisitedSitesBannedURLStore_removeURLStrings___block_invoke;
  id v10 = &unk_1E5C8D980;
  dispatch_queue_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(storeQueue, &v7);
  [(WBSFrequentlyVisitedSitesBannedURLStore *)self _writeOutBannedURLStringsAsynchronously];
}

void __60__WBSFrequentlyVisitedSitesBannedURLStore_removeURLStrings___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _bannedURLStringsToEntriesMap];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "safari_canonicalURLStringForFrequentlyVisitedSites", (void)v8);
        [v2 removeObjectForKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)removeAllURLStrings
{
  storeQueue = self->_storeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSFrequentlyVisitedSitesBannedURLStore_removeAllURLStrings__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_async(storeQueue, block);
  [(WBSFrequentlyVisitedSitesBannedURLStore *)self _writeOutBannedURLStringsAsynchronously];
}

void __62__WBSFrequentlyVisitedSitesBannedURLStore_removeAllURLStrings__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _bannedURLStringsToEntriesMap];
  [v1 removeAllObjects];
}

- (id)urlStrings
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__15;
  long long v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  storeQueue = self->_storeQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__WBSFrequentlyVisitedSitesBannedURLStore_urlStrings__block_invoke;
  v5[3] = &unk_1E5C8E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(storeQueue, v5);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__WBSFrequentlyVisitedSitesBannedURLStore_urlStrings__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _bannedURLStringsToEntriesMap];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_historyItemsWereRemoved:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v6 = [v4 objectForKeyedSubscript:@"WBSHistoryItemsKey"];

  id v5 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_56);
  [(WBSFrequentlyVisitedSitesBannedURLStore *)self removeURLStrings:v5];
}

id __68__WBSFrequentlyVisitedSitesBannedURLStore__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 urlString];
  return v2;
}

- (id)_bannedURLStringsToEntriesMap
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  bannedURLStringsToEntriesMap = self->_bannedURLStringsToEntriesMap;
  if (bannedURLStringsToEntriesMap)
  {
    uint64_t v3 = bannedURLStringsToEntriesMap;
  }
  else
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = self->_bannedURLStringsToEntriesMap;
    self->_bannedURLStringsToEntriesMap = v5;

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:self->_storeURL];
    uint64_t v8 = v7;
    if (v7)
    {
      long long v9 = [v7 objectForKeyedSubscript:@"BannedURLStrings"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id obj = [v8 objectForKeyedSubscript:@"BannedURLStrings"];
        uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_26;
              }
              char v15 = [v14 objectForKeyedSubscript:@"URLString"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_25;
              }
              objc_super v16 = [v14 objectForKeyedSubscript:@"DateAdded"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

LABEL_25:
LABEL_26:
                v23 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
                  -[WBSFrequentlyVisitedSitesBannedURLStore _bannedURLStringsToEntriesMap](v23);
                }
                uint64_t v3 = self->_bannedURLStringsToEntriesMap;

                goto LABEL_20;
              }
              v17 = [v14 allKeys];
              BOOL v18 = [v17 count] == 2;

              if (!v18) {
                goto LABEL_26;
              }
              v19 = self->_bannedURLStringsToEntriesMap;
              v20 = [v14 objectForKeyedSubscript:@"URLString"];
              [(NSMutableDictionary *)v19 setObject:v14 forKeyedSubscript:v20];
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v21 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[WBSFrequentlyVisitedSitesBannedURLStore _bannedURLStringsToEntriesMap](v21);
        }
      }
    }
    uint64_t v3 = self->_bannedURLStringsToEntriesMap;
LABEL_20:
  }
  return v3;
}

- (void)_writeOutBannedURLStringsAsynchronously
{
}

void __82__WBSFrequentlyVisitedSitesBannedURLStore__writeOutBannedURLStringsAsynchronously__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id **)(a1 + 40);
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allValues", v2, @"BannedURLStrings");
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v4 writeToURL:*(void *)(*(void *)(a1 + 32) + 8) atomically:1];

  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x1AD0C4750]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannedURLStringsToEntriesMap, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (void)_bannedURLStringsToEntriesMap
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Frequently Visited Sites banned URL store is malformed.", v1, 2u);
}

@end