@interface PhoneRootViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)hasUpdateStatusLayoutGuide;
- (BOOL)isContentViewLoaded;
- (BOOL)shouldAutorotate;
- (FTRecentsContainerViewControllerProtocol)faceTimeContainerViewController;
- (PHLocalVideoViewController)localVideoViewController;
- (PhoneBaseViewController)baseViewController;
- (PhoneContentView)contentView;
- (STLockoutViewController)lockoutViewController;
- (UIViewController)detailsViewController;
- (UIVisualEffectView)backgroundBlurView;
- (_UIVisualEffectBackdropView)backdropView;
- (double)_contentViewWidthForApplicationBoundsSize:(CGSize)a3;
- (id)_childViewControllerForWhitePointAdaptivityStyle;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_constrainRegistrationView;
- (void)_destroyFirstRunController;
- (void)_ensureProperPositionForContentView;
- (void)_getRotationContentSettings:(id *)a3;
- (void)createFaceTimeFirstRunViewIfNeeded;
- (void)displayUIAnimated:(BOOL)a3;
- (void)ensureBaseViewControllerIsShowing;
- (void)handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)handleOrientationNotification:(id)a3;
- (void)hideContentViewAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)hideDetailsViewController;
- (void)hideVideoConferenceBackgroundViewAnimated:(BOOL)a3;
- (void)loadView;
- (void)lockoutViewControllerDidFinishDismissing:(id)a3;
- (void)setBackgroundBlurView:(id)a3;
- (void)setContentViewHiddenPosition;
- (void)setContentViewNormalPosition;
- (void)setDetailsViewController:(id)a3;
- (void)setFaceTimeContainerViewController:(id)a3;
- (void)setHasUpdateStatusLayoutGuide:(BOOL)a3;
- (void)setLockoutViewController:(id)a3;
- (void)setupContentViewFullSize;
- (void)setupContentViewSidebar;
- (void)showContentViewAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)showDetailsViewController;
- (void)showFaceTimeFirstRunViewIfNeeded;
- (void)showScreenTimeShieldForRequest:(id)a3;
- (void)showVideoConferenceBackgroundViewAnimated:(BOOL)a3;
- (void)startPreviewIfNeeded;
- (void)updateVideoViewControllerWithOrientationMonitor:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PhoneRootViewController

- (void)setupContentViewFullSize
{
  [(PhoneContentView *)self->_contentView setOpaque:0];
  v3 = +[UIColor clearColor];
  [(PhoneContentView *)self->_contentView setBackgroundColor:v3];

  [(PhoneContentView *)self->_contentView setAutoresizingMask:18];

  [(PhoneRootViewController *)self _ensureProperPositionForContentView];
}

- (id)_childViewControllerForWhitePointAdaptivityStyle
{
  if ([UIApp alwaysShowLocalVideo])
  {
    v3 = [(PhoneRootViewController *)self localVideoViewController];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (PHLocalVideoViewController)localVideoViewController
{
  localVideoViewController = self->_localVideoViewController;
  if (!localVideoViewController)
  {
    v4 = objc_alloc_init(PHLocalVideoViewController);
    v5 = self->_localVideoViewController;
    self->_localVideoViewController = v4;

    [(PhoneRootViewController *)self addChildViewController:self->_localVideoViewController];
    localVideoViewController = self->_localVideoViewController;
  }

  return localVideoViewController;
}

- (void)loadView
{
  v4 = objc_alloc_init(PhoneRootView);
  v3 = +[UIColor clearColor];
  [(PhoneRootView *)v4 setBackgroundColor:v3];

  [(PhoneRootView *)v4 setOpaque:0];
  [(PhoneRootViewController *)self setView:v4];
}

- (void)handleApplicationWillEnterForegroundNotification:(id)a3
{
  v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneRootViewController handleApplicationWillEnterForegroundNotification", v5, 2u);
  }

  [(PhoneRootViewController *)self showFaceTimeFirstRunViewIfNeeded];
}

- (void)setContentViewNormalPosition
{
  if ([(PhoneRootViewController *)self isContentViewLoaded])
  {
    v3 = [(PhoneRootViewController *)self contentView];
    if ([UIApp contentViewAnimationsFadeInsteadOfMove])
    {
      [v3 setAlpha:1.0];
    }
    else
    {
      long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v5[1] = v4;
      v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v3 setTransform:v5];
    }
  }
}

