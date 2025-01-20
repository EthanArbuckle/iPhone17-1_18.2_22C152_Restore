@interface NavigationFeedbackCollector
+ (NavigationFeedbackCollector)sharedFeedbackCollector;
- (BOOL)_isSuppressed;
- (BOOL)_shouldSendFeedback;
- (BOOL)didArrive;
- (BOOL)isPlayingTrace;
- (GEOComposedRoute)currentRoute;
- (GEOComposedRouteStep)prevStep;
- (GEODirectionsFeedbackCollector)feedbackCollector;
- (GEOLocation)lastLocation;
- (MNNavigationService)navigationService;
- (MNTrafficIncidentAlert)previousAlert;
- (NavigationAudioFeedbackCollector)audioFeedbackCollector;
- (NavigationFeedbackCollector)initWithNavigationService:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_stateOfChargeOfCurrentVehicle;
- (id)_trafficCameraFeedbackForEventFeedback:(id)a3;
- (int)_navigationModeTypeForState:(unint64_t)a3;
- (void)_addArrival;
- (void)_addGuidance;
- (void)_captureArrivalAtWaypoint:(id)a3;
- (void)_captureInitialEVRouteState;
- (void)_captureSessionlessEVRouteMessageIfNeeded;
- (void)_captureVirtualGarageAnalytics:(id)a3;
- (void)_completeCurrentStepFeedback:(BOOL)a3;
- (void)_didSelectAlternate:(unint64_t)a3 forPrimaryString:(BOOL)a4 inSign:(id)a5;
- (void)_didStartManeuver;
- (void)_finalizeDirectionsFeedback;
- (void)_finalizeDirectionsFeedbackWithReason:(int64_t)a3;
- (void)_flushModalitiesFeedback;
- (void)_flushStepFeedback;
- (void)_handleNavigationErrors;
- (void)_initializeDirectionsFeedbackWithNavigationState:(unint64_t)a3;
- (void)_initializeEVRecording;
- (void)_openNewStepFeedbackWithRoute:(id)a3 step:(id)a4;
- (void)_routePaused;
- (void)_runAsyncBlockOnLocalQueue:(id)a3;
- (void)_runAsyncBlockOnLocalQueueIfNotSuppressed:(id)a3;
- (void)_runAsyncBlockOnMainQueue:(id)a3;
- (void)_saveChargingStationInfo;
- (void)_setLastLocation:(id)a3;
- (void)_updateFeedbackCollectorWithEVData;
- (void)addAlightNotificationFeedback:(id)a3;
- (void)addTrafficRerouteFeedback:(id)a3;
- (void)carManeuverView:(id)a3 didSelectAlternate:(unint64_t)a4 forPrimaryString:(BOOL)a5 inSign:(id)a6;
- (void)dealloc;
- (void)didSuggestFindMy;
- (void)didSuggestWalkingRoute;
- (void)navSignView:(id)a3 didSelectAlternate:(unint64_t)a4 forPrimaryString:(BOOL)a5 inSign:(id)a6;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didEndWithReason:(unint64_t)a4;
- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4;
- (void)navigationService:(id)a3 didReceiveRoutingServiceError:(id)a4;
- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didStartRecordingTraceWithPath:(id)a4;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5;
- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateETAResponse:(id)a4 forRoute:(id)a5;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationService:(id)a3 newGuidanceEventFeedback:(id)a4;
- (void)navigationService:(id)a3 updatedGuidanceEventFeedback:(id)a4;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)offeredEVRerouteWithAlternateRoute:(id)a3 wasAccepted:(BOOL)a4;
- (void)reset;
- (void)setAddedChargingStationThroughSAR:(BOOL)a3;
- (void)setAudioFeedbackCollector:(id)a3;
- (void)setCurrentRoute:(id)a3;
- (void)setDidArrive:(BOOL)a3;
- (void)setFeedbackCollector:(id)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsPlayingTrace:(BOOL)a3;
- (void)setJunctionViewDisplayed:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setPrevStep:(id)a3;
- (void)setPreviousAlert:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateAudioPreferences;
- (void)userAcceptedWalkingRoute;
- (void)userLaunchedFindMy;
- (void)vehicleBatteryDied;
- (void)virtualGarageDidBecomeAvailable;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation NavigationFeedbackCollector

- (void)virtualGarageDidUpdate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DEDC;
  v5[3] = &unk_101318718;
  id v6 = a3;
  id v4 = v6;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v5];
}

- (void)_captureVirtualGarageAnalytics:(id)a3
{
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    LODWORD(v6) = 0;
    LODWORD(v7) = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 licensePlate];

        if (v11) {
          uint64_t v7 = (v7 + 1);
        }
        else {
          uint64_t v7 = v7;
        }
        uint64_t v6 = v6 + [v10 isPureElectricVehicle];
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  v12 = +[GEOAPSharedStateData sharedData];
  [v12 setMapFeatureLicensePlateCount:v7];

  v13 = +[GEOAPSharedStateData sharedData];
  [v13 setMapFeatureElectronicVehicleCount:v6];
}

