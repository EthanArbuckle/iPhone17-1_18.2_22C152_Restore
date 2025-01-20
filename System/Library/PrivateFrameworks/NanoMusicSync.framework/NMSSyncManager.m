@interface NMSSyncManager
+ (NMSSyncManager)sharedManager;
+ (id)_gizmoSyncStates;
+ (unint64_t)_syncStateForProgressInfo:(id)a3 session:(id)a4;
+ (unint64_t)_syncWaitingSubstateForProgressInfo:(id)a3;
+ (unsigned)_mediaTypeForAssetType:(id)a3;
+ (void)_gizmoSyncStates;
- (NMSSyncManager)init;
- (id)_addedTracksPredicateForMediaType:(unsigned int)a3;
- (id)_addedTracksQueryForMediaType:(unsigned int)a3;
- (id)_assetTypeForMediaType:(unsigned int)a3;
- (id)_defaultProgressInfoDict;
- (id)_defaultSyncProgressInfoForAssetType:(id)a3;
- (id)_syncProgressInfoByAssetType:(id)a3;
- (id)_tracksPredicateWithPersistentIDs:(id)a3;
- (id)_tracksQueryWithPredicate:(id)a3;
- (id)_updateProgressInfoForAssetType:(id)a3 assetItemsTotal:(int64_t)a4 assetItemsSyncedForSyncSession:(int64_t)a5 bytesToSyncTotal:(unint64_t)a6 bytesSyncedThisSyncSession:(unint64_t)a7;
- (id)activeSyncSessionIdentifier;
- (id)audiobooksProgressInfo;
- (id)musicProgressInfo;
- (id)podcastsProgressInfo;
- (id)progressInfoForMediaType:(unsigned int)a3;
- (unint64_t)_aggregateAssetItemBytesAddedForMediaType:(unsigned int)a3;
- (unint64_t)_estimatedAssetAggregateItemSizeInBytesWithQuery:(id)a3;
- (unint64_t)_numberOfItemsNeedingDownloadForAssetType:(id)a3;
- (void)_handleSyncStateDidChangeNotification;
- (void)_invokeOnMainThread:(id)a3;
- (void)_startObservingSyncSession;
- (void)_stopObservingSyncSession;
- (void)_updateObservedSyncSession;
- (void)_updateSyncProgress;
- (void)beginReceivingSyncProgressUpdates;
- (void)dealloc;
- (void)session:(id)a3 didBeginSessionTask:(id)a4;
- (void)session:(id)a3 didFinishSessionTask:(id)a4;
- (void)session:(id)a3 didUpdateSessionTask:(id)a4;
- (void)session:(id)a3 willBeginSessionTask:(id)a4;
- (void)sessionDidFinish:(id)a3;
- (void)sessionWillBegin:(id)a3;
- (void)setActiveSyncSessionIdentifier:(id)a3;
@end

@implementation NMSSyncManager

+ (NMSSyncManager)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_13);
  }
  v2 = (void *)sharedManager_sharedManager;

  return (NMSSyncManager *)v2;
}

uint64_t __31__NMSSyncManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(NMSSyncManager);
  uint64_t v1 = sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (NMSSyncManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NMSSyncManager;
  v2 = [(NMSSyncManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(NMSSyncManager *)v2 _defaultProgressInfoDict];
    uint64_t v5 = [v4 mutableCopy];
    syncProgressInfoByAssetType = v3->_syncProgressInfoByAssetType;
    v3->_syncProgressInfoByAssetType = (NSMutableDictionary *)v5;

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v3 selector:sel__updateSyncProgress name:*MEMORY[0x263F11418] object:0];
    [v7 addObserver:v3 selector:sel__updateObservedSyncSession name:*MEMORY[0x263F24B10] object:0];
    [v7 addObserver:v3 selector:sel__handleSyncStateDidChangeNotification name:@"com.apple.nanomusicsync.sync-state" object:0];
    v8 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v8 beginGeneratingLibraryChangeNotifications];

    [(NMSSyncManager *)v3 _updateObservedSyncSession];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F11E40] defaultMediaLibrary];
  [v3 endGeneratingLibraryChangeNotifications];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NMSSyncManager;
  [(NMSSyncManager *)&v5 dealloc];
}

