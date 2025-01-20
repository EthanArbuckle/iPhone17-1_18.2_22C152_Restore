@interface SUCoreConfigServer
+ (id)_generateStateTable;
+ (id)allowedServerKeys;
+ (id)allowedServerProjects;
+ (id)persistedStateFilePath;
+ (id)sharedServerSettings;
+ (void)persistedStateFilePath;
- (MAAsset)lastLocatedAsset;
- (NSDate)lastScanTime;
- (NSDate)nextScanTime;
- (NSMutableDictionary)listenerDelegates;
- (NSString)uuidString;
- (NSTimer)timer;
- (OS_dispatch_queue)clientDelegateQueue;
- (SUCoreConfig)coreConfig;
- (SUCoreConfigServer)init;
- (SUCoreFSM)stateMachine;
- (SUCorePersistedState)persistedState;
- (id)_nextScanTimeFromDate:(id)a3;
- (id)_stateSafeDetermineNextScanTime;
- (id)_stateSafeDownloadOptions;
- (id)_stateSafeLoadUUIDString;
- (id)_stateSafeSelectBestAssetFromArray:(id)a3 error:(id *)a4;
- (id)_stateSafeSelectBestAssetFromMultipleAssetArray:(id)a3 bestAsset:(id *)a4 selectionReason:(id *)a5;
- (id)scheduledActivityName;
- (int64_t)actionConfigAdjustSettings:(id)a3 error:(id *)a4;
- (int64_t)actionConfigDownloadAsset:(id)a3 error:(id *)a4;
- (int64_t)actionConfigDownloadCatalog:(id)a3 error:(id *)a4;
- (int64_t)actionConfigQueryAsset:(id)a3 error:(id *)a4;
- (int64_t)actionConfigScheduleScan:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (void)_stateSafeInformDelegatesOfConfiguration:(id)a3 error:(id)a4;
- (void)_stateSafeResetState;
- (void)_stateSafeSendInstalledEventWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_stateSafeSendNewEvent:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_stateSafeSendScheduledEventWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_stateSafeUpdateState;
- (void)dealloc;
- (void)installServerSettings;
- (void)listenForConfigChanges:(id)a3 withName:(id)a4;
- (void)setClientDelegateQueue:(id)a3;
- (void)setCoreConfig:(id)a3;
- (void)setLastLocatedAsset:(id)a3;
- (void)setLastScanTime:(id)a3;
- (void)setListenerDelegates:(id)a3;
- (void)setNextScanTime:(id)a3;
- (void)setPersistedState:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation SUCoreConfigServer

+ (id)sharedServerSettings
{
  if (sharedServerSettings_onceInit != -1) {
    dispatch_once(&sharedServerSettings_onceInit, &__block_literal_global_11);
  }
  v2 = (void *)sharedServerSettings___sharedConfig;

  return v2;
}

uint64_t __42__SUCoreConfigServer_sharedServerSettings__block_invoke()
{
  sharedServerSettings___sharedConfig = objc_alloc_init(SUCoreConfigServer);

  return MEMORY[0x270F9A758]();
}

- (SUCoreConfigServer)init
{
  v37.receiver = self;
  v37.super_class = (Class)SUCoreConfigServer;
  v2 = [(SUCoreConfigServer *)&v37 init];
  v3 = v2;
  if (v2)
  {
    uuidString = v2->_uuidString;
    v2->_uuidString = 0;

    lastScanTime = v3->_lastScanTime;
    v3->_lastScanTime = 0;

    lastLocatedAsset = v3->_lastLocatedAsset;
    v3->_lastLocatedAsset = 0;

    timer = v3->_timer;
    v3->_timer = 0;

    stateMachine = v3->_stateMachine;
    v3->_stateMachine = 0;

    persistedState = v3->_persistedState;
    v3->_persistedState = 0;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    listenerDelegates = v3->_listenerDelegates;
    v3->_listenerDelegates = v10;

    id v12 = objc_alloc(MEMORY[0x263F77D90]);
    uint64_t v13 = [v12 initWithProjectName:*MEMORY[0x263F77EB8]];
    coreConfig = v3->_coreConfig;
    v3->_coreConfig = (SUCoreConfig *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("SUCoreConfigClientDelegateQueue", v15);
    clientDelegateQueue = v3->_clientDelegateQueue;
    v3->_clientDelegateQueue = (OS_dispatch_queue *)v16;

    v18 = +[SUCoreConfigServer _generateStateTable];
    uint64_t v19 = [objc_alloc(MEMORY[0x263F77DD8]) initMachine:@"SUCoreConfigServer" withTable:v18 startingIn:@"ConfigIdle"];
    v20 = v3->_stateMachine;
    v3->_stateMachine = (SUCoreFSM *)v19;

    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    v34 = __26__SUCoreConfigServer_init__block_invoke;
    v35 = &unk_2640DE010;
    v36 = v3;
    [v18 enumerateKeysAndObjectsUsingBlock:&v32];
    id v21 = objc_alloc(MEMORY[0x263F77DF8]);
    v22 = [(SUCoreFSM *)v3->_stateMachine extendedStateQueue];
    uint64_t v23 = +[SUCoreConfigServer persistedStateFilePath];
    v24 = (void *)v23;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    else {
      v25 = @"/private/var/tmp/SUCoreConfig.state";
    }
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1, v32, v33, v34, v35);
    uint64_t v27 = [v21 initWithDispatchQueue:v22 withPersistencePath:v25 forPolicyVersion:v26];
    v28 = v3->_persistedState;
    v3->_persistedState = (SUCorePersistedState *)v27;

    [(SUCoreFSM *)v3->_stateMachine activateMachine];
    v29 = v3->_stateMachine;
    v30 = objc_alloc_init(SUCoreConfigParam);
    [(SUCoreFSM *)v29 postEvent:@"ConfigAPIInstall" withInfo:v30];
  }
  return v3;
}

void __26__SUCoreConfigServer_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__SUCoreConfigServer_init__block_invoke_2;
  v7[3] = &unk_2640DDFE8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __26__SUCoreConfigServer_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x263F77E28];
  id v6 = a2;
  id v7 = [a3 safeStringForKey:v5];
  [*(id *)(*(void *)(a1 + 32) + 72) registerAction:v7 ForEvent:v6 inState:*(void *)(a1 + 40) usingDelegate:*(void *)(a1 + 32) withInfoClass:objc_opt_class()];
}

- (void)dealloc
{
  v3 = [(SUCoreConfigServer *)self timer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SUCoreConfigServer;
  [(SUCoreConfigServer *)&v4 dealloc];
}

- (void)installServerSettings
{
  v3 = [MEMORY[0x263F77DE8] sharedLogger];
  objc_super v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] API: Install server settings API request issued; posting install event",
      v7,
      2u);
  }

  uint64_t v5 = [(SUCoreConfigServer *)self stateMachine];
  id v6 = objc_alloc_init(SUCoreConfigParam);
  [v5 postEvent:@"ConfigAPIInstall" withInfo:v6];
}

- (void)listenForConfigChanges:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [(SUCoreConfigServer *)self stateMachine];
  v10 = [v9 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUCoreConfigServer_listenForConfigChanges_withName___block_invoke;
  block[3] = &unk_2640DCD70;
  id v14 = v8;
  id v15 = v7;
  dispatch_queue_t v16 = self;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, block);
}

void __54__SUCoreConfigServer_listenForConfigChanges_withName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F77DE8] sharedLogger];
  v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = @"YES";
    uint64_t v5 = *(void *)(a1 + 40);
    if (!*(void *)(a1 + 32)) {
      objc_super v4 = @"NO";
    }
    int v12 = 138543618;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] API: Adding listener delegate (present=%{public}@) with name: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  id v6 = [*(id *)(a1 + 48) listenerDelegates];
  [v6 setSafeObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 48) listenerDelegates];
    v10 = [v9 allKeys];
    id v11 = [v10 componentsJoinedByString:@", "];
    int v12 = 138543362;
    uint64_t v13 = v11;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] API: Known listeners still active: %{public}@", (uint8_t *)&v12, 0xCu);
  }
}

- (id)scheduledActivityName
{
  if (scheduledActivityName_onceToken != -1) {
    dispatch_once(&scheduledActivityName_onceToken, &__block_literal_global_377);
  }
  v2 = (void *)scheduledActivityName___activityName;

  return v2;
}

void __43__SUCoreConfigServer_scheduledActivityName__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v0 bundleIdentifier];

  v1 = @"SUCoreConfigScheduledScan";
  if (v3)
  {
    v1 = [NSString stringWithFormat:@"%@.%@", v3, @"SUCoreConfigScheduledScan"];
  }
  v2 = (void *)scheduledActivityName___activityName;
  scheduledActivityName___activityName = (uint64_t)v1;
}

+ (id)allowedServerProjects
{
  if (allowedServerProjects_onceToken != -1) {
    dispatch_once(&allowedServerProjects_onceToken, &__block_literal_global_386);
  }
  v2 = (void *)allowedServerProjects___allowedProjects;

  return v2;
}

