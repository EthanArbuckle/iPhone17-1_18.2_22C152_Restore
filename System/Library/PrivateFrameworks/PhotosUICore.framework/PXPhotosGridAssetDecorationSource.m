@interface PXPhotosGridAssetDecorationSource
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)assetBackgroundCornerRadiusForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (BOOL)durationAlwaysHidden;
- (BOOL)enableDebugBadgeColors;
- (BOOL)enableDebugDecoration;
- (BOOL)enableSpatialBadges;
- (BOOL)hasTapbacksForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (BOOL)hidesInteractiveFavoriteBadges;
- (BOOL)isInSelectMode;
- (BOOL)isSelectionLimitReached;
- (BOOL)isSharedLibraryBadgeEnabled;
- (BOOL)isStacksBadgeEnabled;
- (BOOL)shouldShowSavedToLibraryBadgeForAsset:(id)a3 inLayout:(id)a4;
- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3;
- (BOOL)wantsAssetIndexBadge;
- (BOOL)wantsBackgroundForZeroInset;
- (BOOL)wantsCaptionDecorationsInLayout:(id)a3;
- (BOOL)wantsDimmedSelectionStyle;
- (BOOL)wantsFileSizeBadge;
- (BOOL)wantsFileSizeBadgesInLayout:(id)a3;
- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3;
- (BOOL)wantsNumberedSelectionStyle;
- (BOOL)wantsSharedLibraryDecorations;
- (BOOL)wantsStacksDecorations;
- (BOOL)wantsTapbackDecorationInLayout:(id)a3;
- (CGSize)expectedInsetsForItem:(int64_t)a3;
- (Class)decorationViewClass;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSIndexSet)itemsWithCoveredBottomTrailingCorner;
- (NSSet)draggedAssetReferences;
- (PXAssetImportStatusManager)assetImportStatusManager;
- (PXAssetsDataSource)dataSource;
- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5;
- (PXGGridLayout)decoratedGridLayout;
- (PXGItemsLayout)decoratedItemsLayout;
- (PXGLayout)decoratedLayout;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXPhotosCustomViewDecorationDataSource)decorationDataSource;
- (PXPhotosGridAssetDecorationSource)init;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXTapbackStatusManager)tapbackStatusManager;
- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)_displayAssetForItem:(int64_t)a3;
- (id)_spriteIndexesForItems:(id)a3 inLayout:(id)a4;
- (id)badgesModifier;
- (id)debugDecorationAtSpriteIndex:(unsigned int)a3 asset:(id)a4 inLayout:(id)a5;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)draggingSpriteIndexesInLayout:(id)a3;
- (id)loadStatusForAsset:(id)a3 atSpriteIndex:(unsigned int)a4 inLayout:(id)a5;
- (id)selectedSpriteIndexesInLayout:(id)a3;
- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)focusRingTypeInLayout:(id)a3;
- (int64_t)interItemSpacingThresholdForExteriorFocusRingSelection;
- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)section;
- (int64_t)selectionDecorationStyleInLayout:(id)a3;
- (unint64_t)assetBackgroundStyleForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)forbiddenBadges;
- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3;
- (void)_invalidateDragDecoration;
- (void)_invalidateProgressDecoration;
- (void)_invalidateSharedLibraryDecoration;
- (void)_invalidateTapbackDecoration;
- (void)_updateDragDecoration;
- (void)dealloc;
- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5;
- (void)observeIsInCloud:(BOOL)a3 forDisplayAsset:(id)a4;
- (void)preferencesDidChange;
- (void)setAssetImportStatusManager:(id)a3;
- (void)setBadgesModifier:(id)a3;
- (void)setDataSource:(id)a3 section:(int64_t)a4;
- (void)setDecoratedLayout:(id)a3;
- (void)setDecorationDataSource:(id)a3;
- (void)setDecorationViewClass:(Class)a3;
- (void)setDraggedAssetReferences:(id)a3;
- (void)setDurationAlwaysHidden:(BOOL)a3;
- (void)setEnableDebugBadgeColors:(BOOL)a3;
- (void)setEnableDebugDecoration:(BOOL)a3;
- (void)setEnableSpatialBadges:(BOOL)a3;
- (void)setForbiddenBadges:(unint64_t)a3;
- (void)setHidesInteractiveFavoriteBadges:(BOOL)a3;
- (void)setInterItemSpacingThresholdForExteriorFocusRingSelection:(int64_t)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setItemsWithCoveredBottomTrailingCorner:(id)a3;
- (void)setLoadingStatusManager:(id)a3;
- (void)setSelectionLimitReached:(BOOL)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setTapbackStatusManager:(id)a3;
- (void)setWantsAssetIndexBadge:(BOOL)a3;
- (void)setWantsDimmedSelectionStyle:(BOOL)a3;
- (void)setWantsFileSizeBadge:(BOOL)a3;
- (void)setWantsNumberedSelectionStyle:(BOOL)a3;
- (void)setWantsSharedLibraryDecorations:(BOOL)a3;
- (void)setWantsStacksDecorations:(BOOL)a3;
- (void)update;
@end

@implementation PXPhotosGridAssetDecorationSource

