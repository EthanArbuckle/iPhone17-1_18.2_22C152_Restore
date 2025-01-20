@interface AppCoordinator
- (ActionCoordination)baseActionCoordinator;
- (AppCoordinator)initWithPlatformController:(id)a3;
- (AppStateManager)appStateManager;
- (BOOL)applyPendingActionIfNeeded;
- (BOOL)isNavigationTurnByTurnOrStepping;
- (BOOL)isPresentingRouteCreation;
- (BOOL)isRoutePlanningPresented;
- (BOOL)pptTestCanResizePlacecard;
- (BOOL)pptTestCanUpdateTrayLayout;
- (BOOL)pptTestHasNextStep;
- (BOOL)pptTestIsTrayType:(int64_t)a3;
- (BOOL)pptTestMoveToBoardStep;
- (BOOL)pptTestSupportStepping;
- (BaseModeController)baseModeController;
- (FlyoverActionCoordination)flyoverActionCoordinator;
- (IOSBasedChromeViewController)chromeViewController;
- (IOSTransitNavigationContext)transitNavigationContext;
- (MKMapView)mapViewForPPTTest;
- (MKMapView)mapsActivityMapView;
- (MapsSceneDelegate)mapsSceneDelegate;
- (NavActionCoordination)navActionCoordinator;
- (NavModeController)navModeController;
- (NavigationSession)observedNavigationSession;
- (PlatformController)platformController;
- (RidesharingModeController)ridesharingModeController;
- (StepActionCoordination)stepActionCoordinator;
- (StepModeController)stepModeController;
- (UIScrollView)pptTestScrollView;
- (UIScrollView)pptTestScrollViewForDirectionsDetails;
- (UIScrollView)pptTestScrollViewForProactive;
- (UIViewController)pptTestContaineeForDirectionsDetails;
- (id)_pptChromeTrayCoordinatorForCurrentMode;
- (id)lookAroundActionCoordinator;
- (int)_analyticsPipelineTransportModeForMSPTransportType:(int64_t)a3;
- (int64_t)pptTestCurrentStepIndex;
- (void)_displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:(BOOL)a3;
- (void)_navigationSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)_navigationSessionRunning:(id)a3;
- (void)_navigationSessionStopped:(id)a3 movingToSession:(id)a4;
- (void)_openSharedTrip:(id)a3;
- (void)_popNavModeWithCompletion:(id)a3;
- (void)_popSteppingModeWithCompletion:(id)a3;
- (void)_presentActivityViewController:(id)a3 sourceView:(id)a4 completion:(id)a5;
- (void)addStopWithMapItem:(id)a3;
- (void)addStopWithWaypoint:(id)a3;
- (void)archiveMapsActivity;
- (void)closeSharedTrips;
- (void)continueRideBookingSessionWithApplicationIdentifier:(id)a3;
- (void)dismissRidesharingSessionAndReturnToRoutePlanning:(BOOL)a3;
- (void)dismissShareIfNeededAnimated:(BOOL)a3;
- (void)displayAnyEnqueuedFixedProblemNotification;
- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4;
- (void)displayOrScheduleDisplayOfEnqueuedFixedProblem:(id)a3;
- (void)displayTransitSchedulesForMapItem:(id)a3 departureSequence:(id)a4;
- (void)displayTransitSchedulesForRouteStep:(id)a3;
- (void)editLocationForParkedCar:(id)a3;
- (void)endNavigationAndReturnToRoutePlanning:(BOOL)a3;
- (void)endNavigationWithCompletion:(id)a3;
- (void)enterFlyoverForMapItem:(id)a3;
- (void)enterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6;
- (void)enterPedestrianARWithRoute:(id)a3 guidanceObserver:(id)a4;
- (void)enterRouteCreationWithMapItem:(id)a3 completion:(id)a4;
- (void)enterRouteCreationWithRoute:(id)a3 originMapItem:(id)a4 destinationMapItem:(id)a5 userInfo:(id)a6 completion:(id)a7;
- (void)enterRoutePlanningWithDirectionItem:(id)a3 withUserInfo:(id)a4;
- (void)exitFlyover;
- (void)exitLookAround;
- (void)exitPedestrianAR;
- (void)getCurrentSceneTitleWithCompletion:(id)a3;
- (void)hideFullscreenDirectionsList;
- (void)mapsActivityViewController:(id)a3 activityCompleted:(BOOL)a4;
- (void)mapsActivityViewControllerPresentRoutingApps:(id)a3;
- (void)mapsActivityViewControllerPrint:(id)a3;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4;
- (void)openAllCuratedCollections;
- (void)openCollection:(id)a3;
- (void)openCuratedCollectionWithIdentifier:(id)a3;
- (void)openCuratedCollectionsList:(id)a3 usingTitle:(id)a4;
- (void)openGuidesHomeWithGuideLocation:(id)a3;
- (void)openParentMapItem:(id)a3;
- (void)openPublisherWithIdentifier:(id)a3;
- (void)openRelatedMapItems:(id)a3 withTitle:(id)a4 originalMapItem:(id)a5 analyticsDelegate:(id)a6;
- (void)openSearch:(id)a3 andResults:(id)a4;
- (void)openSearch:(id)a3 userInfo:(id)a4;
- (void)openSharedTrip:(id)a3;
- (void)openSharedTrips;
- (void)openUserProfile;
- (void)openVehicleList;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)pptSelectACSuggestionMatchingAddress:(id)a3;
- (void)pptSelectFirstCuratedGuide;
- (void)pptSelectFirstGuidePublisher;
- (void)pptSelectSeeAllCuratedCollections;
- (void)pptTestAutocompleteSearchForFieldItem:(id)a3;
- (void)pptTestCreateCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 animated:(BOOL)a4;
- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4;
- (void)pptTestDoDirectionItem:(id)a3;
- (void)pptTestEndNavigation;
- (void)pptTestEnterAR;
- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5;
- (void)pptTestEnterSearchMode;
- (void)pptTestExitAR;
- (void)pptTestMaximizePlaceCardAnimated:(BOOL)a3;
- (void)pptTestMediumizePlaceCardAnimated:(BOOL)a3;
- (void)pptTestMinimizePlaceCardAnimated:(BOOL)a3;
- (void)pptTestMoveToNextStep;
- (void)pptTestOpenCollections;
- (void)pptTestOpenCommuteEntry:(id)a3;
- (void)pptTestOpenFirstCollection;
- (void)pptTestOpenRecents;
- (void)pptTestOpenSettings;
- (void)pptTestPauseRealtimeTransitUpdates;
- (void)pptTestPresentDirectionsDetails;
- (void)pptTestPresentPlaceCardForSearchResult:(id)a3 animated:(BOOL)a4;
- (void)pptTestPresentPlacecardWithMapItem:(id)a3;
- (void)pptTestPresentVenueForMapItem:(id)a3 searchCategory:(id)a4;
- (void)pptTestRefreshSearch;
- (void)pptTestResetForLaunchURL;
- (void)pptTestResumeRealtimeTransitUpdates;
- (void)pptTestSearchCancel;
- (void)pptTestSearchEndEditing;
- (void)pptTestSearchForFieldItem:(id)a3;
- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3;
- (void)pptTestSearchRetainQueryForSelectedSearchCompletion:(id)a3;
- (void)pptTestSelectVenueSearchResult:(id)a3;
- (void)pptTestStartNavigation;
- (void)pptTestStartTracePlaybackFromPath:(id)a3;
- (void)pptTestTransitionBetweenFullAndLightGuidance;
- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4;
- (void)presentAlertForMissingSharedTrip:(id)a3;
- (void)presentChinaAlertForSharedTrip:(id)a3;
- (void)presentPOIEnrichmentWithCoordinator:(id)a3;
- (void)presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:(id)a3;
- (void)setAppStateManager:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setIsPresentingRouteCreation:(BOOL)a3;
- (void)setMapsSceneDelegate:(id)a3;
- (void)setNeedsUserActivityUpdate;
- (void)setObservedNavigationSession:(id)a3;
- (void)setPPTTestDirectionsPlan:(id)a3;
- (void)setPPTTestViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setPlatformController:(id)a3;
- (void)shareCollection:(id)a3 sourceView:(id)a4 completion:(id)a5;
- (void)shareCuratedCollection:(id)a3 withRefinedMapItems:(id)a4 sourceView:(id)a5 completion:(id)a6;
- (void)shareItem:(id)a3 sourceView:(id)a4 completion:(id)a5;
- (void)sharePublisher:(id)a3 sourceView:(id)a4 completion:(id)a5;
- (void)showFullscreenDirectionsList;
- (void)showOfflineMapRegionSelectorForRegion:(id)a3 name:(id)a4 pushDataManagementFirst:(BOOL)a5;
- (void)startNavigationWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4;
- (void)startRideBookingSessionWithRideBookingRideOption:(id)a3;
- (void)startSearchModeWithCompletion:(id)a3;
- (void)startTableBookingFlowFromMapItem:(id)a3;
- (void)toggleRoutePlanning;
- (void)viewControllerShowExpiredOfflineMaps:(id)a3;
- (void)viewControllerShowOfflineMaps:(id)a3;
@end

@implementation AppCoordinator

- (AppCoordinator)initWithPlatformController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppCoordinator;
  v6 = [(AppCoordinator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    [(PlatformController *)v7->_platformController addObserver:v7];
    v8 = [[AppStateManager alloc] initWithPlatformController:v7->_platformController];
    appStateManager = v7->_appStateManager;
    v7->_appStateManager = v8;

    [(AppStateManager *)v7->_appStateManager setAppCoordinator:v7];
    v10 = objc_alloc_init(AnalyticsMonitor);
    analyticsMonitor = v7->_analyticsMonitor;
    v7->_analyticsMonitor = v10;
  }
  return v7;
}

- (void)startSearchModeWithCompletion:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v5 = [WeakRetained topContext];
  v6 = [(AppCoordinator *)self baseModeController];

  if (v5 != v6)
  {
    v7 = [(AppCoordinator *)self baseActionCoordinator];
    [v7 setAppCoordinator:self];

    id v8 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v9 = [(AppCoordinator *)self baseModeController];
    [v8 pushContext:v9 animated:0 completion:v10];
  }
}

- (AppStateManager)appStateManager
{
  return self->_appStateManager;
}

- (ActionCoordination)baseActionCoordinator
{
  v2 = [(AppCoordinator *)self baseModeController];
  v3 = [v2 actionCoordinator];

  return (ActionCoordination *)v3;
}

