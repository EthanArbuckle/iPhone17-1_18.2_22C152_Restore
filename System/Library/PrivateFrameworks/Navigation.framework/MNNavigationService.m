@interface MNNavigationService
+ (BOOL)supportsNavigation;
+ (id)sharedService;
+ (unint64_t)_hashForProtocol:(id)a3;
+ (unint64_t)clientInterfaceHash;
+ (unint64_t)daemonInterfaceHash;
- ($212C09783140BCCD23384160D545CE0D)originalRouteDivergenceCoordinate;
- (BOOL)guidancePromptsEnabled;
- (BOOL)isApproachingWaypoint;
- (BOOL)isDetour;
- (BOOL)isInNavigatingState;
- (BOOL)isInPreArrivalState;
- (BOOL)isNavigatingFromTrace;
- (BOOL)isOpenForClient:(id)a3;
- (BOOL)isResumingMultipointRoute;
- (BOOL)isTrackingCurrentLocation;
- (BOOL)startNavigationWithDetails:(id)a3 error:(id *)a4;
- (BOOL)traceIsPlaying;
- (GEOComposedRoute)alternateWalkingRoute;
- (GEOComposedRoute)originalRoute;
- (GEOComposedRoute)route;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)nextWaypoint;
- (GEOComposedWaypoint)origin;
- (GEOComposedWaypoint)originalDestination;
- (GEOComposedWaypoint)originalOrigin;
- (GEODirectionsRequest)currentRequest;
- (GEODirectionsResponse)currentResponse;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (MNArrivalInfo)arrivalInfo;
- (MNBatteryChargeInfo)batteryChargeInfo;
- (MNDisplayETAInfo)alternateWalkingRouteDisplayETAInfo;
- (MNDisplayETAInfo)displayEtaInfo;
- (MNGuidanceLaneInfo)activeLaneInfo;
- (MNLocation)lastLocation;
- (MNNavTrayGuidanceEvent)activeNavTrayGuidanceEvent;
- (MNNavigationDetails)details;
- (MNObserverHashTable)navigationObservers;
- (MNRouteDistanceInfo)remainingDistanceInfo;
- (MNUserOptions)cachedUserOptions;
- (MNVehicleParkingInfo)vehicleParkingInfo;
- (NSArray)alternateRoutes;
- (NSArray)traceBookmarks;
- (NSString)currentVoiceLanguage;
- (NSString)description;
- (NSString)destinationName;
- (NSString)originalDestinationName;
- (NSString)tracePath;
- (double)distanceUntilManeuver;
- (double)distanceUntilSign;
- (double)timeUntilManeuver;
- (double)timeUntilSign;
- (double)traceDuration;
- (double)tracePosition;
- (id)_clientProxy;
- (id)batteryChargeInfoForRoute:(id)a3;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (id)displayETAInfoForRoute:(id)a3;
- (id)etaRouteForRoute:(id)a3;
- (id)initPrivate;
- (id)realtimeUpdatesForAllRoutes;
- (id)realtimeUpdatesForRoutes:(id)a3;
- (id)remainingDistanceInfoForRoute:(id)a3;
- (id)ticketForDirectionsRequest:(id)a3;
- (int)desiredTransportType;
- (int)headingOrientation;
- (int)navigationState;
- (int)navigationTransportType;
- (int64_t)desiredNavigationType;
- (int64_t)navigationType;
- (int64_t)simulationType;
- (int64_t)upcomingAnchorPointIndex;
- (unint64_t)alternateRouteIndexForRoute:(id)a3;
- (unint64_t)displayedStepIndex;
- (unint64_t)reconnectionRouteIndex;
- (unint64_t)routeIndex;
- (unint64_t)state;
- (unint64_t)stepIndex;
- (unint64_t)targetLegIndex;
- (unint64_t)voiceGuidanceLevel;
- (void)_navigationServiceCallback_DidChangeVoiceGuidanceLevel:(id)a3;
- (void)_navigationServiceCallback_DidEndNavigation:(id)a3;
- (void)_navigationServiceCallback_DidReceiveRoutingServiceError:(id)a3;
- (void)_navigationServiceCallback_DidUpdateArrivalInfo:(id)a3;
- (void)_navigationServiceCallback_DidUpdateBackgroundWalkingRoute:(id)a3;
- (void)_navigationServiceCallback_DidUpdateDisplayETA:(id)a3;
- (void)_navigationServiceCallback_DidUpdateMatchedLocation:(id)a3;
- (void)_navigationServiceCallback_DidUpdateNavTrayGuidance:(id)a3;
- (void)_navigationServiceCallback_DidUpdateResumeRouteHandle:(id)a3;
- (void)_navigationServiceCallback_DidUpdateStepIndex:(id)a3;
- (void)_navigationServiceCallback_DidUpdateTargetLegIndex:(id)a3;
- (void)_navigationServiceCallback_DidUpdateUpcomingAnchorPointIndex:(id)a3;
- (void)_navigationServiceCallback_DidUpdateVehicleParkingInfo:(id)a3;
- (void)_navigationServiceCallback_ShouldEnableIdleTimer:(id)a3;
- (void)_navigationServiceCallback_WillEndNavigation:(id)a3;
- (void)_navigationServiceCallback_WillStartNavigation:(id)a3;
- (void)_resetDetails;
- (void)_updateWithCallback:(id)a3;
- (void)advanceToNextLeg;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)changeUserOptions:(id)a3;
- (void)closeForClient:(id)a3;
- (void)dealloc;
- (void)disableNavigationCapability:(unint64_t)a3 reason:(unint64_t)a4;
- (void)enableNavigationCapability:(unint64_t)a3 reason:(unint64_t)a4;
- (void)forceReroute;
- (void)insertWaypoint:(id)a3;
- (void)navigationServiceProxy:(id)a3 didActivateAudioSession:(BOOL)a4;
- (void)navigationServiceProxy:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationServiceProxy:(id)a3 didDismissTrafficIncidentAlert:(id)a4;
- (void)navigationServiceProxy:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationServiceProxy:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 didFailRerouteWithError:(id)a4;
- (void)navigationServiceProxy:(id)a3 didFailWithError:(id)a4;
- (void)navigationServiceProxy:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationServiceProxy:(id)a3 didProcessSpeechEvent:(id)a4;
- (void)navigationServiceProxy:(id)a3 didReceiveRealtimeUpdates:(id)a4;
- (void)navigationServiceProxy:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4;
- (void)navigationServiceProxy:(id)a3 didReceiveTrafficIncidentAlert:(id)a4;
- (void)navigationServiceProxy:(id)a3 didReceiveTransitAlert:(id)a4;
- (void)navigationServiceProxy:(id)a3 didRerouteWithRoute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7;
- (void)navigationServiceProxy:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4;
- (void)navigationServiceProxy:(id)a3 didStartSpeakingPrompt:(id)a4;
- (void)navigationServiceProxy:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5;
- (void)navigationServiceProxy:(id)a3 didUpdateAlternateRoutes:(id)a4;
- (void)navigationServiceProxy:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationServiceProxy:(id)a3 didUpdateETAResponseForRoute:(id)a4;
- (void)navigationServiceProxy:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5;
- (void)navigationServiceProxy:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4;
- (void)navigationServiceProxy:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6;
- (void)navigationServiceProxy:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4;
- (void)navigationServiceProxy:(id)a3 didUpdateTracePlaybackDetails:(id)a4;
- (void)navigationServiceProxy:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationServiceProxy:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationServiceProxy:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10;
- (void)navigationServiceProxy:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8;
- (void)navigationServiceProxy:(id)a3 hideJunctionViewForId:(id)a4;
- (void)navigationServiceProxy:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationServiceProxy:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)navigationServiceProxy:(id)a3 newGuidanceEventFeedback:(id)a4;
- (void)navigationServiceProxy:(id)a3 showJunctionView:(id)a4;
- (void)navigationServiceProxy:(id)a3 showLaneDirections:(id)a4;
- (void)navigationServiceProxy:(id)a3 triggerHaptics:(int)a4;
- (void)navigationServiceProxy:(id)a3 updateSignsWithARInfo:(id)a4;
- (void)navigationServiceProxy:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationServiceProxy:(id)a3 updatedGuidanceEventFeedback:(id)a4;
- (void)navigationServiceProxy:(id)a3 usePersistentDisplay:(BOOL)a4;
- (void)navigationServiceProxy:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5;
- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 willProcessSpeechEvent:(id)a4;
- (void)navigationServiceProxy:(id)a3 willRequestRealtimeUpdatesForRouteIDs:(id)a4;
- (void)navigationServiceProxyBeginGuidanceUpdate:(id)a3;
- (void)navigationServiceProxyDidArrive:(id)a3;
- (void)navigationServiceProxyDidCancelReroute:(id)a3;
- (void)navigationServiceProxyDidEnterPreArrivalState:(id)a3;
- (void)navigationServiceProxyDidFinishLocationUpdate:(id)a3;
- (void)navigationServiceProxyEndGuidanceUpdate:(id)a3;
- (void)navigationServiceProxyHideSecondaryStep:(id)a3;
- (void)navigationServiceProxyWillPauseNavigation:(id)a3;
- (void)navigationServiceProxyWillReroute:(id)a3;
- (void)navigationServiceProxyWillResumeFromPauseNavigation:(id)a3;
- (void)openForClient:(id)a3;
- (void)pauseRealtimeUpdates;
- (void)recordPedestrianTracePath:(id)a3;
- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3;
- (void)repeatCurrentGuidance:(id)a3;
- (void)repeatCurrentTrafficAlert:(id)a3;
- (void)rerouteWithWaypoints:(id)a3;
- (void)resumeOriginalDestination;
- (void)resumeRealtimeUpdates;
- (void)setCachedUserOptions:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setGuidanceType:(unint64_t)a3;
- (void)setHeadingOrientation:(int)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsDisplayingNavigationTray:(BOOL)a3;
- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4;
- (void)setNavigationObservers:(id)a3;
- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4;
- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)setSimulationPosition:(double)a3;
- (void)setSimulationSpeedMultiplier:(double)a3;
- (void)setSimulationSpeedOverride:(double)a3;
- (void)setTraceIsPlaying:(BOOL)a3;
- (void)setTracePlaybackSpeed:(double)a3;
- (void)setTracePosition:(double)a3;
- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3;
- (void)stopCurrentGuidancePrompt;
- (void)stopNavigationWithReason:(unint64_t)a3;
- (void)switchToDestinationRoute;
- (void)switchToRoute:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateDestination:(id)a3;
- (void)vibrateForPrompt:(unint64_t)a3 completion:(id)a4;
@end

@implementation MNNavigationService

- (void)registerObserver:(id)a3
{
}

- (GEODirectionsResponse)currentResponse
{
  v2 = [(MNNavigationService *)self details];
  v3 = [v2 directionsResponse];

  return (GEODirectionsResponse *)v3;
}

- (MNArrivalInfo)arrivalInfo
{
  v2 = [(MNNavigationService *)self details];
  v3 = [v2 arrivalInfo];

  return (MNArrivalInfo *)v3;
}

- (unint64_t)stepIndex
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 stepIndex];

  return v3;
}

+ (id)sharedService
{
  if (qword_1EB59C0C8 != -1) {
    dispatch_once(&qword_1EB59C0C8, &__block_literal_global_13);
  }
  v2 = (void *)_MergedGlobals_25;
  return v2;
}

- (GEOComposedRoute)route
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 currentRoute];

  return (GEOComposedRoute *)v3;
}

- (int)navigationState
{
  v2 = [(MNNavigationService *)self details];
  int v3 = [v2 navigationState];

  return v3;
}

- (void)changeUserOptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v8, 0xCu);
  }
  [(MNNavigationService *)self setCachedUserOptions:v5];
  [(MNNavigationServiceProxy *)self->_proxy changeUserOptions:v5];
}

