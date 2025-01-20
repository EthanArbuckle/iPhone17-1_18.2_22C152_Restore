@interface BaseModeController
- (ActionCoordination)actionCoordinator;
- (BOOL)canDropPin;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasDroppedPin;
- (BOOL)isShowingSharedTrip:(id)a3;
- (BOOL)mapQuickActionMenuPresenter:(id)a3 shouldBeginOrbGestureForLabelMarkerOnMap:(id)a4;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4;
- (BOOL)shouldResizingCardDimFloatingControls;
- (BOOL)shouldShowAddStopForDirectionsInQuickActionMenuPresenter:(id)a3;
- (BOOL)showsMapView;
- (BOOL)supportsDuplicationInStack;
- (BOOL)usesDefaultTransitions;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsRouteAnnotationsControl;
- (BOOL)wantsSidebarControl;
- (BOOL)wantsStatusBarControl;
- (BOOL)wantsWeatherShowing;
- (BaseModeController)initWithPlatformController:(id)a3;
- (IOSBasedChromeViewController)chromeViewController;
- (MKMapView)mapView;
- (MapQuickActionMenuPresenter)quickActionMenuPresenter;
- (PlaceCardItem)placeCardItemForLookAroundButton;
- (PlatformController)platformController;
- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration;
- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle;
- (StatusBarSupplementaryView)statusBarSupplementaryView;
- (id)containerViewController;
- (id)mapServiceTraitsForQuickActionPresenter:(id)a3;
- (id)personalizedItemSources;
- (id)routeAnnotationsProvider;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)floorOrdinalAtCoordinate:(CLLocationCoordinate2D)a3;
- (int)uiTargetForQuickActionMenu;
- (int64_t)desiredFloatingControls;
- (int64_t)preferredStatusBarStyle;
- (void)_addRecentPlaceForSearchResult:(id)a3;
- (void)_becomeTopContextInChromeViewController:(id)a3;
- (void)_cleanupSharedTripIfNeeded;
- (void)_clearCustomSearchResult;
- (void)_handleFeedbackPreWarmGesture:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_loadExpensiveItemSources;
- (void)_resignTopContextInChromeViewController:(id)a3;
- (void)_setupMapView;
- (void)_setupUserLocationAnnotation;
- (void)_showCustomSearchResult:(id)a3 shouldSelectOnMap:(BOOL)a4;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)cancelQuickActionMenuPresentation:(id)a3;
- (void)createCustomSearchResultForDroppedPinAtCenterPoint;
- (void)createCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 animated:(BOOL)a5;
- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5;
- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7;
- (void)enterPedestrianAR;
- (void)getCurrentSceneTitleWithCompletion:(id)a3;
- (void)mapCameraControllerWillChangeVisibleRect:(id)a3;
- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedDropPinAt:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedViewTransitLinesOnMap:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4;
- (void)quickActionMenuWillPresent:(id)a3;
- (void)removeDroppedPin;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4;
- (void)setMapView:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setQuickActionMenuPresenter:(id)a3;
- (void)showSharedTrip:(id)a3;
- (void)sidebarDidUpdate;
- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)viewReady;
@end

@implementation BaseModeController

- (BaseModeController)initWithPlatformController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BaseModeController;
  v6 = [(BaseModeController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_platformController, a3);
  }

  return v7;
}

- (void)_setupUserLocationAnnotation
{
  v2 = [(BaseModeController *)self chromeViewController];
  id v3 = [v2 userLocationView];

  [v3 setMode:0 animated:1];
}

- (void)setChromeViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    v6 = [(BaseModeController *)self chromeViewController];
    [(ControlContainerViewController *)self->_containerViewController setChromeViewController:v6];

    id v5 = obj;
  }
}

