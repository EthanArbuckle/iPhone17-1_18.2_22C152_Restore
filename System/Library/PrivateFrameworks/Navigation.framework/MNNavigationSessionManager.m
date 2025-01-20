@interface MNNavigationSessionManager
- (BOOL)repeatCurrentGuidance;
- (BOOL)repeatCurrentTrafficAlert;
- (BOOL)vibrateForPrompt:(unint64_t)a3;
- (BOOL)wantsETAUpdates;
- (GEOApplicationAuditToken)auditToken;
- (MNNavigationSession)navigationSession;
- (MNNavigationSessionManager)init;
- (MNNavigationSessionManager)initWithAuditToken:(id)a3;
- (MNNavigationSessionManagerDelegate)delegate;
- (MNNavigationTraceManager)traceManager;
- (MNRouteManager)routeManager;
- (MNSessionUpdateManager)updateManager;
- (MNSimulationLocationProvider)simulationLocationProvider;
- (id)_proxyUpdater;
- (id)_routeManager;
- (id)_traceManager;
- (id)recentLocationHistoryForUpdateManager:(id)a3;
- (id)routeInfoForUpdateManager:(id)a3 reason:(unint64_t)a4;
- (id)userLocationForUpdateManager:(id)a3;
- (int)state;
- (unint64_t)targetLegIndex;
- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4;
- (void)advanceToNextLeg;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)dealloc;
- (void)disableNavigationCapability:(unint64_t)a3;
- (void)enableNavigationCapability:(unint64_t)a3;
- (void)forceReroute;
- (void)insertWaypoint:(id)a3;
- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6;
- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6;
- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationSession:(id)a3 didDismissTrafficIncidentAlert:(id)a4;
- (void)navigationSession:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationSession:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 didFailRerouteWithError:(id)a4;
- (void)navigationSession:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationSession:(id)a3 didProcessSpeechEvent:(id)a4;
- (void)navigationSession:(id)a3 didReachETAUpdatePosition:(id)a4;
- (void)navigationSession:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4;
- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationSession:(id)a3 didReceiveTransitAlert:(id)a4;
- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7;
- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4;
- (void)navigationSession:(id)a3 didStartSpeakingPrompt:(id)a4;
- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6;
- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4;
- (void)navigationSession:(id)a3 didUpdateBackgroundWalkingRoute:(id)a4;
- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4;
- (void)navigationSession:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5;
- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationSession:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5;
- (void)navigationSession:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationSession:(id)a3 didUpdateVehicleParkingInfo:(id)a4;
- (void)navigationSession:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationSession:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10;
- (void)navigationSession:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8;
- (void)navigationSession:(id)a3 hideJunctionViewForId:(id)a4;
- (void)navigationSession:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationSession:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 newGuidanceEventFeedback:(id)a4;
- (void)navigationSession:(id)a3 proceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6;
- (void)navigationSession:(id)a3 shouldEndWithReason:(unint64_t)a4;
- (void)navigationSession:(id)a3 showJunctionView:(id)a4;
- (void)navigationSession:(id)a3 showLaneDirections:(id)a4;
- (void)navigationSession:(id)a3 triggerHaptics:(int)a4;
- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4;
- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationSession:(id)a3 updatedGuidanceEventFeedback:(id)a4;
- (void)navigationSession:(id)a3 usePersistentDisplay:(BOOL)a4;
- (void)navigationSession:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5;
- (void)navigationSession:(id)a3 willProcessSpeechEvent:(id)a4;
- (void)navigationSessionBeginGuidanceUpdate:(id)a3;
- (void)navigationSessionDidArrive:(id)a3;
- (void)navigationSessionDidCancelReroute:(id)a3;
- (void)navigationSessionDidEnterPreArrivalState:(id)a3;
- (void)navigationSessionDidFinishLocationUpdate:(id)a3;
- (void)navigationSessionEndGuidanceUpdate:(id)a3;
- (void)navigationSessionHideSecondaryStep:(id)a3;
- (void)navigationSessionWillPause:(id)a3;
- (void)navigationSessionWillReroute:(id)a3;
- (void)navigationSessionWillResumeFromPause:(id)a3;
- (void)navigationTraceManager:(id)a3 didUpdateTracePlaybackDetails:(id)a4;
- (void)pauseRealtimeUpdatesForSubscriber:(id)a3;
- (void)recordPedestrianTracePath:(id)a3;
- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3;
- (void)rerouteWithWaypoints:(id)a3;
- (void)resumeOriginalDestination;
- (void)resumeRealtimeUpdatesForSubscriber:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsDisplayingNavigationTray:(BOOL)a3;
- (void)setIsNavigatingInLowGuidance:(BOOL)a3;
- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4;
- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4;
- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)setSimulationPosition:(double)a3;
- (void)setSimulationSpeedMultiplier:(double)a3;
- (void)setSimulationSpeedOverride:(double)a3;
- (void)setTraceIsPlaying:(BOOL)a3;
- (void)setTracePlaybackSpeed:(double)a3;
- (void)setTracePosition:(double)a3;
- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3;
- (void)startNavigationWithDetails:(id)a3;
- (void)stopCurrentGuidancePrompt;
- (void)stopNavigationWithReason:(unint64_t)a3;
- (void)switchToDestinationRoute;
- (void)switchToRoute:(id)a3;
- (void)updateDestination:(id)a3;
- (void)updateForStartNavigation:(id)a3;
- (void)updateManager:(id)a3 didReceiveETAResponse:(id)a4;
- (void)updateManager:(id)a3 didReceiveTransitError:(id)a4;
- (void)updateManager:(id)a3 didReceiveTransitUpdateResponse:(id)a4;
- (void)updateManager:(id)a3 didReceiveTransitUpdates:(id)a4;
- (void)updateManager:(id)a3 willSendETARequest:(id)a4;
- (void)updateManager:(id)a3 willSendTransitUpdateRequestForRouteIDs:(id)a4;
- (void)updateManager:(id)a3 willSendTransitUpdateRequests:(id)a4;
- (void)updateWithInitialLocation:(id)a3;
- (void)userOptionsEngine:(id)a3 didChangeFrom:(id)a4 to:(id)a5;
@end

