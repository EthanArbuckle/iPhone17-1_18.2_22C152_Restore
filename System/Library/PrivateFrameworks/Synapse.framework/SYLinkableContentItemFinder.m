@interface SYLinkableContentItemFinder
- (BOOL)_shouldIncludeAsLinkableUserActivity:(id)a3 bundleID:(id)a4 foregroundBundleIDs:(id)a5 excludedActivities:(id)a6;
- (FBSDisplayLayoutMonitor)_displayLayoutMonitor;
- (NSArray)_foregroundAppBundleIDs;
- (OS_dispatch_queue)_itemFinderQueue;
- (SYLinkableContentItemFinder)init;
- (SYLinkableContentItemFinderDelegate)delegate;
- (int64_t)_foregroundAppLoadRetriesRemaining;
- (void)_activityFetchingFinishedWithActivities:(id)a3 appBundleIDs:(id)a4 foregroundBundleIDs:(id)a5 completion:(id)a6;
- (void)_fetchActiveLinkableUserActivitiesExcluding:(id)a3 completion:(id)a4;
- (void)_updateForegroundAppsFromDisplayLayout:(id)a3;
- (void)dealloc;
- (void)fetchLinkableContentItemsExcludingActivities:(id)a3 completion:(id)a4;
- (void)handleRemoteCurrentActivityDidChange;
- (void)setDelegate:(id)a3;
- (void)set_foregroundAppBundleIDs:(id)a3;
- (void)set_foregroundAppLoadRetriesRemaining:(int64_t)a3;
@end

@implementation SYLinkableContentItemFinder

- (SYLinkableContentItemFinder)init
{
  v18.receiver = self;
  v18.super_class = (Class)SYLinkableContentItemFinder;
  v2 = [(SYLinkableContentItemFinder *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.linkableItemFinder", v3);
    itemFinderQueue = v2->__itemFinderQueue;
    v2->__itemFinderQueue = (OS_dispatch_queue *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SYHandleRemoteCurrentActivityChange, @"SYRemoteCurrentActivityDidChange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_initWeak(&location, v2);
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v7 = (void *)getFBSDisplayLayoutMonitorConfigurationClass_softClass;
    uint64_t v27 = getFBSDisplayLayoutMonitorConfigurationClass_softClass;
    if (!getFBSDisplayLayoutMonitorConfigurationClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke;
      v22 = &unk_1E64635F8;
      v23 = &v24;
      __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke((uint64_t)&v19);
      v7 = (void *)v25[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v24, 8);
    v9 = [v8 configurationForDefaultMainDisplayMonitor];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35__SYLinkableContentItemFinder_init__block_invoke;
    v15[3] = &unk_1E6463CC0;
    objc_copyWeak(&v16, &location);
    [v9 setTransitionHandler:v15];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v10 = (void *)getFBSDisplayLayoutMonitorClass_softClass;
    uint64_t v27 = getFBSDisplayLayoutMonitorClass_softClass;
    if (!getFBSDisplayLayoutMonitorClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getFBSDisplayLayoutMonitorClass_block_invoke;
      v22 = &unk_1E64635F8;
      v23 = &v24;
      __getFBSDisplayLayoutMonitorClass_block_invoke((uint64_t)&v19);
      v10 = (void *)v25[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v24, 8);
    uint64_t v12 = [v11 monitorWithConfiguration:v9];
    displayLayoutMonitor = v2->__displayLayoutMonitor;
    v2->__displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v12;

    v2->__foregroundAppLoadRetriesRemaining = 4;
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__SYLinkableContentItemFinder_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    v7 = [WeakRetained _itemFinderQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__SYLinkableContentItemFinder_init__block_invoke_2;
    v8[3] = &unk_1E64637F8;
    id v9 = v6;
    id v10 = v4;
    dispatch_async(v7, v8);
  }
}

uint64_t __35__SYLinkableContentItemFinder_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForegroundAppsFromDisplayLayout:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  v3 = os_log_create("com.apple.synapse", "LinkableItemFinder");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_INFO, "Deallocating", buf, 2u);
  }

  id v4 = [(SYLinkableContentItemFinder *)self _displayLayoutMonitor];
  [v4 invalidate];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SYRemoteCurrentActivityDidChange", 0);
  v6.receiver = self;
  v6.super_class = (Class)SYLinkableContentItemFinder;
  [(SYLinkableContentItemFinder *)&v6 dealloc];
}

- (void)fetchLinkableContentItemsExcludingActivities:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = os_log_create("com.apple.synapse", "LinkableItemFinder");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_DEFAULT, "Request to fetch linkable items started", buf, 2u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;
  uint64_t v12 = [(SYLinkableContentItemFinder *)self _itemFinderQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke;
  block[3] = &unk_1E6463D38;
  block[4] = self;
  id v16 = v7;
  uint64_t v18 = v11;
  SEL v19 = a2;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v12, block);
}

void __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_2;
  v3[3] = &unk_1E6463D10;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _fetchActiveLinkableUserActivitiesExcluding:v2 completion:v3];
}

