@interface PXTilingController
- (BOOL)_needsUpdate;
- (BOOL)getTile:(void *)a3 geometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileWithIdentifier:(PXTileIdentifier *)a7;
- (BOOL)shouldAggressivelyEvictTileCaches;
- (CGPoint)_layoutDesiredOrigin;
- (CGPoint)_updatedPreferredVisibleOrigin;
- (CGPoint)convertPointFromLayout:(CGPoint)a3;
- (CGPoint)layoutOrigin;
- (CGPoint)layoutPreferredOrigin;
- (CGRect)_activeRect;
- (CGRect)_cachedRect;
- (CGRect)_dirtyRect;
- (CGRect)_pagedRect;
- (CGRect)_visibleRect;
- (CGRect)convertRectFromLayout:(CGRect)a3;
- (CGRect)layoutContentBounds;
- (CGRect)layoutScrollBounds;
- (CGSize)_referenceSize;
- (NSArray)compositionInvalidationContexts;
- (NSMutableArray)_preheatRecords;
- (NSMutableIndexSet)_dirtyTileIndexes;
- (PXScrollController)scrollController;
- (PXScrollInfo)_scrollInfo;
- (PXScrollInfo)scrollInfo;
- (PXTileAnimator)tileAnimator;
- (PXTileIdentifier)hitTestTileAtPoint:(SEL)a3 padding:(CGPoint)a4 passingTest:(UIEdgeInsets)a5;
- (PXTileIdentifier)tileIdentifierForTile:(SEL)a3;
- (PXTileSource)tileSource;
- (PXTileStatePool)_tileStates;
- (PXTilingChange)_currentChange;
- (PXTilingController)init;
- (PXTilingController)initWithLayout:(id)a3;
- (PXTilingControllerDebugInfo)debugInfo;
- (PXTilingControllerObserver)observer;
- (PXTilingControllerScrollDelegate)scrollDelegate;
- (PXTilingControllerTransitionDelegate)transitionDelegate;
- (PXTilingCoordinateSpace)_coordinateSpace;
- (PXTilingCoordinateSpaceConverter)_coordinateSpaceConverter;
- (PXTilingDebugDelegate)debugDelegate;
- (PXTilingLayout)_layoutWithInitializedVisibleOrigin;
- (PXTilingLayout)currentLayout;
- (PXTilingLayout)targetLayout;
- (UIEdgeInsets)_contentInset;
- (UIEdgeInsets)_maxPreheatPadding;
- (id)_currentChangeIfExists;
- (id)_indexesOfVisibleTilesInRect:(CGRect)a3 withOptions:(id)a4;
- (id)_preheatRecordForPreheatHandler:(id)a3 context:(void *)a4 createIfNeeded:(BOOL)a5;
- (id)convertScrollInfoFromLayout:(id)a3;
- (id)debugQuickLookObject;
- (id)imageTileWithIdentifier:(PXTileIdentifier *)a3;
- (id)titleSubtitleTileWithIdentifier:(PXTileIdentifier *)a3;
- (void)_coordinateSpaceIdentifier;
- (void)_discardCurrentChange;
- (void)_ensureCurrentChange;
- (void)_fillBuffersWithTileStatesAtIndexes:(id)a3;
- (void)_handleTileAnimationCompletionWithIndex:(unint64_t)a3;
- (void)_invalidateAllCachedRects;
- (void)_invalidateCachesOutsideRect:(CGRect)a3;
- (void)_invalidateLayoutMetrics;
- (void)_invalidateLayoutPosition;
- (void)_invalidateLayoutPreferredVisibleOrigin;
- (void)_invalidateLayoutPreparation;
- (void)_invalidateLayoutVisibleRect;
- (void)_invalidateMaxPreheatPadding;
- (void)_invalidatePagedRect;
- (void)_invalidatePreheating;
- (void)_invalidateRect:(CGRect)a3;
- (void)_invalidateScrollControllerMetrics;
- (void)_invalidateScrollInfo;
- (void)_invalidateTiles;
- (void)_markRectAsCached:(CGRect)a3;
- (void)_prepareBufferForCount:(unint64_t)a3;
- (void)_setActiveRect:(CGRect)a3;
- (void)_setCachedRect:(CGRect)a3;
- (void)_setContentInset:(UIEdgeInsets)a3;
- (void)_setCurrentLayout:(id)a3;
- (void)_setDirtyRect:(CGRect)a3;
- (void)_setLayoutDesiredOrigin:(CGPoint)a3;
- (void)_setLayoutWithInitializedVisibleOrigin:(id)a3;
- (void)_setMaxPreheatPadding:(UIEdgeInsets)a3;
- (void)_setNeedsUpdate;
- (void)_setPagedRect:(CGRect)a3;
- (void)_setReferenceSize:(CGSize)a3;
- (void)_setScrollInfo:(id)a3;
- (void)_setTargetLayout:(id)a3;
- (void)_setUpdatedPreferredVisibleOrigin:(CGPoint)a3;
- (void)_setVisibleRect:(CGRect)a3;
- (void)_updateDebugDelegateIfNeeded;
- (void)_updateLayoutMetricsIfNeeded;
- (void)_updateLayoutPositionIfNeeded;
- (void)_updateLayoutPreferredVisibleOriginIfNeeded;
- (void)_updateLayoutPreparationIfNeeded;
- (void)_updateLayoutVisibleRectIfNeeded;
- (void)_updateMaxPreheatPaddingIfNeeded;
- (void)_updatePagedRectIfNeeded;
- (void)_updatePreheatingIfNeeded;
- (void)_updateScrollControllerMetricsIfNeeded;
- (void)_updateScrollInfoIfNeeded;
- (void)_updateTilesIfNeeded;
- (void)beginUpdate;
- (void)dealloc;
- (void)endUpdate;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)registerPreheatHandler:(id)a3 withPadding:(UIEdgeInsets)a4 tileGroup:(unint64_t)a5 context:(void *)a6;
- (void)requestFocus;
- (void)setCompositionInvalidationContexts:(id)a3;
- (void)setDebugDelegate:(id)a3;
- (void)setLayoutOrigin:(CGPoint)a3;
- (void)setObserver:(id)a3;
- (void)setReferenceSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4;
- (void)setScrollController:(id)a3;
- (void)setScrollDelegate:(id)a3;
- (void)setShouldAggressivelyEvictTileCaches:(BOOL)a3;
- (void)setTileAnimator:(id)a3;
- (void)setTileSource:(id)a3;
- (void)setTransitionDelegate:(id)a3;
- (void)tilingLayout:(id)a3 invalidatedWithContext:(id)a4;
- (void)unregisterPreheatHandler:(id)a3 context:(void *)a4;
- (void)updateLayout;
- (void)updateMetrics;
@end

@implementation PXTilingController

- (void)requestFocus
{
  id v3 = [(PXTilingController *)self observer];
  [v3 tilingController:self invalidatedWithContext:1];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_debugDelegate);
  objc_storeStrong((id *)&self->_compositionInvalidationContexts, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->__preheatRecords, 0);
  objc_storeStrong((id *)&self->__dirtyTileIndexes, 0);
  objc_storeStrong((id *)&self->__tileStates, 0);
  objc_storeStrong((id *)&self->__scrollInfo, 0);
  objc_destroyWeak((id *)&self->__layoutWithInitializedVisibleOrigin);
  objc_storeStrong((id *)&self->__coordinateSpaceConverter, 0);
  objc_storeStrong((id *)&self->__coordinateSpace, 0);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_destroyWeak((id *)&self->_scrollDelegate);
  objc_destroyWeak((id *)&self->_tileAnimator);
  objc_destroyWeak((id *)&self->_tileSource);
  objc_destroyWeak((id *)&self->_scrollController);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_targetLayout, 0);
  objc_storeStrong((id *)&self->__currentChange, 0);
}

- (void)setDebugDelegate:(id)a3
{
}

- (PXTilingDebugDelegate)debugDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugDelegate);
  return (PXTilingDebugDelegate *)WeakRetained;
}

- (void)setCompositionInvalidationContexts:(id)a3
{
}

- (NSArray)compositionInvalidationContexts
{
  return self->_compositionInvalidationContexts;
}

- (void)setObserver:(id)a3
{
}

- (PXTilingControllerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PXTilingControllerObserver *)WeakRetained;
}

- (UIEdgeInsets)_maxPreheatPadding
{
  double top = self->__maxPreheatPadding.top;
  double left = self->__maxPreheatPadding.left;
  double bottom = self->__maxPreheatPadding.bottom;
  double right = self->__maxPreheatPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSMutableArray)_preheatRecords
{
  return self->__preheatRecords;
}

- (NSMutableIndexSet)_dirtyTileIndexes
{
  return self->__dirtyTileIndexes;
}

- (CGRect)_dirtyRect
{
  double x = self->__dirtyRect.origin.x;
  double y = self->__dirtyRect.origin.y;
  double width = self->__dirtyRect.size.width;
  double height = self->__dirtyRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXTileStatePool)_tileStates
{
  return self->__tileStates;
}

- (void)_setCachedRect:(CGRect)a3
{
  self->__cachedRect = a3;
}

- (CGRect)_cachedRect
{
  double x = self->__cachedRect.origin.x;
  double y = self->__cachedRect.origin.y;
  double width = self->__cachedRect.size.width;
  double height = self->__cachedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_pagedRect
{
  double x = self->__pagedRect.origin.x;
  double y = self->__pagedRect.origin.y;
  double width = self->__pagedRect.size.width;
  double height = self->__pagedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setScrollInfo:(id)a3
{
}

- (PXScrollInfo)_scrollInfo
{
  return self->__scrollInfo;
}

- (void)_setLayoutDesiredOrigin:(CGPoint)a3
{
  self->__layoutDesiredOrigin = a3;
}

- (CGPoint)_layoutDesiredOrigin
{
  double x = self->__layoutDesiredOrigin.x;
  double y = self->__layoutDesiredOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setUpdatedPreferredVisibleOrigin:(CGPoint)a3
{
  self->__updatedPreferredVisibleOrigin = a3;
}

- (CGPoint)_updatedPreferredVisibleOrigin
{
  double x = self->__updatedPreferredVisibleOrigin.x;
  double y = self->__updatedPreferredVisibleOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_visibleRect
{
  double x = self->__visibleRect.origin.x;
  double y = self->__visibleRect.origin.y;
  double width = self->__visibleRect.size.width;
  double height = self->__visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_activeRect
{
  double x = self->__activeRect.origin.x;
  double y = self->__activeRect.origin.y;
  double width = self->__activeRect.size.width;
  double height = self->__activeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)_contentInset
{
  double top = self->__contentInset.top;
  double left = self->__contentInset.left;
  double bottom = self->__contentInset.bottom;
  double right = self->__contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)_referenceSize
{
  double width = self->__referenceSize.width;
  double height = self->__referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setLayoutWithInitializedVisibleOrigin:(id)a3
{
}

- (PXTilingLayout)_layoutWithInitializedVisibleOrigin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__layoutWithInitializedVisibleOrigin);
  return (PXTilingLayout *)WeakRetained;
}

- (PXTilingCoordinateSpaceConverter)_coordinateSpaceConverter
{
  return self->__coordinateSpaceConverter;
}

- (void)_coordinateSpaceIdentifier
{
  return self->__coordinateSpaceIdentifier;
}

- (PXTilingCoordinateSpace)_coordinateSpace
{
  return self->__coordinateSpace;
}

- (void)setShouldAggressivelyEvictTileCaches:(BOOL)a3
{
  self->_shouldAggressivelyEvictTileCaches = a3;
}

- (BOOL)shouldAggressivelyEvictTileCaches
{
  return self->_shouldAggressivelyEvictTileCaches;
}

- (PXTilingControllerTransitionDelegate)transitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDelegate);
  return (PXTilingControllerTransitionDelegate *)WeakRetained;
}

- (PXTilingControllerScrollDelegate)scrollDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);
  return (PXTilingControllerScrollDelegate *)WeakRetained;
}

- (void)setTileAnimator:(id)a3
{
}

- (PXTileAnimator)tileAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileAnimator);
  return (PXTileAnimator *)WeakRetained;
}

- (void)setTileSource:(id)a3
{
}

- (PXTileSource)tileSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileSource);
  return (PXTileSource *)WeakRetained;
}

- (PXScrollController)scrollController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollController);
  return (PXScrollController *)WeakRetained;
}

- (void)_setCurrentLayout:(id)a3
{
}

- (PXTilingLayout)currentLayout
{
  return self->_currentLayout;
}

- (PXTilingLayout)targetLayout
{
  return self->_targetLayout;
}

- (void)tilingLayout:(id)a3 invalidatedWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_hasInitializedLayout)
  {
    [(PXTilingController *)self _ensureCurrentChange];
    v8 = [(PXTilingController *)self _currentChange];
    v9 = [[PXTilingChangeEvent alloc] initWithLayoutInvalidationContext:v7];
    [v8 addEvent:v9];

    [(PXTilingController *)self _invalidateLayoutPreparation];
    if (([v7 invalidatedContentBounds] & 1) != 0
      || [v7 invalidatedScrollBounds])
    {
      v10 = [(PXTilingController *)self observer];
      [v10 tilingController:self invalidatedWithContext:2];

      [(PXTilingController *)self _setNeedsUpdate];
    }
    if ([v7 invalidatedVisibleRect])
    {
      [(PXTilingController *)self _setLayoutWithInitializedVisibleOrigin:0];
      [(PXTilingController *)self _invalidateLayoutPreferredVisibleOrigin];
    }
    if ([v7 invalidatedScrollInfo]) {
      [(PXTilingController *)self _invalidateScrollInfo];
    }
    int v11 = [v7 invalidatedAllTiles];
    v12 = [v7 invalidatedTileGroups];
    v13 = v12;
    if (v11 && [v12 count]) {
      goto LABEL_14;
    }
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke;
    v24[3] = &unk_1E5DBC148;
    v24[4] = &v25;
    [v7 enumerateInvalidatedTileIdentifiersUsingBlock:v24];
    if (*((unsigned char *)v26 + 24)) {
      LOBYTE(v11) = 1;
    }
    _Block_object_dispose(&v25, 8);
    if (v11)
    {
LABEL_14:
      char v14 = 1;
    }
    else
    {
      if (![v13 count])
      {
LABEL_18:

        goto LABEL_19;
      }
      char v14 = 0;
    }
    v15 = [(PXTilingController *)self _tileStates];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke_2;
    v20 = &unk_1E5DBC170;
    char v23 = v14;
    id v21 = v13;
    id v22 = v15;
    id v16 = v15;
    [v16 enumerateStatesUsingBlock:&v17];
    [(PXTilingController *)self _invalidateAllCachedRects];
    [(PXTilingController *)self _invalidateTiles];

    goto LABEL_18;
  }
LABEL_19:
}

uint64_t __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

__n128 __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 8)
    && (*(unsigned char *)(a1 + 48) || [*(id *)(a1 + 32) containsIndex:*(void *)(a3 + 272)]))
  {
    *(unsigned char *)a3 = 1;
    id v7 = *(void **)(a1 + 40);
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    [v7 setTargetIdentifier:v14 forTileStateAtIndex:a2];
    *(unsigned char *)(a3 + 280) = 1;
    long long v8 = *((_OWORD *)off_1E5DAB048 + 9);
    *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E5DAB048 + 8);
    *(_OWORD *)(a3 + 624) = v8;
    long long v9 = *((_OWORD *)off_1E5DAB048 + 11);
    *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E5DAB048 + 10);
    *(_OWORD *)(a3 + 656) = v9;
    long long v10 = *((_OWORD *)off_1E5DAB048 + 5);
    *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E5DAB048 + 4);
    *(_OWORD *)(a3 + 560) = v10;
    long long v11 = *((_OWORD *)off_1E5DAB048 + 7);
    *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E5DAB048 + 6);
    *(_OWORD *)(a3 + 592) = v11;
    long long v12 = *((_OWORD *)off_1E5DAB048 + 1);
    *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E5DAB048;
    *(_OWORD *)(a3 + 496) = v12;
    __n128 result = *((__n128 *)off_1E5DAB048 + 2);
    long long v13 = *((_OWORD *)off_1E5DAB048 + 3);
    *(__n128 *)(a3 + 512) = result;
    *(_OWORD *)(a3 + 528) = v13;
  }
  return result;
}

- (void)_updateDebugDelegateIfNeeded
{
  id v3 = [(PXTilingController *)self debugDelegate];
  if (v3)
  {
    id v4 = v3;
    [v3 tilingControllerDidUpdateDebugInfo:self];
    id v3 = v4;
  }
}

