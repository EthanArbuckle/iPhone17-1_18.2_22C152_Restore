@interface PXAssetsScene
- (BOOL)animatesContent;
- (BOOL)autoplayTilesWaitForInput;
- (BOOL)needsUpdate;
- (BOOL)providesTileForIdentifier:(PXTileIdentifier *)a3;
- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4;
- (NSMutableArray)_anchors;
- (PXAssetBadgeManager)badgeManager;
- (PXAssetsDataSource)_dataSource;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXAssetsScene)init;
- (PXAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 delegate:(id)a6;
- (PXAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 selectionManager:(id)a6 delegate:(id)a7;
- (PXAssetsSceneDelegate)delegate;
- (PXAssetsTilingLayout)currentLayout;
- (PXAssetsTilingLayout)targetLayout;
- (PXMediaProvider)mediaProvider;
- (PXReusableObjectPool)viewTileReusePool;
- (PXScrollViewSpeedometer)scrollSpeedometer;
- (PXSectionedSelectionManager)selectionManager;
- (PXTilingController)tilingController;
- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4;
- (unint64_t)autoplayBehavior;
- (void)_configureLayout:(id)a3;
- (void)_invalidateLayout;
- (void)_saveAnchorAsset;
- (void)_setDataSource:(id)a3;
- (void)_updateDataSourceIfNeeded;
- (void)_updateLayoutIfNeeded;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)didTransitionToDataSource:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setAnimatesContent:(BOOL)a3;
- (void)setAutoplayBehavior:(unint64_t)a3;
- (void)setAutoplayTilesWaitForInput:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsUpdate;
- (void)transitionToLayout:(id)a3;
- (void)updateIfNeeded;
- (void)willTransitionToDataSource:(id)a3;
@end

@implementation PXAssetsScene

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__anchors, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->_viewTileReusePool, 0);
  objc_storeStrong((id *)&self->_scrollSpeedometer, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAutoplayTilesWaitForInput:(BOOL)a3
{
  self->_autoplayTilesWaitForInput = a3;
}

- (BOOL)autoplayTilesWaitForInput
{
  return self->_autoplayTilesWaitForInput;
}

- (void)setAutoplayBehavior:(unint64_t)a3
{
  self->_autoplayBehavior = a3;
}

- (unint64_t)autoplayBehavior
{
  return self->_autoplayBehavior;
}

- (NSMutableArray)_anchors
{
  return self->__anchors;
}

- (PXAssetsDataSource)_dataSource
{
  return self->__dataSource;
}

- (BOOL)animatesContent
{
  return self->_animatesContent;
}

- (PXReusableObjectPool)viewTileReusePool
{
  return self->_viewTileReusePool;
}

- (PXScrollViewSpeedometer)scrollSpeedometer
{
  return self->_scrollSpeedometer;
}

- (PXAssetBadgeManager)badgeManager
{
  return self->_badgeManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (PXAssetsSceneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXAssetsSceneDelegate *)WeakRetained;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"PXAssetsScene.m", 424, @"%@ must be implemented in a concrete subclass", v7 object file lineNumber description];

  abort();
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"PXAssetsScene.m", 420, @"%@ must be implemented in a concrete subclass", v8 object file lineNumber description];

  abort();
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v30 = a4;
  [v30 scrollBounds];
  double v6 = v5;
  double v8 = v7;
  v9 = [(PXAssetsScene *)self _anchors];
  v10 = (void *)[v9 copy];

  v29 = self;
  v11 = [(PXAssetsScene *)self _anchors];
  [v11 removeAllObjects];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v51;
    uint64_t v15 = *(void *)off_1E5DAAED8;
    v27 = &v35;
    long long v26 = xmmword_1AB359AB0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "assetReference", v26, v27);
        if (v18)
        {
          v19 = [v30 dataSource];
          v20 = [(PXAssetsScene *)v29 dataSourceManager];
          v21 = [v20 changeHistory];
          [v18 indexPath];
          v22 = objc_msgSend(v21, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v49, objc_msgSend(v19, "identifier"));

          memset(&v48[2], 0, 32);
          [v18 indexPath];
          [off_1E5DA8488 indexPathAfterApplyingChanges:v22 toIndexPath:v48 hasIncrementalChanges:0 objectChanged:0];
          uint64_t v23 = *(void *)&v48[2];
          if (*(void *)&v48[2] == v15)
          {
            if (v19)
            {
              [v19 indexPathForObjectReference:v18];
            }
            else
            {
              long long v36 = 0u;
              long long v37 = 0u;
            }
            v48[2] = v36;
            v48[3] = v37;
            uint64_t v23 = v36;
          }
          if (v23 != v15)
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
            long long v31 = v26;
            uint64_t v32 = v23;
            long long v33 = *(_OWORD *)((char *)&v48[2] + 8);
            uint64_t v34 = *((void *)&v48[3] + 1);
            *(_OWORD *)v27 = 0u;
            *((_OWORD *)v27 + 1) = 0u;
            v27[4] = 0;
            if ([v30 getGeometry:&v36 group:0 userData:0 forTileWithIdentifier:&v31])
            {
              [v17 anchorOrigin];
              PXPointSubtract();
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v13);
  }

  double v24 = v6;
  double v25 = v8;
  result.y = v25;
  result.x = v24;
  return result;
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v5 = a4;
  if (self->_delegateFlags.respondsToTransitionAnimationCoordinatorForChange
    && !self->_isAskingForTransitionAnimationCoordinator)
  {
    self->_isAskingForTransitionAnimationCoordinator = 1;
    v9 = [(PXAssetsScene *)self delegate];
    double v8 = [v9 assetsScene:self transitionAnimationCoordinatorForChange:v5];

    self->_isAskingForTransitionAnimationCoordinator = 0;
  }
  else
  {
    double v6 = [(PXAssetsScene *)self dataSourceManager];
    double v7 = [v6 changeHistory];
    double v8 = +[PXAssetsTileTransitionCoordinator transitionCoordinatorForChange:v5 changeHistory:v7];
  }
  return v8;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (self->_delegateFlags.respondsToTileIdentifierConverterForChange && !self->_isAskingForTileIdentifierConverter)
  {
    self->_isAskingForTileIdentifierConverter = 1;
    v19 = [(PXAssetsScene *)self delegate];
    v18 = [v19 assetsScene:self tileIdentifierConverterForChange:v6];

    self->_isAskingForTileIdentifierConverter = 0;
  }
  else
  {
    double v7 = [v5 fromLayout];
    double v8 = [v6 toLayout];
    if ([v7 isEqual:v8])
    {
      v9 = 0;
    }
    else
    {
      v10 = [(PXAssetsScene *)self dataSourceManager];
      v11 = [v10 changeHistory];
      uint64_t v12 = [v7 dataSource];
      uint64_t v13 = [v12 identifier];
      uint64_t v14 = [v8 dataSource];
      v9 = objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v13, objc_msgSend(v14, "identifier"));
    }
    uint64_t v15 = [PXSectionedTileIdentifierConverter alloc];
    v16 = [v7 dataSource];
    v17 = [v8 dataSource];
    v18 = [(PXSectionedTileIdentifierConverter *)v15 initWithFromDataSource:v16 toDataSource:v17 changeDetails:v9];
  }
  return v18;
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((v6 & 1) != 0 && (void *)PXAssetsSceneDataSourceObserverContext == a5)
  {
    id v10 = v8;
    [(PXAssetsScene *)self _updateDataSourceIfNeeded];
LABEL_7:
    id v8 = v10;
    goto LABEL_8;
  }
  if ((v6 & 1) != 0 && (void *)PXAssetsSceneSelectionManagerObserverContext == a5)
  {
    id v10 = v8;
    [(PXAssetsScene *)self _updateDataSourceIfNeeded];
    v9 = [(PXAssetsScene *)self targetLayout];
    [(PXAssetsScene *)self _configureLayout:v9];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_setDataSource:(id)a3
{
  id v6 = a3;
  uint64_t v5 = [(PXAssetsDataSource *)self->__dataSource identifier];
  if (v5 != [v6 identifier])
  {
    objc_storeStrong((id *)&self->__dataSource, a3);
    [(PXAssetsScene *)self _invalidateLayout];
  }
}

- (void)_saveAnchorAsset
{
  v3 = [(PXAssetsScene *)self _anchors];
  [v3 removeAllObjects];
  v4 = [(PXAssetsScene *)self tilingController];
  uint64_t v5 = [v4 currentLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v7 = [(PXAssetsScene *)self tilingController];
    id v8 = [v7 currentLayout];

    [v8 visibleRect];
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
    CGRect v26 = CGRectInset(v25, v25.size.width * -0.5, v25.size.height * -0.5);
    double v13 = v26.origin.x;
    double v14 = v26.origin.y;
    double v15 = v26.size.width;
    double v16 = v26.size.height;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __33__PXAssetsScene__saveAnchorAsset__block_invoke;
    v18[3] = &unk_1E5DC85A8;
    CGFloat v21 = x;
    CGFloat v22 = y;
    CGFloat v23 = width;
    CGFloat v24 = height;
    id v19 = v8;
    id v20 = v3;
    id v17 = v8;
    objc_msgSend(v17, "enumerateTilesInRect:withOptions:usingBlock:", 0, v18, v13, v14, v15, v16);
  }
}

void __33__PXAssetsScene__saveAnchorAsset__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if (*a2 == 5 && a2[1] == 6432423) {
    PXDistanceBetweenPoints();
  }
}

