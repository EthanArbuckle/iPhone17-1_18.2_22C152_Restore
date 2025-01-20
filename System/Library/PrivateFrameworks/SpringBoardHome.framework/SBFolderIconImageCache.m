@interface SBFolderIconImageCache
+ (BOOL)drawTreatmentForIcon:(id)a3 inRect:(CGRect)a4;
+ (BOOL)needsTreatmentForIcon:(id)a3;
+ (id)defaultListLayout;
+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6;
+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6 imageAttributes:(unint64_t *)a7;
+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 imageAppearance:(id)a6;
+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 imageAppearance:(id)a6 imageAttributes:(unint64_t *)a7;
+ (id)gridCellImageOfSize:(CGSize)a3 forIconImage:(id)a4;
+ (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 compatibleWithTraitCollection:(id)a5 listLayout:(id)a6 gridCellImageProvider:(id)a7 pool:(id)a8;
+ (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5 listLayout:(id)a6 gridCellImageProvider:(id)a7 pool:(id)a8;
- (BOOL)shouldSkipGridCellImageForIcon:(id)a3;
- (SBFolderIconImageCache)init;
- (SBFolderIconImageCache)initWithListLayout:(id)a3;
- (SBFolderIconImageCache)initWithListLayout:(id)a3 iconImageCache:(id)a4;
- (SBFolderIconImageCache)initWithListLayout:(id)a3 iconImageCache:(id)a4 sharedCache:(id)a5;
- (SBFolderIconImageSharedCache)sharedCache;
- (SBHIconImageCache)iconImageCache;
- (SBIconListLayout)listLayout;
- (id)activityDescription;
- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5;
- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4;
- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4 imageAttributes:(unint64_t *)a5;
- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6;
- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6 imageAttributes:(unint64_t *)a7;
- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 imageAppearance:(id)a6;
- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 compatibleWithTraitCollection:(id)a5;
- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5;
- (id)layerForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5;
- (unint64_t)numberOfCacheHits;
- (unint64_t)numberOfCacheMisses;
- (unint64_t)numberOfCachedImages;
- (void)addObserver:(id)a3 forFolderIcon:(id)a4;
- (void)folderIconImageSharedCache:(id)a3 didUpdateImagesForFolderIcon:(id)a4 imageAppearance:(id)a5;
- (void)informObserversOfUpdateForAllFolderIcons;
- (void)informObserversOfUpdateForFolderIcon:(id)a3 imageAppearance:(id)a4;
- (void)layoutHidingAssertionDidChange:(id)a3;
- (void)layoutHidingAssertionDidInvalidate:(id)a3;
- (void)performWhenCachingActivityCompletesUsingBlock:(id)a3;
- (void)purgeAllCachedFolderImages;
- (void)rebuildAllCachedFolderImages;
- (void)rebuildImagesForFolderIcon:(id)a3;
- (void)removeObserver:(id)a3 forFolderIcon:(id)a4;
@end

@implementation SBFolderIconImageCache

- (void)addObserver:(id)a3 forFolderIcon:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(NSMapTable *)self->_folderIconObservers objectForKey:v6];
  if (!v7)
  {
    v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMapTable *)self->_folderIconObservers setObject:v7 forKey:v6];
  }
  if (([v7 containsObject:v9] & 1) == 0)
  {
    [v7 addObject:v9];
    v8 = [(SBFolderIconImageCache *)self sharedCache];
    [v8 folderIconImageCache:self didAddObserverForFolderIcon:v6];
  }
}

- (void)removeObserver:(id)a3 forFolderIcon:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMapTable *)self->_folderIconObservers objectForKey:v6];
  if ([v7 containsObject:v8])
  {
    [v7 removeObject:v8];
    if (![v7 count]) {
      [(NSMapTable *)self->_folderIconObservers removeObjectForKey:v6];
    }
  }
}

- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 folder];
  v11 = [v10 listAtIndex:a3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v12 = self->_layoutHidingAssertions;
  uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "referencesIconInListModel:", v11, (void)v21))
        {

          v17 = [(SBFolderIconImageCache *)self listLayout];
          uint64_t v18 = [(id)objc_opt_class() imageForPageAtIndex:a3 inFolderIcon:v8 imageAppearance:v9 listLayout:v17 gridCellImageProvider:self pool:0];
          goto LABEL_11;
        }
      }
      uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v17 = [(SBFolderIconImageCache *)self sharedCache];
  uint64_t v18 = [v17 imageForPageAtIndex:a3 inFolderIcon:v8 imageAppearance:v9];
