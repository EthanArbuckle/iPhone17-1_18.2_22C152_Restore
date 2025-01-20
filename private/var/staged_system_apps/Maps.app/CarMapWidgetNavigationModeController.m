@interface CarMapWidgetNavigationModeController
- (BOOL)allowMapZoomAndRecentering;
- (BOOL)hasArrived;
- (BOOL)hasETAInfo;
- (BOOL)hidesStatusBanner;
- (BOOL)shouldAccessoriesModifyMapInsets;
- (BOOL)shouldMapControlsModifyMapInsets;
- (BOOL)showsHeadingIndicator;
- (BOOL)showsMapView;
- (BOOL)showsSpeedLimit;
- (CarChromeNavigationCameraStyleManager)cameraStyleManager;
- (CarMapWidgetNavigationModeController)init;
- (ChromeViewController)chromeViewController;
- (GEOComposedRoute)currentRoute;
- (NSArray)carFocusOrderSequences;
- (id)desiredCards;
- (id)mapView;
- (id)personalizedItemSources;
- (int64_t)accessoriesHidingBehavior;
- (int64_t)autohideBehavior;
- (int64_t)cameraStyle;
- (void)_cancelAlertDismissTimer;
- (void)_carDisplayConfigDidChangeNotification:(id)a3;
- (void)_dismissAlertIfNeeded:(id)a3 withResponse:(id)a4;
- (void)_trafficAlertVisibilityChanged:(id)a3;
- (void)_updateDisplayETA;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeCenterConsoleCameraStyle:(int64_t)a4;
- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeInstrumentClusterCameraStyle:(int64_t)a4;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)configureNavigationDisplay:(id)a3;
- (void)dealloc;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)prepareToEnterStackInChromeViewController:(id)a3;
- (void)refreshCameraTypeAnimated:(BOOL)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setCameraStyle:(int64_t)a3;
- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setCameraStyleManager:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setCurrentRoute:(id)a3;
- (void)setHasArrived:(BOOL)a3;
- (void)setHasETAInfo:(BOOL)a3;
@end

@implementation CarMapWidgetNavigationModeController

- (CarMapWidgetNavigationModeController)init
{
  v9.receiver = self;
  v9.super_class = (Class)CarMapWidgetNavigationModeController;
  v2 = [(CarMapWidgetNavigationModeController *)&v9 init];
  if (v2)
  {
    v3 = [[CarMapWidgetETACardViewController alloc] initWithDestination:0];
    etaCard = v2->_etaCard;
    v2->_etaCard = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidatedAlertIds = v2->_invalidatedAlertIds;
    v2->_invalidatedAlertIds = v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_carDisplayConfigDidChangeNotification:" name:@"CarDisplayConfigDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CarMapWidgetNavigationModeController;
  [(CarMapWidgetNavigationModeController *)&v3 dealloc];
}

- (id)mapView
{
  v2 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
  objc_super v3 = [v2 mapView];

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsHeadingIndicator
{
  v2 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  unint64_t v3 = (unint64_t)[v2 sceneType];
  unsigned int v4 = (v3 < 8) & (0xF2u >> v3);

  return v4;
}

- (BOOL)hidesStatusBanner
{
  v2 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  unint64_t v3 = (char *)[v2 sceneType];
  if ((unint64_t)(v3 - 4) < 4 || v3 == (char *)1)
  {

    return +[CarDisplayConfigAuxiliaryTask centerConsoleSceneCount] != 0;
  }
  else
  {

    return 0;
  }
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)allowMapZoomAndRecentering
{
  return (id)[(CarMapWidgetNavigationModeController *)self cameraStyle] == (id)2;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return (id)[(CarMapWidgetNavigationModeController *)self cameraStyle] == (id)2;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return (id)[(CarMapWidgetNavigationModeController *)self cameraStyle] == (id)2;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 3;
}

- (void)setHasETAInfo:(BOOL)a3
{
  if (self->_hasETAInfo != a3)
  {
    self->_hasETAInfo = a3;
    id v4 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
    [v4 updateCardsForContext:self animated:1];
  }
}

- (void)setHasArrived:(BOOL)a3
{
  if (self->_hasArrived != a3)
  {
    self->_hasArrived = a3;
    id v4 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
    [v4 updateCardsForContext:self animated:1];
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
      if (qword_10160EDB0 != -1) {
        dispatch_once(&qword_10160EDB0, &stru_1012EBB58);
      }
      objc_super v9 = (void *)qword_10160EDA8;
      if (os_log_type_enabled((os_log_t)qword_10160EDA8, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v11 = [(id)v7 uniqueRouteID];
        v12 = [v11 UUIDString];
        int v15 = 134349314;
        v16 = self;
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating route: %@", (uint8_t *)&v15, 0x16u);
      }
      objc_storeStrong((id *)&self->_currentRoute, a3);
      v13 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
      v14 = [v13 navigationDisplay];
      [v14 updateWithRoute:self->_currentRoute];
    }
  }
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager unregisterObserver:self];
  id v4 = +[CarChromeNavigationCameraStyleManager sharedInstance];
  cameraStyleManager = self->_cameraStyleManager;
  self->_cameraStyleManager = v4;

  [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager registerObserver:self];
  unint64_t v6 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  id v7 = [v6 sceneType];

  unsigned __int8 v8 = self->_cameraStyleManager;
  if ((unint64_t)v7 < 4) {
    int64_t v9 = [(CarChromeNavigationCameraStyleManager *)v8 centerConsoleCameraStyle];
  }
  else {
    int64_t v9 = [(CarChromeNavigationCameraStyleManager *)v8 instrumentClusterCameraStyle];
  }
  self->_cameraStyle = v9;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10048A49C;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10048A528;
  v4[3] = &unk_1012E5D08;
  [a4 addPreparation:v5 animations:v4 completion:0];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10048A6F4;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4 animations:&stru_1012EBB10 completion:0];
}

