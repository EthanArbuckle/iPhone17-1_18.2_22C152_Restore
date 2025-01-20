@interface MSDKPeerDemoDeviceManager
+ (id)sharedInstance;
- (BOOL)_setUpXPCConnectionIfNeeded;
- (BOOL)registerPeerEventsObserver:(id)a3;
- (MSDKPeerDemoDeviceManager)init;
- (MSDKPeerEventsObserverProtocol)observer;
- (NSArray)discoveredPeers;
- (NSMutableDictionary)peers;
- (NSXPCConnection)xpcConnection;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_cleanUpUponXPCDisconnection;
- (void)_setUpXPCConnectionIfNeeded;
- (void)adjustVolumeOnPeer:(id)a3 toValue:(float)a4 forCategory:(unint64_t)a5 withCompletion:(id)a6;
- (void)attemptPairingWithPeer:(id)a3 withCompletion:(id)a4;
- (void)changeWiFiSettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5;
- (void)enumerateTestScriptsOnPeer:(id)a3 withCompletion:(id)a4;
- (void)fetchDeviceInfoFromPeer:(id)a3 withCompletion:(id)a4;
- (void)getAccessibiltiySettingsOnPeer:(id)a3 withCompletion:(id)a4;
- (void)initiateAirPlayAssistedFromPeer:(id)a3 usingParameters:(id)a4 discoveryMode:(unint64_t)a5 withCompletion:(id)a6;
- (void)initiateIPDResetOnPeer:(id)a3 targetIPD:(double)a4 withCompletion:(id)a5;
- (void)invokeInputRecoveryOnPeer:(id)a3 forType:(unint64_t)a4 withCompletion:(id)a5;
- (void)launchAppOnPeer:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5;
- (void)launchTestScriptOnPeer:(id)a3 ofIdentifier:(id)a4 asRoot:(BOOL)a5 withCompletion:(id)a6;
- (void)launchTestScriptOnPeer:(id)a3 ofIdentifier:(id)a4 withCompletion:(id)a5;
- (void)listAppsOnPeer:(id)a3 appKind:(unint64_t)a4 withCompletion:(id)a5;
- (void)listAvailableEnvironmentsOnPeer:(id)a3 withCompletion:(id)a4;
- (void)loadLSMeasurementsOnPeer:(id)a3 withCompletion:(id)a4;
- (void)obtainGKMetricsFromPeer:(id)a3 withCompletion:(id)a4;
- (void)obtainGKResultsFromPeer:(id)a3 withCompletion:(id)a4;
- (void)providerDidDiscoverNewPeer:(id)a3;
- (void)providerDidLoseExistingPeerOfID:(id)a3;
- (void)providerDidUpdateDeviceInfoOnPeerOfID:(id)a3 withNewProperties:(id)a4;
- (void)queryIPDResetStageOnPeer:(id)a3 withCompletion:(id)a4;
- (void)readIPDStatusFromPeer:(id)a3 withCompletion:(id)a4;
- (void)removePairedPeer:(id)a3 withCompletion:(id)a4;
- (void)resetToPassThroughOnPeer:(id)a3 withCompletion:(id)a4;
- (void)retrieveHSCoachingSuggestionFromPeer:(id)a3 withCompletion:(id)a4;
- (void)setAccessibiltiySettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5;
- (void)setActiveEnvironmentOnPeer:(id)a3 environmentID:(id)a4 withCompletion:(id)a5;
- (void)setImmersionLevelOnPeer:(id)a3 immersionLevel:(float)a4 animationDuration:(float)a5 withCompletion:(id)a6;
- (void)setObserver:(id)a3;
- (void)setPeers:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)skipAutoIPDAdjustmentOnPeer:(id)a3 withCompletion:(id)a4;
- (void)startPeerDiscoveryWithCompletion:(id)a3;
- (void)subscribeDeviceInfoFromPeer:(id)a3 withCompletion:(id)a4;
- (void)syncCurrentWiFiSettingsToPeer:(id)a3 withCompletion:(id)a4;
- (void)terminateAppOnPeer:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5;
- (void)triggerSnapshotRevertOnPeer:(id)a3 rebootDevice:(BOOL)a4 withCompletion:(id)a5;
- (void)triggerSnapshotRevertOnPeer:(id)a3 withCompletion:(id)a4;
- (void)unregisterPeerEventsObserver;
- (void)wipeCustomerAssetsOnPeer:(id)a3 withCompletion:(id)a4;
@end