- (void)virtualGarageDidBecomeAvailable
{
  if ((MapsFeature_IsEnabled_EVRouting() & 1) != 0 || MapsFeature_IsEnabled_Alberta())
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "virtualGarageDidBecomeAvailable, fetching garage.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v4 = +[VGVirtualGarageService sharedService];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100035E40;
    v5[3] = &unk_1012E65A8;
    objc_copyWeak(&v6, buf);
    [v4 virtualGarageGetGarageWithReply:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

- (void)_runAsyncBlockOnLocalQueue:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024EB8;
  v8[3] = &unk_101318138;
  objc_copyWeak(v10, &location);
  id v9 = v5;
  v10[1] = (id)a2;
  id v7 = v5;
  dispatch_async(queue, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)reset
{
  [(NavigationFeedbackCollector *)self setAudioFeedbackCollector:0];
  responseID = self->_responseID;
  self->_responseID = 0;

  traceFileName = self->_traceFileName;
  self->_traceFileName = 0;

  id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  guidance = self->_guidance;
  self->_guidance = v5;

  stepFeedback = self->_stepFeedback;
  self->_stepFeedback = 0;

  junctionViewEventsDisplayed = self->_junctionViewEventsDisplayed;
  self->_junctionViewEventsDisplayed = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  v10 = +[NSDate date];
  navigationStartTime = self->_navigationStartTime;
  self->_navigationStartTime = v10;

  *(_WORD *)&self->_wasEverConnectedToCarplay = 0;
  chargingSteps = self->_chargingSteps;
  self->_chargingSteps = 0;

  v13 = +[NSMutableArray array];
  addedStopsDetails = self->_addedStopsDetails;
  self->_addedStopsDetails = v13;

  long long v15 = (NSMutableArray *)objc_opt_new();
  removedStopsDetails = self->_removedStopsDetails;
  self->_removedStopsDetails = v15;

  expectedFinalStateOfCharge = self->_expectedFinalStateOfCharge;
  self->_expectedFinalStateOfCharge = 0;

  initialStateOfCharge = self->_initialStateOfCharge;
  self->_initialStateOfCharge = 0;

  self->_batteryDied = 0;
  self->_parkingCount = 0;
  self->_parkedCount = 0;
  self->_arrivedCount = 0;
  *(_WORD *)&self->_addedChargingStationThroughSAR = 0;
  [(NavigationFeedbackCollector *)self setDidArrive:0];
  id v19 = objc_alloc_init((Class)GEODirectionsFeedbackCollector);
  [(NavigationFeedbackCollector *)self setFeedbackCollector:v19];

  [(NavigationFeedbackCollector *)self setPrevStep:0];
  [(NavigationFeedbackCollector *)self setIsPlayingTrace:0];

  [(NavigationFeedbackCollector *)self setPreviousAlert:0];
}

- (NavigationFeedbackCollector)initWithNavigationService:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NavigationFeedbackCollector;
  id v6 = [(NavigationFeedbackCollector *)&v19 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationService, a3);
    [(MNNavigationService *)v7->_navigationService registerObserver:v7];
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("NavigationFeedbackCollectorQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    [(NavigationFeedbackCollector *)v7 reset];
    if (MapsFeature_IsEnabled_EVRouting())
    {
      v11 = +[VGVirtualGarageService sharedService];
      [v11 registerObserver:v7];

      v12 = [NavigationEVBadTripFeedbackCollector alloc];
      navigationService = v7->_navigationService;
      long long v14 = +[VGVirtualGarageService sharedService];
      long long v15 = [(NavigationEVBadTripFeedbackCollector *)v12 initWithNavigationService:navigationService virtualGarageService:v14];
      badTripCollector = v7->_badTripCollector;
      v7->_badTripCollector = v15;

      long long v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:v7 selector:"virtualGarageDidBecomeAvailable" name:off_1015F22B0 object:0];
    }
  }

  return v7;
}

- (void)setPreviousAlert:(id)a3
{
}

- (void)setPrevStep:(id)a3
{
}

- (void)setIsPlayingTrace:(BOOL)a3
{
  self->_isPlayingTrace = a3;
}

- (void)setFeedbackCollector:(id)a3
{
}

- (void)setDidArrive:(BOOL)a3
{
  self->_didArrive = a3;
}

- (void)setAudioFeedbackCollector:(id)a3
{
}

+ (NavigationFeedbackCollector)sharedFeedbackCollector
{
  if (qword_101610870 != -1) {
    dispatch_once(&qword_101610870, &stru_1013186F0);
  }
  v2 = (void *)qword_101610868;

  return (NavigationFeedbackCollector *)v2;
}

- (void)dealloc
{
  id v3 = [(NavigationFeedbackCollector *)self navigationService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NavigationFeedbackCollector;
  [(NavigationFeedbackCollector *)&v4 dealloc];
}

- (void)addTrafficRerouteFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(NavigationFeedbackCollector *)self feedbackCollector];
  [v5 addTrafficRerouteFeedback:v4];
}

- (void)setJunctionViewDisplayed:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B32DE8;
    v6[3] = &unk_101318740;
    v6[4] = self;
    id v7 = v4;
    [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v6];
  }
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  int wasEverConnectedToCarplay = self->_wasEverConnectedToCarplay;
  int v4 = self->_wasEverConnectedToCarplay || a3;
  self->_int wasEverConnectedToCarplay = v4;
  if (wasEverConnectedToCarplay != v4) {
    [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:&stru_101318780];
  }
}

- (void)setAddedChargingStationThroughSAR:(BOOL)a3
{
  if (self->_addedChargingStationThroughSAR != a3) {
    self->_addedChargingStationThroughSAR = a3;
  }
}

