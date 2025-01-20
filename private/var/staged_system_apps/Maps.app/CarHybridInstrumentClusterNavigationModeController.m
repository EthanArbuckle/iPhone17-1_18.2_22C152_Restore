@interface CarHybridInstrumentClusterNavigationModeController
- (BOOL)allowMapZoomAndRecentering;
- (BOOL)hasArrived;
- (BOOL)hasETAInfo;
- (BOOL)hidesStatusBanner;
- (BOOL)isSharingTrip;
- (BOOL)shouldAccessoriesModifyMapInsets;
- (BOOL)shouldMapControlsModifyMapInsets;
- (BOOL)shouldShowETATray;
- (BOOL)shouldShowGuidanceCard;
- (BOOL)showsHeadingIndicator;
- (BOOL)showsMapView;
- (BOOL)showsSpeedLimit;
- (BOOL)supportsAlternateRouteSelection;
- (BOOL)wantsNavigationDisplay;
- (CGSize)availableSize;
- (CarChromeNavigationCameraStyleManager)cameraStyleManager;
- (CarGuidanceCardViewController)guidanceCardController;
- (CarHybridInstrumentClusterNavigationModeController)init;
- (CarMapWidgetETACardViewController)etaCardController;
- (ChromeViewController)chromeViewController;
- (GEOComposedRoute)currentRoute;
- (GuidanceObserver)guidanceObserver;
- (NSArray)carFocusOrderSequences;
- (NSString)arrivalSubtitle;
- (NSString)arrivalTitle;
- (id)_mapWidgetChromeViewController;
- (id)contactSharingSuggestion;
- (id)desiredCards;
- (id)mapView;
- (id)personalizedItemSources;
- (id)sharingButtonTitle;
- (id)upcomingWaypoints;
- (int64_t)accessoriesHidingBehavior;
- (int64_t)autohideBehavior;
- (int64_t)cameraStyle;
- (unint64_t)maneuverViewLayoutType;
- (void)_setupGuidanceDisplays:(BOOL)a3;
- (void)_updateDisplayETA;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeInstrumentClusterCameraStyle:(int64_t)a4;
- (void)carDisplayConfigDidChangeNotification:(id)a3;
- (void)chromeConfigurationDidUpdateNotification:(id)a3;
- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)configureNavigationDisplay:(id)a3;
- (void)dealloc;
- (void)etaCardSign:(id)a3 didSelectAction:(unint64_t)a4;
- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)prepareToEnterStackInChromeViewController:(id)a3;
- (void)refreshCameraTypeAnimated:(BOOL)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setCameraStyle:(int64_t)a3;
- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setCameraStyleManager:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setCurrentRoute:(id)a3;
- (void)setEtaCardController:(id)a3;
- (void)setGuidanceCardController:(id)a3;
- (void)setHasArrived:(BOOL)a3;
- (void)setHasETAInfo:(BOOL)a3;
- (void)updateCardsAnimated:(BOOL)a3;
@end

@implementation CarHybridInstrumentClusterNavigationModeController

- (CarHybridInstrumentClusterNavigationModeController)init
{
  v9.receiver = self;
  v9.super_class = (Class)CarHybridInstrumentClusterNavigationModeController;
  v2 = [(CarHybridInstrumentClusterNavigationModeController *)&v9 init];
  if (v2)
  {
    v3 = sub_10096C8CC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v2->_cameraStyle = 1;
    v4 = [[CarMapWidgetETACardViewController alloc] initWithDestination:1];
    etaCardController = v2->_etaCardController;
    v2->_etaCardController = v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"chromeConfigurationDidUpdateNotification:" name:@"CarInstrumentClusterChromeConfigurationDidUpdateNotification" object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"carDisplayConfigDidChangeNotification:" name:@"CarDisplayConfigDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_10096C8CC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)CarHybridInstrumentClusterNavigationModeController;
  [(CarHybridInstrumentClusterNavigationModeController *)&v4 dealloc];
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager unregisterObserver:self];
  objc_super v4 = +[CarChromeNavigationCameraStyleManager sharedInstance];
  cameraStyleManager = self->_cameraStyleManager;
  self->_cameraStyleManager = v4;

  [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager registerObserver:self];
  self->_cameraStyle = [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager instrumentClusterCameraStyle];
}

