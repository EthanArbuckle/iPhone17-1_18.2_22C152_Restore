@interface TabDragMetadata
- (BOOL)dragPreviewPinned;
- (BrowserController)browserController;
- (TabCollectionItem)tabItem;
- (TabCollectionView)targetTabViewForDragPreview;
- (WBTab)tab;
- (void)setBrowserController:(id)a3;
- (void)setDragPreviewPinned:(BOOL)a3;
- (void)setTab:(id)a3;
- (void)setTabItem:(id)a3;
- (void)setTargetTabViewForDragPreview:(id)a3;
@end

@implementation TabDragMetadata

- (WBTab)tab
{
  return self->_tab;
}

- (void)setTab:(id)a3
{
}

- (TabCollectionItem)tabItem
{
  return self->_tabItem;
}

- (void)setTabItem:(id)a3
{
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (void)setBrowserController:(id)a3
{
}

- (BOOL)dragPreviewPinned
{
  return self->_dragPreviewPinned;
}

- (void)setDragPreviewPinned:(BOOL)a3
{
  self->_dragPreviewPinned = a3;
}

- (TabCollectionView)targetTabViewForDragPreview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetTabViewForDragPreview);
  return (TabCollectionView *)WeakRetained;
}

- (void)setTargetTabViewForDragPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetTabViewForDragPreview);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_tabItem, 0);
  objc_storeStrong((id *)&self->_tab, 0);
}

@end