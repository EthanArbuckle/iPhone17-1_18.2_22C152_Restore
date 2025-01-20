@interface SBHIconImageVariantCache
- (BOOL)_canPoolImage;
- (BOOL)hasCachingRequestsStillDoingWork;
- (BOOL)hasOtherCachedIconsForIcon:(id)a3;
- (NSString)description;
- (id)_cacheKeyForIcon:(id)a3;
- (id)_iconImageOfSize:(CGSize)a3 scale:(double)a4 failGracefully:(BOOL)a5 drawing:(id)a6;
- (id)_pooledIconImageForIconImage:(id)a3 allowingOptOut:(BOOL)a4;
- (id)_tintedImageFromTintableImageForIcon:(id)a3 imageAppearance:(id)a4;
- (id)_variantDescription;
- (id)_variantImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
- (id)attemptToBecomeActiveRequest:(id)a3;
- (id)cachedImageForIcon:(void *)a3 imageAppearance:(char)a4 options:;
- (id)cachingPlaceholderImageWithImageAppearance:(void *)a1;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)genericImageWithImageAppearance:(uint64_t)a1;
- (id)iconImagesMemoryPool;
- (id)memoryMappedIconImageForIconImage:(id)a3;
- (id)memoryMappedIconImageOfSize:(CGSize)a3 scale:(double)a4 withDrawing:(id)a5;
- (id)pooledIconImageForMappedIconImage:(id)a3;
- (id)realImageForIcon:(void *)a3 imageAppearance:(uint64_t)a4 options:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)effectivePriorityForPriority:(int64_t)a3;
- (uint64_t)cancelAllCachingRequests;
- (uint64_t)cancelCachingRequestsForIcon:(uint64_t)a1;
- (uint64_t)isCachingImageForIcon:(id *)a1;
- (unint64_t)currentImageGenerationForIcon:(id)a3;
- (unint64_t)iconImageOptions;
- (unint64_t)imageRetrievalOptions;
- (unint64_t)storedImageGenerationForIcon:(id)a3 imageAppearance:(id)a4;
- (void)addCachedIcon:(id)a3;
- (void)cacheImage:(void *)a3 forIcon:(void *)a4 imageAppearance:;
- (void)cacheImageForIcon:(void *)a3 imageAppearance:(void *)a4 priority:(void *)a5 reason:(void *)a6 options:(void *)a7 cancellation:(void *)a8 completionHandler:;
- (void)cancelAllCachingRequests;
- (void)cleanUpCachingRequest:(id)a3;
- (void)clearActiveRequest:(id)a3;
- (void)finishBackgroundCacheWorkForCachingRequest:(id)a3;
- (void)finishBackgroundCacheWorkForCancelledCachingRequest:(id)a3;
- (void)initWithVariant:(double)a3 iconImageInfo:(double)a4;
- (void)performBackgroundCacheWorkForCachingRequest:(id)a3;
- (void)performSynchronousCacheRequest:(id)a3;
- (void)purgeAllCachedImages;
- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:(uint64_t)a1;
- (void)purgeCachedImagesForIcons:(id *)a1;
- (void)recacheImagesForIcon:(void *)a3 completionGroup:;
- (void)removeAllCachedIcons;
- (void)removeAllStoredImageGenerations;
- (void)removeCachedIcon:(id)a3;
- (void)removeStoredImageGenerationForIcon:(id)a3 imageAppearance:(id)a4;
- (void)removeStoredImageGenerationForIcons:(id)a3;
- (void)resetFailedStatusForIcon:(uint64_t)a1;
- (void)setStoredImageGeneration:(unint64_t)a3 forIcon:(id)a4 imageAppearance:(id)a5;
- (void)submitRequest:(id *)a1;
@end

@implementation SBHIconImageVariantCache

- (id)cachedImageForIcon:(void *)a3 imageAppearance:(char)a4 options:
{
  id v7 = a2;
  id v8 = a3;
  if (!a1 || (BSDispatchQueueAssertMain(), (a4 & 8) != 0))
  {
    v9 = 0;
  }
  else
  {
    v9 = [a1[1] imageForIcon:v7 appearance:v8];
    if (v9 && (a4 & 0x20) != 0)
    {
      uint64_t v10 = [a1 storedImageGenerationForIcon:v7 imageAppearance:v8];
      id WeakRetained = objc_loadWeakRetained(a1 + 10);
      if ([WeakRetained currentImageGenerationForIcon:v7] > v10)
      {

        v9 = 0;
      }
    }
  }

  return v9;
}

- (void)initWithVariant:(double)a3 iconImageInfo:(double)a4
{
  if (!a1) {
    return 0;
  }
  v24.receiver = a1;
  v24.super_class = (Class)SBHIconImageVariantCache;
  v11 = objc_msgSendSuper2(&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[9] = a2;
    *((double *)v11 + 11) = a3;
    *((double *)v11 + 12) = a4;
    *((double *)v11 + 13) = a5;
    *((double *)v11 + 14) = a6;
    *((_DWORD *)v11 + 16) = 0;
    v13 = objc_alloc_init(SBHIconImageAppearanceStore);
    v14 = (void *)v12[1];
    v12[1] = v13;

    uint64_t v15 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    v16 = (void *)v12[2];
    v12[2] = v15;

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18 = (void *)v12[3];
    v12[3] = v17;

    v19 = objc_alloc_init(SBHIconImageAppearanceStore);
    v20 = (void *)v12[4];
    v12[4] = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v22 = (void *)v12[7];
    v12[7] = v21;
  }
  return v12;
}

