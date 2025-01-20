@interface MNNavigationServiceRemoteProxy
- (BOOL)_hasNavigationServiceEntitlement;
- (BOOL)_shouldReconnectWithInterruptionOnDate:(id)a3;
- (BOOL)isOpenForClient:(id)a3;
- (MNNavigationServiceClientInterface)delegate;
- (MNNavigationServiceRemoteProxy)init;
- (NSArray)interruptionDates;
- (id)_remoteObjectProxy;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)clientCount;
- (unint64_t)interruptionCount;
- (void)_closeConnection;
- (void)_consumeSandboxExtension:(char *)a3;
- (void)_handleDisconnect;
- (void)_handleInterruption;
- (void)_handleInvalidation;
- (void)_openConnection;
- (void)_releaseSandboxExtension;
- (void)_restoreIdleConnection;
- (void)_restoreNavigationSession;
- (void)_setExpectedClassesForClientInterface:(id)a3;
- (void)_startNavigationWithDetails:(id)a3;
- (void)_updateConnection;
- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4;
- (void)advanceToNextLeg;
- (void)changeOfflineMode:(unsigned __int8)a3;
- (void)changeTransportType:(int)a3 route:(id)a4;
- (void)changeUserOptions:(id)a3;
- (void)checkinForNavigationService:(id)a3;
- (void)closeForClient:(id)a3;
- (void)dealloc;
- (void)disableNavigationCapability:(unint64_t)a3;
- (void)enableNavigationCapability:(unint64_t)a3;
- (void)forceReroute;
- (void)forwardInvocation:(id)a3;
- (void)insertWaypoint:(id)a3;
- (void)interfaceHashesWithHandler:(id)a3;
- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4;
- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4;
- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)openForClient:(id)a3;
- (void)pauseRealtimeUpdatesForSubscriber:(id)a3;
- (void)recordPedestrianTracePath:(id)a3;
- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3;
- (void)removeWaypointAtIndex:(unint64_t)a3;
- (void)repeatCurrentGuidanceWithReply:(id)a3;
- (void)repeatCurrentTrafficAlertWithReply:(id)a3;
- (void)rerouteWithWaypoints:(id)a3;
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
- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4;
- (void)stopCurrentGuidancePrompt;
- (void)stopNavigationWithReason:(unint64_t)a3;
- (void)switchToDestinationRoute;
- (void)switchToRoute:(id)a3;
- (void)updateDestination:(id)a3;
- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4;
@end

@implementation MNNavigationServiceRemoteProxy

- (void)changeUserOptions:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MNNavigationServiceRemoteProxy_changeUserOptions___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didUpdateNavigationDetails___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 72) isReconnecting] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    [WeakRetained navigationServiceProxy:*(void *)(a1 + 32) didUpdateNavigationDetails:*(void *)(a1 + 40)];
  }
}

void __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained _remoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke_2;
  v4[3] = &unk_1E60FB250;
  objc_copyWeak(&v5, v1);
  [v3 checkinForNavigationService:v4];

  objc_destroyWeak(&v5);
}

void __52__MNNavigationServiceRemoteProxy_changeUserOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 changeUserOptions:*(void *)(a1 + 40)];
}

- (id)_remoteObjectProxy
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (!connection)
  {
    id v4 = [NSString stringWithFormat:@"Attempting to connect to navd without previously opening a connection. Execution can continue but please file a radar."];
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      v11 = "-[MNNavigationServiceRemoteProxy _remoteObjectProxy]";
      __int16 v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
      __int16 v14 = 1024;
      int v15 = 456;
      __int16 v16 = 2080;
      v17 = "NO";
      __int16 v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v10, 0x30u);
    }

    [(MNNavigationServiceRemoteProxy *)self _openConnection];
    connection = self->_connection;
    if (!connection)
    {
      id v8 = [NSString stringWithFormat:@"XPC connection must be created before calling remoteObjectProxy"];
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136316162;
        v11 = "-[MNNavigationServiceRemoteProxy _remoteObjectProxy]";
        __int16 v12 = 2080;
        v13 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
        __int16 v14 = 1024;
        int v15 = 460;
        __int16 v16 = 2080;
        v17 = "_connection != nil";
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v10, 0x30u);
      }

      connection = self->_connection;
    }
  }
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  return v6;
}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _hasNavigationServiceEntitlement])
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.navigationService" options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E3C800];
    [*(id *)(a1 + 32) _setExpectedClassesForClientInterface:v5];
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E3FFE0];
    [*(id *)(*(void *)(a1 + 32) + 16) setRemoteObjectInterface:v6];
    [*(id *)(*(void *)(a1 + 32) + 16) setExportedInterface:v5];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setExportedObject:");
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_256;
    v18[3] = &unk_1E60F7760;
    objc_copyWeak(&v19, (id *)location);
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_2;
    v16[3] = &unk_1E60F7760;
    objc_copyWeak(&v17, (id *)location);
    [*(id *)(*(void *)(a1 + 32) + 16) setInvalidationHandler:v16];
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Connection to navigation server created", buf, 2u);
    }

    [*(id *)(a1 + 32) checkinForNavigationService:0];
    geo_isolate_sync();
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v8 = NSString;
    v9 = [MEMORY[0x1E4F28F80] processInfo];
    int v10 = [v9 processName];
    v11 = [v8 stringWithFormat:@"Process '%@' is trying to use the MNNavigationService SPI without the proper entitlement.", v10];

    if (([*(id *)(a1 + 32) _hasNavigationServiceEntitlement] & 1) == 0)
    {
      v13 = [NSString stringWithFormat:@"%@", v11];
      __int16 v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "[self _hasNavigationServiceEntitlement]";
        __int16 v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", location, 0x16u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_31;
    block[3] = &unk_1E60F6B98;
    v21 = v11;
    uint64_t v12 = MNNavigationServiceXPCMachPort_block_invoke_onceToken;
    id v5 = v11;
    if (v12 != -1) {
      dispatch_once(&MNNavigationServiceXPCMachPort_block_invoke_onceToken, block);
    }
    id v6 = v21;
  }
}

