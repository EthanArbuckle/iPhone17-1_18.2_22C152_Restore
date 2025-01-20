@interface IOSTransitNavigationContext
- (BOOL)isCameraPanningOrZoomed;
- (BOOL)isDisplayingManuallySelectedStep;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (BOOL)pptTestCanUpdateTrayLayout;
- (BOOL)pptTestHasNextStep;
- (BOOL)pptTestIsTrayType:(int64_t)a3;
- (BOOL)pptTestMoveToBoardStep;
- (BOOL)pptTestSupportStepping;
- (BOOL)requiresStaleMapEffect;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)wantsMapSelectionControl;
- (GEOMapServiceTraits)newTraits;
- (IOSTransitNavigationContext)init;
- (UIScrollView)pptTestScrollView;
- (id)_placeCardViewController;
- (id)_recenterButton;
- (id)fetchCurrentRoute;
- (id)fetchLastLocation;
- (id)fullscreenViewController;
- (int64_t)displayedViewMode;
- (int64_t)pptTestCurrentStepIndex;
- (void)_backlightLuminanceDidChange;
- (void)_didLeaveDefaultZoomPan;
- (void)_didReturnToDefaultZoomPan;
- (void)_performWhenTrayPresented:(id)a3;
- (void)_presentIncidents:(id)a3;
- (void)_presentPlaceCardViewControllerForMapItem:(id)a3 modally:(BOOL)a4;
- (void)_recenterButtonTapped:(id)a3;
- (void)_updateArrivalEndTimerIfNeeded;
- (void)_updateRecenterButtonVisibility;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)chromeNavigationDisplay:(id)a3 userDidTapMap:(id)a4 atPoint:(CGPoint)a5;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)container:(id)a3 didPresentContainee:(id)a4 finished:(BOOL)a5;
- (void)didReselectDisplayedStep;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)directionsStepsListDidTapRAPButton:(id)a3;
- (void)directionsStepsListDidTapShareButton:(id)a3;
- (void)idleTimerDidTimeout:(id)a3;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraHasStartedPanning:(id)a3;
- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3;
- (void)placeCardViewController:(id)a3 openURL:(id)a4;
- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4;
- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4;
- (void)pptTestMoveToNextStep;
- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4;
- (void)presentAdvisory:(id)a3;
- (void)recenterOnActiveStep;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)showVLF;
- (void)startRequestingRealtimeUpdates;
- (void)stopRequestingRealtimeUpdates;
- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsForSegments:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateActiveGuidanceStep:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateDisplayedGuidanceStep:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 willExpandItem:(id)a4;
- (void)transitNavigationTrayDidTapClose:(id)a3;
- (void)willBeginDisplayingInSecureLockScreen;
- (void)willManuallyFrameStep;
@end

@implementation IOSTransitNavigationContext

- (IOSTransitNavigationContext)init
{
  v13.receiver = self;
  v13.super_class = (Class)IOSTransitNavigationContext;
  v2 = [(TransitNavigationContext *)&v13 init];
  if (v2)
  {
    v3 = objc_alloc_init(IOSTransitContainerViewController);
    containerViewController = v2->_containerViewController;
    v2->_containerViewController = v3;

    v5 = +[UIDevice currentDevice];
    if ([v5 userInterfaceIdiom] == (id)1)
    {
      [(ContainerViewController *)v2->_containerViewController setAllowOnlyStandardStyle:0];
    }
    else
    {
      v6 = +[UIDevice currentDevice];
      -[ContainerViewController setAllowOnlyStandardStyle:](v2->_containerViewController, "setAllowOnlyStandardStyle:", [v6 userInterfaceIdiom] != (id)5);
    }
    [(ContainerViewController *)v2->_containerViewController setChromeContext:v2];
    [(ContainerViewController *)v2->_containerViewController setContainerDelegate:v2];
    v7 = objc_alloc_init(TransitSteppingAnalyticsDelegate);
    analyticsDelegate = v2->_analyticsDelegate;
    v2->_analyticsDelegate = v7;

    v9 = [[NavigationDebugViewsController alloc] initWithDelegate:v2];
    debugViewsController = v2->_debugViewsController;
    v2->_debugViewsController = v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_backlightLuminanceDidChange" name:@"BacklightLuminanceDidChangeNotification" object:0];
  }
  return v2;
}