- (BOOL)isContentViewLoaded
{
  return self->_contentView != 0;
}

- (void)updateVideoViewControllerWithOrientationMonitor:(id)a3
{
  id v4 = a3;
  if ([UIApp alwaysShowLocalVideo])
  {
    v5 = [(PhoneRootViewController *)self view];
    v6 = [v5 window];
    v7 = [v6 windowScene];

    if (v7)
    {
      id v8 = [v4 makeInterfaceOrientationFrom:[v4 lastValidInterfaceOrientation] whenFailing:[v7 interfaceOrientation]];
      v9 = [(PhoneRootViewController *)self localVideoViewController];
      [v9 updateViewControllerForOrientation:v8];
    }
    else
    {
      v9 = sub_100012C68();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to orient video view controller because there's no window scene to determine a valid fallback orientation", v10, 2u);
      }
    }
  }
}

- (void)showContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (([UIApp tabBarCanSlide] & 1) == 0)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PhoneRootViewController.m" lineNumber:556 description:@"Requested tab bar slide animation when not supported"];
  }
  id v8 = [(PhoneRootViewController *)self contentView];
  [v8 setHidden:0];
  v9 = [(PhoneRootViewController *)self view];
  v10 = [v8 superview];

  if (v10 != v9)
  {
    +[UIView disableAnimation];
    [(PhoneRootViewController *)self _ensureProperPositionForContentView];
    [v9 addSubview:v8];
    +[UIView enableAnimation];
  }
  [(PhoneRootViewController *)self showFaceTimeFirstRunViewIfNeeded];
  v11 = [(PhoneRootViewController *)self view];
  v12 = [v11 window];
  v13 = [v12 _rootSheetPresentationController];
  [v13 _setShouldScaleDownBehindDescendantSheets:0];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000D58C;
  v21[3] = &unk_1000A2830;
  id v22 = v8;
  id v23 = v7;
  id v14 = v7;
  id v15 = v8;
  v16 = objc_retainBlock(v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001A3F8;
  v20[3] = &unk_1000A1D50;
  v20[4] = self;
  v17 = objc_retainBlock(v20);
  if (v4) {
    double v18 = 0.300000012;
  }
  else {
    double v18 = 0.0;
  }
  +[UIView animateWithDuration:v17 animations:v16 completion:v18];
  +[UIView animateWithDuration:0 delay:v17 options:v16 animations:v18 completion:0.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v12 viewWillAppear:a3];
  [(PhoneRootViewController *)self startPreviewIfNeeded];
  BOOL v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Observing foreground notifications via PhoneRootViewController viewWillAppear", v11, 2u);
  }

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];

  if ([UIApp alwaysShowLocalVideo])
  {
    v6 = sub_100012C68();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Observing orientation notifications via PhoneRootViewController viewWillAppear", v11, 2u);
    }

    id v7 = +[NSNotificationCenter defaultCenter];
    id v8 = +[PHOrientationMonitorKeys notificationEvent];
    [v7 addObserver:self selector:"handleOrientationNotification:" name:v8 object:0];

    v9 = objc_opt_new();
    v10 = [v9 compose];
    [v10 setOrientationEventsEnabled:1];
  }
}

- (void)_destroyFirstRunController
{
  v3 = [(PhoneRootViewController *)self faceTimeContainerViewController];
  unsigned int v4 = [v3 hasRecentsListViewController];

  if (v4)
  {
    v5 = sub_100012C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000FDC4(v5);
    }
  }
  if (self->_registrationController)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:UIApplicationDidChangeStatusBarFrameNotification object:0];

    id v7 = +[NSNotificationCenter defaultCenter];
    id v8 = +[PHOrientationMonitorKeys notificationEvent];
    [v7 removeObserver:self name:v8 object:0];

    v9 = objc_opt_new();
    v10 = [v9 compose];
    [v10 setOrientationEventsEnabled:0];

    if ([(PHRegistrationViewController *)self->_registrationController isViewLoaded])
    {
      v11 = [(PHRegistrationViewController *)self->_registrationController view];
      [v11 removeFromSuperview];
    }
    registrationController = self->_registrationController;
    self->_registrationController = 0;

    self->_faceTimeRegistrationViewIsShowing = 0;
    [(PhoneRootViewController *)self showDetailsViewController];
  }
}