- (void)cacheImage:(void *)a3 forIcon:(void *)a4 imageAppearance:
{
  if (a1)
  {
    id v7 = a4;
    id v9 = a3;
    id v8 = a2;
    BSDispatchQueueAssertMain();
    [a1[1] setImage:v8 forIcon:v9 appearance:v7];

    [a1[2] removeObject:v9];
    objc_msgSend(a1, "setStoredImageGeneration:forIcon:imageAppearance:", objc_msgSend(a1, "currentImageGenerationForIcon:", v9), v9, v7);
  }
}

- (void)setStoredImageGeneration:(unint64_t)a3 forIcon:(id)a4 imageAppearance:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SBLogIconImageCache();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = [v8 uniqueIdentifier];
    int v15 = 138412802;
    v16 = v14;
    __int16 v17 = 2114;
    id v18 = v9;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_debug_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEBUG, "changing stored image generation for %@/%{public}@ to %lu", (uint8_t *)&v15, 0x20u);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  storedImageGenerations = self->_storedImageGenerations;
  v13 = [NSNumber numberWithUnsignedInteger:a3];
  [(SBHIconImageAppearanceStore *)storedImageGenerations setImage:v13 forIcon:v8 appearance:v9];

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)currentImageGenerationForIcon:(id)a3
{
  id v4 = a3;
  if (self) {
    self = (SBHIconImageVariantCache *)objc_loadWeakRetained((id *)&self->_iconImageCache);
  }
  unint64_t v5 = [(SBHIconImageVariantCache *)self currentImageGenerationForIcon:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconImageCache);
  objc_storeStrong((id *)&self->_iconsByIconCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_genericImages, 0);
  objc_storeStrong((id *)&self->_storedImageGenerations, 0);
  objc_storeStrong((id *)&self->_cachingRequests, 0);
  objc_storeStrong((id *)&self->_failedIcons, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

- (unint64_t)storedImageGenerationForIcon:(id)a3 imageAppearance:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [(SBHIconImageAppearanceStore *)self->_storedImageGenerations imageForIcon:v8 appearance:v7];

  os_unfair_lock_unlock(p_lock);
  unint64_t v10 = [v9 unsignedIntegerValue];

  return v10;
}

- (id)realImageForIcon:(void *)a3 imageAppearance:(uint64_t)a4 options:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    -[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:]((id *)a1, v7, v8, a4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      id WeakRetained = [(id)a1 iconImagesMemoryPool];
      if (WeakRetained) {
        SBFPreheatImageData();
      }
      v11 = v9;
    }
    else
    {
      if (a4 & 4) != 0 || ([*(id *)(a1 + 16) containsObject:v7])
      {
        v11 = 0;
        goto LABEL_10;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      v13 = (void *)[(id)a1 currentImageGenerationForIcon:v7];
      v14 = *(void **)(a1 + 72);
      int v15 = (void *)[(id)objc_opt_class() optionsForRetrievalOptions:a4];
      v16 = (void *)[(id)objc_opt_class() defaultPriority];
      __int16 v17 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:variant:options:sharedCancellation:iconImageCache:completionHandler:]((id *)[SBHIconImageCacheRequest alloc], v7, v8, v16, @"realImageForIcon", v13, v14, v15, 0, WeakRetained, 0);
      -[SBHIconImageVariantCache submitRequest:]((id *)a1, v17);
      v11 = -[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:]((id *)a1, v7, v8, a4);
    }
LABEL_10:

    goto LABEL_11;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)submitRequest:(id *)a1
{
  v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v5 = v3[5];
      if (((_BYTE)v4[12] & 8) != 0) {
        goto LABEL_9;
      }
      id v6 = v4[10];
    }
    else
    {
      id v5 = 0;
      id v6 = 0;
    }
    if ([v5 canGenerateIconsInBackground])
    {
      [a1[3] addObject:v4];
      id WeakRetained = objc_loadWeakRetained(a1 + 10);
      if (!WeakRetained) {
        NSLog(&cfstr_MissingIconIma.isa);
      }
      uint64_t v8 = [a1 effectivePriorityForPriority:v6];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __42__SBHIconImageVariantCache_submitRequest___block_invoke;
      v9[3] = &unk_1E6AACA90;
      v9[4] = a1;
      unint64_t v10 = v4;
      [WeakRetained performBackgroundCachingActivityUsingPriority:v8 block:v9];

      goto LABEL_10;
    }
LABEL_9:
    [a1 performSynchronousCacheRequest:v4];
LABEL_10:
  }
}