- (void)_updateScrollInfoIfNeeded
{
  if (self->_needsUpdateFlags.scrollInfo)
  {
    self->_needsUpdateFlags.scrollInfo = 0;
    id v3 = [(PXTilingController *)self targetLayout];
    if (!self->_scrollDelegateFlags.respondsToScrollInfoForLayout
      || ([(PXTilingController *)self scrollDelegate],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 tilingController:self scrollInfoForLayout:v3],
          id v6 = (id)objc_claimAutoreleasedReturnValue(),
          v4,
          (uint64_t v5 = (uint64_t)v6) == 0))
    {
      uint64_t v5 = [v3 scrollInfo];
    }
    id v7 = (id)v5;
    [(PXTilingController *)self _setScrollInfo:v5];
  }
}

- (void)_invalidateScrollInfo
{
  self->_needsUpdateFlags.scrollInfo = 1;
  [(PXTilingController *)self _setNeedsUpdate];
  id v3 = [(PXTilingController *)self observer];
  [v3 tilingController:self invalidatedWithContext:2];
}

- (void)_updateMaxPreheatPaddingIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.maxPreheatPadding)
  {
    self->_needsUpdateFlags.maxPreheatPadding = 0;
    double v4 = *(double *)off_1E5DAAF10;
    double v3 = *((double *)off_1E5DAAF10 + 1);
    double v6 = *((double *)off_1E5DAAF10 + 2);
    double v5 = *((double *)off_1E5DAAF10 + 3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = [(PXTilingController *)self _preheatRecords];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v12 padding];
          if (v6 < v13) {
            double v6 = v13;
          }
          [v12 padding];
          if (v4 < v14) {
            double v4 = v14;
          }
          [v12 padding];
          if (v3 < v15) {
            double v3 = v15;
          }
          [v12 padding];
          if (v5 < v16) {
            double v5 = v16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    -[PXTilingController _setMaxPreheatPadding:](self, "_setMaxPreheatPadding:", v4, v3, v6, v5);
  }
}

- (void)_invalidateMaxPreheatPadding
{
  self->_needsUpdateFlags.maxPreheatPadding = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_updatePreheatingIfNeeded
{
  if (self->_needsUpdateFlags.preheating)
  {
    self->_needsUpdateFlags.preheating = 0;
    [(PXTilingController *)self _activeRect];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = __Block_byref_object_copy__119986;
    long long v18 = __Block_byref_object_dispose__119987;
    id v19 = 0;
    long long v11 = [(PXTilingController *)self _preheatRecords];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__PXTilingController__updatePreheatingIfNeeded__block_invoke;
    v13[3] = &unk_1E5DBC120;
    v13[6] = v4;
    v13[7] = v6;
    v13[8] = v8;
    v13[9] = v10;
    v13[4] = self;
    v13[5] = &v14;
    [v11 enumerateObjectsUsingBlock:v13];

    if ([(id)v15[5] count])
    {
      long long v12 = [(PXTilingController *)self _preheatRecords];
      [v12 removeObjectsAtIndexes:v15[5]];

      [(PXTilingController *)self _invalidateMaxPreheatPadding];
      [(PXTilingController *)self _updateMaxPreheatPaddingIfNeeded];
    }
    _Block_object_dispose(&v14, 8);
  }
}

void __47__PXTilingController__updatePreheatingIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  [v9 preheatHandler];
  if (objc_claimAutoreleasedReturnValue())
  {
    [v9 padding];
    sub_1AB23B20C();
  }
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v5 addIndex:a3];
}