- (id)mapView
{
  v2 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (void)setCameraStyle:(int64_t)a3
{
}

- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_cameraStyle != a3)
  {
    BOOL v4 = a4;
    v7 = sub_10096C8CC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134349312;
      objc_super v9 = self;
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Updating camera style: %ld", (uint8_t *)&v8, 0x16u);
    }

    self->_cameraStyle = a3;
    [(CarHybridInstrumentClusterNavigationModeController *)self refreshCameraTypeAnimated:v4];
  }
}

- (void)refreshCameraTypeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_10096C8CC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    int64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Refreshing camera type", buf, 0xCu);
  }

  v6 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  [v6 setNeedsUpdateMapInsets];

  v7 = [(CarHybridInstrumentClusterNavigationModeController *)self carChromeViewController];
  int v8 = [v7 navigationDisplay];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10096CCBC;
  v9[3] = &unk_1012E68D8;
  v9[4] = self;
  [v8 configureDisplay:v9 animated:v3];
}

- (void)configureNavigationDisplay:(id)a3
{
  id v4 = a3;
  v5 = sub_10096C8CC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v13 = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Configuring navigation display", (uint8_t *)&v13, 0xCu);
  }

  [v4 setCameraStyle:[self cameraStyle]];
  [v4 setCameraPaused:0];
  if (GEOConfigGetBOOL())
  {
    [v4 setShowsRoadLabel:&__kCFBooleanFalse];
  }
  else
  {
    v6 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
    v7 = [v6 view];
    int v8 = [v7 window];
    id v9 = [v8 _car_hybridInstrumentClusterLayout];

    BOOL v11 = (id)[(CarHybridInstrumentClusterNavigationModeController *)self cameraStyle] == (id)1
       && v9 == (id)2;
    v12 = +[NSNumber numberWithInt:v11];
    [v4 setShowsRoadLabel:v12];
  }
}

- (BOOL)hidesStatusBanner
{
  return +[CarDisplayConfigAuxiliaryTask centerConsoleSceneCount] != 0;
}

- (BOOL)showsHeadingIndicator
{
  v2 = [(CarHybridInstrumentClusterNavigationModeController *)self _mapWidgetChromeViewController];
  BOOL v3 = [v2 chromeConfiguration];
  BOOL v4 = [v3 showsHeadingIndicator] != (id)2;

  return v4;
}

- (BOOL)wantsNavigationDisplay
{
  return 1;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  v2 = [(CarHybridInstrumentClusterNavigationModeController *)self _mapWidgetChromeViewController];
  BOOL v3 = [v2 chromeConfiguration];
  BOOL v4 = [v3 showsSpeedLimit] != (id)2;

  return v4;
}

- (BOOL)allowMapZoomAndRecentering
{
  return 0;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return 0;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return 0;
}

- (int64_t)autohideBehavior
{
  return 0;
}

- (int64_t)accessoriesHidingBehavior
{
  return 3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a4;
  v6 = sub_10096C8CC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Becoming top context", buf, 0xCu);
  }

  v7 = +[MapsRadarController sharedInstance];
  [v7 addAttachmentProvider:self];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10096D0D0;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10096D128;
  v8[3] = &unk_1012E6300;
  v8[4] = self;
  unsigned __int8 v9 = [v5 isAnimated];
  [v5 addPreparation:v10 animations:v8 completion:0];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a4;
  v6 = sub_10096C8CC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    __int16 v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Resigning top context", buf, 0xCu);
  }

  v7 = +[MapsRadarController sharedInstance];
  [v7 removeAttachmentProvider:self];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10096D3D0;
  v8[3] = &unk_1012E5D08;
  v8[4] = self;
  [v5 addPreparation:v8];
}

