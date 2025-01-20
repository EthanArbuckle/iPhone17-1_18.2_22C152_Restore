@interface PXStoryPhotoKitMusicCurationProvider
+ (id)sharedInstance;
- (NSArray)recentlyUsedAppleMusicSongIDs;
- (NSArray)recentlyUsedFlexSongIDs;
- (NSArray)stateQueue_recentlyUsedAppleMusicSongIDs;
- (NSArray)stateQueue_recentlyUsedFlexSongIDs;
- (NSMutableDictionary)stateQueue_cache;
- (NSMutableDictionary)stateQueue_requests;
- (OS_dispatch_queue)stateQueue;
- (OS_dispatch_queue)workQueue;
- (OS_os_log)log;
- (PXStoryPhotoKitMusicCurationProvider)init;
- (id)_cachedResultForAssetContainer:(id)a3 options:(id)a4;
- (id)_performRequestForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (id)requestMusicCurationForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)_handleMusicCurationResult:(id)a3 forAssetContainer:(id)a4 options:(id)a5;
- (void)_removeRejectedSong:(id)a3 fromCachedResultForAssetContainer:(id)a4;
- (void)_replaceSongWithSong:(id)a3 inCachedResultForAssetContainer:(id)a4;
- (void)_saveNegativeFeedbackForSongIdentifier:(id)a3 assetContainer:(id)a4;
- (void)applyNegativeFeedbackToSong:(id)a3 forAssetContainer:(id)a4;
- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3;
- (void)setRecentlyUsedFlexSongIDs:(id)a3;
- (void)setStateQueue_recentlyUsedAppleMusicSongIDs:(id)a3;
- (void)setStateQueue_recentlyUsedFlexSongIDs:(id)a3;
- (void)updateAudioAsset:(id)a3 forAssetContainer:(id)a4;
@end

@implementation PXStoryPhotoKitMusicCurationProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_stateQueue_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_stateQueue_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_stateQueue_requests, 0);
  objc_storeStrong((id *)&self->_stateQueue_cache, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setStateQueue_recentlyUsedAppleMusicSongIDs:(id)a3
{
}

- (NSArray)stateQueue_recentlyUsedAppleMusicSongIDs
{
  return self->_stateQueue_recentlyUsedAppleMusicSongIDs;
}

- (void)setStateQueue_recentlyUsedFlexSongIDs:(id)a3
{
}

- (NSArray)stateQueue_recentlyUsedFlexSongIDs
{
  return self->_stateQueue_recentlyUsedFlexSongIDs;
}

- (NSMutableDictionary)stateQueue_requests
{
  return self->_stateQueue_requests;
}

- (NSMutableDictionary)stateQueue_cache
{
  return self->_stateQueue_cache;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)_saveNegativeFeedbackForSongIdentifier:(id)a3 assetContainer:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 container];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = v8;

    if (v9)
    {
      v10 = [(PXStoryPhotoKitMusicCurationProvider *)self workQueue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke;
      v13[3] = &unk_1E5DD32A8;
      v11 = v9;
      v14 = v11;
      id v15 = v6;
      dispatch_async(v10, v13);

      v12 = v14;
      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = PLStoryGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Failed to save negative feedback for asset container of unsupported type: %@", buf, 0xCu);
  }
  v11 = 0;
LABEL_9:
}

void __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];
  v32[0] = *MEMORY[0x1E4F397B8];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v3 setFetchPropertySets:v4];

  [v3 setIncludePendingMemories:1];
  [v3 setIncludeRejectedMemories:1];
  [v3 setIncludeLocalMemories:1];
  [v3 setIncludeStoryMemories:1];
  v5 = [*(id *)(a1 + 32) localIdentifier];
  id v6 = (void *)MEMORY[0x1E4F38EE8];
  v31 = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v8 = [v6 fetchAssetCollectionsWithType:4 localIdentifiers:v7 options:v3];

  if ([v8 count])
  {
    id v9 = [v8 firstObject];
    v10 = (void *)MEMORY[0x1E4F39330];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [v9 userFeedbackProperties];
    v13 = [(id)v12 userFeedback];
    v14 = [v10 negativeUserFeedbackForMemoryMusicWithSongIdentifier:v11 existingFeedback:v13];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke_205;
    v22[3] = &unk_1E5DD32A8;
    id v15 = v9;
    v23 = v15;
    id v16 = v14;
    id v24 = v16;
    id v21 = 0;
    LOBYTE(v12) = [v2 performChangesAndWait:v22 error:&v21];
    id v17 = v21;
    if ((v12 & 1) == 0)
    {
      uint64_t v18 = PLStoryGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v26 = v5;
        __int16 v27 = 2112;
        uint64_t v28 = v19;
        __int16 v29 = 2112;
        id v30 = v17;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Failed to save negative feedback for song identifier %@ in memory %@ error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v15 = PLStoryGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v20;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Failed to find memory %@ when saving negative feedback for song %@", buf, 0x16u);
    }
  }
}

