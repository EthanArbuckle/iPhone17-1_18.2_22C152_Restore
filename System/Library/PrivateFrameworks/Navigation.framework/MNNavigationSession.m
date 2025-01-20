@interface MNNavigationSession
- (BOOL)guidanceManagerIsRerouting;
- (BOOL)guidancePromptsEnabled;
- (BOOL)isAllowedToSwitchTransportTypes;
- (BOOL)isConnectedToCarplay;
- (BOOL)isCurrentlySpeaking;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)repeatCurrentGuidance;
- (BOOL)repeatCurrentTrafficAlert;
- (BOOL)vibrateForPrompt:(unint64_t)a3;
- (BOOL)wantsETAUpdates;
- (GEOApplicationAuditToken)auditToken;
- (GEOComposedWaypoint)destination;
- (GEOMotionContext)motionContext;
- (MNAudioManager)audioManager;
- (MNLocation)lastMatchedLocation;
- (MNNavigationSession)init;
- (MNNavigationSession)initWithRouteManager:(id)a3 auditToken:(id)a4;
- (MNNavigationSession)initWithRouteManager:(id)a3 auditToken:(id)a4 traceManager:(id)a5;
- (MNNavigationSessionState)navigationSessionState;
- (MNNavigationTraceManager)traceManager;
- (MNRouteManager)routeManager;
- (MNServerSessionStateInfo)serverSessionStateInfo;
- (double)timeSinceLastAnnouncement;
- (double)timeUntilNextAnnouncement;
- (id)_locationTrackerForTransportType:(int)a3 navigationType:(int64_t)a4;
- (id)recentLocationHistory;
- (id)routeInfoForUpdateManager:(id)a3 reason:(unint64_t)a4;
- (int)navigationState;
- (int64_t)navigationType;
- (unint64_t)displayedStepIndex;
- (unint64_t)navigationCapabilities;
- (unint64_t)targetLegIndex;
- (void)_closeTileLoader;
- (void)_openTileLoader;
- (void)_startAudioSessionWithGuidanceLevelOverride:(unint64_t)a3;
- (void)_startGuidanceAllowMidRouteStart:(BOOL)a3 announcementsToIgnore:(id)a4;
- (void)_startIdleTimerUpdates;
- (void)_startLocationTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
- (void)_startLocationUpdates;
- (void)_startMotionUpdates;
- (void)_startTravelTimeUpdates;
- (void)_startVirtualGarageUpdates;
- (void)_stopAudioSession;
- (void)_stopGuidance;
- (void)_stopIdleTimerUpdates;
- (void)_stopLocationTracking;
- (void)_stopLocationUpdates;
- (void)_stopMotionUpdates;
- (void)_stopTravelTimeUpdates;
- (void)_stopVirtualGarageUpdates;
- (void)_updateNavigationSessionState:(id)a3;
- (void)_updateResumeRouteInfoFrom:(id)a3;
- (void)advanceToNextLeg;
- (void)audioManager:(id)a3 didActivateAudioSession:(BOOL)a4;
- (void)audioManager:(id)a3 didChangeVoiceGuidanceLevel:(unint64_t)a4;
- (void)audioManager:(id)a3 didStartSpeakingPrompt:(id)a4;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)dealloc;
- (void)didChangeUserOptionsFrom:(id)a3 to:(id)a4;
- (void)forceReroute;
- (void)guidanceManager:(id)a3 announce:(id)a4 isImportant:(BOOL)a5 shortPromptType:(unint64_t)a6 stage:(unint64_t)a7 completionBlock:(id)a8;
- (void)guidanceManager:(id)a3 didProcessSpeechEvent:(id)a4;
- (void)guidanceManager:(id)a3 didUpdateNavTrayGuidance:(id)a4;
- (void)guidanceManager:(id)a3 hideJunctionViewForId:(id)a4;
- (void)guidanceManager:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)guidanceManager:(id)a3 newGuidanceEventFeedback:(id)a4;
- (void)guidanceManager:(id)a3 showJunctionView:(id)a4;
- (void)guidanceManager:(id)a3 showLaneDirections:(id)a4;
- (void)guidanceManager:(id)a3 triggerHaptics:(int)a4;
- (void)guidanceManager:(id)a3 updateSignsWithARInfo:(id)a4;
- (void)guidanceManager:(id)a3 updateSignsWithInfo:(id)a4;
- (void)guidanceManager:(id)a3 updatedGuidanceEventFeedback:(id)a4;
- (void)guidanceManager:(id)a3 usePersistentDisplay:(BOOL)a4;
- (void)guidanceManager:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5;
- (void)guidanceManager:(id)a3 willProcessSpeechEvent:(id)a4;
- (void)guidanceManagerBeginGuidanceUpdate:(id)a3;
- (void)guidanceManagerEndGuidanceUpdate:(id)a3;
- (void)idleTimerUpdater:(id)a3 shouldEnableIdleTimer:(BOOL)a4;
- (void)insertWaypoint:(id)a3;
- (void)locationManagerUpdatedHeading:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)locationTracker:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)locationTracker:(id)a3 didChangeState:(int)a4;
- (void)locationTracker:(id)a3 didEndNavigatingWithReason:(unint64_t)a4;
- (void)locationTracker:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)locationTracker:(id)a3 didFailRerouteWithError:(id)a4;
- (void)locationTracker:(id)a3 didReachETAUpdatePosition:(id)a4;
- (void)locationTracker:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4;
- (void)locationTracker:(id)a3 didReceiveTransitAlert:(id)a4;
- (void)locationTracker:(id)a3 didReroute:(id)a4 newAlternateRoutes:(id)a5 rerouteReason:(unint64_t)a6 request:(id)a7 response:(id)a8;
- (void)locationTracker:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)locationTracker:(id)a3 didSuppressReroute:(id)a4;
- (void)locationTracker:(id)a3 didSwitchToNewTransportTypeWithRoute:(id)a4 rerouteReason:(unint64_t)a5 request:(id)a6 response:(id)a7;
- (void)locationTracker:(id)a3 didUpdateAlternateRoutes:(id)a4;
- (void)locationTracker:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)locationTracker:(id)a3 didUpdateBackgroundWalkingRoute:(id)a4;
- (void)locationTracker:(id)a3 didUpdateETAForRoute:(id)a4;
- (void)locationTracker:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)locationTracker:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4;
- (void)locationTracker:(id)a3 didUpdateVehicleParkingInfo:(id)a4;
- (void)locationTracker:(id)a3 dismissedTrafficIncidentAlert:(id)a4;
- (void)locationTracker:(id)a3 invalidatedTrafficIncidentAlert:(id)a4;
- (void)locationTracker:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)locationTracker:(id)a3 receivedTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)locationTracker:(id)a3 shouldShowChargingInfoForWaypoint:(id)a4;
- (void)locationTracker:(id)a3 updatedTrafficIncidentAlert:(id)a4;
- (void)locationTrackerDidArrive:(id)a3;
- (void)locationTrackerDidCancelReroute:(id)a3;
- (void)locationTrackerDidEnterPreArrivalState:(id)a3;
- (void)locationTrackerWillReroute:(id)a3;
- (void)motionContextDidUpdateMotion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3;
- (void)rerouteWithWaypoints:(id)a3;
- (void)resumeOriginalDestination;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsDisplayingNavigationTray:(BOOL)a3;
- (void)setIsNavigatingInLowGuidance:(BOOL)a3;
- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4;
- (void)setNavigationCapabilities:(unint64_t)a3;
- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3;
- (void)startNavigationSessionWithDetails:(id)a3;
- (void)stopCurrentGuidancePrompt;
- (void)stopNavigationSessionWithReason:(unint64_t)a3;
- (void)switchToDestinationRoute;
- (void)switchToRoute:(id)a3;
- (void)timeAndDistanceUpdater:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6;
- (void)timeAndDistanceUpdater:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)traceJumpedInTime;
- (void)tracePlayer:(id)a3 didJumpToRouteResponse:(id)a4 request:(id)a5 waypoints:(id)a6;
- (void)tracePlayer:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6;
- (void)tracePlayer:(id)a3 didUpdateCurrentRoute:(id)a4 reason:(unint64_t)a5;
- (void)tracePlayerDidPause:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateDestination:(id)a3;
- (void)updateManager:(id)a3 didReceiveETAResponse:(id)a4;
- (void)updateManager:(id)a3 willSendETARequest:(id)a4;
- (void)updateWithInitialLocation:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)vehicleMonitorDidDisconnectFromVehicle:(id)a3;
@end

@implementation MNNavigationSession

- (MNNavigationSession)init
{
  result = (MNNavigationSession *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MNNavigationSession)initWithRouteManager:(id)a3 auditToken:(id)a4
{
  return [(MNNavigationSession *)self initWithRouteManager:a3 auditToken:a4 traceManager:0];
}

- (MNNavigationSession)initWithRouteManager:(id)a3 auditToken:(id)a4 traceManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MNNavigationSession;
  v12 = [(MNNavigationSession *)&v21 init];
  if (v12)
  {
    v13 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E39570];
    observers = v12->_observers;
    v12->_observers = v13;

    v12->_navigationCapabilities = 31;
    objc_storeStrong((id *)&v12->_auditToken, a4);
    objc_storeStrong((id *)&v12->_routeManager, a3);
    objc_storeStrong((id *)&v12->_traceManager, a5);
    v12->_navigationType = 0;
    v12->_guidancePromptsEnabled = 1;
    v12->_isSpeakingTrafficIncidentAlert = 0;
    activeTrafficIncidentAlert = v12->_activeTrafficIncidentAlert;
    v12->_activeTrafficIncidentAlert = 0;

    v12->_displayedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    GEOConfigGetDouble();
    v12->_locationProjectionTime = v16;
    _GEOConfigAddDelegateListenerForKey();
    v17 = [v11 tracePlayer];

    if (v17)
    {
      v18 = [v11 tracePlayer];
      [v18 registerObserver:v12];
    }
    v19 = v12;
  }

  return v12;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];

  if (v3)
  {
    v4 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];
    [v4 unregisterObserver:self];
  }
  [(MNNavigationSession *)self _stopLocationUpdates];
  [(MNNavigationSession *)self _closeTileLoader];
  [(MNAudioManager *)self->_audioManager unregisterObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationSession;
  [(MNNavigationSession *)&v5 dealloc];
}

