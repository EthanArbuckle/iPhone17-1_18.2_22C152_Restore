@interface MOOnboardingAndSettingsManager
+ (id)_getKeyNameForSetting:(unint64_t)a3;
+ (id)sharedInstance;
- (BOOL)getStateForSetting:(unint64_t)a3;
- (BOOL)isApplicationUsingDataAccess:(id)a3;
- (BOOL)isClientUsingDataAccess:(id)a3;
- (MOConnection)connectionProxy;
- (MODefaultsManager)defaultManager;
- (MOOnboardingAndSettingsManager)init;
- (MOOnboardingAndSettingsXPCProtocol)proxy;
- (MOOnboardingManagerDelegate)onboardingManagerDelegate;
- (MOSettingsManagerDelegate)settingsManagerDelegate;
- (unint64_t)getOnboardingFlowCompletionStatus;
- (unint64_t)getOnboardingFlowRefreshCompletionStatus;
- (void)_getOnboardingFlowCompletionStatusWithHandler:(id)a3;
- (void)_getOnboardingFlowRefreshCompletionStatusWithHandler:(id)a3;
- (void)_getStateForSetting:(unint64_t)a3 withHandler:(id)a4;
- (void)_getStateForSettingFast:(unint64_t)a3 withHandler:(id)a4;
- (void)_updateOnboardingCacheAndNotifyForKey:(id)a3 andState:(unint64_t)a4 isComplete:(BOOL)a5;
- (void)_updateSettingCacheAndNotifyForKey:(id)a3 andState:(BOOL)a4 setting:(unint64_t)a5;
- (void)dealloc;
- (void)getApplicationsWithDataAccess:(id)a3;
- (void)getClientsWithDataAccess:(id)a3;
- (void)getDiagnosticReporterConfiguration:(id)a3;
- (void)getOnboardingFlowCompletionStatus;
- (void)getOnboardingFlowRefreshCompletionStatus;
- (void)onEventStreamsUpdated;
- (void)refreshCache;
- (void)registerApplicationsForDataAccess:(id)a3;
- (void)registerClientsForDataAccess:(id)a3;
- (void)setConnectionProxy:(id)a3;
- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3;
- (void)setOnboardingManagerDelegate:(id)a3;
- (void)setSettingsManagerDelegate:(id)a3;
- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4;
- (void)waitForRefresh;
@end

@implementation MOOnboardingAndSettingsManager

- (MOOnboardingAndSettingsManager)init
{
  v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_DEFAULT, "new MOOnboardingAndSettingsManager", buf, 2u);
  }

  v37.receiver = self;
  v37.super_class = (Class)MOOnboardingAndSettingsManager;
  v4 = [(MOOnboardingAndSettingsManager *)&v37 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("MOOnboardingAndSettingsManager", v5);
    queue = v4->queue;
    v4->queue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("MOOnboardingAndSettingsManagerProxy", v8);
    proxyQueue = v4->proxyQueue;
    v4->proxyQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MOOnboardingAndSettingsManagerCache", v11);
    cacheQueue = v4->cacheQueue;
    v4->cacheQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MOOnboardingAndSettingsManagerClient", v14);
    clientQueue = v4->clientQueue;
    v4->clientQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_opt_new();
    stateCache = v4->stateCache;
    v4->stateCache = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    proxyLock = v4->proxyLock;
    v4->proxyLock = (NSLock *)v19;

    uint64_t v21 = objc_opt_new();
    settingsManagerDelegate = v4->_settingsManagerDelegate;
    v4->_settingsManagerDelegate = (MOSettingsManagerDelegate *)v21;

    uint64_t v23 = objc_opt_new();
    onboardingManagerDelegate = v4->_onboardingManagerDelegate;
    v4->_onboardingManagerDelegate = (MOOnboardingManagerDelegate *)v23;

    v25 = [[MODefaultsManager alloc] initWithSuiteName:@"com.apple.momentsd"];
    defaultManager = v4->_defaultManager;
    v4->_defaultManager = v25;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)onEventStreamsUpdated_bounce, @"com.apple.momentsd.event-streams-updated", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v28 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v28, v4, (CFNotificationCallback)onEventStreamsUpdated_bounce, @"com.apple.momentsd.onboarding-status-updated", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v29 = [[MOConnection alloc] initWithName:@"MOOnboardingAndSettingsManager"];
    [(MOOnboardingAndSettingsManager *)v4 setConnectionProxy:v29];

    v30 = [(MOOnboardingAndSettingsManager *)v4 connectionProxy];
    uint64_t v31 = [v30 onConnectionInterrupted];
    id interruptHandler = v4->interruptHandler;
    v4->id interruptHandler = (id)v31;

    v33 = +[MODiagnosticReporter defaultReporter];
    [v33 configureWithOnboardingAndSettingsManager:v4];

    v34 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_256D32000, v34, OS_LOG_TYPE_DEFAULT, "initiate client", buf, 2u);
    }

    [(MOOnboardingAndSettingsManager *)v4 refreshCache];
    v35 = v4;
  }

  return v4;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MOOnboardingAndSettingsManager;
  [(MOOnboardingAndSettingsManager *)&v3 dealloc];
}

