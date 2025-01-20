@interface PXZoomablePhotosLayout
+ (id)visualizeBestAnchorColumnsForLayouts:(id)a3 imageWidth:(double)a4;
+ (void)getBestAnchorColumns:(int64_t *)a3 forItemLayouts:(id)a4 startingAtBaseLayout:(id)a5 anchorItem:(int64_t)a6 normalizedScaleCenterInAnchor:(CGPoint)a7 biasTowardsCenter:(BOOL)a8;
- ($8F6F21C65DCD0A0F8AC24DFE540A6236)_spriteTransformForLayout:(SEL)a3;
- ($8F6F21C65DCD0A0F8AC24DFE540A6236)spriteTransformForLevel:(SEL)a3;
- (BOOL)_getMiniModeInfo:(id *)a3 forLayout:(id)a4;
- (BOOL)_hasLastRowFilledStrategy;
- (BOOL)_isAllowedToShiftItem:(int64_t)a3 inLayout:(id)a4;
- (BOOL)_layoutAllowsCaptionsInSquare:(id)a3;
- (BOOL)_layoutHasIndividualItems:(id)a3;
- (BOOL)_layoutIsAspectFit:(id)a3;
- (BOOL)_layoutIsQuiteTransparent:(id)a3;
- (BOOL)_layoutWantsSingleDateTitle;
- (BOOL)_performVisualShiftWithLayout:(id)a3 movingItem:(int64_t)a4 toColumn:(int64_t)a5;
- (BOOL)_wantsDecorationForNumberOfColumns:(int64_t)a3;
- (BOOL)_wantsMiniDecorationForNumberOfColumns:(int64_t)a3;
- (BOOL)enableAddContentAccessoryItem;
- (BOOL)isAnimating;
- (BOOL)miniModeIsAnchoringToBottom;
- (BOOL)preventFillingTopAreaInsets;
- (BOOL)shouldAnimateTowardsAnchor;
- (BOOL)useLowMemoryDecodeInLayout:(id)a3;
- (BOOL)wantsOverBackgroundFloatingHeaderAppearance;
- (BOOL)wasTracking;
- (BOOL)zoomablePhotosViewModelIsResetToInitialState:(id)a3;
- (CGPoint)normalizedScaleCenterInAnchorSprite;
- (CGPoint)scaleCenterTargetInViewport;
- (CGRect)boundsForLevel:(unint64_t)a3;
- (CGRect)frameForItemAtIndexPath:(PXSimpleIndexPath *)a3 level:(unint64_t)a4;
- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5;
- (CGSize)_scaleForLayout:(id)a3;
- (CGSize)itemsLayout:(id)a3 insetForItem:(int64_t)a4;
- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSArray)miniModeFoldedRows;
- (NSMapTable)visualAnchorAssetReferenceItemByLayout;
- (PXAssetReference)anchorAssetReference;
- (PXAssetsDataSource)presentedDataSource;
- (PXGAnchor)anchor;
- (PXGBurstStackEffect)burstStackEffect;
- (PXGOneColumnLayout)oneColLayout;
- (PXPhotosGridAssetDecorationSource)assetDecorationSource;
- (PXZoomablePhotosContentLayout)primaryItemsLayout;
- (PXZoomablePhotosLayout)init;
- (PXZoomablePhotosLayout)initWithViewModel:(id)a3;
- (PXZoomablePhotosLayoutSpec)spec;
- (PXZoomablePhotosViewModel)viewModel;
- (UIEdgeInsets)effectiveOverlayInsets;
- (UIEdgeInsets)inlineHeaderOverlayInsets;
- (UIEdgeInsets)overlayInsets;
- (_NSRange)_rangeOfItemsForContentInRect:(CGRect)a3;
- (double)_interItemSpacingForLayout:(id)a3;
- (double)_itemCaptionSpacingForLayout:(id)a3;
- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4;
- (double)miniModeVerticalOffset;
- (id)_createLayoutWithNumberOfColumns:(int64_t)a3;
- (id)_debugColors;
- (id)_displayAssetForItem:(int64_t)a3;
- (id)_displayFaceForItem:(int64_t)a3;
- (id)addContentHandler;
- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3;
- (id)assetsIteratorForContentInRect:(CGRect)a3;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)customPixelBufferSourcesProviderForDisplayAssetsInLayout:(id)a3;
- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4;
- (id)debugQuickLookObject;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)displayAssetRequestObserverForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)effectProvider;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)itemsGeometry;
- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4;
- (id)layoutSnapshotDataSource;
- (id)locationNamesFutureForContentInRect:(CGRect)a3;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (id)presentedItemsGeometryForDataSource:(id)a3;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)_estimatedItemsPerScreenForLayout:(id)a3;
- (int64_t)bodyLayoutAXGroupRole;
- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)contentChangeTrend;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3;
- (unsigned)itemsLayout:(id)a3 effectIdForItem:(int64_t)a4;
- (void)_callAddContentActionHandler;
- (void)_configureLayout:(id)a3;
- (void)_configureMiniModeSpriteModifierForLayout:(id)a3;
- (void)_ensureZoomingAnchor;
- (void)_invalidateVisualShiftingEnsuringLastRowFilled;
- (void)_modifyMiniModeSpritesForLayout:(id)a3 spriteIndexRange:(_PXGSpriteIndexRange)a4 sprites:(id *)a5;
- (void)_performAnchorAlignmentVisualShiftWithBaseLayout:(id)a3;
- (void)_updateBackgroundSprites;
- (void)_updateBlurEffect;
- (void)_updateDataSource;
- (void)_updateDebugVisualizationSprites;
- (void)_updateDecorationSource;
- (void)_updateDecorationVisibility;
- (void)_updateEffectProvider;
- (void)_updateEffectiveOverlayInsets;
- (void)_updateFloatingHeaderStyle;
- (void)_updateLayers;
- (void)_updateMiniMode;
- (void)_updatePinchEffect;
- (void)_updatePrefetching;
- (void)_updateSurroundingScrollableContent;
- (void)_updateVisualShifting;
- (void)_updateZoom;
- (void)_updateZoomTransforms;
- (void)appearStateDidChange;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)containingScrollViewDidScroll:(CGPoint)a3;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)entityManagerDidChange;
- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3;
- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3;
- (void)getLastItem:(int64_t *)a3 lastColumn:(int64_t *)a4 forBodyLayout:(id)a5;
- (void)invalidateItemsLayout;
- (void)itemsLayout:(id)a3 updateTagsInSpriteInfos:(id *)a4 forItemsInRange:(_NSRange)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)scrollSpeedRegimeDidChange;
- (void)setAddContentHandler:(id)a3;
- (void)setAnchorAssetReference:(id)a3;
- (void)setBodyLayoutAXGroupRole:(int64_t)a3;
- (void)setEffectProvider:(id)a3;
- (void)setEffectiveOverlayInsets:(UIEdgeInsets)a3;
- (void)setEnableAddContentAccessoryItem:(BOOL)a3;
- (void)setInlineHeaderOverlayInsets:(UIEdgeInsets)a3;
- (void)setMiniModeFoldedRows:(id)a3;
- (void)setMiniModeIsAnchoringToBottom:(BOOL)a3;
- (void)setMiniModeVerticalOffset:(double)a3;
- (void)setOverlayInsets:(UIEdgeInsets)a3;
- (void)setPreventFillingTopAreaInsets:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setWantsOverBackgroundFloatingHeaderAppearance:(BOOL)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
- (void)zoomablePhotosViewModelResetToInitialState:(id)a3;
@end

@implementation PXZoomablePhotosLayout

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 itemForSpriteIndex:0];
  uint64_t v7 = [v5 numberOfItems];

  BOOL v8 = self->_cachedClampedItemRange.location == v6 && self->_cachedClampedItemRange.length == v7 - v6;
  if (!v8 || (cachedClampedFetchResult = self->_cachedClampedFetchResult) == 0)
  {
    currentDataSource = self->_currentDataSource;
    uint64_t v13 = [(PXAssetsDataSource *)currentDataSource identifier];
    long long v14 = xmmword_1AB359AA0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    [(PXAssetsDataSource *)currentDataSource assetsInSectionIndexPath:&v13];
    objc_claimAutoreleasedReturnValue();
    PXDisplayAssetFetchResultSubfetchResultWithRange();
  }
  v10 = cachedClampedFetchResult;
  return v10;
}

id __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) identifier] == a2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v5 = *(void *)(a1 + 56)) == 0)
    {
      id v12 = 0;
      id v13 = 0;
    }
    else
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = v4 + v5 - 1;
      uint64_t v26 = a2;
      uint64_t v27 = 0;
      uint64_t v28 = v4;
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      BOOL v8 = [v6 assetAtItemIndexPath:&v26];
      v9 = *(void **)(a1 + 32);
      uint64_t v26 = a2;
      uint64_t v27 = 0;
      uint64_t v28 = v7;
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      v10 = [v9 assetAtItemIndexPath:&v26];
      if (*(void *)(a1 + 64) == 1) {
        [v8 importDate];
      }
      else {
      long long v14 = [v8 creationDate];
      }
      if (*(void *)(a1 + 64) == 1) {
        [v10 importDate];
      }
      else {
      uint64_t v15 = [v10 creationDate];
      }
      id v24 = 0;
      id v25 = 0;
      objc_msgSend(MEMORY[0x1E4F1C9C8], "px_unionStartDate:endDate:withDate:", &v25, &v24, v14);
      id v16 = v25;
      id v17 = v24;
      id v22 = v17;
      id v23 = v16;
      objc_msgSend(MEMORY[0x1E4F1C9C8], "px_unionStartDate:endDate:withDate:", &v23, &v22, v15);
      id v13 = v23;

      id v12 = v22;
    }
    v18 = +[PXZoomablePhotosSettings sharedInstance];
    char v19 = [v18 titleUseDateRange];

    if ((v19 & 1) == 0)
    {
      id v20 = v13;

      id v12 = v20;
    }
    v11 = 0;
    if (v13 && v12) {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v12];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1424), v11);
    *(void *)(*(void *)(a1 + 40) + 1432) = a2;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (unsigned)itemsLayout:(id)a3 effectIdForItem:(int64_t)a4
{
  uint64_t v5 = [(PXZoomablePhotosLayout *)self _displayAssetForItem:a4];
  uint64_t v6 = [(NSCache *)self->_providedEffectByAsset objectForKey:v5];
  uint64_t v7 = [v6 entityManager];
  BOOL v8 = [(PXGLayout *)self entityManager];

  if (v7 != v8)
  {
    [(NSCache *)self->_providedEffectByAsset removeObjectForKey:v5];

    uint64_t v6 = 0;
  }
  unsigned int v9 = [v6 effectId];
  if (!v9)
  {
    v11 = [(PXZoomablePhotosLayout *)self effectProvider];

    if (!v11) {
      goto LABEL_13;
    }
    id v12 = [(PXZoomablePhotosLayout *)self effectProvider];
    id v13 = [(PXGLayout *)self entityManager];
    long long v14 = ((void (**)(void, void *, void *))v12)[2](v12, v13, v5);

    if (!v14
      || ([(NSCache *)self->_providedEffectByAsset setObject:v14 forKey:v5],
          unsigned int v9 = [v14 effectId],
          v14,
          !v9))
    {
LABEL_13:
      if ([v5 representsBurst])
      {
        uint64_t v15 = [(PXZoomablePhotosLayout *)self burstStackEffect];
        unsigned int v9 = [v15 effectId];
      }
      else
      {
        unsigned int v9 = 0;
      }
    }
  }

  return v9;
}

- (id)effectProvider
{
  return self->_effectProvider;
}

- (id)_displayAssetForItem:(int64_t)a3
{
  uint64_t v4 = self->_currentDataSource;
  v7[0] = [(PXAssetsDataSource *)v4 identifier];
  v7[1] = 0;
  v7[2] = a3;
  v7[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = [(PXAssetsDataSource *)v4 assetAtItemIndexPath:v7];

  return v5;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  if ([(PXZoomablePhotosLayout *)self isAnimating]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)useLowMemoryDecodeInLayout:(id)a3
{
  v3 = [(PXZoomablePhotosLayout *)self viewModel];
  char v4 = [v3 useLowMemoryDecode];

  return v4;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  char v4 = +[PXZoomablePhotosSettings sharedInstance];
  int v5 = [v4 enableInlineVideo];

  if (!v5) {
    return 1;
  }
  uint64_t v6 = [(PXZoomablePhotosLayout *)self viewModel];
  uint64_t v7 = [v6 inlinePlaybackController];
  uint64_t v8 = [v7 maxNumberOfPlayingItems];

  if (v8 < 1) {
    return 1;
  }
  unsigned int v9 = [(PXZoomablePhotosLayout *)self viewModel];
  int v10 = [v9 isDisplayingIndividualItems];

  if (v10) {
    return 3;
  }
  else {
    return 1;
  }
}

- (id)displayAssetRequestObserverForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  return self->_assetDecorationSource;
}

- (id)customPixelBufferSourcesProviderForDisplayAssetsInLayout:(id)a3
{
  v3 = [(PXZoomablePhotosLayout *)self viewModel];
  char v4 = [v3 inlinePlaybackController];

  return v4;
}

- (void)visibleRectDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGSplitLayout *)&v5 visibleRectDidChange];
  if (!self->_isPerformingUpdate) {
    PXZoomablePhotosInvalidate(self, 4129056);
  }
  v3 = [(PXZoomablePhotosLayout *)self viewModel];
  char v4 = [v3 inlinePlaybackController];
  [v4 visibleRectDidChange];
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v6 = (PXZoomablePhotosLayout *)a4;
  uint64_t v7 = v6;
  if (v6 == self)
  {
    _PXGSpriteIndexRange lightBackgroundSpriteIndexRange = v6->_lightBackgroundSpriteIndexRange;
    BOOL v13 = lightBackgroundSpriteIndexRange.location > a3;
    unsigned int v12 = lightBackgroundSpriteIndexRange.length + lightBackgroundSpriteIndexRange.location;
    BOOL v13 = !v13 && v12 > a3;
    if (v13)
    {
      uint64_t v8 = [(PXZoomablePhotosLayout *)v6 spec];
      [v8 defaultBackgroundColor];
    }
    else
    {
      uint64_t v8 = [(PXZoomablePhotosLayout *)v6 _debugColors];
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3 % (unint64_t)objc_msgSend(v8, "count"));
    int v10 = };
  }
  else
  {
    uint64_t v8 = [(PXZoomablePhotosLayout *)self _debugColors];
    unsigned int v9 = [(PXGLayout *)v7 itemsLayout];
    int v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "numberOfColumns") % (unint64_t)objc_msgSend(v8, "count"));
  }
  return v10;
}

- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  unsigned int location = self->_blurEffectsSpriteIndexRange.location;
  BOOL v6 = location > a3;
  unsigned int v5 = self->_blurEffectsSpriteIndexRange.length + location;
  return !v6 && v5 > a3;
}

- (CGSize)itemsLayout:(id)a3 insetForItem:(int64_t)a4
{
  BOOL v6 = [(PXZoomablePhotosLayout *)self viewModel];
  if ([v6 aspectFit])
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    unsigned int v9 = [(PXZoomablePhotosLayout *)self assetDecorationSource];
    [v9 expectedInsetsForItem:a4];
    double v7 = v10;
    double v8 = v11;
  }
  double v12 = v7;
  double v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (PXZoomablePhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosGridAssetDecorationSource)assetDecorationSource
{
  return self->_assetDecorationSource;
}

- (void)itemsLayout:(id)a3 updateTagsInSpriteInfos:(id *)a4 forItemsInRange:(_NSRange)a5
{
  [(PXAssetsDataSource *)self->_currentDataSource identifier];
  PXUpdateSectionedSpriteInfoTagsForItemsInRange();
}

void __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 1072);
  id v4 = a2;
  LODWORD(v3) = [v3 effectId];
  id v5 = v4;
  uint64_t v6 = [v5 mutableEffectIds];

  *(_DWORD *)(v6 + 4 * *(unsigned int *)(a1 + 40)) = v3;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

void __47__PXZoomablePhotosLayout__updateZoomTransforms__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1064) sublayoutDataStore];
  double v7 = [v6 sublayoutAtIndex:a2];
  double v8 = [v7 itemsLayout];

  long long v15 = *((_OWORD *)off_1E5DAAF78 + 1);
  *(_OWORD *)&v19.a = *(_OWORD *)off_1E5DAAF78;
  *(_OWORD *)&v19.c = v15;
  *(_OWORD *)&v19.tx = *((_OWORD *)off_1E5DAAF78 + 2);
  double v9 = *((double *)off_1E5DAAF78 + 6);
  char v10 = [*(id *)(*(void *)(a1 + 32) + 1408) containsObject:v8];
  if (*(void *)(a1 + 56) != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v11 = [*(id *)(a1 + 40) objectForKey:v8];
    if (v11)
    {
      [v11 indexPath];
      uint64_t v12 = v18;
    }
    else
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"PXZoomablePhotosLayout.m", 1982, @"Invalid parameter not satisfying: %@", @"anchorAssetReference != nil" object file lineNumber description];

      uint64_t v12 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
    }
    [v8 frameForItem:v12];
    PXPointDenormalize();
  }
  if ((v10 & 1) == 0)
  {
    CGAffineTransform v16 = v19;
    CGAffineTransform v20 = v19;
    CGAffineTransformTranslate(&v16, &v20, 100000.0, 0.0);
    double v9 = v9 + 0.0;
    CGAffineTransform v19 = v16;
  }
  long long v13 = *(_OWORD *)&v19.c;
  *(_OWORD *)(a3 + 72) = *(_OWORD *)&v19.a;
  *(_OWORD *)(a3 + 88) = v13;
  *(_OWORD *)(a3 + 104) = *(_OWORD *)&v19.tx;
  *(double *)(a3 + 120) = v9;
  [v8 numberOfColumns];
  [v8 alpha];
  kdebug_trace();
}

uint64_t __41__PXZoomablePhotosLayout__updateMiniMode__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureMiniModeSpriteModifierForLayout:a2];
}

id __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) == a2) {
    id v2 = *(id *)(a1 + 32);
  }
  else {
    id v2 = 0;
  }
  return v2;
}

void __39__PXZoomablePhotosLayout__updateLayers__block_invoke_353(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = [v12 numberOfColumns];
  double v8 = [*(id *)(a1 + 32) spec];
  uint64_t v9 = [v8 maxColumnsForStickyHeaderDisplay];

  if (v7 <= v9) {
    goto LABEL_8;
  }
  char v10 = *(id **)(a1 + 32);
  double v11 = v10 + 173;
  if (!v10[174])
  {
    double v11 = v10 + 174;
    goto LABEL_7;
  }
  if (!*v11)
  {
LABEL_7:
    objc_storeStrong(v11, a2);
    goto LABEL_8;
  }
  if (!v10[175])
  {
    objc_storeStrong(v10 + 175, a2);
    *a4 = 1;
  }
LABEL_8:
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  *a5 = a3;
  return 0;
}

void __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1064) sublayoutDataStore];
  uint64_t v7 = [v6 sublayoutAtIndex:a2];
  double v8 = [v7 itemsLayout];

  [v8 alpha];
  if (v9 > 0.0)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [v8 interItemSpacing];
    if (v10 > 0.0 && ([*(id *)(a1 + 32) _layoutIsQuiteTransparent:v8] & 1) == 0)
    {
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < (*(_DWORD *)(*(void *)(a1 + 32)
                                                                                                  + 1108)
                                                                                      + *(_DWORD *)(*(void *)(a1 + 32)
                                                                                                  + 1104)))
      {
        long long v11 = *(_OWORD *)(a3 + 88);
        *(_OWORD *)&buf.a = *(_OWORD *)(a3 + 72);
        *(_OWORD *)&buf.c = v11;
        *(_OWORD *)&buf.tx = *(_OWORD *)(a3 + 104);
        uint64_t v14 = *(void *)(a3 + 120);
        [v8 loadedItemsRect];
        CGAffineTransform v15 = buf;
        CGRectApplyAffineTransform(v16, &v15);
        [*(id *)(a1 + 32) displayScale];
        PXFloatRoundToPixel();
      }
      id v12 = PLGridZeroGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.a) = 0;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Not enough background sprites available to satisfy visible layers", (uint8_t *)&buf, 2u);
      }
    }
  }
}