LABEL_11:
  v19 = (void *)v18;

  return v19;
}

- (SBFolderIconImageSharedCache)sharedCache
{
  return self->_sharedCache;
}

- (id)layerForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v27 = a5;
  id v9 = [v8 folder];
  v10 = [v9 listAtIndex:a3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v11 = self->_layoutHidingAssertions;
  uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        if ([*(id *)(*((void *)&v32 + 1) + 8 * i) referencesIconInListModel:v10])
        {

          v16 = [(SBFolderIconImageCache *)self listLayout];
          v19 = (void *)[v10 copy];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v20 = self->_layoutHidingAssertions;
          uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v29 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = [*(id *)(*((void *)&v28 + 1) + 8 * j) icons];
                [v19 removeIcons:v25 options:0];
              }
              uint64_t v22 = [(NSHashTable *)v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v22);
          }

          v17 = v27;
          uint64_t v18 = [v19 folderLayerWithListLayout:v16 imageAppearance:v27];

          goto LABEL_18;
        }
      }
      uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v16 = [(SBFolderIconImageCache *)self sharedCache];
  v17 = v27;
  uint64_t v18 = [v16 layerForPageAtIndex:a3 inFolderIcon:v8 imageAppearance:v27];
LABEL_18:

  return v18;
}

- (SBFolderIconImageCache)initWithListLayout:(id)a3 iconImageCache:(id)a4
{
  return [(SBFolderIconImageCache *)self initWithListLayout:a3 iconImageCache:a4 sharedCache:0];
}

- (SBFolderIconImageCache)initWithListLayout:(id)a3 iconImageCache:(id)a4 sharedCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBFolderIconImageCache;
  uint64_t v12 = [(SBFolderIconImageCache *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listLayout, a3);
    objc_storeStrong((id *)&v13->_iconImageCache, a4);
    if (v11) {
      uint64_t v14 = (SBFolderIconImageSharedCache *)v11;
    }
    else {
      uint64_t v14 = [[SBFolderIconImageSharedCache alloc] initWithListLayout:v9 iconImageCache:v10];
    }
    sharedCache = v13->_sharedCache;
    v13->_sharedCache = v14;

    [(SBFolderIconImageSharedCache *)v13->_sharedCache registerFolderIconImageCache:v13];
    uint64_t v16 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    folderIconObservers = v13->_folderIconObservers;
    v13->_folderIconObservers = (NSMapTable *)v16;
  }
  return v13;
}

- (SBFolderIconImageCache)initWithListLayout:(id)a3
{
  id v4 = a3;
  v5 = [SBHIconImageCache alloc];
  [v4 iconImageInfo];
  id v6 = -[SBHIconImageCache initWithName:iconImageInfo:](v5, "initWithName:iconImageInfo:", @"SBFolderIconImageCache");
  v7 = [(SBFolderIconImageCache *)self initWithListLayout:v4 iconImageCache:v6];

  return v7;
}

+ (id)defaultListLayout
{
  v2 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  [(SBIconListGridLayoutConfiguration *)v2 setNumberOfPortraitRows:3];
  [(SBIconListGridLayoutConfiguration *)v2 setNumberOfPortraitColumns:3];
  v3 = [(SBIconListGridLayoutConfiguration *)v2 folderIconVisualConfiguration];
  objc_msgSend(v3, "setGridCellSize:", 13.0, 13.0);

  id v4 = [(SBIconListGridLayoutConfiguration *)v2 folderIconVisualConfiguration];
  objc_msgSend(v4, "setGridCellSpacing:", 3.0, 3.0);

  -[SBIconListGridLayoutConfiguration setIconImageInfo:](v2, "setIconImageInfo:", 80.0, 80.0, 1.0, 20.0);
  v5 = [[SBIconListGridLayout alloc] initWithLayoutConfiguration:v2];

  return v5;
}

