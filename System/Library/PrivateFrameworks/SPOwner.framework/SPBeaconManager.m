@interface SPBeaconManager
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPBeaconManager)init;
- (SPBeaconManagerSimpleBeaconUpdateInterface)simpleBeaconUpdateInterface;
- (SPBeaconManagerXPCProtocol)proxy;
- (SPLocalBeaconManager)localBeaconingManager;
- (id)beaconingKeyChangedBlockWithCompletion;
- (id)nearbyTokensChangedBlockWithCompletion;
- (id)remoteInterface;
- (id)stateChangedBlockWithCompletion;
- (id)statusChangedBlockWithCompletion;
- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6;
- (void)allBeaconsOfType:(id)a3 completion:(id)a4;
- (void)allBeaconsOfTypes:(id)a3 completion:(id)a4;
- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6;
- (void)allBeaconsWithCompletion:(id)a3;
- (void)allDuriansWithCompletion:(id)a3;
- (void)beaconForUUID:(id)a3 completion:(id)a4;
- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)connectedToBeacon:(id)a3 withIndex:(unint64_t)a4;
- (void)connectedToBeacon:(id)a3 withIndex:(unint64_t)a4 completion:(id)a5;
- (void)connectionTokensForBeaconUUID:(id)a3 completion:(id)a4;
- (void)connectionTokensForBeaconUUID:(id)a3 criteria:(id)a4 completion:(id)a5;
- (void)connectionTokensForBeaconUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6;
- (void)createKeyReconcilerWithCompletion:(id)a3;
- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4;
- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)isLPEMModeSupported:(id)a3;
- (void)keySyncMetadataWithcompletion:(id)a3;
- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4;
- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4;
- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4;
- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4;
- (void)removeDuplicateBeaconsWithCompletion:(id)a3;
- (void)repairDataStore:(id)a3;
- (void)roleCategoriesWithCompletion:(id)a3;
- (void)setAlignmentUncertainty:(double)a3 atIndex:(unint64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7;
- (void)setBeaconingKeyChangedBlockWithCompletion:(id)a3;
- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5;
- (void)setKeyRollInterval:(unint64_t)a3 forBeacon:(id)a4 completion:(id)a5;
- (void)setLocalBeaconingManager:(id)a3;
- (void)setNearbyTokensChangedBlockWithCompletion:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRole:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSimpleBeaconUpdateInterface:(id)a3;
- (void)setStateChangedBlockWithCompletion:(id)a3;
- (void)setStatusChangedBlockWithCompletion:(id)a3;
- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4;
- (void)setUserAgentProxy:(id)a3;
- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4;
- (void)setWildKeyBase:(unint64_t)a3 interval:(unint64_t)a4 fallback:(unint64_t)a5 forBeacon:(id)a6 completion:(id)a7;
- (void)start;
- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 collectionDifference:(id)a4 completion:(id)a5;
- (void)stopUpdatingSimpleBeaconsWithCompletion:(id)a3;
- (void)submitDeviceEvent:(id)a3 source:(unsigned int)a4 attachedTo:(id)a5 completion:(id)a6;
- (void)unacceptedBeaconsWithCompletion:(id)a3;
- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updateObfuscatedIdentifierWithCompletion:(id)a3;
- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3;
@end

@implementation SPBeaconManager

void __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_248(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes completion beacon count: %lu", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localBeaconingManager, 0);
  objc_storeStrong((id *)&self->_simpleBeaconUpdateInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);

  objc_storeStrong(&self->_nearbyTokensChangedBlockWithCompletion, 0);
}

- (SPBeaconManagerXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SPBeaconManager *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(SPBeaconManager *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    uint64_t v6 = [(SPBeaconManager *)self serviceDescription];
    uint64_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPBeaconManager *)self setSession:v7];

    v8 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(SPBeaconManager *)self serviceDescription];
      v10 = [v9 machService];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    v11 = [(SPBeaconManager *)self session];
    [v11 resume];
  }
  v12 = [(SPBeaconManager *)self session];
  v13 = [v12 proxy];

  return (SPBeaconManagerXPCProtocol *)v13;
}