- (MNLocation)lastMatchedLocation
{
  return [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];
}

- (int)navigationState
{
  return [(MNLocationTracker *)self->_locationTracker state];
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)startNavigationSessionWithDetails:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_navigationType)
  {
    objc_super v5 = [NSString stringWithFormat:@"Navigation session already started"];
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v65 = "-[MNNavigationSession startNavigationSessionWithDetails:]";
      __int16 v66 = 2080;
      v67 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      __int16 v68 = 1024;
      int v69 = 252;
      __int16 v70 = 2080;
      v71 = "_navigationType == MNNavigationType_None";
      __int16 v72 = 2112;
      v73 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    goto LABEL_5;
  }
  v7 = [(MNRouteManager *)self->_routeManager currentRoute];
  if (v7)
  {
    objc_super v5 = v7;
    uint64_t v8 = [v7 origin];
    if (!v8
      || (id v9 = (void *)v8,
          [v5 destination],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      uint64_t v11 = [v5 origin];
      if (!v11
        || (v12 = (void *)v11,
            [v5 destination],
            v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            !v13))
      {
        v14 = [NSString stringWithFormat:@"Starting navigation session without origin or destination"];
        v15 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v65 = "-[MNNavigationSession startNavigationSessionWithDetails:]";
          __int16 v66 = 2080;
          v67 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          __int16 v68 = 1024;
          int v69 = 263;
          __int16 v70 = 2080;
          v71 = "currentRoute.origin != nil && currentRoute.destination != nil";
          __int16 v72 = 2112;
          v73 = v14;
          _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
        }
      }
    }
    double v16 = [v5 destination];
    destination = self->_destination;
    self->_destination = v16;

    self->_navigationType = [v4 navigationType];
    v18 = [MEMORY[0x1E4F1CA48] array];
    navigationSessionStateListeners = self->_navigationSessionStateListeners;
    self->_navigationSessionStateListeners = v18;

    v20 = objc_alloc_init(MNNavigationSessionState);
    navigationSessionState = self->_navigationSessionState;
    self->_navigationSessionState = v20;

    [(MNNavigationSessionState *)self->_navigationSessionState setAuditToken:self->_auditToken];
    v22 = [v4 requestingAppIdentifier];
    [(MNNavigationSessionState *)self->_navigationSessionState setRequestingAppIdentifier:v22];

    v23 = [v4 traits];
    [(MNNavigationSessionState *)self->_navigationSessionState setTraits:v23];

    v24 = self->_navigationSessionState;
    v25 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
    [(MNNavigationSessionState *)v24 updateCurrentRouteInfo:v25 rerouteReason:0];

    v26 = [v4 reconnectionDetails];

    if (v26)
    {
      v27 = [v4 reconnectionDetails];
      -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", [v27 initialRouteSource]);

      v28 = [v4 reconnectionDetails];
      -[MNNavigationSessionState setTargetLegIndex:](self->_navigationSessionState, "setTargetLegIndex:", [v28 targetLegIndex]);
    }
    else
    {
      -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", [v5 source]);
      [(MNNavigationSessionState *)self->_navigationSessionState setTargetLegIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    [(MNNavigationSession *)self _openTileLoader];
    if (GEOConfigGetBOOL())
    {
      id v31 = objc_alloc(MEMORY[0x1E4F64920]);
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.Navigation.active-session.%p", self);
      v33 = (GEOResourceManifestUpdateAssertion *)[v31 initWithReason:v32];
      manifestUpdateAssertion = self->_manifestUpdateAssertion;
      self->_manifestUpdateAssertion = v33;
    }
    v35 = objc_alloc_init(MNNavigationSessionLogger);
    logger = self->_logger;
    self->_logger = v35;

    [(MNNavigationSession *)self registerObserver:self->_logger];
    [(NSMutableArray *)self->_navigationSessionStateListeners addObject:self->_logger];
    v37 = [(MNNavigationTraceManager *)self->_traceManager traceRecorder];

    if (v37)
    {
      v38 = [MNTraceNavigationEventRecorder alloc];
      v39 = [(MNNavigationTraceManager *)self->_traceManager traceRecorder];
      v40 = [(MNTraceNavigationEventRecorder *)v38 initWithTraceRecorder:v39];
      navigationEventRecorder = self->_navigationEventRecorder;
      self->_navigationEventRecorder = v40;

      if (self->_navigationEventRecorder) {
        -[MNNavigationSession registerObserver:](self, "registerObserver:");
      }
      v42 = [MNTraceNavigationUpdateRecorder alloc];
      v43 = [(MNNavigationTraceManager *)self->_traceManager traceRecorder];
      v44 = [(MNTraceNavigationUpdateRecorder *)v42 initWithTraceRecorder:v43];
      navigationUpdateRecorder = self->_navigationUpdateRecorder;
      self->_navigationUpdateRecorder = v44;

      if (self->_navigationUpdateRecorder) {
        -[MNNavigationSession registerObserver:](self, "registerObserver:");
      }
    }
    [(MNNavigationSession *)self _startLocationUpdates];
    v46 = [v5 origin];
    if ([v46 isCurrentLocation])
    {
    }
    else
    {
      uint64_t v47 = [v4 simulationType];

      if (!v47)
      {
LABEL_31:
        if (self->_navigationType == 3)
        {
          v48 = objc_alloc_init(MNServerSessionStateInfo);
          serverSessionStateInfo = self->_serverSessionStateInfo;
          self->_serverSessionStateInfo = v48;

          [(MNServerSessionStateInfo *)self->_serverSessionStateInfo updateWithRoute:v5];
          v50 = [v4 reconnectionDetails];
          v51 = [v50 serverSessionState];

          if (v51)
          {
            v52 = self->_serverSessionStateInfo;
            v53 = [v4 reconnectionDetails];
            v54 = [v53 serverSessionState];
            [(MNServerSessionStateInfo *)v52 updateWithSessionState:v54];
          }
          self->_guidancePromptsEnabled = [v4 guidanceType] == 0;
          -[MNNavigationSession _startAudioSessionWithGuidanceLevelOverride:](self, "_startAudioSessionWithGuidanceLevelOverride:", [v4 guidanceLevelOverride]);
          [(MNNavigationSession *)self _startTravelTimeUpdates];
          [(MNNavigationSession *)self _startIdleTimerUpdates];
          uint64_t v55 = [v4 isReconnecting];
          v56 = [v4 reconnectionDetails];
          v57 = [v56 spokenAnnouncements];
          [(MNNavigationSession *)self _startGuidanceAllowMidRouteStart:v55 announcementsToIgnore:v57];

          v58 = objc_alloc_init(MNVehicleMonitor);
          vehicleMonitor = self->_vehicleMonitor;
          self->_vehicleMonitor = v58;

          [(MNVehicleMonitor *)self->_vehicleMonitor setDelegate:self];
          [(MNVehicleMonitor *)self->_vehicleMonitor startMonitoring];
          [(MNNavigationSession *)self _startVirtualGarageUpdates];
          v60 = (GEOProbeCrumbs *)[objc_alloc(MEMORY[0x1E4F64880]) initWithRoute:v5];
          probeCrumbs = self->_probeCrumbs;
          self->_probeCrumbs = v60;
        }
        if ([(MNAudioManager *)self->_audioManager voiceGuidanceEnabled]
          && [v5 hasInitialPromptType:1])
        {
          GEOConfigSetBOOL();
        }
        observers = self->_observers;
        v63 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
        -[MNObserverHashTable navigationSession:didStartWithRoute:navigationType:isResumingMultipointRoute:isReconnecting:](observers, "navigationSession:didStartWithRoute:navigationType:isResumingMultipointRoute:isReconnecting:", self, v63, self->_navigationType, [v4 isResumingMultipointRoute], objc_msgSend(v4, "isReconnecting"));

        if (self->_serverSessionStateInfo) {
          [(MNNavigationSession *)self _updateResumeRouteInfoFrom:*MEMORY[0x1E4F641A8]];
        }
        goto LABEL_5;
      }
    }
    [(MNNavigationSession *)self _startMotionUpdates];
    goto LABEL_31;
  }
  v29 = [NSString stringWithFormat:@"Starting a navigation session without a route"];
  v30 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v65 = "-[MNNavigationSession startNavigationSessionWithDetails:]";
    __int16 v66 = 2080;
    v67 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
    __int16 v68 = 1024;
    int v69 = 258;
    __int16 v70 = 2080;
    v71 = "currentRoute != nil";
    __int16 v72 = 2112;
    v73 = v29;
    _os_log_impl(&dword_1B542B000, v30, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }

  objc_super v5 = 0;
LABEL_5:
}

- (void)updateWithInitialLocation:(id)a3
{
  id v13 = a3;
  id v4 = +[MNLocationManager sharedLocationManager];
  if ([v4 locationProviderType] == 3)
  {
    BOOL v5 = v13 == 0;
  }
  else
  {
    uint64_t v6 = [v4 locationProviderType];
    BOOL v5 = v13 == 0;
    if (v13 && v6 != 4)
    {
      [v4 pushLocation:v13];
      BOOL v5 = 0;
    }
  }
  if (!self->_locationTracker && (self->_navigationType & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(MNNavigationSession *)self _startLocationTrackingWithInitialLocation:v13 targetLegIndex:[(MNNavigationSessionState *)self->_navigationSessionState targetLegIndex]];
  }
  if (v5 && self->_navigationType == 3)
  {
    v7 = [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];

    if (v7)
    {
      guidanceManager = self->_guidanceManager;
      id v9 = [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];
      [(MNGuidanceManager *)guidanceManager updateGuidanceForLocation:v9 navigatorState:[(MNLocationTracker *)self->_locationTracker state]];
    }
    id v10 = [(MNRouteManager *)self->_routeManager currentRouteInfo];

    if (v10)
    {
      timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
      v12 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
      [(MNTimeAndDistanceUpdater *)timeAndDistanceUpdater updateDisplayETAForRoute:v12 notificationType:2];
    }
  }
}

- (void)stopNavigationSessionWithReason:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_navigationType)
  {
    v17 = [NSString stringWithFormat:@"Trying to stop navigation session that hasn't been started"];
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      v20 = "-[MNNavigationSession stopNavigationSessionWithReason:]";
      __int16 v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      __int16 v23 = 1024;
      int v24 = 377;
      __int16 v25 = 2080;
      v26 = "_navigationType != MNNavigationType_None";
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
    }
  }
  observers = self->_observers;
  uint64_t v6 = +[MNNavigationServiceCallback_WillEndNavigation willEndNavigationWithReason:a3];
  [(MNObserverHashTable *)observers navigationSession:self didSendNavigationServiceCallback:v6];

  if (a3 == 3 && ![(MNNavigationSessionState *)self->_navigationSessionState isOnLastLeg])
  {
    v7 = [(MNNavigationSessionState *)self->_navigationSessionState nextLeg];
    uint64_t v8 = [v7 startRouteCoordinate];

    [(MNNavigationSession *)self _updateResumeRouteInfoFrom:v8];
  }
  manifestUpdateAssertion = self->_manifestUpdateAssertion;
  self->_manifestUpdateAssertion = 0;

  [(MNNavigationSession *)self _closeTileLoader];
  [(MNNavigationSession *)self _stopLocationTracking];
  [(MNVehicleMonitor *)self->_vehicleMonitor setDelegate:0];
  [(MNVehicleMonitor *)self->_vehicleMonitor stopMonitoring];
  vehicleMonitor = self->_vehicleMonitor;
  self->_vehicleMonitor = 0;

  if (self->_navigationType == 3)
  {
    [(MNNavigationSession *)self _stopAudioSession];
    [(MNNavigationSession *)self _stopGuidance];
    [(MNNavigationSession *)self _stopIdleTimerUpdates];
    [(MNNavigationSession *)self _stopTravelTimeUpdates];
    [(GEOProbeCrumbs *)self->_probeCrumbs clearCache];
  }
  [(MNNavigationSession *)self _stopMotionUpdates];
  [(MNNavigationSession *)self _stopLocationUpdates];
  self->_navigationType = 0;
  [(MNNavigationSession *)self _stopVirtualGarageUpdates];
  uint64_t v11 = self->_observers;
  v12 = +[MNNavigationServiceCallback_DidEndNavigation didEndNavigationWithReason:a3];
  [(MNObserverHashTable *)v11 navigationSession:self didSendNavigationServiceCallback:v12];

  navigationSessionState = self->_navigationSessionState;
  self->_navigationSessionState = 0;

  navigationSessionStateListeners = self->_navigationSessionStateListeners;
  self->_navigationSessionStateListeners = 0;

  if (self->_navigationEventRecorder)
  {
    -[MNNavigationSession unregisterObserver:](self, "unregisterObserver:");
    navigationEventRecorder = self->_navigationEventRecorder;
    self->_navigationEventRecorder = 0;
  }
  [(MNNavigationSession *)self unregisterObserver:self->_logger];
  logger = self->_logger;
  self->_logger = 0;
}

