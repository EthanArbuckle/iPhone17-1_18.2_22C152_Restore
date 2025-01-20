@interface CarChromeViewController
+ (BOOL)allowOneHandedZooming;
+ (Class)userLocationViewClass;
+ (id)localizedLocationAuthorizationMessage;
+ (id)localizedLocationAuthorizationTitle;
+ (void)_updateAllowOneHandedZooming;
+ (void)initialize;
- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey;
- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey;
- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey;
- (BOOL)_areAccessoriesHiddenForContext:(id)a3;
- (BOOL)_areAccessoriesHiddenForCurrentContext;
- (BOOL)_autohidingContentIsHiddenForContext:(id)a3;
- (BOOL)_canSelectAlternateRoutes;
- (BOOL)_hideStatusBanner;
- (BOOL)_isFocusMovementValidInContext:(id)a3;
- (BOOL)_nudgeHandlesPress:(id)a3;
- (BOOL)_shouldAccessoriesModifyMapInsetsForContext:(id)a3;
- (BOOL)_shouldAllowKnobFocusMovement;
- (BOOL)_shouldMapControlsModifyMapInsetsForContext:(id)a3;
- (BOOL)canShowCards;
- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)haveVehicleDirection;
- (BOOL)isAutohidingContentHiddenForContext:(id)a3;
- (BOOL)isAutohidingContentHiddenForCurrentContext;
- (BOOL)isDisplayingNavigation;
- (BOOL)isForcingAutohideBehavior;
- (BOOL)mapSettings:(id)a3 shouldApplyAnimated:(BOOL *)a4;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)removesMapViewWhenInactive;
- (BOOL)shouldAnimateMapTransition:(BOOL)a3;
- (BOOL)shouldRecenterAndZoom;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)shouldUseModernMap;
- (BOOL)suppressIdleFocus;
- (BOOL)wantsNavigationDisplayByDefault;
- (CarAccessoriesOverlay)accessoriesOverlay;
- (CarCardsOverlay)cardsOverlay;
- (CarChromeContext)topContext;
- (CarChromeViewController)initWithCarSceneType:(int64_t)a3;
- (CarFocusOrderEnvironment)environmentRepresentingAlternateRoutes;
- (CarFocusOrderEnvironment)environmentRepresentingMapControls;
- (CarFocusOrderEnvironment)environmentRepresentingOverlays;
- (CarFocusOrderItem)itemRepresentingAlternateRoutes;
- (CarFocusOrderItem)itemRepresentingMapControls;
- (CarFocusOrderItem)itemRepresentingOverlays;
- (CarFocusOrderItem)itemRepresentingStatusBanner;
- (CarMapControlsOverlay)mapControlsOverlay;
- (CarMapNudgerizer)nudgerizer;
- (CarRouteGeniusAnnotationsManager)routeGeniusAnnotationsManager;
- (CarRouteSelectionController)routeSelectionController;
- (CarStatusBannerOverlay)statusBannerOverlay;
- (ChromeMapSettings)defaultMapSettings;
- (ChromeMapSettings)transientMapSettings;
- (MapViewResponder)mapViewResponder;
- (MapsLightLevelController)lightLevelController;
- (NSArray)_linearFocusMovementSequences;
- (NSArray)preferredFocusEnvironments;
- (NSMapTable)chromeItemsByContext;
- (NSMapTable)lastFocusedIdentifiersByContext;
- (NSMapTable)lastFocusedItemsByContext;
- (UILayoutGuide)accessoriesCompactLayoutGuide;
- (UILayoutGuide)cardsLayoutGuide;
- (UILayoutGuide)notificationLayoutGuide;
- (UILayoutGuide)statusBannerLayoutGuide;
- (UITapGestureRecognizer)backButtonRecognizer;
- (double)mapInsetsUpdateAnimationDuration;
- (id)_desiredCards;
- (id)_presentSearchRefinementWithUserInfo:(id)a3 completionHandler:(id)a4;
- (id)_previousContext;
- (id)_userActionDetailsWithMapItem:(id)a3 resultIndex:(int)a4;
- (id)acquireForcedAutohideBehaviourTokenWithBehaviour:(int64_t)a3;
- (id)acquireModernMapTokenForReason:(unint64_t)a3;
- (id)allComponents;
- (id)chromeViewItemForContext:(id)a3 createIfNeeded:(BOOL)a4;
- (id)createMapReplacementView;
- (id)createMapView;
- (id)currentTraits;
- (id)doubleTapBlock;
- (id)mapReplacementColor;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (id)visuallySelectedItem;
- (int)_currentUsageTarget;
- (int64_t)_autohidingBehaviorForContext:(id)a3;
- (int64_t)forcedAutohideBehavior;
- (int64_t)modernMapProjectionType;
- (int64_t)modernMapTerrainMode;
- (int64_t)sceneType;
- (unint64_t)desiredRadarScreenshotTypes;
- (void)_addAutohideGestureRecognizer;
- (void)_autohideBecameIdle;
- (void)_autohideGestureRecognizerDetectedTap:(id)a3;
- (void)_captureUserActionBackToContext:(id)a3;
- (void)_carExternalDeviceStateUpdated:(id)a3;
- (void)_carOneHandedZoomSettingUpdated:(id)a3;
- (void)_carPlayWindowMapStyleDidChange:(id)a3;
- (void)_dismissAlertViewController:(id)a3 animated:(BOOL)a4;
- (void)_enableZoomGesture:(BOOL)a3;
- (void)_handleBackButton;
- (void)_handleBackButtonPressed:(id)a3;
- (void)_handleDoubleTap:(id)a3;
- (void)_humanPresenceDidChange;
- (void)_locationAuthorizationDidChange:(id)a3;
- (void)_navRecenterButtonPressed;
- (void)_navigationObscuredTimeoutFired:(id)a3;
- (void)_performMapUpdateToUserInterfaceStyle:(int64_t)a3 animation:(id)a4;
- (void)_presentAlertViewController:(id)a3 animated:(BOOL)a4;
- (void)_presentAnyPendingAlert:(BOOL)a3;
- (void)_preserveFocusedItemFromContext:(id)a3 toContext:(id)a4;
- (void)_recordAutohidingContentIsHidden:(BOOL)a3 forContext:(id)a4;
- (void)_reloadAccessoriesForContext:(id)a3 withAnimation:(id)a4;
- (void)_reloadAccessoriesInsetsForContext:(id)a3;
- (void)_reloadCardOverlayConstraintsIfNeeded;
- (void)_reloadCardsAnimated:(BOOL)a3;
- (void)_reloadFocusContainerGuidesForContext:(id)a3;
- (void)_reloadMapControlsForContext:(id)a3 withAnimation:(id)a4;
- (void)_reloadMapControlsInsetsForContext:(id)a3;
- (void)_reloadStatusBannerWithAnimation:(id)a3;
- (void)_removeAutohideGestureRecognizer;
- (void)_reportIncidentPressed;
- (void)_requestAutohideBehaviorForContext:(id)a3;
- (void)_resetMapViewDefaults:(id)a3;
- (void)_restartAutohideIdleTimer;
- (void)_restartNavigationObscuredTimeout;
- (void)_setAutohideBehavior:(int64_t)a3 forContext:(id)a4;
- (void)_startAutohideIdleTimerIfStopped;
- (void)_startNavigationObscuredTimeout;
- (void)_stopAutohideIdleTimer;
- (void)_stopNavigationObscuredTimeout;
- (void)_toggle3DButtonPressed;
- (void)_toggleCameraPressed;
- (void)_update3DButton;
- (void)_updateAudioControls;
- (void)_updateAutohideBehavior;
- (void)_updateCameraToggleButton;
- (void)_updateCardsForContext:(id)a3 withAnimation:(id)a4 completion:(id)a5;
- (void)_updateMapToCurrentUserInterfaceStyleAnimated:(BOOL)a3;
- (void)_updateMapUserInterfaceStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateModernMapCartographicConfiguration;
- (void)_updateNudgerizer;
- (void)_updateOfflineModernMapToken;
- (void)_updateRouteSelectionController;
- (void)captureUserAction:(int)a3;
- (void)captureUserAction:(int)a3 eventValue:(id)a4;
- (void)captureUserAction:(int)a3 mapItem:(id)a4;
- (void)captureUserAction:(int)a3 mapItem:(id)a4 atResultIndex:(int)a5;
- (void)captureUserAction:(int)a3 onTarget:(int)a4;
- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5;
- (void)captureUserAction:(int)a3 selectedRouteIndex:(int)a4;
- (void)captureUserActionChangedTrackingMode:(int64_t)a3;
- (void)captureUserActionPannedInDirection:(int64_t)a3;
- (void)captureUserActionSelectedSearchCategory:(id)a3 categoriesDisplayed:(id)a4;
- (void)carCardView:(id)a3 chevronButtonSelected:(id)a4;
- (void)carCardView:(id)a3 didChangeFocus:(BOOL)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)carMapControls:(id)a3 didTriggerAction:(unint64_t)a4;
- (void)carStatusBannerDidTapBanner;
- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4;
- (void)chromeNavigationDisplay:(id)a3 didChangePanning:(BOOL)a4 animated:(BOOL)a5;
- (void)chromeNavigationDisplayDidRenderRoute:(id)a3;
- (void)clearMapGesturesAndAnimations;
- (void)configureAccessoriesOverlay:(id)a3 forContext:(id)a4;
- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)deactivationReasonsDidChange;
- (void)dealloc;
- (void)decrementForToken:(id)a3;
- (void)didBecomeInactive:(BOOL)a3;
- (void)didSuppress;
- (void)didUnsuppress;
- (void)disableDoubleTapRecognizer;
- (void)dismissInterruption;
- (void)enableDoubleTapRecognizerWithBlock:(id)a3;
- (void)incrementForToken:(id)a3;
- (void)interruptAutohideForIncidentalInteraction;
- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4;
- (void)loadView;
- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4;
- (void)mapView:(id)a3 canZoomInDidChange:(BOOL)a4;
- (void)mapView:(id)a3 canZoomOutDidChange:(BOOL)a4;
- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didFailToLocateUserWithError:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3;
- (void)offlineStateChanged:(id)a3;
- (void)panButtonPressed;
- (void)prepareMapViewForFirstUse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reloadAccessoriesForContext:(id)a3 animated:(BOOL)a4;
- (void)reloadStatusBannerAnimated:(BOOL)a3;
- (void)restartAutohideIdleTimerIfStarted;
- (void)setAccessoriesCompactLayoutGuide:(id)a3;
- (void)setAccessoriesOverlay:(id)a3;
- (void)setAutohidingContentHiddenForCurrentContext:(BOOL)a3;
- (void)setBackButtonRecognizer:(id)a3;
- (void)setCardsLayoutGuide:(id)a3;
- (void)setCardsOverlay:(id)a3;
- (void)setChromeItemsByContext:(id)a3;
- (void)setDefaultMapSettings:(id)a3;
- (void)setDoubleTapBlock:(id)a3;
- (void)setHardwareBackButtonBehavior:(int64_t)a3 forContext:(id)a4;
- (void)setHaveVehicleDirection:(BOOL)a3;
- (void)setLastFocusedIdentifiersByContext:(id)a3;
- (void)setLastFocusedItemsByContext:(id)a3;
- (void)setLightLevelController:(id)a3;
- (void)setMapControlsOverlay:(id)a3;
- (void)setMapViewResponder:(id)a3;
- (void)setNeedsAutohideBehaviorUpdateForContext:(id)a3;
- (void)setNeedsFocusUpdateIfUnfocused;
- (void)setNotificationLayoutGuide:(id)a3;
- (void)setNudgerizer:(id)a3;
- (void)setOwnsFocus:(BOOL)a3;
- (void)setRouteGeniusAnnotationsManager:(id)a3;
- (void)setRouteSelectionController:(id)a3;
- (void)setStatusBannerLayoutGuide:(id)a3;
- (void)setStatusBannerOverlay:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCardsForContext:(id)a3 animated:(BOOL)a4;
- (void)updateCardsForContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5;
- (void)updateHardwareBackButtonBehavior;
- (void)updateZoomControls;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willUpdateComponents:(id)a3 withAnimation:(id)a4;
- (void)zoomIn;
- (void)zoomInButtonPressed;
- (void)zoomOut;
- (void)zoomOutButtonPressed;
@end

@implementation CarChromeViewController

+ (void)initialize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CarChromeViewController;
  [super initialize];
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 registerDefaults:&off_1013AE998];
  }
}

+ (id)localizedLocationAuthorizationTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"%@ not available [CarPlay]" value:@"localized string not found" table:0];

  objc_super v4 = +[NSBundle mainBundle];
  v5 = [v4 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
}

+ (id)localizedLocationAuthorizationMessage
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"CFBundleDisplayName"];

  objc_super v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"To use %@ in CarPlay, allow %@ to use your location on your iPhone. [CarPlay]", @"localized string not found", 0 value table];

  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3, v3);

  return v6;
}

- (void)dealloc
{
  v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%p] Deallocating", buf, 0xCu);
  }

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v5 = dispatch_queue_get_label(0);
  if (label != v5 && (!label || !v5 || strcmp(label, v5)))
  {
    v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v11 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      v16 = (CarChromeViewController *)"-[CarChromeViewController dealloc]";
      __int16 v17 = 2080;
      v18 = "CarChromeViewController.m";
      __int16 v19 = 1024;
      int v20 = 290;
      __int16 v21 = 2080;
      v22 = "dispatch_get_main_queue()";
      __int16 v23 = 2080;
      v24 = v10;
      __int16 v25 = 2080;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);
    }
    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7 = +[CarDisplayController sharedInstance];
  v8 = [v7 routeGeniusManager];
  [v8 deactivateForChrome:self];

  v14.receiver = self;
  v14.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v14 dealloc];
}

- (CarChromeViewController)initWithCarSceneType:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      int v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v25 = "-[CarChromeViewController initWithCarSceneType:]";
        __int16 v26 = 2080;
        v27 = "CarChromeViewController.m";
        __int16 v28 = 1024;
        int v29 = 298;
        __int16 v30 = 2080;
        v31 = "dispatch_get_main_queue()";
        __int16 v32 = 2080;
        v33 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v34 = 2080;
        v35 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v21 = sub_1005762E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v25 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)CarChromeViewController;
  v8 = [(ChromeViewController *)&v23 init];
  if (v8)
  {
    v9 = sub_100015DB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 > 7) {
        CFStringRef v10 = @".Unknown";
      }
      else {
        CFStringRef v10 = off_1012E6BF0[a3];
      }
      *(_DWORD *)buf = 134349314;
      __int16 v25 = (const char *)v8;
      __int16 v26 = 2114;
      v27 = (const char *)v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] initialising with sceneType: %{public}@", buf, 0x16u);
    }

    v8->_sceneType = a3;
    v11 = [[MapsTokenStorage alloc] initWithDelegate:v8 tokenGroupName:@"CarForcedAutohideBehaviorTokenGroup" callbackQueue:&_dispatch_main_q];
    forcedAutohideTokens = v8->_forcedAutohideTokens;
    v8->_forcedAutohideTokens = v11;

    v13 = [[MapsTokenStorage alloc] initWithDelegate:v8 tokenGroupName:@"CarChromeModernMap" callbackQueue:&_dispatch_main_q];
    modernMapTokens = v8->_modernMapTokens;
    v8->_modernMapTokens = v13;

    v8->_mapViewRegionIsChanging = 0;
    v8->_ownsFocus = 1;
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v8 selector:"_carExternalDeviceStateUpdated:" name:@"MapsExternalDeviceUpdated" object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v8 selector:"_carOneHandedZoomSettingUpdated:" name:@"CarPlayOneHandedZoomingSettingDidChangeNotification" object:0];

    __int16 v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v8 selector:"_carPlayWindowMapStyleDidChange:" name:CRSUIWindowMapStyleChangedNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v8 selector:"offlineStateChanged:" name:GEOOfflineStateChangedNotification object:0];
  }
  return v8;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v11 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    BOOL v7 = [MapsLightLevelController alloc];
    v8 = [v6 windowScene];
    v9 = [(MapsLightLevelController *)v7 initWithWindowScene:v8];
    lightLevelController = self->_lightLevelController;
    self->_lightLevelController = v9;

    [(MapsLightLevelController *)self->_lightLevelController addObserver:self];
    if ((id)[(CarChromeViewController *)self sceneType] == (id)7)
    {
      [(ChromeViewController *)self setNeedsUpdateComponent:@"cards" animated:0];
      [(ChromeViewController *)self setNeedsUpdateComponent:@"accessories" animated:0];
      [(ChromeViewController *)self updateComponentsIfNeeded];
    }
  }
}

- (id)currentTraits
{
  v3 = [(ChromeViewController *)self mapView];

  if (v3)
  {
    BOOL v4 = +[MKMapService sharedService];
    v5 = [(ChromeViewController *)self mapView];
    id v6 = [(ChromeViewController *)self mapViewEnteredForegroundDate];
    BOOL v7 = [(ChromeViewController *)self lastMapViewportChangedDate];
    v8 = [v4 mapsDefaultTraitsForMapView:v5 mapViewEnteredForegroundDate:v6 mapViewportChangedDate:v7 directionsType:1 includeCarPlayInfo:1];

    v9 = [[ClientTypeResolver alloc] initWithCurrentLocation:1 parkedCar:0 personalizedItems:1];
    +[GEOMapServiceTraits addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:v9 toTraits:v8];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)didSuppress
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:MKLocationManagerApprovalDidChangeNotification object:0];
  BOOL v4 = sub_100577E34();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] is suppressing. Will deactivate RG for chrome.", buf, 0xCu);
  }

  v5 = +[CarDisplayController sharedInstance];
  id v6 = [v5 routeGeniusManager];
  [v6 deactivateForChrome:self];

  BOOL v7 = [(ChromeViewController *)self navigationDisplay];
  [v7 setSuppressed:1];

  [(CarChromeViewController *)self disableDoubleTapRecognizer];
  v8 = [(CarChromeViewController *)self nudgerizer];
  [v8 setActive:0];

  v9 = [(CarChromeViewController *)self cardsOverlay];
  [v9 reset];

  notificationLayoutGuide = self->_notificationLayoutGuide;
  self->_notificationLayoutGuide = 0;

  currentAlertViewController = self->_currentAlertViewController;
  if (currentAlertViewController)
  {
    v12 = [(CarAlertViewController *)currentAlertViewController presentingViewController];

    if (v12 == self) {
      [(CarChromeViewController *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v13 didSuppress];
}

- (void)didUnsuppress
{
  v15.receiver = self;
  v15.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v15 didUnsuppress];
  v3 = [(CarChromeViewController *)self topContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    BOOL v4 = [(CarChromeViewController *)self topContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v6 = sub_100577E34();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    __int16 v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] is unsuppressing. Will try to activate RG for chrome.", buf, 0xCu);
  }

  BOOL v7 = +[CarDisplayController sharedInstance];
  v8 = [v7 routeGeniusManager];
  [v8 activateIfPossibleForChrome:self];

LABEL_7:
  [(ChromeViewController *)self setNeedsUpdateComponent:@"mapcontrols" animated:0];
  [(ChromeViewController *)self setNeedsUpdateComponent:@"accessories" animated:0];
  [(ChromeViewController *)self setNeedsUpdateComponent:@"statusBanner" animated:0];
  v9 = +[MKLocationManager sharedLocationManager];
  unsigned int v10 = [v9 isLocationServicesAuthorizationNeeded];

  if (v10)
  {
    objc_super v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_locationAuthorizationDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];
  }
  v12 = [(CarChromeViewController *)self topContext];
  [(CarChromeViewController *)self updateCardsForContext:v12 animated:0 completion:0];

  [(ChromeViewController *)self setNeedsUpdateComponent:@"navigationDisplay" animated:0];
  currentAlertViewController = self->_currentAlertViewController;
  if (currentAlertViewController)
  {
    objc_super v14 = [(CarAlertViewController *)currentAlertViewController presentingViewController];

    if (v14 != self) {
      [(CarChromeViewController *)self presentViewController:self->_currentAlertViewController animated:0 completion:0];
    }
  }
  [(CarChromeViewController *)self _updateNudgerizer];
  [(CarChromeViewController *)self _updateRouteSelectionController];
  [(ChromeViewController *)self updateMapViewFrameRate];
}

- (void)deactivationReasonsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v6 deactivationReasonsDidChange];
  v3 = [(ChromeViewController *)self currentMapReplacementView];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      v5 = [(ChromeViewController *)self deactivationReasons];
      [v4 setReasonStrings:v5];
    }
  }
}

- (void)didBecomeInactive:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CarChromeViewController;
  -[ChromeViewController didBecomeInactive:](&v13, "didBecomeInactive:");
  if (!a3)
  {
    v5 = [(ChromeViewController *)self navigationDisplay];
    [v5 setTemporaryDisplayRate:-1 forDuration:-1.0];

    objc_super v6 = sub_100082DFC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      [(MapsLightLevelController *)self->_lightLevelController reloadForChangedLightLevelTrackers];
      return;
    }
    BOOL v7 = self;
    if (!v7)
    {
      v12 = @"<nil>";
      goto LABEL_11;
    }
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v10 = [(CarChromeViewController *)v7 performSelector:"accessibilityIdentifier"];
      objc_super v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    objc_super v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Force updating light level as the map view is no longer inactive", buf, 0xCu);

    goto LABEL_12;
  }
}

- (BOOL)removesMapViewWhenInactive
{
  return GEOConfigGetBOOL();
}

- (id)createMapView
{
  int64_t v3 = [(CarChromeViewController *)self sceneType];
  if ((unint64_t)(v3 - 1) > 6) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_100F6EFB8[v3 - 1];
  }
  id v5 = objc_alloc((Class)MKMapView);
  objc_super v6 = [(CarChromeViewController *)self view];
  [v6 bounds];
  id v7 = [v5 _initWithFrame:0 gestureRecognizerHostView:0 showsAttribution:0 showsAppleLogo:1 allowsAntialiasing:1 carDisplayType:v4];

  return v7;
}