- (BaseModeController)baseModeController
{
  baseModeController = self->_baseModeController;
  if (!baseModeController)
  {
    v4 = [BaseModeController alloc];
    id v5 = [(AppCoordinator *)self platformController];
    v6 = [(BaseModeController *)v4 initWithPlatformController:v5];
    v7 = self->_baseModeController;
    self->_baseModeController = v6;

    baseModeController = self->_baseModeController;
  }

  return baseModeController;
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (BOOL)isNavigationTurnByTurnOrStepping
{
  v3 = [(AppCoordinator *)self observedNavigationSession];
  if (!v3)
  {
    id v5 = [(AppCoordinator *)self platformController];
    v6 = +[UIApplication sharedMapsDelegate];
    v7 = [v6 appSessionController];
    id v8 = [v7 currentlyNavigatingPlatformController];

    if (v5 != v8)
    {
      v3 = 0;
      LOBYTE(v4) = 0;
      goto LABEL_7;
    }
    id v10 = [(AppCoordinator *)self platformController];
    v3 = [v10 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v3;
    }
    else {
      v11 = 0;
    }
    id v4 = v11;

    if (!v4)
    {
      v3 = 0;
      goto LABEL_7;
    }
  }
  LOBYTE(v4) = [v3 navigationType] == (id)3 || [v3 navigationType] == (id)2;
LABEL_7:

  return (char)v4;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (void)setMapsSceneDelegate:(id)a3
{
}

- (void)setChromeViewController:(id)a3
{
}

- (void)hideFullscreenDirectionsList
{
}

- (void)displayAnyEnqueuedFixedProblemNotification
{
}

- (void)_displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:(BOOL)a3
{
  if (self->_fixedProblemCompletion)
  {
    p_chromeViewController = &self->_chromeViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v7 = [WeakRetained topContext];
    id v8 = [(AppCoordinator *)self baseModeController];

    if (v7 == v8)
    {
      id v9 = objc_retainBlock(self->_fixedProblemCompletion);
      id v10 = objc_loadWeakRetained((id *)p_chromeViewController);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100416CD8;
      v13[3] = &unk_1012E9AD0;
      id v14 = v9;
      BOOL v15 = a3;
      id v11 = v9;
      [v10 dismissAllModalViewsIfPresentAnimated:1 completion:v13];

      id fixedProblemCompletion = self->_fixedProblemCompletion;
      self->_id fixedProblemCompletion = 0;
    }
  }
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(AppCoordinator *)self observedNavigationSession];
  id v10 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  id v13 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  v16 = +[AddressBookManager sharedManager];
  v17 = [v16 meCard];
  v75 = [v17 identifier];

  if (v12 && v15)
  {
    id v69 = v15;
    id v70 = v13;
    v72 = self;
    v73 = v9;
    id v74 = v10;
    v18 = [v15 configuration];
    v19 = [v18 sharedTripPrefetchContext];

    v20 = [v12 configuration];
    v21 = [v20 automaticSharingContacts];
    v68 = v19;
    [v19 setAutomaticSharingContacts:v21];

    id v78 = objc_alloc_init((Class)NSMutableArray);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v71 = v12;
    v22 = [v12 waypointConfiguration];
    v23 = [v22 requests];

    id obj = v23;
    v24 = v75;
    id v80 = [v23 countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (!v80) {
      goto LABEL_68;
    }
    uint64_t v79 = *(void *)v82;
    while (1)
    {
      for (i = 0; i != v80; i = (char *)i + 1)
      {
        if (*(void *)v82 != v79) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(id *)(*((void *)&v81 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v27 = v26;
        }
        else {
          v27 = 0;
        }
        id v28 = v27;

        if (v28)
        {
          v29 = [v28 address];
          unsigned __int8 v30 = [v29 isMeCard];

          if ((v30 & 1) == 0)
          {
            v31 = [v28 contact];
            v32 = +[MSPSharedTripContact contactsFromCNContact:v31];
            v33 = [v32 firstObject];

            if (v33)
            {
              [v78 addObject:v33];
            }
            else
            {
              v34 = sub_1005762E4();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v86 = "-[AppCoordinator platformController:willChangeCurrentSessionFromSession:toSession:]";
                __int16 v87 = 2080;
                v88 = "AppCoordinator.m";
                __int16 v89 = 1024;
                int v90 = 165;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100BB36BC())
              {
                v35 = sub_1005762E4();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  v36 = +[NSThread callStackSymbols];
                  *(_DWORD *)buf = 138412290;
                  v86 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                }
              }
            }
          }
        }
        id v37 = v26;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v38 = v37;
        }
        else {
          v38 = 0;
        }
        id v39 = v38;

        if (v39)
        {
          v40 = [v39 contact];

          if (v40)
          {
            id v41 = objc_alloc((Class)MSPSharedTripContact);
            v42 = [v39 contact];
            v43 = [v39 handleIdentifier];
            id v44 = [v41 initWithContact:v42 handle:v43];

            if (v44)
            {
              [v78 addObject:v44];
            }
            else
            {
              v45 = sub_1005762E4();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v86 = "-[AppCoordinator platformController:willChangeCurrentSessionFromSession:toSession:]";
                __int16 v87 = 2080;
                v88 = "AppCoordinator.m";
                __int16 v89 = 1024;
                int v90 = 176;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100BB36BC())
              {
                v46 = sub_1005762E4();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  v47 = +[NSThread callStackSymbols];
                  *(_DWORD *)buf = 138412290;
                  v86 = v47;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                }
              }
            }
          }
        }
        id v48 = v37;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v49 = v48;
        }
        else {
          v49 = 0;
        }
        id v50 = v49;

        if (v50)
        {
          v51 = [v50 waypoint];
          v52 = [v51 findMyHandle];
          v53 = [v52 contact];

          if (v53)
          {
            v54 = [v51 findMyHandle];
            v55 = [v54 contact];

            v56 = [v51 findMyHandle];
            v57 = [v56 identifier];
            goto LABEL_50;
          }
          v58 = [v51 addressBookAddress];
          v55 = [v58 contact];

          if (v55)
          {
            v56 = [v51 addressBookAddress];
            v55 = [v56 contact];
            v57 = 0;
LABEL_50:

            if (v55)
            {
              v59 = [v55 identifier];
              unsigned __int8 v60 = [v59 isEqualToString:v24];

              if ((v60 & 1) == 0)
              {
                if (v57)
                {
                  id v61 = [objc_alloc((Class)MSPSharedTripContact) initWithContact:v55 handle:v57];
                }
                else
                {
                  v76 = [v51 addressBookAddress];
                  v62 = [v76 contact];
                  v63 = +[MSPSharedTripContact contactsFromCNContact:v62];
                  id v61 = [v63 firstObject];

                  v24 = v75;
                }
                if (v61)
                {
                  [v78 addObject:v61];
                }
                else
                {
                  v64 = sub_1005762E4();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    v86 = "-[AppCoordinator platformController:willChangeCurrentSessionFromSession:toSession:]";
                    __int16 v87 = 2080;
                    v88 = "AppCoordinator.m";
                    __int16 v89 = 1024;
                    int v90 = 206;
                    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
                  }

                  if (sub_100BB36BC())
                  {
                    v65 = sub_1005762E4();
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                    {
                      v66 = +[NSThread callStackSymbols];
                      *(_DWORD *)buf = 138412290;
                      v86 = v66;
                      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                      v24 = v75;
                    }
                  }
                }
              }
            }
          }
          else
          {
            v57 = 0;
          }
        }
      }
      id v80 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
      if (!v80)
      {
LABEL_68:

        id v67 = [v78 copy];
        [v68 setRoutingToContacts:v67];

        id v9 = v73;
        id v10 = v74;
        id v12 = v71;
        self = v72;
        id v15 = v69;
        id v13 = v70;
        break;
      }
    }
  }
  [(AppCoordinator *)self setObservedNavigationSession:v15];
  if (v9 && [v9 guidanceType] != (id)2) {
    [(AppCoordinator *)self _navigationSessionStopped:v9 movingToSession:v13];
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6 = [(AppCoordinator *)self observedNavigationSession];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(AppCoordinator *)self observedNavigationSession];
    id v9 = [v8 guidanceType];

    if (v9 == (id)2)
    {
      id v13 = [(AppCoordinator *)self observedNavigationSession];
      id v10 = [v13 currentRouteCollection];
      id v11 = [v10 currentRoute];
      id v12 = objc_opt_new();
      [(AppCoordinator *)self enterPedestrianARWithRoute:v11 guidanceObserver:v12];
    }
  }
}

- (void)setObservedNavigationSession:(id)a3
{
  id v5 = (NavigationSession *)a3;
  observedNavigationSession = self->_observedNavigationSession;
  if (observedNavigationSession != v5)
  {
    id v7 = v5;
    [observedNavigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_observedNavigationSession, a3);
    [self->_observedNavigationSession addObserver:self];
    id v5 = v7;
  }
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v8;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  if (v7) {
    [(AppCoordinator *)self _navigationSession:v7 didChangeState:a4];
  }
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  id v8 = a3;
  if ([v8 navigationType] == (id)3 || objc_msgSend(v8, "navigationType") == (id)2)
  {
    uint64_t v6 = [(AppCoordinator *)self _analyticsPipelineTransportModeForMSPTransportType:a4];
    id v7 = +[GEOAPSharedStateData sharedData];
    [v7 setMapUiShownActiveNavMode:v6];
  }
}

- (void)_navigationSession:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 1) {
    [(AppCoordinator *)self _navigationSessionRunning:a3];
  }
}

- (void)_navigationSessionRunning:(id)a3
{
  id v4 = a3;
  id v5 = [v4 navigationType];
  if (v5 == (id)2 || v5 == (id)4)
  {
    id v7 = sub_10000AF10();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    id v8 = self;
    if (!v8)
    {
      id v13 = @"<nil>";
      goto LABEL_24;
    }
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(AppCoordinator *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_13;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_13:

LABEL_24:
    *(_DWORD *)buf = 138543362;
    id v74 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Navigation started stepping; will push step or transit mode",
      buf,
      0xCu);

LABEL_25:
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100410CE8;
    v69[3] = &unk_1012E5D58;
    v69[4] = self;
    v21 = &v70;
    id v70 = v4;
    v22 = objc_retainBlock(v69);
    v23 = [(AppCoordinator *)self chromeViewController];
    v24 = [v23 topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v26 = sub_10000AF10();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        goto LABEL_75;
      }
      v27 = self;
      if (!v27)
      {
        v32 = @"<nil>";
        goto LABEL_60;
      }
      id v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      if (objc_opt_respondsToSelector())
      {
        unsigned __int8 v30 = [(AppCoordinator *)v27 performSelector:"accessibilityIdentifier"];
        v31 = v30;
        if (v30 && ![v30 isEqualToString:v29])
        {
          v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v31];

          goto LABEL_33;
        }
      }
      v32 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_33:

LABEL_60:
      *(_DWORD *)buf = 138543362;
      id v74 = v32;
      v62 = "[%{public}@] User is starting stepping nav to a custom or curated route; leaving current context in place";
LABEL_74:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v62, buf, 0xCu);

      goto LABEL_75;
    }
    v33 = [(AppCoordinator *)self chromeViewController];
    v34 = [v33 topContext];
    v35 = v34;
    if (v34 == self->_navModeController)
    {
    }
    else
    {
      v36 = [(AppCoordinator *)self chromeViewController];
      id v37 = [v36 topContext];
      stepModeController = self->_stepModeController;

      if (v37 != stepModeController) {
        goto LABEL_76;
      }
    }
    id v39 = sub_10000AF10();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
      goto LABEL_70;
    }
    v40 = self;
    id v41 = (objc_class *)objc_opt_class();
    v42 = NSStringFromClass(v41);
    if (objc_opt_respondsToSelector())
    {
      v43 = [(AppCoordinator *)v40 performSelector:"accessibilityIdentifier"];
      id v44 = v43;
      if (v43 && ![v43 isEqualToString:v42])
      {
        v45 = +[NSString stringWithFormat:@"%@<%p, %@>", v42, v40, v44];

        goto LABEL_44;
      }
    }
    v45 = +[NSString stringWithFormat:@"%@<%p>", v42, v40];
