@interface PXMessagesUISettings
+ (id)_assetCollectionItemProvider;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (id)transientProperties;
+ (void)_showStackBalloonViewWithNavigationController:(id)a3;
- (BOOL)applyRotationToFirstAndLast;
- (BOOL)aspectTilesEnabled;
- (BOOL)bestCropRectEnabled;
- (BOOL)enableDebugTapbacksGrid;
- (BOOL)enableDebugTapbacksStack;
- (BOOL)renderWithCA;
- (NSArray)horizontalOffsets;
- (NSString)horizontalOffsetString;
- (double)comfortableFitPercentage;
- (double)gridShadowAlpha;
- (double)gridShadowBlurRadius;
- (double)gridShadowXOffset;
- (double)gridShadowYOffset;
- (double)minItemSize;
- (double)normalizedPageWidth;
- (double)normalizedStackSizeTransform;
- (double)normalizedStackVerticalOffset;
- (double)pagingVelocityThreshold;
- (double)rotationAngle;
- (double)stackShadowAlpha;
- (double)stackShadowBlurRadius;
- (double)stackShadowYOffset;
- (double)transitionDuration;
- (double)transitionSpringDamping;
- (double)transitionSpringVelocity;
- (double)verticalContentInsets;
- (id)parentSettings;
- (int64_t)dataSourceType;
- (int64_t)maxColumns;
- (int64_t)minColumns;
- (int64_t)pagingBehavior;
- (unint64_t)stackedItemsCount;
- (unint64_t)transitionItemsCount;
- (void)setApplyRotationToFirstAndLast:(BOOL)a3;
- (void)setAspectTilesEnabled:(BOOL)a3;
- (void)setBestCropRectEnabled:(BOOL)a3;
- (void)setComfortableFitPercentage:(double)a3;
- (void)setDataSourceType:(int64_t)a3;
- (void)setDefaultValues;
- (void)setEnableDebugTapbacksGrid:(BOOL)a3;
- (void)setEnableDebugTapbacksStack:(BOOL)a3;
- (void)setGridShadowAlpha:(double)a3;
- (void)setGridShadowBlurRadius:(double)a3;
- (void)setGridShadowXOffset:(double)a3;
- (void)setGridShadowYOffset:(double)a3;
- (void)setHorizontalOffsetString:(id)a3;
- (void)setMaxColumns:(int64_t)a3;
- (void)setMinColumns:(int64_t)a3;
- (void)setMinItemSize:(double)a3;
- (void)setNormalizedPageWidth:(double)a3;
- (void)setNormalizedStackSizeTransform:(double)a3;
- (void)setNormalizedStackVerticalOffset:(double)a3;
- (void)setPagingBehavior:(int64_t)a3;
- (void)setPagingVelocityThreshold:(double)a3;
- (void)setRenderWithCA:(BOOL)a3;
- (void)setRotationAngle:(double)a3;
- (void)setStackShadowAlpha:(double)a3;
- (void)setStackShadowBlurRadius:(double)a3;
- (void)setStackShadowYOffset:(double)a3;
- (void)setStackedItemsCount:(unint64_t)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setTransitionItemsCount:(unint64_t)a3;
- (void)setTransitionSpringDamping:(double)a3;
- (void)setTransitionSpringVelocity:(double)a3;
- (void)setVerticalContentInsets:(double)a3;
@end

