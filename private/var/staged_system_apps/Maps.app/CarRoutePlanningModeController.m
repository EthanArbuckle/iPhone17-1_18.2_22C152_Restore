@interface CarRoutePlanningModeController
- (BOOL)_goButtonShouldBeEnabled;
- (BOOL)_goButtonShouldBeHidden;
- (BOOL)_isAuthorizedForPreciseLocation;
- (BOOL)_isTurnByTurnSupportedForCurrentRoute;
- (BOOL)_shouldShowOnboardingHintForVehicle:(id)a3;
- (BOOL)isLoading;
- (BOOL)isOriginalDestination;
- (BOOL)navigationAidedDrivingEnabled;
- (BOOL)shouldAllowKnobFocusMovement;
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsMapView;
- (BOOL)showsNavigationBar;
- (BOOL)supportsAlternateRouteSelection;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (BOOL)wantsNavigationDisplay;
- (BOOL)zoomInButtonPressed;
- (BOOL)zoomOutButtonPressed;
- (BOOL)zoomToDestination;
- (CarAdvisoryDetailCardViewController)carAdvisoryDetailCardViewController;
- (CarAdvisoryListCardViewController)carAdvisoryListCardViewController;
- (CarPlaceCardCardViewController)placeCard;
- (CarRoutePlanningAdvisoryLabel)advisoryLabel;
- (CarRoutePlanningModeController)initWithAddressBookAddress:(id)a3;
- (CarRoutePlanningModeController)initWithAddressBookAddress:(id)a3 overridingTitle:(id)a4;
- (CarRoutePlanningModeController)initWithDestination:(id)a3 userInfo:(id)a4;
- (CarRoutePlanningModeController)initWithExistingRouteLoading;
- (CarRoutePlanningModeController)initWithExistingSearchSession;
- (CarRoutePlanningModeController)initWithHistoryRoute:(id)a3;
- (CarRoutePlanningModeController)initWithSearchResult:(id)a3 userInfo:(id)a4;
- (CarRoutePlanningModeController)initWithSearchResults:(id)a3 selectedIndex:(unint64_t)a4 userInfo:(id)a5;
- (CarRoutePlanningModeController)initWithSearchSession:(id)a3;
- (CarRoutePlanningModeDelegate)delegate;
- (ChromeViewController)chromeViewController;
- (GEOComposedRoute)currentRoute;
- (NSArray)carFocusOrderSequences;
- (NSArray)drivingRoutes;
- (NSArray)fullSearchResults;
- (NSArray)preferredCarFocusEnvironments;
- (NSDictionary)userInfo;
- (RouteCollection)drivingRouteCollection;
- (RoutePlanningSession)routePlanningSession;
- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC;
- (id)_clickableAdvisoryDescriptionForRoute:(id)a3;
- (id)_preciseLocationOffAdvisory;
- (id)_turnByTurnNotAvailableAdvisory;
- (id)automaticSharingContacts;
- (id)desiredCards;
- (id)etaForCurrentRoute;
- (id)initForResumeRoute:(id)a3;
- (id)personalizedItemManager;
- (id)personalizedItemSources;
- (id)routeAnnotationsController;
- (id)routeMainDescriptionText;
- (id)searchPinsManager;
- (id)visuallySelectedItem;
- (int)backButtonUsageActionToMode:(id)a3;
- (int)currentUsageTarget;
- (int64_t)_interruptionKindForCurrentRoute;
- (int64_t)autohideBehavior;
- (int64_t)state;
- (unint64_t)selectedRouteIndex;
- (void)_centerOnRouteOrPinsAnimated:(BOOL)a3;
- (void)_chromeViewControllerDidUpdateMapInsets:(id)a3;
- (void)_clearSteppingRouteParameters;
- (void)_commonInit;
- (void)_dismissPlaceCardAlertControllerIfNeeded;
- (void)_hideAdvisories;
- (void)_offerVehicleDisambiguationIfNeeded;
- (void)_presentEVOnboardingHintForVehicle:(id)a3;
- (void)_presentInterruptionForError:(id)a3;
- (void)_recenterOnRouteAnimated:(BOOL)a3;
- (void)_showPinsAnimated:(BOOL)a3;
- (void)_start;
- (void)_toggleZoom:(id)a3;
- (void)_updateAnnotationsForLoadedRoute;
- (void)_updateElements;
- (void)_updateLoading;
- (void)_updateRouteAdvisories;
- (void)_updateSelectedRouteIndex:(unint64_t)a3;
- (void)_updateTurnByTurnSupport;
- (void)_updateZoomButtonContent;
- (void)_updateZoomButtonContentAndVisibilityWithMapRect:(id)a3;
- (void)_updatedExternalDevice:(id)a3;
- (void)_vehicleOnboardingFinished;
- (void)_virtualGarageDidUpdateUnpairedVehicles:(id)a3;
- (void)_zoomIn;
- (void)_zoomOut;
- (void)advisoryListCardDidSelectAdvisoryItem:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)chromeDidEndConfiguringCards:(id)a3;
- (void)chromeDidStartConfiguringCards:(id)a3;
- (void)clickabilityChanged;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)configureFocusContainerGuideController:(id)a3;
- (void)dealloc;
- (void)displayAdvisories;
- (void)handleHardwareBackButtonPressed;
- (void)layoutForUnobscuredBoundsChange;
- (void)modeWillPop;
- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5;
- (void)placeCard:(id)a3 didPresentAlert:(id)a4;
- (void)placeCard:(id)a3 wantsToPresentEVAvailability:(id)a4;
- (void)placeCardDidDismissAlert:(id)a3;
- (void)placeCardDidSelectCall:(id)a3;
- (void)placeCardDidSelectGo:(id)a3;
- (void)placeCardDidSelectHandoff:(id)a3;
- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5;
- (void)pptTestEndNavigation;
- (void)pptTestStartNavigation;
- (void)pptTestTransitionBetweenFullAndLightGuidance;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4;
- (void)setAdvisoryLabel:(id)a3;
- (void)setCarAdvisoryDetailCardViewController:(id)a3;
- (void)setCarAdvisoryListCardViewController:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvChargingAvailabilityVC:(id)a3;
- (void)setFullSearchResults:(id)a3;
- (void)setIsOriginalDestination:(BOOL)a3;
- (void)setNavigationAidedDrivingEnabled:(BOOL)a3;
- (void)setPlaceCard:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)setSearchResults:(id)a3 selectedIndex:(unint64_t)a4;
- (void)setSearchSession:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setZoomToDestination:(BOOL)a3;
- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4;
@end

@implementation CarRoutePlanningModeController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(CarRoutePlanningModeController *)self routePlanningSession];
  [v4 removeObserver:self];

  v5 = +[CarDisplayController sharedInstance];
  v6 = [v5 platformController];
  [v6 removeObserver:self];

  v7 = [(CarRoutePlanningModeController *)self personalizedItemManager];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)CarRoutePlanningModeController;
  [(CarRoutePlanningModeController *)&v8 dealloc];
}

- (CarRoutePlanningModeController)initWithDestination:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  v10 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  objc_opt_class();
  id v11 = v9;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13
    && ([v13 historyEntry],
        v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 conformsToProtocol:v10],
        v14,
        v15))
  {
    id v16 = v11;
  }
  else
  {
    id v16 = 0;
  }

  if (v16)
  {
    v17 = [v16 historyEntry];
    v18 = [(CarRoutePlanningModeController *)self initWithHistoryRoute:v17];
    self = v18;
    v19 = (MapsSuggestionsEntry *)v11;
LABEL_28:
    v20 = v18;
    goto LABEL_29;
  }
  v17 = +[SearchResult carSearchResultFromDestination:v11];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&self->_originalItem, a3);
    }
    if (v17)
    {
      v22 = v17;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [v11 homeAddress];
      }
      else
      {
        objc_opt_class();
        v19 = (MapsSuggestionsEntry *)v11;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_23:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [(CarRoutePlanningModeController *)self initWithAddressBookAddress:v19];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v20 = 0;
              goto LABEL_29;
            }
            v23 = [(CarRoutePlanningModeController *)self initWithSearchResult:v19 userInfo:v8];
          }
          v18 = v23;
          self = v18;
          goto LABEL_28;
        }
        v22 = [v11 workAddress];
      }
    }
    v19 = v22;

    goto LABEL_23;
  }
  v19 = (MapsSuggestionsEntry *)v11;
  if ([(MapsSuggestionsEntry *)v19 type] != (id)11)
  {
    originalEntry = self->_originalEntry;
    self->_originalEntry = v19;

    goto LABEL_14;
  }
  self = (CarRoutePlanningModeController *)[(CarRoutePlanningModeController *)self initForResumeRoute:v19];

  v20 = self;
LABEL_29:

  return v20;
}

- (CarRoutePlanningModeController)initWithSearchSession:(id)a3
{
  id v4 = a3;
  v5 = [(CarRoutePlanningModeController *)self init];
  if (v5)
  {
    v6 = [v4 currentResults];
    [(CarRoutePlanningModeController *)v5 setFullSearchResults:v6];

    [(CarRoutePlanningModeController *)v5 setSearchSession:v4];
    [(CarRoutePlanningModeController *)v5 _commonInit];
  }

  return v5;
}

- (CarRoutePlanningModeController)initWithExistingSearchSession
{
  v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 searchSession];

  if (v4)
  {
    self = [(CarRoutePlanningModeController *)self initWithSearchSession:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CarRoutePlanningModeController)initWithSearchResults:(id)a3 selectedIndex:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(CarRoutePlanningModeController *)self init];
  id v11 = v10;
  if (v10)
  {
    [(CarRoutePlanningModeController *)v10 setFullSearchResults:v8];
    [(CarRoutePlanningModeController *)v11 setUserInfo:v9];
    [(CarRoutePlanningModeController *)v11 setSearchResults:v8 selectedIndex:a4];
    [(CarRoutePlanningModeController *)v11 _commonInit];
  }

  return v11;
}

