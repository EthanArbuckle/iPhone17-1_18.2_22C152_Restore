@interface MNTurnByTurnLocationTracker
- (BOOL)_allowRerouteForLocation:(id)a3;
- (BOOL)_allowRerouteForLocation:(id)a3 outError:(id *)a4;
- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4;
- (BOOL)_isLocation:(id)a3 nearOrigin:(id)a4;
- (BOOL)_isRoadFeatureInOppositeDirection:(id)a3 ofCoordinate:(id)a4 course:(double)a5;
- (BOOL)_rerouteReasonSupportsDowngradingToOffline:(unint64_t)a3;
- (BOOL)_shouldAdvanceGuidanceToRouteMatch:(id)a3;
- (BOOL)_tryOnlineOfflineSwitchingWithRequestParameters:(id)a3 rerouteReason:(unint64_t)a4 error:(id)a5 errorHandler:(id)a6;
- (BOOL)hasArrivedAtFinalDestination;
- (BOOL)isRerouting;
- (MNLocation)lastKnownGoodLocationOnRoute;
- (MNTurnByTurnLocationTracker)initWithNavigationSession:(id)a3;
- (id)_matchedLocationForLocation:(id)a3;
- (id)_matchedLocationForMatchResult:(id)a3 originalLocation:(id)a4;
- (id)_newMapMatcherForRoute:(id)a3;
- (id)_overrideLocationForLocation:(id)a3;
- (id)_rerouteRequestParametersForLocation:(id)a3 transportType:(int)a4;
- (id)_routeAttributesFromRouteCoordinate:(PolylineCoordinate)a3;
- (id)_trafficIncidentAlertUpdater;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (id)initForTestingWithRoute:(id)a3;
- (int)_detectedMotionForLocation:(id)a3;
- (int)_routeHintTypeForTransportType:(int)a3;
- (unint64_t)_modifiedStepIndexForMatchResult:(id)a3 matchType:(unint64_t)a4;
- (unint64_t)_offRouteRequestType;
- (void)_cancelPendingRerouteRequest;
- (void)_changeOfflineMode:(unsigned __int8)a3 reason:(unint64_t)a4 requestParameters:(id)a5 errorHandler:(id)a6;
- (void)_handleOffRouteForLocation:(id)a3;
- (void)_handleSuccessfulRerouteRequest:(id)a3 response:(id)a4 waypoints:(id)a5;
- (void)_handleWaypointRerouteForLocation:(id)a3;
- (void)_requestRerouteWithReason:(unint64_t)a3 requestHandler:(id)a4 completionHandler:(id)a5 errorHandler:(id)a6;
- (void)_requestRerouteWithReason:(unint64_t)a3 requestParameters:(id)a4 completionHandler:(id)a5 errorHandler:(id)a6;
- (void)_sendRouteHintForLocation:(id)a3;
- (void)_setIsNavigatingInLowGuidance:(BOOL)a3;
- (void)_updateForArrivalAtLegIndex:(unint64_t)a3;
- (void)_updateForDepartureFromLegIndex:(unint64_t)a3 withReason:(unint64_t)a4;
- (void)_updateForNewRoute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6;
- (void)_updateForNewTrafficIncidentAlerts:(id)a3;
- (void)_updateForNewTransportType:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6;
- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6;
- (void)_updateStateForLocation:(id)a3;
- (void)_updateSwitchTransportTypeForLocation:(id)a3;
- (void)advanceToNextLeg;
- (void)arrivalUpdater:(id)a3 didArriveAtEndOfLegIndex:(unint64_t)a4;
- (void)arrivalUpdater:(id)a3 didDepartFromLegIndex:(unint64_t)a4 withReason:(unint64_t)a5;
- (void)arrivalUpdater:(id)a3 didEnterPreArrivalStateForLegIndex:(unint64_t)a4;
- (void)arrivalUpdater:(id)a3 didTimeoutAtLegIndex:(unint64_t)a4 withReason:(unint64_t)a5;
- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)arrivalUpdater:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)arrivalUpdater:(id)a3 shouldShowChargingInfoForWaypoint:(id)a4;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)dealloc;
- (void)forceOnRoute:(id)a3 atLocation:(id)a4;
- (void)forceRerouteWithReason:(unint64_t)a3;
- (void)insertWaypoint:(id)a3 completionHandler:(id)a4;
- (void)offlineCoordinatorDidDetectOnline:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3 completionHandler:(id)a4;
- (void)reroute:(id)a3 reason:(unint64_t)a4;
- (void)rerouteWithWaypoints:(id)a3 completionHandler:(id)a4;
- (void)setNavigationSessionState:(id)a3;
- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
- (void)stopTracking;
- (void)switchToDestinationRoute;
- (void)traceJumpedInTime;
- (void)trafficIncidentAlertUpdater:(id)a3 didDismissAlert:(id)a4 withReroute:(BOOL)a5;
- (void)trafficIncidentAlertUpdater:(id)a3 didSwitchToNewRoute:(id)a4 forAlert:(id)a5;
- (void)trafficIncidentAlertUpdater:(id)a3 invalidatedAlert:(id)a4;
- (void)trafficIncidentAlertUpdater:(id)a3 receivedAlert:(id)a4 responseCallback:(id)a5;
- (void)trafficIncidentAlertUpdater:(id)a3 updatedAlert:(id)a4;
- (void)updateDestination:(id)a3 completionHandler:(id)a4;
- (void)updateForETAUResponse:(id)a3;
- (void)updateLocation:(id)a3;
- (void)updateRequestForETAUpdate:(id)a3;
@end

@implementation MNTurnByTurnLocationTracker

- (id)initForTestingWithRoute:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNTurnByTurnLocationTracker;
  v5 = [(MNLocationTracker *)&v11 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(MNTurnByTurnLocationTracker *)v5 _newMapMatcherForRoute:v4];
    mapMatcher = v6->_mapMatcher;
    v6->_mapMatcher = (GEONavigationMapMatcher *)v7;

    [(GEONavigationMapMatcher *)v6->_mapMatcher setRequiresRoadNetworkData:1];
    [(GEONavigationMapMatcher *)v6->_mapMatcher setShouldSnapRouteMatchToRoute:1];
    [(GEONavigationMapMatcher *)v6->_mapMatcher setShouldWaitForSnappedSegments:1];
    v6->_isNavigatingInLowGuidance = 0;
    v9 = v6;
  }

  return v6;
}

- (MNTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MNTurnByTurnLocationTracker;
  v5 = [(MNLocationTracker *)&v20 initWithNavigationSession:v4];
  if (v5)
  {
    v6 = [v4 routeManager];
    uint64_t v7 = [v6 currentRoute];
    uint64_t v8 = [(MNTurnByTurnLocationTracker *)v5 _newMapMatcherForRoute:v7];
    mapMatcher = v5->_mapMatcher;
    v5->_mapMatcher = (GEONavigationMapMatcher *)v8;

    [(GEONavigationMapMatcher *)v5->_mapMatcher setTargetLegIndex:0];
    [(GEONavigationMapMatcher *)v5->_mapMatcher setRequiresRoadNetworkData:1];
    v10 = [v4 traceManager];
    objc_super v11 = [v10 tracePlayer];
    v12 = [v11 trace];
    -[GEONavigationMapMatcher setIsSimulation:](v5->_mapMatcher, "setIsSimulation:", [v12 isSimulation]);

    v5->_isNavigatingInLowGuidance = 0;
    id v13 = objc_alloc(MEMORY[0x1E4F64818]);
    v14 = [(MNLocationTracker *)v5 _auditToken];
    uint64_t v15 = [v13 initWithRoute:v7 auditToken:v14];
    pathMatcher = v5->_pathMatcher;
    v5->_pathMatcher = (GEOPathMatcher *)v15;

    v17 = dispatch_get_global_queue(21, 0);
    GEORegisterPListStateCaptureLegacy();

    v5->_numOfflineAttempts = 0;
    v5->_numOnlineAttempts = 0;
    v18 = v5;
  }
  return v5;
}

- (void)dealloc
{
  [(GEODirectionsServiceRequest *)self->_pendingRequest cancel];
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)MNTurnByTurnLocationTracker;
  [(MNLocationTracker *)&v3 dealloc];
}

- (void)rerouteWithWaypoints:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__MNTurnByTurnLocationTracker_rerouteWithWaypoints_completionHandler___block_invoke;
  v8[3] = &unk_1E60F7FD8;
  id v9 = v6;
  id v7 = v6;
  [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:9 requestHandler:v8 completionHandler:a4 errorHandler:0];
}

void __70__MNTurnByTurnLocationTracker_rerouteWithWaypoints_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRequestType:8];
  [v3 setWaypoints:*(void *)(a1 + 32)];
}

- (void)insertWaypoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__MNTurnByTurnLocationTracker_insertWaypoint_completionHandler___block_invoke;
  v8[3] = &unk_1E60F7FD8;
  id v9 = v6;
  id v7 = v6;
  [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:7 requestHandler:v8 completionHandler:a4 errorHandler:0];
}

void __64__MNTurnByTurnLocationTracker_insertWaypoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRequestType:7];
  [v3 setWaypointModificationType:0];
  [v3 setWaypointToInsert:*(void *)(a1 + 32)];
}

- (void)removeWaypointAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__MNTurnByTurnLocationTracker_removeWaypointAtIndex_completionHandler___block_invoke;
  v4[3] = &__block_descriptor_40_e47_v16__0__GEODirectionsServiceRequestParameters_8l;
  v4[4] = a3;
  [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:8 requestHandler:v4 completionHandler:a4 errorHandler:0];
}

void __71__MNTurnByTurnLocationTracker_removeWaypointAtIndex_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRequestType:7];
  [v3 setWaypointModificationType:1];
  [v3 setWaypointIndexToRemove:*(void *)(a1 + 32)];
}

- (void)advanceToNextLeg
{
  if ([(MNLocationTracker *)self hasArrived]
    || self->_lastArrivalLegIndex != 0x7FFFFFFFFFFFFFFFLL
    || [(MNArrivalUpdater *)self->_arrivalUpdater isApproachingWaypoint]
    || [(MNArrivalUpdater *)self->_arrivalUpdater isInPreArrivalRegion])
  {
    arrivalUpdater = self->_arrivalUpdater;
    [(MNArrivalUpdater *)arrivalUpdater forceDepartureForCurrentLeg:1];
  }
  else
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "Manual advance to next leg ignored since the location tracker has already passed the arrival stage", v5, 2u);
    }
  }
}

- (void)updateDestination:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MNTurnByTurnLocationTracker_updateDestination_completionHandler___block_invoke;
  v8[3] = &unk_1E60F8020;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:6 requestHandler:v8 completionHandler:a4 errorHandler:0];
}

void __67__MNTurnByTurnLocationTracker_updateDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setRequestType:6];
  v9[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setWaypoints:v4];

  v5 = [*(id *)(a1 + 40) navigationSession];
  id v6 = [v5 routeManager];

  id v7 = [v6 originalDestination];
  LODWORD(a1) = v7 == *(void **)(a1 + 32);

  if (a1) {
    [v6 originalRoute];
  }
  else {
  uint64_t v8 = [v6 currentRoute];
  }
  [v3 setCurrentRoute:v8];
}

- (void)forceRerouteWithReason:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 0xE) {
      id v6 = @"Unknown";
    }
    else {
      id v6 = off_1E60F8258[a3 - 1];
    }
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Forcing reroute with reason %@.", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MNTurnByTurnLocationTracker_forceRerouteWithReason___block_invoke;
  v7[3] = &unk_1E60F8048;
  v7[4] = self;
  v7[5] = a3;
  [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:a3 requestHandler:v7 completionHandler:0 errorHandler:0];
}

void __54__MNTurnByTurnLocationTracker_forceRerouteWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (*(void *)(a1 + 40) == 11)
  {
    uint64_t v4 = 11;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) _offRouteRequestType];
    id v3 = v5;
  }
  [v3 setRequestType:v4];
}

- (void)reroute:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  [(MNTurnByTurnLocationTracker *)self _cancelPendingRerouteRequest];
  [(MNTurnByTurnLocationTracker *)self _updateForNewRoute:v6 rerouteReason:a4 request:0 response:0];
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(MNLocationTracker *)self transportType] == v4)
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v4 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v8 = off_1E60F8220[(int)v4];
      }
      *(_DWORD *)buf = 138412290;
      double v31 = *(double *)&v8;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Requested to change transport type to %@, but we are already navigating using that transport type.", buf, 0xCu);
    }
