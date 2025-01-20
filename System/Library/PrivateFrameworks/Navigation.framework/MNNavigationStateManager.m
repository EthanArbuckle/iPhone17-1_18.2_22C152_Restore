@interface MNNavigationStateManager
+ (id)sharedManager;
- (BOOL)isStarted;
- (GEOApplicationAuditToken)auditToken;
- (MNNavigationSessionManagerDelegate)navigationDelegate;
- (MNNavigationState)currentState;
- (MNNavigationStateManager)init;
- (id)_initialState;
- (id)navSessionDestination;
- (unint64_t)_stateTypeForState:(id)a3;
- (unint64_t)currentStateType;
- (void)_changeToDesiredLocationProviderTypeForState:(id)a3;
- (void)_replayStateForNewObserver:(id)a3;
- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4;
- (void)advanceToNextLeg;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)changeUserOptions:(id)a3;
- (void)dealloc;
- (void)disableNavigationCapability:(unint64_t)a3;
- (void)enableNavigationCapability:(unint64_t)a3;
- (void)forceReroute;
- (void)insertWaypoint:(id)a3;
- (void)pauseRealtimeUpdatesForSubscriber:(id)a3;
- (void)recordPedestrianTracePath:(id)a3;
- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3;
- (void)repeatCurrentGuidanceWithReply:(id)a3;
- (void)repeatCurrentTrafficAlertWithReply:(id)a3;
- (void)rerouteWithWaypoints:(id)a3;
- (void)reset;
- (void)resumeOriginalDestination;
- (void)resumeRealtimeUpdatesForSubscriber:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setGuidanceType:(unint64_t)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsDisplayingNavigationTray:(BOOL)a3;
- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4;
- (void)setNavigationDelegate:(id)a3;
- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4;
- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)setSimulationPosition:(double)a3;
- (void)setSimulationSpeedMultiplier:(double)a3;
- (void)setSimulationSpeedOverride:(double)a3;
- (void)setTraceIsPlaying:(BOOL)a3;
- (void)setTracePlaybackSpeed:(double)a3;
- (void)setTracePosition:(double)a3;
- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3;
- (void)start;
- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4;
- (void)stopCurrentGuidancePrompt;
- (void)stopNavigationWithReason:(unint64_t)a3;
- (void)switchToDestinationRoute;
- (void)switchToRoute:(id)a3;
- (void)transitionToState:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateDestination:(id)a3;
- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4;
@end

@implementation MNNavigationStateManager

+ (id)sharedManager
{
  if (qword_1EB59C310 != -1) {
    dispatch_once(&qword_1EB59C310, &__block_literal_global_52);
  }
  v2 = (void *)_MergedGlobals_51;
  return v2;
}

- (void)changeUserOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 changeUserOptions:v4];
}

- (unint64_t)currentStateType
{
  v2 = [(MNNavigationStateManager *)self currentState];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 type];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (MNNavigationState)currentState
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__17;
  id v9 = 0;
  geo_isolate_sync_data();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MNNavigationState *)v2;
}

void __40__MNNavigationStateManager_currentState__block_invoke(uint64_t a1)
{
}

uint64_t __41__MNNavigationStateManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(MNNavigationStateManager);
  uint64_t v1 = _MergedGlobals_51;
  _MergedGlobals_51 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MNNavigationStateManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationStateManager;
  id v2 = [(MNNavigationStateManager *)&v12 init];
  if (v2)
  {
    v3 = +[MNLocationManager sharedLocationManager];
    [v3 setEffectiveBundleIdentifier:@"com.apple.Maps"];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F643F0]) initWithProxiedApplicationBundleId:@"com.apple.Maps"];
    id v5 = [v4 overrideTokenWithOfflineCohortId:@"com.apple.Maps"];

    auditToken = v2->_auditToken;
    v2->_auditToken = v5;
    v7 = v5;

    uint64_t v8 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[MNLocationManager sharedLocationManager];
  [v3 stop];
  [v3 removeLocationAccessForAll];

  v4.receiver = self;
  v4.super_class = (Class)MNNavigationStateManager;
  [(MNNavigationStateManager *)&v4 dealloc];
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_isStarted)
  {
    objc_super v4 = [NSString stringWithFormat:@"Start should only be called once."];
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v7 = "-[MNNavigationStateManager start]";
      __int16 v8 = 2080;
      id v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationStateManager.m";
      __int16 v10 = 1024;
      int v11 = 83;
      __int16 v12 = 2080;
      v13 = "!_isStarted";
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  v3 = [(MNNavigationStateManager *)self _initialState];
  [(MNNavigationStateManager *)self transitionToState:v3];

  geo_isolate_sync();
}

