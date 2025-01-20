@interface SCLSchoolModeManager
- (BOOL)isEligibleDevice:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)coordinatorMap;
- (NSMutableSet)clients;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (SCLInterruptBehaviorResolver)interruptBehaviorResolver;
- (SCLSchoolModeManager)initWithConfiguration:(id)a3;
- (SCLSchoolModeManagerConfiguration)configuration;
- (SCLSuppressSchoolModeAssertionManager)supppressionManager;
- (SCLTransportService)transportService;
- (id)activityCriteria;
- (id)descriptionBuilderForNRDevice:(id)a3;
- (id)eligiblePairedDevices;
- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3;
- (unint64_t)stateHandle;
- (void)_handleActivityStarted:(id)a3;
- (void)_updateActivityRegistration;
- (void)clientProxy:(id)a3 didConnectWithPairingID:(id)a4;
- (void)clientProxyDidInvalidate:(id)a3;
- (void)createControllerForDevice:(id)a3;
- (void)dealloc;
- (void)handleDevicePairedNotification:(id)a3;
- (void)handleDeviceUnpairedNotification:(id)a3;
- (void)loadPairedDevices;
- (void)removeCoordinator:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)start;
@end

@implementation SCLSchoolModeManager

- (SCLSchoolModeManager)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SCLSchoolModeManager;
  v5 = [(SCLSchoolModeManager *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SCLSchoolModeManagerConfiguration *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    coordinatorMap = v5->_coordinatorMap;
    v5->_coordinatorMap = (NSMapTable *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    clients = v5->_clients;
    v5->_clients = v10;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v13 = dispatch_queue_attr_make_initially_inactive(v12);

    v14 = [v4 workloop];
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.schooltime.manager", v13, v14);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v15;

    if ([(SCLSchoolModeManagerConfiguration *)v5->_configuration managesSchoolTimeSession])
    {
      v17 = [[SCLSuppressSchoolModeAssertionManager alloc] initWithTargetQueue:v5->_queue];
      supppressionManager = v5->_supppressionManager;
      v5->_supppressionManager = v17;
    }
    v19 = [[SCLInterruptBehaviorResolver alloc] initWithTargetQueue:v5->_queue];
    interruptBehaviorResolver = v5->_interruptBehaviorResolver;
    v5->_interruptBehaviorResolver = v19;

    v21 = [SCLTransportService alloc];
    v22 = v5->_queue;
    v23 = [v4 service];
    uint64_t v24 = [(SCLTransportService *)v21 initWithTargetQueue:v22 service:v23];
    transportService = v5->_transportService;
    v5->_transportService = (SCLTransportService *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.schooltime.schedule"];
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v26;

    [(NSXPCListener *)v5->_listener _setQueue:v5->_queue];
    [(NSXPCListener *)v5->_listener setDelegate:v5];
    objc_initWeak(&location, v5);
    objc_copyWeak(&v29, &location);
    v5->_stateHandle = os_state_add_handler();
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v5;
}

uint64_t __46__SCLSchoolModeManager_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained stateDataWithHints:a2];

  return v4;
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  uint64_t v4 = [(SCLSchoolModeManager *)self configuration];
  v5 = [v4 deviceRegistry];
  uint64_t v6 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:&__block_literal_global_11];

  v7 = [MEMORY[0x263F29C40] builderWithObject:self];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_2;
  v13[3] = &unk_2648ACB88;
  id v14 = v7;
  dispatch_queue_t v15 = self;
  id v16 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 appendBodySectionWithName:0 multilinePrefix:0 block:v13];
  v10 = [v9 build];
  v11 = (os_state_data_s *)SCLSStateDataWithTitleDescriptionAndHints(@"SCLSchoolModeManager", (uint64_t)v10);

  return v11;
}

uint64_t __43__SCLSchoolModeManager_stateDataWithHints___block_invoke()
{
  return 1;
}

