@interface UIAlertControllerDescriptor
- (BOOL)applicationIsFullscreen;
- (BOOL)hasContentViewController;
- (BOOL)hasHeaderContentViewController;
- (BOOL)hasMessage;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (UIEdgeInsets)containerViewSafeAreaInsets;
- (int64_t)numberOfActions;
- (int64_t)numberOfVisibleActions;
- (void)setApplicationIsFullscreen:(BOOL)a3;
- (void)setContainerViewSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setHasContentViewController:(BOOL)a3;
- (void)setHasHeaderContentViewController:(BOOL)a3;
- (void)setHasMessage:(BOOL)a3;
- (void)setHasTitle:(BOOL)a3;
- (void)setNumberOfActions:(int64_t)a3;
- (void)setNumberOfVisibleActions:(int64_t)a3;
@end

@implementation UIAlertControllerDescriptor

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(UIAlertControllerDescriptor *)self hasHeaderContentViewController];
    if (v6 == [v5 hasHeaderContentViewController]
      && (int v7 = [(UIAlertControllerDescriptor *)self hasTitle],
          v7 == [v5 hasTitle])
      && (int v8 = [(UIAlertControllerDescriptor *)self hasMessage],
          v8 == [v5 hasMessage])
      && (int v9 = [(UIAlertControllerDescriptor *)self hasContentViewController],
          v9 == [v5 hasContentViewController])
      && (int64_t v10 = [(UIAlertControllerDescriptor *)self numberOfActions],
          v10 == [v5 numberOfActions])
      && (int64_t v11 = [(UIAlertControllerDescriptor *)self numberOfVisibleActions],
          v11 == [v5 numberOfVisibleActions])
      && (int v12 = [(UIAlertControllerDescriptor *)self applicationIsFullscreen],
          v12 == [v5 applicationIsFullscreen]))
    {
      [(UIAlertControllerDescriptor *)self containerViewSafeAreaInsets];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      [v5 containerViewSafeAreaInsets];
      BOOL v26 = v18 == v25;
      if (v16 != v27) {
        BOOL v26 = 0;
      }
      if (v22 != v24) {
        BOOL v26 = 0;
      }
      BOOL v13 = v20 == v23 && v26;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)hasHeaderContentViewController
{
  return self->_hasHeaderContentViewController;
}

- (void)setHasHeaderContentViewController:(BOOL)a3
{
  self->_hasHeaderContentViewController = a3;
}

- (BOOL)hasTitle
{
  return self->_hasTitle;
}

- (void)setHasTitle:(BOOL)a3
{
  self->_hasTitle = a3;
}

- (BOOL)hasMessage
{
  return self->_hasMessage;
}

- (void)setHasMessage:(BOOL)a3
{
  self->_hasMessage = a3;
}

- (BOOL)hasContentViewController
{
  return self->_hasContentViewController;
}

- (void)setHasContentViewController:(BOOL)a3
{
  self->_hasContentViewController = a3;
}

- (int64_t)numberOfActions
{
  return self->_numberOfActions;
}

- (void)setNumberOfActions:(int64_t)a3
{
  self->_numberOfActions = a3;
}

- (BOOL)applicationIsFullscreen
{
  return self->_applicationIsFullscreen;
}

- (void)setApplicationIsFullscreen:(BOOL)a3
{
  self->_applicationIsFullscreen = a3;
}

- (UIEdgeInsets)containerViewSafeAreaInsets
{
  objc_copyStruct(v6, &self->_containerViewSafeAreaInsets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContainerViewSafeAreaInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3 = a3;
  objc_copyStruct(&self->_containerViewSafeAreaInsets, &v3, 32, 1, 0);
}

- (int64_t)numberOfVisibleActions
{
  return self->_numberOfVisibleActions;
}

- (void)setNumberOfVisibleActions:(int64_t)a3
{
  self->_numberOfVisibleActions = a3;
}

@end