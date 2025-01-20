@interface WLKNotificationsImpl
@end

@implementation WLKNotificationsImpl

void __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_initWeak(&location, WeakRetained);
  v5 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Fetch topics", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_45;
  v7[3] = &unk_1E620BA28;
  objc_copyWeak(&v14, &location);
  long long v13 = *(_OWORD *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v9 = WeakRetained;
  id v6 = v3;
  id v10 = v6;
  id v11 = *(id *)(a1 + 40);
  WLKFetchNotificationCategories(v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __45__WLKNotificationsImpl_iOS__initializeTopics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = &stru_1F13BCF18;
    if (v6) {
      id v8 = v6;
    }
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - fetch topics complete. %@", (uint8_t *)&v10, 0xCu);
  }

  if (!v6)
  {
    id v9 = [*(id *)(a1 + 32) _notificationCenter];
    [v9 setNotificationTopics:v5 withCompletionHandler:&__block_literal_global_41];
  }
}

void __47__WLKNotificationsImpl_iOS__notificationCenter__block_invoke(uint64_t a1)
{
  if (WLKIsDaemon())
  {
    id v2 = objc_alloc(MEMORY[0x1E4F44680]);
    id v3 = WLKTVAppBundleID();
    uint64_t v4 = [v2 initWithBundleIdentifier:v3];
    id v5 = (void *)_notificationCenter__center_0;
    _notificationCenter__center_0 = v4;

    [(id)_notificationCenter__center_0 setWantsNotificationResponsesDelivered];
    [(id)_notificationCenter__center_0 setPrivateDelegate:*(void *)(a1 + 32)];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = +[WLKReachabilityMonitor sharedInstance];
    [v6 addObserver:v7 selector:sel__networkReachabilityDidChangeNotification_ name:@"WLKReachabilityMonitorReachabilityDidChange" object:v8];

    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = +[WLKAccountMonitor sharedInstance];
    [v6 addObserver:v9 selector:sel__accountChangedNotification_ name:@"WLKAccountMonitorAccountDidChange" object:v10];

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = +[WLKAccountMonitor sharedInstance];
    [v6 addObserver:v11 selector:sel__storeFrontChangedNotification_ name:@"WLKAccountMontiorStoreFrontDidChange" object:v12];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    id v6 = (void *)_notificationCenter__center_0;
    _notificationCenter__center_0 = v13;
  }

  [(id)_notificationCenter__center_0 setDelegate:*(void *)(a1 + 32)];
  id v14 = [MEMORY[0x1E4F44600] categoryWithIdentifier:@"com.apple.tv-default" actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:1];
  v15 = (void *)_notificationCenter__center_0;
  v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v14, 0);
  [v15 setNotificationCategories:v16];

  v17 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Center setup", buf, 2u);
  }
}

void __52__WLKNotificationsImpl_iOS_post_title_body_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = &stru_1F13BCF18;
    if (v2) {
      uint64_t v4 = v2;
    }
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Add notification request complete. %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __52__WLKNotificationsImpl_iOS_getNotificationSettings___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__WLKNotificationsImpl_iOS__initializeTopics__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = &stru_1F13BCF18;
    if (v2) {
      uint64_t v4 = v2;
    }
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Set topics complete. %@", (uint8_t *)&v5, 0xCu);
  }
}