- (void)checkinForNavigationService:(id)a3
{
  if (self->_sandboxHandle <= 0)
  {
    objc_initWeak(&location, self);
    serialQueue = self->_serialQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke;
    v5[3] = &unk_1E60F7760;
    objc_copyWeak(&v6, &location);
    dispatch_async(serialQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_setExpectedClassesForClientInterface:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_navigationServiceProxy_didUpdatePreviewRoutes_withSelectedRouteIndex_ argumentIndex:1 ofReply:0];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);

  [v4 setClasses:v9 forSelector:sel_navigationServiceProxy_didRerouteWithRoute_withLocation_withAlternateRoutes_rerouteReason_ argumentIndex:3 ofReply:0];
  int v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);

  [v4 setClasses:v12 forSelector:sel_navigationServiceProxy_didFailRerouteWithError_ argumentIndex:1 ofReply:0];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  int v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);

  [v4 setClasses:v15 forSelector:sel_navigationServiceProxy_didUpdateAlternateRoutes_ argumentIndex:1 ofReply:0];
  __int16 v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);

  [v4 setClasses:v24 forSelector:sel_navigationServiceProxy_didFailWithError_ argumentIndex:1 ofReply:0];
  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);

  [v4 setClasses:v28 forSelector:sel_navigationServiceProxy_willRequestRealtimeUpdatesForRouteIDs_ argumentIndex:1 ofReply:0];
  v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v29, "setWithObjects:", v30, v31, v32, objc_opt_class(), 0);

  [v4 setClasses:v33 forSelector:sel_navigationServiceProxy_didReceiveRealtimeUpdates_ argumentIndex:1 ofReply:0];
  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  id v36 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setClasses:v36 forSelector:sel_navigationServiceProxy_updateSignsWithARInfo_ argumentIndex:1 ofReply:0];
}

- (BOOL)_hasNavigationServiceEntitlement
{
  if (qword_1EB59C260 != -1) {
    dispatch_once(&qword_1EB59C260, &__block_literal_global_37);
  }
  return _MergedGlobals_40;
}

void __45__MNNavigationServiceRemoteProxy_clientCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) setRepresentation];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

uint64_t __48__MNNavigationServiceRemoteProxy_openForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

uint64_t __50__MNNavigationServiceRemoteProxy_isOpenForClient___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 40) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didUpdateNavigationDetails___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);
}

- (void)setDelegate:(id)a3
{
}

- (MNNavigationServiceRemoteProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationServiceRemoteProxy;
  id v2 = [(MNNavigationServiceRemoteProxy *)&v12 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = geo_isolater_create();
    clientsLock = v2->_clientsLock;
    v2->_clientsLock = (geo_isolater *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:261];
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v7;

    uint64_t v9 = geo_isolater_create();
    interruptionDatesLock = v2->_interruptionDatesLock;
    v2->_interruptionDatesLock = (geo_isolater *)v9;
  }
  return v2;
}

- (void)openForClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MNNavigationServiceRemoteProxy *)self isOpenForClient:v4])
  {
    uint64_t v5 = [NSString stringWithFormat:@"Calling openForClient with an already existing client."];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v10 = "-[MNNavigationServiceRemoteProxy openForClient:]";
      __int16 v11 = 2080;
      objc_super v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
      __int16 v13 = 1024;
      int v14 = 90;
      __int16 v15 = 2080;
      __int16 v16 = "NO";
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    id v8 = v4;
    geo_isolate_sync();
    [(MNNavigationServiceRemoteProxy *)self _updateConnection];
  }
}

- (BOOL)isOpenForClient:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a3;
  geo_isolate_sync();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateConnection
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MNNavigationServiceRemoteProxy *)self clientCount];
  connection = self->_connection;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109632;
    v6[1] = v3 != 0;
    __int16 v7 = 1024;
    BOOL v8 = connection != 0;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Updating connection for new client list. shouldConnect: %d, isConnected: %d, clientCount: %d", (uint8_t *)v6, 0x14u);
  }

  if ((v3 != 0) != (connection != 0))
  {
    if (v3) {
      [(MNNavigationServiceRemoteProxy *)self _openConnection];
    }
    else {
      [(MNNavigationServiceRemoteProxy *)self _closeConnection];
    }
  }
}

