@interface CHRootViewController
- (BOOL)activitySetUp;
- (BOOL)prefersStatusBarHidden;
- (CHRootViewController)initWithTabBarController:(id)a3 healthStore:(id)a4;
- (HKCloudSyncObserver)cloudSyncObserver;
- (id)_ppt_tabBarController;
- (id)childViewControllerForStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setupCloudRestoreUI;
- (void)adjustSafeAreaInsetsWithHeight:(double)a3;
- (void)beginListeningForCloudStatusUpdates;
- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4;
- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4;
- (void)cloudSyncObserverSyncCompleted:(id)a3;
- (void)completeCloudRestore;
- (void)hide;
- (void)setActivitySetUp:(BOOL)a3;
- (void)setCloudSyncObserver:(id)a3;
- (void)showCloudStatusWithProgress:(id)a3;
- (void)unhide;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CHRootViewController

- (void)beginListeningForCloudStatusUpdates
{
  _HKInitializeLogging();
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[cloud-restore] begin listening for health cloud restore status updates.", v5, 2u);
  }
  v4 = [(CHRootViewController *)self cloudSyncObserver];
  [v4 startSyncIfRestoreNotCompleted];
}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[cloud-restore] Cloud sync observer sync failed with error: %@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDC64;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CHRootViewController)initWithTabBarController:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHRootViewController;
  id v9 = [(CHRootViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabBarController, a3);
    v11 = (HKCloudSyncObserver *)[objc_alloc((Class)HKCloudSyncObserver) initWithHealthStore:v8 delegate:v10];
    cloudSyncObserver = v10->_cloudSyncObserver;
    v10->_cloudSyncObserver = v11;

    [(CHRootViewController *)v10 beginListeningForCloudStatusUpdates];
  }

  return v10;
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CHRootViewController;
  [(CHRootViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(CHRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(UITabBarController *)self->_tabBarController view];
  [v12 setFrame:v5, v7, v9, v11];

  [(UIStackView *)self->_cloudRestoreStackView bounds];
  [(CHRootViewController *)self adjustSafeAreaInsetsWithHeight:v13];
}

- (void)adjustSafeAreaInsetsWithHeight:(double)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(UITabBarController *)self->_tabBarController viewControllers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 additionalSafeAreaInsets];
        [v8 setAdditionalSafeAreaInsets:];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)CHRootViewController;
  [(CHRootViewController *)&v36 viewDidLoad];
  v3 = [(CHRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v12 = [(UITabBarController *)self->_tabBarController view];
  [v12 setFrame:v5, v7, v9, v11];

  [(CHRootViewController *)self addChildViewController:self->_tabBarController];
  double v13 = [(CHRootViewController *)self view];
  objc_super v14 = [(UITabBarController *)self->_tabBarController view];
  [v13 addSubview:v14];

  [(UITabBarController *)self->_tabBarController didMoveToParentViewController:self];
  v15 = (UIView *)objc_alloc_init((Class)UIView);
  overlayView = self->_overlayView;
  self->_overlayView = v15;

  v17 = +[UIColor blackColor];
  [(UIView *)self->_overlayView setBackgroundColor:v17];

  [(UIView *)self->_overlayView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_overlayView setAlpha:0.0];
  v18 = [(CHRootViewController *)self view];
  [v18 addSubview:self->_overlayView];

  v34 = [(UIView *)self->_overlayView topAnchor];
  v35 = [(CHRootViewController *)self view];
  v33 = [v35 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v37[0] = v32;
  v30 = [(UIView *)self->_overlayView bottomAnchor];
  v31 = [(CHRootViewController *)self view];
  v29 = [v31 bottomAnchor];
  v19 = [v30 constraintEqualToAnchor:v29];
  v37[1] = v19;
  v20 = [(UIView *)self->_overlayView leadingAnchor];
  v21 = [(CHRootViewController *)self view];
  v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v37[2] = v23;
  v24 = [(UIView *)self->_overlayView trailingAnchor];
  v25 = [(CHRootViewController *)self view];
  v26 = [v25 trailingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  v37[3] = v27;
  v28 = +[NSArray arrayWithObjects:v37 count:4];
  +[NSLayoutConstraint activateConstraints:v28];
}

- (BOOL)prefersStatusBarHidden
{
  return self->_hidingStatusBar;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_tabBarController;
}

- (void)completeCloudRestore
{
  if (self->_cloudRestoreStackView)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100142520;
    v3[3] = &unk_1008ABA78;
    v3[4] = self;
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100142570;
    v2[3] = &unk_1008ACA80;
    v2[4] = self;
    +[UIView animateWithDuration:0x20000 delay:v3 options:v2 animations:0.4 completion:0.0];
  }
}

- (HKCloudSyncObserver)cloudSyncObserver
{
  return self->_cloudSyncObserver;
}

- (void)setActivitySetUp:(BOOL)a3
{
  if (self->_activitySetUp != a3) {
    self->_activitySetUp = a3;
  }
}

- (void)hide
{
  _HKInitializeLogging();
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[RootViewController] hiding root view controller", v4, 2u);
  }
  [(UIView *)self->_overlayView setAlpha:1.0];
  self->_hidingStatusBar = 1;
  [(CHRootViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)unhide
{
  _HKInitializeLogging();
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[RootViewController] showing root view controller", v4, 2u);
  }
  [(UIView *)self->_overlayView setAlpha:0.0];
  self->_hidingStatusBar = 0;
  [(CHRootViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (id)_ppt_tabBarController
{
  return self->_tabBarController;
}

- (void)_setupCloudRestoreUI
{
  id v3 = objc_alloc_init((Class)UILabel);
  double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  [v3 setFont:v4];

  double v5 = +[UIColor whiteColor];
  [v3 setTextColor:v5];

  [v3 setNumberOfLines:0];
  [v3 setAdjustsFontSizeToFitWidth:1];
  double v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"RESTORING_FROM_ICLOUD" value:&stru_1008D8AB8 table:@"Localizable"];
  [v3 setText:v7];

  [v3 setTextAlignment:1];
  double v8 = (UIProgressView *)objc_alloc_init((Class)UIProgressView);
  progressView = self->_progressView;
  self->_progressView = v8;

  id v10 = objc_alloc((Class)UIStackView);
  double v11 = self->_progressView;
  v37[0] = v3;
  v37[1] = v11;
  long long v12 = +[NSArray arrayWithObjects:v37 count:2];
  double v13 = (UIStackView *)[v10 initWithArrangedSubviews:v12];
  cloudRestoreStackView = self->_cloudRestoreStackView;
  self->_cloudRestoreStackView = v13;

  [(UIStackView *)self->_cloudRestoreStackView setAxis:1];
  [(UIStackView *)self->_cloudRestoreStackView setDistribution:0];
  [(UIStackView *)self->_cloudRestoreStackView setAlignment:3];
  [(UIStackView *)self->_cloudRestoreStackView setSpacing:8.0];
  [(UIStackView *)self->_cloudRestoreStackView setBaselineRelativeArrangement:1];
  [(UIStackView *)self->_cloudRestoreStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIStackView setLayoutMargins:](self->_cloudRestoreStackView, "setLayoutMargins:", 11.5, 0.0, 11.5, 0.0);
  [(UIStackView *)self->_cloudRestoreStackView setLayoutMarginsRelativeArrangement:1];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v15 = +[UIColor blackColor];
    [(UIStackView *)self->_cloudRestoreStackView setBackgroundColor:v15];
  }
  else
  {
    v16 = +[UIColor clearColor];
    [(UIStackView *)self->_cloudRestoreStackView setBackgroundColor:v16];

    v15 = +[UIBlurEffect effectWithStyle:10];
    id v17 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v15];
    [(UIStackView *)self->_cloudRestoreStackView bounds];
    [v17 setFrame:];
    [v17 setAutoresizingMask:18];
    [(UIStackView *)self->_cloudRestoreStackView insertSubview:v17 atIndex:0];
  }
  v18 = [(CHRootViewController *)self view];
  [v18 addSubview:self->_cloudRestoreStackView];

  v19 = [(UIStackView *)self->_cloudRestoreStackView bottomAnchor];
  v20 = [(UITabBarController *)self->_tabBarController tabBar];
  v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(UIStackView *)self->_cloudRestoreStackView leadingAnchor];
  v24 = [(CHRootViewController *)self view];
  v25 = [v24 leadingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [(UIStackView *)self->_cloudRestoreStackView trailingAnchor];
  v28 = [(CHRootViewController *)self view];
  v29 = [v28 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(UIProgressView *)self->_progressView leadingAnchor];
  v32 = [(UIStackView *)self->_cloudRestoreStackView leadingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:22.0];
  [v33 setActive:1];

  v34 = [(UIProgressView *)self->_progressView trailingAnchor];
  v35 = [(UIStackView *)self->_cloudRestoreStackView trailingAnchor];
  objc_super v36 = [v34 constraintEqualToAnchor:v35 constant:-22.0];
  [v36 setActive:1];
}

- (void)showCloudStatusWithProgress:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_cloudRestoreStackView)
  {
    [(CHRootViewController *)self _setupCloudRestoreUI];
    id v4 = v5;
  }
  [(UIProgressView *)self->_progressView setObservedProgress:v4];
}

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  double v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[cloud-restore] Receieved cloud sync observer progress", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001426C4;
  v8[3] = &unk_1008ABB38;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  _HKInitializeLogging();
  id v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[cloud-restore] Cloud sync observer sync completed", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014279C;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)activitySetUp
{
  return self->_activitySetUp;
}

- (void)setCloudSyncObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncObserver, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_cloudRestoreStackView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);

  objc_storeStrong((id *)&self->_tabBarController, 0);
}

@end