LABEL_35:

    return;
  }
  if (v4 > 3 || v4 == 1)
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if v4 < 7 && ((0x73u >> v4))
      {
        uint64_t v10 = off_1E60F81C8[(int)v4];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      double v31 = *(double *)&v10;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Requested to change transport type to %@, but only driving, walking, and cycling are supported.", buf, 0xCu);
    }
    goto LABEL_35;
  }
  GEOFindOrCreateLog();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = off_1E60F8200[(int)v4];
    v12 = [v6 uniqueRouteID];
    *(_DWORD *)buf = 138412546;
    double v31 = *(double *)&v11;
    __int16 v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "Changing to transport type: %@ | %@", buf, 0x16u);
  }
  if (v6)
  {
    if ([v6 transportType] == v4)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F64660]);
      v14 = [(MNLocationTracker *)self lastMatchedLocation];
      uint64_t v15 = (void *)[v13 initWithCLLocation:v14 course:-1.0];

      v16 = (void *)[objc_alloc(MEMORY[0x1E4F649E0]) initWithRoute:v6 auditToken:0];
      v17 = [v16 matchToRouteWithLocation:v15];
      [v17 distanceFromRoute];
      double v19 = v18;
      objc_super v20 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v31 = v19;
        _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEFAULT, "Current location distance from provided route is %0.1f meters. Ignoring provided route and requesting new one.", buf, 0xCu);
      }

      GEOConfigGetDouble();
      if (v19 > v21)
      {
        v22 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_DEFAULT, "Current location is too far from provided route. Requesting new route.", buf, 2u);
        }

        id v6 = 0;
      }

      if (v6)
      {
        v23 = [[MNActiveRouteInfo alloc] initWithRoute:v6];
        [(MNTurnByTurnLocationTracker *)self _updateForNewRoute:v23 rerouteReason:5 request:0 response:0];

        return;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = off_1E60F8200[(int)v4];
        uint64_t v26 = [v6 transportType];
        if (v26 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = off_1E60F8220[(int)v26];
        }
        *(_DWORD *)buf = 138412546;
        double v31 = *(double *)&v25;
        __int16 v32 = 2112;
        v33 = v27;
        _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_ERROR, "Changing transport type to %@, but provided route is of transport type %@. Ignoring route.", buf, 0x16u);
      }
    }
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__MNTurnByTurnLocationTracker_changeTransportType_route___block_invoke;
  v28[3] = &unk_1E60F8070;
  int v29 = v4;
  v28[4] = self;
  [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:5 requestHandler:v28 completionHandler:0 errorHandler:0];
}

void __57__MNTurnByTurnLocationTracker_changeTransportType_route___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setRequestType:9];
  [v5 setTransportType:*(unsigned int *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) navigationSessionState];
  uint64_t v4 = [v3 arrivalState];

  [v5 setHasArrived:(v4 & 0xFFFFFFFFFFFFFFFDLL) == 4];
}

- (void)switchToDestinationRoute
{
  id v3 = [(MNLocationTracker *)self navigationSessionState];
  uint64_t v4 = [v3 destination];
  id v5 = [v4 route];

  id v6 = MNGetMNLocationTrackerLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "switchToDestinationRoute", buf, 2u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke;
    v18[3] = &unk_1E60F8098;
    uint64_t v8 = v5;
    double v19 = v8;
    objc_super v20 = self;
    id v9 = (void (**)(void, void))MEMORY[0x1BA99B3A0](v18);
    if ([v8 isNavigable])
    {
      ((void (**)(void, NSObject *))v9)[2](v9, v8);
    }
    else
    {
      uint64_t v10 = MNGetMNLocationTrackerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, "destination route is not navigable, attempting convertToNavigableRoute:.", buf, 2u);
      }

      objc_super v11 = objc_opt_new();
      [v11 setCurrentRoute:v8];
      v12 = [(MNLocationTracker *)self navigationSession];
      id v13 = [v12 routeManager];
      v14 = [v13 routeAttributes];
      [v11 setRouteAttributes:v14];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke_31;
      v16[3] = &unk_1E60F80C0;
      v17 = v9;
      id v15 = +[MNRouteEditor convertToNavigableRoute:v11 finishedHandler:v16];
    }
    id v7 = v19;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "switchToDestinationRoute called but there is no destination route.", buf, 2u);
  }
}

void __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke(uint64_t a1)
{
  id v6 = [[MNActiveRouteInfo alloc] initWithRoute:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 32) routeInitializerData];
  id v3 = [v2 directionsRequest];

  uint64_t v4 = [*(id *)(a1 + 32) routeInitializerData];
  id v5 = [v4 directionsResponse];

  [*(id *)(a1 + 40) _updateForNewRoute:v6 rerouteReason:12 request:v3 response:v5];
}

void __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v8 = MNGetMNLocationTrackerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Error converting destination route to navigable route: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Should not be called anymore. Pending removal.", v3, 2u);
  }
}

- (void)_changeOfflineMode:(unsigned __int8)a3 reason:(unint64_t)a4 requestParameters:(id)a5 errorHandler:(id)a6
{
  int v7 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v26 = a6;
  unsigned __int8 v10 = [MEMORY[0x1E4F647B8] activeStateForCohortId:*MEMORY[0x1E4F64320]];
  uint64_t v11 = MNGetMNLocationTrackerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    GEOOfflineModeAsString();
    v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    GEOOfflineStateAsString();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = [(MNLocationTracker *)self navigationSessionState];
    a6 = [v14 currentRouteInfo];
    id v15 = [a6 route];
    *(_DWORD *)buf = 138412802;
    int v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 1024;
    int v33 = [v15 isOfflineRoute];
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Requesting changeOfflineMode to '%@'. Current offline state is '%@'. Current route is offline: %d", buf, 0x1Cu);
  }
  if (a4 != 15) {
    goto LABEL_5;
  }
  v16 = [(MNLocationTracker *)self navigationSessionState];
  a6 = [v16 currentRouteInfo];
  v17 = [a6 route];
  char v18 = [v17 isOfflineRoute];

  if ((v18 & 1) == 0)
  {
    v25 = MNGetMNLocationTrackerLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v29 = @"UpgradeOfflineToOnline";
      _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_ERROR, "Attempted to switch to online route with reroute reason %@, but we already have an online route.", buf, 0xCu);
    }
  }
  else
  {
LABEL_5:
    if (v7 == v10)
    {
      MNGetMNLocationTrackerLog();
      a6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)a6, OS_LOG_TYPE_ERROR))
      {
        GEOOfflineStateAsString();
        double v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        int v29 = v19;
        _os_log_impl(&dword_1B542B000, (os_log_t)a6, OS_LOG_TYPE_ERROR, "GEOOfflineService reports offline state is already '%@', but proceeding with reroute anyway.", buf, 0xCu);
      }
    }
    objc_super v20 = [v9 traits];
    double v21 = v20;
    if (!v20)
    {
      a6 = [MEMORY[0x1E4F64710] sharedService];
      double v21 = [a6 defaultTraits];
    }
    [v9 setTraits:v21];
    if (!v20)
    {
    }
    v22 = [v9 traits];
    v23 = v22;
    if (v7 == 1) {
      uint64_t v24 = 3;
    }
    else {
      uint64_t v24 = 4;
    }
    [v22 setRequestMode:v24];

    [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:a4 requestParameters:v9 completionHandler:0 errorHandler:v26];
  }
}

- (void)updateRequestForETAUpdate:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MNTurnByTurnLocationTracker;
  [(MNLocationTracker *)&v5 updateRequestForETAUpdate:v4];
  [(MNTrafficIncidentAlertUpdater *)self->_trafficIncidentAlertUpdater updateIncidentResultForETARequest:v4];
}

- (void)updateForETAUResponse:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  v50 = [v49 request];
  id v4 = [v49 response];
  v52 = [v49 error];
  objc_super v5 = [(MNLocationTracker *)self navigationSession];
  id v6 = [v5 traceManager];
  int v7 = [v6 traceRecorder];

  v51 = v7;
  [v7 timeSinceRecordingBegan];
  double v9 = v8;
  [v49 responseTime];
  double v11 = v10;
  v12 = [(MNLocationTracker *)self navigationSession];
  id v13 = [v12 destination];
  v14 = [v13 navDisplayName];
  [v51 recordETAURequest:v50 response:v4 error:v52 destinationName:v14 requestTimestamp:v9 - v11 responseTimestamp:v9];

  uint64_t Integer = GEOConfigGetInteger();
  if (Integer || !v52 && ![v4 status])
  {
    v16 = [(MNLocationTracker *)self navigationSession];
    v17 = [v16 routeManager];
    char v18 = [v17 allRoutes];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v54 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          [v23 setAlternateRouteIndex:0x7FFFFFFFFFFFFFFFLL];
          [v23 setEtaResponse:v4];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v20);
    }

    if ([v4 status] && Integer)
    {
      uint64_t v24 = [(MNLocationTracker *)self navigationSession];
      v25 = [v24 routeManager];
      id v26 = [v25 currentRoute];

      v27 = [v26 geoETAWaypointRoute];
      if (v27) {
        [v4 setWaypointRoute:v27];
      }
    }
    else if (!Integer)
    {
LABEL_24:
      v45 = [(MNLocationTracker *)self navigationSession];
      v46 = [v45 routeManager];
      v47 = [v46 currentRouteInfo];

      v48 = [(MNLocationTracker *)self safeDelegate];
      [v48 locationTracker:self didUpdateETAForRoute:v47];

      goto LABEL_25;
    }
    v28 = [(MNLocationTracker *)self navigationSession];
    int v29 = [v28 routeManager];
    __int16 v30 = [v29 currentRouteInfo];

    id v31 = [(MNLocationTracker *)self lastMatchedLocation];
    if (!v31) {
      goto LABEL_22;
    }
    __int16 v32 = [(MNLocationTracker *)self lastMatchedLocation];
    int v33 = [v32 routeMatch];
    BOOL v34 = v33 == 0;

    if (v34)
    {
LABEL_22:
      uint64_t v40 = 0;
    }
    else
    {
      v35 = [(MNLocationTracker *)self lastMatchedLocation];
      v36 = [v35 routeMatch];

      v37 = [v30 route];
      objc_msgSend(v37, "distanceToEndFromRouteCoordinate:", objc_msgSend(v36, "routeCoordinate"));
      double v39 = v38;

      uint64_t v40 = v39;
    }
    v41 = [(MNLocationTracker *)self navigationSession];
    v42 = [v41 routeManager];
    v43 = [v42 alternateRoutes];
    v44 = [v43 firstObject];
    [v4 addFakeTrafficIncidentAlert:Integer mainRouteInfo:v30 alternateRouteInfo:v44 currentDistance:v40];

    goto LABEL_24;
  }
  double v19 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_DEBUG, "Return from updateForETAUResponse without updating ETA due to error in response from Routing\n", buf, 2u);
  }
LABEL_25:
}

- (BOOL)_isLocation:(id)a3 nearOrigin:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "_navigation_geoCoordinate3D");
      [v7 coordinate];
      GEOCalculateDistance();
      double v9 = v8;
      GEOConfigGetDouble();
      BOOL v11 = v9 < v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)_updateStateForLocation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MNLocationTracker *)self state];
  switch([(MNLocationTracker *)self state])
  {
    case 0:
      int v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = "-[MNTurnByTurnLocationTracker _updateStateForLocation:]";
        __int16 v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
        __int16 v23 = 1024;
        int v24 = 441;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
      }

      break;
    case 1:
      uint64_t v8 = [v4 state];
      if (v8)
      {
        if (v8 == 2)
        {
          id v18 = 0;
          BOOL v14 = [(MNTurnByTurnLocationTracker *)self _allowRerouteForLocation:v4 outError:&v18];
          id v15 = v18;
          if (v14)
          {
            uint64_t v5 = 4;
          }
          else
          {
            v16 = [(MNLocationTracker *)self safeDelegate];
            [v16 locationTracker:self didSuppressReroute:v15];

            uint64_t v5 = 1;
          }
        }
        else if (v8 == 1)
        {
          uint64_t v5 = 2;
        }
        else
        {
          uint64_t v5 = v5;
        }
      }
      else
      {
        uint64_t v5 = 1;
      }
      break;
    case 2:
    case 3:
    case 4:
      uint64_t v6 = [v4 state];
      if (v6)
      {
        if (v6 == 2)
        {
          id v17 = 0;
          BOOL v9 = [(MNTurnByTurnLocationTracker *)self _allowRerouteForLocation:v4 outError:&v17];
          id v10 = v17;
          if (v9)
          {
            uint64_t v5 = 4;
          }
          else
          {
            id v13 = [(MNLocationTracker *)self safeDelegate];
            [v13 locationTracker:self didSuppressReroute:v10];

            uint64_t v5 = 3;
          }
        }
        else if (v6 == 1)
        {
          self->_consecutiveOffRouteCount = 0;
          uint64_t v5 = 2;
        }
      }
      else
      {
        unint64_t v11 = self->_consecutiveOffRouteCount + 1;
        self->_consecutiveOffRouteCount = v11;
        if (v11 < 5 && v5 == 2) {
          uint64_t v5 = 2;
        }
        else {
          uint64_t v5 = 3;
        }
      }
      break;
    case 5:
    case 8:
      if ([v4 state] == 1)
      {
        if (self->_rerouteReason == 1) {
          uint64_t v5 = 2;
        }
        else {
          uint64_t v5 = v5;
        }
      }
      break;
    default:
      break;
  }
  [(MNLocationTracker *)self _setState:v5];
}

- (void)_updateSwitchTransportTypeForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MNCarPlayConnectionMonitor sharedInstance];
  char v6 = [v5 isConnected];

  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [(MNTurnByTurnLocationTracker *)self _detectedMotionForLocation:v4];
  }
  BOOL v8 = [(MNTurnByTurnLocationTracker *)self isRerouting];
  char v9 = v7 == 4 || v8;
  if ((v9 & 1) == 0 && [(MNLocationTracker *)self transportType] != v7)
  {
    id v10 = [v4 routeMatch];
    unint64_t v11 = [v10 step];

    if ([v11 transportType] != 5)
    {
      id v17 = [v4 routeMatch];
      unint64_t v12 = [v17 legIndex];
      id v13 = [v4 routeMatch];
      BOOL v14 = [v13 route];
      id v15 = [v14 legs];
      unint64_t v16 = [v15 count] - 1;

      if (v12 >= v16
        && ((v6 & 1) != 0
         || [(MNTurnByTurnLocationTracker *)self _allowSwitchToTransportType:v7 forLocation:v4]))
      {
        if (GEOConfigGetBOOL())
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __69__MNTurnByTurnLocationTracker__updateSwitchTransportTypeForLocation___block_invoke;
          v18[3] = &__block_descriptor_36_e47_v16__0__GEODirectionsServiceRequestParameters_8l;
          int v19 = v7;
          [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:5 requestHandler:v18 completionHandler:0 errorHandler:0];
        }
      }
    }
  }
}