@implementation MNNavigationSessionManager

- (MNNavigationSessionManager)init
{
  result = (MNNavigationSessionManager *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MNNavigationSessionManager)initWithAuditToken:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationSessionManager;
  v6 = [(MNNavigationSessionManager *)&v12 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trafficIncidentAlertCallbacks = v6->_trafficIncidentAlertCallbacks;
    v6->_trafficIncidentAlertCallbacks = v7;

    objc_storeStrong((id *)&v6->_auditToken, a3);
    v9 = +[MNUserOptionsEngine sharedInstance];
    [v9 registerObserver:v6];

    v10 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(MNNavigationSessionManager *)self stopNavigationWithReason:0];
  v3 = +[MNUserOptionsEngine sharedInstance];
  [v3 unregisterObserver:self];

  [(MNRouteManager *)self->_routeManager close];
  v4.receiver = self;
  v4.super_class = (Class)MNNavigationSessionManager;
  [(MNNavigationSessionManager *)&v4 dealloc];
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v24 = a3;
  v6 = [(MNNavigationSessionManager *)self _routeManager];
  [v6 updateWithPreviewRoutes:v24 selectedRouteIndex:a4];
  uint64_t v7 = [v24 count];
  v8 = [(MNNavigationSessionManager *)self _proxyUpdater];
  v9 = v8;
  if (v7)
  {
    v10 = [v24 firstObject];
    v11 = [v10 route];
    objc_msgSend(v9, "enteredRoutePreviewWithTransportType:", objc_msgSend(v11, "transportType"));
  }
  else
  {
    [v8 navigationSessionStopped:0];
  }

  objc_super v12 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 sessionUpdater];
    if (v14)
    {
    }
    else if (GEOConfigGetBOOL())
    {
      goto LABEL_12;
    }
  }
  v15 = [v13 sessionUpdater];
  updateManager = v15;
  if (v15 || (updateManager = self->_updateManager) != 0) {
    v17 = updateManager;
  }
  else {
    v17 = objc_alloc_init(MNSessionUpdateManager);
  }
  v18 = self->_updateManager;
  self->_updateManager = v17;

  [(MNSessionUpdateManager *)self->_updateManager setDelegate:self];
  v19 = [(MNRouteManager *)self->_routeManager requestingAppIdentifier];
  [(MNSessionUpdateManager *)self->_updateManager setRequestingAppIdentifier:v19];

  [(MNSessionUpdateManager *)self->_updateManager setAuditToken:self->_auditToken];
  v20 = self->_updateManager;
  v21 = [(MNRouteManager *)self->_routeManager previewRoutes];
  [(MNSessionUpdateManager *)v20 startUpdateRequestsForRoutes:v21 andNavigationType:[(MNNavigationSession *)self->_navigationSession navigationType]];

LABEL_12:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v23 = [v6 previewRoutes];
  objc_msgSend(WeakRetained, "navigationSessionManager:didUpdatePreviewRoutes:withSelectedRouteIndex:", self, v23, objc_msgSend(v6, "selectedRouteIndex"));
}

