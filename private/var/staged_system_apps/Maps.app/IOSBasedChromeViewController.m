@interface IOSBasedChromeViewController
+ (BOOL)mapInsetsShouldRespectSafeAreaInsetsByDefault;
+ (Class)userLocationViewClass;
- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey;
- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey;
- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey;
- (AppCoordinator)appCoordinator;
- (BOOL)_canShowLookAroundButton;
- (BOOL)_canShowWeather;
- (BOOL)_canShowWhileLocked;
- (BOOL)_defaultPrefersStatusBarHidden;
- (BOOL)_internal_isChromeDisabled;
- (BOOL)_internal_topContextWantsCompassLayoutControl;
- (BOOL)_isNavigationMode;
- (BOOL)_shouldCollapseLookoaroundPreview;
- (BOOL)_shouldShowSearchFloatingControl;
- (BOOL)_shouldShowTrafficForViewMode:(int64_t)a3;
- (BOOL)_suppressOverlaysForActiveFullscreenContainer;
- (BOOL)canDropPin;
- (BOOL)canEnter3dMode;
- (BOOL)canEnterLookAroundMode;
- (BOOL)canExitLookAroundMode;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canRemovePin;
- (BOOL)canSnapToNorth;
- (BOOL)displayNavigationAlertAndShouldContinue;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isNightMode;
- (BOOL)isSnappedToNorth;
- (BOOL)isTransitioningToLockScreen;
- (BOOL)isWeatherBelowCards;
- (BOOL)locationPulseEnabled;
- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)removesMapViewWhenInactive;
- (BOOL)shouldUseModernMap;
- (BOOL)willMoveToOrFromSecureLockScreenUI:(BOOL)a3;
- (CGRect)popoverPresentationRectForPrintController:(id)a3;
- (DefaultTransportTypeFinder)defaultTransportTypeFinder;
- (FloatingControlsOverlay)floatingControlsOverlay;
- (IOSBasedChromeContext)currentIOSBasedContext;
- (IOSBasedChromeViewController)init;
- (IOSCardsOverlay)cardsOverlay;
- (InterruptionManager)interruptionManager;
- (LookAroundChromeOverlay)lookAroundOverlay;
- (MapsActionController)mapsActionController;
- (MapsUserLocationView)userLocationView;
- (NSString)errorString;
- (OverlayManager)overlayManager;
- (ParkedCarManager)parkedCarManager;
- (PrintController)printController;
- (RidesharingAnnotationsManager)ridesharingAnnotationsManager;
- (RouteAnnotationsController)routeAnnotationsControllerIfExisted;
- (SettingsController)settingsController;
- (SharedTripsAnnotationsController)sharedTripsAnnotationsController;
- (UIColor)statusBarAdditionalColor;
- (UILayoutGuide)innerLayoutGuide;
- (UILayoutGuide)weatherLayoutGuide;
- (ViewModeDelegate)viewModeDelegate;
- (WeatherOverlay)weatherOverlay;
- (_TtC4Maps23RedoSearchChromeOverlay)redoSearchOverlay;
- (double)statusBarHeight;
- (id)_currentContainerViewController;
- (id)_currentContainerViewControllerWithContext:(id)a3;
- (id)_defaultStatusBarBackgroundViewStyle;
- (id)_lookAroundButtonPlaceCardItem;
- (id)acquireModernMapTokenForReason:(unint64_t)a3;
- (id)allComponents;
- (id)allVisibleMapViewsButNotCarPlayForDebugController:(id)a3;
- (id)allVisibleMapViewsForDebugController:(id)a3;
- (id)baseModeController;
- (id)coordinator;
- (id)currentCollectionShareItemSource;
- (id)currentShareItemSource;
- (id)currentTraits;
- (id)fullscreenViewControllerTransitionFromController:(id)a3 toController:(id)a4 isDismissTransition:(BOOL)a5;
- (id)lookAroundCoordinator;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)mapViewResponder;
- (id)navActionCoordinator;
- (id)personalizedItemSourcesForCurrentState;
- (id)routeCreationContext;
- (id)venuesManagerForFloatingControlsOverlay:(id)a3;
- (id)viewsToRenderMapsScreenshotService:(id)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)displayedMapType;
- (int64_t)_defaultPreferredStatusBarStyle;
- (int64_t)_desiredFloatingControlsForCurrentState;
- (int64_t)displayedViewMode;
- (int64_t)modernMapProjectionType;
- (int64_t)modernMapTerrainMode;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_createOverlaysIfNeeded:(BOOL)a3;
- (void)_freezeInnerLayoutGuide;
- (void)_handleLogTileState:(id)a3;
- (void)_initializePrintingController;
- (void)_loadInternalDebugSetting;
- (void)_resetTracking:(BOOL)a3;
- (void)_sceneConnectionsDidChange;
- (void)_teardownViewHierarchyForTesting;
- (void)_teardownViewHierarchyWithActionCoordinator:(id)a3 shouldAnimate:(BOOL)a4;
- (void)_updateCardsForCurrentStateWithAnimation:(id)a3;
- (void)_updateFloatingControlsDidChangePitching:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateFloatingControlsForCurrentStateWithAnimation:(id)a3;
- (void)_updateInnerLayoutGuideWithTopViewController:(id)a3;
- (void)_updateLookAroundButtonWithAnimation:(id)a3;
- (void)_updateMapViewResponderTargetForObject:(id)a3;
- (void)_updateMapViewWithEVChargingConfig;
- (void)_updateModernMapCartographicConfiguration;
- (void)_updateOfflineModernMapToken;
- (void)_updateRedoSearchButtonWithAnimation:(id)a3;
- (void)_updateStatusBarForCurrentStateWithAnimation:(id)a3;
- (void)_updateStatusBarSupplementaryViewWithAnimation:(id)a3;
- (void)_updateViewModeForLabelsDisplayIfNeeded;
- (void)_updateViewModeForTrafficDisplayIfNeeded;
- (void)_updateWeatherWithAnimation:(id)a3;
- (void)_windowUserInterfaceStyleDidChange;
- (void)centerMapToUserLocation;
- (void)chromeNavigationDisplayDidRenderRoute:(id)a3;
- (void)cleanUIandHideSearch;
- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)copy:(id)a3;
- (void)createCustomSearchResultForDroppedPinAtCenterPoint;
- (void)createCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 animated:(BOOL)a5;
- (void)createScreenshotService;
- (void)dealloc;
- (void)debugController:(id)a3 choseTraceAtPath:(id)a4 startNav:(BOOL)a5;
- (void)debugControllerDidFinish:(id)a3;
- (void)decrementForToken:(id)a3;
- (void)defaultZoom;
- (void)didMoveToOrFromSecureLockScreenUI:(BOOL)a3;
- (void)didUpdateForcedExploreMapConfiguration:(BOOL)a3;
- (void)directionsTypeForMapItem:(id)a3 handler:(id)a4;
- (void)dismissAllModalViewsIfPresentAnimated:(BOOL)a3 completion:(id)a4;
- (void)displayNavShareETA;
- (void)displayNearbySearch;
- (void)enterLookAroundForMapItem:(id)a3 isMarkedLocation:(BOOL)a4 lookAroundView:(id)a5;
- (void)enterLookAroundPIP;
- (void)enterLookAroundPIP:(id)a3;
- (void)exitLookAround;
- (void)find:(id)a3;
- (void)floatingControlsOverlay:(id)a3 didTapEnterPedestrianARFromButton:(id)a4;
- (void)floatingControlsOverlayDidTapCloseSettingsTip:(id)a3;
- (void)floatingControlsOverlayDidTapEnter3DMode:(id)a3;
- (void)floatingControlsOverlayDidTapExit3DMode:(id)a3;
- (void)floatingControlsOverlayDidTapOpenSettings:(id)a3;
- (void)floatingControlsOverlayDidTapRefreshCurrentSearch:(id)a3;
- (void)floatingControlsOverlayDidTapTTRButton:(id)a3;
- (void)incrementForToken:(id)a3;
- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4;
- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForLabelMarker:(id)a4;
- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4;
- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4;
- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5;
- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5;
- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didFailToLocateUserWithError:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 didUpdateYaw:(double)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4;
- (void)mapViewDidFinishLoadingMap:(id)a3;
- (void)mapViewWillStartLoadingMap:(id)a3;
- (void)openUserProfile;
- (void)overlayControllerDidUpdateMapInsets:(id)a3 fromOverlay:(id)a4;
- (void)prepareMapViewForFirstUse;
- (void)presentMapsDebugControllerIfEnabled;
- (void)printCurrentState;
- (void)printRoute:(id)a3;
- (void)printSearchResultFromSession:(id)a3;
- (void)registerFramesInDebugFramesView:(id)a3;
- (void)removeDroppedPin;
- (void)reportCurrentLocationFailure;
- (void)resetForEditingShortcut:(id)a3;
- (void)resetForLaunchURLWithOptions:(id)a3;
- (void)resetForTestingAction;
- (void)routeFromSearchResult:(id)a3 toSearchResult:(id)a4 directionsType:(unint64_t)a5 drivePreferences:(id)a6 routeHandle:(id)a7 timePoint:(id)a8 withFeedback:(id)a9 origin:(int64_t)a10 options:(id)a11;
- (void)searchForAddress:(id)a3 source:(int)a4;
- (void)searchForAddressString:(id)a3 source:(int)a4;
- (void)searchForExternalURLQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7;
- (void)searchForRouteFromAddress:(id)a3 toAddress:(id)a4 directionsMode:(unint64_t)a5 userInfo:(id)a6;
- (void)searchForSearchItem:(id)a3 traits:(id)a4 source:(int)a5;
- (void)searchForString:(id)a3 traits:(id)a4 scrollToResults:(BOOL)a5 source:(int)a6;
- (void)searchWithSearchInfo:(id)a3 source:(int)a4;
- (void)select3dMode;
- (void)selectLookAroundMode;
- (void)selectParkedCarAndPerformAction:(int64_t)a3;
- (void)setAppCoordinator:(id)a3;
- (void)setConnectedToCarPlay:(BOOL)a3;
- (void)setErrorString:(id)a3;
- (void)setFloatingControlsOverlay:(id)a3;
- (void)setInnerLayoutGuide:(id)a3;
- (void)setInterruptionManager:(id)a3;
- (void)setIsWeatherBelowCards:(BOOL)a3;
- (void)setLocationPulseEnabled:(BOOL)a3;
- (void)setLookAroundOverlay:(id)a3;
- (void)setMapsActionController:(id)a3;
- (void)setNeedsUserActivityUpdate;
- (void)setNeedsUserInterfaceAppearanceUpdate;
- (void)setRedoSearchOverlay:(id)a3;
- (void)setRidesharingAnnotationsManager:(id)a3;
- (void)setSharedTripsAnnotationsController:(id)a3;
- (void)setStatusBarAdditionalColor:(id)a3;
- (void)setSuggestedApplicationState:(int)a3;
- (void)setViewModeDelegate:(id)a3;
- (void)setWeatherLayoutGuide:(id)a3;
- (void)setWeatherOverlay:(id)a3;
- (void)shouldStartRedoSearch;
- (void)showAnnouncementForFlyover:(id)a3;
- (void)showFavoritesType:(int64_t)a3;
- (void)showRedoSearchOverlay:(BOOL)a3;
- (void)showTransitLine:(unint64_t)a3 withName:(id)a4;
- (void)snapToNorth;
- (void)stateManager:(id)a3 didChangeState:(BOOL)a4;
- (void)switchMapMode:(id)a3;
- (void)toggleLabels;
- (void)toggleTraffic;
- (void)undo:(id)a3;
- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5;
- (void)updateComponentsIfNeeded;
- (void)updateComponentsIfNeededWithTansitionCoordinator:(id)a3;
- (void)updateFramesInDebugFramesView:(id)a3;
- (void)updateHistoricalLocations;
- (void)updateLightLevelAnimated:(BOOL)a3 lightLevel:(int64_t)a4;
- (void)updateMapViewDisplayOptions;
- (void)updateThemeForVisualEffectStyle:(unint64_t)a3;
- (void)updateThemeViewAndControllers;
- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4 preserveMapSelection:(BOOL)a5;
- (void)updateViewMode:(int64_t)displayedViewMode animated:(BOOL)a4;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)virtualGarageDidUpdate:(id)a3;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation IOSBasedChromeViewController

- (void)updateHistoricalLocations
{
  v3 = +[DeviceRecentLocations sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100108320;
  v4[3] = &unk_1012F0F88;
  v4[4] = self;
  [v3 updateLocationsWithCompletionHandler:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOSBasedChromeViewController;
  [(IOSBasedChromeViewController *)&v4 viewDidAppear:a3];
  [(IOSBasedChromeViewController *)self createScreenshotService];
  [(IOSBasedChromeViewController *)self _createOverlaysIfNeeded:0];
  [(IOSBasedChromeViewController *)self updateComponentsIfNeeded];
  [(ChromeViewController *)self updateMapViewFrameRate];
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (SettingsController)settingsController
{
  settingsController = self->_settingsController;
  if (!settingsController)
  {
    objc_super v4 = objc_alloc_init(SettingsController);
    v5 = self->_settingsController;
    self->_settingsController = v4;

    [(SettingsController *)self->_settingsController setChrome:self];
    settingsController = self->_settingsController;
  }

  return settingsController;
}

- (void)_updateOfflineModernMapToken
{
  BOOL v3 = self->_usingOfflineDataModernMapToken == 0;
  objc_super v4 = +[GEOOfflineService shared];
  unsigned int v5 = [v4 isUsingOffline];

  if (((v3 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      v6 = [(IOSBasedChromeViewController *)self acquireModernMapTokenForReason:4];
    }
    else
    {
      v6 = 0;
    }
    id usingOfflineDataModernMapToken = self->_usingOfflineDataModernMapToken;
    self->_id usingOfflineDataModernMapToken = v6;

    id v9 = [(ChromeViewController *)self mapView];
    v8 = [v9 _mapLayer];
    [v8 clearScene];
  }
}

- (void)setNeedsUserActivityUpdate
{
  id v2 = [(IOSBasedChromeViewController *)self _maps_mapsSceneDelegate];
  [v2 setNeedsUserActivityUpdate];
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)IOSBasedChromeViewController;
  id v8 = a5;
  [(ChromeViewController *)&v10 contextStackWillUpdateFrom:a3 to:a4 withAnimation:v8];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107B68;
  v9[3] = &unk_1012E5D08;
  v9[4] = self;
  [v8 addPreparation:v9];
}

- (void)_updateMapViewResponderTargetForObject:(id)a3
{
  id v7 = a3;
  unsigned int v4 = sub_1000BBF90((uint64_t)v7, (Protocol *)&OBJC_PROTOCOL___MapViewResponderHandling);
  unsigned int v5 = [(IOSBasedChromeViewController *)self mapViewResponder];
  if (v4) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }
  [v5 setTarget:v6];
}

- (void)decrementForToken:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 tokenGroupName];
  unsigned int v6 = [v5 isEqualToString:@"IOSBasedChromeMetros"];

  if (v6)
  {
    id v7 = sub_1000C49B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Releasing modern map token: %@", buf, 0xCu);
    }

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"ChromeViewControllerDidUpdateShouldUseModernMap" object:self];

    id v9 = [(ChromeViewController *)self mapView];

    if (v9) {
      [(IOSBasedChromeViewController *)self _updateModernMapCartographicConfiguration];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v10 decrementForToken:v4];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IOSBasedChromeViewController;
  id v8 = [(ChromeViewController *)&v12 mapView:v6 viewForAnnotation:v7];
  if (!v8)
  {
    id v9 = [(IOSBasedChromeViewController *)self ridesharingAnnotationsManager];
    id v8 = [v9 mapView:v6 viewForAnnotation:v7];

    if (!v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (+[SearchResultsDebugOverlay viewForAnnotation:v7], (id v8 = (MapsRippleAnnotationView *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (id v8 = [[TransitVehiclePositionAnnotationView alloc] initWithAnnotation:v7 reuseIdentifier:0]) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (-[IOSBasedChromeViewController sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController"), v11 = objc_claimAutoreleasedReturnValue(), [v11 mapView:v6 viewForAnnotation:v7], id v8 = (MapsRippleAnnotationView *)objc_claimAutoreleasedReturnValue(), v11, !v8))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v8 = [[MapsRippleAnnotationView alloc] initWithAnnotation:v7 reuseIdentifier:@"rippleView"];
            }
            else {
              id v8 = 0;
            }
          }
        }
      }
    }
  }

  return v8;
}

- (id)fullscreenViewControllerTransitionFromController:(id)a3 toController:(id)a4 isDismissTransition:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (sub_1000BBF90((uint64_t)v8, (Protocol *)&OBJC_PROTOCOL___ModeTransitionProtocol)
    && sub_1000BBF90((uint64_t)v9, (Protocol *)&OBJC_PROTOCOL___ModeTransitionProtocol))
  {
    objc_super v10 = objc_alloc_init(ModeTransitionController);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)IOSBasedChromeViewController;
    objc_super v10 = [(ChromeViewController *)&v13 fullscreenViewControllerTransitionFromController:v8 toController:v9 isDismissTransition:v5];
  }
  v11 = v10;

  return v11;
}

- (void)createScreenshotService
{
  if (!self->_screenshotService)
  {
    BOOL v3 = [MapsScreenshotService alloc];
    id v8 = [(IOSBasedChromeViewController *)self view];
    id v4 = [v8 window];
    BOOL v5 = [v4 windowScene];
    id v6 = [(MapsScreenshotService *)v3 initWithDelegate:self windowScene:v5];
    screenshotService = self->_screenshotService;
    self->_screenshotService = v6;
  }
}

- (void)viewLayoutMarginsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)IOSBasedChromeViewController;
  [(IOSBasedChromeViewController *)&v7 viewLayoutMarginsDidChange];
  BOOL v3 = [(IOSBasedChromeViewController *)self _currentContainerViewController];
  [v3 edgePadding];
  double v5 = v4;
  id v6 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  [v6 setMargin:v5];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  id v2 = [(ChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 fullscreenViewController];
  }
  else
  {
    BOOL v3 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 prefersHomeIndicatorAutoHidden];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  loadingMapNetworkActivity = self->_loadingMapNetworkActivity;
  self->_loadingMapNetworkActivity = 0;
  id v5 = a3;

  v6.receiver = self;
  v6.super_class = (Class)IOSBasedChromeViewController;
  [(IOSBasedChromeViewController *)&v6 mapViewDidFinishLoadingMap:v5];
}

- (BOOL)_canShowWeather
{
  if (sub_1000BBB44(self) == 5 && [(ChromeViewController *)self isTransitioning])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unsigned __int8 v4 = [(ChromeViewController *)self contexts];
    id v5 = [v4 reverseObjectEnumerator];

    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      int v3 = 0;
      uint64_t v8 = *(void *)v13;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0 && ![v10 permitsWeatherShowing]) {
          break;
        }
        if (objc_opt_respondsToSelector()) {
          v3 |= [v10 wantsWeatherShowing];
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }
    }
    LOBYTE(v3) = 0;
LABEL_17:
  }
  return v3 & 1;
}

- (void)_updateMapViewWithEVChargingConfig
{
  if (MapsFeature_IsEnabled_RealTimeEVCharger())
  {
    if (self->_displayedViewMode == 7)
    {
      objc_initWeak(&location, self);
      int v3 = +[VGVirtualGarageService sharedService];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100B71604;
      v5[3] = &unk_1012E65A8;
      objc_copyWeak(&v6, &location);
      [v3 virtualGarageGetGarageWithReply:v5];

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      id v4 = [(ChromeViewController *)self mapView];
      [v4 setShowsLiveEVData:0];
    }
  }
}