- (void)_loadExpensiveItemSources
{
  if (!self->_includeExpensiveItemSources)
  {
    self->_includeExpensiveItemSources = 1;
    id v3 = [(BaseModeController *)self actionCoordinator];
    id v7 = [v3 suggestionsItemSource];

    if (v7)
    {
      v4 = objc_alloc_init(CalendarItemSource);
      calendarItemSource = self->_calendarItemSource;
      self->_calendarItemSource = v4;

      [(CalendarItemSource *)self->_calendarItemSource excludeItemsFromSource:v7];
      [(CalendarItemSource *)self->_calendarItemSource loadCalendarItems];
      v6 = [(BaseModeController *)self chromeViewController];
      [v6 setNeedsUpdateComponent:@"personalizedItemSources" animated:1];
    }
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010D54;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 addPreparation:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setMapView:(id)a3
{
  id v5 = (MKMapView *)a3;
  mapView = self->_mapView;
  if (mapView != v5)
  {
    v25 = v5;
    [(MKMapView *)mapView removeGestureRecognizer:self->_longPress];
    [(MKMapView *)self->_mapView removeGestureRecognizer:self->_feedbackPreWarmGestureRecognizer];
    objc_storeStrong((id *)&self->_mapView, a3);
    if (!self->_mapView)
    {
      quickActionMenuPresenter = self->_quickActionMenuPresenter;
      if (quickActionMenuPresenter)
      {
        [quickActionMenuPresenter setEnabled:0];
        quickActionMenuPresenter = self->_mapView;
      }
      [quickActionMenuPresenter removeInteraction:self->_dragInteraction];
      mapViewDragSource = self->_mapViewDragSource;
      self->_mapViewDragSource = 0;

      v22 = [(MKMapView *)self->_mapView superview];
      [v22 removeInteraction:self->_dropInteraction];
      goto LABEL_15;
    }
    [(ControlContainerViewController *)self->_containerViewController refreshControls];
    [(BaseModeController *)self _setupMapView];
    id v7 = self->_quickActionMenuPresenter;
    if (!v7)
    {
      id v8 = [[MapQuickActionMenuPresenter alloc] initWithMapView:self->_mapView];
      objc_super v9 = self->_quickActionMenuPresenter;
      self->_quickActionMenuPresenter = v8;

      [(QuickActionMenuPresenter *)self->_quickActionMenuPresenter setDelegate:self];
      id v10 = [(BaseModeController *)self fullscreenViewController];
      [(QuickActionMenuPresenter *)self->_quickActionMenuPresenter setContainerViewController:v10];

      id v7 = self->_quickActionMenuPresenter;
    }
    [(QuickActionMenuPresenter *)v7 setEnabled:1];
    id v11 = +[MapsDragAndDropManager sharedManager];
    unsigned int v12 = [v11 deviceSupportsDragAndDrop];

    id v5 = v25;
    if (v12)
    {
      if (!self->_mapViewDragSource)
      {
        v13 = objc_alloc_init(MapViewDragSource);
        v14 = self->_mapViewDragSource;
        self->_mapViewDragSource = v13;

        [(MapViewDragSource *)self->_mapViewDragSource setMapView:self->_mapView];
        v15 = (UIDragInteraction *)[objc_alloc((Class)UIDragInteraction) initWithDelegate:self->_mapViewDragSource];
        dragInteraction = self->_dragInteraction;
        self->_dragInteraction = v15;

        if (sub_1000BBB44(v25) == 5) {
          [(UIDragInteraction *)self->_dragInteraction _setLiftDelay:0.150000006];
        }
      }
      [(MKMapView *)self->_mapView addInteraction:self->_dragInteraction];
      if (!self->_mapsDragDestinationHandler)
      {
        v17 = objc_alloc_init(MapsDragDestinationHandler);
        mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
        self->_mapsDragDestinationHandler = v17;

        v19 = (UIDropInteraction *)[objc_alloc((Class)UIDropInteraction) initWithDelegate:self->_mapsDragDestinationHandler];
        dropInteraction = self->_dropInteraction;
        self->_dropInteraction = v19;

        v21 = [(BaseModeController *)self actionCoordinator];
        [(MapsDragDestinationHandler *)self->_mapsDragDestinationHandler setDelegate:v21];
      }
      v22 = [(MKMapView *)self->_mapView superview];
      [v22 addInteraction:self->_dropInteraction];
LABEL_15:

      id v5 = v25;
    }
  }
}

- (BOOL)permitsWeatherShowing
{
  v2 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v3 = [v2 isUsingOfflineMaps];

  return v3 ^ 1;
}

- (void)_setupMapView
{
  unsigned __int8 v3 = [(BaseModeController *)self chromeViewController];
  unsigned __int8 v4 = [v3 shouldUseModernMap];

  if ((v4 & 1) == 0)
  {
    mapView = self->_mapView;
    id v6 = [(BaseModeController *)self chromeViewController];
    id v7 = [v6 displayedViewMode];
    int64x2_t v22 = 0u;
    long long v24 = 0u;
    uint64_t v25 = 0;
    _MKCartographicConfigurationDefault();
    int64x2_t v23 = vdupq_n_s64(1uLL);
    *(void *)&long long v24 = 0;
    switch((unint64_t)v7)
    {
      case 1uLL:
        int64x2_t v22 = vdupq_n_s64(1uLL);
        v23.i64[0] = 0;
        break;
      case 2uLL:
        v23.i64[0] = 0;
        int64x2_t v22 = (int64x2_t)1uLL;
        break;
      case 3uLL:
        uint64_t v8 = 4;
        goto LABEL_10;
      case 5uLL:
        int64x2_t v9 = vdupq_n_s64(1uLL);
        goto LABEL_8;
      case 6uLL:
        int64x2_t v9 = (int64x2_t)xmmword_100F67600;
LABEL_8:
        int64x2_t v22 = v9;
        break;
      case 7uLL:
        uint64_t v8 = 2;
LABEL_10:
        v22.i64[1] = v8;
        break;
      default:
        break;
    }
    [(MKMapView *)mapView _setCartographicConfiguration:&v22 animated:0];
  }
  id v10 = [(MKMapView *)self->_mapView _mapLayer];
  [v10 setDesiredMapMode:0];

  id v11 = [(MKMapView *)self->_mapView _mapLayer];
  [v11 setCanonicalSkyHeight:0.0520833321];

  [(MKMapView *)self->_mapView _setCanSelectPOIs:1];
  [(MKMapView *)self->_mapView setScaleEnabled:1];
  [(MKMapView *)self->_mapView _setShowsTrafficIncidents:1];
  [(MKMapView *)self->_mapView setShowsUserLocation:1];
  unsigned int v12 = [(MKMapView *)self->_mapView _longPressGestureRecognizer];
  [v12 setEnabled:0];

  longPress = self->_longPress;
  if (!longPress)
  {
    v14 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleLongPress:"];
    v15 = self->_longPress;
    self->_longPress = v14;

    [(UILongPressGestureRecognizer *)self->_longPress setNumberOfTouchesRequired:1];
    GEOConfigGetDouble();
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPress, "setMinimumPressDuration:");
    GEOConfigGetDouble();
    -[UILongPressGestureRecognizer setAllowableMovement:](self->_longPress, "setAllowableMovement:");
    [(UILongPressGestureRecognizer *)self->_longPress setDelegate:self];
    uint64_t v16 = sub_1000BBB44(self->_mapView);
    longPress = self->_longPress;
    if (v16 == 5)
    {
      [(UILongPressGestureRecognizer *)self->_longPress setAllowableMovement:2.0];
      longPress = self->_longPress;
    }
  }
  [(MKMapView *)self->_mapView addGestureRecognizer:longPress];
  if (self->_feedbackPreWarmGestureRecognizer) {
    goto LABEL_19;
  }
  if (sub_1000BBB44(self->_mapView) != 5)
  {
    v17 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleFeedbackPreWarmGesture:"];
    feedbackPreWarmGestureRecognizer = self->_feedbackPreWarmGestureRecognizer;
    self->_feedbackPreWarmGestureRecognizer = v17;

    [(UILongPressGestureRecognizer *)self->_feedbackPreWarmGestureRecognizer setNumberOfTouchesRequired:1];
    [(UILongPressGestureRecognizer *)self->_feedbackPreWarmGestureRecognizer setMinimumPressDuration:0.25];
    [(UILongPressGestureRecognizer *)self->_feedbackPreWarmGestureRecognizer setDelegate:self];
  }
  if (self->_feedbackPreWarmGestureRecognizer) {
LABEL_19:
  }
    -[MKMapView addGestureRecognizer:](self->_mapView, "addGestureRecognizer:");
  v19 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:1 view:self->_mapView];
  feedbackBehavior = self->_feedbackBehavior;
  self->_feedbackBehavior = v19;

  [(UILongPressGestureRecognizer *)self->_longPress addTarget:self action:"cancelQuickActionMenuPresentation:"];
  v21 = [(MKMapView *)self->_mapView _longPressGestureRecognizer];
  [v21 addTarget:self action:"cancelQuickActionMenuPresentation:"];

  [(MKMapView *)self->_mapView _setAlwaysShowHeadingIndicatorIfSupported:1];
  [(MKMapView *)self->_mapView _setUseBalloonCalloutsForLabels:1];
}

