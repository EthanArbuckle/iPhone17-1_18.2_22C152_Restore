@interface SPLocalBeaconManager
+ (id)scheduleDateInterval:(id)a3;
- (BOOL)alreadyPoisonedLocalBeacon;
- (BOOL)beaconFromNVRAM;
- (BOOL)currentBeaconingState;
- (BOOL)forceBeaconingOff;
- (BOOL)initialStateChangeSent;
- (BOOL)isOfflineFindingEnabled;
- (BOOL)schedulePeriodicActionXpcActivity;
- (FMXPCActivity)periodicActionXpcActivity;
- (FMXPCServiceDescription)findMyBeaconingDaemonServiceDescription;
- (FMXPCServiceDescription)spdServiceDescription;
- (FMXPCSession)findMyBeaconDaemonSession;
- (FMXPCSession)spdSession;
- (NSData)selfBeaconingDerivedSharedSecretKey;
- (NSData)selfBeaconingPublicKey;
- (NSDate)selfBeaconingPairDate;
- (NSDictionary)selfBeaconingConfigurations;
- (NSUUID)selfBeaconingUUID;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)periodicActionDispatchTimer;
- (SPBLEStateMonitor)bleMonitor;
- (SPLocalBeaconManager)init;
- (SPLocalBeaconManagerXPCProtocol)findMyBeaconDaemonProxy;
- (SPLocalBeaconManagerXPCProtocol)searchPartyDaemonProxy;
- (SPLocalBeaconManagerXPCProtocol)userAgentProxy;
- (SPMonitorsWrapper)monitorWrapper;
- (double)periodicActionXpcActivityInterval;
- (double)timeIntervalToNextFireDateFromDate:(id)a3;
- (id)beaconingKeyChangedBlockWithCompletion;
- (id)dateIntervalForIndex:(unint64_t)a3 baseDate:(id)a4;
- (id)generateOfflineAdvertisingKeysForReason:(int64_t)a3 now:(id)a4;
- (id)rawNVRAMData;
- (id)remoteInterface;
- (id)stateChangedBlockWithCompletion;
- (id)statusChangedBlockWithCompletion;
- (id)xpcActivityCriteria:(id)a3;
- (int64_t)cachedLocalBeaconManagerState;
- (unint64_t)bucketWithBaseTime:(id)a3 date:(id)a4;
- (unint64_t)selfBeaconingIndex;
- (unsigned)currentStatus;
- (void)_invalidate;
- (void)beaconingStateChanged:(int64_t)a3;
- (void)beaconingStateChangedNotification:(id)a3;
- (void)beaconsChanged:(id)a3;
- (void)bleMonitor:(id)a3 didChangeState:(unint64_t)a4;
- (void)dealloc;
- (void)generateBeaconingKeysOfType:(int64_t)a3 now:(id)a4 withCompletion:(id)a5;
- (void)handlerForActivity:(id)a3 state:(int64_t)a4;
- (void)invalidate;
- (void)localActivationLockInfoChanged;
- (void)notifyBeaconingKeysChangedBlockWithCompletion:(id)a3;
- (void)notifyNearbyTokensChangedBlockWithCompletion:(id)a3;
- (void)notifyStateChange:(BOOL)a3;
- (void)notifyStatusChange:(unsigned __int8)a3;
- (void)periodicActionWithCompletion:(id)a3;
- (void)refreshBeaconingState;
- (void)setAlreadyPoisonedLocalBeacon:(BOOL)a3;
- (void)setBeaconFromNVRAM:(BOOL)a3;
- (void)setBeaconingKeyChangedBlockWithCompletion:(id)a3;
- (void)setBleMonitor:(id)a3;
- (void)setCachedLocalBeaconManagerState:(int64_t)a3;
- (void)setCurrentBeaconingState:(BOOL)a3;
- (void)setCurrentStatus:(unsigned __int8)a3;
- (void)setFindMyBeaconDaemonProxy:(id)a3;
- (void)setFindMyBeaconDaemonSession:(id)a3;
- (void)setFindMyBeaconingDaemonServiceDescription:(id)a3;
- (void)setForceBeaconingOff:(BOOL)a3;
- (void)setInitialStateChangeSent:(BOOL)a3;
- (void)setIsOfflineFindingEnabled:(BOOL)a3;
- (void)setMonitorWrapper:(id)a3;
- (void)setPeriodicActionDispatchTimer:(id)a3;
- (void)setPeriodicActionDispatchTimerWithInterval:(double)a3;
- (void)setPeriodicActionXpcActivity:(id)a3;
- (void)setPeriodicActionXpcActivityInterval:(double)a3;
- (void)setQueue:(id)a3;
- (void)setSchedulePeriodicActionXpcActivity:(BOOL)a3;
- (void)setSearchPartyDaemonProxy:(id)a3;
- (void)setSelfBeaconingConfigurations:(id)a3;
- (void)setSelfBeaconingDerivedSharedSecretKey:(id)a3;
- (void)setSelfBeaconingIndex:(unint64_t)a3;
- (void)setSelfBeaconingPairDate:(id)a3;
- (void)setSelfBeaconingPublicKey:(id)a3;
- (void)setSelfBeaconingUUID:(id)a3;
- (void)setSpdServiceDescription:(id)a3;
- (void)setSpdSession:(id)a3;
- (void)setStateChangedBlockWithCompletion:(id)a3;
- (void)setStatusChangedBlockWithCompletion:(id)a3;
- (void)setUserAgentProxy:(id)a3;
- (void)start;
- (void)stateDidChange:(BOOL)a3 powerState:(unint64_t)a4;
- (void)timerFired;
- (void)updateStateFromNVRAM;
@end

@implementation SPLocalBeaconManager

void __34__SPLocalBeaconManager_invalidate__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SPLocalBeaconManager_invalidate__block_invoke_2;
  block[3] = &unk_1E601B790;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_invalidate
{
  v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconMangager invalidate called.", v14, 2u);
  }

  v4 = [(SPLocalBeaconManager *)self monitorWrapper];
  [v4 stop];

  [(SPLocalBeaconManager *)self setMonitorWrapper:0];
  v5 = [(SPLocalBeaconManager *)self periodicActionXpcActivity];

  if (v5)
  {
    [(SPLocalBeaconManager *)self setSchedulePeriodicActionXpcActivity:0];
    v6 = [(SPLocalBeaconManager *)self periodicActionXpcActivity];
    [v6 updateCriteria];

    [(SPLocalBeaconManager *)self setPeriodicActionXpcActivity:0];
  }
  v7 = [(SPLocalBeaconManager *)self periodicActionDispatchTimer];

  if (v7)
  {
    v8 = [(SPLocalBeaconManager *)self periodicActionDispatchTimer];
    dispatch_source_cancel(v8);
  }
  [(SPLocalBeaconManager *)self setPeriodicActionDispatchTimer:0];
  v9 = [(SPLocalBeaconManager *)self spdSession];
  [v9 invalidate];

  [(SPLocalBeaconManager *)self setSpdSession:0];
  v10 = [(SPLocalBeaconManager *)self findMyBeaconDaemonSession];
  [v10 invalidate];

  [(SPLocalBeaconManager *)self setFindMyBeaconDaemonSession:0];
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SPBeaconsChangedNotification", 0);
  v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v13, self, @"SPBeaconingStateChangedNotification", 0);
}

