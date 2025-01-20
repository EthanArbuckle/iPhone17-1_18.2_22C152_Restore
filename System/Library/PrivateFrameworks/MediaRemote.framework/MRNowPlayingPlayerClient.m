@interface MRNowPlayingPlayerClient
- (BOOL)canBeNowPlayingPlayer;
- (BOOL)hasReceivedCommandRecently;
- (BOOL)invalidatingPlaybackQueue;
- (BOOL)isPictureInPictureEnabled;
- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3;
- (MRContentItem)nowPlayingContentItem;
- (MRNowPlayingArtwork)nowPlayingArtwork;
- (MRNowPlayingPlayerClient)initWithPlayerPath:(id)a3;
- (MRNowPlayingPlayerClientCallbacks)clientCallbacks;
- (MRPlaybackQueue)playbackQueue;
- (MRPlaybackQueueSubscriptionController)subscriptionController;
- (MRPlayerPath)playerPath;
- (NSArray)supportedCommands;
- (NSDate)activeRequestedDate;
- (NSDictionary)nowPlayingInfo;
- (double)invalidatationTimestamp;
- (id)debugDescription;
- (id)description;
- (id)homeUserIdentifiers;
- (id)resolveCommandOptions:(unsigned int)a3 options:(id)a4;
- (unint64_t)capabilities;
- (unsigned)playbackState;
- (unsigned)resolveCommand:(unsigned int)a3;
- (void)_handePlaybackSessionMigrateRequest:(void *)a3 request:(void *)a4 completion:;
- (void)_onQueue_cacheContentItemChangesForPendingRequests:(uint64_t)a1;
- (void)_onQueue_enqueueContentItemChangesForPendingPlaybackQueueInvalidation:(uint64_t)a1;
- (void)_onQueue_updateCacheWithContentItems:(uint64_t)a1;
- (void)_onQueue_updateCacheWithPlaybackQueue:(uint64_t)a1;
- (void)addPendingPlaybackSessionMigrateEvent:(id)a3;
- (void)addPendingRequest:(id)a3;
- (void)appendHomeUserIdentifier:(id)a3;
- (void)clearCachedContentItemArtworkForItems:(id)a3;
- (void)clearHomeUserIdentifiers;
- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3;
- (void)invalidatePlaybackQueue;
- (void)invalidatePlaybackQueueWithPlaybackQueue:(id)a3;
- (void)preProcessChangePlaybackRateCommandWithOptions:(uint64_t)a1;
- (void)restoreNowPlayingClientState;
- (void)sendContentItemChanges:(id)a3;
- (void)setActiveRequestedDate:(id)a3;
- (void)setCanBeNowPlayingPlayer:(BOOL)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setHomeUserIdentifier:(id)a3;
- (void)setInvalidatationTimestamp:(double)a3;
- (void)setInvalidatingPlaybackQueue:(BOOL)a3;
- (void)setNowPlayingArtwork:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setPictureInPictureEnabled:(BOOL)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSupportedCommands:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)startCachingContentItemUpdatesForItem:(id)a3 forPendingRequest:(id)a4;
- (void)updatePlaybackQueueWithCachedUpdates:(id)a3 forPendingRequest:(id)a4;
- (void)updatePlaybackState:(unsigned int)a3 date:(id)a4;
- (void)updatePlayer:(id)a3;
@end

@implementation MRNowPlayingPlayerClient

void __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v19 = [*(id *)(*(void *)(a1 + 32) + 136) objectForKey:*(void *)(a1 + 40)];
  if (!v19)
  {
    v2 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke_cold_1(a1, v2);
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "contentItems", a1);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v3;
        v4 = *(void **)(*((void *)&v26 + 1) + 8 * v3);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v5 = v19;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v23 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              v11 = [v4 identifier];
              v12 = [v10 item];
              v13 = [v12 identifier];
              int v14 = [v11 isEqualToString:v13];

              if (v14)
              {
                v15 = [v10 item];
                MRContentItemMerge(v4, v15);
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  [*(id *)(*(void *)(v16 + 32) + 136) removeObjectForKey:*(void *)(v16 + 40)];
}

- (MRNowPlayingPlayerClientCallbacks)clientCallbacks
{
  return self->_clientCallbacks;
}

double __51__MRNowPlayingPlayerClient_invalidatationTimestamp__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 120);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke(uint64_t a1)
{
  if ((MRSupportedCommandsIsEqual(*(void **)(a1 + 32), *(void **)(*(void *)(a1 + 40) + 48)) & 1) == 0)
  {
    if (MSVDeviceOSIsInternalInstall())
    {
      v2 = *(void **)(a1 + 32);
      uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 48);
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      id v5 = *(void **)(v4 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = *(id *)(v6 + 40);
      id obj = v5;
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      id v11 = *(id *)(v7 + 40);
      MRSupportedCommandsCalculateDeltas(v3, v2, &obj, &v12, &v11);
      objc_storeStrong((id *)(v4 + 40), obj);
      objc_storeStrong((id *)(v6 + 40), v12);
      objc_storeStrong((id *)(v7 + 40), v11);
    }
    uint64_t v8 = [*(id *)(a1 + 32) copy];
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
}

- (void)sendContentItemChanges:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__42;
  uint64_t v18 = __Block_byref_object_dispose__42;
  id v19 = +[MRContentItem mergeContentItems:v4];
  id v5 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    playerPath = self->_playerPath;
    uint64_t v7 = MRContentItemsCopyMinimalReadableDescription((void *)v15[5], 0);
    -[MRNowPlayingPlayerClient sendContentItemChanges:]((uint64_t)playerPath, v7, buf, v5);
  }

  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRNowPlayingPlayerClient_sendContentItemChanges___block_invoke;
  block[3] = &unk_1E57D2070;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v11 + 24)) {
    MRMediaRemotePlaybackQueueDataSourceSendContentItemsChangedForPlayer((void *)v15[5], self);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

id __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = MRMediaRemoteCopyCommandDescription([a2 intValue]);

  return v2;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setCapabilities:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__MRNowPlayingPlayerClient_setCapabilities___block_invoke;
  v4[3] = &unk_1E57D2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (MRNowPlayingPlayerClient)initWithPlayerPath:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MRNowPlayingPlayerClient;
  uint64_t v6 = [(MRNowPlayingPlayerClient *)&v28 init];
  if (v6)
  {
    if (([v5 isResolved] & 1) == 0)
    {
      long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v6, @"MRNowPlayingPlayerClient.m", 73, @"Trying to instantiate an unresolved MRNowPlayingPlayerClient %@", v5 object file lineNumber description];
    }
    uint64_t v7 = [v5 copy];
    playerPath = v6->_playerPath;
    v6->_playerPath = (MRPlayerPath *)v7;

    uint64_t v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("replayQueue", v14);
    replayQueue = v6->_replayQueue;
    v6->_replayQueue = (OS_dispatch_queue *)v15;

    v17 = [[MRPlaybackQueueSubscriptionController alloc] initWithPlayerPath:v6->_playerPath];
    subscriptionController = v6->_subscriptionController;
    v6->_subscriptionController = v17;

    id v19 = [[MRNowPlayingPlayerClientCallbacks alloc] initWithPlayerPath:v6->_playerPath queue:v6->_serialQueue];
    clientCallbacks = v6->_clientCallbacks;
    v6->_clientCallbacks = v19;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v6->_invalidatationTimestamp = v21;
    long long v22 = [(MRPlayerPath *)v6->_playerPath origin];
    LODWORD(v11) = [v22 isLocallyHosted];

    if (v11)
    {
      objc_initWeak(&location, v6);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__MRNowPlayingPlayerClient_initWithPlayerPath___block_invoke;
      v25[3] = &unk_1E57D9040;
      objc_copyWeak(&v26, &location);
      [(MRNowPlayingPlayerClientCallbacks *)v6->_clientCallbacks setPlaybackSessionMigrateRequestCallback:v25];
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

uint64_t __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_58(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __41__MRNowPlayingPlayerClient_playbackState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 72);
  return result;
}

- (BOOL)canBeNowPlayingPlayer
{
  return self->_canBeNowPlayingPlayer;
}

- (void)setCanBeNowPlayingPlayer:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__MRNowPlayingPlayerClient_setCanBeNowPlayingPlayer___block_invoke;
  v4[3] = &unk_1E57D1CB0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(serialQueue, v4);
}

