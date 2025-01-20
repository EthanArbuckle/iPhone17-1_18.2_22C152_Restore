@interface MTSplashViewController
- (BOOL)visible;
- (UIActivityIndicatorView)spinner;
- (UILabel)label;
- (UIViewController)vc;
- (void)setLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setVc:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTSplashViewController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)MTSplashViewController;
  [(MTSplashViewController *)&v15 viewDidLoad];
  v3 = objc_opt_new();
  [(MTSplashViewController *)self setVc:v3];

  v4 = objc_opt_new();
  id v5 = objc_alloc((Class)UINavigationController);
  v6 = [(MTSplashViewController *)self vc];
  id v7 = [v5 initWithRootViewController:v6];

  [v4 setTabBarHidden:1 animated:0];
  id v16 = v7;
  v8 = +[NSArray arrayWithObjects:&v16 count:1];
  [v4 setViewControllers:v8];

  [(MTSplashViewController *)self addChildViewController:v4];
  v9 = [v4 view];
  v10 = [(MTSplashViewController *)self view];
  [v10 bounds];
  [v9 setFrame:];

  v11 = [(MTSplashViewController *)self view];
  v12 = [v4 view];
  [v11 addSubview:v12];

  [v4 didMoveToParentViewController:self];
  v13 = [(MTSplashViewController *)self view];
  v14 = +[UIColor systemBackgroundColor];
  [v13 setBackgroundColor:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTSplashViewController *)self setVisible:1];
  v7.receiver = self;
  v7.super_class = (Class)MTSplashViewController;
  [(MTSplashViewController *)&v7 viewWillAppear:v3];
  dispatch_time_t v5 = dispatch_time(0, 1500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100149FCC;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTSplashViewController *)self setVisible:0];
  v5.receiver = self;
  v5.super_class = (Class)MTSplashViewController;
  [(MTSplashViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v62.receiver = self;
  v62.super_class = (Class)MTSplashViewController;
  [(MTSplashViewController *)&v62 viewDidLayoutSubviews];
  BOOL v3 = [(MTSplashViewController *)self spinner];

  if (v3)
  {
    v4 = [(MTSplashViewController *)self vc];
    objc_super v5 = [v4 view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    CGFloat v61 = v12;

    if ([(MTSplashViewController *)self isHorizontallyCompact])
    {
      double v13 = v7 + 15.0;
      double v14 = v9 + 0.0;
      double v15 = v11 + -30.0;
    }
    else
    {
      id v16 = [(MTSplashViewController *)self vc];
      v17 = [v16 view];
      [v17 bounds];
      uint64_t v60 = 0;
      IMRectCenteredXInRectScale();
      double v13 = v18;
      double v14 = v19;
      double v15 = v20;
      CGFloat v61 = v21;
    }
    v22 = [(MTSplashViewController *)self spinner];
    [v22 frame];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    v31 = [(MTSplashViewController *)self label];
    [v31 frame];

    v32 = [(MTSplashViewController *)self label];
    v63.origin.x = v13;
    v63.origin.y = v14;
    v63.size.width = v15;
    v63.size.height = v61;
    CGFloat Width = CGRectGetWidth(v63);
    v64.origin.y = v14;
    double v34 = Width;
    v64.origin.x = v13;
    v64.size.width = v15;
    v64.size.height = v61;
    double Height = CGRectGetHeight(v64);
    v65.origin.x = v24;
    v65.origin.y = v26;
    v65.size.width = v28;
    v65.size.height = v30;
    [v32 sizeThatFits:v34 Height - CGRectGetHeight(v65) + -15.0];

    v66.origin.x = v24;
    v66.origin.y = v26;
    v66.size.width = v28;
    v66.size.height = v30;
    CGRectGetHeight(v66);
    IMRectCenteredYInRectScale();
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    IMRectCenteredXInRectScale();
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    v67.origin.x = v37;
    v67.origin.y = v39;
    v67.size.width = v41;
    v67.size.height = v43;
    double MinY = CGRectGetMinY(v67);
    v51 = [(MTSplashViewController *)self spinner];
    [v51 setFrame:v45, MinY, v47, v49];

    IMRectCenteredXInRectScale();
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    v68.origin.x = v45;
    v68.origin.y = MinY;
    v68.size.width = v47;
    v68.size.height = v49;
    CGFloat v58 = CGRectGetMaxY(v68) + 15.0;
    v59 = [(MTSplashViewController *)self label];
    [v59 setFrame:v53, v58, v55, v57];
  }
}

- (UIViewController)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_vc, 0);
}

@end