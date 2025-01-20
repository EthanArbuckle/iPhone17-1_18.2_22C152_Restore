@interface SBFolderIconImageSharedCache
+ (BOOL)isMiniGridImageLoadingAsynchronous;
+ (OS_dispatch_queue)miniImageQueue;
- (BOOL)hasCachedItemsThatIncludeIcon:(id)a3 imageAppearance:(id)a4;
- (BOOL)isMiniGridImageLoadingAsynchronous;
- (CPMemoryPool)miniGridImagePool;
- (CPMemoryPool)pool;
- (NSString)activityDescription;
- (SBFolderIconImageSharedCache)initWithListLayout:(id)a3 iconImageCache:(id)a4;
- (SBHIconImageAppearanceStore)miniGridImageLayers;
- (SBHIconImageCache)iconImageCache;
- (SBIconListLayout)listLayout;
- (id)cachedMiniImageAppearancesForIcon:(id)a3;
- (id)cachingPlaceholderMiniGridImageWithImageAppearance:(id)a3;
- (id)genericMiniGridImageWithImageAppearance:(id)a3;
- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4;
- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4 imageAttributes:(unint64_t *)a5;
- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6 imageAttributes:(unint64_t *)a7;
- (id)gridCellLayerForIcon:(id)a3 imageAppearance:(id)a4;
- (id)gridCellLayerForIcon:(id)a3 imageAppearance:(id)a4 imageAttributes:(unint64_t *)a5;
- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5;
- (id)layerForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5;
- (id)performSynchronousMiniImageGenerationForImage:(id)a3 forIcon:(id)a4 appearance:(id)a5;
- (unint64_t)numberOfCacheHits;
- (unint64_t)numberOfCacheMisses;
- (unint64_t)numberOfCachedImages;
- (void)addObserver:(id)a3 forFolderIcon:(id)a4;
- (void)beginAsynchronousMiniImageGenerationForImage:(id)a3 forIcon:(id)a4 appearance:(id)a5 reason:(id)a6 completionHandler:(id)a7;
- (void)checkIfCachingActivityHasCompleted;
- (void)didEndCachingActivityForReason:(id)a3;
- (void)finishAsynchronousMiniImageGenerationWithImage:(id)a3 forIcon:(id)a4 imageIdentity:(id)a5 reason:(id)a6 completionHandler:(id)a7;
- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5;
- (void)folder:(id)a3 didAddList:(id)a4;
- (void)folder:(id)a3 didMoveIcon:(id)a4;
- (void)folder:(id)a3 didMoveList:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5;
- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)folderIcon:(id)a3 containedIconAccessoriesDidUpdate:(id)a4;
- (void)folderIcon:(id)a3 containedIconImageDidUpdate:(id)a4;
- (void)folderIcon:(id)a3 containedIconLaunchEnabledDidChange:(id)a4;
- (void)folderIconImageCache:(id)a3 didAddObserverForFolderIcon:(id)a4;
- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5;
- (void)iconImageDidUpdate:(id)a3;
- (void)informObserversOfUpdateForFolderIcon:(id)a3 imageAppearance:(id)a4;
- (void)performAsynchronousMiniImageGenerationForImage:(id)a3 forIcon:(id)a4 imageIdentity:(id)a5 miniImageSize:(CGSize)a6 reason:(id)a7 completionHandler:(id)a8;
- (void)performWhenCachingActivityCompletesUsingBlock:(id)a3;
- (void)purgeAllCachedFolderImages;
- (void)rebuildAllCachedFolderImages;
- (void)rebuildImagesForFolderIcon:(id)a3;
- (void)rebuildImagesForFolderIcon:(id)a3 appearance:(id)a4;
- (void)registerFolderIconImageCache:(id)a3;
- (void)removeObserver:(id)a3 forFolderIcon:(id)a4;
- (void)setMiniGridImageLayers:(id)a3;
- (void)setMiniGridImageLoadingAsynchronous:(BOOL)a3;
- (void)unregisterFolderIconImageCache:(id)a3;
- (void)updateCachedImagesForFolderIcon:(id)a3 afterChangeToContainedForIcon:(id)a4 imageAppearance:(id)a5 updateType:(int64_t)a6;
- (void)updateCachedMiniImage:(id)a3 forIcon:(id)a4 imageAppearance:(id)a5;
- (void)willBeginCachingActivityForReason:(id)a3;
@end

@implementation SBFolderIconImageSharedCache

- (void)updateCachedImagesForFolderIcon:(id)a3 afterChangeToContainedForIcon:(id)a4 imageAppearance:(id)a5 updateType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    cachedFolderImages = self->_cachedFolderImages;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke;
    v21 = &unk_1E6AB03E0;
    id v15 = v12;
    id v22 = v15;
    id v16 = v10;
    id v23 = v16;
    v27 = &v33;
    int64_t v28 = a6;
    v25 = self;
    v26 = &v29;
    id v24 = v11;
    [(SBHIconImageAppearanceStore *)cachedFolderImages enumerateImagesForIcon:v16 usingBlock:&v18];
    if (a6 == 3 || *((unsigned char *)v30 + 24))
    {
      if (!*((unsigned char *)v34 + 24))
      {
LABEL_9:

        _Block_object_dispose(&v29, 8);
        _Block_object_dispose(&v33, 8);
        goto LABEL_10;
      }
    }
    else
    {
      v17 = SBLogFolderIconImageCache();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[SBFolderIconImageSharedCache updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:]();
      }

      *((unsigned char *)v34 + 24) = 1;
    }
    -[SBFolderIconImageSharedCache informObserversOfUpdateForFolderIcon:imageAppearance:](self, "informObserversOfUpdateForFolderIcon:imageAppearance:", v16, v15, v18, v19, v20, v21, v22, v23);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)folderIconImageCache:(id)a3 didAddObserverForFolderIcon:(id)a4
{
  id v5 = a4;
  [v5 addObserver:self];
  id v6 = [v5 folder];

  [v6 addFolderObserver:self];
}

- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 folder];
  uint64_t v11 = [v10 listCount];
  id v12 = [(SBHIconImageAppearanceStore *)self->_cachedFolderImages imageForIcon:v8 appearance:v9];
  v13 = v12;
  if (v12 && [v12 count] != v11)
  {
    [v13 setCount:0];
    [v13 setCount:v11];
  }
  uint64_t v14 = [v13 pointerAtIndex:a3];
  if (v14)
  {
    id v15 = (void *)v14;
    if (!a3) {
      SBFPreheatImageData();
    }
  }
  else
  {
    uint64_t v16 = [(SBFolderIconImageSharedCache *)self listLayout];
    v17 = [(SBFolderIconImageSharedCache *)self pool];
    v21 = (void *)v16;
    id v15 = +[SBFolderIconImageCache imageForPageAtIndex:a3 inFolderIcon:v8 imageAppearance:v9 listLayout:v16 gridCellImageProvider:self pool:v17];
    uint64_t v18 = SBLogFolderIconImageCache();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      id v23 = self;
      __int16 v24 = 2112;
      v25 = v15;
      __int16 v26 = 2048;
      unint64_t v27 = a3;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_debug_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEBUG, "%p caching image %@ at page %lu for icon: %@", buf, 0x2Au);
    }

    if (!v13)
    {
      v13 = [MEMORY[0x1E4F28F50] pointerArrayWithOptions:0];
      [v13 setCount:v11];
      [(SBHIconImageAppearanceStore *)self->_cachedFolderImages setImage:v13 forIcon:v8 appearance:v9];
      [(NSHashTable *)self->_cachedFolderIcons addObject:v8];
    }
    [v13 replacePointerAtIndex:a3 withPointer:v15];
  }
  [v8 addObserver:self];
  uint64_t v19 = [v8 folder];
  [v19 addFolderObserver:self];

  return v15;
}