LABEL_44:

    v46 = [(AppCoordinator *)v40 chromeViewController];
    v47 = [v46 topContext];
    *(_DWORD *)buf = 138543618;
    id v74 = v45;
    __int16 v75 = 2112;
    v76 = v47;
LABEL_69:
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}@] Current top mode is the nav mode or the step mode (%@); popping to root context first",
      buf,
      0x16u);

    goto LABEL_70;
  }
  if (v5 == (id)3)
  {
    id v14 = sub_10000AF10();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_47:

      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100410A28;
      v71[3] = &unk_1012E5D58;
      v71[4] = self;
      v21 = &v72;
      id v72 = v4;
      v22 = objc_retainBlock(v71);
      id v48 = [(AppCoordinator *)self chromeViewController];
      v49 = [v48 topContext];
      objc_opt_class();
      char v50 = objc_opt_isKindOfClass();

      if (v50)
      {
        id v26 = sub_10000AF10();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v51 = self;
          if (!v51)
          {
            v32 = @"<nil>";
            goto LABEL_73;
          }
          v52 = (objc_class *)objc_opt_class();
          v53 = NSStringFromClass(v52);
          if (objc_opt_respondsToSelector())
          {
            v54 = [(AppCoordinator *)v51 performSelector:"accessibilityIdentifier"];
            v55 = v54;
            if (v54 && ![v54 isEqualToString:v53])
            {
              v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v53, v51, v55];

              goto LABEL_55;
            }
          }
          v32 = +[NSString stringWithFormat:@"%@<%p>", v53, v51];
LABEL_55:

LABEL_73:
          *(_DWORD *)buf = 138543362;
          id v74 = v32;
          v62 = "[%{public}@] User is starting tbt nav to a custom or curated route; leaving current context in place";
          goto LABEL_74;
        }
LABEL_75:

        goto LABEL_76;
      }
      v56 = [(AppCoordinator *)self chromeViewController];
      v57 = [v56 topContext];
      v58 = v57;
      if (v57 == self->_navModeController)
      {

        goto LABEL_62;
      }
      v59 = [(AppCoordinator *)self chromeViewController];
      unsigned __int8 v60 = [v59 topContext];
      id v61 = self->_stepModeController;

      if (v60 == v61)
      {
LABEL_62:
        id v39 = sub_10000AF10();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v63 = self;
          v64 = (objc_class *)objc_opt_class();
          v65 = NSStringFromClass(v64);
          if (objc_opt_respondsToSelector())
          {
            v66 = [(AppCoordinator *)v63 performSelector:"accessibilityIdentifier"];
            id v67 = v66;
            if (v66 && ![v66 isEqualToString:v65])
            {
              v45 = +[NSString stringWithFormat:@"%@<%p, %@>", v65, v63, v67];

              goto LABEL_68;
            }
          }
          v45 = +[NSString stringWithFormat:@"%@<%p>", v65, v63];
LABEL_68:

          v46 = [(AppCoordinator *)v63 chromeViewController];
          v47 = [v46 topContext];
          *(_DWORD *)buf = 138543618;
          id v74 = v45;
          __int16 v75 = 2112;
          v76 = v47;
          goto LABEL_69;
        }
LABEL_70:

        v68 = [(AppCoordinator *)self chromeViewController];
        [v68 popToRootContextAnimated:0 completion:v22];

LABEL_77:
        goto LABEL_78;
      }
LABEL_76:
      ((void (*)(void *))v22[2])(v22);
      goto LABEL_77;
    }
    id v15 = self;
    if (!v15)
    {
      v20 = @"<nil>";
      goto LABEL_46;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      v18 = [(AppCoordinator *)v15 performSelector:"accessibilityIdentifier"];
      v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_22;
      }
    }
    v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_22:

LABEL_46:
    *(_DWORD *)buf = 138543362;
    id v74 = v20;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] Navigation started turn-by-turn; will push nav mode",
      buf,
      0xCu);

    goto LABEL_47;
  }
LABEL_78:
}

- (void)_navigationSessionStopped:(id)a3 movingToSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    char v10 = 1;
  }
  else
  {
    id v11 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v10 = (v11 != 0) & isKindOfClass;
  }

  objc_initWeak(&location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100411364;
  v34[3] = &unk_1012E9838;
  objc_copyWeak(&v36, &location);
  char v37 = v10;
  id v13 = v6;
  id v35 = v13;
  id v14 = objc_retainBlock(v34);
  id v15 = [v13 navigationType];
  if (v15 == (id)2) {
    goto LABEL_10;
  }
  if (v15 != (id)3)
  {
    if (v15 != (id)4) {
      goto LABEL_36;
    }
LABEL_10:
    v16 = sub_10000AF10();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_28:

      if (+[UIApplication _maps_isAnySceneForegroundForRole:_UIWindowSceneSessionTypeCoverSheet])
      {
        unsigned __int8 v30 = +[UIApplication _maps_lockScreenSceneDelegate];
        [v30 mapsAppCoordinatorWillEndLockscreenSession];
      }
      [(AppCoordinator *)self _popSteppingModeWithCompletion:v14];
      goto LABEL_36;
    }
    v17 = self;
    if (!v17)
    {
      v22 = @"<nil>";
      goto LABEL_27;
    }
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      v20 = [(AppCoordinator *)v17 performSelector:"accessibilityIdentifier"];
      v21 = v20;
      if (v20 && ([v20 isEqualToString:v19] & 1) == 0)
      {
        v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_17;
      }
    }
    v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_17:

LABEL_27:
    *(_DWORD *)buf = 138543362;
    v40 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Stepping navigation stopped; will pop step mode",
      buf,
      0xCu);

    goto LABEL_28;
  }
  v23 = sub_10000AF10();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = self;
    if (!v24)
    {
      v29 = @"<nil>";
      goto LABEL_32;
    }
    v25 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v25);
    if (objc_opt_respondsToSelector())
    {
      v27 = [(AppCoordinator *)v24 performSelector:"accessibilityIdentifier"];
      id v28 = v27;
      if (v27 && ([v27 isEqualToString:v26] & 1) == 0)
      {
        v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

        goto LABEL_25;
      }
    }
    v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
LABEL_25:

LABEL_32:
    *(_DWORD *)buf = 138543362;
    v40 = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}@] Turn-by-turn navigation stopped; will pop nav mode",
      buf,
      0xCu);
  }
  if (+[UIApplication _maps_isAnySceneForegroundForRole:_UIWindowSceneSessionTypeCoverSheet])
  {
    v31 = +[UIApplication _maps_lockScreenSceneDelegate];
    [v31 mapsAppCoordinatorWillEndLockscreenSession];
  }
  [(AppCoordinator *)self _popNavModeWithCompletion:v14];
LABEL_36:
  v32 = +[GEOAPSharedStateData sharedData];
  [v32 setMapUiShownActiveNavMode:0];

  v33 = +[GEOAPSharedStateData sharedData];
  [v33 setHasMapUiShownActiveNavMode:0];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

- (int)_analyticsPipelineTransportModeForMSPTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 5) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  id v10 = a3;
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  id v6 = [WeakRetained topIOSBasedContext];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_chromeViewController);
    id v9 = [v8 topIOSBasedContext];
    [v9 getCurrentSceneTitleWithCompletion:v10];
  }
}

- (void)openSearch:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AppCoordinator *)self startSearchModeWithCompletion:0];
  id v8 = [(AppCoordinator *)self baseActionCoordinator];
  [v8 viewController:0 doSearchItem:v7 withUserInfo:v6];
}

- (void)openSearch:(id)a3 andResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isSearchAlongRoute])
  {
    id v8 = +[CarDisplayController sharedInstance];
    unsigned int v9 = [v8 isCarAppSceneHostingNavigation];

    if (v9)
    {
      id v10 = +[CarDisplayController sharedInstance];
      CFStringRef v13 = @"Source";
      id v14 = &off_1013A6FD0;
      id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v12 = [v10 processSearchFieldItem:v6 searchInfo:v7 userInfo:v11];
    }
    else
    {
      id v10 = [(AppCoordinator *)self navActionCoordinator];
      [v10 setCurrentSearchInfo:v7];
    }
  }
  else
  {
    [(AppCoordinator *)self startSearchModeWithCompletion:0];
    id v10 = [(AppCoordinator *)self baseActionCoordinator];
    [v10 restoreSearchForItem:v6 withResults:v7 sessionOrigin:2];
  }
}

- (void)addStopWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v9 = [(AppCoordinator *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    id v12 = [v4 name];
    *(_DWORD *)buf = 138543618;
    id v15 = v11;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] adding stop with MapItem: %@", buf, 0x16u);
  }
  CFStringRef v13 = [(AppCoordinator *)self navActionCoordinator];
  [v13 detourToMapItem:v4];
}

- (void)addStopWithWaypoint:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v9 = [(AppCoordinator *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    id v12 = [v4 uniqueID];
    *(_DWORD *)buf = 138543618;
    id v15 = v11;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] adding stop with waypoint: %@", buf, 0x16u);
  }
  CFStringRef v13 = [(AppCoordinator *)self navActionCoordinator];
  [v13 detourToWaypoint:v4];
}

- (void)openCollection:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100411B28;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained popToRootContextAnimated:1 completion:v7];
}

- (BOOL)isRoutePlanningPresented
{
  v2 = [(AppCoordinator *)self baseActionCoordinator];
  unsigned __int8 v3 = [v2 isRoutePlanningPresented];

  return v3;
}