- (void)rerouteWithWaypoints:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  locationTracker = self->_locationTracker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MNNavigationSession_rerouteWithWaypoints___block_invoke;
  v7[3] = &unk_1E60F6460;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(MNLocationTracker *)locationTracker rerouteWithWaypoints:v6 completionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __44__MNNavigationSession_rerouteWithWaypoints___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    WeakRetained = (id *)[WeakRetained[21] navigationSession:WeakRetained didRerouteWithWaypoints:*(void *)(a1 + 32)];
    v3 = v5;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)insertWaypoint:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  locationTracker = self->_locationTracker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MNNavigationSession_insertWaypoint___block_invoke;
  v7[3] = &unk_1E60F6460;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(MNLocationTracker *)locationTracker insertWaypoint:v6 completionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __38__MNNavigationSession_insertWaypoint___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    WeakRetained = (id *)[WeakRetained[21] navigationSession:WeakRetained didInsertWaypoint:*(void *)(a1 + 32)];
    v3 = v5;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  BOOL v5 = [(MNNavigationSession *)self routeManager];
  id v6 = [v5 currentRoute];

  v7 = [v6 waypoints];
  unint64_t v8 = [v7 count];

  if (v8 > a3)
  {
    id v9 = [v6 waypoints];
    id v10 = [v9 objectAtIndexedSubscript:a3];

    objc_initWeak(&location, self);
    locationTracker = self->_locationTracker;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__MNNavigationSession_removeWaypointAtIndex___block_invoke;
    v13[3] = &unk_1E60F6460;
    objc_copyWeak(&v15, &location);
    id v12 = v10;
    id v14 = v12;
    [(MNLocationTracker *)locationTracker removeWaypointAtIndex:a3 completionHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

uint64_t __45__MNNavigationSession_removeWaypointAtIndex___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    WeakRetained = (id *)[WeakRetained[21] navigationSession:WeakRetained didRemoveWaypoint:*(void *)(a1 + 32)];
    v3 = v5;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)advanceToNextLeg
{
}

- (void)updateDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
  id v5 = a3;
  [(MNLocationTracker *)self->_locationTracker updateDestination:v5 completionHandler:0];
  [(MNGuidanceManager *)self->_guidanceManager updateDestination:v5];
  [(MNObserverHashTable *)self->_observers navigationSession:self didUpdateDestination:v5];
}

- (void)resumeOriginalDestination
{
  v3 = [(MNRouteManager *)self->_routeManager originalDestination];
  destination = self->_destination;
  self->_destination = v3;

  id v6 = self->_destination;
  locationTracker = self->_locationTracker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MNNavigationSession_resumeOriginalDestination__block_invoke;
  v7[3] = &unk_1E60F6B98;
  void v7[4] = self;
  [(MNLocationTracker *)locationTracker updateDestination:v6 completionHandler:v7];
}

uint64_t __48__MNNavigationSession_resumeOriginalDestination__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 64)) {
    return [*(id *)(v1 + 64) updateDestination:*(void *)(v1 + 24)];
  }
  else {
    return [(id)v1 _startGuidanceAllowMidRouteStart:1 announcementsToIgnore:0];
  }
}

- (void)forceReroute
{
}

- (void)switchToRoute:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 route];
  if ([v5 transportType] != 1)
  {

LABEL_5:
    id v10 = [v4 routeID];

    if (v10)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v11 = [(MNRouteManager *)self->_routeManager alternateRoutes];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v43 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
LABEL_8:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
          v17 = [v4 routeID];
          v18 = [v16 routeID];
          char v19 = [v17 isEqual:v18];

          if (v19) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v43 count:16];
            if (v13) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
        id v26 = v16;

        if (!v26) {
          goto LABEL_15;
        }
        goto LABEL_21;
      }
LABEL_14:
    }
LABEL_15:
    v20 = [NSString stringWithFormat:@"No valid alternate route when calling switch to route."];
    __int16 v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "-[MNNavigationSession switchToRoute:]";
      __int16 v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      __int16 v37 = 1024;
      int v38 = 509;
      __int16 v39 = 2080;
      v40 = "validAlternateRoute != nil";
      __int16 v41 = 2112;
      v42 = v20;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    v22 = MNGetMNNavigationSessionLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = [v4 route];
      int v24 = [v23 name];
      __int16 v25 = [v4 routeID];
      *(_DWORD *)buf = 138412546;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "switchToRoute: was called but no valid alternate route was found for %@ (%@)", buf, 0x16u);
    }
    id v26 = 0;
LABEL_21:
    [(MNLocationTracker *)self->_locationTracker reroute:v26 reason:10];

    goto LABEL_22;
  }
  id v6 = [v4 routeID];
  v7 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
  unint64_t v8 = [v7 routeID];
  int v9 = [v6 isEqual:v8];

  if (!v9) {
    goto LABEL_5;
  }
  [(MNLocationTracker *)self->_locationTracker reroute:v4 reason:14];
LABEL_22:
  probeCrumbs = self->_probeCrumbs;
  v28 = [v4 route];
  [(GEOProbeCrumbs *)probeCrumbs resetStateWithRoute:v28];
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
}

- (void)switchToDestinationRoute
{
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MNNavigationSessionState *)self->_navigationSessionState isDisplayingNavigationTray] != a3)
  {
    [(MNNavigationSessionState *)self->_navigationSessionState setIsDisplayingNavigationTray:v3];
    navigationSessionState = self->_navigationSessionState;
    [(MNNavigationSession *)self _updateNavigationSessionState:navigationSessionState];
  }
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
}

- (BOOL)repeatCurrentGuidance
{
  BOOL v3 = +[MNLocationManager sharedLocationManager];
  id v4 = [v3 lastLocation];

  LOBYTE(self) = [(MNGuidanceManager *)self->_guidanceManager repeatLastGuidanceAnnouncement:v4];
  return (char)self;
}

