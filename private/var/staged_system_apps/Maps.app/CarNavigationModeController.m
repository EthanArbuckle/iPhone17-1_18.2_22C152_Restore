@interface CarNavigationModeController
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration;
- (AudioPreferences)audioPreferences;
- (BOOL)_shouldShowShareButton;
- (BOOL)allowKnobNudgeMapPanning;
- (BOOL)allowMapZoomAndRecentering;
- (BOOL)isSharingTrip;
- (BOOL)isShowingJunctionView;
- (BOOL)isTogglingETACard;
- (BOOL)shouldAccessoriesModifyMapInsets;
- (BOOL)shouldMapControlsModifyMapInsets;
- (BOOL)shouldSuppressAutohideRecognizerForTouch:(id)a3;
- (BOOL)showsHeadingIndicator;
- (BOOL)showsMapView;
- (BOOL)showsNavigationBar;
- (BOOL)showsSpeedLimit;
- (BOOL)supportsAlternateRouteSelection;
- (BOOL)wantsNavigationDisplay;
- (CarChromeNavigationCameraStyleManager)cameraStyleManager;
- (CarCompressionTestCardViewController)compressionTestCardController;
- (CarETACardViewController)etaCardController;
- (CarGuidanceCardViewController)guidanceCardController;
- (CarNavigationModeController)init;
- (CarTrafficAlertCardViewController)trafficAlertCardController;
- (CarWaypointsOverviewCardViewController)waypointsOverviewCardController;
- (ChromeViewController)chromeViewController;
- (GCDTimer)shareEtaDisclosureAutoDismissTimer;
- (GEOComposedRoute)currentRoute;
- (GuidanceObserver)guidanceObserver;
- (NSArray)carFocusOrderSequences;
- (NSArray)preferredCarFocusEnvironments;
- (NSString)arrivalSubtitle;
- (NSString)arrivalTitle;
- (_TtC4Maps28NavigationWaypointController)waypointController;
- (id)contactSharingSuggestion;
- (id)desiredCards;
- (id)mapView;
- (id)personalizedItemSources;
- (id)sharingButtonTitle;
- (id)upcomingWaypoints;
- (int)currentUsageTarget;
- (int64_t)accessoriesHidingBehavior;
- (int64_t)autohideBehavior;
- (int64_t)cameraStyle;
- (int64_t)navigationModeState;
- (unint64_t)_upcomingGuidanceLevelForGuidanceSignStyle:(int64_t)a3 currentGuidanceLevel:(unint64_t)a4;
- (unint64_t)audioSettingsCurrentState;
- (void)_captureCurrentNavigationModeState;
- (void)_captureUserToggledCameraStyle;
- (void)_loadCompressionTestCardWithHeight:(double)a3 priority:(float)a4;
- (void)_maneuverBannerViewEVStationsNotification:(id)a3;
- (void)_ppt_notityETATrayUpdateCompleted;
- (void)_sendOtherEVStationsRequest;
- (void)_setupGuidanceDisplays:(BOOL)a3;
- (void)_toggleCameraStyle;
- (void)_toggleETACardAnimated:(BOOL)a3;
- (void)_updateShareButtonContentAndVisibility:(BOOL)a3;
- (void)_updateShareETADisclosureAutoDismissTimer;
- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeCenterConsoleCameraStyle:(int64_t)a4;
- (void)carShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification:(id)a3;
- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4;
- (void)chromeNavigationDisplay:(id)a3 userDidTapMap:(id)a4 atPoint:(CGPoint)a5;
- (void)compressionTestCard:(id)a3 reloadWithSpacerHeight:(double)a4 priority:(float)a5;
- (void)compressionTestCardRequestsDismiss:(id)a3;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)configureFocusContainerGuideController:(id)a3;
- (void)configureNavigationDisplay:(id)a3;
- (void)dealloc;
- (void)endNavigation;
- (void)etaCardSign:(id)a3 didSelectAction:(unint64_t)a4;
- (void)guidanceCardController:(id)a3 didChangeGuidanceSignStyle:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)hideAutohidingContentWithAnimation:(id)a3;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeVoiceGuidanceLevel:(unint64_t)a4;
- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateNavTrayGuidance:(id)a4;
- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4;
- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4;
- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)navigationService:(id)a3 showJunctionView:(id)a4;
- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshCameraTypeAnimated:(BOOL)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setAudioPreferences:(id)a3;
- (void)setCameraStyle:(int64_t)a3;
- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setCameraStyleManager:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setCompressionTestCardController:(id)a3;
- (void)setCurrentRoute:(id)a3;
- (void)setEtaCardController:(id)a3;
- (void)setGuidanceCardController:(id)a3;
- (void)setIsTogglingETACard:(BOOL)a3;
- (void)setNavigationModeState:(int64_t)a3;
- (void)setShareEtaDisclosureAutoDismissTimer:(id)a3;
- (void)setShowingJunctionView:(BOOL)a3;
- (void)setTrafficAlertCardController:(id)a3;
- (void)setTrayExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setWaypointsOverviewCardController:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4;
- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4;
- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3;
- (void)trafficAlertCardViewControllerDismiss:(id)a3;
- (void)waypointsOverviewController:(id)a3 didSelectWaypoint:(id)a4 atIndex:(unint64_t)a5;
- (void)waypointsOverviewControllerDidSelectAddWaypoint:(id)a3;
@end

@implementation CarNavigationModeController

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.maps.compressionTest", 0);
  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"NavigationVoiceGuidanceLevelDriving"];

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObserver:self forKeyPath:@"NavigationCarPlayPersistedGuidanceSignStyle"];

  [(CarChromeNavigationCameraStyleManager *)self->_cameraStyleManager unregisterObserver:self];
  v6.receiver = self;
  v6.super_class = (Class)CarNavigationModeController;
  [(CarNavigationModeController *)&v6 dealloc];
}

- (CarNavigationModeController)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarNavigationModeController;
  v2 = [(CarNavigationModeController *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidatedAlertIds = v2->_invalidatedAlertIds;
    v2->_invalidatedAlertIds = v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1003C0E68, @"com.apple.maps.compressionTest", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_super v6 = +[NSUserDefaults standardUserDefaults];
    [v6 addObserver:v2 forKeyPath:@"NavigationVoiceGuidanceLevelDriving" options:0 context:&off_1012E7CE8];

    v7 = +[NSUserDefaults standardUserDefaults];
    [v7 addObserver:v2 forKeyPath:@"NavigationCarPlayPersistedGuidanceSignStyle" options:0 context:&off_1012E7CF0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"carShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification:" name:CarShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"carShareETAInfoViewDidInteractWithShareETASuggestionNotification:" name:CarShareETAInfoViewDidInteractWithShareETASuggestionNotification object:0];

    v10 = +[CarChromeNavigationCameraStyleManager sharedInstance];
    [(CarNavigationModeController *)v2 setCameraStyleManager:v10];

    v11 = [(CarNavigationModeController *)v2 cameraStyleManager];
    [v11 registerObserver:v2];

    v12 = +[NSUserDefaults standardUserDefaults];
    v2->_navigationGuidanceSignStyle = (int64_t)[v12 integerForKey:@"NavigationCarPlayPersistedGuidanceSignStyle"];
  }
  return v2;
}

- (id)mapView
{
  v2 = [(CarNavigationModeController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (GuidanceObserver)guidanceObserver
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 guidanceObserver];

  return (GuidanceObserver *)v3;
}

- (_TtC4Maps28NavigationWaypointController)waypointController
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 platformController];

  v4 = [v3 currentNavigationSession];
  v5 = [v4 waypointController];

  if (!v5)
  {
    objc_super v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Couldn't find a navigation waypoint controller within car nav context.", v8, 2u);
    }
  }

  return (_TtC4Maps28NavigationWaypointController *)v5;
}