- (id)containerViewController
{
  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    unsigned __int8 v4 = +[UIDevice currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    id v6 = off_1012D3C78;
    if (v5 != (id)5) {
      id v6 = off_1012D2718;
    }
    id v7 = (ControlContainerViewController *)[objc_alloc(*v6) initWithPlatformController:self->_platformController];
    uint64_t v8 = self->_containerViewController;
    self->_containerViewController = v7;

    [(ContainerViewController *)self->_containerViewController setAllowOnlyStandardStyle:0];
    [(ControlContainerViewController *)self->_containerViewController setChromeContext:self];
    int64x2_t v9 = [(ControlContainerViewController *)self->_containerViewController coordinator];
    if (([v9 conformsToProtocol:&OBJC_PROTOCOL___ChromeMapSelectionDelegate] & 1) == 0)
    {
      id v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315906;
        v15 = "-[BaseModeController containerViewController]";
        __int16 v16 = 2080;
        v17 = "BaseModeController.m";
        __int16 v18 = 1024;
        int v19 = 146;
        __int16 v20 = 2080;
        v21 = "[coordinator conformsToProtocol:@protocol(ChromeMapSelectionDelegate)]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
      }

      if (sub_100BB36BC())
      {
        unsigned int v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }

    containerViewController = self->_containerViewController;
  }

  return containerViewController;
}

- (BOOL)showsMapView
{
  return 1;
}

- (ActionCoordination)actionCoordinator
{
  v2 = [(BaseModeController *)self containerViewController];
  unsigned __int8 v3 = [v2 coordinator];

  return (ActionCoordination *)v3;
}