- (MOOnboardingAndSettingsXPCProtocol)proxy
{
  [(NSLock *)self->proxyLock lock];
  if (!self->_proxyIvar)
  {
    objc_super v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_DEFAULT, "Preparing new proxy", (uint8_t *)buf, 2u);
    }

    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27065B020];
    v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v4 setClasses:v5 forSelector:sel_getOnboardingFlowCompletionStatusWithHandler_ argumentIndex:0 ofReply:1];

    dispatch_queue_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v4 setClasses:v6 forSelector:sel_setOnboardingFlowCompletionStatus_ argumentIndex:0 ofReply:0];

    v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v4 setClasses:v7 forSelector:sel_getStateForSetting_withHandler_ argumentIndex:0 ofReply:1];

    v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_getStateForSettingFast_withHandler_ argumentIndex:0 ofReply:1];

    dispatch_queue_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v4 setClasses:v9 forSelector:sel_setState_forSetting_ argumentIndex:0 ofReply:0];

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    dispatch_queue_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    [v4 setClasses:v12 forSelector:sel_getDiagnosticReporterConfiguration_ argumentIndex:0 ofReply:0];

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    [v4 setClasses:v16 forSelector:sel_getApplicationsWithDataAccess_ argumentIndex:0 ofReply:0];

    uint64_t v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    [v4 setClasses:v19 forSelector:sel_registerApplicationsForDataAccess_ argumentIndex:0 ofReply:0];

    v20 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.momentsd" options:0];
    [v20 setRemoteObjectInterface:v4];
    objc_initWeak(buf, self);
    objc_initWeak(&location, v20);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __39__MOOnboardingAndSettingsManager_proxy__block_invoke;
    v27[3] = &unk_265424A98;
    objc_copyWeak(&v28, buf);
    objc_copyWeak(&v29, &location);
    [v20 setInterruptionHandler:v27];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __39__MOOnboardingAndSettingsManager_proxy__block_invoke_133;
    v25[3] = &unk_265424AC0;
    objc_copyWeak(&v26, buf);
    [v20 setInvalidationHandler:v25];
    uint64_t v21 = [v20 remoteObjectProxyWithErrorHandler:&__block_literal_global];
    proxyIvar = self->_proxyIvar;
    self->_proxyIvar = v21;

    objc_storeStrong((id *)&self->connection, v20);
    [(NSXPCConnection *)self->connection resume];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    objc_destroyWeak(buf);
  }
  [(NSLock *)self->proxyLock unlock];
  uint64_t v23 = self->_proxyIvar;
  return v23;
}

void __39__MOOnboardingAndSettingsManager_proxy__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[7] lock];
  id v3 = WeakRetained[9];
  WeakRetained[9] = 0;

  [WeakRetained[7] unlock];
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 invalidate];

  v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_256D32000, v5, OS_LOG_TYPE_DEFAULT, "Connection Interrupted", (uint8_t *)v6, 2u);
  }

  (*((void (**)(void))WeakRetained[8] + 2))();
}

void __39__MOOnboardingAndSettingsManager_proxy__block_invoke_133(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[7] lock];
  id v2 = WeakRetained[9];
  WeakRetained[9] = 0;

  [WeakRetained[7] unlock];
  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 0;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_DEFAULT, "Connection Invalidated", (uint8_t *)v4, 2u);
  }
}

void __39__MOOnboardingAndSettingsManager_proxy__block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 localizedDescription];
    v5 = [v2 localizedFailureReason];
    int v6 = 138412802;
    v7 = @"Error on remote object proxy";
    __int16 v8 = 2112;
    dispatch_queue_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__MOOnboardingAndSettingsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  id v2 = (void *)sharedInstance_shared;
  return v2;
}

uint64_t __48__MOOnboardingAndSettingsManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_shared = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)onEventStreamsUpdated
{
  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_DEFAULT, "onEventStreamsUpdated", v4, 2u);
  }

  [(MOOnboardingAndSettingsManager *)self refreshCache];
}

- (void)waitForRefresh
{
}

- (void)_updateOnboardingCacheAndNotifyForKey:(id)a3 andState:(unint64_t)a4 isComplete:(BOOL)a5
{
  id v8 = a3;
  dispatch_queue_t v9 = [(NSMutableDictionary *)self->stateCache objectForKeyedSubscript:v8];
  if (self->_onboardingManagerDelegate)
  {
    __int16 v10 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v11 = v10;
    if (v9)
    {
      char v12 = [v10 isEqualToNumber:v9];

      v13 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)self->stateCache setObject:v13 forKeyedSubscript:v8];

      if (v12) {
        goto LABEL_8;
      }
    }
    else
    {
      [(NSMutableDictionary *)self->stateCache setObject:v10 forKeyedSubscript:v8];
    }
    clientQueue = self->clientQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__MOOnboardingAndSettingsManager__updateOnboardingCacheAndNotifyForKey_andState_isComplete___block_invoke;
    block[3] = &unk_265424B48;
    block[4] = self;
    void block[5] = a4;
    BOOL v17 = a5;
    dispatch_async(clientQueue, block);
  }
  else
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)self->stateCache setObject:v14 forKeyedSubscript:v8];
  }
LABEL_8:
}

