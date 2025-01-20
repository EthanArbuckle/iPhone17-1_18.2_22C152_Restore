@interface NMSMusicRecommendationManager
+ (BOOL)_shouldComputeLibraryRecommendations;
+ (id)sharedManager;
- (BOOL)_isLibraryRecommendationExpired;
- (BOOL)_updateRecommendationsSelections;
- (BOOL)_updateWithRecommendations:(id)a3;
- (BOOL)hasSelectedRecommendationWithIdentifier:(id)a3;
- (BOOL)wantsContentsUpdate;
- (NMSMusicRecommendationManager)init;
- (id)_expirationDateForUpdateDate:(id)a3 withOffsetDays:(int64_t)a4;
- (id)_fetchAddedDateForContainer:(id)a3;
- (id)_recommendations;
- (id)_sortedContainersBasedOnRecency;
- (void)_finishLoadingContentsWithResponse:(id)a3;
- (void)_handleActiveAccountDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryDynamicPropertiesDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryEntitiesAddedOrRemovedNotification:(id)a3;
- (void)_handleMusicLibraryContentsDidChangeNotification:(id)a3;
- (void)_handlePairedDeviceDidBecomeActiveNotification:(id)a3;
- (void)_handlePairingFinishedNotification:(id)a3;
- (void)_handleRecommendationSelectionsDidChangeNotification:(id)a3;
- (void)_handleRecommendationStoreContentsDidChangeNotification:(id)a3;
- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_invalidateLibraryRecommendationExpirationTimer;
- (void)_notifyMusicRecommendationsDidUpdateNotification;
- (void)_persistUpdatedRecommendationsWithResponse:(id)a3;
- (void)_registerForPairingFinishedNotification;
- (void)_reloadLibraryRecommendations;
- (void)_reloadRecommendationContentsIfNecessary;
- (void)_reloadRecommendationsFromDefaultsWithCompletion:(id)a3;
- (void)_removeLegacyRecommendationsDefaultsIfNecessary;
- (void)_removePreviousCachedRecommendationsResponses;
- (void)_removePreviousRecommendationDefaults;
- (void)_scheduleNextLibraryRecommendationReloadIfNecessary;
- (void)_unregisterForPairingFinishedNotification;
- (void)dealloc;
- (void)fetchRecommendationsWithQueue:(id)a3 completion:(id)a4;
- (void)persistRecommendationsSelections:(id)a3;
- (void)setWantsContentsUpdate:(BOOL)a3;
@end

@implementation NMSMusicRecommendationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedManager___sharedManager;

  return v2;
}

uint64_t __46__NMSMusicRecommendationManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NMSMusicRecommendationManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)NMSMusicRecommendationManager;
  v2 = [(NMSMusicRecommendationManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendationManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleRecommendationStoreContentsDidChangeNotification_ name:@"com.apple.nanomusicsync.reco-store" object:0];
    [v6 addObserver:v2 selector:sel__handleRecommendationSelectionsDidChangeNotification_ name:@"com.apple.nanomusicsync.reco-selections" object:0];
    [v6 addObserver:v2 selector:sel__handleMediaLibraryDidChangeNotification_ name:*MEMORY[0x263F11418] object:0];
    [v6 addObserver:v2 selector:sel__handleMediaLibraryDynamicPropertiesDidChangeNotification_ name:*MEMORY[0x263F11428] object:0];
    uint64_t v7 = *MEMORY[0x263F57390];
    v8 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
    [v6 addObserver:v2 selector:sel__handleMusicLibraryContentsDidChangeNotification_ name:v7 object:v8];

    [v6 addObserver:v2 selector:sel__handlePairedDeviceDidBecomeActiveNotification_ name:*MEMORY[0x263F57688] object:0];
    v9 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v9 beginGeneratingLibraryChangeNotifications];

    v10 = objc_alloc_init(NMSInitialCloudLibraryImportObserver);
    initialCloudLibraryImportObserver = v2->_initialCloudLibraryImportObserver;
    v2->_initialCloudLibraryImportObserver = v10;

    [(NMSMusicRecommendationManager *)v2 fetchRecommendationsWithQueue:0 completion:0];
  }
  return v2;
}