- (CGRect)frameForItemAtIndexPath:(PXSimpleIndexPath *)a3 level:(unint64_t)a4
{
  [(PXZoomablePhotosContentLayout *)self->_itemLayoutByHeaderLevel[a4] frameForItem:a3->item];
  PXRectWithAspectRatioFillingRect();
}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)spriteTransformForLevel:(SEL)a3
{
  return [(PXZoomablePhotosLayout *)self _spriteTransformForLayout:self->_itemLayoutByHeaderLevel[a4]];
}

- (UIEdgeInsets)inlineHeaderOverlayInsets
{
  double top = self->_inlineHeaderOverlayInsets.top;
  double left = self->_inlineHeaderOverlayInsets.left;
  double bottom = self->_inlineHeaderOverlayInsets.bottom;
  double right = self->_inlineHeaderOverlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)boundsForLevel:(unint64_t)a3
{
  [(PXZoomablePhotosContentLayout *)self->_itemLayoutByHeaderLevel[a3] contentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)_spriteTransformForLayout:(SEL)a3
{
  id v6 = a4;
  long long v7 = *((_OWORD *)off_1E5DAAF78 + 1);
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)off_1E5DAAF78;
  *(_OWORD *)&retstr->var0.c = v7;
  *(_OWORD *)&retstr->var0.tx = *((_OWORD *)off_1E5DAAF78 + 2);
  retstr->var1 = *((double *)off_1E5DAAF78 + 6);
  double v8 = [v6 superlayout];

  if (v8)
  {
    memset(v12, 0, sizeof(v12));
    double v9 = [(PXGLayout *)self->_zoomLayout sublayoutDataStore];
    double v10 = v9;
    if (v9) {
      [v9 geometryForSublayout:v6];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }

    *(_OWORD *)&retstr->var0.a = *(_OWORD *)((char *)v12 + 8);
    *(_OWORD *)&retstr->var0.c = *(_OWORD *)((char *)&v12[1] + 8);
    *(_OWORD *)&retstr->var0.tx = *(_OWORD *)((char *)&v12[2] + 8);
    retstr->var1 = *((double *)&v12[3] + 1);
  }

  return result;
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  double v4 = (void (**)(id, uint64_t, uint64_t, _OWORD *))a3;
  long long v16 = *(_OWORD *)((char *)off_1E5DAB028 + 8);
  uint64_t v17 = *((void *)off_1E5DAB028 + 3);
  char v5 = [(PXGLayout *)self fullyVisibleEdgesWithDefaultTolerance];
  if ((v5 & 4) == 0)
  {
    if ((v5 & 1) == 0)
    {
      uint64_t v6 = *(void *)off_1E5DAB028;
      goto LABEL_11;
    }
    currentDataSource = self->_currentDataSource;
    if (currentDataSource)
    {
      [(PXAssetsDataSource *)currentDataSource firstItemIndexPath];
      goto LABEL_8;
    }
LABEL_9:
    uint64_t v6 = 0;
    memset(v15, 0, sizeof(v15));
    goto LABEL_10;
  }
  long long v7 = self->_currentDataSource;
  if (!v7) {
    goto LABEL_9;
  }
  [(PXAssetsDataSource *)v7 lastItemIndexPath];
LABEL_8:
  uint64_t v6 = *(void *)&v15[0];
LABEL_10:
  long long v16 = *(_OWORD *)((char *)v15 + 8);
  uint64_t v17 = *((void *)&v15[1] + 1);
LABEL_11:
  if (v6 == *(void *)off_1E5DAAED8)
  {
    double v9 = [(PXZoomablePhotosLayout *)self anchorAssetReference];

    if (!v9)
    {
LABEL_17:
      v14.receiver = self;
      v14.super_class = (Class)PXZoomablePhotosLayout;
      [(PXGLayout *)&v14 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v4];
      goto LABEL_18;
    }
    uint64_t v10 = [(PXZoomablePhotosLayout *)self anchorAssetReference];
  }
  else
  {
    long long v11 = self->_currentDataSource;
    *(void *)&v15[0] = v6;
    *(_OWORD *)((char *)v15 + 8) = v16;
    *((void *)&v15[1] + 1) = v17;
    uint64_t v10 = [(PXAssetsDataSource *)v11 assetReferenceAtItemIndexPath:v15];
  }
  id v12 = (void *)v10;
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v13 = [(PXGLayout *)self spriteIndexForObjectReference:v10];
  LOBYTE(v15[0]) = 0;
  v4[2](v4, v13, 1, v15);

LABEL_18:
}

- (BOOL)_performVisualShiftWithLayout:(id)a3 movingItem:(int64_t)a4 toColumn:(int64_t)a5
{
  id v8 = a3;
  BOOL v9 = [(PXZoomablePhotosLayout *)self _layoutHasIndividualItems:v8];
  BOOL v10 = [(PXZoomablePhotosLayout *)self _hasLastRowFilledStrategy];
  BOOL v11 = !v9;
  [(PXGLayout *)self visibleRect];
  if (a5 | a4 && v9 && !v10) {
    PXSizeIsEmpty();
  }
  if (v10 && v9 && [v8 numberOfColumns] >= 2)
  {
    [(PXGLayout *)self safeAreaInsets];
    double v13 = v12;
    [(PXGLayout *)self visibleRect];
    double v15 = v14 - v13;
    uint64_t v16 = [v8 numberOfColumns];
    [(PXGLayout *)self referenceSize];
    int64_t v18 = vcvtpd_s64_f64(v15 / (v17 / (double)v16)) - (v16 + [v8 numberOfItems] - 1) / v16;
    uint64_t v19 = v18 & ~(v18 >> 63);
  }
  else
  {
    uint64_t v19 = 0;
  }
  [v8 shiftItem:a4 toColumn:a5 topPaddingRows:v19 hideIncompleteRows:v11];

  return 1;
}

- (void)_updateVisualShifting
{
  double v3 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  uint64_t v4 = [v3 numberOfItems];
  uint64_t v5 = [v3 numberOfColumns];
  if (!v4) {
    goto LABEL_38;
  }
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_38;
  }
  [(PXGLayout *)self visibleRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int64_t v40 = 0;
  int64_t v41 = 0;
  [(PXZoomablePhotosLayout *)self getLastItem:&v41 lastColumn:&v40 forBodyLayout:v3];
  BOOL v15 = [(PXZoomablePhotosLayout *)self _hasLastRowFilledStrategy];
  if (v15 && v4 < v6)
  {
    int64_t v40 = 0;
    int64_t v41 = 0;
  }
  if (!self->_performedInitialVisualShift)
  {
    self->_performedInitialVisualShift = 1;
    if ((v15 | [(PXAssetsDataSource *)self->_currentDataSource startsAtEnd]) != 1) {
      goto LABEL_35;
    }
    uint64_t v24 = [(PXGLayout *)self activeAnchor];
    if (v24)
    {
      id v25 = (void *)v24;
      char v26 = [(PXGLayout *)self anchoredContentEdges];

      if ((v26 & 4) == 0) {
        goto LABEL_35;
      }
    }
    goto LABEL_15;
  }
  if (![(PXZoomablePhotosLayout *)self isAnimating])
  {
    uint64_t v16 = +[PXZoomablePhotosSettings sharedInstance];
    [v16 shiftingRequiredScreensTopDistance];
    double v18 = v17;

    if (!v15)
    {
      double v29 = v10 / v14;
      int64_t visuallyStableAnchorItem = self->_visuallyStableAnchorItem;
      if (visuallyStableAnchorItem != 0x7FFFFFFFFFFFFFFFLL
        && (v29 > v18 || self->_visuallyStableAnchorAllowedCloseToTop))
      {
        int64_t visuallyStableAnchorItemDesiredColumn = self->_visuallyStableAnchorItemDesiredColumn;
        goto LABEL_33;
      }
      if ([(PXGLayout *)self anchoredContentEdges] == 4) {
        goto LABEL_35;
      }
      v42.origin.x = v8;
      v42.origin.y = v10;
      v42.size.width = v12;
      v42.size.height = v14;
      if (CGRectIsEmpty(v42) || ![v3 visualItemShift]) {
        goto LABEL_35;
      }
      uint64_t v30 = [(PXGLayout *)self scrollSpeedRegime];
      uint64_t v31 = [v3 columnForItem:v41];
      int64_t v32 = v40;
      uint64_t v33 = [v3 visualItemShift];
      if (v30 < 3)
      {
        if (v30 != 2 || (v29 < 1.0 ? (BOOL v38 = v33 <= 0) : (BOOL v38 = 1), v38))
        {
          if (v30) {
            goto LABEL_35;
          }
          if (v29 >= 1.0) {
            goto LABEL_35;
          }
          if (v33 < 1) {
            goto LABEL_35;
          }
          objc_msgSend(v3, "itemRangeInRect:", v8, v10, v12, v14);
          if (v4 > v39) {
            goto LABEL_35;
          }
        }
      }
      else
      {
        BOOL v35 = v29 < v18 || v31 != v32;
        if (self->_scrolledWhileAnimatingZoom || !v35) {
          goto LABEL_35;
        }
      }
      v36 = self;
      v37 = v3;
      int64_t visuallyStableAnchorItem = 0;
      int64_t visuallyStableAnchorItemDesiredColumn = 0;
      goto LABEL_34;
    }
    if (self->_visuallyStableAnchorLastRowFilled)
    {
      uint64_t v19 = [(PXGLayout *)self rootLayout];
      CGAffineTransform v20 = [v19 activeAnchor];

      if (!v20)
      {
        v21 = [(PXGLayout *)self rootLayout];
        id v22 = [v21 createAnchorForVisibleArea];
        id v23 = (id)[v22 autoInvalidate];
      }
LABEL_15:
      int64_t visuallyStableAnchorItemDesiredColumn = v40;
      int64_t visuallyStableAnchorItem = v41;
LABEL_33:
      v36 = self;
      v37 = v3;
LABEL_34:
      -[PXZoomablePhotosLayout _performVisualShiftWithLayout:movingItem:toColumn:](v36, "_performVisualShiftWithLayout:movingItem:toColumn:", v37, visuallyStableAnchorItem, visuallyStableAnchorItemDesiredColumn, v40);
    }
  }
LABEL_35:
  if (![(PXGLayout *)self scrollSpeedRegime]) {
    self->_scrolledWhileAnimatingZoom = 0;
  }
  self->_int64_t visuallyStableAnchorItem = 0x7FFFFFFFFFFFFFFFLL;
  self->_int64_t visuallyStableAnchorItemDesiredColumn = 0;
  self->_visuallyStableAnchorAllowedCloseToTop = 0;
  self->_visuallyStableAnchorLastRowFilled = 0;
LABEL_38:
}

- (BOOL)_hasLastRowFilledStrategy
{
  id v2 = [(PXZoomablePhotosLayout *)self viewModel];
  BOOL v3 = [v2 contentShiftStrategy] == 1;

  return v3;
}

- (void)getLastItem:(int64_t *)a3 lastColumn:(int64_t *)a4 forBodyLayout:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [v7 numberOfItems];
  uint64_t v9 = [v7 numberOfColumns];
  *a3 = v8 - 1;
  uint64_t v10 = [v7 numberOfAccessoryItems];

  *a4 = v9 + ~(v10 % v9);
}

- (PXZoomablePhotosContentLayout)primaryItemsLayout
{
  id v2 = [(PXGZoomLayout *)self->_zoomLayout primaryLayer];
  BOOL v3 = [v2 itemsLayout];

  return (PXZoomablePhotosContentLayout *)v3;
}

- (id)layoutSnapshotDataSource
{
  return self->_currentDataSource;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((a4 & 6) != 0)
  {
    uint64_t v10 = [(PXZoomablePhotosLayout *)self presentedDataSource];
    uint64_t v11 = [v10 identifier];

    uint64_t v13 = 0;
    uint64_t v14 = v11;
    PXGAXAddSimpleIndexPathGroupChangeUserInfo(v9, &v14, &v13, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGLayout *)&v12 axGroup:v8 didChange:a4 userInfo:v9];
}

- (void)_updateEffectiveOverlayInsets
{
  [(PXZoomablePhotosLayout *)self effectiveOverlayInsets];
  [(PXZoomablePhotosLayout *)self overlayInsets];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(PXGLayout *)self visibleRect];
  uint64_t v10 = v6;
  uint64_t v11 = v4;
  if (v7 < 1.0)
  {
    id v8 = [(PXGLayout *)self activeAnchor];
    [v8 anchoredContentEdges];
  }
  [(PXGLayout *)self visibleRect];
  [(PXGLayout *)self visibleRect];
  if (![(PXGLayout *)self scrollSpeedRegime])
  {
    id v9 = [(PXGLayout *)self activeAnchor];
    [v9 isScrollingAnimationAnchor];
  }
  [(PXZoomablePhotosLayout *)self effectiveOverlayInsets];
  PXEdgeInsetsEqualToEdgeInsets();
}

- (UIEdgeInsets)overlayInsets
{
  double top = self->_overlayInsets.top;
  double left = self->_overlayInsets.left;
  double bottom = self->_overlayInsets.bottom;
  double right = self->_overlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOverlayInsets:(UIEdgeInsets)a3
{
}

- (void)setInlineHeaderOverlayInsets:(UIEdgeInsets)a3
{
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGSplitLayout *)&v7 willUpdate];
  self->_preUpdateFlags.willPerformUpdate = 1;
  if (self->_preUpdateFlags.isPerformingUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXZoomablePhotosLayout.m", 1103, @"Invalid parameter not satisfying: %@", @"!_preUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXZoomablePhotosLayout.m", 1104, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGSplitLayout *)&v7 didUpdate];
  if (self->_preUpdateFlags.willPerformUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXZoomablePhotosLayout.m", 1196, @"Invalid parameter not satisfying: %@", @"!_preUpdateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXZoomablePhotosLayout.m", 1197, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGSplitLayout *)&v3 referenceSizeDidChange];
  if ([(PXZoomablePhotosLayout *)self _hasLastRowFilledStrategy]) {
    [(PXZoomablePhotosLayout *)self _invalidateVisualShiftingEnsuringLastRowFilled];
  }
}

- (void)appearStateDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGLayout *)&v3 appearStateDidChange];
  if ([(PXGLayout *)self appearState] == 1) {
    PXZoomablePhotosInvalidate(self, 786432);
  }
}

- (void)_updateZoom
{
  v81[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PXZoomablePhotosLayout *)self viewModel];
  uint64_t v4 = v3;
  uint64_t v79 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  if (v3)
  {
    [v3 zoomState];
    int v70 = BYTE8(v76);
  }
  else
  {
    int v70 = 0;
  }
  uint64_t v5 = self->_zoomLayout;
  uint64_t v6 = self->_layers;
  self->_currentDataSource;
  [(PXZoomablePhotosLayout *)self oneColLayout];
  if (objc_claimAutoreleasedReturnValue())
  {
    if ([(NSArray *)self->_itemLayouts count] >= 2)
    {
      objc_super v7 = [(NSArray *)self->_itemLayouts objectAtIndexedSubscript:1];
      if (v7)
      {
        [v7 numberOfColumns];
        PXFloatProgressBetween();
      }
    }
    PXFloatSaturate();
  }
  v68 = [(PXGZoomLayout *)v5 primaryLayer];
  uint64_t v67 = [v68 itemsLayout];
  BOOL v8 = *((double *)&v73 + 1) != *(double *)(MEMORY[0x1E4F1DAD8] + 8) || *(double *)&v73 != *MEMORY[0x1E4F1DAD8];
  BOOL v9 = !self->_wasTracking && v8;
  uint64_t v10 = [(PXZoomablePhotosLayout *)self anchorAssetReference];
  v69 = v4;
  v66 = v6;
  if (v10)
  {
    uint64_t v11 = [v4 anchorAssetReference];
    if (v11)
    {
      objc_super v12 = v5;
      uint64_t v13 = [(PXZoomablePhotosLayout *)self anchorAssetReference];
      uint64_t v14 = [v13 asset];
      BOOL v15 = [v4 anchorAssetReference];
      uint64_t v16 = [v15 asset];
      if (v14 == v16) {
        int v17 = 1;
      }
      else {
        int v17 = [v14 isEqual:v16];
      }
      int v18 = v17 ^ 1;

      uint64_t v4 = v69;
      uint64_t v5 = v12;
      uint64_t v6 = v66;
    }
    else
    {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }

  if (BYTE8(v76))
  {
    uint64_t v19 = [(PXZoomablePhotosLayout *)self anchorAssetReference];
    BOOL v20 = v19 == 0;

    id v22 = [(PXZoomablePhotosLayout *)self anchorAssetReference];

    [v4 layoutExtendsContentBelowBounds];
    if (v20)
    {
      id v28 = [(PXGLayout *)self createFenceWithType:0];
      [(PXZoomablePhotosLayout *)self _updateSurroundingScrollableContent];
      objc_msgSend(v68, "visibleRect", v73);
      PXPointDenormalize();
    }
    if (v22 && v18 | v9)
    {
      currentDataSource = self->_currentDataSource;
      uint64_t v24 = [v4 anchorAssetReference];
      uint64_t v25 = [(PXAssetsDataSource *)currentDataSource assetReferenceForAssetReference:v24];

      uint64_t v26 = v67;
      uint64_t v27 = &OBJC_IVAR___PXCMMPhotoKitPublishMomentShareActionPerformer__previewRequestStartDate;
      if (v25)
      {
        [v68 visibleRect];
        PXPointDenormalize();
      }
    }
    else
    {
      uint64_t v26 = v67;
      uint64_t v27 = &OBJC_IVAR___PXCMMPhotoKitPublishMomentShareActionPerformer__previewRequestStartDate;
    }
  }
  else
  {
    v21 = [(PXZoomablePhotosLayout *)self anchorAssetReference];

    [v4 layoutExtendsContentBelowBounds];
    uint64_t v26 = v67;
    uint64_t v27 = &OBJC_IVAR___PXCMMPhotoKitPublishMomentShareActionPerformer__previewRequestStartDate;
    if (v21)
    {
      [(PXZoomablePhotosLayout *)self _ensureZoomingAnchor];
      anchor = self->_anchor;
      self->_anchor = 0;

      CGPoint v30 = *(CGPoint *)off_1E5DAB000;
      self->_scaleCenterTargetInViewport = *(CGPoint *)off_1E5DAB000;
      self->_normalizedScaleCenterInAnchorSprite = v30;
      [(PXZoomablePhotosLayout *)self setAnchorAssetReference:0];
      uint64_t v31 = [(PXZoomablePhotosLayout *)self visualAnchorAssetReferenceItemByLayout];
      [v31 removeAllObjects];
    }
  }
  int64_t v32 = [(PXZoomablePhotosLayout *)self anchorAssetReference];
  [(PXGZoomLayout *)self->_zoomLayout setAnchorObjectReference:v32];

  [(PXZoomablePhotosLayout *)self scaleCenterTargetInViewport];
  -[PXGZoomLayout setAnchorViewportCenter:](self->_zoomLayout, "setAnchorViewportCenter:");
  uint64_t v33 = [(PXZoomablePhotosLayout *)self anchorAssetReference];

  if (v33) {
    [(PXZoomablePhotosLayout *)self _ensureZoomingAnchor];
  }
  v34 = [(NSArray *)v6 objectAtIndexedSubscript:*((void *)&v75 + 1)];
  uint64_t v35 = [(PXGZoomLayout *)v5 layers];
  v36 = (void *)v35;
  if (v70)
  {
    v37 = v6;
    BOOL v38 = (void *)v35;
    unint64_t v39 = v5;
    int64_t v40 = [(PXGZoomLayout *)v5 layers];
    uint64_t v41 = [v40 count];
    CGRect v42 = v37;
    uint64_t v43 = [(NSArray *)v37 count];

    if (v41 == v43)
    {
      uint64_t v44 = (uint64_t)v38;
    }
    else
    {
      uint64_t v44 = (uint64_t)v38;
      if (v33)
      {
        [(PXZoomablePhotosLayout *)self _performAnchorAlignmentVisualShiftWithBaseLayout:v26];
        uint64_t v45 = [(NSArray *)v42 sortedArrayUsingComparator:&__block_literal_global_356_87922];

        [(NSMutableSet *)self->_itemLayoutsAllowedToLoad removeAllObjects];
        uint64_t v44 = v45;
      }
    }
    uint64_t v27 = &OBJC_IVAR___PXCMMPhotoKitPublishMomentShareActionPerformer__previewRequestStartDate;
    uint64_t v5 = v39;
  }
  else
  {
    v81[0] = v34;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  }
  v46 = [(PXGZoomLayout *)v5 primaryLayer];

  if (v34 != v46)
  {
    PXZoomablePhotosInvalidate(self, 512);
    v47 = [v34 itemsLayout];
    BOOL v48 = [(PXZoomablePhotosLayout *)self _layoutHasIndividualItems:v47];

    if (v48)
    {
      lastReturnedDateInterval = self->_lastReturnedDateInterval;
      self->_lastReturnedDateInterval = 0;

      lastReturnedLocationNames = self->_lastReturnedLocationNames;
      self->_lastReturnedLocationNames = 0;
    }
  }
  [(PXGZoomLayout *)v5 setLayers:v44 primaryLayer:v34];
  uint64_t v51 = v27[210];
  uint64_t v52 = [*(id *)((char *)&self->super.super.super.isa + v51) objectAtIndexedSubscript:(void)v77];
  uint64_t v53 = [*(id *)((char *)&self->super.super.super.isa + v51) objectAtIndexedSubscript:*((void *)&v77 + 1)];
  double v54 = *((double *)&v78 + 1);
  BOOL v55 = [(PXZoomablePhotosLayout *)self _layoutIsQuiteTransparent:v52];
  v71 = (void *)v53;
  BOOL v56 = [(PXZoomablePhotosLayout *)self _layoutIsQuiteTransparent:v53];
  memset(v72, 0, sizeof(v72));
  id v57 = *(id *)((char *)&self->super.super.super.isa + v51);
  if ([v57 countByEnumeratingWithState:v72 objects:v80 count:16])
  {
    double v58 = 2.0 - v54;
    if (!v56) {
      double v58 = 1.0;
    }
    double v59 = v54 * v58;
    if (v55) {
      double v60 = v59;
    }
    else {
      double v60 = 1.0;
    }
    if (v55 && v56) {
      double v61 = v54;
    }
    else {
      double v61 = 1.0;
    }
    double v62 = 1.0 - v54 * v61;
    v63 = (void *)**((void **)&v72[0] + 1);
    if (**((void **)&v72[0] + 1) == v52)
    {
      double v65 = 1.0 - v54 * v61;
      if (!v55)
      {
        [(PXZoomablePhotosLayout *)self _interItemSpacingForLayout:v52];
        double v65 = v62;
      }
    }
    else if (v63 == v71)
    {
      if (!v56) {
        [(PXZoomablePhotosLayout *)self _interItemSpacingForLayout:"_interItemSpacingForLayout:"];
      }
      double v65 = v60;
    }
    else
    {
      if (v71) {
        int v64 = 1;
      }
      else {
        int v64 = v56;
      }
      if (v64 | v55) {
        double v65 = 0.0;
      }
      else {
        double v65 = 1.0;
      }
    }
    [v63 setAlpha:v65];
    PXFloatSaturate();
  }

  [(PXGLayout *)self displayScale];
  PXFloatRoundToPixel();
}

