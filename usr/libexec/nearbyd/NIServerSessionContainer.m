@interface NIServerSessionContainer
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)_isClientInternalTool;
- (BOOL)_isClientOnGeneralEntitlementAllowlist;
- (BOOL)_isClientOnSystemShutdownAllowlist;
- (BOOL)_supportedPlatform;
- (BOOL)_updateInterruptionForUWBServiceState:(int)a3 cause:(int)a4 requiresNarrowBand:(BOOL)a5;
- (BOOL)_updateInterruptionForUWBSystemOffWithCause:(int)a3;
- (BOOL)addObservers:(id)a3;
- (BOOL)entitlementGranted:(int)a3;
- (BOOL)isBackgroundOperationAllowed;
- (BOOL)isInteresetedInSample:(id)a3;
- (BOOL)isInterestedInSamplesForDevice:(id)a3;
- (BOOL)longRangeEnabled;
- (BOOL)removeObservers:(id)a3;
- (BOOL)requiresBiasCorrection;
- (BOOL)requiresLargeRegions;
- (BOOL)supportsDevicePresence;
- (BOOL)supportsSessionObservers;
- (NIRecentlyObservedObjectsCache)nearbyObjectsCache;
- (NIServerSessionActivationGuard)activationGuard;
- (NIServerSessionAggregateStateProvider)aggregateStateProvider;
- (NIServerSessionContainer)init;
- (NIServerSessionContainer)initWithClient:(id)a3 clientInfo:(const NIServerClientInfo *)a4 connection:(id)a5 authorizationManager:(id)a6;
- (NIServerSessionObservationRegistrar)observationRegistrar;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)processNameBestGuess;
- (NSString)signingIdentity;
- (NSUUID)sessionIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)connectionQueue;
- (PRAppStateMonitor)appStateMonitor;
- (PRUWBServiceProviding)uwbProvider;
- (PRWiFiServiceProviding)wifiProvider;
- (basic_string<char,)_interruptionsMapAsString;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_augmentDiscoveryToken:(id)a3 withHomeAnchorVariant:(unsigned int)a4;
- (id)_augmentDiscoveryTokenWithDeviceCapabilities:(id)a3;
- (id)_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:(id)a3;
- (id)_displayPermissionsPromptIfNeeded;
- (id)_fatalErrorForUwbServiceState:(int)a3 cause:(int)a4;
- (id)_getCapabilities;
- (id)_getExpandedCapabilities;
- (id)analytics;
- (id)btResource;
- (id)canHandleAcwgMsg:(id)a3;
- (id)clientProcessSigningIdentity;
- (id)devicePresenceResource;
- (id)discoveryToken;
- (id)getQueueForInputingData;
- (id)lifecycleSupervisor;
- (id)printableState;
- (id)recentlyObservedObjectsCache;
- (id)remote;
- (id)serverSessionIdentifier;
- (id)updatesQueue;
- (id)uwbResource;
- (id)visionResource;
- (id)wifiResource;
- (int)clientPid;
- (int)latestAppState;
- (int)pid;
- (int64_t)latestBluetoothState;
- (shared_ptr<rose::PowerBudgetProvider>)powerBudgetProvider;
- (shared_ptr<rose::protobuf::Logger>)protobufLogger;
- (unsigned)_getDiscoveryTokenFlags;
- (unsigned)latestSessionContainerState;
- (unsigned)specializedSessionBackgroundSupport;
- (void)_acquireClientAssertionIfNecessary;
- (void)_activateBluetoothResource;
- (void)_addObject:(id)a3 reply:(id)a4;
- (void)_dumpInterruptionsMapWithDebugString:(id)a3;
- (void)_handleBluetoothBecameAvailable;
- (void)_handleBluetoothBecameUnavailable;
- (void)_handleSpecializedSessionBackgroundSupportUpdate:(BOOL)a3;
- (void)_handleSpecializedSessionInvalidation:(id)a3;
- (void)_populateClientEntitlements;
- (void)_processBluetoothSample:(id)a3;
- (void)_processCarKeyEvent:(id)a3 reply:(id)a4;
- (void)_processFindingEvent:(id)a3 reply:(id)a4;
- (void)_processSystemEvent:(id)a3 reply:(id)a4;
- (void)_provideTruthTag:(id)a3;
- (void)_removeObject:(id)a3 reply:(id)a4;
- (void)_setContainerState:(unsigned __int8)a3;
- (void)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4 reply:(id)a5;
- (void)_setURSKTTL:(unint64_t)a3 reply:(id)a4;
- (void)_updateClientAppVisibilityInterruption;
- (void)_updateInterruptionForUWBSystemError;
- (void)_updateInterruptionForUWBSystemReady;
- (void)activate:(id)a3;
- (void)arSessionDidFailWithError:(id)a3;
- (void)arSessionInterruptionEnded;
- (void)arSessionWasInterrupted;
- (void)arSessionWillRunWithInvalidConfiguration;
- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3;
- (void)bluetoothDidChangeState:(int64_t)a3;
- (void)bluetoothServiceInterrupted;
- (void)consumeBluetoothSample:(id)a3;
- (void)dealloc;
- (void)deleteURSKs:(id)a3;
- (void)didDiscoverDevice:(id)a3;
- (void)didFailWithErrorCode:(int64_t)a3 errorString:(const void *)a4;
- (void)didFinishActivatingWithDiscoveryTokenData:(id)a3 error:(id)a4;
- (void)didLoseDevice:(id)a3;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didReceiveSessionStartNotification:(const void *)a3;
- (void)discoveredDevice:(id)a3 didUpdate:(id)a4;
- (void)generateDiscoveryToken;
- (void)getActivelyInteractingDiscoveryTokens:(id)a3;
- (void)getInteractableDiscoveryTokens:(id)a3;
- (void)getLocalDevicePrintableState:(id)a3;
- (void)interruptSessionWithReason:(int64_t)a3 monotonicTimeSeconds:(double)a4;
- (void)interruptionReasonEnded:(int64_t)a3 monotonicTimeSeconds:(double)a4;
- (void)invalidate;
- (void)isExtendedDistanceMeasurementAllowed:(id)a3;
- (void)isPreciseRangingAllowed:(id)a3;
- (void)isRangingLimitExceeded:(id)a3;
- (void)monitoredApp:(int)a3 didChangeState:(int)a4;
- (void)notifySystemShutdownWithReason:(int64_t)a3 reply:(id)a4;
- (void)pause:(id)a3;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 reply:(id)a6;
- (void)processDCKMessage:(id)a3 reply:(id)a4;
- (void)processUpdatedLockState:(unsigned __int16)a3;
- (void)processVisionInput:(id)a3;
- (void)queryDeviceCapabilities:(id)a3;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)runWithConfiguration:(id)a3 reply:(id)a4;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)setActivationGuard:(id)a3;
- (void)setAggregateStateProvider:(id)a3;
- (void)setAppStateMonitor:(id)a3;
- (void)setLatestAppState:(int)a3;
- (void)setLatestBluetoothState:(int64_t)a3;
- (void)setLatestSessionContainerState:(unsigned __int8)a3;
- (void)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4 reply:(id)a5;
- (void)setLocalDeviceDebugParameters:(id)a3 reply:(id)a4;
- (void)setLocalDeviceInteractableDiscoveryTokens:(id)a3 reply:(id)a4;
- (void)setNearbyObjectsCache:(id)a3;
- (void)setObservationRegistrar:(id)a3;
- (void)setSpecializedSessionBackgroundSupport:(unsigned __int8)a3;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
@end

@implementation NIServerSessionContainer

- (NIServerSessionContainer)init
{
}

- (NIServerSessionContainer)initWithClient:(id)a3 clientInfo:(const NIServerClientInfo *)a4 connection:(id)a5 authorizationManager:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = [v12 _queue];
  dispatch_assert_queue_V2(v14);

  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2, self, @"NIServerSessionContainer.mm", 304, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v35 = +[NSAssertionHandler currentHandler];
  [v35 handleFailureInMethod:a2, self, @"NIServerSessionContainer.mm", 305, @"Invalid parameter not satisfying: %@", @"authorizationManager" object file lineNumber description];

LABEL_3:
  v36.receiver = self;
  v36.super_class = (Class)NIServerSessionContainer;
  v15 = [(NIServerSessionContainer *)&v36 init];
  v16 = v15;
  if (v15)
  {
    v15->_entitlementsLock._os_unfair_lock_opaque = 0;
    uint64_t v17 = +[NIServerClientPublisher publisherForClient:v11];
    client = v16->_client;
    v16->_client = (NIServerClientPublisher *)v17;

    objc_storeStrong((id *)&v16->_connection, a5);
    uint64_t v19 = [v12 _queue];
    connectionQueue = v16->_connectionQueue;
    v16->_connectionQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = objc_opt_new();
    sessionIdentifier = v16->_sessionIdentifier;
    v16->_sessionIdentifier = (NSUUID *)v21;

    objc_storeStrong((id *)&v16->_signingIdentity, a4->var0);
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = 0;

    v16->_pid = a4->var1;
    *(void *)v16->_clientEntitlementsArray.__elems_ = 0;
    v16->_clientEntitlementsArray.__elems_[8] = 0;
    objc_storeStrong((id *)&v16->_authManager, a6);
    v24 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(NIServerSessionContainer *)v16 signingIdentity];
      unsigned int v26 = [(NIServerSessionContainer *)v16 pid];
      v27 = v16->_sessionIdentifier;
      *(_DWORD *)buf = 138412802;
      v38 = v25;
      __int16 v39 = 1024;
      unsigned int v40 = v26;
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ses-container,Container init. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
    }
    localDiscoveryToken = v16->_localDiscoveryToken;
    v16->_localDiscoveryToken = 0;

    *(_WORD *)&v16->_latestSessionContainerState = 0;
    v16->_latestBluetoothState = 0;
    v16->_latestAppState = 0;
    v29 = [[NIServerAssertionManager alloc] initWithClientPid:v16->_pid signingIdentity:v16->_signingIdentity sessionIdentifier:v16->_sessionIdentifier];
    assertionManager = v16->_assertionManager;
    v16->_assertionManager = v29;

    v16->_connectedToUwbProvider = 0;
    activationError = v16->_activationError;
    v16->_activationError = 0;

    double v32 = sub_100006C38();
    v16->_initTime = v32;
    v16->_timeOfLatestContainerState = v32;
  }

  return v16;
}

- (void)dealloc
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    signingIdentity = self->_signingIdentity;
    int pid = self->_pid;
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v10 = signingIdentity;
    __int16 v11 = 1024;
    int v12 = pid;
    __int16 v13 = 2112;
    v14 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-container,Container dealloc. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  if (self->_connectedToUwbProvider)
  {
    v7 = [(NIServerSessionContainer *)self uwbProvider];
    [v7 disconnect];

    self->_connectedToUwbProvider = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NIServerSessionContainer;
  [(NIServerSessionContainer *)&v8 dealloc];
}

- (PRUWBServiceProviding)uwbProvider
{
  v9 = self;
  if (!self->_uwbProvider)
  {
    v2 = [PRUWBManagerAgent alloc];
    sub_100056A00(&v9, &v7);
    v3 = [(PRUWBManagerAgent *)v2 initWithClientReference:&v7];
    uwbProvider = v9->_uwbProvider;
    v9->_uwbProvider = v3;

    if (v8) {
      sub_10001A970(v8);
    }
  }
  v5 = v9->_uwbProvider;

  return (PRUWBServiceProviding *)v5;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NIServerBaseSession *)self->_specializedSession description];
  id v7 = [v3 initWithFormat:@"<Session Container %@ running with specialized session: %@>", v5, v6];

  return (NSString *)v7;
}

- (PRWiFiServiceProviding)wifiProvider
{
  wifiProvider = self->_wifiProvider;
  if (!wifiProvider)
  {
    v4 = objc_alloc_init(PRWiFiManagerAgent);
    v5 = self->_wifiProvider;
    self->_wifiProvider = v4;

    wifiProvider = self->_wifiProvider;
  }

  return (PRWiFiServiceProviding *)wifiProvider;
}

- (BOOL)supportsSessionObservers
{
  return [(NIServerBaseSession *)self->_specializedSession supportsSessionObservers];
}

- (BOOL)addObservers:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NIServerBaseSession *)self->_specializedSession supportsSessionObservers];
  if (v5)
  {
    [(NIServerClientPublisher *)self->_client addObservers:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10040EE10();
  }

  return v5;
}

- (BOOL)removeObservers:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NIServerBaseSession *)self->_specializedSession supportsSessionObservers];
  if (v5)
  {
    [(NIServerClientPublisher *)self->_client removeObservers:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10040EE44();
  }

  return v5;
}