- (id)loadStatusForAsset:(id)a3 atSpriteIndex:(unsigned int)a4 inLayout:(id)a5
{
  self->_isGettingLoadStatus = 1;
  id v6 = a3;
  v7 = [(PXPhotosGridAssetDecorationSource *)self loadingStatusManager];
  v8 = [v6 uuid];

  v9 = [v7 loadingStatusForItemIdentifier:v8];

  self->_isGettingLoadStatus = 0;
  return v9;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5
{
  id v11 = a4;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXPhotosGridAssetDecorationSource_assetDecorationInfoForAsset_atSpriteIndex_inLayout___block_invoke;
  aBlock[3] = &unk_1E5DB2248;
  id v13 = v12;
  v40 = self;
  SEL v41 = a3;
  id v39 = v13;
  unsigned int v42 = a5;
  v14 = (uint64_t (**)(void))_Block_copy(aBlock);
  BOOL v15 = [(PXPhotosGridAssetDecorationSource *)self wantsFileSizeBadge];
  BOOL v16 = [(PXPhotosGridAssetDecorationSource *)self durationAlwaysHidden];
  BOOL v17 = [(PXPhotosGridAssetDecorationSource *)self enableSpatialBadges];
  long long v30 = 0u;
  long long v37 = 0u;
  badgeManager = self->_badgeManager;
  if (badgeManager)
  {
    uint64_t v19 = 2;
    if (!v15) {
      uint64_t v19 = 0;
    }
    if (v16) {
      v19 |= 4uLL;
    }
    if (v17) {
      uint64_t v20 = v19 | 8;
    }
    else {
      uint64_t v20 = v19;
    }
    -[PXAssetBadgeManager badgeInfoForAsset:inCollection:options:](badgeManager, "badgeInfoForAsset:inCollection:options:", v11, 0, v20, 0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    assetUUIDsInCloud = self->_assetUUIDsInCloud;
    v22 = objc_msgSend(v11, "uuid", (void)v30);
    LODWORD(assetUUIDsInCloud) = [(NSMutableSet *)assetUUIDsInCloud containsObject:v22];

    if (assetUUIDsInCloud) {
      *(void *)&long long v30 = v30 | 0x20;
    }
  }
  if (-[PXPhotosGridAssetDecorationSource shouldShowSavedToLibraryBadgeForAsset:inLayout:](self, "shouldShowSavedToLibraryBadgeForAsset:inLayout:", v11, v13, (void)v30))
  {
    v31 |= 0x200000000uLL;
  }
  if ([(PXPhotosGridAssetDecorationSource *)self wantsSharedLibraryDecorations]
    && ([(PXPhotosGridAssetDecorationSource *)self isInSelectMode] && !PLIsPhotoPicker()
     || [(PXPhotosGridAssetDecorationSource *)self isSharedLibraryBadgeEnabled])
    && [v11 isInSharedLibrary])
  {
    v32 |= 0x2000000000uLL;
  }
  if ([(PXPhotosGridAssetDecorationSource *)self wantsAssetIndexBadge])
  {
    uint64_t v23 = v14[2](v14);
    uint64_t v24 = v33 | 0x200000000000;
    *(void *)&long long v37 = v23 + 1;
  }
  else
  {
    uint64_t v24 = v33;
  }
  unint64_t v34 = v24 & ~self->_forbiddenBadges;
  if (self->_forceBadgesOnAllAssets)
  {
    double v29 = 0.0;
    if (0.0 < 1.0) {
      double v29 = 1.0;
    }
    *((double *)&v30 + 1) = v29;
  }
  else if ([(PXPhotosGridAssetDecorationSource *)self durationAlwaysHidden])
  {
    *((void *)&v30 + 1) = 0;
  }
  if ([(PXPhotosGridAssetDecorationSource *)self enableDebugBadgeColors]) {
    v35 |= 0x60000000uLL;
  }
  if ([(NSIndexSet *)self->_itemsWithCoveredBottomTrailingCorner count]
    && [(NSIndexSet *)self->_itemsWithCoveredBottomTrailingCorner containsIndex:v14[2](v14)])
  {
    *(void *)&long long v30 = v30 & 0xFFFFFFFFFFFFFFDDLL;
    *((void *)&v30 + 1) = 0;
  }
  v25 = [(PXPhotosGridAssetDecorationSource *)self badgesModifier];

  if (v25)
  {
    v26 = [(PXPhotosGridAssetDecorationSource *)self badgesModifier];
    unint64_t v27 = ((uint64_t (**)(void, id, unint64_t))v26)[2](v26, v11, v36);
  }
  else
  {
    unint64_t v27 = v36;
  }
  retstr->var0 = v27;
  retstr->var1 = *((double *)&v30 + 1);
  *(_OWORD *)&retstr->var2 = v37;

  return result;
}

- (BOOL)durationAlwaysHidden
{
  return self->_durationAlwaysHidden;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (BOOL)wantsSharedLibraryDecorations
{
  return self->_wantsSharedLibraryDecorations;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (BOOL)shouldShowSavedToLibraryBadgeForAsset:(id)a3 inLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self->_assetImportStatusManager
    && [(PXPhotosGridAssetDecorationSource *)self isInSelectMode]
    && [(PXAssetImportStatusManager *)self->_assetImportStatusManager importStateForAsset:v6] == 2;

  return v8;
}

- (BOOL)isSharedLibraryBadgeEnabled
{
  cachedSharedLibraryBadgeEnabledSettingValue = self->_cachedSharedLibraryBadgeEnabledSettingValue;
  if (!cachedSharedLibraryBadgeEnabledSettingValue)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SharedLibraryBadgingEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v5 = AppBooleanValue == 0;
    }
    else {
      BOOL v5 = 0;
    }
    uint64_t v6 = !v5;
    id v7 = [NSNumber numberWithBool:v6];
    BOOL v8 = self->_cachedSharedLibraryBadgeEnabledSettingValue;
    self->_cachedSharedLibraryBadgeEnabledSettingValue = v7;

    cachedSharedLibraryBadgeEnabledSettingValue = self->_cachedSharedLibraryBadgeEnabledSettingValue;
  }
  return [(NSNumber *)cachedSharedLibraryBadgeEnabledSettingValue BOOLValue];
}

- (BOOL)enableSpatialBadges
{
  return self->_enableSpatialBadges;
}

- (BOOL)enableDebugBadgeColors
{
  return self->_enableDebugBadgeColors;
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (id)draggingSpriteIndexesInLayout:(id)a3
{
  id v4 = a3;
  [(PXPhotosGridAssetDecorationSource *)self update];
  BOOL v5 = [(PXPhotosGridAssetDecorationSource *)self _spriteIndexesForItems:self->_draggedItems inLayout:v4];

  return v5;
}

- (void)update
{
  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v5 = [NSString stringWithUTF8String:"-[PXPhotosGridAssetDecorationSource update]"];
      [v4 handleFailureInFunction:v5, @"PXPhotosGridAssetDecorationSource.m", 333, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if (needsUpdate)
    {
      self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXPhotosGridAssetDecorationSource *)self _updateDragDecoration];
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosGridAssetDecorationSource update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosGridAssetDecorationSource.m", 337, @"still needing to update %lu after update pass", self->_updateFlags.needsUpdate);
    }
  }
}

