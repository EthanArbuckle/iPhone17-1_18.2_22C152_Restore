@interface SUCoreXPCActivityManager
+ (id)sharedInstance;
- (BOOL)_isActivityTrackedButUnsheduledInternal:(id)a3;
- (BOOL)addActivityInfoToPersistedState:(id)a3;
- (BOOL)isActivityScheduled:(id)a3;
- (BOOL)isActivityScheduledInternal:(id)a3;
- (BOOL)isActivityTrackedButUnsheduled:(id)a3;
- (BOOL)removeActivityFromPersistedState:(id)a3;
- (NSMutableArray)activities;
- (NSString)managerName;
- (OS_dispatch_queue)activityQueue;
- (OS_dispatch_queue)managerQueue;
- (OS_dispatch_queue)persistedStateDispatchQueue;
- (SUCoreLog)logger;
- (SUCorePersistedState)persistedState;
- (SUCoreXPCActivityManager)initWithNameAndPersistedStateFilePath:(id)a3 persistedStateFilePath:(id)a4;
- (id)_getActivityForNameInternal:(id)a3;
- (id)copyOptionsForActivity:(id)a3;
- (id)description;
- (id)getActivityForName:(id)a3;
- (id)getExpectedRunDateForActivity:(id)a3;
- (int)scheduleActivity:(id)a3;
- (int)unscheduleActivity:(id)a3;
- (void)eventHandler:(id)a3;
- (void)setActivities:(id)a3;
- (void)setActivityQueue:(id)a3;
- (void)setLogger:(id)a3;
- (void)setManagerQueue:(id)a3;
- (void)setPersistedState:(id)a3;
- (void)setPersistedStateDispatchQueue:(id)a3;
@end

@implementation SUCoreXPCActivityManager

- (void)eventHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  uint64_t v5 = xpc_activity_copy_identifier();
  if (v5)
  {
    v6 = [(SUCoreXPCActivityManager *)self managerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SUCoreXPCActivityManager_eventHandler___block_invoke;
    block[3] = &unk_2640DCF08;
    block[4] = self;
    block[5] = &v16;
    block[6] = v5;
    dispatch_sync(v6, block);

    if (v17[5])
    {
      v7 = [(SUCoreXPCActivityManager *)self activityQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __41__SUCoreXPCActivityManager_eventHandler___block_invoke_49;
      v12[3] = &unk_2640DC360;
      v14 = &v16;
      v13 = v4;
      dispatch_sync(v7, v12);

      v8 = v13;
    }
    else
    {
      v11 = [(SUCoreXPCActivityManager *)self logger];
      v8 = [v11 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v23 = v5;
        _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "No registered activity found for event %s", buf, 0xCu);
      }
    }
  }
  else
  {
    v9 = [(SUCoreXPCActivityManager *)self logger];
    v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "Event handler failed to copy identifier for event. Not invoking any callbacks", buf, 2u);
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __41__SUCoreXPCActivityManager_eventHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "activities", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v8 = [v7 activityName];
        v9 = [NSString stringWithUTF8String:*(void *)(a1 + 48)];
        int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          v11 = [*(id *)(a1 + 32) logger];
          v12 = [v11 oslog];

          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [v7 activityName];
            *(_DWORD *)buf = 138412290;
            v22 = v13;
            _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "Invoking activity handler for %@", buf, 0xCu);
          }
          uint64_t v14 = [v7 handler];
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

uint64_t __41__SUCoreXPCActivityManager_eventHandler___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___instance_0;

  return v2;
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];

  if (v1)
  {
    v2 = [v1 componentsSeparatedByString:@"."];
    uint64_t v3 = [v2 lastObject];

    if (!v3
      || (id v4 = (id)[[NSString alloc] initWithFormat:@"%@%@.SUCoreXPCActivity.state", @"/var/mobile/Library/SoftwareUpdateCore/", v3]) == 0)
    {
      uint64_t v5 = [MEMORY[0x263F77DE8] sharedLogger];
      v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_2(v6);
      }

      id v4 = v1;
    }
    v7 = v4;
  }
  else
  {
    v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 executablePath];

    if (v9
      && ([v9 componentsSeparatedByString:@"/"],
          int v10 = objc_claimAutoreleasedReturnValue(),
          [v10 lastObject],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          v10,
          v3))
    {
      v7 = (void *)[[NSString alloc] initWithFormat:@"%@%@.SUCoreXPCActivity.state", @"/var/mobile/Library/SoftwareUpdateCore/", v3];

      if (v7) {
        goto LABEL_14;
      }
    }
    else
    {

      uint64_t v3 = 0;
    }
    v7 = (void *)[[NSString alloc] initWithFormat:@"%@%@", @"/var/mobile/Library/SoftwareUpdateCore/", @"SUCoreXPCActivitySchedulerDefaultSharedState.state"];
    v11 = [MEMORY[0x263F77DA8] sharedDiag];
    v12 = [NSString stringWithFormat:@"Failed to create a file path from bundleIdentifier, falling back to the default of %@", v7];
    [v11 trackAnomaly:@"SUCoreXPCActivityScheduler" forReason:v12 withResult:8116 withError:0];
  }