- (unint64_t)clientCount
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  geo_isolate_sync();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)_openConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_connection) {
    goto LABEL_2;
  }
  id v5 = [NSString stringWithFormat:@"Calling _openConnection when XPC connection has already been created"];
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v9 = "-[MNNavigationServiceRemoteProxy _openConnection]";
    __int16 v10 = 2080;
    uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServiceRemoteProxy.m";
    __int16 v12 = 1024;
    int v13 = 165;
    __int16 v14 = 2080;
    __int16 v15 = "_connection == nil";
    __int16 v16 = 2112;
    __int16 v17 = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }

  if (!self->_connection)
  {
LABEL_2:
    unint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Opening connection to navigation server", buf, 2u);
    }

    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke;
    block[3] = &unk_1E60F6B98;
    void block[4] = self;
    dispatch_async(serialQueue, block);
  }
}

void __62__MNNavigationServiceRemoteProxy_checkinForNavigationService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _consumeSandboxExtension:a2];
}

- (void)_consumeSandboxExtension:(char *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 && *a3)
  {
    int64_t v5 = sandbox_extension_consume();
    if (v5 == -1)
    {
      uint64_t v6 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v11 = *__error();
        int v12 = 136380931;
        int v13 = a3;
        __int16 v14 = 1024;
        int v15 = v11;
        uint64_t v7 = "Error consuming (%{private}s) sandbox extension: %d";
        BOOL v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 18;
        goto LABEL_8;
      }
    }
    else
    {
      self->_sandboxHandle = v5;
      uint64_t v6 = MNGetMNNavigationServiceLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136380675;
        int v13 = a3;
        uint64_t v7 = "Sandbox extension (%{private}s) consumed.";
        BOOL v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
        uint32_t v10 = 12;
LABEL_8:
        _os_log_impl(&dword_1B542B000, v8, v9, v7, (uint8_t *)&v12, v10);
      }
    }
  }
}

uint64_t __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_257(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = [MEMORY[0x1E4F1CA48] array];
  return MEMORY[0x1F41817F8]();
}

void __66__MNNavigationServiceRemoteProxy__hasNavigationServiceEntitlement__block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    CFErrorRef error = 0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.navigation.spi", &error);
    if (v2)
    {
      CFBooleanRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      _MergedGlobals_40 = v5;
      CFRelease(v3);
    }
    else
    {
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task", buf, 2u);
      }
    }
    if (error)
    {
      BOOL v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v11 = error;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    CFRelease(v1);
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Error creating security task", buf, 2u);
    }
  }
}

- (void)dealloc
{
  [(MNNavigationServiceRemoteProxy *)self _closeConnection];
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationServiceRemoteProxy;
  [(MNNavigationServiceRemoteProxy *)&v3 dealloc];
}

- (void)closeForClient:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  id v7 = v4;
  id v5 = v4;
  geo_isolate_sync();
  [(MNNavigationServiceRemoteProxy *)self _updateConnection];
}

uint64_t __49__MNNavigationServiceRemoteProxy_closeForClient___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (NSArray)interruptionDates
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__13;
  BOOL v8 = __Block_byref_object_dispose__13;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

uint64_t __51__MNNavigationServiceRemoteProxy_interruptionDates__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (unint64_t)interruptionCount
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  geo_isolate_sync();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __51__MNNavigationServiceRemoteProxy_interruptionCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_31(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v4, 0xCu);
  }
}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_256(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterruption];
}

void __49__MNNavigationServiceRemoteProxy__openConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

- (void)_handleInterruption
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = +[MNNavigationService sharedService];
    uint64_t v5 = MNNavigationServiceStateAsString([v4 state]);
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "navd connection interrupted while in state '%@'.", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MNNavigationServiceRemoteProxy__handleInterruption__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __53__MNNavigationServiceRemoteProxy__handleInterruption__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDisconnect];
}

- (void)_handleInvalidation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = +[MNNavigationService sharedService];
    uint64_t v5 = MNNavigationServiceStateAsString([v4 state]);
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "navd connection invalidated while in state '%@'. See logs with 'category=\"xpc.exceptions\"' for more information on the invalidation.", buf, 0xCu);
  }
  [(MNNavigationServiceRemoteProxy *)self _closeConnection];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MNNavigationServiceRemoteProxy__handleInvalidation__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __53__MNNavigationServiceRemoteProxy__handleInvalidation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateConnection];
  unint64_t v2 = *(void **)(a1 + 32);
  return [v2 _handleDisconnect];
}