- (void)recacheImagesForIcon:(void *)a3 completionGroup:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    id v7 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke;
    v8[3] = &unk_1E6AACAE0;
    id v9 = v6;
    uint64_t v10 = a1;
    id v11 = v5;
    [v7 enumerateImagesForIcon:v11 usingBlock:v8];
  }
}

- (void)purgeCachedImagesForIcons:(id *)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    v16 = [a1 _variantDescription];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v3;
    obuint64_t j = v3;
    uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v7 = [a1 _cacheKeyForIcon:v6];
          [a1[1] removeAllImagesForIcon:v6];
          [a1[2] removeObject:v6];
          [a1 removeCachedIcon:v6];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v8 = a1[3];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                if (-[SBHIconImageCacheRequest matchesIcon:]((uint64_t)v13))
                {
                  [v13 cancel];
                  [v4 addObject:v13];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
            }
            while (v10);
          }

          v14 = SBLogIconImageCache();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v16;
            __int16 v30 = 2112;
            v31 = v7;
            _os_log_debug_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEBUG, "Purging cached %{public}@ image for icon with key: %@", buf, 0x16u);
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v19);
    }

    [a1[3] removeObjectsInArray:v4];
    [a1 removeStoredImageGenerationForIcons:obj];

    id v3 = v15;
  }
}

- (void)purgeAllCachedImages
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Purging all cached icon %{public}@ images", v2, v3, v4, v5, v6);
}

- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    uint64_t v4 = [(id)a1 _variantDescription];
    uint64_t v5 = SBLogIconImageCache();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBHIconImageVariantCache purgeAllCachedImagesForAppearancesOtherThanAppearances:]();
    }

    [*(id *)(a1 + 8) removeAllImagesForAppearancesOtherThanAppearances:v3];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    [*(id *)(a1 + 32) removeAllImagesForAppearancesOtherThanAppearances:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (uint64_t)cancelAllCachingRequests
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    BSDispatchQueueAssertMain();
    uint64_t v2 = SBLogIconImageCache();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      -[SBHIconImageVariantCache cancelAllCachingRequests](v2);
    }

    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(v1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cancel", (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    return [*(id *)(v1 + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)isCachingImageForIcon:(id *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    uint64_t v4 = [a1 _cacheKeyForIcon:v3];
    if (v4)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = a1[3];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v5);
            }
            if (-[SBHIconImageCacheRequest matchesIcon:](*(void *)(*((void *)&v10 + 1) + 8 * i)))
            {
              uint64_t v6 = 1;
              goto LABEL_13;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasCachingRequestsStillDoingWork
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 24) indexesOfObjectsPassingTest:&__block_literal_global_352];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (id)genericImageWithImageAppearance:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = +[SBHIconImageAppearanceStore defaultIcon];
    uint64_t v6 = [v4 imageForIcon:v5 appearance:v3];

    if (!v6)
    {
      uint64_t v6 = +[SBHIconImageCache genericImageWithInfo:imageAppearance:options:](SBHIconImageCache, "genericImageWithInfo:imageAppearance:options:", v3, [(id)a1 imageRetrievalOptions], *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
      uint64_t v7 = *(void **)(a1 + 40);
      if (!v7)
      {
        long long v8 = objc_alloc_init(SBHIconImageAppearanceStore);
        long long v9 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v8;

        uint64_t v7 = *(void **)(a1 + 40);
      }
      long long v10 = +[SBHIconImageAppearanceStore defaultIcon];
      [v7 setImage:v6 forIcon:v10 appearance:v3];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)cachingPlaceholderImageWithImageAppearance:(void *)a1
{
  if (a1)
  {
    a1 = -[SBHIconImageVariantCache genericImageWithImageAppearance:]((uint64_t)a1, a2);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)cancelCachingRequestsForIcon:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 24), "copy", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (-[SBHIconImageCacheRequest matchesIcon:]((uint64_t)v10))
          {
            [v10 cancel];
            char v7 = 1;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)resetFailedStatusForIcon:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    BSDispatchQueueAssertMain();
    [*(id *)(a1 + 16) removeObject:v3];
  }
}

- (void)cacheImageForIcon:(void *)a3 imageAppearance:(void *)a4 priority:(void *)a5 reason:(void *)a6 options:(void *)a7 cancellation:(void *)a8 completionHandler:
{
  id v15 = a2;
  id v16 = a3;
  id v27 = a5;
  id v17 = a7;
  id v18 = a8;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    if ((a6 & 4) != 0
      || (-[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:]((id *)a1, v15, v16, 0),
          (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v22 = [(id)a1 currentImageGenerationForIcon:v15];
      long long v25 = *(void **)(a1 + 72);
      long long v26 = (void *)v22;
      long long v23 = [SBHIconImageCacheRequest alloc];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __117__SBHIconImageVariantCache_cacheImageForIcon_imageAppearance_priority_reason_options_cancellation_completionHandler___block_invoke;
      v28[3] = &unk_1E6AACA68;
      id v29 = v18;
      long long v24 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:variant:options:sharedCancellation:iconImageCache:completionHandler:]((id *)&v23->super.isa, v15, v16, a4, v27, v26, v25, a6, v17, WeakRetained, v28);
      -[SBHIconImageVariantCache submitRequest:]((id *)a1, v24);

      long long v20 = 0;
    }
    else
    {
      long long v20 = (void *)v19;
      if (v18) {
        (*((void (**)(id, uint64_t))v18 + 2))(v18, 1);
      }
    }
  }
}

