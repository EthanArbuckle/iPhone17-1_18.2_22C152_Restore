@interface SearchSuggestionProvider
- (LoadProgressObserver)loadProgressObserver;
- (UniversalSearchSession)universalSearchSession;
- (id)initForPrivateBrowsing:(BOOL)a3;
- (unint64_t)maximumCachedCompletionCount;
- (void)dealloc;
- (void)setLoadProgressObserver:(id)a3;
- (void)setQueryToComplete:(id)a3;
- (void)setUniversalSearchSession:(id)a3;
- (void)stop;
@end

@implementation SearchSuggestionProvider

- (id)initForPrivateBrowsing:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SearchSuggestionProvider;
  v4 = [(CompletionProvider *)&v17 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4FB6E08];
    v6 = _SFApplicationNameForUserAgent();
    uint64_t v7 = [v5 _standardUserAgentWithApplicationName:v6];
    userAgentString = v4->_userAgentString;
    v4->_userAgentString = (NSString *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F98E30]);
    v10 = [MEMORY[0x1E4F3B060] sharedInstance];
    v11 = [v10 defaultSearchEngineForPrivateBrowsing:v3];
    v12 = [v11 suggestionsURLTemplate];
    uint64_t v13 = [v9 initWithSuggestionsURLTemplate:v12];
    searchSuggestionsFetcher = v4->_searchSuggestionsFetcher;
    v4->_searchSuggestionsFetcher = (WBSSearchSuggestionsFetcher *)v13;

    v4->_forPrivateBrowsing = v3;
    v15 = v4;
  }

  return v4;
}

- (void)setQueryToComplete:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentCompletionQuery, a3);
    v6 = [v5 queryString];
    uint64_t v7 = (void *)[v6 copy];

    BOOL forPrivateBrowsing = self->_forPrivateBrowsing;
    id v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v9 didRequestSearchSuggestions];

    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
    [WeakRetained didStartLoadingResource];
    searchSuggestionsFetcher = self->_searchSuggestionsFetcher;
    userAgentString = self->_userAgentString;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__SearchSuggestionProvider_setQueryToComplete___block_invoke;
    v15[3] = &unk_1E6D7B750;
    id v13 = WeakRetained;
    id v16 = v13;
    objc_copyWeak(&v19, &location);
    id v17 = v5;
    BOOL v20 = forPrivateBrowsing;
    id v14 = v7;
    id v18 = v14;
    [(WBSSearchSuggestionsFetcher *)searchSuggestionsFetcher updateSuggestionsRequestWithSearchTerms:v14 userAgentString:userAgentString completionHandler:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __47__SearchSuggestionProvider_setQueryToComplete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) didStopLoadingResource];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = [v6 domain];
      if ([v8 isEqualToString:*MEMORY[0x1E4F99620]])
      {
        uint64_t v9 = [v6 code];

        if (!v9) {
          goto LABEL_9;
        }
      }
      else
      {
      }
      [WeakRetained fail];
    }
    else
    {
      v10 = [v5 suggestions];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __47__SearchSuggestionProvider_setQueryToComplete___block_invoke_2;
      v15 = &unk_1E6D7B728;
      id v16 = *(id *)(a1 + 40);
      char v17 = *(unsigned char *)(a1 + 64);
      v11 = objc_msgSend(v10, "safari_mapObjectsUsingBlock:", &v12);

      objc_msgSend(WeakRetained, "setCompletions:forString:", v11, *(void *)(a1 + 48), v12, v13, v14, v15);
    }
  }
LABEL_9:
}

SearchSuggestion *__47__SearchSuggestionProvider_setQueryToComplete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[SearchSuggestion alloc] initWithSearchEngineSuggestion:v3 userQuery:*(void *)(a1 + 32) forPrivateBrowsing:*(unsigned __int8 *)(a1 + 40) isOfflineSearchSuggestion:0];

  return v4;
}

- (void)stop
{
  [(WBSSearchSuggestionsFetcher *)self->_searchSuggestionsFetcher cancelExistingSuggestionsRequest];
  searchSuggestionsFetcher = self->_searchSuggestionsFetcher;
  [(WBSSearchSuggestionsFetcher *)searchSuggestionsFetcher disconnectFromSearchHelperIfNecessary];
}

- (void)dealloc
{
  [(WBSSearchSuggestionsFetcher *)self->_searchSuggestionsFetcher disconnectFromSearchHelperIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)SearchSuggestionProvider;
  [(SearchSuggestionProvider *)&v3 dealloc];
}

- (unint64_t)maximumCachedCompletionCount
{
  return 100;
}

- (LoadProgressObserver)loadProgressObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
  return (LoadProgressObserver *)WeakRetained;
}

- (void)setLoadProgressObserver:(id)a3
{
}

- (UniversalSearchSession)universalSearchSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_universalSearchSession);
  return (UniversalSearchSession *)WeakRetained;
}

- (void)setUniversalSearchSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_universalSearchSession);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_storeStrong((id *)&self->_searchSuggestionsFetcher, 0);
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_currentCompletionQuery, 0);
}

@end