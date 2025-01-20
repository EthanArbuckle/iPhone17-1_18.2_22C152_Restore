@interface MNNavigationStateGuidance
+ (id)guidanceStateForStartDetails:(id)a3 stateManager:(id)a4 navigationSessionManager:(id)a5;
- (BOOL)requiresHighMemoryThreshold;
- (BOOL)shouldClearStoredRoutes;
- (MNNavigationStateGuidance)initWithStateManager:(id)a3 navigationSessionManager:(id)a4 startDetails:(id)a5;
- (id)clParameters;
- (id)currentDestination;
- (id)simulationLocationProvider;
- (id)traceManager;
- (unint64_t)desiredLocationProviderType;
- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4;
- (void)advanceToNextLeg;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)disableNavigationCapability:(unint64_t)a3;
- (void)enableNavigationCapability:(unint64_t)a3;
- (void)enterState;
- (void)forceReroute;
- (void)insertWaypoint:(id)a3;
- (void)leaveState;
- (void)pauseRealtimeUpdatesForSubscriber:(id)a3;
- (void)postEnterState;
- (void)preEnterState;
- (void)recordPedestrianTracePath:(id)a3;
- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3;
- (void)repeatCurrentGuidanceWithReply:(id)a3;
- (void)repeatCurrentTrafficAlertWithReply:(id)a3;
- (void)rerouteWithWaypoints:(id)a3;
- (void)resumeOriginalDestination;
- (void)resumeRealtimeUpdatesForSubscriber:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsDisplayingNavigationTray:(BOOL)a3;
- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4;
- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4;
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
- (void)updateDestination:(id)a3;
- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4;
@end

@implementation MNNavigationStateGuidance

+ (id)guidanceStateForStartDetails:(id)a3 stateManager:(id)a4 navigationSessionManager:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 navigationType];
  switch(v10)
  {
    case 4:
      goto LABEL_4;
    case 3:
      if ([v7 guidanceType] == 2)
      {
        v11 = MNNavigationStateRoutePreviewGuidance;
      }
      else if ([v7 guidanceType] == 1)
      {
        v11 = MNNavigationStateLowGuidance;
      }
      else
      {
        v11 = MNNavigationStateGuidanceTurnByTurn;
      }
      goto LABEL_13;
    case 2:
LABEL_4:
      v11 = MNNavigationStateGuidanceStepping;
LABEL_13:
      v14 = (void *)[[v11 alloc] initWithStateManager:v8 navigationSessionManager:v9 startDetails:v7];
      goto LABEL_14;
  }
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid navigationType: %d", v10);
  v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "+[MNNavigationStateGuidance guidanceStateForStartDetails:stateManager:navigationSessionManager:]";
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationStateGuidance.m";
    __int16 v20 = 1024;
    int v21 = 63;
    __int16 v22 = 2080;
    v23 = "NO";
    __int16 v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }

  v14 = 0;
LABEL_14:

  return v14;
}

- (id)currentDestination
{
  v2 = [(MNNavigationSessionManager *)self->_navigationSessionManager navigationSession];
  v3 = [v2 destination];

  return v3;
}

- (BOOL)requiresHighMemoryThreshold
{
  return 1;
}

- (unint64_t)desiredLocationProviderType
{
  v3 = [(MNNavigationStateGuidance *)self traceManager];
  v4 = [v3 tracePlayer];

  if (v4) {
    return 3;
  }
  v6 = [(MNNavigationSessionManager *)self->_navigationSessionManager simulationLocationProvider];

  if (v6) {
    return 4;
  }
  else {
    return 1;
  }
}

- (id)clParameters
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MNLocationProviderCLParameters);
  v4 = [(MNStartNavigationDetails *)self->_startDetails requestingAppIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.Maps"];

  if (v5) {
    [(MNLocationProviderCLParameters *)v3 setFusionInfoEnabled:1];
  }
  if ([(MNStartNavigationDetails *)self->_startDetails navigationType] != 3) {
    goto LABEL_6;
  }
  v6 = [(MNStartNavigationDetails *)self->_startDetails routeAttributes];
  unsigned int v7 = [v6 mainTransportType];

  if (v7 > 6) {
    goto LABEL_8;
  }
  if (((1 << v7) & 0x6E) != 0)
  {
LABEL_6:
    id v8 = v3;
    uint64_t v9 = 4;
LABEL_7:
    [(MNLocationProviderCLParameters *)v8 setActivityType:v9];
    goto LABEL_8;
  }
  if (!v7)
  {
    id v8 = v3;
    uint64_t v9 = 2;
    goto LABEL_7;
  }
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315650;
    v13 = "-[MNNavigationStateGuidance clParameters]";
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationStateGuidance.m";
    __int16 v16 = 1024;
    int v17 = 115;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v12, 0x1Cu);
  }

LABEL_8:
  return v3;
}

- (BOOL)shouldClearStoredRoutes
{
  return 0;
}