void __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke_205(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  [v2 setUserFeedback:*(void *)(a1 + 40)];
}

- (void)_replaceSongWithSong:(id)a3 inCachedResultForAssetContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke;
  block[3] = &unk_1E5DD0F30;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "stateQueue_cache");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v2 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v25;
    v14 = v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v7 = *(void **)(a1 + 40);
        v8 = AssetContainerFromCacheKey(v6);
        LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8, v14);

        if (v7)
        {
          id v9 = [v2 objectForKeyedSubscript:v6];
          uint64_t v20 = 0;
          id v21 = &v20;
          uint64_t v22 = 0x2020000000;
          uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v17[0] = __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke_2;
          v17[1] = &unk_1E5DAF1E0;
          id v18 = *(id *)(a1 + 48);
          uint64_t v19 = &v20;
          [v9 enumerateObjectsUsingBlock:v16];
          if (v21[3] != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
            uint64_t v11 = [v9 objectsAtIndexes:v10];
            id v12 = (void *)[v11 mutableCopy];

            [v12 replaceObjectAtIndex:v21[3] withObject:*(void *)(a1 + 48)];
            id v13 = PXAudioAssetFetchResultWithArray(v12);
            [v2 setObject:v13 forKeyedSubscript:v6];
          }
          _Block_object_dispose(&v20, 8);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v3);
  }
}

void __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 identifier];
  v8 = [*(id *)(a1 + 32) identifier];

  if (v7 == v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_removeRejectedSong:(id)a3 fromCachedResultForAssetContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PXStoryPhotoKitMusicCurationProvider__removeRejectedSong_fromCachedResultForAssetContainer___block_invoke;
  block[3] = &unk_1E5DD0F30;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __94__PXStoryPhotoKitMusicCurationProvider__removeRejectedSong_fromCachedResultForAssetContainer___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "stateQueue_cache");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v15 = v19 = 0u;
  id v2 = [v15 allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        id v9 = AssetContainerFromCacheKey(v7);
        LODWORD(v8) = [v8 isEqual:v9];

        if (v8)
        {
          id v10 = [v15 objectForKeyedSubscript:v7];
          if ([v10 containsObject:*(void *)(a1 + 48)])
          {
            uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
            id v12 = [v10 objectsAtIndexes:v11];
            id v13 = (void *)[v12 mutableCopy];

            [v13 removeObject:*(void *)(a1 + 48)];
            v14 = PXAudioAssetFetchResultWithArray(v13);
            [v15 setObject:v14 forKeyedSubscript:v7];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (id)_cachedResultForAssetContainer:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = [a4 categories];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __79__PXStoryPhotoKitMusicCurationProvider__cachedResultForAssetContainer_options___block_invoke;
  uint64_t v21 = &unk_1E5DCAEC8;
  id v10 = v7;
  id v22 = v10;
  id v11 = v8;
  id v23 = v11;
  long long v24 = self;
  id v12 = v6;
  id v25 = v12;
  dispatch_sync(v9, &v18);

  uint64_t v13 = objc_msgSend(v11, "count", v18, v19, v20, v21);
  if (v13 == [v10 count])
  {
    v14 = [PXMusicCurationConcreteResult alloc];
    id v15 = (void *)[v11 copy];
    long long v16 = [(PXMusicCurationConcreteResult *)v14 initWithSongsByCategory:v15];
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

void __79__PXStoryPhotoKitMusicCurationProvider__cachedResultForAssetContainer_options___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        v8 = objc_msgSend(a1[6], "stateQueue_cache", (void)v11);
        id v9 = CacheKey(a1[7], v7);
        id v10 = [v8 objectForKeyedSubscript:v9];
        [a1[5] setObject:v10 forKeyedSubscript:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)_handleMusicCurationResult:(id)a3 forAssetContainer:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__PXStoryPhotoKitMusicCurationProvider__handleMusicCurationResult_forAssetContainer_options___block_invoke;
  v15[3] = &unk_1E5DCAEC8;
  id v16 = v8;
  long long v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __93__PXStoryPhotoKitMusicCurationProvider__handleMusicCurationResult_forAssetContainer_options___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] songsByCategory];
  uint64_t v3 = objc_msgSend(a1[5], "stateQueue_cache");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v14);
        long long v11 = CacheKey(a1[6], v9);
        [v3 setObject:v10 forKey:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = objc_msgSend(a1[5], "stateQueue_requests");
  id v13 = RequestCacheKey(a1[6], a1[7]);
  [v12 setObject:0 forKeyedSubscript:v13];
}

- (id)_performRequestForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__5266;
  v54 = __Block_byref_object_dispose__5267;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5266;
  v48 = __Block_byref_object_dispose__5267;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__5266;
  v42 = __Block_byref_object_dispose__5267;
  id v43 = 0;
  long long v11 = RequestCacheKey(v8, v9);
  id v12 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DB1118;
  v35 = &v50;
  block[4] = self;
  id v13 = v11;
  id v34 = v13;
  v36 = &v44;
  v37 = &v38;
  dispatch_sync(v12, block);

  long long v14 = (void *)v51[5];
  if (!v14)
  {
    objc_initWeak(&location, self);
    long long v15 = [_PXStoryMusicCurationProviderRequest alloc];
    uint64_t v16 = v45[5];
    uint64_t v17 = v39[5];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_2;
    v28[3] = &unk_1E5DAF1B8;
    objc_copyWeak(&v31, &location);
    id v29 = v8;
    id v30 = v9;
    uint64_t v18 = [(_PXStoryMusicCurationProviderRequest *)v15 initWithAssetContainer:v29 options:v30 recentlyUsedFlexSongIDs:v16 recentlyUsedAppleMusicSongIDs:v17 completion:v28];
    uint64_t v19 = (void *)v51[5];
    v51[5] = v18;

    uint64_t v20 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_3;
    v25[3] = &unk_1E5DCCA20;
    v25[4] = self;
    id v26 = v13;
    long long v27 = &v50;
    dispatch_sync(v20, v25);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
    long long v14 = (void *)v51[5];
  }
  [v14 appendResultHandler:v10];
  uint64_t v21 = [(PXStoryPhotoKitMusicCurationProvider *)self workQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_4;
  v24[3] = &unk_1E5DD2B08;
  v24[4] = &v50;
  dispatch_async(v21, v24);

  id v22 = [(id)v51[5] progress];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v22;
}

void __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "stateQueue_requests");
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedFlexSongIDs");
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedAppleMusicSongIDs");
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleMusicCurationResult:v4 forAssetContainer:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
}

