@interface PUTilingView
+ (unint64_t)_defaultEdgesScrollingContentIntoSafeArea;
- (BOOL)_isPerformingBatchUpdates;
- (BOOL)_needsUpdateLayout;
- (BOOL)_needsUpdateLayoutCoordinateSystem;
- (BOOL)_needsUpdateLayoutVisibleRect;
- (BOOL)_needsUpdateReferencedCoordinateSystems;
- (BOOL)_needsUpdateReferencedDataSources;
- (BOOL)_needsUpdateScrollViewProperties;
- (BOOL)_needsUpdateTileControllers;
- (BOOL)_needsUpdateTileControllersVisibleRect;
- (BOOL)allowEDRHeadroomMonitoring;
- (BOOL)isAnyTileControllerAnimating;
- (BOOL)shouldDisplayHDR;
- (NSMutableArray)_pendingUpdateItems;
- (NSMutableDictionary)_postLayoutBlocks;
- (NSMutableDictionary)_referencedDataSourcesByIdentifiers;
- (NSMutableSet)_referencedCoordinateSystems;
- (PUReuseQueue)_tileControllerReuseQueue;
- (PUTileAnimator)tileAnimator;
- (PUTileTransitionCoordinator)_tileTransitionCoordinatorForNextLayout;
- (PUTileTree)_activeTileControllers;
- (PUTileTree)_detachedTileControllers;
- (PUTileTree)_inactiveTileControllers;
- (PUTilingCoordinateSystem)contentCoordinateSystem;
- (PUTilingCoordinateSystem)fixedCoordinateSystem;
- (PUTilingLayout)_pendingLayout;
- (PUTilingLayout)layout;
- (PUTilingView)initWithCoder:(id)a3;
- (PUTilingView)initWithFrame:(CGRect)a3;
- (PUTilingView)initWithFrame:(CGRect)a3 layout:(id)a4;
- (PUTilingViewScrollDelegate)scrollDelegate;
- (PUTilingViewTileSource)tileSource;
- (PUTilingViewTileTransitionDelegate)tileTransitionDelegate;
- (PUTilingViewTileUseDelegate)tileUseDelegate;
- (PXDisplayScreenDynamicRangeMonitor)screenDynamicRangeMonitor;
- (UIEdgeInsets)loadingInsets;
- (double)_pagingFrictionAdjustment;
- (double)_pagingSpringPullAdjustment;
- (id)_createTileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSource:(id)a5 tileSource:(id)a6;
- (id)_dataSourceWithIdentifier:(id)a3;
- (id)dequeueTileControllerWithReuseIdentifier:(id)a3;
- (id)freezeTileController:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)onNextTileControllersUpdateBlock;
- (id)presentedTileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSourceIdentifier:(id)a5;
- (id)tileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSourceIdentifier:(id)a5;
- (int64_t)_reasonForNextLayoutCoordinateSystemUpdate;
- (void)_adjustScrollViewPagingDeceleration;
- (void)_applyPendingUpdates;
- (void)_enumerateActiveTileControllersUsingBlock:(id)a3;
- (void)_enumerateAllTileControllersUsingBlock:(id)a3;
- (void)_handleChangeFromBounds:(CGRect)a3 fromFrame:(CGRect)a4;
- (void)_invalidateLayout;
- (void)_invalidateLayoutCoordinateSystemWithReason:(int64_t)a3;
- (void)_invalidateLayoutVisibleRect;
- (void)_invalidateReferencedCoordinateSystems;
- (void)_invalidateReferencedDataSources;
- (void)_invalidateScrollViewProperties;
- (void)_invalidateTileControllers;
- (void)_invalidateTileControllersVisibleRect;
- (void)_invalidateTileControllersWithTileTransitionCoordinator:(id)a3;
- (void)_registerDataSource:(id)a3;
- (void)_runPostLayoutBlocks;
- (void)_setLayout:(id)a3;
- (void)_setNeedsUpdateLayout:(BOOL)a3;
- (void)_setNeedsUpdateLayoutCoordinateSystem:(BOOL)a3;
- (void)_setNeedsUpdateLayoutVisibleRect:(BOOL)a3;
- (void)_setNeedsUpdateReferencedCoordinateSystems:(BOOL)a3;
- (void)_setNeedsUpdateReferencedDataSources:(BOOL)a3;
- (void)_setNeedsUpdateScrollViewProperties:(BOOL)a3;
- (void)_setNeedsUpdateTileControllers:(BOOL)a3;
- (void)_setNeedsUpdateTileControllersVisibleRect:(BOOL)a3;
- (void)_setPagingFrictionAdjustment:(double)a3;
- (void)_setPagingSpringPullAdjustment:(double)a3;
- (void)_setPendingLayout:(id)a3;
- (void)_setPerformingBatchUpdates:(BOOL)a3;
- (void)_setReasonForNextLayoutCoordinateSystemUpdate:(int64_t)a3;
- (void)_setTileTransitionCoordinatorForNextLayout:(id)a3;
- (void)_startHeadroomMonitoringIfPossible;
- (void)_transferTileControllersToDataSource:(id)a3 usingDataSourceConverter:(id)a4;
- (void)_updateIfNeeded;
- (void)_updateLayoutCoordinateSystemIfNeeded;
- (void)_updateLayoutIfNeeded;
- (void)_updateLayoutVisibleRectIfNeeded;
- (void)_updateReferencedCoordinateSystemsIfNeeded;
- (void)_updateReferencedDataSourcesIfNeeded;
- (void)_updateScrollViewPropertiesIfNeeded;
- (void)_updateScrollViewPropertiesWithLayout:(id)a3;
- (void)_updateTileControllersIfNeeded;
- (void)_updateTileControllersVisibleRectIfNeeded;
- (void)_updateTileControllersWithLayout:(id)a3 reactivatability:(id)a4 appearanceHandler:(id)a5 updateHandler:(id)a6 disappearanceHandler:(id)a7 heartBeatHandler:(id)a8;
- (void)_updateTileControllersWithLayout:(id)a3 tileTransitionCoordinator:(id)a4;
- (void)configureDynamicRangeProperties;
- (void)deleteItemAtIndexPath:(id)a3 dataSource:(id)a4;
- (void)detachTileControllers:(id)a3;
- (void)didMoveToWindow;
- (void)enqueueTileControllerForReuse:(id)a3;
- (void)enumerateAllTileControllersUsingBlock:(id)a3;
- (void)enumeratePresentedTileControllersInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)insertItemAtIndexPath:(id)a3 dataSource:(id)a4;
- (void)invalidateLayout:(id)a3 withContext:(id)a4;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4 dataSource:(id)a5;
- (void)performBatchUpdates:(id)a3;
- (void)reattachTileControllers:(id)a3 withContext:(id)a4;
- (void)registerPostLayoutBlock:(id)a3 forIdentifier:(id)a4;
- (void)registerTileControllerClass:(Class)a3 forReuseIdentifier:(id)a4;
- (void)reloadItemAtIndexPath:(id)a3 dataSource:(id)a4;
- (void)setAllowEDRHeadroomMonitoring:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLoadingInsets:(UIEdgeInsets)a3;
- (void)setOnNextTileControllersUpdateBlock:(id)a3;
- (void)setScrollDelegate:(id)a3;
- (void)setShouldDisplayHDR:(BOOL)a3;
- (void)setTileAnimator:(id)a3;
- (void)setTileSource:(id)a3;
- (void)setTileTransitionDelegate:(id)a3;
- (void)setTileUseDelegate:(id)a3;
- (void)tileControllerDidEndAnimating:(id)a3;
- (void)transitionToLayout:(id)a3;
- (void)transitionToLayout:(id)a3 withContext:(id)a4 animationSetupCompletionHandler:(id)a5;
@end

@implementation PUTilingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenDynamicRangeMonitor, 0);
  objc_storeStrong(&self->_onNextTileControllersUpdateBlock, 0);
  objc_storeStrong((id *)&self->__postLayoutBlocks, 0);
  objc_storeStrong((id *)&self->__pendingUpdateItems, 0);
  objc_storeStrong((id *)&self->__tileTransitionCoordinatorForNextLayout, 0);
  objc_storeStrong((id *)&self->__referencedCoordinateSystems, 0);
  objc_storeStrong((id *)&self->__referencedDataSourcesByIdentifiers, 0);
  objc_storeStrong((id *)&self->__detachedTileControllers, 0);
  objc_storeStrong((id *)&self->__inactiveTileControllers, 0);
  objc_storeStrong((id *)&self->__activeTileControllers, 0);
  objc_storeStrong((id *)&self->__tileControllerReuseQueue, 0);
  objc_storeStrong((id *)&self->__pendingLayout, 0);
  objc_storeStrong((id *)&self->_fixedCoordinateSystem, 0);
  objc_storeStrong((id *)&self->_contentCoordinateSystem, 0);
  objc_destroyWeak((id *)&self->_tileUseDelegate);
  objc_destroyWeak((id *)&self->_scrollDelegate);
  objc_destroyWeak((id *)&self->_tileTransitionDelegate);
  objc_destroyWeak((id *)&self->_tileAnimator);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_tileSource);
}

- (PXDisplayScreenDynamicRangeMonitor)screenDynamicRangeMonitor
{
  return self->_screenDynamicRangeMonitor;
}

- (void)setOnNextTileControllersUpdateBlock:(id)a3
{
}

- (id)onNextTileControllersUpdateBlock
{
  return self->_onNextTileControllersUpdateBlock;
}

- (BOOL)allowEDRHeadroomMonitoring
{
  return self->_allowEDRHeadroomMonitoring;
}

- (NSMutableDictionary)_postLayoutBlocks
{
  return self->__postLayoutBlocks;
}

- (void)_setPagingFrictionAdjustment:(double)a3
{
  self->__pagingFrictionAdjustment = a3;
}

- (double)_pagingFrictionAdjustment
{
  return self->__pagingFrictionAdjustment;
}

- (void)_setPagingSpringPullAdjustment:(double)a3
{
  self->__pagingSpringPullAdjustment = a3;
}

- (double)_pagingSpringPullAdjustment
{
  return self->__pagingSpringPullAdjustment;
}

- (NSMutableArray)_pendingUpdateItems
{
  return self->__pendingUpdateItems;
}

- (void)_setPerformingBatchUpdates:(BOOL)a3
{
  self->__performingBatchUpdates = a3;
}

- (BOOL)_isPerformingBatchUpdates
{
  return self->__performingBatchUpdates;
}

- (void)_setReasonForNextLayoutCoordinateSystemUpdate:(int64_t)a3
{
  self->__reasonForNextLayoutCoordinateSystemUpdate = a3;
}

- (int64_t)_reasonForNextLayoutCoordinateSystemUpdate
{
  return self->__reasonForNextLayoutCoordinateSystemUpdate;
}

- (void)_setTileTransitionCoordinatorForNextLayout:(id)a3
{
}

- (PUTileTransitionCoordinator)_tileTransitionCoordinatorForNextLayout
{
  return self->__tileTransitionCoordinatorForNextLayout;
}

- (void)_setNeedsUpdateReferencedCoordinateSystems:(BOOL)a3
{
  self->__needsUpdateReferencedCoordinateSystems = a3;
}

