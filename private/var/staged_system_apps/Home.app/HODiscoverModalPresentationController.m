@interface HODiscoverModalPresentationController
- (BOOL)shouldAllowViewTranslation;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIVisualEffectView)blurView;
- (void)_setPresenteViewControllerBackToOriginalPosition;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalPanTranslationChanged:(double)a3;
- (void)dismissalPanTranslationEnded;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)handleTap:(id)a3;
- (void)presentationTransitionWillBegin;
- (void)setBlurView:(id)a3;
@end

@implementation HODiscoverModalPresentationController

- (BOOL)shouldAllowViewTranslation
{
  v2 = [(HODiscoverModalPresentationController *)self presentedViewController];
  v3 = [v2 view];
  [v3 frame];
  BOOL v5 = v4 > 40.0;

  return v5;
}

- (void)dismissalPanTranslationChanged:(double)a3
{
  double v4 = a3 + 40.0;
  BOOL v5 = [(HODiscoverModalPresentationController *)self presentedViewController];
  v6 = [v5 view];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  v11 = [(HODiscoverModalPresentationController *)self presentedViewController];
  v12 = [v11 view];
  [v12 frame];
  double v14 = v13;

  id v16 = [(HODiscoverModalPresentationController *)self presentedViewController];
  v15 = [v16 view];
  [v15 setFrame:v14 fmax(v4, 40.0) v8 v10];
}

- (void)dismissalPanTranslationEnded
{
  v3 = [(HODiscoverModalPresentationController *)self presentedViewController];
  double v4 = [v3 view];
  [v4 bounds];
  double v6 = v5 * 0.75;

  double v7 = [(HODiscoverModalPresentationController *)self presentedViewController];
  double v8 = [v7 view];
  [v8 frame];
  double v10 = v9;

  v11 = [(HODiscoverModalPresentationController *)self presentedViewController];
  v12 = [v11 view];
  [v12 bounds];
  double v14 = v13 - v10;

  if (v14 >= v6)
  {
    [(HODiscoverModalPresentationController *)self _setPresenteViewControllerBackToOriginalPosition];
  }
  else
  {
    id v15 = [(HODiscoverModalPresentationController *)self presentedViewController];
    [v15 dismissViewControllerAnimated:1 completion:0];
  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(HODiscoverModalPresentationController *)self containerView];

  if (v3)
  {
    double v4 = [(HODiscoverModalPresentationController *)self containerView];
    [v4 bounds];
    float v6 = v5;
    double v7 = [(HODiscoverModalPresentationController *)self containerView];
    [v7 bounds];
    float v9 = v8;
    double v10 = fminf(v6, v9);

    double width = v10 + -120.0;
    v12 = [(HODiscoverModalPresentationController *)self containerView];
    [v12 bounds];
    double x = (v13 - width) * 0.5;

    id v15 = [(HODiscoverModalPresentationController *)self containerView];
    [v15 bounds];
    double height = v16 + -40.0;

    double y = 40.0;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  double v19 = x;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = y;
  result.origin.double x = v19;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  v3 = [(HODiscoverModalPresentationController *)self presentedView];

  if (v3)
  {
    [(HODiscoverModalPresentationController *)self frameOfPresentedViewInContainerView];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(HODiscoverModalPresentationController *)self presentedView];
    [v12 setFrame:v5, v7, v9, v11];
  }
}

- (void)presentationTransitionWillBegin
{
  uint64_t v3 = [(HODiscoverModalPresentationController *)self containerView];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(HODiscoverModalPresentationController *)self presentedViewController];
    double v6 = [v5 transitionCoordinator];

    if (v6)
    {
      double v7 = [(HODiscoverModalPresentationController *)self blurView];

      if (!v7)
      {
        id v8 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:0];
        [(HODiscoverModalPresentationController *)self setBlurView:v8];

        double v9 = [(HODiscoverModalPresentationController *)self blurView];
        [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v10 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
        double v11 = [(HODiscoverModalPresentationController *)self blurView];
        [v11 addGestureRecognizer:v10];
      }
      id v12 = [(HODiscoverModalPresentationController *)self blurView];
      [v12 setEffect:0];

      double v13 = [(HODiscoverModalPresentationController *)self containerView];
      double v14 = [(HODiscoverModalPresentationController *)self blurView];
      [v13 addSubview:v14];

      v41 = [(HODiscoverModalPresentationController *)self blurView];
      v39 = [v41 leadingAnchor];
      v40 = [(HODiscoverModalPresentationController *)self containerView];
      v38 = [v40 leadingAnchor];
      v37 = [v39 constraintEqualToAnchor:v38];
      v43[0] = v37;
      v36 = [(HODiscoverModalPresentationController *)self blurView];
      v34 = [v36 trailingAnchor];
      v35 = [(HODiscoverModalPresentationController *)self containerView];
      v33 = [v35 trailingAnchor];
      v32 = [v34 constraintEqualToAnchor:v33];
      v43[1] = v32;
      v31 = [(HODiscoverModalPresentationController *)self blurView];
      v30 = [v31 topAnchor];
      id v15 = [(HODiscoverModalPresentationController *)self containerView];
      double v16 = [v15 topAnchor];
      v17 = [v30 constraintEqualToAnchor:v16];
      v43[2] = v17;
      v18 = [(HODiscoverModalPresentationController *)self blurView];
      double v19 = [v18 bottomAnchor];
      double v20 = [(HODiscoverModalPresentationController *)self containerView];
      double v21 = [v20 bottomAnchor];
      v22 = [v19 constraintEqualToAnchor:v21];
      v43[3] = v22;
      v23 = +[NSArray arrayWithObjects:v43 count:4];
      +[NSLayoutConstraint activateConstraints:v23];

      v24 = [(HODiscoverModalPresentationController *)self blurView];
      v25 = [v24 contentView];
      v26 = [(HODiscoverModalPresentationController *)self presentedViewController];
      v27 = [v26 view];
      [v25 addSubview:v27];

      v28 = [(HODiscoverModalPresentationController *)self presentedViewController];
      v29 = [v28 transitionCoordinator];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000460E8;
      v42[3] = &unk_1000C3FB0;
      v42[4] = self;
      [v29 animateAlongsideTransition:v42 completion:0];
    }
  }
}

- (void)dismissalTransitionWillBegin
{
  uint64_t v3 = [(HODiscoverModalPresentationController *)self presentedViewController];
  double v4 = [v3 transitionCoordinator];

  if (v4)
  {
    double v5 = [(HODiscoverModalPresentationController *)self presentedViewController];
    double v6 = [v5 transitionCoordinator];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100046224;
    v7[3] = &unk_1000C3FB0;
    v7[4] = self;
    [v6 animateAlongsideTransition:v7 completion:0];
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(HODiscoverModalPresentationController *)self blurView];
    [v3 removeFromSuperview];
  }
}

- (void)handleTap:(id)a3
{
  id v3 = [(HODiscoverModalPresentationController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_setPresenteViewControllerBackToOriginalPosition
{
  id v3 = [(HODiscoverModalPresentationController *)self presentedViewController];
  double v4 = [v3 view];
  [v4 frame];
  double v6 = v5;

  if (v6 != 40.0)
  {
    double v7 = [(HODiscoverModalPresentationController *)self presentedViewController];
    id v8 = [v7 view];
    [v8 layoutIfNeeded];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100046400;
    v9[3] = &unk_1000C1CF8;
    v9[4] = self;
    +[UIView animateWithDuration:0x10000 delay:v9 options:0 animations:0.300000012 completion:0.0];
  }
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end