- (CGSize)_scaleForLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXZoomablePhotosLayout *)self viewModel];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  if (v5) {
    objc_msgSend(v5, "zoomState", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }
  uint64_t v6 = -[NSArray objectAtIndexedSubscript:](self->_itemLayouts, "objectAtIndexedSubscript:", 0, v8, v9, v10, v11);
  objc_super v7 = [(NSArray *)self->_itemLayouts objectAtIndexedSubscript:0];
  [v6 numberOfColumns];
  [v6 rowHeight];
  [v7 numberOfColumns];
  [v7 rowHeight];
  PXSizeByLinearlyInterpolatingSize();
}

- (void)_configureLayout:(id)a3
{
  id v54 = a3;
  id v4 = [(PXZoomablePhotosLayout *)self spec];
  uint64_t v5 = [v54 numberOfColumns];
  uint64_t v6 = [v4 maxColumnsForIndividualItems];
  uint64_t v7 = [v4 userInterfaceIdiom];
  [(PXZoomablePhotosLayout *)self _interItemSpacingForLayout:v54];
  double v9 = v8;
  BOOL v10 = [(PXZoomablePhotosLayout *)self _layoutIsAspectFit:v54];
  double v14 = 0.0;
  if (v5 <= v6)
  {
    if (v10) {
      objc_msgSend(v4, "aspectFitItemCornerRadius", 0.0);
    }
    else {
      objc_msgSend(v4, "itemCornerRadius", 0.0);
    }
  }
  *(float *)&double v14 = v14;
  LODWORD(v11) = LODWORD(v14);
  LODWORD(v12) = LODWORD(v14);
  LODWORD(v13) = LODWORD(v14);
  objc_msgSend(v54, "setItemCornerRadius:", v14, v11, v12, v13);
  [v4 itemAspectRatio];
  objc_msgSend(v54, "setItemAspectRatio:");
  BOOL v15 = [(PXZoomablePhotosLayout *)self viewModel];
  int v16 = [v15 isFaceModeEnabled];

  uint64_t v17 = [v54 numberOfColumns];
  if (v10)
  {
    if (v16) {
      BOOL v18 = v17 <= [v4 maxColumnsForSaliency];
    }
    else {
      BOOL v18 = 0;
    }
    [v4 aspectFitEdgeMargins];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    uint64_t v27 = 1;
  }
  else
  {
    BOOL v18 = ((v16 & 1) != 0 || [v4 useSaliency])
       && v17 <= [v4 maxColumnsForSaliency];
    if (v7 == 4 && v5 > v6)
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      double v20 = *(double *)off_1E5DAAF10;
      double v22 = *((double *)off_1E5DAAF10 + 1);
      double v24 = *((double *)off_1E5DAAF10 + 2);
      double v26 = *((double *)off_1E5DAAF10 + 3);
      goto LABEL_21;
    }
    [v4 squareEdgeMargins];
    double v20 = v29;
    double v22 = v30;
    double v24 = v31;
    double v26 = v32;
    uint64_t v27 = 0;
  }
  if (v7 == 4) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = [(PXZoomablePhotosLayout *)self preventFillingTopAreaInsets] ^ 1;
  }
LABEL_21:
  if (v5 <= v6)
  {
    [(PXZoomablePhotosLayout *)self effectiveOverlayInsets];
    PXEdgeInsetsAdd();
  }
  if ([v54 supportsContentMode]) {
    [v54 setContentMode:v27];
  }
  if (v5 > v6)
  {
    [v54 setEnablePerItemCornerRadius:0];
    [v54 setEnablePerItemInsets:0];
    v34 = [(PXZoomablePhotosLayout *)self effectProvider];
    [v54 setEnableEffects:v34 != 0];
  }
  else
  {
    uint64_t v33 = [(PXZoomablePhotosLayout *)self burstStackEffect];
    [v33 setNumberOfItemsStackedBehind:2];

    [v54 setEnablePerItemCornerRadius:1];
    [v54 setEnablePerItemInsets:1];
    [v54 setEnableEffects:1];
  }
  [v54 setHideIncompleteLastRowOrColumn:v5 > v6];
  [v54 setEnableBestCropRect:v18];
  objc_msgSend(v54, "setInterItemSpacing:", v9, v9);
  [(PXZoomablePhotosLayout *)self _itemCaptionSpacingForLayout:v54];
  objc_msgSend(v54, "setItemCaptionSpacing:");
  objc_msgSend(v54, "setPadding:", v20, v22, v24, v26);
  [v54 setFillSafeAreaTopInset:v28];
  if (v7 == 4) {
    uint64_t v35 = 2;
  }
  else {
    uint64_t v35 = 1;
  }
  [v54 setDropTargetStyle:v35];
  v36 = [(PXZoomablePhotosLayout *)self viewModel];
  v37 = [v36 dropTargetAssetReference];
  [v54 setDropTargetObjectReference:v37];

  [v54 setAccessoryItemContentSource:self];
  BOOL v38 = [(PXZoomablePhotosLayout *)self enableAddContentAccessoryItem];
  BOOL v39 = v5 <= v6 && v38;
  [v54 setNumberOfAccessoryItems:v39];
  int64_t v40 = [off_1E5DA9658 sharedInstance];
  int v41 = [v40 enableTungstenKeyboardNavigation];

  if (v41)
  {
    CGRect v42 = +[PXKeyboardSettings sharedInstance];
    uint64_t v43 = v42;
    if (v10)
    {
      uint64_t v44 = [v42 allPhotosAspectFitFocusAnimationStyle];
      [v43 allPhotosAspectFitFocusPadding];
    }
    else
    {
      uint64_t v44 = [v42 allPhotosAspectFillFocusAnimationStyle];
      [v43 allPhotosAspectFillFocusPadding];
    }
    objc_msgSend(v54, "setAnimationParameters:forStylableType:", v44, v45, 1);
    v46 = +[PXCursorInteractionSettings sharedInstance];
    v47 = v46;
    if (v10)
    {
      uint64_t v48 = [v46 aspectFitAnimationStyle];
      [v47 allPhotosAspectFitPadding];
    }
    else
    {
      uint64_t v48 = [v46 aspectFillAnimationStyle];
      [v47 allPhotosAspectFillPadding];
    }
    objc_msgSend(v54, "setAnimationParameters:forStylableType:", v48, v49, 0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v50 = 2 * (v5 <= v6);
    id v51 = v54;
    [v51 setStyle:v50];
    uint64_t v52 = [v51 axGroup];

    objc_msgSend(v52, "setAxRole:", -[PXZoomablePhotosLayout bodyLayoutAXGroupRole](self, "bodyLayoutAXGroupRole"));
    if (v7 == 4) {
      uint64_t v53 = 9;
    }
    else {
      uint64_t v53 = 0;
    }
    objc_msgSend(v52, "setLeafFeatures:", objc_msgSend(v52, "leafFeatures") | v53);
  }
}

- (double)_interItemSpacingForLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXZoomablePhotosLayout *)self spec];
  BOOL v6 = [(PXZoomablePhotosLayout *)self _layoutIsAspectFit:v4];
  BOOL v7 = [(PXZoomablePhotosLayout *)self _layoutHasIndividualItems:v4];

  if (v6)
  {
    if (v7) {
      [v5 aspectFitInteritemSpacing];
    }
  }
  else if (v7)
  {
    [v5 interitemSpacing];
  }
  [(PXGLayout *)self displayScale];
  PXFloatRoundToPixel();
}

- (BOOL)_layoutIsAspectFit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXZoomablePhotosLayout *)self viewModel];
  if ([v5 aspectFit]
    && [(PXZoomablePhotosLayout *)self _layoutHasIndividualItems:v4])
  {
    char v6 = [v4 supportsContentMode];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_layoutHasIndividualItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXZoomablePhotosLayout *)self spec];
  uint64_t v6 = [v4 numberOfColumns];

  LOBYTE(v4) = v6 <= [v5 maxColumnsForIndividualItems];
  return (char)v4;
}

- (PXZoomablePhotosLayoutSpec)spec
{
  return self->_spec;
}

- (UIEdgeInsets)effectiveOverlayInsets
{
  double top = self->_effectiveOverlayInsets.top;
  double left = self->_effectiveOverlayInsets.left;
  double bottom = self->_effectiveOverlayInsets.bottom;
  double right = self->_effectiveOverlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)preventFillingTopAreaInsets
{
  return self->_preventFillingTopAreaInsets;
}

- (BOOL)enableAddContentAccessoryItem
{
  return self->_enableAddContentAccessoryItem;
}

- (double)_itemCaptionSpacingForLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXZoomablePhotosLayout *)self viewModel];
  double v6 = 0.0;
  if ([v5 captionsVisible]
    && ([(PXZoomablePhotosLayout *)self _layoutIsAspectFit:v4]
     || [(PXZoomablePhotosLayout *)self _layoutAllowsCaptionsInSquare:v4]))
  {
    BOOL v7 = [(PXZoomablePhotosLayout *)self spec];
    [v7 captionSpacing];
    double v6 = v8;
  }
  return v6;
}

- (unint64_t)contentChangeTrend
{
  long long v7 = 0u;
  long long v6 = 0u;
  objc_super v3 = [(PXZoomablePhotosLayout *)self viewModel];
  id v4 = v3;
  if (v3)
  {
    [v3 zoomState];
  }
  else
  {
    long long v7 = 0u;
    long long v6 = 0u;
  }

  if (![(PXZoomablePhotosLayout *)self isAnimating]) {
    return 0;
  }
  if (BYTE9(v7)) {
    return 3;
  }
  if (*((double *)&v6 + 1) > 0.0) {
    return 1;
  }
  return 2;
}

- (BOOL)isAnimating
{
  id v2 = [(PXZoomablePhotosLayout *)self viewModel];
  objc_super v3 = v2;
  if (v2)
  {
    [v2 zoomState];
    BOOL v4 = v6 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (int64_t)bodyLayoutAXGroupRole
{
  return self->_bodyLayoutAXGroupRole;
}

- (PXAssetReference)anchorAssetReference
{
  return self->__anchorAssetReference;
}

void __53__PXZoomablePhotosLayout__updateDecorationVisibility__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_super v3 = [v8 decoratingLayout];
  id v4 = *(id *)(a1 + 32);
  [v3 alpha];
  double v6 = v5;
  double v7 = *(double *)(a1 + 40);
  if (v6 != v7)
  {
    double v7 = 0.0;
    if (v4 == v8) {
      double v7 = *(double *)(a1 + 48);
    }
  }
  [v3 setAlpha:v7];
  [v3 alpha];
  PXFloatApproximatelyEqualToFloat();
}

- (PXGBurstStackEffect)burstStackEffect
{
  burstStackEffect = [(PXGBurstStackEffect *)self->_burstStackEffect entityManager];
  uint64_t v4 = [(PXGLayout *)self entityManager];
  if (burstStackEffect == (void *)v4)
  {
    id v8 = burstStackEffect;
  }
  else
  {
    double v5 = (void *)v4;
    double v6 = [(PXGLayout *)self entityManager];

    if (!v6) {
      goto LABEL_6;
    }
    id v7 = objc_alloc((Class)off_1E5DA66D8);
    id v8 = [(PXGLayout *)self entityManager];
    double v9 = (PXGBurstStackEffect *)[v7 initWithEntityManager:v8];
    burstStackEffect = self->_burstStackEffect;
    self->_burstStackEffect = v9;
  }

LABEL_6:
  BOOL v10 = self->_burstStackEffect;
  return v10;
}

- (BOOL)_layoutIsQuiteTransparent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXZoomablePhotosLayout *)self _layoutIsAspectFit:v4];
  [v4 itemCornerRadius];
  float v7 = v6;
  float v9 = v8;
  float v11 = v10;
  float v13 = v12;

  return fmaxf(fmaxf(v7, v9), fmaxf(v11, v13)) >= 3.0 || v5;
}

- (CGPoint)scaleCenterTargetInViewport
{
  double x = self->_scaleCenterTargetInViewport.x;
  double y = self->_scaleCenterTargetInViewport.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_updateLayers
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = [(PXZoomablePhotosLayout *)self viewModel];
  BOOL v5 = [v4 allowedColumns];

  layers = self->_layers;
  float v7 = "TTRWorkflowBuilder";
  if (layers)
  {
    uint64_t v8 = [(NSArray *)layers count];
    if (v8 == [v5 count]) {
      goto LABEL_32;
    }
    SEL v43 = a2;
    layers = self->_layers;
  }
  else
  {
    SEL v43 = a2;
  }
  uint64_t v44 = v5;
  float v9 = (void *)[(NSArray *)layers mutableCopy];
  float v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  float v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  float v12 = [(PXZoomablePhotosLayout *)self viewModel];
  float v13 = [v12 allowedColumns];

  id obj = v13;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v14) {
    goto LABEL_31;
  }
  uint64_t v15 = v14;
  uint64_t v46 = *(void *)v53;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v53 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = [*(id *)(*((void *)&v52 + 1) + 8 * v16) integerValue];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __39__PXZoomablePhotosLayout__updateLayers__block_invoke;
      v51[3] = &__block_descriptor_40_e26_B32__0__PXGLayout_8Q16_B24l;
      v51[4] = v17;
      objc_msgSend(v9, "px_popFirstPassingTest:", v51);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        id v18 = [(PXZoomablePhotosLayout *)self _createLayoutWithNumberOfColumns:v17];
      }
      BOOL v19 = [(PXZoomablePhotosLayout *)self _wantsDecorationForNumberOfColumns:v17];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (!v19 || (isKindOfClass & 1) != 0)
      {
        if (v19 || (isKindOfClass & 1) == 0)
        {
          if ((isKindOfClass & 1) == 0) {
            goto LABEL_25;
          }
          goto LABEL_16;
        }
        id v25 = v18;
        if (v25)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
LABEL_24:
            id v18 = [v25 decoratedLayout];

            [v18 removeFromSuperlayout];
            goto LABEL_25;
          }
          uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
          double v30 = (objc_class *)objc_opt_class();
          double v29 = NSStringFromClass(v30);
          CGRect v42 = objc_msgSend(v25, "px_descriptionForAssertionMessage");
          [v27 handleFailureInMethod:v43, self, @"PXZoomablePhotosLayout.m", 1279, @"%@ should be an instance inheriting from %@, but it is %@", @"layerToAdd", v29, v42 object file lineNumber description];
        }
        else
        {
          uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v28 = (objc_class *)objc_opt_class();
          double v29 = NSStringFromClass(v28);
          [v27 handleFailureInMethod:v43, self, @"PXZoomablePhotosLayout.m", 1279, @"%@ should be an instance inheriting from %@, but it is nil", @"layerToAdd", v29 object file lineNumber description];
        }

        goto LABEL_24;
      }
      [v18 removeFromSuperlayout];
      double v21 = [[PXGDecoratingLayout alloc] initWithDecoratedLayout:v18];
      [(PXGDecoratingLayout *)v21 setDecorationSource:self->_assetDecorationSource];
      [(PXGDecoratingLayout *)v21 setContentSource:self->_assetDecorationSource];
      [(PXGDecoratingLayout *)v21 setAppliesAlphaToSublayouts:0];

      id v18 = v21;
LABEL_16:
      BOOL v22 = [(PXZoomablePhotosLayout *)self _wantsMiniDecorationForNumberOfColumns:v17];
      id v18 = v18;
      [v18 setDecorationSizeClass:v22];
      double v23 = [(PXZoomablePhotosLayout *)self viewModel];
      int v24 = [v23 wantsAssetIndexBadge];

      if (v24) {
        [v18 addActiveDecorations:&unk_1F02D40C0];
      }

LABEL_25:
      [(NSArray *)v10 addObject:v18];
      double v26 = [v18 itemsLayout];
      [(NSArray *)v11 addObject:v26];

      ++v16;
    }
    while (v15 != v16);
    uint64_t v31 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    uint64_t v15 = v31;
  }
  while (v31);
