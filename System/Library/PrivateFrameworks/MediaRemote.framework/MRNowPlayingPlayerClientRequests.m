@interface MRNowPlayingPlayerClientRequests
- (MRNowPlayingPlayerClientRequests)initWithPlayerPath:(id)a3;
- (MRPlaybackQueue)playbackQueue;
- (MRPlaybackQueueSubscriptionController)subscriptionController;
- (MRPlayer)playerProperties;
- (MRPlayerPath)playerPath;
- (NSArray)supportedCommands;
- (id)debugDescription;
- (uint64_t)_onSerialQueue_updatePlaybackQueueIfUninitialized:(void *)a1;
- (uint64_t)_onSerialQueue_updateSupportedCommandsIfUninitialized:(void *)a1;
- (unsigned)playbackState;
- (void)_handleEnqueuedPlaybackQueueRequest:(void *)a3 completion:;
- (void)dealloc;
- (void)enqueuePlaybackQueueRequest:(id)a3 completion:(id)a4;
- (void)handlePlaybackStateRequestWithCompletion:(id)a3;
- (void)handlePlayerPropertiesRequestWithCompletion:(id)a3;
- (void)handleSupportedCommandsRequestWithCompletion:(id)a3;
- (void)restoreNowPlayingClientState;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackState:(unsigned int)a3;
- (void)setPlayerProperties:(id)a3;
- (void)setSupportedCommands:(id)a3;
- (void)updateContentItemArtwork:(id)a3;
- (void)updateContentItems:(id)a3;
- (void)updatePlaybackQueue:(uint64_t)a1;
- (void)updatePlaybackQueueIfUninitialized:(id)a3;
- (void)updatePlaybackStateIfUninitialized:(unsigned int)a3;
- (void)updateSupportedCommandsIfUninitialized:(id)a3;
@end

@implementation MRNowPlayingPlayerClientRequests

- (void)setSupportedCommands:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

void __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    -[MRNowPlayingPlayerClientRequests updatePlaybackQueue:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

- (void)updatePlaybackQueue:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__MRNowPlayingPlayerClientRequests_updatePlaybackQueue___block_invoke;
    v6[3] = &unk_1E57D0790;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

void __56__MRNowPlayingPlayerClientRequests_updatePlaybackQueue___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3[1])
  {
    id v8 = [v2 contentItems];
    objc_msgSend(v3, "updateContentItems:");
  }
  else if (v2 && [v2 hasLocation])
  {
    id v4 = [*(id *)(a1 + 40) contentItemWithOffset:0];
    if (v4)
    {
      v5 = [MRPlaybackQueue alloc];
      v9[0] = v4;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      id v7 = [(MRPlaybackQueue *)v5 initWithContentItems:v6 location:0 withPropertiesFromPlaybackQueue:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) setPlaybackQueue:v7];
    }
  }
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRPlaybackQueueSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)handlePlaybackStateRequestWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MRNowPlayingPlayerClientRequests.m", 350, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke;
  block[3] = &unk_1E57D03B0;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

- (MRPlaybackQueue)playbackQueue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__39;
  id v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRNowPlayingPlayerClientRequests_playbackQueue__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlaybackQueue *)v3;
}

- (MRNowPlayingPlayerClientRequests)initWithPlayerPath:(id)a3
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MRNowPlayingPlayerClientRequests;
  id v7 = [(MRNowPlayingPlayerClientRequests *)&v20 init];
  if (v7)
  {
    if (([v6 isResolved] & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v7, @"MRNowPlayingPlayerClientRequests.m", 45, @"Trying to instantiate an unresolved MRNowPlayingPlayerClientRequests %@", v6 object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_playerPath, a3);
    uint64_t v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(Name, v10);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MRNowPlayingPlayerClientRequests.response", v13);
    responseQueue = v7->_responseQueue;
    v7->_responseQueue = (OS_dispatch_queue *)v14;

    v16 = [[MRPlaybackQueueSubscriptionController alloc] initWithPlayerPath:v6];
    subscriptionController = v7->_subscriptionController;
    v7->_subscriptionController = v16;
  }
  return v7;
}

- (void)enqueuePlaybackQueueRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke;
  block[3] = &unk_1E57D3F90;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

uint64_t __49__MRNowPlayingPlayerClientRequests_playbackQueue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackQueue___block_invoke(uint64_t a1)
{
  v2 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__MRNowPlayingPlayerClientRequests_setPlaybackQueue___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;
}

void __57__MRNowPlayingPlayerClientRequests_setSupportedCommands___block_invoke(uint64_t a1)
{
  v2 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__MRNowPlayingPlayerClientRequests_setSupportedCommands___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;
}

- (void)updateContentItems:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackState___block_invoke(uint64_t a1)
{
  v2 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__MRNowPlayingPlayerClientRequests_setPlaybackState___block_invoke_cold_1(a1, v2);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 16) = *(_DWORD *)(a1 + 40);
}

void __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke_2(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    -[MRNowPlayingPlayerClientRequests _handleEnqueuedPlaybackQueueRequest:completion:]((uint64_t)WeakRetained, a1[4], a1[5]);
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(1);
    id v3 = (void (**)(void *, void, void *))a1[5];
    if (v3) {
      v3[2](v3, 0, Error);
    }
  }
}

- (void)_handleEnqueuedPlaybackQueueRequest:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__39;
    v36 = __Block_byref_object_dispose__39;
    id v37 = 0;
    id v7 = [(id)a1 playbackQueue];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__39;
    v30 = __Block_byref_object_dispose__39;
    MRPlaybackQueueCreateFromCache(v7, v5, 0, *(void **)(a1 + 104));
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v27[5])
    {
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      char v25 = 1;
      id v9 = (void *)MRGetSharedService();
      id v10 = *(void **)(a1 + 104);
      dispatch_queue_t v11 = *(void **)(a1 + 48);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke;
      v19[3] = &unk_1E57D8D90;
      v22 = &v26;
      v23 = &v32;
      v21 = v24;
      v19[4] = a1;
      id v12 = v8;
      objc_super v20 = v12;
      MRMediaRemoteServiceRequestNowPlayingPlaybackQueue(v9, v5, v10, v11, v19);
      dispatch_time_t v13 = dispatch_time(0, 3000000000);
      if (dispatch_semaphore_wait(v12, v13))
      {
        id v14 = *(NSObject **)(a1 + 48);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2;
        v15[3] = &unk_1E57D43F8;
        v17 = v24;
        id v16 = v5;
        v18 = &v32;
        dispatch_sync(v14, v15);
      }
      _Block_object_dispose(v24, 8);

      if (!v6) {
        goto LABEL_9;
      }
    }
    v6[2](v6, v27[5], v33[5]);
LABEL_9:
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
}

void __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke(id *a1)
{
  v2 = (void *)[a1[4] copy];
  int v3 = [v2 containsNonDefaultAssets];
  id v4 = a1[5];
  if (v3)
  {
    id v5 = (void *)v4[12];
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      id v7 = a1[5];
      dispatch_semaphore_t v8 = (void *)v7[12];
      v7[12] = v6;
      uint64_t v9 = 96;
LABEL_6:

      [*(id *)((char *)a1[5] + v9) setMaxConcurrentOperationCount:1];
      id v5 = *(void **)((char *)a1[5] + v9);
    }
  }
  else
  {
    id v5 = (void *)v4[11];
    if (!v5)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      dispatch_queue_t v11 = a1[5];
      dispatch_semaphore_t v8 = (void *)v11[11];
      v11[11] = v10;
      uint64_t v9 = 88;
      goto LABEL_6;
    }
  }
  id v12 = v5;
  objc_initWeak(&location, a1[5]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke_2;
  v14[3] = &unk_1E57D8D68;
  objc_copyWeak(&v17, &location);
  id v13 = v2;
  id v15 = v13;
  id v16 = a1[6];
  [v12 addOperationWithBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 16))
  {
    int v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(v2 + 72);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 72);
      *(void *)(v6 + 72) = v5;

      id v4 = *(void **)(*(void *)(a1 + 32) + 72);
    }
    dispatch_semaphore_t v8 = (void *)[*(id *)(a1 + 40) copy];
    uint64_t v9 = (void *)MEMORY[0x1997190F0]();
    [v4 addObject:v9];

    if ([*(id *)(*(void *)(a1 + 32) + 72) count] == 1)
    {
      id v10 = (void *)MRGetSharedService();
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 104);
      id v13 = *(void **)(v11 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke_2;
      v14[3] = &unk_1E57D8DB8;
      void v14[4] = v11;
      MRMediaRemoteServiceGetPlaybackState(v10, v12, v13, v14);
    }
  }
}

