@interface SPUISearchModelZKW
- (BOOL)ignoreNextPartialUpdate;
- (SPUISearchModelZKW)init;
- (SPZKWSession)session;
- (void)_refreshRequested;
- (void)dealloc;
- (void)didReceiveResponse:(id)a3;
- (void)refreshUpdatingQueryId:(BOOL)a3 withQueryContext:(id)a4;
- (void)refreshWithQueryContext:(id)a3;
- (void)setIgnoreNextPartialUpdate:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)updateWithQueryContext:(id)a3;
@end

@implementation SPUISearchModelZKW

- (void)didReceiveResponse:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 2 && -[SPUISearchModelZKW ignoreNextPartialUpdate](self, "ignoreNextPartialUpdate"))
  {
    [(SPUISearchModelZKW *)self setIgnoreNextPartialUpdate:0];
    [(SPUISearchModel *)self setQueryPartiallyComplete:1];
    v5 = (NSObject **)MEMORY[0x263F79148];
    v6 = *MEMORY[0x263F79148];
    if (!*MEMORY[0x263F79148])
    {
      SPUIInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "ignoring partial zkw update";
LABEL_11:
      _os_log_impl(&dword_23D2E6000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SPUISearchModelZKW;
    [(SPUISearchModel *)&v9 didReceiveResponse:v4];
    v8 = (NSObject **)MEMORY[0x263F79148];
    v6 = *MEMORY[0x263F79148];
    if (!*MEMORY[0x263F79148])
    {
      SPUIInitLogging();
      v6 = *v8;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "updating zkw with response";
      goto LABEL_11;
    }
  }
}

- (void)updateWithQueryContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(SPUISearchModel *)self delegate];
    objc_msgSend(v5, "setDeviceAuthenticationState:", objc_msgSend(v6, "currentDeviceAuthenticationState"));
  }
  v7 = (NSObject **)MEMORY[0x263F79148];
  v8 = *MEMORY[0x263F79148];
  if (!*MEMORY[0x263F79148])
  {
    SPUIInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D2E6000, v8, OS_LOG_TYPE_DEFAULT, "querying zkw", buf, 2u);
  }
  self->_shouldCacheResults = 1;
  objc_super v9 = [(SPUISearchModelZKW *)self session];
  v10 = [v9 queryTaskWithContext:v5];
  [(SPUISearchModel *)self setQueryTask:v10];

  [(SPUISearchModel *)self setLastResponse:0];
  self->_newQuery = 1;
  v11 = [(SPUISearchModel *)self queryTask];
  [v11 setDelegate:self];

  v12 = [(SPUISearchModel *)self queryTask];
  [v12 start];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SPUISearchModelZKW_updateWithQueryContext___block_invoke;
  block[3] = &unk_264E90660;
  block[4] = self;
  if (updateWithQueryContext__onceToken != -1) {
    dispatch_once(&updateWithQueryContext__onceToken, block);
  }
}

- (SPZKWSession)session
{
  return self->_session;
}

- (BOOL)ignoreNextPartialUpdate
{
  return self->_ignoreNextPartialUpdate;
}

- (SPUISearchModelZKW)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPUISearchModelZKW;
  v2 = [(SPUISearchModelZKW *)&v6 init];
  if (v2)
  {
    v3 = (SPZKWSession *)objc_alloc_init(MEMORY[0x263F78CA8]);
    session = v2->_session;
    v2->_session = v3;
  }
  return v2;
}

void __45__SPUISearchModelZKW_updateWithQueryContext___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)homeScreenPrefChanged, @"com.apple.suggestions.settingsChanged", 0, CFNotificationSuspensionBehaviorDrop);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)homeScreenPrefChanged, @"com.apple.duetexpertd.spotlightActionsSuggestionUpdate", 0, CFNotificationSuspensionBehaviorDrop);
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__refreshRequested name:*MEMORY[0x263F79050] object:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SPUISearchModelZKW;
  [(SPUISearchModelZKW *)&v5 dealloc];
}

- (void)refreshWithQueryContext:(id)a3
{
}

- (void)refreshUpdatingQueryId:(BOOL)a3 withQueryContext:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F67C78];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__SPUISearchModelZKW_refreshUpdatingQueryId_withQueryContext___block_invoke;
  v9[3] = &unk_264E90938;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  [v7 dispatchMainIfNecessary:v9];
}

void __62__SPUISearchModelZKW_refreshUpdatingQueryId_withQueryContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  int v3 = [v2 searchAgentHasWindow:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl(&dword_23D2E6000, v4, OS_LOG_TYPE_DEFAULT, "refreshing zkw", v11, 2u);
    }

    [*(id *)(a1 + 32) setIgnoreNextPartialUpdate:1];
    objc_super v5 = *(void **)(a1 + 40);
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      v7 = [*(id *)(a1 + 32) queryTask];
      id v8 = [v7 query];
      id v6 = [v8 queryContext];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      objc_super v9 = [MEMORY[0x263F79160] updateQueryContext:v6 withSearchString:&stru_26F104E28 showSuggestions:1 view:0];

      id v10 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(v9, "setDeviceAuthenticationState:", objc_msgSend(v10, "currentDeviceAuthenticationState"));

      id v6 = v9;
    }
    [*(id *)(a1 + 32) updateWithQueryContext:v6];
  }
}

- (void)_refreshRequested
{
  int v3 = (NSObject **)MEMORY[0x263F79148];
  id v4 = *MEMORY[0x263F79148];
  if (!*MEMORY[0x263F79148])
  {
    SPUIInitLogging();
    id v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_23D2E6000, v4, OS_LOG_TYPE_DEFAULT, "zkw refresh requested", v5, 2u);
  }
  [(SPUISearchModelZKW *)self refreshUpdatingQueryId:1 withQueryContext:0];
}

- (void)setSession:(id)a3
{
}

- (void)setIgnoreNextPartialUpdate:(BOOL)a3
{
  self->_ignoreNextPartialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queryProcessor, 0);
}

@end