- (void)_invalidatePreheating
{
  self->_needsUpdateFlags.preheating = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_updateTilesIfNeeded
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.tiles)
  {
    self->_needsUpdateFlags.tiles = 0;
    v91 = [(PXTilingController *)self tileSource];
    if (v91)
    {
      uint64_t v4 = [(PXTilingController *)self _tileStates];
      [v4 count];
      kdebug_trace();
      uint64_t v5 = [(PXTilingController *)self targetLayout];
      v90 = [(PXTilingController *)self _coordinateSpaceIdentifier];
      v89 = [(PXTilingController *)self _coordinateSpaceConverter];
      v87 = [(PXTilingController *)self transitionDelegate];
      uint64_t v6 = [(PXTilingController *)self _currentChangeIfExists];
      uint64_t v7 = v6;
      if (v6
        && ([v6 isIdentity] & 1) == 0
        && self->_transitionDelegateFlags.respondsToTileIdentifierConverterForChange
        && ([v87 tilingController:self tileIdentifierConverterForChange:v7],
            (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke;
        v127[3] = &unk_1E5DBBF50;
        id v88 = v8;
        id v128 = v88;
        id v129 = v4;
        [v129 enumerateStatesUsingBlock:v127];
      }
      else
      {
        id v88 = 0;
      }
      [(PXTilingController *)self _cachedRect];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [(PXTilingController *)self _dirtyRect];
      CGFloat x = v133.origin.x;
      CGFloat y = v133.origin.y;
      CGFloat width = v133.size.width;
      CGFloat height = v133.size.height;
      if (!CGRectIsEmpty(v133))
      {
        uint64_t v21 = MEMORY[0x1E4F1DB20];
        -[PXTilingController _setDirtyRect:](self, "_setDirtyRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
        long long buf = 0u;
        long long v131 = 0u;
        memset(&rect, 0, sizeof(rect));
        v134.origin.CGFloat x = v10;
        v134.origin.CGFloat y = v12;
        v134.size.CGFloat width = v14;
        v134.size.CGFloat height = v16;
        v135.origin.CGFloat x = x;
        v135.origin.CGFloat y = y;
        v135.size.CGFloat width = width;
        v135.size.CGFloat height = height;
        if (!CGRectContainsRect(v134, v135)) {
          PXRectIntersectWithBasicRemainders();
        }
        *(CGFloat *)&long long buf = x;
        *((CGFloat *)&buf + 1) = y;
        *(CGFloat *)&long long v131 = width;
        *((CGFloat *)&v131 + 1) = height;
        CGSize v22 = *(CGSize *)(v21 + 16);
        rect.origin = *(CGPoint *)v21;
        rect.size = v22;
        -[PXTilingController _markRectAsCached:](self, "_markRectAsCached:", rect.origin.x, rect.origin.y, v22);
        CGFloat v24 = rect.origin.x;
        CGFloat v25 = rect.origin.y;
        CGFloat v26 = rect.size.width;
        CGFloat v27 = rect.size.height;
        if (!CGRectIsEmpty(*(CGRect *)&v24))
        {
          objc_msgSend(v89, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v90, objc_msgSend(v5, "coordinateSpaceIdentifier"), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          kdebug_trace();
          v119[0] = MEMORY[0x1E4F143A8];
          v119[1] = 3221225472;
          v119[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_2;
          v119[3] = &unk_1E5DBC008;
          id v120 = v4;
          v124 = v90;
          SEL v125 = a2;
          id v121 = v89;
          v122 = self;
          id v123 = v5;
          objc_msgSend(v123, "enumerateTilesInRect:withOptions:usingBlock:", 0, v119, v29, v31, v33, v35);
          kdebug_trace();
        }
        v36 = [v7 fromLayout];
        uint64_t v37 = [v7 toLayout];
        v38 = (void *)v37;
        if (v37) {
          v39 = (void *)v37;
        }
        else {
          v39 = v5;
        }
        id v40 = v39;

        char v41 = objc_opt_respondsToSelector();
        v42 = v88;
        if ((v41 & 1) == 0) {
          v42 = 0;
        }
        id v43 = v42;
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_4;
        v112[3] = &unk_1E5DBC030;
        id v113 = v43;
        id v114 = v36;
        id v44 = v4;
        v45 = v4;
        v46 = v7;
        v47 = a2;
        v48 = v5;
        id v49 = v44;
        id v115 = v44;
        id v117 = v40;
        v118 = v90;
        id v116 = v89;
        id v50 = v40;
        id v51 = v36;
        id v52 = v43;
        v53 = v49;
        uint64_t v5 = v48;
        a2 = v47;
        uint64_t v7 = v46;
        uint64_t v4 = v45;
        [v53 enumerateStatesUsingBlock:v112];
      }
      if (v7 && ([v7 isIdentity] & 1) == 0)
      {
        v55 = [v7 defaultAnimationOptionsForTilingController:self];
        if (v55)
        {
          v54 = [[PXTileTransitionSimpleAnimationCoordinator alloc] initWithAnimationOptions:v55];
        }
        else if (self->_transitionDelegateFlags.respondsToTransitionAnimationCoordinatorForChange)
        {
          v56 = [v7 fromLayout];
          v57 = v56;
          if (v56
            && !+[PXTilingCoordinateSpaceConverter canConvertBetweenCoordinateSpaceIdentifier:andCoordinateSpaceIdentifier:](PXTilingCoordinateSpaceConverter, "canConvertBetweenCoordinateSpaceIdentifier:andCoordinateSpaceIdentifier:", [v56 coordinateSpaceIdentifier], v90))
          {
            v54 = 0;
          }
          else
          {
            v54 = [v87 tilingController:self transitionAnimationCoordinatorForChange:v7];
          }
        }
        else
        {
          v54 = 0;
        }
      }
      else
      {
        v54 = 0;
      }
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_5;
      v110[3] = &unk_1E5DBC058;
      v58 = v54;
      v111 = v58;
      v59 = [v4 indexesOfStatesPassingTest:v110];
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_6;
      v108[3] = &unk_1E5DBBF28;
      id v60 = v4;
      id v109 = v60;
      [v60 enumerateStatesAtIndexes:v59 usingBlock:v108];
      [(PXTilingController *)self _activeRect];
      v62 = v61;
      v64 = v63;
      v66 = v65;
      v68 = v67;
      v69 = [(PXTilingController *)self tileAnimator];
      objc_initWeak((id *)&buf, self);
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_8;
      v100[3] = &unk_1E5DBC0D0;
      v107[1] = (id)a2;
      v100[4] = self;
      v70 = v58;
      v101 = v70;
      id v71 = v89;
      id v102 = v71;
      v107[2] = v90;
      v72 = v5;
      id v73 = v60;
      id v103 = v73;
      v107[3] = v62;
      v107[4] = v64;
      v107[5] = v66;
      v107[6] = v68;
      id v104 = v91;
      id v74 = v72;
      id v105 = v74;
      id v75 = v69;
      id v106 = v75;
      objc_copyWeak(v107, (id *)&buf);
      [v73 enumerateStatesUsingBlock:v100];
      objc_destroyWeak(v107);

      objc_destroyWeak((id *)&buf);
      if ([(PXTilingController *)self shouldAggressivelyEvictTileCaches])
      {
        [(PXTilingController *)self _pagedRect];
        uint64_t v77 = v76;
        uint64_t v79 = v78;
        uint64_t v81 = v80;
        uint64_t v83 = v82;
        char v84 = 1;
      }
      else
      {
        if ([v73 count] >= 2001)
        {
          [(PXTilingController *)self _pagedRect];
          PXEdgeInsetsMake();
        }
        char v84 = 0;
        uint64_t v77 = *MEMORY[0x1E4F1DB10];
        uint64_t v79 = *(void *)(MEMORY[0x1E4F1DB10] + 8);
        uint64_t v81 = *(void *)(MEMORY[0x1E4F1DB10] + 16);
        uint64_t v83 = *(void *)(MEMORY[0x1E4F1DB10] + 24);
      }
      v85 = [MEMORY[0x1E4F28E60] indexSet];
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_2_54;
      v92[3] = &unk_1E5DBC0F8;
      char v23 = v73;
      v93 = v23;
      char v99 = v84;
      uint64_t v95 = v77;
      uint64_t v96 = v79;
      uint64_t v97 = v81;
      uint64_t v98 = v83;
      id v86 = v85;
      id v94 = v86;
      [v23 enumerateStatesUsingBlock:v92];
      [(PXTilingController *)self _updatePreheatingIfNeeded];
      if ([v86 count]) {
        [v23 checkInIndexes:v86];
      }
      [v23 count];
      kdebug_trace();
    }
    else
    {
      char v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEFAULT, "Skipping update due to missing tile source %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

double __42__PXTilingController__updateTilesIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    long long v6 = *(_OWORD *)(a3 + 56);
    long long v19 = *(_OWORD *)(a3 + 40);
    long long v20 = v6;
    long long v21 = *(_OWORD *)(a3 + 72);
    uint64_t v22 = *(void *)(a3 + 88);
    long long v7 = *(_OWORD *)(a3 + 24);
    long long v17 = *(_OWORD *)(a3 + 8);
    long long v18 = v7;
    uint64_t v16 = *(void *)(a3 + 272);
    if ([*(id *)(a1 + 32) transformTileIdentifier:&v17 group:&v16])
    {
      double v9 = *(void **)(a1 + 40);
      v14[2] = v19;
      v14[3] = v20;
      v14[4] = v21;
      uint64_t v15 = v22;
      v14[0] = v17;
      v14[1] = v18;
      [v9 setTargetIdentifier:v14 forTileStateAtIndex:a2];
      long long v10 = v20;
      *(_OWORD *)(a3 + 216) = v19;
      *(_OWORD *)(a3 + 232) = v10;
      *(_OWORD *)(a3 + 248) = v21;
      uint64_t v11 = v22;
      double result = *(double *)&v17;
      long long v12 = v18;
      *(_OWORD *)(a3 + 184) = v17;
      *(_OWORD *)(a3 + 200) = v12;
      uint64_t v13 = v16;
      *(void *)(a3 + 264) = v11;
      *(void *)(a3 + 272) = v13;
    }
  }
  return result;
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_2(uint64_t a1, long long *a2, _OWORD *a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  long long v10 = *(void **)(a1 + 32);
  long long v11 = a2[3];
  long long v38 = a2[2];
  long long v39 = v11;
  long long v40 = a2[4];
  *(void *)&long long v41 = *((void *)a2 + 10);
  long long v12 = a2[1];
  long long v36 = *a2;
  long long v37 = v12;
  uint64_t v13 = [v10 indexOfStateWithTargetIdentifier:&v36];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat v14 = *(void **)(a1 + 32);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_3;
    v48[3] = &__block_descriptor_128_e401_v16__0__PXTileState_B_PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q__QB_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v__PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_BB_v_v_vQ_8l;
    long long v15 = a2[3];
    long long v51 = a2[2];
    long long v52 = v15;
    long long v53 = a2[4];
    uint64_t v16 = *((void *)a2 + 10);
    long long v17 = a2[1];
    long long v49 = *a2;
    long long v50 = v17;
    uint64_t v54 = v16;
    uint64_t v55 = a4;
    uint64_t v13 = [v14 checkOutIndexWithInitialConfiguration:v48];
  }
  uint64_t v18 = [*(id *)(a1 + 32) stateAtIndex:v13];
  long long v19 = *(void **)(a1 + 40);
  if (v19)
  {
    uint64_t v20 = *(void *)(a1 + 64);
    long long v21 = a3[9];
    v35[8] = a3[8];
    v35[9] = v21;
    long long v22 = a3[11];
    v35[10] = a3[10];
    v35[11] = v22;
    long long v23 = a3[5];
    v35[4] = a3[4];
    v35[5] = v23;
    long long v24 = a3[7];
    v35[6] = a3[6];
    v35[7] = v24;
    long long v25 = a3[1];
    v35[0] = *a3;
    v35[1] = v25;
    long long v26 = a3[3];
    v35[2] = a3[2];
    v35[3] = v26;
    [v19 convertTileGeometry:v35 toCoordinateSpaceIdentifier:v20];
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
  }
  long long v27 = v45;
  *(_OWORD *)(v18 + 608) = v44;
  *(_OWORD *)(v18 + 624) = v27;
  long long v28 = v47;
  *(_OWORD *)(v18 + 640) = v46;
  *(_OWORD *)(v18 + 656) = v28;
  long long v29 = v41;
  *(_OWORD *)(v18 + 544) = v40;
  *(_OWORD *)(v18 + 560) = v29;
  long long v30 = v43;
  *(_OWORD *)(v18 + 576) = v42;
  *(_OWORD *)(v18 + 592) = v30;
  long long v31 = v37;
  *(_OWORD *)(v18 + 480) = v36;
  *(_OWORD *)(v18 + 496) = v31;
  long long v32 = v39;
  *(_OWORD *)(v18 + 512) = v38;
  *(_OWORD *)(v18 + 528) = v32;
  *(unsigned char *)(v18 + 673) = 1;
  id v33 = v9;
  id v34 = *(id *)(v18 + 688);
  if (v34 != v33)
  {

    *(void *)(v18 + 688) = v33;
  }
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a3 + 280)) {
    return;
  }
  uint64_t v4 = (long long *)(a3 + 96);
  if (!*(void *)(a3 + 96)) {
    return;
  }
  id v6 = 0;
  uint64_t v80 = 0;
  uint64_t v7 = *(void *)off_1E5DAB050;
  if (*(void *)(a3 + 472) == *(void *)off_1E5DAB050)
  {
    long long v10 = *(_OWORD *)(a3 + 8);
    long long v11 = *(_OWORD *)(a3 + 56);
    long long v76 = *(_OWORD *)(a3 + 40);
    long long v77 = v11;
    long long v78 = *(_OWORD *)(a3 + 72);
    uint64_t v79 = *(void *)(a3 + 88);
    long long v12 = *(_OWORD *)(a3 + 24);
    long long v74 = v10;
    long long v75 = v12;
    if ((void)v10) {
      goto LABEL_7;
    }
    long long v26 = *(_OWORD *)(a3 + 144);
    long long v76 = *(_OWORD *)(a3 + 128);
    long long v77 = v26;
    long long v78 = *(_OWORD *)(a3 + 160);
    uint64_t v79 = *(void *)(a3 + 176);
    long long v27 = *(_OWORD *)(a3 + 112);
    long long v74 = *v4;
    long long v75 = v27;
    if (![*(id *)(a1 + 32) reverseTransformTileIdentifier:&v74])
    {
      id v6 = 0;
      uint64_t v79 = 0;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v74 = 0u;
      goto LABEL_4;
    }
    if ((void)v74)
    {
LABEL_7:
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v13 = *(void **)(a1 + 40);
      id v61 = 0;
      long long v51 = v76;
      long long v52 = v77;
      long long v53 = v78;
      *(void *)&long long v54 = v79;
      long long v49 = v74;
      long long v50 = v75;
      int v14 = [v13 getGeometry:&v62 group:&v80 userData:&v61 forTileWithIdentifier:&v49];
      id v6 = v61;
      if (v14)
      {
        uint64_t v15 = [*(id *)(a1 + 48) stateAtIndex:a2];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v16 = *(void **)(a1 + 56);
        if (v16)
        {
          uint64_t v17 = *(void *)(a1 + 72);
          long long v45 = v70;
          long long v46 = v71;
          long long v47 = v72;
          long long v48 = v73;
          long long v41 = v66;
          long long v42 = v67;
          long long v43 = v68;
          long long v44 = v69;
          long long v37 = v62;
          long long v38 = v63;
          long long v39 = v64;
          long long v40 = v65;
          [v16 convertTileGeometry:&v37 toCoordinateSpaceIdentifier:v17];
        }
        [*(id *)(a1 + 48) setCurrentGeometry:&v49 forTileStateAtIndex:a2];
        *(unsigned char *)(v15 + 672) = 1;
        id v18 = v6;
        id v19 = *(id *)(v15 + 680);
        if (v19 != v18)
        {

          *(void *)(v15 + 680) = v18;
        }
      }
      goto LABEL_4;
    }
    id v6 = 0;
  }
LABEL_4:
  if (*(void *)(a3 + 664) == v7)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v20 = *(void **)(a1 + 64);
    id v36 = 0;
    long long v21 = v4[3];
    long long v51 = v4[2];
    long long v52 = v21;
    long long v53 = v4[4];
    *(void *)&long long v54 = *((void *)v4 + 10);
    long long v22 = v4[1];
    long long v49 = *v4;
    long long v50 = v22;
    int v23 = [v20 getGeometry:&v62 group:&v80 userData:&v36 forTileWithIdentifier:&v49];
    id v8 = v36;

    if (v23)
    {
      long long v24 = *(void **)(a1 + 56);
      if (v24)
      {
        uint64_t v25 = *(void *)(a1 + 72);
        long long v45 = v70;
        long long v46 = v71;
        long long v47 = v72;
        long long v48 = v73;
        long long v41 = v66;
        long long v42 = v67;
        long long v43 = v68;
        long long v44 = v69;
        long long v37 = v62;
        long long v38 = v63;
        long long v39 = v64;
        long long v40 = v65;
        [v24 convertTileGeometry:&v37 toCoordinateSpaceIdentifier:v25];
      }
      else
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
      }
      long long v28 = v58;
      *(_OWORD *)(a3 + 608) = v57;
      *(_OWORD *)(a3 + 624) = v28;
      long long v29 = v60;
      *(_OWORD *)(a3 + 640) = v59;
      *(_OWORD *)(a3 + 656) = v29;
      long long v30 = v54;
      *(_OWORD *)(a3 + 544) = v53;
      *(_OWORD *)(a3 + 560) = v30;
      long long v31 = v56;
      *(_OWORD *)(a3 + 576) = v55;
      *(_OWORD *)(a3 + 592) = v31;
      long long v32 = v50;
      *(_OWORD *)(a3 + 480) = v49;
      *(_OWORD *)(a3 + 496) = v32;
      long long v33 = v52;
      *(_OWORD *)(a3 + 512) = v51;
      *(_OWORD *)(a3 + 528) = v33;
      *(unsigned char *)(a3 + 673) = 1;
      id v34 = v8;
      id v35 = *(id *)(a3 + 688);
      if (v35 != v34)
      {

        *(void *)(a3 + 688) = v34;
      }
    }
  }
  else
  {
    id v8 = v6;
  }
}

uint64_t __42__PXTilingController__updateTilesIfNeeded__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 280)
    || !*(void *)(a2 + 96)
    || *(void *)(a2 + 472) == *(void *)off_1E5DAB050
    || *(void *)(a2 + 664) == *(void *)off_1E5DAB050)
  {
    return 0;
  }
  v2 = *(void **)(a2 + 680);
  uint64_t v3 = *(void *)(a2 + 688);
  uint64_t v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a2 + 144);
  v24[2] = *(_OWORD *)(a2 + 128);
  v24[3] = v5;
  v24[4] = *(_OWORD *)(a2 + 160);
  uint64_t v25 = *(void *)(a2 + 176);
  long long v6 = *(_OWORD *)(a2 + 112);
  v24[0] = *(_OWORD *)(a2 + 96);
  v24[1] = v6;
  long long v7 = *(_OWORD *)(a2 + 432);
  v23[8] = *(_OWORD *)(a2 + 416);
  v23[9] = v7;
  long long v8 = *(_OWORD *)(a2 + 464);
  v23[10] = *(_OWORD *)(a2 + 448);
  v23[11] = v8;
  long long v9 = *(_OWORD *)(a2 + 368);
  v23[4] = *(_OWORD *)(a2 + 352);
  v23[5] = v9;
  long long v10 = *(_OWORD *)(a2 + 400);
  v23[6] = *(_OWORD *)(a2 + 384);
  v23[7] = v10;
  long long v11 = *(_OWORD *)(a2 + 304);
  v23[0] = *(_OWORD *)(a2 + 288);
  v23[1] = v11;
  long long v12 = *(_OWORD *)(a2 + 336);
  v23[2] = *(_OWORD *)(a2 + 320);
  v23[3] = v12;
  long long v13 = *(_OWORD *)(a2 + 624);
  v22[8] = *(_OWORD *)(a2 + 608);
  v22[9] = v13;
  long long v14 = *(_OWORD *)(a2 + 656);
  v22[10] = *(_OWORD *)(a2 + 640);
  v22[11] = v14;
  long long v15 = *(_OWORD *)(a2 + 560);
  v22[4] = *(_OWORD *)(a2 + 544);
  v22[5] = v15;
  long long v16 = *(_OWORD *)(a2 + 592);
  v22[6] = *(_OWORD *)(a2 + 576);
  v22[7] = v16;
  long long v17 = *(_OWORD *)(a2 + 496);
  v22[0] = *(_OWORD *)(a2 + 480);
  v22[1] = v17;
  long long v18 = *(_OWORD *)(a2 + 528);
  v22[2] = *(_OWORD *)(a2 + 512);
  v22[3] = v18;
  id v19 = v2;
  uint64_t v20 = [v4 useDoubleSidedAnimationForUpdatedTileWithIdentifier:v24 fromGeometry:v23 fromUserData:v19 toGeometry:v22 toUserData:v3];

  return v20;
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = *(_OWORD *)(a3 + 144);
  long long v30 = *(_OWORD *)(a3 + 128);
  long long v31 = v5;
  long long v32 = *(_OWORD *)(a3 + 160);
  uint64_t v33 = *(void *)(a3 + 176);
  long long v6 = *(_OWORD *)(a3 + 112);
  long long v28 = *(_OWORD *)(a3 + 96);
  long long v29 = v6;
  uint64_t v7 = *(void *)(a3 + 272);
  long long v8 = *(_OWORD *)(a3 + 608);
  long long v9 = *(_OWORD *)(a3 + 624);
  long long v10 = *(_OWORD *)(a3 + 656);
  long long v45 = *(_OWORD *)(a3 + 640);
  long long v46 = v10;
  long long v43 = v8;
  long long v44 = v9;
  long long v11 = *(_OWORD *)(a3 + 480);
  long long v12 = *(_OWORD *)(a3 + 496);
  long long v13 = *(_OWORD *)(a3 + 512);
  long long v38 = *(_OWORD *)(a3 + 528);
  long long v37 = v13;
  long long v36 = v12;
  long long v35 = v11;
  long long v14 = *(_OWORD *)(a3 + 544);
  long long v15 = *(_OWORD *)(a3 + 560);
  long long v16 = *(_OWORD *)(a3 + 576);
  long long v42 = *(_OWORD *)(a3 + 592);
  long long v41 = v16;
  long long v40 = v15;
  long long v39 = v14;
  id v17 = *(id *)(a3 + 688);
  long long v18 = *((_OWORD *)off_1E5DAB048 + 9);
  *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E5DAB048 + 8);
  *(_OWORD *)(a3 + 624) = v18;
  long long v19 = *((_OWORD *)off_1E5DAB048 + 11);
  *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E5DAB048 + 10);
  *(_OWORD *)(a3 + 656) = v19;
  long long v20 = *((_OWORD *)off_1E5DAB048 + 5);
  *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E5DAB048 + 4);
  *(_OWORD *)(a3 + 560) = v20;
  long long v21 = *((_OWORD *)off_1E5DAB048 + 7);
  *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E5DAB048 + 6);
  *(_OWORD *)(a3 + 592) = v21;
  long long v22 = *((_OWORD *)off_1E5DAB048 + 1);
  *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E5DAB048;
  *(_OWORD *)(a3 + 496) = v22;
  long long v23 = *((_OWORD *)off_1E5DAB048 + 3);
  *(_OWORD *)(a3 + 512) = *((_OWORD *)off_1E5DAB048 + 2);
  *(_OWORD *)(a3 + 528) = v23;
  *(unsigned char *)(a3 + 673) = 0;
  long long v24 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_7;
  v26[3] = &unk_1E5DBC080;
  uint64_t v34 = v7;
  id v27 = v17;
  id v25 = v17;
  [v24 checkOutIndexWithInitialConfiguration:v26];
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)&v161.tCGFloat x = *(_OWORD *)(a3 + 128);
  long long v162 = v5;
  long long v163 = *(_OWORD *)(a3 + 160);
  CGFloat v164 = *(double *)(a3 + 176);
  long long v6 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v161.a = *(_OWORD *)(a3 + 96);
  *(_OWORD *)&v161.c = v6;
  uint64_t v7 = *(void *)(a3 + 696);
  long long v8 = *(_OWORD *)(a3 + 432);
  long long v157 = *(_OWORD *)(a3 + 416);
  long long v158 = v8;
  long long v9 = *(_OWORD *)(a3 + 464);
  long long v159 = *(_OWORD *)(a3 + 448);
  long long v160 = v9;
  long long v10 = *(_OWORD *)(a3 + 368);
  *(_OWORD *)&v155.a = *(_OWORD *)(a3 + 352);
  *(_OWORD *)&v155.c = v10;
  long long v11 = *(_OWORD *)(a3 + 400);
  *(_OWORD *)&v155.tCGFloat x = *(_OWORD *)(a3 + 384);
  long long v156 = v11;
  CGSize v12 = *(CGSize *)(a3 + 304);
  rect1.origin = *(CGPoint *)(a3 + 288);
  rect1.CGSize size = v12;
  long long v13 = *(_OWORD *)(a3 + 336);
  long long v153 = *(_OWORD *)(a3 + 320);
  long long v154 = v13;
  id v14 = *(id *)(a3 + 680);
  long long v15 = *(_OWORD *)(v3 + 624);
  long long v148 = *(_OWORD *)(v3 + 608);
  long long v149 = v15;
  long long v16 = *(_OWORD *)(v3 + 656);
  long long v150 = *(_OWORD *)(v3 + 640);
  long long v151 = v16;
  long long v17 = *(_OWORD *)(v3 + 560);
  *(_OWORD *)&v146.a = *(_OWORD *)(v3 + 544);
  *(_OWORD *)&v146.c = v17;
  long long v18 = *(_OWORD *)(v3 + 592);
  *(_OWORD *)&v146.tCGFloat x = *(_OWORD *)(v3 + 576);
  long long v147 = v18;
  CGSize v19 = *(CGSize *)(v3 + 496);
  rect2.origin = *(CGPoint *)(v3 + 480);
  rect2.CGSize size = v19;
  long long v20 = *(_OWORD *)(v3 + 528);
  long long v144 = *(_OWORD *)(v3 + 512);
  long long v145 = v20;
  int v21 = *(unsigned __int8 *)(v3 + 673);
  id v22 = *(id *)(v3 + 688);
  id v23 = v22;
  if (*(unsigned char *)(v3 + 280))
  {
    if (*((void *)&v160 + 1) == *(void *)off_1E5DAB050)
    {
      long long v28 = *(void **)(a1 + 40);
      id v142 = 0;
      CGAffineTransform t2 = v161;
      long long v135 = v162;
      *(_OWORD *)&v136.a = v163;
      v136.c = v164;
      long long v169 = v148;
      long long v170 = v149;
      long long v171 = v150;
      long long v172 = v151;
      CGAffineTransform v167 = v146;
      long long v168 = v147;
      *(CGPoint *)&t1.a = rect2.origin;
      *(CGSize *)&t1.c = rect2.size;
      *(_OWORD *)&t1.tCGFloat x = v144;
      long long v166 = v145;
      int v26 = [v28 getInitialGeometry:&rect1 initialUserData:&v142 forAppearingTileWithIdentifier:&t2 toGeometry:&t1 toUserData:v23];
      id v29 = v142;

      if (v26)
      {
        id v14 = v29;
      }
      else
      {
        long long v157 = v148;
        long long v158 = v149;
        long long v159 = v150;
        long long v160 = v151;
        CGAffineTransform v155 = v146;
        long long v156 = v147;
        CGRect rect1 = rect2;
        long long v153 = v144;
        long long v154 = v145;
        id v14 = v23;
      }
      long long v40 = *(void **)(a1 + 48);
      if (v40)
      {
        uint64_t v41 = *(void *)(a1 + 104);
        long long v138 = v157;
        long long v139 = v158;
        long long v140 = v159;
        long long v141 = v160;
        CGAffineTransform v136 = v155;
        long long v137 = v156;
        *(CGPoint *)&t2.a = rect1.origin;
        *(CGSize *)&t2.c = rect1.size;
        *(_OWORD *)&t2.tCGFloat x = v153;
        long long v135 = v154;
        [v40 convertTileGeometry:&t2 toCoordinateSpaceIdentifier:v41];
      }
      else
      {
        long long v172 = 0u;
        long long v171 = 0u;
        long long v170 = 0u;
        long long v169 = 0u;
        long long v168 = 0u;
        memset(&v167, 0, sizeof(v167));
        long long v166 = 0u;
        memset(&t1, 0, sizeof(t1));
      }
      int v25 = 0;
      long long v157 = v169;
      long long v158 = v170;
      long long v159 = v171;
      long long v160 = v172;
      CGAffineTransform v155 = v167;
      long long v156 = v168;
      rect1.origin = *(CGPoint *)&t1.a;
      rect1.CGSize size = *(CGSize *)&t1.c;
      BOOL v24 = v21 != 0;
      uint64_t v27 = 1;
      long long v153 = *(_OWORD *)&t1.tx;
      long long v154 = v166;
    }
    else
    {
      BOOL v24 = v21 != 0;
      if (*((void *)&v151 + 1) == *(void *)off_1E5DAB050)
      {
        if (*(void *)(v3 + 96))
        {
          long long v30 = *(void **)(a1 + 56);
          memset(&v167, 0, 24);
          long long v166 = 0u;
          memset(&t1, 0, sizeof(t1));
          [v30 setTargetIdentifier:&t1 forTileStateAtIndex:a2];
        }
        long long v31 = *(_OWORD *)(v3 + 232);
        *(_OWORD *)&v161.tCGFloat x = *(_OWORD *)(v3 + 216);
        long long v162 = v31;
        long long v163 = *(_OWORD *)(v3 + 248);
        CGFloat v164 = *(double *)(v3 + 264);
        long long v32 = *(_OWORD *)(v3 + 200);
        *(_OWORD *)&v161.a = *(_OWORD *)(v3 + 184);
        *(_OWORD *)&v161.c = v32;
        uint64_t v33 = *(void **)(a1 + 40);
        id v133 = 0;
        long long v34 = *(_OWORD *)(v3 + 232);
        *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(v3 + 216);
        long long v135 = v34;
        *(_OWORD *)&v136.a = *(_OWORD *)(v3 + 248);
        v136.c = *(CGFloat *)(v3 + 264);
        long long v35 = *(_OWORD *)(v3 + 200);
        *(_OWORD *)&t2.a = *(_OWORD *)(v3 + 184);
        *(_OWORD *)&t2.c = v35;
        long long v169 = v157;
        long long v170 = v158;
        long long v171 = v159;
        long long v172 = v160;
        CGAffineTransform v167 = v155;
        long long v168 = v156;
        *(CGPoint *)&t1.a = rect1.origin;
        *(CGSize *)&t1.c = rect1.size;
        *(_OWORD *)&t1.tCGFloat x = v153;
        long long v166 = v154;
        char v36 = [v33 getFinalGeometry:&rect2 finalUserData:&v133 forDisappearingTileWithIdentifier:&t2 fromGeometry:&t1 fromUserData:v14];
        id v37 = v133;

        if (v36)
        {
          long long v38 = *(void **)(a1 + 48);
          if (v38)
          {
            uint64_t v39 = *(void *)(a1 + 104);
            long long v138 = v148;
            long long v139 = v149;
            long long v140 = v150;
            long long v141 = v151;
            CGAffineTransform v136 = v146;
            long long v137 = v147;
            *(CGPoint *)&t2.a = rect2.origin;
            *(CGSize *)&t2.c = rect2.size;
            *(_OWORD *)&t2.tCGFloat x = v144;
            long long v135 = v145;
            [v38 convertTileGeometry:&t2 toCoordinateSpaceIdentifier:v39];
          }
          else
          {
            long long v172 = 0u;
            long long v171 = 0u;
            long long v170 = 0u;
            long long v169 = 0u;
            long long v168 = 0u;
            memset(&v167, 0, sizeof(v167));
            long long v166 = 0u;
            memset(&t1, 0, sizeof(t1));
          }
          int v25 = 0;
          int v26 = 0;
          BOOL v24 = 0;
          long long v148 = v169;
          long long v149 = v170;
          long long v150 = v171;
          long long v151 = v172;
          CGAffineTransform v146 = v167;
          long long v147 = v168;
          rect2.origin = *(CGPoint *)&t1.a;
          rect2.CGSize size = *(CGSize *)&t1.c;
          uint64_t v27 = 3;
          id v23 = v37;
          long long v144 = *(_OWORD *)&t1.tx;
          long long v145 = v166;
        }
        else
        {
          long long v42 = *((_OWORD *)off_1E5DAB048 + 9);
          long long v148 = *((_OWORD *)off_1E5DAB048 + 8);
          long long v149 = v42;
          long long v43 = *((_OWORD *)off_1E5DAB048 + 11);
          long long v150 = *((_OWORD *)off_1E5DAB048 + 10);
          long long v151 = v43;
          long long v44 = *((_OWORD *)off_1E5DAB048 + 5);
          *(_OWORD *)&v146.a = *((_OWORD *)off_1E5DAB048 + 4);
          *(_OWORD *)&v146.c = v44;
          long long v45 = *((_OWORD *)off_1E5DAB048 + 7);
          *(_OWORD *)&v146.tCGFloat x = *((_OWORD *)off_1E5DAB048 + 6);
          long long v147 = v45;
          CGSize v46 = (CGSize)*((_OWORD *)off_1E5DAB048 + 1);
          rect2.origin = *(CGPoint *)off_1E5DAB048;
          rect2.CGSize size = v46;
          long long v47 = *((_OWORD *)off_1E5DAB048 + 3);
          long long v144 = *((_OWORD *)off_1E5DAB048 + 2);
          long long v145 = v47;

          id v23 = 0;
          int v25 = 0;
          int v26 = 0;
          BOOL v24 = 0;
          uint64_t v27 = 3;
        }
      }
      else
      {
        int v25 = 0;
        int v26 = 0;
        uint64_t v27 = 2;
      }
    }
  }
  else
  {
    BOOL v24 = v21 != 0;
    if (v14 == v22)
    {
      uint64_t v27 = 0;
      int v26 = 0;
      int v25 = 1;
      id v23 = v14;
    }
    else
    {
      int v25 = [v14 isEqual:v22];
      int v26 = 0;
      uint64_t v27 = 2;
      if (v25) {
        uint64_t v27 = 0;
      }
    }
  }
  uint64_t v48 = *((void *)&v151 + 1);
  uint64_t v49 = *(void *)off_1E5DAB050;
  if (*((void *)&v151 + 1) == *(void *)off_1E5DAB050) {
    goto LABEL_43;
  }
  int v105 = v25;
  BOOL v107 = v24;
  uint64_t v106 = v27;
  if (v7)
  {
LABEL_27:
    long long v50 = v153;
    long long v51 = v154;
    CGAffineTransform v111 = v155;
    long long v52 = v156;
    int v53 = v157;
    double v104 = *((double *)&v157 + 1);
    double v102 = *(double *)&v158;
    CGFloat v99 = *(double *)&v159;
    CGFloat v100 = *((double *)&v158 + 1);
    CGFloat v97 = *(double *)&v160;
    CGFloat v98 = *((double *)&v159 + 1);
    uint64_t v54 = *((void *)&v160 + 1);
    long long v55 = v144;
    long long v56 = v145;
    CGAffineTransform v115 = v146;
    long long v57 = v147;
    int v58 = v148;
    double v103 = *((double *)&v148 + 1);
    double v101 = *(double *)&v149;
    CGFloat v95 = *(double *)&v150;
    CGFloat v96 = *((double *)&v149 + 1);
    CGFloat v93 = *(double *)&v151;
    CGFloat v94 = *((double *)&v150 + 1);
    if (!CGRectEqualToRect(rect1, rect2)) {
      goto LABEL_40;
    }
    if (*(double *)&v50 != *(double *)&v55) {
      goto LABEL_40;
    }
    if (*((double *)&v50 + 1) != *((double *)&v55 + 1)) {
      goto LABEL_40;
    }
    if (*(double *)&v51 != *(double *)&v56) {
      goto LABEL_40;
    }
    if (*((double *)&v51 + 1) != *((double *)&v56 + 1)) {
      goto LABEL_40;
    }
    CGAffineTransform t1 = v111;
    CGAffineTransform t2 = v115;
    if (!CGAffineTransformEqualToTransform(&t1, &t2)) {
      goto LABEL_40;
    }
    if (*((double *)&v52 + 1) != *((double *)&v57 + 1)) {
      goto LABEL_40;
    }
    if (v53 != v58) {
      goto LABEL_40;
    }
    if (*(double *)&v52 != *(double *)&v57) {
      goto LABEL_40;
    }
    if (v104 != v103) {
      goto LABEL_40;
    }
    if (v102 != v101) {
      goto LABEL_40;
    }
    v174.origin.CGFloat y = v99;
    v174.origin.CGFloat x = v100;
    v174.size.CGFloat height = v97;
    v174.size.CGFloat width = v98;
    v175.origin.CGFloat y = v95;
    v175.origin.CGFloat x = v96;
    v175.size.CGFloat height = v93;
    v175.size.CGFloat width = v94;
    if (!CGRectEqualToRect(v174, v175) || v54 != v48 || v14 != v23 && ([v14 isEqual:v23] & 1) == 0)
    {
LABEL_40:
      if (v105)
      {
        id v86 = PLUIGetLog();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          CGAffineTransform t1 = v161;
          long long v166 = v162;
          *(_OWORD *)&v167.a = v163;
          v167.c = v164;
          PXTileIdentifierDescription((unint64_t *)&t1);
          objc_claimAutoreleasedReturnValue();
          long long v87 = *(_OWORD *)(v3 + 432);
          long long v169 = *(_OWORD *)(v3 + 416);
          long long v170 = v87;
          long long v88 = *(_OWORD *)(v3 + 464);
          long long v171 = *(_OWORD *)(v3 + 448);
          long long v172 = v88;
          long long v89 = *(_OWORD *)(v3 + 368);
          *(_OWORD *)&v167.a = *(_OWORD *)(v3 + 352);
          *(_OWORD *)&v167.c = v89;
          long long v90 = *(_OWORD *)(v3 + 400);
          *(_OWORD *)&v167.tCGFloat x = *(_OWORD *)(v3 + 384);
          long long v168 = v90;
          long long v91 = *(_OWORD *)(v3 + 304);
          *(_OWORD *)&t1.a = *(_OWORD *)(v3 + 288);
          *(_OWORD *)&t1.c = v91;
          long long v92 = *(_OWORD *)(v3 + 336);
          *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(v3 + 320);
          long long v166 = v92;
          PXTileGeometryDescription();
        }

        uint64_t v106 = 2;
      }
      long long v59 = *(void **)(a1 + 40);
      CGAffineTransform v111 = v161;
      long long v112 = v162;
      long long v113 = v163;
      CGFloat v114 = v164;
      long long v169 = v157;
      long long v170 = v158;
      long long v171 = v159;
      long long v172 = v160;
      CGAffineTransform v167 = v155;
      long long v168 = v156;
      *(CGPoint *)&t1.a = rect1.origin;
      *(CGSize *)&t1.c = rect1.size;
      *(_OWORD *)&t1.tCGFloat x = v153;
      long long v166 = v154;
      long long v138 = v148;
      long long v139 = v149;
      long long v140 = v150;
      long long v141 = v151;
      CGAffineTransform v136 = v146;
      long long v137 = v147;
      *(CGPoint *)&t2.a = rect2.origin;
      *(CGSize *)&t2.c = rect2.size;
      *(_OWORD *)&t2.tCGFloat x = v144;
      long long v135 = v145;
      long long v60 = objc_msgSend(v59, "optionsForAnimatingTileWithIdentifier:animationType:fromGeometry:fromUserData:toGeometry:toUserData:", &v111, v106, &t1, v14, &t2, v23, *(void *)&v93, *(void *)&v94, *(void *)&v95, *(void *)&v96, *(void *)&v97, *(void *)&v98, *(void *)&v99, *(void *)&v100);
      ++*(void *)(v3 + 704);
      id v61 = *(void **)(a1 + 80);
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_52;
      v109[3] = &unk_1E5DD0260;
      objc_copyWeak(v110, (id *)(a1 + 88));
      v110[1] = a2;
      long long v169 = v148;
      long long v170 = v149;
      long long v171 = v150;
      long long v172 = v151;
      CGAffineTransform v167 = v146;
      long long v168 = v147;
      *(CGPoint *)&t1.a = rect2.origin;
      *(CGSize *)&t1.c = rect2.size;
      *(_OWORD *)&t1.tCGFloat x = v144;
      long long v166 = v145;
      [v61 animateTile:v7 toGeometry:&t1 userData:v23 withOptions:v60 completionHandler:v109];
      objc_destroyWeak(v110);
    }
    goto LABEL_42;
  }
  if (*((void *)&v160 + 1) != v49)
  {
    if (CGRectIntersectsRect(rect1, *(CGRect *)(a1 + 112))) {
      goto LABEL_55;
    }
    uint64_t v48 = *((void *)&v151 + 1);
  }
  if (v48 == v49)
  {
    uint64_t v7 = 0;
    goto LABEL_43;
  }
  if (!CGRectIntersectsRect(rect2, *(CGRect *)(a1 + 112)))
  {
    uint64_t v7 = 0;
LABEL_42:
    BOOL v24 = v107;
    goto LABEL_43;
  }
