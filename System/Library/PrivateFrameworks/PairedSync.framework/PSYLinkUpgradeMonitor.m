@interface PSYLinkUpgradeMonitor
- (BOOL)_holdingAWDLCompanionLinkPreference;
- (BOOL)everConnectedOnAWDL;
- (BOOL)holdingAnyCompanionLinkPreference;
- (BOOL)initialPropertyExchangeComplete;
- (BOOL)monitoringCompatibilityState;
- (BOOL)pendingAWDLUpgradeRequest;
- (BOOL)waitingForAWDLupgradeTimeout;
- (BOOL)wirelessCredentialsExchangeStepComplete;
- (NRDeviceMonitor)networkRelayDeviceMonitor;
- (NRDevicePreferences)networkRelayDevicePreferences;
- (NSUUID)monitoringBluetoothIdPairingId;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_source)awdlUpgradeTimeoutTimer;
- (PDRDevice)pdrRegistryDevice;
- (PSYLinkUpgradeMonitor)initWithRegistryDevice:(id)a3 delegateQueue:(id)a4;
- (PSYLinkUpgradeMonitorDelegate)delegate;
- (id)createNetworkRelayDeviceMonitor;
- (int64_t)currentLinkType;
- (int64_t)localLinkTypeFromNRLinkType:(unsigned __int8)a3 linkSubtype:(unsigned __int8)a4;
- (os_unfair_lock_s)networkRelayDevicePreferencesLock;
- (unsigned)currentLinkSubType;
- (void)_awdlUpgradeTimedout;
- (void)_cancelAWDLUgpradeTimeoutTimer;
- (void)_enteredCompatibilityStateOnDevice:(id)a3;
- (void)_informDelegateAboutLinkChangedTo:(int64_t)a3;
- (void)_onInitialPropertyExchangeComplete;
- (void)_onQueue_requestLinkUpgrade;
- (void)_onQueue_resetCompanionLinkPreference;
- (void)_performLinkUpgradeToInfraWiFi;
- (void)_updateCompanionLinkPreferenceToAWDLforBTUUID:(id)a3;
- (void)createNetworkRelayDeviceMonitor;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5;
- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5;
- (void)requestLinkUpgrade;
- (void)resetCompanionLinkPreference;
- (void)resetMonitor;
- (void)setAwdlUpgradeTimeoutTimer:(id)a3;
- (void)setCurrentLinkSubType:(unsigned __int8)a3;
- (void)setCurrentLinkType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setEverConnectedOnAWDL:(BOOL)a3;
- (void)setInitialPropertyExchangeComplete:(BOOL)a3;
- (void)setMonitoringBluetoothIdPairingId:(id)a3;
- (void)setMonitoringCompatibilityState:(BOOL)a3;
- (void)setNetworkRelayDeviceMonitor:(id)a3;
- (void)setNetworkRelayDevicePreferences:(id)a3;
- (void)setNetworkRelayDevicePreferencesLock:(os_unfair_lock_s)a3;
- (void)setPdrRegistryDevice:(id)a3;
- (void)setPendingAWDLUpgradeRequest:(BOOL)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setWaitingForAWDLupgradeTimeout:(BOOL)a3;
- (void)setWirelessCredentialsExchangeStepComplete:(BOOL)a3;
- (void)wirelessCredentialUpdateRequestCompletedWithResult:(BOOL)a3;
@end

@implementation PSYLinkUpgradeMonitor

- (PSYLinkUpgradeMonitor)initWithRegistryDevice:(id)a3 delegateQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PSYLinkUpgradeMonitor;
  v9 = [(PSYLinkUpgradeMonitor *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v13 = dispatch_queue_create_with_target_V2("com.apple.PairedSync.linkMonitorQueue", v11, v12);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_pdrRegistryDevice, a3);
    v10->_networkRelayDevicePreferencesLock._os_unfair_lock_opaque = 0;
    v15 = +[PSYRegistrySingleton registry];
    [v15 addDelegate:v10];

    uint64_t v16 = [(PSYLinkUpgradeMonitor *)v10 createNetworkRelayDeviceMonitor];
    networkRelayDeviceMonitor = v10->_networkRelayDeviceMonitor;
    v10->_networkRelayDeviceMonitor = (NRDeviceMonitor *)v16;
  }
  return v10;
}

