@interface MNNavigationServiceLocalProxy
- (MNNavigationServiceClientInterface)delegate;
- (MNNavigationServiceLocalProxy)init;
- (unint64_t)_serviceStateForStateType:(unint64_t)a3;
- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4;
- (void)advanceToNextLeg;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)changeUserOptions:(id)a3;
- (void)checkinForNavigationService:(id)a3;
- (void)dealloc;
- (void)disableNavigationCapability:(unint64_t)a3;
- (void)enableNavigationCapability:(unint64_t)a3;
- (void)forceReroute;
- (void)insertWaypoint:(id)a3;
- (void)interfaceHashesWithHandler:(id)a3;
- (void)navigationSessionManager:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6;
- (void)navigationSessionManager:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6;
- (void)navigationSessionManager:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationSessionManager:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationSessionManager:(id)a3 didDismissTrafficIncidentAlert:(id)a4;
- (void)navigationSessionManager:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationSessionManager:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationSessionManager:(id)a3 didFailRerouteWithError:(id)a4;
- (void)navigationSessionManager:(id)a3 didFailWithError:(id)a4;
- (void)navigationSessionManager:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4;
- (void)navigationSessionManager:(id)a3 didProcessSpeechEvent:(id)a4;
- (void)navigationSessionManager:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4;
- (void)navigationSessionManager:(id)a3 didReceiveTrafficIncidentAlert:(id)a4;
- (void)navigationSessionManager:(id)a3 didReceiveTransitAlert:(id)a4;
- (void)navigationSessionManager:(id)a3 didReceiveTransitUpdates:(id)a4;
- (void)navigationSessionManager:(id)a3 didRerouteWithRoute:(id)a4 location:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7;
- (void)navigationSessionManager:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationSessionManager:(id)a3 didSendNavigationServiceCallback:(id)a4;
- (void)navigationSessionManager:(id)a3 didStartSpeakingPrompt:(id)a4;
- (void)navigationSessionManager:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5;
- (void)navigationSessionManager:(id)a3 didUpdateAlternateRoutes:(id)a4;
- (void)navigationSessionManager:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationSessionManager:(id)a3 didUpdateETAResponseForRoute:(id)a4;
- (void)navigationSessionManager:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5;
- (void)navigationSessionManager:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5;
- (void)navigationSessionManager:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5;
- (void)navigationSessionManager:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4;
- (void)navigationSessionManager:(id)a3 didUpdateTracePlaybackDetails:(id)a4;
- (void)navigationSessionManager:(id)a3 didUpdateTrafficIncidentAlert:(id)a4;
- (void)navigationSessionManager:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationSessionManager:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10;
- (void)navigationSessionManager:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8;
- (void)navigationSessionManager:(id)a3 hideJunctionViewForId:(id)a4;
- (void)navigationSessionManager:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationSessionManager:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)navigationSessionManager:(id)a3 newGuidanceEventFeedback:(id)a4;
- (void)navigationSessionManager:(id)a3 proceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6;
- (void)navigationSessionManager:(id)a3 shouldEndWithReason:(unint64_t)a4;
- (void)navigationSessionManager:(id)a3 showJunctionView:(id)a4;
- (void)navigationSessionManager:(id)a3 showLaneDirections:(id)a4;
- (void)navigationSessionManager:(id)a3 triggerHaptics:(int)a4;
- (void)navigationSessionManager:(id)a3 updateSignsWithARInfo:(id)a4;
- (void)navigationSessionManager:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationSessionManager:(id)a3 updatedGuidanceEventFeedback:(id)a4;
- (void)navigationSessionManager:(id)a3 usePersistentDisplay:(BOOL)a4;
- (void)navigationSessionManager:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5;
- (void)navigationSessionManager:(id)a3 willProcessSpeechEvent:(id)a4;
- (void)navigationSessionManager:(id)a3 willSendTransitUpdateRequestForRouteIDs:(id)a4;
- (void)navigationSessionManagerBeginGuidanceUpdate:(id)a3;
- (void)navigationSessionManagerDidArrive:(id)a3;
- (void)navigationSessionManagerDidCancelReroute:(id)a3;
- (void)navigationSessionManagerDidEnterPreArrivalState:(id)a3;
- (void)navigationSessionManagerDidFinishLocationUpdate:(id)a3;
- (void)navigationSessionManagerEndGuidanceUpdate:(id)a3;
- (void)navigationSessionManagerHideSecondaryStep:(id)a3;
- (void)navigationSessionManagerWillPause:(id)a3;
- (void)navigationSessionManagerWillReroute:(id)a3;
- (void)navigationSessionManagerWillResumeFromPause:(id)a3;
- (void)pauseRealtimeUpdatesForSubscriber:(id)a3;
- (void)recordPedestrianTracePath:(id)a3;
- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3;
- (void)repeatCurrentGuidanceWithReply:(id)a3;
- (void)repeatCurrentTrafficAlertWithReply:(id)a3;
- (void)rerouteWithWaypoints:(id)a3;
- (void)reset;
- (void)resumeOriginalDestination;
- (void)resumeRealtimeUpdatesForSubscriber:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setGuidanceType:(unint64_t)a3;
- (void)setHeadingOrientation:(int)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsDisplayingNavigationTray:(BOOL)a3;
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
- (void)start;
- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4;
- (void)stateManager:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)stateManager:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)stopCurrentGuidancePrompt;
- (void)stopNavigationWithReason:(unint64_t)a3;
- (void)switchToDestinationRoute;
- (void)switchToRoute:(id)a3;
- (void)updateDestination:(id)a3;
- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4;
@end