- (FTRecentsContainerViewControllerProtocol)faceTimeContainerViewController
{
  return self->_faceTimeContainerViewController;
}

- (void)showFaceTimeFirstRunViewIfNeeded
{
  if (+[PHRegistrationViewController shouldShowRegistration])
  {
    if ([UIApp isSuspended])
    {
      v3 = sub_100012C68();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Skipping showFaceTimeFirstRunViewIfNeeded since PhoneApp isSuspended.", buf, 2u);
      }
    }
    else
    {
      [(PhoneRootViewController *)self createFaceTimeFirstRunViewIfNeeded];
      id v7 = [(PHRegistrationViewController *)self->_registrationController view];
      unsigned int v4 = [(PhoneRootViewController *)self contentView];
      if (!self->_faceTimeRegistrationViewIsShowing)
      {
        [(PhoneRootViewController *)self hideDetailsViewController];
        [v4 bounds];
        [v7 setFrame:];
        [v7 setAutoresizingMask:[v4 autoresizingMask]];
        [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
        detailsViewController = self->_detailsViewController;
        if (detailsViewController)
        {
          v6 = [(UIViewController *)detailsViewController presentedViewController];

          if (v6) {
            [(UIViewController *)self->_detailsViewController dismissViewControllerAnimated:0 completion:0];
          }
        }
        [(PhoneRootViewController *)self _constrainRegistrationView];
        self->_faceTimeRegistrationViewIsShowing = 1;
      }
      [v4 bringSubviewToFront:v7];
    }
  }
  else
  {
    [(FTRecentsContainerViewControllerProtocol *)self->_faceTimeContainerViewController showContent];
    [(PhoneRootViewController *)self _destroyFirstRunController];
  }
}

- (void)startPreviewIfNeeded
{
  if ([UIApp alwaysShowLocalVideo]
    && ([UIApp inCall] & 1) == 0
    && ([UIApp isSuspended] & 1) == 0)
  {
    v3 = sub_100012C68();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting preview via PhoneRootViewController viewWillAppear", v5, 2u);
    }

    unsigned int v4 = [(PhoneRootViewController *)self localVideoViewController];
    [v4 startPreview];
  }
}

