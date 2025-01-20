@interface ChromeViewController
+ (BOOL)mapInsetsShouldRespectSafeAreaInsetsByDefault;
+ (BOOL)requiresUniqueContextIdentifiers;
+ (Class)userLocationViewClass;
+ (id)localizedLocationAuthorizationMessage;
+ (id)localizedLocationAuthorizationTitle;
- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey;
- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey;
- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey;
- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect;
- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3;
- (BOOL)_shouldEnableNavigationDisplayForContextStack:(id)a3 requestingContext:(id *)a4;
- (BOOL)_shouldSaveLastViewportChangeDateInDefaults;
- (BOOL)chromeDidClearMapSelection;
- (BOOL)chromeDidSelectAnnotationView:(id)a3;
- (BOOL)chromeDidSelectLabelMarker:(id)a3;
- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3;
- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3;
- (BOOL)contextWantsMapInsetsToRespectSafeAreaInsets:(id)a3;
- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3;
- (BOOL)hasDeferredAction:(id)a3 forContext:(id)a4;
- (BOOL)hasDuplicatesOfContext:(id)a3;
- (BOOL)isBatteryLevelFrameRateLimitingEnabled;
- (BOOL)isCurrentContext:(id)a3;
- (BOOL)isDisplayingNavigation;
- (BOOL)isEligibleForMapViewFrameRateLimiting;
- (BOOL)isInactive;
- (BOOL)isLowPowerModeFrameRateLimitingEnabled;
- (BOOL)isRunningNavigationDisplay;
- (BOOL)isSuppressed;
- (BOOL)isThrottlingMapViewFrameRate;
- (BOOL)isTopContext:(id)a3;
- (BOOL)isTransitioning;
- (BOOL)mapView:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3;
- (BOOL)removesMapViewWhenInactive;
- (BOOL)shouldAutomaticallyLoadMapView;
- (BOOL)shouldForceExploreMap;
- (BOOL)shouldUseHikingMap;
- (BOOL)shouldUseModernMap;
- (BOOL)supportsDefaultFullscreenViewControllerPresentation;
- (BOOL)wantsNavigationDisplayByDefault;
- (BatteryMonitorToken)batteryMonitorToken;
- (CGRect)unobscuredMapContentBoundsInContainingView;
- (ChromeContext)nextTopContext;
- (ChromeContext)previousTopContext;
- (ChromeContext)topContext;
- (ChromeContextTransition)currentContextTransition;
- (ChromeNavigationDisplay)navigationDisplay;
- (ChromeOverlayController)overlayController;
- (ChromeViewController)init;
- (CustomPOIsController)customPOIsController;
- (CustomSearchManager)customSearchManager;
- (GEOMapServiceTraits)currentTraits;
- (GEOMapServiceTraits)navigationAwareTraits;
- (MKMapView)mapView;
- (MapCameraController)mapCameraController;
- (MapSelectionManager)mapSelectionManager;
- (NSArray)contexts;
- (NSArray)pendingContexts;
- (NSDictionary)thermalRateLimits;
- (NSMutableDictionary)currentMapViewRateLimits;
- (NSString)searchContextDefaultsKeysPrefix;
- (PersonalizedItemManager)personalizedItemManager;
- (RouteAnnotationsController)routeAnnotationsController;
- (SearchPinsManager)searchPinsManager;
- (UIEdgeInsets)labelEdgeInsets;
- (UIEdgeInsets)labelEdgeWidths;
- (UIEdgeInsets)mapAttributionInsets;
- (UIEdgeInsets)mapEdgeInsetsForContext:(id)a3;
- (UILayoutGuide)mapInsetsLayoutGuide;
- (UILayoutGuide)viewportLayoutGuide;
- (UIView)currentMapReplacementView;
- (UIView)viewport;
- (UserLocationView)userLocationView;
- (double)mapInsetsUpdateAnimationDuration;
- (id)_contextCoordinatedScheduler;
- (id)acquireChromeDeactivationTokenForReason:(id)a3;
- (id)acquireExploreMapHikingMapToken;
- (id)acquireHikingMapToken;
- (id)acquireMapInsetPropagationSuspensionTokenForReason:(id)a3;
- (id)allComponents;
- (id)contextForUniqueIdentifier:(id)a3;
- (id)contextProtocol;
- (id)createMapReplacementView;
- (id)createMapView;
- (id)deactivationReasons;
- (id)defaultFullscreenViewControllerDismissalTransition;
- (id)defaultFullscreenViewControllerPresentationTransition;
- (id)fullscreenViewControllerTransitionFromController:(id)a3 toController:(id)a4 isDismissTransition:(BOOL)a5;
- (id)lastMapViewportChangedDate;
- (id)mapReplacementColor;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)mapViewDelegate;
- (id)mapViewDelegateForSelector:(SEL)a3;
- (id)mapViewEnteredForegroundDate;
- (id)personalizedItemSourcesForCurrentState;
- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (id)presentUnhandledInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (id)uniqueIdentifierForContext:(id)a3;
- (int64_t)_currentFrameRateLimit;
- (int64_t)modernMapProjectionType;
- (int64_t)modernMapTerrainMode;
- (unint64_t)desiredRadarScreenshotTypes;
- (unint64_t)preferredUpdateTimingForComponent:(id)a3;
- (void)_addWatermarkView;
- (void)_checkHikingCoordinate:(CLLocationCoordinate2D)a3;
- (void)_clearFrameRateLimits;
- (void)_fillNewTraitsWithMapViewRelatedData:(id)a3;
- (void)_getContextsLeaving:(id *)a3 entering:(id *)a4 fromPrevious:(id)a5 incoming:(id)a6;
- (void)_installMapReplacementView:(id)a3;
- (void)_limitFrameRate:(int64_t)a3 forReason:(int64_t)a4;
- (void)_refreshMapInsetsConstraintsForContext:(id)a3 animated:(BOOL)a4 updateIfNeeded:(BOOL)a5;
- (void)_removeFrameRateLimitForReason:(int64_t)a3;
- (void)_removeMapReplacementViewIfNeeded;
- (void)_removeWatermarkView;
- (void)_scheduleComponentUpdateTimerIfNeeded;
- (void)_setContexts:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setInactive:(BOOL)a3;
- (void)_setLocalizedStringsForMapView:(id)a3;
- (void)_setSuppressed:(BOOL)a3;
- (void)_setupNavigationDisplayForContext:(id)a3 withAnimation:(id)a4;
- (void)_suppress;
- (void)_teardownContextTransition:(id)a3;
- (void)_teardownNavigationDisplayWithAnimation:(id)a3;
- (void)_transitionToFullscreenViewController:(id)a3 forContext:(id)a4 previousIsLeaving:(BOOL)a5 withAnimation:(id)a6;
- (void)_unsuppress;
- (void)_updateComponentsIfNeeded:(BOOL)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5;
- (void)_updateComponentsIfNeeded:(BOOL)a3 forceImmediateUpdate:(BOOL)a4 forTiming:(unint64_t)a5 withAnimation:(id)a6;
- (void)_updateComponentsIfNeeded:(BOOL)a3 withAnimation:(id)a4;
- (void)_updateDebugLayoutGuidesView;
- (void)_updateFullscreenViewControllerForContext:(id)a3 previousIsLeaving:(BOOL)a4 withAnimation:(id)a5;
- (void)addContextStackObserver:(id)a3;
- (void)batteryMonitorTokenWitnessedChangeInBatteryLevel:(id)a3;
- (void)cancelDeferredAction:(id)a3 forContext:(id)a4;
- (void)checkIfCoordinate:(CLLocationCoordinate2D)a3 isInHikingContextualRegionWithCompletionHandler:(id)a4;
- (void)clearMapGesturesAndAnimations;
- (void)commitCoordinatedContextChange;
- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)deactivationReasonsDidChange;
- (void)dealloc;
- (void)decrementForToken:(id)a3;
- (void)didUpdateThermalPressureLevel:(int)a3;
- (void)evictMapView;
- (void)forwardInvocation:(id)a3;
- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (void)incrementForToken:(id)a3;
- (void)installMapReplacementView:(id)a3;
- (void)installMapView:(id)a3;
- (void)loadMapViewIfNeeded;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)popContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)popContextAnimated:(BOOL)a3 completion:(id)a4;
- (void)popToContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)popToRootContextAnimated:(BOOL)a3 completion:(id)a4;
- (void)powerStateDidChangeNotification:(id)a3;
- (void)prepareMapViewForFirstUse;
- (void)prepareToRemoveMapView:(id)a3;
- (void)pushContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)registerAdditionalMapViewDelegate:(id)a3;
- (void)registerFramesInDebugFramesView:(id)a3;
- (void)removeContextStackObserver:(id)a3;
- (void)removeMapReplacementView:(id)a3;
- (void)removeMapViewFromViewHierarchy;
- (void)resetForcedExploreModernMapFlag;
- (void)restoreMapInViewHierarchy;
- (void)scheduleCoordinatedContextChange:(id)a3 completionHandler:(id)a4;
- (void)setBatteryMonitorToken:(id)a3;
- (void)setContexts:(id)a3;
- (void)setContexts:(id)a3 animated:(BOOL)a4;
- (void)setContexts:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setCurrentMapViewRateLimits:(id)a3;
- (void)setFallbackContextCoordinationBlock:(id)a3;
- (void)setLabelEdgeInsets:(UIEdgeInsets)a3;
- (void)setLabelEdgeWidths:(UIEdgeInsets)a3;
- (void)setMapEdgeInsets:(UIEdgeInsets)a3 animated:(BOOL)a4 forContext:(id)a5;
- (void)setNavigationDisplay:(id)a3;
- (void)setNeedsUpdateComponent:(id)a3 animated:(BOOL)a4;
- (void)setNeedsUpdateComponent:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setNeedsUpdateFullscreenViewController;
- (void)setNeedsUpdateMapInsets;
- (void)setSearchContextDefaultsKeysPrefix:(id)a3;
- (void)setSuppressed:(BOOL)a3;
- (void)setVKApplicationUILayout:(int64_t)a3;
- (void)setVisibleMapRect:(id)a3;
- (void)unregisterAdditionalMapViewDelegate:(id)a3;
- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5;
- (void)updateComponentsIfNeeded;
- (void)updateComponentsIfNeededWithAnimation:(id)a3;
- (void)updateFramesInDebugFramesView:(id)a3;
- (void)updateHikingMapConfiguration;
- (void)updateMapViewFrameRate;
- (void)userDefaultsDidChange:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)whenContextNextBecomesCurrent:(id)a3 performAction:(id)a4 withBlock:(id)a5;
@end

@implementation ChromeViewController

- (id)_contextCoordinatedScheduler
{
  contextCoordinatedScheduler = self->_contextCoordinatedScheduler;
  if (!contextCoordinatedScheduler)
  {
    v4 = [[ChromeContextCoordinationScheduler alloc] initWithChromeViewController:self];
    v5 = self->_contextCoordinatedScheduler;
    self->_contextCoordinatedScheduler = v4;

    contextCoordinatedScheduler = self->_contextCoordinatedScheduler;
  }

  return contextCoordinatedScheduler;
}

- (void)_addWatermarkView
{
  v3 = +[GEOPlatform sharedPlatform];
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    watermarkView = self->_watermarkView;
    if (!watermarkView)
    {
      v6 = -[WatermarkView initWithFrame:]([WatermarkView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v7 = self->_watermarkView;
      self->_watermarkView = v6;

      [(WatermarkView *)self->_watermarkView setTranslatesAutoresizingMaskIntoConstraints:0];
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = +[NSString stringWithFormat:@"%@.watermark", v9];
      [(WatermarkView *)self->_watermarkView setAccessibilityIdentifier:v10];

      watermarkView = self->_watermarkView;
    }
    v11 = [(WatermarkView *)watermarkView superview];
    v12 = [(ChromeViewController *)self view];

    if (v11 != v12)
    {
      v13 = [(ChromeViewController *)self view];
      [v13 addSubview:self->_watermarkView];

      v14 = self->_watermarkView;
      id v18 = [(ChromeViewController *)self view];
      LODWORD(v15) = 1148846080;
      v16 = [(WatermarkView *)v14 _maps_constraintsEqualToEdgesOfView:v18 priority:v15];
      v17 = [v16 allConstraints];
      +[NSLayoutConstraint activateConstraints:v17];
    }
  }
}

- (void)_teardownContextTransition:(id)a3
{
  unsigned int v4 = (ChromeContextTransition *)a3;
  if (self->_currentContextTransition != v4)
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = +[NSString stringWithFormat:@"Transition provided is not the same as the current transition"];
      int v9 = 136316162;
      v10 = "-[ChromeViewController _teardownContextTransition:]";
      __int16 v11 = 2080;
      v12 = "ChromeViewController.m";
      __int16 v13 = 1024;
      int v14 = 728;
      __int16 v15 = 2080;
      v16 = "_currentContextTransition == transition";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v9, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  if (self->_currentContextTransition == v4)
  {
    self->_currentContextTransition = 0;
  }
}

- (id)fullscreenViewControllerTransitionFromController:(id)a3 toController:(id)a4 isDismissTransition:(BOOL)a5
{
  if (a5) {
    [(ChromeViewController *)self defaultFullscreenViewControllerDismissalTransition];
  }
  else {
  v5 = [(ChromeViewController *)self defaultFullscreenViewControllerPresentationTransition];
  }

  return v5;
}

- (void)addContextStackObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    stackObservers = self->_stackObservers;
    id v8 = v4;
    if (!stackObservers)
    {
      v6 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___ChromeContextStackObserver queue:&_dispatch_main_q];
      v7 = self->_stackObservers;
      self->_stackObservers = v6;

      stackObservers = self->_stackObservers;
    }
    [(GEOObserverHashTable *)stackObservers registerObserver:v8];
    id v4 = v8;
  }
}

- (id)createMapView
{
  id v3 = objc_alloc((Class)MKMapView);
  id v4 = [(ChromeViewController *)self view];
  [v4 bounds];
  id v5 = [v3 _initWithFrame:0 gestureRecognizerHostView:0 showsAttribution:0 showsAppleLogo:1 allowsAntialiasing:0 carDisplayType:0];

  return v5;
}

- (void)_teardownNavigationDisplayWithAnimation:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008264;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 addPreparation:v4];
}

- (void)scheduleCoordinatedContextChange:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ChromeViewController *)self _contextCoordinatedScheduler];
  [v8 scheduleBlock:v7 completionHandler:v6];
}

- (void)_updateFullscreenViewControllerForContext:(id)a3 previousIsLeaving:(BOOL)a4 withAnimation:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if ([(ChromeViewController *)self supportsDefaultFullscreenViewControllerPresentation])
  {
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v9 fullscreenViewController];
    }
    else
    {
      id v8 = 0;
    }
    [(ChromeViewController *)self _transitionToFullscreenViewController:v8 forContext:v9 previousIsLeaving:0 withAnimation:v7];
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 userLocation];

  if (v9 == v8)
  {
    __int16 v11 = [(ChromeViewController *)self userLocationView];
  }
  else
  {
    v10 = [(ChromeViewController *)self mapViewDelegateForSelector:a2];
    __int16 v11 = [v10 mapView:v7 viewForAnnotation:v8];
  }

  return v11;
}

- (void)pushContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006188C;
  v13[3] = &unk_10131AEE0;
  BOOL v16 = a4;
  id v14 = v8;
  __int16 v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100108518;
  v11[3] = &unk_10131AF08;
  id v9 = v12;
  id v10 = v8;
  [(ChromeViewController *)self scheduleCoordinatedContextChange:v13 completionHandler:v11];
}

- (BOOL)hasDuplicatesOfContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ChromeViewController *)self contexts];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100108B08;
  v9[3] = &unk_10131AEB8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 indexesOfObjectsPassingTest:v9];

  LOBYTE(v5) = (unint64_t)[v7 count] > 1;
  return (char)v5;
}

- (void)_setLocalizedStringsForMapView:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v5 = dispatch_queue_create("ChromeViewController.workerQueue", v4);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085E6C;
  block[3] = &unk_1012E5D08;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)_refreshMapInsetsConstraintsForContext:(id)a3 animated:(BOOL)a4 updateIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v17 = a3;
  unsigned int v8 = [(ChromeViewController *)self isTopContext:v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = [(NSMapTable *)self->_mapInsetsConstraintsByContext objectForKey:v17];
    p_currentContextMapInsetsConstraints = (id *)&self->_currentContextMapInsetsConstraints;
    currentContextMapInsetsConstraints = self->_currentContextMapInsetsConstraints;
    if (currentContextMapInsetsConstraints != v10)
    {
      if (currentContextMapInsetsConstraints)
      {
        __int16 v13 = [(MapsEdgeConstraints *)currentContextMapInsetsConstraints allConstraints];
        +[NSLayoutConstraint deactivateConstraints:v13];

        BOOL v14 = *p_currentContextMapInsetsConstraints == 0;
      }
      else
      {
        BOOL v14 = 1;
      }
      if (v10) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = v14;
      }
      objc_storeStrong(p_currentContextMapInsetsConstraints, v10);
      if (v10)
      {
        BOOL v16 = [(MapsEdgeConstraints *)v10 allConstraints];
        +[NSLayoutConstraint activateConstraints:v16];
      }
      if (!v15 && v5) {
        [(ChromeViewController *)self setNeedsUpdateComponent:@"mapInsets" animated:v6];
      }
    }

    id v9 = v17;
  }
}

- (void)_setContexts:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(ChromeViewController *)self isTransitioning])
  {
    id v10 = sub_1000C49B4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      objc_initWeak((id *)&buf, self);
      v24 = [(ChromeContextTransition *)self->_currentContextTransition enterAnimation];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100BEC590;
      v30[3] = &unk_10131AF58;
      objc_copyWeak(&v33, (id *)&buf);
      id v31 = v8;
      BOOL v34 = v6;
      id v32 = v9;
      [v24 addCompletion:v30];

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)&buf);
      goto LABEL_14;
    }
    __int16 v11 = self;
    if (!v11)
    {
      BOOL v16 = @"<nil>";
      goto LABEL_12;
    }
    id v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      BOOL v14 = [(ChromeViewController *)v11 performSelector:"accessibilityIdentifier"];
      BOOL v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        BOOL v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_9;
      }
    }
    BOOL v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_9:

LABEL_12:
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Already transitioning; queueing up context change",
      (uint8_t *)&buf,
      0xCu);

    goto LABEL_13;
  }
  [(ChromeViewController *)self loadViewIfNeeded];
  id v17 = self->_contexts;
  id v18 = [[ChromeContextTransition alloc] initForTransitionFromContexts:v17 toContexts:v8 animated:v6];
  objc_storeStrong((id *)&self->_currentContextTransition, v18);
  v19 = [v18 leaveAnimation];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100104430;
  v38 = sub_100104A88;
  id v39 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100012AC4;
  v29[3] = &unk_1012E73F0;
  v29[4] = self;
  v29[5] = &buf;
  [v19 addPreparation:v29];
  [(ChromeViewController *)self contextStackWillUpdateFrom:v17 to:v8 withAnimation:v19];
  v20 = (NSArray *)[v8 copy];
  contexts = self->_contexts;
  self->_contexts = v20;

  v22 = [v18 enterAnimation];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000102E8;
  v25[3] = &unk_10131AF80;
  v25[4] = self;
  id v23 = v18;
  id v26 = v23;
  p_long long buf = &buf;
  BOOL v28 = v6;
  [v22 addCompletion:v25];
  [(ChromeViewController *)self contextStackDidUpdateFrom:v17 to:v8 withAnimation:v22];
  [v23 runWithCompletion:v9];

  _Block_object_dispose(&buf, 8);
LABEL_14:
}

- (void)loadMapViewIfNeeded
{
  p_mapView = &self->_mapView;
  if (self->_mapView || [(ChromeViewController *)self isSuppressed]) {
    return;
  }
  id v4 = [(ChromeViewController *)self createMapView];
  BOOL v5 = sub_1000C49B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = self;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(ChromeViewController *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        __int16 v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    __int16 v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

    id v12 = [v4 _mapLayer];
    *(_DWORD *)long long buf = 138543874;
    id v17 = v11;
    __int16 v18 = 2114;
    v19 = v4;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loadMapViewIfNeeded, mapView: %{public}@, mapLayer: %{public}@", buf, 0x20u);
  }
  __int16 v13 = [(ChromeDelegateProxy *)[ChromeMapViewDelegateProxy alloc] initWithChromeViewController:self];
  mapViewDelegateProxy = self->_mapViewDelegateProxy;
  self->_mapViewDelegateProxy = v13;

  [v4 setDelegate:self->_mapViewDelegateProxy];
  objc_storeStrong((id *)p_mapView, v4);
  if (v4)
  {
    [(MapCameraController *)self->_mapCameraController setMapView:v4];
    BOOL v15 = [(ChromeViewController *)self mapCameraController];
    [(SearchPinsManager *)self->_searchPinsManager setMapCameraController:v15];

    [(CustomPOIsController *)self->_customPOIsController setMapView:v4];
  }
  [(ChromeViewController *)self prepareMapViewForFirstUse];
  if (![(ChromeViewController *)self isInactive]
    || ![(ChromeViewController *)self removesMapViewWhenInactive])
  {
    [(ChromeViewController *)self installMapView:v4];
  }
}

- (MapCameraController)mapCameraController
{
  if (!self->_mapCameraController)
  {
    id v3 = [(ChromeViewController *)self mapView];

    if (v3)
    {
      id v4 = sub_1000C49B4();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        __int16 v11 = [MapCameraController alloc];
        id v12 = [(ChromeViewController *)self mapView];
        __int16 v13 = [(MapCameraController *)v11 initWithMapView:v12];
        mapCameraController = self->_mapCameraController;
        self->_mapCameraController = v13;

        [(SearchPinsManager *)self->_searchPinsManager setMapCameraController:self->_mapCameraController];
        goto LABEL_11;
      }
      BOOL v5 = self;
      BOOL v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      if (objc_opt_respondsToSelector())
      {
        id v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
        id v9 = v8;
        if (v8 && ![v8 isEqualToString:v7])
        {
          id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

          goto LABEL_9;
        }
      }
      id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

      *(_DWORD *)long long buf = 138543362;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Creating mapCameraController", buf, 0xCu);

      goto LABEL_10;
    }
  }
LABEL_11:
  BOOL v15 = self->_mapCameraController;

  return v15;
}

- (void)installMapView:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(ChromeViewController *)self isViewLoaded];
  BOOL v6 = sub_1000C49B4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((v5 & 1) == 0)
  {
    if (!v7) {
      goto LABEL_25;
    }
    BOOL v14 = self;
    if (!v14)
    {
      v19 = @"<nil>";
      goto LABEL_24;
    }
    BOOL v15 = (objc_class *)objc_opt_class();
    BOOL v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      id v17 = [(ChromeViewController *)v14 performSelector:"accessibilityIdentifier"];
      __int16 v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_17;
      }
    }
    v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

LABEL_24:
    *(_DWORD *)long long buf = 138543362;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] _installMapView: view not yet loaded", buf, 0xCu);

    goto LABEL_25;
  }
  if (v7)
  {
    id v8 = self;
    if (!v8)
    {
      __int16 v13 = @"<nil>";
      goto LABEL_19;
    }
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      __int16 v11 = [(ChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        __int16 v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_9;
      }
    }
    __int16 v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_9:

LABEL_19:
    mapReplacementView = v8->_mapReplacementView;
    *(_DWORD *)long long buf = 138543874;
    v27 = v13;
    __int16 v28 = 2048;
    id v29 = v4;
    __int16 v30 = 2048;
    id v31 = mapReplacementView;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] _installMapView: installing %p (current _mapReplacementView: %p)", buf, 0x20u);
  }
  v21 = [v4 superview];
  v22 = [(ChromeViewController *)self view];

  if (v21 != v22)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003D134;
    v23[3] = &unk_1012E5D58;
    id v24 = v4;
    v25 = self;
    +[UIView performWithoutAnimation:v23];
  }
  BOOL v6 = [(ChromeViewController *)self view];
  [v6 sendSubviewToBack:v4];
LABEL_25:
}