void __69__MNTurnByTurnLocationTracker__updateSwitchTransportTypeForLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRequestType:4];
  [v3 setTransportType:*(unsigned int *)(a1 + 32)];
}

- (BOOL)_shouldAdvanceGuidanceToRouteMatch:(id)a3
{
  id v4 = a3;
  if ([v4 isGoodMatch]) {
    BOOL v5 = ![(MNLocationTracker *)self hasArrived];
  }
  else {
    LOBYTE(v5) = 0;
  }
  char v6 = [(MNLocation *)self->_lastKnownGoodLocationOnRoute routeMatch];

  if (v6)
  {
    uint64_t v7 = [(MNLocation *)self->_lastKnownGoodLocationOnRoute routeMatch];
    [v7 routeCoordinate];
    [v4 routeCoordinate];
    uint64_t v8 = GEOPolylineCoordinateCompare();

    if (v8 != -1) {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (unint64_t)_modifiedStepIndexForMatchResult:(id)a3 matchType:(unint64_t)a4
{
  char v6 = [a3 routeMatch];
  int v7 = [(MNLocationTracker *)self transportType];
  if ((!v7 || v7 == 3) && [(MNLocationTracker *)self hasArrived])
  {
    uint64_t v8 = [v6 route];
    char v9 = [v8 legs];
    id v10 = [v9 objectAtIndexedSubscript:self->_lastArrivalLegIndex];

    unint64_t v11 = [v6 route];
    unint64_t v12 = [v11 steps];
    id v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "endStepIndex"));

    unint64_t v14 = [v13 stepIndex];
LABEL_16:

    goto LABEL_17;
  }
  if (!a4)
  {
    unint64_t v20 = [v6 legIndex];
    if (v20 >= [(MNLocationTracker *)self targetLegIndex]) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v15 = [v6 route];
  unint64_t v16 = [(MNLocationTracker *)self lastMatchedLocation];
  id v17 = [v16 routeMatch];
  id v18 = [v17 route];

  if (v15 == v18)
  {
    id v10 = [(MNLocationTracker *)self lastMatchedLocation];
    uint64_t v21 = [v10 stepIndex];
LABEL_15:
    unint64_t v14 = v21;
    goto LABEL_16;
  }
  int v19 = [(MNLocationTracker *)self lastMatchedLocation];
  if (!v19)
  {
    uint64_t v22 = [v6 legIndex];
    if (v22 == [(MNLocationTracker *)self targetLegIndex]) {
      goto LABEL_13;
    }
LABEL_14:
    __int16 v23 = [v6 route];
    int v24 = [v23 legs];
    id v10 = objc_msgSend(v24, "objectAtIndexedSubscript:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));

    uint64_t v21 = [v10 startStepIndex];
    goto LABEL_15;
  }

LABEL_13:
  unint64_t v14 = [v6 stepIndex];
LABEL_17:

  return v14;
}

- (id)_matchedLocationForMatchResult:(id)a3 originalLocation:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    unint64_t v20 = 0;
    goto LABEL_46;
  }
  uint64_t v8 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = [v7 uuid];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNTurnByTurnLocationTracker::_matchedLocationForMatchResult:originalLocation:", buf, 0xCu);
  }
  uint64_t v10 = [v6 type];
  unint64_t v11 = [v6 routeMatch];
  v58 = [v6 roadMatch];
  int v12 = [(MNLocationTracker *)self transportType];
  if (v12)
  {
    if (v12 == 2)
    {
      uint64_t BOOL = GEOConfigGetBOOL();
      goto LABEL_14;
    }
    if (v12 != 3)
    {
      uint64_t BOOL = 0;
      goto LABEL_14;
    }
  }
  unsigned int v13 = GEOConfigGetBOOL();
  uint64_t v14 = [v6 type];
  BOOL v15 = [(MNLocationTracker *)self hasArrived];
  unint64_t v16 = [v11 step];
  BOOL v17 = v14 == 2;
  LODWORD(v14) = [v16 routeSegmentType] == 3;

  int v18 = v14 | v15 | v17;
  if (v18) {
    uint64_t BOOL = v13;
  }
  else {
    uint64_t BOOL = 2;
  }
  [v11 setShouldProjectLocationAlongRoute:v18 ^ 1u];
LABEL_14:
  if ([(MNLocationTracker *)self targetLegIndex] != 0x7FFFFFFFFFFFFFFFLL && !v10)
  {
    unint64_t v21 = [v11 legIndex];
    if (v21 <= [(MNLocationTracker *)self targetLegIndex])
    {
      uint64_t v10 = 0;
    }
    else if (v58)
    {
      uint64_t v10 = 1;
    }
    else
    {
      id v22 = objc_alloc(MEMORY[0x1E4F64988]);
      [v11 locationCoordinate3D];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      [v11 matchedCourse];
      uint64_t v30 = objc_msgSend(v22, "initWithCoordinateOnRoad:courseOnRoad:", v24, v26, v28, v29);
      uint64_t v10 = 1;
      v58 = (void *)v30;
    }
  }
  objc_msgSend(v11, "setStepIndex:", -[MNTurnByTurnLocationTracker _modifiedStepIndexForMatchResult:matchType:](self, "_modifiedStepIndexForMatchResult:matchType:", v6, v10));
  switch(v10)
  {
    case 2:
      id v33 = 0;
      unint64_t v20 = [[MNLocation alloc] initWithRawLocation:v7 locationMatchType:BOOL];
      [(MNLocation *)v20 setRouteMatch:v11];
      break;
    case 1:
      v41 = [v58 roadFeature];
      id v59 = 0;
      [(MNLocationTracker *)self _roadFeaturesForFeature:v41 outRoadName:&v59 outShieldText:0 outShieldType:0];
      id v33 = v59;
      unint64_t v20 = [[MNLocation alloc] initWithRoadMatch:v58 rawLocation:v7 locationMatchType:BOOL];
      [(MNLocation *)v20 setRouteMatch:v11];
      [(MNLocation *)v20 setRoadName:v33];
      if (v41)
      {
        [v58 coordinateOnRoad];
        double v43 = v42;
        double v45 = v44;
        [v58 courseOnRoad];
        if (-[MNTurnByTurnLocationTracker _isRoadFeatureInOppositeDirection:ofCoordinate:course:](self, "_isRoadFeatureInOppositeDirection:ofCoordinate:course:", v41, v43, v45, v46))
        {
          unsigned int v47 = [v41 reverseDirectionDisplaySpeedLimit];
        }
        else
        {
          unsigned int v47 = [v41 displaySpeedLimit];
        }
        [(MNLocation *)v20 setSpeedLimit:v47];
        -[MNLocation setSpeedLimitIsMPH:](v20, "setSpeedLimitIsMPH:", [v41 displaySpeedLimitIsMPH]);
        -[MNLocation setSpeedLimitShieldType:](v20, "setSpeedLimitShieldType:", [v41 speedLimitShieldId]);
        id v34 = v41;
      }
      else
      {
        [(MNLocation *)v20 setSpeedLimit:0];
        id v34 = 0;
      }
LABEL_42:

      break;
    case 0:
      *(void *)buf = 0;
      id v31 = [v11 road];
      __int16 v32 = [v31 feature];

      id v60 = 0;
      id v61 = 0;
      [(MNLocationTracker *)self _roadFeaturesForFeature:v32 outRoadName:&v61 outShieldText:&v60 outShieldType:buf];
      id v33 = v61;
      id v34 = v60;
      unint64_t v20 = [[MNLocation alloc] initWithRouteMatch:v11 rawLocation:v7 locationMatchType:BOOL];
      [(MNLocation *)v20 setRoadName:v33];
      [(MNLocation *)v20 setShieldText:v34];
      [(MNLocation *)v20 setShieldType:*(void *)buf];
      if (v32)
      {
        [v11 locationCoordinate];
        double v36 = v35;
        double v38 = v37;
        [v11 matchedCourse];
        if (-[MNTurnByTurnLocationTracker _isRoadFeatureInOppositeDirection:ofCoordinate:course:](self, "_isRoadFeatureInOppositeDirection:ofCoordinate:course:", v32, v36, v38, v39))
        {
          unsigned int v40 = [v32 reverseDirectionDisplaySpeedLimit];
        }
        else
        {
          unsigned int v40 = [v32 displaySpeedLimit];
        }
        [(MNLocation *)v20 setSpeedLimit:v40];
        -[MNLocation setSpeedLimitIsMPH:](v20, "setSpeedLimitIsMPH:", [v32 displaySpeedLimitIsMPH]);
        -[MNLocation setSpeedLimitShieldType:](v20, "setSpeedLimitShieldType:", [v32 speedLimitShieldId]);
      }
      else
      {
        [(MNLocation *)v20 setSpeedLimit:0];
      }
      v48 = [(MNLocation *)v20 routeMatch];
      BOOL v49 = [(MNTurnByTurnLocationTracker *)self _shouldAdvanceGuidanceToRouteMatch:v48];

      if (v49)
      {
        p_lastKnownGoodLocationOnRoute = &self->_lastKnownGoodLocationOnRoute;
        objc_storeStrong((id *)p_lastKnownGoodLocationOnRoute, v20);
        v51 = [(MNLocation *)*p_lastKnownGoodLocationOnRoute routeMatch];
        BOOL v52 = v51 == 0;

        if (!v52)
        {
          long long v53 = [(MNLocation *)v20 routeMatch];
          long long v54 = [(MNLocation *)*p_lastKnownGoodLocationOnRoute routeMatch];
          objc_msgSend(v53, "setRouteCoordinate:", objc_msgSend(v54, "routeCoordinate"));
        }
      }

      goto LABEL_42;
    default:
      id v33 = 0;
      unint64_t v20 = 0;
      break;
  }
  -[MNLocation setTraceIndex:](v20, "setTraceIndex:", [v7 traceIndex]);
  long long v55 = [v6 detailedMatchInfo];
  [(MNLocation *)v20 setDetailedMatchInfo:v55];

  if (GEOConfigGetBOOL())
  {
    long long v56 = [v7 uuid];
    [(MNLocation *)v20 setUuid:v56];
  }
LABEL_46:

  return v20;
}

- (BOOL)hasArrivedAtFinalDestination
{
  v10.receiver = self;
  v10.super_class = (Class)MNTurnByTurnLocationTracker;
  if (![(MNLocationTracker *)&v10 hasArrived]) {
    return 0;
  }
  unint64_t lastArrivalLegIndex = self->_lastArrivalLegIndex;
  id v4 = [(MNLocationTracker *)self navigationSession];
  BOOL v5 = [v4 routeManager];
  id v6 = [v5 currentRoute];
  id v7 = [v6 legs];
  BOOL v8 = lastArrivalLegIndex >= [v7 count] - 1;

  return v8;
}

- (BOOL)_isRoadFeatureInOppositeDirection:(id)a3 ofCoordinate:(id)a4 course:(double)a5
{
  id v5 = a3;
  if (v5) {
    GEOMultiSectionFeaturePoints();
  }

  return 0;
}

- (int)_routeHintTypeForTransportType:(int)a3
{
  if ((a3 - 1) > 5) {
    return 1;
  }
  else {
    return dword_1B5542B98[a3 - 1];
  }
}