- (PhoneContentView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    +[UIView setAnimationsEnabled:0];
    unsigned int v4 = -[PhoneContentView initWithFrame:]([PhoneContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_contentView;
    self->_contentView = v4;

    [(PhoneContentView *)self->_contentView setContentMode:3];
    [(PhoneContentView *)self->_contentView setAutoresizesSubviews:1];
    if ([UIApp tabBarFillsScreen]) {
      [(PhoneRootViewController *)self setupContentViewFullSize];
    }
    else {
      [(PhoneRootViewController *)self setupContentViewSidebar];
    }
    if ([UIApp userInterfaceStyle] == 1)
    {
      if (!self->_backdropView)
      {
        id v6 = objc_alloc((Class)_UIVisualEffectBackdropView);
        [(PhoneContentView *)self->_contentView bounds];
        id v7 = [v6 initWithFrame:];
        backdropView = self->_backdropView;
        self->_backdropView = v7;

        [(_UIVisualEffectBackdropView *)self->_backdropView setAutoresizingMask:18];
        [(_UIVisualEffectBackdropView *)self->_backdropView setRenderMode:1];
        v9 = [(_UIVisualEffectBackdropView *)self->_backdropView captureGroup];
        [v9 setGroupName:@"RootControllerBackgroundBackdrop"];
      }
      if (!self->_backgroundBlurView)
      {
        id v10 = objc_alloc((Class)UIVisualEffectView);
        v11 = +[UIBlurEffect effectWithStyle:2];
        objc_super v12 = (UIVisualEffectView *)[v10 initWithEffect:v11];
        backgroundBlurView = self->_backgroundBlurView;
        self->_backgroundBlurView = v12;

        [(PhoneContentView *)self->_contentView bounds];
        -[UIVisualEffectView setFrame:](self->_backgroundBlurView, "setFrame:");
        [(UIVisualEffectView *)self->_backgroundBlurView setAutoresizingMask:18];
        id v14 = [(_UIVisualEffectBackdropView *)self->_backdropView captureGroup];
        id v15 = [v14 groupName];
        [(UIVisualEffectView *)self->_backgroundBlurView _setGroupName:v15];

        [(UIVisualEffectView *)self->_backgroundBlurView _setCaptureView:self->_backdropView];
      }
      [(PhoneContentView *)self->_contentView addSubview:self->_backdropView];
      [(PhoneContentView *)self->_contentView addSubview:self->_backgroundBlurView];
    }
    if ([UIApp usesUnifiedInterface])
    {
      v16 = objc_alloc_init(FTRecentsContainerViewController);
      faceTimeContainerViewController = self->_faceTimeContainerViewController;
      self->_faceTimeContainerViewController = (FTRecentsContainerViewControllerProtocol *)v16;

      objc_storeStrong((id *)&self->_detailsViewController, v16);
      double v18 = [(UIViewController *)self->_detailsViewController view];
    }
    else
    {
      v19 = [(PhoneRootViewController *)self baseViewController];
      double v18 = [v19 view];
    }
    unsigned int v20 = [UIApp tabBarFillsScreen];
    [(PhoneContentView *)self->_contentView bounds];
    double v22 = v21;
    if (v20)
    {
      [v18 setFrame:];
    }
    else
    {
      [(PhoneContentView *)self->_contentView bounds];
      [v18 setBounds:0.0, 0.0, v22];
      [(PhoneContentView *)self->_contentView bounds];
      double MaxX = CGRectGetMaxX(v32);
      [v18 bounds];
      double v25 = MaxX - floor(v24 * 0.5);
      [(PhoneContentView *)self->_contentView bounds];
      [v18 setCenter:v25 floor(v26 * 0.5)];
    }
    [v18 setAutoresizingMask:18];
    v27 = [(PhoneRootViewController *)self detailsViewController];

    if (v27)
    {
      v28 = [(PhoneRootViewController *)self detailsViewController];
      [(PhoneRootViewController *)self addChildViewController:v28];

      [(PhoneContentView *)self->_contentView addSubview:v18];
      v29 = [(PhoneRootViewController *)self detailsViewController];
      [v29 didMoveToParentViewController:self];
    }
    else
    {
      [(PhoneContentView *)self->_contentView addSubview:v18];
    }
    +[UIView setAnimationsEnabled:1];

    contentView = self->_contentView;
  }

  return contentView;
}

- (UIViewController)detailsViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)_ensureProperPositionForContentView
{
  unsigned int v3 = [UIApp tabBarFillsScreen];
  unsigned int v4 = [(PhoneRootViewController *)self view];
  [v4 bounds];
  double v9 = v7;
  double v10 = v8;
  if (v3)
  {
    double x = v5;
    double y = v6;

    v13 = [(PhoneRootViewController *)self view];
    [v13 center];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    -[PhoneRootViewController _contentViewWidthForApplicationBoundsSize:](self, "_contentViewWidthForApplicationBoundsSize:", v7, v8);
    double v9 = v18;

    v19 = [(PhoneRootViewController *)self view];
    [v19 bounds];
    double v10 = v20;

    if ([UIApp userInterfaceLayoutDirection])
    {
      double v21 = [(PhoneRootViewController *)self view];
      [v21 bounds];
      double v15 = floor(v22 + v9 * -0.5);
    }
    else
    {
      double v15 = floor(v9 * 0.5);
    }
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    v13 = [(PhoneRootViewController *)self view];
    [v13 bounds];
    double v17 = floor(v23 * 0.5);
  }

  -[PhoneContentView setBounds:](self->_contentView, "setBounds:", x, y, v9, v10);
  contentView = self->_contentView;

  -[PhoneContentView setCenter:](contentView, "setCenter:", v15, v17);
}