uint64_t __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) coordinatorMap];
  uint64_t v4 = [v3 objectEnumerator];
  v5 = [v4 allObjects];
  [v2 appendArraySection:v5 withName:@"coordinators" skipIfEmpty:0];

  uint64_t v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(*(void *)(a1 + 40) + 8) allObjects];
  [v6 appendArraySection:v7 withName:@"clients" skipIfEmpty:0];

  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_3;
  v11[3] = &unk_2648ACCB8;
  id v9 = *(void **)(a1 + 32);
  v11[4] = *(void *)(a1 + 40);
  return [v9 appendArraySection:v8 withName:@"devices" skipIfEmpty:0 objectTransformer:v11];
}

id __43__SCLSchoolModeManager_stateDataWithHints___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) descriptionBuilderForNRDevice:a2];
  v3 = [v2 build];

  return v3;
}

- (id)descriptionBuilderForNRDevice:(id)a3
{
  v3 = (void *)MEMORY[0x263F29C40];
  id v4 = a3;
  v5 = [v3 builderWithObject:v4];
  uint64_t v6 = [v4 pairingID];
  id v7 = (id)[v5 appendObject:v6 withName:@"pairingID"];

  uint64_t v8 = [v4 valueForProperty:*MEMORY[0x263F575E8]];
  id v9 = (id)[v5 appendBool:v8 != 0 withName:@"hasPairingStorePath"];

  v10 = [v4 valueForProperty:*MEMORY[0x263F575B0]];
  id v11 = (id)objc_msgSend(v5, "appendBool:withName:", objc_msgSend(v10, "BOOLValue"), @"isAltAccount");

  v12 = [v4 valueForProperty:*MEMORY[0x263F575B8]];

  id v13 = (id)objc_msgSend(v5, "appendBool:withName:", objc_msgSend(v12, "BOOLValue"), @"isArchived");
  return v5;
}

- (void)start
{
  v3 = _os_activity_create(&dword_22B7B4000, "Start School Mode Manager", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = scl_framework_log();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Start School Mode Manager", (const char *)&unk_22B7E6621, buf, 2u);
  }

  v5 = [(SCLSchoolModeManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SCLSchoolModeManager_start__block_invoke;
  block[3] = &unk_2648AC6A0;
  block[4] = self;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  dispatch_async(v5, v6);

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_handleDevicePairedNotification_ name:*MEMORY[0x263F576A8] object:0];

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_handleDeviceUnpairedNotification_ name:*MEMORY[0x263F576B8] object:0];

  id v9 = [(SCLSchoolModeManager *)self queue];
  dispatch_activate(v9);

  v10 = [(SCLSchoolModeManager *)self listener];
  [v10 resume];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SCLServerStartNotification", 0, 0, 0);
  os_activity_scope_leave(&state);
}

void __29__SCLSchoolModeManager_start__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) supppressionManager];
  [v2 activate];

  v3 = [*(id *)(a1 + 32) interruptBehaviorResolver];
  [v3 activate];

  [*(id *)(a1 + 32) loadPairedDevices];
  id v4 = [*(id *)(a1 + 32) transportService];
  [v4 start];

  [*(id *)(a1 + 32) _updateActivityRegistration];
  v5 = scl_framework_log();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)dispatch_block_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Start School Mode Manager", (const char *)&unk_22B7E6621, v6, 2u);
  }
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)SCLSchoolModeManager;
  [(SCLSchoolModeManager *)&v3 dealloc];
}

- (void)loadPairedDevices
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = [(SCLSchoolModeManager *)self eligiblePairedDevices];
  id v4 = scl_pairing_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v3;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "Loading devices %@", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SCLSchoolModeManager createControllerForDevice:](self, "createControllerForDevice:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)eligiblePairedDevices
{
  objc_super v3 = [(SCLSchoolModeManager *)self configuration];
  id v4 = [v3 deviceRegistry];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SCLSchoolModeManager_eligiblePairedDevices__block_invoke;
  v7[3] = &unk_2648ACCE0;
  v7[4] = self;
  id v5 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];

  return v5;
}