LABEL_14:
  v13 = [NSString stringWithFormat:@"com.apple.sucoreXPCActivityScheduler.%@", v3];
  uint64_t v14 = [[SUCoreXPCActivityManager alloc] initWithNameAndPersistedStateFilePath:v13 persistedStateFilePath:v7];
  uint64_t v15 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v14;

  uint64_t v16 = [MEMORY[0x263F77DE8] sharedLogger];
  long long v17 = [v16 oslog];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_1((uint64_t)v13, (uint64_t)v7, v17);
  }
}

- (SUCoreXPCActivityManager)initWithNameAndPersistedStateFilePath:(id)a3 persistedStateFilePath:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v39 = a4;
  v54.receiver = self;
  v54.super_class = (Class)SUCoreXPCActivityManager;
  v7 = [(SUCoreXPCActivityManager *)&v54 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_managerName, a3);
    v9 = (void *)[objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUCoreXPCActivityManager"];
    [(SUCoreXPCActivityManager *)v8 setLogger:v9];

    memset(v72, 0, sizeof(v72));
    long long v71 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    *(_OWORD *)label = 0u;
    int v10 = [NSString stringWithFormat:@"%s.%@", "com.apple.sucore.sucoreactivitymanagerqueue", v40];
    [v10 getCString:label maxLength:254 encoding:4];
    dispatch_queue_t v11 = dispatch_queue_create(label, 0);
    managerQueue = v8->_managerQueue;
    v8->_managerQueue = (OS_dispatch_queue *)v11;

    memset(v72, 0, sizeof(v72));
    long long v71 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    *(_OWORD *)label = 0u;
    v13 = [NSString stringWithFormat:@"%s.%@", "com.apple.sucorexpcactivitymanager.persistedStateQueue", v40];

    [v13 getCString:label maxLength:254 encoding:4];
    dispatch_queue_t v14 = dispatch_queue_create(label, 0);
    persistedStateDispatchQueue = v8->_persistedStateDispatchQueue;
    v8->_persistedStateDispatchQueue = (OS_dispatch_queue *)v14;

    memset(v72, 0, sizeof(v72));
    long long v71 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    *(_OWORD *)label = 0u;
    v38 = [NSString stringWithFormat:@"%s.%@", "com.apple.sucorexpcactivitymanager.activityQueue", v40];

    [v38 getCString:label maxLength:254 encoding:4];
    dispatch_queue_t v16 = dispatch_queue_create(label, 0);
    activityQueue = v8->_activityQueue;
    v8->_activityQueue = (OS_dispatch_queue *)v16;

    long long v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activities = v8->_activities;
    v8->_activities = v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x263F77DF8]) initWithDispatchQueue:v8->_persistedStateDispatchQueue withPersistencePath:v39 forPolicyVersion:@"1.0"];
    persistedState = v8->_persistedState;
    v8->_persistedState = (SUCorePersistedState *)v20;

    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__90;
    v52 = __Block_byref_object_dispose__91;
    id v53 = 0;
    v22 = [(SUCoreXPCActivityManager *)v8 persistedStateDispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__SUCoreXPCActivityManager_initWithNameAndPersistedStateFilePath_persistedStateFilePath___block_invoke;
    block[3] = &unk_2640DC310;
    uint64_t v23 = v8;
    v46 = v23;
    v47 = &v48;
    dispatch_sync(v22, block);

    if (v49[5])
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v24 = (id)v49[5];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v57 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(SUCorePersistedState **)(*((void *)&v41 + 1) + 8 * i);
            v29 = [v23[2] oslog];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v28;
              _os_log_impl(&dword_20C8EA000, v29, OS_LOG_TYPE_DEFAULT, "Found perisistedActivity %@. Unregistering from XPC", buf, 0xCu);
            }

            v30 = objc_alloc_init(SUCoreXPCActivity);
            v31 = [(SUCorePersistedState *)v28 activityOptions];
            [(SUCoreXPCActivity *)v30 setActivityOptions:v31];

            v32 = [(SUCorePersistedState *)v28 activityName];
            [(SUCoreXPCActivity *)v30 setActivityName:v32];

            [(SUCoreXPCActivity *)v30 setHandler:0];
            [(SUCoreXPCActivity *)v30 setIsRegisteredWithXPC:0];
            bzero(buf, 0x400uLL);
            v33 = [(SUCorePersistedState *)v28 activityName];
            [v33 getCString:buf maxLength:1023 encoding:4];

            xpc_activity_unregister((const char *)buf);
            [(NSMutableArray *)v8->_activities addObject:v30];
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v57 count:16];
        }
        while (v25);
      }
    }
    v34 = [v23 logger];
    v35 = [v34 oslog];

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v8->_persistedState;
      *(_DWORD *)buf = 138412290;
      v56 = v36;
      _os_log_impl(&dword_20C8EA000, v35, OS_LOG_TYPE_DEFAULT, "Loaded persisted State: %@", buf, 0xCu);
    }

    _Block_object_dispose(&v48, 8);
  }

  return v8;
}