- (void)_handleDisconnect
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(MNStartNavigationReconnectionDetails *)self->_reconnectionDetails isReconnecting])
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "Handling a navd disconnect while a reconnect was already in progress. This likely means that navd is crashing repeatedly. Attempting to continue anyway.", buf, 2u);
    }
  }
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v5 = [(MNNavigationServiceRemoteProxy *)self _shouldReconnectWithInterruptionOnDate:v4];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v6 = v4;
  uint64_t v23 = v6;
  geo_isolate_sync();
  if (v5)
  {
    uint64_t v7 = +[MNNavigationService sharedService];
    if ((unint64_t)[v7 state] >= 3
      && ([v7 route], (BOOL v8 = objc_claimAutoreleasedReturnValue()) != 0)
      && (startNavigationDetails = self->_startNavigationDetails, v8, startNavigationDetails))
    {
      [(MNNavigationServiceRemoteProxy *)self _restoreNavigationSession];
    }
    else
    {
      [(MNNavigationServiceRemoteProxy *)self _restoreIdleConnection];
    }
  }
  else
  {
    reconnectionDetails = self->_reconnectionDetails;
    self->_reconnectionDetails = 0;

    uint64_t UInteger = GEOConfigGetUInteger();
    GEOConfigGetDouble();
    uint64_t v13 = v12;
    __int16 v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = [(MNNavigationServiceRemoteProxy *)self interruptionCount];
      *(_DWORD *)buf = 67109632;
      int v27 = UInteger;
      __int16 v28 = 1024;
      int v29 = v15;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "navd connection interrupted over %d times (%d overall) in %g seconds. No longer attempting to reconnect.", buf, 0x18u);
    }

    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Connection to the navigation service was interrupted over %d times in %g seconds. Please file a Radar with a sysdiagnose.", UInteger, v13, v22, 3221225472, __51__MNNavigationServiceRemoteProxy__handleDisconnect__block_invoke, &unk_1E60F6668, self, v6);
    v25[0] = v7;
    v24[0] = @"MNErrorInternalDescriptionKey";
    v24[1] = @"MNErrorInterruptionDatesKey";
    uint64_t v16 = [(MNNavigationServiceRemoteProxy *)self interruptionDates];
    v25[1] = v16;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:userInfo:", 10, v17);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationServiceProxy:self didFailWithError:v18];

    uint64_t v20 = +[MNNavigationService sharedService];
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v21, "navigationServiceProxy:didChangeFromState:toState:", self, objc_msgSend(v20, "state"), 0);
  }
}

uint64_t __51__MNNavigationServiceRemoteProxy__handleDisconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

- (void)_restoreNavigationSession
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v26[0] = 67109120;
    v26[1] = [(MNNavigationServiceRemoteProxy *)self interruptionCount];
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "Attempting to restart navigation after interruption (%d interruptions overall)", (uint8_t *)v26, 8u);
  }

  int v4 = +[MNNavigationService sharedService];
  BOOL v5 = [v4 route];

  if (v5)
  {
    id v6 = [v4 userOptions];
    [(MNNavigationServiceRemoteProxy *)self changeUserOptions:v6];

    uint64_t v7 = [v4 alternateRoutes];
    uint64_t v8 = [v7 count] + 1;

    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    uint64_t v10 = [v4 route];
    [v9 addObject:v10];

    CFErrorRef v11 = [v4 alternateRoutes];
    [v9 addObjectsFromArray:v11];

    uint64_t v12 = (void *)[(MNStartNavigationDetails *)self->_startNavigationDetails copy];
    [v12 setRoutes:v9];
    uint64_t v13 = [v4 currentRequest];
    [v12 setDirectionsRequest:v13];

    __int16 v14 = [v4 currentResponse];
    [v12 setDirectionsResponse:v14];

    int v15 = [v4 lastLocation];
    [v12 setInitialUserLocation:v15];

    uint64_t v16 = [v4 details];
    __int16 v17 = objc_alloc_init(MNStartNavigationReconnectionDetails);
    reconnectionDetails = self->_reconnectionDetails;
    self->_reconnectionDetails = v17;

    [(MNStartNavigationReconnectionDetails *)self->_reconnectionDetails setIsReconnecting:1];
    -[MNStartNavigationReconnectionDetails setInitialRouteSource:](self->_reconnectionDetails, "setInitialRouteSource:", [v16 initialRouteSource]);
    -[MNStartNavigationReconnectionDetails setTargetLegIndex:](self->_reconnectionDetails, "setTargetLegIndex:", [v16 targetLegIndex]);
    uint64_t v19 = [v16 spokenAnnouncements];
    [(MNStartNavigationReconnectionDetails *)self->_reconnectionDetails setSpokenAnnouncements:v19];

    uint64_t v20 = [v16 resumeRouteHandle];
    id v21 = [v20 serverSessionState];
    [(MNStartNavigationReconnectionDetails *)self->_reconnectionDetails setServerSessionState:v21];

    [v12 setReconnectionDetails:self->_reconnectionDetails];
    uint64_t v22 = [v4 tracePath];
    if (v22 && ([v4 traceIsPlaying] & 1) == 0)
    {
      uint64_t v23 = [v22 lastPathComponent];
      v24 = [v23 stringByDeletingPathExtension];
      [v12 setTraceRecordingNameOverride:v24];
    }
    [(MNNavigationServiceRemoteProxy *)self _startNavigationWithDetails:v12];
  }
  else
  {
    uint64_t v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26[0]) = 0;
      _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_ERROR, "Restoring navigation session failed because no active route was found.", (uint8_t *)v26, 2u);
    }

    id v9 = self->_reconnectionDetails;
    self->_reconnectionDetails = 0;
  }
}

- (void)_restoreIdleConnection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v5 = [(MNNavigationServiceRemoteProxy *)self interruptionCount];
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "Attempting to restore idle connection after interruption (%d interruptions overall)", buf, 8u);
  }

  [(MNNavigationServiceRemoteProxy *)self _releaseSandboxExtension];
  geo_isolate_sync();
  [(MNNavigationServiceRemoteProxy *)self checkinForNavigationService:0];
}