LABEL_31:

  double v32 = self->_layers;
  self->_layers = v10;
  uint64_t v33 = v10;

  v34 = v9;
  itemLayouts = self->_itemLayouts;
  self->_itemLayouts = v11;
  v36 = v11;

  PXZoomablePhotosInvalidate(self, 16);
  v37 = self->_itemLayoutByHeaderLevel[0];
  self->_itemLayoutByHeaderLevel[0] = 0;

  BOOL v38 = self->_itemLayoutByHeaderLevel[1];
  self->_itemLayoutByHeaderLevel[1] = 0;

  decadesItemLayout = self->_decadesItemLayout;
  self->_decadesItemLayout = 0;

  v50[0] = MEMORY[0x1E4F143A8];
  float v7 = "TTRWorkflowBuilder";
  v50[1] = 3221225472;
  v50[2] = __39__PXZoomablePhotosLayout__updateLayers__block_invoke_353;
  v50[3] = &unk_1E5DB8090;
  v50[4] = self;
  [(NSArray *)v36 enumerateObjectsUsingBlock:v50];

  BOOL v5 = v44;
LABEL_32:
  int64_t v40 = self->_itemLayouts;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = *((void *)v7 + 415);
  v47[2] = __39__PXZoomablePhotosLayout__updateLayers__block_invoke_2;
  v47[3] = &unk_1E5DB80B8;
  id v48 = v5;
  uint64_t v49 = self;
  id v41 = v5;
  [(NSArray *)v40 enumerateObjectsUsingBlock:v47];
  PXZoomablePhotosInvalidate(self, 96);
}

- (BOOL)_wantsDecorationForNumberOfColumns:(int64_t)a3
{
  id v4 = [(PXZoomablePhotosLayout *)self spec];
  int64_t v5 = [v4 maxColumnsForBadges];

  float v6 = +[PXZoomablePhotosSettings sharedInstance];
  char v7 = [v6 enableBadges];
  if (v5 >= a3) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_wantsMiniDecorationForNumberOfColumns:(int64_t)a3
{
  id v4 = [(PXZoomablePhotosLayout *)self spec];
  int64_t v5 = [v4 minColumnsForMiniBadges];

  return v5 <= a3;
}

float __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke_2(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  CGFloat v9 = *(double *)(a1 + 48);
  CGFloat v10 = *(double *)(a1 + 56);
  CGFloat v11 = *(double *)(a1 + 64);
  CGFloat v12 = *(double *)(a1 + 72);
  v20.origin.double x = v9;
  v20.origin.double y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  CGFloat MidX = CGRectGetMidX(v20);
  v21.origin.double x = v9;
  v21.origin.double y = v10;
  v21.size.width = v11;
  v21.size.height = v12;
  CGFloat MidY = CGRectGetMidY(v21);
  v22.origin.double x = v9;
  v22.origin.double y = v10;
  v22.size.width = v11;
  v22.size.height = v12;
  CGFloat Width = CGRectGetWidth(v22);
  v23.origin.double x = v9;
  v23.origin.double y = v10;
  v23.size.width = v11;
  v23.size.height = v12;
  CGFloat Height = CGRectGetHeight(v23);
  v16.f64[0] = Width;
  v16.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = 0;
  a3[3] = vcvt_f32_f64(v16);
  *(double *)&a3[2] = *(double *)(a1 + 128) + 10.0;
  *(_DWORD *)(a4 + 52) = -1046478848;
  [*(id *)(a1 + 32) alpha];
  float result = v17;
  *(float *)a4 = result;
  *(_WORD *)(a5 + 32) = *(_DWORD *)(*(void *)(a1 + 40) + 1112);
  return result;
}

void __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke_380(uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4)
{
  for (unint64_t i = HIDWORD(a2); i; --i)
  {
    *a4 = 0;
    a4 += 40;
  }
}

void __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_3(uint64_t a1, uint64_t a2, float32x2_t *a3, float *a4)
{
  [*(id *)(a1 + 32) visibleRect];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v16 = CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v13 = CGRectGetHeight(v20);
  v14.f64[0] = v16;
  v14.f64[1] = v13;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[3] = vcvt_f32_f64(v14);
  a3[2] = (float32x2_t)0xBFE0000000000000;
  float v15 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    float v15 = 0.0;
  }
  *a4 = v15;
}

void __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    int64_t v5 = (_OWORD *)a3[3];
    uint64_t v4 = a3[4];
    float v6 = (_OWORD *)a3[2];
    long long v7 = *(_OWORD *)off_1E5DAAF70;
    long long v8 = *((_OWORD *)off_1E5DAAF70 + 1);
    long long v9 = *(_OWORD *)off_1E5DAAF90;
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v12 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v14 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v13 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v16 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v15 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v18 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v17 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v19 = *(_OWORD *)off_1E5DAAF88;
    long long v20 = *((_OWORD *)off_1E5DAAF88 + 1);
    __asm { FMOV            V22.2S, #1.0 }
    uint64_t v26 = *((void *)off_1E5DAAF88 + 4);
    do
    {
      *float v6 = v7;
      v6[1] = v8;
      v6 += 2;
      *int64_t v5 = v9;
      v5[1] = v10;
      v5[4] = v12;
      v5[5] = v11;
      v5[2] = v14;
      v5[3] = v13;
      v5[8] = v16;
      v5[9] = v15;
      v5[6] = v18;
      v5[7] = v17;
      *(void *)(v4 + 32) = v26;
      *(_OWORD *)uint64_t v4 = v19;
      *(_OWORD *)(v4 + 16) = v20;
      v5 += 10;
      *(unsigned char *)(v4 + 1) = 5;
      *(void *)(v4 + 8) = _D22;
      v4 += 40;
      --v3;
    }
    while (v3);
  }
}

void __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(_OWORD **)(a3 + 16);
  long long v5 = *((_OWORD *)off_1E5DAAF70 + 1);
  *uint64_t v4 = *(_OWORD *)off_1E5DAAF70;
  v4[1] = v5;
  float v6 = *(_OWORD **)(a3 + 24);
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 1);
  *float v6 = *(_OWORD *)off_1E5DAAF90;
  v6[1] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 5);
  v6[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v6[5] = v8;
  long long v9 = *((_OWORD *)off_1E5DAAF90 + 3);
  v6[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v6[3] = v9;
  long long v10 = *((_OWORD *)off_1E5DAAF90 + 9);
  v6[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v6[9] = v10;
  long long v11 = *((_OWORD *)off_1E5DAAF90 + 7);
  v6[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v6[7] = v11;
  uint64_t v12 = *(void *)(a3 + 32);
  *(void *)(v12 + 32) = *((void *)off_1E5DAAF88 + 4);
  long long v13 = *((_OWORD *)off_1E5DAAF88 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)off_1E5DAAF88;
  *(_OWORD *)(v12 + 16) = v13;
  *(unsigned char *)(*(void *)(a3 + 32) + 1) = 9;
  int v14 = **(_DWORD **)(a3 + 8);
  long long v15 = [*(id *)(a1 + 32) entityManager];
  long long v16 = [v15 effectComponent];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_2;
  v17[3] = &unk_1E5DC5C50;
  int v18 = v14;
  v17[4] = *(void *)(a1 + 32);
  [v16 performChanges:v17];
}

- (void)entityManagerDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGLayout *)&v4 entityManagerDidChange];
  PXZoomablePhotosInvalidate(self, 917504);
  unint64_t v3 = [(PXGLayout *)self entityManager];

  if (v3) {
    PXZoomablePhotosInvalidate(self, 2);
  }
}

uint64_t __37__PXZoomablePhotosLayout__updateZoom__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setLayoutExtendsContentBelowBounds:*(unsigned __int8 *)(a1 + 32)];
}

- (id)_createLayoutWithNumberOfColumns:(int64_t)a3
{
  long long v5 = +[PXZoomablePhotosSettings sharedInstance];
  int v6 = [v5 enableDebugLayers];

  if (v6) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 2;
  }
  if (a3 == 1)
  {
    long long v8 = objc_alloc_init(PXGOneColumnLayout);
    [(PXGOneColumnLayout *)v8 setMediaKind:v7];
    [(PXGOneColumnLayout *)v8 setOverrideAspectRatioAmount:0.0];
    objc_storeStrong((id *)&self->_oneColLayout, v8);
  }
  else
  {
    long long v8 = objc_alloc_init(PXGGridLayout);
    [(PXGOneColumnLayout *)v8 setMediaKind:v7];
    [(PXGItemsLayout *)v8 setLazy:1];
    [(PXGOneColumnLayout *)v8 setMediaTargetSizeIgnoresSpacing:1];
    [(PXGOneColumnLayout *)v8 setCanHandleVisibleRectRejection:1];
    [(PXGOneColumnLayout *)v8 setAccessoryMediaKind:10];
    [(PXGOneColumnLayout *)v8 setAccessoryPresentationType:1];
  }
  [(PXGOneColumnLayout *)v8 setNumberOfColumns:a3];
  [(PXGLayout *)v8 setContentSource:self];
  [(PXGItemsLayout *)v8 setNumberOfItems:[(PXAssetsDataSource *)self->_currentDataSource numberOfItemsInSection:0]];
  [(PXGItemsLayout *)v8 setDelegate:self];
  [(PXZoomablePhotosLayout *)self _configureLayout:v8];
  return v8;
}

void __39__PXZoomablePhotosLayout__updateLayers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = *(void **)(a1 + 32);
  id v7 = a2;
  int v6 = [v5 objectAtIndexedSubscript:a3];
  objc_msgSend(v7, "setNumberOfColumns:", objc_msgSend(v6, "integerValue"));

  [*(id *)(a1 + 40) _configureLayout:v7];
}