- (void)setCurrentRoute:(id)a3
{
  p_currentRoute = &self->_currentRoute;
  id v6 = a3;
  if (([v6 isEqual:*p_currentRoute] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentRoute, a3);
    if (v6) {
      -[GEODirectionsFeedbackCollector setTransportType:](self->_feedbackCollector, "setTransportType:", [v6 transportType]);
    }
    if ([(GEOComposedRoute *)*p_currentRoute isEVRoute])
    {
      [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:&stru_1013187A0];
      [(NavigationFeedbackCollector *)self _saveChargingStationInfo];
    }
  }
}

- (void)didSuggestWalkingRoute
{
}

- (void)userAcceptedWalkingRoute
{
}

- (void)didSuggestFindMy
{
}

- (void)userLaunchedFindMy
{
}

- (id)_stateOfChargeOfCurrentVehicle
{
  currentVehicle = self->_currentVehicle;
  if (currentVehicle)
  {
    int v4 = [(VGVehicle *)currentVehicle currentVehicleState];
    id v5 = [v4 currentBatteryCapacity];

    if (v5)
    {
      id v6 = [(VGVehicle *)self->_currentVehicle currentVehicleState];
      id v7 = [v6 currentBatteryCapacity];
      uint64_t v8 = +[NSUnitEnergy kilowattHours];
      dispatch_queue_t v9 = [v7 measurementByConvertingToUnit:v8];
      [v9 doubleValue];
      double v11 = v10 * 1000.0;

      v12 = +[NSNumber numberWithDouble:v11];
    }
    else
    {
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_saveExpectedFinalStateOfChargeIfNeeded: there is no vehicle selected", v15, 2u);
      }

      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_routePaused
{
}

- (void)vehicleBatteryDied
{
}

- (void)offeredEVRerouteWithAlternateRoute:(id)a3 wasAccepted:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B33510;
  v6[3] = &unk_101318888;
  id v7 = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  [(NavigationFeedbackCollector *)v7 _runAsyncBlockOnLocalQueue:v6];
}

- (void)_captureInitialEVRouteState
{
  id v3 = [(NavigationFeedbackCollector *)self currentRoute];
  unsigned int v4 = [v3 isEVRoute];

  if (v4)
  {
    id v7 = [(NavigationFeedbackCollector *)self currentRoute];
    id v5 = [v7 waypoints];
    id v6 = sub_1000AC254(v5, &stru_1013188A8);
    self->_originalTripIncludedChargingStation = [v6 count] != 0;
  }
}

- (void)_captureSessionlessEVRouteMessageIfNeeded
{
  id v3 = [(NavigationFeedbackCollector *)self currentRoute];
  unsigned int v4 = [v3 isEVRoute];

  if (v4)
  {
    id v9 = [(NavigationFeedbackCollector *)self feedbackCollector];
    id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 batteryDied]);
    id v6 = +[NSNumber numberWithBool:self->_outOfRangeDodgeballDisplayed];
    id v7 = +[NSNumber numberWithBool:self->_originalTripIncludedChargingStation];
    id v8 = +[NSNumber numberWithBool:self->_addedChargingStationThroughSAR];
    +[GEOAPPortal captureEvTripWithOutOfCharge:v5 outOfRangeAlertDisplayed:v6 originalTripIncludedChargingStation:v7 chargingStopAddedThroughSar:v8 tripIncludedPreferredChargingStation:0 stopRemovedDetails:self->_removedStopsDetails realtimeDodgeballs:0 chargeLocationDetails:self->_chargingSteps stopAddedDetails:self->_addedStopsDetails];
  }
}

- (void)_initializeEVRecording
{
}

- (void)_updateFeedbackCollectorWithEVData
{
  id v3 = [(NavigationFeedbackCollector *)self currentRoute];
  unsigned int v4 = [v3 isEVRoute];

  if (v4)
  {
    id v5 = [(VGVehicle *)self->_currentVehicle currentVehicleState];
    id v6 = [v5 chargingArguments];
    id v7 = [v6 copy];
    id v8 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v8 setEvChargingModel:v7];

    id v9 = [(VGVehicle *)self->_currentVehicle currentVehicleState];
    double v10 = [v9 consumptionArguments];
    id v11 = [v10 copy];
    v12 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v12 setEvConsumptionModel:v11];

    initialStateOfCharge = self->_initialStateOfCharge;
    long long v14 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v14 setStateOfChargeAtOrigin:initialStateOfCharge];

    expectedFinalStateOfCharge = self->_expectedFinalStateOfCharge;
    long long v16 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v16 setStateOfChargeAtDestPredicted:expectedFinalStateOfCharge];

    long long v17 = [(NavigationFeedbackCollector *)self _stateOfChargeOfCurrentVehicle];
    v18 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v18 setStateOfChargeAtDestActual:v17];

    objc_super v19 = [(NavigationFeedbackCollector *)self currentRoute];
    v20 = [v19 legs];
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v20 count]);
    id v30 = (id)objc_claimAutoreleasedReturnValue();

    id v21 = objc_alloc_init((Class)GEOWaypointInfo);
    v22 = [(NavigationFeedbackCollector *)self currentRoute];
    v23 = [v22 origin];
    v24 = [v23 latLng];
    [v21 setPosition:v24];

    [v30 addObject:v21];
    v25 = [(NavigationFeedbackCollector *)self currentRoute];
    v26 = [v25 legs];
    v27 = sub_100099700(v26, &stru_101318908);

    [v30 addObjectsFromArray:v27];
    id v28 = [v30 copy];
    v29 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v29 setWaypoints:v28];
  }
}

- (void)_saveChargingStationInfo
{
}

- (void)_captureArrivalAtWaypoint:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B33F48;
  v5[3] = &unk_101318718;
  id v6 = a3;
  id v4 = v6;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v5];
}