- (FMXPCSession)spdSession
{
  return self->_spdSession;
}

- (void)setSpdSession:(id)a3
{
}

- (void)setPeriodicActionDispatchTimer:(id)a3
{
}

- (void)setMonitorWrapper:(id)a3
{
}

- (void)setFindMyBeaconDaemonSession:(id)a3
{
}

- (FMXPCActivity)periodicActionXpcActivity
{
  return self->_periodicActionXpcActivity;
}

- (OS_dispatch_source)periodicActionDispatchTimer
{
  return self->_periodicActionDispatchTimer;
}

- (SPMonitorsWrapper)monitorWrapper
{
  return self->_monitorWrapper;
}

- (FMXPCSession)findMyBeaconDaemonSession
{
  return self->_findMyBeaconDaemonSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfBeaconingConfigurations, 0);
  objc_storeStrong((id *)&self->_selfBeaconingPublicKey, 0);
  objc_storeStrong((id *)&self->_selfBeaconingDerivedSharedSecretKey, 0);
  objc_storeStrong((id *)&self->_selfBeaconingPairDate, 0);
  objc_storeStrong((id *)&self->_selfBeaconingUUID, 0);
  objc_storeStrong((id *)&self->_bleMonitor, 0);
  objc_storeStrong((id *)&self->_monitorWrapper, 0);
  objc_storeStrong((id *)&self->_periodicActionDispatchTimer, 0);
  objc_storeStrong((id *)&self->_periodicActionXpcActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_findMyBeaconDaemonProxy, 0);
  objc_storeStrong((id *)&self->_searchPartyDaemonProxy, 0);
  objc_storeStrong((id *)&self->_findMyBeaconDaemonSession, 0);
  objc_storeStrong((id *)&self->_spdSession, 0);
  objc_storeStrong((id *)&self->_findMyBeaconingDaemonServiceDescription, 0);
  objc_storeStrong((id *)&self->_spdServiceDescription, 0);
  objc_storeStrong(&self->_beaconingKeyChangedBlockWithCompletion, 0);
  objc_storeStrong(&self->_statusChangedBlockWithCompletion, 0);

  objc_storeStrong(&self->_stateChangedBlockWithCompletion, 0);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Dealloc %{public}@", buf, 0xCu);
  }

  [(SPLocalBeaconManager *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SPLocalBeaconManager;
  [(SPLocalBeaconManager *)&v4 dealloc];
}

- (void)invalidate
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __34__SPLocalBeaconManager_invalidate__block_invoke;
  activity_block[3] = &unk_1E601B790;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: invalidate", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __34__SPLocalBeaconManager_invalidate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (SPLocalBeaconManager)init
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)SPLocalBeaconManager;
  v2 = [(SPLocalBeaconManager *)&v33 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SPLocalBeaconManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    if (os_variant_has_internal_content())
    {
      v6 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v7 = [v6 environment];
      v8 = [v7 objectForKeyedSubscript:@"UNDER_TEST"];
      BOOL v9 = v8 == 0;

      if (!v9) {
        return v2;
      }
    }
    id v10 = objc_alloc(MEMORY[0x1E4F61588]);
    v11 = [(SPLocalBeaconManager *)v2 remoteInterface];
    uint64_t v12 = [v10 initWithMachServiceName:@"com.apple.icloud.searchpartyd.beaconmanager" options:0 remoteObjectInterface:v11 interruptionHandler:0 invalidationHandler:0];
    spdServiceDescription = v2->_spdServiceDescription;
    v2->_spdServiceDescription = (FMXPCServiceDescription *)v12;

    if (_os_feature_enabled_impl()) {
      v14 = @"com.apple.findmy.LocalBeaconing";
    }
    else {
      v14 = @"com.apple.icloud.searchpartyd.beaconmanager";
    }
    id v15 = objc_alloc(MEMORY[0x1E4F61588]);
    v16 = [(SPLocalBeaconManager *)v2 remoteInterface];
    uint64_t v17 = [v15 initWithMachServiceName:v14 options:0 remoteObjectInterface:v16 interruptionHandler:0 invalidationHandler:0];
    findMyBeaconingDaemonServiceDescription = v2->_findMyBeaconingDaemonServiceDescription;
    v2->_findMyBeaconingDaemonServiceDescription = (FMXPCServiceDescription *)v17;

    v19 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v2;
      _os_log_impl(&dword_1B2FD8000, v19, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Created %{public}@", buf, 0xCu);
    }
  }
  if (((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()) && runningInBluetoothd())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__SPLocalBeaconManager_init__block_invoke;
    block[3] = &unk_1E601B790;
    v32 = v2;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
  }
  if (runningInBluetoothd())
  {
    objc_initWeak((id *)buf, v2);
    v20 = [MEMORY[0x1E4F28F80] processInfo];
    v21 = [v20 processName];

    v22 = [NSString stringWithFormat:@"com.apple.icloud.searchpartyd.SPBeaconManager.%@", v21];
    id v23 = objc_alloc(MEMORY[0x1E4F61578]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __28__SPLocalBeaconManager_init__block_invoke_2;
    v29[3] = &unk_1E601BCC0;
    objc_copyWeak(&v30, (id *)buf);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __28__SPLocalBeaconManager_init__block_invoke_3;
    v27[3] = &unk_1E601BCE8;
    objc_copyWeak(&v28, (id *)buf);
    v24 = (void *)[v23 initWithName:v22 qos:17 criteriaBlock:v29 handler:v27];
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    [WeakRetained setPeriodicActionXpcActivity:v24];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);

    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void *__28__SPLocalBeaconManager_init__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)bluetoothContextStartup(result);
  }
  return result;
}

id __28__SPLocalBeaconManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained xpcActivityCriteria:v3];

  return v5;
}

void __28__SPLocalBeaconManager_init__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  dispatch_queue_t v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager periodic action xpc timer fired", v8, 2u);
  }

  [WeakRetained handlerForActivity:v5 state:a3];
}

- (SPLocalBeaconManagerXPCProtocol)searchPartyDaemonProxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SPLocalBeaconManager *)self queue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(SPLocalBeaconManager *)self spdSession];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    v6 = [(SPLocalBeaconManager *)self spdServiceDescription];
    uint64_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPLocalBeaconManager *)self setSpdSession:v7];

    v8 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(SPLocalBeaconManager *)self spdServiceDescription];
      id v10 = [v9 machService];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    v11 = [(SPLocalBeaconManager *)self spdSession];
    [v11 resume];
  }
  uint64_t v12 = [(SPLocalBeaconManager *)self spdSession];
  v13 = [v12 proxy];

  return (SPLocalBeaconManagerXPCProtocol *)v13;
}

