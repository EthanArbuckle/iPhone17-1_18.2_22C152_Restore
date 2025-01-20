@interface SBHIconImageCache
+ (BOOL)canFallBackToLightImageForImageAppearance:(id)a3;
+ (BOOL)hasUniqueCachingPlaceholderImage;
+ (BOOL)supportsMemoryPooling;
+ (id)_workQueue;
+ (id)genericImageWithInfo:(SBIconImageInfo *)a3;
+ (id)genericImageWithInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
+ (id)overlayImageWithInfo:(SBIconImageInfo *)a3;
+ (id)tintingBackgroundImageWithInfo:(SBIconImageInfo *)a3;
+ (id)unmaskedOverlayImageWithInfo:(SBIconImageInfo *)a3;
+ (int64_t)defaultPriority;
+ (unint64_t)optionsForRetrievalOptions:(unint64_t)a3;
+ (unint64_t)retrievalOptionsForOptions:(unint64_t)a3;
+ (unsigned)qosClassForPriority:(int64_t)a3;
+ (void)pauseCaching;
+ (void)resumeCaching;
- (BOOL)_canPoolImage;
- (BOOL)currentRequestChangedImageVisually;
- (BOOL)hasCachedImagesForIcons:(id)a3 imageAppearances:(id)a4 options:(unint64_t)a5;
- (BOOL)hasCachingRequests;
- (BOOL)hasCachingRequestsStillDoingWork;
- (BOOL)isCachingImageForIcon:(id)a3;
- (CPMemoryPool)iconImagesMemoryPool;
- (NSString)description;
- (NSString)name;
- (SBHIconImageAppearance)lastCachedImageAppearance;
- (SBHIconImageCache)initWithName:(id)a3 iconImageInfo:(SBIconImageInfo *)a4;
- (SBIconImageInfo)iconImageInfo;
- (UIImage)genericImage;
- (UIImage)overlayImage;
- (UIImage)tintingBackgroundImage;
- (UIImage)unmaskedOverlayImage;
- (double)currentRequestElapsedTime;
- (id)_cacheKeyForIcon:(id)a3;
- (id)_iconImageOfSize:(CGSize)a3 scale:(double)a4 failGracefully:(BOOL)a5 drawing:(id)a6;
- (id)_pooledIconImageForIconImage:(id)a3 allowingOptOut:(BOOL)a4;
- (id)activityDescription;
- (id)buildCacheRequestWithReason:(id)a3;
- (id)cacheImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollections:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollections:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (id)cacheImagesForIcons:(id)a3 prioritizedImageAppearances:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (id)cachedImageForIcon:(id)a3;
- (id)cachedImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5;
- (id)cachedImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
- (id)cachedUnmaskedImageForIcon:(id)a3;
- (id)cachingPlaceholderImageWithImageAppearance:(id)a3 options:(unint64_t)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)finalizeRequestBuilder:(id)a3 completionHandler:(id)a4;
- (id)genericImageWithImageAppearance:(id)a3 options:(unint64_t)a4;
- (id)imageForIcon:(id)a3;
- (id)imageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5;
- (id)imageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
- (id)imageForIcon:(id)a3 options:(unint64_t)a4;
- (id)memoryMappedIconImageForIconImage:(id)a3;
- (id)memoryMappedIconImageOfSize:(CGSize)a3 scale:(double)a4 withDrawing:(id)a5;
- (id)pooledIconImageForMappedIconImage:(id)a3;
- (id)realImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5;
- (id)realImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)unmaskedImageForIcon:(id)a3;
- (id)unmaskedImageForIcon:(id)a3 options:(unint64_t)a4;
- (id)variantCacheForOptions:(unint64_t)a3;
- (unint64_t)cachingRequestCount;
- (unint64_t)currentImageGenerationForIcon:(id)a3;
- (unint64_t)currentRequestStartTimestamp;
- (unint64_t)imageGenerationForCachedImage:(id)a3;
- (unint64_t)numberOfCacheHits;
- (unint64_t)numberOfCacheMisses;
- (unint64_t)numberOfCachedImages;
- (unint64_t)numberOfCachedImagesForAppearance:(id)a3 options:(unint64_t)a4;
- (unint64_t)numberOfCachedImagesForAppearanceType:(int64_t)a3 options:(unint64_t)a4;
- (unint64_t)numberOfMainThreadImageLoads;
- (unint64_t)numberOfUnmaskedCacheHits;
- (unint64_t)numberOfUnmaskedCacheMisses;
- (unint64_t)numberOfUnmaskedCachedImages;
- (unint64_t)poolingBypassCount;
- (void)addObserver:(id)a3;
- (void)beginObservingIconIfNecessary:(id)a3;
- (void)cacheImage:(id)a3 forIcon:(id)a4 imageAppearance:(id)a5;
- (void)cacheImageForIcon:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)cacheImagesForIcons:(id)a3;
- (void)cacheImagesForIcons:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)cacheUnmaskedImagesForIcons:(id)a3;
- (void)cancelAllCachingRequests;
- (void)checkIfCachingActivityHasCompleted;
- (void)endObservingAllIcons;
- (void)endObservingIcon:(id)a3;
- (void)enumerateVariantCachesUsingBlock:(id)a3;
- (void)finishedAsynchronousLoadOfIcon:(id)a3 imageAppearance:(id)a4 variant:(int64_t)a5 context:(SBHIconImageCacheRequestResultContext *)a6;
- (void)iconImageDidUpdate:(id)a3;
- (void)incrementImageGenerationForIcon:(id)a3;
- (void)notifyObserversOfUpdateForIcon:(id)a3 imageAppearance:(id)a4 context:(SBHIconImageCacheRequestResultContext *)a5;
- (void)performBackgroundCachingActivityUsingPriority:(int64_t)a3 block:(id)a4;
- (void)performBackgroundCachingActivityUsingQOSClass:(unsigned int)a3 block:(id)a4;
- (void)performBackgroundFileActivityUsingBlock:(id)a3;
- (void)performWhenCachingActivityCompletesUsingBlock:(id)a3;
- (void)purgeAllCachedImages;
- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:(id)a3;
- (void)purgeCachedImagesForIcons:(id)a3;
- (void)recacheImagesForIcon:(id)a3 completionHandler:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setLastCachedImageAppearance:(id)a3;
- (void)setPoolingBypassCount:(unint64_t)a3;
- (void)submitRequest:(id)a3;
- (void)submitRequests:(id)a3;
- (void)updateImageForIcon:(id)a3;
@end

@implementation SBHIconImageCache