- (id)_defaultProgressInfoDict
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"Music";
  v3 = -[NMSSyncManager _defaultSyncProgressInfoForAssetType:](self, "_defaultSyncProgressInfoForAssetType:");
  v9[0] = v3;
  v8[1] = @"Podcast";
  v4 = -[NMSSyncManager _defaultSyncProgressInfoForAssetType:](self, "_defaultSyncProgressInfoForAssetType:");
  v9[1] = v4;
  v8[2] = @"Audiobook";
  objc_super v5 = -[NMSSyncManager _defaultSyncProgressInfoForAssetType:](self, "_defaultSyncProgressInfoForAssetType:");
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)_defaultSyncProgressInfoForAssetType:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  [v5 setAssetType:v4];
  objc_msgSend(v5, "setAggregateAssetItemBytesAdded:", -[NMSSyncManager _aggregateAssetItemBytesAddedForMediaType:](self, "_aggregateAssetItemBytesAddedForMediaType:", objc_msgSend((id)objc_opt_class(), "_mediaTypeForAssetType:", v4)));
  if ([v4 isEqualToString:@"Music"])
  {
    v6 = +[NMSMediaPinningManager sharedManager];
    v7 = v6;
    v8 = @"com.apple.NanoMusic";
  }
  else if ([v4 isEqualToString:@"Podcast"])
  {
    v6 = +[NMSMediaPinningManager sharedManager];
    v7 = v6;
    v8 = @"com.apple.podcasts";
  }
  else
  {
    if (![v4 isEqualToString:@"Audiobook"]) {
      goto LABEL_8;
    }
    v6 = +[NMSMediaPinningManager sharedManager];
    v7 = v6;
    v8 = @"com.apple.NanoBooks";
  }
  v9 = [v6 downloadInfoForBundleIdentifier:v8];
  objc_msgSend(v5, "setNumberOfAssetItems:", objc_msgSend(v9, "totalItemCount"));

LABEL_8:
  objc_msgSend(v5, "setNumberOfAssetItemsSynced:", objc_msgSend(v5, "numberOfAssetItems"));

  return v5;
}

- (id)_tracksQueryWithPredicate:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x263F57470];
    id v4 = (void *)MEMORY[0x263F57448];
    id v5 = a3;
    v6 = [v4 autoupdatingSharedLibrary];
    v7 = [v3 unrestrictedAllItemsQueryWithlibrary:v6 predicate:v5 orderingTerms:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_addedTracksPredicateForMediaType:(unsigned int)a3
{
  id v5 = [MEMORY[0x263EFF980] array];
  v6 = @"com.apple.podcasts";
  if (a3 != 4) {
    v6 = 0;
  }
  if (a3 == 8) {
    v6 = @"com.apple.NanoMusic";
  }
  v7 = v6;
  v8 = +[NMSMediaPinningManager sharedManager];
  v9 = [v8 downloadInfoForBundleIdentifier:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__NMSSyncManager__addedTracksPredicateForMediaType___block_invoke;
  v13[3] = &unk_2646340F8;
  id v14 = v5;
  id v10 = v5;
  [v9 enumerateMediaItemsUsingBlock:v13];

  v11 = [(NMSSyncManager *)self _tracksPredicateWithPersistentIDs:v10];

  return v11;
}

void __52__NMSSyncManager__addedTracksPredicateForMediaType___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 mediaLibraryIdentifier];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 mediaLibraryIdentifier];
    [v4 addObject:v5];
  }
}

- (id)_addedTracksQueryForMediaType:(unsigned int)a3
{
  id v4 = [(NMSSyncManager *)self _addedTracksPredicateForMediaType:*(void *)&a3];
  id v5 = [(NMSSyncManager *)self _tracksQueryWithPredicate:v4];

  return v5;
}