- (CarRoutePlanningModeController)initWithSearchResult:(id)a3 userInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v11 count:1];

  id v9 = -[CarRoutePlanningModeController initWithSearchResults:selectedIndex:userInfo:](self, "initWithSearchResults:selectedIndex:userInfo:", v8, 0, v6, v11);
  return v9;
}

- (CarRoutePlanningModeController)initWithExistingRouteLoading
{
  v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 platformController];
  v5 = [v4 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(CarRoutePlanningModeController *)self init];
    id v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_routePlanningSession, v6);
      [(RoutePlanningSession *)v9->_routePlanningSession addObserver:v9];
      v10 = [[CarExistingWaypointsController alloc] initWithRoutePlanningSession:v9->_routePlanningSession];
      waypointsController = v9->_waypointsController;
      v9->_waypointsController = &v10->super;

      [(CarRoutePlanningModeController *)v9 _commonInit];
      [(CarRoutePlanningModeController *)v9 _updateElements];
    }
    self = v9;
    v12 = self;
  }
  else
  {
    id v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315650;
      v18 = "-[CarRoutePlanningModeController initWithExistingRouteLoading]";
      __int16 v19 = 2080;
      v20 = "CarRoutePlanningModeController.m";
      __int16 v21 = 1024;
      int v22 = 319;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v17, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unsigned int v15 = +[NSThread callStackSymbols];
        int v17 = 138412290;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
      }
    }
    v12 = 0;
  }

  return v12;
}

- (CarRoutePlanningModeController)initWithHistoryRoute:(id)a3
{
  id v4 = a3;
  v5 = [(CarRoutePlanningModeController *)self init];
  if (v5)
  {
    id v6 = [[CarHistoryRouteWaypointsController alloc] initWithHistoryItem:v4];
    waypointsController = v5->_waypointsController;
    v5->_waypointsController = &v6->super;

    [(CarRoutePlanningModeController *)v5 _commonInit];
  }

  return v5;
}

- (id)initForResumeRoute:(id)a3
{
  id v4 = a3;
  v5 = [(CarRoutePlanningModeController *)self init];
  if (v5)
  {
    id v6 = [[CarResumeRouteWaypointsController alloc] initWithEntry:v4];
    waypointsController = v5->_waypointsController;
    v5->_waypointsController = &v6->super;

    [(CarRoutePlanningModeController *)v5 _commonInit];
  }

  return v5;
}

- (CarRoutePlanningModeController)initWithAddressBookAddress:(id)a3
{
  return [(CarRoutePlanningModeController *)self initWithAddressBookAddress:a3 overridingTitle:0];
}

- (CarRoutePlanningModeController)initWithAddressBookAddress:(id)a3 overridingTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CarRoutePlanningModeController *)self init];
  if (v8)
  {
    id v9 = [[CarAddressWaypointsController alloc] initWithAddress:v6 overridingTitle:v7];
    waypointsController = v8->_waypointsController;
    v8->_waypointsController = &v9->super;

    [(CarRoutePlanningModeController *)v8 _commonInit];
  }

  return v8;
}

- (void)_commonInit
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  v5 = +[MapsExternalDevice sharedInstance];
  [v4 addObserver:self selector:"_updatedExternalDevice:" name:@"MapsExternalDeviceUpdated" object:v5];

  id v6 = [(CarRoutePlanningModeController *)self fullSearchResults];
  if (v6)
  {
  }
  else
  {
    id v7 = [(CarWaypointsController *)self->_waypointsController destinationSearchResultIfAvailable];

    if (v7)
    {
      id v8 = [(CarWaypointsController *)self->_waypointsController destinationSearchResultIfAvailable];
      __int16 v21 = v8;
      id v9 = +[NSArray arrayWithObjects:&v21 count:1];
      [(CarRoutePlanningModeController *)self setFullSearchResults:v9];
    }
  }
  v10 = objc_alloc_init(CarAdvisoryDetailCardViewController);
  carAdvisoryDetailCardViewController = self->_carAdvisoryDetailCardViewController;
  self->_carAdvisoryDetailCardViewController = v10;

  v12 = [CarAdvisoryListCardViewController alloc];
  id v13 = [(CarRoutePlanningModeController *)self currentRoute];
  v14 = [(CarAdvisoryListCardViewController *)v12 initWithRoute:v13 delegate:self];
  carAdvisoryListCardViewController = self->_carAdvisoryListCardViewController;
  self->_carAdvisoryListCardViewController = v14;

  self->_state = 0;
  [(CarRoutePlanningModeController *)self _updateLoading];
  if (MapsFeature_IsEnabled_EVRouting())
  {
    if (IsEVRoutingSupported())
    {
      id v16 = +[VGVirtualGarageService sharedService];
      [v16 registerObserver:self];

      objc_initWeak(&location, self);
      int v17 = +[VGVirtualGarageService sharedService];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100584D98;
      v18[3] = &unk_1012E6E78;
      objc_copyWeak(&v19, &location);
      [v17 virtualGarageGetListOfUnpairedVehiclesWithReply:v18];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)isLoading
{
  v3 = [(CarRoutePlanningModeController *)self routePlanningSession];
  if (v3)
  {
    id v4 = [(CarRoutePlanningModeController *)self routePlanningSession];
    v5 = [v4 routeCollectionResultForTransportType:1];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setFullSearchResults:(id)a3
{
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_fullSearchResults, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_fullSearchResults, a3);
    v5 = [(NSArray *)self->_fullSearchResults firstObject];
    BOOL v6 = [(CarRoutePlanningModeController *)self placeCard];
    [v6 setSearchResult:v5];

    id v7 = [(CarRoutePlanningModeController *)self chromeViewController];
    [v7 updateCardsForContext:self animated:0];
  }
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 0;
}

- (BOOL)supportsAlternateRouteSelection
{
  return 1;
}

- (BOOL)wantsNavigationDisplay
{
  return 0;
}

- (id)visuallySelectedItem
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(CarWaypointsController *)self->_waypointsController visuallySelectedItem];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)configureFocusContainerGuideController:(id)a3
{
  id v3 = a3;
  id v5 = +[MapsExternalDevice sharedInstance];
  if ([v5 rightHandDrive]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 9;
  }
  [v3 setActiveEdges:v4];
}

- (void)modeWillPop
{
  id v3 = [(CarRoutePlanningModeController *)self routePlanningSession];

  if (v3)
  {
    id v6 = +[CarDisplayController sharedInstance];
    uint64_t v4 = [v6 platformController];
    id v5 = [(CarRoutePlanningModeController *)self routePlanningSession];
    [v4 clearIfCurrentSession:v5];
  }
}

- (void)layoutForUnobscuredBoundsChange
{
  BOOL v3 = +[UIView _maps_shouldAdoptImplicitAnimationParameters];

  [(CarRoutePlanningModeController *)self _centerOnRouteOrPinsAnimated:v3];
}