uint64_t __92__MOOnboardingAndSettingsManager__updateOnboardingCacheAndNotifyForKey_andState_isComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) onOnboardingFlowCompletionChange:*(void *)(a1 + 40) isComplete:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_updateSettingCacheAndNotifyForKey:(id)a3 andState:(BOOL)a4 setting:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  dispatch_queue_t v9 = [(NSMutableDictionary *)self->stateCache objectForKeyedSubscript:v8];
  if (self->_settingsManagerDelegate)
  {
    __int16 v10 = [NSNumber numberWithBool:v6];
    uint64_t v11 = v10;
    if (v9)
    {
      char v12 = [v10 isEqualToNumber:v9];

      v13 = [NSNumber numberWithBool:v6];
      [(NSMutableDictionary *)self->stateCache setObject:v13 forKeyedSubscript:v8];

      if (v12) {
        goto LABEL_8;
      }
    }
    else
    {
      [(NSMutableDictionary *)self->stateCache setObject:v10 forKeyedSubscript:v8];
    }
    clientQueue = self->clientQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__MOOnboardingAndSettingsManager__updateSettingCacheAndNotifyForKey_andState_setting___block_invoke;
    block[3] = &unk_265424B48;
    BOOL v17 = v6;
    block[4] = self;
    void block[5] = a5;
    dispatch_async(clientQueue, block);
  }
  else
  {
    uint64_t v14 = [NSNumber numberWithBool:v6];
    [(NSMutableDictionary *)self->stateCache setObject:v14 forKeyedSubscript:v8];
  }
LABEL_8:
}

uint64_t __86__MOOnboardingAndSettingsManager__updateSettingCacheAndNotifyForKey_andState_setting___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) onStateChange:*(unsigned __int8 *)(a1 + 48) forSetting:*(void *)(a1 + 40)];
}

