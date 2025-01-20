@interface FCAVAssetPrewarmer
- (FCAVAssetPrewarmer)init;
- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5;
- (uint64_t)_didChangeInterestedAssets;
- (void)_reprocessInterestedAssets;
- (void)_revisitSuspendedState;
- (void)addInterestInAsset:(id)a3;
- (void)removeInterestInAsset:(id)a3;
@end

@implementation FCAVAssetPrewarmer

void __44__FCAVAssetPrewarmer__revisitSuspendedState__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  if ([v3 isLowPowerModeEnabled])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setSuspended:1];
  }
  else
  {
    v2 = +[FCNetworkReachability sharedNetworkReachability];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setSuspended:", objc_msgSend(v2, "isLowDataModeEnabled"));
  }
}

- (FCAVAssetPrewarmer)init
{
  v13.receiver = self;
  v13.super_class = (Class)FCAVAssetPrewarmer;
  v2 = [(FCAVAssetPrewarmer *)&v13 init];
  if (v2)
  {
    id v3 = [[FCKeyedOperationQueue alloc] initWithDelegate:v2 maxConcurrentOperationCount:1];
    prefetchQueue = v2->_prefetchQueue;
    v2->_prefetchQueue = v3;

    [(FCKeyedOperationQueue *)v2->_prefetchQueue setExecutionQueue:MEMORY[0x1E4F14428]];
    v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    interestedAssets = v2->_interestedAssets;
    v2->_interestedAssets = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    interestModificationDates = v2->_interestModificationDates;
    v2->_interestModificationDates = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    interestTokensByAsset = v2->_interestTokensByAsset;
    v2->_interestTokensByAsset = v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel__revisitSuspendedState name:*MEMORY[0x1E4F287E8] object:0];

    [(FCAVAssetPrewarmer *)v2 _revisitSuspendedState];
  }
  return v2;
}

- (void)_revisitSuspendedState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__FCAVAssetPrewarmer__revisitSuspendedState__block_invoke;
  v2[3] = &unk_1E5B4C018;
  v2[4] = self;
  FCPerformBlockOnMainThread(v2);
}

- (void)addInterestInAsset:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    interestedAssets = self->_interestedAssets;
  }
  else {
    interestedAssets = 0;
  }
  uint64_t v6 = [(NSCountedSet *)interestedAssets countForObject:v4];
  if (self)
  {
    [(NSCountedSet *)self->_interestedAssets addObject:v4];
    interestModificationDates = self->_interestModificationDates;
  }
  else
  {
    [0 addObject:v4];
    interestModificationDates = 0;
  }
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  v9 = interestModificationDates;
  v10 = [v8 date];
  [(NSMutableDictionary *)v9 setObject:v10 forKey:v4];

  if (!v6)
  {
    v11 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_super v13 = [v4 identifier];
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "added prewarm interest in AV asset %{public}@", (uint8_t *)&v14, 0xCu);
    }
    -[FCAVAssetPrewarmer _didChangeInterestedAssets]((uint64_t)self);
  }
}

- (uint64_t)_didChangeInterestedAssets
{
  if (result)
  {
    uint64_t v1 = result;
    result = [MEMORY[0x1E4F29060] isMainThread];
    if (!*(void *)(v1 + 56))
    {
      uint64_t v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v1 target:sel__reprocessInterestedAssets selector:0 userInfo:0 repeats:0.01];
      uint64_t v3 = *(void *)(v1 + 56);
      *(void *)(v1 + 56) = v2;
      return MEMORY[0x1F41817F8](v2, v3);
    }
  }
  return result;
}

- (void)removeInterestInAsset:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    interestedAssets = self->_interestedAssets;
  }
  else {
    interestedAssets = 0;
  }
  uint64_t v6 = [(NSCountedSet *)interestedAssets countForObject:v4];
  if (self)
  {
    [(NSCountedSet *)self->_interestedAssets removeObject:v4];
    interestModificationDates = self->_interestModificationDates;
  }
  else
  {
    [0 removeObject:v4];
    interestModificationDates = 0;
  }
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  v9 = interestModificationDates;
  v10 = [v8 date];
  [(NSMutableDictionary *)v9 setObject:v10 forKey:v4];

  if (v6 == 1)
  {
    v11 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_super v13 = [v4 identifier];
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "removed prewarm interest in AV asset %{public}@", (uint8_t *)&v14, 0xCu);
    }
    -[FCAVAssetPrewarmer _didChangeInterestedAssets]((uint64_t)self);
  }
}

- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  [MEMORY[0x1E4F29060] isMainThread];
  v9 = [[FCOnce alloc] initWithOptions:1];
  v10 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = [v7 identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "will prewarm AV asset %{public}@", (uint8_t *)&buf, 0xCu);
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v35 = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke;
  v36 = &unk_1E5B55040;
  id v37 = v7;
  v38 = self;
  objc_super v13 = v9;
  v39 = v13;
  id v14 = v8;
  id v40 = v14;
  v15 = (id *)v7;
  uint64_t v16 = v34;
  if (self)
  {
    if (v15) {
      id WeakRetained = objc_loadWeakRetained(v15 + 5);
    }
    else {
      id WeakRetained = 0;
    }
    v18 = [v15 identifier];
    v19 = [WeakRetained interestTokenForAssetIdentifier:v18];

    if (v15) {
      id v20 = objc_loadWeakRetained(v15 + 5);
    }
    else {
      id v20 = 0;
    }
    v21 = [v15 identifier];
    int v22 = [v20 containsAssetWithIdentifier:v21];

    if (v22)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v42 = __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke;
      v43 = &unk_1E5B4C7C0;
      v23 = v16;
      v45 = v23;
      v44 = v19;
      ((void (*)(void *, id *, void))v35)(v23, v44, 0);
    }
    else
    {
      if (v15)
      {
        id v24 = objc_loadWeakRetained(v15 + 7);
        id v25 = v15[9];
      }
      else
      {
        id v24 = 0;
        id v25 = 0;
      }
      id v26 = v25;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v42 = __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_2;
      v43 = &unk_1E5B55068;
      v45 = v16;
      v44 = v15;
      [v24 prefetchMasterPlaylistForAssetURL:v26 completionHandler:&buf];
    }
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2_12;
  v31[3] = &unk_1E5B4CC80;
  v32 = v13;
  id v33 = v14;
  id v27 = v14;
  v28 = v13;
  v29 = +[FCCancelHandler cancelHandlerWithBlock:v31];

  return v29;
}

void __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2;
  v8[3] = &unk_1E5B55018;
  id v9 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  FCPerformBlockOnMainThread(v8);
}

void __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)FCAVAssetLog;
  BOOL v4 = os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v6 = v3;
      id v7 = [v5 identifier];
      *(_DWORD *)long long buf = 138543362;
      id v37 = v7;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "successfully prewarmed AV asset %{public}@", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      id v9 = *(void **)(v8 + 40);
    }
    else {
      id v9 = 0;
    }
    [v9 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      [MEMORY[0x1E4F29060] isMainThread];
      id v11 = *(id *)(v10 + 40);
      unint64_t v12 = [v11 count];
      unint64_t v13 = *(void *)(v10 + 48);

      if (v12 > v13)
      {
        id v14 = [MEMORY[0x1E4F1CA48] array];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v15 = *(id *)(v10 + 40);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:buf count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v33 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              if (![*(id *)(v10 + 24) countForObject:v20]) {
                [v14 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:buf count:16];
          }
          while (v17);
        }

        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __36__FCAVAssetPrewarmer__flushIfNeeded__block_invoke;
        v31[3] = &unk_1E5B55090;
        void v31[4] = v10;
        [v14 sortUsingComparator:v31];
        while ([v14 count])
        {
          id v21 = *(id *)(v10 + 40);
          unint64_t v22 = [v21 count];
          unint64_t v23 = *(void *)(v10 + 48);

          if (v22 <= v23) {
            break;
          }
          id v24 = *(id *)(v10 + 40);
          id v25 = [v14 firstObject];
          [v24 removeObjectForKey:v25];

          [v14 fc_removeFirstObject];
        }
        goto LABEL_23;
      }
    }
  }
  else if (v4)
  {
    id v26 = *(void **)(a1 + 40);
    id v14 = v3;
    id v27 = [v26 identifier];
    *(_DWORD *)long long buf = 138543362;
    id v37 = v27;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "failed to prewarm AV asset %{public}@", buf, 0xCu);