uint64_t __33__PXAssetsScene__saveAnchorAsset__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 distance];
  double v7 = v6;
  [v5 distance];
  if (v7 >= v8)
  {
    [v4 distance];
    double v11 = v10;
    [v5 distance];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)_configureLayout:(id)a3
{
  id v12 = a3;
  id v4 = [(PXAssetsScene *)self selectionManager];
  id v5 = [v4 selectionSnapshot];

  double v6 = [v12 dataSource];
  uint64_t v7 = [v6 identifier];
  double v8 = [v5 dataSource];
  uint64_t v9 = [v8 identifier];

  if (v7 == v9)
  {
    double v10 = [v5 selectedIndexPaths];
    [v12 setSelectedIndexPaths:v10];
  }
  if ([(PXAssetsScene *)self animatesContent]) {
    unint64_t v11 = [(PXAssetsScene *)self autoplayBehavior];
  }
  else {
    unint64_t v11 = 0;
  }
  [v12 setAnimatedOverlayBehavior:v11];
}

- (void)_updateDataSourceIfNeeded
{
  v3 = [(PXAssetsScene *)self dataSourceManager];
  id v4 = [v3 dataSource];

  id v5 = [(PXAssetsScene *)self selectionManager];
  double v6 = [v5 selectionSnapshot];
  uint64_t v7 = [v6 dataSource];
  if ([v4 isEqual:v7])
  {
    double v8 = [(PXAssetsScene *)self _dataSource];
    char v9 = [v8 isEqual:v4];

    if ((v9 & 1) == 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __42__PXAssetsScene__updateDataSourceIfNeeded__block_invoke;
      v10[3] = &unk_1E5DD32A8;
      v10[4] = self;
      id v11 = v4;
      [(PXAssetsScene *)self performChanges:v10];
    }
  }
  else
  {
  }
}