- (void)refreshCache
{
  queue = self->queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke;
  block[3] = &unk_265424C38;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke(uint64_t a1)
{
  uint64_t v151 = *MEMORY[0x263EF8340];
  v148[0] = 0;
  v148[1] = v148;
  v148[2] = 0x2020000000;
  v148[3] = 4;
  v147[0] = 0;
  v147[1] = v147;
  v147[2] = 0x2020000000;
  v147[3] = 4;
  v145[0] = 0;
  v145[1] = v145;
  v145[2] = 0x2020000000;
  char v146 = 0;
  v143[0] = 0;
  v143[1] = v143;
  v143[2] = 0x2020000000;
  char v144 = 0;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x2020000000;
  char v142 = 0;
  v139[0] = 0;
  v139[1] = v139;
  v139[2] = 0x2020000000;
  char v140 = 0;
  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x2020000000;
  char v138 = 0;
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  char v136 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  char v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  char v132 = 0;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x2020000000;
  char v130 = 0;
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x2020000000;
  char v128 = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x2020000000;
  char v126 = 0;
  v123[0] = 0;
  v123[1] = v123;
  v123[2] = 0x2020000000;
  char v124 = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x3032000000;
  v121[3] = __Block_byref_object_copy_;
  v121[4] = __Block_byref_object_dispose_;
  id v122 = 0;
  v119[0] = 0;
  v119[1] = v119;
  v119[2] = 0x3032000000;
  v119[3] = __Block_byref_object_copy_;
  uint64_t v117 = 0x2020000000;
  v119[4] = __Block_byref_object_dispose_;
  id v120 = 0;
  uint64_t v115 = 0;
  v116 = &v115;
  char v118 = 1;
  unsigned int v2 = 2;
  do
  {
    id v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v150 = v2;
      _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing cache (%d)", buf, 8u);
    }

    *((unsigned char *)v116 + 24) = 1;
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v5 = *(void **)(a1 + 32);
    v111[0] = MEMORY[0x263EF8330];
    v111[1] = 3221225472;
    v111[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_142;
    v111[3] = &unk_265424B70;
    v113 = v148;
    v114 = &v115;
    BOOL v6 = v4;
    v112 = v6;
    [v5 _getOnboardingFlowCompletionStatusWithHandler:v111];
    dispatch_group_enter(v6);
    v7 = *(void **)(a1 + 32);
    v107[0] = MEMORY[0x263EF8330];
    v107[1] = 3221225472;
    v107[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_2;
    v107[3] = &unk_265424B70;
    v109 = v147;
    v110 = &v115;
    id v8 = v6;
    v108 = v8;
    [v7 _getOnboardingFlowRefreshCompletionStatusWithHandler:v107];
    dispatch_group_enter(v8);
    dispatch_queue_t v9 = *(void **)(a1 + 32);
    v103[0] = MEMORY[0x263EF8330];
    v103[1] = 3221225472;
    v103[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_3;
    v103[3] = &unk_265424B98;
    v105 = v145;
    v106 = &v115;
    __int16 v10 = v8;
    v104 = v10;
    [v9 _getStateForSetting:0 withHandler:v103];
    dispatch_group_enter(v10);
    uint64_t v11 = *(void **)(a1 + 32);
    v99[0] = MEMORY[0x263EF8330];
    v99[1] = 3221225472;
    v99[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_4;
    v99[3] = &unk_265424B98;
    v101 = v143;
    v102 = &v115;
    char v12 = v10;
    v100 = v12;
    [v11 _getStateForSetting:1 withHandler:v99];
    dispatch_group_enter(v12);
    v13 = *(void **)(a1 + 32);
    v95[0] = MEMORY[0x263EF8330];
    v95[1] = 3221225472;
    v95[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_5;
    v95[3] = &unk_265424B98;
    v97 = v141;
    v98 = &v115;
    uint64_t v14 = v12;
    v96 = v14;
    [v13 _getStateForSetting:2 withHandler:v95];
    dispatch_group_enter(v14);
    uint64_t v15 = *(void **)(a1 + 32);
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_6;
    v92[3] = &unk_265424BC0;
    v94 = v139;
    v16 = v14;
    v93 = v16;
    [v15 _getStateForSetting:3 withHandler:v92];
    dispatch_group_enter(v16);
    BOOL v17 = *(void **)(a1 + 32);
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_7;
    v88[3] = &unk_265424B98;
    v90 = v137;
    v91 = &v115;
    uint64_t v18 = v16;
    v89 = v18;
    [v17 _getStateForSetting:4 withHandler:v88];
    dispatch_group_enter(v18);
    uint64_t v19 = *(void **)(a1 + 32);
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_8;
    v84[3] = &unk_265424B98;
    v86 = v135;
    v87 = &v115;
    v20 = v18;
    v85 = v20;
    [v19 _getStateForSettingFast:5 withHandler:v84];
    dispatch_group_enter(v20);
    uint64_t v21 = *(void **)(a1 + 32);
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_9;
    v80[3] = &unk_265424B98;
    v82 = v133;
    v83 = &v115;
    v22 = v20;
    v81 = v22;
    [v21 _getStateForSettingFast:11 withHandler:v80];
    dispatch_group_enter(v22);
    uint64_t v23 = *(void **)(a1 + 32);
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_10;
    v76[3] = &unk_265424B98;
    v78 = v131;
    v79 = &v115;
    v24 = v22;
    v77 = v24;
    [v23 _getStateForSetting:6 withHandler:v76];
    dispatch_group_enter(v24);
    v25 = *(void **)(a1 + 32);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_11;
    v72[3] = &unk_265424B98;
    v74 = v125;
    v75 = &v115;
    id v26 = v24;
    v73 = v26;
    [v25 _getStateForSetting:7 withHandler:v72];
    dispatch_group_enter(v26);
    v27 = *(void **)(a1 + 32);
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_12;
    v68[3] = &unk_265424B98;
    v70 = v123;
    v71 = &v115;
    id v28 = v26;
    v69 = v28;
    [v27 _getStateForSetting:8 withHandler:v68];
    dispatch_group_enter(v28);
    id v29 = *(void **)(a1 + 32);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_13;
    v64[3] = &unk_265424B98;
    v66 = v129;
    v67 = &v115;
    v30 = v28;
    v65 = v30;
    [v29 _getStateForSetting:9 withHandler:v64];
    dispatch_group_enter(v30);
    uint64_t v31 = *(void **)(a1 + 32);
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_14;
    v60[3] = &unk_265424B98;
    v62 = v127;
    v63 = &v115;
    v32 = v30;
    v61 = v32;
    [v31 _getStateForSetting:10 withHandler:v60];
    dispatch_group_enter(v32);
    v33 = *(void **)(a1 + 32);
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_15;
    v56[3] = &unk_265424BE8;
    v58 = v121;
    v59 = &v115;
    v34 = v32;
    v57 = v34;
    [v33 getApplicationsWithDataAccess:v56];
    dispatch_group_enter(v34);
    v35 = *(void **)(a1 + 32);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_16;
    v52[3] = &unk_265424BE8;
    v54 = v119;
    v55 = &v115;
    v36 = v34;
    v53 = v36;
    [v35 getClientsWithDataAccess:v52];
    dispatch_time_t v37 = dispatch_time(0, 60000000000);
    intptr_t v38 = dispatch_group_wait(v36, v37);
    if (v38) {
      BOOL v39 = 0;
    }
    else {
      BOOL v39 = *((unsigned char *)v116 + 24) != 0;
    }
    *((unsigned char *)v116 + 24) = v39;

    if (*((unsigned char *)v116 + 24)) {
      break;
    }
  }
  while (v2-- > 1);
  if (*((unsigned char *)v116 + 24))
  {
    uint64_t v41 = *(void *)(a1 + 32);
    v42 = *(NSObject **)(v41 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_17;
    block[3] = &unk_265424C10;
    block[4] = v41;
    void block[5] = v147;
    void block[6] = v148;
    block[7] = v145;
    block[8] = v143;
    block[9] = v141;
    block[10] = v139;
    block[11] = v137;
    block[12] = v135;
    block[13] = v133;
    block[14] = v131;
    block[15] = v125;
    block[16] = v123;
    block[17] = v129;
    block[18] = v127;
    block[19] = v121;
    block[20] = v119;
    dispatch_async(v42, block);
  }
  else
  {
    if (v38)
    {
      v43 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_2(v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
    else
    {
      v43 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_1();
      }
    }
  }
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(v119, 8);

  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v123, 8);
  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v127, 8);
  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v135, 8);
  _Block_object_dispose(v137, 8);
  _Block_object_dispose(v139, 8);
  _Block_object_dispose(v141, 8);
  _Block_object_dispose(v143, 8);
  _Block_object_dispose(v145, 8);
  _Block_object_dispose(v147, 8);
  _Block_object_dispose(v148, 8);
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_142(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_3(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_4(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_5(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_6(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_7(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_8(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_9(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_10(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_11(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_12(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_13(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_14(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a3;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;
  id v12 = a3;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *(unsigned char *)(v9 + 24) == 0;
  }
  char v11 = !v10;
  *(unsigned char *)(v9 + 24) = v11;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;
  id v12 = a3;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *(unsigned char *)(v9 + 24) == 0;
  }
  char v11 = !v10;
  *(unsigned char *)(v9 + 24) = v11;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_17(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _updateOnboardingCacheAndNotifyForKey:@"MOStateOnboardingRefreshStatus" andState:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) isComplete:0];
  [*(id *)(a1 + 32) _updateOnboardingCacheAndNotifyForKey:@"MOStateOnboardingStatus" andState:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) isComplete:1];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingTopLevelSwitch" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) setting:0];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingActivity" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) setting:1];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingMedia" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) setting:2];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingCommunications" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) setting:3];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingPhotos" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) setting:4];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingSignificantLocation" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) setting:5];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"kMOStateSettingSystemSignificantLocationReadOnly" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) setting:11];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingNearbyPeople" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) setting:6];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingAlwaysPreviewItems" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) setting:7];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingDiscoverableByNearbyContacts" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) setting:8];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingStateOfMind" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) setting:9];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:@"MOStateSettingReflection" andState:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) setting:10];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) forKeyedSubscript:@"MOStateApplicationsWithDataAccess"];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 40) forKeyedSubscript:@"MOStateClientsWithDataAccess"];
  unsigned int v2 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_256D32000, v2, OS_LOG_TYPE_INFO, "Refreshed cache %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)_getKeyNameForSetting:(unint64_t)a3
{
  if (a3 > 0xB) {
    return 0;
  }
  else {
    return off_265424E60[a3];
  }
}