uint64_t __56__MNNavigationServiceRemoteProxy__restoreIdleConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

- (BOOL)_shouldReconnectWithInterruptionOnDate:(id)a3
{
  id v4 = a3;
  unint64_t UInteger = GEOConfigGetUInteger();
  if ([(MNNavigationServiceRemoteProxy *)self interruptionCount] <= UInteger)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    __int16 v14 = __Block_byref_object_copy__13;
    int v15 = __Block_byref_object_dispose__13;
    id v16 = 0;
    geo_isolate_sync();
    GEOConfigGetDouble();
    double v7 = v6;
    [v4 timeIntervalSinceDate:v12[5]];
    BOOL v9 = v8 >= v7;
    _Block_object_dispose(&v11, 8);
  }
  return v9;
}

uint64_t __73__MNNavigationServiceRemoteProxy__shouldReconnectWithInterruptionOnDate___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 64) objectAtIndexedSubscript:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_closeConnection
{
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Closing connection to navigation server", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MNNavigationServiceRemoteProxy__closeConnection__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __50__MNNavigationServiceRemoteProxy__closeConnection__block_invoke(uint64_t a1)
{
  geo_isolate_sync();
  [*(id *)(*(void *)(a1 + 32) + 16) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  [*(id *)(a1 + 32) _releaseSandboxExtension];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;
}

void __50__MNNavigationServiceRemoteProxy__closeConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
}

- (void)_startNavigationWithDetails:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [MEMORY[0x1E4F28F80] processInfo];
    double v7 = [v6 processName];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "%@ => navd _startNavigationWithDetails", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__MNNavigationServiceRemoteProxy__startNavigationWithDetails___block_invoke;
  v10[3] = &unk_1E60F6668;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(serialQueue, v10);
}

void __62__MNNavigationServiceRemoteProxy__startNavigationWithDetails___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 startNavigationWithDetails:*(void *)(a1 + 40) activeBlock:&__block_literal_global_290_1];
}

- (void)_releaseSandboxExtension
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_sandboxHandle)
  {
    int v3 = sandbox_extension_release();
    id v4 = MNGetMNNavigationServiceLog();
    int v5 = v4;
    if (v3 == -1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v10 = *__error();
        v11[0] = 67109120;
        v11[1] = v10;
        double v6 = "Error releasing sandbox extension: %d";
        double v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_ERROR;
        uint32_t v9 = 8;
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      double v6 = "Sandbox extension released.";
      double v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 2;
LABEL_7:
      _os_log_impl(&dword_1B542B000, v7, v8, v6, (uint8_t *)v11, v9);
    }

    self->_sandboxHandle = 0;
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  int v5 = (const char *)[v4 selector];
  if (MNProtocolDeclaresSelector(&unk_1F0E3C800, v5))
  {
    double v6 = [v4 methodSignature];
    double v7 = objc_msgSend(MEMORY[0x1E4F1CA38], "_navigation_methodSignatureForEmptyMethod");

    if (v6 != v7)
    {
      os_log_type_t v8 = self;
      id v11 = v8;
      [v4 setArgument:&v11 atIndex:2];
      [v4 retainArguments];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__MNNavigationServiceRemoteProxy_forwardInvocation___block_invoke;
      v9[3] = &unk_1E60F6668;
      v9[4] = v8;
      id v10 = v4;
      MNRunAsynchronouslyOnMainThread(v9);
    }
  }
  else
  {
    [(MNNavigationServiceRemoteProxy *)self doesNotRecognizeSelector:v5];
  }
}

void __52__MNNavigationServiceRemoteProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));

  if (WeakRetained)
  {
    int v3 = *(void **)(a1 + 40);
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    [v3 invokeWithTarget:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (MNProtocolDeclaresSelector(&unk_1F0E3C800, a3))
  {
    int v5 = [(MNNavigationServiceRemoteProxy *)self delegate];
    if (!v5)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA38], "_navigation_methodSignatureForEmptyMethod");
LABEL_6:
      double v7 = (void *)v6;

      if (v7) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 methodSignatureForSelector:a3];
      goto LABEL_6;
    }
  }
LABEL_9:
  v9.receiver = self;
  v9.super_class = (Class)MNNavigationServiceRemoteProxy;
  double v7 = [(MNNavigationServiceRemoteProxy *)&v9 methodSignatureForSelector:a3];
LABEL_10:
  return v7;
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6 = a3;
  double v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Maps => navd setRoutesForPreview", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MNNavigationServiceRemoteProxy_setRoutesForPreview_selectedRouteIndex___block_invoke;
  block[3] = &unk_1E60F7138;
  void block[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  dispatch_async(serialQueue, block);
}

void __73__MNNavigationServiceRemoteProxy_setRoutesForPreview_selectedRouteIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setRoutesForPreview:*(void *)(a1 + 40) selectedRouteIndex:*(void *)(a1 + 48)];
}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  int v5 = (MNStartNavigationDetails *)a3;
  geo_isolate_sync();
  reconnectionDetails = self->_reconnectionDetails;
  self->_reconnectionDetails = 0;

  startNavigationDetails = self->_startNavigationDetails;
  self->_startNavigationDetails = v5;
  os_log_type_t v8 = v5;

  [(MNNavigationServiceRemoteProxy *)self _startNavigationWithDetails:v8];
}