- (id)_spriteIndexesForItems:(id)a3 inLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 spriteIndexesForItems:v5];
    }
    else
    {
      id v7 = v5;
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CGSize)expectedInsetsForItem:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (unint64_t)assetBackgroundStyleForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v16 = (objc_class *)objc_opt_class();
    BOOL v15 = NSStringFromClass(v16);
    BOOL v17 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 708, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v15, v17 object file lineNumber description];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    BOOL v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 708, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v15 object file lineNumber description];
  }

LABEL_3:
  uint64_t v8 = [v7 decoratingTypeForSpriteIndex:v4];
  if (v8 == 3)
  {
    tapbackStatusManager = self;
    goto LABEL_8;
  }
  if (v8 != 7)
  {
LABEL_12:
    Class v10 = 0;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    Class v10 = NSClassFromString(&cfstr_Ckmediaobjectt.isa);
    if (!v10) {
      goto LABEL_13;
    }
    if (objc_opt_isKindOfClass())
    {
      Class v10 = NSClassFromString(&cfstr_Ckphotogridtap.isa);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  tapbackStatusManager = self->_tapbackStatusManager;
LABEL_8:
  Class v10 = (Class)[tapbackStatusManager decorationViewClass];
LABEL_13:
  id v11 = v10;

  return v11;
}

- (Class)decorationViewClass
{
  return self->_decorationViewClass;
}

- (void)observeIsInCloud:(BOOL)a3 forDisplayAsset:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PXPhotosGridAssetDecorationSource_observeIsInCloud_forDisplayAsset___block_invoke;
  block[3] = &unk_1E5DD21E8;
  id v9 = v6;
  Class v10 = self;
  BOOL v11 = a3;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)setSelectionSnapshot:(id)a3
{
  id v5 = (PXSelectionSnapshot *)a3;
  if (self->_selectionSnapshot != v5)
  {
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    [(PXPhotosGridAssetDecorationSource *)self setSelectionLimitReached:[(PXSelectionSnapshot *)v5 isSelectionLimitReached]];
    id v6 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v6 invalidateDecoration];

    id v7 = [off_1E5DA9658 sharedInstance];
    int v8 = [v7 enableTungstenKeyboardNavigation];

    if (v8)
    {
      id v9 = [(PXPhotosGridAssetDecorationSource *)self decoratedItemsLayout];
      Class v10 = v9;
      if (v5)
      {
        [(PXSelectionSnapshot *)v5 pendingIndexPath];
        [v10 setItem:0x7FFFFFFFFFFFFFFFLL forStylableType:0 animated:1];
        long long v12 = 0u;
        long long v13 = 0u;
        [(PXSelectionSnapshot *)v5 cursorIndexPath];
      }
      else
      {
        [v9 setItem:0x7FFFFFFFFFFFFFFFLL forStylableType:0 animated:1];
        long long v12 = 0u;
        long long v13 = 0u;
      }
      objc_msgSend(v10, "setItem:forStylableType:animated:", 0x7FFFFFFFFFFFFFFFLL, 1, 1, v12, v13);
    }
    if (v5) {
      [(PXSelectionSnapshot *)v5 pressedIndexPath];
    }
    BOOL v11 = [(PXPhotosGridAssetDecorationSource *)self decoratedItemsLayout];
    [v11 setItem:0x7FFFFFFFFFFFFFFFLL forStylableType:2 animated:1];
  }
}