- (unint64_t)getOnboardingFlowCompletionStatus
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_INFO, "Client is retrieving onboarding status...", buf, 2u);
  }

  [(MOOnboardingAndSettingsManager *)self waitForRefresh];
  cacheQueue = self->cacheQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__MOOnboardingAndSettingsManager_getOnboardingFlowCompletionStatus__block_invoke;
  v17[3] = &unk_265424C60;
  v17[4] = self;
  v17[5] = &v18;
  dispatch_sync(cacheQueue, v17);
  uint64_t v5 = (void *)v19[5];
  if (v5)
  {
    unint64_t v6 = [v5 unsignedIntegerValue];
    v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [NSNumber numberWithUnsignedInteger:v6];
      *(_DWORD *)buf = 138412546;
      v25 = @"MOStateOnboardingStatus";
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "Retrieved cached state for key %@: %@", buf, 0x16u);
    }
  }
  else
  {
    v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(MOOnboardingAndSettingsManager *)v7 getOnboardingFlowCompletionStatus];
    }
    unint64_t v6 = 4;
  }

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __67__MOOnboardingAndSettingsManager_getOnboardingFlowCompletionStatus__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"MOStateOnboardingStatus"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_getOnboardingFlowCompletionStatusWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, uint64_t, uint64_t))a3;
  id v5 = [(MOOnboardingAndSettingsManager *)self defaultManager];
  unint64_t v6 = [v5 objectForKey:@"OnboardingStatus"];

  if (v6)
  {
    v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "Retrieved onboarding state from defaults: %@", buf, 0xCu);
    }

    v4[2](v4, [v6 integerValue], 1);
  }
  else
  {
    proxyQueue = self->proxyQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke;
    v9[3] = &unk_265424D00;
    v9[4] = self;
    uint64_t v10 = v4;
    dispatch_async(proxyQueue, v9);
  }
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionProxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_2;
  v6[3] = &unk_265424CB0;
  uint64_t v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_153;
  v4[3] = &unk_265424CD8;
  id v5 = *(id *)(a1 + 40);
  [v2 callBlock:v6 onInterruption:v4];
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) proxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_3;
  v6[3] = &unk_265424C88;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 getOnboardingFlowCompletionStatusWithHandler:v6];
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  int v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a2];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_256D32000, v4, OS_LOG_TYPE_INFO, "Retrieved onboarding state from daemon: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_153(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    int v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_153_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_256D32000, v5, OS_LOG_TYPE_INFO, "Setting onboarding state in cache: %@", buf, 0xCu);
  }
  cacheQueue = self->cacheQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke;
  v8[3] = &unk_265424D28;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(cacheQueue, v8);
}

void __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _updateOnboardingCacheAndNotifyForKey:@"MOStateOnboardingStatus" andState:*(void *)(a1 + 40) isComplete:1];
  uint64_t v2 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_256D32000, v2, OS_LOG_TYPE_INFO, "Passing onboarding state to daemon: %@", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke_154;
  v7[3] = &unk_265424D28;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = v4;
  v7[5] = v6;
  dispatch_async(v5, v7);
}