LABEL_55:
  if (v26)
  {
    t2.a = 0.0;
    *(void *)&t2.b = &t2;
    *(void *)&t2.c = 0x2020000000;
    t2.d = NAN;
    v111.a = 0.0;
    *(void *)&v111.b = &v111;
    *(_OWORD *)&v111.c = 0x2020000000uLL;
    long long v70 = *(void **)(a1 + 56);
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_9;
    v116[3] = &unk_1E5DBC0A8;
    CGAffineTransform v120 = v161;
    CGFloat v123 = v164;
    long long v122 = v163;
    long long v121 = v162;
    long long v125 = v153;
    long long v126 = v154;
    CGRect v124 = rect1;
    CGAffineTransform v127 = v155;
    long long v128 = v156;
    long long v131 = v159;
    long long v132 = v160;
    long long v129 = v157;
    long long v130 = v158;
    id v117 = v14;
    p_CGAffineTransform t2 = &t2;
    v119 = &v111;
    [v70 enumerateStatesUsingBlock:v116];
    if (*(void *)(*(void *)&v111.b + 24))
    {
      long long v71 = *(void **)(a1 + 56);
      memset(&v167, 0, 24);
      long long v166 = 0u;
      memset(&t1, 0, sizeof(t1));
      [v71 setTargetIdentifier:&t1 forTileStateAtIndex:a2];
      uint64_t v3 = *(void *)(*(void *)&v111.b + 24);
      long long v72 = *(void **)(*(void *)&t2.b + 24);
      uint64_t v7 = *(void *)(v3 + 696);
      long long v73 = *(void **)(a1 + 56);
      CGAffineTransform t1 = v161;
      long long v166 = v162;
      *(_OWORD *)&v167.a = v163;
      v167.c = v164;
      a2 = v72;
      objc_msgSend(v73, "setTargetIdentifier:forTileStateAtIndex:", &t1);
      long long v74 = *(_OWORD *)&v161.c;
      *(_OWORD *)(v3 + 184) = *(_OWORD *)&v161.a;
      long long v75 = v162;
      *(_OWORD *)(v3 + 216) = *(_OWORD *)&v161.tx;
      *(_OWORD *)(v3 + 232) = v75;
      *(_OWORD *)(v3 + 248) = v163;
      *(CGFloat *)(v3 + 264) = v164;
      *(_OWORD *)(v3 + 200) = v74;
      long long v76 = v147;
      *(_OWORD *)(v3 + 576) = *(_OWORD *)&v146.tx;
      *(_OWORD *)(v3 + 592) = v76;
      long long v77 = *(_OWORD *)&v146.c;
      *(_OWORD *)(v3 + 544) = *(_OWORD *)&v146.a;
      *(_OWORD *)(v3 + 560) = v77;
      long long v78 = v145;
      *(_OWORD *)(v3 + 512) = v144;
      *(_OWORD *)(v3 + 528) = v78;
      CGSize size = rect2.size;
      *(CGPoint *)(v3 + 480) = rect2.origin;
      *(CGSize *)(v3 + 496) = size;
      long long v80 = v149;
      *(_OWORD *)(v3 + 608) = v148;
      *(_OWORD *)(v3 + 624) = v80;
      long long v81 = v151;
      *(_OWORD *)(v3 + 640) = v150;
      *(_OWORD *)(v3 + 656) = v81;
    }
    else
    {
      uint64_t v7 = 0;
    }

    _Block_object_dispose(&v111, 8);
    _Block_object_dispose(&t2, 8);
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v82 = !v24;
  if (v7) {
    char v82 = 1;
  }
  if ((v82 & 1) == 0)
  {
    uint64_t v83 = *(void **)(a1 + 64);
    uint64_t v84 = *(void *)(a1 + 72);
    CGAffineTransform t1 = v161;
    long long v166 = v162;
    *(_OWORD *)&v167.a = v163;
    v167.c = v164;
    uint64_t v7 = [v83 checkOutTileForIdentifier:&t1 layout:v84];
    v85 = *(void **)(a1 + 80);
    long long v169 = v157;
    long long v170 = v158;
    long long v171 = v159;
    long long v172 = v160;
    CGAffineTransform v167 = v155;
    long long v168 = v156;
    *(CGPoint *)&t1.a = rect1.origin;
    *(CGSize *)&t1.c = rect1.size;
    *(_OWORD *)&t1.tCGFloat x = v153;
    long long v166 = v154;
    [v85 prepareTile:v7 withGeometry:&t1 userData:v14];
    *(void *)(v3 + 696) = v7;
  }
  if (v7)
  {
    uint64_t v48 = *((void *)&v151 + 1);
    goto LABEL_27;
  }
LABEL_43:
  long long v62 = v149;
  *(_OWORD *)(v3 + 608) = v148;
  *(_OWORD *)(v3 + 624) = v62;
  long long v63 = v151;
  *(_OWORD *)(v3 + 640) = v150;
  *(_OWORD *)(v3 + 656) = v63;
  long long v64 = *(_OWORD *)&v146.c;
  *(_OWORD *)(v3 + 544) = *(_OWORD *)&v146.a;
  *(_OWORD *)(v3 + 560) = v64;
  long long v65 = v147;
  *(_OWORD *)(v3 + 576) = *(_OWORD *)&v146.tx;
  *(_OWORD *)(v3 + 592) = v65;
  CGSize v66 = rect2.size;
  *(CGPoint *)(v3 + 480) = rect2.origin;
  *(CGSize *)(v3 + 496) = v66;
  long long v67 = v145;
  *(_OWORD *)(v3 + 512) = v144;
  *(_OWORD *)(v3 + 528) = v67;
  *(unsigned char *)(v3 + 673) = v24;
  if (!*(void *)(v3 + 704)
    && v7
    && (*(void *)(v3 + 664) == v49
     || !CGRectIntersectsRect(*(CGRect *)(v3 + 480), *(CGRect *)(a1 + 112))
     || !*(unsigned char *)(v3 + 673)))
  {
    long long v68 = *(_OWORD *)(v3 + 232);
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(v3 + 216);
    long long v166 = v68;
    *(_OWORD *)&v167.a = *(_OWORD *)(v3 + 248);
    v167.c = *(CGFloat *)(v3 + 264);
    long long v69 = *(_OWORD *)(v3 + 200);
    *(_OWORD *)&t1.a = *(_OWORD *)(v3 + 184);
    *(_OWORD *)&t1.c = v69;
    objc_msgSend(*(id *)(a1 + 64), "checkInTile:withIdentifier:", v7, &t1, *(void *)&v93, *(void *)&v94, *(void *)&v95, *(void *)&v96, *(void *)&v97, *(void *)&v98, *(void *)&v99, *(void *)&v100);
    *(void *)(v3 + 696) = 0;
  }
}