uint64_t __73__MNNavigationServiceRemoteProxy_startNavigationWithDetails_activeBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v7 = [v6 processName];
    os_log_type_t v8 = (void *)v7;
    if (a3 - 1 > 9) {
      id v9 = @"Unknown";
    }
    else {
      id v9 = off_1E60FB270[a3 - 1];
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "%@ => navd stopNavigationWithReason: %@", buf, 0x16u);
  }
  reconnectionDetails = self->_reconnectionDetails;
  self->_reconnectionDetails = 0;

  startNavigationDetails = self->_startNavigationDetails;
  self->_startNavigationDetails = 0;

  serialQueue = self->_serialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__MNNavigationServiceRemoteProxy_stopNavigationWithReason___block_invoke;
  v13[3] = &unk_1E60F6BC0;
  v13[4] = self;
  v13[5] = a3;
  dispatch_async(serialQueue, v13);
}

void __59__MNNavigationServiceRemoteProxy_stopNavigationWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 stopNavigationWithReason:*(void *)(a1 + 40)];
}

- (void)rerouteWithWaypoints:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MNNavigationServiceRemoteProxy_rerouteWithWaypoints___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __55__MNNavigationServiceRemoteProxy_rerouteWithWaypoints___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 rerouteWithWaypoints:*(void *)(a1 + 40)];
}

- (void)insertWaypoint:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MNNavigationServiceRemoteProxy_insertWaypoint___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __49__MNNavigationServiceRemoteProxy_insertWaypoint___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 insertWaypoint:*(void *)(a1 + 40)];
}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_removeWaypointAtIndex___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_removeWaypointAtIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 removeWaypointAtIndex:*(void *)(a1 + 40)];
}

- (void)advanceToNextLeg
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MNNavigationServiceRemoteProxy_advanceToNextLeg__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __50__MNNavigationServiceRemoteProxy_advanceToNextLeg__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v1 advanceToNextLeg];
}

- (void)updateDestination:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MNNavigationServiceRemoteProxy_updateDestination___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __52__MNNavigationServiceRemoteProxy_updateDestination___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 updateDestination:*(void *)(a1 + 40)];
}

- (void)resumeOriginalDestination
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MNNavigationServiceRemoteProxy_resumeOriginalDestination__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __59__MNNavigationServiceRemoteProxy_resumeOriginalDestination__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v1 resumeOriginalDestination];
}

- (void)forceReroute
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MNNavigationServiceRemoteProxy_forceReroute__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __46__MNNavigationServiceRemoteProxy_forceReroute__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v1 forceReroute];
}

- (void)switchToRoute:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MNNavigationServiceRemoteProxy_switchToRoute___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __48__MNNavigationServiceRemoteProxy_switchToRoute___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 switchToRoute:*(void *)(a1 + 40)];
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MNNavigationServiceRemoteProxy_changeTransportType_route___block_invoke;
  block[3] = &unk_1E60FB200;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __60__MNNavigationServiceRemoteProxy_changeTransportType_route___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 changeTransportType:*(unsigned int *)(a1 + 48) route:*(void *)(a1 + 40)];
}

- (void)switchToDestinationRoute
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MNNavigationServiceRemoteProxy_switchToDestinationRoute__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __58__MNNavigationServiceRemoteProxy_switchToDestinationRoute__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v1 switchToDestinationRoute];
}

- (void)setGuidanceType:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MNNavigationServiceRemoteProxy_setGuidanceType___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __50__MNNavigationServiceRemoteProxy_setGuidanceType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setGuidanceType:*(void *)(a1 + 40)];
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__MNNavigationServiceRemoteProxy_setVoiceGuidanceLevelOverride___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __64__MNNavigationServiceRemoteProxy_setVoiceGuidanceLevelOverride___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setVoiceGuidanceLevelOverride:*(void *)(a1 + 40)];
}

- (void)repeatCurrentGuidanceWithReply:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke;
  v7[3] = &unk_1E60F6640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke_2;
  v3[3] = &unk_1E60FB228;
  id v4 = *(id *)(a1 + 40);
  [v2 repeatCurrentGuidanceWithReply:v3];
}

uint64_t __65__MNNavigationServiceRemoteProxy_repeatCurrentGuidanceWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)repeatCurrentTrafficAlertWithReply:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke;
  v7[3] = &unk_1E60F6640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke_2;
  v3[3] = &unk_1E60FB228;
  id v4 = *(id *)(a1 + 40);
  [v2 repeatCurrentTrafficAlertWithReply:v3];
}

uint64_t __69__MNNavigationServiceRemoteProxy_repeatCurrentTrafficAlertWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)vibrateForPrompt:(unint64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke;
  block[3] = &unk_1E60FAD18;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke_2;
  v4[3] = &unk_1E60FB228;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v2 vibrateForPrompt:v3 withReply:v4];
}

