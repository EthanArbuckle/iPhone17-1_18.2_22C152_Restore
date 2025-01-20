@interface PXZoomablePhotosViewModel
- ($49CB12D5354CCF22210FF066E175BE67)pinchState;
- ($C4B70A1B11CB87E7174F2B82042BF1A7)zoomState;
- (BOOL)allowDenseLevels;
- (BOOL)allowsCaptionsInSquare;
- (BOOL)alwaysShowTopBadges;
- (BOOL)aspectFit;
- (BOOL)captionsVisible;
- (BOOL)hasContentToZoom;
- (BOOL)hasInlineHeadersContent;
- (BOOL)isDisplayingIndividualItems;
- (BOOL)isFaceModeEnabled;
- (BOOL)isInSelectMode;
- (BOOL)isInteractiveZooming;
- (BOOL)isInteractiveZoomingAllowed;
- (BOOL)isPerformingInitialChanges;
- (BOOL)isPinching;
- (BOOL)isResetToInitialState;
- (BOOL)layoutExtendsContentBelowBounds;
- (BOOL)lowMemoryMode;
- (BOOL)shouldHideSurroundingContent;
- (BOOL)useLowMemoryDecode;
- (BOOL)viewBasedDecorationsEnabled;
- (BOOL)wantsAssetIndexBadge;
- (BOOL)wantsDimmedSelectionStyle;
- (BOOL)wantsFileSizeBadge;
- (BOOL)wantsNumberedSelectionStyle;
- (BOOL)wantsOverBackgroundFloatingHeaderAppearance;
- (NSArray)allowedColumnWidths;
- (NSArray)allowedColumns;
- (NSSet)draggedAssetReferences;
- (NSString)description;
- (PXAssetReference)anchorAssetReference;
- (PXAssetReference)dropTargetAssetReference;
- (PXAssetReference)miniModeAnchorAssetReference;
- (PXAssetsDataSourceManager)assetsDataSourceManager;
- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXMediaProvider)mediaProvider;
- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate;
- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXUpdater)updater;
- (PXZoomableInlineHeadersDataSourceManager)inlineHeadersDataSourceManager;
- (PXZoomablePhotosLayoutSpecManager)specManager;
- (PXZoomablePhotosMiniModeAnimator)miniModeAnimator;
- (PXZoomablePhotosUserDefaults)userDefaults;
- (PXZoomablePhotosViewModel)init;
- (PXZoomablePhotosViewModel)initWithDataSourceManager:(id)a3 selectionManager:(id)a4 mediaProvider:(id)a5 specManager:(id)a6 loadingStatusManager:(id)a7 badgesModifier:(id)a8 preferredAssetCropDelegate:(id)a9 preferredColumnCountsDelegate:(id)a10 inlinePlaybackController:(id)a11;
- (PXZoomablePhotosViewModelGeometryDelegate)geometryDelegate;
- (_NSRange)denseColumnsIndexRange;
- (double)_columnIndexForItemWidth:(double)a3;
- (double)_columnWidthForDesiredColumnIndex:(double)a3;
- (double)interactiveZoomColumnIndex;
- (double)viewModeInteractionProgress;
- (id)badgesModifier;
- (id)effectProvider;
- (int64_t)_clampColumnIndexToValidIndex:(int64_t)a3;
- (int64_t)_closestColumnIndexForAnimatedValue:(double)a3;
- (int64_t)_closestColumnIndexForColumnWidth:(double)a3;
- (int64_t)_maxColumnsForIndividualItems;
- (int64_t)_nextColumnIndexForInitialColumnWidth:(double)a3 currentColumnWidth:(double)a4 velocity:(double)a5;
- (int64_t)bestColumnIndexForPreferredNumberOfColumns:(int64_t)a3;
- (int64_t)contentShiftStrategy;
- (int64_t)defaultColumnIndex;
- (int64_t)denseZoomLevelForZoomState:(id *)a3;
- (unint64_t)viewMode;
- (void)_handleSpecChange;
- (void)_invalidateAllowedColumns;
- (void)_invalidateAlphaAnimator;
- (void)_invalidateMiniModeAnimator;
- (void)_invalidatePinchVelocity;
- (void)_invalidateShouldHideSurroundingContent;
- (void)_invalidateZoomState;
- (void)_setNeedsUpdate;
- (void)_updateAllowedColumns;
- (void)_updateAlphaAnimator;
- (void)_updateIsDisplayingIndividualItems;
- (void)_updateMiniModeAnimator;
- (void)_updatePinchVelocity;
- (void)_updateShouldHideSurroundingContent;
- (void)_updateZoomState;
- (void)dealloc;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)performInitialChanges:(id)a3;
- (void)resetColumns;
- (void)resetToInitialState;
- (void)saveCurrentZoomLevelAsUserPreferredIfPossible;
- (void)setAllowedColumns:(id)a3;
- (void)setAllowsCaptionsInSquare:(BOOL)a3;
- (void)setAlwaysShowTopBadges:(BOOL)a3;
- (void)setAspectFit:(BOOL)a3;
- (void)setCaptionsVisible:(BOOL)a3;
- (void)setContentShiftStrategy:(int64_t)a3;
- (void)setDraggedAssetReferences:(id)a3;
- (void)setDropTargetAssetReference:(id)a3;
- (void)setEffectProvider:(id)a3;
- (void)setFaceModeEnabled:(BOOL)a3;
- (void)setGeometryDelegate:(id)a3;
- (void)setHasInlineHeadersContent:(BOOL)a3;
- (void)setInteractiveZoomColumnIndex:(double)a3 withAnchorAssetReference:(id)a4;
- (void)setIsDisplayingIndividualItems:(BOOL)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setIsInteractiveZooming:(BOOL)a3;
- (void)setIsInteractiveZoomingAllowed:(BOOL)a3;
- (void)setIsPinching:(BOOL)a3;
- (void)setLayoutExtendsContentBelowBounds:(BOOL)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setMiniModeAnchorAssetReference:(id)a3;
- (void)setPinchState:(id *)a3 withAnchorAssetReference:(id)a4;
- (void)setShouldHideSurroundingContent:(BOOL)a3;
- (void)setUseLowMemoryDecode:(BOOL)a3;
- (void)setViewBasedDecorationsEnabled:(BOOL)a3;
- (void)setViewMode:(unint64_t)a3;
- (void)setViewModeInteractionProgress:(double)a3;
- (void)setWantsAssetIndexBadge:(BOOL)a3;
- (void)setWantsDimmedSelectionStyle:(BOOL)a3;
- (void)setWantsFileSizeBadge:(BOOL)a3;
- (void)setWantsNumberedSelectionStyle:(BOOL)a3;
- (void)setWantsOverBackgroundFloatingHeaderAppearance:(BOOL)a3;
- (void)setZoomState:(id *)a3;
- (void)zoomInToIndividualItemsWithAnchorAssetReference:(id)a3 animated:(BOOL)a4;
- (void)zoomInToLastRememberedWithAnchorAssetReference:(id)a3 animated:(BOOL)a4;
- (void)zoomToColumnIndex:(int64_t)a3 withAnchorAssetReference:(id)a4 animated:(BOOL)a5;
@end

@implementation PXZoomablePhotosViewModel

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inlinePlaybackController);
  return (PXGDisplayAssetPixelBufferSourcesProvider *)WeakRetained;
}

- (void)setContentShiftStrategy:(int64_t)a3
{
  self->_contentShiftStrategy = a3;
}

- (BOOL)aspectFit
{
  return self->_aspectFit;
}

- (void)_setNeedsUpdate
{
}

- (int64_t)contentShiftStrategy
{
  return self->_contentShiftStrategy;
}

