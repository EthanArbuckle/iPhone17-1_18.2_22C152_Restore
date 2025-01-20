@interface BSUIDimmingPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (UIColor)dimmingViewBackgroundColor;
- (UIView)dimmingView;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setDimmingViewBackgroundColor:(id)a3;
@end

@implementation BSUIDimmingPresentationController

- (UIView)dimmingView
{
  v3 = (void *)qword_3D4040;
  if (!qword_3D4040)
  {
    id v4 = objc_alloc((Class)UIView);
    v5 = [(BSUIDimmingPresentationController *)self containerView];
    [v5 bounds];
    id v6 = [v4 initWithFrame:];
    v7 = (void *)qword_3D4040;
    qword_3D4040 = (uint64_t)v6;

    [(id)qword_3D4040 setBackgroundColor:self->_dimmingViewBackgroundColor];
    v3 = (void *)qword_3D4040;
  }

  return (UIView *)v3;
}

- (void)setDimmingViewBackgroundColor:(id)a3
{
  id v6 = (UIColor *)a3;
  if (self->_dimmingViewBackgroundColor != v6)
  {
    objc_storeStrong((id *)&self->_dimmingViewBackgroundColor, a3);
    v5 = [(BSUIDimmingPresentationController *)self dimmingView];
    [v5 setBackgroundColor:v6];
  }
}

- (void)presentationTransitionWillBegin
{
  v3 = [(BSUIDimmingPresentationController *)self presentedViewController];
  id v4 = [v3 view];

  v5 = [v4 layer];
  [v5 setCornerRadius:20.0];

  id v6 = [(BSUIDimmingPresentationController *)self containerView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(BSUIDimmingPresentationController *)self dimmingView];
  [v15 setFrame:v8, v10, v12, v14];

  v16 = [(BSUIDimmingPresentationController *)self dimmingView];
  [v16 setAlpha:0.0];

  v17 = [(BSUIDimmingPresentationController *)self containerView];
  v18 = [(BSUIDimmingPresentationController *)self dimmingView];
  [v17 addSubview:v18];

  v19 = [(BSUIDimmingPresentationController *)self presentedViewController];
  v20 = [v19 transitionCoordinator];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_8130;
  v21[3] = &unk_38E0E0;
  v21[4] = self;
  [v20 animateAlongsideTransition:v21 completion:0];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
  {
    id v4 = [(BSUIDimmingPresentationController *)self dimmingView];
    [v4 removeFromSuperview];
  }
}

- (void)dismissalTransitionWillBegin
{
  uint64_t v3 = [(BSUIDimmingPresentationController *)self presentedViewController];
  id v4 = [v3 transitionCoordinator];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8264;
  v5[3] = &unk_38E0E0;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(BSUIDimmingPresentationController *)self dimmingView];
    [v3 removeFromSuperview];
  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = [(BSUIDimmingPresentationController *)self containerView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  double v3 = [(BSUIDimmingPresentationController *)self containerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(BSUIDimmingPresentationController *)self dimmingView];
  [v12 setFrame:v5, v7, v9, v11];

  [(BSUIDimmingPresentationController *)self frameOfPresentedViewInContainerView];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [(BSUIDimmingPresentationController *)self presentedView];
  [v21 setFrame:v14, v16, v18, v20];
}

- (UIColor)dimmingViewBackgroundColor
{
  return self->_dimmingViewBackgroundColor;
}

- (void).cxx_destruct
{
}

@end