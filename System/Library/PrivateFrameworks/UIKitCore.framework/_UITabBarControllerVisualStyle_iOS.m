@interface _UITabBarControllerVisualStyle_iOS
- (BOOL)supportsShowingMoreItem;
- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4;
- (int64_t)tabBarPosition;
- (unint64_t)defaultMaxItems;
- (void)loadViews;
- (void)tabContentDidChange:(id)a3;
- (void)updateViewControllers:(BOOL)a3;
@end

@implementation _UITabBarControllerVisualStyle_iOS

- (int64_t)tabBarPosition
{
  return 1;
}

- (void)loadViews
{
  v15 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  v2 = -[UITabBarController _internalTabBar](v15);

  if (!v2)
  {
    v3 = [v15 view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = -[UITabBar initWithFrame:]([UITabBar alloc], "initWithFrame:", v5, v7, v9, v11);
    [v15 setTabBar:v12];
  }
  if (dyld_program_sdk_at_least())
  {
    v13 = +[UIColor systemBackgroundColor];
    v14 = [v15 view];
    [v14 setBackgroundColor:v13];
  }
}

- (BOOL)supportsShowingMoreItem
{
  return 1;
}

- (void)updateViewControllers:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v4 _rebuildTabBarItemsAnimated:v3];
}

- (unint64_t)defaultMaxItems
{
  v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v3 = [v2 traitCollection];

  uint64_t v4 = [v3 horizontalSizeClass];
  uint64_t v5 = [v3 userInterfaceIdiom];
  uint64_t v6 = 5;
  if (v5 == 1) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 5;
  }
  if (v4 != 1) {
    uint64_t v6 = 8;
  }
  if (v4) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v7;
  }

  return v8;
}

- (void)tabContentDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  -[UITabBarController _internalTabBar](v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v7 isLocked];
  [v7 setLocked:0];
  [v4 _updateView];

  [v7 setLocked:v6];
}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  if (+[UIView _uip_transitionEnabled]() && !_AXSReduceMotionEnabled())
  {
    uint64_t v6 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    id v7 = [v6 view];
    unint64_t v8 = [v7 backgroundColor];

    uint64_t v5 = [[_UITabCrossFadeTransition alloc] initWithBackgroundColor:v8];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

@end