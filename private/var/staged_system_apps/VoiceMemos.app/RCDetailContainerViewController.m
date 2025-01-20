@interface RCDetailContainerViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)cardInsets:(BOOL)a3 forDisplayMode:(int64_t)a4;
- (UIViewController)hostedViewController;
- (void)adjustConstraints:(BOOL)a3 forDisplayMode:(int64_t)a4;
- (void)adjustConstraintsForDisplayMode:(int64_t)a3;
- (void)loadView;
- (void)setDimmed:(BOOL)a3;
- (void)setHostedViewController:(id)a3;
- (void)setupConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RCDetailContainerViewController

- (void)adjustConstraints:(BOOL)a3 forDisplayMode:(int64_t)a4
{
  [(RCDetailContainerViewController *)self cardInsets:a3 forDisplayMode:a4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_bottomConstraint setConstant:-v8];
  [(NSLayoutConstraint *)self->_leftConstraint setConstant:v6];
  rightConstraint = self->_rightConstraint;

  [(NSLayoutConstraint *)rightConstraint setConstant:v10];
}

- (UIEdgeInsets)cardInsets:(BOOL)a3 forDisplayMode:(int64_t)a4
{
  CGFloat top = UIEdgeInsetsZero.top;
  CGFloat left = UIEdgeInsetsZero.left;
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  double v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v9 playbackCardHasInsets])
  {
    if (a4 == 2)
    {
      double v10 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v10 playbackViewEdgeInsets];
      CGFloat top = v11;
      CGFloat left = v12;
      CGFloat bottom = v13;
      double right = v14;
    }
    double right = -right;
  }

  double v15 = top;
  double v16 = left;
  double v17 = bottom;
  double v18 = right;
  result.double right = v18;
  result.CGFloat bottom = v17;
  result.CGFloat left = v16;
  result.CGFloat top = v15;
  return result;
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v5 = [v3 initWithFrame:];

  [v5 setAutoresizingMask:18];
  [(RCDetailContainerViewController *)self setView:v5];
  self->_displayMode = 2;
}

- (void)setHostedViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  p_hostedViewController = &self->_hostedViewController;
  hostedViewController = self->_hostedViewController;
  if (hostedViewController != v5)
  {
    double v11 = v5;
    if (hostedViewController)
    {
      double v8 = [(UIViewController *)hostedViewController view];
      [v8 removeFromSuperview];

      [(UIViewController *)*p_hostedViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_hostedViewController, a3);
    [(RCDetailContainerViewController *)self addChildViewController:v11];
    double v9 = [(RCDetailContainerViewController *)self view];
    double v10 = [(UIViewController *)v11 view];
    [v9 addSubview:v10];

    [(UIViewController *)*p_hostedViewController didMoveToParentViewController:self];
    [(RCDetailContainerViewController *)self setupConstraints];
    id v5 = v11;
  }
}

- (void)adjustConstraintsForDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
  [(RCDetailContainerViewController *)self adjustConstraints:1 forDisplayMode:a3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  *a4 = 1;
  char v18 = 0;
  id v5 = [(RCDetailContainerViewController *)self parentViewController];
  [v5 _edgeInsetsForChildViewController:self insetsAreAbsolute:&v18];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.double right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)RCDetailContainerViewController;
  id v7 = a4;
  -[RCDetailContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_transitionSize.double width = width;
  self->_transitionSize.double height = height;
  self->_isTransitioningSizes = 1;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004E914;
  v9[3] = &unk_100221960;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E92C;
  v8[3] = &unk_100221960;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)RCDetailContainerViewController;
  [(RCDetailContainerViewController *)&v2 viewDidLayoutSubviews];
}

- (void)setupConstraints
{
  id v3 = [(RCDetailContainerViewController *)self view];
  v4 = [(UIViewController *)self->_hostedViewController view];
  id v5 = v4;
  if (v3 && v4)
  {
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = +[NSLayoutConstraint constraintWithItem:v5 attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
    topConstraint = self->_topConstraint;
    self->_topConstraint = v6;

    double v8 = +[NSLayoutConstraint constraintWithItem:v5 attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v8;

    objc_super v10 = +[NSLayoutConstraint constraintWithItem:v5 attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
    leftConstraint = self->_leftConstraint;
    self->_leftConstraint = v10;

    double v12 = +[NSLayoutConstraint constraintWithItem:v5 attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
    rightConstraint = self->_rightConstraint;
    self->_rightConstraint = v12;

    double v14 = self->_bottomConstraint;
    v17[0] = self->_topConstraint;
    v17[1] = v14;
    double v15 = self->_rightConstraint;
    v17[2] = self->_leftConstraint;
    v17[3] = v15;
    double v16 = +[NSArray arrayWithObjects:v17 count:4];
    [v3 addConstraints:v16];

    [(RCDetailContainerViewController *)self adjustConstraints:0 forDisplayMode:self->_displayMode];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (a3)
  {
    if (!self->_dimmingView)
    {
      v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      dimmingView = self->_dimmingView;
      self->_dimmingView = v4;

      double v6 = +[UIColor colorWithWhite:0.0 alpha:0.4];
      [(UIView *)self->_dimmingView setBackgroundColor:v6];

      id v7 = [(UIView *)self->_dimmingView layer];
      [v7 setCornerRadius:10.0];

      double v8 = [(UIView *)self->_dimmingView layer];
      [v8 setMasksToBounds:1];

      [(UIView *)self->_dimmingView setUserInteractionEnabled:1];
      [(UIView *)self->_dimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    if (!self->_dimmingConstraints)
    {
      double v9 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v9 playbackViewEdgeInsets];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      char v18 = [(UIViewController *)self->_hostedViewController view];
      v19 = +[NSLayoutConstraint constraintWithItem:self->_dimmingView attribute:1 relatedBy:0 toItem:v18 attribute:1 multiplier:1.0 constant:v13];
      v20 = +[NSLayoutConstraint constraintWithItem:self->_dimmingView attribute:2 relatedBy:0 toItem:v18 attribute:2 multiplier:1.0 constant:-v17];
      v21 = +[NSLayoutConstraint constraintWithItem:self->_dimmingView attribute:3 relatedBy:0 toItem:v18 attribute:3 multiplier:1.0 constant:v11];
      v22 = +[NSLayoutConstraint constraintWithItem:self->_dimmingView attribute:4 relatedBy:0 toItem:v18 attribute:4 multiplier:1.0 constant:-v15];
      +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v20, v21, v22, 0);
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
      dimmingConstraints = self->_dimmingConstraints;
      self->_dimmingConstraints = v23;
    }
    v25 = [(RCDetailContainerViewController *)self view];
    [v25 addSubview:self->_dimmingView];

    id v28 = [(RCDetailContainerViewController *)self view];
    [v28 addConstraints:self->_dimmingConstraints];
  }
  else
  {
    v26 = [(RCDetailContainerViewController *)self view];
    [v26 removeConstraints:self->_dimmingConstraints];

    v27 = self->_dimmingView;
    [(UIView *)v27 removeFromSuperview];
  }
}

- (UIViewController)hostedViewController
{
  return self->_hostedViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViewController, 0);
  objc_storeStrong((id *)&self->_dimmingConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);

  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end