- (id)imageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BSDispatchQueueAssertMain();
  v10 = [(SBHIconImageCache *)self cachedImageForIcon:v8 imageAppearance:v9 options:a5];
  v11 = v10;
  if ((a5 & 4) != 0 || v10)
  {
    id v15 = v10;
LABEL_12:
    v12 = v15;
    goto LABEL_13;
  }
  v12 = [(SBHIconImageCache *)self realImageForIcon:v8 imageAppearance:v9 options:a5];
  if (!v12)
  {
    int v13 = [(id)objc_opt_class() canFallBackToLightImageForImageAppearance:v9];
    if ((a5 & 0x10) != 0
      || !v13
      || (+[SBHIconImageAppearance defaultAppearance],
          v14 = objc_claimAutoreleasedReturnValue(),
          [(SBHIconImageCache *)self cachedImageForIcon:v8 imageAppearance:v14 options:a5], v12 = objc_claimAutoreleasedReturnValue(), v14, !v12))
    {
      if ([(id)objc_opt_class() hasIconImage])
      {
        if ([(SBHIconImageCache *)self isCachingImageForIcon:v8]) {
          [(SBHIconImageCache *)self cachingPlaceholderImageWithImageAppearance:v9 options:a5];
        }
        else {
        id v15 = [(SBHIconImageCache *)self genericImageWithImageAppearance:v9 options:a5];
        }
        goto LABEL_12;
      }
      v12 = 0;
    }
  }
LABEL_13:

  return v12;
}

- (id)cachedImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BSDispatchQueueAssertMain();
  if ((a5 & 8) != 0)
  {
    v11 = 0;
  }
  else
  {
    v10 = [(SBHIconImageCache *)self variantCacheForOptions:a5];
    v11 = -[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:](v10, v8, v9, a5);
  }
  return v11;
}

- (id)variantCacheForOptions:(unint64_t)a3
{
  uint64_t v3 = 16;
  if ((a3 & 2) == 0) {
    uint64_t v3 = 8;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (SBHIconImageCache)initWithName:(id)a3 iconImageInfo:(SBIconImageInfo *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  id v13 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBHIconImageCache;
  v14 = [(SBHIconImageCache *)&v31 init];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_iconImageInfo.size.width = v11;
    v14->_iconImageInfo.size.height = v10;
    v14->_iconImageInfo.scale = v9;
    v14->_iconImageInfo.continuousCornerRadius = v8;
    if ([(id)objc_opt_class() supportsMemoryPooling])
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_bytesNeededForSize:scale:withContextType:", 0, v11, v10, v9);
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4BE60]), "initWithLabel:slotLength:", objc_msgSend(v13, "UTF8String"), v17);
      iconImagesMemoryPool = v14->_iconImagesMemoryPool;
      v14->_iconImagesMemoryPool = (CPMemoryPool *)v18;
    }
    v20 = (SBHIconImageVariantCache *)-[SBHIconImageVariantCache initWithVariant:iconImageInfo:]([SBHIconImageVariantCache alloc], 0, v11, v10, v9, v8);
    maskedCache = v14->_maskedCache;
    v14->_maskedCache = v20;

    v22 = v14->_maskedCache;
    if (v22) {
      objc_storeWeak((id *)&v22->_iconImageCache, v14);
    }
    v23 = (SBHIconImageVariantCache *)-[SBHIconImageVariantCache initWithVariant:iconImageInfo:]([SBHIconImageVariantCache alloc], 1, v11, v10, v9, v8);
    unmaskedCache = v14->_unmaskedCache;
    v14->_unmaskedCache = v23;

    v25 = v14->_unmaskedCache;
    if (v25) {
      objc_storeWeak((id *)&v25->_iconImageCache, v14);
    }
    uint64_t v26 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observedIcons = v14->_observedIcons;
    v14->_observedIcons = (NSHashTable *)v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    iconImageGenerations = v14->_iconImageGenerations;
    v14->_iconImageGenerations = v28;
  }
  return v14;
}

- (void)cacheImage:(id)a3 forIcon:(id)a4 imageAppearance:(id)a5
{
  id v8 = a5;
  id v10 = a4;
  id v9 = a3;
  BSDispatchQueueAssertMain();
  -[SBHIconImageVariantCache cacheImage:forIcon:imageAppearance:]((id *)&self->_maskedCache->super.isa, v9, v10, v8);

  [(SBHIconImageCache *)self beginObservingIconIfNecessary:v10];
}

- (void)beginObservingIconIfNecessary:(id)a3
{
  id v4 = a3;
  if (![(NSHashTable *)self->_observedIcons containsObject:v4])
  {
    [(NSHashTable *)self->_observedIcons addObject:v4];
    [v4 addObserver:self];
    double v5 = SBLogIconImageCache();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBHIconImageCache beginObservingIconIfNecessary:]();
    }

    double v6 = [(SBHIconImageCache *)self cachedImageForIcon:v4 compatibleWithTraitCollection:0 options:0];
    if (v6)
    {
      double v7 = +[SBHIconImageAppearance lightAppearance];
      memset(v8, 0, sizeof(v8));
      [(SBHIconImageCache *)self notifyObserversOfUpdateForIcon:v4 imageAppearance:v7 context:v8];
    }
  }
}

- (unint64_t)currentImageGenerationForIcon:(id)a3
{
  id v4 = [a3 iconImageCacheIdentifier];
  double v5 = [(NSMutableDictionary *)self->_iconImageGenerations objectForKey:v4];
  double v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 1;
  }

  return v7;
}

- (void)notifyObserversOfUpdateForIcon:(id)a3 imageAppearance:(id)a4 context:(SBHIconImageCacheRequestResultContext *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BSDispatchQueueAssertMain();
  self->_currentRequestStartTimestamp = a5->var0;
  p_var1 = &a5->var1;
  self->_currentRequestElapsedTime = a5->var1;
  self->_currentRequestChangedImageVisually = a5->var2 != 2;
  double v11 = SBLogIconImageCache();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBHIconImageCache notifyObserversOfUpdateForIcon:imageAppearance:context:](v8, (uint64_t)p_var1, v11);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v17 iconImageCache:self didUpdateImageForIcon:v8 imageAppearance:v9];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  self->_currentRequestChangedImageVisually = 0;
  self->_currentRequestStartTimestamp = 0;
  self->_currentRequestElapsedTime = 0.0;
}

- (id)cachedImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  BSDispatchQueueAssertMain();
  id v10 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v8);

  double v11 = [(SBHIconImageCache *)self cachedImageForIcon:v9 imageAppearance:v10 options:a5];

  return v11;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    double v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSHashTable *)self->_observers removeObject:v4];
}

uint64_t __105__SBHIconImageCache_cacheImagesForIcons_compatibleWithTraitCollections_reason_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sbh_iconImageAppearance");
}

void __100__SBHIconImageCache_cacheImagesForIcons_imageAppearances_priority_reason_options_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [[SBHIconImageCacheResult alloc] initWithRequestIdentifier:*(void *)(a1 + 32)];
  [(SBHIconImageCacheResult *)v2 calculateElapsedTime];
  [(SBHIconImageCacheResult *)v2 setFinished:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)cacheImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 arrayWithObjects:&v17 count:1];

  uint64_t v15 = -[SBHIconImageCache cacheImagesForIcons:compatibleWithTraitCollection:options:completionHandler:](self, "cacheImagesForIcons:compatibleWithTraitCollection:options:completionHandler:", v14, v12, a5, v11, v17, v18);

  return v15;
}

- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (a4)
  {
    id v17 = a4;
    id v12 = (void *)MEMORY[0x1E4F1C978];
    id v13 = a4;
    uint64_t v14 = [v12 arrayWithObjects:&v17 count:1];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v15 = -[SBHIconImageCache cacheImagesForIcons:compatibleWithTraitCollections:options:completionHandler:](self, "cacheImagesForIcons:compatibleWithTraitCollections:options:completionHandler:", v10, v14, a5, v11, v17, v18);

  return v15;
}

- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollections:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  id v13 = objc_msgSend(a4, "bs_mapNoNulls:", &__block_literal_global_12);
  if (![v13 count])
  {
    uint64_t v14 = +[SBHIconImageAppearance defaultAppearance];
    v18[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

    id v13 = (void *)v15;
  }
  v16 = [(SBHIconImageCache *)self cacheImagesForIcons:v11 imageAppearances:v13 options:a6 completionHandler:v12];

  return v16;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  return [(SBHIconImageCache *)self cacheImagesForIcons:a3 imageAppearances:a4 reason:&stru_1F2FA0300 options:a5 completionHandler:a6];
}

- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollections:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  return [(SBHIconImageCache *)self cacheImagesForIcons:a3 compatibleWithTraitCollections:a4 reason:0 options:a5 completionHandler:a6];
}

- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v20 = a4;
  id v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 arrayWithObjects:&v20 count:1];

  uint64_t v18 = -[SBHIconImageCache cacheImagesForIcons:imageAppearances:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:reason:options:completionHandler:", v16, v17, v14, a6, v13, v20, v21);

  return v18;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = -[SBHIconImageCache cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:", v15, v14, [(id)objc_opt_class() defaultPriority], v13, a6, v12);

  return v16;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v41 = a4;
  id v15 = a6;
  id v16 = a8;
  BSDispatchQueueAssertMain();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v54 != v20) {
          objc_enumerationMutation(v17);
        }
        [(SBHIconImageCache *)self beginObservingIconIfNecessary:*(void *)(*((void *)&v53 + 1) + 8 * i)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v19);
  }

  if (-[SBHIconImageCache hasCachedImagesForIcons:imageAppearances:options:](self, "hasCachedImagesForIcons:imageAppearances:options:", v17, v41, [(id)objc_opt_class() retrievalOptionsForOptions:a7] | 0x20))
  {
    v22 = objc_alloc_init(SBHIconImageCacheCancellation);
    uint64_t v23 = v22;
    if (!v16) {
      goto LABEL_27;
    }
    v24 = [(SBHIconImageCacheCancellation *)v22 identifier];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__SBHIconImageCache_cacheImagesForIcons_imageAppearances_priority_reason_options_completionHandler___block_invoke;
    block[3] = &unk_1E6AAC8E8;
    id v51 = v24;
    id v52 = v16;
    id v25 = v24;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v37 = v16;
    id v38 = v15;
    id v25 = [(SBHIconImageCache *)self buildCacheRequestWithReason:v15];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v36 = v17;
    obuint64_t j = v17;
    uint64_t v26 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v40 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v47 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v30 = v41;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v42 objects:v57 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v43;
            do
            {
              for (uint64_t k = 0; k != v32; ++k)
              {
                if (*(void *)v43 != v33) {
                  objc_enumerationMutation(v30);
                }
                objc_msgSend(v25, "addIcon:imageAppearance:priority:options:", v29, *(void *)(*((void *)&v42 + 1) + 8 * k), a5, a7, v36);
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v42 objects:v57 count:16];
            }
            while (v32);
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v27);
    }

    id v16 = v37;
    uint64_t v23 = [v25 finalizeRequestWithCompletionHandler:v37];
    id v15 = v38;
    id v17 = v36;
  }

LABEL_27:
  return v23;
}

- (BOOL)hasCachedImagesForIcons:(id)a3 imageAppearances:(id)a4 options:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v8;
  uint64_t v23 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v11 = *(void *)v30;
    id v24 = v9;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v10);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v14 = v9;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = [(SBHIconImageCache *)self cachedImageForIcon:v13 imageAppearance:*(void *)(*((void *)&v25 + 1) + 8 * j) options:a5];

              if (!v19)
              {

                BOOL v20 = 0;
                id v9 = v24;
                goto LABEL_19;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        id v9 = v24;
        uint64_t v11 = v22;
      }
      BOOL v20 = 1;
      uint64_t v23 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
  else
  {
    BOOL v20 = 1;
  }
LABEL_19:

  return v20;
}

+ (unint64_t)retrievalOptionsForOptions:(unint64_t)a3
{
  return 2 * (a3 & 1);
}

+ (int64_t)defaultPriority
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCachedImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImagesMemoryPool, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconImageGenerations, 0);
  objc_storeStrong((id *)&self->_performAfterCachingActivityBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observedIcons, 0);
  objc_storeStrong((id *)&self->_tintingBackgroundImage, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayImage, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_unmaskedCache, 0);
  objc_storeStrong((id *)&self->_maskedCache, 0);
}

+ (id)_workQueue
{
  if (_workQueue_onceToken != -1) {
    dispatch_once(&_workQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_workQueue__workQueue;
  return v2;
}

void __31__SBHIconImageCache__workQueue__block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.SpringBoardHome.SBHIconImageCache.work");
  v1 = (void *)_workQueue__workQueue;
  _workQueue__workQueue = (uint64_t)v0;
}

+ (BOOL)supportsMemoryPooling
{
  return 1;
}

- (id)imageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  BSDispatchQueueAssertMain();
  id v10 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v8);

  uint64_t v11 = [(SBHIconImageCache *)self imageForIcon:v9 imageAppearance:v10 options:a5];

  return v11;
}

- (id)imageForIcon:(id)a3
{
  return [(SBHIconImageCache *)self imageForIcon:a3 options:0];
}

- (id)imageForIcon:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  id v7 = [(SBHIconImageCache *)self realImageForIcon:v6 compatibleWithTraitCollection:0 options:a4];
  if (!v7)
  {
    if ([(id)objc_opt_class() hasIconImage])
    {
      BOOL v8 = [(SBHIconImageCache *)self isCachingImageForIcon:v6];
      id v9 = +[SBHIconImageAppearance defaultAppearance];
      if (v8) {
        [(SBHIconImageCache *)self cachingPlaceholderImageWithImageAppearance:v9 options:a4];
      }
      else {
      id v7 = [(SBHIconImageCache *)self genericImageWithImageAppearance:v9 options:a4];
      }
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)realImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  BSDispatchQueueAssertMain();
  id v10 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v8);

  uint64_t v11 = [(SBHIconImageCache *)self realImageForIcon:v9 imageAppearance:v10 options:a5];

  return v11;
}