- (void)toggleRoutePlanning
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100411C44;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [WeakRetained popToRootContextAnimated:1 completion:v4];
}

- (void)enterRoutePlanningWithDirectionItem:(id)a3 withUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100411D60;
  v11[3] = &unk_1012E66E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [WeakRetained popToRootContextAnimated:1 completion:v11];
}

- (void)enterRouteCreationWithMapItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 _hikeAssociatedInfo];
  id v9 = [v8 encryptedTourMuid];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100411EFC;
  v12[3] = &unk_1012E98B0;
  objc_copyWeak(&v15, &location);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  +[MapsSavedRoutesManager fetchSavedRoutesWithTourMuid:v9 completion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)enterRouteCreationWithRoute:(id)a3 originMapItem:(id)a4 destinationMapItem:(id)a5 userInfo:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![(AppCoordinator *)self isPresentingRouteCreation])
  {
    [(AppCoordinator *)self setIsPresentingRouteCreation:1];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1004124C0;
    v26[3] = &unk_1012E5F78;
    v26[4] = self;
    id v27 = v16;
    v17 = objc_retainBlock(v26);
    v18 = sub_10057683C();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Presenting route editing", buf, 2u);
      }

      v20 = [v15 objectForKeyedSubscript:@"DirectionsRouteUUIDKey"];
      v21 = [[MapsCustomRouteViewContext alloc] initWithExistingRoute:v12];
      [(MapsCustomRouteViewContext *)v21 setHistoryUUID:v20];
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 138477827;
        id v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Presenting route creation with mapItem: %{private}@", buf, 0xCu);
      }

      if (v14)
      {
        v22 = [[SearchResult alloc] initWithMapItem:v14];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
        v24 = [WeakRetained mapSelectionManager];
        [v24 injectPreviouslySelectedSearchResult:v22];
      }
      if (v13)
      {
        id v28 = v13;
        v20 = +[NSArray arrayWithObjects:&v28 count:1];
      }
      else
      {
        v20 = 0;
      }
      v21 = [[MapsRouteCreationContext alloc] initWithExistingMapItems:v20];
    }
    id v25 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    [v25 pushContext:v21 animated:1 completion:v17];
  }
}

- (void)openParentMapItem:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004125C0;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained popToRootContextAnimated:1 completion:v7];
}

- (void)openRelatedMapItems:(id)a3 withTitle:(id)a4 originalMapItem:(id)a5 analyticsDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10041273C;
  v19[3] = &unk_1012E98D8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [WeakRetained popToRootContextAnimated:1 completion:v19];
}

- (void)openCuratedCollectionWithIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10041284C;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained popToRootContextAnimated:1 completion:v7];
}

- (void)openGuidesHomeWithGuideLocation:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100412958;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained popToRootContextAnimated:1 completion:v7];
}

- (void)openPublisherWithIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100412A64;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained popToRootContextAnimated:1 completion:v7];
}

- (void)openAllCuratedCollections
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100412B44;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [WeakRetained popToRootContextAnimated:1 completion:v4];
}

- (void)openCuratedCollectionsList:(id)a3 usingTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100412C60;
  v11[3] = &unk_1012E66E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [WeakRetained popToRootContextAnimated:1 completion:v11];
}

- (void)presentPOIEnrichmentWithCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(AppCoordinator *)self baseActionCoordinator];
  [v5 viewControllerPresentPOIEnrichmentWithCoordinator:v4];
}

- (void)openUserProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100412DAC;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [WeakRetained popToRootContextAnimated:1 completion:v4];
}

- (void)openVehicleList
{
  unsigned __int8 v3 = +[VGVirtualGarageService sharedService];
  [v3 virtualGarageForceFetchAllVehicles];

  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  [v4 viewControllerPresentVirtualGarage:0];
}

- (void)viewControllerShowOfflineMaps:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100412EF0;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [WeakRetained popToRootContextAnimated:1 completion:v5];
}

- (void)viewControllerShowExpiredOfflineMaps:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100412FC4;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [WeakRetained popToRootContextAnimated:1 completion:v5];
}

- (void)showOfflineMapRegionSelectorForRegion:(id)a3 name:(id)a4 pushDataManagementFirst:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (GEOSupportsOfflineMaps())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1004130F8;
    v11[3] = &unk_1012E8138;
    BOOL v14 = a5;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    [WeakRetained popToRootContextAnimated:1 completion:v11];
  }
}

- (NavModeController)navModeController
{
  navModeController = self->_navModeController;
  if (!navModeController)
  {
    id v4 = [NavModeController alloc];
    id v5 = [(AppCoordinator *)self platformController];
    id v6 = [(NavModeController *)v4 initWithPlatformController:v5];
    id v7 = self->_navModeController;
    self->_navModeController = v6;

    navModeController = self->_navModeController;
  }

  return navModeController;
}

- (IOSTransitNavigationContext)transitNavigationContext
{
  transitNavigationContext = self->_transitNavigationContext;
  if (!transitNavigationContext)
  {
    id v4 = objc_alloc_init(IOSTransitNavigationContext);
    id v5 = self->_transitNavigationContext;
    self->_transitNavigationContext = v4;

    transitNavigationContext = self->_transitNavigationContext;
  }

  return transitNavigationContext;
}

- (NavActionCoordination)navActionCoordinator
{
  return [(NavModeController *)self->_navModeController actionCoordinator];
}

- (StepActionCoordination)stepActionCoordinator
{
  return [(StepModeController *)self->_stepModeController actionCoordinator];
}

- (void)startNavigationWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1004137EC;
  v40[3] = &unk_1012E9928;
  objc_copyWeak(&v43, &location);
  id v33 = v6;
  id v41 = v33;
  v42 = self;
  long long v7 = *(_OWORD *)&a4->guidanceType;
  long long v44 = *(_OWORD *)&a4->shouldSimulateLocations;
  long long v45 = v7;
  long long v46 = *(_OWORD *)&a4->isReconnecting;
  unint64_t navigationModeContext = a4->navigationModeContext;
  id v8 = objc_retainBlock(v40);
  id v9 = +[UIApplication sharedMapsDelegate];
  id v10 = [v9 appSessionController];
  id v11 = [v10 currentlyNavigatingPlatformController];

  if (v11)
  {
    id v12 = [(AppCoordinator *)self platformController];
    BOOL v13 = v11 == v12;

    if (!v13)
    {
      BOOL v14 = sub_10000AF10();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_14:

        id v21 = +[NSBundle mainBundle];
        v32 = [v21 localizedStringForKey:@"Route in Progress" value:@"localized string not found" table:0];

        id v22 = +[NSBundle mainBundle];
        v31 = [v22 localizedStringForKey:@"Are you sure you want to end navigation?" value:@"localized string not found" table:0];

        id v23 = +[UIAlertController alertControllerWithTitle:v32 message:v31 preferredStyle:1];
        v24 = +[NSBundle mainBundle];
        id v25 = [v24 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100414064;
        v38[3] = &unk_1012E8EB8;
        objc_copyWeak(&v39, &location);
        id v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:v38];
        [v23 addAction:v26];

        id v27 = +[NSBundle mainBundle];
        id v28 = [v27 localizedStringForKey:@"End Navigation" value:@"localized string not found" table:0];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1004141F0;
        v34[3] = &unk_1012E9978;
        objc_copyWeak(&v37, &location);
        id v35 = v11;
        id v36 = v8;
        v29 = +[UIAlertAction actionWithTitle:v28 style:0 handler:v34];
        [v23 addAction:v29];

        id v30 = [(AppCoordinator *)self chromeViewController];
        [v30 _maps_topMostPresentViewController:v23 animated:1 completion:0];

        objc_destroyWeak(&v37);
        objc_destroyWeak(&v39);

        goto LABEL_15;
      }
      id v15 = self;
      if (!v15)
      {
        id v20 = @"<nil>";
        goto LABEL_13;
      }
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      if (objc_opt_respondsToSelector())
      {
        id v18 = [(AppCoordinator *)v15 performSelector:"accessibilityIdentifier"];
        BOOL v19 = v18;
        if (v18 && ([v18 isEqualToString:v17] & 1) == 0)
        {
          id v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

          goto LABEL_10;
        }
      }
      id v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_10:

LABEL_13:
      *(_DWORD *)buf = 138543362;
      char v50 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] Ask for kMapsInterruptionMaybeEndNavigation", buf, 0xCu);

      goto LABEL_14;
    }
  }
  ((void (*)(void *))v8[2])(v8);
LABEL_15:

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)endNavigationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100414844;
  v7[3] = &unk_1012E9950;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  id v6 = objc_retainBlock(v7);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v6[2])(v6);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)endNavigationAndReturnToRoutePlanning:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000AF10();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  id v6 = self;
  if (!v6)
  {
    id v11 = @"<nil>";
    goto LABEL_10;
  }
  long long v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(AppCoordinator *)v6 performSelector:"accessibilityIdentifier"];
    id v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v49 = v11;
  __int16 v50 = 1024;
  BOOL v51 = v3;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] endNavigationAndReturnToRoutePlanning: %d", buf, 0x12u);

LABEL_11:
  id v12 = [(AppCoordinator *)self platformController];
  BOOL v13 = [v12 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    id v16 = [(AppCoordinator *)self platformController];
    id v17 = [v16 sessionStack];
    id v18 = sub_1000990A8(v17, &stru_1012E99B8);

    id dismissNavigationCompletion = self->_dismissNavigationCompletion;
    self->_id dismissNavigationCompletion = 0;

    id v20 = [(AppCoordinator *)self platformController];
    id v21 = v20;
    if (v3)
    {
      [v20 popUntil:&stru_1012E99F8];
LABEL_33:

      goto LABEL_34;
    }
    [v20 clearSessions];

    p_chromeViewController = &self->_chromeViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v24 = [WeakRetained contexts];
    id v25 = [v24 count];

    if (!v25)
    {
LABEL_34:

      goto LABEL_35;
    }
    id v26 = [v15 currentRouteCollection];
    id v27 = [v26 currentRoute];
    id v28 = [v27 destination];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v29 = v28;
    }
    else {
      v29 = 0;
    }
    id v30 = v29;

    if (v30)
    {
      id v21 = [v30 route];
    }
    else
    {
      v31 = [v15 currentRouteCollection];
      id v21 = [v31 currentRoute];
    }
    unint64_t v32 = (unint64_t)[v21 source] & 0xFFFFFFFFFFFFFFFELL;
    id v33 = objc_loadWeakRetained((id *)p_chromeViewController);
    v34 = v33;
    if (v32 == 2)
    {
      id v35 = [v33 contexts];
      id v36 = [v35 indexOfObjectPassingTest:&stru_1012E9A38];

      if (v36 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v42 = (MapsCustomRouteViewContext *)objc_loadWeakRetained((id *)p_chromeViewController);
        id v40 = [(MapsCustomRouteViewContext *)v42 contexts];
        id v41 = [v40 _maps_subarrayToIndex:v36];
        [(MapsCustomRouteViewContext *)v42 setContexts:v41 animated:1 completion:0];
        id v39 = v42;
        goto LABEL_32;
      }
      id v37 = [v18 configuration];
      id v38 = [v37 source];

      if (v38 == (id)1)
      {
        id v39 = [[MapsCustomRouteViewContext alloc] initWithExistingRoute:v21];
        id v40 = objc_loadWeakRetained((id *)p_chromeViewController);
        id v41 = [v40 contexts];
        v42 = [v41 firstObject];
        v47[0] = v42;
        v47[1] = v39;
        id v43 = +[NSArray arrayWithObjects:v47 count:2];
        [v40 setContexts:v43 animated:1 completion:0];

LABEL_32:
        goto LABEL_33;
      }
      id v39 = (MapsCustomRouteViewContext *)objc_loadWeakRetained((id *)p_chromeViewController);
      id v40 = [(MapsCustomRouteViewContext *)v39 contexts];
      id v41 = [v40 firstObject];
      long long v46 = v41;
      long long v44 = &v46;
    }
    else
    {
      id v39 = (MapsCustomRouteViewContext *)v33;
      id v40 = [(MapsCustomRouteViewContext *)v39 contexts];
      id v41 = [v40 firstObject];
      long long v45 = v41;
      long long v44 = &v45;
    }
    v42 = +[NSArray arrayWithObjects:v44 count:1];
    [(MapsCustomRouteViewContext *)v39 setContexts:v42 animated:1 completion:0];

    goto LABEL_32;
  }
