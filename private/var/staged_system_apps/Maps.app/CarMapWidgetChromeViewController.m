@interface CarMapWidgetChromeViewController
- (BOOL)canShowCards;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isDisplayingNavigation;
- (CarInstrumentClusterChromeConfiguration)chromeConfiguration;
- (CarMapWidgetChromeViewController)initWithCarSceneType:(int64_t)a3;
- (void)_externalDeviceStateUpdated:(id)a3;
- (void)_tappedMapWidget:(id)a3;
- (void)configureAccessoriesOverlay:(id)a3 forContext:(id)a4;
- (void)didSuppress;
- (void)didUnsuppress;
- (void)prepareMapViewForFirstUse;
- (void)sceneConfigurationDidChange:(id)a3;
- (void)setChromeConfiguration:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)windowWantsToZoomInDirection:(int64_t)a3;
@end

@implementation CarMapWidgetChromeViewController

- (CarMapWidgetChromeViewController)initWithCarSceneType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarMapWidgetChromeViewController;
  v4 = -[CarChromeViewController initWithCarSceneType:](&v8, "initWithCarSceneType:");
  v5 = v4;
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) != 4 && v4)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_externalDeviceStateUpdated:" name:@"MapsExternalDeviceUpdated" object:0];
  }
  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CarMapWidgetChromeViewController;
  [(CarChromeViewController *)&v7 viewDidLoad];
  v3 = [(CarMapWidgetChromeViewController *)self view];
  [v3 removeAllGestureRecognizers];

  v4 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tappedMapWidget:"];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v4;

  [(UITapGestureRecognizer *)self->_tapGesture setDelegate:self];
  v6 = [(CarMapWidgetChromeViewController *)self view];
  [v6 addGestureRecognizer:self->_tapGesture];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CarMapWidgetChromeViewController;
  -[CarMapWidgetChromeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ((id)[(CarChromeViewController *)self sceneType] == (id)7)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100C616E8;
    v8[3] = &unk_1012F07C0;
    objc_copyWeak(&v9, &location);
    [v7 animateAlongsideTransition:0 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)didSuppress
{
  v12.receiver = self;
  v12.super_class = (Class)CarMapWidgetChromeViewController;
  [(CarChromeViewController *)&v12 didSuppress];
  v3 = sub_100577D9C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CarMapWidgetChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      objc_super v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] is suppressing. Will deactivate RG for chrome.", buf, 0xCu);
  }
  v10 = +[CarDisplayController sharedInstance];
  objc_super v11 = [v10 routeGeniusManager];
  [v11 deactivateForChrome:self];
}

- (void)didUnsuppress
{
  v16.receiver = self;
  v16.super_class = (Class)CarMapWidgetChromeViewController;
  [(CarChromeViewController *)&v16 didUnsuppress];
  v3 = [(ChromeViewController *)self mapView];
  [v3 setUserInteractionEnabled:0];

  v4 = [(CarChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    v5 = [(CarChromeViewController *)self topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
  }
  id v7 = sub_100577D9C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_super v8 = self;
    if (!v8)
    {
      v13 = @"<nil>";
      goto LABEL_13;
    }
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      objc_super v11 = [(CarMapWidgetChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
      objc_super v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_11;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_11:

LABEL_13:
    *(_DWORD *)buf = 138543362;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] is unsuppressing. Will try to activate RG for chrome.", buf, 0xCu);
  }
  v14 = +[CarDisplayController sharedInstance];
  v15 = [v14 routeGeniusManager];
  [v15 activateIfPossibleForChrome:self];
}

- (void)prepareMapViewForFirstUse
{
  v7.receiver = self;
  v7.super_class = (Class)CarMapWidgetChromeViewController;
  [(CarChromeViewController *)&v7 prepareMapViewForFirstUse];
  v3 = [(ChromeViewController *)self mapView];
  v4 = [v3 _mapLayer];
  [v4 setApplicationUILayout:2];

  v5 = [(ChromeViewController *)self mapView];
  v6 = [v5 _mapLayer];
  [v6 setUseSmallCache:1];
}

- (BOOL)canShowCards
{
  return (unint64_t)[(CarChromeViewController *)self sceneType] < 4
      || (id)[(CarChromeViewController *)self sceneType] == (id)7
      || (id)[(CarInstrumentClusterChromeConfiguration *)self->_chromeConfiguration showsETA] != (id)2;
}

- (BOOL)isDisplayingNavigation
{
  v3 = [(ChromeViewController *)self pendingContexts];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ChromeViewController *)self contexts];
  }
  v6 = v5;

  objc_super v7 = [v6 _maps_firstContextOfClass:objc_opt_class()];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [v6 _maps_firstContextOfClass:objc_opt_class()];
    BOOL v8 = v9 != 0;
  }
  return v8;
}

