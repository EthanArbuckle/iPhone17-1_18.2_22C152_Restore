@interface MNNavigationServer
+ (id)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MNNavigationServer)init;
- (id)_peerDescriptions;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_defaultsDidChange;
- (void)_enumerateRemoteObjectsWithHandler:(id)a3;
- (void)_peerDidDisconnect:(id)a3;
- (void)_resetDetails;
- (void)dealloc;
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
@end

@implementation MNNavigationServer

void __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = [[MNNavigationServicePeer alloc] initWithConnection:*(void *)(a1 + 32)];
  BOOL v3 = [(GEONavdPeer *)v2 hasEntitlement:@"com.apple.navigation.spi"];
  v4 = GEOFindOrCreateLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = +[MNNavigationStateManager sharedManager];
      unint64_t v7 = [v6 currentStateType];
      if (v7 > 6) {
        v8 = @"MNNavigationStateTypeInvalid";
      }
      else {
        v8 = (__CFString *)*((void *)&off_1E60F6888 + v7);
      }
      *(_DWORD *)buf = 138412546;
      v47 = v2;
      __int16 v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Peer %@ connected to navd. Current navigation service state: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v2;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Peer %@ connected to navd, but doesn't have the proper entitlement.", buf, 0xCu);
  }

  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E3FFE0];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v9 setClasses:v12 forSelector:sel_setRoutesForPreview_selectedRouteIndex_ argumentIndex:0 ofReply:0];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);

  [v9 setClasses:v15 forSelector:sel_rerouteWithWaypoints_ argumentIndex:0 ofReply:0];
  [*(id *)(a1 + 32) setExportedInterface:v9];
  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E3C800];
  [*(id *)(a1 + 32) setRemoteObjectInterface:v16];

  if ([(MNNavigationServicePeer *)v2 isEntitled])
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 40);
    if (!v17)
    {
      v18 = objc_alloc_init(MNNavigationServiceLocalProxy);
      uint64_t v19 = *(void *)(a1 + 40);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "setDelegate:");
      [*(id *)(*(void *)(a1 + 40) + 40) start];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 40);
    }
    [*(id *)(a1 + 32) setExportedObject:v17];
  }
  else
  {
    v21 = [[MNNavigationServiceEmptyProxy alloc] initWithPeer:v2];
    [*(id *)(a1 + 32) setExportedObject:v21];
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_272;
  v43[3] = &unk_1E60F6690;
  v22 = v2;
  v44 = v22;
  objc_copyWeak(&v45, (id *)buf);
  [*(id *)(a1 + 32) setInvalidationHandler:v43];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_273;
  v40[3] = &unk_1E60F6690;
  v23 = v22;
  v41 = v23;
  objc_copyWeak(&v42, (id *)buf);
  [*(id *)(a1 + 32) setInterruptionHandler:v40];
  [*(id *)(a1 + 32) resume];
  BOOL v24 = [(MNNavigationServicePeer *)v23 isEntitled];
  uint64_t v25 = *(void *)(a1 + 40);
  if (v24)
  {
    v26 = *(void **)(v25 + 16);
    if (!v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      uint64_t v28 = *(void *)(a1 + 40);
      v29 = *(void **)(v28 + 16);
      *(void *)(v28 + 16) = v27;

      v26 = *(void **)(*(void *)(a1 + 40) + 16);
    }
    [v26 addObject:v23];
    v30 = [(GEONavdPeer *)v23 connection];
    v31 = [v30 remoteObjectProxy];
    [v31 navigationServiceProxy:0 didUpdateNavigationDetails:*(void *)(*(void *)(a1 + 40) + 32)];
  }
  else
  {
    v32 = *(void **)(v25 + 24);
    if (!v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      uint64_t v34 = *(void *)(a1 + 40);
      v35 = *(void **)(v34 + 24);
      *(void *)(v34 + 24) = v33;

      v32 = *(void **)(*(void *)(a1 + 40) + 24);
    }
    [v32 addObject:v23];
    v36 = NSString;
    v37 = [(MNNavigationServicePeer *)v23 peerIdentifier];
    v30 = [v36 stringWithFormat:@"%@ is missing the navigation service entitlement.", v37];

    v31 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:underlyingError:", 1, v30, 0);
    v38 = [(GEONavdPeer *)v23 connection];
    v39 = [v38 remoteObjectProxy];
    [v39 navigationServiceProxy:0 didFailWithError:v31];
  }
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke;
  v8[3] = &unk_1E60F6668;
  id v9 = v5;
  v10 = self;
  id v6 = v5;
  MNRunAsynchronouslyOnMainThread(v8);

  return 1;
}