- (int64_t)_maxColumnsForIndividualItems
{
  v2 = [(PXZoomablePhotosViewModel *)self specManager];
  v3 = [v2 spec];
  int64_t v4 = [v3 maxColumnsForIndividualItems];

  return v4;
}

- (PXZoomablePhotosLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (BOOL)isDisplayingIndividualItems
{
  return self->_isDisplayingIndividualItems;
}

- (BOOL)wantsOverBackgroundFloatingHeaderAppearance
{
  return self->_wantsOverBackgroundFloatingHeaderAppearance;
}

uint64_t __51__PXZoomablePhotosViewModel_performInitialChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (BOOL)captionsVisible
{
  return self->_captionsVisible;
}

- ($C4B70A1B11CB87E7174F2B82042BF1A7)zoomState
{
  long long v3 = *(_OWORD *)&self[5].var6;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[5].var4;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[5].var11;
  long long v4 = *(_OWORD *)&self[4].var14;
  retstr->var0 = *(CGPoint *)&self[4].var12;
  *(_OWORD *)&retstr->var1 = v4;
  long long v5 = *(_OWORD *)&self[5].var2;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[5].var0.y;
  *(_OWORD *)&retstr->var5 = v5;
  return self;
}

- (BOOL)layoutExtendsContentBelowBounds
{
  return self->_layoutExtendsContentBelowBounds;
}

uint64_t __49__PXZoomablePhotosViewModel__updateAlphaAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMaxColumnsForAspectFit:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (void)_updateShouldHideSurroundingContent
{
}

- (BOOL)shouldHideSurroundingContent
{
  return self->_shouldHideSurroundingContent;
}

- (void)setShouldHideSurroundingContent:(BOOL)a3
{
  if (self->_shouldHideSurroundingContent != a3)
  {
    self->_shouldHideSurroundingContent = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x4000];
  }
}

- (void)resetColumns
{
  long long v3 = [(PXZoomablePhotosViewModel *)self userDefaults];
  long long v4 = [v3 preferredIndividualItemsColumnsNumber];
  uint64_t v5 = [v4 integerValue];

  if (!v5)
  {
    v6 = [(PXZoomablePhotosViewModel *)self specManager];
    v7 = [v6 spec];
    uint64_t v5 = [v7 initialNumberOfColumns];
  }
  int64_t v8 = [(PXZoomablePhotosViewModel *)self bestColumnIndexForPreferredNumberOfColumns:v5];
  [(PXZoomablePhotosViewModel *)self zoomToColumnIndex:v8 withAnchorAssetReference:0 animated:0];
}

- (void)saveCurrentZoomLevelAsUserPreferredIfPossible
{
  [(PXZoomablePhotosViewModel *)self zoomState];
  uint64_t v3 = v8;
  long long v4 = [(PXZoomablePhotosViewModel *)self specManager];
  uint64_t v5 = [v4 spec];

  if (v3 >= 2
    && v3 <= [v5 maxColumnsForIndividualItems]
    && ([v5 userInterfaceIdiom] != 1 || objc_msgSend(v5, "layoutOrientation") != 2))
  {
    v6 = [NSNumber numberWithInteger:v3];
    v7 = [(PXZoomablePhotosViewModel *)self userDefaults];
    [v7 setPreferredIndividualItemsColumnsNumber:v6];
  }
}

- (PXZoomablePhotosUserDefaults)userDefaults
{
  v2 = [(PXZoomablePhotosViewModel *)self specManager];
  uint64_t v3 = [v2 userDefaults];

  return (PXZoomablePhotosUserDefaults *)v3;
}

- (int64_t)bestColumnIndexForPreferredNumberOfColumns:(int64_t)a3
{
  uint64_t v5 = [(PXZoomablePhotosViewModel *)self allowedColumns];
  v6 = [(PXZoomablePhotosViewModel *)self specManager];
  v7 = [v6 spec];

  int64_t v8 = [v7 bestColumnIndexForPreferredNumberOfColumns:a3 allowedColumns:v5];
  return v8;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (BOOL)viewBasedDecorationsEnabled
{
  return self->_viewBasedDecorationsEnabled;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  v2 = [(PXZoomablePhotosViewModel *)self selectionManager];
  uint64_t v3 = [v2 selectionSnapshot];

  return (PXSelectionSnapshot *)v3;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (BOOL)alwaysShowTopBadges
{
  return self->_alwaysShowTopBadges;
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 objectAtIndexedSubscript:v3];
  [(id)objc_claimAutoreleasedReturnValue() doubleValue];
  log10(fabs(v5) * 1000.0 + 1.0);
  PXFloatSign();
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_5(uint64_t a1, void *a2)
{
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_6(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v5 = a2;
  [v5 setColumnIndex:v3];
  [v5 setTargetColumnIndex:*(double *)(a1 + 40)];
  double v4 = 1.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v4 = 0.0;
  }
  [v5 setAutoFadeAmount:v4];
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = (double)*(uint64_t *)(a1 + 32);
  id v4 = a2;
  [v4 setColumnIndex:v3];
  [v4 setTargetColumnIndex:(double)*(uint64_t *)(a1 + 32)];
  [v4 setAutoFadeAmount:0.0];
}

- (void)_updateAlphaAnimator
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int64_t v8 = 0;
  BOOL v3 = [(PXZoomablePhotosViewModel *)self aspectFit];
  int64_t v4 = 0;
  if (v3) {
    int64_t v4 = [(PXZoomablePhotosViewModel *)self _maxColumnsForIndividualItems];
  }
  int64_t v8 = v4;
  alphaAnimator = self->_alphaAnimator;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PXZoomablePhotosViewModel__updateAlphaAnimator__block_invoke;
  v6[3] = &unk_1E5DB2048;
  v6[4] = v7;
  [(PXZoomablePhotosAlphaAnimator *)alphaAnimator performChanges:v6];
  _Block_object_dispose(v7, 8);
}

uint64_t __216__PXZoomablePhotosViewModel_initWithDataSourceManager_selectionManager_mediaProvider_specManager_loadingStatusManager_badgesModifier_preferredAssetCropDelegate_preferredColumnCountsDelegate_inlinePlaybackController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateAllowedColumns];
  [*(id *)(a1 + 32) _invalidateAlphaAnimator];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateZoomState];
}

- (void)_invalidateAllowedColumns
{
  id v2 = [(PXZoomablePhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAllowedColumns];
}

uint64_t __46__PXZoomablePhotosViewModel__handleSpecChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateAlphaAnimator];
  [*(id *)(a1 + 32) _invalidateAllowedColumns];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateIsDisplayingIndividualItems];
}

- (void)_invalidateAlphaAnimator
{
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setAllowedColumns:v2];
  [v3 setAutoFadeAmount:0.0];
}

- (void)_updateAllowedColumns
{
  id v3 = [(PXZoomablePhotosViewModel *)self specManager];
  int64_t v4 = [v3 extendedTraitCollection];

  id v5 = [(PXZoomablePhotosViewModel *)self preferredColumnCountsDelegate];
  v6 = [v5 preferredColumnCounts:v4];

  if (!v6)
  {
    v7 = [(PXZoomablePhotosViewModel *)self specManager];
    int64_t v8 = [v7 spec];

    v9 = [v8 supportedColumns];
    [v8 minimumAssetsRequiredByColumn];
    objc_claimAutoreleasedReturnValue();
    [v4 layoutReferenceSize];
    v10 = [(PXZoomablePhotosViewModel *)self assetsDataSourceManager];
    v11 = [v10 dataSource];

    if ([v11 numberOfSections] >= 1) {
      [v11 numberOfItemsInSection:0];
    }
    [(PXZoomablePhotosViewModel *)self allowDenseLevels];
    objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    PXSizeIsEmpty();
  }
  [(PXZoomablePhotosViewModel *)self setAllowedColumns:v6];
}

