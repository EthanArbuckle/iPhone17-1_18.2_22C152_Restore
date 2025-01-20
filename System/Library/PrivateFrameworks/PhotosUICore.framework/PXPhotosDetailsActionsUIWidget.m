@interface PXPhotosDetailsActionsUIWidget
- (BOOL)_needsUpdate;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)allowCreateMemoryAction;
- (BOOL)allowInternalFileRadarAction;
- (BOOL)allowRevealInMomentAction;
- (BOOL)hasContentForCurrentInput;
- (CGPoint)lastNormalizedTapPosition;
- (NSArray)_allowedActionTypes;
- (NSArray)_performableActionTypes;
- (NSMutableSet)_tilesInUse;
- (NSString)snappableWidgetIdentifier;
- (PHFetchResult)_peopleFetchResult;
- (PXActionPerformer)_activePerformer;
- (PXActionPerformerDelegate)actionPerformerDelegate;
- (PXActionRowTile)_measuringActionRowTile;
- (PXPhotoKitAssetCollectionActionManager)_assetCollectionActionManager;
- (PXPhotosDataSource)_photosDataSource;
- (PXPhotosDetailsActionsSpecManager)_specManager;
- (PXPhotosDetailsActionsUIWidget)init;
- (PXPhotosDetailsContext)context;
- (PXPhotosDetailsViewModel)_viewModel;
- (PXReusableObjectPool)_tileReusePool;
- (PXTileAnimator)_tileAnimator;
- (PXTilingController)_tilingController;
- (PXTilingController)contentTilingController;
- (PXUIScrollViewController)_scrollViewController;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (PXWidgetUnlockDelegate)widgetUnlockDelegate;
- (double)_rowHeight;
- (id)_createNewLayout;
- (id)_extendedTraitCollection;
- (id)menuElementsForActionRowTile:(id)a3;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (id)undoManagerForActionPerformer:(id)a3;
- (void)_handleContentSizeCategoryDidChange:(id)a3;
- (void)_invalidateActionManager;
- (void)_invalidateAllowedActionTypes;
- (void)_invalidateLayout;
- (void)_invalidateLayoutEnsureTransition;
- (void)_invalidatePeopleFetchResult;
- (void)_invalidatePerformableActionTypes;
- (void)_invalidateRowHeight;
- (void)_loadTilingController;
- (void)_performChanges:(id)a3;
- (void)_setActivePerformer:(id)a3;
- (void)_setAllowedActionTypes:(id)a3;
- (void)_setAssetCollectionActionManager:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setPeopleFetchResult:(id)a3;
- (void)_setPerformableActionTypes:(id)a3;
- (void)_setPhotosDataSource:(id)a3;
- (void)_setRowHeight:(double)a3;
- (void)_setViewModel:(id)a3;
- (void)_updateActionManagerIfNeeded;
- (void)_updateAllowedActionTypesIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateLayoutIfNeeded;
- (void)_updatePeopleFetchResultIfNeeded;
- (void)_updatePerformableActionTypesIfNeeded;
- (void)_updateRowHeightIfNeeded;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)actionRowTileSelected:(id)a3 tapPositionInTile:(CGPoint)a4;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)configureActionButtonTile:(id)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)reusableObjectPool:(id)a3 didCreateReusableObject:(id)a4;
- (void)reusableObjectPool:(id)a3 didEvictReusableObject:(id)a4;
- (void)setActionPerformerDelegate:(id)a3;
- (void)setAllowCreateMemoryAction:(BOOL)a3;
- (void)setAllowInternalFileRadarAction:(BOOL)a3;
- (void)setAllowRevealInMomentAction:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setLastNormalizedTapPosition:(CGPoint)a3;
- (void)setSpec:(id)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)setWidgetUnlockDelegate:(id)a3;
@end

@implementation PXPhotosDetailsActionsUIWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->__measuringActionRowTile, 0);
  objc_storeStrong((id *)&self->__specManager, 0);
  objc_storeStrong((id *)&self->__viewModel, 0);
  objc_storeStrong((id *)&self->__performableActionTypes, 0);
  objc_storeStrong((id *)&self->__allowedActionTypes, 0);
  objc_storeStrong((id *)&self->__assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->__peopleFetchResult, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_storeStrong((id *)&self->__tileReusePool, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_destroyWeak((id *)&self->_actionPerformerDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetUnlockDelegate);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

- (void)setLastNormalizedTapPosition:(CGPoint)a3
{
  self->_lastNormalizedTapPosition = a3;
}

- (CGPoint)lastNormalizedTapPosition
{
  double x = self->_lastNormalizedTapPosition.x;
  double y = self->_lastNormalizedTapPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setActivePerformer:(id)a3
{
}

- (PXActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (double)_rowHeight
{
  return self->__rowHeight;
}

- (PXActionRowTile)_measuringActionRowTile
{
  return self->__measuringActionRowTile;
}

- (PXPhotosDetailsActionsSpecManager)_specManager
{
  return self->__specManager;
}

- (PXPhotosDetailsViewModel)_viewModel
{
  return self->__viewModel;
}

- (NSArray)_performableActionTypes
{
  return self->__performableActionTypes;
}

- (NSArray)_allowedActionTypes
{
  return self->__allowedActionTypes;
}

- (void)_setAssetCollectionActionManager:(id)a3
{
}

- (PXPhotoKitAssetCollectionActionManager)_assetCollectionActionManager
{
  return self->__assetCollectionActionManager;
}

- (PHFetchResult)_peopleFetchResult
{
  return self->__peopleFetchResult;
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (PXReusableObjectPool)_tileReusePool
{
  return self->__tileReusePool;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PXUIScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (PXTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (void)setActionPerformerDelegate:(id)a3
{
}

- (PXActionPerformerDelegate)actionPerformerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionPerformerDelegate);
  return (PXActionPerformerDelegate *)WeakRetained;
}

- (BOOL)allowInternalFileRadarAction
{
  return self->_allowInternalFileRadarAction;
}

- (BOOL)allowCreateMemoryAction
{
  return self->_allowCreateMemoryAction;
}

- (BOOL)allowRevealInMomentAction
{
  return self->_allowRevealInMomentAction;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setWidgetUnlockDelegate:(id)a3
{
}

- (PXWidgetUnlockDelegate)widgetUnlockDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetUnlockDelegate);
  return (PXWidgetUnlockDelegate *)WeakRetained;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (void)_updateLayoutIfNeeded
{
  if (self->_needsUpdateFlags.layout)
  {
    self->_needsUpdateFlags.layout = 0;
    v3 = [(PXPhotosDetailsActionsUIWidget *)self _tilingController];
    v4 = [v3 currentLayout];
    v5 = v4;
    if (self->_ensureTransition
      || (uint64_t v6 = [v4 numberOfItems], v6 != -[NSArray count](self->__performableActionTypes, "count")))
    {
      self->_ensureTransition = 0;
      if (v3)
      {
        if (v5)
        {
          v8 = [(PXPhotosDetailsActionsUIWidget *)self _createNewLayout];
          [v3 transitionToLayout:v8];
        }
      }
    }
    else
    {
      v7 = [v3 scrollController];
      [v7 visibleRect];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__PXPhotosDetailsActionsUIWidget__updateLayoutIfNeeded__block_invoke;
      v9[3] = &unk_1E5DC1A00;
      v9[4] = self;
      objc_msgSend(v3, "enumerateTilesInRect:withOptions:usingBlock:", 0, v9);
    }
  }
}

uint64_t __55__PXPhotosDetailsActionsUIWidget__updateLayoutIfNeeded__block_invoke(uint64_t result, long long *a2)
{
  if (*((void *)a2 + 1) == 6200434)
  {
    uint64_t v3 = result;
    uint64_t v16 = 0;
    v4 = [*(id *)(result + 32) _tilingController];
    long long v5 = a2[3];
    long long v12 = a2[2];
    long long v13 = v5;
    long long v14 = a2[4];
    uint64_t v15 = *((void *)a2 + 10);
    long long v6 = a2[1];
    long long v10 = *a2;
    long long v11 = v6;
    [v4 getTile:&v16 geometry:0 group:0 userData:0 forTileWithIdentifier:&v10];

    v7 = *(void **)(v3 + 32);
    long long v8 = a2[3];
    long long v12 = a2[2];
    long long v13 = v8;
    long long v14 = a2[4];
    uint64_t v15 = *((void *)a2 + 10);
    long long v9 = a2[1];
    long long v10 = *a2;
    long long v11 = v9;
    return [v7 configureActionButtonTile:v16 withIdentifier:&v10];
  }
  return result;
}

- (void)_invalidateLayoutEnsureTransition
{
  self->_ensureTransition = 1;
  [(PXPhotosDetailsActionsUIWidget *)self _invalidateLayout];
}

- (void)_invalidateLayout
{
  self->_needsUpdateFlags.layout = 1;
  [(PXPhotosDetailsActionsUIWidget *)self _setNeedsUpdate];
}

- (void)_setRowHeight:(double)a3
{
  if (self->__rowHeight != a3)
  {
    self->__rowHeight = a3;
    [(PXPhotosDetailsActionsUIWidget *)self _invalidateLayoutEnsureTransition];
  }
}

- (void)_updateRowHeightIfNeeded
{
  if (self->_needsUpdateFlags.rowHeight)
  {
    self->_needsUpdateFlags.rowHeight = 0;
    id v9 = [(PXPhotosDetailsActionsUIWidget *)self _measuringActionRowTile];
    [v9 prepareForReuse];
    [v9 setTitle:@"Title"];
    uint64_t v3 = [v9 view];
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v5 = v4;

    double v6 = round(v5);
    int64_t v7 = [(PXFeatureSpec *)self->_spec userInterfaceIdiom];
    double v8 = 42.0;
    if (v7 == 3) {
      double v8 = 70.0;
    }
    if (v6 >= v8) {
      double v8 = v6;
    }
    [(PXPhotosDetailsActionsUIWidget *)self _setRowHeight:v8];
  }
}

- (void)_invalidateRowHeight
{
  self->_needsUpdateFlags.rowHeight = 1;
  [(PXPhotosDetailsActionsUIWidget *)self _setNeedsUpdate];
}

- (void)_updateActionManagerIfNeeded
{
  if (self->_needsUpdateFlags.actionManager)
  {
    self->_needsUpdateFlags.actionManager = 0;
    id v11 = [(PXPhotosDetailsActionsUIWidget *)self _photosDataSource];
    uint64_t v3 = [v11 firstAssetCollection];
    if (v3)
    {
      double v4 = [(PXPhotosDetailsActionsUIWidget *)self context];
      double v5 = [v4 displayTitleInfo];

      double v6 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v3 displayTitleInfo:v5];
      int64_t v7 = [(PXPhotosDetailsActionsUIWidget *)self _peopleFetchResult];
      [(PXAssetCollectionActionManager *)v6 setPeople:v7];

      double v8 = [(PXPhotosDetailsActionsUIWidget *)self context];
      id v9 = [v8 containingAlbum];
      [(PXAssetCollectionActionManager *)v6 setContainingAlbum:v9];

      long long v10 = [v11 assetsInSection:0];
      [(PXAssetCollectionActionManager *)v6 setAssetsFetchResult:v10];
    }
    else
    {
      double v6 = 0;
    }
    [(PXPhotosDetailsActionsUIWidget *)self _setAssetCollectionActionManager:v6];
  }
}

- (void)_invalidateActionManager
{
  self->_needsUpdateFlags.actionManager = 1;
  [(PXPhotosDetailsActionsUIWidget *)self _setNeedsUpdate];
}

- (void)_updatePerformableActionTypesIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.performableActionTypes)
  {
    self->_needsUpdateFlags.performableActionTypes = 0;
    uint64_t v3 = [(PXPhotosDetailsActionsUIWidget *)self _assetCollectionActionManager];
    double v4 = [MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v5 = [(PXPhotosDetailsActionsUIWidget *)self _allowedActionTypes];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if ([v3 canPerformActionType:v10]) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    if ([v4 count]
      || [(PXPhotosDetailsActionsUIWidget *)self allowInternalFileRadarAction])
    {
      if ([v3 canPerformActionType:@"PXAssetCollectionActionTypeFileRadar"]) {
        [v4 addObject:@"PXAssetCollectionActionTypeFileRadar"];
      }
    }
    [(PXPhotosDetailsActionsUIWidget *)self _setPerformableActionTypes:v4];
  }
}

- (void)_invalidatePerformableActionTypes
{
  self->_needsUpdateFlags.performableActionTypes = 1;
  [(PXPhotosDetailsActionsUIWidget *)self _setNeedsUpdate];
}

- (void)_updateAllowedActionTypesIfNeeded
{
  if (self->_needsUpdateFlags.allowedActionTypes)
  {
    self->_needsUpdateFlags.allowedActionTypes = 0;
    id v3 = [MEMORY[0x1E4F1CA48] array];
    if ([(PXPhotosDetailsActionsUIWidget *)self allowRevealInMomentAction]) {
      [v3 addObject:@"PXAssetCollectionActionTypeRevealInMoment"];
    }
    [(PXPhotosDetailsActionsUIWidget *)self _setAllowedActionTypes:v3];
  }
}

- (void)_invalidateAllowedActionTypes
{
  self->_needsUpdateFlags.allowedActionTypes = 1;
  [(PXPhotosDetailsActionsUIWidget *)self _setNeedsUpdate];
}

- (void)_updatePeopleFetchResultIfNeeded
{
  if (self->_needsUpdateFlags.peopleFetchResult)
  {
    self->_needsUpdateFlags.peopleFetchResult = 0;
    id v3 = [(PXPhotosDetailsActionsUIWidget *)self context];
    id v4 = [v3 people];

    [(PXPhotosDetailsActionsUIWidget *)self _setPeopleFetchResult:v4];
  }
}

- (void)_invalidatePeopleFetchResult
{
  self->_needsUpdateFlags.peopleFetchResult = 1;
  [(PXPhotosDetailsActionsUIWidget *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsActionsUIWidget.m" lineNumber:599 description:@"not inside -performChanges: or _updateIfNeeded"];
  }
}

- (void)_updateIfNeeded
{
  if ([(PXPhotosDetailsActionsUIWidget *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXPhotosDetailsActionsUIWidget *)self _updatePeopleFetchResultIfNeeded];
    [(PXPhotosDetailsActionsUIWidget *)self _updateActionManagerIfNeeded];
    [(PXPhotosDetailsActionsUIWidget *)self _updateAllowedActionTypesIfNeeded];
    [(PXPhotosDetailsActionsUIWidget *)self _updatePerformableActionTypesIfNeeded];
    [(PXPhotosDetailsActionsUIWidget *)self _updateRowHeightIfNeeded];
    [(PXPhotosDetailsActionsUIWidget *)self _updateLayoutIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if ([(PXPhotosDetailsActionsUIWidget *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsActionsUIWidget.m" lineNumber:595 description:@"update still needed after update pass"];
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.peopleFetchResult
      || self->_needsUpdateFlags.actionManager
      || self->_needsUpdateFlags.allowedActionTypes
      || self->_needsUpdateFlags.performableActionTypes
      || self->_needsUpdateFlags.rowHeight
      || self->_needsUpdateFlags.layout;
}

- (void)_performChanges:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  uint64_t v6 = v4;
  if (v4)
  {
    v4[2](v4);
    id v4 = v6;
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXPhotosDetailsActionsUIWidget *)self _updateIfNeeded];
    id v4 = v6;
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSpecManagerObservationContext_169870 == a5)
  {
    if (v6)
    {
      uint64_t v10 = v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      long long v11 = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke;
      goto LABEL_12;
    }
  }
  else if ((void *)PXPhotosDetailsContextObservationContext_169871 == a5)
  {
    if ((v6 & 0x30) != 0)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_2;
      v16[3] = &unk_1E5DD36F8;
      v16[4] = self;
      [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v16];
    }
    if ((v6 & 8) != 0)
    {
      uint64_t v10 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      long long v11 = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_3;
      goto LABEL_12;
    }
  }
  else
  {
    if ((void *)PXPhotosDetailsViewModelObservationContext != a5)
    {
      long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsActionsUIWidget.m" lineNumber:548 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 0x20) != 0)
    {
      uint64_t v10 = &v13;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      long long v11 = __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_4;
LABEL_12:
      v10[2] = (uint64_t)v11;
      v10[3] = (uint64_t)&unk_1E5DD36F8;
      v10[4] = (uint64_t)self;
      -[PXPhotosDetailsActionsUIWidget _performChanges:](self, "_performChanges:", v13, v14);
    }
  }
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLayoutEnsureTransition];
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateActionManager];
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidatePeopleFetchResult];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateLayout];
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLayout];
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v5 = objc_msgSend(a4, "sectionedDataSourceChangeDetails", a3);
  char v6 = [v5 sectionChanges];

  if ([v6 hasAnyChanges])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__PXPhotosDetailsActionsUIWidget_photosDataSource_didChange___block_invoke;
    v7[3] = &unk_1E5DD36F8;
    v7[4] = self;
    [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v7];
  }
}

