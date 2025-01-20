@interface PXWidgetCompositionViewElement
- (BOOL)isCheckingInTile;
- (CGPoint)_anchorOffset;
- (CGPoint)_anchorPoint;
- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4;
- (NSMutableSet)_tilesInUse;
- (PXBasicTileAnimator)_tileAnimator;
- (PXTilingController)_tilingController;
- (PXWidgetCompositionViewElementLayout)_layout;
- (id)checkOutViewTile;
- (id)contentTilingController;
- (id)createTileAnimator;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (void)_loadTilingController;
- (void)_setAnchorOffset:(CGPoint)a3;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkInViewTile:(id)a3;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)saveAnchoring;
- (void)setIsCheckingInTile:(BOOL)a3;
@end

@implementation PXWidgetCompositionViewElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__layout, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
}

- (void)_setAnchorOffset:(CGPoint)a3
{
  self->__anchorOffset = a3;
}

- (CGPoint)_anchorOffset
{
  double x = self->__anchorOffset.x;
  double y = self->__anchorOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PXWidgetCompositionViewElementLayout)_layout
{
  return self->__layout;
}

- (PXBasicTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (void)setIsCheckingInTile:(BOOL)a3
{
  self->_isCheckingInTile = a3;
}

- (BOOL)isCheckingInTile
{
  return self->_isCheckingInTile;
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v5 = a4;
  [(PXWidgetCompositionViewElement *)self _anchorOffset];
  PXPointIsNull();
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  v4 = objc_alloc_init(PXTileIdentifierIdentityConverter);
  return v4;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  v7 = a3;
  [(PXWidgetCompositionViewElement *)self setIsCheckingInTile:1];
  +[PXWidgetCompositionViewElementLayout viewTileIdentifier];
  long long v8 = *(_OWORD *)&a4->index[5];
  long long v21 = *(_OWORD *)&a4->index[3];
  long long v22 = v8;
  long long v23 = *(_OWORD *)&a4->index[7];
  unint64_t v24 = a4->index[9];
  long long v9 = *(_OWORD *)&a4->index[1];
  long long v19 = *(_OWORD *)&a4->length;
  long long v20 = v9;
  BOOL v10 = (void)v19 == v25[0];
  if ((void)v19 && (void)v19 == v25[0])
  {
    unint64_t v11 = 1;
    do
    {
      uint64_t v12 = *((void *)&v19 + v11);
      uint64_t v13 = v25[v11];
      BOOL v10 = v12 == v13;
      if (v11 >= (unint64_t)v19) {
        break;
      }
      ++v11;
    }
    while (v12 == v13);
  }
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v16 = *(_OWORD *)&a4->index[5];
    long long v21 = *(_OWORD *)&a4->index[3];
    long long v22 = v16;
    long long v23 = *(_OWORD *)&a4->index[7];
    unint64_t v24 = a4->index[9];
    long long v17 = *(_OWORD *)&a4->index[1];
    long long v19 = *(_OWORD *)&a4->length;
    long long v20 = v17;
    v18 = PXTileIdentifierDescription((unint64_t *)&v19);
    [v15 handleFailureInMethod:a2, self, @"PXWidgetCompositionViewElement.m", 117, @"unknown identifier %@", v18 object file lineNumber description];

    abort();
  }
  [(PXWidgetCompositionViewElement *)self checkInViewTile:v7];
  [(PXWidgetCompositionViewElement *)self setIsCheckingInTile:0];
  v14 = [(PXWidgetCompositionViewElement *)self _tilesInUse];
  [v14 removeObject:v7];
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7 = a4;
  +[PXWidgetCompositionViewElementLayout viewTileIdentifier];
  long long v8 = *(_OWORD *)&a3->index[5];
  long long v23 = *(_OWORD *)&a3->index[3];
  long long v24 = v8;
  long long v25 = *(_OWORD *)&a3->index[7];
  unint64_t v26 = a3->index[9];
  long long v9 = *(_OWORD *)&a3->index[1];
  long long v21 = *(_OWORD *)&a3->length;
  long long v22 = v9;
  BOOL v10 = (void)v21 == v27[0];
  if ((void)v21 && (void)v21 == v27[0])
  {
    unint64_t v11 = 1;
    do
    {
      uint64_t v12 = *((void *)&v21 + v11);
      uint64_t v13 = v27[v11];
      BOOL v10 = v12 == v13;
      if (v11 >= (unint64_t)v21) {
        break;
      }
      ++v11;
    }
    while (v12 == v13);
  }
  if (!v10)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v18 = *(_OWORD *)&a3->index[5];
    long long v23 = *(_OWORD *)&a3->index[3];
    long long v24 = v18;
    long long v25 = *(_OWORD *)&a3->index[7];
    unint64_t v26 = a3->index[9];
    long long v19 = *(_OWORD *)&a3->index[1];
    long long v21 = *(_OWORD *)&a3->length;
    long long v22 = v19;
    long long v20 = PXTileIdentifierDescription((unint64_t *)&v21);
    [v17 handleFailureInMethod:a2, self, @"PXWidgetCompositionViewElement.m", 102, @"unknown identifier %@", v20 object file lineNumber description];

    abort();
  }
  v14 = [(PXWidgetCompositionViewElement *)self checkOutViewTile];
  v15 = [(PXWidgetCompositionViewElement *)self _tilesInUse];
  [v15 addObject:v14];

  return v14;
}