- (unint64_t)_estimatedAssetAggregateItemSizeInBytesWithQuery:(id)a3
{
  v3 = [a3 valueForAggregateFunction:*MEMORY[0x263F573A0] onEntitiesForProperty:*MEMORY[0x263F573D8]];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)_aggregateAssetItemBytesAddedForMediaType:(unsigned int)a3
{
  unint64_t v4 = [(NMSSyncManager *)self _addedTracksQueryForMediaType:*(void *)&a3];
  unint64_t v5 = [(NMSSyncManager *)self _estimatedAssetAggregateItemSizeInBytesWithQuery:v4];

  return v5;
}

- (id)_assetTypeForMediaType:(unsigned int)a3
{
  if (a3 - 2 > 6) {
    return &stru_26D512A48;
  }
  else {
    return off_264634B98[a3 - 2];
  }
}

+ (unsigned)_mediaTypeForAssetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Music"])
  {
    unsigned int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Podcast"])
  {
    unsigned int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Audiobook"])
  {
    unsigned int v4 = 2;
  }
  else
  {
    unsigned int v4 = 0xFFFFFF;
  }

  return v4;
}

- (id)progressInfoForMediaType:(unsigned int)a3
{
  unsigned int v4 = [(NMSSyncManager *)self _assetTypeForMediaType:*(void *)&a3];
  unint64_t v5 = [(NMSSyncManager *)self _syncProgressInfoByAssetType:v4];

  return v5;
}

- (id)musicProgressInfo
{
  return [(NMSSyncManager *)self progressInfoForMediaType:8];
}

- (id)podcastsProgressInfo
{
  return [(NMSSyncManager *)self progressInfoForMediaType:4];
}

- (id)audiobooksProgressInfo
{
  return [(NMSSyncManager *)self progressInfoForMediaType:2];
}

- (void)beginReceivingSyncProgressUpdates
{
  id v2 = objc_alloc_init(MEMORY[0x263F24B18]);
  [v2 openDeviceMessageLink];
}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NMSSyncManager_session_willBeginSessionTask___block_invoke;
  v4[3] = &unk_264633B20;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __47__NMSSyncManager_session_willBeginSessionTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncProgress];
}

- (void)session:(id)a3 didBeginSessionTask:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__NMSSyncManager_session_didBeginSessionTask___block_invoke;
  v4[3] = &unk_264633B20;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __46__NMSSyncManager_session_didBeginSessionTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncProgress];
}

- (void)session:(id)a3 didUpdateSessionTask:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NMSSyncManager_session_didUpdateSessionTask___block_invoke;
  v4[3] = &unk_264633B20;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __47__NMSSyncManager_session_didUpdateSessionTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncProgress];
}

- (void)session:(id)a3 didFinishSessionTask:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NMSSyncManager_session_didFinishSessionTask___block_invoke;
  v4[3] = &unk_264633B20;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __47__NMSSyncManager_session_didFinishSessionTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncProgress];
}

- (void)sessionWillBegin:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__NMSSyncManager_sessionWillBegin___block_invoke;
  v3[3] = &unk_264633B20;
  v3[4] = self;
  [(NMSSyncManager *)self _invokeOnMainThread:v3];
}

uint64_t __35__NMSSyncManager_sessionWillBegin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncProgress];
}

- (void)sessionDidFinish:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__NMSSyncManager_sessionDidFinish___block_invoke;
  v3[3] = &unk_264633B20;
  v3[4] = self;
  [(NMSSyncManager *)self _invokeOnMainThread:v3];
}

uint64_t __35__NMSSyncManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncProgress];
}

- (void)_updateObservedSyncSession
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__NMSSyncManager__updateObservedSyncSession__block_invoke;
  v2[3] = &unk_264633B20;
  v2[4] = self;
  [(NMSSyncManager *)self _invokeOnMainThread:v2];
}