uint64_t __42__PXTilingController__updateTilesIfNeeded__block_invoke_2_54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(a3 + 40) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a3 + 56) = v6;
  *(_OWORD *)(a3 + 72) = *(_OWORD *)(a3 + 160);
  long long v7 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a3 + 96);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 88) = *(void *)(a3 + 176);
  *(_OWORD *)(a3 + 24) = v7;
  *(unsigned char *)(a3 + 280) = 0;
  *(unsigned char *)(a3 + 672) = *(unsigned char *)(a3 + 673);
  id v8 = *(id *)(a3 + 688);
  id v9 = *(id *)(a3 + 680);
  if (v9 != v8)
  {

    *(void *)(a3 + 680) = v8;
  }

  uint64_t result = [*(id *)(a1 + 32) setCurrentGeometry:a3 + 480 forTileStateAtIndex:a2];
  if (!*(void *)(a3 + 8) && !*(void *)(a3 + 696)
    || *(unsigned char *)(a1 + 80)
    && (uint64_t result = CGRectIntersectsRect(*(CGRect *)(a3 + 288), *(CGRect *)(a1 + 48)), (result & 1) == 0)
    && !*(void *)(a3 + 696))
  {
    long long v11 = *(void **)(a3 + 688);
    if (v11)
    {

      *(void *)(a3 + 688) = 0;
    }
    CGSize v12 = *(void **)(a1 + 40);
    return [v12 addIndex:a2];
  }
  return result;
}

uint64_t __42__PXTilingController__updateTilesIfNeeded__block_invoke_9(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(a3 + 696) && !*(void *)(a3 + 96))
  {
    long long v7 = (void *)result;
    long long v8 = *(_OWORD *)(a3 + 232);
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a3 + 216);
    long long v51 = v8;
    long long v52 = *(_OWORD *)(a3 + 248);
    uint64_t v53 = *(void *)(a3 + 264);
    long long v9 = *(_OWORD *)(a3 + 200);
    *(_OWORD *)&t1.a = *(_OWORD *)(a3 + 184);
    *(_OWORD *)&t1.c = v9;
    long long v10 = *(_OWORD *)(result + 104);
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(result + 88);
    long long v47 = v10;
    long long v48 = *(_OWORD *)(result + 120);
    uint64_t v49 = *(void *)(result + 136);
    long long v11 = *(_OWORD *)(result + 72);
    *(_OWORD *)&t2.a = *(_OWORD *)(result + 56);
    *(_OWORD *)&t2.c = v11;
    BOOL v12 = *(void *)&t1.a == *(void *)&t2.a;
    if (*(void *)&t1.a && *(void *)&t1.a == *(void *)&t2.a)
    {
      unint64_t v13 = 1;
      do
      {
        uint64_t v14 = *((void *)&t1.a + v13);
        uint64_t v15 = *((void *)&t2.a + v13);
        BOOL v12 = v14 == v15;
        if (v13 >= *(void *)&t1.a) {
          break;
        }
        ++v13;
      }
      while (v14 == v15);
    }
    if (v12)
    {
      double v16 = *(double *)(a3 + 512);
      double v17 = *(double *)(a3 + 520);
      double v18 = *(double *)(a3 + 528);
      double v19 = *(double *)(a3 + 536);
      *(_OWORD *)&v45.a = *(_OWORD *)(a3 + 544);
      *(_OWORD *)&v45.c = *(_OWORD *)(a3 + 560);
      *(_OWORD *)&v45.tCGFloat x = *(_OWORD *)(a3 + 576);
      double v41 = *(double *)(a3 + 592);
      double v43 = *(double *)(a3 + 600);
      int v20 = *(unsigned __int8 *)(a3 + 608);
      double v39 = *(double *)(a3 + 616);
      double v37 = *(double *)(a3 + 624);
      CGFloat v34 = *(double *)(a3 + 640);
      CGFloat v35 = *(double *)(a3 + 632);
      CGFloat v32 = *(double *)(a3 + 656);
      CGFloat v33 = *(double *)(a3 + 648);
      uint64_t v21 = *(void *)(a3 + 664);
      double v23 = *(double *)(result + 176);
      double v22 = *(double *)(result + 184);
      double v25 = *(double *)(result + 192);
      double v24 = *(double *)(result + 200);
      *(_OWORD *)&v44.a = *(_OWORD *)(result + 208);
      *(_OWORD *)&v44.c = *(_OWORD *)(result + 224);
      *(_OWORD *)&v44.tCGFloat x = *(_OWORD *)(result + 240);
      double v40 = *(double *)(result + 256);
      double v42 = *(double *)(result + 264);
      int v26 = *(unsigned __int8 *)(result + 272);
      double v38 = *(double *)(result + 280);
      double v36 = *(double *)(result + 288);
      CGFloat v30 = *(double *)(result + 304);
      CGFloat v31 = *(double *)(result + 296);
      CGFloat v28 = *(double *)(result + 320);
      CGFloat v29 = *(double *)(result + 312);
      uint64_t v27 = *(void *)(result + 328);
      uint64_t result = CGRectEqualToRect(*(CGRect *)(a3 + 480), *(CGRect *)(result + 144));
      if (result)
      {
        if (v16 == v23 && v17 == v22 && v18 == v25 && v19 == v24)
        {
          CGAffineTransform t1 = v45;
          CGAffineTransform t2 = v44;
          uint64_t result = CGAffineTransformEqualToTransform(&t1, &t2);
          if (result)
          {
            if (v43 == v42 && v20 == v26 && v41 == v40 && v39 == v38 && v37 == v36)
            {
              v54.origin.CGFloat y = v34;
              v54.origin.CGFloat x = v35;
              v54.size.CGFloat height = v32;
              v54.size.CGFloat width = v33;
              v55.origin.CGFloat y = v30;
              v55.origin.CGFloat x = v31;
              v55.size.CGFloat height = v28;
              v55.size.CGFloat width = v29;
              uint64_t result = CGRectEqualToRect(v54, v55);
              if ((result & 1) != 0 && v21 == v27)
              {
                uint64_t result = *(void *)(a3 + 688);
                if (result == v7[4] || (uint64_t result = objc_msgSend((id)result, "isEqual:"), result))
                {
                  *(void *)(*(void *)(v7[5] + 8) + 24) = a2;
                  *(void *)(*(void *)(v7[6] + 8) + 24) = a3;
                  *a4 = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTileAnimationCompletionWithIndex:*(void *)(a1 + 40)];
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_7(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a2 = 0;
  long long v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 200) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 184) = v4;
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 104);
  *(void *)(a2 + 264) = *(void *)(a1 + 120);
  *(_OWORD *)(a2 + 248) = v7;
  *(_OWORD *)(a2 + 232) = v6;
  *(_OWORD *)(a2 + 216) = v5;
  memmove((void *)(a2 + 96), (const void *)(a1 + 40), 0x58uLL);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a2 + 56) = v8;
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a2 + 160);
  *(void *)(a2 + 88) = *(void *)(a2 + 176);
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a2 + 24) = v9;
  *(void *)(a2 + 272) = *(void *)(a1 + 128);
  *(unsigned char *)(a2 + 280) = 1;
  long long v10 = *((_OWORD *)off_1E5DAB048 + 9);
  *(_OWORD *)(a2 + 416) = *((_OWORD *)off_1E5DAB048 + 8);
  *(_OWORD *)(a2 + 432) = v10;
  long long v11 = *((_OWORD *)off_1E5DAB048 + 11);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)off_1E5DAB048 + 10);
  *(_OWORD *)(a2 + 464) = v11;
  long long v12 = *((_OWORD *)off_1E5DAB048 + 5);
  *(_OWORD *)(a2 + 352) = *((_OWORD *)off_1E5DAB048 + 4);
  *(_OWORD *)(a2 + 368) = v12;
  long long v13 = *((_OWORD *)off_1E5DAB048 + 7);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)off_1E5DAB048 + 6);
  *(_OWORD *)(a2 + 400) = v13;
  long long v14 = *((_OWORD *)off_1E5DAB048 + 1);
  *(_OWORD *)(a2 + 288) = *(_OWORD *)off_1E5DAB048;
  *(_OWORD *)(a2 + 304) = v14;
  long long v15 = *((_OWORD *)off_1E5DAB048 + 3);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)off_1E5DAB048 + 2);
  *(_OWORD *)(a2 + 336) = v15;
  *(unsigned char *)(a2 + 672) = 0;
  long long v16 = *(_OWORD *)(a1 + 136);
  long long v17 = *(_OWORD *)(a1 + 152);
  long long v18 = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(a2 + 512) = *(_OWORD *)(a1 + 168);
  *(_OWORD *)(a2 + 528) = v18;
  *(_OWORD *)(a2 + 480) = v16;
  *(_OWORD *)(a2 + 496) = v17;
  long long v19 = *(_OWORD *)(a1 + 200);
  long long v20 = *(_OWORD *)(a1 + 216);
  long long v21 = *(_OWORD *)(a1 + 248);
  *(_OWORD *)(a2 + 576) = *(_OWORD *)(a1 + 232);
  *(_OWORD *)(a2 + 592) = v21;
  *(_OWORD *)(a2 + 544) = v19;
  *(_OWORD *)(a2 + 560) = v20;
  long long v22 = *(_OWORD *)(a1 + 264);
  long long v23 = *(_OWORD *)(a1 + 280);
  long long v24 = *(_OWORD *)(a1 + 312);
  *(_OWORD *)(a2 + 640) = *(_OWORD *)(a1 + 296);
  *(_OWORD *)(a2 + 656) = v24;
  *(_OWORD *)(a2 + 608) = v22;
  *(_OWORD *)(a2 + 624) = v23;
  *(unsigned char *)(a2 + 673) = 1;
  id v25 = *(id *)(a1 + 32);
  id v26 = *(id *)(a2 + 688);
  id v27 = v25;
  if (v26 != v25)
  {

    *(void *)(a2 + 688) = v27;
  }
}

double __42__PXTilingController__updateTilesIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a2 = 0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(void *)(a2 + 88) = 0;
  long long v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 200) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 184) = v4;
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v7 = *(_OWORD *)(a1 + 96);
  *(void *)(a2 + 264) = *(void *)(a1 + 112);
  *(_OWORD *)(a2 + 248) = v7;
  *(_OWORD *)(a2 + 232) = v6;
  *(_OWORD *)(a2 + 216) = v5;
  memmove((void *)(a2 + 96), (const void *)(a1 + 32), 0x58uLL);
  *(void *)(a2 + 272) = *(void *)(a1 + 120);
  *(unsigned char *)(a2 + 280) = 1;
  long long v8 = *((_OWORD *)off_1E5DAB048 + 3);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)off_1E5DAB048 + 2);
  *(_OWORD *)(a2 + 336) = v8;
  long long v9 = *((_OWORD *)off_1E5DAB048 + 1);
  *(_OWORD *)(a2 + 288) = *(_OWORD *)off_1E5DAB048;
  *(_OWORD *)(a2 + 304) = v9;
  long long v10 = *((_OWORD *)off_1E5DAB048 + 7);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)off_1E5DAB048 + 6);
  *(_OWORD *)(a2 + 400) = v10;
  long long v11 = *((_OWORD *)off_1E5DAB048 + 5);
  *(_OWORD *)(a2 + 352) = *((_OWORD *)off_1E5DAB048 + 4);
  *(_OWORD *)(a2 + 368) = v11;
  long long v12 = *((_OWORD *)off_1E5DAB048 + 11);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)off_1E5DAB048 + 10);
  *(_OWORD *)(a2 + 464) = v12;
  long long v13 = *((_OWORD *)off_1E5DAB048 + 9);
  *(_OWORD *)(a2 + 416) = *((_OWORD *)off_1E5DAB048 + 8);
  *(_OWORD *)(a2 + 432) = v13;
  *(unsigned char *)(a2 + 672) = 0;
  double result = 0.0;
  *(_OWORD *)(a2 + 680) = 0u;
  return result;
}

- (void)_invalidateTiles
{
  self->_needsUpdateFlags.tiles = 1;
  [(PXTilingController *)self _setNeedsUpdate];
  [(PXTilingController *)self _invalidatePreheating];
}

- (void)_invalidateCachesOutsideRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXTilingController *)self _cachedRect];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v10 = CGRectIntersection(v9, v11);
  -[PXTilingController _setCachedRect:](self, "_setCachedRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (void)_invalidateAllCachedRects
{
  -[PXTilingController _setCachedRect:](self, "_setCachedRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [(PXTilingController *)self _pagedRect];
  -[PXTilingController _invalidateRect:](self, "_invalidateRect:");
}

- (void)_invalidateRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXTilingController *)self _dirtyRect];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v10 = CGRectUnion(v9, v11);
  -[PXTilingController _setDirtyRect:](self, "_setDirtyRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (void)_updatePagedRectIfNeeded
{
  if (self->_needsUpdateFlags.pagedRect)
  {
    self->_needsUpdateFlags.pagedRect = 0;
    [(PXTilingController *)self _activeRect];
    [(PXTilingController *)self _maxPreheatPadding];
    sub_1AB23B20C();
  }
}

- (void)_invalidatePagedRect
{
  self->_needsUpdateFlags.pagedRect = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_updateLayoutPreparationIfNeeded
{
  if (self->_needsUpdateFlags.layoutPreparation)
  {
    self->_needsUpdateFlags.layoutPreparation = 0;
    id v2 = [(PXTilingController *)self targetLayout];
    [v2 prepareLayout];
  }
}

- (void)_invalidateLayoutPreparation
{
  self->_needsUpdateFlags.layoutPreparation = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_updateLayoutVisibleRectIfNeeded
{
  if (self->_needsUpdateFlags.layoutVisibleRect)
  {
    self->_needsUpdateFlags.layoutVisibleRect = 0;
    uint64_t v3 = [(PXTilingController *)self targetLayout];
    [(PXTilingController *)self _visibleRect];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    long long v12 = [(PXTilingController *)self _coordinateSpaceConverter];
    objc_msgSend(v12, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", -[PXTilingController _coordinateSpaceIdentifier](self, "_coordinateSpaceIdentifier"), objc_msgSend(v3, "coordinateSpaceIdentifier"), v5, v7, v9, v11);
    double v14 = v13;
    double v16 = v15;

    [v3 visibleOrigin];
    if (v16 != v18 || v14 != v17) {
      objc_msgSend(v3, "setVisibleOrigin:", v14, v16);
    }
    [v3 visibleSize];
    PXSizeApproximatelyEqualToSize();
  }
}

- (void)_invalidateLayoutVisibleRect
{
  self->_needsUpdateFlags.layoutVisibleRect = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_updateLayoutPositionIfNeeded
{
  if (self->_needsUpdateFlags.layoutPosition)
  {
    self->_needsUpdateFlags.layoutPosition = 0;
    [(PXTilingController *)self targetLayout];
    [(id)objc_claimAutoreleasedReturnValue() shouldFlipHorizontally];
    [(PXTilingController *)self _layoutDesiredOrigin];
    PXPointIsNull();
  }
}

__n128 __51__PXTilingController__updateLayoutPositionIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 8))
  {
    *(unsigned char *)(a3 + 280) = 1;
    long long v3 = *((_OWORD *)off_1E5DAB048 + 9);
    *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E5DAB048 + 8);
    *(_OWORD *)(a3 + 624) = v3;
    long long v4 = *((_OWORD *)off_1E5DAB048 + 11);
    *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E5DAB048 + 10);
    *(_OWORD *)(a3 + 656) = v4;
    long long v5 = *((_OWORD *)off_1E5DAB048 + 5);
    *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E5DAB048 + 4);
    *(_OWORD *)(a3 + 560) = v5;
    long long v6 = *((_OWORD *)off_1E5DAB048 + 7);
    *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E5DAB048 + 6);
    *(_OWORD *)(a3 + 592) = v6;
    long long v7 = *((_OWORD *)off_1E5DAB048 + 1);
    *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E5DAB048;
    *(_OWORD *)(a3 + 496) = v7;
    __n128 result = *((__n128 *)off_1E5DAB048 + 2);
    long long v9 = *((_OWORD *)off_1E5DAB048 + 3);
    *(__n128 *)(a3 + 512) = result;
    *(_OWORD *)(a3 + 528) = v9;
  }
  return result;
}