- (void)queryDeviceCapabilities:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v11 = 138412802;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    __int16 v15 = 2112;
    v16 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - queryDeviceCapabilities. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v11, 0x1Cu);
  }
  v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  v10 = [(NIServerSessionContainer *)self _getExpandedCapabilities];
  v4[2](v4, v10);
}

- (void)activate:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    double v32 = v6;
    __int16 v33 = 1024;
    int v34 = v7;
    __int16 v35 = 2112;
    objc_super v36 = (const char *)sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - activate. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  [(NIServerSessionContainer *)self _setContainerState:1];
  if (+[NIPlatformInfo isInternalBuild])
  {
    v10 = +[NSUserDefaults standardUserDefaults];
    unsigned int v11 = [v10 BOOLForKey:@"ForceCrash_SessionActivate"];

    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10040EE78();
      }
      v28 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        double v32 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
        __int16 v33 = 1024;
        int v34 = 424;
        __int16 v35 = 2080;
        objc_super v36 = "-[NIServerSessionContainer activate:]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
  }
  int v12 = +[NSNumber numberWithBool:[(NIServerSessionContainer *)self entitlementGranted:0, @"InternalClient"]];
  v30 = v12;
  __int16 v13 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  unsigned int v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

  if ([(NIServerSessionContainer *)self _supportedPlatform])
  {
    __int16 v15 = [(NIServerSessionContainer *)self activationGuard];
    if ([v15 isSessionAllowedToActivate:self])
    {
      v16 = [[NIServerAnalyticsManager alloc] initWithBundleIdentifier:self->_bundleIdentifier];
      analyticsManager = self->_analyticsManager;
      self->_analyticsManager = v16;

      v18 = [(NIServerSessionContainer *)self uwbProvider];
      BOOL v19 = ([v18 deviceCapabilities] & 1) == 0;

      if (!v19)
      {
        v20 = [(NIServerSessionContainer *)self uwbProvider];
        [v20 connect];

        self->_connectedToUwbProvider = 1;
      }
      uint64_t v21 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        double v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-container,activation success. Response: %{private}@", buf, 0xCu);
      }
      [(NIServerSessionContainer *)self _setContainerState:2];
      v4[2](v4, v14, 0);
    }
    else
    {
      uint64_t v25 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5885 userInfo:0];
      activationError = self->_activationError;
      p_activationError = &self->_activationError;
      *p_activationError = (NSError *)v25;

      ((void (**)(id, void *, NSError *))v4)[2](v4, v14, *p_activationError);
    }
  }
  else
  {
    uint64_t v22 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:0];
    v24 = self->_activationError;
    v23 = &self->_activationError;
    *v23 = (NSError *)v22;

    ((void (**)(id, void *, NSError *))v4)[2](v4, v14, *v23);
  }
}

- (void)runWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, NSError *))a4;
  objc_super v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v10 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)v89 = v9;
    *(_WORD *)&v89[8] = 1024;
    *(_DWORD *)&v89[10] = v10;
    *(_WORD *)&v89[14] = 2112;
    *(void *)&v89[16] = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - runWithConfiguration. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  int v12 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v12);

  if ([(NIServerSessionContainer *)self _supportedPlatform])
  {
    if (v6)
    {
      [(NIServerSessionContainer *)self _setContainerState:3];
      if ([v6 _internalOsTransactionRequired] && !self->_osTransaction)
      {
        __int16 v13 = (OS_os_transaction *)os_transaction_create();
        osTransaction = self->_osTransaction;
        self->_osTransaction = v13;
      }
      if (self->_activationError)
      {
        __int16 v15 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10040F130(buf, [(NSError *)self->_activationError code], v15);
        }

        v7[2](v7, self->_activationError);
        goto LABEL_19;
      }
      v18 = [(NIServerSessionContainer *)self uwbProvider];
      unsigned __int8 v19 = [v18 deviceCapabilities];

      v20 = [(NIServerSessionContainer *)self _displayPermissionsPromptIfNeeded];
      if (v20) {
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(NIServerSessionContainer *)self entitlementGranted:4])
        {
LABEL_29:
          uint64_t v21 = (objc_class *)objc_opt_class();
          goto LABEL_30;
        }
        v78 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
        {
          v80 = [(NIServerSessionContainer *)self signingIdentity];
          unsigned int v81 = [(NIServerSessionContainer *)self pid];
          v82 = self->_sessionIdentifier;
          *(_DWORD *)buf = 138412802;
          *(void *)v89 = v80;
          *(_WORD *)&v89[8] = 1024;
          *(_DWORD *)&v89[10] = v81;
          *(_WORD *)&v89[14] = 2112;
          *(void *)&v89[16] = v82;
          _os_log_fault_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_FAULT, "#ses-container,Finding configuration not allowed. Signing identity: %@, pid: %d, session identifier: %@.", buf, 0x1Cu);
        }
        NSErrorUserInfoKey v94 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v95 = @"Finding configuration not allowed.";
        v79 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        v20 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v79];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_29;
        }
        v20 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
      }
      if (v20)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040F0C8();
        }
LABEL_17:
        v7[2](v7, v20);
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v21 = 0;
LABEL_30:
      specializedSession = self->_specializedSession;
      if (specializedSession)
      {
        if ([(NIServerBaseSession *)specializedSession updateConfiguration:v6])
        {
          v23 = qword_1008ABDE0;
          int v24 = 0;
          if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_42;
          }
          *(_WORD *)buf = 0;
          uint64_t v25 = "#ses-container,runWithConfiguration can update previous configuration.";
LABEL_37:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
          int v24 = 0;
          goto LABEL_42;
        }
        unsigned int v26 = [(NIServerBaseSession *)self->_specializedSession lastConfiguration];
        unsigned int v27 = [v26 isEqual:v6];

        v23 = qword_1008ABDE0;
        if (v27)
        {
          int v24 = 0;
          if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_42;
          }
          *(_WORD *)buf = 0;
          uint64_t v25 = "#ses-container,runWithConfiguration with previously run configuration.";
          goto LABEL_37;
        }
        v28 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [(NIServerBaseSession *)self->_specializedSession lastConfiguration];
          *(_DWORD *)buf = 138412546;
          *(void *)v89 = v29;
          *(_WORD *)&v89[8] = 2112;
          *(void *)&v89[10] = v6;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ses-container,Existing session with different config.\nCurrent:%@\nNew:%@", buf, 0x16u);
        }
      }
      int v24 = 1;
LABEL_42:
      v30 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [(NIServerSessionContainer *)self signingIdentity];
        unsigned int v32 = [(NIServerSessionContainer *)self pid];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v89 = v24;
        *(_WORD *)&v89[4] = 2112;
        *(void *)&v89[6] = v31;
        *(_WORD *)&v89[14] = 1024;
        *(_DWORD *)&v89[16] = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-container,Creating a new session: %d, Signing identity: %@, pid: %d.", buf, 0x18u);
      }
      if (v24)
      {
        [(NIServerBaseSession *)self->_specializedSession invalidate];
        lifeCycleManager = self->_lifeCycleManager;
        self->_lifeCycleManager = 0;

        int v34 = self->_specializedSession;
        self->_specializedSession = 0;

        sub_100056AD4(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_);
        id v87 = 0;
        __int16 v35 = (NIServerBaseSession *)[[v21 alloc] initWithResourcesManager:self configuration:v6 error:&v87];
        v20 = (NSError *)v87;
        objc_super v36 = self->_specializedSession;
        self->_specializedSession = v35;

        if (v20)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10040F060();
          }
          v7[2](v7, v20);
          goto LABEL_18;
        }
        objc_initWeak((id *)buf, self);
        v37 = self->_specializedSession;
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_10004C604;
        v85[3] = &unk_100846110;
        objc_copyWeak(&v86, (id *)buf);
        [(NIServerBaseSession *)v37 setInvalidationHandler:v85];
        v38 = self->_specializedSession;
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = sub_10004C678;
        v83[3] = &unk_100847538;
        objc_copyWeak(&v84, (id *)buf);
        [(NIServerBaseSession *)v38 setBackgroundSupportUpdateHandler:v83];
        __int16 v39 = [[NIServerSessionLifeCycleManager alloc] initWithSessionIdentifier:self->_sessionIdentifier cycleRate:[(NIServerBaseSession *)self->_specializedSession nominalCycleRate] updatesQueue:self->_connectionQueue analyticsManager:self->_analyticsManager];
        unsigned int v40 = self->_lifeCycleManager;
        self->_lifeCycleManager = v39;

        [(NIServerSessionLifeCycleManager *)self->_lifeCycleManager addObserver:self->_specializedSession];
        __int16 v41 = self->_specializedSession;
        v42 = (void *)voucher_copy();
        [(NIServerBaseSession *)v41 setClientVoucher:v42];

        if (v19)
        {
          v43 = [(NIServerSessionContainer *)self uwbProvider];
          [v43 requestAsyncServiceStatusUpdate];
        }
        [(NIServerSessionContainer *)self _handleSpecializedSessionBackgroundSupportUpdate:[(NIServerBaseSession *)self->_specializedSession supportsBackgroundedClients]];
        objc_destroyWeak(&v84);
        objc_destroyWeak(&v86);
        objc_destroyWeak((id *)buf);
      }
      unint64_t v44 = [(NIServerBaseSession *)self->_specializedSession requiresUWBToRun];
      unint64_t v45 = [(NIServerBaseSession *)self->_specializedSession requiresNarrowbandToRun];
      if (v45 == 2 && v44 != 2) {
        __assert_rtn("-[NIServerSessionContainer runWithConfiguration:reply:]", "NIServerSessionContainer.mm", 685, "requiresUWBToRun");
      }
      if (v44 == 2)
      {
        v46 = [(NIServerSessionContainer *)self uwbProvider];
        unint64_t v47 = (unint64_t)[v46 currentServiceState];

        BOOL v48 = v47 == 1;
        if (v45 != 2) {
          BOOL v48 = (v47 - 1) < 2;
        }
        if (!v48)
        {
          v49 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
          {
            v74 = self->_sessionIdentifier;
            CFStringRef v75 = @"NO";
            *(_DWORD *)buf = 138413314;
            if (v45 == 2) {
              CFStringRef v76 = @"YES";
            }
            else {
              CFStringRef v76 = @"NO";
            }
            *(void *)v89 = v74;
            *(_WORD *)&v89[8] = 2112;
            if ((v47 - 1) >= 2) {
              CFStringRef v77 = @"NO";
            }
            else {
              CFStringRef v77 = @"YES";
            }
            *(void *)&v89[10] = @"YES";
            if (v47 == 1) {
              CFStringRef v75 = @"YES";
            }
            *(_WORD *)&v89[18] = 2112;
            *(void *)&v89[20] = v76;
            __int16 v90 = 2112;
            CFStringRef v91 = v77;
            __int16 v92 = 2112;
            CFStringRef v93 = v75;
            _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#ses-container,Specialized session %@, requires UWB: %@, requires NB: %@, UWB available: %@, NB available: %@", buf, 0x34u);
          }
          v20 = [(NIServerSessionContainer *)self _fatalErrorForUwbServiceState:v47 cause:HIDWORD(v47)];
          if (!v20)
          {
            if (!-[NIServerSessionContainer _updateInterruptionForUWBServiceState:cause:requiresNarrowBand:](self, "_updateInterruptionForUWBServiceState:cause:requiresNarrowBand:", v47, HIDWORD(v47), v45 == 2))__assert_rtn("-[NIServerSessionContainer runWithConfiguration:reply:]", "NIServerSessionContainer.mm", 732, "false"); {
            v7[2](v7, 0);
            }
            v20 = 0;
            goto LABEL_18;
          }
          goto LABEL_71;
        }
      }
      if ([(NIServerBaseSession *)self->_specializedSession requiresSpatialInteractionBluetoothResource])
      {
        [(NIServerSessionContainer *)self _activateBluetoothResource];
      }
      v20 = [(NIServerBaseSession *)self->_specializedSession configure];
      if (v20)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040EFF8();
        }