@implementation MNNavigationServiceLocalProxy

void __51__MNNavigationServiceLocalProxy_changeUserOptions___block_invoke(uint64_t a1)
{
  v2 = +[MNNavigationStateManager sharedManager];
  [v2 changeUserOptions:*(void *)(a1 + 32)];

  id v3 = +[MNUserOptionsEngine sharedInstance];
  [v3 update:*(void *)(a1 + 32)];
}

- (void)changeUserOptions:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MNNavigationServiceLocalProxy_changeUserOptions___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

- (void)checkinForNavigationService:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void *))a3;
  int BOOL = GEOConfigGetBOOL();
  if (v3 && BOOL)
  {
    id v5 = +[MNFilePaths navTempDirectoryPath];
    [v5 UTF8String];
    id v6 = (void *)sandbox_extension_issue_file();

    v7 = MNGetMNNavigationServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Sandbox extension (%s) issued.", (uint8_t *)&v8, 0xCu);
    }

    v3[2](v3, v6);
    free(v6);
  }
}

- (MNNavigationServiceLocalProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNNavigationServiceLocalProxy;
  v2 = [(MNNavigationServiceLocalProxy *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_navigationServiceState = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  id v3 = +[MNNavigationStateManager sharedManager];
  [v3 unregisterObserver:self];
  id v4 = [v3 navigationDelegate];

  if (v4 == self) {
    [v3 setNavigationDelegate:0];
  }

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceLocalProxy;
  [(MNNavigationServiceLocalProxy *)&v5 dealloc];
}

- (void)start
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__MNNavigationServiceLocalProxy_start__block_invoke;
  v2[3] = &unk_1E60F6B98;
  v2[4] = self;
  MNRunAsynchronouslyOnMainThread(v2);
}

void __38__MNNavigationServiceLocalProxy_start__block_invoke(uint64_t a1)
{
  id v3 = +[MNLocationManager sharedLocationManager];
  [v3 setEffectiveBundleIdentifier:@"com.apple.Maps"];
  v2 = +[MNNavigationStateManager sharedManager];
  [v2 registerObserver:*(void *)(a1 + 32)];
  [v2 setNavigationDelegate:*(void *)(a1 + 32)];
  if (([v2 isStarted] & 1) == 0) {
    [v2 start];
  }
}

- (void)reset
{
  id v3 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy reset", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MNNavigationServiceLocalProxy_reset__block_invoke;
  v4[3] = &unk_1E60F6B98;
  v4[4] = self;
  MNRunAsynchronouslyOnMainThread(v4);
}

void __38__MNNavigationServiceLocalProxy_reset__block_invoke(uint64_t a1)
{
  v2 = +[MNNavigationStateManager sharedManager];
  [v2 reset];

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v5 = a3;
  objc_super v6 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy setRoutesForPreview", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MNNavigationServiceLocalProxy_setRoutesForPreview_selectedRouteIndex___block_invoke;
  v8[3] = &unk_1E60F6BC0;
  id v9 = v5;
  unint64_t v10 = a4;
  id v7 = v5;
  MNRunAsynchronouslyOnMainThread(v8);
}

void __72__MNNavigationServiceLocalProxy_setRoutesForPreview_selectedRouteIndex___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setRoutesForPreview:*(void *)(a1 + 32) selectedRouteIndex:*(void *)(a1 + 40)];
}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = [v6 navigationType];
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy startNavigationWithType: %u", buf, 8u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MNNavigationServiceLocalProxy_startNavigationWithDetails_activeBlock___block_invoke;
  v11[3] = &unk_1E60F6BE8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  MNRunAsynchronouslyOnMainThread(v11);
}