- (SBFolderIconImageCache)init
{
  v3 = [(id)objc_opt_class() defaultListLayout];
  id v4 = [SBHIconImageCache alloc];
  [v3 iconImageInfo];
  v5 = -[SBHIconImageCache initWithName:iconImageInfo:](v4, "initWithName:iconImageInfo:", @"default");
  id v6 = [(SBFolderIconImageCache *)self initWithListLayout:v3 iconImageCache:v5];

  return v6;
}

- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4FB1E20];
  id v9 = a4;
  id v10 = objc_msgSend(v8, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  id v11 = [(SBFolderIconImageCache *)self imageForPageAtIndex:a3 inFolderIcon:v9 imageAppearance:v10];

  return v11;
}

+ (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 compatibleWithTraitCollection:(id)a5 listLayout:(id)a6 gridCellImageProvider:(id)a7 pool:(id)a8
{
  uint64_t v14 = (void *)MEMORY[0x1E4FB1E20];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  objc_super v19 = objc_msgSend(v14, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  v20 = [a1 imageForPageAtIndex:a3 inFolderIcon:v18 imageAppearance:v19 listLayout:v17 gridCellImageProvider:v16 pool:v15];

  return v20;
}

+ (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5 listLayout:(id)a6 gridCellImageProvider:(id)a7 pool:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [v13 folder];
  objc_super v19 = [v18 listAtIndex:a3];
  double v20 = SBHIconListLayoutFolderIconGridCellSize(v15);
  uint64_t v22 = v21;
  [v15 iconImageInfo];
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = [v19 numberOfIcons];
  char v32 = objc_opt_respondsToSelector() & 1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __113__SBFolderIconImageCache_imageForPageAtIndex_inFolderIcon_imageAppearance_listLayout_gridCellImageProvider_pool___block_invoke;
  v39[3] = &unk_1E6AB02A0;
  v43 = v53;
  uint64_t v44 = v31;
  id v33 = v19;
  id v40 = v33;
  char v52 = v32;
  id v34 = v16;
  id v41 = v34;
  double v45 = v20;
  uint64_t v46 = v22;
  uint64_t v47 = v24;
  uint64_t v48 = v26;
  uint64_t v49 = v28;
  uint64_t v50 = v30;
  id v35 = v14;
  id v42 = v35;
  id v51 = a1;
  v36 = +[SBIconGridImage gridImageForLayout:v15 imageAppearance:v35 pool:v17 cellImageDrawBlock:v39];

  _Block_object_dispose(v53, 8);
  return v36;
}

BOOL __113__SBFolderIconImageCache_imageForPageAtIndex_inFolderIcon_imageAppearance_listLayout_gridCellImageProvider_pool___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t *a8)
{
  if ((unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + a2) >= *(void *)(a1 + 64)) {
    return 0;
  }
  id v15 = 0;
  while (1)
  {
    id v16 = v15;
    id v15 = objc_msgSend(*(id *)(a1 + 32), "iconAtIndex:");

    if (!*(unsigned char *)(a1 + 128) || ![*(id *)(a1 + 40) shouldSkipGridCellImageForIcon:v15]) {
      break;
    }
    if ((unint64_t)(++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + a2) >= *(void *)(a1 + 64))
    {
      BOOL v17 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v24 = 0;
  id v18 = *(void **)(a1 + 40);
  if (!v18) {
    id v18 = *(void **)(a1 + 120);
  }
  objc_super v19 = objc_msgSend(v18, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:imageAttributes:", v15, *(void *)(a1 + 48), &v24, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  double v20 = v19;
  BOOL v17 = v19 != 0;
  if (v19)
  {
    objc_msgSend(v19, "drawInRect:", a3, a4, a5, a6);
    char v21 = v24;
    int v22 = objc_msgSend(*(id *)(a1 + 120), "drawTreatmentForIcon:inRect:", v15, a3, a4, a5, a6);
    if (a8) {
      *a8 = v22 & 0xFFFFFFFD | (2 * (v21 & 1));
    }
  }

LABEL_14:
  return v17;
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6
{
  return (id)[a1 gridCellImageOfSize:a4 forIcon:a5 iconImageInfo:0 compatibleWithTraitCollection:a3.width imageAttributes:a3.height];
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6 imageAttributes:(unint64_t *)a7
{
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  double v16 = v7;
  double height = a3.height;
  double width = a3.width;
  double v20 = (void *)MEMORY[0x1E4FB1E20];
  id v21 = a4;
  int v22 = objc_msgSend(v20, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  uint64_t v23 = objc_msgSend(a1, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:imageAttributes:", v21, v22, a6, width, height, v16, v15, v14, v13);

  return v23;
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 imageAppearance:(id)a6
{
  return (id)[a1 gridCellImageOfSize:a4 forIcon:a5 iconImageInfo:0 imageAppearance:a3.width imageAttributes:a3.height];
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 imageAppearance:(id)a6 imageAttributes:(unint64_t *)a7
{
  double v12 = v10;
  double v13 = v9;
  double v14 = v8;
  double v15 = v7;
  double height = a3.height;
  double width = a3.width;
  id v19 = a4;
  double v20 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageAppearance:", a5);
  id v21 = objc_msgSend(v19, "iconImageWithInfo:traitCollection:options:", v20, 1, v15, v14, v13, v12);
  if (!v21)
  {
    if ([(id)objc_opt_class() hasIconImage])
    {
      id v21 = 0;
    }
    else
    {
      id v21 = +[SBHIconImageCache genericImageWithInfo:](SBHIconImageCache, "genericImageWithInfo:", v15, v14, v13, v12);
    }
  }
  int v22 = objc_msgSend(a1, "gridCellImageOfSize:forIconImage:", v21, width, height);

  return v22;
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIconImage:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__SBFolderIconImageCache_gridCellImageOfSize_forIconImage___block_invoke;
  v11[3] = &unk_1E6AB02C8;
  id v12 = v6;
  double v13 = width;
  double v14 = height;
  id v8 = v6;
  double v9 = [v7 imageWithActions:v11];

  return v9;
}

uint64_t __59__SBFolderIconImageCache_gridCellImageOfSize_forIconImage___block_invoke(double *a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)[a2 CGContext], kCGInterpolationHigh);
  v3 = (void *)*((void *)a1 + 4);
  double v4 = a1[5];
  double v5 = a1[6];
  return objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v4, v5);
}

- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4
{
  return [(SBFolderIconImageCache *)self gridCellImageForIcon:a3 imageAppearance:a4 imageAttributes:0];
}

- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4 imageAttributes:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = [(SBFolderIconImageCache *)self sharedCache];
  id v11 = [v10 gridCellImageForIcon:v9 imageAppearance:v8 imageAttributes:a5];

  return v11;
}

+ (BOOL)needsTreatmentForIcon:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isTimedOut] & 1) != 0 || objc_msgSend(v3, "progressState") != 0;

  return v4;
}

+ (BOOL)drawTreatmentForIcon:(id)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  int v8 = [a1 needsTreatmentForIcon:a3];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4FB1618] blackColor];
    double v10 = [v9 colorWithAlphaComponent:0.5];
    [v10 setFill];

    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    UIRectFillUsingBlendMode(v12, kCGBlendModeSourceAtop);
  }
  return v8;
}