- (MapSelectionManager)mapSelectionManager
{
  mapSelectionManager = self->_mapSelectionManager;
  if (!mapSelectionManager)
  {
    id v4 = sub_1000C49B4();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      __int16 v11 = [MapSelectionManager alloc];
      id v12 = [(ChromeViewController *)self mapCameraController];
      __int16 v13 = [(MapSelectionManager *)v11 initWithCameraController:v12];
      BOOL v14 = self->_mapSelectionManager;
      self->_mapSelectionManager = v13;

      BOOL v15 = [[ChromeMapSelectionHandler alloc] initWithChromeViewController:self];
      mapSelectionHandler = self->_mapSelectionHandler;
      self->_mapSelectionHandler = v15;

      [(MapSelectionManager *)self->_mapSelectionManager setDelegate:self->_mapSelectionHandler];
      id v17 = [(ChromeViewController *)self customPOIsController];
      [(MapSelectionManager *)self->_mapSelectionManager setCustomPOIsController:v17];

      mapSelectionManager = self->_mapSelectionManager;
      goto LABEL_10;
    }
    unsigned __int8 v5 = self;
    BOOL v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    __int16 v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Creating mapSelectionManager", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:

  return mapSelectionManager;
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v45 = 0;
  id v46 = 0;
  [(ChromeViewController *)self _getContextsLeaving:&v46 entering:&v45 fromPrevious:v8 incoming:v9];
  id v11 = v46;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100107C40;
  v43[3] = &unk_1012E5D58;
  v43[4] = self;
  id v12 = v45;
  id v44 = v12;
  [v10 addPreparation:v43];
  [(GEOObserverHashTable *)self->_stackObservers chromeViewController:self willMoveFromContextStack:v8 toContextStack:v9];
  __int16 v13 = [v9 lastObject];
  BOOL v14 = [v8 lastObject];
  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v13 showsMapView] & 1) == 0)
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100BEC668;
    v40[3] = &unk_1012E6998;
    objc_copyWeak(&v41, &location);
    [v10 addCompletion:v40];
    objc_destroyWeak(&v41);
  }
  if (v14
    && v14 != v13
    && ![(ChromeViewController *)self isSuppressed]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v14 resignTopContextInChromeViewController:self withAnimation:v10];
  }
  __int16 v28 = v8;
  id v29 = v12;
  v25 = v14;
  id v26 = v13;
  v27 = v9;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v37;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        __int16 v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v18 leaveStackInChromeViewController:self withAnimation:v10];
        }
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100BEC6D4;
        v35[3] = &unk_1012E7D28;
        v35[4] = v18;
        [v10 addCompletion:v35, v25, v26];
      }
      id v15 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v15);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v29;
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        if (objc_opt_respondsToSelector()) {
          [v23 setChromeViewController:self];
        }
        if (objc_opt_respondsToSelector()) {
          [v23 prepareToEnterStackInChromeViewController:self];
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v20);
  }

  if (v26) {
    BOOL v24 = v25 == v26;
  }
  else {
    BOOL v24 = 1;
  }
  if (!v24) {
    [(ChromeViewController *)self _updateComponentsIfNeeded:0 forTiming:2 withAnimation:v10];
  }
  objc_destroyWeak(&location);
}

- (void)unregisterAdditionalMapViewDelegate:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000C49B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
LABEL_10:

      id v12 = v11;
      id v13 = v4;
      if (!v13)
      {
        __int16 v18 = @"<nil>";
        goto LABEL_18;
      }
      BOOL v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v16 = [v13 performSelector:"accessibilityIdentifier"];
        id v17 = v16;
        if (v16 && ![v16 isEqualToString:v15])
        {
          __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

          goto LABEL_16;
        }
      }
      __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_16:

LABEL_18:
      *(_DWORD *)long long buf = 138543618;
      id v20 = v12;
      __int16 v21 = 2112;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering additional map view delegate: %@", buf, 0x16u);

      goto LABEL_19;
    }
    BOOL v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(ChromeViewController *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    goto LABEL_10;
  }
LABEL_19:

  [(ChromeDelegateProxy *)self->_mapViewDelegateProxy removeAdditionalDelegate:v4 forProtocol:&OBJC_PROTOCOL___MKMapViewDelegatePrivate];
}

- (void)prepareMapViewForFirstUse
{
  if (!self->_mapView) {
    return;
  }
  id v3 = sub_1000C49B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = self;
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    long long v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing map view for first use", buf, 0xCu);
  }
  [(MKMapView *)self->_mapView _setShowsVenues:1];
  [(MKMapView *)self->_mapView _setLoadLookAroundAvailability:1];
  [(ChromeViewController *)self _setLocalizedStringsForMapView:self->_mapView];
  [(MKMapView *)self->_mapView setBackdropViewQualityChangingDisabled:1];
  [(MKMapView *)self->_mapView _setInactive:self->_inactive];
  [(MKMapView *)self->_mapView _setAllowsPopoverWhenNotInWindow:1];
  id v10 = [(MKMapView *)self->_mapView preferredConfiguration];
  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___MKMapConfigurationHiking]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  [v12 setShowsHiking:1];
  id v13 = +[NSUserDefaults __maps_groupUserDefaults];
  BOOL v14 = [v13 objectForKey:@"MapsLastActivityCamera"];

  if (v14
    || (+[NSUserDefaults standardUserDefaults],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 objectForKey:@"__internal__LastActivityCamera"],
        BOOL v14 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14))
  {
    id v16 = [objc_alloc((Class)GEOURLCamera) initWithData:v14];
    id v17 = [v16 mapCamera];
    if (_GEOConfigHasValue())
    {
      GEOConfigGetDouble();
      [v17 setPitch:];
    }
    [v17 centerCoordinate];
    if (v19 >= -180.0 && v19 <= 180.0 && v18 >= -90.0 && v18 <= 90.0)
    {
      [(MKMapView *)self->_mapView setCamera:v17];
      if (_GEOConfigHasValue())
      {
        mapView = self->_mapView;
        [(MKMapView *)mapView centerCoordinate];
        double v22 = v21;
        double v24 = v23;
        GEOConfigGetDouble();
        -[MKMapView setCenterCoordinate:zoomLevel:animated:](mapView, "setCenterCoordinate:zoomLevel:animated:", 0, v22, v24, v25 + 2.0);
      }
    }
  }
  id v26 = [(ChromeViewController *)self view];
  v27 = [v26 window];
  __int16 v28 = [v27 windowScene];

  if (v28)
  {
    id v29 = +[NSDate date];
    mapViewEnteredForegroundDate = self->_mapViewEnteredForegroundDate;
    self->_mapViewEnteredForegroundDate = v29;
  }
  long long v31 = +[NSNotificationCenter defaultCenter];
  [v31 postNotificationName:@"ChromeViewControllerDidLoadMapViewNotification" object:self];

  long long v32 = +[GEOOfflineService shared];
  [v32 registerMapView:self->_mapView withPriority:0.0];
}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [v10 isAnimated];
  id v12 = [v9 lastObject];
  uint64_t v13 = [v8 lastObject];
  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v12 showsMapView])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100010758;
    v41[3] = &unk_1012E6708;
    objc_copyWeak(&v42, &location);
    [v10 addPreparation:v41];
    objc_destroyWeak(&v42);
  }
  id v39 = 0;
  id v40 = 0;
  [(ChromeViewController *)self _getContextsLeaving:&v40 entering:&v39 fromPrevious:v8 incoming:v9];
  unsigned int v25 = v11;
  id v26 = v8;
  v27 = (void *)v13;
  id v24 = v40;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v39;
  id v15 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v36;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v14);
        }
        double v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v18 enterStackInChromeViewController:self withAnimation:v10];
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v15);
  }

  double v19 = v24;
  if (v12 && v12 != v27)
  {
    if (![(ChromeViewController *)self isSuppressed] && (objc_opt_respondsToSelector() & 1) != 0) {
      [v12 becomeTopContextInChromeViewController:self withAnimation:v10];
    }
    -[ChromeViewController _refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:](self, "_refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:", v12, v25, 0, v24);
    [(ChromeViewController *)self _updateComponentsIfNeeded:0 forTiming:4 withAnimation:v10];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10001A328;
    v32[3] = &unk_1012ED4B8;
    v32[4] = self;
    id v33 = v12;
    char v34 = v25;
    [v10 addAnimations:0 completion:v32];
  }
  if (v27) {
    id v20 = [v19 containsObject:v27];
  }
  else {
    id v20 = 0;
  }
  -[ChromeViewController _updateFullscreenViewControllerForContext:previousIsLeaving:withAnimation:](self, "_updateFullscreenViewControllerForContext:previousIsLeaving:withAnimation:", v12, v20, v10, v24);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100107D84;
  v28[3] = &unk_1012F4120;
  v28[4] = self;
  id v21 = v26;
  id v29 = v21;
  id v22 = v9;
  id v30 = v22;
  id v23 = v19;
  id v31 = v23;
  [v10 addAnimations:0 completion:v28];

  objc_destroyWeak(&location);
}

- (void)decrementForToken:(id)a3
{
  id v4 = (__CFString *)a3;
  unsigned __int8 v5 = [(__CFString *)v4 tokenGroupName];
  unsigned int v6 = [v5 isEqualToString:@"ChromeDeactivation"];

  if (v6)
  {
    BOOL v7 = sub_1000C49B4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    id v8 = self;
    if (!v8)
    {
      uint64_t v13 = @"<nil>";
      goto LABEL_29;
    }
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v11 = [(ChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        uint64_t v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_9;
      }
    }
    uint64_t v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_9:

LABEL_29:
    *(_DWORD *)long long buf = 138543618;
    v59 = v13;
    __int16 v60 = 2114;
    v61 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivation token removed: %{public}@", buf, 0x16u);

LABEL_30:
    if (![(MapsTokenStorage *)self->_deactivationTokens count])
    {
      [(ChromeViewController *)self _setInactive:0];
LABEL_49:
      [(ChromeViewController *)self deactivationReasonsDidChange];
      goto LABEL_50;
    }
    long long v32 = sub_1000C49B4();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
LABEL_48:

      goto LABEL_49;
    }
    id v33 = self;
    char v34 = (objc_class *)objc_opt_class();
    long long v35 = NSStringFromClass(v34);
    if (objc_opt_respondsToSelector())
    {
      long long v36 = [(ChromeViewController *)v33 performSelector:"accessibilityIdentifier"];
      long long v37 = v36;
      if (v36 && ![v36 isEqualToString:v35])
      {
        long long v38 = +[NSString stringWithFormat:@"%@<%p, %@>", v35, v33, v37];

        goto LABEL_37;
      }
    }
    long long v38 = +[NSString stringWithFormat:@"%@<%p>", v35, v33];
LABEL_37:

    id v39 = v38;
    id v40 = [(MapsTokenStorage *)self->_deactivationTokens allTokenReasons];
    id v41 = v40;
    if (v40)
    {
      if ([v40 count])
      {
        id v42 = [v41 componentsJoinedByString:@", "];
        v43 = +[NSString stringWithFormat:@"<%p> [%@]", v41, v42];
      }
      else
      {
        v43 = +[NSString stringWithFormat:@"<%p> (empty)", v41];
      }
    }
    else
    {
      v43 = @"<nil>";
    }

    *(_DWORD *)long long buf = 138543618;
    v59 = v39;
    __int16 v60 = 2114;
    v61 = v43;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}@] Remaining deactivated for reasons: %{public}@", buf, 0x16u);

    goto LABEL_48;
  }
  id v14 = [(__CFString *)v4 tokenGroupName];
  unsigned int v15 = [v14 isEqualToString:@"ChromeHiking"];

  if (!v15)
  {
    id v23 = [(__CFString *)v4 tokenGroupName];
    unsigned int v24 = [v23 isEqualToString:@"ChromeMapInsetPropagationSuspension"];

    if (!v24) {
      goto LABEL_50;
    }
    unsigned int v25 = sub_1000C49B4();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
LABEL_55:

      if (![(MapsTokenStorage *)self->_mapInsetPropagationSuspensionTokens count])
      {
        v57 = [(ChromeViewController *)self mapView];
        [v57 _resumePropagatingEdgeInsets];

        goto LABEL_50;
      }
      id v45 = sub_1000C49B4();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
LABEL_70:

        goto LABEL_50;
      }
      id v46 = self;
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      if (objc_opt_respondsToSelector())
      {
        v49 = [(ChromeViewController *)v46 performSelector:"accessibilityIdentifier"];
        v50 = v49;
        if (v49 && ![v49 isEqualToString:v48])
        {
          v51 = +[NSString stringWithFormat:@"%@<%p, %@>", v48, v46, v50];

          goto LABEL_62;
        }
      }
      v51 = +[NSString stringWithFormat:@"%@<%p>", v48, v46];
LABEL_62:

      v52 = v51;
      id v53 = [(MapsTokenStorage *)self->_mapInsetPropagationSuspensionTokens allTokenReasons];
      v54 = v53;
      if (v53)
      {
        if ([v53 count])
        {
          v55 = [v54 componentsJoinedByString:@", "];
          v56 = +[NSString stringWithFormat:@"<%p> [%@]", v54, v55];
        }
        else
        {
          v56 = +[NSString stringWithFormat:@"<%p> (empty)", v54];
        }
      }
      else
      {
        v56 = @"<nil>";
      }

      *(_DWORD *)long long buf = 138543618;
      v59 = v52;
      __int16 v60 = 2114;
      v61 = v56;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[%{public}@] Still suspending map inset propagation for reasons: %{public}@", buf, 0x16u);

      goto LABEL_70;
    }
    id v26 = self;
    if (!v26)
    {
      id v31 = @"<nil>";
      goto LABEL_54;
    }
    v27 = (objc_class *)objc_opt_class();
    __int16 v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      id v29 = [(ChromeViewController *)v26 performSelector:"accessibilityIdentifier"];
      id v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        id v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_27;
      }
    }
    id v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_27:

LABEL_54:
    *(_DWORD *)long long buf = 138543618;
    v59 = v31;
    __int16 v60 = 2114;
    v61 = v4;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Map inset propagation suspension removed: %{public}@", buf, 0x16u);

    goto LABEL_55;
  }
  uint64_t v16 = sub_1000C49B4();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_44;
  }
  id v17 = self;
  if (!v17)
  {
    id v22 = @"<nil>";
    goto LABEL_43;
  }
  double v18 = (objc_class *)objc_opt_class();
  double v19 = NSStringFromClass(v18);
  if (objc_opt_respondsToSelector())
  {
    id v20 = [(ChromeViewController *)v17 performSelector:"accessibilityIdentifier"];
    id v21 = v20;
    if (v20 && ![v20 isEqualToString:v19])
    {
      id v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

      goto LABEL_18;
    }
  }
  id v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_18:

LABEL_43:
  *(_DWORD *)long long buf = 138543618;
  v59 = v22;
  __int16 v60 = 2114;
  v61 = v4;
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Hiking token removed: %{public}@", buf, 0x16u);

LABEL_44:
  id v44 = [(ChromeViewController *)self mapView];

  if (v44) {
    [(ChromeViewController *)self updateHikingMapConfiguration];
  }
LABEL_50:
}

- (ChromeViewController)init
{
  v46.receiver = self;
  v46.super_class = (Class)ChromeViewController;
  v2 = [(ChromeViewController *)&v46 initWithNibName:0 bundle:0];
  if (!v2) {
    return v2;
  }
  id v3 = sub_1000C49B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = v2;
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    unsigned int v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Initializing", buf, 0xCu);
  }
  id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentMapViewRateLimits = v2->_currentMapViewRateLimits;
  v2->_currentMapViewRateLimits = v10;

  uint64_t v12 = +[MapsThermalPressureController sharedController];
  thermalPressureController = v2->_thermalPressureController;
  v2->_thermalPressureController = (MapsThermalPressureController *)v12;

  if (!v2->_thermalPressureController)
  {
    v43 = sub_1005762E4();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315906;
      v48 = "-[ChromeViewController init]";
      __int16 v49 = 2080;
      v50 = "ChromeViewController.m";
      __int16 v51 = 1024;
      int v52 = 248;
      __int16 v53 = 2080;
      v54 = "_thermalPressureController != nil";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v44 = sub_1005762E4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        id v45 = +[NSThread callStackSymbols];
        *(_DWORD *)long long buf = 138412290;
        v48 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  [(MapsThermalPressureController *)v2->_thermalPressureController addThermalPressureObserver:v2];
  if ([(ChromeViewController *)v2 thermalRateLimitsConfigKey] && v14) {
    _GEOConfigAddDelegateListenerForKey();
  }
  if ([(ChromeViewController *)v2 batteryLevelRateLimitEnabledConfigKey]&& v15)
  {
    _GEOConfigAddDelegateListenerForKey();
  }
  if ([(ChromeViewController *)v2 lowPowerModeRateLimitEnabledConfigKey]&& v16)
  {
    _GEOConfigAddDelegateListenerForKey();
  }
  id v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:v2 selector:"powerStateDidChangeNotification:" name:NSProcessInfoPowerStateDidChangeNotification object:0];

  double v18 = +[BatteryMonitorController sharedInstance];
  uint64_t v19 = [v18 beginMonitoringBattery];
  batteryMonitorToken = v2->_batteryMonitorToken;
  v2->_batteryMonitorToken = (BatteryMonitorToken *)v19;

  [(BatteryMonitorToken *)v2->_batteryMonitorToken setDelegate:v2];
  id v21 = [[MapsTokenStorage alloc] initWithDelegate:v2 tokenGroupName:@"ChromeDeactivation" callbackQueue:&_dispatch_main_q];
  deactivationTokens = v2->_deactivationTokens;
  v2->_deactivationTokens = v21;

  id v23 = [[MapsTokenStorage alloc] initWithDelegate:v2 tokenGroupName:@"ChromeHiking" callbackQueue:&_dispatch_main_q];
  hikingMapTokens = v2->_hikingMapTokens;
  v2->_hikingMapTokens = v23;

  uint64_t v25 = +[NSMapTable strongToStrongObjectsMapTable];
  hikingCoordinateChecks = v2->_hikingCoordinateChecks;
  v2->_hikingCoordinateChecks = (NSMapTable *)v25;

  v27 = [[MapsTokenStorage alloc] initWithDelegate:v2 tokenGroupName:@"ChromeMapInsetPropagationSuspension" callbackQueue:&_dispatch_main_q];
  mapInsetPropagationSuspensionTokens = v2->_mapInsetPropagationSuspensionTokens;
  v2->_mapInsetPropagationSuspensionTokens = v27;

  id v29 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  contexts = v2->_contexts;
  v2->_contexts = v29;

  if ([(id)objc_opt_class() requiresUniqueContextIdentifiers])
  {
    uint64_t v31 = +[NSMapTable strongToWeakObjectsMapTable];
    contextsByUniqueIdentifier = v2->_contextsByUniqueIdentifier;
    v2->_contextsByUniqueIdentifier = (NSMapTable *)v31;
  }
  id v33 = +[NSUserDefaults standardUserDefaults];
  unsigned int v34 = [v33 BOOLForKey:@"__internal_MapsDebugForceChromeMapViewInactive"];

  if (v34)
  {
    uint64_t v35 = [(ChromeViewController *)v2 acquireChromeDeactivationTokenForReason:@"forced"];
    id debugForceDeactivationToken = v2->_debugForceDeactivationToken;
    v2->_id debugForceDeactivationToken = (id)v35;
  }
  long long v37 = +[NSUserDefaults standardUserDefaults];
  v2->_debugLayoutGuides = [v37 BOOLForKey:@"__internal_VisualizeChromeLayoutGuidesDebug"];

  long long v38 = +[NSNotificationCenter defaultCenter];
  [v38 addObserver:v2 selector:"userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];
  id v39 = +[GEOPlatform sharedPlatform];
  unsigned int v40 = [v39 isInternalInstall];

  if (v40)
  {
    id v41 = +[MapsRadarController sharedInstance];
    [v41 addAttachmentProvider:v2];
  }
  return v2;
}

- (void)_transitionToFullscreenViewController:(id)a3 forContext:(id)a4 previousIsLeaving:(BOOL)a5 withAnimation:(id)a6
{
  uint64_t v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = sub_1000C49B4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = self;
    if (!v15)
    {
      id v21 = @"<nil>";
      goto LABEL_10;
    }
    unsigned int v50 = v7;
    id v16 = v13;
    id v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v19 = [(ChromeViewController *)v15 performSelector:"accessibilityIdentifier"];
      id v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        id v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v15, v20];

        goto LABEL_8;
      }
    }
    id v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v15];
LABEL_8:

    id v13 = v16;
    uint64_t v7 = v50;
LABEL_10:

    *(_DWORD *)long long buf = 138543874;
    v62 = v21;
    __int16 v63 = 2112;
    id v64 = v11;
    __int16 v65 = 2112;
    id v66 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] _transitionToFullscreenViewController %@ for context %@", buf, 0x20u);
  }
  id v22 = self->_fullscreenViewController;
  objc_storeStrong((id *)&self->_fullscreenViewController, a3);
  id v23 = v22;
  unint64_t v24 = (unint64_t)v11;
  if (v24 | (unint64_t)v23)
  {
    unsigned __int8 v25 = [v23 isEqual:v24];

    if ((v25 & 1) == 0)
    {
      id v26 = [(ChromeViewController *)self view];
      uint64_t v27 = [(id)v24 view];
      __int16 v28 = [v23 view];
      id v29 = objc_alloc_init((Class)_UIViewControllerOneToOneTransitionContext);
      v47 = v13;
      [v29 _setIsAnimated:[v13 isAnimated]];
      [v29 _setContainerView:v26];
      [v29 _setFromViewController:v23];
      [v29 _setFromView:v28];
      [v26 bounds];
      [v29 _setFromStartFrame:];
      [v26 bounds];
      [v29 _setFromEndFrame:];
      [v29 _setToViewController:v24];
      v48 = (void *)v27;
      [v29 _setToView:v27];
      [v26 bounds];
      [v29 _setToStartFrame:];
      __int16 v49 = v26;
      [v26 bounds];
      [v29 _setToEndFrame:];
      id v30 = [(ChromeViewController *)self previousTopContext];
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ([v12 fullscreenViewControllerPresentationTransition],
            (uint64_t v31 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([v30 fullscreenViewControllerDismissalTransition],
              (uint64_t v31 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v31 = [(ChromeViewController *)self fullscreenViewControllerTransitionFromController:v23 toController:v24 isDismissTransition:v7];
        }
      }
      objc_super v46 = v30;
      [v31 transitionDuration:v29];
      [v29 _setDuration:];
      [v29 _setAnimator:v31];
      long long v32 = self;
      id v33 = (objc_class *)objc_opt_class();
      unsigned int v34 = NSStringFromClass(v33);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v35 = [(ChromeViewController *)v32 performSelector:"accessibilityIdentifier"];
        long long v36 = v35;
        if (v35 && ![v35 isEqualToString:v34])
        {
          long long v37 = +[NSString stringWithFormat:@"%@<%p, %@>", v34, v32, v36];

          goto LABEL_23;
        }
      }
      long long v37 = +[NSString stringWithFormat:@"%@<%p>", v34, v32];
LABEL_23:

      long long v38 = +[NSString stringWithFormat:@"%@: waiting for chrome full-screen view controller transition to complete", v37];
      id v39 = [v47 addCompletionWaitBlockWithReason:v38];

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10005EF40;
      v51[3] = &unk_10131B120;
      v51[4] = v32;
      id v52 = (id)v24;
      id v53 = v12;
      id v54 = v48;
      id v55 = v49;
      id v56 = v23;
      id v57 = v28;
      id v59 = v31;
      id v60 = v39;
      id v58 = v29;
      id v45 = v31;
      id v44 = v29;
      id v40 = v39;
      id v41 = v28;
      id v42 = v49;
      id v43 = v48;
      [v47 addPreparation:v51 animations:0 completion:0];

      id v13 = v47;
    }
  }
}

- (void)updateMapViewFrameRate
{
  id v3 = [(ChromeViewController *)self view];
  id v4 = [v3 sceneIdentifierForLogging];

  unsigned int v5 = [(ChromeViewController *)self isEligibleForMapViewFrameRateLimiting];
  unsigned int v6 = sub_1000C49B4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (!v7)
    {
LABEL_30:

      [(ChromeViewController *)self _clearFrameRateLimits];
      goto LABEL_99;
    }
    uint64_t v14 = self;
    if (!v14)
    {
      uint64_t v19 = @"<nil>";
      goto LABEL_29;
    }
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      id v17 = [(ChromeViewController *)v14 performSelector:"accessibilityIdentifier"];
      double v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        uint64_t v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_17;
      }
    }
    uint64_t v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

LABEL_29:
    *(_DWORD *)long long buf = 138543618;
    v110 = v19;
    __int16 v111 = 2112;
    v112 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Not eligible for map view frame rate limiting", buf, 0x16u);

    goto LABEL_30;
  }
  if (!v7) {
    goto LABEL_20;
  }
  id v8 = self;
  if (!v8)
  {
    id v13 = @"<nil>";
    goto LABEL_19;
  }
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(ChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
    id v12 = v11;
    if (v11 && ![v11 isEqualToString:v10])
    {
      id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

      goto LABEL_9;
    }
  }
  id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_9:

LABEL_19:
  *(_DWORD *)long long buf = 138543618;
  v110 = v13;
  __int16 v111 = 2112;
  v112 = v4;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Eligible for map view frame rate limiting", buf, 0x16u);

LABEL_20:
  id v20 = [(ChromeViewController *)self thermalRateLimits];
  id v21 = sub_1000C49B4();
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    goto LABEL_33;
  }
  id v22 = self;
  if (!v22)
  {
    uint64_t v27 = @"<nil>";
    goto LABEL_32;
  }
  id v23 = (objc_class *)objc_opt_class();
  unint64_t v24 = NSStringFromClass(v23);
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v25 = [(ChromeViewController *)v22 performSelector:"accessibilityIdentifier"];
    id v26 = v25;
    if (v25 && ![v25 isEqualToString:v24])
    {
      uint64_t v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

      goto LABEL_27;
    }
  }
  uint64_t v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_27:

LABEL_32:
  *(_DWORD *)long long buf = 138543874;
  v110 = v27;
  __int16 v111 = 2112;
  v112 = v4;
  __int16 v113 = 2112;
  unint64_t v114 = (unint64_t)v20;
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Checking thermal rate limit config dictionary: %@", buf, 0x20u);

LABEL_33:
  uint64_t v28 = [(MapsThermalPressureController *)self->_thermalPressureController currentThermalPressureLevel];
  id v29 = +[NSNumber numberWithUnsignedInt:v28];
  id v30 = [v29 stringValue];
  uint64_t v31 = [(__CFString *)v20 objectForKey:v30];

  if (!v31)
  {
    id v41 = sub_1000C49B4();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
LABEL_49:

      [(ChromeViewController *)self _removeFrameRateLimitForReason:0];
      goto LABEL_50;
    }
    id v42 = self;
    id v43 = (objc_class *)objc_opt_class();
    id v44 = NSStringFromClass(v43);
    if (objc_opt_respondsToSelector())
    {
      id v45 = v20;
      objc_super v46 = [(ChromeViewController *)v42 performSelector:"accessibilityIdentifier"];
      v47 = v46;
      if (v46 && ![v46 isEqualToString:v44])
      {
        v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v44, v42, v47];

        id v20 = v45;
        uint64_t v31 = 0;
        goto LABEL_48;
      }

      id v20 = v45;
      uint64_t v31 = 0;
    }
    v48 = +[NSString stringWithFormat:@"%@<%p>", v44, v42];
LABEL_48:

    *(_DWORD *)long long buf = 138543874;
    v110 = v48;
    __int16 v111 = 2112;
    v112 = v4;
    __int16 v113 = 2048;
    unint64_t v114 = v28;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Thermal pressure level (%ld) is not present in rate limit dictionary", buf, 0x20u);

    goto LABEL_49;
  }
  long long v32 = (__CFString *)[v31 integerValue];
  id v33 = sub_1000C49B4();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    unsigned int v34 = self;
    uint64_t v35 = (objc_class *)objc_opt_class();
    long long v36 = NSStringFromClass(v35);
    v107 = v31;
    if (objc_opt_respondsToSelector())
    {
      long long v37 = [(ChromeViewController *)v34 performSelector:"accessibilityIdentifier"];
      long long v38 = v37;
      if (v37 && ![v37 isEqualToString:v36])
      {
        id v39 = v20;
        id v40 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

        goto LABEL_40;
      }
    }
    id v39 = v20;
    id v40 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_40:

    *(_DWORD *)long long buf = 138544130;
    v110 = v40;
    __int16 v111 = 2112;
    v112 = v4;
    __int16 v113 = 2048;
    unint64_t v114 = (unint64_t)v32;
    __int16 v115 = 2048;
    *(void *)&double v116 = v28;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Found display rate (%ld) for thermal pressure level (%ld) in rate limit dictionary", buf, 0x2Au);

    id v20 = v39;
    uint64_t v31 = v107;
  }

  [(ChromeViewController *)self _limitFrameRate:v32 forReason:0];
LABEL_50:
  unsigned int v49 = [(ChromeViewController *)self isLowPowerModeFrameRateLimitingEnabled];
  unsigned int v50 = +[NSProcessInfo processInfo];
  unsigned int v51 = [v50 isLowPowerModeEnabled];

  if (!v51 || (v49 & 1) == 0)
  {
    id v60 = sub_1000C49B4();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
LABEL_73:

      [(ChromeViewController *)self _removeFrameRateLimitForReason:2];
      goto LABEL_74;
    }
    v61 = self;
    v62 = (objc_class *)objc_opt_class();
    __int16 v63 = NSStringFromClass(v62);
    v108 = v31;
    if (objc_opt_respondsToSelector())
    {
      id v64 = [(ChromeViewController *)v61 performSelector:"accessibilityIdentifier"];
      __int16 v65 = v64;
      if (v64 && ![v64 isEqualToString:v63])
      {
        id v66 = v20;
        v67 = +[NSString stringWithFormat:@"%@<%p, %@>", v63, v61, v65];

        goto LABEL_66;
      }
    }
    id v66 = v20;
    v67 = +[NSString stringWithFormat:@"%@<%p>", v63, v61];
LABEL_66:

    if (v51) {
      v68 = @"YES";
    }
    else {
      v68 = @"NO";
    }
    v69 = v68;
    if (v49) {
      v70 = @"YES";
    }
    else {
      v70 = @"NO";
    }
    v71 = v70;
    *(_DWORD *)long long buf = 138544130;
    v110 = v67;
    __int16 v111 = 2112;
    v112 = v4;
    __int16 v113 = 2114;
    unint64_t v114 = (unint64_t)v69;
    __int16 v115 = 2114;
    double v116 = *(double *)&v71;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Low power mode is either off (%{public}@) or the network default is disabled (%{public}@)", buf, 0x2Au);

    id v20 = v66;
    uint64_t v31 = v108;
    goto LABEL_73;
  }
  uint64_t Integer = GEOConfigGetInteger();
  id v53 = sub_1000C49B4();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    id v54 = self;
    id v55 = (objc_class *)objc_opt_class();
    id v56 = NSStringFromClass(v55);
    if (objc_opt_respondsToSelector())
    {
      id v57 = [(ChromeViewController *)v54 performSelector:"accessibilityIdentifier"];
      id v58 = v57;
      if (v57 && ![v57 isEqualToString:v56])
      {
        id v59 = +[NSString stringWithFormat:@"%@<%p, %@>", v56, v54, v58];

        goto LABEL_58;
      }
    }
    id v59 = +[NSString stringWithFormat:@"%@<%p>", v56, v54];
LABEL_58:

    *(_DWORD *)long long buf = 138543874;
    v110 = v59;
    __int16 v111 = 2112;
    v112 = v4;
    __int16 v113 = 2048;
    unint64_t v114 = Integer;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Limiting map view display rate for low power mode: %ld", buf, 0x20u);
  }
  [(ChromeViewController *)self _limitFrameRate:Integer forReason:2];
LABEL_74:
  unsigned int v72 = [(ChromeViewController *)self isBatteryLevelFrameRateLimitingEnabled];
  GEOConfigGetDouble();
  double v74 = v73;
  [(BatteryMonitorToken *)self->_batteryMonitorToken currentBatteryLevel];
  double v76 = v75;
  if (!v72 || v74 < v76)
  {
    v85 = sub_1000C49B4();
    if (!os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
LABEL_97:

      [(ChromeViewController *)self _removeFrameRateLimitForReason:1];
      goto LABEL_98;
    }
    v86 = self;
    v87 = (objc_class *)objc_opt_class();
    v88 = NSStringFromClass(v87);
    if (objc_opt_respondsToSelector())
    {
      v89 = [(ChromeViewController *)v86 performSelector:"accessibilityIdentifier"];
      v90 = v89;
      if (v89 && ![v89 isEqualToString:v88])
      {
        v91 = +[NSString stringWithFormat:@"%@<%p, %@>", v88, v86, v90];

        goto LABEL_90;
      }
    }
    v91 = +[NSString stringWithFormat:@"%@<%p>", v88, v86];
LABEL_90:

    if (v74 < v76) {
      v92 = @"YES";
    }
    else {
      v92 = @"NO";
    }
    v93 = v92;
    if (v72) {
      v94 = @"YES";
    }
    else {
      v94 = @"NO";
    }
    v95 = v94;
    *(_DWORD *)long long buf = 138544130;
    v110 = v91;
    __int16 v111 = 2112;
    v112 = v4;
    __int16 v113 = 2114;
    unint64_t v114 = (unint64_t)v93;
    __int16 v115 = 2114;
    double v116 = *(double *)&v95;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Battery level is either too high (%{public}@) or the network default is disabled (%{public}@)", buf, 0x2Au);

    goto LABEL_97;
  }
  uint64_t v77 = GEOConfigGetInteger();
  v78 = sub_1000C49B4();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    v79 = self;
    v80 = (objc_class *)objc_opt_class();
    v81 = NSStringFromClass(v80);
    if (objc_opt_respondsToSelector())
    {
      v82 = [(ChromeViewController *)v79 performSelector:"accessibilityIdentifier"];
      v83 = v82;
      if (v82 && ![v82 isEqualToString:v81])
      {
        v84 = +[NSString stringWithFormat:@"%@<%p, %@>", v81, v79, v83];

        goto LABEL_82;
      }
    }
    v84 = +[NSString stringWithFormat:@"%@<%p>", v81, v79];
LABEL_82:

    *(_DWORD *)long long buf = 138544386;
    v110 = v84;
    __int16 v111 = 2112;
    v112 = v4;
    __int16 v113 = 2048;
    unint64_t v114 = v77;
    __int16 v115 = 2048;
    double v116 = v76;
    __int16 v117 = 2048;
    double v118 = v74;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Limiting map view display rate (%ld) for battery level (%f) and threshold (%f)", buf, 0x34u);
  }
  [(ChromeViewController *)self _limitFrameRate:v77 forReason:1];
LABEL_98:

LABEL_99:
  int64_t v96 = [(ChromeViewController *)self _currentFrameRateLimit];
  v97 = [(ChromeViewController *)self mapView];
  v98 = [v97 _mapLayer];

  v99 = sub_1000C49B4();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
  {
    v100 = self;
    if (!v100)
    {
      v105 = @"<nil>";
      goto LABEL_108;
    }
    v101 = (objc_class *)objc_opt_class();
    v102 = NSStringFromClass(v101);
    if (objc_opt_respondsToSelector())
    {
      v103 = [(ChromeViewController *)v100 performSelector:"accessibilityIdentifier"];
      v104 = v103;
      if (v103 && ![v103 isEqualToString:v102])
      {
        v105 = +[NSString stringWithFormat:@"%@<%p, %@>", v102, v100, v104];

        goto LABEL_106;
      }
    }
    v105 = +[NSString stringWithFormat:@"%@<%p>", v102, v100];
LABEL_106:

LABEL_108:
    *(_DWORD *)long long buf = 138544130;
    v110 = v105;
    __int16 v111 = 2112;
    v112 = v4;
    __int16 v113 = 2048;
    unint64_t v114 = v96;
    __int16 v115 = 2048;
    double v116 = *(double *)&v98;
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Updating nav display rate: %ld on map view: %p", buf, 0x2Au);
  }
  [(__CFString *)v98 setNavigationDisplayRate:v96];
  v106 = [(ChromeViewController *)self navigationDisplay];
  [v106 updateDisplayRate];
}

- (int64_t)_currentFrameRateLimit
{
  if ([(ChromeViewController *)self isThrottlingMapViewFrameRate])
  {
    id v3 = sub_1000C49B4();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_12;
    }
    unsigned int v5 = (objc_class *)objc_opt_class();
    unsigned int v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_9;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_9:

LABEL_12:
    id v11 = [(ChromeViewController *)v4 view];
    id v12 = [v11 sceneIdentifierForLogging];
    id v13 = [(ChromeViewController *)v4 currentMapViewRateLimits];
    *(_DWORD *)long long buf = 138543874;
    long long v37 = v9;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    int64_t v41 = (int64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Will check map view rate limit dictionary to determine the current frame rate limit: %@", buf, 0x20u);

LABEL_13:
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = [(ChromeViewController *)self currentMapViewRateLimits];
    uint64_t v15 = [v14 allValues];

    id v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(*((void *)&v31 + 1) + 8 * i) integerValue];
          if ((uint64_t)v20 < v10) {
            int64_t v10 = (int64_t)v20;
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
    }
    else
    {
      int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }

    id v21 = sub_1000C49B4();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_34;
    }
    id v22 = self;
    if (!v22)
    {
      uint64_t v27 = @"<nil>";
      goto LABEL_33;
    }
    id v23 = (objc_class *)objc_opt_class();
    unint64_t v24 = NSStringFromClass(v23);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v25 = [(ChromeViewController *)v22 performSelector:"accessibilityIdentifier"];
      id v26 = v25;
      if (v25 && ![v25 isEqualToString:v24])
      {
        uint64_t v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

        goto LABEL_31;
      }
    }
    uint64_t v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_31:

LABEL_33:
    uint64_t v28 = [(ChromeViewController *)v22 view];
    id v29 = [v28 sceneIdentifierForLogging];
    *(_DWORD *)long long buf = 138543874;
    long long v37 = v27;
    __int16 v38 = 2112;
    id v39 = v29;
    __int16 v40 = 2048;
    int64_t v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Got new map view rate limit: %ld", buf, 0x20u);

LABEL_34:
    return v10;
  }
  return 0;
}

- (BOOL)isThrottlingMapViewFrameRate
{
  v2 = [(ChromeViewController *)self currentMapViewRateLimits];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_clearFrameRateLimits
{
  BOOL v3 = sub_1000C49B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    unsigned int v5 = (objc_class *)objc_opt_class();
    unsigned int v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    int64_t v10 = [(ChromeViewController *)v4 view];
    id v11 = [v10 sceneIdentifierForLogging];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Clearing frame rate limits", buf, 0x16u);
  }
  id v12 = [(ChromeViewController *)self currentMapViewRateLimits];
  [v12 removeAllObjects];
}

- (NSMutableDictionary)currentMapViewRateLimits
{
  return self->_currentMapViewRateLimits;
}

- (void)userDefaultsDidChange:(id)a3
{
  id v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v8 BOOLForKey:@"__internal_VisualizeChromeLayoutGuidesDebug"];
  if (self->_debugLayoutGuides != v4)
  {
    self->_debugLayoutGuides = v4;
    [(ChromeViewController *)self _updateDebugLayoutGuidesView];
  }
  unsigned int v5 = [v8 BOOLForKey:@"__internal_MapsDebugForceChromeMapViewInactive"];
  id debugForceDeactivationToken = self->_debugForceDeactivationToken;
  if (v5)
  {
    if (debugForceDeactivationToken) {
      goto LABEL_9;
    }
    BOOL v7 = [(ChromeViewController *)self acquireChromeDeactivationTokenForReason:@"forced"];
    id debugForceDeactivationToken = self->_debugForceDeactivationToken;
  }
  else
  {
    if (!debugForceDeactivationToken) {
      goto LABEL_9;
    }
    BOOL v7 = 0;
  }
  self->_id debugForceDeactivationToken = v7;

LABEL_9:
}

- (void)incrementForToken:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 tokenGroupName];
  unsigned int v6 = [v5 isEqualToString:@"ChromeDeactivation"];

  if (v6)
  {
    BOOL v7 = sub_1000C49B4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    id v8 = self;
    if (!v8)
    {
      id v13 = @"<nil>";
      goto LABEL_29;
    }
    id v9 = (objc_class *)objc_opt_class();
    int64_t v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(ChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_9;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_9:

LABEL_29:
    *(_DWORD *)long long buf = 138543618;
    v69 = (const char *)v13;
    __int16 v70 = 2114;
    v71 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivation token added: %{public}@", buf, 0x16u);

LABEL_30:
    unint64_t v32 = [(MapsTokenStorage *)self->_deactivationTokens count];
    if (v32 == 1)
    {
      [(ChromeViewController *)self _setInactive:1];
LABEL_50:
      [(ChromeViewController *)self deactivationReasonsDidChange];
      goto LABEL_51;
    }
    if (!v32)
    {
      id v60 = sub_1005762E4();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = +[NSString stringWithFormat:@"incremented token, we should have >1 now (actually have %lu)", 0];
        *(_DWORD *)long long buf = 136316162;
        v69 = "-[ChromeViewController incrementForToken:]";
        __int16 v70 = 2080;
        v71 = "ChromeViewController.m";
        __int16 v72 = 1024;
        int v73 = 1958;
        __int16 v74 = 2080;
        float v75 = "count > 0";
        __int16 v76 = 2112;
        uint64_t v77 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v62 = sub_1005762E4();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          __int16 v63 = +[NSThread callStackSymbols];
          *(_DWORD *)long long buf = 138412290;
          v69 = v63;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    long long v33 = sub_1000C49B4();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
LABEL_49:

      goto LABEL_50;
    }
    long long v34 = self;
    uint64_t v35 = (objc_class *)objc_opt_class();
    long long v36 = NSStringFromClass(v35);
    if (objc_opt_respondsToSelector())
    {
      long long v37 = [(ChromeViewController *)v34 performSelector:"accessibilityIdentifier"];
      __int16 v38 = v37;
      if (v37 && ![v37 isEqualToString:v36])
      {
        id v39 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

        goto LABEL_38;
      }
    }
    id v39 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_38:

    __int16 v40 = v39;
    id v41 = [(MapsTokenStorage *)self->_deactivationTokens allTokenReasons];
    id v42 = v41;
    if (v41)
    {
      if ([v41 count])
      {
        id v43 = [v42 componentsJoinedByString:@", "];
        id v44 = +[NSString stringWithFormat:@"<%p> [%@]", v42, v43];
      }
      else
      {
        id v44 = +[NSString stringWithFormat:@"<%p> (empty)", v42];
      }
    }
    else
    {
      id v44 = @"<nil>";
    }

    *(_DWORD *)long long buf = 138543618;
    v69 = v40;
    __int16 v70 = 2114;
    v71 = (const char *)v44;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}@] Remaining deactivated for reasons: %{public}@", buf, 0x16u);

    goto LABEL_49;
  }
  uint64_t v14 = [v4 tokenGroupName];
  unsigned int v15 = [v14 isEqualToString:@"ChromeHiking"];

  if (!v15)
  {
    id v23 = [v4 tokenGroupName];
    unsigned int v24 = [v23 isEqualToString:@"ChromeMapInsetPropagationSuspension"];

    if (!v24) {
      goto LABEL_51;
    }
    unsigned __int8 v25 = sub_1000C49B4();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
LABEL_55:

      unint64_t v46 = [(MapsTokenStorage *)self->_mapInsetPropagationSuspensionTokens count];
      if (v46 == 1)
      {
        id v59 = [(ChromeViewController *)self mapView];
        [v59 _suspendPropagatingEdgeInsets];

        goto LABEL_51;
      }
      if (!v46)
      {
        id v64 = sub_1005762E4();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          __int16 v65 = +[NSString stringWithFormat:@"incremented token, we should have >1 now (actually have %lu)", 0];
          *(_DWORD *)long long buf = 136316162;
          v69 = "-[ChromeViewController incrementForToken:]";
          __int16 v70 = 2080;
          v71 = "ChromeViewController.m";
          __int16 v72 = 1024;
          int v73 = 1983;
          __int16 v74 = 2080;
          float v75 = "count > 0";
          __int16 v76 = 2112;
          uint64_t v77 = v65;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
        }
        if (sub_100BB36BC())
        {
          id v66 = sub_1005762E4();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = +[NSThread callStackSymbols];
            *(_DWORD *)long long buf = 138412290;
            v69 = v67;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      v47 = sub_1000C49B4();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
LABEL_72:

        goto LABEL_51;
      }
      v48 = self;
      unsigned int v49 = (objc_class *)objc_opt_class();
      unsigned int v50 = NSStringFromClass(v49);
      if (objc_opt_respondsToSelector())
      {
        unsigned int v51 = [(ChromeViewController *)v48 performSelector:"accessibilityIdentifier"];
        id v52 = v51;
        if (v51 && ![v51 isEqualToString:v50])
        {
          id v53 = +[NSString stringWithFormat:@"%@<%p, %@>", v50, v48, v52];

          goto LABEL_63;
        }
      }
      id v53 = +[NSString stringWithFormat:@"%@<%p>", v50, v48];
LABEL_63:

      id v54 = v53;
      id v55 = [(MapsTokenStorage *)self->_mapInsetPropagationSuspensionTokens allTokenReasons];
      id v56 = v55;
      if (v55)
      {
        if ([v55 count])
        {
          id v57 = [v56 componentsJoinedByString:@", "];
          id v58 = +[NSString stringWithFormat:@"<%p> [%@]", v56, v57];
        }
        else
        {
          id v58 = +[NSString stringWithFormat:@"<%p> (empty)", v56];
        }
      }
      else
      {
        id v58 = @"<nil>";
      }

      *(_DWORD *)long long buf = 138543618;
      v69 = v54;
      __int16 v70 = 2114;
      v71 = (const char *)v58;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[%{public}@] Still suspending map inset propagation for reasons: %{public}@", buf, 0x16u);

      goto LABEL_72;
    }
    id v26 = self;
    if (!v26)
    {
      long long v31 = @"<nil>";
      goto LABEL_54;
    }
    uint64_t v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);
    if (objc_opt_respondsToSelector())
    {
      id v29 = [(ChromeViewController *)v26 performSelector:"accessibilityIdentifier"];
      id v30 = v29;
      if (v29 && ![v29 isEqualToString:v28])
      {
        long long v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

        goto LABEL_27;
      }
    }
    long long v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_27:

LABEL_54:
    *(_DWORD *)long long buf = 138543618;
    v69 = (const char *)v31;
    __int16 v70 = 2114;
    v71 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Map inset propagation suspension token added: %{public}@", buf, 0x16u);

    goto LABEL_55;
  }
  id v16 = sub_1000C49B4();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_45;
  }
  id v17 = self;
  if (!v17)
  {
    id v22 = @"<nil>";
    goto LABEL_44;
  }
  uint64_t v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  if (objc_opt_respondsToSelector())
  {
    id v20 = [(ChromeViewController *)v17 performSelector:"accessibilityIdentifier"];
    id v21 = v20;
    if (v20 && ![v20 isEqualToString:v19])
    {
      id v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

      goto LABEL_18;
    }
  }
  id v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_18:

LABEL_44:
  *(_DWORD *)long long buf = 138543618;
  v69 = (const char *)v22;
  __int16 v70 = 2114;
  v71 = (const char *)v4;
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Hiking token added: %{public}@", buf, 0x16u);

LABEL_45:
  id v45 = [(ChromeViewController *)self mapView];

  if (v45) {
    [(ChromeViewController *)self updateHikingMapConfiguration];
  }
LABEL_51:
}

- (id)mapViewEnteredForegroundDate
{
  mapViewEnteredForegroundDate = self->_mapViewEnteredForegroundDate;
  if (!mapViewEnteredForegroundDate)
  {
    id v4 = sub_1000D8C98();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      mapViewEnteredForegroundDate = self->_mapViewEnteredForegroundDate;
      goto LABEL_10;
    }
    unsigned int v5 = self;
    unsigned int v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        int64_t v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    int64_t v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] mapViewEnteredForegroundDate is nil when requested", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:

  return mapViewEnteredForegroundDate;
}

- (id)lastMapViewportChangedDate
{
  lastViewportChangeDate = self->_lastViewportChangeDate;
  if (!lastViewportChangeDate)
  {
    id v4 = sub_1000D8C98();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      id v11 = +[NSDate date];
      id v12 = self->_lastViewportChangeDate;
      self->_lastViewportChangeDate = v11;

      lastViewportChangeDate = self->_lastViewportChangeDate;
      goto LABEL_10;
    }
    unsigned int v5 = self;
    unsigned int v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        int64_t v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    int64_t v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    unsigned int v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] lastViewportChangeDate is nil. Setting current date for now.", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:

  return lastViewportChangeDate;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (!+[ChromeDelegateProxy selectorIsProxiedDelegateMethod:](ChromeMapViewDelegateProxy, "selectorIsProxiedDelegateMethod:", [v4 selector])|| objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    v5.receiver = self;
    v5.super_class = (Class)ChromeViewController;
    [(ChromeViewController *)&v5 forwardInvocation:v4];
  }
}

