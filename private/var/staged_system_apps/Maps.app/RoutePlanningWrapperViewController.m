@interface RoutePlanningWrapperViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (ContainerHeaderView)titleHeaderView;
- (RoutePlanningDataCoordination)dataCoordinator;
- (RoutePlanningWrapperViewController)initWithDataCoordination:(id)a3;
- (UIViewController)wrappedViewController;
- (void)_setupChildViewControllerIfNeeded:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)setWrappedViewController:(id)a3;
- (void)updateHeaderTitle;
- (void)viewDidLoad;
@end

@implementation RoutePlanningWrapperViewController

- (RoutePlanningWrapperViewController)initWithDataCoordination:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningWrapperViewController;
  v5 = [(RoutePlanningWrapperViewController *)&v10 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataCoordinator, v4);
    v7 = [(ContaineeViewController *)v6 cardPresentationController];
    [v7 setPresentedModally:1];

    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    [v8 setTakesAvailableHeight:1];
  }
  return v6;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v44.receiver = self;
  v44.super_class = (Class)RoutePlanningWrapperViewController;
  [(ContaineeViewController *)&v44 viewDidLoad];
  v3 = [(RoutePlanningWrapperViewController *)self wrappedViewController];

  if (!v3)
  {
    v29 = sub_1005762E4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v47 = "-[RoutePlanningWrapperViewController viewDidLoad]";
      __int16 v48 = 2080;
      v49 = "RoutePlanningWrapperViewController.m";
      __int16 v50 = 1024;
      int v51 = 44;
      __int16 v52 = 2080;
      v53 = "self.wrappedViewController != nil";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v30 = sub_1005762E4();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v47 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (sub_1000BBB44(self) != 5)
  {
    id v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(RoutePlanningWrapperViewController *)self setTitleHeaderView:v4];

    v5 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v6 setDelegate:self];

    v7 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v7 setHairLineAlpha:0.0];

    v8 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v8 setHeaderSize:2];

    v9 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    objc_super v10 = [v9 navigationItem];
    v11 = [v10 title];
    v12 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v12 setTitle:v11];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    v16 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v16 setTitleViewInsets:UIEdgeInsetsZero.top, left, bottom, right];

    v17 = [(ContaineeViewController *)self headerView];
    v18 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v17 addSubview:v18];

    v43 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    v41 = [v43 leadingAnchor];
    v42 = [(ContaineeViewController *)self headerView];
    v40 = [v42 leadingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v45[0] = v39;
    v38 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    v36 = [v38 trailingAnchor];
    v37 = [(ContaineeViewController *)self headerView];
    v35 = [v37 trailingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v45[1] = v34;
    v33 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    v32 = [v33 topAnchor];
    v19 = [(ContaineeViewController *)self headerView];
    v20 = [v19 topAnchor];
    v21 = [v32 constraintEqualToAnchor:v20];
    v45[2] = v21;
    v22 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    v23 = [v22 bottomAnchor];
    v24 = [(ContaineeViewController *)self headerView];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    v45[3] = v26;
    v27 = +[NSArray arrayWithObjects:v45 count:4];
    +[NSLayoutConstraint activateConstraints:v27];
  }
  v28 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  [(RoutePlanningWrapperViewController *)self _setupChildViewControllerIfNeeded:v28];
}

- (void)updateHeaderTitle
{
  v3 = [(RoutePlanningWrapperViewController *)self titleHeaderView];

  if (v3)
  {
    id v7 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    id v4 = [v7 navigationItem];
    v5 = [v4 title];
    v6 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v6 setTitle:v5];
  }
}

- (void)_setupChildViewControllerIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(RoutePlanningWrapperViewController *)self isViewLoaded])
  {
    v5 = [v4 parentViewController];

    if (v4)
    {
      if (v5 != self)
      {
        [(RoutePlanningWrapperViewController *)self addChildViewController:v4];
        v6 = [(ContaineeViewController *)self contentView];
        id v7 = [v4 view];
        [v6 addSubview:v7];

        v8 = [v4 view];
        [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

        v29 = [v4 view];
        v27 = [v29 leadingAnchor];
        v28 = [(ContaineeViewController *)self contentView];
        v26 = [v28 leadingAnchor];
        v25 = [v27 constraintEqualToAnchor:v26];
        v30[0] = v25;
        v24 = [v4 view];
        v22 = [v24 trailingAnchor];
        v23 = [(ContaineeViewController *)self contentView];
        v21 = [v23 trailingAnchor];
        v20 = [v22 constraintEqualToAnchor:v21];
        v30[1] = v20;
        v19 = [v4 view];
        v17 = [v19 topAnchor];
        v18 = [(ContaineeViewController *)self contentView];
        v9 = [v18 topAnchor];
        objc_super v10 = [v17 constraintEqualToAnchor:v9];
        v30[2] = v10;
        v11 = [v4 view];
        v12 = [v11 bottomAnchor];
        v13 = [(ContaineeViewController *)self contentView];
        v14 = [v13 bottomAnchor];
        v15 = [v12 constraintEqualToAnchor:v14];
        v30[3] = v15;
        v16 = +[NSArray arrayWithObjects:v30 count:4];
        +[NSLayoutConstraint activateConstraints:v16];

        [v4 didMoveToParentViewController:self];
      }
    }
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = [(ContaineeViewController *)self containeeDelegate];
  [v5 containeeViewControllerGoToPreviousState:self withSender:self];
}

- (void)headerViewTapped:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsExpandLayout];
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordination *)WeakRetained;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (UIViewController)wrappedViewController
{
  return self->_wrappedViewController;
}

- (void)setWrappedViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedViewController, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);

  objc_destroyWeak((id *)&self->_dataCoordinator);
}

@end