- (void)rebuildImagesForFolderIcon:(id)a3
{
  id v4 = a3;
  double v5 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFolderIconImageCache rebuildImagesForFolderIcon:]();
  }

  id v6 = [(SBFolderIconImageCache *)self sharedCache];
  [v6 rebuildImagesForFolderIcon:v4];
}

- (void)rebuildAllCachedFolderImages
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_2(&dword_1D7F0A000, v0, v1, "rebuilding all images", v2, v3, v4, v5, v6);
}

- (void)purgeAllCachedFolderImages
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_2(&dword_1D7F0A000, v0, v1, "purging all images", v2, v3, v4, v5, v6);
}

- (void)informObserversOfUpdateForFolderIcon:(id)a3 imageAppearance:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NSMapTable *)self->_folderIconObservers objectForKey:v6];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
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
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) folderIconImageCache:self didUpdateImagesForFolderIcon:v6 imageAppearance:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)informObserversOfUpdateForAllFolderIcons
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_folderIconObservers;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        -[SBFolderIconImageCache informObserversOfUpdateForFolderIcon:imageAppearance:](self, "informObserversOfUpdateForFolderIcon:imageAppearance:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)numberOfCachedImages
{
  uint64_t v2 = [(SBFolderIconImageCache *)self sharedCache];
  unint64_t v3 = [v2 numberOfCachedImages];

  return v3;
}

- (unint64_t)numberOfCacheHits
{
  uint64_t v2 = [(SBFolderIconImageCache *)self sharedCache];
  unint64_t v3 = [v2 numberOfCacheHits];

  return v3;
}

- (unint64_t)numberOfCacheMisses
{
  uint64_t v2 = [(SBFolderIconImageCache *)self sharedCache];
  unint64_t v3 = [v2 numberOfCacheMisses];

  return v3;
}

- (void)performWhenCachingActivityCompletesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderIconImageCache *)self sharedCache];
  [v5 performWhenCachingActivityCompletesUsingBlock:v4];
}

