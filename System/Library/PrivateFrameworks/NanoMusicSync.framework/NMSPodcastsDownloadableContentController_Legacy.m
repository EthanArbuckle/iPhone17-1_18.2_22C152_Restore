@interface NMSPodcastsDownloadableContentController_Legacy
- (BOOL)_changeContainsRelevantChannelChanges:(id)a3;
- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3;
- (BOOL)_changeContainsRelevantShowChanges:(id)a3;
- (BOOL)_changeContainsRelevantStationChanges:(id)a3;
- (BOOL)_shouldMergeHistoryTransaction:(id)a3;
- (NMSPodcastsDownloadableContentControllerDelegate_Legacy)delegate;
- (NMSPodcastsDownloadableContentController_Legacy)init;
- (NSPersistentHistoryToken)lastMergedToken;
- (id)_ctx;
- (id)_relevantChannelProperties;
- (id)_relevantEpisodeProperties;
- (id)_relevantShowProperties;
- (id)_relevantStationProperties;
- (void)_handlePersistentStoreRemoteChangeNotification:(id)a3;
- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3;
- (void)_notifyDelegateContentDidChange;
- (void)_notifyDelegateContentDidChangeImmediately;
- (void)_processLatestPersistenHistoryChanges;
- (void)_resetPersistentHistoryTokenAndNotifyObservers;
- (void)extensionAccessDidChange;
- (void)setDelegate:(id)a3;
- (void)setLastMergedToken:(id)a3;
@end

@implementation NMSPodcastsDownloadableContentController_Legacy

- (NMSPodcastsDownloadableContentController_Legacy)init
{
  v18.receiver = self;
  v18.super_class = (Class)NMSPodcastsDownloadableContentController_Legacy;
  id v2 = [(NMSPodcastsDownloadableContentController_Legacy *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NMSPodcastsDownloadableContentObserver.queue", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    objc_initWeak(&location, v2);
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF83B0], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    v8 = *((void *)v2 + 2);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __55__NMSPodcastsDownloadableContentController_Legacy_init__block_invoke;
    handler[3] = &unk_264633A58;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
    *((unsigned char *)v2 + 24) = 0;
    v9 = *((void *)v2 + 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__NMSPodcastsDownloadableContentController_Legacy_init__block_invoke_2;
    block[3] = &unk_264633A58;
    objc_copyWeak(&v14, &location);
    dispatch_async(v9, block);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel__handlePersistentStoreRemoteChangeNotification_ name:*MEMORY[0x263EFF0F8] object:0];
    [v10 addObserver:v2 selector:sel__handlePodcastsPinningSelectionsDidChangeNotification_ name:@"com.apple.nanomusicsync.podcasts-pinning-selections" object:0];
    v11 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v11 addObserver:v2];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (NMSPodcastsDownloadableContentController_Legacy *)v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NMSPodcastsDownloadableContentController_Legacy_setDelegate___block_invoke;
  block[3] = &unk_264633A80;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NMSPodcastsDownloadableContentControllerDelegate_Legacy)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__NMSPodcastsDownloadableContentController_Legacy_delegate__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSPodcastsDownloadableContentControllerDelegate_Legacy *)v3;
}