LABEL_23:
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_9;
  v29[3] = &unk_1E5B4CA88;
  v28 = *(void **)(a1 + 56);
  id v30 = *(id *)(a1 + 64);
  [v28 executeOnce:v29];
}

uint64_t __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2_12(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_3;
  v2[3] = &unk_1E5B4CA88;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 executeOnce:v2];
}

uint64_t __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v23[1] = MEMORY[0x1E4F143A8];
    v23[2] = 3221225472;
    v23[3] = __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_3;
    v23[4] = &unk_1E5B4C7C0;
    id v25 = (void (**)(id, void, id))*(id *)(a1 + 40);
    id v24 = v8;
    v25[2](v25, 0, v24);

    id v9 = v25;
  }
  else
  {
    if (a2) {
      uint64_t v10 = *(void **)(a2 + 40);
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;
    unint64_t v12 = [v11 objectForKeyedSubscript:@"com.apple.hls.keys"];
    id v9 = FCKeyIdentifiersFromHLSMetadata(v12);

    if ([v9 count])
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        id WeakRetained = objc_loadWeakRetained((id *)(v13 + 64));
      }
      else {
        id WeakRetained = 0;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_5;
      v18[3] = &unk_1E5B4E7A8;
      id v15 = (id *)v20;
      v20[0] = *(id *)(a1 + 40);
      uint64_t v16 = &v19;
      id v19 = v7;
      [WeakRetained fetchKeysWithIdentifiers:v9 completionHandler:v18];
    }
    else
    {
      v20[1] = MEMORY[0x1E4F143A8];
      v20[2] = 3221225472;
      v20[3] = __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_4;
      v20[4] = &unk_1E5B4F080;
      id v15 = (id *)v23;
      uint64_t v17 = (void (**)(id, id, void))*(id *)(a1 + 40);
      v23[0] = v17;
      uint64_t v16 = &v21;
      id v21 = v7;
      unint64_t v22 = 0;
      v17[2](v17, v21, 0);
      id WeakRetained = v22;
    }
  }
}

uint64_t __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)_reprocessInterestedAssets
{
  [MEMORY[0x1E4F29060] isMainThread];
  if (self)
  {
    unint64_t highWaterMark = self->_highWaterMark;
    unint64_t v4 = [(NSCountedSet *)self->_interestedAssets count];
    if (highWaterMark <= v4) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = highWaterMark;
    }
    self->_unint64_t highWaterMark = v5;
    interestedAssets = self->_interestedAssets;
  }
  else
  {
    [0 count];
    interestedAssets = 0;
  }
  id v7 = (void *)MEMORY[0x1E4F1CAA0];
  id v8 = interestedAssets;
  id v9 = [(NSCountedSet *)v8 allObjects];
  uint64_t v10 = [v7 orderedSetWithArray:v9];
  if (self)
  {
    [(FCKeyedOperationQueue *)self->_prefetchQueue setKeyQueue:v10];

    [(NSTimer *)self->_reprocessTimer invalidate];
    objc_storeStrong((id *)&self->_reprocessTimer, 0);
  }
  else
  {
    [0 setKeyQueue:v10];

    [0 invalidate];
  }
}

uint64_t __36__FCAVAssetPrewarmer__flushIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6) {
    uint64_t v6 = (void *)v6[4];
  }
  id v7 = v6;
  id v8 = a3;
  id v9 = [v7 objectForKey:a2];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v11 = *(void **)(v10 + 32);
  }
  else {
    id v11 = 0;
  }
  unint64_t v12 = [v11 objectForKey:v8];

  uint64_t v13 = [v9 compare:v12];
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reprocessTimer, 0);
  objc_storeStrong((id *)&self->_interestTokensByAsset, 0);
  objc_storeStrong((id *)&self->_interestModificationDates, 0);
  objc_storeStrong((id *)&self->_interestedAssets, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_assetResourceLoader, 0);
}

@end