void __43__SUCoreConfigServer_allowedServerProjects__block_invoke()
{
  v5[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F77EC8];
  v5[0] = *MEMORY[0x263F77EB8];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263F77EC0];
  v5[2] = *MEMORY[0x263F77EB0];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x263F77EA8];
  v5[4] = *MEMORY[0x263F77EA0];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:6];
  objc_super v4 = (void *)allowedServerProjects___allowedProjects;
  allowedServerProjects___allowedProjects = v3;
}

+ (id)allowedServerKeys
{
  if (allowedServerKeys_onceToken != -1) {
    dispatch_once(&allowedServerKeys_onceToken, &__block_literal_global_389);
  }
  uint64_t v2 = (void *)allowedServerKeys___allowedKeys;

  return v2;
}

void __39__SUCoreConfigServer_allowedServerKeys__block_invoke()
{
  v7[10] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F77E88];
  v7[0] = *MEMORY[0x263F77E78];
  v7[1] = v0;
  uint64_t v1 = *MEMORY[0x263F77E60];
  v7[2] = *MEMORY[0x263F77E38];
  v7[3] = v1;
  uint64_t v2 = *MEMORY[0x263F77E48];
  void v7[4] = *MEMORY[0x263F77E40];
  v7[5] = v2;
  uint64_t v3 = *MEMORY[0x263F77E58];
  v7[6] = *MEMORY[0x263F77E50];
  v7[7] = v3;
  uint64_t v4 = *MEMORY[0x263F77E70];
  v7[8] = *MEMORY[0x263F77E98];
  v7[9] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:10];
  id v6 = (void *)allowedServerKeys___allowedKeys;
  allowedServerKeys___allowedKeys = v5;
}