uint64_t __33__MNNavigationStateManager_start__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

- (void)reset
{
  id v3 = [(MNNavigationStateManager *)self _initialState];
  [(MNNavigationStateManager *)self transitionToState:v3];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_navigationStateObservers)
  {
    id v5 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E3ECE8];
    navigationStateObservers = self->_navigationStateObservers;
    self->_navigationStateObservers = v5;

    id v4 = v7;
  }
  [(MNNavigationStateManager *)self _replayStateForNewObserver:v4];
  [(MNObserverHashTable *)self->_navigationStateObservers registerObserver:v7];
}

- (void)unregisterObserver:(id)a3
{
}

- (BOOL)isStarted
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync_data();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __37__MNNavigationStateManager_isStarted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_replayStateForNewObserver:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MNNavigationStateManager *)self currentState];
  uint64_t v5 = [v4 type];

  if (objc_opt_respondsToSelector()) {
    [v6 stateManager:self willChangeFromState:0 toState:v5];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 stateManager:self didChangeFromState:0 toState:v5];
  }
}

- (id)_initialState
{
  char v2 = [[MNNavigationStateNoDestination alloc] initWithStateManager:self];
  return v2;
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6 = a3;
  char v7 = MNGetMNNavigationStateManagerLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  __int16 v10 = v9;
  if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v13 = [(MNNavigationStateManager *)self currentState];
    [v13 setRoutesForPreview:v6 selectedRouteIndex:a4];

    __int16 v14 = v10;
  }
  else
  {
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SetRoutesForPreview", "", buf, 2u);
    }

    int v11 = [(MNNavigationStateManager *)self currentState];
    [v11 setRoutesForPreview:v6 selectedRouteIndex:a4];

    __int16 v12 = v10;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v12, OS_SIGNPOST_INTERVAL_END, v8, "SetRoutesForPreview", "", v15, 2u);
    }
  }
}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MNNavigationStateManager *)self currentState];
  [v8 startNavigationWithDetails:v7 activeBlock:v6];
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  uint64_t v5 = MNGetMNNavigationStateManagerLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  id v8 = v7;
  if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    int v11 = [(MNNavigationStateManager *)self currentState];
    [v11 stopNavigationWithReason:a3];

    __int16 v12 = v8;
  }
  else
  {
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StopNavigation", "", buf, 2u);
    }

    id v9 = [(MNNavigationStateManager *)self currentState];
    [v9 stopNavigationWithReason:a3];

    __int16 v10 = v8;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_END, v6, "StopNavigation", "", v13, 2u);
    }
  }
}

- (void)rerouteWithWaypoints:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 rerouteWithWaypoints:v4];
}

- (void)insertWaypoint:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 insertWaypoint:v4];
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 removeWaypointAtIndex:a3];
}

- (void)advanceToNextLeg
{
  id v2 = [(MNNavigationStateManager *)self currentState];
  [v2 advanceToNextLeg];
}

- (void)updateDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 updateDestination:v4];
}

- (void)resumeOriginalDestination
{
  id v2 = [(MNNavigationStateManager *)self currentState];
  [v2 resumeOriginalDestination];
}

- (void)forceReroute
{
  id v2 = [(MNNavigationStateManager *)self currentState];
  [v2 forceReroute];
}