void __89__SUCoreXPCActivityManager_initWithNameAndPersistedStateFilePath_persistedStateFilePath___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) loadPersistedState];
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v13 = (id)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 56) secureCodedObjectForKey:@"ActivityArray" ofClass:objc_opt_class() encodeClasses:v13];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (BOOL)_isActivityTrackedButUnsheduledInternal:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  dispatch_assert_queue_V2(v5);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_activities;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x263F77D78];
        dispatch_queue_t v14 = objc_msgSend(v12, "activityName", (void)v17);
        if ([v13 stringIsEqual:v14 to:v4])
        {
          char v15 = [v12 isRegisteredWithXPC];

          v9 |= v15 ^ 1;
        }
        else
        {
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (BOOL)isActivityTrackedButUnsheduled:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUCoreXPCActivityManager_isActivityTrackedButUnsheduled___block_invoke;
  block[3] = &unk_2640DCF30;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __59__SUCoreXPCActivityManager_isActivityTrackedButUnsheduled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isActivityTrackedButUnsheduledInternal:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)isActivityScheduledInternal:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  dispatch_assert_queue_V2(v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_activities;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "activityName", (void)v16);
        if ([v13 isEqualToString:v4])
        {
          char v14 = [v12 isRegisteredWithXPC];

          v9 |= v14;
        }
        else
        {
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (BOOL)isActivityScheduled:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUCoreXPCActivityManager_isActivityScheduled___block_invoke;
  block[3] = &unk_2640DCF30;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __48__SUCoreXPCActivityManager_isActivityScheduled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isActivityScheduledInternal:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)addActivityInfoToPersistedState:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__90;
  v32[4] = __Block_byref_object_dispose__91;
  id v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__90;
  v30 = __Block_byref_object_dispose__91;
  id v31 = 0;
  id v6 = objc_alloc_init(SUCorePersistedActivity);
  uint64_t v7 = [v4 activityOptions];
  [(SUCorePersistedActivity *)v6 setActivityOptions:v7];

  uint64_t v8 = [v4 activityName];
  [(SUCorePersistedActivity *)v6 setActivityName:v8];

  id v9 = [(SUCoreXPCActivityManager *)self persistedStateDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke;
  block[3] = &unk_2640DCF58;
  void block[4] = self;
  void block[5] = v32;
  block[6] = &v26;
  dispatch_sync(v9, block);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = (id)v27[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v38 count:16];
  if (v11)
  {
    v12 = 0;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v15 isEqual:v6])
        {
          id v16 = v15;

          v12 = v16;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v38 count:16];
    }
    while (v11);

    if (v12) {
      [(id)v27[5] removeObject:v12];
    }
  }
  else
  {

    v12 = 0;
  }
  [(id)v27[5] addObject:v6];
  long long v17 = [(SUCoreXPCActivityManager *)self persistedStateDispatchQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke_2;
  v20[3] = &unk_2640DCF80;
  v20[4] = self;
  v20[5] = &v26;
  v20[6] = &v34;
  dispatch_sync(v17, v20);

  BOOL v18 = *((unsigned char *)v35 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [*(id *)(a1[4] + 56) secureCodedObjectForKey:@"ActivityArray" ofClass:objc_opt_class() encodeClasses:v10];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(a1[5] + 8) + 40) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = (id)[*(id *)(*(void *)(a1[5] + 8) + 40) mutableCopy];
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 56) persistSecureCodedObject:*(void *)(*(void *)(a1[5] + 8) + 40) forKey:@"ActivityArray" shouldPersist:1];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return result;
}