void __61__PXPhotosDetailsActionsUIWidget_photosDataSource_didChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _photosDataSource];
  id v6 = [v2 firstAssetCollection];

  id v3 = [*(id *)(a1 + 32) _assetCollectionActionManager];
  id v4 = [v3 assetCollectionReference];
  id v5 = [v4 assetCollection];

  if (v5 != v6)
  {
    [*(id *)(a1 + 32) _invalidateActionManager];
    [*(id *)(a1 + 32) _invalidatePerformableActionTypes];
  }
  [*(id *)(a1 + 32) _invalidateLayout];
}

- (void)prepareForPopoverPresentation:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXPhotosDetailsActionsUIWidget *)self _activePerformer];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__169875;
  v37 = __Block_byref_object_dispose__169876;
  id v38 = 0;
  id v6 = [(PXPhotosDetailsActionsUIWidget *)self _tilingController];
  uint64_t v7 = [v6 scrollController];
  [v7 visibleRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __64__PXPhotosDetailsActionsUIWidget_prepareForPopoverPresentation___block_invoke;
  v30[3] = &unk_1E5DC19D0;
  v30[4] = self;
  id v16 = v5;
  id v31 = v16;
  v32 = &v33;
  objc_msgSend(v6, "enumerateTilesInRect:withOptions:usingBlock:", 0, v30, v9, v11, v13, v15);
  v17 = (void *)v34[5];
  if (v17)
  {
    [v17 bounds];
    double v19 = v18;
    [(PXPhotosDetailsActionsUIWidget *)self lastNormalizedTapPosition];
    double v21 = v20;
    [(id)v34[5] bounds];
    double v23 = v22;
    [(id)v34[5] bounds];
    double v25 = v24;
    [(id)v34[5] bounds];
    double v27 = v26;
    [v4 setSourceView:v34[5]];
    objc_msgSend(v4, "setSourceRect:", v19 * v21 + v25 * -0.5, v23 + v27 * -0.75, v25, v27);
    [v4 setPermittedArrowDirections:2];
  }
  else
  {
    v28 = PLUIGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = [v16 actionType];
      *(_DWORD *)buf = 138412290;
      v40 = v29;
      _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_ERROR, "Failed to prepare popover presentation over a tile row for action type (%@)", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v33, 8);
}