uint64_t __47__MRNowPlayingPlayerClient_homeUserIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 152) copy];

  return MEMORY[0x1F41817F8]();
}

void __45__MRNowPlayingPlayerClient_setPlaybackQueue___block_invoke(uint64_t a1)
{
}

void __46__MRNowPlayingPlayerClient_addPendingRequest___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 136))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = v2;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [*(id *)(*(void *)(a1 + 32) + 136) setValue:v5 forKey:*(void *)(a1 + 40)];
}

- (NSDate)activeRequestedDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MRNowPlayingPlayerClient_activeRequestedDate__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setSupportedCommands:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__42;
  v62 = __Block_byref_object_dispose__42;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__42;
  v56 = __Block_byref_object_dispose__42;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__42;
  v50 = __Block_byref_object_dispose__42;
  id v51 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke;
  block[3] = &unk_1E57D91A0;
  id v12 = v8;
  id v36 = v12;
  v37 = self;
  v38 = &v58;
  v39 = &v52;
  v40 = &v46;
  v41 = &v42;
  dispatch_sync(serialQueue, block);
  playerPath = self->_playerPath;
  p_playerPath = (void **)&self->_playerPath;
  if ([(MRPlayerPath *)playerPath isLocal])
  {
    dispatch_queue_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    MRAddPlayerPathToUserInfo(v15, *p_playerPath);
    uint64_t v16 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[MRNowPlayingPlayerClient setSupportedCommands:queue:completion:]((uint64_t *)p_playerPath, v16);
    }

    v17 = +[MRMediaRemoteServiceClient sharedServiceClient];
    uint64_t v18 = [v17 notificationClient];
    id v19 = MRCreateDecodedUserInfo(v15);
    [v18 dispatchNotification:@"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification" userInfo:v19 object:0];
  }
  if (*((unsigned char *)v43 + 24))
  {
    uint64_t v20 = (void *)MRGetSharedService();
    double v21 = *p_playerPath;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_58;
    v33[3] = &unk_1E57D0F98;
    v34 = v10;
    MRMediaRemoteServiceSetSupportedCommands(v20, (uint64_t)v12, v21, v9, v33);
    if ([(id)v59[5] count])
    {
      long long v22 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = [(id)v59[5] allKeys];
        long long v24 = objc_msgSend(v23, "msv_map:", &__block_literal_global_61);
        *(_DWORD *)buf = 138412290;
        v65 = v24;
        _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Added SupportedCommands: %@", buf, 0xCu);
      }
    }
    if ([(id)v53[5] count])
    {
      long long v25 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [(id)v53[5] allKeys];
        long long v27 = objc_msgSend(v26, "msv_map:", &__block_literal_global_64_0);
        *(_DWORD *)buf = 138412290;
        v65 = v27;
        _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Removed SupportedCommands: %@", buf, 0xCu);
      }
    }
    if ([(id)v47[5] count])
    {
      objc_super v28 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = [(id)v47[5] allKeys];
        v30 = objc_msgSend(v29, "msv_map:", &__block_literal_global_67);
        *(_DWORD *)buf = 138412290;
        v65 = v30;
        _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Changed SupportedCommands: %@", buf, 0xCu);
      }
    }
    v31 = v34;
  }
  else
  {
    v31 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *p_playerPath;
      *(_DWORD *)buf = 138543362;
      v65 = v32;
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Setting identical supportedCommands for %{public}@. Skipping update", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
}

double __55__MRNowPlayingPlayerClient_setInvalidatationTimestamp___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 120) = result;
  return result;
}

uint64_t __45__MRNowPlayingPlayerClient_supportedCommands__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

- (MRPlaybackQueueSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (id)homeUserIdentifiers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__42;
  id v10 = __Block_byref_object_dispose__42;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MRNowPlayingPlayerClient_homeUserIdentifiers__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)updatePlaybackQueueWithCachedUpdates:(id)a3 forPendingRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClient updatePlaybackQueueWithCachedUpdates:forPendingRequest:]"];
    [v13 handleFailureInFunction:v14, @"MRNowPlayingPlayerClient.m", 605, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];
  }
  uint64_t v8 = [v7 requestIdentifier];
  if (!v8)
  {
    dispatch_queue_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClient updatePlaybackQueueWithCachedUpdates:forPendingRequest:]"];
    [v15 handleFailureInFunction:v16, @"MRNowPlayingPlayerClient.m", 608, @"Invalid parameter not satisfying: %@", @"requestID" file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke;
  block[3] = &unk_1E57D3480;
  void block[4] = self;
  id v18 = v8;
  id v19 = v6;
  id v20 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_sync(serialQueue, block);
}

- (double)invalidatationTimestamp
{
  uint64_t v4 = 0;
  id v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  msv_dispatch_sync_on_queue();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)addPendingRequest:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClient addPendingRequest:]"];
    [v8 handleFailureInFunction:v9, @"MRNowPlayingPlayerClient.m", 523, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];
  }
  id v5 = [v4 requestIdentifier];
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClient addPendingRequest:]"];
    [v10 handleFailureInFunction:v11, @"MRNowPlayingPlayerClient.m", 526, @"Invalid parameter not satisfying: %@", @"requestID" file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MRNowPlayingPlayerClient_addPendingRequest___block_invoke;
  block[3] = &unk_1E57D0790;
  void block[4] = self;
  id v13 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

- (unsigned)playbackState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MRNowPlayingPlayerClient_playbackState__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MRNowPlayingPlayerClient_setPlaybackQueue___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)setInvalidatationTimestamp:(double)a3
{
}

void __47__MRNowPlayingPlayerClient_activeRequestedDate__block_invoke(uint64_t a1)
{
}

uint64_t __41__MRNowPlayingPlayerClient_playbackQueue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

void __84__MRNowPlayingPlayerClient_startCachingContentItemUpdatesForItem_forPendingRequest___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 136) objectForKey:*(void *)(a1 + 40)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
      id v8 = *(void **)(a1 + 48);
      int v9 = objc_msgSend(v7, "item", (void)v14);
      LOBYTE(v8) = MRContentItemIdentifierIsEqual(v8, v9);

      if (v8) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v7;

    if (!v10) {
      goto LABEL_12;
    }
    id v11 = MRContentItemCreateFromRequest(*(void **)(a1 + 48), *(void **)(a1 + 56));
    id v12 = [(MRContentItemRequest *)v10 item];
    MRContentItemMerge(v12, v11);

    id v13 = [(MRContentItemRequest *)v10 request];
    [v13 mergeFrom:*(void *)(a1 + 56)];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v10 = [[MRContentItemRequest alloc] initWithItem:*(void *)(a1 + 48) request:*(void *)(a1 + 56)];
    [v2 addObject:v10];
  }
}

uint64_t __53__MRNowPlayingPlayerClient_setCanBeNowPlayingPlayer___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 24))
  {
    uint64_t v3 = result;
    *(unsigned char *)(v2 + 24) = v1;
    if (*(unsigned char *)(result + 40))
    {
      double result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      *(void *)(*(void *)(v3 + 32) + 32) = v4;
    }
  }
  return result;
}