- (BOOL)repeatCurrentTrafficAlert
{
  if (!self->_audioManager) {
    return 0;
  }
  if (self->_isSpeakingTrafficIncidentAlert) {
    return 1;
  }
  id v4 = [(MNTrafficIncidentAlert *)self->_activeTrafficIncidentAlert spokenTexts];
  id v5 = [v4 firstObject];

  uint64_t v6 = [v5 length];
  BOOL v3 = v6 != 0;
  if (v6)
  {
    self->_isSpeakingTrafficIncidentAlert = 1;
    audioManager = self->_audioManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__MNNavigationSession_repeatCurrentTrafficAlert__block_invoke;
    v9[3] = &unk_1E60FB940;
    v9[4] = self;
    [(MNAudioManager *)audioManager requestSpeech:v5 guidanceLevel:1 modifier:0 shortPromptType:0 completionHandler:v9];
  }

  return v3;
}

uint64_t __48__MNNavigationSession_repeatCurrentTrafficAlert__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 146) = 0;
  return result;
}

- (BOOL)vibrateForPrompt:(unint64_t)a3
{
  return [(MNAudioManager *)self->_audioManager vibrateForShortPrompt:a3];
}

- (void)stopCurrentGuidancePrompt
{
}

- (double)timeSinceLastAnnouncement
{
  [(MNGuidanceManager *)self->_guidanceManager timeSinceLastAnnouncement];
  return result;
}

- (double)timeUntilNextAnnouncement
{
  [(MNGuidanceManager *)self->_guidanceManager timeUntilNextAnnouncement];
  return result;
}

- (BOOL)isCurrentlySpeaking
{
  return [(MNAudioManager *)self->_audioManager isSpeaking];
}

- (void)traceJumpedInTime
{
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
}

- (void)didChangeUserOptionsFrom:(id)a3 to:(id)a4
{
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  if (self->_guidancePromptsEnabled != a3)
  {
    BOOL v3 = a3;
    self->_guidancePromptsEnabled = a3;
    if (a3) {
      [(MNNavigationSession *)self _startGuidanceAllowMidRouteStart:1 announcementsToIgnore:0];
    }
    else {
      [(MNNavigationSession *)self _stopGuidance];
    }
    observers = self->_observers;
    [(MNObserverHashTable *)observers navigationSession:self didEnableGuidancePrompts:v3];
  }
}

- (id)recentLocationHistory
{
  return (id)[(GEOProbeCrumbs *)self->_probeCrumbs recentLocationHistory];
}

- (void)_openTileLoader
{
  if (!self->_tileLoaderClient)
  {
    GEOTileLoaderClientIdentifier();
    BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    tileLoaderClient = self->_tileLoaderClient;
    self->_tileLoaderClient = v3;

    id v5 = [MEMORY[0x1E4F64AC8] modernLoader];
    [v5 openForClient:self->_tileLoaderClient];

    id v6 = [MEMORY[0x1E4F64918] modernManager];
    [v6 openServerConnection];
  }
}

- (void)_closeTileLoader
{
  if (self->_tileLoaderClient)
  {
    id v5 = [MEMORY[0x1E4F64AC8] modernLoader];
    [v5 closeForClient:self->_tileLoaderClient];
    BOOL v3 = [MEMORY[0x1E4F64918] modernManager];
    [v3 closeServerConnection:1];

    tileLoaderClient = self->_tileLoaderClient;
    self->_tileLoaderClient = 0;
  }
}

- (id)_locationTrackerForTransportType:(int)a3 navigationType:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a4)
  {
    case 0:
      id v5 = [NSString stringWithFormat:@"Attempting to create location tracker before specifying navigation type."];
      id v6 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)double v16 = 136316162;
      *(void *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
      *(_WORD *)&v16[12] = 2080;
      *(void *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 729;
      WORD2(v17) = 2080;
      *(void *)((char *)&v17 + 6) = "NO";
      HIWORD(v17) = 2112;
      v18 = v5;
      goto LABEL_14;
    case 1:
      id v5 = [NSString stringWithFormat:@"Cannot start navigation session with planning type."];
      id v6 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)double v16 = 136316162;
      *(void *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
      *(_WORD *)&v16[12] = 2080;
      *(void *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 725;
      WORD2(v17) = 2080;
      *(void *)((char *)&v17 + 6) = "NO";
      HIWORD(v17) = 2112;
      v18 = v5;
      goto LABEL_14;
    case 2:
      v7 = [(MNRouteManager *)self->_routeManager currentRoute];
      int v8 = [v7 transportType];

      if ((v8 - 2) < 2) {
        goto LABEL_9;
      }
      if (v8 == 1)
      {
        int v9 = MNTransitLocationTracker;
        goto LABEL_26;
      }
      if (!v8)
      {
LABEL_9:
        int v9 = MNSteppingLocationTracker;
LABEL_26:
        uint64_t v12 = (void *)[[v9 alloc] initWithNavigationSession:self];
        goto LABEL_27;
      }
      id v5 = [NSString stringWithFormat:@"Unsupported transport type for stepping navigation."];
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)double v16 = 136316162;
        *(void *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
        *(_WORD *)&v16[12] = 2080;
        *(void *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 689;
        WORD2(v17) = 2080;
        *(void *)((char *)&v17 + 6) = "NO";
        HIWORD(v17) = 2112;
        v18 = v5;
LABEL_14:
        _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v16, 0x30u);
      }
LABEL_15:

LABEL_16:
      uint64_t v12 = 0;
LABEL_27:
      uint64_t v13 = [(MNNavigationSession *)self auditToken];
      [v12 _setAuditToken:v13];

      [v12 setNavigationCapabilities:self->_navigationCapabilities];
      if (!v12)
      {
        uint64_t v15 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)double v16 = 136315906;
          *(void *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
          *(_WORD *)&v16[12] = 2080;
          *(void *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 736;
          WORD2(v17) = 2080;
          *(void *)((char *)&v17 + 6) = "locationTracker != nil";
          _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", v16, 0x26u);
        }
      }
      return v12;
    case 3:
      id v10 = [(MNRouteManager *)self->_routeManager currentRoute];
      int v11 = [v10 transportType];

      switch(v11)
      {
        case 0:
          int v9 = MNDrivingTurnByTurnLocationTracker;
          goto LABEL_26;
        case 1:
          id v5 = [NSString stringWithFormat:@"Only stepping navigation supported for transit routes."];
          id v6 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          *(_DWORD *)double v16 = 136316162;
          *(void *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
          *(_WORD *)&v16[12] = 2080;
          *(void *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 710;
          WORD2(v17) = 2080;
          *(void *)((char *)&v17 + 6) = "NO";
          HIWORD(v17) = 2112;
          v18 = v5;
          break;
        case 2:
          int v9 = MNWalkingTurnByTurnLocationTracker;
          goto LABEL_26;
        case 3:
          int v9 = MNCyclingTurnByTurnLocationTracker;
          goto LABEL_26;
        default:
          id v5 = [NSString stringWithFormat:@"Unsupported transport type for turn by turn navigation."];
          id v6 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          *(_DWORD *)double v16 = 136316162;
          *(void *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
          *(_WORD *)&v16[12] = 2080;
          *(void *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 714;
          WORD2(v17) = 2080;
          *(void *)((char *)&v17 + 6) = "NO";
          HIWORD(v17) = 2112;
          v18 = v5;
          break;
      }
      goto LABEL_14;
    case 4:
      id v5 = [NSString stringWithFormat:@"Should not attempt to create a location tracker when navigation type is \"SteppingNoTracking\"."];
      id v6 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)double v16 = 136316162;
      *(void *)&v16[4] = "-[MNNavigationSession _locationTrackerForTransportType:navigationType:]";
      *(_WORD *)&v16[12] = 2080;
      *(void *)&v16[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 721;
      WORD2(v17) = 2080;
      *(void *)((char *)&v17 + 6) = "NO";
      HIWORD(v17) = 2112;
      v18 = v5;
      goto LABEL_14;
    default:
      goto LABEL_16;
  }
}

- (void)_startLocationTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(MNNavigationSession *)self routeManager];
  int v8 = [v7 currentRoute];
  -[MNNavigationSession _locationTrackerForTransportType:navigationType:](self, "_locationTrackerForTransportType:navigationType:", [v8 transportType], self->_navigationType);
  int v9 = (MNLocationTracker *)objc_claimAutoreleasedReturnValue();
  locationTracker = self->_locationTracker;
  self->_locationTracker = v9;

  [(MNLocationTracker *)self->_locationTracker setDelegate:self];
  [(MNLocationTracker *)self->_locationTracker setNavigationSessionState:self->_navigationSessionState];
  [(NSMutableArray *)self->_navigationSessionStateListeners addObject:self->_locationTracker];
  [(MNLocationTracker *)self->_locationTracker startTrackingWithInitialLocation:v6 targetLegIndex:a4];
  [(MNNavigationSessionState *)self->_navigationSessionState setLocation:v6];

  [(MNNavigationSession *)self _updateNavigationSessionState:self->_navigationSessionState];
  int v11 = +[MNLocationManager sharedLocationManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__MNNavigationSession__startLocationTrackingWithInitialLocation_targetLegIndex___block_invoke;
  v12[3] = &unk_1E60FB968;
  v12[4] = self;
  [v11 setLocationCorrector:v12];
}

uint64_t __80__MNNavigationSession__startLocationTrackingWithInitialLocation_targetLegIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) matchedLocationForLocation:a2];
}

- (void)_stopLocationTracking
{
  id v4 = +[MNLocationManager sharedLocationManager];
  [v4 setLocationCorrector:0];
  [(MNLocationTracker *)self->_locationTracker stopTracking];
  [(MNLocationTracker *)self->_locationTracker setDelegate:0];
  locationTracker = self->_locationTracker;
  self->_locationTracker = 0;
}

- (void)_startLocationUpdates
{
  id v3 = +[MNLocationManager sharedLocationManager];
  [v3 addLocationListener:self];
  if ([v3 isHeadingServicesAvailable]) {
    [v3 startHeadingUpdateWithObserver:self];
  }
}

- (void)_stopLocationUpdates
{
  id v3 = +[MNLocationManager sharedLocationManager];
  [v3 removeLocationListener:self];
  [v3 stopHeadingUpdateWithObserver:self];
}