- (void)extensionAccessDidChange
{
  id v3 = [MEMORY[0x263F5E9D8] sharedInstance];
  int v4 = [v3 isReady];

  if (v4)
  {
    v5 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver can access PodcastsDB again", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__NMSPodcastsDownloadableContentController_Legacy_extensionAccessDidChange__block_invoke;
    block[3] = &unk_264633A58;
    objc_copyWeak(&v8, buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (NSPersistentHistoryToken)lastMergedToken
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lastMergedToken = self->_lastMergedToken;
  if (!lastMergedToken)
  {
    int v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v5 = [v4 objectForKey:@"NMSPodcastsDownloadableContentObserverPersistentHistoryToken"];

    if (v5)
    {
      id v11 = 0;
      uint64_t v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
      v7 = v11;
      if (v7)
      {
        p_super = _MTLogCategoryDatabase();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v7;
          _os_log_impl(&dword_2228FD000, p_super, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver encountered error trying to fetch previous history token %@", buf, 0xCu);
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
      v7 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver has never processed persistent history data", buf, 2u);
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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
        id v11 = "NMSPodcastsDownloadableContentObserver set last processed persistent history token %@";
        v12 = v10;
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
        id v11 = "NMSPodcastsDownloadableContentObserver encountered error archiving last persistent history token %@";
        v12 = v10;
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
    _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver set last processed persistent history token to nil. Removing default.", buf, 2u);
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

- (id)_relevantEpisodeProperties
{
  v12[13] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F5EB40];
  v12[0] = *MEMORY[0x263F5EB78];
  v12[1] = v3;
  uint64_t v4 = *MEMORY[0x263F5EAE0];
  v12[2] = *MEMORY[0x263F5EB48];
  v12[3] = v4;
  uint64_t v5 = *MEMORY[0x263F5EA88];
  v12[4] = *MEMORY[0x263F5EAC8];
  v12[5] = v5;
  uint64_t v6 = *MEMORY[0x263F5EB68];
  v12[6] = *MEMORY[0x263F5EB18];
  v12[7] = v6;
  uint64_t v7 = *MEMORY[0x263F5EAC0];
  v12[8] = *MEMORY[0x263F5EB08];
  v12[9] = v7;
  uint64_t v8 = *MEMORY[0x263F5EAB8];
  v12[10] = *MEMORY[0x263F5EB50];
  v12[11] = v8;
  v12[12] = *MEMORY[0x263F5EAF8];
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:13];
  v10 = [v2 setWithArray:v9];

  return v10;
}

- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 changedObjectID];
  uint64_t v6 = [v5 entity];
  uint64_t v7 = [v6 name];

  if ([v7 isEqualToString:*MEMORY[0x263F5EBA0]])
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
            uint64_t v14 = [(NMSPodcastsDownloadableContentController_Legacy *)self _relevantEpisodeProperties];
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

- (id)_relevantShowProperties
{
  v12[13] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F5EC98];
  v12[0] = *MEMORY[0x263F5ECA0];
  v12[1] = v3;
  uint64_t v4 = *MEMORY[0x263F5ECA8];
  v12[2] = *MEMORY[0x263F5ED00];
  v12[3] = v4;
  uint64_t v5 = *MEMORY[0x263F5EC80];
  v12[4] = *MEMORY[0x263F5ECE0];
  v12[5] = v5;
  uint64_t v6 = *MEMORY[0x263F5EC68];
  v12[6] = *MEMORY[0x263F5ECD8];
  v12[7] = v6;
  uint64_t v7 = *MEMORY[0x263F5ECF8];
  v12[8] = *MEMORY[0x263F5EC58];
  v12[9] = v7;
  uint64_t v8 = *MEMORY[0x263F5ECE8];
  v12[10] = *MEMORY[0x263F5ECF0];
  v12[11] = v8;
  v12[12] = *MEMORY[0x263F5EC88];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:13];
  uint64_t v10 = [v2 setWithArray:v9];

  return v10;
}

- (BOOL)_changeContainsRelevantShowChanges:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 changedObjectID];
  uint64_t v6 = [v5 entity];
  uint64_t v7 = [v6 name];

  if ([v7 isEqualToString:*MEMORY[0x263F5EBB0]])
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
            uint64_t v14 = [(NMSPodcastsDownloadableContentController_Legacy *)self _relevantShowProperties];
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

- (id)_relevantStationProperties
{
  v10[9] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F5EC38];
  v10[0] = *MEMORY[0x263F5EC40];
  v10[1] = v3;
  uint64_t v4 = *MEMORY[0x263F5EC08];
  v10[2] = *MEMORY[0x263F5EC10];
  v10[3] = v4;
  uint64_t v5 = *MEMORY[0x263F5EC30];
  v10[4] = *MEMORY[0x263F5EC28];
  v10[5] = v5;
  uint64_t v6 = *MEMORY[0x263F5EBF8];
  v10[6] = *MEMORY[0x263F5EC00];
  v10[7] = v6;
  v10[8] = *MEMORY[0x263F5EC18];
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:9];
  uint64_t v8 = [v2 setWithArray:v7];

  return v8;
}

- (BOOL)_changeContainsRelevantStationChanges:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 changedObjectID];
  uint64_t v6 = [v5 entity];
  uint64_t v7 = [v6 name];

  if ([v7 isEqualToString:*MEMORY[0x263F5EBA8]])
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
            uint64_t v14 = [(NMSPodcastsDownloadableContentController_Legacy *)self _relevantStationProperties];
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