- (BOOL)_needsUpdateReferencedCoordinateSystems
{
  return self->__needsUpdateReferencedCoordinateSystems;
}

- (void)_setNeedsUpdateReferencedDataSources:(BOOL)a3
{
  self->__needsUpdateReferencedDataSources = a3;
}

- (BOOL)_needsUpdateReferencedDataSources
{
  return self->__needsUpdateReferencedDataSources;
}

- (void)_setNeedsUpdateTileControllers:(BOOL)a3
{
  self->__needsUpdateTileControllers = a3;
}

- (BOOL)_needsUpdateTileControllers
{
  return self->__needsUpdateTileControllers;
}

- (void)_setNeedsUpdateScrollViewProperties:(BOOL)a3
{
  self->__needsUpdateScrollViewProperties = a3;
}

- (BOOL)_needsUpdateScrollViewProperties
{
  return self->__needsUpdateScrollViewProperties;
}

- (void)_setNeedsUpdateLayout:(BOOL)a3
{
  self->__needsUpdateLayout = a3;
}

- (BOOL)_needsUpdateLayout
{
  return self->__needsUpdateLayout;
}

- (void)_setNeedsUpdateLayoutCoordinateSystem:(BOOL)a3
{
  self->__needsUpdateLayoutCoordinateSystem = a3;
}

- (BOOL)_needsUpdateLayoutCoordinateSystem
{
  return self->__needsUpdateLayoutCoordinateSystem;
}

- (void)_setNeedsUpdateTileControllersVisibleRect:(BOOL)a3
{
  self->__needsUpdateTileControllersVisibleRect = a3;
}

- (BOOL)_needsUpdateTileControllersVisibleRect
{
  return self->__needsUpdateTileControllersVisibleRect;
}

- (void)_setNeedsUpdateLayoutVisibleRect:(BOOL)a3
{
  self->__needsUpdateLayoutVisibleRect = a3;
}

- (BOOL)_needsUpdateLayoutVisibleRect
{
  return self->__needsUpdateLayoutVisibleRect;
}

- (NSMutableSet)_referencedCoordinateSystems
{
  return self->__referencedCoordinateSystems;
}

- (NSMutableDictionary)_referencedDataSourcesByIdentifiers
{
  return self->__referencedDataSourcesByIdentifiers;
}

- (PUTileTree)_detachedTileControllers
{
  return self->__detachedTileControllers;
}

- (PUTileTree)_inactiveTileControllers
{
  return self->__inactiveTileControllers;
}

- (PUTileTree)_activeTileControllers
{
  return self->__activeTileControllers;
}

- (PUReuseQueue)_tileControllerReuseQueue
{
  return self->__tileControllerReuseQueue;
}

- (void)_setPendingLayout:(id)a3
{
}

- (PUTilingLayout)_pendingLayout
{
  return self->__pendingLayout;
}

- (void)setShouldDisplayHDR:(BOOL)a3
{
  self->_shouldDisplayHDR = a3;
}

- (BOOL)shouldDisplayHDR
{
  return self->_shouldDisplayHDR;
}

- (PUTilingCoordinateSystem)fixedCoordinateSystem
{
  return self->_fixedCoordinateSystem;
}

- (PUTilingCoordinateSystem)contentCoordinateSystem
{
  return self->_contentCoordinateSystem;
}

- (PUTilingViewTileUseDelegate)tileUseDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileUseDelegate);
  return (PUTilingViewTileUseDelegate *)WeakRetained;
}

- (PUTilingViewScrollDelegate)scrollDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);
  return (PUTilingViewScrollDelegate *)WeakRetained;
}

- (PUTilingViewTileTransitionDelegate)tileTransitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileTransitionDelegate);
  return (PUTilingViewTileTransitionDelegate *)WeakRetained;
}

- (void)setTileAnimator:(id)a3
{
}

- (PUTileAnimator)tileAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileAnimator);
  return (PUTileAnimator *)WeakRetained;
}

- (void)_setLayout:(id)a3
{
}

- (PUTilingLayout)layout
{
  return self->_layout;
}

- (UIEdgeInsets)loadingInsets
{
  double top = self->_loadingInsets.top;
  double left = self->_loadingInsets.left;
  double bottom = self->_loadingInsets.bottom;
  double right = self->_loadingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTileSource:(id)a3
{
}

- (PUTilingViewTileSource)tileSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileSource);
  return (PUTilingViewTileSource *)WeakRetained;
}

- (void)_transferTileControllersToDataSource:(id)a3 usingDataSourceConverter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUTilingView.m", 1392, @"Invalid parameter not satisfying: %@", @"dataSourceConverter != nil" object file lineNumber description];
  }
  [(PUTilingView *)self _registerDataSource:v7];
  v9 = [v7 identifier];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke;
  aBlock[3] = &unk_1E5F2CE70;
  aBlock[4] = self;
  id v19 = v8;
  id v20 = v7;
  id v21 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  v13 = (void (**)(void *, void *))_Block_copy(aBlock);
  v14 = [(PUTilingView *)self _activeTileControllers];
  v13[2](v13, v14);

  v15 = [(PUTilingView *)self _inactiveTileControllers];
  v13[2](v13, v15);

  v16 = [(PUTilingView *)self _detachedTileControllers];
  v13[2](v13, v16);
}

void __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[v3 copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke_2;
  v7[3] = &unk_1E5F2CE48;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = v3;
  id v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

void __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 dataSourceIdentifier];
  id v9 = [v7 _dataSourceWithIdentifier:v8];

  id v10 = [v6 indexPath];
  id v11 = [v6 tileKind];
  id v22 = v11;
  id v23 = v10;
  int v12 = [*(id *)(a1 + 40) convertIndexPath:&v23 tileKind:&v22 fromDataSource:v9 toDataSource:*(void *)(a1 + 48)];
  id v13 = v23;

  id v14 = v22;
  if (v12)
  {
    v15 = [v5 layoutInfo];
    v16 = [v15 layoutInfoWithIndexPath:v13 tileKind:v14 dataSourceIdentifier:*(void *)(a1 + 56)];

    v17 = [v16 tileIdentifier];
    if ([*(id *)(a1 + 64) useUniqueLeafs]
      && ([*(id *)(a1 + 64) objectWithTileIdentifier:v17],
          (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v19 = (void *)v18;
      id v20 = PLOneUpGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138413314;
        id v25 = v5;
        __int16 v26 = 2112;
        id v27 = v6;
        __int16 v28 = 2112;
        v29 = v17;
        __int16 v30 = 2112;
        v31 = v19;
        __int16 v32 = 2112;
        uint64_t v33 = v21;
        _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_DEFAULT, "Tried converting tileController:%@ from:%@ to:%@, but that tile identifier is already occuped by:%@, so disallowing conversion in tileTree:%@", buf, 0x34u);
      }
    }
    else
    {
      [*(id *)(a1 + 64) removeObject:v5 withTileIdentifier:v6];
      [v5 setLayoutInfo:v16];
      [*(id *)(a1 + 64) addObject:v5 withTileIdentifier:v17];
    }
  }
}

- (id)_dataSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PUTilingView *)self _referencedDataSourcesByIdentifiers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_registerDataSource:(id)a3
{
  id v4 = a3;
  id v6 = [v4 identifier];
  id v5 = [(PUTilingView *)self _referencedDataSourcesByIdentifiers];
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (void)registerPostLayoutBlock:(id)a3 forIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUTilingView.m", 1374, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v8 = [(PUTilingView *)self _postLayoutBlocks];
  id v9 = (void *)[v11 copy];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (void)_runPostLayoutBlocks
{
  id v3 = [(PUTilingView *)self _postLayoutBlocks];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PUTilingView__runPostLayoutBlocks__block_invoke;
  v4[3] = &unk_1E5F2CE20;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __36__PUTilingView__runPostLayoutBlocks__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(a1 + 32));
}

- (void)_updateReferencedCoordinateSystemsIfNeeded
{
  if ([(PUTilingView *)self _needsUpdateReferencedCoordinateSystems])
  {
    [(PUTilingView *)self _setNeedsUpdateReferencedCoordinateSystems:0];
    id v3 = [MEMORY[0x1E4F1CA80] set];
    id v4 = [(PUTilingView *)self layout];
    [v3 addObject:v4];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke;
    aBlock[3] = &unk_1E5F2CDF8;
    id v11 = v3;
    id v5 = v3;
    id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
    id v7 = [(PUTilingView *)self _inactiveTileControllers];
    v6[2](v6, v7);

    id v8 = [(PUTilingView *)self _detachedTileControllers];
    v6[2](v6, v8);

    id v9 = [(PUTilingView *)self _referencedCoordinateSystems];
    [v9 setSet:v5];
  }
}

void __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke_2;
  v3[3] = &unk_1E5F2CDD0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v3];
}

void __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 layoutInfo];
  id v3 = [v4 coordinateSystem];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_updateReferencedDataSourcesIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(PUTilingView *)self _needsUpdateReferencedDataSources])
  {
    [(PUTilingView *)self _setNeedsUpdateReferencedDataSources:0];
    id v3 = [(PUTilingView *)self _referencedDataSourcesByIdentifiers];
    id v4 = (void *)MEMORY[0x1E4F1CA80];
    id v5 = [v3 allKeys];
    id v6 = [v4 setWithArray:v5];

    id v7 = [(PUTilingView *)self layout];
    id v8 = [v7 dataSource];
    id v9 = [v8 identifier];

    if (v9) {
      [v6 removeObject:v9];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke;
    aBlock[3] = &unk_1E5F2CDF8;
    id v10 = v6;
    id v24 = v10;
    id v11 = (void (**)(void *, void *))_Block_copy(aBlock);
    int v12 = [(PUTilingView *)self _inactiveTileControllers];
    v11[2](v11, v12);

    id v13 = [(PUTilingView *)self _detachedTileControllers];
    v11[2](v11, v13);

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v3, "removeObjectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * v18++), (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v16);
    }
  }
}

void __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke_2;
  v3[3] = &unk_1E5F2CDD0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v3];
}

void __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 dataSourceIdentifier];
  [v3 removeObject:v4];
}

