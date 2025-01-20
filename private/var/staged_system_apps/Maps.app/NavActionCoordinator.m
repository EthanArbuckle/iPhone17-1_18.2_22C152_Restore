@interface NavActionCoordinator
- (AppCoordinator)appCoordinator;
- (BOOL)canEnterPedestrianAR;
- (BOOL)canPresentRapFeedbackView;
- (BOOL)chromeDidClearMapSelection;
- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3;
- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3;
- (BOOL)chromeDidSelectETAMarkerForRoute:(id)a3;
- (BOOL)chromeDidSelectLabelMarker:(id)a3;
- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3;
- (BOOL)chromeDidSelectRouteAnnotations:(id)a3;
- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5;
- (BOOL)chromeDidSelectTransitLineMarker:(id)a3;
- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3;
- (BOOL)isControllingVoiceVolume;
- (BOOL)isDisplayingIncidentReporting;
- (BOOL)isDisplayingTrafficIncident;
- (BOOL)isNavCameraPanned;
- (BOOL)isNavCameraZoomed;
- (BOOL)isPedestrianARActive;
- (BOOL)isPedestrianARShowingFailureView;
- (BOOL)isSearchingAlongTheRoute;
- (BOOL)isShowingFullScreenDirectionsList;
- (BOOL)isTeachableMomentCardActive;
- (BOOL)isWeatherPopoverActive;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (BOOL)pptTestCanUpdateTrayLayout;
- (BOOL)pptTestIsTrayType:(int64_t)a3;
- (BOOL)shouldShowNavRecenterButton;
- (CustomPOIsController)customPOIsController;
- (GEOMapServiceTraits)newTraits;
- (GuidanceObserver)guidanceObserver;
- (MapSelectionManager)mapSelectionManager;
- (MapViewZoomController)mapViewZoomController;
- (MapViewZoomDelegate)mapViewZoomDelegate;
- (NavActionCoordinator)initWithMapItemDisplayer:(id)a3 navigationDisplay:(id)a4 guidanceObserver:(id)a5 navigationCameraModeController:(id)a6 rapNavigationTracker:(id)a7;
- (NavContainerViewController)containerViewController;
- (NavTrafficIncidentContaineeViewController)trafficIncidentViewController;
- (NavTrafficIncidentCoordinator)navTrafficIncidentCoordinator;
- (NavTrayViewController)navigationTrayContaineeViewController;
- (NavigationCameraModeControlling)navigationCameraModeController;
- (NavigationDisplay)navigationDisplay;
- (NavigationMapItemDisplaying)mapItemDisplayer;
- (NavigationRouteDetouring)routeDetourer;
- (NavigationRouteHistoryInfoProviding)routeInfoProvider;
- (PlaceCardViewController)placecardViewController;
- (RAPNavigationTracker)rapNavigationTracker;
- (RouteAnnotationContaineeViewController)routeAnnotationViewController;
- (SearchInfo)currentSearchInfo;
- (SearchSessionManager)searchSessionManager;
- (SearchViewController)searchHomeViewController;
- (SimpleResultsViewController)simpleResultsViewController;
- (UIScrollView)pptTestScrollView;
- (double)mapViewYaw;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)displayedViewMode;
- (int64_t)excludedContentForMapItem:(id)a3;
- (int64_t)navigationTransportType;
- (unint64_t)activeSharingCount;
- (unint64_t)currentMapViewZoom;
- (unint64_t)defaultContaineeViewControllerType;
- (unint64_t)defaultMapViewZoom;
- (unint64_t)lowGuidanceUserPreferredHeadingOverride;
- (unint64_t)navigationCameraHeadingOverride;
- (unint64_t)navigationCameraMode;
- (void)_presentTrayWithDefaultLayout:(BOOL)a3 animated:(BOOL)a4;
- (void)_toggleCameraHeadingIfNeeded;
- (void)_willDismissNavMode;
- (void)categoryList:(id)a3 selectedSearchCategory:(id)a4;
- (void)clearSearch;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)detourToMapItem:(id)a3;
- (void)detourToWaypoint:(id)a3;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4;
- (void)dismissAddStop;
- (void)dismissAddStopAnimated:(BOOL)a3;
- (void)dismissCategoryList:(id)a3;
- (void)dismissIncidentReportingViewController:(id)a3;
- (void)dismissModalContainee;
- (void)dismissPedestrianARTeachableMomentCardIfNecessary;
- (void)dismissPlacecard;
- (void)dismissReportAnIncident;
- (void)dismissReportAnIncidentAnimated:(BOOL)a3;
- (void)dismissSearchAlongRoute;
- (void)dismissShareETA;
- (void)dismissTrafficIncidentViewController:(id)a3;
- (void)dismissTray;
- (void)dismissVoiceVolumeControl;
- (void)dismissVoiceVolumeControlAnimated:(BOOL)a3;
- (void)dismissVoiceVolumeControlViewController:(id)a3;
- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4;
- (void)displayIncidentReporting;
- (void)displayVoiceVolumeControl;
- (void)enterPedestrianAR;
- (void)exitPedestrianAR;
- (void)handleSearchActionUsingSearchFieldItem:(id)a3 withUserInfo:(id)a4;
- (void)hideJunctionViewIfNeeded;
- (void)incidentReportSubmissionContaineeDidFinish:(id)a3;
- (void)incidentReportingViewController:(id)a3 selectedTrafficIncidentItem:(id)a4 atLocation:(id)a5;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didUpdateYaw:(double)a4;
- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraHasStartedPanning:(id)a3;
- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3;
- (void)mapViewZoomController:(id)a3 didChangeMapViewZoom:(unint64_t)a4;
- (void)openShareETAController;
- (void)pauseNavigation;
- (void)personalizedItemSourceDidChangeItems:(id)a3;
- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5;
- (void)placeCardViewController:(id)a3 openURL:(id)a4;
- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4;
- (void)pptTestEndNavigation;
- (void)pptTestTransitionBetweenFullAndLightGuidance;
- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4;
- (void)presentAddStopUsingCategories:(id)a3;
- (void)presentPlacecardViewController;
- (void)presentSearchAlongTheRouteResults;
- (void)presentSearchAlongTheRouteWithViewModel:(id)a3;
- (void)presentSimpleResultsViewController;
- (void)presentTrafficIncidentViewController:(id)a3 completion:(id)a4;
- (void)presentTray;
- (void)presentWithContainerViewController:(id)a3;
- (void)pressedEndWithSender:(id)a3;
- (void)pressedEndWithSender:(id)a3 feedback:(unint64_t)a4;
- (void)pressedShowDirectionsListWithSender:(id)a3;
- (void)pressedShowOverviewWithSender:(id)a3;
- (void)pressedZoomToManeuverWithSender:(id)a3;
- (void)recenterNavigation;
- (void)repeatGuidanceInstruction;
- (void)resetMapViewZoomToDefaultAndStartCameraTracking:(BOOL)a3;
- (void)resumeNavigation;
- (void)searchResultTableViewCellDidTapActionButton:(id)a3;
- (void)selectMapItem:(id)a3 shouldRemoveResults:(BOOL)a4;
- (void)sendOtherEVStationsRequest:(unint64_t)a3;
- (void)sender:(id)a3 switchToNavigationCameraMode:(unint64_t)a4;
- (void)senderOpenListStep:(id)a3 fullscreen:(BOOL)a4;
- (void)senderShareNavigation:(id)a3;
- (void)setAppCoordinator:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setCurrentSearchInfo:(id)a3;
- (void)setCurrentSearchInfo:(id)a3 error:(id)a4;
- (void)setCustomPOIsController:(id)a3;
- (void)setDefaultContaineeViewControllerType:(unint64_t)a3;
- (void)setDefaultMapViewZoom:(unint64_t)a3;
- (void)setDisplayingTrafficIncident:(BOOL)a3;
- (void)setLowGuidanceUserPreferredHeadingOverride:(unint64_t)a3;
- (void)setMapItemDisplayer:(id)a3;
- (void)setMapViewZoomController:(id)a3;
- (void)setMapViewZoomDelegate:(id)a3;
- (void)setNavTrafficIncidentCoordinator:(id)a3;
- (void)setNavigationTrayContaineeViewController:(id)a3;
- (void)setSearchHomeViewController:(id)a3;
- (void)setSearchSessionManager:(id)a3;
- (void)setSearchingAlongTheRoute:(BOOL)a3;
- (void)setShowFullScreenDirectionsList:(BOOL)a3;
- (void)showJunctionViewIfNeeded;
- (void)showPedestrianARFeatureIntroTeachableMomentCard;
- (void)showPedestrianARRaiseToEnterTeachableMomentCard;
- (void)showVLF;
- (void)simpleResultsViewContoller:(id)a3 selectClusteredLabelMarker:(id)a4;
- (void)simpleResultsViewContoller:(id)a3 selectSearchResult:(id)a4;
- (void)suppressTransitionsOfContainee:(id)a3;
- (void)toggleLowGuidanceNavigationCameraHeading;
- (void)toggleTemporaryStatusBar;
- (void)updateCameraForTraits:(id)a3 containerStyle:(unint64_t)a4;
- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 shareContactValue:(id)a4;
- (void)viewController:(id)a3 switchNavigationToRoute:(id)a4;
- (void)viewController:(id)a3 switchToMapViewZoom:(unint64_t)a4;
- (void)viewController:(id)a3 updateMapRect:(id)a4;
- (void)viewControllerOpenContactsSearch:(id)a3;
- (void)voiceVolumeViewController:(id)a3 selectedVoiceVolumeOption:(int64_t)a4;
@end

@implementation NavActionCoordinator

- (GEOMapServiceTraits)newTraits
{
  v2 = [(NavActionCoordinator *)self containerViewController];
  v3 = [v2 chromeViewController];
  v4 = [v3 currentTraits];

  return v4;
}

- (int64_t)displayedViewMode
{
  v2 = [(NavActionCoordinator *)self containerViewController];
  v3 = [v2 chromeViewController];
  id v4 = [v3 displayedViewMode];

  return (int64_t)v4;
}

- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5
{
  [a4 endMapItem:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NavActionCoordinator *)self detourToMapItem:v6];
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v4 = a4;
  id v5 = +[MKSystemController sharedInstance];
  [v5 openURL:v4 completionHandler:0];
}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  id v4 = [a3 mapItem];
  if (v4)
  {
    +[SARAnalytics captureMapSelectMapItem:v4];
    id v5 = [[PlaceCardItem alloc] initWithMapItem:v4];
    id v6 = [(NavActionCoordinator *)self containerViewController];
    v7 = [v6 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_17;
    }
    v9 = [(NavActionCoordinator *)self containerViewController];
    v10 = [v9 currentViewController];

    v11 = [v10 placeCardItem];
    unsigned __int8 v12 = [(PlaceCardItem *)v5 isEqual:v11];

    if ((v12 & 1) == 0)
    {
LABEL_17:
      v13 = [(NavActionCoordinator *)self placecardViewController];
      [v13 resetState];
      int64_t v14 = [(NavActionCoordinator *)self navigationTransportType];
      uint64_t v15 = 0;
      switch(v14)
      {
        case 0:
          if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0
            && (MapsFeature_IsEnabled_Maps420() & 1) == 0)
          {
            goto LABEL_8;
          }
          uint64_t v15 = 1;
          break;
        case 1:
          uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
          goto LABEL_11;
        case 2:
LABEL_8:
          uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
          goto LABEL_11;
        case 5:
          uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_11:
          uint64_t v15 = IsEnabled_DrivingMultiWaypointRoutes;
          break;
        default:
          break;
      }
      [v13 setIsAdditionalStop:v15];
      [v13 setExcludedContent:[self excludedContentForMapItem:v4]];
      [v13 setPlaceCardItem:v5 withHistory:0];
      [(NavActionCoordinator *)self presentPlacecardViewController];
    }
  }

  return v4 != 0;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  id v3 = a3;
  if ([v3 isRouteEta])
  {
    id v4 = [v3 routeInfo];
    id v5 = [v4 route];
    BOOL v6 = ((unint64_t)[v5 source] & 0xFFFFFFFFFFFFFFFELL) != 2;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)chromeDidSelectETAMarkerForRoute:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectTransitLineMarker:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self navTrafficIncidentCoordinator];
  BOOL v6 = [v5 presentedAlert];

  if (v6)
  {
    v7 = [(NavActionCoordinator *)self navTrafficIncidentCoordinator];
    v8 = [v7 alertViewController];
    v9 = [v8 cardPresentationController];
    [v9 wantsLayout:2];
  }
  else
  {
    v10 = +[MKMapService sharedService];
    [v10 captureUserAction:1031 onTarget:505 eventValue:0];

    v11 = [v4 incident];
    unsigned __int8 v12 = [(NavActionCoordinator *)self trafficIncidentViewController];
    [v12 setIncident:v11];

    v7 = [(NavActionCoordinator *)self containerViewController];
    v8 = [(NavActionCoordinator *)self trafficIncidentViewController];
    [v7 presentController:v8 animated:1 useDefaultContaineeLayout:1];
  }

  return 1;
}

- (BOOL)chromeDidSelectRouteAnnotations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 firstObject];
    BOOL v6 = [(NavActionCoordinator *)self routeAnnotationViewController];
    [v6 setRouteAnnotation:v5];

    v7 = [(NavActionCoordinator *)self containerViewController];
    v8 = [(NavActionCoordinator *)self routeAnnotationViewController];
    [v7 presentController:v8];

    int64_t v9 = [(NavActionCoordinator *)self navigationTransportType];
    int64_t v10 = v9;
    if (v9 == 5 || v9 == 2)
    {
      v11 = [v4 firstObject];
      unsigned __int8 v12 = [v11 styleAttributes];
      int v13 = FeatureStyleAttributesFind();

      if (v13)
      {
        int64_t v14 = +[NSNumber numberWithInt:0];
      }
      else
      {
        int64_t v14 = 0;
      }
      if (v10 == 2) {
        uint64_t v15 = 312;
      }
      else {
        uint64_t v15 = 67;
      }
      v16 = +[MKMapService sharedService];
      v17 = [v14 stringValue];
      [v16 captureUserAction:v15 onTarget:505 eventValue:v17];
    }
  }

  return 1;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self simpleResultsViewController];
  id v6 = [v5 cluster];

  if (v6 != v4)
  {
    v7 = [(NavActionCoordinator *)self simpleResultsViewController];
    [v7 clearCluster];
  }
  [(NavActionCoordinator *)self presentSimpleResultsViewController];
  v8 = [(NavActionCoordinator *)self simpleResultsViewController];
  int64_t v9 = [(NavActionCoordinator *)self currentSearchInfo];
  [v8 setCluster:v4 sortAlphabetically:0 originalSearchInfo:v9];

  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  id v6 = a3;
  v7 = [(NavActionCoordinator *)self navTrafficIncidentCoordinator];
  v8 = [v7 presentedAlert];

  if (v8)
  {
    int64_t v9 = [(NavActionCoordinator *)self navTrafficIncidentCoordinator];
    int64_t v10 = [v9 alertViewController];
    v11 = [v10 cardPresentationController];
    [v11 wantsLayout:2];
  }
  else
  {
    unsigned __int8 v12 = +[MKMapService sharedService];
    [v12 captureUserAction:1031 onTarget:505 eventValue:0];

    int v13 = [(NavActionCoordinator *)self trafficIncidentViewController];
    [v13 setIncident:v6];

    int64_t v9 = [(NavActionCoordinator *)self containerViewController];
    int64_t v10 = [(NavActionCoordinator *)self trafficIncidentViewController];
    [v9 presentController:v10 animated:1 useDefaultContaineeLayout:1];
  }

  return 1;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectLabelMarker:(id)a3
{
  id v4 = a3;
  if ([v4 featureID] || objc_msgSend(v4, "hasBusinessID"))
  {
    if ([v4 featureID]) {
      id v5 = [v4 featureID];
    }
    else {
      id v5 = [v4 businessID];
    }
    id v6 = v5;
    id v7 = objc_alloc((Class)MKMapItemIdentifier);
    [v4 coordinate];
    double v9 = v8;
    [v4 coordinate];
    id v10 = [v7 initWithMUID:v6 resultProviderID:0 coordinate:v9];
    v11 = +[MKMapService sharedService];
    id v21 = v10;
    unsigned __int8 v12 = +[NSArray arrayWithObjects:&v21 count:1];
    int v13 = [(NavActionCoordinator *)self containerViewController];
    int64_t v14 = [v13 chromeViewController];
    uint64_t v15 = [v14 currentTraits];
    v16 = [v11 ticketForIdentifiers:v12 traits:v15];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100C2E9E8;
    v18[3] = &unk_1012E7B20;
    id v19 = v4;
    v20 = self;
    [v16 submitWithHandler:v18 networkActivity:0];
  }
  return 1;
}

- (BOOL)chromeDidClearMapSelection
{
  id v3 = [(NavActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];

  id v5 = [(NavActionCoordinator *)self trafficIncidentAlertCoordinator];
  id v6 = [v5 alertViewController];

  if (v4 == v6)
  {
    int v13 = [(NavActionCoordinator *)self navTrafficIncidentCoordinator];
    int64_t v14 = [v13 alertViewController];
    uint64_t v15 = [v14 cardPresentationController];
    [v15 wantsLayout:1];
  }
  else
  {
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    +[NSArray arrayWithObjects:v22 count:3];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    double v8 = (char *)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      double v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_opt_isKindOfClass())
          {
            unsigned __int8 v12 = [(NavActionCoordinator *)self containerViewController];
            [v12 popLastViewControllerAnimated:1];

            goto LABEL_12;
          }
        }
        double v9 = (char *)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return 1;
}

- (void)simpleResultsViewContoller:(id)a3 selectSearchResult:(id)a4
{
  [a4 mapItem:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NavActionCoordinator *)self selectMapItem:v5 shouldRemoveResults:0];
}

- (void)simpleResultsViewContoller:(id)a3 selectClusteredLabelMarker:(id)a4
{
  id v5 = a4;
  id v6 = [(NavActionCoordinator *)self mapSelectionManager];
  [v6 selectLabelMarker:v5 animated:1];
}

- (NavActionCoordinator)initWithMapItemDisplayer:(id)a3 navigationDisplay:(id)a4 guidanceObserver:(id)a5 navigationCameraModeController:(id)a6 rapNavigationTracker:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)NavActionCoordinator;
  long long v18 = [(NavActionCoordinator *)&v22 init];
  long long v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mapItemDisplayer, a3);
    objc_storeStrong((id *)&v19->_navigationDisplay, a4);
    objc_storeStrong((id *)&v19->_guidanceObserver, a5);
    objc_storeWeak((id *)&v19->_navigationCameraModeController, v16);
    v19->_defaultMapViewZoom = 0;
    objc_storeStrong((id *)&v19->_rapNavigationTracker, a7);
    long long v20 = v19;
  }

  return v19;
}

- (void)presentWithContainerViewController:(id)a3
{
  [(NavActionCoordinator *)self setContainerViewController:a3];
  if (self->_searchHomeViewController)
  {
    id v4 = [(NavActionCoordinator *)self containerViewController];
    id v5 = [v4 chromeViewController];

    id v6 = [v5 appCoordinator];
    id v7 = [v6 baseActionCoordinator];
    [(ControlContaineeViewController *)self->_searchHomeViewController setDelegate:v7];

    double v8 = [v5 personalizedItemManager];
    [(SearchViewController *)self->_searchHomeViewController setPersonalizedItemManager:v8];
  }
  double v9 = [(NavActionCoordinator *)self containerViewController];
  uint64_t v10 = [(NavActionCoordinator *)self navigationTrayContaineeViewController];
  if ([v9 controllerIsInStack:v10])
  {
    v11 = [(NavActionCoordinator *)self containerViewController];
    unsigned __int8 v12 = [v11 currentViewController];
    id v13 = [v12 view];
    id v14 = [v13 window];

    if (v14) {
      return;
    }
  }
  else
  {
  }
  id v15 = sub_10000AF10();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v18 = "-[NavActionCoordinator presentWithContainerViewController:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Inserting nav tray into the containee stack", buf, 0xCu);
  }

  [(NavActionCoordinator *)self presentTray];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D56E7C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)activeSharingCount
{
  v2 = +[MSPSharedTripService sharedInstance];
  id v3 = [v2 receivers];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)viewControllerOpenContactsSearch:(id)a3
{
  id v5 = objc_alloc_init(NavContactSearchViewController);
  [(ContaineeViewController *)v5 setContaineeDelegate:self];
  [(NavContactSearchViewController *)v5 setNavActionCoordinator:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5];
}

- (void)senderShareNavigation:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  SBSGetScreenLockStatus();
  [(NavActionCoordinator *)self openShareETAController];
}

- (void)openShareETAController
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  char v5 = [WeakRetained currentViewController];
  unsigned __int8 v6 = [v5 isMemberOfClass:objc_opt_class()];

  if ((v6 & 1) == 0)
  {
    double v8 = objc_alloc_init(NavShareETAViewController);
    [(ContaineeViewController *)v8 setContaineeDelegate:self];
    [(NavShareETAViewController *)v8 setNavActionCoordinator:self];
    id v7 = objc_loadWeakRetained((id *)p_containerViewController);
    [v7 presentController:v8];
  }
}