LABEL_35:
}

- (BOOL)applyPendingActionIfNeeded
{
  BOOL v3 = [(AppCoordinator *)self chromeViewController];
  id v4 = [v3 mapsActionController];
  unsigned int v5 = [v4 pendingAction];

  if (v5)
  {
    id v6 = [(AppCoordinator *)self chromeViewController];
    long long v7 = [v6 mapsActionController];
    [v7 navigationEnded];
  }
  return v5;
}

- (void)_popNavModeWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    long long v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AppCoordinator *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Popping nav mode", buf, 0xCu);
  }
  id v12 = [(AppCoordinator *)self chromeViewController];
  BOOL v13 = [v12 mapsActionController];
  unsigned __int8 v14 = [v13 pendingAction];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained updateThemeForVisualEffectStyle:0];

  id v16 = self->_navModeController;
  id v17 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v18 = [v17 view];
  BOOL v19 = [v18 window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_initWeak((id *)buf, self);
  id v21 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1004153E8;
  v31[3] = &unk_1012E9A60;
  char v34 = isKindOfClass & 1;
  id v22 = v16;
  unint64_t v32 = v22;
  objc_copyWeak(&v33, (id *)buf);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100415510;
  v28[3] = &unk_1012E9A88;
  objc_copyWeak(&v30, (id *)buf);
  id v23 = v4;
  id v29 = v23;
  [v21 scheduleCoordinatedContextChange:v31 completionHandler:v28];

  if ((v14 & 1) == 0)
  {
    v24 = [(AppCoordinator *)self baseActionCoordinator];
    BOOL v25 = [v24 visibleViewModeBeforeDoingDirectionItem] == (id)3;

    if (v25)
    {
      id v26 = [(AppCoordinator *)self baseActionCoordinator];
      [v26 updateViewMode:3 animated:0];
    }
  }
  navModeController = self->_navModeController;
  self->_navModeController = 0;

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak((id *)buf);
}

- (void)_popSteppingModeWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    long long v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AppCoordinator *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Popping step mode", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  BOOL v13 = [WeakRetained topContext];
  unsigned __int8 v14 = v13;
  if (v13 == self->_stepModeController)
  {

    goto LABEL_22;
  }
  id v15 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v16 = [v15 topContext];
  transitNavigationContext = self->_transitNavigationContext;

  if (v16 == transitNavigationContext)
  {
LABEL_22:
    id v27 = [(AppCoordinator *)self stepActionCoordinator];
    [v27 setAppCoordinator:0];

    stepModeController = self->_stepModeController;
    self->_stepModeController = 0;

    id v29 = self->_transitNavigationContext;
    self->_transitNavigationContext = 0;

    id v30 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    [v30 updateThemeForVisualEffectStyle:0];

    id v31 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1004159E0;
    v33[3] = &unk_1012E76E8;
    v33[4] = self;
    id v34 = v4;
    [v31 popContextAnimated:1 completion:v33];

    id v32 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    [v32 commitCoordinatedContextChange];

    goto LABEL_23;
  }
  id v18 = sub_10000AF10();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    BOOL v19 = self;
    id v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      id v22 = [(AppCoordinator *)v19 performSelector:"accessibilityIdentifier"];
      id v23 = v22;
      if (v22 && ![v22 isEqualToString:v21])
      {
        v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

        goto LABEL_19;
      }
    }
    v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_19:

    id v25 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    id v26 = [v25 topContext];
    *(_DWORD *)buf = 138543618;
    id v36 = v24;
    __int16 v37 = 2112;
    id v38 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] The top mode is currently not the step mode nor the transit mode (%@); will apply pending action and return",
      buf,
      0x16u);
  }
  [(AppCoordinator *)self applyPendingActionIfNeeded];
LABEL_23:
}

- (void)displayTransitSchedulesForMapItem:(id)a3 departureSequence:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[_TtC4Maps23TransitSchedulesContext alloc] initWithMapItem:v7 departureSequence:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained pushContext:v9 animated:1 completion:0];
}

- (void)displayTransitSchedulesForRouteStep:(id)a3
{
  id v4 = a3;
  id v6 = [[_TtC4Maps23TransitSchedulesContext alloc] initWithRouteStep:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained pushContext:v6 animated:1 completion:0];
}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AppCoordinator *)self baseActionCoordinator];
  [v8 displayIncidentReportSubmissionWithItem:v7 report:v6];
}

- (void)startRideBookingSessionWithRideBookingRideOption:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[RidesharingModeController alloc] initWithRideOption:v4];

  ridesharingModeController = self->_ridesharingModeController;
  self->_ridesharingModeController = v5;
  id v7 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained pushContext:v7 animated:1 completion:0];
}

- (void)continueRideBookingSessionWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[RidesharingModeController alloc] initWithApplicationIdentifier:v4];

  ridesharingModeController = self->_ridesharingModeController;
  self->_ridesharingModeController = v5;
  id v7 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained pushContext:v7 animated:1 completion:0];
}

- (void)dismissRidesharingSessionAndReturnToRoutePlanning:(BOOL)a3
{
  BOOL v3 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100415EC4;
  v15[3] = &unk_1012E5D08;
  v15[4] = self;
  unsigned int v5 = objc_retainBlock(v15);
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v8 = WeakRetained;
  if (v3)
  {
    id v9 = [WeakRetained topContext];
    id v10 = [(AppCoordinator *)self ridesharingModeController];

    if (v9 == v10)
    {
      id v12 = objc_loadWeakRetained((id *)p_chromeViewController);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100415FE8;
      v13[3] = &unk_1012E6EA8;
      unsigned __int8 v14 = v5;
      [v12 popContextAnimated:1 completion:v13];
    }
    else
    {
      ((void (*)(void *))v5[2])(v5);
    }
  }
  else
  {
    [WeakRetained popToRootContextAnimated:0 completion:0];

    id v11 = [(AppCoordinator *)self platformController];
    [v11 clearSessions];
  }
}

- (void)showFullscreenDirectionsList
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041606C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)enterFlyoverForMapItem:(id)a3
{
  p_chromeViewController = &self->_chromeViewController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  id v7 = [WeakRetained _currentContainerViewController];
  [v7 setContaineesHidden:1];

  id v10 = [[FlyoverModeController alloc] initWithMapItem:v5];
  id v8 = [(FlyoverModeController *)v10 actionCoordinator];
  [v8 setAppCoordinator:self];
  id v9 = objc_loadWeakRetained((id *)p_chromeViewController);
  [v9 pushContext:v10 animated:1 completion:0];
}

- (void)exitFlyover
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v4 = [WeakRetained topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_loadWeakRetained((id *)p_chromeViewController);
    [v6 popContextAnimated:1 completion:0];
  }
}

- (void)shareItem:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v13 = a4;
  id v9 = a3;
  id v10 = [[MapsActivityViewController alloc] initWithShareItem:v9];

  [(MapsActivityViewController *)v10 setMapsActivityDelegate:self];
  shareViewController = self->_shareViewController;
  self->_shareViewController = v10;
  id v12 = v10;

  [(AppCoordinator *)self _presentActivityViewController:self->_shareViewController sourceView:v13 completion:v8];
}

- (void)shareCollection:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 canShare])
  {
    id v11 = [v8 sharingURL];
    if (v11)
    {
      id v12 = [[PersonalCollectionShareItemSource alloc] initWithCollectionHandlerInfo:v8];
      id v13 = [[MapsActivityViewController alloc] initWithShareItem:v12];
      [(AppCoordinator *)self _presentActivityViewController:v13 sourceView:v9 completion:v10];
    }
  }
  else
  {
    unsigned __int8 v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = +[NSString stringWithFormat:@"Attempting to share an empty collection. Share action should be disabled or hidden on the UI"];
      int v18 = 136315906;
      BOOL v19 = "-[AppCoordinator shareCollection:sourceView:completion:]";
      __int16 v20 = 2080;
      id v21 = "AppCoordinator.m";
      __int16 v22 = 1024;
      int v23 = 1048;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v18, 0x26u);
    }
    if (sub_100BB36BC())
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = +[NSThread callStackSymbols];
        int v18 = 138412290;
        BOOL v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (void)shareCuratedCollection:(id)a3 withRefinedMapItems:(id)a4 sourceView:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v16 collectionURL];
  if (v13)
  {
    unsigned __int8 v14 = [[CuratedCollectionShareItemSource alloc] initWithPlaceCollection:v16 refinedMapItems:v10];
    id v15 = [[MapsActivityViewController alloc] initWithShareItem:v14];
    [(AppCoordinator *)self _presentActivityViewController:v15 sourceView:v11 completion:v12];
  }
}

- (void)sharePublisher:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v13 publisherURL];
  if (v10)
  {
    id v11 = [[CuratedCollectionShareItemSource alloc] initWithPublisher:v13];
    id v12 = [[MapsActivityViewController alloc] initWithShareItem:v11];
    [(AppCoordinator *)self _presentActivityViewController:v12 sourceView:v8 completion:v9];
  }
}