- (SPLocalBeaconManagerXPCProtocol)findMyBeaconDaemonProxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SPLocalBeaconManager *)self queue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(SPLocalBeaconManager *)self findMyBeaconDaemonSession];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    v6 = [(SPLocalBeaconManager *)self findMyBeaconingDaemonServiceDescription];
    uint64_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPLocalBeaconManager *)self setFindMyBeaconDaemonSession:v7];

    v8 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(SPLocalBeaconManager *)self findMyBeaconingDaemonServiceDescription];
      id v10 = [v9 machService];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    v11 = [(SPLocalBeaconManager *)self findMyBeaconDaemonSession];
    [v11 resume];
  }
  uint64_t v12 = [(SPLocalBeaconManager *)self findMyBeaconDaemonSession];
  v13 = [v12 proxy];

  return (SPLocalBeaconManagerXPCProtocol *)v13;
}

- (id)remoteInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B424B0];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  dispatch_queue_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_beaconingKeysOfType_withCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (id)rawNVRAMData
{
  v2 = +[SPNVRAM read];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)localActivationLockInfoChanged
{
  id v3 = [(SPLocalBeaconManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SPLocalBeaconManager_localActivationLockInfoChanged__block_invoke;
  block[3] = &unk_1E601B790;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __54__SPLocalBeaconManager_localActivationLockInfoChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStateFromNVRAM];
}

- (void)updateStateFromNVRAM
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B2FD8000, v0, v1, "*** Forcing NVRAM beaconing because _qa_forceBeaconFromNVRAM set", v2, v3, v4, v5, v6);
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_2((uint64_t)v6, v7);
    }
  }
  else
  {
    if (v5)
    {
      v8 = LogCategory_OfflineAdvertising();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "Read FMDActivationLockInfo: %@", buf, 0xCu);
      }

      uint64_t v9 = [v5 isOfflineFindingEnabled];
      id v10 = *(void **)(a1 + 32);
    }
    else
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v9 = 0;
    }
    [v10 setIsOfflineFindingEnabled:v9];
    v11 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_1(a1, v11);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_124;
    v12[3] = &unk_1E601BD10;
    v12[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v13, (id *)(a1 + 40));
    _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: Calling beaconingStateChanged (post-erase)", OS_ACTIVITY_FLAG_DEFAULT, v12);
    objc_destroyWeak(&v13);
  }
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_124(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_2;
  block[3] = &unk_1E601BA30;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCachedLocalBeaconManagerState:1];
  [WeakRetained beaconingStateChanged:1];
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_OfflineAdvertising();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "poisonBeaconIdentifier %@ success.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)start
{
  uint64_t v3 = [(SPLocalBeaconManager *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SPLocalBeaconManager_start__block_invoke;
  v5[3] = &unk_1E601B920;
  id v6 = v3;
  uint64_t v7 = self;
  id v4 = v3;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: start", OS_ACTIVITY_FLAG_DEFAULT, v5);
}

uint64_t __29__SPLocalBeaconManager_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager start called.", buf, 2u);
  }

  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    uint64_t v3 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "BA_LPEM || BA_Power_Off is ENABLED", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__SPLocalBeaconManager_start__block_invoke_126;
    block[3] = &unk_1E601B790;
    id v4 = *(NSObject **)(a1 + 32);
    void block[4] = *(void *)(a1 + 40);
    dispatch_sync(v4, block);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __29__SPLocalBeaconManager_start__block_invoke_2;
  v13[3] = &unk_1E601B790;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  v13[4] = *(void *)(a1 + 40);
  dispatch_async(v5, v13);
  id v6 = [[SPMonitorsWrapper alloc] initWithBeaconManager:*(void *)(a1 + 40) delegateQueue:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setMonitorWrapper:v6];

  uint64_t v7 = [*(id *)(a1 + 40) monitorWrapper];
  [v7 start];

  v8 = objc_opt_new();
  [*(id *)(a1 + 40) setBleMonitor:v8];

  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = [v9 bleMonitor];
  [v10 setDelegate:v9];

  v11 = [*(id *)(a1 + 40) bleMonitor];
  [v11 startMonitoring];

  return [*(id *)(a1 + 40) refreshBeaconingState];
}

uint64_t __29__SPLocalBeaconManager_start__block_invoke_126(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStateFromNVRAM];
}

void __29__SPLocalBeaconManager_start__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SPLocalBeaconManager_start__block_invoke_3;
  block[3] = &unk_1E601B790;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v2 = (void *)MEMORY[0x1B3EB48A0]();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel_beaconsChanged_ name:@"SPBeaconsChanged" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel_beaconingStateChangedNotification_ name:@"SPBeaconingStateChanged" object:0];
}

void __29__SPLocalBeaconManager_start__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1B3EB48A0]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)beaconsChangedTrampoline, @"SPBeaconsChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, *(const void **)(a1 + 32), (CFNotificationCallback)beaconingStateChangedTrampoline, @"SPBeaconingStateChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, *(const void **)(a1 + 32), (CFNotificationCallback)localActivationLockInfoChangedTrampoline, (CFStringRef)*MEMORY[0x1E4F61A50], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)beaconingStateChangedNotification:(id)a3
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke;
  activity_block[3] = &unk_1E601B790;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: beaconingStateChangedNotification:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[SPLocalBeaconManager beaconingStateChangedNotification:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPI: %s", buf, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke_134;
  block[3] = &unk_1E601B790;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

uint64_t __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke_134(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshBeaconingState];
}

- (void)beaconsChanged:(id)a3
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__SPLocalBeaconManager_beaconsChanged___block_invoke;
  activity_block[3] = &unk_1E601B790;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: beaconsChanged:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __39__SPLocalBeaconManager_beaconsChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: beaconsChanged", buf, 2u);
  }

  if (([*(id *)(a1 + 32) beaconFromNVRAM] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__SPLocalBeaconManager_beaconsChanged___block_invoke_135;
    block[3] = &unk_1E601B790;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

uint64_t __39__SPLocalBeaconManager_beaconsChanged___block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicActionWithCompletion:0];
}