void __64__PXPhotosDetailsActionsUIWidget_prepareForPopoverPresentation___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  if (*(void *)(a2 + 8) == 6200434)
  {
    uint64_t v11 = *(void *)(a2 + 24);
    double v12 = [*(id *)(a1 + 32) _performableActionTypes];
    id v17 = [v12 objectAtIndexedSubscript:v11];

    double v13 = [*(id *)(a1 + 40) actionType];
    LODWORD(v12) = [v13 isEqualToString:v17];

    if (v12)
    {
      uint64_t v14 = [a3 view];
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      *a8 = 1;
    }
  }
}

- (id)undoManagerForActionPerformer:(id)a3
{
  id v4 = [(PXPhotosDetailsActionsUIWidget *)self widgetDelegate];
  id v5 = [v4 widgetUndoManager:self];

  return v5;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [v5 popoverPresentationController];
  [v6 setDelegate:self];
  uint64_t v7 = [(PXPhotosDetailsActionsUIWidget *)self widgetDelegate];
  LOBYTE(self) = [v7 widget:self transitionToViewController:v5 withTransitionType:2];

  return (char)self;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 10)
  {
    [(PXPhotosDetailsActionsUIWidget *)self _setActivePerformer:v6];
  }
  else
  {
    id v7 = [(PXPhotosDetailsActionsUIWidget *)self _activePerformer];

    if (v7 == v6) {
      [(PXPhotosDetailsActionsUIWidget *)self _setActivePerformer:0];
    }
    if (a4 == 20)
    {
      double v8 = [v6 actionType];
      int v9 = [v8 isEqualToString:@"PXAssetCollectionActionTypeCreateMemory"];

      if (v9)
      {
        double v10 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v11 = [(PXPhotosDetailsActionsUIWidget *)self _viewModel];
        double v12 = [v11 disabledActionTypes];
        double v13 = [v10 setWithSet:v12];

        [v13 addObject:@"PXAssetCollectionActionTypeCreateMemory"];
        uint64_t v14 = [(PXPhotosDetailsActionsUIWidget *)self _viewModel];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __65__PXPhotosDetailsActionsUIWidget_actionPerformer_didChangeState___block_invoke;
        v25[3] = &unk_1E5DC19A8;
        id v26 = v13;
        id v15 = v13;
        [v14 performChanges:v25];
      }
      id v16 = [v6 actionType];
      int v17 = [v16 isEqualToString:@"PXAssetCollectionActionTypeBlockMemory"];

      if (v17)
      {
        double v18 = [(PXPhotosDetailsActionsUIWidget *)self widgetDelegate];
        [v18 widget:self requestViewControllerDismissalAnimated:1];
      }
      double v19 = [v6 actionType];
      int v20 = [v19 isEqualToString:@"PXAssetCollectionActionTypeDeleteMemory"];

      if (v20)
      {
        double v21 = [(PXPhotosDetailsActionsUIWidget *)self widgetDelegate];
        [v21 widget:self requestViewControllerDismissalAnimated:1];
      }
    }
  }
  double v22 = [(PXPhotosDetailsActionsUIWidget *)self actionPerformerDelegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    double v24 = [(PXPhotosDetailsActionsUIWidget *)self actionPerformerDelegate];
    [v24 actionPerformer:v6 didChangeState:a4];
  }
}