- (void)updateForStartNavigation:(id)a3
{
  id v28 = a3;
  objc_super v4 = [(MNNavigationSessionManager *)self _routeManager];
  id v5 = [(MNNavigationSessionManager *)self _traceManager];
  -[MNNavigationTraceManager setNavigationType:](self->_traceManager, "setNavigationType:", [v28 navigationType]);
  v6 = [v28 tracePlaybackPath];

  if (v6)
  {
    traceManager = self->_traceManager;
    v8 = [v28 tracePlaybackPath];
    [(MNNavigationTraceManager *)traceManager openForPlaybackWithTracePath:v8];
  }
  [v4 updateWithStartNavigationDetails:v28];
  v9 = [[MNSimulationLocationProvider alloc] initWithStartNavigationDetails:v28];
  simulationLocationProvider = self->_simulationLocationProvider;
  self->_simulationLocationProvider = v9;

  v11 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];

  if (!v11)
  {
    if ([v28 isReconnecting]
      && ([v28 traceRecordingNameOverride],
          objc_super v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      v13 = self->_traceManager;
      v14 = [v28 traceRecordingNameOverride];
      [(MNNavigationTraceManager *)v13 openForRecordingWithTraceRecordingData:0 traceName:v14 selectedRouteIndex:0 isReconnecting:1 isSimulation:0];
    }
    else
    {
      v15 = [v28 traceRecordingData];

      if (!v15) {
        goto LABEL_13;
      }
      uint64_t v16 = [v28 simulationType];
      v17 = self->_traceManager;
      if (v16 == -1)
      {
        v14 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
        v18 = [v28 traceRecordingData];
        v19 = [v28 traceRecordingNameOverride];
        [(MNNavigationTraceManager *)v17 openForSimulationWithRoute:v14 traceRecordingData:v18 traceNameOverride:v19];
      }
      else
      {
        v14 = [v28 traceRecordingData];
        v18 = [v28 traceRecordingNameOverride];
        -[MNNavigationTraceManager openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnecting:isSimulation:](v17, "openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnecting:isSimulation:", v14, v18, [v28 selectedRouteIndex], 0, objc_msgSend(v28, "simulationType") != 0);
      }
    }
  }
LABEL_13:
  [(MNSessionUpdateManager *)self->_updateManager stopUpdateRequests];
  [(MNSessionUpdateManager *)self->_updateManager setDelegate:0];
  updateManager = self->_updateManager;
  self->_updateManager = 0;

  v21 = objc_opt_new();
  objc_msgSend(v21, "setNavigationType:", objc_msgSend(v28, "navigationType"));
  objc_msgSend(v21, "setSimulationType:", objc_msgSend(v28, "simulationType"));
  v22 = [v4 currentRouteInfo];
  [v21 setRouteInfo:v22];

  objc_msgSend(v21, "setIsResumingMultiStopRoute:", objc_msgSend(v28, "isResumingMultipointRoute"));
  if ([v28 isReconnecting])
  {
    v23 = [v28 reconnectionDetails];
    objc_msgSend(v21, "setInitialRouteSource:", objc_msgSend(v23, "initialRouteSource"));
  }
  else
  {
    v23 = [v4 currentRouteInfo];
    id v24 = [v23 route];
    objc_msgSend(v21, "setInitialRouteSource:", objc_msgSend(v24, "source"));
  }
  if ([v28 navigationType] == 3)
  {
    v25 = +[MNVoiceLanguageUtil systemDefaultVoiceLanguage];
    v26 = +[MNUserOptionsEngine sharedInstance];
    [v26 updateNavigationSessionLanguage:v25];

    [v21 setVoiceLanguage:v25];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didSendNavigationServiceCallback:v21];
}

- (void)startNavigationWithDetails:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[MNNavigationSession alloc] initWithRouteManager:self->_routeManager auditToken:self->_auditToken traceManager:self->_traceManager];
  navigationSession = self->_navigationSession;
  self->_navigationSession = v5;

  [(MNNavigationSession *)self->_navigationSession registerObserver:self];
  uint64_t v7 = [(MNNavigationSessionManager *)self _proxyUpdater];
  [(MNNavigationSession *)self->_navigationSession registerObserver:v7];
  [(MNNavigationSession *)self->_navigationSession startNavigationSessionWithDetails:v4];

  v8 = [(MNRouteManager *)self->_routeManager currentRouteInfo];

  if (!v8)
  {
    v25 = [NSString stringWithFormat:@"routeManager.currentRouteInfo is unexpectedly nil"];
    v26 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "-[MNNavigationSessionManager startNavigationWithDetails:]";
      __int16 v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v32 = 1024;
      int v33 = 189;
      __int16 v34 = 2080;
      v35 = "_routeManager.currentRouteInfo != nil";
      __int16 v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_1B542B000, v26, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  v9 = [(MNRouteManager *)self->_routeManager currentRouteInfo];

  if (v9)
  {
    v10 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];
    v11 = v10;
    if (v10)
    {
      objc_super v12 = [v10 sessionUpdater];
      if (v12)
      {
      }
      else if (GEOConfigGetBOOL())
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [v11 sessionUpdater];
    updateManager = v13;
    if (v13 || (updateManager = self->_updateManager) != 0) {
      v15 = updateManager;
    }
    else {
      v15 = objc_alloc_init(MNSessionUpdateManager);
    }
    uint64_t v16 = self->_updateManager;
    self->_updateManager = v15;

    [(MNSessionUpdateManager *)self->_updateManager setDelegate:self];
    v17 = [(MNRouteManager *)self->_routeManager requestingAppIdentifier];
    [(MNSessionUpdateManager *)self->_updateManager setRequestingAppIdentifier:v17];

    [(MNSessionUpdateManager *)self->_updateManager setAuditToken:self->_auditToken];
    v18 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
    v19 = [v18 route];
    v20 = [v19 origin];
    v21 = [v20 latLng];
    [(MNSessionUpdateManager *)self->_updateManager setTripOrigin:v21];

    v22 = self->_updateManager;
    v23 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
    v27 = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [(MNSessionUpdateManager *)v22 startUpdateRequestsForRoutes:v24 andNavigationType:[(MNNavigationSession *)self->_navigationSession navigationType]];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)updateWithInitialLocation:(id)a3
{
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v7 = 4;
  }
  else if (a3 == 2)
  {
    id v5 = [(MNNavigationSession *)self->_navigationSession navigationSessionState];
    unint64_t v6 = [v5 arrivalState] - 2;

    if (v6 >= 3) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 6;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(MNSessionUpdateManager *)self->_updateManager stopUpdateRequests];
  [(MNSessionUpdateManager *)self->_updateManager sendFinalETAURequestWithReason:v7];
  [(MNSessionUpdateManager *)self->_updateManager setDelegate:0];
  updateManager = self->_updateManager;
  self->_updateManager = 0;

  navigationSession = self->_navigationSession;
  self->_navigationSession = 0;
  v13 = navigationSession;

  [(MNNavigationSession *)v13 stopNavigationSessionWithReason:a3];
  [(MNNavigationSession *)v13 unregisterObserver:self->_proxyUpdater];
  proxyUpdater = self->_proxyUpdater;
  self->_proxyUpdater = 0;

  [(MNNavigationSession *)v13 unregisterObserver:self];
  routeManager = self->_routeManager;
  self->_routeManager = 0;

  [(MNNavigationTraceManager *)self->_traceManager setDelegate:0];
  [(MNNavigationTraceManager *)self->_traceManager close];
  traceManager = self->_traceManager;
  self->_traceManager = 0;
}