- (void)setAllowedColumns:(id)a3
{
  id v5 = (NSArray *)a3;
  v6 = self->_allowedColumns;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSArray *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_allowedColumns, a3);
      int64_t v9 = [(PXZoomablePhotosViewModel *)self _maxColumnsForIndividualItems];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = 0;
      v17 = (_NSRange *)&v16;
      uint64_t v18 = 0x3010000000;
      v19 = &unk_1AB5D584F;
      long long v20 = xmmword_1AB359BD0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __47__PXZoomablePhotosViewModel_setAllowedColumns___block_invoke;
      v12[3] = &unk_1E5DB1FF8;
      v14 = &v16;
      int64_t v15 = v9;
      id v11 = v10;
      id v13 = v11;
      [(NSArray *)v5 enumerateObjectsUsingBlock:v12];
      self->_denseColumnsIndexRange = v17[2];
      objc_storeStrong((id *)&self->_allowedColumnWidths, v10);
      [(PXZoomablePhotosViewModel *)self _invalidateZoomState];
      [(PXZoomablePhotosViewModel *)self signalChange:4];

      _Block_object_dispose(&v16, 8);
    }
  }
}

- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredColumnCountsDelegate);
  return (PXPhotosPreferredColumnCountsDelegate *)WeakRetained;
}

- (void)zoomToColumnIndex:(int64_t)a3 withAnchorAssetReference:(id)a4 animated:(BOOL)a5
{
  id v9 = a4;
  if (![(PXZoomablePhotosViewModel *)self isPinching]
    && ![(PXZoomablePhotosViewModel *)self isInteractiveZooming])
  {
    self->_pendingZoomColumnIndex = [(PXZoomablePhotosViewModel *)self _clampColumnIndexToValidIndex:a3];
    objc_storeStrong((id *)&self->_anchorAssetReference, a4);
    self->_animatePendingZoom = a5;
    [(PXZoomablePhotosViewModel *)self _invalidateZoomState];
  }
}

- (int64_t)_closestColumnIndexForColumnWidth:(double)a3
{
  v6 = [(PXZoomablePhotosViewModel *)self allowedColumns];
  v7 = [(PXZoomablePhotosViewModel *)self allowedColumnWidths];
  char v8 = [v6 lastObject];
  uint64_t v9 = [v8 integerValue];

  if (![(PXZoomablePhotosViewModel *)self allowDenseLevels])
  {
    int64_t v10 = [(PXZoomablePhotosViewModel *)self _maxColumnsForIndividualItems];
    if (v9 >= v10) {
      uint64_t v9 = v10;
    }
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0x7FEFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__PXZoomablePhotosViewModel__closestColumnIndexForColumnWidth___block_invoke;
  v17[3] = &unk_1E5DB1FD0;
  id v11 = v6;
  double v22 = a3;
  id v18 = v11;
  v19 = v23;
  long long v20 = &v24;
  uint64_t v21 = v9;
  [v7 enumerateObjectsUsingBlock:v17];
  unint64_t v12 = v25[3];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXZoomablePhotosViewModel.m" lineNumber:471 description:@"Unable to find number of columns"];

    unint64_t v12 = v25[3];
    if ((v12 & 0x8000000000000000) != 0) {
      goto LABEL_9;
    }
  }
  else if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_9:
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXZoomablePhotosViewModel.m" lineNumber:472 description:@"Invalid column index"];

    goto LABEL_7;
  }
  if (v12 >= [v11 count]) {
    goto LABEL_9;
  }
LABEL_7:
  int64_t v13 = v25[3];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (BOOL)allowDenseLevels
{
  if (![(PXZoomablePhotosViewModel *)self isInSelectMode]) {
    return 1;
  }
  uint64_t v2 = +[PXZoomablePhotosSettings sharedInstance];
  char v3 = [v2 enableDenseLevelsInSelectMode];

  return v3;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (void)_updateZoomState
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  self->_isUpdatingZoomState = 1;
  v42 = +[PXZoomablePhotosSettings sharedInstance];
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  [(PXZoomablePhotosViewModel *)self zoomState];
  v43 = self->_columnWidthAnimator;
  v41 = self->_alphaAnimator;
  id v3 = [(PXZoomablePhotosViewModel *)self allowedColumns];
  v40 = [(PXZoomablePhotosViewModel *)self allowedColumnWidths];
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_pendingZoomColumnIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v4 = -[PXZoomablePhotosViewModel _clampColumnIndexToValidIndex:](self, "_clampColumnIndexToValidIndex:");
    self->_pendingZoomColumnIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  [(PXZoomablePhotosViewModel *)self pinchState];
  double normalizedColumnWidthWhenPinchStarted = self->_normalizedColumnWidthWhenPinchStarted;
  uint64_t v6 = *((void *)&v60 + 1);
  if (*((void *)&v60 + 1) >= (unint64_t)[v3 count]) {
    uint64_t v6 = [v3 count] - 1;
  }
  id v7 = [(PXZoomablePhotosAlphaAnimator *)v41 allowedColumns];
  if (v7 == v3)
  {

    int64_t v10 = v3;
  }
  else
  {
    char v8 = v7;
    char v9 = [v7 isEqual:v3];

    if (v9) {
      goto LABEL_10;
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke;
    v51[3] = &unk_1E5DB2070;
    id v52 = v3;
    [(PXZoomablePhotosAlphaAnimator *)v41 performChangesWithAnimation:0 changeBlock:v51];
    int64_t v10 = v52;
  }

LABEL_10:
  uint64_t v11 = v60;
  unint64_t v12 = [v3 objectAtIndexedSubscript:v6];
  LOBYTE(v11) = v11 == [v12 integerValue];

  if ((v11 & 1) == 0)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2;
    v48[3] = &unk_1E5DB2C68;
    id v49 = v40;
    uint64_t v50 = v6;
    [(PXNumberAnimator *)v43 performChangesWithoutAnimation:v48];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3;
    v47[3] = &__block_descriptor_40_e34_v16__0___PXMutableAlphaAnimator__8l;
    v47[4] = v6;
    [(PXZoomablePhotosAlphaAnimator *)v41 performChangesWithAnimation:0 changeBlock:v47];
  }
  BOOL v13 = [(PXZoomablePhotosViewModel *)self isPinching];
  BOOL v14 = [(PXZoomablePhotosViewModel *)self isInteractiveZooming];
  if ((v13 || v14 || self->_animatePendingZoom)
    && (![(PXZoomablePhotosViewModel *)self hasContentToZoom]
     || (unint64_t)[v3 count] <= 1))
  {
    if (![(PXZoomablePhotosViewModel *)self hasContentToZoom]) {
      PXAssertGetLog();
    }
    char v16 = 0;
    BOOL v13 = 0;
    int v17 = 0;
    self->_animatePendingZoom = 0;
    if (!self->_wasInteractiveZooming)
    {
      double v18 = normalizedColumnWidthWhenPinchStarted * *(double *)&v56;
      goto LABEL_39;
    }
  }
  else if (v14)
  {
    char v16 = 1;
    int v17 = 1;
  }
  else
  {
    if (!self->_wasInteractiveZooming)
    {
      double v20 = *(double *)&v56;
      double v18 = normalizedColumnWidthWhenPinchStarted * *(double *)&v56;
      if (v13 || v14)
      {
        if (v13) {
          goto LABEL_33;
        }
        goto LABEL_36;
      }
      goto LABEL_39;
    }
    int v17 = 0;
    char v16 = v13 || v14;
  }
  [(PXZoomablePhotosViewModel *)self interactiveZoomColumnIndex];
  -[PXZoomablePhotosViewModel _columnWidthForDesiredColumnIndex:](self, "_columnWidthForDesiredColumnIndex:");
  double v18 = v19;
  if (v16)
  {
    double v20 = 0.5;
    if (v13) {
      double v15 = *((double *)&v53 + 1);
    }
    else {
      double v15 = 0.5;
    }
    if (v13) {
      double v20 = *(double *)&v53;
    }
    if (!v17 || self->_wasInteractiveZooming)
    {
      if (v13)
      {
LABEL_33:
        objc_msgSend(v42, "pinchSmoothingDuration", v20, v15);
        goto LABEL_37;
      }
LABEL_36:
      objc_msgSend(v42, "sliderSmoothingDuration", v20, v15);
LABEL_37:
      log10(fabs(v18) * 1000.0 + 1.0);
      PXFloatSign();
    }
    [v42 zoomSpringStiffness];
    double v22 = v21;
    [v42 zoomSpringStiffness];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_53;
    v46[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v46[4] = v18;
    [(PXNumberAnimator *)v43 performChangesUsingSpringAnimationWithStiffness:v46 dampingRatio:v22 initialVelocity:v23 changes:0.0];
    self->_wasPinching = v13;
    self->_wasInteractiveZooming = 1;
LABEL_46:
    self->_animatePendingZoom = 0;
    [(PXNumberAnimator *)v43 value];
    __exp10(fabs(v32));
    PXFloatSign();
  }
LABEL_39:
  if (self->_wasPinching)
  {
    if (!self->_wasInteractiveZooming)
    {
      log10(fabs(v18) * 1000.0 + 1.0);
      PXFloatSign();
    }
  }
  else if (!self->_wasInteractiveZooming)
  {
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v33 = [v3 objectAtIndexedSubscript:v4];
      [v33 doubleValue];
      double v35 = v34;

      double v36 = 1.0 / v35;
      if (self->_animatePendingZoom)
      {
        [v42 zoomSpringStiffness];
        double v38 = v37;
        [v42 zoomSpringDamping];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_4;
        v45[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
        *(double *)&v45[4] = v36;
        [(PXNumberAnimator *)v43 performChangesUsingSpringAnimationWithStiffness:v45 dampingRatio:v38 initialVelocity:v39 changes:0.0];
      }
      else
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_5;
        v44[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
        *(double *)&v44[4] = 1.0 / v35;
        [(PXNumberAnimator *)v43 performChangesWithoutAnimation:v44];
      }
    }
    goto LABEL_46;
  }
  [(PXZoomablePhotosAlphaAnimator *)self->_alphaAnimator columnIndex];
  double v25 = v24;
  [(PXZoomablePhotosAlphaAnimator *)self->_alphaAnimator presentationColumnIndex];
  double v27 = round(v26);
  if (round(v25) == v27)
  {
    [(PXZoomablePhotosViewModel *)self interactiveZoomColumnIndex];
    double v27 = round(v28);
  }
  v29 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[PXZoomablePhotosViewModel _clampColumnIndexToValidIndex:](self, "_clampColumnIndexToValidIndex:", (uint64_t)v27));
  [v29 doubleValue];
  double v31 = v30;

  log10(fabs(1.0 / v31) * 1000.0 + 1.0);
  PXFloatSign();
}