- (void)_invalidateLayoutPosition
{
  self->_needsUpdateFlags.layoutPosition = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_updateLayoutPreferredVisibleOriginIfNeeded
{
  if (!self->_needsUpdateFlags.layoutPreferredVisibleOrigin) {
    return;
  }
  self->_needsUpdateFlags.layoutPreferredVisibleOrigin = 0;
  id v22 = [(PXTilingController *)self targetLayout];
  [v22 scrollBounds];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(PXTilingController *)self _layoutWithInitializedVisibleOrigin];

  if (v22 == v7)
  {
    double v8 = [(PXTilingController *)self _coordinateSpace];
    double v11 = [v22 coordinateSpace];
    [v11 setParentSpace:v8];
    [(PXTilingController *)self _visibleRect];
    double v13 = v12;
    double v15 = v14;
    double v16 = [(PXTilingController *)self _coordinateSpaceConverter];
    objc_msgSend(v16, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v8, "identifier"), objc_msgSend(v22, "coordinateSpaceIdentifier"), v13, v15);
    double v4 = v17;
    double v6 = v18;

    if (self->_scrollDelegateFlags.respondsToTargetVisibleOriginForLayoutProposedVisibleOrigin)
    {
      long long v19 = [(PXTilingController *)self scrollDelegate];
      objc_msgSend(v19, "tilingController:targetVisibleOriginForLayout:proposedVisibleOrigin:", self, v22, v4, v6);
      double v4 = v20;
      double v6 = v21;
    }
    goto LABEL_9;
  }
  [(PXTilingController *)self _setLayoutWithInitializedVisibleOrigin:v22];
  if (self->_scrollDelegateFlags.respondsToInitialVisibleOriginForLayout)
  {
    double v8 = [(PXTilingController *)self scrollDelegate];
    [v8 tilingController:self initialVisibleOriginForLayout:v22];
    double v4 = v9;
    double v6 = v10;
LABEL_9:
  }
  -[PXTilingController _setUpdatedPreferredVisibleOrigin:](self, "_setUpdatedPreferredVisibleOrigin:", v4, v6);
}

- (void)_invalidateLayoutPreferredVisibleOrigin
{
  self->_needsUpdateFlags.layoutPreferredVisibleOrigin = 1;
  [(PXTilingController *)self _setNeedsUpdate];
  -[PXTilingController _setLayoutDesiredOrigin:](self, "_setLayoutDesiredOrigin:", *(double *)off_1E5DAB000, *((double *)off_1E5DAB000 + 1));
  id v3 = [(PXTilingController *)self observer];
  [v3 tilingController:self invalidatedWithContext:2];
}

- (void)_updateLayoutMetricsIfNeeded
{
  if (self->_needsUpdateFlags.layoutMetrics)
  {
    self->_needsUpdateFlags.layoutMetrics = 0;
    id v16 = [(PXTilingController *)self targetLayout];
    [(PXTilingController *)self _referenceSize];
    double v4 = v3;
    double v6 = v5;
    [(PXTilingController *)self _visibleRect];
    double v8 = v7;
    double v10 = v9;
    [(PXTilingController *)self _contentInset];
    [v16 referenceSize];
    if (v6 != v12 || v4 != v11) {
      objc_msgSend(v16, "setReferenceSize:", v4, v6);
    }
    [v16 visibleSize];
    if (v8 != v15 || v10 != v14) {
      objc_msgSend(v16, "setVisibleSize:", v8, v10);
    }
    [v16 contentInset];
    PXEdgeInsetsEqualToEdgeInsets();
  }
}

- (void)_invalidateLayoutMetrics
{
  self->_needsUpdateFlags.layoutMetrics = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_updateScrollControllerMetricsIfNeeded
{
  if (self->_needsUpdateFlags.scrollControllerMetrics)
  {
    self->_needsUpdateFlags.scrollControllerMetrics = 0;
    id v19 = [(PXTilingController *)self scrollController];
    [v19 activeRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [v19 visibleRect];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    -[PXTilingController _setActiveRect:](self, "_setActiveRect:", v4, v6, v8, v10);
    -[PXTilingController _setVisibleRect:](self, "_setVisibleRect:", v12, v14, v16, v18);
  }
}

- (void)_invalidateScrollControllerMetrics
{
  self->_needsUpdateFlags.scrollControllerMetrics = 1;
  [(PXTilingController *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingUpdates && !self->_hasScheduledUpdate)
  {
    self->_hasScheduledUpdate = 1;
    id v3 = [(PXTilingController *)self observer];
    [v3 setTilingControllerNeedsUpdate:self];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.scrollControllerMetrics
      || self->_needsUpdateFlags.pagedRect
      || self->_needsUpdateFlags.layoutMetrics
      || self->_needsUpdateFlags.layoutPreferredVisibleOrigin
      || self->_needsUpdateFlags.layoutPosition
      || self->_needsUpdateFlags.layoutVisibleRect
      || self->_needsUpdateFlags.layoutPreparation
      || self->_needsUpdateFlags.tiles
      || self->_needsUpdateFlags.preheating
      || self->_needsUpdateFlags.maxPreheatPadding;
}

- (void)endUpdate
{
  [(PXTilingController *)self _updateTilesIfNeeded];
  [(PXTilingController *)self _updatePreheatingIfNeeded];
  [(PXTilingController *)self _discardCurrentChange];
  double v3 = *(double *)off_1E5DAB000;
  double v4 = *((double *)off_1E5DAB000 + 1);
  -[PXTilingController _setUpdatedPreferredVisibleOrigin:](self, "_setUpdatedPreferredVisibleOrigin:", *(double *)off_1E5DAB000, v4);
  -[PXTilingController _setLayoutDesiredOrigin:](self, "_setLayoutDesiredOrigin:", v3, v4);
  double v5 = [(PXTilingController *)self targetLayout];
  [(PXTilingController *)self _setCurrentLayout:v5];

  [(PXTilingController *)self _updateDebugDelegateIfNeeded];
  self->_isPerformingUpdates = 0;
}

- (void)updateLayout
{
  [(PXTilingController *)self _updateLayoutPositionIfNeeded];
  [(PXTilingController *)self _updateLayoutVisibleRectIfNeeded];
  [(PXTilingController *)self _updateLayoutPreparationIfNeeded];
}

- (void)updateMetrics
{
  [(PXTilingController *)self _updateScrollControllerMetricsIfNeeded];
  [(PXTilingController *)self _updateMaxPreheatPaddingIfNeeded];
  [(PXTilingController *)self _updatePagedRectIfNeeded];
  [(PXTilingController *)self _updateLayoutMetricsIfNeeded];
  self->_hasInitializedLayout = 1;
  [(PXTilingController *)self _updateLayoutPreparationIfNeeded];
  [(PXTilingController *)self _updateLayoutPreferredVisibleOriginIfNeeded];
  [(PXTilingController *)self _updateScrollInfoIfNeeded];
}

- (void)beginUpdate
{
  double v3 = [(PXTilingController *)self _currentChangeIfExists];
  if (v3 && self->_transitionDelegateFlags.respondsToPrepareForChange)
  {
    id v5 = v3;
    double v4 = [(PXTilingController *)self transitionDelegate];
    [v4 tilingController:self prepareForChange:v5];

    double v3 = v5;
  }
  *(_WORD *)&self->_isPerformingUpdates = 1;
}

- (void)_discardCurrentChange
{
  currentChange = self->__currentChange;
  self->__currentChange = 0;
}

- (id)_currentChangeIfExists
{
  return self->__currentChange;
}

- (PXTilingChange)_currentChange
{
  currentChange = self->__currentChange;
  if (!currentChange)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXTilingController.m" lineNumber:709 description:@"invalid access to current change"];

    currentChange = self->__currentChange;
  }
  return currentChange;
}

- (void)_ensureCurrentChange
{
  currentChange = self->__currentChange;
  if (!currentChange)
  {
    double v4 = objc_alloc_init(PXTilingChange);
    id v5 = self->__currentChange;
    self->__currentChange = v4;

    currentChange = self->__currentChange;
  }
  double v6 = [(PXTilingController *)self targetLayout];
  [(PXTilingChange *)currentChange recordLayout:v6];

  double v7 = self->__currentChange;
  [(PXTilingController *)self _referenceSize];
  -[PXTilingChange recordReferenceSize:](v7, "recordReferenceSize:");
  double v8 = self->__currentChange;
  [(PXTilingController *)self _contentInset];
  -[PXTilingChange recordContentInset:](v8, "recordContentInset:");
  double v9 = self->__currentChange;
  id v10 = [(PXTilingController *)self compositionInvalidationContexts];
  [(PXTilingChange *)v9 recordCompositionInvalidationContexts:v10];
}

- (id)convertScrollInfoFromLayout:(id)a3
{
  double v4 = (void *)[a3 copy];
  id v5 = v4;
  if (v4)
  {
    [v4 pagingOrigin];
    [(PXTilingController *)self convertPointFromLayout:"convertPointFromLayout:"];
    double v7 = v6;
    double v9 = v8;
    id v10 = [(PXTilingController *)self targetLayout];
    int v11 = [v10 shouldFlipHorizontally];

    if (v11)
    {
      [v5 interpageSpacing];
      double v7 = v7 + v12;
    }
    objc_msgSend(v5, "setPagingOrigin:", v7, v9);
  }
  return v5;
}

- (CGRect)convertRectFromLayout:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(PXTilingController *)self _coordinateSpaceConverter];
  double v9 = [(PXTilingController *)self targetLayout];
  objc_msgSend(v8, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "coordinateSpaceIdentifier"), -[PXTilingController _coordinateSpaceIdentifier](self, "_coordinateSpaceIdentifier"), x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGPoint)convertPointFromLayout:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PXTilingController *)self _coordinateSpaceConverter];
  double v7 = [(PXTilingController *)self targetLayout];
  objc_msgSend(v6, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v7, "coordinateSpaceIdentifier"), -[PXTilingController _coordinateSpaceIdentifier](self, "_coordinateSpaceIdentifier"), x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)setLayoutOrigin:(CGPoint)a3
{
  -[PXTilingController _setLayoutDesiredOrigin:](self, "_setLayoutDesiredOrigin:", a3.x, a3.y);
  [(PXTilingController *)self _invalidateLayoutPosition];
}

- (PXScrollInfo)scrollInfo
{
  id v2 = [(PXTilingController *)self _scrollInfo];
  double v3 = (void *)[v2 copy];

  return (PXScrollInfo *)v3;
}

- (CGPoint)layoutOrigin
{
}

- (CGPoint)layoutPreferredOrigin
{
  if (!self->_isPerformingUpdates)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXTilingController.m" lineNumber:616 description:@"property not valid unless within updates"];
  }
  [(PXTilingController *)self _updatedPreferredVisibleOrigin];
  PXPointIsNull();
}

double __43__PXTilingController_layoutPreferredOrigin__block_invoke(uint64_t a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  if ([*(id *)(a1 + 32) shouldFlipHorizontally])
  {
    v13.origin.double x = a4;
    v13.origin.double y = a5;
    v13.size.double width = a6;
    v13.size.double height = a7;
    return -(a2 - CGRectGetMidX(v13) * 2.0);
  }
  return a2;
}

- (CGRect)layoutScrollBounds
{
  id v2 = [(PXTilingController *)self targetLayout];
  [v2 scrollBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)layoutContentBounds
{
  id v2 = [(PXTilingController *)self targetLayout];
  [v2 contentBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setReferenceSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  -[PXTilingController _setReferenceSize:](self, "_setReferenceSize:", a3.width, a3.height);
  -[PXTilingController _setContentInset:](self, "_setContentInset:", top, left, bottom, right);
}

- (void)_markRectAsCached:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3)) {
    return;
  }
  [(PXTilingController *)self _cachedRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([(PXTilingController *)self shouldAggressivelyEvictTileCaches])
  {
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_17;
  }
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (CGRectIsEmpty(v21)) {
    goto LABEL_17;
  }
  if (x == v9 && width == v13)
  {
    v22.origin.double x = v9;
    v22.origin.double y = v11;
    v22.size.double width = v13;
    v22.size.double height = v15;
    v34.origin.double x = x;
    v34.origin.double y = y;
    v34.size.double width = width;
    v34.size.double height = height;
    if (CGRectIntersectsRect(v22, v34)) {
      goto LABEL_16;
    }
    v23.origin.double x = v9;
    v23.origin.double y = v11;
    v23.size.double width = v13;
    v23.size.double height = v15;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    if (MaxY == CGRectGetMinY(v24)) {
      goto LABEL_16;
    }
    v25.origin.double x = v9;
    v25.origin.double y = v11;
    v25.size.double width = v13;
    v25.size.double height = v15;
    double MinY = CGRectGetMinY(v25);
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    double v16 = CGRectGetMaxY(v26);
LABEL_15:
    if (MinY != v16) {
      goto LABEL_17;
    }
LABEL_16:
    v32.origin.double x = v9;
    v32.origin.double y = v11;
    v32.size.double width = v13;
    v32.size.double height = v15;
    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    CGRect v33 = CGRectUnion(v32, v36);
    double x = v33.origin.x;
    double y = v33.origin.y;
    double width = v33.size.width;
    double height = v33.size.height;
    goto LABEL_17;
  }
  if (y == v11 && height == v15)
  {
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    if (CGRectIntersectsRect(v27, v35)) {
      goto LABEL_16;
    }
    v28.origin.double x = v9;
    v28.origin.double y = v11;
    v28.size.double width = v13;
    v28.size.double height = v15;
    double MaxX = CGRectGetMaxX(v28);
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    if (MaxX == CGRectGetMinX(v29)) {
      goto LABEL_16;
    }
    v30.origin.double x = v9;
    v30.origin.double y = v11;
    v30.size.double width = v13;
    v30.size.double height = v15;
    double MinY = CGRectGetMinX(v30);
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    double v16 = CGRectGetMaxX(v31);
    goto LABEL_15;
  }
LABEL_17:
  -[PXTilingController _setCachedRect:](self, "_setCachedRect:", x, y, width, height);
}

- (void)_fillBuffersWithTileStatesAtIndexes:(id)a3
{
  id v4 = a3;
  -[PXTilingController _prepareBufferForCount:](self, "_prepareBufferForCount:", [v4 count]);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  double v5 = [(PXTilingController *)self _tileStates];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PXTilingController__fillBuffersWithTileStatesAtIndexes___block_invoke;
  v6[3] = &unk_1E5DBBF78;
  v6[4] = self;
  v6[5] = v7;
  [v5 enumerateStatesAtIndexes:v4 usingBlock:v6];

  _Block_object_dispose(v7, 8);
}