- (id)personalizedItemSources
{
  BOOL v3 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  BOOL v4 = [v3 searchPinsManager];

  if (v4)
  {
    id v5 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
    v6 = [v5 searchPinsManager];
    v7 = [v6 routeStartEndItemSource];
    __int16 v10 = v7;
    int v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    int v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)desiredCards
{
  BOOL v3 = +[NSMutableArray array];
  if ([(CarHybridInstrumentClusterNavigationModeController *)self shouldShowGuidanceCard]) {
    [v3 addObject:@"Guidance"];
  }
  if ([(CarHybridInstrumentClusterNavigationModeController *)self shouldShowETATray]) {
    [v3 addObject:@"ETA"];
  }
  BOOL v4 = sub_10096C8CC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349314;
    int v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Returning desired cards: %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = [v3 copy];

  return v5;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_10096C8CC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    buf[0] = 134349314;
    *(void *)&buf[1] = self;
    __int16 v71 = 2112;
    id v72 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Configuring card: %@", (uint8_t *)buf, 0x16u);
  }

  __int16 v9 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  __int16 v10 = [v9 view];
  BOOL v11 = [v10 window];
  unsigned __int8 v12 = [v11 _car_shouldHorizontallyCenterMapInsets];

  if ([v7 isEqualToString:@"Guidance"])
  {
    int v13 = [(CarHybridInstrumentClusterNavigationModeController *)self guidanceCardController];
    [v6 setContent:v13];

    uint64_t v14 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
    v15 = [(id)v14 view];
    v16 = [v15 window];
    uint64_t v17 = 0;
    id v18 = [v16 _car_hybridInstrumentClusterAlignment];

    if (v18)
    {
      if (v18 == (id)1)
      {
        long long v19 = xmmword_100F69570;
        uint64_t v14 = 8;
      }
      else
      {
        if (v18 != (id)2)
        {
          v27 = 0;
          goto LABEL_17;
        }
        long long v19 = xmmword_100F72B20;
        uint64_t v14 = 2;
      }
      long long v39 = v19;
      v27 = 0;
      *(_DWORD *)((char *)buf + 3) = 0;
      buf[0] = 0;
      uint64_t v17 = 2;
    }
    else
    {
      *(_DWORD *)((char *)buf + 3) = 0;
      buf[0] = 0;
      GEOConfigGetDouble();
      v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      long long v39 = xmmword_100F67600;
      uint64_t v14 = 4;
      uint64_t v17 = 3;
    }
LABEL_17:
    long long v55 = v39;
    uint64_t v56 = 1;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 1148846080;
    uint64_t v60 = v17;
    int v61 = 1148846080;
    uint64_t v62 = 0;
    id v28 = v27;
    v29 = v28;
    id v63 = v28;
    __asm { FMOV            V0.2D, #8.0 }
    long long v64 = _Q0;
    long long v65 = _Q0;
    char v66 = 0;
    *(_DWORD *)v67 = buf[0];
    *(_DWORD *)&v67[3] = *(_DWORD *)((char *)buf + 3);
    uint64_t v68 = v14;
    unsigned __int8 v69 = v12;
    if (v6) {
      [v6 setLayout:&v55];
    }
    else {

    }
    [v6 setAccessory:0];
    [v6 setSelectionHandler:0];

    goto LABEL_29;
  }
  if (![v7 isEqualToString:@"ETA"]) {
    goto LABEL_29;
  }
  v20 = [(CarHybridInstrumentClusterNavigationModeController *)self etaCardController];
  [v6 setContent:v20];

  uint64_t v21 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  v22 = [(id)v21 view];
  v23 = [v22 window];
  uint64_t v24 = 0;
  id v25 = [v23 _car_hybridInstrumentClusterAlignment];

  if (v25)
  {
    if (v25 == (id)1)
    {
      long long v26 = xmmword_100F6F1C0;
      uint64_t v21 = 8;
    }
    else
    {
      if (v25 != (id)2)
      {
        v35 = 0;
        goto LABEL_25;
      }
      long long v26 = xmmword_100F72B10;
      uint64_t v21 = 2;
    }
    long long v39 = v26;
    v35 = 0;
    *(_DWORD *)((char *)buf + 3) = 0;
    buf[0] = 0;
    uint64_t v24 = 2;
  }
  else
  {
    *(_DWORD *)((char *)buf + 3) = 0;
    buf[0] = 0;
    GEOConfigGetDouble();
    v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    long long v39 = xmmword_100F6F700;
    uint64_t v24 = 3;
    uint64_t v21 = 1;
  }
LABEL_25:
  long long v40 = v39;
  uint64_t v41 = 1;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 1065353216;
  uint64_t v45 = v24;
  int v46 = 1148846080;
  uint64_t v47 = 0;
  id v36 = v35;
  v37 = v36;
  id v48 = v36;
  __asm { FMOV            V0.2D, #8.0 }
  long long v49 = _Q0;
  long long v50 = _Q0;
  char v51 = 0;
  *(_DWORD *)v52 = buf[0];
  *(_DWORD *)&v52[3] = *(_DWORD *)((char *)buf + 3);
  uint64_t v53 = v21;
  unsigned __int8 v54 = v12;
  if (v6) {
    [v6 setLayout:&v40];
  }
  else {

  }
  [v6 setAccessory:0];
LABEL_29:
}

- (BOOL)supportsAlternateRouteSelection
{
  return 0;
}

- (void)_updateDisplayETA
{
  id v11 = +[MNNavigationService sharedService];
  if ([v11 navigationState] != 5)
  {
    BOOL v3 = [GuidanceETA alloc];
    BOOL v4 = [v11 displayEtaInfo];
    id v5 = [v11 remainingDistanceInfo];
    id v6 = [v11 batteryChargeInfo];
    id v7 = [v11 upcomingStop];
    int v8 = [v7 timezone];
    __int16 v9 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v3, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v4, v5, v6, v8, [v11 navigationTransportType]);

    __int16 v10 = [(CarHybridInstrumentClusterNavigationModeController *)self etaCardController];
    [v10 setLatestETA:v9];

    [(CarHybridInstrumentClusterNavigationModeController *)self setHasETAInfo:v9 != 0];
  }
}

- (void)setCurrentRoute:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_currentRoute;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      __int16 v9 = sub_10096C8CC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = [(id)v7 uniqueRouteID];
        id v11 = [v10 UUIDString];
        int v14 = 134349314;
        v15 = self;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Updating route: %@", (uint8_t *)&v14, 0x16u);
      }
      objc_storeStrong((id *)&self->_currentRoute, a3);
      unsigned __int8 v12 = [(CarHybridInstrumentClusterNavigationModeController *)self carChromeViewController];
      int v13 = [v12 navigationDisplay];
      [v13 updateWithRoute:self->_currentRoute];
    }
  }
}