- (BOOL)wantsTapbackDecorationInLayout:(id)a3
{
  if (self->_tapbackStatusManager) {
    return ![(PXPhotosGridAssetDecorationSource *)self isInSelectMode];
  }
  else {
    return 0;
  }
}

- (BOOL)wantsCaptionDecorationsInLayout:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 itemCaptionsVisible];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3
{
  return 1;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewEnvironment];
  char v6 = [(id)v5 wantsFocusRing];

  LOBYTE(v5) = [(PXPhotosGridAssetDecorationSource *)self isSelectionLimitReached];
  BOOL v7 = [(PXPhotosGridAssetDecorationSource *)self isInSelectMode];
  if (v5)
  {
    int64_t v8 = 5;
  }
  else
  {
    char v9 = v7 | v6 ^ 1;
    if (v7) {
      int64_t v8 = 3;
    }
    else {
      int64_t v8 = 0;
    }
    if ((v9 & 1) == 0)
    {
      if ([(PXPhotosGridAssetDecorationSource *)self focusRingTypeInLayout:v4] == 1) {
        int64_t v8 = 2;
      }
      else {
        int64_t v8 = 1;
      }
    }
  }

  return v8;
}

- (BOOL)isSelectionLimitReached
{
  return self->_selectionLimitReached;
}

- (BOOL)enableDebugDecoration
{
  return self->_enableDebugDecoration;
}

- (int64_t)focusRingTypeInLayout:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 interItemSpacing];
    double v7 = v6;
    [v5 interItemSpacing];
    double v9 = v8;

    if (v7 >= v9) {
      double v10 = v9;
    }
    else {
      double v10 = v7;
    }
    char v11 = round(v10) >= (double)[(PXPhotosGridAssetDecorationSource *)self interItemSpacingThresholdForExteriorFocusRingSelection];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v11 = 0;
      }
      else
      {
        objc_opt_class();
        char v11 = objc_opt_isKindOfClass() ^ 1;
      }
    }
  }
  int64_t v12 = v11 & 1;

  return v12;
}

- (int64_t)interItemSpacingThresholdForExteriorFocusRingSelection
{
  return self->_interItemSpacingThresholdForExteriorFocusRingSelection;
}

- (void)setSelectionLimitReached:(BOOL)a3
{
  self->_selectionLimitReached = a3;
}

- (PXGItemsLayout)decoratedItemsLayout
{
  v2 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (PXGItemsLayout *)v3;
}

- (void)_invalidateSharedLibraryDecoration
{
  id v2 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
  [v2 invalidateDecoration];
}

- (PXGLayout)decoratedLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);
  return (PXGLayout *)WeakRetained;
}

void __70__PXPhotosGridAssetDecorationSource_observeIsInCloud_forDisplayAsset___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) uuid];
    if (*(unsigned __int8 *)(a1 + 48) != objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "containsObject:"))
    {
      id v2 = *(void **)(*(void *)(a1 + 40) + 40);
      if (*(unsigned char *)(a1 + 48)) {
        [v2 addObject:v4];
      }
      else {
        [v2 removeObject:v4];
      }
      id v3 = [*(id *)(a1 + 40) decoratedLayout];
      [v3 invalidateDecoration];
    }
  }
}

- (void)preferencesDidChange
{
  cachedSharedLibraryBadgeEnabledSettingValue = self->_cachedSharedLibraryBadgeEnabledSettingValue;
  self->_cachedSharedLibraryBadgeEnabledSettingValue = 0;

  [(PXPhotosGridAssetDecorationSource *)self _invalidateSharedLibraryDecoration];
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  id v3 = [(PXPhotosGridAssetDecorationSource *)self dataSource];
  id v4 = [v3 containerCollection];
  int v5 = objc_msgSend(v4, "px_isRecentlyDeletedSmartAlbum");

  if (v5) {
    return 2;
  }
  else {
    return 0;
  }
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setWantsStacksDecorations:(BOOL)a3
{
  if (self->_wantsStacksDecorations != a3)
  {
    self->_wantsStacksDecorations = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)setWantsSharedLibraryDecorations:(BOOL)a3
{
  if (self->_wantsSharedLibraryDecorations != a3)
  {
    self->_wantsSharedLibraryDecorations = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  self->_wantsNumberedSelectionStyle = a3;
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  self->_wantsFileSizeBadge = a3;
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  self->_wantsDimmedSelectionStyle = a3;
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  self->_wantsAssetIndexBadge = a3;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    id v4 = [(PXPhotosGridAssetDecorationSource *)self tapbackStatusManager];

    if (v4) {
      [(PXPhotosGridAssetDecorationSource *)self _invalidateTapbackDecoration];
    }
    int v5 = [(PXPhotosGridAssetDecorationSource *)self assetImportStatusManager];

    if (v5)
    {
      id v6 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
      [v6 invalidateDecoration];
    }
  }
}

- (void)setForbiddenBadges:(unint64_t)a3
{
  if (self->_forbiddenBadges != a3)
  {
    self->_forbiddenBadges = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)setEnableDebugDecoration:(BOOL)a3
{
  if (self->_enableDebugDecoration != a3)
  {
    self->_enableDebugDecoration = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)setDurationAlwaysHidden:(BOOL)a3
{
  if (self->_durationAlwaysHidden != a3)
  {
    self->_durationAlwaysHidden = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  if (self->_draggedAssetReferences != a3)
  {
    id v4 = (NSSet *)[a3 copy];
    draggedAssetReferences = self->_draggedAssetReferences;
    self->_draggedAssetReferences = v4;

    [(PXPhotosGridAssetDecorationSource *)self _invalidateDragDecoration];
  }
}

- (void)setDecoratedLayout:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);

  int v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decoratedLayout, obj);
    id v6 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v6 invalidateDecoration];

    int v5 = obj;
  }
}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_dataSource != __PAIR128__(a4, (unint64_t)v7))
  {
    self->_section = a4;
    id v9 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    double v8 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v8 invalidateDecoration];

    id v7 = v9;
  }
}

