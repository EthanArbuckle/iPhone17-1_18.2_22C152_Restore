@interface PUToolbarViewModel
- (BOOL)needsToUpdateToolbarSize;
- (NSArray)toolbarItems;
- (PUToolbarViewModelChange)currentChange;
- (UIView)accessoryView;
- (UIViewController)_viewController;
- (double)accessoryViewMaximumHeight;
- (double)accessoryViewTopOutset;
- (double)maximumHeight;
- (id)newViewModelChange;
- (void)_setViewController:(id)a3;
- (void)didPublishChanges;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewMaximumHeight:(double)a3;
- (void)setAccessoryViewTopOutset:(double)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setNeedsToUpdateToolbarSize:(BOOL)a3;
- (void)setToolbarItems:(id)a3;
@end

@implementation PUToolbarViewModel

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__viewController);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
}

- (void)setNeedsToUpdateToolbarSize:(BOOL)a3
{
  self->_needsToUpdateToolbarSize = a3;
}

- (BOOL)needsToUpdateToolbarSize
{
  return self->_needsToUpdateToolbarSize;
}

- (void)_setViewController:(id)a3
{
}

- (UIViewController)_viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewController);
  return (UIViewController *)WeakRetained;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (double)accessoryViewMaximumHeight
{
  return self->_accessoryViewMaximumHeight;
}

- (double)accessoryViewTopOutset
{
  return self->_accessoryViewTopOutset;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (void)didPublishChanges
{
  v5.receiver = self;
  v5.super_class = (Class)PUToolbarViewModel;
  [(PUViewModel *)&v5 didPublishChanges];
  if ([(PUToolbarViewModel *)self needsToUpdateToolbarSize])
  {
    [(PUToolbarViewModel *)self setNeedsToUpdateToolbarSize:0];
    v3 = [(PUToolbarViewModel *)self _viewController];
    v4 = [v3 navigationController];

    if (([v4 isToolbarHidden] & 1) == 0) {
      [v4 _positionToolbarHidden:0];
    }
  }
}

- (PUToolbarViewModelChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUToolbarViewModel;
  v2 = [(PUViewModel *)&v4 currentChange];
  return (PUToolbarViewModelChange *)v2;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUToolbarViewModelChange);
}

- (void)setMaximumHeight:(double)a3
{
  if (self->_maximumHeight != a3)
  {
    self->_maximumHeight = a3;
    id v3 = [(PUToolbarViewModel *)self currentChange];
    [v3 _setMaximumHeightChanged:1];
  }
}

- (void)setAccessoryViewMaximumHeight:(double)a3
{
  if (self->_accessoryViewMaximumHeight != a3)
  {
    self->_accessoryViewMaximumHeight = a3;
    id v3 = [(PUToolbarViewModel *)self currentChange];
    [v3 _setAccessoryViewMaximumHeightChanged:1];
  }
}

- (void)setAccessoryViewTopOutset:(double)a3
{
  if (self->_accessoryViewTopOutset != a3)
  {
    self->_accessoryViewTopOutset = a3;
    id v3 = [(PUToolbarViewModel *)self currentChange];
    [v3 _setAccessoryViewTopOutsetChanged:1];
  }
}

- (void)setAccessoryView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    v6 = [(PUToolbarViewModel *)self currentChange];
    [v6 _setAccessoryViewChanged:1];

    objc_super v5 = v7;
  }
}

- (void)setToolbarItems:(id)a3
{
  objc_super v4 = (NSArray *)a3;
  objc_super v5 = v4;
  if (self->_toolbarItems != v4)
  {
    v10 = v4;
    char v6 = -[NSArray isEqual:](v4, "isEqual:");
    objc_super v5 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)[(NSArray *)v10 copy];
      toolbarItems = self->_toolbarItems;
      self->_toolbarItems = v7;

      v9 = [(PUToolbarViewModel *)self currentChange];
      [v9 _setToolbarItemsChanged:1];

      objc_super v5 = v10;
    }
  }
}

@end