- (id)fullscreenViewController
{
  return self->_containerViewController;
}

- (BOOL)requiresStaleMapEffect
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)IOSTransitNavigationContext;
  id v6 = a4;
  [(TransitNavigationContext *)&v17 becomeTopContextInChromeViewController:a3 withAnimation:v6];
  id v7 = [v6 isAnimated];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1006D30E4;
  v16[3] = &unk_1012E5D08;
  v16[4] = self;
  [v6 addPreparation:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1006D3394;
  v14[3] = &unk_1012E6300;
  v14[4] = self;
  char v15 = (char)v7;
  [v6 addAnimations:v14];

  uint64_t v8 = [(IOSTransitNavigationContext *)self fetchCurrentRoute];
  v9 = (void *)v8;
  trayViewController = self->_trayViewController;
  if (trayViewController) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v8 == 0;
  }
  if (!v11)
  {
    v12 = [[TransitNavigationTrayViewController alloc] initWithRoute:v8 stepsListDelegate:self];
    objc_super v13 = self->_trayViewController;
    self->_trayViewController = v12;

    [(TransitNavigationTrayViewController *)self->_trayViewController setTrayDelegate:self];
    trayViewController = self->_trayViewController;
  }
  [(ContainerViewController *)self->_containerViewController presentController:trayViewController animated:v7 useDefaultContaineeLayout:1];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IOSTransitNavigationContext;
  id v6 = a4;
  [(TransitNavigationContext *)&v9 resignTopContextInChromeViewController:a3 withAnimation:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006D34B4;
  v7[3] = &unk_1012E6300;
  v7[4] = self;
  unsigned __int8 v8 = [v6 isAnimated];
  [v6 addPreparation:v7];
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (BOOL)shouldResetStateAfterResigning
{
  v3 = [(TransitNavigationContext *)self activeStep];

  if (!v3) {
    return 0;
  }
  v4 = [(TransitNavigationContext *)self route];
  v5 = [(TransitNavigationContext *)self activeStep];
  unsigned __int8 v6 = [v4 shouldReturnToRoutePickerWhenEndingDirectionsAtStepIndex:[v5 stepIndex]];

  return v6 ^ 1;
}

- (id)fetchCurrentRoute
{
  v2 = [(TransitNavigationContext *)self chromeViewController];
  v3 = [v2 _maps_platformController];
  v4 = [v3 currentSession];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 currentRouteCollection];

  unsigned __int8 v8 = [v7 currentRoute];

  return v8;
}

- (id)fetchLastLocation
{
  v2 = +[MNNavigationService sharedService];
  v3 = [v2 lastLocation];

  return v3;
}

- (BOOL)isDisplayingManuallySelectedStep
{
  v2 = +[MNNavigationService sharedService];
  if ([v2 displayedStepIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = +[MNNavigationService sharedService];
    id v5 = [v4 displayedStepIndex];
    id v6 = +[MNNavigationService sharedService];
    BOOL v3 = v5 != [v6 stepIndex];
  }
  return v3;
}

- (void)startRequestingRealtimeUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)IOSTransitNavigationContext;
  [(TransitNavigationContext *)&v3 startRequestingRealtimeUpdates];
  v2 = +[MNNavigationService sharedService];
  [v2 resumeRealtimeUpdates];
}

- (void)stopRequestingRealtimeUpdates
{
  objc_super v3 = +[MNNavigationService sharedService];
  [v3 pauseRealtimeUpdates];

  v4.receiver = self;
  v4.super_class = (Class)IOSTransitNavigationContext;
  [(TransitNavigationContext *)&v4 stopRequestingRealtimeUpdates];
}