- (void)startCachingContentItemUpdatesForItem:(id)a3 forPendingRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v14 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClient startCachingContentItemUpdatesForItem:forPendingRequest:]"];
    [v13 handleFailureInFunction:v14, @"MRNowPlayingPlayerClient.m", 540, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];
  }
  id v8 = [v7 requestIdentifier];
  if (!v8)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v16 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClient startCachingContentItemUpdatesForItem:forPendingRequest:]"];
    [v15 handleFailureInFunction:v16, @"MRNowPlayingPlayerClient.m", 543, @"Invalid parameter not satisfying: %@", @"requestID" file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__MRNowPlayingPlayerClient_startCachingContentItemUpdatesForItem_forPendingRequest___block_invoke;
  block[3] = &unk_1E57D3480;
  void block[4] = self;
  id v18 = v8;
  id v19 = v6;
  id v20 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_sync(serialQueue, block);
}

- (NSArray)supportedCommands
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__42;
  id v8 = __Block_byref_object_dispose__42;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

uint64_t __44__MRNowPlayingPlayerClient_setCapabilities___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88) = *(void *)(result + 40);
  return result;
}

- (void)invalidatePlaybackQueueWithPlaybackQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(MRNowPlayingPlayerClient *)self playerPath];
  MRMediaRemoteSetPlaybackQueue((uint64_t)v5, v4, 0, 0);
}

void __51__MRNowPlayingPlayerClient_sendContentItemChanges___block_invoke(uint64_t a1)
{
  int v1 = (uint64_t *)a1;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v2 = [*(id *)(a1 + 32) playbackQueue];
  uint64_t v3 = [v2 contentItems];

  id obj = v3;
  uint64_t v34 = [v3 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v48;
    unint64_t v4 = 0x1E57CF000uLL;
    id v36 = v1;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v48 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v5;
        uint64_t v6 = *(void **)(*((void *)&v47 + 1) + 8 * v5);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v39 = (id)[*(id *)(*(void *)(v1[5] + 8) + 40) copy];
        uint64_t v7 = [v39 countByEnumeratingWithState:&v43 objects:v54 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v44;
          uint64_t v37 = *(void *)v44;
          do
          {
            uint64_t v10 = 0;
            uint64_t v38 = v8;
            do
            {
              if (*(void *)v44 != v9) {
                objc_enumerationMutation(v39);
              }
              id v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
              id v12 = [v6 identifier];
              id v13 = [v11 identifier];
              int v14 = [v12 isEqualToString:v13];

              if (v14)
              {
                long long v15 = *(void **)(v4 + 736);
                v53[0] = v6;
                v53[1] = v11;
                long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
                long long v17 = [v15 mergeContentItems:v16];
                id v18 = [v17 firstObject];

                if ([v6 isEffectivelyEqual:v18])
                {
                  id v19 = (id)[*(id *)(*(void *)(v1[5] + 8) + 40) mutableCopy];
                  [v19 removeObject:v11];
                  objc_storeStrong((id *)(*(void *)(v1[5] + 8) + 40), v19);
                  id v20 = _MRLogForCategory(1uLL);
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    double v21 = MRContentItemCopyMinimalReadableDescription(v11);
                    *(_DWORD *)buf = 138412290;
                    uint64_t v52 = v21;
                    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Sending identical contentItemChange for %@. Skipping update", buf, 0xCu);
                  }
                }
                else
                {
                  long long v22 = [v6 metadata];
                  long long v23 = [v22 dictionaryRepresentation];
                  long long v24 = [v11 metadata];
                  long long v25 = [v24 dictionaryRepresentation];
                  id v41 = 0;
                  id v42 = 0;
                  id v40 = 0;
                  MRDictionaryCalculateDeltas(v23, v25, &v42, &v41, &v40);
                  id v19 = v42;
                  id v20 = v41;
                  id v26 = v40;

                  if ([v19 count])
                  {
                    long long v27 = _MRLogForCategory(1uLL);
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_super v28 = [v19 description];
                      *(_DWORD *)buf = 138412290;
                      uint64_t v52 = v28;
                      _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Added Fields: %@", buf, 0xCu);
                    }
                  }
                  int v1 = v36;
                  unint64_t v4 = 0x1E57CF000;
                  uint64_t v9 = v37;
                  if ([v26 count])
                  {
                    long long v29 = _MRLogForCategory(1uLL);
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      v30 = [v26 description];
                      *(_DWORD *)buf = 138412290;
                      uint64_t v52 = v30;
                      _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Updated Values: %@", buf, 0xCu);

                      uint64_t v9 = v37;
                    }
                  }
                }

                uint64_t v8 = v38;
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v39 countByEnumeratingWithState:&v43 objects:v54 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v34);
  }

  -[MRNowPlayingPlayerClient _onQueue_updateCacheWithContentItems:](v1[4], *(void **)(*(void *)(v1[5] + 8) + 40));
  -[MRNowPlayingPlayerClient _onQueue_cacheContentItemChangesForPendingRequests:](v1[4], *(void **)(*(void *)(v1[5] + 8) + 40));
  uint64_t v31 = v1[4];
  if (*(unsigned char *)(v31 + 113)) {
    -[MRNowPlayingPlayerClient _onQueue_enqueueContentItemChangesForPendingPlaybackQueueInvalidation:](v31, *(void **)(*(void *)(v1[5] + 8) + 40));
  }
  else {
    *(unsigned char *)(*(void *)(v1[6] + 8) + 24) = 1;
  }
}

- (MRPlaybackQueue)playbackQueue
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__42;
  uint64_t v8 = __Block_byref_object_dispose__42;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlaybackQueue *)v2;
}

- (void)_onQueue_updateCacheWithContentItems:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (v4)
    {
      if ([v4 count])
      {
        uint64_t v3 = [[MRPlaybackQueue alloc] initWithContentItems:v4];
        -[MRNowPlayingPlayerClient _onQueue_updateCacheWithPlaybackQueue:](a1, v3);
      }
    }
  }
}

- (void)_onQueue_updateCacheWithPlaybackQueue:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [*(id *)(a1 + 40) contentItems];
    uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v3;
          id v4 = *(void **)(*((void *)&v27 + 1) + 8 * v3);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v5 = [v20 contentItems];
          uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v7; ++i)
              {
                if (*(void *)v24 != v8) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
                id v11 = [v10 identifier];
                id v12 = [v4 identifier];
                int v13 = [v11 isEqualToString:v12];

                if (v13)
                {
                  uint64_t v14 = [*(id *)(a1 + 40) range];
                  long long v16 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:](MRPlaybackQueueRequest, "defaultPlaybackQueueRequestWithRange:", v14, v15);
                  long long v17 = MRContentItemCreateFromRequest(v10, v16);
                  MRContentItemMerge(v4, v17);
                }
              }
              uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v7);
          }

          uint64_t v3 = v22 + 1;
        }
        while (v22 + 1 != v21);
        uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }
  }
}

- (void)_onQueue_cacheContentItemChangesForPendingRequests:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v4 = *(void **)(a1 + 136);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __79__MRNowPlayingPlayerClient__onQueue_cacheContentItemChangesForPendingRequests___block_invoke;
    v5[3] = &unk_1E57D3050;
    id v6 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __47__MRNowPlayingPlayerClient_initWithPlayerPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    -[MRNowPlayingPlayerClient _handePlaybackSessionMigrateRequest:request:completion:](WeakRetained, v12, v7, v8);
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(4);
    (*((void (**)(id, id, void *))v8 + 2))(v8, v7, Error);
  }
}