- (id)createMapReplacementView
{
  if (([(CarChromeViewController *)self sceneType] & 0xFFFFFFFFFFFFFFFCLL) == 4) {
    goto LABEL_6;
  }
  int64_t v3 = +[MapsExternalDevice sharedInstance];
  if (([v3 ownsScreen] & 1) == 0)
  {

    goto LABEL_6;
  }
  int BOOL = GEOConfigGetBOOL();

  if (BOOL)
  {
LABEL_6:
    objc_super v6 = [CarMapReplacementView alloc];
    id v7 = [(CarChromeViewController *)self view];
    [v7 bounds];
    id v5 = -[CarMapReplacementView initWithFrame:](v6, "initWithFrame:");

    [(CarMapReplacementView *)v5 setUserInteractionEnabled:0];
    v8 = [(ChromeViewController *)self deactivationReasons];
    [(CarMapReplacementView *)v5 setReasonStrings:v8];

    if (+[CarDisplayController debugLaunchPerformance])
    {
      v9 = +[UIColor systemDarkBlueColor];
      [(CarMapReplacementView *)v5 setBackgroundColor:v9];

      +[UIColor systemCyanColor];
    }
    else
    {
      unsigned int v10 = [(CarChromeViewController *)self mapReplacementColor];
      [(CarMapReplacementView *)v5 setBackgroundColor:v10];

      +[UIColor colorWithDynamicProvider:&stru_1012E6890];
    objc_super v11 = };
    [(CarMapReplacementView *)v5 setTextColor:v11];

    v12 = (objc_class *)objc_opt_class();
    objc_super v13 = NSStringFromClass(v12);
    objc_super v14 = +[NSString stringWithFormat:@"%@.mapReplacementView", v13];
    [(CarMapReplacementView *)v5 setAccessibilityIdentifier:v14];

    goto LABEL_10;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (CarRouteGeniusAnnotationsManager)routeGeniusAnnotationsManager
{
  routeGeniusAnnotationsManager = self->_routeGeniusAnnotationsManager;
  if (!routeGeniusAnnotationsManager)
  {
    uint64_t v4 = [[CarRouteGeniusAnnotationsManager alloc] initWithChromeViewController:self];
    id v5 = self->_routeGeniusAnnotationsManager;
    self->_routeGeniusAnnotationsManager = v4;

    routeGeniusAnnotationsManager = self->_routeGeniusAnnotationsManager;
  }

  return routeGeniusAnnotationsManager;
}

- (CarMapNudgerizer)nudgerizer
{
  nudgerizer = self->_nudgerizer;
  if (!nudgerizer)
  {
    uint64_t v4 = objc_alloc_init(CarMapNudgerizer);
    id v5 = self->_nudgerizer;
    self->_nudgerizer = v4;

    objc_super v6 = [(ChromeViewController *)self mapView];
    [(CarMapNudgerizer *)self->_nudgerizer setMapView:v6];

    nudgerizer = self->_nudgerizer;
  }

  return nudgerizer;
}

- (MapViewResponder)mapViewResponder
{
  mapViewResponder = self->_mapViewResponder;
  if (!mapViewResponder)
  {
    uint64_t v4 = [MapViewResponder alloc];
    id v5 = [(ChromeViewController *)self mapView];
    objc_super v6 = [(MapViewResponder *)v4 initWithMapView:v5];
    id v7 = self->_mapViewResponder;
    self->_mapViewResponder = v6;

    mapViewResponder = self->_mapViewResponder;
  }

  return mapViewResponder;
}

- (CarRouteSelectionController)routeSelectionController
{
  routeSelectionController = self->_routeSelectionController;
  if (!routeSelectionController)
  {
    uint64_t v4 = +[CarDisplayController sharedInstance];
    id v5 = [v4 platformController];

    objc_super v6 = [[CarRouteSelectionController alloc] initWithPlatformController:v5 chromeViewController:self];
    id v7 = self->_routeSelectionController;
    self->_routeSelectionController = v6;

    v8 = [(ChromeViewController *)self mapView];
    [(CarRouteSelectionController *)self->_routeSelectionController setMapView:v8];

    routeSelectionController = self->_routeSelectionController;
  }

  return routeSelectionController;
}

- (ChromeMapSettings)defaultMapSettings
{
  defaultMapSettings = self->_defaultMapSettings;
  if (!defaultMapSettings)
  {
    uint64_t v4 = [[ChromeMapSettings alloc] initWithType:1 userInterfaceIdiom:3];
    id v5 = self->_defaultMapSettings;
    self->_defaultMapSettings = v4;

    [(ChromeMapSettings *)self->_defaultMapSettings setDelegate:self];
    objc_super v6 = [(ChromeViewController *)self mapView];
    [(ChromeMapSettings *)self->_defaultMapSettings setMapView:v6];

    defaultMapSettings = self->_defaultMapSettings;
  }

  return defaultMapSettings;
}

- (ChromeMapSettings)transientMapSettings
{
  int64_t v3 = [[ChromeMapSettings alloc] initWithType:0 userInterfaceIdiom:3];
  [(ChromeMapSettings *)v3 setDelegate:self];
  uint64_t v4 = [(ChromeViewController *)self mapView];
  [(ChromeMapSettings *)v3 setMapView:v4];

  return v3;
}

- (void)loadView
{
  int64_t v3 = -[CarChromeContainingView initWithFrame:]([CarChromeContainingView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarChromeViewController *)self setView:v3];

  id v5 = +[UIColor systemBackgroundColor];
  uint64_t v4 = [(CarChromeViewController *)self view];
  [v4 setBackgroundColor:v5];
}

- (id)mapReplacementColor
{
  return +[UIColor colorWithDynamicProvider:&stru_1012E68B0];
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v49 viewDidLoad];
  int64_t v3 = [(CarChromeViewController *)self view];
  [v3 setTintAdjustmentMode:1];

  uint64_t v4 = [(CarChromeViewController *)self backButtonRecognizer];

  if (!v4)
  {
    id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleBackButtonPressed:"];
    [(CarChromeViewController *)self setBackButtonRecognizer:v5];

    objc_super v6 = [(CarChromeViewController *)self backButtonRecognizer];
    [v6 setAllowedPressTypes:&off_1013AD470];

    id v7 = [(CarChromeViewController *)self backButtonRecognizer];
    [v7 setDelegate:self];

    v8 = [(CarChromeViewController *)self backButtonRecognizer];
    [v8 setEnabled:0];
  }
  v9 = [(CarChromeViewController *)self view];
  unsigned int v10 = [(CarChromeViewController *)self backButtonRecognizer];
  [v9 addGestureRecognizer:v10];

  objc_super v11 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  cardsLayoutGuide = self->_cardsLayoutGuide;
  self->_cardsLayoutGuide = v11;

  objc_super v13 = (objc_class *)objc_opt_class();
  objc_super v14 = NSStringFromClass(v13);
  objc_super v15 = +[NSString stringWithFormat:@"%@.cardsLayoutGuide", v14];
  [(UILayoutGuide *)self->_cardsLayoutGuide setIdentifier:v15];

  v16 = [(CarChromeViewController *)self view];
  [v16 addLayoutGuide:self->_cardsLayoutGuide];

  __int16 v17 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  statusBannerLayoutGuide = self->_statusBannerLayoutGuide;
  self->_statusBannerLayoutGuide = v17;

  __int16 v19 = (objc_class *)objc_opt_class();
  int v20 = NSStringFromClass(v19);
  __int16 v21 = +[NSString stringWithFormat:@"%@.statusBannerLayoutGuide", v20];
  [(UILayoutGuide *)self->_statusBannerLayoutGuide setIdentifier:v21];

  v22 = [(CarChromeViewController *)self view];
  [v22 addLayoutGuide:self->_statusBannerLayoutGuide];

  objc_super v23 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  accessoriesCompactLayoutGuide = self->_accessoriesCompactLayoutGuide;
  self->_accessoriesCompactLayoutGuide = v23;

  __int16 v25 = (objc_class *)objc_opt_class();
  __int16 v26 = NSStringFromClass(v25);
  v27 = +[NSString stringWithFormat:@"%@.accessoriesDashboardLayoutGuide", v26];
  [(UILayoutGuide *)self->_accessoriesCompactLayoutGuide setIdentifier:v27];

  __int16 v28 = [(CarChromeViewController *)self view];
  [v28 addLayoutGuide:self->_accessoriesCompactLayoutGuide];

  int v29 = [[CarCardsOverlay alloc] initWithCarSceneType:[(CarChromeViewController *)self sceneType]];
  [(CarCardsOverlay *)v29 setCardDelegate:self];
  __int16 v30 = [(ChromeViewController *)self overlayController];
  [v30 addOverlay:v29 inLayoutGuide:self->_cardsLayoutGuide];

  [(CarChromeViewController *)self setCardsOverlay:v29];
  v31 = [[CarStatusBannerOverlay alloc] initWithChromeViewController:self];
  [(CarStatusBannerOverlay *)v31 setDelegate:self];
  __int16 v32 = [(ChromeViewController *)self overlayController];
  [v32 addOverlay:v31 inLayoutGuide:self->_statusBannerLayoutGuide];

  [(CarChromeViewController *)self setStatusBannerOverlay:v31];
  v33 = [[CarAccessoriesOverlay alloc] initWithCarSceneType:self->_sceneType];
  if ((id)[(CarChromeViewController *)self sceneType] == (id)7 && GEOConfigGetBOOL())
  {
    [(CarAccessoriesOverlay *)v33 setIgnoresCollisionConstraints:1];
    __int16 v34 = [(ChromeViewController *)self overlayController];
    v35 = [(ChromeViewController *)self viewportLayoutGuide];
    [v34 addOverlay:v33 inLayoutGuide:v35];
  }
  else
  {
    int64_t v36 = [(CarChromeViewController *)self sceneType];
    if (((unint64_t)(v36 - 4) < 4 || v36 == 1)
      && (unint64_t)[(CarChromeViewController *)self sceneType] < 4)
    {
      __int16 v34 = [(ChromeViewController *)self overlayController];
      [v34 addOverlay:v33];
    }
    else
    {
      __int16 v34 = [(ChromeViewController *)self overlayController];
      [v34 addOverlay:v33 inLayoutGuide:self->_accessoriesCompactLayoutGuide];
    }
  }

  [(CarChromeViewController *)self setAccessoriesOverlay:v33];
  if ((unint64_t)[(CarChromeViewController *)self sceneType] <= 3)
  {
    v37 = objc_alloc_init(CarMapControlsOverlay);
    [(CarMapControlsOverlay *)v37 setDelegate:self];
    v38 = [(ChromeViewController *)self overlayController];
    [v38 addOverlay:v37];

    [(CarChromeViewController *)self setMapControlsOverlay:v37];
  }
  v39 = [(ChromeViewController *)self mapInsetsLayoutGuide];
  v40 = [v39 topAnchor];
  v41 = [(CarChromeViewController *)self view];
  v42 = [v41 topAnchor];
  v43 = [v40 constraintGreaterThanOrEqualToAnchor:v42 constant:0.0];
  headingUpMapInsetAdjustmentConstraint = self->_headingUpMapInsetAdjustmentConstraint;
  self->_headingUpMapInsetAdjustmentConstraint = v43;

  v45 = [CarFocusContainerGuideController alloc];
  v46 = [(CarChromeViewController *)self view];
  v47 = [(CarFocusContainerGuideController *)v45 initWithHostView:v46];
  focusContainerGuideController = self->_focusContainerGuideController;
  self->_focusContainerGuideController = v47;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v5 viewWillAppear:a3];
  self->_isCurrentlyVisible = 1;
  [(CarChromeViewController *)self _updateMapToCurrentUserInterfaceStyleAnimated:0];
  [(CarChromeViewController *)self _updateAutohideBehavior];
  id visibilityDeactivationToken = self->_visibilityDeactivationToken;
  self->_id visibilityDeactivationToken = 0;

  [(CarChromeViewController *)self interruptAutohideForIncidentalInteraction];
  [(CarChromeViewController *)self setNeedsFocusUpdate];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = +[GEOOfflineService shared];
  objc_super v5 = [(ChromeViewController *)self mapView];
  [v4 registerMapView:v5 withPriority:-[CarChromeViewController sceneType](self, "sceneType")];

  [(CarChromeViewController *)self _updateAutohideBehavior];
  [(CarChromeViewController *)self interruptAutohideForIncidentalInteraction];
  [(ChromeViewController *)self updateMapViewFrameRate];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v4 viewWillDisappear:a3];
  [(CarChromeViewController *)self _updateAutohideBehavior];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v6 viewDidDisappear:a3];
  self->_isCurrentlyVisible = 0;
  objc_super v4 = [(ChromeViewController *)self acquireChromeDeactivationTokenForReason:@"view controller no longer in hierarchy"];
  id visibilityDeactivationToken = self->_visibilityDeactivationToken;
  self->_id visibilityDeactivationToken = v4;

  [(CarChromeViewController *)self _updateAutohideBehavior];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v7 viewDidLayoutSubviews];
  int64_t v3 = [(ChromeViewController *)self overlayController];

  if (v3)
  {
    objc_super v4 = [(CarChromeViewController *)self view];
    objc_super v5 = [(ChromeViewController *)self overlayController];
    objc_super v6 = [v5 overlayContentView];
    [v4 bringSubviewToFront:v6];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(ChromeViewController *)self setNeedsUpdateMapInsets];
}

- (BOOL)_shouldAccessoriesModifyMapInsetsForContext:(id)a3
{
  id v3 = a3;
  if GEOConfigGetBOOL() && (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 shouldAccessoriesModifyMapInsets];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldMapControlsModifyMapInsetsForContext:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 shouldMapControlsModifyMapInsets];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setNotificationLayoutGuide:(id)a3
{
  objc_super v5 = (UILayoutGuide *)a3;
  if (!v5) {
    goto LABEL_5;
  }
  objc_super v6 = [(ChromeViewController *)self mapInsetsLayoutGuide];
  if (!v6 || [(ChromeViewController *)self isSuppressed])
  {

LABEL_5:
    notificationLayoutGuide = self->_notificationLayoutGuide;
    self->_notificationLayoutGuide = 0;

    goto LABEL_6;
  }
  unsigned __int8 v8 = [(CarChromeViewController *)self isViewLoaded];

  if ((v8 & 1) == 0) {
    goto LABEL_5;
  }
  if (self->_notificationLayoutGuide != v5)
  {
    objc_storeStrong((id *)&self->_notificationLayoutGuide, a3);
    v9 = [(UILayoutGuide *)self->_notificationLayoutGuide topAnchor];
    unsigned int v10 = [(ChromeViewController *)self mapInsetsLayoutGuide];
    objc_super v11 = [v10 bottomAnchor];
    v12 = [v9 constraintGreaterThanOrEqualToAnchor:v11];
    objc_super v14 = v12;
    objc_super v13 = +[NSArray arrayWithObjects:&v14 count:1];
    +[NSLayoutConstraint activateConstraints:v13];
  }
  [(ChromeViewController *)self setNeedsUpdateMapInsets];
LABEL_6:
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        objc_super v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v8 containsObject:v15] & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v15 setChromeViewController:self];
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  v17.receiver = self;
  v17.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v17 contextStackWillUpdateFrom:v8 to:v9 withAnimation:v10];
  v16 = [(ChromeViewController *)self mapView];
  [(CarChromeViewController *)self _resetMapViewDefaults:v16];
}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CarChromeViewController;
  id v10 = a5;
  [(ChromeViewController *)&v27 contextStackDidUpdateFrom:v8 to:v9 withAnimation:v10];
  unsigned __int8 v11 = [v10 isAnimated];
  id v12 = [v8 lastObject];
  uint64_t v13 = [v9 lastObject];
  [(CarChromeViewController *)self _reloadMapControlsForContext:v13 withAnimation:v10];
  [(CarChromeViewController *)self _reloadAccessoriesForContext:v13 withAnimation:v10];
  [(CarChromeViewController *)self _reloadStatusBannerWithAnimation:v10];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10037F828;
  v20[3] = &unk_1012E6900;
  id v21 = v8;
  id v22 = v9;
  objc_super v23 = self;
  id v24 = v12;
  id v25 = v13;
  unsigned __int8 v26 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10037FE0C;
  v18[3] = &unk_1012E6160;
  v18[4] = self;
  id v19 = v25;
  id v14 = v25;
  id v15 = v12;
  id v16 = v9;
  id v17 = v8;
  [v10 addPreparation:v20 animations:&stru_1012E6920 completion:v18];
}

- (CarChromeContext)topContext
{
  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  v2 = [(ChromeViewController *)&v4 topContext];

  return (CarChromeContext *)v2;
}

- (NSMapTable)chromeItemsByContext
{
  chromeItemsByContext = self->_chromeItemsByContext;
  if (!chromeItemsByContext)
  {
    objc_super v4 = +[NSMapTable weakToStrongObjectsMapTable];
    objc_super v5 = self->_chromeItemsByContext;
    self->_chromeItemsByContext = v4;

    chromeItemsByContext = self->_chromeItemsByContext;
  }

  return chromeItemsByContext;
}

- (id)chromeViewItemForContext:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    objc_super v7 = [(CarChromeViewController *)self chromeItemsByContext];
    id v8 = [v7 objectForKey:v6];

    if (!v8 && v4)
    {
      id v8 = +[CarChromeViewItem itemWithContext:v6];
      id v9 = [(CarChromeViewController *)self chromeItemsByContext];
      [v9 setObject:v8 forKey:v6];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_carExternalDeviceStateUpdated:(id)a3
{
  BOOL v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Notified car external accessory updated", v8, 2u);
  }

  objc_super v5 = +[MapsExternalDevice sharedInstance];
  uint64_t v6 = [v5 hasLimitedUI] ^ 1;

  objc_super v7 = [(ChromeViewController *)self mapView];
  [v7 setVehicleState:v6];
}

- (void)dismissInterruption
{
}

- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3
{
  int64_t v5 = [(CarAlertViewController *)self->_currentAlertViewController tag];
  if (v5 == a3) {
    [(CarChromeViewController *)self dismissInterruption];
  }
  return v5 == a3;
}

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v93 = a4;
  id v92 = a5;
  v94 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v94 canPresentInterruptionOfKind:a3])
  {
    id v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v108 = (id)objc_opt_class();
      __int16 v109 = 2048;
      int64_t v110 = a3;
      __int16 v111 = 2112;
      id v112 = v93;
      id v9 = v108;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will ask top context %@ to present interruption (kind:%ld, userInfo:%@)", buf, 0x20u);
    }
    uint64_t v10 = [v94 presentInterruptionOfKind:a3 userInfo:v93 completionHandler:v92];
    goto LABEL_8;
  }
  if (a3 == 4)
  {
    uint64_t v10 = [(CarChromeViewController *)self _presentSearchRefinementWithUserInfo:v93 completionHandler:v92];
LABEL_8:
    id v11 = (id)v10;
    goto LABEL_42;
  }
  id v91 = [v93 objectForKeyedSubscript:@"kMapsInterruptionActions"];
  id v12 = self->_currentAlertViewController;
  if ([(CarAlertViewController *)v12 tag] == a3)
  {
    [(CarAlertViewController *)v12 supersede];
    [(CarAlertViewController *)v12 reset];
  }
  else
  {
    a5 = objc_alloc_init(CarAlertViewController);

    [a5 setTag:a3];
    id v12 = (CarAlertViewController *)a5;
  }
  id v11 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v13 = [v93 objectForKeyedSubscript:@"kMapsInterruptionTitle"];
      if (v13)
      {
        [(CarAlertViewController *)v12 setAlertTitle:v13];
      }
      else
      {
        v77 = +[NSBundle mainBundle];
        v78 = [v77 localizedStringForKey:@"Maps Safety Warning Title" value:@"localized string not found" table:0];
        [(CarAlertViewController *)v12 setAlertTitle:v78];
      }
      a5 = [v93 objectForKeyedSubscript:@"kMapsInterruptionMessage"];
      if (a5) {
        goto LABEL_23;
      }
      v79 = +[NSBundle mainBundle];
      v80 = [v79 localizedStringForKey:@"Maps Safety Warning Message" value:@"localized string not found" table:0];
      [(CarAlertViewController *)v12 setAlertMessage:v80];

      goto LABEL_24;
    case 2:
    case 3:
    case 6:
    case 8:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 23:
      v33 = [v93 objectForKeyedSubscript:@"kMapsInterruptionTitle"];
      [(CarAlertViewController *)v12 setAlertTitle:v33];

      __int16 v32 = [v93 objectForKeyedSubscript:@"kMapsInterruptionMessage"];
      goto LABEL_22;
    case 5:
      id v14 = +[CarChromeViewController localizedLocationAuthorizationTitle];
      [(CarAlertViewController *)v12 setAlertTitle:v14];

      a5 = +[CarChromeViewController localizedLocationAuthorizationMessage];
      [(CarAlertViewController *)v12 setAlertMessage:a5];

      goto LABEL_30;
    case 7:
      id v15 = sub_100015DB4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "CarChromeViewController: ask for kMapsInterruptionMaybeEndNavigation", buf, 2u);
      }

      id v16 = +[NSBundle mainBundle];
      id v17 = [v16 localizedStringForKey:@"Route in Progress [CarPlay]" value:@"localized string not found" table:0];
      [(CarAlertViewController *)v12 setAlertTitle:v17];

      long long v18 = +[NSBundle mainBundle];
      id v19 = [v18 localizedStringForKey:@"Are you sure you want to end navigation? [CarPlay]" value:@"localized string not found" table:0];
      [(CarAlertViewController *)v12 setAlertMessage:v19];

      long long v20 = +[NSBundle mainBundle];
      v88 = [v20 localizedStringForKey:@"Resume Navigation Cancel [CarPlay]" value:@"localized string not found" table:0];
      v85 = +[MapsInterruptionAction actionWithTitle:v88 cancels:1 handler:0];
      v106[0] = v85;
      id v21 = +[NSBundle mainBundle];
      id v22 = [v21 localizedStringForKey:@"End Navigation [CarPlay]" value:@"localized string not found" table:0];
      objc_super v23 = +[MapsInterruptionAction actionWithTitle:v22 cancels:0 handler:0];
      v106[1] = v23;
      a5 = +[NSArray arrayWithObjects:v106 count:2];

      goto LABEL_49;
    case 9:
      id v24 = +[NSBundle mainBundle];
      id v25 = [v24 localizedStringForKey:@"Show navigable driving directions title [CarPlay]" value:@"localized string not found" table:0];
      [(CarAlertViewController *)v12 setAlertTitle:v25];

      unsigned __int8 v26 = +[NSBundle mainBundle];
      objc_super v27 = [v26 localizedStringForKey:@"Show navigable driving directions message [CarPlay]" value:@"localized string not found" table:0];
      [(CarAlertViewController *)v12 setAlertMessage:v27];

      __int16 v28 = +[NSBundle mainBundle];
      a5 = [v28 localizedStringForKey:@"Show navigable driving directions button [CarPlay]" value:@"localized string not found" table:0];
      int v29 = +[MapsInterruptionAction actionWithTitle:a5 cancels:0 handler:0];
      v105 = v29;
      __int16 v30 = +[NSArray arrayWithObjects:&v105 count:1];

      goto LABEL_47;
    case 10:
      goto LABEL_41;
    case 11:
      v31 = CarDisplayDirectionsNotAvailableErrorTitle();
      [(CarAlertViewController *)v12 setAlertTitle:v31];

      __int16 v32 = CarDisplayTurnByTurnNotAvailableAdvisory();
LABEL_22:
      a5 = v32;
LABEL_23:
      [(CarAlertViewController *)v12 setAlertMessage:a5];
LABEL_24:

      goto LABEL_25;
    case 14:
      v84 = [v93 objectForKeyedSubscript:@"kMapsInterruptionSharedTripSenderName"];
      v86 = [v93 objectForKeyedSubscript:@"kMapsInterruptionSharedTripSenderHandle"];
      objc_super v49 = +[NSBundle mainBundle];
      v50 = [v49 localizedStringForKey:@"Maps always shares as [name] [email/phone] [CarPlay]" value:@"localized string not found" table:0];
      v83 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v84, v86);

      id v51 = objc_alloc((Class)NSMutableAttributedString);
      v52 = +[CarAlertViewController defaultMessageAttributes];
      id v89 = [v51 initWithString:v83 attributes:v52];

      v53 = +[UIColor secondaryLabelColor];
      v54 = [v89 string];
      id v55 = [v54 rangeOfString:v86];
      [v89 addAttribute:NSForegroundColorAttributeName value:v53 range:v55];

      v57 = +[NSBundle mainBundle];
      v58 = [v57 localizedStringForKey:@"Share ETA [CarPlay, Sender Info Title]", @"localized string not found", 0 value table];
      [(CarAlertViewController *)v12 setAlertTitle:v58];

      [(CarAlertViewController *)v12 setAlertAttributedMessage:v89];
      v82 = +[NSBundle mainBundle];
      v81 = [v82 localizedStringForKey:@"Cancel [CarPlay, Share ETA Alert]", @"localized string not found", 0 value table];
      v59 = +[MapsInterruptionAction actionWithTitle:v81 cancels:1 handler:0];
      v104[0] = v59;
      v60 = +[NSBundle mainBundle];
      a5 = [v60 localizedStringForKey:@"Share [CarPlay, Share ETA Alert]", @"localized string not found", 0 value table];
      v61 = +[MapsInterruptionAction actionWithTitle:a5 cancels:0 handler:0];
      v104[1] = v61;
      v62 = +[NSArray arrayWithObjects:v104 count:2];

      id v91 = v62;
      id v34 = [v62 count];
      goto LABEL_26;
    case 15:
      v63 = +[NSBundle mainBundle];
      v64 = [v63 localizedStringForKey:@"Precise_Location_Off_Title [CarPlay]" value:@"localized string not found" table:0];
      [(CarAlertViewController *)v12 setAlertTitle:v64];

      v65 = +[NSBundle mainBundle];
      v66 = [v65 localizedStringForKey:@"Precise_Location_Off_Message [CarPlay]" value:@"localized string not found" table:0];
      [(CarAlertViewController *)v12 setAlertMessage:v66];

      v67 = +[NSBundle mainBundle];
      a5 = [v67 localizedStringForKey:@"Continue [CarPlay]" value:@"localized string not found" table:0];
      v68 = +[MapsInterruptionAction actionWithTitle:a5 cancels:0 handler:0];
      v103 = v68;
      __int16 v30 = +[NSArray arrayWithObjects:&v103 count:1];