- (CarGuidanceCardViewController)guidanceCardController
{
  guidanceCardController = self->_guidanceCardController;
  if (!guidanceCardController)
  {
    BOOL v4 = [[CarGuidanceCardViewController alloc] initWithDestination:2 guidanceCardSizeProvider:self interactionDelegate:0];
    id v5 = self->_guidanceCardController;
    self->_guidanceCardController = v4;

    guidanceCardController = self->_guidanceCardController;
  }

  return guidanceCardController;
}

- (GuidanceObserver)guidanceObserver
{
  v2 = +[CarDisplayController sharedInstance];
  BOOL v3 = [v2 guidanceObserver];

  return (GuidanceObserver *)v3;
}

- (void)_setupGuidanceDisplays:(BOOL)a3
{
  BOOL v4 = sub_10096C8CC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v12 = 134349056;
    int v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Setting up guidance displays", (uint8_t *)&v12, 0xCu);
  }

  id v5 = [(CarHybridInstrumentClusterNavigationModeController *)self guidanceObserver];
  unint64_t v6 = [(CarHybridInstrumentClusterNavigationModeController *)self guidanceCardController];
  [v5 addOutlet:v6 forOwner:self];

  unint64_t v7 = [(CarHybridInstrumentClusterNavigationModeController *)self guidanceCardController];
  unsigned __int8 v8 = [v7 isViewLoaded];

  if ((v8 & 1) == 0)
  {
    __int16 v9 = [(CarHybridInstrumentClusterNavigationModeController *)self guidanceCardController];
    __int16 v10 = [v9 view];

    [(CarHybridInstrumentClusterNavigationModeController *)self updateCardsAnimated:0];
  }
  id v11 = [(CarHybridInstrumentClusterNavigationModeController *)self guidanceCardController];
  [v5 repeatAllUpdatesForOutlet:v11];
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4
{
  id v5 = sub_10096C8CC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349056;
    unsigned __int8 v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] CarNavigationDisplay configuration changed", (uint8_t *)&v7, 0xCu);
  }

  unint64_t v6 = [(CarHybridInstrumentClusterNavigationModeController *)self carChromeViewController];
  [v6 updateCardsForContext:self animated:0];
}