- (void)_didSelectAlternate:(unint64_t)a3 forPrimaryString:(BOOL)a4 inSign:(id)a5
{
  BOOL v5 = a4;
  id v7 = [(NSMutableDictionary *)self->_guidance objectForKeyedSubscript:a5];
  if (v7)
  {
    id v8 = v7;
    if (v5) {
      [v7 setSelectedPrimaryStringIndex:a3];
    }
    else {
      [v7 setSelectedSecondaryStringIndex:a3];
    }
    id v7 = v8;
  }
}

- (void)_runAsyncBlockOnLocalQueueIfNotSuppressed:(id)a3
{
  id v4 = a3;
  if (![(NavigationFeedbackCollector *)self _isSuppressed]) {
    [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v4];
  }
}

- (void)_runAsyncBlockOnMainQueue:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B343E8;
  v7[3] = &unk_101318138;
  objc_copyWeak(v9, &location);
  id v8 = v5;
  v9[1] = (id)a2;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldSendFeedback
{
  if (![(NavigationFeedbackCollector *)self isPlayingTrace]) {
    return 1;
  }

  return GEOConfigGetBOOL();
}

- (BOOL)_isSuppressed
{
  v2 = [(NavigationFeedbackCollector *)self navigationService];
  [v2 state];
  char v3 = MNNavigationServiceStateIsNavigating() ^ 1;

  return v3;
}

- (void)addAlightNotificationFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(NavigationFeedbackCollector *)self feedbackCollector];
  [v5 addAlightNotificationFeedback:v4];
}

- (int)_navigationModeTypeForState:(unint64_t)a3
{
  if (a3 == 4) {
    return 2;
  }
  else {
    return a3 == 5;
  }
}

- (void)_openNewStepFeedbackWithRoute:(id)a3 step:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (self->_stepFeedback) {
    [(NavigationFeedbackCollector *)self _completeCurrentStepFeedback:0];
  }
  id v7 = objc_alloc_init((Class)GEOStepFeedback);
  if ([v17 isNewProtocolRoute])
  {
    id v8 = [v17 legIndexForStepIndex:[v6 stepIndex]];
    id v9 = [v17 legs];
    double v10 = [v9 objectAtIndexedSubscript:v8];

    id v11 = [v10 serverLegIDForAnalytics];
    [v7 setRouteID:v11];

    [v7 setWaypointRouteID:[v17 serverIdentifier]];
  }
  else
  {
    double v10 = [v17 serverRouteID];
    [v7 setRouteID:v10];
  }

  [v7 setRouteIndex:[v17 indexInResponse]];
  [v7 setStepID:[v6 stepID]];
  [v7 setCompletedStep:0];
  [v7 setStepEndPathPointIndex:[v6 endRouteCoordinate]];
  objc_msgSend(v7, "setStepEndPathPointOffset:", COERCE_FLOAT((unint64_t)objc_msgSend(v6, "endRouteCoordinate") >> 32));
  [v7 setManeuverType:[v6 maneuverType]];
  [v7 setExpectedTime:[v6 duration]];
  v12 = [v17 etauResponseID];

  if (v12)
  {
    v13 = [v17 etauResponseID];
    [v7 setEtaTrafficUpdateResponseId:v13];
  }
  long long v14 = [v6 evInfo];
  if (v14)
  {
    id v15 = objc_alloc_init((Class)GEOEVStepFeedbackInfo);
    [v15 setRemainingBatteryPercentage:[v14 remainingBatteryPercentage]];
    [v15 setRemainingBatteryCharge:[v14 remainingBatteryCharge]];
    [v7 setEvStepInfo:v15];
  }
  stepFeedback = self->_stepFeedback;
  self->_stepFeedback = (GEOStepFeedback *)v7;
}

- (void)_completeCurrentStepFeedback:(BOOL)a3
{
  stepFeedback = self->_stepFeedback;
  if (stepFeedback)
  {
    BOOL v5 = a3;
    id v6 = [(GEOStepFeedback *)stepFeedback evStepInfo];
    if (v6)
    {
      id v7 = [(VGVehicle *)self->_currentVehicle currentVehicleState];
      id v8 = [v7 currentBatteryCapacity];
      id v9 = +[NSUnitEnergy kilowattHours];
      double v10 = [v8 measurementByConvertingToUnit:v9];
      [v10 doubleValue];
      unsigned int v12 = (v11 * 1000.0);

      unsigned int v13 = v12;
      if ([v6 remainingBatteryCharge] >= v12) {
        unsigned int v13 = [v6 remainingBatteryCharge];
      }
      if ([v6 remainingBatteryCharge] <= v12) {
        unsigned int v12 = [v6 remainingBatteryCharge];
      }
      uint64_t v14 = v13 - v12;
      id v15 = [(GEOStepFeedback *)self->_stepFeedback evStepInfo];
      [v15 setStateOfChargeDiff:v14];
    }
    long long v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v17 = [(GEOStepFeedback *)self->_stepFeedback stepID];
      unsigned int v18 = [(GEOStepFeedback *)self->_stepFeedback completedStep];
      objc_super v19 = [(GEOStepFeedback *)self->_stepFeedback routeID];
      unsigned int v20 = [(GEOStepFeedback *)self->_stepFeedback waypointRouteID];
      v21[0] = 67109890;
      v21[1] = v17;
      __int16 v22 = 1024;
      unsigned int v23 = v18;
      __int16 v24 = 2112;
      v25 = v19;
      __int16 v26 = 1024;
      unsigned int v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Adding step feedback. ID: %u, completed: %d, route: %@, waypointRouteID: %u", (uint8_t *)v21, 0x1Eu);
    }
    [(GEOStepFeedback *)self->_stepFeedback setCompletionTimeStamp:CFAbsoluteTimeGetCurrent()];
    [(GEOStepFeedback *)self->_stepFeedback setCompletedStep:v5];
    [(NavigationFeedbackCollector *)self _flushStepFeedback];
  }
}