@implementation MSDKPeerDemoDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __43__MSDKPeerDemoDeviceManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(MSDKPeerDemoDeviceManager);
  return MEMORY[0x270F9A758]();
}

- (MSDKPeerDemoDeviceManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDKPeerDemoDeviceManager;
  v2 = [(MSDKPeerDemoDeviceManager *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
    [(MSDKPeerDemoDeviceManager *)v2 setPeers:v3];
  }
  return v2;
}

- (NSArray)discoveredPeers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MSDKPeerDemoDeviceManager *)v2 peers];
  v4 = [v3 allValues];

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (BOOL)registerPeerEventsObserver:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKPeerDemoDeviceManager registerPeerEventsObserver:]";
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  char v6 = [v4 conformsToProtocol:&unk_26D09A438];
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    [(MSDKPeerDemoDeviceManager *)v7 setObserver:v4];
    v8 = [(MSDKPeerDemoDeviceManager *)v7 peers];
    v9 = [v8 allValues];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          v15 = [(MSDKPeerDemoDeviceManager *)v7 observer];
          [v15 managerDidFindPeer:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    objc_sync_exit(v7);
  }
  else
  {
    defaultLogHandle();
    v7 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager registerPeerEventsObserver:]();
    }
  }

  return v6;
}

- (void)unregisterPeerEventsObserver
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    char v6 = "-[MSDKPeerDemoDeviceManager unregisterPeerEventsObserver]";
    _os_log_impl(&dword_21EF08000, v3, OS_LOG_TYPE_DEFAULT, "%s: called.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = self;
  objc_sync_enter(v4);
  [(MSDKPeerDemoDeviceManager *)v4 setObserver:0];
  objc_sync_exit(v4);
}