void __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "stateQueue_requests");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

uint64_t __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) start];
}

- (void)updateAudioAsset:(id)a3 forAssetContainer:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLStoryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Received request to update song: %@ in asset container: %@", (uint8_t *)&v9, 0x16u);
  }

  [(PXStoryPhotoKitMusicCurationProvider *)self _replaceSongWithSong:v6 inCachedResultForAssetContainer:v7];
}

- (void)applyNegativeFeedbackToSong:(id)a3 forAssetContainer:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLStoryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Received request to apply negative feedback for song: %@ in asset container: %@", (uint8_t *)&v10, 0x16u);
  }

  [(PXStoryPhotoKitMusicCurationProvider *)self _removeRejectedSong:v6 fromCachedResultForAssetContainer:v7];
  int v9 = [v6 identifier];
  [(PXStoryPhotoKitMusicCurationProvider *)self _saveNegativeFeedbackForSongIdentifier:v9 assetContainer:v7];
}

- (id)requestMusicCurationForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  id v11 = [(PXStoryPhotoKitMusicCurationProvider *)self log];
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
  id v13 = v11;
  uint64_t v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v45 = [v9 logContext];
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PXStoryMusicCurationManagerResultDelivery", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
  }
  os_signpost_id_t spid = v12;

  if (v9) {
    uint64_t v16 = (PXStoryMusicCurationProviderOptions *)[v9 copy];
  }
  else {
    uint64_t v16 = objc_alloc_init(PXStoryMusicCurationProviderOptions);
  }
  uint64_t v17 = v16;
  uint64_t v18 = [(PXStoryMusicCurationProviderOptions *)v16 categories];
  if ([v18 count]) {
    [(PXStoryMusicCurationProviderOptions *)v17 categories];
  }
  else {
  uint64_t v19 = PXAllMusicCurationCategories();
  }
  [(PXStoryMusicCurationProviderOptions *)v17 setCategories:v19];

  uint64_t v20 = +[PXStorySettings sharedInstance];
  LOBYTE(v19) = [v20 isAppleMusicAllowed];

  if ((v19 & 1) == 0)
  {
    uint64_t v21 = [(PXStoryMusicCurationProviderOptions *)v17 categories];
    id v22 = PXAppleMusicCurationCategories();
    id v23 = PXSetSubtract(v21, v22);
    [(PXStoryMusicCurationProviderOptions *)v17 setCategories:v23];
  }
  long long v24 = PLStoryGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = [v8 identifier];
    id v26 = [(PXStoryMusicCurationProviderOptions *)v17 categories];
    *(_DWORD *)buf = 138412546;
    uint64_t v45 = (uint64_t)v25;
    __int16 v46 = 2112;
    v47 = v26;
    _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Received request for music curation for asset container: %@; categories: %@",
      buf,
      0x16u);
  }
  long long v27 = [(PXStoryPhotoKitMusicCurationProvider *)self _cachedResultForAssetContainer:v8 options:v17];
  int v28 = [v27 isComplete];
  id v29 = PLStoryGetLog();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (v28)
  {
    if (v30)
    {
      id v31 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = (uint64_t)v31;
      _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Cached music curation result found for asset container: %@.", buf, 0xCu);
    }
    v10[2](v10, v27);
    v32 = v14;
    v33 = v32;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      uint64_t v34 = [v9 logContext];
      *(_DWORD *)buf = 134218242;
      uint64_t v45 = v34;
      __int16 v46 = 2114;
      v47 = v27;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryMusicCurationManagerResultDelivery", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
    }
    v35 = 0;
  }
  else
  {
    if (v30)
    {
      v36 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = (uint64_t)v36;
      _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) No music curation result found. Starting new request for asset container: %@", buf, 0xCu);
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __100__PXStoryPhotoKitMusicCurationProvider_requestMusicCurationForAssetContainer_options_resultHandler___block_invoke;
    v39[3] = &unk_1E5DAF190;
    uint64_t v40 = v14;
    os_signpost_id_t v43 = spid;
    id v41 = v9;
    v42 = v10;
    v35 = [(PXStoryPhotoKitMusicCurationProvider *)self _performRequestForAssetContainer:v8 options:v17 resultHandler:v39];

    v33 = v40;
  }

  return v35;
}