uint64_t __45__SCLSchoolModeManager_eligiblePairedDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) isEligibleDevice:v3];
  id v5 = scl_pairing_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 pairingID];
    uint64_t v7 = [v3 valueForProperty:*MEMORY[0x263F575E8]];
    uint64_t v8 = [v3 valueForProperty:*MEMORY[0x263F575B0]];
    int v9 = [v8 BOOLValue];
    long long v10 = [v3 valueForProperty:*MEMORY[0x263F575B8]];
    int v12 = 134219266;
    id v13 = v3;
    __int16 v14 = 2112;
    dispatch_queue_t v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v7 != 0;
    __int16 v18 = 1024;
    int v19 = v9;
    __int16 v20 = 1024;
    int v21 = [v10 BOOLValue];
    __int16 v22 = 1024;
    int v23 = v4;
    _os_log_impl(&dword_22B7B4000, v5, OS_LOG_TYPE_DEFAULT, "<NRDevice %p; pairingID=%@; hasPairingPath=%{BOOL}d; isAltAccount=%{BOOL}d; isArchived=%{BOOL}d> isEligible:%{BOOL}d",
      (uint8_t *)&v12,
      0x2Eu);
  }
  return v4;
}

- (BOOL)isEligibleDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSchoolModeManager *)self configuration];
  char v6 = SCLIsNRDeviceEligibleForSchoolTime(v4, [v5 allowsNonTinkerPairing]);

  return v6;
}