+ (id)sharedServer
{
  if (qword_1EB59BFF8 != -1) {
    dispatch_once(&qword_1EB59BFF8, &__block_literal_global_4);
  }
  v2 = (void *)_MergedGlobals_18;
  return v2;
}

uint64_t __34__MNNavigationServer_sharedServer__block_invoke()
{
  _MergedGlobals_18 = objc_alloc_init(MNNavigationServer);
  return MEMORY[0x1F41817F8]();
}

- (MNNavigationServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationServer;
  v2 = [(MNNavigationServer *)&v12 init];
  if (v2)
  {
    BOOL v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "Starting MNNavigationServer", v11, 2u);
    }

    NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)_MNNavigationServerExceptionHandler);
    [(MNNavigationServer *)v2 _resetDetails];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__defaultsDidChange name:*MEMORY[0x1E4F1C370] object:0];

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.navigationService"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    unint64_t v7 = [MEMORY[0x1E4F64AC8] modernLoader];
    id v8 = objc_alloc_init(MEMORY[0x1E4F64BA8]);
    [v7 registerTileDecoder:v8];
    MNRunAsynchronouslyOnMainThread(&__block_literal_global_21);
    id v9 = dispatch_get_global_queue(21, 0);
    GEORegisterPListStateCaptureLegacy();
  }
  return v2;
}

void __26__MNNavigationServer_init__block_invoke()
{
  id v0 = +[MNNavigationStateManager sharedManager];
  [v0 start];
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  [(MNNavigationServiceLocalProxy *)self->_localProxy stopNavigationWithReason:0];
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;
  self->_listener = 0;

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServer;
  [(MNNavigationServer *)&v5 dealloc];
}

- (void)_resetDetails
{
  BOOL v3 = [[MNNavigationDetails alloc] initForServer:1];
  details = self->_details;
  self->_details = v3;

  objc_super v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "Resetting navigation details.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MNNavigationServer__resetDetails__block_invoke;
  v6[3] = &unk_1E60F6618;
  v6[4] = self;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v6];
}

uint64_t __35__MNNavigationServer__resetDetails__block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateNavigationDetails:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)_defaultsDidChange
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "Locale changed. Killing navd.", v3, 2u);
  }

  exit(0);
}

- (void)_enumerateRemoteObjectsWithHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__MNNavigationServer__enumerateRemoteObjectsWithHandler___block_invoke;
    v6[3] = &unk_1E60F6640;
    v6[4] = self;
    id v7 = v4;
    MNRunAsynchronouslyOnMainThread(v6);
  }
}

void __57__MNNavigationServer__enumerateRemoteObjectsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v30 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    unint64_t v6 = 0x1E4F29000uLL;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v4 = 136316162;
    long long v15 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v2);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "connection", v15, (void)v16);
        v10 = [v9 remoteObjectProxy];

        if (!v10)
        {
          unint64_t v11 = v6;
          objc_super v12 = [*(id *)(v6 + 24) stringWithFormat:@"No remote object found on connection"];
          v13 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v21 = "-[MNNavigationServer _enumerateRemoteObjectsWithHandler:]_block_invoke";
            __int16 v22 = 2080;
            v23 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
            __int16 v24 = 1024;
            int v25 = 142;
            __int16 v26 = 2080;
            uint64_t v27 = "remoteObject != nil";
            __int16 v28 = 2112;
            v29 = v12;
            _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

          unint64_t v6 = v11;
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        ++v8;
      }
      while (v5 != v8);
      uint64_t v14 = [v2 countByEnumeratingWithState:&v16 objects:v30 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }
}

- (id)_peerDescriptions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_peers count])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_peers, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v4 = self->_peers;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "description", (void)v11);
          [v3 addObject:v9];
        }
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)_peerDidDisconnect:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__MNNavigationServer__peerDidDisconnect___block_invoke;
  v6[3] = &unk_1E60F6668;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  MNRunAsynchronouslyOnMainThread(v6);
}

uint64_t __41__MNNavigationServer__peerDidDisconnect___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) clearConnection];
  id v2 = [*(id *)(a1 + 40) peerIdentifier];
  if (![v2 isEqualToString:@"com.apple.Maps"])
  {

LABEL_5:
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
    if (result) {
      return result;
    }
    goto LABEL_6;
  }
  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) state];

  if (v3 <= 2) {
    goto LABEL_5;
  }
LABEL_6:
  id v5 = [[MNNavigationDetails alloc] initForServer:1];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  [*(id *)(*(void *)(a1 + 32) + 40) reset];
  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 _resetDetails];
}

void __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_272(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "Peer invalidated: %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _peerDidDisconnect:*(void *)(a1 + 32)];
  }
}

void __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_273(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Peer interrupted: %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _peerDidDisconnect:*(void *)(a1 + 32)];
  }
}

- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__MNNavigationServer_navigationServiceProxy_willChangeFromState_toState___block_invoke;
  v5[3] = &unk_1E60F66B8;
  v5[5] = a4;
  v5[6] = a5;
  v5[4] = self;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __73__MNNavigationServer_navigationServiceProxy_willChangeFromState_toState___block_invoke(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    MNNavigationServiceStateAsString(a1[5]);
    uint64_t v3 = (char *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(a1[6]);
    id v4 = (char *)objc_claimAutoreleasedReturnValue();
    int v5 = [*(id *)(a1[4] + 16) count];
    *(_DWORD *)buf = 138412802;
    __int16 v22 = v3;
    __int16 v23 = 2112;
    __int16 v24 = v4;
    __int16 v25 = 1024;
    int v26 = v5;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "MNNavigationServer sending willChangeFromState: '%@' toState: '%@' to %d peers.", buf, 0x1Cu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *(id *)(a1[4] + 16);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&long long v8 = 136315650;
    long long v15 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "connection", v15, (void)v16);
        long long v13 = [v12 remoteObjectProxy];

        if (v13)
        {
          [v13 navigationServiceProxy:0 willChangeFromState:a1[5] toState:a1[6]];
        }
        else
        {
          long long v14 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            __int16 v22 = "-[MNNavigationServer navigationServiceProxy:willChangeFromState:toState:]_block_invoke";
            __int16 v23 = 2080;
            __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
            __int16 v25 = 1024;
            int v26 = 268;
            _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  [(MNNavigationDetails *)self->_details setState:a5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MNNavigationServer_navigationServiceProxy_didChangeFromState_toState___block_invoke;
  v8[3] = &unk_1E60F66B8;
  v8[5] = a4;
  v8[6] = a5;
  void v8[4] = self;
  MNRunAsynchronouslyOnMainThread(v8);
  if (!a5) {
    [(MNNavigationServer *)self _resetDetails];
  }
}

void __72__MNNavigationServer_navigationServiceProxy_didChangeFromState_toState___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    MNNavigationServiceStateAsString(*(void *)(a1 + 40));
    uint64_t v3 = (char *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(*(void *)(a1 + 48));
    id v4 = (char *)objc_claimAutoreleasedReturnValue();
    int v5 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    id v6 = [*(id *)(a1 + 32) _peerDescriptions];
    uint64_t v7 = [v6 componentsJoinedByString:@"\n\t"];
    *(_DWORD *)buf = 138413058;
    __int16 v24 = v3;
    __int16 v25 = 2112;
    int v26 = v4;
    __int16 v27 = 1024;
    int v28 = v5;
    __int16 v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "MNNavigationServer sending didChangeFromState: '%@' toState: '%@' to %d peers:\n\t%@", buf, 0x26u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    *(void *)&long long v10 = 136315650;
    long long v17 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "connection", v17, (void)v18);
        long long v15 = [v14 remoteObjectProxy];

        if (v15)
        {
          [v15 navigationServiceProxy:0 didChangeFromState:*(void *)(a1 + 40) toState:*(void *)(a1 + 48)];
        }
        else
        {
          long long v16 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            __int16 v24 = "-[MNNavigationServer navigationServiceProxy:didChangeFromState:toState:]_block_invoke";
            __int16 v25 = 2080;
            int v26 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
            __int16 v27 = 1024;
            int v28 = 288;
            _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315650;
    id v6 = "-[MNNavigationServer navigationServiceProxy:didUpdateNavigationDetails:]";
    __int16 v7 = 2080;
    id v8 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
    __int16 v9 = 1024;
    int v10 = 300;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v5, 0x1Cu);
  }
}

- (void)navigationServiceProxyWillPauseNavigation:(id)a3
{
}

uint64_t __64__MNNavigationServer_navigationServiceProxyWillPauseNavigation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyWillPauseNavigation:0];
}

- (void)navigationServiceProxyWillResumeFromPauseNavigation:(id)a3
{
}

uint64_t __74__MNNavigationServer_navigationServiceProxyWillResumeFromPauseNavigation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyWillResumeFromPauseNavigation:0];
}

- (void)navigationServiceProxy:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MNNavigationServer_navigationServiceProxy_didFailWithError___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __62__MNNavigationServer_navigationServiceProxy_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didFailWithError:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didChangeNavigationState:(int)a4
{
  [(MNNavigationDetails *)self->_details setNavigationState:*(void *)&a4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__MNNavigationServer_navigationServiceProxy_didChangeNavigationState___block_invoke;
  v6[3] = &__block_descriptor_36_e46_v16__0___MNNavigationServiceClientInterface__8l;
  int v7 = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v6];
}

