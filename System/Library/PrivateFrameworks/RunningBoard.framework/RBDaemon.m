@interface RBDaemon
+ (id)_sharedInstance;
+ (void)run;
- (NSString)debugDescription;
- (NSString)description;
- (RBAssertionManaging)assertionManager;
- (RBAssertionOriginatorPidPersisting)assertionOriginatorPidStore;
- (RBDaemon)init;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBExtensionDataProviding)extensionDataProvider;
- (RBHistoricalStatisticsMaintaining)historicalStatistics;
- (RBJetsamPropertyManaging)jetsamPropertyManager;
- (RBProcess)process;
- (RBProcessManaging)processManager;
- (RBProcessMonitoring)processMonitor;
- (RBRequestManaging)requestManager;
- (RBStateCaptureManaging)stateCaptureManager;
- (uint64_t)setLowDiskIOPolicy;
- (void)_start;
- (void)assertionManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5;
- (void)assertionManager:(id)a3 didBeginTrackingInFightUpdatesForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didBeginTrackingStateForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didEndTrackingInFightUpdatesForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didEndTrackingStateForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertions:(id)a4;
- (void)assertionManager:(id)a3 didRejectAcquisitionFromOriginatorWithExcessiveAssertions:(id)a4;
- (void)assertionManager:(id)a3 didRemoveProcess:(id)a4 withState:(id)a5;
- (void)assertionManager:(id)a3 didResolveSystemState:(id)a4;
- (void)assertionManager:(id)a3 didUpdateProcessStates:(id)a4 completion:(id)a5;
- (void)assertionManager:(id)a3 willExpireAssertionsSoonForProcess:(id)a4 expirationTime:(double)a5;
- (void)assertionManager:(id)a3 willInvalidateAssertion:(id)a4;
- (void)bundlePropertiesManager:(id)a3 didChangePropertiesForProcessIdentities:(id)a4;
- (void)emitAssertionSignpostForTimeout:(uint64_t)a1;
- (void)powerAssertionManagerDidAllowIdleSleep:(id)a3;
- (void)powerAssertionManagerDidPreventIdleSleep:(id)a3;
- (void)processManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5;
- (void)processManager:(id)a3 didReconnectProcesses:(id)a4;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)setLowDiskIOPolicy;
- (void)watchdogRegister;
@end

@implementation RBDaemon

- (void)assertionManager:(id)a3 didBeginTrackingInFightUpdatesForProcessIdentity:(id)a4
{
}

- (void)assertionManager:(id)a3 didEndTrackingInFightUpdatesForProcessIdentity:(id)a4
{
}

- (void)assertionManager:(id)a3 didInvalidateAssertions:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v32 = v39;
    uint64_t v33 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        -[RBProcessReconnectManager didInvalidateAssertion:](self->_reconnectManager, "didInvalidateAssertion:", v9, v32);
        v10 = [v9 target];
        v11 = [v10 identity];

        int v12 = [v9 invalidationReason];
        v13 = [(RBProcessManager *)self->_processManager processForIdentity:v11];
        if (v13)
        {
          processManager = self->_processManager;
          v15 = [v9 originator];
          v16 = objc_msgSend(v9, "terminationContextForTargetProcess:originatorProcessIsActive:", v13, -[RBProcessManager isActiveProcess:](processManager, "isActiveProcess:", v15));

          uint64_t v17 = [v9 endPolicy];
          if ([v13 isLifecycleManaged]) {
            BOOL v18 = v12 == 4;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18 && v17 == 2) {
            -[RBDaemon emitAssertionSignpostForTimeout:]((uint64_t)self, v9);
          }
          if (v16)
          {
            id v20 = objc_alloc(MEMORY[0x263F64640]);
            v21 = (void *)MEMORY[0x263F645D8];
            v22 = [v13 identifier];
            v23 = [v21 predicateMatchingIdentifier:v22];
            v24 = (void *)[v20 initWithPredicate:v23 context:v16];

            v25 = [MEMORY[0x263F64650] sharedBackgroundWorkloop];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            v39[0] = __53__RBDaemon_assertionManager_didInvalidateAssertions___block_invoke;
            v39[1] = &unk_2647C7B98;
            v39[2] = self;
            id v40 = v24;
            id v26 = v24;
            dispatch_async(v25, block);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v7);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v27 = -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v27);
        }
        -[RBConnectionClient didInvalidateAssertions:](*(void *)(*((void *)&v34 + 1) + 8 * j), v5);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v29);
  }
}

- (RBHistoricalStatisticsMaintaining)historicalStatistics
{
  return (RBHistoricalStatisticsMaintaining *)self->_historicalStatistics;
}

