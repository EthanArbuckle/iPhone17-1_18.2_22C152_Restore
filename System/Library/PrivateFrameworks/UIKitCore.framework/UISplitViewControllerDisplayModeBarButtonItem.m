@interface UISplitViewControllerDisplayModeBarButtonItem
- (BOOL)_hasBeenUsed;
- (SEL)action;
- (UISplitViewControllerImpl)_impl;
- (id)target;
- (void)_setImpl:(id)a3;
- (void)_setOwningNavigationItem:(id)a3;
- (void)_wasUsed;
@end

@implementation UISplitViewControllerDisplayModeBarButtonItem

- (void)_setOwningNavigationItem:(id)a3
{
  id v4 = a3;
  v5 = [(UIBarButtonItem *)self _owningNavigationItem];
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewControllerDisplayModeBarButtonItem;
  [(UIBarButtonItem *)&v6 _setOwningNavigationItem:v4];

  if (v4 && !v5) {
    [(UISplitViewControllerDisplayModeBarButtonItem *)self _wasUsed];
  }
}

- (id)target
{
  [(UISplitViewControllerDisplayModeBarButtonItem *)self _wasUsed];
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewControllerDisplayModeBarButtonItem;
  v3 = [(UIBarButtonItem *)&v5 target];
  return v3;
}

- (SEL)action
{
  [(UISplitViewControllerDisplayModeBarButtonItem *)self _wasUsed];
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerDisplayModeBarButtonItem;
  return [(UIBarButtonItem *)&v4 action];
}

- (void)_wasUsed
{
  if (!self->_hasBeenUsed)
  {
    self->_hasBeenUsed = 1;
    id v3 = [(UISplitViewControllerDisplayModeBarButtonItem *)self _impl];
    [v3 _displayModeBarButtonItemWasUsedForFirstTime:self];
  }
}

- (UISplitViewControllerImpl)_impl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  return (UISplitViewControllerImpl *)WeakRetained;
}

- (void)_setImpl:(id)a3
{
}

- (BOOL)_hasBeenUsed
{
  return self->_hasBeenUsed;
}

- (void).cxx_destruct
{
}

@end