- (void)viewController:(id)a3 shareContactValue:(id)a4
{
  id v4 = a4;
  char v5 = +[MSPSharedTripService sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D57308;
  v7[3] = &unk_101302E00;
  id v8 = v4;
  id v6 = v4;
  [v5 startSharingWithContact:v6 completion:v7];
}

- (void)displayIncidentReporting
{
  if (![(NavActionCoordinator *)self isDisplayingIncidentReporting])
  {
    id v4 = [[NavTrafficIncidentReportingContaineeViewController alloc] initWithDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v4];
  }
}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v9 = [[NavTrafficIncidentReportSubmissionContaineeViewController alloc] initWithItem:v7 report:v6];

  [(ContaineeViewController *)v9 setContaineeDelegate:self];
  [(NavTrafficIncidentReportSubmissionContaineeViewController *)v9 setReportingDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v9 animated:1 useDefaultContaineeLayout:1];
}

- (BOOL)isDisplayingIncidentReporting
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v4 = [WeakRetained currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_containerViewController);
    id v7 = [v6 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)incidentReportSubmissionContaineeDidFinish:(id)a3
{
  id v4 = [(NavActionCoordinator *)self containerViewController];
  char v5 = [v4 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(NavActionCoordinator *)self _presentTrayWithDefaultLayout:1 animated:1];
  }
}

- (void)displayVoiceVolumeControl
{
  if (![(NavActionCoordinator *)self isControllingVoiceVolume])
  {
    id v4 = [[NavVoiceVolumeViewController alloc] initWithDelegate:self];
    [(ContaineeViewController *)v4 setContaineeDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v4];
  }
}

- (BOOL)isControllingVoiceVolume
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v3 = [WeakRetained currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setContainerViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containerViewController, obj);
    char v5 = [obj chromeViewController];
    [(MapViewZoomController *)self->_mapViewZoomController setChromeViewController:v5];
  }
}

- (void)setAppCoordinator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appCoordinator, obj);
    char v5 = [obj platformController];
    [(NavTrayViewController *)self->_navigationTrayContaineeViewController setPlatformController:v5];
  }
}

- (NavTrayViewController)navigationTrayContaineeViewController
{
  navigationTrayContaineeViewController = self->_navigationTrayContaineeViewController;
  if (!navigationTrayContaineeViewController)
  {
    id v4 = [NavTrayViewController alloc];
    char v5 = [(NavActionCoordinator *)self guidanceObserver];
    id v6 = [(NavActionCoordinator *)self appCoordinator];
    id v7 = [v6 platformController];
    id v8 = [(NavTrayViewController *)v4 initForNavigationWithDelegate:self guidanceObserver:v5 platformController:v7];
    double v9 = self->_navigationTrayContaineeViewController;
    self->_navigationTrayContaineeViewController = v8;

    navigationTrayContaineeViewController = self->_navigationTrayContaineeViewController;
  }

  return navigationTrayContaineeViewController;
}

- (NavTrafficIncidentCoordinator)navTrafficIncidentCoordinator
{
  navTrafficIncidentCoordinator = self->_navTrafficIncidentCoordinator;
  if (!navTrafficIncidentCoordinator)
  {
    id v4 = objc_alloc_init(NavTrafficIncidentCoordinator);
    char v5 = self->_navTrafficIncidentCoordinator;
    self->_navTrafficIncidentCoordinator = v4;

    [(NavTrafficIncidentCoordinator *)self->_navTrafficIncidentCoordinator setPresentationDelegate:self];
    navTrafficIncidentCoordinator = self->_navTrafficIncidentCoordinator;
  }

  return navTrafficIncidentCoordinator;
}

- (MapViewZoomController)mapViewZoomController
{
  mapViewZoomController = self->_mapViewZoomController;
  if (!mapViewZoomController)
  {
    id v4 = [MapViewZoomController alloc];
    char v5 = [(NavActionCoordinator *)self navigationDisplay];
    id v6 = [(MapViewZoomController *)v4 initWithNavigationDisplay:v5];
    id v7 = self->_mapViewZoomController;
    self->_mapViewZoomController = v6;

    id v8 = [(NavActionCoordinator *)self containerViewController];
    double v9 = [v8 chromeViewController];
    [(MapViewZoomController *)self->_mapViewZoomController setChromeViewController:v9];

    [(MapViewZoomController *)self->_mapViewZoomController setDelegate:self];
    mapViewZoomController = self->_mapViewZoomController;
  }

  return mapViewZoomController;
}

- (unint64_t)currentMapViewZoom
{
  v2 = [(NavActionCoordinator *)self mapViewZoomController];
  id v3 = [v2 zoom];

  return (unint64_t)v3;
}

- (MapSelectionManager)mapSelectionManager
{
  v2 = [(NavActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 mapSelectionManager];

  return (MapSelectionManager *)v4;
}

- (void)setCurrentSearchInfo:(id)a3
{
}

- (void)setCurrentSearchInfo:(id)a3 error:(id)a4
{
  id v23 = a3;
  id v7 = a4;
  id v8 = +[MNNavigationService sharedService];
  switch([v8 navigationTransportType])
  {
    case 1u:
    case 6u:

      goto LABEL_8;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_5;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_5:
      char v10 = IsEnabled_Maps182;

      if (v10) {
        goto LABEL_6;
      }
      goto LABEL_8;
    default:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_6:
        objc_storeStrong((id *)&self->_currentSearchInfo, a3);
        [(NavActionCoordinator *)self presentSearchAlongTheRouteResults];
        v11 = [[GuidanceSearchResultsSearchInfoDataProvider alloc] initWithSearchInfo:v23 error:v7];
        unsigned __int8 v12 = [GuidanceSearchResultsViewModel alloc];
        id v13 = [(NavActionCoordinator *)self routeInfoProvider];
        id v14 = [(NavActionCoordinator *)self mapItemDisplayer];
        id v15 = [(GuidanceSearchResultsViewModel *)v12 initWithDataProvider:v11 navActionCoordinator:self routeInfoProvider:v13 mapItemDisplayer:v14];

        id v16 = [v23 placeSummaryMetadata];
        [(GuidanceSearchResultsViewModel *)v15 setPlaceSummaryMetadata:v16];

        [(GuidanceSearchResultsViewController *)self->_resultsViewController configureWithViewModel:v15];
      }
      else
      {
LABEL_8:
        v11 = [v23 results];
        if (![(GuidanceSearchResultsSearchInfoDataProvider *)v11 count]) {
          goto LABEL_14;
        }
        unsigned int v18 = [v23 isSearchAlongRoute];

        if (!v18) {
          goto LABEL_15;
        }
        v11 = [[GuidanceSearchResultsSearchInfoDataProvider alloc] initWithSearchInfo:v23 error:v7];
        long long v19 = [GuidanceSearchResultsViewModel alloc];
        long long v20 = [(NavActionCoordinator *)self routeInfoProvider];
        id v21 = [(NavActionCoordinator *)self mapItemDisplayer];
        id v15 = [(GuidanceSearchResultsViewModel *)v19 initWithDataProvider:v11 navActionCoordinator:self routeInfoProvider:v20 mapItemDisplayer:v21];

        objc_super v22 = [v23 placeSummaryMetadata];
        [(GuidanceSearchResultsViewModel *)v15 setPlaceSummaryMetadata:v22];

        if ([v23 selectedIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
          [(NavActionCoordinator *)self presentSearchAlongTheRouteWithViewModel:v15];
        }
        else {
          -[GuidanceSearchResultsViewModel navigateToItemAtIndex:](v15, "navigateToItemAtIndex:", [v23 selectedIndex]);
        }
      }

LABEL_14:
LABEL_15:

      return;
  }
}

- (void)handleSearchActionUsingSearchFieldItem:(id)a3 withUserInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NavActionCoordinator *)self searchSessionManager];

  if (!v8)
  {
    double v9 = objc_alloc_init(SearchSessionManager);
    [(NavActionCoordinator *)self setSearchSessionManager:v9];

    char v10 = [(NavActionCoordinator *)self containerViewController];
    v11 = [v10 chromeViewController];
    unsigned __int8 v12 = [v11 appCoordinator];
    id v13 = [v12 baseActionCoordinator];
    id v14 = [(NavActionCoordinator *)self searchSessionManager];
    [v14 setCoordinator:v13];
  }
  [(NavActionCoordinator *)self setSearchingAlongTheRoute:1];
  id v16 = [(NavActionCoordinator *)self searchSessionManager];
  id v15 = [(SearchViewController *)self->_searchHomeViewController recentAutocompleteSessionData];
  [v16 performSearchForSearchItem:v7 withUserInfo:v6 recentAutocompleteSessionData:v15];
}

- (void)setDefaultContaineeViewControllerType:(unint64_t)a3
{
  if (self->_defaultContaineeViewControllerType != a3)
  {
    self->_defaultContaineeViewControllerType = a3;
    if (a3)
    {
      if (a3 != 1) {
        return;
      }
      id v3 = [(NavActionCoordinator *)self guidanceObserver];
      [v3 pauseUpdates];
    }
    else
    {
      id v3 = [(NavActionCoordinator *)self guidanceObserver];
      [v3 resumeUpdates];
    }
  }
}

- (NavigationRouteHistoryInfoProviding)routeInfoProvider
{
  routeInfoProvider = self->_routeInfoProvider;
  if (!routeInfoProvider)
  {
    id v4 = [NavigationRouteHistoryInfoProvider alloc];
    char v5 = +[MNNavigationService sharedService];
    id v6 = [(NavigationRouteHistoryInfoProvider *)v4 initWithNavigationService:v5];
    id v7 = self->_routeInfoProvider;
    self->_routeInfoProvider = v6;

    routeInfoProvider = self->_routeInfoProvider;
  }

  return routeInfoProvider;
}

- (NavigationRouteDetouring)routeDetourer
{
  routeDetourer = self->_routeDetourer;
  if (!routeDetourer)
  {
    id v4 = [NavigationRouteInterrupter alloc];
    char v5 = sub_100018584();
    id v6 = [(NavigationRouteInterrupter *)v4 initWithSuggestionsEngine:v5 delegate:0];

    id v7 = [NavigationRouteDetourer alloc];
    id v8 = +[MNNavigationService sharedService];
    double v9 = [(NavActionCoordinator *)self appCoordinator];
    char v10 = [v9 platformController];
    v11 = [(NavActionCoordinator *)self routeInfoProvider];
    unsigned __int8 v12 = [(NavigationRouteDetourer *)v7 initWithNavigationService:v8 platformController:v10 routeInfoProvider:v11 routeInterrupter:v6];
    id v13 = self->_routeDetourer;
    self->_routeDetourer = v12;

    routeDetourer = self->_routeDetourer;
  }

  return routeDetourer;
}

- (unint64_t)navigationCameraHeadingOverride
{
  v2 = [(NavActionCoordinator *)self navigationDisplay];
  id v3 = [v2 cameraController];
  id v4 = [v3 navigationCameraHeadingOverride];

  return (unint64_t)v4;
}

- (double)mapViewYaw
{
  v2 = [(NavActionCoordinator *)self navigationDisplay];
  id v3 = [v2 mapView];
  [v3 presentationYaw];
  double v5 = v4;

  return v5;
}