- (void)_handePlaybackSessionMigrateRequest:(void *)a3 request:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a1)
  {
    long long v45 = v9;
    id v11 = [a1 supportedCommands];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke;
    v73[3] = &unk_1E57D91E8;
    id v12 = v7;
    id v74 = v12;
    id v13 = v11;
    id v75 = v13;
    v76 = a1;
    id v46 = v8;
    id v14 = v8;
    id v77 = v14;
    long long v43 = (void *)MEMORY[0x1997190F0](v73);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3;
    v69[3] = &unk_1E57D3770;
    id v15 = v14;
    id v70 = v15;
    v71 = a1;
    id v16 = v13;
    id v72 = v16;
    long long v17 = (void *)MEMORY[0x1997190F0](v69);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_7;
    v65[3] = &unk_1E57D3770;
    id v18 = v15;
    id v66 = v18;
    id v19 = v16;
    id v67 = v19;
    v68 = a1;
    id v20 = (void *)MEMORY[0x1997190F0](v65);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_9;
    v61[3] = &unk_1E57D3770;
    id v21 = v18;
    id v62 = v21;
    id v22 = v19;
    id v63 = v22;
    v64 = a1;
    long long v23 = (void *)MEMORY[0x1997190F0](v61);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_11;
    v58[3] = &unk_1E57D9238;
    id v24 = v21;
    id v59 = v24;
    uint64_t v60 = a1;
    long long v25 = (void *)MEMORY[0x1997190F0](v58);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_104;
    v54[3] = &unk_1E57D3770;
    id v26 = v24;
    id v55 = v26;
    id v44 = v22;
    id v56 = v44;
    id v57 = a1;
    long long v47 = (void *)MEMORY[0x1997190F0](v54);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3_109;
    v51[3] = &unk_1E57D9238;
    id v27 = v26;
    id v52 = v27;
    v53 = a1;
    long long v28 = (void *)MEMORY[0x1997190F0](v51);
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = v43;
    if (!v12)
    {
      uint64_t v31 = (void *)[v25 copy];
      uint64_t v32 = (void *)MEMORY[0x1997190F0]();
      [v29 addObject:v32];

      uint64_t v33 = (void *)[v17 copy];
      uint64_t v34 = (void *)MEMORY[0x1997190F0]();
      [v29 addObject:v34];

      uint64_t v35 = (void *)[v20 copy];
      id v36 = (void *)MEMORY[0x1997190F0]();
      [v29 addObject:v36];

      uint64_t v37 = (void *)[v28 copy];
      uint64_t v38 = (void *)MEMORY[0x1997190F0]();
      [v29 addObject:v38];

      id v39 = (void *)[v47 copy];
      id v40 = (void *)MEMORY[0x1997190F0]();
      [v29 addObject:v40];

      long long v30 = v23;
    }
    id v41 = (void *)[v30 copy];
    id v42 = (void *)MEMORY[0x1997190F0]();
    [v29 addObject:v42];

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5_121;
    v48[3] = &unk_1E57D0DE0;
    uint64_t v10 = v45;
    id v50 = v45;
    id v49 = v27;
    MRPerformAsyncOperationsUntilError(v29, v48);

    id v8 = v46;
  }
}

- (BOOL)invalidatingPlaybackQueue
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __53__MRNowPlayingPlayerClient_invalidatingPlaybackQueue__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 113);
  return result;
}

- (void)setInvalidatingPlaybackQueue:(BOOL)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__42;
  id v13 = __Block_byref_object_dispose__42;
  id v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MRNowPlayingPlayerClient_setInvalidatingPlaybackQueue___block_invoke;
  block[3] = &unk_1E57D9068;
  BOOL v8 = a3;
  void block[4] = self;
  void block[5] = &v9;
  dispatch_sync(serialQueue, block);
  if ([(id)v10[5] count])
  {
    uint64_t v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Sending enqueued contentItemChanges due to finished PlaybackQueueInvalidation", v6, 2u);
    }

    MRMediaRemotePlaybackQueueDataSourceSendContentItemsChangedForPlayer((void *)v10[5], self);
  }
  _Block_object_dispose(&v9, 8);
}

void __57__MRNowPlayingPlayerClient_setInvalidatingPlaybackQueue___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 113))
  {
    *(unsigned char *)(v2 + 113) = v1;
    if (!*(unsigned char *)(a1 + 48))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 144));
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 144);
      *(void *)(v4 + 144) = 0;
    }
  }
}

- (void)setNowPlayingInfo:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MRNowPlayingPlayerClient_setNowPlayingInfo___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __46__MRNowPlayingPlayerClient_setNowPlayingInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 176);

  return [v5 registerNowPlayingInfoBackedPlaybackQueueDataSourceCallbacks];
}

- (NSDictionary)nowPlayingInfo
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MRNowPlayingPlayerClient_nowPlayingInfo__block_invoke;
  v5[3] = &unk_1E57D0590;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __42__MRNowPlayingPlayerClient_nowPlayingInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setNowPlayingArtwork:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MRNowPlayingPlayerClient_setNowPlayingArtwork___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __49__MRNowPlayingPlayerClient_setNowPlayingArtwork___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 176);

  return [v2 registerNowPlayingInfoBackedPlaybackQueueDataSourceCallbacks];
}

- (MRNowPlayingArtwork)nowPlayingArtwork
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MRNowPlayingPlayerClient_nowPlayingArtwork__block_invoke;
  v5[3] = &unk_1E57D0590;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRNowPlayingArtwork *)v3;
}

void __45__MRNowPlayingPlayerClient_nowPlayingArtwork__block_invoke(uint64_t a1)
{
}

- (void)updatePlaybackState:(unsigned int)a3 date:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MRNowPlayingPlayerClient_updatePlaybackState_date___block_invoke;
  block[3] = &unk_1E57D1DC8;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
}

void __53__MRNowPlayingPlayerClient_updatePlaybackState_date___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 48);
  if (*(_DWORD *)(v1 + 72) != v2)
  {
    *(_DWORD *)(v1 + 72) = v2;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  }
}

- (void)setPlayerPath:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MRNowPlayingPlayerClient_setPlayerPath___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __42__MRNowPlayingPlayerClient_setPlayerPath___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) player];
  int v2 = (void *)[v3 copy];
  [*(id *)(*(void *)(a1 + 32) + 160) setPlayer:v2];
}

- (void)updatePlayer:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__MRNowPlayingPlayerClient_updatePlayer___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __41__MRNowPlayingPlayerClient_updatePlayer___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) player];
  id v4 = (id)[v2 copy];

  id v3 = [*(id *)(*(void *)(a1 + 40) + 160) player];
  [v3 mergeFrom:v4];
}

- (unint64_t)capabilities
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MRNowPlayingPlayerClient_capabilities__block_invoke;
  v5[3] = &unk_1E57D0590;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRNowPlayingPlayerClient_capabilities__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88);
  return result;
}

- (MRContentItem)nowPlayingContentItem
{
  int v2 = [(MRNowPlayingPlayerClient *)self playbackQueue];
  unint64_t v3 = [v2 contentItemWithOffset:0];
  id v4 = (void *)[v3 copy];

  return (MRContentItem *)v4;
}

- (BOOL)isPictureInPictureEnabled
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MRNowPlayingPlayerClient_isPictureInPictureEnabled__block_invoke;
  v5[3] = &unk_1E57D0590;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__MRNowPlayingPlayerClient_isPictureInPictureEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 112);
  return result;
}

- (void)setPictureInPictureEnabled:(BOOL)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MRNowPlayingPlayerClient_setPictureInPictureEnabled___block_invoke;
  block[3] = &unk_1E57D1CB0;
  void block[4] = self;
  BOOL v11 = a3;
  dispatch_sync(serialQueue, block);
  playerPath = self->_playerPath;
  id v12 = @"kMRNowPlayingPlayerPathUserInfoKey";
  v13[0] = playerPath;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  char v7 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v8 = [v7 notificationClient];
  char v9 = MRCreateDecodedUserInfo(v6);
  [v8 dispatchNotification:@"kMRMediaRemotePlayerPictureInPictureDidChange" userInfo:v9 object:0];
}