- (void)_updateDecorationSource
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PXZoomablePhotosLayout *)self viewModel];
  objc_super v4 = self->_assetDecorationSource;
  -[PXPhotosGridAssetDecorationSource setIsInSelectMode:](v4, "setIsInSelectMode:", [v3 isInSelectMode]);
  long long v5 = [v3 selectionSnapshot];
  [(PXPhotosGridAssetDecorationSource *)v4 setSelectionSnapshot:v5];

  int v6 = [v3 draggedAssetReferences];
  [(PXPhotosGridAssetDecorationSource *)v4 setDraggedAssetReferences:v6];

  -[PXPhotosGridAssetDecorationSource setDurationAlwaysHidden:](v4, "setDurationAlwaysHidden:", [v3 viewBasedDecorationsEnabled]);
  -[PXPhotosGridAssetDecorationSource setForbiddenBadges:](v4, "setForbiddenBadges:", [v3 viewBasedDecorationsEnabled] << 63 >> 63);
  if ([v3 alwaysShowTopBadges]) {
    [(PXPhotosGridAssetDecorationSource *)v4 setForbiddenBadges:[(PXPhotosGridAssetDecorationSource *)v4 forbiddenBadges] & 0xFFFFFFDFFFFFFFFFLL];
  }
  if ([v3 wantsAssetIndexBadge]) {
    [(PXPhotosGridAssetDecorationSource *)v4 setForbiddenBadges:[(PXPhotosGridAssetDecorationSource *)v4 forbiddenBadges] & 0xFFFFDFFFFFFFFFFFLL];
  }
  -[PXPhotosGridAssetDecorationSource setWantsDimmedSelectionStyle:](v4, "setWantsDimmedSelectionStyle:", [v3 wantsDimmedSelectionStyle]);
  -[PXPhotosGridAssetDecorationSource setWantsNumberedSelectionStyle:](v4, "setWantsNumberedSelectionStyle:", [v3 wantsNumberedSelectionStyle]);
  -[PXPhotosGridAssetDecorationSource setWantsFileSizeBadge:](v4, "setWantsFileSizeBadge:", [v3 wantsFileSizeBadge]);
  -[PXPhotosGridAssetDecorationSource setWantsAssetIndexBadge:](v4, "setWantsAssetIndexBadge:", [v3 wantsAssetIndexBadge]);
  [(PXPhotosGridAssetDecorationSource *)v4 setWantsSharedLibraryDecorations:[(PXAssetsDataSource *)self->_currentDataSource libraryFilter] != 1];
  id v7 = [(PXAssetsDataSource *)self->_currentDataSource containerCollection];
  -[PXPhotosGridAssetDecorationSource setWantsStacksDecorations:](v4, "setWantsStacksDecorations:", objc_msgSend(v7, "px_isAllPhotosSmartAlbum"));

  long long v8 = +[PXPhotosGridSettings sharedInstance];
  -[PXPhotosGridAssetDecorationSource setEnableDebugDecoration:](v4, "setEnableDebugDecoration:", [v8 enableStacksReviewUI]);

  long long v9 = [(PXGZoomLayout *)self->_zoomLayout primaryLayer];
  long long v10 = [v9 itemsLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v11 = v10;
  }
  else {
    long long v11 = 0;
  }
  [(PXPhotosGridAssetDecorationSource *)v4 setDecoratedLayout:v11];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_itemLayouts;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "invalidateDecoration", (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    id v8 = [v7 keyAssetReference];
  }
  long long v9 = v8;
  if (!v8) {
    goto LABEL_15;
  }
  if (v5)
  {
    long long v10 = [(PXAssetsDataSource *)self->_currentDataSource objectReferenceNearestToObjectReference:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      if (!v10) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
  long long v10 = v9;
LABEL_12:
  currentDataSource = self->_currentDataSource;
  if (currentDataSource) {
    [(PXAssetsDataSource *)currentDataSource indexPathForAssetReference:v10];
  }

LABEL_15:
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)update
{
  self->_isPerformingUpdate = 1;
  p_preUpdateFlags = &self->_preUpdateFlags;
  self->_preUpdateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_preUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_preUpdateFlags.isPerformingUpdate)
    {
      uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v28 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v27 handleFailureInFunction:v28, @"PXZoomablePhotosLayout.m", 1111, @"Invalid parameter not satisfying: %@", @"!_preUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_preUpdateFlags->needsUpdate;
    }
    p_preUpdateFlags->isPerformingUpdate = 1;
    p_preUpdateFlags->updated = 1;
    if (needsUpdate)
    {
      p_preUpdateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      char v5 = [(PXZoomablePhotosLayout *)self viewModel];
      int v6 = [v5 specManager];
      id v7 = [v6 spec];
      [(PXZoomablePhotosLayout *)self setSpec:v7];

      if (!p_preUpdateFlags->isPerformingUpdate)
      {
        double v61 = [MEMORY[0x1E4F28B00] currentHandler];
        double v62 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
        [v61 handleFailureInFunction:v62, @"PXZoomablePhotosLayout.m", 1117, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v8 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 2uLL;
    if ((v8 & 2) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXZoomablePhotosLayout *)self _updateEffectProvider];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      double v29 = [MEMORY[0x1E4F28B00] currentHandler];
      double v30 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v29 handleFailureInFunction:v30, @"PXZoomablePhotosLayout.m", 1121, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 4uLL;
    if ((v9 & 4) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXZoomablePhotosLayout *)self _updateEffectiveOverlayInsets];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      double v32 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v31 handleFailureInFunction:v32, @"PXZoomablePhotosLayout.m", 1125, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 8uLL;
    if ((v10 & 8) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFF7;
      [(PXZoomablePhotosLayout *)self _updateLayers];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
      v34 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v33 handleFailureInFunction:v34, @"PXZoomablePhotosLayout.m", 1129, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v11 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x10uLL;
    if ((v11 & 0x10) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXZoomablePhotosLayout *)self _updateZoom];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
      v36 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v35 handleFailureInFunction:v36, @"PXZoomablePhotosLayout.m", 1133, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v12 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x20uLL;
    if ((v12 & 0x20) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXZoomablePhotosLayout *)self _updateMiniMode];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v38 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v37 handleFailureInFunction:v38, @"PXZoomablePhotosLayout.m", 1137, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v13 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x40uLL;
    if ((v13 & 0x40) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v13 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXZoomablePhotosLayout *)self _updateDecorationVisibility];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      BOOL v39 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v40 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v39 handleFailureInFunction:v40, @"PXZoomablePhotosLayout.m", 1141, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v14 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x80uLL;
    if ((v14 & 0x80) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v14 & 0xFFFFFFFFFFFFFF7FLL;
      [(PXZoomablePhotosLayout *)self _updateDataSource];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      id v41 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v42 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v41 handleFailureInFunction:v42, @"PXZoomablePhotosLayout.m", 1145, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v15 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x100uLL;
    if ((v15 & 0x100) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v15 & 0xFFFFFFFFFFFFFEFFLL;
      [(PXZoomablePhotosLayout *)self _updateVisualShifting];
    }
    if (!p_preUpdateFlags->isPerformingUpdate)
    {
      SEL v43 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v44 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v43 handleFailureInFunction:v44, @"PXZoomablePhotosLayout.m", 1149, @"Invalid parameter not satisfying: %@", @"_preUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v16 = p_preUpdateFlags->needsUpdate;
    p_preUpdateFlags->updated |= 0x200uLL;
    if ((v16 & 0x200) != 0)
    {
      p_preUpdateFlags->unint64_t needsUpdate = v16 & 0xFFFFFFFFFFFFFDFFLL;
      [(PXZoomablePhotosLayout *)self _updateDecorationSource];
    }
    objc_storeStrong((id *)&self->_presentedDataSource, self->_currentDataSource);
    p_preUpdateFlags->isPerformingUpdate = 0;
    if (p_preUpdateFlags->needsUpdate)
    {
      uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v46 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"PXZoomablePhotosLayout.m", 1155, @"still needing to update %lu after update pass", p_preUpdateFlags->needsUpdate);
    }
  }
  v65.receiver = self;
  v65.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGSplitLayout *)&v65 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  unint64_t v18 = self->_postUpdateFlags.needsUpdate;
  if (v18)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      v47 = [MEMORY[0x1E4F28B00] currentHandler];
      id v48 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v47 handleFailureInFunction:v48, @"PXZoomablePhotosLayout.m", 1160, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v18 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0x10000;
    if ((v18 & 0x10000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v18 & 0xFFFFFFFFFFFEFFFFLL;
      [(PXZoomablePhotosLayout *)self _updateZoomTransforms];
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        v63 = [MEMORY[0x1E4F28B00] currentHandler];
        int v64 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
        [v63 handleFailureInFunction:v64, @"PXZoomablePhotosLayout.m", 1165, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v19 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x20000uLL;
    if ((v19 & 0x20000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v19 & 0xFFFFFFFFFFFDFFFFLL;
      [(PXZoomablePhotosLayout *)self _updateBackgroundSprites];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v50 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v49 handleFailureInFunction:v50, @"PXZoomablePhotosLayout.m", 1169, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v20 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x40000uLL;
    if ((v20 & 0x40000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v20 & 0xFFFFFFFFFFFBFFFFLL;
      [(PXZoomablePhotosLayout *)self _updateBlurEffect];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      id v51 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v52 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v51 handleFailureInFunction:v52, @"PXZoomablePhotosLayout.m", 1173, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v21 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x80000uLL;
    if ((v21 & 0x80000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v21 & 0xFFFFFFFFFFF7FFFFLL;
      [(PXZoomablePhotosLayout *)self _updatePinchEffect];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      long long v53 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v54 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v53 handleFailureInFunction:v54, @"PXZoomablePhotosLayout.m", 1177, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v22 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x100000uLL;
    if ((v22 & 0x100000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v22 & 0xFFFFFFFFFFEFFFFFLL;
      [(PXZoomablePhotosLayout *)self _updatePrefetching];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      long long v55 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v56 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v55 handleFailureInFunction:v56, @"PXZoomablePhotosLayout.m", 1181, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v23 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x200000uLL;
    if ((v23 & 0x200000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v23 & 0xFFFFFFFFFFDFFFFFLL;
      [(PXZoomablePhotosLayout *)self _updateFloatingHeaderStyle];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
      double v58 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
      [v57 handleFailureInFunction:v58, @"PXZoomablePhotosLayout.m", 1185, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v24 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400000uLL;
    if ((v24 & 0x400000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v24 & 0xFFFFFFFFFFBFFFFFLL;
    }
    else
    {
      id v25 = +[PXZoomablePhotosSettings sharedInstance];
      int v26 = [v25 enableDebugSprites];

      if (!v26)
      {
LABEL_74:
        self->_postUpdateFlags.isPerformingUpdate = 0;
        if (p_postUpdateFlags->needsUpdate)
        {
          double v59 = [MEMORY[0x1E4F28B00] currentHandler];
          double v60 = [NSString stringWithUTF8String:"-[PXZoomablePhotosLayout update]"];
          objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, @"PXZoomablePhotosLayout.m", 1189, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
        }
        goto LABEL_76;
      }
    }
    [(PXZoomablePhotosLayout *)self _updateDebugVisualizationSprites];
    goto LABEL_74;
  }
LABEL_76:
  self->_isPerformingUpdate = 0;
}

- (void)_updatePrefetching
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[PXZoomablePhotosSettings sharedInstance];
  v37 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  uint64_t v4 = [v37 loadedItems];
  NSUInteger v6 = v4;
  NSUInteger v7 = v5;
  p_prefetchedForLoadedItems = &self->_prefetchedForLoadedItems;
  BOOL v10 = v5 == self->_prefetchedForLoadedItems.length && v4 == self->_prefetchedForLoadedItems.location || v5 == 0;
  BOOL v38 = self;
  if (!v10)
  {
    BOOL v11 = [(PXZoomablePhotosLayout *)self _layoutHasIndividualItems:v37];
    uint64_t v12 = (v6 - (v7 >> 1)) & ~((uint64_t)(v6 - (v7 >> 1)) >> 63);
    uint64_t v13 = [v37 numberOfItems] - 1;
    if (v13 >= (uint64_t)(v7 + v6 + (v7 >> 1) - 1)) {
      uint64_t v13 = v7 + v6 + (v7 >> 1) - 1;
    }
    unint64_t v14 = v3;
    uint64_t v15 = v13 - v12 + 1;
    unint64_t v16 = (void *)MEMORY[0x1E4F28D60];
    long long v17 = self->_currentDataSource;
    unint64_t v18 = objc_msgSend(v16, "indexSetWithIndexesInRange:", v12, v15);
    unint64_t v19 = objc_msgSend(off_1E5DA6F50, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v18, -[PXAssetsDataSource identifier](v17, "identifier"), 0);

    [(PXAssetsDataSource *)v17 prefetchIndexPaths:v19 level:!v11];
    p_prefetchedForLoadedItems->unsigned int location = v6;
    p_prefetchedForLoadedItems->length = v7;

    self = v38;
    unint64_t v3 = v14;
  }
  if ([(PXGLayout *)self scrollSpeedRegime]) {
    int v20 = 0;
  }
  else {
    int v20 = ![(PXZoomablePhotosLayout *)self isAnimating];
  }
  if ([v3 preheatThumbnailsWhenIdle]) {
    BOOL v21 = v7 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    [v37 numberOfColumns];
    [(PXGLayout *)v38 referenceSize];
    [(PXGLayout *)v38 displayScale];
    PXSizeScale();
  }
  if ([v3 preheatDenserZoomLevels]) {
    int v22 = v20;
  }
  else {
    int v22 = 0;
  }
  if (v22 == 1 && v7 != 0)
  {
    unint64_t v24 = [(PXZoomablePhotosLayout *)v38 viewModel];
    int v25 = [v24 isInteractiveZoomingAllowed];

    if (v25)
    {
      int v26 = v38;
      uint64_t v27 = [(PXZoomablePhotosLayout *)v38 presentedDataSource];
      long long v46 = xmmword_1AB359AA0;
      uint64_t v45 = [v27 identifier];
      uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
      v36 = [v27 assetsInSectionIndexPath:&v45];
      [(PXGLayout *)v38 referenceSize];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v38->_itemLayouts;
      uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v40 = *(void *)v42;
        uint64_t v30 = -1;
        do
        {
          uint64_t v31 = 0;
          double v32 = (char *)v26 + 16 * v30;
          do
          {
            if (*(void *)v42 != v40) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = *(void **)(*((void *)&v41 + 1) + 8 * v31);
            if (![(PXZoomablePhotosLayout *)v26 _layoutHasIndividualItems:v33]
              && v30 + v31 <= 8
              && !v38->_isPreheatingByColumnIndex[v30 + 1 + v31])
            {
              uint64_t v34 = [v37 numberOfColumns];
              BOOL v35 = v34 < [v33 numberOfColumns];
              int v26 = v38;
              if (v35)
              {
                [v33 numberOfColumns];
                [(PXGLayout *)v38 displayScale];
                PXSizeScale();
              }
            }
            ++v31;
            v32 += 16;
          }
          while (v29 != v31);
          v30 += v31;
          uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v48 count:16];
        }
        while (v29);
      }
    }
  }
}

- (void)_updatePinchEffect
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PXZoomablePhotosLayout *)self viewModel];
  uint64_t v4 = [(NSArray *)self->_layers lastObject];
  NSUInteger v5 = [(NSArray *)self->_itemLayouts lastObject];
  [(PXZoomablePhotosLayout *)self _scaleForLayout:v5];
  double v7 = v6;
  unint64_t v8 = [(PXGLayout *)self entityManager];
  unint64_t v9 = [(PXGEdgeStretchEffect *)self->_edgeStretchEffect entityManager];

  if (v9 != v8)
  {
    BOOL v10 = [(PXZoomablePhotosLayout *)self viewModel];
    if (([v10 lowMemoryMode] & 1) == 0 && v8 && -[PXGLayout appearState](self, "appearState") == 1)
    {
      BOOL v11 = +[PXZoomablePhotosSettings sharedInstance];
      uint64_t v12 = [v11 rubberBandEffect];

      if (v12 == 1)
      {
        id v13 = objc_alloc((Class)off_1E5DA67A0);
        unint64_t v14 = [(PXGLayout *)self entityManager];
        uint64_t v15 = (PXGEdgeStretchEffect *)[v13 initWithEntityManager:v14];
        edgeStretchEffect = self->_edgeStretchEffect;
        self->_edgeStretchEffect = v15;

        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke;
        v43[3] = &unk_1E5DB81C0;
        v43[4] = self;
        self->_pinchEffectCaptureSpriteIndeCGFloat x = [(PXGLayout *)self addSpriteWithInitialState:v43];
        long long v17 = [(PXGLayout *)self axGroup];
        [v17 updateIfNeeded];

        goto LABEL_10;
      }
    }
    else
    {
    }
    if (self->_pinchEffectCaptureSpriteIndex != -1)
    {
      unint64_t v18 = self->_edgeStretchEffect;
      self->_edgeStretchEffect = 0;

      [(PXGLayout *)self removeSpritesInRange:self->_pinchEffectCaptureSpriteIndex | 0x100000000];
      self->_pinchEffectCaptureSpriteIndeCGFloat x = -1;
    }
  }
LABEL_10:
  unint64_t v19 = self->_edgeStretchEffect;
  if (v19)
  {
    [(PXGLayout *)self styleForSpriteAtIndex:self->_pinchEffectCaptureSpriteIndex];
    float v20 = v44;
    char v21 = [v3 isDisplayingIndividualItems];
    int v22 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];

    if (v21)
    {
      BOOL v26 = 0;
    }
    else
    {
      double v23 = 0.9999;
      BOOL v25 = v20 > 0.0 || v22 == v5;
      BOOL v26 = v7 < 0.9999 && v25;
    }
    [(PXGLayout *)self visibleRect];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    BOOL v35 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
    if (v26)
    {
      v36 = [v4 itemsLayout];

      if (v36 == v35)
      {
        uint64_t v42 = 0;
        memset(&v41, 0, sizeof(v41));
        [(PXZoomablePhotosLayout *)self _spriteTransformForLayout:v4];
        CGAffineTransform v40 = v41;
        v46.origin.CGFloat x = v28;
        v46.origin.CGFloat y = v30;
        v46.size.CGFloat width = v32;
        v46.size.CGFloat height = v34;
        CGRectApplyAffineTransform(v46, &v40);
        PXPointSubtract();
      }
    }
    uint64_t v37 = self->_pinchEffectCaptureSpriteIndex | 0x100000000;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __44__PXZoomablePhotosLayout__updatePinchEffect__block_invoke_3;
    v38[3] = &unk_1E5DB81E8;
    v38[4] = self;
    BOOL v39 = v26;
    [(PXGLayout *)self modifySpritesInRange:v37 state:v38];
  }
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PXZoomablePhotosLayout *)self _layoutWantsSingleDateTitle]) {
    PXEdgeInsetsMake();
  }
  uint64_t v15 = -[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", x, y, width, height);
  uint64_t v17 = v16;
  if (v16)
  {
    if (![(PXZoomablePhotosLayout *)self isAnimating]
      || (lastReturnedDateInterval = self->_lastReturnedDateInterval) == 0)
    {
      BOOL v11 = self->_currentDataSource;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke;
      v25[3] = &unk_1E5DB82D8;
      uint64_t v12 = (id *)v26;
      v26[2] = v15;
      v26[3] = v17;
      v26[4] = a4;
      v26[0] = v11;
      v26[1] = self;
      id v13 = v11;
      unint64_t v14 = v25;
      goto LABEL_9;
    }
  }
  else
  {
    lastReturnedDateInterval = self->_lastReturnedDateInterval;
  }
  unint64_t v18 = lastReturnedDateInterval;
  int64_t lastReturnedDateIntervalDataSourceIdentifier = self->_lastReturnedDateIntervalDataSourceIdentifier;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__PXZoomablePhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke_2;
  v23[3] = &unk_1E5DB8300;
  uint64_t v12 = (id *)v24;
  v24[0] = v18;
  v24[1] = lastReturnedDateIntervalDataSourceIdentifier;
  id v13 = v18;
  unint64_t v14 = v23;
LABEL_9:
  float v20 = (void *)[v14 copy];

  char v21 = _Block_copy(v20);
  return v21;
}

- (BOOL)_layoutWantsSingleDateTitle
{
  id v2 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  uint64_t v3 = [v2 numberOfColumns];
  uint64_t v4 = +[PXZoomablePhotosSettings sharedInstance];
  LOBYTE(v3) = v3 <= [v4 maxColumnsForSingleDate];

  return v3;
}

- (_NSRange)_rangeOfItemsForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v8 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  unint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 numberOfColumns];
    BOOL v11 = [(PXZoomablePhotosLayout *)self spec];
    uint64_t v12 = [v11 maxColumnsForIndividualItems];

    if (v10 <= v12)
    {
      -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v9, x, y, width, height);
      if (!CGRectIsNull(v16)) {
        PXPointIsNull();
      }
    }
  }

  NSUInteger v13 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v14 = 0;
  result.length = v14;
  result.unsigned int location = v13;
  return result;
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  uint64_t v4 = -[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v6 = v5) == 0)
  {
    lastReturnedLocationNames = self->_lastReturnedLocationNames;
  }
  else
  {
    uint64_t v7 = v4;
    if (![(PXZoomablePhotosLayout *)self isAnimating]
      || (lastReturnedLocationNames = self->_lastReturnedLocationNames) == 0)
    {
      unint64_t v9 = self->_currentDataSource;
      uint64_t v10 = [(PXAssetsDataSource *)v9 numberOfItemsInSection:0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke;
      v21[3] = &unk_1E5DB8328;
      BOOL v11 = (id *)v22;
      v22[2] = v7;
      v22[3] = v6;
      BOOL v23 = v7 + v6 == v10;
      v22[0] = v9;
      v22[1] = self;
      uint64_t v12 = v9;
      NSUInteger v13 = v21;
      goto LABEL_8;
    }
  }
  NSUInteger v14 = lastReturnedLocationNames;
  int64_t lastReturnedLocationNamesDataSourceIdentifier = self->_lastReturnedLocationNamesDataSourceIdentifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_3;
  v19[3] = &unk_1E5DB8350;
  BOOL v11 = (id *)v20;
  v20[0] = v14;
  v20[1] = lastReturnedLocationNamesDataSourceIdentifier;
  uint64_t v12 = v14;
  NSUInteger v13 = v19;
LABEL_8:
  CGRect v16 = (void *)[v13 copy];

  uint64_t v17 = _Block_copy(v16);
  return v17;
}

- (void)setWantsOverBackgroundFloatingHeaderAppearance:(BOOL)a3
{
  if (self->_wantsOverBackgroundFloatingHeaderAppearance != a3)
  {
    self->_wantsOverBackgroundFloatingHeaderAppearance = a3;
    uint64_t v4 = [(PXZoomablePhotosLayout *)self viewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__PXZoomablePhotosLayout_setWantsOverBackgroundFloatingHeaderAppearance___block_invoke;
    v5[3] = &__block_descriptor_33_e69_v16__0__PXZoomablePhotosViewModel_PXMutableZoomablePhotosViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

- (void)_updateZoomTransforms
{
  uint64_t v4 = [(PXZoomablePhotosLayout *)self oneColLayout];
  [(PXGLayout *)self visibleRect];
  CGFloat x = self->_normalizedScaleCenterInAnchorSprite.x;
  CGFloat y = self->_normalizedScaleCenterInAnchorSprite.y;
  uint64_t v7 = self->_visualAnchorAssetReferenceItemByLayout;
  unint64_t v8 = [(NSArray *)self->_itemLayouts firstObject];
  [v8 itemAspectRatio];
  uint64_t v10 = v9;

  BOOL v11 = [(PXZoomablePhotosLayout *)self anchorAssetReference];
  if (v11)
  {
    [v11 indexPath];
    [v4 frameForItem:v36];
    if (v4) {
      PXSizeGetAspectRatio();
    }
    [(PXZoomablePhotosLayout *)self scaleCenterTargetInViewport];
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = [(PXZoomablePhotosLayout *)self viewModel];
    NSUInteger v13 = v12;
    if (v12)
    {
      [v12 zoomState];
    }
    else
    {
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
    }

    [(NSArray *)self->_itemLayouts objectAtIndexedSubscript:(void)v33];
    objc_claimAutoreleasedReturnValue();
    [(NSArray *)self->_itemLayouts objectAtIndexedSubscript:*((void *)&v33 + 1)];
    objc_claimAutoreleasedReturnValue();
    [(PXGLayout *)self rootLayout];
    [(id)objc_claimAutoreleasedReturnValue() safeAreaInsets];
    PXEdgeInsetsAdd();
  }
  uint64_t v14 = *(void *)off_1E5DAB000;
  uint64_t v15 = *((void *)off_1E5DAB000 + 1);
  CGRect v16 = [(PXGLayout *)self->_zoomLayout sublayoutDataStore];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__PXZoomablePhotosLayout__updateZoomTransforms__block_invoke;
  v19[3] = &unk_1E5DB8148;
  void v19[4] = self;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v17 = v7;
  float v20 = v17;
  SEL v23 = a2;
  CGFloat v24 = x;
  CGFloat v25 = y;
  id v18 = v4;
  id v21 = v18;
  uint64_t v26 = v10;
  uint64_t v27 = v14;
  uint64_t v28 = v15;
  [v16 enumerateSublayoutGeometriesUsingBlock:v19];
}

- (PXGOneColumnLayout)oneColLayout
{
  return self->_oneColLayout;
}

- (void)_updateMiniMode
{
  uint64_t v3 = [(PXZoomablePhotosLayout *)self viewModel];
  uint64_t v4 = [v3 miniModeAnimator];

  if (([v4 isContentAnimating] & 1) == 0 && !objc_msgSend(v4, "targetState"))
  {
    self->_miniModeVerticalOffset = 0.0;
    miniModeFoldedRows = self->_miniModeFoldedRows;
    self->_miniModeFoldedRows = 0;

    BOOL v5 = 0;
    goto LABEL_6;
  }
  if (([(PXGLayout *)self anchoredContentEdges] & 4) != 0)
  {
    BOOL v5 = 1;
LABEL_6:
    self->_miniModeIsAnchoringToBottom = v5;
  }
  itemLayouts = self->_itemLayouts;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PXZoomablePhotosLayout__updateMiniMode__block_invoke;
  v8[3] = &unk_1E5DB8090;
  v8[4] = self;
  [(NSArray *)itemLayouts enumerateObjectsUsingBlock:v8];
  PXZoomablePhotosInvalidate(self, 0x40000);
}

- (void)_updateBlurEffect
{
  uint64_t v3 = +[PXZoomablePhotosSettings sharedInstance];
  int v4 = [v3 enableBlurEffect];

  if (v4)
  {
    BOOL v5 = [(PXZoomablePhotosLayout *)self viewModel];
    BOOL v6 = +[PXZoomablePhotosSettings sharedInstance];
    uint64_t v7 = [v5 miniModeAnimator];
    char v8 = [v6 enableBlurDebugLayers];
    uint64_t v9 = [(PXGLayout *)self entityManager];
    uint64_t v10 = [(NSArray *)self->_blurEffects firstObject];
    BOOL v11 = [v10 entityManager];

    if (v11 != v9)
    {
      p_blurEffectsSpriteIndexRange = &self->_blurEffectsSpriteIndexRange;
      if (!self->_blurEffectsSpriteIndexRange.length) {
        _PXGSpriteIndexRange *p_blurEffectsSpriteIndexRange = [(PXGLayout *)self addSpriteCount:5 withInitialState:&__block_literal_global_386_87898];
      }
      if ([(NSArray *)self->_blurEffects count])
      {
        blurEffects = self->_blurEffects;
        self->_blurEffects = 0;
      }
      if (v9 && [v7 isActive])
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_2;
        v51[3] = &unk_1E5DB8238;
        v51[4] = self;
        id v52 = v14;
        char v53 = v8;
        _PXGSpriteIndexRange v15 = *p_blurEffectsSpriteIndexRange;
        id v16 = v14;
        [(PXGLayout *)self modifySpritesInRange:v15 fullState:v51];
        uint64_t v17 = (NSArray *)[v16 copy];
        id v18 = self->_blurEffects;
        self->_blurEffects = v17;

        unint64_t v19 = [(PXGLayout *)self axGroup];
        [v19 updateIfNeeded];
      }
    }
    float v20 = self->_blurEffects;
    if ([(NSArray *)v20 count])
    {
      id v21 = +[PXZoomablePhotosSettings sharedInstance];
      uint64_t v22 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
      uint64_t v50 = 0;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      if ([(PXZoomablePhotosLayout *)self _getMiniModeInfo:&v46 forLayout:v22])
      {
        SEL v23 = [(PXZoomablePhotosLayout *)self miniModeFoldedRows];
        if ([v23 count])
        {
          [v22 referenceSize];
          uint64_t v25 = v24;
          uint64_t v27 = v26;
          [v21 maxBlurRadius];
          uint64_t v29 = v28;
          [v21 blurDimmingStrength];
          uint64_t v31 = v30;
          [v22 rowHeight];
          if (v32 == 0.0) {
            double v33 = *((double *)&v47 + 1);
          }
          else {
            double v33 = v32;
          }
          uint64_t v34 = [v23 count];
          uint64_t v35 = v34 / 5;
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_4;
          v36[3] = &unk_1E5DB8288;
          if (v34 / 5 <= 1) {
            uint64_t v35 = 1;
          }
          v36[4] = self;
          uint64_t v38 = v34;
          uint64_t v39 = v35;
          id v37 = v23;
          uint64_t v40 = v29;
          uint64_t v41 = v31;
          uint64_t v42 = v25;
          uint64_t v43 = v27;
          double v44 = v33;
          char v45 = v8;
          [(PXGLayout *)self modifySpritesInRange:*(void *)&self->_blurEffectsSpriteIndexRange fullState:v36];
        }
      }
    }
  }
}

- (void)_configureMiniModeSpriteModifierForLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXZoomablePhotosLayout *)self viewModel];
  BOOL v6 = [v5 miniModeAnimator];

  if ([v6 isActive])
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [PXGLayoutSpriteModifier alloc];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __68__PXZoomablePhotosLayout__configureMiniModeSpriteModifierForLayout___block_invoke;
    uint64_t v12 = &unk_1E5DB8048;
    objc_copyWeak(&v13, &location);
    char v8 = [(PXGLayoutSpriteModifier *)v7 initWithStateHandler:&v9];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    char v8 = 0;
  }
  objc_msgSend(v4, "setSpriteModifier:", v8, v9, v10, v11, v12);
}