- (id)personalizedItemSources
{
  BOOL v3 = [(CarRoutePlanningModeController *)self chromeViewController];
  uint64_t v4 = [v3 searchPinsManager];

  if (v4)
  {
    id v5 = [(CarRoutePlanningModeController *)self chromeViewController];
    id v6 = [v5 searchPinsManager];
    id v7 = [v6 routeStartEndItemSource];
    v10 = v7;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)desiredCards
{
  CFStringRef v4 = @"primary";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([(CarRoutePlanningModeController *)self state])
  {
    case 0:
      if ([v7 isEqualToString:@"primary"])
      {
        id v8 = [(CarRoutePlanningModeController *)self fullSearchResults];
        id v9 = [v8 firstObject];
        v10 = [v9 name];
        [v6 setTitle:v10];

        id v11 = [(CarRoutePlanningModeController *)self placeCard];
        [v6 setTitleNumberOfLines:[v11 titleNumberOfLines]];

        [v6 setAccessory:1];
        memset(v81, 0, sizeof(v81));
        v71[0] = xmmword_100F6F1C0;
        v71[1] = xmmword_100F67600;
        uint64_t v72 = 3;
        uint64_t v73 = 1148846080;
        uint64_t v74 = 2;
        int v75 = 1148846080;
        uint64_t v76 = 0;
        uint64_t v77 = 0;
        __asm { FMOV            V0.2D, #8.0 }
        long long v78 = _Q0;
        long long v79 = _Q0;
        char v80 = 1;
        uint64_t v82 = 8;
        char v83 = 0;
        if (v6) {
          [v6 setLayout:v71];
        }
        int v17 = [(CarRoutePlanningModeController *)self placeCard];
        [v6 setContent:v17];

        [(CarRoutePlanningModeController *)self _updateRouteAdvisories];
      }
      break;
    case 1:
      unint64_t v18 = [(CarAdvisoryListCardViewController *)self->_carAdvisoryListCardViewController numberOfItems];
      id v19 = +[NSBundle mainBundle];
      v20 = v19;
      if (v18 >= 2) {
        CFStringRef v21 = @"RoutePlanning_advisories";
      }
      else {
        CFStringRef v21 = @"RoutePlanning_advisory";
      }
      int v22 = [v19 localizedStringForKey:v21 value:@"localized string not found" table:0];
      [v6 setTitle:v22];

      [v6 setAccessory:1];
      memset(v68, 0, sizeof(v68));
      v58[0] = xmmword_100F6F1C0;
      v58[1] = xmmword_100F67600;
      uint64_t v59 = 3;
      uint64_t v60 = 1148846080;
      uint64_t v61 = 2;
      int v62 = 1148846080;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      long long v65 = _Q0;
      long long v66 = _Q0;
      char v67 = 1;
      uint64_t v69 = 8;
      char v70 = 0;
      if (v6) {
        [v6 setLayout:v58];
      }
      carAdvisoryListCardViewController = self->_carAdvisoryListCardViewController;
      goto LABEL_18;
    case 2:
      v25 = [(CarAdvisoryDetailCardViewController *)self->_carAdvisoryDetailCardViewController advisoryItem];
      v26 = [v25 titleString];
      v27 = [v26 stringWithDefaultOptions];
      [v6 setTitle:v27];

      [v6 setAccessory:1];
      memset(v55, 0, sizeof(v55));
      v45[0] = xmmword_100F6F1C0;
      v45[1] = xmmword_100F67600;
      uint64_t v46 = 3;
      uint64_t v47 = 1148846080;
      uint64_t v48 = 2;
      int v49 = 1148846080;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      long long v52 = _Q0;
      long long v53 = _Q0;
      char v54 = 1;
      uint64_t v56 = 8;
      char v57 = 0;
      if (v6) {
        [v6 setLayout:v45];
      }
      carAdvisoryListCardViewController = self->_carAdvisoryDetailCardViewController;
      goto LABEL_18;
    case 3:
      v29 = +[NSBundle mainBundle];
      v30 = [v29 localizedStringForKey:@"Available Now [Carplay EV Charging Availability header]" value:@"localized string not found" table:0];
      [v6 setTitle:v30];

      [v6 setAccessory:1];
      HIDWORD(v42) = 0;
      *(_DWORD *)((char *)&v42 + 1) = 0;
      long long v32 = xmmword_100F6F1C0;
      long long v33 = xmmword_100F67600;
      uint64_t v34 = 3;
      uint64_t v35 = 1148846080;
      uint64_t v36 = 2;
      LODWORD(v37) = 1148846080;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      long long v40 = _Q0;
      long long v41 = _Q0;
      LOBYTE(v42) = 1;
      uint64_t v43 = 8;
      LOBYTE(v44) = 0;
      if (v6) {
        [v6 setLayout:&v32];
      }
      carAdvisoryListCardViewController = self->_evChargingAvailabilityVC;
LABEL_18:
      [v6 setContent:carAdvisoryListCardViewController, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44];
      [(CarRoutePlanningModeController *)self _hideAdvisories];
      break;
    default:
      break;
  }
}

- (BOOL)zoomInButtonPressed
{
  return 1;
}

- (BOOL)zoomOutButtonPressed
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_waypointsController)
  {
    v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[CarRoutePlanningModeController becomeTopContextInChromeViewController:withAnimation:]";
      __int16 v31 = 2080;
      long long v32 = "CarRoutePlanningModeController.m";
      __int16 v33 = 1024;
      int v34 = 540;
      __int16 v35 = 2080;
      uint64_t v36 = "_waypointsController != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v8 = +[CarDisplayController sharedInstance];
  id v9 = [v8 platformController];
  [v9 addObserver:self];

  v10 = +[CarDisplayController sharedInstance];
  id v11 = [v10 platformController];
  v12 = [v11 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  [(CarRoutePlanningModeController *)self setRoutePlanningSession:v14];
  unsigned int v15 = [CarPlaceCardCardViewController alloc];
  id v16 = [(NSArray *)self->_fullSearchResults firstObject];
  int v17 = [(CarPlaceCardCardViewController *)v15 initWithSearchResult:v16 style:0 dataSource:self delegate:self];
  [(CarRoutePlanningModeController *)self setPlaceCard:v17];

  unint64_t v18 = +[MapsExternalDevice sharedInstance];
  -[CarRoutePlanningModeController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", [v18 isNavigationAidedDrivingEnabled]);

  id v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:self selector:"_vehicleOnboardingFinished" name:@"EVOnboardingFinishedNotification" object:0];

  v20 = +[NSNotificationCenter defaultCenter];
  [v20 addObserver:self selector:"_chromeViewControllerDidUpdateMapInsets:" name:@"ChromeViewControllerDidUpdateMapInsetsNotification" object:v6];

  CFStringRef v21 = [(CarRoutePlanningModeController *)self personalizedItemManager];
  [v21 addObserver:self];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100585B60;
  v28[3] = &unk_1012E5D08;
  v28[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100585CA0;
  v26[3] = &unk_1012E6160;
  v26[4] = self;
  id v27 = v6;
  id v22 = v6;
  [v7 addPreparation:v28 animations:&stru_1012F01F8 completion:v26];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a3;
  [(CarRoutePlanningModeController *)self _hideAdvisories];
  id v6 = +[UIApplication sharedMapsDelegate];
  [v6 dismissCurrentInterruptionOfKind:9];

  id v7 = +[UIApplication sharedMapsDelegate];
  [v7 dismissCurrentInterruptionOfKind:11];

  [(CarFocusableImageButton *)self->_zoomButton removeFromSuperview];
  zoomButton = self->_zoomButton;
  self->_zoomButton = 0;

  id v9 = [(CarRoutePlanningModeController *)self chromeViewController];
  v10 = [v9 searchPinsManager];
  [v10 removePOIShapeLoadingObserver:self];

  id v11 = [(CarRoutePlanningModeController *)self chromeViewController];
  v12 = [v11 mapView];
  [v12 setScrollEnabled:self->_scrollWasEnabled];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self name:@"EVOnboardingFinishedNotification" object:0];

  id v14 = +[NSNotificationCenter defaultCenter];
  [v14 removeObserver:self name:@"ChromeViewControllerDidUpdateMapInsetsNotification" object:v5];

  unsigned int v15 = [(CarRoutePlanningModeController *)self personalizedItemManager];
  [v15 removeObserver:self];

  id v16 = +[CarDisplayController sharedInstance];
  int v17 = [v16 platformController];
  [v17 removeObserver:self];

  [(CarRoutePlanningModeController *)self _dismissPlaceCardAlertControllerIfNeeded];
  id v20 = [v5 nextTopContext];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v18 = [(CarRoutePlanningModeController *)self searchPinsManager];
    [v18 clearDirectionsPins];

    id v19 = [(CarRoutePlanningModeController *)self searchPinsManager];
    [v19 clearDroppedPin];
  }
}

- (void)chromeDidStartConfiguringCards:(id)a3
{
  id v4 = a3;
  id v5 = [(CarRoutePlanningModeController *)self desiredCards];
  unsigned int v6 = [v4 isEqualToArray:v5];

  if (v6)
  {
    id v7 = [(CarRoutePlanningModeController *)self placeCard];
    [v7 setHasCardFinishedTransitioning:0];
  }
}

- (void)chromeDidEndConfiguringCards:(id)a3
{
  id v4 = a3;
  id v5 = [(CarRoutePlanningModeController *)self desiredCards];
  unsigned int v6 = [v4 isEqualToArray:v5];

  if (v6)
  {
    id v7 = [(CarRoutePlanningModeController *)self placeCard];
    [v7 setHasCardFinishedTransitioning:1];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(a3 - 1) > 2) {
        CFStringRef v6 = @"CarRoutePlanningViewControllerStatePlaceCard";
      }
      else {
        CFStringRef v6 = *(&off_1012F03D0 + a3 - 1);
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CarRoutePlanningModeController: setState: %@, -> updating cardsOverlay.", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(CarRoutePlanningModeController *)self chromeViewController];
    [v7 updateCardsForContext:self animated:1];
  }
}

- (BOOL)_isAuthorizedForPreciseLocation
{
  v2 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v3 = [v2 isAuthorizedForPreciseLocation];

  return v3;
}

- (void)_updatedExternalDevice:(id)a3
{
  id v4 = [a3 object];
  -[CarRoutePlanningModeController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", [v4 isNavigationAidedDrivingEnabled]);
}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    id v4 = [(CarRoutePlanningModeController *)self chromeViewController];
    -[CarRoutePlanningModeController _showPinsAnimated:](self, "_showPinsAnimated:", [v4 isCurrentContext:self]);
  }
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005863A0;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_virtualGarageDidUpdateUnpairedVehicles:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000AC254(v4, &stru_1012F0238);
  id v6 = [v5 firstObject];
  unpairedVehicle = self->_unpairedVehicle;
  self->_unpairedVehicle = v6;

  if ([v5 count])
  {
    if (!self->_evOnboardingHintState
      && [(CarRoutePlanningModeController *)self _shouldShowOnboardingHintForVehicle:self->_unpairedVehicle])
    {
      self->_evOnboardingHintState = 1;
      objc_initWeak(&location, self);
      id v8 = [(CarRoutePlanningModeController *)self carChromeViewController];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1005865E0;
      v10[3] = &unk_1012E6998;
      objc_copyWeak(&v11, &location);
      [v8 whenContextNextBecomesCurrent:self performAction:@"CarRoutePlanningPresentEVOnboardingHintKey" withBlock:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    self->_evOnboardingHintState = 0;
    id v9 = [(CarRoutePlanningModeController *)self chromeViewController];
    [v9 dismissCurrentInterruptionOfKind:18];
  }
}

- (BOOL)_shouldShowOnboardingHintForVehicle:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSMutableString string];
    uint64_t v5 = [v3 iapIdentifier];
    id v6 = (void *)v5;
    if (v5) {
      CFStringRef v7 = (const __CFString *)v5;
    }
    else {
      CFStringRef v7 = &stru_101324E70;
    }
    [v4 appendString:v7];

    uint64_t v8 = [v3 displayName];
    id v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = &stru_101324E70;
    }
    [v4 appendString:v10];

    uint64_t v11 = [v3 year];
    v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    else {
      CFStringRef v13 = &stru_101324E70;
    }
    [v4 appendString:v13];

    uint64_t v14 = [v3 model];
    unsigned int v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_101324E70;
    }
    [v4 appendString:v16];

    uint64_t v17 = [v3 manufacturer];
    unint64_t v18 = (void *)v17;
    if (v17) {
      CFStringRef v19 = (const __CFString *)v17;
    }
    else {
      CFStringRef v19 = &stru_101324E70;
    }
    [v4 appendString:v19];

    id v20 = [v4 copy];
  }
  else
  {
    v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315906;
      id v27 = "NSString *_DictionaryKeyForUnpairedVehicle(VGVehicle *__strong)";
      __int16 v28 = 2080;
      v29 = "CarRoutePlanningModeController.m";
      __int16 v30 = 1024;
      int v31 = 707;
      __int16 v32 = 2080;
      __int16 v33 = "vehicle != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v26, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        int v26 = 138412290;
        id v27 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
      }
    }
    id v20 = 0;
  }
  BOOL v21 = sub_100CDBC9C(v20);

  return v21;
}