- (int64_t)excludedContentForMapItem:(id)a3
{
  id v3 = [a3 _geoMapItem];
  double v4 = [v3 detourInfo];

  if (v4) {
    return 14699;
  }
  else {
    return 14714;
  }
}

- (PlaceCardViewController)placecardViewController
{
  placecardViewController = self->_placecardViewController;
  if (!placecardViewController)
  {
    double v4 = [[PlaceCardViewController alloc] initWithVisualEffectDisabled:1];
    double v5 = self->_placecardViewController;
    self->_placecardViewController = v4;

    [(PlaceCardViewController *)self->_placecardViewController setPlaceCardDelegate:self];
    [(InfoCardViewController *)self->_placecardViewController setContaineeDelegate:self];
    [(PlaceCardViewController *)self->_placecardViewController setIsPresentedInSearchAlongTheRoute:1];
    placecardViewController = self->_placecardViewController;
  }

  return placecardViewController;
}

- (SimpleResultsViewController)simpleResultsViewController
{
  simpleResultsViewController = self->_simpleResultsViewController;
  if (!simpleResultsViewController)
  {
    double v4 = [SimpleResultsViewController alloc];
    double v5 = [(NavActionCoordinator *)self appCoordinator];
    id v6 = [(SimpleResultsViewController *)v4 initWithShareDelegate:v5 visualEffectDisabled:1];
    id v7 = self->_simpleResultsViewController;
    self->_simpleResultsViewController = v6;

    [(SimpleResultsViewController *)self->_simpleResultsViewController setResultsDelegate:self];
    [(ContaineeViewController *)self->_simpleResultsViewController setContaineeDelegate:self];
    [(SimpleResultsViewController *)self->_simpleResultsViewController setIsPresentingSearchAlongTheRouteResults:1];
    [(SimpleResultsViewController *)self->_simpleResultsViewController setSearchAlongTheRouteCellDelegate:self];
    simpleResultsViewController = self->_simpleResultsViewController;
  }

  return simpleResultsViewController;
}

- (NavTrafficIncidentContaineeViewController)trafficIncidentViewController
{
  trafficIncidentViewController = self->_trafficIncidentViewController;
  if (!trafficIncidentViewController)
  {
    double v4 = objc_alloc_init(NavTrafficIncidentContaineeViewController);
    double v5 = self->_trafficIncidentViewController;
    self->_trafficIncidentViewController = v4;

    [(ContaineeViewController *)self->_trafficIncidentViewController setContaineeDelegate:self];
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D58360;
    v7[3] = &unk_1012E6708;
    objc_copyWeak(&v8, &location);
    [(NavTrafficIncidentContaineeViewController *)self->_trafficIncidentViewController setDismissHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    trafficIncidentViewController = self->_trafficIncidentViewController;
  }

  return trafficIncidentViewController;
}

- (RouteAnnotationContaineeViewController)routeAnnotationViewController
{
  routeAnnotationViewController = self->_routeAnnotationViewController;
  if (!routeAnnotationViewController)
  {
    double v4 = objc_alloc_init(RouteAnnotationContaineeViewController);
    double v5 = self->_routeAnnotationViewController;
    self->_routeAnnotationViewController = v4;

    [(ContaineeViewController *)self->_routeAnnotationViewController setContaineeDelegate:self];
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100D584CC;
    v7[3] = &unk_1012E6708;
    objc_copyWeak(&v8, &location);
    [(RouteAnnotationContaineeViewController *)self->_routeAnnotationViewController setDismissHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    routeAnnotationViewController = self->_routeAnnotationViewController;
  }

  return routeAnnotationViewController;
}

- (void)presentTray
{
  uint64_t Card = -[ContainerViewController delaysFirstCardPresentation]_0();

  [(NavActionCoordinator *)self _presentTrayWithDefaultLayout:0 animated:Card];
}

- (void)_presentTrayWithDefaultLayout:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = self;
  [(NavActionCoordinator *)self setSearchingAlongTheRoute:0];
  [(NavActionCoordinator *)v6 setDisplayingTrafficIncident:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D5866C;
  v9[3] = &unk_1012F8940;
  v9[4] = v6;
  BOOL v10 = a4;
  BOOL v11 = a3;
  id v7 = objc_retainBlock(v9);
  id v8 = +[UIApplication sharedApplication];
  LODWORD(v6) = [v8 screenIsLocked];

  if (v6) {
    +[UIViewController _performWithoutDeferringTransitions:v7];
  }
  else {
    ((void (*)(void *))v7[2])(v7);
  }
}

- (SearchViewController)searchHomeViewController
{
  searchHomeViewController = self->_searchHomeViewController;
  if (!searchHomeViewController)
  {
    double v4 = [[SearchViewController alloc] initWithSearchAlongRoute:1];
    double v5 = self->_searchHomeViewController;
    self->_searchHomeViewController = v4;

    [(SearchViewController *)self->_searchHomeViewController setNavContaineeDelegate:self];
    id v6 = [(NavActionCoordinator *)self containerViewController];
    id v7 = [v6 chromeViewController];
    id v8 = [v7 appCoordinator];
    double v9 = [v8 baseActionCoordinator];
    [(ControlContaineeViewController *)self->_searchHomeViewController setDelegate:v9];

    [(SearchViewController *)self->_searchHomeViewController setSearchingAlongTheRoute:1];
    BOOL v10 = [(NavActionCoordinator *)self containerViewController];
    BOOL v11 = [v10 chromeViewController];
    unsigned __int8 v12 = [v11 personalizedItemManager];
    [(SearchViewController *)self->_searchHomeViewController setPersonalizedItemManager:v12];

    id v13 = [(NavActionCoordinator *)self containerViewController];
    id v14 = [v13 chromeViewController];

    id v15 = [v14 traitCollection];
    id v16 = [v15 horizontalSizeClass];

    if (sub_1000BBB44(v14) == 1 && v16 == (id)2) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 0;
    }
    long long v19 = [(ContaineeViewController *)self->_searchHomeViewController cardPresentationController];
    [v19 setDefaultContaineeLayout:v18];

    searchHomeViewController = self->_searchHomeViewController;
  }

  return searchHomeViewController;
}

- (void)dismissAddStop
{
}

- (void)dismissAddStopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dismiss SAR category list", v10, 2u);
  }

  [(NavActionCoordinator *)self setSearchingAlongTheRoute:0];
  id v6 = [(NavActionCoordinator *)self containerViewController];
  id v7 = [v6 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v9 = [(NavActionCoordinator *)self containerViewController];
    [v9 popLastViewControllerAnimated:v3];
  }
}

- (void)dismissReportAnIncident
{
}

- (void)dismissReportAnIncidentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dismiss Report an Incident", v10, 2u);
  }

  id v6 = [(NavActionCoordinator *)self containerViewController];
  id v7 = [v6 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v9 = [(NavActionCoordinator *)self containerViewController];
    [v9 popLastViewControllerAnimated:v3];
  }
}

- (void)presentPlacecardViewController
{
  BOOL v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 currentViewController];
  double v5 = [(NavActionCoordinator *)self placecardViewController];

  if (v4 == v5)
  {
    id v19 = [(NavActionCoordinator *)self placecardViewController];
    id v17 = [v19 cardPresentationController];
    [v17 wantsLayout:2];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v7 = [WeakRetained currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
    BOOL v10 = v9;
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v18 = [(NavActionCoordinator *)self placecardViewController];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100D58C94;
      v20[3] = &unk_1012E7D28;
      v20[4] = self;
      [v10 presentController:v18 animated:1 completion:v20];

      return;
    }
    id v19 = [v9 currentViewController];

    BOOL v11 = [(NavActionCoordinator *)self placecardViewController];
    unsigned __int8 v12 = [v11 placeCardItem];
    id v13 = [v12 mapItem];
    unsigned int v14 = [v19 containsMapItem:v13];

    id v15 = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v16 = [(NavActionCoordinator *)self placecardViewController];
    if (v14)
    {
      [v15 presentController:v16];
    }
    else
    {
      [v15 replaceCurrentWithController:v16];

      id v15 = [(NavActionCoordinator *)self placecardViewController];
      id v16 = [v15 cardPresentationController];
      [v16 wantsLayout:2];
    }
  }
}

- (void)presentSimpleResultsViewController
{
  BOOL v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 currentViewController];
  double v5 = [(NavActionCoordinator *)self simpleResultsViewController];

  if (v4 == v5) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v7 = [WeakRetained currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v10 = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v9 = [(NavActionCoordinator *)self simpleResultsViewController];
  if (isKindOfClass)
  {
    [v10 replaceCurrentWithController:v9];

LABEL_4:
    id v10 = [(NavActionCoordinator *)self simpleResultsViewController];
    id v9 = [v10 cardPresentationController];
    [v9 wantsLayout:2];
    goto LABEL_6;
  }
  [v10 presentController:v9];
LABEL_6:
}

- (void)sendOtherEVStationsRequest:(unint64_t)a3
{
  [(NavActionCoordinator *)self setSearchingAlongTheRoute:1];
  v16[0] = &__kCFBooleanTrue;
  v15[0] = @"SearchAlongRoute";
  v15[1] = @"SARImplicitRequestMUID";
  double v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  v15[2] = @"SAROtherEVStationRequest";
  v16[1] = v5;
  v16[2] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v7 = objc_alloc_init(SearchFieldItem);
  id v8 = [(NavActionCoordinator *)self appCoordinator];
  id v9 = [v8 baseActionCoordinator];

  if (v9)
  {
    id v10 = [(NavActionCoordinator *)self appCoordinator];
    BOOL v11 = [v10 baseActionCoordinator];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v13 = [v6 copy];
    [v11 viewController:WeakRetained doSearchItem:v7 withUserInfo:v13];
  }
  else
  {
    id v10 = sub_10000AF10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "The action coordinator is nil.", v14, 2u);
    }
  }
}

- (void)presentAddStopUsingCategories:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D59114;
  v6[3] = &unk_1012E5D58;
  v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  double v4 = objc_retainBlock(v6);
  char v5 = 0;
  SBSGetScreenLockStatus();
  ((void (*)(void *))v4[2])(v4);
}

- (void)presentSearchAlongTheRouteWithViewModel:(id)a3
{
  id v8 = a3;
  [(NavActionCoordinator *)self setSearchingAlongTheRoute:1];
  resultsViewController = self->_resultsViewController;
  if (resultsViewController)
  {
    [(GuidanceSearchResultsViewController *)resultsViewController configureWithViewModel:v8];
  }
  else
  {
    char v5 = [[GuidanceSearchResultsViewController alloc] initWithViewModel:v8];
    id v6 = self->_resultsViewController;
    self->_resultsViewController = v5;

    [(GuidanceSearchResultsViewController *)self->_resultsViewController setNavContaineeDelegate:self];
  }
  id v7 = [(NavActionCoordinator *)self containerViewController];
  [v7 presentController:self->_resultsViewController];
}