@implementation PXMessagesUISettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesUISettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXMessagesUISettings *)self setDataSourceType:0];
  [(PXMessagesUISettings *)self setStackedItemsCount:*MEMORY[0x1E4F8CF78]];
  [(PXMessagesUISettings *)self setNormalizedStackSizeTransform:*MEMORY[0x1E4F8CF70]];
  [(PXMessagesUISettings *)self setNormalizedStackVerticalOffset:*MEMORY[0x1E4F8CF88]];
  [(PXMessagesUISettings *)self setVerticalContentInsets:*MEMORY[0x1E4F8CF80]];
  [(PXMessagesUISettings *)self setEnableDebugTapbacksStack:0];
  [(PXMessagesUISettings *)self setRotationAngle:*MEMORY[0x1E4F8CF68]];
  [(PXMessagesUISettings *)self setApplyRotationToFirstAndLast:0];
  [(PXMessagesUISettings *)self setStackShadowYOffset:7.0];
  [(PXMessagesUISettings *)self setStackShadowBlurRadius:27.0];
  [(PXMessagesUISettings *)self setStackShadowAlpha:0.15];
  [(PXMessagesUISettings *)self setRenderWithCA:1];
  [(PXMessagesUISettings *)self setHorizontalOffsetString:@"20,14.5,10,9"];
  objc_storeStrong((id *)&self->_cachedHorizontalOffsets, (id)*MEMORY[0x1E4F8CF60]);
  [(PXMessagesUISettings *)self setNormalizedPageWidth:0.8];
  [(PXMessagesUISettings *)self setPagingBehavior:3];
  [(PXMessagesUISettings *)self setPagingVelocityThreshold:0.6];
  [(PXMessagesUISettings *)self setBestCropRectEnabled:0];
  [(PXMessagesUISettings *)self setAspectTilesEnabled:0];
  [(PXMessagesUISettings *)self setGridShadowXOffset:0.0];
  [(PXMessagesUISettings *)self setGridShadowYOffset:7.0];
  [(PXMessagesUISettings *)self setGridShadowBlurRadius:27.0];
  [(PXMessagesUISettings *)self setGridShadowAlpha:0.15];
  [(PXMessagesUISettings *)self setEnableDebugTapbacksGrid:0];
  [(PXMessagesUISettings *)self setMinItemSize:220.0];
  [(PXMessagesUISettings *)self setComfortableFitPercentage:0.85];
  [(PXMessagesUISettings *)self setMinColumns:1];
  [(PXMessagesUISettings *)self setMaxColumns:5];
  [(PXMessagesUISettings *)self setTransitionItemsCount:5];
  [(PXMessagesUISettings *)self setTransitionDuration:0.6];
  [(PXMessagesUISettings *)self setTransitionSpringDamping:0.8];
  [(PXMessagesUISettings *)self setTransitionSpringVelocity:0.0];
}

- (void)setVerticalContentInsets:(double)a3
{
  self->_verticalContentInsets = a3;
}

- (void)setTransitionSpringVelocity:(double)a3
{
  self->_transitionSpringVelocity = a3;
}

- (void)setTransitionSpringDamping:(double)a3
{
  self->_transitionSpringDamping = a3;
}