- (void)_presentEVOnboardingHintForVehicle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_evOnboardingHintState == 1) {
      goto LABEL_3;
    }
    uint64_t v43 = sub_1005762E4();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v64 = "-[CarRoutePlanningModeController _presentEVOnboardingHintForVehicle:]";
      __int16 v65 = 2080;
      long long v66 = "CarRoutePlanningModeController.m";
      __int16 v67 = 1024;
      int v68 = 735;
      __int16 v69 = 2080;
      char v70 = "_evOnboardingHintState == CarRoutePlanningEVOnboardingHintStateReadyToPresent";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v44 = sub_1005762E4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        uint64_t v64 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    if (self->_evOnboardingHintState == 1)
    {
LABEL_3:
      if ([(CarRoutePlanningModeController *)self _shouldShowOnboardingHintForVehicle:v4])
      {
        uint64_t v5 = sub_1005761B4();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will display CarPlay alert to forward the user to onboard on phone.", buf, 2u);
        }

        id v6 = +[NSBundle mainBundle];
        uint64_t v53 = [v6 localizedStringForKey:@"EV Onboarding title [CarPlay]" value:@"localized string not found" table:0];

        uint64_t v7 = [v4 manufacturer];
        uint64_t v8 = (void *)v7;
        if (v7)
        {
          id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v7);
        }
        else
        {
          CFStringRef v10 = [v4 displayName];
          id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v10);
        }
        uint64_t v11 = +[NSBundle mainBundle];
        v12 = [v11 localizedStringForKey:@"EV Onboarding message [CarPlay]" value:@"localized string not found" table:0];

        id v13 = v4;
        uint64_t v14 = +[NSMutableString string];
        uint64_t v15 = [v13 iapIdentifier];
        CFStringRef v16 = (void *)v15;
        if (v15) {
          CFStringRef v17 = (const __CFString *)v15;
        }
        else {
          CFStringRef v17 = &stru_101324E70;
        }
        [v14 appendString:v17];

        uint64_t v18 = [v13 displayName];
        CFStringRef v19 = (void *)v18;
        if (v18) {
          CFStringRef v20 = (const __CFString *)v18;
        }
        else {
          CFStringRef v20 = &stru_101324E70;
        }
        [v14 appendString:v20];

        uint64_t v21 = [v13 year];
        id v22 = (void *)v21;
        if (v21) {
          CFStringRef v23 = (const __CFString *)v21;
        }
        else {
          CFStringRef v23 = &stru_101324E70;
        }
        [v14 appendString:v23];

        uint64_t v24 = [v13 model];
        v25 = (void *)v24;
        if (v24) {
          CFStringRef v26 = (const __CFString *)v24;
        }
        else {
          CFStringRef v26 = &stru_101324E70;
        }
        [v14 appendString:v26];

        id v27 = [v13 manufacturer];

        if (v27) {
          CFStringRef v28 = v27;
        }
        else {
          CFStringRef v28 = &stru_101324E70;
        }
        [v14 appendString:v28];

        id v29 = [v14 copy];
        __int16 v30 = +[NSBundle mainBundle];
        int v31 = [v30 localizedStringForKey:@"OK [CarPlay EV Onboarding]" value:@"localized string not found" table:0];
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100587108;
        v57[3] = &unk_1012E5D58;
        id v58 = v13;
        id v32 = v29;
        id v59 = v32;
        __int16 v33 = +[MapsInterruptionAction actionWithTitle:v31 cancels:0 handler:v57];

        objc_initWeak((id *)buf, self);
        int v34 = +[CarDisplayController sharedInstance];
        v61[0] = @"kMapsInterruptionTitle";
        v61[1] = @"kMapsInterruptionMessage";
        v62[0] = v9;
        v62[1] = v12;
        v61[2] = @"kMapsInterruptionActions";
        uint64_t v60 = v33;
        __int16 v35 = +[NSArray arrayWithObjects:&v60 count:1];
        v62[2] = v35;
        uint64_t v36 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_10058720C;
        v54[3] = &unk_1012F0260;
        objc_copyWeak(&v56, (id *)buf);
        v54[4] = self;
        id v37 = v32;
        id v55 = v37;
        id v38 = [v34 presentInterruptionOfKind:18 userInfo:v36 completionHandler:v54];

        objc_destroyWeak(&v56);
        objc_destroyWeak((id *)buf);

        uint64_t v39 = v53;
        goto LABEL_25;
      }
      uint64_t v50 = sub_1005762E4();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v64 = "-[CarRoutePlanningModeController _presentEVOnboardingHintForVehicle:]";
        __int16 v65 = 2080;
        long long v66 = "CarRoutePlanningModeController.m";
        __int16 v67 = 1024;
        int v68 = 742;
        __int16 v69 = 2080;
        char v70 = "shouldPresentOnboardingHint";
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        uint64_t v51 = sub_1005762E4();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          long long v52 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          uint64_t v64 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      uint64_t v39 = sub_1005761B4();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      uint64_t v47 = "Won't display CarPlay alert, as shouldPresentOnboardingHint is false.";
      uint64_t v48 = v39;
      uint32_t v49 = 2;
    }
    else
    {
      uint64_t v39 = sub_1005761B4();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
LABEL_25:

        goto LABEL_26;
      }
      int64_t evOnboardingHintState = self->_evOnboardingHintState;
      *(_DWORD *)buf = 134217984;
      uint64_t v64 = (const char *)evOnboardingHintState;
      uint64_t v47 = "Won't display CarPlay alert, because the state is %ld.";
      uint64_t v48 = v39;
      uint32_t v49 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, v47, buf, v49);
    goto LABEL_25;
  }
  long long v40 = sub_1005762E4();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v64 = "-[CarRoutePlanningModeController _presentEVOnboardingHintForVehicle:]";
    __int16 v65 = 2080;
    long long v66 = "CarRoutePlanningModeController.m";
    __int16 v67 = 1024;
    int v68 = 730;
    __int16 v69 = 2080;
    char v70 = "vehicle != nil";
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
  }

  if (sub_100BB36BC())
  {
    uint64_t v39 = sub_1005762E4();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      long long v41 = v39;
      uint64_t v42 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      uint64_t v39 = v41;
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (void)_vehicleOnboardingFinished
{
  id v3 = sub_1005761B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "EV Onboarding finished while CP route planning was displayed. Let's offer disambiguation if needed.", v4, 2u);
  }

  [(CarRoutePlanningModeController *)self _offerVehicleDisambiguationIfNeeded];
}

- (void)_offerVehicleDisambiguationIfNeeded
{
  if (MapsFeature_IsEnabled_EVRouting())
  {
    id v3 = +[CarDisplayController sharedInstance];
    id v4 = [v3 platformController];
    id v7 = [v4 auxiliaryTasksManager];

    uint64_t v5 = [v7 vehicleDisambiguationTask];
    id v6 = [(CarRoutePlanningModeController *)self carChromeViewController];
    [v5 displayDisambiguationPromptIfNeededFromChromeViewController:v6];
  }
}

- (void)setSearchSession:(id)a3
{
  uint64_t v5 = (SearchSession *)a3;
  searchSession = self->_searchSession;
  CFStringRef v10 = v5;
  if (searchSession != v5)
  {
    [(SearchSession *)searchSession removeObserver:self];
    [(SearchSession *)self->_searchSession invalidate];
    objc_storeStrong((id *)&self->_searchSession, a3);
    [(SearchSession *)self->_searchSession addObserver:self];
    uint64_t v5 = self->_searchSession;
  }
  if (v5)
  {
    id v7 = [(SearchSession *)v5 currentResults];
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = [(SearchSession *)self->_searchSession currentResults];
      [(CarRoutePlanningModeController *)self setSearchResults:v9 selectedIndex:[(SearchSession *)self->_searchSession selectedResultIndex]];
    }
  }
}