- (BOOL)_shouldShowTrafficForViewMode:(int64_t)a3
{
  if (a3 == 7) {
    return 1;
  }
  id v5 = [(IOSBasedChromeViewController *)self settingsController];
  unsigned int v6 = [v5 userDesiresTraffic];
  unsigned int v7 = (0x57u >> (a3 + 1)) & 1;
  if ((unint64_t)(a3 + 1) > 6) {
    LOBYTE(v7) = 0;
  }
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
    char v8 = 0;
  }
  else {
    char v8 = v7;
  }
  if (v6) {
    BOOL v3 = v8;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)updateMapViewDisplayOptions
{
  BOOL v3 = [(IOSBasedChromeViewController *)self settingsController];
  if ([v3 shouldChangeViewModeForLabels]) {
    [(IOSBasedChromeViewController *)self _updateViewModeForLabelsDisplayIfNeeded];
  }
  if ([v3 shouldChangeViewModeForTraffic]) {
    [(IOSBasedChromeViewController *)self _updateViewModeForTrafficDisplayIfNeeded];
  }
  uint64_t v4 = [(IOSBasedChromeViewController *)self _shouldShowTrafficForViewMode:[(IOSBasedChromeViewController *)self displayedViewMode]];
  id v5 = [(ChromeViewController *)self mapView];
  [v5 setShowsTraffic:v4];

  LOBYTE(v5) = [v3 userDesiresLabels];
  LOBYTE(v4) = [v3 userDesiresTraffic];
  unsigned int v6 = +[MapsAnalyticStateProvider serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108260;
  block[3] = &unk_101319970;
  char v8 = (char)v5;
  char v9 = v4;
  dispatch_async(v6, block);
}

- (void)_loadInternalDebugSetting
{
  id v7 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v7 BOOLForKey:@"DisableLocationPulse"] ^ 1;
  uint64_t v4 = [(ChromeViewController *)self mapView];
  [v4 _setLocationPulseEnabled:v3];

  id v5 = [v7 BOOLForKey:@"DebugConsoleEnabled"];
  unsigned int v6 = [(ChromeViewController *)self mapView];
  [v6 setLocationConsoleEnabled:v5];
}

- (BOOL)_suppressOverlaysForActiveFullscreenContainer
{
  uint64_t v3 = [(ChromeViewController *)self nextTopContext];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ChromeViewController *)self topContext];
  }
  unsigned int v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 fullscreenViewController];
  }
  else
  {
    id v7 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IOSBasedChromeViewController;
  id v9 = a4;
  [(ChromeViewController *)&v17 contextStackDidUpdateFrom:a3 to:v9 withAnimation:v8];
  objc_super v10 = [v9 lastObject];

  if (objc_opt_respondsToSelector())
  {
    v11 = [v10 fullscreenViewController];
  }
  else
  {
    v11 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100030BB8;
  v14[3] = &unk_101319950;
  v14[4] = self;
  id v15 = v11;
  id v16 = v10;
  id v12 = v10;
  id v13 = v11;
  [v8 addCompletion:v14];
}

- (void)prepareMapViewForFirstUse
{
  v16.receiver = self;
  v16.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v16 prepareMapViewForFirstUse];
  uint64_t v3 = [(ChromeViewController *)self mapView];
  [v3 _setUseBalloonCalloutsForLabels:1];
  [v3 setTintAdjustmentMode:1];
  [(IOSBasedChromeViewController *)self _updateOfflineModernMapToken];
  long long v15 = 0u;
  if (v3) {
    [v3 _cartographicConfiguration:0, 0, 0, 0];
  }
  if ([(IOSBasedChromeViewController *)self shouldUseModernMap]) {
    [(IOSBasedChromeViewController *)self modernMapTerrainMode];
  }
  if ([(IOSBasedChromeViewController *)self shouldUseModernMap]) {
    [(IOSBasedChromeViewController *)self modernMapProjectionType];
  }
  uint64_t v4 = [[MapViewResponder alloc] initWithMapView:v3];
  mapViewResponder = self->_mapViewResponder;
  self->_mapViewResponder = v4;

  [(EnvironmentObserver *)self->_environmentObserver setMapView:v3];
  id v6 = [v3 mapType];
  switch((unint64_t)v6)
  {
    case 1uLL:
      int64_t v7 = 2;
      break;
    case 2uLL:
      int64_t v7 = 1;
      break;
    case 3uLL:
      int64_t v7 = 6;
      break;
    case 4uLL:
      int64_t v7 = 5;
      break;
    default:
      uint64_t v8 = 3;
      if (v6 != (id)104) {
        uint64_t v8 = 0;
      }
      if (v6 == (id)103) {
        int64_t v7 = -1;
      }
      else {
        int64_t v7 = v8;
      }
      break;
  }
  self->_displayedViewMode = v7;
  id v9 = [(IOSBasedChromeViewController *)self userLocationView];
  [v9 setViewMode:v7];

  if (self->_logTileStateRecognizer) {
    goto LABEL_21;
  }
  objc_super v10 = +[GEOPlatform sharedPlatform];
  unsigned int v11 = [v10 isInternalInstall];

  if (v11)
  {
    id v12 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleLogTileState:"];
    logTileStateRecognizer = self->_logTileStateRecognizer;
    self->_logTileStateRecognizer = v12;

    [(UITapGestureRecognizer *)self->_logTileStateRecognizer setNumberOfTouchesRequired:3];
    [(UITapGestureRecognizer *)self->_logTileStateRecognizer setNumberOfTapsRequired:3];
    [(UITapGestureRecognizer *)self->_logTileStateRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)self->_logTileStateRecognizer setDelaysTouchesBegan:0];
  }
  if (self->_logTileStateRecognizer)
  {
LABEL_21:
    long long v14 = [(ChromeViewController *)self mapView];
    [v14 addGestureRecognizer:self->_logTileStateRecognizer];
  }
  [v3 _setDebugConsoleAdditionalInfoProvider:&stru_101319928];
}

- (BOOL)shouldUseModernMap
{
  return [(MapsTokenStorage *)self->_modernMapTokens count] != 0;
}

- (void)_updateInnerLayoutGuideWithTopViewController:(id)a3
{
  id v16 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v16 view],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [(IOSBasedChromeViewController *)self view],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v4 isDescendantOfView:v5],
        v5,
        v4,
        !v6))
  {
    uint64_t v8 = [(IOSBasedChromeViewController *)self cardsOverlay];
    id v9 = [v8 currentViewController];

    if (v9)
    {
      objc_super v10 = [(IOSBasedChromeViewController *)self cardsOverlay];
      [v10 innerLayoutGuide];
    }
    else
    {
      objc_super v10 = [(ChromeViewController *)self overlayController];
      [v10 contentLayoutGuide];
    int64_t v7 = };

    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int64_t v7 = [v16 innerLayoutGuide];
  if (v7)
  {
LABEL_9:
    +[NSLayoutConstraint deactivateConstraints:self->_innerLayoutGuideConstraints];
    unsigned int v11 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
    LODWORD(v12) = 1148846080;
    id v13 = [v11 _maps_constraintsEqualToEdgesOfLayoutGuide:v7 priority:v12];
    long long v14 = [v13 allConstraints];
    innerLayoutGuideConstraints = self->_innerLayoutGuideConstraints;
    self->_innerLayoutGuideConstraints = v14;

    +[NSLayoutConstraint activateConstraints:self->_innerLayoutGuideConstraints];
  }
LABEL_10:
}

- (void)updateComponentsIfNeededWithTansitionCoordinator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(GroupAnimation);
    -[GroupAnimation setAnimated:](v5, "setAnimated:", [v4 isAnimated]);
    unsigned int v6 = self;
    if (!v6)
    {
      unsigned int v11 = @"<nil>";
      goto LABEL_11;
    }
    int64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(IOSBasedChromeViewController *)v6 performSelector:"accessibilityIdentifier"];
      objc_super v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        unsigned int v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    unsigned int v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_11:
    double v12 = +[NSString stringWithFormat:@"%@: UIViewController transition coordinator animation", v11];
    id v13 = [(GroupAnimation *)v5 addCompletionWaitBlockWithReason:v12];

    id v17 = v13;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100107A7C;
    v18[3] = &unk_101319908;
    v18[4] = v6;
    v19 = v5;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100B6EF88;
    v16[3] = &unk_1012FEC60;
    id v14 = v13;
    long long v15 = v5;
    [v4 animateAlongsideTransition:v18 completion:v16];

    goto LABEL_12;
  }
  [(IOSBasedChromeViewController *)self updateComponentsIfNeeded];
LABEL_12:
}

- (void)_updateStatusBarSupplementaryViewWithAnimation:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [(ChromeViewController *)self contexts];
  unsigned int v6 = [v5 reverseObjectEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (!v7)
  {
LABEL_23:
    v19 = 0;
    goto LABEL_24;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v30;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v30 != v9) {
      objc_enumerationMutation(v6);
    }
    unsigned int v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
    if (objc_opt_respondsToSelector())
    {
      if ([v11 wantsStatusBarControl]) {
        break;
      }
    }
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_23;
    }
  }
  double v12 = sub_1000C49B4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = v11;
    if (!v13)
    {
      v18 = @"<nil>";
      goto LABEL_20;
    }
    id v14 = (objc_class *)objc_opt_class();
    long long v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      id v16 = [v13 performSelector:"accessibilityIdentifier"];
      id v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_18;
      }
    }
    v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_18:

LABEL_20:
    *(_DWORD *)buf = 138412290;
    v34 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[Status Bar Background View] %@ wants status bar control", buf, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_23;
  }
  v19 = [v11 statusBarSupplementaryView];
LABEL_24:

  statusBarSupplementaryView = self->_statusBarSupplementaryView;
  if (v19 != statusBarSupplementaryView)
  {
    v21 = statusBarSupplementaryView;
    objc_storeStrong((id *)&self->_statusBarSupplementaryView, v19);
    v22 = sub_1000C49B4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v34 = (__CFString *)v21;
      __int16 v35 = 2112;
      v36 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[Status Bar] supplementary view will change from %@ to %@", buf, 0x16u);
    }

    [(StatusBarSupplementaryView *)v21 removeFromSuperview];
    if (v19)
    {
      [(StatusBarSupplementaryView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(StatusBarBackgroundView *)self->_statusBarBackgroundView addSubview:v19];
      v23 = [(StatusBarSupplementaryView *)v19 initialConstraintsForAnimatingPositionInStatusBarBackgroundView:self->_statusBarBackgroundView];
      +[NSLayoutConstraint activateConstraints:v23];
    }
    else
    {
      v23 = 0;
    }
    v24 = [(IOSBasedChromeViewController *)self view];
    [v24 layoutIfNeeded];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100B6F014;
    v26[3] = &unk_1012E66E0;
    v26[4] = self;
    v27 = v19;
    id v28 = v23;
    id v25 = v23;
    [v4 addAnimations:v26];
  }
}

- (IOSBasedChromeViewController)init
{
  v19.receiver = self;
  v19.super_class = (Class)IOSBasedChromeViewController;
  id v2 = [(ChromeViewController *)&v19 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(ChromeViewController *)v2 setSearchContextDefaultsKeysPrefix:@"Main"];
    v3->_displayedViewMode = -1;
    id v4 = [[MapsTokenStorage alloc] initWithDelegate:v3 tokenGroupName:@"IOSBasedChromeMetros" callbackQueue:&_dispatch_main_q];
    modernMapTokens = v3->_modernMapTokens;
    v3->_modernMapTokens = v4;

    unsigned int v6 = objc_alloc_init(EnvironmentObserver);
    environmentObserver = v3->_environmentObserver;
    v3->_environmentObserver = v6;

    id v8 = +[GEOResourceManifestManager modernManager];
    [v8 addTileGroupObserver:v3->_environmentObserver queue:&_dispatch_main_q];

    +[MKUserLocation _setAnnotationClass:objc_opt_class()];
    uint64_t v9 = +[BrowseManager sharedManager];
    [v9 setUserInterfaceDelegate:v3];

    uint64_t v10 = +[MapsUIImageCache sharedCache];
    [v10 setUserInterfaceDelegate:v3];

    objc_initWeak(&location, v3);
    objc_copyWeak(&v17, &location);
    unsigned int v11 = +[CollectionManager sharedManager];
    [v11 setTraitsCreationBlock:&v16];

    double v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"_sceneConnectionsDidChange" name:UISceneWillConnectNotification object:0];

    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v3 selector:"_sceneConnectionsDidChange" name:UISceneDidDisconnectNotification object:0];

    [(IOSBasedChromeViewController *)v3 _sceneConnectionsDidChange];
    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v3 selector:"offlineStateChanged:" name:GEOOfflineStateChangedNotification object:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)_sceneConnectionsDidChange
{
  BOOL v3 = +[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay];

  [(IOSBasedChromeViewController *)self setConnectedToCarPlay:v3];
}

- (void)mapViewWillStartLoadingMap:(id)a3
{
  id v4 = a3;
  if (!self->_loadingMapNetworkActivity)
  {
    id v5 = +[LoadingIndicatorController sharedController];
    unsigned int v6 = [v5 beginShowingLoadingIndicator];
    loadingMapNetworkActivity = self->_loadingMapNetworkActivity;
    self->_loadingMapNetworkActivity = v6;
  }
  v8.receiver = self;
  v8.super_class = (Class)IOSBasedChromeViewController;
  [(IOSBasedChromeViewController *)&v8 mapViewWillStartLoadingMap:v4];
}

- (void)_updateCardsForCurrentStateWithAnimation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v6 = [v4 isAnimated];
  if (self->_externalContainerAppearanceNotification)
  {
    id v7 = sub_1000C49B4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    objc_super v8 = self;
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v11 = [(IOSBasedChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
      double v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v76 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] removing existing wait for external container to appear", buf, 0xCu);

LABEL_9:
    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 removeObserver:self->_externalContainerAppearanceNotification];

    id externalContainerAppearanceNotification = self->_externalContainerAppearanceNotification;
    self->_id externalContainerAppearanceNotification = 0;

    id v16 = objc_retainBlock(self->_externalContainerAppearanceWaitBlock);
    id externalContainerAppearanceWaitBlock = self->_externalContainerAppearanceWaitBlock;
    self->_id externalContainerAppearanceWaitBlock = 0;

    if (!v16)
    {
LABEL_18:

      goto LABEL_19;
    }
    v18 = sub_1000C49B4();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      (*((void (**)(id, void))v16 + 2))(v16, 0);
      goto LABEL_18;
    }
    objc_super v19 = self;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v66 = v6;
      id v22 = v5;
      v23 = [(IOSBasedChromeViewController *)v19 performSelector:"accessibilityIdentifier"];
      v24 = v23;
      if (v23 && ![v23 isEqualToString:v21])
      {
        id v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v24];

        id v5 = v22;
        unsigned __int8 v6 = v66;
        goto LABEL_16;
      }

      id v5 = v22;
      unsigned __int8 v6 = v66;
    }
    id v25 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_16:

    *(_DWORD *)buf = 138543362;
    v76 = v25;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] calling existing container appearance wait block", buf, 0xCu);

    goto LABEL_17;
  }
LABEL_19:
  unsigned __int8 v26 = [(IOSBasedChromeViewController *)self _suppressOverlaysForActiveFullscreenContainer];
  v27 = [(IOSBasedChromeViewController *)self cardsOverlay];
  id v28 = [v27 view];
  long long v29 = v28;
  if (v26)
  {
    [v28 setUserInteractionEnabled:0];

    long long v30 = [(IOSBasedChromeViewController *)self cardsOverlay];
    [(ChromeViewController *)self unregisterAdditionalMapViewDelegate:v30];

    id v31 = [(IOSBasedChromeViewController *)self _currentContainerViewController];
    long long v32 = [v31 parentViewController];

    if (v32 == self)
    {
LABEL_40:
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10002F85C;
      v68[3] = &unk_1012E7D28;
      v68[4] = self;
      [v4 addCompletion:v68];
      goto LABEL_41;
    }
    v33 = sub_1000C49B4();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
LABEL_34:

      v51 = self;
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      if (objc_opt_respondsToSelector())
      {
        v54 = [(IOSBasedChromeViewController *)v51 performSelector:"accessibilityIdentifier"];
        v55 = v54;
        if (v54 && ![v54 isEqualToString:v53])
        {
          v56 = +[NSString stringWithFormat:@"%@<%p, %@>", v53, v51, v55];

          goto LABEL_39;
        }
      }
      v56 = +[NSString stringWithFormat:@"%@<%p>", v53, v51];
LABEL_39:

      v57 = +[NSString stringWithFormat:@"%@: waiting for external container to appear", v56];
      v58 = [v4 addCompletionWaitBlockWithReason:v57];

      id v59 = [v58 copy];
      id v60 = v51->_externalContainerAppearanceWaitBlock;
      v51->_id externalContainerAppearanceWaitBlock = v59;

      v61 = +[NSNotificationCenter defaultCenter];
      v62 = +[NSOperationQueue mainQueue];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100050FE8;
      v69[3] = &unk_1013001C8;
      v69[4] = v51;
      id v70 = v58;
      id v63 = v58;
      v64 = [v61 addObserverForName:@"ContainerDidUnlockNotification" object:v31 queue:v62 usingBlock:v69];
      id v65 = self->_externalContainerAppearanceNotification;
      self->_id externalContainerAppearanceNotification = v64;

      goto LABEL_40;
    }
    v34 = self;
    __int16 v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    if (objc_opt_respondsToSelector())
    {
      id v67 = v5;
      v37 = [(IOSBasedChromeViewController *)v34 performSelector:"accessibilityIdentifier"];
      v38 = v37;
      if (v37 && ![v37 isEqualToString:v36])
      {
        v39 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

        id v5 = v67;
        goto LABEL_27;
      }

      id v5 = v67;
    }
    v39 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_27:

    *(_DWORD *)buf = 138543618;
    v76 = v39;
    __int16 v77 = 2114;
    id v78 = v31;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}@] blocking animation on appearance of external container %{public}@", buf, 0x16u);

    goto LABEL_34;
  }
  [v28 setUserInteractionEnabled:1];

  v40 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
  v41 = [(IOSBasedChromeViewController *)self cardsOverlay];
  [v41 setChromeContext:v40];

  v42 = [(IOSBasedChromeViewController *)self cardsOverlay];
  [(ChromeViewController *)self registerAdditionalMapViewDelegate:v42];

  v43 = self;
  v44 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v44);
  if (objc_opt_respondsToSelector())
  {
    v46 = [(IOSBasedChromeViewController *)v43 performSelector:"accessibilityIdentifier"];
    v47 = v46;
    if (v46 && ![v46 isEqualToString:v45])
    {
      v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v45, v43, v47];

      goto LABEL_33;
    }
  }
  v48 = +[NSString stringWithFormat:@"%@<%p>", v45, v43];
LABEL_33:

  v49 = +[NSString stringWithFormat:@"%@: updating controllers in chrome-owned card stack", v48];
  v50 = [v4 addCompletionWaitBlockWithReason:v49];

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100B70474;
  v71[3] = &unk_1012F7A50;
  v71[4] = v43;
  unsigned __int8 v74 = v6;
  id v72 = v5;
  id v73 = v50;
  id v31 = v50;
  [v4 addPreparation:v71];

LABEL_41:
}