- (void)setLoadingStatusManager:(id)a3
{
  int v5 = (PXLoadingStatusManager *)a3;
  loadingStatusManager = self->_loadingStatusManager;
  if (loadingStatusManager != v5)
  {
    id v7 = v5;
    [(PXLoadingStatusManager *)loadingStatusManager unregisterObserver:self];
    objc_storeStrong((id *)&self->_loadingStatusManager, a3);
    [(PXLoadingStatusManager *)self->_loadingStatusManager registerObserver:self];
    [(PXPhotosGridAssetDecorationSource *)self _invalidateProgressDecoration];
    int v5 = v7;
  }
}

- (void)setBadgesModifier:(id)a3
{
}

- (PXPhotosGridAssetDecorationSource)init
{
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosGridAssetDecorationSource;
  id v2 = [(PXPhotosGridAssetDecorationSource *)&v12 init];
  id v3 = v2;
  if (v2)
  {
    v2->_section = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v4 = +[PXAssetBadgeManager defaultManager];
    badgeManager = v3->_badgeManager;
    v3->_badgeManager = (PXAssetBadgeManager *)v4;

    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    assetUUIDsInCloud = v3->_assetUUIDsInCloud;
    v3->_assetUUIDsInCloud = v6;

    double v8 = +[PXCuratedLibrarySettings sharedInstance];
    v3->_forceBadgesOnAllAssets = [v8 forceBadgesOnAllAssets];

    v3->_interItemSpacingThresholdForExteriorFocusRingSelection = 10;
    id v9 = (NSShadow *)objc_alloc_init(MEMORY[0x1E4FB0858]);
    backgroundShadow = v3->_backgroundShadow;
    v3->_backgroundShadow = v9;

    -[NSShadow setShadowOffset:](v3->_backgroundShadow, "setShadowOffset:", 0.0, 0.0);
    [(NSShadow *)v3->_backgroundShadow setShadowBlurRadius:20.0];
    PXRegisterPreferencesObserver(v3);
  }
  return v3;
}

- (BOOL)wantsBackgroundForZeroInset
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoratedGridLayout, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong((id *)&self->_itemsWithCoveredBottomTrailingCorner, 0);
  objc_storeStrong((id *)&self->_decorationViewClass, 0);
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_decoratedLayout);
  objc_storeStrong((id *)&self->_cachedSharedLibraryBadgeEnabledSettingValue, 0);
  objc_storeStrong((id *)&self->_backgroundShadow, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
  objc_storeStrong((id *)&self->_assetUUIDsInCloud, 0);
  objc_storeStrong((id *)&self->_draggedItems, 0);
}

- (PXGGridLayout)decoratedGridLayout
{
  return self->_decoratedGridLayout;
}

- (NSIndexSet)itemsWithCoveredBottomTrailingCorner
{
  return self->_itemsWithCoveredBottomTrailingCorner;
}

- (void)setInterItemSpacingThresholdForExteriorFocusRingSelection:(int64_t)a3
{
  self->_interItemSpacingThresholdForExteriorFocusRingSelection = a3;
}

- (BOOL)wantsStacksDecorations
{
  return self->_wantsStacksDecorations;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (void)setDecorationViewClass:(Class)a3
{
}

- (BOOL)hidesInteractiveFavoriteBadges
{
  return self->_hidesInteractiveFavoriteBadges;
}

- (unint64_t)forbiddenBadges
{
  return self->_forbiddenBadges;
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (void)setDecorationDataSource:(id)a3
{
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (int64_t)section
{
  return self->_section;
}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  if (!self->_isGettingLoadStatus) {
    [(PXPhotosGridAssetDecorationSource *)self _invalidateProgressDecoration];
  }
}

- (id)debugDecorationAtSpriteIndex:(unsigned int)a3 asset:(id)a4 inLayout:(id)a5
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  char v11 = +[PXPhotosGridSettings sharedInstance];
  int v12 = [v11 enableStacksReviewUI];

  if (!v12)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x4010000000;
    v38[3] = &unk_1AB5D584F;
    long long v18 = *((_OWORD *)off_1E5DAAF70 + 1);
    long long v39 = *(_OWORD *)off_1E5DAAF70;
    long long v40 = v18;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0xC010000000;
    v41[3] = &unk_1AB5D584F;
    long long v19 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v48 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v49 = v19;
    long long v20 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v50 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v51 = v20;
    long long v21 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v44 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v45 = v21;
    long long v22 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v46 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v47 = v22;
    long long v23 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v42 = *(_OWORD *)off_1E5DAAF90;
    long long v43 = v23;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x4810000000;
    v34[3] = &unk_1AB5D584F;
    long long v24 = *((_OWORD *)off_1E5DAAF88 + 1);
    long long v35 = *(_OWORD *)off_1E5DAAF88;
    long long v36 = v24;
    uint64_t v37 = *((void *)off_1E5DAAF88 + 4);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __81__PXPhotosGridAssetDecorationSource_debugDecorationAtSpriteIndex_asset_inLayout___block_invoke;
    v33[3] = &unk_1E5DB2270;
    v33[4] = v38;
    v33[5] = v41;
    v33[6] = v34;
    [v10 enumerateSpritesInRange:a3 | 0x100000000 usingBlock:v33];
    [v9 preferredCropRect];
    PXRectFlippedVertically();
  }
  id v13 = v9;
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v31 = (objc_class *)objc_opt_class();
    long long v30 = NSStringFromClass(v31);
    uint64_t v32 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v28 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 791, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v30, v32 object file lineNumber description];
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    double v29 = (objc_class *)objc_opt_class();
    long long v30 = NSStringFromClass(v29);
    [v28 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 791, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v30 object file lineNumber description];
  }