- (void)_updateTileControllersWithLayout:(id)a3 reactivatability:(id)a4 appearanceHandler:(id)a5 updateHandler:(id)a6 disappearanceHandler:(id)a7 heartBeatHandler:(id)a8
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v62 = a4;
  id v60 = a5;
  v65 = (uint64_t (**)(id, uint64_t, void *))a6;
  id v59 = a7;
  id v63 = a8;
  [(PUTilingView *)self bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = +[PUTilingViewSettings sharedInstance];
  LODWORD(a7) = [v23 allowPreheating];

  if (a7)
  {
    [(PUTilingView *)self loadingInsets];
    double v16 = v16 + v24;
    double v18 = v18 + v25;
    double v20 = v20 - (v24 + v26);
    double v22 = v22 - (v25 + v27);
  }
  __int16 v28 = [(PUTilingView *)self contentCoordinateSystem];
  v29 = [v14 coordinateSystem];
  double v30 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v28, v29, v16, v18);
  double v32 = v31;

  uint64_t v33 = objc_msgSend(v14, "layoutInfosForTilesInRect:", v30, v32, v20, v22);
  v64 = v14;
  v58 = [v14 dataSource];
  uint64_t v34 = [(PUTilingView *)self _activeTileControllers];
  v57 = [(PUTilingView *)self _inactiveTileControllers];
  id v66 = [[PUTileTree alloc] initUsingUniqueLeafs:1];
  v68 = v34;
  v35 = (void *)[v34 copy];
  v61 = self;
  v36 = [(PUTilingView *)self _detachedTileControllers];
  v71 = (void *)[v36 copy];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v33;
  uint64_t v37 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v90 != v39) {
          objc_enumerationMutation(obj);
        }
        v41 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v42 = [v41 tileIdentifier];
        v43 = [v36 objectWithTileIdentifier:v42];
        if (v43)
        {
          [v71 removeObject:v43 withTileIdentifier:v42];
LABEL_10:
          [v35 removeObjectWithTileIdentifier:v42];
          goto LABEL_14;
        }
        uint64_t v44 = [v68 objectWithTileIdentifier:v42];
        if (v44)
        {
          v45 = (void *)v44;
          int v46 = v65[2](v65, v44, v41);

          if (v46) {
            goto LABEL_10;
          }
        }
        [v66 addObject:v41 withTileIdentifier:v42];
LABEL_14:
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
    }
    while (v38);
  }

  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke;
  v86[3] = &unk_1E5F2CD30;
  id v87 = v35;
  id v88 = v66;
  id v47 = v66;
  id v67 = v35;
  [v71 enumerateObjectsUsingBlock:v86];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_2;
  v82[3] = &unk_1E5F2CD58;
  id v48 = v68;
  id v83 = v48;
  id v49 = v57;
  id v84 = v49;
  id v85 = v59;
  id v69 = v59;
  [v67 enumerateObjectsUsingBlock:v82];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_3;
  v74[3] = &unk_1E5F2CDA8;
  id v75 = v36;
  v76 = v61;
  id v77 = v49;
  id v78 = v58;
  id v79 = v48;
  id v80 = v62;
  id v81 = v60;
  id v50 = v60;
  id v51 = v48;
  id v52 = v58;
  id v53 = v62;
  id v54 = v49;
  id v55 = v36;
  [v47 enumerateObjectsUsingBlock:v74];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_5;
  v72[3] = &unk_1E5F2CB80;
  id v73 = v63;
  id v56 = v63;
  [v54 enumerateObjectsUsingBlock:v72];
}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectWithTileIdentifier:v5];
  if (v6)
  {
    [*(id *)(a1 + 32) removeObject:v6 withTileIdentifier:v5];
  }
  else
  {
    id v7 = [v8 layoutInfo];
    [*(id *)(a1 + 40) addObject:v7 withTileIdentifier:v5];
  }
}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 removeObjectWithTileIdentifier:v6];
  [*(id *)(a1 + 40) addObject:v7 withTileIdentifier:v6];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v21 = 0;
  double v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__92873;
  double v25 = __Block_byref_object_dispose__92874;
  id v26 = 0;
  id v7 = [*(id *)(a1 + 32) objectWithTileIdentifier:v6];
  if (v7) {
    objc_storeStrong(v22 + 5, v7);
  }
  id v8 = [*(id *)(a1 + 40) tileSource];
  id v9 = v22[5];
  if (!v9)
  {
    id v10 = *(void **)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_4;
    v17[3] = &unk_1E5F2CD80;
    id v19 = *(id *)(a1 + 72);
    id v18 = v5;
    double v20 = &v21;
    [v10 enumerateObjectsWithTileIdentifier:v6 usingBlock:v17];

    id v9 = v22[5];
    if (!v9) {
      goto LABEL_6;
    }
  }
  [*(id *)(a1 + 48) removeObject:v9 withTileIdentifier:v6];
  id v11 = v22[5];
  if (!v11)
  {
LABEL_6:
    int v12 = *(void **)(a1 + 40);
    id v13 = [v6 indexPath];
    id v14 = [v6 tileKind];
    uint64_t v15 = [v12 _createTileControllerWithIndexPath:v13 kind:v14 dataSource:*(void *)(a1 + 56) tileSource:v8];
    id v16 = v22[5];
    v22[5] = (id)v15;

    id v11 = v22[5];
  }
  [*(id *)(a1 + 64) addObject:v11 withTileIdentifier:v6];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

  _Block_object_dispose(&v21, 8);
}

uint64_t __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_updateTileControllersWithLayout:(id)a3 tileTransitionCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PUTilingView *)self tileAnimator];
  if (!v9)
  {

    id v8 = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke;
  v27[3] = &unk_1E5F2CC68;
  SEL v29 = a2;
  v27[4] = self;
  id v28 = v8;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_2;
  v23[3] = &unk_1E5F2CC90;
  SEL v26 = a2;
  v23[4] = self;
  id v24 = v28;
  id v25 = v9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_4;
  v19[3] = &unk_1E5F2CCB8;
  SEL v22 = a2;
  v19[4] = self;
  id v20 = v24;
  id v21 = v25;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_6;
  v15[3] = &unk_1E5F2CCE0;
  SEL v18 = a2;
  v15[4] = self;
  id v16 = v20;
  id v17 = v21;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_8;
  v12[3] = &unk_1E5F2CD08;
  id v13 = v17;
  SEL v14 = a2;
  v12[4] = self;
  id v10 = v17;
  id v11 = v20;
  [(PUTilingView *)self _updateTileControllersWithLayout:v7 reactivatability:v27 appearanceHandler:v23 updateHandler:v19 disappearanceHandler:v15 heartBeatHandler:v12];
}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isDetached])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a1[6], a1[4], @"PUTilingView.m", 1101, @"Invalid parameter not satisfying: %@", @"[tileController isDetached] == NO" object file lineNumber description];
  }
  [v6 center];
  if ((PXPointIsValid() & 1) == 0)
  {
    SEL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[6], a1[4], @"PUTilingView.m", 1102, @"Invalid parameter not satisfying: %@", @"PXPointIsValid(layoutInfo.center)" object file lineNumber description];
  }
  id v7 = (void *)a1[5];
  if (v7)
  {
    id v8 = [v7 initialLayoutInfoForAppearingTileController:v5 toLayoutInfo:v6];
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;
  id v10 = [v5 layoutInfo];
  uint64_t v11 = [v10 isGeometryEqualToLayoutInfo:v9];

  return v11;
}

void __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isDetached])
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1108, @"Invalid parameter not satisfying: %@", @"[appearingTileController isDetached] == NO" object file lineNumber description];
  }
  if ([v5 isReusable])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1109, @"Invalid parameter not satisfying: %@", @"[appearingTileController isReusable] == NO" object file lineNumber description];
  }
  if ([v5 isActive])
  {
    SEL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1110, @"Invalid parameter not satisfying: %@", @"[appearingTileController isActive] == NO" object file lineNumber description];
  }
  [v6 center];
  if ((PXPointIsValid() & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1111, @"Invalid parameter not satisfying: %@", @"PXPointIsValid(layoutInfo.center)" object file lineNumber description];
  }
  [v5 setActive:1];
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = [v7 initialLayoutInfoForAppearingTileController:v5 toLayoutInfo:v6];
    if (([v8 isEqual:v6] & 1) == 0)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1116, @"Invalid parameter not satisfying: %@", @"[initialLayoutInfo isEqual:layoutInfo]" object file lineNumber description];
    }
    id v9 = [*(id *)(a1 + 40) optionsForAnimatingTileController:v5 toLayoutInfo:v6 withAnimationType:2];
    if (([v5 isAnimating] & 1) == 0)
    {
      [*(id *)(a1 + 48) prepareTileControllerForAnimation:v5 withInitialLayoutInfo:v8];
      [v5 setLayoutInfo:v8];
    }
    uint64_t v10 = [v5 willBeginAnimation];
    uint64_t v11 = *(void **)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_3;
    v17[3] = &unk_1E5F2E0A8;
    id v18 = v5;
    uint64_t v19 = v10;
    [v11 animateTileController:v18 toLayoutInfo:v6 withOptions:v9 completionHandler:v17];
  }
  else if ([v5 isAnimating])
  {
    [*(id *)(a1 + 48) updateAnimationForTileController:v5 withRepositionedTargetLayoutInfo:v6];
  }
  else
  {
    [v5 applyLayoutInfo:v6];
  }
  [v5 setLayoutInfo:v6];
}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isDetached])
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1138, @"Invalid parameter not satisfying: %@", @"[updatedTileController isDetached] == NO" object file lineNumber description];
  }
  if ([v5 isReusable])
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1139, @"Invalid parameter not satisfying: %@", @"[updatedTileController isReusable] == NO" object file lineNumber description];
  }
  if (([v5 isActive] & 1) == 0)
  {
    SEL v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1140, @"Invalid parameter not satisfying: %@", @"[updatedTileController isActive] == YES" object file lineNumber description];
  }
  int v7 = [*(id *)(a1 + 40) useDoubleSidedTransitionForUpdatedTileController:v5 toLayoutInfo:v6];
  if ((v7 & 1) == 0)
  {
    id v8 = [v6 coordinateSystem];
    id v9 = [v5 layoutInfo];
    uint64_t v10 = [v9 coordinateSystem];
    if ([v8 isEqual:v10])
    {
      uint64_t v11 = [v5 layoutInfo];
      char v12 = [v11 isGeometryEqualToLayoutInfo:v6];

      if (v12) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = [v5 isAnimating];
    if (v13)
    {
      if ((v14 & 1) == 0)
      {
        uint64_t v15 = [v5 layoutInfo];
        if (!v15)
        {
          uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1151, @"Invalid parameter not satisfying: %@", @"initialLayoutInfo != nil" object file lineNumber description];
        }
        [*(id *)(a1 + 48) prepareTileControllerForAnimation:v5 withInitialLayoutInfo:v15];
      }
      id v16 = [*(id *)(a1 + 40) optionsForAnimatingTileController:v5 toLayoutInfo:v6 withAnimationType:1];
      uint64_t v17 = [v5 willBeginAnimation];
      id v18 = *(void **)(a1 + 48);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_5;
      v24[3] = &unk_1E5F2E0A8;
      id v25 = v5;
      uint64_t v26 = v17;
      [v18 animateTileController:v25 toLayoutInfo:v6 withOptions:v16 completionHandler:v24];
    }
    else if (v14)
    {
      [*(id *)(a1 + 48) updateAnimationForTileController:v5 withRepositionedTargetLayoutInfo:v6];
    }
    else
    {
      [v5 applyLayoutInfo:v6];
    }
    [v5 setLayoutInfo:v6];
  }
LABEL_22:

  return v7 ^ 1u;
}