- (void)setHasArrived:(BOOL)a3
{
  if (self->_hasArrived != a3)
  {
    BOOL v3 = a3;
    self->_hasArrived = a3;
    id v5 = sub_10096C8CC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134349312;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating has arrived: %d", (uint8_t *)&v6, 0x12u);
    }

    [(CarHybridInstrumentClusterNavigationModeController *)self updateCardsAnimated:1];
  }
}

- (void)setHasETAInfo:(BOOL)a3
{
  if (self->_hasETAInfo != a3)
  {
    BOOL v3 = a3;
    self->_hasETAInfo = a3;
    id v5 = sub_10096C8CC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134349312;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating has eta info: %d", (uint8_t *)&v6, 0x12u);
    }

    [(CarHybridInstrumentClusterNavigationModeController *)self updateCardsAnimated:1];
  }
}

- (id)_mapWidgetChromeViewController
{
  BOOL v3 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  }
  else
  {
    int v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315650;
      int v13 = (CarHybridInstrumentClusterNavigationModeController *)"-[CarHybridInstrumentClusterNavigationModeController _"
                                                                  "mapWidgetChromeViewController]";
      __int16 v14 = 2080;
      v15 = "CarHybridInstrumentClusterNavigationModeController.m";
      __int16 v16 = 1024;
      int v17 = 413;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v12, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      int v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __int16 v8 = +[NSThread callStackSymbols];
        int v12 = 138412290;
        int v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
      }
    }
    BOOL v9 = sub_10096C8CC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
      int v12 = 134349314;
      int v13 = self;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}p] chromeViewController (%@) was not a CarMapWidgetChromeViewController", (uint8_t *)&v12, 0x16u);
    }
    id v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowGuidanceCard
{
  BOOL v3 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  BOOL v4 = [v3 view];
  id v5 = [v4 window];
  id v6 = [v5 _car_hybridInstrumentClusterAlignmentStyle];

  if (GEOConfigGetBOOL() && self->_cameraStyle == 2)
  {
    BOOL v7 = 1;
  }
  else if (GEOConfigGetBOOL())
  {
    BOOL v7 = self->_cameraStyle == 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  int BOOL = GEOConfigGetBOOL();
  BOOL v9 = sub_10096C8CC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    CFStringRef v10 = @"Wide";
    if (!v6) {
      CFStringRef v10 = @"Narrow";
    }
    uint64_t v21 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
    id v11 = [v21 view];
    int v12 = [v11 window];
    if ([(CarHybridInstrumentClusterNavigationModeController *)self hasArrived]) {
      int v13 = @"YES";
    }
    else {
      int v13 = @"NO";
    }
    __int16 v14 = v13;
    if (v7) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    __int16 v16 = v15;
    if (BOOL) {
      int v17 = @"YES";
    }
    else {
      int v17 = @"NO";
    }
    id v18 = v17;
    *(_DWORD *)buf = 134350338;
    v23 = self;
    __int16 v24 = 2112;
    uint64_t v25 = v20;
    __int16 v26 = 2112;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v14;
    __int16 v30 = 2112;
    v31 = v16;
    __int16 v32 = 2112;
    v33 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Configuring guidance card with alignment style: %@, window: %@, hasArrived: %@, showGuidanceCard: %@, geoDefaultEnabled: %@", buf, 0x3Eu);
  }
  if ((BOOL & v7) == 1) {
    return ![(CarHybridInstrumentClusterNavigationModeController *)self hasArrived];
  }
  else {
    return 0;
  }
}