- (void)fetchRecommendationsWithQueue:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F08C38] UUID];
  v9 = NMLogForCategory(5);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x223CA14E0](v7);
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] Will fetch recommendations for request: %@, queue: %@, completion: %@", buf, 0x20u);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke;
  v15[3] = &unk_264634790;
  id v16 = v6;
  v17 = self;
  id v18 = v8;
  id v19 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v6;
  dispatch_async(queue, v15);
}

void __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v3 = dispatch_get_global_queue(21, 0);
  }
  dispatch_queue_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 40))
  {
    id v6 = NMLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v7;
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] Will return existing recommendations for request: %@", buf, 0xCu);
    }

    if (*(void *)(a1 + 56))
    {
      v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 8) copy];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_74;
      block[3] = &unk_2646346C0;
      id v34 = *(id *)(a1 + 48);
      id v9 = *(id *)(a1 + 56);
      id v35 = v8;
      id v36 = v9;
      id v10 = v8;
      dispatch_async(v4, block);
    }
  }
  else
  {
    BOOL v11 = *(void *)(v5 + 32) == 0;
    id v12 = NMLogForCategory(5);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v15;
        _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] Initial fetch started for request: %@", buf, 0xCu);
      }

      id v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v17 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_75;
      v29[3] = &unk_264634768;
      id v30 = *(id *)(a1 + 48);
      objc_copyWeak(&v32, (id *)buf);
      id v18 = v16;
      v31 = v18;
      [v17 _reloadRecommendationsFromDefaultsWithCompletion:v29];
      uint64_t v19 = *(void *)(a1 + 40);
      v20 = *(void **)(v19 + 32);
      *(void *)(v19 + 32) = v18;
      v21 = v18;

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v14;
        _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] Will wait for initial fetch to complete for request: %@", buf, 0xCu);
      }
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      id v23 = *(NSObject **)(v22 + 32);
      __int16 v24 = *(NSObject **)(v22 + 16);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_77;
      v25[3] = &unk_264634790;
      v25[4] = v22;
      uint64_t v26 = v4;
      id v27 = *(id *)(a1 + 48);
      id v28 = *(id *)(a1 + 56);
      dispatch_group_notify(v23, v24, v25);
    }
  }
}

- (void)_reloadRecommendationsFromDefaultsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  uint64_t v5 = self->_queue;
  id v6 = [MEMORY[0x263F893C0] activeAccount];
  uint64_t v7 = [v6 accountDSID];

  if ([v7 length])
  {
    v8 = +[NMSyncDefaults sharedDefaults];
    id v9 = [v8 cachedRecommendationsData];
  }
  else
  {
    v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] Not using cached store recommendations since we no longer have an active account.", buf, 2u);
    }
    id v9 = 0;
  }

  id v10 = objc_alloc_init(NMSMusicRecommendationsRequest);
  [(NMSMusicRecommendationsRequest *)v10 setUseCachedDataOnly:1];
  [(NMSMusicRecommendationsRequest *)v10 setCachedData:v9];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke;
  v13[3] = &unk_264634808;
  BOOL v11 = v5;
  uint64_t v14 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v4;
  id v15 = v12;
  [(NMSMusicRecommendationsRequest *)v10 performWithResponseHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_75(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Initial fetch complete for request: %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 40) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F11E40] defaultMediaLibrary];
  [v3 endGeneratingLibraryChangeNotifications];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = [MEMORY[0x263F087C8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)NMSMusicRecommendationManager;
  [(NMSMusicRecommendationManager *)&v6 dealloc];
}

- (void)setWantsContentsUpdate:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__NMSMusicRecommendationManager_setWantsContentsUpdate___block_invoke;
  v4[3] = &unk_264634428;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __56__NMSMusicRecommendationManager_setWantsContentsUpdate___block_invoke(uint64_t result)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(unsigned __int8 *)(*(void *)(result + 32) + 56) != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v1 = result;
    v2 = NMLogForCategory(5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(v1 + 40)) {
        uint64_t v3 = @"YES";
      }
      else {
        uint64_t v3 = @"NO";
      }
      int v5 = 138412290;
      objc_super v6 = v3;
      _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] set wantsContentsUpdate: %@", (uint8_t *)&v5, 0xCu);
    }

    *(unsigned char *)(*(void *)(v1 + 32) + 56) = *(unsigned char *)(v1 + 40);
    [*(id *)(v1 + 32) _removeLegacyRecommendationsDefaultsIfNecessary];
    id v4 = *(unsigned char **)(v1 + 32);
    if (v4[56]) {
      [v4 _registerForPairingFinishedNotification];
    }
    else {
      [v4 _unregisterForPairingFinishedNotification];
    }
    return [*(id *)(v1 + 32) _reloadRecommendationContentsIfNecessary];
  }
  return result;
}