void __72__MNNavigationServiceLocalProxy_startNavigationWithDetails_activeBlock___block_invoke(void *a1)
{
  uint64_t v2 = MEMORY[0x1BA99B3A0](a1[6]);
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = +[MNNavigationStateManager sharedManager];
  [v5 startNavigationWithDetails:a1[5] activeBlock:0];
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 9) {
      id v6 = @"Unknown";
    }
    else {
      id v6 = off_1E60F6D48[a3 - 1];
    }
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy stopNavigationWithReason: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__MNNavigationServiceLocalProxy_stopNavigationWithReason___block_invoke;
  v7[3] = &unk_1E60F6BC0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __58__MNNavigationServiceLocalProxy_stopNavigationWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[MNNavigationStateManager sharedManager];
  [v2 stopNavigationWithReason:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
}

- (void)rerouteWithWaypoints:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MNNavigationServiceLocalProxy_rerouteWithWaypoints___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __54__MNNavigationServiceLocalProxy_rerouteWithWaypoints___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 rerouteWithWaypoints:*(void *)(a1 + 32)];
}

- (void)insertWaypoint:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MNNavigationServiceLocalProxy_insertWaypoint___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __48__MNNavigationServiceLocalProxy_insertWaypoint___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 insertWaypoint:*(void *)(a1 + 32)];
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_removeWaypointAtIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_removeWaypointAtIndex___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 removeWaypointAtIndex:*(void *)(a1 + 32)];
}

- (void)advanceToNextLeg
{
}

void __49__MNNavigationServiceLocalProxy_advanceToNextLeg__block_invoke()
{
  id v0 = +[MNNavigationStateManager sharedManager];
  [v0 advanceToNextLeg];
}

- (void)updateDestination:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MNNavigationServiceLocalProxy_updateDestination___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __51__MNNavigationServiceLocalProxy_updateDestination___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 updateDestination:*(void *)(a1 + 32)];
}

- (void)resumeOriginalDestination
{
}

void __58__MNNavigationServiceLocalProxy_resumeOriginalDestination__block_invoke()
{
  id v0 = +[MNNavigationStateManager sharedManager];
  [v0 resumeOriginalDestination];
}

- (void)forceReroute
{
}

void __45__MNNavigationServiceLocalProxy_forceReroute__block_invoke()
{
  id v0 = +[MNNavigationStateManager sharedManager];
  [v0 forceReroute];
}

- (void)switchToRoute:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MNNavigationServiceLocalProxy_switchToRoute___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __47__MNNavigationServiceLocalProxy_switchToRoute___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 switchToRoute:*(void *)(a1 + 32)];
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MNNavigationServiceLocalProxy_changeTransportType_route___block_invoke;
  v7[3] = &unk_1E60F6C30;
  int v9 = a3;
  id v8 = v5;
  id v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);
}

void __59__MNNavigationServiceLocalProxy_changeTransportType_route___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 changeTransportType:*(unsigned int *)(a1 + 40) route:*(void *)(a1 + 32)];
}

- (void)switchToDestinationRoute
{
}

void __57__MNNavigationServiceLocalProxy_switchToDestinationRoute__block_invoke()
{
  id v0 = +[MNNavigationStateManager sharedManager];
  [v0 switchToDestinationRoute];
}