LABEL_71:
        v7[2](v7, v20);
        goto LABEL_18;
      }
      if (![(NIServerBaseSession *)self->_specializedSession supportsCameraAssistance]
        && [v6 _internalIsCameraAssistanceEnabled])
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040EF80();
        }
        v20 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
        ((void (*)(void (**)(id, NSError *)))v7[2])(v7);
        goto LABEL_18;
      }
      if ([(NIServerBaseSession *)self->_specializedSession supportsSessionObservers])
      {
        v50 = [(NIServerSessionContainer *)self observationRegistrar];
        [v50 registerObserversForSession:self];
      }
      if ([v6 _internalIsCameraAssistanceEnabled])
      {
        v51 = +[NIServerVisionDataDistributor sharedProvider];
        [v51 registerForVisionInput:self->_specializedSession];
      }
      if (![(NIServerBaseSession *)self->_specializedSession supportsDevicePresence])
      {
LABEL_85:
        v20 = [(NIServerBaseSession *)self->_specializedSession run];
        if (v20)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10040EF18();
          }
          v57 = +[NIServerVisionDataDistributor sharedProvider];
          [v57 unregisterForVisionInput:self->_specializedSession];

          v58 = [(NIServerSessionContainer *)self devicePresenceResource];
          v59 = [v58 internalObserver];
          [v59 stopLeechingForConsumer:self];

          v60 = [(NIServerSessionContainer *)self devicePresenceResource];
          v61 = [v60 internalObserver];
          [v61 unregisterForInternalBluetoothSamples:self];

          v7[2](v7, v20);
          goto LABEL_18;
        }
        [(NIServerSessionContainer *)self _setContainerState:4];
        v7[2](v7, 0);
        id v62 = kTCCServiceNearbyInteraction;
        connection = self->_connection;
        if (connection) {
          [(NSXPCConnection *)connection auditToken];
        }
        v64 = PAAuthenticatedClientIdentity();
        if (v64)
        {
          id v65 = [objc_alloc((Class)PAApplication) initWithTCCIdentity:v64];
          if (v65)
          {
            v66 = +[PATCCAccess accessWithAccessor:v65 forService:v62];
            if (v66)
            {
              v67 = +[PAAccessLogger sharedInstance];
              v68 = [v67 beginIntervalForAccess:v66];
              paAccessInterval = self->_paAccessInterval;
              self->_paAccessInterval = v68;

              goto LABEL_97;
            }
          }
        }
        else
        {
          id v65 = 0;
        }
        v66 = 0;
        v67 = self->_paAccessInterval;
        self->_paAccessInterval = 0;
LABEL_97:

        if ([v6 _internalIsCameraAssistanceEnabled]
          && ([v6 _internalIsCameraAssistanceInClientProcess] & 1) == 0)
        {
          v70 = [NIServerVisionInternalSessionRequest alloc];
          v71 = [(NSUUID *)self->_sessionIdentifier UUIDString];
          v72 = [(NIServerVisionInternalSessionRequest *)v70 initWithIdentifier:v71 observer:self];
          visionSessionRequest = self->_visionSessionRequest;
          self->_visionSessionRequest = v72;

          [(NIServerVisionInternalSessionRequest *)self->_visionSessionRequest activate];
        }
        [(NIServerAnalyticsManager *)self->_analyticsManager sessionSuccessfullyRanWithConfig:v6 withTimestamp:sub_100006C38()];

        v20 = 0;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v52 = v6;
        v53 = [v52 token];
        BOOL v54 = v53 == 0;

        if (!v54)
        {
          v55 = [(NIServerSessionContainer *)self devicePresenceResource];
          v56 = [v55 internalObserver];
          [v56 registerForInternalBluetoothSamples:self reportCache:0];

LABEL_84:
          goto LABEL_85;
        }
      }
      id v52 = [(NIServerSessionContainer *)self devicePresenceResource];
      v55 = [v52 internalObserver];
      [v55 registerForInternalBluetoothSamples:self];
      goto LABEL_84;
    }
    uint64_t v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v7[2](v7, v17);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
  else
  {
    v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:0];
    v7[2](v7, v16);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F178();
    }
  }
LABEL_19:
}

- (void)pause:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v15 = 138412802;
    v16 = v6;
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    __int16 v19 = 2112;
    v20 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - pause. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v15, 0x1Cu);
  }
  v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  if ([(NIServerSessionContainer *)self _supportedPlatform])
  {
    if (self->_specializedSession)
    {
      [(NIServerSessionContainer *)self _setContainerState:5];
      paAccessInterval = self->_paAccessInterval;
      if (paAccessInterval)
      {
        [(PAAccessInterval *)paAccessInterval end];
        unsigned int v11 = self->_paAccessInterval;
        self->_paAccessInterval = 0;
      }
      [(NIServerAnalyticsManager *)self->_analyticsManager sessionPausedWithTimestamp:sub_100006C38()];
      [(NIServerBaseSession *)self->_specializedSession setClientVoucher:0];
      int v12 = [(NIServerBaseSession *)self->_specializedSession pauseWithSource:1];
      if (!v12) {
        [(NIServerSessionContainer *)self _setContainerState:6];
      }
      v4[2](v4, v12);
    }
    else
    {
      unsigned int v14 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
      v4[2](v4, v14);

      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040EEAC();
      }
    }
  }
  else
  {
    __int16 v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:0];
    v4[2](v4, v13);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F178();
    }
  }
}

- (void)generateDiscoveryToken
{
  id v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v5 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138412802;
    v9 = v4;
    __int16 v10 = 1024;
    unsigned int v11 = v5;
    __int16 v12 = 2112;
    __int16 v13 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - generateDiscoveryToken. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v8, 0x1Cu);
  }
  unsigned int v7 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v7);

  [(NIServerSessionContainer *)self _activateBluetoothResource];
}

- (void)notifySystemShutdownWithReason:(int64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, int64_t))a4;
  unsigned int v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v9 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    int v24 = v8;
    __int16 v25 = 1024;
    unsigned int v26 = v9;
    __int16 v27 = 2112;
    v28 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - notifySystemShutdownWithReason. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  if ([(NIServerSessionContainer *)self entitlementGranted:6])
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if (a3)
      {
        NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
        CFStringRef v20 = @"Invalid reason.";
        unsigned int v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        a3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v14];
      }
    }
    else
    {
      unsigned int v11 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-container,#shutdown STARTING non-user shutdown tasks", buf, 2u);
      }
      __int16 v12 = sub_1002F6464();
      if (sub_1002F66E0((uint64_t)v12))
      {
        a3 = 0;
      }
      else
      {
        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        CFStringRef v18 = @"Shutdown operation failed.";
        int v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        a3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v15];
      }
      v16 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-container,#shutdown FINISHED non-user shutdown tasks", buf, 2u);
      }
    }
    v6[2](v6, a3);
  }
  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"Operation disallowed.";
    a3 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    __int16 v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:a3];
    v6[2](v6, (int64_t)v13);
  }
}

- (void)_provideTruthTag:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v10 = 138412802;
    unsigned int v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    __int16 v14 = 2112;
    int v15 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _provideTruthTag. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v10, 0x1Cu);
  }
  unsigned int v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  sub_100057A44(v4);
}

- (void)_addObject:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  int v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v10 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v17 = 138412802;
    CFStringRef v18 = v9;
    __int16 v19 = 1024;
    unsigned int v20 = v10;
    __int16 v21 = 2112;
    CFStringRef v22 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _addObject. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v17, 0x1Cu);
  }
  __int16 v12 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v12);

  if ([(NIServerSessionContainer *)self _supportedPlatform])
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      __int16 v14 = [(NIServerBaseSession *)specializedSession addObject:v6];
      v7[2](v7, v14);
    }
    else
    {
      v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
      v7[2](v7, v16);

      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040EEAC();
      }
    }
  }
  else
  {
    int v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:0];
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F178();
    }
  }
}

- (void)_removeObject:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  int v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v10 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v17 = 138412802;
    CFStringRef v18 = v9;
    __int16 v19 = 1024;
    unsigned int v20 = v10;
    __int16 v21 = 2112;
    CFStringRef v22 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _removeObject. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v17, 0x1Cu);
  }
  __int16 v12 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v12);

  if ([(NIServerSessionContainer *)self _supportedPlatform])
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      __int16 v14 = [(NIServerBaseSession *)specializedSession removeObject:v6];
      v7[2](v7, v14);
    }
    else
    {
      v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
      v7[2](v7, v16);

      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040EEAC();
      }
    }
  }
  else
  {
    int v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:0];
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F178();
    }
  }
}

- (void)isPreciseRangingAllowed:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v11 = 138412802;
    __int16 v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    __int16 v15 = 2112;
    v16 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - isPreciseRangingAllowed. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v11, 0x1Cu);
  }
  unsigned int v9 = sub_1002F6464();
  uint64_t v10 = (*(uint64_t (**)(void *))(*(void *)v9 + 152))(v9);
  v4[2](v4, v10, 0);
}

- (void)isExtendedDistanceMeasurementAllowed:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v12 = 138412802;
    __int16 v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    int v17 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - isExtendedDistanceMeasurementAllowed. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v12, 0x1Cu);
  }
  unsigned int v9 = sub_1002F6464();
  if ((*(unsigned int (**)(void *))(*(void *)v9 + 152))(v9))
  {
    uint64_t v10 = sub_1002F6464();
    uint64_t v11 = (*(uint64_t (**)(void *))(*(void *)v10 + 160))(v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  v4[2](v4, v11, 0);
}

- (void)processDCKMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void, void *))a4;
  int v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v10 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v27 = 138412802;
    v28 = v9;
    __int16 v29 = 1024;
    unsigned int v30 = v10;
    __int16 v31 = 2112;
    unsigned int v32 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processDCKMessage. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v27, 0x1Cu);
  }
  int v12 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v12);

  if (self->_interruptionsMap.__table_.__p2_.__value_)
  {
    __int16 v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10014 userInfo:0];
    v7[2](v7, 0, v13);

    __int16 v14 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F1E4(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    [(NIServerSessionContainer *)self _dumpInterruptionsMapWithDebugString:@"processDCKMessage"];
  }
  else
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      id v23 = [(NIServerBaseSession *)specializedSession processDCKMessage:v6];
      __int16 v25 = v24;
      ((void (**)(id, id, void *))v7)[2](v7, v23, v24);
    }
    else
    {
      unsigned int v26 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
      v7[2](v7, 0, v26);

      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040EEAC();
      }
    }
  }
}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 reply:(id)a6
{
  unsigned int v10 = (void (**)(id, id, void *))a6;
  uint64_t v11 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v13 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    __int16 v33 = v12;
    __int16 v34 = 1024;
    unsigned int v35 = v13;
    __int16 v36 = 2112;
    v37 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processBluetoothHostTimeSyncWithType. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  uint64_t v15 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v15);

  double v16 = sub_100006C38();
  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    id v29 = 0;
    uint64_t v18 = [(NIServerBaseSession *)specializedSession processBluetoothHostTimeSyncWithType:a3 btcClockTicks:a4 eventCounter:a5 monotonicTimeSec:&v29 response:v16];
    id v19 = v29;
    v10[2](v10, v19, v18);
  }
  else
  {
    uint64_t v20 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F258(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"processBluetoothHostTimeSyncWithType called before -runWithConfiguration:";
    v28 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v28];

    v10[2](v10, 0, v18);
  }
}

- (void)isRangingLimitExceeded:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v17 = 138412802;
    uint64_t v18 = v6;
    __int16 v19 = 1024;
    unsigned int v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - isRangingLimitExceeded. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v17, 0x1Cu);
  }
  unsigned int v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    id v11 = [(NIServerBaseSession *)specializedSession isRangingLimitExceeded];
    int v12 = v11;
    __int16 v14 = v13;
    if (v11) {
      id v15 = [v11 BOOLValue];
    }
    else {
      id v15 = 0;
    }
    v4[2](v4, v15, v14);
  }
  else
  {
    double v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v4[2](v4, 0, v16);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
}

- (void)deleteURSKs:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v13 = 138412802;
    __int16 v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - deleteURSKs. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v13, 0x1Cu);
  }
  unsigned int v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    id v11 = [(NIServerBaseSession *)specializedSession deleteURSKs];
    v4[2](v4, v11);
  }
  else
  {
    int v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v4[2](v4, v12);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
}

- (void)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v9 = (void (**)(id, void *))a5;
  unsigned int v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v12 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v27 = 138412802;
    v28 = v11;
    __int16 v29 = 1024;
    unsigned int v30 = v12;
    __int16 v31 = 2112;
    unsigned int v32 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _setDebugURSK. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v27, 0x1Cu);
  }
  __int16 v14 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v14);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    if (v8)
    {
      unsigned int v16 = [(NIServerBaseSession *)specializedSession _setDebugURSK:v8 transactionIdentifier:v6];
      v9[2](v9, v16);
    }
    else
    {
      uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19886 userInfo:0];
      v9[2](v9, v18);

      __int16 v19 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040F2D0(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  else
  {
    __int16 v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v9[2](v9, v17);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
}

- (void)_setURSKTTL:(unint64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  unsigned int v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v9 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v15 = 138412802;
    unsigned int v16 = v8;
    __int16 v17 = 1024;
    unsigned int v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _setURSKTTL. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v15, 0x1Cu);
  }
  id v11 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v11);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    int v13 = [(NIServerBaseSession *)specializedSession _setURSKTTL:a3];
    v6[2](v6, v13);
  }
  else
  {
    __int16 v14 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v6[2](v6, v14);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
}