- (void)_registerForPairingFinishedNotification
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handlePairingFinishedNotification_ name:*MEMORY[0x263F576A8] object:0];

  id v4 = (id)[MEMORY[0x263F57730] sharedInstance];
}

- (void)_unregisterForPairingFinishedNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F576A8] object:0];
}

uint64_t __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_74(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Calling completion handler with existing recommendations for request: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_77(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copy];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_2;
  block[3] = &unk_2646346C0;
  uint64_t v3 = *(NSObject **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  id v8 = v2;
  id v9 = v4;
  id v5 = v2;
  dispatch_async(v3, block);
}

uint64_t __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Calling completion handler with newly fetched recommendations for request: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)hasSelectedRecommendationWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NMSyncDefaults sharedDefaults];
  int v5 = [v4 musicRecommendationDict];
  uint64_t v6 = [v5 objectForKeyedSubscript:v3];

  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)persistRecommendationsSelections:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v3;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] Persisting recommendation selections for: %@", buf, 0xCu);
  }

  int v5 = +[NMSyncDefaults sharedDefaults];
  uint64_t v6 = [v5 musicRecommendationDict];
  char v7 = (void *)[v6 mutableCopy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isSelected", (void)v17));
        id v15 = [v13 identifier];
        [v7 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v16 = (void *)[v7 copy];
  [v5 setMusicRecommendationDict:v16];
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_INFO, "[Recommendation] _handleSubscriptionStatusDidChangeNotification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = +[NMSSubscriptionManager sharedManager];
  char v3 = [v2 hasCapability:1];

  if ((v3 & 1) == 0)
  {
    id v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = +[NMSSubscriptionManager sharedManager];
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = [v5 subscriptionCapabilities];
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] Subscription capabilities changed to %lu. Removing recommendations defaults.", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _removePreviousRecommendationDefaults];
    [*(id *)(a1 + 32) _removePreviousCachedRecommendationsResponses];
    uint64_t v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke_81;
    v7[3] = &unk_2646347B8;
    v7[4] = v6;
    [v6 _reloadRecommendationsFromDefaultsWithCompletion:v7];
  }
}

uint64_t __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke_81(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (void)_handleActiveAccountDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Active account is changed. Removing recommendations defaults of previous account.", buf, 2u);
  }

  [*(id *)(a1 + 32) _removePreviousRecommendationDefaults];
  [*(id *)(a1 + 32) _removePreviousCachedRecommendationsResponses];
  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke_82;
  v5[3] = &unk_2646347B8;
  v5[4] = v3;
  return [v3 _reloadRecommendationsFromDefaultsWithCompletion:v5];
}

uint64_t __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke_82(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (void)_handlePairingFinishedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NMSMusicRecommendationManager__handlePairingFinishedNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __68__NMSMusicRecommendationManager__handlePairingFinishedNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Pairing finished. Reloading recommendations.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _reloadRecommendationContentsIfNecessary];
}

- (void)_handleRecommendationStoreContentsDidChangeNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  char v3 = [v2 objectForKeyedSubscript:@"IsInProcessNotification"];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    int v5 = NMLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendation store contents did change. Reloading recommendations.", buf, 2u);
    }

    id v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke_83;
    v7[3] = &unk_2646347B8;
    void v7[4] = v6;
    [v6 _reloadRecommendationsFromDefaultsWithCompletion:v7];
  }
}