- (void)presentSearchAlongTheRouteResults
{
  id v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground])
    {
      id v6 = sub_10000AF10();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cannot show SAR results when carplay scene is foregrounded.", buf, 2u);
      }
    }
    else
    {
      [(NavActionCoordinator *)self setSearchingAlongTheRoute:1];
      id v7 = objc_alloc_init(GuidanceSearchResultsViewController);
      resultsViewController = self->_resultsViewController;
      self->_resultsViewController = v7;

      [(GuidanceSearchResultsViewController *)self->_resultsViewController setNavContaineeDelegate:self];
      id v9 = [(NavActionCoordinator *)self containerViewController];
      [v9 presentController:self->_resultsViewController];
    }
  }
}

- (void)resetMapViewZoomToDefaultAndStartCameraTracking:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NavActionCoordinator *)self mapViewZoomController];
  [v5 setZoomTo:[self defaultMapViewZoom] startCameraTracking:v3];
}

- (BOOL)isPedestrianARActive
{
  v2 = [(NavActionCoordinator *)self appCoordinator];
  BOOL v3 = [v2 chromeViewController];
  double v4 = [v3 topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isPedestrianARShowingFailureView
{
  if (![(NavActionCoordinator *)self isPedestrianARActive]) {
    return 0;
  }
  BOOL v3 = [(NavActionCoordinator *)self appCoordinator];
  double v4 = [v3 chromeViewController];
  id v5 = [v4 topContext];
  id v6 = [v5 fullscreenViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    unsigned __int8 v9 = [v8 isShowingFailureView];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)canEnterPedestrianAR
{
  if (!+[PedestrianARSessionTask isPedestrianARModeSupported])
  {
    id v7 = sub_10000AF10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      unsigned __int8 v9 = "Cannot enter pedestrian AR because it's not supported on the current device";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, 2u);
    }
LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  BOOL v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 route];

  if (!v4)
  {
    id v7 = sub_10000AF10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      unsigned __int8 v9 = "Cannot enter pedestrian AR without a route";
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  id v5 = [(NavActionCoordinator *)self appCoordinator];
  id v6 = [v5 platformController];
  id v7 = [v6 pedestrianARSessionStateManager];

  if (([v7 shouldShowPedestrianAR] & 1) == 0)
  {
    id v10 = sub_10000AF10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = [v7 debugDescription];
      int v13 = 138412290;
      unsigned int v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Cannot enter pedestrian AR for state manager: %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
  BOOL v8 = 1;
LABEL_14:

  return v8;
}

- (void)enterPedestrianAR
{
  BOOL v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will enter pedestrian AR from navigation", buf, 2u);
  }

  if (![(NavActionCoordinator *)self canEnterPedestrianAR])
  {
    v25 = sub_10000AF10();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

      return;
    }
    v26 = self;
    if (!v26)
    {
      v31 = @"<nil>";
      goto LABEL_29;
    }
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      v29 = [(NavActionCoordinator *)v26 performSelector:"accessibilityIdentifier"];
      v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_27;
      }
    }
    v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_27:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v46 = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot enter pedestrian AR at the moment", buf, 0xCu);

    goto LABEL_30;
  }
  objc_initWeak(&location, self);
  double v4 = [(NavActionCoordinator *)self containerViewController];
  id v5 = [(NavActionCoordinator *)self containerViewController];
  id v6 = [v5 chromeViewController];
  id v7 = [v6 appCoordinator];
  BOOL v8 = [v7 baseActionCoordinator];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100D59FD0;
  v42[3] = &unk_1012E6998;
  objc_copyWeak(&v43, &location);
  unsigned __int8 v9 = [v4 showVLFCrowdsourcingPermissionCardWithContaineeDelegate:self delegate:v8 completion:v42];

  if ((v9 & 1) == 0)
  {
    id v10 = [(NavActionCoordinator *)self containerViewController];
    BOOL v11 = [v10 currentViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v12 = v11;
    }
    else {
      unsigned __int8 v12 = 0;
    }
    id v13 = v12;

    unsigned int v14 = [(NavActionCoordinator *)self containerViewController];
    id v15 = [v14 currentViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    if (v13)
    {
      uint64_t v18 = sub_10000AF10();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_46:

        [(NavActionCoordinator *)self containeeViewControllerGoToPreviousState:v11 withSender:0];
        goto LABEL_47;
      }
      id v19 = self;
      if (!v19)
      {
        v24 = @"<nil>";
        goto LABEL_41;
      }
      long long v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      if (objc_opt_respondsToSelector())
      {
        objc_super v22 = [(NavActionCoordinator *)v19 performSelector:"accessibilityIdentifier"];
        id v23 = v22;
        if (v22 && ([v22 isEqualToString:v21] & 1) == 0)
        {
          v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

          goto LABEL_19;
        }
      }
      v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_19:

LABEL_41:
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Feature intro teachable moment card is active; dismissing it before entering AR",
        buf,
        0xCu);

      goto LABEL_46;
    }
    if (!v17)
    {
LABEL_47:
      v38 = [(NavActionCoordinator *)self appCoordinator];
      v39 = [(NavActionCoordinator *)self containerViewController];
      v40 = [v39 route];
      v41 = [(NavActionCoordinator *)self guidanceObserver];
      [v38 enterPedestrianARWithRoute:v40 guidanceObserver:v41];

      goto LABEL_48;
    }
    uint64_t v18 = sub_10000AF10();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_45:
      BOOL v11 = v15;
      goto LABEL_46;
    }
    v32 = self;
    if (!v32)
    {
      v37 = @"<nil>";
      goto LABEL_44;
    }
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    if (objc_opt_respondsToSelector())
    {
      v35 = [(NavActionCoordinator *)v32 performSelector:"accessibilityIdentifier"];
      v36 = v35;
      if (v35 && ([v35 isEqualToString:v34] & 1) == 0)
      {
        v37 = +[NSString stringWithFormat:@"%@<%p, %@>", v34, v32, v36];

        goto LABEL_39;
      }
    }
    v37 = +[NSString stringWithFormat:@"%@<%p>", v34, v32];
LABEL_39:

LABEL_44:
    *(_DWORD *)buf = 138543362;
    v46 = v37;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Raise to enter teachable moment card is active; dismissing it before entering AR",
      buf,
      0xCu);

    goto LABEL_45;
  }
LABEL_48:
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)exitPedestrianAR
{
  id v2 = [(NavActionCoordinator *)self appCoordinator];
  [v2 exitPedestrianAR];
}

- (BOOL)isTeachableMomentCardActive
{
  id v2 = [(NavActionCoordinator *)self containerViewController];
  BOOL v3 = [v2 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isWeatherPopoverActive
{
  id v2 = [(NavActionCoordinator *)self containerViewController];
  BOOL v3 = [v2 _maps_mapsSceneDelegate];
  double v4 = [v3 topMostPresentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)showPedestrianARFeatureIntroTeachableMomentCard
{
  BOOL v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = sub_10000AF10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The Pedestrian AR feature intro teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }
  }
  else
  {
    BOOL v8 = [[PedestrianARFeatureIntroTeachableMomentContaineeViewController alloc] initWithCoordinator:self];
    [(ContaineeViewController *)v8 setContaineeDelegate:self];
    id v7 = [(NavActionCoordinator *)self containerViewController];
    [v7 presentController:v8 animated:1];
  }
}

- (void)showPedestrianARRaiseToEnterTeachableMomentCard
{
  BOOL v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = sub_10000AF10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The Pedestrian AR raise to enter teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }
  }
  else
  {
    BOOL v8 = objc_alloc_init(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
    [(ContaineeViewController *)v8 setContaineeDelegate:self];
    id v7 = [(NavActionCoordinator *)self containerViewController];
    [v7 presentController:v8 animated:1];
  }
}

- (void)dismissPedestrianARTeachableMomentCardIfNecessary
{
  BOOL v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id v5 = [(NavActionCoordinator *)self containerViewController];
    id v6 = [v5 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
  }
  BOOL v8 = sub_10000AF10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v9 = [(NavActionCoordinator *)self containerViewController];
    id v10 = [v9 currentViewController];
    int v14 = 138412290;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Dismissing Pedestrian AR teachable moment card: %@", (uint8_t *)&v14, 0xCu);
  }
  BOOL v11 = [(NavActionCoordinator *)self containerViewController];
  unsigned __int8 v12 = [(NavActionCoordinator *)self containerViewController];
  id v13 = [v12 currentViewController];
  [v11 removeControllerFromStack:v13];
}

- (void)showVLF
{
  BOOL v3 = [(NavActionCoordinator *)self containerViewController];
  double v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v19 = [(NavActionCoordinator *)self containerViewController];
    id v6 = [v19 currentViewController];
    [v6 handleVLFPuckTapped];
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = [(NavActionCoordinator *)self containerViewController];
    BOOL v8 = [(NavActionCoordinator *)self containerViewController];
    unsigned __int8 v9 = [v8 chromeViewController];
    id v10 = [v9 appCoordinator];
    BOOL v11 = [v10 baseActionCoordinator];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100D5AAF0;
    v20[3] = &unk_1012E6998;
    objc_copyWeak(&v21, &location);
    unsigned __int8 v12 = [v7 showVLFCrowdsourcingPermissionCardWithContaineeDelegate:self delegate:v11 completion:v20];

    if ((v12 & 1) == 0)
    {
      id v13 = [(NavActionCoordinator *)self containerViewController];
      int v14 = [v13 chromeViewController];
      id v15 = [v14 userLocationView];

      if ([v15 isVLFBannerVisible]) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = [v15 isVLFPuckVisible];
      }
      id v17 = [[VLFContaineeViewController alloc] initWithEntryPoint:v16];
      [(ContaineeViewController *)v17 setContaineeDelegate:self];
      uint64_t v18 = [(NavActionCoordinator *)self containerViewController];
      [v18 presentController:v17];
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  id v12 = a4;
  id v5 = [(NavActionCoordinator *)self containerViewController];
  unsigned int v6 = [v5 isForWalkingNav];

  if (v6)
  {
    id v7 = [(NavActionCoordinator *)self containerViewController];
    [v7 showSignForStep:v12];

    BOOL v8 = [(NavActionCoordinator *)self containerViewController];
    unsigned __int8 v9 = [v8 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(NavActionCoordinator *)self dismissModalContainee];
      [(NavActionCoordinator *)self dismissTray];
    }
    else
    {
      BOOL v11 = [(NavActionCoordinator *)self containerViewController];
      [v11 setLayoutIfSupported:1 animated:1];
    }
  }
}

- (void)pressedShowDirectionsListWithSender:(id)a3
{
}