- (id)desiredCards
{
  if ([(CarMapWidgetNavigationModeController *)self hasArrived]
    || ![(CarMapWidgetNavigationModeController *)self hasETAInfo])
  {
    unint64_t v3 = &__NSArray0__struct;
  }
  else
  {
    CFStringRef v5 = @"DashboardETACardKey";
    unint64_t v3 = +[NSArray arrayWithObjects:&v5 count:1];
  }

  return v3;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"DashboardETACardKey"])
  {
    [v6 setContent:self->_etaCard];
    unsigned __int8 v8 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
    unint64_t v9 = (unint64_t)[v8 sceneType] - 1;
    if (v9 > 6)
    {
      uint64_t v11 = 3;
      int v10 = 1148846080;
    }
    else
    {
      int v10 = dword_100F6F710[v9];
      uint64_t v11 = qword_100F6F730[v9];
    }

    HIDWORD(v28) = 0;
    *(_DWORD *)((char *)&v28 + 1) = 0;
    long long v17 = xmmword_100F6F700;
    uint64_t v18 = 1;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 1065353216;
    uint64_t v22 = v11;
    LODWORD(v23) = v10;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    __asm { FMOV            V0.2D, #5.0 }
    long long v26 = _Q0;
    long long v27 = _Q0;
    LOBYTE(v28) = 1;
    uint64_t v29 = 1;
    LOBYTE(v30) = 0;
    if (v6) {
      [v6 setLayout:&v17];
    }
    [v6 setAccessory:0 v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30];
  }
}

- (void)configureNavigationDisplay:(id)a3
{
  id v4 = a3;
  [v4 setCameraStyle:[self cameraStyle]];
  [v4 setCameraPaused:0];
}

- (id)personalizedItemSources
{
  unint64_t v3 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
  id v4 = [v3 searchPinsManager];

  if (v4)
  {
    CFStringRef v5 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
    id v6 = [v5 searchPinsManager];
    id v7 = [v6 routeStartEndItemSource];
    int v10 = v7;
    unsigned __int8 v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    unsigned __int8 v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)setCameraStyle:(int64_t)a3
{
}

- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_cameraStyle != a3)
  {
    self->_cameraStyle = a3;
    [(CarMapWidgetNavigationModeController *)self refreshCameraTypeAnimated:a4];
  }
}

- (void)refreshCameraTypeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v5 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
  [v5 setNeedsUpdateComponent:@"mapcontrols" animated:1];

  id v6 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
  [v6 setNeedsUpdateComponent:@"accessories" animated:1];

  id v7 = [(CarMapWidgetNavigationModeController *)self chromeViewController];
  [v7 setNeedsUpdateMapInsets];

  unsigned __int8 v8 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  unint64_t v9 = [v8 navigationDisplay];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10048ABD8;
  v10[3] = &unk_1012E68D8;
  v10[4] = self;
  [v9 configureDisplay:v10 animated:v3];
}