- (void)createControllerForDevice:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_alloc_init(SCLSchoolModeCoordinatorConfiguration);
  [(SCLSchoolModeCoordinatorConfiguration *)v5 setNRDevice:v4];
  char v6 = [v4 pairingID];
  uint64_t v7 = [v4 valueForProperty:*MEMORY[0x263F575E8]];
  uint64_t v8 = [NSURL fileURLWithPath:v7];
  int v9 = [v8 URLByAppendingPathComponent:@"SchoolTime"];

  [(SCLSchoolModeCoordinatorConfiguration *)v5 setDirectoryURL:v9];
  [(SCLSchoolModeCoordinatorConfiguration *)v5 setSendsRemoteScheduleSettings:1];
  [(SCLSchoolModeCoordinatorConfiguration *)v5 setSendsRemoteHistoryItems:0];
  long long v10 = [v4 valueForProperty:*MEMORY[0x263F575B0]];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    v54 = v7;
    v55 = v6;
    int v12 = [MEMORY[0x263EFF980] array];
    id v13 = [(SCLSchoolModeManager *)self configuration];
    __int16 v14 = [v13 service];
    uint64_t v15 = [v14 linkedDevicesWithRelationship:2];

    if (v15) {
      [v12 addObjectsFromArray:v15];
    }
    v52 = (void *)v15;
    __int16 v16 = [(SCLSchoolModeManager *)self configuration];
    BOOL v17 = [v16 service];
    uint64_t v18 = [v17 devices];

    if (v18) {
      [v12 addObjectsFromArray:v18];
    }
    v51 = (void *)v18;
    v53 = v9;
    int v19 = [(SCLSchoolModeManager *)self configuration];
    __int16 v20 = [v19 deviceRegistry];
    int v21 = [v20 deviceForNRDevice:v4 fromIDSDevices:v12];

    id v22 = v4;
    if (!v21)
    {
      int v23 = scl_pairing_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[SCLSchoolModeManager createControllerForDevice:]();
      }

      id v22 = v4;
    }
    v49 = v22;
    v50 = v12;
    [(SCLSchoolModeCoordinatorConfiguration *)v5 setIdsDevice:v21];
    uint64_t v24 = [SCLTransportController alloc];
    v25 = [(SCLSchoolModeManager *)self configuration];
    uint64_t v26 = [v25 deviceRegistry];
    v27 = [(SCLSchoolModeManager *)self configuration];
    v28 = [v27 service];
    id v29 = [v21 uniqueIDOverride];
    v30 = [(SCLTransportController *)v24 initWithNRDevice:v22 deviceRegistry:v26 service:v28 deviceIdentifier:v29];

    [(SCLSchoolModeCoordinatorConfiguration *)v5 setTransportController:v30];
    int v9 = v53;
    objc_super v31 = [v53 URLByAppendingPathComponent:@"UnlockHistory.sqlite3"];
    v32 = [[SCLUnlockHistoryPersistentStore alloc] initWithURL:v31];
    [(SCLSchoolModeCoordinatorConfiguration *)v5 setHistoryStore:v32];

    id v4 = v49;
    uint64_t v7 = v54;
    char v6 = v55;
  }
  else
  {
    v33 = scl_pairing_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[SCLSchoolModeManager createControllerForDevice:](v33);
    }

    [(SCLSchoolModeCoordinatorConfiguration *)v5 setSendsRemoteHistoryItems:0];
    [(SCLSchoolModeCoordinatorConfiguration *)v5 setSendsRemoteScheduleSettings:0];
    [(SCLSchoolModeCoordinatorConfiguration *)v5 setManuallyManagedOnly:1];
  }
  v34 = [(SCLSchoolModeManager *)self configuration];
  int v35 = [v34 managesSchoolTimeSession];

  if (v35)
  {
    v36 = [SCLSchoolModeServer alloc];
    v37 = [(SCLSchoolModeManager *)self queue];
    v38 = [(SCLSchoolModeManager *)self supppressionManager];
    v39 = v9;
    v40 = objc_opt_new();
    v41 = [(SCLSchoolModeServer *)v36 initWithQueue:v37 suppressionManager:v38 wakeScheduler:v40];

    int v9 = v39;
    [(SCLSchoolModeCoordinatorConfiguration *)v5 setServer:v41];
    v42 = [(SCLSchoolModeManager *)self interruptBehaviorResolver];
    [(SCLSchoolModeServer *)v41 addObserver:v42];
  }
  v43 = [(SCLSchoolModeCoordinatorConfiguration *)v5 transportController];

  if (v43)
  {
    v44 = [(SCLSchoolModeManager *)self transportService];
    v45 = [(SCLSchoolModeCoordinatorConfiguration *)v5 transportController];
    [v44 addTransportController:v45];
  }
  v46 = [(SCLSchoolModeManager *)self queue];
  [(SCLSchoolModeCoordinatorConfiguration *)v5 setTargetQueue:v46];

  v47 = [[SCLSchoolModeCoordinator alloc] initWithConfiguration:v5];
  [(NSMapTable *)self->_coordinatorMap setObject:v47 forKey:v6];
  v48 = scl_pairing_log();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v6;
    _os_log_impl(&dword_22B7B4000, v48, OS_LOG_TYPE_DEFAULT, "Created pairing for pairingID %@", buf, 0xCu);
  }
}

- (void)handleDevicePairedNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke;
  v7[3] = &unk_2648AC710;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = _os_activity_create(&dword_22B7B4000, "Handle Device Paired", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v2, &v19);
  id v3 = scl_pairing_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v4;
    _os_log_impl(&dword_22B7B4000, v3, OS_LOG_TYPE_DEFAULT, "Device paired: %@", buf, 0xCu);
  }

  uint64_t v5 = a1 + 32;
  id v6 = [*(id *)(a1 + 32) userInfo];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x263F57680]];

  id v8 = [v7 pairingID];
  if (!v8)
  {
    int v12 = scl_pairing_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_1(v5, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_9;
  }
  int v9 = [*(id *)(a1 + 40) coordinatorMap];
  long long v10 = [v9 objectForKey:v8];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    int v12 = scl_pairing_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_2();
    }
LABEL_9:

    goto LABEL_13;
  }
  if ([*(id *)(a1 + 40) isEligibleDevice:v7]) {
    [*(id *)(a1 + 40) createControllerForDevice:v7];
  }
  [*(id *)(a1 + 40) _updateActivityRegistration];
LABEL_13:

  os_activity_scope_leave(&v19);
}