- (void)switchToRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 switchToRoute:v4];
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(MNNavigationStateManager *)self currentState];
  [v7 changeTransportType:v4 route:v6];
}

- (void)switchToDestinationRoute
{
  id v2 = [(MNNavigationStateManager *)self currentState];
  [v2 switchToDestinationRoute];
}

- (void)setGuidanceType:(unint64_t)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setGuidanceType:a3];
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setVoiceGuidanceLevelOverride:a3];
}

- (void)repeatCurrentGuidanceWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 repeatCurrentGuidanceWithReply:v4];
}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 repeatCurrentTrafficAlertWithReply:v4];
}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = [(MNNavigationStateManager *)self currentState];
  [v7 vibrateForPrompt:a3 withReply:v6];
}

- (void)stopCurrentGuidancePrompt
{
  id v2 = [(MNNavigationStateManager *)self currentState];
  [v2 stopCurrentGuidancePrompt];
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setGuidancePromptsEnabled:v3];
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setIsDisplayingNavigationTray:v3];
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setIsConnectedToCarplay:v3];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setDisplayedStepIndex:a3];
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  id v6 = [(MNNavigationStateManager *)self currentState];
  [v6 setRideIndex:a3 forSegmentIndex:a4];
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  id v6 = [(MNNavigationStateManager *)self currentState];
  [v6 setJunctionViewImageWidth:a3 height:a4];
}

- (void)disableNavigationCapability:(unint64_t)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 disableNavigationCapability:a3];
}

- (void)enableNavigationCapability:(unint64_t)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 enableNavigationCapability:a3];
}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MNNavigationStateManager *)self currentState];
  [v7 acceptReroute:v4 forTrafficIncidentAlert:v6];
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setTraceIsPlaying:v3];
}

- (void)setTracePlaybackSpeed:(double)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setTracePlaybackSpeed:a3];
}

- (void)setTracePosition:(double)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setTracePosition:a3];
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 recordTraceBookmarkAtCurrentPositionWthScreenshotData:v4];
}

- (void)recordPedestrianTracePath:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 recordPedestrianTracePath:v4];
}

- (void)setSimulationSpeedOverride:(double)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setSimulationSpeedOverride:a3];
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setSimulationSpeedMultiplier:a3];
}