uint64_t __65__PXPhotosDetailsActionsUIWidget_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisabledActionTypes:*(void *)(a1 + 32)];
}

- (id)menuElementsForActionRowTile:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDetailsActionsUIWidget *)self _tilingController];
  id v6 = v5;
  if (v5) {
    [v5 tileIdentifierForTile:v4];
  }

  return 0;
}

- (void)actionRowTileSelected:(id)a3 tapPositionInTile:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(PXPhotosDetailsActionsUIWidget *)self _activePerformer];

  if (!v8)
  {
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    int v9 = [(PXPhotosDetailsActionsUIWidget *)self _tilingController];
    double v10 = v9;
    if (v9)
    {
      [v9 tileIdentifierForTile:v7];
    }
    else
    {
      uint64_t v30 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v25 = 0u;
    }

    if ((unint64_t)(v25 - 6) >= 0xFFFFFFFFFFFFFFFDLL && (void)v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = *((void *)&v26 + 1);
      double v12 = [(PXPhotosDetailsActionsUIWidget *)self _performableActionTypes];
      double v13 = [v12 objectAtIndexedSubscript:v11];

      uint64_t v14 = [v7 view];
      [v14 bounds];
      double v16 = v15;
      double v18 = v17;

      -[PXPhotosDetailsActionsUIWidget setLastNormalizedTapPosition:](self, "setLastNormalizedTapPosition:", x / v16, y / v18);
      double v19 = [(PXPhotosDetailsActionsUIWidget *)self _assetCollectionActionManager];
      int v20 = [v19 actionPerformerForActionType:v13];

      [v20 setDelegate:self];
      double v21 = [(PXPhotosDetailsActionsUIWidget *)self widgetUnlockDelegate];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __74__PXPhotosDetailsActionsUIWidget_actionRowTileSelected_tapPositionInTile___block_invoke;
      v23[3] = &unk_1E5DD36F8;
      id v24 = v20;
      id v22 = v20;
      [v21 widget:self performAfterUnlockingDeviceIfNecessary:v23 failurehandler:0];
    }
  }
}

uint64_t __74__PXPhotosDetailsActionsUIWidget_actionRowTileSelected_tapPositionInTile___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performActionWithCompletionHandler:&__block_literal_global_169881];
}

