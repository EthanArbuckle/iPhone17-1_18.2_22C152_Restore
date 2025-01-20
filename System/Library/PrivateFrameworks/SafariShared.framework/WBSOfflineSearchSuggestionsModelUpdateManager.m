@interface WBSOfflineSearchSuggestionsModelUpdateManager
- (BOOL)_shouldCheckForModelUpdates;
- (WBSOfflineSearchSuggestionsModelUpdateManager)init;
- (double)_timeIntervalSinceLastUpdate;
- (id)_searchHelperProxy;
- (void)_checkForModelUpdates;
- (void)_clearModels;
- (void)_disconnectFromSearchHelper;
- (void)_doUpdates;
- (void)_recordUpdateResultWithError:(id)a3;
- (void)_searchEngineChangedToOrFromGoogle:(id)a3;
- (void)_updateDefaultSearchEnginePreferencesState;
- (void)checkForModelUpdatesOrRemoteDisablementIfNeeded;
- (void)dealloc;
@end

@implementation WBSOfflineSearchSuggestionsModelUpdateManager

uint64_t __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _doUpdates];
}

- (void)checkForModelUpdatesOrRemoteDisablementIfNeeded
{
  v3 = +[WBSOfflineSearchRemoteDisablementManager sharedManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke;
  v4[3] = &unk_1E5C9DEE8;
  v4[4] = self;
  [v3 areOfflineSearchSuggestionsDisabled:v4];
}

- (void)_updateDefaultSearchEnginePreferencesState
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_googleWasADefaultSearchProvider = [v4 BOOLForKey:@"WBSOfflineSearchSuggestionsModelGoogleWasDefaultSearchEngineKey"];
  v3 = [MEMORY[0x1E4F97FE0] sharedObserver];
  self->_googleIsADefaultSearchProvider = [v3 isGoogleEnabledSearchEngine];

  [v4 setBool:self->_googleIsADefaultSearchProvider forKey:@"WBSOfflineSearchSuggestionsModelGoogleWasDefaultSearchEngineKey"];
}

- (WBSOfflineSearchSuggestionsModelUpdateManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WBSOfflineSearchSuggestionsModelUpdateManager;
  v2 = [(WBSOfflineSearchSuggestionsModelUpdateManager *)&v12 init];
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

    [(NSDateFormatter *)v2->_dateFormatter setDateFormat:@"yyyy-MM-dd-HHmm"];
    v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v6 = [v5 stringForKey:@"WBSOfflineSearchSuggestionsModelLastUsedLocaleIdentifierKey"];
    lastUsedLocaleIdentifier = v2->_lastUsedLocaleIdentifier;
    v2->_lastUsedLocaleIdentifier = (NSString *)v6;

    [(WBSOfflineSearchSuggestionsModelUpdateManager *)v2 _updateDefaultSearchEnginePreferencesState];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__searchEngineChangedToOrFromGoogle_ name:*MEMORY[0x1E4F980D0] object:0];

    v10 = v2;
  }

  return v2;
}

- (void)_doUpdates
{
  if (self->_googleWasADefaultSearchProvider && !self->_googleIsADefaultSearchProvider
    || self->_offlineSuggestionsRemotelyDisabled)
  {
    [(WBSOfflineSearchSuggestionsModelUpdateManager *)self _clearModels];
  }
  else if ([(WBSOfflineSearchSuggestionsModelUpdateManager *)self _shouldCheckForModelUpdates])
  {
    [(WBSOfflineSearchSuggestionsModelUpdateManager *)self _checkForModelUpdates];
  }
}

- (BOOL)_shouldCheckForModelUpdates
{
  if (self->_googleIsADefaultSearchProvider)
  {
    if (!self->_googleWasADefaultSearchProvider) {
      return 1;
    }
    v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v4 = [v3 localeIdentifier];
    int v5 = [v4 isEqualToString:self->_lastUsedLocaleIdentifier];

    if (!v5) {
      return 1;
    }
    [(WBSOfflineSearchSuggestionsModelUpdateManager *)self _timeIntervalSinceLastUpdate];
    if (v6 >= 604800.0) {
      return 1;
    }
    v7 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    __int16 v13 = 0;
    v10 = "Deferring check for offline model updates. Last check was within a week";
    v11 = (uint8_t *)&v13;
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v12) {
      return result;
    }
    *(_WORD *)buf = 0;
    v10 = "Search Provider does not offer offline search suggestions";
    v11 = buf;
  }
  _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
  return 0;
}