uint64_t __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke_83(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (void)_handleRecommendationSelectionsDidChangeNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__NMSMusicRecommendationManager__handleRecommendationSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __86__NMSMusicRecommendationManager__handleRecommendationSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendation selections did change.", buf, 2u);
  }

  char v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"IsInProcessNotification"];
  char v5 = [v4 BOOLValue];

  uint64_t result = [*(id *)(a1 + 40) _updateRecommendationsSelections];
  if ((v5 & 1) != 0 || result)
  {
    char v7 = +[NMSyncDefaults sharedDefaults];
    [v7 setLastUserPinningChangeDateForBundleID:@"com.apple.NanoMusic"];

    id v8 = NMLogForCategory(12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "Music: Set last user pinning change date, due to change in recommendation selections.", v9, 2u);
    }

    return [*(id *)(a1 + 40) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (void)_handleMediaLibraryEntitiesAddedOrRemovedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media Library entities added or removed. Reloading recommendations.", buf, 2u);
  }

  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke_84;
  v5[3] = &unk_2646347B8;
  v5[4] = v3;
  return [v3 _reloadRecommendationsFromDefaultsWithCompletion:v5];
}

uint64_t __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke_84(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (void)_handleMediaLibraryDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media Library did change. Reloading recommendations.", buf, 2u);
  }

  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke_85;
  v5[3] = &unk_2646347B8;
  v5[4] = v3;
  return [v3 _reloadRecommendationsFromDefaultsWithCompletion:v5];
}

uint64_t __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke_85(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (void)_handleMediaLibraryDynamicPropertiesDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media Library dynamic properties did change. Reloading recommendations.", buf, 2u);
  }

  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke_86;
  v5[3] = &unk_2646347B8;
  v5[4] = v3;
  return [v3 _reloadRecommendationsFromDefaultsWithCompletion:v5];
}

uint64_t __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke_86(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (void)_handleMusicLibraryContentsDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationManager__handleMusicLibraryContentsDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __82__NMSMusicRecommendationManager__handleMusicLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media library updated. Reloading recommendations.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _reloadRecommendationContentsIfNecessary];
}

- (void)_handlePairedDeviceDidBecomeActiveNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Paired device became active. Reloading recommendations.", buf, 2u);
  }

  [*(id *)(a1 + 32) _reloadRecommendationContentsIfNecessary];
  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke_87;
  v5[3] = &unk_2646347B8;
  v5[4] = v3;
  return [v3 _reloadRecommendationsFromDefaultsWithCompletion:v5];
}

uint64_t __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke_87(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _notifyMusicRecommendationsDidUpdateNotification];
  }
  return result;
}

- (id)_recommendations
{
  return self->_recommendations;
}

- (void)_reloadRecommendationContentsIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsContentsUpdate)
  {
    if ([(id)objc_opt_class() _shouldComputeLibraryRecommendations])
    {
      initialCloudLibraryImportObserver = self->_initialCloudLibraryImportObserver;
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke;
      v4[3] = &unk_264633B20;
      v4[4] = self;
      [(NMSInitialCloudLibraryImportObserver *)initialCloudLibraryImportObserver performBlockWhenLibraryIsReady:v4];
    }
  }
}

void __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke_2;
  block[3] = &unk_264633B20;
  void block[4] = v1;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v2, v3);
}

uint64_t __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadLibraryRecommendations];
}

void __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke_2;
  block[3] = &unk_2646347E0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) recommendations];
    id v3 = [v2 array];
    uint64_t v4 = [WeakRetained _updateWithRecommendations:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
}

- (void)_notifyMusicRecommendationsDidUpdateNotification
{
  id v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[Recommendation] Notifying clients about updated recommendations.", v5, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"NMSMusicRecommendationsDidUpdateNotification" object:self];
}