- (BOOL)wantsStatusBarControl
{
  unsigned __int8 v3 = [(ContainerViewController *)self->_containerViewController currentViewController];
  if (v3)
  {
    unsigned __int8 v4 = [(ContainerViewController *)self->_containerViewController currentViewController];
    if (objc_opt_respondsToSelector())
    {
      char v5 = 1;
    }
    else
    {
      id v6 = [(ContainerViewController *)self->_containerViewController currentViewController];
      if (objc_opt_respondsToSelector())
      {
        char v5 = 1;
      }
      else
      {
        id v7 = [(ContainerViewController *)self->_containerViewController currentViewController];
        char v5 = objc_opt_respondsToSelector();
      }
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5 & 1;
}

- (BOOL)wantsLookAroundShowing
{
  if (![(BaseModeController *)self permitsLookAroundShowing]) {
    return 0;
  }
  unsigned __int8 v3 = [(BaseModeController *)self actionCoordinator];
  unsigned __int8 v4 = [v3 isRoutePlanningPresented];

  if ((v4 & 1) != 0
    || ([(ControlContainerViewController *)self->_containerViewController floatingControlsOptions] & 0x80) == 0)
  {
    return 0;
  }
  if ([(MKMapView *)self->_mapView _lookAroundAvailability] == (id)2) {
    return 1;
  }
  id v7 = [(BaseModeController *)self placeCardItemForLookAroundButton];
  uint64_t v8 = [v7 mapItem];
  BOOL v5 = v8 != 0;

  return v5;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  return (StatusBarBackgroundViewStyle *)[(ControlContainerViewController *)self->_containerViewController statusBarBackgroundViewStyle];
}

- (BOOL)shouldResizingCardDimFloatingControls
{
  v2 = [(BaseModeController *)self containerViewController];
  unsigned __int8 v3 = [v2 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)routeAnnotationsProvider
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  if (sub_1000BBB44(WeakRetained) == 5)
  {
    id v5 = objc_loadWeakRetained((id *)p_chromeViewController);
    id v6 = [v5 sharedTripsAnnotationsController];
    id v7 = [v6 sharedTrip];

    if (v7)
    {
      uint64_t v8 = objc_loadWeakRetained((id *)p_chromeViewController);
      uint64_t v9 = [v8 sharedTripsAnnotationsController];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v8 = [(BaseModeController *)self actionCoordinator];
  uint64_t v9 = [v8 routeAnnotationsProvider];
LABEL_6:
  id v10 = (void *)v9;

  return v10;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  v2 = objc_alloc_init(RouteAnnotationsConfiguration);

  return v2;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(ContainerViewController *)self->_containerViewController currentViewController];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = [v2 prefersStatusBarHidden];
  }
  else
  {
    unsigned __int8 v4 = +[UIDevice currentDevice];
    if ([v4 userInterfaceIdiom] == (id)1)
    {
      unsigned __int8 v3 = 0;
    }
    else
    {
      id v5 = +[UIDevice currentDevice];
      if ([v5 userInterfaceIdiom] == (id)5)
      {
        unsigned __int8 v3 = 0;
      }
      else
      {
        id v6 = [v2 traitCollection];
        unsigned __int8 v3 = [v6 verticalSizeClass] == (id)1;
      }
    }
  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(ContainerViewController *)self->_containerViewController currentViewController];
  if (objc_opt_respondsToSelector()) {
    id v3 = [v2 preferredStatusBarStyle];
  }
  else {
    id v3 = 0;
  }

  return (int64_t)v3;
}

- (id)personalizedItemSources
{
  id v3 = [(BaseModeController *)self chromeViewController];
  unsigned __int8 v4 = [v3 searchPinsManager];

  if (v4)
  {
    if (!self->_collectionPlaceItemSource || !self->_parkedCarItemSource)
    {
      id v5 = objc_alloc_init(PersonalizedCollectionPlaceItemSource);
      collectionPlaceItemSource = self->_collectionPlaceItemSource;
      self->_collectionPlaceItemSource = v5;

      id v7 = objc_alloc_init(ParkedCarItemSource);
      parkedCarItemSource = self->_parkedCarItemSource;
      self->_parkedCarItemSource = v7;
    }
    if (+[LibraryUIUtilities isMyPlacesEnabled]
      && !self->_favoritePlaceItemSource)
    {
      uint64_t v9 = objc_alloc_init(_TtC4Maps30PersonalizedFavoriteItemSource);
      favoritePlaceItemSource = self->_favoritePlaceItemSource;
      self->_favoritePlaceItemSource = v9;
    }
    id v11 = objc_alloc((Class)NSMutableArray);
    unsigned int v12 = [v4 searchResultsItemSource];
    v13 = [v4 singleSearchResultItemSource];
    int v14 = [v4 droppedPinsItemSource];
    v15 = [v4 collectionPinsItemSource];
    __int16 v16 = [v4 routeStartEndItemSource];
    v17 = [v4 placeCardLinkedPlacesItemSource];
    __int16 v18 = [v4 searchDotPlacesItemSource];
    id v19 = [v11 initWithObjects:v12, v13, v14, v15, v16, v17, v18, self->_collectionPlaceItemSource, self->_parkedCarItemSource, 0];

    if (self->_favoritePlaceItemSource) {
      [v19 addObject:];
    }
    __int16 v20 = objc_alloc_init(TrafficIncidentItemSource);
    [v19 addObject:v20];

    if (self->_includeExpensiveItemSources)
    {
      v21 = [(BaseModeController *)self actionCoordinator];
      int64x2_t v22 = [v21 suggestionsItemSource];

      if (v22) {
        [v19 addObject:v22];
      }
      if (self->_calendarItemSource) {
        [v19 addObject:];
      }
    }
    id v23 = [v19 copy];
  }
  else
  {
    id v23 = &__NSArray0__struct;
  }

  return v23;
}

- (int64_t)desiredFloatingControls
{
  v2 = [(BaseModeController *)self containerViewController];
  int64_t v3 = (int64_t)[v2 floatingControlsOptions];

  if (v3)
  {
    if (+[MapsTapToRadarExtras shouldEnableTTRButton]
      && GEOConfigGetBOOL())
    {
      v3 |= 0x200uLL;
    }
    unsigned __int8 v4 = +[GEOPlatform sharedPlatform];
    if ([v4 isInternalInstall] && MapsFeature_IsAvailable_SSAO())
    {
      int BOOL = GEOConfigGetBOOL();

      if (BOOL) {
        return v3 | 0x400;
      }
    }
    else
    {
    }
  }
  return v3;
}

- (void)_becomeTopContextInChromeViewController:(id)a3
{
  id v24 = a3;
  [(BaseModeController *)self _setupUserLocationAnnotation];
  +[UIFont setPlacecardShouldUseSmallFont:_MKPlaceCardUseSmallerFont()];
  unsigned __int8 v4 = [v24 previousTopContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    $2AEA816EAF9616B0E64737FB4BB06332 v6 = ($2AEA816EAF9616B0E64737FB4BB06332)MKCoordinateRegionInvalid[1];
    self->_previousRegion.center = (CLLocationCoordinate2D)MKCoordinateRegionInvalid[0];
    self->_previousRegion.span = v6;
  }
  id v7 = [(BaseModeController *)self chromeViewController];
  uint64_t v8 = [v7 mapView];
  [(BaseModeController *)self setMapView:v8];

  if ([v24 hasDuplicatesOfContext:self]) {
    goto LABEL_4;
  }
  v15 = [v24 previousTopContext];
  if (sub_1000BBF90((uint64_t)v15, (Protocol *)&OBJC_PROTOCOL___IOSBasedChromeContext))
  {
    __int16 v16 = [v24 previousTopContext];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      __int16 v18 = [v24 previousTopContext];
      unsigned int v19 = [v18 shouldResetStateAfterResigning];

      if (!v19)
      {
LABEL_4:
        $2AEA816EAF9616B0E64737FB4BB06332 v9 = ($2AEA816EAF9616B0E64737FB4BB06332)MKCoordinateRegionInvalid[1];
        self->_previousRegion.center = (CLLocationCoordinate2D)MKCoordinateRegionInvalid[0];
        self->_previousRegion.span = v9;
        goto LABEL_5;
      }
    }
  }
  else
  {
  }
  [(ControlContainerViewController *)self->_containerViewController resetState];
  double longitude = self->_previousRegion.center.longitude;
  if (longitude >= -180.0 && longitude <= 180.0)
  {
    double latitude = self->_previousRegion.center.latitude;
    if (latitude >= -90.0 && latitude <= 90.0)
    {
      double latitudeDelta = self->_previousRegion.span.latitudeDelta;
      if (latitudeDelta >= 0.0 && latitudeDelta <= 180.0)
      {
        double longitudeDelta = self->_previousRegion.span.longitudeDelta;
        if (longitudeDelta >= 0.0 && longitudeDelta <= 360.0 && longitudeDelta > 0.0) {
          -[MKMapView setRegion:animated:](self->_mapView, "setRegion:animated:", 1);
        }
      }
    }
  }
LABEL_5:
  id v10 = [(BaseModeController *)self chromeViewController];
  id v11 = [v10 customSearchManager];
  [v11 addObserver:self];

  unsigned int v12 = [(BaseModeController *)self chromeViewController];
  v13 = [v12 mapCameraController];
  [v13 addObserver:self];

  int v14 = [(BaseModeController *)self chromeViewController];
  [v14 updateMapViewDisplayOptions];
}

- (BOOL)permitsLookAroundShowing
{
  int64_t v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v4 = [v3 isUsingOfflineMaps];

  if (v4) {
    return 0;
  }
  $2AEA816EAF9616B0E64737FB4BB06332 v6 = [(BaseModeController *)self chromeViewController];
  if (v6)
  {
    id v7 = [(BaseModeController *)self chromeViewController];
    BOOL v5 = sub_1000BBB44(v7) != 5;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (BOOL)wantsWeatherShowing
{
  LODWORD(v3) = [(BaseModeController *)self permitsWeatherShowing];
  if (v3) {
    return ((unint64_t)[(ControlContainerViewController *)self->_containerViewController floatingControlsOptions] >> 3) & 1;
  }
  return v3;
}

- (void)viewReady
{
}

- (BOOL)supportsDuplicationInStack
{
  return 1;
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  return (StatusBarSupplementaryView *)[(ControlContainerViewController *)self->_containerViewController statusBarSupplementaryView];
}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(BaseModeController *)self actionCoordinator];
  [v6 updateViewMode:a3 animated:v4];
}

- (void)sidebarDidUpdate
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(BaseModeController *)self chromeViewController];
  id v7 = [v8 customSearchManager];
  [v7 setCustomSearchResult:v6 animated:v4 shouldSelectOnMap:self->_mapView];
}