- (void)setSearchResults:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6 = a3;
  if (![v6 count])
  {
    CFStringRef v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315906;
      id v27 = "-[CarRoutePlanningModeController setSearchResults:selectedIndex:]";
      __int16 v28 = 2080;
      id v29 = "CarRoutePlanningModeController.m";
      __int16 v30 = 1024;
      int v31 = 824;
      __int16 v32 = 2080;
      __int16 v33 = "searchResults.count > 0";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v26, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        int v26 = 138412290;
        id v27 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  if ([v6 count])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = self->_waypointsController;
      id v8 = [(CarWaypointsController *)v7 indexOfCurrentDestination];
      id v9 = [(CarWaypointsController *)v7 searchResults];

      if (v8 == (id)a4 && ([v9 isEqualToArray:v6] & 1) != 0) {
        goto LABEL_13;
      }
    }
    CFStringRef v10 = [[CarSearchWaypointsController alloc] initWithSearchResults:v6 selectedIndex:a4];
    waypointsController = self->_waypointsController;
    self->_waypointsController = &v10->super;

    [(CarWaypointsController *)self->_waypointsController setAllowLooping:1];
    v12 = [(CarRoutePlanningModeController *)self userInfo];
    [(CarWaypointsController *)self->_waypointsController setUserInfo:v12];

    id v13 = [(CarRoutePlanningModeController *)self chromeViewController];
    unsigned int v14 = [v13 isCurrentContext:self];

    if (v14)
    {
      uint64_t v15 = self->_waypointsController;
      CFStringRef v16 = [(CarRoutePlanningModeController *)self chromeViewController];
      CFStringRef v17 = [v16 currentTraits];
      [(CarWaypointsController *)v15 startLoadWithTraits:v17];

      uint64_t v18 = [(CarRoutePlanningModeController *)self placeCard];
      [v18 reloadData];

      CFStringRef v19 = [(CarWaypointsController *)self->_waypointsController indexOfCurrentDestination];
      searchSession = self->_searchSession;
      if (searchSession)
      {
        if ((void *)[(SearchSession *)searchSession selectedResultIndex] != v19) {
          [(SearchSession *)self->_searchSession setSelectedResultIndex:v19];
        }
      }
    }
    uint64_t v21 = [(CarRoutePlanningModeController *)self delegate];

    if (v21)
    {
      id v9 = [(CarRoutePlanningModeController *)self delegate];
      id v22 = +[NSIndexPath indexPathForRow:a4 inSection:0];
      [v9 routePlanningMode:self didSelectRouteAtIndex:v22];

LABEL_13:
    }
  }
}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  uint64_t v5 = (SearchSession *)a3;
  if (self->_searchSession == v5)
  {
    self->_searchSession = 0;
    id v6 = v5;

    uint64_t v5 = v6;
  }
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v5 = a3;
  if ([v5 origin] == (id)1)
  {
    id v4 = [v5 currentResults];
    -[CarRoutePlanningModeController setSearchResults:selectedIndex:](self, "setSearchResults:selectedIndex:", v4, [v5 selectedResultIndex]);
  }
}

- (void)_updateLoading
{
  BOOL v3 = [(CarRoutePlanningModeController *)self isLoading];
  id v4 = [(CarRoutePlanningModeController *)self placeCard];
  [v4 setLoading:v3];

  BOOL v5 = [(CarRoutePlanningModeController *)self _goButtonShouldBeEnabled];
  id v6 = [(CarRoutePlanningModeController *)self placeCard];
  [v6 setGoButtonEnabled:v5];

  BOOL v7 = [(CarRoutePlanningModeController *)self _goButtonShouldBeHidden];
  id v8 = [(CarRoutePlanningModeController *)self placeCard];
  [v8 setGoButtonHidden:v7];
}

- (void)handleHardwareBackButtonPressed
{
  BOOL v3 = [(CarRoutePlanningModeController *)self placeCard];
  id v4 = [v3 presentedViewController];

  if (!v4)
  {
    id v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      CFStringRef v10 = "-[CarRoutePlanningModeController handleHardwareBackButtonPressed]";
      __int16 v11 = 2080;
      v12 = "CarRoutePlanningModeController.m";
      __int16 v13 = 1024;
      int v14 = 894;
      __int16 v15 = 2080;
      CFStringRef v16 = "self.placeCard.presentedViewController";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100BB36BC())
    {
      BOOL v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        CFStringRef v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  BOOL v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "routePlanning handleHardwareBackButtonPressed", (uint8_t *)&v9, 2u);
  }

  [(CarRoutePlanningModeController *)self _dismissPlaceCardAlertControllerIfNeeded];
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int64_t v5 = [(CarRoutePlanningModeController *)self state];
    if ((unint64_t)(v5 - 1) > 2) {
      CFStringRef v6 = @"CarRoutePlanningViewControllerStatePlaceCard";
    }
    else {
      CFStringRef v6 = *(&off_1012F03D0 + v5 - 1);
    }
    int v12 = 138412290;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarRoutePlanningModeController: closeButtonTapped, currentState: %@", (uint8_t *)&v12, 0xCu);
  }

  switch([(CarRoutePlanningModeController *)self state])
  {
    case 0:
      int v9 = +[CarChromeModeCoordinator sharedInstance];
      [v9 popFromContext:self];

      CFStringRef v10 = +[CarDisplayController sharedInstance];
      __int16 v11 = [v10 platformController];
      [v11 popSession];

      break;
    case 1:
    case 3:
      goto LABEL_7;
    case 2:
      if ([(CarAdvisoryListCardViewController *)self->_carAdvisoryListCardViewController numberOfItems] < 2)
      {
LABEL_7:
        BOOL v7 = self;
        uint64_t v8 = 0;
      }
      else
      {
        BOOL v7 = self;
        uint64_t v8 = 1;
      }
      [(CarRoutePlanningModeController *)v7 setState:v8];
      break;
    default:
      return;
  }
}

- (void)_start
{
  BOOL v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "routePlanning _start: presenting nav prompt.", buf, 2u);
  }

  id v4 = [(CarRoutePlanningModeController *)self drivingRouteCollection];
  int64_t v5 = [v4 currentRoute];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100587E5C;
  v7[3] = &unk_1012F0288;
  id v8 = v4;
  id v6 = v4;
  +[NavigationSimulationPromptController promptIfNeededForSimulationForRoute:v5 navigationTracePlayback:0 continueWithOptions:v7];
}

- (void)_dismissPlaceCardAlertControllerIfNeeded
{
  BOOL v3 = [(CarRoutePlanningModeController *)self placeCard];
  id v4 = [v3 presentedViewController];

  if (v4)
  {
    int64_t v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dismissing place card's current modal VC.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = [(CarRoutePlanningModeController *)self placeCard];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100588130;
    v7[3] = &unk_1012E6708;
    objc_copyWeak(&v8, buf);
    [v6 dismissViewControllerAnimated:1 completion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)_presentInterruptionForError:(id)a3
{
  id v14 = a3;
  id v4 = [(CarRoutePlanningModeController *)self chromeViewController];
  unsigned int v5 = [v4 isCurrentContext:self];

  if (v5)
  {
    id v6 = [(CarWaypointsController *)self->_waypointsController destinationSearchResultIfAvailable];
    double v7 = CarDisplayRegionForSearchResult(v6);
    __int16 v11 = CarInterruptionUserInfoForRoutingFailure(v14, v7, v8, v9, v10);
    if (v11)
    {
      int v12 = +[CarDisplayController sharedInstance];
      id v13 = [v12 presentInterruptionOfKind:3 userInfo:v11 completionHandler:0];
    }
  }
}

- (id)etaForCurrentRoute
{
  v2 = [(CarRoutePlanningModeController *)self currentRoute];
  BOOL v3 = [v2 guidanceETA];

  return v3;
}

- (id)automaticSharingContacts
{
  v2 = [(RoutePlanningSession *)self->_routePlanningSession configuration];
  BOOL v3 = [v2 automaticSharingContacts];

  return v3;
}

- (id)routeMainDescriptionText
{
  id v3 = objc_alloc((Class)MKServerFormattedString);
  id v4 = [(CarRoutePlanningModeController *)self currentRoute];
  unsigned int v5 = [v4 planningDescriptionString];
  id v6 = [v3 initWithComposedString:v5];

  double v7 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
  NSAttributedStringKey v14 = NSFontAttributeName;
  __int16 v15 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  double v9 = [v6 multiPartAttributedStringWithAttributes:v8];
  double v10 = [v9 attributedString];

  if ([v10 length]) {
    __int16 v11 = v10;
  }
  else {
    __int16 v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (void)placeCardDidSelectGo:(id)a3
{
  id v4 = [(CarRoutePlanningModeController *)self routePlanningSession];
  unsigned int v5 = [v4 navigationStateMonitoringTask];
  [v5 cancelNavigationAutoLaunchIfNeccessary];

  [(CarRoutePlanningModeController *)self _start];
}

- (void)placeCardDidSelectHandoff:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CarRoutePlanningModeController *)self routePlanningSession];
  id v6 = [v5 navigationStateMonitoringTask];
  [v6 cancelNavigationAutoLaunchIfNeccessary];

  objc_initWeak(&location, self);
  double v7 = [(CarWaypointsController *)self->_waypointsController destinationSearchResultIfAvailable];
  double v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [v7 name];
    *(_DWORD *)buf = 138477827;
    CFStringRef v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "routePlanning handing off to destination: %{private}@", buf, 0xCu);
  }
  double v10 = +[MapsExternalDevice sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005886AC;
  v12[3] = &unk_1012F02B0;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  [v10 handoffDestination:v11 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)placeCardDidSelectCall:(id)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "routePlanning didSelectCall", v7, 2u);
  }

  unsigned int v5 = [(CarRoutePlanningModeController *)self routePlanningSession];
  id v6 = [v5 navigationStateMonitoringTask];
  [v6 cancelNavigationAutoLaunchIfNeccessary];
}

- (void)placeCard:(id)a3 didPresentAlert:(id)a4
{
  id v5 = a4;
  id v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = [v5 title];
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "routePlanning didPresentAlert with title: %@", (uint8_t *)&v11, 0xCu);
  }
  double v8 = [(CarRoutePlanningModeController *)self routePlanningSession];
  double v9 = [v8 navigationStateMonitoringTask];
  [v9 cancelNavigationAutoLaunchIfNeccessary];

  double v10 = [(CarRoutePlanningModeController *)self carChromeViewController];
  [v10 setHardwareBackButtonBehavior:1 forContext:self];
}