uint64_t __55__MRNowPlayingPlayerClient_setPictureInPictureEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 112) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setActiveRequestedDate:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MRNowPlayingPlayerClient_setActiveRequestedDate___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __51__MRNowPlayingPlayerClient_setActiveRequestedDate___block_invoke(uint64_t a1)
{
}

- (void)preProcessChangePlaybackRateCommandWithOptions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke;
    v27[3] = &unk_1E57D9090;
    id v5 = v3;
    id v28 = v5;
    id v6 = (void *)MEMORY[0x1997190F0](v27);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_2;
    v26[3] = &unk_1E57D90B8;
    v26[4] = a1;
    char v7 = (void (**)(void))MEMORY[0x1997190F0](v26);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_3;
    v25[3] = &unk_1E57D90E0;
    void v25[4] = a1;
    id v8 = (void (**)(void))MEMORY[0x1997190F0](v25);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_4;
    v22[3] = &unk_1E57D9108;
    id v9 = v5;
    id v23 = v9;
    id v10 = v6;
    id v24 = v10;
    BOOL v11 = (float (**)(void, void, void))MEMORY[0x1997190F0](v22);
    id v12 = [v9 objectForKeyedSubscript:@"kMRMediaRemoteOptionPlaybackRate"];
    [v12 floatValue];
    float v14 = v13;
    id v15 = [v9 objectForKeyedSubscript:@"kMRMediaRemoteOptionPredefinedPlaybackRate"];
    if (v15)
    {
      id v21 = v4;
      long long v17 = v7[2](v7);
      [v17 floatValue];
      if (v18 == 0.0)
      {
        float v14 = (*((float (**)(id, uint64_t))v10 + 2))(v10, [v15 intValue]);
      }
      else
      {
        id v19 = v8[2](v8);
        float v14 = ((float (**)(void, void *, void *))v11)[2](v11, v17, v19);
      }
      id v4 = v21;
    }
    *(float *)&double v16 = v14;
    id v20 = [NSNumber numberWithFloat:v16];
    [v9 setObject:v20 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackRate"];
  }
}

float __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    float v2 = 0.0;
    if (a2 == 1) {
      float v2 = 2.0;
    }
    if (a2 == 2) {
      return 0.5;
    }
    else {
      return v2;
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"];
    id v5 = v4;
    if (v4)
    {
      [v4 floatValue];
      float v3 = v6;
    }
    else
    {
      float v3 = 1.0;
    }
  }
  return v3;
}

id __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  float v2 = [*(id *)(a1 + 32) nowPlayingContentItem];
  *(float *)&double v3 = MRContentItemGetPlaybackRate(v2);
  id v4 = [v1 numberWithFloat:v3];

  return v4;
}

id __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 48);
  float v2 = (void *)[v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v5, "command", (void)v9) == 19)
        {
          float v6 = [v5 options];
          char v7 = [v6 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackRates"];

          float v2 = [v7 sortedArrayUsingSelector:sel_compare_];

          goto LABEL_11;
        }
      }
      float v2 = (void *)[v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

float __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"];
  int v8 = [v7 intValue];
  if (v8 == 2)
  {
    [v5 floatValue];
    float v9 = v10;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    objc_msgSend(v6, "reverseObjectEnumerator", 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
LABEL_7:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v15) floatValue];
        if (v9 > v16) {
          goto LABEL_23;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v13) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v8 == 1)
  {
    [v5 floatValue];
    float v9 = v17;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v6;
    uint64_t v18 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
LABEL_16:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v21) floatValue];
        if (v9 < v16) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v19) {
            goto LABEL_16;
          }
          goto LABEL_24;
        }
      }
LABEL_23:
      float v9 = v16;
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  float v9 = 0.0;
  if (!v8) {
    float v9 = (*(float (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_25:

  return v9;
}

- (unsigned)resolveCommand:(unsigned int)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  unsigned int v13 = a3;
  if (MRMediaRemoteCommandIsContextual(a3))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__MRNowPlayingPlayerClient_resolveCommand___block_invoke;
    block[3] = &unk_1E57D9130;
    unsigned int v9 = a3;
    void block[4] = self;
    void block[5] = &v10;
    dispatch_sync(serialQueue, block);
  }
  unsigned int v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __43__MRNowPlayingPlayerClient_resolveCommand___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(*(void *)(a1 + 32) + 40) nowPlayingInfo];
  id v9 = v2;
  if (v2)
  {
    uint64_t v3 = [v2 objectForKey:@"kMRMediaRemoteNowPlayingInfoTotalChapterCount"];
    BOOL v4 = (int)[v3 intValue] > 1;

    float v2 = v9;
  }
  else
  {
    BOOL v4 = 0;
  }
  int v5 = *(_DWORD *)(a1 + 48);
  if (v5 == 110)
  {
    int v6 = 5;
    if (v4)
    {
      BOOL v7 = MRMediaRemoteSupportsCommand(*(void **)(*(void *)(a1 + 32) + 48), 110) == 0;
      float v2 = v9;
      int v8 = 101;
LABEL_10:
      if (!v7) {
        int v6 = v8;
      }
    }
  }
  else
  {
    if (v5 != 109) {
      goto LABEL_13;
    }
    int v6 = 4;
    if (v4)
    {
      BOOL v7 = MRMediaRemoteSupportsCommand(*(void **)(*(void *)(a1 + 32) + 48), 109) == 0;
      float v2 = v9;
      int v8 = 100;
      goto LABEL_10;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
LABEL_13:
}

- (id)resolveCommandOptions:(unsigned int)a3 options:(id)a4
{
  int v6 = (void *)[a4 mutableCopy];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MRNowPlayingPlayerClient_resolveCommandOptions_options___block_invoke;
  block[3] = &unk_1E57D1DC8;
  unsigned int v14 = a3;
  void block[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(serialQueue, block);
  id v9 = v13;
  id v10 = v8;

  return v10;
}

uint64_t __58__MRNowPlayingPlayerClient_resolveCommandOptions_options___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) == 19) {
    -[MRNowPlayingPlayerClient preProcessChangePlaybackRateCommandWithOptions:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)hasReceivedCommandRecently
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRNowPlayingPlayerClient_hasReceivedCommandRecently__block_invoke;
  v5[3] = &unk_1E57D0590;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__54__MRNowPlayingPlayerClient_hasReceivedCommandRecently__block_invoke(uint64_t a1)
{
  double result = *(void **)(*(void *)(a1 + 32) + 96);
  if (result)
  {
    double result = (void *)[result timeIntervalSinceNow];
    BOOL v4 = fabs(v3) < 5.0;
  }
  else
  {
    BOOL v4 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (void)setHomeUserIdentifier:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MRNowPlayingPlayerClient_setHomeUserIdentifier___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __50__MRNowPlayingPlayerClient_setHomeUserIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", *(void *)(a1 + 40), 0);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 152);
  *(void *)(v3 + 152) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)appendHomeUserIdentifier:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MRNowPlayingPlayerClient_appendHomeUserIdentifier___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __53__MRNowPlayingPlayerClient_appendHomeUserIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 152);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 152);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void)clearHomeUserIdentifiers
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRNowPlayingPlayerClient_clearHomeUserIdentifiers__block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __52__MRNowPlayingPlayerClient_clearHomeUserIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 152);
  *(void *)(v1 + 152) = 0;
}