- (void)displayUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([UIApp alwaysShowLocalVideo]
    && (+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    double v5 = [(PhoneRootViewController *)self view];
    double v6 = [(PhoneRootViewController *)self localVideoViewController];
    double v7 = [v6 view];
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v38[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v38[1] = v8;
    v38[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v7 setTransform:v38];

    double v9 = [v6 view];
    [v9 setAlpha:1.0];

    double v10 = [v6 view];
    v11 = [v10 superview];

    if (v11 != v5)
    {
      [v6 viewWillAppear:1];
      [v5 insertSubview:v10 atIndex:0];
      [v6 viewDidAppear:1];
    }
    [v5 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = v16 * 0.5;
    double v21 = v18 * 0.5;
    double v22 = [v6 view];
    [v22 setBounds:v13, v15, v17, v19];

    double v23 = [v6 view];
    [v23 setCenter:v20, v21];

    double v24 = [v6 view];
    [v24 setAutoresizingMask:18];

    double v25 = objc_opt_new();
    double v26 = [v25 compose];

    v33[1] = 3221225472;
    v33[0] = _NSConcreteStackBlock;
    v33[2] = sub_10001A6D8;
    v33[3] = &unk_1000A2880;
    if (v3) {
      double v27 = 0.300000012;
    }
    else {
      double v27 = 0.0;
    }
    BOOL v37 = v3;
    id v34 = v6;
    v35 = self;
    id v36 = v26;
    id v28 = v26;
    id v29 = v6;
    +[UIView animateWithDuration:v33 animations:v27];
  }
  if ([UIApp tabBarCanSlide])
  {
    [(PhoneRootViewController *)self showContentViewAnimated:0 completionBlock:0];
    v30 = sub_100012C68();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGRect v32 = 0;
      v31 = "Showing contents view of PhoneRootViewController.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, v32, 2u);
    }
  }
  else
  {
    v30 = sub_100012C68();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGRect v32 = 0;
      v31 = "Skipping showing contents view of PhoneRootViewController.";
      goto LABEL_14;
    }
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v4 viewDidAppear:a3];
  [(PhoneRootViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PhoneRootViewController *)self startPreviewIfNeeded];
}

- (_UIVisualEffectBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100046CF0;
  v9[3] = &unk_1000A2808;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return [UIApp contentViewCanRotate];
}

- (void)_getRotationContentSettings:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController _getRotationContentSettings:](&v7, "_getRotationContentSettings:");
  double v5 = [(PhoneRootViewController *)self baseViewController];
  unsigned int v6 = [v5 shouldDisableEdgeClip];

  if (v6) {
    a3->var6 = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([UIApp alwaysShowLocalVideo])
  {
    double v5 = sub_100012C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping preview via PhoneRootViewController viewDidDisappear", buf, 2u);
    }

    unsigned int v6 = [(PhoneRootViewController *)self localVideoViewController];
    [v6 stopPreview];
  }
  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v8 viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v3 viewWillDisappear:a3];
}

- (void)handleOrientationNotification:(id)a3
{
  objc_super v4 = [(PhoneRootViewController *)self view];
  double v5 = [v4 _screen];

  unsigned int v6 = +[UIScreen mainScreen];
  if ([UIApp alwaysShowLocalVideo]) {
    BOOL v7 = v5 == v6;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    objc_super v8 = sub_100012C68();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PhoneRootViewController handleOrientationNotification", buf, 2u);
    }

    double v9 = objc_opt_new();
    double v10 = [v9 compose];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100047008;
    v12[3] = &unk_1000A1E18;
    v12[4] = self;
    id v13 = v10;
    id v11 = v10;
    +[UIView animateWithDuration:v12 animations:0.300000012];
  }
}

- (double)_contentViewWidthForApplicationBoundsSize:(CGSize)a3
{
  unint64_t v3 = +[PHUIConfiguration contentViewSizeForFaceTime];
  if (v3 > 2) {
    return 320.0;
  }
  else {
    return dbl_10007DC18[v3];
  }
}

- (void)setupContentViewSidebar
{
  unint64_t v3 = +[UIColor clearColor];
  [(PhoneContentView *)self->_contentView setBackgroundColor:v3];

  [(PhoneContentView *)self->_contentView setAutoresizingMask:20];
  [(PhoneRootViewController *)self _ensureProperPositionForContentView];
  if (([UIApp tabBarFillsScreen] & 1) == 0)
  {
    [(PhoneRootViewController *)self setContentViewHiddenPosition];
    contentView = self->_contentView;
    [(PhoneContentView *)contentView setHidden:1];
  }
}