- (double)_timeIntervalSinceLastUpdate
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = [v3 stringForKey:@"WBSOfflineSearchSuggestionsModelLastUpdateDateKey"];

  int v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  double v6 = v5;
  if (v4)
  {
    uint64_t v7 = [(NSDateFormatter *)self->_dateFormatter dateFromString:v4];
    BOOL v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = v6;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = v5;
  }
  v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceDate:v10];
  double v13 = v12;

  return v13;
}

void __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __96__WBSOfflineSearchSuggestionsModelUpdateManager_checkForModelUpdatesOrRemoteDisablementIfNeeded__block_invoke_2;
  v2[3] = &unk_1E5C8CF28;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

- (void)_searchEngineChangedToOrFromGoogle:(id)a3
{
  [(WBSOfflineSearchSuggestionsModelUpdateManager *)self _updateDefaultSearchEnginePreferencesState];
  [(WBSOfflineSearchSuggestionsModelUpdateManager *)self _doUpdates];
}

- (void)_checkForModelUpdates
{
  char v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v3 localeIdentifier];
  lastUsedLocaleIdentifier = self->_lastUsedLocaleIdentifier;
  self->_lastUsedLocaleIdentifier = v4;

  double v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v6 setObject:self->_lastUsedLocaleIdentifier forKey:@"WBSOfflineSearchSuggestionsModelLastUsedLocaleIdentifierKey"];

  uint64_t v7 = [(WBSOfflineSearchSuggestionsModelUpdateManager *)self _searchHelperProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__WBSOfflineSearchSuggestionsModelUpdateManager__checkForModelUpdates__block_invoke;
  v8[3] = &unk_1E5C8DC70;
  v8[4] = self;
  [v7 checkForModelUpdatesIfNeededWithCompletionHandler:v8];
}

uint64_t __70__WBSOfflineSearchSuggestionsModelUpdateManager__checkForModelUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _recordUpdateResultWithError:a2];
  char v3 = *(void **)(a1 + 32);
  return [v3 _disconnectFromSearchHelper];
}

- (void)_recordUpdateResultWithError:(id)a3
{
  id v4 = a3;
  int v5 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  double v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSOfflineSearchSuggestionsModelUpdateManager _recordUpdateResultWithError:](v6, v4);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_DEFAULT, "Successfully checked for offline search model updates", v11, 2u);
    }
    dateFormatter = self->_dateFormatter;
    BOOL v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = [(NSDateFormatter *)dateFormatter stringFromDate:v8];

    id v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v10 setObject:v9 forKey:@"WBSOfflineSearchSuggestionsModelLastUpdateDateKey"];
  }
}

- (void)_clearModels
{
  char v3 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all offline search models", buf, 2u);
  }
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v4 removeObjectForKey:@"WBSOfflineSearchSuggestionsModelLastUpdateDateKey"];

  int v5 = [(WBSOfflineSearchSuggestionsModelUpdateManager *)self _searchHelperProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__WBSOfflineSearchSuggestionsModelUpdateManager__clearModels__block_invoke;
  v6[3] = &unk_1E5C8C880;
  v6[4] = self;
  [v5 clearAllSearchModelsWithCompletionHandler:v6];
}

uint64_t __61__WBSOfflineSearchSuggestionsModelUpdateManager__clearModels__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disconnectFromSearchHelper];
}

- (id)_searchHelperProxy
{
  char v3 = +[WBSSearchHelperConnectionManager sharedManager];
  id v4 = [v3 searchHelperConnectionRequestedByClient:self];

  int v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_81];

  return v5;
}

void __67__WBSOfflineSearchSuggestionsModelUpdateManager__searchHelperProxy__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __67__WBSOfflineSearchSuggestionsModelUpdateManager__searchHelperProxy__block_invoke_cold_1(v0);
  }
}

- (void)_disconnectFromSearchHelper
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSOfflineSearchSuggestionsModelUpdateManager__disconnectFromSearchHelper__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__WBSOfflineSearchSuggestionsModelUpdateManager__disconnectFromSearchHelper__block_invoke(uint64_t a1)
{
  id v2 = +[WBSSearchHelperConnectionManager sharedManager];
  [v2 removeClient:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  char v3 = +[WBSSearchHelperConnectionManager sharedManager];
  [v3 removeClient:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSOfflineSearchSuggestionsModelUpdateManager;
  [(WBSOfflineSearchSuggestionsModelUpdateManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)_recordUpdateResultWithError:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = a1;
  objc_super v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  double v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Encountered error attempting to update offline search suggestion models: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __67__WBSOfflineSearchSuggestionsModelUpdateManager__searchHelperProxy__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Encountered error attempting to create remote proxy object for SafariSearchHelper.", v1, 2u);
}

@end