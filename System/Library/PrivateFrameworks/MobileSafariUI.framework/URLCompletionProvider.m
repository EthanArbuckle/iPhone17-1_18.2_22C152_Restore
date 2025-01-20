@interface URLCompletionProvider
- (BOOL)providesTopHits;
- (NSArray)searchParametersList;
- (URLCompletionProvider)initWithBookmarkProvider:(id)a3 cloudTabStore:(id)a4 profileIdentifier:(id)a5 maxResults:(unint64_t)a6 searchableCollectionsMask:(int)a7;
- (WBSParsecSearchSession)parsecSearchSession;
- (id)_doUpdateForPrefix:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 withSearchParameters:(id)a5;
- (id)completionsForQuery:(id)a3 isCFSearch:(BOOL)a4;
- (id)findCompletionsForKey:(id)a3 isCFSearch:(BOOL)a4;
- (id)getKeyForQueryString:(id)a3 isCFSearch:(BOOL)a4;
- (unint64_t)cfErrorForQuery:(id)a3;
- (unint64_t)maximumCachedCompletionCount;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_bookmarksDidChange:(id)a3;
- (void)_endURLCompletionBackgroundTask;
- (void)_historyDidChange:(id)a3;
- (void)clearCachedCompletions;
- (void)dealloc;
- (void)setParsecSearchSession:(id)a3;
- (void)setProvidesTopHits:(BOOL)a3;
- (void)setQueryToComplete:(id)a3;
- (void)setSearchParametersList:(id)a3;
@end

@implementation URLCompletionProvider

- (URLCompletionProvider)initWithBookmarkProvider:(id)a3 cloudTabStore:(id)a4 profileIdentifier:(id)a5 maxResults:(unint64_t)a6 searchableCollectionsMask:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v30.receiver = self;
  v30.super_class = (Class)URLCompletionProvider;
  v16 = [(CompletionProvider *)&v30 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_bookmarkProvider, a3);
    v17->_maxResults = a6;
    pthread_mutex_init(&v17->_prefixMutex, 0);
    v17->_urlCompletionBackgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
    v18 = [[URLCompletionDatabase alloc] initWithCloudTabStore:v14 profileIdentifier:v15 searchableCollectionsMask:v7 bookmarkProvider:v13];
    completionDatabase = v17->_completionDatabase;
    v17->_completionDatabase = v18;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.mobilesafari.URLCompletionProvider.%p", v17);
    id v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 UTF8String], 0);
    completionQueue = v17->_completionQueue;
    v17->_completionQueue = (OS_dispatch_queue *)v21;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.mobilesafari.URLCompletionProvider.cf.%p", v17);
    id v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], 0);
    cfCompletionQueue = v17->_cfCompletionQueue;
    v17->_cfCompletionQueue = (OS_dispatch_queue *)v24;

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v27 = +[History sharedHistory];
    [v26 addObserver:v17 selector:sel__historyDidChange_ name:*MEMORY[0x1E4F99270] object:v27];
    [v26 addObserver:v17 selector:sel__historyDidChange_ name:*MEMORY[0x1E4F99268] object:v27];
    [v26 addObserver:v17 selector:sel__historyDidChange_ name:*MEMORY[0x1E4F99250] object:v27];
    [v26 addObserver:v17 selector:sel__historyDidChange_ name:*MEMORY[0x1E4F99258] object:v27];
    [v26 addObserver:v17 selector:sel__bookmarksDidChange_ name:*MEMORY[0x1E4FB6158] object:0];
    [v26 addObserver:v17 selector:sel__bookmarksDidChange_ name:*MEMORY[0x1E4FB6148] object:0];
    [v26 addObserver:v17 selector:sel__bookmarksDidChange_ name:*MEMORY[0x1E4FB6180] object:0];
    [v26 addObserver:v17 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
    v28 = v17;
  }
  return v17;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  pthread_mutex_destroy(&self->_prefixMutex);
  if (self->_urlCompletionBackgroundTaskIdentifier != *MEMORY[0x1E4FB2748]) {
    [(URLCompletionProvider *)self _endURLCompletionBackgroundTask];
  }
  v4.receiver = self;
  v4.super_class = (Class)URLCompletionProvider;
  [(URLCompletionProvider *)&v4 dealloc];
}

- (void)_historyDidChange:(id)a3
{
  self->_historyWasModified = 1;
}

- (void)_bookmarksDidChange:(id)a3
{
  self->_bookmarksWereModified = 1;
  [(URLCompletionDatabase *)self->_completionDatabase clearBookmarksCache];
}