- (id)layerForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  id v8 = a5;
  id v9 = [a4 folder];
  id v10 = [(SBFolderIconImageSharedCache *)self listLayout];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__SBFolderIconImageSharedCache_layerForPageAtIndex_inFolderIcon_imageAppearance___block_invoke;
  v14[3] = &unk_1E6AB02F0;
  v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  id v12 = [v9 layerForListIndex:a3 listLayout:v10 imageAppearance:v11 cellProvider:v14];

  return v12;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)folderIcon:(id)a3 containedIconLaunchEnabledDidChange:(id)a4
{
}

- (void)folderIcon:(id)a3 containedIconImageDidUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(SBFolderIconImageSharedCache *)self iconImageCache];

  if (!v7) {
    [(SBFolderIconImageSharedCache *)self updateCachedImagesForFolderIcon:v8 afterChangeToContainedForIcon:v6 imageAppearance:0 updateType:0];
  }
}

- (void)folderIcon:(id)a3 containedIconAccessoriesDidUpdate:(id)a4
{
}

uint64_t __81__SBFolderIconImageSharedCache_layerForPageAtIndex_inFolderIcon_imageAppearance___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) gridCellLayerForIcon:a2 imageAppearance:*(void *)(a1 + 40)];
}

- (id)gridCellLayerForIcon:(id)a3 imageAppearance:(id)a4 imageAttributes:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBFolderIconImageSharedCache *)self gridCellImageForIcon:v8 imageAppearance:v9 imageAttributes:a5];
  [v10 size];
  double v12 = v11;
  double v14 = v13;
  id v15 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, v12, v14);
  id v16 = v10;
  objc_msgSend(v15, "setContents:", objc_msgSend(v16, "CGImage"));
  v17 = [(SBFolderIconImageSharedCache *)self miniGridImageLayers];
  if (!v17)
  {
    v17 = objc_alloc_init(SBHIconImageAppearanceStore);
    [(SBFolderIconImageSharedCache *)self setMiniGridImageLayers:v17];
  }
  uint64_t v18 = [(SBHIconImageAppearanceStore *)v17 imageForIcon:v8 appearance:v9];
  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(SBHIconImageAppearanceStore *)v17 setImage:v18 forIcon:v8 appearance:v9];
  }
  [v18 addObject:v15];

  return v15;
}

- (SBHIconImageAppearanceStore)miniGridImageLayers
{
  return self->_miniGridImageLayers;
}

- (id)gridCellLayerForIcon:(id)a3 imageAppearance:(id)a4
{
  return [(SBFolderIconImageSharedCache *)self gridCellLayerForIcon:a3 imageAppearance:a4 imageAttributes:0];
}

- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4 imageAttributes:(unint64_t *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImages imageForIcon:v8 appearance:v9];
  double v11 = [(SBFolderIconImageSharedCache *)self iconImageCache];
  if (v10)
  {
    unint64_t v12 = 0;
    double v13 = v10;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v15 = [(SBFolderIconImageSharedCache *)self listLayout];
  [v15 iconImageInfo];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  BOOL v24 = [(SBFolderIconImageSharedCache *)self isMiniGridImageLoadingAsynchronous];
  v25 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache gridCellImageForIcon:imageAppearance:imageAttributes:]();
  }

  if (v11)
  {
    if (v24)
    {
      __int16 v26 = [v11 realImageForIcon:v8 imageAppearance:v9 options:4];
      if (!v26)
      {
        [(SBFolderIconImageSharedCache *)self willBeginCachingActivityForReason:@"fetch image from image cache"];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __85__SBFolderIconImageSharedCache_gridCellImageForIcon_imageAppearance_imageAttributes___block_invoke;
        v34[3] = &unk_1E6AB0318;
        id v35 = v11;
        id v36 = v8;
        id v37 = v9;
        v38 = self;
        id v27 = (id)[v35 cacheImageForIcon:v36 imageAppearance:v37 priority:2 reason:@"gridCellImageForIcon" options:0 completionHandler:v34];

        goto LABEL_23;
      }
      goto LABEL_15;
    }
    __int16 v26 = [v11 realImageForIcon:v8 imageAppearance:v9 options:0];
    if (v26) {
      goto LABEL_20;
    }
  }
  else
  {
    __int16 v28 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageAppearance:", v9);
    __int16 v26 = objc_msgSend(v8, "makeIconImageWithInfo:traitCollection:options:", v28, 1, v17, v19, v21, v23);

    if (v26)
    {
      if (v24)
      {
LABEL_15:
        [(SBFolderIconImageSharedCache *)self beginAsynchronousMiniImageGenerationForImage:v26 forIcon:v8 appearance:v9 reason:@"gridCellForImage" completionHandler:0];
        id v29 = SBLogFolderIconImageCache();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v8;
          _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_INFO, "beginning async mini image generation for icon %@", buf, 0xCu);
        }

        uint64_t v30 = -[SBHIconImageAppearanceStore imageForIcon:appearanceType:](self->_cachedMiniGridImages, "imageForIcon:appearanceType:", v8, [v9 appearanceType]);
        if (!v30)
        {
          double v13 = [(SBFolderIconImageSharedCache *)self cachingPlaceholderMiniGridImageWithImageAppearance:v9];
LABEL_28:
          unint64_t v12 = 1;
          goto LABEL_30;
        }
        goto LABEL_21;
      }
LABEL_20:
      uint64_t v30 = [(SBFolderIconImageSharedCache *)self performSynchronousMiniImageGenerationForImage:v26 forIcon:v8 appearance:v9];
LABEL_21:
      double v13 = (void *)v30;
      goto LABEL_22;
    }
  }
LABEL_23:
  if ([(id)objc_opt_class() hasIconImage])
  {
    int v31 = [v11 isCachingImageForIcon:v8];
    char v32 = SBLogFolderIconImageCache();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (v31)
    {
      if (v33)
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v8;
        _os_log_impl(&dword_1D7F0A000, v32, OS_LOG_TYPE_INFO, "icon image cache is still caching image for icon %@", buf, 0xCu);
      }

      double v13 = [(SBFolderIconImageSharedCache *)self cachingPlaceholderMiniGridImageWithImageAppearance:v9];
      __int16 v26 = 0;
      goto LABEL_28;
    }
    if (v33)
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v8;
      _os_log_impl(&dword_1D7F0A000, v32, OS_LOG_TYPE_INFO, "Could not get grid cell image for icon %@", buf, 0xCu);
    }

    double v13 = [(SBFolderIconImageSharedCache *)self genericMiniGridImageWithImageAppearance:v9];
    __int16 v26 = 0;