- (void)beaconingStateChanged:(int64_t)a3
{
  if ([(SPLocalBeaconManager *)self beaconFromNVRAM]) {
    a3 = [(SPLocalBeaconManager *)self isOfflineFindingEnabled];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke;
  v5[3] = &unk_1E601BB60;
  void v5[4] = self;
  v5[5] = a3;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: beaconsChanged:", OS_ACTIVITY_FLAG_DEFAULT, v5);
}

uint64_t __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v20 = "-[SPLocalBeaconManager beaconingStateChanged:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPI: %s", buf, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [*(id *)(a1 + 32) monitorWrapper];
  int v5 = [v4 isNetworkUp];

  id v6 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    *(void *)v20 = v7;
    *(_WORD *)&v20[8] = 1024;
    *(_DWORD *)v21 = v5;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: beaconingStateChanged: %ld networkState: %d", buf, 0x12u);
  }

  int v8 = [*(id *)(a1 + 32) currentBeaconingState];
  switch(*(void *)(a1 + 40))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0:
      [*(id *)(a1 + 32) setCurrentBeaconingState:0];
      uint64_t v9 = [*(id *)(a1 + 32) monitorWrapper];
      [v9 pause];
      goto LABEL_10;
    case 1:
      int v10 = 1;
      [*(id *)(a1 + 32) setCurrentBeaconingState:1];
      uint64_t v9 = [*(id *)(a1 + 32) monitorWrapper];
      [v9 resume];
      goto LABEL_11;
    case 2:
      [*(id *)(a1 + 32) setCurrentBeaconingState:v5 ^ 1u];
      uint64_t v9 = [*(id *)(a1 + 32) monitorWrapper];
      [v9 resume];
LABEL_10:
      int v10 = 0;
LABEL_11:

      break;
    default:
      int v10 = 0;
      break;
  }
  v11 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [*(id *)(a1 + 32) initialStateChangeSent];
    int v13 = [*(id *)(a1 + 32) currentBeaconingState];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v20 = v12;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v8;
    *(_WORD *)v21 = 1024;
    *(_DWORD *)&v21[2] = v13;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "Initial state changed? [%i], Old beaconing state [%i], current state [%i] requestNewKeys [%i]", buf, 0x1Au);
  }

  if (((v10 | [*(id *)(a1 + 32) initialStateChangeSent] ^ 1) & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) currentBeaconingState], v8 != result))
  {
    if (v8 != [*(id *)(a1 + 32) currentBeaconingState])
    {
      id v15 = LogCategory_SystemHealth();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [*(id *)(a1 + 32) currentBeaconingState];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v20 = v16;
        _os_log_impl(&dword_1B2FD8000, v15, OS_LOG_TYPE_DEFAULT, "Beaconing state changed to %i", buf, 8u);
      }
    }
    if ((v10 & [*(id *)(a1 + 32) initialStateChangeSent]) == 1) {
      [*(id *)(a1 + 32) notifyBeaconingKeysChangedBlockWithCompletion:&__block_literal_global_6];
    }
    if ((v8 & 1) != 0 || ![*(id *)(a1 + 32) currentBeaconingState])
    {
      objc_msgSend(*(id *)(a1 + 32), "notifyStateChange:", objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState"));
    }
    else
    {
      uint64_t v17 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke_138;
      v18[3] = &unk_1E601B790;
      v18[4] = v17;
      [v17 periodicActionWithCompletion:v18];
    }
    return [*(id *)(a1 + 32) setInitialStateChangeSent:1];
  }
  return result;
}

void __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke_136(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: notifyBeaconingKeysChangedBlockWithCompletion completion: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke_138(uint64_t a1)
{
  if ([*(id *)(a1 + 32) currentBeaconingState]) {
    objc_msgSend(*(id *)(a1 + 32), "notifyStatusChange:", objc_msgSend(*(id *)(a1 + 32), "currentStatus"));
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 currentBeaconingState];

  return [v2 notifyStateChange:v3];
}

- (void)notifyStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = [[SPPowerAssertion alloc] initWithReason:@"SPBeaconManager.stateChanged" type:1 timeout:5.0];
  [(SPPowerAssertion *)v5 hold];
  uint64_t v6 = [(SPLocalBeaconManager *)self stateChangedBlockWithCompletion];
  uint64_t v7 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    BOOL v13 = v3;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: notifyStateChange: %ld ", buf, 0xCu);
  }

  if (v6)
  {
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __42__SPLocalBeaconManager_notifyStateChange___block_invoke;
    activity_block[3] = &unk_1E601BDA8;
    id v10 = v6;
    BOOL v11 = v3;
    uint64_t v9 = v5;
    _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: Calling stateChangedBlock", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

void __42__SPLocalBeaconManager_notifyStateChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__SPLocalBeaconManager_notifyStateChange___block_invoke_2;
  v3[3] = &unk_1E601BD80;
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v1, v3);
}

uint64_t __42__SPLocalBeaconManager_notifyStateChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "stateChangedBlockWithCompletion completed with status - %li", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 32) drop];
}

- (void)notifyStatusChange:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = [[SPPowerAssertion alloc] initWithReason:@"SPBeaconManager.statusChanged" type:1 timeout:5.0];
  [(SPPowerAssertion *)v5 hold];
  int v6 = [(SPLocalBeaconManager *)self statusChangedBlockWithCompletion];
  uint64_t v7 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: notifyStatusChange: %ld ", buf, 0xCu);
  }

  if (v6)
  {
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __43__SPLocalBeaconManager_notifyStatusChange___block_invoke;
    activity_block[3] = &unk_1E601BDA8;
    id v10 = v6;
    char v11 = v3;
    uint64_t v9 = v5;
    _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: Calling statusChangedBlockWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

void __43__SPLocalBeaconManager_notifyStatusChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__SPLocalBeaconManager_notifyStatusChange___block_invoke_2;
  v3[3] = &unk_1E601BD80;
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v1, v3);
}

uint64_t __43__SPLocalBeaconManager_notifyStatusChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "statusChangedBlockWithCompletion completed with status - %li", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 32) drop];
}

- (void)handlerForActivity:(id)a3 state:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v7 = v6;
    [(SPLocalBeaconManager *)self timerFired];
    [v7 done];
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_6;
    }
    id v7 = v6;
    [v6 defer];
  }
  id v6 = v7;
LABEL_6:
}