- (BOOL)showsMapView
{
  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  if ((char *)[(CarNavigationModeController *)self navigationModeState] - 3 <= (char *)3
    && (+[MNNavigationService sharedService],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 navigationState],
        v5,
        v6 == 6))
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  else
  {
    v8 = [(CarNavigationModeController *)self carChromeViewController];
    v9 = [v8 navigationDisplay];
    unsigned int v10 = [v9 isCameraPanning];

    unint64_t v11 = 6;
    if (!v10) {
      unint64_t v11 = 0;
    }
    retstr->var0 = 2;
    retstr->var1 = v11;
    retstr->var2 = 5;
  }
  return result;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)allowMapZoomAndRecentering
{
  return (id)[(CarNavigationModeController *)self cameraStyle] == (id)2;
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (BOOL)wantsNavigationDisplay
{
  return 1;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return (id)[(CarNavigationModeController *)self cameraStyle] == (id)2;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return (id)[(CarNavigationModeController *)self cameraStyle] == (id)2;
}

- (int64_t)autohideBehavior
{
  return 2
       * ((unint64_t)[(CarNavigationModeController *)self navigationModeState] + 1 < 4);
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (BOOL)shouldSuppressAutohideRecognizerForTouch:(id)a3
{
  id v4 = a3;
  if ((id)[(CarNavigationModeController *)self cameraStyle] == (id)2)
  {
    v5 = [(CarNavigationModeController *)self mapView];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    unsigned int v10 = [(CarNavigationModeController *)self chromeViewController];
    unint64_t v11 = [v10 routeAnnotationsController];
    v12 = [v11 configuration];

    v13 = [(CarNavigationModeController *)self mapView];
    objc_super v14 = [v12 routes];
    v15 = [v12 selectedRoute];
    v16 = +[MNNavigationService sharedService];
    v17 = sub_1005BE5F0(v16);
    v18 = +[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", v13, v14, v15, v17, v7, v9);

    if (v18)
    {
      v19 = [(CarNavigationModeController *)self currentRoute];
      BOOL v20 = v18 != v19;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)supportsAlternateRouteSelection
{
  return 1;
}

- (void)setTrafficAlertCardController:(id)a3
{
  v5 = (CarTrafficAlertCardViewController *)a3;
  if (self->_trafficAlertCardController != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_trafficAlertCardController, a3);
    [(CarNavigationModeController *)self setNavigationModeState:2 * (self->_trafficAlertCardController != 0)];
    v5 = v6;
  }
}

- (CarGuidanceCardViewController)guidanceCardController
{
  guidanceCardController = self->_guidanceCardController;
  if (!guidanceCardController)
  {
    id v4 = [[CarGuidanceCardViewController alloc] initWithDestination:0 guidanceCardSizeProvider:0 interactionDelegate:self];
    v5 = self->_guidanceCardController;
    self->_guidanceCardController = v4;

    guidanceCardController = self->_guidanceCardController;
  }

  return guidanceCardController;
}

- (CarETACardViewController)etaCardController
{
  etaCardController = self->_etaCardController;
  if (!etaCardController)
  {
    id v4 = [CarETACardViewController alloc];
    v5 = [(CarNavigationModeController *)self carChromeViewController];
    double v6 = [(CarETACardViewController *)v4 initWithDataSource:self delegate:self interruptPresenter:v5 canExpand:1];
    double v7 = self->_etaCardController;
    self->_etaCardController = v6;

    [(CarNavigationModeController *)self _updateShareButtonContentAndVisibility:0];
    etaCardController = self->_etaCardController;
  }

  return etaCardController;
}

- (CarWaypointsOverviewCardViewController)waypointsOverviewCardController
{
  waypointsOverviewCardController = self->_waypointsOverviewCardController;
  if (!waypointsOverviewCardController)
  {
    id v4 = [[CarWaypointsOverviewCardViewController alloc] initWithDelegate:self];
    v5 = self->_waypointsOverviewCardController;
    self->_waypointsOverviewCardController = v4;

    waypointsOverviewCardController = self->_waypointsOverviewCardController;
  }

  return waypointsOverviewCardController;
}

- (void)setNavigationModeState:(int64_t)a3
{
  if (self->_navigationModeState != a3)
  {
    self->_int64_t navigationModeState = a3;
    v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 + 1) > 7) {
        CFStringRef v6 = @"Default";
      }
      else {
        CFStringRef v6 = off_1012E7E50[a3 + 1];
      }
      int v13 = 138412290;
      CFStringRef v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "NavMode: setNavigationModeState: %@, -> updating chrome.", (uint8_t *)&v13, 0xCu);
    }

    double v7 = [(CarNavigationModeController *)self etaCardController];
    id v8 = [v7 isViewLoaded];

    double v9 = [(CarNavigationModeController *)self carChromeViewController];
    [v9 updateCardsForContext:self animated:v8];

    unsigned int v10 = [(CarNavigationModeController *)self carChromeViewController];
    [v10 setNeedsUpdateComponent:@"mapcontrols" animated:v8];

    int64_t navigationModeState = self->_navigationModeState;
    if ((unint64_t)(navigationModeState - 3) < 4 || !navigationModeState)
    {
      v12 = [(CarNavigationModeController *)self etaCardController];
      [v12 updateContent];
    }
  }
}

- (void)setCurrentRoute:(id)a3
{
  id v10 = a3;
  if (([v10 isEqual:self->_currentRoute] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentRoute, a3);
    v5 = [(CarNavigationModeController *)self carChromeViewController];
    CFStringRef v6 = [v5 navigationDisplay];
    [v6 updateWithRoute:self->_currentRoute];

    double v7 = [(CarNavigationModeController *)self etaCardController];
    [v7 updateContent];

    id v8 = [(CarNavigationModeController *)self carChromeViewController];
    [v8 updateCardsForContext:self animated:0];

    double v9 = [(CarNavigationModeController *)self carChromeViewController];
    [v9 updateComponentsIfNeeded];
  }
}

- (void)setShowingJunctionView:(BOOL)a3
{
  if (self->_showingJunctionView != a3)
  {
    self->_showingJunctionView = a3;
    id v5 = [(CarNavigationModeController *)self chromeViewController];
    id v4 = [(CarNavigationModeController *)self etaCardController];
    [v5 updateCardsForContext:self animated:[v4 isViewLoaded]];
  }
}

- (void)configureFocusContainerGuideController:(id)a3
{
}