- (id)realImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  BSDispatchQueueAssertMain();
  id v10 = [(SBHIconImageCache *)self variantCacheForOptions:a5];
  uint64_t v11 = -[SBHIconImageVariantCache realImageForIcon:imageAppearance:options:]((uint64_t)v10, v9, v8, a5);
  [(SBHIconImageCache *)self setLastCachedImageAppearance:v8];

  [(SBHIconImageCache *)self beginObservingIconIfNecessary:v9];
  return v11;
}

- (id)cachedImageForIcon:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  double v5 = [(SBHIconImageCache *)self cachedImageForIcon:v4 compatibleWithTraitCollection:0 options:0];
  if (!v5)
  {
    if (__sb__runningInSpringBoard())
    {
      double v5 = 0;
    }
    else
    {
      id v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
      double v5 = [(SBHIconImageCache *)self cachedImageForIcon:v4 compatibleWithTraitCollection:v6 options:0];

      if (!v5)
      {
        id v7 = [(SBHIconImageCache *)self lastCachedImageAppearance];
        if (v7)
        {
          id v8 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageAppearance:", v7);
          double v5 = [(SBHIconImageCache *)self cachedImageForIcon:v4 compatibleWithTraitCollection:v8 options:0];
        }
        else
        {
          double v5 = 0;
        }
      }
    }
  }

  return v5;
}

- (id)unmaskedImageForIcon:(id)a3
{
  return [(SBHIconImageCache *)self unmaskedImageForIcon:a3 options:0];
}

- (id)unmaskedImageForIcon:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  unmaskedCache = self->_unmaskedCache;
  id v8 = +[SBHIconImageAppearance defaultAppearance];
  id v9 = -[SBHIconImageVariantCache realImageForIcon:imageAppearance:options:]((uint64_t)unmaskedCache, v6, v8, a4);

  [(SBHIconImageCache *)self beginObservingIconIfNecessary:v6];
  return v9;
}

- (id)cachedUnmaskedImageForIcon:(id)a3
{
  return [(SBHIconImageCache *)self cachedImageForIcon:a3 compatibleWithTraitCollection:0 options:2];
}

- (void)cacheImageForIcon:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v8 arrayWithObjects:&v12 count:1];

  -[SBHIconImageCache cacheImagesForIcons:options:completionHandler:](self, "cacheImagesForIcons:options:completionHandler:", v11, a4, v9, v12, v13);
}

- (void)cacheImagesForIcons:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__SBHIconImageCache_cacheImagesForIcons_options_completionHandler___block_invoke;
  v11[3] = &unk_1E6AAC8A0;
  id v12 = v8;
  id v9 = v8;
  id v10 = [(SBHIconImageCache *)self cacheImagesForIcons:a3 compatibleWithTraitCollections:MEMORY[0x1E4F1CBF0] options:a4 completionHandler:v11];
}

uint64_t __67__SBHIconImageCache_cacheImagesForIcons_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 arrayWithObjects:&v17 count:1];

  uint64_t v15 = -[SBHIconImageCache cacheImagesForIcons:imageAppearance:options:completionHandler:](self, "cacheImagesForIcons:imageAppearance:options:completionHandler:", v14, v12, a5, v11, v17, v18);

  return v15;
}

- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 arrayWithObjects:&v20 count:1];

  uint64_t v18 = -[SBHIconImageCache cacheImagesForIcons:imageAppearance:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearance:reason:options:completionHandler:", v17, v15, v14, a6, v13, v20, v21);

  return v18;
}

- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v14 = (void *)MEMORY[0x1E4F1C978];
  id v15 = a8;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [v14 arrayWithObjects:&v22 count:1];

  id v20 = -[SBHIconImageCache cacheImagesForIcons:imageAppearance:priority:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearance:priority:reason:options:completionHandler:", v19, v17, a5, v16, a7, v15, v22, v23);

  return v20;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 arrayWithObjects:&v17 count:1];

  id v15 = -[SBHIconImageCache cacheImagesForIcons:imageAppearances:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:options:completionHandler:", v13, v14, a5, v11, v17, v18);

  return v15;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v22 = a4;
  id v14 = (void *)MEMORY[0x1E4F1C978];
  id v15 = a8;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [v14 arrayWithObjects:&v22 count:1];

  id v20 = -[SBHIconImageCache cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:", v18, v19, a5, v16, a7, v15, v22, v23);

  return v20;
}

- (id)cacheImagesForIcons:(id)a3 prioritizedImageAppearances:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  BSDispatchQueueAssertMain();
  long long v30 = v13;
  id v16 = [v13 allKeys];
  if (-[SBHIconImageCache hasCachedImagesForIcons:imageAppearances:options:](self, "hasCachedImagesForIcons:imageAppearances:options:", v12, v16, [(id)objc_opt_class() retrievalOptionsForOptions:a6] | 0x20))
  {
    id v17 = objc_alloc_init(SBHIconImageCacheCancellation);
    id v18 = v17;
    if (!v15) {
      goto LABEL_13;
    }
    uint64_t v19 = [(SBHIconImageCacheCancellation *)v17 identifier];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke;
    block[3] = &unk_1E6AAC8E8;
    id v40 = v19;
    id v41 = v15;
    id v20 = v19;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    long long v28 = v16;
    id v29 = v15;
    id v20 = [(SBHIconImageCache *)self buildCacheRequestWithReason:v14];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke_2;
          v31[3] = &unk_1E6AAC910;
          id v32 = v20;
          uint64_t v33 = v26;
          unint64_t v34 = a6;
          [v30 enumerateKeysAndObjectsUsingBlock:v31];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v23);
    }

    id v15 = v29;
    id v18 = [v20 finalizeRequestWithCompletionHandler:v29];
    id v16 = v28;
  }

LABEL_13:
  return v18;
}

void __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [[SBHIconImageCacheResult alloc] initWithRequestIdentifier:*(void *)(a1 + 32)];
  [(SBHIconImageCacheResult *)v2 calculateElapsedTime];
  [(SBHIconImageCacheResult *)v2 setFinished:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIcon:imageAppearance:priority:options:", *(void *)(a1 + 40), v5, objc_msgSend(a3, "integerValue"), *(void *)(a1 + 48));
}

- (id)buildCacheRequestWithReason:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SBHIconImageCacheCancellation);
  id v6 = -[SBHIconImageCacheRequestBuilder initWithIconImageCache:sharedCancellation:reason:]((id *)[SBHIconImageCacheRequestBuilder alloc], self, v5, v4);

  return v6;
}