void __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke_154(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) proxy];
  [v2 setOnboardingFlowCompletionStatus:*(void *)(a1 + 40)];

  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_INFO, "Completed onboarding state configuration: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (unint64_t)getOnboardingFlowRefreshCompletionStatus
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_INFO, "Client is retrieving onboarding status...", buf, 2u);
  }

  [(MOOnboardingAndSettingsManager *)self waitForRefresh];
  cacheQueue = self->cacheQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__MOOnboardingAndSettingsManager_getOnboardingFlowRefreshCompletionStatus__block_invoke;
  v17[3] = &unk_265424C60;
  v17[4] = self;
  v17[5] = &v18;
  dispatch_sync(cacheQueue, v17);
  int v5 = (void *)v19[5];
  if (v5)
  {
    unint64_t v6 = [v5 unsignedIntegerValue];
    uint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
      *(_DWORD *)buf = 138412546;
      v25 = @"MOStateOnboardingRefreshStatus";
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "Retrieved cached state for key %@: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(MOOnboardingAndSettingsManager *)v7 getOnboardingFlowRefreshCompletionStatus];
    }
    unint64_t v6 = 4;
  }

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __74__MOOnboardingAndSettingsManager_getOnboardingFlowRefreshCompletionStatus__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"MOStateOnboardingRefreshStatus"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_getOnboardingFlowRefreshCompletionStatusWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t))a3;
  id v5 = [(MOOnboardingAndSettingsManager *)self defaultManager];
  unint64_t v6 = [v5 objectForKey:@"OnboardingRefreshStatus"];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "Retrieved onboarding refresh state from defaults: %@", buf, 0xCu);
    }

    v4[2](v4, [v6 integerValue], 1);
  }
  else
  {
    proxyQueue = self->proxyQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke;
    v9[3] = &unk_265424D00;
    v9[4] = self;
    uint64_t v10 = v4;
    dispatch_async(proxyQueue, v9);
  }
}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionProxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2;
  v6[3] = &unk_265424CB0;
  uint64_t v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_158;
  v4[3] = &unk_265424CD8;
  id v5 = *(id *)(a1 + 40);
  [v2 callBlock:v6 onInterruption:v4];
}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) proxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_3;
  v6[3] = &unk_265424C88;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 getOnboardingFlowRefreshCompletionStatusWithHandler:v6];
}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a2];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_256D32000, v4, OS_LOG_TYPE_INFO, "Retrieved onboarding refresh state from daemon: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_158(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_153_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)getStateForSetting:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v6 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_256D32000, v6, OS_LOG_TYPE_INFO, "Client is retrieving setting %@...", (uint8_t *)&buf, 0xCu);
  }
  if (a3 == 8)
  {
    uint64_t v8 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOOnboardingAndSettingsManager getStateForSetting:]();
    }
  }
  [(MOOnboardingAndSettingsManager *)self waitForRefresh];
  uint64_t v9 = +[MOOnboardingAndSettingsManager _getKeyNameForSetting:a3];
  if (!v9)
  {
    uint64_t v10 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MOOnboardingAndSettingsManager getStateForSetting:](a3);
    }

    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:a3];
    [v11 handleFailureInMethod:a2, self, @"MOOnboardingAndSettingsManager.m", 629, @"Unhandled setting %@ (in %s:%d)", v12, "-[MOOnboardingAndSettingsManager getStateForSetting:]", 629 object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  cacheQueue = self->cacheQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__MOOnboardingAndSettingsManager_getStateForSetting___block_invoke;
  block[3] = &unk_265424D50;
  p_long long buf = &buf;
  block[4] = self;
  id v14 = v9;
  id v22 = v14;
  dispatch_sync(cacheQueue, block);
  uint64_t v15 = *(void **)(*((void *)&buf + 1) + 40);
  if (v15)
  {
    uint64_t v16 = [v15 BOOLValue];
    BOOL v17 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [NSNumber numberWithBool:v16];
      *(_DWORD *)v24 = 138412546;
      id v25 = v14;
      __int16 v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_256D32000, v17, OS_LOG_TYPE_INFO, "Retrieved cached state for key %@: %@", v24, 0x16u);
    }
  }
  else
  {
    BOOL v17 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:a3];
      [(MOOnboardingAndSettingsManager *)v19 getStateForSetting:v17];
    }
    LOBYTE(v16) = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __53__MOOnboardingAndSettingsManager_getStateForSetting___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_getStateForSetting:(unint64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  proxyQueue = self->proxyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke;
  block[3] = &unk_265424DC8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(proxyQueue, block);
}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_2;
  v7[3] = &unk_265424DA0;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v9 = v3;
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_168;
  v5[3] = &unk_265424CD8;
  id v6 = *(id *)(a1 + 40);
  [v2 callBlock:v7 onInterruption:v5];
}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) proxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_3;
  v9[3] = &unk_265424D78;
  id v10 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v4 getStateForSetting:v5 withHandler:v9];
}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(void))(a1[4] + 16))()) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:a1[6]];
    id v6 = [NSNumber numberWithBool:a2];
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_256D32000, v4, OS_LOG_TYPE_INFO, "Retrieved setting state from daemon %@: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_168(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_153_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)_getStateForSettingFast:(unint64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  proxyQueue = self->proxyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke;
  block[3] = &unk_265424DC8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(proxyQueue, block);
}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_2;
  v7[3] = &unk_265424DA0;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v9 = v3;
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_169;
  v5[3] = &unk_265424CD8;
  id v6 = *(id *)(a1 + 40);
  [v2 callBlock:v7 onInterruption:v5];
}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) proxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_3;
  v9[3] = &unk_265424D78;
  id v10 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v4 getStateForSettingFast:v5 withHandler:v9];
}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(void))(a1[4] + 16))()) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:a1[6]];
    id v6 = [NSNumber numberWithBool:a2];
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_256D32000, v4, OS_LOG_TYPE_INFO, "(Fast) Retrieved setting state from daemon %@: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_169(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_153_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a4 == 11)
  {
    uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[MOOnboardingAndSettingsManager setState:forSetting:]();
    }
  }
  else if (a4 == 8)
  {
    uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[MOOnboardingAndSettingsManager setState:forSetting:]();
    }
  }
  else
  {
    BOOL v6 = a3;
    __int16 v9 = +[MOOnboardingAndSettingsManager _getKeyNameForSetting:a4];
    if (!v9)
    {
      id v10 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MOOnboardingAndSettingsManager setState:forSetting:](a4);
      }

      uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:a4];
      [v11 handleFailureInMethod:a2, self, @"MOOnboardingAndSettingsManager.m", 695, @"Unhandled setting %@ (in %s:%d)", v12, "-[MOOnboardingAndSettingsManager setState:forSetting:]", 695 object file lineNumber description];
    }
    uint64_t v13 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [NSNumber numberWithUnsignedInteger:a4];
      uint64_t v15 = [NSNumber numberWithBool:v6];
      *(_DWORD *)long long buf = 138412546;
      id v22 = v14;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_256D32000, v13, OS_LOG_TYPE_INFO, "Setting setting state in cache: %@: %@", buf, 0x16u);
    }
    cacheQueue = self->cacheQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke;
    block[3] = &unk_265424DF0;
    block[4] = self;
    id v18 = v9;
    BOOL v20 = v6;
    unint64_t v19 = a4;
    uint64_t v5 = v9;
    dispatch_async(cacheQueue, block);
  }
}