void __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v35 = a3;
  id v31 = a4;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  double v10 = *(double *)(a1 + 48);
  uint64_t v11 = os_log_create("com.apple.synapse", "LinkableItemFinder");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v47 = [v7 count];
    __int16 v48 = 2048;
    double v49 = v9 - v10;
    _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_DEFAULT, "Request to fetch linkable items finished. Found %ld item(s). Duration %0.2fs.", buf, 0x16u);
  }

  uint64_t v12 = [v7 count];
  if (v12 != [v35 count])
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"SYLinkableContentItemFinder.m" lineNumber:132 description:@"Mismatch in number of activities and identifiers."];
  }
  uint64_t v32 = a1;
  v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v7;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v42;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * v17);
        SEL v19 = [v35 objectAtIndexedSubscript:v15 + v17];
        id v20 = objc_alloc(MEMORY[0x1E4F223C8]);
        id v40 = 0;
        v21 = (void *)[v20 initWithBundleIdentifier:v19 allowPlaceholder:1 error:&v40];
        double v22 = COERCE_DOUBLE(v40);
        if (v21)
        {
          v23 = [v21 localizedName];
          uint64_t v24 = v19;
        }
        else
        {
          uint64_t v24 = os_log_create("com.apple.synapse", "LinkableItemFinder");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v47 = (uint64_t)v19;
            __int16 v48 = 2112;
            double v49 = v22;
            _os_log_error_impl(&dword_1C2C5F000, v24, OS_LOG_TYPE_ERROR, "Error loading app record for \"%@\": %@", buf, 0x16u);
          }
          v23 = v19;
        }

        v25 = [[SYContentItem alloc] initWithUserActivity:v18 sourceAppID:v19 sourceAppName:v23 identifier:0];
        [v34 addObject:v25];

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      v15 += v17;
    }
    while (v14);
  }

  uint64_t v26 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_15;
  block[3] = &unk_1E6463CE8;
  id v27 = *(id *)(v32 + 40);
  id v37 = v34;
  id v38 = v31;
  id v39 = v27;
  id v28 = v31;
  id v29 = v34;
  dispatch_async(v26, block);
}

uint64_t __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_15(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_fetchActiveLinkableUserActivitiesExcluding:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SYLinkableContentItemFinder.m", 169, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  double v9 = [(SYLinkableContentItemFinder *)self _currentForegroundAppBundleIDs];
  if (v9)
  {
    double v10 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      uint64_t v11 = "Allowing activities from foreground apps only: %@";
      uint64_t v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 12;
LABEL_6:
      _os_log_impl(&dword_1C2C5F000, v12, v13, v11, (uint8_t *)&buf, v14);
    }
  }
  else
  {
    if ([(SYLinkableContentItemFinder *)self _foregroundAppLoadRetriesRemaining] >= 1)
    {
      dispatch_time_t v21 = dispatch_time(0, 50000000);
      double v22 = [(SYLinkableContentItemFinder *)self _itemFinderQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke;
      block[3] = &unk_1E6463740;
      void block[4] = self;
      id v30 = v7;
      id v31 = v8;
      id v23 = v7;
      dispatch_after(v21, v22, block);

      [(SYLinkableContentItemFinder *)self set_foregroundAppLoadRetriesRemaining:[(SYLinkableContentItemFinder *)self _foregroundAppLoadRetriesRemaining]- 1];
      goto LABEL_16;
    }
    double v10 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      uint64_t v11 = "Could not load foreground apps, allowing activities from all.";
      uint64_t v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 2;
      goto LABEL_6;
    }
  }

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  uint64_t v15 = (void *)getUAUserActivityProxyClass_softClass;
  uint64_t v35 = getUAUserActivityProxyClass_softClass;
  if (!getUAUserActivityProxyClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v37 = __getUAUserActivityProxyClass_block_invoke;
    id v38 = &unk_1E64635F8;
    id v39 = &v32;
    __getUAUserActivityProxyClass_block_invoke((uint64_t)&buf);
    uint64_t v15 = (void *)v33[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v32, 8);
  objc_opt_class();
  uint64_t v17 = (void *)MEMORY[0x1E4F22488];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_24;
  v25[3] = &unk_1E6463D88;
  id v18 = v8;
  id v28 = v18;
  v25[4] = self;
  id v26 = v9;
  id v27 = v7;
  id v19 = v7;
  if (([v17 _currentUserActivityProxiesWithOptions:0 matching:0 completionHandler:v25] & 1) == 0)
  {
    id v20 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SYLinkableContentItemFinder _fetchActiveLinkableUserActivitiesExcluding:completion:](v20);
    }

    (*((void (**)(id, void, void, void))v18 + 2))(v18, 0, 0, 0);
  }