- (id)finalizeRequestBuilder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    id v8 = (void *)v6[4];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 identifier];
  id v11 = [[SBHIconImageCacheResult alloc] initWithRequestIdentifier:v10];
  if (v6) {
    id v12 = (void *)v6[1];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;
  uint64_t v14 = [v13 firstObject];
  id v15 = (void *)v14;
  if (v14) {
    id v16 = *(void **)(v14 + 64);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  id v18 = objc_msgSend(v13, "bs_compactMap:", &__block_literal_global_20);
  [v9 setRequestedImageIdentities:v18];
  [(SBHIconImageCache *)self submitRequests:v13];
  if (v7)
  {
    uint64_t v23 = v10;
    if (v6) {
      uint64_t v19 = (void *)v6[6];
    }
    else {
      uint64_t v19 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SBHIconImageCache_finalizeRequestBuilder_completionHandler___block_invoke_2;
    block[3] = &unk_1E6AAC958;
    id v25 = v9;
    uint64_t v26 = self;
    id v27 = v17;
    long long v28 = v11;
    id v29 = v7;
    id v20 = v19;
    dispatch_group_notify(v20, MEMORY[0x1E4F14428], block);

    id v10 = v23;
  }
  id v21 = v9;

  return v21;
}

id __62__SBHIconImageCache_finalizeRequestBuilder_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 112);
  }
  else {
    return 0;
  }
}

uint64_t __62__SBHIconImageCache_finalizeRequestBuilder_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCancelled];
  if ((v2 & 1) == 0) {
    [*(id *)(a1 + 40) setLastCachedImageAppearance:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 56) calculateElapsedTime];
  [*(id *)(a1 + 56) setFinished:v2 ^ 1u];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v3();
}

- (void)submitRequests:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBHIconImageCache *)self submitRequest:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)submitRequest:(id)a3
{
  id v4 = a3;
  long long v9 = v4;
  if (v4) {
    uint64_t v5 = (void *)v4[5];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [(SBHIconImageCache *)self beginObservingIconIfNecessary:v6];
  if (v9)
  {
    uint64_t v7 = v9[13];
    if (v7 == 1)
    {
      unmaskedCache = self->_unmaskedCache;
      goto LABEL_8;
    }
    if (v7) {
      goto LABEL_9;
    }
  }
  unmaskedCache = self->_maskedCache;
LABEL_8:
  -[SBHIconImageVariantCache submitRequest:]((id *)&unmaskedCache->super.isa, v9);
LABEL_9:
}

- (void)cacheImagesForIcons:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(SBHIconImageCache *)self imageForIcon:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)cacheUnmaskedImagesForIcons:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(SBHIconImageCache *)self unmaskedImageForIcon:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

+ (unint64_t)optionsForRetrievalOptions:(unint64_t)a3
{
  uint64_t v3 = ~(8 * (_BYTE)a3) & 8;
  if ((a3 & 2) != 0) {
    v3 |= 3uLL;
  }
  return v3 | (a3 >> 1) & 4;
}

- (void)recacheImagesForIcon:(id)a3 completionHandler:(id)a4
{
  blocuint64_t k = a4;
  id v6 = a3;
  BSDispatchQueueAssertMain();
  dispatch_group_t v7 = dispatch_group_create();
  -[SBHIconImageVariantCache recacheImagesForIcon:completionGroup:]((uint64_t)self->_maskedCache, v6, v7);
  -[SBHIconImageVariantCache recacheImagesForIcon:completionGroup:]((uint64_t)self->_unmaskedCache, v6, v7);

  if (block) {
    dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
  }
}

- (void)purgeCachedImagesForIcons:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__SBHIconImageCache_purgeCachedImagesForIcons___block_invoke;
  v15[3] = &unk_1E6AAC980;
  id v5 = v4;
  id v16 = v5;
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:v15];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
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
        -[SBHIconImageCache endObservingIcon:](self, "endObservingIcon:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v8);
  }
}

void __47__SBHIconImageCache_purgeCachedImagesForIcons___block_invoke(uint64_t a1, id *a2)
{
}

- (void)purgeAllCachedImages
{
  BSDispatchQueueAssertMain();
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:&__block_literal_global_23];
  [(SBHIconImageCache *)self endObservingAllIcons];
}

void __41__SBHIconImageCache_purgeAllCachedImages__block_invoke(uint64_t a1, id *a2)
{
}

- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__SBHIconImageCache_purgeAllCachedImagesForAppearancesOtherThanAppearances___block_invoke;
  v6[3] = &unk_1E6AAC980;
  id v7 = v4;
  id v5 = v4;
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:v6];
}

void __76__SBHIconImageCache_purgeAllCachedImagesForAppearancesOtherThanAppearances___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)cancelAllCachingRequests
{
  BSDispatchQueueAssertMain();
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:&__block_literal_global_25];
}

uint64_t __45__SBHIconImageCache_cancelAllCachingRequests__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[SBHIconImageVariantCache cancelAllCachingRequests](a2);
}

- (BOOL)isCachingImageForIcon:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SBHIconImageCache_isCachingImageForIcon___block_invoke;
  v7[3] = &unk_1E6AAC9C8;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __43__SBHIconImageCache_isCachingImageForIcon___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t result = -[SBHIconImageVariantCache isCachingImageForIcon:](a2, *(void **)(a1 + 32));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)hasCachingRequests
{
  BSDispatchQueueAssertMain();
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SBHIconImageCache_hasCachingRequests__block_invoke;
  v4[3] = &unk_1E6AAC9F0;
  v4[4] = &v5;
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:v4];
  LOBYTE(self) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)self;
}

void __39__SBHIconImageCache_hasCachingRequests__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = a2;
  id v6 = v5;
  if (v5)
  {
    char v8 = v5;
    uint64_t v7 = [v5[3] count];
    id v6 = v8;
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (BOOL)hasCachingRequestsStillDoingWork
{
  BSDispatchQueueAssertMain();
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SBHIconImageCache_hasCachingRequestsStillDoingWork__block_invoke;
  v4[3] = &unk_1E6AAC9F0;
  v4[4] = &v5;
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:v4];
  LOBYTE(self) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)self;
}

BOOL __53__SBHIconImageCache_hasCachingRequestsStillDoingWork__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  BOOL result = -[SBHIconImageVariantCache hasCachingRequestsStillDoingWork](a2);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)performWhenCachingActivityCompletesUsingBlock:(id)a3
{
  uint64_t v9 = (void (**)(void))a3;
  if ([(SBHIconImageCache *)self hasCachingRequestsStillDoingWork])
  {
    performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    if (!performAfterCachingActivityBlocks)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = self->_performAfterCachingActivityBlocks;
      self->_performAfterCachingActivityBlocks = v5;

      performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    }
    uint64_t v7 = (void *)[v9 copy];
    char v8 = _Block_copy(v7);
    [(NSMutableArray *)performAfterCachingActivityBlocks addObject:v8];
  }
  else
  {
    v9[2]();
  }
}