- (void)_reloadLibraryRecommendations
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(NMSMusicRecommendationManager *)self _isLibraryRecommendationExpired];
  uint64_t v4 = NMLogForCategory(5);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] evaluating library music recommendations.", buf, 2u);
    }

    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = [MEMORY[0x263EFF980] array];
    id v8 = [(NMSMusicRecommendationManager *)self _sortedContainersBasedOnRecency];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v14 = [v13 type];
          if (v14 == 1)
          {
            id v15 = [v13 persistentID];
            id v16 = v7;
          }
          else
          {
            if (v14) {
              continue;
            }
            id v15 = [v13 persistentID];
            id v16 = v6;
          }
          [v16 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }
    uint64_t v17 = [v6 count];
    if (v17 + [v7 count])
    {
      long long v18 = +[NMSyncDefaults sharedDefaults];
      [v18 beginBatchUpdates];
      v21 = (void *)[v6 copy];
      [v18 setLibraryRecommendationPlaylists:v21];

      uint64_t v22 = (void *)[v7 copy];
      [v18 setLibraryRecommendationAlbums:v22];

      id v23 = [MEMORY[0x263EFF910] date];
      uint64_t v24 = [(NMSMusicRecommendationManager *)self _expirationDateForUpdateDate:v23 withOffsetDays:3];
      [v18 setLibraryRecommendationExpirationDate:v24];

      [v18 endBatchUpdates];
      [(NMSMusicRecommendationManager *)self _scheduleNextLibraryRecommendationReloadIfNecessary];
    }
    else
    {
      long long v18 = NMLogForCategory(5);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "[Recommendation] Library music recommendations are empty, skipping persisting.", buf, 2u);
      }
    }
  }
  else
  {
    if (v5)
    {
      long long v19 = +[NMSyncDefaults sharedDefaults];
      long long v20 = [v19 libraryRecommendationExpirationDate];
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] NOT evaluating library music recommendations; expiration date is: %{public}@.",
        buf,
        0xCu);
    }
    [(NMSMusicRecommendationManager *)self _scheduleNextLibraryRecommendationReloadIfNecessary];
  }
}

- (id)_sortedContainersBasedOnRecency
{
  v77[5] = *MEMORY[0x263EF8340];
  v54 = [MEMORY[0x263EFF980] array];
  v49 = [MEMORY[0x263EFF980] array];
  BOOL v3 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  uint64_t v4 = (void *)MEMORY[0x263F573F8];
  uint64_t v5 = MEMORY[0x263EFFA80];
  id v6 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57338] equalToValue:MEMORY[0x263EFFA80]];
  v77[0] = v6;
  id v7 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57328] equalToValue:MEMORY[0x263EFFA88]];
  v77[1] = v7;
  id v8 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57368] equalToValue:v5];
  v77[2] = v8;
  uint64_t v9 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57360] equalToValue:v5];
  v77[3] = v9;
  uint64_t v10 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57330] equalToValue:v5];
  v77[4] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:5];
  uint64_t v12 = [v4 predicateMatchingPredicates:v11];

  v56 = (void *)v12;
  BOOL v13 = [MEMORY[0x263F57418] unrestrictedQueryWithLibrary:v3 predicate:v12 orderingTerms:0];
  uint64_t v14 = *MEMORY[0x263F57320];
  v76[0] = *MEMORY[0x263F57350];
  v76[1] = v14;
  uint64_t v15 = *MEMORY[0x263F57358];
  v76[2] = *MEMORY[0x263F57318];
  v76[3] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:4];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke;
  v69[3] = &unk_264634830;
  id v17 = v3;
  id v70 = v17;
  id v18 = v54;
  id v71 = v18;
  v55 = v13;
  [v13 enumeratePersistentIDsAndProperties:v16 usingBlock:v69];

  long long v19 = [MEMORY[0x263EFF9C0] set];
  v53 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F573D0] equalToValue:&unk_26D51D1A8];
  long long v20 = objc_msgSend(MEMORY[0x263F57470], "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v17);
  uint64_t v75 = *MEMORY[0x263F573A8];
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_102;
  v67[3] = &unk_264634858;
  id v22 = v19;
  id v68 = v22;
  v52 = v20;
  [v20 enumeratePersistentIDsAndProperties:v21 usingBlock:v67];

  v51 = [MEMORY[0x263F57420] predicateWithProperty:*MEMORY[0x263F57308] values:v22];
  id v23 = objc_msgSend(MEMORY[0x263F573F0], "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v17);
  uint64_t v24 = *MEMORY[0x263F572F0];
  v74[0] = *MEMORY[0x263F572F8];
  v74[1] = v24;
  long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_2;
  v65[3] = &unk_264634858;
  id v26 = v49;
  id v66 = v26;
  v50 = v23;
  [v23 enumeratePersistentIDsAndProperties:v25 usingBlock:v65];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v27 = v18;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v62 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v33 = [(NMSMusicRecommendationManager *)self _fetchAddedDateForContainer:v32];
        [v32 setAddedDate:v33];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v61 objects:v73 count:16];
    }
    while (v29);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v34 = v26;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v57 objects:v72 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        v40 = [(NMSMusicRecommendationManager *)self _fetchAddedDateForContainer:v39];
        [v39 setAddedDate:v40];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v57 objects:v72 count:16];
    }
    while (v36);
  }

  v41 = [MEMORY[0x263EFF980] arrayWithArray:v27];
  [v41 addObjectsFromArray:v34];
  [v41 sortUsingComparator:&__block_literal_global_107];
  unint64_t v42 = [v41 count];
  v43 = +[NMSyncDefaults sharedDefaults];
  v44 = [v43 minimumNumberOfRecentMusicModelObjects];
  unint64_t v45 = [v44 unsignedIntegerValue];

  if (v42 >= v45) {
    unint64_t v46 = v45;
  }
  else {
    unint64_t v46 = v42;
  }
  v47 = objc_msgSend(v41, "subarrayWithRange:", 0, v46);

  return v47;
}