- (void)rerouteWithWaypoints:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    unint64_t v6 = [NSString stringWithFormat:@"Did not find navigation session while rerouting with waypoints"];
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      v9 = "-[MNNavigationSessionManager rerouteWithWaypoints:]";
      __int16 v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v12 = 1024;
      int v13 = 254;
      __int16 v14 = 2080;
      v15 = "(_navigationSession != nil)";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession rerouteWithWaypoints:v4];
}

- (void)insertWaypoint:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    unint64_t v6 = [NSString stringWithFormat:@"Did not find navigation session while inserting waypoint"];
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      v9 = "-[MNNavigationSessionManager insertWaypoint:]";
      __int16 v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v12 = 1024;
      int v13 = 260;
      __int16 v14 = 2080;
      v15 = "(_navigationSession != nil)";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession insertWaypoint:v4];
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    unint64_t v6 = [NSString stringWithFormat:@"Did not find navigation session while removing waypoint"];
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      v9 = "-[MNNavigationSessionManager removeWaypointAtIndex:]";
      __int16 v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v12 = 1024;
      int v13 = 266;
      __int16 v14 = 2080;
      v15 = "(_navigationSession != nil)";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession removeWaypointAtIndex:a3];
}

- (void)advanceToNextLeg
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    id v4 = [NSString stringWithFormat:@"Did not find navigation session while changing next waypoint"];
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136316162;
      uint64_t v7 = "-[MNNavigationSessionManager advanceToNextLeg]";
      __int16 v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v10 = 1024;
      int v11 = 272;
      __int16 v12 = 2080;
      int v13 = "(_navigationSession != nil)";
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v6, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession advanceToNextLeg];
}

- (void)updateDestination:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    int v6 = [NSString stringWithFormat:@"Did not find navigation session while updating destination"];
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      v9 = "-[MNNavigationSessionManager updateDestination:]";
      __int16 v10 = 2080;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v12 = 1024;
      int v13 = 278;
      __int16 v14 = 2080;
      v15 = "(_navigationSession != nil)";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession updateDestination:v4];
}

- (void)resumeOriginalDestination
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    id v4 = [NSString stringWithFormat:@"Did not find navigation session while resuming original destination"];
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136316162;
      uint64_t v7 = "-[MNNavigationSessionManager resumeOriginalDestination]";
      __int16 v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v10 = 1024;
      int v11 = 284;
      __int16 v12 = 2080;
      int v13 = "(_navigationSession != nil)";
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v6, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession resumeOriginalDestination];
}

- (void)forceReroute
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    id v4 = [NSString stringWithFormat:@"Did not find navigation session while forcing reroute"];
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136316162;
      uint64_t v7 = "-[MNNavigationSessionManager forceReroute]";
      __int16 v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v10 = 1024;
      int v11 = 290;
      __int16 v12 = 2080;
      int v13 = "(_navigationSession != nil)";
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v6, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession forceReroute];
}

- (void)switchToRoute:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    int v6 = [NSString stringWithFormat:@"Did not find navigation session while switching to route"];
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      v9 = "-[MNNavigationSessionManager switchToRoute:]";
      __int16 v10 = 2080;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v12 = 1024;
      int v13 = 296;
      __int16 v14 = 2080;
      v15 = "(_navigationSession != nil)";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession switchToRoute:v4];
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    int v8 = [NSString stringWithFormat:@"Did not find navigation session while switching to route"];
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      int v11 = "-[MNNavigationSessionManager changeTransportType:route:]";
      __int16 v12 = 2080;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v14 = 1024;
      int v15 = 302;
      __int16 v16 = 2080;
      v17 = "(_navigationSession != nil)";
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v10, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  [(MNNavigationSession *)navigationSession changeTransportType:v4 route:v6];
}

- (void)switchToDestinationRoute
{
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
}