- (void)setGuidanceType:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__MNNavigationServiceLocalProxy_setGuidanceType___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __49__MNNavigationServiceLocalProxy_setGuidanceType___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setGuidanceType:*(void *)(a1 + 32)];
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__MNNavigationServiceLocalProxy_setVoiceGuidanceLevelOverride___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __63__MNNavigationServiceLocalProxy_setVoiceGuidanceLevelOverride___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setVoiceGuidanceLevelOverride:*(void *)(a1 + 32)];
}

- (void)repeatCurrentGuidanceWithReply:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__MNNavigationServiceLocalProxy_repeatCurrentGuidanceWithReply___block_invoke;
  v5[3] = &unk_1E60F6C58;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __64__MNNavigationServiceLocalProxy_repeatCurrentGuidanceWithReply___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 repeatCurrentGuidanceWithReply:*(void *)(a1 + 32)];
}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MNNavigationServiceLocalProxy_repeatCurrentTrafficAlertWithReply___block_invoke;
  v5[3] = &unk_1E60F6C58;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __68__MNNavigationServiceLocalProxy_repeatCurrentTrafficAlertWithReply___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 repeatCurrentTrafficAlertWithReply:*(void *)(a1 + 32)];
}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MNNavigationServiceLocalProxy_vibrateForPrompt_withReply___block_invoke;
  v7[3] = &unk_1E60F6C80;
  id v8 = v5;
  unint64_t v9 = a3;
  id v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);
}

void __60__MNNavigationServiceLocalProxy_vibrateForPrompt_withReply___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 vibrateForPrompt:*(void *)(a1 + 40) withReply:*(void *)(a1 + 32)];
}

- (void)stopCurrentGuidancePrompt
{
}

void __58__MNNavigationServiceLocalProxy_stopCurrentGuidancePrompt__block_invoke()
{
  id v0 = +[MNNavigationStateManager sharedManager];
  [v0 stopCurrentGuidancePrompt];
}

- (void)setHeadingOrientation:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setHeadingOrientation___block_invoke;
  v3[3] = &__block_descriptor_36_e5_v8__0l;
  int v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setHeadingOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 32);
  id v2 = +[MNLocationManager sharedLocationManager];
  [v2 setHeadingOrientation:v1];
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__MNNavigationServiceLocalProxy_setGuidancePromptsEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __59__MNNavigationServiceLocalProxy_setGuidancePromptsEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 32);
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setGuidancePromptsEnabled:v1];
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__MNNavigationServiceLocalProxy_setIsDisplayingNavigationTray___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __63__MNNavigationServiceLocalProxy_setIsDisplayingNavigationTray___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setIsDisplayingNavigationTray:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__MNNavigationServiceLocalProxy_setIsConnectedToCarplay___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __57__MNNavigationServiceLocalProxy_setIsConnectedToCarplay___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setIsConnectedToCarplay:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setDisplayedStepIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setDisplayedStepIndex___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setDisplayedStepIndex:*(void *)(a1 + 32)];
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__MNNavigationServiceLocalProxy_setRideIndex_forSegmentIndex___block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a3;
  void v4[5] = a4;
  MNRunAsynchronouslyOnMainThread(v4);
}

void __62__MNNavigationServiceLocalProxy_setRideIndex_forSegmentIndex___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setRideIndex:*(void *)(a1 + 32) forSegmentIndex:*(void *)(a1 + 40)];
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MNNavigationServiceLocalProxy_setJunctionViewImageWidth_height___block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v4[4] = a3;
  *(double *)&void v4[5] = a4;
  MNRunAsynchronouslyOnMainThread(v4);
}

void __66__MNNavigationServiceLocalProxy_setJunctionViewImageWidth_height___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setJunctionViewImageWidth:*(double *)(a1 + 32) height:*(double *)(a1 + 40)];
}

- (void)disableNavigationCapability:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__MNNavigationServiceLocalProxy_disableNavigationCapability___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __61__MNNavigationServiceLocalProxy_disableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 disableNavigationCapability:*(void *)(a1 + 32)];
}