- (void)setCachedUserOptions:(id)a3
{
}

- (NSString)currentVoiceLanguage
{
  if ([(MNNavigationService *)self state] == 4 || [(MNNavigationService *)self state] == 5)
  {
    int v3 = [(MNNavigationService *)self details];
    v4 = [v3 currentVoiceLanguage];
  }
  else
  {
    v4 = +[MNVoiceLanguageUtil systemDefaultVoiceLanguage];
  }
  return (NSString *)v4;
}

- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v26 = 138543362;
    v27 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v26, 0xCu);
  }
  v9 = [(MNNavigationService *)self details];
  uint64_t v10 = [v9 state];

  v11 = [(MNNavigationService *)self details];
  int v12 = [v11 navigationState];

  if (v10 != [v6 state])
  {
    uint64_t v13 = [v6 navigationType];
    v14 = [(MNNavigationService *)self details];
    [v14 setDesiredNavigationType:v13];

    -[MNObserverHashTable navigationService:willChangeFromState:toState:](self->_navigationObservers, "navigationService:willChangeFromState:toState:", self, v10, [v6 state]);
  }
  if (v6)
  {
    v15 = [(MNNavigationService *)self details];
    [v15 copySerializableValuesFrom:v6];

    v16 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [(MNNavigationService *)self details];
      int v26 = 138412290;
      v27 = v17;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_INFO, "Updated navigation details: %@", (uint8_t *)&v26, 0xCu);
    }
    v18 = [(MNNavigationService *)self details];
    v19 = [v18 routeLookupIDs];

    if ([v19 count])
    {
      v20 = [v19 componentsJoinedByString:@", "];
    }
    else
    {
      v20 = @"none";
    }
    v21 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      v27 = v20;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_INFO, "Known route IDs: (%@)", (uint8_t *)&v26, 0xCu);
    }
  }
  if (v12 != [v6 navigationState]) {
    -[MNObserverHashTable navigationService:didChangeNavigationState:](self->_navigationObservers, "navigationService:didChangeNavigationState:", self, [v6 navigationState]);
  }
  if (v10 != [v6 state])
  {
    -[MNObserverHashTable navigationService:didChangeFromState:toState:](self->_navigationObservers, "navigationService:didChangeFromState:toState:", self, v10, [v6 state]);
    if ([v6 state] == 2)
    {
      v22 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(sel_navigationService_didUpdatePreviewRoutes_withSelectedRouteIndex_);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v26 = 138477827;
        v27 = v23;
        _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v26, 0xCu);
      }
      navigationObservers = self->_navigationObservers;
      v25 = [v6 previewRoutes];
      -[MNObserverHashTable navigationService:didUpdatePreviewRoutes:withSelectedRouteIndex:](navigationObservers, "navigationService:didUpdatePreviewRoutes:withSelectedRouteIndex:", self, v25, [v6 selectedPreviewRouteIndex]);
    }
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidSynchronize:self];
}

- (BOOL)isInNavigatingState
{
  v2 = [(MNNavigationService *)self details];
  BOOL v3 = (unint64_t)[v2 state] > 3;

  return v3;
}

- (unint64_t)state
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 state];

  return v3;
}

- (MNNavigationDetails)details
{
  return (MNNavigationDetails *)objc_getProperty(self, a2, 72, 1);
}

- (MNUserOptions)cachedUserOptions
{
  return (MNUserOptions *)objc_getProperty(self, a2, 80, 1);
}

uint64_t __36__MNNavigationService_sharedService__block_invoke()
{
  _MergedGlobals_25 = [[MNNavigationService alloc] initPrivate];
  return MEMORY[0x1F41817F8]();
}

- (id)initPrivate
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)MNNavigationService;
  v2 = [(MNNavigationService *)&v23 init];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
    int v4 = objc_msgSend(v3, "_navigation_isNavd");

    if (v4)
    {
      v21 = [NSString stringWithFormat:@"MNNavigationService is not allowed on navd"];
      v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "-[MNNavigationService initPrivate]";
        __int16 v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m";
        __int16 v28 = 1024;
        int v29 = 101;
        __int16 v30 = 2080;
        v31 = "![[NSProcessInfo processInfo] _navigation_isNavd]";
        __int16 v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    [(MNNavigationService *)v2 _resetDetails];
    if (+[MNNavigationService supportsNavigation])
    {
      if (GEOConfigGetBOOL())
      {
        id v5 = objc_alloc_init(MNNavigationServiceRemoteProxy);
        remoteProxy = v2->_remoteProxy;
        v2->_remoteProxy = v5;

        [(MNNavigationServiceRemoteProxy *)v2->_remoteProxy setDelegate:v2];
        v7 = v2->_remoteProxy;
        proxy = (MNNavigationServiceLocalProxy *)v2->_proxy;
        v2->_proxy = (MNNavigationServiceProxy *)v7;
      }
      else
      {
        v9 = objc_alloc_init(MNNavigationServiceLocalProxy);
        [(MNNavigationServiceLocalProxy *)v9 setDelegate:v2];
        uint64_t v10 = v2->_proxy;
        v2->_proxy = (MNNavigationServiceProxy *)v9;
        proxy = v9;

        [(MNNavigationServiceLocalProxy *)proxy start];
      }
    }
    v11 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E47FD0];
    navigationObservers = v2->_navigationObservers;
    v2->_navigationObservers = v11;

    uint64_t v13 = objc_opt_new();
    cachedUserOptions = v2->_cachedUserOptions;
    v2->_cachedUserOptions = (MNUserOptions *)v13;

    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    disabledCapabilities = v2->_disabledCapabilities;
    v2->_disabledCapabilities = v17;

    v19 = dispatch_get_global_queue(21, 0);
    GEORegisterPListStateCaptureLegacy();
  }
  return v2;
}

- (void)_resetDetails
{
  unint64_t v3 = (void *)MEMORY[0x1BA99B140](self, a2);
  id v4 = [[MNNavigationDetails alloc] initForServer:0];
  [(MNNavigationService *)self setDetails:v4];

  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "Resetting navigation details.", v6, 2u);
  }
}

- (void)setDetails:(id)a3
{
}

+ (BOOL)supportsNavigation
{
  return 1;
}

- (void)openForClient:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2048;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "openForClient: '%@' (%p)", (uint8_t *)&v7, 0x16u);
  }
  [(MNNavigationServiceRemoteProxy *)self->_remoteProxy openForClient:v4];
}

- (void)enableNavigationCapability:(unint64_t)a3 reason:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      __int16 v26 = v7;
      id v8 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v9 = a3;
      while (1)
      {
        id v10 = (__CFString *)(((uint64_t)(v9 << 63) >> 63) & (unint64_t)@"ETA Updates");
        if ((v9 & 2) != 0) {
          id v10 = @"Rerouting";
        }
        BOOL v11 = (v9 & 4) == 0;
        v9 &= (v9 & 4) != 0 ? (v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL) & 0xFFFFFFFFFFFFFFFALL : v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL;
        int v12 = v11 ? v10 : @"Location Propagation";
        if ((v9 & 8) == 0) {
          break;
        }
        char v13 = v9;
        v9 &= 0xFFFFFFFFFFFFFFF6;
        int v12 = @"Sending CoreLocation Route Hints";
        if ((v13 & 0x10) != 0) {
          goto LABEL_17;
        }
LABEL_18:
        [v8 addObject:v12];

        if (!v9)
        {
          v14 = [v8 componentsJoinedByString:@" | "];

          int v7 = v26;
          goto LABEL_21;
        }
      }
      if ((v9 & 0x10) == 0)
      {
        if (!v12)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown flags (%d)", v9);
          int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
      }
LABEL_17:
      v9 &= ~0x10uLL;
      int v12 = @"Offline Management";
      goto LABEL_18;
    }
    v14 = @"None";
LABEL_21:
    uint64_t v15 = @"Thermal Mitigation";
    if (!a4) {
      uint64_t v15 = @"Unknown";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v28 = v14;
    __int16 v29 = 2112;
    __int16 v30 = v15;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "enableNavigationCapability:%@ reason: %@", buf, 0x16u);
  }
  disabledCapabilities = self->_disabledCapabilities;
  v17 = [NSNumber numberWithUnsignedInteger:a3];
  v18 = [(NSMutableDictionary *)disabledCapabilities objectForKey:v17];

  if (v18)
  {
    v19 = [NSNumber numberWithUnsignedInteger:a4];
    int v20 = [v18 containsObject:v19];

    if (v20)
    {
      v21 = (void *)[v18 mutableCopy];
      v22 = [NSNumber numberWithUnsignedInteger:a4];
      [v21 removeObject:v22];

      if ([v21 count])
      {
        objc_super v23 = self->_disabledCapabilities;
        v24 = [NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v23 setObject:v21 forKey:v24];
      }
      else
      {
        [(MNNavigationServiceProxy *)self->_proxy enableNavigationCapability:a3];
        v25 = self->_disabledCapabilities;
        v24 = [NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v25 removeObjectForKey:v24];
      }
    }
  }
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationService;
  [(MNNavigationService *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MNNavigationService *)self details];
  id v6 = [v3 stringWithFormat:@"<%@: %p, details: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)closeForClient:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MNNavigationServiceRemoteProxy *)self->_remoteProxy isOpenForClient:v4])
  {
    id v5 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2048;
      id v12 = v4;
      id v6 = v10;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "closeForClient: '%@' (%p)", (uint8_t *)&v9, 0x16u);
    }
    [(MNNavigationServiceRemoteProxy *)self->_remoteProxy closeForClient:v4];
    remoteProxy = self->_remoteProxy;
    if (remoteProxy && ![(MNNavigationServiceRemoteProxy *)remoteProxy clientCount])
    {
      id v8 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "No more open clients in current process", (uint8_t *)&v9, 2u);
      }

      [(MNNavigationService *)self _resetDetails];
    }
  }
}

- (BOOL)isOpenForClient:(id)a3
{
  return [(MNNavigationServiceRemoteProxy *)self->_remoteProxy isOpenForClient:a3];
}

- (void)unregisterObserver:(id)a3
{
}

- (id)ticketForDirectionsRequest:(id)a3
{
  id v4 = a3;
  id v5 = [MNNavigationServiceDirectionsRequestTicket alloc];
  id v6 = [(MNNavigationService *)self _clientProxy];
  int v7 = [(MNNavigationServiceDirectionsRequestTicket *)v5 initWithProxy:v6 request:v4];

  return v7;
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 count];
  id v8 = MNGetMNNavigationServiceLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109376;
    int v28 = [v6 count];
    __int16 v29 = 1024;
    int v30 = a4;
    id v10 = "setRoutesForPreview:selectedRouteIndex: routes.count = %d, selectedRouteIndex = %d";
    __int16 v11 = v8;
    uint32_t v12 = 14;
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    int v28 = [v6 count];
    id v10 = "setRoutesForPreview:selectedRouteIndex: routes.count = %d";
    __int16 v11 = v8;
    uint32_t v12 = 8;
  }
  _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        int v20 = [MNActiveRouteInfo alloc];
        v21 = -[MNActiveRouteInfo initWithRoute:](v20, "initWithRoute:", v19, (void)v22);
        [v13 addObject:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  [(MNNavigationServiceProxy *)self->_proxy setRoutesForPreview:v13 selectedRouteIndex:a4];
}