- (id)createNetworkRelayDeviceMonitor
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(PSYLinkUpgradeMonitor *)self pdrRegistryDevice];
  v4 = [v3 pairingID];
  [(PSYLinkUpgradeMonitor *)self setMonitoringBluetoothIdPairingId:v4];

  v5 = [(PSYLinkUpgradeMonitor *)self pdrRegistryDevice];
  v6 = [v5 valueForProperty:*MEMORY[0x263F5BAD0]];

  id v7 = psylink_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = psylink_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor]";
      __int16 v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_2179FA000, v9, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  if (v6)
  {
    [(PSYLinkUpgradeMonitor *)self setMonitoringBluetoothIdPairingId:0];
    v10 = [MEMORY[0x263F58208] newDeviceIdentifierWithBluetoothUUID:v6];
    v11 = (void *)[objc_alloc(MEMORY[0x263F58220]) initWithDeviceIdentifier:v10 delegate:self queue:self->_processingQueue];
    v12 = v11;
    if (v11)
    {
      self->_currentLinkSubType = [v11 linkSubtype];
      int64_t v13 = -[PSYLinkUpgradeMonitor localLinkTypeFromNRLinkType:linkSubtype:](self, "localLinkTypeFromNRLinkType:linkSubtype:", [v12 linkType], objc_msgSend(v12, "linkSubtype"));
      if (self->_currentLinkType != v13)
      {
        self->_currentLinkType = v13;
        [(PSYLinkUpgradeMonitor *)self _informDelegateAboutLinkChangedTo:v13];
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  v14 = psylink_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

  if (v15)
  {
    v10 = psylink_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor](v10);
    }
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (void)_informDelegateAboutLinkChangedTo:(int64_t)a3
{
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__PSYLinkUpgradeMonitor__informDelegateAboutLinkChangedTo___block_invoke;
  block[3] = &unk_2642B4280;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(delegateQueue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __59__PSYLinkUpgradeMonitor__informDelegateAboutLinkChangedTo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained delegate];
    char v4 = objc_opt_respondsToSelector();

    id WeakRetained = v6;
    if (v4)
    {
      v5 = [v6 delegate];
      [v5 linkChangedToLinkType:*(void *)(a1 + 40)];

      id WeakRetained = v6;
    }
  }
}

- (void)requestLinkUpgrade
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__PSYLinkUpgradeMonitor_requestLinkUpgrade__block_invoke;
  v4[3] = &unk_2642B3F20;
  objc_copyWeak(&v5, &location);
  dispatch_async(processingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__PSYLinkUpgradeMonitor_requestLinkUpgrade__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_requestLinkUpgrade");
    id WeakRetained = v2;
  }
}

- (void)_onQueue_requestLinkUpgrade
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2179FA000, log, OS_LOG_TYPE_ERROR, "link already on AWDL but btDeviceID is missing", v1, 2u);
}

- (void)_enteredCompatibilityStateOnDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pairingID];
  id v6 = [(PSYLinkUpgradeMonitor *)self pdrRegistryDevice];
  id v7 = [v6 pairingID];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__PSYLinkUpgradeMonitor__enteredCompatibilityStateOnDevice___block_invoke;
    block[3] = &unk_2642B3FD0;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    dispatch_async(processingQueue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __60__PSYLinkUpgradeMonitor__enteredCompatibilityStateOnDevice___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F5BAD8]];
    int v4 = [v3 intValue];

    id v5 = psylink_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = psylink_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        v9 = "-[PSYLinkUpgradeMonitor _enteredCompatibilityStateOnDevice:]_block_invoke";
        __int16 v10 = 1024;
        int v11 = v4;
        _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "%s: Entered Compatibility State: %d", (uint8_t *)&v8, 0x12u);
      }
    }
    if (v4 >= 3)
    {
      [WeakRetained setMonitoringCompatibilityState:0];
      [WeakRetained _onInitialPropertyExchangeComplete];
    }
  }
}

- (void)_onInitialPropertyExchangeComplete
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = psylink_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = psylink_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v10 = "-[PSYLinkUpgradeMonitor _onInitialPropertyExchangeComplete]";
      _os_log_impl(&dword_2179FA000, v5, OS_LOG_TYPE_DEFAULT, "%s: Initial property exchange complete.", buf, 0xCu);
    }
  }
  self->_initialPropertyExchangeComplete = 1;
  objc_initWeak((id *)buf, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke;
  block[3] = &unk_2642B3F20;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(delegateQueue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      BOOL v6 = [v3 delegate];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      id v7[2] = __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke_2;
      v7[3] = &unk_2642B42A8;
      objc_copyWeak(&v8, v1);
      [v6 sendWirelessCredentialsToWatchWithCompletion:v7];

      objc_destroyWeak(&v8);
    }
    else
    {
      [v3 wirelessCredentialUpdateRequestCompletedWithResult:1];
    }
  }
}