- (void)_startMotionUpdates
{
  id v3 = [(MNNavigationTraceManager *)self->_traceManager tracePlayer];

  if (v3)
  {
    int v8 = self->_traceManager;
  }
  else
  {
    id v4 = [MNCoreMotionContextProvider alloc];
    id v5 = [(MNNavigationTraceManager *)self->_traceManager traceRecorder];
    int v8 = [(MNCoreMotionContextProvider *)v4 initWithTraceRecorder:v5];
  }
  id v6 = (GEOMotionContext *)objc_alloc_init(MEMORY[0x1E4F64738]);
  motionContext = self->_motionContext;
  self->_motionContext = v6;

  [(GEOMotionContext *)self->_motionContext setDelegate:self];
  [(GEOMotionContext *)self->_motionContext startMotionUpdatesWithProvider:v8];
}

- (void)_stopMotionUpdates
{
  [(GEOMotionContext *)self->_motionContext stopMotionUpdates];
  [(GEOMotionContext *)self->_motionContext setDelegate:0];
  motionContext = self->_motionContext;
  self->_motionContext = 0;
}

- (void)_startAudioSessionWithGuidanceLevelOverride:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F64500] sharedConfiguration];
  int v6 = [v5 currentCountrySupportsNavigation];

  if (v6)
  {
    v7 = [(MNRouteManager *)self->_routeManager currentRoute];
    uint64_t v8 = [v7 transportType];

    int v9 = [MNAudioManager alloc];
    id v10 = [(MNRouteManager *)self->_routeManager routeAttributes];
    int v11 = [v10 phoneticLocaleIdentifier];
    uint64_t v12 = [(MNAudioManager *)v9 initWithTransportType:v8 voiceLanguage:v11 guidanceLevelOverride:a3];
    audioManager = self->_audioManager;
    self->_audioManager = v12;

    [(MNAudioManager *)self->_audioManager registerObserver:self];
    uint64_t v14 = objc_alloc_init(MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel);
    [(MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel *)v14 setVoiceGuidanceLevel:[(MNAudioManager *)self->_audioManager voiceGuidanceLevel]];
    [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v14];
  }
}

- (void)_stopAudioSession
{
  [(MNAudioManager *)self->_audioManager forceDeactivate];
  audioManager = self->_audioManager;
  self->_audioManager = 0;
}

- (void)_startGuidanceAllowMidRouteStart:(BOOL)a3 announcementsToIgnore:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  [(MNNavigationSession *)self _stopGuidance];
  guidanceManager = self->_guidanceManager;
  if (guidanceManager)
  {
    [(MNGuidanceManager *)guidanceManager reset];
  }
  else
  {
    v7 = [[MNGuidanceManager alloc] initWithNavigationSessionState:self->_navigationSessionState audioManager:self->_audioManager isReconnecting:v4 announcementsToIgnore:v9];
    uint64_t v8 = self->_guidanceManager;
    self->_guidanceManager = v7;

    [(MNGuidanceManager *)self->_guidanceManager setDelegate:self];
    [(MNGuidanceManager *)self->_guidanceManager setNavigationSessionState:self->_navigationSessionState];
    [(NSMutableArray *)self->_navigationSessionStateListeners addObject:self->_guidanceManager];
  }
}

- (void)_stopGuidance
{
}

- (void)_startTravelTimeUpdates
{
  id v3 = [[MNTimeAndDistanceUpdater alloc] initWithNavigationSessionState:self->_navigationSessionState];
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  self->_timeAndDistanceUpdater = v3;

  [(MNTimeAndDistanceUpdater *)self->_timeAndDistanceUpdater setDelegate:self];
  [(MNTimeAndDistanceUpdater *)self->_timeAndDistanceUpdater setNavigationSessionState:self->_navigationSessionState];
  [(NSMutableArray *)self->_navigationSessionStateListeners addObject:self->_timeAndDistanceUpdater];
  id v5 = self->_timeAndDistanceUpdater;
  int v6 = [(MNRouteManager *)self->_routeManager allRoutes];
  v7 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
  uint64_t v8 = [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];
  [(MNTimeAndDistanceUpdater *)v5 setRoutes:v6 mainRoute:v7 location:v8 notificationType:2];

  id v9 = self->_timeAndDistanceUpdater;
  [(MNTimeAndDistanceUpdater *)v9 startUpdating];
}

- (void)_stopTravelTimeUpdates
{
  [(MNTimeAndDistanceUpdater *)self->_timeAndDistanceUpdater setDelegate:0];
  [(MNTimeAndDistanceUpdater *)self->_timeAndDistanceUpdater stopUpdating];
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  self->_timeAndDistanceUpdater = 0;
}

- (void)_startIdleTimerUpdates
{
  id v3 = objc_alloc_init(MNIdleTimerUpdater);
  idleTimerUpdater = self->_idleTimerUpdater;
  self->_idleTimerUpdater = v3;

  [(MNIdleTimerUpdater *)self->_idleTimerUpdater setDelegate:self];
  [(MNIdleTimerUpdater *)self->_idleTimerUpdater setNavigationSessionState:self->_navigationSessionState];
  [(NSMutableArray *)self->_navigationSessionStateListeners addObject:self->_idleTimerUpdater];
  id v5 = self->_idleTimerUpdater;
  [(MNIdleTimerUpdater *)v5 updateForStartNavigation];
}

- (void)_stopIdleTimerUpdates
{
  [(MNIdleTimerUpdater *)self->_idleTimerUpdater setDelegate:0];
  idleTimerUpdater = self->_idleTimerUpdater;
  self->_idleTimerUpdater = 0;
}

- (void)_updateResumeRouteInfoFrom:(id)a3
{
  if (!self->_serverSessionStateInfo) {
    return;
  }
  id v5 = [(MNLocationTracker *)self->_locationTracker arrivalInfo];
  if (![v5 isInArrivalState]) {
    goto LABEL_5;
  }
  BOOL v6 = [(MNNavigationSessionState *)self->_navigationSessionState isOnLastLeg];

  if (!v6)
  {
    id v5 = [(MNNavigationSessionState *)self->_navigationSessionState nextLeg];
    a3 = ($212C09783140BCCD23384160D545CE0D)[v5 startRouteCoordinate];
LABEL_5:
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F64940]);
  v7 = [(MNServerSessionStateInfo *)self->_serverSessionStateInfo sessionState];
  [v12 setServerSessionState:v7];

  uint64_t v8 = [(MNRouteManager *)self->_routeManager currentRoute];
  id v9 = [v8 geoOriginalWaypointRouteFromRouteCoordinate:a3 purpose:6];
  [v12 setRouteGeometry:v9];

  objc_msgSend(v12, "setHasVisitedFirstStop:", -[MNLocationTracker hasVisitedFirstStop](self->_locationTracker, "hasVisitedFirstStop"));
  observers = self->_observers;
  int v11 = +[MNNavigationServiceCallback_DidUpdateResumeRouteHandle didUpdateResumeRouteHandle:v12];
  [(MNObserverHashTable *)observers navigationSession:self didSendNavigationServiceCallback:v11];
}

- (void)_updateNavigationSessionState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_navigationSessionStateListeners;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setNavigationSessionState:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_startVirtualGarageUpdates
{
  id v3 = +[MNVirtualGarageManager sharedManager];
  [v3 registerObserver:self];
}

- (void)_stopVirtualGarageUpdates
{
  id v3 = +[MNVirtualGarageManager sharedManager];
  [v3 unregisterObserver:self];
}

- (void)motionContextDidUpdateMotion:(id)a3
{
  observers = self->_observers;
  id v5 = a3;
  uint64_t v6 = [v5 motionType];
  uint64_t v7 = [v5 confidence];

  [(MNObserverHashTable *)observers navigationSession:self didUpdateMotionType:v6 confidence:v7];
}

- (void)locationTracker:(id)a3 didChangeState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(MNNavigationSessionState *)self->_navigationSessionState setNavigationState:*(void *)&a4];
  observers = self->_observers;
  [(MNObserverHashTable *)observers navigationSession:self didChangeNavigationState:v4];
}

- (void)locationTracker:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v9 = a4;
  -[MNNavigationSessionState setArrivalState:](self->_navigationSessionState, "setArrivalState:", [v9 arrivalState]);
  id v5 = objc_opt_new();
  [v5 setArrivalInfo:v9];
  [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v5];
  uint64_t v6 = [(MNRouteManager *)self->_routeManager currentRoute];
  uint64_t v7 = [v6 legs];
  if ((unint64_t)[v7 count] >= 2)
  {
    int v8 = [v9 isInArrivalState];

    if (!v8) {
      goto LABEL_5;
    }
    uint64_t v6 = [(MNNavigationSession *)self lastMatchedLocation];
    uint64_t v7 = [v6 routeMatch];
    -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", [v7 routeCoordinate]);
  }

LABEL_5:
}

- (void)locationTracker:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
}

- (void)locationTracker:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  guidanceManager = self->_guidanceManager;
  id v8 = a4;
  [(MNGuidanceManager *)guidanceManager setIsInPreArrivalState:1];
  [(MNObserverHashTable *)self->_observers navigationSession:self didEnterPreArrivalStateForWaypoint:v8 endOfLegIndex:a5];
}

- (void)locationTracker:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
}

- (void)locationTracker:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  idleTimerUpdater = self->_idleTimerUpdater;
  id v12 = a4;
  [(MNIdleTimerUpdater *)idleTimerUpdater updateForStartNavigation];
  [(MNGuidanceManager *)self->_guidanceManager setShouldShowChargingInfo:0];
  [(MNGuidanceManager *)self->_guidanceManager setIsInPreArrivalState:0];
  guidanceManager = self->_guidanceManager;
  long long v11 = [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];
  [(MNGuidanceManager *)guidanceManager updateGuidanceForLocation:v11 navigatorState:[(MNNavigationSession *)self navigationState]];

  [(MNObserverHashTable *)self->_observers navigationSession:self didResumeNavigatingFromWaypoint:v12 endOfLegIndex:a5 reason:a6];
}