- (void)_processCarKeyEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v10 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v16 = 138412802;
    __int16 v17 = v9;
    __int16 v18 = 1024;
    unsigned int v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _processCarKeyEvent. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v16, 0x1Cu);
  }
  unsigned int v12 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v12);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    __int16 v14 = [(NIServerBaseSession *)specializedSession _processCarKeyEvent:v6];
    v7[2](v7, v14);
  }
  else
  {
    int v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
}

- (id)canHandleAcwgMsg:(id)a3
{
  id v4 = a3;
  if (self->_interruptionsMap.__table_.__p2_.__value_)
  {
    unsigned int v5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10014 userInfo:0];
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F3B4();
    }
    [(NIServerSessionContainer *)self _dumpInterruptionsMapWithDebugString:v4];
  }
  else if (self->_specializedSession)
  {
    unsigned int v5 = 0;
  }
  else
  {
    unsigned int v5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F344();
    }
  }

  return v5;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v9 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    int v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    __int16 v18 = 2112;
    unsigned int v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processAcwgM1Msg. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);
  }
  id v11 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = [(NIServerSessionContainer *)self canHandleAcwgMsg:@"processAcwgM1Msg"];
  if (v12)
  {
    int v13 = [(NIServerSessionContainer *)self remote];
    [v13 didProcessAcwgM1MsgWithResponse:0 error:v12];
  }
  else
  {
    [(NIServerBaseSession *)self->_specializedSession processAcwgM1Msg:v6 withSessionTriggerReason:a4];
  }
}

- (void)processAcwgM3Msg:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v12 = 138412802;
    int v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    unsigned int v17 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processAcwgM3Msg. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v12, 0x1Cu);
  }
  unsigned int v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = [(NIServerSessionContainer *)self canHandleAcwgMsg:@"processAcwgM3Msg"];
  if (v10)
  {
    id v11 = [(NIServerSessionContainer *)self remote];
    [v11 didProcessAcwgM3MsgWithResponse:0 error:v10];
  }
  else
  {
    [(NIServerBaseSession *)self->_specializedSession processAcwgM3Msg:v4];
  }
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v9 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    unsigned int v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    __int16 v18 = 2112;
    unsigned int v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - suspendAcwgRanging. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);
  }
  id v11 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v11);

  int v12 = [(NIServerSessionContainer *)self canHandleAcwgMsg:@"suspendAcwgRanging"];
  if (v12)
  {
    int v13 = [(NIServerSessionContainer *)self remote];
    [v13 uwbSessionDidFailWithError:v12];
  }
  else
  {
    [(NIServerBaseSession *)self->_specializedSession suspendAcwgRanging:v5 withSuspendTriggerReason:a4];
  }
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v9 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    unsigned int v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    __int16 v18 = 2112;
    unsigned int v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processAcwgRangingSessionResumeRequestMsg. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);
  }
  id v11 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v11);

  int v12 = [(NIServerSessionContainer *)self canHandleAcwgMsg:@"processAcwgRangingSessionResumeRequestMsg"];
  if (v12)
  {
    int v13 = [(NIServerSessionContainer *)self remote];
    [v13 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:0 error:v12];
  }
  else
  {
    [(NIServerBaseSession *)self->_specializedSession processAcwgRangingSessionResumeRequestMsg:v5 withResumeTriggerReason:a4];
  }
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v12 = 138412802;
    int v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    unsigned int v17 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - prefetchAcwgUrsk. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v12, 0x1Cu);
  }
  unsigned int v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = [(NIServerSessionContainer *)self canHandleAcwgMsg:@"prefetchAcwgUrsk"];
  if (v10)
  {
    id v11 = [(NIServerSessionContainer *)self remote];
    [v11 didPrefetchAcwgUrsk:v3 error:v10];
  }
  else
  {
    [(NIServerBaseSession *)self->_specializedSession prefetchAcwgUrsk:v3];
  }
}

- (void)processUpdatedLockState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v11 = 138412802;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - notifyLockStatusChanged/processUpdatedLockState. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v11, 0x1Cu);
  }
  unsigned int v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = [(NIServerSessionContainer *)self canHandleAcwgMsg:@"notifyLockStatusChanged/processUpdatedLockState"];
  if (!v10) {
    [(NIServerBaseSession *)self->_specializedSession processUpdatedLockState:v3];
  }
}

- (void)_processBluetoothSample:(id)a3
{
  id v6 = a3;
  id v4 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(NIServerSessionContainer *)self devicePresenceResource];
  [v5 consumeBluetoothSample:v6];
}

- (void)processVisionInput:(id)a3
{
  id v6 = a3;
  id v4 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = +[NIServerVisionDataDistributor sharedProvider];
  [v5 processVisionInput:v6];
}

- (void)arSessionDidFailWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [v8 userInfo];
  id v6 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10010 userInfo:v5];

  [(NIServerBaseSession *)self->_specializedSession invalidate];
  unsigned int v7 = [(NIServerSessionContainer *)self remote];
  [v7 uwbSessionDidFailWithError:v6];
}

- (void)arSessionWasInterrupted
{
  uint64_t v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = sub_100006C38();

  [(NIServerSessionContainer *)self interruptSessionWithReason:6 monotonicTimeSeconds:v4];
}

- (void)arSessionInterruptionEnded
{
  uint64_t v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = sub_100006C38();

  [(NIServerSessionContainer *)self interruptionReasonEnded:6 monotonicTimeSeconds:v4];
}

- (void)arSessionWillRunWithInvalidConfiguration
{
  id v4 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5883 userInfo:0];
  [(NIServerBaseSession *)self->_specializedSession invalidate];
  uint64_t v3 = [(NIServerSessionContainer *)self remote];
  [v3 uwbSessionDidFailWithError:v4];
}

- (void)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v12 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - setLocalDeviceCanInteract:withDiscoveryTokens:. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  unsigned int v14 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = "NO";
    if (v6) {
      __int16 v15 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-container,canInteract: %s", buf, 0xCu);
  }
  __int16 v16 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v16);

  LOBYTE(v16) = [(NIServerSessionContainer *)self entitlementGranted:3];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_10004FAB0;
  unsigned int v32 = sub_10004FAC0;
  id v33 = (id)objc_opt_new();
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  uint64_t v25 = sub_10004FAC8;
  uint64_t v26 = &unk_100847560;
  char v30 = (char)v16;
  id v17 = v9;
  int v27 = self;
  id v28 = v17;
  __int16 v29 = buf;
  [v8 enumerateObjectsUsingBlock:&v23];
  if (+[NIPlatformInfo isInternalBuild]) {
    sub_1002E1D64(*(void **)(*(void *)&buf[8] + 40));
  }
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    +[NIServerFindableDeviceProxySessionManager sharedInstance];
    if (v6) {
      __int16 v18 = {;
    }
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      __int16 v20 = [(NIServerSessionContainer *)self processNameBestGuess];
      [v18 startBeingFindableWithDiscoveryTokens:v19 tokenGroup:v20];
    }
    else {
      __int16 v18 = {;
    }
      uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
      __int16 v20 = [(NIServerSessionContainer *)self processNameBestGuess];
      [v18 stopBeingFindableWithDiscoveryTokens:v22 tokenGroup:v20];
    uint64_t v21 = };
  }
  else
  {
    uint64_t v21 = 0;
  }
  (*((void (**)(id, void *))v17 + 2))(v17, v21);

  _Block_object_dispose(buf, 8);
}

- (void)setLocalDeviceInteractableDiscoveryTokens:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v10 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - setLocalDeviceInteractableDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  unsigned int v12 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v12);

  LOBYTE(v12) = [(NIServerSessionContainer *)self entitlementGranted:3];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_10004FAB0;
  int v27 = sub_10004FAC0;
  id v28 = (id)objc_opt_new();
  __int16 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  __int16 v20 = sub_10004FFA8;
  uint64_t v21 = &unk_100847560;
  char v25 = (char)v12;
  id v13 = v7;
  uint64_t v22 = self;
  id v23 = v13;
  uint64_t v24 = buf;
  [v6 enumerateObjectsUsingBlock:&v18];
  if (+[NIPlatformInfo isInternalBuild]) {
    sub_1002E1D64(*(void **)(*(void *)&buf[8] + 40));
  }
  unsigned int v14 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
  uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
  __int16 v16 = [(NIServerSessionContainer *)self processNameBestGuess];
  id v17 = [v14 setFindableDiscoveryTokens:v15 tokenGroup:v16];

  (*((void (**)(id, void *))v13 + 2))(v13, v17);
  _Block_object_dispose(buf, 8);
}

- (void)setLocalDeviceDebugParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSObject *))a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v10 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    __int16 v20 = v9;
    __int16 v21 = 1024;
    unsigned int v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - setLocalDeviceDebugParameters:reply:. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  unsigned int v12 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v12);

  if ([(NIServerSessionContainer *)self entitlementGranted:3])
  {
    id v13 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
    unsigned int v14 = [v13 setLocalDeviceDebugParameters:v6];

    v7[2](v7, v14);
  }
  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v18 = @"Not allowed to configure findable local device.";
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    __int16 v16 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v15];
    v7[2](v7, v16);

    unsigned int v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      [(NIServerSessionContainer *)self signingIdentity];
      objc_claimAutoreleasedReturnValue();
      [(NIServerSessionContainer *)self pid];
      sub_10040F424();
    }
  }
}

- (void)getInteractableDiscoveryTokens:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - getInteractableDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);
  }
  id v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = objc_opt_new();
  if ([(NIServerSessionContainer *)self entitlementGranted:3])
  {
    int v11 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
    unsigned int v12 = [(NIServerSessionContainer *)self processNameBestGuess];
    id v13 = [v11 findableDiscoveryTokensForGroup:v12];

    [v10 addObjectsFromArray:v13];
  }
  v4[2](v4, v10, 0);
}

- (void)getActivelyInteractingDiscoveryTokens:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - getActivelyInteractingDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);
  }
  id v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = objc_opt_new();
  if ([(NIServerSessionContainer *)self entitlementGranted:3])
  {
    int v11 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
    unsigned int v12 = [(NIServerSessionContainer *)self processNameBestGuess];
    id v13 = [v11 interactingFinderDiscoveryTokensForGroup:v12];

    [v10 addObjectsFromArray:v13];
  }
  v4[2](v4, v10, 0);
}

- (void)getLocalDevicePrintableState:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v7 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v6;
    __int16 v20 = 1024;
    unsigned int v21 = v7;
    __int16 v22 = 2112;
    __int16 v23 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - getLocalDevicePrintableState. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  id v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  if (![(NIServerSessionContainer *)self entitlementGranted:0])
  {
    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v17 = @"Not allowed to get local device state.";
    unsigned int v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    int v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];

    v4[2](v4, 0, v11);
  }
  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100050AF4;
  v13[3] = &unk_100847588;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v4;
  unsigned int v12 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_processFindingEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v14 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v16 = 138412802;
    CFStringRef v17 = v13;
    __int16 v18 = 1024;
    unsigned int v19 = v14;
    __int16 v20 = 2112;
    unsigned int v21 = sessionIdentifier;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ses-container,XPC Command - _processFindingEvent. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v16, 0x1Cu);
  }
  id v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    int v11 = [(NIServerBaseSession *)specializedSession _processFindingEvent:v6];
    v7[2](v7, v11);
  }
  else
  {
    unsigned int v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v7[2](v7, v12);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
}

- (void)_processSystemEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v14 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    int v16 = 138412802;
    CFStringRef v17 = v13;
    __int16 v18 = 1024;
    unsigned int v19 = v14;
    __int16 v20 = 2112;
    unsigned int v21 = sessionIdentifier;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ses-container,XPC Command - _processSystemEvent. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v16, 0x1Cu);
  }
  id v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    int v11 = [(NIServerBaseSession *)specializedSession _processSystemEvent:v6];
    v7[2](v7, v11);
  }
  else
  {
    unsigned int v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    v7[2](v7, v12);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EEAC();
    }
  }
}

- (void)consumeBluetoothSample:(id)a3
{
}

- (BOOL)supportsDevicePresence
{
  return [(NIServerBaseSession *)self->_specializedSession supportsDevicePresence];
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  return [(NIServerBaseSession *)self->_specializedSession isInterestedInSamplesForDevice:a3];
}

- (BOOL)isInteresetedInSample:(id)a3
{
  return [(NIServerBaseSession *)self->_specializedSession isInteresetedInSample:a3];
}

- (id)getQueueForInputingData
{
  return [(NIServerBaseSession *)self->_specializedSession getQueueForInputingData];
}