- (FMXPCSession)session
{
  return self->_session;
}

void __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_247(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes: %{public}@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained userAgentProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_248;
  v7[3] = &unk_1E601C070;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v5 allBeaconsOfTypes:v6 includeDupes:0 includeHidden:0 completion:v7];
}

void __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke(id *a1)
{
  v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: allBeaconsOfTypes:completion:", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_247;
  block[3] = &unk_1E601C400;
  id v5 = a1[5];
  objc_copyWeak(&v7, buf);
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(SPBeaconManager *)self invalidate];
  localBeaconingManager = self->_localBeaconingManager;
  self->_localBeaconingManager = 0;

  v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: Dealloc %{public}@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SPBeaconManager;
  [(SPBeaconManager *)&v5 dealloc];
}

- (void)invalidate
{
  id v2 = [(SPBeaconManager *)self localBeaconingManager];
  [v2 invalidate];
}

- (SPLocalBeaconManager)localBeaconingManager
{
  return self->_localBeaconingManager;
}

- (void)allBeaconsOfTypes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: allBeaconsOfTypes:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (id)stateChangedBlockWithCompletion
{
  id v2 = [(SPBeaconManager *)self localBeaconingManager];
  uint64_t v3 = [v2 stateChangedBlockWithCompletion];

  return v3;
}

- (void)setStateChangedBlockWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconManager *)self localBeaconingManager];
  [v5 setStateChangedBlockWithCompletion:v4];
}

- (id)statusChangedBlockWithCompletion
{
  id v2 = [(SPBeaconManager *)self localBeaconingManager];
  uint64_t v3 = [v2 statusChangedBlockWithCompletion];

  return v3;
}

- (void)setStatusChangedBlockWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconManager *)self localBeaconingManager];
  [v5 setStatusChangedBlockWithCompletion:v4];
}

- (id)beaconingKeyChangedBlockWithCompletion
{
  id v2 = [(SPBeaconManager *)self localBeaconingManager];
  uint64_t v3 = [v2 beaconingKeyChangedBlockWithCompletion];

  return v3;
}

- (void)setBeaconingKeyChangedBlockWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconManager *)self localBeaconingManager];
  [v5 setBeaconingKeyChangedBlockWithCompletion:v4];
}