- (id)desiredCards
{
  v3 = +[NSMutableArray arrayWithCapacity:2];
  id v4 = v3;
  switch(self->_navigationModeState)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      CFStringRef v12 = @"Guidance";
      CFStringRef v13 = @"Compression Test";
      id v5 = &v12;
      goto LABEL_7;
    case 0:
      CFStringRef v17 = @"Guidance";
      CFStringRef v18 = @"ETA";
      id v5 = &v17;
      goto LABEL_7;
    case 1:
      [v3 addObject:@"Stops"];
      break;
    case 2:
      CFStringRef v14 = @"Guidance";
      CFStringRef v15 = @"Traffic Alert";
      id v5 = &v14;
LABEL_7:
      uint64_t v6 = 2;
      goto LABEL_8;
    case 3:
    case 4:
    case 5:
    case 6:
      CFStringRef v16 = @"ETA";
      id v5 = &v16;
      uint64_t v6 = 1;
LABEL_8:
      double v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, v6, v12, v13, v14, v15, v16, v17, v18);
      [v4 addObjectsFromArray:v7];

      break;
    default:
      break;
  }
  id v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:@"CarNavigationHideGuidanceCard"];

  if (v9) {
    [v4 removeObject:@"Guidance"];
  }
  id v10 = [v4 copy];

  return v10;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CarNavigationModeController *)self etaCardController];
  [v8 updateContent];

  unsigned int v9 = [(CarNavigationModeController *)self etaCardController];
  unsigned int v10 = [v9 isExpanded];

  unint64_t v11 = [(CarNavigationModeController *)self etaCardController];
  unsigned int v12 = [v11 isShowingShareETASuggestion];

  unsigned int v13 = v10 ^ [(CarNavigationModeController *)self isTogglingETACard];
  if (![v7 isEqualToString:@"Guidance"])
  {
    if ([v7 isEqualToString:@"ETA"])
    {
      v23 = [(CarNavigationModeController *)self etaCardController];
      [v6 setContent:v23];

      memset(v89, 0, sizeof(v89));
      long long v77 = xmmword_100F6F1C0;
      uint64_t v78 = 1;
      uint64_t v79 = 0;
      uint64_t v80 = 0;
      uint64_t v81 = 1065353216;
      uint64_t v82 = 2;
      int v83 = 1148846080;
      uint64_t v84 = 0;
      uint64_t v85 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      long long v86 = _Q0;
      long long v87 = _Q0;
      char v88 = 1;
      uint64_t v90 = 8;
      char v91 = 0;
      if (v6) {
        [v6 setLayout:&v77];
      }
      [v6 setStaysOnTop:v13 | v12];
      goto LABEL_24;
    }
    if ([v7 isEqualToString:@"Traffic Alert"])
    {
      v25 = [(CarNavigationModeController *)self trafficAlertCardController];
      [v6 setContent:v25];

      memset(v74, 0, sizeof(v74));
      long long v62 = xmmword_100F6F1C0;
      uint64_t v63 = 1;
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      uint64_t v66 = 1144750080;
      uint64_t v67 = 2;
      int v68 = 1148846080;
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      long long v71 = _Q0;
      long long v72 = _Q0;
      char v73 = 1;
      uint64_t v75 = 8;
      char v76 = 0;
      if (v6)
      {
        v27 = &v62;
LABEL_23:
        [v6 setLayout:v27];
      }
    }
    else
    {
      if (![v7 isEqualToString:@"Compression Test"])
      {
        if (![v7 isEqualToString:@"Stops"]) {
          goto LABEL_26;
        }
        v32 = +[NSBundle mainBundle];
        v33 = [v32 localizedStringForKey:@"CarPlay_EditStops" value:@"localized string not found" table:0];
        [v6 setTitle:v33];

        v34 = [(CarNavigationModeController *)self waypointsOverviewCardController];
        [v6 setContent:v34];

        HIDWORD(v46) = 0;
        *(_DWORD *)((char *)&v46 + 1) = 0;
        long long v36 = xmmword_100F6F1C0;
        long long v37 = xmmword_100F67600;
        uint64_t v38 = 3;
        uint64_t v39 = 1148846080;
        uint64_t v40 = 2;
        LODWORD(v41) = 1148846080;
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        __asm { FMOV            V0.2D, #8.0 }
        long long v44 = _Q0;
        long long v45 = _Q0;
        LOBYTE(v46) = 1;
        uint64_t v47 = 8;
        LOBYTE(v48) = 0;
        if (v6) {
          [v6 setLayout:&v36];
        }
        v30 = v6;
        uint64_t v31 = 1;
        goto LABEL_25;
      }
      v28 = [(CarNavigationModeController *)self compressionTestCardController];
      [v6 setContent:v28];

      memset(v59, 0, sizeof(v59));
      v49[0] = xmmword_100F6F1C0;
      v49[1] = xmmword_100F6F1D0;
      uint64_t v50 = 0;
      uint64_t v51 = 1065353216;
      uint64_t v52 = 2;
      int v53 = 1148846080;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      long long v56 = _Q0;
      long long v57 = _Q0;
      char v58 = 1;
      uint64_t v60 = 8;
      char v61 = 0;
      if (v6)
      {
        v27 = v49;
        goto LABEL_23;
      }
    }
LABEL_24:
    v30 = v6;
    uint64_t v31 = 0;
LABEL_25:
    [v30 setAccessory:v31, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48];
    goto LABEL_26;
  }
  CFStringRef v14 = [(CarNavigationModeController *)self guidanceCardController];
  [v6 setContent:v14];

  if (self->_navigationGuidanceSignStyle == 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  memset(v107, 0, sizeof(v107));
  long long v95 = xmmword_100F69570;
  uint64_t v96 = 1;
  uint64_t v97 = 0;
  uint64_t v98 = 0;
  uint64_t v99 = 1148846080;
  uint64_t v100 = v15;
  int v101 = 1148846080;
  uint64_t v102 = 0;
  uint64_t v103 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v104 = _Q0;
  long long v105 = _Q0;
  char v106 = 1;
  uint64_t v108 = 8;
  char v109 = 0;
  if (v6) {
    [v6 setLayout:&v95];
  }
  [v6 setAccessory:0];
  v21 = [(CarNavigationModeController *)self guidanceCardController];
  objc_initWeak(&location, v21);

  if (v13)
  {
    v22 = 0;
  }
  else
  {
    v22 = v92;
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_1003C1E94;
    v92[3] = &unk_1012E7D00;
    v21 = &v93;
    objc_copyWeak(&v93, &location);
  }
  [v6 setSelectionHandler:v22];
  if ((v13 & 1) == 0) {
    objc_destroyWeak(v21);
  }
  objc_destroyWeak(&location);
LABEL_26:
}

- (id)personalizedItemSources
{
  v3 = [(CarNavigationModeController *)self chromeViewController];
  id v4 = [v3 searchPinsManager];

  if (v4)
  {
    id v5 = [(CarNavigationModeController *)self chromeViewController];
    id v6 = [v5 searchPinsManager];
    id v7 = [v6 routeStartEndItemSource];
    unsigned int v10 = v7;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (AudioPreferences)audioPreferences
{
  audioPreferences = self->_audioPreferences;
  if (!audioPreferences)
  {
    id v4 = [AudioPreferences alloc];
    id v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = [(AudioPreferences *)v4 initWithDefaults:v5];
    id v7 = self->_audioPreferences;
    self->_audioPreferences = v6;

    audioPreferences = self->_audioPreferences;
  }

  return audioPreferences;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C21FC;
  v9[3] = &unk_1012E5D08;
  v9[4] = self;
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003C23C8;
  v7[3] = &unk_1012E6300;
  v7[4] = self;
  unsigned __int8 v8 = [v5 isAnimated];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003C2570;
  v6[3] = &unk_1012E7D28;
  [v5 addPreparation:v9 animations:v7 completion:v6];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003C26EC;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  id v5 = a4;
  [v5 addPreparation:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003C2834;
  v6[3] = &unk_1012E7D28;
  v6[4] = self;
  [v5 addCompletion:v6];
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  if ((id)[(CarNavigationModeController *)self navigationModeState] == (id)1)
  {
    id v4 = [(CarNavigationModeController *)self chromeViewController];
    [v4 captureUserAction:4 onTarget:1025];

    [(CarNavigationModeController *)self setNavigationModeState:0];
  }
  else
  {
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int64_t v6 = [(CarNavigationModeController *)self navigationModeState];
      if ((unint64_t)(v6 + 1) > 7) {
        CFStringRef v7 = @"Default";
      }
      else {
        CFStringRef v7 = off_1012E7E50[v6 + 1];
      }
      int v8 = 138412290;
      CFStringRef v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "carCardViewCloseButtonTapped in nav mode in an unexpected state: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)configureNavigationDisplay:(id)a3
{
  id v4 = a3;
  [v4 setCameraStyle:[self cameraStyle]];
  [v4 setCameraPaused:0];
  [v4 setRouteGeniusEntry:0];
}

- (void)hideAutohidingContentWithAnimation:(id)a3
{
  id v6 = a3;
  id v4 = [(CarNavigationModeController *)self etaCardController];
  unsigned int v5 = [v4 isExpanded];

  if (v5) {
    -[CarNavigationModeController _toggleETACardAnimated:](self, "_toggleETACardAnimated:", [v6 isAnimated]);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (char *)a5;
  if (v10 && a6 == &off_1012E7CE8)
  {
    if ([v10 isEqualToString:@"NavigationVoiceGuidanceLevelDriving"])
    {
      unsigned int v13 = sub_100015DB4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "NavigationVoiceGuidanceLevelDriving changed to %@", buf, 0xCu);
      }

      CFStringRef v14 = [(CarNavigationModeController *)self audioPreferences];
      [v14 loadValuesFromDefaults];

      uint64_t v15 = [(CarNavigationModeController *)self carChromeViewController];
      CFStringRef v16 = [(CarNavigationModeController *)self etaCardController];
      [v15 setNeedsUpdateComponent:@"mapcontrols" animated:[v16 isViewLoaded]];

      goto LABEL_15;
    }
LABEL_14:
    v25.receiver = self;
    v25.super_class = (Class)CarNavigationModeController;
    [(CarNavigationModeController *)&v25 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_15;
  }
  if (!v10
    || a6 != &off_1012E7CF0
    || ![v10 isEqualToString:@"NavigationCarPlayPersistedGuidanceSignStyle"])
  {
    goto LABEL_14;
  }
  CFStringRef v17 = +[NSUserDefaults standardUserDefaults];
  id v18 = [v17 integerForKey:@"NavigationCarPlayPersistedGuidanceSignStyle"];

  v19 = sub_100015DB4();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    if (v18)
    {
      if (v18 == (id)1)
      {
        CFStringRef v20 = @".Mini";
      }
      else
      {
        v21 = sub_1005762E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v27 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
          __int16 v28 = 2080;
          v29 = "CarNavigationGuidanceSign.h";
          __int16 v30 = 1024;
          int v31 = 36;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          v22 = sub_1005762E4();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v27 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        CFStringRef v20 = @".Unknown";
      }
    }
    else
    {
      CFStringRef v20 = @".Default";
    }
    *(_DWORD *)buf = 138412290;
    v27 = (const char *)v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "NavigationCarPlayPersistedGuidanceSignStyle changed to %@ -> will update guidanceCardVC", buf, 0xCu);
  }

  v24 = [(CarNavigationModeController *)self guidanceCardController];
  [v24 setNavigationGuidanceSignStyle:v18];

LABEL_15:
}

- (unint64_t)audioSettingsCurrentState
{
  v2 = [(CarNavigationModeController *)self audioPreferences];
  id v3 = [v2 guidanceLevelForTransportType:0];

  unint64_t v4 = +[NavAudioControlView navAudioTypeForGuidanceLevel:v3];
  unsigned int v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)v3 + 1 >= 4)
    {
      id v6 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v3];
    }
    else
    {
      id v6 = off_1012E7EA8[(void)v3 + 1];
    }
    *(_DWORD *)buf = 134218242;
    unint64_t v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "audioSettingsCurrentState will return audioType: %ld for guidanceLevel: %@", buf, 0x16u);
  }
  return v4;
}

- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4
{
  uint64_t v5 = 2;
  if (a4 == 1) {
    uint64_t v5 = 1;
  }
  BOOL v6 = a4 == 2 || a4 == 1;
  if (a4 == 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v5;
  }
  int v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = off_1012E7E90[v7];
    int v14 = 138412290;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "audioControlView:didSelectAudioType: user manually changed audio settings to: %@", (uint8_t *)&v14, 0xCu);
  }
  previousGuidanceCardSignAudioSetting = self->_previousGuidanceCardSignAudioSetting;
  self->_previousGuidanceCardSignAudioSetting = 0;

  self->_hasUserManuallyReducedAudio = v6;
  id v11 = [(CarNavigationModeController *)self audioPreferences];
  unsigned int v12 = [(CarNavigationModeController *)self currentRoute];
  [v11 setGuidanceLevel:v7 forTransportType:[v12 transportType]];

  unsigned int v13 = [(CarNavigationModeController *)self audioPreferences];
  [v13 synchronize];
}

- (unint64_t)_upcomingGuidanceLevelForGuidanceSignStyle:(int64_t)a3 currentGuidanceLevel:(unint64_t)a4
{
  if (a3)
  {
    if (a3 != 1 || a4 < 2) {
      return a4;
    }
    if (a4 == -1)
    {
      BOOL v6 = sub_100015DB4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Invalid guidance level \"NoOverride\" in CarNavigationModeController.", v7, 2u);
      }

      return 0;
    }
    if (a4 == 2) {
      return 1;
    }
  }
  previousGuidanceCardSignAudioSetting = self->_previousGuidanceCardSignAudioSetting;
  if (!previousGuidanceCardSignAudioSetting) {
    return a4;
  }

  return [(NSNumber *)previousGuidanceCardSignAudioSetting unsignedIntegerValue];
}

- (void)guidanceCardController:(id)a3 didChangeGuidanceSignStyle:(int64_t)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  int v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (a4)
    {
      if (a4 == 1)
      {
        CFStringRef v9 = @".Mini";
      }
      else
      {
        __int16 v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          long long v44 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
          __int16 v45 = 2080;
          uint64_t v46 = "CarNavigationGuidanceSign.h";
          __int16 v47 = 1024;
          LODWORD(v48) = 36;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          id v11 = sub_1005762E4();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            unsigned int v12 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            long long v44 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        CFStringRef v9 = @".Unknown";
      }
    }
    else
    {
      CFStringRef v9 = @".Default";
    }
    unsigned int v13 = @"NO";
    if (v5) {
      unsigned int v13 = @"YES";
    }
    int v14 = v13;
    *(_DWORD *)buf = 138412546;
    long long v44 = (const char *)v9;
    __int16 v45 = 2112;
    uint64_t v46 = (const char *)v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "guidanceCardController:didChangeNavigationSignStyle: %@ userInitiated: %@", buf, 0x16u);
  }
  self->_int64_t navigationGuidanceSignStyle = a4;
  uint64_t v15 = +[NSUserDefaults standardUserDefaults];
  [v15 setInteger:self->_navigationGuidanceSignStyle forKey:@"NavigationCarPlayPersistedGuidanceSignStyle"];

  CFStringRef v16 = [(CarNavigationModeController *)self carChromeViewController];
  [v16 setNeedsUpdateComponent:@"cards" animated:0];

  CFStringRef v17 = [(CarNavigationModeController *)self carChromeViewController];
  [v17 updateComponentsIfNeeded];

  if (v5)
  {
    if (self->_hasUserManuallyReducedAudio)
    {
      id v18 = sub_100015DB4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "guidanceCardController:didChangeNavigationSignStyle: was user initiated but the user has manually reduced "
              "audio this session so we will not change the audio settings.";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, buf, 2u);
      }
    }
    else
    {
      CFStringRef v20 = [(CarNavigationModeController *)self audioPreferences];
      id v21 = [v20 guidanceLevelForTransportType:0];

      unint64_t v22 = [(CarNavigationModeController *)self _upcomingGuidanceLevelForGuidanceSignStyle:self->_navigationGuidanceSignStyle currentGuidanceLevel:v21];
      v23 = +[NSNumber numberWithUnsignedInteger:v21];
      previousGuidanceCardSignAudioSetting = self->_previousGuidanceCardSignAudioSetting;
      self->_previousGuidanceCardSignAudioSetting = v23;

      id v18 = sub_100015DB4();
      BOOL v25 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v21 == (id)v22)
      {
        if (v25)
        {
          int64_t navigationGuidanceSignStyle = self->_navigationGuidanceSignStyle;
          if (navigationGuidanceSignStyle)
          {
            if (navigationGuidanceSignStyle == 1)
            {
              CFStringRef v27 = @".Mini";
            }
            else
            {
              __int16 v30 = sub_1005762E4();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                long long v44 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
                __int16 v45 = 2080;
                uint64_t v46 = "CarNavigationGuidanceSign.h";
                __int16 v47 = 1024;
                LODWORD(v48) = 36;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100BB36BC())
              {
                int v31 = sub_1005762E4();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  v32 = +[NSThread callStackSymbols];
                  *(_DWORD *)buf = 138412290;
                  long long v44 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                }
              }
              CFStringRef v27 = @".Unknown";
            }
          }
          else
          {
            CFStringRef v27 = @".Default";
          }
          if ((unint64_t)v21 + 1 >= 4)
          {
            v33 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v21];
          }
          else
          {
            v33 = off_1012E7EA8[(void)v21 + 1];
          }
          *(_DWORD *)buf = 138412546;
          long long v44 = (const char *)v27;
          __int16 v45 = 2112;
          uint64_t v46 = (const char *)v33;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "guidanceCardController:didChangeCardState currentSignStyle: %@, currentGuidanceLevel: %@ -> No need to change upcoming guidance level.", buf, 0x16u);
        }
      }
      else
      {
        if (v25)
        {
          int64_t v28 = self->_navigationGuidanceSignStyle;
          if (v28)
          {
            if (v28 == 1)
            {
              CFStringRef v29 = @".Mini";
            }
            else
            {
              v34 = sub_1005762E4();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                long long v44 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
                __int16 v45 = 2080;
                uint64_t v46 = "CarNavigationGuidanceSign.h";
                __int16 v47 = 1024;
                LODWORD(v48) = 36;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100BB36BC())
              {
                v35 = sub_1005762E4();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  long long v36 = +[NSThread callStackSymbols];
                  *(_DWORD *)buf = 138412290;
                  long long v44 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                }
              }
              CFStringRef v29 = @".Unknown";
            }
          }
          else
          {
            CFStringRef v29 = @".Default";
          }
          if ((unint64_t)v21 + 1 >= 4)
          {
            long long v37 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v21];
          }
          else
          {
            long long v37 = off_1012E7EA8[(void)v21 + 1];
          }
          uint64_t v38 = v37;
          if (v22 + 1 >= 4)
          {
            uint64_t v39 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v22];
          }
          else
          {
            uint64_t v39 = off_1012E7EA8[v22 + 1];
          }
          *(_DWORD *)buf = 138412802;
          long long v44 = (const char *)v29;
          __int16 v45 = 2112;
          uint64_t v46 = (const char *)v38;
          __int16 v47 = 2112;
          uint64_t v48 = v39;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "guidanceCardController:didChangeCardState currentSignStyle: %@, currentGuidanceLevel: %@ -> Will change guidance level to: %@.", buf, 0x20u);
        }
        uint64_t v40 = [(CarNavigationModeController *)self carChromeViewController];
        [v40 interruptAutohideForIncidentalInteraction];

        uint64_t v41 = [(CarNavigationModeController *)self audioPreferences];
        [v41 setGuidanceLevel:v22 forTransportType:0];

        uint64_t v42 = [(CarNavigationModeController *)self audioPreferences];
        [v42 synchronize];

        id v18 = [(CarNavigationModeController *)self carChromeViewController];
        [v18 setNeedsUpdateComponent:@"mapcontrols" animated:1];
      }
    }
  }
  else
  {
    id v18 = sub_100015DB4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v19 = "guidanceCardController:didChangeNavigationSignStyle: was not user initiated so we will not update audio level";
      goto LABEL_22;
    }
  }
}

- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4
{
  id v5 = a4;
  BOOL v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = sub_100769DCC(v5);
    int v9 = 138412290;
    __int16 v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "navigationWaypointController:didUpdateDisplayedWaypoints: %@", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [(CarNavigationModeController *)self waypointsOverviewCardController];
  [v8 setWaypoints:v5];
}

- (void)setCameraStyle:(int64_t)a3
{
}

- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_cameraStyle != a3)
  {
    BOOL v4 = a4;
    self->_cameraStyle = a3;
    BOOL v6 = [(CarNavigationModeController *)self etaCardController];
    [v6 updateContent];

    [(CarNavigationModeController *)self refreshCameraTypeAnimated:v4];
  }
}

- (void)setTrayExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(CarNavigationModeController *)self etaCardController];
  unsigned int v8 = [v7 isExpanded];

  if (v8 == v5)
  {
    [(CarNavigationModeController *)self _ppt_notityETATrayUpdateCompleted];
  }
  else
  {
    objc_initWeak(&location, self);
    int v9 = [(CarNavigationModeController *)self etaCardController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003C3B88;
    v10[3] = &unk_1012E6998;
    objc_copyWeak(&v11, &location);
    [v9 setExpanded:v5 animated:v4 completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_ppt_notityETATrayUpdateCompleted
{
}

- (void)endNavigation
{
}

- (void)refreshCameraTypeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CarNavigationModeController *)self chromeViewController];
  [v5 setNeedsUpdateMapInsets];

  BOOL v6 = [(CarNavigationModeController *)self carChromeViewController];
  uint64_t v7 = [v6 navigationDisplay];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C3CC8;
  v9[3] = &unk_1012E68D8;
  v9[4] = self;
  [v7 configureDisplay:v9 animated:v3];

  unsigned int v8 = [(CarNavigationModeController *)self etaCardController];
  [v8 updateContent];
}

- (void)_toggleCameraStyle
{
  BOOL v3 = [(CarNavigationModeController *)self cameraStyleManager];
  [v3 toggleCameraStyle];

  [(CarNavigationModeController *)self _captureUserToggledCameraStyle];
}

- (void)_captureCurrentNavigationModeState
{
  BOOL v3 = +[MNNavigationService sharedService];
  id v6 = [v3 arrivalInfo];

  unint64_t v4 = (unint64_t)[v6 arrivalState] - 1;
  if (v4 > 5) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_100F6F1E0[v4];
  }
  [(CarNavigationModeController *)self setNavigationModeState:v5];
}

- (void)_captureUserToggledCameraStyle
{
  int64_t v3 = [(CarNavigationModeController *)self cameraStyle];
  if (v3 == 1) {
    unsigned int v4 = 3051;
  }
  else {
    unsigned int v4 = 0;
  }
  if (v3 == 2) {
    uint64_t v5 = 3050;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [(CarNavigationModeController *)self chromeViewController];
  [v6 captureUserAction:v5];
}

- (BOOL)isSharingTrip
{
  v2 = +[MSPSharedTripService sharedInstance];
  int64_t v3 = [v2 receivers];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)upcomingWaypoints
{
  v2 = [(CarNavigationModeController *)self waypointController];
  int64_t v3 = [v2 displayedWaypoints];

  return v3;
}

- (id)sharingButtonTitle
{
  v2 = +[MSPSharedTripService sharedInstance];
  int64_t v3 = [v2 receivers];

  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      BOOL v4 = [v3 firstObject];
      uint64_t v5 = [v4 displayName];
      if ([v5 length])
      {
        id v6 = +[NSBundle mainBundle];
        uint64_t v7 = [v6 localizedStringForKey:@"CarPlay_ShareTripButton_OneContact" value:@"localized string not found" table:0];
        unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5);

        goto LABEL_8;
      }
    }
    BOOL v4 = +[NSBundle mainBundle];
    int v9 = [v4 localizedStringForKey:@"CarPlay_ShareTripButton" value:@"localized string not found" table:0];
    unsigned int v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, [v3 count]);
  }
  else
  {
    BOOL v4 = +[NSBundle mainBundle];
    unsigned int v8 = [v4 localizedStringForKey:@"[NavTray] Share ETA" value:@"localized string not found" table:0];
  }
LABEL_8:

  return v8;
}

- (id)contactSharingSuggestion
{
  v2 = [(CarNavigationModeController *)self currentRoute];
  int64_t v3 = [v2 shareETAWaypointContacts];

  if ([v3 count] == (id)1)
  {
    BOOL v4 = [v3 lastObject];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)etaCardSign:(id)a3 didSelectAction:(unint64_t)a4
{
  id v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v31 = 134217984;
    unint64_t v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "etaCardSign:didSelectAction: %ld", (uint8_t *)&v31, 0xCu);
  }

  switch(a4)
  {
    case 0uLL:
      uint64_t v7 = [(CarNavigationModeController *)self etaCardController];
      if ([v7 isExpanded]) {
        uint64_t v8 = 1038;
      }
      else {
        uint64_t v8 = 1039;
      }

      int v9 = [(CarNavigationModeController *)self chromeViewController];
      [v9 captureUserAction:v8 onTarget:1021];

      [(CarNavigationModeController *)self _toggleETACardAnimated:1];
      return;
    case 1uLL:
      v23 = [(CarNavigationModeController *)self chromeViewController];
      [v23 captureUserAction:3002 onTarget:1021];

      __int16 v10 = +[CarDisplayController sharedInstance];
      v24 = [v10 platformController];
      [v24 clearIfCurrentSessionIsKindOfClass:objc_opt_class()];

      goto LABEL_30;
    case 2uLL:
      if ([(GEOComposedRoute *)self->_currentRoute isEVRoute]) {
        uint64_t v11 = 1021;
      }
      else {
        uint64_t v11 = 1001;
      }
      unsigned int v12 = [(CarNavigationModeController *)self chromeViewController];
      [v12 captureUserAction:6096 onTarget:v11];

      __int16 v10 = +[MNNavigationService sharedService];
      [v10 stopNavigationWithReason:3];
      goto LABEL_30;
    case 3uLL:
      unsigned int v13 = +[MNNavigationService sharedService];
      int v14 = [v13 nextWaypoint];
      unsigned int v15 = [v14 shouldOfferAlternateChargersAtArrival];

      if (v15)
      {
        [(CarNavigationModeController *)self _sendOtherEVStationsRequest];
        return;
      }
      CFStringRef v27 = [(CarNavigationModeController *)self chromeViewController];
      [v27 captureUserAction:292 onTarget:1001];

      __int16 v10 = +[MNNavigationService sharedService];
      [v10 advanceToNextLeg];
      goto LABEL_30;
    case 4uLL:
      CFStringRef v16 = [(CarNavigationModeController *)self upcomingWaypoints];
      id v17 = [v16 count];

      id v18 = [(CarNavigationModeController *)self upcomingWaypoints];
      v19 = sub_1000AC254(v18, &stru_1012E7D68);
      id v20 = [v19 count];

      if ((unint64_t)v17 <= 1)
      {
        if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
          || (MapsFeature_IsEnabled_Maps420() & 1) != 0
          || MapsFeature_IsEnabled_Maps182())
        {
          int64_t v28 = [(CarNavigationModeController *)self chromeViewController];
          CFStringRef v29 = v28;
          uint64_t v30 = 6097;
        }
        else
        {
          int64_t v28 = [(CarNavigationModeController *)self chromeViewController];
          CFStringRef v29 = v28;
          uint64_t v30 = 9006;
        }
        [v28 captureUserAction:v30 onTarget:1021];

        __int16 v10 = +[CarChromeModeCoordinator sharedInstance];
        [v10 displayNavigationSearch];
LABEL_30:
      }
      else
      {
        if ((unint64_t)v20 <= 1) {
          uint64_t v21 = 6097;
        }
        else {
          uint64_t v21 = 6108;
        }
        unint64_t v22 = [(CarNavigationModeController *)self chromeViewController];
        [v22 captureUserAction:v21 onTarget:1021];

        [(CarNavigationModeController *)self setNavigationModeState:1];
      }
      return;
    case 5uLL:
      BOOL v25 = [(CarNavigationModeController *)self chromeViewController];
      [v25 captureUserAction:115 onTarget:1021];

      __int16 v10 = +[CarChromeModeCoordinator sharedInstance];
      [v10 displayIncidentReporting];
      goto LABEL_30;
    case 6uLL:
      v26 = [(CarNavigationModeController *)self chromeViewController];
      [v26 captureUserAction:9022 onTarget:1021];

      __int16 v10 = +[CarChromeModeCoordinator sharedInstance];
      [v10 displayTripSharing];
      goto LABEL_30;
    default:
      __int16 v10 = sub_100015DB4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v31 = 134217984;
        unint64_t v32 = a4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "etaCardContent delegate didn't handle action: %ld", (uint8_t *)&v31, 0xCu);
      }
      goto LABEL_30;
  }
}