void __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 disappearanceAssertionsEnabled])
  {
    if ([v3 isDetached])
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1172, @"Invalid parameter not satisfying: %@", @"[disappearingTileController isDetached] == NO" object file lineNumber description];
    }
    if ([v3 isReusable])
    {
      char v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1173, @"Invalid parameter not satisfying: %@", @"[disappearingTileController isReusable] == NO" object file lineNumber description];
    }
    if (([v3 isActive] & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1174, @"Invalid parameter not satisfying: %@", @"[disappearingTileController isActive] == YES" object file lineNumber description];
    }
  }
  [v3 setActive:0];
  id v4 = [v3 layoutInfo];
  id v5 = [*(id *)(a1 + 40) finalLayoutInfoForDisappearingTileController:v3 fromLayoutInfo:v4];
  id v6 = v5;
  if (v5)
  {
    if (([v5 isEqual:v4] & 1) == 0)
    {
      int v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PUTilingView.m", 1181, @"Invalid parameter not satisfying: %@", @"[finalLayoutInfo isEqual:layoutInfo]" object file lineNumber description];
    }
    if (([v3 isAnimating] & 1) == 0) {
      [*(id *)(a1 + 48) prepareTileControllerForAnimation:v3 withInitialLayoutInfo:v4];
    }
    int v7 = [*(id *)(a1 + 40) optionsForAnimatingTileController:v3 toLayoutInfo:v6 withAnimationType:3];
    uint64_t v8 = [v3 willBeginAnimation];
    id v9 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_7;
    v15[3] = &unk_1E5F2E0A8;
    id v10 = v3;
    id v16 = v10;
    uint64_t v17 = v8;
    [v9 animateTileController:v10 toLayoutInfo:v6 withOptions:v7 completionHandler:v15];
    [v10 setLayoutInfo:v6];
  }
  else
  {
    [v3 reuseIfApplicable];
  }
}

void __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_8(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 disappearanceAssertionsEnabled])
  {
    if ([v7 isDetached])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PUTilingView.m", 1198, @"Invalid parameter not satisfying: %@", @"[inactiveTileController isDetached] == NO" object file lineNumber description];
    }
    if ([v7 isReusable])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PUTilingView.m", 1199, @"Invalid parameter not satisfying: %@", @"[inactiveTileController isReusable] == NO" object file lineNumber description];
    }
    if ([v7 isActive])
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PUTilingView.m", 1200, @"Invalid parameter not satisfying: %@", @"[inactiveTileController isActive] == NO" object file lineNumber description];
    }
  }
  id v3 = [v7 layoutInfo];
  if ([v7 isAnimating]) {
    [*(id *)(a1 + 40) updateAnimationForTileController:v7 withRepositionedTargetLayoutInfo:v3];
  }
  else {
    [v7 applyLayoutInfo:v3];
  }
}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndAnimation:*(void *)(a1 + 40)];
}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndAnimation:*(void *)(a1 + 40)];
}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndAnimation:*(void *)(a1 + 40)];
}

- (void)_updateTileControllersIfNeeded
{
  if ([(PUTilingView *)self _needsUpdateTileControllers])
  {
    [(PUTilingView *)self _setNeedsUpdateTileControllers:0];
    id v3 = [(PUTilingView *)self window];

    if (v3)
    {
      id v3 = [(PUTilingView *)self _tileTransitionCoordinatorForNextLayout];
    }
    [(PUTilingView *)self _setTileTransitionCoordinatorForNextLayout:0];
    id v4 = [(PUTilingView *)self layout];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__PUTilingView__updateTileControllersIfNeeded__block_invoke;
    v10[3] = &unk_1E5F2E908;
    v10[4] = self;
    id v11 = v4;
    id v12 = v3;
    id v5 = v3;
    id v6 = v4;
    id v7 = +[PUAnimationGroup animationGroupWithAnimations:v10];
    uint64_t v8 = [(PUTilingView *)self onNextTileControllersUpdateBlock];
    if (v8)
    {
      [(PUTilingView *)self setOnNextTileControllersUpdateBlock:0];
      ((void (**)(void, void *))v8)[2](v8, v7);
    }
    if (self->_tileUseDelegateFlags.respondsToDidUpdateTileControllers)
    {
      id v9 = [(PUTilingView *)self tileUseDelegate];
      [v9 tilingViewDidUpdateTileControllers:self];
    }
  }
}

uint64_t __46__PUTilingView__updateTileControllersIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTileControllersWithLayout:*(void *)(a1 + 40) tileTransitionCoordinator:*(void *)(a1 + 48)];
}

- (void)_updateScrollViewPropertiesWithLayout:(id)a3
{
  id v35 = a3;
  [v35 contentBounds];
  double v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v12 = [v35 coordinateSystem];
  uint64_t v13 = [(PUTilingView *)self contentCoordinateSystem];
  double v14 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v12, v13, v5, v7);
  CGFloat v16 = v15;

  v37.origin.x = v14;
  v37.origin.y = v16;
  v37.size.width = v9;
  v37.size.height = v11;
  double MaxX = CGRectGetMaxX(v37);
  v38.origin.x = v14;
  v38.origin.y = v16;
  v38.size.width = v9;
  v38.size.height = v11;
  double MaxY = CGRectGetMaxY(v38);
  uint64_t v17 = MEMORY[0x1E4FB2848];
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v9;
  v39.size.height = v11;
  double MinX = CGRectGetMinX(v39);
  v40.origin.x = v14;
  v40.origin.y = v16;
  v40.size.width = v9;
  v40.size.height = v11;
  double MinY = CGRectGetMinY(v40);
  if (!self->_scrollDelegateFlags.respondsToScrollInfoWithLayout
    || ([(PUTilingView *)self scrollDelegate],
        id v20 = objc_claimAutoreleasedReturnValue(),
        [v20 tilingView:self scrollInfoWithLayout:v35],
        id v21 = objc_claimAutoreleasedReturnValue(),
        v20,
        !v21))
  {
    id v21 = [v35 preferredScrollInfo];
  }
  double v22 = *(double *)(v17 + 16);
  double v23 = *(double *)(v17 + 24);
  unint64_t v24 = [v21 scrollDirections];
  unsigned int v25 = [v21 shouldEnablePaging];
  [v21 interpageSpacing];
  double v27 = v26;
  double v29 = v28;
  double v30 = +[PUTilingViewSettings sharedInstance];
  int v31 = [v30 allowPaging];

  unint64_t v32 = v24 & 4;
  if (((v24 >> 1) & 1) != [(PUTilingView *)self alwaysBounceHorizontal]
    || (v32 >> 2) != [(PUTilingView *)self alwaysBounceVertical])
  {
    [(PUTilingView *)self contentOffset];
    -[PUTilingView setContentOffset:animated:](self, "setContentOffset:animated:", 0);
  }
  -[PUTilingView setContentSize:](self, "setContentSize:", MaxX, MaxY);
  -[PUTilingView setContentInset:](self, "setContentInset:", -MinY, -MinX, v22, v23);
  [(PUTilingView *)self setAlwaysBounceHorizontal:(v24 & 2) != 0];
  [(PUTilingView *)self setAlwaysBounceVertical:v32 != 0];
  [(PUTilingView *)self setPagingEnabled:v31 & v25];
  -[PUTilingView _setInterpageSpacing:](self, "_setInterpageSpacing:", v27, v29);
  -[PUTilingView _setPagingOrigin:](self, "_setPagingOrigin:", MinX, MinY);
  [v21 pagingSpringPullAdjustment];
  -[PUTilingView _setPagingSpringPullAdjustment:](self, "_setPagingSpringPullAdjustment:");
  [v21 pagingFrictionAdjustment];
  -[PUTilingView _setPagingFrictionAdjustment:](self, "_setPagingFrictionAdjustment:");
  [(PUTilingView *)self _adjustScrollViewPagingDeceleration];
}

- (void)_updateScrollViewPropertiesIfNeeded
{
  if ([(PUTilingView *)self _needsUpdateScrollViewProperties])
  {
    [(PUTilingView *)self _setNeedsUpdateScrollViewProperties:0];
    id v3 = [(PUTilingView *)self layout];
    [(PUTilingView *)self _updateScrollViewPropertiesWithLayout:v3];
  }
}

- (void)_updateTileControllersVisibleRectIfNeeded
{
  if ([(PUTilingView *)self _needsUpdateTileControllersVisibleRect])
  {
    [(PUTilingView *)self _setNeedsUpdateTileControllersVisibleRect:0];
    [(PUTilingView *)self _enumerateActiveTileControllersUsingBlock:&__block_literal_global_112];
  }
}

void __57__PUTilingView__updateTileControllersVisibleRectIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 wantsVisibleRectChanges]) {
    [v2 didChangeVisibleRect];
  }
}

- (void)_updateLayoutVisibleRectIfNeeded
{
  if ([(PUTilingView *)self _needsUpdateLayoutVisibleRect])
  {
    [(PUTilingView *)self _setNeedsUpdateLayoutVisibleRect:0];
    id v3 = [(PUTilingView *)self _pendingLayout];
    double v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(PUTilingView *)self layout];
    }
    id v18 = v5;

    [(PUTilingView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [v18 parentCoordinateSystem];

    if (v14)
    {
      double v15 = [(PUTilingView *)self contentCoordinateSystem];
      CGFloat v16 = [v18 coordinateSystem];
      double v7 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v15, v16, v7, v9);
      double v9 = v17;
    }
    objc_msgSend(v18, "setVisibleRect:", v7, v9, v11, v13);
  }
}

- (void)_updateLayoutCoordinateSystemIfNeeded
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([(PUTilingView *)self _needsUpdateLayoutCoordinateSystem])
  {
    [(PUTilingView *)self _setNeedsUpdateLayoutCoordinateSystem:0];
    int64_t v4 = [(PUTilingView *)self _reasonForNextLayoutCoordinateSystemUpdate];
    [(PUTilingView *)self _setReasonForNextLayoutCoordinateSystemUpdate:0];
    id v5 = [(PUTilingView *)self layout];
    double v6 = [v5 parentCoordinateSystem];

    double v7 = [MEMORY[0x1E4F1CA48] array];
    double v8 = [v5 parentCoordinateSystem];

    if (v8)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __53__PUTilingView__updateLayoutCoordinateSystemIfNeeded__block_invoke;
      v43[3] = &unk_1E5F2CC20;
      id v44 = v5;
      v45 = self;
      id v46 = v7;
      [(PUTilingView *)self _enumerateAllTileControllersUsingBlock:v43];
    }
    double v9 = [(PUTilingView *)self contentCoordinateSystem];
    [v5 setParentCoordinateSystem:v9];

    if ([(PUTilingView *)self isDecelerating]
      && [(PUTilingView *)self isPagingEnabled])
    {
      [(PUTilingView *)self _pageDecelerationTarget];
    }
    else
    {
      [(PUTilingView *)self contentOffset];
    }
    double v12 = v10;
    double v13 = v11;
    double v15 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if ((unint64_t)(v4 - 2) < 2)
    {
      double v17 = [(PUTilingView *)self fixedCoordinateSystem];
      id v18 = [v5 coordinateSystem];
      double v15 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v17, v18, v15, v14);
      double v14 = v19;

      if (self->_scrollDelegateFlags.respondsToTargetVisibleOriginForProposedVisibleOrigin)
      {
        id v20 = [(PUTilingView *)self scrollDelegate];
        objc_msgSend(v20, "tilingView:targetVisibleOriginForProposedVisibleOrigin:withLayout:", self, v5, v15, v14);
        double v22 = v21;
        double v24 = v23;

        BOOL v25 = v22 != v15;
        if (v24 != v14) {
          BOOL v25 = 1;
        }
        if (!v6) {
          BOOL v25 = 1;
        }
        BOOL v38 = v25;
        double v14 = v24;
        double v15 = v22;
      }
      else
      {
        BOOL v38 = v6 == 0;
      }
    }
    else
    {
      BOOL v38 = v6 == 0;
      if (v4 == 1)
      {
        if (self->_scrollDelegateFlags.respondsToInitialVisibleOriginWithLayout)
        {
          double v26 = [(PUTilingView *)self scrollDelegate];
          [v26 tilingView:self initialVisibleOriginWithLayout:v5];
          double v15 = v27;
          double v14 = v28;
        }
      }
      else if (!v4)
      {
        CGFloat v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"PUTilingView.m" lineNumber:940 description:@"no valid reason to update coordinate system"];
      }
    }
    objc_msgSend(v5, "setCoordinateSystemOrigin:", v12 - v15, v13 - v14);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v29 = v7;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v35 = [v34 layoutInfo];
          v36 = [v5 coordinateSystem];
          CGRect v37 = [v35 layoutInfoWithCoordinateSystem:v36];

          [v34 setLayoutInfo:v37];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v31);
    }

    if (v38)
    {
      [(PUTilingView *)self _invalidateLayoutVisibleRect];
      [(PUTilingView *)self _updateLayoutVisibleRectIfNeeded];
      [(PUTilingView *)self _updateLayoutIfNeeded];
    }
  }
}