- (void)locationTracker:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  [(MNNavigationSessionState *)self->_navigationSessionState setTargetLegIndex:a4];
  [(MNNavigationSession *)self _updateNavigationSessionState:self->_navigationSessionState];
  uint64_t v6 = [[_TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex alloc] initWithTargetLegIndex:a4];
  [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v6];
  [(MNObserverHashTable *)self->_observers navigationSession:self didUpdateTargetLegIndex:a4];
}

- (void)locationTrackerDidEnterPreArrivalState:(id)a3
{
  [(MNGuidanceManager *)self->_guidanceManager setIsInPreArrivalState:1];
  observers = self->_observers;
  [(MNObserverHashTable *)observers navigationSessionDidEnterPreArrivalState:self];
}

- (void)locationTrackerDidArrive:(id)a3
{
  observers = self->_observers;
  id v5 = a3;
  [(MNObserverHashTable *)observers navigationSessionDidArrive:self];
  guidanceManager = self->_guidanceManager;
  uint64_t v7 = [v5 lastMatchedLocation];

  [(MNGuidanceManager *)guidanceManager updateGuidanceForLocation:v7 navigatorState:[(MNNavigationSession *)self navigationState]];
  if (GEOConfigGetBOOL())
  {
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MNNavigationSession_locationTrackerDidArrive___block_invoke;
    block[3] = &unk_1E60F6B98;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __48__MNNavigationSession_locationTrackerDidArrive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) navigationSession:*(void *)(a1 + 32) shouldEndWithReason:8];
}

- (void)locationTracker:(id)a3 didEndNavigatingWithReason:(unint64_t)a4
{
}

- (void)locationTracker:(id)a3 didUpdateMatchedLocation:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 uuid];
    int v49 = 138412290;
    v50 = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationSession::locationTracker:didUpdateMatchedLocation:", (uint8_t *)&v49, 0xCu);
  }
  if (v7)
  {
    unint64_t navigationCapabilities = self->_navigationCapabilities;
    id v11 = v7;
    id v12 = v11;
    long long v13 = v11;
    if ((navigationCapabilities & 4) != 0)
    {
      long long v13 = v11;
      if (([v11 locationUnreliable] & 1) == 0)
      {
        uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v15 = [v12 timestamp];
        [v14 timeIntervalSinceDate:v15];
        double v17 = v16;

        double v18 = 1.0;
        if (v17 <= 1.0) {
          double v18 = v17;
        }
        long long v13 = objc_msgSend(v12, "propagatedLocationForTimeInterval:shouldProjectAlongRoute:", objc_msgSend(v6, "shouldProjectAlongRoute"), v18 + self->_locationProjectionTime);

        uint64_t v19 = [v12 stepIndex];
        if (v19 != [v13 stepIndex])
        {
          uint64_t v47 = [NSString stringWithFormat:@"Propagating location shouldn't change step index"];
          v48 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            int v49 = 136316162;
            v50 = "-[MNNavigationSession locationTracker:didUpdateMatchedLocation:]";
            __int16 v51 = 2080;
            v52 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationSession.m";
            __int16 v53 = 1024;
            int v54 = 1019;
            __int16 v55 = 2080;
            v56 = "matchedLocation.stepIndex == propagatedLocation.stepIndex";
            __int16 v57 = 2112;
            v58 = v47;
            _os_log_impl(&dword_1B542B000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v49, 0x30u);
          }
        }
      }
    }
    [(MNObserverHashTable *)self->_observers navigationSession:self didUpdateMatchedLocation:v13];
    v20 = [(MNRouteManager *)self->_routeManager currentRoute];
    __int16 v21 = [(MNNavigationSessionState *)self->_navigationSessionState location];
    uint64_t v22 = [v21 stepIndex];

    uint64_t v23 = [v12 stepIndex];
    if (v22 != v23)
    {
      uint64_t v24 = v23;
      __int16 v25 = [v12 routeMatch];
      uint64_t v26 = [v25 segmentIndex];

      [(MNObserverHashTable *)self->_observers navigationSession:self matchedToStepIndex:v24 segmentIndex:v26];
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        __int16 v27 = [v20 stepAtIndex:v24];
        v28 = [v27 firstNameOrBranch];

        [(MNObserverHashTable *)self->_observers navigationSession:self didUpdateStepNameInfo:v28];
      }
    }
    if ([v12 state] == 1)
    {
      int64_t v29 = [(MNNavigationSessionState *)self->_navigationSessionState upcomingAnchorPointIndex];
      long long v30 = [v20 anchorPoints];
      long long v31 = [v12 routeMatch];
      uint64_t v32 = objc_msgSend(v30, "nextAnchorPointIndexAfter:", objc_msgSend(v31, "routeCoordinate"));

      if (v29 != v32)
      {
        [(MNNavigationSessionState *)self->_navigationSessionState setUpcomingAnchorPointIndex:v32];
        v33 = [[_TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex alloc] initWithAnchorPointIndex:v32];
        [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v33];
      }
    }
    [(MNNavigationSessionState *)self->_navigationSessionState setLocation:v12];
    if ([v12 state] == 1) {
      [(MNNavigationSessionState *)self->_navigationSessionState setHasBeenOnRouteOnce:1];
    }
    [(MNNavigationSession *)self _updateNavigationSessionState:self->_navigationSessionState];
    [(MNTraceNavigationEventRecorder *)self->_navigationEventRecorder setLastMatchedLocation:v12];
    [(MNTimeAndDistanceUpdater *)self->_timeAndDistanceUpdater setLocation:v12 notificationType:1];
    [(MNLocationTracker *)self->_locationTracker updateLocation:v12];
    probeCrumbs = self->_probeCrumbs;
    [v12 rawCoordinate];
    double v36 = v35;
    double v38 = v37;
    __int16 v39 = [v12 routeMatch];
    uint64_t v40 = [v39 routeCoordinate];
    __int16 v41 = [v12 timestamp];
    [v41 timeIntervalSinceReferenceDate];
    -[GEOProbeCrumbs addLocation:polyCoordinate:timestamp:](probeCrumbs, "addLocation:polyCoordinate:timestamp:", v40, (unint64_t)v42, v36, v38);

    v43 = [v12 routeMatch];
    uint64_t v44 = [v43 route];
    v45 = [(MNNavigationSession *)self routeManager];
    v46 = [v45 currentRoute];

    if (v44 == v46) {
      -[MNGuidanceManager updateGuidanceForLocation:navigatorState:](self->_guidanceManager, "updateGuidanceForLocation:navigatorState:", v12, [v6 state]);
    }
    [(MNObserverHashTable *)self->_observers navigationSessionDidFinishLocationUpdate:self];
  }
}

- (void)locationTracker:(id)a3 didUpdateETAForRoute:(id)a4
{
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  id v6 = a4;
  [(MNTimeAndDistanceUpdater *)timeAndDistanceUpdater updateDisplayETAForRoute:v6 notificationType:1];
  [(MNObserverHashTable *)self->_observers navigationSession:self didUpdateETAResponseForRoute:v6];
}

- (void)locationTracker:(id)a3 didReachETAUpdatePosition:(id)a4
{
}

- (void)locationTrackerWillReroute:(id)a3
{
}

- (void)locationTracker:(id)a3 didSuppressReroute:(id)a4
{
}

- (void)locationTrackerDidCancelReroute:(id)a3
{
}

- (void)locationTracker:(id)a3 didReroute:(id)a4 newAlternateRoutes:(id)a5 rerouteReason:(unint64_t)a6 request:(id)a7 response:(id)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (a6 != 2) {
    [(MNAudioManager *)self->_audioManager clearAllAnnouncements];
  }
  [(MNRouteManager *)self->_routeManager updateForReroute:v14 rerouteReason:a6 request:v16 response:v17];
  [(MNRouteManager *)self->_routeManager updateWithAlternateRoutes:v15];
  [(MNNavigationSessionState *)self->_navigationSessionState updateCurrentRouteInfo:v14 rerouteReason:a6];
  [(MNNavigationSessionState *)self->_navigationSessionState setAlternateRouteInfos:v15];
  [(MNNavigationSession *)self _updateNavigationSessionState:self->_navigationSessionState];
  if (a6 == 12)
  {
    double v18 = MNGetMNNavigationSessionLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v14 route];
      uint64_t v20 = [v19 source];
      if ((unint64_t)(v20 - 1) > 4) {
        __int16 v21 = @"Unknown";
      }
      else {
        __int16 v21 = off_1E60FB988[v20 - 1];
      }
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, "Updating initial route source to \"%@\".", buf, 0xCu);
    }
    uint64_t v22 = [v14 route];
    -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", [v22 source]);
  }
  uint64_t v23 = [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];
  [(MNGuidanceManager *)self->_guidanceManager updateSessionStateForReroute:self->_navigationSessionState reason:a6 location:v23];
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  __int16 v25 = [(MNRouteManager *)self->_routeManager allRoutes];
  uint64_t v26 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
  [(MNTimeAndDistanceUpdater *)timeAndDistanceUpdater setRoutes:v25 mainRoute:v26 location:v23 notificationType:0];

  [(MNObserverHashTable *)self->_observers navigationSession:self didReroute:v14 withLocation:v23 withAlternateRoutes:v15 rerouteReason:a6];
  -[MNGuidanceManager updateGuidanceForLocation:navigatorState:](self->_guidanceManager, "updateGuidanceForLocation:navigatorState:", v23, [v32 state]);
  serverSessionStateInfo = self->_serverSessionStateInfo;
  v28 = [v14 route];
  [(MNServerSessionStateInfo *)serverSessionStateInfo updateWithRoute:v28];

  int64_t v29 = [v23 routeMatch];
  -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", [v29 routeCoordinate]);

  probeCrumbs = self->_probeCrumbs;
  long long v31 = [v14 route];
  [(GEOProbeCrumbs *)probeCrumbs resetStateWithRoute:v31];
}