- (void)checkIfCachingActivityHasCompleted
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_performAfterCachingActivityBlocks;
  if ([(NSMutableArray *)v3 count]
    && ![(SBHIconImageCache *)self hasCachingRequestsStillDoingWork])
  {
    performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    self->_performAfterCachingActivityBlocks = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = v3;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

+ (void)pauseCaching
{
  int v2 = [a1 _workQueue];
  dispatch_suspend(v2);
}

+ (void)resumeCaching
{
  int v2 = [a1 _workQueue];
  dispatch_resume(v2);
}

+ (BOOL)canFallBackToLightImageForImageAppearance:(id)a3
{
  return [a3 appearanceType] != 0;
}

+ (id)genericImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  long long v12 = +[SBHIconImageAppearance defaultAppearance];
  long long v13 = objc_msgSend(a1, "genericImageWithInfo:imageAppearance:options:", v12, 0, v10, v9, v8, v7);

  return v13;
}

+ (id)genericImageWithInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  uint64_t v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v14 = a3;
  uint64_t v15 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
  id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v13, v12, v11);
  SBHModifyImageDescriptorWithImageAppearance(v16, v14, (a4 & 2) != 0);
  id v17 = [v15 prepareImageForDescriptor:v16];
  uint64_t v18 = v17;
  if (!v17
    || (uint64_t v19 = (void *)MEMORY[0x1E4FB1818],
        uint64_t v20 = [v17 CGImage],
        [v18 scale],
        objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0),
        (id v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v22 = SBLogIconImageCache();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      long long v28 = v18;
      __int16 v29 = 2112;
      long long v30 = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      _os_log_error_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_ERROR, "Could not create generic application icon via IconServices. isImage=%@, genericIcon=%@, imageDescriptor=%@", buf, 0x20u);
    }

    uint64_t v23 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__SBHIconImageCache_genericImageWithInfo_imageAppearance_options___block_invoke;
    v26[3] = &__block_descriptor_72_e5_v8__0l;
    v26[4] = a4;
    *(double *)&v26[5] = v13;
    *(double *)&v26[6] = v12;
    *(double *)&v26[7] = v11;
    v26[8] = v10;
    id v21 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_imageFromBGRAContextWithSize:scale:colorSpace:withAlpha:pool:drawing:encapsulation:", v23, 1, 0, v26, 0, v13, v12, v11);
    CGColorSpaceRelease(v23);
  }
  uint64_t v24 = SBHIconServicesAddDebugImageOverlayWithImageAppearance(v21);

  return v24;
}

void __66__SBHIconImageCache_genericImageWithInfo_imageAppearance_options___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 32) & 2) == 0)
  {
    int v2 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 64));
    [v2 addClip];
  }
  double v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 set];

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  UIRectFill(*(CGRect *)&v6);
}

- (UIImage)genericImage
{
  double v3 = +[SBHIconImageAppearance defaultAppearance];
  uint64_t v4 = [(SBHIconImageCache *)self genericImageWithImageAppearance:v3 options:0];

  return (UIImage *)v4;
}

- (id)genericImageWithImageAppearance:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBHIconImageCache *)self variantCacheForOptions:a4];
  uint64_t v8 = -[SBHIconImageVariantCache genericImageWithImageAppearance:]((uint64_t)v7, v6);

  return v8;
}

+ (id)tintingBackgroundImageWithInfo:(SBIconImageInfo *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v22[1] = *MEMORY[0x1E4F143B8];
  size_t v9 = (unint64_t)(v3 * v5);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v11 = CGBitmapContextCreate(0, v9, v9, 8uLL, v9, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextClear();
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F6F1E8]) initWithCGImage:Image scale:v6];
  CGImageRelease(Image);
  id v14 = objc_alloc(MEMORY[0x1E4F6F248]);
  v22[0] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v16 = (void *)[v14 initWithImages:v15];

  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v8, v7, v6);
  [v17 setAppearance:2];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:12];
  [v17 setTintColor:v18];

  uint64_t v19 = [v16 prepareImageForDescriptor:v17];
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:scale:orientation:", objc_msgSend(v19, "CGImage"), 0, v6);

  return v20;
}

- (UIImage)tintingBackgroundImage
{
  tintingBackgroundImage = self->_tintingBackgroundImage;
  if (!tintingBackgroundImage)
  {
    [(SBHIconImageCache *)self iconImageInfo];
    objc_msgSend((id)objc_opt_class(), "tintingBackgroundImageWithInfo:", v4, v5, v6, v7);
    double v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    size_t v9 = self->_tintingBackgroundImage;
    self->_tintingBackgroundImage = v8;

    tintingBackgroundImage = self->_tintingBackgroundImage;
  }
  return tintingBackgroundImage;
}

- (id)cachingPlaceholderImageWithImageAppearance:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(SBHIconImageCache *)self variantCacheForOptions:a4];
  double v8 = -[SBHIconImageVariantCache cachingPlaceholderImageWithImageAppearance:](v7, v6);

  return v8;
}

+ (BOOL)hasUniqueCachingPlaceholderImage
{
  return 0;
}

+ (id)overlayImageWithInfo:(SBIconImageInfo *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  id v9 = objc_alloc(MEMORY[0x1E4F6F248]);
  uint64_t v10 = (void *)[v9 initWithImages:MEMORY[0x1E4F1CBF0]];
  double v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v8, v7, v6);
  double v12 = [v10 prepareImageForDescriptor:v11];
  id v13 = objc_alloc(MEMORY[0x1E4FB1818]);
  uint64_t v14 = [v12 CGImage];
  [v12 scale];
  uint64_t v15 = objc_msgSend(v13, "initWithCGImage:scale:orientation:", v14, 0);

  return v15;
}

- (UIImage)overlayImage
{
  overlayImage = self->_overlayImage;
  if (!overlayImage)
  {
    [(SBHIconImageCache *)self iconImageInfo];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    id v10 = objc_alloc(MEMORY[0x1E4F6F248]);
    double v11 = (void *)[v10 initWithImages:MEMORY[0x1E4F1CBF0]];
    double v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v5, v7, v9);
    id v13 = [v11 prepareImageForDescriptor:v12];
    id v14 = objc_alloc(MEMORY[0x1E4FB1818]);
    uint64_t v15 = [v13 CGImage];
    [v13 scale];
    id v16 = objc_msgSend(v14, "initWithCGImage:scale:orientation:", v15, 0);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __33__SBHIconImageCache_overlayImage__block_invoke;
    v21[3] = &unk_1E6AACA38;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    id v22 = v16;
    double v25 = v5;
    double v26 = v7;
    id v17 = v16;
    -[SBHIconImageCache memoryMappedIconImageOfSize:scale:withDrawing:](self, "memoryMappedIconImageOfSize:scale:withDrawing:", v21, v5, v7, v9);
    uint64_t v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = self->_overlayImage;
    self->_overlayImage = v18;

    overlayImage = self->_overlayImage;
  }
  return overlayImage;
}

uint64_t __33__SBHIconImageCache_overlayImage__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 1.0);
  int v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v2, "drawInRect:blendMode:alpha:", 0, v3, v4, v5, v6, 0.75);
}