- (BOOL)removeActivityFromPersistedState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__90;
  v13[4] = __Block_byref_object_dispose__91;
  id v14 = 0;
  id v6 = [(SUCoreXPCActivityManager *)self persistedStateDispatchQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SUCoreXPCActivityManager_removeActivityFromPersistedState___block_invoke;
  v9[3] = &unk_2640DCFA8;
  uint64_t v11 = v13;
  v12 = &v15;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_sync(v6, v9);

  LOBYTE(v4) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return (char)v4;
}

void __61__SUCoreXPCActivityManager_removeActivityFromPersistedState___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  id v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) secureCodedObjectForKey:@"ActivityArray" ofClass:objc_opt_class() encodeClasses:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = objc_alloc_init(SUCorePersistedActivity);
    id v9 = [*(id *)(a1 + 40) activityOptions];
    [(SUCorePersistedActivity *)v8 setActivityOptions:v9];

    id v10 = [*(id *)(a1 + 40) activityName];
    [(SUCorePersistedActivity *)v8 setActivityName:v10];

    uint64_t v11 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutableCopy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v12);
          }
          char v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v18 isEqual:v8])
          {
            id v19 = v18;

            uint64_t v15 = v19;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }
    else
    {
      uint64_t v15 = 0;
    }

    [v12 removeObject:v15];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    long long v20 = [*(id *)(a1 + 32) logger];
    long long v21 = [v20 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v21, OS_LOG_TYPE_DEFAULT, "No persisted activities found", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (int)scheduleActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 3;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke;
  block[3] = &unk_2640DCFF8;
  id v9 = v4;
  id v10 = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return (int)v4;
}

void __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([*(id *)(a1 + 32) handler], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) activityName],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    uint64_t v12 = [*(id *)(a1 + 40) logger];
    uint64_t v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = @"OK";
      }
      else {
        uint64_t v14 = @"Invalid";
      }
      int v15 = [*(id *)(a1 + 32) handler];
      if (v15) {
        uint64_t v16 = @"OK";
      }
      else {
        uint64_t v16 = @"Invalid";
      }
      uint64_t v17 = [*(id *)(a1 + 32) activityName];
      *(_DWORD *)buf = 138412802;
      if (v17) {
        char v18 = @"OK";
      }
      else {
        char v18 = @"Invalid";
      }
      long long v71 = v14;
      __int16 v72 = 2112;
      uint64_t v73 = v16;
      __int16 v74 = 2112;
      v75 = v18;
      _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "The activity object passed to scheduleActivity is invalid : Class : %@ Handler: %@ Name: %@", buf, 0x20u);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    int v11 = 4;
    goto LABEL_20;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) activityName];
  LODWORD(v5) = [v5 isActivityScheduledInternal:v6];

  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) logger];
    uint64_t v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) activityName];
      *(_DWORD *)buf = 138412290;
      long long v71 = v9;
      _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "The activity named %@ is already scheduled", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    int v11 = 5;