- (void)enableNavigationCapability:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__MNNavigationServiceLocalProxy_enableNavigationCapability___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __60__MNNavigationServiceLocalProxy_enableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 enableNavigationCapability:*(void *)(a1 + 32)];
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__MNNavigationServiceLocalProxy_changeOfflineMode___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  unsigned __int8 v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __51__MNNavigationServiceLocalProxy_changeOfflineMode___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 changeOfflineMode:*(unsigned __int8 *)(a1 + 32)];
}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MNNavigationServiceLocalProxy_acceptReroute_forTrafficIncidentAlert___block_invoke;
  v7[3] = &unk_1E60F6D08;
  BOOL v9 = a3;
  id v8 = v5;
  id v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);
}

void __71__MNNavigationServiceLocalProxy_acceptReroute_forTrafficIncidentAlert___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 acceptReroute:*(unsigned __int8 *)(a1 + 40) forTrafficIncidentAlert:*(void *)(a1 + 32)];
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__MNNavigationServiceLocalProxy_setTraceIsPlaying___block_invoke;
  v3[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __51__MNNavigationServiceLocalProxy_setTraceIsPlaying___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setTraceIsPlaying:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setTracePlaybackSpeed:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setTracePlaybackSpeed___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setTracePlaybackSpeed___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setTracePlaybackSpeed:*(double *)(a1 + 32)];
}

- (void)setTracePosition:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__MNNavigationServiceLocalProxy_setTracePosition___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __50__MNNavigationServiceLocalProxy_setTracePosition___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setTracePosition:*(double *)(a1 + 32)];
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__MNNavigationServiceLocalProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __87__MNNavigationServiceLocalProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 recordTraceBookmarkAtCurrentPositionWthScreenshotData:*(void *)(a1 + 32)];
}

- (void)recordPedestrianTracePath:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MNNavigationServiceLocalProxy_recordPedestrianTracePath___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __59__MNNavigationServiceLocalProxy_recordPedestrianTracePath___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 recordPedestrianTracePath:*(void *)(a1 + 32)];
}

- (void)setSimulationSpeedOverride:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__MNNavigationServiceLocalProxy_setSimulationSpeedOverride___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __60__MNNavigationServiceLocalProxy_setSimulationSpeedOverride___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setSimulationSpeedOverride:*(double *)(a1 + 32)];
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__MNNavigationServiceLocalProxy_setSimulationSpeedMultiplier___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __62__MNNavigationServiceLocalProxy_setSimulationSpeedMultiplier___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setSimulationSpeedMultiplier:*(double *)(a1 + 32)];
}

- (void)setSimulationPosition:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MNNavigationServiceLocalProxy_setSimulationPosition___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&void v3[4] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

void __55__MNNavigationServiceLocalProxy_setSimulationPosition___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 setSimulationPosition:*(double *)(a1 + 32)];
}

- (void)interfaceHashesWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    (*((void (**)(id, unint64_t, unint64_t))a3 + 2))(v4, +[MNNavigationService clientInterfaceHash](MNNavigationService, "clientInterfaceHash"), +[MNNavigationService daemonInterfaceHash]);
  }
}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__MNNavigationServiceLocalProxy_pauseRealtimeUpdatesForSubscriber___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __67__MNNavigationServiceLocalProxy_pauseRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 pauseRealtimeUpdatesForSubscriber:*(void *)(a1 + 32)];
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MNNavigationServiceLocalProxy_resumeRealtimeUpdatesForSubscriber___block_invoke;
  v5[3] = &unk_1E60F6B98;
  id v6 = v3;
  id v4 = v3;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __68__MNNavigationServiceLocalProxy_resumeRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2 = +[MNNavigationStateManager sharedManager];
  [v2 resumeRealtimeUpdatesForSubscriber:*(void *)(a1 + 32)];
}

- (void)stateManager:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(MNNavigationServiceLocalProxy *)self _serviceStateForStateType:a4];
  uint64_t v8 = [(MNNavigationServiceLocalProxy *)self _serviceStateForStateType:a5];
  BOOL v9 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = MNNavigationServiceStateAsString(v7);
    v11 = MNNavigationServiceStateAsString(v8);
    int v13 = 138412546;
    v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy willChangeFromState: '%@' toState: '%@'", (uint8_t *)&v13, 0x16u);
  }
  if (v7 != v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationServiceProxy:self willChangeFromState:v7 toState:v8];
  }
}