- (double)_columnIndexForItemWidth:(double)a3
{
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v4 = [(PXZoomablePhotosViewModel *)self allowedColumnWidths];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PXZoomablePhotosViewModel__columnIndexForItemWidth___block_invoke;
  v11[3] = &unk_1E5DC27E8;
  *(double *)&v11[6] = a3;
  v11[4] = &v16;
  v11[5] = &v12;
  [v4 enumerateObjectsUsingBlock:v11];
  uint64_t v5 = v13[3];
  uint64_t v6 = v17;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v17[3];
    v13[3] = v5;
  }
  if (v6[3] != v5)
  {
    id v7 = [v4 objectAtIndexedSubscript:0.0];
    [v7 doubleValue];

    char v8 = [v4 objectAtIndexedSubscript:v13[3]];
    [v8 doubleValue];

    PXClamp();
  }
  double v9 = (double)v5 + 0.0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void __63__PXZoomablePhotosViewModel__closestColumnIndexForColumnWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v6 = [v5 integerValue];

  if (v6 <= *(void *)(a1 + 56))
  {
    [v10 doubleValue];
    double v8 = vabdd_f64(v7, *(double *)(a1 + 64));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v8 < *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    }
  }
}

uint64_t __54__PXZoomablePhotosViewModel__columnIndexForItemWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 doubleValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v7 + 24) == 0x7FFFFFFFFFFFFFFFLL || v6 >= *(double *)(a1 + 48)) {
    *(void *)(v7 + 24) = a3;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v8 + 24) == 0x7FFFFFFFFFFFFFFFLL && v6 <= *(double *)(a1 + 48)) {
    *(void *)(v8 + 24) = a3;
  }
  return result;
}

- (NSArray)allowedColumnWidths
{
  return self->_allowedColumnWidths;
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (BOOL)isPinching
{
  return self->_isPinching;
}

- (BOOL)isInteractiveZooming
{
  return self->_isInteractiveZooming;
}

- (int64_t)_clampColumnIndexToValidIndex:(int64_t)a3
{
  int64_t v3 = a3 & ~(a3 >> 63);
  int64_t v4 = [(PXZoomablePhotosViewModel *)self allowedColumns];
  int64_t v5 = [v4 count] - 1;

  if (v3 >= v5) {
    return v5;
  }
  else {
    return v3;
  }
}

- (NSArray)allowedColumns
{
  return self->_allowedColumns;
}

- (void)setZoomState:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var1;
  long long v4 = *(_OWORD *)&a3->var3;
  self->_zoomState.normalizedScaleCenter = a3->var0;
  *(_OWORD *)&self->_zoomState.scale = v5;
  *(_OWORD *)&self->_zoomState.columns = v4;
  long long v7 = *(_OWORD *)&a3->var10;
  long long v6 = *(_OWORD *)&a3->var12;
  long long v8 = *(_OWORD *)&a3->var5;
  self->_zoomState.stickyHeaderOpacity = a3->var14;
  *(_OWORD *)&self->_zoomState.fromColumnIndex = v7;
  *(_OWORD *)&self->_zoomState.interactiveProgress = v6;
  *(_OWORD *)&self->_zoomState.normalizedColumnWidth = v8;
  [(PXZoomablePhotosViewModel *)self _updateIsDisplayingIndividualItems];
  [(PXZoomablePhotosViewModel *)self _invalidateShouldHideSurroundingContent];
  [(PXZoomablePhotosViewModel *)self signalChange:1];
}

- ($49CB12D5354CCF22210FF066E175BE67)pinchState
{
  long long v3 = *(_OWORD *)&self[5].var6;
  *(_OWORD *)&retstr->var2.y = *(_OWORD *)&self[5].var4;
  *(_OWORD *)&retstr->var4 = v3;
  *(CGPoint *)&retstr->var6 = self[6].var0;
  long long v4 = *(_OWORD *)&self[5].var2.y;
  retstr->var0 = *(CGPoint *)&self[5].var1;
  *(_OWORD *)&retstr->var1 = v4;
  return self;
}

- (BOOL)hasInlineHeadersContent
{
  return self->_hasInlineHeadersContent;
}

