@interface PXWidgetBar
- (BOOL)_needsUpdate;
- (BOOL)allowUserInteractionWithSubtitle;
- (NSMutableSet)_tilesInUse;
- (NSString)caption;
- (NSString)disclosureTitle;
- (NSString)subtitle;
- (NSString)title;
- (PXAnonymousView)view;
- (PXBasicTileAnimator)_tileAnimator;
- (PXScrollViewController)scrollViewController;
- (PXTilingController)tilingController;
- (PXWidgetBar)init;
- (PXWidgetBar)initWithScrollViewController:(id)a3;
- (PXWidgetBarDelegate)delegate;
- (PXWidgetBarLayout)_layout;
- (PXWidgetBarSpec)spec;
- (double)_viewHeight;
- (double)viewHeight;
- (id)checkOutTileWithKind:(int64_t)a3;
- (id)createTileAnimator;
- (id)createView;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (void)_invalidateLayout;
- (void)_setNeedsUpdate;
- (void)_setViewHeight:(double)a3;
- (void)_updateIfNeeded;
- (void)_updateLayoutIfNeeded;
- (void)_updateViewHeightIfNeeded;
- (void)_updateViewIfNeeded;
- (void)checkInTile:(id)a3;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)didSelectDisclosureAffordance;
- (void)didSelectSubtitle;
- (void)invalidateView;
- (void)invalidateViewHeight;
- (void)performChanges:(id)a3;
- (void)setAllowUserInteractionWithSubtitle:(BOOL)a3;
- (void)setCaption:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureTitle:(id)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXWidgetBar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->__layout, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollViewController);
}

- (PXAnonymousView)view
{
  return self->_view;
}

- (PXWidgetBarLayout)_layout
{
  return self->__layout;
}

- (double)_viewHeight
{
  return self->__viewHeight;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PXBasicTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return self->_allowUserInteractionWithSubtitle;
}

- (void)setDisclosureTitle:(id)a3
{
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (void)setCaption:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setSpec:(id)a3
{
}

- (PXWidgetBarSpec)spec
{
  return self->_spec;
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (PXWidgetBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXWidgetBarDelegate *)WeakRetained;
}

- (PXScrollViewController)scrollViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewController);
  return (PXScrollViewController *)WeakRetained;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  v4 = objc_alloc_init(PXTileIdentifierIdentityConverter);
  return v4;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  v5 = a3;
  [(PXWidgetBar *)self checkInTile:v5];
  id v6 = [(PXWidgetBar *)self _tilesInUse];
  [v6 removeObject:v5];
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7 = a4;
  +[PXWidgetBarLayout tileIdentifier];
  long long v8 = *(_OWORD *)&a3->index[5];
  v18[2] = *(_OWORD *)&a3->index[3];
  v18[3] = v8;
  v18[4] = *(_OWORD *)&a3->index[7];
  unint64_t v19 = a3->index[9];
  long long v9 = *(_OWORD *)&a3->index[1];
  v18[0] = *(_OWORD *)&a3->length;
  v18[1] = v9;
  BOOL v10 = *(void *)&v18[0] == v20[0];
  if (*(void *)&v18[0] && *(void *)&v18[0] == v20[0])
  {
    unint64_t v11 = 1;
    do
    {
      uint64_t v12 = *((void *)v18 + v11);
      uint64_t v13 = v20[v11];
      BOOL v10 = v12 == v13;
      if (v11 >= *(void *)&v18[0]) {
        break;
      }
      ++v11;
    }
    while (v12 == v13);
  }
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXWidgetBar.m" lineNumber:235 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v14 = [(PXWidgetBar *)self checkOutTileWithKind:1];
  v15 = [(PXWidgetBar *)self _tilesInUse];
  [v15 addObject:v14];

  return v14;
}

- (void)_updateLayoutIfNeeded
{
  if (self->_needsUpdateFlags.layout)
  {
    self->_needsUpdateFlags.layout = 0;
    [(PXWidgetBar *)self _viewHeight];
    double v4 = v3;
    id v5 = [(PXWidgetBar *)self _layout];
    [v5 setHeight:v4];
  }
}

- (void)_invalidateLayout
{
  self->_needsUpdateFlags.layout = 1;
  [(PXWidgetBar *)self _setNeedsUpdate];
}

- (void)_updateViewHeightIfNeeded
{
  if (self->_needsUpdateFlags.viewHeight)
  {
    self->_needsUpdateFlags.viewHeight = 0;
    [(PXWidgetBar *)self viewHeight];
    -[PXWidgetBar _setViewHeight:](self, "_setViewHeight:");
  }
}