- (id)xpcActivityCriteria:(id)a3
{
  id v4 = a3;
  if ([(SPLocalBeaconManager *)self schedulePeriodicActionXpcActivity])
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [(SPLocalBeaconManager *)self timeIntervalToNextFireDateFromDate:v5];
    double v7 = v6;
    [(SPLocalBeaconManager *)self periodicActionXpcActivityInterval];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F61580]) initWithPriority:0 repeating:1 delay:(uint64_t)v7 gracePeriod:(uint64_t)(v8 * 0.5) interval:(uint64_t)v8 options:515];
    id v10 = (void *)v9;
    if (v4) {
      char v11 = v4;
    }
    else {
      char v11 = (void *)v9;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (double)timeIntervalToNextFireDateFromDate:(id)a3
{
  id v3 = a3;
  [v3 timeIntervalSinceReferenceDate];
  double v5 = ceil(v4 / 900.0);
  [v3 timeIntervalSinceReferenceDate];
  double v7 = v6;

  return -(v7 - v5 * 900.0);
}

- (void)setPeriodicActionDispatchTimerWithInterval:(double)a3
{
  double v5 = [(SPLocalBeaconManager *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(SPLocalBeaconManager *)self periodicActionDispatchTimer];

  if (v6)
  {
    double v7 = [(SPLocalBeaconManager *)self periodicActionDispatchTimer];
    dispatch_source_cancel(v7);

    [(SPLocalBeaconManager *)self setPeriodicActionDispatchTimer:0];
  }
  if ((a3 < 0.0 || ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(*(void *)&a3 - 1) > 0xFFFFFFFFFFFFELL)
  {
    uint64_t v10 = -1;
    dispatch_time_t v11 = -1;
  }
  else
  {
    uint64_t v10 = (unint64_t)((double)(unint64_t)(a3 * 1000000000.0) * 0.02);
    dispatch_time_t v11 = dispatch_walltime(0, (unint64_t)(a3 * 1000000000.0) - 1);
  }
  id v12 = [(SPLocalBeaconManager *)self queue];
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
  [(SPLocalBeaconManager *)self setPeriodicActionDispatchTimer:v13];

  uint64_t v14 = [(SPLocalBeaconManager *)self periodicActionDispatchTimer];
  dispatch_source_set_timer(v14, v11, 0xFFFFFFFFFFFFFFFFLL, v10);

  objc_initWeak(&location, self);
  id v15 = [(SPLocalBeaconManager *)self periodicActionDispatchTimer];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __67__SPLocalBeaconManager_setPeriodicActionDispatchTimerWithInterval___block_invoke;
  v20 = &unk_1E601BA30;
  objc_copyWeak(&v21, &location);
  dispatch_source_set_event_handler(v15, &v17);

  int v16 = [(SPLocalBeaconManager *)self periodicActionDispatchTimer];
  dispatch_resume(v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __67__SPLocalBeaconManager_setPeriodicActionDispatchTimerWithInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager periodic action dispatch timer fired", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained timerFired];
}

- (void)timerFired
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __34__SPLocalBeaconManager_timerFired__block_invoke;
  activity_block[3] = &unk_1E601B790;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: timerFired", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __34__SPLocalBeaconManager_timerFired__block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager periodic action timer fired", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SPLocalBeaconManager_timerFired__block_invoke_149;
  block[3] = &unk_1E601BA30;
  objc_copyWeak(&v5, buf);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __34__SPLocalBeaconManager_timerFired__block_invoke_149(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained periodicActionWithCompletion:0];
}

- (void)periodicActionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPLocalBeaconManager *)self queue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  double v6 = [(SPLocalBeaconManager *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke;
  v9[3] = &unk_1E601BE48;
  id v7 = v6;
  id v10 = v7;
  dispatch_time_t v11 = self;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  [(SPLocalBeaconManager *)self notifyNearbyTokensChangedBlockWithCompletion:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_2;
  block[3] = &unk_1E601BE20;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v11);
}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_3;
  v5[3] = &unk_1E601BDF8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = *(id *)(a1 + 56);
  [v2 notifyBeaconingKeysChangedBlockWithCompletion:v5];

  objc_destroyWeak(&v10);
}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_4;
  block[3] = &unk_1E601BDD0;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  id v10 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v8 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v14);
}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v2 = *(id *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = v2;
    if (!v3) {
      goto LABEL_8;
    }
    id v5 = [v2 startDate];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;
    id v8 = [*(id *)(a1 + 40) startDate];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;

    if (v7 > v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v12 = [*(id *)(a1 + 40) startDate];
      id v13 = [v4 endDate];
      uint64_t v14 = [v11 initWithStartDate:v12 endDate:v13];

      id v4 = (id)v14;
    }
    id v15 = [v4 endDate];
    [v15 timeIntervalSinceReferenceDate];
    double v17 = v16;
    uint64_t v18 = [*(id *)(a1 + 40) endDate];
    [v18 timeIntervalSinceReferenceDate];
    double v20 = v19;

    if (v17 > v20)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
      __int16 v22 = [v4 startDate];
      int v23 = [*(id *)(a1 + 40) endDate];
      uint64_t v24 = [v21 initWithStartDate:v22 endDate:v23];

      id v4 = (id)v24;
    }
    if (v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = v3;
    if (v4)
    {
LABEL_8:
      v25 = [v4 startDate];
      [v25 timeIntervalSinceNow];
      objc_msgSend(WeakRetained, "setPeriodicActionDispatchTimerWithInterval:");

      [*(id *)(a1 + 48) setSchedulePeriodicActionXpcActivity:1];
      v26 = [v4 endDate];
      v27 = [v4 startDate];
      [v26 timeIntervalSinceDate:v27];
      objc_msgSend(*(id *)(a1 + 48), "setPeriodicActionXpcActivityInterval:");

      goto LABEL_11;
    }
  }
  [*(id *)(a1 + 48) setSchedulePeriodicActionXpcActivity:0];
LABEL_11:
  id v28 = [*(id *)(a1 + 48) periodicActionXpcActivity];
  [v28 updateCriteria];

  uint64_t v29 = *(void *)(a1 + 56);
  if (v29) {
    (*(void (**)(void))(v29 + 16))();
  }
}

- (void)notifyBeaconingKeysChangedBlockWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPLocalBeaconManager *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke;
  void v7[3] = &unk_1E601B828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: notifyBeaconingKeysChangedBlockWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v7);
}