- (void)placeCardDidDismissAlert:(id)a3
{
  id v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "routePlanning didDismissAlert", v6, 2u);
  }

  id v5 = [(CarRoutePlanningModeController *)self carChromeViewController];
  [v5 setHardwareBackButtonBehavior:0 forContext:self];
}

- (void)placeCard:(id)a3 wantsToPresentEVAvailability:(id)a4
{
  [(CarRoutePlanningModeController *)self setEvChargingAvailabilityVC:a4];

  [(CarRoutePlanningModeController *)self setState:3];
}

- (BOOL)_goButtonShouldBeEnabled
{
  id v3 = [(CarRoutePlanningModeController *)self currentRoute];
  if (v3
    && ([(CarRoutePlanningModeController *)self navigationAidedDrivingEnabled]
     || ![(CarRoutePlanningModeController *)self isLoading]))
  {
    BOOL v4 = [(CarRoutePlanningModeController *)self _isAuthorizedForPreciseLocation];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_goButtonShouldBeHidden
{
  id v3 = [(CarRoutePlanningModeController *)self currentRoute];
  if (v3) {
    unsigned int v4 = ![(CarRoutePlanningModeController *)self _isTurnByTurnSupportedForCurrentRoute];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_updateSelectedRouteIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL
    && [(CarRoutePlanningModeController *)self selectedRouteIndex] != a3)
  {
    id v5 = [(CarRoutePlanningModeController *)self chromeViewController];
    unsigned int v6 = [v5 isCurrentContext:self];

    if (v6)
    {
      id v7 = [(CarRoutePlanningModeController *)self routePlanningSession];
      [v7 setSelectedRouteIndex:a3 forTransportType:1];
    }
  }
}

- (void)_centerOnRouteOrPinsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CarRoutePlanningModeController *)self currentRoute];
  if (v5 && (BOOL zoomToDestination = self->_zoomToDestination, v5, !zoomToDestination))
  {
    [(CarRoutePlanningModeController *)self _recenterOnRouteAnimated:v3];
  }
  else
  {
    [(CarRoutePlanningModeController *)self _showPinsAnimated:v3];
  }
}

- (void)_toggleZoom:(id)a3
{
  unsigned int v4 = [(CarRoutePlanningModeController *)self routePlanningSession];
  id v5 = [v4 navigationStateMonitoringTask];
  [v5 cancelNavigationAutoLaunchIfNeccessary];

  if (self->_zoomToDestination)
  {
    [(CarRoutePlanningModeController *)self _zoomOut];
  }
  else
  {
    [(CarRoutePlanningModeController *)self _zoomIn];
  }
}

- (void)_zoomIn
{
  if (!self->_zoomToDestination)
  {
    BOOL v3 = [(CarRoutePlanningModeController *)self chromeViewController];
    [v3 captureUserAction:1049];

    self->_BOOL zoomToDestination = 1;
    [(CarRoutePlanningModeController *)self _centerOnRouteOrPinsAnimated:1];
  }
}

- (void)_zoomOut
{
  if (self->_zoomToDestination)
  {
    BOOL v3 = [(CarRoutePlanningModeController *)self chromeViewController];
    [v3 captureUserAction:1050];

    self->_BOOL zoomToDestination = 0;
    [(CarRoutePlanningModeController *)self _centerOnRouteOrPinsAnimated:1];
  }
}

- (void)_updateZoomButtonContent
{
  if (self->_zoomToDestination) {
    CFStringRef v3 = @"minus";
  }
  else {
    CFStringRef v3 = @"plus";
  }
  unsigned int v4 = +[UIImage _mapsCar_systemImageNamed:v3 textStyle:UIFontTextStyleSubheadline];
  if (!self->_zoomButton)
  {
    id v5 = [(CarRoutePlanningModeController *)self chromeViewController];
    unsigned int v6 = [v5 viewport];

    if (v6)
    {
      id v7 = [[CarFocusableImageButton alloc] initWithImage:v4];
      zoomButton = self->_zoomButton;
      self->_zoomButton = v7;

      if (self->_zoomToDestination) {
        CFStringRef v9 = @"Out";
      }
      else {
        CFStringRef v9 = @"In";
      }
      double v10 = [@"ZoomButton." stringByAppendingString:v9];
      [(CarFocusableImageButton *)self->_zoomButton setAccessibilityIdentifier:v10];

      [(CarFocusableImageButton *)self->_zoomButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CarFocusableImageButton *)self->_zoomButton addTarget:self action:"_toggleZoom:" forControlEvents:64];
      [(CarFocusableBlurControl *)self->_zoomButton setRoundedCornerRadius:14.0];
      BOOL zoomToDestination = self->_zoomToDestination;
      id v12 = +[NSBundle mainBundle];
      id v13 = v12;
      if (zoomToDestination)
      {
        id v14 = [v12 localizedStringForKey:@"CarPlay_ZoomOut" value:@"localized string not found" table:0];
        v36[0] = v14;
        __int16 v15 = +[NSBundle mainBundle];
        CFStringRef v16 = [v15 localizedStringForKey:@"CarPlay_Minus" value:@"localized string not found" table:0];
        v36[1] = v16;
        CFStringRef v17 = v36;
      }
      else
      {
        id v14 = [v12 localizedStringForKey:@"CarPlay_ZoomIn" value:@"localized string not found" table:0];
        v35[0] = v14;
        __int16 v15 = +[NSBundle mainBundle];
        CFStringRef v16 = [v15 localizedStringForKey:@"CarPlay_Plus" value:@"localized string not found" table:0];
        v35[1] = v16;
        CFStringRef v17 = v35;
      }
      uint64_t v18 = +[NSArray arrayWithObjects:v17 count:2];
      [(CarFocusableImageButton *)self->_zoomButton setAccessibilityUserInputLabels:v18];

      CFStringRef v19 = [(CarRoutePlanningModeController *)self chromeViewController];
      CFStringRef v20 = [v19 viewport];

      [v20 addSubview:self->_zoomButton];
      __int16 v33 = [(CarFocusableImageButton *)self->_zoomButton _maps_rightRHDAnchor];
      __int16 v32 = [v20 _maps_rightRHDAnchor];
      LODWORD(v21) = 1148846080;
      int v31 = [v33 _maps_constraintWithRHDAnchor:v32 relation:0 constant:-10.0 priority:v21];
      v34[0] = v31;
      __int16 v30 = [(CarFocusableImageButton *)self->_zoomButton bottomAnchor];
      id v29 = [v20 bottomAnchor];
      id v22 = [v30 constraintEqualToAnchor:v29 constant:-10.0];
      v34[1] = v22;
      CFStringRef v23 = [(CarFocusableImageButton *)self->_zoomButton widthAnchor];
      uint64_t v24 = [v23 constraintEqualToConstant:28.0];
      v34[2] = v24;
      v25 = [(CarFocusableImageButton *)self->_zoomButton widthAnchor];
      int v26 = [(CarFocusableImageButton *)self->_zoomButton heightAnchor];
      id v27 = [v25 constraintEqualToAnchor:v26];
      v34[3] = v27;
      __int16 v28 = +[NSArray arrayWithObjects:v34 count:4];
      +[NSLayoutConstraint activateConstraints:v28];
    }
  }
  [(CarFocusableImageButton *)self->_zoomButton setImage:v4];
}

- (void)_updateZoomButtonContentAndVisibilityWithMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  [(CarRoutePlanningModeController *)self _updateZoomButtonContent];
  unsigned int v6 = [(CarWaypointsController *)self->_waypointsController destinationSearchResultIfAvailable];
  BOOL v7 = self->_zoomToDestination || v6 == 0;
  id v11 = v6;
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    [v6 coordinate];
    MKCoordinateRegionMakeWithDistance(v13, 350.0, 350.0);
    MKMapRectForCoordinateRegion();
    BOOL v8 = v10 > var1 && v9 > var0;
  }
  [(CarFocusableImageButton *)self->_zoomButton setHidden:v8];
}

- (void)_showPinsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CarRoutePlanningModeController *)self chromeViewController];
  unsigned int v6 = [v5 isCurrentContext:self];

  if (v6)
  {
    BOOL v7 = [(CarRoutePlanningModeController *)self currentRoute];
    BOOL v8 = v7 != 0;

    double v9 = [(CarRoutePlanningModeController *)self searchPinsManager];
    [v9 setDisableStartPin:v8];

    double v10 = [(CarRoutePlanningModeController *)self searchPinsManager];
    [v10 setDisableEndPins:v8];

    id v11 = +[MKLocationManager sharedLocationManager];
    unsigned __int8 v12 = [v11 hasLocation];

    id v15 = [(CarWaypointsController *)self->_waypointsController originSearchResult];
    CLLocationCoordinate2D v13 = [(CarWaypointsController *)self->_waypointsController destinationSearchResultIfAvailable];
    if (v13 && ((v12 & 1) != 0 || ([v15 isDynamicCurrentLocation] & 1) == 0))
    {
      id v14 = [(CarRoutePlanningModeController *)self searchPinsManager];
      [v14 setStartPin:v15 endPin:v13];
    }
    else
    {
      id v14 = [(CarRoutePlanningModeController *)self searchPinsManager];
      [v14 clearDirectionsPins];
    }

    [(CarRoutePlanningModeController *)self _recenterOnRouteAnimated:v3];
  }
}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
}