void __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained wirelessCredentialUpdateRequestCompletedWithResult:a2];
    id WeakRetained = v4;
  }
}

- (void)resetCompanionLinkPreference
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__PSYLinkUpgradeMonitor_resetCompanionLinkPreference__block_invoke;
  v4[3] = &unk_2642B3F20;
  objc_copyWeak(&v5, &location);
  dispatch_async(processingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__PSYLinkUpgradeMonitor_resetCompanionLinkPreference__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_resetCompanionLinkPreference");
    id WeakRetained = v2;
  }
}

- (void)_onQueue_resetCompanionLinkPreference
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_networkRelayDevicePreferences)
  {
    v3 = psylink_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = psylink_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        id v7 = "-[PSYLinkUpgradeMonitor _onQueue_resetCompanionLinkPreference]";
        _os_log_impl(&dword_2179FA000, v5, OS_LOG_TYPE_DEFAULT, "%s: reset companion link preference", (uint8_t *)&v6, 0xCu);
      }
    }
    [(NRDevicePreferences *)self->_networkRelayDevicePreferences setCompanionLinkPreferences:0];
  }
  [(PSYLinkUpgradeMonitor *)self setMonitoringBluetoothIdPairingId:0];
  [(PSYLinkUpgradeMonitor *)self setMonitoringCompatibilityState:0];
}

- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__PSYLinkUpgradeMonitor_registry_changed_properties___block_invoke;
  v15[3] = &unk_2642B42D0;
  objc_copyWeak(&v20, &location);
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  __int16 v19 = self;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(processingQueue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __53__PSYLinkUpgradeMonitor_registry_changed_properties___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained monitoringBluetoothIdPairingId];
    id v5 = [a1[4] pairingID];
    int v6 = [v4 isEqual:v5];

    if (v6)
    {
      uint64_t v7 = *MEMORY[0x263F5BAD0];
      if ([a1[5] containsObject:*MEMORY[0x263F5BAD0]])
      {
        id v8 = [a1[4] valueForProperty:v7];
        id v9 = psylink_log();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

        if (v10)
        {
          uint64_t v11 = psylink_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136315394;
            BOOL v15 = "-[PSYLinkUpgradeMonitor registry:changed:properties:]_block_invoke";
            __int16 v16 = 2114;
            id v17 = v8;
            _os_log_impl(&dword_2179FA000, v11, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@", (uint8_t *)&v14, 0x16u);
          }
        }
        if (v8)
        {
          [a1[6] removeDelegate:a1[7]];
          [v3 setMonitoringBluetoothIdPairingId:0];
          id v12 = [v3 networkRelayDeviceMonitor];

          if (!v12)
          {
            id v13 = [v3 createNetworkRelayDeviceMonitor];
            [v3 setNetworkRelayDeviceMonitor:v13];
          }
          if ([v3 pendingAWDLUpgradeRequest])
          {
            [v3 setPendingAWDLUpgradeRequest:0];
            [v3 _updateCompanionLinkPreferenceToAWDLforBTUUID:v8];
          }
        }
      }
    }
    if ([v3 monitoringCompatibilityState]
      && [a1[5] containsObject:*MEMORY[0x263F5BAD8]])
    {
      [a1[7] _enteredCompatibilityStateOnDevice:a1[4]];
    }
  }
}