- (BOOL)startNavigationWithDetails:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 description];
    *(_DWORD *)buf = 138412290;
    *(void *)v49 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "startNavigationWithDetails:error:\n\t%@", buf, 0xCu);
  }
  if ([(MNNavigationService *)self state] < 3)
  {
    unint64_t v12 = [v6 selectedRouteIndex];
    uint64_t v13 = [v6 routes];
    unint64_t v14 = [v13 count];

    if (v12 < v14)
    {
      uint64_t v15 = [v6 navigationType];
      uint64_t v16 = [(MNNavigationService *)self details];
      [v16 setDesiredNavigationType:v15];

      uint64_t v17 = [v6 routes];
      v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v6, "selectedRouteIndex"));
      uint64_t v19 = [v18 transportType];
      int v20 = [(MNNavigationService *)self details];
      [v20 setDesiredTransportType:v19];

      uint64_t v21 = [v6 isResumingMultipointRoute];
      long long v22 = [(MNNavigationService *)self details];
      [v22 setIsResumingMultipointRoute:v21];

      [(MNNavigationServiceProxy *)self->_proxy startNavigationWithDetails:v6 activeBlock:0];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v23 = self->_disabledCapabilities;
      uint64_t v24 = [(NSMutableDictionary *)v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            int v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            __int16 v29 = -[NSMutableDictionary objectForKey:](self->_disabledCapabilities, "objectForKey:", v28, (void)v41);
            uint64_t v30 = [v29 count];

            if (v30) {
              -[MNNavigationServiceProxy disableNavigationCapability:](self->_proxy, "disableNavigationCapability:", [v28 unsignedLongValue]);
            }
          }
          uint64_t v25 = [(NSMutableDictionary *)v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v25);
      }
      BOOL v31 = 1;
      goto LABEL_31;
    }
    __int16 v32 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v33 = [v6 selectedRouteIndex];
      uint64_t v34 = [v6 routes];
      int v35 = [v34 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v49 = v33;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v35;
      _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_ERROR, "MNStartNavigationDetails selectedRouteIndex is (%d), but only (%d) routes were provided", buf, 0xEu);
    }
    if (a4)
    {
      v46 = @"startNavigationDetails";
      id v47 = v6;
      long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = 7;
LABEL_30:
      objc_msgSend(v36, "_navigation_errorWithCode:userInfo:", v37, v23);
      BOOL v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
  }
  else
  {
    BOOL v9 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = [(MNNavigationService *)self state];
      if (v10 - 1 > 5) {
        __int16 v11 = @"Stopped";
      }
      else {
        __int16 v11 = off_1E60F7460[v10 - 1];
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v49 = v11;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "startNavigation called when navd is already navigating. navd state: %@", buf, 0xCu);
    }

    if (a4)
    {
      v50 = @"currentState";
      unint64_t v38 = [(MNNavigationService *)self state];
      if (v38 - 1 > 5) {
        v39 = @"Stopped";
      }
      else {
        v39 = off_1E60F7460[v38 - 1];
      }
      v51[0] = v39;
      long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
      v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = 6;
      goto LABEL_30;
    }
  }
  BOOL v31 = 0;
LABEL_32:

  return v31;
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 9) {
      id v6 = @"Unknown";
    }
    else {
      id v6 = off_1E60F7390[a3 - 1];
    }
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "stopNavigationWithReason: %@", (uint8_t *)&v7, 0xCu);
  }

  [(MNNavigationServiceProxy *)self->_proxy stopNavigationWithReason:a3];
}

- (void)rerouteWithWaypoints:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    int v7 = [v4 valueForKey:@"navDisplayName"];
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "rerouteWithWaypoints: Number of waypoints is %lu, waypoints: %@", (uint8_t *)&v8, 0x16u);
  }
  [(MNNavigationServiceProxy *)self->_proxy rerouteWithWaypoints:v4];
}

- (void)insertWaypoint:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 navDisplayName];
    int v7 = 138477827;
    int v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "insertWaypoint: %{private}@", (uint8_t *)&v7, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy insertWaypoint:v4];
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [(MNNavigationService *)self details];
  uint64_t v6 = [v5 currentRoute];
  int v7 = [v6 waypoints];
  unint64_t v8 = [v7 count];

  uint64_t v9 = MNGetMNNavigationServiceLog();
  __int16 v10 = v9;
  if (a3 && v8 > a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      unint64_t v12 = a3;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, "removeWaypointAtIndex: %lu", (uint8_t *)&v11, 0xCu);
    }

    [(MNNavigationServiceProxy *)self->_proxy removeWaypointAtIndex:a3];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218240;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      unint64_t v14 = v8;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Invalid index for removeWaypointAtIndex: %lu, total number of waypoints: %lu", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)advanceToNextLeg
{
  objc_super v3 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "advanceToNextLeg", v4, 2u);
  }

  [(MNNavigationServiceProxy *)self->_proxy advanceToNextLeg];
}

- (void)updateDestination:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 navDisplayName];
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "updateDestination: %@", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(MNNavigationService *)self details];
  [v7 setIsDetour:1];

  [(MNNavigationServiceProxy *)self->_proxy updateDestination:v4];
}

- (void)resumeOriginalDestination
{
  objc_super v3 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "resumeOriginalDestination", v5, 2u);
  }

  id v4 = [(MNNavigationService *)self details];
  [v4 setIsDetour:0];

  [(MNNavigationServiceProxy *)self->_proxy resumeOriginalDestination];
}

- (void)forceReroute
{
  objc_super v3 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "forceReroute", v4, 2u);
  }

  [(MNNavigationServiceProxy *)self->_proxy forceReroute];
}

- (void)switchToRoute:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    int v7 = [v4 uniqueRouteID];
    int v10 = 138412546;
    int v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "switchToRoute: %@ | %@", (uint8_t *)&v10, 0x16u);
  }
  int v8 = [(MNNavigationService *)self details];
  uint64_t v9 = [v8 routeInfoForRoute:v4];

  [(MNNavigationServiceProxy *)self->_proxy switchToRoute:v9];
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v8 = off_1E60F73E0[(int)v4];
    }
    uint64_t v9 = [v6 uniqueRouteID];
    *(_DWORD *)buf = 138412546;
    int v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "changeTransportType: %@ | route: %@", buf, 0x16u);
  }
  [(MNNavigationServiceProxy *)self->_proxy changeTransportType:v4 route:v6];
}

- (void)switchToDestinationRoute
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(MNNavigationService *)self destination];
  uint64_t v4 = [v3 route];

  id v5 = MNGetMNNavigationServiceLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v4 name];
      int v8 = [v4 userProvidedName];
      uint64_t v9 = [v4 source];
      if ((unint64_t)(v9 - 1) > 4) {
        int v10 = @"Unknown";
      }
      else {
        int v10 = off_1E60F7418[v9 - 1];
      }
      int v11 = 138412802;
      __int16 v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "switchToDestinationRoute | destination route: %@ (%@) %@", (uint8_t *)&v11, 0x20u);
    }
    [(MNNavigationServiceProxy *)self->_proxy switchToDestinationRoute];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "switchToDestinationRoute was called, but the destination does not lead to another route.", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)setGuidanceType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = (void *)v7;
    uint64_t v9 = @"Full";
    if (a3 == 1) {
      uint64_t v9 = @"Low";
    }
    if (a3 == 2) {
      uint64_t v9 = @"RoutePreview";
    }
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v10, 0x16u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setGuidanceType:a3];
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 + 1 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", a3);
      int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v8 = off_1E60F7440[a3 + 1];
    }
    *(_DWORD *)buf = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setVoiceGuidanceLevelOverride:a3];
}

- (void)repeatCurrentGuidance:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy repeatCurrentGuidanceWithReply:v5];
}

- (void)repeatCurrentTrafficAlert:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy repeatCurrentGuidanceWithReply:v5];
}

- (void)vibrateForPrompt:(unint64_t)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    int v10 = 138412290;
    __int16 v11 = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v10, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy vibrateForPrompt:a3 withReply:v7];
}

- (void)stopCurrentGuidancePrompt
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy stopCurrentGuidancePrompt];
}

- (int)headingOrientation
{
  v2 = [(MNNavigationService *)self details];
  int v3 = [v2 headingOrientation];

  return v3;
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = [(MNNavigationService *)self details];
  [v8 setHeadingOrientation:v3];

  [(MNNavigationServiceProxy *)self->_proxy setHeadingOrientation:v3];
}

- (BOOL)guidancePromptsEnabled
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 guidancePromptsEnabled];

  return v3;
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = [(MNNavigationService *)self details];
  [v8 setGuidancePromptsEnabled:v3];

  [(MNNavigationServiceProxy *)self->_proxy setGuidancePromptsEnabled:v3];
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    int v9 = v7;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v8, 0x12u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setIsDisplayingNavigationTray:v3];
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "setIsConnectedToCarplay: %d", (uint8_t *)v6, 8u);
  }

  [(MNNavigationServiceProxy *)self->_proxy setIsConnectedToCarplay:v3];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    int v9 = v7;
    __int16 v10 = 1024;
    int v11 = a3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v8, 0x12u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setDisplayedStepIndex:a3];
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v8 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    int v11 = v9;
    __int16 v12 = 1024;
    int v13 = a3;
    __int16 v14 = 1024;
    int v15 = a4;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "%@ %d, %d", (uint8_t *)&v10, 0x18u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setRideIndex:a3 forSegmentIndex:a4];
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v8 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    int v11 = v9;
    __int16 v12 = 2048;
    double v13 = a3;
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "%@ [%g x %g]", (uint8_t *)&v10, 0x20u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setJunctionViewImageWidth:a3 height:a4];
}

- (void)disableNavigationCapability:(unint64_t)a3 reason:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      int v8 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v28 = a3;
      unint64_t v9 = a3;
      while (1)
      {
        int v10 = (__CFString *)(((uint64_t)(v9 << 63) >> 63) & (unint64_t)@"ETA Updates");
        if ((v9 & 2) != 0) {
          int v10 = @"Rerouting";
        }
        BOOL v11 = (v9 & 4) == 0;
        v9 &= (v9 & 4) != 0 ? (v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL) & 0xFFFFFFFFFFFFFFFALL : v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL;
        __int16 v12 = v11 ? v10 : @"Location Propagation";
        if ((v9 & 8) == 0) {
          break;
        }
        char v13 = v9;
        v9 &= 0xFFFFFFFFFFFFFFF6;
        __int16 v12 = @"Sending CoreLocation Route Hints";
        if ((v13 & 0x10) != 0) {
          goto LABEL_17;
        }
LABEL_18:
        [v8 addObject:v12];

        if (!v9)
        {
          __int16 v14 = [v8 componentsJoinedByString:@" | "];

          a3 = v28;
          goto LABEL_21;
        }
      }
      if ((v9 & 0x10) == 0)
      {
        if (!v12)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown flags (%d)", v9);
          __int16 v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
      }
LABEL_17:
      v9 &= ~0x10uLL;
      __int16 v12 = @"Offline Management";
      goto LABEL_18;
    }
    __int16 v14 = @"None";
LABEL_21:
    double v15 = @"Thermal Mitigation";
    if (!a4) {
      double v15 = @"Unknown";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = v14;
    __int16 v31 = 2112;
    __int16 v32 = v15;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "disableNavigationCapability:%@ reason: %@", buf, 0x16u);
  }
  disabledCapabilities = self->_disabledCapabilities;
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:a3];
  v18 = [(NSMutableDictionary *)disabledCapabilities objectForKey:v17];

  if (v18)
  {
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:a4];
    int v20 = [v18 setByAddingObject:v19];

    uint64_t v21 = self->_disabledCapabilities;
    long long v22 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v21 setObject:v20 forKey:v22];
  }
  else
  {
    long long v23 = self->_disabledCapabilities;
    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v26 = [v24 setWithObject:v25];
    v27 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v23 setObject:v26 forKey:v27];

    [(MNNavigationServiceProxy *)self->_proxy disableNavigationCapability:a3];
  }
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = GEOOfflineModeAsString();
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "changeOfflineMode: %@(%x)", (uint8_t *)&v9, 0x12u);
  }
  if ([(MNNavigationService *)self isInNavigatingState])
  {
    if ([(MNNavigationService *)self navigationTransportType] != 1) {
      [(MNNavigationServiceProxy *)self->_proxy changeOfflineMode:v3];
    }
  }
  else
  {
    uint64_t v7 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = GEOOfflineModeAsString();
      int v9 = 138412290;
      int v10 = v8;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "changeOfflineMode: called with state %@ when the user is not navigating. This is an ERROR!! ", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (int64_t)navigationType
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 navigationType];

  return v3;
}