- (id)_doUpdateForPrefix:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 withSearchParameters:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_bookmarksWereModified)
  {
    [(WBSURLCompletionDatabase *)self->_completionDatabase clearBookmarkMatchesCachesKeepingEmptyValues:0];
    self->_bookmarksWereModified = 0;
  }
  if (self->_historyWasModified)
  {
    self->_historyWasModified = 0;
    [(WBSURLCompletionDatabase *)self->_completionDatabase clearMatchesCaches];
  }
  else
  {
    [(WBSURLCompletionDatabase *)self->_completionDatabase clearBookmarkMatchesCachesKeepingEmptyValues:1];
  }
  BOOL providesTopHits = self->_providesTopHits;
  if (self->_providesTopHits) {
    v12 = &v35;
  }
  else {
    v12 = 0;
  }
  if (self->_providesTopHits) {
    id v35 = 0;
  }
  completionDatabase = self->_completionDatabase;
  id v34 = 0;
  [(WBSURLCompletionDatabase *)completionDatabase getBestMatchesForTypedString:v8 filterResultsUsingProfileIdentifier:v9 topHits:v12 matches:&v34 limit:self->_maxResults forQueryID:[(WBSCompletionQuery *)self->_query queryID] withSearchParameters:v10];
  if (providesTopHits) {
    id v14 = v35;
  }
  else {
    id v14 = 0;
  }
  id v15 = v34;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count") + objc_msgSend(v15, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v17);
        }
        [v16 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v15;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v21);
        }
        [v16 addObject:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v22);
  }

  return v16;
}

- (unint64_t)maximumCachedCompletionCount
{
  if ([(NSArray *)self->_searchParametersList count]) {
    return 8 * [(NSArray *)self->_searchParametersList count];
  }
  else {
    return 8;
  }
}

- (id)completionsForQuery:(id)a3 isCFSearch:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_query, a3);
  v10.receiver = self;
  v10.super_class = (Class)URLCompletionProvider;
  id v8 = [(CompletionProvider *)&v10 completionsForQuery:v7 isCFSearch:v4];

  return v8;
}

- (id)findCompletionsForKey:(id)a3 isCFSearch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(URLCompletionProvider *)self getKeyForQueryString:v6 isCFSearch:0];
  v19.receiver = self;
  v19.super_class = (Class)URLCompletionProvider;
  id v8 = [(CompletionProvider *)&v19 findCompletionsForKey:v7 isCFSearch:0];
  id v9 = [(NSArray *)self->_searchParametersList firstObject];
  int v10 = [v9 isCFSearch];

  if (v10)
  {
    uint64_t v11 = [(URLCompletionProvider *)self getKeyForQueryString:v6 isCFSearch:1];

    v18.receiver = self;
    v18.super_class = (Class)URLCompletionProvider;
    v12 = [(CompletionProvider *)&v18 findCompletionsForKey:v11 isCFSearch:1];
    id v7 = (void *)v11;
  }
  else
  {
    v12 = 0;
  }
  if (v12) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    id v14 = 0;
  }
  else {
    id v14 = v12;
  }
  if (v4) {
    id v15 = v14;
  }
  else {
    id v15 = v8;
  }
  id v16 = v15;

  return v16;
}

- (void)clearCachedCompletions
{
  v4.receiver = self;
  v4.super_class = (Class)URLCompletionProvider;
  [(CompletionProvider *)&v4 clearCachedCompletions];
  currentPrefix = self->_currentPrefix;
  self->_currentPrefix = 0;
}

- (void)setQueryToComplete:(id)a3
{
  id v4 = a3;
  p_prefixMutex = &self->_prefixMutex;
  pthread_mutex_lock(&self->_prefixMutex);
  currentPrefix = self->_currentPrefix;
  id v7 = [v4 queryString];
  LOBYTE(currentPrefix) = [(NSString *)currentPrefix isEqualToString:v7];

  if ((currentPrefix & 1) == 0)
  {
    id v8 = self->_query;
    id v9 = [v4 queryString];
    int v10 = (NSString *)[v9 copy];
    uint64_t v11 = self->_currentPrefix;
    self->_currentPrefix = v10;

    self->_needScheduleBackgroundTaskOnAppSuspend = 1;
    v12 = self->_searchParametersList;
    completionQueue = self->_completionQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __44__URLCompletionProvider_setQueryToComplete___block_invoke;
    v16[3] = &unk_1E6D79148;
    v16[4] = self;
    id v17 = v4;
    objc_super v18 = v8;
    objc_super v19 = v12;
    id v14 = v12;
    id v15 = v8;
    dispatch_async(completionQueue, v16);
  }
  pthread_mutex_unlock(p_prefixMutex);
}

