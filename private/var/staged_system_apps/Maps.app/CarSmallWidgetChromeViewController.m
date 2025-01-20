@interface CarSmallWidgetChromeViewController
+ (BOOL)canTransitionWithoutMap;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isEligibleForMapViewFrameRateLimiting;
- (BOOL)shouldAutomaticallyLoadMapView;
- (CarSmallWidgetChromeViewController)initWithCarSceneType:(int64_t)a3;
- (id)createMapReplacementView;
- (id)defaultFullscreenViewControllerDismissalTransition;
- (id)defaultFullscreenViewControllerPresentationTransition;
- (int64_t)sceneType;
- (void)_tappedWidget:(id)a3;
- (void)dealloc;
- (void)didSuppress;
- (void)didUnsuppress;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CarSmallWidgetChromeViewController

- (CarSmallWidgetChromeViewController)initWithCarSceneType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarSmallWidgetChromeViewController;
  v4 = [(ChromeViewController *)&v8 init];
  if (v4)
  {
    v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 > 7) {
        CFStringRef v6 = @".Unknown";
      }
      else {
        CFStringRef v6 = off_1012F5138[a3];
      }
      *(_DWORD *)buf = 134349314;
      v10 = v4;
      __int16 v11 = 2114;
      CFStringRef v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] initialising with sceneType: %{public}@", buf, 0x16u);
    }

    v4->_sceneType = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_100577F64();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    objc_super v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4 = +[CarDisplayController sharedInstance];
  v5 = [v4 routeGeniusManager];
  [v5 deactivateForChrome:self];

  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetChromeViewController;
  [(ChromeViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CarSmallWidgetChromeViewController;
  [(ChromeViewController *)&v10 viewDidLoad];
  v3 = sub_100577F64();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CarSmallWidgetChromeViewController view loaded.", v9, 2u);
  }

  if ((id)[(CarSmallWidgetChromeViewController *)self sceneType] == (id)3) {
    +[UIColor clearColor];
  }
  else {
  v4 = +[UIColor crsui_dashboardWidgetBackgroundColor];
  }
  v5 = [(CarSmallWidgetChromeViewController *)self view];
  [v5 setBackgroundColor:v4];

  objc_super v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tappedWidget:"];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v6;

  [(UITapGestureRecognizer *)self->_tapGesture setDelegate:self];
  objc_super v8 = [(CarSmallWidgetChromeViewController *)self view];
  [v8 addGestureRecognizer:self->_tapGesture];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CarSmallWidgetChromeViewController;
  -[CarSmallWidgetChromeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_super v8 = sub_100577F64();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(CarSmallWidgetChromeViewController *)self view];
    [v9 frame];
    v24.double width = v10;
    v24.double height = v11;
    CFStringRef v12 = NSStringFromCGSize(v24);
    v25.double width = width;
    v25.double height = height;
    v13 = NSStringFromCGSize(v25);
    unsigned int v14 = [v7 isAnimated];
    v15 = @"NO";
    if (v14) {
      v15 = @"YES";
    }
    v16 = v15;
    *(_DWORD *)buf = 138412802;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Widget will transition from size: %@ to size: %@, animated: %@", buf, 0x20u);
  }
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetChromeViewController;
  [(ChromeViewController *)&v9 viewDidLayoutSubviews];
  v3 = sub_100577F64();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(CarSmallWidgetChromeViewController *)self view];
    [v4 frame];
    v5 = NSStringFromCGRect(v14);
    objc_super v6 = [(CarSmallWidgetChromeViewController *)self view];
    id v7 = [v6 safeAreaLayoutGuide];
    [v7 layoutFrame];
    objc_super v8 = NSStringFromCGRect(v15);
    *(_DWORD *)buf = 138412546;
    CGFloat v11 = v5;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Widget chromeVC didLayoutSubviews, frame: %@, safeAreaLayoutGuide: %@", buf, 0x16u);
  }
}

- (id)defaultFullscreenViewControllerPresentationTransition
{
  v2 = [[CarSmallWidgetChromeTransitionAnimator alloc] initWithOperation:1];

  return v2;
}

- (id)defaultFullscreenViewControllerDismissalTransition
{
  v2 = [[CarSmallWidgetChromeTransitionAnimator alloc] initWithOperation:2];

  return v2;
}

+ (BOOL)canTransitionWithoutMap
{
  return 1;
}

- (BOOL)shouldAutomaticallyLoadMapView
{
  return 0;
}

- (id)createMapReplacementView
{
  return 0;
}

- (void)didSuppress
{
  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetChromeViewController;
  [(ChromeViewController *)&v6 didSuppress];
  v3 = sub_100577E34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    objc_super v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] is suppressing. Will deactivate RG for chrome.", buf, 0xCu);
  }

  v4 = +[CarDisplayController sharedInstance];
  v5 = [v4 routeGeniusManager];
  [v5 deactivateForChrome:self];
}

- (void)didUnsuppress
{
  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetChromeViewController;
  [(ChromeViewController *)&v9 didUnsuppress];
  v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    v4 = [(ChromeViewController *)self topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
  }
  objc_super v6 = sub_100577E34();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    CGFloat v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] is unsuppressing. Will try to activate RG for chrome.", buf, 0xCu);
  }

  id v7 = +[CarDisplayController sharedInstance];
  objc_super v8 = [v7 routeGeniusManager];
  [v8 activateIfPossibleForChrome:self];
}

- (void)_tappedWidget:(id)a3
{
  v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    objc_super v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ _tappedWidget", (uint8_t *)&v5, 0xCu);
  }

  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  int v5 = [(ChromeViewController *)self topContext];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ChromeViewController *)self topContext];
    unsigned int v8 = [v7 modeHandlesGestures] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)isEligibleForMapViewFrameRateLimiting
{
  return 0;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (void).cxx_destruct
{
}

@end