- (int)navigationTransportType
{
  int64_t v3 = [(MNNavigationService *)self details];
  uint64_t v4 = [v3 currentRoute];
  if (v4)
  {
    id v5 = [(MNNavigationService *)self details];
    int v6 = [v5 currentRoute];
    int v7 = [v6 transportType];
  }
  else
  {
    int v7 = 4;
  }

  return v7;
}

- (BOOL)isTrackingCurrentLocation
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 currentRoute];
  uint64_t v4 = [v3 origin];
  char v5 = [v4 isCurrentLocation];

  return v5;
}

- (BOOL)isInPreArrivalState
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 isInPreArrivalState];

  return v3;
}

- (unint64_t)voiceGuidanceLevel
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 voiceGuidanceLevel];

  return v3;
}

- (int64_t)desiredNavigationType
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 desiredNavigationType];

  return v3;
}

- (int)desiredTransportType
{
  v2 = [(MNNavigationService *)self details];
  int v3 = [v2 desiredTransportType];

  return v3;
}

- (BOOL)isResumingMultipointRoute
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 isResumingMultipointRoute];

  return v3;
}

- (BOOL)isApproachingWaypoint
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 isApproachingWaypoint];

  return v3;
}

- (GEODirectionsRequest)currentRequest
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 directionsRequest];

  return (GEODirectionsRequest *)v3;
}

- (unint64_t)routeIndex
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 routeIndex];

  return v3;
}

- (unint64_t)reconnectionRouteIndex
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 reconnectionRouteIndex];

  return v3;
}

- (NSArray)alternateRoutes
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 alternateRoutes];

  return (NSArray *)v3;
}

- (GEOComposedRoute)originalRoute
{
  unint64_t v3 = [(MNNavigationService *)self details];
  if ([v3 isFollowingOriginalRoute])
  {
    uint64_t v4 = 0;
  }
  else
  {
    char v5 = [(MNNavigationService *)self details];
    uint64_t v4 = [v5 originalRoute];
  }
  return (GEOComposedRoute *)v4;
}

- ($212C09783140BCCD23384160D545CE0D)originalRouteDivergenceCoordinate
{
  unint64_t v3 = [(MNNavigationService *)self details];
  if ([v3 isFollowingOriginalRoute])
  {
    $212C09783140BCCD23384160D545CE0D v4 = ($212C09783140BCCD23384160D545CE0D)*MEMORY[0x1E4F64198];
  }
  else
  {
    char v5 = [(MNNavigationService *)self details];
    $212C09783140BCCD23384160D545CE0D v4 = ($212C09783140BCCD23384160D545CE0D)[v5 lastOriginalRouteCoordinate];
  }
  return v4;
}

- (id)displayETAInfoForRoute:(id)a3
{
  id v4 = a3;
  char v5 = [(MNNavigationService *)self details];
  int v6 = [v5 routeInfoForRoute:v4];

  int v7 = [v6 displayETAInfo];

  return v7;
}

- (id)remainingDistanceInfoForRoute:(id)a3
{
  id v4 = a3;
  char v5 = [(MNNavigationService *)self details];
  int v6 = [v5 routeInfoForRoute:v4];

  int v7 = [v6 remainingDistanceInfo];

  return v7;
}

- (id)batteryChargeInfoForRoute:(id)a3
{
  id v4 = a3;
  char v5 = [(MNNavigationService *)self details];
  int v6 = [v5 routeInfoForRoute:v4];

  int v7 = [v6 batteryChargeInfo];

  return v7;
}

- (unint64_t)alternateRouteIndexForRoute:(id)a3
{
  id v4 = a3;
  char v5 = [(MNNavigationService *)self details];
  int v6 = [v5 routeInfoForRoute:v4];

  if (v6) {
    unint64_t v7 = [v6 alternateRouteIndex];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)etaRouteForRoute:(id)a3
{
  id v4 = a3;
  char v5 = [(MNNavigationService *)self details];
  int v6 = [v5 routeInfoForRoute:v4];

  unint64_t v7 = [v6 etaRoute];

  return v7;
}

- (id)realtimeUpdatesForRoutes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v3;
    obuint64_t j = v3;
    uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          char v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          int v6 = self->_realtimeUpdates;
          uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v23 != v9) {
                  objc_enumerationMutation(v6);
                }
                __int16 v11 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                int v12 = objc_msgSend(v11, "routeID", v16);
                uint64_t v13 = [v5 uniqueRouteID];
                int v14 = [v12 isEqual:v13];

                if (v14)
                {
                  [v18 addObject:v11];
                  goto LABEL_17;
                }
              }
              uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v21);
    }

    id v3 = v16;
  }
  else
  {
    id v18 = [MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
  }

  return v18;
}

- (id)realtimeUpdatesForAllRoutes
{
  return self->_realtimeUpdates;
}

- (void)pauseRealtimeUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = NSStringFromSelector(a2);
    int v6 = 138477827;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v6, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy pauseRealtimeUpdatesForSubscriber:self->_uuid];
}

- (void)resumeRealtimeUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = NSStringFromSelector(a2);
    int v6 = 138477827;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v6, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy resumeRealtimeUpdatesForSubscriber:self->_uuid];
}

- (unint64_t)displayedStepIndex
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 displayedStepIndex];

  return v3;
}

- (MNLocation)lastLocation
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 location];

  return (MNLocation *)v3;
}

- (MNDisplayETAInfo)displayEtaInfo
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 displayETAInfo];

  return (MNDisplayETAInfo *)v3;
}

- (MNRouteDistanceInfo)remainingDistanceInfo
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 remainingDistanceInfo];

  return (MNRouteDistanceInfo *)v3;
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 batteryChargeInfo];

  return (MNBatteryChargeInfo *)v3;
}

- (double)distanceUntilSign
{
  v2 = [(MNNavigationService *)self details];
  [v2 distanceUntilSign];
  double v4 = v3;

  return v4;
}

- (double)timeUntilSign
{
  v2 = [(MNNavigationService *)self details];
  [v2 timeUntilSign];
  double v4 = v3;

  return v4;
}

- (double)distanceUntilManeuver
{
  v2 = [(MNNavigationService *)self details];
  [v2 distanceUntilManeuver];
  double v4 = v3;

  return v4;
}

- (double)timeUntilManeuver
{
  v2 = [(MNNavigationService *)self details];
  [v2 timeUntilManeuver];
  double v4 = v3;

  return v4;
}

- (unint64_t)targetLegIndex
{
  v2 = [(MNNavigationService *)self details];
  unint64_t v3 = [v2 targetLegIndex];

  return v3;
}

- (GEOComposedWaypoint)nextWaypoint
{
  unint64_t v3 = [(MNNavigationService *)self route];
  unint64_t v4 = [(MNNavigationService *)self targetLegIndex];
  if (v3
    && (unint64_t v5 = v4,
        [v3 legs],
        int v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v5 < v7))
  {
    uint64_t v8 = [v3 legs];
    uint64_t v9 = [v8 objectAtIndexedSubscript:v5];
    int v10 = [v9 destination];
  }
  else
  {
    int v10 = 0;
  }

  return (GEOComposedWaypoint *)v10;
}

- (int64_t)upcomingAnchorPointIndex
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 upcomingAnchorPointIndex];

  return v3;
}

- (GEOComposedWaypoint)origin
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 currentRoute];
  unint64_t v4 = [v3 origin];

  return (GEOComposedWaypoint *)v4;
}

- (GEOComposedWaypoint)originalOrigin
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 originalRoute];
  unint64_t v4 = [v3 origin];

  return (GEOComposedWaypoint *)v4;
}

- (GEOComposedWaypoint)destination
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 currentRoute];
  unint64_t v4 = [v3 destination];

  return (GEOComposedWaypoint *)v4;
}

- (NSString)destinationName
{
  v2 = [(MNNavigationService *)self destination];
  int64_t v3 = [v2 navDisplayName];

  return (NSString *)v3;
}

- (GEOComposedWaypoint)originalDestination
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 originalRoute];
  unint64_t v4 = [v3 destination];

  return (GEOComposedWaypoint *)v4;
}

- (NSString)originalDestinationName
{
  v2 = [(MNNavigationService *)self originalDestination];
  int64_t v3 = [v2 navDisplayName];

  return (NSString *)v3;
}

- (BOOL)isDetour
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 isDetour];

  return v3;
}

- (MNGuidanceLaneInfo)activeLaneInfo
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 activeLaneInfo];

  return (MNGuidanceLaneInfo *)v3;
}

- (MNNavTrayGuidanceEvent)activeNavTrayGuidanceEvent
{
  return [(MNNavigationDetails *)self->_details activeNavTrayGuidanceEvent];
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 resumeRouteHandle];

  return (GEOResumeRouteHandle *)v3;
}

- (GEOComposedRoute)alternateWalkingRoute
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 backgroundWalkingRouteInfo];
  unint64_t v4 = [v3 route];

  return (GEOComposedRoute *)v4;
}

- (MNDisplayETAInfo)alternateWalkingRouteDisplayETAInfo
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 backgroundWalkingRouteInfo];
  unint64_t v4 = [v3 displayETAInfo];

  return (MNDisplayETAInfo *)v4;
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 vehicleParkingInfo];

  return (MNVehicleParkingInfo *)v3;
}

- (NSString)tracePath
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 tracePath];

  return (NSString *)v3;
}

- (double)traceDuration
{
  v2 = [(MNNavigationService *)self details];
  [v2 traceDuration];
  double v4 = v3;

  return v4;
}

- (NSArray)traceBookmarks
{
  v2 = [(MNNavigationService *)self details];
  double v3 = [v2 traceBookmarks];

  return (NSArray *)v3;
}

- (BOOL)isNavigatingFromTrace
{
  v2 = [(MNNavigationService *)self details];
  [v2 traceDuration];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (BOOL)traceIsPlaying
{
  v2 = [(MNNavigationService *)self details];
  char v3 = [v2 traceIsPlaying];

  return v3;
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v8, 0x12u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setTraceIsPlaying:v3];
}

- (double)tracePosition
{
  v2 = [(MNNavigationService *)self details];
  [v2 tracePosition];
  double v4 = v3;

  return v4;
}

- (void)setTracePosition:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy setTracePosition:a3];
}

- (void)setTracePlaybackSpeed:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@, %g", (uint8_t *)&v8, 0x16u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setTracePlaybackSpeed:a3];
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy recordTraceBookmarkAtCurrentPositionWthScreenshotData:v5];
}

- (void)recordPedestrianTracePath:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy recordPedestrianTracePath:v5];
}

- (int64_t)simulationType
{
  v2 = [(MNNavigationService *)self details];
  int64_t v3 = [v2 simulationType];

  return v3;
}

- (void)setSimulationSpeedOverride:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%@ [%g]", (uint8_t *)&v8, 0x16u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setSimulationSpeedOverride:a3];
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%@ [%g]", (uint8_t *)&v8, 0x16u);
  }
  [(MNNavigationServiceProxy *)self->_proxy setSimulationSpeedMultiplier:a3];
}

- (void)setSimulationPosition:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    unint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
    int v10 = 138412546;
    double v11 = v7;
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%@ [%g]", (uint8_t *)&v10, 0x16u);
  }
  if (a3 < 0.0 || a3 > 1.0)
  {
    int v8 = [NSString stringWithFormat:@"Only values between [0, 1] are valid."];
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      double v11 = "-[MNNavigationService setSimulationPosition:]";
      __int16 v12 = 2080;
      double v13 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m");
      __int16 v14 = 1024;
      int v15 = 896;
      __int16 v16 = 2080;
      uint64_t v17 = "0 <= position && position <= 1";
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v10, 0x30u);
    }
  }
  [(MNNavigationServiceProxy *)self->_proxy setSimulationPosition:a3];
}