__n128 __58__PXTilingController__fillBuffersWithTileStatesAtIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32) + 88 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  long long v5 = *(_OWORD *)(a3 + 144);
  long long v4 = *(_OWORD *)(a3 + 160);
  long long v6 = *(_OWORD *)(a3 + 128);
  *(void *)(v3 + 80) = *(void *)(a3 + 176);
  *(_OWORD *)(v3 + 48) = v5;
  *(_OWORD *)(v3 + 64) = v4;
  *(_OWORD *)(v3 + 32) = v6;
  long long v7 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v3 + 16) = v7;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40) + 192 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  long long v9 = *(_OWORD *)(a3 + 592);
  long long v11 = *(_OWORD *)(a3 + 544);
  long long v10 = *(_OWORD *)(a3 + 560);
  *(_OWORD *)(v8 + 96) = *(_OWORD *)(a3 + 576);
  *(_OWORD *)(v8 + 112) = v9;
  *(_OWORD *)(v8 + 64) = v11;
  *(_OWORD *)(v8 + 80) = v10;
  long long v12 = *(_OWORD *)(a3 + 656);
  long long v14 = *(_OWORD *)(a3 + 608);
  long long v13 = *(_OWORD *)(a3 + 624);
  *(_OWORD *)(v8 + 160) = *(_OWORD *)(a3 + 640);
  *(_OWORD *)(v8 + 176) = v12;
  *(_OWORD *)(v8 + 128) = v14;
  *(_OWORD *)(v8 + 144) = v13;
  __n128 result = *(__n128 *)(a3 + 480);
  long long v16 = *(_OWORD *)(a3 + 496);
  long long v17 = *(_OWORD *)(a3 + 528);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a3 + 512);
  *(_OWORD *)(v8 + 48) = v17;
  *(__n128 *)uint64_t v8 = result;
  *(_OWORD *)(v8 + 16) = v16;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)_prepareBufferForCount:(unint64_t)a3
{
  if (self->_bufferCount < a3)
  {
    self->_identifierBuffer = (PXTileIdentifier *)malloc_type_realloc(self->_identifierBuffer, 88 * a3, 0x1000040931E79F6uLL);
    self->_geometryBuffer = (PXTileGeometry *)malloc_type_realloc(self->_geometryBuffer, 192 * a3, 0x108004042DB75DEuLL);
    self->_bufferCount = a3;
  }
}

- (id)_preheatRecordForPreheatHandler:(id)a3 context:(void *)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v9 = [(PXTilingController *)self _preheatRecords];
  long long v10 = (PXTilingControllerPreheatRecord *)[v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (PXTilingControllerPreheatRecord *)((char *)i + 1))
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v13 preheatHandler];
        if (v14 == v8)
        {
          double v15 = (void *)[v13 context];

          if (v15 == a4)
          {
            long long v10 = v13;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      long long v10 = (PXTilingControllerPreheatRecord *)[v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (!v10 && v5)
  {
    long long v10 = [[PXTilingControllerPreheatRecord alloc] initWithPreheatHandler:v8 context:a4];
    long long v16 = [(PXTilingController *)self _preheatRecords];
    [v16 addObject:v10];
  }
  return v10;
}

- (void)_handleTileAnimationCompletionWithIndex:(unint64_t)a3
{
  BOOL v5 = [(PXTilingController *)self _tileStates];
  uint64_t v6 = [v5 stateAtIndex:a3];

  uint64_t v7 = *(void *)(v6 + 704) - 1;
  *(void *)(v6 + 704) = v7;
  if (!v7 && !self->_isPerformingUpdates)
  {
    [(PXTilingController *)self _invalidateTiles];
  }
}

- (id)_indexesOfVisibleTilesInRect:(CGRect)a3 withOptions:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v9 = (void *)MEMORY[0x1E4F28E60];
  id v10 = a4;
  uint64_t v11 = [v9 indexSet];
  long long v12 = [v10 tileGroups];

  long long v13 = [(PXTilingController *)self _tileStates];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__PXTilingController__indexesOfVisibleTilesInRect_withOptions___block_invoke;
  v19[3] = &unk_1E5DBBF50;
  id v20 = v12;
  id v14 = v11;
  id v21 = v14;
  id v15 = v12;
  objc_msgSend(v13, "enumerateStatesInRect:usingBlock:", v19, x, y, width, height);
  long long v16 = v21;
  id v17 = v14;

  return v17;
}

void *__63__PXTilingController__indexesOfVisibleTilesInRect_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result = *(void **)(a1 + 32);
  if (!result || (__n128 result = (void *)[result containsIndex:*(void *)(a3 + 272)], result))
  {
    if (*(unsigned char *)(a3 + 672) && *(void *)(a3 + 8))
    {
      uint64_t v7 = *(void **)(a1 + 40);
      return (void *)[v7 addIndex:a2];
    }
  }
  return result;
}

- (void)_setTargetLayout:(id)a3
{
  BOOL v5 = (PXTilingLayout *)a3;
  if (self->_targetLayout != v5)
  {
    [(PXTilingController *)self _ensureCurrentChange];
    [(PXTilingLayout *)self->_targetLayout setObserver:0];
    objc_storeStrong((id *)&self->_targetLayout, a3);
    [(PXTilingLayout *)self->_targetLayout setObserver:self];
    uint64_t v6 = [(PXTilingController *)self _currentChange];
    uint64_t v7 = [[PXTilingChangeEvent alloc] initWithChangeToLayout:v5];
    [v6 addEvent:v7];

    id v8 = [(PXTilingController *)self _tileStates];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__PXTilingController__setTargetLayout___block_invoke;
    v10[3] = &unk_1E5DBBF28;
    id v11 = v8;
    id v9 = v8;
    [v9 enumerateStatesUsingBlock:v10];
    [(PXTilingController *)self _invalidateAllCachedRects];
    [(PXTilingController *)self _invalidateLayoutMetrics];
    [(PXTilingController *)self _invalidateLayoutPreferredVisibleOrigin];
    [(PXTilingController *)self _invalidateLayoutPosition];
    [(PXTilingController *)self _invalidateLayoutVisibleRect];
    [(PXTilingController *)self _invalidateTiles];
    [(PXTilingController *)self _invalidateScrollInfo];
  }
}

__n128 __39__PXTilingController__setTargetLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 8))
  {
    *(unsigned char *)a3 = 1;
    long long v4 = *(void **)(a1 + 32);
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    [v4 setTargetIdentifier:v12 forTileStateAtIndex:a2];
    *(unsigned char *)(a3 + 280) = 1;
    long long v5 = *((_OWORD *)off_1E5DAB048 + 9);
    *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E5DAB048 + 8);
    *(_OWORD *)(a3 + 624) = v5;
    long long v6 = *((_OWORD *)off_1E5DAB048 + 11);
    *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E5DAB048 + 10);
    *(_OWORD *)(a3 + 656) = v6;
    long long v7 = *((_OWORD *)off_1E5DAB048 + 5);
    *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E5DAB048 + 4);
    *(_OWORD *)(a3 + 560) = v7;
    long long v8 = *((_OWORD *)off_1E5DAB048 + 7);
    *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E5DAB048 + 6);
    *(_OWORD *)(a3 + 592) = v8;
    long long v9 = *((_OWORD *)off_1E5DAB048 + 1);
    *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E5DAB048;
    *(_OWORD *)(a3 + 496) = v9;
    __n128 result = *((__n128 *)off_1E5DAB048 + 2);
    long long v11 = *((_OWORD *)off_1E5DAB048 + 3);
    *(__n128 *)(a3 + 512) = result;
    *(_OWORD *)(a3 + 528) = v11;
  }
  return result;
}

- (void)_setDirtyRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__dirtyRect))
  {
    self->__dirtyRect.origin.CGFloat x = x;
    self->__dirtyRect.origin.CGFloat y = y;
    self->__dirtyRect.size.CGFloat width = width;
    self->__dirtyRect.size.CGFloat height = height;
    v9.origin.CGFloat x = x;
    v9.origin.CGFloat y = y;
    v9.size.CGFloat width = width;
    v9.size.CGFloat height = height;
    if (!CGRectIsEmpty(v9))
    {
      [(PXTilingController *)self _invalidateTiles];
    }
  }
}

- (void)_setPagedRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__pagedRect))
  {
    self->__pagedRect.origin.CGFloat x = x;
    self->__pagedRect.origin.CGFloat y = y;
    self->__pagedRect.size.CGFloat width = width;
    self->__pagedRect.size.CGFloat height = height;
    PXRectDiff();
  }
}

uint64_t __36__PXTilingController__setPagedRect___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) _invalidateTiles];
  }
  if (a2 == -1) {
    return objc_msgSend(*(id *)(result + 32), "_invalidateRect:");
  }
  return result;
}

- (void)_setMaxPreheatPadding:(UIEdgeInsets)a3
{
}

- (void)_setVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__visibleRect))
  {
    double v8 = self->__visibleRect.size.width;
    double v9 = self->__visibleRect.size.height;
    self->__visibleRect.origin.CGFloat x = x;
    self->__visibleRect.origin.CGFloat y = y;
    self->__visibleRect.size.double width = width;
    self->__visibleRect.size.double height = height;
    if (width != v8 || height != v9) {
      [(PXTilingController *)self _invalidateLayoutMetrics];
    }
    [(PXTilingController *)self _invalidateLayoutVisibleRect];
  }
}

- (void)_setActiveRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__activeRect))
  {
    self->__activeRect.origin.CGFloat x = x;
    self->__activeRect.origin.CGFloat y = y;
    self->__activeRect.size.CGFloat width = width;
    self->__activeRect.size.CGFloat height = height;
    [(PXTilingController *)self _invalidatePagedRect];
    [(PXTilingController *)self _invalidateTiles];
  }
}

- (void)_setContentInset:(UIEdgeInsets)a3
{
}

- (void)_setReferenceSize:(CGSize)a3
{
  if (a3.width != self->__referenceSize.width || a3.height != self->__referenceSize.height)
  {
    CGFloat height = a3.height;
    CGFloat width = a3.width;
    [(PXTilingController *)self _ensureCurrentChange];
    self->__referenceSize.CGFloat width = width;
    self->__referenceSize.CGFloat height = height;
    PXSizeIsNull();
  }
}

- (id)debugQuickLookObject
{
  id v2 = [(PXTilingController *)self debugInfo];
  uint64_t v3 = [v2 debugQuickLookObject];

  return v3;
}

- (PXTilingControllerDebugInfo)debugInfo
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(PXTilingControllerDebugInfo);
  [(PXTilingController *)self _activeRect];
  -[PXTilingControllerDebugInfo setActiveRect:](v3, "setActiveRect:");
  [(PXTilingController *)self _visibleRect];
  -[PXTilingControllerDebugInfo setVisibleRect:](v3, "setVisibleRect:");
  [(PXTilingController *)self _pagedRect];
  -[PXTilingControllerDebugInfo setPagedRect:](v3, "setPagedRect:");
  [(PXTilingController *)self _cachedRect];
  -[PXTilingControllerDebugInfo setCachedRect:](v3, "setCachedRect:");
  [(PXTilingController *)self layoutContentBounds];
  -[PXTilingControllerDebugInfo setContentBounds:](v3, "setContentBounds:");
  long long v4 = [MEMORY[0x1E4F1CA48] array];
  memset(v50, 0, sizeof(v50));
  long long v5 = [(PXTilingController *)self _preheatRecords];
  if ([v5 countByEnumeratingWithState:v50 objects:v52 count:16])
  {
    long long v6 = (void *)**((void **)&v50[0] + 1);
    [(PXTilingController *)self _activeRect];
    [v6 padding];
    sub_1AB23B20C();
  }

  [(PXTilingControllerDebugInfo *)v3 setPreheatRects:v4];
  long long v7 = [MEMORY[0x1E4F1CA48] array];
  double v8 = [(PXTilingController *)self _tileStates];
  [(PXTilingController *)self _pagedRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __31__PXTilingController_debugInfo__block_invoke;
  v48[3] = &unk_1E5DBBF28;
  id v17 = v7;
  id v49 = v17;
  objc_msgSend(v8, "enumerateStatesInRect:usingBlock:", v48, v10, v12, v14, v16);

  double v39 = v17;
  [(PXTilingControllerDebugInfo *)v3 setPagedItems:v17];
  long long v18 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = [MEMORY[0x1E4F28E60] indexSet];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = [(PXTilingController *)self _preheatRecords];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        CGRect v25 = [*(id *)(*((void *)&v44 + 1) + 8 * i) preheatedTileIndexes];
        [v19 addIndexes:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v22);
  }

  CGRect v26 = [(PXTilingController *)self _tileStates];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __31__PXTilingController_debugInfo__block_invoke_2;
  v42[3] = &unk_1E5DBBF28;
  id v43 = v18;
  id v27 = v18;
  [v26 enumerateStatesAtIndexes:v19 usingBlock:v42];

  [(PXTilingControllerDebugInfo *)v3 setPreheatedItems:v27];
  CGRect v28 = [MEMORY[0x1E4F1CA48] array];
  [(PXTilingController *)self _activeRect];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __31__PXTilingController_debugInfo__block_invoke_3;
  v40[3] = &unk_1E5DC1A00;
  id v41 = v28;
  id v37 = v28;
  -[PXTilingController enumerateTilesInRect:withOptions:usingBlock:](self, "enumerateTilesInRect:withOptions:usingBlock:", 0, v40, v30, v32, v34, v36);
  [(PXTilingControllerDebugInfo *)v3 setActiveItems:v37];

  return v3;
}

void __31__PXTilingController_debugInfo__block_invoke(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3[36], a3[37], a3[38], a3[39]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

void __31__PXTilingController_debugInfo__block_invoke_2(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3[36], a3[37], a3[38], a3[39]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

void __31__PXTilingController_debugInfo__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double *a4)
{
  id v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *a4, a4[1], a4[2], a4[3]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];
}

- (void)unregisterPreheatHandler:(id)a3 context:(void *)a4
{
  id v6 = [(PXTilingController *)self _preheatRecordForPreheatHandler:a3 context:a4 createIfNeeded:0];
  if (v6)
  {
    id v5 = [(PXTilingController *)self _preheatRecords];
    [v5 removeObject:v6];

    [(PXTilingController *)self _invalidateMaxPreheatPadding];
  }
}

- (void)registerPreheatHandler:(id)a3 withPadding:(UIEdgeInsets)a4 tileGroup:(unint64_t)a5 context:(void *)a6
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v12 = [(PXTilingController *)self _preheatRecordForPreheatHandler:a3 context:a6 createIfNeeded:1];
  objc_msgSend(v12, "setPadding:", top, left, bottom, right);
  [v12 setTileGroup:a5];
  [(PXTilingController *)self _invalidateMaxPreheatPadding];
  [(PXTilingController *)self _invalidatePreheating];
}

- (PXTileIdentifier)hitTestTileAtPoint:(SEL)a3 padding:(CGPoint)a4 passingTest:(UIEdgeInsets)a5
{
  id v6 = a6;
  PXRectWithEdges();
}

uint64_t __61__PXTilingController_hitTestTileAtPoint_padding_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _OWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, _OWORD *, _OWORD *, uint64_t, uint64_t, uint64_t))(v8 + 16);
  long long v10 = *(_OWORD *)(a2 + 48);
  v27[2] = *(_OWORD *)(a2 + 32);
  v27[3] = v10;
  v27[4] = *(_OWORD *)(a2 + 64);
  uint64_t v28 = *(void *)(a2 + 80);
  long long v11 = *(_OWORD *)(a2 + 16);
  v27[0] = *(_OWORD *)a2;
  v27[1] = v11;
  long long v12 = a4[9];
  v26[8] = a4[8];
  v26[9] = v12;
  long long v13 = a4[11];
  v26[10] = a4[10];
  v26[11] = v13;
  long long v14 = a4[5];
  void v26[4] = a4[4];
  v26[5] = v14;
  long long v15 = a4[7];
  v26[6] = a4[6];
  v26[7] = v15;
  long long v16 = a4[1];
  v26[0] = *a4;
  v26[1] = v16;
  long long v17 = a4[3];
  v26[2] = a4[2];
  v26[3] = v17;
  long long v18 = a5[9];
  v25[8] = a5[8];
  v25[9] = v18;
  long long v19 = a5[11];
  v25[10] = a5[10];
  v25[11] = v19;
  long long v20 = a5[5];
  v25[4] = a5[4];
  v25[5] = v20;
  long long v21 = a5[7];
  v25[6] = a5[6];
  v25[7] = v21;
  long long v22 = a5[1];
  v25[0] = *a5;
  v25[1] = v22;
  long long v23 = a5[3];
  v25[2] = a5[2];
  v25[3] = v23;
  uint64_t result = v9(v8, v27, a3, v26, v25, a6, a7, a8);
  if (result) {
    PXRectWithCenterAndSize();
  }
  return result;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  long long v12 = -[PXTilingController _indexesOfVisibleTilesInRect:withOptions:](self, "_indexesOfVisibleTilesInRect:withOptions:", a4, x, y, width, height);
  long long v13 = [(PXTilingController *)self _tileStates];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PXTilingController_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  v15[3] = &unk_1E5DBBED8;
  id v16 = v11;
  id v14 = v11;
  [v13 enumerateStatesAtIndexes:v12 usingBlock:v15];
}

