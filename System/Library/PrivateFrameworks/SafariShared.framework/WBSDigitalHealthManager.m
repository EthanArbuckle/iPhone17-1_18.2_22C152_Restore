@interface WBSDigitalHealthManager
+ (void)_updateWebpageUsage:(id)a3 withDigitalHealthManagerUsageState:(unint64_t)a4 withCompletionHandler:(id)a5;
+ (void)deleteAllUsageHistoryWithProfileIdentifier:(id)a3;
+ (void)deleteUsageHistoryForURLs:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)deleteUsageHistoryFromDate:(id)a3 toDate:(id)a4 profileIdentifier:(id)a5;
- (WBSDigitalHealthManager)init;
- (WBSDigitalHealthManagerDelegate)delegate;
- (void)_historyItemsWereRemoved:(id)a3;
- (void)_historyWasCleared:(id)a3;
- (void)_requestPoliciesForWebsites:(id)a3 completionHandler:(id)a4;
- (void)_startObserving;
- (void)_stopObserving;
- (void)_stopUsageTrackingForURL:(id)a3 profileIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_updateUsageTrackingForURL:(id)a3 withBundleIdentifier:(id)a4 profileIdentifier:(id)a5 toState:(unint64_t)a6;
- (void)dealloc;
- (void)getOverlayStateForURLs:(id)a3 withCompletionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObservingWithCompletionHandler:(id)a3;
- (void)stopUsageTrackingForURL:(id)a3 profileIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)updateUsageTrackingForURL:(id)a3 withBundleIdentifier:(id)a4 profileIdentifier:(id)a5 toState:(unint64_t)a6;
@end

@implementation WBSDigitalHealthManager

- (void)getOverlayStateForURLs:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_45);
  if ([v8 count])
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__WBSDigitalHealthManager_getOverlayStateForURLs_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E5C9AAE8;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    [(WBSDigitalHealthManager *)self _requestPoliciesForWebsites:v8 completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)setDelegate:(id)a3
{
}

- (WBSDigitalHealthManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSDigitalHealthManager;
  v2 = [(WBSDigitalHealthManager *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__historyItemsWereRemoved_ name:@"WBSHistoryItemsWereRemovedNotification" object:0];
    [v3 addObserver:v2 selector:sel__historyWasCleared_ name:@"WBSHistoryWasClearedNotification" object:0];
    v4 = v2;
  }
  return v2;
}

void __41__WBSDigitalHealthManager_startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _startObserving];
    id WeakRetained = v2;
  }
}

- (void)_startObserving
{
  if (!self->_monitor)
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc(MEMORY[0x1E4F5F3B8]);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __42__WBSDigitalHealthManager__startObserving__block_invoke;
    id v11 = &unk_1E5C8E0B0;
    objc_copyWeak(&v12, &location);
    v4 = (DMFWebsitePolicyMonitor *)[v3 initWithPolicyChangeHandler:&v8];
    monitor = self->_monitor;
    self->_monitor = v4;

    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v8, v9, v10, v11);
    objc_super v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    trackedUrlsProfileIdentifierPairToUsageState = self->_trackedUrlsProfileIdentifierPairToUsageState;
    self->_trackedUrlsProfileIdentifierPairToUsageState = v6;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)startObserving
{
  objc_initWeak(&location, self);
  id v2 = digitalHealthManagerGlobalQueue();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__WBSDigitalHealthManager_startObserving__block_invoke;
  v3[3] = &unk_1E5C8E0B0;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSDigitalHealthManager;
  [(WBSDigitalHealthManager *)&v4 dealloc];
}

void __42__WBSDigitalHealthManager__startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v2 policyDidChangeForDigitalHealthManager:v3];
    }

    id WeakRetained = v3;
  }
}

- (void)stopObservingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = digitalHealthManagerGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSDigitalHealthManager_stopObservingWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5C9AAA0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__WBSDigitalHealthManager_stopObservingWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _stopObserving];
    id v3 = v5;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    id v3 = v5;
  }
}

- (void)_stopObserving
{
  monitor = self->_monitor;
  self->_monitor = 0;

  trackedUrlsProfileIdentifierPairToUsageState = self->_trackedUrlsProfileIdentifierPairToUsageState;
  self->_trackedUrlsProfileIdentifierPairToUsageState = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_monitor == a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained policyDidChangeForDigitalHealthManager:self];
    }
  }
}