- (void)handleDeviceUnpairedNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke;
  v7[3] = &unk_2648AC710;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v34 = _os_activity_create(&dword_22B7B4000, "Handle Device Unpaired", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v34, &state);
  v2 = [*(id *)(a1 + 32) userInfo];
  v36 = [v2 objectForKey:*MEMORY[0x263F57680]];

  v37 = [v36 pairingID];
  if (v37)
  {
    id v3 = scl_pairing_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_msgSend(*(id *)(a1 + 32), "userInfo", v34);
      *(_DWORD *)buf = 138543618;
      v50 = v37;
      __int16 v51 = 2112;
      v52 = v4;
      _os_log_impl(&dword_22B7B4000, v3, OS_LOG_TYPE_DEFAULT, "Device unpaired: %{public}@ - %@", buf, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1 + 40) coordinatorMap];
    int v35 = [v5 objectForKey:v37];

    if (v35)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeCoordinator:");
    }
    else
    {
      uint64_t v13 = scl_pairing_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v37;
        _os_log_impl(&dword_22B7B4000, v13, OS_LOG_TYPE_DEFAULT, "No coordinator was found for pairingID %{public}@; attempting to manually remove unpaired coordinators",
          buf,
          0xCu);
      }

      uint64_t v14 = (void *)MEMORY[0x263EFF9C0];
      uint64_t v15 = [*(id *)(a1 + 40) coordinatorMap];
      uint64_t v16 = [v15 keyEnumerator];
      uint64_t v17 = [v16 allObjects];
      uint64_t v18 = [v14 setWithArray:v17];

      [*(id *)(a1 + 40) eligiblePairedDevices];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v19);
            }
            int v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            uint64_t v24 = objc_msgSend(v23, "pairingID", v34);
            if (v24)
            {
              [v18 removeObject:v24];
            }
            else
            {
              v25 = scl_pairing_log();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v23;
                _os_log_error_impl(&dword_22B7B4000, v25, OS_LOG_TYPE_ERROR, "%@ is missing a pairingID", buf, 0xCu);
              }
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v20);
      }

      if ([v18 count])
      {
        uint64_t v26 = scl_pairing_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_2();
        }

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v27 = v18;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v39 != v29) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * j);
              v32 = objc_msgSend(*(id *)(a1 + 40), "coordinatorMap", v34);
              v33 = [v32 objectForKey:v31];

              [*(id *)(a1 + 40) removeCoordinator:v33];
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v28);
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateActivityRegistration", v34);
  }
  else
  {
    id v6 = scl_pairing_log();
    int v35 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_1(a1 + 32, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)removeCoordinator:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 configuration];
  id v6 = [v5 NRDevice];
  uint64_t v7 = [v6 pairingID];

  if (v7)
  {
LABEL_2:
    uint64_t v8 = [(SCLSchoolModeManager *)self coordinatorMap];
    [v8 removeObjectForKey:v7];

    uint64_t v9 = scl_pairing_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v7;
      _os_log_impl(&dword_22B7B4000, v9, OS_LOG_TYPE_DEFAULT, "Removing coordinator for pairingID %{public}@", buf, 0xCu);
    }

    uint64_t v10 = [v4 configuration];
    uint64_t v11 = [v10 transportController];

    if (v11)
    {
      uint64_t v12 = [(SCLSchoolModeManager *)self transportService];
      [v12 removeTransportController:v11];
    }
  }
  else
  {
    uint64_t v13 = scl_pairing_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SCLSchoolModeManager removeCoordinator:](v4, v13);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v14 = [(SCLSchoolModeManager *)self coordinatorMap];
    uint64_t v15 = [v14 keyEnumerator];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
LABEL_11:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v23 + 1) + 8 * v19);
        uint64_t v21 = [(SCLSchoolModeManager *)self coordinatorMap];
        id v22 = [v21 objectForKey:v20];

        if (v22 == v4) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
          if (v17) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      uint64_t v7 = v20;

      if (v7) {
        goto LABEL_2;
      }
    }
    else
    {
LABEL_17:
    }
    uint64_t v7 = scl_pairing_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(SCLSchoolModeManager *)(uint64_t)v4 removeCoordinator:v7];
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [(SCLSchoolModeManager *)self queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SCLSchoolModeManager *)self queue];
  [v5 _setQueue:v7];

  uint64_t v8 = [[SCLSchoolModeClientProxy alloc] initWithConnection:v5];
  [(SCLSchoolModeClientProxy *)v8 setDelegate:self];
  uint64_t v9 = [(SCLSchoolModeManager *)self clients];
  [v9 addObject:v8];

  [v5 resume];
  return 1;
}