- (void)_invalidateShouldHideSurroundingContent
{
  id v2 = [(PXZoomablePhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldHideSurroundingContent];
}

- (void)_invalidateZoomState
{
  id v2 = [(PXZoomablePhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateZoomState];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXZoomablePhotosViewModel;
  [(PXZoomablePhotosViewModel *)&v4 didPerformChanges];
  long long v3 = [(PXZoomablePhotosViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (PXUpdater)updater
{
  return self->_updater;
}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllowedColumns];
}

- (PXZoomablePhotosViewModel)initWithDataSourceManager:(id)a3 selectionManager:(id)a4 mediaProvider:(id)a5 specManager:(id)a6 loadingStatusManager:(id)a7 badgesModifier:(id)a8 preferredAssetCropDelegate:(id)a9 preferredColumnCountsDelegate:(id)a10 inlinePlaybackController:(id)a11
{
  id v17 = a3;
  id v36 = a4;
  id v35 = a5;
  id v31 = a6;
  id v18 = a6;
  id v32 = a7;
  id v34 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v37.receiver = self;
  v37.super_class = (Class)PXZoomablePhotosViewModel;
  double v23 = [(PXZoomablePhotosViewModel *)&v37 init];
  double v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_assetsDataSourceManager, a3);
    objc_storeStrong((id *)&v24->_selectionManager, a4);
    objc_storeStrong((id *)&v24->_mediaProvider, a5);
    objc_storeWeak((id *)&v24->_preferredAssetCropDelegate, v20);
    objc_storeWeak((id *)&v24->_preferredColumnCountsDelegate, v21);
    objc_storeWeak((id *)&v24->_inlinePlaybackController, v22);
    uint64_t v25 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v24];
    updater = v24->_updater;
    v24->_updater = (PXUpdater *)v25;

    [(PXUpdater *)v24->_updater setNeedsUpdateSelector:sel__setNeedsUpdate];
    [(PXUpdater *)v24->_updater addUpdateSelector:sel__updateAllowedColumns];
    [(PXUpdater *)v24->_updater addUpdateSelector:sel__updateAlphaAnimator];
    [(PXUpdater *)v24->_updater addUpdateSelector:sel__updatePinchVelocity];
    [(PXUpdater *)v24->_updater addUpdateSelector:sel__updateZoomState];
    [(PXUpdater *)v24->_updater addUpdateSelector:sel__updateShouldHideSurroundingContent];
    [(PXUpdater *)v24->_updater addUpdateSelector:sel__updateMiniModeAnimator];
    objc_storeStrong((id *)&v24->_specManager, v31);
    [v18 registerChangeObserver:v24 context:PXZoomablePhotosViewModelSpecManagerObserverContext];
    objc_storeStrong((id *)&v24->_loadingStatusManager, v32);
    double v27 = _Block_copy(v19);
    id badgesModifier = v24->_badgesModifier;
    v24->_id badgesModifier = v27;

    v24->_pendingZoomColumnIndex = 0x7FFFFFFFFFFFFFFFLL;
    v24->_isInteractiveZoomingAllowed = 1;
    v24->_zoomState.scale = 1.0;
    v24->_zoomState.columnIndex = 0;
    v24->_zoomState.normalizedColumnWidth = 1.0;
    v24->_isDisplayingIndividualItems = 1;
    id v29 = objc_alloc((Class)off_1E5DA74E8);
    log10(fabs(v24->_zoomState.normalizedColumnWidth) * 1000.0 + 1.0);
    PXFloatSign();
  }

  return 0;
}

- (void)setLayoutExtendsContentBelowBounds:(BOOL)a3
{
  if (self->_layoutExtendsContentBelowBounds != a3)
  {
    self->_layoutExtendsContentBelowBounds = a3;
    [(PXZoomablePhotosViewModel *)self _invalidateShouldHideSurroundingContent];
  }
}

- (BOOL)isInteractiveZoomingAllowed
{
  return self->_isInteractiveZoomingAllowed;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (PXZoomablePhotosMiniModeAnimator)miniModeAnimator
{
  return self->_miniModeAnimator;
}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:64];
}

void __47__PXZoomablePhotosViewModel_setAllowedColumns___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 integerValue];
  if (v5 > a1[6])
  {
    uint64_t v6 = *(void *)(a1[5] + 8);
    uint64_t v8 = *(void *)(v6 + 32);
    uint64_t v7 = *(void *)(v6 + 40);
    if (v7) {
      BOOL v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      *(void *)(v6 + 32) = a3;
      uint64_t v10 = 1;
    }
    else
    {
      if (v7 + v8 != a3) {
        goto LABEL_11;
      }
      uint64_t v10 = v7 + 1;
    }
    *(void *)(v6 + 40) = v10;
  }
LABEL_11:
  uint64_t v11 = (void *)a1[4];
  id v12 = [NSNumber numberWithDouble:1.0 / (double)v5];
  [v11 addObject:v12];
}

- (PXZoomableInlineHeadersDataSourceManager)inlineHeadersDataSourceManager
{
  return self->_inlineHeadersDataSourceManager;
}

- (void)performInitialChanges:(id)a3
{
  id v4 = a3;
  BOOL isPerformingInitialChanges = self->_isPerformingInitialChanges;
  self->_BOOL isPerformingInitialChanges = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PXZoomablePhotosViewModel_performInitialChanges___block_invoke;
  void v7[3] = &unk_1E5DB1F80;
  id v8 = v4;
  id v6 = v4;
  [(PXZoomablePhotosViewModel *)self performChanges:v7];
  self->_BOOL isPerformingInitialChanges = isPerformingInitialChanges;
}

- (void)setGeometryDelegate:(id)a3
{
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  uint64_t v10 = v9;
  if ((void *)PXZoomablePhotosViewModelSpecManagerObserverContext != a5)
  {
    if ((void *)PXZoomablePhotosViewModelNumberAnimatorObserverContext != a5)
    {
      if ((void *)PXZoomablePhotosViewModelAlphaAnimatorObserverContext != a5)
      {
        if ((void *)PXZoomablePhotosViewModelDataSourceManagerObserverContext == a5)
        {
          if ((v6 & 1) == 0) {
            goto LABEL_30;
          }
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_3;
          v27[3] = &unk_1E5DBDFA0;
          v27[4] = self;
          uint64_t v14 = v27;
        }
        else
        {
          if ((void *)PXZoomablePhotosViewModelSelectionObserverContext != a5)
          {
            if ((void *)PXZoomablePhotosViewModelInlineHeadersDataSourceManagerObserverContext != a5)
            {
              uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
              [v25 handleFailureInMethod:a2 object:self file:@"PXZoomablePhotosViewModel.m" lineNumber:1169 description:@"Code which should be unreachable has been reached"];

              abort();
            }
            if (v6)
            {
              uint64_t v11 = [(PXZoomableInlineHeadersDataSourceManager *)self->_inlineHeadersDataSourceManager yearsDataSource];
              -[PXZoomablePhotosViewModel setHasInlineHeadersContent:](self, "setHasInlineHeadersContent:", [v11 numberOfSections] > 0);
            }
            goto LABEL_30;
          }
          if ((v6 & 1) == 0) {
            goto LABEL_30;
          }
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_4;
          v26[3] = &unk_1E5DBDFA0;
          v26[4] = self;
          uint64_t v14 = v26;
        }
        [(PXZoomablePhotosViewModel *)self performChanges:v14];
        goto LABEL_30;
      }
      if ((v6 & 6) == 0) {
        goto LABEL_30;
      }
      id v12 = v9;
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_20;
        }
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        double v23 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v23);
        double v24 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
        [v20 handleFailureInMethod:a2, self, @"PXZoomablePhotosViewModel.m", 1144, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v22, v24 object file lineNumber description];
      }
      else
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        id v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        [v20 handleFailureInMethod:a2, self, @"PXZoomablePhotosViewModel.m", 1144, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v22 object file lineNumber description];
      }