- (void)senderOpenListStep:(id)a3 fullscreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[MNNavigationService sharedService];
  unsigned int v8 = [v7 navigationTransportType];

  BOOL v9 = v8 == 2;
  if (v8 == 2) {
    +[RouteStepListMetrics routePlanningMetrics];
  }
  else {
  id v10 = +[RouteStepListMetrics navigationMetrics];
  }
  BOOL v11 = v8 == 2;
  id v12 = [[RouteStepListViewController alloc] initWithOptions:23 metrics:v10];
  [(RouteStepListViewController *)v12 setDelegate:self];
  [(RouteStepListViewController *)v12 setDisplayRouteFromNavigationService:1];
  [(RouteStepListViewController *)v12 setAllowsSelection:v11];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100D5B308;
  v28[3] = &unk_101322F70;
  BOOL v29 = v9;
  id v13 = [[ModalContaineeViewController alloc] initWithChildViewController:v12 visualEffectDisabled:1 fullScreen:1 headerViewConfigurationProvider:v28];
  int v14 = [(ModalContaineeViewController *)v13 headerView];
  BOOL v15 = [(RouteStepListViewController *)v12 showsHairline];
  uint64_t v16 = [v14 bottomHairline];
  [v16 setHidden:v15];

  id v17 = +[NSBundle mainBundle];
  uint64_t v18 = [v17 localizedStringForKey:@"Directions_Navigation" value:@"localized string not found" table:0];
  [v14 setTitle:v18];

  objc_initWeak(&location, self);
  if (v4)
  {
    [(ContaineeViewController *)v13 setKeepOriginalSafeInsets:1];
    id v19 = [v14 trailingButton];
    long long v20 = sub_100AEBE2C();
    [v19 setTitle:v20 forState:0];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100D5B378;
    v25[3] = &unk_1012E6708;
    id v21 = &v26;
    objc_copyWeak(&v26, &location);
    [(ModalContaineeViewController *)v13 setBlockAlongDismissContainee:v25];
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100D5B3CC;
    v23[3] = &unk_1012E6708;
    id v21 = &v24;
    objc_copyWeak(&v24, &location);
    [(ModalContaineeViewController *)v13 setBlockAlongDismissContainee:v23];
  }
  objc_destroyWeak(v21);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v13];

  objc_destroyWeak(&location);
}

- (void)pressedEndWithSender:(id)a3
{
}

- (void)pressedEndWithSender:(id)a3 feedback:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_10000AF10();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "User pressed end", (uint8_t *)buf, 2u);
  }

  unsigned int v8 = [(NavActionCoordinator *)self containerViewController];
  [v8 willDismissNavigationAnimated:1];

  [(NavActionCoordinator *)self _willDismissNavMode];
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      objc_initWeak(buf, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100D5B5AC;
      v10[3] = &unk_101316D00;
      objc_copyWeak(&v11, buf);
      +[UIApplication _maps_unlockApplicationWithCompletion:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
    [WeakRetained endNavigationAndReturnToRoutePlanning:0];
  }
}

- (BOOL)canPresentRapFeedbackView
{
  id v2 = [(NavActionCoordinator *)self rapNavigationTracker];
  unsigned __int8 v3 = [v2 canPresentRapFeedbackView];

  return v3;
}

- (void)_willDismissNavMode
{
  unsigned __int8 v3 = [(NavActionCoordinator *)self mapViewZoomController];
  [v3 setZoomTo:[self defaultMapViewZoom]];

  id v4 = [(NavActionCoordinator *)self mapViewZoomController];
  [v4 updateCameraForTraits:0 containerStyle:0];
}

- (void)pauseNavigation
{
  unsigned __int8 v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "User pressed pause", v6, 2u);
  }

  id v4 = +[MNNavigationService sharedService];
  [v4 stopNavigationWithReason:3];

  id v5 = [(NavActionCoordinator *)self containerViewController];
  [v5 willDismissNavigationAnimated:1];
}

- (void)resumeNavigation
{
  id v2 = sub_10000AF10();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "User pressed resume", v4, 2u);
  }

  unsigned __int8 v3 = +[MNNavigationService sharedService];
  [v3 advanceToNextLeg];
}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v6 = a4;
  id v7 = [GuidanceSearchResultsCategoryDataProvider alloc];
  unsigned int v8 = +[MKMapService sharedService];
  BOOL v9 = [(NavActionCoordinator *)self containerViewController];
  id v10 = [v9 chromeViewController];
  BOOL v15 = [(GuidanceSearchResultsCategoryDataProvider *)v7 initWithSearchItem:v6 mapService:v8 chromeViewController:v10];

  id v11 = [GuidanceSearchResultsViewModel alloc];
  id v12 = [(NavActionCoordinator *)self routeInfoProvider];
  id v13 = [(NavActionCoordinator *)self mapItemDisplayer];
  int v14 = [(GuidanceSearchResultsViewModel *)v11 initWithDataProvider:v15 navActionCoordinator:self routeInfoProvider:v12 mapItemDisplayer:v13];

  [(NavActionCoordinator *)self presentSearchAlongTheRouteWithViewModel:v14];
}

- (void)pressedShowOverviewWithSender:(id)a3
{
}

- (void)pressedZoomToManeuverWithSender:(id)a3
{
}

- (void)viewController:(id)a3 switchToMapViewZoom:(unint64_t)a4
{
  if (a4 != 2)
  {
    id v7 = [(NavActionCoordinator *)self mapViewZoomController];
    [v7 setZoomTo:a4];

    unsigned int v8 = [(NavActionCoordinator *)self navigationTrayContaineeViewController];
    id v9 = [v8 cardPresentationController];

    if ([v9 containeeLayout] != (id)1) {
      [v9 wantsLayout:1];
    }
  }
}

- (void)sender:(id)a3 switchToNavigationCameraMode:(unint64_t)a4
{
  id v6 = [(NavActionCoordinator *)self navigationCameraModeController];
  [v6 setNavigationCameraMode:a4];

  id v7 = [(NavActionCoordinator *)self containerViewController];
  [v7 updateLayoutAnimated:1];
}

- (unint64_t)navigationCameraMode
{
  id v2 = [(NavActionCoordinator *)self navigationCameraModeController];
  id v3 = [v2 navigationCameraMode];

  return (unint64_t)v3;
}

- (int64_t)navigationTransportType
{
  id v2 = +[MNNavigationService sharedService];
  if ([v2 isInNavigatingState]) {
    unsigned int v3 = [v2 navigationTransportType];
  }
  else {
    unsigned int v3 = [v2 desiredTransportType];
  }
  if (v3 - 1 > 5) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = qword_100F74000[v3 - 1];
  }

  return v4;
}

- (void)viewController:(id)a3 switchNavigationToRoute:(id)a4
{
  id v16 = a4;
  id v5 = +[MNNavigationService sharedService];
  id v6 = [v5 route];
  unsigned __int8 v7 = [v6 isEqual:v16];

  if ((v7 & 1) == 0)
  {
    unsigned int v8 = [(NavActionCoordinator *)self trafficIncidentAlertCoordinator];
    id v9 = [v8 presentedAlert];

    if ([v9 alertType] != (id)1
      || ([v9 originalRoute],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v11 = [v10 isEqual:v16],
          v10,
          (v11 & 1) == 0))
    {
      id v12 = +[MNNavigationService sharedService];
      id v13 = [v12 alternateRouteIndexForRoute:v16];

      int v14 = +[MNNavigationService sharedService];
      [v14 switchToRoute:v16];

      BOOL v15 = +[MKMapService sharedService];
      [v15 captureUserAction:3015 onTarget:505 eventValue:0 routeIndex:v13];
    }
  }
}

- (void)selectMapItem:(id)a3 shouldRemoveResults:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [(NavActionCoordinator *)self containerViewController];
  unsigned int v8 = [v7 chromeViewController];
  id v9 = [v8 mapView];
  objc_initWeak(&location, v9);

  if (v6)
  {
    id v10 = sub_10000AF10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v11 = [v6 name];
      *(_DWORD *)buf = 138412290;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SAR: Opening placecard for: %@", buf, 0xCu);
    }
    id v12 = [[PlaceCardItem alloc] initWithMapItem:v6];
    id v13 = [(NavActionCoordinator *)self containerViewController];
    int v14 = [v13 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v16 = [(NavActionCoordinator *)self containerViewController];
    id v17 = [(id)v16 currentViewController];

    uint64_t v18 = [v17 placeCardItem];
    LOBYTE(v16) = [(PlaceCardItem *)v12 isEqual:v18];

    if ((v16 & 1) == 0)
    {
LABEL_23:
      id v19 = [(NavActionCoordinator *)self placecardViewController];
      [v19 resetState];
      int64_t v20 = [(NavActionCoordinator *)self navigationTransportType];
      uint64_t v21 = 0;
      switch(v20)
      {
        case 0:
          if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0
            && (MapsFeature_IsEnabled_Maps420() & 1) == 0)
          {
            goto LABEL_11;
          }
          uint64_t v21 = 1;
          break;
        case 1:
          uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
          goto LABEL_14;
        case 2:
LABEL_11:
          uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
          goto LABEL_14;
        case 5:
          uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_14:
          uint64_t v21 = IsEnabled_DrivingMultiWaypointRoutes;
          break;
        default:
          break;
      }
      [v19 setIsAdditionalStop:v21];
      [v19 setExcludedContent:[self excludedContentForMapItem:v6]];
      [v19 setPlaceCardItem:v12 withHistory:0];
      [(NavActionCoordinator *)self presentPlacecardViewController];
      if (v4)
      {
        id v23 = sub_10000AF10();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "SAR: Removing resultsViewController from the stack.", buf, 2u);
        }

        id v24 = [(NavActionCoordinator *)self containerViewController];
        [v24 removeControllerFromStack:self->_resultsViewController];

        resultsViewController = self->_resultsViewController;
        self->_resultsViewController = 0;
      }
      id v12 = [[PersonalizedMapItemKey alloc] initWithMapItem:v6];
      id v26 = [(NavActionCoordinator *)self customPOIsController];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100D5C4C4;
      v27[3] = &unk_1012EE580;
      objc_copyWeak(&v29, &location);
      id v28 = v6;
      [v26 customFeatureForKey:v12 completion:v27];

      objc_destroyWeak(&v29);
    }
  }
  else
  {
    id v12 = (PlaceCardItem *)objc_loadWeakRetained(&location);
    [(PlaceCardItem *)v12 _deselectLabelMarkerAnimated:1];
  }

  objc_destroyWeak(&location);
}

- (void)personalizedItemSourceDidChangeItems:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self containerViewController];
  id v6 = [v5 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    resultsViewController = self->_resultsViewController;
    id v9 = [v4 allItems];
    [(GuidanceSearchResultsViewController *)resultsViewController didChangePersonalItems:v9];
  }
  else
  {
    id v10 = sub_10000AF10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Ignoring personalized items change as SAR isn't active", v11, 2u);
    }
  }
}

- (void)detourToMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self mapSelectionManager];
  [v5 clearSelection];

  id v6 = [(NavActionCoordinator *)self routeDetourer];
  [v6 detourRouteToMapItem:v4];

  [(NavActionCoordinator *)self _presentTrayWithDefaultLayout:1 animated:1];

  [(NavActionCoordinator *)self dismissSearchAlongRoute];
}

