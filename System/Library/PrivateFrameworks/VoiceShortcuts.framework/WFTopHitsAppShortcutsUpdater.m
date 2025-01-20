@interface WFTopHitsAppShortcutsUpdater
- (SwiftVCDaemonXPCEventHandler)xpcEventHandler;
- (WFTopHitsAppShortcutsUpdater)initWithXPCEventHandler:(id)a3;
- (_CDClientContext)clientContext;
- (_CDContextualChangeRegistration)changeRegistration;
- (void)_updateWithCompletion:(id)a3;
- (void)applicationRegistered:(id)a3;
- (void)handleFavoriteCallsUpdate;
- (void)handleRecentCallsUpdate;
- (void)registerForUpcomingMediaSuggestionChanged;
- (void)setChangeRegistration:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setXpcEventHandler:(id)a3;
- (void)start;
- (void)updateWithCompletion:(id)a3;
@end

@implementation WFTopHitsAppShortcutsUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_xpcEventHandler, 0);
}

- (void)setChangeRegistration:(id)a3
{
}

- (_CDContextualChangeRegistration)changeRegistration
{
  return self->_changeRegistration;
}

- (void)setClientContext:(id)a3
{
}

- (_CDClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setXpcEventHandler:(id)a3
{
}

- (SwiftVCDaemonXPCEventHandler)xpcEventHandler
{
  return self->_xpcEventHandler;
}

- (void)registerForUpcomingMediaSuggestionChanged
{
  v3 = [MEMORY[0x1E4F5B6B8] keyPathForIntentsDataDictionary];
  v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = [MEMORY[0x1E4F5B6B8] intentClassKey];
  v6 = [v4 predicateWithFormat:@"self.%@.value.%@ == %@", v3, v5, @"INPlayMediaIntent"];

  v7 = [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v3 withPredicate:v6];
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E4F5B6C8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__WFTopHitsAppShortcutsUpdater_registerForUpcomingMediaSuggestionChanged__block_invoke;
  v12[3] = &unk_1E6542200;
  objc_copyWeak(&v13, &location);
  v9 = [v8 localWakingRegistrationWithIdentifier:@"com.apple.siriactionsd.TopHitsAppShortcutsUpdater" contextualPredicate:v7 clientIdentifier:@"com.apple.siriactionsd.contextstore-registration" callback:v12];
  [(WFTopHitsAppShortcutsUpdater *)self setChangeRegistration:v9];
  v10 = [MEMORY[0x1E4F5B6A8] userContext];
  [(WFTopHitsAppShortcutsUpdater *)self setClientContext:v10];

  v11 = [(WFTopHitsAppShortcutsUpdater *)self clientContext];
  [v11 registerCallback:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __73__WFTopHitsAppShortcutsUpdater_registerForUpcomingMediaSuggestionChanged__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained clientContext];
    v4 = [MEMORY[0x1E4F5B6B8] keyPathForIntentsDataDictionary];
    v5 = [v3 objectForKeyedSubscript:v4];
    v6 = (void *)[v5 copy];

    if (_NSIsNSDictionary())
    {
      v7 = [MEMORY[0x1E4F5B6B8] intentSourceBundleIDKey];
      v8 = [v6 objectForKeyedSubscript:v7];

      if (([v8 isEqualToString:*MEMORY[0x1E4FB4B18]] & 1) != 0
        || [v8 isEqualToString:*MEMORY[0x1E4FB4B40]])
      {
        v9 = getWFTopHitsLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315394;
          v11 = "-[WFTopHitsAppShortcutsUpdater registerForUpcomingMediaSuggestionChanged]_block_invoke";
          __int16 v12 = 2112;
          id v13 = v8;
          _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received media suggestion update for %@, triggering update", (uint8_t *)&v10, 0x16u);
        }

        [v2 updateWithCompletion:&__block_literal_global_211_7759];
      }
    }
  }
}

- (void)_updateWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = getWFTopHitsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Attempting App Shortcuts update", buf, 0xCu);
  }

  v5 = [MEMORY[0x1E4F72BC0] policyWithBundleIdentifier:*MEMORY[0x1E4FB4B88]];
  id v11 = 0;
  v6 = [v5 connectionWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__WFTopHitsAppShortcutsUpdater__updateWithCompletion___block_invoke;
    v9[3] = &unk_1E6542188;
    id v10 = v3;
    [v6 updateAppShortcutParametersWithCompletionHandler:v9];
  }
  else
  {
    v8 = getWFTopHitsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]";
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s App Shortcuts update connection failed: %@", buf, 0x16u);
    }

    (*((void (**)(id, id))v3 + 2))(v3, v7);
  }
}

void __54__WFTopHitsAppShortcutsUpdater__updateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getWFTopHitsLogObject();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v3;
      v6 = "%s App Shortcuts update failed: %@";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]_block_invoke";
    v6 = "%s App Shortcuts update completed";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v10, v11);
}

- (void)updateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__WFTopHitsAppShortcutsUpdater_updateWithCompletion___block_invoke;
  v6[3] = &unk_1E6542188;
  id v7 = v4;
  id v5 = v4;
  [(WFTopHitsAppShortcutsUpdater *)self _updateWithCompletion:v6];
}