- (void)_flushStepFeedback
{
  if (self->_stepFeedback)
  {
    char v3 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v3 addStepFeedback:self->_stepFeedback];

    stepFeedback = self->_stepFeedback;
    self->_stepFeedback = 0;
  }
}

- (void)_flushModalitiesFeedback
{
  if (self->_modalitiesFeedback)
  {
    char v3 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v3 setModalities:self->_modalitiesFeedback];

    modalitiesFeedback = self->_modalitiesFeedback;
    self->_modalitiesFeedback = 0;
  }
}

- (void)updateAudioPreferences
{
  char v3 = [AudioPreferences alloc];
  id v4 = +[NSUserDefaults standardUserDefaults];
  BOOL v5 = [(AudioPreferences *)v3 initWithDefaults:v4];

  id v6 = [(NavigationFeedbackCollector *)self navigationService];
  id v7 = [v6 route];
  unint64_t v8 = -[AudioPreferences guidanceLevelForTransportType:](v5, "guidanceLevelForTransportType:", [v7 transportType]);

  uint64_t v9 = 1;
  switch(v8)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      double v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v18[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Invalid guidance level \"NoOverride\" in NavigationFeedbackCollector.", (uint8_t *)v18, 2u);
      }

      goto LABEL_5;
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v9 = 2;
      break;
    case 2uLL:
      uint64_t v9 = 3;
      break;
    default:
LABEL_5:
      uint64_t v9 = 0;
      break;
  }
  double v11 = [(NavigationFeedbackCollector *)self feedbackCollector];
  [v11 setVoiceGuidanceLevel:v9];

  unsigned int v12 = [(NavigationFeedbackCollector *)self feedbackCollector];
  if (qword_101610880 != -1) {
    dispatch_once(&qword_101610880, &stru_101318B88);
  }
  unsigned int v13 = [(id)qword_101610878 path];
  uint64_t v14 = (void *)_CFPreferencesCopyAppValueWithContainer();

  if (v14)
  {
    if ((_GEOConfigHasValue() & 1) == 0)
    {
      [v14 BOOLValue];
      GEOConfigSetBOOL();
    }
    id v15 = +[MSPMapsPaths mapsApplicationContainerPaths];
    [v15 homeDirectory];
    _CFPreferencesSetValueWithContainer();

    id BOOL = [v14 BOOLValue];
  }
  else
  {
    id BOOL = (id)GEOConfigGetBOOL();
  }
  id v17 = BOOL;

  [v12 setIsHandsFreeProfileUsed:v17];
}