- (void)setSimulationPosition:(double)a3
{
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 setSimulationPosition:a3];
}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 pauseRealtimeUpdatesForSubscriber:v4];
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  id v4 = a3;
  id v5 = [(MNNavigationStateManager *)self currentState];
  [v5 resumeRealtimeUpdatesForSubscriber:v4];
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(MNNavigationStateManager *)self currentState];
  [v4 changeOfflineMode:v3];
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (MNNavigationSessionManagerDelegate)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  return (MNNavigationSessionManagerDelegate *)WeakRetained;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_navigationStateObservers, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (id)navSessionDestination
{
  id v2 = [(MNNavigationStateManager *)self currentState];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 currentDestination];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)transitionToState:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"MNNavigationStateManager transitionToState: should be called on the main queue"];
    v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "[NSThread isMainThread]";
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  id v5 = [(MNNavigationStateManager *)self currentState];
  unint64_t v6 = [(MNNavigationStateManager *)self _stateTypeForState:v5];
  unint64_t v7 = [(MNNavigationStateManager *)self _stateTypeForState:v4];
  id v8 = MNGetMNNavigationStateManagerLog();
  if (os_signpost_enabled(v8))
  {
    if (v6 > 6) {
      id v9 = @"MNNavigationStateTypeInvalid";
    }
    else {
      id v9 = off_1E60FBDA0[v6];
    }
    if (v7 > 6) {
      __int16 v10 = @"MNNavigationStateTypeInvalid";
    }
    else {
      __int16 v10 = off_1E60FBDA0[v7];
    }
    *(_DWORD *)buf = 138543618;
    v24 = (const char *)v9;
    __int16 v25 = 2114;
    v26 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TransitionToState", "%{public}@ to %{public}@", buf, 0x16u);
  }
  [v4 preEnterState];
  [(MNObserverHashTable *)self->_navigationStateObservers stateManager:self willChangeFromState:v6 toState:v7];
  [v5 leaveState];
  if ([v4 requiresLocationAccess])
  {
    int v11 = +[MNLocationManager sharedLocationManager];
    [v11 requestLocationAccessFor:v4];
  }
  [(MNNavigationStateManager *)self _changeToDesiredLocationProviderTypeForState:v4];
  __int16 v12 = +[MNLocationManager sharedLocationManager];
  [v12 removeLocationAccessFor:v5];

  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v13 = v4;
  geo_isolate_sync();
  objc_msgSend(v13, "enterState", v22, 3221225472, __66__MNNavigationStateManager_StateTransitioning__transitionToState___block_invoke, &unk_1E60F6668, self);
  if (os_signpost_enabled(v8))
  {
    if (v6 > 6) {
      __int16 v14 = @"MNNavigationStateTypeInvalid";
    }
    else {
      __int16 v14 = off_1E60FBDA0[v6];
    }
    if (v7 > 6) {
      v15 = @"MNNavigationStateTypeInvalid";
    }
    else {
      v15 = off_1E60FBDA0[v7];
    }
    *(_DWORD *)buf = 138543618;
    v24 = (const char *)v14;
    __int16 v25 = 2114;
    v26 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TransitionToState", "%{public}@ to %{public}@", buf, 0x16u);
  }
  uint64_t v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 > 6) {
      v17 = @"MNNavigationStateTypeInvalid";
    }
    else {
      v17 = off_1E60FBDA0[v6];
    }
    if (v7 > 6) {
      v18 = @"MNNavigationStateTypeInvalid";
    }
    else {
      v18 = off_1E60FBDA0[v7];
    }
    *(_DWORD *)buf = 138412546;
    v24 = (const char *)v17;
    __int16 v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Changed from state %@ to %@", buf, 0x16u);
  }

  if ([v13 shouldClearStoredRoutes])
  {
    v19 = MNRecommendedDateForClearingRoutes();
    MNClearStoredRoutesWithSubpathUsedBefore(v19, 0);
  }
  [(MNObserverHashTable *)self->_navigationStateObservers stateManager:self didChangeFromState:v6 toState:v7];
  [v13 postEnterState];
}

void __66__MNNavigationStateManager_StateTransitioning__transitionToState___block_invoke(uint64_t a1)
{
}

- (void)_changeToDesiredLocationProviderTypeForState:(id)a3
{
  id v6 = a3;
  uint64_t v3 = +[MNLocationManager sharedLocationManager];
  if (v6) {
    uint64_t v4 = [v6 desiredLocationProviderType];
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 locationProviderType];
  switch(v4)
  {
    case 0:
      [v3 stop];
      break;
    case 1:
      id v5 = [v6 clParameters];
      [v3 useGPSLocationProviderWithCLParameters:v5];
      goto LABEL_10;
    case 2:
      [v3 useHybridLocationProvider];
      break;
    case 3:
      id v5 = [v6 traceManager];
      [v3 useTraceLocationProvider:v5];
      goto LABEL_10;
    case 4:
      id v5 = [v6 simulationLocationProvider];
      [v3 useSimulationLocationProvider:v5];
LABEL_10:

      break;
    default:
      break;
  }
}

- (unint64_t)_stateTypeForState:(id)a3
{
  if (a3) {
    return [a3 type];
  }
  else {
    return 0;
  }
}

- (void)setCurrentState:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __53__MNNavigationStateManager_Testing__setCurrentState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  if (v2 != *(void **)(a1 + 40))
  {
    *(void *)(v1 + 16) = 0;

    id v4 = *(void **)(a1 + 40);
    id v5 = (id *)(*(void *)(a1 + 32) + 16);
    objc_storeStrong(v5, v4);
  }
}

@end