- (void)locationTracker:(id)a3 didFailRerouteWithError:(id)a4
{
  id v6 = a4;
  [(MNObserverHashTable *)self->_observers navigationSession:self didFailRerouteWithError:v6];
  if (v6)
  {
    id v5 = objc_opt_new();
    [v5 setError:v6];
    [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v5];
  }
}

- (void)locationTracker:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  routeManager = self->_routeManager;
  id v10 = a4;
  [(MNRouteManager *)routeManager updateWithAlternateRoutes:v10];
  [(MNNavigationSessionState *)self->_navigationSessionState setAlternateRouteInfos:v10];
  [(MNNavigationSession *)self _updateNavigationSessionState:self->_navigationSessionState];
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  id v7 = [(MNRouteManager *)self->_routeManager allRoutes];
  dispatch_time_t v8 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
  id v9 = [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];
  [(MNTimeAndDistanceUpdater *)timeAndDistanceUpdater setRoutes:v7 mainRoute:v8 location:v9 notificationType:0];

  [(MNObserverHashTable *)self->_observers navigationSession:self didUpdateAlternateRoutes:v10];
}

- (void)locationTracker:(id)a3 didSwitchToNewTransportTypeWithRoute:(id)a4 rerouteReason:(unint64_t)a5 request:(id)a6 response:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = [v11 route];
  uint64_t v15 = [v14 transportType];

  [(MNRouteManager *)self->_routeManager updateForReroute:v11 rerouteReason:a5 request:v13 response:v12];
  [(MNRouteManager *)self->_routeManager updateWithAlternateRoutes:0];
  [(MNNavigationSessionState *)self->_navigationSessionState updateCurrentRouteInfo:v11 rerouteReason:a5];
  [(MNNavigationSessionState *)self->_navigationSessionState setAlternateRouteInfos:0];
  if (a5 == 12)
  {
    id v16 = MNGetMNNavigationSessionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v11 route];
      uint64_t v18 = [v17 source];
      if ((unint64_t)(v18 - 1) > 4) {
        uint64_t v19 = @"Unknown";
      }
      else {
        uint64_t v19 = off_1E60FB988[v18 - 1];
      }
      int v33 = 138412290;
      v34 = v19;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Updating initial route source to \"%@\".", (uint8_t *)&v33, 0xCu);
    }
    uint64_t v20 = [v11 route];
    -[MNNavigationSessionState setInitialRouteSource:](self->_navigationSessionState, "setInitialRouteSource:", [v20 source]);
  }
  [(MNNavigationSession *)self _updateNavigationSessionState:self->_navigationSessionState];
  timeAndDistanceUpdater = self->_timeAndDistanceUpdater;
  uint64_t v22 = [(MNRouteManager *)self->_routeManager allRoutes];
  uint64_t v23 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
  uint64_t v24 = [(MNLocationTracker *)self->_locationTracker lastMatchedLocation];
  [(MNTimeAndDistanceUpdater *)timeAndDistanceUpdater setRoutes:v22 mainRoute:v23 location:v24 notificationType:0];

  [(MNNavigationSession *)self _stopLocationTracking];
  [(MNAudioManager *)self->_audioManager clearAllAnnouncements];
  if (!v15)
  {
    __int16 v25 = _MNStringFromSpokenLocalization(@"Navigation_SwitchToDrivingNotification");
    audioManager = self->_audioManager;
    __int16 v27 = v25;
    uint64_t v28 = 0;
    goto LABEL_12;
  }
  if (v15 == 2)
  {
    __int16 v25 = _MNStringFromSpokenLocalization(@"Navigation_SwitchToWalkingNotification");
    audioManager = self->_audioManager;
    __int16 v27 = v25;
    uint64_t v28 = 5;
LABEL_12:
    [(MNAudioManager *)audioManager requestSpeech:v27 guidanceLevel:2 modifier:0 shortPromptType:v28 completionHandler:0];
  }
  [(MNObserverHashTable *)self->_observers navigationSession:self didSwitchToNewTransportType:v15 newRoute:v11 rerouteReason:a5];
  [(MNNavigationSession *)self _startLocationTrackingWithInitialLocation:0 targetLegIndex:0];
  serverSessionStateInfo = self->_serverSessionStateInfo;
  long long v30 = [v11 route];
  [(MNServerSessionStateInfo *)serverSessionStateInfo updateWithRoute:v30];

  [(MNNavigationSession *)self _updateResumeRouteInfoFrom:*MEMORY[0x1E4F641A8]];
  [(MNGuidanceManager *)self->_guidanceManager updateSessionStateForReroute:self->_navigationSessionState reason:5 location:0];
  [(MNAudioManager *)self->_audioManager changeTransportType:v15];
  probeCrumbs = self->_probeCrumbs;
  id v32 = [v11 route];
  [(GEOProbeCrumbs *)probeCrumbs resetStateWithRoute:v32];

  [(MNNavigationSession *)self _startGuidanceAllowMidRouteStart:1 announcementsToIgnore:0];
}

- (void)locationTracker:(id)a3 didUpdateBackgroundWalkingRoute:(id)a4
{
}

- (void)locationTracker:(id)a3 didUpdateVehicleParkingInfo:(id)a4
{
}

- (void)locationTracker:(id)a3 receivedTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v7 = (MNTrafficIncidentAlert *)a4;
  audioManager = self->_audioManager;
  id v9 = a5;
  id v10 = [(MNTrafficIncidentAlert *)v7 spokenTexts];
  id v11 = [v10 firstObject];
  [(MNAudioManager *)audioManager requestSpeech:v11 guidanceLevel:1 modifier:1 shortPromptType:0 completionHandler:0];

  activeTrafficIncidentAlert = self->_activeTrafficIncidentAlert;
  self->_activeTrafficIncidentAlert = v7;
  id v13 = v7;

  [(MNObserverHashTable *)self->_observers navigationSession:self didReceiveTrafficIncidentAlert:v13 responseCallback:v9];
  serverSessionStateInfo = self->_serverSessionStateInfo;
  id v16 = [(MNTrafficIncidentAlert *)v13 bannerID];
  uint64_t v15 = [(MNTrafficIncidentAlert *)v13 eventInfo];
  [(MNServerSessionStateInfo *)serverSessionStateInfo addDisplayedBannerID:v16 withEventInfo:v15];
}

- (void)locationTracker:(id)a3 invalidatedTrafficIncidentAlert:(id)a4
{
  activeTrafficIncidentAlert = self->_activeTrafficIncidentAlert;
  self->_activeTrafficIncidentAlert = 0;
  id v6 = a4;

  [(MNObserverHashTable *)self->_observers navigationSession:self didInvalidateTrafficIncidentAlert:v6];
}

- (void)locationTracker:(id)a3 dismissedTrafficIncidentAlert:(id)a4
{
  activeTrafficIncidentAlert = self->_activeTrafficIncidentAlert;
  self->_activeTrafficIncidentAlert = 0;
  id v6 = a4;

  [(MNObserverHashTable *)self->_observers navigationSession:self didDismissTrafficIncidentAlert:v6];
}

- (void)locationTracker:(id)a3 updatedTrafficIncidentAlert:(id)a4
{
}

- (void)locationTracker:(id)a3 shouldShowChargingInfoForWaypoint:(id)a4
{
}

- (void)locationTracker:(id)a3 didReceiveTransitAlert:(id)a4
{
}

- (void)locationTracker:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  if (!self->_locationTracker)
  {
    id v4 = [a3 lastLocation];
    [(MNObserverHashTable *)self->_observers navigationSession:self didUpdateMatchedLocation:v4];
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)locationManagerUpdatedHeading:(id)a3
{
  id v8 = [a3 heading];
  observers = self->_observers;
  [v8 trueHeading];
  double v6 = v5;
  [v8 headingAccuracy];
  [(MNObserverHashTable *)observers navigationSession:self didUpdateHeading:v6 accuracy:v7];
}

- (void)guidanceManagerBeginGuidanceUpdate:(id)a3
{
}

- (void)guidanceManagerEndGuidanceUpdate:(id)a3
{
}

- (void)guidanceManager:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
}

- (void)guidanceManager:(id)a3 announce:(id)a4 isImportant:(BOOL)a5 shortPromptType:(unint64_t)a6 stage:(unint64_t)a7 completionBlock:(id)a8
{
  if (a5) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  audioManager = self->_audioManager;
  id v14 = a4;
  [(MNAudioManager *)audioManager requestSpeech:v14 guidanceLevel:v12 modifier:0 shortPromptType:a6 completionHandler:a8];
  [(MNObserverHashTable *)self->_observers navigationSession:self didAnnounce:v14 stage:a7];
}

- (void)guidanceManager:(id)a3 willProcessSpeechEvent:(id)a4
{
}

- (void)guidanceManager:(id)a3 didProcessSpeechEvent:(id)a4
{
}

- (void)guidanceManager:(id)a3 triggerHaptics:(int)a4
{
}

- (void)guidanceManager:(id)a3 showLaneDirections:(id)a4
{
}

- (void)guidanceManager:(id)a3 hideLaneDirectionsForId:(id)a4
{
}

- (void)guidanceManager:(id)a3 updateSignsWithInfo:(id)a4
{
}

- (void)guidanceManager:(id)a3 updateSignsWithARInfo:(id)a4
{
}

- (void)guidanceManager:(id)a3 didUpdateNavTrayGuidance:(id)a4
{
  id v5 = a4;
  double v6 = [[_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance alloc] initWithNavTrayGuidanceEvent:v5];

  [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v6];
}

