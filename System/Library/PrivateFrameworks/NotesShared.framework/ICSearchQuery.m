@interface ICSearchQuery
+ (id)defaultAttributesToReturnFromCoreSpotlight;
- (BOOL)modernResultsOnly;
- (BOOL)run:(id *)a3;
- (BOOL)wasForceStopped;
- (CSSearchQuery)searchQuery;
- (ICRankingQueriesDefinition)rankingQueriesDefinition;
- (ICSearchQuery)initWithExternalRankingQueries:(id)a3;
- (ICSearchQuery)initWithRankingQueriesDefinition:(id)a3;
- (NSArray)externalRankingQueries;
- (NSDictionary)queryResults;
- (NSMutableDictionary)mutableQueryResults;
- (OS_dispatch_semaphore)synchronousSemaphore;
- (double)timeoutInterval;
- (id)attributesToFetch;
- (id)newSearchQueryContext;
- (id)newSearchQueryWithContext:(id)a3;
- (id)queryResultsToAddFromBatch:(id)a3;
- (id)rankingQueries;
- (void)cancel;
- (void)forceStop;
- (void)setExternalRankingQueries:(id)a3;
- (void)setMutableQueryResults:(id)a3;
- (void)setRankingQueriesDefinition:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSynchronousSemaphore:(id)a3;
- (void)setWasForceStopped:(BOOL)a3;
- (void)setupWithAttributes:(id)a3;
@end

@implementation ICSearchQuery

- (ICSearchQuery)initWithRankingQueriesDefinition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSearchQuery;
  v6 = [(ICSearchQuery *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rankingQueriesDefinition, a3);
  }

  return v7;
}

- (ICSearchQuery)initWithExternalRankingQueries:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSearchQuery;
  v6 = [(ICSearchQuery *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_externalRankingQueries, a3);
  }

  return v7;
}

- (id)rankingQueries
{
  v3 = [(ICSearchQuery *)self rankingQueriesDefinition];

  if (v3)
  {
    v4 = [(ICSearchQuery *)self rankingQueriesDefinition];
    id v5 = [v4 rankingQueries];
  }
  else
  {
    id v5 = [(ICSearchQuery *)self externalRankingQueries];
  }
  return v5;
}

- (id)attributesToFetch
{
  v2 = objc_opt_class();
  return (id)[v2 defaultAttributesToReturnFromCoreSpotlight];
}

- (double)timeoutInterval
{
  return 0.0;
}

- (id)newSearchQueryContext
{
  return objc_alloc_init(MEMORY[0x1E4F23830]);
}

- (id)newSearchQueryWithContext:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F23828];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithQueryString:&stru_1F1F2FFF8 queryContext:v4];

  return v5;
}

- (id)queryResultsToAddFromBatch:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)run:(id *)a3
{
  id v5 = [(ICSearchQuery *)self searchQuery];

  if (!v5)
  {
    v6 = [(ICSearchQuery *)self attributesToFetch];
    [(ICSearchQuery *)self setupWithAttributes:v6];
  }
  v7 = [(ICSearchQuery *)self searchQuery];

  if (!v7) {
    [(ICSearchQuery *)self cancel];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__42;
  v32 = __Block_byref_object_dispose__42;
  id v33 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  [(ICSearchQuery *)self setSynchronousSemaphore:v8];

  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __21__ICSearchQuery_run___block_invoke;
  v25[3] = &unk_1E64A7C70;
  objc_copyWeak(&v26, &location);
  v25[4] = &v28;
  objc_super v9 = [(ICSearchQuery *)self searchQuery];
  [v9 setCompletionHandler:v25];

  v10 = [(ICSearchQuery *)self searchQuery];
  [v10 start];

  v11 = [(ICSearchQuery *)self synchronousSemaphore];

  if (!v11) {
    goto LABEL_11;
  }
  [(ICSearchQuery *)self timeoutInterval];
  BOOL v13 = v12 > 0.0;
  if (v12 <= 0.0)
  {
    v19 = [(ICSearchQuery *)self synchronousSemaphore];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_13;
  }
  v14 = [(ICSearchQuery *)self synchronousSemaphore];
  [(ICSearchQuery *)self timeoutInterval];
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  intptr_t v17 = dispatch_semaphore_wait(v14, v16);

  v18 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ICSearchQuery run:]();
  }

  if (!v17)
  {
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  v19 = [(ICSearchQuery *)self searchQuery];
  [v19 cancel];
LABEL_13:

LABEL_14:
  if ([(ICSearchQuery *)self wasForceStopped])
  {
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F83668] code:216 userInfo:0];
    v21 = (void *)v29[5];
    v29[5] = v20;
  }
  if (a3) {
    *a3 = (id) v29[5];
  }
  [(ICSearchQuery *)self queryFinishedRunningWithError:v29[5]];
  if (v13 || v29[5] || [(ICSearchQuery *)self wasForceStopped])
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    v24 = [(ICSearchQuery *)self searchQuery];
    int v22 = [v24 isCancelled] ^ 1;
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v28, 8);

  return v22;
}