- (void)_sendRouteHintForLocation:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  if (([(MNLocationTracker *)self navigationCapabilities] & 8) != 0)
  {
    BOOL v52 = self;
    if (v53 && [v53 state] == 1)
    {
      BOOL v49 = [v53 routeMatch];
      v48 = [v49 route];
      [v53 speed];
      double v5 = 25.0;
      if (v4 * 20.0 > 25.0)
      {
        [v53 speed];
        double v5 = v6 * 20.0;
      }
      uint64_t v7 = [v49 routeCoordinate];
      v50 = -[GEOPathMatcher matchedSegmentsFromStart:toEnd:](self->_pathMatcher, "matchedSegmentsFromStart:toEnd:", v7, [v48 routeCoordinateForDistance:v7 afterRouteCoordinate:v5]);
      if ([v50 count])
      {
        BOOL v8 = [v49 step];
        unsigned int v9 = [v8 transportType];

        objc_super v10 = GEOFindOrCreateLog();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

        if (v11)
        {
          int v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v50, "count") + 1);
          unsigned int v13 = objc_msgSend(NSString, "stringWithFormat:", @"Sending %d route hints: ", objc_msgSend(v50, "count"));
          [v12 addObject:v13];

          long long v56 = v12;
        }
        else
        {
          long long v56 = 0;
        }
        unint64_t v15 = [v50 count];
        if (v15)
        {
          if (v15 > 0x666666666666666) {
            std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v14 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLMapsRouteHint>>(v15);
          BOOL v17 = &v14[5 * v16];
        }
        else
        {
          uint64_t v14 = 0;
          BOOL v17 = 0;
        }
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = v50;
        uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
        unsigned int v51 = v9;
        if (v18)
        {
          uint64_t v55 = *(void *)v58;
          int v19 = v14;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v58 != v55) {
                objc_enumerationMutation(obj);
              }
              unint64_t v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              if ([v21 pointCount])
              {
                [v21 locationCoordinateAt:0];
                uint64_t v23 = v22;
                uint64_t v25 = v24;
                objc_msgSend(v21, "locationCoordinateAt:", objc_msgSend(v21, "pointCount") - 1);
                uint64_t v27 = v26;
                uint64_t v29 = v28;
                uint64_t v30 = [v21 road];
                uint64_t v31 = [v30 roadID];

                if (v19 >= v17)
                {
                  unint64_t v32 = 0xCCCCCCCCCCCCCCCDLL * (v19 - v14) + 1;
                  if (v32 > 0x666666666666666) {
                    std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x999999999999999ALL * (v17 - v14) > v32) {
                    unint64_t v32 = 0x999999999999999ALL * (v17 - v14);
                  }
                  if (0xCCCCCCCCCCCCCCCDLL * (v17 - v14) >= 0x333333333333333) {
                    unint64_t v33 = 0x666666666666666;
                  }
                  else {
                    unint64_t v33 = v32;
                  }
                  if (v33) {
                    unint64_t v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLMapsRouteHint>>(v33);
                  }
                  else {
                    uint64_t v34 = 0;
                  }
                  double v35 = (uint64_t *)(v33 + 8 * (v19 - v14));
                  uint64_t *v35 = v31;
                  v35[1] = v23;
                  v35[2] = v25;
                  v35[3] = v27;
                  v35[4] = v29;
                  if (v19 == v14)
                  {
                    double v39 = (uint64_t *)(v33 + 8 * (v19 - v14));
                  }
                  else
                  {
                    unint64_t v36 = v33 + 8 * (v19 - v14);
                    do
                    {
                      long long v37 = *(_OWORD *)(v19 - 5);
                      long long v38 = *(_OWORD *)(v19 - 3);
                      double v39 = (uint64_t *)(v36 - 40);
                      *(void *)(v36 - 8) = *(v19 - 1);
                      *(_OWORD *)(v36 - 24) = v38;
                      *(_OWORD *)(v36 - 40) = v37;
                      v19 -= 5;
                      v36 -= 40;
                    }
                    while (v19 != v14);
                  }
                  BOOL v17 = (uint64_t *)(v33 + 40 * v34);
                  int v19 = v35 + 5;
                  if (v14) {
                    operator delete(v14);
                  }
                  uint64_t v14 = v39;
                }
                else
                {
                  *int v19 = v31;
                  v19[1] = v23;
                  v19[2] = v25;
                  v19[3] = v27;
                  v19[4] = v29;
                  v19 += 5;
                }
                if (v56)
                {
                  unsigned int v40 = NSString;
                  v41 = [v21 road];
                  uint64_t v42 = [v41 roadID];
                  [v21 startRouteCoordinate];
                  double v43 = GEOPolylineCoordinateAsShortString();
                  [v21 endRouteCoordinate];
                  double v44 = GEOPolylineCoordinateAsShortString();
                  double v45 = [v40 stringWithFormat:@"%llu | [%@] %f, %f to [%@] %f, %f", v42, v43, v23, v25, v44, v27, v29];
                  [v56 addObject:v45];
                }
              }
            }
            uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
          }
          while (v18);
        }

        GEOFindOrCreateLog();
        double v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v47 = [v56 componentsJoinedByString:@"\n\t"];
          *(_DWORD *)buf = 138477827;
          v62 = v47;
          _os_log_impl(&dword_1B542B000, v46, OS_LOG_TYPE_DEBUG, "%{private}@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v14 = 0;
        unsigned int v51 = 4;
      }
    }
    else
    {
      uint64_t v14 = 0;
      unsigned int v51 = 4;
    }
    [(MNTurnByTurnLocationTracker *)v52 _routeHintTypeForTransportType:[(MNLocationTracker *)v52 transportType]];
    [(MNTurnByTurnLocationTracker *)v52 _routeHintTypeForTransportType:v51];
    CLSetMapMatchingRouteHint();
    if (v14) {
      operator delete(v14);
    }
  }
}

- (BOOL)_rerouteReasonSupportsDowngradingToOffline:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFF7) == 1;
}

- (BOOL)_tryOnlineOfflineSwitchingWithRequestParameters:(id)a3 rerouteReason:(unint64_t)a4 error:(id)a5 errorHandler:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ((objc_msgSend(v11, "_geo_isNetworkError") & 1) == 0) {
    goto LABEL_24;
  }
  if ([(MNTurnByTurnLocationTracker *)self _rerouteReasonSupportsDowngradingToOffline:a4])
  {
    unint64_t numOfflineAttempts = self->_numOfflineAttempts;
    if (numOfflineAttempts >= GEOConfigGetUInteger())
    {
      self->_unint64_t numOfflineAttempts = 0;
    }
    else if ([MEMORY[0x1E4F647B8] activeStateForCohortId:*MEMORY[0x1E4F64320]] == 1)
    {
      ++self->_numOfflineAttempts;
      uint64_t v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEFAULT, "Will try downgrading to Offline state because of network error in the previously requested reroute to Routing.", (uint8_t *)&v23, 2u);
      }

      [(MNTurnByTurnLocationTracker *)self _changeOfflineMode:2 reason:a4 requestParameters:v10 errorHandler:v12];
      BOOL v15 = 1;
      goto LABEL_25;
    }
  }
  if (a4 != 15) {
    goto LABEL_24;
  }
  unint64_t numOnlineAttempts = self->_numOnlineAttempts;
  if (numOnlineAttempts >= GEOConfigGetUInteger())
  {
    BOOL v15 = 0;
    self->_unint64_t numOnlineAttempts = 0;
    goto LABEL_25;
  }
  __int16 v17 = [MEMORY[0x1E4F647B8] activeStateForCohortId:*MEMORY[0x1E4F64320]];
  int v18 = v17;
  if (v17 < 2u) {
    goto LABEL_24;
  }
  if (v17 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v23 = 67109120;
      int v24 = v18;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v23, 8u);
    }
    goto LABEL_24;
  }
  int v19 = HIBYTE(v17);
  if (HIBYTE(v17) >= 2u)
  {
    if (HIBYTE(v17) != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v23 = 67109120;
        int v24 = v19;
        _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v23, 8u);
      }
      goto LABEL_18;
    }
LABEL_24:
    BOOL v15 = 0;
    goto LABEL_25;
  }
LABEL_18:
  ++self->_numOnlineAttempts;
  unint64_t v20 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEFAULT, "Will try another attempt to switch to Online because of network error in the previous request.", (uint8_t *)&v23, 2u);
  }

  BOOL v15 = 1;
  [(MNTurnByTurnLocationTracker *)self _changeOfflineMode:1 reason:15 requestParameters:v10 errorHandler:v12];
LABEL_25:

  return v15;
}

- (void)_requestRerouteWithReason:(unint64_t)a3 requestParameters:(id)a4 completionHandler:(id)a5 errorHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v27 = a5;
  id v11 = a6;
  [(GEODirectionsServiceRequest *)self->_pendingRequest cancel];
  pendingRequest = self->_pendingRequest;
  self->_pendingRequest = 0;

  if (([(MNLocationTracker *)self navigationCapabilities] & 2) != 0)
  {
    self->_rerouteReason = a3;
    self->_unint64_t numOfflineAttempts = 0;
    self->_unint64_t numOnlineAttempts = 0;
    if (a3 != 15)
    {
      uint64_t v14 = [(MNLocationTracker *)self safeDelegate];
      [v14 locationTrackerWillReroute:self];
    }
    -[MNLocationTracker _setState:](self, "_setState:", 5, v27);
    BOOL v15 = [(MNLocationTracker *)self navigationSession];
    uint64_t v16 = [v15 traceManager];
    __int16 v17 = [v16 traceRecorder];

    [v17 timeSinceRecordingBegan];
    uint64_t v19 = v18;
    unint64_t v20 = [MEMORY[0x1E4F64540] sharedService];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __106__MNTurnByTurnLocationTracker__requestRerouteWithReason_requestParameters_completionHandler_errorHandler___block_invoke;
    v28[3] = &unk_1E60F8108;
    v28[4] = self;
    unsigned int v13 = v17;
    uint64_t v29 = v13;
    uint64_t v33 = v19;
    id v30 = v10;
    unint64_t v34 = a3;
    id v31 = v11;
    id v32 = v27;
    unint64_t v21 = [v20 requestDirections:v30 handler:v28];
    uint64_t v22 = self->_pendingRequest;
    self->_pendingRequest = v21;

    int v23 = MNGetMNLocationTrackerLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = self->_rerouteReason - 1;
      if (v24 > 0xE) {
        uint64_t v25 = @"Unknown";
      }
      else {
        uint64_t v25 = off_1E60F8258[v24];
      }
      uint64_t v26 = self->_pendingRequest;
      *(_DWORD *)buf = 138412546;
      unint64_t v36 = v25;
      __int16 v37 = 2048;
      long long v38 = v26;
      _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_DEFAULT, "Requesting reroute with reason %@. _pendingRequest = %p", buf, 0x16u);
    }
  }
  else
  {
    unsigned int v13 = MNGetMNLocationTrackerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Rerouting navigation capability is not enabled (you're probably running a test).", buf, 2u);
    }
  }
}

void __106__MNTurnByTurnLocationTracker__requestRerouteWithReason_requestParameters_completionHandler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v14) {
    goto LABEL_2;
  }
  id v27 = *(void **)(a1 + 32);
  if (!v27[18])
  {
LABEL_16:
    id v14 = 0;
    v27[19] = 0;
    goto LABEL_25;
  }
  if ([v27 state] != 5)
  {
    id v27 = *(void **)(a1 + 32);
    if (v27[18])
    {
      uint64_t v28 = MNGetMNLocationTrackerLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 144);
        int v37 = 134217984;
        uint64_t v38 = v29;
        _os_log_impl(&dword_1B542B000, v28, OS_LOG_TYPE_ERROR, "There appears to be a pending directions request (%p) but we are no longer in the RECALCULATING state. Cancelling pending request to ensure state integrity.", (uint8_t *)&v37, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 144) cancel];
      uint64_t v30 = *(void *)(a1 + 32);
      id v31 = *(void **)(v30 + 144);
      *(void *)(v30 + 144) = 0;

      id v27 = *(void **)(a1 + 32);
    }
    goto LABEL_16;
  }
LABEL_2:
  uint64_t v16 = *(void *)(a1 + 32);
  __int16 v17 = *(void **)(v16 + 144);
  *(void *)(v16 + 144) = 0;

  if (v14 && v15)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v19 = [v14 userInfo];
    unint64_t v20 = [v18 dictionaryWithDictionary:v19];

    unint64_t v21 = [MEMORY[0x1E4F64518] key];
    [v20 setObject:v15 forKeyedSubscript:v21];

    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    int v23 = [v14 domain];
    uint64_t v24 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, objc_msgSend(v14, "code"), v20);

    id v14 = (id)v24;
  }
  [*(id *)(a1 + 40) timeSinceRecordingBegan];
  [*(id *)(a1 + 40) recordDirectionsRequest:v12 response:v13 error:v14 waypoints:v11 selectedRouteIndex:0 requestTimestamp:*(double *)(a1 + 72) responseTimestamp:v25];
  if (v14 || [v13 status])
  {
    if (([*(id *)(a1 + 32) _tryOnlineOfflineSwitchingWithRequestParameters:*(void *)(a1 + 48) rerouteReason:*(void *)(a1 + 80) error:v14 errorHandler:*(void *)(a1 + 56)] & 1) == 0)
    {
      uint64_t v26 = *(void *)(a1 + 56);
      if (v26)
      {
        (*(void (**)(uint64_t, id, id))(v26 + 16))(v26, v13, v14);
      }
      else
      {
        id v32 = [*(id *)(a1 + 32) safeDelegate];
        [v32 locationTracker:*(void *)(a1 + 32) didFailRerouteWithError:v14];
      }
      *(void *)(*(void *)(a1 + 32) + 152) = 0;
      uint64_t v33 = [*(id *)(a1 + 32) lastMatchedLocation];
      uint64_t v34 = [v33 state];

      if (v34 == 1) {
        uint64_t v35 = 2;
      }
      else {
        uint64_t v35 = 1;
      }
      [*(id *)(a1 + 32) _setState:v35];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handleSuccessfulRerouteRequest:v12 response:v13 waypoints:v11];
    *(void *)(*(void *)(a1 + 32) + 152) = 0;
    uint64_t v36 = *(void *)(a1 + 64);
    if (v36) {
      (*(void (**)(void))(v36 + 16))();
    }
    id v14 = 0;
  }
LABEL_25:
}