- (RBStateCaptureManaging)stateCaptureManager
{
  return (RBStateCaptureManaging *)self->_stateCaptureManager;
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return (RBDomainAttributeManaging *)self->_domainAttributeManager;
}

uint64_t __63__RBDaemon_assertionManager_didUpdateProcessStates_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = -[RBConnectionListener readyClients](*(os_unfair_lock_s **)(*(void *)(a1 + 32) + 64));
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        -[RBConnectionClient didUpdateProcessStates:](*(void *)(*((void *)&v8 + 1) + 8 * v6++), *(void **)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

- (RBEntitlementManaging)entitlementManager
{
  return (RBEntitlementManaging *)self->_entitlementManager;
}

- (void)assertionManager:(id)a3 didUpdateProcessStates:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  processManager = self->_processManager;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__RBDaemon_assertionManager_didUpdateProcessStates_completion___block_invoke;
  v12[3] = &unk_2647C7F68;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(RBProcessManager *)processManager didUpdateProcessStates:v11 completion:v12];
  [(RBCoalitionManager *)self->_coalitionManager didUpdateProcessStates:v11];
  [(RBPowerAssertionManager *)self->_powerAssertionManager didUpdateProcessStates:v11];
  [(RBThrottleBestEffortNetworkingManager *)self->_throttleBestEffortNetworkingManager didUpdateProcessStates:v11];
  [(RBProcessMonitor *)self->_processMonitor didUpdateProcessStates:v11];
}

- (RBExtensionDataProviding)extensionDataProvider
{
  return self->_extensionDataProvider;
}

- (void)powerAssertionManagerDidPreventIdleSleep:(id)a3
{
}

- (void)powerAssertionManagerDidAllowIdleSleep:(id)a3
{
}

- (void)assertionManager:(id)a3 didRemoveProcess:(id)a4 withState:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v9 = -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[RBConnectionClient didRemoveProcess:withState:](*(void *)(*((void *)&v14 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  -[RBProcessMonitor didRemoveProcess:withState:](self->_processMonitor, "didRemoveProcess:withState:", v7, v8, (void)v14);
}

- (void)assertionManager:(id)a3 didBeginTrackingStateForProcessIdentity:(id)a4
{
}

- (void)assertionManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5
{
}

- (void)processManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5
{
  assertionManager = self->_assertionManager;
  id v8 = a5;
  id v9 = a4;
  [(RBAssertionManager *)assertionManager processDidLaunch:v9];
  [(RBPowerAssertionManager *)self->_powerAssertionManager addProcess:v9];
  [(RBThrottleBestEffortNetworkingManager *)self->_throttleBestEffortNetworkingManager addProcess:v9];
  [(RBCoalitionManager *)self->_coalitionManager addProcess:v9 withState:v8];
}

- (RBProcessManaging)processManager
{
  return (RBProcessManaging *)self->_processManager;
}

- (RBProcessMonitoring)processMonitor
{
  return (RBProcessMonitoring *)self->_processMonitor;
}

- (RBAssertionManaging)assertionManager
{
  return (RBAssertionManaging *)self->_assertionManager;
}

- (RBRequestManaging)requestManager
{
  return self->_requestManager;
}

- (RBProcess)process
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __19__RBDaemon_process__block_invoke;
  block[3] = &unk_2647C7CC8;
  block[4] = self;
  if (process_onceToken != -1) {
    dispatch_once(&process_onceToken, block);
  }
  return (RBProcess *)(id)process_process;
}

- (void)assertionManager:(id)a3 didEndTrackingStateForProcessIdentity:(id)a4
{
  processManager = self->_processManager;
  id v6 = a4;
  [(RBProcessManager *)processManager removeStateForProcessIdentity:v6];
  [(RBProcessMonitor *)self->_processMonitor removeStateForProcessIdentity:v6];
  [(RBPowerAssertionManager *)self->_powerAssertionManager removeStateForProcessIdentity:v6];
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 identity];
  if ([v6 isEmbeddedApplication])
  {
    id v7 = [v5 lastExitContext];
    id v8 = [v7 status];
    id v9 = [v6 embeddedApplicationIdentifier];
    BOOL v10 = [(RBAssertionManager *)self->_assertionManager isProcessForeground:v5];
    uint64_t v11 = rbs_sp_telemetry_log();
    if (os_signpost_enabled(v11))
    {
      int v12 = [v8 domain];
      uint64_t v13 = [v8 code];
      long long v14 = "NO";
      *(_DWORD *)long long v15 = 138544130;
      *(_WORD *)&v15[12] = 1026;
      *(void *)&v15[4] = v9;
      if (v10) {
        long long v14 = "YES";
      }
      *(_DWORD *)&v15[14] = v12;
      __int16 v16 = 2050;
      uint64_t v17 = v13;
      __int16 v18 = 2082;
      uint64_t v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_226AB3000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessExited", "BundleIdOverride=%{public,signpost.description:attribute}@ exitStatusDomain=%{public,signpost.telemetry:number1}u exitStatusCode=%{public,signpost.telemetry:number2}llu foreground=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", v15, 0x26u);
    }
  }
  -[RBAssertionManager processDidTerminate:](self->_assertionManager, "processDidTerminate:", v5, *(_OWORD *)v15);
  [(RBPowerAssertionManager *)self->_powerAssertionManager removeProcess:v5];
  [(RBThrottleBestEffortNetworkingManager *)self->_throttleBestEffortNetworkingManager removeProcess:v5];
  [(RBBundlePropertiesManager *)self->_bundlePropertiesManager removeProcess:v5];
  [(RBCoalitionManager *)self->_coalitionManager removeProcess:v5];
}