- (id)_clientProxy
{
  clientProxy = self->_clientProxy;
  if (!clientProxy)
  {
    double v4 = objc_alloc_init(MNNavigationClientProxy);
    id v5 = self->_clientProxy;
    self->_clientProxy = v4;

    clientProxy = self->_clientProxy;
  }
  return clientProxy;
}

- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    double v11 = (void *)v10;
    if (a4 - 1 > 5) {
      __int16 v12 = @"Stopped";
    }
    else {
      __int16 v12 = off_1E60F7460[a4 - 1];
    }
    if (a5 - 1 > 5) {
      double v13 = @"Stopped";
    }
    else {
      double v13 = off_1E60F7460[a5 - 1];
    }
    int v14 = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)'%@' to '%@'", (uint8_t *)&v14, 0x20u);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self willChangeFromState:a4 toState:a5];
}

- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    double v11 = (void *)v10;
    if (a4 - 1 > 5) {
      __int16 v12 = @"Stopped";
    }
    else {
      __int16 v12 = off_1E60F7460[a4 - 1];
    }
    if (a5 - 1 > 5) {
      double v13 = @"Stopped";
    }
    else {
      double v13 = off_1E60F7460[a5 - 1];
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    long long v24 = v12;
    __int16 v25 = 2112;
    long long v26 = v13;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)'%@' to '%@'", buf, 0x20u);
  }
  int v14 = [(MNNavigationService *)self details];
  [v14 setState:a5];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didChangeFromState:a4 toState:a5];
  if (!a5)
  {
    [(MNNavigationService *)self _resetDetails];
    unint64_t v15 = [(MNNavigationServiceRemoteProxy *)self->_remoteProxy interruptionCount];
    if (a4 >= 3)
    {
      if (v15)
      {
        __int16 v16 = [(MNNavigationServiceRemoteProxy *)self->_remoteProxy interruptionDates];
        v20[1] = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:2];

        __int16 v18 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:userInfo:", 10, v17);
        [(MNObserverHashTable *)self->_navigationObservers navigationService:self didFailWithError:v18];
      }
    }
  }
}

- (void)navigationServiceProxyWillPauseNavigation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceWillPause:self];
}

- (void)navigationServiceProxyWillResumeFromPauseNavigation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceWillResumeFromPause:self];
}

- (void)navigationServiceProxy:(id)a3 didFailWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNNavigationServiceProxy *)self->_proxy stopNavigationWithReason:1];
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didFailWithError:v6];
}

- (void)navigationServiceProxy:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    int v9 = [(MNNavigationService *)self details];
    uint64_t v10 = [v9 navigationState];
    if (v10 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = off_1E60F7490[(int)v10];
    }
    __int16 v12 = v11;
    if (v4 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      double v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v13 = off_1E60F7490[(int)v4];
    }
    *(_DWORD *)buf = 138543874;
    id v16 = v8;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ => %@", buf, 0x20u);
  }
  int v14 = [(MNNavigationService *)self details];
  [v14 setNavigationState:v4];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didChangeNavigationState:v4];
}

- (void)navigationServiceProxy:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    int v12 = 138543874;
    double v13 = v10;
    __int16 v14 = 1024;
    int v15 = a4;
    __int16 v16 = 1024;
    int v17 = a5;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d, %d", (uint8_t *)&v12, 0x18u);
  }
  uint64_t v11 = [(MNNavigationService *)self details];
  [v11 setDisplayedStepIndex:a4];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didUpdateDisplayedStepIndex:a4 segmentIndex:a5];
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = NSStringFromSelector(a2);
    int v15 = 138543874;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    double v18 = a4;
    __int16 v19 = 2048;
    double v20 = a5;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "(%{public}@)| %0.1f meters, %0.1f seconds", (uint8_t *)&v15, 0x20u);
  }
  double v13 = [(MNNavigationService *)self details];
  [v13 setDistanceUntilManeuver:a4];

  __int16 v14 = [(MNNavigationService *)self details];
  [v14 setTimeUntilManeuver:a5];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didUpdateDistanceUntilManeuver:a6 timeUntilManeuver:a4 forStepIndex:a5];
}

- (void)navigationServiceProxyDidFinishLocationUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEBUG, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidFinishLocationUpdate:self];
}

- (void)navigationServiceProxy:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 1024;
    int v13 = a4;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)legIndex: %d", (uint8_t *)&v10, 0x12u);
  }
  uint64_t v9 = [(MNNavigationService *)self details];
  [v9 setIsApproachingWaypoint:1];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self isApproachingEndOfLeg:a4];
}

- (void)navigationServiceProxy:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v8 name];
    int v12 = 138543875;
    int v13 = v10;
    __int16 v14 = 2113;
    int v15 = v11;
    __int16 v16 = 1024;
    int v17 = a5;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)%{private}@ | legIndex: %d", (uint8_t *)&v12, 0x1Cu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didEnterPreArrivalStateForWaypoint:v8 endOfLegIndex:a5];
}

- (void)navigationServiceProxy:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v8 name];
    int v12 = 138543875;
    int v13 = v10;
    __int16 v14 = 2113;
    int v15 = v11;
    __int16 v16 = 1024;
    int v17 = a5;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)%{private}@ | legIndex: %d", (uint8_t *)&v12, 0x1Cu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didArriveAtWaypoint:v8 endOfLegIndex:a5];
}

- (void)navigationServiceProxy:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v11 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = NSStringFromSelector(a2);
    uint64_t v13 = [v10 name];
    __int16 v14 = (void *)v13;
    if (a6 - 1 > 5) {
      int v15 = @"Unknown";
    }
    else {
      int v15 = off_1E60F74D8[a6 - 1];
    }
    int v18 = 138544131;
    __int16 v19 = v12;
    __int16 v20 = 2113;
    uint64_t v21 = v13;
    __int16 v22 = 1024;
    int v23 = a5;
    __int16 v24 = 2112;
    __int16 v25 = v15;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@)%{private}@ | legIndex: %d | reason: %@", (uint8_t *)&v18, 0x26u);
  }
  __int16 v16 = [(MNNavigationService *)self details];
  [v16 setIsApproachingWaypoint:0];

  int v17 = [(MNNavigationService *)self details];
  [v17 setIsInPreArrivalState:0];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didResumeNavigatingFromWaypoint:v10 endOfLegIndex:a5 reason:a6];
}

- (void)navigationServiceProxyDidEnterPreArrivalState:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(MNNavigationService *)self details];
  [v7 setIsInPreArrivalState:1];

  [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidEnterPreArrivalState:self];
}

- (void)navigationServiceProxyDidArrive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidArrive:self];
}

- (void)navigationServiceProxy:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = NSStringFromSelector(a2);
    int v16 = 138543362;
    int v17 = v12;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v13 = [(MNNavigationService *)self details];
  [v13 setProceedToRouteDistance:a4];

  __int16 v14 = [(MNNavigationService *)self details];
  [v14 setDisplayString:v10];

  int v15 = [(MNNavigationService *)self details];
  [v15 setClosestStepIndex:a6];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didUpdateProceedToRouteDistance:v10 displayString:a6 closestStepIndex:a4];
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = NSStringFromSelector(a2);
    int v15 = 138543362;
    int v16 = v12;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v13 = [(MNNavigationService *)self details];
  [v13 setDistanceUntilSign:a4];

  __int16 v14 = [(MNNavigationService *)self details];
  [v14 setTimeUntilSign:a5];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didUpdateDistanceUntilSign:a6 timeUntilSign:a4 forStepIndex:a5];
}

- (void)navigationServiceProxy:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(a2);
    int v11 = 138543362;
    int v12 = v10;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v11, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self willAnnounce:a4 inSeconds:a5];
}

- (void)navigationServiceProxy:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v11 = *(void *)&a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  __int16 v19 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v23 = v20;
    _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_INFO, "(%{public}@)", buf, 0xCu);
  }
  LOBYTE(v21) = a10;
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self displayPrimaryStep:v18 instructions:v17 shieldType:v11 shieldText:v16 drivingSide:v10 maneuverStepIndex:a9 isSynthetic:v21];
}

- (void)navigationServiceProxy:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self displayManeuverAlertForAnnouncementStage:a4];
}

- (void)navigationServiceProxy:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a6;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = NSStringFromSelector(a2);
    int v19 = 138543362;
    __int16 v20 = v18;
    _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v19, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self displaySecondaryStep:v16 instructions:v15 shieldType:v9 shieldText:v14 drivingSide:v8];
}

- (void)navigationServiceProxyHideSecondaryStep:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidHideSecondaryStep:self];
}

- (void)navigationServiceProxyBeginGuidanceUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceBeginGuidanceUpdate:self];
}

- (void)navigationServiceProxyEndGuidanceUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceEndGuidanceUpdate:self];
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 secondarySign];

  int v7 = MNGetMNNavigationServiceLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [v5 primarySign];
      uint64_t v10 = [v5 secondarySign];
      int v11 = 138412546;
      int v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(navigationServiceProxy:updateSignsWithInfo:) %@ / %@", (uint8_t *)&v11, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    uint64_t v9 = [v5 primarySign];
    int v11 = 138412290;
    int v12 = v9;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(navigationServiceProxy:updateSignsWithInfo:) %@", (uint8_t *)&v11, 0xCu);
    goto LABEL_6;
  }

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self updateSignsWithInfo:v5];
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithARInfo:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "(navigationServiceProxy:updateSignsWithARInfo:) %@", (uint8_t *)&v7, 0xCu);
  }

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self updateSignsWithARInfo:v5];
}

- (void)navigationServiceProxy:(id)a3 usePersistentDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self usePersistentDisplay:v4];
}

- (void)navigationServiceProxy:(id)a3 showLaneDirections:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = [v6 uniqueID];
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)%@, %@", (uint8_t *)&v10, 0x20u);
  }
  [(MNNavigationDetails *)self->_details setActiveLaneInfo:v6];
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self showLaneDirections:v6];
}

- (void)navigationServiceProxy:(id)a3 hideLaneDirectionsForId:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(a2);
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)%@", (uint8_t *)&v15, 0x16u);
  }
  int v9 = [(MNNavigationDetails *)self->_details activeLaneInfo];
  int v10 = [v9 uniqueID];
  char v11 = [v10 isEqual:v6];

  if ((v11 & 1) == 0)
  {
    __int16 v12 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(MNNavigationDetails *)self->_details activeLaneInfo];
      __int16 v14 = [v13 uniqueID];
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "Requested to remove active lane info with ID %@, but active info was %@", (uint8_t *)&v15, 0x16u);
    }
  }
  [(MNNavigationDetails *)self->_details setActiveLaneInfo:0];
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self hideLaneDirectionsForId:v6];
}

- (void)navigationServiceProxy:(id)a3 showJunctionView:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self showJunctionView:v6];
}

- (void)navigationServiceProxy:(id)a3 hideJunctionViewForId:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self hideJunctionViewForId:v6];
}

- (void)navigationServiceProxy:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v10, 0x12u);
  }
  int v9 = [(MNNavigationService *)self details];
  [v9 setGuidancePromptsEnabled:v4];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didEnableGuidancePrompts:v4];
}

- (void)navigationServiceProxy:(id)a3 newGuidanceEventFeedback:(id)a4
{
}

- (void)navigationServiceProxy:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
}

- (void)navigationServiceProxy:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
}