uint64_t __70__MNNavigationServer_navigationServiceProxy_didChangeNavigationState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didChangeNavigationState:*(unsigned int *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  [(MNNavigationDetails *)self->_details setDisplayedStepIndex:a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__MNNavigationServer_navigationServiceProxy_didUpdateDisplayedStepIndex_segmentIndex___block_invoke;
  v8[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  void v8[4] = a4;
  v8[5] = a5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v8];
}

uint64_t __86__MNNavigationServer_navigationServiceProxy_didUpdateDisplayedStepIndex_segmentIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateDisplayedStepIndex:*(void *)(a1 + 32) segmentIndex:*(void *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  [(MNNavigationDetails *)self->_details setDistanceUntilManeuver:a3];
  [(MNNavigationDetails *)self->_details setTimeUntilManeuver:a5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __107__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilManeuver_timeUntilManeuver_forStepIndex___block_invoke;
  v10[3] = &__block_descriptor_56_e46_v16__0___MNNavigationServiceClientInterface__8l;
  *(double *)&v10[4] = a4;
  *(double *)&v10[5] = a5;
  v10[6] = a6;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v10];
}

uint64_t __107__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilManeuver_timeUntilManeuver_forStepIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateDistanceUntilManeuver:*(void *)(a1 + 48) timeUntilManeuver:*(double *)(a1 + 32) forStepIndex:*(double *)(a1 + 40)];
}

- (void)navigationServiceProxyDidFinishLocationUpdate:(id)a3
{
}

uint64_t __68__MNNavigationServer_navigationServiceProxyDidFinishLocationUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyDidFinishLocationUpdate:0];
}

- (void)navigationServiceProxy:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__MNNavigationServer_navigationServiceProxy_isApproachingEndOfLeg___block_invoke;
  v4[3] = &__block_descriptor_40_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v4[4] = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v4];
}

uint64_t __67__MNNavigationServer_navigationServiceProxy_isApproachingEndOfLeg___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 isApproachingEndOfLeg:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__MNNavigationServer_navigationServiceProxy_didEnterPreArrivalStateForWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E60F6780;
  id v10 = v7;
  unint64_t v11 = a5;
  id v8 = v7;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v9];
}

uint64_t __94__MNNavigationServer_navigationServiceProxy_didEnterPreArrivalStateForWaypoint_endOfLegIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didEnterPreArrivalStateForWaypoint:*(void *)(a1 + 32) endOfLegIndex:*(void *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__MNNavigationServer_navigationServiceProxy_didArriveAtWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E60F6780;
  id v10 = v7;
  unint64_t v11 = a5;
  id v8 = v7;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v9];
}

uint64_t __79__MNNavigationServer_navigationServiceProxy_didArriveAtWaypoint_endOfLegIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didArriveAtWaypoint:*(void *)(a1 + 32) endOfLegIndex:*(void *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v9 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__MNNavigationServer_navigationServiceProxy_didResumeNavigatingFromWaypoint_endOfLegIndex_reason___block_invoke;
  v11[3] = &unk_1E60F67A8;
  id v12 = v9;
  unint64_t v13 = a5;
  unint64_t v14 = a6;
  id v10 = v9;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v11];
}

uint64_t __98__MNNavigationServer_navigationServiceProxy_didResumeNavigatingFromWaypoint_endOfLegIndex_reason___block_invoke(void *a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didResumeNavigatingFromWaypoint:a1[4] endOfLegIndex:a1[5] reason:a1[6]];
}

- (void)navigationServiceProxyDidEnterPreArrivalState:(id)a3
{
}

uint64_t __68__MNNavigationServer_navigationServiceProxyDidEnterPreArrivalState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyDidEnterPreArrivalState:0];
}

- (void)navigationServiceProxyDidArrive:(id)a3
{
}

uint64_t __54__MNNavigationServer_navigationServiceProxyDidArrive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyDidArrive:0];
}

- (void)navigationServiceProxy:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  id v9 = a5;
  [(MNNavigationDetails *)self->_details setProceedToRouteDistance:a4];
  [(MNNavigationDetails *)self->_details setDisplayString:v9];
  [(MNNavigationDetails *)self->_details setClosestStepIndex:a6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__MNNavigationServer_navigationServiceProxy_didUpdateProceedToRouteDistance_displayString_closestStepIndex___block_invoke;
  v11[3] = &unk_1E60F67A8;
  double v13 = a4;
  id v12 = v9;
  unint64_t v14 = a6;
  id v10 = v9;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v11];
}