+ (id)persistedStateFilePath
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore"];

  if ((v3 & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        id v10 = 0,
        [v4 createDirectoryAtPath:@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore" withIntermediateDirectories:1 attributes:0 error:&v10], id v5 = v10, v4, !v5))
  {
    id v8 = [@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore" stringByAppendingPathComponent:@"SUCoreConfig.state"];
  }
  else
  {
    id v6 = [MEMORY[0x263F77DE8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SUCoreConfigServer persistedStateFilePath];
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)_generateStateTable
{
  v80[7] = *MEMORY[0x263EF8340];
  v79[0] = @"ConfigIdle";
  v77 = @"ConfigAPIInstall";
  uint64_t v3 = *MEMORY[0x263F77E28];
  v75[0] = *MEMORY[0x263F78170];
  uint64_t v2 = v75[0];
  v75[1] = v3;
  v76[0] = @"ConfigScheduled";
  v76[1] = @"ConfigScheduleScan";
  v30 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
  v78 = v30;
  v29 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  v80[0] = v29;
  v79[1] = @"ConfigDownloadingCatalog";
  v73[0] = @"ConfigAPIInstall";
  uint64_t v71 = v3;
  uint64_t v72 = *MEMORY[0x263F78148];
  uint64_t v4 = v72;
  v28 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v74[0] = v28;
  v73[1] = @"ConfigPhaseComplete";
  v69[0] = v2;
  v69[1] = v3;
  v70[0] = @"ConfigQueryingAsset";
  v70[1] = @"ConfigQueryAsset";
  uint64_t v27 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
  v74[1] = v27;
  v73[2] = @"ConfigPhaseFailed";
  v67[0] = v2;
  v67[1] = v3;
  v68[0] = @"ConfigScheduled";
  v68[1] = @"ConfigScheduleScan";
  v26 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  v74[2] = v26;
  v25 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];
  v80[1] = v25;
  v79[2] = @"ConfigQueryingAsset";
  v65[0] = @"ConfigAPIInstall";
  uint64_t v63 = v3;
  uint64_t v64 = v4;
  v24 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v66[0] = v24;
  v65[1] = @"ConfigPhaseComplete";
  v61[0] = v2;
  v61[1] = v3;
  v62[0] = @"ConfigDownloadingAsset";
  v62[1] = @"ConfigDownloadAsset";
  uint64_t v23 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  v66[1] = v23;
  v65[2] = @"ConfigPhaseFailed";
  v59[0] = v2;
  v59[1] = v3;
  v60[0] = @"ConfigScheduled";
  v60[1] = @"ConfigScheduleScan";
  v22 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  v66[2] = v22;
  id v21 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
  v80[2] = v21;
  v79[3] = @"ConfigDownloadingAsset";
  uint64_t v56 = v4;
  v57[0] = @"ConfigAPIInstall";
  uint64_t v55 = v3;
  v20 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v58[0] = v20;
  v57[1] = @"ConfigPhaseComplete";
  v53[0] = v2;
  v53[1] = v3;
  v54[0] = @"ConfigAdjusting";
  v54[1] = @"ConfigAdjustSettings";
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  v58[1] = v19;
  v57[2] = @"ConfigPhaseFailed";
  v51[0] = v2;
  v51[1] = v3;
  v52[0] = @"ConfigScheduled";
  v52[1] = @"ConfigScheduleScan";
  v18 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  v58[2] = v18;
  v17 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
  v80[3] = v17;
  v79[4] = @"ConfigAdjusting";
  uint64_t v48 = v4;
  v49[0] = @"ConfigAPIInstall";
  uint64_t v47 = v3;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  v50[0] = v16;
  v49[1] = @"ConfigPhaseComplete";
  v45[0] = v2;
  v45[1] = v3;
  v46[0] = @"ConfigScheduled";
  v46[1] = @"ConfigScheduleScan";
  id v5 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  v50[1] = v5;
  v49[2] = @"ConfigPhaseFailed";
  v43[0] = v2;
  v43[1] = v3;
  v44[0] = @"ConfigScheduled";
  v44[1] = @"ConfigScheduleScan";
  id v6 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  v50[2] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
  v80[4] = v7;
  v79[5] = @"ConfigScheduled";
  v39[0] = v2;
  v39[1] = v3;
  v40[0] = @"ConfigDownloadingCatalog";
  v40[1] = @"ConfigDownloadCatalog";
  v41[0] = @"ConfigAPIInstall";
  id v8 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  v42[0] = v8;
  v41[1] = @"ConfigPhaseComplete";
  uint64_t v37 = v3;
  v38 = @"ConfigScheduleScan";
  id v9 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  v42[1] = v9;
  v41[2] = @"ConfigPhaseFailed";
  uint64_t v35 = v3;
  v36 = @"ConfigScheduleScan";
  id v10 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v42[2] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  v80[5] = v11;
  v79[6] = *MEMORY[0x263F78158];
  uint64_t v33 = *MEMORY[0x263F78150];
  uint64_t v31 = v2;
  uint64_t v32 = *MEMORY[0x263F78160];
  int v12 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v34 = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v80[6] = v13;
  __int16 v14 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:7];

  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  if ([v11 isEqualToString:*MEMORY[0x263F78148]])
  {
    int64_t v13 = 0;
  }
  else
  {
    if ([v11 isEqualToString:@"ConfigDownloadCatalog"])
    {
      int64_t v14 = [(SUCoreConfigServer *)self actionConfigDownloadCatalog:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ConfigQueryAsset"])
    {
      int64_t v14 = [(SUCoreConfigServer *)self actionConfigQueryAsset:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ConfigDownloadAsset"])
    {
      int64_t v14 = [(SUCoreConfigServer *)self actionConfigDownloadAsset:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ConfigAdjustSettings"])
    {
      int64_t v14 = [(SUCoreConfigServer *)self actionConfigAdjustSettings:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ConfigScheduleScan"])
    {
      int64_t v14 = [(SUCoreConfigServer *)self actionConfigScheduleScan:v12 error:a8];
    }
    else
    {
      int64_t v14 = [(SUCoreConfigServer *)self actionUnknownAction:v11 error:a8];
    }
    int64_t v13 = v14;
  }

  return v13;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F77D78];
  id v7 = a3;
  id v8 = [v6 sharedCore];
  id v9 = NSString;
  id v10 = [(SUCoreConfigServer *)self stateMachine];
  id v11 = (void *)[v10 copyCurrentStateProtected];
  id v12 = [v9 stringWithFormat:@"SUCoreConfig Unknown Action %@ for state %@", v7, v11];

  int64_t v13 = [v8 buildError:8102 underlying:0 description:v12];

  int64_t v14 = [MEMORY[0x263F77DA8] sharedDiag];
  uint64_t v15 = [v13 localizedDescription];
  objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", @"SUCoreConfig", v15, objc_msgSend(v13, "code"), v13);

  if (a4) {
    *a4 = v13;
  }

  return 8102;
}

- (int64_t)actionConfigDownloadCatalog:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(SUCoreConfigServer *)self _stateSafeResetState];
  id v5 = [(SUCoreConfigServer *)self _stateSafeDownloadOptions];
  id v6 = [MEMORY[0x263F77DE8] sharedLogger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Catalog: Starting download of configuration asset catalog with options: %{public}@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke;
  v9[3] = &unk_2640DDE98;
  v9[4] = self;
  [MEMORY[0x263F55938] startCatalogDownload:@"com.apple.MobileAsset.SoftwareUpdateConfiguration" options:v5 completionWithError:v9];

  return 0;
}

void __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F77DE8] sharedLogger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = MEMORY[0x210550670](a2);
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Catalog: Catalog download completed with MADownloadResult: %{public}@ (%ld)", (uint8_t *)&v15, 0x16u);
  }
  if (a2)
  {
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v10 = [v9 buildError:8400 underlying:v5 description:@"Software update configuration catalog download failed"];

    id v11 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke_cold_1();
    }

    int64_t v13 = [*(id *)(a1 + 32) stateMachine];
    int64_t v14 = [[SUCoreConfigParam alloc] initWithError:v10 operation:1];
    [(SUCoreConfigParam *)v13 postEvent:@"ConfigPhaseFailed" withInfo:v14];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) stateMachine];
    int64_t v13 = objc_alloc_init(SUCoreConfigParam);
    [v10 postEvent:@"ConfigPhaseComplete" withInfo:v13];
  }
}

- (int64_t)actionConfigQueryAsset:(id)a3 error:(id *)a4
{
  v79[2] = *MEMORY[0x263EF8340];
  v69 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"|"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.SoftwareUpdateConfiguration"];
  id v5 = [MEMORY[0x263EFF9D0] null];
  v79[0] = v5;
  id v6 = [MEMORY[0x263F77DA0] sharedDevice];
  id v7 = [v6 buildVersion];
  v79[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
  id v9 = (void *)[v8 mutableCopy];
  [v4 addKeyValueArray:@"PrerequisiteBuilds" with:v9];

  id v10 = [MEMORY[0x263EFF9D0] null];
  v78[0] = v10;
  id v11 = [MEMORY[0x263F77DA0] sharedDevice];
  uint64_t v12 = [v11 productVersion];
  v78[1] = v12;
  int64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
  int64_t v14 = (void *)[v13 mutableCopy];
  [v4 addKeyValueArray:@"PrerequisiteOSVersions" with:v14];

  int v15 = [MEMORY[0x263EFF9D0] null];
  v77[0] = v15;
  uint64_t v16 = [MEMORY[0x263F77DA0] sharedDevice];
  __int16 v17 = [v16 hwModelString];
  v77[1] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
  uint64_t v19 = (void *)[v18 mutableCopy];
  [v4 addKeyValueArray:@"SupportedDeviceModels" with:v19];

  v20 = [MEMORY[0x263EFF9D0] null];
  v76[0] = v20;
  id v21 = [MEMORY[0x263F77DA0] sharedDevice];
  v22 = [v21 buildVersion];
  v76[1] = v22;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
  v24 = [v23 componentsJoinedByString:@","];
  [v69 appendFormat:@"%@:%@|", @"PrerequisiteBuilds", v24];

  v25 = [MEMORY[0x263EFF9D0] null];
  v75[0] = v25;
  v26 = [MEMORY[0x263F77DA0] sharedDevice];
  uint64_t v27 = [v26 productVersion];
  v75[1] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:2];
  v29 = [v28 componentsJoinedByString:@","];
  [v69 appendFormat:@"%@:%@|", @"PrerequisiteOSVersions", v29];

  v30 = [MEMORY[0x263EFF9D0] null];
  v74[0] = v30;
  uint64_t v31 = [MEMORY[0x263F77DA0] sharedDevice];
  uint64_t v32 = [v31 hwModelString];
  v74[1] = v32;
  uint64_t v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
  v34 = [v33 componentsJoinedByString:@","];
  [v69 appendFormat:@"%@:%@|", @"SupportedDeviceModels", v34];

  uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  [v4 addKeyValuePair:@"_CompatibilityVersion" with:v35];

  v36 = [MEMORY[0x263F77DA0] sharedDevice];
  uint64_t v37 = [v36 deviceClass];
  [v4 addKeyValuePair:@"Device" with:v37];

  v38 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  [v69 appendFormat:@"%@:%@|", @"_CompatibilityVersion", v38];

  v39 = [MEMORY[0x263F77DA0] sharedDevice];
  v40 = [v39 deviceClass];
  [v69 appendFormat:@"%@:%@|", @"Device", v40];

  v41 = [MEMORY[0x263F77DA0] sharedDevice];
  v42 = [v41 releaseType];

  if (v42)
  {
    v43 = [MEMORY[0x263F77DA0] sharedDevice];
    v44 = [v43 releaseType];
    [v4 addKeyValuePair:@"ReleaseType" with:v44];

    v45 = [MEMORY[0x263F77DA0] sharedDevice];
    v46 = [v45 releaseType];
    [v69 appendFormat:@"%@:%@|", @"ReleaseType", v46];
  }
  else
  {
    [v4 addKeyValueNull:@"ReleaseType"];
    [v69 appendFormat:@"%@:Customer(null)|", @"ReleaseType"];
  }
  uint64_t v47 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v48 = [v47 oslog];

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = [MEMORY[0x263F77DA0] sharedDevice];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v73 = 1;
    *(_WORD *)&v73[4] = 2114;
    *(void *)&v73[6] = v49;
    _os_log_impl(&dword_20C8EA000, v48, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Query: Current device state (COMPATIBILITY_VERSION:%d): %{public}@", buf, 0x12u);
  }
  v50 = [MEMORY[0x263F77DE8] sharedLogger];
  v51 = [v50 oslog];

  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v73 = v69;
    _os_log_impl(&dword_20C8EA000, v51, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Query: Starting metadata query: %{public}@", buf, 0xCu);
  }

  uint64_t v52 = [v4 queryMetaDataSync];
  v53 = [MEMORY[0x263F77DE8] sharedLogger];
  v54 = [v53 oslog];

  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = MEMORY[0x210550680](v52);
    *(_DWORD *)buf = 138543618;
    *(void *)v73 = v55;
    *(_WORD *)&v73[8] = 2048;
    *(void *)&v73[10] = v52;
    _os_log_impl(&dword_20C8EA000, v54, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Query: Metadata query completed with result: %{public}@ %ld", buf, 0x16u);
  }
  if (v52)
  {
    uint64_t v56 = [MEMORY[0x263F77D78] sharedCore];
    v57 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.MobileAssetError.Query" code:v52 userInfo:0];
    id v58 = [v56 buildError:8401 underlying:v57 description:@"No available configuration assets found (failed to query metadata)"];

    v59 = 0;
  }
  else
  {
    uint64_t v56 = [v4 results];
    id v71 = 0;
    v59 = [(SUCoreConfigServer *)self _stateSafeSelectBestAssetFromArray:v56 error:&v71];
    id v58 = v71;
  }

  if (v58)
  {
    v60 = [MEMORY[0x263F77DE8] sharedLogger];
    v61 = [v60 oslog];

    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigQueryAsset:error:]();
    }

    v62 = [(SUCoreConfigServer *)self stateMachine];
    uint64_t v63 = [[SUCoreConfigParam alloc] initWithError:v58 operation:1];
    [v62 postEvent:@"ConfigPhaseFailed" withInfo:v63];

    if (a4) {
      *a4 = v58;
    }
    int64_t v64 = [v58 code];
  }
  else
  {
    v65 = [(SUCoreConfigServer *)self stateMachine];
    v66 = [[SUCoreConfigParam alloc] initWithLocatedAsset:v59];
    [v65 followupEvent:@"ConfigPhaseComplete" withInfo:v66];

    int64_t v64 = 0;
  }

  return v64;
}

- (id)_stateSafeSelectBestAssetFromArray:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SUCoreConfigServer *)self stateMachine];
  id v8 = [v7 extendedStateQueue];
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    id v11 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v12 = v11;
    int64_t v13 = @"No available configuration assets found (query not present)";
    uint64_t v14 = 8402;
    goto LABEL_7;
  }
  if (![v6 count])
  {
    id v11 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v12 = v11;
    int64_t v13 = @"No available configuration assets found (query returned no assets)";
    uint64_t v14 = 8406;
LABEL_7:
    int v15 = [v11 buildError:v14 underlying:0 description:v13];

    id v9 = 0;
    id v10 = 0;
    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if ([v6 count] == 1)
  {
    id v9 = [v6 objectAtIndex:0];
    id v10 = @"OnlyAsset";
LABEL_13:
    [(SUCoreConfigServer *)self setLastLocatedAsset:v9];
    uint64_t v18 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v9 attributes];
      *(_DWORD *)buf = 138543874;
      v26 = v10;
      __int16 v27 = 2114;
      id v28 = v9;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: Located asset (reason: '%{public}@'): %{public}@; attributes: %{public}@",
        buf,
        0x20u);
    }
    int v15 = 0;
    goto LABEL_16;
  }
  id v23 = 0;
  id v24 = 0;
  int v15 = [(SUCoreConfigServer *)self _stateSafeSelectBestAssetFromMultipleAssetArray:v6 bestAsset:&v24 selectionReason:&v23];
  id v9 = v24;
  id v10 = (__CFString *)v23;
  if (!v15) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v16 = [MEMORY[0x263F77DE8] sharedLogger];
  __int16 v17 = [v16 oslog];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v15;
    _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: Failed to locate asset with error: %{public}@", buf, 0xCu);
  }

  if (a4)
  {
    int v15 = v15;
    *a4 = v15;
  }