uint64_t __42__PXAssetsScene__updateDataSourceIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDataSource:*(void *)(a1 + 40)];
}

- (void)_updateLayoutIfNeeded
{
  if (self->_needsUpdateFlags.layout)
  {
    self->_needsUpdateFlags.layout = 0;
    id v8 = [(PXAssetsScene *)self delegate];
    id v4 = [(PXAssetsScene *)self _dataSource];
    [(PXAssetsScene *)self willTransitionToDataSource:v4];
    id v5 = [v8 assetsScene:self layoutForDataSource:v4];
    if (!v5)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PXAssetsScene.m", 240, @"delegate:%@ must return a new layout for data source:%@", v8, v4 object file lineNumber description];
    }
    [(PXAssetsScene *)self _configureLayout:v5];
    [(PXAssetsScene *)self _saveAnchorAsset];
    double v6 = [(PXAssetsScene *)self tilingController];
    [v6 transitionToLayout:v5];

    [(PXAssetsScene *)self didTransitionToDataSource:v4];
  }
}

- (void)_invalidateLayout
{
  self->_needsUpdateFlags.layout = 1;
  [(PXAssetsScene *)self setNeedsUpdate];
}

- (void)updateIfNeeded
{
  if ([(PXAssetsScene *)self needsUpdate])
  {
    [(PXAssetsScene *)self _updateLayoutIfNeeded];
  }
}