+ (id)unmaskedOverlayImageWithInfo:(SBIconImageInfo *)a3
{
  double v3 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, &__block_literal_global_36, 1.0, 1.0);
  double v4 = objc_msgSend(v3, "sbf_imageByTilingCenterPixel");

  return v4;
}

void __50__SBHIconImageCache_unmaskedOverlayImageWithInfo___block_invoke()
{
  dispatch_workloop_t v0 = [MEMORY[0x1E4FB1618] blackColor];
  [v0 setFill];

  uint64_t v1 = 0;
  uint64_t v2 = 0;
  double v3 = 1.0;
  double v4 = 1.0;
  UIRectFill(*(CGRect *)&v1);
}

- (UIImage)unmaskedOverlayImage
{
  unmaskedOverlayImage = self->_unmaskedOverlayImage;
  if (!unmaskedOverlayImage)
  {
    [(SBHIconImageCache *)self iconImageInfo];
    double v4 = [(SBHIconImageCache *)self memoryMappedIconImageOfSize:&__block_literal_global_38 scale:1.0 withDrawing:1.0];
    objc_msgSend(v4, "sbf_imageByTilingCenterPixel");
    double v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    double v6 = self->_unmaskedOverlayImage;
    self->_unmaskedOverlayImage = v5;

    unmaskedOverlayImage = self->_unmaskedOverlayImage;
  }
  return unmaskedOverlayImage;
}

void __41__SBHIconImageCache_unmaskedOverlayImage__block_invoke()
{
  dispatch_workloop_t v0 = [MEMORY[0x1E4FB1618] blackColor];
  [v0 setFill];

  uint64_t v1 = 0;
  uint64_t v2 = 0;
  double v3 = 1.0;
  double v4 = 1.0;
  UIRectFill(*(CGRect *)&v1);
}

- (unint64_t)numberOfCachedImages
{
  maskedCache = self->_maskedCache;
  if (maskedCache) {
    return [(SBHIconImageAppearanceStore *)maskedCache->_images numberOfCachedImages];
  }
  else {
    return 0;
  }
}

- (unint64_t)numberOfCacheHits
{
  return 0;
}

- (unint64_t)numberOfCacheMisses
{
  return 0;
}

- (unint64_t)numberOfMainThreadImageLoads
{
  return 0;
}

- (unint64_t)numberOfUnmaskedCachedImages
{
  unmaskedCache = self->_unmaskedCache;
  if (unmaskedCache) {
    return [(SBHIconImageAppearanceStore *)unmaskedCache->_images numberOfCachedImages];
  }
  else {
    return 0;
  }
}

- (unint64_t)numberOfUnmaskedCacheHits
{
  return 0;
}

- (unint64_t)numberOfUnmaskedCacheMisses
{
  return 0;
}

- (unint64_t)numberOfCachedImagesForAppearance:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBHIconImageCache *)self variantCacheForOptions:a4];
  double v8 = (void *)v7;
  if (v7) {
    unint64_t v9 = [*(id *)(v7 + 8) numberOfCachedImagesForAppearance:v6];
  }
  else {
    unint64_t v9 = 0;
  }

  return v9;
}

- (unint64_t)numberOfCachedImagesForAppearanceType:(int64_t)a3 options:(unint64_t)a4
{
  uint64_t v5 = [(SBHIconImageCache *)self variantCacheForOptions:a4];
  id v6 = (void *)v5;
  if (v5) {
    unint64_t v7 = [*(id *)(v5 + 8) numberOfCachedImagesForAppearanceType:a3];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)cachingRequestCount
{
  maskedCache = self->_maskedCache;
  if (maskedCache) {
    uint64_t v4 = [(NSMutableArray *)maskedCache->_cachingRequests count];
  }
  else {
    uint64_t v4 = 0;
  }
  unmaskedCache = self->_unmaskedCache;
  if (unmaskedCache) {
    uint64_t v6 = [(NSMutableArray *)unmaskedCache->_cachingRequests count];
  }
  else {
    uint64_t v6 = 0;
  }
  return v6 + v4;
}

- (id)_cacheKeyForIcon:(id)a3
{
  return (id)[a3 iconImageCacheIdentifier];
}

- (BOOL)_canPoolImage
{
  int v3 = [(id)objc_opt_class() supportsMemoryPooling];
  if (v3)
  {
    unint64_t add_explicit = atomic_fetch_add_explicit(&_canPoolImage___poolOptOutCount, 1uLL, memory_order_relaxed);
    LOBYTE(v3) = add_explicit >= [(SBHIconImageCache *)self poolingBypassCount];
  }
  return v3;
}

- (id)_iconImageOfSize:(CGSize)a3 scale:(double)a4 failGracefully:(BOOL)a5 drawing:(id)a6
{
  BOOL v6 = a5;
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  double v12 = [(SBHIconImageCache *)self iconImagesMemoryPool];
  if (v6
    && (unint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_bytesNeededForSize:scale:withContextType:", 0, width, height, a4),
        v13 > [v12 slotLength]))
  {
    id v14 = SBLogCommon();
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
    id v16 = 0;
  }
  else
  {
    id v16 = objc_msgSend(MEMORY[0x1E4FB1818], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, v12, v11, width, height, a4);
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
    if (!v4 || [(SBHIconImageCache *)self _canPoolImage])
    {
      unint64_t v7 = [(SBHIconImageCache *)self iconImagesMemoryPool];
      objc_msgSend(v6, "sbf_memoryMappedImageWithPool:", v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8) {
        goto LABEL_10;
      }
      unint64_t v9 = SBLogIconImageCache();
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
  return [(SBHIconImageCache *)self _pooledIconImageForIconImage:a3 allowingOptOut:1];
}

- (id)memoryMappedIconImageForIconImage:(id)a3
{
  return [(SBHIconImageCache *)self _pooledIconImageForIconImage:a3 allowingOptOut:0];
}

- (id)memoryMappedIconImageOfSize:(CGSize)a3 scale:(double)a4 withDrawing:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  id v10 = -[SBHIconImageCache _iconImageOfSize:scale:failGracefully:drawing:](self, "_iconImageOfSize:scale:failGracefully:drawing:", 1, v9, width, height, a4);
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

- (void)endObservingIcon:(id)a3
{
  observedIcons = self->_observedIcons;
  id v5 = a3;
  [(NSHashTable *)observedIcons removeObject:v5];
  [v5 removeObserver:self];
}

- (void)endObservingAllIcons
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v3 = self->_observedIcons;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "removeObserver:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSHashTable *)self->_observedIcons removeAllObjects];
}

- (void)enumerateVariantCachesUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, SBHIconImageVariantCache *, unsigned char *))a3;
  char v5 = 0;
  v4[2](v4, self->_maskedCache, &v5);
  if (!v5) {
    v4[2](v4, self->_unmaskedCache, &v5);
  }
}