- (void)_requestRerouteWithReason:(unint64_t)a3 requestHandler:(id)a4 completionHandler:(id)a5 errorHandler:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = (void (**)(id, void *))a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    [(GEODirectionsServiceRequest *)self->_pendingRequest cancel];
    pendingRequest = self->_pendingRequest;
    self->_pendingRequest = 0;

    id v14 = [(MNLocationTracker *)self lastMatchedLocation];
    id v15 = [(MNTurnByTurnLocationTracker *)self _rerouteRequestParametersForLocation:v14 transportType:[(MNLocationTracker *)self transportType]];

    v10[2](v10, v15);
    [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:a3 requestParameters:v15 completionHandler:v11 errorHandler:v12];
  }
  else
  {
    uint64_t v16 = [NSString stringWithFormat:@"handler must not be nil"];
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      uint64_t v19 = "handler != nil";
      __int16 v20 = 2112;
      unint64_t v21 = v16;
      _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (id)_routeAttributesFromRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v5 = [(MNLocationTracker *)self navigationSession];
  double v6 = [v5 routeManager];
  uint64_t v7 = [v6 routeAttributes];

  if (v7 && ![v7 mainTransportType])
  {
    BOOL v8 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v9 = [(MNLocationTracker *)self lastMatchedLocation];
    id v10 = objc_msgSend(v9, "_navigation_geoLocation");
    id v11 = [v10 latLng];

    if (v11) {
      [v8 addObject:v11];
    }
    id v12 = [(MNLocationTracker *)self navigationSession];
    id v13 = [v12 routeManager];
    id v14 = [v13 currentRoute];
    id v15 = [v14 waypointsFromRouteCoordinate:a3];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "bestLatLng", (void)v23);

          id v11 = (void *)v20;
          if (v20) {
            [v8 addObject:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v17);
    }

    unint64_t v21 = [[MNRouteAttributes alloc] initWithAttributes:v7 latLngs:v8];
    uint64_t v7 = v21;
  }
  return v7;
}

- (id)_rerouteRequestParametersForLocation:(id)a3 transportType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4 <= 3 && v4 != 1)
  {
    uint64_t v7 = [(MNLocationTracker *)self navigationSession];
    BOOL v8 = [v7 routeManager];

    unsigned int v9 = [v6 routeMatch];
    id v10 = -[MNTurnByTurnLocationTracker _routeAttributesFromRouteCoordinate:](self, "_routeAttributesFromRouteCoordinate:", [v9 routeCoordinate]);

    if (v10)
    {
      if ([v10 mainTransportType] == v4)
      {
LABEL_15:
        id v12 = objc_alloc_init(MEMORY[0x1E4F64548]);
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v6];
        [v12 setCurrentLocation:v17];

        uint64_t v18 = [v8 currentRoute];
        [v12 setCurrentRoute:v18];

        uint64_t v19 = [v6 routeMatch];
        objc_msgSend(v12, "setRouteCoordinate:", objc_msgSend(v19, "routeCoordinate"));

        objc_msgSend(v12, "setStartingLegIndex:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
        [v12 setTransportType:v4];
        [v12 setRouteAttributes:v10];
        uint64_t v20 = [v8 commonOptions];
        [v12 setCommonOptions:v20];

        unint64_t v21 = [v6 routeMatch];
        uint64_t v22 = [v21 pathSegment];
        [v12 setPathSegment:v22];

        objc_msgSend(v12, "setHasVisitedFirstStop:", -[MNLocationTracker hasVisitedFirstStop](self, "hasVisitedFirstStop"));
        long long v23 = [(MNLocationTracker *)self _auditToken];
        [v12 setAuditToken:v23];

        long long v24 = [v8 requestingAppIdentifier];
        [v12 setRequestingAppIdentifier:v24];

        long long v25 = [(MNLocationTracker *)self navigationSessionState];
        long long v26 = [v25 traits];
        id v27 = (void *)[v26 copy];
        [v12 setTraits:v27];

        uint64_t v28 = [v8 currentRouteInfo];
        uint64_t v29 = [v28 displayETAInfo];
        objc_msgSend(v12, "setDisplayRemainingTimeToDestination:", (double)(unint64_t)(60 * objc_msgSend(v29, "displayRemainingMinutesToEndOfRoute")));

        uint64_t v30 = [(MNLocationTracker *)self navigationSession];
        id v31 = [v30 recentLocationHistory];
        [v12 setRecentLocationHistory:v31];

        objc_initWeak((id *)buf, self);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke;
        v35[3] = &unk_1E60F8158;
        objc_copyWeak(&v36, (id *)buf);
        [v12 setRequestCallback:v35];
        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v33 = [NSString stringWithFormat:@"Making a directions request with nil routeAttributes"];
      uint64_t v34 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v38 = "-[MNTurnByTurnLocationTracker _rerouteRequestParametersForLocation:transportType:]";
        __int16 v39 = 2080;
        unsigned int v40 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
        __int16 v41 = 1024;
        int v42 = 1095;
        __int16 v43 = 2080;
        double v44 = "routeAttributes != nil";
        __int16 v45 = 2112;
        double v46 = v33;
        _os_log_impl(&dword_1B542B000, v34, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = off_1E60F8200[(int)v4];
      uint64_t v14 = [v10 mainTransportType];
      if (v14 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
        id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = off_1E60F8220[(int)v14];
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = (const char *)v13;
      __int16 v39 = 2112;
      unsigned int v40 = (const char *)v15;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Reroute requested for (%@) but previous route's transport type was (%@). Creating new route attributes", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F649A0] defaultRouteAttributesForTransportType:v4];

    id v10 = v16;
    goto LABEL_15;
  }
  BOOL v8 = [NSString stringWithFormat:@"Reroute in turn by turn only supported for driving, walking, and cycling transport types."];
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v38 = "-[MNTurnByTurnLocationTracker _rerouteRequestParametersForLocation:transportType:]";
    __int16 v39 = 2080;
    unsigned int v40 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
    __int16 v41 = 1024;
    int v42 = 1088;
    __int16 v43 = 2080;
    double v44 = "NO";
    __int16 v45 = 2112;
    double v46 = v8;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }
  id v12 = 0;
LABEL_16:

  return v12;
}

void __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained navigationSession];
    uint64_t v7 = [v6 serverSessionStateInfo];
    BOOL v8 = [v7 sessionState];
    [v3 setSessionState:v8];

    unsigned int v9 = [v5 navigationSession];
    id v10 = [v9 serverSessionStateInfo];
    id v11 = [v10 displayedTrafficBanners];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke_2;
    v12[3] = &unk_1E60F8130;
    id v13 = v3;
    [v11 enumerateKeysAndObjectsUsingBlock:v12];
  }
}

void __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)[v12 copy];
  [v6 addDisplayedBannerId:v7];

  if ([v5 length])
  {
    BOOL v8 = [*(id *)(a1 + 32) clientFeedbackInfo];

    if (!v8)
    {
      unsigned int v9 = objc_opt_new();
      [*(id *)(a1 + 32) setClientFeedbackInfo:v9];
    }
    id v10 = [*(id *)(a1 + 32) clientFeedbackInfo];
    id v11 = (void *)[v5 copy];
    [v10 addDisplayedBannerEventInfo:v11];
  }
}

- (void)_handleSuccessfulRerouteRequest:(id)a3 response:(id)a4 waypoints:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MNLocationTracker *)self navigationSessionState];
  id v11 = [v10 currentRouteInfo];
  id v12 = [v11 route];

  id v13 = objc_alloc(MEMORY[0x1E4F649D0]);
  uint64_t v14 = [(MNLocationTracker *)self navigationSession];
  id v15 = [v14 routeManager];
  uint64_t v16 = [v15 routeAttributes];
  uint64_t v17 = (void *)[v13 initWithWaypoints:v9 routeAttributes:v16 directionsResponse:v8 directionsRequest:v20];

  uint64_t v18 = [v12 anchorPoints];
  [v17 setAnchorPoints:v18];

  uint64_t v19 = [v17 mainRouteInfo];
  [(MNTurnByTurnLocationTracker *)self _updateForNewRoute:v19 rerouteReason:self->_rerouteReason request:v20 response:v8];
}

- (void)_updateForNewRoute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v66 = (char *)a5;
  id v67 = a6;
  if (v10 && ([v10 route], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v68 = v10;
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (a4 - 1 > 0xE) {
        id v13 = @"Unknown";
      }
      else {
        id v13 = off_1E60F8258[a4 - 1];
      }
      *(_DWORD *)buf = 138412802;
      v71 = (const char *)v13;
      __int16 v72 = 2112;
      v73 = v66;
      __int16 v74 = 2112;
      id v75 = v67;
    }

    uint64_t v14 = [(MNLocationTracker *)self navigationSession];
    id v15 = [v14 routeManager];
    v68 = [v15 currentRouteInfo];

    uint64_t v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v71 = "-[MNTurnByTurnLocationTracker _updateForNewRoute:rerouteReason:request:response:]";
      __int16 v72 = 2080;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
      __int16 v74 = 1024;
      LODWORD(v75) = 1153;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }
  }
  uint64_t v17 = [(MNLocationTracker *)self navigationSession];
  uint64_t v18 = [v17 routeManager];
  v65 = [v18 currentRoute];

  v69 = [v68 route];
  lastKnownGoodLocationOnRoute = self->_lastKnownGoodLocationOnRoute;
  self->_lastKnownGoodLocationOnRoute = 0;

  if (a4 - 7 <= 2)
  {
    id v20 = [(MNLocationTracker *)self arrivalInfo];
    BOOL v21 = [v20 arrivalState] == 0;

    if (!v21)
    {
      uint64_t v22 = 5;
LABEL_24:
      [(MNArrivalUpdater *)self->_arrivalUpdater forceDepartureForCurrentLeg:v22];
LABEL_32:
      uint64_t v23 = 1;
      goto LABEL_33;
    }
  }
  uint64_t v23 = 1;
  if ((uint64_t)a4 <= 9)
  {
    if (a4 == 1)
    {
      unint64_t v24 = [(MNLocationTracker *)self targetLegIndex];
      long long v25 = [v65 legs];
      if (v24 >= [v25 count])
      {
        uint64_t v28 = 0;
      }
      else
      {
        long long v26 = [v65 legs];
        id v27 = objc_msgSend(v26, "objectAtIndexedSubscript:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
        uint64_t v28 = [v27 destination];
      }
      uint64_t v29 = [v69 legs];
      uint64_t v30 = [v29 firstObject];
      id v31 = [v30 destination];

      id v32 = [v28 uniqueWaypointID];
      uint64_t v33 = [v31 uniqueWaypointID];
      unint64_t v34 = v32;
      unint64_t v35 = v33;
      if (v34 | v35)
      {
        id v36 = (void *)v35;
        char v37 = [(id)v34 isEqual:v35];

        if ((v37 & 1) == 0) {
          [(MNArrivalUpdater *)self->_arrivalUpdater forceDepartureForCurrentLeg:4];
        }
      }

      goto LABEL_32;
    }
    if (a4 != 3) {
      goto LABEL_33;
    }
    goto LABEL_22;
  }
  switch(a4)
  {
    case 0xAuLL:
      goto LABEL_22;
    case 0xCuLL:
      uint64_t v22 = 6;
      goto LABEL_24;
    case 0xFuLL:
LABEL_22:
      uint64_t v23 = 0;
      break;
  }
LABEL_33:
  uint64_t v38 = +[MNLocationManager sharedLocationManager];
  __int16 v39 = [v38 lastLocation];

  unsigned int v40 = [MNLocation alloc];
  __int16 v41 = [v39 rawLocation];
  int v42 = [(MNLocation *)v40 initWithRawLocation:v41];

  id v43 = objc_alloc(MEMORY[0x1E4F64660]);
  double v44 = [v39 rawLocation];
  __int16 v45 = (void *)[v43 initWithCLLocation:v44];

  double v46 = [(GEONavigationMapMatcher *)self->_mapMatcher updateForReroute:v69 location:v45 routeStartsFromLocation:v23];
  if ([v46 type])
  {
    [(MNLocationTracker *)self _setState:3];
LABEL_40:
    uint64_t v51 = 0;
    goto LABEL_41;
  }
  [(MNLocationTracker *)self _setState:2];
  if (a4 != 10) {
    goto LABEL_40;
  }
  uint64_t v47 = [v69 legs];
  BOOL v48 = (unint64_t)[v47 count] > 1;

  if (!v48) {
    goto LABEL_40;
  }
  BOOL v49 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v49, OS_LOG_TYPE_DEFAULT, "User selected an alternate multi-waypoint route. Attempting to guess target leg index from route match.", buf, 2u);
  }

  v50 = [v46 routeMatch];
  uint64_t v51 = [v50 legIndex];

LABEL_41:
  [(MNLocationTracker *)self _setTargetLegIndex:v51];
  BOOL v52 = [(MNTurnByTurnLocationTracker *)self _matchedLocationForMatchResult:v46 originalLocation:v42];
  [(MNLocationTracker *)self _updateMatchedLocation:v52];
  GEOFindOrCreateLog();
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    long long v54 = [v52 routeMatch];
    [v54 routeCoordinate];
    GEOPolylineCoordinateAsShortString();
    uint64_t v55 = (char *)(id)objc_claimAutoreleasedReturnValue();
    [v52 coordinate];
    long long v57 = v56;
    [v52 coordinate];
    *(_DWORD *)buf = 138412802;
    v71 = v55;
    __int16 v72 = 2048;
    v73 = v57;
    __int16 v74 = 2048;
    id v75 = v58;
    _os_log_impl(&dword_1B542B000, v53, OS_LOG_TYPE_DEFAULT, "Handling reroute. Location on new route: [%@], %f, %f", buf, 0x20u);
  }
  id v59 = objc_alloc(MEMORY[0x1E4F64818]);
  long long v60 = [(MNLocationTracker *)self _auditToken];
  id v61 = (GEOPathMatcher *)[v59 initWithRoute:v69 auditToken:v60];
  pathMatcher = self->_pathMatcher;
  self->_pathMatcher = v61;

  trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  uint64_t v64 = [v68 route];
  [(MNTrafficIncidentAlertUpdater *)trafficIncidentAlertUpdater updateForReroute:v64];

  LODWORD(v64) = [v69 transportType];
  if (v64 == [(MNLocationTracker *)self transportType]) {
    [(MNTurnByTurnLocationTracker *)self _updateForReroute:v68 rerouteReason:a4 request:v66 response:v67];
  }
  else {
    [(MNTurnByTurnLocationTracker *)self _updateForNewTransportType:v68 rerouteReason:a4 request:v66 response:v67];
  }
}