void __53__PUTilingView__updateLayoutCoordinateSystemIfNeeded__block_invoke(id *a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 layoutInfo];
  int64_t v4 = [v3 coordinateSystem];
  id v5 = [a1[4] coordinateSystem];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    double v7 = [a1[5] fixedCoordinateSystem];
    uint64_t v8 = [v3 layoutInfoWithCoordinateSystem:v7];

    [v9 setLayoutInfo:v8];
    [a1[6] addObject:v9];
    id v3 = (void *)v8;
  }
}

- (void)_updateLayoutIfNeeded
{
  if ([(PUTilingView *)self _needsUpdateLayout])
  {
    [(PUTilingView *)self _setNeedsUpdateLayout:0];
    id v10 = [(PUTilingView *)self _pendingLayout];
    if (v10)
    {
      id v3 = [(PUTilingView *)self layout];
      [(PUTilingView *)self _setPendingLayout:0];
      [(PUTilingView *)self _setLayout:v10];
      [v10 setTilingView:self];
      int64_t v4 = [v3 dataSource];
      id v5 = [v10 dataSource];
      int v6 = v5;
      if (v5 != v4 && ([v5 isEqual:v4] & 1) == 0)
      {
        if (self->_tileTransitionDelegateFlags.respondsToDataSourceConverterForTransitionFromLayoutToLayout)
        {
          double v7 = [(PUTilingView *)self tileTransitionDelegate];
          uint64_t v8 = [v7 tilingView:self dataSourceConverterForTransitionFromLayout:v3 toLayout:v10];
        }
        else
        {
          uint64_t v8 = objc_alloc_init(PUTilingDataSourceConverter);
        }
        [(PUTilingView *)self _transferTileControllersToDataSource:v6 usingDataSourceConverter:v8];
      }
    }
    id v9 = [(PUTilingView *)self layout];
    [v9 prepareLayout];
  }
}

- (void)_updateIfNeeded
{
  [(PUTilingView *)self _updateLayoutVisibleRectIfNeeded];
  [(PUTilingView *)self _updateLayoutIfNeeded];
  [(PUTilingView *)self _updateLayoutCoordinateSystemIfNeeded];
  [(PUTilingView *)self _updateScrollViewPropertiesIfNeeded];
  [(PUTilingView *)self _updateTileControllersIfNeeded];
  [(PUTilingView *)self _updateTileControllersVisibleRectIfNeeded];
  [(PUTilingView *)self _updateReferencedDataSourcesIfNeeded];
  [(PUTilingView *)self _updateReferencedCoordinateSystemsIfNeeded];
  [(PUTilingView *)self _runPostLayoutBlocks];
}

- (void)_invalidateTileControllersWithTileTransitionCoordinator:(id)a3
{
  [(PUTilingView *)self _setTileTransitionCoordinatorForNextLayout:a3];
  [(PUTilingView *)self _setNeedsUpdateTileControllers:1];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateTileControllers
{
  [(PUTilingView *)self _setNeedsUpdateTileControllers:1];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateReferencedCoordinateSystems
{
  [(PUTilingView *)self _setNeedsUpdateReferencedCoordinateSystems:1];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateReferencedDataSources
{
  [(PUTilingView *)self _setNeedsUpdateReferencedDataSources:1];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateScrollViewProperties
{
  [(PUTilingView *)self _setNeedsUpdateScrollViewProperties:1];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateLayout
{
  [(PUTilingView *)self _setNeedsUpdateLayout:1];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateLayoutCoordinateSystemWithReason:(int64_t)a3
{
  [(PUTilingView *)self _setNeedsUpdateLayoutCoordinateSystem:1];
  [(PUTilingView *)self _setReasonForNextLayoutCoordinateSystemUpdate:a3];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateTileControllersVisibleRect
{
  [(PUTilingView *)self _setNeedsUpdateTileControllersVisibleRect:1];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)_invalidateLayoutVisibleRect
{
  [(PUTilingView *)self _setNeedsUpdateLayoutVisibleRect:1];
  [(PUTilingView *)self _invalidateTileControllersVisibleRect];
  [(PUTilingView *)self _setNeedsUpdate];
}

- (void)invalidateLayout:(id)a3 withContext:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v13)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUTilingView.m", 782, @"Invalid parameter not satisfying: %@", @"layout != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  double v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"PUTilingView.m", 783, @"Invalid parameter not satisfying: %@", @"invalidationContext != nil" object file lineNumber description];

LABEL_3:
  id v8 = [(PUTilingView *)self layout];

  if (v8 == v13)
  {
    [(PUTilingView *)self _invalidateLayout];
    if ([v7 invalidatedContentBounds]) {
      [(PUTilingView *)self _invalidateScrollViewProperties];
    }
    if ([v7 invalidatedAnyTile])
    {
      if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForLayoutInvalidationContext
        && ([(PUTilingView *)self tileTransitionDelegate],
            id v9 = objc_claimAutoreleasedReturnValue(),
            [v9 tilingView:self tileTransitionCoordinatorForLayoutInvalidationContext:v7],
            id v10 = objc_claimAutoreleasedReturnValue(),
            v9,
            v10))
      {
        [(PUTilingView *)self _invalidateTileControllersWithTileTransitionCoordinator:v10];
      }
      else
      {
        [(PUTilingView *)self _invalidateTileControllers];
      }
    }
  }
}

- (BOOL)isAnyTileControllerAnimating
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PUTilingView_isAnyTileControllerAnimating__block_invoke;
  v4[3] = &unk_1E5F2CBF8;
  v4[4] = &v5;
  [(PUTilingView *)self _enumerateAllTileControllersUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__PUTilingView_isAnyTileControllerAnimating__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isAnimating];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)_createTileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSource:(id)a5 tileSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUTilingView.m", 762, @"Invalid parameter not satisfying: %@", @"tileSource != nil" object file lineNumber description];
  }
  double v15 = [v14 tilingView:self tileControllerWithIndexPath:v11 kind:v12 dataSource:v13];
  if (!v15)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PUTilingView.m", 764, @"no tile controller returned for {%@, %@}", v11, v12 object file lineNumber description];
  }
  return v15;
}

- (void)_enumerateActiveTileControllersUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUTilingView.m", 750, @"Invalid parameter not satisfying: %@", @"enumerationBlock != NULL" object file lineNumber description];
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  int v6 = [(PUTilingView *)self _activeTileControllers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PUTilingView__enumerateActiveTileControllersUsingBlock___block_invoke;
  v9[3] = &unk_1E5F2CBA8;
  id v7 = v5;
  id v10 = v7;
  id v11 = v12;
  [v6 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(v12, 8);
}

uint64_t __58__PUTilingView__enumerateActiveTileControllersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (void)_enumerateAllTileControllersUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUTilingView.m", 730, @"Invalid parameter not satisfying: %@", @"enumerationBlock != NULL" object file lineNumber description];
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke;
  aBlock[3] = &unk_1E5F2CBD0;
  id v14 = v15;
  id v6 = v5;
  id v13 = v6;
  id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  char v8 = [(PUTilingView *)self _activeTileControllers];
  v7[2](v7, v8);

  id v9 = [(PUTilingView *)self _inactiveTileControllers];
  v7[2](v7, v9);

  id v10 = [(PUTilingView *)self _detachedTileControllers];
  v7[2](v7, v10);

  _Block_object_dispose(v15, 8);
}

void __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke_2;
    v6[3] = &unk_1E5F2CBA8;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    [a2 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (void)enumerateAllTileControllersUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUTilingView.m", 722, @"Invalid parameter not satisfying: %@", @"enumerationBlock != NULL" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PUTilingView_enumerateAllTileControllersUsingBlock___block_invoke;
  v8[3] = &unk_1E5F2CB80;
  id v9 = v5;
  id v6 = v5;
  [(PUTilingView *)self _enumerateAllTileControllersUsingBlock:v8];
}

uint64_t __54__PUTilingView_enumerateAllTileControllersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)tileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v34 = 0;
  id v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000;
  CGRect v37 = __Block_byref_object_copy__92873;
  BOOL v38 = __Block_byref_object_dispose__92874;
  id v39 = [(PUTilingView *)self presentedTileControllerWithIndexPath:v8 kind:v9 dataSourceIdentifier:v10];
  id v11 = v35[5];
  if (!v11)
  {
    id v12 = [(PUTilingView *)self layout];
    id v13 = [v12 layoutInfoForTileWithIndexPath:v8 kind:v9];

    if (v13)
    {
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x3032000000;
      uint64_t v31 = __Block_byref_object_copy__92873;
      uint64_t v32 = __Block_byref_object_dispose__92874;
      id v33 = 0;
      id v14 = [(PUTilingView *)self _inactiveTileControllers];
      double v15 = [v13 tileIdentifier];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__PUTilingView_tileControllerWithIndexPath_kind_dataSourceIdentifier___block_invoke;
      v27[3] = &unk_1E5F2CB58;
      v27[4] = &v34;
      void v27[5] = &v28;
      [v14 enumerateObjectsWithTileIdentifier:v15 usingBlock:v27];

      if (!v35[5])
      {
        char v16 = (void *)v29[5];
        if (!v16 || (objc_storeStrong(v35 + 5, v16), !v35[5]))
        {
          double v17 = [v13 dataSourceIdentifier];
          id v18 = [(PUTilingView *)self _dataSourceWithIdentifier:v17];

          double v19 = [(PUTilingView *)self tileSource];
          uint64_t v20 = [(PUTilingView *)self _createTileControllerWithIndexPath:v8 kind:v9 dataSource:v18 tileSource:v19];
          id v21 = v35[5];
          v35[5] = (id)v20;

          double v22 = [(PUTilingView *)self _inactiveTileControllers];
          id v23 = v35[5];
          double v24 = [v13 tileIdentifier];
          [v22 addObject:v23 withTileIdentifier:v24];
        }
      }
      _Block_object_dispose(&v28, 8);
    }
    id v11 = v35[5];
  }
  id v25 = v11;
  _Block_object_dispose(&v34, 8);

  return v25;
}