- (void)recenterOnActiveStep
{
  if ([(IOSTransitNavigationContext *)self isDisplayingManuallySelectedStep])
  {
    objc_super v3 = sub_10057767C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Returning to auto-advance step index (recenter button)", buf, 2u);
    }

    objc_super v4 = +[MNNavigationService sharedService];
    [v4 setDisplayedStepIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    [(ContainerViewController *)self->_containerViewController setLayoutIfSupported:2 animated:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)IOSTransitNavigationContext;
  [(TransitNavigationContext *)&v5 recenterOnActiveStep];
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
}

- (BOOL)isCameraPanningOrZoomed
{
  return self->_cameraPanningOrZoomed;
}

- (void)_didLeaveDefaultZoomPan
{
  if (!self->_cameraPanningOrZoomed)
  {
    self->_cameraPanningOrZoomed = 1;
    [(IOSTransitNavigationContext *)self canRecenterDidChange];
    id v3 = [(ContaineeViewController *)self->_trayViewController cardPresentationController];
    [v3 wantsLayout:1];
  }
}

- (void)_didReturnToDefaultZoomPan
{
  if (self->_cameraPanningOrZoomed)
  {
    self->_cameraPanningOrZoomed = 0;
    [(IOSTransitNavigationContext *)self canRecenterDidChange];
  }
}

- (void)willManuallyFrameStep
{
  self->_cameraPanningOrZoomed = 0;
}

- (void)willBeginDisplayingInSecureLockScreen
{
}

- (void)transitNavigationTrayDidTapClose:(id)a3
{
  objc_super v4 = sub_10057767C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Tray did tap close", v11, 2u);
  }

  objc_super v5 = [(IOSTransitNavigationContext *)self iosBasedChromeViewController];
  id v6 = [v5 appCoordinator];
  id v7 = [v6 platformController];

  unsigned __int8 v8 = [v7 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v9 = v8;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  if ([(IOSTransitNavigationContext *)self shouldResetStateAfterResigning]) {
    [v7 clearIfCurrentSession:v10];
  }
  else {
    [v7 popIfCurrentSession:v10];
  }
}

- (void)directionsStepsListDidTapShareButton:(id)a3
{
  objc_super v4 = [(TransitNavigationContext *)self route];

  if (v4)
  {
    objc_super v5 = [(IOSTransitNavigationContext *)self iosBasedChromeViewController];
    id v9 = [v5 appCoordinator];

    id v6 = [(TransitNavigationContext *)self route];
    id v7 = +[ShareItem shareItemWithRoute:v6 includeRoutingApps:0];

    unsigned __int8 v8 = [(TransitNavigationTrayViewController *)self->_trayViewController view];
    [v9 shareItem:v7 sourceView:v8 completion:0];
  }
}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  objc_super v4 = [(TransitNavigationContext *)self route];
  unsigned int v5 = [v4 transportType] - 1;
  if (v5 > 5) {
    uint64_t v6 = 608;
  }
  else {
    uint64_t v6 = dword_100F70348[v5];
  }

  id v7 = +[MKMapService sharedService];
  unsigned __int8 v8 = [(TransitNavigationTrayViewController *)self->_trayViewController displayedItemIndexForAnalytics];
  [v7 captureUserAction:5013 onTarget:v6 eventValue:0 transitStep:v8];

  id v10 = [(TransitNavigationTrayViewController *)self->_trayViewController _maps_mapsSceneDelegate];
  id v9 = [v10 rapPresenter];
  [v9 presentReportAProblemForRouteFromEntryPoint:v6];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TransitNavigationContext *)self currentUITargetForAnalytics];
  id v7 = [(TransitNavigationTrayViewController *)self->_trayViewController displayedItemIndexForAnalytics];
  +[GEOAPPortal captureUserAction:9040 target:v6 value:0 transitStep:v7];

  id v9 = [v5 matchingRouteStep];

  unsigned __int8 v8 = [[TransitSchedulesViewController alloc] initWithTransitRouteStep:v9];
  [(ContaineeViewController *)v8 setContaineeDelegate:self];
  [(ContainerViewController *)self->_containerViewController presentController:v8];
}