- (void)_freezeInnerLayoutGuide
{
  BOOL v3 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  [v3 layoutFrame];
  CGFloat v45 = v5;
  CGFloat v47 = v4;
  CGFloat v43 = v6;
  CGFloat rect1 = v7;

  if (self->_innerLayoutGuideConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  objc_super v8 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  id v51 = [v8 owningView];

  [v51 bounds];
  CGFloat v36 = v9;
  CGFloat rect = v10;
  CGFloat v39 = v12;
  CGFloat v41 = v11;
  CGFloat left = UIEdgeInsetsZero.left;
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  v53.origin.CGFloat y = v45;
  v53.origin.x = v47;
  v53.size.CGFloat width = v43;
  v53.size.CGFloat height = rect1;
  v61.origin.x = CGRectZero.origin.x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  if (CGRectEqualToRect(v53, v61))
  {
    double v19 = bottom;
    double MinX = left;
    double top = UIEdgeInsetsZero.top;
  }
  else
  {
    v54.origin.x = v36;
    v54.size.CGFloat height = rect;
    v54.size.CGFloat width = v39;
    v54.origin.CGFloat y = v41;
    v62.origin.x = CGRectZero.origin.x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    double v19 = bottom;
    double MinX = left;
    double top = UIEdgeInsetsZero.top;
    if (!CGRectEqualToRect(v54, v62))
    {
      v55.origin.x = v47;
      v55.origin.CGFloat y = v45;
      v55.size.CGFloat width = v43;
      v55.size.CGFloat height = rect1;
      double top = CGRectGetMinY(v55);
      v56.origin.x = v47;
      v56.origin.CGFloat y = v45;
      v56.size.CGFloat width = v43;
      v56.size.CGFloat height = rect1;
      double MinX = CGRectGetMinX(v56);
      v57.size.CGFloat height = rect;
      v57.origin.x = v36;
      v57.size.CGFloat width = v39;
      v57.origin.CGFloat y = v41;
      double v22 = CGRectGetHeight(v57);
      v58.origin.x = v47;
      v58.origin.CGFloat y = v45;
      v58.size.CGFloat width = v43;
      v58.size.CGFloat height = rect1;
      double v19 = v22 - CGRectGetMaxY(v58);
      v59.origin.x = v36;
      v59.size.CGFloat width = v39;
      v59.origin.CGFloat y = v41;
      v59.size.CGFloat height = rect;
      double v23 = CGRectGetWidth(v59);
      v60.origin.x = v47;
      v60.origin.CGFloat y = v45;
      v60.size.CGFloat width = v43;
      v60.size.CGFloat height = rect1;
      double right = v23 - CGRectGetMaxX(v60);
    }
  }
  rect1a = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  v48 = [rect1a topAnchor];
  v46 = [v51 topAnchor];
  __int16 v35 = [v48 constraintEqualToAnchor:v46 constant:top];
  v44 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  v42 = [v44 leftAnchor];
  v40 = [v51 leftAnchor];
  v34 = [v42 constraintEqualToAnchor:v40 constant:MinX];
  v37 = [v51 bottomAnchor];
  v24 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  id v25 = [v24 bottomAnchor];
  unsigned __int8 v26 = [v37 constraintEqualToAnchor:v25 constant:v19];
  v27 = [v51 rightAnchor];
  id v28 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  long long v29 = [v28 rightAnchor];
  long long v30 = [v27 constraintEqualToAnchor:v29 constant:right];
  id v31 = +[MapsEdgeConstraints edgeConstraintsWithTop:v35 leading:v34 bottom:v26 trailing:v30];
  long long v32 = [v31 allConstraints];
  innerLayoutGuideConstraints = self->_innerLayoutGuideConstraints;
  self->_innerLayoutGuideConstraints = v32;

  +[NSLayoutConstraint activateConstraints:self->_innerLayoutGuideConstraints];
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [(ChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(ChromeViewController *)self topContext];
    double v5 = [v4 fullscreenViewController];
  }
  else
  {
    double v5 = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    unint64_t v6 = (unint64_t)[v5 supportedInterfaceOrientations];
  }
  else
  {
    double v7 = [(IOSBasedChromeViewController *)self cardsOverlay];
    objc_super v8 = [v7 currentViewController];

    if (objc_opt_respondsToSelector()) {
      unint64_t v6 = (unint64_t)[v8 supportedInterfaceOrientations];
    }
    else {
      unint64_t v6 = 26;
    }
  }
  return v6;
}

- (void)setAppCoordinator:(id)a3
{
}

- (void)updateThemeViewAndControllers
{
  BOOL v3 = [(IOSBasedChromeViewController *)self view];
  double v4 = [v3 window];
  double v5 = [(IOSBasedChromeViewController *)self theme];
  [v4 _accessibilitySetInterfaceStyleIntent:[v5 interfaceStyleIntent]];

  BOOL v6 = !self->_transitioningFromImagery;
  double v7 = +[MapsLightLevelController sharedController];
  -[IOSBasedChromeViewController updateLightLevelAnimated:lightLevel:](self, "updateLightLevelAnimated:lightLevel:", v6, [v7 currentLightLevel]);

  self->_transitioningFromImagerCGFloat y = 0;
  [(IOSBasedChromeViewController *)self setNeedsUserInterfaceAppearanceUpdate];

  [(IOSBasedChromeViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
}

- (void)updateLightLevelAnimated:(BOOL)a3 lightLevel:(int64_t)a4
{
  LODWORD(v5) = a3;
  if (sub_1000BBB44(self) != 5)
  {
    if (a4) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = 0;
    }
    double v7 = sub_100082DFC();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    objc_super v8 = self;
    if (!v8)
    {
      id v13 = @"<nil>";
      goto LABEL_14;
    }
    double v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      double v11 = [(IOSBasedChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
      double v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_12;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_12:

LABEL_14:
    id v14 = v13;
    if ((unint64_t)a4 >= 3)
    {
      long long v15 = +[NSString stringWithFormat:@"<Unknown: %ld>", a4];
    }
    else
    {
      long long v15 = off_1013199B8[a4];
    }
    *(_DWORD *)buf = 138543618;
    id v31 = v14;
    __int16 v32 = 2112;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] updateLightLevelAnimated with lightLevel: %@", buf, 0x16u);

LABEL_18:
    if (![(IOSBasedChromeViewController *)self _isNavigationMode])
    {
      id v16 = [(IOSBasedChromeViewController *)self viewIfLoaded];
      id v17 = [v16 window];
      v18 = [v17 traitCollection];
      id v19 = [v18 copy];

      a4 = (int64_t)[v19 userInterfaceStyle];
    }
    self->_interfaceStyleForLight = 2 * (a4 == 2);
    v20 = sub_100082DFC();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    v21 = self;
    double v22 = (objc_class *)objc_opt_class();
    double v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      v24 = [(IOSBasedChromeViewController *)v21 performSelector:"accessibilityIdentifier"];
      id v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        unsigned __int8 v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_26;
      }
    }
    unsigned __int8 v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_26:

    *(_DWORD *)buf = 138543618;
    id v31 = v26;
    __int16 v32 = 1024;
    LODWORD(v33) = a4 == 2;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] Updating map view to show night mode: %d", buf, 0x12u);

LABEL_27:
    v27 = +[GroupAnimation animationForAnimatedFlag:v5];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000C6ED4;
    v28[3] = &unk_1012E6300;
    v28[4] = self;
    BOOL v29 = a4 == 2;
    [v27 addAnimations:v28 completion:0];
    [v27 runWithDuration:196608 delay:2.0 options:0.0];
  }
}

- (void)setNeedsUserInterfaceAppearanceUpdate
{
  v6.receiver = self;
  v6.super_class = (Class)IOSBasedChromeViewController;
  [(IOSBasedChromeViewController *)&v6 setNeedsUserInterfaceAppearanceUpdate];
  uint64_t v3 = [(IOSBasedChromeViewController *)self presentedViewController];
  if (v3)
  {
    double v4 = (void *)v3;
    do
    {
      [v4 setNeedsUserInterfaceAppearanceUpdate];
      uint64_t v5 = [v4 presentedViewController];

      double v4 = (void *)v5;
    }
    while (v5);
  }
}

- (void)incrementForToken:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v12 incrementForToken:v4];
  uint64_t v5 = [v4 tokenGroupName];
  unsigned int v6 = [v5 isEqualToString:@"IOSBasedChromeMetros"];

  if (v6)
  {
    double v7 = [v4 userInfo];
    objc_super v8 = [v7 objectForKeyedSubscript:@"reason"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v9 = sub_1000C49B4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Invalid modern map token: %@", buf, 0xCu);
      }
    }
    double v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"ChromeViewControllerDidUpdateShouldUseModernMap" object:self];

    double v11 = [(ChromeViewController *)self mapView];

    if (v11) {
      [(IOSBasedChromeViewController *)self _updateModernMapCartographicConfiguration];
    }
  }
}

- (id)currentTraits
{
  uint64_t v3 = [(ChromeViewController *)self mapView];
  if (v3)
  {
    id v4 = +[MKMapService sharedService];
    uint64_t v5 = [(ChromeViewController *)self mapViewEnteredForegroundDate];
    unsigned int v6 = [(ChromeViewController *)self lastMapViewportChangedDate];
    double v7 = [v4 mapsDefaultTraitsForMapView:v3 mapViewEnteredForegroundDate:v5 mapViewportChangedDate:v6];

    id v8 = [(NSArray *)self->_historicalLocations mutableCopy];
    [v7 setHistoricalLocations:v8];

    double v9 = objc_alloc_init(ClientTypeResolver);
    +[GEOMapServiceTraits addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:v9 toTraits:v7];
    double v10 = +[NSLocale currentLocale];
    double v11 = MKCurrencySymbolForLocale();
    [v7 setCurrentLocaleCurrencySymbol:v11];

    [v7 setWantsRouteCreationTip:1];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)isNightMode
{
  uint64_t v3 = [(ChromeViewController *)self mapView];
  if (v3)
  {
    id v4 = v3;
    [v3 _cartographicConfiguration];

    if ((void)v6 == 1) {
      return 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  return (id)[(IOSBasedChromeViewController *)self preferredUserInterfaceStyle] == (id)2;
}

- (double)statusBarHeight
{
  uint64_t v3 = [(IOSBasedChromeViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  [(StatusBarBackgroundView *)self->_statusBarBackgroundView frame];
  if (v5 <= CGRectGetHeight(v10))
  {
    [(StatusBarBackgroundView *)self->_statusBarBackgroundView frame];
    double Height = CGRectGetHeight(v11);
  }
  else
  {
    long long v6 = [(IOSBasedChromeViewController *)self view];
    [v6 safeAreaInsets];
    double Height = v7;
  }
  return Height;
}

- (int64_t)preferredUserInterfaceStyle
{
  uint64_t v3 = [(IOSBasedChromeViewController *)self viewIfLoaded];
  double v4 = [v3 window];
  double v5 = [v4 traitCollection];
  id v6 = [v5 copy];

  id v7 = [v6 userInterfaceStyle];
  if ([(IOSBasedChromeViewController *)self _isNavigationMode])
  {
    long long v8 = +[MapsLightLevelController sharedController];
    id v9 = [v8 currentLightLevel];

    if (v9 == (id)2) {
      int64_t interfaceStyleForMapType = 2;
    }
    else {
      int64_t interfaceStyleForMapType = 1;
    }
  }
  else
  {
    int64_t interfaceStyleForMapType = self->_interfaceStyleForMapType;
    if (!interfaceStyleForMapType)
    {
      if (self->_interfaceStyleForLight) {
        int64_t interfaceStyleForMapType = self->_interfaceStyleForLight;
      }
      else {
        int64_t interfaceStyleForMapType = (int64_t)v7;
      }
    }
  }

  return interfaceStyleForMapType;
}

- (BOOL)_isNavigationMode
{
  id v2 = [(IOSBasedChromeViewController *)self currentIOSBasedContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (IOSBasedChromeContext)currentIOSBasedContext
{
  if ([(ChromeViewController *)self isSuppressed])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(ChromeViewController *)self topContext];
  }

  return (IOSBasedChromeContext *)v3;
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  long long v8 = (__CFString *)a3;
  id v9 = a5;
  CGRect v10 = v9;
  if (v8 == @"floatingControls")
  {
    [(IOSBasedChromeViewController *)self _updateFloatingControlsForCurrentStateWithAnimation:v9];
  }
  else if (v8 == @"cards")
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100107B78;
    v13[3] = &unk_1012E5D08;
    v13[4] = self;
    [v9 addPreparation:v13];
    [(IOSBasedChromeViewController *)self _updateCardsForCurrentStateWithAnimation:v10];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F6AC;
    v12[3] = &unk_1012E7D28;
    v12[4] = self;
    [v10 addCompletion:v12];
  }
  else if (v8 == @"statusBarStyle")
  {
    [(IOSBasedChromeViewController *)self _updateStatusBarForCurrentStateWithAnimation:v9];
  }
  else if (v8 == @"statusBarSupplementaryView")
  {
    [(IOSBasedChromeViewController *)self _updateStatusBarSupplementaryViewWithAnimation:v9];
  }
  else if (v8 == @"lookAroundButton")
  {
    [(IOSBasedChromeViewController *)self _updateLookAroundButtonWithAnimation:v9];
  }
  else if (v8 == @"redoSearchButton")
  {
    [(IOSBasedChromeViewController *)self _updateRedoSearchButtonWithAnimation:v9];
  }
  else if (v8 == @"weatherOverlay")
  {
    [(IOSBasedChromeViewController *)self _updateWeatherWithAnimation:v9];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IOSBasedChromeViewController;
    [(ChromeViewController *)&v11 updateComponent:v8 forTiming:a4 withAnimation:v9];
  }
}

- (int64_t)_desiredFloatingControlsForCurrentState
{
  uint64_t v3 = [(ChromeViewController *)self nextTopContext];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ChromeViewController *)self topContext];
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector()) {
    id v7 = [v6 desiredFloatingControls];
  }
  else {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (BOOL)_internal_topContextWantsCompassLayoutControl
{
  uint64_t v3 = [(ChromeViewController *)self nextTopContext];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ChromeViewController *)self topContext];
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v7 = [v6 wantsCompassLayoutControl];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)updateComponentsIfNeeded
{
  [(IOSBasedChromeViewController *)self _createOverlaysIfNeeded:1];
  v3.receiver = self;
  v3.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v3 updateComponentsIfNeeded];
}

- (void)_createOverlaysIfNeeded:(BOOL)a3
{
  if (!self->_didAddOverlays && [(IOSBasedChromeViewController *)self _appearState] == 2)
  {
    self->_didAddOverlays = 1;
    id v5 = objc_alloc_init(WeatherOverlay);
    [(IOSBasedChromeViewController *)self setWeatherOverlay:v5];

    id v6 = [(IOSBasedChromeViewController *)self weatherOverlay];
    [v6 setMapViewProvider:self];

    unsigned __int8 v7 = [(ChromeViewController *)self overlayController];
    long long v8 = [(IOSBasedChromeViewController *)self weatherOverlay];
    id v9 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
    [v7 addOverlay:v8 inLayoutGuide:v9];

    if (sub_1000BBB44(self) != 5)
    {
      CGRect v10 = objc_alloc_init(LookAroundChromeOverlay);
      [(IOSBasedChromeViewController *)self setLookAroundOverlay:v10];

      objc_super v11 = [(IOSBasedChromeViewController *)self lookAroundOverlay];
      [v11 setDelegate:self];

      objc_super v12 = [(ChromeViewController *)self overlayController];
      id v13 = [(IOSBasedChromeViewController *)self lookAroundOverlay];
      id v14 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
      [v12 addOverlay:v13 inLayoutGuide:v14];
    }
    long long v15 = objc_alloc_init(_TtC4Maps23RedoSearchChromeOverlay);
    [(IOSBasedChromeViewController *)self setRedoSearchOverlay:v15];

    id v16 = [(IOSBasedChromeViewController *)self redoSearchOverlay];
    [v16 setDelegate:self];

    id v17 = [(ChromeViewController *)self overlayController];
    v18 = [(IOSBasedChromeViewController *)self redoSearchOverlay];
    id v19 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
    [v17 addOverlay:v18 inLayoutGuide:v19];

    if (+[PedestrianARSessionTask isPedestrianARModeSupported]&& !self->_pedestrianARSessionStateManager)
    {
      v20 = [(IOSBasedChromeViewController *)self appCoordinator];
      v21 = [v20 platformController];
      double v22 = [v21 pedestrianARSessionStateManager];
      pedestrianARSessionStateManager = self->_pedestrianARSessionStateManager;
      self->_pedestrianARSessionStateManager = v22;

      [(PedestrianARSessionStateManager *)self->_pedestrianARSessionStateManager addObserver:self];
      if (a3) {
        return;
      }
    }
    else if (a3)
    {
      return;
    }
    [(ChromeViewController *)self setNeedsUpdateComponent:@"weatherOverlay" animated:0];
    [(ChromeViewController *)self setNeedsUpdateComponent:@"lookAroundButton" animated:0];
  }
}

- (WeatherOverlay)weatherOverlay
{
  return self->_weatherOverlay;
}

+ (BOOL)mapInsetsShouldRespectSafeAreaInsetsByDefault
{
  return 0;
}

- (_TtC4Maps23RedoSearchChromeOverlay)redoSearchOverlay
{
  return self->_redoSearchOverlay;
}

- (LookAroundChromeOverlay)lookAroundOverlay
{
  return self->_lookAroundOverlay;
}

- (id)personalizedItemSourcesForCurrentState
{
  v9.receiver = self;
  v9.super_class = (Class)IOSBasedChromeViewController;
  objc_super v3 = [(ChromeViewController *)&v9 personalizedItemSourcesForCurrentState];
  id v4 = [v3 mutableCopy];

  id v5 = [(IOSBasedChromeViewController *)self sharedTripsAnnotationsController];
  id v6 = [v5 itemSource];
  [v4 addObject:v6];

  id v7 = [v4 copy];

  return v7;
}

- (SharedTripsAnnotationsController)sharedTripsAnnotationsController
{
  sharedTripsAnnotationsController = self->_sharedTripsAnnotationsController;
  if (!sharedTripsAnnotationsController)
  {
    id v4 = objc_alloc_init(SharedTripsAnnotationsController);
    id v5 = self->_sharedTripsAnnotationsController;
    self->_sharedTripsAnnotationsController = v4;

    [(SharedTripsAnnotationsController *)self->_sharedTripsAnnotationsController setChromeViewController:self];
    sharedTripsAnnotationsController = self->_sharedTripsAnnotationsController;
  }

  return sharedTripsAnnotationsController;
}

- (id)allComponents
{
  v6.receiver = self;
  v6.super_class = (Class)IOSBasedChromeViewController;
  id v2 = [(ChromeViewController *)&v6 allComponents];
  v7[0] = @"floatingControls";
  v7[1] = @"cards";
  v7[2] = @"lookAroundButton";
  v7[3] = @"statusBarStyle";
  v7[4] = @"statusBarSupplementaryView";
  v7[5] = @"weatherOverlay";
  objc_super v3 = +[NSArray arrayWithObjects:v7 count:6];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (void)_updateWeatherWithAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSBasedChromeViewController *)self weatherOverlay];

  if (v5)
  {
    unsigned __int8 v6 = [v4 isAnimated];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    char v11 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003BDB8;
    v9[3] = &unk_1012E67C0;
    v9[4] = self;
    void v9[5] = v10;
    [v4 addPreparation:v9];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000128DC;
    v7[3] = &unk_1012E6300;
    v7[4] = self;
    unsigned __int8 v8 = v6;
    [v4 addAnimations:v7];
    _Block_object_dispose(v10, 8);
  }
}

- (void)_updateLookAroundButtonWithAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSBasedChromeViewController *)self lookAroundOverlay];

  if (v5)
  {
    unsigned __int8 v6 = [v4 isAnimated];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C6E4C;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    [v4 addPreparation:v9];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C6CF4;
    v7[3] = &unk_1012E6300;
    v7[4] = self;
    unsigned __int8 v8 = v6;
    [v4 addAnimations:v7];
  }
}

