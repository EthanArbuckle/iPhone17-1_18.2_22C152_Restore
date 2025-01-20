@interface TSDiOSModalPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (TSDiOSModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
@end

@implementation TSDiOSModalPresentationController

- (TSDiOSModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDiOSModalPresentationController;
  v4 = [(TSDiOSModalPresentationController *)&v9 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    dimmingView = v4->_dimmingView;
    v4->_dimmingView = (UIView *)v5;

    v7 = +[UIColor colorWithWhite:0.0 alpha:0.4];
    [(UIView *)v4->_dimmingView setBackgroundColor:v7];

    [(UIView *)v4->_dimmingView setAutoresizingMask:18];
  }
  return v4;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(TSDiOSModalPresentationController *)self presentedViewController];

  if (v8 == v7)
  {
    [v7 preferredContentSize];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TSDiOSModalPresentationController;
    -[TSDiOSModalPresentationController sizeForChildContentContainer:withParentContainerSize:](&v15, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(TSDiOSModalPresentationController *)self containerView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(TSDiOSModalPresentationController *)self presentedViewController];
  [v12 preferredContentSize];
  double v13 = sub_100064070();
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  double v20 = sub_100065A10(v13, v15, v17, v19, v5, v7, v9, v11);
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v3 = [(TSDiOSModalPresentationController *)self containerView];
  double v4 = [(TSDiOSModalPresentationController *)self presentedView];
  [v3 bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  [v3 addSubview:self->_dimmingView];
  CGFloat v5 = [(TSDiOSModalPresentationController *)self presentedViewController];
  double v6 = [v5 parentViewController];

  if (v6)
  {
    [v5 willMoveToParentViewController:0];
    [v4 removeFromSuperview];
    [v5 removeFromParentViewController];
  }
  [v4 setTranslatesAutoresizingMaskIntoConstraints:1];
  [v4 setAutoresizingMask:45];
  [v3 addSubview:v4];
  CGFloat v7 = [v5 transitionCoordinator];
  if (v7)
  {
    [(UIView *)self->_dimmingView setAlpha:0.0];
    double v8 = [v5 transitionCoordinator];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003E8B2C;
    v9[3] = &unk_1014D98D0;
    v9[4] = self;
    [v8 animateAlongsideTransition:v9 completion:0];
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3) {
    [(UIView *)self->_dimmingView removeFromSuperview];
  }
}

- (void)dismissalTransitionWillBegin
{
  v3 = [(TSDiOSModalPresentationController *)self presentedViewController];
  double v4 = [v3 transitionCoordinator];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003E8C04;
  v5[3] = &unk_1014D98D0;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

@end