LABEL_4:
  v14 = [v13 burstIdentifier];

  if (v14)
  {
    BOOL v15 = objc_msgSend(v13, "pl_managedAsset");
    if ([v15 avalancheKind] == 2)
    {
      BOOL v16 = [v13 burstIdentifier];
      int64_t v17 = [v16 hash] % 0xFFuLL;

      if (v17) {
        [MEMORY[0x1E4FB1618] colorWithHue:(double)v17 / 255.0 saturation:1.0 brightness:1.0 alpha:1.0];
      }
      else {
      v26 = [MEMORY[0x1E4FB1618] clearColor];
      }
      uint64_t v52 = PXGDebugDecorationBottomEdgeColorKey;
      v53[0] = v26;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    }
    else
    {
      v25 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v25;
}

__n128 __81__PXPhotosGridAssetDecorationSource_debugDecorationAtSpriteIndex_asset_inLayout___block_invoke(void *a1, uint64_t a2, uint64_t a3, _OWORD *a4, _OWORD *a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1[4] + 8);
  long long v7 = a4[1];
  *(_OWORD *)(v6 + 32) = *a4;
  *(_OWORD *)(v6 + 48) = v7;
  double v8 = *(_OWORD **)(a1[5] + 8);
  long long v9 = a5[5];
  long long v11 = a5[2];
  long long v10 = a5[3];
  v8[6] = a5[4];
  v8[7] = v9;
  v8[4] = v11;
  v8[5] = v10;
  long long v12 = a5[9];
  long long v14 = a5[6];
  long long v13 = a5[7];
  v8[10] = a5[8];
  v8[11] = v12;
  v8[8] = v14;
  v8[9] = v13;
  long long v15 = a5[1];
  v8[2] = *a5;
  v8[3] = v15;
  uint64_t v16 = *(void *)(a1[6] + 8);
  __n128 result = *(__n128 *)a6;
  long long v18 = *(_OWORD *)(a6 + 16);
  *(void *)(v16 + 64) = *(void *)(a6 + 32);
  *(__n128 *)(v16 + 32) = result;
  *(_OWORD *)(v16 + 48) = v18;
  return result;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (!v7)
  {
    long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v31 = (objc_class *)objc_opt_class();
    uint64_t v32 = NSStringFromClass(v31);
    [v30 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 728, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v32 object file lineNumber description];
LABEL_25:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v33 = (objc_class *)objc_opt_class();
    uint64_t v32 = NSStringFromClass(v33);
    unint64_t v34 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v30 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 728, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v32, v34 object file lineNumber description];

    goto LABEL_25;
  }