- (ChromeNavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (id)mapViewDelegateForSelector:(SEL)a3
{
  BOOL v3 = [(ChromeViewController *)self mapViewDelegate];
  if (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)mapViewDelegate
{
  v2 = [(ChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 mapViewDelegate];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;

      v2 = v5;
    }
  }
  if ((sub_1000BBF90((uint64_t)v2, (Protocol *)&OBJC_PROTOCOL___MKMapViewDelegate) & 1) != 0
    || sub_1000BBF90((uint64_t)v2, (Protocol *)&OBJC_PROTOCOL___MKMapViewDelegatePrivate))
  {
    id v6 = v2;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ChromeContext)topContext
{
  v2 = [(ChromeViewController *)self contexts];
  BOOL v3 = [v2 lastObject];

  return (ChromeContext *)v3;
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void)setMapEdgeInsets:(UIEdgeInsets)a3 animated:(BOOL)a4 forContext:(id)a5
{
  BOOL v5 = a4;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v11 = a5;
  BOOL v14 = left == UIEdgeInsetsZero.left
     && top == UIEdgeInsetsZero.top
     && right == UIEdgeInsetsZero.right
     && bottom == UIEdgeInsetsZero.bottom;
  id v54 = v11;
  if (v14)
  {
    id v26 = [(NSMapTable *)self->_mapInsetsConstraintsByContext objectForKey:v11];
    [(NSMapTable *)self->_mapInsetsConstraintsByContext removeObjectForKey:v54];
    if (v26)
    {
      [(ChromeViewController *)self _refreshMapInsetsConstraintsForContext:v54 animated:v5 updateIfNeeded:1];
      [(ChromeViewController *)self updateComponentsIfNeeded];
    }
  }
  else
  {
    [(ChromeViewController *)self mapEdgeInsetsForContext:v11];
    if (left == v18 && top == v15 && right == v17 && bottom == v16) {
      goto LABEL_33;
    }
    mapInsetsConstraintsByContext = self->_mapInsetsConstraintsByContext;
    id v23 = v54;
    if (!mapInsetsConstraintsByContext)
    {
      unsigned int v24 = +[NSMapTable weakToStrongObjectsMapTable];
      unsigned __int8 v25 = self->_mapInsetsConstraintsByContext;
      self->_mapInsetsConstraintsByContext = v24;

      id v23 = v54;
      mapInsetsConstraintsByContext = self->_mapInsetsConstraintsByContext;
    }
    id v26 = [(NSMapTable *)mapInsetsConstraintsByContext objectForKey:v23];
    uint64_t v27 = [(ChromeViewController *)self mapInsetsLayoutGuide];
    uint64_t v28 = [v27 owningView];

    if (v26)
    {
      id v29 = [v26 topConstraint];
      [v29 setConstant:top];

      id v30 = [v26 leftConstraint];
      [v30 setConstant:left];

      long long v31 = [v26 bottomConstraint];
      [v31 setConstant:-bottom];

      unint64_t v32 = [v26 rightConstraint];
      [v32 setConstant:-right];

      if ([(ChromeViewController *)self isTopContext:v54]) {
        [(ChromeViewController *)self setNeedsUpdateComponent:@"mapInsets" animated:v5];
      }
    }
    else
    {
      long long v33 = [(ChromeViewController *)self mapInsetsLayoutGuide];
      long long v34 = [v33 topAnchor];
      uint64_t v35 = [v28 topAnchor];
      LODWORD(v36) = 1148846080;
      id v53 = [v34 constraintGreaterThanOrEqualToAnchor:v35 constant:top priority:v36];

      long long v37 = [(ChromeViewController *)self mapInsetsLayoutGuide];
      __int16 v38 = [v37 leftAnchor];
      id v39 = [v28 leftAnchor];
      LODWORD(v40) = 1148846080;
      id v41 = [v38 constraintGreaterThanOrEqualToAnchor:v39 constant:left priority:v40];

      id v42 = [(ChromeViewController *)self mapInsetsLayoutGuide];
      id v43 = [v42 bottomAnchor];
      id v44 = [v28 bottomAnchor];
      LODWORD(v45) = 1148846080;
      unint64_t v46 = [v43 constraintLessThanOrEqualToAnchor:v44 constant:-bottom priority:v45];

      v47 = [(ChromeViewController *)self mapInsetsLayoutGuide];
      v48 = [v47 rightAnchor];
      unsigned int v49 = [v28 rightAnchor];
      LODWORD(v50) = 1148846080;
      [v48 constraintLessThanOrEqualToAnchor:v49 constant:-right priority:v50];
      v52 = unsigned int v51 = v28;

      id v26 = +[MapsEdgeConstraints edgeConstraintsWithTop:v53 left:v41 bottom:v46 right:v52];
      [(NSMapTable *)self->_mapInsetsConstraintsByContext setObject:v26 forKey:v54];
      [(ChromeViewController *)self _refreshMapInsetsConstraintsForContext:v54 animated:v5 updateIfNeeded:1];

      uint64_t v28 = v51;
    }
    if (![(ChromeViewController *)self isTransitioning]) {
      [(ChromeViewController *)self updateComponentsIfNeeded];
    }
  }
LABEL_33:
}

- (UILayoutGuide)mapInsetsLayoutGuide
{
  return self->_mapInsetsLayoutGuide;
}

- (UIEdgeInsets)mapEdgeInsetsForContext:(id)a3
{
  BOOL v3 = [(NSMapTable *)self->_mapInsetsConstraintsByContext objectForKey:a3];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 topConstraint];
    [v5 constant];
    CGFloat top = v6;
    id v8 = [v4 leftConstraint];
    [v8 constant];
    CGFloat left = v9;
    id v11 = [v4 bottomConstraint];
    [v11 constant];
    CGFloat bottom = v12;
    BOOL v14 = [v4 rightConstraint];
    [v14 constant];
    CGFloat right = v15;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v17 = top;
  double v18 = left;
  double v19 = bottom;
  double v20 = right;
  result.CGFloat right = v20;
  result.CGFloat bottom = v19;
  result.CGFloat left = v18;
  result.CGFloat top = v17;
  return result;
}

- (BOOL)isTransitioning
{
  currentContextTransition = self->_currentContextTransition;
  if (currentContextTransition) {
    LOBYTE(currentContextTransition) = [(ChromeContextTransition *)currentContextTransition hasStarted];
  }
  return (char)currentContextTransition;
}

- (BOOL)isTopContext:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(ChromeViewController *)self topContext];
  BOOL v6 = v5 == v4;

  return v6;
}

- (void)setVKApplicationUILayout:(int64_t)a3
{
  id v5 = [(ChromeViewController *)self mapView];
  BOOL v6 = [v5 _mapLayer];
  id v7 = [v6 applicationUILayout];

  if (v7 != (id)a3)
  {
    id v9 = [(ChromeViewController *)self mapView];
    id v8 = [v9 _mapLayer];
    [v8 setApplicationUILayout:a3];
  }
}

- (void)setNeedsUpdateComponent:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = sub_1000C49B4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = self;
    if (!v11)
    {
      double v16 = @"<nil>";
      goto LABEL_10;
    }
    double v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      BOOL v14 = [(ChromeViewController *)v11 performSelector:"accessibilityIdentifier"];
      double v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        double v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_8;
      }
    }
    double v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_8:

LABEL_10:
    *(_DWORD *)long long buf = 138543618;
    id v23 = v16;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Set needs update: %@", buf, 0x16u);
  }
  if (!self->_componentsNeedingUpdate)
  {
    double v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    componentsNeedingUpdate = self->_componentsNeedingUpdate;
    self->_componentsNeedingUpdate = v17;
  }
  BOOL v19 = a4 || self->_componentUpdateIsAnimated;
  self->_componentUpdateIsAnimated = v19;
  id v20 = [(NSMutableDictionary *)self->_componentsNeedingUpdate objectForKeyedSubscript:v8];
  if (!v20)
  {
    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    [(NSMutableDictionary *)self->_componentsNeedingUpdate setObject:v20 forKeyedSubscript:v8];
  }
  id v21 = [[ChromeComponentUpdateInfo alloc] initWithCompletionHandler:v9];

  [v20 addObject:v21];
  [(ChromeViewController *)self _scheduleComponentUpdateTimerIfNeeded];
}

- (void)_scheduleComponentUpdateTimerIfNeeded
{
  if (!self->_scheduledComponentUpdateTimer)
  {
    BOOL v3 = sub_1000C49B4();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      int64_t v10 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateComponentsIfNeeded" selector:0 userInfo:0 repeats:0.1];
      scheduledComponentUpdateTimer = self->_scheduledComponentUpdateTimer;
      self->_scheduledComponentUpdateTimer = v10;

      return;
    }
    id v4 = self;
    id v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)long long buf = 138543618;
    id v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = 0x3FB999999999999ALL;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Scheduling coalesced component update in %#.1lfs", buf, 0x16u);

    goto LABEL_9;
  }
}

- (void)_updateComponentsIfNeeded:(BOOL)a3 forceImmediateUpdate:(BOOL)a4 forTiming:(unint64_t)a5 withAnimation:(id)a6
{
  BOOL v7 = a4;
  id v87 = a6;
  [(NSTimer *)self->_scheduledComponentUpdateTimer invalidate];
  scheduledComponentUpdateTimer = self->_scheduledComponentUpdateTimer;
  self->_scheduledComponentUpdateTimer = 0;

  id v11 = sub_1000C49B4();
  v89 = self;
  uint64_t v90 = a5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v12 = self;
    id v13 = (objc_class *)objc_opt_class();
    __int16 v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [(ChromeViewController *)v12 performSelector:"accessibilityIdentifier"];
      double v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        double v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        a5 = v90;
LABEL_7:

        id v18 = v17;
        if ((uint64_t)a5 > 3)
        {
          if (a5 == 4)
          {
            BOOL v19 = "context becoming top";
            goto LABEL_17;
          }
          if (a5 == 0xFFFFFFFF)
          {
            BOOL v19 = "any";
            goto LABEL_17;
          }
        }
        else
        {
          if (a5 == 1)
          {
            BOOL v19 = "on-demand";
            goto LABEL_17;
          }
          if (a5 == 2)
          {
            BOOL v19 = "context resigning top";
            goto LABEL_17;
          }
        }
        BOOL v19 = "unknown";
LABEL_17:
        id v20 = v87;
        if (!v20)
        {
          id v25 = @"<nil>";
          goto LABEL_25;
        }
        id v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        if (objc_opt_respondsToSelector())
        {
          id v23 = [v20 performSelector:"accessibilityIdentifier"];
          __int16 v24 = v23;
          if (v23 && ![v23 isEqualToString:v22])
          {
            id v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

            goto LABEL_23;
          }
        }
        id v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_23:

LABEL_25:
        *(_DWORD *)long long buf = 138543874;
        id v102 = v18;
        __int16 v103 = 2080;
        v104 = (void *)v19;
        __int16 v105 = 2114;
        v106 = v25;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Evaluate component update for timing '%s', animation %{public}@...", buf, 0x20u);

        a5 = v90;
        goto LABEL_26;
      }

      a5 = v90;
    }
    double v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
    goto LABEL_7;
  }
LABEL_26:

  id v26 = [(NSMutableDictionary *)self->_componentsNeedingUpdate mutableCopy];
  if ([(NSMutableSet *)self->_componentsBeingUpdated count])
  {
    uint64_t v27 = sub_1000C49B4();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (!v28)
      {
LABEL_43:

        goto LABEL_44;
      }
      id v29 = self;
      id v30 = (objc_class *)objc_opt_class();
      long long v31 = NSStringFromClass(v30);
      if (objc_opt_respondsToSelector())
      {
        unint64_t v32 = [(ChromeViewController *)v29 performSelector:"accessibilityIdentifier"];
        long long v33 = v32;
        if (v32 && ![v32 isEqualToString:v31])
        {
          long long v34 = +[NSString stringWithFormat:@"%@<%p, %@>", v31, v29, v33];

          goto LABEL_34;
        }
      }
      long long v34 = +[NSString stringWithFormat:@"%@<%p>", v31, v29];
LABEL_34:

      componentsBeingUpdated = self->_componentsBeingUpdated;
      *(_DWORD *)long long buf = 138543618;
      id v102 = v34;
      __int16 v103 = 2112;
      v104 = componentsBeingUpdated;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] - Forcing immediate update, not skipping components in the middle of updates: %@", buf, 0x16u);

      a5 = v90;
      goto LABEL_43;
    }
    if (!v28)
    {
LABEL_42:

      uint64_t v27 = [(NSMutableSet *)self->_componentsBeingUpdated allObjects];
      [v26 removeObjectsForKeys:v27];
      goto LABEL_43;
    }
    double v36 = self;
    long long v37 = (objc_class *)objc_opt_class();
    __int16 v38 = NSStringFromClass(v37);
    if (objc_opt_respondsToSelector())
    {
      id v39 = [(ChromeViewController *)v36 performSelector:"accessibilityIdentifier"];
      double v40 = v39;
      if (v39 && ![v39 isEqualToString:v38])
      {
        id v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v38, v36, v40];

        goto LABEL_41;
      }
    }
    id v41 = +[NSString stringWithFormat:@"%@<%p>", v38, v36];
LABEL_41:

    id v42 = self->_componentsBeingUpdated;
    *(_DWORD *)long long buf = 138543618;
    id v102 = v41;
    __int16 v103 = 2112;
    v104 = v42;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] - Skipping components in the middle of updates (they may update again later): %@", buf, 0x16u);

    a5 = v90;
    goto LABEL_42;
  }
LABEL_44:
  if (a3) {
    goto LABEL_77;
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = [(ChromeViewController *)self allComponents];
  id v43 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
  if (!v43) {
    goto LABEL_76;
  }
  id v44 = v43;
  uint64_t v45 = *(void *)v96;
  do
  {
    unint64_t v46 = 0;
    do
    {
      if (*(void *)v96 != v45) {
        objc_enumerationMutation(obj);
      }
      v47 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v46);
      v48 = [v26 objectForKeyedSubscript:v47];

      if (!v48)
      {
        id v49 = v26;
        unint64_t v50 = [(ChromeViewController *)self preferredUpdateTimingForComponent:v47];
        if ((v50 & a5) != 0)
        {
          unsigned int v51 = objc_alloc_init(ChromeComponentUpdateInfo);
          v99 = v51;
          id v52 = +[NSArray arrayWithObjects:&v99 count:1];
          [v26 setObject:v52 forKeyedSubscript:v47];

LABEL_71:
          goto LABEL_72;
        }
        uint64_t v53 = v50;
        sub_1000C49B4();
        unsigned int v51 = (ChromeComponentUpdateInfo *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v51->super, OS_LOG_TYPE_DEBUG))
        {
          id v26 = v49;
          goto LABEL_71;
        }
        id v54 = self;
        id v55 = (objc_class *)objc_opt_class();
        id v56 = NSStringFromClass(v55);
        if (objc_opt_respondsToSelector())
        {
          id v57 = [(ChromeViewController *)v54 performSelector:"accessibilityIdentifier"];
          id v58 = v57;
          if (!v57 || [v57 isEqualToString:v56])
          {

            goto LABEL_58;
          }
          uint64_t v88 = +[NSString stringWithFormat:@"%@<%p, %@>", v56, v54, v58];

          id v59 = (void *)v88;
        }
        else
        {
LABEL_58:
          id v59 = +[NSString stringWithFormat:@"%@<%p>", v56, v54];
        }

        if (v53 > 3)
        {
          a5 = v90;
          if (v53 == 4)
          {
            id v60 = "context becoming top";
            goto LABEL_70;
          }
          if (v53 == 0xFFFFFFFFLL)
          {
            id v60 = "any";
            goto LABEL_70;
          }
        }
        else
        {
          a5 = v90;
          if (v53 == 1)
          {
            id v60 = "on-demand";
            goto LABEL_70;
          }
          if (v53 == 2)
          {
            id v60 = "context resigning top";
LABEL_70:
            id v26 = v49;
            *(_DWORD *)long long buf = 138543874;
            id v102 = v59;
            __int16 v103 = 2112;
            v104 = v47;
            __int16 v105 = 2080;
            v106 = (void *)v60;
            _os_log_impl((void *)&_mh_execute_header, &v51->super, OS_LOG_TYPE_DEBUG, "[%{public}@] - Skipping component %@, not the right timing (wants '%s')", buf, 0x20u);

            self = v89;
            goto LABEL_71;
          }
        }
        id v60 = "unknown";
        goto LABEL_70;
      }
LABEL_72:
      unint64_t v46 = (char *)v46 + 1;
    }
    while (v44 != v46);
    id v61 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
    id v44 = v61;
  }
  while (v61);
LABEL_76:

LABEL_77:
  id v62 = [v26 count];
  componentsNeedingUpdate = self->_componentsNeedingUpdate;
  if (!v62)
  {
    if (![(NSMutableDictionary *)self->_componentsNeedingUpdate count]) {
      goto LABEL_108;
    }
    uint64_t v77 = sub_1000C49B4();
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
LABEL_98:

      goto LABEL_108;
    }
    v78 = self;
    v79 = (objc_class *)objc_opt_class();
    v80 = NSStringFromClass(v79);
    if (objc_opt_respondsToSelector())
    {
      v81 = [(ChromeViewController *)v78 performSelector:"accessibilityIdentifier"];
      v82 = v81;
      if (v81 && ![v81 isEqualToString:v80])
      {
        v83 = +[NSString stringWithFormat:@"%@<%p, %@>", v80, v78, v82];

        goto LABEL_97;
      }
    }
    v83 = +[NSString stringWithFormat:@"%@<%p>", v80, v78];
LABEL_97:

    *(_DWORD *)long long buf = 138543362;
    id v102 = v83;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "[%{public}@] - No components left to update after skipping those in-flight, returning early", buf, 0xCu);

    goto LABEL_98;
  }
  id v64 = [v26 allKeys];
  [(NSMutableDictionary *)componentsNeedingUpdate removeObjectsForKeys:v64];

  self->_componentUpdateIsAnimated = 0;
  __int16 v65 = self->_componentsBeingUpdated;
  if (!v65)
  {
    id v66 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v67 = self->_componentsBeingUpdated;
    self->_componentsBeingUpdated = v66;

    __int16 v65 = self->_componentsBeingUpdated;
  }
  v68 = [v26 allKeys];
  [(NSMutableSet *)v65 addObjectsFromArray:v68];

  v69 = sub_1000C49B4();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    __int16 v70 = self;
    v71 = (objc_class *)objc_opt_class();
    __int16 v72 = NSStringFromClass(v71);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_85;
    }
    int v73 = [(ChromeViewController *)v70 performSelector:"accessibilityIdentifier"];
    __int16 v74 = v73;
    if (v73 && ![v73 isEqualToString:v72])
    {
      float v75 = +[NSString stringWithFormat:@"%@<%p, %@>", v72, v70, v74];
    }
    else
    {

LABEL_85:
      float v75 = +[NSString stringWithFormat:@"%@<%p>", v72, v70];
    }

    if (v90 > 3)
    {
      if (v90 == 4)
      {
        __int16 v76 = "context becoming top";
      }
      else
      {
        if (v90 != 0xFFFFFFFFLL) {
          goto LABEL_103;
        }
        __int16 v76 = "any";
      }
    }
    else if (v90 == 1)
    {
      __int16 v76 = "on-demand";
    }
    else
    {
      if (v90 == 2)
      {
        __int16 v76 = "context resigning top";
        goto LABEL_106;
      }
LABEL_103:
      __int16 v76 = "unknown";
    }
LABEL_106:
    v84 = [v26 allKeys];
    *(_DWORD *)long long buf = 138543874;
    id v102 = v75;
    __int16 v103 = 2080;
    v104 = (void *)v76;
    __int16 v105 = 2112;
    v106 = v84;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "[%{public}@] - Commit update for timing '%s' with %@", buf, 0x20u);

    self = v89;
  }

  v85 = [v26 allKeys];
  v86 = +[NSSet setWithArray:v85];
  [(ChromeViewController *)self willUpdateComponents:v86 withAnimation:v87];

  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_1000C2000;
  v92[3] = &unk_10131B0A8;
  v92[4] = self;
  uint64_t v94 = v90;
  id v93 = v87;
  [v26 enumerateKeysAndObjectsUsingBlock:v92];

LABEL_108:
}

- (unint64_t)preferredUpdateTimingForComponent:(id)a3
{
  if (a3 == @"navigationDisplay") {
    return 6;
  }
  else {
    return 4;
  }
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  unint64_t v114 = (__CFString *)a3;
  id v115 = a5;
  id v8 = [(ChromeViewController *)self nextTopContext];
  id v9 = v8;
  if (v8)
  {
    id v116 = v8;
  }
  else
  {
    id v116 = [(ChromeViewController *)self topContext];
  }

  __int16 v113 = [(ChromeViewController *)self topContext];
  int64_t v10 = sub_1000C49B4();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if ((a4 & 4) != 0 && v116)
  {
    if (!v11)
    {
LABEL_49:

      goto LABEL_64;
    }
    double v12 = self;
    if (!v12)
    {
      double v17 = @"<nil>";
LABEL_23:

      __int16 v24 = v17;
      id v25 = "unknown";
      if (a4 == 4) {
        id v25 = "context becoming top";
      }
      if (a4 == 0xFFFFFFFF) {
        id v25 = "any";
      }
      __int16 v111 = v25;
      id v26 = [(ChromeViewController *)v12 topContext];
      if (!v26)
      {
        long long v31 = @"<nil>";
LABEL_43:

        long long v34 = v31;
        id v35 = v116;
        double v36 = (objc_class *)objc_opt_class();
        long long v37 = NSStringFromClass(v36);
        if (objc_opt_respondsToSelector())
        {
          __int16 v38 = [v35 performSelector:"accessibilityIdentifier"];
          id v39 = v38;
          if (v38 && ![v38 isEqualToString:v37])
          {
            double v40 = +[NSString stringWithFormat:@"%@<%p, %@>", v37, v35, v39];

            goto LABEL_48;
          }
        }
        double v40 = +[NSString stringWithFormat:@"%@<%p>", v37, v35];
LABEL_48:

        *(_DWORD *)long long buf = 138544386;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v114;
        *(_WORD *)&buf[22] = 2080;
        v133 = v111;
        *(_WORD *)v134 = 2112;
        *(void *)&v134[2] = v34;
        *(_WORD *)&v134[10] = 2112;
        *(void *)&v134[12] = v40;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] Update component: %@ with timing %s (outgoing: %@ -> incoming: %@)", buf, 0x34u);

        goto LABEL_49;
      }
      uint64_t v27 = (objc_class *)objc_opt_class();
      BOOL v28 = NSStringFromClass(v27);
      if (objc_opt_respondsToSelector())
      {
        id v29 = [v26 performSelector:"accessibilityIdentifier"];
        id v30 = v29;
        if (v29 && ![v29 isEqualToString:v28])
        {
          long long v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v26, v30];

          goto LABEL_33;
        }
      }
      long long v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v26];
LABEL_33:

      goto LABEL_43;
    }
    id v13 = (objc_class *)objc_opt_class();
    __int16 v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [(ChromeViewController *)v12 performSelector:"accessibilityIdentifier"];
      double v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        double v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_13;
      }
    }
    double v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_13:

    goto LABEL_23;
  }
  if (v11)
  {
    id v18 = self;
    if (!v18)
    {
      id v23 = @"<nil>";
LABEL_35:

      unint64_t v32 = v23;
      if ((uint64_t)a4 > 3)
      {
        if (a4 == 4)
        {
          long long v33 = "context becoming top";
          goto LABEL_53;
        }
        if (a4 == 0xFFFFFFFF)
        {
          long long v33 = "any";
          goto LABEL_53;
        }
      }
      else
      {
        if (a4 == 1)
        {
          long long v33 = "on-demand";
          goto LABEL_53;
        }
        if (a4 == 2)
        {
          long long v33 = "context resigning top";
          goto LABEL_53;
        }
      }
      long long v33 = "unknown";
LABEL_53:
      id v41 = [(ChromeViewController *)v18 topContext];
      if (!v41)
      {
        unint64_t v46 = @"<nil>";
        goto LABEL_61;
      }
      id v42 = (objc_class *)objc_opt_class();
      id v43 = NSStringFromClass(v42);
      if (objc_opt_respondsToSelector())
      {
        id v44 = [v41 performSelector:"accessibilityIdentifier"];
        uint64_t v45 = v44;
        if (v44 && ![v44 isEqualToString:v43])
        {
          unint64_t v46 = +[NSString stringWithFormat:@"%@<%p, %@>", v43, v41, v45];

          goto LABEL_59;
        }
      }
      unint64_t v46 = +[NSString stringWithFormat:@"%@<%p>", v43, v41];
LABEL_59:

LABEL_61:
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v114;
      *(_WORD *)&buf[22] = 2080;
      v133 = v33;
      *(_WORD *)v134 = 2112;
      *(void *)&v134[2] = v46;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] Update component: %@ with timing %s (top context: %@)", buf, 0x2Au);

      goto LABEL_62;
    }
    BOOL v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      id v21 = [(ChromeViewController *)v18 performSelector:"accessibilityIdentifier"];
      id v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        id v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_21;
      }
    }
    id v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_21:

    goto LABEL_35;
  }
LABEL_62:

  if (!v116) {
    id v116 = v113;
  }