- (void)_updateStatusBarForCurrentStateWithAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSBasedChromeViewController *)self _defaultStatusBarBackgroundViewStyle];
  BOOL v6 = [(IOSBasedChromeViewController *)self _defaultPrefersStatusBarHidden];
  int64_t v7 = [(IOSBasedChromeViewController *)self _defaultPreferredStatusBarStyle];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unsigned __int8 v8 = [(ChromeViewController *)self contexts];
  objc_super v9 = [v8 reverseObjectEnumerator];

  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v10) {
    goto LABEL_31;
  }
  id v11 = v10;
  id v29 = v4;
  uint64_t v12 = *(void *)v34;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v34 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 wantsStatusBarControl])
      {
        long long v15 = sub_1000C49B4();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
LABEL_21:

          if (objc_opt_respondsToSelector()) {
            unsigned int v22 = [v14 prefersStatusBarHidden];
          }
          else {
            unsigned int v22 = [(IOSBasedChromeViewController *)self _defaultPrefersStatusBarHidden];
          }
          BOOL v6 = v22;
          id v4 = v29;
          if (objc_opt_respondsToSelector()) {
            id v23 = [v14 preferredStatusBarStyle];
          }
          else {
            id v23 = [(IOSBasedChromeViewController *)self _defaultPreferredStatusBarStyle];
          }
          int64_t v7 = (int64_t)v23;
          if (objc_opt_respondsToSelector()) {
            [v14 statusBarBackgroundViewStyle];
          }
          else {
          uint64_t v24 = [(IOSBasedChromeViewController *)self _defaultStatusBarBackgroundViewStyle];
          }

          id v5 = (void *)v24;
          goto LABEL_31;
        }
        id v16 = v14;
        if (!v16)
        {
          v21 = @"<nil>";
          goto LABEL_20;
        }
        id v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        if (objc_opt_respondsToSelector())
        {
          id v19 = [v16 performSelector:"accessibilityIdentifier"];
          v20 = v19;
          if (v19 && ![v19 isEqualToString:v18])
          {
            v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

            goto LABEL_18;
          }
        }
        v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_18:

LABEL_20:
        *(_DWORD *)buf = 138412290;
        CFStringRef v38 = v21;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[Status Bar] %@ wants status bar control", buf, 0xCu);

        goto LABEL_21;
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  id v4 = v29;
LABEL_31:

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C6CE0;
  v31[3] = &unk_1012E5D58;
  v31[4] = self;
  id v32 = v5;
  id v25 = v5;
  [v4 addAnimations:v31];
  if (self->_statusBarHidden != v6)
  {
    unsigned __int8 v26 = sub_1000C49B4();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v38 = @"YES";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[Status Bar] hidden will change to %@", buf, 0xCu);
    }

    self->_statusBarHidden = v6;
  }
  if (!v6 && v7 != self->_statusBarStyle)
  {
    v27 = sub_1000C49B4();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int64_t statusBarStyle = self->_statusBarStyle;
      *(_DWORD *)buf = 134217984;
      CFStringRef v38 = (const __CFString *)statusBarStyle;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[Status Bar] visible status bar style will change to %ld", buf, 0xCu);
    }

    self->_int64_t statusBarStyle = v7;
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C6CD8;
  v30[3] = &unk_1012E5D08;
  v30[4] = self;
  [v4 addAnimations:v30];
}

- (void)_updateFloatingControlsForCurrentStateWithAnimation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isAnimated];
  BOOL v6 = [(IOSBasedChromeViewController *)self _currentContainerViewController];
  [v6 edgePadding];
  double v8 = v7;
  objc_super v9 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  [v9 setMargin:v8];

  id v10 = [(IOSBasedChromeViewController *)self _currentContainerViewController];
  id v11 = [v10 blurGroupName];
  uint64_t v12 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  [v12 setBlurGroupName:v11];

  int64_t v13 = [(IOSBasedChromeViewController *)self _desiredFloatingControlsForCurrentState];
  id v14 = sub_1000C49B4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = [(ChromeViewController *)self topContext];
    *(_DWORD *)buf = 138412546;
    CFStringRef v21 = @"floatingControls";
    __int16 v22 = 2112;
    id v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Update component: %@ with top context: %@", buf, 0x16u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CE45C;
  v19[3] = &unk_1012E69C0;
  v19[4] = self;
  v19[5] = v13;
  void v16[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C6C78;
  v17[3] = &unk_1012E8FA8;
  v17[4] = self;
  v17[5] = v13;
  unsigned __int8 v18 = v5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E20DC;
  v16[3] = &unk_1012E7D28;
  [v4 addPreparation:v19 animations:v17 completion:v16];
}

- (BOOL)_shouldCollapseLookoaroundPreview
{
  id v2 = [(IOSBasedChromeViewController *)self coordinator];
  objc_super v3 = [v2 containerViewController];

  id v4 = [v3 currentViewController];
  unsigned __int8 v5 = [v4 cardPresentationController];

  unint64_t v6 = (unint64_t)[v5 containerStyle];
  BOOL v7 = (v6 >= 8 || ((0xE3u >> v6) & 1) == 0) && [v5 containeeLayout] == (id)1;

  return v7;
}

- (id)coordinator
{
  id v2 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [v2 actionCoordinator];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (id)_defaultStatusBarBackgroundViewStyle
{
  return +[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:&stru_1012F7D48];
}

- (BOOL)_defaultPrefersStatusBarHidden
{
  objc_super v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1)
  {
    BOOL v4 = 0;
  }
  else
  {
    unsigned __int8 v5 = +[UIDevice currentDevice];
    if ([v5 userInterfaceIdiom] == (id)5)
    {
      BOOL v4 = 0;
    }
    else
    {
      unint64_t v6 = [(IOSBasedChromeViewController *)self viewIfLoaded];
      BOOL v7 = [v6 traitCollection];
      BOOL v4 = [v7 verticalSizeClass] == (id)1;
    }
  }

  return v4;
}

- (int64_t)_defaultPreferredStatusBarStyle
{
  return 0;
}

- (BOOL)_canShowLookAroundButton
{
  objc_super v3 = +[GEOResourceManifestManager modernManager];
  unsigned int v4 = [v3 isMuninEnabled];

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unsigned __int8 v5 = [(ChromeViewController *)self contexts];
    unint64_t v6 = [v5 reverseObjectEnumerator];

    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v15;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0 && ![v12 permitsLookAroundShowing]) {
          break;
        }
        if (objc_opt_respondsToSelector()) {
          v9 |= [v12 wantsLookAroundShowing];
        }
        if (v8 == (id)++v11)
        {
          id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }
    }
    LOBYTE(v9) = 0;
LABEL_16:
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9 & 1;
}

- (void)_updateFloatingControlsDidChangePitching:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];

  if (!v7) {
    return;
  }
  BOOL v45 = v4;
  id v8 = [(ChromeViewController *)self mapView];
  int64_t v9 = [(IOSBasedChromeViewController *)self _desiredFloatingControlsForCurrentState];
  id v10 = [v8 _lookAroundAvailability];
  if (v10 == (id)2) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = v9 & 0xFFFFFFFFFFFFFE7FLL;
  }
  unint64_t v12 = (unint64_t)(v10 != (id)2) << 7;
  +[MapsAnalyticStateProvider updateButtonsInformationLookAround:v10 == (id)2];
  unint64_t v13 = v11 & 0xFFFFFFFFFFFFFEFFLL;
  if (-[PedestrianARSessionStateManager shouldShowPedestrianAR](self->_pedestrianARSessionStateManager, "shouldShowPedestrianAR")|| (+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), long long v14 = objc_claimAutoreleasedReturnValue(), v15 = [v14 BOOLForKey:@"PedestrianARForceShowAffordanceKey"], v14, v15))
  {
    v13 |= v9 & 0x100;
  }
  else
  {
    v12 |= 0x100uLL;
  }
  unint64_t v16 = v13 & 0xFFFFFFFFFFFFFFCFLL;
  long long v17 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v19 = [(ChromeViewController *)self topContext];
    v20 = [v19 actionCoordinator];
  }
  else
  {
    v20 = 0;
  }
  unsigned int v21 = +[SettingsController deviceSupportsGlobe];
  unsigned int v22 = [v8 _isPitched];
  v46 = v20;
  if (v21)
  {
    unsigned __int8 v23 = [v20 isExiting3dMode];
    unsigned int v24 = [v8 _canEnter3DMode];
    unsigned __int8 v25 = [v8 _isShowingCuratedElevatedGround];
    int64_t v26 = [(IOSBasedChromeViewController *)self displayedViewMode];
    GEOConfigGetDouble();
    double v28 = v27;
    [v8 _zoomLevel];
    if (!v22 || (v23 & 1) != 0)
    {
      if (v24 && (v29 >= v28 ? (unsigned __int8 v30 = v25) : (unsigned __int8 v30 = 0), (v30 & 1) != 0 || ((v26 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)) {
        v16 |= v9 & 0x20;
      }
      else {
        v12 |= 0x20uLL;
      }
      BOOL v42 = v45;
      v12 |= 0x10uLL;
      if (!v16) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  id v31 = [v8 _mapLayer];
  unsigned int v32 = [v31 isPitchable];

  unsigned int v33 = [v20 isExiting3dMode];
  int64_t v34 = [(IOSBasedChromeViewController *)self displayedViewMode];
  char v35 = (unint64_t)(v34 - 7) < 0xFFFFFFFFFFFFFFFELL || v5;
  if ((v22 ^ 1 | v33) != 1 || (v35 & 1) == 0)
  {
LABEL_37:
    v16 |= v9 & 0x10;
    v12 |= 0x20uLL;
    goto LABEL_38;
  }
  int64_t v36 = v34;
  unsigned int v37 = [v8 _canEnter3DModeFlyover];
  unsigned int v38 = v37;
  if ((unint64_t)(v36 - 1) < 2)
  {
    if (v37)
    {
      v12 |= 0x10uLL;
      v16 |= v9 & 0x20;
      goto LABEL_38;
    }
    goto LABEL_46;
  }
  if ((unint64_t)(v36 - 5) > 1)
  {
LABEL_46:
    v12 |= 0x30uLL;
    goto LABEL_38;
  }
  unsigned __int8 v39 = [v46 is3dModeSelected];
  if (v5 && (v39 & 1) == 0)
  {
    if (!(v38 | v32)) {
      v12 |= 0x30uLL;
    }
    if (v36 == 5) {
      uint64_t v40 = 1;
    }
    else {
      uint64_t v40 = 2;
    }
    dispatch_time_t v41 = dispatch_time(0, 250000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B705CC;
    block[3] = &unk_1012E69C0;
    void block[4] = self;
    block[5] = v40;
    dispatch_after(v41, (dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_38:
  BOOL v42 = v45;
  if (v16)
  {
LABEL_39:
    CGFloat v43 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    [v43 showControlsIfNeeded:v16 animated:v42];
  }
LABEL_40:
  if (v12)
  {
    v44 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    [v44 hideControlsIfNeeded:v12 animated:v42];
  }
}

- (FloatingControlsOverlay)floatingControlsOverlay
{
  return self->_floatingControlsOverlay;
}

- (id)venuesManagerForFloatingControlsOverlay:(id)a3
{
  objc_super v3 = [(IOSBasedChromeViewController *)self baseModeController];
  BOOL v4 = [v3 actionCoordinator];
  BOOL v5 = [v4 venuesManager];

  return v5;
}

- (id)baseModeController
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ChromeViewController *)self contexts];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (int64_t)displayedViewMode
{
  return self->_displayedViewMode;
}

- (id)_currentContainerViewController
{
  id v3 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
  uint64_t v4 = [(IOSBasedChromeViewController *)self _currentContainerViewControllerWithContext:v3];

  return v4;
}

- (id)_currentContainerViewControllerWithContext:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v4 fullscreenViewController];
  }
  else
  {
    BOOL v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(IOSBasedChromeViewController *)self cardsOverlay];
  }
  id v7 = v6;

  return v7;
}

- (void)viewDidLayoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v50 viewDidLayoutSubviews];
  if (sub_1000BBB44(self) != 5
    && ![(IOSBasedChromeViewController *)self _internal_topContextWantsCompassLayoutControl])
  {
    id v3 = [(ChromeViewController *)self mapView];
    id v4 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
    [v4 layoutFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
    long long v14 = [v13 owningView];
    [v3 convertRect:v14 fromView:v6, v8, v10, v12];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v45 = v21;

    unsigned int v22 = [(ChromeViewController *)self mapView];
    [v22 _edgeInsets];
    double v48 = v24;
    double v49 = v23;

    unsigned __int8 v25 = [(ChromeViewController *)self mapView];
    [v25 bounds];
    CGFloat v43 = v27;
    CGFloat v44 = v26;
    CGFloat v42 = v28;
    CGFloat rect1 = v29;
    CGFloat left = UIEdgeInsetsZero.left;
    double right = UIEdgeInsetsZero.right;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    v51.origin.x = v16;
    v51.origin.CGFloat y = v18;
    v51.size.CGFloat width = v20;
    v51.size.CGFloat height = v45;
    v59.origin.x = CGRectZero.origin.x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    if (CGRectEqualToRect(v51, v59))
    {
      double MinX = left;
    }
    else
    {
      v52.origin.CGFloat y = v43;
      v52.origin.x = v44;
      v52.size.CGFloat width = v42;
      v52.size.CGFloat height = rect1;
      v60.origin.x = CGRectZero.origin.x;
      v60.origin.CGFloat y = y;
      v60.size.CGFloat width = width;
      v60.size.CGFloat height = height;
      double MinX = left;
      if (!CGRectEqualToRect(v52, v60))
      {
        v53.origin.x = v16;
        v53.origin.CGFloat y = v18;
        v53.size.CGFloat width = v20;
        v53.size.CGFloat height = v45;
        CGRectGetMinY(v53);
        v54.origin.x = v16;
        v54.origin.CGFloat y = v18;
        v54.size.CGFloat width = v20;
        v54.size.CGFloat height = v45;
        double MinX = CGRectGetMinX(v54);
        v55.origin.x = v44;
        v55.origin.CGFloat y = v43;
        v55.size.CGFloat width = v42;
        v55.size.CGFloat height = rect1;
        CGRectGetHeight(v55);
        v56.origin.x = v16;
        v56.origin.CGFloat y = v18;
        v56.size.CGFloat width = v20;
        v56.size.CGFloat height = v45;
        CGRectGetMaxY(v56);
        v57.origin.x = v44;
        v57.origin.CGFloat y = v43;
        v57.size.CGFloat width = v42;
        v57.size.CGFloat height = rect1;
        double v35 = CGRectGetWidth(v57);
        v58.origin.x = v16;
        v58.origin.CGFloat y = v18;
        v58.size.CGFloat width = v20;
        v58.size.CGFloat height = v45;
        double right = v35 - CGRectGetMaxX(v58);
      }
    }

    int64_t v36 = [(ChromeViewController *)self mapView];
    [v36 _compassInsets];
    double v38 = v37;
    double v40 = v39;

    dispatch_time_t v41 = [(ChromeViewController *)self mapView];
    [v41 _setCompassInsets:v38 MinX:v49, v40, right:v48];
  }
}

- (UILayoutGuide)innerLayoutGuide
{
  return self->_innerLayoutGuide;
}

- (MapsUserLocationView)userLocationView
{
  v4.receiver = self;
  v4.super_class = (Class)IOSBasedChromeViewController;
  id v2 = [(ChromeViewController *)&v4 userLocationView];

  return (MapsUserLocationView *)v2;
}

- (void)overlayControllerDidUpdateMapInsets:(id)a3 fromOverlay:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)IOSBasedChromeViewController;
  id v6 = a4;
  [(ChromeViewController *)&v8 overlayControllerDidUpdateMapInsets:a3 fromOverlay:v6];
  id v7 = [(IOSBasedChromeViewController *)self cardsOverlay];

  if (v7 == v6) {
    [(IOSBasedChromeViewController *)self updateComponentsIfNeeded];
  }
}

- (IOSCardsOverlay)cardsOverlay
{
  return self->_cardsOverlay;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  +[MapsAnalyticStateProvider updateMapViewInformation:v6];
  id v7 = [(IOSBasedChromeViewController *)self weatherOverlay];
  [v7 mapView:v6 regionDidChangeAnimated:v4];

  [(IOSBasedChromeViewController *)self _updateFloatingControlsDidChangePitching:0 animated:v4];
  v8.receiver = self;
  v8.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v8 mapView:v6 regionDidChangeAnimated:v4];
}

