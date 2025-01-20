@interface WBSSearchEnginePreferenceObserver
+ (WBSSearchEnginePreferenceObserver)sharedObserver;
+ (void)setUpSharedObserverWithSearchProviderContext:(id)a3;
+ (void)sharedObserver;
- (BOOL)defaultSearchEngineMatchesExperiment;
- (BOOL)duckDuckGoDefaultSearchEngine;
- (BOOL)googleIsDefaultSearchEngine;
- (BOOL)isGoogleEnabledSearchEngine;
- (NSString)defaultSearchEngineShortName;
- (WBSSearchEnginePreferenceObserver)initWithSearchProviderContext:(id)a3;
- (WBSSearchEnginePreferenceObserverDelegate)delegate;
- (void)_updateSearchEnginePreference:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation WBSSearchEnginePreferenceObserver

- (BOOL)isGoogleEnabledSearchEngine
{
  return self->_isGoogleEnabledSearchEngine;
}

+ (void)setUpSharedObserverWithSearchProviderContext:(id)a3
{
  id v3 = a3;
  v4 = [[WBSSearchEnginePreferenceObserver alloc] initWithSearchProviderContext:v3];

  v5 = (void *)sharedSearchEngineObserver;
  sharedSearchEngineObserver = (uint64_t)v4;
}

- (WBSSearchEnginePreferenceObserver)initWithSearchProviderContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSSearchEnginePreferenceObserver;
  v6 = [(WBSSearchEnginePreferenceObserver *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchProviderContext, a3);
    v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults");
    [v8 addObserver:v7 forKeyPath:@"SearchEngineStringSetting" options:3 context:userDefaultsObserverContext];

    [(WBSSearchEnginePreferenceObserver *)v7 _updateSearchEnginePreference:0];
    v9 = v7;
  }

  return v7;
}

- (void)_updateSearchEnginePreference:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults", a3);
  id v14 = [v4 objectForKey:@"SearchEngineStringSetting"];

  if (!v14)
  {
    id v5 = [(WBSSearchProviderContext *)self->_searchProviderContext defaultSearchProvider];
    id v14 = [v5 shortName];
  }
  v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults");
  v7 = [v6 objectForKey:@"PrivateSearchEngineStringSetting"];

  if (!v7)
  {
    v8 = [(WBSSearchProviderContext *)self->_searchProviderContext defaultSeachProviderForPrivateBrowsing];
    v7 = [v8 shortName];
  }
  self->_duckDuckGoDefaultSearchEngine = objc_msgSend(@"DuckDuckGo", "safari_isCaseInsensitiveEqualToString:", v14);
  BOOL isGoogleEnabledSearchEngine = self->_isGoogleEnabledSearchEngine;
  char v10 = objc_msgSend(@"Google", "safari_isCaseInsensitiveEqualToString:", v14);
  self->_googleIsDefaultSearchEngine = v10;
  if (v10) {
    char v11 = 1;
  }
  else {
    char v11 = objc_msgSend(@"Google", "safari_isCaseInsensitiveEqualToString:", v7);
  }
  self->_BOOL isGoogleEnabledSearchEngine = v11;
  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"WBSTrialGroupManagerDidChangeGroupIdentifier" object:self];

  if (self->_isGoogleEnabledSearchEngine || isGoogleEnabledSearchEngine)
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"DidChangeSearchProviderToFromGoogle" object:0];
  }
}

- (NSString)defaultSearchEngineShortName
{
  v2 = [(WBSSearchProviderContext *)self->_searchProviderContext defaultSearchProvider];
  id v3 = [v2 shortName];

  return (NSString *)v3;
}

+ (WBSSearchEnginePreferenceObserver)sharedObserver
{
  v2 = (void *)sharedSearchEngineObserver;
  if (!sharedSearchEngineObserver) {
    +[WBSSearchEnginePreferenceObserver sharedObserver]();
  }
  return (WBSSearchEnginePreferenceObserver *)v2;
}

- (BOOL)defaultSearchEngineMatchesExperiment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([WeakRetained isGoogleABEnabledForSearchEnginePreferenceObserver:self] & 1) != 0)
  {
    uint64_t v4 = 17;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ![WeakRetained isDuckDuckGoABEnabledForSearchEnginePreferenceObserver:self])
    {
      BOOL v5 = 0;
      goto LABEL_9;
    }
    uint64_t v4 = 16;
  }
  BOOL v5 = *((unsigned char *)&self->super.isa + v4) != 0;
LABEL_9:

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if ((void *)userDefaultsObserverContext == a6)
  {
    uint64_t v12 = *MEMORY[0x1E4F284E0];
    id v13 = a5;
    uint64_t v11 = [v13 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

    if (v11 | v14 && ([(id)v11 isEqual:v14] & 1) == 0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __84__WBSSearchEnginePreferenceObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E615A6C8;
      id v16 = v10;
      v17 = self;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WBSSearchEnginePreferenceObserver;
    uint64_t v11 = (uint64_t)a5;
    [(WBSSearchEnginePreferenceObserver *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

uint64_t __84__WBSSearchEnginePreferenceObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"SearchEngineStringSetting"];
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 _updateSearchEnginePreference:0];
  }
  return result;
}

- (WBSSearchEnginePreferenceObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSSearchEnginePreferenceObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)duckDuckGoDefaultSearchEngine
{
  return self->_duckDuckGoDefaultSearchEngine;
}

- (BOOL)googleIsDefaultSearchEngine
{
  return self->_googleIsDefaultSearchEngine;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchProviderContext, 0);
}

+ (void)sharedObserver
{
  v0 = [NSString stringWithFormat:&stru_1F105D3F0];
  v1 = NSString;
  v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariShared/SafariShared/SafariCore/Preferences/WBSSearchEnginePreferenceObserver.m"];
  id v3 = [v2 lastPathComponent];
  if ([v0 length])
  {
    BOOL v5 = [NSString stringWithFormat:@", %@", v0];
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "sharedSearchEngineObserver", "+[WBSSearchEnginePreferenceObserver sharedObserver]", v3, 55, v5];
  }
  else
  {
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "sharedSearchEngineObserver", "+[WBSSearchEnginePreferenceObserver sharedObserver]", v3, 55, &stru_1F105D3F0];
  }

  v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1F10624F0.isa, v4, v6);

  abort();
}

@end