void __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SPLocalBeaconManager notifyBeaconingKeysChangedBlockWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPI: %s", buf, 0xCu);
  }

  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  id v4 = [[SPPowerAssertion alloc] initWithReason:@"SPBeaconManager.notifyBeaconingKeysChanged" type:1 timeout:5.0];
  [(SPPowerAssertion *)v4 hold];
  id v5 = [*(id *)(a1 + 32) beaconingKeyChangedBlockWithCompletion];
  if ([*(id *)(a1 + 32) currentBeaconingState] && v5)
  {
    if (([*(id *)(a1 + 32) beaconFromNVRAM] & 1) != 0
      || ([*(id *)(a1 + 32) monitorWrapper],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 isNetworkUp],
          v6,
          (v7 & 1) == 0))
    {
      uint64_t v9 = 0;
      id v8 = @".wild";
    }
    else
    {
      id v8 = @".nearOwner";
      uint64_t v9 = 1;
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_164;
    double v17 = &unk_1E601BEB8;
    uint64_t v18 = v8;
    id v19 = v3;
    uint64_t v23 = 1907;
    id v21 = v5;
    double v20 = v4;
    id v22 = *(id *)(a1 + 40);
    double v10 = _Block_copy(&v14);
    int v11 = objc_msgSend(*(id *)(a1 + 32), "beaconFromNVRAM", v14, v15, v16, v17);
    uint64_t v12 = *(void **)(a1 + 32);
    if (v11)
    {
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v12 generateBeaconingKeysOfType:v9 now:v13 withCompletion:v10];
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) findMyBeaconDaemonProxy];
      [v13 beaconingKeysOfType:v9 withCompletion:v10];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_164(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 count];
    id v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v40 = v5;
    __int16 v41 = 2114;
    v42 = v6;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "Calling beaconingKeyChangedBlock with %lu %{public}@ keys.", buf, 0x16u);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    *(void *)&long long v9 = 138412802;
    long long v29 = v9;
    id obj = v7;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x1E4F28D48];
        uint64_t v15 = objc_msgSend(v13, "dateInterval", v29);
        double v16 = [v15 startDate];
        double v17 = [v14 stringFromDate:v16 timeZone:*(void *)(a1 + 40) formatOptions:*(void *)(a1 + 72)];

        uint64_t v18 = (void *)MEMORY[0x1E4F28D48];
        id v19 = [v13 dateInterval];
        double v20 = [v19 endDate];
        id v21 = [v18 stringFromDate:v20 timeZone:*(void *)(a1 + 40) formatOptions:*(void *)(a1 + 72)];

        id v22 = LogCategory_BeaconManager();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [v13 key];
          uint64_t v24 = objc_msgSend(v23, "fm_hexString");
          *(_DWORD *)buf = v29;
          uint64_t v40 = (uint64_t)v24;
          __int16 v41 = 2114;
          v42 = v17;
          __int16 v43 = 2114;
          v44 = v21;
          _os_log_impl(&dword_1B2FD8000, v22, OS_LOG_TYPE_DEFAULT, "  key: %@ (%{public}@ - %{public}@)", buf, 0x20u);
        }
      }
      id v7 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v10);
  }

  v25 = *(void **)(a1 + 56);
  if (v25)
  {
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_166;
    activity_block[3] = &unk_1E601BE70;
    id v34 = v25;
    id v32 = v7;
    id v33 = *(id *)(a1 + 48);
    _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: Calling beaconingKeyChangedBlockWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    uint64_t v26 = *(void **)(a1 + 48);
    if (v26) {
      [v26 drop];
    }
  }
  if ([v7 count])
  {
    v27 = objc_msgSend(v7, "fm_map:", &__block_literal_global_170);
    id v28 = +[SPLocalBeaconManager scheduleDateInterval:v27];
  }
  else
  {
    id v28 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_166(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601BD80;
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v1, v3);
}

uint64_t __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "beaconingKeyChangedBlockWithCompletion completed with status - %li", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 32) drop];
}

uint64_t __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_167(uint64_t a1, void *a2)
{
  return [a2 dateInterval];
}

- (void)notifyNearbyTokensChangedBlockWithCompletion:(id)a3
{
}

+ (id)scheduleDateInterval:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)[v3 mutableCopy];
    uint64_t v5 = [v4 firstObject];
    [v4 removeObjectAtIndex:0];
    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__1;
    double v20 = __Block_byref_object_dispose__1;
    id v21 = [v5 endDate];
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__1;
    uint64_t v14 = __Block_byref_object_dispose__1;
    id v15 = [v5 endDate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__SPLocalBeaconManager_scheduleDateInterval___block_invoke;
    v9[3] = &unk_1E601BEE0;
    void v9[4] = &v16;
    v9[5] = &v10;
    [v4 enumerateObjectsUsingBlock:v9];
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v7 = (void *)[v6 initWithStartDate:v17[5] endDate:v11[5]];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __45__SPLocalBeaconManager_scheduleDateInterval___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 endDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceReferenceDate];
  if (v5 >= v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSinceReferenceDate];
    if (v5 <= v9) {
      goto LABEL_6;
    }
    uint64_t v7 = [v12 endDate];
    uint64_t v8 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v7 = [v12 endDate];
    uint64_t v8 = *(void *)(a1 + 32);
  }
  uint64_t v10 = *(void *)(v8 + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;

LABEL_6:
}

- (void)refreshBeaconingState
{
  objc_initWeak(&location, self);
  id v3 = [(SPLocalBeaconManager *)self queue];
  if (![(SPLocalBeaconManager *)self beaconFromNVRAM])
  {
    double v4 = [(SPLocalBeaconManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke;
    block[3] = &unk_1E601BB38;
    objc_copyWeak(&v7, &location);
    id v6 = v3;
    dispatch_async(v4, block);

    objc_destroyWeak(&v7);
  }

  objc_destroyWeak(&location);
}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v4 = [WeakRetained findMyBeaconDaemonProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_2;
  v5[3] = &unk_1E601BF58;
  id v6 = *(id *)(a1 + 32);
  objc_copyWeak(&v7, v2);
  [v4 beaconingStateWithCompletion:v5];

  objc_destroyWeak(&v7);
}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_2(uint64_t a1, void *a2)
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_3;
  activity_block[3] = &unk_1E601BF30;
  id v5 = *(id *)(a1 + 32);
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalBeaconManager: Calling beaconingStateChanged", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(v6);
}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_4;
  v3[3] = &unk_1E601BF08;
  objc_copyWeak(v4, (id *)(a1 + 40));
  v4[1] = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
  objc_destroyWeak(v4);
}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCachedLocalBeaconManagerState:*(void *)(a1 + 40)];
  [WeakRetained beaconingStateChanged:*(void *)(a1 + 40)];
}

- (void)stateDidChange:(BOOL)a3 powerState:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v5;
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Monitor Delegate: networkUp [%i], powerState [%lu]", (uint8_t *)v8, 0x12u);
  }

  [(SPLocalBeaconManager *)self refreshBeaconingState];
}

- (void)bleMonitor:(id)a3 didChangeState:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v12 = a4;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPBLEStateMonitor Delegate: didChangeState [%lu]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v8 = [(SPLocalBeaconManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SPLocalBeaconManager_bleMonitor_didChangeState___block_invoke;
  block[3] = &unk_1E601BA30;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(v8, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __50__SPLocalBeaconManager_bleMonitor_didChangeState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained periodicActionWithCompletion:&__block_literal_global_175];
}

void __50__SPLocalBeaconManager_bleMonitor_didChangeState___block_invoke_2()
{
  v0 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1B2FD8000, v0, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPBLEStateMonitor finished periodicActionWithCompletion.", v1, 2u);
  }
}

- (id)stateChangedBlockWithCompletion
{
  return self->_stateChangedBlockWithCompletion;
}

- (void)setStateChangedBlockWithCompletion:(id)a3
{
}

- (id)statusChangedBlockWithCompletion
{
  return self->_statusChangedBlockWithCompletion;
}

- (void)setStatusChangedBlockWithCompletion:(id)a3
{
}

- (id)beaconingKeyChangedBlockWithCompletion
{
  return self->_beaconingKeyChangedBlockWithCompletion;
}

- (void)setBeaconingKeyChangedBlockWithCompletion:(id)a3
{
}

- (FMXPCServiceDescription)spdServiceDescription
{
  return self->_spdServiceDescription;
}

- (void)setSpdServiceDescription:(id)a3
{
}

- (FMXPCServiceDescription)findMyBeaconingDaemonServiceDescription
{
  return self->_findMyBeaconingDaemonServiceDescription;
}

- (void)setFindMyBeaconingDaemonServiceDescription:(id)a3
{
}

- (void)setSearchPartyDaemonProxy:(id)a3
{
}