- (void)_updateCompanionLinkPreferenceToAWDLforBTUUID:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v4 = (void *)[MEMORY[0x263F58208] newDeviceIdentifierWithBluetoothUUID:a3];
  id v5 = psylink_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = psylink_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 nrDeviceIdentifier];
      *(_DWORD *)buf = 136315394;
      v34 = "-[PSYLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
      __int16 v35 = 2114;
      v36 = v8;
      _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "%s: NetworkRelayDeviceIdentifier: %{public}@", buf, 0x16u);
    }
  }
  id v9 = [(NRDeviceMonitor *)self->_networkRelayDeviceMonitor deviceIdentifier];
  BOOL v10 = [v9 nrDeviceIdentifier];
  uint64_t v11 = [v4 nrDeviceIdentifier];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    id v13 = [(PSYLinkUpgradeMonitor *)self createNetworkRelayDeviceMonitor];
    networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
    self->_networkRelayDeviceMonitor = v13;
  }
  if ([(NRDeviceMonitor *)self->_networkRelayDeviceMonitor isConnected])
  {
    self->_pendingAWDLUpgradeRequest = 0;
    self->_currentLinkSubType = [(NRDeviceMonitor *)self->_networkRelayDeviceMonitor linkSubtype];
    os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
    BOOL v15 = (NRDevicePreferences *)[objc_alloc(MEMORY[0x263F58250]) initWithDeviceIdentifier:v4];
    networkRelayDevicePreferences = self->_networkRelayDevicePreferences;
    self->_networkRelayDevicePreferences = v15;

    id v17 = (void *)[objc_alloc(MEMORY[0x263F58200]) initForHighThroughputWithServiceClass:5 includeP2P:1];
    [(NRDevicePreferences *)self->_networkRelayDevicePreferences setCompanionLinkPreferences:v17];
    os_unfair_lock_unlock(&self->_networkRelayDevicePreferencesLock);
    if (self->_currentLinkSubType == 102)
    {
      uint64_t v18 = psylink_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        id v20 = psylink_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2179FA000, v20, OS_LOG_TYPE_DEFAULT, "link already on AWDL. Took assertion again.", buf, 2u);
        }
      }
    }
    else
    {
      self->_waitingForAWDLupgradeTimeout = 1;
      v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_processingQueue);
      awdlUpgradeTimeoutTimer = self->_awdlUpgradeTimeoutTimer;
      self->_awdlUpgradeTimeoutTimer = v24;

      v26 = self->_awdlUpgradeTimeoutTimer;
      dispatch_time_t v27 = dispatch_time(0, 60000000000);
      dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
      v28 = self->_awdlUpgradeTimeoutTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __71__PSYLinkUpgradeMonitor__updateCompanionLinkPreferenceToAWDLforBTUUID___block_invoke;
      handler[3] = &unk_2642B3DB8;
      handler[4] = self;
      dispatch_source_set_event_handler(v28, handler);
      dispatch_activate((dispatch_object_t)self->_awdlUpgradeTimeoutTimer);
    }
    v29 = psylink_log();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      v31 = psylink_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[PSYLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
        _os_log_impl(&dword_2179FA000, v31, OS_LOG_TYPE_DEFAULT, "%s: Marked for using AWDL", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v21 = psylink_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      v23 = psylink_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[PSYLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
        _os_log_impl(&dword_2179FA000, v23, OS_LOG_TYPE_DEFAULT, "%s: Peer not connected yet. Waiting for connectivity", buf, 0xCu);
      }
    }
    self->_pendingAWDLUpgradeRequest = 1;
  }
}

uint64_t __71__PSYLinkUpgradeMonitor__updateCompanionLinkPreferenceToAWDLforBTUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _awdlUpgradeTimedout];
}

- (void)_awdlUpgradeTimedout
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = psylink_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = psylink_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[PSYLinkUpgradeMonitor _awdlUpgradeTimedout]";
      _os_log_impl(&dword_2179FA000, v5, OS_LOG_TYPE_DEFAULT, "%s: AWDL upgrade request timedout", (uint8_t *)&v6, 0xCu);
    }
  }
  self->_waitingForAWDLupgradeTimeout = 0;
  if (self->_wirelessCredentialsExchangeStepComplete && !self->_currentLinkSubType && !self->_everConnectedOnAWDL) {
    [(PSYLinkUpgradeMonitor *)self _performLinkUpgradeToInfraWiFi];
  }
}

- (void)_cancelAWDLUgpradeTimeoutTimer
{
  self->_waitingForAWDLupgradeTimeout = 0;
  awdlUpgradeTimeoutTimer = self->_awdlUpgradeTimeoutTimer;
  if (awdlUpgradeTimeoutTimer)
  {
    dispatch_source_cancel(awdlUpgradeTimeoutTimer);
    BOOL v4 = self->_awdlUpgradeTimeoutTimer;
    self->_awdlUpgradeTimeoutTimer = 0;
  }
}