LABEL_64:
  if (v114 == @"mapInsets")
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4010000000;
    v133 = (const char *)&unk_1011B93F2;
    float64x2_t v47 = UIEdgeInsetsNull[1];
    *(float64x2_t *)v134 = UIEdgeInsetsNull[0];
    *(float64x2_t *)&v134[16] = v47;
    if (objc_opt_respondsToSelector()) {
      unsigned int v48 = [v116 showsMapView];
    }
    else {
      unsigned int v48 = 1;
    }
    unsigned int v51 = [(MapsEdgeConstraints *)self->_safeAreaMapEdgeInsetsConstraints topConstraint];
    unsigned int v52 = [v51 isActive];

    if (!v48
      || (unsigned int v53 = [(ChromeViewController *)self contextWantsMapInsetsToRespectSafeAreaInsets:v116], v54 = v53, v52 == v53))
    {
      id v56 = [(ChromeViewController *)self mapInsetsLayoutGuide];
      [v56 layoutFrame];
      CGFloat v110 = v58;
      CGFloat v112 = v57;
      CGFloat rect1 = v59;
      CGFloat v61 = v60;
      id v62 = [(ChromeViewController *)self view];
      [v62 bounds];
      CGFloat v106 = v64;
      CGFloat v107 = v63;
      CGFloat v104 = v66;
      CGFloat v105 = v65;
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      v135.origin.CGFloat y = v110;
      v135.origin.x = v112;
      v135.size.CGFloat width = rect1;
      v135.size.CGFloat height = v61;
      v143.origin.x = CGRectZero.origin.x;
      v143.origin.CGFloat y = y;
      v143.size.CGFloat width = width;
      v143.size.CGFloat height = height;
      BOOL v70 = CGRectEqualToRect(v135, v143);
      CGFloat left = UIEdgeInsetsZero.left;
      CGFloat top = UIEdgeInsetsZero.top;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
      if (!v70)
      {
        v136.origin.CGFloat y = v106;
        v136.origin.x = v107;
        v136.size.CGFloat height = v104;
        v136.size.CGFloat width = v105;
        v144.origin.x = CGRectZero.origin.x;
        v144.origin.CGFloat y = y;
        v144.size.CGFloat width = width;
        v144.size.CGFloat height = height;
        if (!CGRectEqualToRect(v136, v144))
        {
          v137.origin.CGFloat y = v110;
          v137.origin.x = v112;
          v137.size.CGFloat width = rect1;
          v137.size.CGFloat height = v61;
          CGFloat top = CGRectGetMinY(v137);
          v138.origin.CGFloat y = v110;
          v138.origin.x = v112;
          v138.size.CGFloat width = rect1;
          v138.size.CGFloat height = v61;
          CGFloat left = CGRectGetMinX(v138);
          v139.origin.CGFloat y = v106;
          v139.origin.x = v107;
          v139.size.CGFloat height = v104;
          v139.size.CGFloat width = v105;
          double v74 = CGRectGetHeight(v139);
          v140.origin.CGFloat y = v110;
          v140.origin.x = v112;
          v140.size.CGFloat width = rect1;
          v140.size.CGFloat height = v61;
          double MaxY = CGRectGetMaxY(v140);
          v141.origin.CGFloat y = v106;
          v141.origin.x = v107;
          v141.size.CGFloat height = v104;
          v141.size.CGFloat width = v105;
          double v76 = CGRectGetWidth(v141);
          v142.origin.CGFloat y = v110;
          v142.origin.x = v112;
          v142.size.CGFloat width = rect1;
          v142.size.CGFloat height = v61;
          double bottom = v74 - MaxY;
          double right = v76 - CGRectGetMaxX(v142);
        }
      }
      uint64_t v77 = *(CGFloat **)&buf[8];
      *(CGFloat *)(*(void *)&buf[8] + 32) = top;
      v77[5] = left;
      v77[6] = bottom;
      v77[7] = right;

      v78 = *(double **)&buf[8];
      id v55 = [(ChromeViewController *)self mapView];
      [v55 _edgeInsets];
      if (v78[5] == v82 && v78[4] == v79 && v78[7] == v81)
      {
        BOOL v83 = v78[6] == v80;

        if (v83)
        {
LABEL_87:
          _Block_object_dispose(buf, 8);
          goto LABEL_127;
        }
LABEL_86:
        [v115 setOptions:[v115 options] | 0x50006];
        [(ChromeViewController *)self mapInsetsUpdateAnimationDuration];
        [v115 setDuration:];
        v126[0] = _NSConcreteStackBlock;
        v126[1] = 3221225472;
        v126[2] = sub_1000C8410;
        v126[3] = &unk_1012E9F18;
        v126[4] = self;
        v126[5] = buf;
        unsigned __int8 v127 = [v115 isAnimated];
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472;
        v124[2] = sub_1000C6FBC;
        v124[3] = &unk_1012E8908;
        v124[4] = self;
        unsigned __int8 v125 = v127;
        [v115 addAnimations:v126 completion:v124];
        goto LABEL_87;
      }
    }
    else
    {
      [(MapsEdgeConstraints *)self->_safeAreaMapEdgeInsetsConstraints allConstraints];
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_100BECCA0;
      v128[3] = &unk_10131AFD0;
      char v131 = v54;
      v128[4] = self;
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      id v129 = v55;
      v130 = buf;
      [v115 addPreparation:v128];
    }
    goto LABEL_86;
  }
  if (v114 == @"labelInsetsAndWidths")
  {
    long long v49 = *(_OWORD *)&self->_labelEdgeInsets.bottom;
    long long v120 = *(_OWORD *)&self->_labelEdgeInsets.top;
    long long v121 = v49;
    long long v50 = *(_OWORD *)&self->_labelEdgeWidths.bottom;
    long long v122 = *(_OWORD *)&self->_labelEdgeWidths.top;
    long long v123 = v50;
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_1000C6F28;
    v119[3] = &unk_10131B018;
    v119[4] = self;
    [v115 addPreparation:v119 animations:0 completion:0];
    goto LABEL_127;
  }
  if (v114 == @"personalizedItemSources")
  {
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_1000C81A4;
    v118[3] = &unk_1012E5D08;
    v118[4] = self;
    [v115 addPreparation:v118 animations:0 completion:0];
    goto LABEL_127;
  }
  if (v114 != @"navigationDisplay")
  {
    if (v114 == @"routeAnnotations")
    {
      v117[0] = _NSConcreteStackBlock;
      v117[1] = 3221225472;
      v117[2] = sub_1000C707C;
      v117[3] = &unk_1012E5D08;
      v117[4] = self;
      [v115 addPreparation:v117];
    }
    goto LABEL_127;
  }
  v84 = [(ChromeViewController *)self pendingContexts];
  if (v84)
  {
    unsigned int v85 = [(ChromeViewController *)self _shouldEnableNavigationDisplayForContextStack:v84 requestingContext:0];
  }
  else
  {
    v86 = [(ChromeViewController *)self contexts];
    unsigned int v85 = [(ChromeViewController *)self _shouldEnableNavigationDisplayForContextStack:v86 requestingContext:0];
  }
  if ((a4 & 2) != 0) {
    char v87 = v85;
  }
  else {
    char v87 = 1;
  }
  if ((v87 & 1) == 0)
  {
    uint64_t v88 = sub_1000C49B4();
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
LABEL_111:

      [(ChromeViewController *)self _teardownNavigationDisplayWithAnimation:v115];
      goto LABEL_112;
    }
    v89 = self;
    if (!v89)
    {
      uint64_t v94 = @"<nil>";
      goto LABEL_110;
    }
    uint64_t v90 = (objc_class *)objc_opt_class();
    v91 = NSStringFromClass(v90);
    if (objc_opt_respondsToSelector())
    {
      v92 = [(ChromeViewController *)v89 performSelector:"accessibilityIdentifier"];
      id v93 = v92;
      if (v92 && ![v92 isEqualToString:v91])
      {
        uint64_t v94 = +[NSString stringWithFormat:@"%@<%p, %@>", v91, v89, v93];

        goto LABEL_104;
      }
    }
    uint64_t v94 = +[NSString stringWithFormat:@"%@<%p>", v91, v89];
LABEL_104:

LABEL_110:
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v94;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "[%{public}@] - will tear down navigation display", buf, 0xCu);

    goto LABEL_111;
  }
LABEL_112:
  if ((v85 & (a4 >> 2)) != 1) {
    goto LABEL_127;
  }
  long long v95 = sub_1000C49B4();
  if (!os_log_type_enabled(v95, OS_LOG_TYPE_INFO)) {
    goto LABEL_123;
  }
  long long v96 = self;
  if (!v96)
  {
    v101 = @"<nil>";
    goto LABEL_122;
  }
  long long v97 = (objc_class *)objc_opt_class();
  long long v98 = NSStringFromClass(v97);
  if (objc_opt_respondsToSelector())
  {
    v99 = [(ChromeViewController *)v96 performSelector:"accessibilityIdentifier"];
    v100 = v99;
    if (v99 && ![v99 isEqualToString:v98])
    {
      v101 = +[NSString stringWithFormat:@"%@<%p, %@>", v98, v96, v100];

      goto LABEL_120;
    }
  }
  v101 = +[NSString stringWithFormat:@"%@<%p>", v98, v96];
LABEL_120:

LABEL_122:
  *(_DWORD *)long long buf = 138543362;
  *(void *)&uint8_t buf[4] = v101;
  _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "[%{public}@] - will setup/configure navigation display", buf, 0xCu);

LABEL_123:
  id v102 = [(ChromeViewController *)self nextTopContext];
  if (v102)
  {
    [(ChromeViewController *)self _setupNavigationDisplayForContext:v102 withAnimation:v115];
  }
  else
  {
    __int16 v103 = [(ChromeViewController *)self topContext];
    [(ChromeViewController *)self _setupNavigationDisplayForContext:v103 withAnimation:v115];
  }
LABEL_127:
}

- (ChromeContext)nextTopContext
{
  return [(ChromeContextTransition *)self->_currentContextTransition nextTopContext];
}

- (void)updateComponentsIfNeeded
{
  id v3 = +[GroupAnimation animationForAnimatedFlag:self->_componentUpdateIsAnimated];
  [(ChromeViewController *)self updateComponentsIfNeededWithAnimation:v3];
  [v3 runWithCurrentOptions];
}

- (void)updateComponentsIfNeededWithAnimation:(id)a3
{
}

- (void)_updateComponentsIfNeeded:(BOOL)a3 withAnimation:(id)a4
{
}

- (void)_updateComponentsIfNeeded:(BOOL)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
}

- (BOOL)contextWantsMapInsetsToRespectSafeAreaInsets:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() mapInsetsShouldRespectSafeAreaInsetsByDefault];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 wantsMapInsetsToRespectSafeAreaInsets];
  }

  return v4;
}

- (RouteAnnotationsController)routeAnnotationsController
{
  if (!self->_routeAnnotationsController)
  {
    id v3 = [(ChromeViewController *)self mapView];

    if (v3)
    {
      unsigned __int8 v4 = sub_1000C49B4();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        BOOL v11 = objc_alloc_init(RouteAnnotationsController);
        routeAnnotationsController = self->_routeAnnotationsController;
        self->_routeAnnotationsController = v11;

        id v13 = [(ChromeViewController *)self mapView];
        [(RouteAnnotationsController *)self->_routeAnnotationsController setMapView:v13];

        goto LABEL_11;
      }
      id v5 = self;
      BOOL v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      if (objc_opt_respondsToSelector())
      {
        id v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
        id v9 = v8;
        if (v8 && ![v8 isEqualToString:v7])
        {
          int64_t v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

          goto LABEL_9;
        }
      }
      int64_t v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

      *(_DWORD *)long long buf = 138543362;
      double v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Creating routeAnnotationsController", buf, 0xCu);

      goto LABEL_10;
    }
  }
LABEL_11:
  __int16 v14 = self->_routeAnnotationsController;

  return v14;
}

- (BOOL)isRunningNavigationDisplay
{
  v2 = [(ChromeViewController *)self navigationDisplay];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)pendingContexts
{
  return [(ChromeContextTransition *)self->_currentContextTransition pendingContexts];
}

- (void)setNeedsUpdateComponent:(id)a3 animated:(BOOL)a4
{
}

- (void)setLabelEdgeWidths:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (GEOConfigGetBOOL())
  {
    id v8 = [(ChromeViewController *)self mapView];
    [v8 _labelEdgeWidths];
    if (left == v12 && top == v9 && right == v11)
    {
      double v15 = v10;

      if (bottom == v15) {
        return;
      }
    }
    else
    {
    }
    self->_labelEdgeWidths.double top = top;
    self->_labelEdgeWidths.double left = left;
    self->_labelEdgeWidths.double bottom = bottom;
    self->_labelEdgeWidths.double right = right;
    [(ChromeViewController *)self setNeedsUpdateComponent:@"labelInsetsAndWidths" animated:1];
  }
}

- (void)setLabelEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v8 = [(ChromeViewController *)self mapView];
  [v8 _labelEdgeInsets];
  if (left == v12 && top == v9 && right == v11)
  {
    double v15 = v10;

    if (bottom == v15) {
      return;
    }
  }
  else
  {
  }
  self->_labelEdgeInsets.double top = top;
  self->_labelEdgeInsets.double left = left;
  self->_labelEdgeInsets.double bottom = bottom;
  self->_labelEdgeInsets.double right = right;

  [(ChromeViewController *)self setNeedsUpdateComponent:@"labelInsetsAndWidths" animated:1];
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)ChromeViewController;
  [(ChromeViewController *)&v10 viewDidLayoutSubviews];
  [(ChromeViewController *)self _updateDebugLayoutGuidesView];
  BOOL v3 = [(ChromeViewController *)self view];
  [v3 bringSubviewToFront:self->_watermarkView];

  unsigned __int8 v4 = [(ChromeViewController *)self view];
  [v4 bounds];
  CGRect v12 = CGRectIntegral(v11);
  double width = v12.size.width;
  double height = v12.size.height;

  double v7 = self->_lastLayoutSize.width;
  double v8 = self->_lastLayoutSize.height;
  if (v7 != width || v8 != height)
  {
    self->_lastLayoutSize.double width = width;
    self->_lastLayoutSize.double height = height;
    [(ChromeViewController *)self setNeedsUpdateMapInsets];
  }
}

- (void)_updateDebugLayoutGuidesView
{
  if (![(ChromeViewController *)self isViewLoaded]) {
    return;
  }
  if (!+[NSThread isMainThread])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BEB614;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    return;
  }
  debugLayoutGuidesView = self->_debugLayoutGuidesView;
  if (self->_debugLayoutGuides)
  {
    if (!debugLayoutGuidesView)
    {
      unsigned __int8 v4 = [DebugFramesView alloc];
      id v5 = [(ChromeViewController *)self view];
      [v5 bounds];
      BOOL v6 = -[DebugFramesView initWithFrame:](v4, "initWithFrame:");

      [(DebugFramesView *)v6 setAutoresizingMask:18];
      double v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      double v9 = +[NSString stringWithFormat:@"%@.debugFramesView", v8];
      [(DebugFramesView *)v6 setAccessibilityIdentifier:v9];

      objc_super v10 = [(ChromeViewController *)self view];
      [v10 addSubview:v6];

      CGRect v11 = self->_debugLayoutGuidesView;
      self->_debugLayoutGuidesView = v6;
      CGRect v12 = v6;

      [(ChromeViewController *)self registerFramesInDebugFramesView:v12];
      debugLayoutGuidesView = self->_debugLayoutGuidesView;
    }
    [(ChromeViewController *)self updateFramesInDebugFramesView:debugLayoutGuidesView];
    id v13 = [(ChromeViewController *)self view];
    [v13 bringSubviewToFront:self->_debugLayoutGuidesView];

    __int16 v14 = self->_debugLayoutGuidesView;
    goto LABEL_7;
  }
  if (!debugLayoutGuidesView)
  {
    __int16 v14 = 0;
LABEL_7:
    [(DebugFramesView *)v14 setNeedsDisplay];
    return;
  }
  [(DebugFramesView *)self->_debugLayoutGuidesView removeFromSuperview];
  double v15 = self->_debugLayoutGuidesView;
  self->_debugLayoutGuidesView = 0;
}

- (UserLocationView)userLocationView
{
  userLocationView = self->_userLocationView;
  if (!userLocationView)
  {
    unsigned __int8 v4 = (UserLocationView *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "userLocationViewClass")), "initWithAnnotation:reuseIdentifier:", 0, 0);
    id v5 = self->_userLocationView;
    self->_userLocationView = v4;

    userLocationView = self->_userLocationView;
  }

  return userLocationView;
}

- (void)setNeedsUpdateMapInsets
{
}

- (id)personalizedItemSourcesForCurrentState
{
  BOOL v3 = [(ChromeViewController *)self nextTopContext];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ChromeViewController *)self topContext];
  }
  BOOL v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    double v7 = [v6 personalizedItemSources];
  }
  else
  {
    double v7 = &__NSArray0__struct;
  }

  return v7;
}

- (PersonalizedItemManager)personalizedItemManager
{
  personalizedItemManager = self->_personalizedItemManager;
  if (personalizedItemManager) {
    goto LABEL_12;
  }
  unsigned __int8 v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self;
    BOOL v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      double v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        objc_super v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    objc_super v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    BOOL v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Creating personalizedItemManager", buf, 0xCu);
  }
  CGRect v11 = [(ChromeViewController *)self customPOIsController];
  CGRect v12 = objc_alloc_init(PersonalizedItemManager);
  id v13 = self->_personalizedItemManager;
  self->_personalizedItemManager = v12;

  if (v11)
  {
    [(PersonalizedItemManager *)self->_personalizedItemManager addObserver:v11];
    __int16 v14 = self->_personalizedItemManager;
    double v15 = [(PersonalizedItemManager *)v14 allItems];
    double v16 = [(PersonalizedItemManager *)self->_personalizedItemManager itemGroups];
    [v11 personalizedItemManager:v14 didChangeItems:v15 itemGroups:v16];
  }
  personalizedItemManager = self->_personalizedItemManager;
LABEL_12:

  return personalizedItemManager;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = sub_1000D8CEC();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    goto LABEL_21;
  }
  double v8 = self;
  if (v8)
  {
    double v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      CGRect v11 = [(ChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
      CGRect v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    goto LABEL_10;
  }
  id v13 = @"<nil>";
LABEL_10:

  __int16 v14 = v13;
  id v15 = v6;
  if (!v15)
  {
    id v20 = @"<nil>";
    goto LABEL_18;
  }
  double v16 = (objc_class *)objc_opt_class();
  double v17 = NSStringFromClass(v16);
  if (objc_opt_respondsToSelector())
  {
    id v18 = [v15 performSelector:"accessibilityIdentifier"];
    BOOL v19 = v18;
    if (v18 && ![v18 isEqualToString:v17])
    {
      id v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

      goto LABEL_16;
    }
  }
  id v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_16:

LABEL_18:
  id v21 = @"NO";
  if (v4) {
    id v21 = @"YES";
  }
  id v22 = v21;
  *(_DWORD *)long long buf = 138543874;
  uint64_t v90 = v14;
  __int16 v91 = 2112;
  v92 = v20;
  __int16 v93 = 2112;
  uint64_t v94 = (NSDate *)v22;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] mapView: (%@) regionDidChangeAnimated: (%@)", buf, 0x20u);

LABEL_21:
  if (!self->_lastViewportChangeDate)
  {
    BOOL v70 = +[NSDate date];
    v71 = sub_1000D8C98();
    if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_55;
    }
    double v82 = self;
    BOOL v83 = (objc_class *)objc_opt_class();
    v84 = NSStringFromClass(v83);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v85 = [(ChromeViewController *)v82 performSelector:"accessibilityIdentifier"];
      v86 = v85;
      if (v85 && ![v85 isEqualToString:v84])
      {
        uint64_t v77 = +[NSString stringWithFormat:@"%@<%p, %@>", v84, v82, v86];

        goto LABEL_53;
      }
    }
    uint64_t v77 = +[NSString stringWithFormat:@"%@<%p>", v84, v82];
LABEL_53:

    *(_DWORD *)long long buf = 138543618;
    uint64_t v90 = v77;
    __int16 v91 = 2112;
    v92 = v70;
    double v79 = "[%{public}@] No value found for lastViewportChangeDate in mapView:regionDidChangeAnimated. This will only happ"
          "en once as all other changes would happen in mapViewDidStartUserInteraction. Setting lastViewportChangeDate to %@. ";
    double v80 = v71;
    uint32_t v81 = 22;
    goto LABEL_54;
  }
  [v6 visibleMapRect];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  [(ChromeViewController *)self visibleMapRect];
  if (v24 != v34 || v26 != v31 || v28 != v32 || v30 != v33)
  {
    id v42 = sub_1000D8C98();
    id v43 = "GEOAPSessionSpecificDataSource" + 16;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    id v44 = self;
    uint64_t v45 = (objc_class *)objc_opt_class();
    unint64_t v46 = NSStringFromClass(v45);
    if (objc_opt_respondsToSelector())
    {
      float64x2_t v47 = [(ChromeViewController *)v44 performSelector:"accessibilityIdentifier"];
      unsigned int v48 = v47;
      if (v47 && ![v47 isEqualToString:v46])
      {
        long long v49 = v6;
        long long v50 = +[NSString stringWithFormat:@"%@<%p, %@>", v46, v44, v48];

        goto LABEL_39;
      }
    }
    long long v49 = v6;
    long long v50 = +[NSString stringWithFormat:@"%@<%p>", v46, v44];
LABEL_39:
    char v87 = v50;

    uint64_t v88 = v50;
    [(ChromeViewController *)v44 visibleMapRect];
    uint64_t v52 = v51;
    uint64_t v54 = v53;
    double v57 = +[NSString stringWithFormat:@"{%.1f, %.1f}", v55, v56];
    double v58 = +[NSString stringWithFormat:@"{%.1f, %.1f}", v52, v54];
    double v59 = +[NSString stringWithFormat:@"{%@, %@}", v57, v58];

    id v60 = v59;
    [v49 visibleMapRect];
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    v67 = +[NSString stringWithFormat:@"{%.1f, %.1f}", v65, v66];
    v68 = +[NSString stringWithFormat:@"{%.1f, %.1f}", v62, v64];
    v69 = +[NSString stringWithFormat:@"{%@, %@}", v67, v68];

    id v43 = "ificDataSource";
    *(_DWORD *)long long buf = 138543874;
    uint64_t v90 = v87;
    __int16 v91 = 2112;
    v92 = v59;
    __int16 v93 = 2112;
    uint64_t v94 = v69;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "[%{public}@] Got a new region (%@ -> %@)", buf, 0x20u);

    id v6 = v49;
LABEL_40:

    [v6 visibleMapRect];
    -[ChromeViewController setVisibleMapRect:](self, "setVisibleMapRect:");
    BOOL v70 = +[NSDate date];
    v71 = sub_1000D8C98();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
    {
      __int16 v72 = self;
      int v73 = (objc_class *)objc_opt_class();
      double v74 = NSStringFromClass(v73);
      if (objc_opt_respondsToSelector())
      {
        float v75 = [(ChromeViewController *)v72 performSelector:"accessibilityIdentifier"];
        double v76 = v75;
        if (v75 && ![v75 isEqualToString:v74])
        {
          uint64_t v77 = +[NSString stringWithFormat:@"%@<%p, %@>", v74, v72, v76];

          goto LABEL_46;
        }
      }
      uint64_t v77 = +[NSString stringWithFormat:@"%@<%p>", v74, v72];
LABEL_46:

      lastViewportChangeDate = self->_lastViewportChangeDate;
      *(_DWORD *)long long buf = *((void *)v43 + 500);
      uint64_t v90 = v77;
      __int16 v91 = 2112;
      v92 = lastViewportChangeDate;
      __int16 v93 = 2112;
      uint64_t v94 = v70;
      double v79 = "[%{public}@] Changing the view port last change date (%@ -> %@)";
      double v80 = v71;
      uint32_t v81 = 32;
LABEL_54:
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, v79, buf, v81);
    }
LABEL_55:

    p_super = &self->_lastViewportChangeDate->super;
    self->_lastViewportChangeDate = v70;
    goto LABEL_56;
  }
  p_super = sub_1000D8C98();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
  {
    double v36 = self;
    long long v37 = (objc_class *)objc_opt_class();
    __int16 v38 = NSStringFromClass(v37);
    if (objc_opt_respondsToSelector())
    {
      id v39 = [(ChromeViewController *)v36 performSelector:"accessibilityIdentifier"];
      double v40 = v39;
      if (v39 && ![v39 isEqualToString:v38])
      {
        id v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v38, v36, v40];

        goto LABEL_32;
      }
    }
    id v41 = +[NSString stringWithFormat:@"%@<%p>", v38, v36];
LABEL_32:

    *(_DWORD *)long long buf = 138543362;
    uint64_t v90 = v41;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEBUG, "[%{public}@] Requested region is equal to existing region, ignoring.", buf, 0xCu);
  }
LABEL_56:
}

- (double)mapInsetsUpdateAnimationDuration
{
  +[GroupAnimation defaultAnimationDuration];
  return result;
}

- (CustomPOIsController)customPOIsController
{
  if (self->_customPOIsController) {
    goto LABEL_13;
  }
  BOOL v3 = [(ChromeViewController *)self mapView];

  if (!v3) {
    goto LABEL_13;
  }
  BOOL v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self;
    id v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      double v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        objc_super v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_9;
      }
    }
    objc_super v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

    *(_DWORD *)long long buf = 138543362;
    double v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Creating customPOIsController", buf, 0xCu);
  }
  CGRect v11 = objc_alloc_init(CustomPOIsController);
  customPOIsController = self->_customPOIsController;
  self->_customPOIsController = v11;

  id v13 = [(ChromeViewController *)self traitCollection];
  -[CustomPOIsController setAllowSingleSearchResult:](self->_customPOIsController, "setAllowSingleSearchResult:", [v13 userInterfaceIdiom] == (id)3);

  __int16 v14 = [(ChromeViewController *)self mapView];
  [(CustomPOIsController *)self->_customPOIsController setMapView:v14];

  personalizedItemManager = self->_personalizedItemManager;
  if (personalizedItemManager)
  {
    [(PersonalizedItemManager *)personalizedItemManager addObserver:self->_customPOIsController];
    double v16 = self->_customPOIsController;
    double v17 = self->_personalizedItemManager;
    id v18 = [(PersonalizedItemManager *)v17 allItems];
    BOOL v19 = [(PersonalizedItemManager *)self->_personalizedItemManager itemGroups];
    [(CustomPOIsController *)v16 personalizedItemManager:v17 didChangeItems:v18 itemGroups:v19];
  }
  [(SearchPinsManager *)self->_searchPinsManager setCustomPOIsController:self->_customPOIsController];
  [(MapSelectionManager *)self->_mapSelectionManager setCustomPOIsController:self->_customPOIsController];