- (void)setFindMyBeaconDaemonProxy:(id)a3
{
}

- (SPLocalBeaconManagerXPCProtocol)userAgentProxy
{
  return self->_userAgentProxy;
}

- (void)setUserAgentProxy:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setPeriodicActionXpcActivity:(id)a3
{
}

- (BOOL)schedulePeriodicActionXpcActivity
{
  return self->_schedulePeriodicActionXpcActivity;
}

- (void)setSchedulePeriodicActionXpcActivity:(BOOL)a3
{
  self->_schedulePeriodicActionXpcActivity = a3;
}

- (double)periodicActionXpcActivityInterval
{
  return self->_periodicActionXpcActivityInterval;
}

- (void)setPeriodicActionXpcActivityInterval:(double)a3
{
  self->_periodicActionXpcActivityInterval = a3;
}

- (SPBLEStateMonitor)bleMonitor
{
  return self->_bleMonitor;
}

- (void)setBleMonitor:(id)a3
{
}

- (BOOL)currentBeaconingState
{
  return self->_currentBeaconingState;
}

- (void)setCurrentBeaconingState:(BOOL)a3
{
  self->_currentBeaconingState = a3;
}

- (BOOL)forceBeaconingOff
{
  return self->_forceBeaconingOff;
}

- (void)setForceBeaconingOff:(BOOL)a3
{
  self->_forceBeaconingOff = a3;
}

- (unsigned)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(unsigned __int8)a3
{
  self->_currentStatus = a3;
}

- (int64_t)cachedLocalBeaconManagerState
{
  return self->_cachedLocalBeaconManagerState;
}

- (void)setCachedLocalBeaconManagerState:(int64_t)a3
{
  self->_cachedLocalBeaconManagerState = a3;
}

- (BOOL)initialStateChangeSent
{
  return self->_initialStateChangeSent;
}

- (void)setInitialStateChangeSent:(BOOL)a3
{
  self->_initialStateChangeSent = a3;
}

- (BOOL)beaconFromNVRAM
{
  return self->_beaconFromNVRAM;
}

- (void)setBeaconFromNVRAM:(BOOL)a3
{
  self->_beaconFromNVRAM = a3;
}

- (BOOL)isOfflineFindingEnabled
{
  return self->_isOfflineFindingEnabled;
}

- (void)setIsOfflineFindingEnabled:(BOOL)a3
{
  self->_isOfflineFindingEnabled = a3;
}

- (NSUUID)selfBeaconingUUID
{
  return self->_selfBeaconingUUID;
}

- (void)setSelfBeaconingUUID:(id)a3
{
}

- (unint64_t)selfBeaconingIndex
{
  return self->_selfBeaconingIndex;
}

- (void)setSelfBeaconingIndex:(unint64_t)a3
{
  self->_selfBeaconingIndex = a3;
}

- (NSDate)selfBeaconingPairDate
{
  return self->_selfBeaconingPairDate;
}

- (void)setSelfBeaconingPairDate:(id)a3
{
}

- (NSData)selfBeaconingDerivedSharedSecretKey
{
  return self->_selfBeaconingDerivedSharedSecretKey;
}

- (void)setSelfBeaconingDerivedSharedSecretKey:(id)a3
{
}

- (NSData)selfBeaconingPublicKey
{
  return self->_selfBeaconingPublicKey;
}

- (void)setSelfBeaconingPublicKey:(id)a3
{
}

- (NSDictionary)selfBeaconingConfigurations
{
  return self->_selfBeaconingConfigurations;
}

- (void)setSelfBeaconingConfigurations:(id)a3
{
}

- (BOOL)alreadyPoisonedLocalBeacon
{
  return self->_alreadyPoisonedLocalBeacon;
}

- (void)setAlreadyPoisonedLocalBeacon:(BOOL)a3
{
  self->_alreadyPoisonedLocalBeacon = a3;
}

- (unint64_t)bucketWithBaseTime:(id)a3 date:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [v5 timeIntervalSinceReferenceDate];
  if (v8 >= v9) {
    id v10 = v6;
  }
  else {
    id v10 = v5;
  }
  id v11 = v10;
  unint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v14 = [v12 dateWithTimeIntervalSinceReferenceDate:floor(v13 / 900.0) * 900.0];
  [v11 timeIntervalSinceDate:v14];
  unint64_t v16 = (unint64_t)(v15 / 900.0);
  unint64_t v17 = v16 + 1;
  if (v16 == -1) {
    -[SPLocalBeaconManager(KeyGeneration) bucketWithBaseTime:date:]();
  }

  return v17;
}

- (id)dateIntervalForIndex:(unint64_t)a3 baseDate:(id)a4
{
  if (a3)
  {
    double v5 = (double)(a3 - 1) * 900.0;
    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = a4;
    [v7 timeIntervalSinceReferenceDate];
    id v9 = [v6 dateWithTimeIntervalSinceReferenceDate:floor(v8 / 900.0) * 900.0];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v7 sinceDate:v5];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v9 sinceDate:v5];
    unint64_t v12 = (void *)v11;
    if (a3 == 1) {
      double v13 = v10;
    }
    else {
      double v13 = (void *)v11;
    }
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v11 sinceDate:900.0];
    [v14 timeIntervalSince1970];
    long double v16 = v15;

    unint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)nextafter(v16, 0.0));
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v17];
  }
  else
  {
    id v9 = a4;
    id v19 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SPLocalBeaconManager(KeyGeneration) dateIntervalForIndex:baseDate:]();
    }

    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 duration:0.0];
  }

  return v18;
}

- (void)generateBeaconingKeysOfType:(int64_t)a3 now:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  double v8 = (void (**)(id, void *))a5;
  id v9 = [(SPLocalBeaconManager *)self selfBeaconingPairDate];
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  [v9 timeIntervalSinceReferenceDate];
  unint64_t v12 = [v10 dateWithTimeIntervalSinceReferenceDate:floor(v11 / 900.0) * 900.0];
  unint64_t v13 = [(SPLocalBeaconManager *)self selfBeaconingIndex];
  unint64_t v14 = [(SPLocalBeaconManager *)self bucketWithBaseTime:v9 date:v7];
  double v15 = [(SPLocalBeaconManager *)self selfBeaconingDerivedSharedSecretKey];
  long double v16 = [(SPLocalBeaconManager *)self selfBeaconingPublicKey];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__1;
  id v30 = __Block_byref_object_dispose__1;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v14 >= v13)
  {
    if (v13 == 1) {
      unint64_t v18 = v14;
    }
    else {
      unint64_t v18 = v14 - v13;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__SPLocalBeaconManager_KeyGeneration__generateBeaconingKeysOfType_now_withCompletion___block_invoke;
    v20[3] = &unk_1E601BF80;
    unint64_t v25 = v14;
    uint64_t v23 = v32;
    v20[4] = self;
    id v21 = v12;
    id v22 = v9;
    uint64_t v24 = &v26;
    +[SPCrypto generateTokensWithPublicKey:v16 sharedSecretKey:v15 initialRatchetsToSkip:v18 ratchetStep:v20];
    id v19 = (void *)[(id)v27[5] copy];
    v8[2](v8, v19);
  }
  else
  {
    unint64_t v17 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SPLocalBeaconManager(KeyGeneration) generateBeaconingKeysOfType:now:withCompletion:]();
    }

    v8[2](v8, (void *)MEMORY[0x1E4F1CBF0]);
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
}