- (void)navigationServiceProxy:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = [v6 route];
    int v10 = [v9 name];
    uint64_t v11 = [v6 routeID];
    int v25 = 138543874;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    long long v28 = v10;
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ | route ID: %@", (uint8_t *)&v25, 0x20u);
  }
  __int16 v12 = [(MNNavigationService *)self details];
  [v12 updateETATrafficForRoute:v6];

  BOOL v13 = [(MNNavigationService *)self details];
  uint64_t v14 = [v6 routeID];
  int v15 = [v13 routeInfoForID:v14];

  if (v15)
  {
    navigationObservers = self->_navigationObservers;
    __int16 v17 = [v15 etaResponse];
    id v18 = [v15 route];
    [(MNObserverHashTable *)navigationObservers navigationService:self didUpdateETAResponse:v17 forRoute:v18];

    uint64_t v19 = self->_navigationObservers;
    __int16 v20 = [v15 routeID];
    [(MNObserverHashTable *)v19 navigationService:self didUpdateTrafficForRouteID:v20];

    uint64_t v21 = self->_navigationObservers;
    __int16 v22 = [v15 route];
    int v23 = [v22 mutableData];
    uint64_t v24 = [v15 route];
    [(MNObserverHashTable *)v21 navigationService:self didUpdateMutableData:v23 forRoute:v24];
  }
}

- (void)navigationServiceProxy:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
}

- (void)navigationServiceProxy:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
}

- (void)navigationServiceProxy:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    int v14 = 138543362;
    int v15 = v10;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v11 = [(MNNavigationService *)self details];
  [v11 setPreviewRoutes:v8 withSelectedRouteIndex:a5];

  __int16 v12 = [(MNNavigationService *)self details];
  BOOL v13 = [v12 previewRoutes];

  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didUpdatePreviewRoutes:v13 withSelectedRouteIndex:a5];
}

- (void)navigationServiceProxyWillReroute:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceWillReroute:self];
}

- (void)navigationServiceProxy:(id)a3 didRerouteWithRoute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v14 && ([v14 route], __int16 v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    id v18 = [(MNNavigationService *)self details];
    [v18 setCurrentRoute:v14 withAlternateRoutes:v16];

    uint64_t v19 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = NSStringFromSelector(a2);
      uint64_t v21 = [v14 routeID];
      id v34 = v13;
      int v22 = [v16 count];
      uint64_t v33 = [(MNNavigationService *)self details];
      int v23 = [v33 routeLookupIDs];
      [v23 componentsJoinedByString:@", "];
      uint64_t v24 = v35 = a7;
      *(_DWORD *)buf = 138413058;
      uint64_t v37 = v20;
      __int16 v38 = 2112;
      v39 = v21;
      __int16 v40 = 1024;
      int v41 = v22;
      id v13 = v34;
      __int16 v42 = 2112;
      long long v43 = v24;
      _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_DEFAULT, "(%@) %@ | alternate routes: %d\nKnown route IDs: (%@)", buf, 0x26u);

      a7 = v35;
    }

    int v25 = [(MNNavigationService *)self details];
    uint64_t v26 = [v25 currentRoute];

    __int16 v27 = [(MNNavigationService *)self details];
    [v27 setLocation:v15];

    [(MNObserverHashTable *)self->_navigationObservers navigationService:self didReroute:v26 rerouteReason:a7];
    long long v28 = [v15 routeID];

    if (v28) {
      [(MNObserverHashTable *)self->_navigationObservers navigationService:self didUpdateMatchedLocation:v15];
    }
    navigationObservers = self->_navigationObservers;
    uint64_t v30 = [v14 displayETAInfo];
    uint64_t v31 = [v14 remainingDistanceInfo];
    uint64_t v32 = [v14 batteryChargeInfo];
    [(MNObserverHashTable *)navigationObservers navigationService:self didUpdateDisplayETA:v30 remainingDistance:v31 batteryChargeInfo:v32];
  }
  else
  {
    uint64_t v26 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v26, OS_LOG_TYPE_ERROR, "didRerouteWithRoute: was called with a null routeInfo or route", buf, 2u);
    }
  }
}

- (void)navigationServiceProxyDidCancelReroute:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidCancelReroute:self];
}

- (void)navigationServiceProxy:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(MNNavigationService *)self details];
  [v7 setCurrentRoute:v6 withAlternateRoutes:0];

  id v8 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    int v10 = [(MNNavigationService *)self details];
    uint64_t v11 = [v10 routeLookupIDs];
    __int16 v12 = [v11 componentsJoinedByString:@", "];
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)\nKnown route IDs: (%@)", (uint8_t *)&v15, 0x16u);
  }
  navigationObservers = self->_navigationObservers;
  id v14 = [v6 route];
  [(MNObserverHashTable *)navigationObservers navigationService:self didUpdateRouteWithNewRideSelection:v14];
}

- (void)navigationServiceProxy:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(MNNavigationService *)self details];
  [v9 setBackgroundWalkingRouteInfo:0];

  int v10 = [(MNNavigationService *)self details];
  [v10 setVehicleParkingInfo:0];

  uint64_t v11 = [(MNNavigationService *)self details];
  [v11 setCurrentRoute:v8 withAlternateRoutes:0];

  __int16 v12 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(a2);
    id v14 = [(MNNavigationService *)self details];
    int v15 = [v14 routeLookupIDs];
    id v16 = [v15 componentsJoinedByString:@", "];
    int v19 = 138543618;
    __int16 v20 = v13;
    __int16 v21 = 2112;
    int v22 = v16;
    _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@)\nKnown route IDs: (%@)", (uint8_t *)&v19, 0x16u);
  }
  __int16 v17 = [v8 route];
  id v18 = [v8 traffic];
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didSwitchToNewTransportType:v5 newRoute:v17 traffic:v18];
}

- (void)navigationServiceProxy:(id)a3 didFailRerouteWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v9, 0x16u);
  }
  -[MNObserverHashTable navigationService:failedRerouteWithErrorCode:](self->_navigationObservers, "navigationService:failedRerouteWithErrorCode:", self, [v6 code]);
}

- (void)navigationServiceProxy:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  int v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  int v9 = [v7 stringWithFormat:@"(%@) count: %d", v8, objc_msgSend(v5, "count")];
  [v6 addObject:v9];

  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v15 = NSString;
        id v16 = [v14 route];
        __int16 v17 = [v16 name];
        id v18 = [v14 displayETAInfo];
        int v19 = [v15 stringWithFormat:@"    %@ | %d minutes", v17, objc_msgSend(v18, "displayRemainingMinutesToEndOfRoute")];
        [v6 addObject:v19];

        __int16 v20 = [v14 traffic];

        if (v20)
        {
          __int16 v21 = [v14 traffic];
          int v22 = [v14 routeID];
          [v37 setObject:v21 forKeyedSubscript:v22];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v11);
  }

  uint64_t v23 = [(MNNavigationService *)self details];
  [v23 setAlternateRoutes:obj];

  uint64_t v24 = NSString;
  int v25 = [(MNNavigationService *)self details];
  uint64_t v26 = [v25 routeLookupIDs];
  __int16 v27 = [v26 componentsJoinedByString:@", "];
  long long v28 = [v24 stringWithFormat:@"Known route IDs: %@", v27];
  [v6 addObject:v28];

  __int16 v29 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v6 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138412290;
    long long v43 = v30;
    _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  navigationObservers = self->_navigationObservers;
  uint64_t v32 = [(MNNavigationService *)self details];
  uint64_t v33 = [v32 alternateRoutes];
  id v34 = (void *)[v37 copy];
  [(MNObserverHashTable *)navigationObservers navigationService:self didUpdateAlternateRoutes:v33 traffics:v34];
}

- (void)navigationServiceProxy:(id)a3 didReceiveTrafficIncidentAlert:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = (void *)MEMORY[0x1E4F29128];
    uint64_t v10 = [v6 alertID];
    uint64_t v11 = objc_msgSend(v9, "_geo_uuidForData:", v10);
    int v12 = [v6 alertType];
    uint64_t v13 = [v6 etaResponseID];
    *(_DWORD *)buf = 138544130;
    int v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 1024;
    int v26 = v12;
    __int16 v27 = 2112;
    long long v28 = v13;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ | Type: %d | ResponseID: %@", buf, 0x26u);
  }
  id v14 = [(MNNavigationService *)self details];
  id v15 = (id)[v14 updateWithTrafficIncidentAlert:v6];

  navigationObservers = self->_navigationObservers;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__MNNavigationService_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke;
  v18[3] = &unk_1E60F7348;
  id v19 = v6;
  __int16 v20 = self;
  id v17 = v6;
  [(MNObserverHashTable *)navigationObservers navigationService:self didReceiveTrafficIncidentAlert:v17 responseCallback:v18];
}

uint64_t __77__MNNavigationService_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)MEMORY[0x1E4F29128];
    id v6 = [*(id *)(a1 + 32) alertID];
    int v7 = objc_msgSend(v5, "_geo_uuidForData:", v6);
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "acceptReroute: %d | %@", (uint8_t *)v9, 0x12u);
  }
  return [*(id *)(*(void *)(a1 + 40) + 16) acceptReroute:a2 forTrafficIncidentAlert:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    int v9 = (void *)MEMORY[0x1E4F29128];
    __int16 v10 = [v6 alertID];
    objc_msgSend(v9, "_geo_uuidForData:", v10);
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
    int v16 = 138543618;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)%@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v12 = [(MNNavigationService *)self details];
  uint64_t v13 = [v12 updateWithTrafficIncidentAlert:v6];

  if (v13)
  {
    [(MNObserverHashTable *)self->_navigationObservers navigationService:self didUpdateTrafficIncidentAlert:v13];
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"Couldn't find traffic incident alert to update"];
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      id v17 = "-[MNNavigationService navigationServiceProxy:didUpdateTrafficIncidentAlert:]";
      __int16 v18 = 2080;
      id v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m";
      __int16 v20 = 1024;
      int v21 = 1377;
      __int16 v22 = 2080;
      __int16 v23 = "(existingAlert != nil)";
      __int16 v24 = 2112;
      __int16 v25 = v14;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v16, 0x30u);
    }
  }
}

- (void)navigationServiceProxy:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = (void *)MEMORY[0x1E4F29128];
    __int16 v10 = [v6 alertID];
    uint64_t v11 = objc_msgSend(v9, "_geo_uuidForData:", v10);
    int v18 = 138543618;
    id v19 = v8;
    __int16 v20 = 2112;
    int v21 = v11;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v12 = [(MNNavigationService *)self details];
  uint64_t v13 = [v12 removeTrafficIncidentAlert:v6];

  if (v13)
  {
    [(MNObserverHashTable *)self->_navigationObservers navigationService:self didInvalidateTrafficIncidentAlert:v13];
  }
  else
  {
    id v14 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)MEMORY[0x1E4F29128];
      int v16 = [v6 alertID];
      id v17 = objc_msgSend(v15, "_geo_uuidForData:", v16);
      int v18 = 138412290;
      id v19 = v17;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "Invalidate traffic incident alert did not find existing alert with ID %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)navigationServiceProxy:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = (void *)MEMORY[0x1E4F29128];
    __int16 v10 = [v6 alertID];
    uint64_t v11 = objc_msgSend(v9, "_geo_uuidForData:", v10);
    int v12 = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v12, 0x16u);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didDismissTrafficIncidentAlert:v6];
}