uint64_t __117__SBHIconImageVariantCache_cacheImageForIcon_imageAppearance_priority_reason_options_cancellation_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

uint64_t __42__SBHIconImageVariantCache_submitRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBackgroundCacheWorkForCachingRequest:*(void *)(a1 + 40)];
}

- (int64_t)effectivePriorityForPriority:(int64_t)a3
{
  if (self)
  {
    if (a3 >= 1) {
      int64_t v3 = 1;
    }
    else {
      int64_t v3 = a3;
    }
    if (self->_variant == 1) {
      return v3;
    }
  }
  return a3;
}

- (void)performBackgroundCacheWorkForCachingRequest:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBHIconImageCache _workQueue];
  BSDispatchQueueAssert();

  if (v4) {
    uint64_t v6 = (void *)*((void *)v4 + 4);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  v43[0] = 0;
  v43[1] = 0;
  [v7 getUUIDBytes:v43];
  uint64_t v8 = [(SBHIconImageVariantCache *)self _variantDescription];
  long long v9 = SBLogIconImageCache();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SBHIconImageVariantCache performBackgroundCacheWorkForCachingRequest:]();
  }

  if (v4)
  {
    *((void *)v4 + 18) = 1;
    if (-[SBHIconImageCacheRequest isCancelled]((uint64_t)v4))
    {
LABEL_7:
      long long v10 = SBLogIconImageCache();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v36 = v8;
        __int16 v37 = 1040;
        int v38 = 16;
        __int16 v39 = 2096;
        v40 = v43;
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@ caching request %{uuid_t}.16P because user cancelled", buf, 0x1Cu);
      }

      if (v4)
      {
        *((void *)v4 + 18) = 2;
        *((void *)v4 + 19) = 0;
      }
      v33[1] = MEMORY[0x1E4F143A8];
      v33[2] = 3221225472;
      v33[3] = __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke;
      v33[4] = &unk_1E6AACA90;
      v33[5] = self;
      id v34 = v4;
      BSDispatchMain();

      goto LABEL_36;
    }
    id v11 = *((id *)v4 + 5);
    long long v12 = (void *)*((void *)v4 + 8);
  }
  else
  {
    char v29 = -[SBHIconImageCacheRequest isCancelled](0);
    id v11 = 0;
    long long v12 = 0;
    if (v29) {
      goto LABEL_7;
    }
  }
  id v13 = v12;
  long long v14 = [(SBHIconImageVariantCache *)self attemptToBecomeActiveRequest:v4];
  if (v14)
  {
    id v15 = SBLogIconImageCache();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v14[4];
      *(_DWORD *)buf = 138544130;
      v36 = v8;
      __int16 v37 = 1040;
      int v38 = 16;
      __int16 v39 = 2096;
      v40 = v43;
      __int16 v41 = 2114;
      id v42 = v16;
      _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@ caching request %{uuid_t}.16P because another request matching this one is already active (%{public}@)", buf, 0x26u);
    }
    id v17 = v14[5];
    id v18 = v17;
    if (v4)
    {
      if (v17 == v11) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = 3;
      }
      *((void *)v4 + 18) = 3;
      *((void *)v4 + 19) = v19;
      -[SBHIconImageCacheRequest addDependentRequest:]((uint64_t)v14, v4);
      objc_storeWeak((id *)v4 + 20, v14);
    }
    else
    {
      -[SBHIconImageCacheRequest addDependentRequest:]((uint64_t)v14, 0);
    }
    v32[1] = MEMORY[0x1E4F143A8];
    v32[2] = 3221225472;
    v32[3] = __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_343;
    v32[4] = &unk_1E6AACA90;
    v32[5] = self;
    long long v20 = (id *)v33;
    v33[0] = v4;
    BSDispatchMain();
  }
  else
  {
    if (v4) {
      uint64_t v21 = *((void *)v4 + 12);
    }
    else {
      uint64_t v21 = 0;
    }
    id v18 = [(SBHIconImageVariantCache *)self _variantImageForIcon:v11 imageAppearance:v13 options:v21];
    if (v18)
    {
      id v30 = v13;
      long long v23 = [(SBHIconImageVariantCache *)self pooledIconImageForMappedIconImage:v18];
      long long v24 = v23;
      if (v23)
      {
        id v25 = v23;

        id v18 = v25;
      }
      if (v4) {
        uint64_t v26 = *((void *)v4 + 9);
      }
      else {
        uint64_t v26 = 0;
      }
      id v27 = [NSNumber numberWithUnsignedInteger:v26];
      objc_setAssociatedObject(v18, &SBHIconImageCacheImageGenerationKey, v27, (void *)0x303);

      id v13 = v30;
    }
    if (v4)
    {
      objc_setProperty_atomic(v4, v22, v18, 136);
      *((void *)v4 + 18) = 2;
      *((void *)v4 + 19) = 2;
    }
    v28 = SBLogIconImageCache();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138544130;
      v36 = v8;
      __int16 v37 = 1040;
      int v38 = 16;
      __int16 v39 = 2096;
      v40 = v43;
      __int16 v41 = 2048;
      id v42 = v18;
      _os_log_debug_impl(&dword_1D7F0A000, v28, OS_LOG_TYPE_DEBUG, "finishing background work for %{public}@ request %{uuid_t}.16P with image %p, queueing for main thread processing", buf, 0x26u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_344;
    block[3] = &unk_1E6AACA90;
    block[4] = self;
    long long v20 = (id *)v32;
    v32[0] = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }

LABEL_36:
}