void __86__SPLocalBeaconManager_KeyGeneration__generateBeaconingKeysOfType_now_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + *(void *)(a1 + 72);
  id v8 = a3;
  id v9 = +[SPCrypto compactKey:v8];

  id v10 = [*(id *)(a1 + 32) dateIntervalForIndex:v7 baseDate:*(void *)(a1 + 40)];
  if (v7 == 1)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v12 = *(void *)(a1 + 48);
    unint64_t v13 = [v10 endDate];
    uint64_t v14 = [v11 initWithStartDate:v12 endDate:v13];

    id v10 = (void *)v14;
  }
  double v15 = [[SPBeaconingKey alloc] initWithDateInterval:v10 key:v9 secondaryKey:0 primaryIndex:v7 secondaryIndex:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v15];
  if ((uint64_t)++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 5) {
    *a4 = 1;
  }
}

- (id)generateOfflineAdvertisingKeysForReason:(int64_t)a3 now:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  id v52 = 0;
  id v8 = [(SPLocalBeaconManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke;
  block[3] = &unk_1E601BFA8;
  void block[4] = self;
  void block[5] = &v47;
  block[6] = a3;
  dispatch_sync(v8, block);

  id v9 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v48[5]) {
      id v10 = @"(not-nil)";
    }
    else {
      id v10 = @"(nil)";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "Done reading selfBeaconing config %@", (uint8_t *)&buf, 0xCu);
  }

  if (!v48[5])
  {
    id v16 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SPLocalBeaconManager(KeyGeneration) generateOfflineAdvertisingKeysForReason:now:](a3, v16);
    }
    goto LABEL_28;
  }
  char v11 = _os_feature_enabled_impl();
  if (a3 == 1) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    id v16 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SPLocalBeaconManager(KeyGeneration) generateOfflineAdvertisingKeysForReason:now:].cold.4();
    }
    goto LABEL_28;
  }
  char v13 = _os_feature_enabled_impl();
  if (a3 == 2) {
    char v14 = v13;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    id v16 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SPLocalBeaconManager(KeyGeneration) generateOfflineAdvertisingKeysForReason:now:]();
    }
LABEL_28:
    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_29;
  }
  uint64_t v15 = [(id)v48[5] shortIntervalCount];
  uint64_t v35 = [(id)v48[5] longIntervalCount];
  id v16 = [(SPLocalBeaconManager *)self selfBeaconingPairDate];
  unint64_t v17 = (void *)MEMORY[0x1E4F1C9C8];
  [v16 timeIntervalSinceReferenceDate];
  id v19 = [v17 dateWithTimeIntervalSinceReferenceDate:floor(v18 / 900.0) * 900.0];
  unint64_t v20 = [(SPLocalBeaconManager *)self selfBeaconingIndex];
  unint64_t v21 = [(SPLocalBeaconManager *)self bucketWithBaseTime:v16 date:v7];
  long long v37 = [(SPLocalBeaconManager *)self selfBeaconingPublicKey];
  long long v36 = [(SPLocalBeaconManager *)self selfBeaconingDerivedSharedSecretKey];
  if (v20 == 1) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = v21 - v20;
  }
  if (v20 <= v21)
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__1;
    v61 = __Block_byref_object_dispose__1;
    uint64_t v34 = v15;
    uint64_t v26 = v35 + v15;
    id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke_406;
    v38[3] = &unk_1E601BFD0;
    unint64_t v43 = v21;
    __int16 v41 = v45;
    v38[4] = self;
    id v39 = v19;
    uint64_t v40 = v16;
    p_long long buf = &buf;
    uint64_t v44 = v26;
    +[SPCrypto generateTokensWithPublicKey:v37 sharedSecretKey:v36 initialRatchetsToSkip:v22 ratchetStep:v38];
    if ([*(id *)(*((void *)&buf + 1) + 40) count] != v26)
    {
      id v33 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SPLocalBeaconManager.m", 1084, @"Generated %lu keys -- expected %lu!", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count"), v26);
    }
    v27 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "fm_map:", &__block_literal_global_415);
    uint64_t v28 = objc_msgSend(v27, "subarrayWithRange:", 0, v34);
    long long v29 = objc_msgSend(v27, "subarrayWithRange:", v34, v35);
    id v30 = [[SPOfflineAdvertisingKeys alloc] initWithInterval:15 keys:v28];
    id v31 = [[SPOfflineAdvertisingKeys alloc] initWithInterval:1440 keys:v29];
    id v32 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v54 = 134218240;
      uint64_t v55 = v34;
      __int16 v56 = 2048;
      uint64_t v57 = v35;
      _os_log_impl(&dword_1B2FD8000, v32, OS_LOG_TYPE_DEFAULT, "Returning: %lu shortInterval keys and %lu longInterval keys", v54, 0x16u);
    }

    v53[0] = v30;
    v53[1] = v31;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    uint64_t v23 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SPLocalBeaconManager(KeyGeneration) generateBeaconingKeysOfType:now:withCompletion:]();
    }

    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_29:
  _Block_object_dispose(&v47, 8);

  return v24;
}

void __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selfBeaconingConfigurations];

  if (!v2)
  {
    id v3 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "no selfBeaconingConfigurations. Reloading state from NVRAM", v9, 2u);
    }

    [*(id *)(a1 + 32) updateStateFromNVRAM];
  }
  double v4 = [*(id *)(a1 + 32) selfBeaconingConfigurations];
  double v5 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke_406(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + *(void *)(a1 + 72);
  id v8 = a3;
  id v9 = +[SPCrypto compactKey:v8];

  id v10 = [*(id *)(a1 + 32) dateIntervalForIndex:v7 baseDate:*(void *)(a1 + 40)];
  if (v7 == 1)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v12 = *(void *)(a1 + 48);
    char v13 = [v10 endDate];
    uint64_t v14 = [v11 initWithStartDate:v12 endDate:v13];

    id v10 = (void *)v14;
  }
  uint64_t v15 = [[SPBeaconingKey alloc] initWithDateInterval:v10 key:v9 secondaryKey:0 primaryIndex:v7 secondaryIndex:0];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v15];
  if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= *(void *)(a1 + 80)) {
    *a4 = 1;
  }
}

uint64_t __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = [*(id *)(a1 + 32) isOfflineFindingEnabled];
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "Setting isOfflineFindingEnabled to %d", (uint8_t *)v4, 8u);
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "activationLockInfoFromDeviceWithCompletion: %@", (uint8_t *)&v2, 0xCu);
}

@end