LABEL_13:
  id v20 = self->_customPOIsController;

  return v20;
}

- (id)allComponents
{
  v4[0] = @"mapInsets";
  v4[1] = @"labelInsetsAndWidths";
  v4[2] = @"personalizedItemSources";
  v4[3] = @"navigationDisplay";
  v4[4] = @"routeAnnotations";
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (BOOL)_shouldEnableNavigationDisplayForContextStack:(id)a3 requestingContext:(id *)a4
{
  id v6 = a3;
  double v7 = [v6 lastObject];
  unsigned int v8 = [(ChromeViewController *)self wantsNavigationDisplayByDefault];
  double v9 = sub_1000C49B4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_super v10 = self;
    if (!v10)
    {
      id v15 = @"<nil>";
      goto LABEL_10;
    }
    CGRect v11 = (objc_class *)objc_opt_class();
    CGRect v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      id v13 = [(ChromeViewController *)v10 performSelector:"accessibilityIdentifier"];
      __int16 v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        id v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_8;
      }
    }
    id v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_8:

LABEL_10:
    double v16 = @"NO";
    if (v8) {
      double v16 = @"YES";
    }
    double v17 = v16;
    *(_DWORD *)long long buf = 138543618;
    long long v49 = v15;
    __int16 v50 = 2114;
    uint64_t v51 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Wants navigation display by default: %{public}@", buf, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v7 showsMapView])
  {
    LOBYTE(v8) = 0;
    goto LABEL_49;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = [v6 reverseObjectEnumerator];
  id v19 = [v18 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (!v19) {
    goto LABEL_48;
  }
  id v20 = v19;
  char v43 = v8;
  uint64_t v21 = *(void *)v45;
  while (2)
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v45 != v21) {
        objc_enumerationMutation(v18);
      }
      double v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        unsigned int v8 = [v23 wantsNavigationDisplay];
        if (a4) {
          *a4 = v23;
        }
        double v24 = sub_1000C49B4();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_47;
        }
        double v25 = self;
        double v26 = &selRef__updateSortedAppStoreAppsForTransportType_;
        if (!v25)
        {
          double v31 = @"<nil>";
LABEL_36:

          double v32 = v31;
          id v33 = v23;
          if (!v33)
          {
            id v39 = @"<nil>";
            goto LABEL_44;
          }
          double v34 = (objc_class *)objc_opt_class();
          id v35 = NSStringFromClass(v34);
          double v36 = v26[326];
          if (objc_opt_respondsToSelector())
          {
            long long v37 = [v33 performSelector:v36];
            __int16 v38 = v37;
            if (v37 && ![v37 isEqualToString:v35])
            {
              id v39 = +[NSString stringWithFormat:@"%@<%p, %@>", v35, v33, v38];

              goto LABEL_42;
            }
          }
          id v39 = +[NSString stringWithFormat:@"%@<%p>", v35, v33];
LABEL_42:

LABEL_44:
          double v40 = @"NO";
          if (v8) {
            double v40 = @"YES";
          }
          id v41 = v40;
          *(_DWORD *)long long buf = 138543874;
          long long v49 = v32;
          __int16 v50 = 2112;
          uint64_t v51 = v39;
          __int16 v52 = 2114;
          uint64_t v53 = v41;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] context %@ responded %{public}@ to wantsNavigationDisplay", buf, 0x20u);

LABEL_47:
          goto LABEL_48;
        }
        double v27 = (objc_class *)objc_opt_class();
        double v28 = NSStringFromClass(v27);
        if (objc_opt_respondsToSelector())
        {
          double v29 = [(ChromeViewController *)v25 performSelector:"accessibilityIdentifier"];
          double v30 = v29;
          if (v29 && ![v29 isEqualToString:v28])
          {
            double v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v28, v25, v30];

            goto LABEL_33;
          }
        }
        double v31 = +[NSString stringWithFormat:@"%@<%p>", v28, v25];
LABEL_33:

        double v26 = &selRef__updateSortedAppStoreAppsForTransportType_;
        goto LABEL_36;
      }
    }
    id v20 = [v18 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v20) {
      continue;
    }
    break;
  }
  LOBYTE(v8) = v43;
LABEL_48:

LABEL_49:
  return v8;
}

- (BOOL)wantsNavigationDisplayByDefault
{
  return 0;
}

- (SearchPinsManager)searchPinsManager
{
  searchPinsManager = self->_searchPinsManager;
  if (searchPinsManager) {
    goto LABEL_11;
  }
  BOOL v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self;
    id v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        objc_super v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    objc_super v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Creating searchPinsManager", buf, 0xCu);
  }
  CGRect v11 = [SearchPinsManager alloc];
  CGRect v12 = [(ChromeViewController *)self mapCameraController];
  id v13 = [(SearchPinsManager *)v11 initWithMapViewCameraController:v12];
  __int16 v14 = self->_searchPinsManager;
  self->_searchPinsManager = v13;

  id v15 = [(ChromeViewController *)self mapSelectionManager];
  [(SearchPinsManager *)self->_searchPinsManager setMapSelectionManager:v15];

  double v16 = [(ChromeViewController *)self customPOIsController];
  [(SearchPinsManager *)self->_searchPinsManager setCustomPOIsController:v16];

  char v17 = objc_opt_respondsToSelector();
  searchPinsManager = self->_searchPinsManager;
  if (v17)
  {
    [(SearchPinsManager *)searchPinsManager setDelegate:self];
    searchPinsManager = self->_searchPinsManager;
  }
LABEL_11:

  return searchPinsManager;
}

- (UILayoutGuide)viewportLayoutGuide
{
  return self->_viewportLayoutGuide;
}

- (void)viewDidLoad
{
  v60.receiver = self;
  v60.super_class = (Class)ChromeViewController;
  [(ChromeViewController *)&v60 viewDidLoad];
  BOOL v3 = +[UIColor systemBackgroundColor];
  BOOL v4 = [(ChromeViewController *)self view];
  [v4 setBackgroundColor:v3];

  if ([(ChromeViewController *)self shouldAutomaticallyLoadMapView]) {
    [(ChromeViewController *)self loadMapViewIfNeeded];
  }
  if ([(ChromeViewController *)self isInactive]) {
    [(ChromeViewController *)self _setInactive:self->_inactive];
  }
  id v5 = [(ChromeViewController *)self view];
  id v6 = [v5 safeAreaLayoutGuide];
  LODWORD(v7) = 1148829696;
  [v6 _maps_layoutGuideInsideEdgesWithPriority:v7];
  id obj = (id)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_viewportLayoutGuide, obj);
  id v54 = objc_alloc_init((Class)UILayoutGuide);
  unsigned int v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  objc_super v10 = +[NSString stringWithFormat:@"%@.mapInsetsLayoutGuide", v9];
  [v54 setIdentifier:v10];

  CGRect v11 = [(ChromeViewController *)self view];
  [v11 addLayoutGuide:v54];

  objc_storeStrong((id *)&self->_mapInsetsLayoutGuide, v54);
  CGRect v12 = [PassThroughView alloc];
  id v13 = [(ChromeViewController *)self view];
  [v13 bounds];
  uint64_t v56 = -[PassThroughView initWithFrame:](v12, "initWithFrame:");

  [(PassThroughView *)v56 setTranslatesAutoresizingMaskIntoConstraints:0];
  __int16 v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  double v16 = +[NSString stringWithFormat:@"%@.Viewport", v15];
  [(PassThroughView *)v56 setAccessibilityIdentifier:v16];

  char v17 = [(ChromeViewController *)self view];
  [v17 addSubview:v56];

  objc_storeStrong((id *)&self->_viewport, v56);
  id v53 = objc_alloc_init((Class)NSMutableArray);
  __int16 v52 = [(PassThroughView *)v56 leadingAnchor];
  uint64_t v51 = [obj leadingAnchor];
  __int16 v50 = [v52 constraintEqualToAnchor:v51];
  v61[0] = v50;
  long long v49 = [(PassThroughView *)v56 topAnchor];
  id v18 = [obj topAnchor];
  id v19 = [v49 constraintEqualToAnchor:v18];
  v61[1] = v19;
  id v20 = [obj trailingAnchor];
  uint64_t v21 = [(PassThroughView *)v56 trailingAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21];
  v61[2] = v22;
  double v23 = [obj bottomAnchor];
  double v24 = [(PassThroughView *)v56 bottomAnchor];
  double v25 = [v23 constraintEqualToAnchor:v24];
  v61[3] = v25;
  double v26 = +[NSArray arrayWithObjects:v61 count:4];
  [v53 addObjectsFromArray:v26];

  double v27 = [(ChromeViewController *)self view];
  LODWORD(v28) = 1112014848;
  double v29 = [v27 _maps_constraintsEqualToEdgesOfLayoutGuide:v54 priority:v28];
  double v30 = [v29 allConstraints];
  [v53 addObjectsFromArray:v30];

  double v31 = [(ChromeViewController *)self view];
  double v32 = [v31 safeAreaLayoutGuide];
  LODWORD(v33) = 1112276992;
  [v32 _maps_constraintsEqualToEdgesOfLayoutGuide:v54 priority:v33];
  double v34 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue();
  safeAreaMapEdgeInsetsConstraints = self->_safeAreaMapEdgeInsetsConstraints;
  self->_safeAreaMapEdgeInsetsConstraints = v34;

  +[NSLayoutConstraint activateConstraints:v53];
  [(ChromeViewController *)self _addWatermarkView];
  double v36 = objc_alloc_init(ChromeOverlayController);
  overlayController = self->_overlayController;
  self->_overlayController = v36;

  __int16 v38 = [(ChromeViewController *)self overlayController];
  [v38 setDelegate:self];

  if (![(ChromeViewController *)self isSuppressed])
  {
    id v39 = [(ChromeViewController *)self overlayController];
    double v40 = [(ChromeViewController *)self view];
    id v41 = [(ChromeViewController *)self view];
    id v42 = [v41 safeAreaLayoutGuide];
    char v43 = [(ChromeViewController *)self mapInsetsLayoutGuide];
    long long v44 = [(ChromeViewController *)self viewportLayoutGuide];
    [v39 installInView:v40 containingViewController:self contentLayoutGuide:v42 mapInsetsLayoutGuide:v43 viewportLayoutGuide:v44];
  }
  objc_initWeak(&location, self);
  long long v45 = +[NSNotificationCenter defaultCenter];
  long long v46 = +[NSOperationQueue mainQueue];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10003FE7C;
  v57[3] = &unk_1012E6730;
  objc_copyWeak(&v58, &location);
  long long v47 = [v45 addObserverForName:UISceneWillEnterForegroundNotification object:0 queue:v46 usingBlock:v57];
  id sceneForegroundingNotificationToken = self->_sceneForegroundingNotificationToken;
  self->_id sceneForegroundingNotificationToken = v47;

  objc_destroyWeak(&v58);
  objc_destroyWeak(&location);
}

- (ChromeOverlayController)overlayController
{
  return self->_overlayController;
}

- (void)_getContextsLeaving:(id *)a3 entering:(id *)a4 fromPrevious:(id)a5 incoming:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a3)
  {
    id v11 = [objc_alloc((Class)NSMutableSet) initWithArray:v9];
    if ([v11 count])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v30;
        do
        {
          double v16 = 0;
          do
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v12);
            }
            [v11 removeObject:*(void *)(*((void *)&v29 + 1) + 8 * (void)v16)];
            double v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v14);
      }
    }
    id v17 = v11;
    *a3 = v17;
  }
  if (a4)
  {
    id v18 = [objc_alloc((Class)NSMutableSet) initWithArray:v10];
    if ([v18 count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v19 = v9;
      id v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v26;
        do
        {
          double v23 = 0;
          do
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v19);
            }
            [v18 removeObject:*(void *)(*((void *)&v25 + 1) + 8 * (void)v23) v25];
            double v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          id v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v21);
      }
    }
    id v24 = v18;
    *a4 = v24;
  }
}

- (ChromeContext)previousTopContext
{
  return [(ChromeContextTransition *)self->_currentContextTransition previousTopContext];
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  double x = self->_visibleMapRect.origin.x;
  double y = self->_visibleMapRect.origin.y;
  double width = self->_visibleMapRect.size.width;
  double height = self->_visibleMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (BOOL)supportsDefaultFullscreenViewControllerPresentation
{
  return 1;
}

- (BOOL)shouldAutomaticallyLoadMapView
{
  return 1;
}

- (void)setVisibleMapRect:(id)a3
{
  self->_visibleMapRect = ($AF866507483A7485D187EE11486BA295)a3;
}

- (void)setSearchContextDefaultsKeysPrefix:(id)a3
{
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (id)defaultFullscreenViewControllerPresentationTransition
{
  v2 = objc_alloc_init(ChromeMapToMapTransition);

  return v2;
}

- (CustomSearchManager)customSearchManager
{
  return (CustomSearchManager *)+[CustomSearchManager sharedManager];
}

- (id)acquireMapInsetPropagationSuspensionTokenForReason:(id)a3
{
  return [(MapsTokenStorage *)self->_mapInsetPropagationSuspensionTokens tokenWithReason:a3];
}

+ (BOOL)requiresUniqueContextIdentifiers
{
  return 0;
}

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100A8DE88();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_14;
  }
  id v11 = self;
  if (!v11)
  {
    double v16 = @"<nil>";
    goto LABEL_10;
  }
  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  if (objc_opt_respondsToSelector())
  {
    id v14 = [(ChromeViewController *)v11 performSelector:"accessibilityIdentifier"];
    uint64_t v15 = v14;
    if (v14 && ![v14 isEqualToString:v13])
    {
      double v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

      goto LABEL_8;
    }
  }
  double v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_8:

LABEL_10:
  if ((unint64_t)(a3 - 1) > 0x16) {
    CFStringRef v17 = @"kMapsInterruptionNone";
  }
  else {
    CFStringRef v17 = *(&off_101315FE8 + a3 - 1);
  }
  *(_DWORD *)long long buf = 138543618;
  __int16 v52 = v16;
  __int16 v53 = 2112;
  CFStringRef v54 = v17;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting interruption of kind: %@", buf, 0x16u);

LABEL_14:
  id v18 = [(ChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(__CFString *)v20 canPresentInterruptionOfKind:a3])
  {
    if ([(ChromeViewController *)self conformsToProtocol:&OBJC_PROTOCOL___InterruptionManagerProtocol])
    {
      long long v28 = self;
      long long v29 = sub_100A8DE88();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
LABEL_48:

        long long v45 = [(ChromeViewController *)v28 interruptionManager];
        char v43 = [v45 presentUnhandledInterruptionOfKind:a3 userInfo:v8 completionHandler:v9];

        goto LABEL_57;
      }
      long long v30 = v28;
      id v49 = v8;
      if (!v30)
      {
        id v35 = @"<nil>";
        goto LABEL_47;
      }
      long long v31 = (objc_class *)objc_opt_class();
      long long v32 = NSStringFromClass(v31);
      if (objc_opt_respondsToSelector())
      {
        double v33 = [(ChromeViewController *)v30 performSelector:"accessibilityIdentifier"];
        double v34 = v33;
        if (v33 && ![v33 isEqualToString:v32])
        {
          id v35 = +[NSString stringWithFormat:@"%@<%p, %@>", v32, v30, v34];

          goto LABEL_35;
        }
      }
      id v35 = +[NSString stringWithFormat:@"%@<%p>", v32, v30];
LABEL_35:

LABEL_47:
      long long v44 = [(ChromeViewController *)v30 interruptionManager];
      *(_DWORD *)long long buf = 138543618;
      __int16 v52 = v35;
      __int16 v53 = 2112;
      CFStringRef v54 = v44;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Asking interruption manager %@ to present the interruption", buf, 0x16u);

      id v8 = v49;
      goto LABEL_48;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      char v43 = 0;
      goto LABEL_57;
    }
    double v36 = sub_100A8DE88();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
LABEL_55:

      uint64_t v46 = [(ChromeViewController *)self presentUnhandledInterruptionOfKind:a3 userInfo:v8 completionHandler:v9];
      goto LABEL_56;
    }
    long long v37 = self;
    id v50 = v8;
    if (!v37)
    {
      id v42 = @"<nil>";
      goto LABEL_54;
    }
    __int16 v38 = (objc_class *)objc_opt_class();
    id v39 = NSStringFromClass(v38);
    if (objc_opt_respondsToSelector())
    {
      double v40 = [(ChromeViewController *)v37 performSelector:"accessibilityIdentifier"];
      id v41 = v40;
      if (v40 && ![v40 isEqualToString:v39])
      {
        id v42 = +[NSString stringWithFormat:@"%@<%p, %@>", v39, v37, v41];

        goto LABEL_44;
      }
    }
    id v42 = +[NSString stringWithFormat:@"%@<%p>", v39, v37];
LABEL_44:

LABEL_54:
    *(_DWORD *)long long buf = 138543362;
    __int16 v52 = v42;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling the interruption ourselves", buf, 0xCu);

    id v8 = v50;
    goto LABEL_55;
  }
  id v21 = sub_100A8DE88();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = self;
    if (!v22)
    {
      long long v27 = @"<nil>";
      goto LABEL_51;
    }
    double v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    if (objc_opt_respondsToSelector())
    {
      id v48 = v8;
      long long v25 = [(ChromeViewController *)v22 performSelector:"accessibilityIdentifier"];
      long long v26 = v25;
      if (v25 && ![v25 isEqualToString:v24])
      {
        long long v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

        id v8 = v48;
        goto LABEL_26;
      }

      id v8 = v48;
    }
    long long v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_26:

LABEL_51:
    *(_DWORD *)long long buf = 138543618;
    __int16 v52 = v27;
    __int16 v53 = 2112;
    CFStringRef v54 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Asking context %@ to present the interruption", buf, 0x16u);
  }
  uint64_t v46 = [(__CFString *)v20 presentInterruptionOfKind:a3 userInfo:v8 completionHandler:v9];
LABEL_56:
  char v43 = (void *)v46;
LABEL_57:

  return v43;
}

- (id)presentUnhandledInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  return 0;
}

- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3
{
  return 1;
}

+ (id)localizedLocationAuthorizationMessage
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"];

  return v3;
}

+ (id)localizedLocationAuthorizationTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Allow '%@' to use your location?" value:@"localized string not found" table:0];

  BOOL v4 = +[NSBundle mainBundle];
  id v5 = [v4 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
}

- (void)dealloc
{
  BOOL v3 = sub_1000C49B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      double v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)long long buf = 138543362;
    double v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Deallocating", buf, 0xCu);
  }
  if (self->_sceneForegroundingNotificationToken)
  {
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self->_sceneForegroundingNotificationToken];
  }
  GEOConfigRemoveDelegateListenerForAllKeys();
  id v11 = +[GEOPlatform sharedPlatform];
  unsigned int v12 = [v11 isInternalInstall];

  if (v12)
  {
    id v13 = +[MapsRadarController sharedInstance];
    [v13 removeAttachmentProvider:self];
  }
  v14.receiver = self;
  v14.super_class = (Class)ChromeViewController;
  [(ChromeViewController *)&v14 dealloc];
}

- (void)_removeWatermarkView
{
  [(WatermarkView *)self->_watermarkView removeFromSuperview];
  watermarkView = self->_watermarkView;
  self->_watermarkView = 0;
}

- (void)registerFramesInDebugFramesView:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIColor systemGrayColor];
  [v3 registerName:@"safe area" color:v4 weight:15 edges:1.0];

  id v5 = +[UIColor systemBlueColor];
  [v3 registerName:@"viewport" color:v5 weight:15 edges:1.0];

  id v6 = +[UIColor systemDarkGreenColor];
  [v3 registerName:@"map insets" color:v6 weight:15 edges:1.0];
}

- (void)updateFramesInDebugFramesView:(id)a3
{
  id v4 = a3;
  id v5 = [(ChromeViewController *)self view];
  id v6 = [v5 safeAreaLayoutGuide];
  [v4 setLayoutGuide:v6 forName:@"safe area"];

  double v7 = [(ChromeViewController *)self viewportLayoutGuide];
  [v4 setLayoutGuide:v7 forName:@"viewport"];

  id v8 = [(ChromeViewController *)self mapInsetsLayoutGuide];
  [v4 setLayoutGuide:v8 forName:@"map insets"];
}

- (id)contextProtocol
{
  return &OBJC_PROTOCOL___ChromeContext;
}

- (id)uniqueIdentifierForContext:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:@"%@.%p", objc_opt_class(), v3];

  return v4;
}

- (id)contextForUniqueIdentifier:(id)a3
{
  return [(NSMapTable *)self->_contextsByUniqueIdentifier objectForKey:a3];
}

- (BOOL)isCurrentContext:(id)a3
{
  id v4 = a3;
  if ([(ChromeViewController *)self isSuppressed]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [(ChromeViewController *)self isTopContext:v4];
  }

  return v5;
}

- (void)popToContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BEB9B0;
  v13[3] = &unk_10131AEE0;
  id v14 = v8;
  uint64_t v15 = self;
  BOOL v16 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100BEBC7C;
  v11[3] = &unk_10131AF08;
  id v9 = v12;
  id v10 = v8;
  [(ChromeViewController *)self scheduleCoordinatedContextChange:v13 completionHandler:v11];
}

- (void)popToRootContextAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(ChromeViewController *)self contexts];
  double v7 = [v8 firstObject];
  [(ChromeViewController *)self popToContext:v7 animated:v4 completion:v6];
}

- (void)popContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BEBE20;
  v13[3] = &unk_10131AEE0;
  id v14 = v8;
  uint64_t v15 = self;
  BOOL v16 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100BEC174;
  v11[3] = &unk_10131AF08;
  id v9 = v12;
  id v10 = v8;
  [(ChromeViewController *)self scheduleCoordinatedContextChange:v13 completionHandler:v11];
}

- (void)popContextAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(ChromeViewController *)self contexts];
  double v7 = [v8 lastObject];
  [(ChromeViewController *)self popContext:v7 animated:v4 completion:v6];
}

- (void)setContexts:(id)a3
{
}

- (void)setContexts:(id)a3 animated:(BOOL)a4
{
}

- (void)setContexts:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BEC328;
  v13[3] = &unk_10131AEE0;
  void v13[4] = self;
  id v14 = v8;
  BOOL v15 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100BEC578;
  v11[3] = &unk_10131AF08;
  id v9 = v12;
  id v10 = v8;
  [(ChromeViewController *)self scheduleCoordinatedContextChange:v13 completionHandler:v11];
}

- (void)removeContextStackObserver:(id)a3
{
  if (a3) {
    -[GEOObserverHashTable unregisterObserver:](self->_stackObservers, "unregisterObserver:");
  }
}

- (void)setFallbackContextCoordinationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ChromeViewController *)self _contextCoordinatedScheduler];
  [v5 setFallbackBlock:v4];
}

- (void)commitCoordinatedContextChange
{
  id v2 = [(ChromeViewController *)self _contextCoordinatedScheduler];
  [v2 commit];
}

- (void)whenContextNextBecomesCurrent:(id)a3 performAction:(id)a4 withBlock:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if ([(ChromeViewController *)self isCurrentContext:v15])
  {
    v9[2](v9, 1);
  }
  else
  {
    deferredActionsByContext = self->_deferredActionsByContext;
    if (!deferredActionsByContext)
    {
      id v11 = +[NSMapTable weakToStrongObjectsMapTable];
      id v12 = self->_deferredActionsByContext;
      self->_deferredActionsByContext = v11;

      deferredActionsByContext = self->_deferredActionsByContext;
    }
    id v13 = [(NSMapTable *)deferredActionsByContext objectForKey:v15];
    if (!v13)
    {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      [(NSMapTable *)self->_deferredActionsByContext setObject:v13 forKey:v15];
    }
    id v14 = [v9 copy];
    [v13 setObject:v14 forKeyedSubscript:v8];
  }
}

- (BOOL)hasDeferredAction:(id)a3 forContext:(id)a4
{
  deferredActionsByContext = self->_deferredActionsByContext;
  if (!deferredActionsByContext) {
    return 0;
  }
  id v6 = a3;
  double v7 = [(NSMapTable *)deferredActionsByContext objectForKey:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];

  BOOL v9 = v8 != 0;
  return v9;
}

- (void)cancelDeferredAction:(id)a3 forContext:(id)a4
{
  id v8 = a3;
  id v6 = [(NSMapTable *)self->_deferredActionsByContext objectForKey:a4];
  double v7 = v6;
  if (v6) {
    [v6 removeObjectForKey:v8];
  }
}