- (id)traceManager
{
  return [(MNNavigationSessionManager *)self->_navigationSessionManager traceManager];
}

- (id)simulationLocationProvider
{
  return [(MNNavigationSessionManager *)self->_navigationSessionManager simulationLocationProvider];
}

- (MNNavigationStateGuidance)initWithStateManager:(id)a3 navigationSessionManager:(id)a4 startDetails:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationStateGuidance;
  v11 = [(MNNavigationState *)&v14 initWithStateManager:a3];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_navigationSessionManager, a4);
    objc_storeStrong((id *)&v12->_startDetails, a5);
  }

  return v12;
}

- (void)enterState
{
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationStateGuidance;
  [(MNNavigationState *)&v5 enterState];
  v3 = [(MNNavigationState *)self stateManager];
  v4 = [v3 navigationDelegate];
  [(MNNavigationSessionManager *)self->_navigationSessionManager setDelegate:v4];

  if (self->_startDetails) {
    -[MNNavigationSessionManager startNavigationWithDetails:](self->_navigationSessionManager, "startNavigationWithDetails:");
  }
}

- (void)leaveState
{
  v4.receiver = self;
  v4.super_class = (Class)MNNavigationStateGuidance;
  [(MNNavigationState *)&v4 leaveState];
  [(MNNavigationSessionManager *)self->_navigationSessionManager setDelegate:0];
  navigationSessionManager = self->_navigationSessionManager;
  self->_navigationSessionManager = 0;
}

- (void)preEnterState
{
  if (!self->_navigationSessionManager)
  {
    v3 = [MNNavigationSessionManager alloc];
    objc_super v4 = [(MNNavigationState *)self stateManager];
    objc_super v5 = [v4 auditToken];
    v6 = [(MNNavigationSessionManager *)v3 initWithAuditToken:v5];
    navigationSessionManager = self->_navigationSessionManager;
    self->_navigationSessionManager = v6;
  }
  id v8 = [(MNNavigationState *)self stateManager];
  id v9 = [v8 navigationDelegate];
  [(MNNavigationSessionManager *)self->_navigationSessionManager setDelegate:v9];

  if (self->_startDetails)
  {
    id v10 = self->_navigationSessionManager;
    -[MNNavigationSessionManager updateForStartNavigation:](v10, "updateForStartNavigation:");
  }
}

- (void)postEnterState
{
  navigationSessionManager = self->_navigationSessionManager;
  id v3 = [(MNStartNavigationDetails *)self->_startDetails initialUserLocation];
  [(MNNavigationSessionManager *)navigationSessionManager updateWithInitialLocation:v3];
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  [(MNNavigationSessionManager *)self->_navigationSessionManager stopNavigationWithReason:a3];
  objc_super v4 = [MNNavigationStateNoDestination alloc];
  objc_super v5 = [(MNNavigationState *)self stateManager];
  unsigned int v7 = [(MNNavigationState *)v4 initWithStateManager:v5];

  v6 = [(MNNavigationState *)self stateManager];
  [v6 transitionToState:v7];
}

- (void)rerouteWithWaypoints:(id)a3
{
}

- (void)insertWaypoint:(id)a3
{
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
}

- (void)advanceToNextLeg
{
}

- (void)updateDestination:(id)a3
{
}

- (void)resumeOriginalDestination
{
}

- (void)forceReroute
{
}

- (void)switchToRoute:(id)a3
{
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
}

- (void)switchToDestinationRoute
{
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
}

- (void)repeatCurrentGuidanceWithReply:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MNNavigationSessionManager *)self->_navigationSessionManager repeatCurrentGuidance];
  objc_super v5 = v6;
  if (v6)
  {
    (*((void (**)(id, BOOL))v6 + 2))(v6, v4);
    objc_super v5 = v6;
  }
}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MNNavigationSessionManager *)self->_navigationSessionManager repeatCurrentTrafficAlert];
  objc_super v5 = v6;
  if (v6)
  {
    (*((void (**)(id, BOOL))v6 + 2))(v6, v4);
    objc_super v5 = v6;
  }
}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  id v8 = a4;
  BOOL v6 = [(MNNavigationSessionManager *)self->_navigationSessionManager vibrateForPrompt:a3];
  unsigned int v7 = v8;
  if (v8)
  {
    (*((void (**)(id, BOOL))v8 + 2))(v8, v6);
    unsigned int v7 = v8;
  }
}

- (void)stopCurrentGuidancePrompt
{
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
}

- (void)disableNavigationCapability:(unint64_t)a3
{
}

- (void)enableNavigationCapability:(unint64_t)a3
{
}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
}

- (void)setTraceIsPlaying:(BOOL)a3
{
}

- (void)setTracePlaybackSpeed:(double)a3
{
}

- (void)setTracePosition:(double)a3
{
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
}

- (void)recordPedestrianTracePath:(id)a3
{
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

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDetails, 0);
  objc_storeStrong((id *)&self->_navigationSessionManager, 0);
}

@end