void __44__NMSSyncManager__updateObservedSyncSession__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _stopObservingSyncSession];
  id v2 = [MEMORY[0x263F24B20] sessionsWithSessionTypeIdentifier:*MEMORY[0x263F24B08] dataClass:@"Media"];
  uint64_t v3 = [v2 lastObject];
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  id v6 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) sessionIdentifier];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  if (v6 != *(id *)(*(void *)(a1 + 32) + 32) && (objc_msgSend(v6, "isEqual:") & 1) == 0)
  {
    id v10 = NMLogForCategory(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 32);
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "Active sync session identifier changed (%{public}@, previously %{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
  [*(id *)(a1 + 32) _startObservingSyncSession];
}

- (void)_stopObservingSyncSession
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    observedSession = self->_observedSession;
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = observedSession;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "Stopping observation of sync session: %@", buf, 0xCu);
  }

  [(ATSession *)self->_observedSession removeObserver:self];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = [(NSMutableDictionary *)self->_syncProgressInfoByAssetType allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "setNumberOfAssetItemsSynced:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "numberOfAssetItems"));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NMSSyncManager *)self _updateSyncProgress];
}

- (void)_startObservingSyncSession
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    observedSession = self->_observedSession;
    int v5 = 138412290;
    uint64_t v6 = observedSession;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "Starting observation of sync session: %@", (uint8_t *)&v5, 0xCu);
  }

  [(ATSession *)self->_observedSession removeObserver:self];
  [(ATSession *)self->_observedSession addObserver:self];
  [(NMSSyncManager *)self _updateSyncProgress];
}

- (void)_invokeOnMainThread:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)_handleSyncStateDidChangeNotification
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__NMSSyncManager__handleSyncStateDidChangeNotification__block_invoke;
  v2[3] = &unk_264633B20;
  v2[4] = self;
  [(NMSSyncManager *)self _invokeOnMainThread:v2];
}

uint64_t __55__NMSSyncManager__handleSyncStateDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncProgress];
}

+ (unint64_t)_syncStateForProgressInfo:(id)a3 session:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = +[NMSyncDefaults sharedDefaults];
  uint64_t v8 = [v7 clientPinningSettingsToken];

  uint64_t v9 = +[NMSyncDefaults sharedDefaults];
  long long v10 = [v9 syncStateDict];
  long long v11 = [v10 objectForKey:@"CompanionToken"];

  if (!v8 || v11 && ([v8 isEqual:v11] & 1) != 0)
  {
    if (a4)
    {
      uint64_t v12 = [v6 numberOfAssetItemsSynced];
      if (v12 < [v6 numberOfAssetItems])
      {
        long long v13 = NMLogForCategory(5);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_INFO, "[SyncStatus] Asset Syncing", (uint8_t *)&v20, 2u);
        }
        unint64_t v14 = 99;
        goto LABEL_18;
      }
      if (![v6 numberOfAssetItems]
        || (uint64_t v15 = [v6 numberOfAssetItemsSynced], v15 == objc_msgSend(v6, "numberOfAssetItems")))
      {
        uint64_t v16 = NMLogForCategory(5);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_2228FD000, v16, OS_LOG_TYPE_INFO, "[SyncStatus] Asset Syncing done", (uint8_t *)&v20, 2u);
        }
      }
    }
    long long v13 = [a1 _gizmoSyncStates];
    uint64_t v17 = [v6 assetType];
    v18 = [v13 objectForKeyedSubscript:v17];
    unint64_t v14 = [v18 unsignedIntegerValue];

    goto LABEL_18;
  }
  long long v13 = NMLogForCategory(5);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    v21 = v8;
    __int16 v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Mismatched tokens; resolvedMusicSyncState & resolvedPodcastsSyncState -> pending (local: %{public}@; "
      "remote: %{public}@)",
      (uint8_t *)&v20,
      0x16u);
  }
  unint64_t v14 = 2;
