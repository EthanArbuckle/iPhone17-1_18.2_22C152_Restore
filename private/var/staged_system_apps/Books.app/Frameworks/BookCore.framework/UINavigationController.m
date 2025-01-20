@interface UINavigationController
- (id)_bc_activeNavBarSnapshot;
- (id)bc_navBarSnapshot;
- (id)im_visibleChildViewControllers;
- (void)_bc_setActiveNavBarSnapshot:(id)a3;
- (void)bc_updateNavBarVisibleWithTransitionCoordinator:(id)a3;
- (void)bc_updateNavBarVisibleWithTransitionCoordinator:(id)a3 duration:(double)a4;
- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation UINavigationController

- (id)im_visibleChildViewControllers
{
  v3 = [(UINavigationController *)self topViewController];
  if (v3)
  {
    v4 = [(UINavigationController *)self topViewController];
    v7 = v4;
    v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(UINavigationController *)self childViewControllers];
  id v8 = [v7 indexOfObjectIdenticalTo:v6];

  v9 = [(UINavigationController *)self delegate];
  v10 = BUProtocolCast();

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v11 = [(UINavigationController *)self topViewController];

    if (v11 == v6)
    {
      v12 = self;
      BOOL v13 = v4;
    }
    else
    {
      if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v16.receiver = self;
        v16.super_class = (Class)UINavigationController;
        [(UINavigationController *)&v16 im_dismissChildViewController:self animated:v4];
        goto LABEL_10;
      }
      id v14 = [(UINavigationController *)self popToViewController:v6 animated:0];
      v12 = self;
      BOOL v13 = 0;
    }
    id v15 = [(UINavigationController *)v12 popViewControllerAnimated:v13];
    goto LABEL_10;
  }
  [v10 im_navigationController:self dismissChildViewController:v6 animated:v4];
LABEL_10:
}

- (void)bc_updateNavBarVisibleWithTransitionCoordinator:(id)a3 duration:(double)a4
{
  id v6 = a3;
  objc_opt_class();
  v7 = [(UINavigationController *)self topViewController];
  id v8 = [v7 presentedViewController];
  v9 = BUDynamicCast();

  if (([v9 hidesNavigationBarDuringPresentation] & 1) == 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_133130;
    v12[3] = &unk_2C3D40;
    v12[4] = self;
    *(double *)&v12[5] = a4;
    v10 = objc_retainBlock(v12);
    id v11 = v10;
    if (v6) {
      [v6 animateAlongsideTransition:v10 completion:0];
    }
    else {
      ((void (*)(void *, void))v10[2])(v10, 0);
    }
  }
}

- (void)bc_updateNavBarVisibleWithTransitionCoordinator:(id)a3
{
}

- (id)bc_navBarSnapshot
{
  v2 = [(UINavigationController *)self navigationBar];
  [v2 frame];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v7 = CGRectGetHeight(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v18);
  v10 = [v2 resizableSnapshotViewFromRect:0 afterScreenUpdates:0.0 withCapInsets:UIEdgeInsetsMake(MaxY - v7, v7 + MaxY - v7, 0.0, 0.0)];
  id v11 = objc_alloc((Class)UIView);
  [v10 frame];
  id v12 = [v11 initWithFrame:];
  BOOL v13 = [v2 barTintColor];
  [v12 setBackgroundColor:v13];

  [v12 addSubview:v10];

  return v12;
}

- (id)_bc_activeNavBarSnapshot
{
  return objc_getAssociatedObject(self, &off_2C9A40);
}

- (void)_bc_setActiveNavBarSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self _bc_activeNavBarSnapshot];
  [v5 removeFromSuperview];
  objc_setAssociatedObject(self, &off_2C9A40, v4, (char *)&def_7D91C + 1);
}

@end