- (void)setTransitionItemsCount:(unint64_t)a3
{
  self->_transitionItemsCount = a3;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (void)setStackedItemsCount:(unint64_t)a3
{
  self->_stackedItemsCount = a3;
}

- (void)setStackShadowYOffset:(double)a3
{
  self->_stackShadowYOffset = a3;
}

- (void)setStackShadowBlurRadius:(double)a3
{
  self->_stackShadowBlurRadius = a3;
}

- (void)setStackShadowAlpha:(double)a3
{
  self->_stackShadowAlpha = a3;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (void)setRenderWithCA:(BOOL)a3
{
  self->_renderWithCA = a3;
}

- (void)setPagingVelocityThreshold:(double)a3
{
  self->_pagingVelocityThreshold = a3;
}

- (void)setPagingBehavior:(int64_t)a3
{
  self->_pagingBehavior = a3;
}

- (void)setNormalizedStackVerticalOffset:(double)a3
{
  self->_normalizedStackVerticalOffset = a3;
}

- (void)setNormalizedStackSizeTransform:(double)a3
{
  self->_normalizedStackSizeTransform = a3;
}

- (void)setNormalizedPageWidth:(double)a3
{
  self->_normalizedPageWidth = a3;
}

- (void)setMinItemSize:(double)a3
{
  self->_minItemSize = a3;
}

- (void)setMinColumns:(int64_t)a3
{
  self->_minColumns = a3;
}

- (void)setMaxColumns:(int64_t)a3
{
  self->_maxColumns = a3;
}

- (void)setHorizontalOffsetString:(id)a3
{
}

- (void)setGridShadowYOffset:(double)a3
{
  self->_gridShadowYOffset = a3;
}

- (void)setGridShadowXOffset:(double)a3
{
  self->_gridShadowXOffset = a3;
}

- (void)setGridShadowBlurRadius:(double)a3
{
  self->_gridShadowBlurRadius = a3;
}

- (void)setGridShadowAlpha:(double)a3
{
  self->_gridShadowAlpha = a3;
}

- (void)setEnableDebugTapbacksStack:(BOOL)a3
{
  self->_enableDebugTapbacksStack = a3;
}

- (void)setEnableDebugTapbacksGrid:(BOOL)a3
{
  self->_enableDebugTapbacksGrid = a3;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void)setComfortableFitPercentage:(double)a3
{
  self->_comfortableFitPercentage = a3;
}

- (void)setBestCropRectEnabled:(BOOL)a3
{
  self->_bestCropRectEnabled = a3;
}

- (void)setAspectTilesEnabled:(BOOL)a3
{
  self->_aspectTilesEnabled = a3;
}

- (void)setApplyRotationToFirstAndLast:(BOOL)a3
{
  self->_applyRotationToFirstAndLast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalOffsetString, 0);
  objc_storeStrong((id *)&self->_cachedHorizontalOffsets, 0);
}

- (double)transitionSpringVelocity
{
  return self->_transitionSpringVelocity;
}

- (double)transitionSpringDamping
{
  return self->_transitionSpringDamping;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (unint64_t)transitionItemsCount
{
  return self->_transitionItemsCount;
}

- (int64_t)maxColumns
{
  return self->_maxColumns;
}

- (int64_t)minColumns
{
  return self->_minColumns;
}

- (double)comfortableFitPercentage
{
  return self->_comfortableFitPercentage;
}

- (double)minItemSize
{
  return self->_minItemSize;
}

- (BOOL)enableDebugTapbacksGrid
{
  return self->_enableDebugTapbacksGrid;
}

- (double)gridShadowAlpha
{
  return self->_gridShadowAlpha;
}

- (double)gridShadowBlurRadius
{
  return self->_gridShadowBlurRadius;
}

- (double)gridShadowYOffset
{
  return self->_gridShadowYOffset;
}

- (double)gridShadowXOffset
{
  return self->_gridShadowXOffset;
}

- (BOOL)aspectTilesEnabled
{
  return self->_aspectTilesEnabled;
}

- (BOOL)bestCropRectEnabled
{
  return self->_bestCropRectEnabled;
}

- (double)pagingVelocityThreshold
{
  return self->_pagingVelocityThreshold;
}

- (int64_t)pagingBehavior
{
  return self->_pagingBehavior;
}

- (double)normalizedPageWidth
{
  return self->_normalizedPageWidth;
}

- (NSString)horizontalOffsetString
{
  return self->_horizontalOffsetString;
}

- (BOOL)renderWithCA
{
  return self->_renderWithCA;
}

- (double)stackShadowAlpha
{
  return self->_stackShadowAlpha;
}

- (double)stackShadowBlurRadius
{
  return self->_stackShadowBlurRadius;
}

- (double)stackShadowYOffset
{
  return self->_stackShadowYOffset;
}

- (BOOL)applyRotationToFirstAndLast
{
  return self->_applyRotationToFirstAndLast;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (BOOL)enableDebugTapbacksStack
{
  return self->_enableDebugTapbacksStack;
}

- (double)verticalContentInsets
{
  return self->_verticalContentInsets;
}

- (double)normalizedStackVerticalOffset
{
  return self->_normalizedStackVerticalOffset;
}

- (double)normalizedStackSizeTransform
{
  return self->_normalizedStackSizeTransform;
}

- (unint64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (NSArray)horizontalOffsets
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  cachedHorizontalOffsets = self->_cachedHorizontalOffsets;
  if (!cachedHorizontalOffsets)
  {
    v18 = [(PXMessagesUISettings *)self horizontalOffsetString];
    v4 = [v18 componentsSeparatedByString:@","];
    v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) stringByTrimmingCharactersInSet:v5];
          [v12 doubleValue];
          double v14 = v13;

          v15 = [NSNumber numberWithDouble:v14 / 300.0];
          [(NSArray *)v6 addObject:v15];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    v16 = self->_cachedHorizontalOffsets;
    self->_cachedHorizontalOffsets = v6;

    cachedHorizontalOffsets = self->_cachedHorizontalOffsets;
  }
  return cachedHorizontalOffsets;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXMessagesUISettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken != -1) {
    dispatch_once(&transientProperties_onceToken, block);
  }
  v2 = (void *)transientProperties_transientProperties;
  return v2;
}