- (void)setContentViewHiddenPosition
{
  if ([(PhoneRootViewController *)self isContentViewLoaded])
  {
    unint64_t v3 = [(PhoneRootViewController *)self contentView];
    if ([UIApp contentViewAnimationsFadeInsteadOfMove])
    {
      [v3 setAlpha:0.0];
    }
    else
    {
      id v4 = [UIApp userInterfaceLayoutDirection];
      unsigned int v5 = [UIApp contentViewOffscreenEdge];
      [v3 bounds];
      if (v5 == 1)
      {
        double Height = CGRectGetHeight(*(CGRect *)&v6);
        CGFloat v11 = Height;
      }
      else
      {
        double Height = CGRectGetWidth(*(CGRect *)&v6);
        CGFloat v11 = 0.0;
      }
      if (v4 != (id)1) {
        double Height = -Height;
      }
      memset(&v13.c, 0, 32);
      if (v5 == 1) {
        double Height = 0.0;
      }
      *(_OWORD *)&v13.a = 0uLL;
      CGAffineTransformMakeTranslation(&v13, Height, v11);
      CGAffineTransform v12 = v13;
      [v3 setTransform:&v12];
    }
  }
}

- (void)hideContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (([UIApp tabBarCanSlide] & 1) == 0)
  {
    CGFloat v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PhoneRootViewController.m" lineNumber:624 description:@"Requested tab bar slide animation when not supported"];
  }
  if ([(PhoneRootViewController *)self isContentViewLoaded])
  {

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100047394;
    v13[3] = &unk_1000A2830;
    v13[4] = self;
    id v14 = v7;
    objc_super v8 = objc_retainBlock(v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004742C;
    v12[3] = &unk_1000A1D50;
    v12[4] = self;
    double v9 = objc_retainBlock(v12);
    double v10 = 0.300000012;
    if (!v4) {
      double v10 = 0.0;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v9, v8, v10);
  }
}

- (void)showVideoConferenceBackgroundViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (([UIApp alwaysShowLocalVideo] & 1) == 0)
  {
    double v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PhoneRootViewController.m" lineNumber:651 description:@"Requested show of video conference controller when not supported"];
  }
  uint64_t v6 = [(PhoneRootViewController *)self localVideoViewController];
  id v7 = [v6 view];

  objc_super v8 = [(PhoneRootViewController *)self view];
  [v8 bounds];
  [v7 setFrame:];

  double v9 = [(PhoneRootViewController *)self view];
  double v10 = [(PhoneRootViewController *)self contentView];
  [v9 insertSubview:v7 below:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100047644;
  v18[3] = &unk_1000A2738;
  v18[4] = self;
  BOOL v19 = v3;
  CGFloat v11 = objc_retainBlock(v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100047660;
  v16[3] = &unk_1000A1D50;
  id v17 = v7;
  id v12 = v7;
  CGAffineTransform v13 = objc_retainBlock(v16);
  if (v3) {
    double v14 = 0.300000012;
  }
  else {
    double v14 = 0.0;
  }
  [(PHLocalVideoViewController *)self->_localVideoViewController viewWillAppear:v3];
  +[UIView animateWithDuration:v13 animations:v11 completion:v14];
}

- (void)hideVideoConferenceBackgroundViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (([UIApp alwaysShowLocalVideo] & 1) == 0)
  {
    CGFloat v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PhoneRootViewController.m" lineNumber:671 description:@"Requested hide of video conference controller when not supported"];
  }
  if ([(PHLocalVideoViewController *)self->_localVideoViewController isViewLoaded])
  {
    [(PHLocalVideoViewController *)self->_localVideoViewController view];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004782C;
    v17[3] = &unk_1000A2858;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v6;
    BOOL v19 = self;
    BOOL v20 = v3;
    id v7 = objc_retainBlock(v17);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    double v14 = sub_100047878;
    double v15 = &unk_1000A1D50;
    id v16 = v6;
    id v8 = v6;
    double v9 = objc_retainBlock(&v12);
    if (v3) {
      double v10 = 0.300000012;
    }
    else {
      double v10 = 0.0;
    }
    -[PHLocalVideoViewController viewWillDisappear:](self->_localVideoViewController, "viewWillDisappear:", v3, v12, v13, v14, v15);
    +[UIView animateWithDuration:v9 animations:v7 completion:v10];
  }
}

- (void)showDetailsViewController
{
  if ([UIApp userInterfaceStyle] == 1)
  {
    id v8 = [(PhoneRootViewController *)self detailsViewController];
    uint64_t v3 = [v8 presentedViewController];
    if (v3)
    {
      BOOL v4 = (void *)v3;
    }
    else
    {
      BOOL faceTimeRegistrationViewIsShowing = self->_faceTimeRegistrationViewIsShowing;

      if (faceTimeRegistrationViewIsShowing) {
        return;
      }
      id v6 = [(PhoneRootViewController *)self detailsViewController];
      unsigned int v7 = [v6 isViewLoaded];

      if (!v7) {
        return;
      }
      id v8 = [(PhoneRootViewController *)self detailsViewController];
      BOOL v4 = [v8 view];
      [v4 setAlpha:1.0];
    }
  }
}