- (SPBeaconManager)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SPBeaconManager;
  id v2 = [(SPBeaconManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SPBeaconManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    if (!os_variant_has_internal_content()) {
      goto LABEL_4;
    }
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    id v7 = [v6 environment];
    id v8 = [v7 objectForKeyedSubscript:@"UNDER_TEST"];

    if (!v8)
    {
LABEL_4:
      id v9 = objc_alloc_init(SPLocalBeaconManager);
      localBeaconingManager = v2->_localBeaconingManager;
      v2->_localBeaconingManager = v9;

      id v11 = objc_alloc(MEMORY[0x1E4F61588]);
      id v12 = [(SPBeaconManager *)v2 remoteInterface];
      uint64_t v13 = [v11 initWithMachServiceName:@"com.apple.icloud.searchpartyd.beaconmanager" options:0 remoteObjectInterface:v12 interruptionHandler:0 invalidationHandler:0];
      serviceDescription = v2->_serviceDescription;
      v2->_serviceDescription = (FMXPCServiceDescription *)v13;

      int v15 = LogCategory_BeaconManager();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v2;
        _os_log_impl(&dword_1B2FD8000, v15, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: Created %{public}@", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (id)remoteInterface
{
  v71[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44050];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  dispatch_queue_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_allBeaconsWithCompletion_ argumentIndex:0 ofReply:1];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v70[0] = objc_opt_class();
  v70[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  id v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_allBeaconsOfTypes_includeDupes_includeHidden_completion_ argumentIndex:0 ofReply:1];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  v69[0] = objc_opt_class();
  v69[1] = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  id v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel_unacceptedBeaconsWithCompletion_ argumentIndex:0 ofReply:1];

  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  v14 = [v12 setWithArray:v13];
  [v2 setClasses:v14 forSelector:sel_beaconingKeysForUUID_dateInterval_completion_ argumentIndex:0 ofReply:1];

  int v15 = (void *)MEMORY[0x1E4F1CAD0];
  v67[0] = objc_opt_class();
  v67[1] = objc_opt_class();
  v67[2] = objc_opt_class();
  v67[3] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
  objc_super v17 = [v15 setWithArray:v16];
  [v2 setClasses:v17 forSelector:sel_commandKeysForUUIDs_dateInterval_completion_ argumentIndex:0 ofReply:1];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v66[0] = objc_opt_class();
  v66[1] = objc_opt_class();
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  uint64_t v20 = [v18 setWithArray:v19];
  [v2 setClasses:v20 forSelector:sel_allDuriansWithCompletion_ argumentIndex:0 ofReply:1];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  v65[0] = objc_opt_class();
  v65[1] = objc_opt_class();
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  v23 = [v21 setWithArray:v22];
  [v2 setClasses:v23 forSelector:sel_nearOwnerCommandKeysWithCompletion_ argumentIndex:0 ofReply:1];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v26 = [v24 setWithArray:v25];
  [v2 setClasses:v26 forSelector:sel_roleCategoriesWithCompletion_ argumentIndex:0 ofReply:1];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  v63[0] = objc_opt_class();
  v63[1] = objc_opt_class();
  v63[2] = objc_opt_class();
  v63[3] = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
  v29 = [v27 setWithArray:v28];
  [v2 setClasses:v29 forSelector:sel_commandKeysForUUIDs_dateInterval_completion_ argumentIndex:0 ofReply:1];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  v62[2] = objc_opt_class();
  v62[3] = objc_opt_class();
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
  v32 = [v30 setWithArray:v31];
  [v2 setClasses:v32 forSelector:sel_commandKeysForUUIDs_completion_ argumentIndex:0 ofReply:1];

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v35 = [v33 setWithArray:v34];
  [v2 setClasses:v35 forSelector:sel_commandKeysForUUID_withCriteria_completion_ argumentIndex:0 ofReply:1];

  v36 = (void *)MEMORY[0x1E4F1CAD0];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  v38 = [v36 setWithArray:v37];
  [v2 setClasses:v38 forSelector:sel_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion_ argumentIndex:0 ofReply:1];

  v39 = (void *)MEMORY[0x1E4F1CAD0];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  v59[2] = objc_opt_class();
  v59[3] = objc_opt_class();
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
  v41 = [v39 setWithArray:v40];
  [v2 setClasses:v41 forSelector:sel_fetchAllKeyMapFileDescriptorsWithCompletion_ argumentIndex:0 ofReply:1];

  v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v58 = objc_opt_class();
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  v44 = [v42 setWithArray:v43];
  [v2 setClasses:v44 forSelector:sel_fetchAllKeyMapFileDescriptorsWithCompletion_ argumentIndex:1 ofReply:1];

  v45 = (void *)MEMORY[0x1E4F1CAD0];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  v47 = [v45 setWithArray:v46];
  [v2 setClasses:v47 forSelector:sel_ownedDeviceKeyRecordsForUUID_completion_ argumentIndex:0 ofReply:1];

  v48 = (void *)MEMORY[0x1E4F1CAD0];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  v50 = [v48 setWithArray:v49];
  [v2 setClasses:v50 forSelector:sel_purgeOwnedDeviceKeyRecordsForUUID_completion_ argumentIndex:0 ofReply:1];

  v51 = (void *)MEMORY[0x1E4F1CAD0];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  v53 = [v51 setWithArray:v52];
  [v2 setClasses:v53 forSelector:sel_createOwnedDeviceKeyRecordForUUID_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (void)start
{
  id v2 = [(SPBeaconManager *)self localBeaconingManager];
  [v2 start];
}

- (void)updateObfuscatedIdentifierWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[SPBeaconManager updateObfuscatedIdentifierWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(SPBeaconManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SPBeaconManager_updateObfuscatedIdentifierWithCompletion___block_invoke;
  v8[3] = &unk_1E601C338;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __60__SPBeaconManager_updateObfuscatedIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 updateObfuscatedIdentifierWithCompletion:*(void *)(a1 + 32)];
}

- (void)beaconForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPBeaconManager_beaconForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601BC00;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: beaconForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __44__SPBeaconManager_beaconForUUID_completion___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v2 = a1[4] == 0;
  uint64_t v3 = LogCategory_BeaconManager();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __44__SPBeaconManager_beaconForUUID_completion___block_invoke_cold_1(v4);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[SPBeaconManager beaconForUUID:completion:]_block_invoke";
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, a1[5]);
    id v5 = [a1[5] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SPBeaconManager_beaconForUUID_completion___block_invoke_241;
    block[3] = &unk_1E601B850;
    objc_copyWeak(&v9, (id *)buf);
    id v7 = a1[4];
    id v8 = a1[6];
    dispatch_async(v5, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __44__SPBeaconManager_beaconForUUID_completion___block_invoke_241(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v2 = [WeakRetained userAgentProxy];
  [v2 beaconForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: ownedDeviceKeyRecordsForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager ownedDeviceKeyRecordsForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke_242;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke_242(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v2 = [WeakRetained userAgentProxy];
  [v2 ownedDeviceKeyRecordsForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: purgeOwnedDeviceKeyRecordsForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager purgeOwnedDeviceKeyRecordsForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke_243;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke_243(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v2 = [WeakRetained userAgentProxy];
  [v2 purgeOwnedDeviceKeyRecordsForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: createOwnedDeviceKeyRecordForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager createOwnedDeviceKeyRecordForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke_244;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke_244(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v2 = [WeakRetained userAgentProxy];
  [v2 createOwnedDeviceKeyRecordForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: notificationBeaconForSubscriptionId:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager notificationBeaconForSubscriptionId:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke_245;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke_245(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v2 = [WeakRetained userAgentProxy];
  [v2 notificationBeaconForSubscriptionId:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)allBeaconsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: allBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[SPBeaconManager allBeaconsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke_246;
  v4[3] = &unk_1E601C338;
  objc_copyWeak(&v6, (id *)buf);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke_246(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v2 = [WeakRetained userAgentProxy];
  [v2 allBeaconsWithCompletion:*(void *)(a1 + 32)];
}

- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke;
  v14[3] = &unk_1E601D110;
  v14[4] = self;
  id v15 = v10;
  BOOL v17 = a4;
  BOOL v18 = a5;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: allBeaconsOfTypes:includeDupes:includeHidden:completion:", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke(uint64_t a1)
{
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: allBeaconsOfTypes:includeDupes:includeHidden:completion:", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_250;
  v4[3] = &unk_1E601D0E8;
  id v5 = *(id *)(a1 + 40);
  objc_copyWeak(&v7, buf);
  __int16 v8 = *(_WORD *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_250(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes: %{public}@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained userAgentProxy];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 57);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_251;
  v9[3] = &unk_1E601C070;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [v5 allBeaconsOfTypes:v8 includeDupes:v6 includeHidden:v7 completion:v9];
}

void __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_251(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes:includeDupes:includeHidden: completion beacon count: %lu", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allBeaconsOfType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: allBeaconsOfType:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[SPBeaconManager allBeaconsOfType:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[5]];
  id v4 = [a1[4] queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke_252;
  v6[3] = &unk_1E601C668;
  id v7 = a1[5];
  objc_copyWeak(&v10, (id *)buf);
  id v8 = v3;
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke_252(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %lu", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained allBeaconsOfTypes:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 collectionDifference:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v25 = "-[SPBeaconManager startUpdatingSimpleBeaconsWithContext:collectionDifference:completion:]";
    _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %{public}s", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke;
  aBlock[3] = &unk_1E601C950;
  aBlock[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  id v15 = _Block_copy(aBlock);
  id v16 = [(SPBeaconManager *)self queue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_4;
  v18[3] = &unk_1E601B828;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  dispatch_async(v16, v18);
}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke(uint64_t a1)
{
  BOOL v2 = objc_opt_new();
  [*(id *)(a1 + 32) setSimpleBeaconUpdateInterface:v2];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_2;
  v4[3] = &unk_1E601C928;
  id v5 = *(id *)(a1 + 48);
  [v2 setSimpleBeaconDifferenceBlock:v4];
  uint64_t v3 = [*(id *)(a1 + 32) simpleBeaconUpdateInterface];
  [v3 startUpdatingSimpleBeaconsWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = [v5 insertions];
    uint64_t v7 = [v11 removals];
    id v8 = [v6 arrayByAddingObjectsFromArray:v7];
    id v9 = objc_msgSend(v8, "fm_map:", &__block_literal_global_256);

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v9];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [SPSimpleBeacon alloc];
  id v4 = [v2 object];
  id v5 = [(SPSimpleBeacon *)v3 initWithInternalSimpleBeacon:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F28F18]);
  uint64_t v7 = [v2 changeType];
  uint64_t v8 = [v2 index];

  id v9 = (void *)[v6 initWithObject:v5 type:v7 index:v8];

  return v9;
}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) simpleBeaconUpdateInterface];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_5;
    v5[3] = &unk_1E601C4B0;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    [v3 stopUpdatingSimpleBeaconsWithCompletion:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_6;
  block[3] = &unk_1E601C288;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopUpdatingSimpleBeaconsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[SPBeaconManager stopUpdatingSimpleBeaconsWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %{public}s", buf, 0xCu);
  }

  id v6 = [(SPBeaconManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SPBeaconManager_stopUpdatingSimpleBeaconsWithCompletion___block_invoke;
  v8[3] = &unk_1E601B828;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __59__SPBeaconManager_stopUpdatingSimpleBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) simpleBeaconUpdateInterface];
  if (v2)
  {
    [*(id *)(a1 + 32) setSimpleBeaconUpdateInterface:0];
    [v2 stopUpdatingSimpleBeaconsWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)unacceptedBeaconsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: unacceptedBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[SPBeaconManager unacceptedBeaconsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke_262;
  v4[3] = &unk_1E601C338;
  objc_copyWeak(&v6, (id *)buf);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke_262(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 unacceptedBeaconsWithCompletion:*(void *)(a1 + 32)];
}

- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: beaconingKeysForUUID:dateInterval:completion:", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[SPBeaconManager beaconingKeysForUUID:dateInterval:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke_263;
  v4[3] = &unk_1E601C6B8;
  objc_copyWeak(&v8, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[7];
  dispatch_async(v3, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke_263(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 beaconingKeysForUUID:*(void *)(a1 + 32) dateInterval:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: postedLocalNotifyWhenFoundNotificationForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager postedLocalNotifyWhenFoundNotificationForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke_264;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke_264(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 postedLocalNotifyWhenFoundNotificationForUUID:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)allDuriansWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SPBeaconManager_allDuriansWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: allDuriansWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __44__SPBeaconManager_allDuriansWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager allDuriansWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  uint64_t v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_cold_1(v3);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_265;
  v5[3] = &unk_1E601C338;
  objc_copyWeak(&v7, (id *)buf);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_265(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 allDuriansWithCompletion:*(void *)(a1 + 32)];
}

- (void)roleCategoriesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: roleCategoriesWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[SPBeaconManager roleCategoriesWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke_266;
  v4[3] = &unk_1E601C338;
  objc_copyWeak(&v6, (id *)buf);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke_266(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 roleCategoriesWithCompletion:*(void *)(a1 + 32)];
}

- (void)setRole:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke;
  v12[3] = &unk_1E601D138;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: setRole:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

void __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager setRole:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v3 = [a1[4] queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke_267;
  v4[3] = &unk_1E601CC08;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a1[7];
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, v4);

  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke_267(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 setRole:*(void *)(a1 + 56) beaconId:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: updateBeacon:updates:completion:", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager updateBeacon:updates:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_268;
  activity_block[3] = &unk_1E601D160;
  activity_void block[4] = a1[4];
  objc_copyWeak(&v7, (id *)buf);
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_268(id *a1)
{
  id v2 = [a1[4] queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_2;
  v3[3] = &unk_1E601C6B8;
  objc_copyWeak(&v7, a1 + 8);
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v7);
}

void __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 updateBeacon:*(void *)(a1 + 32) updates:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)connectionTokensForBeaconUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: connectionTokensForBeaconUUID:dateInterval:completion:", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager connectionTokensForBeaconUUID:dateInterval:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_269;
  activity_block[3] = &unk_1E601D160;
  activity_void block[4] = a1[4];
  objc_copyWeak(&v7, (id *)buf);
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_269(id *a1)
{
  id v2 = [a1[4] queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2;
  v3[3] = &unk_1E601C6B8;
  objc_copyWeak(&v7, a1 + 8);
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v7);
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained userAgentProxy];
  v8[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3;
  v6[3] = &unk_1E601D188;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v3 commandKeysForUUIDs:v4 dateInterval:v5 completion:v6];
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4;
  v6[3] = &unk_1E601CB30;
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) addObjectsFromArray:v5];
}

- (void)connectionTokensForBeaconUUID:(id)a3 criteria:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: connectionTokensForBeaconUUID:criteria:completion:", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager connectionTokensForBeaconUUID:criteria:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_273;
  activity_block[3] = &unk_1E601D160;
  activity_void block[4] = a1[4];
  objc_copyWeak(&v7, (id *)buf);
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling commandKeysForUUID withCriteria", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_273(id *a1)
{
  id v2 = [a1[4] queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_2;
  v3[3] = &unk_1E601C6B8;
  objc_copyWeak(&v7, a1 + 8);
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v7);
}

void __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained userAgentProxy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_3;
  v6[3] = &unk_1E601C9F0;
  id v7 = *(id *)(a1 + 48);
  [v3 commandKeysForUUID:v4 withCriteria:v5 completion:v6];
}

uint64_t __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke;
  activity_block[3] = &unk_1E601C978;
  activity_void block[4] = self;
  id v17 = v10;
  BOOL v20 = a5;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: allBeaconingKeysForUUID:dateInterval:forceGenerate:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SPBeaconManager allBeaconingKeysForUUID:dateInterval:forceGenerate:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke_275;
  block[3] = &unk_1E601C708;
  objc_copyWeak(&v8, (id *)buf);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v3, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke_275(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 allBeaconingKeysForUUID:*(void *)(a1 + 32) dateInterval:*(void *)(a1 + 40) forceGenerate:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 48)];
}

- (void)setAlignmentUncertainty:(double)a3 atIndex:(unint64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke;
  v18[3] = &unk_1E601D1D8;
  double v22 = a3;
  unint64_t v23 = a4;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v21 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: setAlignmentUncertainty:atIndex:forceGenerate:date:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, v18);
}

void __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[SPBeaconManager setAlignmentUncertainty:atIndex:date:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  id v3 = [a1[4] queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke_276;
  v4[3] = &unk_1E601D1B0;
  objc_copyWeak(v8, (id *)buf);
  v8[1] = a1[8];
  void v8[2] = a1[9];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[7];
  dispatch_async(v3, v4);

  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

void __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke_276(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained userAgentProxy];
  [v2 setAlignmentUncertainty:*(void *)(a1 + 72) atIndex:*(void *)(a1 + 32) date:*(void *)(a1 + 40) forBeacon:*(void *)(a1 + 48) completion:*(double *)(a1 + 64)];
}

- (void)setKeyRollInterval:(unint64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke;
  v12[3] = &unk_1E601D138;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: setKeyRollInterval:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

void __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager setKeyRollInterval:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  id v3 = [a1[4] queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke_277;
  v4[3] = &unk_1E601CC08;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a1[7];
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, v4);

  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke_277(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 setKeyRollInterval:*(void *)(a1 + 56) forBeacon:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)setWildKeyBase:(unint64_t)a3 interval:(unint64_t)a4 fallback:(unint64_t)a5 forBeacon:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke;
  v16[3] = &unk_1E601D228;
  unint64_t v20 = a4;
  unint64_t v21 = a5;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  unint64_t v19 = a3;
  id v14 = v13;
  id v15 = v12;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: setWildKeyBase:interval:fallback:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, v16);
}

void __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SPBeaconManager setWildKeyBase:interval:fallback:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke_278;
  v4[3] = &unk_1E601D200;
  objc_copyWeak(&v7, (id *)buf);
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke_278(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 setWildKeyBase:*(void *)(a1 + 56) interval:*(void *)(a1 + 64) fallback:*(void *)(a1 + 72) forBeacon:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke;
  v12[3] = &unk_1E601D138;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: setCurrentWildKeyIndex:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

void __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager setCurrentWildKeyIndex:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  id v3 = [a1[4] queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke_279;
  v4[3] = &unk_1E601CC08;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a1[7];
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, v4);

  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke_279(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 setCurrentWildKeyIndex:*(void *)(a1 + 56) forBeacon:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)connectionTokensForBeaconUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: connectionTokensForBeaconUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke(id *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[SPBeaconManager connectionTokensForBeaconUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_280;
  v3[3] = &unk_1E601C668;
  void v3[4] = a1[4];
  objc_copyWeak(&v6, (id *)buf);
  id v4 = a1[5];
  id v5 = a1[6];
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_280(id *a1)
{
  id v2 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_2;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v6, a1 + 7);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained userAgentProxy];
  v7[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_3;
  v5[3] = &unk_1E601D188;
  id v6 = *(id *)(a1 + 40);
  [v3 commandKeysForUUIDs:v4 completion:v5];
}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_4;
  v6[3] = &unk_1E601CB30;
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)connectedToBeacon:(id)a3 withIndex:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke;
  v12[3] = &unk_1E601D138;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: connectedToBeacon:withIndex:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

void __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[SPBeaconManager connectedToBeacon:withIndex:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke_281;
  v7[3] = &unk_1E601CC08;
  objc_copyWeak(v10, (id *)buf);
  id v4 = *(id *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v8 = v4;
  v10[1] = v5;
  id v9 = v6;
  dispatch_async(v3, v7);

  objc_destroyWeak(v10);
  objc_destroyWeak((id *)buf);
}

void __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke_281(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 connectedToBeacon:*(void *)(a1 + 32) withIndex:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)connectedToBeacon:(id)a3 withIndex:(unint64_t)a4
{
}

- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: fetchUserStatsForBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager fetchUserStatsForBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  id v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke_285;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke_285(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 fetchUserStatsForBeacon:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: fetchFirmwareVersionForBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SPBeaconManager fetchFirmwareVersionForBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  id v3 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke_286;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke_286(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained userAgentProxy];
  [v2 fetchFirmwareVersionForBeacon:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)createKeyReconcilerWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling createKeyReconcilerWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_2;
  block[3] = &unk_1E601C338;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained userAgentProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3;
  v4[3] = &unk_1E601D270;
  id v5 = *(id *)(a1 + 32);
  [v3 fetchAllKeyMapFileDescriptorsWithCompletion:v4];
}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_BeaconManager();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3_cold_1((uint64_t)v6, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = [v5 count];
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: fetched %zu key map file descriptor sets", (uint8_t *)&v10, 0xCu);
    }

    id v9 = [[SPKeyReconciler alloc] initWithDictionary:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)repairDataStore:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SPBeaconManager_repairDataStore___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconManager: repairDataStore:", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __35__SPBeaconManager_repairDataStore___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[SPBeaconManager repairDataStore:]_block_invoke";
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__SPBeaconManager_repairDataStore___block_invoke_289;
  v4[3] = &unk_1E601C338;
  objc_copyWeak(&v6, (id *)buf);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __35__SPBeaconManager_repairDataStore___block_invoke_289(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained userAgentProxy];
  [v2 repairDataStore:*(void *)(a1 + 32)];
}

- (void)isLPEMModeSupported:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __39__SPBeaconManager_isLPEMModeSupported___block_invoke;
  v7[3] = &unk_1E601B828;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__SPBeaconManager_isLPEMModeSupported___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__SPBeaconManager_isLPEMModeSupported___block_invoke_2;
  v3[3] = &unk_1E601D298;
  id v4 = *(id *)(a1 + 40);
  [v2 isLPEMModeSupportedWithCompletion:v3];
}

uint64_t __39__SPBeaconManager_isLPEMModeSupported___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke;
  v7[3] = &unk_1E601B828;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601D298;
  id v4 = *(id *)(a1 + 40);
  [v2 userHasAcknowledgeFindMyWithCompletion:v3];
}

uint64_t __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SPBeaconManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke;
  block[3] = &unk_1E601BC78;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke_2;
  v4[3] = &unk_1E601C288;
  id v5 = *(id *)(a1 + 40);
  [v2 setUserHasAcknowledgedFindMy:v3 completion:v4];
}

uint64_t __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SPBeaconManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke;
  block[3] = &unk_1E601BC78;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke_2;
  v4[3] = &unk_1E601C288;
  id v5 = *(id *)(a1 + 40);
  [v2 setSuppressLPEMBeaconing:v3 completion:v4];
}

uint64_t __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [(SPBeaconManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SPBeaconManager_createDuplicateBeaconsForBeacon_skipGroupIdentifier_count_completion___block_invoke;
  block[3] = &unk_1E601D2C0;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __88__SPBeaconManager_createDuplicateBeaconsForBeacon_skipGroupIdentifier_count_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  [v2 createDuplicateBeaconsForBeacon:*(void *)(a1 + 40) skipGroupIdentifier:*(unsigned __int8 *)(a1 + 64) count:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)removeDuplicateBeaconsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __56__SPBeaconManager_removeDuplicateBeaconsWithCompletion___block_invoke;
  v7[3] = &unk_1E601B828;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__SPBeaconManager_removeDuplicateBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  [v2 removeDuplicateBeaconsWithCompletion:*(void *)(a1 + 40)];
}

- (void)submitDeviceEvent:(id)a3 source:(unsigned int)a4 attachedTo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(SPBeaconManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SPBeaconManager_submitDeviceEvent_source_attachedTo_completion___block_invoke;
  block[3] = &unk_1E601D2E8;
  void block[4] = self;
  id v18 = v10;
  unsigned int v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __66__SPBeaconManager_submitDeviceEvent_source_attachedTo_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  [v2 submitDeviceEvent:*(void *)(a1 + 40) source:*(unsigned int *)(a1 + 64) attachedTo:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)keySyncMetadataWithcompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __49__SPBeaconManager_keySyncMetadataWithcompletion___block_invoke;
  v7[3] = &unk_1E601B828;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__SPBeaconManager_keySyncMetadataWithcompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userAgentProxy];
  [v2 keySyncMetadataWithcompletion:*(void *)(a1 + 40)];
}

- (id)nearbyTokensChangedBlockWithCompletion
{
  return self->_nearbyTokensChangedBlockWithCompletion;
}

- (void)setNearbyTokensChangedBlockWithCompletion:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (void)setUserAgentProxy:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (SPBeaconManagerSimpleBeaconUpdateInterface)simpleBeaconUpdateInterface
{
  return self->_simpleBeaconUpdateInterface;
}

- (void)setSimpleBeaconUpdateInterface:(id)a3
{
}

- (void)setLocalBeaconingManager:(id)a3
{
}

void __44__SPBeaconManager_beaconForUUID_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B2FD8000, log, OS_LOG_TYPE_FAULT, "SPBeaconManager beaconForUUID called with nil UUID.", v1, 2u);
}

void __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B2FD8000, log, OS_LOG_TYPE_FAULT, "allDuriansWithCompletion has been deprecated. Please use allBeaconsOfTypes:completion: instead.", v1, 2u);
}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPBeaconManager: failed to fetch key map file descriptors: %@", (uint8_t *)&v2, 0xCu);
}

@end