uint64_t __61__MNNavigationServiceRemoteProxy_vibrateForPrompt_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopCurrentGuidancePrompt
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MNNavigationServiceRemoteProxy_stopCurrentGuidancePrompt__block_invoke;
  block[3] = &unk_1E60F6B98;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __59__MNNavigationServiceRemoteProxy_stopCurrentGuidancePrompt__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v1 stopCurrentGuidancePrompt];
}

- (void)setHeadingOrientation:(int)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setHeadingOrientation___block_invoke;
  v4[3] = &unk_1E60F6C30;
  void v4[4] = self;
  int v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setHeadingOrientation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setHeadingOrientation:*(unsigned int *)(a1 + 40)];
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__MNNavigationServiceRemoteProxy_setGuidancePromptsEnabled___block_invoke;
  v4[3] = &unk_1E60F6D08;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __60__MNNavigationServiceRemoteProxy_setGuidancePromptsEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setGuidancePromptsEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__MNNavigationServiceRemoteProxy_setIsDisplayingNavigationTray___block_invoke;
  v4[3] = &unk_1E60F6D08;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __64__MNNavigationServiceRemoteProxy_setIsDisplayingNavigationTray___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setIsDisplayingNavigationTray:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__MNNavigationServiceRemoteProxy_setIsConnectedToCarplay___block_invoke;
  v4[3] = &unk_1E60F6D08;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __58__MNNavigationServiceRemoteProxy_setIsConnectedToCarplay___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setIsConnectedToCarplay:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setDisplayedStepIndex___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setDisplayedStepIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setDisplayedStepIndex:*(void *)(a1 + 40)];
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MNNavigationServiceRemoteProxy_setRideIndex_forSegmentIndex___block_invoke;
  block[3] = &unk_1E60F66B8;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(serialQueue, block);
}

void __63__MNNavigationServiceRemoteProxy_setRideIndex_forSegmentIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setRideIndex:*(void *)(a1 + 40) forSegmentIndex:*(void *)(a1 + 48)];
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MNNavigationServiceRemoteProxy_setJunctionViewImageWidth_height___block_invoke;
  block[3] = &unk_1E60F66B8;
  void block[4] = self;
  *(double *)&void block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(serialQueue, block);
}

void __67__MNNavigationServiceRemoteProxy_setJunctionViewImageWidth_height___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setJunctionViewImageWidth:*(double *)(a1 + 40) height:*(double *)(a1 + 48)];
}

- (void)disableNavigationCapability:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__MNNavigationServiceRemoteProxy_disableNavigationCapability___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __62__MNNavigationServiceRemoteProxy_disableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 disableNavigationCapability:*(void *)(a1 + 40)];
}

- (void)enableNavigationCapability:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__MNNavigationServiceRemoteProxy_enableNavigationCapability___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __61__MNNavigationServiceRemoteProxy_enableNavigationCapability___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 enableNavigationCapability:*(void *)(a1 + 40)];
}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MNNavigationServiceRemoteProxy_changeOfflineMode___block_invoke;
  v4[3] = &unk_1E60F6D08;
  void v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __52__MNNavigationServiceRemoteProxy_changeOfflineMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 changeOfflineMode:*(unsigned __int8 *)(a1 + 40)];
}

- (void)acceptReroute:(BOOL)a3 forTrafficIncidentAlert:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MNNavigationServiceRemoteProxy_acceptReroute_forTrafficIncidentAlert___block_invoke;
  block[3] = &unk_1E60F6580;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __72__MNNavigationServiceRemoteProxy_acceptReroute_forTrafficIncidentAlert___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 acceptReroute:*(unsigned __int8 *)(a1 + 48) forTrafficIncidentAlert:*(void *)(a1 + 40)];
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MNNavigationServiceRemoteProxy_setTraceIsPlaying___block_invoke;
  v4[3] = &unk_1E60F6D08;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __52__MNNavigationServiceRemoteProxy_setTraceIsPlaying___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setTraceIsPlaying:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setTracePlaybackSpeed:(double)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setTracePlaybackSpeed___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setTracePlaybackSpeed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setTracePlaybackSpeed:*(double *)(a1 + 40)];
}

- (void)setTracePosition:(double)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__MNNavigationServiceRemoteProxy_setTracePosition___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __51__MNNavigationServiceRemoteProxy_setTracePosition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setTracePosition:*(double *)(a1 + 40)];
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__MNNavigationServiceRemoteProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __88__MNNavigationServiceRemoteProxy_recordTraceBookmarkAtCurrentPositionWthScreenshotData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 recordTraceBookmarkAtCurrentPositionWthScreenshotData:*(void *)(a1 + 40)];
}

- (void)recordPedestrianTracePath:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MNNavigationServiceRemoteProxy_recordPedestrianTracePath___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __60__MNNavigationServiceRemoteProxy_recordPedestrianTracePath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 recordPedestrianTracePath:*(void *)(a1 + 40)];
}

- (void)setSimulationSpeedOverride:(double)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__MNNavigationServiceRemoteProxy_setSimulationSpeedOverride___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __61__MNNavigationServiceRemoteProxy_setSimulationSpeedOverride___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setSimulationSpeedOverride:*(double *)(a1 + 40)];
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MNNavigationServiceRemoteProxy_setSimulationSpeedMultiplier___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __63__MNNavigationServiceRemoteProxy_setSimulationSpeedMultiplier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setSimulationSpeedMultiplier:*(double *)(a1 + 40)];
}