LABEL_16:
  id v21 = v9;

  return v21;
}

- (id)_stateSafeSelectBestAssetFromMultipleAssetArray:(id)a3 bestAsset:(id *)a4 selectionReason:(id *)a5
{
  id v8 = a3;
  id v9 = [(SUCoreConfigServer *)self stateMachine];
  id v10 = [v9 extendedStateQueue];
  dispatch_assert_queue_V2(v10);

  *a4 = 0;
  *a5 = 0;
  id v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_446];
  uint64_t v12 = [v8 filteredArrayUsingPredicate:v11];

  if ([v12 count])
  {
    [v12 objectAtIndex:0];
    int64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = @"FullMatch";
LABEL_3:
    *a5 = v14;
    goto LABEL_7;
  }
  int v15 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_452];
  uint64_t v16 = [v8 filteredArrayUsingPredicate:v15];

  if ([v16 count])
  {
    [v16 objectAtIndex:0];
    int64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v17 = @"BuildVersion&HWModelStr";
LABEL_6:
    *a5 = v17;
    uint64_t v12 = v16;
    goto LABEL_7;
  }
  uint64_t v19 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_458];
  uint64_t v12 = [v8 filteredArrayUsingPredicate:v19];

  if ([v12 count])
  {
    [v12 objectAtIndex:0];
    int64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = @"BuildVersion&ProductVersion";
    goto LABEL_3;
  }
  v20 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_464];
  uint64_t v16 = [v8 filteredArrayUsingPredicate:v20];

  if ([v16 count])
  {
    [v16 objectAtIndex:0];
    int64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v17 = @"HWModelStr&ProductVersion";
    goto LABEL_6;
  }
  id v21 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_470];
  uint64_t v12 = [v8 filteredArrayUsingPredicate:v21];

  if ([v12 count])
  {
    [v12 objectAtIndex:0];
    int64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = @"BuildVersionOnly";
    goto LABEL_3;
  }
  v22 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_476];
  uint64_t v16 = [v8 filteredArrayUsingPredicate:v22];

  if ([v16 count])
  {
    [v16 objectAtIndex:0];
    int64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v17 = @"HWModelStrOnly";
    goto LABEL_6;
  }
  id v23 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_482];
  uint64_t v12 = [v8 filteredArrayUsingPredicate:v23];

  if ([v12 count])
  {
    [v12 objectAtIndex:0];
    int64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = @"ProductVersionOnly";
    goto LABEL_3;
  }
  id v24 = [MEMORY[0x263F77D78] sharedCore];
  int64_t v13 = [v24 buildError:8409 underlying:0 description:@"No available configuration assets found (multiple selection logic found no asset)"];

LABEL_7:

  return v13;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [v2 attributes];
  uint64_t v4 = [v3 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];

  id v5 = [v2 attributes];
  id v6 = [v5 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];

  id v7 = [v2 attributes];

  id v8 = [v7 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];

  id v9 = [MEMORY[0x263F77DA0] sharedDevice];
  id v10 = [v9 hwModelString];
  if ([v4 containsObject:v10])
  {
    id v11 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v12 = [v11 buildVersion];
    if ([v6 containsObject:v12])
    {
      int64_t v13 = [MEMORY[0x263F77DA0] sharedDevice];
      uint64_t v14 = [v13 productVersion];
      unsigned int v32 = [v8 containsObject:v14];
    }
    else
    {
      unsigned int v32 = 0;
    }
  }
  else
  {
    unsigned int v32 = 0;
  }

  int v15 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v16 = [v15 oslog];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v29 = [MEMORY[0x263F77DA0] sharedDevice];
    __int16 v17 = [v29 hwModelString];
    uint64_t v18 = v8;
    uint64_t v19 = [v4 componentsJoinedByString:@","];
    v20 = [MEMORY[0x263F77DA0] sharedDevice];
    [v20 buildVersion];
    id v21 = v31 = v4;
    [v6 componentsJoinedByString:@","];
    v22 = v30 = v6;
    id v23 = [MEMORY[0x263F77DA0] sharedDevice];
    id v24 = [v23 productVersion];
    uint64_t v25 = [v8 componentsJoinedByString:@","];
    v26 = (void *)v25;
    *(_DWORD *)buf = 138544898;
    __int16 v27 = @"NO";
    v34 = v17;
    if (v32) {
      __int16 v27 = @"YES";
    }
    __int16 v35 = 2114;
    v36 = v19;
    __int16 v37 = 2114;
    v38 = v21;
    __int16 v39 = 2114;
    v40 = v22;
    __int16 v41 = 2114;
    v42 = v24;
    __int16 v43 = 2114;
    uint64_t v44 = v25;
    __int16 v45 = 2114;
    v46 = v27;
    _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: FullMatch Predicate (Device:Asset) - HWModelString %{public}@:%{public}@; BuildVer"
      "sion %{public}@:%{public}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      buf,
      0x48u);

    id v8 = v18;
    id v6 = v30;

    uint64_t v4 = v31;
  }

  return v32;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_450(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [v2 attributes];
  uint64_t v4 = [v3 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];

  id v5 = [v2 attributes];

  id v6 = [v5 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];

  id v7 = [MEMORY[0x263F77DA0] sharedDevice];
  id v8 = [v7 hwModelString];
  if ([v4 containsObject:v8])
  {
    id v9 = [MEMORY[0x263F77DA0] sharedDevice];
    id v10 = [v9 buildVersion];
    uint64_t v11 = [v6 containsObject:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  uint64_t v12 = [MEMORY[0x263F77DE8] sharedLogger];
  int64_t v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [MEMORY[0x263F77DA0] sharedDevice];
    int v15 = [v14 hwModelString];
    uint64_t v16 = [v4 componentsJoinedByString:@","];
    __int16 v17 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v18 = [v17 buildVersion];
    uint64_t v19 = [v6 componentsJoinedByString:@","];
    v20 = (void *)v19;
    int v23 = 138544386;
    id v21 = @"NO";
    id v24 = v15;
    if (v11) {
      id v21 = @"YES";
    }
    __int16 v25 = 2114;
    v26 = v16;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    unsigned int v32 = v21;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: BuildVersion&HWModelStr Predicate (Device:Asset) - HWModelString %{public}@:%{public}@; BuildVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);
  }
  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_456(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [v2 attributes];
  uint64_t v4 = [v3 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];

  id v5 = [v2 attributes];

  id v6 = [v5 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];

  id v7 = [MEMORY[0x263F77DA0] sharedDevice];
  id v8 = [v7 buildVersion];
  if ([v4 containsObject:v8])
  {
    id v9 = [MEMORY[0x263F77DA0] sharedDevice];
    id v10 = [v9 productVersion];
    uint64_t v11 = [v6 containsObject:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  uint64_t v12 = [MEMORY[0x263F77DE8] sharedLogger];
  int64_t v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [MEMORY[0x263F77DA0] sharedDevice];
    int v15 = [v14 buildVersion];
    uint64_t v16 = [v4 componentsJoinedByString:@","];
    __int16 v17 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v18 = [v17 productVersion];
    uint64_t v19 = [v6 componentsJoinedByString:@","];
    v20 = (void *)v19;
    int v23 = 138544386;
    id v21 = @"NO";
    id v24 = v15;
    if (v11) {
      id v21 = @"YES";
    }
    __int16 v25 = 2114;
    v26 = v16;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    unsigned int v32 = v21;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: BuildVersion&ProductVersion Predicate (Device:Asset) - BuildVersion %{public}@:%{public}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);
  }
  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_462(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [v2 attributes];
  uint64_t v4 = [v3 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];

  id v5 = [v2 attributes];

  id v6 = [v5 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];

  id v7 = [MEMORY[0x263F77DA0] sharedDevice];
  id v8 = [v7 hwModelString];
  if ([v4 containsObject:v8])
  {
    id v9 = [MEMORY[0x263F77DA0] sharedDevice];
    id v10 = [v9 productVersion];
    uint64_t v11 = [v6 containsObject:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  uint64_t v12 = [MEMORY[0x263F77DE8] sharedLogger];
  int64_t v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [MEMORY[0x263F77DA0] sharedDevice];
    int v15 = [v14 hwModelString];
    uint64_t v16 = [v4 componentsJoinedByString:@","];
    __int16 v17 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v18 = [v17 productVersion];
    uint64_t v19 = [v6 componentsJoinedByString:@","];
    v20 = (void *)v19;
    int v23 = 138544386;
    id v21 = @"NO";
    id v24 = v15;
    if (v11) {
      id v21 = @"YES";
    }
    __int16 v25 = 2114;
    v26 = v16;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    unsigned int v32 = v21;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: HWModelStr&ProductVersion Predicate (Device:Asset) - HWModelString %{public}@:%{public}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);
  }
  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_468(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [a2 attributes];
  uint64_t v3 = [v2 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];

  uint64_t v4 = [MEMORY[0x263F77DA0] sharedDevice];
  id v5 = [v4 buildVersion];
  uint64_t v6 = [v3 containsObject:v5];

  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F77DA0] sharedDevice];
    id v10 = [v9 buildVersion];
    uint64_t v11 = [v3 componentsJoinedByString:@","];
    uint64_t v12 = (void *)v11;
    int64_t v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if (v6) {
      int64_t v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: BuildVersionOnly Predicate (Device:Asset) - BuildVersion %{public}@:%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);
  }
  return v6;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_474(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [a2 attributes];
  uint64_t v3 = [v2 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];

  uint64_t v4 = [MEMORY[0x263F77DA0] sharedDevice];
  id v5 = [v4 hwModelString];
  uint64_t v6 = [v3 containsObject:v5];

  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F77DA0] sharedDevice];
    id v10 = [v9 hwModelString];
    uint64_t v11 = [v3 componentsJoinedByString:@","];
    uint64_t v12 = (void *)v11;
    int64_t v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if (v6) {
      int64_t v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: HWModelStrOnly Predicate (Device:Asset) - HWModelString %{public}@:%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);
  }
  return v6;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_480(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [a2 attributes];
  uint64_t v3 = [v2 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];

  uint64_t v4 = [MEMORY[0x263F77DA0] sharedDevice];
  id v5 = [v4 productVersion];
  uint64_t v6 = [v3 containsObject:v5];

  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F77DA0] sharedDevice];
    id v10 = [v9 productVersion];
    uint64_t v11 = [v3 componentsJoinedByString:@","];
    uint64_t v12 = (void *)v11;
    int64_t v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if (v6) {
      int64_t v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: ProductVersionOnly Predicate (Device:Asset) - ProductVersion %{public}@:%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);
  }
  return v6;
}