- (void)startPeerDiscoveryWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v19 = "-[MSDKPeerDemoDeviceManager startPeerDiscoveryWithCompletion:]";
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v4)
  {
    char v6 = self;
    objc_sync_enter(v6);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__MSDKPeerDemoDeviceManager_startPeerDiscoveryWithCompletion___block_invoke;
    v16[3] = &unk_2644FC7F8;
    id v7 = v4;
    id v17 = v7;
    v8 = [(MSDKPeerDemoDeviceManager *)v6 _remoteObjectProxyWithErrorHandler:v16];
    [v8 startPeerDiscoveryWithCompletion:v7];

    objc_sync_exit(v6);
  }
  else
  {
    defaultLogHandle();
    char v6 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager startPeerDiscoveryWithCompletion:](&v6->super, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

uint64_t __62__MSDKPeerDemoDeviceManager_startPeerDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attemptPairingWithPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[MSDKPeerDemoDeviceManager attemptPairingWithPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    uint64_t v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    uint64_t v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC7F8;
    id v21 = v10;
    [v11 attemptPairingWithPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    uint64_t v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager attemptPairingWithPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeDeviceInfoFromPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[MSDKPeerDemoDeviceManager subscribeDeviceInfoFromPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    uint64_t v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    uint64_t v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC7F8;
    id v21 = v10;
    [v11 subscribeDeviceInfoFromPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    uint64_t v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager subscribeDeviceInfoFromPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDeviceInfoFromPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[MSDKPeerDemoDeviceManager fetchDeviceInfoFromPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    uint64_t v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    uint64_t v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC7F8;
    id v21 = v10;
    [v11 fetchDeviceInfoFromPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    uint64_t v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager fetchDeviceInfoFromPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initiateAirPlayAssistedFromPeer:(id)a3 usingParameters:(id)a4 discoveryMode:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = defaultLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[MSDKPeerDemoDeviceManager initiateAirPlayAssistedFromPeer:usingParameters:discoveryMode:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v13, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v12)
  {
    uint64_t v14 = self;
    objc_sync_enter(v14);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke;
    v27[3] = &unk_2644FC7F8;
    id v15 = v12;
    id v28 = v15;
    uint64_t v16 = [(MSDKPeerDemoDeviceManager *)v14 _remoteObjectProxyWithErrorHandler:v27];
    uint64_t v17 = [v10 identifier];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke_2;
    v25[3] = &unk_2644FC7F8;
    id v26 = v15;
    [v16 initiateAirPlayAssistedFromPeerOfID:v17 usingParameters:v11 discoveryMode:a5 withCompletion:v25];

    objc_sync_exit(v14);
  }
  else
  {
    defaultLogHandle();
    uint64_t v14 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager initiateAirPlayAssistedFromPeer:usingParameters:discoveryMode:withCompletion:](&v14->super, v18, v19, v20, v21, v22, v23, v24);
    }
  }
}

uint64_t __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerSnapshotRevertOnPeer:(id)a3 rebootDevice:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = defaultLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v28 = "-[MSDKPeerDemoDeviceManager triggerSnapshotRevertOnPeer:rebootDevice:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    id v11 = self;
    objc_sync_enter(v11);
    id v12 = [(MSDKPeerDemoDeviceManager *)v11 xpcConnection];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke;
    v25[3] = &unk_2644FC7F8;
    id v13 = v9;
    id v26 = v13;
    uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v25];
    id v15 = [v8 identifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke_2;
    v23[3] = &unk_2644FC7F8;
    id v24 = v13;
    [v14 triggerSnapshotRevertOnPeerOfID:v15 rebootDevice:v6 withCompletion:v23];

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    id v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager triggerSnapshotRevertOnPeer:rebootDevice:withCompletion:](&v11->super, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerSnapshotRevertOnPeer:(id)a3 withCompletion:(id)a4
{
}

- (void)invokeInputRecoveryOnPeer:(id)a3 forType:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = defaultLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[MSDKPeerDemoDeviceManager invokeInputRecoveryOnPeer:forType:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    id v11 = self;
    objc_sync_enter(v11);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke;
    v24[3] = &unk_2644FC7F8;
    id v12 = v9;
    id v25 = v12;
    id v13 = [(MSDKPeerDemoDeviceManager *)v11 _remoteObjectProxyWithErrorHandler:v24];
    uint64_t v14 = [v8 identifier];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke_2;
    v22[3] = &unk_2644FC7F8;
    id v23 = v12;
    [v13 invokeInputRecoveryOnPeerOfID:v14 forType:a4 withCompletion:v22];

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    id v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager invokeInputRecoveryOnPeer:forType:withCompletion:](&v11->super, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

uint64_t __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)adjustVolumeOnPeer:(id)a3 toValue:(float)a4 forCategory:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = defaultLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[MSDKPeerDemoDeviceManager adjustVolumeOnPeer:toValue:forCategory:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v11)
  {
    id v13 = self;
    objc_sync_enter(v13);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke;
    v27[3] = &unk_2644FC7F8;
    id v14 = v11;
    id v28 = v14;
    uint64_t v15 = [(MSDKPeerDemoDeviceManager *)v13 _remoteObjectProxyWithErrorHandler:v27];
    uint64_t v16 = [v10 identifier];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke_2;
    v25[3] = &unk_2644FC7F8;
    id v26 = v14;
    *(float *)&double v17 = a4;
    [v15 adjustVolumeOnPeerOfID:v16 toValue:a5 forCategory:v25 withCompletion:v17];

    objc_sync_exit(v13);
  }
  else
  {
    defaultLogHandle();
    id v13 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager adjustVolumeOnPeer:toValue:forCategory:withCompletion:](&v13->super, v18, v19, v20, v21, v22, v23, v24);
    }
  }
}

uint64_t __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listAppsOnPeer:(id)a3 appKind:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = defaultLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[MSDKPeerDemoDeviceManager listAppsOnPeer:appKind:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    id v11 = self;
    objc_sync_enter(v11);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke;
    v24[3] = &unk_2644FC7F8;
    id v12 = v9;
    id v25 = v12;
    id v13 = [(MSDKPeerDemoDeviceManager *)v11 _remoteObjectProxyWithErrorHandler:v24];
    id v14 = [v8 identifier];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke_2;
    v22[3] = &unk_2644FC820;
    id v23 = v12;
    [v13 listAppsOnPeerOfID:v14 appKind:a4 withCompletion:v22];

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    id v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager listAppsOnPeer:appKind:withCompletion:](&v11->super, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

uint64_t __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)launchAppOnPeer:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v28 = "-[MSDKPeerDemoDeviceManager launchAppOnPeer:appIdentifier:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    id v12 = self;
    objc_sync_enter(v12);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke;
    v25[3] = &unk_2644FC7F8;
    id v13 = v10;
    id v26 = v13;
    id v14 = [(MSDKPeerDemoDeviceManager *)v12 _remoteObjectProxyWithErrorHandler:v25];
    uint64_t v15 = [v8 identifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke_2;
    v23[3] = &unk_2644FC7F8;
    id v24 = v13;
    [v14 launchAppOnPeerOfID:v15 appIdentifier:v9 withCompletion:v23];

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    id v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager launchAppOnPeer:appIdentifier:withCompletion:](&v12->super, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)terminateAppOnPeer:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v28 = "-[MSDKPeerDemoDeviceManager terminateAppOnPeer:appIdentifier:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    id v12 = self;
    objc_sync_enter(v12);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke;
    v25[3] = &unk_2644FC7F8;
    id v13 = v10;
    id v26 = v13;
    id v14 = [(MSDKPeerDemoDeviceManager *)v12 _remoteObjectProxyWithErrorHandler:v25];
    uint64_t v15 = [v8 identifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke_2;
    v23[3] = &unk_2644FC7F8;
    id v24 = v13;
    [v14 terminateAppOnPeerOfID:v15 appIdentifier:v9 withCompletion:v23];

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    id v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager terminateAppOnPeer:appIdentifier:withCompletion:](&v12->super, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listAvailableEnvironmentsOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[MSDKPeerDemoDeviceManager listAvailableEnvironmentsOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC820;
    id v21 = v10;
    [v11 listAvailableEnvironmentsOnPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager listAvailableEnvironmentsOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActiveEnvironmentOnPeer:(id)a3 environmentID:(id)a4 withCompletion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v28 = "-[MSDKPeerDemoDeviceManager setActiveEnvironmentOnPeer:environmentID:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    id v12 = self;
    objc_sync_enter(v12);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke;
    v25[3] = &unk_2644FC7F8;
    id v13 = v10;
    id v26 = v13;
    uint64_t v14 = [(MSDKPeerDemoDeviceManager *)v12 _remoteObjectProxyWithErrorHandler:v25];
    uint64_t v15 = [v8 identifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke_2;
    v23[3] = &unk_2644FC7F8;
    id v24 = v13;
    [v14 setActiveEnvironmentOnPeerOfID:v15 environmentID:v9 withCompletion:v23];

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    id v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager setActiveEnvironmentOnPeer:environmentID:withCompletion:](&v12->super, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setImmersionLevelOnPeer:(id)a3 immersionLevel:(float)a4 animationDuration:(float)a5 withCompletion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = defaultLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = "-[MSDKPeerDemoDeviceManager setImmersionLevelOnPeer:immersionLevel:animationDuration:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v11)
  {
    id v13 = self;
    objc_sync_enter(v13);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke;
    v28[3] = &unk_2644FC7F8;
    id v14 = v11;
    id v29 = v14;
    uint64_t v15 = [(MSDKPeerDemoDeviceManager *)v13 _remoteObjectProxyWithErrorHandler:v28];
    uint64_t v16 = [v10 identifier];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke_2;
    v26[3] = &unk_2644FC7F8;
    id v27 = v14;
    *(float *)&double v17 = a4;
    *(float *)&double v18 = a5;
    [v15 seImmersionLevelOnPeerOfID:v16 immersionLevel:v26 animationDuration:v17 withCompletion:v18];

    objc_sync_exit(v13);
  }
  else
  {
    defaultLogHandle();
    id v13 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager setImmersionLevelOnPeer:immersionLevel:animationDuration:withCompletion:](&v13->super, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

uint64_t __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetToPassThroughOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager resetToPassThroughOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC7F8;
    id v21 = v10;
    [v11 resetToPassThroughOnPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager resetToPassThroughOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateTestScriptsOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager enumerateTestScriptsOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC820;
    id v21 = v10;
    [v11 enumerateTestScriptsOnPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager enumerateTestScriptsOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)launchTestScriptOnPeer:(id)a3 ofIdentifier:(id)a4 withCompletion:(id)a5
{
}

- (void)launchTestScriptOnPeer:(id)a3 ofIdentifier:(id)a4 asRoot:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = defaultLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[MSDKPeerDemoDeviceManager launchTestScriptOnPeer:ofIdentifier:asRoot:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v13, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v12)
  {
    uint64_t v14 = self;
    objc_sync_enter(v14);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke;
    v27[3] = &unk_2644FC7F8;
    id v15 = v12;
    id v28 = v15;
    uint64_t v16 = [(MSDKPeerDemoDeviceManager *)v14 _remoteObjectProxyWithErrorHandler:v27];
    uint64_t v17 = [v10 identifier];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke_2;
    v25[3] = &unk_2644FC7F8;
    id v26 = v15;
    [v16 launchTestScriptOnPeerOfID:v17 ofIdentifier:v11 asRoot:v7 withCompletion:v25];

    objc_sync_exit(v14);
  }
  else
  {
    defaultLogHandle();
    uint64_t v14 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager launchTestScriptOnPeer:ofIdentifier:asRoot:withCompletion:](&v14->super, v18, v19, v20, v21, v22, v23, v24);
    }
  }
}

uint64_t __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)obtainGKResultsFromPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager obtainGKResultsFromPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC848;
    id v21 = v10;
    [v11 obtainGKResultsOnPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager obtainGKResultsFromPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)obtainGKMetricsFromPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager obtainGKMetricsFromPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC870;
    id v21 = v10;
    [v11 obtainGKMetricsOnPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager obtainGKMetricsFromPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadLSMeasurementsOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager loadLSMeasurementsOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC898;
    id v21 = v10;
    [v11 loadLSMeasurementsOnPeerOfID:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager loadLSMeasurementsOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveHSCoachingSuggestionFromPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager retrieveHSCoachingSuggestionFromPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC8C0;
    id v21 = v10;
    [v11 retrieveHSCoachingSuggestionFromPeer:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager retrieveHSCoachingSuggestionFromPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readIPDStatusFromPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager readIPDStatusFromPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC8E8;
    id v21 = v10;
    [v11 readIPDStatusFromPeer:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager readIPDStatusFromPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)skipAutoIPDAdjustmentOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager skipAutoIPDAdjustmentOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v23 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v22];
    id v12 = [v6 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke_2;
    v20[3] = &unk_2644FC7F8;
    id v21 = v10;
    [v11 skipAutoIPDAdjustmentFromPeer:v12 withCompletion:v20];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager skipAutoIPDAdjustmentOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initiateIPDResetOnPeer:(id)a3 targetIPD:(double)a4 withCompletion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = defaultLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[MSDKPeerDemoDeviceManager initiateIPDResetOnPeer:targetIPD:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    id v11 = self;
    objc_sync_enter(v11);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__MSDKPeerDemoDeviceManager_initiateIPDResetOnPeer_targetIPD_withCompletion___block_invoke;
    v22[3] = &unk_2644FC7F8;
    id v12 = v9;
    id v23 = v12;
    uint64_t v13 = [(MSDKPeerDemoDeviceManager *)v11 _remoteObjectProxyWithErrorHandler:v22];
    uint64_t v14 = [v8 identifier];
    [v13 initiateIPDResetOnPeer:v14 targetIPD:v12 withCompletion:a4];

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    id v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager initiateIPDResetOnPeer:targetIPD:withCompletion:](&v11->super, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

uint64_t __77__MSDKPeerDemoDeviceManager_initiateIPDResetOnPeer_targetIPD_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

- (void)queryIPDResetStageOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[MSDKPeerDemoDeviceManager queryIPDResetStageOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __69__MSDKPeerDemoDeviceManager_queryIPDResetStageOnPeer_withCompletion___block_invoke;
    v20[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v21 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v20];
    id v12 = [v6 identifier];
    [v11 queryIPDResetStageOnPeer:v12 withCompletion:v10];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager queryIPDResetStageOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __69__MSDKPeerDemoDeviceManager_queryIPDResetStageOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAccessibiltiySettingsOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[MSDKPeerDemoDeviceManager getAccessibiltiySettingsOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__MSDKPeerDemoDeviceManager_getAccessibiltiySettingsOnPeer_withCompletion___block_invoke;
    v20[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v21 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v20];
    id v12 = [v6 identifier];
    [v11 getAccessibiltiySettingsOnPeer:v12 withCompletion:v10];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager getAccessibiltiySettingsOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __75__MSDKPeerDemoDeviceManager_getAccessibiltiySettingsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAccessibiltiySettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[MSDKPeerDemoDeviceManager setAccessibiltiySettingsOnPeer:newSettings:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    id v12 = self;
    objc_sync_enter(v12);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __87__MSDKPeerDemoDeviceManager_setAccessibiltiySettingsOnPeer_newSettings_withCompletion___block_invoke;
    v23[3] = &unk_2644FC7F8;
    id v13 = v10;
    id v24 = v13;
    uint64_t v14 = [(MSDKPeerDemoDeviceManager *)v12 _remoteObjectProxyWithErrorHandler:v23];
    uint64_t v15 = [v8 identifier];
    [v14 setAccessibiltiySettingsOnPeer:v15 newSettings:v9 withCompletion:v13];

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    id v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager setAccessibiltiySettingsOnPeer:newSettings:withCompletion:](&v12->super, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __87__MSDKPeerDemoDeviceManager_setAccessibiltiySettingsOnPeer_newSettings_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)wipeCustomerAssetsOnPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[MSDKPeerDemoDeviceManager wipeCustomerAssetsOnPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __69__MSDKPeerDemoDeviceManager_wipeCustomerAssetsOnPeer_withCompletion___block_invoke;
    v20[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v21 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v20];
    id v12 = [v6 identifier];
    [v11 wipeCustomerAssetsOnPeer:v12 withCompletion:v10];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager wipeCustomerAssetsOnPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __69__MSDKPeerDemoDeviceManager_wipeCustomerAssetsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)syncCurrentWiFiSettingsToPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[MSDKPeerDemoDeviceManager syncCurrentWiFiSettingsToPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__MSDKPeerDemoDeviceManager_syncCurrentWiFiSettingsToPeer_withCompletion___block_invoke;
    v20[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v21 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v20];
    id v12 = [v6 identifier];
    [v11 syncCurrentWiFiSettingsToPeer:v12 withCompletion:v10];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager syncCurrentWiFiSettingsToPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __74__MSDKPeerDemoDeviceManager_syncCurrentWiFiSettingsToPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)changeWiFiSettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[MSDKPeerDemoDeviceManager changeWiFiSettingsOnPeer:newSettings:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    id v12 = self;
    objc_sync_enter(v12);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __81__MSDKPeerDemoDeviceManager_changeWiFiSettingsOnPeer_newSettings_withCompletion___block_invoke;
    v23[3] = &unk_2644FC7F8;
    id v13 = v10;
    id v24 = v13;
    uint64_t v14 = [(MSDKPeerDemoDeviceManager *)v12 _remoteObjectProxyWithErrorHandler:v23];
    uint64_t v15 = [v8 identifier];
    [v14 changeWiFiSettingsOnPeer:v15 newSettings:v9 withCompletion:v13];

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    id v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager changeWiFiSettingsOnPeer:newSettings:withCompletion:](&v12->super, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __81__MSDKPeerDemoDeviceManager_changeWiFiSettingsOnPeer_newSettings_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePairedPeer:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[MSDKPeerDemoDeviceManager removePairedPeer:withCompletion:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__MSDKPeerDemoDeviceManager_removePairedPeer_withCompletion___block_invoke;
    v20[3] = &unk_2644FC7F8;
    id v10 = v7;
    id v21 = v10;
    id v11 = [(MSDKPeerDemoDeviceManager *)v9 _remoteObjectProxyWithErrorHandler:v20];
    id v12 = [v6 identifier];
    [v11 removePairedPeer:v12 withCompletion:v10];

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    id v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager removePairedPeer:withCompletion:](&v9->super, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __61__MSDKPeerDemoDeviceManager_removePairedPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_setUpXPCConnectionIfNeeded
{
  v3 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];

  if (v3) {
    return 1;
  }
  int v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "MSDKPeerDemoDeviceManager: Setting up XPC connection.", (uint8_t *)buf, 2u);
  }

  id v6 = +[MSDKManagedDevice sharedInstance];
  id v7 = [v6 retrieveXPCConnectionToPeerService];
  [(MSDKPeerDemoDeviceManager *)self setXpcConnection:v7];

  id v8 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
  BOOL v4 = v8 != 0;

  if (v8)
  {
    uint64_t v51 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0954E8];
    id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D09A498];
    id v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    [v9 setClasses:v13 forSelector:sel_listAppsOnPeerOfID_appKind_withCompletion_ argumentIndex:0 ofReply:1];

    uint64_t v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    [v9 setClasses:v17 forSelector:sel_listAvailableEnvironmentsOnPeerOfID_withCompletion_ argumentIndex:0 ofReply:1];

    uint64_t v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    id v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    [v9 setClasses:v21 forSelector:sel_enumerateTestScriptsOnPeerOfID_withCompletion_ argumentIndex:0 ofReply:1];

    uint64_t v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v25 = v51;
    uint64_t v26 = objc_msgSend(v22, "setWithObjects:", v23, v24, v50, objc_opt_class(), 0);
    [v9 setClasses:v26 forSelector:sel_obtainGKMetricsOnPeerOfID_withCompletion_ argumentIndex:0 ofReply:1];

    uint64_t v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    [v9 setClasses:v30 forSelector:sel_obtainGKResultsOnPeerOfID_withCompletion_ argumentIndex:0 ofReply:1];

    uint64_t v31 = (void *)MEMORY[0x263EFFA08];
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    [v9 setClasses:v33 forSelector:sel_readIPDStatusFromPeer_withCompletion_ argumentIndex:0 ofReply:1];

    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    [v9 setClasses:v36 forSelector:sel_getAccessibiltiySettingsOnPeer_withCompletion_ argumentIndex:0 ofReply:1];

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    [v9 setClasses:v39 forSelector:sel_setAccessibiltiySettingsOnPeer_newSettings_withCompletion_ argumentIndex:0 ofReply:1];

    v40 = (void *)MEMORY[0x263EFFA08];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    [v9 setClasses:v42 forSelector:sel_changeWiFiSettingsOnPeer_newSettings_withCompletion_ argumentIndex:0 ofReply:1];

    objc_initWeak(buf, self);
    v43 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
    [v43 setExportedInterface:v51];

    v44 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
    [v44 setExportedObject:self];

    v45 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
    [v45 setRemoteObjectInterface:v9];

    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke;
    v54[3] = &unk_2644FC910;
    objc_copyWeak(&v55, buf);
    v46 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
    [v46 setInterruptionHandler:v54];

    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149;
    v52[3] = &unk_2644FC910;
    objc_copyWeak(&v53, buf);
    v47 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
    [v47 setInvalidationHandler:v52];

    v48 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
    [v48 activate];

    objc_destroyWeak(&v53);
    objc_destroyWeak(&v55);
    objc_destroyWeak(buf);
  }
  else
  {
    uint64_t v25 = defaultLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager _setUpXPCConnectionIfNeeded]();
    }
  }

  return v4;
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_cold_1();
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(WeakRetained);
  id v5 = objc_loadWeakRetained(v3);
  [v5 _cleanUpUponXPCDisconnection];

  objc_sync_exit(WeakRetained);
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149(uint64_t a1)
{
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149_cold_1();
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(WeakRetained);
  id v5 = objc_loadWeakRetained(v3);
  [v5 _cleanUpUponXPCDisconnection];

  objc_sync_exit(WeakRetained);
}

- (void)_cleanUpUponXPCDisconnection
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(MSDKPeerDemoDeviceManager *)self setXpcConnection:0];
  v3 = (void *)MEMORY[0x263EFF8C0];
  BOOL v4 = [(MSDKPeerDemoDeviceManager *)self peers];
  id v5 = [v4 allValues];
  id v6 = [v3 arrayWithArray:v5];

  id v7 = [(MSDKPeerDemoDeviceManager *)self peers];
  [v7 removeAllObjects];

  id v8 = [(MSDKPeerDemoDeviceManager *)self observer];

  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
          uint64_t v15 = [(MSDKPeerDemoDeviceManager *)self observer];
          [v15 managerDidLosePeer:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(MSDKPeerDemoDeviceManager *)self _setUpXPCConnectionIfNeeded])
  {
    id v5 = [(MSDKPeerDemoDeviceManager *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__MSDKPeerDemoDeviceManager__remoteObjectProxyWithErrorHandler___block_invoke;
    v9[3] = &unk_2644FC7F8;
    id v10 = v4;
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v9];
  }
  else
  {
    id v7 = [MEMORY[0x263F087E8] errorDomainMSDWithCode:3727741186 message:@"Failed to establish xpc connection to demod."];
    (*((void (**)(id, void *))v4 + 2))(v4, v7);

    id v6 = 0;
  }

  return v6;
}

void __64__MSDKPeerDemoDeviceManager__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F087E8];
  id v4 = [a2 localizedDescription];
  id v5 = [v3 errorDomainMSDWithCode:3727741186 message:@"Failed to establish xpc connection to demod." reason:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)providerDidDiscoverNewPeer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 identifier];
  id v7 = [(MSDKPeerDemoDeviceManager *)v5 peers];
  id v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager providerDidDiscoverNewPeer:]((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_6;
  }
  long long v16 = [(MSDKPeerDemoDeviceManager *)v5 peers];
  [v16 setObject:v4 forKey:v6];

  long long v17 = [(MSDKPeerDemoDeviceManager *)v5 observer];

  if (v17)
  {
    id v9 = [(MSDKPeerDemoDeviceManager *)v5 observer];
    [v9 managerDidFindPeer:v4];
LABEL_6:
  }
  objc_sync_exit(v5);
}