- (void)navigationServiceProxy:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  switch([v5 eventType])
  {
    case 0:
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v33 = 136315650;
        id v34 = "-[MNNavigationService navigationServiceProxy:didUpdateTracePlaybackDetails:]";
        __int16 v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m";
        __int16 v37 = 1024;
        int v38 = 1457;
        _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v33, 0x1Cu);
      }

      break;
    case 1:
      int v7 = [v5 tracePath];
      id v8 = [(MNNavigationService *)self details];
      [v8 setTracePath:v7];

      [v5 traceDuration];
      double v10 = v9;
      uint64_t v11 = [(MNNavigationService *)self details];
      [v11 setTraceDuration:v10];

      int v12 = [v5 bookmarks];
      uint64_t v13 = [(MNNavigationService *)self details];
      [v13 setTraceBookmarks:v12];

      __int16 v14 = [(MNNavigationService *)self details];
      [v14 setTraceIsPlaying:1];

      id v15 = objc_alloc_init(MNNavigationTraceInfo);
      uint64_t v16 = [v5 pedestrianTracePath];
      [(MNNavigationTraceInfo *)v15 setPedestrianTracePath:v16];

      [v5 pedestrianTraceStartRelativeTimestamp];
      -[MNNavigationTraceInfo setPedestrianTraceStartRelativeTimestamp:](v15, "setPedestrianTraceStartRelativeTimestamp:");
      [(MNObserverHashTable *)self->_navigationObservers navigationService:self didFinishLoadingTrace:v15];

      break;
    case 2:
      id v17 = [(MNNavigationService *)self details];
      [v17 setTraceIsPlaying:1];

      [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidResumeTrace:self];
      break;
    case 3:
      int v18 = [(MNNavigationService *)self details];
      [v18 setTraceIsPlaying:0];

      [(MNObserverHashTable *)self->_navigationObservers navigationServiceDidPauseTrace:self];
      break;
    case 4:
      [v5 currentPosition];
      double v20 = v19;
      int v21 = [(MNNavigationService *)self details];
      [v21 setTracePosition:v20];

      navigationObservers = self->_navigationObservers;
      __int16 v23 = [(MNNavigationService *)self details];
      [v23 tracePosition];
      -[MNObserverHashTable navigationService:didPlayTracePosition:](navigationObservers, "navigationService:didPlayTracePosition:", self);
      goto LABEL_12;
    case 5:
      [v5 currentPosition];
      double v25 = v24;
      uint64_t v26 = [(MNNavigationService *)self details];
      [v26 setTracePosition:v25];

      __int16 v27 = self->_navigationObservers;
      __int16 v23 = [(MNNavigationService *)self details];
      [v23 tracePosition];
      -[MNObserverHashTable navigationService:didSeekToTracePosition:](v27, "navigationService:didSeekToTracePosition:", self);
      goto LABEL_12;
    case 6:
      long long v28 = [v5 bookmarks];
      uint64_t v29 = [(MNNavigationService *)self details];
      [v29 setTraceBookmarks:v28];

      -[MNObserverHashTable navigationService:didRecordTraceBookmarkWithID:](self->_navigationObservers, "navigationService:didRecordTraceBookmarkWithID:", self, [v5 recordedBookmarkID]);
      break;
    case 7:
      uint64_t v30 = [v5 tracePath];
      uint64_t v31 = [(MNNavigationService *)self details];
      [v31 setTracePath:v30];

      uint64_t v32 = self->_navigationObservers;
      __int16 v23 = [v5 tracePath];
      [(MNObserverHashTable *)v32 navigationService:self didStartRecordingTraceWithPath:v23];
LABEL_12:

      break;
    default:
      break;
  }
}

- (void)navigationServiceProxy:(id)a3 didActivateAudioSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    double v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didActivateAudioSession:v4];
}

- (void)navigationServiceProxy:(id)a3 didStartSpeakingPrompt:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    double v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didStartSpeakingPrompt:v6];
}

- (void)navigationServiceProxy:(id)a3 willProcessSpeechEvent:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    double v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self willProcessSpeechEvent:v6];
}

- (void)navigationServiceProxy:(id)a3 didProcessSpeechEvent:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v11 = 138543362;
    int v12 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v11, 0xCu);
  }
  if ([v6 hasSpokenGuidance])
  {
    int v9 = [(MNNavigationService *)self details];
    double v10 = [v6 uniqueID];
    [v9 markAnnouncementSpoken:v10];
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didProcessSpeechEvent:v6];
}

- (void)navigationServiceProxy:(id)a3 triggerHaptics:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    double v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self triggerHaptics:v4];
}

- (void)navigationServiceProxy:(id)a3 willRequestRealtimeUpdatesForRouteIDs:(id)a4
{
}

- (void)navigationServiceProxy:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  objc_storeStrong((id *)&self->_realtimeUpdates, a4);
  id v6 = a4;
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didReceiveRealtimeUpdates:v6];
}

- (void)navigationServiceProxy:(id)a3 didReceiveTransitAlert:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543362;
    double v10 = v8;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(MNObserverHashTable *)self->_navigationObservers navigationService:self didReceiveTransitAlert:v6];
}

- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4
{
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  int64_t v3 = self;
  v86[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(MNNavigationService *)self route];
  unint64_t v5 = 0x1E4F28000uLL;
  v72 = v4;
  v73 = v3;
  if (v4)
  {
    v85[0] = @"routeID";
    id v6 = v4;
    v69 = [v4 uniqueRouteID];
    uint64_t v7 = [v69 UUIDString];
    id v8 = (void *)v7;
    if (v7) {
      int v9 = (__CFString *)v7;
    }
    else {
      int v9 = &stru_1F0E08010;
    }
    v86[0] = v9;
    v85[1] = @"name";
    uint64_t v10 = [v6 name];
    uint64_t v11 = (void *)v10;
    if (v10) {
      int v12 = (__CFString *)v10;
    }
    else {
      int v12 = &stru_1F0E08010;
    }
    v86[1] = v12;
    v85[2] = @"legs";
    uint64_t v13 = NSNumber;
    v67 = [v6 legs];
    __int16 v14 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
    v86[2] = v14;
    v85[3] = @"segments";
    id v15 = NSNumber;
    uint64_t v16 = [v6 segments];
    id v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v86[3] = v17;
    v85[4] = @"steps";
    int v18 = NSNumber;
    double v19 = [v6 steps];
    double v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v86[4] = v20;
    v85[5] = @"length";
    int v21 = NSNumber;
    [v6 distance];
    uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
    v86[5] = v22;
    v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:6];

    unint64_t v5 = 0x1E4F28000;
    int64_t v3 = v73;
  }
  else
  {
    v71 = 0;
  }
  __int16 v23 = [MEMORY[0x1E4F1CA48] array];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  double v24 = [(MNNavigationService *)v3 alternateRoutes];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v75 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = [*(id *)(*((void *)&v74 + 1) + 8 * i) uniqueRouteID];
        uint64_t v30 = [v29 UUIDString];
        uint64_t v31 = (void *)v30;
        if (v30) {
          uint64_t v32 = (__CFString *)v30;
        }
        else {
          uint64_t v32 = &stru_1F0E08010;
        }
        [(__CFString *)v23 addObject:v32];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v26);
  }

  int v33 = [(MNNavigationService *)v3 displayEtaInfo];
  id v34 = v33;
  if (v33)
  {
    v70 = v33;
    __int16 v35 = [v33 legInfos];
    v36 = [v35 firstObject];

    v68 = v36;
    if (v36)
    {
      v82[0] = @"remainingMinutes";
      __int16 v37 = objc_msgSend(*(id *)(v5 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v36, "remainingMinutes"));
      v83[0] = v37;
      v82[1] = @"displayETA";
      uint64_t v38 = [v36 eta];
      uint64_t v39 = (void *)v38;
      if (v38) {
        long long v40 = (__CFString *)v38;
      }
      else {
        long long v40 = &stru_1F0E08010;
      }
      v83[1] = v40;
      v82[2] = @"legIndex";
      long long v41 = objc_msgSend(*(id *)(v5 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v36, "legIndex"));
      v83[2] = v41;
      v82[3] = @"timeZone";
      __int16 v42 = [v36 timeZone];
      uint64_t v43 = [v42 description];
      unint64_t v44 = v5;
      uint64_t v45 = (void *)v43;
      if (v43) {
        v46 = (__CFString *)v43;
      }
      else {
        v46 = &stru_1F0E08010;
      }
      v83[3] = v46;
      id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:4];
    }
    else
    {
      id v47 = 0;
      unint64_t v44 = v5;
    }
    v80[0] = @"routeID";
    id v34 = v70;
    v49 = [v70 routeID];
    uint64_t v50 = [v49 UUIDString];
    v51 = (void *)v50;
    if (v50) {
      v52 = (__CFString *)v50;
    }
    else {
      v52 = &stru_1F0E08010;
    }
    v81[0] = v52;
    v80[1] = @"legInfos";
    v53 = *(void **)(v44 + 3792);
    v54 = [v70 legInfos];
    uint64_t v55 = objc_msgSend(v53, "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
    v56 = (void *)v55;
    v80[2] = @"legInfos[0]";
    if (v47) {
      v57 = v47;
    }
    else {
      v57 = &stru_1F0E08010;
    }
    v81[1] = v55;
    v81[2] = v57;
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];

    int64_t v3 = v73;
    unint64_t v5 = v44;
  }
  else
  {
    v48 = 0;
  }
  v78[0] = @"state";
  v58 = objc_msgSend(*(id *)(v5 + 3792), "numberWithUnsignedInteger:", -[MNNavigationService state](v3, "state"));
  v79[0] = v58;
  v78[1] = @"navigationState";
  v59 = objc_msgSend(*(id *)(v5 + 3792), "numberWithInt:", -[MNNavigationService navigationState](v3, "navigationState"));
  v79[1] = v59;
  v78[2] = @"navigationType";
  uint64_t v60 = objc_msgSend(*(id *)(v5 + 3792), "numberWithInteger:", -[MNNavigationService navigationType](v3, "navigationType"));
  v61 = (void *)v60;
  if (v71) {
    v62 = v71;
  }
  else {
    v62 = &stru_1F0E08010;
  }
  v79[2] = v60;
  v79[3] = v62;
  v78[3] = @"currentRoute";
  v78[4] = @"alternateRoutes";
  if (v23) {
    v63 = v23;
  }
  else {
    v63 = &stru_1F0E08010;
  }
  v78[5] = @"displayETA";
  if (v48) {
    v64 = v48;
  }
  else {
    v64 = &stru_1F0E08010;
  }
  v79[4] = v63;
  v79[5] = v64;
  v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:6];

  return v65;
}

- (MNObserverHashTable)navigationObservers
{
  return self->_navigationObservers;
}

- (void)setNavigationObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUserOptions, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_disabledCapabilities, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_realtimeUpdates, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_navigationObservers, 0);
}

+ (unint64_t)clientInterfaceHash
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MNNavigationService_Internal__clientInterfaceHash__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB59C0D8 != -1) {
    dispatch_once(&qword_1EB59C0D8, block);
  }
  return qword_1EB59C0D0;
}

uint64_t __52__MNNavigationService_Internal__clientInterfaceHash__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hashForProtocol:&unk_1F0E3C800];
  qword_1EB59C0D0 = result;
  return result;
}

+ (unint64_t)daemonInterfaceHash
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MNNavigationService_Internal__daemonInterfaceHash__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB59C0E8 != -1) {
    dispatch_once(&qword_1EB59C0E8, block);
  }
  return qword_1EB59C0E0;
}

uint64_t __52__MNNavigationService_Internal__daemonInterfaceHash__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hashForProtocol:&unk_1F0E3FFE0];
  qword_1EB59C0E0 = result;
  return result;
}

+ (unint64_t)_hashForProtocol:(id)a3
{
  int64_t v3 = (Protocol *)a3;
  uint64_t v4 = [MEMORY[0x1E4F28E78] string];
  unsigned int outCount = 0;
  unint64_t v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount);
  id v6 = v5;
  if (outCount)
  {
    unint64_t v7 = 0;
    p_types = &v5->types;
    do
    {
      int v9 = NSStringFromSelector(*(p_types - 1));
      uint64_t v10 = *p_types;
      p_types += 2;
      [v4 appendFormat:@"%@%s", v9, v10];

      ++v7;
    }
    while (v7 < outCount);
  }
  free(v6);
  unint64_t v11 = [v4 hash];

  return v11;
}

