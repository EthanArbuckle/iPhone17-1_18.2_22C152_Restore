@interface WBSContentBlockerStatisticsInMemoryStore
+ (NSArray)allStores;
+ (int64_t)totalBlockedTrackerCount;
- (WBSContentBlockerStatisticsInMemoryStore)init;
- (void)_clearStatisticsPassingTest:(id)a3;
- (void)_clearUnusedDomains;
- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 completionHandler:(id)a5;
- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 onFirstParty:(id)a5 completionHandler:(id)a6;
- (void)clearAllStatisticsWithCompletionHandler:(id)a3;
- (void)clearStatisticsAfter:(id)a3 before:(id)a4;
- (void)clearStatisticsForDomains:(id)a3;
- (void)dealloc;
- (void)recordThirdPartyResourceBlocked:(id)a3 onFirstParty:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSContentBlockerStatisticsInMemoryStore

+ (NSArray)allStores
{
  v2 = allStores();
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

+ (int64_t)totalBlockedTrackerCount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = +[WBSContentBlockerStatisticsInMemoryStore allStores];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __68__WBSContentBlockerStatisticsInMemoryStore_totalBlockedTrackerCount__block_invoke;
        v13[3] = &unk_1E5C8C5A8;
        id v14 = v4;
        [v9 blockedThirdPartiesAfter:v2 before:v3 onFirstParty:0 completionHandler:v13];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  int64_t v10 = [v4 count];
  return v10;
}

void __68__WBSContentBlockerStatisticsInMemoryStore_totalBlockedTrackerCount__block_invoke(uint64_t a1, void *a2)
{
}

- (WBSContentBlockerStatisticsInMemoryStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBSContentBlockerStatisticsInMemoryStore;
  v2 = [(WBSContentBlockerStatisticsInMemoryStore *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    firstPartiesByBlockedThirdParty = v2->_firstPartiesByBlockedThirdParty;
    v2->_firstPartiesByBlockedThirdParty = (NSMutableDictionary *)v3;

    uint64_t v5 = allStores();
    [v5 addObject:v2];

    uint64_t v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = allStores();
  [v3 removeObject:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:WBSContentBlockerStatisticsInMemoryStoreDidCloseNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)WBSContentBlockerStatisticsInMemoryStore;
  [(WBSContentBlockerStatisticsInMemoryStore *)&v5 dealloc];
}

- (void)recordThirdPartyResourceBlocked:(id)a3 onFirstParty:(id)a4 completionHandler:(id)a5
{
  objc_super v8 = (void (**)(id, uint64_t))a5;
  id v9 = a4;
  int64_t v10 = [a3 host];
  v11 = objc_msgSend(v10, "safari_highLevelDomainFromHost");

  v12 = [v9 host];

  v13 = objc_msgSend(v12, "safari_highLevelDomainFromHost");

  if (v11)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_firstPartiesByBlockedThirdParty objectForKeyedSubscript:v11];
    if (v14)
    {
      long long v15 = (void *)v14;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __107__WBSContentBlockerStatisticsInMemoryStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke;
      v20[3] = &unk_1E5C9A068;
      id v21 = v13;
      objc_msgSend(v15, "safari_removeObjectsPassingTest:", v20);
    }
    else
    {
      long long v15 = [MEMORY[0x1E4F1CA48] array];
      [(NSMutableDictionary *)self->_firstPartiesByBlockedThirdParty setObject:v15 forKeyedSubscript:v11];
    }
    long long v16 = [MEMORY[0x1E4F1C9C8] now];
    [v16 timeIntervalSince1970];
    double v18 = v17;

    v19 = [[WBSContentBlockerStatisticsFirstParty alloc] initWithDomain:v13 lastSeen:v18];
    [v15 addObject:v19];

    if (v8) {
      v8[2](v8, 1);
    }
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

uint64_t __107__WBSContentBlockerStatisticsInMemoryStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 domain];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 onFirstParty:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  v11 = (void (**)(id, void *))a6;
  id v12 = a4;
  [a3 timeIntervalSince1970];
  uint64_t v14 = v13;
  [v12 timeIntervalSince1970];
  uint64_t v16 = v15;

  uint64_t v17 = [v10 length];
  firstPartiesByBlockedThirdParty = self->_firstPartiesByBlockedThirdParty;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke;
  v21[3] = &unk_1E5C9A0B8;
  BOOL v25 = v17 != 0;
  id v22 = v10;
  uint64_t v23 = v14;
  uint64_t v24 = v16;
  id v19 = v10;
  uint64_t v20 = [(NSMutableDictionary *)firstPartiesByBlockedThirdParty safari_mapAndFilterKeysAndObjectsUsingBlock:v21];
  v11[2](v11, v20);
}