- (void)providerDidLoseExistingPeerOfID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MSDKPeerDemoDeviceManager *)v5 peers];
  id v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    uint64_t v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:]((uint64_t)v4, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_8;
  }
  id v8 = [(MSDKPeerDemoDeviceManager *)v5 peers];
  [v8 removeObjectForKey:v4];

  id v9 = defaultLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:]((uint64_t)v4, v9);
  }

  uint64_t v10 = [(MSDKPeerDemoDeviceManager *)v5 observer];

  if (v10)
  {
    uint64_t v11 = [(MSDKPeerDemoDeviceManager *)v5 observer];
    [v11 managerDidLosePeer:v7];
LABEL_8:
  }
  objc_sync_exit(v5);
}

- (void)providerDidUpdateDeviceInfoOnPeerOfID:(id)a3 withNewProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(MSDKPeerDemoDeviceManager *)v8 peers];
  uint64_t v10 = [v9 objectForKey:v6];

  if (!v10)
  {
    uint64_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:]((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_6;
  }
  [v10 refreshDevicePropertiesUsingProperties:v7];
  uint64_t v11 = [(MSDKPeerDemoDeviceManager *)v8 observer];

  if (v11)
  {
    uint64_t v12 = [(MSDKPeerDemoDeviceManager *)v8 observer];
    [v12 managerDidUpdateDeviceInfoForPeer:v10];
LABEL_6:
  }
  objc_sync_exit(v8);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
}