- (void)_updateFloatingHeaderStyle
{
}

- (void)_updateDataSource
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_dataSourceManager;
  p_currentDataSource = &self->_currentDataSource;
  BOOL v5 = self->_currentDataSource;
  BOOL v6 = [(PXAssetsDataSourceManager *)v3 dataSource];
  double v62 = v5;
  if (v5 != v6)
  {
    uint64_t v7 = [(PXZoomablePhotosLayout *)self viewModel];
    char v8 = v7;
    uint64_t v81 = 0;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    if (v7) {
      [v7 zoomState];
    }
    double v60 = [(PXZoomablePhotosLayout *)self spec];
    uint64_t v9 = [(PXAssetsDataSourceManager *)v3 changeHistory];
    uint64_t v10 = objc_msgSend(v9, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", -[PXAssetsDataSource identifier](v62, "identifier"), -[PXAssetsDataSource identifier](v6, "identifier"));

    BOOL v11 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
    uint64_t v12 = [v11 loadedItems];
    if (v13) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    double v59 = v11;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v57 = 0;
    }
    else {
      uint64_t v57 = [v11 columnForItem:v14];
    }
    long long v55 = v8;
    double v61 = self;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v84 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      int v18 = 0;
      uint64_t v19 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v72 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          if (objc_msgSend(v21, "hasAnyInsertionsRemovalsOrMoves", v55))
          {
            uint64_t v22 = [v21 itemChangesInSection:0];
            uint64_t v14 = [v22 indexAfterApplyingChangesToIndex:v14];

            int v18 = 1;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v71 objects:v84 count:16];
      }
      while (v17);
    }
    else
    {
      int v18 = 0;
    }

    if ([(PXAssetsDataSource *)v62 areAllSectionsConsideredAccurate]) {
      LODWORD(v23) = 0;
    }
    else {
      LODWORD(v23) = [(PXAssetsDataSource *)v6 areAllSectionsConsideredAccurate];
    }
    if (!BYTE8(v78))
    {
      uint64_t v24 = [v59 numberOfColumns];
      if (v24 <= [v60 maxColumnsForIndividualItems] && (v23 & 1) == 0 && ((v18 ^ 1) & 1) == 0) {
        id v25 = [(PXGLayout *)v61 createDefaultAnimationForCurrentContext];
      }
    }
    if (v18)
    {
      uint64_t v26 = [(PXZoomablePhotosLayout *)v61 viewModel];
      uint64_t v27 = [v26 assetsDataSourceManager];
      [v27 performChanges:&__block_literal_global_362];

      [(PXZoomablePhotosLayout *)v61 _invalidateVisualShiftingEnsuringLastRowFilled];
      int64_t v28 = v57;
    }
    else
    {
      int64_t v28 = 0;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v61->_int64_t visuallyStableAnchorItem = v14;
    v61->_int64_t visuallyStableAnchorItemDesiredColumn = v28;
    v61->_visuallyStableAnchorAllowedCloseToTop = v23;
    if (v23) {
      v61->_performedInitialVisualShift = 0;
    }
    uint64_t v23 = v23;
    uint64_t v29 = [(PXAssetsDataSource *)v62 filterPredicate];
    uint64_t v30 = [(PXAssetsDataSource *)v6 filterPredicate];
    if (v29 != v30 && ![v29 isEqual:v30]) {
      uint64_t v23 = 15;
    }
    double v58 = v3;

    uint64_t v31 = [(PXGLayout *)v61 rootLayout];
    double v32 = [v31 createAnchorForVisibleAreaIgnoringEdges:v23];
    id v33 = (id)[v32 autoInvalidate];

    objc_storeStrong((id *)p_currentDataSource, v6);
    [(PXPhotosGridAssetDecorationSource *)v61->_assetDecorationSource setDataSource:*p_currentDataSource section:0];
    cachedClampedFetchResult = v61->_cachedClampedFetchResult;
    v61->_cachedClampedFetchResult = 0;

    v61->_cachedClampedItemRange = (_NSRange)xmmword_1AB359BD0;
    uint64_t v35 = [(PXZoomablePhotosLayout *)v61 anchorAssetReference];

    if (v35)
    {
      uint64_t v36 = [(PXZoomablePhotosLayout *)v61 anchorAssetReference];
      id v37 = [(PXAssetsDataSource *)v6 assetReferenceForAssetReference:v36];
      [(PXZoomablePhotosLayout *)v61 setAnchorAssetReference:v37];
    }
    uint64_t v38 = v61->_visualAnchorAssetReferenceItemByLayout;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v39 = NSAllMapTableKeys(v38);
    uint64_t v40 = [v39 countByEnumeratingWithState:&v67 objects:v83 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v68 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v67 + 1) + 8 * j);
          uint64_t v45 = [(NSMapTable *)v38 objectForKey:v44];
          if (v45)
          {
            long long v46 = (void *)v45;
            long long v47 = [(PXAssetsDataSource *)v6 assetReferenceForAssetReference:v45];

            [(NSMapTable *)v38 setObject:v47 forKey:v44];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v67 objects:v83 count:16];
      }
      while (v41);
    }

    long long v48 = +[PXGDisplayAssetTextureProvider defaultMediaVersionHandlerWithDataSourceBeforeChanges:v62 dataSourceAfterChanges:v6];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v49 = v61->_layers;
    uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v63 objects:v82 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v64 != v52) {
            objc_enumerationMutation(v49);
          }
          long long v54 = [*(id *)(*((void *)&v63 + 1) + 8 * k) itemsLayout];
          [v54 applySectionedChangeDetailsForSingleSection:v15 dataSourceBeforeChanges:v62 dataSourceAfterChanges:v6 changeMediaVersionHandler:v48];
        }
        uint64_t v51 = [(NSArray *)v49 countByEnumeratingWithState:&v63 objects:v82 count:16];
      }
      while (v51);
    }

    [(PXGLayout *)v61 invalidateVersion];
    PXZoomablePhotosInvalidate(v61, 1311232);
    if (!v61->_performedInitialVisualShift
      && [(PXAssetsDataSource *)v6 containsAnyItems])
    {
      PXZoomablePhotosInvalidate(v61, 256);
    }

    uint64_t v3 = v58;
  }
}

- (void)_updateBackgroundSprites
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  unsigned int location = self->_lightBackgroundSpriteIndexRange.location;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v3 = [(PXGLayout *)self->_zoomLayout sublayoutDataStore];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PXZoomablePhotosLayout__updateBackgroundSprites__block_invoke;
  v5[3] = &unk_1E5DB8198;
  void v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  [v3 enumerateSublayoutGeometriesUsingBlock:v5];

  if (v7[3] >= 2)
  {
    unsigned int v4 = *((_DWORD *)v11 + 6);
  }
  else
  {
    unsigned int v4 = self->_lightBackgroundSpriteIndexRange.location;
    *((_DWORD *)v11 + 6) = v4;
  }
  [(PXGLayout *)self modifySpritesInRange:v4 | ((unint64_t)(self->_lightBackgroundSpriteIndexRange.location- v4+ self->_lightBackgroundSpriteIndexRange.length) << 32) state:&__block_literal_global_382];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)_updateDecorationVisibility
{
  uint64_t v3 = +[PXZoomablePhotosSettings sharedInstance];
  int v4 = [v3 hideBadgesDuringZoom];

  if (v4)
  {
    [(PXNumberAnimator *)self->_decorationAlphaAnimator presentationValue];
    [(PXNumberAnimator *)self->_decorationAlphaAnimator value];
  }
  BOOL v5 = [(PXZoomablePhotosLayout *)self viewModel];
  uint64_t v6 = [v5 miniModeAnimator];

  [v6 gridMiniChromeVisibilityPercentage];
  PXFloatSaturate();
}

- (void)_invalidateVisualShiftingEnsuringLastRowFilled
{
  self->_visuallyStableAnchorLastRowFilled = 1;
  PXZoomablePhotosInvalidate(self, 256);
}

- (void)setSpec:(id)a3
{
  int v4 = (PXZoomablePhotosLayoutSpec *)a3;
  spec = self->_spec;
  if (spec != v4)
  {
    uint64_t v6 = spec;
    uint64_t v7 = v4;
    [(PXZoomablePhotosLayoutSpec *)v6 defaultNumberOfColumns];
    [(PXZoomablePhotosLayoutSpec *)v7 defaultNumberOfColumns];
    uint64_t v8 = [(PXFeatureSpec *)v6 layoutOrientation];
    uint64_t v9 = [(PXFeatureSpec *)v7 layoutOrientation];
    if ([(PXFeatureSpec *)v7 userInterfaceIdiom] == 1)
    {
      uint64_t v10 = [(PXFeatureSpec *)v7 layoutOrientation];
      if (v8 != v9 && v10 == 1)
      {
        uint64_t v12 = [(PXZoomablePhotosLayout *)self viewModel];
        uint64_t v13 = [v12 userDefaults];
        uint64_t v14 = [v13 preferredIndividualItemsColumnsNumber];

        if (v14)
        {
          id v15 = [(PXZoomablePhotosLayoutSpec *)v7 supportedColumns];
          uint64_t v16 = [v14 integerValue];
          uint64_t v19 = [(PXZoomablePhotosLayoutSpec *)v7 supportedColumns];
          uint64_t v17 = objc_msgSend(v15, "objectAtIndexedSubscript:", -[PXZoomablePhotosLayoutSpec bestColumnIndexForPreferredNumberOfColumns:allowedColumns:](v7, "bestColumnIndexForPreferredNumberOfColumns:allowedColumns:", v16, v19));
          [v17 integerValue];
        }
      }
    }
    int v18 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
    [v18 numberOfColumns];

    [(PXZoomablePhotosLayoutSpec *)v6 maxColumnsForIndividualItems];
    [(PXZoomablePhotosLayoutSpec *)v7 maxColumnsForIndividualItems];
    [(PXZoomablePhotosLayoutSpec *)v6 itemAspectRatio];
    [(PXZoomablePhotosLayoutSpec *)v7 itemAspectRatio];
    [(PXZoomablePhotosLayoutSpec *)v6 minColumnsForMiniBadges];
    [(PXZoomablePhotosLayoutSpec *)v7 minColumnsForMiniBadges];
    [(PXFeatureSpec *)self->_spec layoutMargins];
    [(PXFeatureSpec *)v7 layoutMargins];
    PXEdgeInsetsEqualToEdgeInsets();
  }
}

- (void)_updateDebugVisualizationSprites
{
  int v4 = +[PXZoomablePhotosSettings sharedInstance];
  int v5 = [v4 enableDebugSprites];

  if (self->_debugVisualizationSpriteTitles)
  {
    if (v5)
    {
LABEL_3:
      NSUInteger v6 = [(NSArray *)self->_debugVisualizationSpriteTitles count];
      p_debugVisualizationSpriteIndexRange = &self->_debugVisualizationSpriteIndexRange;
      LODWORD(v8) = self->_debugVisualizationSpriteIndexRange.length;
      if (!v8)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        _OWORD v15[2] = __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke;
        v15[3] = &unk_1E5DB9010;
        long long v16 = xmmword_1AB359D10;
        v15[4] = self;
        _PXGSpriteIndexRange v9 = [(PXGLayout *)self addSpriteCount:v6 withInitialState:v15];
        _PXGSpriteIndexRange *p_debugVisualizationSpriteIndexRange = v9;
        unint64_t v8 = HIDWORD(*(unint64_t *)&v9);
      }
      if (v8 != v6)
      {
        BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"PXZoomablePhotosLayout.m", 2406, @"Invalid parameter not satisfying: %@", @"_debugVisualizationSpriteIndexRange.length == spriteCount" object file lineNumber description];
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke_2;
      v12[3] = &unk_1E5DB82B0;
      int v14 = v6;
      _OWORD v12[4] = self;
      v12[5] = a2;
      long long v13 = xmmword_1AB359D10;
      [(PXGLayout *)self modifySpritesInRange:*p_debugVisualizationSpriteIndexRange state:v12];
      return;
    }
  }
  else
  {
    self->_debugVisualizationSpriteTitles = (NSArray *)&unk_1F02D40D8;
    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = &self->_debugVisualizationSpriteIndexRange;
  if (self->_debugVisualizationSpriteIndexRange.length)
  {
    [(PXGLayout *)self removeSpritesInRange:*v10];
    _PXGSpriteIndexRange *v10 = *(_PXGSpriteIndexRange *)off_1E5DAAF80;
  }
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  int64_t v4 = [(PXGZoomLayout *)self->_zoomLayout itemForSpriteIndex:[(PXGLayout *)self convertSpriteIndex:*(void *)&a3 toDescendantLayout:self->_zoomLayout]];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v6 = v4;
    uint64_t v7 = self->_currentDataSource;
    v9[0] = [(PXAssetsDataSource *)v7 identifier];
    v9[1] = 0;
    v9[2] = v6;
    v9[3] = 0x7FFFFFFFFFFFFFFFLL;
    int v5 = [(PXAssetsDataSource *)v7 assetReferenceAtItemIndexPath:v9];
  }
  return v5;
}

uint64_t __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 zoomToColumnIndex:*(void *)(a1 + 32) withAnchorAssetReference:0 animated:0];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGSplitLayout *)&v3 displayScaleDidChange];
  PXZoomablePhotosInvalidate(self, 16);
}

- (void)setBodyLayoutAXGroupRole:(int64_t)a3
{
  self->_bodyLayoutAXGroupRole = a3;
}

- (PXZoomablePhotosLayout)initWithViewModel:(id)a3
{
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PXZoomablePhotosLayout;
  uint64_t v7 = [(PXGLayout *)&v47 init];
  if (v7)
  {
    unint64_t v8 = [v6 specManager];
    [v8 registerChangeObserver:v7 context:PXZoomablePhotosSpecManagerObserverContext];
    _PXGSpriteIndexRange v9 = [v8 spec];
    objc_storeStrong((id *)&v7->_spec, v9);
    uint64_t v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemLayoutsAllowedToLoad = v7->_itemLayoutsAllowedToLoad;
    v7->_itemLayoutsAllowedToLoad = v10;

    uint64_t v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    providedEffectByAsset = v7->_providedEffectByAsset;
    v7->_providedEffectByAsset = v12;

    [(NSCache *)v7->_providedEffectByAsset setCountLimit:200];
    uint64_t v14 = [v9 initialNumberOfColumns];
    if (v14 > [v9 maxColumnsForIndividualItems])
    {
      id v15 = [v6 assetsDataSourceManager];
      long long v16 = [v15 dataSource];
      char v17 = [v16 areAllSectionsConsideredAccurate];

      if ((v17 & 1) == 0)
      {
        int v18 = [v6 assetsDataSourceManager];
        [v18 performChanges:&__block_literal_global_87994];
      }
    }
    uint64_t v19 = [v6 bestColumnIndexForPreferredNumberOfColumns:v14];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke_2;
    v46[3] = &__block_descriptor_40_e44_v16__0___PXMutableZoomablePhotosViewModel__8l;
    v46[4] = v19;
    [v6 performInitialChanges:v46];
    v7->_bodyLayoutAXGroupRole = 0;
    objc_storeStrong((id *)&v7->_viewModel, a3);
    [(PXZoomablePhotosViewModel *)v7->_viewModel registerChangeObserver:v7 context:PXZoomablePhotosViewModelObserverContext_87839];
    [(PXZoomablePhotosViewModel *)v7->_viewModel setGeometryDelegate:v7];
    uint64_t v20 = [v6 assetsDataSourceManager];
    dataSourceManager = v7->_dataSourceManager;
    v7->_dataSourceManager = (PXAssetsDataSourceManager *)v20;

    [(PXAssetsDataSourceManager *)v7->_dataSourceManager registerChangeObserver:v7 context:PXZoomablePhotosDataSourceObserverContext];
    uint64_t v22 = [(PXAssetsDataSourceManager *)v7->_dataSourceManager dataSource];
    currentDataSource = v7->_currentDataSource;
    v7->_currentDataSource = (PXAssetsDataSource *)v22;

    if ([(PXAssetsDataSource *)v7->_currentDataSource numberOfSections] != 1)
    {
      uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2 object:v7 file:@"PXZoomablePhotosLayout.m" lineNumber:323 description:@"Requires a data source with 1 section."];
    }
    uint64_t v24 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    assetDecorationSource = v7->_assetDecorationSource;
    v7->_assetDecorationSource = v24;

    [(PXPhotosGridAssetDecorationSource *)v7->_assetDecorationSource setDataSource:v7->_currentDataSource section:0];
    uint64_t v26 = [v6 badgesModifier];
    [(PXPhotosGridAssetDecorationSource *)v7->_assetDecorationSource setBadgesModifier:v26];

    uint64_t v27 = [v6 loadingStatusManager];
    [(PXPhotosGridAssetDecorationSource *)v7->_assetDecorationSource setLoadingStatusManager:v27];

    CGPoint v28 = *(CGPoint *)off_1E5DAB000;
    v7->_normalizedScaleCenterInAnchorSprite = *(CGPoint *)off_1E5DAB000;
    v7->_scaleCenterTargetInViewport = v28;
    uint64_t v29 = objc_alloc_init(PXGZoomLayout);
    zoomLayout = v7->_zoomLayout;
    v7->_zoomLayout = v29;

    [(PXGLayout *)v7->_zoomLayout setContentSource:v7];
    uint64_t v31 = [v6 mediaProvider];
    preheatMediaProvider = v7->_preheatMediaProvider;
    v7->_preheatMediaProvider = (PXMediaProvider *)v31;

    uint64_t v33 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    visualAnchorAssetReferenceItemByLayout = v7->_visualAnchorAssetReferenceItemByLayout;
    v7->_visualAnchorAssetReferenceItemByLayout = (NSMapTable *)v33;

    uint64_t v35 = [v6 inlineHeadersDataSourceManager];

    if (v35)
    {
      uint64_t v36 = [PXZoomableInlineHeadersLayout alloc];
      id v37 = [v6 inlineHeadersDataSourceManager];
      uint64_t v38 = [(PXZoomableInlineHeadersLayout *)v36 initWithDataSourceManager:v37];
      inlineHeadersLayout = v7->_inlineHeadersLayout;
      v7->_inlineHeadersLayout = (PXZoomableInlineHeadersLayout *)v38;

      uint64_t v40 = [v9 inlineHeadersSpec];
      [(PXZoomableInlineHeadersLayout *)v7->_inlineHeadersLayout setSpec:v40];

      [(PXZoomableInlineHeadersLayout *)v7->_inlineHeadersLayout setGeometrySource:v7];
    }
    uint64_t v41 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:1.0];
    decorationAlphaAnimator = v7->_decorationAlphaAnimator;
    v7->_decorationAlphaAnimator = (PXNumberAnimator *)v41;

    [(PXNumberAnimator *)v7->_decorationAlphaAnimator registerChangeObserver:v7 context:PXZoomablePhotosDecorationAlphaAnimatorContext];
    uint64_t v43 = [v6 miniModeAnimator];
    [v43 registerChangeObserver:v7 context:PXZoomablePhotosMiniModeAnimatorContext];

    [(PXGSplitLayout *)v7 setMode:5];
    [(PXGSplitLayout *)v7 setFirstSublayout:v7->_zoomLayout];
    [(PXGSplitLayout *)v7 setSecondSublayout:v7->_inlineHeadersLayout];
    v7->_pinchEffectCaptureSpriteIndeCGFloat x = -1;
    v7->__PXGSpriteIndexRange lightBackgroundSpriteIndexRange = [(PXGLayout *)v7 addSpriteCount:5 withInitialState:&__block_literal_global_274_88001];
    [(PXGLayout *)v7 setContentSource:v7];
    PXZoomablePhotosInvalidate(v7, 8324031);
  }
  return v7;
}