- (void)_updateDisplayETA
{
  id v10 = +[MNNavigationService sharedService];
  if ([v10 navigationState] != 5)
  {
    BOOL v3 = [GuidanceETA alloc];
    id v4 = [v10 displayEtaInfo];
    CFStringRef v5 = [v10 remainingDistanceInfo];
    id v6 = [v10 batteryChargeInfo];
    id v7 = [v10 upcomingStop];
    unsigned __int8 v8 = [v7 timezone];
    unint64_t v9 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v3, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v4, v5, v6, v8, [v10 navigationTransportType]);

    [(CarMapWidgetETACardViewController *)self->_etaCard setLatestETA:v9];
    [(CarMapWidgetNavigationModeController *)self setHasETAInfo:v9 != 0];
  }
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
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
    [(CarMapWidgetNavigationModeController *)self setCurrentRoute:v6];
  }
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  uint64_t v12 = [v11 navigationDisplay];
  [(id)v12 setTrafficAlert:v9];

  [(CarMapWidgetNavigationModeController *)self _cancelAlertDismissTimer];
  objc_initWeak(&location, self);
  v13 = +[CarDisplayController sharedInstance];
  LOBYTE(v12) = [v13 isCurrentlyConnectedToCarAppScene];

  if ((v12 & 1) == 0)
  {
    v14 = sub_100577D9C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "didReceiveTrafficIncidentAlert and was not connected to carApp scene. Starting auto dismiss timer.", buf, 2u);
    }

    [v9 alertDisplayDuration];
    double v16 = v15;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10048AFAC;
    v19[3] = &unk_1012EBB38;
    objc_copyWeak(&v22, &location);
    id v20 = v9;
    id v21 = v10;
    long long v17 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v19 block:v16];
    alertDismissTimer = self->_alertDismissTimer;
    self->_alertDismissTimer = v17;

    objc_destroyWeak(&v22);
  }
  objc_destroyWeak(&location);
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v5 = a4;
  invalidatedAlertIds = self->_invalidatedAlertIds;
  id v10 = v5;
  id v7 = [v5 alertID];
  LOBYTE(invalidatedAlertIds) = [(NSMutableSet *)invalidatedAlertIds containsObject:v7];

  if ((invalidatedAlertIds & 1) == 0)
  {
    id v8 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
    id v9 = [v8 navigationDisplay];
    [v9 setTrafficAlert:v10];
  }
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  invalidatedAlertIds = self->_invalidatedAlertIds;
  id v6 = [a4 alertID:a3];
  [(NSMutableSet *)invalidatedAlertIds addObject:v6];

  id v8 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  id v7 = [v8 navigationDisplay];
  [v7 setTrafficAlert:0];
}

- (void)_trafficAlertVisibilityChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  id v6 = [v5 navigationDisplay];
  id v15 = [v6 trafficAlert];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"kCarTrafficAlertIdKey"];
  id v9 = [v15 alertID];
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    invalidatedAlertIds = self->_invalidatedAlertIds;
    uint64_t v12 = [v15 alertID];
    [(NSMutableSet *)invalidatedAlertIds addObject:v12];

    v13 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
    v14 = [v13 navigationDisplay];
    [v14 setTrafficAlert:0];
  }
}

- (void)_dismissAlertIfNeeded:(id)a3 withResponse:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[CarDisplayController sharedInstance];
  unsigned int v9 = [v8 isCurrentlyConnectedToCarAppScene];

  unsigned int v10 = sub_100577D9C();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_dismissAlertIfNeeded called, but user opened main app in the meantime.", buf, 2u);
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_dismissAlertIfNeeded - dismissing alert.", v16, 2u);
    }

    [(CarMapWidgetNavigationModeController *)self _cancelAlertDismissTimer];
    invalidatedAlertIds = self->_invalidatedAlertIds;
    v13 = [v6 alertID];
    [(NSMutableSet *)invalidatedAlertIds addObject:v13];

    v14 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
    id v15 = [v14 navigationDisplay];
    [v15 setTrafficAlert:0];

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)_cancelAlertDismissTimer
{
  [(NSTimer *)self->_alertDismissTimer invalidate];
  alertDismissTimer = self->_alertDismissTimer;
  self->_alertDismissTimer = 0;
}

- (void)_carDisplayConfigDidChangeNotification:(id)a3
{
  id v3 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  [v3 setNeedsUpdateComponent:@"statusBanner" animated:0];
}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeCenterConsoleCameraStyle:(int64_t)a4
{
  id v6 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  id v7 = [v6 sceneType];

  if ((unint64_t)v7 <= 3)
  {
    [(CarMapWidgetNavigationModeController *)self setCameraStyle:a4 animated:1];
  }
}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeInstrumentClusterCameraStyle:(int64_t)a4
{
  id v6 = [(CarMapWidgetNavigationModeController *)self carChromeViewController];
  id v7 = [v6 sceneType];

  if ((unint64_t)v7 >= 4)
  {
    [(CarMapWidgetNavigationModeController *)self setCameraStyle:a4 animated:1];
  }
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

- (BOOL)hasArrived
{
  return self->_hasArrived;
}

- (BOOL)hasETAInfo
{
  return self->_hasETAInfo;
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
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
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_invalidatedAlertIds, 0);
  objc_storeStrong((id *)&self->_alertDismissTimer, 0);

  objc_storeStrong((id *)&self->_etaCard, 0);
}

@end