uint64_t __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishBackgroundCacheWorkForCancelledCachingRequest:*(void *)(a1 + 40)];
}

uint64_t __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_343(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectIdenticalTo:*(void *)(a1 + 40)];
}

uint64_t __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_344(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishBackgroundCacheWorkForCachingRequest:*(void *)(a1 + 40)];
}

- (void)finishBackgroundCacheWorkForCachingRequest:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  BSDispatchQueueAssertMain();
  if (v4)
  {
    id v5 = v4[5];
    id v26 = objc_getProperty(v4, v6, 136, 1);
    id v7 = v4[8];
    unint64_t v8 = (unint64_t)v4[9];
    int v9 = (*((unsigned __int8 *)v4 + 96) >> 2) & 1;
  }
  else
  {
    unint64_t v8 = 0;
    id v26 = 0;
    id v5 = 0;
    id v7 = 0;
    LOBYTE(v9) = 0;
  }
  long long v10 = [(SBHIconImageVariantCache *)self _cacheKeyForIcon:v5];
  id v11 = [(SBHIconImageVariantCache *)self _variantDescription];
  if (v4) {
    id v12 = v4[4];
  }
  else {
    id v12 = 0;
  }
  v33[0] = 0;
  v33[1] = 0;
  id v25 = v12;
  [v25 getUUIDBytes:v33];
  id v13 = SBLogIconImageCache();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)v28 = 16;
    *(_WORD *)&void v28[4] = 2096;
    *(void *)&v28[6] = v33;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "starting main thread processing work for request %{uuid_t}.16P", buf, 0x12u);
  }

  [(NSMutableArray *)self->_cachingRequests removeObjectIdenticalTo:v4];
  unint64_t v14 = [(SBHIconImageVariantCache *)self storedImageGenerationForIcon:v5 imageAppearance:v7];
  if (v14) {
    BOOL v15 = v14 >= v8;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15) {
    char v16 = v9;
  }
  else {
    char v16 = 1;
  }
  if (v16)
  {
LABEL_23:
    uint64_t v22 = SBLogIconImageCache();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    uint64_t v21 = v26;
    if (v26)
    {
      if (v23)
      {
        *(_DWORD *)buf = 138544642;
        *(void *)v28 = v11;
        *(_WORD *)&v28[8] = 2112;
        *(void *)&v28[10] = v10;
        *(_WORD *)&v28[18] = 2112;
        *(void *)&v28[20] = v7;
        *(_WORD *)&v28[28] = 2048;
        *(void *)&v28[30] = v8;
        __int16 v29 = 1040;
        int v30 = 16;
        __int16 v31 = 2096;
        v32 = v33;
        _os_log_debug_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_DEBUG, "Caching %{public}@ image for %@/%@/%lu for request %{uuid_t}.16P", buf, 0x3Au);
      }

      [(SBHIconImageAppearanceStore *)self->_images setImage:v26 forIcon:v5 appearance:v7];
      [(SBHIconImageVariantCache *)self setStoredImageGeneration:v8 forIcon:v5 imageAppearance:v7];
      [(SBHIconImageVariantCache *)self addCachedIcon:v5];
      [(NSHashTable *)self->_failedIcons removeObject:v5];
      uint64_t v24 = 2;
      if (!v4) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v23)
      {
        *(_DWORD *)buf = 138544130;
        *(void *)v28 = v11;
        *(_WORD *)&v28[8] = 2112;
        *(void *)&v28[10] = v10;
        *(_WORD *)&v28[18] = 1040;
        *(_DWORD *)&v28[20] = 16;
        *(_WORD *)&v28[24] = 2096;
        *(void *)&v28[26] = v33;
        _os_log_debug_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_DEBUG, "Failed to generate %{public}@ image in background for icon with key %@ for request %{uuid_t}.16P", buf, 0x26u);
      }

      [(NSHashTable *)self->_failedIcons addObject:v5];
      uint64_t v24 = 1;
      if (!v4) {
        goto LABEL_28;
      }
    }
    v4[18] = (id)4;
    v4[19] = (id)v24;
