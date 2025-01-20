@interface NMSPodcastsDownloadableContentProvider
- (BOOL)_changeContainsRelevantChannelChanges:(id)a3;
- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3;
- (BOOL)_changeContainsRelevantShowChanges:(id)a3;
- (BOOL)_changeContainsRelevantStationChanges:(id)a3;
- (BOOL)_shouldMergeHistoryTransaction:(id)a3;
- (NMSDownloadableContentProviderDelegate)delegate;
- (NMSPodcastsDownloadableContentProvider)init;
- (NSPersistentHistoryToken)lastMergedToken;
- (id)_ctx;
- (id)_relevantChannelProperties;
- (id)createItemEnumerator;
- (void)_handlePersistentStoreRemoteChangeNotification:(id)a3;
- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3;
- (void)_notifyDelegateContentDidChange;
- (void)_notifyDelegateContentDidChangeImmediately;
- (void)_processLatestPersistenHistoryChanges;
- (void)_resetPersistentHistoryTokenAndNotifyObservers;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)extensionAccessDidChange;
- (void)setDelegate:(id)a3;
- (void)setLastMergedToken:(id)a3;
@end

@implementation NMSPodcastsDownloadableContentProvider

- (NMSPodcastsDownloadableContentProvider)init
{
  v22.receiver = self;
  v22.super_class = (Class)NMSPodcastsDownloadableContentProvider;
  id v2 = [(NMSPodcastsDownloadableContentProvider *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NMSPodcastsDownloadableContentProvider.mergeQueue", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NMSPodcastsDownloadableContentProvider.notificationQueue", v6);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    objc_initWeak(&location, v2);
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF83B0], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v10 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v9;

    v11 = *((void *)v2 + 3);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __46__NMSPodcastsDownloadableContentProvider_init__block_invoke;
    handler[3] = &unk_264633A58;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    v12 = *((void *)v2 + 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__NMSPodcastsDownloadableContentProvider_init__block_invoke_2;
    block[3] = &unk_264633A58;
    objc_copyWeak(&v18, &location);
    dispatch_async(v12, block);
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel__handlePersistentStoreRemoteChangeNotification_ name:*MEMORY[0x263EFF0F8] object:0];
    [v13 addObserver:v2 selector:sel__handlePodcastsPinningSelectionsDidChangeNotification_ name:@"com.apple.nanomusicsync.podcasts-pinning-selections" object:0];
    v14 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v14 addObserver:v2];

    v15 = [MEMORY[0x263F89110] sharedMonitor];
    [v15 registerObserver:v2];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return (NMSPodcastsDownloadableContentProvider *)v2;
}

void __46__NMSPodcastsDownloadableContentProvider_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processLatestPersistenHistoryChanges];
}

void __46__NMSPodcastsDownloadableContentProvider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained lastMergedToken];

    id WeakRetained = v3;
    if (!v2)
    {
      [v3 _resetPersistentHistoryTokenAndNotifyObservers];
      id WeakRetained = v3;
    }
  }
}