- (void)_didStartManeuver
{
  char v3 = [(NavigationFeedbackCollector *)self navigationService];
  -[GEOStepFeedback setLightGuidance:](self->_stepFeedback, "setLightGuidance:", [v3 state] == (id)5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_guidance allValues];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 stepID];
        double v11 = [(NavigationFeedbackCollector *)self prevStep];
        unsigned int v12 = [v11 stepID];

        if (v10 == (id)v12)
        {
          [v9 maneuverTime];
          if (v13 == 0.0) {
            [v9 setManeuverTime:CFAbsoluteTimeGetCurrent()];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)_addGuidance
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(NSMutableDictionary *)self->_guidance allValues];
  id v5 = [v3 initWithArray:v4];

  [v5 sortUsingComparator:&stru_1013189D0];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v6 = v5;
  id v54 = [v6 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v54)
  {
    uint64_t v7 = &NavigationConfig_Dodgeball_ETAU_FakeIncidentHideTriggerPointAllowTruncating_ptr;
    uint64_t v8 = *(void *)v56;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v9);
        id v11 = objc_alloc_init((Class)v7[323]);
        unsigned int v12 = [v10 routeID];
        [v11 setRouteID:v12];

        if ([v10 stepID] != (id)0x7FFFFFFFFFFFFFFFLL) {
          [v11 setStepID:[v10 stepID]];
        }
        if ([v10 enrouteNoticeIndex] != (id)0x7FFFFFFFFFFFFFFFLL) {
          [v11 setEnrouteNoticeIndex:[v10 enrouteNoticeIndex]];
        }
        if ([v10 eventIndex] != (id)0x7FFFFFFFFFFFFFFFLL) {
          [v11 setEventIndex:[v10 eventIndex]];
        }
        [v10 startTime];
        if (v13 > 0.0)
        {
          [v10 endTime];
          if (v14 > 0.0)
          {
            [v10 endTime];
            double v16 = v15;
            [v10 startTime];
            double v18 = v16 - v17;
            *(float *)&double v18 = v18;
            [v11 setDuration:v18];
          }
        }
        [v10 startTime];
        if (v19 > 0.0)
        {
          [v10 maneuverTime];
          if (v20 > 0.0)
          {
            [v10 maneuverTime];
            double v22 = v21;
            [v10 startTime];
            double v24 = v22 - v23;
            *(float *)&double v24 = v24;
            [v11 setTimeToManeuver:v24];
          }
        }
        [v10 vehicleSpeed];
        if (v25 != 0.0)
        {
          [v10 vehicleSpeed];
          *(float *)&double v26 = v26;
          [v11 setVehicleSpeed:v26];
        }
        [v11 setTrafficSpeed:[v10 trafficColor]];
        [v10 startDistance];
        if (v27 > 0.0)
        {
          [v10 startDistance];
          *(float *)&double v28 = v28;
          [v11 setDistanceToManeuver:v28];
        }
        id v29 = [v10 type];
        if (v29 == (id)4)
        {
          v40 = [v10 junctionViewImageIDs];
          id v41 = [v40 count];

          if (!v41) {
            goto LABEL_41;
          }
          id v42 = objc_alloc_init((Class)GEOJunctionViewGuidanceFeedback);
          [v11 setJunctionViewGuidanceFeedback:v42];

          v43 = [v10 junctionViewImageIDs];
          id v44 = [v43 mutableCopy];
          [v11 junctionViewGuidanceFeedback];
          v45 = self;
          uint64_t v46 = v8;
          v47 = v7;
          v49 = id v48 = v6;
          [v49 setImageIDs:v44];

          id v6 = v48;
          uint64_t v7 = v47;
          uint64_t v8 = v46;
          self = v45;

          junctionViewEventsDisplayed = v45->_junctionViewEventsDisplayed;
          v35 = [v10 uniqueID];
          id v51 = [(NSMutableSet *)junctionViewEventsDisplayed containsObject:v35];
          v52 = [v11 junctionViewGuidanceFeedback];
          [v52 setImageDisplayed:v51];

          goto LABEL_40;
        }
        if (v29 == (id)2)
        {
          if ([v10 selectedPrimaryStringIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v36 = objc_alloc_init((Class)GEOSpokenGuidanceFeedback);
            [v11 setSpokenGuidanceFeedback:v36];

            id v37 = [v10 selectedPrimaryStringIndex];
            v38 = [v11 spokenGuidanceFeedback];
            [v38 setSpokenGuidanceIndex:v37];

            if ([v10 trafficCameraType])
            {
              v35 = [(NavigationFeedbackCollector *)self _trafficCameraFeedbackForEventFeedback:v10];
              if (v35)
              {
                v39 = [v11 spokenGuidanceFeedback];
                [v39 setTrafficCameraGuidanceFeedback:v35];
              }
              goto LABEL_40;
            }
          }
        }
        else if (v29 == (id)1 {
               && ([v10 selectedPrimaryStringIndex] != (id)0x7FFFFFFFFFFFFFFFLL
        }
                || [v10 selectedSecondaryStringIndex] != (id)0x7FFFFFFFFFFFFFFFLL))
        {
          id v30 = objc_alloc_init((Class)GEOSignGuidanceFeedback);
          [v11 setSignGuidanceFeedback:v30];

          if ([v10 selectedPrimaryStringIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v31 = [v10 selectedPrimaryStringIndex];
            v32 = [v11 signGuidanceFeedback];
            [v32 setSignTitleIndex:v31];
          }
          if ([v10 selectedSecondaryStringIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v33 = [v10 selectedSecondaryStringIndex];
            v34 = [v11 signGuidanceFeedback];
            [v34 setSignDetailIndex:v33];
          }
          if ([v10 trafficCameraType])
          {
            v35 = [(NavigationFeedbackCollector *)self _trafficCameraFeedbackForEventFeedback:v10];
            if (v35) {
              [v11 setTrafficCameraGuidanceFeedback:v35];
            }
LABEL_40:
          }
        }
LABEL_41:
        v53 = [(NavigationFeedbackCollector *)self feedbackCollector];
        [v53 addGuidanceEventFeedback:v11];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v54 != v9);
      id v54 = [v6 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v54);
  }

  [(NSMutableDictionary *)self->_guidance removeAllObjects];
}

- (void)_addArrival
{
  unint64_t arrivedCount = self->_arrivedCount;
  id v4 = [(NavigationFeedbackCollector *)self feedbackCollector];
  [v4 setArrivedAtDestinationCount:arrivedCount];

  unint64_t parkingCount = self->_parkingCount;
  id v6 = [(NavigationFeedbackCollector *)self feedbackCollector];
  [v6 setInParkingModeCount:parkingCount];

  BOOL v7 = self->_parkingCount != 0;
  id v8 = [(NavigationFeedbackCollector *)self feedbackCollector];
  [v8 setEnteredParkingMode:v7];
}

