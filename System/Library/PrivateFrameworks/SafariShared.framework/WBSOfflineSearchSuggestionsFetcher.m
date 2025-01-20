@interface WBSOfflineSearchSuggestionsFetcher
- (BOOL)areOfflineSearchSuggestionsAvailable;
- (WBSCompletionQuery)currentQuery;
- (WBSOfflineSearchSuggestionsFetcher)initWithMaximumSuggestionsToFetch:(unint64_t)a3;
- (WBSOfflineSearchSuggestionsFetcherDelegate)delegate;
- (id)_searchHelperProxy;
- (void)_checkForRemoteDisablement:(id)a3;
- (void)_logOfflineSuggestionStatus;
- (void)dealloc;
- (void)setCurrentQuery:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateAvailability;
@end

@implementation WBSOfflineSearchSuggestionsFetcher

- (WBSOfflineSearchSuggestionsFetcher)initWithMaximumSuggestionsToFetch:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WBSOfflineSearchSuggestionsFetcher;
  v4 = [(WBSOfflineSearchSuggestionsFetcher *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v6 = [(WBSOfflineSearchSuggestionsFetcher *)v4 _searchHelperProxy];
    [v6 setMaximumNumberOfOfflineSuggestionsToFetch:a3];

    [(WBSOfflineSearchSuggestionsFetcher *)v5 updateAvailability];
    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  v3 = +[WBSSearchHelperConnectionManager sharedManager];
  [v3 removeClient:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSOfflineSearchSuggestionsFetcher;
  [(WBSOfflineSearchSuggestionsFetcher *)&v4 dealloc];
}

- (void)updateAvailability
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke;
  v2[3] = &unk_1E5C9DEE8;
  v2[4] = self;
  [(WBSOfflineSearchSuggestionsFetcher *)self _checkForRemoteDisablement:v2];
}

void __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v3[1] = 2;
    objc_super v4 = *(void **)(a1 + 32);
    [v4 _logOfflineSuggestionStatus];
  }
  else
  {
    v5 = [v3 _searchHelperProxy];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_2;
    v6[3] = &unk_1E5C9DEC0;
    v6[4] = *(void *)(a1 + 32);
    [v5 fetchOfflineSearchSuggestionsStatus:v6];
  }
}

void __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_3;
  v2[3] = &unk_1E5C8CF50;
  v2[4] = *(void *)(a1 + 32);
  void v2[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __56__WBSOfflineSearchSuggestionsFetcher_updateAvailability__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v2[1] == 3)
  {
    v3 = +[WBSSearchHelperConnectionManager sharedManager];
    [v3 removeClient:*(void *)(a1 + 32)];

    v2 = *(void **)(a1 + 32);
  }
  return [v2 _logOfflineSuggestionStatus];
}

- (void)_checkForRemoteDisablement:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[WBSOfflineSearchRemoteDisablementManager sharedManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke;
  v6[3] = &unk_1E5C9DF10;
  id v7 = v3;
  id v5 = v3;
  [v4 areOfflineSearchSuggestionsDisabled:v6];
}

void __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke_2;
  v3[3] = &unk_1E5C8C8A8;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __65__WBSOfflineSearchSuggestionsFetcher__checkForRemoteDisablement___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_logOfflineSuggestionStatus
{
  switch(self->_offlineSuggestionsStatus)
  {
    case 0uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        id v3 = "Unable to determine status of offline search suggestions";
        id v4 = (uint8_t *)&v10;
        goto LABEL_14;
      }
      break;
    case 1uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        __int16 v9 = 0;
        id v3 = "Unable to communicate with com.apple.Safari.SearchHelper";
        id v4 = (uint8_t *)&v9;
        goto LABEL_14;
      }
      break;
    case 2uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        __int16 v8 = 0;
        id v3 = "Offline search suggestions have been disabled remotely";
        id v4 = (uint8_t *)&v8;
        goto LABEL_14;
      }
      break;
    case 3uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        __int16 v7 = 0;
        id v3 = "No offline search model exists for current locale";
        id v4 = (uint8_t *)&v7;
        goto LABEL_14;
      }
      break;
    case 4uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        __int16 v6 = 0;
        id v3 = "Download needs to be initiated";
        id v4 = (uint8_t *)&v6;
        goto LABEL_14;
      }
      break;
    case 5uLL:
      v2 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        __int16 v5 = 0;
        id v3 = "Offline search suggestions are availabe";
        id v4 = (uint8_t *)&v5;
LABEL_14:
        _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, v3, v4, 2u);
      }
      break;
    default:
      return;
  }
}

- (id)_searchHelperProxy
{
  id v3 = +[WBSSearchHelperConnectionManager sharedManager];
  id v4 = [v3 searchHelperConnectionRequestedByClient:self];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke;
  v7[3] = &unk_1E5C8DC70;
  v7[4] = self;
  __int16 v5 = [v4 remoteObjectProxyWithErrorHandler:v7];

  return v5;
}

void __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke_cold_1(v4, v3);
  }
  *(void *)(*(void *)(a1 + 32) + 8) = 1;
}

- (BOOL)areOfflineSearchSuggestionsAvailable
{
  return self->_offlineSuggestionsStatus == 5;
}

- (void)setCurrentQuery:(id)a3
{
  id v5 = a3;
  if (self->_offlineSuggestionsStatus == 5)
  {
    objc_storeStrong((id *)&self->_currentQuery, a3);
    __int16 v6 = [(WBSOfflineSearchSuggestionsFetcher *)self _searchHelperProxy];
    __int16 v7 = [v5 queryString];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke;
    v8[3] = &unk_1E5C9DF38;
    v8[4] = self;
    id v9 = v5;
    [v6 fetchOfflineSuggestionsForQueryString:v7 completionHandler:v8];
  }
}

void __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke_2;
  block[3] = &unk_1E5C8CD20;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__WBSOfflineSearchSuggestionsFetcher_setCurrentQuery___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  [WeakRetained offlineSearchSuggestionsFetcher:a1[4] didFindSuggestions:a1[5] forQuery:a1[6]];
}

- (WBSCompletionQuery)currentQuery
{
  return self->_currentQuery;
}

- (WBSOfflineSearchSuggestionsFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSOfflineSearchSuggestionsFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentQuery, 0);
}

void __56__WBSOfflineSearchSuggestionsFetcher__searchHelperProxy__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "WBSOfflineSearchFetcher received an error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end