void __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3[3]
    || (v6 = (void *)[objc_alloc(MEMORY[0x263F57418]) initWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)], objc_msgSend(MEMORY[0x263F57470], "containerQueryWithContainer:", v6), id v7 = objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "hasEntities"), v7, v6, v8))
  {
    uint64_t v9 = [NMSContainer alloc];
    uint64_t v10 = [NSNumber numberWithLongLong:a2];
    uint64_t v11 = [(NMSContainer *)v9 initWithPersistentID:v10 name:*a3 type:0];

    [(NMSContainer *)v11 setPlayedDate:a3[1]];
    [(NMSContainer *)v11 setAddedDate:a3[2]];
    [*(id *)(a1 + 40) addObject:v11];
  }
}

uint64_t __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
{
  return [*(id *)(a1 + 32) addObject:*a3];
}

void __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [NMSContainer alloc];
  id v7 = [NSNumber numberWithLongLong:a2];
  int v8 = [(NMSContainer *)v6 initWithPersistentID:v7 name:*a3 type:1];

  [(NMSContainer *)v8 setPlayedDate:a3[1]];
  [*(id *)(a1 + 32) addObject:v8];
}

uint64_t __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 addedDate];
  [v6 doubleValue];
  double v8 = v7;

  uint64_t v9 = [v5 playedDate];

  [v9 doubleValue];
  double v11 = v10;

  if (v8 >= v11) {
    double v12 = v8;
  }
  else {
    double v12 = v11;
  }
  BOOL v13 = [v4 addedDate];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = [v4 playedDate];

  [v16 doubleValue];
  double v18 = v17;

  if (v15 >= v18) {
    double v19 = v15;
  }
  else {
    double v19 = v18;
  }
  if (v12 < v19) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)_fetchAddedDateForContainer:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 type];
  id v5 = (id *)MEMORY[0x263F573B0];
  if (v4) {
    id v5 = (id *)MEMORY[0x263F573A8];
  }
  id v6 = *v5;
  double v7 = (void *)MEMORY[0x263F57410];
  double v8 = [v3 persistentID];
  uint64_t v9 = [v7 predicateWithProperty:v6 value:v8 comparison:1];

  double v10 = (void *)MEMORY[0x263F57470];
  double v11 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  double v12 = [v10 unrestrictedAllItemsQueryWithlibrary:v11 predicate:v9 orderingTerms:0];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  uint64_t v24 = __Block_byref_object_dispose__6;
  uint64_t v13 = [v3 addedDate];
  double v14 = (void *)v13;
  double v15 = &unk_26D51D1C0;
  if (v13) {
    double v15 = (void *)v13;
  }
  id v25 = v15;

  v26[0] = *MEMORY[0x263F573B8];
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__NMSMusicRecommendationManager__fetchAddedDateForContainer___block_invoke;
  v19[3] = &unk_2646348A0;
  v19[4] = &v20;
  [v12 enumeratePersistentIDsAndProperties:v16 usingBlock:v19];

  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __61__NMSMusicRecommendationManager__fetchAddedDateForContainer___block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
  double v6 = v5;
  [*a3 doubleValue];
  if (v6 < v7)
  {
    id v8 = *a3;
    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_storeStrong(v9, v8);
  }
}

+ (BOOL)_shouldComputeLibraryRecommendations
{
  v2 = [MEMORY[0x263F57730] sharedInstance];
  char v3 = [v2 isPaired];

  return v3;
}