uint64_t __108__MNNavigationServer_navigationServiceProxy_didUpdateProceedToRouteDistance_displayString_closestStepIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateProceedToRouteDistance:*(void *)(a1 + 32) displayString:*(void *)(a1 + 48) closestStepIndex:*(double *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  [(MNNavigationDetails *)self->_details setDistanceUntilSign:a3];
  [(MNNavigationDetails *)self->_details setTimeUntilSign:a5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilSign_timeUntilSign_forStepIndex___block_invoke;
  v10[3] = &__block_descriptor_56_e46_v16__0___MNNavigationServiceClientInterface__8l;
  *(double *)&v10[4] = a4;
  *(double *)&v10[5] = a5;
  v10[6] = a6;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v10];
}

uint64_t __99__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilSign_timeUntilSign_forStepIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateDistanceUntilSign:*(void *)(a1 + 48) timeUntilSign:*(double *)(a1 + 32) forStepIndex:*(double *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MNNavigationServer_navigationServiceProxy_willAnnounce_inSeconds___block_invoke;
  v5[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v5[4] = a4;
  *(double *)&v5[5] = a5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v5];
}

uint64_t __68__MNNavigationServer_navigationServiceProxy_willAnnounce_inSeconds___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 willAnnounce:*(void *)(a1 + 32) inSeconds:*(double *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __141__MNNavigationServer_navigationServiceProxy_displayPrimaryStep_instructions_shieldType_shieldText_drivingSide_maneuverStepIndex_isSynthetic___block_invoke;
  v21[3] = &unk_1E60F67D0;
  id v22 = v15;
  id v23 = v16;
  int v26 = a6;
  int v27 = a8;
  id v24 = v17;
  unint64_t v25 = a9;
  BOOL v28 = a10;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v21];
}

uint64_t __141__MNNavigationServer_navigationServiceProxy_displayPrimaryStep_instructions_shieldType_shieldText_drivingSide_maneuverStepIndex_isSynthetic___block_invoke(uint64_t a1, void *a2)
{
  LOBYTE(v3) = *(unsigned char *)(a1 + 72);
  return [a2 navigationServiceProxy:0 displayPrimaryStep:*(void *)(a1 + 32) instructions:*(void *)(a1 + 40) shieldType:*(unsigned int *)(a1 + 64) shieldText:*(void *)(a1 + 48) drivingSide:*(unsigned int *)(a1 + 68) maneuverStepIndex:*(void *)(a1 + 56) isSynthetic:v3];
}

- (void)navigationServiceProxy:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__MNNavigationServer_navigationServiceProxy_displayManeuverAlertForAnnouncementStage___block_invoke;
  v4[3] = &__block_descriptor_40_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v4[4] = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v4];
}

uint64_t __86__MNNavigationServer_navigationServiceProxy_displayManeuverAlertForAnnouncementStage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 displayManeuverAlertForAnnouncementStage:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __113__MNNavigationServer_navigationServiceProxy_displaySecondaryStep_instructions_shieldType_shieldText_drivingSide___block_invoke;
  v19[3] = &unk_1E60F67F8;
  id v20 = v13;
  id v21 = v14;
  id v22 = v15;
  int v23 = a6;
  int v24 = a8;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v19];
}

uint64_t __113__MNNavigationServer_navigationServiceProxy_displaySecondaryStep_instructions_shieldType_shieldText_drivingSide___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 displaySecondaryStep:*(void *)(a1 + 32) instructions:*(void *)(a1 + 40) shieldType:*(unsigned int *)(a1 + 56) shieldText:*(void *)(a1 + 48) drivingSide:*(unsigned int *)(a1 + 60)];
}

- (void)navigationServiceProxyHideSecondaryStep:(id)a3
{
}

uint64_t __62__MNNavigationServer_navigationServiceProxyHideSecondaryStep___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyHideSecondaryStep:0];
}

- (void)navigationServiceProxyBeginGuidanceUpdate:(id)a3
{
}

uint64_t __64__MNNavigationServer_navigationServiceProxyBeginGuidanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyBeginGuidanceUpdate:0];
}

- (void)navigationServiceProxyEndGuidanceUpdate:(id)a3
{
}

uint64_t __62__MNNavigationServer_navigationServiceProxyEndGuidanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyEndGuidanceUpdate:0];
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MNNavigationServer_navigationServiceProxy_updateSignsWithInfo___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __65__MNNavigationServer_navigationServiceProxy_updateSignsWithInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 updateSignsWithInfo:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MNNavigationServer_navigationServiceProxy_updateSignsWithARInfo___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __67__MNNavigationServer_navigationServiceProxy_updateSignsWithARInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 updateSignsWithARInfo:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 usePersistentDisplay:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MNNavigationServer_navigationServiceProxy_usePersistentDisplay___block_invoke;
  v4[3] = &__block_descriptor_33_e46_v16__0___MNNavigationServiceClientInterface__8l;
  BOOL v5 = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v4];
}