LABEL_20:
      if (self->_isUpdatingZoomState || ([v12 isBeingMutated] & 1) != 0) {
        goto LABEL_24;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_2;
      v28[3] = &unk_1E5DBDFA0;
      v28[4] = self;
      BOOL v13 = v28;
LABEL_23:
      [(PXZoomablePhotosViewModel *)self performChanges:v13];
LABEL_24:

      goto LABEL_30;
    }
    if ((v6 & 6) == 0) {
      goto LABEL_30;
    }
    id v12 = v9;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      id v18 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v18);
      id v19 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v15 handleFailureInMethod:a2, self, @"PXZoomablePhotosViewModel.m", 1135, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v17, v19 object file lineNumber description];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      [v15 handleFailureInMethod:a2, self, @"PXZoomablePhotosViewModel.m", 1135, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v17 object file lineNumber description];
    }

LABEL_14:
    if (self->_isUpdatingZoomState || ([v12 isBeingMutated] & 1) != 0) {
      goto LABEL_24;
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke;
    v29[3] = &unk_1E5DBDFA0;
    v29[4] = self;
    BOOL v13 = v29;
    goto LABEL_23;
  }
  if (v6) {
    [(PXZoomablePhotosViewModel *)self _handleSpecChange];
  }
LABEL_30:
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosViewModel;
  [(PXZoomablePhotosViewModel *)&v3 performChanges:a3];
}

- (void)setHasInlineHeadersContent:(BOOL)a3
{
  if (self->_hasInlineHeadersContent != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PXZoomablePhotosViewModel_setHasInlineHeadersContent___block_invoke;
    v3[3] = &unk_1E5DB2020;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXZoomablePhotosViewModel *)self performChanges:v3];
  }
}

- (void)_handleSpecChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__PXZoomablePhotosViewModel__handleSpecChange__block_invoke;
  v2[3] = &unk_1E5DBDFA0;
  v2[4] = self;
  [(PXZoomablePhotosViewModel *)self performChanges:v2];
}

- (void)setViewBasedDecorationsEnabled:(BOOL)a3
{
  if (self->_viewBasedDecorationsEnabled != a3)
  {
    self->_viewBasedDecorationsEnabled = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:512];
  }
}

- (void)setIsInteractiveZoomingAllowed:(BOOL)a3
{
  if (self->_isInteractiveZoomingAllowed != a3)
  {
    self->_isInteractiveZoomingAllowed = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x1000000];
  }
}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:32];
    [(PXZoomablePhotosViewModel *)self _invalidateAllowedColumns];
    [(PXZoomablePhotosViewModel *)self _invalidateZoomState];
  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  id v8 = (NSSet *)a3;
  BOOL v4 = self->_draggedAssetReferences;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSSet *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSSet *)[(NSSet *)v8 copy];
      draggedAssetReferences = self->_draggedAssetReferences;
      self->_draggedAssetReferences = v6;

      [(PXZoomablePhotosViewModel *)self signalChange:1024];
    }
  }
}

- (void)setAspectFit:(BOOL)a3
{
  if (self->_aspectFit != a3)
  {
    self->_aspectFit = a3;
    [(PXZoomablePhotosViewModel *)self _invalidateAlphaAnimator];
    [(PXZoomablePhotosViewModel *)self signalChange:2];
  }
}

- (id)effectProvider
{
  return self->_effectProvider;
}

uint64_t __56__PXZoomablePhotosViewModel_setHasInlineHeadersContent___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 205) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateZoomState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_geometryDelegate);
  objc_storeStrong((id *)&self->_miniModeAnimator, 0);
  objc_storeStrong((id *)&self->_miniModeAnchorAssetReference, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong(&self->_effectProvider, 0);
  objc_storeStrong((id *)&self->_inlineHeadersDataSourceManager, 0);
  objc_storeStrong((id *)&self->_anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_allowedColumnWidths, 0);
  objc_storeStrong((id *)&self->_allowedColumns, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_destroyWeak((id *)&self->_inlinePlaybackController);
  objc_destroyWeak((id *)&self->_preferredColumnCountsDelegate);
  objc_destroyWeak((id *)&self->_preferredAssetCropDelegate);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong(&self->_pauseToken, 0);
  objc_storeStrong((id *)&self->_columnWidthAnimator, 0);
  objc_storeStrong((id *)&self->_alphaAnimator, 0);
}

- (BOOL)isPerformingInitialChanges
{
  return self->_isPerformingInitialChanges;
}

- (PXZoomablePhotosViewModelGeometryDelegate)geometryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  return (PXZoomablePhotosViewModelGeometryDelegate *)WeakRetained;
}

- (PXAssetReference)miniModeAnchorAssetReference
{
  return self->_miniModeAnchorAssetReference;
}

- (double)viewModeInteractionProgress
{
  return self->_viewModeInteractionProgress;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (BOOL)allowsCaptionsInSquare
{
  return self->_allowsCaptionsInSquare;
}

- (PXAssetReference)anchorAssetReference
{
  return self->_anchorAssetReference;
}

- (_NSRange)denseColumnsIndexRange
{
  p_denseColumnsIndexRange = &self->_denseColumnsIndexRange;
  NSUInteger location = self->_denseColumnsIndexRange.location;
  NSUInteger length = p_denseColumnsIndexRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)interactiveZoomColumnIndex
{
  return self->_interactiveZoomColumnIndex;
}

- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredAssetCropDelegate);
  return (PXPhotosPreferredAssetCropDelegate *)WeakRetained;
}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateZoomState];
}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateZoomState];
}

- (void)_updateMiniModeAnimator
{
  objc_super v3 = [(PXZoomablePhotosViewModel *)self miniModeAnimator];
  BOOL v4 = !self->_isPerformingInitialChanges;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXZoomablePhotosViewModel__updateMiniModeAnimator__block_invoke;
  v5[3] = &unk_1E5DB20D8;
  v5[4] = self;
  [v3 performAnimated:v4 changes:v5];
}

void __52__PXZoomablePhotosViewModel__updateMiniModeAnimator__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 viewMode];
  if ((unint64_t)(v4 - 1) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  [v6 setTargetState:v5];
  [*(id *)(a1 + 32) viewModeInteractionProgress];
  objc_msgSend(v6, "setInteractionProgress:");
}

- (void)_invalidateMiniModeAnimator
{
  id v2 = [(PXZoomablePhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMiniModeAnimator];
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_53(uint64_t a1, void *a2)
{
}

uint64_t __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2_55(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3_56(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_4(uint64_t a1, void *a2)
{
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pauseChangeDeliveryWithTimeout:@"PXZoomablePhotosViewModel" identifier:180.0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2_62(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3_63;
  v2[3] = &unk_1E5DD1458;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performChanges:v2];
}

uint64_t __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3_63(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDeliveryAndBackgroundLoading:*(void *)(a1 + 32)];
}

- (void)_updatePinchVelocity
{
  if ([(PXZoomablePhotosViewModel *)self isPinching])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3 - self->_pinchLastDate;
    if (v4 >= 0.0) {
      double v5 = v4;
    }
    else {
      double v5 = -v4;
    }
    if (v5 > 0.003)
    {
      log10(fabs(self->_pinchState.scale * self->_normalizedColumnWidthWhenPinchStarted) * 1000.0 + 1.0);
      PXFloatSign();
    }
  }
}

- (void)_invalidatePinchVelocity
{
  id v2 = [(PXZoomablePhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePinchVelocity];
}

- (void)resetToInitialState
{
  [(PXZoomablePhotosViewModel *)self zoomInToIndividualItemsWithAnchorAssetReference:0 animated:0];
  id v3 = [(PXZoomablePhotosViewModel *)self geometryDelegate];
  [v3 zoomablePhotosViewModelResetToInitialState:self];
}

- (BOOL)isResetToInitialState
{
  if ([(PXZoomablePhotosViewModel *)self isDisplayingIndividualItems])
  {
    [(PXZoomablePhotosViewModel *)self zoomState];
    BOOL v3 = v8 == [(PXZoomablePhotosViewModel *)self defaultColumnIndex];
  }
  else
  {
    BOOL v3 = 0;
  }
  double v4 = [(PXZoomablePhotosViewModel *)self geometryDelegate];
  double v5 = v4;
  if (v4) {
    char v6 = 0;
  }
  else {
    char v6 = v3;
  }
  if (v4 && v3) {
    char v6 = [v4 zoomablePhotosViewModelIsResetToInitialState:self];
  }

  return v6;
}

- (void)setUseLowMemoryDecode:(BOOL)a3
{
  if (self->_useLowMemoryDecode != a3)
  {
    self->_useLowMemoryDecode = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x100000];
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x80000];
  }
}

- (void)setAlwaysShowTopBadges:(BOOL)a3
{
  if (self->_alwaysShowTopBadges != a3)
  {
    self->_alwaysShowTopBadges = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x40000];
  }
}

