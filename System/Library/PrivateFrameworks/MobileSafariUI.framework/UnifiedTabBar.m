@interface UnifiedTabBar
- (BOOL)canCloseItem:(id)a3;
- (BOOL)canDragOntoActiveTab;
- (BOOL)hidesInactiveTabs;
- (BOOL)shouldPinItemsDroppedAtPoint:(CGPoint)a3;
- (BOOL)shouldSpringLoadItem:(id)a3;
- (BOOL)supportsDropTransitionToItemView;
- (NSArray)items;
- (TabCollectionViewDelegate)delegate;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (id)itemAtPoint:(CGPoint)a3;
- (id)newSearchField;
- (id)targetedDragPreviewForLiftingItem:(id)a3;
- (id)targetedPreviewForDismissingMenuForItem:(id)a3;
- (int64_t)itemDragContentType;
- (unint64_t)contextMenuOptionsForItem:(id)a3;
- (unint64_t)layoutAxes;
- (void)activateItem:(id)a3;
- (void)closeItem:(id)a3;
- (void)didEndShowingContextMenuForItem:(id)a3;
- (void)didSelectItem:(id)a3;
- (void)performDropWithNavigationIntent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)willBeginShowingContextMenuForItem:(id)a3;
@end

@implementation UnifiedTabBar

- (id)newSearchField
{
  return objc_alloc_init(UnifiedField);
}

- (void)didSelectItem:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabCollectionView:self didSelectItem:v5];
}

- (BOOL)canCloseItem:(id)a3
{
  v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = [WeakRetained tabCollectionView:v3 canCloseItem:v5];

  return (char)v3;
}

- (void)closeItem:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabCollectionView:self closeItem:v5];
}

- (NSArray)items
{
  v2 = [(SFUnifiedTabBar *)self itemArrangement];
  v3 = [v2 items];
  v4 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_69);

  return (NSArray *)v4;
}

id __22__UnifiedTabBar_items__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (int64_t)itemDragContentType
{
  if ([(SFUnifiedTabBar *)self role] == 1) {
    return 2;
  }
  else {
    return 3;
  }
}

- (void)activateItem:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabCollectionView:self didSelectItem:v5];
}

- (id)itemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(SFUnifiedTabBar *)self itemArrangement];
  char v7 = [v6 activeItemIsExpanded];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    v9 = -[SFUnifiedTabBar tabBarItemAtPoint:](self, "tabBarItemAtPoint:", x, y);
    v10 = [(SFUnifiedTabBar *)self viewForBarItem:v9];
    v11 = -[SFUnifiedTabBar hitTest:withEvent:](self, "hitTest:withEvent:", 0, x, y);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (id v8 = 0, v11 == v10)) {
      id v8 = v9;
    }
  }
  return v8;
}

- (unint64_t)layoutAxes
{
  return 1;
}

- (BOOL)supportsDropTransitionToItemView
{
  return 1;
}

- (id)targetedDragPreviewForLiftingItem:(id)a3
{
  id v4 = [(SFUnifiedTabBar *)self viewForBarItem:a3];
  id v5 = [v4 window];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1728]);
    char v7 = [(SFUnifiedTabBar *)self itemContainerView];
    [v4 center];
    id v8 = objc_msgSend(v6, "initWithContainer:center:", v7);

    id v9 = objc_alloc(MEMORY[0x1E4FB1D40]);
    v10 = [v4 previewParameters];
    v11 = (void *)[v9 initWithView:v4 parameters:v10 target:v8];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)targetedPreviewForDismissingMenuForItem:(id)a3
{
  id v4 = [(SFUnifiedTabBar *)self viewForBarItem:a3];
  id v5 = [v4 window];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1728]);
    char v7 = [(SFUnifiedTabBar *)self itemContainerView];
    [v4 center];
    id v8 = objc_msgSend(v6, "initWithContainer:center:", v7);

    id v9 = objc_alloc(MEMORY[0x1E4FB1D40]);
    v10 = [v4 previewParameters];
    v11 = (void *)[v9 initWithView:v4 parameters:v10 target:v8];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)contextMenuOptionsForItem:(id)a3
{
  id v4 = a3;
  if ([(UnifiedTabBar *)self hidesInactiveTabs]) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = 4146;
  }
  id v6 = [(SFUnifiedTabBar *)self itemArrangement];
  id v7 = [v6 activeItem];
  if (v7 == v4)
  {
    int64_t v8 = [(SFUnifiedTabBar *)self role];

    if (v8 != 2)
    {
      BOOL v9 = [(SFUnifiedTabBar *)self searchFieldShowsPersistentStopReloadButton];
      uint64_t v10 = 133;
      if (v9) {
        uint64_t v10 = 5;
      }
      v5 |= v10;
    }
  }
  else
  {
  }
  return v5;
}

- (void)willBeginShowingContextMenuForItem:(id)a3
{
  id v3 = [(SFUnifiedTabBar *)self itemContainerView];
  [v3 setUserInteractionEnabled:0];
}

- (void)didEndShowingContextMenuForItem:(id)a3
{
  id v5 = a3;
  id v4 = [(SFUnifiedTabBar *)self itemContainerView];
  [v4 setUserInteractionEnabled:1];

  [(UnifiedTabBar *)self cleanUpDragPreviewForItem:v5];
}

- (BOOL)shouldSpringLoadItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SFUnifiedTabBar *)self itemArrangement];
  id v6 = [v5 activeItem];

  return v6 != v4;
}

- (BOOL)shouldPinItemsDroppedAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SFUnifiedTabBar *)self pinnedItemDropArea];
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (BOOL)hidesInactiveTabs
{
  return [(SFUnifiedTabBar *)self role] == 1;
}

- (BOOL)canDragOntoActiveTab
{
  return [(SFUnifiedTabBar *)self role] != 2;
}

- (void)performDropWithNavigationIntent:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(SFUnifiedTabBar *)self itemArrangement];
    id v6 = [v5 activeItem];
    [WeakRetained tabCollectionView:self item:v6 didProduceNavigationIntent:v7];
  }
}

- (TabCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabCollectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (void)setNavigationIntentHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_delegate);
}

@end