- (void)_sendOtherEVStationsRequest
{
  v2 = +[MNNavigationService sharedService];
  int64_t v3 = [v2 arrivalInfo];

  BOOL v4 = [v3 destination];
  v15[0] = &__kCFBooleanTrue;
  v14[0] = @"SearchAlongRoute";
  v14[1] = @"SARImplicitRequestMUID";
  uint64_t v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 muid]);
  v14[2] = @"SAROtherEVStationRequest";
  v15[1] = v5;
  v15[2] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  uint64_t v7 = objc_alloc_init(SearchFieldItem);
  uint64_t v8 = +[CarDisplayController sharedInstance];
  id v9 = [v8 processSearchFieldItem:v7 searchInfo:0 userInfo:v6];

  __int16 v10 = sub_100015DB4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"SAROtherEVStationRequest"];
    int v12 = 138412290;
    unsigned int v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Tapped on other ev stations upon arriving at ev charging stations and muid: %@ is being sent in request.", (uint8_t *)&v12, 0xCu);
  }
}

- (NSString)arrivalTitle
{
  int64_t v3 = +[MNNavigationService sharedService];
  BOOL v4 = [v3 arrivalChargingStationInfo];

  uint64_t v5 = +[MNNavigationService sharedService];
  unsigned int v6 = [v5 isArrivedAtEVCharger];

  if (!v6)
  {
    switch([(CarNavigationModeController *)self navigationModeState])
    {
      case 3:
        int v12 = +[NSBundle mainBundle];
        uint64_t v8 = v12;
        CFStringRef v13 = @"Parking [Nav Tray Header]";
        goto LABEL_15;
      case 4:
        int v12 = +[NSBundle mainBundle];
        uint64_t v8 = v12;
        CFStringRef v13 = @"Parked [Nav Tray Header]";
        goto LABEL_15;
      case 5:
        int v12 = +[NSBundle mainBundle];
        uint64_t v8 = v12;
        CFStringRef v13 = @"Arriving [Nav Tray Header]";
        goto LABEL_15;
      case 6:
        int v12 = +[NSBundle mainBundle];
        uint64_t v8 = v12;
        CFStringRef v13 = @"Arrived [Nav Tray Header]";
LABEL_15:
        uint64_t v11 = [v12 localizedStringForKey:v13 value:@"localized string not found" table:0];
        goto LABEL_16;
      default:
        uint64_t v11 = 0;
        goto LABEL_17;
    }
  }
  uint64_t v7 = +[MNNavigationService sharedService];
  uint64_t v8 = [v7 activeNavTrayGuidanceEvent];

  [v4 chargingTime];
  if (v9 <= 0.0)
  {
    __int16 v10 = +[NSBundle mainBundle];
    int v14 = [v10 localizedStringForKey:@"Charged [Nav Tray Header Title]" value:@"localized string not found" table:0];
LABEL_9:
    uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v17);

    goto LABEL_10;
  }
  if (!v8)
  {
    __int16 v10 = +[NSBundle mainBundle];
    int v14 = [v10 localizedStringForKey:@"Charging [Nav Tray Header Title]" value:@"localized string not found" table:0];
    [v4 batteryPercentageAfterCharging];
    uint64_t v17 = (uint64_t)v15;
    goto LABEL_9;
  }
  __int16 v10 = [v8 title];
  uint64_t v11 = [v10 stringWithDefaultOptions];
LABEL_10:

LABEL_16:
LABEL_17:

  return (NSString *)v11;
}

- (NSString)arrivalSubtitle
{
  int64_t v3 = +[MNNavigationService sharedService];
  BOOL v4 = [v3 arrivalInfo];

  uint64_t v5 = [v4 destination];
  unsigned int v6 = +[MNNavigationService sharedService];
  uint64_t v7 = [v6 arrivalChargingStationInfo];

  uint64_t v8 = +[MNNavigationService sharedService];
  unsigned int v9 = [v8 isArrivedAtEVCharger];

  if (v9)
  {
    __int16 v10 = +[MNNavigationService sharedService];
    uint64_t v11 = [v10 activeNavTrayGuidanceEvent];

    [v7 chargingTime];
    if (v12 <= 0.0)
    {
      CFStringRef v13 = +[NSBundle mainBundle];
      CFStringRef v16 = [v13 localizedStringForKey:@"Charged [Nav Tray Header Subtitle]" value:@"localized string not found" table:0];
      uint64_t v17 = +[MNNavigationService sharedService];
      id v18 = [v17 stopAfterCharging];
      v19 = [v18 navDisplayName];
      int v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v19);
    }
    else
    {
      if (v11)
      {
        CFStringRef v13 = [v11 detail];
        int v14 = [v13 stringWithDefaultOptions];
LABEL_12:

        goto LABEL_13;
      }
      CFStringRef v13 = +[NSBundle mainBundle];
      CFStringRef v16 = [v13 localizedStringForKey:@"Charging [Nav Tray Header Subtitle]" value:@"localized string not found" table:0];
      [v7 chargingTime];
      uint64_t v17 = +[NSString _navigation_stringWithSeconds:v22 abbreviated:1];
      int v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v17);
    }

    goto LABEL_12;
  }
  int64_t v15 = [(CarNavigationModeController *)self navigationModeState];
  if ((unint64_t)(v15 - 5) < 2)
  {
    id v20 = +[MNNavigationService sharedService];
    uint64_t v21 = [v20 route];

    int v14 = [v21 arrivalInstructionStringForLegIndex:[v4 legIndex]];
  }
  else if ((unint64_t)(v15 - 3) > 1)
  {
    int v14 = 0;
  }
  else
  {
    int v14 = [v5 parkingDisplayName];
  }
LABEL_13:

  return (NSString *)v14;
}

- (void)waypointsOverviewControllerDidSelectAddWaypoint:(id)a3
{
  BOOL v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "waypointsOverviewControllerDidSelectAddWaypoint: user tapped search within waypoints overview", v7, 2u);
  }

  uint64_t v5 = [(CarNavigationModeController *)self chromeViewController];
  [v5 captureUserAction:6097 onTarget:1025];

  unsigned int v6 = +[CarChromeModeCoordinator sharedInstance];
  [v6 displayNavigationSearch];
}

- (void)waypointsOverviewController:(id)a3 didSelectWaypoint:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2048;
    unint64_t v14 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "waypointsOverviewController:didSelectWaypoint:atIndex, will remove waypoint: %@, index: %ld", (uint8_t *)&v11, 0x16u);
  }

  unsigned int v9 = [(CarNavigationModeController *)self waypointController];
  [v9 removeWaypointAt:a5];

  __int16 v10 = [(CarNavigationModeController *)self chromeViewController];
  [v10 captureUserAction:280 onTarget:1025];
}

- (void)_updateShareButtonContentAndVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  [(CarETACardViewController *)self->_etaCardController updateContent];
  etaCardController = self->_etaCardController;
  uint64_t v6 = [(CarNavigationModeController *)self _shouldShowShareButton] ^ 1;

  [(CarETACardViewController *)etaCardController setSharingButtonHidden:v6 animated:v3];
}