- (int64_t)actionConfigDownloadAsset:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 locatedAsset];

  if (v6)
  {
    id v7 = [(SUCoreConfigServer *)self _stateSafeDownloadOptions];
    id v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Download: Starting download of configuration asset with options: %{public}@", buf, 0xCu);
    }

    id v10 = [v5 locatedAsset];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__SUCoreConfigServer_actionConfigDownloadAsset_error___block_invoke;
    v18[3] = &unk_2640DCC30;
    v18[4] = self;
    id v19 = v5;
    [v10 startDownload:v7 completionWithError:v18];

    int64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F77D78] sharedCore];
    id v7 = [v12 buildError:8116 underlying:0 description:@"No located configuration asset for download"];

    int64_t v13 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigDownloadAsset:error:]();
    }

    int v15 = [(SUCoreConfigServer *)self stateMachine];
    uint64_t v16 = [[SUCoreConfigParam alloc] initWithError:v7 operation:2];
    [v15 postEvent:@"ConfigPhaseFailed" withInfo:v16];

    int64_t v11 = 8116;
  }

  return v11;
}

void __54__SUCoreConfigServer_actionConfigDownloadAsset_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F77DE8] sharedLogger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = MEMORY[0x210550670](a2);
    int v15 = 138543362;
    uint64_t v16 = v8;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Download: Asset download completed with MADownloadResult: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  if (a2 != 10 && a2)
  {
    id v10 = [MEMORY[0x263F77D78] sharedCore];
    id v9 = [v10 buildError:8700 underlying:v5 description:@"Software update configuration asset download failed"];

    int64_t v11 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigDownloadAsset:error:]();
    }

    int64_t v13 = [*(id *)(a1 + 32) stateMachine];
    uint64_t v14 = [[SUCoreConfigParam alloc] initWithError:v9 operation:2];
    [v13 postEvent:@"ConfigPhaseFailed" withInfo:v14];
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) stateMachine];
    [v9 postEvent:@"ConfigPhaseComplete" withInfo:*(void *)(a1 + 40)];
  }
}

- (int64_t)actionConfigAdjustSettings:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Adjust: Adjusting configuration with server settings", buf, 2u);
  }

  id v9 = [v6 locatedAsset];

  if (v9)
  {
    id v10 = [v6 locatedAsset];
    char v11 = [v10 refreshState];

    if (v11)
    {
      uint64_t v12 = [v6 locatedAsset];
      char v13 = [v12 wasLocal];

      if (v13) {
        goto LABEL_15;
      }
      uint64_t v14 = [MEMORY[0x263F77D78] sharedCore];
      int v15 = v14;
      uint64_t v16 = @"Asset is not downloaded (wasLocal returned false)";
      uint64_t v17 = 8707;
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263F77D78] sharedCore];
      int v15 = v14;
      uint64_t v16 = @"Asset is not available (refreshState returned false)";
      uint64_t v17 = 8706;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F77D78] sharedCore];
    int v15 = v14;
    uint64_t v16 = @"Asset was not located (asset not present)";
    uint64_t v17 = 8116;
  }
  id v18 = [v14 buildError:v17 underlying:0 description:v16];

  if (v18)
  {
    id v19 = [MEMORY[0x263F77DE8] sharedLogger];
    v20 = [v19 oslog];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigAdjustSettings:error:]();
    }

    uint64_t v21 = [(SUCoreConfigServer *)self stateMachine];
    uint64_t v22 = [[SUCoreConfigParam alloc] initWithError:v18 operation:3];
    [v21 followupEvent:@"ConfigPhaseFailed" withInfo:v22];

    if (a4)
    {
      id v18 = v18;
      *a4 = v18;
    }
    int64_t v23 = 8406;
    goto LABEL_29;
  }
LABEL_15:
  id v24 = [v6 locatedAsset];
  __int16 v25 = [v24 attributes];
  uint64_t v26 = [v25 safeStringForKey:@"ConfigurationPlist"];
  __int16 v27 = (void *)v26;
  id v28 = @"Configuration.plist";
  if (v26) {
    id v28 = (__CFString *)v26;
  }
  __int16 v29 = v28;

  uint64_t v30 = [v6 locatedAsset];
  uint64_t v31 = [v30 getLocalUrl];
  unsigned int v32 = [(id)v31 path];
  uint64_t v33 = [v32 stringByAppendingPathComponent:v29];

  v34 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v31) = [v34 fileExistsAtPath:v33];

  if (v31)
  {
    __int16 v35 = [NSDictionary dictionaryWithContentsOfFile:v33];
    id v36 = [v35 safeObjectForKey:@"Projects" ofClass:objc_opt_class()];
    __int16 v37 = [MEMORY[0x263F77DE8] sharedLogger];
    v38 = [v37 oslog];

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v55 = v36;
      _os_log_impl(&dword_20C8EA000, v38, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Adjust: Updating configuration for projects: %{public}@", buf, 0xCu);
    }

    [v36 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_517];
    [(SUCoreConfigServer *)self _stateSafeInformDelegatesOfConfiguration:v35 error:0];
    [(SUCoreConfigServer *)self _stateSafeSendInstalledEventWithSuccess:1 error:0];
    v59 = @"com.apple.MobileAsset.SoftwareUpdateConfiguration";
    __int16 v39 = [v6 locatedAsset];
    v40 = [v39 assetId];
    id v58 = v40;
    __int16 v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    v60[0] = v41;
    v42 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];

    __int16 v43 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v44 = [v43 oslog];

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v45 = [&unk_26C19D3E8 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543618;
      id v55 = v45;
      __int16 v56 = 2114;
      v57 = v42;
      _os_log_impl(&dword_20C8EA000, v44, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Purge: Purging all assets (via MAPurgeAllExceptGivenIds) of type %{public}@ except: %{public}@", buf, 0x16u);
    }
    MAPurgeAllExceptGivenIds();
    v46 = [(SUCoreConfigServer *)self stateMachine];
    uint64_t v47 = objc_alloc_init(SUCoreConfigParam);
    [v46 postEvent:@"ConfigPhaseComplete" withInfo:v47];

    int64_t v23 = 0;
  }
  else
  {
    __int16 v35 = [NSString stringWithFormat:@"Asset configuration plist does not exist at expected path: %@", v33];
    uint64_t v48 = [MEMORY[0x263F77D78] sharedCore];
    id v36 = [v48 buildError:8125 underlying:0 description:v35];

    v49 = [MEMORY[0x263F77DE8] sharedLogger];
    v50 = [v49 oslog];

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigAdjustSettings:error:]();
    }

    v51 = [(SUCoreConfigServer *)self stateMachine];
    uint64_t v52 = [[SUCoreConfigParam alloc] initWithError:v36 operation:3];
    [v51 followupEvent:@"ConfigPhaseFailed" withInfo:v52];

    if (a4)
    {
      id v36 = v36;
      *a4 = v36;
    }
    int64_t v23 = 8406;
  }

  id v18 = 0;