- (void)stateManager:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(MNNavigationServiceLocalProxy *)self _serviceStateForStateType:a4];
  uint64_t v8 = [(MNNavigationServiceLocalProxy *)self _serviceStateForStateType:a5];
  BOOL v9 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = MNNavigationServiceStateAsString(v7);
    v11 = MNNavigationServiceStateAsString(v8);
    int v13 = 138412546;
    v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "MNNavigationServiceLocalProxy didChangeFromState: '%@' toState: '%@'", (uint8_t *)&v13, 0x16u);
  }
  if (v7 != v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationServiceProxy:self didChangeFromState:v7 toState:v8];
  }
}

- (unint64_t)_serviceStateForStateType:(unint64_t)a3
{
  if (a3 + 1 > 7) {
    return 2;
  }
  else {
    return qword_1B55429E0[a3 + 1];
  }
}

- (void)navigationSessionManager:(id)a3 shouldEndWithReason:(unint64_t)a4
{
}

- (void)navigationSessionManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = objc_msgSend(v5, "_navigation_errorCodeAsString");
      int v12 = 138543362;
      int v13 = v9;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Navigation service encountered an unrecoverable error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v10 = [v5 userInfo];
    [v10 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_34_0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didFailWithError:v5];
}

void __75__MNNavigationServiceLocalProxy_navigationSessionManager_didFailWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)navigationSessionManager:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didChangeNavigationState:v4];
}

- (void)navigationSessionManager:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateDisplayedStepIndex:a4 segmentIndex:a5];
}

- (void)navigationSessionManager:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateDistanceUntilManeuver:a4 timeUntilManeuver:a5 forStepIndex:a6];
}

- (void)navigationSessionManagerDidFinishLocationUpdate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyDidFinishLocationUpdate:self];
}

- (void)navigationSessionManager:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self isApproachingEndOfLeg:a4];
}

- (void)navigationSessionManager:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didEnterPreArrivalStateForWaypoint:v8 endOfLegIndex:a5];
}

- (void)navigationSessionManager:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didArriveAtWaypoint:v8 endOfLegIndex:a5];
}

- (void)navigationSessionManager:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  p_delegate = &self->_delegate;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didResumeNavigatingFromWaypoint:v10 endOfLegIndex:a5 reason:a6];
}

- (void)navigationSessionManagerDidEnterPreArrivalState:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyDidEnterPreArrivalState:self];
}

- (void)navigationSessionManagerDidArrive:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyDidArrive:self];
}

- (void)navigationSessionManagerWillPause:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyWillPauseNavigation:self];
}

- (void)navigationSessionManagerWillResumeFromPause:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyWillResumeFromPauseNavigation:self];
}

- (void)navigationSessionManager:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didReceiveRouteSignalStrength:a4];
}

- (void)navigationSessionManager:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateETAResponseForRoute:v6];
}

- (void)navigationSessionManager:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateHeading:a4 accuracy:a5];
}

- (void)navigationSessionManager:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateMotionType:a4 confidence:a5];
}

- (void)navigationSessionManager:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didUpdatePreviewRoutes:v8 withSelectedRouteIndex:a5];
}

- (void)navigationSessionManagerWillReroute:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyWillReroute:self];
}

- (void)navigationSessionManager:(id)a3 didRerouteWithRoute:(id)a4 location:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  p_delegate = &self->_delegate;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didRerouteWithRoute:v14 withLocation:v13 withAlternateRoutes:v12 rerouteReason:a7];
}

- (void)navigationSessionManagerDidCancelReroute:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyDidCancelReroute:self];
}

- (void)navigationSessionManager:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateRouteWithNewRideSelection:v6];
}

- (void)navigationSessionManager:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didSwitchToNewTransportType:v5 newRoute:v8];
}

- (void)navigationSessionManager:(id)a3 didFailRerouteWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didFailRerouteWithError:v6];
}

- (void)navigationSessionManager:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateAlternateRoutes:v6];
}