- (BOOL)_internal_isChromeDisabled
{
  id v2 = +[MKSystemController sharedInstance];
  if ([v2 isInternalInstall])
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"__internal__DisableChrome"];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)viewDidLoad
{
  v83.receiver = self;
  v83.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v83 viewDidLoad];
  id v3 = objc_alloc_init((Class)UILayoutGuide);
  [(IOSBasedChromeViewController *)self setInnerLayoutGuide:v3];

  unsigned __int8 v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = +[NSString stringWithFormat:@"%@.innerLayoutGuide", v5];
  id v7 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  [v7 setIdentifier:v6];

  objc_super v8 = [(IOSBasedChromeViewController *)self view];
  double v9 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  [v8 addLayoutGuide:v9];

  id v10 = objc_alloc_init((Class)UILayoutGuide);
  [(IOSBasedChromeViewController *)self setWeatherLayoutGuide:v10];

  double v11 = (objc_class *)objc_opt_class();
  double v12 = NSStringFromClass(v11);
  unint64_t v13 = +[NSString stringWithFormat:@"%@.weatherLayoutGuide", v12];
  long long v14 = [(IOSBasedChromeViewController *)self weatherLayoutGuide];
  [v14 setIdentifier:v13];

  double v15 = [(IOSBasedChromeViewController *)self view];
  CGFloat v16 = [(IOSBasedChromeViewController *)self weatherLayoutGuide];
  [v15 addLayoutGuide:v16];

  double v17 = objc_alloc_init(IOSCardsOverlay);
  cardsOverlaCGFloat y = self->_cardsOverlay;
  self->_cardsOverlaCGFloat y = v17;

  [(ContainerViewController *)self->_cardsOverlay setAllowOnlyStandardStyle:0];
  [(ContainerViewController *)self->_cardsOverlay setChromeViewController:self];
  double v19 = [(ChromeViewController *)self overlayController];
  [v19 addOverlay:self->_cardsOverlay];

  CGFloat v20 = objc_alloc_init(FloatingControlsOverlay);
  [(IOSBasedChromeViewController *)self setFloatingControlsOverlay:v20];

  double v21 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  [v21 setMapViewProvider:self];

  unsigned int v22 = [[FloatingControlsOverlayDelegateProxy alloc] initWithChromeViewController:self];
  floatingControlsOverlayDelegateProxCGFloat y = self->_floatingControlsOverlayDelegateProxy;
  self->_floatingControlsOverlayDelegateProxCGFloat y = v22;

  double v24 = self->_floatingControlsOverlayDelegateProxy;
  unsigned __int8 v25 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  [v25 setDelegate:v24];

  double v26 = [(ChromeViewController *)self overlayController];
  double v27 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  double v28 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  [v26 addOverlay:v27 inLayoutGuide:v28];

  self->_statusBarHidden = [(IOSBasedChromeViewController *)self _defaultPrefersStatusBarHidden];
  self->_int64_t statusBarStyle = [(IOSBasedChromeViewController *)self _defaultPreferredStatusBarStyle];
  double v29 = [StatusBarBackgroundView alloc];
  unsigned __int8 v30 = [(IOSBasedChromeViewController *)self view];
  id v31 = [v30 safeAreaLayoutGuide];
  unsigned int v32 = [v31 topAnchor];
  unsigned int v33 = [(StatusBarBackgroundView *)v29 initWithSafeAreaTopLayoutAnchor:v32];
  statusBarBackgroundView = self->_statusBarBackgroundView;
  self->_statusBarBackgroundView = v33;

  [(StatusBarBackgroundView *)self->_statusBarBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v35 = [(IOSBasedChromeViewController *)self _defaultStatusBarBackgroundViewStyle];
  [(StatusBarBackgroundView *)self->_statusBarBackgroundView setStyle:v35];

  int64_t v36 = [(IOSBasedChromeViewController *)self view];
  [v36 addSubview:self->_statusBarBackgroundView];

  double v37 = [(ChromeViewController *)self viewportLayoutGuide];
  double v38 = [v37 topAnchor];
  double v39 = [(StatusBarBackgroundView *)self->_statusBarBackgroundView bottomAnchor];
  LODWORD(v40) = 1148829696;
  dispatch_time_t v41 = [v38 constraintEqualToAnchor:v39 constant:0.0 priority:v40];
  viewportTopEqualToStatusBarBottomConstraint = self->_viewportTopEqualToStatusBarBottomConstraint;
  self->_viewportTopEqualToStatusBarBottomConstraint = v41;

  CGFloat v43 = [(ChromeViewController *)self viewportLayoutGuide];
  CGFloat v44 = [v43 topAnchor];
  CGFloat v45 = [(IOSBasedChromeViewController *)self view];
  v46 = [v45 safeAreaLayoutGuide];
  CGFloat v47 = [v46 topAnchor];
  double v48 = [v44 constraintEqualToAnchor:v47];
  viewportTopEqualToSafeAreaBottomConstraint = self->_viewportTopEqualToSafeAreaBottomConstraint;
  self->_viewportTopEqualToSafeAreaBottomConstraint = v48;

  v81 = [(StatusBarBackgroundView *)self->_statusBarBackgroundView leadingAnchor];
  v82 = [(IOSBasedChromeViewController *)self view];
  v80 = [v82 leadingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v84[0] = v79;
  __int16 v77 = [(StatusBarBackgroundView *)self->_statusBarBackgroundView trailingAnchor];
  id v78 = [(IOSBasedChromeViewController *)self view];
  v76 = [v78 trailingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v84[1] = v75;
  id v73 = [(StatusBarBackgroundView *)self->_statusBarBackgroundView topAnchor];
  unsigned __int8 v74 = [(IOSBasedChromeViewController *)self view];
  id v72 = [v74 topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v84[2] = v71;
  v69 = [(StatusBarBackgroundView *)self->_statusBarBackgroundView bottomAnchor];
  id v70 = [(IOSBasedChromeViewController *)self view];
  v68 = [v70 safeAreaLayoutGuide];
  id v67 = [v68 topAnchor];
  unsigned __int8 v66 = [v69 constraintGreaterThanOrEqualToAnchor:v67];
  v84[3] = v66;
  id v65 = [(StatusBarBackgroundView *)self->_statusBarBackgroundView bottomAnchor];
  objc_super v50 = [(IOSBasedChromeViewController *)self view];
  CGRect v51 = [v50 safeAreaLayoutGuide];
  CGRect v52 = [v51 topAnchor];
  LODWORD(v53) = 1132068864;
  CGRect v54 = [v65 constraintEqualToAnchor:v52 constant:0.0 priority:v53];
  v84[4] = v54;
  CGRect v55 = [(ChromeViewController *)self viewportLayoutGuide];
  CGRect v56 = [v55 topAnchor];
  CGRect v57 = [(StatusBarBackgroundView *)self->_statusBarBackgroundView bottomAnchor];
  CGRect v58 = [v56 constraintGreaterThanOrEqualToAnchor:v57];
  CGRect v59 = self->_viewportTopEqualToSafeAreaBottomConstraint;
  v84[5] = v58;
  v84[6] = v59;
  CGRect v60 = +[NSArray arrayWithObjects:v84 count:7];
  +[NSLayoutConstraint activateConstraints:v60];

  CGRect v61 = [(IOSBasedChromeViewController *)self theme];
  [v61 applyAppearance];

  [(ChromeViewController *)self loadMapViewIfNeeded];
  CGRect v62 = [(ChromeViewController *)self mapView];
  [v62 setCompassEnabled:0];

  [(EnvironmentObserver *)self->_environmentObserver updateCurrentEnvironmentName];
  [(IOSBasedChromeViewController *)self _loadInternalDebugSetting];
  id v63 = +[NSNotificationCenter defaultCenter];
  [v63 addObserver:self selector:"_windowUserInterfaceStyleDidChange" name:@"MapsWindowUserInterfaceStyleDidChangeNotification" object:0];

  v64 = +[VGVirtualGarageService sharedService];
  [v64 registerObserver:self];

  [(IOSBasedChromeViewController *)self _updateMapViewWithEVChargingConfig];
}

- (UILayoutGuide)weatherLayoutGuide
{
  return self->_weatherLayoutGuide;
}

- (BOOL)prefersStatusBarHidden
{
  return self->_statusBarHidden;
}

- (int64_t)preferredStatusBarStyle
{
  return self->_statusBarStyle;
}

- (void)virtualGarageDidUpdate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108584;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey
{
  uint64_t v2 = MapsConfig_ThermalPressureiOSNavigationRateLimits;
  id v3 = off_1015F0618;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)setWeatherOverlay:(id)a3
{
}

- (void)setWeatherLayoutGuide:(id)a3
{
}

- (void)setViewModeDelegate:(id)a3
{
}

- (void)setRedoSearchOverlay:(id)a3
{
}

- (void)setMapsActionController:(id)a3
{
}

- (void)setLookAroundOverlay:(id)a3
{
}

- (void)setInnerLayoutGuide:(id)a3
{
}

- (void)setFloatingControlsOverlay:(id)a3
{
}

- (void)setConnectedToCarPlay:(BOOL)a3
{
  if (self->_connectedToCarPlay != a3)
  {
    self->_connectedToCarPlaCGFloat y = a3;
    id carPlayModernMapToken = self->_carPlayModernMapToken;
    if (!a3)
    {
      if (!carPlayModernMapToken) {
        return;
      }
      id v7 = sub_1000C49B4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Releasing CarPlay modern map token", v9, 2u);
      }

      id v6 = 0;
      goto LABEL_12;
    }
    if (!carPlayModernMapToken && (GEOConfigGetBOOL() & 1) == 0)
    {
      double v5 = sub_1000C49B4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Acquiring CarPlay modern map token", buf, 2u);
      }

      id v6 = [(IOSBasedChromeViewController *)self acquireModernMapTokenForReason:2];
LABEL_12:
      id v8 = self->_carPlayModernMapToken;
      self->_id carPlayModernMapToken = v6;
    }
  }
}

- (id)mapViewResponder
{
  mapViewResponder = self->_mapViewResponder;
  if (!mapViewResponder)
  {
    unsigned __int8 v4 = [MapViewResponder alloc];
    double v5 = [(ChromeViewController *)self mapView];
    id v6 = [(MapViewResponder *)v4 initWithMapView:v5];
    id v7 = self->_mapViewResponder;
    self->_mapViewResponder = v6;

    mapViewResponder = self->_mapViewResponder;
  }

  return mapViewResponder;
}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
}

- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey
{
  uint64_t v2 = MapsConfig_LowPowerNavigationRateLimitEnablediOS;
  id v3 = off_1015F0738;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey
{
  uint64_t v2 = MapsConfig_BatteryLevelNavigationRateLimitEnablediOS;
  id v3 = off_1015F06F8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)userLocationViewClass
{
  return (Class)objc_opt_class();
}

- (InterruptionManager)interruptionManager
{
  interruptionManager = self->_interruptionManager;
  if (!interruptionManager)
  {
    unsigned __int8 v4 = objc_alloc_init(InterruptionManager);
    double v5 = self->_interruptionManager;
    self->_interruptionManager = v4;

    [(InterruptionManager *)self->_interruptionManager setChromeViewController:self];
    interruptionManager = self->_interruptionManager;
  }

  return interruptionManager;
}

- (void)dealloc
{
  id v3 = sub_1000C49B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v4 = self;
    if (!v4)
    {
      double v9 = @"<nil>";
      goto LABEL_10;
    }
    double v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(IOSBasedChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        double v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    double v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    unint64_t v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Deallocating", buf, 0xCu);
  }
  id v10 = +[VGVirtualGarageService sharedService];
  [v10 unregisterObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v11 dealloc];
}

- (id)currentCollectionShareItemSource
{
  uint64_t v2 = [(IOSBasedChromeViewController *)self appCoordinator];
  id v3 = [v2 baseActionCoordinator];
  unsigned __int8 v4 = [v3 currentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 collection];
    id v6 = [[PersonalCollectionShareItemSource alloc] initWithCollectionHandlerInfo:v5];
LABEL_7:
    id v10 = (CuratedCollectionShareItemSource *)v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    id v8 = [CuratedCollectionShareItemSource alloc];
    double v5 = [v7 curatedCollection];
    double v9 = [v7 mapItems];

    id v10 = [(CuratedCollectionShareItemSource *)v8 initWithPlaceCollection:v5 refinedMapItems:v9];
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v4;
    double v12 = [CuratedCollectionShareItemSource alloc];
    double v5 = [v11 publisher];

    id v6 = [(CuratedCollectionShareItemSource *)v12 initWithPublisher:v5];
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (id)currentShareItemSource
{
  id v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v4 = [v3 currentShareItemSource];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v3 quickActionMenuPresenter];
    id v6 = [v5 resolvedMapItem];

    if (v6)
    {
      id v7 = [[SearchResult alloc] initWithMapItem:v6];
      id v8 = [(SearchResult *)v7 unknownContact];
      unsigned __int8 v4 = +[ShareItem shareItemWithSearchResult:v7 contact:v8 includePrintActivity:1];
LABEL_19:

      goto LABEL_20;
    }
  }
  double v9 = [(IOSBasedChromeViewController *)self currentCollectionShareItemSource];
  id v6 = v9;
  if (!v9)
  {
    id v10 = [(IOSBasedChromeViewController *)self appCoordinator];
    id v11 = [v10 baseActionCoordinator];
    id v7 = [v11 currentPlaceCardItem];

    double v12 = [(SearchResult *)v7 searchResult];

    if (v12)
    {
      unint64_t v13 = [SearchResult alloc];
      long long v14 = [(SearchResult *)v7 searchResult];
      double v15 = [(SearchResult *)v13 initWithSearchResult:v14];
    }
    else
    {
      CGFloat v16 = [(SearchResult *)v7 mapItem];

      if (!v16) {
        goto LABEL_14;
      }
      double v17 = [SearchResult alloc];
      long long v14 = [(SearchResult *)v7 mapItem];
      double v15 = [(SearchResult *)v17 initWithMapItem:v14];
    }
    id v8 = v15;

    if (v8)
    {
      CGFloat v18 = [v8 unknownContact];
      unsigned __int8 v4 = +[ShareItem shareItemWithSearchResult:v8 contact:v18 includePrintActivity:1];
LABEL_18:

      goto LABEL_19;
    }
LABEL_14:
    double v19 = [(IOSBasedChromeViewController *)self _maps_platformController];
    id v8 = [v19 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v18 = [v8 currentRouteCollection];
      CGFloat v20 = [v18 currentRoute];
      unsigned __int8 v4 = +[ShareItem shareItemWithRoute:v20 includeRoutingApps:0];
    }
    else
    {
      unsigned __int8 v25 = [MapRegionShareItemSource alloc];
      CGFloat v18 = [(ChromeViewController *)self mapView];
      CGFloat v20 = [(IOSBasedChromeViewController *)self view];
      double v21 = [v20 window];
      unsigned int v22 = [v21 windowScene];
      double v23 = [v22 title];
      unsigned __int8 v4 = [(MapRegionShareItemSource *)v25 initWithMapView:v18 title:v23];
    }
    goto LABEL_18;
  }
  unsigned __int8 v4 = v9;
LABEL_20:

LABEL_21:

  return v4;
}

- (OverlayManager)overlayManager
{
  overlayManager = self->_overlayManager;
  if (!overlayManager)
  {
    unsigned __int8 v4 = objc_alloc_init(OverlayManager);
    double v5 = self->_overlayManager;
    self->_overlayManager = v4;

    id v6 = [(ChromeViewController *)self mapView];
    [(OverlayManager *)self->_overlayManager setMapView:v6];

    overlayManager = self->_overlayManager;
  }

  return overlayManager;
}

- (RidesharingAnnotationsManager)ridesharingAnnotationsManager
{
  ridesharingAnnotationsManager = self->_ridesharingAnnotationsManager;
  if (!ridesharingAnnotationsManager)
  {
    unsigned __int8 v4 = [RidesharingAnnotationsManager alloc];
    double v5 = [(ChromeViewController *)self mapView];
    id v6 = [(RidesharingAnnotationsManager *)v4 initWithMapView:v5];
    id v7 = self->_ridesharingAnnotationsManager;
    self->_ridesharingAnnotationsManager = v6;

    [(RidesharingAnnotationsManager *)self->_ridesharingAnnotationsManager setChromeViewController:self];
    ridesharingAnnotationsManager = self->_ridesharingAnnotationsManager;
  }

  return ridesharingAnnotationsManager;
}

- (void)setStatusBarAdditionalColor:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarAdditionalColor, a3);
  id v5 = a3;
  [(StatusBarBackgroundView *)self->_statusBarBackgroundView setAdditionalColor:v5];
}

- (void)registerFramesInDebugFramesView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IOSBasedChromeViewController;
  id v3 = a3;
  [(ChromeViewController *)&v5 registerFramesInDebugFramesView:v3];
  unsigned __int8 v4 = +[UIColor systemPinkColor];
  [v3 registerName:@"inner layout guide" color:v4 weight:15 edges:1.0];
}

- (void)updateFramesInDebugFramesView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOSBasedChromeViewController;
  id v4 = a3;
  [(ChromeViewController *)&v6 updateFramesInDebugFramesView:v4];
  objc_super v5 = [(IOSBasedChromeViewController *)self innerLayoutGuide];
  [v4 setLayoutGuide:v5 forName:@"inner layout guide"];
}

- (void)_updateRedoSearchButtonWithAnimation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(IOSBasedChromeViewController *)self redoSearchOverlay];

  if (v5)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    unsigned __int8 v12 = 0;
    unsigned __int8 v12 = [v4 isAnimated];
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B6F3F4;
    v8[3] = &unk_1012E6708;
    objc_copyWeak(&v9, &location);
    [v4 addPreparation:v8];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B6F488;
    v6[3] = &unk_1012F84F8;
    objc_copyWeak(&v7, &location);
    v6[4] = v11;
    [v4 addAnimations:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    _Block_object_dispose(v11, 8);
  }
}

- (void)_handleLogTileState:(id)a3
{
  if ([a3 state] == (id)3)
  {
    id v10 = 0;
    id v11 = 0;
    unsigned __int8 v4 = +[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:&v11 debugTreeURLs:0 mapsActivityDataPath:0 error:&v10];
    objc_super v5 = v10;
    id v6 = v11;
    id v7 = v6;
    if (v4)
    {
      id v8 = [v6 path];
      NSLog(@"Logged tile state to %@", v8);
      id v9 = +[NSString stringWithFormat:@"Logged tile state to %@", v8];
      [(IOSBasedChromeViewController *)self _maps_presentSimpleAlertWithTitle:@"State Snapshot" message:v9 dismissalActionTitle:@"OK"];
    }
    else
    {
      id v8 = [v5 localizedDescription];
      [(IOSBasedChromeViewController *)self _maps_presentSimpleAlertWithTitle:@"State Snapshot Creation Failed" message:v8 dismissalActionTitle:@"OK"];
    }
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IOSBasedChromeViewController *)self overlayManager];
  id v9 = [v8 mapView:v6 rendererForOverlay:v7];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = +[SearchResultsDebugOverlay rendererWithPolygon:v7];
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)IOSBasedChromeViewController;
      id v10 = [(ChromeViewController *)&v13 mapView:v6 rendererForOverlay:v7];
    }
  }
  id v11 = v10;

  return v11;
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IOSBasedChromeViewController *)self overlayManager];
  [v8 setSelectedLabelMarker:0];

  v9.receiver = self;
  v9.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v9 mapView:v7 didDeselectLabelMarker:v6];
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IOSBasedChromeViewController *)self overlayManager];
  [v8 setSelectedLabelMarker:v6];

  v9.receiver = self;
  v9.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v9 mapView:v7 didSelectLabelMarker:v6];
}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  id v5 = a3;
  id v6 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
  id v7 = v6;
  if (v6)
  {
    unsigned __int8 v8 = [v6 mapViewShouldHandleTapToDeselect:v5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IOSBasedChromeViewController;
    unsigned __int8 v8 = [(ChromeViewController *)&v11 mapViewShouldHandleTapToDeselect:v5];
  }
  BOOL v9 = v8;

  return v9;
}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForLabelMarker:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
  [v9 mapView:v8 calloutPrimaryActionTriggeredForLabelMarker:v7];
}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
  [v9 mapView:v8 calloutPrimaryActionTriggeredForAnnotationView:v7];
}

- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
  [v12 mapView:v11 didChangeFocusedVenue:v10 focusedBuilding:v9];
}

- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5
{
  uint64_t v5 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
  [v11 mapView:v10 didChangeDisplayedFloorOrdinal:v5 forVenue:v9];
}

- (void)mapView:(id)a3 didFailToLocateUserWithError:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IOSBasedChromeViewController;
  id v7 = a3;
  [(IOSBasedChromeViewController *)&v15 mapView:v7 didFailToLocateUserWithError:v6];
  unsigned __int8 v8 = [v7 hasUserLocation];

  if ((v8 & 1) == 0)
  {
    id v9 = [(IOSBasedChromeViewController *)self _maps_platformController];
    id v10 = [v9 currentSession];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    objc_super v13 = [v6 domain];
    if (([v13 isEqualToString:MKLocationErrorDomain] & 1) != 0
      || (objc_msgSend(v6, "_mapkit_isCLDenied") & 1) != 0
      || v12 && ([v12 isWaitingForAccurateLocationUpdate] & 1) != 0)
    {
    }
    else
    {
      BOOL explicitlyRequestedUserLocation = self->_explicitlyRequestedUserLocation;

      if (explicitlyRequestedUserLocation) {
        [(IOSBasedChromeViewController *)self reportCurrentLocationFailure];
      }
    }
    -[IOSBasedChromeViewController _resetTracking:](self, "_resetTracking:", ^ 1);
  }
  self->_BOOL explicitlyRequestedUserLocation = 0;
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  BOOL v6 = a6;
  v11.receiver = self;
  v11.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController mapView:didChangeUserTrackingMode:animated:fromTrackingButton:](&v11, "mapView:didChangeUserTrackingMode:animated:fromTrackingButton:", a3, a4, a5);
  if ((unint64_t)(a4 - 1) <= 1 && v6) {
    self->_BOOL explicitlyRequestedUserLocation = 1;
  }
  if ((unint64_t)a4 >= 3) {
    uint64_t v9 = 17064;
  }
  else {
    uint64_t v9 = (a4 + 17064);
  }
  +[GEOAPPortal captureUserAction:v9 target:0 value:0];
  id v10 = +[UIApplication sharedMapsDelegate];
  [v10 setTrackingMode:a4 monitorBatteryState:1];
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  unsigned __int8 v8 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  uint64_t v9 = [v8 mapViewDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    objc_super v11 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    id v12 = [v11 mapViewDelegate];
    [v12 mapView:v13 willStartRespondingToGesture:a4 animated:v5];
  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IOSBasedChromeViewController;
  [(IOSBasedChromeViewController *)&v33 mapView:v14 didStopRespondingToGesture:a4 zoomDirection:a5 zoomGestureType:a6 didDecelerate:v9 tiltDirection:a8];
  objc_super v15 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
  CGFloat v16 = [v15 mapViewDelegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    CGFloat v18 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    double v19 = [v18 mapViewDelegate];
    [v19 mapView:v14 didStopRespondingToGesture:a4 zoomDirection:a5 zoomGestureType:a6 didDecelerate:v9 tiltDirection:a8];
  }
  CGFloat v20 = +[MKSystemController sharedInstance];
  unsigned int v21 = [v20 shouldCaptureMapViewGestureAnalytics];

  if ((unint64_t)a4 <= 3 && v21)
  {
    uint64_t v22 = 1001;
    switch(a4)
    {
      case 0:
        goto LABEL_16;
      case 1:
        if (a5 == 1)
        {
          uint64_t v22 = 1043;
          switch(a6)
          {
            case 0:
            case 3:
              goto LABEL_28;
            case 2:
              uint64_t v22 = 1045;
              goto LABEL_16;
            case 4:
              uint64_t v22 = 1047;
              goto LABEL_16;
            case 5:
              uint64_t v22 = 1049;
              goto LABEL_16;
            case 6:
            case 7:
              uint64_t v22 = 1002;
              goto LABEL_16;
            default:
              goto LABEL_16;
          }
        }
        else
        {
          uint64_t v22 = 1044;
          switch(a6)
          {
            case 0:
            case 2:
              goto LABEL_28;
            case 3:
              uint64_t v22 = 1046;
              goto LABEL_16;
            case 4:
              uint64_t v22 = 1048;
              goto LABEL_16;
            case 5:
              uint64_t v22 = 1050;
              goto LABEL_16;
            case 6:
            case 7:
              uint64_t v22 = 1003;
              goto LABEL_16;
            default:
              goto LABEL_16;
          }
        }
        break;
      case 2:
        uint64_t v22 = 1004;
        goto LABEL_16;
      case 3:
        if (a8 == 2)
        {
          uint64_t v22 = 1041;
        }
        else
        {
          if (a8 != 1) {
            break;
          }
          uint64_t v22 = 1042;
        }
LABEL_16:
        uint64_t v23 = [(IOSBasedChromeViewController *)self currentMapViewTargetForAnalytics];
        double v24 = +[MKMapService sharedService];
        unsigned __int8 v25 = [v14 mapRegion];
        [v14 _zoomLevel];
        double v27 = v26;
        id v28 = [v14 mapType];
        uint64_t v29 = 1;
        switch((unint64_t)v28)
        {
          case 0uLL:
            break;
          case 1uLL:
          case 3uLL:
            uint64_t v29 = 2;
            break;
          case 2uLL:
          case 4uLL:
            uint64_t v29 = 3;
            break;
          default:
            if (v28 == (id)104) {
              unsigned int v30 = 4;
            }
            else {
              unsigned int v30 = 0;
            }
            if (v28 == (id)102) {
              uint64_t v29 = 1;
            }
            else {
              uint64_t v29 = v30;
            }
            break;
        }
        [v24 captureUserAction:v22 onTarget:v23 eventValue:0 mapRegion:v25 zoomLevel:v29 mapType:v27];

        if ((v23 - 502) <= 4 && ((1 << (v23 + 10)) & 0x13) != 0)
        {
          id v31 = objc_alloc_init(SearchSessionAnalytics);
          [(SearchSessionAnalytics *)v31 setTarget:v23];
          [(SearchSessionAnalytics *)v31 setAction:v22];
          unsigned int v32 = +[SearchSessionAnalyticsAggregator sharedAggregator];
          [v32 collectSearchSessionAnalytics:v31];
        }
        break;
      default:
        break;
    }
  }
LABEL_28:
}

- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4
{
  loadingMapNetworkActivitCGFloat y = self->_loadingMapNetworkActivity;
  self->_loadingMapNetworkActivitCGFloat y = 0;
  id v7 = a4;
  id v8 = a3;

  v9.receiver = self;
  v9.super_class = (Class)IOSBasedChromeViewController;
  [(IOSBasedChromeViewController *)&v9 mapViewDidFailLoadingMap:v8 withError:v7];
}

- (void)_resetTracking:(BOOL)a3
{
  id v3 = [(ChromeViewController *)self mapView];
  [v3 setUserTrackingMode:0];
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v7 = a3;
  id v8 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
  [v8 mapView:v7 didUpdateYaw:a4];
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
}

- (id)viewsToRenderMapsScreenshotService:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ChromeViewController *)self topContext];
  unsigned int v6 = sub_1000BBF90((uint64_t)v5, (Protocol *)&OBJC_PROTOCOL___MapsScreenshotServiceDelegate);

  if (v6)
  {
    id v7 = [(ChromeViewController *)self topContext];
    uint64_t v8 = [v7 viewsToRenderMapsScreenshotService:v4];
  }
  else
  {
    id v7 = [(ChromeViewController *)self mapView];
    objc_super v11 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  objc_super v9 = (void *)v8;

  return v9;
}

- (void)floatingControlsOverlayDidTapOpenSettings:(id)a3
{
  id v4 = objc_alloc_init(SettingsViewController);
  [(ChromeViewController *)self mapView];
  objc_super v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100B70824;
  id v14 = &unk_1012E5D58;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  CGFloat v16 = self;
  id v5 = v15;
  [(SettingsViewController *)v4 setDismissSettingsViewControllerHandler:&v11];
  unsigned int v6 = [(IOSBasedChromeViewController *)self settingsController];
  [(SettingsViewController *)v4 setSettingsController:v6];

  [(SettingsViewController *)v4 setModalPresentationStyle:4];
  id v7 = [(IOSBasedChromeViewController *)self cardsOverlay];
  [(SettingsViewController *)v4 setTransitioningDelegate:v7];

  uint64_t v8 = [(ChromeViewController *)self mapView];
  [v8 setCompassEnabled:0];

  [(IOSBasedChromeViewController *)self _maps_topMostPresentViewController:v4 animated:1 completion:0];
  objc_super v9 = [(IOSBasedChromeViewController *)self cardsOverlay];
  [v9 setUseBackdropFullScreen:1];

  char v10 = +[MKMapService sharedService];
  [v10 captureUserAction:5001 onTarget:[self currentMapViewTargetForAnalytics] eventValue:0];
}

- (void)floatingControlsOverlayDidTapCloseSettingsTip:(id)a3
{
  id v4 = [(IOSBasedChromeViewController *)self settingsController];
  id v3 = [v4 settingsTipController];
  [v3 settingsTipClosed];
}

- (void)floatingControlsOverlay:(id)a3 didTapEnterPedestrianARFromButton:(id)a4
{
  id v5 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
    [v7 enterPedestrianAR];
  }
}

- (void)floatingControlsOverlayDidTapEnter3DMode:(id)a3
{
  id v11 = a3;
  id v4 = [(ChromeViewController *)self mapView];
  unsigned int v5 = [v4 _isPitched];

  if (v5)
  {
    [(IOSBasedChromeViewController *)self floatingControlsOverlayDidTapExit3DMode:v11];
    goto LABEL_10;
  }
  char v6 = +[MKMapService sharedService];
  [v6 captureUserAction:5009 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  if (!+[SettingsController deviceSupportsGlobe])
  {
    int64_t v7 = [(IOSBasedChromeViewController *)self displayedViewMode];
    if (v7 == 1)
    {
      uint64_t v8 = 5;
      goto LABEL_8;
    }
    if (v7 == 2)
    {
      uint64_t v8 = 6;
LABEL_8:
      objc_super v9 = [(IOSBasedChromeViewController *)self settingsController];
      [v9 setMapViewMode:v8 animated:0];
    }
  }
  char v10 = [(ChromeViewController *)self mapView];
  [v10 _enter3DMode];

LABEL_10:
}

- (void)floatingControlsOverlayDidTapExit3DMode:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:5010 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  unsigned int v5 = [(ChromeViewController *)self mapView];
  [v5 _exit3DMode];

  if (+[SettingsController deviceSupportsGlobe]) {
    return;
  }
  char v6 = [(IOSBasedChromeViewController *)self settingsController];
  unsigned int v7 = [v6 in3DMode];

  int64_t v8 = [(IOSBasedChromeViewController *)self displayedViewMode];
  if (v8 == 5 && !v7)
  {
    uint64_t v9 = 1;
LABEL_11:
    id v11 = [(IOSBasedChromeViewController *)self settingsController];
    [v11 setMapViewMode:v9 animated:0];

    return;
  }
  if (v8 == 6) {
    char v10 = v7;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) == 0)
  {
    uint64_t v9 = 2;
    goto LABEL_11;
  }
}

- (void)floatingControlsOverlayDidTapRefreshCurrentSearch:(id)a3
{
  id v4 = [(IOSBasedChromeViewController *)self baseModeController];
  id v3 = [v4 actionCoordinator];
  [v3 refreshCurrentSearch];
}

- (void)floatingControlsOverlayDidTapTTRButton:(id)a3
{
  id v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = self;
    if (!v5)
    {
      char v10 = @"<nil>";
      goto LABEL_10;
    }
    char v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      int64_t v8 = [(IOSBasedChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      uint64_t v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        char v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    char v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from floating control", buf, 0xCu);
  }
  id v11 = +[MapsRadarController sharedInstance];
  [v11 launchTTR];
}

- (BOOL)_shouldShowSearchFloatingControl
{
  id v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(IOSBasedChromeViewController *)self baseModeController];
    unsigned int v5 = [v4 actionCoordinator];
    unsigned __int8 v6 = [v5 shouldShowSearchOverlay];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)showRedoSearchOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  [(ChromeViewController *)self setNeedsUpdateComponent:@"redoSearchButton" animated:1];
  unsigned int v5 = [(IOSBasedChromeViewController *)self redoSearchOverlay];
  id v8 = v5;
  if (v3)
  {
    [v5 updateSearchOverlayWithState:0];

    unsigned __int8 v6 = [(IOSBasedChromeViewController *)self redoSearchOverlay];
    [v6 shouldHideFloatingControl:0 animated:1];

    id v8 = [(IOSBasedChromeViewController *)self baseModeController];
    unsigned int v7 = [v8 actionCoordinator];
    [v7 refreshCurrentSearch];
  }
  else
  {
    [v5 updateSearchOverlayWithState:1];
  }
}

- (void)stateManager:(id)a3 didChangeState:(BOOL)a4
{
}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4 preserveMapSelection:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5)
  {
    id v8 = [(ChromeViewController *)self mapSelectionManager];
    id v12 = [v8 selectionStateIncludingCamera:0 includeNotCustomLabelMarkers:1];

    uint64_t v9 = [(ChromeViewController *)self mapSelectionManager];
    [v9 setIgnoreSelectionChanges:1];

    [(IOSBasedChromeViewController *)self updateViewMode:a3 animated:v5];
    if (v12)
    {
      char v10 = [(ChromeViewController *)self mapSelectionManager];
      [v10 restoreSelectionState:v12 animated:0 restoreRegion:0 notifyDelegate:0];
    }
    id v11 = [(ChromeViewController *)self mapSelectionManager];
    [v11 setIgnoreSelectionChanges:0];
  }
  else
  {
    -[IOSBasedChromeViewController updateViewMode:animated:](self, "updateViewMode:animated:");
  }
}

- (void)updateViewMode:(int64_t)displayedViewMode animated:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = +[MapsOfflineUIHelper sharedHelper];
  if ([v7 isUsingOfflineMaps])
  {

    if (((displayedViewMode - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
    {
      displayedViewMode = self->_displayedViewMode;
      if (((displayedViewMode - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
      {
        uint64_t v41 = 0;
        long long v40 = 0u;
        int64x2_t v38 = 0u;
        _MKCartographicConfigurationDefault();
        displayedViewMode = 0;
        int64x2_t v39 = vdupq_n_s64(1uLL);
        *(void *)&long long v40 = 0;
        goto LABEL_13;
      }
    }
  }
  else
  {
  }
  uint64_t v41 = 0;
  long long v40 = 0u;
  int64x2_t v38 = 0u;
  _MKCartographicConfigurationDefault();
  int64x2_t v39 = vdupq_n_s64(1uLL);
  *(void *)&long long v40 = 0;
  switch(displayedViewMode)
  {
    case 1:
      displayedViewMode = 1;
      int64x2_t v38 = vdupq_n_s64(1uLL);
      v39.i64[0] = 0;
      break;
    case 2:
      v39.i64[0] = 0;
      int64x2_t v38 = (int64x2_t)1uLL;
      displayedViewMode = 2;
      break;
    case 3:
      v38.i64[1] = 4;
      displayedViewMode = 3;
      break;
    case 5:
      int64x2_t v38 = vdupq_n_s64(1uLL);
      displayedViewMode = 5;
      break;
    case 6:
      int64x2_t v38 = (int64x2_t)xmmword_100F67600;
      displayedViewMode = 6;
      break;
    case 7:
      v38.i64[1] = 2;
      displayedViewMode = 7;
      break;
    default:
      break;
  }
LABEL_13:
  if ([(IOSBasedChromeViewController *)self shouldUseModernMap]) {
    int64_t v8 = [(IOSBasedChromeViewController *)self modernMapProjectionType];
  }
  else {
    int64_t v8 = v39.i64[0];
  }
  v39.i64[0] = v8;
  if ([(IOSBasedChromeViewController *)self shouldUseModernMap]) {
    int64_t v9 = [(IOSBasedChromeViewController *)self modernMapTerrainMode];
  }
  else {
    int64_t v9 = v39.i64[1];
  }
  int64_t v10 = self->_displayedViewMode;
  v39.i64[1] = v9;
  int64x2_t v34 = 0u;
  long long v36 = 0u;
  uint64_t v37 = 0;
  _MKCartographicConfigurationDefault();
  int64x2_t v35 = vdupq_n_s64(1uLL);
  *(void *)&long long v36 = 0;
  switch(v10)
  {
    case 1:
      int64x2_t v34 = vdupq_n_s64(1uLL);
      v35.i64[0] = 0;
      break;
    case 2:
      v35.i64[0] = 0;
      int64x2_t v34 = (int64x2_t)1uLL;
      break;
    case 3:
      uint64_t v11 = 4;
      goto LABEL_27;
    case 5:
      int64x2_t v12 = vdupq_n_s64(1uLL);
      goto LABEL_25;
    case 6:
      int64x2_t v12 = (int64x2_t)xmmword_100F67600;
LABEL_25:
      int64x2_t v34 = v12;
      break;
    case 7:
      uint64_t v11 = 2;
LABEL_27:
      v34.i64[1] = v11;
      break;
    default:
      break;
  }
  BOOL v14 = v34.i64[0] == 1 && v38.i64[0] != 1;
  self->_transitioningFromImagerCGFloat y = v14;
  self->_displayedViewMode = displayedViewMode;
  id v15 = [(ChromeViewController *)self mapView];
  v32[0] = v38;
  v32[1] = v39;
  v32[2] = v40;
  uint64_t v33 = v41;
  [v15 _setCartographicConfiguration:v32 animated:v4];

  BOOL v16 = [(IOSBasedChromeViewController *)self _shouldShowTrafficForViewMode:displayedViewMode];
  char v17 = [(ChromeViewController *)self mapView];
  [v17 setShowsTraffic:v16];

  CGFloat v18 = [(IOSBasedChromeViewController *)self userLocationView];
  [v18 setViewMode:displayedViewMode];

  self->_int64_t interfaceStyleForMapType = 0;
  [(IOSBasedChromeViewController *)self _updateMapViewWithEVChargingConfig];
  double v19 = [(IOSBasedChromeViewController *)self _maps_mapsSceneDelegate];
  CGFloat v20 = [v19 window];

  if (sub_1000BBB44(self) == 5) {
    goto LABEL_39;
  }
  unsigned int v21 = [(ChromeViewController *)self mapView];
  if (!v21)
  {
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    goto LABEL_39;
  }
  uint64_t v22 = v21;
  [v21 _cartographicConfiguration];

  if ((void)v28 != 1)
  {
LABEL_39:
    double v24 = [(ChromeViewController *)self mapView];
    [v24 setOverrideUserInterfaceStyle:0];
    uint64_t v23 = 0;
    goto LABEL_40;
  }
  uint64_t v23 = 2;
  self->_int64_t interfaceStyleForMapType = 2;
  double v24 = [(ChromeViewController *)self mapView];
  [v24 setOverrideUserInterfaceStyle:1];
LABEL_40:

  [v20 setOverrideUserInterfaceStyle:v23];
  [(IOSBasedChromeViewController *)self updateThemeViewAndControllers];
  unsigned __int8 v25 = [(IOSBasedChromeViewController *)self viewModeDelegate];
  [v25 chromeViewController:self didUpdateViewMode:displayedViewMode];

  [(IOSBasedChromeViewController *)self setNeedsStatusBarAppearanceUpdate];
  double v26 = +[MapsFavoritesManager sharedManager];
  [v26 setMapViewMode:displayedViewMode];

  double v27 = [(ChromeViewController *)self mapView];
  +[MapsAnalyticStateProvider updateMapViewInformation:v27];

  +[MapsAnalyticStateProvider updateMapViewViewMode:displayedViewMode];
}

- (void)didUpdateForcedExploreMapConfiguration:(BOOL)a3
{
  if (a3 && sub_1000BBB44(self) != 5)
  {
    BOOL v4 = [(ChromeViewController *)self mapView];
    [v4 setOverrideUserInterfaceStyle:0];

    id v6 = [(IOSBasedChromeViewController *)self _maps_mapsSceneDelegate];
    BOOL v5 = [v6 window];
    [v5 setOverrideUserInterfaceStyle:0];
  }
}

- (void)_windowUserInterfaceStyleDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B71B18;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateThemeForVisualEffectStyle:(unint64_t)a3
{
  id v4 = [(IOSBasedChromeViewController *)self theme];
  [v4 updateVisualEffectStyleIfNeeded:a3];
}

- (void)_updateViewModeForLabelsDisplayIfNeeded
{
  int64_t v3 = [(IOSBasedChromeViewController *)self displayedViewMode];
  id v4 = [(IOSBasedChromeViewController *)self settingsController];
  unsigned int v5 = [v4 shouldChangeViewModeForLabels];

  if (v5)
  {
    int64_t v6 = v3 - 1;
    if (unint64_t)(v3 - 1) <= 5 && ((0x33u >> v6))
    {
      uint64_t v7 = qword_100F736B8[v6];
      [(IOSBasedChromeViewController *)self setViewMode:v7 animated:1];
    }
  }
}

- (void)_updateViewModeForTrafficDisplayIfNeeded
{
  int64_t v3 = [(IOSBasedChromeViewController *)self displayedViewMode];
  id v4 = [(IOSBasedChromeViewController *)self settingsController];
  unsigned int v5 = [v4 shouldChangeViewModeForTraffic];

  if (v5)
  {
    switch(v3)
    {
      case 2:
        uint64_t v6 = 1;
        break;
      case 3:
        uint64_t v6 = 0;
        break;
      case 6:
        uint64_t v6 = 5;
        break;
      default:
        return;
    }
    [(IOSBasedChromeViewController *)self setViewMode:v6 animated:1];
  }
}

- (BOOL)removesMapViewWhenInactive
{
  return 0;
}

- (BOOL)willMoveToOrFromSecureLockScreenUI:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isTransitioningToLockScreen = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v5 = [(ChromeViewController *)self contexts];
  uint64_t v6 = [v5 reverseObjectEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        int64x2_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (sub_1000BBF90((uint64_t)v12, (Protocol *)&OBJC_PROTOCOL___LockScreenProtocol))
        {
          if (v3) {
            [v12 willBeginDisplayingInSecureLockScreen];
          }
          else {
            [v12 didEndDisplayingInLockScreen];
          }
          char v9 = 1;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);

    if (v9)
    {
      [(IOSBasedChromeViewController *)self handleMoveToOrFromSecureLockscreenUI:v3];
      return 1;
    }
  }
  else
  {
  }
  self->_isTransitioningToLockScreen = 0;
  return !v3;
}

- (void)didMoveToOrFromSecureLockScreenUI:(BOOL)a3
{
  self->_isTransitioningToLockScreen = 0;
}

- (void)setSuggestedApplicationState:(int)a3
{
  LODWORD(v3) = a3;
  unsigned int v5 = [(IOSBasedChromeViewController *)self appCoordinator];
  unsigned int v6 = [v5 isRoutePlanningPresented];

  if (v6) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v3;
  }
  id v7 = [(ChromeViewController *)self mapView];
  [v7 _setApplicationState:v3];
}

- (void)presentMapsDebugControllerIfEnabled
{
  id v2 = [(IOSBasedChromeViewController *)self _maps_mapsSceneDelegate];
  [v2 presentMapsDebugControllerIfEnabled];
}

- (void)debugControllerDidFinish:(id)a3
{
}

- (id)allVisibleMapViewsForDebugController:(id)a3
{
  uint64_t v3 = +[UIApplication sharedMapsDelegate];
  id v4 = [v3 allVisibleMapViews];

  return v4;
}

- (id)allVisibleMapViewsButNotCarPlayForDebugController:(id)a3
{
  uint64_t v3 = +[UIApplication sharedMapsDelegate];
  id v4 = [v3 allVisibleMapViewsButNotCarPlay];

  return v4;
}

- (void)debugController:(id)a3 choseTraceAtPath:(id)a4 startNav:(BOOL)a5
{
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100B72118;
  v13[3] = &unk_1012E5CE0;
  BOOL v16 = a5;
  id v14 = a4;
  long long v15 = self;
  id v9 = v14;
  uint64_t v10 = objc_retainBlock(v13);
  uint64_t v11 = [v8 presentingViewController];

  if (v11)
  {
    int64x2_t v12 = [v8 presentingViewController];
    [v12 dismissViewControllerAnimated:1 completion:v10];
  }
  else
  {
    ((void (*)(void *))v10[2])(v10);
  }
}

- (BOOL)locationPulseEnabled
{
  id v2 = [(ChromeViewController *)self mapView];
  unsigned __int8 v3 = [v2 _isLocationPulseEnabled];

  return v3;
}

- (void)setLocationPulseEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ChromeViewController *)self mapView];
  [v4 _setLocationPulseEnabled:v3];
}