- (BOOL)repeatCurrentGuidance
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    id v5 = [NSString stringWithFormat:@"Did not find navigation session while repeating current guidance"];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      int v8 = "-[MNNavigationSessionManager repeatCurrentGuidance]";
      __int16 v9 = 2080;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v11 = 1024;
      int v12 = 318;
      __int16 v13 = 2080;
      __int16 v14 = "(_navigationSession != nil)";
      __int16 v15 = 2112;
      __int16 v16 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  return [(MNNavigationSession *)navigationSession repeatCurrentGuidance];
}

- (BOOL)repeatCurrentTrafficAlert
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    id v5 = [NSString stringWithFormat:@"Did not find navigation session while repeating current traffic alert"];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      int v8 = "-[MNNavigationSessionManager repeatCurrentTrafficAlert]";
      __int16 v9 = 2080;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v11 = 1024;
      int v12 = 324;
      __int16 v13 = 2080;
      __int16 v14 = "(_navigationSession != nil)";
      __int16 v15 = 2112;
      __int16 v16 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  return [(MNNavigationSession *)navigationSession repeatCurrentTrafficAlert];
}

- (BOOL)vibrateForPrompt:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  navigationSession = self->_navigationSession;
  if (!navigationSession)
  {
    int v7 = [NSString stringWithFormat:@"Did not find navigation session while vibrating for prompt"];
    int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      int v10 = "-[MNNavigationSessionManager vibrateForPrompt:]";
      __int16 v11 = 2080;
      int v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v13 = 1024;
      int v14 = 330;
      __int16 v15 = 2080;
      __int16 v16 = "(_navigationSession != nil)";
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v9, 0x30u);
    }

    navigationSession = self->_navigationSession;
  }
  return [(MNNavigationSession *)navigationSession vibrateForPrompt:a3];
}

- (void)stopCurrentGuidancePrompt
{
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  BOOL v3 = a3;
  -[MNNavigationSession setIsConnectedToCarplay:](self->_navigationSession, "setIsConnectedToCarplay:");
  proxyUpdater = self->_proxyUpdater;
  [(MNNavigationProxyUpdater *)proxyUpdater setIsConnectedToCarplay:v3];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  if ([(MNNavigationSession *)self->_navigationSession displayedStepIndex] != a3)
  {
    [(MNNavigationSession *)self->_navigationSession setDisplayedStepIndex:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationSessionManager:self didUpdateDisplayedStepIndex:a3 segmentIndex:0];
  }
  proxyUpdater = self->_proxyUpdater;
  [(MNNavigationProxyUpdater *)proxyUpdater setDisplayedStepIndex:a3];
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  int v7 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
  if (self->_navigationSession)
  {
    id v15 = v7;
    int v8 = [v7 route];
    int v9 = [v8 segments];
    unint64_t v10 = [v9 count];

    int v7 = v15;
    if (v10 > a4)
    {
      __int16 v11 = [v15 route];
      int v12 = [v11 segments];
      __int16 v13 = [v12 objectAtIndex:a4];

      if ([v13 type] == 6)
      {
        [v13 setSelectedRideOptionIndex:a3];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained navigationSessionManager:self didUpdateRouteWithNewRideSelection:v15];

        [(MNNavigationProxyUpdater *)self->_proxyUpdater updateClusteredSectionSelectedRideForNavigationSession:self->_navigationSession];
        [(MNNavigationSession *)self->_navigationSession switchToRoute:v15];
      }

      int v7 = v15;
    }
  }
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
}

- (void)disableNavigationCapability:(unint64_t)a3
{
  unint64_t v4 = [(MNNavigationSession *)self->_navigationSession navigationCapabilities] & ~a3;
  navigationSession = self->_navigationSession;
  [(MNNavigationSession *)navigationSession setNavigationCapabilities:v4];
}

- (void)enableNavigationCapability:(unint64_t)a3
{
  unint64_t v4 = [(MNNavigationSession *)self->_navigationSession navigationCapabilities] & a3;
  navigationSession = self->_navigationSession;
  [(MNNavigationSession *)navigationSession setNavigationCapabilities:v4];
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  trafficIncidentAlertCallbacks = self->_trafficIncidentAlertCallbacks;
  int v8 = [v6 alertID];
  int v9 = [(NSMutableDictionary *)trafficIncidentAlertCallbacks objectForKey:v8];

  if (v9)
  {
    unint64_t v10 = self->_trafficIncidentAlertCallbacks;
    __int16 v11 = [v6 alertID];
    [(NSMutableDictionary *)v10 removeObjectForKey:v11];

    v9[2](v9, v4);
  }
  else
  {
    int v12 = [NSString stringWithFormat:@"Did not find traffic incident alert handler"];
    __int16 v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      id v15 = "-[MNNavigationSessionManager acceptReroute:forTrafficIncidentAlert:]";
      __int16 v16 = 2080;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v18 = 1024;
      int v19 = 404;
      __int16 v20 = 2080;
      v21 = "(responseHandler != nil)";
      __int16 v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v14, 0x30u);
    }
  }
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];
  id v5 = v4;
  if (v3) {
    [v4 resume];
  }
  else {
    [v4 pause];
  }
}