- (BOOL)shouldUseModernMap
{
  return 1;
}

- (int64_t)modernMapTerrainMode
{
  return 0;
}

- (int64_t)modernMapProjectionType
{
  return 0;
}

- (void)registerAdditionalMapViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = &OBJC_PROTOCOL___MKMapViewDelegatePrivate;
  if (sub_1000BBF90((uint64_t)v4, (Protocol *)v5)) {
    goto LABEL_2;
  }
  id v20 = sub_1005762E4();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = v4;
    if (!v21)
    {
      long long v26 = @"<nil>";
      goto LABEL_32;
    }
    uint64_t v22 = (objc_class *)objc_opt_class();
    double v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      id v24 = [v21 performSelector:"accessibilityIdentifier"];
      long long v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        long long v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_30;
      }
    }
    long long v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_30:

LABEL_32:
    long long v27 = +[NSString stringWithFormat:@"Trying to register additional map view delegate %@ but it does not conform to protocol", v26];
    *(_DWORD *)long long buf = 136316162;
    long long v31 = "-[ChromeViewController registerAdditionalMapViewDelegate:]";
    __int16 v32 = 2080;
    double v33 = "ChromeViewController.m";
    __int16 v34 = 1024;
    int v35 = 1565;
    __int16 v36 = 2080;
    long long v37 = "MapsCachedConformsToProtocol(delegate, protocol)";
    __int16 v38 = 2112;
    id v39 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
  }
  if (sub_100BB36BC())
  {
    long long v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = +[NSThread callStackSymbols];
      *(_DWORD *)long long buf = 138412290;
      long long v31 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
LABEL_2:
  id v6 = sub_1000C49B4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = self;
    if (!v7)
    {
      id v12 = @"<nil>";
LABEL_11:

      id v13 = v12;
      id v14 = v4;
      if (!v14)
      {
        id v19 = @"<nil>";
        goto LABEL_19;
      }
      id v15 = (objc_class *)objc_opt_class();
      BOOL v16 = NSStringFromClass(v15);
      if (objc_opt_respondsToSelector())
      {
        CFStringRef v17 = [v14 performSelector:"accessibilityIdentifier"];
        id v18 = v17;
        if (v17 && ![v17 isEqualToString:v16])
        {
          id v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

          goto LABEL_17;
        }
      }
      id v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

LABEL_19:
      *(_DWORD *)long long buf = 138543618;
      long long v31 = (const char *)v13;
      __int16 v32 = 2112;
      double v33 = (const char *)v19;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering additional map view delegate: %@", buf, 0x16u);

      goto LABEL_20;
    }
    id v8 = (objc_class *)objc_opt_class();
    BOOL v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(ChromeViewController *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

    goto LABEL_11;
  }
LABEL_20:

  [(ChromeDelegateProxy *)self->_mapViewDelegateProxy addAdditionalDelegate:v4 forProtocol:v5];
}

+ (BOOL)mapInsetsShouldRespectSafeAreaInsetsByDefault
{
  return 1;
}

- (void)clearMapGesturesAndAnimations
{
  id v2 = [(ChromeViewController *)self mapView];
  [v2 _clearGesturesAndAnimations];
}

- (id)acquireChromeDeactivationTokenForReason:(id)a3
{
  return [(MapsTokenStorage *)self->_deactivationTokens tokenWithReason:a3];
}

- (id)acquireHikingMapToken
{
  hikingMapTokens = self->_hikingMapTokens;
  CFStringRef v6 = @"reason";
  CFStringRef v7 = @"none";
  id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [(MapsTokenStorage *)hikingMapTokens tokenWithUserInfo:v3];

  return v4;
}

- (id)acquireExploreMapHikingMapToken
{
  hikingMapTokens = self->_hikingMapTokens;
  CFStringRef v6 = @"reason";
  CFStringRef v7 = @"mapType";
  id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [(MapsTokenStorage *)hikingMapTokens tokenWithUserInfo:v3];

  return v4;
}

- (void)resetForcedExploreModernMapFlag
{
  id v3 = sub_1000C49B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing forced Explore + Modern Map flag", v4, 2u);
  }

  self->_hasForcedExploreModernMap = 0;
  [(ChromeViewController *)self didUpdateForcedExploreMapConfiguration:0];
}

- (BOOL)shouldUseHikingMap
{
  return [(MapsTokenStorage *)self->_hikingMapTokens count] != 0;
}

- (BOOL)shouldForceExploreMap
{
  id v2 = [(MapsTokenStorage *)self->_hikingMapTokens allTokenReasons];
  unsigned __int8 v3 = [v2 containsObject:@"mapType"];

  return v3;
}

- (void)updateHikingMapConfiguration
{
  BOOL v3 = [(ChromeViewController *)self shouldUseHikingMap];
  if ([(ChromeViewController *)self shouldForceExploreMap])
  {
    if (self->_hasForcedExploreModernMap) {
      goto LABEL_16;
    }
    id v4 = sub_1000C49B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing mapType to Explore + Modern Map", buf, 2u);
    }

    id v5 = [(ChromeViewController *)self mapView];
    CFStringRef v6 = v5;
    if (v5)
    {
      [v5 _cartographicConfiguration];
    }
    else
    {
      uint64_t v37 = 0;
      long long v36 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    long long v15 = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_originalConfiguration.int64_t style = *(_OWORD *)buf;
    *(_OWORD *)&self->_originalConfiguration.int64_t projection = v15;
    *(_OWORD *)&self->_originalConfiguration.mapkitUsage = v36;
    uint64_t v16 = v37;
    *(void *)&self->_originalConfiguration.gridOnldouble y = v37;
    *(_OWORD *)long long buf = *(_OWORD *)&self->_originalConfiguration.mapkitUsage;
    *(void *)&buf[16] = v16;

    if (sub_1000BBB44(self) != 5)
    {
      CFStringRef v17 = [(ChromeViewController *)self mapView];
      [v17 setOverrideUserInterfaceStyle:0];

      id v18 = [(ChromeViewController *)self _maps_mapsSceneDelegate];
      id v19 = [v18 window];
      [v19 setOverrideUserInterfaceStyle:0];
    }
    id v20 = [(ChromeViewController *)self mapView];
    v33[0] = xmmword_100F69570;
    v33[1] = xmmword_100F5CF70;
    v33[2] = *(_OWORD *)buf;
    uint64_t v34 = *(void *)&buf[16];
    [v20 _setCartographicConfiguration:v33];

    self->_hasForcedExploreModernMap = 1;
    id v13 = self;
    uint64_t v14 = 1;
  }
  else
  {
    if (!self->_hasForcedExploreModernMap) {
      goto LABEL_16;
    }
    int64_t style = self->_originalConfiguration.style;
    int64_t emphasis = self->_originalConfiguration.emphasis;
    int64_t projection = self->_originalConfiguration.projection;
    int64_t terrainMode = self->_originalConfiguration.terrainMode;
    long long v31 = *(_OWORD *)&self->_originalConfiguration.mapkitUsage;
    uint64_t v32 = *(void *)&self->_originalConfiguration.gridOnly;
    id v11 = sub_1000C49B4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218752;
      *(void *)&uint8_t buf[4] = style;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = emphasis;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = projection;
      LOWORD(v36) = 2048;
      *(void *)((char *)&v36 + 2) = terrainMode;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Restoring configuration, style %ld, emphasis %ld, projection %ld, terrainMode %ld", buf, 0x2Au);
    }

    id v12 = [(ChromeViewController *)self mapView];
    v28[0] = style;
    v28[1] = emphasis;
    v28[2] = projection;
    v28[3] = terrainMode;
    long long v29 = v31;
    uint64_t v30 = v32;
    [v12 _setCartographicConfiguration:v28];

    self->_hasForcedExploreModernMap = 0;
    id v13 = self;
    uint64_t v14 = 0;
  }
  [(ChromeViewController *)v13 didUpdateForcedExploreMapConfiguration:v14];
LABEL_16:
  id v21 = [(ChromeViewController *)self mapView];
  uint64_t v22 = [v21 preferredConfiguration];

  if ([v22 conformsToProtocol:&OBJC_PROTOCOL___MKMapConfigurationHiking]) {
    double v23 = v22;
  }
  else {
    double v23 = 0;
  }
  id v24 = v23;

  if (v24)
  {
    long long v25 = sub_1000C49B4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = @"NO";
      if (v3) {
        long long v26 = @"YES";
      }
      long long v27 = v26;
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "updateHikingMapConfiguration showsTopographicFeatures: %{public}@", buf, 0xCu);
    }
    [v24 setShowsTopographicFeatures:v3];
  }
}

- (void)checkIfCoordinate:(CLLocationCoordinate2D)a3 isInHikingContextualRegionWithCompletionHandler:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  id v8 = sub_1000C49B4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v20 = 134349569;
    id v21 = self;
    __int16 v22 = 2049;
    double v23 = latitude;
    __int16 v24 = 2049;
    double v25 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Queueing up hiking coordinate check for: %{private}f, %{private}f", (uint8_t *)&v20, 0x20u);
  }

  BOOL v9 = +[_MapsCoordinateKey coordinateKeyFromCoordinate:](_MapsCoordinateKey, "coordinateKeyFromCoordinate:", latitude, longitude);
  id v10 = [(NSMapTable *)self->_hikingCoordinateChecks keyEnumerator];
  id v11 = [v10 allObjects];
  unsigned int v12 = [v11 containsObject:v9];

  id v13 = sub_1000C49B4();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      int v20 = 134349056;
      id v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Existing check for this coordinate is already in flight; adding completion block to the list",
        (uint8_t *)&v20,
        0xCu);
    }

    long long v15 = [(NSMapTable *)self->_hikingCoordinateChecks objectForKey:v9];
    id v16 = [v7 copy];
    id v17 = objc_retainBlock(v16);
    [v15 addObject:v17];
  }
  else
  {
    if (v14)
    {
      int v20 = 134349056;
      id v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] There are no existing checks for this coordinate in flight; creating new task",
        (uint8_t *)&v20,
        0xCu);
    }

    NSUInteger v18 = [(NSMapTable *)self->_hikingCoordinateChecks count];
    id v19 = [v7 copy];
    long long v15 = +[NSMutableSet setWithObject:v19];

    [(NSMapTable *)self->_hikingCoordinateChecks setObject:v15 forKey:v9];
    if (!v18) {
      -[ChromeViewController _checkHikingCoordinate:](self, "_checkHikingCoordinate:", latitude, longitude);
    }
  }
}

- (void)_checkHikingCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  objc_initWeak(&location, self);
  CFStringRef v6 = sub_1000C49B4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134349569;
    unsigned int v12 = self;
    __int16 v13 = 2049;
    double v14 = latitude;
    __int16 v15 = 2049;
    double v16 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Checking hiking coordinate: %{private}f, %{private}f", buf, 0x20u);
  }

  id v7 = [(ChromeViewController *)self mapView];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BEE264;
  v8[3] = &unk_10131B0D0;
  objc_copyWeak(&v9, &location);
  [v7 checkIfCoordinate:v8 isInHikingContextualRegionWithCompletionHandler:latitude, longitude];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_setInactive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  BOOL inactive = self->_inactive;
  self->_BOOL inactive = a3;
  if (![(ChromeViewController *)self isViewLoaded]
    || [(ChromeViewController *)v4 isSuppressed])
  {
    CFStringRef v6 = sub_1000C49B4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:

      goto LABEL_20;
    }
    id v7 = v4;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    __int16 v53 = v4;
    BOOL v52 = inactive;
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(ChromeViewController *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        unsigned int v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    unsigned int v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

    if (v3) {
      __int16 v13 = @"YES";
    }
    else {
      __int16 v13 = @"NO";
    }
    double v14 = v13;
    BOOL v15 = v3;
    if ([(ChromeViewController *)v7 isViewLoaded]) {
      double v16 = @"YES";
    }
    else {
      double v16 = @"NO";
    }
    id v17 = v16;
    *(_DWORD *)long long buf = 138544130;
    if ([(ChromeViewController *)v7 isSuppressed]) {
      NSUInteger v18 = @"YES";
    }
    else {
      NSUInteger v18 = @"NO";
    }
    uint64_t v55 = v12;
    __int16 v56 = 2114;
    double v57 = (const char *)v13;
    __int16 v58 = 2114;
    *(void *)double v59 = v16;
    BOOL v3 = v15;
    *(_WORD *)&v59[8] = 2114;
    *(void *)&v59[10] = v18;
    id v19 = v18;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting chrome inactive: %{public}@, but view not loaded (loaded? %{public}@) or suppressed (%{public}@)", buf, 0x2Au);

    id v4 = v53;
    BOOL inactive = v52;
    goto LABEL_19;
  }
  int v20 = sub_1000C49B4();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (inactive != v3)
  {
    if (!v21) {
      goto LABEL_54;
    }
    int v35 = v4;
    long long v36 = (objc_class *)objc_opt_class();
    uint64_t v37 = NSStringFromClass(v36);
    if (objc_opt_respondsToSelector())
    {
      __int16 v38 = [v35 performSelector:"accessibilityIdentifier"];
      id v39 = v38;
      if (v38 && ![v38 isEqualToString:v37])
      {
        double v40 = +[NSString stringWithFormat:@"%@<%p, %@>", v37, v35, v39];

        goto LABEL_41;
      }
    }
    double v40 = +[NSString stringWithFormat:@"%@<%p>", v37, v35];
LABEL_41:

    long long v28 = v40;
    id v41 = @"NO";
    if (v3) {
      id v41 = @"YES";
    }
    uint64_t v30 = v41;
    id v42 = [v35[37] allTokenReasons];
    uint64_t v32 = v42;
    if (v42)
    {
      if ([v42 count])
      {
        char v43 = [v32 componentsJoinedByString:@", "];
        uint64_t v34 = +[NSString stringWithFormat:@"<%p> [%@]", v32, v43];
      }
      else
      {
        uint64_t v34 = +[NSString stringWithFormat:@"<%p> (empty)", v32];
      }
    }
    else
    {
      uint64_t v34 = @"<nil>";
    }

    *(_DWORD *)long long buf = 138543874;
    uint64_t v55 = v28;
    __int16 v56 = 2114;
    double v57 = (const char *)v30;
    __int16 v58 = 2114;
    *(void *)double v59 = v34;
    long long v44 = "[%{public}@] Setting chrome inactive: %{public}@ (reasons: %{public}@)";
    goto LABEL_53;
  }
  if (!v21) {
    goto LABEL_54;
  }
  __int16 v22 = v4;
  double v23 = (objc_class *)objc_opt_class();
  __int16 v24 = NSStringFromClass(v23);
  if (objc_opt_respondsToSelector())
  {
    double v25 = [v22 performSelector:"accessibilityIdentifier"];
    long long v26 = v25;
    if (v25 && ![v25 isEqualToString:v24])
    {
      long long v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

      goto LABEL_30;
    }
  }
  long long v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_30:

  long long v28 = v27;
  long long v29 = @"NO";
  if (v3) {
    long long v29 = @"YES";
  }
  uint64_t v30 = v29;
  id v31 = [v22[37] allTokenReasons];
  uint64_t v32 = v31;
  if (v31)
  {
    if ([v31 count])
    {
      double v33 = [v32 componentsJoinedByString:@", "];
      uint64_t v34 = +[NSString stringWithFormat:@"<%p> [%@]", v32, v33];
    }
    else
    {
      uint64_t v34 = +[NSString stringWithFormat:@"<%p> (empty)", v32];
    }
  }
  else
  {
    uint64_t v34 = @"<nil>";
  }

  *(_DWORD *)long long buf = 138543874;
  uint64_t v55 = v28;
  __int16 v56 = 2114;
  double v57 = (const char *)v30;
  __int16 v58 = 2114;
  *(void *)double v59 = v34;
  long long v44 = "[%{public}@] Reapplying chrome inactive: %{public}@ (reasons: %{public}@)";
LABEL_53:
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v44, buf, 0x20u);

LABEL_54:
  if (v4->_inactive)
  {
    if (![(MapsTokenStorage *)v4->_deactivationTokens count])
    {
      id v48 = sub_1005762E4();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        id v49 = +[NSString stringWithFormat:@"_setInactive:YES was called without having any deactivation tokens! You must deactivate the chrome using tokens."];
        *(_DWORD *)long long buf = 136316162;
        uint64_t v55 = "-[ChromeViewController _setInactive:]";
        __int16 v56 = 2080;
        double v57 = "ChromeViewController.m";
        __int16 v58 = 1024;
        *(_DWORD *)double v59 = 1889;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = "_deactivationTokens.count > 0";
        *(_WORD *)&v59[14] = 2112;
        *(void *)&v59[16] = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        id v50 = sub_1005762E4();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v51 = +[NSThread callStackSymbols];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v55 = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    long long v45 = [(ChromeViewController *)v4 createMapReplacementView];
    [(ChromeViewController *)v4 _installMapReplacementView:v45];

    uint64_t v46 = [(ChromeViewController *)v4 mapView];
    [v46 _setInactive:1];

    if ([(ChromeViewController *)v4 removesMapViewWhenInactive]) {
      [(ChromeViewController *)v4 removeMapViewFromViewHierarchy];
    }
  }
  else
  {
    long long v47 = [(ChromeViewController *)v4 mapView];
    [v47 _setInactive:0];

    [(ChromeViewController *)v4 restoreMapInViewHierarchy];
  }
LABEL_20:
  if (inactive != v3) {
    [(ChromeViewController *)v4 didBecomeInactive:v3];
  }
}

- (id)deactivationReasons
{
  return [(MapsTokenStorage *)self->_deactivationTokens allTokenReasons];
}

- (void)deactivationReasonsDidChange
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"ChromeViewControllerDidChangeDeactivationReasonsNotification" object:self];
}

- (void)removeMapViewFromViewHierarchy
{
  id v2 = [(ChromeViewController *)self mapView];
  [v2 removeFromSuperview];
}

- (BOOL)removesMapViewWhenInactive
{
  return 1;
}

- (id)createMapReplacementView
{
  id v3 = objc_alloc((Class)UIView);
  id v4 = [(ChromeViewController *)self view];
  [v4 bounds];
  id v5 = [v3 initWithFrame:];

  CFStringRef v6 = [(ChromeViewController *)self mapReplacementColor];
  [v5 setBackgroundColor:v6];

  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = +[NSString stringWithFormat:@"%@.mapReplacementView", v8];
  [v5 setAccessibilityIdentifier:v9];

  return v5;
}

- (id)mapReplacementColor
{
  id v2 = [(ChromeViewController *)self traitCollection];
  id v3 = +[UIColor _mapkit_colorNamed:@"CartographyBackgroundColor" compatibleWithTraitCollection:v2];

  return v3;
}

- (UIEdgeInsets)mapAttributionInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)restoreMapInViewHierarchy
{
  id v3 = sub_1000C49B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    CFStringRef v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    mapView = v4->_mapView;
    mapReplacementView = v4->_mapReplacementView;
    *(_DWORD *)long long buf = 138543874;
    __int16 v13 = v9;
    __int16 v14 = 2048;
    BOOL v15 = mapView;
    __int16 v16 = 2048;
    id v17 = mapReplacementView;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] restoreMapInViewHierarchy mapView: %p (current _mapReplacementView: %p)", buf, 0x20u);
  }
  if (self->_mapView)
  {
    if ([(ChromeViewController *)self isViewLoaded])
    {
      [(ChromeViewController *)self installMapView:self->_mapView];
      [(ChromeViewController *)self _removeMapReplacementViewIfNeeded];
      [(ChromeViewController *)self setNeedsUpdateComponent:@"mapInsets" animated:0];
      [(ChromeViewController *)self setNeedsUpdateComponent:@"labelInsetsAndWidths" animated:0];
      [(ChromeViewController *)self setNeedsUpdateComponent:@"personalizedItemSources" animated:0];
      [(ChromeViewController *)self updateComponentsIfNeeded];
    }
  }
}

- (void)evictMapView
{
  id v3 = sub_1000C49B4();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  id v4 = self;
  if (!v4)
  {
    id v9 = @"<nil>";
    goto LABEL_10;
  }
  id v5 = (objc_class *)objc_opt_class();
  CFStringRef v6 = NSStringFromClass(v5);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
    id v8 = v7;
    if (v7 && ![v7 isEqualToString:v6])
    {
      id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

      goto LABEL_8;
    }
  }
  id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
  mapView = v4->_mapView;
  mapReplacementView = v4->_mapReplacementView;
  *(_DWORD *)long long buf = 138543874;
  BOOL v15 = v9;
  __int16 v16 = 2048;
  id v17 = mapView;
  __int16 v18 = 2048;
  id v19 = mapReplacementView;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] evictMapView mapView: %p (current _mapReplacementView: %p)", buf, 0x20u);

LABEL_11:
  unsigned int v12 = self->_mapView;
  if (v12)
  {
    __int16 v13 = v12;
    [(ChromeViewController *)self prepareToRemoveMapView:v13];
    [(MKMapView *)v13 removeFromSuperview];
  }
}

- (void)prepareToRemoveMapView:(id)a3
{
  customPOIsController = self->_customPOIsController;
  self->_customPOIsController = 0;

  mapCameraController = self->_mapCameraController;
  self->_mapCameraController = 0;

  routeAnnotationsController = self->_routeAnnotationsController;
  self->_routeAnnotationsController = 0;
}

- (UIView)currentMapReplacementView
{
  return self->_mapReplacementView;
}

- (void)_installMapReplacementView:(id)a3
{
  id v5 = a3;
  [(ChromeViewController *)self _removeMapReplacementViewIfNeeded];
  CFStringRef v6 = sub_1000C49B4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = self;
    if (!v7)
    {
      unsigned int v12 = @"<nil>";
      goto LABEL_10;
    }
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(ChromeViewController *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        unsigned int v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    unsigned int v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
    mapView = v7->_mapView;
    *(_DWORD *)long long buf = 138543874;
    BOOL v15 = v12;
    __int16 v16 = 2048;
    id v17 = v5;
    __int16 v18 = 2048;
    id v19 = mapView;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] _installMapReplacementView %p (current _mapView: %p)", buf, 0x20u);
  }
  objc_storeStrong((id *)&self->_mapReplacementView, a3);
  if (v5) {
    [(ChromeViewController *)self installMapReplacementView:v5];
  }
}

- (void)installMapReplacementView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ChromeViewController *)self isViewLoaded];
  if (v4 && v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100BEF688;
    v6[3] = &unk_1012E5D58;
    id v7 = v4;
    id v8 = self;
    +[UIView performWithoutAnimation:v6];
  }
}

- (void)_removeMapReplacementViewIfNeeded
{
  if (self->_mapReplacementView)
  {
    id v3 = sub_1000C49B4();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      [(ChromeViewController *)self removeMapReplacementView:self->_mapReplacementView];
      mapReplacementView = self->_mapReplacementView;
      self->_mapReplacementView = 0;

      return;
    }
    id v4 = self;
    unsigned int v5 = (objc_class *)objc_opt_class();
    CFStringRef v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(ChromeViewController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    id v10 = self->_mapReplacementView;
    mapView = v4->_mapView;
    *(_DWORD *)long long buf = 138543874;
    __int16 v14 = v9;
    __int16 v15 = 2048;
    __int16 v16 = v10;
    __int16 v17 = 2048;
    __int16 v18 = mapView;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] _removeMapReplacementViewIfNeeded %p (current _mapView: %p)", buf, 0x20u);

    goto LABEL_9;
  }
}

- (void)removeMapReplacementView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000C49B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(ChromeViewController *)v6 performSelector:"accessibilityIdentifier"];
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
    *(_DWORD *)long long buf = 138543618;
    __int16 v13 = v11;
    __int16 v14 = 2048;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] removeMapReplacementView %p", buf, 0x16u);
  }
  [v4 removeFromSuperview];
}

+ (Class)userLocationViewClass
{
  return (Class)objc_opt_class();
}

- (CGRect)unobscuredMapContentBoundsInContainingView
{
  id v2 = [(ChromeViewController *)self mapInsetsLayoutGuide];
  [v2 layoutFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setNeedsUpdateFullscreenViewController
{
  id v4 = +[GroupAnimation animation];
  double v3 = [(ChromeViewController *)self topContext];
  [(ChromeViewController *)self _updateFullscreenViewControllerForContext:v3 previousIsLeaving:0 withAnimation:v4];

  [v4 runWithDefaultOptions];
}

- (id)defaultFullscreenViewControllerDismissalTransition
{
  id v2 = objc_alloc_init(ChromeMapToMapTransition);

  return v2;
}

- (void)setSuppressed:(BOOL)a3
{
  if (self->_suppressed != a3) {
    -[ChromeViewController _setSuppressed:](self, "_setSuppressed:");
  }
}

- (void)_setSuppressed:(BOOL)a3
{
  BOOL v3 = a3;
  self->_suppressed = a3;
  double v5 = sub_1000C49B4();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v6)
    {
LABEL_9:

      [(ChromeViewController *)self _suppress];
      return;
    }
    double v7 = self;
    double v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      double v10 = [(ChromeViewController *)v7 performSelector:"accessibilityIdentifier"];
      double v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        double v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    double v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    int v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] will suppress", buf, 0xCu);

    goto LABEL_9;
  }
  if (v6)
  {
    double v13 = self;
    double v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = [(ChromeViewController *)v13 performSelector:"accessibilityIdentifier"];
      __int16 v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_16;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_16:

    *(_DWORD *)long long buf = 138543362;
    int v20 = v18;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] will unsuppress", buf, 0xCu);
  }
  [(ChromeViewController *)self _unsuppress];
}