- (void)navigationSessionManager:(id)a3 proceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  p_delegate = &self->_delegate;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateProceedToRouteDistance:v10 displayString:a6 closestStepIndex:a4];
}

- (void)navigationSessionManager:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateDistanceUntilSign:a4 timeUntilSign:a5 forStepIndex:a6];
}

- (void)navigationSessionManager:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self willAnnounce:a4 inSeconds:a5];
}

- (void)navigationSessionManager:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v11 = *(void *)&a6;
  p_delegate = &self->_delegate;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v19) = a10;
  [WeakRetained navigationServiceProxy:self displayPrimaryStep:v18 instructions:v17 shieldType:v11 shieldText:v16 drivingSide:v10 maneuverStepIndex:a9 isSynthetic:v19];
}

- (void)navigationSessionManager:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self displayManeuverAlertForAnnouncementStage:a4];
}

- (void)navigationSessionManager:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a6;
  p_delegate = &self->_delegate;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self displaySecondaryStep:v16 instructions:v15 shieldType:v9 shieldText:v14 drivingSide:v8];
}

- (void)navigationSessionManagerHideSecondaryStep:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyHideSecondaryStep:self];
}

- (void)navigationSessionManagerBeginGuidanceUpdate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyBeginGuidanceUpdate:self];
}

- (void)navigationSessionManagerEndGuidanceUpdate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxyEndGuidanceUpdate:self];
}

- (void)navigationSessionManager:(id)a3 updateSignsWithInfo:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self updateSignsWithInfo:v6];
}

- (void)navigationSessionManager:(id)a3 updateSignsWithARInfo:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self updateSignsWithARInfo:v6];
}

- (void)navigationSessionManager:(id)a3 usePersistentDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self usePersistentDisplay:v4];
}

- (void)navigationSessionManager:(id)a3 showLaneDirections:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self showLaneDirections:v6];
}

- (void)navigationSessionManager:(id)a3 hideLaneDirectionsForId:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self hideLaneDirectionsForId:v6];
}

- (void)navigationSessionManager:(id)a3 showJunctionView:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self showJunctionView:v6];
}

- (void)navigationSessionManager:(id)a3 hideJunctionViewForId:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self hideJunctionViewForId:v6];
}

- (void)navigationSessionManager:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self didEnableGuidancePrompts:v4];
}

- (void)navigationSessionManager:(id)a3 newGuidanceEventFeedback:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self newGuidanceEventFeedback:v6];
}

- (void)navigationSessionManager:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self updatedGuidanceEventFeedback:v6];
}

- (void)navigationSessionManager:(id)a3 didReceiveTrafficIncidentAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didReceiveTrafficIncidentAlert:v6];
}

- (void)navigationSessionManager:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateTrafficIncidentAlert:v6];
}

- (void)navigationSessionManager:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didInvalidateTrafficIncidentAlert:v6];
}

- (void)navigationSessionManager:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didDismissTrafficIncidentAlert:v6];
}

- (void)navigationSessionManager:(id)a3 didStartSpeakingPrompt:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didStartSpeakingPrompt:v6];
}

- (void)navigationSessionManager:(id)a3 willProcessSpeechEvent:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self willProcessSpeechEvent:v6];
}

- (void)navigationSessionManager:(id)a3 didProcessSpeechEvent:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didProcessSpeechEvent:v6];
}

- (void)navigationSessionManager:(id)a3 triggerHaptics:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationServiceProxy:self triggerHaptics:v4];
}

- (void)navigationSessionManager:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didUpdateTracePlaybackDetails:v6];
}

- (void)navigationSessionManager:(id)a3 willSendTransitUpdateRequestForRouteIDs:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self willRequestRealtimeUpdatesForRouteIDs:v6];
}

- (void)navigationSessionManager:(id)a3 didReceiveTransitUpdates:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didReceiveRealtimeUpdates:v6];
}

- (void)navigationSessionManager:(id)a3 didReceiveTransitAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didReceiveTransitAlert:v6];
}

- (void)navigationSessionManager:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained navigationServiceProxy:self didSendNavigationServiceCallback:v6];
}

- (MNNavigationServiceClientInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNNavigationServiceClientInterface *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationServiceActiveBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end