- (id)createItemEnumerator
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F5E9D8] sharedInstance];
  char v3 = [v2 isReady];

  if (v3)
  {
    dispatch_queue_t v4 = [MEMORY[0x263F89110] sharedMonitor];
    uint64_t v5 = [v4 isCharging] ^ 1;

    v6 = +[NMSyncDefaults sharedDefaults];
    dispatch_queue_t v7 = [MEMORY[0x263F5E9D0] sharedInstance];
    v8 = [v7 mainOrPrivateContext];

    dispatch_source_t v9 = [MEMORY[0x263EFF980] array];
    v10 = [NMSPodcastsDownloadSettings alloc];
    v11 = [v6 objectForKey:@"PodcastsSavedEpisodesDownloadSettings"];
    v12 = [(NMSPodcastsDownloadSettings *)v10 initWithCollectionType:1 dictionary:v11];

    v13 = NMLogForCategory(5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v12;
      _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Saved Episodes %{public}@", buf, 0xCu);
    }

    if ([(NMSPodcastsDownloadSettings *)v12 isEnabled])
    {
      v14 = [NMSEpisodeFetchRequestItemEnumerator alloc];
      v15 = +[NMSPodcastsFetchRequests fetchRequestForSavedEpisodesDownloadSettings:v12 downloadedOnly:v5];
      v16 = [(NMSEpisodeFetchRequestItemEnumerator *)v14 initWithFetchRequest:v15 ctx:v8];

      [v9 addObject:v16];
    }
    v17 = [v6 objectForKey:@"PodcastsStationDownloadSettings"];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke;
    v46[3] = &unk_264634B28;
    char v49 = v5;
    id v18 = v8;
    id v47 = v18;
    id v19 = v9;
    id v48 = v19;
    [v17 enumerateKeysAndObjectsUsingBlock:v46];
    id v20 = [MEMORY[0x263EFF980] array];
    v21 = [v6 objectForKey:@"PodcastsShowDownloadSettings"];
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke_20;
    v42 = &unk_264634B28;
    char v45 = v5;
    id v22 = v18;
    id v43 = v22;
    id v23 = v20;
    id v44 = v23;
    [v21 enumerateKeysAndObjectsUsingBlock:&v39];
    if (objc_msgSend(v23, "count", v39, v40, v41, v42))
    {
      v24 = [NMSAlternatingItemEnumerator alloc];
      v25 = (void *)[v23 copy];
      v26 = [(NMSAlternatingItemEnumerator *)v24 initWithItemEnumerators:v25];

      [v19 addObject:v26];
    }
    v27 = [NMSPodcastsDownloadSettings alloc];
    v28 = [v6 objectForKey:@"PodcastsUpNextDownloadSettings"];
    v29 = [(NMSPodcastsDownloadSettings *)v27 initWithCollectionType:0 dictionary:v28];

    v30 = NMLogForCategory(5);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v29;
      _os_log_impl(&dword_2228FD000, v30, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Up Next %{public}@", buf, 0xCu);
    }

    if ([(NMSPodcastsDownloadSettings *)v29 isEnabled])
    {
      v31 = [NMSEpisodeFetchRequestItemEnumerator alloc];
      v32 = +[NMSPodcastsFetchRequests fetchRequestForUpNextDownloadSettings:v29 downloadedOnly:v5];
      v33 = [(NMSEpisodeFetchRequestItemEnumerator *)v31 initWithFetchRequest:v32 ctx:v22];

      [v19 addObject:v33];
    }
    v34 = [NMSSequentialItemEnumerator alloc];
    v35 = (void *)[v19 copy];
    v36 = [(NMSSequentialItemEnumerator *)v34 initWithItemEnumerators:v35];
  }
  else
  {
    v37 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v37, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider cannot open Podcasts DB. Returning nil item enumerator.", buf, 2u);
    }

    v6 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v6 attemptToFix];
    v36 = 0;
  }

  return v36;
}

void __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:2 dictionary:v6];

  if ([(NMSPodcastsDownloadSettings *)v7 isEnabled])
  {
    v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v5;
      __int16 v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Station %{public}@ - %{public}@", (uint8_t *)&v12, 0x16u);
    }

    dispatch_source_t v9 = [NMSEpisodeFetchRequestItemEnumerator alloc];
    v10 = +[NMSPodcastsFetchRequests fetchRequestForStationUUID:v5 downloadSettings:v7 downloadedOnly:*(unsigned __int8 *)(a1 + 48)];
    v11 = [(NMSEpisodeFetchRequestItemEnumerator *)v9 initWithFetchRequest:v10 ctx:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) addObject:v11];
  }
}

void __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:3 dictionary:v6];

  if ([(NMSPodcastsDownloadSettings *)v7 isEnabled])
  {
    v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v5;
      __int16 v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Show %{public}@ - %{public}@", (uint8_t *)&v12, 0x16u);
    }

    dispatch_source_t v9 = [NMSEpisodeFetchRequestItemEnumerator alloc];
    v10 = +[NMSPodcastsFetchRequests fetchRequestForFeedURL:v5 downloadSettings:v7 downloadedOnly:*(unsigned __int8 *)(a1 + 48) ctx:*(void *)(a1 + 32)];
    v11 = [(NMSEpisodeFetchRequestItemEnumerator *)v9 initWithFetchRequest:v10 ctx:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) addObject:v11];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NMSPodcastsDownloadableContentProvider_setDelegate___block_invoke;
  block[3] = &unk_264633A80;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__NMSPodcastsDownloadableContentProvider_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v3 = WeakRetained;
    objc_storeWeak(WeakRetained + 6, *(id *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (NMSDownloadableContentProviderDelegate)delegate
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__NMSPodcastsDownloadableContentProvider_delegate__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSDownloadableContentProviderDelegate *)v3;
}