- (void)didReselectDisplayedStep
{
  id v3 = sub_10057767C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    uint64_t v6 = &index;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Reselected displayed step index %lu, docking the tray", (uint8_t *)&v5, 0xCu);
  }

  objc_super v4 = [(ContaineeViewController *)self->_trayViewController cardPresentationController];
  [v4 wantsLayout:2];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 clusteredVehicleItem];
  id v9 = [v8 clusteredSegment];

  id v10 = [v9 selectedRideOptionIndex];
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1006D4164;
  v30[3] = &unk_1012F5450;
  v31[1] = v10;
  objc_copyWeak(v31, &location);
  BOOL v11 = +[UIAlertController clusteredVehiclesSelectionAlertControllerForClusteredSegment:v9 completion:v30];
  v12 = [(ContainerViewController *)self->_containerViewController currentViewController];
  objc_super v13 = [v12 view];
  v14 = [v11 popoverPresentationController];
  [v14 setSourceView:v13];

  char v15 = [v12 view];
  [v7 bounds];
  [v15 convertRect:v7 fromView:];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [v11 popoverPresentationController];
  [v24 setSourceRect:v17, v19, v21, v23];

  v25 = [v11 popoverPresentationController];
  [v25 setPermittedArrowDirections:3];

  [v12 presentViewController:v11 animated:1 completion:0];
  v26 = +[MKMapService sharedService];
  uint64_t v27 = [(TransitNavigationContext *)self currentUITargetForAnalytics];
  v28 = MapsAnalyticsEventValueForClusteredSegment(v9);
  v29 = [(TransitNavigationTrayViewController *)self->_trayViewController displayedItemIndexForAnalytics];
  [v26 captureUserAction:3037 onTarget:v27 eventValue:v28 transitStep:v29];

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateDisplayedGuidanceStep:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [(TransitNavigationContext *)self displayedStep];
  v13.receiver = self;
  v13.super_class = (Class)IOSTransitNavigationContext;
  [(TransitNavigationContext *)&v13 transitDirectionsStepsListDataSource:v7 didUpdateDisplayedGuidanceStep:v6];

  if (!v8 || (id v9 = [v8 stepIndex], v9 != objc_msgSend(v6, "stepIndex")))
  {
    [(TransitNavigationTrayViewController *)self->_trayViewController updateForCurrentDisplayedStep];
    [(TransitNavigationTrayViewController *)self->_trayViewController updateBacklightSceneEnvironment];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1006D4314;
    v10[3] = &unk_1012E5D58;
    id v11 = v8;
    v12 = self;
    [(IOSTransitNavigationContext *)self _performWhenTrayPresented:v10];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateActiveGuidanceStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IOSTransitNavigationContext;
  [(TransitNavigationContext *)&v15 transitDirectionsStepsListDataSource:v6 didUpdateActiveGuidanceStep:v7];
  [(IOSTransitNavigationContext *)self _updateArrivalEndTimerIfNeeded];
  uint64_t v8 = [(TransitNavigationContext *)self activeStep];
  if (v8
    && (id v9 = (void *)v8,
        [(TransitNavigationContext *)self activeStep],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 stepIndex],
        id v12 = [v7 stepIndex],
        v10,
        v9,
        v11 == v12))
  {
    [(TransitNavigationTrayViewController *)self->_trayViewController updateBacklightSceneEnvironment];
  }
  else
  {
    uint64_t v13 = [(TransitNavigationContext *)self currentUITargetForAnalytics];
    v14 = [v6 displayedItemIndexForAnalytics];
    +[GEOAPPortal captureUserAction:3066 target:v13 value:0 transitStep:v14];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 willExpandItem:(id)a4
{
  id v4 = [(ContaineeViewController *)self->_trayViewController cardPresentationController];
  [v4 wantsLayout:3];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsForSegments:(id)a4
{
  containerViewController = self->_containerViewController;
  id v5 = a4;
  id v20 = [(ContainerViewController *)containerViewController currentViewController];
  id v6 = +[UIAlertController _maps_alertControllerForTicketedSegments:v5];

  id v7 = [v20 view];
  uint64_t v8 = [v6 popoverPresentationController];
  [v8 setSourceView:v7];

  id v9 = [v20 view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [v6 popoverPresentationController];
  [v18 setSourceRect:v11, v13, v15, v17];

  double v19 = [v6 popoverPresentationController];
  [v19 setPermittedArrowDirections:12];

  [v20 presentViewController:v6 animated:1 completion:0];
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  uint64_t v5 = [(TransitNavigationContext *)self currentUITargetForAnalytics];
  id v6 = [(TransitNavigationTrayViewController *)self->_trayViewController displayedItemIndexForAnalytics];
  +[GEOAPPortal captureUserAction:4 target:v5 value:0 transitStep:v6];

  [(ContainerViewController *)self->_containerViewController popLastViewControllerAnimated:1];
  id v8 = [(TransitNavigationContext *)self chromeViewController];
  id v7 = [v8 mapSelectionManager];
  [v7 clearSelectionAnimated:1];
}

- (void)_performWhenTrayPresented:(id)a3
{
  if (a3 && self->_trayPresented)
  {
    id v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    id v5 = [a3 copy];
    id whenTrayPresentedBlock = self->_whenTrayPresentedBlock;
    self->_id whenTrayPresentedBlock = v5;
  }
}

- (void)container:(id)a3 didPresentContainee:(id)a4 finished:(BOOL)a5
{
  id v11 = a3;
  id v7 = (TransitNavigationTrayViewController *)a4;
  if (self->_trayViewController == v7)
  {
    if (!self->_trayPresented)
    {
      self->_trayPresented = 1;
      id whenTrayPresentedBlock = self->_whenTrayPresentedBlock;
      if (whenTrayPresentedBlock)
      {
        id v9 = (void (**)(void))objc_retainBlock(whenTrayPresentedBlock);
        id v10 = self->_whenTrayPresentedBlock;
        self->_id whenTrayPresentedBlock = 0;

        v9[2](v9);
      }
    }
  }
  else if (self->_trayPresented)
  {
    self->_trayPresented = 0;
  }
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  id v7 = [v13 annotation];
  [v6 deselectAnnotation:v7 animated:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 isVLFPuckVisible])
  {
    id v8 = [(IOSTransitNavigationContext *)self iosBasedChromeViewController];
    id v9 = [v8 appCoordinator];
    id v10 = [v9 platformController];
    id v11 = [v10 auxiliaryTasksManager];
    double v12 = [v11 auxilaryTaskForClass:objc_opt_class()];

    [v12 showVLFUI];
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return [a4 isTransitLine] ^ 1;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6 = a4;
  id v5 = [objc_alloc((Class)MKMapItem) _initWithLabelMarker:v6];
  [(IOSTransitNavigationContext *)self _presentPlaceCardViewControllerForMapItem:v5 modally:0];
  if ([v6 isTransit] && (objc_msgSend(v6, "isTransitLine") & 1) == 0) {
    [(TransitSteppingAnalyticsDelegate *)self->_analyticsDelegate recordTapOnTransitStationPOI];
  }
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v5 = [(ContainerViewController *)self->_containerViewController currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ContainerViewController *)self->_containerViewController popLastViewControllerAnimated:1];
  }
}

- (void)chromeNavigationDisplay:(id)a3 userDidTapMap:(id)a4 atPoint:(CGPoint)a5
{
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  id v5 = a3;
  if (self->_debugViewsController)
  {
    id v18 = v5;
    id v6 = +[NSUserDefaults standardUserDefaults];
    unsigned int v7 = [v6 BOOLForKey:@"PlaybackControls"];

    id v5 = v18;
    if (v7)
    {
      id v8 = [(NavigationDebugViewsController *)self->_debugViewsController debugControlsView];
      id v9 = [v8 superview];
      id v10 = [(OverlayContainerViewController *)self->_containerViewController overlayView];

      debugViewsController = self->_debugViewsController;
      if (v9 == v10)
      {
        unsigned int v17 = [(NavigationDebugViewsController *)self->_debugViewsController isShowingTraceControls];
        double v16 = self->_debugViewsController;
        if (v17)
        {
          [(NavigationDebugViewsController *)v16 hideTraceControlsAnimated:1];
LABEL_8:
          id v5 = v18;
          goto LABEL_9;
        }
      }
      else
      {
        double v12 = [(OverlayContainerViewController *)self->_containerViewController overlayView];
        id v13 = [(OverlayContainerViewController *)self->_containerViewController innerLayoutGuide];
        double v14 = [(TransitNavigationContext *)self chromeViewController];
        double v15 = [v14 mapView];
        [(NavigationDebugViewsController *)debugViewsController addDebugViewsToView:v12 layoutGuide:v13 mapView:v15 modalPresentingViewController:self->_containerViewController];

        double v16 = self->_debugViewsController;
      }
      [(NavigationDebugViewsController *)v16 showTraceControls];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (id)_recenterButton
{
  recenterButton = self->_recenterButton;
  if (!recenterButton)
  {
    id v4 = (UIButton *)objc_opt_new();
    id v5 = self->_recenterButton;
    self->_recenterButton = v4;

    [(UIButton *)self->_recenterButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = +[UIColor systemBackgroundColor];
    [(UIButton *)self->_recenterButton setBackgroundColor:v6];

    unsigned int v7 = +[UIColor systemBlueColor];
    [(UIButton *)self->_recenterButton setTintColor:v7];

    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"[Navigation] Recenter" value:@"localized string not found" table:0];
    [(UIButton *)self->_recenterButton setAccessibilityLabel:v9];

    [(UIButton *)self->_recenterButton addTarget:self action:"_recenterButtonTapped:" forControlEvents:64];
    id v10 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    id v11 = self->_recenterButton;
    double v12 = +[UIImage systemImageNamed:@"location.fill" withConfiguration:v10];
    [(UIButton *)v11 setImage:v12 forState:0];

    id v13 = [(UIButton *)self->_recenterButton layer];
    [v13 setCornerRadius:30.0];

    double v14 = [(UIButton *)self->_recenterButton layer];
    LODWORD(v15) = 1045220557;
    [v14 setShadowOpacity:v15];

    double height = CGSizeZero.height;
    unsigned int v17 = [(UIButton *)self->_recenterButton layer];
    [v17 setShadowOffset:CGSizeZero.width, height];

    id v18 = [(UIButton *)self->_recenterButton layer];
    [v18 setShadowRadius:1.0];

    recenterButton = self->_recenterButton;
  }

  return recenterButton;
}

- (void)_recenterButtonTapped:(id)a3
{
}

- (void)_updateRecenterButtonVisibility
{
  unsigned int v3 = [(TransitNavigationContext *)self shouldShowRecenterButton];
  if (v3 == [(UIButton *)self->_recenterButton isHidden])
  {
    uint64_t v4 = v3 ^ 1;
    id v5 = sub_10057767C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      unsigned int v7 = v6;
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "recenterButton should show? %@", (uint8_t *)&v8, 0xCu);
    }
    [(UIButton *)self->_recenterButton setHidden:v4];
  }
}

- (void)_backlightLuminanceDidChange
{
  trayViewController = self->_trayViewController;
  if (trayViewController)
  {
    uint64_t v4 = [(TransitNavigationTrayViewController *)trayViewController traitCollection];
    unsigned int v5 = [v4 isLuminanceReduced];

    if (v5)
    {
      containerViewController = self->_containerViewController;
      unsigned int v7 = self->_trayViewController;
      [(ContainerViewController *)containerViewController presentController:v7 animated:0 useDefaultContaineeLayout:0];
    }
  }
}

- (void)_updateArrivalEndTimerIfNeeded
{
  if (self->_arrivalEndTimer)
  {
LABEL_2:
    unsigned int v3 = [(TransitNavigationContext *)self activeStep];
    unsigned __int8 v4 = [v3 isArrivalStep];

    if ((v4 & 1) == 0)
    {
      unsigned int v5 = sub_10057767C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clearing arrival timer", (uint8_t *)&v19, 2u);
      }

      arrivalEndTimer = self->_arrivalEndTimer;
      self->_arrivalEndTimer = 0;
    }
    return;
  }
  unsigned int v7 = [(TransitNavigationContext *)self activeStep];
  unsigned int v8 = [v7 isArrivalStep];

  if (!v8)
  {
    if (!self->_arrivalEndTimer) {
      return;
    }
    goto LABEL_2;
  }
  GEOConfigGetDouble();
  double v10 = v9;
  int BOOL = GEOConfigGetBOOL();
  double v12 = sub_10057767C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = "not ";
    if (BOOL) {
      id v13 = "";
    }
    int v19 = 134218242;
    double v20 = v10;
    __int16 v21 = 2080;
    double v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scheduling arrival timer for %#.1lfs (%sinterruptible by user)", (uint8_t *)&v19, 0x16u);
  }

  double v14 = [NavIdleTimeoutTimer alloc];
  double v15 = [(TransitNavigationContext *)self chromeViewController];
  double v16 = [v15 view];
  unsigned int v17 = [(NavIdleTimeoutTimer *)v14 initWithView:v16 idleTimeout:v10];
  id v18 = self->_arrivalEndTimer;
  self->_arrivalEndTimer = v17;

  [(NavIdleTimeoutTimer *)self->_arrivalEndTimer setDelegate:self];
  [(NavIdleTimeoutTimer *)self->_arrivalEndTimer setSuppressInterruptions:BOOL ^ 1u];
}