- (id)_trafficCameraFeedbackForEventFeedback:(id)a3
{
  id v3 = a3;
  if ([v3 trafficCameraType])
  {
    unsigned int v4 = [v3 trafficCameraType];
    if (v4 == 2) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2 * (v4 == 1);
    }
    id v6 = objc_alloc_init((Class)GEOTrafficCameraInformation);
    [v6 setCameraType:v5];
    BOOL v7 = [v3 enrouteNoticeIdentifier];
    [v6 setCameraIdentifier:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_setLastLocation:(id)a3
{
}

- (void)_handleNavigationErrors
{
  id v3 = +[GEOPlatform sharedPlatform];
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    if ([(NSMutableArray *)self->_routingServiceErrors count])
    {
      dispatch_time_t v5 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100B3574C;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_initializeDirectionsFeedbackWithNavigationState:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B35DC8;
  v3[3] = &unk_101318A10;
  v3[4] = a3;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v3];
}

- (void)_finalizeDirectionsFeedback
{
}

- (void)_finalizeDirectionsFeedbackWithReason:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B36174;
  v3[3] = &unk_101318A10;
  v3[4] = a3;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v3];
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B365B4;
  v6[3] = &unk_101318740;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v6];
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v28 = a3;
  if (MNNavigationServiceStateChangedToNavigating())
  {
    id v6 = +[UIApplication _maps_keyMapsSceneDelegate];
    id v7 = [v6 platformController];
    id v8 = [v7 auxiliaryTasksManager];
    uint64_t v9 = [v8 auxilaryTaskForClass:objc_opt_class()];

    id v10 = [(NavigationFeedbackCollector *)self feedbackCollector];
    id v11 = [v9 analyticsTracker];
    [v10 setIsVLFImprovementUsed:[v11 hasVLFLocalizedRecently]];

    unsigned int v12 = +[PedestrianARSessionUsageTracker sharedInstance];
    double v13 = [(NavigationFeedbackCollector *)self currentRoute];
    double v14 = [v13 uniqueRouteID];
    double v15 = [v14 UUIDString];
    unsigned int v16 = [v12 hasUserEnteredARForRoute:v15 entryPoint:0];

    if (v16)
    {
      double v17 = [(NavigationFeedbackCollector *)self feedbackCollector];
      [v17 setARWalkingUsedInRoutePlanning:1];
    }
    double v18 = +[MKLocationManager sharedLocationManager];
    uint64_t v19 = [v18 isAuthorizedForPreciseLocation] ^ 1;

    double v20 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v20 setIsCoarseLocationUsed:v19];

    double v21 = [(NavigationFeedbackCollector *)self feedbackCollector];
    double v22 = [v28 route];
    double v23 = [v22 origin];
    double v24 = [v23 bestLatLng];
    [v21 setTripOrigin:v24];

    [(NavigationFeedbackCollector *)self _initializeEVRecording];
    [(NavigationFeedbackCollector *)self updateAudioPreferences];
    routingServiceErrors = self->_routingServiceErrors;
    self->_routingServiceErrors = 0;
  }
  else if (MNNavigationServiceStateChangedFromNavigatingToStopped())
  {
    double v26 = [(NavigationFeedbackCollector *)self feedbackCollector];
    unsigned int v27 = [v26 hasActiveFeedbackSession];

    if (v27) {
      [(NavigationFeedbackCollector *)self _finalizeDirectionsFeedbackWithReason:1];
    }
    [(NavigationFeedbackCollector *)self _handleNavigationErrors];
  }
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateIsNavigating())
  {
    if (MNNavigationServiceStateChangedToNavigating())
    {
      [(NavigationFeedbackCollector *)self _initializeDirectionsFeedbackWithNavigationState:a5];
    }
    else
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100B36CFC;
      v7[3] = &unk_101318A10;
      void v7[4] = a5;
      [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v7];
    }
  }
  else if (MNNavigationServiceStateChangedFromNavigatingToStopped())
  {
    [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:&stru_101318A30];
  }
}

- (void)navigationService:(id)a3 didReceiveRoutingServiceError:(id)a4
{
  id v9 = a4;
  if (!self->_routingServiceErrors)
  {
    id v5 = +[NSMutableArray array];
    routingServiceErrors = self->_routingServiceErrors;
    self->_routingServiceErrors = v5;
  }
  id v7 = objc_opt_new();
  [v7 setError:v9];
  id v8 = +[NSDate date];
  [v7 setDate:v8];

  [(NSMutableArray *)self->_routingServiceErrors addObject:v7];
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B36F70;
  v11[3] = &unk_101318A58;
  id v13 = a4;
  unint64_t v14 = a5;
  id v12 = v8;
  id v9 = v13;
  id v10 = v8;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v11];
}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didEndWithReason:(unint64_t)a4
{
  if (a4 == 3) {
    [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:&stru_101318A98];
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  id v9[2] = sub_100B371B8;
  v9[3] = &unk_101318888;
  id v10 = a3;
  id v11 = a4;
  char v12 = !+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground];
  id v7 = v11;
  id v8 = v10;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v9];
}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B375F0;
  v7[3] = &unk_101318718;
  id v8 = a4;
  id v6 = v8;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v7];
}

- (void)navigationService:(id)a3 didUpdateETAResponse:(id)a4 forRoute:(id)a5
{
  id v7 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_100B376C0;
  v10[3] = &unk_101318740;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v10];
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  id v9[2] = sub_100B377DC;
  v9[3] = &unk_101318AC0;
  id v10 = a3;
  double v11 = a4;
  id v8 = v10;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v9];
}

- (void)navigationService:(id)a3 newGuidanceEventFeedback:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B37910;
  v6[3] = &unk_101318718;
  id v7 = a4;
  id v5 = v7;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v6];
}

- (void)navigationService:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B37A20;
  v6[3] = &unk_101318718;
  id v7 = a4;
  id v5 = v7;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v6];
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v6 = *(id *)&a4;
  id v8 = a3;
  if (![(NavigationFeedbackCollector *)self _isSuppressed])
  {
    if (v6 == 4)
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        double v18 = "-[NavigationFeedbackCollector navigationService:didSwitchToNewTransportType:newRoute:traffic:]";
        __int16 v19 = 2080;
        double v20 = "NavigationFeedbackCollector.m";
        __int16 v21 = 1024;
        int v22 = 1315;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        id v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          double v11 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          double v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "While navigating there wasn't a transport type.", buf, 2u);
      }

      id v6 = [v8 desiredTransportType];
    }
    id v13 = [(NavigationFeedbackCollector *)self currentRoute];
    unsigned int v14 = [v13 transportType];

    if (v6 == v14)
    {
      GEOFindOrCreateLog();
      double v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        if (v6 >= 7)
        {
          unsigned int v16 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
        }
        else
        {
          unsigned int v16 = off_101318BA8[(int)v6];
        }
        *(_DWORD *)buf = 138412290;
        double v18 = (const char *)v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Got a transport type change callback (%@) but we are already on that transport type. Doing nothing.", buf, 0xCu);
      }
    }
    else
    {
      [(NavigationFeedbackCollector *)self _finalizeDirectionsFeedback];
      -[NavigationFeedbackCollector _initializeDirectionsFeedbackWithNavigationState:](self, "_initializeDirectionsFeedbackWithNavigationState:", [v8 state]);
      [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:&stru_101318AE0];
    }
  }
}