LABEL_47:
      id v91 = v30;
      id v34 = [v30 count];
      goto LABEL_26;
    case 21:
      v69 = +[NSBundle mainBundle];
      v70 = [v69 localizedStringForKey:@"Using Offline Maps" value:@"localized string not found" table:@"Offline"];
      [(CarAlertViewController *)v12 setAlertTitle:v70];

      v71 = +[NSBundle mainBundle];
      v72 = [v71 localizedStringForKey:@"You're using the offline maps you downloaded even when you have an internet connection." value:@"localized string not found" table:@"Offline"];
      [(CarAlertViewController *)v12 setAlertMessage:v72];

      v73 = +[NSBundle mainBundle];
      v90 = [v73 localizedStringForKey:@"Continue [CarPlay, Offline Alert]", @"localized string not found", 0 value table];
      v87 = +[MapsInterruptionAction actionWithTitle:v90 cancels:1 handler:0];
      v102[0] = v87;
      v74 = +[NSBundle mainBundle];
      v75 = [v74 localizedStringForKey:@"Turn Off [CarPlay, Offline Alert]", @"localized string not found", 0 value table];
      v76 = +[MapsInterruptionAction actionWithTitle:v75 cancels:0 handler:0];
      v102[1] = v76;
      a5 = +[NSArray arrayWithObjects:v102 count:2];

LABEL_49:
      id v91 = a5;
      id v34 = [a5 count];
      goto LABEL_26;
    default:
LABEL_25:
      id v34 = [v91 count];
LABEL_26:
      if (v34)
      {
        id v35 = v91;
      }
      else
      {
        int64_t v36 = +[NSBundle mainBundle];
        a5 = [v36 localizedStringForKey:@"OK [CarPlay error alert]" value:@"localized string not found" table:0];

        v37 = +[MapsInterruptionAction actionWithTitle:a5 cancels:0 handler:0];
        v101 = v37;
        uint64_t v38 = +[NSArray arrayWithObjects:&v101 count:1];

        id v35 = (id)v38;
      }
      id v91 = v35;
      -[CarAlertViewController setActions:](v12, "setActions:");
LABEL_30:
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_10038119C;
      v97[3] = &unk_1012E6948;
      id v99 = v92;
      int64_t v100 = a3;
      v97[4] = self;
      id v91 = v91;
      id v98 = v91;
      [(CarAlertViewController *)v12 setResultBlock:v97];
      v39 = sub_100015DB4();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        if (v12 == self->_currentAlertViewController) {
          CFStringRef v40 = @"reuse";
        }
        else {
          CFStringRef v40 = @"create";
        }
        v41 = [(CarAlertViewController *)v12 title];
        v42 = [(CarAlertViewController *)v12 title];
        id v43 = [v42 length];
        if ((unint64_t)v43 > 0x13)
        {
          uint64_t v44 = 20;
        }
        else
        {
          a5 = [(CarAlertViewController *)v12 title];
          uint64_t v44 = (uint64_t)[a5 length];
        }
        BOOL v45 = (unint64_t)v43 < 0x14;
        v46 = [v41 substringToIndex:v44];
        *(_DWORD *)buf = 138412802;
        id v108 = (id)v40;
        __int16 v109 = 2048;
        int64_t v110 = a3;
        __int16 v111 = 2112;
        id v112 = v46;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Did %@ alert controller (kind:%ld, title:%@)", buf, 0x20u);
        if (v45) {
      }
        }
      [(CarChromeViewController *)self _presentAlertViewController:v12 animated:1];
      objc_initWeak((id *)buf, v12);
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_100381350;
      v95[3] = &unk_1012E6690;
      objc_copyWeak(&v96, (id *)buf);
      v95[4] = self;
      id v47 = [v95 copy];
      id v11 = objc_retainBlock(v47);

      objc_destroyWeak(&v96);
      objc_destroyWeak((id *)buf);

LABEL_41:
      break;
  }
LABEL_42:

  return v11;
}

- (id)_presentSearchRefinementWithUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 objectForKeyedSubscript:@"kMapsInterruptionSearchRefinementResults"];
  if (v8)
  {
    id v9 = [CarDisambiguationModeController alloc];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100381760;
    v18[3] = &unk_1012E6970;
    id v19 = v7;
    objc_copyWeak(&v20, &location);
    uint64_t v10 = [(CarDisambiguationModeController *)v9 initWithSearchInfo:v8 completionBlock:v18];
    id v11 = sub_100015DB4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will present search refinement controller", buf, 2u);
    }

    id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
    [(CarChromeViewController *)self presentViewController:v12 animated:1 completion:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1003818A4;
    v16[3] = &unk_1012E6998;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = objc_retainBlock(v16);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    id v14 = v19;
  }
  else
  {
    id v14 = sub_100015DB4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will not present search refinement, no search info provided", buf, 2u);
    }
    uint64_t v13 = 0;
  }

  objc_destroyWeak(&location);

  return v13;
}

- (void)_presentAlertViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v33 = a4;
  id v8 = a3;
  id v9 = [(CarChromeViewController *)self presentedViewController];
  sub_100015DB4();
  uint64_t v10 = (CarAlertViewController *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = os_log_type_enabled(&v10->super.super.super, OS_LOG_TYPE_INFO);
  if (v9 == v8)
  {
    if (v11)
    {
      id v16 = [v8 alertTitle];
      id v17 = [v8 alertTitle];
      id v18 = [v17 length];
      if ((unint64_t)v18 > 0x13)
      {
        uint64_t v19 = 20;
      }
      else
      {
        BOOL v4 = [v8 alertTitle];
        uint64_t v19 = (uint64_t)[v4 length];
      }
      BOOL v29 = (unint64_t)v18 < 0x14;
      __int16 v30 = [v16 substringToIndex:v19];
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v30;
      _os_log_impl((void *)&_mh_execute_header, &v10->super.super.super, OS_LOG_TYPE_INFO, "Asked to present alert, but it's already visible: %@", buf, 0xCu);
      if (v29) {
    }
      }
  }
  else
  {
    if (v11)
    {
      id v12 = [v8 alertTitle];
      uint64_t v13 = [v8 alertTitle];
      id v14 = [v13 length];
      if ((unint64_t)v14 > 0x13)
      {
        uint64_t v15 = 20;
      }
      else
      {
        int64_t v5 = [v8 alertTitle];
        uint64_t v15 = (uint64_t)[v5 length];
      }
      BOOL v20 = (unint64_t)v14 < 0x14;
      id v21 = [v12 substringToIndex:v15];
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v21;
      _os_log_impl((void *)&_mh_execute_header, &v10->super.super.super, OS_LOG_TYPE_INFO, "Asked to present alert: %@", buf, 0xCu);
      if (v20) {
    }
      }
    p_currentAlertViewController = &self->_currentAlertViewController;
    uint64_t v10 = self->_currentAlertViewController;
    objc_storeStrong((id *)&self->_currentAlertViewController, a3);
    [(CarAlertViewController *)self->_currentAlertViewController setModalPresentationStyle:5];
    if (v10)
    {
      objc_super v23 = sub_100015DB4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Already have an alert showing, transition to the new one", buf, 2u);
      }

      [(CarAlertViewController *)v10 supersede];
    }
    objc_initWeak(&location, self);
    if (v9)
    {
      objc_copyWeak(&v34, &location);
      BOOL v35 = v33;
      -[CarChromeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:");
      objc_destroyWeak(&v34);
    }
    else
    {
      id v24 = sub_100015DB4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [(CarAlertViewController *)*p_currentAlertViewController alertTitle];
        unsigned __int8 v26 = [(CarAlertViewController *)*p_currentAlertViewController alertTitle];
        id v27 = [v26 length];
        if ((unint64_t)v27 > 0x13)
        {
          uint64_t v28 = 20;
        }
        else
        {
          __int16 v32 = [(CarAlertViewController *)*p_currentAlertViewController alertTitle];
          uint64_t v28 = (uint64_t)[v32 length];
        }
        v31 = [v25 substringToIndex:v28];
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v31;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Will show a new alert %@", buf, 0xCu);
        if ((unint64_t)v27 <= 0x13) {
      }
        }
      [(CarChromeViewController *)self presentViewController:*p_currentAlertViewController animated:v33 completion:0];
    }
    objc_destroyWeak(&location);
  }
}

- (void)_dismissAlertViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = (CarAlertViewController *)a3;
  currentAlertViewController = self->_currentAlertViewController;
  if (currentAlertViewController != v7)
  {
    id v9 = sub_100015DB4();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (currentAlertViewController)
    {
      if (v10)
      {
        BOOL v11 = self->_currentAlertViewController;
        if (!v11)
        {
          id v16 = @"<nil>";
LABEL_28:

          __int16 v30 = v16;
          v31 = v7;
          if (!v31)
          {
            int64_t v36 = @"<nil>";
            goto LABEL_36;
          }
          __int16 v32 = (objc_class *)objc_opt_class();
          BOOL v33 = NSStringFromClass(v32);
          if (objc_opt_respondsToSelector())
          {
            id v34 = [(CarAlertViewController *)v31 performSelector:"accessibilityIdentifier"];
            BOOL v35 = v34;
            if (v34 && ![v34 isEqualToString:v33])
            {
              int64_t v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

              goto LABEL_34;
            }
          }
          int64_t v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_34:

LABEL_36:
          *(_DWORD *)buf = 138412546;
          CFStringRef v40 = v30;
          __int16 v41 = 2112;
          v42 = v36;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will not dismiss current alert, does match instance passed in (current:%@, specified:%@)", buf, 0x16u);

          goto LABEL_39;
        }
        id v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [(CarAlertViewController *)v11 performSelector:"accessibilityIdentifier"];
          uint64_t v15 = v14;
          if (v14 && ![v14 isEqualToString:v13])
          {
            id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

            goto LABEL_10;
          }
        }
        id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_10:

        goto LABEL_28;
      }
LABEL_39:

      goto LABEL_40;
    }
    if (!v10) {
      goto LABEL_39;
    }
    id v22 = v7;
    if (!v22)
    {
      id v27 = @"<nil>";
      goto LABEL_38;
    }
    objc_super v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    if (objc_opt_respondsToSelector())
    {
      id v25 = [(CarAlertViewController *)v22 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v26 = v25;
      if (v25 && ![v25 isEqualToString:v24])
      {
        id v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

        goto LABEL_21;
      }
    }
    id v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_21:

LABEL_38:
    *(_DWORD *)buf = 138412290;
    CFStringRef v40 = v27;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will not dismiss current alert, we do not have one presented (specified:%@)", buf, 0xCu);

    goto LABEL_39;
  }
  id v17 = sub_100015DB4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [(CarAlertViewController *)self->_currentAlertViewController alertTitle];
    uint64_t v19 = [(CarAlertViewController *)self->_currentAlertViewController alertTitle];
    id v20 = [v19 length];
    if ((unint64_t)v20 > 0x13)
    {
      uint64_t v21 = 20;
    }
    else
    {
      BOOL v4 = [(CarAlertViewController *)self->_currentAlertViewController alertTitle];
      uint64_t v21 = (uint64_t)[v4 length];
    }
    uint64_t v28 = [v18 substringToIndex:v21];
    *(_DWORD *)buf = 138412290;
    CFStringRef v40 = v28;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Will dismiss current alert %@", buf, 0xCu);
    if ((unint64_t)v20 <= 0x13) {
  }
    }
  BOOL v29 = self->_currentAlertViewController;
  self->_currentAlertViewController = 0;

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100382294;
  v37[3] = &unk_1012E6300;
  v37[4] = self;
  BOOL v38 = v5;
  [(CarChromeViewController *)self dismissViewControllerAnimated:v5 completion:v37];
LABEL_40:
}

- (void)_presentAnyPendingAlert:(BOOL)a3
{
  BOOL v3 = a3;
  currentAlertViewController = self->_currentAlertViewController;
  id v6 = [(CarChromeViewController *)self presentedViewController];

  if (currentAlertViewController != v6)
  {
    id v7 = [(CarChromeViewController *)self presentedViewController];

    if (v7)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1003824E8;
      v15[3] = &unk_1012E6300;
      v15[4] = self;
      BOOL v16 = v3;
      [(CarChromeViewController *)self dismissViewControllerAnimated:v3 completion:v15];
      return;
    }
    if (self->_currentAlertViewController)
    {
      id v8 = sub_100015DB4();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        [(CarChromeViewController *)self presentViewController:self->_currentAlertViewController animated:v3 completion:0];
        return;
      }
      id v9 = self->_currentAlertViewController;
      if (!v9)
      {
        id v14 = @"<nil>";
        goto LABEL_14;
      }
      BOOL v10 = (objc_class *)objc_opt_class();
      BOOL v11 = NSStringFromClass(v10);
      if (objc_opt_respondsToSelector())
      {
        id v12 = [(CarAlertViewController *)v9 performSelector:"accessibilityIdentifier"];
        uint64_t v13 = v12;
        if (v12 && ![v12 isEqualToString:v11])
        {
          id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

          goto LABEL_12;
        }
      }
      id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_12:

LABEL_14:
      *(_DWORD *)buf = 138412290;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ready for new alert, presenting %@", buf, 0xCu);

      goto LABEL_15;
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v22 traitCollectionDidChange:v4];
  id v5 = [v4 _car_userInterfaceStyle];
  id v6 = [(CarChromeViewController *)self traitCollection];
  id v7 = [v6 _car_userInterfaceStyle];

  if (v5 != v7)
  {
    id v8 = sub_100082DFC();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_18:

      [(MapsLightLevelController *)self->_lightLevelController reloadForChangedLightLevelTrackers];
      goto LABEL_19;
    }
    id v9 = self;
    if (!v9)
    {
      id v14 = @"<nil>";
      goto LABEL_11;
    }
    BOOL v10 = (objc_class *)objc_opt_class();
    BOOL v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      id v12 = [(CarChromeViewController *)v9 performSelector:"accessibilityIdentifier"];
      uint64_t v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_9;
      }
    }
    id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_9:

LABEL_11:
    uint64_t v15 = v14;
    unint64_t v16 = [v4 _car_userInterfaceStyle];
    if (v16 >= 3)
    {
      id v17 = +[NSString stringWithFormat:@"<Unknown %ld>", v16];
    }
    else
    {
      id v17 = off_1012E6C30[v16];
    }
    id v18 = v17;
    uint64_t v19 = [(CarChromeViewController *)v9 traitCollection];
    unint64_t v20 = [v19 _car_userInterfaceStyle];
    if (v20 >= 3)
    {
      uint64_t v21 = +[NSString stringWithFormat:@"<Unknown %ld>", v20];
    }
    else
    {
      uint64_t v21 = off_1012E6C30[v20];
    }
    *(_DWORD *)buf = 138543874;
    id v24 = v15;
    __int16 v25 = 2112;
    unsigned __int8 v26 = v18;
    __int16 v27 = 2112;
    uint64_t v28 = v21;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] In traitCollectionDidChange : _car_userInterfaceStyle changed from : %@ to : %@", buf, 0x20u);

    goto LABEL_18;
  }
LABEL_19:
}

- (void)_carPlayWindowMapStyleDidChange:(id)a3
{
  id v4 = (CarChromeViewController *)a3;
  id v5 = [(CarChromeViewController *)v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    BOOL v11 = sub_100082DFC();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_47;
    }
    id v18 = self;
    if (!v18)
    {
      id v17 = @"<nil>";
      goto LABEL_40;
    }
    uint64_t v19 = (objc_class *)objc_opt_class();
    unint64_t v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v21 = [(CarChromeViewController *)v18 performSelector:"accessibilityIdentifier"];
      objc_super v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        id v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_22;
      }
    }
    id v17 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_22:

LABEL_40:
    *(_DWORD *)buf = 138543618;
    v46 = v17;
    __int16 v47 = 2112;
    v48 = v4;
    id v34 = "[%{public}@] was notified from an unsupported window scene: %@";
    BOOL v35 = v11;
    os_log_type_t v36 = OS_LOG_TYPE_FAULT;
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v35, v36, v34, buf, 0x16u);
LABEL_46:

    goto LABEL_47;
  }
  if (([(CarChromeViewController *)self isViewLoaded] & 1) == 0)
  {
    BOOL v11 = sub_100082DFC();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_47;
    }
    objc_super v23 = self;
    if (!v23)
    {
      id v17 = @"<nil>";
      goto LABEL_42;
    }
    id v24 = (objc_class *)objc_opt_class();
    __int16 v25 = NSStringFromClass(v24);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v26 = [(CarChromeViewController *)v23 performSelector:"accessibilityIdentifier"];
      __int16 v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        id v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_30;
      }
    }
    id v17 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_30:

LABEL_42:
    *(_DWORD *)buf = 138543618;
    v46 = v17;
    __int16 v47 = 2112;
    v48 = v7;
    id v34 = "[%{public}@] Ignoring update from window %@, our view is not loaded";
    BOOL v35 = v11;
    os_log_type_t v36 = OS_LOG_TYPE_DEBUG;
    goto LABEL_43;
  }
  id v8 = [(CarChromeViewController *)self view];
  id v9 = [v8 window];

  BOOL v10 = sub_100082DFC();
  BOOL v11 = v10;
  if (v7 == v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_57:

      [(CarChromeViewController *)self _updateMapToCurrentUserInterfaceStyleAnimated:[(ChromeViewController *)self isSuppressed] ^ 1];
      goto LABEL_48;
    }
    uint64_t v28 = self;
    if (!v28)
    {
      BOOL v33 = @"<nil>";
      goto LABEL_50;
    }
    BOOL v29 = (objc_class *)objc_opt_class();
    __int16 v30 = NSStringFromClass(v29);
    if (objc_opt_respondsToSelector())
    {
      v31 = [(CarChromeViewController *)v28 performSelector:"accessibilityIdentifier"];
      __int16 v32 = v31;
      if (v31 && ![v31 isEqualToString:v30])
      {
        BOOL v33 = +[NSString stringWithFormat:@"%@<%p, %@>", v30, v28, v32];

        goto LABEL_38;
      }
    }
    BOOL v33 = +[NSString stringWithFormat:@"%@<%p>", v30, v28];
LABEL_38:

LABEL_50:
    v39 = v33;
    unint64_t v40 = [(CarChromeViewController *)v28 sceneType];
    if (v40 > 7) {
      CFStringRef v41 = @".Unknown";
    }
    else {
      CFStringRef v41 = off_1012E6BF0[v40];
    }
    v42 = [(CarChromeViewController *)v28 traitCollection];
    unint64_t v43 = [v42 _car_userInterfaceStyle];
    if (v43 >= 3)
    {
      uint64_t v44 = +[NSString stringWithFormat:@"<Unknown %ld>", v43];
    }
    else
    {
      uint64_t v44 = off_1012E6C30[v43];
    }
    *(_DWORD *)buf = 138544130;
    v46 = v39;
    __int16 v47 = 2112;
    v48 = v28;
    __int16 v49 = 2112;
    CFStringRef v50 = v41;
    __int16 v51 = 2112;
    v52 = v44;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] In %@: _carPlayWindowMapStyleDidChange: carSceneType: %@, interfaceStyle: %@", buf, 0x2Au);

    goto LABEL_57;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v12 = self;
    if (!v12)
    {
      id v17 = @"<nil>";
      goto LABEL_45;
    }
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [(CarChromeViewController *)v12 performSelector:"accessibilityIdentifier"];
      unint64_t v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        id v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_14;
      }
    }
    id v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_14:

LABEL_45:
    v37 = [(CarChromeViewController *)v12 view];
    BOOL v38 = [v37 window];
    *(_DWORD *)buf = 138543874;
    v46 = v17;
    __int16 v47 = 2112;
    v48 = v7;
    __int16 v49 = 2112;
    CFStringRef v50 = v38;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Ignoring update from a window: %@ that does not belong to this VC (%@)", buf, 0x20u);

    goto LABEL_46;
  }
LABEL_47:

LABEL_48:
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
}

- (void)_updateMapToCurrentUserInterfaceStyleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CarChromeViewController *)self traitCollection];
  -[CarChromeViewController _updateMapUserInterfaceStyle:animated:](self, "_updateMapUserInterfaceStyle:animated:", [v5 _car_userInterfaceStyle], v3);
}

- (void)_updateMapUserInterfaceStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = sub_100082DFC();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    goto LABEL_14;
  }
  id v8 = self;
  if (!v8)
  {
    uint64_t v13 = @"<nil>";
    goto LABEL_10;
  }
  id v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  if (objc_opt_respondsToSelector())
  {
    BOOL v11 = [(CarChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
    id v12 = v11;
    if (v11 && ![v11 isEqualToString:v10])
    {
      uint64_t v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

      goto LABEL_8;
    }
  }
  uint64_t v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
  id v14 = v13;
  if ((unint64_t)a3 >= 3)
  {
    uint64_t v15 = +[NSString stringWithFormat:@"<Unknown %ld>", a3];
  }
  else
  {
    uint64_t v15 = off_1012E6C30[a3];
  }
  *(_DWORD *)buf = 138543618;
  __int16 v30 = v14;
  __int16 v31 = 2112;
  __int16 v32 = v15;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] In _updateMapUserInterfaceStyle : %@", buf, 0x16u);

LABEL_14:
  unint64_t v16 = sub_100082DFC();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    goto LABEL_26;
  }
  id v17 = self;
  if (!v17)
  {
    objc_super v22 = @"<nil>";
    goto LABEL_23;
  }
  id v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  if (objc_opt_respondsToSelector())
  {
    unint64_t v20 = [(CarChromeViewController *)v17 performSelector:"accessibilityIdentifier"];
    uint64_t v21 = v20;
    if (v20 && ![v20 isEqualToString:v19])
    {
      objc_super v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

      goto LABEL_21;
    }
  }
  objc_super v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_21:

LABEL_23:
  objc_super v23 = [(ChromeViewController *)v17 mapView];
  unsigned int v24 = [v23 _showsNightMode];
  __int16 v25 = @"NO";
  if (v24) {
    __int16 v25 = @"YES";
  }
  unsigned __int8 v26 = v25;
  *(_DWORD *)buf = 138543618;
  __int16 v30 = v22;
  __int16 v31 = 2112;
  __int16 v32 = v26;
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] In _updateMapUserInterfaceStyle self.mapView.showsNightMode : %@", buf, 0x16u);

LABEL_26:
  __int16 v27 = +[GroupAnimation animationForAnimatedFlag:v4];
  [(CarChromeViewController *)self _performMapUpdateToUserInterfaceStyle:a3 animation:v27];
  uint64_t v28 = [(ChromeViewController *)self navigationDisplay];
  [v28 setTemporaryDisplayRate:-1 forDuration:2.0];

  [v27 runWithDuration:196608 delay:2.0 options:0.0];
}

- (void)_performMapUpdateToUserInterfaceStyle:(int64_t)a3 animation:(id)a4
{
  id v6 = a4;
  id v7 = sub_100082DFC();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    goto LABEL_16;
  }
  id v8 = self;
  if (!v8)
  {
    uint64_t v13 = @"<nil>";
    goto LABEL_10;
  }
  id v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  if (objc_opt_respondsToSelector())
  {
    BOOL v11 = [(CarChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
    id v12 = v11;
    if (v11 && ![v11 isEqualToString:v10])
    {
      uint64_t v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

      goto LABEL_8;
    }
  }
  uint64_t v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
  id v14 = v13;
  if ((unint64_t)a3 >= 3)
  {
    uint64_t v15 = +[NSString stringWithFormat:@"<Unknown %ld>", a3];
  }
  else
  {
    uint64_t v15 = off_1012E6C30[a3];
  }
  int BOOL = GEOConfigGetBOOL();
  id v17 = @"NO";
  if (BOOL) {
    id v17 = @"YES";
  }
  id v18 = v17;
  *(_DWORD *)buf = 138543874;
  uint64_t v44 = v14;
  __int16 v45 = 2112;
  v46 = v15;
  __int16 v47 = 2112;
  v48 = v18;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] In _performMapUpdateToUserInterfaceStyle: %@, CarPlayMapAppearanceShouldFollowUserInterfaceStyle: %@", buf, 0x20u);

LABEL_16:
  uint64_t v19 = sub_100082DFC();
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
    goto LABEL_29;
  }
  unint64_t v20 = self;
  if (!v20)
  {
    __int16 v25 = @"<nil>";
    goto LABEL_25;
  }
  uint64_t v21 = (objc_class *)objc_opt_class();
  objc_super v22 = NSStringFromClass(v21);
  if (objc_opt_respondsToSelector())
  {
    objc_super v23 = [(CarChromeViewController *)v20 performSelector:"accessibilityIdentifier"];
    unsigned int v24 = v23;
    if (v23 && ![v23 isEqualToString:v22])
    {
      __int16 v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

      goto LABEL_23;
    }
  }
  __int16 v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_23:

LABEL_25:
  unsigned __int8 v26 = v25;
  __int16 v27 = [(ChromeViewController *)v20 mapView];
  uint64_t v28 = [v27 traitCollection];
  unint64_t v29 = [v28 _car_userInterfaceStyle];
  if (v29 >= 3)
  {
    __int16 v30 = +[NSString stringWithFormat:@"<Unknown %ld>", v29];
  }
  else
  {
    __int16 v30 = off_1012E6C30[v29];
  }
  *(_DWORD *)buf = 138543618;
  uint64_t v44 = v26;
  __int16 v45 = 2112;
  v46 = v30;
  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] self.mapView.traitCollection._car_userInterfaceStyle: %@", buf, 0x16u);

LABEL_29:
  __int16 v31 = sub_100082DFC();
  if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
    goto LABEL_42;
  }
  __int16 v32 = self;
  if (!v32)
  {
    v37 = @"<nil>";
    goto LABEL_38;
  }
  BOOL v33 = (objc_class *)objc_opt_class();
  id v34 = NSStringFromClass(v33);
  if (objc_opt_respondsToSelector())
  {
    BOOL v35 = [(CarChromeViewController *)v32 performSelector:"accessibilityIdentifier"];
    os_log_type_t v36 = v35;
    if (v35 && ![v35 isEqualToString:v34])
    {
      v37 = +[NSString stringWithFormat:@"%@<%p, %@>", v34, v32, v36];

      goto LABEL_36;
    }
  }
  v37 = +[NSString stringWithFormat:@"%@<%p>", v34, v32];
LABEL_36:

LABEL_38:
  BOOL v38 = v37;
  v39 = [(ChromeViewController *)v32 mapView];
  unint64_t v40 = (unint64_t)[v39 overrideUserInterfaceStyle];
  if (v40 >= 3)
  {
    CFStringRef v41 = +[NSString stringWithFormat:@"<Unknown %ld>", v40];
  }
  else
  {
    CFStringRef v41 = off_1012E6C30[v40];
  }
  *(_DWORD *)buf = 138543618;
  uint64_t v44 = v38;
  __int16 v45 = 2112;
  v46 = v41;
  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}@] self.mapView.overrideUserInterfaceStyle: %@", buf, 0x16u);

LABEL_42:
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10038378C;
  v42[3] = &unk_1012E69C0;
  v42[4] = self;
  v42[5] = a3;
  [v6 addAnimations:v42 completion:0];
}

+ (Class)userLocationViewClass
{
  return (Class)objc_opt_class();
}

- (void)_resetMapViewDefaults:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    BOOL v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will reset mapView default settings", buf, 2u);
    }

    [v3 setZoomEnabled:0];
    id v5 = [(id)objc_opt_class() allowOneHandedZooming];
    id v6 = [v3 _oneHandedZoomGestureRecognizer];
    [v6 setEnabled:v5];

    [v3 setShowsUserLocation:1];
    *(_OWORD *)id v8 = *(_OWORD *)((char *)VKAnnotationTrackingBehaviorDefault + 1);
    *(void *)&v8[15] = VKAnnotationTrackingBehaviorDefault[2];
    char v7 = 0;
    [v3 _setUserTrackingBehavior:&v7];
  }
}

- (void)prepareMapViewForFirstUse
{
  v27.receiver = self;
  v27.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v27 prepareMapViewForFirstUse];
  id v3 = [(ChromeViewController *)self mapView];
  BOOL v4 = [[MapViewResponder alloc] initWithMapView:v3];
  mapViewResponder = self->_mapViewResponder;
  self->_mapViewResponder = v4;

  [(CarMapNudgerizer *)self->_nudgerizer setMapView:v3];
  [(ChromeMapSettings *)self->_defaultMapSettings setMapView:v3];
  [(CarRouteSelectionController *)self->_routeSelectionController setMapView:v3];
  [(CarChromeViewController *)self _updateOfflineModernMapToken];
  self->_configuringMapView = 1;
  id v6 = [v3 _mapLayer];
  [v6 setDisplayRate:30];

  char v7 = [v3 _mapLayer];
  [v7 setNavigationShieldSize:5];

  id v8 = [v3 _mapLayer];
  [v8 setShieldSize:4];

  id v9 = [v3 _mapLayer];
  [v9 setShieldIdiom:1];

  BOOL v10 = [v3 _mapLayer];
  [v10 setLabelScaleFactor:2];

  BOOL v11 = [v3 _mapLayer];
  [v11 setApplicationUILayout:1];

  [v3 setShowsTraffic:1];
  [v3 _setShowsTrafficIncidents:1];
  uint64_t v26 = 0;
  int64x2_t v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  if (v3) {
    [v3 _cartographicConfiguration];
  }
  *((void *)&v23 + 1) = 2;
  *(void *)&long long v25 = 0;
  if (![(CarChromeViewController *)self shouldUseModernMap]) {
    int64x2_t v24 = vdupq_n_s64(1uLL);
  }
  v21[0] = v23;
  v21[1] = v24;
  v21[2] = v25;
  uint64_t v22 = v26;
  [v3 _setCartographicConfiguration:v21];
  [v3 setCompassEnabled:0];
  [v3 setScaleEnabled:0];
  [v3 _setUseVehicleHeading:1];
  [v3 _setCanSelectPOIs:[self _canSelectAlternateRoutes]];
  id v12 = +[UIColor _maps_keyColor];
  [v3 setTintColor:v12];

  [v3 _setShouldLoadFallbackTiles:0];
  uint64_t v13 = [v3 _panningGestureRecognizer];
  [v13 setAllowedTouchTypes:&off_1013AD488];

  id v14 = [v3 _oneHandedZoomGestureRecognizer];
  [v14 setAllowedPressTypes:&off_1013AD4A0];
  uint64_t v15 = [[CarOneHandedZoomConfiguration alloc] initWithGestureRecongizer:v14];
  [v14 setConfiguration:v15];

  [v3 _setShowsVenues:0];
  [v3 _setLoadLookAroundAvailability:0];
  [(CarChromeViewController *)self _resetMapViewDefaults:v3];
  unint64_t v16 = [(CarChromeViewController *)self _maps_mapsSceneDelegate];
  id v17 = [v16 entryPointsCoordinator];
  unsigned __int8 v18 = [v17 didLaunchWithExplicitIntent];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = [(CarChromeViewController *)self defaultMapSettings];
    [v19 applyToMapViewAnimated:0 duration:0 completion:0.0];
  }
  unint64_t v20 = [(CarChromeViewController *)self traitCollection];
  [self _updateMapUserInterfaceStyle:[v20 _car_userInterfaceStyle] animated:1];
}

- (BOOL)shouldAnimateMapTransition:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  if (![(ChromeViewController *)self isTransitioning]) {
    return 1;
  }
  BOOL v4 = [(CarChromeViewController *)self topContext];
  id v5 = [(ChromeViewController *)self previousTopContext];
  if ([v4 showsMapView]) {
    unsigned __int8 v6 = [v5 showsMapView];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)allComponents
{
  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  v2 = [(ChromeViewController *)&v6 allComponents];
  id v3 = [v2 mutableCopy];

  v7[0] = @"cards";
  v7[1] = @"accessories";
  v7[2] = @"mapcontrols";
  v7[3] = @"statusBanner";
  BOOL v4 = +[NSArray arrayWithObjects:v7 count:4];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (void)willUpdateComponents:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v13 willUpdateComponents:v6 withAnimation:v7];
  id v8 = +[NSSet setWithObjects:@"cards", @"statusBanner", 0];
  unsigned __int8 v9 = [v6 intersectsSet:v8];

  double v10 = 1.0;
  if (v9) {
    goto LABEL_4;
  }
  BOOL v11 = +[NSSet setWithObjects:@"accessories", 1.0, @"mapcontrols", 0];
  unsigned int v12 = [v6 intersectsSet:v11];

  if (v12)
  {
    double v10 = 0.1;
LABEL_4:
    [v7 setDuration:v10];
  }
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a5;
  if (v8 == @"cards")
  {
    unsigned __int8 v18 = [(CarChromeViewController *)self topContext];
    [(CarChromeViewController *)self _updateCardsForContext:v18 withAnimation:v9 completion:0];
LABEL_14:

    goto LABEL_15;
  }
  if (v8 != @"statusBanner")
  {
    if (v8 == @"accessories")
    {
      unsigned __int8 v18 = [(CarChromeViewController *)self topContext];
      [(CarChromeViewController *)self _reloadAccessoriesForContext:v18 withAnimation:v9];
    }
    else
    {
      if (v8 != @"mapcontrols")
      {
        if (@"mapInsets" != v8)
        {
LABEL_19:
          v19.receiver = self;
          v19.super_class = (Class)CarChromeViewController;
          [(ChromeViewController *)&v19 updateComponent:v8 forTiming:a4 withAnimation:v9];
          goto LABEL_15;
        }
        if (![(ChromeViewController *)self isRunningNavigationDisplay])
        {
          double v10 = [(ChromeViewController *)self mapView];
          if ([v10 userTrackingMode] == (id)2)
          {
            BOOL v11 = +[MKLocationManager sharedLocationManager];
            [v11 vehicleHeadingOrCourse];
            double v13 = v12;

            if (v13 > -1.0)
            {
              id v14 = [(CarChromeViewController *)self view];
              [v14 bounds];
              p_headingUpMapInsetAdjustmentConstraint = &self->_headingUpMapInsetAdjustmentConstraint;
              [(NSLayoutConstraint *)self->_headingUpMapInsetAdjustmentConstraint setConstant:round(v15 / 2.5)];

              uint64_t v17 = 1;
LABEL_18:
              [(NSLayoutConstraint *)*p_headingUpMapInsetAdjustmentConstraint setActive:v17];
              goto LABEL_19;
            }
          }
          else
          {
          }
        }
        uint64_t v17 = 0;
        p_headingUpMapInsetAdjustmentConstraint = &self->_headingUpMapInsetAdjustmentConstraint;
        goto LABEL_18;
      }
      unsigned __int8 v18 = [(CarChromeViewController *)self topContext];
      [(CarChromeViewController *)self _reloadMapControlsForContext:v18 withAnimation:v9];
    }
    goto LABEL_14;
  }
  [(CarChromeViewController *)self _reloadStatusBannerWithAnimation:v9];
LABEL_15:
}

- (BOOL)mapSettings:(id)a3 shouldApplyAnimated:(BOOL *)a4
{
  id v6 = (ChromeMapSettings *)a3;
  if (CarDisplayIsDriveCameraEnabled()
    && (id)[(ChromeMapSettings *)v6 type] == (id)1
    && ([(ChromeViewController *)self setNeedsUpdateComponent:@"navigationDisplay" animated:*a4], [(ChromeMapSettings *)v6 pitched]))
  {
    BOOL v7 = [(CarChromeViewController *)self shouldAnimateMapTransition:*a4];
    BOOL v8 = 0;
    *a4 = v7;
  }
  else if (self->_defaultMapSettings == v6 {
         && ![(CarChromeViewController *)self shouldRecenterAndZoom])
  }
  {
    double v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Will not recenter and zoom, not allowed", v11, 2u);
    }

    BOOL v8 = 0;
  }
  else
  {
    if (a4) {
      *a4 = [(CarChromeViewController *)self shouldAnimateMapTransition:*a4];
    }
    BOOL v8 = 1;
  }

  return v8;
}

- (double)mapInsetsUpdateAnimationDuration
{
  return 1.0;
}

- (BOOL)shouldRecenterAndZoom
{
  BOOL configuringMapView = self->_configuringMapView;
  BOOL v4 = [(CarChromeViewController *)self topContext];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return configuringMapView;
  }
  id v6 = [(CarChromeViewController *)self topContext];
  unsigned __int8 v7 = [v6 allowMapZoomAndRecentering];

  return v7;
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v15 mapView:a3 didUpdateUserLocation:a4];
  char v5 = +[MKLocationManager sharedLocationManager];
  [v5 vehicleHeadingOrCourse];
  double v7 = v6;
  unsigned int v8 = [(CarChromeViewController *)self haveVehicleDirection];
  if (v7 <= -1.0)
  {
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ((v8 & 1) == 0)
  {
LABEL_5:
    [(CarChromeViewController *)self setHaveVehicleDirection:v7 > -1.0];
    [(ChromeViewController *)self setNeedsUpdateMapInsets];
  }
LABEL_6:
  id v9 = +[MNNavigationService sharedService];
  unsigned int v10 = [v9 isInNavigatingState];

  if (v7 == -1.0) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 1;
  }
  double v12 = [(ChromeViewController *)self userLocationView];
  id v13 = [v12 mode];

  if (v13 != (id)v11)
  {
    id v14 = [(ChromeViewController *)self userLocationView];
    [v14 setMode:v11];
  }
}

- (void)mapView:(id)a3 didFailToLocateUserWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v16 mapView:v6 didFailToLocateUserWithError:v7];
  if (([v6 hasUserLocation] & 1) == 0)
  {
    unsigned int v8 = +[CarDisplayController sharedInstance];
    unsigned int v9 = [v8 isCurrentlyConnectedToCarAppScene];

    if (v9)
    {
      unsigned int v10 = [v7 domain];
      unsigned int v11 = [v10 isEqualToString:MKLocationErrorDomain];

      if (v11)
      {
        double v12 = sub_100015DB4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)objc_super v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Notified did fail to locate user, will request location services error alert", v15, 2u);
        }

        id v13 = +[UIApplication sharedMapsDelegate];
        [v13 showLocationServicesAlertWithError:v7];

        id v14 = sub_100015DB4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)objc_super v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will force user tracking to None and hide user location", v15, 2u);
        }

        [v6 setUserTrackingMode:0];
        [v6 setShowsUserLocation:0];
      }
    }
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v14 mapView:a3 shouldSelectLabelMarker:v6];
  if ([(CarChromeViewController *)self _canSelectAlternateRoutes]) {
    unsigned int v7 = [v6 isRouteEta];
  }
  else {
    unsigned int v7 = 0;
  }
  unsigned int v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (v7) {
      unsigned int v9 = @"YES";
    }
    else {
      unsigned int v9 = @"NO";
    }
    unsigned int v10 = v9;
    if ([v6 isRouteEta]) {
      unsigned int v11 = @"YES";
    }
    else {
      unsigned int v11 = @"NO";
    }
    double v12 = v11;
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v10;
    __int16 v17 = 2112;
    unsigned __int8 v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "shouldSelectLabelMarker: %@, isRouteETA: %@", buf, 0x16u);
  }
  return v7;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = [v7 isRouteEta];
    unsigned int v10 = @"NO";
    if (v9) {
      unsigned int v10 = @"YES";
    }
    unsigned int v11 = v10;
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    unint64_t v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "User didSelectLabelMarker: %@, isRouteETA: %@", buf, 0x16u);
  }
  if ([v7 isRouteEta])
  {
    double v12 = [(CarChromeViewController *)self routeSelectionController];
    [v12 mapView:v6 didSelectLabelMarker:v7];
  }
  id v13 = [(CarChromeViewController *)self topContext];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    objc_super v15 = [(CarChromeViewController *)self topContext];
    [v15 mapView:v6 didSelectLabelMarker:v7];
  }
  v16.receiver = self;
  v16.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v16 mapView:v6 didSelectLabelMarker:v7];
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(CarChromeViewController *)self topContext];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    unsigned int v10 = [(CarChromeViewController *)self topContext];
    [v10 mapView:v6 didDeselectLabelMarker:v7];
  }
  v11.receiver = self;
  v11.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v11 mapView:v6 didDeselectLabelMarker:v7];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 _canZoomIn];
  unsigned int v8 = [(CarChromeViewController *)self mapControlsOverlay];
  [v8 setZoomInEnabled:v7];

  id v9 = [v6 _canZoomOut];
  unsigned int v10 = [(CarChromeViewController *)self mapControlsOverlay];
  [v10 setZoomOutEnabled:v9];

  objc_super v11 = +[MapsOfflineUIHelper sharedHelper];
  LODWORD(v10) = [v11 isUsingOfflineMaps];

  if (v10)
  {
    id v12 = [objc_alloc((Class)CLLocation) initWithLatitude:self->_mapViewRegion.center.latitude longitude:self->_mapViewRegion.center.longitude];
    id v13 = objc_alloc((Class)CLLocation);
    [v6 region];
    double v15 = v14;
    [v6 region];
    id v16 = [v13 initWithLatitude:v15];
    [v12 distanceFromLocation:v16];
    double v18 = v17;
    uint64_t Integer = GEOConfigGetInteger();
    GEOConfigGetDouble();
    double v21 = v20;
    if (v18 > (double)Integer || ([v6 _zoomLevel], vabdd_f64(v22, self->_zoomLevel) > v21))
    {
      [v6 region];
      self->_mapViewRegion.center.latitude = v23;
      self->_mapViewRegion.center.longitude = v24;
      self->_mapViewRegion.span.latitudeDelta = v25;
      self->_mapViewRegion.span.longitudeDelta = v26;
      [v6 _zoomLevel];
      self->_zoomLevel = v27;
      uint64_t v28 = [(CarChromeViewController *)self topContext];
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        __int16 v30 = [(CarChromeViewController *)self topContext];
        [v30 checkFullTextSearchSupport];
      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v31 mapView:v6 regionDidChangeAnimated:v4];
}

- (void)mapView:(id)a3 canZoomInDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CarChromeViewController *)self mapControlsOverlay];
  [v7 setZoomInEnabled:v4];

  v8.receiver = self;
  v8.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v8 mapView:v6 canZoomInDidChange:v4];
}

- (void)mapView:(id)a3 canZoomOutDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CarChromeViewController *)self mapControlsOverlay];
  [v7 setZoomOutEnabled:v4];

  v8.receiver = self;
  v8.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v8 mapView:v6 canZoomOutDidChange:v4];
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  if (!a4)
  {
    uint64_t v15 = 1001;
LABEL_11:
    [(CarChromeViewController *)self captureUserAction:v15];
    goto LABEL_12;
  }
  if (a4 == 1)
  {
    if (a5 == 1) {
      uint64_t v15 = 1043;
    }
    else {
      uint64_t v15 = 1044;
    }
    if ((unint64_t)a6 <= 7)
    {
      id v16 = (unsigned int *)&unk_100F6F010;
      if (a5 == 1) {
        id v16 = (unsigned int *)&unk_100F6EFF0;
      }
      uint64_t v15 = v16[a6];
    }
    goto LABEL_11;
  }
LABEL_12:
  v17.receiver = self;
  v17.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v17 mapView:v14 didStopRespondingToGesture:a4 zoomDirection:a5 zoomGestureType:a6 didDecelerate:v9 tiltDirection:a8];
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:didBecomePitched:](&v7, "mapView:didBecomePitched:", a3);
  id v6 = [(CarChromeViewController *)self defaultMapSettings];
  [v6 setPitched:v4];

  [(CarChromeViewController *)self _update3DButton];
  [(CarChromeViewController *)self _updateCameraToggleButton];
}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v5 mapView:a3 canEnter3DModeDidChange:a4];
  [(CarChromeViewController *)self _update3DButton];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 userLocation];

  if (v9 != v8
    || ([(ChromeViewController *)self userLocationView],
        (unsigned int v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_super v11 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
    unsigned int v10 = [v11 mapView:v7 viewForAnnotation:v8];
  }

  return v10;
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100015DB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Map view did finish rendering, informing Search pins manager so that it can drop pins.", buf, 2u);
  }

  id v8 = [(ChromeViewController *)self searchPinsManager];
  [v8 mapViewDidBecomeFullyDrawn];

  v9.receiver = self;
  v9.super_class = (Class)CarChromeViewController;
  [(CarChromeViewController *)&v9 mapViewDidFinishRenderingMap:v6 fullyRendered:v4];
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _canZoomIn];
  id v6 = [(CarChromeViewController *)self mapControlsOverlay];
  [v6 setZoomInEnabled:v5];

  id v7 = [v4 _canZoomOut];
  id v8 = [(CarChromeViewController *)self mapControlsOverlay];
  [v8 setZoomOutEnabled:v7];
}

- (void)_locationAuthorizationDidChange:(id)a3
{
  id v4 = +[MKLocationManager sharedLocationManager];
  if ([v4 isLocationServicesAuthorizationNeeded])
  {
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Location authorization changed, but it's not yet approved", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    id v6 = [v4 isLocationServicesApproved];
    id v7 = [(ChromeViewController *)self mapView];
    [v7 setShowsUserLocation:v6];

    id v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v9 = [v4 isLocationServicesApproved];
      unsigned int v10 = @"NO";
      if (v9) {
        unsigned int v10 = @"YES";
      }
      objc_super v11 = v10;
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "mapView.showsUserLocation = %@", (uint8_t *)&v12, 0xCu);
    }
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:MKLocationManagerApprovalDidChangeNotification object:0];
  }
}

- (void)clearMapGesturesAndAnimations
{
  id v3 = [(CarChromeViewController *)self nudgerizer];
  [v3 _clearGesturesAndAnimations];

  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v4 clearMapGesturesAndAnimations];
}

- (BOOL)shouldUseModernMap
{
  return !GEOConfigGetBOOL() || [(MapsTokenStorage *)self->_modernMapTokens count] != 0;
}

- (int64_t)modernMapTerrainMode
{
  return 0;
}

- (int64_t)modernMapProjectionType
{
  return 0;
}

- (void)_updateModernMapCartographicConfiguration
{
  if ([(CarChromeViewController *)self shouldUseModernMap])
  {
    int64_t v3 = [(CarChromeViewController *)self modernMapTerrainMode];
    int64_t v4 = [(CarChromeViewController *)self modernMapProjectionType];
  }
  else
  {
    int64_t v3 = 1;
    int64_t v4 = 1;
  }
  id v5 = sub_1000C49B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_updateModernMapCartographicConfiguration with terrainMode: %ld projectionType: %ld", buf, 0x16u);
  }

  uint64_t v17 = 0;
  long long v16 = 0u;
  memset(buf, 0, sizeof(buf));
  id v6 = [(ChromeViewController *)self mapView];
  id v7 = v6;
  if (v6)
  {
    [v6 _cartographicConfiguration];
  }
  else
  {
    uint64_t v17 = 0;
    long long v16 = 0u;
    memset(buf, 0, sizeof(buf));
  }

  *(void *)&uint8_t buf[16] = v4;
  *(void *)&buf[24] = v3;
  long long v12 = *(_OWORD *)&buf[16];
  long long v13 = v16;
  uint64_t v14 = v17;
  long long v11 = *(_OWORD *)buf;
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
  int64_t v4 = +[NSNumber numberWithUnsignedInteger:a3];
  unsigned int v9 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [(MapsTokenStorage *)modernMapTokens tokenWithUserInfo:v5];

  return v6;
}

- (void)offlineStateChanged:(id)a3
{
  [(CarChromeViewController *)self _updateOfflineModernMapToken];

  [(CarChromeViewController *)self reloadStatusBannerAnimated:1];
}

