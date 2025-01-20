@interface UITabBarController
- (UITabBarAppearance)bc_preferredTabBarScrollEdgeAppearance;
- (id)im_visibleChildViewControllers;
- (void)bc_setPreferredTabBarScrollEdgeAppearance:(id)a3;
- (void)bc_setSelectedIndex:(int64_t)a3;
- (void)im_updateTabBarVisibleWithTransitionCoordinator:(id)a3;
@end

@implementation UITabBarController

- (id)im_visibleChildViewControllers
{
  uint64_t v2 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (UITabBarAppearance)bc_preferredTabBarScrollEdgeAppearance
{
  uint64_t v2 = [(UITabBarController *)self tabBar];
  v3 = [v2 scrollEdgeAppearance];

  return (UITabBarAppearance *)v3;
}

- (void)bc_setPreferredTabBarScrollEdgeAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(UITabBarController *)self tabBar];
  [v5 setScrollEdgeAppearance:v4];
}

- (void)bc_setSelectedIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    v7 = 0;
  }
  else
  {
    id v5 = [(UITabBarController *)self viewControllers];
    if ((unint64_t)[v5 count] <= a3)
    {
      v7 = 0;
    }
    else
    {
      uint64_t v6 = [(UITabBarController *)self viewControllers];
      v7 = [v6 objectAtIndexedSubscript:a3];
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_D44D4;
  v9[3] = &unk_2C6040;
  id v10 = v7;
  id v8 = v7;
  [(UITabBarController *)self im_enumerateVisibleChildrenConformingToProtocol:0 block:v9];
  [(UITabBarController *)self setSelectedIndex:a3];
}

- (void)im_updateTabBarVisibleWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_15DE8C;
  v7[3] = &unk_2C3BE0;
  v7[4] = self;
  id v5 = objc_retainBlock(v7);
  uint64_t v6 = v5;
  if (v4) {
    [v4 animateAlongsideTransition:0 completion:v5];
  }
  else {
    ((void (*)(void *, void))v5[2])(v5, 0);
  }
}

@end