- (void)_requestPoliciesForWebsites:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = digitalHealthManagerGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSDigitalHealthManager__requestPoliciesForWebsites_completionHandler___block_invoke;
  block[3] = &unk_1E5C8C8F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __73__WBSDigitalHealthManager__requestPoliciesForWebsites_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startObserving];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 requestPoliciesForWebsites:v2 completionHandler:v4];
}

uint64_t __72__WBSDigitalHealthManager_getOverlayStateForURLs_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_isHTTPFamilyURL");
}

void __72__WBSDigitalHealthManager_getOverlayStateForURLs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateUsageTrackingForURL:(id)a3 withBundleIdentifier:(id)a4 profileIdentifier:(id)a5 toState:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = digitalHealthManagerGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__WBSDigitalHealthManager_updateUsageTrackingForURL_withBundleIdentifier_profileIdentifier_toState___block_invoke;
  block[3] = &unk_1E5C9AB10;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  unint64_t v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __100__WBSDigitalHealthManager_updateUsageTrackingForURL_withBundleIdentifier_profileIdentifier_toState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUsageTrackingForURL:*(void *)(a1 + 40) withBundleIdentifier:*(void *)(a1 + 48) profileIdentifier:*(void *)(a1 + 56) toState:*(void *)(a1 + 64)];
}

- (void)_updateUsageTrackingForURL:(id)a3 withBundleIdentifier:(id)a4 profileIdentifier:(id)a5 toState:(unint64_t)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  if (objc_msgSend(v17, "safari_isHTTPFamilyURL"))
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F97EE0]) initWithFirst:v17 second:v11];
    uint64_t v13 = [(NSMutableDictionary *)self->_trackedUrlsProfileIdentifierPairToUsageState objectForKeyedSubscript:v12];
    id v14 = (void *)v13;
    if (!a6 || v13)
    {
      if (!a6)
      {
        [(WBSDigitalHealthManager *)self _stopUsageTrackingForURL:v17 profileIdentifier:v11 withCompletionHandler:0];
        goto LABEL_8;
      }
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4FB3690]);
      id v16 = convertSafariProfileIdentifierToScreenTimeProfileIdentifier(v11);
      id v14 = (void *)[v15 initWithURL:v17 bundleIdentifier:v10 profileIdentifier:v16];

      [(NSMutableDictionary *)self->_trackedUrlsProfileIdentifierPairToUsageState setObject:v14 forKeyedSubscript:v12];
    }
    [(id)objc_opt_class() _updateWebpageUsage:v14 withDigitalHealthManagerUsageState:a6 withCompletionHandler:0];
LABEL_8:
  }
}

- (void)stopUsageTrackingForURL:(id)a3 profileIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = digitalHealthManagerGlobalQueue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__WBSDigitalHealthManager_stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5C9A780;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __91__WBSDigitalHealthManager_stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopUsageTrackingForURL:*(void *)(a1 + 40) profileIdentifier:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 56)];
}

- (void)_stopUsageTrackingForURL:(id)a3 profileIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v13 = (void (**)(void))a5;
  id v8 = (objc_class *)MEMORY[0x1E4F97EE0];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithFirst:v10 second:v9];

  id v12 = [(NSMutableDictionary *)self->_trackedUrlsProfileIdentifierPairToUsageState objectForKeyedSubscript:v11];
  if (v12)
  {
    [(NSMutableDictionary *)self->_trackedUrlsProfileIdentifierPairToUsageState removeObjectForKey:v11];
    [(id)objc_opt_class() _updateWebpageUsage:v12 withDigitalHealthManagerUsageState:0 withCompletionHandler:v13];
  }
  else if (v13)
  {
    v13[2]();
  }
}

- (void)_historyItemsWereRemoved:(id)a3
{
  id v9 = a3;
  id v3 = [v9 userInfo];
  id v4 = objc_msgSend(v3, "safari_arrayForKey:", @"WBSHistoryItemsKey");

  if ([v4 count])
  {
    id v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_17);
    id v6 = [v9 object];
    id v7 = objc_opt_class();
    id v8 = [v6 profileLocalIdentifier];
    [v7 deleteUsageHistoryForURLs:v5 profileIdentifier:v8 completionHandler:0];
  }
}

uint64_t __52__WBSDigitalHealthManager__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  return [a2 url];
}

- (void)_historyWasCleared:(id)a3
{
  id v5 = [a3 object];
  id v3 = objc_opt_class();
  id v4 = [v5 profileLocalIdentifier];
  [v3 deleteAllUsageHistoryWithProfileIdentifier:v4];
}