id __43__PXZoomablePhotosLayout__updateDataSource__block_invoke(uint64_t a1, void *a2)
{
  return (id)[a2 pauseChangeDeliveryWithTimeout:@"PXZoomablePhotosLayout" identifier:1.0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v11 = a3;
  if ((void *)PXZoomablePhotosViewModelObserverContext_87839 == a5)
  {
    if (v6) {
      PXZoomablePhotosInvalidate(self, 720944);
    }
    if ((v6 & 6) != 0) {
      PXZoomablePhotosInvalidate(self, 720952);
    }
    if ((v6 & 2) != 0) {
      PXZoomablePhotosInvalidate(self, 512);
    }
    if ((*(void *)&v6 & 0x20010) != 0) {
      PXZoomablePhotosInvalidate(self, 520);
    }
    if ((v6 & 0x800) != 0) {
      PXZoomablePhotosInvalidate(self, 8);
    }
    if ((v6 & 0x10000) != 0) {
      PXZoomablePhotosInvalidate(self, 2);
    }
    if ((v6 & 0x2660) != 0) {
      PXZoomablePhotosInvalidate(self, 512);
    }
    if ((v6 & 0x80000) != 0) {
      PXZoomablePhotosInvalidate(self, 8);
    }
    if ((*(void *)&v6 & 0xE00000) != 0) {
      PXZoomablePhotosInvalidate(self, 8);
    }
    if ((v6 & 0x1000000) != 0)
    {
      int v9 = 0x100000;
      goto LABEL_34;
    }
  }
  else
  {
    if ((void *)PXZoomablePhotosDataSourceObserverContext == a5)
    {
      if ((v6 & 1) == 0) {
        goto LABEL_35;
      }
      int v9 = 128;
      goto LABEL_34;
    }
    if ((void *)PXZoomablePhotosSpecManagerObserverContext == a5)
    {
      if ((v6 & 1) == 0) {
        goto LABEL_35;
      }
      int v9 = 1;
      goto LABEL_34;
    }
    if ((void *)PXZoomablePhotosDecorationAlphaAnimatorContext == a5)
    {
      if ((v6 & 3) == 0) {
        goto LABEL_35;
      }
      int v9 = 64;
      goto LABEL_34;
    }
    if ((void *)PXZoomablePhotosMiniModeAnimatorContext != a5)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PXZoomablePhotosLayout.m", 3374, @"%@ got unexpected observer context:%p", self, a5 object file lineNumber description];

      abort();
    }
    if ((v6 & 7) != 0)
    {
      int v9 = 4456544;
LABEL_34:
      PXZoomablePhotosInvalidate(self, v9);
    }
  }
LABEL_35:
}

- (void)_updateEffectProvider
{
  id v4 = [(PXZoomablePhotosLayout *)self viewModel];
  objc_super v3 = [v4 effectProvider];
  [(PXZoomablePhotosLayout *)self setEffectProvider:v3];
}

- (void)setEffectProvider:(id)a3
{
  aBlocuint64_t k = a3;
  id v4 = _Block_copy(self->_effectProvider);
  int v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {
  }
  else
  {
    int v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      unint64_t v8 = _Block_copy(aBlock);
      id effectProvider = self->_effectProvider;
      self->_id effectProvider = v8;

      PXZoomablePhotosInvalidate(self, 8);
      [(NSCache *)self->_providedEffectByAsset removeAllObjects];
      [(NSArray *)self->_itemLayouts enumerateObjectsUsingBlock:&__block_literal_global_282_87987];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniModeFoldedRows, 0);
  objc_storeStrong(&self->_effectProvider, 0);
  objc_storeStrong((id *)&self->_oneColLayout, 0);
  objc_storeStrong((id *)&self->_visualAnchorAssetReferenceItemByLayout, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_addContentHandler, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->__anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_providedEffectByAsset, 0);
  objc_storeStrong((id *)&self->_debugVisualizationSpriteTitles, 0);
  objc_storeStrong((id *)&self->_burstStackEffect, 0);
  objc_storeStrong((id *)&self->_lastReturnedLocationNames, 0);
  objc_storeStrong((id *)&self->_lastReturnedDateInterval, 0);
  objc_storeStrong((id *)&self->_decorationAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_itemLayoutsAllowedToLoad, 0);
  objc_storeStrong((id *)&self->_decadesItemLayout, 0);
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_itemLayoutByHeaderLevel[i], 0);
  objc_storeStrong((id *)&self->_itemLayouts, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
  objc_storeStrong((id *)&self->_preheatMediaProvider, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_inlineHeadersLayout, 0);
  objc_storeStrong((id *)&self->_blurEffects, 0);
  objc_storeStrong((id *)&self->_edgeStretchEffect, 0);
  objc_storeStrong((id *)&self->_zoomLayout, 0);
}

- (void)setMiniModeFoldedRows:(id)a3
{
}

- (NSArray)miniModeFoldedRows
{
  return self->_miniModeFoldedRows;
}

- (void)setMiniModeVerticalOffset:(double)a3
{
  self->_miniModeVerticalOffset = a3;
}

- (double)miniModeVerticalOffset
{
  return self->_miniModeVerticalOffset;
}

- (void)setMiniModeIsAnchoringToBottom:(BOOL)a3
{
  self->_miniModeIsAnchoringToBottom = a3;
}

- (BOOL)miniModeIsAnchoringToBottom
{
  return self->_miniModeIsAnchoringToBottom;
}

- (BOOL)wantsOverBackgroundFloatingHeaderAppearance
{
  return self->_wantsOverBackgroundFloatingHeaderAppearance;
}

- (BOOL)wasTracking
{
  return self->_wasTracking;
}

- (BOOL)shouldAnimateTowardsAnchor
{
  return self->_shouldAnimateTowardsAnchor;
}

- (NSMapTable)visualAnchorAssetReferenceItemByLayout
{
  return self->_visualAnchorAssetReferenceItemByLayout;
}

- (CGPoint)normalizedScaleCenterInAnchorSprite
{
  double x = self->_normalizedScaleCenterInAnchorSprite.x;
  double y = self->_normalizedScaleCenterInAnchorSprite.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXGAnchor)anchor
{
  return self->_anchor;
}

- (id)addContentHandler
{
  return self->_addContentHandler;
}

- (PXAssetsDataSource)presentedDataSource
{
  return self->_presentedDataSource;
}

- (id)debugQuickLookObject
{
  objc_super v3 = [(NSArray *)self->_itemLayouts count];
  if (v3)
  {
    objc_super v3 = +[PXZoomablePhotosLayout visualizeBestAnchorColumnsForLayouts:self->_itemLayouts imageWidth:1024.0];
  }
  return v3;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v5 = a4;
  int v6 = [v5 superlayout];
  uint64_t v7 = [v6 numberOfColumns];
  objc_initWeak(&location, self);
  unint64_t v8 = [PXPhotosGridAddButtonViewUserData alloc];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __64__PXZoomablePhotosLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke;
  uint64_t v19 = &unk_1E5DD32D0;
  objc_copyWeak(&v20, &location);
  int v9 = [(PXPhotosGridAddButtonViewUserData *)v8 initWithStyle:v7 < 5 actionHandler:&v16];
  objc_msgSend(v6, "itemCornerRadius", v16, v17, v18, v19);
  [(PXPhotosGridAddButtonViewUserData *)v9 setCornerRadius:fminf(fminf(v10, v11), fminf(v12, v13))];
  uint64_t v14 = [(PXZoomablePhotosLayout *)self spec];
  -[PXPhotosGridAddButtonViewUserData setPreferredUserInterfaceStyle:](v9, "setPreferredUserInterfaceStyle:", [v14 preferredUserInterfaceStyle]);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v9;
}

void __64__PXZoomablePhotosLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callAddContentActionHandler];
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void v17[5] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - self->_debugVisualizationSpriteIndexRange.location;
  id v5 = [(PXZoomablePhotosLayout *)self _debugColors];
  int v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", v4 % objc_msgSend(v5, "count"));
  uint64_t v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  unint64_t v8 = (void *)[v7 mutableCopy];

  [v8 setAlignment:1];
  v16[0] = *MEMORY[0x1E4FB06F8];
  int v9 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09B8]];
  uint64_t v10 = *MEMORY[0x1E4FB0700];
  v17[0] = v9;
  v17[1] = v6;
  uint64_t v11 = *MEMORY[0x1E4FB0738];
  v16[1] = v10;
  v16[2] = v11;
  v17[2] = v8;
  v17[3] = &unk_1F02DA290;
  uint64_t v12 = *MEMORY[0x1E4FB0770];
  v16[3] = *MEMORY[0x1E4FB0778];
  v16[4] = v12;
  float v13 = [MEMORY[0x1E4FB1618] blackColor];
  v17[4] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];

  return v14;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  unint64_t v4 = -[NSArray objectAtIndexedSubscript:](self->_debugVisualizationSpriteTitles, "objectAtIndexedSubscript:", a3 - self->_debugVisualizationSpriteIndexRange.location, a4);
  id v5 = @"⌖";
  if (v4)
  {
    id v5 = [NSString stringWithFormat:@"%@\n%@", @"⌖", v4];
  }

  return v5;
}

- (id)_debugColors
{
  if (_debugColors_onceToken != -1) {
    dispatch_once(&_debugColors_onceToken, &__block_literal_global_444);
  }
  id v2 = (void *)_debugColors_colors;
  return v2;
}

void __38__PXZoomablePhotosLayout__debugColors__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  for (uint64_t i = 0; i != 10; ++i)
  {
    v1 = [MEMORY[0x1E4FB1618] colorWithHue:(double)i / 10.0 saturation:0.8 brightness:0.8 alpha:1.0];
    [v4 addObject:v1];
  }
  uint64_t v2 = [v4 copy];
  objc_super v3 = (void *)_debugColors_colors;
  _debugColors_colors = v2;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)zoomablePhotosViewModelResetToInitialState:(id)a3
{
  if ([(PXZoomablePhotosLayout *)self _hasLastRowFilledStrategy])
  {
    self->_performedInitialVisualShift = 0;
    PXZoomablePhotosInvalidate(self, 256);
  }
}

- (BOOL)zoomablePhotosViewModelIsResetToInitialState:(id)a3
{
  if (![(PXZoomablePhotosLayout *)self _hasLastRowFilledStrategy]) {
    return 1;
  }
  double v4 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [(PXZoomablePhotosLayout *)self getLastItem:&v10 lastColumn:&v9 forBodyLayout:v4];
  uint64_t v5 = [v4 columnForItem:v10];
  BOOL v7 = !self->_performedInitialVisualShift || v5 == v9;

  return v7;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  uint64_t v4 = -[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v6 = 0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    if (v5)
    {
      uint64_t v8 = v4;
      uint64_t v9 = self->_currentDataSource;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke;
      aBlock[3] = &unk_1E5DB83A0;
      uint64_t v14 = v9;
      uint64_t v15 = v8;
      uint64_t v16 = v7;
      uint64_t v10 = v9;
      int v6 = _Block_copy(aBlock);
    }
  }
  uint64_t v11 = _Block_copy(v6);

  return v11;
}

void __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(void **)(a1 + 32);
  uint64_t v7 = v5 + *(void *)(a1 + 48) - 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke_2;
  v11[3] = &unk_1E5DB8378;
  id v12 = v6;
  id v13 = v3;
  v10[0] = v4;
  v10[1] = 0;
  v10[2] = v5;
  v10[3] = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = v4;
  v9[1] = 0;
  v9[2] = v7;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v8 = v3;
  [v12 enumerateItemIndexPathsStartingAtIndexPath:v10 untilEndIndexPath:v9 usingBlock:v11];
}

void __57__PXZoomablePhotosLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  uint64_t v5 = [v3 assetAtItemIndexPath:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  uint64_t v5 = 0;
  if (-[PXZoomablePhotosLayout _rangeOfItemsForContentInRect:](self, "_rangeOfItemsForContentInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height) != 0x7FFFFFFFFFFFFFFFLL&& v4)
  {
    int v6 = self->_currentDataSource;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PXZoomablePhotosLayout_assetCollectionsIteratorForContentInRect___block_invoke;
    aBlock[3] = &unk_1E5DC93C0;
    uint64_t v11 = v6;
    uint64_t v7 = v6;
    uint64_t v5 = _Block_copy(aBlock);
  }
  id v8 = _Block_copy(v5);

  return v8;
}

void __67__PXZoomablePhotosLayout_assetCollectionsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 identifier];
  int v6 = *(void **)(a1 + 32);
  uint64_t v8 = v5;
  long long v9 = xmmword_1AB359AA0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = [v6 assetCollectionAtSectionIndexPath:&v8];
  v4[2](v4, v7);
}

id __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) identifier] == a2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = v5 + *(void *)(a1 + 56) - 1;
    uint64_t v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_2;
    v11[3] = &unk_1E5DCA3B8;
    id v12 = v7;
    id v13 = v4;
    v10[0] = a2;
    v10[1] = 0;
    v10[2] = v5;
    v10[3] = 0x7FFFFFFFFFFFFFFFLL;
    v9[0] = a2;
    v9[1] = 0;
    v9[2] = v6;
    v9[3] = 0x7FFFFFFFFFFFFFFFLL;
    [v12 enumerateItemIndexPathsStartingAtIndexPath:v10 untilEndIndexPath:v9 usingBlock:v11];
    PXArrayFromFrequencySortAndDeduplicationOfNSStringSet();
  }
  return 0;
}

id __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) == a2) {
    id v2 = *(id *)(a1 + 32);
  }
  else {
    id v2 = 0;
  }
  return v2;
}

void __62__PXZoomablePhotosLayout_locationNamesFutureForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  uint64_t v5 = [v3 assetAtItemIndexPath:v8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 localizedGeoDescription];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

- (id)_displayFaceForItem:(int64_t)a3
{
  long long v4 = self->_currentDataSource;
  v7[0] = [(PXAssetsDataSource *)v4 identifier];
  v7[1] = 0;
  v7[2] = a3;
  v7[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = [(PXAssetsDataSource *)v4 primaryFaceForAssetAtItemIndexPath:v7];

  return v5;
}

- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5
{
  uint64_t v8 = [(PXZoomablePhotosLayout *)self _displayAssetForItem:a4];
  double v9 = *MEMORY[0x1E4F1DB20];
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (([v8 representsBurst] & 1) == 0)
  {
    id v13 = [(PXZoomablePhotosLayout *)self viewModel];
    uint64_t v14 = [v13 preferredAssetCropDelegate];

    if (v14)
    {
      [v14 preferredCropForAsset:v8 withAspectRatio:a5];
      double v9 = v15;
      CGFloat v10 = v16;
      CGFloat v11 = v17;
      CGFloat v12 = v18;
    }
    else
    {
      uint64_t v19 = [(PXZoomablePhotosLayout *)self viewModel];
      int v20 = [v19 isFaceModeEnabled];

      if (v20)
      {
        id v21 = [(PXZoomablePhotosLayout *)self _displayFaceForItem:a4];
        uint64_t v22 = v21;
        if (v21)
        {
          [v21 normalizedCropRect];
          double v9 = v23;
          CGFloat v10 = v24;
          CGFloat v11 = v25;
          CGFloat v12 = v26;
        }
      }
    }
    v34.origin.double x = v9;
    v34.origin.double y = v10;
    v34.size.double width = v11;
    v34.size.double height = v12;
    if (CGRectIsEmpty(v34))
    {
      double v9 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v8, 4, 0, a5);
      CGFloat v10 = v27;
      CGFloat v11 = v28;
      CGFloat v12 = v29;
    }
  }
  v35.origin.double x = v9;
  v35.origin.double y = v10;
  v35.size.double width = v11;
  v35.size.double height = v12;
  if (CGRectIsEmpty(v35))
  {
    double v9 = *(double *)off_1E5DAB010;
    CGFloat v10 = *((double *)off_1E5DAB010 + 1);
    CGFloat v11 = *((double *)off_1E5DAB010 + 2);
    CGFloat v12 = *((double *)off_1E5DAB010 + 3);
  }

  double v30 = v9;
  double v31 = v10;
  double v32 = v11;
  double v33 = v12;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  long long v4 = [(PXZoomablePhotosLayout *)self _displayAssetForItem:a4];
  [v4 aspectRatio];
  double v6 = v5;

  return v6;
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  double v5 = self->_currentDataSource;
  v8[0] = [(PXAssetsDataSource *)v5 identifier];
  v8[1] = 0;
  _OWORD v8[2] = a4;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  double v6 = [(PXAssetsDataSource *)v5 objectReferenceAtIndexPath:v8];

  return v6;
}

- (void)_ensureZoomingAnchor
{
  if ([(PXGAnchor *)self->_anchor canBeReused])
  {
    id v12 = [(PXGLayout *)self rootLayout];
    id v3 = [v12 createAnchorWithAnchor:self->_anchor];
    long long v4 = [v3 autoInvalidate];
    anchor = self->_anchor;
    self->_anchor = v4;
  }
  else
  {
    double v6 = [(PXZoomablePhotosLayout *)self anchorAssetReference];

    if (!v6) {
      return;
    }
    uint64_t v7 = [(PXZoomablePhotosLayout *)self anchorAssetReference];
    id v12 = [(PXGLayout *)self dynamicSpriteReferenceForObjectReference:v7];

    id v3 = [(PXGLayout *)self rootLayout];
    [(PXZoomablePhotosLayout *)self scaleCenterTargetInViewport];
    anchor = objc_msgSend(v3, "createAnchorForScrollingSpriteForSpriteReference:normalizedAnchorPoint:toVisibleLocation:", v12, self->_normalizedScaleCenterInAnchorSprite.x, self->_normalizedScaleCenterInAnchorSprite.y, v8, v9);
    CGFloat v10 = [anchor autoInvalidate];
    CGFloat v11 = self->_anchor;
    self->_anchor = v10;
  }
}

- (void)_performAnchorAlignmentVisualShiftWithBaseLayout:(id)a3
{
}

- (BOOL)_isAllowedToShiftItem:(int64_t)a3 inLayout:(id)a4
{
  double v5 = (double)[(PXZoomablePhotosLayout *)self _estimatedItemsPerScreenForLayout:a4];
  double v6 = +[PXZoomablePhotosSettings sharedInstance];
  [v6 shiftingRequiredScreensTopDistance];
  double v8 = v7;

  return v8 * v5 <= (double)a3;
}

- (int64_t)_estimatedItemsPerScreenForLayout:(id)a3
{
  id v4 = a3;
  [(PXGLayout *)self visibleRect];
  [v4 numberOfColumns];

  PXSizeGetArea();
}