- (BOOL)shouldShowETATray
{
  BOOL v3 = [(CarHybridInstrumentClusterNavigationModeController *)self _mapWidgetChromeViewController];
  BOOL v4 = [v3 chromeConfiguration];
  id v5 = [v4 showsETA];
  BOOL v6 = v5 != (id)2;

  BOOL v7 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  __int16 v8 = [v7 view];
  BOOL v9 = [v8 window];
  id v10 = [v9 _car_hybridInstrumentClusterAlignmentStyle];

  id v11 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
  int v12 = [v11 view];
  int v13 = [v12 window];
  id v14 = [v13 _car_hybridInstrumentClusterLayout];

  if (v10 || v14 != (id)2)
  {
    if (GEOConfigGetBOOL() && self->_cameraStyle == 2)
    {
      LODWORD(v15) = 1;
    }
    else if (GEOConfigGetBOOL())
    {
      LODWORD(v15) = self->_cameraStyle == 1;
    }
    else
    {
      LODWORD(v15) = 0;
    }
    __int16 v16 = sub_10096C8CC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (v10) {
        CFStringRef v17 = @"Wide";
      }
      else {
        CFStringRef v17 = @"Narrow";
      }
      CFStringRef v18 = @"Maneuver";
      if (v14 == (id)1) {
        CFStringRef v18 = @"ManeuverMap";
      }
      if (v14 == (id)2) {
        CFStringRef v18 = @"ManeuverMapOther";
      }
      CFStringRef v31 = v18;
      CFStringRef v32 = v17;
      v34 = [(CarHybridInstrumentClusterNavigationModeController *)self chromeViewController];
      v33 = [v34 view];
      long long v19 = [v33 window];
      if ([(CarHybridInstrumentClusterNavigationModeController *)self hasArrived]) {
        uint64_t v20 = @"YES";
      }
      else {
        uint64_t v20 = @"NO";
      }
      uint64_t v21 = v20;
      if (v15) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      char v35 = (char)v15;
      v15 = v22;
      if ([(CarHybridInstrumentClusterNavigationModeController *)self hasETAInfo]) {
        v23 = @"YES";
      }
      else {
        v23 = @"NO";
      }
      __int16 v24 = v23;
      if (v5 == (id)2) {
        uint64_t v25 = @"NO";
      }
      else {
        uint64_t v25 = @"YES";
      }
      __int16 v26 = v25;
      *(_DWORD *)buf = 134350850;
      v37 = self;
      __int16 v38 = 2112;
      CFStringRef v39 = v32;
      __int16 v40 = 2112;
      CFStringRef v41 = v31;
      __int16 v42 = 2112;
      uint64_t v43 = v19;
      __int16 v44 = 2112;
      uint64_t v45 = v21;
      __int16 v46 = 2112;
      uint64_t v47 = v15;
      __int16 v48 = 2112;
      long long v49 = v24;
      __int16 v50 = 2112;
      char v51 = v26;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Configuring ETA card with alignment style: %@, layout: %@, window: %@, hasArrived: %@, showETATray: %@, hasETAInfo: %@, chromeConfigEnabled: %@", buf, 0x52u);

      LOBYTE(v15) = v35;
    }

    if ([(CarHybridInstrumentClusterNavigationModeController *)self hasArrived])
    {
      return 0;
    }
    else
    {
      if (v14) {
        char v27 = (char)v15;
      }
      else {
        char v27 = 0;
      }
      unsigned __int8 v28 = [(CarHybridInstrumentClusterNavigationModeController *)self hasETAInfo];
      if (v5 == (id)2) {
        unsigned __int8 v29 = 0;
      }
      else {
        unsigned __int8 v29 = v28;
      }
      return v29 & v27;
    }
  }
  return v6;
}