- (void)_activateBluetoothResource
{
  if (!self->_bleProvider)
  {
    if (!self->_bleProviderSessionIRK)
    {
      NSRandomData();
      uint64_t v3 = (NSData *)objc_claimAutoreleasedReturnValue();
      bleProviderSessionIRK = self->_bleProviderSessionIRK;
      self->_bleProviderSessionIRK = v3;
    }
    if (!self->_bleProviderSessionIdentifier)
    {
      NSRandomData();
      uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      bleProviderSessionIdentifier = self->_bleProviderSessionIdentifier;
      self->_bleProviderSessionIdentifier = v5;
    }
    unsigned int v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,Activating Bluetooth resource", v20, 2u);
    }
    id v8 = (PRBLEDiscoverySession *)objc_opt_new();
    bleProvider = self->_bleProvider;
    self->_bleProvider = v8;

    unsigned int v10 = [(NIServerSessionContainer *)self uwbProvider];
    unsigned __int8 v11 = [v10 deviceCapabilities];

    unsigned int v12 = [(NIServerSessionContainer *)self wifiProvider];
    if ([v12 deviceCapabilities]) {
      unsigned int v13 = [(NIServerSessionContainer *)self entitlementGranted:2];
    }
    else {
      unsigned int v13 = 0;
    }

    unsigned int v14 = self->_bleProvider;
    id v15 = [(NIServerSessionContainer *)self connectionQueue];
    int v16 = self->_bleProviderSessionIRK;
    CFStringRef v17 = self->_bleProviderSessionIdentifier;
    uint64_t v18 = [(NIServerSessionContainer *)self _getDiscoveryTokenFlags];
    uint64_t v19 = 256;
    if (!v13) {
      uint64_t v19 = 0;
    }
    [(PRBLEDiscoverySession *)v14 activateWithDelegate:self delegateQueue:v15 sessionIRK:v16 sessionIdentifier:v17 controlFlags:v19 | v11 & 1 tokenFlags:v18];
  }
}

- (unsigned)_getDiscoveryTokenFlags
{
  unsigned int v3 = [(NIServerSessionContainer *)self longRangeEnabled];
  if ([(NIServerSessionContainer *)self requiresBiasCorrection]) {
    v3 |= 2u;
  }
  if ([(NIServerSessionContainer *)self requiresLargeRegions]) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

- (id)_augmentDiscoveryToken:(id)a3 withHomeAnchorVariant:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if (v5)
  {
    unsigned int v10 = &off_100878610;
    id v6 = +[NSNumber numberWithUnsignedInt:v4];
    unsigned __int8 v11 = v6;
    unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    id v8 = sub_1002B7FA0(v7, v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NIServerSessionContainer *)self discoveryToken];
    id v6 = +[NSUserDefaults standardUserDefaults];
    unsigned int v7 = [v6 objectForKey:@"FindingNapChannel"];

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      LOBYTE(v8) = [v7 intValue];
      id v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-container,Using NAP channel %d from defaults writes", buf, 8u);
      }
    }
    else
    {
      unsigned int v10 = [v5 getIRK];
      if (!v10) {
        __assert_rtn("_pickRandomNbUwbAcquisitionChannelInGivenRange", "NIServerSessionContainer.mm", 2710, "IRK != nil");
      }
      id v11 = v10;
      [v11 bytes];
      int v8 = SipHash() % 7uLL + 5;
    }
    unsigned int v12 = +[NSNumber numberWithInt:v8];

    int v16 = &off_100878628;
    CFStringRef v17 = v12;
    unsigned int v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    unsigned int v14 = sub_1002B7FA0(v13, v4);
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v14;
}

- (id)_augmentDiscoveryTokenWithDeviceCapabilities:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NIServerSessionContainer *)self _getCapabilities];
    id v6 = [v5 objectForKey:@"UWBSupportedPlatform"];
    id v7 = [v6 BOOLValue];

    int v8 = [v5 objectForKey:@"WifiSupportedPlatform"];
    id v9 = [v8 BOOLValue];

    unsigned int v10 = [v5 objectForKey:@"UWBSupportedPlatformPDOA"];
    id v11 = [v10 BOOLValue];

    unsigned int v12 = [v5 objectForKey:@"UWBSupportedPlatformSyntheticAperture"];
    id v13 = [v12 BOOLValue];

    unsigned int v14 = [v5 objectForKey:@"UWBSupportedPlatformExtendedDistance"];
    id v15 = [v14 BOOLValue];

    int v16 = [[NIDeviceCapabilities alloc] initWithFineRangingSupport:v7 coarseRangingSupport:v9 aoaSupport:v11 extendedDistanceMeasurementSupport:v15 syntheticApertureSupport:v13];
    unsigned int v21 = &off_100878640;
    CFStringRef v17 = +[NSNumber numberWithUnsignedInt:[(NIDeviceCapabilities *)v16 toBitmap]];
    __int16 v22 = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    int v19 = sub_1002B7FA0(v18, v4);
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (void)_handleSpecializedSessionInvalidation:(id)a3
{
  id v4 = a3;
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10040F468((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  objc_initWeak(&location, self);
  unsigned int v12 = [(NIServerSessionContainer *)self connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051B74;
  block[3] = &unk_1008463A0;
  objc_copyWeak(&v16, &location);
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleSpecializedSessionBackgroundSupportUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-container,Specialized session updated background support: %d", (uint8_t *)&buf, 8u);
  }
  if (v3) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = 2;
  }
  self->_specializedSessionBackgroundSupport = v7;
  objc_initWeak(&buf, self);
  uint64_t v8 = [(NIServerSessionContainer *)self connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051D84;
  block[3] = &unk_1008460E8;
  objc_copyWeak(&v10, &buf);
  dispatch_async(v8, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&buf);
}

- (void)_updateClientAppVisibilityInterruption
{
  BOOL v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(NIServerSessionContainer *)self isBackgroundOperationAllowed];
  *(void *)CFStringRef v17 = 0;
  id v5 = sub_100056B3C(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v17);
  if (self->_latestAppState == 3) {
    int v6 = v4 ^ 1;
  }
  else {
    int v6 = 0;
  }
  unsigned __int8 v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NIServerSessionContainer *)self signingIdentity];
    unsigned int v9 = [(NIServerSessionContainer *)self pid];
    sessionIdentifier = self->_sessionIdentifier;
    uint64_t v11 = sub_1001DD31C(self->_latestAppState);
    unsigned int v12 = (void *)v11;
    id v13 = "N";
    *(_DWORD *)CFStringRef v17 = 138413826;
    *(void *)&v17[4] = v8;
    __int16 v18 = 1024;
    if (v6) {
      unsigned int v14 = "Y";
    }
    else {
      unsigned int v14 = "N";
    }
    unsigned int v19 = v9;
    if (v5) {
      id v15 = "Y";
    }
    else {
      id v15 = "N";
    }
    __int16 v20 = 2112;
    if (v4) {
      id v13 = "Y";
    }
    unsigned int v21 = sessionIdentifier;
    __int16 v22 = 2080;
    __int16 v23 = v15;
    __int16 v24 = 2080;
    char v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    __int16 v28 = 2080;
    __int16 v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,Update client visibility interruption. Signing identity: %@, pid: %d, session identifier: %@, already interrupted: %s, should be interrupted now: %s, app state: %@. BG allowed: %s", v17, 0x44u);
  }
  if ((v5 != 0) != v6)
  {
    double v16 = sub_100006C38();
    if (v6) {
      [(NIServerSessionContainer *)self interruptSessionWithReason:0 monotonicTimeSeconds:v16];
    }
    else {
      [(NIServerSessionContainer *)self interruptionReasonEnded:0 monotonicTimeSeconds:v16];
    }
  }
}

- (void)setAppStateMonitor:(id)a3
{
  id v5 = a3;
  int v6 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v6);

  objc_storeStrong((id *)&self->_appStateMonitor, a3);
  [(PRAppStateMonitor *)self->_appStateMonitor addObserver:self];
  self->_latestAppState = [(PRAppStateMonitor *)self->_appStateMonitor currentAppState];
  if ([(PRAppStateMonitor *)self->_appStateMonitor isRunningBoardApp])
  {
    connection = self->_connection;
    if (connection) {
      [(NSXPCConnection *)connection auditToken];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    id v20 = 0;
    uint64_t v11 = +[LSBundleRecord bundleRecordForAuditToken:v21 error:&v20];
    unsigned int v12 = (NSString *)v20;
    id v10 = v12;
    if (!v11 || v12)
    {
      __int16 v18 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040F4D4((uint64_t)self, v18);
      }
      bundleIdentifier = self->_bundleIdentifier;
      self->_bundleIdentifier = 0;
    }
    else
    {
      id v13 = [v11 bundleIdentifier];
      unsigned int v14 = self->_bundleIdentifier;
      self->_bundleIdentifier = v13;

      id v15 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int pid = self->_pid;
        CFStringRef v17 = self->_bundleIdentifier;
        *(_DWORD *)id buf = 67109378;
        int v23 = pid;
        __int16 v24 = 2112;
        char v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-container,Pid %d bundle identifier is %@", buf, 0x12u);
      }
    }
  }
  else
  {
    uint64_t v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_pid;
      *(_DWORD *)id buf = 67109120;
      int v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,Pid %d is not a RunningBoard app. Bundle identifier will be nil", buf, 8u);
    }
    id v10 = self->_bundleIdentifier;
    self->_bundleIdentifier = 0;
  }

  [(NIServerSessionContainer *)self _populateClientEntitlements];
}

- (BOOL)isBackgroundOperationAllowed
{
  BOOL v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  if ([(PRAppStateMonitor *)self->_appStateMonitor isUIBackgroundModeEnabled]
    && self->_specializedSessionBackgroundSupport != 2)
  {
    id v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
      int specializedSessionBackgroundSupport = self->_specializedSessionBackgroundSupport;
      int v13 = 138412546;
      unsigned int v14 = v10;
      __int16 v15 = 1024;
      int v16 = specializedSessionBackgroundSupport;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,BG operation allowed for process %@. Process enables UIBackgroundMode. Specialized session support: %d", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_11;
  }
  unsigned int v4 = [(NIServerSessionContainer *)self entitlementGranted:1];
  id v5 = (id)qword_1008ABDE0;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      unsigned __int8 v7 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
      int v13 = 138412290;
      unsigned int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,BG operation allowed for process %@. Process is granted entitlement", (uint8_t *)&v13, 0xCu);
    }
LABEL_11:
    BOOL v9 = 1;
    goto LABEL_12;
  }
  if (v6)
  {
    uint64_t v8 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
    int v13 = 138412290;
    unsigned int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,BG operation NOT allowed for process %@", (uint8_t *)&v13, 0xCu);
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (void)_acquireClientAssertionIfNecessary
{
  BOOL v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  if (![(PRAppStateMonitor *)self->_appStateMonitor isDaemon]
    && [(PRAppStateMonitor *)self->_appStateMonitor isRunningBoardApp])
  {
    assertionManager = self->_assertionManager;
    [(NIServerAssertionManager *)assertionManager acquireAssertionToSendMessageToClient];
  }
}

- (BOOL)_isClientInternalTool
{
  if (!self->_appStateMonitor)
  {
    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1707 description:@"AppStateMonitor is required for to check if client is internal tool."];
  }
  BOOL v3 = [(NIServerSessionContainer *)self processNameBestGuess];
  if ([&off_1008784A8 containsObject:v3])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
    unsigned __int8 v4 = [&off_1008784C0 containsObject:v5];
  }
  return v4;
}

- (BOOL)_isClientOnGeneralEntitlementAllowlist
{
  if (!self->_appStateMonitor)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1726 description:@"AppStateMonitor is required for to check if client is on general entitlement allowlist."];
  }
  unsigned int v3 = [(NIServerSessionContainer *)self _isClientInternalTool];
  unsigned int v4 = +[NIPlatformInfo isInternalBuild];
  [@"com.apple.nearbyd" UTF8String];
  int v5 = os_variant_allows_internal_security_policies();
  if ([(PRAppStateMonitor *)self->_appStateMonitor isDaemon]) {
    return 1;
  }
  unsigned __int8 v6 = 1;
  if (![(PRAppStateMonitor *)self->_appStateMonitor isXPCService] && (v3 & (v4 | v5) & 1) == 0)
  {
    unsigned __int8 v7 = [(NIServerSessionContainer *)self processNameBestGuess];
    unsigned __int8 v6 = [&off_1008784D8 containsObject:v7];
  }
  return v6;
}