uint64_t __66__MNNavigationServer_navigationServiceProxy_usePersistentDisplay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 usePersistentDisplay:*(unsigned __int8 *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 showLaneDirections:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__MNNavigationServer_navigationServiceProxy_showLaneDirections___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __64__MNNavigationServer_navigationServiceProxy_showLaneDirections___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 showLaneDirections:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 hideLaneDirectionsForId:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MNNavigationServer_navigationServiceProxy_hideLaneDirectionsForId___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __69__MNNavigationServer_navigationServiceProxy_hideLaneDirectionsForId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 hideLaneDirectionsForId:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 showJunctionView:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MNNavigationServer_navigationServiceProxy_showJunctionView___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __62__MNNavigationServer_navigationServiceProxy_showJunctionView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 showJunctionView:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 hideJunctionViewForId:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MNNavigationServer_navigationServiceProxy_hideJunctionViewForId___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __67__MNNavigationServer_navigationServiceProxy_hideJunctionViewForId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 hideJunctionViewForId:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  [(MNNavigationDetails *)self->_details setGuidancePromptsEnabled:a4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__MNNavigationServer_navigationServiceProxy_didEnableGuidancePrompts___block_invoke;
  v6[3] = &__block_descriptor_33_e46_v16__0___MNNavigationServiceClientInterface__8l;
  BOOL v7 = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v6];
}

uint64_t __70__MNNavigationServer_navigationServiceProxy_didEnableGuidancePrompts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didEnableGuidancePrompts:*(unsigned __int8 *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 newGuidanceEventFeedback:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MNNavigationServer_navigationServiceProxy_newGuidanceEventFeedback___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __70__MNNavigationServer_navigationServiceProxy_newGuidanceEventFeedback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 newGuidanceEventFeedback:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__MNNavigationServer_navigationServiceProxy_updatedGuidanceEventFeedback___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __74__MNNavigationServer_navigationServiceProxy_updatedGuidanceEventFeedback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 updatedGuidanceEventFeedback:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__MNNavigationServer_navigationServiceProxy_didReceiveRouteSignalStrength___block_invoke;
  v4[3] = &__block_descriptor_40_e46_v16__0___MNNavigationServiceClientInterface__8l;
  void v4[4] = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v4];
}

uint64_t __75__MNNavigationServer_navigationServiceProxy_didReceiveRouteSignalStrength___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didReceiveRouteSignalStrength:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  id v5 = a4;
  [(MNNavigationDetails *)self->_details updateETATrafficForRoute:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__MNNavigationServer_navigationServiceProxy_didUpdateETAResponseForRoute___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __74__MNNavigationServer_navigationServiceProxy_didUpdateETAResponseForRoute___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateETAResponseForRoute:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__MNNavigationServer_navigationServiceProxy_didUpdateHeading_accuracy___block_invoke;
  v5[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  *(double *)&v5[4] = a4;
  *(double *)&v5[5] = a5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v5];
}

uint64_t __71__MNNavigationServer_navigationServiceProxy_didUpdateHeading_accuracy___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateHeading:*(double *)(a1 + 32) accuracy:*(double *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__MNNavigationServer_navigationServiceProxy_didUpdateMotionType_confidence___block_invoke;
  v5[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v5[4] = a4;
  v5[5] = a5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v5];
}

uint64_t __76__MNNavigationServer_navigationServiceProxy_didUpdateMotionType_confidence___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateMotionType:*(void *)(a1 + 32) confidence:*(void *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  id v7 = a4;
  [(MNNavigationDetails *)self->_details setPreviewRoutes:v7 withSelectedRouteIndex:a5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__MNNavigationServer_navigationServiceProxy_didUpdatePreviewRoutes_withSelectedRouteIndex___block_invoke;
  v9[3] = &unk_1E60F6780;
  id v10 = v7;
  unint64_t v11 = a5;
  id v8 = v7;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v9];
}

uint64_t __91__MNNavigationServer_navigationServiceProxy_didUpdatePreviewRoutes_withSelectedRouteIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdatePreviewRoutes:*(void *)(a1 + 32) withSelectedRouteIndex:*(void *)(a1 + 40)];
}

- (void)navigationServiceProxyWillReroute:(id)a3
{
}

uint64_t __56__MNNavigationServer_navigationServiceProxyWillReroute___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyWillReroute:0];
}

- (void)navigationServiceProxy:(id)a3 didRerouteWithRoute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(MNNavigationDetails *)self->_details setCurrentRoute:v11 withAlternateRoutes:v13];
  [(MNNavigationDetails *)self->_details setLocation:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__MNNavigationServer_navigationServiceProxy_didRerouteWithRoute_withLocation_withAlternateRoutes_rerouteReason___block_invoke;
  v17[3] = &unk_1E60F67F8;
  id v18 = v11;
  id v19 = v12;
  id v20 = v13;
  unint64_t v21 = a7;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v17];
}