- (MSDKPeerEventsObserverProtocol)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (MSDKPeerEventsObserverProtocol *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)registerPeerEventsObserver:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "MSDKPeerDemoDeviceManager: Observer must conform to MSDKPeerEventsObserverProtocol.", v2, v3, v4, v5, v6);
}

- (void)startPeerDiscoveryWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attemptPairingWithPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)subscribeDeviceInfoFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchDeviceInfoFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initiateAirPlayAssistedFromPeer:(uint64_t)a3 usingParameters:(uint64_t)a4 discoveryMode:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)triggerSnapshotRevertOnPeer:(uint64_t)a3 rebootDevice:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)invokeInputRecoveryOnPeer:(uint64_t)a3 forType:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)adjustVolumeOnPeer:(uint64_t)a3 toValue:(uint64_t)a4 forCategory:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listAppsOnPeer:(uint64_t)a3 appKind:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchAppOnPeer:(uint64_t)a3 appIdentifier:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)terminateAppOnPeer:(uint64_t)a3 appIdentifier:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listAvailableEnvironmentsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setActiveEnvironmentOnPeer:(uint64_t)a3 environmentID:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImmersionLevelOnPeer:(uint64_t)a3 immersionLevel:(uint64_t)a4 animationDuration:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetToPassThroughOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enumerateTestScriptsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchTestScriptOnPeer:(uint64_t)a3 ofIdentifier:(uint64_t)a4 asRoot:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)obtainGKResultsFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)obtainGKMetricsFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadLSMeasurementsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)retrieveHSCoachingSuggestionFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readIPDStatusFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)skipAutoIPDAdjustmentOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initiateIPDResetOnPeer:(uint64_t)a3 targetIPD:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)queryIPDResetStageOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getAccessibiltiySettingsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setAccessibiltiySettingsOnPeer:(uint64_t)a3 newSettings:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)wipeCustomerAssetsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)syncCurrentWiFiSettingsToPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)changeWiFiSettingsOnPeer:(uint64_t)a3 newSettings:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removePairedPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setUpXPCConnectionIfNeeded
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "MSDKPeerDemoDeviceManager: Failed to retrieve XPC connection.", v2, v3, v4, v5, v6);
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "MSDKPeerDemoDeviceManager: XPC connection to demod interrupred.", v2, v3, v4, v5, v6);
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "MSDKPeerDemoDeviceManager: XPC connection to demod invalidated.", v2, v3, v4, v5, v6);
}

- (void)providerDidDiscoverNewPeer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)providerDidLoseExistingPeerOfID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)providerDidLoseExistingPeerOfID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21EF08000, a2, OS_LOG_TYPE_DEBUG, "%s - Removing peer with id:  %{public}@", (uint8_t *)&v2, 0x16u);
}

@end