void __21__ICSearchQuery_run___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained wasForceStopped])
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __21__ICSearchQuery_run___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    if (v4)
    {
      v7 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __21__ICSearchQuery_run___block_invoke_cold_2();
      }
    }
    dispatch_semaphore_t v8 = [WeakRetained synchronousSemaphore];

    if (v8)
    {
      objc_super v9 = [WeakRetained synchronousSemaphore];
      dispatch_semaphore_signal(v9);

      [WeakRetained setSynchronousSemaphore:0];
    }
  }
}

- (void)forceStop
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "%@ Force Stopped", v2, v3, v4, v5, v6);
}

- (void)cancel
{
  uint64_t v3 = [(ICSearchQuery *)self searchQuery];
  [v3 cancel];

  [(ICSearchQuery *)self forceStop];
}

- (void)setupWithAttributes:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(ICSearchQuery *)self newSearchQueryContext];
  [v5 setFetchAttributes:v4];
  uint8_t v6 = [(ICSearchQuery *)self rankingQueries];
  [v5 setRankingQueries:v6];

  v7 = ICNotesAppBundleIdentifier();
  v18[0] = v7;
  dispatch_semaphore_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v5 setBundleIDs:v8];

  objc_super v9 = [v5 filterQueries];
  v10 = [v9 arrayByAddingObject:@"_kMDItemUserActivityType != *"];
  [v5 setFilterQueries:v10];

  uint64_t v17 = *MEMORY[0x1E4F28358];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v5 setProtectionClasses:v11];

  id v12 = [(ICSearchQuery *)self newSearchQueryWithContext:v5];
  [(ICSearchQuery *)self setSearchQuery:v12];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__ICSearchQuery_setupWithAttributes___block_invoke;
  v14[3] = &unk_1E64A7CC0;
  objc_copyWeak(&v15, &location);
  BOOL v13 = [(ICSearchQuery *)self searchQuery];
  [v13 setFoundItemsHandler:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_3((uint64_t)WeakRetained, v3, v5);
  }

  if ([WeakRetained wasForceStopped])
  {
    uint8_t v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_1();
    }
  }
  else if (v3)
  {
    uint8_t v6 = [WeakRetained queryResultsToAddFromBatch:v3];
    if ([v6 count])
    {
      v7 = [WeakRetained mutableQueryResults];
      BOOL v8 = v7 == 0;

      if (v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [WeakRetained setMutableQueryResults:v9];
      }
      v10 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_2(WeakRetained, v3, v10);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x2020000000;
      int v24 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __37__ICSearchQuery_setupWithAttributes___block_invoke_17;
      v15[3] = &unk_1E64A7C98;
      v15[4] = WeakRetained;
      v15[5] = &buf;
      [v3 enumerateObjectsUsingBlock:v15];
      v11 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v12 = *(_DWORD *)(*((void *)&buf + 1) + 24);
        BOOL v13 = [WeakRetained mutableQueryResults];
        int v14 = [v13 count];
        *(_DWORD *)dispatch_time_t v16 = 138412802;
        id v17 = WeakRetained;
        __int16 v18 = 1024;
        int v19 = v12;
        __int16 v20 = 1024;
        int v21 = v14;
        _os_log_debug_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEBUG, "%@ added %d items to a total of %d items", v16, 0x18u);
      }
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    uint8_t v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = WeakRetained;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "%@ no items returned in foundItemsHandler", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_17(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 attributeSet];
  id v4 = objc_msgSend(v3, "ic_dataSourceIdentifier");
  int v5 = [v4 isEqualToString:@"Modern"];
  if (![*(id *)(a1 + 32) modernResultsOnly]
    || ([*(id *)(a1 + 32) modernResultsOnly] & v5) == 1)
  {
    uint8_t v6 = [*(id *)(a1 + 32) mutableQueryResults];
    v7 = [v8 uniqueIdentifier];
    [v6 setObject:v8 forKey:v7];

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (NSDictionary)queryResults
{
  uint64_t v2 = [(ICSearchQuery *)self mutableQueryResults];
  id v3 = (void *)[v2 copy];
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  int v5 = v3;

  return v5;
}

+ (id)defaultAttributesToReturnFromCoreSpotlight
{
  v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F23788];
  v6[0] = *MEMORY[0x1E4F836C0];
  v6[1] = v2;
  v6[2] = @"_ICItemSearchResultType";
  v6[3] = @"_ICItemRelatedNoteUniqueIdentifier";
  uint64_t v3 = *MEMORY[0x1E4F22D28];
  v6[4] = *MEMORY[0x1E4F22C48];
  v6[5] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  return v4;
}