- (void)select3dMode
{
  id v2 = [(IOSBasedChromeViewController *)self coordinator];
  [v2 select3dMode];
}

- (void)enterLookAroundPIP
{
}

- (void)enterLookAroundPIP:(id)a3
{
  id v33 = a3;
  id v4 = [(IOSBasedChromeViewController *)self coordinator];
  unsigned int v5 = [v4 containerViewController];
  unsigned int v6 = [v5 view];

  if (v33)
  {
    [v33 bounds];
    [v6 convertRect:v33 fromView:];
  }
  else
  {
    [v6 frame];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  long long v15 = [(IOSBasedChromeViewController *)self appCoordinator];
  BOOL v16 = [v15 baseActionCoordinator];
  long long v17 = [v16 currentMapItem];

  if (([v17 _hasLookAroundStorefront] & 1) == 0)
  {
    CGFloat v18 = [(ChromeViewController *)self mapView];
    id v19 = objc_alloc((Class)MKPlacemark);
    [v18 centerCoordinate];
    id v20 = [v19 initWithCoordinate:];
    id v21 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v20];

    long long v17 = v21;
  }
  uint64_t v22 = [(IOSBasedChromeViewController *)self coordinator];
  uint64_t v23 = [v22 currentLookAroundView];

  if (v23)
  {
    double v24 = [v23 window];
    [v23 bounds];
    [v24 convertRect:v23 fromView:];
    double v11 = v25;
    double v12 = v26;
    double v13 = v27;
    double v14 = v28;
  }
  long long v29 = +[MKLookAroundEntryPoint entryPointWithMapItem:v17 triggerAction:6061];
  +[GEOAPPortal captureUserAction:6061 target:[(IOSBasedChromeViewController *)self currentUITargetForAnalytics] value:0];
  long long v30 = [(IOSBasedChromeViewController *)self coordinator];
  uint64_t v31 = [v30 containerViewController];
  [v31 setContaineesHidden:1];

  unsigned int v32 = [(IOSBasedChromeViewController *)self appCoordinator];
  [v32 enterLookAroundWithEntryPoint:v29 lookAroundView:v23 showsFullScreen:0 originFrame:v11, v12, v13, v14];
}

- (void)enterLookAroundForMapItem:(id)a3 isMarkedLocation:(BOOL)a4 lookAroundView:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [v8 window];
  [v8 bounds];
  [v10 convertRect:v8 fromView:];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  id v20 = +[MKLookAroundEntryPoint entryPointWithMapItem:v9 isMarkedLocation:v5 wantsCloseUpView:1 cameraFrameOverride:0 triggerAction:6060];

  id v19 = [(IOSBasedChromeViewController *)self appCoordinator];
  [v19 enterLookAroundWithEntryPoint:v20 lookAroundView:v8 showsFullScreen:1 originFrame:v12 v14, v16, v18];
}

- (void)exitLookAround
{
  id v2 = [(IOSBasedChromeViewController *)self appCoordinator];
  [v2 exitLookAround];
}

- (void)selectLookAroundMode
{
  BOOL v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(IOSBasedChromeViewController *)self enterLookAroundPIP];
  }
  else
  {
    id v5 = [(IOSBasedChromeViewController *)self lookAroundCoordinator];
    [v5 exitLookAround];
  }
}

- (void)openUserProfile
{
  id v2 = [(IOSBasedChromeViewController *)self appCoordinator];
  [v2 openUserProfile];
}

- (void)shouldStartRedoSearch
{
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    id v4 = [(IOSBasedChromeViewController *)self baseModeController];
    BOOL v3 = [v4 actionCoordinator];
    [v3 refreshCurrentSearch];
  }
}

- (id)lookAroundCoordinator
{
  id v2 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 actionCoordinator];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)navActionCoordinator
{
  id v2 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 actionCoordinator];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)resetForEditingShortcut:(id)a3
{
  id v4 = a3;
  id v6 = [(IOSBasedChromeViewController *)self coordinator];
  [(IOSBasedChromeViewController *)self _teardownViewHierarchyWithActionCoordinator:v6 shouldAnimate:1];
  id v5 = +[ShortcutEditSession editSessionWithShortcut:v4];

  [v6 viewController:self editShortcut:v5];
}

- (void)resetForLaunchURLWithOptions:(id)a3
{
  id v4 = a3;
  [(IOSBasedChromeViewController *)self coordinator];
  double v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100B72AF0;
  double v10 = &unk_1012E5D58;
  double v11 = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v5;
  +[UIViewController _performWithoutDeferringTransitions:&v7];
  id v6 = [v4 objectForKeyedSubscript:_MKLaunchOptionsPreserveSearchResultsKey v7, v8, v9, v10, v11];

  LOBYTE(v4) = [v6 BOOLValue];
  if ((v4 & 1) == 0) {
    [v5 endSearch];
  }
}

- (void)resetForTestingAction
{
  BOOL v3 = [(ChromeViewController *)self mapView];
  id v4 = [v3 _mapLayer];

  if ([v4 mapType] - 3 <= 1)
  {
    id v5 = [(ChromeViewController *)self mapView];
    [v5 _stopFlyoverAnimation];

    id v6 = [(ChromeViewController *)self mapView];
    [v6 _exitARMode];

    double v7 = +[UIApplication sharedMapsDelegate];
    [v7 setMapsIsShowingTour:0];

    uint64_t v8 = [(IOSBasedChromeViewController *)self appCoordinator];
    [v8 exitFlyover];

    id v9 = sub_1000A930C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "resetForTestingAction exited Flyover", buf, 2u);
    }
  }
  if ([(IOSBasedChromeViewController *)self canExitLookAroundMode]) {
    [(IOSBasedChromeViewController *)self exitLookAround];
  }
  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B72D70;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_time_t v11 = dispatch_time(0, 3000000000);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100B72E44;
  v15[3] = &unk_1012E5D08;
  v15[4] = self;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v15);

  dispatch_time_t v12 = dispatch_time(0, 4000000000);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100B72E98;
  v14[3] = &unk_1012E5D08;
  v14[4] = self;
  dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v14);

  double v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"ResetForTestingActionNotification" object:0];
}

- (void)_teardownViewHierarchyForTesting
{
  BOOL v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_teardownViewHierarchyForTesting started", buf, 2u);
  }

  id v4 = +[UIApplication sharedMapsDelegate];
  id v5 = [v4 currentInterruptionKind];

  if (v5 != (id)5) {
    [(IOSBasedChromeViewController *)self dismissAllModalViewsIfPresentAnimated:0 completion:0];
  }
  id v6 = +[UIPrintInteractionController sharedPrintController];
  [v6 dismissAnimated:0];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B730EC;
  v8[3] = &unk_1012E5D08;
  void v8[4] = self;
  [(ChromeViewController *)self popToRootContextAnimated:0 completion:v8];
  [(IOSBasedChromeViewController *)self updateThemeViewAndControllers];
  double v7 = sub_1000A930C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_teardownViewHierarchyForTesting completed", buf, 2u);
  }
}

- (void)_teardownViewHierarchyWithActionCoordinator:(id)a3 shouldAnimate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = +[UIApplication sharedMapsDelegate];
  id v8 = [v7 currentInterruptionKind];

  if (v8 != (id)5) {
    [(IOSBasedChromeViewController *)self dismissAllModalViewsIfPresentAnimated:v4 completion:0];
  }
  id v9 = +[UIPrintInteractionController sharedPrintController];
  [v9 dismissAnimated:v4];

  [(ChromeViewController *)self popToRootContextAnimated:v4 completion:0];
  [v6 viewControllerPresentSearchEndEditingAnimated:v4];
  [v6 viewControllerClosed:0 animated:v4];
  dispatch_time_t v10 = [v6 searchPinsManager];

  [v10 clearLinkedPlacesAndPolygon];

  [(IOSBasedChromeViewController *)self updateThemeViewAndControllers];
}

- (void)cleanUIandHideSearch
{
  [(IOSBasedChromeViewController *)self resetForLaunchURLWithOptions:0];
  id v3 = [(IOSBasedChromeViewController *)self coordinator];
  [v3 viewControllerClosed:0 animated:0];
}

- (BOOL)displayNavigationAlertAndShouldContinue
{
  id v3 = +[MKLocationManager sharedLocationManager];
  id v8 = 0;
  unsigned __int8 v4 = [v3 isLocationServicesPossiblyAvailable:&v8];
  id v5 = v8;

  if (v4)
  {
    id v6 = [(ChromeViewController *)self mapView];
    [v6 setShowsUserLocation:1];
  }
  else
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 showLocationServicesAlertWithError:v5];
  }

  return v4;
}

- (void)searchForSearchItem:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  CFStringRef v17 = @"GEOMapServiceTraits_Source";
  dispatch_time_t v10 = +[NSNumber numberWithInt:v5];
  double v18 = v10;
  dispatch_time_t v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  if (v9)
  {
    id v12 = [v11 mutableCopy];
    [v12 setObject:v9 forKeyedSubscript:@"GEOMapServiceTraits"];

    dispatch_time_t v11 = v12;
  }
  double v13 = [(IOSBasedChromeViewController *)self coordinator];

  if (v13)
  {
    double v14 = [(IOSBasedChromeViewController *)self coordinator];
LABEL_7:
    double v16 = v14;
    [v14 viewController:self doSearchItem:v8 withUserInfo:v11];

    goto LABEL_8;
  }
  double v15 = [(IOSBasedChromeViewController *)self navActionCoordinator];

  if (v15)
  {
    double v14 = [(IOSBasedChromeViewController *)self navActionCoordinator];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)searchForAddress:(id)a3 source:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v7 setAddress:v6];

  CFStringRef v11 = @"GEOMapServiceTraits_Source";
  id v8 = +[NSNumber numberWithInt:v4];
  id v12 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  dispatch_time_t v10 = [(IOSBasedChromeViewController *)self coordinator];
  [v10 viewController:self doSearchItem:v7 withUserInfo:v9];
}

- (void)searchForAddressString:(id)a3 source:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v7 setAddressString:v6];

  CFStringRef v11 = @"GEOMapServiceTraits_Source";
  id v8 = +[NSNumber numberWithInt:v4];
  id v12 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  dispatch_time_t v10 = [(IOSBasedChromeViewController *)self coordinator];
  [v10 viewController:self doSearchItem:v7 withUserInfo:v9];
}

- (void)searchForRouteFromAddress:(id)a3 toAddress:(id)a4 directionsMode:(unint64_t)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  double v13 = objc_alloc_init(SearchFieldItem);
  if ([v10 length])
  {
    [(SearchFieldItem *)v13 setSearchString:v10];
  }
  else
  {
    double v14 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v13 setSearchResult:v14];
  }
  double v15 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v15 setSearchString:v12];

  if (a5 - 1 > 7) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = qword_100F736E8[a5 - 1];
  }
  CFStringRef v17 = [DirectionItem alloc];
  v21[0] = v13;
  v21[1] = v15;
  double v18 = +[NSArray arrayWithObjects:v21 count:2];
  id v19 = [(DirectionItem *)v17 initWithItems:v18 transportType:v16];

  id v20 = [(IOSBasedChromeViewController *)self coordinator];
  [v20 viewController:self doDirectionItem:v19 withUserInfo:v11];
}

- (void)searchForExternalURLQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v13 = a7;
  id v14 = a3;
  CFStringRef v17 = objc_alloc_init(SearchFieldItem);
  double v15 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:]([ExternalURLQuery alloc], "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v14, a5, v7, v13, latitude, longitude);

  [(SearchFieldItem *)v17 setExternalURLQuery:v15];
  uint64_t v16 = [(IOSBasedChromeViewController *)self coordinator];
  [v16 viewController:self doSearchItem:v17 withUserInfo:&off_1013AEE70];
}

- (void)searchForString:(id)a3 traits:(id)a4 scrollToResults:(BOOL)a5 source:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v11 setSearchString:v10];

  if (!v9)
  {
    id v9 = [(IOSBasedChromeViewController *)self currentTraits];
  }
  v15[0] = @"GEOMapServiceTraits_Source";
  id v12 = +[NSNumber numberWithInt:v6];
  v15[1] = @"GEOMapServiceTraits";
  v16[0] = v12;
  v16[1] = v9;
  id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v14 = [(IOSBasedChromeViewController *)self coordinator];
  [v14 viewController:self doSearchItem:v11 withUserInfo:v13];
}

- (void)searchWithSearchInfo:(id)a3 source:(int)a4
{
  id v6 = a3;
  if ([v6 isSearchAlongRoute])
  {
    uint64_t v5 = [(IOSBasedChromeViewController *)self navActionCoordinator];
    [v5 setCurrentSearchInfo:v6];
  }
}

- (void)routeFromSearchResult:(id)a3 toSearchResult:(id)a4 directionsType:(unint64_t)a5 drivePreferences:(id)a6 routeHandle:(id)a7 timePoint:(id)a8 withFeedback:(id)a9 origin:(int64_t)a10 options:(id)a11
{
  id v15 = a11;
  id v16 = a4;
  id v17 = a3;
  double v18 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v18 setSearchResult:v17];

  id v19 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v19 setSearchResult:v16];

  id v20 = [DirectionItem alloc];
  v24[0] = v18;
  v24[1] = v19;
  id v21 = +[NSArray arrayWithObjects:v24 count:2];
  switch(a5)
  {
    case 1uLL:
      break;
    case 2uLL:
      a5 = 2;
      break;
    case 4uLL:
      a5 = 3;
      break;
    case 8uLL:
      a5 = 5;
      break;
    default:
      a5 = 0;
      break;
  }
  uint64_t v22 = [(DirectionItem *)v20 initWithItems:v21 transportType:a5];

  uint64_t v23 = [(IOSBasedChromeViewController *)self coordinator];
  [v23 viewController:self doDirectionItem:v22 withUserInfo:v15];
}

- (void)directionsTypeForMapItem:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[MKLocationManager sharedLocationManager];
    if ([v8 hasLocation])
    {
      id v9 = [v8 lastLocation];
      [v9 coordinate];
      double latitude = v10;
      double longitude = v12;
    }
    else
    {
      double latitude = kCLLocationCoordinate2DInvalid.latitude;
      double longitude = kCLLocationCoordinate2DInvalid.longitude;
    }
    id v14 = [v6 placemark];
    if (v14)
    {
      id v15 = [v6 placemark];
      [v15 coordinate];
      double v17 = v16;
      double v19 = v18;
    }
    else
    {
      double v17 = kCLLocationCoordinate2DInvalid.latitude;
      double v19 = kCLLocationCoordinate2DInvalid.longitude;
    }

    id v20 = [(IOSBasedChromeViewController *)self defaultTransportTypeFinder];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_100B73E98;
    v21[3] = &unk_1012F4A20;
    id v22 = v7;
    [v20 mkDirectionsTypeForOrigin:1 destination:v21 ignoreMapType:latitude longitude:v17 completion:v19];
  }
}

- (id)routeCreationContext
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ChromeViewController *)self contexts];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)createCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = [(IOSBasedChromeViewController *)self baseModeController];
  [v9 createCustomSearchResultForDroppedPinAtPoint:v6 floorOrdinal:v5 animated:latitude, longitude];
}

- (void)createCustomSearchResultForDroppedPinAtCenterPoint
{
  id v2 = [(IOSBasedChromeViewController *)self baseModeController];
  [v2 createCustomSearchResultForDroppedPinAtCenterPoint];
}

- (BOOL)canDropPin
{
  id v2 = [(IOSBasedChromeViewController *)self baseModeController];
  unsigned __int8 v3 = [v2 canDropPin];

  return v3;
}

- (void)displayNearbySearch
{
  id v3 = [(IOSBasedChromeViewController *)self coordinator];
  [v3 viewControllerOpenNearby:self animated:0];
}

- (void)displayNavShareETA
{
  id v3 = [(IOSBasedChromeViewController *)self currentIOSBasedContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(IOSBasedChromeViewController *)self currentIOSBasedContext];
    if (MSPSharedTripSharingAvailable())
    {
      BOOL v5 = [v8 route];
      unsigned int v6 = [v5 transportType];

      if (!v6)
      {
        id v7 = [v8 navActionCoordinator];
        [v7 senderShareNavigation:self];
      }
    }
  }
}

- (void)selectParkedCarAndPerformAction:(int64_t)a3
{
  BOOL v5 = +[ParkedCarManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B74288;
  v6[3] = &unk_101319998;
  v6[4] = self;
  void v6[5] = a3;
  [v5 fetchParkedCar:v6];
}

- (void)showTransitLine:(unint64_t)a3 withName:(id)a4
{
  id v10 = a4;
  id v6 = objc_alloc((Class)MKMapItemIdentifier);
  id v7 = [v6 initWithMUID:a3 resultProviderID:0 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];
  if (v7)
  {
    id v8 = [[IncompleteTransitLineItem alloc] initWithIdentifier:v7 name:v10];
    id v9 = [(IOSBasedChromeViewController *)self coordinator];
    [v9 viewController:self selectTransitLineItem:v8 zoomToMapRegion:1];
  }
}

- (void)showFavoritesType:(int64_t)a3
{
  id v5 = [(IOSBasedChromeViewController *)self coordinator];
  [v5 viewController:self showFavoritesType:a3];
}

- (void)showAnnouncementForFlyover:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSBasedChromeViewController *)self coordinator];
  [v5 showAnnouncementForFlyover:v4];
}

- (void)reportCurrentLocationFailure
{
  id v2 = [(IOSBasedChromeViewController *)self interruptionManager];
  [v2 reportCurrentLocationFailure];
}