void __43__PXMessagesUISettings_transientProperties__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXMessagesUISettings;
  v1 = objc_msgSendSuper2(&v5, sel_transientProperties);
  v2 = NSStringFromSelector(sel_horizontalOffsets);
  uint64_t v3 = [v1 setByAddingObject:v2];
  v4 = (void *)transientProperties_transientProperties;
  transientProperties_transientProperties = v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2002);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __38__PXMessagesUISettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 messagesUISettings];
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
}

+ (void)_showStackBalloonViewWithNavigationController:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [a1 sharedInstance];
  uint64_t v6 = [v5 dataSourceType];
  if (v6 == 1)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v18 = [v17 pathManager];
    id v27 = 0;
    long long v19 = [v18 temporaryFileBackedDebugDirectoryCreateIfNeeded:0 error:&v27];
    id v20 = v27;

    if (v19)
    {
      long long v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19];
      double v14 = +[PXFileBackedAssetsDataSourceManager fileBackedDataSourceManagerWithDirectory:v21];

      v16 = objc_alloc_init(PXFileBackedUIMediaProvider);
      long long v22 = [objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v14];
      v23 = [[PXFileBackedAssetActionManager alloc] initWithSelectionManager:v22];
    }
    else
    {
      long long v22 = PLUIGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v20;
        _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "Unable to get file backed directory for app library with error: %@", buf, 0xCu);
      }
      v23 = 0;
      v16 = 0;
      double v14 = 0;
    }

    if (!v14) {
      goto LABEL_17;
    }
  }
  else
  {
    if (v6)
    {
      double v14 = 0;
      v16 = 0;
      v23 = 0;
LABEL_17:
      uint64_t v24 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"No PHAssetCollection found" message:@"Please navigate to a view of a valid asset collection in the Photos app UI" preferredStyle:1];
      v25 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
      [(PXMessagesStackBalloonViewController *)v24 addAction:v25];

      [v4 presentViewController:v24 animated:1 completion:0];
      goto LABEL_18;
    }
    id v7 = [a1 _assetCollectionItemProvider];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 itemForIdentifier:@"PXDiagnosticsItemIdentifierAssetCollection"];
      uint64_t v10 = (void *)MEMORY[0x1E4F38EB8];
      uint64_t v11 = [v9 photoLibrary];
      v12 = [v11 librarySpecificFetchOptions];
      double v13 = [v10 fetchAssetsInAssetCollection:v9 options:v12];

      LOBYTE(v26) = 0;
      double v14 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:v9 existingAssetsFetchResult:v13 existingKeyAssetsFetchResult:0 fetchPropertySets:0 basePredicate:0 options:0 ignoreSharedLibraryFilters:v26];
      v15 = [v9 photoLibrary];
      v16 = +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:v15];
    }
    else
    {
      v16 = 0;
      double v14 = 0;
    }

    v23 = 0;
    if (!v14) {
      goto LABEL_17;
    }
  }
  if (!v16) {
    goto LABEL_17;
  }
  uint64_t v24 = [[PXMessagesStackBalloonViewController alloc] initWithDataSourceManager:v14 mediaProvider:v16];
  [(PXMessagesStackBalloonViewController *)v24 setAssetActionManager:v23];
  [v4 pushViewController:v24 animated:1];
LABEL_18:
}