LABEL_18:

  return v14;
}

+ (unint64_t)_syncWaitingSubstateForProgressInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NMSyncDefaults sharedDefaults];
  int v5 = [v4 syncStateDict];

  id v6 = [v5 objectForKeyedSubscript:@"DetailsDict"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"WaitingSubstatesByMediaType"];
  uint64_t v8 = [v3 assetType];

  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  unint64_t v10 = [v9 unsignedIntegerValue];
  return v10;
}

- (id)_syncProgressInfoByAssetType:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableDictionary *)self->_syncProgressInfoByAssetType objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_syncProgressInfoByAssetType objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = objc_opt_new();
    [v6 setAssetType:v4];
    syncProgressInfoByAssetType = self->_syncProgressInfoByAssetType;
    uint64_t v8 = [v6 assetType];
    [(NSMutableDictionary *)syncProgressInfoByAssetType setObject:v6 forKey:v8];
  }

  return v6;
}

- (id)_updateProgressInfoForAssetType:(id)a3 assetItemsTotal:(int64_t)a4 assetItemsSyncedForSyncSession:(int64_t)a5 bytesToSyncTotal:(unint64_t)a6 bytesSyncedThisSyncSession:(unint64_t)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v11 = [(NMSSyncManager *)self _syncProgressInfoByAssetType:a3];
  [v11 setNumberOfAssetItems:a4];
  [v11 setNumberOfAssetItemsSynced:a5];
  [v11 setAggregateAssetItemBytesAdded:a6];
  uint64_t v12 = NMLogForCategory(5);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134218752;
    unint64_t v21 = a4;
    __int16 v22 = 2048;
    int64_t v23 = a5;
    __int16 v24 = 2048;
    double v25 = *(double *)&a6;
    __int16 v26 = 2048;
    unint64_t v27 = a7;
    _os_log_debug_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEBUG, "numberOfAssetItems = %li,numberOfAssetItemsSynced = %li, aggregateAssetItemBytesAdded = %llu, aggregateAssetItemBytesSynced = %llu", (uint8_t *)&v20, 0x2Au);
  }

  float v13 = (double)a7 / (double)(unint64_t)[v11 aggregateAssetItemBytesAdded];
  unint64_t v14 = NMLogForCategory(5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [v11 aggregateAssetItemBytesAdded];
    double v15 = v13;
    int v20 = 134218496;
    unint64_t v21 = a7;
    __int16 v22 = 2048;
    int64_t v23 = v18;
    __int16 v24 = 2048;
    double v25 = v13;
    _os_log_debug_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEBUG, "estimatedSyncProgress = %llu / %llu = %f", (uint8_t *)&v20, 0x20u);
  }
  else
  {
    double v15 = v13;
  }

  if (v13 > 1.0)
  {
    uint64_t v16 = NMLogForCategory(5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v11 aggregateAssetItemBytesAdded];
      int v20 = 134218496;
      unint64_t v21 = a7;
      __int16 v22 = 2048;
      int64_t v23 = v19;
      __int16 v24 = 2048;
      double v25 = v15;
      _os_log_error_impl(&dword_2228FD000, v16, OS_LOG_TYPE_ERROR, "[SyncStatus] estimatedSyncProgress > 1.0, %llu / %llu = %f; pinning at 1.0",
        (uint8_t *)&v20,
        0x20u);
    }

    float v13 = 1.0;
  }
  objc_msgSend(v11, "setEstimatedSyncProgress:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(fmaxf(v13, 0.0))));

  return v11;
}