void __74__PXPhotosDetailsActionsUIWidget_actionRowTileSelected_tapPositionInTile___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (a2 & 1) == 0)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Error performing action:%@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v4 = a4;
  id v5 = [v4 fromLayout];
  int v6 = [v4 toLayout];

  if (v5 == v6) {
    id v7 = objc_alloc_init(PXTileIdentifierIdentityConverter);
  }
  else {
    id v7 = 0;
  }
  return v7;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v5 = a3;
  int v6 = [(PXPhotosDetailsActionsUIWidget *)self _tileReusePool];
  [v6 checkInReusableObject:v5];

  id v7 = [(PXPhotosDetailsActionsUIWidget *)self _tilesInUse];
  [v7 removeObject:v5];
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7 = a4;
  unint64_t v8 = a3->index[0];
  if (v8 == 6200435)
  {
    double v13 = [(PXPhotosDetailsActionsUIWidget *)self _tileReusePool];
    double v10 = [v13 checkOutReusableObjectWithReuseIdentifier:403153];
  }
  else
  {
    if (v8 != 6200434)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v17 = *(_OWORD *)&a3->index[5];
      long long v22 = *(_OWORD *)&a3->index[3];
      long long v23 = v17;
      long long v24 = *(_OWORD *)&a3->index[7];
      unint64_t v25 = a3->index[9];
      long long v18 = *(_OWORD *)&a3->index[1];
      long long v20 = *(_OWORD *)&a3->length;
      long long v21 = v18;
      double v19 = PXTileIdentifierDescription((unint64_t *)&v20);
      [v16 handleFailureInMethod:a2, self, @"PXPhotosDetailsActionsUIWidget.m", 357, @"%@ got asked to produce a tile for an unknown identifier:%@. If you're adding custom tile kinds, those have to be returned by your own tile source and not bubble up to the assets scene.", self, v19 object file lineNumber description];

      abort();
    }
    int v9 = [(PXPhotosDetailsActionsUIWidget *)self _tileReusePool];
    double v10 = [v9 checkOutReusableObjectWithReuseIdentifier:403133];

    long long v11 = *(_OWORD *)&a3->index[5];
    long long v22 = *(_OWORD *)&a3->index[3];
    long long v23 = v11;
    long long v24 = *(_OWORD *)&a3->index[7];
    unint64_t v25 = a3->index[9];
    long long v12 = *(_OWORD *)&a3->index[1];
    long long v20 = *(_OWORD *)&a3->length;
    long long v21 = v12;
    [(PXPhotosDetailsActionsUIWidget *)self configureActionButtonTile:v10 withIdentifier:&v20];
  }
  uint64_t v14 = [(PXPhotosDetailsActionsUIWidget *)self _tilesInUse];
  [v14 addObject:v10];

  return v10;
}

- (void)configureActionButtonTile:(id)a3 withIdentifier:(PXTileIdentifier *)a4
{
  spec = self->_spec;
  id v7 = a3;
  objc_msgSend(v7, "setIdiom:", -[PXFeatureSpec userInterfaceIdiom](spec, "userInterfaceIdiom"));
  unint64_t v8 = a4->index[2];
  int v9 = [(PXPhotosDetailsActionsUIWidget *)self _performableActionTypes];
  id v15 = [v9 objectAtIndexedSubscript:v8];

  double v10 = [(PXPhotosDetailsActionsUIWidget *)self _assetCollectionActionManager];
  long long v11 = [v10 localizedTitleForActionType:v15 useCase:1];
  [v7 setTitle:v11];

  long long v12 = [(PXPhotosDetailsActionsUIWidget *)self _viewModel];
  double v13 = [v12 disabledActionTypes];
  objc_msgSend(v7, "setEnabled:", objc_msgSend(v13, "containsObject:", v15) ^ 1);

  uint64_t v14 = [v10 menuElementsForActionType:v15];
  objc_msgSend(v7, "setShowsMenu:", objc_msgSend(v14, "count") != 0);
}

- (void)reusableObjectPool:(id)a3 didEvictReusableObject:(id)a4
{
  objc_msgSend(a4, "view", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeFromSuperview];
}

- (void)reusableObjectPool:(id)a3 didCreateReusableObject:(id)a4
{
  objc_msgSend(a4, "view", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(PXPhotosDetailsActionsUIWidget *)self _scrollViewController];
  [v5 addSubview:v6];
}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)@"PXPhotosDetailsActionsUIWidget";
}

- (PXTilingController)contentTilingController
{
  [(PXPhotosDetailsActionsUIWidget *)self _loadTilingController];
  return [(PXPhotosDetailsActionsUIWidget *)self _tilingController];
}

- (BOOL)hasContentForCurrentInput
{
  id v3 = [(PXPhotosDetailsActionsUIWidget *)self _performableActionTypes];
  uint64_t v4 = [v3 count];

  id v5 = [(PXPhotosDetailsActionsUIWidget *)self widgetUnlockDelegate];
  if (v5)
  {
    id v6 = [(PXPhotosDetailsActionsUIWidget *)self widgetUnlockDelegate];
    char v7 = [v6 widgetDeviceIsUnlocked:self];
  }
  else
  {
    char v7 = 1;
  }

  if (v4) {
    return v7;
  }
  else {
    return 0;
  }
}

- (void)_setPeopleFetchResult:(id)a3
{
  id v5 = (PHFetchResult *)a3;
  if (self->__peopleFetchResult != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->__peopleFetchResult, a3);
    [(PXPhotosDetailsActionsUIWidget *)self _invalidateActionManager];
    [(PXPhotosDetailsActionsUIWidget *)self _invalidatePerformableActionTypes];
    id v5 = v6;
  }
}