LABEL_16:
}

uint64_t __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchActiveLinkableUserActivitiesExcluding:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v25 = v6;
  id v26 = v5;
  if (!v5 || v6)
  {
    uint64_t v24 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_24_cold_1((uint64_t)v25, v24);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          os_log_type_t v13 = objc_msgSend(v12, "uuid", v25);
          uint64_t v14 = [v12 bundleIdentifier];
          uint64_t v15 = (void *)v14;
          if (v13) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {
            uint64_t v17 = os_log_create("com.apple.synapse", "LinkableItemFinder");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v13;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v15;
              _os_log_impl(&dword_1C2C5F000, v17, OS_LOG_TYPE_DEFAULT, "Could not load activity %@ from %@. Proxy returned nil.", buf, 0x16u);
            }
          }
          else
          {
            [v28 addObject:v13];
            [v7 setObject:v15 forKeyedSubscript:v13];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v9);
    }

    if ([v28 count])
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v47 = 0;
      uint64_t v47 = [v28 count];
      id v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(*(void *)&buf[8] + 24)];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v28;
      uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v38 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * j);
            id v23 = (void *)MEMORY[0x1E4F22488];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_26;
            v29[3] = &unk_1E6463D60;
            v29[4] = *(void *)(a1 + 32);
            id v30 = v7;
            uint64_t v31 = v22;
            id v32 = *(id *)(a1 + 40);
            id v33 = *(id *)(a1 + 48);
            id v34 = v18;
            v36 = buf;
            id v35 = *(id *)(a1 + 56);
            [v23 _fetchUserActivityWithUUID:v22 completionHandler:v29];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v19);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v5)
  {
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
    if ([*(id *)(a1 + 32) _shouldIncludeAsLinkableUserActivity:v5 bundleID:v8 foregroundBundleIDs:*(void *)(a1 + 56) excludedActivities:*(void *)(a1 + 64)])objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v5, *(void *)(a1 + 48)); {
  }
    }
  else
  {
    id v8 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_26_cold_1(a1, (uint64_t)v6, v8);
    }
  }

  if (!--*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    [*(id *)(a1 + 32) _activityFetchingFinishedWithActivities:*(void *)(a1 + 72) appBundleIDs:*(void *)(a1 + 40) foregroundBundleIDs:*(void *)(a1 + 56) completion:*(void *)(a1 + 80)];
  }
  objc_sync_exit(v7);
}

- (BOOL)_shouldIncludeAsLinkableUserActivity:(id)a3 bundleID:(id)a4 foregroundBundleIDs:(id)a5 excludedActivities:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  if (SYIsLinkableUserActivity(v8))
  {
    if (![v10 count])
    {
      BOOL v16 = 1;
      goto LABEL_16;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    os_log_t v11 = (os_log_t)v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v12)
    {
      BOOL v16 = 1;
      goto LABEL_15;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v11);
      }
      if (SYEquivalentUserActivities(v8, *(void **)(*((void *)&v18 + 1) + 8 * v15))) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v16 = 1;
        if (v13) {
          goto LABEL_5;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
    os_log_t v11 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "Ignoring user activity from %@. No usable identifier.", buf, 0xCu);
    }
  }
  BOOL v16 = 0;