- (void)_cancelPendingRerouteRequest
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_pendingRequest)
  {
    id v3 = MNGetMNLocationTrackerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = self->_rerouteReason - 1;
      if (v4 > 0xE) {
        id v5 = @"Unknown";
      }
      else {
        id v5 = off_1E60F8258[v4];
      }
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling pending reroute of type: %@", (uint8_t *)&v8, 0xCu);
    }

    [(GEODirectionsServiceRequest *)self->_pendingRequest cancel];
    pendingRequest = self->_pendingRequest;
    self->_pendingRequest = 0;

    uint64_t v7 = [(MNLocationTracker *)self safeDelegate];
    [v7 locationTrackerDidCancelReroute:self];
  }
}

- (unint64_t)_offRouteRequestType
{
  v2 = [(MNLocationTracker *)self navigationSessionState];
  id v3 = [v2 currentRouteInfo];
  unint64_t v4 = [v3 route];
  uint64_t v5 = [v4 source];

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 5;
  }
  else {
    return 4;
  }
}

- (void)_handleWaypointRerouteForLocation:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(MNLocationTracker *)self navigationSession];
  uint64_t v7 = [v6 traceManager];
  int v8 = [v7 tracePlayer];

  if (v8 && (GEOConfigGetBOOL() & 1) != 0)
  {
    [v8 position];
    id v9 = objc_msgSend(v8, "guidanceEventNearTimestamp:");
    if ([v9 eventType] == 16 || objc_msgSend(v9, "eventType") == 17)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke;
      v30[3] = &unk_1E60F8180;
      v30[4] = self;
      uint64_t v10 = (void *)MEMORY[0x1BA99B3A0](v30);
      [v8 position];
      double v12 = v11;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke_81;
      v28[3] = &unk_1E60F81A8;
      id v13 = v10;
      v28[4] = self;
      id v29 = v13;
      if ([v8 requestDirectionsNearTimestamp:v28 withHandler:v12])
      {
        [(MNTurnByTurnLocationTracker *)self _cancelPendingRerouteRequest];
        uint64_t v14 = [v5 timestamp];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          long long v26 = [NSString stringWithFormat:@"Location has no timestamp."];
          id v27 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            id v32 = "-[MNTurnByTurnLocationTracker _handleWaypointRerouteForLocation:]";
            __int16 v33 = 2080;
            unint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
            __int16 v35 = 1024;
            int v36 = 1310;
            __int16 v37 = 2080;
            uint64_t v38 = "location.timestamp != nil";
            __int16 v39 = 2112;
            unsigned int v40 = v26;
            _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }
        }
        uint64_t v16 = [v5 timestamp];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
          rerouteDates = self->_rerouteDates;
          if (!rerouteDates)
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
            id v20 = self->_rerouteDates;
            self->_rerouteDates = v19;

            rerouteDates = self->_rerouteDates;
          }
          BOOL v21 = [v5 timestamp];
          [(NSMutableArray *)rerouteDates addObject:v21];

          unint64_t v22 = [(NSMutableArray *)self->_rerouteDates count];
          if (v22 > GEOConfigGetUInteger()) {
            [(NSMutableArray *)self->_rerouteDates removeObjectAtIndex:0];
          }
        }
        objc_storeStrong((id *)&self->_previousRerouteLocation, a3);
        uint64_t v23 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_DEFAULT, "Rerouting using a response from the navtrace", buf, 2u);
        }

        unint64_t v24 = [v9 eventType] - 15;
        if (v24 <= 2) {
          self->_rerouteReason = qword_1B5542BB0[v24];
        }
        long long v25 = [(MNLocationTracker *)self safeDelegate];
        [v25 locationTrackerWillReroute:self];

        [(MNLocationTracker *)self _setState:5];
      }
    }
  }
}

void __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) safeDelegate];
    [v7 locationTracker:*(void *)(a1 + 32) didFailRerouteWithError:v6];
LABEL_7:

    goto LABEL_8;
  }
  if (([v5 isNavigable] & 1) == 0)
  {
    int v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = GEOErrorDomain();
    uint64_t v7 = [v8 errorWithDomain:v9 code:-403 userInfo:0];

    uint64_t v10 = [*(id *)(a1 + 32) safeDelegate];
    [v10 locationTracker:*(void *)(a1 + 32) didFailRerouteWithError:v7];

    [*(id *)(a1 + 32) _setState:8];
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "No longer inside a navigable area", v12, 2u);
    }

    goto LABEL_7;
  }
LABEL_8:
}

void __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke_81(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v15 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13 || [v12 status]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 32) _handleSuccessfulRerouteRequest:v11 response:v12 waypoints:v15];
  }
}

- (void)_handleOffRouteForLocation:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_pendingRequest)
  {
    id v6 = [NSString stringWithFormat:@"Attempting to reroute while another reroute is in progress"];
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      unsigned int v40 = "-[MNTurnByTurnLocationTracker _handleOffRouteForLocation:]";
      __int16 v41 = 2080;
      int v42 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
      __int16 v43 = 1024;
      int v44 = 1353;
      __int16 v45 = 2080;
      double v46 = "NO";
      __int16 v47 = 2112;
      BOOL v48 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  else if ([(MNArrivalUpdater *)self->_arrivalUpdater isInPreArrivalRegion] {
         && ([v5 horizontalAccuracy], double v9 = v8, GEOConfigGetDouble(), v9 >= v10))
  }
  {
    GEOFindOrCreateLog();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      [v5 horizontalAccuracy];
      id v31 = v30;
      GEOConfigGetDouble();
      *(_DWORD *)buf = 134218240;
      unsigned int v40 = v31;
      __int16 v41 = 2048;
      int v42 = v32;
      _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEFAULT, "Off route but not rerouting because location is in pre-arrival region and location accuracy (%gm) is worse than the required accuracy (%gm)", buf, 0x16u);
    }
  }
  else if (([(MNLocationTracker *)self navigationCapabilities] & 2) != 0)
  {
    id v12 = [v5 timestamp];

    if (!v12)
    {
      __int16 v33 = [NSString stringWithFormat:@"Location has no timestamp."];
      unint64_t v34 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        unsigned int v40 = "-[MNTurnByTurnLocationTracker _handleOffRouteForLocation:]";
        __int16 v41 = 2080;
        int v42 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
        __int16 v43 = 1024;
        int v44 = 1368;
        __int16 v45 = 2080;
        double v46 = "location.timestamp != nil";
        __int16 v47 = 2112;
        BOOL v48 = v33;
        _os_log_impl(&dword_1B542B000, v34, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    id v13 = [v5 timestamp];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      rerouteDates = self->_rerouteDates;
      if (!rerouteDates)
      {
        uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
        BOOL v17 = self->_rerouteDates;
        self->_rerouteDates = v16;

        rerouteDates = self->_rerouteDates;
      }
      uint64_t v18 = [v5 timestamp];
      [(NSMutableArray *)rerouteDates addObject:v18];

      unint64_t v19 = [(NSMutableArray *)self->_rerouteDates count];
      if (v19 > GEOConfigGetUInteger()) {
        [(NSMutableArray *)self->_rerouteDates removeObjectAtIndex:0];
      }
    }
    objc_storeStrong((id *)&self->_previousRerouteLocation, a3);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke;
    v38[3] = &unk_1E60F8180;
    v38[4] = self;
    id v20 = (void *)MEMORY[0x1BA99B3A0](v38);
    BOOL v21 = [(MNLocationTracker *)self navigationSession];
    unint64_t v22 = [v21 traceManager];
    uint64_t v23 = [v22 tracePlayer];

    if (!v23) {
      goto LABEL_24;
    }
    if (!GEOConfigGetBOOL()) {
      goto LABEL_24;
    }
    [v23 position];
    double v25 = v24;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_90;
    v36[3] = &unk_1E60F81A8;
    v36[4] = self;
    id v37 = v20;
    char v26 = [v23 requestDirectionsNearTimestamp:v36 withHandler:v25];

    if (v26)
    {
      id v27 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_DEFAULT, "Rerouting using a response from the navtrace", buf, 2u);
      }

      self->_rerouteReason = 1;
      uint64_t v28 = [(MNLocationTracker *)self safeDelegate];
      [v28 locationTrackerWillReroute:self];
    }
    else
    {
LABEL_24:
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_91;
      v35[3] = &unk_1E60F7FD8;
      void v35[4] = self;
      [(MNTurnByTurnLocationTracker *)self _requestRerouteWithReason:1 requestHandler:v35 completionHandler:0 errorHandler:v20];
    }
    [(MNLocationTracker *)self _setState:5];
  }
  else
  {
    id v11 = MNGetMNLocationTrackerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Rerouting navigation capability is not enabled (you're probably running a test).", buf, 2u);
    }
  }
}

void __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) safeDelegate];
    [v7 locationTracker:*(void *)(a1 + 32) didFailRerouteWithError:v6];
LABEL_7:

    goto LABEL_8;
  }
  if (([v5 isNavigable] & 1) == 0)
  {
    double v8 = (void *)MEMORY[0x1E4F28C58];
    double v9 = GEOErrorDomain();
    uint64_t v7 = [v8 errorWithDomain:v9 code:-403 userInfo:0];

    double v10 = [*(id *)(a1 + 32) safeDelegate];
    [v10 locationTracker:*(void *)(a1 + 32) didFailRerouteWithError:v7];

    [*(id *)(a1 + 32) _setState:8];
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "No longer inside a navigable area", v12, 2u);
    }

    goto LABEL_7;
  }
LABEL_8:
}

void __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_90(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v15 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13 || [v12 status]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 32) _handleSuccessfulRerouteRequest:v11 response:v12 waypoints:v15];
  }
}

void __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_91(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setRequestType:", objc_msgSend(*(id *)(a1 + 32), "_offRouteRequestType"));
}