void __70__PUTilingView_tileControllerWithIndexPath_kind_dataSourceIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (([v6 isAnimating] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)enumeratePresentedTileControllersInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a4;
  if (!v10)
  {
    double v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PUTilingView.m", 648, @"Invalid parameter not satisfying: %@", @"enumerationBlock != NULL" object file lineNumber description];
  }
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__PUTilingView_enumeratePresentedTileControllersInRect_usingBlock___block_invoke;
  v28[3] = &unk_1E5F2CB10;
  v28[4] = self;
  CGFloat v30 = x;
  CGFloat v31 = y;
  CGFloat v32 = width;
  CGFloat v33 = height;
  id v12 = v11;
  id v29 = v12;
  [(PUTilingView *)self _enumerateAllTileControllersUsingBlock:v28];
  id v13 = [v12 allKeys];
  id v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_92952];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
LABEL_5:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * v19);
      id v21 = [v12 objectForKeyedSubscript:v20];
      unsigned __int8 v23 = 0;
      v10[2](v10, v21, v20, &v23);
      LODWORD(v20) = v23;

      if (v20) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v17) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

void __67__PUTilingView_enumeratePresentedTileControllersInRect_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  id v3 = [v26 layoutInfo];

  if (v3)
  {
    id v4 = [v26 presentationLayoutInfo];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [v4 hitTestOutset];
    PXEdgeInsetsInvert();
    double v14 = v6 + v13;
    double v16 = v8 + v15;
    CGFloat v18 = v10 - (v13 + v17);
    CGFloat v20 = v12 - (v15 + v19);
    id v21 = [v4 coordinateSystem];
    double v22 = [*(id *)(a1 + 32) contentCoordinateSystem];
    double v23 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v21, v22, v14, v16);
    CGFloat v25 = v24;

    v28.origin.CGFloat x = v23;
    v28.origin.CGFloat y = v25;
    v28.size.CGFloat width = v18;
    v28.size.CGFloat height = v20;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v28) && [v26 isPresentationActive]) {
      [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:v4];
    }
  }
}

uint64_t __67__PUTilingView_enumeratePresentedTileControllersInRect_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 zPosition];
  unint64_t v6 = v5;
  [v4 zPosition];
  unint64_t v8 = v7;

  v9.n128_u64[0] = v6;
  v10.n128_u64[0] = v8;
  return MEMORY[0x1F41443B0](v9, v10);
}

- (id)presentedTileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSourceIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v8 && v9 && v10)
  {
    double v12 = [[PUTileIdentifier alloc] initWithIndexPath:v8 tileKind:v9 dataSourceIdentifier:v10];
    double v13 = [(PUTilingView *)self _activeTileControllers];
    double v14 = [v13 objectWithTileIdentifier:v12];

    if (!v14)
    {
      double v15 = [(PUTilingView *)self _detachedTileControllers];
      double v14 = [v15 objectWithTileIdentifier:v12];
    }
  }
  else
  {
    double v16 = PLOneUpGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      double v23 = v11;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEBUG, "presentedTileControllerWithIndexPath invoked with indexPath %@ tileKind %@ dataSourceIdentifier %@", (uint8_t *)&v18, 0x20u);
    }

    double v14 = 0;
  }

  return v14;
}

- (void)reattachTileControllers:(id)a3 withContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v12 isDetached])
        {
          if (([v12 isActive] & 1) == 0)
          {
            double v16 = [MEMORY[0x1E4F28B00] currentHandler];
            [v16 handleFailureInMethod:a2, self, @"PUTilingView.m", 608, @"Invalid parameter not satisfying: %@", @"[tileController isActive] == YES" object file lineNumber description];
          }
          double v13 = [v12 presentationLayoutInfo];
          double v14 = [(PUTilingView *)self _detachedTileControllers];
          double v15 = [v13 tileIdentifier];
          [v14 removeObject:v12 withTileIdentifier:v15];

          [v12 setDetached:0];
          [v12 setLayoutInfo:v13];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForReattachedTileControllers)
  {
    double v17 = [(PUTilingView *)self tileTransitionDelegate];
    int v18 = [v17 tilingView:self tileTransitionCoordinatorForReattachedTileControllers:v6 context:v7];
  }
  else
  {
    int v18 = 0;
  }
  [(PUTilingView *)self _invalidateTileControllersWithTileTransitionCoordinator:v18];
  [(PUTilingView *)self _invalidateReferencedDataSources];
  [(PUTilingView *)self _invalidateReferencedCoordinateSystems];
  [(PUTilingView *)self _updateIfNeeded];
}

- (id)freezeTileController:(id)a3
{
  id v5 = a3;
  id v6 = [v5 tilingView];

  if (v6 != self)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUTilingView.m", 595, @"Invalid parameter not satisfying: %@", @"[tileController tilingView] == self" object file lineNumber description];
  }
  id v7 = [(PUTilingView *)self tileAnimator];
  uint64_t v8 = v7;
  if (v7) {
    [v7 freezeTileController:v5];
  }
  else {
  uint64_t v9 = [v5 freeze];
  }

  return v9;
}

- (void)detachTileControllers:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v10 isDetached] & 1) == 0)
        {
          double v11 = [v10 layoutInfo];
          if (!v11)
          {
            double v14 = [MEMORY[0x1E4F28B00] currentHandler];
            [v14 handleFailureInMethod:a2, self, @"PUTilingView.m", 581, @"Invalid parameter not satisfying: %@", @"layoutInfo != nil" object file lineNumber description];
          }
          double v12 = [(PUTilingView *)self _detachedTileControllers];
          double v13 = [v11 tileIdentifier];
          [v12 addObject:v10 withTileIdentifier:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }
  [(PUTilingView *)self _invalidateTileControllersWithTileTransitionCoordinator:0];
  [(PUTilingView *)self _updateIfNeeded];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if (([v20 isActive] & 1) == 0)
        {
          long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:a2, self, @"PUTilingView.m", 589, @"Invalid parameter not satisfying: %@", @"[tileController isActive] == YES" object file lineNumber description];
        }
        [v20 setDetached:1];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
}

- (void)_applyPendingUpdates
{
  id v3 = [(PUTilingView *)self _pendingUpdateItems];
  id v4 = [(PUTilingView *)self layout];
  [v4 invalidateLayoutForUpdateWithItems:v3];
  [(PUTilingView *)self _invalidateLayoutCoordinateSystemWithReason:3];
  [(PUTilingView *)self _invalidateLayout];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __36__PUTilingView__applyPendingUpdates__block_invoke;
  id v15 = &unk_1E5F2CAE8;
  uint64_t v16 = self;
  id v5 = v3;
  id v17 = v5;
  uint64_t v6 = (void (**)(void *, void *))_Block_copy(&v12);
  uint64_t v7 = [(PUTilingView *)self _activeTileControllers];
  v6[2](v6, v7);

  uint64_t v8 = [(PUTilingView *)self _inactiveTileControllers];
  v6[2](v6, v8);

  uint64_t v9 = [(PUTilingView *)self _detachedTileControllers];
  v6[2](v6, v9);

  if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForUpdateWithItems)
  {
    uint64_t v10 = [(PUTilingView *)self tileTransitionDelegate];
    double v11 = [v10 tilingView:self tileTransitionCoordinatorForUpdateWithItems:v5];
  }
  else
  {
    double v11 = 0;
  }
  [(PUTilingView *)self _invalidateTileControllersWithTileTransitionCoordinator:v11];
  [v5 removeAllObjects];
}

void __36__PUTilingView__applyPendingUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 copy];
  [v3 removeAllObjects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__PUTilingView__applyPendingUpdates__block_invoke_2;
  v8[3] = &unk_1E5F2CAC0;
  id v5 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v4;
  id v11 = v3;
  id v6 = v3;
  id v7 = v4;
  [v7 enumerateObjectsUsingBlock:v8];
}

void __36__PUTilingView__applyPendingUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 indexPath];
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v6 dataSourceIdentifier];
  id v10 = [v8 _dataSourceWithIdentifier:v9];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
LABEL_3:
    uint64_t v15 = 0;
    uint64_t v16 = v7;
    while (1)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v11);
      }
      id v7 = [*(id *)(*((void *)&v32 + 1) + 8 * v15) transformedIndexPath:v16 withDataSource:v10];

      if (!objc_msgSend(v7, "pu_isValid")) {
        break;
      }
      ++v15;
      uint64_t v16 = v7;
      if (v13 == v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v17 = [v6 indexPath];
  char v18 = [v7 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    id v19 = [v5 layoutInfo];
    long long v20 = [v19 tileKind];
    long long v21 = [v19 dataSourceIdentifier];
    if ([*(id *)(a1 + 48) useUniqueLeafs] && (objc_msgSend(v7, "pu_isValid") & 1) == 0)
    {
      id v31 = v5;
      while (1)
      {
        long long v22 = *(void **)(a1 + 56);
        long long v23 = [[PUTileIdentifier alloc] initWithIndexPath:v7 tileKind:v20 dataSourceIdentifier:v21];
        long long v24 = [v22 objectWithTileIdentifier:v23];

        if (!v24) {
          break;
        }
        uint64_t v25 = [v7 indexPathByAddingIndex:0x7FFFFFFFFFFFFFFFLL];

        id v7 = (void *)v25;
      }
      id v5 = v31;
    }
    long long v26 = [v19 layoutInfoWithIndexPath:v7 tileKind:v20 dataSourceIdentifier:v21];

    [v5 setLayoutInfo:v26];
  }
  long long v27 = [PUTileIdentifier alloc];
  long long v28 = [v6 tileKind];
  long long v29 = [v6 dataSourceIdentifier];
  CGFloat v30 = [(PUTileIdentifier *)v27 initWithIndexPath:v7 tileKind:v28 dataSourceIdentifier:v29];

  [*(id *)(a1 + 56) addObject:v5 withTileIdentifier:v30];
}

- (void)reloadItemAtIndexPath:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PUTilingView_reloadItemAtIndexPath_dataSource___block_invoke;
  v10[3] = &unk_1E5F2E908;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(PUTilingView *)self performBatchUpdates:v10];
}

void __49__PUTilingView_reloadItemAtIndexPath_dataSource___block_invoke(uint64_t a1)
{
  id v3 = [[PUTilingViewUpdateItem alloc] initWithAction:4 indexPathBeforeUpdate:*(void *)(a1 + 32) indexPathAfterUpdate:0 dataSource:*(void *)(a1 + 40)];
  char v2 = [*(id *)(a1 + 48) _pendingUpdateItems];
  [v2 addObject:v3];
}

- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PUTilingView_moveItemFromIndexPath_toIndexPath_dataSource___block_invoke;
  v14[3] = &unk_1E5F2D098;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  char v18 = self;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PUTilingView *)self performBatchUpdates:v14];
}

void __61__PUTilingView_moveItemFromIndexPath_toIndexPath_dataSource___block_invoke(uint64_t a1)
{
  id v3 = [[PUTilingViewUpdateItem alloc] initWithAction:3 indexPathBeforeUpdate:*(void *)(a1 + 32) indexPathAfterUpdate:*(void *)(a1 + 40) dataSource:*(void *)(a1 + 48)];
  char v2 = [*(id *)(a1 + 56) _pendingUpdateItems];
  [v2 addObject:v3];
}

- (void)deleteItemAtIndexPath:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PUTilingView_deleteItemAtIndexPath_dataSource___block_invoke;
  v10[3] = &unk_1E5F2E908;
  id v11 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(PUTilingView *)self performBatchUpdates:v10];
}

void __49__PUTilingView_deleteItemAtIndexPath_dataSource___block_invoke(uint64_t a1)
{
  id v3 = [[PUTilingViewUpdateItem alloc] initWithAction:2 indexPathBeforeUpdate:*(void *)(a1 + 32) indexPathAfterUpdate:0 dataSource:*(void *)(a1 + 40)];
  char v2 = [*(id *)(a1 + 48) _pendingUpdateItems];
  [v2 addObject:v3];
}

- (void)insertItemAtIndexPath:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PUTilingView_insertItemAtIndexPath_dataSource___block_invoke;
  v10[3] = &unk_1E5F2E908;
  id v11 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(PUTilingView *)self performBatchUpdates:v10];
}

void __49__PUTilingView_insertItemAtIndexPath_dataSource___block_invoke(uint64_t a1)
{
  id v3 = [[PUTilingViewUpdateItem alloc] initWithAction:1 indexPathBeforeUpdate:0 indexPathAfterUpdate:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
  char v2 = [*(id *)(a1 + 48) _pendingUpdateItems];
  [v2 addObject:v3];
}

- (void)performBatchUpdates:(id)a3
{
  id v7 = (void (**)(void))a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUTilingView.m", 470, @"Invalid parameter not satisfying: %@", @"updates != NULL" object file lineNumber description];
  }
  BOOL v5 = [(PUTilingView *)self _isPerformingBatchUpdates];
  [(PUTilingView *)self _setPerformingBatchUpdates:1];
  v7[2]();
  [(PUTilingView *)self _setPerformingBatchUpdates:v5];
  if (!v5) {
    [(PUTilingView *)self _applyPendingUpdates];
  }
}

- (void)transitionToLayout:(id)a3 withContext:(id)a4 animationSetupCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUTilingView.m", 431, @"Invalid parameter not satisfying: %@", @"layout != nil" object file lineNumber description];
  }
  [(PUTilingView *)self _setPendingLayout:0];
  id v12 = [(PUTilingView *)self layout];
  if (v12 != v9)
  {
    [(PUTilingView *)self _setPendingLayout:v9];
    [(PUTilingView *)self _invalidateLayout];
    [(PUTilingView *)self _invalidateReferencedDataSources];
    [(PUTilingView *)self _invalidateReferencedCoordinateSystems];
    [(PUTilingView *)self _invalidateLayoutVisibleRect];
    [(PUTilingView *)self _invalidateLayoutCoordinateSystemWithReason:1];
    [(PUTilingView *)self _invalidateScrollViewProperties];
    if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForTransitionFromLayoutWithContext)
    {
      id v13 = [(PUTilingView *)self tileTransitionDelegate];
      uint64_t v14 = [v13 tilingView:self tileTransitionCoordinatorForTransitionFromLayout:v12 toLayout:v9 withContext:v10];

      if (!v11)
      {
LABEL_7:
        [(PUTilingView *)self _invalidateTileControllersWithTileTransitionCoordinator:v14];

        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v14 = 0;
      if (!v11) {
        goto LABEL_7;
      }
    }
    id v15 = [(PUTilingView *)self onNextTileControllersUpdateBlock];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__PUTilingView_transitionToLayout_withContext_animationSetupCompletionHandler___block_invoke;
    v18[3] = &unk_1E5F2CA98;
    id v19 = v15;
    id v20 = v11;
    id v16 = v15;
    [(PUTilingView *)self setOnNextTileControllersUpdateBlock:v18];

    goto LABEL_7;
  }
  if (v11) {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
LABEL_10:
}

void __79__PUTilingView_transitionToLayout_withContext_animationSetupCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)transitionToLayout:(id)a3
{
}

- (void)tileControllerDidEndAnimating:(id)a3
{
  id v4 = a3;
  if (self->_tileUseDelegateFlags.respondsToDidEndAnimatingTileControllers)
  {
    id v7 = v4;
    BOOL v5 = [(PUTilingView *)self isAnyTileControllerAnimating];
    id v4 = v7;
    if (!v5)
    {
      id v6 = [(PUTilingView *)self tileUseDelegate];
      [v6 tilingViewDidEndAnimatingTileControllers:self];

      id v4 = v7;
    }
  }
}

- (void)enqueueTileControllerForReuse:(id)a3
{
  id v20 = a3;
  [v20 becomeReusable];
  BOOL v5 = [v20 layoutInfo];
  if (!v5)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUTilingView.m", 395, @"Invalid parameter not satisfying: %@", @"layoutInfo != nil" object file lineNumber description];
  }
  id v6 = [(PUTilingView *)self _inactiveTileControllers];
  id v7 = [v5 tileIdentifier];
  [v6 removeObject:v20 withTileIdentifier:v7];

  id v8 = [v20 reuseIdentifier];
  id v9 = [(PUTilingView *)self _tileControllerReuseQueue];
  [v9 enqueueObjectForReuse:v20 withReuseIdentifier:v8];

  id v10 = [(PUTilingView *)self layout];
  id v11 = [v5 dataSourceIdentifier];
  id v12 = [v10 dataSource];
  id v13 = [v12 identifier];
  char v14 = [v11 isEqualToString:v13];

  if ((v14 & 1) == 0) {
    [(PUTilingView *)self _invalidateReferencedDataSources];
  }
  id v15 = [v5 coordinateSystem];
  id v16 = [v10 coordinateSystem];
  char v17 = [v15 isEqual:v16];

  if ((v17 & 1) == 0) {
    [(PUTilingView *)self _invalidateReferencedCoordinateSystems];
  }
  if (self->_tileUseDelegateFlags.respondsToDidStopUsingTileController)
  {
    char v18 = [(PUTilingView *)self tileUseDelegate];
    [v18 tilingView:self didStopUsingTileController:v20];
  }
}

- (id)dequeueTileControllerWithReuseIdentifier:(id)a3
{
  id v5 = a3;
  char v13 = 0;
  id v6 = [(PUTilingView *)self _tileControllerReuseQueue];
  id v7 = [v6 dequeueObjectWithReuseIdentifier:v5 isReused:&v13];

  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUTilingView.m", 374, @"No tile controller class has been registered for reuse identifier '%@'.", v5 object file lineNumber description];
  }
  if (v13)
  {
    [v7 prepareForReuse];
    id v8 = [v7 tilingView];

    if (v8 != self)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"PUTilingView.m", 381, @"Invalid parameter not satisfying: %@", @"[tileController tilingView] == self" object file lineNumber description];
    }
  }
  else
  {
    [v7 setTilingView:self];
    [v7 addToTilingView:self];
  }
  if (self->_tileUseDelegateFlags.respondsToWillStartUsingTileController)
  {
    id v10 = [(PUTilingView *)self tileUseDelegate];
    [v10 tilingView:self willStartUsingTileController:v7];
  }
  return v7;
}

- (void)registerTileControllerClass:(Class)a3 forReuseIdentifier:(id)a4
{
  id v7 = a4;
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUTilingView.m", 357, @"Invalid parameter not satisfying: %@", @"[tileControllerClass isSubclassOfClass:[PUTileController class]]" object file lineNumber description];
  }
  id v8 = [(PUTilingView *)self _tileControllerReuseQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PUTilingView_registerTileControllerClass_forReuseIdentifier___block_invoke;
  v11[3] = &unk_1E5F2CA70;
  id v12 = v7;
  Class v13 = a3;
  id v9 = v7;
  [v8 registerObjectCreationBlock:v11 withReuseIdentifier:v9];
}

id __63__PUTilingView_registerTileControllerClass_forReuseIdentifier___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithReuseIdentifier:*(void *)(a1 + 32)];
  return v1;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PUTilingView;
  [(PUTilingView *)&v3 didMoveToWindow];
  [(PXDisplayScreenDynamicRangeMonitor *)self->_screenDynamicRangeMonitor stopMonitoring];
  [(PUTilingView *)self _startHeadroomMonitoringIfPossible];
}

- (void)configureDynamicRangeProperties
{
  if (PXSupportsImageModulation())
  {
    uint64_t v3 = PXUserAllowFullHDR();
    [(PUTilingView *)self setShouldDisplayHDR:v3];
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F902A8] sharedInstance];
      -[PUTilingView setAllowEDRHeadroomMonitoring:](self, "setAllowEDRHeadroomMonitoring:", [v4 enableHeadroomMonitoring]);

      return;
    }
  }
  else
  {
    [(PUTilingView *)self setShouldDisplayHDR:0];
  }
  [(PUTilingView *)self setAllowEDRHeadroomMonitoring:0];
}

- (void)_startHeadroomMonitoringIfPossible
{
  uint64_t v3 = [(PUTilingView *)self window];

  if (v3)
  {
    objc_initWeak(&location, self);
    screenDynamicRangeMonitor = self->_screenDynamicRangeMonitor;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__PUTilingView__startHeadroomMonitoringIfPossible__block_invoke;
    v5[3] = &unk_1E5F2CA48;
    objc_copyWeak(&v6, &location);
    [(PXDisplayScreenDynamicRangeMonitor *)screenDynamicRangeMonitor startMonitoringWithScreenProvider:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

id __50__PUTilingView__startHeadroomMonitoringIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = [WeakRetained window];

  if (!v2)
  {
    uint64_t v3 = PLOneUpGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "Window not found, monitoring will not return accurate results", v6, 2u);
    }
  }
  id v4 = [v2 screen];

  return v4;
}

- (void)setAllowEDRHeadroomMonitoring:(BOOL)a3
{
  if (self->_allowEDRHeadroomMonitoring != a3)
  {
    self->_allowEDRHeadroomMonitoring = a3;
    screenDynamicRangeMonitor = self->_screenDynamicRangeMonitor;
    if (a3)
    {
      if (!screenDynamicRangeMonitor)
      {
        id v5 = (PXDisplayScreenDynamicRangeMonitor *)[objc_alloc(MEMORY[0x1E4F900F8]) initWithAutomaticApplicationStateTracking:1];
        id v6 = self->_screenDynamicRangeMonitor;
        self->_screenDynamicRangeMonitor = v5;
      }
      [(PUTilingView *)self _startHeadroomMonitoringIfPossible];
    }
    else
    {
      [(PXDisplayScreenDynamicRangeMonitor *)screenDynamicRangeMonitor stopMonitoring];
      id v7 = self->_screenDynamicRangeMonitor;
      self->_screenDynamicRangeMonitor = 0;
    }
  }
}