- (void)_showCustomSearchResult:(id)a3 shouldSelectOnMap:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(BaseModeController *)self chromeViewController];
  id v7 = [v6 searchPinsManager];
  id v8 = v7;
  if (v10)
  {
    [v7 setDroppedPin:v10 animated:1 shouldSelect:v4];

    id v6 = +[CustomLocationManager sharedManager];
    id v8 = [(BaseModeController *)self actionCoordinator];
    id v9 = [v8 newTraits];
    [v6 processSearchResult:v10 traits:v9];
  }
  else
  {
    [v7 clearDroppedPin];
  }
}

- (BOOL)hasDroppedPin
{
  v2 = [(BaseModeController *)self chromeViewController];
  BOOL v3 = [v2 searchPinsManager];
  BOOL v4 = [v3 droppedPin];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)removeDroppedPin
{
  BOOL v3 = [(BaseModeController *)self chromeViewController];
  BOOL v4 = [v3 searchPinsManager];
  id v6 = [v4 droppedPin];

  if (v6)
  {
    BOOL v5 = [(BaseModeController *)self actionCoordinator];
    [v5 viewController:0 removeDroppedPin:v6];
  }
}

- (void)_clearCustomSearchResult
{
  BOOL v3 = [(BaseModeController *)self chromeViewController];
  BOOL v4 = [v3 customSearchManager];
  id v5 = [v4 customSearchResult];

  if (v5) {
    [(BaseModeController *)self setCustomSearchResult:0 animated:0];
  }
}

- (void)createCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  [(BaseModeController *)self _clearCustomSearchResult];
  +[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", v6, latitude, longitude);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setHasIncompleteMetadata:1];
  [(BaseModeController *)self setCustomSearchResult:v10 animated:v5];
}

- (void)createCustomSearchResultForDroppedPinAtCenterPoint
{
  if ([(BaseModeController *)self canDropPin])
  {
    [(MKMapView *)self->_mapView centerCoordinate];
    -[BaseModeController createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:](self, "createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:", -[BaseModeController floorOrdinalAtCoordinate:](self, "floorOrdinalAtCoordinate:"), 1, v3, v4);
    id v5 = +[MKMapService sharedService];
    [v5 captureUserAction:1030 onTarget:0 eventValue:0];
  }
}