uint64_t __73__PXZoomablePhotosLayout_setWantsOverBackgroundFloatingHeaderAppearance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsOverBackgroundFloatingHeaderAppearance:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke(uint64_t result, unint64_t a2, void *a3)
{
  unint64_t v3 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    uint64_t v4 = result;
    double v6 = (_OWORD *)a3[3];
    uint64_t v5 = a3[4];
    double v7 = (float32x2_t *)a3[2];
    long long v28 = *(_OWORD *)off_1E5DAAF90;
    long long v26 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v27 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v24 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v25 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v22 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v23 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v20 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v21 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v19 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v17 = *((_OWORD *)off_1E5DAAF88 + 1);
    long long v18 = *(_OWORD *)off_1E5DAAF88;
    uint64_t v8 = *((void *)off_1E5DAAF88 + 4);
    do
    {
      CGFloat v9 = *(double *)(v4 + 40);
      CGFloat v10 = *(double *)(v4 + 48);
      v30.origin.double x = 0.0;
      v30.origin.double y = 0.0;
      v30.size.double width = v9;
      v30.size.double height = v10;
      CGFloat MidX = CGRectGetMidX(v30);
      v31.origin.double x = 0.0;
      v31.origin.double y = 0.0;
      v31.size.double width = v9;
      v31.size.double height = v10;
      CGFloat MidY = CGRectGetMidY(v31);
      v32.origin.double x = 0.0;
      v32.origin.double y = 0.0;
      v32.size.double width = v9;
      v32.size.double height = v10;
      CGFloat Width = CGRectGetWidth(v32);
      v33.origin.double x = 0.0;
      v33.origin.double y = 0.0;
      v33.size.double width = v9;
      v33.size.double height = v10;
      CGFloat Height = CGRectGetHeight(v33);
      v14.f64[0] = Width;
      v14.f64[1] = Height;
      *(CGFloat *)double v7 = MidX;
      *(CGFloat *)&v7[1] = MidY;
      v7[2] = (float32x2_t)0xC059000000000000;
      v7[3] = vcvt_f32_f64(v14);
      *double v6 = v28;
      v6[1] = v27;
      v6[4] = v25;
      v6[5] = v26;
      _OWORD v6[2] = v23;
      v6[3] = v24;
      v6[8] = v21;
      v6[9] = v22;
      v6[6] = v19;
      v6[7] = v20;
      *(void *)(v5 + 32) = v8;
      *(_OWORD *)uint64_t v5 = v18;
      *(_OWORD *)(v5 + 16) = v17;
      *(unsigned char *)(v5 + 1) = 3;
      float32x2_t v15 = vcvt_f32_f64(*(float64x2_t *)(v4 + 40));
      CGRect result = [*(id *)(v4 + 32) displayScale];
      *(float *)&double v16 = v16;
      *(float32x2_t *)(v5 + 8) = vmul_n_f32(v15, *(float *)&v16);
      v6 += 10;
      v7 += 4;
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return result;
}

void __58__PXZoomablePhotosLayout__updateDebugVisualizationSprites__block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) visibleRect];
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v6 = [*(id *)(a1 + 32) viewModel];
  double v7 = v6;
  if (v6)
  {
    [v6 zoomState];
  }
  else
  {
    uint64_t v45 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
  }

  MEMORY[0x1F4188790](v8, v9);
  CGFloat v11 = &v32 - 2 * v10;
  id v12 = [*(id *)(a1 + 32) anchorAssetReference];

  if (v12)
  {
    id v13 = [*(id *)(a1 + 32) primaryItemsLayout];
    float64x2_t v14 = [*(id *)(a1 + 32) anchorAssetReference];
    float32x2_t v15 = v14;
    uint64_t v32 = v5;
    uint64_t v33 = v3;
    if (v14)
    {
      objc_msgSend(v14, "indexPath", v32, v33);
      uint64_t v16 = v38;
    }
    else
    {
      uint64_t v16 = 0;
      long long v37 = 0u;
      long long v38 = 0u;
    }
    objc_msgSend(v13, "frameForItem:", v16, v32, v33);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    *(void *)&long long v35 = 0;
    memset(&v34, 0, sizeof(v34));
    long long v28 = *(id **)(a1 + 32);
    double v29 = [v28[133] primaryLayer];
    [v28 _spriteTransformForLayout:v29];

    CGAffineTransform v46 = v34;
    v48.origin.double x = v21;
    v48.origin.double y = v23;
    v48.size.double width = v25;
    v48.size.double height = v27;
    CGRectApplyAffineTransform(v48, &v46);
    PXRectGetCenter();
  }
  uint64_t v17 = *(void *)off_1E5DAB000;
  uint64_t v18 = *((void *)off_1E5DAB000 + 1);
  uint64_t v19 = *(void *)off_1E5DAB000;
  uint64_t v36 = 0;
  long long v35 = 0u;
  memset(&v34, 0, sizeof(v34));
  CGRect v30 = *(void **)(a1 + 32);
  CGRect v31 = [v30 primaryItemsLayout];
  [v30 _getMiniModeInfo:&v34 forLayout:v31];

  uint64_t *v11 = v19;
  v11[1] = v18;
  v11[2] = v17;
  v11[3] = v18;
  [*(id *)(a1 + 32) scaleCenterTargetInViewport];
  PXPointAdd();
}

void __44__PXZoomablePhotosLayout__updatePrefetching__block_invoke()
{
}

uint64_t __44__PXZoomablePhotosLayout__updatePrefetching__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1312 + *(void *)(result + 40)) = 0;
  return result;
}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_2(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) entityManager];
  double v6 = [v5 effectComponent];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_3;
  v9[3] = &unk_1E5DB8210;
  long long v7 = a3[1];
  long long v11 = *a3;
  long long v12 = v7;
  uint64_t v13 = *((void *)a3 + 4);
  uint64_t v8 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  char v14 = *(unsigned char *)(a1 + 48);
  [v6 performChanges:v9];
}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_4(uint64_t a1, uint64_t a2, long long *a3)
{
  double v6 = [*(id *)(a1 + 32) entityManager];
  long long v7 = [v6 effectComponent];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_5;
  v12[3] = &unk_1E5DB8260;
  uint64_t v22 = a2;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 80);
  long long v16 = *(_OWORD *)(a1 + 64);
  long long v17 = v9;
  uint64_t v18 = *(void *)(a1 + 96);
  long long v10 = a3[1];
  long long v19 = *a3;
  long long v20 = v10;
  uint64_t v21 = *((void *)a3 + 4);
  char v23 = *(unsigned char *)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = v8;
  uint64_t v14 = v11;
  [v7 performChanges:v12];
}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_5(uint64_t a1, void *a2)
{
  id v9 = a2;
  int v3 = *(_DWORD *)(a1 + 148);
  if (v3)
  {
    if (v3 == 1) {
      uint64_t v4 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v4 = *(void *)(a1 + 56);
    }
    uint64_t v5 = [*(id *)(a1 + 32) count] - v4;
    uint64_t v6 = [*(id *)(a1 + 32) count] - 1;
    long long v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5 & ~(v5 >> 63)];
    id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6 & ~(v6 >> 63)];
    if (v7) {
      [v7 collapseProgress];
    }
    if (v8) {
      [v8 collapseProgress];
    }
    [v7 yPosition];
    [v8 yPosition];
    PXFloatByLinearlyInterpolatingFloats();
  }
}

void __43__PXZoomablePhotosLayout__updateBlurEffect__block_invoke_3(uint64_t a1, void *a2)
{
  id v37 = a2;
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    long long v35 = *((_OWORD *)off_1E5DAAF70 + 1);
    long long v36 = *(_OWORD *)off_1E5DAAF70;
    long long v34 = *(_OWORD *)off_1E5DAAF90;
    long long v32 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v33 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v30 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v31 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v28 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v29 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v26 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v27 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v25 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v23 = *((_OWORD *)off_1E5DAAF88 + 1);
    long long v24 = *(_OWORD *)off_1E5DAAF88;
    __asm { FMOV            V8.2S, #1.0 }
    uint64_t v12 = *((void *)off_1E5DAAF88 + 4);
    do
    {
      id v13 = objc_alloc((Class)off_1E5DA6820);
      uint64_t v14 = [*(id *)(a1 + 32) entityManager];
      long long v15 = (void *)[v13 initWithEntityManager:v14];

      [*(id *)(a1 + 40) addObject:v15];
      long long v16 = (long long *)(*(void *)(a1 + 64) + v3);
      *long long v16 = v36;
      v16[1] = v35;
      long long v17 = (long long *)(*(void *)(a1 + 72) + v4);
      *long long v17 = v34;
      v17[1] = v33;
      v17[4] = v31;
      void v17[5] = v32;
      v17[2] = v29;
      v17[3] = v30;
      v17[8] = v27;
      v17[9] = v28;
      void v17[6] = v25;
      v17[7] = v26;
      uint64_t v18 = *(void *)(a1 + 80) + v5;
      *(_OWORD *)uint64_t v18 = v24;
      *(_OWORD *)(v18 + 16) = v23;
      *(void *)(v18 + 32) = v12;
      uint64_t v19 = *(void *)(a1 + 80) + v5;
      if (*(unsigned char *)(a1 + 88))
      {
        *(void *)(v19 + 8) = _D8;
        char v20 = 5;
      }
      else
      {
        char v20 = 9;
      }
      *(unsigned char *)(v19 + 1) = v20;
      uint64_t v21 = *(unsigned int *)(*(void *)(a1 + 56) + 4 * v6);
      int v22 = objc_msgSend(v15, "effectId", v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
      *(_DWORD *)([v37 mutableEffectIds] + 4 * v21) = v22;

      ++v6;
      v5 += 40;
      v4 += 160;
      v3 += 32;
    }
    while (v6 < *(unsigned int *)(a1 + 48));
  }
}

uint64_t __47__PXZoomablePhotosLayout__updateZoomTransforms__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1120) invalidateAnchorItemFrames];
}

uint64_t __37__PXZoomablePhotosLayout__updateZoom__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __37__PXZoomablePhotosLayout__updateZoom__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 itemsLayout];
  uint64_t v6 = [v5 numberOfColumns];

  long long v7 = [v4 itemsLayout];

  uint64_t v8 = [v7 numberOfColumns];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v8 > v6;
  }
}

BOOL __39__PXZoomablePhotosLayout__updateLayers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 itemsLayout];
  BOOL v4 = [v3 numberOfColumns] == *(void *)(a1 + 32);

  return v4;
}

- (void)_updateSurroundingScrollableContent
{
  CGFloat v3 = *((double *)off_1E5DAAF10 + 1);
  CGFloat v4 = *((double *)off_1E5DAAF10 + 3);
  uint64_t v5 = [(PXGLayout *)self superlayout];

  if (v5)
  {
    uint64_t v6 = [(PXGLayout *)self rootLayout];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v7 = [(PXGLayout *)self superlayout];
    uint64_t v8 = [v7 sublayoutDataStore];
    id v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "geometryForSublayout:", self, *(void *)&v3, *(void *)&v4);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }

    uint64_t v11 = [(PXGLayout *)self superlayout];
    objc_msgSend(v6, "convertRect:fromLayout:", v11, v13, v12);

    [v6 frame];
    [v6 flexibleRegionInsets];
    PXEdgeInsetsInsetRect();
  }
  CGFloat v10 = *((double *)off_1E5DAAF10 + 2);
  self->_surroundingScrollableContent.double top = *(CGFloat *)off_1E5DAAF10;
  self->_surroundingScrollableContent.double left = v3;
  self->_surroundingScrollableContent.double bottom = v10;
  self->_surroundingScrollableContent.double right = v4;
}

- (void)invalidateItemsLayout
{
  id v2 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  [v2 setNeedsUpdate];
}

- (id)presentedItemsGeometryForDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXZoomablePhotosLayout *)self presentedDataSource];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    long long v7 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
    uint64_t v8 = [v7 itemsGeometry];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (void)_callAddContentActionHandler
{
  uint64_t v2 = [(PXZoomablePhotosLayout *)self addContentHandler];
  CGFloat v3 = (void *)v2;
  if (!v2) {
    PXAssertGetLog();
  }
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (BOOL)_layoutAllowsCaptionsInSquare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXZoomablePhotosLayout *)self viewModel];
  char v6 = [v5 aspectFit];
  LODWORD(self) = [(PXZoomablePhotosLayout *)self _layoutHasIndividualItems:v4];

  if (self) {
    char v7 = [v5 allowsCaptionsInSquare];
  }
  else {
    char v7 = 0;
  }
  char v8 = v7 & ~v6;

  return v8;
}

- (BOOL)_getMiniModeInfo:(id *)a3 forLayout:(id)a4
{
  id v5 = a4;
  BOOL miniModeIsAnchoringToBottom = self->_miniModeIsAnchoringToBottom;
  [v5 visibleRect];
  if (miniModeIsAnchoringToBottom)
  {
    [v5 contentSize];
    PXPointIsNull();
  }
  [(PXGLayout *)self safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

- (void)_modifyMiniModeSpritesForLayout:(id)a3 spriteIndexRange:(_PXGSpriteIndexRange)a4 sprites:(id *)a5
{
  id v8 = a3;
  if ([v8 numberOfItems])
  {
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    memset(v21, 0, sizeof(v21));
    if ([(PXZoomablePhotosLayout *)self _getMiniModeInfo:v21 forLayout:v8])
    {
      unint64_t v9 = HIDWORD(*(unint64_t *)&a4);
      CGFloat v10 = [(PXZoomablePhotosLayout *)self viewModel];
      uint64_t v11 = [v10 miniModeAnimator];

      long long v12 = [(PXZoomablePhotosLayout *)self spec];
      [v12 miniModeEdgeMargins];
      var2 = a5->var2;
      [v11 gridMiniStylingPercentage];
      if (v9)
      {
        uint64_t v14 = 0xFFFFFFFFLL;
        double v15 = 1.79769313e308;
        do
        {
          long long v16 = (float *)((char *)var2 + 32 * v9 - 4);
          while (1)
          {
            unint64_t v17 = v9 - 1;
            double v18 = vabdd_f64(*((double *)&v22 + 1), *(double *)(v16 - 5) + *v16 * 0.5);
            if (v18 <= v15 && *v16 > 0.0) {
              break;
            }
            if (v14 != -1) {
              goto LABEL_13;
            }
            v16 -= 8;
            uint64_t v14 = 0xFFFFFFFFLL;
            --v9;
            if (v17 + 1 <= 1) {
              goto LABEL_14;
            }
          }
          uint64_t v14 = v9 - 1;
          double v15 = v18;
        }
        while (v9-- > 1);
        if (v17 != -1)
        {
LABEL_13:
          uint64_t v20 = objc_msgSend(v8, "itemForSpriteIndex:", v14, *((double *)&v22 + 1), 0.5);
          objc_msgSend(v8, "spriteIndexForItem:", v20 - objc_msgSend(v8, "columnForItem:", v20) + objc_msgSend(v8, "numberOfColumns"));
        }
      }
LABEL_14:
      [v8 referenceSize];
      [v12 miniModeInteritemSpacing];
      [v12 interitemSpacing];
      [v8 numberOfColumns];
      PXFloatByLinearlyInterpolatingFloats();
    }
  }
}

void __68__PXZoomablePhotosLayout__configureMiniModeSpriteModifierForLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  long long v9 = *(_OWORD *)(a4 + 16);
  v10[0] = *(_OWORD *)a4;
  v10[1] = v9;
  uint64_t v11 = *(void *)(a4 + 32);
  [WeakRetained _modifyMiniModeSpritesForLayout:v7 spriteIndexRange:a3 sprites:v10];
}

- (id)itemsGeometry
{
  uint64_t v2 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  CGFloat v3 = [v2 itemsGeometry];

  return v3;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  LODWORD(v3) = a3;
  unsigned int v10 = -1;
  if ([(PXGLayout *)self isSpriteIndex:*(void *)&a3 decoratingSpriteWithIndex:&v10])
  {
    uint64_t v3 = v10;
  }
  else
  {
    uint64_t v3 = v3;
  }
  id v5 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
  uint64_t v6 = [(PXGLayout *)self convertSpriteIndex:v3 toDescendantLayout:v5];

  if (v6 == -1)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(PXZoomablePhotosLayout *)self primaryItemsLayout];
    id v8 = [v7 hitTestResultForSpriteIndex:v6];
  }
  return v8;
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  zoomLayout = self->_zoomLayout;
  if (zoomLayout)
  {
    char v4 = 0;
    (*((void (**)(id, PXGZoomLayout *, char *))a3 + 2))(a3, zoomLayout, &v4);
  }
}

- (void)scrollSpeedRegimeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosLayout;
  [(PXGSplitLayout *)&v3 scrollSpeedRegimeDidChange];
  PXZoomablePhotosInvalidate(self, 1048836);
}

- (void)containingScrollViewDidScroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PXZoomablePhotosLayout *)self anchorAssetReference];
  if (objc_claimAutoreleasedReturnValue()) {
    PXFloatApproximatelyEqualToFloat();
  }
  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosLayout;
  -[PXGLayout containingScrollViewDidScroll:](&v6, sel_containingScrollViewDidScroll_, x, y);
}

uint64_t __44__PXZoomablePhotosLayout_setEffectProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateEffects];
}

- (void)setEnableAddContentAccessoryItem:(BOOL)a3
{
  if (self->_enableAddContentAccessoryItem != a3)
  {
    self->_enableAddContentAccessoryItem = a3;
    PXZoomablePhotosInvalidate(self, 8);
  }
}

- (void)setAddContentHandler:(id)a3
{
  if (self->_addContentHandler != a3)
  {
    char v4 = (void *)[a3 copy];
    id addContentHandler = self->_addContentHandler;
    self->_id addContentHandler = v4;

    BOOL v6 = self->_addContentHandler != 0;
    [(PXZoomablePhotosLayout *)self setEnableAddContentAccessoryItem:v6];
  }
}

- (void)setPreventFillingTopAreaInsets:(BOOL)a3
{
  if (self->_preventFillingTopAreaInsets != a3)
  {
    self->_preventFillingTopAreaInsets = a3;
    PXZoomablePhotosInvalidate(self, 8);
  }
}

- (void)setEffectiveOverlayInsets:(UIEdgeInsets)a3
{
}

- (void)setAnchorAssetReference:(id)a3
{
  id v5 = (PXAssetReference *)a3;
  if (self->__anchorAssetReference != v5)
  {
    objc_storeStrong((id *)&self->__anchorAssetReference, a3);
    [(PXGZoomLayout *)self->_zoomLayout setAnchorObjectReference:v5];
  }
}

void __34__PXZoomablePhotosLayout_setSpec___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v8 = a2;
  char v4 = [v3 viewModel];
  id v5 = [v4 allowedColumns];
  BOOL v6 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  uint64_t v7 = [v5 indexOfObject:v6];

  [v8 zoomToColumnIndex:v7 withAnchorAssetReference:0 animated:0];
}

- (PXZoomablePhotosLayout)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXZoomablePhotosLayout.m", 377, @"%s is not available as initializer", "-[PXZoomablePhotosLayout init]");

  abort();
}

uint64_t __44__PXZoomablePhotosLayout_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 forceAccurateAllSectionsIfNeeded];
}

+ (id)visualizeBestAnchorColumnsForLayouts:(id)a3 imageWidth:(double)a4
{
}

void __74__PXZoomablePhotosLayout_visualizeBestAnchorColumnsForLayouts_imageWidth___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXEdgeInsetsInsetSize();
}

BOOL __74__PXZoomablePhotosLayout_visualizeBestAnchorColumnsForLayouts_imageWidth___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 numberOfColumns] == 3;
}

+ (void)getBestAnchorColumns:(int64_t *)a3 forItemLayouts:(id)a4 startingAtBaseLayout:(id)a5 anchorItem:(int64_t)a6 normalizedScaleCenterInAnchor:(CGPoint)a7 biasTowardsCenter:(BOOL)a8
{
  BOOL v19 = a8;
  long long v16 = a3;
  SEL v17 = a2;
  id v18 = a1;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  id v10 = a5;
  uint64_t v11 = [v21 count];
  uint64_t v12 = [v21 indexOfObject:v10];
  uint64_t v20 = v11;
  if (v11 <= 0)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:v17, v18, @"PXZoomablePhotosLayout.m", 2539, @"Invalid parameter not satisfying: %@", @"layoutCount > 0" object file lineNumber description];
  }
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:v17, v18, @"PXZoomablePhotosLayout.m", 2540, @"Invalid parameter not satisfying: %@", @"anchorItem != NSNotFound" object file lineNumber description];
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:v17, v18, @"PXZoomablePhotosLayout.m", 2541, @"Invalid parameter not satisfying: %@", @"baseLayoutIndex != NSNotFound" object file lineNumber description];
  }
  PXGAssertErrValidPoint();
}

@end