LABEL_22:
    unint64_t v12 = 0;
    goto LABEL_30;
  }
  __int16 v26 = 0;
  unint64_t v12 = 0;
  double v13 = 0;
LABEL_30:

  if (a5) {
LABEL_3:
  }
    *a5 = v12;
LABEL_4:

  return v13;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBFolderIconImageSharedCache)initWithListLayout:(id)a3 iconImageCache:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SBFolderIconImageSharedCache;
  id v9 = [(SBFolderIconImageSharedCache *)&v45 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listLayout, a3);
    objc_storeStrong((id *)&v10->_iconImageCache, a4);
    uint64_t v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    folderIconObservers = v10->_folderIconObservers;
    v10->_folderIconObservers = (NSMapTable *)v11;

    double v13 = objc_alloc_init(SBHIconImageAppearanceStore);
    cachedFolderImages = v10->_cachedFolderImages;
    v10->_cachedFolderImages = v13;

    id v15 = objc_alloc_init(SBHIconImageAppearanceStore);
    cachedMiniGridImages = v10->_cachedMiniGridImages;
    v10->_cachedMiniGridImages = v15;

    double v17 = objc_alloc_init(SBHIconImageAppearanceStore);
    cachedMiniGridImageGenerations = v10->_cachedMiniGridImageGenerations;
    v10->_cachedMiniGridImageGenerations = v17;

    uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    cachedFolderIcons = v10->_cachedFolderIcons;
    v10->_cachedFolderIcons = (NSHashTable *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    folderIconImageCaches = v10->_folderIconImageCaches;
    v10->_folderIconImageCaches = (NSHashTable *)v21;

    v10->_miniGridImageLoadingAsynchronous = [(id)objc_opt_class() isMiniGridImageLoadingAsynchronous];
    [v8 addObserver:v10];
    uint64_t v23 = [v7 numberOfColumnsForOrientation:1];
    uint64_t v24 = [v7 numberOfRowsForOrientation:1];
    +[SBIconGridImage sizeForLayout:v7];
    double v26 = v25;
    double v28 = v27;
    id v29 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v30 scale];
    uint64_t v32 = objc_msgSend(v29, "sbf_bytesNeededForSize:scale:withContextType:", 0, v26, v28, v31);

    snprintf(__str, 0x64uLL, "gridImages_%lux%lu", v23, v24);
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F4BE60]) initWithLabel:__str slotLength:v32];
    pool = v10->_pool;
    v10->_pool = (CPMemoryPool *)v33;

    double v35 = SBHIconListLayoutFolderIconGridCellSize(v7);
    double v37 = v36;
    v38 = (void *)MEMORY[0x1E4FB1818];
    v39 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v39 scale];
    uint64_t v41 = objc_msgSend(v38, "sbf_bytesNeededForSize:scale:withContextType:", 0, v35, v37, v40);

    snprintf(__str, 0x64uLL, "miniGridImages_%lux%lu", (unint64_t)v35, (unint64_t)v37);
    uint64_t v42 = [objc_alloc(MEMORY[0x1E4F4BE60]) initWithLabel:__str slotLength:v41];
    miniGridImagePool = v10->_miniGridImagePool;
    v10->_miniGridImagePool = (CPMemoryPool *)v42;
  }
  return v10;
}

- (void)registerFolderIconImageCache:(id)a3
{
}

- (void)unregisterFolderIconImageCache:(id)a3
{
}

- (void)addObserver:(id)a3 forFolderIcon:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_folderIconObservers objectForKey:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMapTable *)self->_folderIconObservers setObject:v7 forKey:v6];
    [v6 addObserver:self];
    id v8 = [v6 folder];
    [v8 addFolderObserver:self];
  }
  [v7 addObject:v9];
}

- (void)removeObserver:(id)a3 forFolderIcon:(id)a4
{
  folderIconObservers = self->_folderIconObservers;
  id v6 = a3;
  id v7 = [(NSMapTable *)folderIconObservers objectForKey:a4];
  [v7 removeObject:v6];
}

+ (BOOL)isMiniGridImageLoadingAsynchronous
{
  return 1;
}

- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4
{
  return [(SBFolderIconImageSharedCache *)self gridCellImageForIcon:a3 imageAppearance:a4 imageAttributes:0];
}

void __85__SBFolderIconImageSharedCache_gridCellImageForIcon_imageAppearance_imageAttributes___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageForIcon:*(void *)(a1 + 40) imageAppearance:*(void *)(a1 + 48) options:4];
  if (v2) {
    [*(id *)(a1 + 56) beginAsynchronousMiniImageGenerationForImage:v2 forIcon:*(void *)(a1 + 40) appearance:*(void *)(a1 + 48) reason:@"fault from gridCellImageForIcon" completionHandler:0];
  }
  [*(id *)(a1 + 56) didEndCachingActivityForReason:@"fetch image from image cache"];
}

+ (OS_dispatch_queue)miniImageQueue
{
  if (miniImageQueue_onceToken != -1) {
    dispatch_once(&miniImageQueue_onceToken, &__block_literal_global_33);
  }
  id v2 = (void *)miniImageQueue_miniImageQueue;
  return (OS_dispatch_queue *)v2;
}

void __46__SBFolderIconImageSharedCache_miniImageQueue__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F730] serial];
  v0 = [v3 serviceClass:21];
  uint64_t v1 = BSDispatchQueueCreate();
  id v2 = (void *)miniImageQueue_miniImageQueue;
  miniImageQueue_miniImageQueue = v1;
}