id __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke_2;
  v11 = &unk_1E5C9A090;
  char v14 = *(unsigned char *)(a1 + 56);
  id v12 = *(id *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 40);
  objc_super v5 = objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &v8);
  if (objc_msgSend(v5, "count", v8, v9, v10, v11)) {
    uint64_t v6 = (void *)[v5 copy];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  BOOL v8 = (!*(unsigned char *)(a1 + 56)
     || ([v3 domain],
         objc_super v5 = objc_claimAutoreleasedReturnValue(),
         int v6 = [v5 isEqualToString:*(void *)(a1 + 32)],
         v5,
         v6))
    && ([v4 lastSeen], v7 >= *(double *)(a1 + 40))
    && v7 <= *(double *)(a1 + 48);

  return v8;
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 completionHandler:(id)a5
{
}

- (void)clearAllStatisticsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(NSMutableDictionary *)self->_firstPartiesByBlockedThirdParty removeAllObjects];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)clearStatisticsAfter:(id)a3 before:(id)a4
{
  id v6 = a4;
  [a3 timeIntervalSince1970];
  uint64_t v8 = v7;
  [v6 timeIntervalSince1970];
  uint64_t v10 = v9;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsAfter_before___block_invoke;
  v11[3] = &__block_descriptor_48_e47_B16__0__WBSContentBlockerStatisticsFirstParty_8l;
  v11[4] = v8;
  v11[5] = v10;
  [(WBSContentBlockerStatisticsInMemoryStore *)self _clearStatisticsPassingTest:v11];
}

BOOL __72__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsAfter_before___block_invoke(uint64_t a1, void *a2)
{
  [a2 lastSeen];
  return v3 >= *(double *)(a1 + 32) && v3 <= *(double *)(a1 + 40);
}

- (void)clearStatisticsForDomains:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_28);
  id v6 = [v4 setWithArray:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_14;
  v8[3] = &unk_1E5C9A120;
  id v9 = v6;
  id v7 = v6;
  [(WBSContentBlockerStatisticsInMemoryStore *)self _clearStatisticsPassingTest:v8];
}

uint64_t __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = objc_msgSend(v2, "safari_highLevelDomainFromHost");
  uint64_t v4 = [v2 isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_cold_1((uint64_t)v2, v5);
    }
  }

  return v4;
}

uint64_t __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [a2 domain];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)_clearStatisticsPassingTest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_firstPartiesByBlockedThirdParty allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __72__WBSContentBlockerStatisticsInMemoryStore__clearStatisticsPassingTest___block_invoke;
        v11[3] = &unk_1E5C9A148;
        id v12 = v4;
        objc_msgSend(v10, "safari_removeObjectsPassingTest:", v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(WBSContentBlockerStatisticsInMemoryStore *)self _clearUnusedDomains];
}

uint64_t __72__WBSContentBlockerStatisticsInMemoryStore__clearStatisticsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_clearUnusedDomains
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->_firstPartiesByBlockedThirdParty;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_firstPartiesByBlockedThirdParty, "objectForKeyedSubscript:", v8, (void)v11);
        uint64_t v10 = [v9 count];

        if (!v10) {
          [(NSMutableDictionary *)self->_firstPartiesByBlockedThirdParty setObject:0 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
}

void __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Could not remove content blocker statistics for non high-level domain %{private}@", (uint8_t *)&v2, 0xCu);
}

@end