LABEL_20:
    *(_DWORD *)(v10 + 24) = v11;
    return;
  }
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x263EF81C0], 0);
  long long v20 = [*(id *)(a1 + 32) activityOptions];
  int v21 = [v20 priority];
  long long v22 = (const char **)MEMORY[0x263EF8280];
  if (!v21)
  {

    goto LABEL_25;
  }
  long long v23 = [*(id *)(a1 + 32) activityOptions];
  int v24 = [v23 priority];

  if (v24 == 2) {
LABEL_25:
  }
    xpc_dictionary_set_string(v19, *v22, (const char *)*MEMORY[0x263EF8290]);
  long long v25 = [*(id *)(a1 + 32) activityOptions];
  int v26 = [v25 priority];

  if (v26 == 1) {
    xpc_dictionary_set_string(v19, *v22, (const char *)*MEMORY[0x263EF8288]);
  }
  v27 = [*(id *)(a1 + 32) activityOptions];
  uint64_t v28 = [v27 batteryLevelGreaterThan];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [*(id *)(a1 + 32) activityOptions];
    id v31 = [v30 batteryLevelGreaterThan];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_32;
    }
    id v33 = (const char *)*MEMORY[0x263EF82C0];
    v27 = [*(id *)(a1 + 32) activityOptions];
    uint64_t v34 = [v27 batteryLevelGreaterThan];
    xpc_dictionary_set_int64(v19, v33, [v34 integerValue]);
  }
LABEL_32:
  v35 = [*(id *)(a1 + 32) activityOptions];
  int v36 = [v35 plugInState];

  if (v36)
  {
    char v37 = [*(id *)(a1 + 32) activityOptions];
    BOOL v38 = [v37 plugInState] == 2;

    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x263EF8180], v38);
  }
  uint64_t v39 = [*(id *)(a1 + 32) activityOptions];
  int v40 = [v39 networkState];

  if (v40)
  {
    long long v41 = [*(id *)(a1 + 32) activityOptions];
    BOOL v42 = [v41 networkState] == 2;

    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x263EF82D0], v42);
  }
  long long v43 = [*(id *)(a1 + 32) activityOptions];
  uint64_t v44 = [v43 runDate];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [*(id *)(a1 + 32) activityOptions];
    v47 = [v46 runDate];
    objc_opt_class();
    char v48 = objc_opt_isKindOfClass();

    double v49 = 0.0;
    if ((v48 & 1) == 0) {
      goto LABEL_42;
    }
    uint64_t v50 = [*(id *)(a1 + 32) activityOptions];
    v51 = [v50 runDate];
    [v51 timeIntervalSinceNow];
    double v49 = v52;

    if (v49 >= 0.0) {
      goto LABEL_42;
    }
    id v53 = [*(id *)(a1 + 40) logger];
    long long v43 = [v53 oslog];

    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v54 = [*(id *)(a1 + 32) activityName];
      v55 = [*(id *)(a1 + 32) activityOptions];
      v56 = [v55 runDate];
      *(_DWORD *)buf = 138412546;
      long long v71 = v54;
      __int16 v72 = 2112;
      uint64_t v73 = v56;
      _os_log_impl(&dword_20C8EA000, v43, OS_LOG_TYPE_DEFAULT, "The activity named %@ has a requested run date which is in the past(%@). Scheduling to run immediately", buf, 0x16u);
    }
  }

  double v49 = 0.0;
LABEL_42:
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x263EF81A0], (uint64_t)v49);
  bzero(buf, 0x400uLL);
  v57 = [*(id *)(a1 + 32) activityName];
  [v57 getCString:buf maxLength:1023 encoding:4];

  int v58 = buf[0];
  long long v59 = [*(id *)(a1 + 40) logger];
  long long v60 = [v59 oslog];

  BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
  if (v58)
  {
    if (v61)
    {
      long long v62 = [*(id *)(a1 + 32) activityName];
      *(_DWORD *)long long v68 = 138412290;
      long long v69 = v62;
      _os_log_impl(&dword_20C8EA000, v60, OS_LOG_TYPE_DEFAULT, "Registering Activity %@", v68, 0xCu);
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke_107;
    handler[3] = &unk_2640DCFD0;
    handler[4] = *(void *)(a1 + 40);
    xpc_activity_register((const char *)buf, v19, handler);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    [*(id *)(*(void *)(a1 + 40) + 48) addObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) addActivityInfoToPersistedState:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setIsRegisteredWithXPC:1];
    long long v63 = [*(id *)(a1 + 40) logger];
    long long v64 = [v63 oslog];

    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      long long v65 = *(void **)(a1 + 32);
      *(_DWORD *)long long v68 = 138412290;
      long long v69 = v65;
      _os_log_impl(&dword_20C8EA000, v64, OS_LOG_TYPE_DEFAULT, "Activity successfully registered : {%@}", v68, 0xCu);
    }
  }
  else
  {
    if (v61)
    {
      long long v66 = *(void **)(a1 + 32);
      *(_DWORD *)long long v68 = 138412290;
      long long v69 = v66;
      _os_log_impl(&dword_20C8EA000, v60, OS_LOG_TYPE_DEFAULT, "Failed to register activity since we could not extract its name: {%@}", v68, 0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 4;
  }
}

uint64_t __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke_107(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) eventHandler:a2];
}