- (void)guidanceManager:(id)a3 usePersistentDisplay:(BOOL)a4
{
}

- (void)guidanceManager:(id)a3 showJunctionView:(id)a4
{
}

- (void)guidanceManager:(id)a3 hideJunctionViewForId:(id)a4
{
}

- (void)guidanceManager:(id)a3 newGuidanceEventFeedback:(id)a4
{
}

- (void)guidanceManager:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
}

- (BOOL)guidanceManagerIsRerouting
{
  return [(MNLocationTracker *)self->_locationTracker isRerouting];
}

- (void)idleTimerUpdater:(id)a3 shouldEnableIdleTimer:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = objc_alloc_init(MNNavigationServiceCallback_ShouldEnableIdleTimer);
  [(MNNavigationServiceCallback_ShouldEnableIdleTimer *)v6 setShouldEnable:v4];
  [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v6];
}

- (void)timeAndDistanceUpdater:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
}

- (void)timeAndDistanceUpdater:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
}

- (void)tracePlayer:(id)a3 didJumpToRouteResponse:(id)a4 request:(id)a5 waypoints:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x1E4F649D0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v9 alloc];
  id v14 = [v11 routeAttributes];

  id v18 = (id)[v13 initWithWaypoints:v10 routeAttributes:v14 directionsResponse:v12];
  uint64_t v15 = [v18 mainRouteInfo];
  id v16 = [v10 lastObject];

  destination = self->_destination;
  self->_destination = v16;

  [(MNLocationTracker *)self->_locationTracker reroute:v15 reason:0];
}

- (void)tracePlayerDidPause:(id)a3
{
}

- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6
{
  id v14 = a3;
  id v10 = a6;
  if (a4 < a5) {
    [(MNGuidanceManager *)self->_guidanceManager reset];
  }
  if (v10)
  {
    locationTracker = self->_locationTracker;
    id v12 = [(MNNavigationSession *)self routeManager];
    id v13 = [v12 currentRoute];
    [(MNLocationTracker *)locationTracker forceOnRoute:v13 atLocation:v10];
  }
}

- (void)tracePlayer:(id)a3 didUpdateCurrentRoute:(id)a4 reason:(unint64_t)a5
{
  id v7 = a4;
  id v11 = [[MNActiveRouteInfo alloc] initWithRoute:v7];
  id v8 = [v7 waypoints];

  id v9 = [v8 lastObject];
  destination = self->_destination;
  self->_destination = v9;

  [(MNLocationTracker *)self->_locationTracker reroute:v11 reason:a5];
}

- (void)tracePlayer:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
}

- (void)vehicleMonitorDidDisconnectFromVehicle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char BOOL = GEOConfigGetBOOL();
  id v5 = MNGetMNNavigationSessionLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (BOOL)
  {
    if (v6)
    {
      id v7 = [(MNLocationTracker *)self->_locationTracker arrivalInfo];
      unint64_t v8 = [v7 arrivalState];
      if (v8 > 6) {
        id v9 = @"MNArrivalState_Unknown";
      }
      else {
        id v9 = off_1E60FB9B0[v8];
      }
      int v19 = 138412290;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Received vehicle monitor disconnect notification. Current arrival state: %@", (uint8_t *)&v19, 0xCu);
    }
    id v10 = [(MNLocationTracker *)self->_locationTracker arrivalInfo];
    char v11 = [v10 isInArrivalState];

    if (v11)
    {
      BOOL v12 = [(MNNavigationSessionState *)self->_navigationSessionState isOnLastLeg];
      id v13 = MNGetMNNavigationSessionLog();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Trying to end navigation because we are on last leg.", (uint8_t *)&v19, 2u);
        }

        observers = self->_observers;
        id v16 = self;
        uint64_t v17 = 5;
      }
      else
      {
        if (v14)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Trying to pause navigation because we are not on last leg.", (uint8_t *)&v19, 2u);
        }

        observers = self->_observers;
        id v16 = self;
        uint64_t v17 = 6;
      }
      [(MNObserverHashTable *)observers navigationSession:v16 shouldEndWithReason:v17];
    }
    else
    {
      id v18 = MNGetMNNavigationSessionLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, "Not ending navigation because not in arrival state.", (uint8_t *)&v19, 2u);
      }
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v19) = 0;
    }
  }
}

- (void)audioManager:(id)a3 didActivateAudioSession:(BOOL)a4
{
}

- (void)audioManager:(id)a3 didStartSpeakingPrompt:(id)a4
{
}

- (void)audioManager:(id)a3 didChangeVoiceGuidanceLevel:(unint64_t)a4
{
  BOOL v6 = objc_alloc_init(MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel);
  [(MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel *)v6 setVoiceGuidanceLevel:a4];
  [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v6];
  if (a4 == 2) {
    [(MNNavigationSession *)self repeatCurrentGuidance];
  }
}

- (void)updateManager:(id)a3 willSendETARequest:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = MNGetMNNavigationSessionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    serverSessionStateInfo = self->_serverSessionStateInfo;
    int v14 = 134218242;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = serverSessionStateInfo;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "willSendETARequest - Request: %p | %@", (uint8_t *)&v14, 0x16u);
  }

  unint64_t v8 = [(MNServerSessionStateInfo *)self->_serverSessionStateInfo sessionState];
  [v5 setSessionState:v8];

  id v9 = [(MNRouteManager *)self->_routeManager currentRoute];
  id v10 = [v9 directionsResponseID];
  [v5 setDirectionsResponseID:v10];

  char v11 = objc_opt_new();
  [v5 setTripInfo:v11];

  BOOL v12 = [(MNLocationTracker *)self->_locationTracker hasVisitedFirstStop];
  id v13 = [v5 tripInfo];
  [v13 setHasVisitedFirstStop:v12];

  [(MNLocationTracker *)self->_locationTracker updateRequestForETAUpdate:v5];
}

- (void)updateManager:(id)a3 didReceiveETAResponse:(id)a4
{
  id v12 = a4;
  [(MNLocationTracker *)self->_locationTracker updateForETAUResponse:v12];
  serverSessionStateInfo = self->_serverSessionStateInfo;
  BOOL v6 = [v12 response];
  [(MNServerSessionStateInfo *)serverSessionStateInfo updateWithETAUResponse:v6];

  id v7 = [(MNNavigationSession *)self lastMatchedLocation];
  unint64_t v8 = [v7 routeMatch];
  -[MNNavigationSession _updateResumeRouteInfoFrom:](self, "_updateResumeRouteInfoFrom:", [v8 routeCoordinate]);

  id v9 = [v12 error];

  if (v9)
  {
    id v10 = objc_opt_new();
    char v11 = [v12 error];
    [v10 setError:v11];

    [(MNObserverHashTable *)self->_observers navigationSession:self didSendNavigationServiceCallback:v10];
  }
}

- (BOOL)wantsETAUpdates
{
  if ((self->_navigationCapabilities & 1) == 0) {
    return 0;
  }
  id v3 = [(MNRouteManager *)self->_routeManager currentRoute];
  int v4 = [v3 transportType];

  if (self->_navigationType != 3) {
    return 0;
  }
  return !v4 || v4 == 3;
}

- (id)routeInfoForUpdateManager:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  if (a4 - 3 >= 4
    && ([(MNLocationTracker *)self->_locationTracker isRerouting]
     || [(MNNavigationSession *)self navigationState] == 6))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(MNRouteManager *)self->_routeManager currentRouteInfo];
  }

  return v7;
}

- (unint64_t)targetLegIndex
{
  return [(MNLocationTracker *)self->_locationTracker targetLegIndex];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == NavigationConfig_LocationProjectionTimeSeconds && a3.var1 == off_1E9D56160)
  {
    GEOConfigGetDouble();
    self->_locationProjectionTime = v5;
  }
}

- (MNAudioManager)audioManager
{
  return self->_audioManager;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (MNRouteManager)routeManager
{
  return self->_routeManager;
}

- (GEOMotionContext)motionContext
{
  return self->_motionContext;
}

- (MNNavigationTraceManager)traceManager
{
  return self->_traceManager;
}

- (BOOL)isAllowedToSwitchTransportTypes
{
  return self->_isAllowedToSwitchTransportTypes;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (MNServerSessionStateInfo)serverSessionStateInfo
{
  return self->_serverSessionStateInfo;
}

- (unint64_t)navigationCapabilities
{
  return self->_navigationCapabilities;
}

- (void)setNavigationCapabilities:(unint64_t)a3
{
  self->_unint64_t navigationCapabilities = a3;
}

- (BOOL)guidancePromptsEnabled
{
  return self->_guidancePromptsEnabled;
}

- (BOOL)isConnectedToCarplay
{
  return self->_isConnectedToCarplay;
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  self->_isConnectedToCarplay = a3;
}

- (unint64_t)displayedStepIndex
{
  return self->_displayedStepIndex;
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  self->_displayedStepIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_storeStrong((id *)&self->_probeCrumbs, 0);
  objc_storeStrong((id *)&self->_manifestUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoaderClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_navigationSessionStateListeners, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_activeTrafficIncidentAlert, 0);
  objc_storeStrong((id *)&self->_navigationUpdateRecorder, 0);
  objc_storeStrong((id *)&self->_navigationEventRecorder, 0);
  objc_storeStrong((id *)&self->_traceManager, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_idleTimerUpdater, 0);
  objc_storeStrong((id *)&self->_vehicleMonitor, 0);
  objc_storeStrong((id *)&self->_timeAndDistanceUpdater, 0);
  objc_storeStrong((id *)&self->_guidanceManager, 0);
  objc_storeStrong((id *)&self->_audioManager, 0);
  objc_storeStrong((id *)&self->_motionContext, 0);
  objc_storeStrong((id *)&self->_serverSessionStateInfo, 0);
  objc_storeStrong((id *)&self->_locationTracker, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_routeManager, 0);
}

@end