- (void)_finishLoadingContentsWithResponse:(id)a3
{
  id v4 = a3;
  double v5 = [v4 recommendations];
  double v6 = [v5 array];
  BOOL v7 = [(NMSMusicRecommendationManager *)self _updateWithRecommendations:v6];

  [(NMSMusicRecommendationManager *)self _persistUpdatedRecommendationsWithResponse:v4];
  if (v7)
  {
    [(NMSMusicRecommendationManager *)self _notifyMusicRecommendationsDidUpdateNotification];
  }
}

- (BOOL)_updateWithRecommendations:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v5 = +[NMSyncDefaults sharedDefaults];
  double v6 = [v5 musicRecommendationDict];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "identifier", (void)v21);
        double v14 = [v6 objectForKeyedSubscript:v13];

        if (v14) {
          objc_msgSend(v12, "setSelected:", objc_msgSend(v14, "BOOLValue"));
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v9);
  }

  BOOL v15 = [(NSArray *)self->_recommendations isEqualToArray:v7];
  if (!v15)
  {
    id v16 = (NSArray *)[v7 copy];
    recommendations = self->_recommendations;
    self->_recommendations = v16;

    double v18 = NMLogForCategory(5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = self->_recommendations;
      *(_DWORD *)buf = 138412290;
      id v26 = v19;
      _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendations contents updated: %@", buf, 0xCu);
    }

    [(NMSMusicRecommendationManager *)self persistRecommendationsSelections:self->_recommendations];
  }

  return !v15;
}

- (BOOL)_updateRecommendationsSelections
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v3 = +[NMSyncDefaults sharedDefaults];
  id v4 = [v3 musicRecommendationDict];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = self->_recommendations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  BOOL v7 = v6 != 0;
  if (v6)
  {
    uint64_t v8 = v6;
    BOOL v18 = v6 != 0;
    int v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 identifier];
        double v14 = [v4 objectForKeyedSubscript:v13];

        if (v14) {
          uint64_t v15 = [v14 BOOLValue];
        }
        else {
          uint64_t v15 = 1;
        }
        v9 |= v15 ^ [v12 isSelected];
        [v12 setSelected:v15];
      }
      uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);

    if ((v9 & 1) == 0)
    {
      BOOL v7 = 0;
      goto LABEL_17;
    }
    NMLogForCategory(5);
    double v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      recommendations = self->_recommendations;
      *(_DWORD *)buf = 138412290;
      long long v24 = recommendations;
      _os_log_impl(&dword_2228FD000, &v5->super, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendations selections updated: %@", buf, 0xCu);
    }
    BOOL v7 = v18;
  }

LABEL_17:
  return v7;
}

- (void)_persistUpdatedRecommendationsWithResponse:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = self->_recommendations;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isSelected", (void)v20));
        uint64_t v13 = [v11 identifier];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  double v14 = [v4 cachedData];
  if ((unint64_t)[v14 length] >= 0x55731)
  {
    uint64_t v15 = NMLogForCategory(5);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NMSMusicRecommendationManager _persistUpdatedRecommendationsWithResponse:](v14, v15);
    }

    uint64_t v16 = [MEMORY[0x263EFF8F8] data];

    double v14 = (void *)v16;
  }
  id v17 = +[NMSyncDefaults sharedDefaults];
  [v17 beginBatchUpdates];
  BOOL v18 = (void *)[v5 copy];
  [v17 setMusicRecommendationDict:v18];

  [v17 setCachedRecommendationsData:v14];
  long long v19 = [MEMORY[0x263EFF910] date];
  [v17 setCatalogRecommendationsLastUpdateDate:v19];

  [v17 endBatchUpdates];
}

- (void)_removeLegacyRecommendationsDefaultsIfNecessary
{
}

- (void)_removePreviousRecommendationDefaults
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsContentsUpdate)
  {
    uint64_t v16 = +[NMSyncDefaults sharedDefaults];
    char v3 = [MEMORY[0x263EFF9A0] dictionary];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = self->_recommendations;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = [v9 identifier];
          int v11 = [v10 isEqualToString:NMSRecommendationRecentMusicIdentifier];

          if (v11)
          {
            double v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isSelected"));
            uint64_t v13 = [v9 identifier];
            [v3 setObject:v12 forKeyedSubscript:v13];
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    [v16 beginBatchUpdates];
    double v14 = (void *)[v3 copy];
    [v16 setMusicRecommendationDict:v14];

    [v16 setCachedRecommendationsData:0];
    [v16 setCatalogRecommendationsLastUpdateDate:0];
    [v16 setLibraryRecommendationExpirationDate:0];
    [v16 endBatchUpdates];
    uint64_t v15 = [[NMSMutableMediaSyncInfo alloc] initWithTarget:3];
    [(NMSMutableMediaSyncInfo *)v15 synchronize];
  }
}