- (void)configureAccessoriesOverlay:(id)a3 forContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[(CarChromeViewController *)self sceneType] < 4
    || (id)[(CarChromeViewController *)self sceneType] == (id)7)
  {
    v15.receiver = self;
    v15.super_class = (Class)CarMapWidgetChromeViewController;
    [(CarChromeViewController *)&v15 configureAccessoriesOverlay:v6 forContext:v7];
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v8 = [v7 showsSpeedLimit];
    }
    else {
      id v8 = 0;
    }
    uint64_t v9 = 1;
    switch([(CarInstrumentClusterChromeConfiguration *)self->_chromeConfiguration showsSpeedLimit])
    {
      case 0uLL:
      case 3uLL:
        uint64_t v9 = 0;
        goto LABEL_10;
      case 1uLL:
        goto LABEL_10;
      case 2uLL:
        id v8 = 0;
LABEL_10:
        [v6 setShowSpeedSign:v8];
        [v6 setSpeedSignIgnoresUserSettings:v9];
        break;
      default:
        break;
    }
    if (objc_opt_respondsToSelector()) {
      id v10 = [v7 showsHeadingIndicator];
    }
    else {
      id v10 = 0;
    }
    switch([(CarInstrumentClusterChromeConfiguration *)self->_chromeConfiguration showsHeadingIndicator])
    {
      case 0uLL:
      case 3uLL:
        [v6 setShowHeadingIndicator:v10];
        objc_super v11 = v6;
        uint64_t v12 = 0;
        goto LABEL_19;
      case 1uLL:
        v13 = v6;
        id v14 = v10;
        goto LABEL_18;
      case 2uLL:
        v13 = v6;
        id v14 = 0;
LABEL_18:
        [v13 setShowHeadingIndicator:v14];
        objc_super v11 = v6;
        uint64_t v12 = 1;
LABEL_19:
        [v11 setHeadingIndicatorIgnoresUserSettings:v12];
        break;
      default:
        break;
    }
  }
}

- (void)sceneConfigurationDidChange:(id)a3
{
  id v5 = a3;
  if ((unint64_t)[(CarChromeViewController *)self sceneType] <= 3)
  {
    id v10 = sub_100577D9C();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
LABEL_36:

      goto LABEL_37;
    }
    objc_super v11 = self;
    if (!v11)
    {
      objc_super v16 = @"<nil>";
      goto LABEL_32;
    }
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      id v14 = [(CarMapWidgetChromeViewController *)v11 performSelector:"accessibilityIdentifier"];
      objc_super v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        objc_super v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_12;
      }
    }
    objc_super v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_12:

LABEL_32:
    unint64_t v30 = [(CarChromeViewController *)v11 sceneType];
    if (v30 > 7) {
      CFStringRef v31 = @".Unknown";
    }
    else {
      CFStringRef v31 = off_10131CB58[v30];
    }
    *(_DWORD *)buf = 138543618;
    v36 = v16;
    __int16 v37 = 2112;
    CFStringRef v38 = v31;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "[%{public}@] Received chromeConfiguration for unsupported sceneType: %@", buf, 0x16u);

    goto LABEL_36;
  }
  p_chromeConfiguration = &self->_chromeConfiguration;
  if ([(CarInstrumentClusterChromeConfiguration *)self->_chromeConfiguration isEqual:v5]) {
    goto LABEL_37;
  }
  id v7 = [(CarInstrumentClusterChromeConfiguration *)*p_chromeConfiguration showsHeadingIndicator];
  if (v7 == [v5 showsHeadingIndicator])
  {
    id v8 = [(CarInstrumentClusterChromeConfiguration *)*p_chromeConfiguration showsSpeedLimit];
    BOOL v9 = v8 != [v5 showsSpeedLimit];
  }
  else
  {
    BOOL v9 = 1;
  }
  id v17 = [(CarInstrumentClusterChromeConfiguration *)*p_chromeConfiguration showsETA];
  id v34 = [v5 showsETA];
  v18 = sub_100577D9C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v33 = v17;
    v19 = self;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      v22 = [(CarMapWidgetChromeViewController *)v19 performSelector:"accessibilityIdentifier"];
      v23 = v22;
      if (v22 && ![v22 isEqualToString:v21])
      {
        v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

        goto LABEL_20;
      }
    }
    v32 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_20:

    v24 = *p_chromeConfiguration;
    if (v9) {
      v25 = @"YES";
    }
    else {
      v25 = @"NO";
    }
    v26 = v25;
    if (v33 == v34) {
      v27 = @"NO";
    }
    else {
      v27 = @"YES";
    }
    v28 = v27;
    *(_DWORD *)buf = 138544386;
    v36 = v32;
    __int16 v37 = 2112;
    CFStringRef v38 = (const __CFString *)v24;
    __int16 v39 = 2112;
    id v40 = v5;
    __int16 v41 = 2112;
    v42 = v26;
    __int16 v43 = 2112;
    v44 = v28;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Will update chrome configuration from: %@ to :%@. needsAccessoriesUpdate: %@, needsCardsUpdate: %@", buf, 0x34u);

    id v17 = v33;
  }

  objc_storeStrong((id *)&self->_chromeConfiguration, a3);
  if (v9)
  {
    v29 = [(CarChromeViewController *)self topContext];
    [(CarChromeViewController *)self reloadAccessoriesForContext:v29 animated:[(CarMapWidgetChromeViewController *)self isViewLoaded]];
  }
  if (v17 != v34)
  {
    id v10 = [(CarChromeViewController *)self topContext];
    [(CarChromeViewController *)self updateCardsForContext:v10 animated:[(CarMapWidgetChromeViewController *)self isViewLoaded]];
    goto LABEL_36;
  }