LABEL_3:
  double v8 = [v7 itemsLayout];
  unsigned int v40 = -1;
  long long v9 = 0;
  if ([v7 isSpriteIndex:v4 decoratingSpriteWithIndex:&v40] && v8)
  {
    uint64_t v35 = objc_msgSend(v8, "itemForSpriteIndex:", objc_msgSend(v7, "convertSpriteIndex:toDescendantLayout:", v40, v8));
    -[PXPhotosGridAssetDecorationSource _displayAssetForItem:](self, "_displayAssetForItem:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    long long v11 = [(PXPhotosGridAssetDecorationSource *)self dataSource];
    long long v12 = [v7 currentDataSourceChange];
    long long v13 = v10;
    if ([v7 appearState] == 1)
    {
      long long v13 = v10;
      if (v12)
      {
        long long v14 = [v12 changeDetails];
        long long v15 = [v14 lastObject];
        uint64_t v16 = v11;
        uint64_t v17 = [v15 toDataSourceIdentifier];
        uint64_t v18 = [v16 identifier];

        long long v13 = v10;
        BOOL v19 = v17 == v18;
        long long v11 = v16;
        if (v19)
        {
          uint64_t v20 = [v16 identifier];
          int64_t v21 = [(PXPhotosGridAssetDecorationSource *)self section];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v22 = [v12 changeDetails];
          *(void *)&long long v36 = v20;
          *((void *)&v36 + 1) = v21;
          *(void *)&long long v37 = v35;
          *((void *)&v37 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          [off_1E5DA8488 indexPathAfterRevertingChanges:v22 fromIndexPath:&v36 hasIncrementalChanges:0 objectChanged:0];

          long long v13 = v10;
          if ((void)v38 != *(void *)off_1E5DAAED8)
          {
            long long v13 = v10;
            if ((void)v39 != 0x7FFFFFFFFFFFFFFFLL)
            {
              long long v13 = v10;
              if (*((void *)&v39 + 1) == 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v23 = [v12 dataSourceBeforeChanges];
                long long v36 = v38;
                long long v37 = v39;
                long long v13 = [v23 objectAtIndexPath:&v36];
              }
            }
          }
          long long v11 = v16;
        }
      }
    }
    long long v24 = [(PXPhotosGridAssetDecorationSource *)self decorationDataSource];

    if (v24)
    {
      v25 = [(PXPhotosGridAssetDecorationSource *)self decorationDataSource];
      long long v9 = [v25 userDataForAsset:v10];
    }
    else if (objc_opt_respondsToSelector())
    {
      long long v9 = [(PXTapbackStatusManager *)self->_tapbackStatusManager tapbackUserDataForAsset:v10 previousAsset:v13];
    }
    else
    {
      v26 = [(PXPhotosGridAssetDecorationSource *)self dataSource];
      uint64_t v27 = [v26 identifier];
      int64_t v28 = [(PXPhotosGridAssetDecorationSource *)self section];
      *(void *)&long long v38 = v27;
      *((void *)&v38 + 1) = v28;
      *(void *)&long long v39 = v35;
      *((void *)&v39 + 1) = 0x7FFFFFFFFFFFFFFFLL;
      long long v9 = [v26 assetReferenceAtItemIndexPath:&v38];
    }
  }

  return v9;
}

- (BOOL)hasTapbacksForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = -[PXPhotosGridAssetDecorationSource _displayAssetForItem:](self, "_displayAssetForItem:", [v6 itemForSpriteIndex:v4]);
    char v8 = [(PXTapbackStatusManager *)self->_tapbackStatusManager hasTapbacksForAsset:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 10.0;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v17);
    uint64_t v18 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 660, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v16, v18 object file lineNumber description];
  }
  else
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 660, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v16 object file lineNumber description];
  }

LABEL_3:
  if ([v7 localNumberOfSprites] <= a3)
  {
    long long v12 = 0;
  }
  else
  {
    uint64_t v8 = a3 / [v7 numberOfDecoratingSpritesPerDecoratedSprite];
    long long v9 = [v7 decoratedLayout];
    id v10 = [(PXPhotosGridAssetDecorationSource *)self selectedSpriteIndexesInLayout:v9];

    if ([v10 containsIndex:v8])
    {
      long long v11 = +[PXKeyboardSettings sharedInstance];
      if ([v11 enableShadow])
      {
        long long v12 = [v11 globalFocusAnimationShadow];
      }
      else
      {
        long long v12 = 0;
      }
    }
    else
    {
      long long v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
  uint64_t v4 = [v3 contentSource];
  unint64_t v5 = [v4 desiredPlaceholderStyleInLayout:v3];

  return v5;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v12 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v12);
    long long v13 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 641, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v11, v13 object file lineNumber description];
  }
  else
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 641, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v11 object file lineNumber description];
  }

LABEL_3:
  uint64_t v8 = [v7 decoratedLayout];
  [v8 contentSource];
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "displayAssetFetchResultForSpritesInRange:inLayout:", objc_msgSend(v7, "decoratedIndexForDecoratingIndex:", a3) | 0x100000000, v8);
  objc_claimAutoreleasedReturnValue();
  [v7 numberOfDecoratingSpritesPerDecoratedSprite];
  PXDisplayAssetFetchResultScaledWithMultiplier();
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)assetBackgroundCornerRadiusForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

uint64_t __88__PXPhotosGridAssetDecorationSource_assetDecorationInfoForAsset_atSpriteIndex_inLayout___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 itemForSpriteIndex:*(unsigned int *)(a1 + 56)];

  return v3;
}

- (BOOL)wantsFileSizeBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3
{
  return 0;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(PXPhotosGridAssetDecorationSource *)self wantsNumberedSelectionStyle])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = [v6 itemForSpriteIndex:v4];
    }
    else {
      uint64_t v4 = v4;
    }
    uint64_t v8 = [(PXPhotosGridAssetDecorationSource *)self selectionSnapshot];
    long long v9 = [(PXPhotosGridAssetDecorationSource *)self dataSource];
    uint64_t v10 = [v9 identifier];
    int64_t v11 = [(PXPhotosGridAssetDecorationSource *)self section];

    v13[0] = v10;
    v13[1] = v11;
    v13[2] = v4;
    v13[3] = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v7 = [v8 overallSelectionOrderIndexForIndexPath:v13];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4 = *(float *)off_1E5DAAF58;
  float v5 = *((float *)off_1E5DAAF58 + 1);
  float v6 = *((float *)off_1E5DAAF58 + 2);
  float v7 = *((float *)off_1E5DAAF58 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  id v5 = a3;
  float v6 = [(PXPhotosGridAssetDecorationSource *)self selectionSnapshot];
  float v7 = [v6 selectedIndexPaths];
  if ([v7 count] < 1)
  {
    long long v13 = 0;
  }
  else
  {
    uint64_t v8 = [(PXPhotosGridAssetDecorationSource *)self dataSource];
    uint64_t v9 = [v8 identifier];

    uint64_t v10 = [v6 dataSource];
    uint64_t v11 = [v10 identifier];

    if (v9 != v11)
    {
      BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"PXPhotosGridAssetDecorationSource.m", 433, @"identifier mismatch between dataSource of %@ and selectionSnapshot %@", self, v6 object file lineNumber description];
    }
    long long v12 = objc_msgSend(v7, "itemIndexSetForDataSourceIdentifier:section:", v9, -[PXPhotosGridAssetDecorationSource section](self, "section"));
    if (v12)
    {
      long long v13 = [(PXPhotosGridAssetDecorationSource *)self _spriteIndexesForItems:v12 inLayout:v5];
    }
    else
    {
      long long v14 = [v7 sectionIndexSetForDataSourceIdentifier:v9];
      if (objc_msgSend(v14, "containsIndex:", -[PXPhotosGridAssetDecorationSource section](self, "section"))&& (objc_msgSend(v6, "dataSource"), long long v15 = objc_claimAutoreleasedReturnValue(), v16 = objc_msgSend(v15, "numberOfItemsInSection:", -[PXPhotosGridAssetDecorationSource section](self, "section")), v15, v16 >= 1))
      {
        uint64_t v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
        long long v13 = [(PXPhotosGridAssetDecorationSource *)self _spriteIndexesForItems:v17 inLayout:v5];
      }
      else
      {
        long long v13 = 0;
      }
    }
  }

  return v13;
}