LABEL_28:
    [(SBHIconImageVariantCache *)self cleanUpCachingRequest:v4];
    goto LABEL_29;
  }
  unint64_t v17 = v14;
  id v18 = [(SBHIconImageAppearanceStore *)self->_images imageForIcon:v5 appearance:v7];
  uint64_t v19 = SBLogIconImageCache();
  long long v20 = v19;
  if (!v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SBHIconImageVariantCache finishBackgroundCacheWorkForCachingRequest:]();
    }

    [(SBHIconImageVariantCache *)self removeStoredImageGenerationForIcon:v5 imageAppearance:v7];
    goto LABEL_23;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68158466;
    *(_DWORD *)v28 = 16;
    *(_WORD *)&void v28[4] = 2096;
    *(void *)&v28[6] = v33;
    *(_WORD *)&v28[14] = 2048;
    *(void *)&v28[16] = v8;
    *(_WORD *)&v28[24] = 2048;
    *(void *)&v28[26] = v17;
    _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, "Stopping caching operation %{uuid_t}.16P because the image generation (%lu) is already stored (%lu)", buf, 0x26u);
  }

  if (v4)
  {
    v4[18] = (id)4;
    v4[19] = (id)1;
  }
  [(SBHIconImageVariantCache *)self cleanUpCachingRequest:v4];

  uint64_t v21 = v26;
LABEL_29:
}

- (void)finishBackgroundCacheWorkForCancelledCachingRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  BSDispatchQueueAssertMain();
  if (v4) {
    info = (void *)v4[1].info;
  }
  else {
    info = 0;
  }
  id v6 = info;
  id v7 = [(SBHIconImageVariantCache *)self _cacheKeyForIcon:v6];
  unint64_t v8 = SBLogIconImageCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = -[SBHIconImageCacheRequest variantDescription](v4);
    if (v4) {
      isa = v4[1].isa;
    }
    else {
      isa = 0;
    }
    id v11 = isa;
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2112;
    unint64_t v17 = v7;
    _os_log_debug_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEBUG, "Cleaning up cancelled %{public}@ request %{public}@ for icon %@", (uint8_t *)&v12, 0x20u);
  }
  [(SBHIconImageVariantCache *)self cleanUpCachingRequest:v4];
}

- (void)cleanUpCachingRequest:(id)a3
{
  id v5 = a3;
  if (v5) {
    v5[1] = mach_continuous_time();
  }
  [(NSMutableArray *)self->_cachingRequests removeObjectIdenticalTo:v5];
  [(SBHIconImageVariantCache *)self clearActiveRequest:v5];
  -[SBHIconImageCacheRequest callCompletionHandlers]((uint64_t)v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  [WeakRetained checkIfCachingActivityHasCompleted];
}

- (void)performSynchronousCacheRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4[5];
    id v7 = v5[8];
    unint64_t v8 = (void (**)(id, uint64_t))v5[15];
    id v9 = v5[12];
    id v10 = v5[9];
  }
  else
  {
    id v9 = 0;
    id v7 = 0;
    id v6 = 0;
    unint64_t v8 = 0;
    id v10 = 0;
  }
  id v11 = [(SBHIconImageVariantCache *)self _cacheKeyForIcon:v6];
  int v12 = [(SBHIconImageVariantCache *)self _variantDescription];
  id v13 = [(SBHIconImageVariantCache *)self _variantImageForIcon:v6 imageAppearance:v7 options:v9];
  if (v13)
  {
    long long v20 = v12;
    __int16 v14 = v11;
    id v15 = [(SBHIconImageVariantCache *)self pooledIconImageForMappedIconImage:v13];
    __int16 v16 = SBLogIconImageCache();
    unint64_t v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[SBHIconImageVariantCache performSynchronousCacheRequest:]();
      }

      [(SBHIconImageAppearanceStore *)self->_images setImage:v15 forIcon:v6 appearance:v7];
      [(SBHIconImageVariantCache *)self setStoredImageGeneration:v10 forIcon:v6 imageAppearance:v7];
      [(SBHIconImageVariantCache *)self addCachedIcon:v6];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v23 = v20;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_INFO, "Could not pool %{public}@ image for icon in foreground with key: %@", buf, 0x16u);
      }
    }
    id v11 = v14;
    int v12 = v20;
  }
  else if ([(id)objc_opt_class() hasIconImage])
  {
    uint64_t v18 = SBLogIconImageCache();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      BOOL v23 = v12;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_INFO, "Could not make %{public}@ image for icon in foreground with key: %@", buf, 0x16u);
    }

    [(SBHIconImageAppearanceStore *)self->_images removeAllImagesForIcon:v6];
    [(NSHashTable *)self->_failedIcons addObject:v6];
    id v21 = v6;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [(SBHIconImageVariantCache *)self removeStoredImageGenerationForIcons:v19];

    [(SBHIconImageVariantCache *)self removeCachedIcon:v6];
  }
  if (v8) {
    v8[2](v8, 2);
  }
}

void __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = a3;
  dispatch_group_enter(v4);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke_2;
  v8[3] = &unk_1E6AACAB8;
  id v9 = *(id *)(a1 + 32);
  -[SBHIconImageVariantCache cacheImageForIcon:imageAppearance:priority:reason:options:cancellation:completionHandler:](v6, v7, v5, (void *)1, @"recacheImagesForIcon", (void *)4, 0, v8);
}

void __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke_2(uint64_t a1)
{
}