void __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _updateSettingCacheAndNotifyForKey:*(void *)(a1 + 40) andState:*(unsigned __int8 *)(a1 + 56) setting:*(void *)(a1 + 48)];
  uint64_t v2 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_256D32000, v2, OS_LOG_TYPE_INFO, "Passing setting state to daemon: %@: %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(NSObject **)(v5 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke_170;
  block[3] = &unk_265424B48;
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 48);
  block[4] = v5;
  void block[5] = v7;
  dispatch_async(v6, block);
}

void __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke_170(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) proxy];
  [v2 setState:*(unsigned __int8 *)(a1 + 48) forSetting:*(void *)(a1 + 40)];

  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    char v9 = v5;
    _os_log_impl(&dword_256D32000, v3, OS_LOG_TYPE_INFO, "Completed setting state configuration: %@: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)getDiagnosticReporterConfiguration:(id)a3
{
  id v4 = a3;
  proxyQueue = self->proxyQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke;
  v7[3] = &unk_265424D00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(proxyQueue, v7);
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionProxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_2;
  v6[3] = &unk_265424CB0;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_171;
  v4[3] = &unk_265424CD8;
  id v5 = *(id *)(a1 + 40);
  [v2 callBlock:v6 onInterruption:v4];
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) proxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3;
  v6[3] = &unk_265424E18;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 getDiagnosticReporterConfiguration:v6];
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "getDiagnosticReporterConfiguration, count, %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3_cold_1();
    }
  }
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_171(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_171_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, MEMORY[0x263EFFA78], v3);
  }
}

- (BOOL)isApplicationUsingDataAccess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_256D32000, v5, OS_LOG_TYPE_INFO, "Client is checking data access usage...", buf, 2u);
  }

  [(MOOnboardingAndSettingsManager *)self waitForRefresh];
  *(void *)long long buf = 0;
  uint64_t v14 = buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  cacheQueue = self->cacheQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MOOnboardingAndSettingsManager_isApplicationUsingDataAccess___block_invoke;
  block[3] = &unk_265424E40;
  id v11 = v4;
  __int16 v12 = buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(cacheQueue, block);
  uint8_t v8 = v14[24];

  _Block_object_dispose(buf, 8);
  return v8;
}

void __63__MOOnboardingAndSettingsManager_isApplicationUsingDataAccess___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + 16) objectForKey:@"MOStateApplicationsWithDataAccess"];
  uint64_t v2 = [v3 objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
}

- (void)getApplicationsWithDataAccess:(id)a3
{
  id v4 = a3;
  proxyQueue = self->proxyQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke;
  v7[3] = &unk_265424D00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(proxyQueue, v7);
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionProxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_2;
  v6[3] = &unk_265424CB0;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_172;
  v4[3] = &unk_265424CD8;
  id v5 = *(id *)(a1 + 40);
  [v2 callBlock:v6 onInterruption:v4];
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) proxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3;
  v6[3] = &unk_265424E18;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 getApplicationsWithDataAccess:v6];
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "getApplicationsWithDataAccess, count, %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3_cold_1();
    }
  }
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_172(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_172_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)registerApplicationsForDataAccess:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_256D32000, v5, OS_LOG_TYPE_INFO, "Registering application for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(MOOnboardingAndSettingsManager *)self proxy];
  [v6 registerApplicationsForDataAccess:v4];

  id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "Done registering application for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  [(MOOnboardingAndSettingsManager *)self refreshCache];
}