LABEL_37:
}

- (void)_externalDeviceStateUpdated:(id)a3
{
  v4 = +[MapsExternalDevice sharedInstance];
  if (![v4 ownsScreen])
  {

LABEL_13:
    objc_super v15 = sub_100577D9C();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      id chromeDeactivationToken = self->_chromeDeactivationToken;
      self->_id chromeDeactivationToken = 0;
      goto LABEL_24;
    }
    objc_super v16 = self;
    if (!v16)
    {
      v21 = @"<nil>";
      goto LABEL_22;
    }
    id v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      v19 = [(CarMapWidgetChromeViewController *)v16 performSelector:"accessibilityIdentifier"];
      v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_20;
      }
    }
    v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_20:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v23 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] Releasing chrome deactivation token because we own the screen", buf, 0xCu);

    goto LABEL_23;
  }
  char BOOL = GEOConfigGetBOOL();

  if (BOOL) {
    goto LABEL_13;
  }
  if (self->_chromeDeactivationToken) {
    return;
  }
  id v6 = sub_100577D9C();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  id v7 = self;
  id v8 = (objc_class *)objc_opt_class();
  BOOL v9 = NSStringFromClass(v8);
  if (objc_opt_respondsToSelector())
  {
    id v10 = [(CarMapWidgetChromeViewController *)v7 performSelector:"accessibilityIdentifier"];
    objc_super v11 = v10;
    if (v10 && ![v10 isEqualToString:v9])
    {
      uint64_t v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

      goto LABEL_10;
    }
  }
  uint64_t v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

  *(_DWORD *)buf = 138543362;
  v23 = v12;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Acquiring chrome deactivation token because we do not own the screen", buf, 0xCu);

LABEL_11:
  v13 = [(ChromeViewController *)self acquireChromeDeactivationTokenForReason:@"(no screen ownership)"];
  id chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_id chromeDeactivationToken = v13;
LABEL_24:
}

- (void)windowWantsToZoomInDirection:(int64_t)a3
{
  id v5 = sub_100577D9C();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  id v6 = self;
  if (!v6)
  {
    objc_super v11 = @"<nil>";
    goto LABEL_10;
  }
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(CarMapWidgetChromeViewController *)v6 performSelector:"accessibilityIdentifier"];
    id v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      objc_super v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  objc_super v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v13 = v11;
  __int16 v14 = 2048;
  int64_t v15 = a3;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] windowWantsToZoomInDirection: called with direction: %ld", buf, 0x16u);

LABEL_11:
  if (a3 == 2)
  {
    [(CarChromeViewController *)self zoomOut];
  }
  else if (a3 == 1)
  {
    [(CarChromeViewController *)self zoomIn];
  }
}

- (void)_tappedMapWidget:(id)a3
{
  v4 = sub_100577D9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self;
    if (!v5)
    {
      id v10 = @"<nil>";
      goto LABEL_10;
    }
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(CarMapWidgetChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      BOOL v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] _tappedMapWidget", buf, 0xCu);
  }
  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_tapGesture == a3;
}

- (CarInstrumentClusterChromeConfiguration)chromeConfiguration
{
  return self->_chromeConfiguration;
}

- (void)setChromeConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeConfiguration, 0);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);

  objc_storeStrong((id *)&self->_tapGesture, 0);
}

@end