void __55__MRNowPlayingPlayerClientRequests_updateContentItems___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v16;
      *(void *)&long long v4 = 138543618;
      long long v14 = v4;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v2);
          }
          dispatch_semaphore_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
          id v10 = objc_msgSend(v8, "identifier", v14, (void)v15);
          uint64_t v11 = [v9 contentItemForIdentifier:v10];

          if (v11)
          {
            id v12 = _MRLogForCategory(1uLL);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 104);
              *(_DWORD *)buf = v14;
              uint64_t v20 = v13;
              __int16 v21 = 2112;
              v22 = v8;
              _os_log_debug_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: contentItem %@", buf, 0x16u);
            }

            MRContentItemMerge(v11, v8);
          }
        }
        uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

void __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v6 + 16))
  {
    [(id)v6 setPlaybackState:a2];
    uint64_t v6 = *(void *)(a1 + 32);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(v6 + 72);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "removeAllObjects", (void)v12);
}

- (void)setPlaybackState:(unsigned int)a3
{
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRNowPlayingPlayerClientRequests;
  [(MRNowPlayingPlayerClientRequests *)&v4 dealloc];
}

- (id)debugDescription
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__39;
  uint64_t v8 = __Block_byref_object_dispose__39;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__MRNowPlayingPlayerClientRequests_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSString alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 104);
  uint64_t v6 = *(void *)(v4 + 32);
  uint64_t v11 = MRMediaRemoteCopyPlaybackStateDescription(*(_DWORD *)(v4 + 16));
  id v7 = (void *)[v3 initWithFormat:@"    playerPath = %@\n    playerProperties = %@\n    playbackState = %@\n    playbackQueue = %@\n    supportedCommands = %@\n", v5, v6, v11, *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v8 = MRCreateFormattedDebugDescriptionFromClass(v2, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
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
  v5[2] = __49__MRNowPlayingPlayerClientRequests_playbackState__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRNowPlayingPlayerClientRequests_playbackState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

- (NSArray)supportedCommands
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__39;
  uint64_t v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MRNowPlayingPlayerClientRequests_supportedCommands__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __53__MRNowPlayingPlayerClientRequests_supportedCommands__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setPlayerProperties:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

void __56__MRNowPlayingPlayerClientRequests_setPlayerProperties___block_invoke(uint64_t a1)
{
  id v2 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__MRNowPlayingPlayerClientRequests_setPlayerProperties___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;
}

- (MRPlayer)playerProperties
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__39;
  uint64_t v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MRNowPlayingPlayerClientRequests_playerProperties__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayer *)v3;
}