- (BOOL)isClientUsingDataAccess:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_256D32000, v5, OS_LOG_TYPE_INFO, "Client is checking data access usage...", buf, 2u);
  }

  [(MOOnboardingAndSettingsManager *)self waitForRefresh];
  *(void *)long long buf = 0;
  uint64_t v14 = buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  cacheQueue = self->cacheQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__MOOnboardingAndSettingsManager_isClientUsingDataAccess___block_invoke;
  block[3] = &unk_265424E40;
  id v11 = v4;
  __int16 v12 = buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(cacheQueue, block);
  uint8_t v8 = v14[24];

  _Block_object_dispose(buf, 8);
  return v8;
}

void __58__MOOnboardingAndSettingsManager_isClientUsingDataAccess___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + 16) objectForKey:@"MOStateClientsWithDataAccess"];
  uint64_t v2 = [v3 objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
}

- (void)getClientsWithDataAccess:(id)a3
{
  id v4 = a3;
  proxyQueue = self->proxyQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke;
  v7[3] = &unk_265424D00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(proxyQueue, v7);
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionProxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_2;
  v6[3] = &unk_265424CB0;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_173;
  v4[3] = &unk_265424CD8;
  id v5 = *(id *)(a1 + 40);
  [v2 callBlock:v6 onInterruption:v4];
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) proxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3;
  v6[3] = &unk_265424E18;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 getClientsWithDataAccess:v6];
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "getClientsWithDataAccess, count, %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3_cold_1();
    }
  }
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_173(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_173_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)registerClientsForDataAccess:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_256D32000, v5, OS_LOG_TYPE_INFO, "Registering client for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(MOOnboardingAndSettingsManager *)self proxy];
  [v6 registerClientsForDataAccess:v4];

  id v7 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_256D32000, v7, OS_LOG_TYPE_INFO, "Done registering client for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  [(MOOnboardingAndSettingsManager *)self refreshCache];
}

- (MOSettingsManagerDelegate)settingsManagerDelegate
{
  return self->_settingsManagerDelegate;
}

- (void)setSettingsManagerDelegate:(id)a3
{
}

- (MOOnboardingManagerDelegate)onboardingManagerDelegate
{
  return self->_onboardingManagerDelegate;
}

- (void)setOnboardingManagerDelegate:(id)a3
{
}

- (MODefaultsManager)defaultManager
{
  return self->_defaultManager;
}

- (MOConnection)connectionProxy
{
  return self->_connectionProxy;
}

- (void)setConnectionProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxy, 0);
  objc_storeStrong((id *)&self->_defaultManager, 0);
  objc_storeStrong((id *)&self->_onboardingManagerDelegate, 0);
  objc_storeStrong((id *)&self->_settingsManagerDelegate, 0);
  objc_storeStrong((id *)&self->_proxyIvar, 0);
  objc_storeStrong(&self->interruptHandler, 0);
  objc_storeStrong((id *)&self->proxyLock, 0);
  objc_storeStrong((id *)&self->clientQueue, 0);
  objc_storeStrong((id *)&self->cacheQueue, 0);
  objc_storeStrong((id *)&self->proxyQueue, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->stateCache, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_256D32000, v0, v1, "Failed up refresh cache", v2, v3, v4, v5, v6);
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getOnboardingFlowCompletionStatus
{
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_153_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_256D32000, v0, v1, "Remote process returned error: %@", v2, v3, v4, v5, v6);
}

- (void)getOnboardingFlowRefreshCompletionStatus
{
}

- (void)getStateForSetting:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_256D32000, log, OS_LOG_TYPE_FAULT, "Missing cached state for key %@", buf, 0xCu);
}

- (void)getStateForSetting:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_256D32000, v2, v3, "Unhandled setting %@ (in %s:%d)", v4, v5, v6, v7, 2u);
}

- (void)getStateForSetting:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_256D32000, v0, v1, "MOSettingDiscoverableByNearbyContacts is a disabled setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
}

- (void)setState:(uint64_t)a1 forSetting:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_256D32000, v2, v3, "Unhandled setting %@ (in %s:%d)", v4, v5, v6, v7, 2u);
}

- (void)setState:forSetting:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_256D32000, v0, v1, "MOSettingDiscoverableByNearbyContacts is a disabled setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
}

- (void)setState:forSetting:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_256D32000, v0, v1, "MOSettingSystemSignificantLocationReadOnly is a read only setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_256D32000, v0, v1, "getDiagnosticReporterConfiguration, result suppressed by interuption", v2, v3, v4, v5, v6);
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_171_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_256D32000, v0, v1, "getDiagnosticReporterConfiguration, remote process returned error: %@", v2, v3, v4, v5, v6);
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_256D32000, v0, v1, "getApplicationsWithDataAccess, result suppressed by interuption", v2, v3, v4, v5, v6);
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_172_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_256D32000, v0, v1, "getApplicationsWithDataAccess, remote process returned error: %@", v2, v3, v4, v5, v6);
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_256D32000, v0, v1, "getClientsWithDataAccess, result suppressed by interuption", v2, v3, v4, v5, v6);
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_173_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_256D32000, v0, v1, "getClientsWithDataAccess, remote process returned error: %@", v2, v3, v4, v5, v6);
}

@end