- (BOOL)_isClientOnSystemShutdownAllowlist
{
  if (!self->_appStateMonitor)
  {
    uint64_t v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1757 description:@"AppStateMonitor is required for to check if client is on system shutdown entitlement allowlist."];
  }
  unsigned __int8 v3 = [(NIServerSessionContainer *)self _isClientInternalTool];
  unsigned __int8 v4 = +[NIPlatformInfo isInternalBuild];
  [@"com.apple.nearbyd" UTF8String];
  char v5 = os_variant_allows_internal_security_policies();
  unsigned __int8 v6 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];
  if ([v6 isEqualToString:@"com.apple.SpringBoard"])
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];
    if ([v8 isEqualToString:@"com.apple.Carousel"]) {
      char v7 = 1;
    }
    else {
      char v7 = v3 & (v4 | v5);
    }
  }
  return v7;
}

- (void)_populateClientEntitlements
{
  unsigned __int8 v4 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v4);

  if (!self->_appStateMonitor)
  {
    __int16 v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1774 description:@"AppStateMonitor is required for populating client entitlements."];
  }
  unsigned int v5 = [(NIServerSessionContainer *)self _isClientInternalTool];
  unsigned int v6 = [(NIServerSessionContainer *)self _isClientOnGeneralEntitlementAllowlist];
  unsigned int v28 = [(NIServerSessionContainer *)self _isClientOnSystemShutdownAllowlist];
  char v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NIServerSessionContainer *)self processNameBestGuess];
    bundleIdentifier = self->_bundleIdentifier;
    id v10 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];
    uint64_t v11 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
    unsigned int v12 = [(NIServerSessionContainer *)self signingIdentity];
    *(_DWORD *)id buf = 138414082;
    char v30 = v8;
    __int16 v31 = 2112;
    unsigned int v32 = bundleIdentifier;
    __int16 v33 = 2112;
    *(void *)__int16 v34 = v10;
    *(_WORD *)&v34[8] = 2112;
    *(void *)&v34[10] = v11;
    __int16 v35 = 2112;
    __int16 v36 = v12;
    __int16 v37 = 1024;
    unsigned int v38 = v5;
    __int16 v39 = 1024;
    unsigned int v40 = v6;
    __int16 v41 = 1024;
    unsigned int v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,Populating entitlements for client %@ [bundle ID: %@, job label: %@, monitored name: %@, signing identity: %@, internal flags %d|%d|%d]", buf, 0x46u);
  }
  os_unfair_lock_t lock = &self->_entitlementsLock;
  os_unfair_lock_lock(&self->_entitlementsLock);
  uint64_t v13 = 0;
  self->_clientEntitlementsArray.__elems_[8] = 0;
  *(void *)self->_clientEntitlementsArray.__elems_ = 0;
  do
  {
    if (v13 >= 9) {
      __assert_rtn("_stringForEntitlement", "NIServerSessionContainer.mm", 2742, "false");
    }
    unsigned int v14 = (NSString *)*((void *)&off_1008477C8 + v13);
    __int16 v15 = [(NSXPCConnection *)self->_connection valueForEntitlement:*((void *)&off_100847780 + v13)];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        self->_clientEntitlementsArray.__elems_[v13] = [v15 boolValue];
      }
    }
    BOOL v16 = v6;
    if (v13 >= 3)
    {
      BOOL v16 = v6;
      if (v13 != 5)
      {
        if (v13 != 6) {
          goto LABEL_17;
        }
        BOOL v16 = v28;
      }
    }
    if (!self->_clientEntitlementsArray.__elems_[v13]) {
      BOOL v16 = 0;
    }
    self->_clientEntitlementsArray.__elems_[v13] = v16;
LABEL_17:
    if (+[NIPlatformInfo isInternalBuild])
    {
      CFStringRef v17 = [(NIServerSessionContainer *)self signingIdentity];
      if ([v17 isEqualToString:@"com.apple.dt.xctest.tool"])
      {

LABEL_21:
        self->_clientEntitlementsArray.__elems_[v13] = 1;
        goto LABEL_22;
      }
      __int16 v18 = [(NIServerSessionContainer *)self signingIdentity];
      unsigned int v19 = [v18 isEqualToString:@"com.apple.xctest"];

      if (v19) {
        goto LABEL_21;
      }
    }
LABEL_22:
    if (+[NIPlatformInfo isInternalBuild])
    {
      id v20 = +[NSUserDefaults standardUserDefaults];
      unsigned int v21 = [v20 BOOLForKey:@"NIPrototypingBypassEntitlements"];

      if (v21)
      {
        __int16 v22 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-container,Prototyping mode on: enable entitlement bypass", buf, 2u);
        }
        self->_clientEntitlementsArray.__elems_[v13] = 1;
      }
    }
    int v23 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = [(NIServerSessionContainer *)self processNameBestGuess];
      BOOL v25 = self->_clientEntitlementsArray.__elems_[v13];
      *(_DWORD *)id buf = 138413058;
      char v30 = v24;
      __int16 v31 = 2112;
      unsigned int v32 = v14;
      __int16 v33 = 1024;
      *(_DWORD *)__int16 v34 = v25;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-container,Client: %@, entitlement: %@ | got it: %d, requested it: %@", buf, 0x26u);
    }
    ++v13;
  }
  while (v13 != 9);
  os_unfair_lock_unlock(lock);
}

- (id)_getCapabilities
{
  unsigned __int8 v3 = objc_opt_new();
  unsigned __int8 v4 = [(NIServerSessionContainer *)self uwbProvider];
  unsigned int v5 = [v4 deviceCapabilities];

  unsigned int v6 = [(NIServerSessionContainer *)self wifiProvider];
  LOBYTE(self) = [v6 deviceCapabilities];

  char v7 = +[NSNumber numberWithBool:v5 & 1];
  [v3 setObject:v7 forKey:@"UWBSupportedPlatform"];

  uint64_t v8 = +[NSNumber numberWithBool:(v5 >> 8) & 1];
  [v3 setObject:v8 forKey:@"UWBSupportedPlatformPDOA"];

  BOOL v9 = +[NSNumber numberWithBool:HIWORD(v5) & 1];
  [v3 setObject:v9 forKey:@"UWBSupportedPlatformExtendedDistance"];

  id v10 = +[NSNumber numberWithBool:self & 1];
  [v3 setObject:v10 forKey:@"WifiSupportedPlatform"];

  uint64_t v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[NIPlatformInfo supportsSyntheticAperture]);
  [v3 setObject:v11 forKey:@"UWBSupportedPlatformSyntheticAperture"];

  return v3;
}

- (id)_getExpandedCapabilities
{
  unsigned __int8 v3 = objc_opt_new();
  unsigned __int8 v4 = [(NIServerSessionContainer *)self _getCapabilities];
  [v3 addEntriesFromDictionary:v4];

  unsigned int v5 = [(NIServerSessionContainer *)self devicePresenceResource];
  unsigned int v6 = [v5 internalObserver];
  LODWORD(v4) = [v6 deviceCapabilities];

  char v7 = [v3 objectForKey:@"UWBSupportedPlatform"];
  LODWORD(v5) = [v7 BOOLValue];

  uint64_t v8 = [v3 objectForKey:@"WifiSupportedPlatform"];
  LODWORD(v7) = [v8 BOOLValue];

  BOOL v9 = +[NSNumber numberWithBool:v5 | [(NIServerSessionContainer *)self entitlementGranted:5] & v4 | [(NIServerSessionContainer *)self entitlementGranted:2] & v7];
  [v3 setObject:v9 forKey:@"SupportedPlatform"];

  return v3;
}

- (BOOL)_supportedPlatform
{
  v2 = [(NIServerSessionContainer *)self _getExpandedCapabilities];
  unsigned __int8 v3 = [v2 objectForKeyedSubscript:@"SupportedPlatform"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)displayName
{
  return [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
}

- (NSString)processNameBestGuess
{
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    unsigned __int8 v3 = bundleIdentifier;
  }
  else
  {
    unsigned int v5 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];

    appStateMonitor = self->_appStateMonitor;
    if (v5)
    {
      unsigned __int8 v3 = [(PRAppStateMonitor *)appStateMonitor launchdJobLabel];
    }
    else
    {
      char v7 = [(PRAppStateMonitor *)appStateMonitor monitoredProcessName];

      if (v7)
      {
        unsigned __int8 v3 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
      }
      else
      {
        unsigned __int8 v3 = 0;
      }
    }
  }

  return v3;
}

- (id)_displayPermissionsPromptIfNeeded
{
  unsigned int v3 = [(NIServerSessionContainer *)self entitlementGranted:0];
  if (v3) {
    unsigned int v4 = 3;
  }
  else {
    unsigned int v4 = [(NIPrivacyAuthorizationManager *)self->_authManager authorizationStatusForSession:self promptUserIfUndetermined:1];
  }
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = sub_10002A350(v4);
    sessionIdentifier = self->_sessionIdentifier;
    uint64_t v8 = [(NIServerSessionContainer *)self signingIdentity];
    BOOL v9 = (void *)v8;
    CFStringRef v10 = @"NO";
    *(_DWORD *)unsigned int v14 = 138478851;
    *(void *)&v14[4] = v6;
    *(_WORD *)&v14[12] = 2113;
    if (v3) {
      CFStringRef v10 = @"YES";
    }
    *(void *)&v14[14] = sessionIdentifier;
    __int16 v15 = 2113;
    uint64_t v16 = v8;
    __int16 v17 = 2113;
    CFStringRef v18 = @"Privileged?";
    __int16 v19 = 2113;
    CFStringRef v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,[Session] User authorization status: %{private}@. Session: %{private}@. Signing identity: %{private}@. %{private}@: %{private}@", v14, 0x34u);
  }
  switch(v4)
  {
    case 0u:
      goto LABEL_11;
    case 4u:
      uint64_t v11 = -5884;
      goto LABEL_13;
    case 2u:
LABEL_11:
      uint64_t v11 = -5887;
LABEL_13:
      unsigned int v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction", v11, 0, *(_OWORD *)v14 code userInfo];
      goto LABEL_15;
  }
  unsigned int v12 = 0;
LABEL_15:

  return v12;
}

- (id)clientProcessSigningIdentity
{
  return self->_signingIdentity;
}

- (int)clientPid
{
  return self->_pid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)serverSessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)btResource
{
  return self->_bleProvider;
}

- (id)uwbResource
{
  unsigned int v3 = [(NIServerSessionContainer *)self uwbProvider];

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10040F550();
    }
    unsigned int v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      char v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
      __int16 v8 = 1024;
      int v9 = 2004;
      __int16 v10 = 2080;
      uint64_t v11 = "-[NIServerSessionContainer uwbResource]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", (uint8_t *)&v6, 0x1Cu);
    }
    abort();
  }

  return [(NIServerSessionContainer *)self uwbProvider];
}

- (id)wifiResource
{
  unsigned int v3 = [(NIServerSessionContainer *)self wifiProvider];

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10040F584();
    }
    unsigned int v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      char v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
      __int16 v8 = 1024;
      int v9 = 2009;
      __int16 v10 = 2080;
      uint64_t v11 = "-[NIServerSessionContainer wifiResource]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", (uint8_t *)&v6, 0x1Cu);
    }
    abort();
  }

  return [(NIServerSessionContainer *)self wifiProvider];
}

- (id)visionResource
{
  return +[NIServerVisionDataDistributor sharedProvider];
}

- (id)lifecycleSupervisor
{
  return self->_lifeCycleManager;
}

- (PRAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (id)analytics
{
  return self->_analyticsManager;
}

- (id)discoveryToken
{
  if (self->_localDiscoveryToken) {
    v2 = [[NIDiscoveryToken alloc] initWithBytes:self->_localDiscoveryToken];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)remote
{
  [(NIServerSessionContainer *)self _acquireClientAssertionIfNecessary];
  client = self->_client;

  return client;
}

- (shared_ptr<rose::protobuf::Logger>)protobufLogger
{
  unsigned int v3 = v2;
  unsigned int v4 = (Logger *)sub_1002F6464();
  uint64_t v6 = *((void *)v4 + 21);
  void *v3 = *((void *)v4 + 20);
  v3[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (BOOL)longRangeEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"DisableLongRangeOverride"];

  if (v3)
  {
    unsigned int v4 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-container,* disable ND through default writes.", v6, 2u);
    }
  }
  return v3 ^ 1;
}

- (BOOL)entitlementGranted:(int)a3
{
  p_entitlementsLock = &self->_entitlementsLock;
  os_unfair_lock_lock(&self->_entitlementsLock);
  if (a3 >= 9)
  {
    char v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10040F5B8(a3, v7);
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = self->_clientEntitlementsArray.__elems_[a3];
  }
  os_unfair_lock_unlock(p_entitlementsLock);
  return v6;
}

- (BOOL)requiresBiasCorrection
{
  int v2 = *((_DWORD *)sub_100007D00() + 144);

  return sub_10039D0B0(v2);
}

- (BOOL)requiresLargeRegions
{
  int v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 objectForKey:@"RegionMonitorRequiresLargeRegionsOverride"];

  if (v3)
  {
    unsigned __int8 v4 = [v2 BOOLForKey:@"RegionMonitorRequiresLargeRegionsOverride"];
  }
  else
  {
    unsigned int v5 = sub_100007D00();
    unsigned __int8 v4 = sub_10039D0B0(v5[144]);
  }
  BOOL v6 = v4;

  return v6;
}