- (void)_setPhotosDataSource:(id)a3
{
  id v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->__photosDataSource;
  char v7 = v5;
  if (photosDataSource != v5)
  {
    [(PXPhotosDataSource *)photosDataSource unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->__photosDataSource, a3);
    [(PXPhotosDataSource *)v7 registerChangeObserver:self];
    [(PXPhotosDetailsActionsUIWidget *)self _invalidateActionManager];
    [(PXPhotosDetailsActionsUIWidget *)self _invalidatePerformableActionTypes];
  }
}

- (void)_setViewModel:(id)a3
{
  id v5 = (PXPhotosDetailsViewModel *)a3;
  viewModel = self->__viewModel;
  if (viewModel != v5)
  {
    char v7 = v5;
    [(PXPhotosDetailsViewModel *)viewModel unregisterChangeObserver:self context:PXPhotosDetailsViewModelObservationContext];
    objc_storeStrong((id *)&self->__viewModel, a3);
    [(PXPhotosDetailsViewModel *)self->__viewModel registerChangeObserver:self context:PXPhotosDetailsViewModelObservationContext];
    [(PXPhotosDetailsActionsUIWidget *)self _invalidateLayout];
    id v5 = v7;
  }
}

- (void)setContext:(id)a3
{
  id v5 = (PXPhotosDetailsContext *)a3;
  context = self->_context;
  if (context != v5)
  {
    [(PXPhotosDetailsContext *)context unregisterChangeObserver:self context:PXPhotosDetailsContextObservationContext_169871];
    objc_storeStrong((id *)&self->_context, a3);
    [(PXPhotosDetailsContext *)self->_context registerChangeObserver:self context:PXPhotosDetailsContextObservationContext_169871];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PXPhotosDetailsActionsUIWidget_setContext___block_invoke;
    v7[3] = &unk_1E5DD32A8;
    v7[4] = self;
    unint64_t v8 = v5;
    [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v7];
  }
}

uint64_t __45__PXPhotosDetailsActionsUIWidget_setContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) viewModel];
  [v2 _setViewModel:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) photosDataSource];
  [v4 _setPhotosDataSource:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 _invalidatePeopleFetchResult];
}

- (void)_setPerformableActionTypes:(id)a3
{
  char v7 = (NSArray *)a3;
  id v5 = self->__performableActionTypes;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSArray *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__performableActionTypes, a3);
      [(PXPhotosDetailsActionsUIWidget *)self _invalidateLayout];
    }
  }
}

- (void)_setAllowedActionTypes:(id)a3
{
  unint64_t v8 = (NSArray *)a3;
  uint64_t v4 = self->__allowedActionTypes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      allowedActionTypes = self->__allowedActionTypes;
      self->__allowedActionTypes = v6;

      [(PXPhotosDetailsActionsUIWidget *)self _invalidatePerformableActionTypes];
    }
  }
}

- (id)_createNewLayout
{
  id v3 = [(PXPhotosDetailsActionsUIWidget *)self _performableActionTypes];
  uint64_t v4 = [v3 count];

  char v5 = [(PXPhotosDetailsActionsUIWidget *)self _specManager];
  char v6 = [v5 spec];

  char v7 = [[PXPhotosDetailsActionsTilingLayout alloc] initWithNumberOfItems:v4];
  [(PXPhotosDetailsActionsUIWidget *)self _rowHeight];
  -[PXPhotosDetailsActionsTilingLayout setRowHeight:](v7, "setRowHeight:");
  unint64_t v8 = [(PXPhotosDetailsActionsUIWidget *)self _extendedTraitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  double v10 = 1.0;
  if (v9 == 3) {
    double v10 = 15.0;
  }
  [(PXPhotosDetailsActionsTilingLayout *)v7 setSeparatorHeight:v10];
  -[PXPhotosDetailsActionsTilingLayout setShouldShowSeparators:](v7, "setShouldShowSeparators:", [v6 shouldShowSeparators]);
  -[PXPhotosDetailsActionsTilingLayout setShouldInsetAllSeparators:](v7, "setShouldInsetAllSeparators:", [v6 shouldInsetAllSeparators]);

  return v7;
}

- (void)_handleContentSizeCategoryDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__PXPhotosDetailsActionsUIWidget__handleContentSizeCategoryDidChange___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v3];
}

uint64_t __70__PXPhotosDetailsActionsUIWidget__handleContentSizeCategoryDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateRowHeight];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateLayout];
}

