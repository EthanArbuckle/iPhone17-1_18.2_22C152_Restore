@interface HODiscoverModalWebViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)prefersStatusBarHidden;
- (HODiscoverModalDismissButton)dismissButton;
- (HODiscoverModalWebViewController)init;
- (HODiscoverModalWebViewController)initWithCoder:(id)a3;
- (HODiscoverModalWebViewController)initWithURLString:(id)a3;
- (UIGestureRecognizer)panGestureRecognizer;
- (UIView)shadowView;
- (double)_getStatusBarHeight;
- (void)_addButtonConstraints;
- (void)_addWebViewConstraints;
- (void)_dismissedButtonPressed:(id)a3;
- (void)handlePanGesture:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setShadowView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HODiscoverModalWebViewController

- (HODiscoverModalWebViewController)initWithCoder:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  v6 = NSStringFromSelector("initWithURL:");
  [v5 handleFailureInMethod:a2 object:self file:@"HODiscoverModalWebViewController.m" lineNumber:38 description:@"%s is unavailable; use %@ instead"];
    "-[HODiscoverModalWebViewController initWithCoder:]",
    v6);

  return 0;
}

- (HODiscoverModalWebViewController)init
{
  v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("initWithURL:");
  [v4 handleFailureInMethod:a2 object:self file:@"HODiscoverModalWebViewController.m" lineNumber:42 description:@"%s is unavailable; use %@ instead"];
    "-[HODiscoverModalWebViewController init]",
    v5);

  return 0;
}