- (void)finishedAsynchronousLoadOfIcon:(id)a3 imageAppearance:(id)a4 variant:(int64_t)a5 context:(SBHIconImageCacheRequestResultContext *)a6
{
  if (!a5)
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    SBHIconImageCacheRequestResultContext v8 = *a6;
    [(SBHIconImageCache *)self notifyObserversOfUpdateForIcon:a3 imageAppearance:a4 context:&v8];
  }
}

- (void)performBackgroundCachingActivityUsingPriority:(int64_t)a3 block:(id)a4
{
  id v6 = a4;
  -[SBHIconImageCache performBackgroundCachingActivityUsingQOSClass:block:](self, "performBackgroundCachingActivityUsingQOSClass:block:", [(id)objc_opt_class() qosClassForPriority:a3], v6);
}

- (void)performBackgroundCachingActivityUsingQOSClass:(unsigned int)a3 block:(id)a4
{
  blocuint64_t k = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, a4);
  uint64_t v4 = [(id)objc_opt_class() _workQueue];
  dispatch_async(v4, block);
}

- (void)performBackgroundFileActivityUsingBlock:(id)a3
{
}

+ (unsigned)qosClassForPriority:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return dword_1D81E4BC0[a3];
  }
}

- (void)incrementImageGenerationForIcon:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  char v5 = [v4 iconImageCacheIdentifier];
  unint64_t v6 = [(SBHIconImageCache *)self currentImageGenerationForIcon:v4];

  unint64_t v7 = v6 + 1;
  SBHIconImageCacheRequestResultContext v8 = SBLogIconImageCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBHIconImageCache incrementImageGenerationForIcon:]();
  }

  iconImageGenerations = self->_iconImageGenerations;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7];
  [(NSMutableDictionary *)iconImageGenerations setObject:v10 forKey:v5];
}

- (unint64_t)imageGenerationForCachedImage:(id)a3
{
  int v3 = objc_getAssociatedObject(a3, &SBHIconImageCacheImageGenerationKey);
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)activityDescription
{
  int v3 = NSString;
  maskedCache = self->_maskedCache;
  if (maskedCache)
  {
    uint64_t v5 = [(NSMutableArray *)maskedCache->_cachingRequests count];
    unint64_t v6 = self->_maskedCache;
    if (v6)
    {
      uint64_t v7 = [(SBHIconImageAppearanceStore *)v6->_images numberOfCachedImages];
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v7 = 0;
LABEL_4:
  unmaskedCache = self->_unmaskedCache;
  if (!unmaskedCache)
  {
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = [(NSMutableArray *)unmaskedCache->_cachingRequests count];
  uint64_t v10 = self->_unmaskedCache;
  if (!v10)
  {
LABEL_11:
    uint64_t v11 = 0;
    return (id)objc_msgSend(v3, "stringWithFormat:", @"Masked:\n\tRequests: %lu\n\tCached: %lu\nUnmasked:\n\tRequests: %lu\n\tCached: %lu", v5, v7, v9, v11);
  }
  uint64_t v11 = [(SBHIconImageAppearanceStore *)v10->_images numberOfCachedImages];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"Masked:\n\tRequests: %lu\n\tCached: %lu\nUnmasked:\n\tRequests: %lu\n\tCached: %lu", v5, v7, v9, v11);
}

- (void)iconImageDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogIconImageCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBHIconImageCache iconImageDidUpdate:](v4);
  }

  [(SBHIconImageCache *)self updateImageForIcon:v4];
}

- (void)updateImageForIcon:(id)a3
{
  id v4 = a3;
  [(SBHIconImageCache *)self incrementImageGenerationForIcon:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SBHIconImageCache_updateImageForIcon___block_invoke;
  v6[3] = &unk_1E6AAC980;
  id v7 = v4;
  id v5 = v4;
  [(SBHIconImageCache *)self enumerateVariantCachesUsingBlock:v6];
  [(SBHIconImageCache *)self beginObservingIconIfNecessary:v5];
  [(SBHIconImageCache *)self recacheImagesForIcon:v5 completionHandler:0];
}

void __40__SBHIconImageCache_updateImageForIcon___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  -[SBHIconImageVariantCache cancelCachingRequestsForIcon:]((uint64_t)v4, v3);
  -[SBHIconImageVariantCache resetFailedStatusForIcon:]((uint64_t)v4, *(void **)(a1 + 32));
}

- (NSString)description
{
  return (NSString *)[(SBHIconImageCache *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBHIconImageCache *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBHIconImageCache *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHIconImageCache *)self succinctDescriptionBuilder];
  id v5 = [(SBHIconImageCache *)self name];
  id v6 = (id)[v4 appendObject:v5 withName:@"name"];

  [(SBHIconImageCache *)self iconImageInfo];
  double v8 = v7;
  id v9 = (id)objc_msgSend(v4, "appendSize:withName:", @"imageSize");
  id v10 = (id)[v4 appendFloat:@"imageScale" withName:v8];
  id v11 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconImageCache numberOfCachedImages](self, "numberOfCachedImages"), @"cachedImageCount");
  id v12 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconImageCache numberOfUnmaskedCachedImages](self, "numberOfUnmaskedCachedImages"), @"cachedUnmaskedImageCount");
  maskedCache = self->_maskedCache;
  if (maskedCache) {
    uint64_t v14 = [(NSHashTable *)maskedCache->_failedIcons count];
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = (id)[v4 appendUnsignedInteger:v14 withName:@"failedIconsCount"];
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (unint64_t)poolingBypassCount
{
  return self->_poolingBypassCount;
}

- (void)setPoolingBypassCount:(unint64_t)a3
{
  self->_poolingBypassCount = a3;
}

- (CPMemoryPool)iconImagesMemoryPool
{
  return self->_iconImagesMemoryPool;
}

- (SBHIconImageAppearance)lastCachedImageAppearance
{
  return self->_lastCachedImageAppearance;
}

- (void)setLastCachedImageAppearance:(id)a3
{
}

- (unint64_t)currentRequestStartTimestamp
{
  return self->_currentRequestStartTimestamp;
}

- (double)currentRequestElapsedTime
{
  return self->_currentRequestElapsedTime;
}

- (BOOL)currentRequestChangedImageVisually
{
  return self->_currentRequestChangedImageVisually;
}

- (void)notifyObserversOfUpdateForIcon:(void *)a1 imageAppearance:(uint64_t)a2 context:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2048;
  uint64_t v8 = v5;
  _os_log_debug_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_DEBUG, "notifying observers of update to icon %@. requested elapsed time: %f", v6, 0x16u);
}

- (void)beginObservingIconIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "began observing icon %@", v2, v3, v4, v5, v6);
}

- (void)incrementImageGenerationForIcon:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "incrementing image generation for %@ to %lu");
}

- (void)iconImageDidUpdate:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D7F0A000, v2, v3, "observed update to icon %@", v4, v5, v6, v7, v8);
}

@end