- (void)_updateOfflineModernMapToken
{
  BOOL v3 = self->_usingOfflineDataModernMapToken == 0;
  int64_t v4 = +[GEOOfflineService shared];
  unsigned int v5 = [v4 isUsingOffline];

  if (((v3 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      id v6 = [(CarChromeViewController *)self acquireModernMapTokenForReason:0];
    }
    else
    {
      id v6 = 0;
    }
    id usingOfflineDataModernMapToken = self->_usingOfflineDataModernMapToken;
    self->_id usingOfflineDataModernMapToken = v6;
  }
}

- (BOOL)isDisplayingNavigation
{
  BOOL v3 = [(ChromeViewController *)self pendingContexts];
  int64_t v4 = v3;
  if (!v3)
  {
    int64_t v4 = [(ChromeViewController *)self contexts];
  }
  unsigned int v5 = [v4 _maps_firstContextOfClass:objc_opt_class()];

  if (!v3) {
  return v5 != 0;
  }
}

- (BOOL)wantsNavigationDisplayByDefault
{
  unsigned __int8 v3 = [(CarChromeViewController *)self isDisplayingNavigation];
  if (CarDisplayIsDriveCameraEnabled())
  {
    int64_t v4 = [(CarChromeViewController *)self defaultMapSettings];
    unsigned __int8 v5 = [v4 pitched];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }
  return v3 | v5;
}

- (void)_startNavigationObscuredTimeout
{
  [(CarChromeViewController *)self _stopNavigationObscuredTimeout];
  if ([(CarChromeViewController *)self isDisplayingNavigation])
  {
    unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
    [v3 doubleForKey:@"CarNavigationObscuredTimeoutInterval"];
    double v5 = v4;

    id v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134217984;
      double v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Scheduling navigation obscured timeout (%.1f)", (uint8_t *)&v9, 0xCu);
    }

    id v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_navigationObscuredTimeoutFired:" selector:0 userInfo:0 repeats:v5];
    navigationObscuredTimeout = self->_navigationObscuredTimeout;
    self->_navigationObscuredTimeout = v7;
  }
}

- (void)_restartNavigationObscuredTimeout
{
  if (self->_navigationObscuredTimeout) {
    [(CarChromeViewController *)self _startNavigationObscuredTimeout];
  }
}

- (void)_stopNavigationObscuredTimeout
{
  if (self->_navigationObscuredTimeout)
  {
    unsigned __int8 v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Cancelling navigation obscured timeout", v6, 2u);
    }

    navigationObscuredTimeout = self->_navigationObscuredTimeout;
  }
  else
  {
    navigationObscuredTimeout = 0;
  }
  [(NSTimer *)navigationObscuredTimeout invalidate];
  double v5 = self->_navigationObscuredTimeout;
  self->_navigationObscuredTimeout = 0;
}

- (void)_navigationObscuredTimeoutFired:(id)a3
{
  [(CarChromeViewController *)self _stopNavigationObscuredTimeout];
  if ([(CarChromeViewController *)self isDisplayingNavigation])
  {
    double v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Navigation obscured timeout fired", v6, 2u);
    }

    double v5 = +[CarChromeModeCoordinator sharedInstance];
    [v5 displayNavigation];
  }
}

- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v5 chromeNavigationDisplay:a3 configurationDidChange:a4];
  [(CarChromeViewController *)self updateZoomControls];
}

- (void)chromeNavigationDisplay:(id)a3 didChangePanning:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  -[ChromeViewController chromeNavigationDisplay:didChangePanning:animated:](&v7, "chromeNavigationDisplay:didChangePanning:animated:", a3, a4);
  [(ChromeViewController *)self setNeedsUpdateComponent:@"mapcontrols" animated:v5];
}

- (void)chromeNavigationDisplayDidRenderRoute:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v4 chromeNavigationDisplayDidRenderRoute:a3];
  [(CarChromeViewController *)self captureUserAction:3072];
}

- (BOOL)_canSelectAlternateRoutes
{
  unsigned __int8 v3 = [(CarChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [(CarChromeViewController *)self topContext];
    unsigned __int8 v5 = [v4 supportsAlternateRouteSelection];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)allowOneHandedZooming
{
  return byte_1015DDC10;
}

+ (void)_updateAllowOneHandedZooming
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 objectForKey:@"__internal__CarPlayOneHandedZoomEnabled"];

  if (v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    byte_1015DDC10 = [v4 BOOLForKey:@"__internal__CarPlayOneHandedZoomEnabled"];
  }
}

- (void)_carOneHandedZoomSettingUpdated:(id)a3
{
  unsigned __int8 v3 = objc_opt_class();

  _[v3 _updateAllowOneHandedZooming];
}

- (void)_handleDoubleTap:(id)a3
{
  id v4 = [(CarChromeViewController *)self doubleTapBlock];

  if (v4)
  {
    unsigned __int8 v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will fire doubleTapBlock", v7, 2u);
    }

    id v6 = [(CarChromeViewController *)self doubleTapBlock];
    v6[2]();
  }
}

- (void)enableDoubleTapRecognizerWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    doubleTapRecognizer = self->_doubleTapRecognizer;
    if (!doubleTapRecognizer)
    {
      id v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleDoubleTap:"];
      objc_super v7 = self->_doubleTapRecognizer;
      self->_doubleTapRecognizer = v6;

      [(UITapGestureRecognizer *)self->_doubleTapRecognizer setNumberOfTapsRequired:2];
      [(UITapGestureRecognizer *)self->_doubleTapRecognizer setNumberOfTouchesRequired:1];
      [(UITapGestureRecognizer *)self->_doubleTapRecognizer setDelegate:self];
      autohideTapRecognizer = self->_autohideTapRecognizer;
      if (autohideTapRecognizer) {
        [(UITapGestureRecognizer *)autohideTapRecognizer requireGestureRecognizerToFail:self->_doubleTapRecognizer];
      }
      int v9 = [(CarChromeViewController *)self view];
      [v9 addGestureRecognizer:self->_doubleTapRecognizer];

      doubleTapRecognizer = self->_doubleTapRecognizer;
    }
    if (([(UITapGestureRecognizer *)doubleTapRecognizer isEnabled] & 1) == 0)
    {
      double v10 = sub_100015DB4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Will enable double tap gesture", v11, 2u);
      }
    }
    [(CarChromeViewController *)self setDoubleTapBlock:v4];
    [(UITapGestureRecognizer *)self->_doubleTapRecognizer setEnabled:1];
  }
  else
  {
    [(CarChromeViewController *)self disableDoubleTapRecognizer];
  }
}

- (void)disableDoubleTapRecognizer
{
  doubleTapRecognizer = self->_doubleTapRecognizer;
  if (doubleTapRecognizer)
  {
    if ([(UITapGestureRecognizer *)doubleTapRecognizer isEnabled])
    {
      id v4 = sub_100015DB4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unsigned __int8 v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will disable double tap gesture", v5, 2u);
      }
    }
    [(UITapGestureRecognizer *)self->_doubleTapRecognizer setEnabled:0];
    [(CarChromeViewController *)self setDoubleTapBlock:0];
  }
}

- (void)setNeedsFocusUpdateIfUnfocused
{
  unsigned __int8 v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 window];
  unsigned __int8 v5 = [v4 windowScene];
  id v6 = [v5 focusSystem];
  objc_super v7 = [v6 focusedItem];

  if (!v7)
  {
    [(CarChromeViewController *)self setNeedsFocusUpdate];
  }
}

- (BOOL)_shouldAllowKnobFocusMovement
{
  unsigned __int8 v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  id v6 = [(id)v5 focusSystem];
  objc_super v7 = [v6 focusedItem];

  unsigned __int8 v8 = [(CarChromeViewController *)self isAutohidingContentHiddenForCurrentContext];
  int v9 = [(CarChromeViewController *)self topContext];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    double v10 = [(CarChromeViewController *)self topContext];
    unsigned __int8 v11 = [v10 shouldAllowKnobFocusMovement];

    if (v7) {
      return 1;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
    if (v7) {
      return 1;
    }
  }
  return v8 ^ 1 | v11;
}

- (BOOL)_nudgeHandlesPress:(id)a3
{
  return (unint64_t)[a3 type] < 4;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ChromeViewController *)self isSuppressed]
    || ([(CarChromeViewController *)self topContext],
        unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
LABEL_11:
    v12.receiver = self;
    v12.super_class = (Class)CarChromeViewController;
    [(CarChromeViewController *)&v12 pressesBegan:v6 withEvent:v7];
    goto LABEL_12;
  }
  int v9 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![v9 handlePressesBegan:v6 withEvent:v7])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v9 allowKnobNudgeMapPanning] & 1) != 0)
    {
      double v10 = [v6 anyObject];
      unsigned __int8 v11 = [(CarChromeViewController *)self _nudgeHandlesPress:v10];

      if (v11) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    goto LABEL_11;
  }

LABEL_12:
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ChromeViewController *)self isSuppressed]
    || ([(CarChromeViewController *)self topContext],
        unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
LABEL_11:
    v12.receiver = self;
    v12.super_class = (Class)CarChromeViewController;
    [(CarChromeViewController *)&v12 pressesChanged:v6 withEvent:v7];
    goto LABEL_12;
  }
  int v9 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![v9 handlePressesChanged:v6 withEvent:v7])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v9 allowKnobNudgeMapPanning] & 1) != 0)
    {
      double v10 = [v6 anyObject];
      unsigned __int8 v11 = [(CarChromeViewController *)self _nudgeHandlesPress:v10];

      if (v11) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    goto LABEL_11;
  }

LABEL_12:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ChromeViewController *)self isSuppressed]
    || ([(CarChromeViewController *)self topContext],
        unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)CarChromeViewController;
    [(CarChromeViewController *)&v15 pressesEnded:v6 withEvent:v7];
    goto LABEL_16;
  }
  int v9 = [(CarChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector()) {
    unsigned int v10 = [v9 handlePressesEnded:v6 withEvent:v7];
  }
  else {
    unsigned int v10 = 0;
  }
  if ([(CarChromeViewController *)self _canSelectAlternateRoutes])
  {
    unsigned __int8 v11 = [(CarChromeViewController *)self routeSelectionController];
    objc_super v12 = [v6 anyObject];
    unsigned int v10 = [v11 handleKnobPress:v12];
  }
  if (!v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v9 allowKnobNudgeMapPanning] & 1) != 0)
    {
      long long v13 = [v6 anyObject];
      unsigned __int8 v14 = [(CarChromeViewController *)self _nudgeHandlesPress:v13];

      if (v14) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    goto LABEL_15;
  }

LABEL_16:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ChromeViewController *)self isSuppressed]
    || ([(CarChromeViewController *)self topContext],
        unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
LABEL_11:
    v12.receiver = self;
    v12.super_class = (Class)CarChromeViewController;
    [(CarChromeViewController *)&v12 pressesCancelled:v6 withEvent:v7];
    goto LABEL_12;
  }
  int v9 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![v9 handlePressesCancelled:v6 withEvent:v7])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v9 allowKnobNudgeMapPanning] & 1) != 0)
    {
      unsigned int v10 = [v6 anyObject];
      unsigned __int8 v11 = [(CarChromeViewController *)self _nudgeHandlesPress:v10];

      if (v11) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    goto LABEL_11;
  }

LABEL_12:
}

- (BOOL)suppressIdleFocus
{
  v2 = self;
  unsigned __int8 v3 = [(CarChromeViewController *)self topContext];
  LOBYTE(v2) = [(CarChromeViewController *)v2 isAutohidingContentHiddenForContext:v3];

  return (char)v2;
}

- (id)visuallySelectedItem
{
  unsigned __int8 v3 = [(CarChromeViewController *)self topContext];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CarChromeViewController *)self topContext];
    id v6 = [v5 visuallySelectedItem];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CarFocusOrderItem)itemRepresentingMapControls
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:0];
}

- (CarFocusOrderItem)itemRepresentingOverlays
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:1];
}

- (CarFocusOrderItem)itemRepresentingAlternateRoutes
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:2];
}

- (CarFocusOrderItem)itemRepresentingStatusBanner
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:3];
}

- (CarFocusOrderEnvironment)environmentRepresentingMapControls
{
  return +[CarFocusOrderEnvironment environmentWithRepresentativeItemType:0];
}

- (CarFocusOrderEnvironment)environmentRepresentingOverlays
{
  return +[CarFocusOrderEnvironment environmentWithRepresentativeItemType:1];
}

- (CarFocusOrderEnvironment)environmentRepresentingAlternateRoutes
{
  return +[CarFocusOrderEnvironment environmentWithRepresentativeItemType:2];
}

- (NSMapTable)lastFocusedIdentifiersByContext
{
  lastFocusedIdentifiersByContext = self->_lastFocusedIdentifiersByContext;
  if (!lastFocusedIdentifiersByContext)
  {
    char v4 = +[NSMapTable weakToStrongObjectsMapTable];
    uint64_t v5 = self->_lastFocusedIdentifiersByContext;
    self->_lastFocusedIdentifiersByContext = v4;

    lastFocusedIdentifiersByContext = self->_lastFocusedIdentifiersByContext;
  }

  return lastFocusedIdentifiersByContext;
}

- (NSMapTable)lastFocusedItemsByContext
{
  lastFocusedItemsByContext = self->_lastFocusedItemsByContext;
  if (!lastFocusedItemsByContext)
  {
    char v4 = +[NSMapTable weakToWeakObjectsMapTable];
    uint64_t v5 = self->_lastFocusedItemsByContext;
    self->_lastFocusedItemsByContext = v4;

    lastFocusedItemsByContext = self->_lastFocusedItemsByContext;
  }

  return lastFocusedItemsByContext;
}

- (void)_preserveFocusedItemFromContext:(id)a3 toContext:(id)a4
{
  id v5 = a4;
  id v6 = +[CarDisplayController sharedInstance];
  id v7 = [v6 window];
  unsigned __int8 v8 = [v7 windowScene];
  int v9 = [v8 focusSystem];
  unsigned int v10 = [v9 focusedItem];

  if (v10)
  {
    unsigned __int8 v11 = [(CarChromeViewController *)self mapControlsOverlay];
    objc_super v12 = [v11 focusOrderSubItems];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          if (v10 == *(void **)(*((void *)&v19 + 1) + 8 * i))
          {
            double v18 = [(CarChromeViewController *)self lastFocusedItemsByContext];
            [v18 setObject:v10 forKey:v5];

            goto LABEL_12;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)setOwnsFocus:(BOOL)a3
{
  if (self->_ownsFocus != a3)
  {
    self->_ownsFocus = a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100386A30;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)_isFocusMovementValidInContext:(id)a3
{
  id v4 = a3;
  if (([v4 focusHeading] & 0x20) != 0
    || ([v4 focusHeading] & 0x10) != 0
    || ([v4 focusHeading] & 0x100) != 0
    || ([v4 focusHeading] & 0x200) != 0)
  {
    id v6 = [(CarChromeViewController *)self _linearFocusMovementSequences];
    if ((unint64_t)[(__CFString *)v6 count] >= 2)
    {
      id v7 = sub_100015DB4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_log_type_t v36 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "We've produced more than 1 linearMovementSequence, this is not supported. sequences: %@", buf, 0xCu);
      }
    }
    unsigned __int8 v8 = [(__CFString *)v6 firstObject];
    int v9 = v8;
    if (!v8)
    {
      double v18 = sub_100015DB4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "We've don't have a linearMovementSequence. This should never happen. If you see this, check the implementation of _linearFocusMovementSequences.", buf, 2u);
      }
      BOOL v5 = 1;
      goto LABEL_43;
    }
    unsigned int v10 = [v8 items];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1003870BC;
    v33[3] = &unk_1012E69E8;
    unsigned __int8 v11 = v4;
    id v34 = v11;
    objc_super v12 = (char *)[v10 indexOfObjectPassingTest:v33];

    if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = sub_100015DB4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [v9 items];
        id v15 = v14;
        if (v14)
        {
          if ([v14 count])
          {
            uint64_t v16 = [v15 componentsJoinedByString:@", "];
            uint64_t v17 = +[NSString stringWithFormat:@"<%p> [%@]", v15, v16];
          }
          else
          {
            uint64_t v17 = +[NSString stringWithFormat:@"<%p> (empty)", v15];
          }
        }
        else
        {
          uint64_t v17 = @"<nil>";
        }

        char v29 = [v11 nextFocusedItem];
        *(_DWORD *)buf = 138412546;
        os_log_type_t v36 = v17;
        __int16 v37 = 2112;
        BOOL v38 = v29;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Focus engine tried to focus something which was not in our provided sequence of items. sequence.items: %@, nextItem: %@", buf, 0x16u);
      }
      BOOL v5 = 0;
      goto LABEL_42;
    }
    long long v19 = [v9 items];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100387110;
    v31[3] = &unk_1012E69E8;
    long long v20 = v11;
    __int16 v32 = v20;
    long long v21 = (char *)[v19 indexOfObjectPassingTest:v31];

    unsigned __int16 v22 = (unsigned __int16)[v20 focusHeading];
    if (v21 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      if ((v22 & 0x100) == 0)
      {
        CLLocationDegrees v23 = sub_100015DB4();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "The currently focused item is no longer present in the linear sequence, knob can focus anything.", buf, 2u);
        }

        goto LABEL_36;
      }
      if (v12)
      {
        uint64_t v28 = sub_100015DB4();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "We are coming to the app from the status bar, but focus engine is trying to focus an item that is not first in the provided linearMovementSequence. Denying this attempt and forcing a new pass.", buf, 2u);
        }

        [(CarChromeViewController *)self setNeedsFocusUpdate];
LABEL_35:
        BOOL v5 = 0;
LABEL_37:
        id v13 = v32;
LABEL_42:

        double v18 = v34;
LABEL_43:

        goto LABEL_44;
      }
    }
    else if (((v22 & 0x20) == 0 || v21 - 1 != v12) {
           && (([v20 focusHeading] & 0x10) == 0 || v21 + 1 != v12))
    }
    {
      CLLocationDegrees v24 = sub_100015DB4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v25 = [v20 previouslyFocusedItem];
        double v26 = [v20 nextFocusedItem];
        id v27 = [v20 focusHeading];
        *(_DWORD *)buf = 138412802;
        os_log_type_t v36 = v25;
        __int16 v37 = 2112;
        BOOL v38 = v26;
        __int16 v39 = 2048;
        id v40 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Focus engine tried to focus: %@ from current item: %@ with heading: %ld. This is not supported", buf, 0x20u);
      }
      goto LABEL_35;
    }
LABEL_36:
    BOOL v5 = 1;
    goto LABEL_37;
  }
  BOOL v5 = 1;
LABEL_44:

  return v5;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  if ([(CarChromeViewController *)self _isFocusMovementValidInContext:v4])
  {
    BOOL v5 = [(CarChromeViewController *)self topContext];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(CarChromeViewController *)self topContext];
      unsigned __int8 v8 = [v7 shouldUpdateFocusInContext:v4];
    }
    else
    {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSArray)preferredFocusEnvironments
{
  if (self->_ownsFocus)
  {
    id v3 = [(CarChromeViewController *)self topContext];
    p_restoreFocusForContext = &self->_restoreFocusForContext;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_restoreFocusForContext);

    if (v3 == WeakRetained)
    {
      char v6 = [(CarChromeViewController *)self lastFocusedItemsByContext];
      id v7 = [(CarChromeViewController *)self topContext];
      unsigned __int8 v8 = [v6 objectForKey:v7];

      if ([v8 canBecomeFocused])
      {
        int v9 = [v8 superview];

        if (v9)
        {
          objc_storeWeak((id *)p_restoreFocusForContext, 0);
          BOOL v38 = v8;
          unsigned int v10 = +[NSArray arrayWithObjects:&v38 count:1];
        }
        else
        {
          unsigned int v10 = &__NSArray0__struct;
        }

        goto LABEL_23;
      }
      objc_storeWeak((id *)&self->_restoreFocusForContext, 0);
    }
    uint64_t v30 = 0;
    objc_super v31 = &v30;
    uint64_t v32 = 0x3032000000;
    BOOL v33 = sub_100103B0C;
    id v34 = sub_100104610;
    id v35 = +[NSMutableArray array];
    unsigned __int8 v11 = [(CarChromeViewController *)self topContext];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(CarChromeViewController *)self topContext];
      id v14 = [v13 preferredCarFocusEnvironments];

      if ([v14 count])
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100387624;
        v29[3] = &unk_1012E6A10;
        v29[4] = &v30;
        id v15 = objc_retainBlock(v29);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100387634;
        v28[3] = &unk_1012E6A38;
        v28[4] = self;
        v28[5] = &v30;
        uint64_t v16 = objc_retainBlock(v28);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v17 = v14;
        id v18 = [v17 countByEnumeratingWithState:&v24 objects:v37 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v25;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v25 != v19) {
                objc_enumerationMutation(v17);
              }
              [*(id *)(*((void *)&v24 + 1) + 8 * i) ifFocusEnvironment:v15 ifRepresentativeItem:v16];
            }
            id v18 = [v17 countByEnumeratingWithState:&v24 objects:v37 count:16];
          }
          while (v18);
        }
      }
    }
    if ([(id)v31[5] count])
    {
      id v21 = [(id)v31[5] copy];
    }
    else
    {
      v23.receiver = self;
      v23.super_class = (Class)CarChromeViewController;
      id v21 = [(CarChromeViewController *)&v23 preferredFocusEnvironments];
    }
    unsigned int v10 = v21;
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)CarChromeViewController;
    unsigned int v10 = [(CarChromeViewController *)&v36 preferredFocusEnvironments];
  }
LABEL_23:

  return (NSArray *)v10;
}

- (NSArray)_linearFocusMovementSequences
{
  id v3 = [(CarChromeViewController *)self topContext];
  id v4 = [v3 carFocusOrderSequences];

  if ([v4 count])
  {
    [v4 count];
    BOOL v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_100103B0C;
    void v20[4] = sub_100104610;
    id v21 = +[NSMutableArray array];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100387994;
    v19[3] = &unk_1012E6A60;
    v19[4] = v20;
    char v6 = objc_retainBlock(v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1003879A4;
    v18[3] = &unk_1012E6A88;
    void v18[4] = self;
    void v18[5] = v20;
    id v7 = objc_retainBlock(v18);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100387B24;
    v13[3] = &unk_1012E6AF0;
    id v17 = v20;
    unsigned __int8 v8 = v6;
    id v15 = v8;
    int v9 = v7;
    id v16 = v9;
    id v10 = v5;
    id v14 = v10;
    [v4 enumerateObjectsWithOptions:2 usingBlock:v13];
    if ([v10 count]) {
      id v11 = [v10 copy];
    }
    else {
      id v11 = &__NSArray0__struct;
    }

    _Block_object_dispose(v20, 8);
  }
  else
  {
    id v11 = &__NSArray0__struct;
  }

  return (NSArray *)v11;
}

- (void)_reloadFocusContainerGuidesForContext:(id)a3
{
  id v4 = [(CarChromeViewController *)self topContext];
  char v5 = objc_opt_respondsToSelector();

  focusContainerGuideController = self->_focusContainerGuideController;
  if (v5)
  {
    unint64_t v7 = [(CarFocusContainerGuideController *)focusContainerGuideController activeEdges];
    unsigned __int8 v8 = [(CarChromeViewController *)self topContext];
    [v8 configureFocusContainerGuideController:self->_focusContainerGuideController];

    unint64_t v9 = [(CarFocusContainerGuideController *)self->_focusContainerGuideController activeEdges];
    id v10 = sub_100015DB4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      return;
    }
    id v11 = [(CarChromeViewController *)self topContext];
    if (!v11)
    {
      id v16 = @"<nil>";
      goto LABEL_14;
    }
    char v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      id v14 = [v11 performSelector:"accessibilityIdentifier"];
      id v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_9;
      }
    }
    id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_9:

LABEL_14:
    *(_DWORD *)buf = 138412802;
    id v18 = v16;
    __int16 v19 = 2048;
    unint64_t v20 = v7;
    __int16 v21 = 2048;
    unint64_t v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Top context: %@, configured focusContainer guides from: %lu, to %lu", buf, 0x20u);

    goto LABEL_15;
  }

  [(CarFocusContainerGuideController *)focusContainerGuideController setActiveEdges:15];
}

- (void)configureAccessoriesOverlay:(id)a3 forContext:(id)a4
{
  id v9 = a4;
  if (objc_opt_respondsToSelector()) {
    id v5 = [v9 showsSpeedLimit];
  }
  else {
    id v5 = 0;
  }
  char v6 = [(CarChromeViewController *)self accessoriesOverlay];
  [v6 setShowSpeedSign:v5];

  if (objc_opt_respondsToSelector()) {
    id v7 = [v9 showsHeadingIndicator];
  }
  else {
    id v7 = 0;
  }
  unsigned __int8 v8 = [(CarChromeViewController *)self accessoriesOverlay];
  [v8 setShowHeadingIndicator:v7];
}