- (void)detourToWaypoint:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self mapSelectionManager];
  [v5 clearSelection];

  id v6 = [(NavActionCoordinator *)self routeDetourer];
  [v6 detourRouteToWaypoint:v4];

  [(NavActionCoordinator *)self _presentTrayWithDefaultLayout:1 animated:1];

  [(NavActionCoordinator *)self dismissSearchAlongRoute];
}

- (void)viewController:(id)a3 updateMapRect:(id)a4
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v6 = a4.var0.var1;
  double v7 = a4.var0.var0;
  id v8 = [(NavActionCoordinator *)self mapViewZoomController];
  [v8 setZoomToTargetWithRect:v7, v6, var0, var1];
}

- (void)recenterNavigation
{
  unsigned int v3 = [(NavActionCoordinator *)self mapViewZoomController];
  id v4 = [v3 zoom];
  unint64_t v5 = [(NavActionCoordinator *)self defaultMapViewZoom];

  if (v4 == (id)v5)
  {
    double v6 = [(NavActionCoordinator *)self containerViewController];
    double v7 = [v6 chromeViewController];
    id v8 = [v7 mapView];

    id v9 = sub_100576084();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[NavActionCoordinator recenterNavigation]";
      __int16 v13 = 2114;
      int v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", buf, 0x16u);
    }

    [v8 navigationCameraReturnToPuck];
  }
  else
  {
    id v10 = [(NavActionCoordinator *)self mapViewZoomController];
    [v10 setZoomTo:[self defaultMapViewZoom]];
  }
}

- (void)updateCameraForTraits:(id)a3 containerStyle:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NavActionCoordinator *)self mapViewZoomController];
  [v7 updateCameraForTraits:v6 containerStyle:a4];
}

- (void)repeatGuidanceInstruction
{
  id v2 = +[MNNavigationService sharedService];
  [v2 repeatCurrentGuidance:0];
}

- (void)toggleTemporaryStatusBar
{
  id v2 = [(NavActionCoordinator *)self containerViewController];
  [v2 toggleTemporaryStatusBar];
}

- (BOOL)shouldShowNavRecenterButton
{
  unsigned int v3 = [(NavActionCoordinator *)self navigationDisplay];
  if ([v3 isTracking])
  {
    id v4 = [(NavActionCoordinator *)self mapViewZoomController];
    id v5 = [v4 zoom];
    if (v5 == (id)[(NavActionCoordinator *)self defaultMapViewZoom]
      && ![(NavActionCoordinator *)self isNavCameraPanned])
    {
      BOOL v6 = [(NavActionCoordinator *)self isNavCameraZoomed];
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)dismissPlacecard
{
  unsigned int v3 = [(NavActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v6 = [(NavActionCoordinator *)self containerViewController];
    [v6 popLastViewControllerAnimated:0];

    if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
      || (MapsFeature_IsEnabled_Maps420() & 1) != 0
      || MapsFeature_IsEnabled_Maps182())
    {
      id v7 = [(NavActionCoordinator *)self containerViewController];
      unsigned __int8 v8 = [v7 controllerIsInStack:self->_resultsViewController];

      if ((v8 & 1) == 0)
      {
        [(NavActionCoordinator *)self recenterNavigation];
        [(NavActionCoordinator *)self _presentTrayWithDefaultLayout:1 animated:1];
      }
    }
  }
}

- (void)dismissSearchAlongRoute
{
  unsigned int v3 = [(NavActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(NavActionCoordinator *)self _presentTrayWithDefaultLayout:1 animated:1];
  }
  [(NavActionCoordinator *)self clearSearch];
  BOOL v6 = [(NavActionCoordinator *)self mapItemDisplayer];
  [v6 removeMapItems];

  [(NavActionCoordinator *)self recenterNavigation];
}

- (void)clearSearch
{
  resultsViewController = self->_resultsViewController;
  self->_resultsViewController = 0;

  searchHomeViewController = self->_searchHomeViewController;
  if (searchHomeViewController)
  {
    [(SearchViewController *)searchHomeViewController cleanSearch];
  }
}

- (void)dismissModalContainee
{
  unsigned int v3 = [(NavActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(NavActionCoordinator *)self containerViewController];
    [v6 popLastViewControllerAnimated:0];
  }
}

- (void)dismissShareETA
{
  unsigned int v3 = [(NavActionCoordinator *)self containerViewController];
  id v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(NavActionCoordinator *)self containerViewController];
    [v6 popLastViewControllerAnimated:0];
  }
  id v7 = [(NavActionCoordinator *)self containerViewController];
  unsigned __int8 v8 = [v7 currentViewController];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    id v10 = [(NavActionCoordinator *)self containerViewController];
    [v10 popLastViewControllerAnimated:0];
  }
}

- (void)dismissVoiceVolumeControl
{
}

- (void)dismissVoiceVolumeControlAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dismiss Voice Volume Control", v10, 2u);
  }

  id v6 = [(NavActionCoordinator *)self containerViewController];
  id v7 = [v6 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v9 = [(NavActionCoordinator *)self containerViewController];
    [v9 popLastViewControllerAnimated:v3];
  }
}

- (void)dismissTray
{
  id v3 = [(NavActionCoordinator *)self navigationTrayContaineeViewController];
  id v2 = [v3 cardPresentationController];
  [v2 wantsLayout:1];
}

- (void)toggleLowGuidanceNavigationCameraHeading
{
}

- (void)_toggleCameraHeadingIfNeeded
{
  if ((id)[(NavActionCoordinator *)self navigationCameraMode] == (id)1)
  {
    BOOL v3 = (id)[(NavActionCoordinator *)self navigationCameraHeadingOverride] != (id)1;
    id v4 = [(NavActionCoordinator *)self navigationDisplay];
    id v5 = [v4 cameraController];
    [v5 setNavigationCameraHeadingOverride:v3];

    id v7 = [(NavActionCoordinator *)self navigationDisplay];
    id v6 = [v7 cameraController];
    -[NavActionCoordinator setLowGuidanceUserPreferredHeadingOverride:](self, "setLowGuidanceUserPreferredHeadingOverride:", [v6 navigationCameraHeadingOverride]);
  }
}

- (void)showJunctionViewIfNeeded
{
  id v2 = [(NavActionCoordinator *)self containerViewController];
  [v2 showJunctionViewIfNeeded];
}

- (void)hideJunctionViewIfNeeded
{
  id v2 = [(NavActionCoordinator *)self containerViewController];
  [v2 hideJunctionViewIfNeeded];
}

- (void)suppressTransitionsOfContainee:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self containerViewController];
  [v5 suppressTransitionsOfContainee:v4];
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0
    || MapsFeature_IsEnabled_Maps182())
  {
    [(NavActionCoordinator *)self selectMapItem:0 shouldRemoveResults:0];
    id v5 = [(NavActionCoordinator *)self containerViewController];
    unsigned __int8 v6 = [v5 controllerIsInStack:self->_resultsViewController];

    if ((v6 & 1) == 0)
    {
      [(NavActionCoordinator *)self recenterNavigation];
      [(NavActionCoordinator *)self _presentTrayWithDefaultLayout:1 animated:1];
    }
  }
  id v7 = [(NavActionCoordinator *)self containerViewController];
  [v7 popLastViewControllerAnimated:1 useDefaultContaineeLayout:1];
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(NavActionCoordinator *)self navTrafficIncidentCoordinator];
  uint64_t v7 = [v6 presentedAlert];
  if (v7)
  {
    unsigned __int8 v8 = (void *)v7;
    unsigned __int8 v9 = [v5 isRouteEta];

    if ((v9 & 1) == 0)
    {
      id v10 = [(NavActionCoordinator *)self navTrafficIncidentCoordinator];
      unsigned __int8 v11 = [v10 presentedAlert];
      id v12 = [v11 incident];
      __int16 v13 = [v12 incidentId];

      int v14 = [v5 incident];
      BOOL v15 = [v14 uniqueString];

      unsigned __int8 v16 = [v13 isEqualToString:v15];
      goto LABEL_16;
    }
  }
  else
  {
  }
  __int16 v13 = [v5 featureAnnotation];
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
  {
    id v17 = [v13 mapItem];
    unsigned __int8 v16 = v17 != 0;
  }
  else
  {
    unsigned __int8 v16 = (![v5 isCluster] || objc_msgSend(v5, "clusterFeatureCount"))
       && ((GEOConfigGetBOOL() & 1) != 0
        || ([v5 isTrafficIncident] & 1) != 0
        || ([v5 isRouteEta] & 1) != 0
        || ([v5 isRouteAnnotation] & 1) != 0
        || (unint64_t)[v5 clusterFeatureCount] > 1);
  }
LABEL_16:

  return v16;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v5 = [(NavActionCoordinator *)self navigationDisplay];
    [v5 startMotion:1];
  }
  unsigned __int8 v6 = [(NavActionCoordinator *)self mapSelectionManager];
  [v6 mapDidSelectLabelMarker:v7];
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  id v7 = a3;
  self->_navCameraPanned = 1;
  id v4 = [(NavActionCoordinator *)self containerViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unsigned __int8 v6 = [(NavActionCoordinator *)self containerViewController];
    [v6 mapViewNavigationCameraHasStartedPanning:v7];
  }
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  id v7 = a3;
  self->_navCameraPanned = 0;
  id v4 = [(NavActionCoordinator *)self containerViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unsigned __int8 v6 = [(NavActionCoordinator *)self containerViewController];
    [v6 mapViewNavigationCameraHasStoppedPanning:v7];
  }
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  id v7 = a3;
  self->_navCameraZoomed = 1;
  id v4 = [(NavActionCoordinator *)self containerViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unsigned __int8 v6 = [(NavActionCoordinator *)self containerViewController];
    [v6 mapViewNavigationCameraDidLeaveDefaultZoom:v7];
  }
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  id v7 = a3;
  self->_navCameraZoomed = 0;
  id v4 = [(NavActionCoordinator *)self containerViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unsigned __int8 v6 = [(NavActionCoordinator *)self containerViewController];
    [v6 mapViewNavigationCameraDidReturnToDefaultZoom:v7];
  }
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v9 = a3;
  unsigned __int8 v6 = [(NavActionCoordinator *)self containerViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    unsigned __int8 v8 = [(NavActionCoordinator *)self containerViewController];
    [v8 mapView:v9 didUpdateYaw:a4];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  char v5 = [(NavActionCoordinator *)self mapSelectionManager];
  unsigned int v6 = [v5 hasSelection];

  if (v6)
  {
    id v8 = [(NavActionCoordinator *)self mapSelectionManager];
    [v8 clearSelection];
  }
  else
  {
    if ([(NavActionCoordinator *)self isSearchingAlongTheRoute]) {
      +[SARAnalytics captureMapTapToHideTray];
    }
    char v7 = [(NavActionCoordinator *)self navigationTrayContaineeViewController];
    id v8 = [v7 cardPresentationController];

    if ([v8 containeeLayout] != (id)1) {
      [v8 wantsLayout:1];
    }
  }
}