- (void)_suppress
{
  p_suppressionAnimation = &self->_suppressionAnimation;
  if (!self->_suppressionAnimation)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:NSUserDefaultsDidChangeNotification object:0];
    double v11 = +[GroupAnimation animationForAnimatedFlag:0];
    double v12 = [(ChromeViewController *)self topContext];
    if (objc_opt_respondsToSelector()) {
      [v12 resignTopContextInChromeViewController:self withAnimation:v11];
    }
    objc_initWeak(&location, v11);
    int v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    __int16 v22 = sub_100BF0270;
    double v23 = &unk_1012E5D30;
    objc_copyWeak(&v25, &location);
    __int16 v24 = self;
    [v11 addAnimations:0 completion:&v20];
    objc_storeStrong((id *)p_suppressionAnimation, v11);
    double v13 = sub_1000C49B4();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    double v14 = self;
    id v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      __int16 v17 = [(ChromeViewController *)v14 performSelector:"accessibilityIdentifier"];
      __int16 v18 = v17;
      if (v17 && ([v17 isEqualToString:v16] & 1) == 0)
      {
        id v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18, v20, v21, v22, v23];

        goto LABEL_17;
      }
    }
    id v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

    *(_DWORD *)long long buf = 138543618;
    long long v28 = v19;
    __int16 v29 = 2048;
    uint64_t v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing suppress animation: %p", buf, 0x16u);

LABEL_18:
    [v11 runWithCurrentOptions];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

    goto LABEL_19;
  }
  id v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = self;
    BOOL v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      double v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        double v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    double v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    long long v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] already in the middle of suppress/unsuppress animation, ignoring _suppress and will check after animation", buf, 0xCu);
  }
LABEL_19:
}

- (void)_unsuppress
{
  p_suppressionAnimation = &self->_suppressionAnimation;
  if (!self->_suppressionAnimation)
  {
    id v4 = +[GroupAnimation animationForAnimatedFlag:0];
    objc_initWeak(&location, v4);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100BF0BB8;
    v21[3] = &unk_1012E5D08;
    v21[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100BF0D28;
    v19[3] = &unk_1012E5D30;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    [v4 addPreparation:v21 animations:0 completion:v19];
    double v11 = [(ChromeViewController *)self topContext];
    if (objc_opt_respondsToSelector()) {
      [v11 becomeTopContextInChromeViewController:self withAnimation:v4];
    }
    objc_storeStrong((id *)p_suppressionAnimation, v4);
    double v12 = sub_1000C49B4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    double v13 = self;
    double v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = [(ChromeViewController *)v13 performSelector:"accessibilityIdentifier"];
      __int16 v17 = v16;
      if (v16 && ([v16 isEqualToString:v15] & 1) == 0)
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_17;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_17:

    *(_DWORD *)long long buf = 138543618;
    __int16 v24 = v18;
    __int16 v25 = 2048;
    long long v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing unsuppress animation: %p", buf, 0x16u);

LABEL_18:
    [v4 runWithCurrentOptions];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  id v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = self;
    BOOL v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      double v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        double v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    double v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)long long buf = 138543362;
    __int16 v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] already in the middle of suppress/unsuppress animation, ignoring _unsuppress and will check after animation", buf, 0xCu);
  }
LABEL_19:
}

- (BOOL)isDisplayingNavigation
{
  return 0;
}

- (GEOMapServiceTraits)navigationAwareTraits
{
  BOOL v3 = [(ChromeViewController *)self currentTraits];
  if ([(ChromeViewController *)self isDisplayingNavigation])
  {
    [v3 setNavigating:1];
    id v4 = +[MNNavigationService sharedService];
    if ([v4 isInNavigatingState]) {
      id v5 = [v4 navigationTransportType];
    }
    else {
      id v5 = [v4 desiredTransportType];
    }
    [v3 setNavigationTransportType:v5];
  }

  return (GEOMapServiceTraits *)v3;
}

- (void)_setupNavigationDisplayForContext:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ChromeViewController *)self loadMapViewIfNeeded];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100BF1258;
  v10[3] = &unk_1012E66E0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 addPreparation:v10];
}

- (GEOMapServiceTraits)currentTraits
{
  BOOL v3 = +[MKMapService sharedService];
  id v4 = [v3 defaultTraits];

  uint64_t v5 = [(ChromeViewController *)self mapView];
  if (v5)
  {
    id v6 = (void *)v5;
    unsigned int v7 = +[NSThread isMainThread];

    if (v7) {
      [(ChromeViewController *)self _fillNewTraitsWithMapViewRelatedData:v4];
    }
  }

  return (GEOMapServiceTraits *)v4;
}

- (void)_fillNewTraitsWithMapViewRelatedData:(id)a3
{
  id v17 = a3;
  id v4 = [(ChromeViewController *)self mapView];

  if (v4)
  {
    uint64_t v5 = [(ChromeViewController *)self mapView];
    id v6 = [v5 mapType];
    uint64_t v7 = 1;
    switch((unint64_t)v6)
    {
      case 0uLL:
        goto LABEL_8;
      case 1uLL:
      case 3uLL:
        uint64_t v7 = 2;
        goto LABEL_8;
      case 2uLL:
      case 4uLL:
        uint64_t v7 = 3;
        goto LABEL_8;
      default:
        if (v6 == (id)102) {
          goto LABEL_8;
        }
        if (v6 == (id)104)
        {
          uint64_t v7 = 4;
LABEL_8:

          [v17 setMode:v7];
        }
        else
        {
        }
        id v8 = [(ChromeViewController *)self mapView];
        [v8 visibleMapRect];
        id v13 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v9, v10, v11, v12];
        [v17 setMapRegion:v13];

        double v14 = [(ChromeViewController *)self mapView];
        [v14 _zoomLevel];
        double v16 = v15;

        if (v16 > 0.0) {
          [v17 setMapZoomLevel:v16];
        }
        break;
    }
  }
}

- (BOOL)_shouldSaveLastViewportChangeDateInDefaults
{
  id v2 = [(ChromeViewController *)self searchContextDefaultsKeysPrefix];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  return 0;
}

- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3
{
  return 1;
}

- (BOOL)mapView:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v5 = a4;
  id v6 = [(ChromeViewController *)self mapSelectionManager];
  unsigned __int8 v7 = [v6 mapShouldSelectLabelMarker:v5];

  return v7;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v5 = a4;
  id v6 = [(ChromeViewController *)self mapSelectionManager];
  [v6 mapDidSelectLabelMarker:v5];
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v4 = [(ChromeViewController *)self mapSelectionManager];
  [v4 mapDidSelectLabelMarker:0];
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v5 = a4;
  id v6 = [(ChromeViewController *)self mapSelectionManager];
  [v6 mapDidSelectAnnotationView:v5];
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v4 = [(ChromeViewController *)self mapSelectionManager];
  [v4 mapDidSelectAnnotationView:0];
}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  return 1;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectLabelMarker:(id)a3
{
  return 0;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectAnnotationView:(id)a3
{
  return 0;
}

- (BOOL)chromeDidClearMapSelection
{
  return 0;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  var1 = a3.var1;
  unsigned int var0 = a3.var0;
  if (a3.var0 == [(ChromeViewController *)self thermalRateLimitsConfigKey]
    && var1 == v6)
  {
    unsigned __int8 v7 = sub_1000C49B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = self;
      if (!v8)
      {
        id v13 = @"<nil>";
        goto LABEL_32;
      }
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      if (objc_opt_respondsToSelector())
      {
        double v11 = [(ChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
        double v12 = v11;
        if (v11 && ![v11 isEqualToString:v10])
        {
          id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

          goto LABEL_10;
        }
      }
      id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_10:

LABEL_32:
      *(_DWORD *)long long buf = 138543362;
      long long v28 = v13;
      long long v26 = "[%{public}@] Thermal rate limit dictionary config updated";
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
    }
LABEL_39:

    [(ChromeViewController *)self updateMapViewFrameRate];
    return;
  }
  if (var0 == [(ChromeViewController *)self batteryLevelRateLimitEnabledConfigKey]&& var1 == v14)
  {
    unsigned __int8 v7 = sub_1000C49B4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_39;
    }
    double v15 = self;
    if (!v15)
    {
      id v13 = @"<nil>";
      goto LABEL_34;
    }
    double v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      __int16 v18 = [(ChromeViewController *)v15 performSelector:"accessibilityIdentifier"];
      id v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_20;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_20:

LABEL_34:
    *(_DWORD *)long long buf = 138543362;
    long long v28 = v13;
    long long v26 = "[%{public}@] Battery level rate limit enabled config updated";
    goto LABEL_38;
  }
  if (var0 == [(ChromeViewController *)self lowPowerModeRateLimitEnabledConfigKey]&& var1 == v20)
  {
    unsigned __int8 v7 = sub_1000C49B4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_39;
    }
    uint64_t v21 = self;
    if (!v21)
    {
      id v13 = @"<nil>";
      goto LABEL_37;
    }
    __int16 v22 = (objc_class *)objc_opt_class();
    double v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      __int16 v24 = [(ChromeViewController *)v21 performSelector:"accessibilityIdentifier"];
      __int16 v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_30;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_30:

LABEL_37:
    *(_DWORD *)long long buf = 138543362;
    long long v28 = v13;
    long long v26 = "[%{public}@] Low power mode rate limit enabled config updated";
    goto LABEL_38;
  }
}

- (void)batteryMonitorTokenWitnessedChangeInBatteryLevel:(id)a3
{
  id v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self;
    if (!v5)
    {
      double v10 = @"<nil>";
      goto LABEL_10;
    }
    id v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        double v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    double v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

LABEL_10:
    *(_DWORD *)long long buf = 138543362;
    double v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Battery level changed", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BF272C;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  id v4 = sub_1000C49B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self;
    if (!v5)
    {
      double v10 = @"<nil>";
      goto LABEL_10;
    }
    id v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(ChromeViewController *)v5 performSelector:"accessibilityIdentifier"];
      double v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        double v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    double v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

LABEL_10:
    *(_DWORD *)long long buf = 138543362;
    double v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Thermal pressure level changed", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BF2968;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey
{
  uint64_t v2 = GEOConfigKey_InvalidDictionary[0];
  BOOL v3 = (void *)GEOConfigKey_InvalidDictionary[1];
  result.var0.var1 = v3;
  *(void *)&result.var0.unsigned int var0 = v2;
  return result;
}

- (NSDictionary)thermalRateLimits
{
  unsigned int v3 = [(ChromeViewController *)self thermalRateLimitsConfigKey];
  id v4 = 0;
  if (v3 && v2)
  {
    id v4 = GEOConfigGetDictionary();
  }

  return (NSDictionary *)v4;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey
{
  uint64_t v2 = GEOConfigKey_InvalidBOOL[0];
  unsigned int v3 = (void *)GEOConfigKey_InvalidBOOL[1];
  result.var0.var1 = v3;
  *(void *)&result.var0.unsigned int var0 = v2;
  return result;
}

- (BOOL)isBatteryLevelFrameRateLimitingEnabled
{
  if (![(ChromeViewController *)self batteryLevelRateLimitEnabledConfigKey]|| !v2)
  {
    return 0;
  }

  return GEOConfigGetBOOL();
}

- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey
{
  uint64_t v2 = GEOConfigKey_InvalidBOOL[0];
  unsigned int v3 = (void *)GEOConfigKey_InvalidBOOL[1];
  result.var0.var1 = v3;
  *(void *)&result.var0.unsigned int var0 = v2;
  return result;
}

- (BOOL)isLowPowerModeFrameRateLimitingEnabled
{
  if (![(ChromeViewController *)self lowPowerModeRateLimitEnabledConfigKey]|| !v2)
  {
    return 0;
  }

  return GEOConfigGetBOOL();
}

- (BOOL)isEligibleForMapViewFrameRateLimiting
{
  return 0;
}

- (void)_removeFrameRateLimitForReason:(int64_t)a3
{
  id v5 = sub_1000C49B4();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_15;
  }
  id v6 = self;
  if (!v6)
  {
    double v11 = @"<nil>";
    goto LABEL_10;
  }
  unsigned __int8 v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    double v9 = [(ChromeViewController *)v6 performSelector:"accessibilityIdentifier"];
    double v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      double v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  double v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  id v12 = [(ChromeViewController *)v6 view];
  uint64_t v13 = [v12 sceneIdentifierForLogging];
  double v14 = (void *)v13;
  CFStringRef v15 = @"ThermalPressure";
  if (a3 == 1) {
    CFStringRef v15 = @"BatteryLevel";
  }
  *(_DWORD *)long long buf = 138543874;
  id v19 = v11;
  if (a3 == 2) {
    CFStringRef v15 = @"LowPowerMode";
  }
  __int16 v20 = 2112;
  uint64_t v21 = v13;
  __int16 v22 = 2112;
  CFStringRef v23 = v15;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Removing map view frame rate limit for reason: %@", buf, 0x20u);

LABEL_15:
  double v16 = [(ChromeViewController *)self currentMapViewRateLimits];
  id v17 = +[NSNumber numberWithInteger:a3];
  [v16 removeObjectForKey:v17];
}

- (void)_limitFrameRate:(int64_t)a3 forReason:(int64_t)a4
{
  unsigned __int8 v7 = sub_1000C49B4();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_15;
  }
  id v8 = self;
  if (!v8)
  {
    uint64_t v13 = @"<nil>";
    goto LABEL_10;
  }
  double v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  if (objc_opt_respondsToSelector())
  {
    double v11 = [(ChromeViewController *)v8 performSelector:"accessibilityIdentifier"];
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
  double v14 = [(ChromeViewController *)v8 view];
  uint64_t v15 = [v14 sceneIdentifierForLogging];
  double v16 = (void *)v15;
  CFStringRef v17 = @"ThermalPressure";
  if (a4 == 1) {
    CFStringRef v17 = @"BatteryLevel";
  }
  *(_DWORD *)long long buf = 138544130;
  __int16 v22 = v13;
  __int16 v25 = 2048;
  __int16 v23 = 2112;
  uint64_t v24 = v15;
  int64_t v26 = a3;
  if (a4 == 2) {
    CFStringRef v17 = @"LowPowerMode";
  }
  __int16 v27 = 2112;
  CFStringRef v28 = v17;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Updating map view frame rate to: %ld for reason: %@", buf, 0x2Au);

LABEL_15:
  __int16 v18 = [(ChromeViewController *)self currentMapViewRateLimits];
  id v19 = +[NSNumber numberWithInteger:a3];
  __int16 v20 = +[NSNumber numberWithInteger:a4];
  [v18 setObject:v19 forKey:v20];
}

- (void)powerStateDidChangeNotification:(id)a3
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BF2FBC;
  block[3] = &unk_1012E7ED0;
  void block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (unint64_t)desiredRadarScreenshotTypes
{
  return 7;
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(void))a4;
  if (!v7)
  {
    BOOL v52 = sub_1005762E4();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315906;
      double v59 = "-[ChromeViewController generateAttachmentsForRadarDraft:withCompletion:]";
      __int16 v60 = 2080;
      uint64_t v61 = "ChromeViewController.m";
      __int16 v62 = 1024;
      int v63 = 3100;
      __int16 v64 = 2080;
      uint64_t v65 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v53 = sub_1005762E4();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v54 = +[NSThread callStackSymbols];
        *(_DWORD *)long long buf = 138412290;
        double v59 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  double v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      long long v47 = sub_1005762E4();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v48 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        id v49 = dispatch_queue_get_label(0);
        *(_DWORD *)long long buf = 136316418;
        double v59 = "-[ChromeViewController generateAttachmentsForRadarDraft:withCompletion:]";
        __int16 v60 = 2080;
        uint64_t v61 = "ChromeViewController.m";
        __int16 v62 = 1024;
        int v63 = 3101;
        __int16 v64 = 2080;
        uint64_t v65 = "dispatch_get_main_queue()";
        __int16 v66 = 2080;
        v67 = v48;
        __int16 v68 = 2080;
        v69 = v49;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v50 = sub_1005762E4();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v51 = +[NSThread callStackSymbols];
          *(_DWORD *)long long buf = 138412290;
          double v59 = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  double v11 = [(ChromeViewController *)self viewIfLoaded];

  if (!v11)
  {
    __int16 v22 = sub_1000C49B4();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_55;
    }
    __int16 v29 = self;
    if (!v29)
    {
      CFStringRef v28 = @"<nil>";
      goto LABEL_46;
    }
    uint64_t v30 = (objc_class *)objc_opt_class();
    id v31 = NSStringFromClass(v30);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v32 = [(ChromeViewController *)v29 performSelector:"accessibilityIdentifier"];
      double v33 = v32;
      if (v32 && ![v32 isEqualToString:v31])
      {
        CFStringRef v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v31, v29, v33];

        goto LABEL_27;
      }
    }
    CFStringRef v28 = +[NSString stringWithFormat:@"%@<%p>", v31, v29];
LABEL_27:

LABEL_46:
    *(_DWORD *)long long buf = 138543362;
    double v59 = (const char *)v28;
    uint64_t v46 = "[%{public}@] View is not loaded yet; not generating radar attachments";
LABEL_54:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, v46, buf, 0xCu);

    goto LABEL_55;
  }
  id v12 = [(ChromeViewController *)self view];
  uint64_t v13 = [v12 window];
  double v14 = [v13 windowScene];

  if (!v14)
  {
    __int16 v22 = sub_1000C49B4();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_55;
    }
    uint64_t v34 = self;
    if (!v34)
    {
      CFStringRef v28 = @"<nil>";
      goto LABEL_51;
    }
    int v35 = (objc_class *)objc_opt_class();
    long long v36 = NSStringFromClass(v35);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v37 = [(ChromeViewController *)v34 performSelector:"accessibilityIdentifier"];
      __int16 v38 = v37;
      if (v37 && ![v37 isEqualToString:v36])
      {
        CFStringRef v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v36, v34, v38];

        goto LABEL_35;
      }
    }
    CFStringRef v28 = +[NSString stringWithFormat:@"%@<%p>", v36, v34];
LABEL_35:

LABEL_51:
    *(_DWORD *)long long buf = 138543362;
    double v59 = (const char *)v28;
    uint64_t v46 = "[%{public}@] No window scene; not generating radar attachments";
    goto LABEL_54;
  }
  uint64_t v15 = [(ChromeViewController *)self view];
  double v16 = [v15 window];
  CFStringRef v17 = [v16 windowScene];
  if ([v17 activationState])
  {
    __int16 v18 = [(ChromeViewController *)self view];
    id v19 = [v18 window];
    __int16 v20 = [v19 windowScene];
    id v21 = [v20 activationState];

    if (v21 != (id)1)
    {
      __int16 v22 = sub_1000C49B4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        __int16 v23 = self;
        if (!v23)
        {
          CFStringRef v28 = @"<nil>";
          goto LABEL_53;
        }
        uint64_t v24 = (objc_class *)objc_opt_class();
        __int16 v25 = NSStringFromClass(v24);
        if (objc_opt_respondsToSelector())
        {
          int64_t v26 = [(ChromeViewController *)v23 performSelector:"accessibilityIdentifier"];
          __int16 v27 = v26;
          if (v26 && ![v26 isEqualToString:v25])
          {
            CFStringRef v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

            goto LABEL_19;
          }
        }
        CFStringRef v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_19:

LABEL_53:
        *(_DWORD *)long long buf = 138543362;
        double v59 = (const char *)v28;
        uint64_t v46 = "[%{public}@] Activation state is not foreground; not generating radar attachments";
        goto LABEL_54;
      }
LABEL_55:

      v7[2](v7);
      goto LABEL_56;
    }
  }
  else
  {
  }
  id v39 = sub_1000C49B4();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    double v40 = self;
    if (!v40)
    {
      long long v45 = @"<nil>";
      goto LABEL_48;
    }
    id v41 = (objc_class *)objc_opt_class();
    id v42 = NSStringFromClass(v41);
    if (objc_opt_respondsToSelector())
    {
      char v43 = [(ChromeViewController *)v40 performSelector:"accessibilityIdentifier"];
      long long v44 = v43;
      if (v43 && ![v43 isEqualToString:v42])
      {
        long long v45 = +[NSString stringWithFormat:@"%@<%p, %@>", v42, v40, v44];

        goto LABEL_44;
      }
    }
    long long v45 = +[NSString stringWithFormat:@"%@<%p>", v42, v40];
LABEL_44:

LABEL_48:
    *(_DWORD *)long long buf = 138543362;
    double v59 = (const char *)v45;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "[%{public}@] Start generating radar attachments", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BF3A28;
  block[3] = &unk_1012E80F0;
  void block[4] = self;
  id v56 = v6;
  double v57 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_56:
}

- (ChromeContextTransition)currentContextTransition
{
  return self->_currentContextTransition;
}

- (UIEdgeInsets)labelEdgeInsets
{
  double top = self->_labelEdgeInsets.top;
  double left = self->_labelEdgeInsets.left;
  double bottom = self->_labelEdgeInsets.bottom;
  double right = self->_labelEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)labelEdgeWidths
{
  double top = self->_labelEdgeWidths.top;
  double left = self->_labelEdgeWidths.left;
  double bottom = self->_labelEdgeWidths.bottom;
  double right = self->_labelEdgeWidths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)viewport
{
  return self->_viewport;
}

- (void)setNavigationDisplay:(id)a3
{
}

- (NSString)searchContextDefaultsKeysPrefix
{
  return self->_searchContextDefaultsKeysPrefix;
}

- (void)setCurrentMapViewRateLimits:(id)a3
{
}

- (BatteryMonitorToken)batteryMonitorToken
{
  return self->_batteryMonitorToken;
}

- (void)setBatteryMonitorToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryMonitorToken, 0);
  objc_storeStrong((id *)&self->_currentMapViewRateLimits, 0);
  objc_storeStrong((id *)&self->_searchContextDefaultsKeysPrefix, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_viewportLayoutGuide, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_mapInsetsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_currentContextTransition, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsController, 0);
  objc_storeStrong((id *)&self->_searchPinsManager, 0);
  objc_storeStrong((id *)&self->_personalizedItemManager, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_mapSelectionManager, 0);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_storeStrong((id *)&self->_customPOIsController, 0);
  objc_storeStrong((id *)&self->_hikingCoordinateChecks, 0);
  objc_storeStrong((id *)&self->_hikingMapTokens, 0);
  objc_storeStrong(&self->_contextNotShowingMapDeactivatingToken, 0);
  objc_storeStrong(&self->_forceDeactivationToken, 0);
  objc_storeStrong(&self->_debugForceDeactivationToken, 0);
  objc_storeStrong((id *)&self->_deactivationTokens, 0);
  objc_storeStrong(&self->_sceneForegroundingNotificationToken, 0);
  objc_storeStrong((id *)&self->_mapViewEnteredForegroundDate, 0);
  objc_storeStrong((id *)&self->_lastViewportChangeDate, 0);
  objc_storeStrong((id *)&self->_watermarkView, 0);
  objc_storeStrong((id *)&self->_debugLayoutGuidesView, 0);
  objc_storeStrong((id *)&self->_mapSelectionHandler, 0);
  objc_storeStrong((id *)&self->_mapInsetPropagationSuspensionTokens, 0);
  objc_storeStrong((id *)&self->_mapReplacementView, 0);
  objc_storeStrong((id *)&self->_mapInsetsConstraintsByContext, 0);
  objc_storeStrong((id *)&self->_safeAreaMapEdgeInsetsConstraints, 0);
  objc_storeStrong((id *)&self->_currentContextMapInsetsConstraints, 0);
  objc_storeStrong((id *)&self->_fullscreenViewController, 0);
  objc_storeStrong((id *)&self->_componentsBeingUpdated, 0);
  objc_storeStrong((id *)&self->_componentsNeedingUpdate, 0);
  objc_storeStrong((id *)&self->_scheduledComponentUpdateTimer, 0);
  objc_storeStrong((id *)&self->_suppressionAnimation, 0);
  objc_storeStrong((id *)&self->_stackObservers, 0);
  objc_storeStrong((id *)&self->_deferredActionsByContext, 0);
  objc_storeStrong((id *)&self->_contextCoordinatedScheduler, 0);
  objc_storeStrong((id *)&self->_contextsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_thermalPressureController, 0);
  objc_storeStrong((id *)&self->_navigationDisplayDelegateProxy, 0);
  objc_storeStrong((id *)&self->_mapViewDelegateProxy, 0);

  objc_storeStrong((id *)&self->_userLocationView, 0);
}

@end