LABEL_29:

  return v23;
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v4
    && (+[SUCoreConfigServer allowedServerProjects],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsObject:v4],
        v6,
        v7))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F77D90]) initWithProjectName:v4];
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    id v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v4;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Adjust: Updating configuration for project: %{public}@, with configuration: %{public}@", buf, 0x16u);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_518;
    v13[3] = &unk_2640DE078;
    id v14 = v8;
    id v15 = v4;
    char v11 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F77DE8] sharedLogger];
    char v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_cold_1();
    }
  }
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_518(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    && (+[SUCoreConfigServer allowedServerKeys],
        int v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:v5],
        v7,
        v8))
  {
    [*(id *)(a1 + 32) setConfig:v6 forKey:v5];
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    id v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_518_cold_1();
    }
  }
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_520(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F77DE8] sharedLogger];
  id v5 = [v4 oslog];

  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_520_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Purge: Purge (MAPurgeAllExceptGivenIds) completed successfully", v8, 2u);
  }

  id v6 = [*(id *)(a1 + 32) stateMachine];
  int v7 = objc_alloc_init(SUCoreConfigParam);
  [v6 postEvent:@"ConfigPhaseComplete" withInfo:v7];
}

- (void)_stateSafeInformDelegatesOfConfiguration:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SUCoreConfigServer *)self stateMachine];
  id v9 = [v8 extendedStateQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [MEMORY[0x263F77DE8] sharedLogger];
  char v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(SUCoreConfigServer *)self listenerDelegates];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = [v12 count];
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Delegate: Informing %ld listener delegates of updated config", buf, 0xCu);
  }
  char v13 = [(SUCoreConfigServer *)self listenerDelegates];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke;
  v16[3] = &unk_2640DE0A0;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v13 enumerateKeysAndObjectsUsingBlock:v16];
}

void __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [MEMORY[0x263F77DE8] sharedLogger];
    int v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v5;
      _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Delegate: Sending updated config notification to delegate with name: %{public}@", buf, 0xCu);
    }

    id v9 = [a1[4] clientDelegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke_524;
    block[3] = &unk_2640DCD70;
    char v13 = v6;
    id v14 = a1[5];
    id v15 = a1[6];
    dispatch_async(v9, block);

    id v10 = v13;
  }
  else
  {
    char v11 = [MEMORY[0x263F77DE8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v5;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Delegate: Delegate does not respond to updated config callbacks (%{public}@)", buf, 0xCu);
    }
  }
}

uint64_t __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke_524(uint64_t a1)
{
  return [*(id *)(a1 + 32) coreConfigServerSettingsUpdated:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (int64_t)actionConfigScheduleScan:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 error];

  if (v6)
  {
    id v7 = [v5 error];
    [(SUCoreConfigServer *)self _stateSafeSendInstalledEventWithSuccess:0 error:v7];

    int v8 = [v5 error];
    [(SUCoreConfigServer *)self _stateSafeInformDelegatesOfConfiguration:0 error:v8];
  }
  if (actionConfigScheduleScan_error__schedulerDefaultOnce != -1) {
    dispatch_once(&actionConfigScheduleScan_error__schedulerDefaultOnce, &__block_literal_global_527);
  }
  id v9 = objc_alloc_init(SUCoreActivityOptions);
  id v10 = [(SUCoreConfigServer *)self _stateSafeDetermineNextScanTime];
  [(SUCoreActivityOptions *)v9 setRunDate:v10];

  [(SUCoreActivityOptions *)v9 setNetworkState:2];
  [(SUCoreActivityOptions *)v9 setWaking:2];
  char v11 = NSString;
  uint64_t v12 = (void *)MEMORY[0x263F77D78];
  char v13 = [(SUCoreActivityOptions *)v9 runDate];
  id v14 = [v12 stringFromDate:v13];
  if ([(SUCoreActivityOptions *)v9 waking]) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  if ([(SUCoreActivityOptions *)v9 networkState]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  id v17 = [v11 stringWithFormat:@"runDate=%@ waking=%@ networkState=%@", v14, v15, v16];

  uint64_t v18 = [(SUCoreConfigServer *)self scheduledActivityName];
  id v19 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v20 = [v19 oslog];

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v18;
    _os_log_impl(&dword_20C8EA000, v20, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Unregistering all activities with name: %{public}@", buf, 0xCu);
  }

  if (actionConfigScheduleScan_error__useXPCActivityScheduler)
  {
    uint64_t v21 = +[SUCoreXPCActivityManager sharedInstance];
    [v21 unscheduleActivity:v18];
  }
  else
  {
    uint64_t v21 = +[SUCoreActivityScheduler sharedInstance];
    [v21 unregisterActivitiesWithName:v18];
  }

  uint64_t v22 = [MEMORY[0x263F77DE8] sharedLogger];
  int64_t v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = (void *)MEMORY[0x263F77D78];
    __int16 v25 = [MEMORY[0x263EFF910] date];
    uint64_t v26 = [v24 stringFromDate:v25];
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v17;
    __int16 v32 = 2114;
    uint64_t v33 = v26;
    _os_log_impl(&dword_20C8EA000, v23, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Scheduling activity with options: %{public}@; current date: %{public}@",
      buf,
      0x16u);
  }
  if (actionConfigScheduleScan_error__useXPCActivityScheduler)
  {
    __int16 v27 = [[SUCoreXPCActivity alloc] init:v18 options:v9 handler:&__block_literal_global_548];
    id v28 = +[SUCoreXPCActivityManager sharedInstance];
    [v28 scheduleActivity:v27];
  }
  else
  {
    __int16 v27 = [[SUCoreActivity alloc] initWithActivityName:v18 options:v9];
    id v28 = +[SUCoreActivityScheduler sharedInstance];
    [v28 scheduleActivity:v27 withHandler:&__block_literal_global_556];
  }

  [(SUCoreConfigServer *)self _stateSafeSendScheduledEventWithSuccess:1 error:0];
  return 0;
}

void __53__SUCoreConfigServer_actionConfigScheduleScan_error___block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)CFPreferencesCopyValue(@"SUUseXPCActivityScheduler", @"com.apple.softwareupdateservicesd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  CFBooleanRef v1 = v0;
  if (v0 && (CFTypeID v2 = CFGetTypeID(v0), v2 == CFBooleanGetTypeID()))
  {
    int v3 = CFBooleanGetValue(v1) == 1;
    actionConfigScheduleScan_error__useXPCActivityScheduler = v3;
  }
  else
  {
    int v3 = actionConfigScheduleScan_error__useXPCActivityScheduler;
  }
  id v4 = [MEMORY[0x263F77DE8] sharedLogger];
  id v5 = [v4 oslog];

  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v6) {
      goto LABEL_11;
    }
    __int16 v10 = 0;
    id v7 = "[SUCoreConfig]: Using SUCoreXPCActivityScheduler for scheduling";
    int v8 = (uint8_t *)&v10;
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    __int16 v9 = 0;
    id v7 = "[SUCoreConfig]: Using default scheduler for scheduling";
    int v8 = (uint8_t *)&v9;
  }
  _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_11:

  if (v1) {
    CFRelease(v1);
  }
}

void __53__SUCoreConfigServer_actionConfigScheduleScan_error___block_invoke_545()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v0 = xpc_activity_copy_identifier();
  CFBooleanRef v1 = [MEMORY[0x263F77DE8] sharedLogger];
  CFTypeID v2 = [v1 oslog];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (v0)
    {
      int v3 = [NSString stringWithUTF8String:v0];
    }
    else
    {
      int v3 = @"(Unknown activity)";
    }
    int v5 = 138412290;
    BOOL v6 = v3;
    _os_log_impl(&dword_20C8EA000, v2, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Scheduled activity %@ fired! Scanning for new confibutration updates", (uint8_t *)&v5, 0xCu);
    if (v0) {
  }
    }
  id v4 = +[SUCoreConfigServer sharedServerSettings];
  [v4 installServerSettings];
}

void __53__SUCoreConfigServer_actionConfigScheduleScan_error___block_invoke_553(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (void *)MEMORY[0x263F77D78];
    __int16 v9 = [MEMORY[0x263EFF910] date];
    __int16 v10 = [v8 stringFromDate:v9];
    int v12 = 138543874;
    id v13 = v4;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Scheduled activity fired! Scanning for new configuration updates (registrationID=%{public}@ info=%{public}@ currentDate=%{public}@)", (uint8_t *)&v12, 0x20u);
  }
  char v11 = +[SUCoreConfigServer sharedServerSettings];
  [v11 installServerSettings];
}

- (id)_stateSafeDownloadOptions
{
  int v3 = [(SUCoreConfigServer *)self stateMachine];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(MEMORY[0x263F559B8]);
  [v5 setDiscretionary:0];
  [v5 setAllowsCellularAccess:1];
  [v5 setAllowsExpensiveAccess:1];
  BOOL v6 = [(SUCoreConfigServer *)self uuidString];
  [v5 setSessionId:v6];

  return v5;
}

- (void)_stateSafeResetState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF910] date];
  [(SUCoreConfigServer *)self setLastScanTime:v3];

  [(SUCoreConfigServer *)self setNextScanTime:0];
  [(SUCoreConfigServer *)self _stateSafeUpdateState];
  id v4 = [(SUCoreConfigServer *)self scheduledActivityName];
  id v5 = [MEMORY[0x263F77DE8] sharedLogger];
  BOOL v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    __int16 v9 = v4;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] ResetState: Unregistering all activities with name: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (_stateSafeResetState_schedulerDefaultOnce != -1) {
    dispatch_once(&_stateSafeResetState_schedulerDefaultOnce, &__block_literal_global_559);
  }
  if (_stateSafeResetState_useXPCActivityScheduler)
  {
    uint64_t v7 = +[SUCoreXPCActivityManager sharedInstance];
    [v7 unscheduleActivity:v4];
  }
  else
  {
    uint64_t v7 = +[SUCoreActivityScheduler sharedInstance];
    [v7 unregisterActivitiesWithName:v4];
  }
}