+ (void)deleteAllUsageHistoryWithProfileIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = digitalHealthManagerGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke;
  block[3] = &unk_1E5C8C880;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_cold_1(a1, v2);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F99D80]);
  id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
  id v5 = convertSafariProfileIdentifierToScreenTimeProfileIdentifier(*(void **)(a1 + 32));
  [v3 deleteAllWebHistoryForApplication:v4 profileIdentifier:v5 completionHandler:&__block_literal_global_23];
}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_20_cold_1(v3);
    }
  }
}

+ (void)deleteUsageHistoryFromDate:(id)a3 toDate:(id)a4 profileIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F28C18];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithStartDate:v10 endDate:v9];

  id v12 = digitalHealthManagerGlobalQueue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke;
  v15[3] = &unk_1E5C8C920;
  id v16 = v7;
  id v17 = v11;
  id v13 = v11;
  id v14 = v7;
  dispatch_async(v12, v15);
}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_cold_1(a1, v2);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F99D80]);
  id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = convertSafariProfileIdentifierToScreenTimeProfileIdentifier(*(void **)(a1 + 32));
  [v3 deleteWebHistoryDuringInterval:v5 application:v4 profileIdentifier:v6 completionHandler:&__block_literal_global_27_0];
}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_25_cold_1(v3);
    }
  }
}

+ (void)deleteUsageHistoryForURLs:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[a3 copy];
  id v10 = digitalHealthManagerGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5C8C8F8;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke(void **a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_cold_1((uint64_t)a1, v2);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F99D80]);
  id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = a1[5];
    id v6 = convertSafariProfileIdentifierToScreenTimeProfileIdentifier(a1[4]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_30;
    v21[3] = &unk_1E5C8DCF8;
    v22 = a1[6];
    [v3 deleteWebHistoryForURLs:v5 application:v4 profileIdentifier:v6 completionHandler:v21];

    id v7 = v22;
  }
  else
  {
    id v8 = v3;
    if (a1[6]) {
      id v7 = dispatch_group_create();
    }
    else {
      id v7 = 0;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = a1[5];
    uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (v7) {
            dispatch_group_enter(v7);
          }
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_31;
          v15[3] = &unk_1E5C8DC70;
          id v16 = v7;
          [v8 deleteWebHistoryForURL:v13 application:v4 completionHandler:v15];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v10);
    }

    if (a1[6]) {
      dispatch_group_notify(v7, MEMORY[0x1E4F14428], a1[6]);
    }
    id v3 = v8;
  }
}

void __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_30_cold_1(v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_30_cold_1(v4);
    }
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_group_leave(v5);
  }
}

+ (void)_updateWebpageUsage:(id)a3 withDigitalHealthManagerUsageState:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  if (a4 != 2) {
    a4 = a4 == 1;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__WBSDigitalHealthManager__updateWebpageUsage_withDigitalHealthManagerUsageState_withCompletionHandler___block_invoke;
  v9[3] = &unk_1E5C8DCF8;
  id v10 = v7;
  id v8 = v7;
  [a3 changeState:a4 completionHandler:v9];
}

void __104__WBSDigitalHealthManager__updateWebpageUsage_withDigitalHealthManagerUsageState_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __104__WBSDigitalHealthManager__updateWebpageUsage_withDigitalHealthManagerUsageState_withCompletionHandler___block_invoke_cold_1(v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (WBSDigitalHealthManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSDigitalHealthManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackedUrlsProfileIdentifierPairToUsageState, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Deleting all Screen Time usage history in profile (%{public}@).", (uint8_t *)&v3, 0xCu);
}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_20_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Unable to delete all Digital Health usage history: %{public}@", v6, v7, v8, v9, v10);
}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Deleting Screen Time usage history in profile (%{public}@) for specified time interval (%{public}@).", (uint8_t *)&v4, 0x16u);
}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_25_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Unable to delete Digital Health usage history over time range: %{public}@", v6, v7, v8, v9, v10);
}

void __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = [(id)OUTLINED_FUNCTION_1_6() count];
  _os_log_debug_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEBUG, "Deleting Screen Time usage history in profile (%{public}@) for %lu URLs.", (uint8_t *)&v5, 0x16u);
}

void __89__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier_completionHandler___block_invoke_30_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Unable to delete URL-specific Digital Health usage history: %{public}@", v6, v7, v8, v9, v10);
}

void __104__WBSDigitalHealthManager__updateWebpageUsage_withDigitalHealthManagerUsageState_withCompletionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Unable to update Digital Health usage state: %{public}@", v6, v7, v8, v9, v10);
}

@end