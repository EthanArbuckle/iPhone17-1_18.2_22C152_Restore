@interface _UITabBarControllerVisualStyle_CarPlay
- (BOOL)shouldSuppressPresses:(id)a3 withEvent:(id)a4;
- (BOOL)supportsFocusGestures;
- (BOOL)updatesTabBarFocusHeadingOnChange;
- (CGRect)adjustedTabBarFrame:(CGRect)a3;
- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4;
- (int64_t)tabBarPosition;
- (unint64_t)defaultMaxItems;
- (void)_performLeftGesture:(id)a3;
- (void)_performRightGesture:(id)a3;
- (void)updateGestureRecognizers;
@end

@implementation _UITabBarControllerVisualStyle_CarPlay

- (int64_t)tabBarPosition
{
  return 2;
}

- (unint64_t)defaultMaxItems
{
  return 5;
}

- (BOOL)supportsFocusGestures
{
  v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  v3 = [v2 traitCollection];

  BOOL v4 = ([v3 interactionModel] & 2) != 0 || objc_msgSend(v3, "primaryInteractionModel") == 8;
  return v4;
}

- (BOOL)updatesTabBarFocusHeadingOnChange
{
  return 1;
}

- (void)updateGestureRecognizers
{
  v15.receiver = self;
  v15.super_class = (Class)_UITabBarControllerVisualStyle_CarPlay;
  [(_UITabBarControllerVisualStyle *)&v15 updateGestureRecognizers];
  v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v4 = [v3 _containerView];

  v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  v6 = [v5 traitCollection];

  BOOL v7 = [(_UITabBarControllerVisualStyle_CarPlay *)self supportsFocusGestures];
  nudgeLeftGestureRecognizer = self->_nudgeLeftGestureRecognizer;
  if (v7)
  {
    if (!nudgeLeftGestureRecognizer)
    {
      v9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__performLeftGesture_];
      v10 = self->_nudgeLeftGestureRecognizer;
      self->_nudgeLeftGestureRecognizer = v9;

      [(UIGestureRecognizer *)self->_nudgeLeftGestureRecognizer setDelegate:self];
      [(UITapGestureRecognizer *)self->_nudgeLeftGestureRecognizer setAllowedPressTypes:&unk_1ED3F1510];
      [v4 addGestureRecognizer:self->_nudgeLeftGestureRecognizer];
      v11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__performRightGesture_];
      nudgeRightGestureRecognizer = self->_nudgeRightGestureRecognizer;
      self->_nudgeRightGestureRecognizer = v11;

      [(UIGestureRecognizer *)self->_nudgeRightGestureRecognizer setDelegate:self];
      [(UITapGestureRecognizer *)self->_nudgeRightGestureRecognizer setAllowedPressTypes:&unk_1ED3F1528];
      [v4 addGestureRecognizer:self->_nudgeRightGestureRecognizer];
    }
  }
  else if (nudgeLeftGestureRecognizer)
  {
    objc_msgSend(v4, "removeGestureRecognizer:");
    v13 = self->_nudgeLeftGestureRecognizer;
    self->_nudgeLeftGestureRecognizer = 0;

    [v4 removeGestureRecognizer:self->_nudgeRightGestureRecognizer];
    v14 = self->_nudgeRightGestureRecognizer;
    self->_nudgeRightGestureRecognizer = 0;
  }
}

- (BOOL)shouldSuppressPresses:(id)a3 withEvent:(id)a4
{
  if (self->_nudgeLeftGestureRecognizer) {
    return _UIPressesContainsPressTypes(a3, &unk_1ED3F1540);
  }
  else {
    return 0;
  }
}

- (void)_performLeftGesture:(id)a3
{
  id v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v3 _performFocusGesture:4];
}

- (void)_performRightGesture:(id)a3
{
  id v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v3 _performFocusGesture:8];
}

- (CGRect)adjustedTabBarFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  v6 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v7 = [v6 view];
  [v7 safeAreaInsets];
  double v9 = v8;
  double v11 = v10;

  double v12 = width - v9 - v11;
  double v13 = v9;
  double v14 = y;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.double width = v12;
  result.origin.CGFloat y = v14;
  result.origin.x = v13;
  return result;
}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nudgeRightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_nudgeLeftGestureRecognizer, 0);
}

@end