void __42__SUCoreConfigServer__stateSafeResetState__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)CFPreferencesCopyValue(@"SUUseXPCActivityScheduler", @"com.apple.softwareupdateservicesd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  CFBooleanRef v1 = v0;
  if (v0 && (CFTypeID v2 = CFGetTypeID(v0), v2 == CFBooleanGetTypeID()))
  {
    int v3 = CFBooleanGetValue(v1) == 1;
    _stateSafeResetState_useXPCActivityScheduler = v3;
  }
  else
  {
    int v3 = _stateSafeResetState_useXPCActivityScheduler;
  }
  id v4 = [MEMORY[0x263F77DE8] sharedLogger];
  id v5 = [v4 oslog];

  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v6) {
      goto LABEL_11;
    }
    __int16 v10 = 0;
    uint64_t v7 = "[SUCoreConfig]: Using SUCoreXPCActivityScheduler for scheduling";
    int v8 = (uint8_t *)&v10;
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    __int16 v9 = 0;
    uint64_t v7 = "[SUCoreConfig]: Using default scheduler for scheduling";
    int v8 = (uint8_t *)&v9;
  }
  _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_11:

  if (v1) {
    CFRelease(v1);
  }
}

- (void)_stateSafeUpdateState
{
  int v3 = [(SUCoreConfigServer *)self stateMachine];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SUCoreConfigServer *)self persistedState];
  LODWORD(v4) = [v5 loadPersistedState];

  if (v4)
  {
    BOOL v6 = [(SUCoreConfigServer *)self persistedState];
    uint64_t v7 = [(SUCoreConfigServer *)self lastScanTime];
    [v6 persistDate:v7 forKey:@"LastScanTime"];

    id v9 = [(SUCoreConfigServer *)self persistedState];
    int v8 = [(SUCoreConfigServer *)self nextScanTime];
    [v9 persistDate:v8 forKey:@"NextScanTime"];
  }
}

- (id)_stateSafeDetermineNextScanTime
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v3 = [(SUCoreConfigServer *)self stateMachine];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SUCoreConfigServer *)self persistedState];
  LODWORD(v4) = [v5 loadPersistedState];

  if (v4)
  {
    BOOL v6 = [(SUCoreConfigServer *)self persistedState];
    uint64_t v7 = [v6 dateForKey:@"LastScanTime"];

    int v8 = [(SUCoreConfigServer *)self persistedState];
    id v9 = [v8 dateForKey:@"NextScanTime"];
  }
  else
  {
    id v9 = 0;
    uint64_t v7 = 0;
  }
  __int16 v10 = [(SUCoreConfigServer *)self coreConfig];
  char v11 = [v10 getNumberConfigForKey:*MEMORY[0x263F77E48]];

  uint64_t v12 = [(SUCoreConfigServer *)self _nextScanTimeFromDate:v7];
  id v13 = (void *)v12;
  if (v11)
  {
    __int16 v14 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    __int16 v16 = [v14 dateWithTimeIntervalSinceNow:v15 * 60.0];

    id v17 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v18 = [v17 oslog];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [MEMORY[0x263F77D78] stringFromDate:v16];
      int v39 = 138543618;
      v40 = v11;
      __int16 v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_20C8EA000, v18, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] NextScanTime: Using nextScanTime scan interval override (%{public}@) for proposed scan: %{public}@", (uint8_t *)&v39, 0x16u);
    }
  }
  else
  {
    __int16 v16 = (void *)v12;
  }
  uint64_t v20 = [MEMORY[0x263EFF910] date];
  uint64_t v21 = [v9 compare:v20];

  if (v21 == -1)
  {
    uint64_t v31 = [MEMORY[0x263F77DE8] sharedLogger];
    __int16 v32 = [v31 oslog];

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [MEMORY[0x263F77D78] stringFromDate:v9];
      int v39 = 138543362;
      v40 = v33;
      _os_log_impl(&dword_20C8EA000, v32, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] NextScanTime: Previous nextScanTime (%{public}@) has already passed, removing now", (uint8_t *)&v39, 0xCu);
    }
    id v9 = 0;
  }
  else if (v9 && [v9 compare:v16] == -1)
  {
    [(SUCoreConfigServer *)self setNextScanTime:v9];
    uint64_t v22 = [MEMORY[0x263F77DE8] sharedLogger];
    int64_t v23 = [v22 oslog];

    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    id v24 = (void *)MEMORY[0x263F77D78];
    __int16 v25 = [(SUCoreConfigServer *)self nextScanTime];
    uint64_t v26 = [v24 stringFromDate:v25];
    __int16 v27 = (void *)MEMORY[0x263F77D78];
    id v28 = [MEMORY[0x263EFF910] date];
    __int16 v29 = [v27 stringFromDate:v28];
    int v39 = 138543618;
    v40 = v26;
    __int16 v41 = 2114;
    v42 = v29;
    uint64_t v30 = "[SUCoreConfig] NextScanTime: Using nextScanTime (via previous): %{public}@, current time: %{public}@";
    goto LABEL_19;
  }
  [(SUCoreConfigServer *)self setNextScanTime:v16];
  uint64_t v34 = [MEMORY[0x263F77DE8] sharedLogger];
  int64_t v23 = [v34 oslog];

  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_20;
  }
  __int16 v35 = (void *)MEMORY[0x263F77D78];
  __int16 v25 = [(SUCoreConfigServer *)self nextScanTime];
  uint64_t v26 = [v35 stringFromDate:v25];
  id v36 = (void *)MEMORY[0x263F77D78];
  id v28 = [MEMORY[0x263EFF910] date];
  __int16 v29 = [v36 stringFromDate:v28];
  int v39 = 138543618;
  v40 = v26;
  __int16 v41 = 2114;
  v42 = v29;
  uint64_t v30 = "[SUCoreConfig] NextScanTime: Using nextScanTime (via proposed): %{public}@, current time: %{public}@";
LABEL_19:
  _os_log_impl(&dword_20C8EA000, v23, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, 0x16u);

LABEL_20:
  [(SUCoreConfigServer *)self _stateSafeUpdateState];
  __int16 v37 = [(SUCoreConfigServer *)self nextScanTime];

  return v37;
}

- (id)_nextScanTimeFromDate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F77DA0] sharedDevice];
  if ([v4 isBootedOSSecureInternal]) {
    double v5 = 86400.0;
  }
  else {
    double v5 = 604800.0;
  }

  BOOL v6 = (void *)MEMORY[0x263EFF910];
  if (v3)
  {
    uint64_t v7 = [MEMORY[0x263EFF910] dateWithTimeInterval:v3 sinceDate:v5];
  }
  else
  {
    int v8 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = [v6 dateWithTimeInterval:v8 sinceDate:v5];
  }

  return v7;
}

- (void)_stateSafeSendScheduledEventWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  BOOL v6 = [(SUCoreConfigServer *)self stateMachine];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  [(SUCoreConfigServer *)self _stateSafeSendNewEvent:@"SUCoreConfigScheduled" success:v4 error:v8];
}

- (void)_stateSafeSendInstalledEventWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  BOOL v6 = [(SUCoreConfigServer *)self stateMachine];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  [(SUCoreConfigServer *)self _stateSafeSendNewEvent:@"SUCoreConfigInstalled" success:v4 error:v8];
}