- (void)invalidateViewHeight
{
  self->_needsUpdateFlags.viewHeight = 1;
  [(PXWidgetBar *)self _setNeedsUpdate];
}

- (void)_updateViewIfNeeded
{
  if (self->_needsUpdateFlags.view)
  {
    self->_needsUpdateFlags.view = 0;
    id v3 = [(PXWidgetBar *)self view];
    if (!v3)
    {
      id v3 = [(PXWidgetBar *)self createView];
      objc_storeStrong((id *)&self->_view, v3);
      [(PXWidgetBar *)self invalidateViewHeight];
    }
    [(PXWidgetBar *)self updateView];
  }
}

- (void)invalidateView
{
  self->_needsUpdateFlags.view = 1;
  [(PXWidgetBar *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PXWidgetBar *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXWidgetBar *)self _updateViewIfNeeded];
    [(PXWidgetBar *)self _updateViewHeightIfNeeded];
    [(PXWidgetBar *)self _updateLayoutIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXWidgetBar.m" lineNumber:157 description:@"not inside -performChanges: or -update"];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.view || self->_needsUpdateFlags.viewHeight || self->_needsUpdateFlags.layout;
}

- (void)performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXWidgetBar *)self _updateIfNeeded];
  }
}

- (void)setAllowUserInteractionWithSubtitle:(BOOL)a3
{
  if (self->_allowUserInteractionWithSubtitle != a3)
  {
    self->_allowUserInteractionWithSubtitle = a3;
    [(PXWidgetBar *)self invalidateView];
  }
}

- (void)_setViewHeight:(double)a3
{
  if (self->__viewHeight != a3)
  {
    self->__viewHeight = a3;
    [(PXWidgetBar *)self _invalidateLayout];
  }
}

- (double)viewHeight
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXWidgetBar.m", 114, @"Method %s is a responsibility of subclass %@", "-[PXWidgetBar viewHeight]", v6 object file lineNumber description];

  abort();
}

- (id)createView
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXWidgetBar.m", 106, @"Method %s is a responsibility of subclass %@", "-[PXWidgetBar createView]", v6 object file lineNumber description];

  abort();
}

- (void)checkInTile:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  long long v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXWidgetBar.m", 102, @"Method %s is a responsibility of subclass %@", "-[PXWidgetBar checkInTile:]", v8 object file lineNumber description];

  abort();
}

- (id)checkOutTileWithKind:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXWidgetBar.m", 98, @"Method %s is a responsibility of subclass %@", "-[PXWidgetBar checkOutTileWithKind:]", v7 object file lineNumber description];

  abort();
}

- (id)createTileAnimator
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXWidgetBar.m", 94, @"Method %s is a responsibility of subclass %@", "-[PXWidgetBar createTileAnimator]", v6 object file lineNumber description];

  abort();
}

- (void)didSelectDisclosureAffordance
{
  if (self->_delegateRespondsTo.didSelectDisclosureAffordance)
  {
    id v3 = [(PXWidgetBar *)self delegate];
    [v3 widgetBarDidSelectDisclosureAffordance:self];
  }
}

- (void)didSelectSubtitle
{
  if (self->_delegateRespondsTo.didSelectSubtitle)
  {
    id v3 = [(PXWidgetBar *)self delegate];
    [v3 widgetBarDidSelectSubtitle:self];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didSelectSubtitle = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.didSelectDisclosureAffordance = objc_opt_respondsToSelector() & 1;
  }
}

- (PXWidgetBar)initWithScrollViewController:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXWidgetBar;
  id v5 = [(PXWidgetBar *)&v17 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollViewController, v4);
    uint64_t v7 = [(PXWidgetBar *)v6 createTileAnimator];
    tileAnimator = v6->__tileAnimator;
    v6->__tileAnimator = (PXBasicTileAnimator *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    tilesInUse = v6->__tilesInUse;
    v6->__tilesInUse = (NSMutableSet *)v9;

    unint64_t v11 = objc_alloc_init(PXWidgetBarLayout);
    layout = v6->__layout;
    v6->__layout = v11;
    uint64_t v13 = v11;

    v14 = [[PXTilingController alloc] initWithLayout:v13];
    tilingController = v6->_tilingController;
    v6->_tilingController = v14;

    [(PXTilingController *)v6->_tilingController setScrollController:v4];
    [(PXTilingController *)v6->_tilingController setTileAnimator:v6->__tileAnimator];
    [(PXTilingController *)v6->_tilingController setTileSource:v6];
    [(PXTilingController *)v6->_tilingController setTransitionDelegate:v6];
  }
  return v6;
}

- (PXWidgetBar)init
{
  return [(PXWidgetBar *)self initWithScrollViewController:0];
}

@end