- (void)setTracePlaybackSpeed:(double)a3
{
  id v4 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];
  [v4 setSpeedMultiplier:a3];
}

- (void)setTracePosition:(double)a3
{
  id v5 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];
  [v5 jumpToTime:a3];

  navigationSession = self->_navigationSession;
  [(MNNavigationSession *)navigationSession traceJumpedInTime];
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 trace];
    [v6 position];
    double v9 = v8;
    if (v7)
    {
LABEL_3:
      unint64_t v10 = [[MNTraceBookmarkRecorder alloc] initWithTrace:v7];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __84__MNNavigationSessionManager_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke;
      v14[3] = &unk_1E60F7AD8;
      id v15 = v7;
      __int16 v16 = self;
      [(MNTraceBookmarkRecorder *)v10 recordBookmarkAtTime:v4 withScreenshotData:v14 completionHandler:v9];
    }
  }
  else
  {
    __int16 v11 = [(MNNavigationTraceManager *)self->_traceManager traceRecorder];
    int v12 = v11;
    if (v11)
    {
      int v7 = [v11 trace];
      [v12 timeSinceRecordingBegan];
      double v9 = v13;
    }
    else
    {
      int v7 = 0;
      double v9 = 0.0;
    }

    if (v7) {
      goto LABEL_3;
    }
  }
}

void __84__MNNavigationSessionManager_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = objc_alloc_init(MNTracePlaybackDetails);
  [(MNTracePlaybackDetails *)v6 setEventType:6];
  [(MNTracePlaybackDetails *)v6 setRecordedBookmarkID:a2];
  id v4 = [*(id *)(a1 + 32) serializableBookmarks];
  [(MNTracePlaybackDetails *)v6 setBookmarks:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  [WeakRetained navigationSessionManager:*(void *)(a1 + 40) didUpdateTracePlaybackDetails:v6];
}

- (void)recordPedestrianTracePath:(id)a3
{
  traceManager = self->_traceManager;
  id v4 = a3;
  id v7 = [(MNNavigationTraceManager *)traceManager traceRecorder];
  [v7 recordMiscInfo:@"pedestrian_trace_path" value:v4];

  id v5 = NSNumber;
  [v7 timeSinceRecordingBegan];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v7 recordMiscInfo:@"pedestrian_trace_relative_timestamp" value:v6];
}

- (void)setSimulationSpeedOverride:(double)a3
{
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
}

- (void)setSimulationPosition:(double)a3
{
}

- (id)_routeManager
{
  routeManager = self->_routeManager;
  if (!routeManager)
  {
    id v4 = [[MNRouteManager alloc] initWithAuditToken:self->_auditToken];
    id v5 = self->_routeManager;
    self->_routeManager = v4;

    [(MNRouteManager *)self->_routeManager open];
    routeManager = self->_routeManager;
  }
  return routeManager;
}

- (id)_proxyUpdater
{
  proxyUpdater = self->_proxyUpdater;
  if (!proxyUpdater)
  {
    id v4 = objc_alloc_init(MNNavigationProxyUpdater);
    id v5 = self->_proxyUpdater;
    self->_proxyUpdater = v4;

    proxyUpdater = self->_proxyUpdater;
  }
  return proxyUpdater;
}

- (id)_traceManager
{
  traceManager = self->_traceManager;
  if (!traceManager)
  {
    id v4 = objc_alloc_init(MNNavigationTraceManager);
    id v5 = self->_traceManager;
    self->_traceManager = v4;

    [(MNNavigationTraceManager *)self->_traceManager setTraceManagerDelegate:self];
    traceManager = self->_traceManager;
  }
  return traceManager;
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  BOOL v3 = a3;
  -[MNNavigationProxyUpdater setIsNavigatingInLowGuidance:](self->_proxyUpdater, "setIsNavigatingInLowGuidance:");
  navigationSession = self->_navigationSession;
  [(MNNavigationSession *)navigationSession setIsNavigatingInLowGuidance:v3];
}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
}

- (void)updateManager:(id)a3 willSendTransitUpdateRequests:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(MNNavigationTraceManager *)self->_traceManager traceRecorder];
  [v6 timeSinceRecordingBegan];
  double v8 = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
        id v15 = [(MNNavigationTraceManager *)self->_traceManager traceRecorder];
        [v15 recordTransitUpdateRequest:v14 withTimestamp:v8];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)updateManager:(id)a3 didReceiveTransitUpdateResponse:(id)a4
{
  traceManager = self->_traceManager;
  id v5 = a4;
  id v6 = [(MNNavigationTraceManager *)traceManager traceRecorder];
  [v6 recordTransitUpdateResponse:v5];
}

- (void)updateManager:(id)a3 willSendTransitUpdateRequestForRouteIDs:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self willSendTransitUpdateRequestForRouteIDs:v6];
}

- (void)updateManager:(id)a3 didReceiveTransitUpdates:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didReceiveTransitUpdates:v6];
}

- (void)updateManager:(id)a3 didReceiveTransitError:(id)a4
{
  traceManager = self->_traceManager;
  id v5 = a4;
  id v6 = [(MNNavigationTraceManager *)traceManager traceRecorder];
  [v6 recordTransitUpdateError:v5];
}