- (void)_updateShareETADisclosureAutoDismissTimer
{
  GEOConfigGetDouble();
  double v4 = v3;
  objc_initWeak(&location, self);
  id v5 = &_dispatch_main_q;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  unsigned int v9 = sub_1003C4F88;
  __int16 v10 = &unk_1012E7638;
  objc_copyWeak(&v11, &location);
  uint64_t v6 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v7 block:v4];
  -[CarNavigationModeController setShareEtaDisclosureAutoDismissTimer:](self, "setShareEtaDisclosureAutoDismissTimer:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldShowShareButton
{
  if (!MSPSharedTripSharingAvailable() || self->_forceShareButtonHidden) {
    return 0;
  }
  id v5 = +[MSPSharedTripService sharedInstance];
  uint64_t v6 = [v5 receivers];
  if ([v6 count])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v7 = [(CarNavigationModeController *)self shareEtaDisclosureAutoDismissTimer];
    BOOL v3 = v7 != 0;
  }
  return v3;
}

- (void)_setupGuidanceDisplays:(BOOL)a3
{
  id v13 = [(CarNavigationModeController *)self guidanceObserver];
  double v4 = [(CarNavigationModeController *)self guidanceCardController];
  [v13 addOutlet:v4 forOwner:self];

  id v5 = [(CarNavigationModeController *)self etaCardController];
  [v13 addOutlet:v5 forOwner:self];

  uint64_t v6 = [(CarNavigationModeController *)self guidanceCardController];
  unsigned __int8 v7 = [v6 isViewLoaded];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(CarNavigationModeController *)self guidanceCardController];
    unsigned int v9 = [v8 view];

    __int16 v10 = [(CarNavigationModeController *)self chromeViewController];
    [v10 updateCardsForContext:self animated:0];
  }
  id v11 = [(CarNavigationModeController *)self guidanceCardController];
  [v13 repeatAllUpdatesForOutlet:v11];

  id v12 = [(CarNavigationModeController *)self etaCardController];
  [v13 repeatAllUpdatesForOutlet:v12];
}

- (void)_toggleETACardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CarNavigationModeController *)self isTogglingETACard])
  {
    [(CarNavigationModeController *)self setIsTogglingETACard:1];
    uint64_t v8 = [(CarNavigationModeController *)self etaCardController];
    unsigned int v9 = [v8 isExpanded];

    objc_initWeak(&location, self);
    uint64_t v10 = v9 ^ 1;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1003C56A4;
    v33[3] = &unk_1012E7D90;
    char v35 = v9 ^ 1;
    objc_copyWeak(&v34, &location);
    id v11 = objc_retainBlock(v33);
    id v12 = [(CarNavigationModeController *)self desiredCards];
    unsigned __int8 v13 = [v12 containsObject:@"ETA"];

    if (v13)
    {
      unint64_t v14 = sub_100015DB4();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if ((v9 & 1) == 0)
      {
        if (v15)
        {
          v23 = @"NO";
          if (v3) {
            v23 = @"YES";
          }
          v24 = v23;
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = v24;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "_toggleETACardAnimated:%@, Will configure card then expand tray", buf, 0xCu);
        }
        v19 = [(CarNavigationModeController *)self chromeViewController];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1003C5780;
        v27[3] = &unk_1012E7E08;
        uint64_t v21 = &v29;
        objc_copyWeak(&v29, &location);
        BOOL v30 = v3;
        int64_t v28 = v11;
        [v19 updateCardsForContext:self animated:0 completion:v27];
        double v22 = (id *)&v28;
        goto LABEL_21;
      }
      if (v15)
      {
        CFStringRef v16 = @"NO";
        if (v3) {
          CFStringRef v16 = @"YES";
        }
        uint64_t v17 = v16;
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "_toggleETACardAnimated:%@, Will collapse tray then configure card", buf, 0xCu);
      }
      id v18 = [(CarNavigationModeController *)self guidanceCardController];
      [v18 temporarilyHideJunctionViewForSeconds:0 animated:12.0];

      v19 = [(CarNavigationModeController *)self etaCardController];
      id v20 = v25;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1003C598C;
      v25[3] = &unk_1012E7DB8;
      uint64_t v21 = &v26;
      objc_copyWeak(&v26, &location);
      v25[4] = v11;
      [v19 setExpanded:0 animated:v3 completion:v25];
    }
    else
    {
      v19 = [(CarNavigationModeController *)self etaCardController];
      id v20 = v31;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1003C571C;
      v31[3] = &unk_1012E7DB8;
      uint64_t v21 = &v32;
      objc_copyWeak(&v32, &location);
      v31[4] = v11;
      [v19 setExpanded:v10 animated:v3 completion:v31];
    }
    double v22 = (id *)(v20 + 4);
LABEL_21:

    objc_destroyWeak(v21);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
    return;
  }
  id v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    unsigned __int8 v7 = v6;
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_toggleETACardAnimated:%@, currently in the middle of expanding tray animation", buf, 0xCu);
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  [(CarNavigationModeController *)self setCurrentRoute:a4];
  [(CarNavigationModeController *)self _captureCurrentNavigationModeState];
  id v6 = [(CarNavigationModeController *)self etaCardController];
  [v6 updateContent];
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  [(CarNavigationModeController *)self _captureCurrentNavigationModeState];
  id v5 = [(CarNavigationModeController *)self etaCardController];
  [v5 updateContent];
}

- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  id v4 = [(CarNavigationModeController *)self etaCardController];
  [v4 updateContent];
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  -[CarNavigationModeController setNavigationModeState:](self, "setNavigationModeState:", 0, a4, a5, a6);
  id v7 = [(CarNavigationModeController *)self etaCardController];
  [v7 updateContent];
}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v5 = [(CarNavigationModeController *)self etaCardController];
  [v5 updateContent];
}

- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id v4 = [(CarNavigationModeController *)self etaCardController];
  [v4 updateContent];
}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  if (!a4) {
    [a3 stopCurrentGuidancePrompt];
  }
  id v5 = [(CarNavigationModeController *)self etaCardController];
  [v5 updateContent];
}

- (void)navigationService:(id)a3 didChangeVoiceGuidanceLevel:(unint64_t)a4
{
  id v4 = [(CarNavigationModeController *)self etaCardController];
  [v4 updateContent];
}

- (void)navigationService:(id)a3 didUpdateNavTrayGuidance:(id)a4
{
  id v4 = [(CarNavigationModeController *)self etaCardController];
  [v4 updateContent];
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  if (MNNavigationServiceStateChangedToNavigating())
  {
    id v6 = [v7 route];
    [(CarNavigationModeController *)self setCurrentRoute:v6];
  }
}

- (void)navigationService:(id)a3 showJunctionView:(id)a4
{
  self->_forceShareButtonHidden = 1;
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 1, a4);

  [(CarNavigationModeController *)self setShowingJunctionView:1];
}

- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4
{
  self->_forceShareButtonHidden = 0;
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 1, a4);

  [(CarNavigationModeController *)self setShowingJunctionView:0];
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v4 = [(CarNavigationModeController *)self etaCardController];
  [v4 updateContent];
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unsigned int v9 = [[CarTrafficAlertCardViewController alloc] initWithDelegate:self trafficAlert:v8 response:v7];

  [(CarNavigationModeController *)self setTrafficAlertCardController:v9];
  uint64_t v10 = [(CarNavigationModeController *)self carChromeViewController];
  id v11 = [v10 navigationDisplay];
  [v11 setTrafficAlert:v8];

  id v12 = [(CarNavigationModeController *)self chromeViewController];
  [v12 updateCardsForContext:self animated:1];
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v5 = a4;
  invalidatedAlertIds = self->_invalidatedAlertIds;
  id v14 = v5;
  id v7 = [v5 alertID];
  LOBYTE(invalidatedAlertIds) = [(NSMutableSet *)invalidatedAlertIds containsObject:v7];

  if ((invalidatedAlertIds & 1) == 0)
  {
    id v8 = [(CarNavigationModeController *)self trafficAlertCardController];

    if (!v8)
    {
      unsigned int v9 = [[CarTrafficAlertCardViewController alloc] initWithDelegate:self trafficAlert:v14 response:0];
      [(CarNavigationModeController *)self setTrafficAlertCardController:v9];

      uint64_t v10 = [(CarNavigationModeController *)self chromeViewController];
      [v10 updateCardsForContext:self animated:1];
    }
    id v11 = [(CarNavigationModeController *)self trafficAlertCardController];
    [v11 updateFromTrafficAlert:v14];

    id v12 = [(CarNavigationModeController *)self carChromeViewController];
    unsigned __int8 v13 = [v12 navigationDisplay];
    [v13 setTrafficAlert:v14];
  }
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  invalidatedAlertIds = self->_invalidatedAlertIds;
  id v6 = [a4 alertID:a3];
  [(NSMutableSet *)invalidatedAlertIds addObject:v6];

  id v7 = [(CarNavigationModeController *)self trafficAlertCardController];

  if (v7)
  {
    [(CarNavigationModeController *)self setTrafficAlertCardController:0];
    id v8 = [(CarNavigationModeController *)self chromeViewController];
    [v8 updateCardsForContext:self animated:1];
  }
  id v10 = [(CarNavigationModeController *)self carChromeViewController];
  unsigned int v9 = [v10 navigationDisplay];
  [v9 setTrafficAlert:0];
}