- (void)clientProxyDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSchoolModeManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = [v4 coordinator];
  [v7 removeClient:v4];
  id v6 = [(SCLSchoolModeManager *)self clients];
  [v6 removeObject:v4];
}

- (void)clientProxy:(id)a3 didConnectWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SCLSchoolModeManager *)self queue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    uint64_t v9 = [(SCLSchoolModeManager *)self coordinatorMap];
    uint64_t v10 = [v9 objectForKey:v7];

    if (!v10)
    {
      uint64_t v11 = SCLAutoUpdatingPairingID();
      int v12 = [v7 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
      uint64_t v13 = [(SCLSchoolModeManager *)self coordinatorMap];
      uint64_t v14 = [v13 objectEnumerator];
      uint64_t v10 = [v14 nextObject];

      uint64_t v15 = [(SCLSchoolModeManager *)self coordinatorMap];
      unint64_t v16 = [v15 count];

      if (v16 >= 2)
      {
        uint64_t v17 = scl_pairing_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SCLSchoolModeManager clientProxy:didConnectWithPairingID:](v10, v17);
        }
      }
      if (!v10)
      {
LABEL_9:
        uint64_t v18 = scl_pairing_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SCLSchoolModeManager clientProxy:didConnectWithPairingID:]();
        }

        uint64_t v10 = 0;
      }
    }
    [v10 addClient:v6];
  }
  else
  {
    uint64_t v10 = scl_framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCLSchoolModeManager clientProxy:didConnectWithPairingID:](v10, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

- (id)activityCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82A0], 1);
  int64_t v3 = *MEMORY[0x263EF81E8];
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81A0], *MEMORY[0x263EF81E8]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81C0], v3);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  return v2;
}

- (void)_updateActivityRegistration
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v3 = [(SCLSchoolModeManager *)self coordinatorMap];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [(SCLSchoolModeManager *)self coordinatorMap];
    id v6 = [v5 objectEnumerator];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) configuration];
          char v12 = [v11 isManuallyManagedOnly];

          v9 &= v12 ^ 1;
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v7);

      if ((v9 & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v14 = [(SCLSchoolModeManager *)self activityCriteria];
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__SCLSchoolModeManager__updateActivityRegistration__block_invoke;
    v16[3] = &unk_2648ACBF0;
    id v15 = v14;
    id v17 = v15;
    objc_copyWeak(&v18, (id *)buf);
    xpc_activity_register("com.apple.schooltime.database.maintenance", (xpc_object_t)*MEMORY[0x263EF8188], v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
    return;
  }
LABEL_10:
  uint64_t v13 = scl_persistence_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "com.apple.schooltime.database.maintenance";
    _os_log_impl(&dword_22B7B4000, v13, OS_LOG_TYPE_DEFAULT, "No tinker-paired devices available. Unregistering %s", buf, 0xCu);
  }

  xpc_activity_unregister("com.apple.schooltime.database.maintenance");
}

void __51__SCLSchoolModeManager__updateActivityRegistration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _handleActivityStarted:v3];
  }
  else
  {
    id v5 = scl_persistence_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v3;
      _os_log_impl(&dword_22B7B4000, v5, OS_LOG_TYPE_DEFAULT, "Checked in with activity %@", (uint8_t *)&v9, 0xCu);
    }

    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    uint64_t v7 = scl_persistence_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_22B7B4000, v7, OS_LOG_TYPE_DEFAULT, "using old criteria", (uint8_t *)&v9, 2u);
      }
    }
    else
    {
      if (v8)
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_22B7B4000, v7, OS_LOG_TYPE_DEFAULT, "Old criteria doesn't exist - setting new criteria", (uint8_t *)&v9, 2u);
      }

      xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));
    }
  }
}