- (id)_relevantChannelProperties
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = *MEMORY[0x263F5EA60];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)_changeContainsRelevantChannelChanges:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 changedObjectID];
  uint64_t v6 = [v5 entity];
  uint64_t v7 = [v6 name];

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
            uint64_t v14 = [(NMSPodcastsDownloadableContentController_Legacy *)self _relevantChannelProperties];
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
        if ([(NMSPodcastsDownloadableContentController_Legacy *)self _changeContainsRelevantEpisodeChanges:v9]|| [(NMSPodcastsDownloadableContentController_Legacy *)self _changeContainsRelevantShowChanges:v9]|| [(NMSPodcastsDownloadableContentController_Legacy *)self _changeContainsRelevantStationChanges:v9]|| [(NMSPodcastsDownloadableContentController_Legacy *)self _changeContainsRelevantChannelChanges:v9])
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_delegateNotificationPending)
  {
    uint64_t v3 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver delegate notification pending.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    self->_delegateNotificationPending = 1;
    objc_initWeak(buf, self);
    dispatch_time_t v4 = dispatch_time(0, 8000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__NMSPodcastsDownloadableContentController_Legacy__notifyDelegateContentDidChange__block_invoke;
    block[3] = &unk_264633A58;
    objc_copyWeak(&v7, buf);
    dispatch_after(v4, queue, block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

- (void)_notifyDelegateContentDidChangeImmediately
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_delegateNotificationPending = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 podcastsDownloadableContentControllerContentDidChange:self];
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
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFF098]];
    int v16 = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    long long v19 = v8;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_INFO, "NMSPodcastsDownloadableContentObserver received %@ with token %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x263F5E9D8] sharedInstance];
  char v10 = [v9 isReady];

  if (v10)
  {
    uint64_t v11 = [v4 object];
    long long v12 = [(NMSPodcastsDownloadableContentController_Legacy *)self _ctx];
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
      _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver cannot open Podcasts DB. Will not respond to notification.", (uint8_t *)&v16, 2u);
    }

    long long v15 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v15 attemptToFix];
  }
}

- (void)_processLatestPersistenHistoryChanges
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(NMSPodcastsDownloadableContentController_Legacy *)self _ctx];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = [(NMSPodcastsDownloadableContentController_Legacy *)self lastMergedToken];
  id v4 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:v36[5]];
  [v4 setResultType:5];
  [v4 setFetchBatchSize:200];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__0;
  v27[4] = __Block_byref_object_dispose__0;
  id v28 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke;
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
    id v7 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v30[5];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver encountered error trying to fetch store result %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v9 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver clearing out persistent history token and performing a full persistent history run", (uint8_t *)&buf, 2u);
    }

    [(NMSPodcastsDownloadableContentController_Legacy *)self setLastMergedToken:0];
    char v10 = (void *)v30[5];
    v30[5] = 0;

    uint64_t v11 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:0];

    [v11 setResultType:5];
    [v11 setFetchBatchSize:200];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke_21;
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
        _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver encountered error trying to fetch store result after setting to nil %@", (uint8_t *)&buf, 0xCu);
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
  v16[2] = __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke_22;
  v16[3] = &unk_264633AF8;
  v16[4] = self;
  v16[5] = v27;
  v16[6] = &buf;
  v16[7] = &v35;
  [v5 performBlockAndWait:v16];
  [(NMSPodcastsDownloadableContentController_Legacy *)self setLastMergedToken:v36[5]];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    long long v14 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver notifying delegate", v15, 2u);
    }

    [(NMSPodcastsDownloadableContentController_Legacy *)self _notifyDelegateContentDidChange];
  }
  _Block_object_dispose(&buf, 8);
LABEL_16:

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"IsInProcessNotification"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    id v7 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver pinning selections did change", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__NMSPodcastsDownloadableContentController_Legacy__handlePodcastsPinningSelectionsDidChangeNotification___block_invoke;
    block[3] = &unk_264633B20;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_resetPersistentHistoryTokenAndNotifyObservers
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [MEMORY[0x263F5E9D8] sharedInstance];
  char v4 = [v3 isReady];

  if (v4)
  {
    *(void *)uint64_t v17 = 0;
    id v18 = v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__0;
    long long v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    id v5 = [(NMSPodcastsDownloadableContentController_Legacy *)self _ctx];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __97__NMSPodcastsDownloadableContentController_Legacy__resetPersistentHistoryTokenAndNotifyObservers__block_invoke;
    long long v14 = &unk_264633AA8;
    int v16 = v17;
    id v6 = v5;
    id v15 = v6;
    [v6 performBlockAndWait:&v11];
    -[NMSPodcastsDownloadableContentController_Legacy setLastMergedToken:](self, "setLastMergedToken:", *((void *)v18 + 5), v11, v12, v13, v14);
    id v7 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *((void *)v18 + 5);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v8;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver resetting persistent history token and notifying observers. Latest token %@", buf, 0xCu);
    }

    [(NMSPodcastsDownloadableContentController_Legacy *)self _notifyDelegateContentDidChange];
    _Block_object_dispose(v17, 8);
  }
  else
  {
    uint64_t v9 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver cannot open Podcasts DB. Will not reset persistent history.", v17, 2u);
    }

    char v10 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v10 attemptToFix];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastMergedToken, 0);
  objc_storeStrong((id *)&self->_persistentHistorySource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end