- (void)hideDetailsViewController
{
  if ([UIApp userInterfaceStyle] == 1)
  {
    id v4 = [(PhoneRootViewController *)self detailsViewController];
    uint64_t v3 = [v4 view];
    [v3 setAlpha:0.0];
  }
}

- (void)ensureBaseViewControllerIsShowing
{
  if (([UIApp alwaysShowLocalVideo] & 1) == 0)
  {
    id v6 = [(PhoneRootViewController *)self view];
    uint64_t v3 = [(PhoneRootViewController *)self contentView];
    id v4 = [(PhoneRootViewController *)self baseViewController];
    [v4 resetViewController];

    id v5 = [v3 superview];

    if (v5 != v6)
    {
      [(PhoneRootViewController *)self _ensureProperPositionForContentView];
      [v6 addSubview:v3];
    }
  }
}

- (void)createFaceTimeFirstRunViewIfNeeded
{
  if (+[PHRegistrationViewController shouldShowRegistration])
  {
    if (!self->_registrationController)
    {
      uint64_t v3 = +[IMDaemonController sharedInstance];
      [v3 addListenerID:@"com.apple.FaceTime" capabilities:kFZListenerCapAccounts];

      id v4 = +[IMDaemonController sharedInstance];
      [v4 blockUntilConnected];

      objc_initWeak(&location, self);
      id v5 = objc_alloc_init(PHRegistrationViewController);
      registrationController = self->_registrationController;
      self->_registrationController = v5;

      unsigned int v7 = self->_registrationController;
      double v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      CGFloat v11 = sub_100047C78;
      id v12 = &unk_1000A28A8;
      objc_copyWeak(&v13, &location);
      [(PHRegistrationViewController *)v7 setCompletionBlock:&v9];
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"_stausBarDidChangeFrame:" name:UIApplicationDidChangeStatusBarFrameNotification object:0];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_constrainRegistrationView
{
  id v13 = [(PHRegistrationViewController *)self->_registrationController view];
  uint64_t v3 = [(PhoneRootViewController *)self contentView];
  if (v13) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = [v13 superview];

    if (v5 != v3) {
      [v3 addSubview:v13];
    }
    id v6 = +[UIApplication sharedApplication];
    [v6 statusBarFrame];
    double v8 = v7;

    double v9 = +[NSLayoutConstraint constraintWithItem:v13 attribute:7 relatedBy:0 toItem:v3 attribute:7 multiplier:1.0 constant:0.0];
    [v3 addConstraint:v9];

    uint64_t v10 = +[NSLayoutConstraint constraintWithItem:v13 attribute:8 relatedBy:0 toItem:v3 attribute:8 multiplier:1.0 constant:-v8];
    [v3 addConstraint:v10];

    CGFloat v11 = +[NSLayoutConstraint constraintWithItem:v13 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    [v3 addConstraint:v11];

    id v12 = +[NSLayoutConstraint constraintWithItem:v13 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:v8];
    [v3 addConstraint:v12];

    [(FTRecentsContainerViewControllerProtocol *)self->_faceTimeContainerViewController hideContent];
  }
}

- (PhoneBaseViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setDetailsViewController:(id)a3
{
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
}

- (void)setFaceTimeContainerViewController:(id)a3
{
}

- (UIVisualEffectView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
}

- (BOOL)hasUpdateStatusLayoutGuide
{
  return self->_hasUpdateStatusLayoutGuide;
}

- (void)setHasUpdateStatusLayoutGuide:(BOOL)a3
{
  self->_hasUpdateStatusLayoutGuide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_faceTimeContainerViewController, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_localVideoViewController, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)showScreenTimeShieldForRequest:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  id v5 = self;
  sub_10004E330(a3);
  swift_release();
  swift_unknownObjectRelease();
}

- (void)lockoutViewControllerDidFinishDismissing:(id)a3
{
  type metadata accessor for MainActor();
  v7[2] = self;
  id v5 = a3;
  id v6 = self;
  sub_10004F844((uint64_t)sub_10004FBE8, (uint64_t)v7);
}

@end