- (void)_presentActivityViewController:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = v8;
    id v11 = a3;
    [v10 bounds];
    double MidX = v12;
    double MidY = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    id v20 = a3;
    id v21 = [(AppCoordinator *)self chromeViewController];
    id v10 = [v21 view];

    [v10 bounds];
    double MidX = CGRectGetMidX(v29);
    [v10 bounds];
    double MidY = CGRectGetMidY(v30);
    double v17 = 1.0;
    double v19 = 1.0;
  }
  __int16 v22 = [a3 popoverPresentationController];
  [v22 setSourceView:v10];

  int v23 = [a3 popoverPresentationController];
  [v23 setSourceRect:MidX, MidY, v17, v19];

  __int16 v24 = [a3 popoverPresentationController];
  [v24 setPermittedArrowDirections:15];

  id v25 = [(AppCoordinator *)self chromeViewController];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1004168BC;
  v27[3] = &unk_1012E6EA8;
  id v28 = v9;
  id v26 = v9;
  [v25 _maps_topMostPresentViewController:a3 animated:1 completion:v27];
}

- (void)startTableBookingFlowFromMapItem:(id)a3
{
  id v4 = a3;
  id v6 = [[PlaceCardItem alloc] initWithMapItem:v4];

  id v5 = [(AppCoordinator *)self baseActionCoordinator];
  [v5 viewController:0 displayTableBookingFor:v6];
}

- (void)editLocationForParkedCar:(id)a3
{
  id v4 = a3;
  id v5 = [(AppCoordinator *)self baseActionCoordinator];
  [v5 viewController:0 editLocationForParkedCar:v4];
}

- (void)archiveMapsActivity
{
  id v2 = [(AppCoordinator *)self mapsSceneDelegate];
  [v2 archiveMapsActivity];
}

- (void)setNeedsUserActivityUpdate
{
  id v2 = [(AppCoordinator *)self mapsSceneDelegate];
  [v2 setNeedsUserActivityUpdate];
}

- (MKMapView)mapsActivityMapView
{
  id v2 = [(AppCoordinator *)self chromeViewController];
  BOOL v3 = [v2 mapView];

  return (MKMapView *)v3;
}

- (void)mapsActivityViewControllerPrint:(id)a3
{
  id v7 = a3;
  id v4 = [v7 route];

  id v5 = [(AppCoordinator *)self chromeViewController];
  if (v4)
  {
    id v6 = [v7 route];
    [v5 printRoute:v6];
  }
  else
  {
    id v6 = +[SearchSession currentSearchSession];
    [v5 printSearchResultFromSession:v6];
  }
}

- (void)mapsActivityViewControllerPresentRoutingApps:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v5 = [WeakRetained topContext];
  id v6 = [(AppCoordinator *)self baseModeController];

  if (v5 == v6)
  {
    id v7 = [(AppCoordinator *)self baseActionCoordinator];
    [v7 presentRoutePlanningViewType:6];
  }
}

- (void)mapsActivityViewController:(id)a3 activityCompleted:(BOOL)a4
{
}

- (void)dismissShareIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AppCoordinator *)self chromeViewController];
  id v6 = [v5 presentedViewController];
  shareViewController = self->_shareViewController;

  if (v6 == shareViewController)
  {
    id v8 = [(AppCoordinator *)self chromeViewController];
    [v8 dismissViewControllerAnimated:v3 completion:0];
  }
  id v9 = self->_shareViewController;
  self->_shareViewController = 0;
}

- (void)displayOrScheduleDisplayOfEnqueuedFixedProblem:(id)a3
{
  id v4 = [a3 copy];
  id fixedProblemCompletion = self->_fixedProblemCompletion;
  self->_id fixedProblemCompletion = v4;

  [(AppCoordinator *)self _displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:0];
}

- (void)openSharedTrips
{
}

- (void)_openSharedTrip:(id)a3
{
  id v4 = (__CFString *)a3;
  if (MSPSharedTripReceivingAvailable())
  {
    id v5 = sub_100576A9C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      if (v4)
      {
        if ([(__CFString *)v4 disallowDetailsForChina])
        {
          id v13 = sub_100576A9C();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
LABEL_48:

            [(AppCoordinator *)self presentChinaAlertForSharedTrip:v4];
            goto LABEL_59;
          }
          double v14 = self;
          if (!v14)
          {
            double v19 = @"<nil>";
            goto LABEL_47;
          }
          id v15 = (objc_class *)objc_opt_class();
          double v16 = NSStringFromClass(v15);
          if (objc_opt_respondsToSelector())
          {
            double v17 = [(AppCoordinator *)v14 performSelector:"accessibilityIdentifier"];
            double v18 = v17;
            if (v17 && ![v17 isEqualToString:v16])
            {
              double v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

              goto LABEL_21;
            }
          }
          double v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_21:

LABEL_47:
          *(_DWORD *)buf = 138543618;
          __int16 v50 = v19;
          __int16 v51 = 2112;
          v52 = v4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Shared trip is not allowed for China: %@", buf, 0x16u);

          goto LABEL_48;
        }
        if ([(__CFString *)v4 disallowDetailsForTransportType])
        {
          id v20 = sub_100576A9C();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v21 = self;
            if (!v21)
            {
              id v26 = @"<nil>";
              goto LABEL_51;
            }
            __int16 v22 = (objc_class *)objc_opt_class();
            int v23 = NSStringFromClass(v22);
            if (objc_opt_respondsToSelector())
            {
              __int16 v24 = [(AppCoordinator *)v21 performSelector:"accessibilityIdentifier"];
              id v25 = v24;
              if (v24 && ![v24 isEqualToString:v23])
              {
                id v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

                goto LABEL_30;
              }
            }
            id v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_30:

LABEL_51:
            __int16 v37 = v26;
            id v38 = [(__CFString *)v4 transportType];
            if (v38 >= 7)
            {
              id v39 = +[NSString stringWithFormat:@"(unknown: %i)", v38];
            }
            else
            {
              id v39 = off_1012E9B68[(int)v38];
            }
            uint64_t UInteger = GEOConfigGetUInteger();
            *(_DWORD *)buf = 138544130;
            __int16 v50 = v37;
            __int16 v51 = 2112;
            v52 = v39;
            __int16 v53 = 2048;
            uint64_t v54 = UInteger;
            __int16 v55 = 2112;
            unint64_t v56 = (unint64_t)v4;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Shared trip is not allowed for transport type: %@. Allowed transport type bitmask: %lu. Trip: %@", buf, 0x2Au);
          }
LABEL_58:

          [(AppCoordinator *)self presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:v4];
          goto LABEL_59;
        }
        if ([(__CFString *)v4 disallowDetailsForProtocolVersion])
        {
          id v20 = sub_100576A9C();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_58;
          }
          id v27 = self;
          if (!v27)
          {
            id v32 = @"<nil>";
            goto LABEL_57;
          }
          id v28 = (objc_class *)objc_opt_class();
          CGRect v29 = NSStringFromClass(v28);
          if (objc_opt_respondsToSelector())
          {
            CGRect v30 = [(AppCoordinator *)v27 performSelector:"accessibilityIdentifier"];
            id v31 = v30;
            if (v30 && ![v30 isEqualToString:v29])
            {
              id v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v31];

              goto LABEL_39;
            }
          }
          id v32 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_39:

LABEL_57:
          id v41 = (__CFString *)[(__CFString *)v4 protocolVersion];
          uint64_t v42 = GEOConfigGetUInteger();
          *(_DWORD *)buf = 138544130;
          __int16 v50 = v32;
          __int16 v51 = 2048;
          v52 = v41;
          __int16 v53 = 2048;
          uint64_t v54 = v42;
          __int16 v55 = 2112;
          unint64_t v56 = (unint64_t)v4;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Shared trip protocol (%lu) is greater than ours (%lu). Trip: %@", buf, 0x2Au);

          goto LABEL_58;
        }
      }
      id v33 = [(AppCoordinator *)self chromeViewController];
      if (sub_1000BBB44(v33) == 5)
      {
        if (!v4)
        {
LABEL_45:

          goto LABEL_59;
        }
        id v34 = [(AppCoordinator *)self chromeViewController];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100417488;
        v46[3] = &unk_1012E66E0;
        v46[4] = self;
        v47 = v33;
        id v48 = v4;
        [v34 popToRootContextAnimated:1 completion:v46];

        id v35 = v47;
      }
      else
      {
        id v36 = [(AppCoordinator *)self chromeViewController];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100417658;
        v43[3] = &unk_1012E9AF8;
        long long v44 = v4;
        long long v45 = self;
        [v36 scheduleCoordinatedContextChange:v43 completionHandler:0];

        id v35 = v44;
      }

      goto LABEL_45;
    }
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_11;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AppCoordinator *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

LABEL_11:
    double v12 = [(__CFString *)v4 groupIdentifier];
    *(_DWORD *)buf = 138544386;
    __int16 v50 = v11;
    __int16 v51 = 2112;
    v52 = v12;
    __int16 v53 = 2048;
    uint64_t v54 = [(__CFString *)v4 transportType];
    __int16 v55 = 2048;
    unint64_t v56 = [(__CFString *)v4 protocolVersion];
    __int16 v57 = 1024;
    unsigned int v58 = [(__CFString *)v4 referenceFrame];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Opening shared trip: %@, transportType: %lu, protocolVersion: %lu, referenceFrame: %d", buf, 0x30u);

    goto LABEL_12;
  }
LABEL_59:
}

- (void)openSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = sub_100576A9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AppCoordinator *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    double v12 = [v4 groupIdentifier];
    *(_DWORD *)buf = 138544386;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 transportType];
    __int16 v24 = 2048;
    uint64_t v25 = [v4 protocolVersion];
    __int16 v26 = 1024;
    unsigned int v27 = [v4 referenceFrame];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Refreshing shared trip: %@, transportType: %lu, protocolVersion: %lu, referenceFrame: %d", buf, 0x30u);
  }
  objc_initWeak((id *)buf, self);
  id v13 = +[MSPSharedTripService sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100417A64;
  v15[3] = &unk_1012E9B48;
  id v14 = v4;
  id v16 = v14;
  objc_copyWeak(&v17, (id *)buf);
  [v13 refreshReceivedTripsWithCompletion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)closeSharedTrips
{
  BOOL v3 = [(AppCoordinator *)self chromeViewController];
  id v4 = [v3 traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)5)
  {
    id v10 = [(AppCoordinator *)self baseModeController];
    [v10 showSharedTrip:0];
  }
  else
  {
    id v6 = [(AppCoordinator *)self chromeViewController];
    id v7 = [v6 contexts];
    id v8 = [v7 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    id v10 = [(AppCoordinator *)self chromeViewController];
    [v10 popContextAnimated:1 completion:0];
  }
}

- (void)presentChinaAlertForSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v11 = [v5 localizedStringForKey:@"OK [Alert dismissal]" value:@"localized string not found" table:0];

  id v6 = [v4 alertTitleForDisallowedDetails];
  id v7 = [v4 alertMessageForChinaError];

  id v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];
  [v8 addAction:v9];

  id v10 = [(AppCoordinator *)self chromeViewController];
  [v10 _maps_topMostPresentViewController:v8 animated:1 completion:0];
}