uint64_t __112__MNNavigationServer_navigationServiceProxy_didRerouteWithRoute_withLocation_withAlternateRoutes_rerouteReason___block_invoke(void *a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didRerouteWithRoute:a1[4] withLocation:a1[5] withAlternateRoutes:a1[6] rerouteReason:a1[7]];
}

- (void)navigationServiceProxyDidCancelReroute:(id)a3
{
}

uint64_t __61__MNNavigationServer_navigationServiceProxyDidCancelReroute___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxyDidCancelReroute:0];
}

- (void)navigationServiceProxy:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__MNNavigationServer_navigationServiceProxy_didUpdateRouteWithNewRideSelection___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __80__MNNavigationServer_navigationServiceProxy_didUpdateRouteWithNewRideSelection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateRouteWithNewRideSelection:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5
{
  id v7 = a5;
  [(MNNavigationDetails *)self->_details setCurrentRoute:v7 withAlternateRoutes:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__MNNavigationServer_navigationServiceProxy_didSwitchToNewTransportType_newRoute___block_invoke;
  v9[3] = &unk_1E60F6840;
  int v11 = a4;
  id v10 = v7;
  id v8 = v7;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v9];
}

uint64_t __82__MNNavigationServer_navigationServiceProxy_didSwitchToNewTransportType_newRoute___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didSwitchToNewTransportType:*(unsigned int *)(a1 + 40) newRoute:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didFailRerouteWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MNNavigationServer_navigationServiceProxy_didFailRerouteWithError___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __69__MNNavigationServer_navigationServiceProxy_didFailRerouteWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didFailRerouteWithError:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  id v5 = a4;
  [(MNNavigationDetails *)self->_details setAlternateRoutes:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MNNavigationServer_navigationServiceProxy_didUpdateAlternateRoutes___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __70__MNNavigationServer_navigationServiceProxy_didUpdateAlternateRoutes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateAlternateRoutes:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didReceiveTrafficIncidentAlert:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__MNNavigationServer_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __76__MNNavigationServer_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didReceiveTrafficIncidentAlert:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v5 = a4;
  id v6 = [(MNNavigationDetails *)self->_details updateWithTrafficIncidentAlert:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__MNNavigationServer_navigationServiceProxy_didUpdateTrafficIncidentAlert___block_invoke;
  v8[3] = &unk_1E60F6618;
  id v9 = v5;
  id v7 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v8];
}

uint64_t __75__MNNavigationServer_navigationServiceProxy_didUpdateTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateTrafficIncidentAlert:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  id v5 = a4;
  id v6 = [(MNNavigationDetails *)self->_details removeTrafficIncidentAlert:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__MNNavigationServer_navigationServiceProxy_didInvalidateTrafficIncidentAlert___block_invoke;
  v8[3] = &unk_1E60F6618;
  id v9 = v5;
  id v7 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v8];
}

uint64_t __79__MNNavigationServer_navigationServiceProxy_didInvalidateTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didInvalidateTrafficIncidentAlert:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__MNNavigationServer_navigationServiceProxy_didDismissTrafficIncidentAlert___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __76__MNNavigationServer_navigationServiceProxy_didDismissTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didDismissTrafficIncidentAlert:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  id v5 = a4;
  switch([v5 eventType])
  {
    case 1:
      id v6 = [v5 tracePath];
      [(MNNavigationDetails *)self->_details setTracePath:v6];

      [v5 traceDuration];
      -[MNNavigationDetails setTraceDuration:](self->_details, "setTraceDuration:");
      id v7 = [v5 bookmarks];
      [(MNNavigationDetails *)self->_details setTraceBookmarks:v7];

      goto LABEL_4;
    case 2:
LABEL_4:
      details = self->_details;
      uint64_t v9 = 1;
      goto LABEL_6;
    case 3:
      details = self->_details;
      uint64_t v9 = 0;
LABEL_6:
      [(MNNavigationDetails *)details setTraceIsPlaying:v9];
      break;
    case 4:
    case 5:
      [v5 currentPosition];
      -[MNNavigationDetails setTracePosition:](self->_details, "setTracePosition:");
      break;
    case 6:
      id v10 = [v5 bookmarks];
      [(MNNavigationDetails *)self->_details setTraceBookmarks:v10];
      goto LABEL_9;
    case 7:
      id v10 = [v5 tracePath];
      [(MNNavigationDetails *)self->_details setTracePath:v10];
LABEL_9:

      break;
    default:
      break;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__MNNavigationServer_navigationServiceProxy_didUpdateTracePlaybackDetails___block_invoke;
  v12[3] = &unk_1E60F6618;
  id v13 = v5;
  id v11 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v12];
}