+ (void)run
{
  if (run_onceToken != -1) {
    dispatch_once(&run_onceToken, &__block_literal_global_21);
  }
}

void __15__RBDaemon_run__block_invoke()
{
  +[RBDaemon _sharedInstance]();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  -[RBDaemon _start]((uint64_t)v0);
}

+ (id)_sharedInstance
{
  self;
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_44);
  }
  id v0 = (void *)_sharedInstance___sharedInstance;
  return v0;
}

- (void)_start
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = rbs_general_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "Battlecruiser operational.", buf, 2u);
    }

    -[RBDaemon setLowDiskIOPolicy](a1);
    -[RBDaemon watchdogRegister](a1);
    [MEMORY[0x263F087E8] _setFileNameLocalizationEnabled:0];
    uint64_t v3 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v4 = [v3 environment];
    id v5 = [v4 objectForKey:@"XPC_SERVICE_NAME"];
    id v6 = +[RBLaunchdJobManager lastExitStatusForLabel:v5 error:0];

    if ([v6 isValid])
    {
      id v7 = rbs_general_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v68 = v6;
        _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_DEFAULT, "Back online after last exit: %{public}@", buf, 0xCu);
      }
    }
    [MEMORY[0x263F64468] setInDaemon];
    id v8 = objc_alloc_init(RBStateCaptureManager);
    id v9 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v8;

    BOOL v10 = objc_alloc_init(RBPowerAssertionManager);
    uint64_t v11 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v10;

    [*(id *)(a1 + 72) setDelegate:a1];
    int v12 = RBSPathForSystemDirectory();
    uint64_t v13 = [v12 stringByAppendingPathComponent:@"LifecyclePolicy"];
    long long v14 = [v13 stringByAppendingPathComponent:@"DomainAttributes"];

    long long v15 = [[RBDomainAttributeManagerDataProvider alloc] initWithPath:v14];
    __int16 v16 = [[RBDomainAttributeManager alloc] initWithDataProvider:v15];
    uint64_t v17 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v16;

    __int16 v18 = [RBEntitlementManager alloc];
    uint64_t v19 = [*(id *)(a1 + 32) allEntitlements];
    uint64_t v20 = [(RBEntitlementManager *)v18 initWithDomainAttributeEntitlements:v19];
    v21 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v20;

    v22 = [[RBJetsamPropertyManager alloc] initWithEntitlementManager:*(void *)(a1 + 48)];
    v23 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v22;

    v24 = objc_alloc_init(RBBundlePropertiesManager);
    v25 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v24;

    [*(id *)(a1 + 40) setDelegate:a1];
    id v26 = objc_alloc_init(RBAssertionDescriptorValidator);
    v27 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v26;

    uint64_t v28 = [[RBAssertionOriginatorPidStore alloc] initWithPath:@"/runningboard"];
    uint64_t v29 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v28;

    uint64_t v30 = [[RBHistoricalStatistics alloc] initWithReportFrequency:30];
    v31 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v30;

    v32 = [RBProcessManager alloc];
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v34 = *(void *)(a1 + 48);
    uint64_t v35 = *(void *)(a1 + 56);
    long long v36 = +[RBTimeProvider sharedInstance];
    uint64_t v37 = [(RBProcessManager *)v32 initWithBundlePropertiesManager:v33 entitlementManager:v34 jetsamPropertytManager:v35 timeProvider:v36 historialStatistics:*(void *)(a1 + 128) delegate:a1];
    v38 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v37;

    v39 = [RBAssertionManager alloc];
    uint64_t v40 = *(void *)(a1 + 40);
    uint64_t v41 = *(void *)(a1 + 24);
    uint64_t v42 = *(void *)(a1 + 8);
    long long v43 = +[RBTimeProvider sharedInstance];
    uint64_t v44 = [(RBAssertionManager *)v39 initWithDelegate:a1 bundlePropertiesManager:v40 originatorPidStore:v41 assertionDescriptorValidator:v42 timeProvider:v43 daemonContext:a1 maxOperationsInFlight:50 maxAssertionsPerOriginator:2000];
    v45 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v44;

    v46 = [RBProcessReconnectManager alloc];
    uint64_t v47 = [(id)a1 process];
    uint64_t v48 = [(RBProcessReconnectManager *)v46 initWithDaemonContext:a1 originatorProcess:v47];
    v49 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v48;

    v50 = objc_alloc_init(RBThrottleBestEffortNetworkingManager);
    v51 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = v50;

    v52 = +[RBResourceViolationHandler sharedInstance]();
    -[RBResourceViolationHandler startWithAssertionManager:]((uint64_t)v52, *(void **)(a1 + 16));

    v53 = [RBProcessMonitor alloc];
    uint64_t v54 = *(void *)(a1 + 104);
    uint64_t v55 = *(void *)(a1 + 128);
    v56 = objc_alloc_init(RBXNUWrapper);
    uint64_t v57 = [(RBProcessMonitor *)v53 initWithStateCaptureManager:v54 historialStatistics:v55 xnuWrapper:v56];
    v58 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v57;

    id v59 = -[RBConnectionListener initWithContext:]([RBConnectionListener alloc], (void *)a1);
    v60 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v59;

    v61 = objc_alloc_init(RBExtensionDataProvider);
    v62 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v61;

    v63 = [[RBRequestManager alloc] initWithContext:a1];
    v64 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = v63;

    v65 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0;

    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 16) withIdentifier:@"assertion"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 64) withIdentifier:@"connection"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 32) withIdentifier:@"domain"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 48) withIdentifier:@"entitlements"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 24) withIdentifier:@"originatorpids"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 72) withIdentifier:@"power"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 80) withIdentifier:@"process"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 40) withIdentifier:@"bundles"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 112) withIdentifier:@"throttleBestEffort"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 88) withIdentifier:@"processMonitor"];
    [*(id *)(a1 + 80) start];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F64688], 0, 0, 1u);
  }
}