- (void)idleTimerDidTimeout:(id)a3
{
  unsigned __int8 v4 = sub_10057767C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Arrival timer fired", v11, 2u);
  }

  unsigned int v5 = [(IOSTransitNavigationContext *)self iosBasedChromeViewController];
  id v6 = [v5 appCoordinator];
  unsigned int v7 = [v6 platformController];

  unsigned int v8 = [v7 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v9 = v8;
  }
  else {
    double v9 = 0;
  }
  id v10 = v9;

  [v7 popIfCurrentSession:v10];
}

- (void)presentAdvisory:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_alloc_init(MapsIncidentsViewController);
  id v6 = [[ModalContaineeViewController alloc] initWithChildViewController:v5];
  [(MapsIncidentsViewController *)v5 setAdvisory:v4];
  unsigned int v7 = [(MapsIncidentsViewController *)v5 navigationItem];
  unsigned int v8 = [v7 title];
  double v9 = [(ModalContaineeViewController *)v6 headerView];
  [v9 setTitle:v8];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006D53F0;
  v11[3] = &unk_1012E5D08;
  id v12 = v4;
  id v10 = v4;
  [(ModalContaineeViewController *)v6 setBlockAlongDismissContainee:v11];
  [(ContainerViewController *)self->_containerViewController presentController:v6];
}