+ (id)_assetCollectionItemProvider
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = +[PXDiagnosticsController sharedController];
  uint64_t v3 = [v2 currentItemProviders];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierAssetCollection", (void)v12))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)settingsControllerModule
{
  v166[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F941A8];
  uint64_t v3 = (void *)MEMORY[0x1E4F94108];
  id v4 = NSStringFromSelector(sel_dataSourceType);
  uint64_t v5 = [v3 rowWithTitle:@"Data Source Type" valueKeyPath:v4];
  uint64_t v6 = [v5 possibleValues:&unk_1F02D3310 titles:&unk_1F02D3328];
  v166[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:1];
  v98 = [v2 sectionWithRows:v7 title:@"Data Source"];

  v96 = (void *)MEMORY[0x1E4F941A8];
  uint64_t v8 = (void *)MEMORY[0x1E4F941D8];
  v151 = NSStringFromSelector(sel_stackedItemsCount);
  v147 = [v8 rowWithTitle:@"Stacked Items Count" valueKeyPath:v151];
  v143 = [v147 minValue:1.0 maxValue:5.0];
  v140 = objc_msgSend(v143, "px_increment:", 1.0);
  v165[0] = v140;
  uint64_t v9 = (void *)MEMORY[0x1E4F941D8];
  v137 = NSStringFromSelector(sel_normalizedStackSizeTransform);
  v134 = [v9 rowWithTitle:@"Size Transform" valueKeyPath:v137];
  v131 = [v134 minValue:0.1 maxValue:1.0];
  v127 = objc_msgSend(v131, "px_increment:", 0.05);
  v165[1] = v127;
  id v10 = (void *)MEMORY[0x1E4F941D8];
  v125 = NSStringFromSelector(sel_normalizedStackVerticalOffset);
  v123 = [v10 rowWithTitle:@"Vertical Offset" valueKeyPath:v125];
  v121 = [v123 minValue:0.0 maxValue:1.0];
  v118 = objc_msgSend(v121, "px_increment:", 0.05);
  v165[2] = v118;
  uint64_t v11 = (void *)MEMORY[0x1E4F941D8];
  v117 = NSStringFromSelector(sel_verticalContentInsets);
  v116 = [v11 rowWithTitle:@"Content Insets" valueKeyPath:v117];
  v115 = [v116 minValue:0.0 maxValue:100.0];
  v114 = objc_msgSend(v115, "px_increment:", 1.0);
  v165[3] = v114;
  long long v12 = (void *)MEMORY[0x1E4F941D8];
  v113 = NSStringFromSelector(sel_rotationAngle);
  v112 = [v12 rowWithTitle:@"Rotation Angle" valueKeyPath:v113];
  v111 = [v112 minValue:0.0 maxValue:45.0];
  v110 = objc_msgSend(v111, "px_increment:", 1.0);
  v165[4] = v110;
  long long v13 = (void *)MEMORY[0x1E4F941F0];
  v109 = NSStringFromSelector(sel_applyRotationToFirstAndLast);
  v108 = [v13 rowWithTitle:@"Rotate First/Last" valueKeyPath:v109];
  v165[5] = v108;
  long long v14 = (void *)MEMORY[0x1E4F941F0];
  v107 = NSStringFromSelector(sel_enableDebugTapbacksStack);
  v106 = [v14 rowWithTitle:@"Debug Tapbacks" valueKeyPath:v107];
  v165[6] = v106;
  long long v15 = (void *)MEMORY[0x1E4F94158];
  v105 = NSStringFromSelector(sel_horizontalOffsetString);
  v104 = [v15 rowWithTitle:@"Horizontal Offset" valueKeyPath:v105];
  v165[7] = v104;
  v16 = (void *)MEMORY[0x1E4F941D8];
  v103 = NSStringFromSelector(sel_stackShadowYOffset);
  v102 = [v16 rowWithTitle:@"Shadow Y" valueKeyPath:v103];
  v101 = [v102 minValue:0.0 maxValue:20.0];
  v100 = objc_msgSend(v101, "px_increment:", 1.0);
  v165[8] = v100;
  uint64_t v17 = (void *)MEMORY[0x1E4F941D8];
  v99 = NSStringFromSelector(sel_stackShadowBlurRadius);
  v18 = [v17 rowWithTitle:@"Shadow Radius" valueKeyPath:v99];
  long long v19 = [v18 minValue:0.0 maxValue:50.0];
  id v20 = objc_msgSend(v19, "px_increment:", 1.0);
  v165[9] = v20;
  long long v21 = (void *)MEMORY[0x1E4F941D8];
  long long v22 = NSStringFromSelector(sel_stackShadowAlpha);
  v23 = [v21 rowWithTitle:@"Shadow Alpha" valueKeyPath:v22];
  uint64_t v24 = [v23 minValue:0.0 maxValue:1.0];
  v25 = objc_msgSend(v24, "px_increment:", 0.05);
  v165[10] = v25;
  uint64_t v26 = (void *)MEMORY[0x1E4F941F0];
  id v27 = NSStringFromSelector(sel_renderWithCA);
  v28 = [v26 rowWithTitle:@"Use CoreAnimation" valueKeyPath:v27];
  v165[11] = v28;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:12];
  v97 = [v96 sectionWithRows:v29 title:@"Static Params"];

  v144 = (void *)MEMORY[0x1E4F941A8];
  uint64_t v30 = (void *)MEMORY[0x1E4F941D8];
  v152 = NSStringFromSelector(sel_normalizedPageWidth);
  v148 = [v30 rowWithTitle:@"Page Width" valueKeyPath:v152];
  v31 = [v148 minValue:0.1 maxValue:2.0];
  v32 = objc_msgSend(v31, "px_increment:", 0.1);
  v164[0] = v32;
  v33 = (void *)MEMORY[0x1E4F94108];
  v34 = NSStringFromSelector(sel_pagingBehavior);
  v35 = [v33 rowWithTitle:@"Page Settling" valueKeyPath:v34];
  v36 = [v35 possibleValues:&unk_1F02D3340 titles:&unk_1F02D3358];
  v164[1] = v36;
  v37 = (void *)MEMORY[0x1E4F941D8];
  v38 = NSStringFromSelector(sel_pagingVelocityThreshold);
  v39 = [v37 rowWithTitle:@"Paging Velocity" valueKeyPath:v38];
  v40 = [v39 minValue:0.1 maxValue:1.0];
  v41 = objc_msgSend(v40, "px_increment:", 0.05);
  v164[2] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:3];
  v124 = [v144 sectionWithRows:v42 title:@"Dynamic Params"];

  v43 = (void *)MEMORY[0x1E4F941A8];
  v44 = (void *)MEMORY[0x1E4F941F0];
  v45 = NSStringFromSelector(sel_aspectTilesEnabled);
  v46 = [v44 rowWithTitle:@"Aspect tiles" valueKeyPath:v45];
  v163[0] = v46;
  v47 = (void *)MEMORY[0x1E4F941F0];
  v48 = NSStringFromSelector(sel_bestCropRectEnabled);
  v49 = [v47 rowWithTitle:@"Smart Crop" valueKeyPath:v48];
  v163[1] = v49;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:2];
  v122 = [v43 sectionWithRows:v50 title:@"Content Display"];

  v119 = (void *)MEMORY[0x1E4F941A8];
  v51 = (void *)MEMORY[0x1E4F941D8];
  v153 = NSStringFromSelector(sel_gridShadowXOffset);
  v149 = [v51 rowWithTitle:@"Shadow X" valueKeyPath:v153];
  v145 = [v149 minValue:-20.0 maxValue:20.0];
  v141 = objc_msgSend(v145, "px_increment:", 1.0);
  v162[0] = v141;
  v52 = (void *)MEMORY[0x1E4F941D8];
  v138 = NSStringFromSelector(sel_gridShadowYOffset);
  v135 = [v52 rowWithTitle:@"Shadow Y" valueKeyPath:v138];
  v132 = [v135 minValue:-20.0 maxValue:20.0];
  v128 = objc_msgSend(v132, "px_increment:", 1.0);
  v162[1] = v128;
  v53 = (void *)MEMORY[0x1E4F941D8];
  v126 = NSStringFromSelector(sel_gridShadowBlurRadius);
  v54 = [v53 rowWithTitle:@"Shadow Radius" valueKeyPath:v126];
  v55 = [v54 minValue:0.0 maxValue:50.0];
  v56 = objc_msgSend(v55, "px_increment:", 1.0);
  v162[2] = v56;
  v57 = (void *)MEMORY[0x1E4F941D8];
  v58 = NSStringFromSelector(sel_gridShadowAlpha);
  v59 = [v57 rowWithTitle:@"Shadow Alpha" valueKeyPath:v58];
  v60 = [v59 minValue:0.0 maxValue:1.0];
  v61 = objc_msgSend(v60, "px_increment:", 0.05);
  v162[3] = v61;
  v62 = (void *)MEMORY[0x1E4F941F0];
  v63 = NSStringFromSelector(sel_enableDebugTapbacksGrid);
  v64 = [v62 rowWithTitle:@"Debug Tapbacks" valueKeyPath:v63];
  v162[4] = v64;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:5];
  v120 = [v119 sectionWithRows:v65 title:@"Grid"];

  v129 = (void *)MEMORY[0x1E4F94160];
  v66 = (void *)MEMORY[0x1E4F941D8];
  v154 = NSStringFromSelector(sel_transitionItemsCount);
  v150 = [v66 rowWithTitle:@"Items Count" valueKeyPath:v154];
  v146 = [v150 minValue:0.0 maxValue:4.0];
  v142 = objc_msgSend(v146, "px_increment:", 1.0);
  v161[0] = v142;
  v67 = (void *)MEMORY[0x1E4F941D8];
  v139 = NSStringFromSelector(sel_transitionDuration);
  v136 = [v67 rowWithTitle:@"Duration" valueKeyPath:v139];
  v133 = [v136 minValue:0.3 maxValue:4.0];
  v68 = objc_msgSend(v133, "px_increment:", 0.1);
  v161[1] = v68;
  v69 = (void *)MEMORY[0x1E4F941D8];
  v70 = NSStringFromSelector(sel_transitionSpringDamping);
  v71 = [v69 rowWithTitle:@"Spring Damping" valueKeyPath:v70];
  v72 = [v71 minValue:0.0 maxValue:1.0];
  v73 = objc_msgSend(v72, "px_increment:", 0.1);
  v161[2] = v73;
  v74 = (void *)MEMORY[0x1E4F941D8];
  v75 = NSStringFromSelector(sel_transitionSpringVelocity);
  v76 = [v74 rowWithTitle:@"Spring Velocity" valueKeyPath:v75];
  v77 = [v76 minValue:0.0 maxValue:1.0];
  v78 = objc_msgSend(v77, "px_increment:", 0.1);
  v161[3] = v78;
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:4];
  v130 = [v129 sectionWithRows:v79 title:@"Transition"];

  objc_initWeak(&location, a1);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PXMessagesUISettings_UI__settingsControllerModule__block_invoke;
  aBlock[3] = &unk_1E5DB0190;
  objc_copyWeak(&v156, &location);
  v80 = _Block_copy(aBlock);
  v81 = (void *)MEMORY[0x1E4F94160];
  v82 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Show Stack", v80);
  v160 = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v160 count:1];
  v84 = [v81 sectionWithRows:v83];

  v85 = (void *)MEMORY[0x1E4F94160];
  v86 = (void *)MEMORY[0x1E4F940F8];
  v87 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v88 = [v86 rowWithTitle:@"Restore Defaults" action:v87];
  v159 = v88;
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v159 count:1];
  v90 = [v85 sectionWithRows:v89];

  v91 = (void *)MEMORY[0x1E4F94160];
  v158[0] = v84;
  v158[1] = v98;
  v158[2] = v97;
  v158[3] = v124;
  v158[4] = v122;
  v158[5] = v120;
  v158[6] = v130;
  v158[7] = v90;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:8];
  v93 = [v91 moduleWithTitle:@"MessagesUI" contents:v92];

  objc_destroyWeak(&v156);
  objc_destroyWeak(&location);

  return v93;
}

void __52__PXMessagesUISettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _showStackBalloonViewWithNavigationController:v3];
}

@end