- (void)_loadTilingController
{
  if (!self->__tilingController)
  {
    id v3 = [MEMORY[0x1E4F1CA80] set];
    tilesInUse = self->__tilesInUse;
    self->__tilesInUse = v3;

    char v5 = [(PXPhotosDetailsActionsUIWidget *)self widgetDelegate];
    char v6 = [v5 widgetScrollViewControllerHostingWidget:self];
    scrollViewController = self->__scrollViewController;
    self->__scrollViewController = v6;

    unint64_t v8 = [(PXPhotosDetailsActionsUIWidget *)self widgetDelegate];
    uint64_t v9 = [v8 widgetViewControllerHostingWidget:self];
    double v10 = objc_msgSend(v9, "px_extendedTraitCollection");

    long long v11 = [(PXFeatureSpecManager *)[PXPhotosDetailsActionsSpecManager alloc] initWithExtendedTraitCollection:v10];
    specManager = self->__specManager;
    self->__specManager = v11;

    [(PXPhotosDetailsActionsSpecManager *)self->__specManager registerChangeObserver:self context:PXSpecManagerObservationContext_169870];
    double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:self selector:sel__handleContentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v14 = objc_alloc_init(PXActionRowTile);
    measuringActionRowTile = self->__measuringActionRowTile;
    self->__measuringActionRowTile = v14;

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke;
    v30[3] = &unk_1E5DD36F8;
    v30[4] = self;
    [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v30];
    double v16 = [(PXPhotosDetailsActionsUIWidget *)self _createNewLayout];
    long long v17 = [[PXTilingController alloc] initWithLayout:v16];
    tilingController = self->__tilingController;
    self->__tilingController = v17;

    [(PXTilingController *)self->__tilingController setScrollController:self->__scrollViewController];
    double v19 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = (PXTileAnimator *)v19;

    [(PXTilingController *)self->__tilingController setTileAnimator:self->__tileAnimator];
    [(PXTilingController *)self->__tilingController setTileSource:self];
    [(PXTilingController *)self->__tilingController setTransitionDelegate:self];
    long long v21 = (PXReusableObjectPool *)objc_alloc_init((Class)off_1E5DA8338);
    tileReusePool = self->__tileReusePool;
    self->__tileReusePool = v21;

    [(PXReusableObjectPool *)self->__tileReusePool setDelegate:self];
    objc_initWeak(&location, self);
    long long v23 = self->__tileReusePool;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_2;
    v27[3] = &unk_1E5DC9F50;
    objc_copyWeak(&v28, &location);
    [(PXReusableObjectPool *)v23 registerReusableObjectForReuseIdentifier:403133 creationHandler:v27];
    long long v24 = self->__tileReusePool;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_3;
    v25[3] = &unk_1E5DC9F50;
    objc_copyWeak(&v26, &location);
    [(PXReusableObjectPool *)v24 registerReusableObjectForReuseIdentifier:403153 creationHandler:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

uint64_t __55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateRowHeight];
}

PXActionRowTile *__55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(PXActionRowTile);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [(PXActionRowTile *)v2 setDelegate:WeakRetained];

  return v2;
}

PXUIGenericViewTile *__55__PXPhotosDetailsActionsUIWidget__loadTilingController__block_invoke_3(uint64_t a1)
{
  v2 = objc_alloc_init(PXUIGenericViewTile);
  id v3 = [(PXUIGenericViewTile *)v2 view];
  [v3 setOpaque:1];
  uint64_t v4 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v6 = [WeakRetained _extendedTraitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 3)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];

    uint64_t v4 = (void *)v8;
  }
  [v3 setBackgroundColor:v4];

  return v2;
}

- (id)_extendedTraitCollection
{
  id v3 = [(PXPhotosDetailsActionsUIWidget *)self widgetDelegate];
  uint64_t v4 = [v3 widgetExtendedTraitCollection:self];

  return v4;
}

- (void)setAllowInternalFileRadarAction:(BOOL)a3
{
  if (self->_allowInternalFileRadarAction != a3)
  {
    self->_allowInternalFileRadarAction = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__PXPhotosDetailsActionsUIWidget_setAllowInternalFileRadarAction___block_invoke;
    v3[3] = &unk_1E5DD36F8;
    v3[4] = self;
    [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v3];
  }
}

uint64_t __66__PXPhotosDetailsActionsUIWidget_setAllowInternalFileRadarAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllowedActionTypes];
}

- (void)setAllowCreateMemoryAction:(BOOL)a3
{
  if (self->_allowCreateMemoryAction != a3)
  {
    self->_allowCreateMemoryAction = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __61__PXPhotosDetailsActionsUIWidget_setAllowCreateMemoryAction___block_invoke;
    v3[3] = &unk_1E5DD36F8;
    v3[4] = self;
    [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v3];
  }
}

uint64_t __61__PXPhotosDetailsActionsUIWidget_setAllowCreateMemoryAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllowedActionTypes];
}

- (void)setAllowRevealInMomentAction:(BOOL)a3
{
  if (self->_allowRevealInMomentAction != a3)
  {
    self->_allowRevealInMomentAction = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__PXPhotosDetailsActionsUIWidget_setAllowRevealInMomentAction___block_invoke;
    v3[3] = &unk_1E5DD36F8;
    v3[4] = self;
    [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v3];
  }
}

uint64_t __63__PXPhotosDetailsActionsUIWidget_setAllowRevealInMomentAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllowedActionTypes];
}

- (void)setSpec:(id)a3
{
  char v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__PXPhotosDetailsActionsUIWidget_setSpec___block_invoke;
    v6[3] = &unk_1E5DD36F8;
    v6[4] = self;
    [(PXPhotosDetailsActionsUIWidget *)self _performChanges:v6];
  }
}

uint64_t __42__PXPhotosDetailsActionsUIWidget_setSpec___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLayout];
}

- (PXPhotosDetailsActionsUIWidget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsActionsUIWidget;
  CGPoint result = [(PXPhotosDetailsActionsUIWidget *)&v3 init];
  if (result)
  {
    result->_needsUpdateFlags.allowedActionTypes = 1;
    result->_allowCreateMemoryAction = 1;
  }
  return result;
}

@end