@interface TUSearchController
+ (TUSearchController)sharedInstance;
- (CNContactStore)contactStore;
- (NSMutableArray)recentsModules;
- (NSMutableDictionary)searchModules;
- (OS_dispatch_queue)searchQueue;
- (TUSearchController)init;
- (id)_searchModuleCompletionWithModules:(id)a3 searchTerm:(id)a4 resultsClass:(Class)a5 completion:(id)a6;
- (id)recentsModuleCompletionWithCompletion:(id)a3;
- (id)searchModuleCompletionWithSearchTerm:(id)a3 completion:(id)a4;
- (void)_cancelRecentSearches;
- (void)_cancelSearchsForSearchTerm:(id)a3;
- (void)_clearIdsDestinations;
- (void)_fetchIdsDestinationsIfNeeded:(id)a3 withReason:(int)a4;
- (void)recentsWithCompletion:(id)a3;
- (void)searchForString:(id)a3 completion:(id)a4;
- (void)setContactStore:(id)a3;
- (void)setRecentsModules:(id)a3;
- (void)setSearchModules:(id)a3;
- (void)setSearchQueue:(id)a3;
@end

@implementation TUSearchController

+ (TUSearchController)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance_gSharedController;

  return (TUSearchController *)v2;
}

uint64_t __36__TUSearchController_sharedInstance__block_invoke()
{
  sharedInstance_gSharedController = objc_alloc_init(TUSearchController);

  return MEMORY[0x1F41817F8]();
}

- (TUSearchController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUSearchController;
  v2 = [(TUSearchController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.searchcontroller", 0);
    searchQueue = v2->_searchQueue;
    v2->_searchQueue = (OS_dispatch_queue *)v3;

    v2->_searchModulesLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    searchModules = v2->_searchModules;
    v2->_searchModules = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_msgSend(MEMORY[0x1E4F1B980], "tu_contactStore");
    v4 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (void)recentsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUSearchController *)self searchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__TUSearchController_recentsWithCompletion___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__TUSearchController_recentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _cancelRecentSearches];
  v2 = +[TUSearchModuleManager recentsModuleClasses];
  dispatch_queue_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  [*(id *)(a1 + 32) setRecentsModules:v3];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_alloc_init(*(Class *)(*((void *)&v22 + 1) + 8 * v8));
        [v9 setSearchController:*(void *)(a1 + 32)];
        v10 = [*(id *)(a1 + 32) recentsModules];
        [v10 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = objc_msgSend(*(id *)(a1 + 32), "recentsModules", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        v17 = [*(id *)(a1 + 32) recentsModuleCompletionWithCompletion:*(void *)(a1 + 40)];
        [v16 searchForString:&stru_1EECEA668 completion:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }
}

- (void)searchForString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUSearchController *)self searchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__TUSearchController_searchForString_completion___block_invoke;
  block[3] = &unk_1E58E75D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __49__TUSearchController_searchForString_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _cancelSearchsForSearchTerm:*(void *)(a1 + 40)];
  v2 = +[TUSearchModuleManager searchModuleClasses];
  dispatch_queue_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_alloc_init(*(Class *)(*((void *)&v24 + 1) + 8 * i));
        [v9 setSearchController:*(void *)(a1 + 32)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  if ([*(id *)(a1 + 40) length])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v10 = (void *)[v3 copy];
    v11 = [*(id *)(a1 + 32) searchModules];
    [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          uint64_t v18 = *(void *)(a1 + 40);
          long long v19 = objc_msgSend(*(id *)(a1 + 32), "searchModuleCompletionWithSearchTerm:completion:", v18, *(void *)(a1 + 48), (void)v20);
          [v17 searchForString:v18 completion:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }
  }
}

- (void)_cancelRecentSearches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [(TUSearchController *)self recentsModules];

  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(TUSearchController *)self recentsModules];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v8++) cancelSearch];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(TUSearchController *)self setRecentsModules:0];
    id v9 = +[TUIDSLookupManager sharedManager];
    [v9 cancelQueries];

    [(TUSearchController *)self _clearIdsDestinations];
  }
}

- (void)_cancelSearchsForSearchTerm:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_searchModulesLock);
  uint64_t v5 = [(TUSearchController *)self searchModules];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11++), "cancelSearch", (void)v14);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    long long v12 = [(TUSearchController *)self searchModules];
    [v12 removeObjectForKey:v4];

    long long v13 = +[TUIDSLookupManager sharedManager];
    [v13 cancelQueries];

    [(TUSearchController *)self _clearIdsDestinations];
  }
  os_unfair_lock_unlock(&self->_searchModulesLock);
}