- (void)updateCardsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CarHybridInstrumentClusterNavigationModeController *)self carChromeViewController];
  [v5 updateCardsForContext:self animated:v3];

  id v6 = [(CarHybridInstrumentClusterNavigationModeController *)self carChromeViewController];
  [v6 setNeedsUpdateComponent:@"navigationDisplay" animated:v3];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  if (MNNavigationServiceStateChangedToNavigating())
  {
    id v6 = [v7 route];
    [(CarHybridInstrumentClusterNavigationModeController *)self setCurrentRoute:v6];
  }
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  BOOL v5 = [a3 arrivalState] == (id)5;

  [(CarHybridInstrumentClusterNavigationModeController *)self setHasArrived:v5];
}

- (void)etaCardSign:(id)a3 didSelectAction:(unint64_t)a4
{
  BOOL v4 = sub_1005762E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315650;
    __int16 v8 = "-[CarHybridInstrumentClusterNavigationModeController etaCardSign:didSelectAction:]";
    __int16 v9 = 2080;
    id v10 = "CarHybridInstrumentClusterNavigationModeController.m";
    __int16 v11 = 1024;
    int v12 = 486;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v7, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    BOOL v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = +[NSThread callStackSymbols];
      int v7 = 138412290;
      __int16 v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)upcomingWaypoints
{
  v2 = [(CarHybridInstrumentClusterNavigationModeController *)self currentRoute];
  BOOL v3 = +[MNNavigationService sharedService];
  BOOL v4 = [v2 waypointsAfterStepIndex:[v3 stepIndex] legIndex:0];

  return v4;
}

- (BOOL)isSharingTrip
{
  return 0;
}

- (id)sharingButtonTitle
{
  return &stru_101324E70;
}

- (id)contactSharingSuggestion
{
  return 0;
}

- (NSString)arrivalTitle
{
  return 0;
}

- (NSString)arrivalSubtitle
{
  return 0;
}

- (CGSize)availableSize
{
  v2 = [(CarHybridInstrumentClusterNavigationModeController *)self guidanceCardController];
  [v2 availableCardSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)maneuverViewLayoutType
{
  return 1;
}

- (void)chromeConfigurationDidUpdateNotification:(id)a3
{
  [(CarHybridInstrumentClusterNavigationModeController *)self updateCardsAnimated:1];
  id v4 = [(CarHybridInstrumentClusterNavigationModeController *)self carChromeViewController];
  [v4 reloadAccessoriesForContext:self animated:1];
}

- (void)carDisplayConfigDidChangeNotification:(id)a3
{
  id v3 = [(CarHybridInstrumentClusterNavigationModeController *)self carChromeViewController];
  [v3 setNeedsUpdateComponent:@"statusBanner" animated:0];
}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeInstrumentClusterCameraStyle:(int64_t)a4
{
  [(CarHybridInstrumentClusterNavigationModeController *)self setCameraStyle:a4 animated:1];

  [(CarHybridInstrumentClusterNavigationModeController *)self updateCardsAnimated:1];
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10096EFBC;
  block[3] = &unk_1012E80F0;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (int64_t)cameraStyle
{
  return self->_cameraStyle;
}

- (void)setGuidanceCardController:(id)a3
{
}

- (CarMapWidgetETACardViewController)etaCardController
{
  return self->_etaCardController;
}

- (void)setEtaCardController:(id)a3
{
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (BOOL)hasArrived
{
  return self->_hasArrived;
}

- (BOOL)hasETAInfo
{
  return self->_hasETAInfo;
}

- (CarChromeNavigationCameraStyleManager)cameraStyleManager
{
  return self->_cameraStyleManager;
}

- (void)setCameraStyleManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraStyleManager, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_etaCardController, 0);
  objc_storeStrong((id *)&self->_guidanceCardController, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end