uint64_t __52__MRNowPlayingPlayerClientRequests_playerProperties__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)updateContentItemArtwork:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MRNowPlayingPlayerClientRequests_updateContentItemArtwork___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __61__MRNowPlayingPlayerClientRequests_updateContentItemArtwork___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v26;
      *(void *)&long long v4 = 138543618;
      long long v24 = v4;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v2);
          }
          id v8 = *(void **)(*(void *)(a1 + 32) + 8);
          int v9 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v7), "identifier", v24, (void)v25);
          uint64_t v10 = [v8 contentItemForIdentifier:v9];

          if (v10)
          {
            if (MRContentItemGetArtworkData(v10))
            {
              id v11 = _MRLogForCategory(1uLL);
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 104);
                v19 = MRContentItemCopyMinimalReadableDescription(v10);
                *(_DWORD *)buf = v24;
                uint64_t v30 = v18;
                __int16 v31 = 2112;
                uint64_t v32 = v19;
                _os_log_debug_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: clearing contentItemArtwork for %@", buf, 0x16u);
              }
              MRContentItemSetArtworkData(v10, 0);
            }
            long long v12 = [v10 artworks];
            uint64_t v13 = [v12 count];

            if (v13)
            {
              long long v14 = _MRLogForCategory(1uLL);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 104);
                __int16 v21 = MRContentItemCopyMinimalReadableDescription(v10);
                *(_DWORD *)buf = v24;
                uint64_t v30 = v20;
                __int16 v31 = 2112;
                uint64_t v32 = v21;
                _os_log_debug_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: clearing formatted data artworks for %@", buf, 0x16u);
              }
              [v10 setArtworks:0];
            }
            long long v15 = [v10 remoteArtworks];
            uint64_t v16 = [v15 count];

            if (v16)
            {
              uint64_t v17 = _MRLogForCategory(1uLL);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 104);
                v23 = MRContentItemCopyMinimalReadableDescription(v10);
                *(_DWORD *)buf = v24;
                uint64_t v30 = v22;
                __int16 v31 = 2112;
                uint64_t v32 = v23;
                _os_log_debug_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: clearing formatted remote artworks for %@", buf, 0x16u);
              }
              [v10 setRemoteArtworks:0];
            }
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v5);
    }
  }
}

- (void)updatePlaybackQueueIfUninitialized:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MRNowPlayingPlayerClientRequests_updatePlaybackQueueIfUninitialized___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __71__MRNowPlayingPlayerClientRequests_updatePlaybackQueueIfUninitialized___block_invoke(uint64_t a1)
{
  return -[MRNowPlayingPlayerClientRequests _onSerialQueue_updatePlaybackQueueIfUninitialized:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_onSerialQueue_updatePlaybackQueueIfUninitialized:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && !a1[1])
  {
    id v6 = v3;
    id v3 = (id)[a1 setPlaybackQueue:v3];
    id v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)updatePlaybackStateIfUninitialized:(unsigned int)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__MRNowPlayingPlayerClientRequests_updatePlaybackStateIfUninitialized___block_invoke;
  v4[3] = &unk_1E57D4308;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(serialQueue, v4);
}

_DWORD *__71__MRNowPlayingPlayerClientRequests_updatePlaybackStateIfUninitialized___block_invoke(uint64_t a1)
{
  result = *(_DWORD **)(a1 + 32);
  if (result)
  {
    if (!result[4]) {
      return (_DWORD *)[result setPlaybackState:*(unsigned int *)(a1 + 40)];
    }
  }
  return result;
}

- (void)updateSupportedCommandsIfUninitialized:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__MRNowPlayingPlayerClientRequests_updateSupportedCommandsIfUninitialized___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __75__MRNowPlayingPlayerClientRequests_updateSupportedCommandsIfUninitialized___block_invoke(uint64_t a1)
{
  return -[MRNowPlayingPlayerClientRequests _onSerialQueue_updateSupportedCommandsIfUninitialized:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_onSerialQueue_updateSupportedCommandsIfUninitialized:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && !a1[3])
  {
    id v6 = v3;
    id v3 = (id)[a1 setSupportedCommands:v3];
    id v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

void __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 0;
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2_cold_1(a1, v3);
    }

    uint64_t Error = MRMediaRemoteCreateError(26);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = Error;
  }
}

- (void)handleSupportedCommandsRequestWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MRNowPlayingPlayerClientRequests.m", 320, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke;
  block[3] = &unk_1E57D03B0;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