- (int)unscheduleActivity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 6;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUCoreXPCActivityManager_unscheduleActivity___block_invoke;
  block[3] = &unk_2640DCFF8;
  void block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

void __47__SUCoreXPCActivityManager_unscheduleActivity___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isActivityScheduledInternal:*(void *)(a1 + 40)] & 1) != 0
    || [*(id *)(a1 + 32) _isActivityTrackedButUnsheduledInternal:*(void *)(a1 + 40)])
  {
    bzero(identifier, 0x400uLL);
    [*(id *)(a1 + 40) getCString:identifier maxLength:1023 encoding:4];
    if (identifier[0])
    {
      xpc_activity_unregister(identifier);
      uint64_t v2 = [*(id *)(a1 + 32) _getActivityForNameInternal:*(void *)(a1 + 40)];
      uint64_t v3 = v2;
      if (v2)
      {
        [v2 setIsRegisteredWithXPC:0];
        [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v3];
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      [*(id *)(a1 + 32) removeActivityFromPersistedState:v3];
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (id)getActivityForName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__90;
  uint64_t v16 = __Block_byref_object_dispose__91;
  id v17 = 0;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUCoreXPCActivityManager_getActivityForName___block_invoke;
  block[3] = &unk_2640DCF30;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __47__SUCoreXPCActivityManager_getActivityForName___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _getActivityForNameInternal:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_getActivityForNameInternal:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_activities;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x263F77D78];
        uint64_t v12 = objc_msgSend(v10, "activityName", (void)v14);
        LOBYTE(v11) = [v11 stringIsEqual:v12 to:v4];

        if (v11)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)copyOptionsForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__90;
  long long v16 = __Block_byref_object_dispose__91;
  id v17 = 0;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUCoreXPCActivityManager_copyOptionsForActivity___block_invoke;
  block[3] = &unk_2640DCFF8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__SUCoreXPCActivityManager_copyOptionsForActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getActivityForNameInternal:*(void *)(a1 + 40)];
  if (v2)
  {
    id v7 = v2;
    uint64_t v3 = [v2 activityOptions];
    uint64_t v4 = [v3 copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v2 = v7;
  }
}

- (id)getExpectedRunDateForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__90;
  long long v16 = __Block_byref_object_dispose__91;
  id v17 = 0;
  uint64_t v5 = [(SUCoreXPCActivityManager *)self managerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SUCoreXPCActivityManager_getExpectedRunDateForActivity___block_invoke;
  block[3] = &unk_2640DCFF8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__SUCoreXPCActivityManager_getExpectedRunDateForActivity___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _getActivityForNameInternal:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 activityOptions];
    uint64_t v5 = [v4 runDate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [*(id *)(a1 + 32) logger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "Activity '%@' has a predicted run date of %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSString stringWithFormat:@"Name: %@ NumActivicies: %lu {\n", self->_managerName, -[NSMutableArray count](self->_activities, "count")];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_activities;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      id v9 = v3;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [NSString stringWithFormat:@"{\n\t%@\n}", *(void *)(*((void *)&v13 + 1) + 8 * v8)];
        uint64_t v3 = [v9 stringByAppendingString:v10];

        ++v8;
        id v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = [v3 stringByAppendingString:@"}"];

  return v11;
}

- (NSString)managerName
{
  return self->_managerName;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (OS_dispatch_queue)managerQueue
{
  return self->_managerQueue;
}

- (void)setManagerQueue:(id)a3
{
}

- (OS_dispatch_queue)persistedStateDispatchQueue
{
  return self->_persistedStateDispatchQueue;
}

- (void)setPersistedStateDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (SUCorePersistedState)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_persistedStateDispatchQueue, 0);
  objc_storeStrong((id *)&self->_managerQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_managerName, 0);
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_20C8EA000, log, OS_LOG_TYPE_ERROR, "Persisted state file path for manager %@ is %@", (uint8_t *)&v3, 0x16u);
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20C8EA000, log, OS_LOG_TYPE_ERROR, "Failed to create failPath. Creating failPath with filename set to bundleIdentifier", v1, 2u);
}

@end