- (RBDaemon)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBDaemon.m" lineNumber:124 description:@"-init is not allowed on RBDaemon"];

  return 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; listener=%p assertions=%p processes=%p monitor=%p>",
                       objc_opt_class(),
                       self,
                       self->_listener,
                       self->_assertionManager,
                       self->_processManager,
                       self->_processMonitor);
}

- (void)assertionManager:(id)a3 didResolveSystemState:(id)a4
{
  processManager = self->_processManager;
  id v6 = a4;
  [(RBProcessManager *)processManager applySystemState:v6];
  [(RBPowerAssertionManager *)self->_powerAssertionManager applySystemState:v6];
  processMonitor = self->_processMonitor;
  id v8 = [v6 preventLaunchPredicates];

  [(RBProcessMonitor *)processMonitor didResolvePreventLaunchPredicates:v8];
}

- (void)assertionManager:(id)a3 willExpireAssertionsSoonForProcess:(id)a4 expirationTime:(double)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[RBConnectionClient willExpireAssertionsSoonForProcess:expirationTime:](*(void *)(*((void *)&v13 + 1) + 8 * v12++), v7, a5);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)assertionManager:(id)a3 willInvalidateAssertion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[RBConnectionClient willInvalidateAssertion:](*(void *)(*((void *)&v11 + 1) + 8 * v10++), v5);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)emitAssertionSignpostForTimeout:(uint64_t)a1
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    id v6 = [v4 target];
    uint64_t v7 = [v6 identity];

    uint64_t v8 = [v5 legacyReason];
    if (v8 <= 9999)
    {
      switch(v8)
      {
        case 1:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v10 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v10;
          if (v10)
          {
            int v12 = 0;
            long long v13 = (void *)v10;
          }
          else
          {
            uint64_t v48 = [v7 xpcServiceIdentifier];
            v2 = (void *)v48;
            if (v48)
            {
              int v12 = 0;
              long long v13 = (void *)v48;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v77;
          v70 = "ExceededTimeLimit_MediaPlayback";
          break;
        case 2:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v22 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v22;
          if (v22)
          {
            int v12 = 0;
            long long v13 = (void *)v22;
          }
          else
          {
            uint64_t v49 = [v7 xpcServiceIdentifier];
            v2 = (void *)v49;
            if (v49)
            {
              int v12 = 0;
              long long v13 = (void *)v49;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v78;
          v70 = "ExceededTimeLimit_Location";
          break;
        case 3:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v23 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v23;
          if (v23)
          {
            int v12 = 0;
            long long v13 = (void *)v23;
          }
          else
          {
            uint64_t v50 = [v7 xpcServiceIdentifier];
            v2 = (void *)v50;
            if (v50)
            {
              int v12 = 0;
              long long v13 = (void *)v50;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v79;
          v70 = "ExceededTimeLimit_ExternalAccessory";
          break;
        case 4:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v24 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v24;
          if (v24)
          {
            int v12 = 0;
            long long v13 = (void *)v24;
          }
          else
          {
            uint64_t v51 = [v7 xpcServiceIdentifier];
            v2 = (void *)v51;
            if (v51)
            {
              int v12 = 0;
              long long v13 = (void *)v51;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v80;
          v70 = "ExceededTimeLimit_FinishTask";
          break;
        case 5:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v25 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v25;
          if (v25)
          {
            int v12 = 0;
            long long v13 = (void *)v25;
          }
          else
          {
            uint64_t v52 = [v7 xpcServiceIdentifier];
            v2 = (void *)v52;
            if (v52)
            {
              int v12 = 0;
              long long v13 = (void *)v52;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v81;
          v70 = "ExceededTimeLimit_Bluetooth";
          break;
        case 7:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v26 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v26;
          if (v26)
          {
            int v12 = 0;
            long long v13 = (void *)v26;
          }
          else
          {
            uint64_t v53 = [v7 xpcServiceIdentifier];
            v2 = (void *)v53;
            if (v53)
            {
              int v12 = 0;
              long long v13 = (void *)v53;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v82;
          v70 = "ExceededTimeLimit_BackgroundUI";
          break;
        case 8:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v27 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v27;
          if (v27)
          {
            int v12 = 0;
            long long v13 = (void *)v27;
          }
          else
          {
            uint64_t v54 = [v7 xpcServiceIdentifier];
            v2 = (void *)v54;
            if (v54)
            {
              int v12 = 0;
              long long v13 = (void *)v54;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v83;
          v70 = "ExceededTimeLimit_InterAppAudioStreaming";
          break;
        case 9:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v28 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v28;
          if (v28)
          {
            int v12 = 0;
            long long v13 = (void *)v28;
          }
          else
          {
            uint64_t v55 = [v7 xpcServiceIdentifier];
            v2 = (void *)v55;
            if (v55)
            {
              int v12 = 0;
              long long v13 = (void *)v55;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v84;
          v70 = "ExceededTimeLimit_ViewService";
          break;
        case 10:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v29 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v29;
          if (v29)
          {
            int v12 = 0;
            long long v13 = (void *)v29;
          }
          else
          {
            uint64_t v56 = [v7 xpcServiceIdentifier];
            v2 = (void *)v56;
            if (v56)
            {
              int v12 = 0;
              long long v13 = (void *)v56;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v85;
          v70 = "ExceededTimeLimit_NewsstandDownload";
          break;
        case 12:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v30 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v30;
          if (v30)
          {
            int v12 = 0;
            long long v13 = (void *)v30;
          }
          else
          {
            uint64_t v57 = [v7 xpcServiceIdentifier];
            v2 = (void *)v57;
            if (v57)
            {
              int v12 = 0;
              long long v13 = (void *)v57;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v86;
          v70 = "ExceededTimeLimit_VoIP";
          break;
        case 13:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v31 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v31;
          if (v31)
          {
            int v12 = 0;
            long long v13 = (void *)v31;
          }
          else
          {
            uint64_t v58 = [v7 xpcServiceIdentifier];
            v2 = (void *)v58;
            if (v58)
            {
              int v12 = 0;
              long long v13 = (void *)v58;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v87;
          v70 = "ExceededTimeLimit_Extension";
          break;
        case 16:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v32 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v32;
          if (v32)
          {
            int v12 = 0;
            long long v13 = (void *)v32;
          }
          else
          {
            uint64_t v59 = [v7 xpcServiceIdentifier];
            v2 = (void *)v59;
            if (v59)
            {
              int v12 = 0;
              long long v13 = (void *)v59;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v88;
          v70 = "ExceededTimeLimit_WatchConnectivity";
          break;
        case 18:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v33 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v33;
          if (v33)
          {
            int v12 = 0;
            long long v13 = (void *)v33;
          }
          else
          {
            uint64_t v60 = [v7 xpcServiceIdentifier];
            v2 = (void *)v60;
            if (v60)
            {
              int v12 = 0;
              long long v13 = (void *)v60;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v89;
          v70 = "ExceededTimeLimit_ComplicationUpdate";
          break;
        case 19:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v34 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v34;
          if (v34)
          {
            int v12 = 0;
            long long v13 = (void *)v34;
          }
          else
          {
            uint64_t v61 = [v7 xpcServiceIdentifier];
            v2 = (void *)v61;
            if (v61)
            {
              int v12 = 0;
              long long v13 = (void *)v61;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v90;
          v70 = "ExceededTimeLimit_WorkoutProcessing";
          break;
        case 20:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v35 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v35;
          if (v35)
          {
            int v12 = 0;
            long long v13 = (void *)v35;
          }
          else
          {
            uint64_t v62 = [v7 xpcServiceIdentifier];
            v2 = (void *)v62;
            if (v62)
            {
              int v12 = 0;
              long long v13 = (void *)v62;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v91;
          v70 = "ExceededTimeLimit_ComplicationPushUpdate";
          break;
        case 21:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v36 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v36;
          if (v36)
          {
            int v12 = 0;
            long long v13 = (void *)v36;
          }
          else
          {
            uint64_t v63 = [v7 xpcServiceIdentifier];
            v2 = (void *)v63;
            if (v63)
            {
              int v12 = 0;
              long long v13 = (void *)v63;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v92;
          v70 = "ExceededTimeLimit_BackgroundLocationProcessing";
          break;
        case 23:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v37 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v37;
          if (v37)
          {
            int v12 = 0;
            long long v13 = (void *)v37;
          }
          else
          {
            uint64_t v64 = [v7 xpcServiceIdentifier];
            v2 = (void *)v64;
            if (v64)
            {
              int v12 = 0;
              long long v13 = (void *)v64;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v93;
          v70 = "ExceededTimeLimit_AudioRecording";
          break;
        default:
          goto LABEL_90;
      }
      goto LABEL_205;
    }
    if (v8 <= 49999)
    {
      switch(v8)
      {
        case 10000:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v14 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v14;
          if (v14)
          {
            int v12 = 0;
            long long v13 = (void *)v14;
          }
          else
          {
            uint64_t v41 = [v7 xpcServiceIdentifier];
            v2 = (void *)v41;
            if (v41)
            {
              int v12 = 0;
              long long v13 = (void *)v41;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v69;
          v70 = "ExceededTimeLimit_Resume";
          break;
        case 10002:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v16 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v16;
          if (v16)
          {
            int v12 = 0;
            long long v13 = (void *)v16;
          }
          else
          {
            uint64_t v42 = [v7 xpcServiceIdentifier];
            v2 = (void *)v42;
            if (v42)
            {
              int v12 = 0;
              long long v13 = (void *)v42;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v71;
          v70 = "ExceededTimeLimit_TransientWakeup";
          break;
        case 10004:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v17 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v17;
          if (v17)
          {
            int v12 = 0;
            long long v13 = (void *)v17;
          }
          else
          {
            uint64_t v43 = [v7 xpcServiceIdentifier];
            v2 = (void *)v43;
            if (v43)
            {
              int v12 = 0;
              long long v13 = (void *)v43;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v72;
          v70 = "ExceededTimeLimit_FinishTaskUnbounded";
          break;
        case 10005:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v18 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v18;
          if (v18)
          {
            int v12 = 0;
            long long v13 = (void *)v18;
          }
          else
          {
            uint64_t v44 = [v7 xpcServiceIdentifier];
            v2 = (void *)v44;
            if (v44)
            {
              int v12 = 0;
              long long v13 = (void *)v44;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v73;
          v70 = "ExceededTimeLimit_Continuous";
          break;
        case 10006:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v19 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v19;
          if (v19)
          {
            int v12 = 0;
            long long v13 = (void *)v19;
          }
          else
          {
            uint64_t v45 = [v7 xpcServiceIdentifier];
            v2 = (void *)v45;
            if (v45)
            {
              int v12 = 0;
              long long v13 = (void *)v45;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v74;
          v70 = "ExceededTimeLimit_BackgroundContentFetching";
          break;
        case 10007:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v20 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v20;
          if (v20)
          {
            int v12 = 0;
            long long v13 = (void *)v20;
          }
          else
          {
            uint64_t v46 = [v7 xpcServiceIdentifier];
            v2 = (void *)v46;
            if (v46)
            {
              int v12 = 0;
              long long v13 = (void *)v46;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v75;
          v70 = "ExceededTimeLimit_NotificationAction";
          break;
        case 10008:
          uint64_t v9 = rbs_sp_telemetry_log();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v21 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v21;
          if (v21)
          {
            int v12 = 0;
            long long v13 = (void *)v21;
          }
          else
          {
            uint64_t v47 = [v7 xpcServiceIdentifier];
            v2 = (void *)v47;
            if (v47)
            {
              int v12 = 0;
              long long v13 = (void *)v47;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v76;
          v70 = "ExceededTimeLimit_PIP";
          break;
        default:
          goto LABEL_90;
      }
      goto LABEL_205;
    }
    switch(v8)
    {
      case 50000:
        uint64_t v9 = rbs_sp_telemetry_log();
        if (os_signpost_enabled(v9))
        {
          uint64_t v38 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v38;
          if (v38)
          {
            int v12 = 0;
            long long v13 = (void *)v38;
          }
          else
          {
            uint64_t v66 = [v7 xpcServiceIdentifier];
            v2 = (void *)v66;
            if (v66)
            {
              int v12 = 0;
              long long v13 = (void *)v66;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v95;
          v70 = "ExceededTimeLimit_FinishTaskAfterBackgroundContentFetching";
          goto LABEL_205;
        }
        break;
      case 50003:
        uint64_t v9 = rbs_sp_telemetry_log();
        if (os_signpost_enabled(v9))
        {
          uint64_t v39 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v39;
          if (v39)
          {
            int v12 = 0;
            long long v13 = (void *)v39;
          }
          else
          {
            uint64_t v67 = [v7 xpcServiceIdentifier];
            v2 = (void *)v67;
            if (v67)
            {
              int v12 = 0;
              long long v13 = (void *)v67;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v96;
          v70 = "ExceededTimeLimit_FinishTaskAfterNotificationAction";
          goto LABEL_205;
        }
        break;
      case 50004:
        uint64_t v9 = rbs_sp_telemetry_log();
        if (os_signpost_enabled(v9))
        {
          uint64_t v15 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v15;
          if (v15)
          {
            int v12 = 0;
            long long v13 = (void *)v15;
          }
          else
          {
            uint64_t v65 = [v7 xpcServiceIdentifier];
            v2 = (void *)v65;
            if (v65)
            {
              int v12 = 0;
              long long v13 = (void *)v65;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v94;
          v70 = "ExceededTimeLimit_FinishTaskAfterWatchConnectivity";
          goto LABEL_205;
        }
        break;
      default:
LABEL_90:
        uint64_t v9 = rbs_sp_telemetry_log();
        if (os_signpost_enabled(v9))
        {
          uint64_t v40 = [v7 embeddedApplicationIdentifier];
          long long v11 = (void *)v40;
          if (v40)
          {
            int v12 = 0;
            long long v13 = (void *)v40;
          }
          else
          {
            uint64_t v68 = [v7 xpcServiceIdentifier];
            v2 = (void *)v68;
            if (v68)
            {
              int v12 = 0;
              long long v13 = (void *)v68;
            }
            else
            {
              long long v13 = [v7 consistentLaunchdJobLabel];
              int v12 = 1;
            }
          }
          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v97;
          v70 = "AssertionTimedOut";
LABEL_205:
          _os_signpost_emit_with_name_impl(&dword_226AB3000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v70, "BundleIdOverride=%{public, signpost.description:attribute}@ permittedBackgroundDuration=%{public, signpost.telemetry:number1}f enableTelemetry=YES ", (uint8_t *)&v98, 0x16u);
          if (v12) {

          }
          if (!v11) {
        }
          }
        break;
    }
LABEL_210:
  }
}

uint64_t __53__RBDaemon_assertionManager_didInvalidateAssertions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) executeTerminateRequest:*(void *)(a1 + 40) completion:0];
}

- (void)assertionManager:(id)a3 didRejectAcquisitionFromOriginatorWithExcessiveAssertions:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F64638];
  uint64_t v8 = [NSString stringWithFormat:@"Process %@ has an excessive number of assertions. Direct this report to owners of that process", v6];
  uint64_t v9 = [v7 defaultContextWithExplanation:v8];

  [v9 setPreventIfBeingDebugged:1];
  [v9 setReportType:1];
  [v9 setExceptionCode:3490524077];
  uint64_t v10 = [v6 identity];
  long long v11 = rbs_sp_telemetry_log();
  if (os_signpost_enabled(v11))
  {
    uint64_t v12 = [v10 embeddedApplicationIdentifier];
    long long v13 = (void *)v12;
    if (v12)
    {
      int v14 = 0;
      uint64_t v15 = (void *)v12;
    }
    else
    {
      uint64_t v16 = [v10 xpcServiceIdentifier];
      id v4 = (void *)v16;
      if (v16)
      {
        int v14 = 0;
        uint64_t v15 = (void *)v16;
      }
      else
      {
        uint64_t v15 = [v10 consistentLaunchdJobLabel];
        int v14 = 1;
      }
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v15;
    _os_signpost_emit_with_name_impl(&dword_226AB3000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RBAssertionMaxCountReached_ProcessTerminated", "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ", buf, 0xCu);
    if (v14) {

    }
    if (!v13) {
  }
    }

  id v17 = objc_alloc(MEMORY[0x263F64640]);
  uint64_t v18 = (void *)MEMORY[0x263F645D8];
  uint64_t v19 = [v6 identifier];
  uint64_t v20 = [v18 predicateMatchingIdentifier:v19];
  uint64_t v21 = (void *)[v17 initWithPredicate:v20 context:v9];

  uint64_t v22 = [MEMORY[0x263F64650] sharedBackgroundWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __87__RBDaemon_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions___block_invoke;
  block[3] = &unk_2647C7B98;
  block[4] = self;
  id v25 = v21;
  id v23 = v21;
  dispatch_async(v22, block);
}

uint64_t __87__RBDaemon_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) executeTerminateRequest:*(void *)(a1 + 40) completion:0];
}

- (void)processManager:(id)a3 didReconnectProcesses:(id)a4
{
  [(RBProcessReconnectManager *)self->_reconnectManager reconnectProcesses:a4];
  listener = self->_listener;
  -[RBConnectionListener start]((uint64_t)listener);
}

- (void)bundlePropertiesManager:(id)a3 didChangePropertiesForProcessIdentities:(id)a4
{
}

void __27__RBDaemon__sharedInstance__block_invoke()
{
  id v0 = [RBDaemon alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)RBDaemon;
    id v0 = (RBDaemon *)objc_msgSendSuper2(&v2, sel_init);
  }
  v1 = (void *)_sharedInstance___sharedInstance;
  _sharedInstance___sharedInstance = (uint64_t)v0;
}

- (uint64_t)setLowDiskIOPolicy
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t result = setiopolicy_np(9, 0, 1);
    if (result) {
      [(RBDaemon *)&v1 setLowDiskIOPolicy];
    }
  }
  return result;
}

- (void)watchdogRegister
{
  v3[5] = *MEMORY[0x263EF8340];
  if (a1)
  {
    wd_endpoint_register();
    +[RBConnectionListener sharedConnectionWorkloop]();
    v3[1] = +[RBAssertionManager sharedWorkloop];
    v3[2] = [MEMORY[0x263F64468] handshakeQueue];
    v3[3] = [MEMORY[0x263F64468] connectionQueue];
    +[RBProcessManager stateApplicationQueue];
    v3[4] = uint64_t v1 = 0;
    do
    {
      wd_endpoint_add_queue();
      v1 += 8;
    }
    while (v1 != 40);
    wd_endpoint_activate();
    for (uint64_t i = 4; i != -1; --i)
  }
}

void __19__RBDaemon_process__block_invoke(uint64_t a1)
{
  id v10 = [MEMORY[0x263F64580] identifierWithPid:getpid()];
  objc_super v2 = (void *)MEMORY[0x263F64598];
  uint64_t v3 = [MEMORY[0x263F08AB0] processInfo];
  id v4 = [v3 environment];
  id v5 = [v4 objectForKey:@"XPC_SERVICE_NAME"];
  id v6 = [v2 identityForDaemonJobLabel:v5];

  uint64_t v7 = [MEMORY[0x263F645A8] instanceWithIdentifier:v10 identity:v6];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 80) processForInstance:v7];
  uint64_t v9 = (void *)process_process;
  process_process = v8;
}

- (RBAssertionOriginatorPidPersisting)assertionOriginatorPidStore
{
  return (RBAssertionOriginatorPidPersisting *)self->_assertionOriginatorPidStore;
}

- (RBJetsamPropertyManaging)jetsamPropertyManager
{
  return (RBJetsamPropertyManaging *)self->_jetsamPropertyManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_extensionDataProvider, 0);
  objc_storeStrong((id *)&self->_coalitionManager, 0);
  objc_storeStrong((id *)&self->_historicalStatistics, 0);
  objc_storeStrong((id *)&self->_thermalResponseManager, 0);
  objc_storeStrong((id *)&self->_throttleBestEffortNetworkingManager, 0);
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_reconnectManager, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processManager, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_jetsamPropertyManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_assertionOriginatorPidStore, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_assertionDescriptorValidator, 0);
}

- (void)setLowDiskIOPolicy
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  __error();
  objc_super v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end