uint64_t __75__MNNavigationServer_navigationServiceProxy_didUpdateTracePlaybackDetails___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didUpdateTracePlaybackDetails:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didActivateAudioSession:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__MNNavigationServer_navigationServiceProxy_didActivateAudioSession___block_invoke;
  v4[3] = &__block_descriptor_33_e46_v16__0___MNNavigationServiceClientInterface__8l;
  BOOL v5 = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v4];
}

uint64_t __69__MNNavigationServer_navigationServiceProxy_didActivateAudioSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didActivateAudioSession:*(unsigned __int8 *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didStartSpeakingPrompt:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MNNavigationServer_navigationServiceProxy_didStartSpeakingPrompt___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __68__MNNavigationServer_navigationServiceProxy_didStartSpeakingPrompt___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didStartSpeakingPrompt:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 willProcessSpeechEvent:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MNNavigationServer_navigationServiceProxy_willProcessSpeechEvent___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __68__MNNavigationServer_navigationServiceProxy_willProcessSpeechEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 willProcessSpeechEvent:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didProcessSpeechEvent:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MNNavigationServer_navigationServiceProxy_didProcessSpeechEvent___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __67__MNNavigationServer_navigationServiceProxy_didProcessSpeechEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didProcessSpeechEvent:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 triggerHaptics:(int)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__MNNavigationServer_navigationServiceProxy_triggerHaptics___block_invoke;
  v4[3] = &__block_descriptor_36_e46_v16__0___MNNavigationServiceClientInterface__8l;
  int v5 = a4;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v4];
}

uint64_t __60__MNNavigationServer_navigationServiceProxy_triggerHaptics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 triggerHaptics:*(unsigned int *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 willRequestRealtimeUpdatesForRouteIDs:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__MNNavigationServer_navigationServiceProxy_willRequestRealtimeUpdatesForRouteIDs___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __83__MNNavigationServer_navigationServiceProxy_willRequestRealtimeUpdatesForRouteIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 willRequestRealtimeUpdatesForRouteIDs:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MNNavigationServer_navigationServiceProxy_didReceiveRealtimeUpdates___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __71__MNNavigationServer_navigationServiceProxy_didReceiveRealtimeUpdates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didReceiveRealtimeUpdates:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didReceiveTransitAlert:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MNNavigationServer_navigationServiceProxy_didReceiveTransitAlert___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __68__MNNavigationServer_navigationServiceProxy_didReceiveTransitAlert___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didReceiveTransitAlert:*(void *)(a1 + 32)];
}

- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v5 = a4;
  [(MNNavigationDetails *)self->_details updateWithNavigationServiceCallbackParameters:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__MNNavigationServer_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke;
  v7[3] = &unk_1E60F6618;
  id v8 = v5;
  id v6 = v5;
  [(MNNavigationServer *)self _enumerateRemoteObjectsWithHandler:v7];
}

uint64_t __78__MNNavigationServer_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationServiceProxy:0 didSendNavigationServiceCallback:*(void *)(a1 + 32)];
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  id v41 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__MNNavigationServer_captureStatePlistWithHints___block_invoke;
  v35[3] = &unk_1E60F6868;
  v35[4] = self;
  v35[5] = &v42;
  v35[6] = &v36;
  MNRunSynchronouslyOnMainThread(v35);
  int v26 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = (id)v43[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v32 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v53[0] = @"name";
        uint64_t v8 = [v7 peerIdentifier];
        uint64_t v9 = (void *)v8;
        id v10 = &stru_1F0E08010;
        if (v8) {
          id v10 = (__CFString *)v8;
        }
        v53[1] = @"processID";
        v54[0] = v10;
        id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
        v54[1] = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
        [v26 addObject:v12];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v55 count:16];
    }
    while (v4);
  }

  id v13 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = (id)v37[5];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        v50[0] = @"name";
        uint64_t v19 = [v18 peerIdentifier];
        id v20 = (void *)v19;
        unint64_t v21 = &stru_1F0E08010;
        if (v19) {
          unint64_t v21 = (__CFString *)v19;
        }
        v50[1] = @"processID";
        v51[0] = v21;
        id v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "processIdentifier"));
        v51[1] = v22;
        int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
        [v13 addObject:v23];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v52 count:16];
    }
    while (v15);
  }

  v48[0] = @"peers";
  v48[1] = @"unEntitledPeers";
  v49[0] = v26;
  v49[1] = v13;
  int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v24;
}

uint64_t __49__MNNavigationServer_captureStatePlistWithHints___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) copy];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProxy, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_unEntitledPeers, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end