- (BOOL)needsUpdate
{
  return self->_needsUpdateFlags.layout;
}

- (void)performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXAssetsScene *)self updateIfNeeded];
  }
}

- (void)setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates && !self->_hasScheduledUpdate)
  {
    self->_hasScheduledUpdate = 1;
    id v3 = [(PXAssetsScene *)self tilingController];
    v2 = [v3 scrollController];
    [v2 setNeedsUpdate];
  }
}

- (void)setAnimatesContent:(BOOL)a3
{
  if (self->_animatesContent != a3)
  {
    self->_animatesContent = a3;
    id v4 = [(PXAssetsScene *)self targetLayout];
    [(PXAssetsScene *)self _configureLayout:v4];
  }
}

- (void)didTransitionToDataSource:(id)a3
{
  if (self->_delegateFlags.respondsToDidTransitionToDataSource)
  {
    id v4 = a3;
    id v5 = [(PXAssetsScene *)self delegate];
    [v5 assetsScene:self didTransitionToDataSource:v4];
  }
}

- (void)willTransitionToDataSource:(id)a3
{
  if (self->_delegateFlags.respondsToWillTransitionToDataSource)
  {
    id v4 = a3;
    id v5 = [(PXAssetsScene *)self delegate];
    [v5 assetsScene:self willTransitionToDataSource:v4];
  }
}

- (BOOL)providesTileForIdentifier:(PXTileIdentifier *)a3
{
  unint64_t v3 = a3->index[0];
  char v5 = a3->length == 5 && v3 == 6432423;
  if (a3->length - 3 <= 2 && a3->index[1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64x2_t v6 = vdupq_n_s64(v3);
    BOOL v7 = v3 == 6332434;
    char v8 = vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v6, (int64x2_t)xmmword_1AB35A030), (int32x4_t)vceqq_s64(v6, (int64x2_t)xmmword_1AB35A040)))) | (v3 == 6332439);
    BOOL v10 = v3 == 6332440 || v3 == 6332438;
    v5 |= (v7 || v10) | v8;
  }
  return v5 & 1;
}

- (PXAssetsTilingLayout)currentLayout
{
  v2 = [(PXAssetsScene *)self tilingController];
  unint64_t v3 = [v2 currentLayout];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    unint64_t v3 = 0;
  }
  return (PXAssetsTilingLayout *)v3;
}

- (PXAssetsTilingLayout)targetLayout
{
  v2 = [(PXAssetsScene *)self tilingController];
  unint64_t v3 = [v2 targetLayout];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    unint64_t v3 = 0;
  }
  return (PXAssetsTilingLayout *)v3;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_delegateFlags.respondsToTileIdentifierConverterForChange = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToWillTransitionToDataSource = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDidTransitionToDataSource = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateFlags.respondsToTransitionAnimationCoordinatorForChange = p_delegate & 1;
}