- (void)_stateSafeSendNewEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(SUCoreConfigServer *)self stateMachine];
  char v11 = [v10 extendedStateQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (id)*MEMORY[0x263F780C8];
  if (!a4)
  {
    id v13 = NSString;
    __int16 v14 = [v9 domain];
    double v15 = [v13 stringWithFormat:@"%@ - %ld", v14, objc_msgSend(v9, "code")];

    __int16 v16 = [v9 domain];
    LODWORD(v14) = [v16 isEqualToString:*MEMORY[0x263F78058]];

    if (v14)
    {
      id v17 = objc_msgSend(MEMORY[0x263F77D78], "errorNameForCode:", objc_msgSend(v9, "code"));
      uint64_t v18 = [v15 stringByAppendingFormat:@" (%@)", v17];

      double v15 = (void *)v18;
    }
    id v19 = [v9 userInfo];
    uint64_t v20 = *MEMORY[0x263F08608];
    uint64_t v21 = [v19 safeObjectForKey:*MEMORY[0x263F08608] ofClass:objc_opt_class()];

    if (v21)
    {
      uint64_t v22 = [v9 userInfo];
      int64_t v23 = [v22 safeObjectForKey:v20 ofClass:objc_opt_class()];
      id v24 = [v23 checkedNameForCode];
      id v12 = [v15 stringByAppendingFormat:@" [%@]", v24];
    }
    else
    {
      id v12 = v15;
    }
  }
  id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v25 setSafeObject:v12 forKey:*MEMORY[0x263F780B8]];
  v66 = v9;
  uint64_t v26 = [v9 checkedSummary];
  [v25 setSafeObject:v26 forKey:*MEMORY[0x263F78090]];

  [v25 setSafeObject:v8 forKey:*MEMORY[0x263F780B0]];
  __int16 v27 = [(SUCoreConfigServer *)self _stateSafeLoadUUIDString];
  [v25 setSafeObject:v27 forKey:*MEMORY[0x263F78130]];

  id v28 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  [v25 setSafeObject:v28 forKey:@"compatibilityVersion"];

  __int16 v29 = (void *)MEMORY[0x263F77D78];
  uint64_t v30 = [(SUCoreConfigServer *)self lastScanTime];
  uint64_t v31 = [v29 stringFromDate:v30];
  [v25 setSafeObject:v31 forKey:@"lastScanTime"];

  __int16 v32 = (void *)MEMORY[0x263F77D78];
  uint64_t v33 = [(SUCoreConfigServer *)self nextScanTime];
  uint64_t v34 = [v32 stringFromDate:v33];
  [v25 setSafeObject:v34 forKey:@"nextScanTime"];

  [v25 setSafeObject:@"CoreDuet" forKey:@"scannerMethod"];
  __int16 v35 = NSString;
  id v36 = [(SUCoreConfigServer *)self lastLocatedAsset];
  uint64_t v37 = [v36 assetId];
  v38 = (void *)v37;
  if (v37) {
    int v39 = (__CFString *)v37;
  }
  else {
    int v39 = @"none";
  }
  v40 = [v35 stringWithFormat:@"%@", v39];
  [v25 setSafeObject:v40 forKey:@"lastLocatedAssetId"];

  __int16 v41 = NSString;
  v42 = [(SUCoreConfigServer *)self lastLocatedAsset];
  uint64_t v43 = [v42 attributes];
  uint64_t v44 = [v43 safeStringForKey:@"GenerationDate"];
  __int16 v45 = v8;
  v46 = (void *)v44;
  if (v44) {
    uint64_t v47 = (__CFString *)v44;
  }
  else {
    uint64_t v47 = @"none";
  }
  uint64_t v48 = [v41 stringWithFormat:@"%@", v47];
  [v25 setSafeObject:v48 forKey:@"lastLocatedAssetGenerationDate"];

  v49 = NSString;
  v50 = [(SUCoreConfigServer *)self lastLocatedAsset];
  v51 = [v50 attributes];
  uint64_t v52 = [v51 safeStringForKey:@"UniqueID"];
  v53 = (void *)v52;
  if (v52) {
    v54 = (__CFString *)v52;
  }
  else {
    v54 = @"none";
  }
  id v55 = [v49 stringWithFormat:@"%@", v54];
  [v25 setSafeObject:v55 forKey:@"lastLocatedAssetUniqueID"];

  __int16 v56 = +[SUCoreConfigServer allowedServerProjects];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  void v67[2] = __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke;
  v67[3] = &unk_2640DE130;
  id v57 = v25;
  id v68 = v57;
  [v56 enumerateObjectsUsingBlock:v67];

  id v58 = [MEMORY[0x263F77DE8] sharedLogger];
  v59 = [v58 oslog];

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v70 = v45;
    __int16 v71 = 2114;
    id v72 = v12;
    _os_log_impl(&dword_20C8EA000, v59, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Sending event '%{public}@' with result: %{public}@", buf, 0x16u);
  }

  id v60 = objc_alloc(MEMORY[0x263F77DB8]);
  id v61 = objc_alloc(NSURL);
  v62 = (void *)[v61 initWithString:*MEMORY[0x263F78180]];
  uint64_t v63 = (void *)[v60 initWithEventDictionary:v57 extendingWith:0 reportingToServer:v62];

  int64_t v64 = [MEMORY[0x263F77DC0] sharedReporter];
  v65 = [v63 getAugmentedEvent];
  [v64 sendEvent:v65];
}

void __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F77D90]) initWithProjectName:v3];
  double v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"|"];
  BOOL v6 = [v4 getConfig];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke_2;
  id v13 = &unk_2640DE108;
  id v7 = v5;
  id v14 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v10];

  if ((unint64_t)[v7 length] >= 2)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [NSString stringWithFormat:@"currentConfig%@", v3, v10, v11, v12, v13];
    [v8 setSafeObject:v7 forKey:v9];
  }
}

void __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [*(id *)(a1 + 32) appendFormat:@"%@=%@|", v11, v5];
  }
  else
  {
    char v6 = objc_opt_respondsToSelector();
    id v7 = *(void **)(a1 + 32);
    if (v6)
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      [v7 appendFormat:@"%@=%@|", v11, v9];
    }
    else
    {
      [v7 appendFormat:@"%@=unknown|", v11, v10];
    }
  }
}

- (id)_stateSafeLoadUUIDString
{
  id v3 = [(SUCoreConfigServer *)self stateMachine];
  BOOL v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SUCoreConfigServer *)self persistedState];
  LODWORD(v4) = [v5 loadPersistedState];

  if (v4)
  {
    char v6 = [(SUCoreConfigServer *)self persistedState];
    id v7 = [v6 stringForKey:@"UUIDString"];
    [(SUCoreConfigServer *)self setUuidString:v7];
  }
  id v8 = [(SUCoreConfigServer *)self uuidString];

  if (!v8)
  {
    id v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v9 UUIDString];
    [(SUCoreConfigServer *)self setUuidString:v10];

    id v11 = [(SUCoreConfigServer *)self persistedState];
    LODWORD(v10) = [v11 loadPersistedState];

    if (v10)
    {
      id v12 = [(SUCoreConfigServer *)self persistedState];
      id v13 = [(SUCoreConfigServer *)self uuidString];
      [v12 persistString:v13 forKey:@"UUIDString"];
    }
  }

  return [(SUCoreConfigServer *)self uuidString];
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSDate)lastScanTime
{
  return self->_lastScanTime;
}

- (void)setLastScanTime:(id)a3
{
}

- (NSDate)nextScanTime
{
  return self->_nextScanTime;
}

- (void)setNextScanTime:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (MAAsset)lastLocatedAsset
{
  return self->_lastLocatedAsset;
}

- (void)setLastLocatedAsset:(id)a3
{
}

- (SUCoreFSM)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (SUCorePersistedState)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
}

- (NSMutableDictionary)listenerDelegates
{
  return self->_listenerDelegates;
}

- (void)setListenerDelegates:(id)a3
{
}

- (SUCoreConfig)coreConfig
{
  return self->_coreConfig;
}

- (void)setCoreConfig:(id)a3
{
}

- (OS_dispatch_queue)clientDelegateQueue
{
  return self->_clientDelegateQueue;
}

- (void)setClientDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDelegateQueue, 0);
  objc_storeStrong((id *)&self->_coreConfig, 0);
  objc_storeStrong((id *)&self->_listenerDelegates, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_lastLocatedAsset, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nextScanTime, 0);
  objc_storeStrong((id *)&self->_lastScanTime, 0);

  objc_storeStrong((id *)&self->_uuidString, 0);
}

+ (void)persistedStateFilePath
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  id v3 = @"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "[SUCoreConfig] PersistedStateFilePath: Failed to create cache directory at path: %{public}@, error: %{public}@", (uint8_t *)&v2, 0x16u);
}

void __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_0(&dword_20C8EA000, v0, v1, "[SUCoreConfig] Catalog: Failed to download software update configuration catalog: %{public}@", v2, v3, v4, v5, v6);
}

- (void)actionConfigQueryAsset:error:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_0(&dword_20C8EA000, v0, v1, "[SUCoreConfig] Query: Failed to locate config: %{public}@", v2, v3, v4, v5, v6);
}

- (void)actionConfigDownloadAsset:error:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_0(&dword_20C8EA000, v0, v1, "[SUCoreConfig] Download: Failed to download software update configuration asset: %{public}@", v2, v3, v4, v5, v6);
}

- (void)actionConfigAdjustSettings:error:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_0(&dword_20C8EA000, v0, v1, "[SUCoreConfig] Adjust: Failed adjust configuration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)actionConfigAdjustSettings:error:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_0(&dword_20C8EA000, v0, v1, "[SUCoreConfig] Adjust: Failed to adjust configuration: %{public}@", v2, v3, v4, v5, v6);
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_0(&dword_20C8EA000, v0, v1, "[SUCoreConfig] Adjust: Not processing non-allowed project '%{public}@'", v2, v3, v4, v5, v6);
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_518_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_20C8EA000, v1, OS_LOG_TYPE_ERROR, "[SUCoreConfig] Adjust: Not processing non-allowed key '%{public}@' for project '%{public}@'", v2, 0x16u);
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_520_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_0(&dword_20C8EA000, v0, v1, "[SUCoreConfig] Purge: Purge (MAPurgeAllExceptGivenIds) failed to complete successfully: %{public}@", v2, v3, v4, v5, v6);
}

@end