- (CGPoint)_anchorPoint
{
  v4 = [(PXWidgetCompositionViewElement *)self _layout];
  [v4 contentBounds];

  id v5 = [(PXWidgetCompositionElement *)self widget];
  if ((objc_opt_respondsToSelector() & 1) == 0 || (uint64_t v6 = [v5 contentViewAnchoringType]) == 0)
  {
    id v7 = [(PXWidgetCompositionElement *)self widget];
    uint64_t v6 = [(PXWidgetCompositionElement *)self widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:v7];
  }
  if (v6) {
    PXRectEdgeValue();
  }
  long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2 object:self file:@"PXWidgetCompositionViewElement.m" lineNumber:79 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)_loadTilingController
{
  if (!self->__tilingController)
  {
    v3 = [(PXWidgetCompositionViewElement *)self createTileAnimator];
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = v3;

    id v5 = [MEMORY[0x1E4F1CA80] set];
    tilesInUse = self->__tilesInUse;
    self->__tilesInUse = v5;

    id v7 = objc_alloc_init(PXWidgetCompositionViewElementLayout);
    layout = self->__layout;
    self->__layout = v7;

    long long v9 = [[PXTilingController alloc] initWithLayout:self->__layout];
    tilingController = self->__tilingController;
    self->__tilingController = v9;

    unint64_t v11 = self->__tilingController;
    uint64_t v12 = [(PXWidgetCompositionElement *)self scrollViewController];
    [(PXTilingController *)v11 setScrollController:v12];

    [(PXTilingController *)self->__tilingController setTileAnimator:self->__tileAnimator];
    [(PXTilingController *)self->__tilingController setTileSource:self];
    [(PXTilingController *)self->__tilingController setTransitionDelegate:self];
    uint64_t v13 = self->__tilingController;
    [(PXTilingController *)v13 setScrollDelegate:self];
  }
}

- (void)saveAnchoring
{
}

- (id)contentTilingController
{
  [(PXWidgetCompositionViewElement *)self _loadTilingController];
  return [(PXWidgetCompositionViewElement *)self _tilingController];
}

- (void)checkInViewTile:(id)a3
{
  id v3 = [a3 view];
  [v3 removeFromSuperview];
}

- (id)checkOutViewTile
{
  id v3 = [(PXWidgetCompositionElement *)self widget];
  v4 = [[PXWidgetCompositionUIViewElementTile alloc] initWithWidget:v3];
  id v5 = [(PXWidgetCompositionElement *)self scrollViewController];
  uint64_t v6 = [(PXWidgetCompositionUIViewElementTile *)v4 view];
  [v5 addSubview:v6];

  return v4;
}

- (id)createTileAnimator
{
  v2 = objc_alloc_init(PXWidgetCompositionUIViewElementTileAnimator);
  return v2;
}

@end