- (void)setEffectProvider:(id)a3
{
  id aBlock = a3;
  double v4 = _Block_copy(self->_effectProvider);
  double v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = _Block_copy(aBlock);
      id effectProvider = self->_effectProvider;
      self->_id effectProvider = v8;

      [(PXZoomablePhotosViewModel *)self signalChange:0x10000];
    }
  }
}

- (void)setWantsOverBackgroundFloatingHeaderAppearance:(BOOL)a3
{
  if (self->_wantsOverBackgroundFloatingHeaderAppearance != a3)
  {
    self->_wantsOverBackgroundFloatingHeaderAppearance = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:4096];
  }
}

- (void)setInteractiveZoomColumnIndex:(double)a3 withAnchorAssetReference:(id)a4
{
  char v7 = (PXAssetReference *)a4;
  if (self->_interactiveZoomColumnIndex != a3 || self->_anchorAssetReference != v7)
  {
    self->_interactiveZoomColumnIndex = a3;
    uint64_t v8 = v7;
    objc_storeStrong((id *)&self->_anchorAssetReference, a4);
    [(PXZoomablePhotosViewModel *)self _invalidateZoomState];
    char v7 = v8;
  }
}

- (void)setIsInteractiveZooming:(BOOL)a3
{
  if (self->_isInteractiveZooming != a3)
  {
    self->_isInteractiveZooming = a3;
    [(PXZoomablePhotosViewModel *)self _invalidateZoomState];
  }
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  self->_wantsAssetIndexBadge = a3;
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  if (self->_wantsFileSizeBadge != a3)
  {
    self->_wantsFileSizeBadge = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x10000];
  }
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  if (self->_wantsNumberedSelectionStyle != a3)
  {
    self->_wantsNumberedSelectionStyle = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x8000];
  }
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  if (self->_wantsDimmedSelectionStyle != a3)
  {
    self->_wantsDimmedSelectionStyle = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x2000];
  }
}

- (void)setAllowsCaptionsInSquare:(BOOL)a3
{
  if (self->_allowsCaptionsInSquare != a3)
  {
    self->_allowsCaptionsInSquare = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x20000];
  }
}

- (void)setCaptionsVisible:(BOOL)a3
{
  if (self->_captionsVisible != a3)
  {
    self->_captionsVisible = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:16];
  }
}

- (double)_columnWidthForDesiredColumnIndex:(double)a3
{
  BOOL v3 = [(PXZoomablePhotosViewModel *)self allowedColumns];
  [v3 count];

  PXFloatProgressBetween();
}

- (int64_t)_closestColumnIndexForAnimatedValue:(double)a3
{
  char v6 = [(PXZoomablePhotosViewModel *)self allowedColumns];
  char v7 = [(PXZoomablePhotosViewModel *)self allowedColumnWidths];
  uint64_t v8 = [v6 lastObject];
  uint64_t v9 = [v8 integerValue];

  if (![(PXZoomablePhotosViewModel *)self allowDenseLevels])
  {
    int64_t v10 = [(PXZoomablePhotosViewModel *)self _maxColumnsForIndividualItems];
    if (v9 >= v10) {
      uint64_t v9 = v10;
    }
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0x7FEFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__PXZoomablePhotosViewModel__closestColumnIndexForAnimatedValue___block_invoke;
  v17[3] = &unk_1E5DB1FD0;
  id v11 = v6;
  double v22 = a3;
  id v18 = v11;
  id v19 = v23;
  id v20 = &v24;
  uint64_t v21 = v9;
  [v7 enumerateObjectsUsingBlock:v17];
  unint64_t v12 = v25[3];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXZoomablePhotosViewModel.m" lineNumber:447 description:@"Unable to find number of columns"];

    unint64_t v12 = v25[3];
    if ((v12 & 0x8000000000000000) != 0) {
      goto LABEL_9;
    }
  }
  else if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_9:
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXZoomablePhotosViewModel.m" lineNumber:448 description:@"Invalid column index"];

    goto LABEL_7;
  }
  if (v12 >= [v11 count]) {
    goto LABEL_9;
  }
LABEL_7:
  int64_t v13 = v25[3];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

void __65__PXZoomablePhotosViewModel__closestColumnIndexForAnimatedValue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  double v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v6 = [v5 integerValue];

  if (v6 <= *(void *)(a1 + 56))
  {
    [v8 doubleValue];
    log10(fabs(v7) * 1000.0 + 1.0);
    PXFloatSign();
  }
}

- (int64_t)_nextColumnIndexForInitialColumnWidth:(double)a3 currentColumnWidth:(double)a4 velocity:(double)a5
{
}

- (int64_t)defaultColumnIndex
{
  BOOL v3 = [(PXZoomablePhotosViewModel *)self userDefaults];
  double v4 = [v3 preferredIndividualItemsColumnsNumber];
  uint64_t v5 = [v4 integerValue];

  if (!v5)
  {
    uint64_t v6 = [(PXZoomablePhotosViewModel *)self specManager];
    double v7 = [v6 spec];
    uint64_t v5 = [v7 defaultNumberOfColumns];
  }
  return [(PXZoomablePhotosViewModel *)self bestColumnIndexForPreferredNumberOfColumns:v5];
}

- (void)zoomInToIndividualItemsWithAnchorAssetReference:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(PXZoomablePhotosViewModel *)self isDisplayingIndividualItems])
  {
    int64_t v7 = [(PXZoomablePhotosViewModel *)self defaultColumnIndex];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      PXAssertGetLog();
    }
    [(PXZoomablePhotosViewModel *)self zoomToColumnIndex:v7 withAnchorAssetReference:v6 animated:v4];
  }
}

- (void)zoomInToLastRememberedWithAnchorAssetReference:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PXZoomablePhotosViewModel *)self zoomState];
  int64_t v7 = [(PXZoomablePhotosViewModel *)self _clampColumnIndexToValidIndex:v21 - 1];
  if (v21 != v7)
  {
    int64_t v8 = v7;
    uint64_t v9 = +[PXZoomablePhotosSettings sharedInstance];
    int v10 = [v9 tapsZoomsToLastIndividualDensity];

    if (v10)
    {
      id v11 = [(PXZoomablePhotosViewModel *)self allowedColumns];
      unint64_t v12 = [v11 objectAtIndexedSubscript:v21];
      uint64_t v13 = [v12 integerValue];

      uint64_t v14 = [(PXZoomablePhotosViewModel *)self allowedColumns];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v8];
      uint64_t v16 = [v15 integerValue];

      int64_t v17 = [(PXZoomablePhotosViewModel *)self _maxColumnsForIndividualItems];
      if (v13 > v17 && v16 <= v17)
      {
        id v18 = [(PXZoomablePhotosViewModel *)self userDefaults];
        id v19 = [v18 preferredIndividualItemsColumnsNumber];
        uint64_t v20 = [v19 integerValue];

        if (v20) {
          int64_t v8 = [(PXZoomablePhotosViewModel *)self bestColumnIndexForPreferredNumberOfColumns:v20];
        }
      }
    }
    [(PXZoomablePhotosViewModel *)self zoomToColumnIndex:v8 withAnchorAssetReference:v6 animated:v4];
  }
}