- (void)_invalidateTapbackDecoration
{
  id v2 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
  [v2 invalidateDecorationAndSprites];
}

- (void)_invalidateProgressDecoration
{
  id v2 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
  [v2 invalidateDecoration];
}

- (void)_updateDragDecoration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXPhotosGridAssetDecorationSource *)self draggedAssetReferences];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *(void *)off_1E5DAAED8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        *((void *)&v15 + 1) = 0;
        long long v12 = [(PXPhotosGridAssetDecorationSource *)self dataSource];
        long long v13 = v12;
        if (v12) {
          [v12 indexPathForAssetReference:v11];
        }
        else {
          long long v15 = 0u;
        }

        if ((void)v15 != v9 && *((void *)&v15 + 1) == [(PXPhotosGridAssetDecorationSource *)self section]) {
          [v4 addIndex:0];
        }
      }
      uint64_t v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, 0.0);
    }
    while (v7);
  }

  if ([v4 count]) {
    long long v14 = v4;
  }
  else {
    long long v14 = 0;
  }
  objc_storeStrong((id *)&self->_draggedItems, v14);
}

- (void)_invalidateDragDecoration
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[PXPhotosGridAssetDecorationSource _invalidateDragDecoration]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXPhotosGridAssetDecorationSource.m", 341, @"invalidating %lu after it already has been updated", 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
  id v4 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
  [v4 invalidateDecoration];
}

- (BOOL)isStacksBadgeEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StacksEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (id)_displayAssetForItem:(int64_t)a3
{
  id v5 = [(PXPhotosGridAssetDecorationSource *)self dataSource];
  int64_t v6 = [(PXPhotosGridAssetDecorationSource *)self section];
  v9[0] = [v5 identifier];
  v9[1] = v6;
  v9[2] = a3;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = [v5 assetAtItemIndexPath:v9];

  return v7;
}

- (void)setAssetImportStatusManager:(id)a3
{
  id v5 = (PXAssetImportStatusManager *)a3;
  if (self->_assetImportStatusManager != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_assetImportStatusManager, a3);
    int64_t v6 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v6 invalidateDecoration];

    id v5 = v7;
  }
}

- (void)setTapbackStatusManager:(id)a3
{
  id v5 = (PXTapbackStatusManager *)a3;
  if (self->_tapbackStatusManager != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_tapbackStatusManager, a3);
    [(PXPhotosGridAssetDecorationSource *)self _invalidateTapbackDecoration];
    id v5 = v6;
  }
}

- (void)setItemsWithCoveredBottomTrailingCorner:(id)a3
{
  uint64_t v9 = (NSIndexSet *)a3;
  id v4 = self->_itemsWithCoveredBottomTrailingCorner;
  id v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSIndexSet *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    uint64_t v7 = (NSIndexSet *)[(NSIndexSet *)v9 copy];
    itemsWithCoveredBottomTrailingCorner = self->_itemsWithCoveredBottomTrailingCorner;
    self->_itemsWithCoveredBottomTrailingCorner = v7;

    id v5 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v5 invalidateDecoration];
  }

LABEL_5:
}

- (void)setHidesInteractiveFavoriteBadges:(BOOL)a3
{
  if (self->_hidesInteractiveFavoriteBadges != a3)
  {
    self->_hidesInteractiveFavoriteBadges = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)setEnableSpatialBadges:(BOOL)a3
{
  if (self->_enableSpatialBadges != a3)
  {
    self->_enableSpatialBadges = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)setEnableDebugBadgeColors:(BOOL)a3
{
  if (self->_enableDebugBadgeColors != a3)
  {
    self->_enableDebugBadgeColors = a3;
    id v3 = [(PXPhotosGridAssetDecorationSource *)self decoratedLayout];
    [v3 invalidateDecoration];
  }
}

- (void)dealloc
{
  PXUnregisterPreferencesObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridAssetDecorationSource;
  [(PXPhotosGridAssetDecorationSource *)&v3 dealloc];
}

@end