uint64_t __50__NMSPodcastsDownloadableContentProvider_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (void)extensionAccessDidChange
{
  uint64_t v3 = [MEMORY[0x263F5E9D8] sharedInstance];
  int v4 = [v3 isReady];

  if (v4)
  {
    id v5 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider can access PodcastsDB again", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    mergeQueue = self->_mergeQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__NMSPodcastsDownloadableContentProvider_extensionAccessDidChange__block_invoke;
    block[3] = &unk_264633A58;
    objc_copyWeak(&v8, buf);
    dispatch_async(mergeQueue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __66__NMSPodcastsDownloadableContentProvider_extensionAccessDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained lastMergedToken];

    if (v2) {
      [v3 _notifyDelegateContentDidChange];
    }
    else {
      [v3 _resetPersistentHistoryTokenAndNotifyObservers];
    }
    id WeakRetained = v3;
  }
}

- (void)environmentMonitorDidChangePower:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [v4 isCharging];
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider environment monitor did change power %x", (uint8_t *)v6, 8u);
  }

  [(NMSPodcastsDownloadableContentProvider *)self _notifyDelegateContentDidChangeImmediately];
}

- (NSPersistentHistoryToken)lastMergedToken
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mergeQueue);
  lastMergedToken = self->_lastMergedToken;
  if (!lastMergedToken)
  {
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v5 = [v4 objectForKey:@"NMSPodcastsDownloadableContentObserverPersistentHistoryToken"];

    if (v5)
    {
      id v11 = 0;
      uint64_t v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
      uint64_t v7 = v11;
      if (v7)
      {
        p_super = _MTLogCategoryDatabase();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v7;
          _os_log_impl(&dword_2228FD000, p_super, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider encountered error trying to fetch previous history token %@", buf, 0xCu);
        }
      }
      else
      {
        id v9 = v6;
        p_super = &self->_lastMergedToken->super;
        self->_lastMergedToken = v9;
      }
    }
    else
    {
      uint64_t v7 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider has never processed persistent history data", buf, 2u);
      }
    }

    lastMergedToken = self->_lastMergedToken;
  }

  return lastMergedToken;
}

- (void)setLastMergedToken:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mergeQueue);
  objc_storeStrong((id *)&self->_lastMergedToken, a3);
  if (v5)
  {
    id v16 = 0;
    uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v16];
    id v7 = v16;
    id v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v15 setObject:v6 forKey:@"NMSPodcastsDownloadableContentObserverPersistentHistoryToken"];

      v10 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v5;
        id v11 = "NMSPodcastsDownloadableContentProvider set last processed persistent history token %@";
        int v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        goto LABEL_13;
      }
    }
    else
    {
      v10 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        id v11 = "NMSPodcastsDownloadableContentProvider encountered error archiving last persistent history token %@";
        int v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
        _os_log_impl(&dword_2228FD000, v12, v13, v11, buf, 0xCu);
      }
    }

    goto LABEL_15;
  }
  uint64_t v14 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider set last processed persistent history token to nil. Removing default.", buf, 2u);
  }

  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v8 removeObjectForKey:@"NMSPodcastsDownloadableContentObserverPersistentHistoryToken"];
LABEL_15:
}

- (id)_ctx
{
  id v2 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v3 = [v2 privateQueueContext];

  return v3;
}

- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 changedObjectID];
  id v5 = [v4 entity];
  uint64_t v6 = [v5 name];

  if ([v6 isEqualToString:*MEMORY[0x263F5EBA0]])
  {
    if (([v3 changeType] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = objc_msgSend(v3, "updatedProperties", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            int v12 = [MEMORY[0x263F5E9E0] propertiesToObserveForDownloadableEpisodes];
            os_log_type_t v13 = [v11 name];
            char v14 = [v12 containsObject:v13];

            if (v14)
            {
              LOBYTE(v8) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_changeContainsRelevantShowChanges:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 changedObjectID];
  id v5 = [v4 entity];
  uint64_t v6 = [v5 name];

  if ([v6 isEqualToString:*MEMORY[0x263F5EBB0]])
  {
    if (([v3 changeType] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = objc_msgSend(v3, "updatedProperties", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            int v12 = [MEMORY[0x263F5EA08] propertiesToObserveForDownloadableEpisodes];
            os_log_type_t v13 = [v11 name];
            char v14 = [v12 containsObject:v13];

            if (v14)
            {
              LOBYTE(v8) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_changeContainsRelevantStationChanges:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 changedObjectID];
  id v5 = [v4 entity];
  uint64_t v6 = [v5 name];

  if ([v6 isEqualToString:*MEMORY[0x263F5EBA8]])
  {
    if (([v3 changeType] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = objc_msgSend(v3, "updatedProperties", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            int v12 = [MEMORY[0x263F5EA00] propertiesToObserveForDownloadableEpisodes];
            os_log_type_t v13 = [v11 name];
            char v14 = [v12 containsObject:v13];

            if (v14)
            {
              LOBYTE(v8) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_relevantChannelProperties
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = *MEMORY[0x263F5EA60];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)_changeContainsRelevantChannelChanges:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 changedObjectID];
  uint64_t v6 = [v5 entity];
  id v7 = [v6 name];

  if ([v7 isEqualToString:*MEMORY[0x263F5EB98]])
  {
    if (([v4 changeType] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v8 = objc_msgSend(v4, "updatedProperties", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            os_log_type_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            char v14 = [(NMSPodcastsDownloadableContentProvider *)self _relevantChannelProperties];
            v15 = [v13 name];
            char v16 = [v14 containsObject:v15];

            if (v16)
            {
              BOOL v17 = 1;
              goto LABEL_14;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      BOOL v17 = 0;
LABEL_14:
    }
    else
    {
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldMergeHistoryTransaction:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(a3, "changes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(NMSPodcastsDownloadableContentProvider *)self _changeContainsRelevantEpisodeChanges:v9]|| [(NMSPodcastsDownloadableContentProvider *)self _changeContainsRelevantShowChanges:v9]|| [(NMSPodcastsDownloadableContentProvider *)self _changeContainsRelevantStationChanges:v9]|| [(NMSPodcastsDownloadableContentProvider *)self _changeContainsRelevantChannelChanges:v9])
        {
          BOOL v10 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)_notifyDelegateContentDidChange
{
  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke;
  v4[3] = &unk_264633A58;
  objc_copyWeak(&v5, &location);
  dispatch_async(notificationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 32))
    {
      id v4 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider delegate notification pending.", buf, 2u);
      }
    }
    else
    {
      *((unsigned char *)WeakRetained + 32) = 1;
      dispatch_time_t v5 = dispatch_time(0, 8000000000);
      uint64_t v6 = v3[2];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke_32;
      block[3] = &unk_264633A58;
      objc_copyWeak(&v8, v1);
      dispatch_after(v5, v6, block);
      objc_destroyWeak(&v8);
    }
  }
}

void __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke_32(uint64_t a1)
{
  id v2 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider scheduling delegate notification for 8s from now.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateContentDidChangeImmediately];
}

- (void)_notifyDelegateContentDidChangeImmediately
{
  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __84__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChangeImmediately__block_invoke;
  v4[3] = &unk_264633A58;
  objc_copyWeak(&v5, &location);
  dispatch_async(notificationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __84__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChangeImmediately__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 32) = 0;
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 6);
    [v2 downloadableContentProviderDidChangeContent:v3];

    id WeakRetained = v3;
  }
}

- (void)_handlePersistentStoreRemoteChangeNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 name];
    uint64_t v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFF098]];
    int v16 = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    long long v19 = v8;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_INFO, "NMSPodcastsDownloadableContentProvider received %@ with token %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x263F5E9D8] sharedInstance];
  char v10 = [v9 isReady];

  if (v10)
  {
    uint64_t v11 = [v4 object];
    long long v12 = [(NMSPodcastsDownloadableContentProvider *)self _ctx];
    long long v13 = [v12 persistentStoreCoordinator];

    if (v11 == v13) {
      dispatch_source_merge_data((dispatch_source_t)self->_persistentHistorySource, 1uLL);
    }
  }
  else
  {
    long long v14 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider cannot open Podcasts DB. Will not respond to notification.", (uint8_t *)&v16, 2u);
    }

    long long v15 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v15 attemptToFix];
  }
}

- (void)_processLatestPersistenHistoryChanges
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(NMSPodcastsDownloadableContentProvider *)self _ctx];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__10;
  uint64_t v39 = __Block_byref_object_dispose__10;
  id v40 = [(NMSPodcastsDownloadableContentProvider *)self lastMergedToken];
  id v4 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:v36[5]];
  [v4 setResultType:5];
  [v4 setFetchBatchSize:200];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__10;
  v33 = __Block_byref_object_dispose__10;
  id v34 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__10;
  v27[4] = __Block_byref_object_dispose__10;
  id v28 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke;
  v22[3] = &unk_264633AD0;
  v25 = v27;
  id v5 = v3;
  id v23 = v5;
  id v6 = v4;
  id v24 = v6;
  v26 = &v29;
  [v5 performBlockAndWait:v22];
  if (v30[5])
  {
    uint64_t v7 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v30[5];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider encountered error trying to fetch store result %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v9 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider clearing out persistent history token and performing a full persistent history run", (uint8_t *)&buf, 2u);
    }

    [(NMSPodcastsDownloadableContentProvider *)self setLastMergedToken:0];
    char v10 = (void *)v30[5];
    v30[5] = 0;

    uint64_t v11 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:0];

    [v11 setResultType:5];
    [v11 setFetchBatchSize:200];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_34;
    v17[3] = &unk_264633AD0;
    uint64_t v20 = v27;
    id v18 = v5;
    id v6 = v11;
    id v19 = v6;
    long long v21 = &v29;
    [v18 performBlockAndWait:v17];
    if (v30[5])
    {
      long long v12 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = v30[5];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider encountered error trying to fetch store result after setting to nil %@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_16;
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_35;
  v16[3] = &unk_264633AF8;
  v16[4] = self;
  v16[5] = v27;
  v16[6] = &buf;
  v16[7] = &v35;
  [v5 performBlockAndWait:v16];
  [(NMSPodcastsDownloadableContentProvider *)self setLastMergedToken:v36[5]];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    long long v14 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider notifying delegate", v15, 2u);
    }

    [(NMSPodcastsDownloadableContentProvider *)self _notifyDelegateContentDidChange];
  }
  _Block_object_dispose(&buf, 8);
LABEL_16:

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

void __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_34(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_35(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) result];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x223CA12B0]();
        if ([*(id *)(a1 + 32) _shouldMergeHistoryTransaction:v7])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          uint64_t v9 = _MTLogCategoryDatabase();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int v16 = 0;
            _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_INFO, "NMSPodcastsDownloadableContentProvider merging changes", v16, 2u);
          }

          char v10 = [MEMORY[0x263F5E9D0] sharedInstance];
          uint64_t v11 = [v10 coreDataContainer];
          long long v12 = [v7 objectIDNotification];
          [v11 mergeFromContextDidSaveNotification:v12];
        }
        uint64_t v13 = [v7 token];
        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
        long long v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"IsInProcessNotification"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider pinning selections did change", v8, 2u);
    }

    [(NMSPodcastsDownloadableContentProvider *)self _notifyDelegateContentDidChangeImmediately];
  }
}