- (void)_performLinkUpgradeToInfraWiFi
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  pdrRegistryDevice = self->_pdrRegistryDevice;
  if (pdrRegistryDevice)
  {
    BOOL v4 = [(PDRDevice *)pdrRegistryDevice valueForProperty:*MEMORY[0x263F5BAD0]];
    if (v4)
    {
      if (!self->_pendingAWDLUpgradeRequest)
      {
        uint64_t v7 = [MEMORY[0x263F58208] newDeviceIdentifierWithBluetoothUUID:v4];
        id v13 = psylink_log();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

        if (v14)
        {
          BOOL v15 = psylink_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v16 = [v7 nrDeviceIdentifier];
            int v29 = 136315650;
            BOOL v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
            __int16 v31 = 2114;
            v32 = v4;
            __int16 v33 = 2114;
            v34 = v16;
            _os_log_impl(&dword_2179FA000, v15, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@ networkRelayDeviceIdentifier: %{public}@", (uint8_t *)&v29, 0x20u);
          }
        }
        id v17 = [(NRDeviceMonitor *)self->_networkRelayDeviceMonitor deviceIdentifier];
        uint64_t v18 = [v17 nrDeviceIdentifier];
        BOOL v19 = [v7 nrDeviceIdentifier];
        char v20 = [v18 isEqual:v19];

        if ((v20 & 1) == 0)
        {
          uint64_t v21 = [(PSYLinkUpgradeMonitor *)self createNetworkRelayDeviceMonitor];
          networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
          self->_networkRelayDeviceMonitor = v21;
        }
        self->_currentLinkSubType = [(NRDeviceMonitor *)self->_networkRelayDeviceMonitor linkSubtype];
        os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
        v23 = (NRDevicePreferences *)[objc_alloc(MEMORY[0x263F58250]) initWithDeviceIdentifier:v7];
        networkRelayDevicePreferences = self->_networkRelayDevicePreferences;
        self->_networkRelayDevicePreferences = v23;

        v25 = (void *)[objc_alloc(MEMORY[0x263F58200]) initForHighThroughputWithServiceClass:5 includeP2P:0];
        [(NRDevicePreferences *)self->_networkRelayDevicePreferences setCompanionLinkPreferences:v25];
        os_unfair_lock_unlock(&self->_networkRelayDevicePreferencesLock);
        v26 = psylink_log();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

        if (v27)
        {
          v28 = psylink_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            int v29 = 136315138;
            BOOL v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
            _os_log_impl(&dword_2179FA000, v28, OS_LOG_TYPE_DEFAULT, "%s: Marked for using Infra Wi-Fi", (uint8_t *)&v29, 0xCu);
          }
        }
        goto LABEL_25;
      }
      id v5 = psylink_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        uint64_t v7 = psylink_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 136315138;
          BOOL v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
          uint64_t v8 = "%s: waiting for AWDL upgrade request to complete.";
LABEL_13:
          _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v29, 0xCu);
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v11 = psylink_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        uint64_t v7 = psylink_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 136315138;
          BOOL v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
          uint64_t v8 = "%s: btDeviceID not yet available, will attempt once available.";
          goto LABEL_13;
        }
LABEL_25:
      }
    }
  }
  else
  {
    id v9 = psylink_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (!v10) {
      return;
    }
    BOOL v4 = psylink_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315138;
      BOOL v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
      _os_log_impl(&dword_2179FA000, v4, OS_LOG_TYPE_DEFAULT, "%s: no active device to upgrade link to Infra Wi-Fi", (uint8_t *)&v29, 0xCu);
    }
  }
}

- (void)wirelessCredentialUpdateRequestCompletedWithResult:(BOOL)a3
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__PSYLinkUpgradeMonitor_wirelessCredentialUpdateRequestCompletedWithResult___block_invoke;
  v6[3] = &unk_2642B42F8;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  v6[4] = self;
  dispatch_async(processingQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __76__PSYLinkUpgradeMonitor_wirelessCredentialUpdateRequestCompletedWithResult___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = psylink_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = psylink_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(a1 + 48);
        int v9 = 136315394;
        BOOL v10 = "-[PSYLinkUpgradeMonitor wirelessCredentialUpdateRequestCompletedWithResult:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = v6;
        _os_log_impl(&dword_2179FA000, v5, OS_LOG_TYPE_DEFAULT, "%s: wireless credentials exchange complete: %d", (uint8_t *)&v9, 0x12u);
      }
    }
    if (*(unsigned char *)(a1 + 48))
    {
      [WeakRetained setWirelessCredentialsExchangeStepComplete:1];
      if (![WeakRetained currentLinkSubType]
        && ([WeakRetained waitingForAWDLupgradeTimeout] & 1) == 0
        && ([WeakRetained pendingAWDLUpgradeRequest] & 1) == 0)
      {
        id v7 = [WeakRetained networkRelayDeviceMonitor];
        if ([v7 isConnected])
        {
          int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 13);

          if (!v8) {
            [WeakRetained _performLinkUpgradeToInfraWiFi];
          }
        }
        else
        {
        }
      }
    }
  }
}