- (void)restoreNowPlayingClientState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke_2;
  v4[3] = &unk_1E57D9178;
  v4[4] = self;
  [(MRNowPlayingPlayerClient *)self flushPendingPlaybackSessionMigrateEvents:v4];
}

void __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    id v3 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetCanBeNowPlayingAppForPlayer(v3, 1, *(void **)(*(void *)(a1 + 32) + 160), *(double *)(*(void *)(a1 + 32) + 32));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 88))
  {
    uint64_t v4 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingPlaybackQueueCapabilities(v4, *(void **)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 88), 0, 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 40))
  {
    int v5 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingPlaybackQueue(v5, *(void **)(*(void *)(a1 + 32) + 160), *(void **)(*(void *)(a1 + 32) + 40), 0, 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 48))
  {
    uint64_t v6 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetSupportedCommands(v6, *(void *)(*(void *)(a1 + 32) + 48), *(void **)(*(void *)(a1 + 32) + 160), 0, 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(_DWORD *)(v2 + 72))
  {
    BOOL v7 = (void *)MRGetSharedService();
    uint64_t v8 = *(void *)(a1 + 32);
    char v9 = *(void **)(v8 + 160);
    unsigned int v10 = *(_DWORD *)(v8 + 72);
    [*(id *)(v8 + 80) timeIntervalSinceReferenceDate];
    MRMediaRemoteServiceSetPlaybackState(v7, v9, v10, 0, 0, v11);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 112))
  {
    uint64_t v12 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetPictureInPictureEnabledForPlayer(v12, *(void **)(*(void *)(a1 + 32) + 160), *(unsigned __int8 *)(*(void *)(a1 + 32) + 112), 0, 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v14 = [*(id *)(v2 + 160) player];
  if ([v14 hasAuxiliaryProperties])
  {
    id v13 = (void *)MRGetSharedService();
    MRMediaRemoteServiceUpdatePlayerProperties(v13, *(void **)(*(void *)(a1 + 32) + 160), 0, 0);
  }
}

void __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 176);
  id v3 = a2;
  int v5 = [v2 playbackSessionMigrateEndCallback];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:1 format:@"mediaremoted exited in the middle of a migration attempt"];
  v5[2](v5, v3, v4, &__block_literal_global_96);
}

void __79__MRNowPlayingPlayerClient__onQueue_cacheContentItemChangesForPendingRequests___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = v21;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              id v14 = [v13 item];
              int IsEqual = MRContentItemIdentifierIsEqual(v7, v14);

              if (IsEqual)
              {
                float v16 = [v13 request];
                float v17 = MRContentItemCreateFromRequest(v7, v16);

                uint64_t v18 = [v13 item];
                MRContentItemMerge(v18, v17);

                goto LABEL_16;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }
}

- (void)clearCachedContentItemArtworkForItems:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 136);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke_2;
  v2[3] = &unk_1E57D3050;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = v19;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              id v14 = [v13 item];
              int IsEqual = MRContentItemIdentifierIsEqual(v7, v14);

              if (IsEqual)
              {
                float v16 = [v13 item];
                MRContentItemSetArtworkData(v16, 0);

                goto LABEL_16;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
}

- (void)addPendingPlaybackSessionMigrateEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MRNowPlayingPlayerClient.m", 632, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  id v6 = [v5 requestIdentifier];

  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MRNowPlayingPlayerClient.m", 633, @"Invalid parameter not satisfying: %@", @"request.requestIdentifier" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingPlayerClient_addPendingPlaybackSessionMigrateEvent___block_invoke;
  block[3] = &unk_1E57D0790;
  void block[4] = self;
  id v12 = v5;
  id v8 = v5;
  dispatch_sync(serialQueue, block);
}

void __66__MRNowPlayingPlayerClient_addPendingPlaybackSessionMigrateEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [v6 requestIdentifier];
  [v2 setObject:v6 forKeyedSubscript:v7];
}

- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MRNowPlayingPlayerClient.m", 647, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  id v6 = [v5 requestIdentifier];

  if (!v6)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MRNowPlayingPlayerClient.m", 648, @"Invalid parameter not satisfying: %@", @"request.requestIdentifier" object file lineNumber description];
  }
  uint64_t v16 = 0;
  float v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MRNowPlayingPlayerClient_removePendingPlaybackSessionMigrateEvent___block_invoke;
  block[3] = &unk_1E57D3118;
  void block[4] = self;
  id v14 = v5;
  uint64_t v15 = &v16;
  id v8 = v5;
  dispatch_sync(serialQueue, block);
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __69__MRNowPlayingPlayerClient_removePendingPlaybackSessionMigrateEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  id v3 = [*(id *)(a1 + 40) requestIdentifier];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 128);
    id v6 = [*(id *)(a1 + 40) requestIdentifier];
    [v5 setObject:0 forKeyedSubscript:v6];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__42;
    char v19 = __Block_byref_object_dispose__42;
    id v20 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MRNowPlayingPlayerClient_flushPendingPlaybackSessionMigrateEvents___block_invoke;
    block[3] = &unk_1E57D0590;
    void block[4] = self;
    void block[5] = &v15;
    dispatch_sync(serialQueue, block);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = (id)v16[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(&v15, 8);
  }
}

uint64_t __69__MRNowPlayingPlayerClient_flushPendingPlaybackSessionMigrateEvents___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 128);

  return [v5 removeAllObjects];
}

- (void)invalidatePlaybackQueue
{
  kdebug_trace();
  [(MRNowPlayingPlayerClient *)self setInvalidatingPlaybackQueue:1];
  uint64_t v3 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];
  id v6 = [@"PlaybackQueueInvalidation-" stringByAppendingString:v5];
  [v3 setRequestIdentifier:v6];

  playerPath = self->_playerPath;
  uint64_t v8 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v9 = [v8 playbackQueueDispatchQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__MRNowPlayingPlayerClient_invalidatePlaybackQueue__block_invoke;
  v10[3] = &unk_1E57D2738;
  v10[4] = self;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v3, playerPath, v9, v10);
}

uint64_t __51__MRNowPlayingPlayerClient_invalidatePlaybackQueue__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) invalidatePlaybackQueueWithPlaybackQueue:a2];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setInvalidatingPlaybackQueue:0];
}

- (void)_onQueue_enqueueContentItemChangesForPendingPlaybackQueueInvalidation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (!*(unsigned char *)(a1 + 113))
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel__onQueue_enqueueContentItemChangesForPendingPlaybackQueueInvalidation_ object:a1 file:@"MRNowPlayingPlayerClient.m" lineNumber:800 description:@"Cannot enqueue contentItemChanges when the playback queue is not invalidating"];
    }
    uint64_t v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Enqueing contentItemChange due to pending PlaybackQueueInvalidation", v8, 2u);
    }

    if ([v3 count] && !*(void *)(a1 + 144))
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;
    }
    [*(id *)(a1 + 144) addObjectsFromArray:v3];
  }
}

id __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v2 = MRMediaRemoteCopyCommandDescription([a2 intValue]);

  return v2;
}