- (void)_handleActivityStarted:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = (_xpc_activity_s *)a3;
  id v5 = _os_activity_create(&dword_22B7B4000, "Database Maintenance", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  xpc_object_t v6 = scl_persistence_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v4;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "Performing database maintenance: %@", buf, 0xCu);
  }

  if (!xpc_activity_set_state(v4, 4))
  {
    uint64_t v7 = scl_persistence_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCLSchoolModeManager _handleActivityStarted:](v7);
    }
  }
  BOOL v8 = [(SCLSchoolModeManager *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__SCLSchoolModeManager__handleActivityStarted___block_invoke;
  v10[3] = &unk_2648AC710;
  v10[4] = self;
  uint64_t v11 = v4;
  int v9 = v4;
  dispatch_async(v8, v10);

  os_activity_scope_leave(&state);
}

void __47__SCLSchoolModeManager__handleActivityStarted___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  xpc_object_t v2 = [*(id *)(a1 + 32) coordinatorMap];
  int64_t v3 = [v2 objectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v7++) purgeOldHistoryItems];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  BOOL v8 = scl_persistence_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_22B7B4000, v8, OS_LOG_TYPE_DEFAULT, "Completed database maintenance", v10, 2u);
  }

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    int v9 = scl_persistence_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __47__SCLSchoolModeManager__handleActivityStarted___block_invoke_cold_1(v9);
    }
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (SCLSchoolModeManagerConfiguration)configuration
{
  return self->_configuration;
}

- (SCLTransportService)transportService
{
  return self->_transportService;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (SCLSuppressSchoolModeAssertionManager)supppressionManager
{
  return self->_supppressionManager;
}

- (SCLInterruptBehaviorResolver)interruptBehaviorResolver
{
  return self->_interruptBehaviorResolver;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)coordinatorMap
{
  return self->_coordinatorMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interruptBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_supppressionManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_transportService, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)createControllerForDevice:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_22B7B4000, v0, OS_LOG_TYPE_FAULT, "No linked IDS device for NRDevice with pairingID %@", v1, 0xCu);
}

- (void)createControllerForDevice:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22B7B4000, log, OS_LOG_TYPE_DEBUG, "Device is not tinker-paired. Allowing manual SchoolTime", v1, 2u);
}

void __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__SCLSchoolModeManager_handleDevicePairedNotification___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Got pairing notification for pairingID %{public}@ but we already have an SCLDPairing", v2, v3, v4, v5, v6);
}

void __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__SCLSchoolModeManager_handleDeviceUnpairedNotification___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Coordinators have no valid pairingID, but were not the unpaired devices: %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeCoordinator:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a2 coordinatorMap];
  OUTLINED_FUNCTION_1_2();
  _os_log_fault_impl(&dword_22B7B4000, a3, OS_LOG_TYPE_FAULT, "Coordinator %@ is not in the coordinator map: %@", v5, 0x16u);
}

- (void)removeCoordinator:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 configuration];
  uint64_t v4 = [v3 NRDevice];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "%@ is missing a pairingID - %@", v5, 0x16u);
}

- (void)clientProxy:(uint64_t)a3 didConnectWithPairingID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clientProxy:didConnectWithPairingID:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "No coordinator for pairingID %@. Pending client until pairing.", v2, v3, v4, v5, v6);
}

- (void)clientProxy:(void *)a1 didConnectWithPairingID:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 configuration];
  uint64_t v4 = [v3 NRDevice];
  uint64_t v5 = [v4 pairingID];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "AutoUpdatingPairingID used when multiple pairings are present. Linking to %@", v6, 0xCu);
}

- (void)_handleActivityStarted:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Failed to move activity to CONTINUE state", v1, 2u);
}

void __47__SCLSchoolModeManager__handleActivityStarted___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Failed to move activity to DONE state", v1, 2u);
}

@end