- (void)_presentIncidents:(id)a3
{
  id v4 = a3;
  double v9 = objc_alloc_init(MapsIncidentsViewController);
  unsigned int v5 = [[ModalContaineeViewController alloc] initWithChildViewController:v9];
  [(MapsIncidentsViewController *)v9 setTransitIncidents:v4];

  id v6 = [(MapsIncidentsViewController *)v9 navigationItem];
  unsigned int v7 = [v6 title];
  unsigned int v8 = [(ModalContaineeViewController *)v5 headerView];
  [v8 setTitle:v7];

  [(ContainerViewController *)self->_containerViewController presentController:v5];
}

- (void)showVLF
{
  unsigned int v3 = [(ContainerViewController *)self->_containerViewController currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v13 = [(ContainerViewController *)self->_containerViewController currentViewController];
    [v13 handleVLFPuckTapped];
  }
  else
  {
    objc_initWeak(&location, self);
    containerViewController = self->_containerViewController;
    id v6 = [(ContainerViewController *)containerViewController chromeViewController];
    unsigned int v7 = [v6 appCoordinator];
    unsigned int v8 = [v7 baseActionCoordinator];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1006D5758;
    v14[3] = &unk_1012E6998;
    objc_copyWeak(&v15, &location);
    LOBYTE(containerViewController) = [(ContainerViewController *)containerViewController showVLFCrowdsourcingPermissionCardWithContaineeDelegate:self delegate:v8 completion:v14];

    if ((containerViewController & 1) == 0)
    {
      double v9 = [(IOSTransitNavigationContext *)self iosBasedChromeViewController];
      id v10 = [v9 userLocationView];

      if ([v10 isVLFBannerVisible]) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = [v10 isVLFPuckVisible];
      }
      id v12 = [[VLFContaineeViewController alloc] initWithEntryPoint:v11];
      [(ContaineeViewController *)v12 setContaineeDelegate:self];
      [(ContainerViewController *)self->_containerViewController presentController:v12];
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (id)_placeCardViewController
{
  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    id v4 = [[PlaceCardViewController alloc] initWithVisualEffectDisabled:1];
    unsigned int v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    [(PlaceCardViewController *)self->_placeCardViewController setExcludedContent:14671];
    [(PlaceCardViewController *)self->_placeCardViewController setPlaceCardDelegate:self];
    [(InfoCardViewController *)self->_placeCardViewController setContaineeDelegate:self];
    placeCardViewController = self->_placeCardViewController;
  }

  return placeCardViewController;
}

- (void)_presentPlaceCardViewControllerForMapItem:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v13 = [[PlaceCardItem alloc] initWithMapItem:v6];

  unsigned int v7 = [(ContainerViewController *)self->_containerViewController currentViewController];
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) == 0
    || ([(ContainerViewController *)self->_containerViewController currentViewController],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 placeCardItem],
        double v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [(PlaceCardItem *)v13 isEqual:v9],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    uint64_t v11 = [(IOSTransitNavigationContext *)self _placeCardViewController];
    [v11 resetState];
    [v11 setPlaceCardItem:v13 withHistory:0];
    id v12 = [v11 cardPresentationController];
    [v12 setPresentedModally:v4];

    [(ContainerViewController *)self->_containerViewController presentController:v11];
  }
}