- (HODiscoverModalWebViewController)initWithURLString:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HODiscoverModalWebViewController;
  v3 = [(HODiscoverWebViewController *)&v9 initWithURLString:a3];
  if (v3)
  {
    v4 = -[HODiscoverModalDismissButton initWithFrame:]([HODiscoverModalDismissButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    dismissButton = v3->_dismissButton;
    v3->_dismissButton = v4;

    if ((+[HFUtilities isAMac] & 1) == 0)
    {
      if (+[HFUtilities isAnIPad]) {
        uint64_t v6 = 4;
      }
      else {
        uint64_t v6 = 0;
      }
      [(HODiscoverModalWebViewController *)v3 setModalPresentationStyle:v6];
      [(HODiscoverModalWebViewController *)v3 setModalTransitionStyle:0];
      [(HODiscoverModalWebViewController *)v3 setModalPresentationCapturesStatusBarAppearance:1];
    }
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:v3];
  }
  return v3;
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)HODiscoverModalWebViewController;
  [(HODiscoverWebViewController *)&v36 viewDidLoad];
  v3 = [(HODiscoverModalWebViewController *)self navigationController];
  [v3 setNavigationBarHidden:1];

  if ((+[HFUtilities isAMac] & 1) == 0)
  {
    v4 = [(HODiscoverWebViewController *)self webView];
    v5 = [v4 scrollView];
    [(HODiscoverModalWebViewController *)self _getStatusBarHeight];
    [v5 setContentInset:-v6, 0.0, 0.0, 0.0];

    v7 = [(HODiscoverModalWebViewController *)self dismissButton];
    [v7 addTarget:self action:"_dismissedButtonPressed:" forEvents:64];

    v8 = [(HODiscoverWebViewController *)self contentView];
    [v8 addSubview:self->_dismissButton];

    [(HODiscoverModalWebViewController *)self _addButtonConstraints];
  }
  if (+[HFUtilities isAnIPad])
  {
    objc_super v9 = [(HODiscoverWebViewController *)self contentView];
    v10 = [v9 layer];
    [v10 setCornerRadius:16.0];

    v11 = [(HODiscoverWebViewController *)self contentView];
    v12 = [v11 layer];
    [v12 setMaskedCorners:3];

    v13 = [(HODiscoverModalWebViewController *)self view];
    v14 = [v13 layer];
    [v14 setCornerRadius:16.0];

    id v15 = +[UIColor systemBlackColor];
    id v16 = [v15 CGColor];
    v17 = [(HODiscoverModalWebViewController *)self view];
    v18 = [v17 layer];
    [v18 setShadowColor:v16];

    v19 = [(HODiscoverModalWebViewController *)self view];
    v20 = [v19 layer];
    LODWORD(v21) = 1045220557;
    [v20 setShadowOpacity:v21];

    double height = CGSizeZero.height;
    v23 = [(HODiscoverModalWebViewController *)self view];
    v24 = [v23 layer];
    [v24 setShadowOffset:CGSizeZero.width, height];

    v25 = [(HODiscoverModalWebViewController *)self view];
    v26 = [v25 layer];
    [v26 setShadowRadius:20.0];

    v27 = [(HODiscoverModalWebViewController *)self view];
    v28 = [v27 layer];
    [v28 setMasksToBounds:0];

    v29 = [(HODiscoverModalWebViewController *)self view];
    v30 = [v29 layer];
    [v30 setShouldRasterize:1];

    v31 = +[UIScreen mainScreen];
    [v31 scale];
    double v33 = v32;
    v34 = [(HODiscoverModalWebViewController *)self view];
    v35 = [v34 layer];
    [v35 setRasterizationScale:v33];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)HODiscoverModalWebViewController;
  [(HODiscoverWebViewController *)&v19 viewWillAppear:a3];
  v4 = [(HODiscoverWebViewController *)self webView];

  if (v4)
  {
    v5 = [(HODiscoverWebViewController *)self webView];
    double v6 = [v5 scrollView];
    [v6 setContentOffset:CGPointZero];

    v7 = [(HODiscoverWebViewController *)self webView];
    v8 = [v7 scrollView];
    [v8 setBounces:0];

    if (+[HFUtilities isAnIPad])
    {
      id v9 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handlePanGesture:"];
      [(HODiscoverModalWebViewController *)self setPanGestureRecognizer:v9];

      v10 = [(HODiscoverModalWebViewController *)self panGestureRecognizer];
      [v10 setDelegate:self];

      v11 = [(HODiscoverWebViewController *)self webView];
      v12 = [v11 scrollView];
      v13 = [(HODiscoverModalWebViewController *)self panGestureRecognizer];
      [v12 addGestureRecognizer:v13];

      v14 = [(HODiscoverModalWebViewController *)self shadowView];
      [v14 bounds];
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
      id v15 = objc_claimAutoreleasedReturnValue();
      id v16 = [v15 CGPath];
      v17 = [(HODiscoverModalWebViewController *)self shadowView];
      v18 = [v17 layer];
      [v18 setShadowPath:v16];
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(HODiscoverModalWebViewController *)self presentationController];
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v11 = v6;

  v7 = [(HODiscoverWebViewController *)self contentView];
  [v4 translationInView:v7];
  double v9 = v8;

  id v10 = [v4 state];
  if (v10 == (id)2)
  {
    [v11 dismissalPanTranslationChanged:v9];
  }
  else if (v10 == (id)3)
  {
    [v11 dismissalPanTranslationEnded];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  objc_opt_class();
  v5 = [(HODiscoverModalWebViewController *)self presentationController];
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  double v8 = [(HODiscoverWebViewController *)self webView];
  double v9 = [v8 scrollView];
  [v9 contentOffset];
  if (v10 <= 0.0) {
    unsigned __int8 v11 = 1;
  }
  else {
    unsigned __int8 v11 = [v7 shouldAllowViewTranslation];
  }

  return v11;
}

- (void)_addWebViewConstraints
{
  id v25 = objc_alloc_init((Class)NSMutableArray);
  v3 = [(HODiscoverWebViewController *)self webView];
  id v4 = [v3 leadingAnchor];
  v5 = [(HODiscoverWebViewController *)self contentView];
  double v6 = [v5 leadingAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [v25 addObject:v7];

  double v8 = [(HODiscoverWebViewController *)self webView];
  double v9 = [v8 trailingAnchor];
  double v10 = [(HODiscoverWebViewController *)self contentView];
  unsigned __int8 v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v25 addObject:v12];

  v13 = [(HODiscoverWebViewController *)self webView];
  v14 = [v13 bottomAnchor];
  id v15 = [(HODiscoverWebViewController *)self contentView];
  id v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v25 addObject:v17];

  LODWORD(v15) = +[HFUtilities isAMac];
  v18 = [(HODiscoverWebViewController *)self webView];
  objc_super v19 = [v18 topAnchor];
  v20 = [(HODiscoverWebViewController *)self contentView];
  double v21 = v20;
  if (v15)
  {
    v22 = [v20 safeAreaLayoutGuide];
    v23 = [v22 topAnchor];
    v24 = [v19 constraintEqualToAnchor:v23];
    [v25 addObject:v24];
  }
  else
  {
    v22 = [v20 topAnchor];
    v23 = [v19 constraintEqualToAnchor:v22];
    [v25 addObject:v23];
  }

  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)_addButtonConstraints
{
  v20 = [(HODiscoverModalWebViewController *)self dismissButton];
  v17 = [v20 trailingAnchor];
  objc_super v19 = [(HODiscoverWebViewController *)self contentView];
  v18 = [v19 safeAreaLayoutGuide];
  id v16 = [v18 trailingAnchor];
  id v15 = [v17 constraintEqualToAnchor:v16 constant:-20.0];
  v21[0] = v15;
  v14 = [(HODiscoverModalWebViewController *)self dismissButton];
  v13 = [v14 topAnchor];
  v3 = [(HODiscoverWebViewController *)self contentView];
  id v4 = [v3 topAnchor];
  v5 = [v13 constraintEqualToAnchor:v4 constant:20.0];
  v21[1] = v5;
  double v6 = [(HODiscoverModalWebViewController *)self dismissButton];
  id v7 = [v6 heightAnchor];
  double v8 = [v7 constraintEqualToConstant:35.0];
  v21[2] = v8;
  double v9 = [(HODiscoverModalWebViewController *)self dismissButton];
  double v10 = [v9 widthAnchor];
  unsigned __int8 v11 = [v10 constraintEqualToConstant:35.0];
  v21[3] = v11;
  v12 = +[NSArray arrayWithObjects:v21 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_dismissedButtonPressed:(id)a3
{
}

- (double)_getStatusBarHeight
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 windows];
  id v4 = [v3 na_filter:&stru_1000C2170];
  v5 = [v4 firstObject];

  if (v5)
  {
    double v6 = [v5 windowScene];
    id v7 = [v6 statusBarManager];
    [v7 statusBarFrame];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  if (+[HFUtilities isAnIPad])
  {
    objc_opt_class();
    id v4 = [(HODiscoverModalWebViewController *)self presentationController];
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;

    [v8 contentOffset];
    if (v7 < 0.0 || [v6 shouldAllowViewTranslation]) {
      [v8 setContentOffset:0.0, 0.0];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return +[HFUtilities isAnIPad];
}

- (HODiscoverModalDismissButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end