- (BOOL)_isTurnByTurnSupportedForCurrentRoute
{
  BOOL v3 = [(CarRoutePlanningModeController *)self routePlanningSession];
  unsigned int v4 = [v3 currentRouteCollection];
  id v5 = [v4 currentRoute];

  if (!v5) {
    return 1;
  }
  unsigned int v6 = [(CarRoutePlanningModeController *)self routePlanningSession];
  BOOL v7 = [v6 navigationTypeForCurrentRoute] == (id)3;

  return v7;
}

- (int64_t)_interruptionKindForCurrentRoute
{
  BOOL v3 = [(CarRoutePlanningModeController *)self routePlanningSession];
  unsigned int v4 = [v3 currentRouteCollection];
  id v5 = [v4 currentRoute];

  if (!v5)
  {
    BOOL v7 = [(CarRoutePlanningModeController *)self routePlanningSession];
    BOOL v8 = [v7 currentTransportType] != (id)1;

    int64_t v6 = 8 * v8;
    goto LABEL_12;
  }
  if ([v5 transportType])
  {
    int64_t v6 = 8;
    goto LABEL_12;
  }
  double v9 = [v5 routeAttributes];
  if ([v9 hasTimepoint])
  {

LABEL_11:
    int64_t v6 = 9;
    goto LABEL_12;
  }
  double v10 = [v5 origin];
  unsigned int v11 = [v10 isCurrentLocation];

  if (!v11) {
    goto LABEL_11;
  }
  unsigned __int8 v12 = [(CarRoutePlanningModeController *)self routePlanningSession];
  id v13 = [v12 navigationTypeForCurrentRoute];

  if (v13 == (id)3) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = 11;
  }
LABEL_12:

  return v6;
}

- (id)_preciseLocationOffAdvisory
{
  if ([(CarRoutePlanningModeController *)self _isAuthorizedForPreciseLocation])
  {
    v2 = 0;
  }
  else
  {
    v2 = CarDisplayPreciseLocationOffAdvisory();
  }

  return v2;
}

- (id)_turnByTurnNotAvailableAdvisory
{
  if ([(CarRoutePlanningModeController *)self _goButtonShouldBeHidden])
  {
    v2 = CarDisplayTurnByTurnNotAvailableAdvisory();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_clickableAdvisoryDescriptionForRoute:(id)a3
{
  BOOL v3 = [a3 clickableAdvisory];
  unsigned int v4 = [v3 titleString];
  id v5 = [v4 stringWithDefaultOptions];

  return v5;
}

- (void)_updateRouteAdvisories
{
  objc_initWeak(&location, self);
  BOOL v3 = [(CarRoutePlanningModeController *)self chromeViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100589940;
  v4[3] = &unk_1012E5D30;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 whenContextNextBecomesCurrent:self performAction:@"CarRoutePlanningUpdateRouteAdvisory" withBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_hideAdvisories
{
  BOOL v3 = [(CarRoutePlanningModeController *)self advisoryLabel];
  [v3 removeFromSuperview];

  [(CarRoutePlanningModeController *)self setAdvisoryLabel:0];
  id v4 = [(CarRoutePlanningModeController *)self chromeViewController];
  [v4 setNeedsUpdateMapInsets];
}

- (void)advisoryListCardDidSelectAdvisoryItem:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:250 onTarget:1007 forAdvisoryItem:v4];

  [(CarAdvisoryDetailCardViewController *)self->_carAdvisoryDetailCardViewController setAdvisoryItem:v4];

  [(CarRoutePlanningModeController *)self setState:2];
}

- (void)clickabilityChanged
{
  id v2 = [(CarRoutePlanningModeController *)self chromeViewController];
  [v2 setNeedsFocusUpdate];
}

- (void)displayAdvisories
{
  if ([(CarAdvisoryListCardViewController *)self->_carAdvisoryListCardViewController numberOfItems] < 2)
  {
    id v6 = [(CarRoutePlanningModeController *)self currentRoute];
    BOOL v3 = [v6 clickableAdvisory];
    id v4 = [v3 advisoryItems];
    id v5 = [v4 firstObject];
    [(CarRoutePlanningModeController *)self advisoryListCardDidSelectAdvisoryItem:v5];
  }
  else
  {
    [(CarRoutePlanningModeController *)self setState:1];
  }
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CarRoutePlanningModeController *)self routePlanningSession];
  if ([v5 currentTransportType] != (id)1
    || [(CarRoutePlanningModeController *)self navigationAidedDrivingEnabled]
    || [(CarRoutePlanningModeController *)self _goButtonShouldBeHidden])
  {

LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  unsigned int v19 = [(CarRoutePlanningModeController *)self _isAuthorizedForPreciseLocation];

  if (!v19) {
    goto LABEL_5;
  }
  id v6 = [(CarRoutePlanningModeController *)self drivingRoutes];
LABEL_6:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      unsigned int v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v11);
        id v13 = [(CarRoutePlanningModeController *)self searchPinsManager];
        id v14 = [v13 routeStartEndItemSource];
        id v15 = [(CarRoutePlanningModeController *)self personalizedItemManager];
        [v12 updateWaypointStyleAttributesWithItemSource:v14 personalizedItemManager:v15];

        unsigned int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if (v7)
  {
    CFStringRef v16 = [(CarRoutePlanningModeController *)self chromeViewController];
    [v16 captureUserAction:3072];

    [v4 setRoutes:v7];
    unint64_t v17 = [(CarRoutePlanningModeController *)self selectedRouteIndex];
  }
  else
  {
    [v4 setRoutes:0];
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v4 setSelectedRouteIndex:v17, v20];
  [v4 setAlternateRoutesEnabled:1];
  [v4 setStyle:1];

  return 1;
}