- (id)activityDescription
{
  uint64_t v2 = [(SBFolderIconImageCache *)self sharedCache];
  unint64_t v3 = [v2 activityDescription];

  return v3;
}

- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6
{
  return [(SBFolderIconImageCache *)self gridCellImageOfSize:a4 forIcon:a5 iconImageInfo:0 compatibleWithTraitCollection:a3.width imageAttributes:a3.height];
}

- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6 imageAttributes:(unint64_t *)a7
{
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  double v16 = v7;
  double height = a3.height;
  double width = a3.width;
  double v20 = (void *)MEMORY[0x1E4FB1E20];
  id v21 = a4;
  int v22 = objc_msgSend(v20, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  uint64_t v23 = -[SBFolderIconImageCache gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:imageAttributes:](self, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:imageAttributes:", v21, v22, a6, width, height, v16, v15, v14, v13);

  return v23;
}

- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 imageAppearance:(id)a6
{
  return [(SBFolderIconImageCache *)self gridCellImageOfSize:a4 forIcon:a5 iconImageInfo:0 imageAppearance:a3.width imageAttributes:a3.height];
}

- (BOOL)shouldSkipGridCellImageForIcon:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_layoutHidingAssertions;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "referencesIcon:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)folderIconImageSharedCache:(id)a3 didUpdateImagesForFolderIcon:(id)a4 imageAppearance:(id)a5
{
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = [[SBHIconLayoutHidingAssertion alloc] initWithDelegate:self icons:v8 reason:v9 options:a5];
  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    long long v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    long long v13 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v12;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  [(NSHashTable *)layoutHidingAssertions addObject:v10];
  [(SBFolderIconImageCache *)self informObserversOfUpdateForAllFolderIcons];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v14 = self->_folderIconObservers;
  uint64_t v15 = [(NSMapTable *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        -[SBFolderIconImageCache informObserversOfUpdateForFolderIcon:imageAppearance:](self, "informObserversOfUpdateForFolderIcon:imageAppearance:", *(void *)(*((void *)&v20 + 1) + 8 * i), 0, (void)v20);
      }
      uint64_t v16 = [(NSMapTable *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  return v10;
}

- (void)layoutHidingAssertionDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 icons];
    int v7 = 134218498;
    id v8 = self;
    __int16 v9 = 2048;
    id v10 = v4;
    __int16 v11 = 2112;
    long long v12 = v6;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%p: icon hiding assertion %p did change icons %@", (uint8_t *)&v7, 0x20u);
  }
  if ([(NSHashTable *)self->_layoutHidingAssertions containsObject:v4]) {
    [(SBFolderIconImageCache *)self informObserversOfUpdateForAllFolderIcons];
  }
}

- (void)layoutHidingAssertionDidInvalidate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogFolderIconImageCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    id v8 = self;
    __int16 v9 = 2048;
    id v10 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%p: remove icon hiding assertion %p", (uint8_t *)&v7, 0x16u);
  }

  if ([(NSHashTable *)self->_layoutHidingAssertions containsObject:v4])
  {
    [(NSHashTable *)self->_layoutHidingAssertions removeObject:v4];
    if (![(NSHashTable *)self->_layoutHidingAssertions count])
    {
      layoutHidingAssertions = self->_layoutHidingAssertions;
      self->_layoutHidingAssertions = 0;
    }
    [(SBFolderIconImageCache *)self informObserversOfUpdateForAllFolderIcons];
  }
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_sharedCache, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_folderIconObservers, 0);
}

- (void)rebuildImagesForFolderIcon:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "rebuilding image for icon: %@", v2, v3, v4, v5, v6);
}

@end