- (void)reloadAccessoriesForContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[GroupAnimation animationForAnimatedFlag:v4];
  [(CarChromeViewController *)self _reloadAccessoriesForContext:v6 withAnimation:v7];

  [v7 runWithCurrentOptions];
}

- (void)_reloadAccessoriesForContext:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ChromeViewController *)self isCurrentContext:v6])
  {
    unsigned __int8 v8 = [v7 isAnimated];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100388314;
    v14[3] = &unk_1012E5D58;
    v14[4] = self;
    id v15 = v6;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003883A0;
    v12[3] = &unk_1012E6300;
    v12[4] = self;
    unsigned __int8 v13 = v8;
    [v7 addPreparation:v14 animations:v12 completion:0];
  }
  else
  {
    id v9 = sub_100015DB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412546;
      id v17 = v11;
      __int16 v18 = 2048;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ (%p) asked for accessories reload, but it is not the current context. Ignoring the call.", buf, 0x16u);
    }
  }
}

- (void)_reloadAccessoriesInsetsForContext:(id)a3
{
  id v9 = a3;
  BOOL v4 = ![(CarChromeViewController *)self _areAccessoriesHiddenForCurrentContext]&& [(CarChromeViewController *)self _shouldAccessoriesModifyMapInsetsForContext:v9];
  id v5 = [(ChromeViewController *)self overlayController];
  id v6 = [(CarChromeViewController *)self accessoriesOverlay];
  [v5 setViewportConstraintsEnabled:v4 forOverlay:v6];

  id v7 = [(ChromeViewController *)self overlayController];
  unsigned __int8 v8 = [(CarChromeViewController *)self accessoriesOverlay];
  [v7 setMapInsetsConstraintsEnabled:v4 forOverlay:v8];
}

- (void)reloadStatusBannerAnimated:(BOOL)a3
{
  id v4 = +[GroupAnimation animationForAnimatedFlag:a3];
  [(CarChromeViewController *)self _reloadStatusBannerWithAnimation:v4];
  [v4 runWithCurrentOptions];
}

- (void)_reloadStatusBannerWithAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(CarChromeViewController *)self topContext];
  unsigned __int8 v6 = [(ChromeViewController *)self isCurrentContext:v5];

  if (v6)
  {
    id v7 = [(CarChromeViewController *)self topContext];
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v8 = [(CarChromeViewController *)self topContext];
      unsigned int v9 = [v8 suppressesStatusBannerAnimation] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100388770;
    v17[3] = &unk_1012E5D08;
    v17[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003887B8;
    v15[3] = &unk_1012E6300;
    v15[4] = self;
    char v16 = [v4 isAnimated] & v9;
    [v4 addPreparation:v17 animations:v15 completion:0];
  }
  else
  {
    id v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(CarChromeViewController *)self topContext];
      char v12 = (objc_class *)objc_opt_class();
      unsigned __int8 v13 = NSStringFromClass(v12);
      id v14 = [(CarChromeViewController *)self topContext];
      *(_DWORD *)buf = 138412546;
      id v19 = v13;
      __int16 v20 = 2048;
      __int16 v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ (%p) asked for status banner reload, but it is not the current context. Ignoring the call.", buf, 0x16u);
    }
  }
}

- (BOOL)_hideStatusBanner
{
  id v3 = +[MapsOfflineUIHelper sharedHelper];
  if ([v3 isUsingOfflineMaps])
  {
    id v4 = [(CarChromeViewController *)self topContext];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [(CarChromeViewController *)self topContext];
      unsigned int v6 = [v5 hidesStatusBanner] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 ^ 1;
}

- (void)_updateAudioControls
{
  if (![(ChromeViewController *)self isSuppressed])
  {
    id v3 = [(CarChromeViewController *)self topContext];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [(CarChromeViewController *)self mapControlsOverlay];
      if (v4)
      {
        id v5 = v4;
        [v4 configuration];
        if (v27 == 2 || v28 == 2)
        {

          goto LABEL_27;
        }

        if (v29 == 2)
        {
LABEL_27:
          __int16 v18 = (__CFString *)[v3 audioSettingsCurrentState];
          id v19 = sub_100015DB4();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
LABEL_42:

            unsigned int v6 = [(CarChromeViewController *)self mapControlsOverlay];
            [v6 setAudioSettings:v18];
            goto LABEL_43;
          }
          __int16 v20 = v3;
          if (!v20)
          {
            long long v25 = @"<nil>";
            goto LABEL_41;
          }
          __int16 v21 = (objc_class *)objc_opt_class();
          unint64_t v22 = NSStringFromClass(v21);
          if (objc_opt_respondsToSelector())
          {
            objc_super v23 = [v20 performSelector:"accessibilityIdentifier"];
            long long v24 = v23;
            if (v23 && ![v23 isEqualToString:v22])
            {
              long long v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

              goto LABEL_34;
            }
          }
          long long v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_34:

LABEL_41:
          *(_DWORD *)buf = 134218242;
          objc_super v31 = v18;
          __int16 v32 = 2114;
          BOOL v33 = v25;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating mapControls.audioControls with audioSettings: %ld per request from context: %{public}@.", buf, 0x16u);

          goto LABEL_42;
        }
      }
      unsigned int v6 = sub_100015DB4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v13 = v3;
        if (!v13)
        {
          char v12 = @"<nil>";
          goto LABEL_38;
        }
        id v14 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v14);
        if (objc_opt_respondsToSelector())
        {
          char v16 = [v13 performSelector:"accessibilityIdentifier"];
          id v17 = v16;
          if (v16 && ![v16 isEqualToString:v15])
          {
            char v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

            goto LABEL_25;
          }
        }
        char v12 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_25:

LABEL_38:
        *(_DWORD *)buf = 138543362;
        objc_super v31 = v12;
        long long v26 = "%{public}@'s mapControls configuration doesn't have audio controls. Ignoring the call.";
        goto LABEL_39;
      }
LABEL_43:

      goto LABEL_44;
    }
    unsigned int v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    id v7 = v3;
    if (!v7)
    {
      char v12 = @"<nil>";
      goto LABEL_36;
    }
    unsigned __int8 v8 = (objc_class *)objc_opt_class();
    unsigned int v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        char v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_17;
      }
    }
    char v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_17:

LABEL_36:
    *(_DWORD *)buf = 138543362;
    objc_super v31 = v12;
    long long v26 = "%{public}@ does not respond to audioSettingsCurrentState. Ignoring the call";
LABEL_39:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);

    goto LABEL_43;
  }
  id v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Chrome is suppressed, ignoring call to update audio controls.", buf, 2u);
  }
LABEL_44:
}

- (void)_reloadMapControlsForContext:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ChromeViewController *)self isSuppressed])
  {
    unsigned __int8 v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will not reload map controls, chrome is suppressed", buf, 2u);
    }
LABEL_4:

    goto LABEL_12;
  }
  if (![(ChromeViewController *)self isCurrentContext:v6])
  {
    unsigned __int8 v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ (%p) asked for mapControls update, but it is not the current context. Ignoring the call.", buf, 0x16u);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    unsigned __int8 v18 = 0;
    unsigned __int8 v18 = [v7 isAnimated];
    objc_initWeak(&location, v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100389020;
    v12[3] = &unk_1012E6B18;
    v12[4] = self;
    id v13 = v6;
    id v14 = buf;
    objc_copyWeak(&v15, &location);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003891C8;
    v11[3] = &unk_1012E5D08;
    v11[4] = self;
    [v7 addPreparation:v12 animations:v11 completion:0];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v7 = +[GroupAnimation animationForAnimatedFlag:0];
    [(CarChromeViewController *)self _reloadMapControlsForContext:v6 withAnimation:v7];
    [v7 runWithCurrentOptions];
  }
LABEL_12:
}

- (void)_reloadMapControlsInsetsForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CarChromeViewController *)self mapControlsOverlay];
  BOOL v6 = (BOOL)v5;
  if (v5)
  {
    [v5 configuration];
    if (v11 == 0)
    {

      if (!v12)
      {
        BOOL v6 = 0;
        goto LABEL_8;
      }
    }
    else
    {
    }
    BOOL v6 = [(CarChromeViewController *)self _shouldMapControlsModifyMapInsetsForContext:v4];
  }
LABEL_8:
  id v7 = [(ChromeViewController *)self overlayController];
  unsigned __int8 v8 = [(CarChromeViewController *)self mapControlsOverlay];
  [v7 setViewportConstraintsEnabled:v6 forOverlay:v8];

  unsigned int v9 = [(ChromeViewController *)self overlayController];
  id v10 = [(CarChromeViewController *)self mapControlsOverlay];
  [v9 setMapInsetsConstraintsEnabled:v6 forOverlay:v10];
}

- (void)carMapControls:(id)a3 didTriggerAction:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 1uLL:
      [(CarChromeViewController *)self _navRecenterButtonPressed];
      goto LABEL_9;
    case 2uLL:
      [(CarChromeViewController *)self panButtonPressed];
      goto LABEL_9;
    case 3uLL:
      [(CarChromeViewController *)self zoomInButtonPressed];
      goto LABEL_9;
    case 4uLL:
      [(CarChromeViewController *)self zoomOutButtonPressed];
      goto LABEL_9;
    case 5uLL:
      [(CarChromeViewController *)self _toggle3DButtonPressed];
      goto LABEL_9;
    case 6uLL:
      [(CarChromeViewController *)self _toggleCameraPressed];
      goto LABEL_9;
    case 7uLL:
      [(CarChromeViewController *)self _reportIncidentPressed];
LABEL_9:
      id v6 = v7;
      break;
    default:
      break;
  }
}

- (void)_navRecenterButtonPressed
{
  [(CarChromeViewController *)self captureUserAction:4001];
  id v3 = [(ChromeViewController *)self navigationDisplay];
  [v3 recenterCameraAnimated:1];
}

- (void)panButtonPressed
{
  [(CarChromeViewController *)self captureUserAction:9007];
  id v2 = +[CarChromeModeCoordinator sharedInstance];
  [v2 displayMapPanning];
}

- (void)zoomInButtonPressed
{
  id v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "zoomIn button pressed", v4, 2u);
  }

  [(CarChromeViewController *)self zoomIn];
}

- (void)zoomIn
{
  [(CarChromeViewController *)self captureUserAction:1049];
  id v3 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v3 zoomInButtonPressed] & 1) == 0)
  {
    uint64_t v4 = [(ChromeViewController *)self navigationDisplay];
    if (v4
      && (id v5 = (void *)v4,
          +[CarDisplayController sharedInstance],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isCarAppSceneHostingNavigation],
          v6,
          v5,
          v7))
    {
      unsigned __int8 v8 = [(ChromeViewController *)self navigationDisplay];
      [v8 zoomIn];
    }
    else
    {
      unsigned __int8 v8 = [(ChromeViewController *)self mapView];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100389690;
      _OWORD v9[3] = &unk_1012E5D08;
      v9[4] = self;
      [v8 _zoomInWithCompletionHandler:v9];
    }
  }
  [(CarChromeViewController *)self updateZoomControls];
}

- (void)zoomOutButtonPressed
{
  id v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "zoomOut button pressed", v4, 2u);
  }

  [(CarChromeViewController *)self zoomOut];
}

- (void)zoomOut
{
  [(CarChromeViewController *)self captureUserAction:1050];
  id v3 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v3 zoomOutButtonPressed] & 1) == 0)
  {
    uint64_t v4 = [(ChromeViewController *)self navigationDisplay];
    if (v4
      && (id v5 = (void *)v4,
          +[CarDisplayController sharedInstance],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isCarAppSceneHostingNavigation],
          v6,
          v5,
          v7))
    {
      unsigned __int8 v8 = [(ChromeViewController *)self navigationDisplay];
      [v8 zoomOut];
    }
    else
    {
      unsigned __int8 v8 = [(ChromeViewController *)self mapView];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1003898AC;
      _OWORD v9[3] = &unk_1012E5D08;
      v9[4] = self;
      [v8 _zoomOutWithCompletionHandler:v9];
    }
  }
  [(CarChromeViewController *)self updateZoomControls];
}

- (void)_toggle3DButtonPressed
{
  if (CarDisplayIsDriveCameraEnabled())
  {
    unsigned int v3 = [(ChromeViewController *)self isRunningNavigationDisplay];
    uint64_t v4 = v3 ^ 1;
    if (v3) {
      uint64_t v5 = 5010;
    }
    else {
      uint64_t v5 = 5009;
    }
    [(CarChromeViewController *)self captureUserAction:v5];
    id v6 = [(CarChromeViewController *)self defaultMapSettings];
    [v6 setPitched:v4];

    [(ChromeViewController *)self setNeedsUpdateComponent:@"navigationDisplay" animated:1];
    [(ChromeViewController *)self updateComponentsIfNeeded];
    [(CarChromeViewController *)self _update3DButton];
    if ((v4 & 1) == 0)
    {
      id v13 = [(CarChromeViewController *)self defaultMapSettings];
      [v13 applyToMapViewAnimated:1 duration:0 completion:-1.0];
    }
  }
  else
  {
    unsigned int v7 = [(ChromeViewController *)self mapView];
    unsigned int v8 = [v7 _isPitched];

    if (v8) {
      uint64_t v9 = 5010;
    }
    else {
      uint64_t v9 = 5009;
    }
    [(CarChromeViewController *)self captureUserAction:v9];
    id v10 = [(CarChromeViewController *)self defaultMapSettings];
    [v10 setPitched:v8 ^ 1];

    long long v11 = [(ChromeViewController *)self mapView];
    uint64_t v12 = v11;
    if (v8) {
      [v11 _exit3DMode];
    }
    else {
      [v11 _enter3DMode];
    }

    [(CarChromeViewController *)self _update3DButton];
  }
}

- (void)_toggleCameraPressed
{
  unsigned int v3 = [(CarChromeViewController *)self topContext];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CarChromeViewController *)self topContext];
    [v5 toggleCameraPressed];

    [(CarChromeViewController *)self _updateCameraToggleButton];
  }
  else
  {
    id v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "_toggleCameraPressed called, because toggleCameraButton is present in map controls, but topContext doesn't respond to toggleCameraPressed", v7, 2u);
    }
  }
}

- (void)_reportIncidentPressed
{
  [(CarChromeViewController *)self captureUserAction:115 onTarget:1004];
  id v2 = +[CarChromeModeCoordinator sharedInstance];
  [v2 displayIncidentReporting];
}

- (void)_update3DButton
{
  if (CarDisplayIsDriveCameraEnabled())
  {
    unsigned int v3 = [(ChromeViewController *)self isRunningNavigationDisplay];
    char v4 = [(CarChromeViewController *)self mapControlsOverlay];
    uint64_t v5 = v4;
    if (v3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    [v4 setMode3DState:v6];

    id v14 = [(CarChromeViewController *)self mapControlsOverlay];
    [v14 setMode3DEnabled:1];
  }
  else
  {
    unsigned int v7 = [(ChromeViewController *)self mapView];
    unsigned int v8 = [v7 _isPitched];

    uint64_t v9 = [(CarChromeViewController *)self mapControlsOverlay];
    id v10 = v9;
    if (v8) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    [v9 setMode3DState:v11];

    id v14 = [(ChromeViewController *)self mapView];
    id v12 = [v14 _canEnter3DMode];
    id v13 = [(CarChromeViewController *)self mapControlsOverlay];
    [v13 setMode3DEnabled:v12];
  }
}

- (void)_updateCameraToggleButton
{
  unsigned int v3 = [(CarChromeViewController *)self mapControlsOverlay];
  if (!v3)
  {
    uint64_t v6 = 0;
LABEL_24:

    return;
  }
  char v4 = v3;
  [v3 configuration];
  if (v17 == 2 || v18 == 2)
  {

    goto LABEL_10;
  }

  if (v19 == 2)
  {
LABEL_10:
    if ([(ChromeViewController *)self isRunningNavigationDisplay])
    {
      unsigned int v7 = [(ChromeViewController *)self navigationDisplay];
      unsigned int v8 = (char *)[v7 currentCameraMode];

      uint64_t v9 = [(CarChromeViewController *)self mapControlsOverlay];
      id v10 = [v9 cameraToggleButtonState];

      if ((unint64_t)(v8 - 2) < 2)
      {
        id v13 = sub_100015DB4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_updateCameraToggleButton with NavigationCameraModeLowGuidance, which shouldn't happen.", buf, 2u);
        }

        unint64_t v12 = 0;
      }
      else
      {
        uint64_t v11 = 2;
        if (v8 != (char *)1) {
          uint64_t v11 = 0;
        }
        if (v8) {
          unint64_t v12 = v11;
        }
        else {
          unint64_t v12 = 1;
        }
      }
      id v14 = [(CarChromeViewController *)self mapControlsOverlay];
      [v14 setCameraToggleButtonState:v12];

      uint64_t v6 = sub_100015DB4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v15 = sub_100899F5C((unint64_t)v10);
        char v16 = sub_100899F5C(v12);
        *(_DWORD *)buf = 138412546;
        __int16 v21 = v15;
        __int16 v22 = 2112;
        objc_super v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_updateCameraToggleButton: updating from buttonState: %@ to state: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v6 = sub_100015DB4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "_updateCameraToggleButton called, but we are not running the navigation display.", buf, 2u);
      }
    }
    goto LABEL_24;
  }
}

- (void)_updateNudgerizer
{
  unsigned int v3 = [(CarChromeViewController *)self topContext];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CarChromeViewController *)self topContext];
    id v6 = [v5 allowKnobNudgeMapPanning];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(CarChromeViewController *)self nudgerizer];
  [v7 setActive:v6];
}

- (void)_updateRouteSelectionController
{
  BOOL v3 = [(CarChromeViewController *)self _canSelectAlternateRoutes];
  char v4 = [(ChromeViewController *)self mapView];
  [v4 _setCanSelectPOIs:v3];

  if (v3)
  {
    uint64_t v5 = [(CarChromeViewController *)self routeSelectionController];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [(CarChromeViewController *)self mapViewResponder];
  [v6 setTarget:v5];

  if (v3) {
  id v7 = [(CarChromeViewController *)self routeSelectionController];
  }
  [v7 setActive:v3];
}

- (void)updateZoomControls
{
  BOOL v3 = [(ChromeViewController *)self mapView];
  id v4 = [v3 _canZoomIn];
  uint64_t v5 = [(CarChromeViewController *)self mapControlsOverlay];
  [v5 setZoomInEnabled:v4];

  id v8 = [(ChromeViewController *)self mapView];
  id v6 = [v8 _canZoomOut];
  id v7 = [(CarChromeViewController *)self mapControlsOverlay];
  [v7 setZoomOutEnabled:v6];
}

- (void)_enableZoomGesture:(BOOL)a3
{
  id v3 = (id)a3;
  if (a3)
  {
    objc_initWeak(&location, self);
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    char v16 = sub_10038A2D4;
    uint64_t v17 = &unk_1012E6708;
    objc_copyWeak(&v18, &location);
    [(CarChromeViewController *)self enableDoubleTapRecognizerWithBlock:&v14];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CarChromeViewController *)self disableDoubleTapRecognizer];
  }
  uint64_t v5 = [(CarChromeViewController *)self topContext];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CarChromeViewController *)self topContext];
    id v3 = [v7 allowMapZoomAndRecentering];
  }
  id v8 = [(ChromeViewController *)self mapView];
  [v8 setZoomEnabled:v3];

  uint64_t v9 = [(ChromeViewController *)self mapView];
  id v10 = [v9 _doubleTapGestureRecognizer];
  [v10 setEnabled:0];

  id v11 = 0;
  if (v3) {
    id v11 = [(id)objc_opt_class() allowOneHandedZooming];
  }
  unint64_t v12 = [(ChromeViewController *)self mapView];
  id v13 = [v12 _oneHandedZoomGestureRecognizer];
  [v13 setEnabled:v11];
}

- (void)carStatusBannerDidTapBanner
{
  id v2 = +[UIApplication sharedMapsDelegate];
  [v2 interruptApplicationWithKind:21 userInfo:0 completionHandler:&stru_1012E6B58];
}

- (unint64_t)desiredRadarScreenshotTypes
{
  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  unint64_t v3 = [(ChromeViewController *)&v6 desiredRadarScreenshotTypes];
  if ([(ChromeViewController *)self isInactive]
    || ([(ChromeViewController *)self currentMapReplacementView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v3 |= 8uLL;
  }
  return v3;
}

- (id)_userActionDetailsWithMapItem:(id)a3 resultIndex:(int)a4
{
  return +[GEOPlaceActionDetails actionDetailsWithMapItem:a3 timestamp:*(void *)&a4 resultIndex:0.0];
}

- (int)_currentUsageTarget
{
  unint64_t v3 = [(CarChromeViewController *)self topContext];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(CarChromeViewController *)self topContext];
  int v6 = [v5 currentUsageTarget];

  return v6;
}

- (void)_captureUserActionBackToContext:(id)a3
{
  id v8 = a3;
  char v4 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v6 = 25;
    goto LABEL_5;
  }
  uint64_t v5 = [(CarChromeViewController *)self topContext];
  uint64_t v6 = (uint64_t)[v5 backButtonUsageActionToContext:v8];

  if (v6)
  {
LABEL_5:
    if (objc_opt_respondsToSelector())
    {
      id v7 = [v4 backButtonUsageEventValueToContext:v8];
    }
    else
    {
      id v7 = 0;
    }
    [(CarChromeViewController *)self captureUserAction:v6 eventValue:v7];
  }
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4
{
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = +[MKMapService sharedService];
  [v8 captureUserAction:v6 onTarget:v5 eventValue:v7];
}

- (void)captureUserAction:(int)a3
{
}

- (void)captureUserAction:(int)a3 eventValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(CarChromeViewController *)self captureUserAction:v4 onTarget:[(CarChromeViewController *)self _currentUsageTarget] eventValue:v6];
}

- (void)captureUserAction:(int)a3 mapItem:(id)a4
{
}

- (void)captureUserAction:(int)a3 mapItem:(id)a4 atResultIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v11 = a4;
  uint64_t v8 = [(CarChromeViewController *)self _currentUsageTarget];
  if (v11 || (v5 & 0x80000000) == 0)
  {
    uint64_t v9 = [(CarChromeViewController *)self _userActionDetailsWithMapItem:v11 resultIndex:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = +[MKMapService sharedService];
  [v10 captureUserAction:v6 onTarget:v8 eventValue:0 placeActionDetails:v9];
}

- (void)captureUserAction:(int)a3 selectedRouteIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = [(CarChromeViewController *)self _currentUsageTarget];
  id v8 = +[GEORouteDetails routeDetailsWithResultIndex:v4];
  id v7 = +[MKMapService sharedService];
  [v7 captureUserAction:v5 onTarget:v6 eventValue:0 routeDetails:v8];
}

- (void)captureUserActionChangedTrackingMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    [(CarChromeViewController *)self captureUserAction:dword_100F6F030[a3]];
  }
}

- (void)captureUserActionPannedInDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3) {
    [(CarChromeViewController *)self captureUserAction:dword_100F6F040[a3 - 1]];
  }
}

- (void)captureUserActionSelectedSearchCategory:(id)a3 categoriesDisplayed:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CarChromeViewController *)self _currentUsageTarget];
  id v10 = +[MKMapService sharedService];
  uint64_t v9 = [v7 displayString];
  [v10 captureUserAction:2004 onTarget:v8 eventValue:v9 categoriesDisplayed:v6 categorySelected:v7];
}

- (BOOL)canShowCards
{
  return 1;
}

- (id)_desiredCards
{
  if ([(CarChromeViewController *)self canShowCards])
  {
    unint64_t v3 = [(CarChromeViewController *)self topContext];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [(CarChromeViewController *)self topContext];
      uint64_t v5 = [v4 desiredCards];
    }
    else
    {
      uint64_t v5 = &__NSArray0__struct;
    }
  }
  else
  {
    uint64_t v5 = &__NSArray0__struct;
  }

  return v5;
}

- (void)updateCardsForContext:(id)a3 animated:(BOOL)a4
{
}