void __100__PXStoryPhotoKitMusicCurationProvider_requestMusicCurationForAssetContainer_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = [*(id *)(a1 + 40) logContext];
    int v8 = 134218242;
    uint64_t v9 = v7;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryMusicCurationManagerResultDelivery", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  id v4 = (void *)[a3 copy];
  uint64_t v5 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedAppleMusicSongIDs___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __73__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedAppleMusicSongIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateQueue_recentlyUsedAppleMusicSongIDs:", *(void *)(a1 + 40));
}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy__5266;
  id v11 = __Block_byref_object_dispose__5267;
  id v12 = 0;
  id v3 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PXStoryPhotoKitMusicCurationProvider_recentlyUsedAppleMusicSongIDs__block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __69__PXStoryPhotoKitMusicCurationProvider_recentlyUsedAppleMusicSongIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedAppleMusicSongIDs");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  id v4 = (void *)[a3 copy];
  uint64_t v5 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedFlexSongIDs___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __67__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedFlexSongIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateQueue_recentlyUsedFlexSongIDs:", *(void *)(a1 + 40));
}

- (NSArray)recentlyUsedFlexSongIDs
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy__5266;
  id v11 = __Block_byref_object_dispose__5267;
  id v12 = 0;
  uint64_t v3 = [(PXStoryPhotoKitMusicCurationProvider *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PXStoryPhotoKitMusicCurationProvider_recentlyUsedFlexSongIDs__block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __63__PXStoryPhotoKitMusicCurationProvider_recentlyUsedFlexSongIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedFlexSongIDs");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (PXStoryPhotoKitMusicCurationProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryPhotoKitMusicCurationProvider;
  if ([(PXStoryPhotoKitMusicCurationProvider *)&v3 init]) {
    px_dispatch_queue_create_serial();
  }
  return 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5331 != -1) {
    dispatch_once(&sharedInstance_onceToken_5331, &__block_literal_global_5332);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_5333;
  return v2;
}

void __54__PXStoryPhotoKitMusicCurationProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXStoryPhotoKitMusicCurationProvider);
  v1 = (void *)sharedInstance_sharedInstance_5333;
  sharedInstance_sharedInstance_5333 = (uint64_t)v0;
}

@end