- (int64_t)denseZoomLevelForZoomState:(id *)a3
{
  int64_t v5 = [(PXZoomablePhotosViewModel *)self _maxColumnsForIndividualItems];
  if (a3->var3 <= v5) {
    return 0;
  }
  int64_t v6 = v5;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  int64_t v7 = [(PXZoomablePhotosViewModel *)self allowedColumns];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PXZoomablePhotosViewModel_denseZoomLevelForZoomState___block_invoke;
  v10[3] = &unk_1E5DB1FA8;
  v10[4] = &v11;
  v10[5] = v6;
  [v7 enumerateObjectsUsingBlock:v10];

  int64_t v8 = a3->var4 - v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __56__PXZoomablePhotosViewModel_denseZoomLevelForZoomState___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 integerValue];
  if (result <= *(void *)(a1 + 40))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v8 + 24) < a3) {
      *(void *)(v8 + 24) = a3;
    }
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (void)setIsDisplayingIndividualItems:(BOOL)a3
{
  if (self->_isDisplayingIndividualItems != a3)
  {
    self->_isDisplayingIndividualItems = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x2000000];
  }
}

- (void)_updateIsDisplayingIndividualItems
{
  int64_t columns = self->_zoomState.columns;
  BOOL v4 = columns <= [(PXZoomablePhotosViewModel *)self _maxColumnsForIndividualItems];
  [(PXZoomablePhotosViewModel *)self setIsDisplayingIndividualItems:v4];
}

- (void)setMiniModeAnchorAssetReference:(id)a3
{
  uint64_t v8 = (PXAssetReference *)a3;
  BOOL v4 = self->_miniModeAnchorAssetReference;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(PXAssetReference *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      int64_t v6 = (PXAssetReference *)[(PXAssetReference *)v8 copy];
      miniModeAnchorAssetReference = self->_miniModeAnchorAssetReference;
      self->_miniModeAnchorAssetReference = v6;

      [(PXZoomablePhotosViewModel *)self signalChange:0x800000];
    }
  }
}

- (void)setViewModeInteractionProgress:(double)a3
{
  if (self->_viewModeInteractionProgress != a3)
  {
    self->_viewModeInteractionProgress = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x400000];
    [(PXZoomablePhotosViewModel *)self _invalidateMiniModeAnimator];
  }
}

- (void)setViewMode:(unint64_t)a3
{
  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    [(PXZoomablePhotosViewModel *)self signalChange:0x200000];
    [(PXZoomablePhotosViewModel *)self _invalidateMiniModeAnimator];
  }
}

- (void)setPinchState:(id *)a3 withAnchorAssetReference:(id)a4
{
  int64_t v7 = (PXAssetReference *)a4;
  uint64_t v8 = v7;
  p_pinchState = &self->_pinchState;
  if (self->_pinchState.normalizedPosition.x == a3->var2.x && self->_pinchState.normalizedPosition.y == a3->var2.y)
  {
    double var4 = a3->var4;
    v12.f64[0] = var4;
    v12.f64[1] = a3->var3;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)vextq_s8((int8x16_t)p_pinchState->normalizedInitialPosition, (int8x16_t)p_pinchState->normalizedInitialPosition, 8uLL), (float64x2_t)vextq_s8((int8x16_t)a3->var0, (int8x16_t)a3->var0, 8uLL)), (int32x4_t)vceqq_f64((float64x2_t)vextq_s8(*(int8x16_t *)&self->_pinchState.initialScale, *(int8x16_t *)&self->_pinchState.initialScale, 8uLL), v12))), 0xFuLL))) & 1) != 0
      && self->_pinchState.scaleVelocity == a3->var5
      && self->_pinchState.lastEventTime == a3->var7
      && self->_pinchState.events == a3->var6
      && self->_anchorAssetReference == v7)
    {
      goto LABEL_26;
    }
  }
  else
  {
    double var4 = a3->var4;
  }
  if ((*(uint64_t *)&var4 <= -1 || ((*(void *)&var4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&var4 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
  }
  double v15 = fabs(a3->var5);
  if (v15 >= INFINITY && v15 <= INFINITY) {
    PXAssertGetLog();
  }
  p_pinchState->normalizedInitialPosition = a3->var0;
  long long v16 = *(_OWORD *)&a3->var1;
  long long v17 = *(_OWORD *)&a3->var2.y;
  long long v18 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_pinchState.scale = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_pinchState.events = v18;
  *(_OWORD *)&self->_pinchState.normalizedInitialPinchDistance = v16;
  *(_OWORD *)&self->_pinchState.normalizedPosition.y = v17;
  objc_storeStrong((id *)&self->_anchorAssetReference, a4);
  id v19 = self;
  if (kdebug_is_enabled()) {
    kdebug_trace();
  }

  [(PXZoomablePhotosViewModel *)v19 _invalidatePinchVelocity];
  [(PXZoomablePhotosViewModel *)v19 _invalidateZoomState];
  [(PXZoomablePhotosViewModel *)v19 signalChange:256];
LABEL_26:
}

- (void)setIsPinching:(BOOL)a3
{
  if (self->_isPinching != a3)
  {
    self->_isPinching = a3;
    if (a3)
    {
      self->_double normalizedColumnWidthWhenPinchStarted = self->_zoomState.normalizedColumnWidth;
      self->_pinchLastDate = 0.0;
      self->_pinchLogValue = 0.0;
      self->_pinchLogVelocity = 0.0;
    }
    [(PXZoomablePhotosViewModel *)self _invalidatePinchVelocity];
    [(PXZoomablePhotosViewModel *)self _invalidateZoomState];
    [(PXZoomablePhotosViewModel *)self signalChange:128];
  }
}

- (void)setDropTargetAssetReference:(id)a3
{
  uint64_t v8 = (PXAssetReference *)a3;
  char v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {
  }
  else
  {
    int64_t v6 = v5;
    char v7 = [(PXAssetReference *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      [(PXZoomablePhotosViewModel *)self signalChange:2048];
    }
  }
}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3) {
    self->_lowMemoryMode = a3;
  }
}

- (BOOL)hasContentToZoom
{
  id v2 = [(PXZoomablePhotosViewModel *)self assetsDataSourceManager];
  BOOL v3 = [v2 dataSource];
  char v4 = [v3 containsAnyItems];

  return v4;
}

- (NSString)description
{
  BOOL v3 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  int64_t v6 = [v3 stringWithFormat:@"<%@; %p>", v5, self];

  return (NSString *)v6;
}

- (void)dealloc
{
  id v3 = self->_pauseToken;
  if (v3)
  {
    char v4 = self->_assetsDataSourceManager;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PXZoomablePhotosViewModel_dealloc__block_invoke;
    block[3] = &unk_1E5DD32A8;
    uint64_t v8 = v4;
    id v9 = v3;
    char v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosViewModel;
  [(PXZoomablePhotosViewModel *)&v6 dealloc];
}

void __36__PXZoomablePhotosViewModel_dealloc__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__PXZoomablePhotosViewModel_dealloc__block_invoke_2;
  v2[3] = &unk_1E5DD1458;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performChanges:v2];
}

uint64_t __36__PXZoomablePhotosViewModel_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDeliveryAndBackgroundLoading:*(void *)(a1 + 32)];
}

- (PXZoomablePhotosViewModel)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXZoomablePhotosViewModel.m", 91, @"%s is not available as initializer", "-[PXZoomablePhotosViewModel init]");

  abort();
}

@end