void __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_loadWeakRetained((id *)(a1 + 88));
  objc_sync_enter(v7);
  if (([v7 topicsAreInitialized] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    [v7 setNotificationTopics:v8];
  }
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  int v10 = [v9 objectForKey:@"WLKBulletinDataProviderLastRegisteredSections"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    uint64_t v12 = [v11 allObjects];

    int v10 = (void *)v12;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    uint64_t v13 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Notification categories fetch from bag resulted in error %@:", (uint8_t *)&buf, 0xCu);
    }

    [v7 setTopicsAreInitialized:0];
    if (v10)
    {
      v15 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1BA2E8000, v15, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Falling-back to last-known categories %@:", (uint8_t *)&buf, 0xCu);
      }

      [*(id *)(a1 + 32) addObjectsFromArray:v10];
    }
    [v9 setObject:*(void *)(a1 + 32) forKey:@"WLKBulletinDataProviderLastRegisteredSections"];
    uint64_t v17 = *(void *)(a1 + 64);
    v18 = [*(id *)(a1 + 40) notificationTopics];
    (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
  else
  {
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v19)
    {
      [*(id *)(a1 + 32) addObject:@"com.apple.tv.bulletins.explicit"];
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    if ((v19 & 2) != 0)
    {
      [*(id *)(a1 + 32) addObject:@"com.apple.tv.bulletins.implicit"];
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    if ((v19 & 4) != 0) {
      [*(id *)(a1 + 32) addObject:@"com.apple.tv.bulletins.marketing"];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    objc_initWeak(&location, v7);
    v20 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_49;
    v23[3] = &unk_1E620BA00;
    objc_copyWeak(&v32, &location);
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 80);
    id v24 = v21;
    uint64_t v30 = v22;
    id v25 = v10;
    id v26 = *(id *)(a1 + 48);
    p_long long buf = &buf;
    id v27 = *(id *)(a1 + 56);
    id v28 = v9;
    id v29 = *(id *)(a1 + 64);
    [v20 isFullTVAppEnabledwithCompletion:v23];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }

  objc_sync_exit(v7);
}

void __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_49(uint64_t a1, int a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v33 = objc_loadWeakRetained((id *)(a1 + 96));
  objc_sync_enter(v33);
  if ([*(id *)(a1 + 32) count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a2 == 0;
  }
  if (!v4)
  {
    int v5 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v39 = v6;
      __int16 v40 = 1024;
      LODWORD(v41) = 1;
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Falling-back to last-known categories as we might have gotten a 304%@, and is tvappenabled%d", buf, 0x12u);
    }

    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 40)];
  }
  id v7 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v39 = v8;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - SubsectionInfos: %@", buf, 0xCu);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v35;
    *(void *)&long long v10 = 134218242;
    long long v31 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v13, v31);
        uint64_t v15 = [v33 _authOptions];
        if (v14)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
          uint64_t v16 = [v14 soundSetting];
          uint64_t v17 = [v14 alertSetting];
          uint64_t v18 = [v14 badgeSetting];
          uint64_t v19 = WLKPushNotificationsLogObject();
          uint64_t v20 = v17 | v16 | v18;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v31;
            uint64_t v39 = v20;
            __int16 v40 = 2112;
            uint64_t v41 = v13;
            _os_log_impl(&dword_1BA2E8000, v19, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Overriding auth options from user's settings to:%lu for %@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v20 = v15;
        }
        id v21 = (void *)MEMORY[0x1E4F44650];
        uint64_t v22 = [v33 _displayNameForSubsectionID:v13];
        v23 = [v21 topicRequestWithIdentifier:v13 displayName:v22 options:v20];

        [*(id *)(a1 + 56) addObject:v23];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v9);
  }

  id v24 = [v33 notificationTopics];
  uint64_t v25 = [v24 count];
  if (v25 == [*(id *)(a1 + 56) count])
  {
    BOOL v26 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) == 0;

    if (v26)
    {
      id v27 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1BA2E8000, v27, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Previous topics being returned", buf, 2u);
      }
      goto LABEL_30;
    }
  }
  else
  {
  }
  id v28 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BA2E8000, v28, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Topics successfully initialized", buf, 2u);
  }

  id v27 = [*(id *)(a1 + 56) mutableCopy];
  [v33 setNotificationTopics:v27];
LABEL_30:

  [v33 setTopicsAreInitialized:1];
  [*(id *)(a1 + 64) setObject:*(void *)(a1 + 32) forKey:@"WLKBulletinDataProviderLastRegisteredSections"];
  uint64_t v29 = *(void *)(a1 + 72);
  uint64_t v30 = [v33 notificationTopics];
  (*(void (**)(uint64_t, void *, void))(v29 + 16))(v29, v30, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));

  objc_sync_exit(v33);
}

uint64_t __56__WLKNotificationsImpl_iOS__accountChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeTopics];
}

uint64_t __59__WLKNotificationsImpl_iOS__storeFrontChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeTopics];
}

void __104__WLKNotificationsImpl_iOS_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"Failure";
    if (a2) {
      id v7 = @"Success";
    }
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - AMS did handle %@ Error:%@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end