- (BOOL)wasForceStopped
{
  return self->_wasForceStopped;
}

- (void)setWasForceStopped:(BOOL)a3
{
  self->_wasForceStopped = a3;
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (ICRankingQueriesDefinition)rankingQueriesDefinition
{
  return self->_rankingQueriesDefinition;
}

- (void)setRankingQueriesDefinition:(id)a3
{
}

- (OS_dispatch_semaphore)synchronousSemaphore
{
  return self->_synchronousSemaphore;
}

- (void)setSynchronousSemaphore:(id)a3
{
}

- (CSSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (NSMutableDictionary)mutableQueryResults
{
  return self->_mutableQueryResults;
}

- (void)setMutableQueryResults:(id)a3
{
}

- (NSArray)externalRankingQueries
{
  return self->_externalRankingQueries;
}

- (void)setExternalRankingQueries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalRankingQueries, 0);
  objc_storeStrong((id *)&self->_mutableQueryResults, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_synchronousSemaphore, 0);
  objc_storeStrong((id *)&self->_rankingQueriesDefinition, 0);
}

- (void)run:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_DEBUG, "Stopped waiting. %@ is %@", v2, 0x16u);
}

void __21__ICSearchQuery_run___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "CompletionHandler of search query called, but search query was force stopped earlier: %@", v2, v3, v4, v5, v6);
}

void __21__ICSearchQuery_run___block_invoke_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 2112;
  uint64_t v3 = &stru_1F1F2FFF8;
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error occured when running CSSearchQuery: %@. %@", v1, 0x16u);
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "FoundItemsHandler of search query called, but search query was force stopped earlier: %@", v2, v3, v4, v5, v6);
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = [a2 count];
  uint8_t v6 = [a1 mutableQueryResults];
  int v7 = 138412802;
  id v8 = a1;
  __int16 v9 = 1024;
  int v10 = v5;
  __int16 v11 = 1024;
  int v12 = [v6 count];
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "%@ found %d items, attempting to add to existing %d items", (uint8_t *)&v7, 0x18u);
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = [a2 count];
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "%@ returned %d items", (uint8_t *)&v4, 0x12u);
}

@end