- (void)trafficAlertCardViewControllerDismiss:(id)a3
{
  invalidatedAlertIds = self->_invalidatedAlertIds;
  id v5 = a3;
  id v6 = [v5 trafficAlert];
  id v7 = [v6 alertID];
  [(NSMutableSet *)invalidatedAlertIds addObject:v7];

  CFStringRef v15 = @"kCarTrafficAlertIdKey";
  id v8 = [v5 trafficAlert];

  unsigned int v9 = [v8 alertID];
  CFStringRef v16 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 postNotificationName:@"CarTrafficAlertDidChangeVisibility" object:0 userInfo:v10];

  [(CarNavigationModeController *)self setTrafficAlertCardController:0];
  id v12 = [(CarNavigationModeController *)self carChromeViewController];
  unsigned __int8 v13 = [v12 navigationDisplay];
  [v13 setTrafficAlert:0];

  id v14 = [(CarNavigationModeController *)self chromeViewController];
  [v14 updateCardsForContext:self animated:1];
}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(CarNavigationModeController *)self _shouldShowShareButton];
  id v7 = [v5 count];

  if (v7)
  {
    id v8 = [(CarNavigationModeController *)self etaCardController];
    unsigned int v9 = [v8 isShowingShareETASuggestion];

    if (v9) {
      [(CarNavigationModeController *)self _updateShareETADisclosureAutoDismissTimer];
    }
    else {
      [(CarNavigationModeController *)self setShareEtaDisclosureAutoDismissTimer:0];
    }
  }
  [(CarNavigationModeController *)self _updateShareButtonContentAndVisibility:v6 ^ 1];
  id v10 = +[UIApplication _maps_keyMapsSceneDelegate];
  [v10 setNeedsUserActivityUpdate];
}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
}

- (void)_loadCompressionTestCardWithHeight:(double)a3 priority:(float)a4
{
  id v7 = objc_alloc_init(CarCompressionTestCardViewController);
  [(CarNavigationModeController *)self setCompressionTestCardController:v7];

  id v8 = [(CarNavigationModeController *)self compressionTestCardController];
  [v8 setDelegate:self];

  if (a3 >= 0.0)
  {
    unsigned int v9 = [(CarNavigationModeController *)self compressionTestCardController];
    [v9 setSpacerHeight:a3];
  }
  if (a4 >= 0.0)
  {
    id v10 = [(CarNavigationModeController *)self compressionTestCardController];
    *(float *)&double v11 = a4;
    [v10 setSpacerPriority:v11];
  }
  id v12 = [(CarNavigationModeController *)self chromeViewController];
  [v12 updateCardsForContext:self animated:1];
}

- (void)compressionTestCard:(id)a3 reloadWithSpacerHeight:(double)a4 priority:(float)a5
{
  [(CarNavigationModeController *)self setCompressionTestCardController:0];
  id v8 = [(CarNavigationModeController *)self chromeViewController];
  [v8 updateCardsForContext:self animated:1];

  dispatch_time_t v9 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003C6518;
  block[3] = &unk_1012E7E30;
  block[4] = self;
  *(double *)&block[5] = a4;
  float v11 = a5;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)compressionTestCardRequestsDismiss:(id)a3
{
  [(CarNavigationModeController *)self setCompressionTestCardController:0];
  id v4 = [(CarNavigationModeController *)self chromeViewController];
  [v4 updateCardsForContext:self animated:1];
}

- (NSArray)preferredCarFocusEnvironments
{
  BOOL v3 = [(CarNavigationModeController *)self trafficAlertCardController];

  if (v3)
  {
    id v4 = [(CarNavigationModeController *)self trafficAlertCardController];
    id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    v11[0] = v5;
    unsigned int v6 = [(CarNavigationModeController *)self etaCardController];
    id v7 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v6];
    v11[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v11 count:2];
  }
  else
  {
    id v4 = [(CarNavigationModeController *)self etaCardController];
    id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    id v10 = v5;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }

  return (NSArray *)v8;
}

- (NSArray)carFocusOrderSequences
{
  id v14 = [(CarNavigationModeController *)self chromeViewController];
  BOOL v3 = [v14 itemRepresentingStatusBanner];
  v15[0] = v3;
  id v4 = [(CarNavigationModeController *)self chromeViewController];
  id v5 = [v4 itemRepresentingOverlays];
  v15[1] = v5;
  unsigned int v6 = [(CarNavigationModeController *)self chromeViewController];
  id v7 = [v6 itemRepresentingAlternateRoutes];
  v15[2] = v7;
  id v8 = [(CarNavigationModeController *)self chromeViewController];
  dispatch_time_t v9 = [v8 itemRepresentingMapControls];
  void v15[3] = v9;
  id v10 = +[NSArray arrayWithObjects:v15 count:4];
  float v11 = +[CarFocusOrderSequence sequenceWithItems:v10 options:5];
  CFStringRef v16 = v11;
  id v12 = +[NSArray arrayWithObjects:&v16 count:1];

  return (NSArray *)v12;
}

- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4
{
  id v4 = [(CarNavigationModeController *)self carChromeViewController];
  [v4 setNeedsUpdateComponent:@"mapcontrols" animated:1];
}

- (void)chromeNavigationDisplay:(id)a3 userDidTapMap:(id)a4 atPoint:(CGPoint)a5
{
  id v5 = [(CarNavigationModeController *)self guidanceCardController];
  [v5 temporarilyHideJunctionViewForSeconds:0 animated:12.0];
}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeCenterConsoleCameraStyle:(int64_t)a4
{
}

- (int)currentUsageTarget
{
  return 1001;
}

- (void)carShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification:(id)a3
{
  id v4 = [(CarNavigationModeController *)self carChromeViewController];
  [v4 updateCardsForContext:self animated:1 completion:0];

  id v5 = [(CarNavigationModeController *)self carChromeViewController];
  [v5 updateComponentsIfNeeded];
}

- (void)_maneuverBannerViewEVStationsNotification:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003C6A34;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
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

- (int64_t)navigationModeState
{
  return self->_navigationModeState;
}

- (void)setGuidanceCardController:(id)a3
{
}

- (void)setEtaCardController:(id)a3
{
}

- (void)setWaypointsOverviewCardController:(id)a3
{
}

- (CarTrafficAlertCardViewController)trafficAlertCardController
{
  return self->_trafficAlertCardController;
}

- (CarCompressionTestCardViewController)compressionTestCardController
{
  return self->_compressionTestCardController;
}

- (void)setCompressionTestCardController:(id)a3
{
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (BOOL)isTogglingETACard
{
  return self->_isTogglingETACard;
}

- (void)setIsTogglingETACard:(BOOL)a3
{
  self->_isTogglingETACard = a3;
}

- (BOOL)isShowingJunctionView
{
  return self->_showingJunctionView;
}

- (void)setAudioPreferences:(id)a3
{
}

- (CarChromeNavigationCameraStyleManager)cameraStyleManager
{
  return self->_cameraStyleManager;
}

- (void)setCameraStyleManager:(id)a3
{
}

- (GCDTimer)shareEtaDisclosureAutoDismissTimer
{
  return self->_shareEtaDisclosureAutoDismissTimer;
}

- (void)setShareEtaDisclosureAutoDismissTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareEtaDisclosureAutoDismissTimer, 0);
  objc_storeStrong((id *)&self->_cameraStyleManager, 0);
  objc_storeStrong((id *)&self->_audioPreferences, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_compressionTestCardController, 0);
  objc_storeStrong((id *)&self->_trafficAlertCardController, 0);
  objc_storeStrong((id *)&self->_waypointsOverviewCardController, 0);
  objc_storeStrong((id *)&self->_etaCardController, 0);
  objc_storeStrong((id *)&self->_guidanceCardController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_previousGuidanceCardSignAudioSetting, 0);

  objc_storeStrong((id *)&self->_invalidatedAlertIds, 0);
}

@end