- (void)_resetPersistentHistoryTokenAndNotifyObservers
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mergeQueue);
  uint64_t v3 = [MEMORY[0x263F5E9D8] sharedInstance];
  char v4 = [v3 isReady];

  if (v4)
  {
    *(void *)long long v17 = 0;
    long long v18 = v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy__10;
    long long v21 = __Block_byref_object_dispose__10;
    id v22 = 0;
    uint64_t v5 = [(NMSPodcastsDownloadableContentProvider *)self _ctx];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __88__NMSPodcastsDownloadableContentProvider__resetPersistentHistoryTokenAndNotifyObservers__block_invoke;
    uint64_t v14 = &unk_264633AA8;
    int v16 = v17;
    id v6 = v5;
    id v15 = v6;
    [v6 performBlockAndWait:&v11];
    -[NMSPodcastsDownloadableContentProvider setLastMergedToken:](self, "setLastMergedToken:", *((void *)v18 + 5), v11, v12, v13, v14);
    uint64_t v7 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *((void *)v18 + 5);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v8;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider resetting persistent history token and notifying observers. Latest token %@", buf, 0xCu);
    }

    [(NMSPodcastsDownloadableContentProvider *)self _notifyDelegateContentDidChange];
    _Block_object_dispose(v17, 8);
  }
  else
  {
    uint64_t v9 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider cannot open Podcasts DB. Will not reset persistent history.", v17, 2u);
    }

    char v10 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v10 attemptToFix];
  }
}

void __88__NMSPodcastsDownloadableContentProvider__resetPersistentHistoryTokenAndNotifyObservers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  uint64_t v2 = [v5 currentPersistentHistoryTokenFromStores:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastMergedToken, 0);
  objc_storeStrong((id *)&self->_persistentHistorySource, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_mergeQueue, 0);
}

@end