- (id)devicePresenceResource
{
  devicePresenceProvider = self->_devicePresenceProvider;
  if (!devicePresenceProvider)
  {
    objc_initWeak(&location, self);
    unsigned __int8 v4 = [NIServerBluetoothSampleConsumer alloc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000539CC;
    v8[3] = &unk_1008475B0;
    objc_copyWeak(&v9, &location);
    unsigned int v5 = [(NIServerBluetoothSampleConsumer *)v4 initWithConsumerBlock:v8];
    BOOL v6 = self->_devicePresenceProvider;
    self->_devicePresenceProvider = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    devicePresenceProvider = self->_devicePresenceProvider;
  }

  return devicePresenceProvider;
}

- (shared_ptr<rose::PowerBudgetProvider>)powerBudgetProvider
{
  unsigned int v3 = v2;
  unsigned __int8 v4 = (PowerBudgetProvider *)sub_1002F6464();
  uint64_t v6 = *((void *)v4 + 23);
  void *v3 = *((void *)v4 + 22);
  v3[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (id)recentlyObservedObjectsCache
{
  return [(NIServerSessionContainer *)self nearbyObjectsCache];
}

- (id)printableState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x3032000000;
  unsigned int v32 = sub_10004FAB0;
  __int16 v33 = sub_10004FAC0;
  id v34 = (id)objc_opt_new();
  double v3 = sub_100006C38();
  os_unfair_lock_lock(&self->_entitlementsLock);
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    if (self->_clientEntitlementsArray.__elems_[v4]) {
      uint64_t v6 = (1 << v4);
    }
    else {
      uint64_t v6 = 0;
    }
    v5 |= v6;
    ++v4;
  }
  while (v4 != 9);
  os_unfair_lock_unlock(&self->_entitlementsLock);
  char v7 = (void *)v30[5];
  sessionIdentifier = self->_sessionIdentifier;
  id v9 = [(NIServerSessionContainer *)self discoveryToken];
  __int16 v10 = [v9 descriptionInternal];
  uint64_t v11 = +[NSString stringWithFormat:@"Identifier: %@. Token: %@. Entitlements: 0x%llX%s. Transaction: %d", sessionIdentifier, v10, v5, "", self->_osTransaction != 0];
  [v7 addObject:v11];

  if ((self->_latestSessionContainerState - 1) > 7u) {
    unsigned int v12 = "Initialized";
  }
  else {
    unsigned int v12 = off_1008476D8[(char)(self->_latestSessionContainerState - 1)];
  }
  uint64_t v13 = (void *)v30[5];
  double initTime = self->_initTime;
  double timeOfLatestContainerState = self->_timeOfLatestContainerState;
  [(NIServerSessionContainer *)self _interruptionsMapAsString];
  if (v28 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  __int16 v17 = +[NSString stringWithFormat:@"State: %s. Age: total %.2f s, in-state %.2f s. Interruptions: %s", v12, v3 - initTime, v3 - timeOfLatestContainerState, p_p];
  [v13 addObject:v17];

  if (v28 < 0) {
    operator delete(__p);
  }
  CFStringRef v18 = (void *)v30[5];
  __int16 v19 = [(NIServerBaseSession *)self->_specializedSession lastConfiguration];
  CFStringRef v20 = +[NSString stringWithFormat:@"Configuration: %@", v19];
  [v18 addObject:v20];

  unsigned int v21 = (void *)v30[5];
  __int16 v22 = +[NSString stringWithFormat:@"Specialized session: %@", objc_opt_class()];
  [v21 addObject:v22];

  int v23 = [(NIServerBaseSession *)self->_specializedSession printableState];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100053E6C;
  v26[3] = &unk_1008475D8;
  v26[4] = &v29;
  [v23 enumerateObjectsUsingBlock:v26];
  id v24 = (id)v30[5];

  _Block_object_dispose(&v29, 8);

  return v24;
}

- (void)didFailWithErrorCode:(int64_t)a3 errorString:(const void *)a4
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10040F630();
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10040F664();
  }
}

- (void)didReceiveSessionStartNotification:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10040F698();
  }
}

- (void)didReceiveRemoteData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10040F6CC();
  }
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10040F700();
  }
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  char v7 = [(NIServerSessionContainer *)self uwbProvider];
  __int16 v8 = [v7 getQueue];
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  id v9 = [(NIServerSessionContainer *)self connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054168;
  block[3] = &unk_1008461C8;
  objc_copyWeak(&v11, &location);
  int v12 = a3;
  int v13 = a4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)didFinishActivatingWithDiscoveryTokenData:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    __int16 v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F768((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_4:
    bleProvider = self->_bleProvider;
    self->_bleProvider = 0;
    goto LABEL_16;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F734();
    }
    goto LABEL_4;
  }
  p_localDiscoveryToken = &self->_localDiscoveryToken;
  objc_storeStrong((id *)&self->_localDiscoveryToken, a3);
  __int16 v19 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v20 = [v19 BOOLForKey:@"NIHomeDisableDeviceSpecificSTS"];

  unsigned int v21 = sub_100007D00();
  if (v20) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = sub_10039D104(v21[144]);
  }
  int v23 = [(NIServerSessionContainer *)self _augmentDiscoveryTokenWithDeviceCapabilities:v7];
  localDiscoveryToken = self->_localDiscoveryToken;
  self->_localDiscoveryToken = v23;

  BOOL v25 = [(NIServerSessionContainer *)self _augmentDiscoveryToken:self->_localDiscoveryToken withHomeAnchorVariant:v22];
  __int16 v26 = self->_localDiscoveryToken;
  self->_localDiscoveryToken = v25;

  uint64_t v27 = [(NIServerSessionContainer *)self _getCapabilities];
  char v28 = [v27 objectForKey:@"UWBSupportedPlatformExtendedDistance"];
  unsigned int v29 = [v28 BOOLValue];

  if (v29)
  {
    uint64_t v30 = [(NIServerSessionContainer *)self _augmentDiscoveryTokenWithNbUwbAcquisitionChannel:self->_localDiscoveryToken];
    uint64_t v31 = *p_localDiscoveryToken;
    *p_localDiscoveryToken = (NSData *)v30;
  }
  unsigned int v32 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = CUPrintNSObjectMasked();
    int v35 = 138478083;
    __int16 v36 = v33;
    __int16 v37 = 1024;
    int v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ses-container,BT resource activated. Token: %{private}@. Device anchor variant: %u", (uint8_t *)&v35, 0x12u);
  }
  bleProvider = [(NIServerSessionContainer *)self remote];
  id v34 = [(NIServerSessionContainer *)self discoveryToken];
  [bleProvider didUpdateLocalDiscoveryToken:v34];

LABEL_16:
}

- (void)didDiscoverDevice:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v4);

  [(NIServerBaseSession *)self->_specializedSession deviceDiscovered:v5];
}

- (void)discoveredDevice:(id)a3 didUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v7);

  [(NIServerBaseSession *)self->_specializedSession device:v8 rediscovered:v6];
}

- (void)didLoseDevice:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v4);

  [(NIServerBaseSession *)self->_specializedSession deviceLost:v5];
}

- (void)bluetoothDidChangeState:(int64_t)a3
{
  id v5 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v5);

  switch(a3)
  {
    case 1:
    case 4:
      [(NIServerSessionContainer *)self _handleBluetoothBecameUnavailable];
      break;
    case 2:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10040F808();
      }
      break;
    case 3:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10040F7D4();
      }
      break;
    case 5:
      [(NIServerSessionContainer *)self _handleBluetoothBecameAvailable];
      break;
    default:
      break;
  }
  [(NIServerSessionContainer *)self setLatestBluetoothState:a3];
}

- (void)bluetoothServiceInterrupted
{
  double v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  [(NIServerSessionContainer *)self _handleBluetoothBecameUnavailable];
}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  id v5 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v5);

  specializedSession = self->_specializedSession;

  [(NIServerBaseSession *)specializedSession bluetoothAdvertisingAddressChanged:a3];
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)[(NIServerBaseSession *)self->_specializedSession nominalCycleRate];
}

- (void)_setContainerState:(unsigned __int8)a3
{
  if (self->_latestSessionContainerState != a3)
  {
    id v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      if ((a3 - 1) > 7u) {
        id v6 = "Initialized";
      }
      else {
        id v6 = off_1008476D8[(char)(a3 - 1)];
      }
      if ((self->_latestSessionContainerState - 1) > 7u) {
        id v7 = "Initialized";
      }
      else {
        id v7 = off_1008476D8[(char)(self->_latestSessionContainerState - 1)];
      }
      signingIdentity = self->_signingIdentity;
      int pid = self->_pid;
      sessionIdentifier = self->_sessionIdentifier;
      int v11 = 136316162;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = signingIdentity;
      __int16 v17 = 1024;
      int v18 = pid;
      __int16 v19 = 2112;
      unsigned __int8 v20 = sessionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,Container state change. New: %s. Old: %s. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v11, 0x30u);
    }
    self->_latestSessionContainerState = a3;
    self->_double timeOfLatestContainerState = sub_100006C38();
  }
}