- (void)_updateAnnotationsForLoadedRoute
{
  objc_initWeak(&location, self);
  BOOL v3 = [(CarRoutePlanningModeController *)self chromeViewController];
  [v3 cancelDeferredAction:@"CarRoutePlanningUpdateSelectedRoute" forContext:self];

  id v4 = [(CarRoutePlanningModeController *)self chromeViewController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10058A4D8;
  v5[3] = &unk_1012E6998;
  objc_copyWeak(&v6, &location);
  [v4 whenContextNextBecomesCurrent:self performAction:@"CarRoutePlanningUpdateAnnotations" withBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_recenterOnRouteAnimated:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CarRoutePlanningModeController *)self chromeViewController];
    unsigned __int8 v5 = [v4 isCurrentContext:self];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }
  objc_initWeak(&location, self);
  id v6 = [(CarRoutePlanningModeController *)self chromeViewController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10058A68C;
  v7[3] = &unk_1012E9318;
  objc_copyWeak(&v8, &location);
  void v7[4] = self;
  unsigned __int8 v9 = v5;
  [v6 whenContextNextBecomesCurrent:self performAction:@"CarRoutePlanningRecenter" withBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_chromeViewControllerDidUpdateMapInsets:(id)a3
{
}

- (id)routeAnnotationsController
{
  id v2 = [(CarRoutePlanningModeController *)self chromeViewController];
  BOOL v3 = [v2 routeAnnotationsController];

  return v3;
}

- (id)searchPinsManager
{
  id v2 = [(CarRoutePlanningModeController *)self chromeViewController];
  BOOL v3 = [v2 searchPinsManager];

  return v3;
}

- (id)personalizedItemManager
{
  id v2 = [(CarRoutePlanningModeController *)self chromeViewController];
  BOOL v3 = [v2 personalizedItemManager];

  return v3;
}

- (void)setRoutePlanningSession:(id)a3
{
  unsigned __int8 v5 = (RoutePlanningSession *)a3;
  p_routePlanningSession = &self->_routePlanningSession;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    unsigned __int8 v12 = v5;
    [(RoutePlanningSession *)routePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
    originalEntry = self->_originalEntry;
    if (originalEntry)
    {
      unsigned __int8 v9 = [(MapsSuggestionsEntry *)originalEntry shortcutIdentifier];
      [(RoutePlanningSession *)*p_routePlanningSession setShortcutIdentifier:v9];
    }
    originalItem = self->_originalItem;
    if (originalItem)
    {
      unsigned int v11 = [(MapsFavoriteItem *)originalItem identifier];
      [(RoutePlanningSession *)*p_routePlanningSession setShortcutIdentifier:v11];
    }
    [(CarRoutePlanningModeController *)self _updateLoading];
    unsigned __int8 v5 = v12;
  }
}

- (RouteCollection)drivingRouteCollection
{
  id v2 = [(CarRoutePlanningModeController *)self routePlanningSession];
  BOOL v3 = [v2 routeCollectionForTransportType:1];

  return (RouteCollection *)v3;
}

- (GEOComposedRoute)currentRoute
{
  id v2 = [(CarRoutePlanningModeController *)self drivingRouteCollection];
  BOOL v3 = [v2 currentRoute];

  return (GEOComposedRoute *)v3;
}

- (unint64_t)selectedRouteIndex
{
  BOOL v3 = [(CarRoutePlanningModeController *)self drivingRouteCollection];

  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [(CarRoutePlanningModeController *)self drivingRouteCollection];
  id v5 = [v4 currentRouteIndex];

  return (unint64_t)v5;
}

- (NSArray)drivingRoutes
{
  id v2 = [(CarRoutePlanningModeController *)self drivingRouteCollection];
  BOOL v3 = sub_100099700(v2, &stru_1012F0320);

  return (NSArray *)v3;
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v9;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [(CarRoutePlanningModeController *)self setRoutePlanningSession:v7];

  id v8 = [(CarRoutePlanningModeController *)self routePlanningSession];

  if (v8) {
    [(CarRoutePlanningModeController *)self _updateElements];
  }
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  waypointsController = self->_waypointsController;
  id v6 = a4;
  id v7 = [(CarWaypointsController *)waypointsController destinationSearchResultIfAvailable];

  if (v7)
  {
    id v8 = [(CarWaypointsController *)self->_waypointsController destinationSearchResultIfAvailable];
    unsigned int v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [(CarRoutePlanningModeController *)self setFullSearchResults:v9];
  }
  [(CarRoutePlanningModeController *)self _updateElements];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10058B108;
  v10[3] = &unk_1012EB010;
  void v10[4] = self;
  [v6 withValue:&stru_1012F0360 orError:v10];
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8 = a4;
  if ([a3 currentTransportType] == (id)a5)
  {
    [(CarRoutePlanningModeController *)self _updateElements];
    [(CarRoutePlanningModeController *)self _updateTurnByTurnSupport];
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10058B20C;
    v10[3] = &unk_1012F0388;
    void v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10058B254;
    v9[3] = &unk_1012EB010;
    [v8 withValue:v10 orError:v9];
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  [(CarRoutePlanningModeController *)self _updateTurnByTurnSupport];

  [(CarRoutePlanningModeController *)self _updateElements];
}

- (void)_clearSteppingRouteParameters
{
  BOOL v3 = [(CarRoutePlanningModeController *)self routePlanningSession];
  uint64_t v4 = [v3 platformController];
  if (v4)
  {
    id v5 = v4;

LABEL_4:
    id v7 = [v5 chromeViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = v9;
    if (v9)
    {
      unsigned int v11 = [v9 appCoordinator];
      unsigned __int8 v12 = [v11 baseActionCoordinator];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;

      if (v14)
      {
        id v15 = [v14 routePlanningDataCoordinator];
        CFStringRef v16 = +[RoutePlanningTiming leaveNowTiming];
        [v15 updateTiming:v16];

        unint64_t v17 = [v14 routePlanningOverviewViewController];
        [v17 replaceOriginWithCurrentLocation];

        uint64_t v18 = [v14 routePlanningDataCoordinator];
        [v18 updateTransportType:1];
      }
      else
      {
        unsigned int v19 = sub_100015DB4();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          long long v20 = [v10 appCoordinator];
          int v21 = 138543362;
          long long v22 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Couldn't get the action coordinator from app coordinator %{public}@", (uint8_t *)&v21, 0xCu);
        }
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = sub_100015DB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138543362;
        long long v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Couldn't get the iOS Chrome from platform: %{public}@", (uint8_t *)&v21, 0xCu);
      }
    }

    goto LABEL_19;
  }
  id v6 = +[UIApplication sharedMapsDelegate];
  id v5 = [v6 platformController];

  if (v5) {
    goto LABEL_4;
  }
  id v5 = sub_100015DB4();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    goto LABEL_20;
  }
  id v7 = [(CarRoutePlanningModeController *)self routePlanningSession];
  int v21 = 138543362;
  long long v22 = v7;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Couldn't get the platform controller from RPS: %{public}@", (uint8_t *)&v21, 0xCu);
LABEL_19:

LABEL_20:
}

- (void)_updateElements
{
  BOOL v3 = [(CarRoutePlanningModeController *)self placeCard];
  [v3 reloadData];

  [(CarRoutePlanningModeController *)self _updateRouteAdvisories];
  [(CarRoutePlanningModeController *)self _showPinsAnimated:1];
  [(CarRoutePlanningModeController *)self _updateAnnotationsForLoadedRoute];

  [(CarRoutePlanningModeController *)self _updateLoading];
}

- (void)_updateTurnByTurnSupport
{
  BOOL v3 = [(CarRoutePlanningModeController *)self chromeViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10058B674;
  v4[3] = &unk_1012E7D28;
  v4[4] = self;
  [v3 whenContextNextBecomesCurrent:self performAction:@"CarRoutePlanningUpdateRouteAdvisory" withBlock:v4];
}

- (NSArray)preferredCarFocusEnvironments
{
  switch([(CarRoutePlanningModeController *)self state])
  {
    case 0:
      uint64_t v4 = [(CarRoutePlanningModeController *)self placeCard];
      id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
      unsigned int v11 = v5;
      id v6 = &v11;
      goto LABEL_6;
    case 1:
      uint64_t v4 = [(CarRoutePlanningModeController *)self carAdvisoryListCardViewController];
      id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
      uint64_t v10 = v5;
      id v6 = &v10;
      goto LABEL_6;
    case 2:
      uint64_t v4 = [(CarRoutePlanningModeController *)self carAdvisoryDetailCardViewController];
      id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
      id v9 = v5;
      id v6 = &v9;
      goto LABEL_6;
    case 3:
      uint64_t v4 = [(CarRoutePlanningModeController *)self evChargingAvailabilityVC];
      id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
      id v8 = v5;
      id v6 = &v8;
LABEL_6:
      id v2 = +[NSArray arrayWithObjects:v6 count:1];

      break;
    default:
      break;
  }

  return (NSArray *)v2;
}

- (NSArray)carFocusOrderSequences
{
  BOOL v3 = [(CarRoutePlanningModeController *)self chromeViewController];
  uint64_t v4 = [v3 itemRepresentingStatusBanner];
  v23[0] = v4;
  id v5 = [(CarRoutePlanningModeController *)self chromeViewController];
  uint64_t v6 = [v5 itemRepresentingOverlays];
  v23[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v23 count:2];
  id v8 = +[NSMutableArray arrayWithArray:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_advisoryLabel);
  uint64_t v10 = [WeakRetained viewButton];
  LOBYTE(v6) = [v10 isHidden];

  if ((v6 & 1) == 0)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_advisoryLabel);
    unsigned __int8 v12 = [v11 viewButton];
    id v13 = +[CarFocusOrderItem itemWithFocusItem:v12];
    [v8 addObject:v13];
  }
  id v14 = [(CarRoutePlanningModeController *)self chromeViewController];
  id v15 = [v14 itemRepresentingAlternateRoutes];
  v22[0] = v15;
  CFStringRef v16 = +[CarFocusOrderItem itemWithFocusItem:self->_zoomButton];
  v22[1] = v16;
  unint64_t v17 = +[NSArray arrayWithObjects:v22 count:2];
  [v8 addObjectsFromArray:v17];

  uint64_t v18 = +[CarFocusOrderSequence sequenceWithItems:v8 options:5];
  int v21 = v18;
  unsigned int v19 = +[NSArray arrayWithObjects:&v21 count:1];

  return (NSArray *)v19;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (int)backButtonUsageActionToMode:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 2006;
  }
  else {
    return 25;
  }
}

- (int)currentUsageTarget
{
  return 1007;
}

- (void)pptTestStartNavigation
{
  id v2 = [(CarRoutePlanningModeController *)self placeCard];
  [v2 startNavigation];
}

- (void)pptTestEndNavigation
{
  id v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315650;
    uint64_t v6 = "-[CarRoutePlanningModeController pptTestEndNavigation]";
    __int16 v7 = 2080;
    id v8 = "CarRoutePlanningModeController.m";
    __int16 v9 = 1024;
    int v10 = 1702;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v5, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = +[NSThread callStackSymbols];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  id v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315650;
    uint64_t v6 = "-[CarRoutePlanningModeController pptTestTransitionBetweenFullAndLightGuidance]";
    __int16 v7 = 2080;
    id v8 = "CarRoutePlanningModeController.m";
    __int16 v9 = 1024;
    int v10 = 1707;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v5, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = +[NSThread callStackSymbols];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10058C144;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
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

- (CarRoutePlanningModeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarRoutePlanningModeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isOriginalDestination
{
  return self->_isOriginalDestination;
}

- (void)setIsOriginalDestination:(BOOL)a3
{
  self->_isOriginalDestination = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (NSArray)fullSearchResults
{
  return self->_fullSearchResults;
}

- (CarRoutePlanningAdvisoryLabel)advisoryLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_advisoryLabel);

  return (CarRoutePlanningAdvisoryLabel *)WeakRetained;
}

- (void)setAdvisoryLabel:(id)a3
{
}

- (BOOL)zoomToDestination
{
  return self->_zoomToDestination;
}

- (void)setZoomToDestination:(BOOL)a3
{
  self->_BOOL zoomToDestination = a3;
}

- (CarPlaceCardCardViewController)placeCard
{
  return self->_placeCard;
}

- (void)setPlaceCard:(id)a3
{
}

- (BOOL)navigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (int64_t)state
{
  return self->_state;
}

- (CarAdvisoryDetailCardViewController)carAdvisoryDetailCardViewController
{
  return self->_carAdvisoryDetailCardViewController;
}

- (void)setCarAdvisoryDetailCardViewController:(id)a3
{
}

- (CarAdvisoryListCardViewController)carAdvisoryListCardViewController
{
  return self->_carAdvisoryListCardViewController;
}

- (void)setCarAdvisoryListCardViewController:(id)a3
{
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC
{
  return self->_evChargingAvailabilityVC;
}

- (void)setEvChargingAvailabilityVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, 0);
  objc_storeStrong((id *)&self->_carAdvisoryListCardViewController, 0);
  objc_storeStrong((id *)&self->_carAdvisoryDetailCardViewController, 0);
  objc_storeStrong((id *)&self->_placeCard, 0);
  objc_destroyWeak((id *)&self->_advisoryLabel);
  objc_storeStrong((id *)&self->_fullSearchResults, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_unpairedVehicle, 0);
  objc_storeStrong((id *)&self->_originalItem, 0);
  objc_storeStrong((id *)&self->_originalEntry, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_zoomButton, 0);

  objc_storeStrong((id *)&self->_waypointsController, 0);
}

@end