- (void)_updateSyncProgress
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v2 = self->_observedSession;
  id v3 = [(ATSession *)v2 sessionTasks];
  id v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(ATSession *)v2 sessionIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v73 = (uint64_t)v5;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "Start updating sync progress - session identifier is %{public}@", buf, 0xCu);
  }
  if (v2)
  {
    id v6 = NMLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v3 count];
      int v8 = [(ATSession *)v2 isCancelled];
      *(_DWORD *)buf = 134218240;
      uint64_t v73 = v7;
      __int16 v74 = 1024;
      int v75 = v8;
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Num session tasks: %lu; isCancelled: %d", buf, 0x12u);
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v66;
    uint64_t v14 = *MEMORY[0x263F24B28];
    *(void *)&long long v11 = 138543362;
    long long v44 = v11;
    id v47 = v9;
    v48 = v2;
    uint64_t v45 = *MEMORY[0x263F24B28];
    uint64_t v46 = *(void *)v66;
    do
    {
      uint64_t v15 = 0;
      uint64_t v49 = v12;
      do
      {
        if (*(void *)v66 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v65 + 1) + 8 * v15);
        if (objc_msgSend(v16, "isCancelled", v44))
        {
          uint64_t v17 = NMLogForCategory(5);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [v16 sessionTaskIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v73 = (uint64_t)v18;
            _os_log_impl(&dword_2228FD000, v17, OS_LOG_TYPE_DEFAULT, "Task %@ is cancelled", buf, 0xCu);
          }
        }
        else
        {
          [v16 sessionGroupingKey];
          uint64_t v19 = v52 = v15;
          int v20 = [v19 isEqualToString:v14];

          uint64_t v15 = v52;
          if (!v20) {
            goto LABEL_29;
          }
          uint64_t v17 = [v16 properties];
          v51 = [v17 objectForKeyedSubscript:@"DetailedProgressByAssetType"];
          if ([v51 count])
          {
            v50 = v17;
            unint64_t v21 = NMLogForCategory(5);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v44;
              uint64_t v73 = (uint64_t)v51;
              _os_log_impl(&dword_2228FD000, v21, OS_LOG_TYPE_DEFAULT, "Detailed sync progress by asset type <%{public}@>", buf, 0xCu);
            }

            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            obuint64_t j = [v51 allValues];
            uint64_t v22 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v54 = *(void *)v62;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v62 != v54) {
                    objc_enumerationMutation(obj);
                  }
                  double v25 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                  __int16 v26 = [v25 objectForKeyedSubscript:@"AssetType"];
                  unint64_t v27 = [v25 objectForKeyedSubscript:@"TotalAssetsToSync"];
                  uint64_t v28 = [v27 integerValue];
                  v29 = [v25 objectForKeyedSubscript:@"TotalAssetsSynced"];
                  uint64_t v30 = [v29 integerValue];
                  v31 = [v25 objectForKeyedSubscript:@"TotalBytesToSync"];
                  uint64_t v32 = [v31 unsignedLongLongValue];
                  v33 = [v25 objectForKeyedSubscript:@"TotalBytesSynced"];
                  id v34 = -[NMSSyncManager _updateProgressInfoForAssetType:assetItemsTotal:assetItemsSyncedForSyncSession:bytesToSyncTotal:bytesSyncedThisSyncSession:](self, "_updateProgressInfoForAssetType:assetItemsTotal:assetItemsSyncedForSyncSession:bytesToSyncTotal:bytesSyncedThisSyncSession:", v26, v28, v30, v32, [v33 unsignedLongLongValue]);
                }
                uint64_t v23 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
              }
              while (v23);
            }

            id v9 = v47;
            id v2 = v48;
            uint64_t v12 = v49;
            uint64_t v14 = v45;
            uint64_t v13 = v46;
            uint64_t v15 = v52;
            uint64_t v17 = v50;
          }
        }