- (BOOL)canDropPin
{
  v2 = [(BaseModeController *)self actionCoordinator];
  double v3 = [v2 currentViewController];

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 allowsLongPressToMarkLocation];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)showSharedTrip:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    p_chromeViewController = &self->_chromeViewController;
    id WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
    uint64_t v6 = [WeakRetained sharedTripsAnnotationsController];
    [v6 setSharedTrip:v9];

    id v7 = objc_loadWeakRetained((id *)p_chromeViewController);
    id v8 = [v7 sharedTripsAnnotationsController];
    [v8 setActive:1];
  }
  else
  {
    [(BaseModeController *)self _cleanupSharedTripIfNeeded];
  }
}

- (BOOL)isShowingSharedTrip:(id)a3
{
  unsigned __int8 v4 = [a3 groupIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  uint64_t v6 = [WeakRetained sharedTripsAnnotationsController];
  id v7 = [v6 sharedTrip];
  id v8 = [v7 groupIdentifier];

  unsigned __int8 v9 = 0;
  if (v4 && v8) {
    unsigned __int8 v9 = [v4 isEqualToString:v8];
  }

  return v9;
}

- (void)_cleanupSharedTripIfNeeded
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unsigned __int8 v4 = [WeakRetained sharedTripsAnnotationsController];
  [v4 setActive:0];

  id v6 = objc_loadWeakRetained((id *)p_chromeViewController);
  id v5 = [v6 sharedTripsAnnotationsController];
  [v5 setSharedTrip:0];
}

- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7
{
  -[BaseModeController _showCustomSearchResult:shouldSelectOnMap:](self, "_showCustomSearchResult:shouldSelectOnMap:", a4, self->_mapView == a6, a5);
}

- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5
{
  if (a5) {
    [(BaseModeController *)self _showCustomSearchResult:a4 shouldSelectOnMap:0];
  }
}

- (void)mapCameraControllerWillChangeVisibleRect:(id)a3
{
  id v3 = [(BaseModeController *)self actionCoordinator];
  [v3 setUserTrackingViewUserTrackingMode:0];
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v7 = [WeakRetained sharedTripsAnnotationsController];
  unsigned __int8 v8 = [v7 automaticallyRecenters];

  if ((v8 & 1) == 0)
  {
    id v10 = objc_loadWeakRetained((id *)p_chromeViewController);
    unsigned __int8 v9 = [v10 sharedTripsAnnotationsController];
    [v9 setAutomaticallyRecenter:0];
  }
}

- (void)cancelQuickActionMenuPresentation:(id)a3
{
  if ([a3 state] == (id)1)
  {
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    [(QuickActionMenuPresenter *)quickActionMenuPresenter cancelPresentationGesture];
  }
}

- (int)floorOrdinalAtCoordinate:(CLLocationCoordinate2D)a3
{
  VKLocationCoordinate2DMake();
  double v5 = v4;
  double v7 = v6;
  unsigned __int8 v8 = [(MKMapView *)self->_mapView _mapLayer];
  unsigned __int8 v9 = [v8 venueAtLocation:v5, v7];

  if (v9) {
    int v10 = [(MKMapView *)self->_mapView displayedFloorOrdinalForBuildingsInVenue:v9];
  }
  else {
    int v10 = 0x7FFFFFFF;
  }

  return v10;
}

- (void)_handleLongPress:(id)a3
{
  id v7 = a3;
  if ([(BaseModeController *)self canDropPin])
  {
    if ([v7 state] == (id)1)
    {
      [v7 locationInView:self->_mapView];
      -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", self->_mapView);
      if (v5 >= -180.0 && v5 <= 180.0 && v4 >= -90.0 && v4 <= 90.0)
      {
        -[BaseModeController createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:](self, "createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:", -[BaseModeController floorOrdinalAtCoordinate:](self, "floorOrdinalAtCoordinate:", v4, v5), 1, v4, v5);
        [(UIImpactFeedbackGenerator *)self->_feedbackBehavior impactOccurredWithIntensity:1.0];
        double v6 = +[MKMapService sharedService];
        [v6 captureUserAction:1030 onTarget:0 eventValue:0];
      }
    }
  }
}