- (basic_string<char,)_interruptionsMapAsString
{
  int v2 = v1;
  double v3 = [v1 connectionQueue];
  dispatch_assert_queue_V2(v3);

  sub_100054E28((uint64_t)v10);
  sub_100056628(v11, (uint64_t)"[", 1);
  for (i = (void *)v2[14]; i; i = (void *)*i)
  {
    sub_10030432C(i[2]);
    id v5 = objc_claimAutoreleasedReturnValue();
    id v6 = (const char *)[v5 UTF8String];
    size_t v7 = strlen(v6);
    sub_100056628(v11, (uint64_t)v6, v7);
    if (*i) {
      sub_100056628(v11, (uint64_t)", ", 2);
    }
  }
  sub_100056628(v11, (uint64_t)"]", 1);
  std::stringbuf::str();
  *(void *)((char *)v10
  v11[0] = v8;
  if (v12 < 0) {
    operator delete((void *)v11[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::ios::~ios();
}

- (void)_dumpInterruptionsMapWithDebugString:(id)a3
{
  id v4 = a3;
  id v5 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [(NIServerSessionContainer *)self _interruptionsMapAsString];
    int v7 = v12;
    uint64_t v8 = (void **)__p;
    double v9 = sub_100006C38();
    p_p = &__p;
    *(_DWORD *)id buf = 138412802;
    if (v7 < 0) {
      p_p = v8;
    }
    id v14 = v4;
    __int16 v15 = 2080;
    uint64_t v16 = p_p;
    __int16 v17 = 2048;
    double v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt [%@] Interruptions map: %s, machContTime: %f", buf, 0x20u);
    if (v12 < 0) {
      operator delete(__p);
    }
  }
}

- (void)interruptSessionWithReason:(int64_t)a3 monotonicTimeSeconds:(double)a4
{
  int64_t v23 = a3;
  int v7 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    __int16 v10 = sub_10030432C(a3);
    *(_DWORD *)id buf = 138412802;
    *(void *)&uint8_t buf[4] = sessionIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    double v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt Interrupt session %@ with reason: %@. ContTime: %f", buf, 0x20u);
  }
  [(NIServerSessionContainer *)self _setContainerState:7];
  if (sub_100056B3C(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v23))
  {
    int v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt Not interrupting session with duplicate reason.", buf, 2u);
    }
  }
  else
  {
    *(void *)id buf = v23;
    *(void *)&buf[8] = v23;
    *(double *)&buf[16] = a4;
    sub_1000075A0((uint64_t)&self->_interruptionsMap, (unint64_t *)buf, (uint64_t)buf);
    [(NIServerSessionContainer *)self _dumpInterruptionsMapWithDebugString:@"interruptWithReason"];
    char v12 = [(NIServerBaseSession *)self->_specializedSession pauseWithSource:2];
    if (v12)
    {
      __int16 v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040F83C((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    paAccessInterval = self->_paAccessInterval;
    if (paAccessInterval)
    {
      [(PAAccessInterval *)paAccessInterval end];
      unsigned int v21 = self->_paAccessInterval;
      self->_paAccessInterval = 0;
    }
    [(NIServerVisionInternalSessionRequest *)self->_visionSessionRequest invalidate];
    [(NIServerAnalyticsManager *)self->_analyticsManager sessionInterruptedWithTimestamp:a4];
    uint64_t v22 = [(NIServerSessionContainer *)self remote];
    [v22 uwbSessionInterruptedWithReason:v23 timestamp:a4];
  }
}

- (void)interruptionReasonEnded:(int64_t)a3 monotonicTimeSeconds:(double)a4
{
  int64_t v13 = a3;
  int v7 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    __int16 v10 = sub_10030432C(a3);
    *(_DWORD *)id buf = 138412802;
    uint64_t v15 = sessionIdentifier;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt Session %@ interruption ended. Reason: %@. ContTime: %f", buf, 0x20u);
  }
  int v11 = sub_100056B3C(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v13);
  if (v11)
  {
    sub_10002A67C(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, v11);
    [(NIServerSessionContainer *)self _dumpInterruptionsMapWithDebugString:@"interruptionEnded"];
    char v12 = [(NIServerSessionContainer *)self remote];
    [v12 uwbSessionInterruptionReasonEnded:v13 timestamp:a4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10040F8A8();
  }
}

- (void)invalidate
{
  [(NIServerSessionContainer *)self _setContainerState:8];
  double v3 = +[NIServerVisionDataDistributor sharedProvider];
  [v3 unregisterForVisionInput:self->_specializedSession];

  id v4 = [(NIServerSessionContainer *)self devicePresenceResource];
  id v5 = [v4 internalObserver];
  [v5 stopLeechingForConsumer:self];

  id v6 = [(NIServerSessionContainer *)self devicePresenceResource];
  int v7 = [v6 internalObserver];
  [v7 unregisterForInternalBluetoothSamples:self];

  [(NIServerBaseSession *)self->_specializedSession invalidate];
  specializedSession = self->_specializedSession;
  self->_specializedSession = 0;

  [(PRBLEDiscoverySession *)self->_bleProvider invalidate];
  bleProvider = self->_bleProvider;
  self->_bleProvider = 0;

  __int16 v10 = [(NIServerSessionContainer *)self appStateMonitor];
  [v10 removeObserver:self];

  [(NIServerAssertionManager *)self->_assertionManager invalidate];
  assertionManager = self->_assertionManager;
  self->_assertionManager = 0;

  paAccessInterval = self->_paAccessInterval;
  if (paAccessInterval)
  {
    [(PAAccessInterval *)paAccessInterval end];
    int64_t v13 = self->_paAccessInterval;
    self->_paAccessInterval = 0;
  }
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;

  [(NIServerVisionInternalSessionRequest *)self->_visionSessionRequest invalidate];
  analyticsManager = self->_analyticsManager;
  double v16 = sub_100006C38();

  [(NIServerAnalyticsManager *)analyticsManager sessionInvalidatedWithTimestamp:v16];
}

- (id)_fatalErrorForUwbServiceState:(int)a3 cause:(int)a4
{
  int v7 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    sub_100004950(v18, off_100847718[a3]);
    int v10 = v19;
    int v11 = (void **)v18[0];
    sub_100004950(__p, off_100847740[a4]);
    char v12 = v18;
    if (v10 < 0) {
      char v12 = v11;
    }
    if (v17 >= 0) {
      int64_t v13 = __p;
    }
    else {
      int64_t v13 = (void **)__p[0];
    }
    *(_DWORD *)id buf = 138412802;
    unsigned int v21 = sessionIdentifier;
    __int16 v22 = 2080;
    int64_t v23 = v12;
    __int16 v24 = 2080;
    double v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,Check for fatal error for session %@ for UWB service state %s with cause %s", buf, 0x20u);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
  }

  uint64_t v14 = 0;
  if (a3 == 3 && (a4 - 5) <= 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040F8DC();
    }
    uint64_t v14 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:0];
  }

  return v14;
}

- (BOOL)_updateInterruptionForUWBServiceState:(int)a3 cause:(int)a4 requiresNarrowBand:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  double v9 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v9);

  int v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    sub_100004950(v19, off_100847718[a3]);
    int v12 = v20;
    int64_t v13 = (void **)v19[0];
    sub_100004950(__p, off_100847740[(int)v6]);
    uint64_t v14 = v19;
    if (v12 < 0) {
      uint64_t v14 = v13;
    }
    if (v18 >= 0) {
      uint64_t v15 = __p;
    }
    else {
      uint64_t v15 = (void **)__p[0];
    }
    *(_DWORD *)id buf = 138412802;
    __int16 v22 = sessionIdentifier;
    __int16 v23 = 2080;
    __int16 v24 = v14;
    __int16 v25 = 2080;
    __int16 v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-container,Update interruption for session %@ for UWB service state %s with cause %s", buf, 0x20u);
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (v20 < 0) {
      operator delete(v19[0]);
    }
  }

  switch(a3)
  {
    case 0:
      sub_10040F910();
    case 1:
      goto LABEL_16;
    case 2:
      if (a5) {
        return [(NIServerSessionContainer *)self _updateInterruptionForUWBSystemOffWithCause:v6];
      }
LABEL_16:
      [(NIServerSessionContainer *)self _updateInterruptionForUWBSystemReady];
      return 0;
    case 3:
      return [(NIServerSessionContainer *)self _updateInterruptionForUWBSystemOffWithCause:v6];
    case 4:
      [(NIServerSessionContainer *)self _updateInterruptionForUWBSystemError];
      return 1;
    default:
      return 0;
  }
}

- (void)_updateInterruptionForUWBSystemReady
{
  double v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  __p = 0;
  char v19 = 0;
  char v20 = 0;
  [(NIServerSessionContainer *)self _dumpInterruptionsMapWithDebugString:@"_updateInterruptionForUWBSystemReady"];
  id v4 = (unint64_t *)&qword_1004A0628;
  do
  {
    if (sub_100056B3C(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, v4))
    {
      id v5 = v19;
      if (v19 >= v20)
      {
        int v7 = __p;
        uint64_t v8 = v19 - __p;
        unint64_t v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 61) {
          sub_1000267C4();
        }
        uint64_t v10 = (char *)v20 - (char *)__p;
        if (((char *)v20 - (char *)__p) >> 2 > v9) {
          unint64_t v9 = v10 >> 2;
        }
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v9;
        }
        if (v11)
        {
          int v12 = (char *)sub_100056BF0((uint64_t)&v20, v11);
          int v7 = __p;
          id v5 = v19;
        }
        else
        {
          int v12 = 0;
        }
        int64_t v13 = (unint64_t *)&v12[8 * v8];
        *int64_t v13 = *v4;
        uint64_t v6 = v13 + 1;
        while (v5 != v7)
        {
          unint64_t v14 = *--v5;
          *--int64_t v13 = v14;
        }
        __p = v13;
        char v20 = (unint64_t *)&v12[8 * v11];
        if (v7) {
          operator delete(v7);
        }
      }
      else
      {
        *char v19 = *v4;
        uint64_t v6 = v19 + 1;
      }
      char v19 = v6;
    }
    ++v4;
  }
  while (v4 != (unint64_t *)&unk_1004A0648);
  double v15 = sub_100006C38();
  double v16 = __p;
  if (__p != v19)
  {
    double v17 = v15;
    do
      [(NIServerSessionContainer *)self interruptionReasonEnded:*v16++ monotonicTimeSeconds:v17];
    while (v16 != v19);
    double v16 = __p;
  }
  if (v16) {
    operator delete(v16);
  }
}

- (BOOL)_updateInterruptionForUWBSystemOffWithCause:(int)a3
{
  id v5 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = 0;
  double v7 = sub_100006C38();
  uint64_t v8 = 5;
  switch(a3)
  {
    case 0:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10040F93C();
      }
      return 0;
    case 1:
    case 7:
      goto LABEL_7;
    case 2:
      sub_10040F970();
    case 3:
      uint64_t v8 = 1;
      goto LABEL_7;
    case 4:
      uint64_t v8 = 2;
LABEL_7:
      [(NIServerSessionContainer *)self interruptSessionWithReason:v8 monotonicTimeSeconds:v7];
      BOOL v6 = 1;
      break;
    default:
      return v6;
  }
  return v6;
}

- (void)_updateInterruptionForUWBSystemError
{
  double v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = sub_100006C38();

  [(NIServerSessionContainer *)self interruptSessionWithReason:4 monotonicTimeSeconds:v4];
}

- (void)_handleBluetoothBecameUnavailable
{
  double v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = sub_100006C38();

  [(NIServerSessionContainer *)self interruptSessionWithReason:7 monotonicTimeSeconds:v4];
}

- (void)_handleBluetoothBecameAvailable
{
  double v3 = [(NIServerSessionContainer *)self connectionQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = sub_100006C38();

  [(NIServerSessionContainer *)self interruptionReasonEnded:7 monotonicTimeSeconds:v4];
}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  double v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_1001DD31C(a4);
    int v11 = 67109378;
    *(_DWORD *)int v12 = a3;
    *(_WORD *)&v12[4] = 2112;
    *(void *)&v12[6] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,Monitored app with pid: %d did change state: %@", (uint8_t *)&v11, 0x12u);
  }
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10040F99C();
    }
    uint64_t v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      *(void *)int v12 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServe"
                       "rSessionContainer.mm";
      *(_WORD *)&v12[8] = 1024;
      *(_DWORD *)&v12[10] = 2667;
      __int16 v13 = 2080;
      unint64_t v14 = "-[NIServerSessionContainer monitoredApp:didChangeState:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", (uint8_t *)&v11, 0x1Cu);
    }
    abort();
  }
  double v9 = sub_100006C38();
  self->_latestAppState = a4;
  if (a4 == 2)
  {
    [(NIServerAnalyticsManager *)self->_analyticsManager appBecameVisibleWithTimestamp:v9];
  }
  else
  {
    if (a4 != 3) {
      return;
    }
    [(NIServerAnalyticsManager *)self->_analyticsManager appBecameNotVisibleWithTimestamp:v9];
  }
  [(NIServerSessionContainer *)self _updateClientAppVisibilityInterruption];
}

- (id)updatesQueue
{
  return self->_connectionQueue;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 256, 1);
}

- (OS_dispatch_queue)connectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (NSString)signingIdentity
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (int)pid
{
  return self->_pid;
}

- (NSUUID)sessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 288, 1);
}

- (NIServerSessionActivationGuard)activationGuard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationGuard);

  return (NIServerSessionActivationGuard *)WeakRetained;
}

- (void)setActivationGuard:(id)a3
{
}

- (NIServerSessionObservationRegistrar)observationRegistrar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observationRegistrar);

  return (NIServerSessionObservationRegistrar *)WeakRetained;
}

- (void)setObservationRegistrar:(id)a3
{
}

- (NIServerSessionAggregateStateProvider)aggregateStateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_aggregateStateProvider);

  return (NIServerSessionAggregateStateProvider *)WeakRetained;
}

- (void)setAggregateStateProvider:(id)a3
{
}

- (NIRecentlyObservedObjectsCache)nearbyObjectsCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nearbyObjectsCache);

  return (NIRecentlyObservedObjectsCache *)WeakRetained;
}

- (void)setNearbyObjectsCache:(id)a3
{
}

- (unsigned)latestSessionContainerState
{
  return self->_latestSessionContainerState;
}

- (void)setLatestSessionContainerState:(unsigned __int8)a3
{
  self->_latestSessionContainerState = a3;
}

- (int64_t)latestBluetoothState
{
  return self->_latestBluetoothState;
}

- (void)setLatestBluetoothState:(int64_t)a3
{
  self->_latestBluetoothState = a3;
}

- (int)latestAppState
{
  return self->_latestAppState;
}

- (void)setLatestAppState:(int)a3
{
  self->_latestAppState = a3;
}

- (unsigned)specializedSessionBackgroundSupport
{
  return self->_specializedSessionBackgroundSupport;
}

- (void)setSpecializedSessionBackgroundSupport:(unsigned __int8)a3
{
  self->_int specializedSessionBackgroundSupport = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nearbyObjectsCache);
  objc_destroyWeak((id *)&self->_aggregateStateProvider);
  objc_destroyWeak((id *)&self->_observationRegistrar);
  objc_destroyWeak((id *)&self->_activationGuard);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_paAccessInterval, 0);
  objc_storeStrong((id *)&self->_visionSessionRequest, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_specializedSession, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_authManager, 0);
  objc_storeStrong((id *)&self->_activationError, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  sub_10002AC70((uint64_t)&self->_interruptionsMap);
  objc_storeStrong((id *)&self->_devicePresenceProvider, 0);
  objc_storeStrong((id *)&self->_wifiProvider, 0);
  objc_storeStrong((id *)&self->_uwbProvider, 0);
  objc_storeStrong((id *)&self->_bleProviderSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bleProviderSessionIRK, 0);
  objc_storeStrong((id *)&self->_bleProvider, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_lifeCycleManager, 0);

  objc_storeStrong((id *)&self->_localDiscoveryToken, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end