- (void)beginAsynchronousMiniImageGenerationForImage:(id)a3 forIcon:(id)a4 appearance:(id)a5 reason:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  double v16 = (void (**)(id, void))a7;
  double v17 = [(SBFolderIconImageSharedCache *)self iconImageCache];
  double v18 = [(SBFolderIconImageSharedCache *)self listLayout];
  double v19 = SBHIconListLayoutFolderIconGridCellSize(v18);
  uint64_t v21 = v20;
  unint64_t v22 = [v17 imageGenerationForCachedImage:v12];
  uint64_t v23 = [[SBHIconImageIdentity alloc] initWithIcon:v13 imageGeneration:v22 imageAppearance:v14];
  uint64_t v38 = [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImages imageForIcon:v13 appearance:v14];
  if (v38)
  {
    double v36 = v17;
    double v37 = v23;
    double v35 = v18;
    id v24 = v12;
    os_unfair_lock_lock(&self->_lock);
    double v25 = [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImageGenerations imageForIcon:v13 appearance:v14];
    unint64_t v26 = [v25 unsignedIntegerValue];
    os_unfair_lock_unlock(&self->_lock);
    if (v25 && v26 >= v22)
    {
      double v27 = SBLogFolderIconImageCache();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[SBFolderIconImageSharedCache beginAsynchronousMiniImageGenerationForImage:forIcon:appearance:reason:completionHandler:]();
      }

      id v12 = v24;
      if (v16) {
        v16[2](v16, 0);
      }

      double v17 = v36;
      uint64_t v23 = v37;
LABEL_20:
      id v29 = (void *)v38;
      goto LABEL_21;
    }

    id v12 = v24;
    double v17 = v36;
    uint64_t v23 = v37;
  }
  if (!-[NSMutableSet containsObject:](self->_cachingMiniGridImageIdentities, "containsObject:", v23, v35))
  {
    [(SBFolderIconImageSharedCache *)self willBeginCachingActivityForReason:@"mini image generation"];
    cachingMiniGridImageIdentities = self->_cachingMiniGridImageIdentities;
    if (!cachingMiniGridImageIdentities)
    {
      double v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v32 = self->_cachingMiniGridImageIdentities;
      self->_cachingMiniGridImageIdentities = v31;

      cachingMiniGridImageIdentities = self->_cachingMiniGridImageIdentities;
    }
    [(NSMutableSet *)cachingMiniGridImageIdentities addObject:v23];
    uint64_t v33 = SBLogFolderIconImageCache();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[SBFolderIconImageSharedCache beginAsynchronousMiniImageGenerationForImage:forIcon:appearance:reason:completionHandler:]();
    }

    v34 = [(id)objc_opt_class() miniImageQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__SBFolderIconImageSharedCache_beginAsynchronousMiniImageGenerationForImage_forIcon_appearance_reason_completionHandler___block_invoke;
    block[3] = &unk_1E6AB0340;
    block[4] = self;
    id v40 = v12;
    id v41 = v13;
    uint64_t v42 = v23;
    double v45 = v19;
    uint64_t v46 = v21;
    id v43 = v15;
    v44 = v16;
    dispatch_async(v34, block);

    goto LABEL_20;
  }
  double v28 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache beginAsynchronousMiniImageGenerationForImage:forIcon:appearance:reason:completionHandler:]();
  }

  id v29 = (void *)v38;
  if (v16) {
    v16[2](v16, 0);
  }
LABEL_21:
}

uint64_t __121__SBFolderIconImageSharedCache_beginAsynchronousMiniImageGenerationForImage_forIcon_appearance_reason_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAsynchronousMiniImageGenerationForImage:forIcon:imageIdentity:miniImageSize:reason:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

- (void)performAsynchronousMiniImageGenerationForImage:(id)a3 forIcon:(id)a4 imageIdentity:(id)a5 miniImageSize:(CGSize)a6 reason:(id)a7 completionHandler:(id)a8
{
  double height = a6.height;
  double width = a6.width;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache performAsynchronousMiniImageGenerationForImage:forIcon:imageIdentity:miniImageSize:reason:completionHandler:]();
  }

  uint64_t v21 = [v17 imageAppearance];
  unint64_t v22 = [v17 imageGeneration];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v23 = [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImageGenerations imageForIcon:v16 appearance:v21];
  os_unfair_lock_unlock(&self->_lock);
  unint64_t v24 = [v23 unsignedIntegerValue];
  if (v23 && v24 >= v22)
  {
    double v25 = SBLogFolderIconImageCache();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[SBFolderIconImageSharedCache performAsynchronousMiniImageGenerationForImage:forIcon:imageIdentity:miniImageSize:reason:completionHandler:]();
    }
  }
  else
  {
    uint64_t v26 = +[SBFolderIconImageCache gridCellImageOfSize:forIconImage:](SBFolderIconImageCache, "gridCellImageOfSize:forIconImage:", v15, width, height);
    if (v26)
    {
      double v27 = (void *)v26;
      double v28 = SBLogFolderIconImageCache();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[SBFolderIconImageSharedCache performAsynchronousMiniImageGenerationForImage:forIcon:imageIdentity:miniImageSize:reason:completionHandler:]();
      }

      id v31 = v16;
      id v32 = v17;
      id v33 = v18;
      id v34 = v19;
      id v29 = v27;
      BSDispatchMain();

      goto LABEL_14;
    }
  }
  if (v19)
  {
    id v30 = v19;
    BSDispatchMain();
    id v29 = v30;
LABEL_14:
  }
}

uint64_t __140__SBFolderIconImageSharedCache_performAsynchronousMiniImageGenerationForImage_forIcon_imageIdentity_miniImageSize_reason_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishAsynchronousMiniImageGenerationWithImage:*(void *)(a1 + 40) forIcon:*(void *)(a1 + 48) imageIdentity:*(void *)(a1 + 56) reason:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

uint64_t __140__SBFolderIconImageSharedCache_performAsynchronousMiniImageGenerationForImage_forIcon_imageIdentity_miniImageSize_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishAsynchronousMiniImageGenerationWithImage:(id)a3 forIcon:(id)a4 imageIdentity:(id)a5 reason:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, BOOL))a7;
  id v15 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache finishAsynchronousMiniImageGenerationWithImage:forIcon:imageIdentity:reason:completionHandler:]();
  }

  id v16 = [v13 imageAppearance];
  uint64_t v17 = [v13 imageGeneration];
  if (v11)
  {
    unint64_t v18 = v17;
    os_unfair_lock_lock(&self->_lock);
    id v19 = [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImageGenerations imageForIcon:v12 appearance:v16];
    unint64_t v20 = [v19 unsignedIntegerValue];
    if (v19 && v20 >= v18)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      cachedMiniGridImageGenerations = self->_cachedMiniGridImageGenerations;
      unint64_t v22 = [NSNumber numberWithUnsignedInteger:v18];
      [(SBHIconImageAppearanceStore *)cachedMiniGridImageGenerations setImage:v22 forIcon:v12 appearance:v16];

      os_unfair_lock_unlock(&self->_lock);
      [(SBFolderIconImageSharedCache *)self updateCachedMiniImage:v11 forIcon:v12 imageAppearance:v16];
    }
  }
  [(NSMutableSet *)self->_cachingMiniGridImageIdentities removeObject:v13];
  [(SBFolderIconImageSharedCache *)self didEndCachingActivityForReason:@"mini image generation"];
  if (v14) {
    v14[2](v14, v11 != 0);
  }
}

- (void)updateCachedMiniImage:(id)a3 forIcon:(id)a4 imageAppearance:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImages setImage:v8 forIcon:v9 appearance:v10];
  [v9 addObserver:self];
  id v11 = self;
  unint64_t v24 = [(SBFolderIconImageSharedCache *)self miniGridImageLayers];
  double v25 = v10;
  id v12 = [v24 imageForIcon:v9 appearance:v10];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "setContents:", objc_msgSend(v8, "CGImage"));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v14);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = (void *)[(NSHashTable *)v11->_cachedFolderIcons copy];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        unint64_t v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v23 = [v22 folder];
        if ([v23 containsIcon:v9]) {
          [(SBFolderIconImageSharedCache *)v11 updateCachedImagesForFolderIcon:v22 afterChangeToContainedForIcon:v9 imageAppearance:v25 updateType:1];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }
}