id __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v2 = MRMediaRemoteCopyCommandDescription([a2 intValue]);

  return v2;
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void (**)(void, void))v3;
  if (a1[4])
  {
    if (!MRMediaRemoteCommandInfoSupportedCommandIsEnabled(a1[5], 133))
    {
      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      long long v28 = MRMediaRemoteCopyCommandDescription(133);
      long long v29 = [a1[6] playerPath];
      id v5 = (id)[v27 initWithMRError:3, @"%@ not supported and/or enabled for %@", v28, v29 format];

      ((void (**)(void, id))v4)[2](v4, v5);
LABEL_14:

      goto LABEL_15;
    }
    [a1[7] startEvent:@"setPlaybackSession"];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = [NSString alloc];
    uint64_t v7 = [a1[7] requestID];
    uint64_t v8 = (void *)[v6 initWithFormat:@"migrationPlaybackSession<%@>", v7];
    [v5 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    uint64_t v9 = [a1[4] data];
    [v5 setObject:v9 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackSessionData"];

    long long v10 = [a1[7] contentItem];
    uint64_t v11 = [v10 identifier];
    if (v11)
    {
      long long v12 = (void *)v11;
      long long v13 = [a1[7] contentItem];
      id v14 = [v13 metadata];
      char v15 = [v14 isAlwaysLive];

      if (v15)
      {
LABEL_7:
        [a1[7] playbackPosition];
        if (v17 > 0.0)
        {
          uint64_t v18 = NSNumber;
          [a1[7] playbackPosition];
          char v19 = objc_msgSend(v18, "numberWithDouble:");
          [v5 setObject:v19 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackPosition"];
        }
        [a1[7] playbackRate];
        if (v20 > 0.0)
        {
          long long v21 = NSNumber;
          [a1[7] playbackRate];
          uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
          [v5 setObject:v22 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackRate"];
        }
        long long v23 = [a1[7] requestID];
        [v5 setObject:v23 forKeyedSubscript:@"kMRMediaRemoteOptionContextID"];

        long long v24 = a1[6];
        long long v25 = (void *)v24[20];
        long long v26 = (void *)v24[1];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2;
        v30[3] = &unk_1E57D3900;
        id v31 = a1[7];
        uint64_t v32 = v4;
        MRMediaRemoteSendCommandToPlayer(133, v5, v25, 0, v26, v30);

        goto LABEL_14;
      }
      long long v10 = [a1[7] contentItem];
      uint64_t v16 = [v10 identifier];
      [v5 setObject:v16 forKeyedSubscript:@"kMRMediaRemoteOptionContentItemID"];
    }
    goto LABEL_7;
  }
  (*((void (**)(id, void))v3 + 2))(v3, 0);
LABEL_15:
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"setPlaybackSession" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3(id *a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] contentItem];

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = [a1[4] contentItem];
  id v6 = [v5 metadata];
  int v7 = [v6 isAlwaysLive];

  if (v7
    || ([a1[4] contentItem],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [a1[5] nowPlayingContentItem],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int IsEqual = MRContentItemIdentifierIsEqual(v8, v9),
        v9,
        v8,
        IsEqual)
    || !MRMediaRemoteCommandInfoSupportedCommandIsEnabled(a1[6], 131))
  {
LABEL_6:
    v3[2](v3, 0);
  }
  else
  {
    [a1[4] startEvent:@"playItemInQueue"];
    uint64_t v11 = [MRPlaybackQueueRequest alloc];
    long long v12 = [a1[4] contentItem];
    long long v13 = [v12 identifier];
    v24[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    char v15 = [(MRPlaybackQueueRequest *)v11 initWithIdentifiers:v14];

    uint64_t v16 = a1[5];
    uint64_t v17 = v16[20];
    uint64_t v18 = v16[1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4;
    v20[3] = &unk_1E57D9210;
    id v21 = a1[4];
    char v19 = v3;
    id v22 = a1[5];
    id v23 = v19;
    MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v15, v17, v18, v20);
  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5;
  v25[3] = &unk_1E57D1DA0;
  id v26 = *(id *)(a1 + 32);
  id v27 = *(id *)(a1 + 48);
  id v4 = a2;
  id v5 = (void (**)(void, void))MEMORY[0x1997190F0](v25);
  id v6 = [*(id *)(a1 + 32) contentItem];
  int v7 = [v6 identifier];
  uint64_t v8 = [v4 contentItemForIdentifier:v7];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v10 = [NSString alloc];
    uint64_t v11 = [*(id *)(a1 + 32) requestID];
    long long v12 = (void *)[v10 initWithFormat:@"migrationPlaybackSession<%@>", v11];
    [v9 setObject:v12 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    long long v13 = [*(id *)(a1 + 32) contentItem];
    id v14 = [v13 identifier];
    [v9 setObject:v14 forKeyedSubscript:@"kMRMediaRemoteOptionContentItemID"];

    char v15 = [*(id *)(a1 + 32) requestID];
    [v9 setObject:v15 forKeyedSubscript:@"kMRMediaRemoteOptionContextID"];

    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void **)(v16 + 160);
    uint64_t v18 = *(void **)(v16 + 8);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_6;
    v23[3] = &unk_1E57D4D40;
    long long v24 = v5;
    MRMediaRemoteSendCommandToPlayer(131, v9, v17, 0, v18, v23);
    ErrorWithDescription = v24;
  }
  else
  {
    id v20 = [NSString alloc];
    id v21 = [*(id *)(a1 + 32) contentItem];
    id v22 = MRContentItemCopyMinimalReadableDescription(v21);
    id v9 = (id)[v20 initWithFormat:@"ContentItemID %@ was not found in the playbackQueue for %@", v22, *(void *)(*(void *)(a1 + 40) + 160)];

    ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(2, (uint64_t)v9);
    ((void (**)(void, void *))v5)[2](v5, ErrorWithDescription);
  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"playItemInQueue" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) playbackPosition];
  if (v4 == 0.0 || !MRMediaRemoteCommandInfoSupportedCommandIsEnabled(*(void **)(a1 + 40), 24))
  {
    v3[2](v3, 0);
  }
  else
  {
    [*(id *)(a1 + 32) startEvent:@"seek"];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = NSNumber;
    [*(id *)(a1 + 32) playbackPosition];
    int v7 = objc_msgSend(v6, "numberWithDouble:");
    [v5 setObject:v7 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackPosition"];

    id v8 = [NSString alloc];
    id v9 = [*(id *)(a1 + 32) requestID];
    id v10 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(16);
    uint64_t v11 = (void *)[v8 initWithFormat:@"migrationPlaybackSession<%@> for option %@", v9, v10];
    [v5 setObject:v11 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    long long v12 = [*(id *)(a1 + 32) requestID];
    [v5 setObject:v12 forKeyedSubscript:@"kMRMediaRemoteOptionContextID"];

    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = *(void **)(v13 + 160);
    char v15 = *(void **)(v13 + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_8;
    v16[3] = &unk_1E57D3900;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = v3;
    MRMediaRemoteSendCommandToPlayer(24, v5, v14, 0, v15, v16);
  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"seek" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) playbackRate];
  if (v4 == 0.0
    || ([*(id *)(a1 + 32) playbackRate], v5 == 1.0)
    || !MRMediaRemoteCommandInfoSupportedCommandIsEnabled(*(void **)(a1 + 40), 19))
  {
    v3[2](v3, 0);
  }
  else
  {
    [*(id *)(a1 + 32) startEvent:@"setRate"];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v7 = NSNumber;
    [*(id *)(a1 + 32) playbackRate];
    id v8 = objc_msgSend(v7, "numberWithDouble:");
    [v6 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackRate"];

    id v9 = [NSString alloc];
    id v10 = [*(id *)(a1 + 32) requestID];
    uint64_t v11 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(32);
    long long v12 = (void *)[v9 initWithFormat:@"migrationPlaybackSession<%@> for option %@", v10, v11];
    [v6 setObject:v12 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    uint64_t v13 = [*(id *)(a1 + 32) requestID];
    [v6 setObject:v13 forKeyedSubscript:@"kMRMediaRemoteOptionContextID"];

    uint64_t v14 = *(void *)(a1 + 48);
    char v15 = *(void **)(v14 + 160);
    uint64_t v16 = *(void **)(v14 + 8);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_10;
    v17[3] = &unk_1E57D3900;
    id v18 = *(id *)(a1 + 32);
    char v19 = v3;
    MRMediaRemoteSendCommandToPlayer(19, v6, v15, 0, v16, v17);
  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"setRate" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) allowFadeTransition])
  {
    [*(id *)(a1 + 32) startEvent:@"requestFadeInOnDestination"];
    id v4 = [[MRNowPlayingRequest alloc] initWithPlayerPath:*(void *)(*(void *)(a1 + 40) + 160)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12;
    v6[3] = &unk_1E57D1DA0;
    id v7 = *(id *)(a1 + 32);
    id v8 = v3;
    [(MRNowPlayingRequest *)v4 triggerAudioFadeInWithReplyQueue:v5 completion:v6];
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12_cold_1((uint64_t)v3, v4);
    }
  }
  [*(id *)(a1 + 32) endEvent:@"requestFadeInOnDestination"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) playbackState] == 1
    && MRMediaRemoteCommandInfoSupportedCommandIsEnabled(*(void **)(a1 + 40), 0))
  {
    [*(id *)(a1 + 32) startEvent:@"play"];
    if (([*(id *)(a1 + 32) playerOptions] & 4) != 0) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 2;
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = [NSString alloc];
    id v7 = [*(id *)(a1 + 32) requestID];
    id v8 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(v4);
    id v9 = (void *)[v6 initWithFormat:@"migrationPlaybackSession<%@> for option %@", v7, v8];
    [v5 setObject:v9 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    id v10 = [*(id *)(a1 + 32) requestID];
    [v5 setObject:v10 forKeyedSubscript:@"kMRMediaRemoteOptionContextID"];

    uint64_t v11 = *(void *)(a1 + 48);
    long long v12 = *(void **)(v11 + 160);
    uint64_t v13 = *(void **)(v11 + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2_108;
    v14[3] = &unk_1E57D3900;
    id v15 = *(id *)(a1 + 32);
    id v16 = v3;
    MRMediaRemoteSendCommandToPlayer(0, v5, v12, 0, v13, v14);
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2_108(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"play" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3_109(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startEvent:@"resetOutputContext"];
  id v4 = [MRRequestDetails alloc];
  id v5 = [*(id *)(a1 + 32) requestID];
  id v6 = [(MRRequestDetails *)v4 initWithInitiator:@"RoutePicker" requestID:v5 reason:@"resetOutputContext"];

  id v7 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v6 type:3 outputDeviceUIDs:0];
  [(MRGroupTopologyModificationRequest *)v7 setShouldClearPredictedRoutes:1];
  if (([*(id *)(a1 + 32) endpointOptions] & 4) == 0) {
    [(MRGroupTopologyModificationRequest *)v7 setShouldModifyPredictedRoutes:1];
  }
  id v8 = [*(id *)(a1 + 40) playerPath];
  id v9 = [v8 origin];
  id v10 = +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:v9];

  uint64_t v11 = MRCreateXPCMessage(0x300000000000028uLL);
  long long v12 = [(MRGroupTopologyModificationRequest *)v7 data];
  MRAddDataToXPCMessage(v11, v12, "MRXPC_CONTEXT_MODIFICATION_DATA_KEY");

  uint64_t v13 = [v10 routingContextID];
  MRAddStringToXPCMessage(v11, v13, "MRXPC_ROUTING_CONTEXT_UID_KEY");

  uint64_t v14 = [*(id *)(a1 + 32) requestID];
  MRAddStringToXPCMessage(v11, v14, "MRXPC_MESSAGE_CUSTOM_ID_KEY");

  id v15 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v16 = [v15 service];
  id v17 = [v16 mrXPCConnection];
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4_119;
  v20[3] = &unk_1E57D9260;
  id v21 = *(id *)(a1 + 32);
  id v22 = v3;
  id v19 = v3;
  [v17 sendMessage:v11 queue:v18 reply:v20];
}

uint64_t __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4_119(uint64_t a1)
{
  [*(id *)(a1 + 32) endEvent:@"resetOutputContext" withError:0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5_121(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (id)description
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__42;
  id v8 = __Block_byref_object_dispose__42;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __39__MRNowPlayingPlayerClient_description__block_invoke(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)MRNowPlayingPlayerClient;
  id v2 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v3 = [v2 stringByAppendingFormat:@"PlayerPath: %@ Supported Commands: %@ PlaybackQueue %@", *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 48), *(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)debugDescription
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__42;
  id v8 = __Block_byref_object_dispose__42;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __44__MRNowPlayingPlayerClient_debugDescription__block_invoke(uint64_t a1)
{
  long long v28 = NSString;
  long long v29 = *(void **)(a1 + 32);
  id v2 = (void *)v29[20];
  uint64_t v30 = [v2 player];
  id v27 = MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(void *)(a1 + 32) + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v25 = *(void *)(v4 + 64);
  id v26 = (void *)v3;
  id v5 = MRMediaRemoteCopyPlaybackStateDescription(*(_DWORD *)(v4 + 72));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(v6 + 80);
  long long v24 = v5;
  id v7 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(v6 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 88);
  id v10 = @"NO";
  if (*(unsigned char *)(v8 + 113)) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  uint64_t v12 = *(void *)(v8 + 120);
  uint64_t v13 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(v8 + 136));
  uint64_t v14 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v14 + 112)) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  id v16 = [MEMORY[0x1E4F28C10] localizedStringFromDate:*(void *)(v14 + 104) dateStyle:2 timeStyle:2];
  uint64_t v17 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v17 + 24)) {
    id v10 = @"YES";
  }
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(v17 + 32)];
  objc_msgSend(v28, "stringWithFormat:", @"    playerPath = %@\n    player = %@\n    supportedCommands = %@\n    nowPlayingInfo = %@\n    nowPlayingArtwork = %@\n    playbackState = %@\n    playbackStateDate= %@\n    playbackQueue = %@\n    capabilities = %ld\n    triggerInvalidation = %@\n    invalidatationTimestamp = %lf\n    cachedContentItemUpdates = %@\n    pictureInPictureEnabled = %@\n    activeRequestDate = %@\n    canBeNowPlaying = %@\n    canBeNowPlayingTimestamp = %@\n    homeUserIdentifiers = %@", v2, v30, v27, v26, v25, v24, v23, v7, v9, v11, v12, v13, v15, v16, v10, v18,
  id v19 = *(void *)(*(void *)(a1 + 32) + 152));
  uint64_t v20 = MRCreateFormattedDebugDescriptionFromClass(v29, v19);
  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCallbacks, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_enqueuedContentItemChangesForPendingPlaybackQueueInvalidation, 0);
  objc_storeStrong((id *)&self->_cachedContentItemChangedForPendingPlaybackQueueRequest, 0);
  objc_storeStrong((id *)&self->_pendingPlaybackSessionMigrateEvents, 0);
  objc_storeStrong((id *)&self->_activeRequestedDate, 0);
  objc_storeStrong((id *)&self->_lastReceivedCommandDate, 0);
  objc_storeStrong((id *)&self->_playbackStateDate, 0);
  objc_storeStrong((id *)&self->_nowPlayingArtwork, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_replayQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 48) minimalReadableDescription];
  uint64_t v5 = *(void *)(a1 + 56);
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRNowPlayingPlayerClient] Attempting to update playbackQueue response %@ without a pending request %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)sendContentItemChanges:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClient] Attempting to send contentItemChange for path %{public}@ %@", buf, 0x16u);
}

- (void)setSupportedCommands:(uint64_t *)a1 queue:(NSObject *)a2 completion:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = @"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_194F3C000, a2, OS_LOG_TYPE_DEBUG, "Sending short circuted notification %@ for %@", (uint8_t *)&v3, 0x16u);
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRNowPlayingPlayerClient] Fade in trigger failed with error %@", (uint8_t *)&v2, 0xCu);
}

@end