- (void)presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v11 = [v5 localizedStringForKey:@"OK [Alert dismissal]" value:@"localized string not found" table:0];

  id v6 = [v4 alertTitleForDisallowedDetails];
  id v7 = [v4 alertMessageForTransportOrProtocolError];

  id v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];
  [v8 addAction:v9];

  id v10 = [(AppCoordinator *)self chromeViewController];
  [v10 _maps_topMostPresentViewController:v8 animated:1 completion:0];
}

- (void)presentAlertForMissingSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v11 = [v5 localizedStringForKey:@"OK [Alert dismissal]" value:@"localized string not found" table:0];

  id v6 = [v4 alertTitleForDisallowedDetails];
  id v7 = [v4 alertMessageForClosedTrip];

  id v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];
  [v8 addAction:v9];

  id v10 = [(AppCoordinator *)self chromeViewController];
  [v10 _maps_topMostPresentViewController:v8 animated:1 completion:0];
}

- (id)lookAroundActionCoordinator
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v4 = [WeakRetained topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_loadWeakRetained((id *)p_chromeViewController);
    id v7 = [v6 topContext];

    id v8 = [v7 actionCoordinator];
  }
  else
  {
    id v9 = sub_1005764AC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_loadWeakRetained((id *)p_chromeViewController);
      id v11 = [v10 topContext];
      double v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error: lookAroundActionCoordinator requested while topContext=%@", (uint8_t *)&v15, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)enterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v10 = a5;
  id v20 = a3;
  id v13 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  int v15 = [WeakRetained topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v17 = -[LookAroundModeController initWithEntryPoint:lookAroundView:showsFullScreen:originFrame:]([LookAroundModeController alloc], "initWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v20, v13, v10, x, y, width, height);
    double v18 = [(LookAroundModeController *)v17 actionCoordinator];
    [v18 setAppCoordinator:self];
    id v19 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    [v19 pushContext:v17 animated:1 completion:0];
  }
}

- (void)exitLookAround
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  id v5 = [WeakRetained topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = objc_loadWeakRetained((id *)p_chromeViewController);
    id v8 = [v7 topContext];

    id v9 = objc_loadWeakRetained((id *)p_chromeViewController);
    BOOL v10 = [v9 mapView];

    id v11 = [v8 lookAroundView];
    [v11 setNavigatingEnabled:0];
    [v11 setPanningEnabled:0];
    [v11 setZoomingEnabled:0];
    [v11 setShowsRoadLabels:0];
    [v11 setShowsPointLabels:0];
    if (![v11 hasEnteredLookAround])
    {
      id v17 = 0;
LABEL_15:
      id v27 = objc_loadWeakRetained((id *)p_chromeViewController);
      [v27 popContextAnimated:1 completion:v17];

      id v28 = [v8 actionCoordinator];
      [v28 setAppCoordinator:0];

      return;
    }
    double v12 = [v11 mapItem];
    if (!v12)
    {
      [v10 centerCoordinate];
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      __int16 v22 = [(AppCoordinator *)self baseActionCoordinator];
      [v22 clearSearch];

      uint64_t v23 = [(AppCoordinator *)self baseActionCoordinator];
      [v23 presentSearchAnimated:0];

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1004186F0;
      v34[3] = &unk_1012E8160;
      id v35 = v10;
      uint64_t v36 = v19;
      uint64_t v37 = v21;
      id v17 = objc_retainBlock(v34);
      int v15 = v35;
LABEL_14:

      goto LABEL_15;
    }
    id v13 = [(AppCoordinator *)self baseActionCoordinator];
    id v14 = [v13 currentMapItem];
    int v15 = [v14 _geoMapItem];

    id v16 = [v12 _geoMapItem];
    if (GEOMapItemIsEqualToMapItemForPurpose()) {
      goto LABEL_5;
    }
    if (sub_1000BBB44(v10) == 5)
    {
      if (sub_1000BBB44(v10) != 5)
      {
LABEL_5:
        [v12 _coordinate];
        [v10 setCenterCoordinate:1 animated:];
        id v17 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100418778;
      v29[3] = &unk_1012E5D58;
      v29[4] = self;
      id v30 = v12;
      id v17 = objc_retainBlock(v29);
      __int16 v24 = v30;
    }
    else
    {
      [v10 _deselectLabelMarkerAnimated:1];
      uint64_t v25 = [(AppCoordinator *)self baseActionCoordinator];
      [v25 clearSearch];

      __int16 v26 = [(AppCoordinator *)self baseActionCoordinator];
      [v26 presentSearchAnimated:0];

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100418704;
      v31[3] = &unk_1012E5D58;
      id v32 = v12;
      id v33 = self;
      id v17 = objc_retainBlock(v31);
      __int16 v24 = v32;
    }

    goto LABEL_13;
  }
}

- (void)enterPedestrianARWithRoute:(id)a3 guidanceObserver:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(AppCoordinator *)self chromeViewController];
  id v8 = [v7 topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    BOOL v10 = [PedestrianARContext alloc];
    id v11 = [(AppCoordinator *)self platformController];
    double v12 = +[MNNavigationService sharedService];
    id v13 = [(PedestrianARContext *)v10 initWithRoute:v16 platformController:v11 guidanceObserver:v6 navigationService:v12];

    id v14 = [(AppCoordinator *)self chromeViewController];
    [v14 pushContext:v13 animated:1 completion:0];

    int v15 = [(AppCoordinator *)self chromeViewController];
    [v15 commitCoordinatedContextChange];
  }
}

- (void)exitPedestrianAR
{
  BOOL v3 = [(AppCoordinator *)self chromeViewController];
  id v4 = [v3 topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(AppCoordinator *)self chromeViewController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100418A0C;
    v8[3] = &unk_1012E5D08;
    v8[4] = self;
    [v6 popContextAnimated:1 completion:v8];

    id v7 = [(AppCoordinator *)self chromeViewController];
    [v7 commitCoordinatedContextChange];
  }
}

- (MKMapView)mapViewForPPTTest
{
  id v2 = [(AppCoordinator *)self chromeViewController];
  BOOL v3 = [v2 mapView];

  return (MKMapView *)v3;
}

- (void)setPPTTestViewMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AppCoordinator *)self chromeViewController];
  [v6 updateViewMode:a3 animated:v4];
}

- (void)pptTestResetForLaunchURL
{
  id v2 = [(AppCoordinator *)self chromeViewController];
  [v2 resetForLaunchURLWithOptions:0];
}

- (void)pptTestPresentPlaceCardForSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___PPTTestPlaceCardProtocol]) {
    [v6 pptTestPresentPlaceCardForSearchResult:v7 animated:v4];
  }
}

- (BOOL)pptTestCanResizePlacecard
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestPlaceCardProtocol]) {
    unsigned __int8 v3 = [v2 pptTestCanResizePlacecard];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)pptTestMaximizePlaceCardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestPlaceCardProtocol]) {
    [v4 pptTestMaximizePlaceCardAnimated:v3];
  }
}

- (void)pptTestMinimizePlaceCardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestPlaceCardProtocol]) {
    [v4 pptTestMinimizePlaceCardAnimated:v3];
  }
}

- (void)pptTestMediumizePlaceCardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestPlaceCardProtocol]) {
    [v4 pptTestMediumizePlaceCardAnimated:v3];
  }
}

- (void)pptTestSearchRetainQueryForSelectedSearchCompletion:(id)a3
{
  id v5 = a3;
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v4 pptTestSearchRetainQueryForSelectedSearchCompletion:v5];
  }
}

- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3
{
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v4 pptTestSearchNearbyCategoryWithIndex:a3];
  }
}

- (void)pptTestAutocompleteSearchForFieldItem:(id)a3
{
  id v5 = a3;
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v4 pptTestAutocompleteSearchForFieldItem:v5];
  }
}

- (void)pptTestSearchEndEditing
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v2 pptTestSearchEndEditing];
  }
}

- (void)pptTestSearchForFieldItem:(id)a3
{
  id v5 = a3;
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v4 pptTestSearchForFieldItem:v5];
  }
}

- (void)pptTestRefreshSearch
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v2 pptTestRefreshSearch];
  }
}

- (void)pptTestEnterSearchMode
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v2 pptTestEnterSearchMode];
  }
}

- (void)pptTestSearchCancel
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v2 pptTestSearchCancel];
  }
}

- (void)pptSelectFirstCuratedGuide
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v2 pptSelectFirstCuratedGuide];
  }
}

- (void)pptSelectSeeAllCuratedCollections
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v2 pptSelectSeeAllCuratedCollections];
  }
}

- (void)pptSelectFirstGuidePublisher
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v2 pptSelectFirstGuidePublisher];
  }
}

- (void)pptSelectACSuggestionMatchingAddress:(id)a3
{
  id v5 = a3;
  id v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSearchProtocol]) {
    [v4 pptSelectACSuggestionMatchingAddress:v5];
  }
}

- (void)pptTestCreateCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___PPTTestETAProtocol]) {
    [v7 pptTestCreateCustomSearchResultForDroppedPinAtPoint:v4 animated:latitude, longitude];
  }
}

- (void)setPPTTestDirectionsPlan:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(AppCoordinator *)self appStateManager];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestRouteProtocol]) {
    [v4 setPPTTestDirectionsPlan:v5];
  }
}

- (void)pptTestPresentDirectionsDetails
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestDirectionsDetailsProtocol]) {
    [v2 pptTestPresentDirectionsDetails];
  }
}

- (UIViewController)pptTestContaineeForDirectionsDetails
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestDirectionsDetailsProtocol])
  {
    BOOL v3 = [v2 pptTestContaineeForDirectionsDetails];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (UIViewController *)v3;
}

- (UIScrollView)pptTestScrollViewForDirectionsDetails
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestDirectionsDetailsProtocol])
  {
    BOOL v3 = [v2 pptTestScrollViewForDirectionsDetails];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (UIScrollView *)v3;
}

- (void)pptTestDoDirectionItem:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceProtocol]) {
    [v4 pptTestDoDirectionItem:v5];
  }
}

- (void)pptTestStartNavigation
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestNavigationProtocol]) {
    [v2 pptTestStartNavigation];
  }
}