- (id)performSynchronousMiniImageGenerationForImage:(id)a3 forIcon:(id)a4 appearance:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBFolderIconImageSharedCache *)self iconImageCache];
  id v12 = [(SBFolderIconImageSharedCache *)self listLayout];
  double v13 = SBHIconListLayoutFolderIconGridCellSize(v12);
  double v15 = v14;
  unint64_t v16 = [v11 imageGenerationForCachedImage:v8];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v17 = [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImageGenerations imageForIcon:v9 appearance:v10];
  unint64_t v18 = [v17 unsignedIntegerValue];
  if (v17 && v18 >= v16)
  {
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v19 = [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImages imageForIcon:v9 appearance:v10];
  }
  else
  {
    cachedMiniGridImageGenerations = self->_cachedMiniGridImageGenerations;
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:v16];
    [(SBHIconImageAppearanceStore *)cachedMiniGridImageGenerations setImage:v21 forIcon:v9 appearance:v10];

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v19 = +[SBFolderIconImageCache gridCellImageOfSize:forIconImage:](SBFolderIconImageCache, "gridCellImageOfSize:forIconImage:", v8, v13, v15);
    [(SBHIconImageAppearanceStore *)self->_cachedMiniGridImages setImage:v19 forIcon:v9 appearance:v10];
  }
  [v9 addObserver:self];

  return v19;
}

- (id)cachedMiniImageAppearancesForIcon:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  cachedMiniGridImages = self->_cachedMiniGridImages;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__SBFolderIconImageSharedCache_cachedMiniImageAppearancesForIcon___block_invoke;
  v10[3] = &unk_1E6AB0390;
  id v8 = v6;
  id v11 = v8;
  [(SBHIconImageAppearanceStore *)cachedMiniGridImages enumerateImagesForIcon:v5 usingBlock:v10];

  return v8;
}

uint64_t __66__SBFolderIconImageSharedCache_cachedMiniImageAppearancesForIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)rebuildImagesForFolderIcon:(id)a3
{
  id v4 = a3;
  id v5 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageCache rebuildImagesForFolderIcon:]();
  }

  [(SBHIconImageAppearanceStore *)self->_cachedFolderImages removeAllImagesForIcon:v4];
  [(NSHashTable *)self->_cachedFolderIcons removeAllObjects];
  [(SBFolderIconImageSharedCache *)self informObserversOfUpdateForFolderIcon:v4 imageAppearance:0];
}

- (void)rebuildAllCachedFolderImages
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageCache rebuildAllCachedFolderImages]();
  }

  id v4 = (void *)[(NSHashTable *)self->_cachedFolderIcons copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
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
        -[SBFolderIconImageSharedCache rebuildImagesForFolderIcon:](self, "rebuildImagesForFolderIcon:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)purgeAllCachedFolderImages
{
  id v3 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageCache purgeAllCachedFolderImages]();
  }

  [(SBHIconImageAppearanceStore *)self->_cachedFolderImages removeAllImages];
  [(NSHashTable *)self->_cachedFolderIcons removeAllObjects];
}

- (void)rebuildImagesForFolderIcon:(id)a3 appearance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache rebuildImagesForFolderIcon:appearance:]();
  }

  [(SBHIconImageAppearanceStore *)self->_cachedFolderImages removeAllImagesForIcon:v6 appearance:v7];
  [(NSHashTable *)self->_cachedFolderIcons removeObject:v6];
  [(SBFolderIconImageSharedCache *)self informObserversOfUpdateForFolderIcon:v6 imageAppearance:v7];
}

- (void)informObserversOfUpdateForFolderIcon:(id)a3 imageAppearance:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMapTable *)self->_folderIconObservers objectForKey:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v12++) folderIconImageSharedCache:self didUpdateImagesForFolderIcon:v6 imageAppearance:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v13 = self->_folderIconImageCaches;
  uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "folderIconImageSharedCache:didUpdateImagesForFolderIcon:imageAppearance:", self, v6, v7, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (id)genericMiniGridImageWithImageAppearance:(id)a3
{
  id v4 = a3;
  genericMiniGridImages = self->_genericMiniGridImages;
  id v6 = +[SBHIconImageAppearanceStore defaultIcon];
  id v7 = [(SBHIconImageAppearanceStore *)genericMiniGridImages imageForIcon:v6 appearance:v4];

  if (!v7)
  {
    uint64_t v8 = [(SBFolderIconImageSharedCache *)self iconImageCache];
    uint64_t v9 = [(SBFolderIconImageSharedCache *)self listLayout];
    uint64_t v10 = [v8 genericImageWithImageAppearance:v4 options:0];
    id v7 = +[SBFolderIconImageCache gridCellImageOfSize:v10 forIconImage:SBHIconListLayoutFolderIconGridCellSize(v9)];
    uint64_t v11 = self->_genericMiniGridImages;
    if (!v11)
    {
      uint64_t v12 = objc_alloc_init(SBHIconImageAppearanceStore);
      long long v13 = self->_genericMiniGridImages;
      self->_genericMiniGridImages = v12;

      uint64_t v11 = self->_genericMiniGridImages;
    }
    uint64_t v14 = +[SBHIconImageAppearanceStore defaultIcon];
    [(SBHIconImageAppearanceStore *)v11 setImage:v7 forIcon:v14 appearance:v4];
  }
  return v7;
}

- (id)cachingPlaceholderMiniGridImageWithImageAppearance:(id)a3
{
  id v4 = a3;
  if (+[SBHIconImageCache hasUniqueCachingPlaceholderImage])
  {
    cachingPlaceholderMiniGridImages = self->_cachingPlaceholderMiniGridImages;
    id v6 = +[SBHIconImageAppearanceStore defaultIcon];
    id v7 = [(SBHIconImageAppearanceStore *)cachingPlaceholderMiniGridImages imageForIcon:v6 appearance:v4];

    if (!v7)
    {
      uint64_t v8 = [(SBFolderIconImageSharedCache *)self iconImageCache];
      uint64_t v9 = [(SBFolderIconImageSharedCache *)self listLayout];
      uint64_t v10 = [v8 cachingPlaceholderImageWithImageAppearance:v4 options:0];
      id v7 = +[SBFolderIconImageCache gridCellImageOfSize:v10 forIconImage:SBHIconListLayoutFolderIconGridCellSize(v9)];
      uint64_t v11 = self->_cachingPlaceholderMiniGridImages;
      if (!v11)
      {
        uint64_t v12 = objc_alloc_init(SBHIconImageAppearanceStore);
        long long v13 = self->_cachingPlaceholderMiniGridImages;
        self->_cachingPlaceholderMiniGridImages = v12;

        uint64_t v11 = self->_cachingPlaceholderMiniGridImages;
      }
      uint64_t v14 = +[SBHIconImageAppearanceStore defaultIcon];
      [(SBHIconImageAppearanceStore *)v11 setImage:v7 forIcon:v14 appearance:v4];
    }
  }
  else
  {
    id v7 = [(SBFolderIconImageSharedCache *)self genericMiniGridImageWithImageAppearance:v4];
  }

  return v7;
}