- (void)navigationService:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B37E64;
  v5[3] = &unk_101318B00;
  void v5[4] = a4;
  v5[5] = a5;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v5];
}

- (void)navigationService:(id)a3 didStartRecordingTraceWithPath:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B380C8;
  v6[3] = &unk_101318718;
  id v7 = a4;
  id v5 = v7;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v6];
}

- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4
{
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v6 = a4;
  [(NavigationFeedbackCollector *)self setPreviousAlert:v6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B381AC;
  v8[3] = &unk_101318718;
  id v9 = v6;
  id v7 = v6;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueueIfNotSuppressed:v8];
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v17 = a3;
  id v6 = (char *)[a4 arrivalState];
  if ((unint64_t)(v6 - 5) < 2)
  {
    ++self->_parkingCount;
LABEL_11:
    id v8 = v17;
    goto LABEL_12;
  }
  if (v6 == (char *)4)
  {
    ++self->_arrivedCount;
    id v13 = [(NavigationFeedbackCollector *)self lastLocation];
    unsigned int v14 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v14 setArrivalLocation:v13];

    goto LABEL_11;
  }
  BOOL v7 = v6 == (char *)1;
  id v8 = v17;
  if (v7)
  {
    id v9 = [v17 alternateWalkingRouteDisplayETAInfo];

    if (v9)
    {
      id v10 = [v17 alternateWalkingRouteDisplayETAInfo];
      double v11 = (double)(unint64_t)[v10 remainingMinutesToEndOfRoute];
      id v12 = [(NavigationFeedbackCollector *)self feedbackCollector];
      [v12 setTimeBetweenParkedAndArrival:v11];
    }
    else
    {
      id v10 = [(NavigationFeedbackCollector *)self feedbackCollector];
      [v10 setTimeBetweenParkedAndArrival:-1.0];
    }

    double v15 = [(NavigationFeedbackCollector *)self lastLocation];
    unsigned int v16 = [(NavigationFeedbackCollector *)self feedbackCollector];
    [v16 setParkingDetectionLocation:v15];

    ++self->_parkedCount;
    goto LABEL_11;
  }
LABEL_12:
}

- (void)navSignView:(id)a3 didSelectAlternate:(unint64_t)a4 forPrimaryString:(BOOL)a5 inSign:(id)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  id v9[2] = sub_100B38474;
  v9[3] = &unk_101318B68;
  BOOL v12 = a5;
  id v10 = a6;
  unint64_t v11 = a4;
  id v8 = v10;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v9];
}

- (void)carManeuverView:(id)a3 didSelectAlternate:(unint64_t)a4 forPrimaryString:(BOOL)a5 inSign:(id)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  id v9[2] = sub_100B3852C;
  v9[3] = &unk_101318B68;
  BOOL v12 = a5;
  id v10 = a6;
  unint64_t v11 = a4;
  id v8 = v10;
  [(NavigationFeedbackCollector *)self _runAsyncBlockOnLocalQueue:v9];
}

- (NavigationAudioFeedbackCollector)audioFeedbackCollector
{
  return self->_audioFeedbackCollector;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (GEODirectionsFeedbackCollector)feedbackCollector
{
  return self->_feedbackCollector;
}

- (GEOComposedRouteStep)prevStep
{
  return self->_prevStep;
}

- (BOOL)isPlayingTrace
{
  return self->_isPlayingTrace;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)didArrive
{
  return self->_didArrive;
}

- (GEOLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (MNTrafficIncidentAlert)previousAlert
{
  return self->_previousAlert;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAlert, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_prevStep, 0);
  objc_storeStrong((id *)&self->_feedbackCollector, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_audioFeedbackCollector, 0);
  objc_storeStrong((id *)&self->_routingServiceErrors, 0);
  objc_storeStrong((id *)&self->_currentVehicle, 0);
  objc_storeStrong((id *)&self->_badTripCollector, 0);
  objc_storeStrong((id *)&self->_expectedFinalStateOfCharge, 0);
  objc_storeStrong((id *)&self->_initialStateOfCharge, 0);
  objc_storeStrong((id *)&self->_removedStopsDetails, 0);
  objc_storeStrong((id *)&self->_addedStopsDetails, 0);
  objc_storeStrong((id *)&self->_chargingSteps, 0);
  objc_storeStrong((id *)&self->_navigationStartTime, 0);
  objc_storeStrong((id *)&self->_modalitiesFeedback, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponse, 0);
  objc_storeStrong((id *)&self->_stepFeedback, 0);
  objc_storeStrong((id *)&self->_junctionViewEventsDisplayed, 0);
  objc_storeStrong((id *)&self->_guidance, 0);
  objc_storeStrong((id *)&self->_traceFileName, 0);

  objc_storeStrong((id *)&self->_responseID, 0);
}

@end