- (BOOL)_allowRerouteForLocation:(id)a3 outError:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 timestamp];

  if (!v7)
  {
    LOBYTE(a4) = 1;
    goto LABEL_22;
  }
  GEOConfigGetDouble();
  double v9 = v8;
  [v6 coordinate];
  GEOCalculateDistance();
  double v11 = v10;
  if (v10 < v9)
  {
    id v12 = MNGetMNLocationTrackerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v43 = v11;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "Suppressing reroute because current location is too close to origin (%0.1f meters)", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (![(NSMutableArray *)self->_rerouteDates count]) {
    goto LABEL_14;
  }
  GEOConfigGetDouble();
  double v14 = v13;
  [v6 coordinate];
  [(MNLocation *)self->_previousRerouteLocation coordinate];
  GEOCalculateDistance();
  if (v15 < v14)
  {
    if (a4)
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Suppressing reroute because the current location is too close to the previous reroute location (%0.1f meters)", *(void *)&v15);
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28228];
      __int16 v41 = v12;
      BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      objc_msgSend(v16, "_navigation_errorWithCode:userInfo:", 14, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
      LOBYTE(a4) = 0;
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  GEOConfigGetDouble();
  double v19 = v18;
  id v20 = [v6 timestamp];
  BOOL v21 = [(NSMutableArray *)self->_rerouteDates lastObject];
  [v20 timeIntervalSinceDate:v21];
  double v23 = v22;

  if (v23 >= v19)
  {
LABEL_14:
    Uuint64_t Integer = GEOConfigGetUInteger();
    if (UInteger
      && [(NSMutableArray *)self->_rerouteDates count] >= UInteger
      && (![(MNArrivalUpdater *)self->_arrivalUpdater isInPreArrivalRegion]
       || GEOConfigGetBOOL()))
    {
      uint64_t v27 = [(NSMutableArray *)self->_rerouteDates count];
      if (v27 - UInteger < [(NSMutableArray *)self->_rerouteDates count])
      {
        id v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_rerouteDates, "objectAtIndexedSubscript:");
        uint64_t v28 = [v6 timestamp];
        [v28 timeIntervalSinceDate:v12];
        double v30 = v29;

        GEOConfigGetDouble();
        if (v30 < v31)
        {
          if (a4)
          {
            __int16 v33 = objc_msgSend(NSString, "stringWithFormat:", @"Throttling reroute because too many (%d) have been requested in a short interval (%0.1f seconds)", -[NSMutableArray count](self->_rerouteDates, "count"), *(void *)&v30);
            unint64_t v34 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v36 = *MEMORY[0x1E4F28228];
            id v37 = v33;
            __int16 v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            objc_msgSend(v34, "_navigation_errorWithCode:userInfo:", 15, v35);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_13;
        }
      }
    }
    LOBYTE(a4) = [(MNTurnByTurnLocationTracker *)self _allowRerouteForLocation:v6];
    goto LABEL_22;
  }
  if (a4)
  {
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Suppressing reroute because the previous reroute is too recent (%0.1f seconds)", *(void *)&v23);
    double v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28228];
    __int16 v39 = v12;
    double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    objc_msgSend(v24, "_navigation_errorWithCode:userInfo:", 14, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_22:

  return (char)a4;
}

- (void)setNavigationSessionState:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MNTurnByTurnLocationTracker;
  [(MNLocationTracker *)&v6 setNavigationSessionState:v4];
  [(MNArrivalUpdater *)self->_arrivalUpdater setNavigationSessionState:v4];
  id v5 = [(MNLocationTracker *)self navigationSessionState];
  [(MNOfflineCoordinator *)self->_offlineCoordinator setNavigationSessionState:v5];
}

- (BOOL)isRerouting
{
  return self->_pendingRequest != 0;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MNTurnByTurnLocationTracker;
  [(MNLocationTracker *)&v36 startTrackingWithInitialLocation:v6 targetLegIndex:a4];
  uint64_t v7 = [(MNLocationTracker *)self navigationSession];
  double v8 = [v7 routeManager];
  double v9 = [v8 currentRoute];

  double v10 = +[MNTimeManager currentDate];
  startDate = self->_startDate;
  self->_startDate = v10;

  id v12 = [v9 origin];
  double v13 = [v12 latLng];
  [v13 coordinate];
  self->_originCoordinate.latitude = v14;
  self->_originCoordinate.longitude = v15;

  uint64_t v16 = objc_alloc_init(MNArrivalUpdater);
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = v16;

  [(MNArrivalUpdater *)self->_arrivalUpdater setDelegate:self];
  double v18 = [(MNLocationTracker *)self navigationSessionState];
  [(MNArrivalUpdater *)self->_arrivalUpdater setNavigationSessionState:v18];

  [(MNArrivalUpdater *)self->_arrivalUpdater start];
  self->_unint64_t lastArrivalLegIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    a4 = 0;
  }
  double v19 = [v9 uniqueRouteID];
  id v20 = [v6 routeID];
  int v21 = [v19 isEqual:v20];

  if (v21 && [v6 state] == 1)
  {
    GEOFindOrCreateLog();
    double v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = [v6 routeMatch];
      [v23 routeCoordinate];
      double v24 = GEOPolylineCoordinateAsShortString();
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = v24;
      __int16 v39 = 1024;
      int v40 = a4;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_DEFAULT, "Starting location tracking with a route matched location at [%@], targetLegIndex: %d", buf, 0x12u);
    }
    uint64_t v25 = 2;
    char v26 = v22;
  }
  else
  {
    uint64_t v27 = [v9 legs];
    char v26 = [v27 objectAtIndexedSubscript:a4];

    uint64_t v28 = [v26 origin];
    BOOL v29 = [(MNTurnByTurnLocationTracker *)self _isLocation:v6 nearOrigin:v28];

    if (v29)
    {
      double v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = a4;
        _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_DEFAULT, "Starting location tracking from PROCEEDING_TO_ROUTE. targetLegIndex: %d", buf, 8u);
      }
      uint64_t v25 = 1;
    }
    else
    {
      double v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = a4;
        _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_DEFAULT, "Starting location tracking from OFF_ROUTE_OFF_ROAD state. targetLegIndex: %d", buf, 8u);
      }
      uint64_t v25 = 3;
    }
  }

  [(MNLocationTracker *)self _setState:v25];
  [(MNLocationTracker *)self _setTargetLegIndex:a4];
  [(GEONavigationMapMatcher *)self->_mapMatcher setTargetLegIndex:a4];
  if (([(MNLocationTracker *)self navigationCapabilities] & 0x10) != 0)
  {
    double v31 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v31, OS_LOG_TYPE_DEFAULT, "Starting offline coordinator.", buf, 2u);
    }

    id v32 = [_TtC10Navigation20MNOfflineCoordinator alloc];
    __int16 v33 = [(MNLocationTracker *)self navigationSessionState];
    unint64_t v34 = [(MNOfflineCoordinator *)v32 initWithNavigationSessionState:v33];
    offlineCoordinator = self->_offlineCoordinator;
    self->_offlineCoordinator = v34;

    [(MNOfflineCoordinator *)self->_offlineCoordinator setDelegate:self];
    [(MNOfflineCoordinator *)self->_offlineCoordinator start];
  }
  else
  {
    double v30 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v30, OS_LOG_TYPE_DEFAULT, "Not starting offline coordinator because navigation capability is disabled.", buf, 2u);
    }
  }
}

- (void)stopTracking
{
  [(MNLocationTracker *)self _setState:0];
  [(MNOfflineCoordinator *)self->_offlineCoordinator setDelegate:0];
  [(MNOfflineCoordinator *)self->_offlineCoordinator stop];
  offlineCoordinator = self->_offlineCoordinator;
  self->_offlineCoordinator = 0;

  [(MNTrafficIncidentAlertUpdater *)self->_trafficIncidentAlertUpdater clearAlerts];
  [(MNTrafficIncidentAlertUpdater *)self->_trafficIncidentAlertUpdater setDelegate:0];
  trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  self->_trafficIncidentAlertUpdater = 0;

  [(MNArrivalUpdater *)self->_arrivalUpdater setDelegate:0];
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = 0;

  [(GEODirectionsServiceRequest *)self->_pendingRequest cancel];
  rerouteDates = self->_rerouteDates;
  self->_rerouteDates = 0;

  previousRerouteLocation = self->_previousRerouteLocation;
  self->_previousRerouteLocation = 0;

  [(MNTurnByTurnLocationTracker *)self _sendRouteHintForLocation:0];
}

- (void)updateLocation:(id)a3
{
  id v5 = a3;
  id v4 = [(MNLocationTracker *)self lastMatchedLocation];
  if ([(MNTurnByTurnLocationTracker *)self hasArrivedAtFinalDestination])
  {
    [(MNArrivalUpdater *)self->_arrivalUpdater updateForLocation:v4];
  }
  else if (v4 == v5)
  {
    [(MNTurnByTurnLocationTracker *)self _updateStateForLocation:v5];
    [(MNArrivalUpdater *)self->_arrivalUpdater updateForLocation:v5];
    if ([(MNLocationTracker *)self state] == 2)
    {
      if (self->_pendingRequest && self->_rerouteReason == 1) {
        [(MNTurnByTurnLocationTracker *)self _cancelPendingRerouteRequest];
      }
      else {
        [(MNTurnByTurnLocationTracker *)self _handleWaypointRerouteForLocation:v5];
      }
    }
    else if ([(MNLocationTracker *)self state] == 4)
    {
      [(MNTurnByTurnLocationTracker *)self _handleOffRouteForLocation:v5];
    }
    [(MNTurnByTurnLocationTracker *)self _updateSwitchTransportTypeForLocation:v5];
    [(MNTrafficIncidentAlertUpdater *)self->_trafficIncidentAlertUpdater updateForLocation:v5];
    [(MNTurnByTurnLocationTracker *)self _updateForLocation:v5];
    if (![(MNLocationTracker *)self hasArrived]) {
      [(MNTurnByTurnLocationTracker *)self _sendRouteHintForLocation:v5];
    }
  }
}

- (id)_matchedLocationForLocation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 uuid];
    int v26 = 138412290;
    uint64_t v27 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNTurnByTurnLocationTracker::_matchedLocationForLocation:", (uint8_t *)&v26, 0xCu);
  }
  uint64_t v7 = MNGetMNLocationTrackerLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  double v9 = v7;
  double v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedTBTLocationForLocation", "", (uint8_t *)&v26, 2u);
  }

  if ([v4 type] != 6) {
    goto LABEL_15;
  }
  double v11 = [(MNLocationTracker *)self lastMatchedLocation];
  if (!v11)
  {
    BOOL v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_DEFAULT, "Incoming cell location | No previous good location", (uint8_t *)&v26, 2u);
    }
    goto LABEL_14;
  }
  id v12 = [v4 timestamp];
  double v13 = [v11 timestamp];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  GEOConfigGetDouble();
  if (v15 >= v16)
  {
    GEOFindOrCreateLog();
    BOOL v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = objc_msgSend(MEMORY[0x1E4F1E5F0], "_navigation_stringWithType:", objc_msgSend(v11, "type"));
      int v26 = 138412546;
      uint64_t v27 = v18;
      __int16 v28 = 2048;
      double v29 = v15;
      _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_DEFAULT, "Incoming cell location | Previous location: %@, %0.1fs", (uint8_t *)&v26, 0x16u);
    }
LABEL_14:

LABEL_15:
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v4];
    double v11 = [(MNTurnByTurnLocationTracker *)self _overrideLocationForLocation:v19];

    id v20 = [(GEONavigationMapMatcher *)self->_mapMatcher matchLocation:v11 transportType:[(MNLocationTracker *)self transportType]];
    int v21 = [(MNTurnByTurnLocationTracker *)self _matchedLocationForMatchResult:v20 originalLocation:v4];
    double v22 = v10;
    double v23 = v22;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v23, OS_SIGNPOST_INTERVAL_END, v8, "MatchedTBTLocationForLocation", "", (uint8_t *)&v26, 2u);
    }
    goto LABEL_21;
  }
  GEOFindOrCreateLog();
  double v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    double v24 = objc_msgSend(MEMORY[0x1E4F1E5F0], "_navigation_stringWithType:", objc_msgSend(v11, "type"));
    int v26 = 138412546;
    uint64_t v27 = v24;
    __int16 v28 = 2048;
    double v29 = v15;
    _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring cell location | Previous location: %@, %0.1fs", (uint8_t *)&v26, 0x16u);
  }
  int v21 = 0;
  id v20 = v23;
LABEL_21:

  return v21;
}

- (void)traceJumpedInTime
{
  lastKnownGoodLocationOnRoute = self->_lastKnownGoodLocationOnRoute;
  self->_lastKnownGoodLocationOnRoute = 0;

  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "last known good location on route set to nil", v4, 2u);
  }
}

- (id)_newMapMatcherForRoute:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = NSStringFromSelector(a2);
    int v8 = 136316162;
    double v9 = "-[MNTurnByTurnLocationTracker _newMapMatcherForRoute:]";
    __int16 v10 = 2080;
    double v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
    __int16 v12 = 1024;
    int v13 = 1649;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    BOOL v17 = v6;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: %@ must implement '%@'", (uint8_t *)&v8, 0x30u);
  }
  return 0;
}

- (id)_trafficIncidentAlertUpdater
{
  trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  if (!trafficIncidentAlertUpdater)
  {
    id v4 = (MNTrafficIncidentAlertUpdater *)objc_opt_new();
    uint64_t v5 = self->_trafficIncidentAlertUpdater;
    self->_trafficIncidentAlertUpdater = v4;

    [(MNTrafficIncidentAlertUpdater *)self->_trafficIncidentAlertUpdater setDelegate:self];
    trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  }
  return trafficIncidentAlertUpdater;
}

- (id)_overrideLocationForLocation:(id)a3
{
  return a3;
}

- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = [v10 route];
  int v14 = [v13 transportType];
  int v15 = [(MNLocationTracker *)self transportType];

  if (v14 != v15)
  {
    BOOL v17 = [NSString stringWithFormat:@"Unexpected transport type change when calling _updateForReroute:"];
    uint64_t v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      id v20 = "-[MNTurnByTurnLocationTracker _updateForReroute:rerouteReason:request:response:]";
      __int16 v21 = 2080;
      double v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
      __int16 v23 = 1024;
      int v24 = 1673;
      __int16 v25 = 2080;
      int v26 = "routeInfo.route.transportType == self.transportType";
      __int16 v27 = 2112;
      __int16 v28 = v17;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
    }
  }
  __int16 v16 = [(MNLocationTracker *)self safeDelegate];
  [v16 locationTracker:self didReroute:v10 newAlternateRoutes:0 rerouteReason:a4 request:v11 response:v12];
}

- (void)_updateForNewTransportType:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MNLocationTracker *)self safeDelegate];
  [v12 locationTracker:self didSwitchToNewTransportTypeWithRoute:v13 rerouteReason:a4 request:v10 response:v11];
}

- (void)_updateForArrivalAtLegIndex:(unint64_t)a3
{
  [(MNTurnByTurnLocationTracker *)self _cancelPendingRerouteRequest];
  [(MNTurnByTurnLocationTracker *)self _sendRouteHintForLocation:0];
  uint64_t v5 = [(MNLocationTracker *)self navigationSession];
  id v6 = [v5 routeManager];
  id v14 = [v6 currentRoute];

  uint64_t v7 = [v14 legs];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    id v10 = 0;
  }
  else
  {
    double v9 = [v14 legs];
    id v10 = [v9 objectAtIndexedSubscript:a3];
  }
  id v11 = [(MNLocationTracker *)self safeDelegate];
  id v12 = [v10 destination];
  [v11 locationTracker:self didArriveAtWaypoint:v12 endOfLegIndex:a3];

  id v13 = [(MNLocationTracker *)self safeDelegate];
  [v13 locationTrackerDidArrive:self];
}

- (void)_updateForDepartureFromLegIndex:(unint64_t)a3 withReason:(unint64_t)a4
{
  [(MNTurnByTurnLocationTracker *)self _cancelPendingRerouteRequest];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    a3 = [(MNLocationTracker *)self targetLegIndex];
  }
  unint64_t v8 = [(MNLocationTracker *)self navigationSession];
  double v9 = [v8 routeManager];
  id v18 = [v9 currentRoute];

  id v10 = [v18 legs];
  unint64_t v11 = [v10 count];

  if (a3 >= v11)
  {
    id v13 = 0;
  }
  else
  {
    id v12 = [v18 legs];
    id v4 = [v12 objectAtIndexedSubscript:a3];
    id v13 = [v4 destination];
  }
  if (a4 == 6)
  {
    [(MNLocationTracker *)self _setTargetLegIndex:0];
  }
  else
  {
    id v14 = [v18 legs];
    unint64_t v15 = [v14 count] - 1;
    if (a3 + 1 >= v15)
    {
      id v4 = [v18 legs];
      unint64_t v16 = [v4 count] - 1;
    }
    else
    {
      unint64_t v16 = a3 + 1;
    }
    [(MNLocationTracker *)self _setTargetLegIndex:v16];
    if (a3 + 1 >= v15) {
  }
    }
  [(GEONavigationMapMatcher *)self->_mapMatcher setTargetLegIndex:[(MNLocationTracker *)self targetLegIndex]];
  [(MNLocationTracker *)self _setState:1];
  self->_unint64_t lastArrivalLegIndex = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v17 = [(MNLocationTracker *)self safeDelegate];
  [v17 locationTracker:self didResumeNavigatingFromWaypoint:v13 endOfLegIndex:a3 reason:a4];
}