- (void)updateCardsForContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateCardsForContext:(id)a3 withAnimation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(ChromeViewController *)self isCurrentContext:v8])
  {
    id v11 = sub_100577A0C();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_16:

      __int16 v21 = [(CarChromeViewController *)self topContext];
      __int16 v22 = [(CarChromeViewController *)self _desiredCards];
      if (objc_opt_respondsToSelector()) {
        [v21 chromeDidStartConfiguringCards:v22];
      }
      objc_initWeak((id *)buf, self);
      objc_super v23 = [(CarChromeViewController *)self cardsOverlay];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10038ADE4;
      v31[3] = &unk_1012E5D08;
      void v31[4] = self;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10038ADF0;
      v26[3] = &unk_1012E6B80;
      v26[4] = self;
      objc_copyWeak(&v30, (id *)buf);
      id v24 = v21;
      id v27 = v24;
      id v25 = v22;
      id v28 = v25;
      id v29 = v10;
      [v23 performBatchUpdates:v31 withAnimation:v9 completion:v26];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);

      goto LABEL_19;
    }
    unint64_t v12 = self;
    if (!v12)
    {
      uint64_t v17 = @"<nil>";
      goto LABEL_15;
    }
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [(CarChromeViewController *)v12 performSelector:"accessibilityIdentifier"];
      char v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        uint64_t v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_9;
      }
    }
    uint64_t v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

LABEL_15:
    *(_DWORD *)buf = 138543362;
    BOOL v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Chrome started configuring cards.", buf, 0xCu);

    goto LABEL_16;
  }
  id v18 = sub_100015DB4();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    __int16 v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    BOOL v33 = v20;
    __int16 v34 = 2048;
    id v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@ (%p) asked for card update, but it is not the current context. Ignoring the call.", buf, 0x16u);
  }
  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_19:
}

- (void)_reloadCardOverlayConstraintsIfNeeded
{
  v48 = [(ChromeViewController *)self overlayController];
  unint64_t v3 = [v48 contentLayoutGuide];
  if (v3)
  {
    BOOL didSetupOverlayConstraints = self->_didSetupOverlayConstraints;

    if (!didSetupOverlayConstraints)
    {
      self->_BOOL didSetupOverlayConstraints = 1;
      uint64_t v5 = [(ChromeViewController *)self overlayController];
      id v6 = [v5 contentLayoutGuide];

      __int16 v49 = [(UILayoutGuide *)self->_statusBannerLayoutGuide topAnchor];
      __int16 v47 = [v6 topAnchor];
      v46 = [v49 constraintEqualToAnchor:v47];
      v50[0] = v46;
      __int16 v45 = [(UILayoutGuide *)self->_statusBannerLayoutGuide leadingAnchor];
      uint64_t v44 = [v6 leadingAnchor];
      unint64_t v43 = [v45 constraintEqualToAnchor:v44];
      v50[1] = v43;
      v42 = [(UILayoutGuide *)self->_statusBannerLayoutGuide trailingAnchor];
      CFStringRef v41 = [v6 trailingAnchor];
      id v40 = [v42 constraintEqualToAnchor:v41];
      v50[2] = v40;
      __int16 v39 = [(UILayoutGuide *)self->_accessoriesCompactLayoutGuide leadingAnchor];
      BOOL v38 = [v6 leadingAnchor];
      __int16 v37 = [v39 constraintEqualToAnchor:v38];
      v50[3] = v37;
      objc_super v36 = [(UILayoutGuide *)self->_accessoriesCompactLayoutGuide trailingAnchor];
      id v35 = [v6 trailingAnchor];
      __int16 v34 = [v36 constraintEqualToAnchor:v35];
      v50[4] = v34;
      BOOL v33 = [(UILayoutGuide *)self->_accessoriesCompactLayoutGuide topAnchor];
      __int16 v32 = [v6 topAnchor];
      LODWORD(v7) = 1148846080;
      objc_super v31 = [v33 constraintGreaterThanOrEqualToAnchor:v32 constant:0.0 priority:v7];
      v50[5] = v31;
      id v30 = [(UILayoutGuide *)self->_accessoriesCompactLayoutGuide bottomAnchor];
      id v29 = [v6 bottomAnchor];
      id v28 = [v30 constraintEqualToAnchor:v29];
      v50[6] = v28;
      id v27 = [(UILayoutGuide *)self->_statusBannerLayoutGuide bottomAnchor];
      long long v26 = [(UILayoutGuide *)self->_accessoriesCompactLayoutGuide topAnchor];
      id v25 = [v27 constraintEqualToAnchor:v26 constant:8.0];
      v50[7] = v25;
      id v24 = [(UILayoutGuide *)self->_cardsLayoutGuide leadingAnchor];
      objc_super v23 = [v6 leadingAnchor];
      __int16 v22 = [v24 constraintEqualToAnchor:v23];
      v50[8] = v22;
      __int16 v21 = [(UILayoutGuide *)self->_cardsLayoutGuide trailingAnchor];
      __int16 v20 = [v6 trailingAnchor];
      uint64_t v19 = [v21 constraintEqualToAnchor:v20];
      v50[9] = v19;
      id v18 = [(UILayoutGuide *)self->_cardsLayoutGuide topAnchor];
      id v8 = [v6 topAnchor];
      LODWORD(v9) = 1148846080;
      id v10 = [v18 constraintGreaterThanOrEqualToAnchor:v8 constant:0.0 priority:v9];
      v50[10] = v10;
      id v11 = [(UILayoutGuide *)self->_cardsLayoutGuide bottomAnchor];
      unint64_t v12 = [v6 bottomAnchor];
      id v13 = [v11 constraintEqualToAnchor:v12];
      v50[11] = v13;
      id v14 = [(UILayoutGuide *)self->_statusBannerLayoutGuide bottomAnchor];
      uint64_t v15 = [(UILayoutGuide *)self->_cardsLayoutGuide topAnchor];
      char v16 = [v14 constraintEqualToAnchor:v15 constant:8.0];
      v50[12] = v16;
      uint64_t v17 = +[NSArray arrayWithObjects:v50 count:13];
      +[NSLayoutConstraint activateConstraints:v17];
    }
  }
  else
  {
  }
}

- (void)_reloadCardsAnimated:(BOOL)a3
{
  [(CarChromeViewController *)self _reloadCardOverlayConstraintsIfNeeded];
  if (![(ChromeViewController *)self isSuppressed])
  {
    id v11 = [(ChromeViewController *)self overlayController];
    unint64_t v12 = [v11 overlayContentView];

    if (v12)
    {
      id v13 = [(CarChromeViewController *)self cardsOverlay];
      [v13 dismissAllCardsAnimated:0 completion:0];

      id v14 = [(ChromeViewController *)self overlayController];
      uint64_t v15 = [v14 overlayContentView];
      [(id)v15 setAccessibilityViewIsModal:0];

      char v16 = [(CarChromeViewController *)self topContext];
      LOBYTE(v15) = objc_opt_respondsToSelector();

      if (v15)
      {
        uint64_t v17 = [(CarChromeViewController *)self topContext];
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          uint64_t v4 = [(CarChromeViewController *)self _desiredCards];
          if ([v4 count])
          {
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            uint64_t v4 = v4;
            id v19 = [v4 countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v46;
              do
              {
                for (i = 0; i != v20; i = (char *)i + 1)
                {
                  if (*(void *)v46 != v21) {
                    objc_enumerationMutation(v4);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                  id v24 = [(CarChromeViewController *)self cardsOverlay];
                  v44[0] = _NSConcreteStackBlock;
                  v44[1] = 3221225472;
                  v44[2] = sub_10038BC18;
                  v44[3] = &unk_1012E6BA8;
                  v44[4] = self;
                  v44[5] = v23;
                  [v24 configureCard:v23 withBlock:v44];
                }
                id v20 = [v4 countByEnumeratingWithState:&v45 objects:v49 count:16];
              }
              while (v20);
            }

            id v25 = [(CarChromeViewController *)self cardsOverlay];
            [v25 presentAllCardsAnimated:0 completion:0];
          }
          goto LABEL_58;
        }
        uint64_t v4 = sub_100577A0C();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        __int16 v37 = self;
        if (!v37)
        {
          id v10 = @"<nil>";
          goto LABEL_55;
        }
        BOOL v38 = (objc_class *)objc_opt_class();
        __int16 v39 = NSStringFromClass(v38);
        if (objc_opt_respondsToSelector())
        {
          id v40 = [(CarChromeViewController *)v37 performSelector:"accessibilityIdentifier"];
          CFStringRef v41 = v40;
          if (v40 && ![v40 isEqualToString:v39])
          {
            id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v39, v37, v41];

            goto LABEL_47;
          }
        }
        id v10 = +[NSString stringWithFormat:@"%@<%p>", v39, v37];
LABEL_47:

LABEL_55:
        *(_DWORD *)buf = 138543362;
        __int16 v51 = v10;
        goto LABEL_56;
      }
      uint64_t v4 = sub_100577A0C();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        goto LABEL_58;
      }
      objc_super v31 = self;
      if (!v31)
      {
        id v10 = @"<nil>";
        goto LABEL_52;
      }
      __int16 v32 = (objc_class *)objc_opt_class();
      BOOL v33 = NSStringFromClass(v32);
      if (objc_opt_respondsToSelector())
      {
        __int16 v34 = [(CarChromeViewController *)v31 performSelector:"accessibilityIdentifier"];
        id v35 = v34;
        if (v34 && ![v34 isEqualToString:v33])
        {
          id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

          goto LABEL_37;
        }
      }
      id v10 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_37:

LABEL_52:
      *(_DWORD *)buf = 138543362;
      __int16 v51 = v10;
LABEL_56:
      v42 = v4;
      os_log_type_t v43 = OS_LOG_TYPE_ERROR;
      goto LABEL_57;
    }
    uint64_t v4 = sub_100577A0C();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_58;
    }
    long long v26 = self;
    if (!v26)
    {
      id v10 = @"<nil>";
      goto LABEL_49;
    }
    id v27 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      id v29 = [(CarChromeViewController *)v26 performSelector:"accessibilityIdentifier"];
      id v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_29;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_29:

LABEL_49:
    *(_DWORD *)buf = 138543362;
    __int16 v51 = v10;
    objc_super v36 = "[%{public}@] Will not reload cards, no overlay content view available.";
    goto LABEL_50;
  }
  uint64_t v4 = sub_100577A0C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = self;
    if (!v5)
    {
      id v10 = @"<nil>";
      goto LABEL_39;
    }
    id v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(CarChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_9;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

LABEL_39:
    *(_DWORD *)buf = 138543362;
    __int16 v51 = v10;
    objc_super v36 = "[%{public}@] Will not reload cards, suppressed.";
LABEL_50:
    v42 = v4;
    os_log_type_t v43 = OS_LOG_TYPE_INFO;
LABEL_57:
    _os_log_impl((void *)&_mh_execute_header, v42, v43, v36, buf, 0xCu);
  }
LABEL_58:
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CarChromeViewController *)self topContext];
  char v6 = objc_opt_respondsToSelector();

  double v7 = sub_100577A0C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v6 & 1) == 0)
  {
    if (!v8)
    {
LABEL_23:

      long long v26 = [(CarChromeViewController *)self _previousContext];
      [(CarChromeViewController *)self _captureUserActionBackToContext:v26];

      uint64_t v23 = +[CarChromeModeCoordinator sharedInstance];
      id v27 = [(CarChromeViewController *)self topContext];
      [v23 popFromContext:v27];

      goto LABEL_24;
    }
    uint64_t v15 = self;
    if (!v15)
    {
      id v20 = @"<nil>";
      goto LABEL_22;
    }
    char v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      char v18 = [(CarChromeViewController *)v15 performSelector:"accessibilityIdentifier"];
      id v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        id v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_17;
      }
    }
    id v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_17:

LABEL_22:
    id v24 = [(CarChromeViewController *)v15 topContext];
    id v25 = [(ChromeViewController *)v15 contexts];
    *(_DWORD *)buf = 138543874;
    id v29 = v20;
    __int16 v30 = 2112;
    objc_super v31 = v24;
    __int16 v32 = 2112;
    BOOL v33 = v25;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] CardView closeButton accessory tapped, chrome will pop current context. Top Context: %@ All Contexts : %@", buf, 0x20u);

    goto LABEL_23;
  }
  if (v8)
  {
    double v9 = self;
    if (!v9)
    {
      id v14 = @"<nil>";
      goto LABEL_19;
    }
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v12 = [(CarChromeViewController *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_9;
      }
    }
    id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_9:

LABEL_19:
    uint64_t v21 = [(CarChromeViewController *)v9 topContext];
    __int16 v22 = [(ChromeViewController *)v9 contexts];
    *(_DWORD *)buf = 138543874;
    id v29 = v14;
    __int16 v30 = 2112;
    objc_super v31 = v21;
    __int16 v32 = 2112;
    BOOL v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] CardView closeButton accessory tapped, top context will handle responding. Top Context: %@ All Contexts : %@", buf, 0x20u);
  }
  uint64_t v23 = [(CarChromeViewController *)self topContext];
  [v23 carCardViewCloseButtonTapped:v4];
LABEL_24:
}

- (void)carCardView:(id)a3 chevronButtonSelected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CarChromeViewController *)self topContext];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = sub_100577A0C();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      uint64_t v17 = [(CarChromeViewController *)self topContext];
      [v17 carCardView:v6 chevronButtonSelected:v7];

      goto LABEL_13;
    }
    id v11 = self;
    if (!v11)
    {
      char v16 = @"<nil>";
      goto LABEL_11;
    }
    unint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      id v14 = [(CarChromeViewController *)v11 performSelector:"accessibilityIdentifier"];
      uint64_t v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        char v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_9;
      }
    }
    char v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    id v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] CardView chevronButton accessory tapped, top context will handle responding.", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_13:
}

- (void)carCardView:(id)a3 didChangeFocus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CarChromeViewController *)self topContext];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = sub_100577A0C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      char v16 = [(CarChromeViewController *)self topContext];
      [v16 carCardView:v6 didChangeFocus:v4];

      goto LABEL_13;
    }
    id v10 = self;
    if (!v10)
    {
      uint64_t v15 = @"<nil>";
      goto LABEL_11;
    }
    id v11 = (objc_class *)objc_opt_class();
    unint64_t v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      id v13 = [(CarChromeViewController *)v10 performSelector:"accessibilityIdentifier"];
      id v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        uint64_t v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_9;
      }
    }
    uint64_t v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    char v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] CardView became focused, topContext will handle responding.", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_13:
}

- (void)setNeedsAutohideBehaviorUpdateForContext:(id)a3
{
  id v4 = a3;
  [(CarChromeViewController *)self _requestAutohideBehaviorForContext:v4];
  unsigned int v5 = [(ChromeViewController *)self isTopContext:v4];

  if (v5)
  {
    [(CarChromeViewController *)self _updateAutohideBehavior];
  }
}

- (void)_requestAutohideBehaviorForContext:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    id v4 = [v5 autohideBehavior];
  }
  else {
    id v4 = 0;
  }
  if (v4 != (id)[(CarChromeViewController *)self _autohidingBehaviorForContext:v5]) {
    [(CarChromeViewController *)self _setAutohideBehavior:v4 forContext:v5];
  }
}

- (BOOL)_autohidingContentIsHiddenForContext:(id)a3
{
  unint64_t v3 = [(CarChromeViewController *)self chromeViewItemForContext:a3 createIfNeeded:0];
  unsigned __int8 v4 = [v3 isAutohidingContentHidden];

  return v4;
}

- (void)_recordAutohidingContentIsHidden:(BOOL)a3 forContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_100015DB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v8 = @"NO";
    if (v4) {
      char v8 = @"YES";
    }
    char v9 = v8;
    id v10 = v6;
    if (!v10)
    {
      uint64_t v15 = @"<nil>";
      goto LABEL_12;
    }
    id v11 = (objc_class *)objc_opt_class();
    unint64_t v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      id v13 = [v10 performSelector:"accessibilityIdentifier"];
      id v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        uint64_t v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_10;
      }
    }
    uint64_t v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138412546;
    char v18 = v9;
    __int16 v19 = 2112;
    id v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "_setAutohidingContentIsHidden (hidden:%@, context:%@", buf, 0x16u);
  }
  char v16 = [(CarChromeViewController *)self chromeViewItemForContext:v6 createIfNeeded:1];
  [v16 setAutohidingContentIsHidden:v4];
}

- (int64_t)_autohidingBehaviorForContext:(id)a3
{
  id v4 = a3;
  if ([(CarChromeViewController *)self isForcingAutohideBehavior])
  {
    id v5 = [(CarChromeViewController *)self forcedAutohideBehavior];
  }
  else
  {
    id v6 = [(CarChromeViewController *)self chromeViewItemForContext:v4 createIfNeeded:0];
    id v7 = v6;
    if (v6) {
      id v5 = [v6 autohideBehavior];
    }
    else {
      id v5 = 0;
    }
  }
  return (int64_t)v5;
}

- (void)_setAutohideBehavior:(int64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  id v7 = sub_100015DB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = v6;
    if (!v8)
    {
      id v13 = @"<nil>";
      goto LABEL_10;
    }
    char v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [v8 performSelector:"accessibilityIdentifier"];
      unint64_t v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 134218242;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    char v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "_setAutohideBehaviour (behavior:%ld, context:%@", buf, 0x16u);
  }
  id v14 = [(CarChromeViewController *)self chromeViewItemForContext:v6 createIfNeeded:1];
  [v14 setAutohideBehavior:a3];
}

- (void)_updateAutohideBehavior
{
  if (self->_isCurrentlyVisible)
  {
    unint64_t v3 = [(CarChromeViewController *)self topContext];
    int64_t v4 = [(CarChromeViewController *)self _autohidingBehaviorForContext:v3];

    switch(v4)
    {
      case -1:
      case 0:
        break;
      case 1:
        id v11 = sub_100015DB4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)__int16 v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will set autohide to always", v17, 2u);
        }

        unint64_t v12 = [(CarChromeViewController *)self topContext];
        unsigned __int8 v13 = [(CarChromeViewController *)self _autohidingContentIsHiddenForContext:v12];

        if (v13) {
          goto LABEL_8;
        }
        id v8 = self;
        uint64_t v9 = 1;
        goto LABEL_7;
      case 2:
      case 3:
        id v10 = sub_100015DB4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Will set autohide to when idle/toggle with initial idle hiding", v15, 2u);
        }

        [(CarChromeViewController *)self _addAutohideGestureRecognizer];
        [(CarChromeViewController *)self _startAutohideIdleTimerIfStopped];
        return;
      case 4:
        id v14 = sub_100015DB4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)int64_t v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will set autohide to toggle", v16, 2u);
        }

        [(CarChromeViewController *)self _addAutohideGestureRecognizer];
        return;
      default:
        return;
    }
  }
  id v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will set autohide to never", buf, 2u);
  }

  id v6 = [(CarChromeViewController *)self topContext];
  unsigned int v7 = [(CarChromeViewController *)self _autohidingContentIsHiddenForContext:v6];

  if (v7)
  {
    id v8 = self;
    uint64_t v9 = 0;
LABEL_7:
    [(CarChromeViewController *)v8 setAutohidingContentHiddenForCurrentContext:v9];
  }
LABEL_8:
  [(CarChromeViewController *)self _stopAutohideIdleTimer];
  [(CarChromeViewController *)self _removeAutohideGestureRecognizer];
}

- (void)_autohideBecameIdle
{
  [(CarChromeViewController *)self _stopAutohideIdleTimer];
  unint64_t v3 = +[CarDisplayController sharedInstance];
  int64_t v4 = [v3 screen];
  unsigned __int8 v5 = [v4 _isCarPlayHumanPresenceInRange];

  if ((v5 & 1) == 0)
  {
    id v6 = [(CarChromeViewController *)self topContext];
    int64_t v7 = [(CarChromeViewController *)self _autohidingBehaviorForContext:v6];

    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [(CarChromeViewController *)self setAutohidingContentHiddenForCurrentContext:1];
    }
  }
}

- (void)_autohideGestureRecognizerDetectedTap:(id)a3
{
  if ([(UITapGestureRecognizer *)self->_autohideTapRecognizer state] == (id)3)
  {
    int64_t v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Autohide gesture recognizer fired", buf, 2u);
    }

    unsigned __int8 v5 = [(CarChromeViewController *)self topContext];
    unint64_t v6 = [(CarChromeViewController *)self _autohidingBehaviorForContext:v5];

    if (v6 <= 1)
    {
      unint64_t v12 = sub_100015DB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned __int8 v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Autohide gesture recognizer tried to show/hide content, but it shouldn't be installed.", v13, 2u);
      }
    }
    else
    {
      [(CarChromeViewController *)self _stopAutohideIdleTimer];
      int64_t v7 = [(CarChromeViewController *)self topContext];
      unsigned int v8 = [(CarChromeViewController *)self _autohidingContentIsHiddenForContext:v7];

      if (v8) {
        uint64_t v9 = 1039;
      }
      else {
        uint64_t v9 = 1038;
      }
      [(CarChromeViewController *)self captureUserAction:v9];
      [(CarChromeViewController *)self setAutohidingContentHiddenForCurrentContext:v8 ^ 1];
      if (v6 == 2)
      {
        id v10 = [(CarChromeViewController *)self topContext];
        unsigned __int8 v11 = [(CarChromeViewController *)self _autohidingContentIsHiddenForContext:v10];

        if ((v11 & 1) == 0) {
          [(CarChromeViewController *)self _restartAutohideIdleTimer];
        }
      }
    }
  }
}

- (void)_humanPresenceDidChange
{
  unint64_t v3 = +[CarDisplayController sharedInstance];
  id v7 = [v3 screen];

  if ([v7 _isCarPlayHumanPresenceInRange])
  {
    [(CarChromeViewController *)self setAutohidingContentHiddenForCurrentContext:0];
    [(CarChromeViewController *)self _stopAutohideIdleTimer];
  }
  else
  {
    int64_t v4 = [(CarChromeViewController *)self topContext];
    if ((id)[(CarChromeViewController *)self _autohidingBehaviorForContext:v4] == (id)2)
    {
      unsigned __int8 v5 = [(CarChromeViewController *)self topContext];
      unsigned __int8 v6 = [(CarChromeViewController *)self _autohidingContentIsHiddenForContext:v5];

      if ((v6 & 1) == 0) {
        [(CarChromeViewController *)self _restartAutohideIdleTimer];
      }
    }
    else
    {
    }
  }
}

- (void)interruptAutohideForIncidentalInteraction
{
  if (self->_isCurrentlyVisible)
  {
    unint64_t v3 = [(CarChromeViewController *)self topContext];
    int64_t v4 = [(CarChromeViewController *)self _autohidingBehaviorForContext:v3];

    if (v4 == 4)
    {
      [(CarChromeViewController *)self setAutohidingContentHiddenForCurrentContext:0];
    }
    else
    {
      if (v4 == 3)
      {
        if (!self->_autohideIdleTimer) {
          return;
        }
      }
      else
      {
        if (v4 != 2) {
          return;
        }
        [(CarChromeViewController *)self setAutohidingContentHiddenForCurrentContext:0];
      }
      [(CarChromeViewController *)self _restartAutohideIdleTimer];
    }
  }
}