- (void)updateManager:(id)a3 willSendETARequest:(id)a4
{
}

- (void)updateManager:(id)a3 didReceiveETAResponse:(id)a4
{
}

- (BOOL)wantsETAUpdates
{
  return [(MNNavigationSession *)self->_navigationSession wantsETAUpdates];
}

- (id)routeInfoForUpdateManager:(id)a3 reason:(unint64_t)a4
{
  return [(MNNavigationSession *)self->_navigationSession routeInfoForUpdateManager:a3 reason:a4];
}

- (id)userLocationForUpdateManager:(id)a3
{
  return [(MNNavigationSession *)self->_navigationSession userLocationForUpdateManager:a3];
}

- (id)recentLocationHistoryForUpdateManager:(id)a3
{
  return [(MNNavigationSession *)self->_navigationSession recentLocationHistoryForUpdateManager:a3];
}

- (unint64_t)targetLegIndex
{
  return [(MNNavigationSession *)self->_navigationSession targetLegIndex];
}

- (int)state
{
  return [(MNNavigationSession *)self->_navigationSession state];
}

- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didChangeNavigationState:v4];
}

- (void)navigationSession:(id)a3 shouldEndWithReason:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self shouldEndWithReason:a4];
}

- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = [v5 uuid];
    int v10 = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationSessionManager::navigationSession:didUpdateMatchedLocation:", (uint8_t *)&v10, 0xCu);
  }
  double v8 = objc_opt_new();
  [v8 setLocation:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didSendNavigationServiceCallback:v8];
}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v9 = (id)objc_opt_new();
  [v9 setStepIndex:a4];
  [v9 setSegmentIndex:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didSendNavigationServiceCallback:v9];
}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self currentStepIndex:a4 didUpdateDistanceUntilManeuver:a5 timeUntilManeuver:a6];
}

- (void)navigationSessionDidFinishLocationUpdate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerDidFinishLocationUpdate:self];
}

- (void)navigationSession:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self isApproachingEndOfLeg:a4];
}

- (void)navigationSession:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didEnterPreArrivalStateForWaypoint:v8 endOfLegIndex:a5];
}

- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didArriveAtWaypoint:v8 endOfLegIndex:a5];
}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  updateManager = self->_updateManager;
  id v10 = a4;
  [(MNSessionUpdateManager *)updateManager requestImmediateUpdateWithReason:5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didResumeNavigatingFromWaypoint:v10 endOfLegIndex:a5 reason:a6];
}

- (void)navigationSessionDidEnterPreArrivalState:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerDidEnterPreArrivalState:self];
}

- (void)navigationSessionDidArrive:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerDidArrive:self];
}

- (void)navigationSessionWillPause:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerWillPause:self];
}

- (void)navigationSessionWillResumeFromPause:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerWillResumeFromPause:self];
}

- (void)navigationSession:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didReceiveRouteSignalStrength:a4];
}

- (void)navigationSession:(id)a3 didReachETAUpdatePosition:(id)a4
{
}

- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v13 = (id)objc_opt_new();
  [v13 setDisplayETAInfo:v11];

  [v13 setRouteDistanceInfo:v10];
  [v13 setBatteryChargeInfo:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didSendNavigationServiceCallback:v13];
}

- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didUpdateETAResponseForRoute:v6];
}

- (void)navigationSession:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didUpdateHeading:a4 accuracy:a5];
}

- (void)navigationSession:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didUpdateMotionType:a4 confidence:a5];
}

- (void)navigationSessionWillReroute:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerWillReroute:self];
}

- (void)navigationSessionDidCancelReroute:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerDidCancelReroute:self];
}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  updateManager = self->_updateManager;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  [(MNSessionUpdateManager *)updateManager restartUpdateTimer];
  [(MNSimulationLocationProvider *)self->_simulationLocationProvider updateWithRouteInfo:v14 rerouteReason:a7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didRerouteWithRoute:v14 location:v13 withAlternateRoutes:v12 rerouteReason:a7];
}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  updateManager = self->_updateManager;
  id v10 = a5;
  [(MNSessionUpdateManager *)updateManager restartUpdateTimer];
  [(MNSimulationLocationProvider *)self->_simulationLocationProvider updateWithRouteInfo:v10 rerouteReason:a6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didSwitchToNewTransportType:v7 newRoute:v10];
}

- (void)navigationSession:(id)a3 didFailRerouteWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didFailRerouteWithError:v6];
}

- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didUpdateAlternateRoutes:v6];
}

- (void)navigationSession:(id)a3 proceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  p_delegate = &self->_delegate;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self proceedToRouteDistance:v10 displayString:a6 closestStepIndex:a4];
}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self currentStepIndex:a4 didUpdateDistanceUntilSign:a5 timeUntilSign:a6];
}

- (void)navigationSession:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self willAnnounce:a4 inSeconds:a5];
}

- (void)navigationSession:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v11 = *(void *)&a6;
  p_delegate = &self->_delegate;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v19) = a10;
  [WeakRetained navigationSessionManager:self displayPrimaryStep:v18 instructions:v17 shieldType:v11 shieldText:v16 drivingSide:v10 maneuverStepIndex:a9 isSynthetic:v19];
}