- (void)setLoadingInsets:(UIEdgeInsets)a3
{
  if (self->_loadingInsets.left != a3.left
    || self->_loadingInsets.top != a3.top
    || self->_loadingInsets.right != a3.right
    || self->_loadingInsets.bottom != a3.bottom)
  {
    self->_loadingInsets = a3;
    [(PUTilingView *)self _invalidateLayoutVisibleRect];
    [(PUTilingView *)self _invalidateTileControllers];
  }
}

- (void)_adjustScrollViewPagingDeceleration
{
  [(PUTilingView *)self bounds];
  double v4 = 1024.0;
  if (v3 <= 1024.0) {
    double v4 = v3;
  }
  double v5 = v4 * -0.000000184659091 + 0.000359090909;
  double v6 = v4 * 0.00000994318182 + 0.966818182;
  [(PUTilingView *)self _pagingSpringPullAdjustment];
  long double v8 = exp(v7 * 0.1) * v5;
  [(PUTilingView *)self _pagingFrictionAdjustment];
  long double v10 = 1.0 - (1.0 - v6) * exp(v9 * 0.1);
  id v11 = [NSNumber numberWithDouble:(double)v8];
  [(PUTilingView *)self setValue:v11 forKey:@"_pagingSpringPull"];

  id v12 = [NSNumber numberWithDouble:(double)v10];
  [(PUTilingView *)self setValue:v12 forKey:@"_pagingFriction"];
}

- (void)_handleChangeFromBounds:(CGRect)a3 fromFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  [(PUTilingView *)self _invalidateLayoutVisibleRect];
  [(PUTilingView *)self _invalidateTileControllers];
  [(PUTilingView *)self frame];
  if (width != v11 || height != v12)
  {
    double v14 = v9;
    double v15 = v10;
    double v16 = v11;
    double v17 = v12;
    double v22 = y;
    uint64_t v18 = 0;
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
    {
      [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
      uint64_t v18 = v19;
    }
    if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForChangeFromFrame)
    {
      id v20 = [(PUTilingView *)self tileTransitionDelegate];
      long long v21 = objc_msgSend(v20, "tilingView:tileTransitionCoordinatorForChangeFromFrame:toFrame:duration:", self, x, v22, width, height, v14, v15, v16, v17, v18);
    }
    else
    {
      long long v21 = 0;
    }
    [(PUTilingView *)self _invalidateLayoutCoordinateSystemWithReason:2];
    [(PUTilingView *)self _invalidateScrollViewProperties];
    [(PUTilingView *)self _invalidateTileControllersWithTileTransitionCoordinator:v21];
  }
  [(PUTilingView *)self _adjustScrollViewPagingDeceleration];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(PUTilingView *)self isUserInteractionEnabled])
  {
    uint64_t v23 = 0;
    long long v24 = (id *)&v23;
    uint64_t v25 = 0x3032000000;
    long long v26 = __Block_byref_object_copy__92873;
    long long v27 = __Block_byref_object_dispose__92874;
    id v28 = 0;
    if (-[PUTilingView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      objc_storeStrong(v24 + 5, self);
      [(PUTilingView *)self bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __34__PUTilingView_hitTest_withEvent___block_invoke;
      v18[3] = &unk_1E5F2CA20;
      double v21 = x;
      double v22 = y;
      void v18[4] = self;
      id v19 = v7;
      id v20 = &v23;
      -[PUTilingView enumeratePresentedTileControllersInRect:usingBlock:](self, "enumeratePresentedTileControllersInRect:usingBlock:", v18, v9, v11, v13, v15);
    }
    id v16 = v24[5];
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __34__PUTilingView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v14;
  if (isKindOfClass)
  {
    double v8 = [v14 view];
    objc_msgSend(v8, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v10 = v9;
    double v12 = v11;
    if ([v8 isUserInteractionEnabled])
    {
      double v13 = objc_msgSend(v8, "hitTest:withEvent:", *(void *)(a1 + 40), v10, v12);
      if (v13)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
        *a4 = 1;
      }
    }
    id v7 = v14;
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUTilingView;
  [(PUTilingView *)&v4 layoutSublayersOfLayer:a3];
  [(PUTilingView *)self _updateIfNeeded];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUTilingView *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  v26.origin.double x = v9;
  v26.origin.double y = v11;
  v26.size.double width = v13;
  v26.size.double height = v15;
  if (!CGRectEqualToRect(v25, v26))
  {
    [(PUTilingView *)self bounds];
    double v22 = v17;
    double v23 = v16;
    double v20 = v19;
    double v21 = v18;
    v24.receiver = self;
    v24.super_class = (Class)PUTilingView;
    -[PUTilingView setFrame:](&v24, sel_setFrame_, x, y, width, height);
    -[PUTilingView _handleChangeFromBounds:fromFrame:](self, "_handleChangeFromBounds:fromFrame:", v23, v22, v21, v20, v9, v11, v13, v15);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUTilingView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  v26.origin.double x = v9;
  v26.origin.double y = v11;
  v26.size.double width = v13;
  v26.size.double height = v15;
  if (!CGRectEqualToRect(v25, v26))
  {
    [(PUTilingView *)self frame];
    double v22 = v17;
    double v23 = v16;
    double v20 = v19;
    double v21 = v18;
    v24.receiver = self;
    v24.super_class = (Class)PUTilingView;
    -[PUTilingView setBounds:](&v24, sel_setBounds_, x, y, width, height);
    -[PUTilingView _handleChangeFromBounds:fromFrame:](self, "_handleChangeFromBounds:fromFrame:", v9, v11, v13, v15, v23, v22, v21, v20);
  }
}

- (void)setTileUseDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileUseDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tileUseDelegate, obj);
    p_tileUseDelegateFlags = &self->_tileUseDelegateFlags;
    p_tileUseDelegateFlags->respondsToWillStartUsingTileController = objc_opt_respondsToSelector() & 1;
    p_tileUseDelegateFlags->respondsToDidStopUsingTileController = objc_opt_respondsToSelector() & 1;
    p_tileUseDelegateFlags->respondsToDidUpdateTileControllers = objc_opt_respondsToSelector() & 1;
    p_tileUseDelegateFlags->respondsToDidEndAnimatingTileControllers = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setScrollDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollDelegate, obj);
    p_scrollDelegateFlags = &self->_scrollDelegateFlags;
    p_scrollDelegateFlags->respondsToScrollInfoWithLayout = objc_opt_respondsToSelector() & 1;
    p_scrollDelegateFlags->respondsToInitialVisibleOriginWithLayout = objc_opt_respondsToSelector() & 1;
    p_scrollDelegateFlags->respondsToTargetVisibleOriginForProposedVisibleOrigin = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setTileTransitionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileTransitionDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tileTransitionDelegate, obj);
    p_tileTransitionDelegateFlags = &self->_tileTransitionDelegateFlags;
    p_tileTransitionDelegateFlags->respondsToDataSourceConverterForTransitionFromLayoutToLayout = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForTransitionFromLayoutWithContext = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForUpdateWithItems = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForChangeFromFrame = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForReattachedTileControllers = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForLayoutInvalidationContext = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToCanBypass20069585Check = objc_opt_respondsToSelector() & 1;
  }
}

- (PUTilingView)initWithCoder:(id)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUTilingView.m" lineNumber:163 description:@"unsupported initializer"];

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[PUTilingView initWithFrame:layout:](self, "initWithFrame:layout:", 0, v6, v7, v8, v9);
}

- (PUTilingView)initWithFrame:(CGRect)a3
{
  return -[PUTilingView initWithFrame:layout:](self, "initWithFrame:layout:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUTilingView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  if (!v11)
  {
    BOOL v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PUTilingView.m", 120, @"Invalid parameter not satisfying: %@", @"layout != nil" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)PUTilingView;
  double v12 = -[PUTilingView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layout, a4);
    [(PUTilingLayout *)v13->_layout setTilingView:v13];
    v13->__reasonForNextLayoutCoordinateSystemUpdate = 1;
    double v14 = [(PUTilingViewCoordinateSystem *)[PUTilingViewContentCoordinateSystem alloc] initWithTilingView:v13];
    contentCoordinateSystem = v13->_contentCoordinateSystem;
    v13->_contentCoordinateSystem = (PUTilingCoordinateSystem *)v14;

    double v16 = [(PUTilingViewCoordinateSystem *)[PUTilingViewFixedCoordinateSystem alloc] initWithTilingView:v13];
    fixedCoordinateSystem = v13->_fixedCoordinateSystem;
    v13->_fixedCoordinateSystem = (PUTilingCoordinateSystem *)v16;

    double v18 = objc_alloc_init(PUReuseQueue);
    tileControllerReuseQueue = v13->__tileControllerReuseQueue;
    v13->__tileControllerReuseQueue = v18;

    double v20 = v13->__tileControllerReuseQueue;
    double v21 = +[PUTilingViewSettings sharedInstance];
    -[PUReuseQueue setReuseEnabled:](v20, "setReuseEnabled:", [v21 allowTileReuse]);

    double v22 = [[PUTileTree alloc] initUsingUniqueLeafs:1];
    activeTileControllers = v13->__activeTileControllers;
    v13->__activeTileControllers = v22;

    objc_super v24 = [[PUTileTree alloc] initUsingUniqueLeafs:0];
    inactiveTileControllers = v13->__inactiveTileControllers;
    v13->__inactiveTileControllers = v24;

    CGRect v26 = [[PUTileTree alloc] initUsingUniqueLeafs:1];
    detachedTileControllers = v13->__detachedTileControllers;
    v13->__detachedTileControllers = v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    referencedDataSourcesByIdentifiers = v13->__referencedDataSourcesByIdentifiers;
    v13->__referencedDataSourcesByIdentifiers = (NSMutableDictionary *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
    referencedCoordinateSystems = v13->__referencedCoordinateSystems;
    v13->__referencedCoordinateSystems = (NSMutableSet *)v30;

    v13->__needsUpdateLayoutVisibleRect = 1;
    v13->__needsUpdateLayoutCoordinateSystem = 1;
    v13->__needsUpdateLayout = 1;
    v13->__needsUpdateScrollViewProperties = 1;
    v13->__needsUpdateTileControllers = 1;
    v13->__needsUpdateReferencedDataSources = 1;
    v13->__needsUpdateReferencedCoordinateSystems = 1;
    uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
    pendingUpdateItems = v13->__pendingUpdateItems;
    v13->__pendingUpdateItems = (NSMutableArray *)v32;

    long long v34 = [v11 dataSource];
    [(PUTilingView *)v13 _registerDataSource:v34];

    [(PUTilingView *)v13 _adjustScrollViewPagingDeceleration];
    long long v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    postLayoutBlocks = v13->__postLayoutBlocks;
    v13->__postLayoutBlocks = v35;
  }
  return v13;
}

+ (unint64_t)_defaultEdgesScrollingContentIntoSafeArea
{
  return 0;
}

@end