LABEL_29:
        ++v15;
      }
      while (v15 != v12);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v12);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v35 = [(NSMutableDictionary *)self->_syncProgressInfoByAssetType allValues];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        v41 = [v40 assetType];
        objc_msgSend(v40, "setNumberOfAssetItemsNeedingDownload:", -[NMSSyncManager _numberOfItemsNeedingDownloadForAssetType:](self, "_numberOfItemsNeedingDownloadForAssetType:", v41));

        objc_msgSend(v40, "setSyncState:", objc_msgSend((id)objc_opt_class(), "_syncStateForProgressInfo:session:", v40, v2));
        objc_msgSend(v40, "setSyncWaitingSubstate:", objc_msgSend((id)objc_opt_class(), "_syncWaitingSubstateForProgressInfo:", v40));
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v37);
  }

  v42 = NMLogForCategory(5);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    syncProgressInfoByAssetType = self->_syncProgressInfoByAssetType;
    *(_DWORD *)buf = 138543362;
    uint64_t v73 = (uint64_t)syncProgressInfoByAssetType;
    _os_log_impl(&dword_2228FD000, v42, OS_LOG_TYPE_DEFAULT, "Finished updating sync progress: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__NMSSyncManager__updateSyncProgress__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__NMSSyncManager__updateSyncProgress__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSSyncManagerSyncStateDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (unint64_t)_numberOfItemsNeedingDownloadForAssetType:(id)a3
{
  if (![a3 isEqualToString:@"Music"]) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x263F24B20];

  return [v3 activeSessionCountWithSessionTypeIdentifier:@"MLWatchDownload"];
}