- (void)navigationSession:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self displayManeuverAlertForAnnouncementStage:a4];
}

- (void)navigationSession:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a6;
  p_delegate = &self->_delegate;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self displaySecondaryStep:v16 instructions:v15 shieldType:v9 shieldText:v14 drivingSide:v8];
}

- (void)navigationSessionHideSecondaryStep:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerHideSecondaryStep:self];
}

- (void)navigationSessionBeginGuidanceUpdate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerBeginGuidanceUpdate:self];
}

- (void)navigationSessionEndGuidanceUpdate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManagerEndGuidanceUpdate:self];
}

- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self updateSignsWithInfo:v6];
}

- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self updateSignsWithARInfo:v6];
}

- (void)navigationSession:(id)a3 usePersistentDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self usePersistentDisplay:v4];
}

- (void)navigationSession:(id)a3 showLaneDirections:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self showLaneDirections:v6];
}

- (void)navigationSession:(id)a3 hideLaneDirectionsForId:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self hideLaneDirectionsForId:v6];
}

- (void)navigationSession:(id)a3 showJunctionView:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self showJunctionView:v6];
}

- (void)navigationSession:(id)a3 hideJunctionViewForId:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self hideJunctionViewForId:v6];
}

- (void)navigationSession:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didEnableGuidancePrompts:v4];
}

- (void)navigationSession:(id)a3 newGuidanceEventFeedback:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self newGuidanceEventFeedback:v6];
}

- (void)navigationSession:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self updatedGuidanceEventFeedback:v6];
}

- (void)navigationSession:(id)a3 didUpdateBackgroundWalkingRoute:(id)a4
{
  id v5 = a4;
  uint64_t v7 = objc_alloc_init(MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute);
  [(MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute *)v7 setRouteInfo:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didSendNavigationServiceCallback:v7];
}

- (void)navigationSession:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
  id v5 = a4;
  uint64_t v7 = objc_alloc_init(MNNavigationServiceCallback_DidUpdateVehicleParkingInfo);
  [(MNNavigationServiceCallback_DidUpdateVehicleParkingInfo *)v7 setVehicleParkingInfo:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didSendNavigationServiceCallback:v7];
}

- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  trafficIncidentAlertCallbacks = self->_trafficIncidentAlertCallbacks;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1BA99B3A0](a5);
  uint64_t v10 = [v8 alertID];
  [(NSMutableDictionary *)trafficIncidentAlertCallbacks setObject:v9 forKey:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didReceiveTrafficIncidentAlert:v8];
}

- (void)navigationSession:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didUpdateTrafficIncidentAlert:v6];
}

- (void)navigationSession:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didInvalidateTrafficIncidentAlert:v6];
}

- (void)navigationSession:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  trafficIncidentAlertCallbacks = self->_trafficIncidentAlertCallbacks;
  id v6 = a4;
  uint64_t v7 = [v6 alertID];
  id v8 = [(NSMutableDictionary *)trafficIncidentAlertCallbacks objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v10 = [NSString stringWithFormat:@"Dodgeball response callback not called before dismissing"];
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      id v13 = "-[MNNavigationSessionManager navigationSession:didDismissTrafficIncidentAlert:]";
      __int16 v14 = 2080;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSessionManager.m";
      __int16 v16 = 1024;
      int v17 = 887;
      __int16 v18 = 2080;
      uint64_t v19 = "_trafficIncidentAlertCallbacks[dismissedAlert.alertID] == nil";
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v12, 0x30u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self didDismissTrafficIncidentAlert:v6];
}

- (void)navigationSession:(id)a3 didStartSpeakingPrompt:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didStartSpeakingPrompt:v6];
}

- (void)navigationSession:(id)a3 willProcessSpeechEvent:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self willProcessSpeechEvent:v6];
}

- (void)navigationSession:(id)a3 didProcessSpeechEvent:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didProcessSpeechEvent:v6];
}

- (void)navigationSession:(id)a3 triggerHaptics:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationSessionManager:self triggerHaptics:v4];
}

- (void)navigationSession:(id)a3 didReceiveTransitAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didReceiveTransitAlert:v6];
}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didSendNavigationServiceCallback:v6];
}

- (void)userOptionsEngine:(id)a3 didChangeFrom:(id)a4 to:(id)a5
{
}

- (void)navigationTraceManager:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationSessionManager:self didUpdateTracePlaybackDetails:v6];
}

- (MNNavigationSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNNavigationSessionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MNSessionUpdateManager)updateManager
{
  return self->_updateManager;
}

- (MNNavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (MNRouteManager)routeManager
{
  return self->_routeManager;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (MNNavigationTraceManager)traceManager
{
  return self->_traceManager;
}

- (MNSimulationLocationProvider)simulationLocationProvider
{
  return self->_simulationLocationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlertCallbacks, 0);
  objc_storeStrong((id *)&self->_simulationLocationProvider, 0);
  objc_storeStrong((id *)&self->_traceManager, 0);
  objc_storeStrong((id *)&self->_proxyUpdater, 0);
  objc_storeStrong((id *)&self->_routeManager, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end