BOOL __60__SBHIconImageVariantCache_hasCachingRequestsStillDoingWork__block_invoke(uint64_t a1, uint64_t a2)
{
  return !a2 || *(void *)(a2 + 144) != 4;
}

- (void)removeStoredImageGenerationForIcon:(id)a3 imageAppearance:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(SBHIconImageAppearanceStore *)self->_storedImageGenerations removeImageForIcon:v8 appearance:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeStoredImageGenerationForIcons:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(SBHIconImageAppearanceStore *)self->_storedImageGenerations removeAllImagesForIcons:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllStoredImageGenerations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(SBHIconImageAppearanceStore *)self->_storedImageGenerations removeAllImages];
  os_unfair_lock_unlock(p_lock);
}

- (id)attemptToBecomeActiveRequest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    uint64_t v6 = (void *)*((void *)v4 + 14);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(NSMutableDictionary *)self->_activeRequests objectForKey:v7];
  if (v9)
  {
    id v10 = SBLogIconImageCache();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SBHIconImageVariantCache attemptToBecomeActiveRequest:]();
    }
  }
  else
  {
    activeRequests = self->_activeRequests;
    if (!activeRequests)
    {
      int v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = self->_activeRequests;
      self->_activeRequests = v12;

      activeRequests = self->_activeRequests;
    }
    [(NSMutableDictionary *)activeRequests setObject:v5 forKey:v7];
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)clearActiveRequest:(id)a3
{
  if (a3) {
    id v5 = (void *)*((void *)a3 + 14);
  }
  else {
    id v5 = 0;
  }
  id v8 = v5;
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_activeRequests objectForKey:v8];

  if (v7 == v6) {
    [(NSMutableDictionary *)self->_activeRequests removeObjectForKey:v8];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addCachedIcon:(id)a3
{
  id v6 = a3;
  id v4 = -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:");
  id v5 = [(NSMutableDictionary *)self->_iconsByIconCacheIdentifier objectForKey:v4];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_iconsByIconCacheIdentifier setObject:v5 forKey:v4];
  }
  [v5 addObject:v6];
}

- (BOOL)hasOtherCachedIconsForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconImageVariantCache *)self _cacheKeyForIcon:v4];
  id v6 = [(NSMutableDictionary *)self->_iconsByIconCacheIdentifier objectForKey:v5];
  uint64_t v7 = [v6 count];
  int v8 = [v6 containsObject:v4];

  return v7 != v8;
}

- (void)removeCachedIcon:(id)a3
{
  id v4 = a3;
  id v6 = [(SBHIconImageVariantCache *)self _cacheKeyForIcon:v4];
  id v5 = [(NSMutableDictionary *)self->_iconsByIconCacheIdentifier objectForKey:v6];
  [v5 removeObject:v4];
}

- (void)removeAllCachedIcons
{
}

- (unint64_t)iconImageOptions
{
  return !self || !self->_variant;
}

- (unint64_t)imageRetrievalOptions
{
  if (self) {
    return 2 * (*(void *)(self + 72) == 1);
  }
  return self;
}

- (id)_variantImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 appearanceType] != 2
    || ([(SBHIconImageVariantCache *)self _tintedImageFromTintableImageForIcon:v7 imageAppearance:v8], (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageAppearance:", v8);
    if (self)
    {
      double width = self->_iconImageInfo.size.width;
      double height = self->_iconImageInfo.size.height;
      double scale = self->_iconImageInfo.scale;
      double continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
    }
    else
    {
      double height = 0.0;
      double scale = 0.0;
      double continuousCornerRadius = 0.0;
      double width = 0.0;
    }
    unint64_t v15 = [(SBHIconImageVariantCache *)self iconImageOptions];
    mach_continuous_time();
    id v9 = objc_msgSend(v7, "iconImageWithInfo:traitCollection:options:", v10, v15, width, height, scale, continuousCornerRadius);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    __int16 v16 = SBLogIconImageCache();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SBHIconImageVariantCache _variantImageForIcon:imageAppearance:options:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  return v9;
}

- (id)_tintedImageFromTintableImageForIcon:(id)a3 imageAppearance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SBHIconImageAppearance tintableAppearance];
  id v9 = [(SBHIconImageAppearanceStore *)self->_images imageForIcon:v7 appearance:v8];

  if (v9)
  {
    id v10 = [v6 tintColor];
    mach_continuous_time();
    id v11 = SBHTintedImageFromTintableImage(v9, v10);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    int v12 = SBLogIconImageCache();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SBHIconImageVariantCache _tintedImageFromTintableImageForIcon:imageAppearance:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_variantDescription
{
  if (self && ((variant = self->_variant, variant != 1) ? (int64_t v3 = 0) : (int64_t v3 = @"ummasked"), variant)) {
    return v3;
  }
  else {
    return @"masked";
  }
}

- (id)_cacheKeyForIcon:(id)a3
{
  return (id)[a3 iconImageCacheIdentifier];
}

- (BOOL)_canPoolImage
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  }
  else {
    id WeakRetained = 0;
  }
  char v3 = [WeakRetained _canPoolImage];

  return v3;
}