- (int)currentUITargetForAnalytics
{
  id v3 = [(ChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 fullscreenViewController];
  }
  else
  {
    id v4 = 0;
  }
  if (sub_1000BBF90((uint64_t)v4, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    id v5 = v4;
    if (objc_opt_respondsToSelector())
    {
      int v6 = [v5 currentUITargetForAnalytics];
      goto LABEL_14;
    }
  }
  id v7 = [(IOSBasedChromeViewController *)self cardsOverlay];
  id v5 = [v7 currentViewController];

  if (sub_1000BBF90((uint64_t)v5, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    id v5 = v5;
    if (objc_opt_respondsToSelector()) {
      int v6 = [v5 currentUITargetForAnalytics];
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
LABEL_14:

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  id v3 = [(ChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 fullscreenViewController];
  }
  else
  {
    id v4 = 0;
  }
  if (sub_1000BBF90((uint64_t)v4, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    id v5 = v4;
    if (objc_opt_respondsToSelector())
    {
      int v6 = [v5 currentMapViewTargetForAnalytics];
      goto LABEL_14;
    }
  }
  id v7 = [(IOSBasedChromeViewController *)self cardsOverlay];
  id v5 = [v7 currentViewController];

  if (sub_1000BBF90((uint64_t)v5, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    id v5 = v5;
    if (objc_opt_respondsToSelector()) {
      int v6 = [v5 currentMapViewTargetForAnalytics];
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
LABEL_14:

  return v6;
}

- (DefaultTransportTypeFinder)defaultTransportTypeFinder
{
  defaultTransportTypeFinder = self->_defaultTransportTypeFinder;
  if (!defaultTransportTypeFinder)
  {
    id v4 = [[DefaultTransportTypeFinder alloc] initWithMapTypeSource:self];
    id v5 = self->_defaultTransportTypeFinder;
    self->_defaultTransportTypeFinder = v4;

    defaultTransportTypeFinder = self->_defaultTransportTypeFinder;
  }

  return defaultTransportTypeFinder;
}

- (int)displayedMapType
{
  unint64_t v2 = self->_displayedViewMode + 1;
  if (v2 > 7) {
    return 1;
  }
  else {
    return dword_100F73728[v2];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("find:" == a3 || "defaultZoom" == a3 || "zoomIn" == a3 || "zoomOut" == a3 || "centerMapToUserLocation" == a3)
  {
    long long v11 = [(ChromeViewController *)self topContext];
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_16;
  }
  if ("snapToNorth" == a3)
  {
    unsigned __int8 v14 = [(IOSBasedChromeViewController *)self canSnapToNorth];
LABEL_31:
    char v13 = v14;
    goto LABEL_32;
  }
  if ("createCustomSearchResultForDroppedPinAtCenterPoint" == a3)
  {
    unsigned __int8 v14 = [(IOSBasedChromeViewController *)self canDropPin];
    goto LABEL_31;
  }
  if ("select3dMode" == a3)
  {
    unsigned __int8 v14 = [(IOSBasedChromeViewController *)self canEnter3dMode];
    goto LABEL_31;
  }
  if ("selectLookAroundMode" == a3)
  {
    if ([(IOSBasedChromeViewController *)self canEnterLookAroundMode]
      || [(IOSBasedChromeViewController *)self canExitLookAroundMode])
    {
      char v13 = 1;
      goto LABEL_32;
    }
    unsigned __int8 v14 = [(IOSBasedChromeViewController *)self _canShowLookAroundButton];
    goto LABEL_31;
  }
  if ("toggleLabels" == a3)
  {
    long long v11 = [(IOSBasedChromeViewController *)self settingsController];
    unsigned __int8 isKindOfClass = [v11 canToggleLabels];
  }
  else
  {
    if ("openUserProfile" == a3)
    {
      double v16 = [(IOSBasedChromeViewController *)self appCoordinator];
      double v17 = [v16 baseActionCoordinator];
      long long v11 = [v17 currentViewController];

      if (sub_1000BBB44(self) == 5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (sub_1000BBB44(self) == 5)
        {
          double v18 = [(ChromeViewController *)self topContext];
          objc_opt_class();
          char v13 = objc_opt_isKindOfClass();
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 1;
      }
      goto LABEL_17;
    }
    if ("toggleTraffic" == a3)
    {
      long long v11 = [(IOSBasedChromeViewController *)self settingsController];
      unsigned __int8 isKindOfClass = [v11 canToggleTraffic];
    }
    else
    {
      if ("undo:" != a3)
      {
        if ("redo:" == a3)
        {
          char v13 = 0;
          goto LABEL_32;
        }
        v19.receiver = self;
        v19.super_class = (Class)IOSBasedChromeViewController;
        unsigned __int8 v14 = [(IOSBasedChromeViewController *)&v19 canPerformAction:a3 withSender:v6];
        goto LABEL_31;
      }
      long long v11 = [(IOSBasedChromeViewController *)self routeCreationContext];
      unsigned __int8 isKindOfClass = [v11 undoEnabled];
    }
  }
LABEL_16:
  char v13 = isKindOfClass;
LABEL_17:

LABEL_32:
  return v13 & 1;
}

- (void)validateCommand:(id)a3
{
  id v14 = a3;
  if ([v14 action] == "snapToNorth")
  {
    [v14 setState:[self isSnappedToNorth]];
LABEL_21:
    id v5 = v14;
    goto LABEL_22;
  }
  if ([v14 action] == "switchMapMode:")
  {
    id v10 = [v14 propertyList];
    id v11 = [v10 integerValue];
    double v12 = [(IOSBasedChromeViewController *)self settingsController];
    [v14 setState:[v12 selectedViewMode] == v11];

    char v13 = [(ChromeViewController *)self topContext];
    objc_opt_class();
    LOBYTE(v11) = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0) {
      [v14 setAttributes:1];
    }

    goto LABEL_21;
  }
  if ([v14 action] == "removeDroppedPin"
    && ![(IOSBasedChromeViewController *)self canRemovePin])
  {
    [v14 setAttributes:4];
    goto LABEL_21;
  }
  if ([v14 action] == "select3dMode")
  {
    id v8 = [(IOSBasedChromeViewController *)self coordinator];
    id v9 = [v8 is3dModeSelected];
    goto LABEL_20;
  }
  if ([v14 action] == "selectLookAroundMode")
  {
    [v14 _maps_setUseDisableFeatureTitle:[self canExitLookAroundMode]];
    goto LABEL_21;
  }
  if ([v14 action] == "toggleLabels")
  {
    id v8 = [(IOSBasedChromeViewController *)self settingsController];
    id v9 = [v8 showsLabels];
    goto LABEL_20;
  }
  BOOL v4 = [v14 action] == "toggleTraffic";
  id v5 = v14;
  if (v4)
  {
    id v6 = [(IOSBasedChromeViewController *)self settingsController];
    unsigned int v7 = [v6 showsTraffic];

    id v5 = v14;
    if (v7)
    {
      id v8 = [(IOSBasedChromeViewController *)self settingsController];
      id v9 = [v8 showsTraffic];
LABEL_20:
      [v14 _maps_setUseDisableFeatureTitle:v9];

      goto LABEL_21;
    }
  }
LABEL_22:
}

- (BOOL)canEnter3dMode
{
  id v3 = [(ChromeViewController *)self mapView];
  BOOL v4 = [v3 _mapLayer];

  unsigned int v5 = [v4 mapType];
  id v6 = [(ChromeViewController *)self mapView];
  unsigned __int8 v7 = [v6 _canEnter3DMode];

  id v8 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v5 == 1)
  {
    uint64_t v10 = 3;
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    uint64_t v10 = 4;
LABEL_5:
    unsigned __int8 v11 = [v4 supportsMapType:v10];
    goto LABEL_7;
  }
  unsigned __int8 v11 = 0;
LABEL_7:
  if (v5 - 3 < 2) {
    char v12 = 1;
  }
  else {
    char v12 = v11;
  }
  if (v7 & 1 | ((isKindOfClass & 1) == 0)) {
    char v13 = isKindOfClass;
  }
  else {
    char v13 = v12;
  }

  return v13 & 1;
}

- (BOOL)canEnterLookAroundMode
{
  id v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(ChromeViewController *)self mapView];
    BOOL v5 = [v4 _lookAroundAvailability] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canExitLookAroundMode
{
  unint64_t v2 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_lookAroundButtonPlaceCardItem
{
  id v3 = [(ChromeViewController *)self topContext];
  if ([(IOSBasedChromeViewController *)self _shouldCollapseLookoaroundPreview]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = [v3 placeCardItemForLookAroundButton];
  }

  return v4;
}

- (void)toggleLabels
{
  id v2 = [(IOSBasedChromeViewController *)self settingsController];
  [v2 toggleLabels];
}

- (void)toggleTraffic
{
  id v2 = [(IOSBasedChromeViewController *)self settingsController];
  [v2 toggleTraffic];
}

- (void)switchMapMode:(id)a3
{
  id v7 = [a3 propertyList];
  id v4 = [v7 integerValue];
  BOOL v5 = [(IOSBasedChromeViewController *)self coordinator];
  id v6 = [v5 settingsController];
  [v6 setSelectedViewMode:v4 animated:1];
}

- (BOOL)canSnapToNorth
{
  id v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    BOOL v5 = [(ChromeViewController *)self topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)isSnappedToNorth
{
  id v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(IOSBasedChromeViewController *)self lookAroundCoordinator];
    id v6 = [v5 dataCoordinator];
    id v7 = [v6 lookAroundView];
    [v7 presentationYaw];
    double v9 = v8;
  }
  else
  {
    BOOL v5 = [(ChromeViewController *)self mapView];
    [v5 presentationYaw];
    double v9 = v10;
  }

  return fabs(v9) < 0.0001;
}

- (void)snapToNorth
{
  id v3 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(IOSBasedChromeViewController *)self lookAroundCoordinator];
    BOOL v5 = [v8 dataCoordinator];
    id v6 = [v5 lookAroundView];
    [v6 snapToNorth:self];
  }
  else
  {
    id v7 = [(ChromeViewController *)self mapView];
    [v7 _stopFlyoverAnimation];

    id v8 = [(ChromeViewController *)self mapView];
    [v8 snapToNorth:self];
  }
}

- (void)defaultZoom
{
  id v2 = [(IOSBasedChromeViewController *)self coordinator];
  [v2 defaultZoom];
}

- (void)zoomIn
{
  id v2 = [(IOSBasedChromeViewController *)self coordinator];
  [v2 zoomIn];
}

- (void)zoomOut
{
  id v2 = [(IOSBasedChromeViewController *)self coordinator];
  [v2 zoomOut];
}

- (void)centerMapToUserLocation
{
  id v3 = [(ChromeViewController *)self mapView];
  [v3 _stopFlyoverAnimation];

  id v4 = [(ChromeViewController *)self mapView];
  [v4 setUserTrackingMode:1 animated:1];
}

- (BOOL)canRemovePin
{
  id v2 = [(IOSBasedChromeViewController *)self baseModeController];
  unsigned __int8 v3 = [v2 hasDroppedPin];

  return v3;
}

- (void)removeDroppedPin
{
  id v2 = [(IOSBasedChromeViewController *)self baseModeController];
  [v2 removeDroppedPin];
}

- (void)find:(id)a3
{
  id v3 = [(IOSBasedChromeViewController *)self coordinator];
  [v3 viewControllerPresentSearchEditing];
}

- (void)undo:(id)a3
{
  id v3 = [(IOSBasedChromeViewController *)self routeCreationContext];
  [v3 pressedUndo];
}

- (void)printCurrentState
{
  id v3 = [(IOSBasedChromeViewController *)self _maps_platformController];
  id v8 = [v3 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v8 currentRouteCollection];
    BOOL v5 = [v4 currentRoute];
    [(IOSBasedChromeViewController *)self printRoute:v5];
  }
  else
  {
    id v6 = [(IOSBasedChromeViewController *)self appCoordinator];
    id v7 = [v6 baseActionCoordinator];
    id v4 = [v7 currentSearchSession];

    [(IOSBasedChromeViewController *)self printSearchResultFromSession:v4];
  }
}

- (void)_initializePrintingController
{
  if (!self->_printController)
  {
    id v3 = [PrintController alloc];
    id v6 = [(ChromeViewController *)self mapView];
    id v4 = [(PrintController *)v3 initWithMapView:v6 delegate:self];
    printController = self->_printController;
    self->_printController = v4;
  }
}

- (void)printRoute:(id)a3
{
  id v4 = a3;
  [(IOSBasedChromeViewController *)self _initializePrintingController];
  +[GEOAPPortal captureUserAction:17052 target:0 value:0];
  printController = self->_printController;
  id v7 = [v4 destination];
  id v6 = [v7 name];
  [(PrintController *)printController printRoute:v4 searchString:v6];
}

- (void)printSearchResultFromSession:(id)a3
{
  id v4 = a3;
  [(IOSBasedChromeViewController *)self _initializePrintingController];
  +[GEOAPPortal captureUserAction:17052 target:0 value:0];
  id v10 = [v4 searchFieldItem];
  printController = self->_printController;
  id v6 = [v10 searchString];
  id v7 = [v4 currentResults];
  id v8 = [v4 printedPageTitle];
  double v9 = [v4 printedPageSubtitle];

  [(PrintController *)printController printSearchString:v6 searchResults:v7 title:v8 subTitle:v9];
}

- (CGRect)popoverPresentationRectForPrintController:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 1.0;
  double v6 = 1.0;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.x = v3;
  return result;
}

- (void)chromeNavigationDisplayDidRenderRoute:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IOSBasedChromeViewController;
  [(ChromeViewController *)&v5 chromeNavigationDisplayDidRenderRoute:a3];
  double v4 = +[MKMapService sharedService];
  [v4 captureUserAction:3072 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (int64_t)modernMapTerrainMode
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(MapsTokenStorage *)self->_modernMapTokens tokens];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      double v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v6) userInfo];
        id v8 = [v7 objectForKeyedSubscript:@"reason"];

        id v9 = [v8 unsignedIntegerValue];
        if (v9)
        {

          return 0;
        }
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v10 = +[NSUserDefaults standardUserDefaults];
  unsigned int v11 = [v10 BOOLForKey:@"__internal_MapsDebugEnableTerrainMetros"];

  if (v11) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)modernMapProjectionType
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(MapsTokenStorage *)self->_modernMapTokens tokens];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    int64_t v6 = 1;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) userInfo];
        id v9 = [v8 objectForKeyedSubscript:@"reason"];

        id v10 = [v9 unsignedIntegerValue];
        if (v10)
        {
          int64_t v6 = 0;
          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v6 = 1;
  }
LABEL_12:

  return v6;
}

- (void)_updateModernMapCartographicConfiguration
{
  unsigned __int8 v3 = [(IOSBasedChromeViewController *)self shouldUseModernMap];
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  id v4 = [(ChromeViewController *)self mapView];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 _cartographicConfiguration];
  }
  else
  {
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
  }

  if (v3)
  {
    *((void *)&v16 + 1) = [(IOSBasedChromeViewController *)self modernMapTerrainMode];
    int64_t v6 = [(IOSBasedChromeViewController *)self modernMapProjectionType];
  }
  else
  {
    int64_t v6 = 1;
    *((void *)&v16 + 1) = 1;
  }
  *(void *)&long long v16 = v6;
  id v7 = sub_1000C49B4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v20 = *((void *)&v16 + 1);
    __int16 v21 = 2048;
    uint64_t v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_updateModernMapCartographicConfiguration with terrainMode: %ld projectionType: %ld", buf, 0x16u);
  }

  long long v11 = v15;
  long long v12 = v16;
  long long v13 = v17;
  uint64_t v14 = v18;
  id v8 = [(ChromeViewController *)self mapView];
  v9[0] = v11;
  v9[1] = v12;
  v9[2] = v13;
  uint64_t v10 = v14;
  [v8 _setCartographicConfiguration:v9];
}

- (id)acquireModernMapTokenForReason:(unint64_t)a3
{
  modernMapTokens = self->_modernMapTokens;
  CFStringRef v8 = @"reason";
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  int64_t v6 = [(MapsTokenStorage *)modernMapTokens tokenWithUserInfo:v5];

  return v6;
}

- (void)dismissAllModalViewsIfPresentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  int64_t v6 = (void (**)(void))a4;
  id v7 = sub_1000C49B4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    id v9 = v8;
    int v14 = 138412802;
    long long v15 = self;
    __int16 v16 = 2080;
    long long v17 = "-[IOSBasedChromeViewController dismissAllModalViewsIfPresentAnimated:completion:]";
    __int16 v18 = 2112;
    objc_super v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ %s, %@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v10 = [(IOSBasedChromeViewController *)self presentedViewController];
  if (v10)
  {
    long long v11 = (__CFString *)v10;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v12 = [(__CFString *)v11 presentedViewController];

      long long v11 = (__CFString *)v12;
      if (!v12) {
        goto LABEL_9;
      }
    }
    long long v13 = sub_1000C49B4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      long long v15 = self;
      __int16 v16 = 2080;
      long long v17 = "-[IOSBasedChromeViewController dismissAllModalViewsIfPresentAnimated:completion:]";
      __int16 v18 = 2112;
      objc_super v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ %s, dismissing Modal! %@", (uint8_t *)&v14, 0x20u);
    }

    [(__CFString *)v11 dismissViewControllerAnimated:v4 completion:v6];
  }
  else
  {
LABEL_9:
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)copy:(id)a3
{
  id v4 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:&__NSArray0__struct applicationActivities:0];
  uint64_t v5 = [(IOSBasedChromeViewController *)self currentShareItemSource];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int64_t v6 = [v5 activityProviders];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v20 = self;
    __int16 v21 = v5;
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [v11 activityViewController:v4 itemForActivityType:UIActivityTypeCopyToPasteboard];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v5 = v21;
            int v14 = [v21 searchResult];
            long long v15 = [(ChromeViewController *)v20 mapView];
            __int16 v16 = [v14 mapsURLfromMapView:v15];
            id v13 = +[NSURL URLWithString:v16];
          }
          else
          {
            id v13 = v12;
            uint64_t v5 = v21;
          }

          if (v13)
          {
            long long v17 = +[UIPasteboard generalPasteboard];
            __int16 v18 = [v13 absoluteString];
            double v26 = v18;
            objc_super v19 = +[NSArray arrayWithObjects:&v26 count:1];
            [v17 setObjects:v19];

            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v8) {
          goto LABEL_3;
        }
        id v13 = v6;
        uint64_t v5 = v21;
        goto LABEL_18;
      }
    }
  }
  id v13 = v6;
LABEL_18:

LABEL_19:
}

- (void)setInterruptionManager:(id)a3
{
}

- (ViewModeDelegate)viewModeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModeDelegate);

  return (ViewModeDelegate *)WeakRetained;
}

- (ParkedCarManager)parkedCarManager
{
  return self->_parkedCarManager;
}

- (void)setRidesharingAnnotationsManager:(id)a3
{
}

- (MapsActionController)mapsActionController
{
  return self->_mapsActionController;
}

- (void)setSharedTripsAnnotationsController:(id)a3
{
}

- (UIColor)statusBarAdditionalColor
{
  return self->_statusBarAdditionalColor;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
}

- (BOOL)isTransitioningToLockScreen
{
  return self->_isTransitioningToLockScreen;
}

- (RouteAnnotationsController)routeAnnotationsControllerIfExisted
{
  return self->_routeAnnotationsControllerIfExisted;
}

- (PrintController)printController
{
  return self->_printController;
}

- (BOOL)isWeatherBelowCards
{
  return self->_isWeatherBelowCards;
}

- (void)setIsWeatherBelowCards:(BOOL)a3
{
  self->_isWeatherBelowCards = a3;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherLayoutGuide, 0);
  objc_storeStrong((id *)&self->_innerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_cardsOverlay, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsControllerIfExisted, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_statusBarAdditionalColor, 0);
  objc_storeStrong((id *)&self->_floatingControlsOverlay, 0);
  objc_storeStrong((id *)&self->_weatherOverlay, 0);
  objc_storeStrong((id *)&self->_redoSearchOverlay, 0);
  objc_storeStrong((id *)&self->_lookAroundOverlay, 0);
  objc_storeStrong((id *)&self->_sharedTripsAnnotationsController, 0);
  objc_storeStrong((id *)&self->_mapsActionController, 0);
  objc_storeStrong((id *)&self->_ridesharingAnnotationsManager, 0);
  objc_storeStrong((id *)&self->_parkedCarManager, 0);
  objc_destroyWeak((id *)&self->_viewModeDelegate);
  objc_storeStrong((id *)&self->_interruptionManager, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_defaultTransportTypeFinder, 0);
  objc_storeStrong(&self->_externalContainerAppearanceWaitBlock, 0);
  objc_storeStrong(&self->_externalContainerAppearanceNotification, 0);
  objc_storeStrong((id *)&self->_floatingControlsOverlayDelegateProxy, 0);
  objc_storeStrong((id *)&self->_pedestrianARSessionStateManager, 0);
  objc_storeStrong((id *)&self->_viewControllersForPresentingInNewWindow, 0);
  objc_storeStrong((id *)&self->_weatherLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_innerLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_viewportTopEqualToSafeAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_viewportTopEqualToStatusBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_statusBarSupplementaryView, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_screenshotService, 0);
  objc_storeStrong(&self->_usingOfflineDataModernMapToken, 0);
  objc_storeStrong((id *)&self->_modernMapTokens, 0);
  objc_storeStrong(&self->_carPlayModernMapToken, 0);
  objc_storeStrong((id *)&self->_loadingMapNetworkActivity, 0);
  objc_storeStrong((id *)&self->_logTileStateRecognizer, 0);
  objc_storeStrong((id *)&self->_overlayManager, 0);
  objc_storeStrong((id *)&self->_historicalLocations, 0);
  objc_storeStrong((id *)&self->_mapViewResponder, 0);

  objc_storeStrong((id *)&self->_environmentObserver, 0);
}

@end