LABEL_15:

LABEL_16:
  return v16;
}

- (void)_activityFetchingFinishedWithActivities:(id)a3 appBundleIDs:(id)a4 foregroundBundleIDs:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *, void *, void))a6;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  if (v11)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    long long v34 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v24 = v12;
      long long v18 = v10;
      uint64_t v19 = *(void *)v35;
      do
      {
        long long v20 = v15;
        for (uint64_t i = 0; i != v17; ++i)
        {
          uint64_t v22 = v9;
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v20);
          }
          uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke;
          v29[3] = &unk_1E6463DB0;
          id v30 = v18;
          uint64_t v31 = v23;
          id v32 = v13;
          id v33 = v14;
          id v9 = v22;
          [v22 enumerateKeysAndObjectsUsingBlock:v29];
        }
        id v15 = v20;
        uint64_t v17 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v17);
      id v10 = v18;
      uint64_t v12 = v24;
    }
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke_2;
    v25[3] = &unk_1E6463DD8;
    id v26 = v10;
    id v27 = v13;
    id v28 = v14;
    [v9 enumerateKeysAndObjectsUsingBlock:v25];

    id v15 = v26;
  }

  v12[2](v12, v13, v14, 0);
}

void __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if ([v5 isEqualToString:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 48) addObject:v6];
    [*(id *)(a1 + 56) addObject:v5];
  }
}

void __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [a1[4] objectForKeyedSubscript:a2];
  if (v5)
  {
    [a1[5] addObject:v6];
    [a1[6] addObject:v5];
  }
}

- (void)_updateForegroundAppsFromDisplayLayout:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(v4, "elements", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 isUIApplicationElement])
        {
          uint64_t v12 = [v11 bundleIdentifier];

          if (v12)
          {
            uint64_t v13 = [v11 bundleIdentifier];
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [(SYLinkableContentItemFinder *)self _foregroundAppBundleIDs];
  [(SYLinkableContentItemFinder *)self set_foregroundAppBundleIDs:v5];
  if (!v14)
  {
    if ([(SYLinkableContentItemFinder *)self _foregroundAppLoadRetriesRemaining]) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (([v5 isEqualToArray:v14] & 1) == 0)
  {
LABEL_13:
    id v15 = [(SYLinkableContentItemFinder *)self delegate];
    [v15 linkableItemFinderItemsMightHaveChanged:self];
  }
LABEL_14:
}

- (void)handleRemoteCurrentActivityDidChange
{
  v3 = [(SYLinkableContentItemFinder *)self _itemFinderQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SYLinkableContentItemFinder_handleRemoteCurrentActivityDidChange__block_invoke;
  block[3] = &unk_1E6463AB0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __67__SYLinkableContentItemFinder_handleRemoteCurrentActivityDidChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 linkableItemFinderItemsMightHaveChanged:*(void *)(a1 + 32)];
}

- (SYLinkableContentItemFinderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYLinkableContentItemFinderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBSDisplayLayoutMonitor)_displayLayoutMonitor
{
  return self->__displayLayoutMonitor;
}

- (NSArray)_foregroundAppBundleIDs
{
  return self->__foregroundAppBundleIDs;
}

- (void)set_foregroundAppBundleIDs:(id)a3
{
}

- (int64_t)_foregroundAppLoadRetriesRemaining
{
  return self->__foregroundAppLoadRetriesRemaining;
}

- (void)set_foregroundAppLoadRetriesRemaining:(int64_t)a3
{
  self->__foregroundAppLoadRetriesRemaining = a3;
}

- (OS_dispatch_queue)_itemFinderQueue
{
  return self->__itemFinderQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__itemFinderQueue, 0);
  objc_storeStrong((id *)&self->__foregroundAppBundleIDs, 0);
  objc_storeStrong((id *)&self->__displayLayoutMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_fetchActiveLinkableUserActivitiesExcluding:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Failed to start request for current user activities.", v1, 2u);
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Request for current user activities failed: %@", (uint8_t *)&v2, 0xCu);
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_26_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Error fetching user activity %@: %@", (uint8_t *)&v4, 0x16u);
}

@end