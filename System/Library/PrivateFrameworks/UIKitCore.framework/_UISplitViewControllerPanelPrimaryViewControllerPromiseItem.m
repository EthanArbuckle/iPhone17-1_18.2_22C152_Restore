@interface _UISplitViewControllerPanelPrimaryViewControllerPromiseItem
- (BOOL)_isLazyFocusItemContainer;
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (UICoordinateSpace)coordinateSpace;
- (UISplitViewControllerPanelImpl)impl;
- (UIView)parentView;
- (_UISplitViewControllerPanelPrimaryViewControllerPromiseItem)initWithParentView:(id)a3 impl:(id)a4;
- (id)focusItemsInRect:(CGRect)a3;
- (void)setImpl:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setParentView:(id)a3;
- (void)updateFocusIfNeeded;
@end

@implementation _UISplitViewControllerPanelPrimaryViewControllerPromiseItem

- (_UISplitViewControllerPanelPrimaryViewControllerPromiseItem)initWithParentView:(id)a3 impl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_UISplitViewControllerPanelPrimaryViewControllerPromiseItem;
  v8 = [(_UISplitViewControllerPanelPrimaryViewControllerPromiseItem *)&v27 init];
  v9 = v8;
  if (!v8)
  {
LABEL_8:
    v10 = v9;
    goto LABEL_9;
  }
  v10 = 0;
  if (v6 && v7)
  {
    objc_storeWeak((id *)&v8->_parentView, v6);
    objc_storeWeak((id *)&v9->_impl, v7);
    [v6 bounds];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    CGFloat v18 = v17;
    CGFloat v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    int v20 = [v7 _layoutPrimaryOnRight];
    uint64_t v21 = v12;
    uint64_t v22 = v14;
    uint64_t v23 = v16;
    CGFloat v24 = v18;
    if (v20) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    }
    else {
      double MaxX = CGRectGetMinX(*(CGRect *)&v21) + -100.0;
    }
    v9->_frame.origin.x = MaxX;
    v9->_frame.origin.y = v19;
    v9->_frame.size.width = 100.0;
    v9->_frame.size.height = v18;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNeedsFocusUpdate
{
  id v3 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  id v2 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(_UISplitViewControllerPanelPrimaryViewControllerPromiseItem *)self impl];
  [v3 _triggerDisplayModeAction:v3];
  v4 = [v3 panelController];
  [v4 setNeedsUpdate];

  v5 = [v3 panelController];
  id v6 = [v5 view];
  [v6 layoutIfNeeded];

  id v7 = [v3 splitViewController];
  v8 = [v7 masterViewController];
  v9 = [v8 view];

  if (v9)
  {
    v12[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (UICoordinateSpace)coordinateSpace
{
  id v2 = [(_UISplitViewControllerPanelPrimaryViewControllerPromiseItem *)self parentView];
  id v3 = [v2 coordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (BOOL)_isLazyFocusItemContainer
{
  return 1;
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  return (UIView *)WeakRetained;
}

- (void)setParentView:(id)a3
{
}

- (UISplitViewControllerPanelImpl)impl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  return (UISplitViewControllerPanelImpl *)WeakRetained;
}

- (void)setImpl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_impl);
  objc_destroyWeak((id *)&self->_parentView);
}

@end