void __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (!v7 || [v7 isEqual:v6])
  {
    uint64_t v8 = [*(id *)(a1 + 40) folder];
    uint64_t v9 = [v8 listCount];
    unint64_t v10 = [v5 count];
    unint64_t v11 = [*(id *)(a1 + 40) listIndexForContainedIcon:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (v11 >= v10)
    {
LABEL_24:

      goto LABEL_25;
    }
    if (v10 != v9)
    {
      long long v21 = SBLogFolderIconImageCache();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v34 = v10;
        __int16 v35 = 2048;
        uint64_t v36 = v9;
        __int16 v37 = 2112;
        uint64_t v38 = v8;
        _os_log_debug_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEBUG, "purging image for folder after contained icon image updated because list counts differed (%lu vs. %lu): %@", buf, 0x20u);
      }

      [*(id *)(*(void *)(a1 + 56) + 16) removeAllImagesForIcon:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 56) + 48) removeObject:*(void *)(a1 + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      goto LABEL_24;
    }
    unint64_t v12 = v11;
    long long v13 = [v8 listAtIndex:v11];
    uint64_t v14 = [v13 indexForIcon:*(void *)(a1 + 48)];

    uint64_t v15 = [*(id *)(a1 + 40) gridCellIndexForIconIndex:v14];
    uint64_t v16 = [v5 pointerAtIndex:v12];
    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = *(void *)(a1 + 80);
      if (v18 == 2)
      {
LABEL_14:
        long long v22 = SBLogFolderIconImageCache();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_1();
        }

        [v5 replacePointerAtIndex:v12 withPointer:0];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        goto LABEL_23;
      }
      if (v18 != 3)
      {
LABEL_18:
        id v23 = *(id *)(a1 + 32);
        if (!v23)
        {
          id v23 = [v17 imageAppearance];
        }
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_179;
        v29[3] = &unk_1E6AB03B8;
        uint64_t v32 = v15;
        int8x16_t v28 = *(int8x16_t *)(a1 + 48);
        id v24 = (id)v28.i64[0];
        int8x16_t v30 = vextq_s8(v28, v28, 8uLL);
        id v25 = v23;
        id v31 = v25;
        long long v26 = [v17 gridImageByPatchingCellAtIndex:v15 cellImageProviderBlock:v29];
        long long v27 = SBLogFolderIconImageCache();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_2();
        }

        [v5 replacePointerAtIndex:v12 withPointer:v26];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;

        goto LABEL_23;
      }
      char v19 = [v16 isIconImageTreatedAtIndex:v15];
      char v20 = v19 ^ +[SBFolderIconImageCache needsTreatmentForIcon:*(void *)(a1 + 48)] ^ 1;
    }
    else
    {
      char v20 = 1;
    }
    if (*(void *)(a1 + 80) == 2) {
      goto LABEL_14;
    }
    if (v20)
    {
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_18;
  }
LABEL_25:
}

BOOL __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_179(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, void *a8)
{
  if (*(void *)(a1 + 56) != a2) {
    return 0;
  }
  uint64_t v14 = [*(id *)(a1 + 32) gridCellImageForIcon:*(void *)(a1 + 40) imageAppearance:*(void *)(a1 + 48)];
  uint64_t v15 = v14;
  BOOL v16 = v14 != 0;
  if (v14)
  {
    objc_msgSend(v14, "drawInRect:", a3, a4, a5, a6);
    BOOL v17 = +[SBFolderIconImageCache drawTreatmentForIcon:inRect:](SBFolderIconImageCache, "drawTreatmentForIcon:inRect:", *(void *)(a1 + 40), a3, a4, a5, a6);
    if (a8) {
      *a8 = v17;
    }
  }

  return v16;
}

- (BOOL)hasCachedItemsThatIncludeIcon:(id)a3 imageAppearance:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_cachedFolderIcons copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) folder];
        char v14 = [v13 containsIcon:v6];

        if (v14)
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v8 = [(SBFolderIconImageSharedCache *)self miniGridImageLayers];
  uint64_t v15 = [v8 imageForIcon:v6 appearance:v7];
  BOOL v16 = [v15 count] != 0;

LABEL_11:
  return v16;
}

- (void)willBeginCachingActivityForReason:(id)a3
{
  id v4 = a3;
  backgroundActivityReasons = self->_backgroundActivityReasons;
  id v8 = v4;
  if (!backgroundActivityReasons)
  {
    id v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v7 = self->_backgroundActivityReasons;
    self->_backgroundActivityReasons = v6;

    id v4 = v8;
    backgroundActivityReasons = self->_backgroundActivityReasons;
  }
  [(NSCountedSet *)backgroundActivityReasons addObject:v4];
}

- (void)didEndCachingActivityForReason:(id)a3
{
  [(NSCountedSet *)self->_backgroundActivityReasons removeObject:a3];
  [(SBFolderIconImageSharedCache *)self checkIfCachingActivityHasCompleted];
}