- (void)_fetchIdsDestinationsIfNeeded:(id)a3 withReason:(int)a4
{
  id v11 = a3;
  uint64_t v6 = [(TUSearchController *)self searchQueue];
  dispatch_assert_queue_V2(v6);

  if (!self->_idsDestinations)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    idsDestinations = self->_idsDestinations;
    self->_idsDestinations = v7;
  }
  if (a4 == 1)
  {
    id v9 = (id)[v11 mutableCopy];
    [v9 minusSet:self->_idsDestinations];
  }
  else if (a4)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v11;
  }
  if ([v9 count])
  {
    uint64_t v10 = +[TUIDSLookupManager sharedManager];
    [v10 beginBatchQueryWithDestinations:v9];

    [(NSMutableSet *)self->_idsDestinations unionSet:v9];
  }
}

- (void)_clearIdsDestinations
{
  dispatch_queue_t v3 = [(TUSearchController *)self searchQueue];
  dispatch_assert_queue_V2(v3);

  idsDestinations = self->_idsDestinations;
  self->_idsDestinations = 0;
}

- (id)recentsModuleCompletionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUSearchController *)self recentsModules];
  uint64_t v6 = [(TUSearchController *)self _searchModuleCompletionWithModules:v5 searchTerm:&stru_1EECEA668 resultsClass:objc_opt_class() completion:v4];

  return v6;
}

- (id)searchModuleCompletionWithSearchTerm:(id)a3 completion:(id)a4
{
  p_searchModulesLock = &self->_searchModulesLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_searchModulesLock);
  id v9 = [(TUSearchController *)self searchModules];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(p_searchModulesLock);
  id v11 = [(TUSearchController *)self _searchModuleCompletionWithModules:v10 searchTerm:v8 resultsClass:objc_opt_class() completion:v7];

  return v11;
}

- (id)_searchModuleCompletionWithModules:(id)a3 searchTerm:(id)a4 resultsClass:(Class)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke;
  aBlock[3] = &unk_1E58E7910;
  aBlock[4] = self;
  id v20 = v10;
  id v22 = v12;
  Class v23 = a5;
  id v21 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  long long v16 = _Block_copy(aBlock);
  long long v17 = _Block_copy(v16);

  return v17;
}

void __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) searchQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke_2;
  v8[3] = &unk_1E58E78E8;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  uint64_t v14 = *(void *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __92__TUSearchController__searchModuleCompletionWithModules_searchTerm_resultsClass_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v33;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v32 + 1) + 8 * v6) isSearchComplete]) {
          break;
        }
        if (v4 == ++v6)
        {
          uint64_t v4 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v4) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      if (+[TUCallCapabilities supportsTelephonyCalls]) {
        uint64_t v7 = +[TUCallCapabilities supportsPrimaryCalling] ^ 1;
      }
      else {
        uint64_t v7 = 0;
      }
      id v2 = (id)[objc_alloc(*(Class *)(a1 + 72)) initWithSearchTerm:*(void *)(a1 + 48) shouldAddAdhocResults:v7];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) searchResults];
            [v2 addSearchResults:v13];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v10);
      }

      [v2 finalizeSearchResults];
      uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = objc_msgSend(v2, "allDataItems", 0);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = [*(id *)(*((void *)&v24 + 1) + 8 * v19) idsCanonicalDestinations];
            [v14 addObjectsFromArray:v20];

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
        }
        while (v17);
      }

      objc_msgSend(*(id *)(a1 + 56), "_fetchIdsDestinationsIfNeeded:withReason:", v14, objc_msgSend(*(id *)(a1 + 48), "length") == 0);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      uint64_t v21 = [*(id *)(a1 + 48) length];
      id v22 = *(os_unfair_lock_s **)(a1 + 56);
      if (v21)
      {
        os_unfair_lock_lock(v22 + 2);
        Class v23 = [*(id *)(a1 + 56) searchModules];
        [v23 removeObjectForKey:*(void *)(a1 + 48)];

        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 56) + 8));
      }
      else
      {
        [(os_unfair_lock_s *)v22 setRecentsModules:0];
      }
    }
  }
}

- (void)setContactStore:(id)a3
{
}

- (NSMutableDictionary)searchModules
{
  return self->_searchModules;
}

- (void)setSearchModules:(id)a3
{
}

- (NSMutableArray)recentsModules
{
  return self->_recentsModules;
}

- (void)setRecentsModules:(id)a3
{
}

- (OS_dispatch_queue)searchQueue
{
  return self->_searchQueue;
}

- (void)setSearchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_recentsModules, 0);
  objc_storeStrong((id *)&self->_searchModules, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_idsDestinations, 0);
}

@end