void __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(v2 + 64);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 64);
      *(void *)(v6 + 64) = v5;

      id v4 = *(void **)(*(void *)(a1 + 32) + 64);
    }
    id v8 = (void *)[*(id *)(a1 + 40) copy];
    int v9 = (void *)MEMORY[0x1997190F0]();
    [v4 addObject:v9];

    if ([*(id *)(*(void *)(a1 + 32) + 64) count] == 1)
    {
      id v10 = (void *)MRGetSharedService();
      uint64_t v11 = *(void *)(a1 + 32);
      long long v12 = *(void **)(v11 + 104);
      uint64_t v13 = *(void **)(v11 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke_2;
      v14[3] = &unk_1E57D24A0;
      void v14[4] = v11;
      MRMediaRemoteServiceGetSupportedCommands(v10, v12, v13, v14);
    }
  }
}

void __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  -[MRNowPlayingPlayerClientRequests _onSerialQueue_updateSupportedCommandsIfUninitialized:](*(void **)(a1 + 32), a2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "removeAllObjects", (void)v11);
}

- (void)handlePlayerPropertiesRequestWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MRNowPlayingPlayerClientRequests.m", 380, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke;
  block[3] = &unk_1E57D03B0;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

void __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(v2 + 80);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 80);
      *(void *)(v6 + 80) = v5;

      id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    }
    uint64_t v8 = (void *)[*(id *)(a1 + 40) copy];
    uint64_t v9 = (void *)MEMORY[0x1997190F0]();
    [v4 addObject:v9];

    if ([*(id *)(*(void *)(a1 + 32) + 80) count] == 1)
    {
      id v10 = (void *)MRGetSharedService();
      uint64_t v11 = *(void *)(a1 + 32);
      long long v12 = *(void **)(v11 + 104);
      long long v13 = *(void **)(v11 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke_2;
      v14[3] = &unk_1E57D8DE0;
      void v14[4] = v11;
      MRMediaRemoteServiceGetPlayerProperties(v10, v12, v13, v14);
    }
  }
}

void __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 32))
  {
    [(id)v7 setPlayerProperties:v5];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(v7 + 80);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeAllObjects", (void)v13);
}

- (void)restoreNowPlayingClientState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRNowPlayingPlayerClientRequests_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __64__MRNowPlayingPlayerClientRequests_restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(*(void *)(a1 + 32) + 112) requiringSecureCoding:1 error:0];
  if (v6) {
    MRMediaRemotePlaybackQueueResetRequestsWithDataForPlayer(*(void **)(*(void *)(a1 + 32) + 104), v6);
  }
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_enquedNowPlayingInfoAssetRequests, 0);
  objc_storeStrong((id *)&self->_enquedNowPlayingInfoRequests, 0);
  objc_storeStrong((id *)&self->_playerPropertiesCompletions, 0);
  objc_storeStrong((id *)&self->_playbackStateCompletions, 0);
  objc_storeStrong((id *)&self->_supportedCommandsCompletions, 0);
  objc_storeStrong((id *)&self->_playbackQueueCompletions, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_playerProperties, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);

  objc_storeStrong((id *)&self->_playbackQueue, 0);
}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackState___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 104);
  uint64_t v4 = MRMediaRemoteCopyPlaybackStateDescription(*(_DWORD *)(a1 + 40));
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  OUTLINED_FUNCTION_1_9(&dword_194F3C000, a2, v5, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: playbackState %{public}@", (uint8_t *)&v6);
}

void __57__MRNowPlayingPlayerClientRequests_setSupportedCommands___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_9(&dword_194F3C000, v0, v1, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: supportedCommands %{public}@", v2);
}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackQueue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 104);
  uint64_t v4 = [*(id *)(a1 + 40) minimalReadableDescription];
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  OUTLINED_FUNCTION_1_9(&dword_194F3C000, a2, v5, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: playbackQueue %@", (uint8_t *)&v6);
}

void __56__MRNowPlayingPlayerClientRequests_setPlayerProperties___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_9(&dword_194F3C000, v0, v1, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: playerProperties %{public}@", v2);
}

void __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "Timed out getting playback queue for now playing request: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end