- (void)_handleFeedbackPreWarmGesture:(id)a3
{
  if ([a3 state] == (id)1)
  {
    feedbackBehavior = self->_feedbackBehavior;
    [(UIImpactFeedbackGenerator *)feedbackBehavior prepare];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  [a4 locationInView:self->_mapView];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned __int8 v9 = [(MKMapView *)self->_mapView subviews];
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v14 frame];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        [(MKMapView *)self->_mapView bounds];
        v37.origin.x = v23;
        v37.origin.y = v24;
        v37.size.width = v25;
        v37.size.height = v26;
        v35.origin.x = v16;
        v35.origin.y = v18;
        v35.size.width = v20;
        v35.size.height = v22;
        if (!CGRectEqualToRect(v35, v37))
        {
          [v14 frame];
          v34.x = v6;
          v34.y = v8;
          if (CGRectContainsPoint(v36, v34))
          {
            BOOL v27 = 0;
            goto LABEL_12;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v27 = 1;
LABEL_12:

  return v27;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  CGFloat v6 = (UILongPressGestureRecognizer *)a4;
  double v7 = v6;
  longPress = self->_longPress;
  feedbackPreWarmGestureRecognizer = self->_feedbackPreWarmGestureRecognizer;
  BOOL v11 = feedbackPreWarmGestureRecognizer != a3 && feedbackPreWarmGestureRecognizer != v6;
  BOOL v13 = longPress == a3 || longPress == v6;
  id v14 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();
  }
  if (v11 || !v13)
  {
    BOOL v17 = sub_1000BBB44(self->_mapView) == 5 && v13;
    char v18 = v17 & v16;
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (void)enterPedestrianAR
{
  id v2 = [(BaseModeController *)self actionCoordinator];
  [v2 enterPedestrianAR];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005D1EB8;
  v9[3] = &unk_1012E9258;
  void v9[4] = self;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 addPreparation:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_resignTopContextInChromeViewController:(id)a3
{
  id v14 = a3;
  mapView = self->_mapView;
  if (mapView)
  {
    [(MKMapView *)mapView bounds];
    if (!CGRectIsEmpty(v16))
    {
      [(MKMapView *)self->_mapView region];
      self->_previousRegion.center.double latitude = v5;
      self->_previousRegion.center.double longitude = v6;
      self->_previousRegion.span.double latitudeDelta = v7;
      self->_previousRegion.span.double longitudeDelta = v8;
    }
  }
  +[UIFont setPlacecardShouldUseSmallFont:0];
  [(BaseModeController *)self setMapView:0];
  unsigned __int8 v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:off_1015E5428 object:0];

  id v10 = [(BaseModeController *)self chromeViewController];
  id v11 = [v10 customSearchManager];
  [v11 removeObserver:self];

  uint64_t v12 = [(BaseModeController *)self chromeViewController];
  BOOL v13 = [v12 mapCameraController];
  [v13 addObserver:self];
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BaseModeController *)self actionCoordinator];
  [v5 getCurrentSceneTitleWithCompletion:v4];
}

- (BOOL)mapQuickActionMenuPresenter:(id)a3 shouldBeginOrbGestureForLabelMarkerOnMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (!v7)
  {
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  if (![v7 isTransitLine])
  {
    if (([v8 isFlyoverTour] & 1) == 0
      && ([v8 isTrafficIncident] & 1) == 0
      && ([v8 isOneWayArrow] & 1) == 0
      && ([v8 isRouteAnnotation] & 1) == 0
      && ([v8 isCluster] & 1) == 0)
    {
      unsigned int v12 = [v8 featureType];
      if (v12 - 5 < 2 || v12 == 3 && ([v8 businessID] || !objc_msgSend(v8, "featureID")))
      {
        LOBYTE(v10) = 1;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  unsigned __int8 v9 = [(BaseModeController *)self actionCoordinator];
  unsigned int v10 = [v9 isRoutePlanningPresented] ^ 1;

LABEL_10:
  return v10;
}

- (BOOL)wantsSidebarControl
{
  return 1;
}

- (int)uiTargetForQuickActionMenu
{
  return 0;
}

- (BOOL)shouldShowAddStopForDirectionsInQuickActionMenuPresenter:(id)a3
{
  id v3 = [(BaseModeController *)self actionCoordinator];
  unsigned __int8 v4 = [v3 shouldAddStopInRoutePlanning];

  return v4;
}

- (void)_addRecentPlaceForSearchResult:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = v3;
  if (v3)
  {
    double v8 = v3;
    unsigned __int8 v5 = [v3 isHomeOrWork];
    unsigned __int8 v4 = v8;
    if ((v5 & 1) == 0)
    {
      id v6 = [v8 mapItem];
      id v7 = [v8 searchToSupersedeIfRecordedInHistory];
      +[HistoryEntryRecentsItem saveMapItem:v6 superseedUUID:v7];

      unsigned __int8 v4 = v8;
    }
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  id v5 = a3;
  id v6 = [v5 searchResult];
  if (v6)
  {
    id v7 = [v5 isAdditionalStop];
    double v8 = objc_alloc_init(SearchFieldItem);
    unsigned __int8 v9 = v8;
    if (v7)
    {
      [(SearchFieldItem *)v8 setSearchResult:v6];
      CGFloat v20 = v9;
      unsigned int v10 = +[NSArray arrayWithObjects:&v20 count:1];
    }
    else
    {
      id v11 = +[SearchResult currentLocationSearchResult];
      [(SearchFieldItem *)v9 setSearchResult:v11];

      unsigned int v12 = objc_alloc_init(SearchFieldItem);
      [(SearchFieldItem *)v12 setSearchResult:v6];
      v19[0] = v9;
      v19[1] = v12;
      unsigned int v10 = +[NSArray arrayWithObjects:v19 count:2];
    }
    BOOL v13 = [[DirectionItem alloc] initWithItems:v10 transportType:0];
    id v14 = +[NSNumber numberWithBool:v7, @"DirectionsSessionInitiatorKey", @"AppendDirectionItem", &off_1013A7B70];
    v18[1] = v14;
    double v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:2];

    CGRect v16 = [(BaseModeController *)self actionCoordinator];
    [v16 viewController:0 doDirectionItem:v13 withUserInfo:v15];

    [(BaseModeController *)self _addRecentPlaceForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  id v6 = [a3 searchResult];
  if (v6)
  {
    id v5 = [(BaseModeController *)self actionCoordinator];
    [v5 viewController:0 doAudioCallToSearchResult:v6];

    [(BaseModeController *)self _addRecentPlaceForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  id v6 = [a3 searchResult];
  if (v6)
  {
    id v5 = [(BaseModeController *)self actionCoordinator];
    [v5 viewController:0 openWebsiteForSearchResult:v6];

    [(BaseModeController *)self _addRecentPlaceForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005D26E8;
  v13[3] = &unk_1012F15D8;
  v13[4] = self;
  id v4 = a3;
  id v5 = objc_retainBlock(v13);
  id v6 = [v4 searchResult];

  id v7 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v8 = [v7 isAuthorizedForPreciseLocation];

  if (v8)
  {
    ((void (*)(void *, void *))v5[2])(v5, v6);
  }
  else
  {
    unsigned __int8 v9 = +[MKMapService sharedService];
    [v9 captureUserAction:56 onTarget:690 eventValue:0];

    unsigned int v10 = +[MKLocationManager sharedLocationManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1005D27A4;
    v11[3] = &unk_1012E76C0;
    unsigned int v12 = v5;
    [v10 requestTemporaryPreciseLocationAuthorizationWithPurposeKey:@"AppInfoTemporaryPreciseLocationAuthorizationForShareLocationPurposeKey" completion:v11];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  id v12 = [a3 searchResult];
  id v5 = [(QuickActionMenuPresenter *)self->_quickActionMenuPresenter labelMarker];

  if (v5)
  {
    id v6 = [(BaseModeController *)self actionCoordinator];
    id v7 = [v6 mapSelectionManager];
    unsigned __int8 v8 = [(QuickActionMenuPresenter *)self->_quickActionMenuPresenter labelMarker];
    [v7 selectLabelMarker:v8 animated:1];

    [(BaseModeController *)self _addRecentPlaceForSearchResult:v12];
  }
  else
  {
    unsigned __int8 v9 = [(MapQuickActionMenuPresenter *)self->_quickActionMenuPresenter annotation];

    if (v9)
    {
      mapView = self->_mapView;
      id v11 = [(MapQuickActionMenuPresenter *)self->_quickActionMenuPresenter annotation];
      [(MKMapView *)mapView selectAnnotation:v11 animated:1];
    }
  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  unsigned __int8 v9 = [(BaseModeController *)self actionCoordinator];
  unsigned int v10 = [v9 currentViewController];

  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v10 allowsQuickActionMenuInMap])
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    -[MKMapView convertPoint:fromView:](self->_mapView, "convertPoint:fromView:", v8, x, y);
    id v11 = -[MKMapView _labelMarkerAtPoint:](self->_mapView, "_labelMarkerAtPoint:");
    unsigned int v12 = [v11 isFlyoverTour] ^ 1;
  }
  return v12;
}

- (id)mapServiceTraitsForQuickActionPresenter:(id)a3
{
  id v3 = [(BaseModeController *)self actionCoordinator];
  id v4 = [v3 newTraits];

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  id v6 = [a3 searchResult];
  if (v6)
  {
    id v5 = [(BaseModeController *)self actionCoordinator];
    [v5 viewController:0 removeDroppedPin:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewTransitLinesOnMap:(id)a4
{
  id v5 = a4;
  id v7 = [(BaseModeController *)self actionCoordinator];
  id v6 = [v7 mapSelectionManager];
  [v6 selectLabelMarker:v5 animated:1];
}

- (void)quickActionMenuWillPresent:(id)a3
{
  if ([(UILongPressGestureRecognizer *)self->_longPress isEnabled])
  {
    [(UILongPressGestureRecognizer *)self->_longPress setEnabled:0];
    [(UILongPressGestureRecognizer *)self->_longPress setEnabled:1];
  }
  id v4 = [(MKMapView *)self->_mapView _longPressGestureRecognizer];
  unsigned int v5 = [v4 isEnabled];

  if (v5)
  {
    id v6 = [(MKMapView *)self->_mapView _longPressGestureRecognizer];
    [v6 setEnabled:0];

    id v7 = [(MKMapView *)self->_mapView _longPressGestureRecognizer];
    [v7 setEnabled:1];
  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5 = a4;
  id v6 = [(BaseModeController *)self actionCoordinator];
  id v7 = [v6 venuesManager];
  id v8 = [v5 mapItem];

  LOBYTE(v5) = [v7 isUserAtSameVenueAsMapItem:v8] ^ 1;
  return (char)v5;
}

- (void)quickActionMenuPresenter:(id)a3 selectedDropPinAt:(id)a4
{
}

- (int)currentUITargetForAnalytics
{
  id v2 = [(BaseModeController *)self mapViewDelegate];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate])
  {
    id v3 = v2;
    if (objc_opt_respondsToSelector()) {
      int v4 = [v3 currentUITargetForAnalytics];
    }
    else {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  id v2 = [(BaseModeController *)self mapViewDelegate];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate])
  {
    id v3 = v2;
    if (objc_opt_respondsToSelector()) {
      int v4 = [v3 currentMapViewTargetForAnalytics];
    }
    else {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (PlaceCardItem)placeCardItemForLookAroundButton
{
  id v3 = [(BaseModeController *)self actionCoordinator];
  unsigned __int8 v4 = [v3 isRoutePlanningPresented];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(BaseModeController *)self actionCoordinator];
    id v7 = [v6 currentPlaceCardItem];

    id v8 = [v7 mapItem];
    unsigned __int8 v9 = v8;
    if (v8
      && (([v8 _hasLookAroundStorefront] & 1) != 0
       || +[LookAroundButtonContainerViewController isIncompleteMapItem:v9]))
    {
      id v5 = v7;
    }
    else
    {
      id v5 = 0;
    }
  }

  return (PlaceCardItem *)v5;
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (MapQuickActionMenuPresenter)quickActionMenuPresenter
{
  return self->_quickActionMenuPresenter;
}

- (void)setQuickActionMenuPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_cachedViewControllers, 0);
  objc_storeStrong((id *)&self->_mapsDragDestinationHandler, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_mapViewDragSource, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_feedbackBehavior, 0);
  objc_storeStrong((id *)&self->_feedbackPreWarmGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_parkedCarItemSource, 0);
  objc_storeStrong((id *)&self->_favoritePlaceItemSource, 0);
  objc_storeStrong((id *)&self->_collectionPlaceItemSource, 0);
  objc_storeStrong((id *)&self->_calendarItemSource, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end