- (void)setSimulationPosition:(double)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MNNavigationServiceRemoteProxy_setSimulationPosition___block_invoke;
  v4[3] = &unk_1E60F6BC0;
  void v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

void __56__MNNavigationServiceRemoteProxy_setSimulationPosition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 setSimulationPosition:*(double *)(a1 + 40)];
}

- (void)interfaceHashesWithHandler:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MNNavigationServiceRemoteProxy_interfaceHashesWithHandler___block_invoke;
  v7[3] = &unk_1E60F6640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __61__MNNavigationServiceRemoteProxy_interfaceHashesWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 interfaceHashesWithHandler:*(void *)(a1 + 40)];
}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MNNavigationServiceRemoteProxy_pauseRealtimeUpdatesForSubscriber___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __68__MNNavigationServiceRemoteProxy_pauseRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 pauseRealtimeUpdatesForSubscriber:*(void *)(a1 + 40)];
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MNNavigationServiceRemoteProxy_resumeRealtimeUpdatesForSubscriber___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __69__MNNavigationServiceRemoteProxy_resumeRealtimeUpdatesForSubscriber___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v2 resumeRealtimeUpdatesForSubscriber:*(void *)(a1 + 40)];
}

- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x1E4F28F80] processInfo];
    id v10 = [v9 processName];
    BOOL v11 = MNNavigationServiceStateAsString(a4);
    unint64_t v12 = MNNavigationServiceStateAsString(a5);
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "navd => %@ willChangeFromState: '%@' toState: '%@'", buf, 0x20u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__MNNavigationServiceRemoteProxy_navigationServiceProxy_willChangeFromState_toState___block_invoke;
  v13[3] = &unk_1E60F66B8;
  v13[4] = self;
  v13[5] = a4;
  void v13[6] = a5;
  MNRunAsynchronouslyOnMainThread(v13);
}

void __85__MNNavigationServiceRemoteProxy_navigationServiceProxy_willChangeFromState_toState___block_invoke(void *a1)
{
  if (([*(id *)(a1[4] + 72) isReconnecting] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 96));
    [WeakRetained navigationServiceProxy:a1[4] willChangeFromState:a1[5] toState:a1[6]];
  }
}

- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = MNGetMNNavigationXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x1E4F28F80] processInfo];
    id v10 = [v9 processName];
    BOOL v11 = MNNavigationServiceStateAsString(a4);
    unint64_t v12 = MNNavigationServiceStateAsString(a5);
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "navd => %@ didChangeFromState: '%@' toState: '%@'", buf, 0x20u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didChangeFromState_toState___block_invoke;
  v13[3] = &unk_1E60F66B8;
  v13[4] = self;
  v13[5] = a4;
  void v13[6] = a5;
  MNRunAsynchronouslyOnMainThread(v13);
}

void __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didChangeFromState_toState___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 72) isReconnecting])
  {
    id v2 = MNGetMNNavigationXPCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Reconnected to navd", buf, 2u);
    }

    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) spokenAnnouncements];
    id v4 = +[MNNavigationService sharedService];
    BOOL v5 = [v4 details];
    [v5 setSpokenAnnouncements:v3];

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    [WeakRetained navigationServiceProxy:*(void *)(a1 + 32) didChangeFromState:*(void *)(a1 + 40) toState:*(void *)(a1 + 48)];

    if (!*(void *)(a1 + 48)) {
      geo_isolate_sync();
    }
    [*(id *)(a1 + 32) _updateConnection];
  }
}

void __84__MNNavigationServiceRemoteProxy_navigationServiceProxy_didChangeFromState_toState___block_invoke_303(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
    uint64_t v3 = [MEMORY[0x1E4F28E78] string];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
          id v10 = [*(id *)(*(void *)(a1 + 32) + 64) firstObject];

          if (v9 != v10) {
            [v3 appendString:@", "];
          }
          BOOL v11 = [v2 stringFromDate:v9];
          [v3 appendFormat:@"%@", v11];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v6);
    }

    unint64_t v12 = MNGetMNNavigationXPCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = [*(id *)(*(void *)(a1 + 32) + 64) count];
      *(_DWORD *)buf = 67109378;
      int v19 = v13;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "navd state changed to stopped and %d interruptions were detected at: %@", buf, 0x12u);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  }
}

- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__MNNavigationServiceRemoteProxy_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  MNRunAsynchronouslyOnMainThread(v7);
}

void __90__MNNavigationServiceRemoteProxy_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained navigationServiceProxy:*(void *)(a1 + 32) didSendNavigationServiceCallback:*(void *)(a1 + 40)];
}

- (MNNavigationServiceClientInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNNavigationServiceClientInterface *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_reconnectionDetails, 0);
  objc_storeStrong((id *)&self->_interruptionDates, 0);
  objc_storeStrong((id *)&self->_interruptionDatesLock, 0);
  objc_storeStrong((id *)&self->_startNavigationDetails, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clientsLock, 0);
  objc_storeStrong((id *)&self->_userOptions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end