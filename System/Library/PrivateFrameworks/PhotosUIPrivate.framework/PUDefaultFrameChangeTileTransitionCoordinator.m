@interface PUDefaultFrameChangeTileTransitionCoordinator
- (BOOL)_isLayoutInfoVisible:(id)a3;
- (BOOL)shouldCrossFadeTiles;
- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4;
- (NSSet)_invisibleTileControllers;
- (PUTilingView)tilingView;
- (id)_layoutInfoForDisappearedInvisibleTile:(id)a3;
- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4;
- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4;
- (void)_setInvisibleTileControllers:(id)a3;
- (void)prepare;
- (void)setShouldCrossFadeTiles:(BOOL)a3;
- (void)setTilingView:(id)a3;
@end

@implementation PUDefaultFrameChangeTileTransitionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__invisibleTileControllers, 0);
  objc_destroyWeak((id *)&self->_tilingView);
}

- (void)_setInvisibleTileControllers:(id)a3
{
}

- (NSSet)_invisibleTileControllers
{
  return self->__invisibleTileControllers;
}

- (void)setTilingView:(id)a3
{
}

- (PUTilingView)tilingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tilingView);
  return (PUTilingView *)WeakRetained;
}

- (void)setShouldCrossFadeTiles:(BOOL)a3
{
  self->_shouldCrossFadeTiles = a3;
}

- (BOOL)shouldCrossFadeTiles
{
  return self->_shouldCrossFadeTiles;
}

- (BOOL)_isLayoutInfoVisible:(id)a3
{
  id v4 = a3;
  v5 = [(PUDefaultFrameChangeTileTransitionCoordinator *)self tilingView];
  v6 = [v5 layout];

  [v6 visibleRect];
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v15 = [v6 coordinateSystem];
  v16 = [v4 coordinateSystem];
  double v17 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v15, v16, v8, v10);
  CGFloat v19 = v18;

  [v4 frame];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v29.origin.x = v21;
  v29.origin.y = v23;
  v29.size.width = v25;
  v29.size.height = v27;
  v30.origin.x = v17;
  v30.origin.y = v19;
  v30.size.width = v12;
  v30.size.height = v14;
  LOBYTE(v4) = CGRectIntersectsRect(v29, v30);

  return (char)v4;
}

- (void)prepare
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PUDefaultFrameChangeTileTransitionCoordinator *)self tilingView];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  double v8 = __56__PUDefaultFrameChangeTileTransitionCoordinator_prepare__block_invoke;
  double v9 = &unk_1E5F280F0;
  double v10 = self;
  id v11 = v3;
  id v5 = v3;
  [v4 enumerateAllTileControllersUsingBlock:&v6];

  -[PUDefaultFrameChangeTileTransitionCoordinator _setInvisibleTileControllers:](self, "_setInvisibleTileControllers:", v5, v6, v7, v8, v9, v10);
}

void __56__PUDefaultFrameChangeTileTransitionCoordinator_prepare__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 layoutInfo];
  if (v3 && ([*(id *)(a1 + 32) _isLayoutInfoVisible:v3] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)_layoutInfoForDisappearedInvisibleTile:(id)a3
{
  id v4 = a3;
  id v5 = [(PUDefaultFrameChangeTileTransitionCoordinator *)self tilingView];
  uint64_t v6 = [v5 layout];

  uint64_t v7 = [v4 dataSourceIdentifier];
  double v8 = [v6 dataSource];
  double v9 = [v8 identifier];
  int v10 = [v7 isEqual:v9];

  id v11 = v4;
  if (v10)
  {
    [v6 visibleRect];
    double v13 = v12;
    double v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    double v20 = [v6 coordinateSystem];
    CGFloat v21 = [v4 coordinateSystem];
    double v22 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v20, v21, v13, v15);
    CGFloat v24 = v23;

    [v4 center];
    double v26 = v25;
    double v28 = v27;
    v43.origin.x = v22;
    v43.origin.y = v24;
    v43.size.width = v17;
    v43.size.height = v19;
    double v29 = CGRectGetWidth(v43) * 3.0;
    v44.origin.x = v22;
    v44.origin.y = v24;
    v44.size.width = v17;
    v44.size.height = v19;
    BOOL v30 = v26 <= CGRectGetMidX(v44);
    double v31 = -1.0;
    if (!v30) {
      double v31 = 1.0;
    }
    double v32 = v26 + v29 * v31;
    v45.origin.x = v22;
    v45.origin.y = v24;
    v45.size.width = v17;
    v45.size.height = v19;
    double v33 = CGRectGetHeight(v45) * 3.0;
    v46.origin.x = v22;
    v46.origin.y = v24;
    v46.size.width = v17;
    v46.size.height = v19;
    BOOL v30 = v28 <= CGRectGetMidY(v46);
    double v34 = -1.0;
    if (!v30) {
      double v34 = 1.0;
    }
    double v35 = v28 + v33 * v34;
    [v4 size];
    double v37 = v36;
    double v39 = v38;
    if (v4) {
      [v4 transform];
    }
    else {
      memset(v41, 0, sizeof(v41));
    }
    id v11 = objc_msgSend(v4, "layoutInfoWithCenter:size:transform:", v41, v32, v35, v37, v39);
  }
  return v11;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PUDefaultFrameChangeTileTransitionCoordinator *)self _invisibleTileControllers];
  int v9 = [v8 containsObject:v7];

  int v10 = v6;
  if (v9)
  {
    int v10 = [(PUDefaultFrameChangeTileTransitionCoordinator *)self _layoutInfoForDisappearedInvisibleTile:v6];
  }
  return v10;
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(PUDefaultTileTransitionCoordinator *)self _layoutInfoWithDefaultDisappearance:v5];
  if (![(PUDefaultFrameChangeTileTransitionCoordinator *)self _isLayoutInfoVisible:v5])
  {
    uint64_t v7 = [(PUDefaultFrameChangeTileTransitionCoordinator *)self _layoutInfoForDisappearedInvisibleTile:v5];

    id v6 = (void *)v7;
  }

  return v6;
}

- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v5 = a4;
  if ([(PUDefaultFrameChangeTileTransitionCoordinator *)self shouldCrossFadeTiles]) {
    LOBYTE(v6) = 1;
  }
  else {
    BOOL v6 = ![(PUDefaultFrameChangeTileTransitionCoordinator *)self _isLayoutInfoVisible:v5];
  }

  return v6;
}

@end