- (void)transitionToLayout:(id)a3
{
  id v4 = a3;
  [(PXAssetsScene *)self _saveAnchorAsset];
  [(PXAssetsScene *)self _configureLayout:v4];
  [(PXTilingController *)self->_tilingController transitionToLayout:v4];
}

- (PXAssetsScene)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetsScene.m", 121, @"%s is not available as initializer", "-[PXAssetsScene init]");

  abort();
}

- (PXAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 selectionManager:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v41.receiver = self;
  v41.super_class = (Class)PXAssetsScene;
  v18 = [(PXAssetsScene *)&v41 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tilingController, a3);
    objc_storeStrong((id *)&v19->_mediaProvider, a4);
    id v20 = objc_alloc_init(PXAssetBadgeManager);
    badgeManager = v19->_badgeManager;
    v19->_badgeManager = v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    anchors = v19->__anchors;
    v19->__anchors = (NSMutableArray *)v22;

    [(PXAssetsScene *)v19 setDelegate:v17];
    objc_storeStrong((id *)&v19->_dataSourceManager, a5);
    [v15 registerChangeObserver:v19 context:PXAssetsSceneDataSourceObserverContext];
    uint64_t v24 = [v15 dataSource];
    dataSource = v19->__dataSource;
    v19->__dataSource = (PXAssetsDataSource *)v24;

    if (v16) {
      CGRect v26 = (PXSectionedSelectionManager *)v16;
    }
    else {
      CGRect v26 = (PXSectionedSelectionManager *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v15];
    }
    selectionManager = v19->_selectionManager;
    v19->_selectionManager = v26;

    [(PXSectionedSelectionManager *)v19->_selectionManager registerChangeObserver:v19 context:PXAssetsSceneSelectionManagerObserverContext];
    id v28 = objc_alloc((Class)off_1E5DA83C8);
    v29 = [v13 scrollController];
    uint64_t v30 = [v28 initWithScrollController:v29];
    scrollSpeedometer = v19->_scrollSpeedometer;
    v19->_scrollSpeedometer = (PXScrollViewSpeedometer *)v30;

    [(PXScrollViewSpeedometer *)v19->_scrollSpeedometer registerChangeObserver:v19 context:PXAssetsSceneSpeedometerObserverContext];
    uint64_t v32 = (PXReusableObjectPool *)objc_alloc_init((Class)off_1E5DA8338);
    viewTileReusePool = v19->_viewTileReusePool;
    v19->_viewTileReusePool = v32;

    [(PXReusableObjectPool *)v19->_viewTileReusePool setDelegate:v19];
    uint64_t v34 = +[PXAssetsSceneSettings sharedInstance];
    v19->_animatesContent = [v34 animateContentByDefault];

    uint64_t v35 = +[PXAssetsSceneSettings sharedInstance];
    unint64_t v36 = [v35 allowLoopingVideoPlayback];
    if ([v35 allowAnimatedImagePlayback]) {
      v36 |= 2uLL;
    }
    if ([v35 allowVideoPlayback]) {
      v36 |= 4uLL;
    }
    if ([v35 allowLivePhotoPlayback])
    {
      int v37 = [v35 playLivePhotosAsLoops];
      uint64_t v38 = 8;
      if (v37) {
        uint64_t v38 = 24;
      }
      v36 |= v38;
    }

    v19->_autoplayBehavior = v36;
    long long v39 = [(PXAssetsScene *)v19 targetLayout];
    [(PXAssetsScene *)v19 _configureLayout:v39];
  }
  return v19;
}

- (PXAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 delegate:(id)a6
{
  return [(PXAssetsScene *)self initWithTilingController:a3 mediaProvider:a4 dataSourceManager:a5 selectionManager:0 delegate:a6];
}

@end