- (void)_navigationServiceCallback_DidChangeVoiceGuidanceLevel:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v5 voiceGuidanceLevel];
    if ((unint64_t)(v8 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v8);
      int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v9 = off_1E60F77A8[v8 + 1];
    }
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", buf, 0x16u);
  }
  uint64_t v10 = [(MNNavigationService *)self navigationObservers];
  objc_msgSend(v10, "navigationService:didChangeVoiceGuidanceLevel:", self, objc_msgSend(v5, "voiceGuidanceLevel"));
}

- (void)_navigationServiceCallback_DidEndNavigation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 reason];
    if ((unint64_t)(v8 - 1) > 9) {
      int v9 = @"Unknown";
    }
    else {
      int v9 = off_1E60F77C8[v8 - 1];
    }
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(MNNavigationService *)self navigationObservers];
  objc_msgSend(v10, "navigationService:didEndWithReason:", self, objc_msgSend(v5, "reason"));
}

- (void)_navigationServiceCallback_DidReceiveRoutingServiceError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 error];
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "(%{public}@) %@", (uint8_t *)&v11, 0x16u);
  }
  int v9 = [(MNNavigationService *)self navigationObservers];
  uint64_t v10 = [v5 error];
  [v9 navigationService:self didReceiveRoutingServiceError:v10];
}

- (void)_navigationServiceCallback_DidUpdateArrivalInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 arrivalInfo];
    int v13 = 138543618;
    __int16 v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v13, 0x16u);
  }
  int v9 = [v5 arrivalInfo];
  uint64_t v10 = [(MNNavigationService *)self details];
  [v10 setArrivalInfo:v9];

  int v11 = [(MNNavigationService *)self navigationObservers];
  id v12 = [v5 arrivalInfo];
  [v11 navigationService:self didUpdateArrivalInfo:v12];
}

- (void)_navigationServiceCallback_DidUpdateBackgroundWalkingRoute:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v18 = [v5 routeInfo];
    uint64_t v8 = [v18 route];
    int v9 = [v8 name];
    uint64_t v10 = [v5 routeInfo];
    int v11 = [v10 routeID];
    id v12 = [v5 routeInfo];
    int v13 = [v12 displayETAInfo];
    *(_DWORD *)buf = 138544130;
    double v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    double v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ | %@ | %@", buf, 0x2Au);
  }
  __int16 v14 = [v5 routeInfo];
  __int16 v15 = [(MNNavigationService *)self details];
  [v15 setBackgroundWalkingRouteInfo:v14];

  uint64_t v16 = [(MNNavigationService *)self navigationObservers];
  uint64_t v17 = [(MNNavigationService *)self alternateWalkingRoute];
  [v16 navigationService:self didUpdateAlternateWalkingRoute:v17];
}

- (void)_navigationServiceCallback_DidUpdateDisplayETA:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 displayETAInfo];
  id v7 = [v5 routeDistanceInfo];
  uint64_t v8 = [v5 batteryChargeInfo];

  int v9 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    int v11 = [v6 routeID];
    int v21 = 138544130;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    double v24 = (const char *)v6;
    __int16 v25 = 2112;
    *(void *)uint64_t v26 = v7;
    *(_WORD *)&v26[8] = 2112;
    *(void *)&v26[10] = v11;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_INFO, "(%{public}@)%@ | %@ | %@", (uint8_t *)&v21, 0x2Au);
  }
  id v12 = [(MNNavigationService *)self details];
  int v13 = [v6 routeID];
  __int16 v14 = [v12 routeInfoForID:v13];

  if (v14)
  {
    [v14 setDisplayETAInfo:v6];
    [v14 setRemainingDistanceInfo:v7];
    [v14 setBatteryChargeInfo:v8];
    __int16 v15 = [(MNNavigationService *)self navigationObservers];
    [v15 navigationService:self didUpdateDisplayETA:v6 remainingDistance:v7 batteryChargeInfo:v8];
  }
  else
  {
    uint64_t v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315906;
      uint64_t v22 = "-[MNNavigationService(CallbackHandling) _navigationServiceCallback_DidUpdateDisplayETA:]";
      __int16 v23 = 2080;
      double v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Navigation Service Internal/MNNavigationService+CallbackHandling.m";
      __int16 v25 = 1024;
      *(_DWORD *)uint64_t v26 = 73;
      *(_WORD *)&v26[4] = 2080;
      *(void *)&v26[6] = "existingRouteInfo != nil";
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v21, 0x26u);
    }

    __int16 v15 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [0 description];
      int v18 = [(MNNavigationService *)self details];
      double v19 = [v18 routeLookupIDs];
      double v20 = [v19 componentsJoinedByString:@", "];
      int v21 = 138412546;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      double v24 = v20;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "Error finding route: %@ | Known route IDs: (%@)", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)_navigationServiceCallback_DidUpdateMatchedLocation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 location];
  id v6 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 uuid];
    int v18 = 138412546;
    double v19 = v7;
    __int16 v20 = 2080;
    int v21 = "-[MNNavigationService(CallbackHandling) _navigationServiceCallback_DidUpdateMatchedLocation:]";
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in %s", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v8 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = NSStringFromSelector(a2);
    [v5 coordinate];
    int v11 = v10;
    [v5 coordinate];
    uint64_t v13 = v12;
    [v5 course];
    int v15 = (int)v14;
    uint64_t v16 = [v5 routeID];
    int v18 = 138413314;
    double v19 = v9;
    __int16 v20 = 2048;
    int v21 = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    __int16 v24 = 1024;
    int v25 = v15;
    __int16 v26 = 2112;
    uint64_t v27 = v16;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "(%@) %0.6f, %0.6f | %d | route ID: %@", (uint8_t *)&v18, 0x30u);
  }
  uint64_t v17 = [(MNNavigationService *)self navigationObservers];
  [v17 navigationService:self didUpdateMatchedLocation:v5];
}

- (void)_navigationServiceCallback_DidUpdateNavTrayGuidance:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 navTrayGuidanceEvent];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    double v14 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);
  }
  int v9 = [(MNNavigationService *)self navigationObservers];
  uint64_t v10 = [v5 navTrayGuidanceEvent];
  [v9 navigationService:self didUpdateNavTrayGuidance:v10];
}

- (void)_navigationServiceCallback_DidUpdateResumeRouteHandle:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 resumeRouteHandle];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    double v14 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);
  }
  int v9 = [(MNNavigationService *)self navigationObservers];
  uint64_t v10 = [v5 resumeRouteHandle];
  [v9 navigationService:self didUpdateResumeRouteHandle:v10];
}

- (void)_navigationServiceCallback_DidUpdateStepIndex:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 stepIndex];
  uint64_t v7 = [v5 segmentIndex];

  uint64_t v8 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    int v11 = 138543874;
    uint64_t v12 = v9;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = v7;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d, %d", (uint8_t *)&v11, 0x18u);
  }
  uint64_t v10 = [(MNNavigationService *)self navigationObservers];
  [v10 navigationService:self didUpdateStepIndex:v6 segmentIndex:v7];
}

- (void)_navigationServiceCallback_DidUpdateTargetLegIndex:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = [v5 targetLegIndex];
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = [(MNNavigationService *)self navigationObservers];
  objc_msgSend(v8, "navigationService:didUpdateTargetLegIndex:", self, objc_msgSend(v5, "targetLegIndex"));
}

- (void)_navigationServiceCallback_DidUpdateUpcomingAnchorPointIndex:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = [v5 anchorPointIndex];
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = [(MNNavigationService *)self navigationObservers];
  objc_msgSend(v8, "navigationService:didUpdateUpcomingAnchorPointIndex:", self, objc_msgSend(v5, "anchorPointIndex"));
}

- (void)_navigationServiceCallback_DidUpdateVehicleParkingInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 vehicleParkingInfo];
    int v13 = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    int v16 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v13, 0x16u);
  }
  int v9 = [v5 vehicleParkingInfo];
  uint64_t v10 = [(MNNavigationService *)self details];
  [v10 setVehicleParkingInfo:v9];

  __int16 v11 = [(MNNavigationService *)self navigationObservers];
  int v12 = [v5 vehicleParkingInfo];
  [v11 navigationService:self didUpdateVehicleParkingInfo:v12];
}

- (void)_navigationServiceCallback_ShouldEnableIdleTimer:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = [v5 shouldEnable];
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = [(MNNavigationService *)self navigationObservers];
  objc_msgSend(v8, "navigationService:shouldEnableIdleTimer:", self, objc_msgSend(v5, "shouldEnable"));
}

- (void)_navigationServiceCallback_WillEndNavigation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 reason];
    if ((unint64_t)(v8 - 1) > 9) {
      int v9 = @"Unknown";
    }
    else {
      int v9 = off_1E60F77C8[v8 - 1];
    }
    int v11 = 138543618;
    int v12 = v7;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(MNNavigationService *)self navigationObservers];
  objc_msgSend(v10, "navigationService:willEndWithReason:", self, objc_msgSend(v5, "reason"));
}

- (void)_navigationServiceCallback_WillStartNavigation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    double v19 = [v5 routeInfo];
    int v18 = [v19 route];
    uint64_t v7 = [v18 transportType];
    if (v7 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E60F7818[(int)v7];
    }
    uint64_t v17 = v8;
    int v9 = [(__CFString *)v8 capitalizedString];
    unint64_t v10 = [v5 navigationType] - 1;
    if (v10 > 3) {
      int v11 = @"None";
    }
    else {
      int v11 = off_1E60F7850[v10];
    }
    int v12 = [v5 routeInfo];
    __int16 v13 = [v12 routeID];
    int v14 = [(MNNavigationService *)self details];
    uint64_t v15 = [v14 routeLookupIDs];
    int v16 = [v15 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138544386;
    id v22 = v20;
    __int16 v23 = 2112;
    __int16 v24 = v9;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v13;
    __int16 v29 = 2112;
    uint64_t v30 = v16;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ %@ | %@\nKnown route IDs: (%@)", buf, 0x34u);
  }
}

- (void)_updateWithCallback:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MNNavigationService *)self details];
  [v5 updateWithNavigationServiceCallbackParameters:v4];

  switch([v4 type])
  {
    case 0:
      uint64_t v6 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_FAULT, "MNNavigationService received \"Unknown\" type callback.", (uint8_t *)&v9, 2u);
      }

      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315650;
        unint64_t v10 = "-[MNNavigationService(CallbackHandling) _updateWithCallback:]";
        __int16 v11 = 2080;
        int v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Navigation Service Internal/MNNavigationService+CallbackHandling.m";
        __int16 v13 = 1024;
        int v14 = 200;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v9, 0x1Cu);
      }
      goto LABEL_70;
    case 1:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidChangeVoiceGuidanceLevel:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 2:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidEndNavigation:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 3:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidReceiveRoutingServiceError:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 4:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateArrivalInfo:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 5:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateBackgroundWalkingRoute:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 6:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateDisplayETA:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 7:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateMatchedLocation:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 8:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateNavTrayGuidance:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 9:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateResumeRouteHandle:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 10:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateStepIndex:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 11:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateTargetLegIndex:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 12:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateUpcomingAnchorPointIndex:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 13:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_DidUpdateVehicleParkingInfo:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 14:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_ShouldEnableIdleTimer:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 15:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_WillStartNavigation:v4];
        goto LABEL_71;
      }
      uint64_t v7 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_69;
      }
      goto LABEL_70;
    case 16:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MNNavigationService *)self _navigationServiceCallback_WillEndNavigation:v4];
      }
      else
      {
        uint64_t v7 = MNGetMNNavigationServiceLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
LABEL_69:
          MNNavigationServiceCallbackTypeAsString([v4 type]);
          uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
          int v9 = 138412546;
          unint64_t v10 = v8;
          __int16 v11 = 2112;
          int v12 = (const char *)objc_opt_class();
          _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_FAULT, "Callback parameters of type '%@' was received, but was not the expected subclass. Received '%@' instead.", (uint8_t *)&v9, 0x16u);
        }
LABEL_70:
      }
LABEL_71:

      return;
    default:
      goto LABEL_71;
  }
}

@end