- (void)performWhenCachingActivityCompletesUsingBlock:(id)a3
{
  uint64_t v9 = (void (**)(void))a3;
  if ([(NSCountedSet *)self->_backgroundActivityReasons count])
  {
    performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    if (!performAfterCachingActivityBlocks)
    {
      id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = self->_performAfterCachingActivityBlocks;
      self->_performAfterCachingActivityBlocks = v5;

      performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    }
    id v7 = (void *)[v9 copy];
    id v8 = _Block_copy(v7);
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
  if (![(NSCountedSet *)self->_backgroundActivityReasons count])
  {
    id v3 = self->_performAfterCachingActivityBlocks;
    performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    self->_performAfterCachingActivityBlocks = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
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

- (unint64_t)numberOfCachedImages
{
  return [(SBHIconImageAppearanceStore *)self->_cachedFolderImages numberOfCachedImages];
}

- (unint64_t)numberOfCacheHits
{
  return 0;
}

- (unint64_t)numberOfCacheMisses
{
  return 0;
}

- (NSString)activityDescription
{
  id v3 = NSString;
  uint64_t v4 = [(NSMutableSet *)self->_cachingMiniGridImageIdentities count];
  id v5 = [(NSCountedSet *)self->_backgroundActivityReasons allObjects];
  uint64_t v6 = [v5 componentsJoinedByString:@", "];
  uint64_t v7 = [v3 stringWithFormat:@"Mini images generating: %lu, background tasks: %@", v4, v6];

  return (NSString *)v7;
}

- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6 imageAttributes:(unint64_t *)a7
{
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  double v16 = v7;
  double height = a3.height;
  double width = a3.width;
  long long v20 = (void *)MEMORY[0x1E4FB1E20];
  id v21 = a4;
  long long v22 = objc_msgSend(v20, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  uint64_t v23 = -[SBFolderIconImageSharedCache gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:imageAttributes:](self, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:imageAttributes:", v21, v22, a6, width, height, v16, v15, v14, v13);

  return v23;
}

- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache iconImageCache:didUpdateImageForIcon:imageAppearance:](v9, v11);
  }

  if ([v8 currentRequestChangedImageVisually]
    && [(SBFolderIconImageSharedCache *)self hasCachedItemsThatIncludeIcon:v9 imageAppearance:v10])
  {
    if ([(id)objc_opt_class() isMiniGridImageLoadingAsynchronous])
    {
      id v12 = [v8 imageForIcon:v9 imageAppearance:v10 options:0];
      [(SBFolderIconImageSharedCache *)self beginAsynchronousMiniImageGenerationForImage:v12 forIcon:v9 appearance:v10 reason:@"image cache update" completionHandler:0];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      double v13 = (void *)[(NSHashTable *)self->_cachedFolderIcons copy];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            long long v19 = [v18 folder];
            if ([v19 containsIcon:v9]) {
              [(SBFolderIconImageSharedCache *)self updateCachedImagesForFolderIcon:v18 afterChangeToContainedForIcon:v9 imageAppearance:v10 updateType:0];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v15);
      }

      long long v26 = [(SBFolderIconImageSharedCache *)self miniGridImageLayers];
      long long v20 = [v26 imageForIcon:v9 appearance:v10];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        id v12 = 0;
        uint64_t v23 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v28 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            if (!v12)
            {
              id v12 = [(SBFolderIconImageSharedCache *)self gridCellImageForIcon:v9 imageAppearance:v10];
            }
            id v12 = v12;
            objc_msgSend(v25, "setContents:", objc_msgSend(v12, "CGImage"));
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v22);
      }
      else
      {
        id v12 = 0;
      }
    }
  }
}

- (void)iconImageDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderIconImageSharedCache *)self iconImageCache];
  if ([(SBFolderIconImageSharedCache *)self isMiniGridImageLoadingAsynchronous])
  {
    uint64_t v6 = SBLogFolderIconImageCache();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBFolderIconImageSharedCache iconImageDidUpdate:]();
    }

    double v7 = [(SBFolderIconImageSharedCache *)self cachedMiniImageAppearancesForIcon:v4];
    if ([v7 count])
    {
      [(SBFolderIconImageSharedCache *)self willBeginCachingActivityForReason:@"folder image cache icon observer"];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__SBFolderIconImageSharedCache_iconImageDidUpdate___block_invoke;
      v9[3] = &unk_1E6AADD48;
      id v10 = v5;
      id v11 = v4;
      id v12 = v7;
      double v13 = self;
      id v8 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v9);
    }
  }
}

void __51__SBFolderIconImageSharedCache_iconImageDidUpdate___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v13[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v4 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBFolderIconImageSharedCache_iconImageDidUpdate___block_invoke_2;
  v8[3] = &unk_1E6AB0318;
  id v9 = v4;
  id v10 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = (id)[v2 cacheImagesForIcons:v3 imageAppearances:v9 priority:1 reason:@"folder image cache icon observer" options:0 completionHandler:v8];
}

uint64_t __51__SBFolderIconImageSharedCache_iconImageDidUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "imageForIcon:imageAppearance:options:", *(void *)(a1 + 48), v7, 4, (void)v10);
        if (v8) {
          [*(id *)(a1 + 56) beginAsynchronousMiniImageGenerationForImage:v8 forIcon:*(void *)(a1 + 48) appearance:v7 reason:@"folder image cache icon observer" completionHandler:0];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 56) didEndCachingActivityForReason:@"folder image cache icon observer"];
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache folder:didAddList:]();
  }

  id v9 = [v6 icon];
  cachedFolderImages = self->_cachedFolderImages;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__SBFolderIconImageSharedCache_folder_didAddList___block_invoke;
  v14[3] = &unk_1E6AB0408;
  id v15 = v6;
  id v16 = v7;
  BOOL v17 = self;
  id v18 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v6;
  [(SBHIconImageAppearanceStore *)cachedFolderImages enumerateImagesForIcon:v11 usingBlock:v14];
}

void __50__SBFolderIconImageSharedCache_folder_didAddList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) indexOfList:*(void *)(a1 + 40)];
  if (v8
    && v6 != 0x7FFFFFFFFFFFFFFFLL
    && (uint64_t v7 = [v8 count] + 1, v7 == objc_msgSend(*(id *)(a1 + 32), "listCount")))
  {
    [v8 insertPointer:0 atIndex:v6];
    [*(id *)(a1 + 48) informObserversOfUpdateForFolderIcon:*(void *)(a1 + 56) imageAppearance:0];
  }
  else
  {
    [*(id *)(a1 + 48) rebuildImagesForFolderIcon:*(void *)(a1 + 56) appearance:v5];
  }
}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache folder:didRemoveLists:atIndexes:]();
  }

  id v12 = [v8 icon];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  cachedFolderImages = self->_cachedFolderImages;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke;
  v17[3] = &unk_1E6AB0458;
  uint64_t v22 = &v23;
  id v14 = v8;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  long long v20 = self;
  id v16 = v12;
  id v21 = v16;
  [(SBHIconImageAppearanceStore *)cachedFolderImages enumerateImagesForIcon:v16 usingBlock:v17];
  if (!*((unsigned char *)v24 + 24)) {
    [(SBFolderIconImageSharedCache *)self informObserversOfUpdateForFolderIcon:v16 imageAppearance:0];
  }

  _Block_object_dispose(&v23, 8);
}

void __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v7 = [*(id *)(a1 + 32) listCount];
  uint64_t v8 = [*(id *)(a1 + 40) count] + v7;
  if (v8 == [v5 count])
  {
    id v9 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke_2;
    v10[3] = &unk_1E6AB0430;
    id v11 = v5;
    [v9 enumerateIndexesWithOptions:2 usingBlock:v10];
    [*(id *)(a1 + 48) informObserversOfUpdateForFolderIcon:*(void *)(a1 + 56) imageAppearance:0];
  }
  else
  {
    [*(id *)(a1 + 48) rebuildImagesForFolderIcon:*(void *)(a1 + 56) appearance:v6];
  }
}

uint64_t __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removePointerAtIndex:a2];
}