- (GEOMapServiceTraits)newTraits
{
  v2 = [(TransitNavigationContext *)self chromeViewController];
  unsigned int v3 = [v2 currentTraits];

  return v3;
}

- (int64_t)displayedViewMode
{
  v2 = [(IOSTransitNavigationContext *)self iosBasedChromeViewController];
  id v3 = [v2 displayedViewMode];

  return (int64_t)v3;
}

- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4
{
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v4 = a4;
  id v5 = +[MKSystemController sharedInstance];
  [v5 openURL:v4 completionHandler:0];
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (BOOL)pptTestSupportStepping
{
  return [(TransitNavigationTrayViewController *)self->_trayViewController pptTestSupportStepping];
}

- (int64_t)pptTestCurrentStepIndex
{
  return [(TransitNavigationTrayViewController *)self->_trayViewController pptTestCurrentStepIndex];
}

- (BOOL)pptTestHasNextStep
{
  return [(TransitNavigationTrayViewController *)self->_trayViewController pptTestHasNextStep];
}

- (void)pptTestMoveToNextStep
{
}

- (BOOL)pptTestMoveToBoardStep
{
  return [(TransitNavigationTrayViewController *)self->_trayViewController pptTestMoveToBoardStep];
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  return (id)[(ContainerViewController *)self->_containerViewController containeeLayout] != (id)5
      && (id)[(ContainerViewController *)self->_containerViewController containeeLayout] != (id)4;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 3) {
    id v6 = (void *)(a3 + 1);
  }
  else {
    id v6 = 0;
  }
  if ((void *)[(ContainerViewController *)self->_containerViewController containeeLayout] == v6)
  {
    v11[0] = @"ContainerLayout";
    unsigned int v7 = +[NSNumber numberWithUnsignedInteger:v6];
    v11[1] = @"ContainerContainee";
    v12[0] = v7;
    unsigned int v8 = [(ContainerViewController *)self->_containerViewController currentViewController];
    v12[1] = v8;
    double v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayLayoutDidUpdateNotification" object:self userInfo:v9];
  }
  else
  {
    containerViewController = self->_containerViewController;
    [(ContainerViewController *)containerViewController setLayoutIfSupported:v6 animated:v4];
  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  return a3 == 0;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3) {
    [(ContainerViewController *)self->_containerViewController popLastViewControllerAnimated:a3];
  }
}

- (UIScrollView)pptTestScrollView
{
  return [(TransitNavigationTrayViewController *)self->_trayViewController pptTestScrollView];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_whenTrayPresentedBlock, 0);
  objc_storeStrong((id *)&self->_arrivalEndTimer, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_analyticsDelegate, 0);
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_trayViewController, 0);

  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end