void __44__URLCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4E426E0]();
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 72));
  v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 72));
  id v4 = [*(id *)(a1 + 40) queryString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 176) feedbackDispatcher];
    [v6 didBeginSearchOfType:1 withQuery:*(void *)(a1 + 48) endpoint:0];

    id v7 = [*(id *)(a1 + 56) firstObject];
    int v8 = [v7 isCFSearch];

    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__13;
    v50[4] = __Block_byref_object_dispose__13;
    id v51 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__13;
    v48 = __Block_byref_object_dispose__13;
    id v49 = 0;
    uint64_t v9 = [*(id *)(a1 + 40) triggerEvent];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v41;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v13++) setIsForVoiceSearch:v9 == 4];
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v11);
    }

    id v14 = *(void **)(a1 + 32);
    id v15 = [*(id *)(a1 + 48) profileIdentifierToFilterResults];
    id v16 = [*(id *)(a1 + 56) lastObject];
    uint64_t v17 = [v14 _doUpdateForPrefix:v3 filterResultsUsingProfileIdentifier:v15 withSearchParameters:v16];
    objc_super v18 = (void *)v45[5];
    v45[5] = v17;

    if (v8)
    {
      objc_super v19 = dispatch_group_create();
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = *(NSObject **)(v20 + 160);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__URLCompletionProvider_setQueryToComplete___block_invoke_201;
      block[3] = &unk_1E6D7DF50;
      v39 = v50;
      block[4] = v20;
      id v36 = v3;
      id v37 = *(id *)(a1 + 48);
      id v38 = *(id *)(a1 + 56);
      dispatch_group_async(v19, v21, block);
      uint64_t v22 = [*(id *)(a1 + 56) firstObject];
      [v22 CFSearchTimeout];
      dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
      BOOL v25 = dispatch_group_wait(v19, v24) == 0;

      if (v25)
      {
        uint64_t v26 = 0;
      }
      else
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
        *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
        uint64_t v26 = 2;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __44__URLCompletionProvider_setQueryToComplete___block_invoke_2;
    v28[3] = &unk_1E6D7DF78;
    v28[4] = *(void *)(a1 + 32);
    id v27 = *(id *)(a1 + 48);
    char v34 = v8;
    uint64_t v33 = v26;
    id v29 = v27;
    long long v31 = v50;
    id v30 = v3;
    long long v32 = &v44;
    dispatch_async(MEMORY[0x1E4F14428], v28);

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(v50, 8);
  }
}

void __44__URLCompletionProvider_setQueryToComplete___block_invoke_201(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) profileIdentifierToFilterResults];
  id v4 = [*(id *)(a1 + 56) firstObject];
  uint64_t v5 = [v2 _doUpdateForPrefix:v3 filterResultsUsingProfileIdentifier:v8 withSearchParameters:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __44__URLCompletionProvider_setQueryToComplete___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 176) feedbackDispatcher];
  [v2 didReceiveLocalResultsForQuery:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 72);
    if (v4)
    {
      v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
      v9[0] = v2;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
    else
    {
      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    [v3 setCompletions:v5 forString:*(void *)(a1 + 48) isCFSearch:1];
    if (v4)
    {
    }
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = a1 + 32;
  [v7 setCompletions:*(void *)(*(void *)(*(void *)(v6 + 32) + 8) + 40) forString:*(void *)(v6 + 16) isCFSearch:0];
  return [*(id *)v6 _endURLCompletionBackgroundTask];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  if (self->_needScheduleBackgroundTaskOnAppSuspend
    && self->_urlCompletionBackgroundTaskIdentifier == *MEMORY[0x1E4FB2748])
  {
    uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__URLCompletionProvider__applicationDidEnterBackground___block_invoke;
    v6[3] = &unk_1E6D79060;
    v6[4] = self;
    self->_urlCompletionBackgroundTaskIdentifier = [v5 beginBackgroundTaskWithName:@"com.apple.mobilesafari.URLCompletionTask" expirationHandler:v6];
  }
}

uint64_t __56__URLCompletionProvider__applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endURLCompletionBackgroundTask];
}

- (void)_endURLCompletionBackgroundTask
{
  self->_needScheduleBackgroundTaskOnAppSuspend = 0;
  unint64_t v2 = *MEMORY[0x1E4FB2748];
  if (self->_urlCompletionBackgroundTaskIdentifier != *MEMORY[0x1E4FB2748])
  {
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v4 endBackgroundTask:self->_urlCompletionBackgroundTaskIdentifier];

    self->_urlCompletionBackgroundTaskIdentifier = v2;
  }
}

- (id)getKeyForQueryString:(id)a3 isCFSearch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSArray *)self->_searchParametersList firstObject];
  char v8 = [v7 isCFSearch];

  if (v8)
  {
    uint64_t v9 = NSString;
    id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    uint64_t v11 = [v9 stringWithFormat:@"%lu-%@", objc_msgSend(v10, "integerValue"), v6];

    id v6 = (id)v11;
  }
  return v6;
}

- (unint64_t)cfErrorForQuery:(id)a3
{
  BOOL v4 = [a3 queryString];
  uint64_t v5 = [(URLCompletionProvider *)self findCompletionsForKey:v4 isCFSearch:1];

  if ([v5 count] == 1)
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    int v7 = [v6 isEqual:&unk_1F3C73AE8];

    if (v7) {
      unint64_t v8 = 2;
    }
    else {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)providesTopHits
{
  return self->_providesTopHits;
}

- (void)setProvidesTopHits:(BOOL)a3
{
  self->_BOOL providesTopHits = a3;
}

- (WBSParsecSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (void)setParsecSearchSession:(id)a3
{
}

- (NSArray)searchParametersList
{
  return self->_searchParametersList;
}

- (void)setSearchParametersList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchParametersList, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_storeStrong((id *)&self->_cfCompletionQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_completionDatabase, 0);
  objc_storeStrong((id *)&self->_currentPrefix, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
}

@end