- (void)folder:(id)a3 didMoveList:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache folder:didMoveList:fromIndex:toIndex:]();
  }

  id v13 = [v10 icon];
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  cachedFolderImages = self->_cachedFolderImages;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __69__SBFolderIconImageSharedCache_folder_didMoveList_fromIndex_toIndex___block_invoke;
  long long v20 = &unk_1E6AB0480;
  id v24 = &v27;
  id v15 = v10;
  unint64_t v25 = a5;
  unint64_t v26 = a6;
  id v21 = v15;
  uint64_t v22 = self;
  id v16 = v13;
  id v23 = v16;
  [(SBHIconImageAppearanceStore *)cachedFolderImages enumerateImagesForIcon:v16 usingBlock:&v17];
  if (!*((unsigned char *)v28 + 24)) {
    -[SBFolderIconImageSharedCache informObserversOfUpdateForFolderIcon:imageAppearance:](self, "informObserversOfUpdateForFolderIcon:imageAppearance:", v16, 0, v17, v18, v19, v20, v21, v22);
  }

  _Block_object_dispose(&v27, 8);
}

void __69__SBFolderIconImageSharedCache_folder_didMoveList_fromIndex_toIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t v6 = [*(id *)(a1 + 32) listCount];
  if (v6 == [v8 count])
  {
    uint64_t v7 = [v8 pointerAtIndex:*(void *)(a1 + 64)];
    [v8 removePointerAtIndex:*(void *)(a1 + 64)];
    [v8 insertPointer:v7 atIndex:*(void *)(a1 + 72)];
    [*(id *)(a1 + 40) informObserversOfUpdateForFolderIcon:*(void *)(a1 + 48) imageAppearance:0];
  }
  else
  {
    [*(id *)(a1 + 40) rebuildImagesForFolderIcon:*(void *)(a1 + 48) appearance:v5];
  }
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  id v6 = a3;
  uint64_t v7 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache folder:didAddIcons:removedIcons:]();
  }

  id v8 = [v6 icon];
  [(SBFolderIconImageSharedCache *)self rebuildImagesForFolderIcon:v8];
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v9 uniqueIdentifier];
    id v14 = [v10 uniqueIdentifier];
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    long long v20 = v14;
    _os_log_debug_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEBUG, "observed folder '%@' replaced '%@' with '%@'", (uint8_t *)&v15, 0x20u);
  }
  id v12 = [v8 icon];
  [(SBFolderIconImageSharedCache *)self updateCachedImagesForFolderIcon:v12 afterChangeToContainedForIcon:v10 imageAppearance:0 updateType:2];
}

- (void)folder:(id)a3 didMoveIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageSharedCache folder:didMoveIcon:]((uint64_t)v6, v7, v8);
  }

  id v9 = [v6 icon];
  [(SBFolderIconImageSharedCache *)self rebuildImagesForFolderIcon:v9];
}

- (BOOL)isMiniGridImageLoadingAsynchronous
{
  return self->_miniGridImageLoadingAsynchronous;
}

- (void)setMiniGridImageLoadingAsynchronous:(BOOL)a3
{
  self->_miniGridImageLoadingAsynchronous = a3;
}

- (CPMemoryPool)pool
{
  return self->_pool;
}

- (CPMemoryPool)miniGridImagePool
{
  return self->_miniGridImagePool;
}

- (void)setMiniGridImageLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniGridImageLayers, 0);
  objc_storeStrong((id *)&self->_miniGridImagePool, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_backgroundActivityReasons, 0);
  objc_storeStrong((id *)&self->_performAfterCachingActivityBlocks, 0);
  objc_storeStrong((id *)&self->_cachingPlaceholderMiniGridImages, 0);
  objc_storeStrong((id *)&self->_genericMiniGridImages, 0);
  objc_storeStrong((id *)&self->_folderIconImageCaches, 0);
  objc_storeStrong((id *)&self->_cachedFolderIcons, 0);
  objc_storeStrong((id *)&self->_cachingMiniGridImageIdentities, 0);
  objc_storeStrong((id *)&self->_cachedMiniGridImageGenerations, 0);
  objc_storeStrong((id *)&self->_cachedMiniGridImages, 0);
  objc_storeStrong((id *)&self->_cachedFolderImages, 0);
  objc_storeStrong((id *)&self->_folderIconObservers, 0);
}

- (void)gridCellImageForIcon:imageAppearance:imageAttributes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "making new grid cell image for icon %@ (using cache: %@)");
}

- (void)beginAsynchronousMiniImageGenerationForImage:forIcon:appearance:reason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "skipping asynchronous mini image generation for image identity because it is already caching: %@, reason: %{public}@");
}

- (void)beginAsynchronousMiniImageGenerationForImage:forIcon:appearance:reason:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "scheduling asynchronous mini image generation for image identity: %@", v2, v3, v4, v5, v6);
}

- (void)beginAsynchronousMiniImageGenerationForImage:forIcon:appearance:reason:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "skipping asynchronous mini image generation for image identity because it is already cached: %@, reason: %{public}@");
}

- (void)performAsynchronousMiniImageGenerationForImage:forIcon:imageIdentity:miniImageSize:reason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "scheduling main thread work for asynchonous mini image generation for image identity: %@", v2, v3, v4, v5, v6);
}

- (void)performAsynchronousMiniImageGenerationForImage:forIcon:imageIdentity:miniImageSize:reason:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "skipping generating mini image because the image generations don't match: %@", v2, v3, v4, v5, v6);
}

- (void)performAsynchronousMiniImageGenerationForImage:forIcon:imageIdentity:miniImageSize:reason:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "beginning background work for asynchronous mini image generation for image identity: %@", v2, v3, v4, v5, v6);
}

- (void)finishAsynchronousMiniImageGenerationWithImage:forIcon:imageIdentity:reason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "beginning main thread work for asynchonous mini image generation for image identity: %@", v2, v3, v4, v5, v6);
}

- (void)rebuildImagesForFolderIcon:appearance:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "rebuilding image for icon: %@, appearance: %@");
}

- (void)updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_2(&dword_1D7F0A000, v0, v1, "no internal update needed to cached images but will inform observers of update", v2, v3, v4, v5, v6);
}

void __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "purging image for list %lu after contents of page changed", v2, v3, v4, v5, v6);
}

void __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "updating image for folder after contained icon image updated %@", v2, v3, v4, v5, v6);
}

- (void)iconImageCache:(void *)a1 didUpdateImageForIcon:(NSObject *)a2 imageAppearance:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "observed updated icon from icon cache: %@", v4, 0xCu);
}

- (void)iconImageDidUpdate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "observed image update from icon %@", v2, v3, v4, v5, v6);
}

- (void)folder:didAddList:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "observed folder added list: %@", v2, v3, v4, v5, v6);
}

- (void)folder:didRemoveLists:atIndexes:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "observed folder removed list: %@", v2, v3, v4, v5, v6);
}

- (void)folder:didMoveList:fromIndex:toIndex:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "observed folder moved list: %@", v2, v3, v4, v5, v6);
}

- (void)folder:didAddIcons:removedIcons:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "observed folder added or removed icons: %@", v2, v3, v4, v5, v6);
}

- (void)folder:(NSObject *)a3 didMoveIcon:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 uniqueIdentifier];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_DEBUG, "observed folder '%@' moved '%@'", (uint8_t *)&v6, 0x16u);
}

@end