- (void)presentTrafficIncidentViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NavActionCoordinator *)self setDisplayingTrafficIncident:1];
  id v8 = [(NavActionCoordinator *)self containerViewController];
  [v8 presentController:v7 animated:1 completion:v6];

  id v9 = [(NavActionCoordinator *)self containerViewController];
  [v9 hideJunctionViewIfNeeded];
}

- (void)dismissTrafficIncidentViewController:(id)a3
{
  id v4 = a3;
  char v5 = [(NavActionCoordinator *)self containerViewController];
  id v6 = [v5 currentViewController];

  if (v6 == v4)
  {
    [(NavActionCoordinator *)self presentTray];
    id v7 = [(NavActionCoordinator *)self containerViewController];
    [v7 showJunctionViewIfNeeded];
  }
}

- (void)searchResultTableViewCellDidTapActionButton:(id)a3
{
  id v9 = a3;
  id v4 = [v9 _tableView];
  char v5 = [v4 indexPathForCell:v9];

  if (v5) {
    uint64_t v6 = (uint64_t)[v5 row];
  }
  else {
    uint64_t v6 = -1;
  }
  id v7 = [v9 mapItem];
  +[SARAnalytics captureListStartDetourToMapItem:v7 index:v6];

  id v8 = [v9 mapItem];
  [(NavActionCoordinator *)self detourToMapItem:v8];
}

- (void)dismissCategoryList:(id)a3
{
  id v4 = a3;
  char v5 = [(NavActionCoordinator *)self containerViewController];
  id v6 = [v5 currentViewController];

  if (v6 == v4)
  {
    [(NavActionCoordinator *)self dismissAddStopAnimated:1];
  }
}

- (void)categoryList:(id)a3 selectedSearchCategory:(id)a4
{
  id v5 = a4;
  id v6 = sub_10000AF10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Selected SAR category: %@", (uint8_t *)&v17, 0xCu);
  }

  id v7 = objc_opt_new();
  [v7 setSearchCategory:v5];
  id v8 = [GuidanceSearchResultsCategoryDataProvider alloc];
  id v9 = +[MKMapService sharedService];
  id v10 = [(NavActionCoordinator *)self containerViewController];
  unsigned __int8 v11 = [v10 chromeViewController];
  id v12 = [(GuidanceSearchResultsCategoryDataProvider *)v8 initWithSearchItem:v7 mapService:v9 chromeViewController:v11];

  __int16 v13 = [GuidanceSearchResultsViewModel alloc];
  int v14 = [(NavActionCoordinator *)self routeInfoProvider];
  BOOL v15 = [(NavActionCoordinator *)self mapItemDisplayer];
  unsigned __int8 v16 = [(GuidanceSearchResultsViewModel *)v13 initWithDataProvider:v12 navActionCoordinator:self routeInfoProvider:v14 mapItemDisplayer:v15];

  [(NavActionCoordinator *)self presentSearchAlongTheRouteWithViewModel:v16];
}

- (void)dismissIncidentReportingViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self containerViewController];
  id v6 = [v5 currentViewController];

  if (v6 == v4)
  {
    [(NavActionCoordinator *)self dismissReportAnIncidentAnimated:1];
  }
}

- (void)incidentReportingViewController:(id)a3 selectedTrafficIncidentItem:(id)a4 atLocation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = -[TrafficIncidentReport initWithUserLocation:type:userPath:]([TrafficIncidentReport alloc], "initWithUserLocation:type:userPath:", v7, [v8 incidentType], 2);

  [(NavActionCoordinator *)self displayIncidentReportSubmissionWithItem:v8 report:v9];
}

- (void)dismissVoiceVolumeControlViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(NavActionCoordinator *)self containerViewController];
  id v6 = [v5 currentViewController];

  if (v6 == v4)
  {
    [(NavActionCoordinator *)self dismissVoiceVolumeControlAnimated:1];
  }
}

- (void)voiceVolumeViewController:(id)a3 selectedVoiceVolumeOption:(int64_t)a4
{
  if (a4) {
    unsigned int v5 = 3054;
  }
  else {
    unsigned int v5 = 3053;
  }
  if (a4 == 2) {
    uint64_t v6 = 3055;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = +[MKMapService sharedService];
  [v7 captureUserAction:v6 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)mapViewZoomController:(id)a3 didChangeMapViewZoom:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(NavActionCoordinator *)self navigationCameraMode];
  unint64_t v8 = 0;
  if (a4 == 1 && v7 == 1) {
    unint64_t v8 = [(NavActionCoordinator *)self lowGuidanceUserPreferredHeadingOverride];
  }
  id v9 = [(NavActionCoordinator *)self navigationDisplay];
  id v10 = [v9 cameraController];
  [v10 setNavigationCameraHeadingOverride:v8];

  unsigned __int8 v11 = [(NavActionCoordinator *)self containerViewController];
  [v11 mapViewZoomController:v6 didChangeMapViewZoom:a4];

  id v12 = [(NavActionCoordinator *)self mapViewZoomDelegate];
  [v12 navActionCoordinator:self didChangeMapViewZoom:a4];
}

- (void)pptTestEndNavigation
{
}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  unint64_t v3 = [(NavActionCoordinator *)self navigationCameraMode];
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }

  [(NavActionCoordinator *)self sender:self switchToNavigationCameraMode:v4];
}

- (int)currentUITargetForAnalytics
{
  uint64_t v3 = [(NavActionCoordinator *)self navigationTrayContaineeViewController];
  if (!v3) {
    return 401;
  }
  uint64_t v4 = (void *)v3;
  unsigned int v5 = [(NavActionCoordinator *)self navigationTrayContaineeViewController];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v6) {
    return 401;
  }
  unint64_t v7 = [(NavActionCoordinator *)self navigationTrayContaineeViewController];
  int v8 = [v7 currentUITargetForAnalytics];

  return v8;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (unint64_t)lowGuidanceUserPreferredHeadingOverride
{
  return GEOConfigGetUInteger();
}

- (void)setLowGuidanceUserPreferredHeadingOverride:(unint64_t)a3
{
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if ([WeakRetained containeeLayout] == (id)5)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_containerViewController);
    BOOL v4 = [v5 containeeLayout] != (id)4;
  }
  return v4;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 3) {
    unint64_t v6 = a3 + 1;
  }
  else {
    unint64_t v6 = 0;
  }
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v9 = [WeakRetained containeeLayout];

  if (v9 == (id)v6)
  {
    v15[0] = @"ContainerLayout";
    id v10 = +[NSNumber numberWithUnsignedInteger:v6];
    v15[1] = @"ContainerContainee";
    v16[0] = v10;
    id v11 = objc_loadWeakRetained((id *)p_containerViewController);
    id v12 = [v11 currentViewController];
    v16[1] = v12;
    __int16 v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayLayoutDidUpdateNotification" object:self userInfo:v13];
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)p_containerViewController);
    [v14 setLayoutIfSupported:v6 animated:v4];
  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  return a3 == 0;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3)
  {
    BOOL v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained popLastViewControllerAnimated:v5];
  }
}

- (UIScrollView)pptTestScrollView
{
  return 0;
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (SearchInfo)currentSearchInfo
{
  return self->_currentSearchInfo;
}

- (BOOL)isNavCameraPanned
{
  return self->_navCameraPanned;
}

- (BOOL)isNavCameraZoomed
{
  return self->_navCameraZoomed;
}

- (unint64_t)defaultContaineeViewControllerType
{
  return self->_defaultContaineeViewControllerType;
}

- (RAPNavigationTracker)rapNavigationTracker
{
  return self->_rapNavigationTracker;
}

- (BOOL)isShowingFullScreenDirectionsList
{
  return self->_showFullScreenDirectionsList;
}

- (void)setShowFullScreenDirectionsList:(BOOL)a3
{
  self->_showFullScreenDirectionsList = a3;
}

- (void)setSearchHomeViewController:(id)a3
{
}

- (NavContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (NavContainerViewController *)WeakRetained;
}

- (CustomPOIsController)customPOIsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customPOIsController);

  return (CustomPOIsController *)WeakRetained;
}

- (void)setCustomPOIsController:(id)a3
{
}

- (MapViewZoomDelegate)mapViewZoomDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewZoomDelegate);

  return (MapViewZoomDelegate *)WeakRetained;
}

- (void)setMapViewZoomDelegate:(id)a3
{
}

- (void)setNavTrafficIncidentCoordinator:(id)a3
{
}

- (unint64_t)defaultMapViewZoom
{
  return self->_defaultMapViewZoom;
}

- (void)setDefaultMapViewZoom:(unint64_t)a3
{
  self->_defaultMapViewZoom = a3;
}

- (NavigationMapItemDisplaying)mapItemDisplayer
{
  return self->_mapItemDisplayer;
}

- (void)setMapItemDisplayer:(id)a3
{
}

- (NavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (SearchSessionManager)searchSessionManager
{
  return self->_searchSessionManager;
}

- (void)setSearchSessionManager:(id)a3
{
}

- (NavigationCameraModeControlling)navigationCameraModeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationCameraModeController);

  return (NavigationCameraModeControlling *)WeakRetained;
}

- (void)setNavigationTrayContaineeViewController:(id)a3
{
}

- (void)setMapViewZoomController:(id)a3
{
}

- (BOOL)isSearchingAlongTheRoute
{
  return self->_searchingAlongTheRoute;
}

- (void)setSearchingAlongTheRoute:(BOOL)a3
{
  self->_searchingAlongTheRoute = a3;
}

- (BOOL)isDisplayingTrafficIncident
{
  return self->_displayingTrafficIncident;
}

- (void)setDisplayingTrafficIncident:(BOOL)a3
{
  self->_displayingTrafficIncident = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewZoomController, 0);
  objc_storeStrong((id *)&self->_navigationTrayContaineeViewController, 0);
  objc_destroyWeak((id *)&self->_navigationCameraModeController);
  objc_storeStrong((id *)&self->_searchSessionManager, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_mapItemDisplayer, 0);
  objc_storeStrong((id *)&self->_navTrafficIncidentCoordinator, 0);
  objc_destroyWeak((id *)&self->_mapViewZoomDelegate);
  objc_destroyWeak((id *)&self->_customPOIsController);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_searchHomeViewController, 0);
  objc_storeStrong((id *)&self->_routeDetourer, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);
  objc_storeStrong((id *)&self->_routeAnnotationViewController, 0);
  objc_storeStrong((id *)&self->_rapNavigationTracker, 0);
  objc_storeStrong((id *)&self->_trafficIncidentViewController, 0);
  objc_storeStrong((id *)&self->_placecardViewController, 0);
  objc_storeStrong((id *)&self->_simpleResultsViewController, 0);
  objc_storeStrong((id *)&self->_currentSearchInfo, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_addStopViewController, 0);

  objc_storeStrong((id *)&self->_resultsViewController, 0);
}

@end