- (id)iconImagesMemoryPool
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  }
  else {
    id WeakRetained = 0;
  }
  char v3 = [WeakRetained iconImagesMemoryPool];

  return v3;
}

- (id)_iconImageOfSize:(CGSize)a3 scale:(double)a4 failGracefully:(BOOL)a5 drawing:(id)a6
{
  BOOL v6 = a5;
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  int v12 = [(SBHIconImageVariantCache *)self iconImagesMemoryPool];
  if (v6
    && (unint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_bytesNeededForSize:scale:withContextType:", 0, width, height, a4),
        v13 > [v12 slotLength]))
  {
    uint64_t v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24.double width = width;
      v24.double height = height;
      uint64_t v15 = NSStringFromCGSize(v24);
      int v18 = 138543618;
      uint64_t v19 = v15;
      __int16 v20 = 2048;
      double v21 = a4;
      _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "color context with dimensions %{public}@ @%fx does not fit in 'iconImages' memory pool - returning nil", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, v12, v11, width, height, a4);
  }

  return v16;
}

- (id)_pooledIconImageForIconImage:(id)a3 allowingOptOut:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if (!v4 || [(SBHIconImageVariantCache *)self _canPoolImage])
    {
      id v7 = [(SBHIconImageVariantCache *)self iconImagesMemoryPool];
      objc_msgSend(v6, "sbf_memoryMappedImageWithPool:", v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8) {
        goto LABEL_10;
      }
      id v9 = SBLogIconImageCache();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        id v12 = v6;
        _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "Icon image %p could not be pooled as BGRA without color clamping, returning original image instead", (uint8_t *)&v11, 0xCu);
      }
    }
    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }
LABEL_10:

  return v8;
}

- (id)pooledIconImageForMappedIconImage:(id)a3
{
  return [(SBHIconImageVariantCache *)self _pooledIconImageForIconImage:a3 allowingOptOut:1];
}

- (id)memoryMappedIconImageForIconImage:(id)a3
{
  return [(SBHIconImageVariantCache *)self _pooledIconImageForIconImage:a3 allowingOptOut:0];
}

- (id)memoryMappedIconImageOfSize:(CGSize)a3 scale:(double)a4 withDrawing:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  id v10 = -[SBHIconImageVariantCache _iconImageOfSize:scale:failGracefully:drawing:](self, "_iconImageOfSize:scale:failGracefully:drawing:", 1, v9, width, height, a4);
  int v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1818], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, v9, width, height, a4);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = v12;

  return v13;
}

- (NSString)description
{
  return (NSString *)[(SBHIconImageVariantCache *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBHIconImageVariantCache *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(SBHIconImageVariantCache *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBHIconImageVariantCache *)self succinctDescriptionBuilder];
  id v5 = [(SBHIconImageVariantCache *)self _variantDescription];
  id v6 = (id)[v4 appendObject:v5 withName:@"variant"];

  if (self)
  {
    double scale = self->_iconImageInfo.scale;
    id v8 = (id)objc_msgSend(v4, "appendSize:withName:", @"imageSize", self->_iconImageInfo.size.width, self->_iconImageInfo.size.height);
    id v9 = (id)[v4 appendFloat:@"imageScale" withName:scale];
    id v10 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconImageAppearanceStore numberOfCachedImages](self->_images, "numberOfCachedImages"), @"cachedImageCount");
    NSUInteger v11 = [(NSHashTable *)self->_failedIcons count];
  }
  else
  {
    id v14 = (id)objc_msgSend(v4, "appendSize:withName:", @"imageSize", 0.0, 0.0);
    id v15 = (id)[v4 appendFloat:@"imageScale" withName:0.0];
    id v16 = (id)[v4 appendUnsignedInteger:0 withName:@"cachedImageCount"];
    NSUInteger v11 = 0;
  }
  id v12 = (id)[v4 appendUnsignedInteger:v11 withName:@"failedIconsCount"];
  return v4;
}

- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "Purging all cached icon %{public}@ images for appearances other than %@");
}

- (void)cancelAllCachingRequests
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_DEBUG, "Canceling all caching requests", v1, 2u);
}

- (void)performBackgroundCacheWorkForCachingRequest:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1040;
  int v4 = 16;
  __int16 v5 = 2096;
  uint64_t v6 = v0;
  _os_log_debug_impl(&dword_1D7F0A000, v1, OS_LOG_TYPE_DEBUG, "starting background work for %{public}@ request %{uuid_t}.16P", v2, 0x1Cu);
}

- (void)finishBackgroundCacheWorkForCachingRequest:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "We think we stored image generation %lu but no image found", v1, 0xCu);
}

- (void)performSynchronousCacheRequest:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "Caching %{public}@ image for icon in foreground with key: %@");
}

- (void)attemptToBecomeActiveRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Pre-existing active request found when trying to service request for %@", v2, v3, v4, v5, v6);
}

- (void)_variantImageForIcon:(uint64_t)a3 imageAppearance:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_tintedImageFromTintableImageForIcon:(uint64_t)a3 imageAppearance:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end