- (void)setAutohidingContentHiddenForCurrentContext:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(CarChromeViewController *)self topContext];
  int64_t v6 = [(CarChromeViewController *)self _autohidingBehaviorForContext:v5];

  if (!v3 || (self->_isCurrentlyVisible ? (BOOL v7 = v6 == 0) : (BOOL v7 = 1), !v7))
  {
    unsigned int v8 = [(CarChromeViewController *)self topContext];
    int64_t v9 = [(CarChromeViewController *)self _autohidingBehaviorForContext:v8];

    if (v3 || v9 != 1)
    {
      id v10 = [(CarChromeViewController *)self topContext];
      unsigned int v11 = [(CarChromeViewController *)self _autohidingContentIsHiddenForContext:v10];

      if (v11 != v3)
      {
        unint64_t v12 = [(CarChromeViewController *)self topContext];
        [(CarChromeViewController *)self _recordAutohidingContentIsHidden:v3 forContext:v12];

        unsigned __int8 v13 = +[CarDisplayController sharedInstance];
        id v14 = [v13 window];
        uint64_t v15 = [v14 windowScene];
        int64_t v16 = [v15 focusSystem];
        __int16 v17 = [v16 focusedItem];

        if (!self->_ownsFocus || v3 || v17)
        {
          if (!self->_ownsFocus || !v17 || ([v17 canBecomeFocused] & 1) != 0)
          {
LABEL_14:
            __int16 v19 = +[GroupAnimation animation];
            id v20 = [(CarChromeViewController *)self topContext];
            if (v3)
            {
              char v21 = objc_opt_respondsToSelector();

              if (v21)
              {
                __int16 v22 = [(CarChromeViewController *)self topContext];
                [v22 hideAutohidingContentWithAnimation:v19];
LABEL_23:
              }
            }
            else
            {
              int v23 = objc_opt_respondsToSelector();

              if (v23)
              {
                __int16 v22 = [(CarChromeViewController *)self topContext];
                [v22 showAutohidingContentWithAnimation:v19];
                goto LABEL_23;
              }
            }
            [(ChromeViewController *)self setNeedsUpdateComponent:@"mapcontrols" animated:1];
            [(ChromeViewController *)self setNeedsUpdateComponent:@"accessories" animated:1];
            [(ChromeViewController *)self updateComponentsIfNeededWithAnimation:v19];
            id v24 = [(ChromeViewController *)self navigationDisplay];
            objc_initWeak(&location, v24);

            objc_initWeak(&from, v19);
            id v25 = _NSConcreteStackBlock;
            uint64_t v26 = 3221225472;
            id v27 = sub_10038D364;
            id v28 = &unk_1012E6BD0;
            objc_copyWeak(&v29, &location);
            objc_copyWeak(&v30, &from);
            [v19 addPreparation:&v25 animations:0 completion:0];
            [v19 runWithCurrentOptions:v25, v26, v27, v28];
            objc_destroyWeak(&v30);
            objc_destroyWeak(&v29);
            objc_destroyWeak(&from);
            objc_destroyWeak(&location);

            return;
          }
        }
        else
        {
          char v18 = [(CarChromeViewController *)self topContext];
          objc_storeWeak((id *)&self->_restoreFocusForContext, v18);
        }
        [(CarChromeViewController *)self setNeedsFocusUpdate];
        [(CarChromeViewController *)self updateFocusIfNeeded];
        goto LABEL_14;
      }
    }
  }
}

- (BOOL)isAutohidingContentHiddenForCurrentContext
{
  id v2 = self;
  BOOL v3 = [(CarChromeViewController *)self topContext];
  LOBYTE(v2) = [(CarChromeViewController *)v2 _autohidingContentIsHiddenForContext:v3];

  return (char)v2;
}

- (BOOL)isAutohidingContentHiddenForContext:(id)a3
{
  id v4 = a3;
  if ([(ChromeViewController *)self isCurrentContext:v4]) {
    BOOL v5 = [(CarChromeViewController *)self _autohidingContentIsHiddenForContext:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_areAccessoriesHiddenForCurrentContext
{
  id v2 = self;
  BOOL v3 = [(CarChromeViewController *)self topContext];
  LOBYTE(v2) = [(CarChromeViewController *)v2 _areAccessoriesHiddenForContext:v3];

  return (char)v2;
}

- (BOOL)_areAccessoriesHiddenForContext:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 accessoriesHidingBehavior];
    if (v5 == (id)3)
    {
      unsigned __int8 v6 = [(ChromeViewController *)self isCurrentContext:v4];
      goto LABEL_8;
    }
    if (v5 == (id)2)
    {
      unsigned __int8 v7 = [(CarChromeViewController *)self isAutohidingContentHiddenForContext:v4];
      goto LABEL_10;
    }
    if (v5 == (id)1)
    {
      unsigned __int8 v6 = [(CarChromeViewController *)self isAutohidingContentHiddenForContext:v4];
LABEL_8:
      unsigned __int8 v7 = v6 ^ 1;
      goto LABEL_10;
    }
  }
  unsigned __int8 v7 = 1;
LABEL_10:

  return v7;
}

- (void)_startAutohideIdleTimerIfStopped
{
  if (!self->_autohideIdleTimer) {
    [(CarChromeViewController *)self _restartAutohideIdleTimer];
  }
}

- (void)restartAutohideIdleTimerIfStarted
{
  if (self->_autohideIdleTimer) {
    [(CarChromeViewController *)self _restartAutohideIdleTimer];
  }

  [(CarChromeViewController *)self _restartNavigationObscuredTimeout];
}

- (void)_restartAutohideIdleTimer
{
  [(CarChromeViewController *)self _stopAutohideIdleTimer];
  id v3 = +[NSNumber numberWithDouble:10.0];
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:@"CarAutoHideContentTimeInterval"];

  if (v5) {
    unsigned __int8 v6 = v5;
  }
  else {
    unsigned __int8 v6 = v3;
  }
  id v7 = v6;

  [v7 doubleValue];
  double v9 = v8;

  id v10 = [(CarChromeViewController *)self topContext];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    unsigned int v11 = [(CarChromeViewController *)self topContext];
    [v11 autohideIdlenessInterval];
    double v9 = v12;
  }
  unsigned __int8 v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_autohideBecameIdle" selector:0 userInfo:0 repeats:v9];
  autohideIdleTimer = self->_autohideIdleTimer;
  self->_autohideIdleTimer = v13;
}

- (void)_stopAutohideIdleTimer
{
  autohideIdleTimer = self->_autohideIdleTimer;
  if (autohideIdleTimer)
  {
    [(NSTimer *)autohideIdleTimer invalidate];
    id v4 = self->_autohideIdleTimer;
    self->_autohideIdleTimer = 0;
  }
}

- (void)_addAutohideGestureRecognizer
{
  autohideTapRecognizer = self->_autohideTapRecognizer;
  if (!autohideTapRecognizer)
  {
    id v4 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_autohideGestureRecognizerDetectedTap:"];
    id v5 = self->_autohideTapRecognizer;
    self->_autohideTapRecognizer = v4;

    [(UITapGestureRecognizer *)self->_autohideTapRecognizer setAllowedTouchTypes:&off_1013AD4B8];
    [(UITapGestureRecognizer *)self->_autohideTapRecognizer setDelegate:self];
    if (self->_doubleTapRecognizer) {
      -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_autohideTapRecognizer, "requireGestureRecognizerToFail:");
    }
    unsigned __int8 v6 = [(CarChromeViewController *)self view];
    [v6 addGestureRecognizer:self->_autohideTapRecognizer];

    autohideTapRecognizer = self->_autohideTapRecognizer;
  }
  [(UITapGestureRecognizer *)autohideTapRecognizer setEnabled:1];
  id v7 = [(ChromeViewController *)self mapView];
  double v8 = [v7 _doubleTapGestureRecognizer];

  if (v8)
  {
    double v9 = self->_autohideTapRecognizer;
    id v10 = [(ChromeViewController *)self mapView];
    unsigned int v11 = [v10 _doubleTapGestureRecognizer];
    [(UITapGestureRecognizer *)v9 requireGestureRecognizerToFail:v11];
  }
  double v12 = [(ChromeViewController *)self mapView];
  unsigned __int8 v13 = [v12 _oneHandedZoomGestureRecognizer];

  if (v13)
  {
    id v14 = self->_autohideTapRecognizer;
    uint64_t v15 = [(ChromeViewController *)self mapView];
    int64_t v16 = [v15 _oneHandedZoomGestureRecognizer];
    [(UITapGestureRecognizer *)v14 requireGestureRecognizerToFail:v16];
  }
  if (!self->_autohidePresenceObserverToken)
  {
    objc_initWeak(&location, self);
    __int16 v17 = +[NSNotificationCenter defaultCenter];
    char v18 = +[NSOperationQueue mainQueue];
    uint64_t v19 = _UIScreenCarPlayHumanPresenceDidChangeNotification;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10038D9C4;
    v22[3] = &unk_1012E6730;
    objc_copyWeak(&v23, &location);
    id v20 = [v17 addObserverForName:v19 object:0 queue:v18 usingBlock:v22];
    autohidePresenceObserverToken = self->_autohidePresenceObserverToken;
    self->_autohidePresenceObserverToken = v20;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  unsigned __int8 v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  double v8 = [v7 view];
  double v9 = [(ChromeViewController *)self passThroughView];
  if (v8 != v9 && ([v8 isDescendantOfView:v9] & 1) == 0)
  {
    id v10 = [(CarChromeViewController *)self viewIfLoaded];

    if (v8 != v10) {
      goto LABEL_7;
    }
  }
  if (self->_autohideTapRecognizer != v6) {
    goto LABEL_9;
  }
  unsigned int v11 = [(CarChromeViewController *)self topContext];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_9;
  }
  double v12 = [(CarChromeViewController *)self topContext];
  unsigned __int8 v13 = [v12 shouldSuppressAutohideRecognizerForTouch:v7];

  if ((v13 & 1) == 0)
  {
LABEL_9:
    BOOL v14 = 1;
    goto LABEL_10;
  }
LABEL_7:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  if (self->_autohideTapRecognizer != a3) {
    return 0;
  }
  id v5 = a4;
  unsigned __int8 v6 = [(ChromeViewController *)self mapView];
  id v7 = [v6 _selectingTapGestureRecognizer];

  if (v7 != v5) {
    return 0;
  }

  return [(CarChromeViewController *)self _canSelectAlternateRoutes];
}

- (void)_removeAutohideGestureRecognizer
{
  autohideTapRecognizer = self->_autohideTapRecognizer;
  if (autohideTapRecognizer) {
    [(UITapGestureRecognizer *)autohideTapRecognizer setEnabled:0];
  }
  if (self->_autohidePresenceObserverToken)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self->_autohidePresenceObserverToken];

    autohidePresenceObserverToken = self->_autohidePresenceObserverToken;
    self->_autohidePresenceObserverToken = 0;
  }
}

- (BOOL)isForcingAutohideBehavior
{
  return [(MapsTokenStorage *)self->_forcedAutohideTokens count] != 0;
}

- (int64_t)forcedAutohideBehavior
{
  if (![(CarChromeViewController *)self isForcingAutohideBehavior]) {
    return -1;
  }
  id v3 = [(MapsTokenStorage *)self->_forcedAutohideTokens tokens];
  id v4 = [v3 lastObject];

  id v5 = [v4 userInfo];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:@"CarForcedAutohideBehaviorKey"];
  id v7 = [v6 integerValue];

  double v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "forcedAutohideBehavior: %ld", (uint8_t *)&v10, 0xCu);
  }

  return (int64_t)v7;
}

- (id)acquireForcedAutohideBehaviourTokenWithBehaviour:(int64_t)a3
{
  forcedAutohideTokens = self->_forcedAutohideTokens;
  CFStringRef v8 = @"CarForcedAutohideBehaviorKey";
  id v4 = +[NSNumber numberWithInteger:a3];
  double v9 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  unsigned __int8 v6 = [(MapsTokenStorage *)forcedAutohideTokens tokenWithUserInfo:v5];

  return v6;
}

- (void)incrementForToken:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CarChromeViewController;
  [(ChromeViewController *)&v24 incrementForToken:v4];
  id v5 = [v4 tokenGroupName];
  unsigned int v6 = [v5 isEqualToString:@"CarForcedAutohideBehaviorTokenGroup"];

  if (v6)
  {
    id v7 = [v4 userInfo];
    CFStringRef v8 = [v7 objectForKeyedSubscript:@"CarForcedAutohideBehaviorKey"];
    id v9 = [v8 integerValue];

    int v10 = sub_100015DB4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      [(CarChromeViewController *)self _updateAutohideBehavior];
      goto LABEL_21;
    }
    id v11 = v4;
    if (!v11)
    {
      int64_t v16 = @"<nil>";
      goto LABEL_19;
    }
    double v12 = (objc_class *)objc_opt_class();
    unsigned __int8 v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      BOOL v14 = [v11 performSelector:"accessibilityIdentifier"];
      uint64_t v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        int64_t v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_9;
      }
    }
    int64_t v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 134218242;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_beginForcingAutohideBehavior (behavior: %ld, token: %@)", buf, 0x16u);

    goto LABEL_20;
  }
  __int16 v17 = [v4 tokenGroupName];
  unsigned int v18 = [v17 isEqualToString:@"CarChromeModernMap"];

  if (v18)
  {
    uint64_t v19 = [v4 userInfo];
    id v20 = [v19 objectForKeyedSubscript:@"reason"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v21 = sub_1000C49B4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Invalid modern map token: %@", buf, 0xCu);
      }
    }
    __int16 v22 = +[NSNotificationCenter defaultCenter];
    [v22 postNotificationName:@"ChromeViewControllerDidUpdateShouldUseModernMap" object:self];

    id v23 = [(ChromeViewController *)self mapView];

    if (v23) {
      [(CarChromeViewController *)self _updateModernMapCartographicConfiguration];
    }
  }
LABEL_21:
}

- (void)decrementForToken:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v27 = "-[CarChromeViewController decrementForToken:]";
        __int16 v28 = 2080;
        id v29 = "CarChromeViewController.m";
        __int16 v30 = 1024;
        int v31 = 3479;
        __int16 v32 = 2080;
        BOOL v33 = "dispatch_get_main_queue()";
        __int16 v34 = 2080;
        id v35 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v36 = 2080;
        __int16 v37 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v23 = sub_1005762E4();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_super v24 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v27 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  CFStringRef v8 = [v4 tokenGroupName];
  unsigned int v9 = [v8 isEqualToString:@"CarForcedAutohideBehaviorTokenGroup"];

  if (v9)
  {
    int v10 = sub_100015DB4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_24:

      [(CarChromeViewController *)self _updateAutohideBehavior];
      goto LABEL_25;
    }
    id v11 = v4;
    if (!v11)
    {
      int64_t v16 = @"<nil>";
      goto LABEL_23;
    }
    double v12 = (objc_class *)objc_opt_class();
    unsigned __int8 v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      BOOL v14 = [v11 performSelector:"accessibilityIdentifier"];
      uint64_t v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        int64_t v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_15;
      }
    }
    int64_t v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_15:

LABEL_23:
    *(_DWORD *)buf = 138412290;
    __int16 v27 = (const char *)v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_endForcingAutohideBehaviorWithToken (token: %@)", buf, 0xCu);

    goto LABEL_24;
  }
  __int16 v17 = [v4 tokenGroupName];
  unsigned int v18 = [v17 isEqualToString:@"CarChromeModernMap"];

  if (v18)
  {
    uint64_t v19 = sub_1000C49B4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v27 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Releasing modern map token: %@", buf, 0xCu);
    }

    id v20 = +[NSNotificationCenter defaultCenter];
    [v20 postNotificationName:@"ChromeViewControllerDidUpdateShouldUseModernMap" object:self];

    char v21 = [(ChromeViewController *)self mapView];

    if (v21) {
      [(CarChromeViewController *)self _updateModernMapCartographicConfiguration];
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CarChromeViewController;
    [(ChromeViewController *)&v25 decrementForToken:v4];
  }
LABEL_25:
}

- (void)setHardwareBackButtonBehavior:(int64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CarChromeViewController *)self chromeViewItemForContext:v6 createIfNeeded:1];
  if (a3 == 1) {
    a3 = objc_opt_respondsToSelector() & 1;
  }
  CFStringRef v8 = sub_100015DB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v9 = (unint64_t)[v7 hardwareBackButtonBehavior];
    if (v9 > 3) {
      int v10 = 0;
    }
    else {
      int v10 = off_1012E6C48[v9];
    }
    if ((unint64_t)a3 > 3) {
      id v11 = 0;
    }
    else {
      id v11 = off_1012E6C48[a3];
    }
    double v12 = (objc_class *)objc_opt_class();
    unsigned __int8 v13 = NSStringFromClass(v12);
    int v14 = 138412802;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updating HW back button behavior from: %@ to : %@. For context: %@", (uint8_t *)&v14, 0x20u);
  }
  [v7 setHardwareBackButtonBehavior:a3];
  [(CarChromeViewController *)self updateHardwareBackButtonBehavior];
}

- (void)updateHardwareBackButtonBehavior
{
  id v3 = [(CarChromeViewController *)self topContext];
  id v4 = [(CarChromeViewController *)self chromeViewItemForContext:v3 createIfNeeded:0];
  id v5 = [v4 hardwareBackButtonBehavior];

  switch((unint64_t)v5)
  {
    case 0uLL:
      id v10 = [(ChromeViewController *)self contexts];
      BOOL v8 = (unint64_t)[v10 count] > 1;
      unint64_t v9 = [(CarChromeViewController *)self backButtonRecognizer];
      [v9 setEnabled:v8];

      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      id v6 = [(CarChromeViewController *)self backButtonRecognizer];
      id v10 = v6;
      uint64_t v7 = 1;
      goto LABEL_5;
    case 2uLL:
      id v6 = [(CarChromeViewController *)self backButtonRecognizer];
      id v10 = v6;
      uint64_t v7 = 0;
LABEL_5:
      [v6 setEnabled:v7];
LABEL_6:

      break;
    default:
      return;
  }
}

- (id)_previousContext
{
  id v3 = [(ChromeViewController *)self contexts];
  id v4 = (char *)[v3 count];

  id v5 = [(ChromeViewController *)self contexts];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= 2)
  {
    BOOL v8 = [(ChromeViewController *)self contexts];
    uint64_t v7 = [v8 objectAtIndexedSubscript:v4 - 2];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_handleBackButtonPressed:(id)a3
{
}

- (void)_handleBackButton
{
  id v3 = [(CarChromeViewController *)self topContext];
  id v4 = [(CarChromeViewController *)self chromeViewItemForContext:v3 createIfNeeded:0];

  id v5 = [v4 hardwareBackButtonBehavior];
  if (!v5)
  {
    unsigned __int8 v13 = [(CarChromeViewController *)self _previousContext];
    [(CarChromeViewController *)self _captureUserActionBackToContext:v13];

    int v14 = +[CarChromeModeCoordinator sharedInstance];
    uint64_t v15 = [(CarChromeViewController *)self topContext];
    [v14 popFromContext:v15];

    goto LABEL_16;
  }
  if (v5 == (id)1)
  {
    id v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    id v7 = [(CarChromeViewController *)self topContext];
    if (!v7)
    {
      double v12 = @"<nil>";
      goto LABEL_13;
    }
    BOOL v8 = (objc_class *)objc_opt_class();
    unint64_t v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        double v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_10;
      }
    }
    double v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

LABEL_13:
    *(_DWORD *)buf = 138412290;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ will handle hardware back button", buf, 0xCu);

LABEL_14:
    __int16 v16 = [(CarChromeViewController *)self topContext];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      __int16 v18 = [(CarChromeViewController *)self topContext];
      [v18 handleHardwareBackButtonPressed];
    }
  }
LABEL_16:
}

- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey
{
  uint64_t v2 = MapsConfig_ThermalPressureCarPlayNavigationRateLimits;
  id v3 = off_1015F06C8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey
{
  uint64_t v2 = MapsConfig_BatteryLevelNavigationRateLimitEnabledCarPlay;
  id v3 = off_1015F06E8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey
{
  uint64_t v2 = MapsConfig_LowPowerNavigationRateLimitEnabledCarPlay;
  id v3 = off_1015F0728;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (MapsLightLevelController)lightLevelController
{
  return self->_lightLevelController;
}

- (void)setLightLevelController:(id)a3
{
}

- (void)setRouteGeniusAnnotationsManager:(id)a3
{
}

- (void)setDefaultMapSettings:(id)a3
{
}

- (void)setNudgerizer:(id)a3
{
}

- (UILayoutGuide)notificationLayoutGuide
{
  return self->_notificationLayoutGuide;
}

- (UILayoutGuide)cardsLayoutGuide
{
  return self->_cardsLayoutGuide;
}

- (void)setCardsLayoutGuide:(id)a3
{
}

- (UILayoutGuide)statusBannerLayoutGuide
{
  return self->_statusBannerLayoutGuide;
}

- (void)setStatusBannerLayoutGuide:(id)a3
{
}

- (UILayoutGuide)accessoriesCompactLayoutGuide
{
  return self->_accessoriesCompactLayoutGuide;
}

- (void)setAccessoriesCompactLayoutGuide:(id)a3
{
}

- (CarCardsOverlay)cardsOverlay
{
  return self->_cardsOverlay;
}

- (void)setCardsOverlay:(id)a3
{
}

- (CarAccessoriesOverlay)accessoriesOverlay
{
  return self->_accessoriesOverlay;
}

- (void)setAccessoriesOverlay:(id)a3
{
}

- (CarMapControlsOverlay)mapControlsOverlay
{
  return self->_mapControlsOverlay;
}

- (void)setMapControlsOverlay:(id)a3
{
}

- (CarStatusBannerOverlay)statusBannerOverlay
{
  return self->_statusBannerOverlay;
}

- (void)setStatusBannerOverlay:(id)a3
{
}

- (BOOL)haveVehicleDirection
{
  return self->_haveVehicleDirection;
}

- (void)setHaveVehicleDirection:(BOOL)a3
{
  self->_haveVehicleDirection = a3;
}

- (void)setMapViewResponder:(id)a3
{
}

- (void)setRouteSelectionController:(id)a3
{
}

- (UITapGestureRecognizer)backButtonRecognizer
{
  return self->_backButtonRecognizer;
}

- (void)setBackButtonRecognizer:(id)a3
{
}

- (id)doubleTapBlock
{
  return self->_doubleTapBlock;
}

- (void)setDoubleTapBlock:(id)a3
{
}

- (void)setChromeItemsByContext:(id)a3
{
}

- (void)setLastFocusedIdentifiersByContext:(id)a3
{
}

- (void)setLastFocusedItemsByContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusedItemsByContext, 0);
  objc_storeStrong((id *)&self->_lastFocusedIdentifiersByContext, 0);
  objc_storeStrong((id *)&self->_chromeItemsByContext, 0);
  objc_storeStrong(&self->_doubleTapBlock, 0);
  objc_storeStrong((id *)&self->_backButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_routeSelectionController, 0);
  objc_storeStrong((id *)&self->_mapViewResponder, 0);
  objc_storeStrong((id *)&self->_statusBannerOverlay, 0);
  objc_storeStrong((id *)&self->_mapControlsOverlay, 0);
  objc_storeStrong((id *)&self->_accessoriesOverlay, 0);
  objc_storeStrong((id *)&self->_cardsOverlay, 0);
  objc_storeStrong((id *)&self->_accessoriesCompactLayoutGuide, 0);
  objc_storeStrong((id *)&self->_statusBannerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_cardsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_notificationLayoutGuide, 0);
  objc_storeStrong((id *)&self->_nudgerizer, 0);
  objc_storeStrong((id *)&self->_defaultMapSettings, 0);
  objc_storeStrong((id *)&self->_routeGeniusAnnotationsManager, 0);
  objc_storeStrong((id *)&self->_lightLevelController, 0);
  objc_storeStrong((id *)&self->_headingUpMapInsetAdjustmentConstraint, 0);
  objc_storeStrong((id *)&self->_interruptionManager, 0);
  objc_storeStrong((id *)&self->_focusContainerGuideController, 0);
  objc_destroyWeak((id *)&self->_restoreFocusForContext);
  objc_storeStrong((id *)&self->_customPOIsController, 0);
  objc_storeStrong((id *)&self->_personalizedItemManager, 0);
  objc_storeStrong((id *)&self->_alertDismissalBlocks, 0);
  objc_storeStrong((id *)&self->_currentAlertViewController, 0);
  objc_storeStrong(&self->_visibilityDeactivationToken, 0);
  objc_storeStrong((id *)&self->_navigationObscuredTimeout, 0);
  objc_storeStrong(&self->_usingOfflineDataModernMapToken, 0);
  objc_storeStrong((id *)&self->_modernMapTokens, 0);
  objc_storeStrong((id *)&self->_forcedAutohideTokens, 0);
  objc_storeStrong((id *)&self->_autohidePresenceObserverToken, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_autohideTapRecognizer, 0);

  objc_storeStrong((id *)&self->_autohideIdleTimer, 0);
}

@end