- (void)pptTestEndNavigation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  BOOL v4 = [(AppCoordinator *)self transitNavigationContext];
  unsigned int v5 = [WeakRetained isTopContext:v4];

  if (v5)
  {
    id v6 = +[MNNavigationService sharedService];
    [v6 stopNavigationWithReason:10];
  }
  else
  {
    if ([(AppCoordinator *)self pptTestSupportStepping]) {
      [(AppCoordinator *)self stepActionCoordinator];
    }
    else {
    id v6 = [(AppCoordinator *)self navActionCoordinator];
    }
    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___PPTTestNavigationProtocol]) {
      [v6 pptTestEndNavigation];
    }
  }
}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  id v2 = [(AppCoordinator *)self navActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestNavigationProtocol]) {
    [v2 pptTestTransitionBetweenFullAndLightGuidance];
  }
}

- (void)pptTestOpenCommuteEntry:(id)a3
{
}

- (BOOL)pptTestSupportStepping
{
  BOOL v3 = [(AppCoordinator *)self chromeViewController];
  if ([v3 isTopContext:self->_stepModeController])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned int v5 = [(AppCoordinator *)self chromeViewController];
    id v6 = [(AppCoordinator *)self transitNavigationContext];
    unsigned __int8 v4 = [v5 isTopContext:v6];
  }
  return v4;
}

- (int64_t)pptTestCurrentStepIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unsigned __int8 v4 = [(AppCoordinator *)self transitNavigationContext];
  unsigned int v5 = [WeakRetained isTopContext:v4];

  if (v5)
  {
    id v6 = [(AppCoordinator *)self transitNavigationContext];
  }
  else
  {
    id v6 = [(AppCoordinator *)self stepActionCoordinator];
    if (![v6 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol])
    {
      id v7 = 0;
      goto LABEL_6;
    }
  }
  id v7 = [v6 pptTestCurrentStepIndex];
LABEL_6:

  return (int64_t)v7;
}

- (BOOL)pptTestHasNextStep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unsigned __int8 v4 = [(AppCoordinator *)self transitNavigationContext];
  unsigned int v5 = [WeakRetained isTopContext:v4];

  if (v5)
  {
    id v6 = [(AppCoordinator *)self transitNavigationContext];
  }
  else
  {
    id v6 = [(AppCoordinator *)self stepActionCoordinator];
    if (![v6 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol])
    {
      unsigned __int8 v7 = 0;
      goto LABEL_6;
    }
  }
  unsigned __int8 v7 = [v6 pptTestHasNextStep];
LABEL_6:

  return v7;
}

- (void)pptTestMoveToNextStep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unsigned __int8 v4 = [(AppCoordinator *)self transitNavigationContext];
  unsigned int v5 = [WeakRetained isTopContext:v4];

  if (v5)
  {
    id v6 = [(AppCoordinator *)self transitNavigationContext];
  }
  else
  {
    id v8 = [(AppCoordinator *)self stepActionCoordinator];
    unsigned int v7 = [v8 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol];
    id v6 = v8;
    if (!v7) {
      goto LABEL_5;
    }
  }
  id v9 = v6;
  [v6 pptTestMoveToNextStep];
  id v6 = v9;
LABEL_5:
}

- (BOOL)pptTestMoveToBoardStep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unsigned __int8 v4 = [(AppCoordinator *)self transitNavigationContext];
  unsigned int v5 = [WeakRetained isTopContext:v4];

  if (v5)
  {
    id v6 = [(AppCoordinator *)self transitNavigationContext];
  }
  else
  {
    id v6 = [(AppCoordinator *)self stepActionCoordinator];
    if (![v6 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol])
    {
      unsigned __int8 v7 = 0;
      goto LABEL_6;
    }
  }
  unsigned __int8 v7 = [v6 pptTestMoveToBoardStep];
LABEL_6:

  return v7;
}

- (void)pptTestPauseRealtimeTransitUpdates
{
  id v2 = +[MNNavigationService sharedService];
  [v2 pauseRealtimeUpdates];
}

- (void)pptTestResumeRealtimeTransitUpdates
{
  id v2 = +[MNNavigationService sharedService];
  [v2 resumeRealtimeUpdates];
}

- (void)pptTestStartTracePlaybackFromPath:(id)a3
{
  id v4 = a3;
  id v5 = [(AppCoordinator *)self chromeViewController];
  [v5 debugController:0 choseTraceAtPath:v4 startNav:1];
}

- (void)pptTestOpenSettings
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestSettingsProtocol]) {
    [v2 pptTestOpenSettings];
  }
}

- (UIScrollView)pptTestScrollViewForProactive
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestProactiveProtocol])
  {
    BOOL v3 = [v2 pptTestScrollViewForProactive];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (UIScrollView *)v3;
}

- (void)pptTestOpenRecents
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestRecentsProtocol]) {
    [v2 pptTestOpenRecents];
  }
}

- (void)pptTestEnterAR
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestARProtocol]) {
    [v2 pptTestEnterAR];
  }
}

- (void)pptTestExitAR
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestARProtocol]) {
    [v2 pptTestExitAR];
  }
}

- (void)pptTestOpenCollections
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestCollectionsProtocol]) {
    [v2 pptTestOpenCollections];
  }
}

- (void)pptTestOpenFirstCollection
{
  id v2 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestCollectionsProtocol]) {
    [v2 pptTestOpenFirstCollection];
  }
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  id v2 = [(AppCoordinator *)self _pptChromeTrayCoordinatorForCurrentMode];
  unsigned __int8 v3 = [v2 pptTestCanUpdateTrayLayout];

  return v3;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AppCoordinator *)self _pptChromeTrayCoordinatorForCurrentMode];
  [v6 pptTestUpdateTrayLayout:a3 animated:v4];
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  BOOL v4 = [(AppCoordinator *)self _pptChromeTrayCoordinatorForCurrentMode];
  LOBYTE(a3) = [v4 pptTestIsTrayType:a3];

  return a3;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(AppCoordinator *)self _pptChromeTrayCoordinatorForCurrentMode];
  [v6 pptTestDismissTrayAnimated:v5 assertTrayType:a4];
}

- (UIScrollView)pptTestScrollView
{
  id v2 = [(AppCoordinator *)self _pptChromeTrayCoordinatorForCurrentMode];
  unsigned __int8 v3 = [v2 pptTestScrollView];

  return (UIScrollView *)v3;
}

- (id)_pptChromeTrayCoordinatorForCurrentMode
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  BOOL v5 = [WeakRetained topContext];
  baseModeController = self->_baseModeController;

  if (v5 == baseModeController)
  {
    id v16 = [(AppCoordinator *)self baseActionCoordinator];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_chromeViewController);
    id v8 = [v7 topContext];
    navModeController = self->_navModeController;

    if (v8 == navModeController)
    {
      id v16 = [(AppCoordinator *)self navActionCoordinator];
    }
    else
    {
      id v10 = objc_loadWeakRetained((id *)p_chromeViewController);
      id v11 = [v10 topContext];
      stepModeController = self->_stepModeController;

      if (v11 == stepModeController)
      {
        id v16 = [(AppCoordinator *)self stepActionCoordinator];
      }
      else
      {
        id v13 = objc_loadWeakRetained((id *)p_chromeViewController);
        id v14 = [v13 topContext];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v16 = [(AppCoordinator *)self lookAroundActionCoordinator];
        }
        else
        {
          id v17 = objc_loadWeakRetained((id *)p_chromeViewController);
          uint64_t v18 = [(AppCoordinator *)self transitNavigationContext];
          unsigned int v19 = [v17 isTopContext:v18];

          if (!v19)
          {
            id v21 = 0;
            uint64_t v20 = 0;
            goto LABEL_14;
          }
          id v16 = [(AppCoordinator *)self transitNavigationContext];
        }
      }
    }
  }
  uint64_t v20 = v16;
  if ([v16 conformsToProtocol:&OBJC_PROTOCOL___PPTTestChromeTrayProtocol])
  {
    id v21 = v20;
    uint64_t v20 = v21;
  }
  else
  {
    id v21 = 0;
  }
LABEL_14:

  return v21;
}

- (void)pptTestPresentPlacecardWithMapItem:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestVenuesProtocol]) {
    [v4 pptTestPresentPlacecardWithMapItem:v5];
  }
}

- (void)pptTestPresentVenueForMapItem:(id)a3 searchCategory:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___PPTTestVenuesProtocol]) {
    [v7 pptTestPresentVenueForMapItem:v8 searchCategory:v6];
  }
}

- (void)pptTestSelectVenueSearchResult:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(AppCoordinator *)self baseActionCoordinator];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PPTTestVenuesProtocol]) {
    [v4 pptTestSelectVenueSearchResult:v5];
  }
}

- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  id v9 = [(AppCoordinator *)self iosBasedChromeViewController];
  id v10 = [v9 topContext];

  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___PPTTestLookAroundProtocol]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12
    || (([(AppCoordinator *)self baseActionCoordinator],
         id v10 = objc_claimAutoreleasedReturnValue(),
         ![v10 conformsToProtocol:&OBJC_PROTOCOL___PPTTestLookAroundProtocol])
      ? (id v13 = 0)
      : (id v13 = v10),
        id v14 = v13,
        v10,
        v14))
  {
    [v10 pptTestEnterLookAroundWithEntryPoint:v15 lookAroundView:v8 showsFullScreen:v5];
  }
}

- (RidesharingModeController)ridesharingModeController
{
  return self->_ridesharingModeController;
}

- (void)setPlatformController:(id)a3
{
}

- (void)setAppStateManager:(id)a3
{
}

- (MapsSceneDelegate)mapsSceneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapsSceneDelegate);

  return (MapsSceneDelegate *)WeakRetained;
}

- (StepModeController)stepModeController
{
  return self->_stepModeController;
}

- (FlyoverActionCoordination)flyoverActionCoordinator
{
  return self->_flyoverActionCoordinator;
}

- (BOOL)isPresentingRouteCreation
{
  return self->_isPresentingRouteCreation;
}

- (void)setIsPresentingRouteCreation:(BOOL)a3
{
  self->_isPresentingRouteCreation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);
  objc_storeStrong((id *)&self->_flyoverActionCoordinator, 0);
  objc_storeStrong((id *)&self->_stepModeController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_mapsSceneDelegate);
  objc_storeStrong((id *)&self->_appStateManager, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_transitNavigationContext, 0);
  objc_storeStrong((id *)&self->_ridesharingModeController, 0);
  objc_storeStrong((id *)&self->_navModeController, 0);
  objc_storeStrong((id *)&self->_baseModeController, 0);
  objc_storeStrong(&self->_dismissNavigationCompletion, 0);
  objc_storeStrong(&self->_fixedProblemCompletion, 0);
  objc_storeStrong((id *)&self->_analyticsMonitor, 0);

  objc_storeStrong((id *)&self->_shareViewController, 0);
}

@end