uint64_t __66__PXTilingController_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a3 + 696);
  if (v5)
  {
    uint64_t v6 = *(void *)(result + 32);
    uint64_t v7 = *(void *)(a3 + 272);
    uint64_t v8 = *(void *)(a3 + 680);
    double v9 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, _OWORD *, _OWORD *, uint64_t, uint64_t, uint64_t))(v6 + 16);
    long long v10 = *(_OWORD *)(a3 + 56);
    v26[2] = *(_OWORD *)(a3 + 40);
    v26[3] = v10;
    void v26[4] = *(_OWORD *)(a3 + 72);
    uint64_t v27 = *(void *)(a3 + 88);
    long long v11 = *(_OWORD *)(a3 + 24);
    v26[0] = *(_OWORD *)(a3 + 8);
    v26[1] = v11;
    long long v12 = *(_OWORD *)(a3 + 432);
    v25[8] = *(_OWORD *)(a3 + 416);
    v25[9] = v12;
    long long v13 = *(_OWORD *)(a3 + 464);
    v25[10] = *(_OWORD *)(a3 + 448);
    v25[11] = v13;
    long long v14 = *(_OWORD *)(a3 + 368);
    v25[4] = *(_OWORD *)(a3 + 352);
    v25[5] = v14;
    long long v15 = *(_OWORD *)(a3 + 400);
    v25[6] = *(_OWORD *)(a3 + 384);
    v25[7] = v15;
    long long v16 = *(_OWORD *)(a3 + 304);
    v25[0] = *(_OWORD *)(a3 + 288);
    v25[1] = v16;
    long long v17 = *(_OWORD *)(a3 + 336);
    v25[2] = *(_OWORD *)(a3 + 320);
    v25[3] = v17;
    long long v18 = *(_OWORD *)(a3 + 624);
    v24[8] = *(_OWORD *)(a3 + 608);
    v24[9] = v18;
    long long v19 = *(_OWORD *)(a3 + 656);
    v24[10] = *(_OWORD *)(a3 + 640);
    v24[11] = v19;
    long long v20 = *(_OWORD *)(a3 + 560);
    v24[4] = *(_OWORD *)(a3 + 544);
    _OWORD v24[5] = v20;
    long long v21 = *(_OWORD *)(a3 + 592);
    v24[6] = *(_OWORD *)(a3 + 576);
    v24[7] = v21;
    long long v22 = *(_OWORD *)(a3 + 496);
    v24[0] = *(_OWORD *)(a3 + 480);
    v24[1] = v22;
    long long v23 = *(_OWORD *)(a3 + 528);
    v24[2] = *(_OWORD *)(a3 + 512);
    v24[3] = v23;
    return v9(v6, v26, v5, v25, v24, v7, v8, a4);
  }
  return result;
}

- (BOOL)getTile:(void *)a3 geometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileWithIdentifier:(PXTileIdentifier *)a7
{
  long long v13 = [(PXTilingController *)self _tileStates];
  CGSize v14 = *(CGSize *)&a7->index[5];
  CGPoint v47 = *(CGPoint *)&a7->index[3];
  CGSize v48 = v14;
  long long v49 = *(_OWORD *)&a7->index[7];
  *(void *)&long long v50 = a7->index[9];
  CGSize v15 = *(CGSize *)&a7->index[1];
  CGPoint v45 = *(CGPoint *)&a7->length;
  CGSize v46 = v15;
  uint64_t v16 = [v13 indexOfStateWithTargetIdentifier:&v45];

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    CGPoint v47 = (CGPoint)0;
    CGSize v48 = (CGSize)0;
    CGPoint v45 = (CGPoint)0;
    CGSize v46 = (CGSize)0;
LABEL_6:
    double v30 = [(PXTilingController *)self _tileStates];
    uint64_t v31 = [v30 stateAtIndex:v16];

    long long v21 = *(void **)(v31 + 696);
    long long v32 = *(_OWORD *)(v31 + 432);
    long long v53 = *(_OWORD *)(v31 + 416);
    long long v54 = v32;
    long long v33 = *(_OWORD *)(v31 + 464);
    long long v55 = *(_OWORD *)(v31 + 448);
    long long v56 = v33;
    long long v34 = *(_OWORD *)(v31 + 368);
    long long v49 = *(_OWORD *)(v31 + 352);
    long long v50 = v34;
    long long v35 = *(_OWORD *)(v31 + 400);
    long long v51 = *(_OWORD *)(v31 + 384);
    long long v52 = v35;
    CGSize v36 = *(CGSize *)(v31 + 304);
    CGPoint v45 = *(CGPoint *)(v31 + 288);
    CGSize v46 = v36;
    CGSize v37 = *(CGSize *)(v31 + 336);
    CGPoint v47 = *(CGPoint *)(v31 + 320);
    CGSize v48 = v37;
    unint64_t v22 = *(void *)(v31 + 272);
    id v23 = *(id *)(v31 + 680);
    BOOL v20 = 1;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  long long v17 = [(PXTilingController *)self _tileStates];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __76__PXTilingController_getTile_geometry_group_userData_forTileWithIdentifier___block_invoke;
  v57[3] = &__block_descriptor_120_e414_B24__0__PXProtectedTileState_B_PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q__QB_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v__PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_BB_v_v_vQ_8_B16l;
  long long v18 = *(_OWORD *)&a7->index[5];
  long long v60 = *(_OWORD *)&a7->index[3];
  long long v61 = v18;
  long long v62 = *(_OWORD *)&a7->index[7];
  unint64_t v63 = a7->index[9];
  long long v19 = *(_OWORD *)&a7->index[1];
  long long v58 = *(_OWORD *)&a7->length;
  long long v59 = v19;
  uint64_t v16 = [v17 indexOfFirstStatePassingTest:v57];

  if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  BOOL v20 = 0;
  long long v21 = 0;
  unint64_t v22 = 0;
  id v23 = 0;
  long long v24 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v53 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v54 = v24;
  long long v25 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v55 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v56 = v25;
  long long v26 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v49 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v50 = v26;
  long long v27 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v51 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v52 = v27;
  CGSize v28 = (CGSize)*((_OWORD *)off_1E5DAB048 + 1);
  CGPoint v45 = *(CGPoint *)off_1E5DAB048;
  CGSize v46 = v28;
  CGSize v29 = (CGSize)*((_OWORD *)off_1E5DAB048 + 3);
  CGPoint v47 = (CGPoint)*((_OWORD *)off_1E5DAB048 + 2);
  CGSize v48 = v29;
  if (a3) {
LABEL_7:
  }
    *a3 = v21;
LABEL_8:
  if (a4)
  {
    long long v38 = v54;
    *(_OWORD *)&a4->hidden = v53;
    *(_OWORD *)&a4->contentSize.double height = v38;
    long long v39 = v56;
    *(_OWORD *)&a4->contentsRect.origin.double y = v55;
    *(_OWORD *)&a4->contentsRect.size.double height = v39;
    long long v40 = v50;
    *(_OWORD *)&a4->transform.a = v49;
    *(_OWORD *)&a4->transform.c = v40;
    long long v41 = v52;
    *(_OWORD *)&a4->transform.tdouble x = v51;
    *(_OWORD *)&a4->alpha = v41;
    CGSize v42 = v46;
    a4->frame.origin = v45;
    a4->frame.CGSize size = v42;
    CGSize v43 = v48;
    a4->center = v47;
    a4->CGSize size = v43;
  }
  if (a5) {
    *a5 = v22;
  }
  if (a6) {
    *a6 = v23;
  }

  return v20;
}

BOOL __76__PXTilingController_getTile_geometry_group_userData_forTileWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 56);
  v12[2] = *(_OWORD *)(a2 + 40);
  v12[3] = v2;
  v12[4] = *(_OWORD *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 88);
  long long v3 = *(_OWORD *)(a2 + 24);
  v12[0] = *(_OWORD *)(a2 + 8);
  v12[1] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  v10[2] = *(_OWORD *)(a1 + 64);
  v10[3] = v4;
  void v10[4] = *(_OWORD *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 112);
  long long v5 = *(_OWORD *)(a1 + 48);
  v10[0] = *(_OWORD *)(a1 + 32);
  v10[1] = v5;
  BOOL result = *(void *)&v12[0] == *(void *)&v10[0];
  if (*(void *)&v12[0] && *(void *)&v12[0] == *(void *)&v10[0])
  {
    unint64_t v7 = 1;
    do
    {
      uint64_t v8 = *((void *)v12 + v7);
      uint64_t v9 = *((void *)v10 + v7);
      BOOL result = v8 == v9;
      if (v7 >= *(void *)&v12[0]) {
        break;
      }
      ++v7;
    }
    while (v8 == v9);
  }
  return result;
}

- (PXTileIdentifier)tileIdentifierForTile:(SEL)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x7810000000;
  CGSize v15 = &unk_1AB5D584F;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v21 = 0;
  uint64_t v6 = [(PXTilingController *)self _tileStates];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__PXTilingController_tileIdentifierForTile___block_invoke;
  v11[3] = &unk_1E5DBBE90;
  v11[4] = &v12;
  v11[5] = a4;
  [v6 enumerateStatesUsingBlock:v11];

  unint64_t v7 = v13;
  long long v8 = *((_OWORD *)v13 + 5);
  *(_OWORD *)&retstr->index[3] = *((_OWORD *)v13 + 4);
  *(_OWORD *)&retstr->index[5] = v8;
  *(_OWORD *)&retstr->index[7] = *((_OWORD *)v7 + 6);
  retstr->index[9] = v7[14];
  long long v9 = *((_OWORD *)v7 + 3);
  *(_OWORD *)&retstr->length = *((_OWORD *)v7 + 2);
  *(_OWORD *)&retstr->index[1] = v9;
  _Block_object_dispose(&v12, 8);
  return result;
}

__n128 __44__PXTilingController_tileIdentifierForTile___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 40) == *(void *)(a3 + 696))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v5 = *(_OWORD *)(a3 + 56);
    long long v6 = *(_OWORD *)(a3 + 72);
    long long v7 = *(_OWORD *)(a3 + 40);
    *(void *)(v4 + 112) = *(void *)(a3 + 88);
    *(_OWORD *)(v4 + 80) = v5;
    *(_OWORD *)(v4 + 96) = v6;
    *(_OWORD *)(v4 + 64) = v7;
    __n128 result = *(__n128 *)(a3 + 8);
    long long v9 = *(_OWORD *)(a3 + 24);
    *(__n128 *)(v4 + 32) = result;
    *(_OWORD *)(v4 + 48) = v9;
    *a4 = 1;
  }
  return result;
}

- (void)setTransitionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_transitionDelegate, obj);
    self->_transitionDelegateFlags.respondsToPrepareForChange = objc_opt_respondsToSelector() & 1;
    self->_transitionDelegateFlags.respondsToTileIdentifierConverterForChange = objc_opt_respondsToSelector() & 1;
    self->_transitionDelegateFlags.respondsToTransitionAnimationCoordinatorForChange = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setScrollDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollDelegate, obj);
    self->_scrollDelegateFlags.respondsToInitialVisibleOriginForLayout = objc_opt_respondsToSelector() & 1;
    self->_scrollDelegateFlags.respondsToTargetVisibleOriginForLayoutProposedVisibleOrigin = objc_opt_respondsToSelector() & 1;
    self->_scrollDelegateFlags.respondsToScrollInfoForLayout = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setScrollController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollController);

  long long v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_scrollController);

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_scrollController);
      long long v8 = +[PXTilingControllerCompositionEngine compositionEngineForScrollController:v7 createIfNeeded:0];

      [v8 unregisterTilingController:self];
    }
    id v9 = objc_storeWeak((id *)&self->_scrollController, obj);
    long long v10 = +[PXTilingControllerCompositionEngine compositionEngineForScrollController:obj createIfNeeded:1];

    [v10 registerTilingController:self];
    [(PXTilingController *)self _invalidateScrollControllerMetrics];

    long long v5 = obj;
  }
}

- (void)dealloc
{
  identifierBuffer = self->_identifierBuffer;
  if (identifierBuffer) {
    free(identifierBuffer);
  }
  geometryBuffer = self->_geometryBuffer;
  if (geometryBuffer) {
    free(geometryBuffer);
  }
  v5.receiver = self;
  v5.super_class = (Class)PXTilingController;
  [(PXTilingController *)&v5 dealloc];
}

- (PXTilingController)initWithLayout:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXTilingController;
  id v6 = [(PXTilingController *)&v24 init];
  id v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 216) = *(_OWORD *)off_1E5DAB030;
    long long v8 = *((_OWORD *)off_1E5DAAF00 + 1);
    *(_OWORD *)(v6 + 264) = *(_OWORD *)off_1E5DAAF00;
    *(_OWORD *)(v6 + 280) = v8;
    id v9 = objc_alloc_init(PXTilingCoordinateSpace);
    long long v10 = (void *)*((void *)v7 + 16);
    *((void *)v7 + 16) = v9;

    *((void *)v7 + 17) = [*((id *)v7 + 16) identifier];
    uint64_t v11 = objc_alloc_init(PXTilingCoordinateSpaceConverter);
    uint64_t v12 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v11;

    objc_storeStrong((id *)v7 + 9, a3);
    [*((id *)v7 + 9) setObserver:v7];
    uint64_t v13 = objc_alloc_init(PXTileStatePool);
    uint64_t v14 = (void *)*((void *)v7 + 21);
    *((void *)v7 + 21) = v13;

    *((_WORD *)v7 + 6) = 257;
    v7[14] = 1;
    *(_DWORD *)(v7 + 17) = 16843009;
    long long v15 = *(_OWORD *)off_1E5DAB000;
    *(_OWORD *)(v7 + 232) = *(_OWORD *)off_1E5DAB000;
    *(_OWORD *)(v7 + 248) = v15;
    long long v16 = *MEMORY[0x1E4F1DB20];
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v7 + 424) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v7 + 440) = v17;
    *(_OWORD *)(v7 + 392) = v16;
    *(_OWORD *)(v7 + 408) = v17;
    uint64_t v18 = [MEMORY[0x1E4F28E60] indexSet];
    long long v19 = (void *)*((void *)v7 + 22);
    *((void *)v7 + 22) = v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = (void *)*((void *)v7 + 23);
    *((void *)v7 + 23) = v20;

    long long v22 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)(v7 + 456) = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)(v7 + 472) = v22;
    *((void *)v7 + 5) = 0;
    *((void *)v7 + 6) = 0;
    *((void *)v7 + 4) = 0;
    v7[56] = 0;
  }

  return (PXTilingController *)v7;
}

- (PXTilingController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXTilingController.m" lineNumber:104 description:@"invalid initializer"];

  abort();
}

- (id)imageTileWithIdentifier:(PXTileIdentifier *)a3
{
  id v9 = 0;
  long long v3 = *(_OWORD *)&a3->index[5];
  v7[2] = *(_OWORD *)&a3->index[3];
  v7[3] = v3;
  void v7[4] = *(_OWORD *)&a3->index[7];
  unint64_t v8 = a3->index[9];
  long long v4 = *(_OWORD *)&a3->index[1];
  v7[0] = *(_OWORD *)&a3->length;
  v7[1] = v4;
  id v5 = 0;
  if ([(PXTilingController *)self getTile:&v9 geometry:0 group:0 userData:0 forTileWithIdentifier:v7])
  {
    id v5 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v5 = 0;
    }
  }
  return v5;
}

- (id)titleSubtitleTileWithIdentifier:(PXTileIdentifier *)a3
{
  id v9 = 0;
  long long v3 = *(_OWORD *)&a3->index[5];
  v7[2] = *(_OWORD *)&a3->index[3];
  v7[3] = v3;
  void v7[4] = *(_OWORD *)&a3->index[7];
  unint64_t v8 = a3->index[9];
  long long v4 = *(_OWORD *)&a3->index[1];
  v7[0] = *(_OWORD *)&a3->length;
  v7[1] = v4;
  id v5 = 0;
  if ([(PXTilingController *)self getTile:&v9 geometry:0 group:0 userData:0 forTileWithIdentifier:v7])
  {
    id v5 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v5 = 0;
    }
  }
  return v5;
}

@end