- (id)_tracksPredicateWithPersistentIDs:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263F57460] predicateWithPersistentIDs:v3 shouldContain:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_gizmoSyncStates
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v2 = +[NMSyncDefaults sharedDefaults];
  id v3 = [v2 syncStateDict];

  id v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v3;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[SyncStatus] sync state dict %{public}@", buf, 0xCu);
  }

  int v5 = [v3 objectForKeyedSubscript:@"DetailsDict"];
  id v6 = [v5 objectForKeyedSubscript:@"SyncStatesByMediaType"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"Music"];

  int v8 = [v3 objectForKeyedSubscript:@"DetailsDict"];
  id v9 = [v8 objectForKeyedSubscript:@"SyncStatesByMediaType"];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"Podcast"];

  long long v11 = [v3 objectForKeyedSubscript:@"DetailsDict"];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"SyncStatesByMediaType"];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"Audiobook"];

  v39 = v7;
  if (v7 || v10 || v13)
  {
    if (v7)
    {
      uint64_t v16 = [v7 unsignedIntegerValue];
      uint64_t v19 = NMLogForCategory(5);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = +[NMSSyncProgressInfo _stringFromSyncState:v16];
        *(_DWORD *)buf = 138543362;
        v43 = v20;
        _os_log_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Music sync state from gizmo: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v19 = NMLogForCategory(5);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = 2;
        _os_log_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestMusicSyncStateAsNumber; resolvedMusicSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        uint64_t v16 = 2;
      }
    }

    if (v10)
    {
      uint64_t v21 = [v10 unsignedIntegerValue];
      uint64_t v22 = NMLogForCategory(5);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = +[NMSSyncProgressInfo _stringFromSyncState:v21];
        *(_DWORD *)buf = 138543362;
        v43 = v23;
        _os_log_impl(&dword_2228FD000, v22, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Podcasts sync state from gizmo: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v22 = NMLogForCategory(5);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = 2;
        _os_log_impl(&dword_2228FD000, v22, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestPodcastsSyncStateAsNumber; resolvedPodcastsSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        uint64_t v21 = 2;
      }
    }

    if (v13)
    {
      uint64_t v24 = [v13 unsignedIntegerValue];
      uint64_t v15 = NMLogForCategory(5);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double v25 = +[NMSSyncProgressInfo _stringFromSyncState:v24];
        *(_DWORD *)buf = 138543362;
        v43 = v25;
        _os_log_impl(&dword_2228FD000, v15, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Audiobooks sync state from gizmo: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v15 = NMLogForCategory(5);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v24 = 2;
        _os_log_impl(&dword_2228FD000, v15, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestAudiobooksSyncStateAsNumber; resolvedAudiobooksSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        uint64_t v24 = 2;
      }
    }
  }
  else
  {
    uint64_t v14 = [v3 objectForKeyedSubscript:@"SyncState"];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 unsignedIntegerValue];
      uint64_t v17 = NMLogForCategory(5);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = +[NMSSyncProgressInfo _stringFromSyncState:v16];
        *(_DWORD *)buf = 138543362;
        v43 = v18;
        _os_log_impl(&dword_2228FD000, v17, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Legacy Music sync state from gizmo: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = NMLogForCategory(5);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = 2;
        _os_log_impl(&dword_2228FD000, v17, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestSyncStateAsNumber; resolvedMusicSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        uint64_t v16 = 2;
      }
    }

    __int16 v26 = NMLogForCategory(5);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v26, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No new sync state keys in sync state dict. Assuming pending Podcasts and Audiobooks sync state", buf, 2u);
    }

    uint64_t v24 = 2;
    uint64_t v21 = 2;
  }

  unint64_t v27 = NMLogForCategory(5);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = +[NMSSyncProgressInfo _stringFromSyncState:v16];
    v29 = +[NMSSyncProgressInfo _stringFromSyncState:v21];
    uint64_t v30 = +[NMSSyncProgressInfo _stringFromSyncState:v24];
    *(_DWORD *)buf = 138544642;
    v43 = v28;
    __int16 v44 = 2048;
    uint64_t v45 = v16;
    __int16 v46 = 2114;
    id v47 = v29;
    __int16 v48 = 2048;
    uint64_t v49 = v21;
    __int16 v50 = 2114;
    v51 = v30;
    __int16 v52 = 2048;
    uint64_t v53 = v24;
    _os_log_impl(&dword_2228FD000, v27, OS_LOG_TYPE_DEFAULT, "[SyncStatus] resolvedMusicSyncState: %{public}@ [%tu] -- resolvedPodcastsSyncState: %{public}@ [%tu] -- resolvedAudiobooksSyncState: %{public}@ [%tu]", buf, 0x3Eu);
  }
  if (v16)
  {
    if (v21) {
      goto LABEL_37;
    }
  }
  else
  {
    v31 = NMLogForCategory(5);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[NMSSyncManager _gizmoSyncStates]();
    }

    uint64_t v16 = 1;
    if (v21)
    {
LABEL_37:
      if (v24) {
        goto LABEL_48;
      }
      goto LABEL_45;
    }
  }
  uint64_t v32 = NMLogForCategory(5);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    +[NMSSyncManager _gizmoSyncStates]();
  }

  uint64_t v21 = 1;
  if (!v24)
  {
LABEL_45:
    v33 = NMLogForCategory(5);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      +[NMSSyncManager _gizmoSyncStates]();
    }

    uint64_t v24 = 1;
  }
LABEL_48:
  v40[0] = @"Music";
  id v34 = [NSNumber numberWithUnsignedInteger:v16];
  v41[0] = v34;
  v40[1] = @"Podcast";
  v35 = [NSNumber numberWithUnsignedInteger:v21];
  v41[1] = v35;
  v40[2] = @"Audiobook";
  uint64_t v36 = [NSNumber numberWithUnsignedInteger:v24];
  v41[2] = v36;
  uint64_t v37 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];

  return v37;
}

- (id)activeSyncSessionIdentifier
{
  return self->_activeSyncSessionIdentifier;
}

- (void)setActiveSyncSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activeSyncSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_syncProgressInfoByAssetType, 0);
  objc_storeStrong((id *)&self->_maskedPendingSyncStateRevealTimer, 0);

  objc_storeStrong((id *)&self->_observedSession, 0);
}

+ (void)_gizmoSyncStates
{
  v0 = +[NMSSyncProgressInfo _stringFromSyncState:0];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_2228FD000, v1, v2, "[SyncStatus] Unexpected _gizmoSyncState (Music): %{public}@; syncStateDict:%{public}@; resolvedSyncState -> idle",
    v3,
    v4,
    v5,
    v6,
    v7);
}

@end