- (void)_updateForNewTrafficIncidentAlerts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_trafficIncidentAlertUpdater)
  {
    uint64_t v5 = objc_alloc_init(MNTrafficIncidentAlertUpdater);
    trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
    self->_trafficIncidentAlertUpdater = v5;

    [(MNTrafficIncidentAlertUpdater *)self->_trafficIncidentAlertUpdater setDelegate:self];
  }
  uint64_t BOOL = GEOConfigGetBOOL();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "triggerRange", (void)v16);
        BOOL v13 = v12 != 0;

        uint64_t BOOL = BOOL & v13;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [(MNTrafficIncidentAlertUpdater *)self->_trafficIncidentAlertUpdater setUseTriggerPointRangeBannerQueuing:BOOL];
  id v14 = self->_trafficIncidentAlertUpdater;
  unint64_t v15 = [(MNLocationTracker *)self lastMatchedLocation];
  [(MNTrafficIncidentAlertUpdater *)v14 updateForAlertsFromResponse:v8 updatedLocation:v15];
}

- (BOOL)_allowRerouteForLocation:(id)a3
{
  return 1;
}

- (int)_detectedMotionForLocation:(id)a3
{
  return 4;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  return 0;
}

- (void)_setIsNavigatingInLowGuidance:(BOOL)a3
{
  self->_isNavigatingInLowGuidance = a3;
}

- (void)forceOnRoute:(id)a3 atLocation:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(GEONavigationMapMatcher *)self->_mapMatcher setRoute:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v6];
  id v8 = (id)[(GEONavigationMapMatcher *)self->_mapMatcher updateForReroute:v9 location:v7 routeStartsFromLocation:0];
}

- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4
{
}

- (void)arrivalUpdater:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id v6 = [(MNLocationTracker *)self safeDelegate];
  [v6 locationTracker:self isApproachingEndOfLeg:a4];
}

- (void)arrivalUpdater:(id)a3 didArriveAtEndOfLegIndex:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = a4;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Arrival detected for leg: %d", (uint8_t *)v12, 8u);
  }

  self->_unint64_t lastArrivalLegIndex = a4;
  uint64_t v7 = [(MNLocationTracker *)self navigationSession];
  id v8 = [v7 routeManager];
  id v9 = [v8 currentRoute];

  uint64_t v10 = [v9 legs];
  LODWORD(v8) = [v10 count] - 1 > a4;

  if (v8) {
    uint64_t v11 = 7;
  }
  else {
    uint64_t v11 = 6;
  }
  [(MNLocationTracker *)self _setState:v11];
  [(MNTurnByTurnLocationTracker *)self _updateForArrivalAtLegIndex:a4];
}

- (void)arrivalUpdater:(id)a3 didEnterPreArrivalStateForLegIndex:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = a4;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Pre-arrival detected for leg: %d", (uint8_t *)v16, 8u);
  }

  uint64_t v7 = [(MNLocationTracker *)self navigationSession];
  id v8 = [v7 routeManager];
  id v9 = [v8 currentRoute];

  uint64_t v10 = [v9 legs];
  LODWORD(v7) = [v10 count] > a4;

  if (v7)
  {
    uint64_t v11 = [v9 legs];
    id v12 = [v11 objectAtIndexedSubscript:a4];
    uint64_t v13 = [v12 destination];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = [(MNLocationTracker *)self safeDelegate];
  [v14 locationTracker:self didEnterPreArrivalStateForWaypoint:v13 endOfLegIndex:a4];

  unint64_t v15 = [(MNLocationTracker *)self safeDelegate];
  [v15 locationTrackerDidEnterPreArrivalState:self];
}

- (void)arrivalUpdater:(id)a3 didDepartFromLegIndex:(unint64_t)a4 withReason:(unint64_t)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a5 - 1 > 5) {
      id v9 = @"Unknown";
    }
    else {
      id v9 = off_1E60F82D0[a5 - 1];
    }
    v10[0] = 67109378;
    v10[1] = a4;
    __int16 v11 = 2112;
    id v12 = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Departure detected from leg: %d, reason: %@", (uint8_t *)v10, 0x12u);
  }

  [(MNTurnByTurnLocationTracker *)self _updateForDepartureFromLegIndex:a4 withReason:a5];
}

- (void)arrivalUpdater:(id)a3 didTimeoutAtLegIndex:(unint64_t)a4 withReason:(unint64_t)a5
{
  int v6 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5 == 1)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109120;
      int v13 = v6;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for departure from leg at index: %d", (uint8_t *)&v12, 8u);
    }

    uint64_t v10 = [(MNLocationTracker *)self safeDelegate];
    [v10 locationTracker:self didEndNavigatingWithReason:4];
    goto LABEL_9;
  }
  if (!a5)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109120;
      int v13 = v6;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "Timed out in arrival region based on server parameters at leg index: %d", (uint8_t *)&v12, 8u);
    }

    uint64_t v10 = [(MNLocationTracker *)self safeDelegate];
    [v10 locationTracker:self didEndNavigatingWithReason:7];
LABEL_9:
  }
}

- (void)arrivalUpdater:(id)a3 shouldShowChargingInfoForWaypoint:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(MNLocationTracker *)self safeDelegate];
  [v5 locationTracker:self shouldShowChargingInfoForWaypoint:v6];
}

- (void)trafficIncidentAlertUpdater:(id)a3 receivedAlert:(id)a4 responseCallback:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(MNLocationTracker *)self safeDelegate];
  [v8 locationTracker:self receivedTrafficIncidentAlert:v9 responseCallback:v7];
}

- (void)trafficIncidentAlertUpdater:(id)a3 invalidatedAlert:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(MNLocationTracker *)self safeDelegate];
  [v5 locationTracker:self invalidatedTrafficIncidentAlert:v6];
}

- (void)trafficIncidentAlertUpdater:(id)a3 didDismissAlert:(id)a4 withReroute:(BOOL)a5
{
  BOOL v5 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [v7 alertType];
  if ((unint64_t)(v8 - 3) >= 2)
  {
    if (v8 == 1)
    {
      id v9 = [(MNLocationTracker *)self navigationSession];
      uint64_t v10 = [v9 routeManager];
      __int16 v11 = [v10 currentRouteInfo];
      [(MNTurnByTurnLocationTracker *)self _updateForSelectedNewRoute:v11 alternateRoutes:0];
    }
  }
  else
  {
    if (v5) {
      [v7 mainRouteInfo];
    }
    else {
    int v12 = [v7 alternateRouteInfo];
    }
    v18[0] = v12;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v14 = [(MNLocationTracker *)self navigationSession];
    unint64_t v15 = [v14 routeManager];
    long long v16 = [v15 currentRouteInfo];
    [(MNTurnByTurnLocationTracker *)self _updateForSelectedNewRoute:v16 alternateRoutes:v13];
  }
  uint64_t v17 = [(MNLocationTracker *)self safeDelegate];
  [v17 locationTracker:self dismissedTrafficIncidentAlert:v7];
}

- (void)trafficIncidentAlertUpdater:(id)a3 updatedAlert:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(MNLocationTracker *)self safeDelegate];
  [v5 locationTracker:self updatedTrafficIncidentAlert:v6];
}

- (void)trafficIncidentAlertUpdater:(id)a3 didSwitchToNewRoute:(id)a4 forAlert:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  GEOFindOrCreateLog();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 uniqueRouteID];
    __int16 v11 = [v7 name];
    *(_DWORD *)buf = 138412547;
    __int16 v23 = v10;
    __int16 v24 = 2113;
    __int16 v25 = v11;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "Switching to new route because of Dodgeball alert. New route: %@, %{private}@", buf, 0x16u);
  }
  int v12 = [[MNActiveRouteInfo alloc] initWithRoute:v7];
  [(MNTurnByTurnLocationTracker *)self reroute:v12 reason:2];
  unint64_t v13 = [v8 alertType];
  if (v13 <= 7 && ((1 << v13) & 0x9A) != 0)
  {
    if ([v8 alertType] == 1 || objc_msgSend(v8, "alertType") == 7)
    {
      uint64_t v14 = [v8 originalRoute];
    }
    else
    {
      uint64_t v14 = [v8 alternateRoute];
    }
    unint64_t v15 = (void *)v14;
    if (v14)
    {
      long long v16 = [[MNActiveRouteInfo alloc] initWithRoute:v14];
      uint64_t v21 = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    }
    else
    {
      uint64_t v17 = 0;
    }
    long long v18 = [(MNLocationTracker *)self navigationSession];
    long long v19 = [v18 routeManager];
    id v20 = [v19 currentRouteInfo];
    [(MNTurnByTurnLocationTracker *)self _updateForSelectedNewRoute:v20 alternateRoutes:v17];
  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  v39[6] = *MEMORY[0x1E4F143B8];
  id v4 = [(MNLocationTracker *)self lastMatchedLocation];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  v38[0] = @"isGoodMatch";
  id v6 = NSNumber;
  unint64_t v34 = [v4 routeMatch];
  double v31 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v34, "isGoodMatch"));
  v39[0] = v31;
  v38[1] = @"routeCoordinate";
  __int16 v33 = [v4 routeMatch];
  [v33 routeCoordinate];
  id v32 = GEOPolylineCoordinateAsFullString();
  v39[1] = v32;
  v38[2] = @"locationCoordinate";
  id v7 = NSString;
  [v4 coordinate];
  uint64_t v9 = v8;
  [v4 coordinate];
  __int16 v11 = [v7 stringWithFormat:@"%f, %f", v9, v10];
  v39[2] = v11;
  v38[3] = @"course";
  int v12 = NSNumber;
  [v4 course];
  unint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  v39[3] = v13;
  v38[4] = @"stepIndex";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "stepIndex"));
  v39[4] = v14;
  void v38[5] = @"distanceFromRoute";
  unint64_t v15 = NSNumber;
  long long v16 = [v4 routeMatch];
  [v16 distanceFromRoute];
  uint64_t v17 = objc_msgSend(v15, "numberWithDouble:");
  v39[5] = v17;
  long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:6];
  __int16 v35 = [v5 dictionaryWithDictionary:v18];

  [v4 altitude];
  if (v19 != 1.79769313e308)
  {
    id v20 = NSNumber;
    [v4 altitude];
    uint64_t v21 = objc_msgSend(v20, "numberWithDouble:");
    [v35 setObject:v21 forKeyedSubscript:@"altitude"];
  }
  v36[0] = @"navigationState";
  double v22 = objc_msgSend(NSNumber, "numberWithInt:", -[MNLocationTracker state](self, "state"));
  v37[0] = v22;
  v36[1] = @"targetLegIndex";
  __int16 v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
  v37[1] = v23;
  v36[2] = @"mapMatcher.targetLegIndex";
  __int16 v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GEONavigationMapMatcher targetLegIndex](self->_mapMatcher, "targetLegIndex"));
  v37[2] = v24;
  v36[3] = @"lastArrivalLegIndex";
  unint64_t lastArrivalLegIndex = self->_lastArrivalLegIndex;
  if (lastArrivalLegIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v26 = &unk_1F0E35100;
  }
  else
  {
    uint64_t v26 = [NSNumber numberWithUnsignedInteger:self->_lastArrivalLegIndex];
  }
  v37[3] = v26;
  v37[4] = v35;
  v36[4] = @"lastLocation";
  void v36[5] = @"sessionState";
  __int16 v27 = [(MNLocationTracker *)self navigationSession];
  __int16 v28 = [v27 serverSessionStateInfo];
  v37[5] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:6];

  if (lastArrivalLegIndex != 0x7FFFFFFFFFFFFFFFLL) {
  return v29;
  }
}

- (MNLocation)lastKnownGoodLocationOnRoute
{
  return self->_lastKnownGoodLocationOnRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMatcher, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlertUpdater, 0);
  objc_storeStrong((id *)&self->_lastKnownGoodLocationOnRoute, 0);
  objc_storeStrong((id *)&self->_rerouteDates, 0);
  objc_storeStrong((id *)&self->_previousRerouteLocation, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_offlineCoordinator, 0);
  objc_storeStrong((id *)&self->_arrivalUpdater, 0);
  objc_storeStrong((id *)&self->_mapMatcher, 0);
}

- (void)offlineCoordinatorDidDetectOnline:(id)a3
{
  BOOL v5 = [(MNLocationTracker *)self lastMatchedLocation];
  id v8 = [(MNTurnByTurnLocationTracker *)self _rerouteRequestParametersForLocation:v5 transportType:[(MNLocationTracker *)self transportType]];

  [v8 setRequestType:15];
  id v6 = [v8 traits];
  id v7 = v6;
  if (!v6)
  {
    id v3 = [MEMORY[0x1E4F64710] sharedService];
    id v7 = [v3 defaultTraits];
  }
  [v8 setTraits:v7];
  if (!v6)
  {
  }
  [(MNTurnByTurnLocationTracker *)self _changeOfflineMode:1 reason:15 requestParameters:v8 errorHandler:0];
}

@end