- (void)resetMonitor
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__PSYLinkUpgradeMonitor_resetMonitor__block_invoke;
  v4[3] = &unk_2642B3F20;
  objc_copyWeak(&v5, &location);
  dispatch_async(processingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__PSYLinkUpgradeMonitor_resetMonitor__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = psylink_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      BOOL v4 = psylink_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        int v6 = "-[PSYLinkUpgradeMonitor resetMonitor]_block_invoke";
        _os_log_impl(&dword_2179FA000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
      }
    }
    objc_msgSend(WeakRetained, "_onQueue_resetCompanionLinkPreference");
    [WeakRetained setPendingAWDLUpgradeRequest:0];
    [WeakRetained setWirelessCredentialsExchangeStepComplete:0];
    [WeakRetained setInitialPropertyExchangeComplete:0];
    [WeakRetained setCurrentLinkSubType:0];
    [WeakRetained _cancelAWDLUgpradeTimeoutTimer];
    [WeakRetained setEverConnectedOnAWDL:0];
  }
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = psylink_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = psylink_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      BOOL v10 = "-[PSYLinkUpgradeMonitor deviceIsConnectedDidChange:isConnected:]";
      __int16 v11 = 1024;
      BOOL v12 = v4;
      _os_log_impl(&dword_2179FA000, v8, OS_LOG_TYPE_DEFAULT, "%s: connected %{BOOL}d", (uint8_t *)&v9, 0x12u);
    }
  }
  if (v4 && self->_pendingAWDLUpgradeRequest) {
    [(PSYLinkUpgradeMonitor *)self _onQueue_requestLinkUpgrade];
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v8 = psylink_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = psylink_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
      StringFromNRLinkType = (void *)createStringFromNRLinkType();
      uint64_t v13 = (void *)createStringFromNRLinkSubtype();
      int v15 = 136315906;
      __int16 v16 = "-[PSYLinkUpgradeMonitor deviceLinkTypeDidChange:linkType:linkSubtype:]";
      __int16 v17 = 2112;
      uint64_t v18 = StringFromNRLinkSubtype;
      __int16 v19 = 2112;
      char v20 = StringFromNRLinkType;
      __int16 v21 = 2112;
      BOOL v22 = v13;
      _os_log_impl(&dword_2179FA000, v10, OS_LOG_TYPE_DEFAULT, "%s: link changed. current linkSubType: %@ new linkType: %@, new linkSubType: %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  self->_currentLinkSubType = v5;
  if (v5 == 102)
  {
    self->_everConnectedOnAWDL = 1;
    [(PSYLinkUpgradeMonitor *)self _cancelAWDLUgpradeTimeoutTimer];
  }
  int64_t v14 = [(PSYLinkUpgradeMonitor *)self localLinkTypeFromNRLinkType:v6 linkSubtype:v5];
  if (v14 != self->_currentLinkType)
  {
    self->_currentLinkType = v14;
    [(PSYLinkUpgradeMonitor *)self _informDelegateAboutLinkChangedTo:v14];
  }
}

- (int64_t)localLinkTypeFromNRLinkType:(unsigned __int8)a3 linkSubtype:(unsigned __int8)a4
{
  int64_t v4 = 3;
  if (!a4) {
    int64_t v4 = 0;
  }
  if (a4 == 102) {
    int64_t v4 = 2;
  }
  if (a3 != 2) {
    int64_t v4 = 0;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)holdingAnyCompanionLinkPreference
{
  id v2 = self;
  p_networkRelayDevicePreferencesLock = &self->_networkRelayDevicePreferencesLock;
  os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
  int64_t v4 = [(NRDevicePreferences *)v2->_networkRelayDevicePreferences companionLinkPreferences];
  LOBYTE(v2) = v4 != 0;

  os_unfair_lock_unlock(p_networkRelayDevicePreferencesLock);
  return (char)v2;
}

- (BOOL)_holdingAWDLCompanionLinkPreference
{
  id v2 = self;
  p_networkRelayDevicePreferencesLock = &self->_networkRelayDevicePreferencesLock;
  os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
  int64_t v4 = [(NRDevicePreferences *)v2->_networkRelayDevicePreferences companionLinkPreferences];
  LOBYTE(v2) = v4 != 0;

  os_unfair_lock_unlock(p_networkRelayDevicePreferencesLock);
  return (char)v2;
}

- (PSYLinkUpgradeMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSYLinkUpgradeMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentLinkType
{
  return self->_currentLinkType;
}

- (void)setCurrentLinkType:(int64_t)a3
{
  self->_currentLinkType = a3;
}

- (BOOL)wirelessCredentialsExchangeStepComplete
{
  return self->_wirelessCredentialsExchangeStepComplete;
}

- (void)setWirelessCredentialsExchangeStepComplete:(BOOL)a3
{
  self->_wirelessCredentialsExchangeStepComplete = a3;
}

- (BOOL)initialPropertyExchangeComplete
{
  return self->_initialPropertyExchangeComplete;
}

- (void)setInitialPropertyExchangeComplete:(BOOL)a3
{
  self->_initialPropertyExchangeComplete = a3;
}

- (NRDevicePreferences)networkRelayDevicePreferences
{
  return self->_networkRelayDevicePreferences;
}

- (void)setNetworkRelayDevicePreferences:(id)a3
{
}

- (os_unfair_lock_s)networkRelayDevicePreferencesLock
{
  return self->_networkRelayDevicePreferencesLock;
}

- (void)setNetworkRelayDevicePreferencesLock:(os_unfair_lock_s)a3
{
  self->_networkRelayDevicePreferencesLock = a3;
}

- (NRDeviceMonitor)networkRelayDeviceMonitor
{
  return self->_networkRelayDeviceMonitor;
}

- (void)setNetworkRelayDeviceMonitor:(id)a3
{
}

- (unsigned)currentLinkSubType
{
  return self->_currentLinkSubType;
}

- (void)setCurrentLinkSubType:(unsigned __int8)a3
{
  self->_currentLinkSubType = a3;
}

- (OS_dispatch_source)awdlUpgradeTimeoutTimer
{
  return self->_awdlUpgradeTimeoutTimer;
}

- (void)setAwdlUpgradeTimeoutTimer:(id)a3
{
}

- (BOOL)waitingForAWDLupgradeTimeout
{
  return self->_waitingForAWDLupgradeTimeout;
}

- (void)setWaitingForAWDLupgradeTimeout:(BOOL)a3
{
  self->_waitingForAWDLupgradeTimeout = a3;
}

- (BOOL)pendingAWDLUpgradeRequest
{
  return self->_pendingAWDLUpgradeRequest;
}

- (void)setPendingAWDLUpgradeRequest:(BOOL)a3
{
  self->_pendingAWDLUpgradeRequest = a3;
}

- (BOOL)everConnectedOnAWDL
{
  return self->_everConnectedOnAWDL;
}

- (void)setEverConnectedOnAWDL:(BOOL)a3
{
  self->_everConnectedOnAWDL = a3;
}

- (PDRDevice)pdrRegistryDevice
{
  return self->_pdrRegistryDevice;
}

- (void)setPdrRegistryDevice:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSUUID)monitoringBluetoothIdPairingId
{
  return self->_monitoringBluetoothIdPairingId;
}

- (void)setMonitoringBluetoothIdPairingId:(id)a3
{
  self->_monitoringBluetoothIdPairingId = (NSUUID *)a3;
}

- (BOOL)monitoringCompatibilityState
{
  return self->_monitoringCompatibilityState;
}

- (void)setMonitoringCompatibilityState:(BOOL)a3
{
  self->_monitoringCompatibilityState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_pdrRegistryDevice, 0);
  objc_storeStrong((id *)&self->_awdlUpgradeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_networkRelayDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_networkRelayDevicePreferences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createNetworkRelayDeviceMonitor
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor]";
  _os_log_error_impl(&dword_2179FA000, log, OS_LOG_TYPE_ERROR, "%s: Couldn't get BTUUID. Started Observing", (uint8_t *)&v1, 0xCu);
}

@end