void __53__WFTopHitsAppShortcutsUpdater_updateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5)
  {
    id v3 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    id v4 = objc_opt_new();
    [v3 setObject:v4 forKey:*MEMORY[0x1E4FB7420]];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleFavoriteCallsUpdate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = getWFTopHitsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[WFTopHitsAppShortcutsUpdater handleFavoriteCallsUpdate]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s Got favorite calls updated notification, triggering App Shortcuts update", (uint8_t *)&v4, 0xCu);
  }

  [(WFTopHitsAppShortcutsUpdater *)self updateWithCompletion:&__block_literal_global_194];
}

- (void)handleRecentCallsUpdate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = getWFTopHitsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[WFTopHitsAppShortcutsUpdater handleRecentCallsUpdate]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s Got recent calls updated notification, triggering App Shortcuts update", (uint8_t *)&v4, 0xCu);
  }

  [(WFTopHitsAppShortcutsUpdater *)self updateWithCompletion:&__block_literal_global_192];
}

- (void)applicationRegistered:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"isPlaceholder"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  char v9 = [v8 BOOLValue];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"bundleIDs"];

    if (v11)
    {
      objc_opt_class();
      int v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
    }
    else
    {
      int v12 = 0;
    }
    id v13 = v12;

    int v14 = [v13 containsObject:*MEMORY[0x1E4FB4BE8]];
    if (v14)
    {
      id v15 = getWFTopHitsLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        v17 = "-[WFTopHitsAppShortcutsUpdater applicationRegistered:]";
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app installed, triggering App Shortcuts update", (uint8_t *)&v16, 0xCu);
      }

      [(WFTopHitsAppShortcutsUpdater *)self updateWithCompletion:&__block_literal_global_190];
    }
  }
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFTopHitsAppShortcutsUpdater *)self xpcEventHandler];
  [v3 addObserver:self selector:sel_applicationRegistered_ name:@"ApplicationRegistered"];

  id v4 = [(WFTopHitsAppShortcutsUpdater *)self xpcEventHandler];
  [v4 addObserver:self selector:sel_handleRecentCallsUpdate name:@"com.apple.callhistory.notification.calls-changed"];

  id v5 = [(WFTopHitsAppShortcutsUpdater *)self xpcEventHandler];
  [v5 addObserver:self selector:sel_handleFavoriteCallsUpdate name:@"CNFavoritesChangedExternallyNotification"];

  [(WFTopHitsAppShortcutsUpdater *)self registerForUpcomingMediaSuggestionChanged];
  uint64_t v6 = [[WFXPCActivityScheduler alloc] initWithActivityIdentifier:@"com.apple.siriactionsd.UpdateAppShortcutsCheckIn"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__WFTopHitsAppShortcutsUpdater_start__block_invoke;
  v13[3] = &unk_1E65421B0;
  v13[4] = self;
  [(WFXPCActivityScheduler *)v6 scheduleWithRunHandler:v13];
  id v7 = [MEMORY[0x1E4F1CB18] lastAppShortcutUpdateDate];
  if (v7
    && (id v8 = objc_opt_new(),
        [v8 timeIntervalSinceDate:v7],
        double v10 = v9,
        v8,
        v10 <= 3600.0))
  {
    int v12 = getWFTopHitsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[WFTopHitsAppShortcutsUpdater start]";
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s Last update at: %@ was within the past hour, ignoring initial update", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v11 = getWFTopHitsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[WFTopHitsAppShortcutsUpdater start]";
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Last update at: %@ was more than an hour ago, performing initial App Shortcuts update", buf, 0x16u);
    }

    [(WFTopHitsAppShortcutsUpdater *)self updateWithCompletion:&__block_literal_global_7788];
  }
}

uint64_t __37__WFTopHitsAppShortcutsUpdater_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFTopHitsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v12 = "-[WFTopHitsAppShortcutsUpdater start]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Triggering scheduled App Shortcuts update", buf, 0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__WFTopHitsAppShortcutsUpdater_start__block_invoke_175;
  v9[3] = &unk_1E6542188;
  id v10 = v4;
  id v7 = v4;
  [v6 updateWithCompletion:v9];

  return 0;
}

void __37__WFTopHitsAppShortcutsUpdater_start__block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = getWFTopHitsLogObject();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[WFTopHitsAppShortcutsUpdater start]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v2;
      id v5 = "%s Initial App Shortcuts update completed with error: %{public}@";
      uint64_t v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[WFTopHitsAppShortcutsUpdater start]_block_invoke";
    id v5 = "%s Initial App Shortcuts update completed!";
    uint64_t v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 12;
    goto LABEL_6;
  }
}

uint64_t __37__WFTopHitsAppShortcutsUpdater_start__block_invoke_175(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFTopHitsAppShortcutsUpdater)initWithXPCEventHandler:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFTopHitsAppShortcutsUpdater;
  uint64_t v6 = [(WFTopHitsAppShortcutsUpdater *)&v10 init];
  os_log_type_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcEventHandler, a3);
    uint32_t v8 = v7;
  }

  return v7;
}

@end