- (void)_removePreviousCachedRecommendationsResponses
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2228FD000, log, OS_LOG_TYPE_ERROR, "[Recommendation] Failed to remove data from disk at url: %@ due to read error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_scheduleNextLibraryRecommendationReloadIfNecessary
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsContentsUpdate)
  {
    [(NMSMusicRecommendationManager *)self _invalidateLibraryRecommendationExpirationTimer];
    int v3 = +[NMSyncDefaults sharedDefaults];
    uint64_t v4 = [v3 libraryRecommendationExpirationDate];

    __int16 v5 = [MEMORY[0x263EFF910] date];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    uint64_t v8 = NMLogForCategory(5);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 <= 0.0)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        long long v18 = v4;
        _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Reload) Skipped scheduling library reload with expiration date: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412546;
        long long v18 = v4;
        __int16 v19 = 2048;
        double v20 = v7;
        _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Reload) Scheduling library expiration timer with date: %@ (in %f seconds)", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      uint64_t v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
      libraryRecommendationExpirationTimer = self->_libraryRecommendationExpirationTimer;
      self->_libraryRecommendationExpirationTimer = v10;

      double v12 = self->_libraryRecommendationExpirationTimer;
      dispatch_time_t v13 = dispatch_walltime(0, (uint64_t)(v7 * 1000000000.0));
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0xDF8475800uLL);
      double v14 = self->_libraryRecommendationExpirationTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __84__NMSMusicRecommendationManager__scheduleNextLibraryRecommendationReloadIfNecessary__block_invoke;
      handler[3] = &unk_264633A58;
      objc_copyWeak(&v16, (id *)buf);
      dispatch_source_set_event_handler(v14, handler);
      dispatch_resume((dispatch_object_t)self->_libraryRecommendationExpirationTimer);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __84__NMSMusicRecommendationManager__scheduleNextLibraryRecommendationReloadIfNecessary__block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v5 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Reload) Expiration timer fired.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _invalidateLibraryRecommendationExpirationTimer];
    [v4 _reloadRecommendationContentsIfNecessary];
  }
}

- (void)_invalidateLibraryRecommendationExpirationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  libraryRecommendationExpirationTimer = self->_libraryRecommendationExpirationTimer;
  if (libraryRecommendationExpirationTimer)
  {
    dispatch_source_cancel(libraryRecommendationExpirationTimer);
    uint64_t v4 = self->_libraryRecommendationExpirationTimer;
    self->_libraryRecommendationExpirationTimer = 0;
  }
}

- (BOOL)_isLibraryRecommendationExpired
{
  v2 = +[NMSyncDefaults sharedDefaults];
  int v3 = [v2 libraryRecommendationExpirationDate];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF910] date];
    BOOL v5 = [v3 compare:v4] == -1;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_expirationDateForUpdateDate:(id)a3 withOffsetDays:(int64_t)a4
{
  BOOL v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  double v7 = [v5 currentCalendar];
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v8 setDay:a4];
  BOOL v9 = [v7 dateByAddingComponents:v8 toDate:v6 options:2];

  return v9;
}

- (BOOL)wantsContentsUpdate
{
  return self->_wantsContentsUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCloudLibraryImportObserver, 0);
  objc_storeStrong((id *)&self->_initialRecommendationsFetchGroup, 0);
  objc_storeStrong((id *)&self->_libraryRecommendationExpirationTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_recommendations, 0);
}

- (void)_persistUpdatedRecommendationsWithResponse:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 length];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFB210], "ic_sharedAccountStore");
  BOOL v5 = objc_msgSend(v4, "ic_activeStoreAccount");
  id v6 = objc_msgSend(v5, "ic_storefront");
  int v7 = 134218242;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_fault_impl(&dword_2228FD000, a2, OS_LOG_TYPE_FAULT, "[Recommendation] Response exceeds expected size - response data length: %lu, storefront: %@", (uint8_t *)&v7, 0x16u);
}

@end