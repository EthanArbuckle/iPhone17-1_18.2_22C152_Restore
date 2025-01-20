@interface SUCoreActivityScheduler
+ (id)sharedInstance;
- (SUCoreActivityScheduler)initWithPersistedStatePath:(id)a3;
- (id)_contextStoreRegisteredActivities;
- (id)_copyRegisteredActivities;
- (id)_queue_registrationForActivity:(id)a3;
- (id)sharedMemoryStore;
- (void)_loadPersistedRegistrationMap;
- (void)_queue_addRegistration:(id)a3 forActivity:(id)a4;
- (void)_queue_persistRegistrationMap;
- (void)_queue_removeRegistrationForActivity:(id)a3;
- (void)_registerRegistration:(id)a3 forActivity:(id)a4;
- (void)_unregisterAllActivitiesWithName:(id)a3;
- (void)_unregisterRegistrationForActivity:(id)a3;
- (void)scheduleActivity:(id)a3 withHandler:(id)a4;
@end

@implementation SUCoreActivityScheduler

- (SUCoreActivityScheduler)initWithPersistedStatePath:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUCoreActivityScheduler;
  v5 = [(SUCoreActivityScheduler *)&v34 init];
  if (!v5) {
    goto LABEL_19;
  }
  if (!objc_opt_class() || !objc_opt_class())
  {
    v28 = [MEMORY[0x263F77DE8] sharedLogger];
    v29 = [v28 oslog];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SUCoreActivityScheduler initWithPersistedStatePath:]();
    }

    v15 = v5;
    v5 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = [MEMORY[0x263F351B0] userContext];
  context = v5->_context;
  v5->_context = (_CDContext *)v6;

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  activityArray = v5->_activityArray;
  v5->_activityArray = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  registrationArray = v5->_registrationArray;
  v5->_registrationArray = v10;

  dispatch_queue_t v12 = dispatch_queue_create("com.apple.softwareupdatecore.activityscheduler", 0);
  stateQueue = v5->_stateQueue;
  v5->_stateQueue = (OS_dispatch_queue *)v12;

  if (v4)
  {
    v14 = [v4 URLByDeletingLastPathComponent];
    v15 = [v14 path];

    v16 = [MEMORY[0x263F08850] defaultManager];
    char v17 = [v16 fileExistsAtPath:v15];

    if ((v17 & 1) == 0)
    {
      v18 = [MEMORY[0x263F08850] defaultManager];
      id v33 = 0;
      [v18 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v33];
      id v19 = v33;

      if (v19)
      {
        v20 = [MEMORY[0x263F77DE8] sharedLogger];
        v21 = [v20 oslog];

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v4 path];
          *(_DWORD *)buf = 138543618;
          id v36 = v22;
          __int16 v37 = 2114;
          id v38 = v19;
          _os_log_impl(&dword_20C8EA000, v21, OS_LOG_TYPE_DEFAULT, "Error creating persisted state file %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
    id v23 = objc_alloc(MEMORY[0x263F77DF8]);
    v24 = v5->_stateQueue;
    v25 = [v4 path];
    uint64_t v26 = [v23 initWithDispatchQueue:v24 withPersistencePath:v25 forPolicyVersion:@"1.0"];
    persistedState = v5->_persistedState;
    v5->_persistedState = (SUCorePersistedState *)v26;

    [(SUCoreActivityScheduler *)v5 _loadPersistedRegistrationMap];
LABEL_15:
  }
  v30 = [MEMORY[0x263F77DE8] sharedLogger];
  v31 = [v30 oslog];

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v4;
    _os_log_impl(&dword_20C8EA000, v31, OS_LOG_TYPE_DEFAULT, "Created SUCoreActivityScheduler with persisted state path: %{public}@", buf, 0xCu);
  }

LABEL_19:
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

void __41__SUCoreActivityScheduler_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];

  if (v1)
  {
    v2 = [v1 componentsSeparatedByString:@"."];
    v3 = [v2 lastObject];

    if (!v3
      || (id v4 = (id)[[NSString alloc] initWithFormat:@"%@%@.state", @"/var/mobile/Library/SoftwareUpdateCore/", v3]) == 0)
    {
      v5 = [MEMORY[0x263F77DE8] sharedLogger];
      uint64_t v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __41__SUCoreActivityScheduler_sharedInstance__block_invoke_cold_1();
      }

      id v4 = v1;
    }
    goto LABEL_13;
  }
  v7 = [MEMORY[0x263F086E0] mainBundle];
  v8 = [v7 executablePath];

  if (!v8)
  {
LABEL_12:
    id v4 = (id)[[NSString alloc] initWithFormat:@"%@%@", @"/var/mobile/Library/SoftwareUpdateCore/", @"SUCoreActivitySchedulerDefaultSharedState.state"];
    v3 = [MEMORY[0x263F77DA8] sharedDiag];
    v11 = [NSString stringWithFormat:@"Failed to create a file path from bundleIdentifier, falling back to the default of %@", v4];
    [v3 trackAnomaly:@"SUCoreActivityScheduler" forReason:v11 withResult:8116 withError:0];

LABEL_13:
    goto LABEL_14;
  }
  v9 = [v8 componentsSeparatedByString:@"/"];
  v10 = [v9 lastObject];

  if (!v10)
  {

    goto LABEL_12;
  }
  id v4 = (id)[[NSString alloc] initWithFormat:@"%@%@.state", @"/var/mobile/Library/SoftwareUpdateCore/", v10];

  if (!v4) {
    goto LABEL_12;
  }
LABEL_14:
  dispatch_queue_t v12 = [NSURL fileURLWithPath:v4];
  v13 = [[SUCoreActivityScheduler alloc] initWithPersistedStatePath:v12];
  v14 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v13;
}

- (void)_queue_addRegistration:(id)a3 forActivity:(id)a4
{
  stateQueue = self->_stateQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(stateQueue);
  [(NSMutableArray *)self->_activityArray addObject:v7];

  [(NSMutableArray *)self->_registrationArray addObject:v8];
}

- (void)_queue_removeRegistrationForActivity:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  unint64_t v4 = [(NSMutableArray *)self->_activityArray indexOfObject:v5];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && [(NSMutableArray *)self->_registrationArray count] > v4)
  {
    [(NSMutableArray *)self->_registrationArray removeObjectAtIndex:[(NSMutableArray *)self->_activityArray indexOfObject:v5]];
    [(NSMutableArray *)self->_activityArray removeObject:v5];
  }
}

- (id)_queue_registrationForActivity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_activityArray indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || [(NSMutableArray *)self->_registrationArray count] <= v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_registrationArray objectAtIndex:[(NSMutableArray *)self->_activityArray indexOfObject:v4]];
  }

  return v6;
}

- (void)_registerRegistration:(id)a3 forActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUCoreActivityScheduler__registerRegistration_forActivity___block_invoke;
  block[3] = &unk_2640DCD70;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(stateQueue, block);
}

uint64_t __61__SUCoreActivityScheduler__registerRegistration_forActivity___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "registerCallback:");
    objc_msgSend(*(id *)(a1 + 40), "_queue_addRegistration:forActivity:", *(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  v2 = *(void **)(a1 + 40);

  return objc_msgSend(v2, "_queue_persistRegistrationMap");
}

- (void)_unregisterRegistrationForActivity:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SUCoreActivityScheduler__unregisterRegistrationForActivity___block_invoke;
  v7[3] = &unk_2640DCE98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __62__SUCoreActivityScheduler__unregisterRegistrationForActivity___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_registrationForActivity:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 8) deregisterCallback:v2];
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForActivity:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_persistRegistrationMap");
}

- (void)_unregisterAllActivitiesWithName:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__SUCoreActivityScheduler__unregisterAllActivitiesWithName___block_invoke;
  v7[3] = &unk_2640DCE98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __60__SUCoreActivityScheduler__unregisterAllActivitiesWithName___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [v8 activityName];
        int v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

        if (v10) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * j);
        char v17 = objc_msgSend(*(id *)(a1 + 32), "_queue_registrationForActivity:", v16, (void)v18);
        if (v17) {
          [*(id *)(*(void *)(a1 + 32) + 8) deregisterCallback:v17];
        }
        objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForActivity:", v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_persistRegistrationMap");
}

- (id)_copyRegisteredActivities
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SUCoreActivityScheduler__copyRegisteredActivities__block_invoke;
  v6[3] = &unk_2640DC360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __52__SUCoreActivityScheduler__copyRegisteredActivities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (void)_queue_persistRegistrationMap
{
  id v2 = self;
  uint64_t v40 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v2->_activityArray;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v32;
    unint64_t v7 = 0x263F08000uLL;
    *(void *)&long long v4 = 138543618;
    long long v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        int v10 = -[SUCoreActivityScheduler _queue_registrationForActivity:](v2, "_queue_registrationForActivity:", v9, v24);
        if (v10)
        {
          id v11 = *(void **)(v7 + 2320);
          id v30 = 0;
          uint64_t v12 = [v11 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v30];
          id v13 = v30;
          uint64_t v28 = (void *)v12;
          if (v13)
          {
            uint64_t v14 = [MEMORY[0x263F77DE8] sharedLogger];
            v15 = [v14 oslog];

            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              id v36 = v10;
              __int16 v37 = 2114;
              id v38 = v13;
              _os_log_error_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_ERROR, "Error archiving registration:%{public}@ error:%{public}@", buf, 0x16u);
            }
          }
          else
          {
            [v26 addObject:v12];
          }
          char v17 = *(void **)(v7 + 2320);
          id v29 = v13;
          long long v18 = [v17 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v29];
          id v16 = v29;

          if (v16)
          {
            uint64_t v19 = v5;
            uint64_t v20 = v6;
            long long v21 = v2;
            long long v22 = [MEMORY[0x263F77DE8] sharedLogger];
            long long v23 = [v22 oslog];

            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              id v36 = v9;
              __int16 v37 = 2114;
              id v38 = v16;
              _os_log_error_impl(&dword_20C8EA000, v23, OS_LOG_TYPE_ERROR, "Error archiving activity:%{public}@ error:%{public}@", buf, 0x16u);
            }

            id v2 = v21;
            uint64_t v6 = v20;
            uint64_t v5 = v19;
            unint64_t v7 = 0x263F08000;
          }
          else
          {
            [v25 addObject:v18];
          }
        }
        else
        {
          id v16 = 0;
        }
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v5);
  }

  [(SUCorePersistedState *)v2->_persistedState persistObject:v26 forKey:@"RegistrationKey"];
  [(SUCorePersistedState *)v2->_persistedState persistObject:v25 forKey:@"ActivityKey"];
}

- (void)_loadPersistedRegistrationMap
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke;
  block[3] = &unk_2640DC338;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke(uint64_t a1)
{
  v68[4] = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 40) loadPersistedState])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"RegistrationKey" ofClass:objc_opt_class()];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"ActivityKey" ofClass:objc_opt_class()];
    long long v4 = (void *)v3;
    if (v2) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      if ([v2 count])
      {
        uint64_t v7 = [v2 count];
        if (v7 == [v4 count])
        {
          v61 = [*(id *)(a1 + 32) _contextStoreRegisteredActivities];
          if ([v4 count])
          {
            uint64_t v58 = a1;
            uint64_t v9 = 0;
            unint64_t v10 = 0x263F08000uLL;
            *(void *)&long long v8 = 134217984;
            long long v57 = v8;
            v59 = v4;
            v60 = v2;
            while (1)
            {
              id v11 = objc_msgSend(v4, "objectAtIndex:", v9, v57);
              uint64_t v12 = [v2 objectAtIndex:v9];
              id v13 = (void *)v12;
              if (v12)
              {
                if (v11) {
                  break;
                }
              }
              if (!v12)
              {
                long long v31 = [MEMORY[0x263F77DE8] sharedLogger];
                long long v32 = [v31 oslog];

                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v65 = v9;
                  _os_log_error_impl(&dword_20C8EA000, v32, OS_LOG_TYPE_ERROR, "No registrationData found at index: %lu", buf, 0xCu);
                }

                if (v11) {
                  goto LABEL_40;
                }
LABEL_37:
                long long v33 = [MEMORY[0x263F77DE8] sharedLogger];
                id v26 = [v33 oslog];

                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v65 = v9;
                  _os_log_error_impl(&dword_20C8EA000, v26, OS_LOG_TYPE_ERROR, "No activityData found at index: %lu", buf, 0xCu);
                }
LABEL_39:

                goto LABEL_40;
              }
              if (!v11) {
                goto LABEL_37;
              }
LABEL_40:

              uint64_t v9 = ((char *)v9 + 1);
              if ((unint64_t)v9 >= [v4 count]) {
                goto LABEL_54;
              }
            }
            uint64_t v14 = *(void **)(v10 + 2344);
            uint64_t v15 = objc_opt_class();
            id v63 = 0;
            id v16 = [v14 unarchivedObjectOfClass:v15 fromData:v13 error:&v63];
            char v17 = v63;
            if (v17)
            {
              long long v18 = [MEMORY[0x263F77DE8] sharedLogger];
              uint64_t v19 = [v18 oslog];

              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v17;
                _os_log_error_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_ERROR, "Error unarchiving registration: %{public}@", buf, 0xCu);
              }
            }
            unint64_t v20 = v10;
            long long v21 = *(void **)(v10 + 2344);
            long long v22 = (void *)MEMORY[0x263EFFA08];
            v68[0] = objc_opt_class();
            v68[1] = objc_opt_class();
            v68[2] = objc_opt_class();
            v68[3] = objc_opt_class();
            long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:4];
            long long v24 = [v22 setWithArray:v23];
            v62 = v17;
            id v25 = [v21 unarchivedObjectOfClasses:v24 fromData:v11 error:&v62];
            id v26 = v62;

            if (v26)
            {
              v27 = [MEMORY[0x263F77DE8] sharedLogger];
              uint64_t v28 = [v27 oslog];

              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v26;
                _os_log_error_impl(&dword_20C8EA000, v28, OS_LOG_TYPE_ERROR, "Error unarchiving activity: %{public}@", buf, 0xCu);
              }
            }
            unint64_t v10 = v20;
            long long v4 = v59;
            if ([v61 containsObject:v16])
            {
              id v29 = [MEMORY[0x263F77DE8] sharedLogger];
              id v30 = [v29 oslog];

              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v65 = v25;
                __int16 v66 = 2114;
                v67 = v16;
                _os_log_impl(&dword_20C8EA000, v30, OS_LOG_TYPE_DEFAULT, "Found matching activity:%{public}@ registration: %{public}@", buf, 0x16u);
              }

              objc_msgSend(*(id *)(v58 + 32), "_queue_addRegistration:forActivity:", v16, v25);
            }

            id v2 = v60;
            goto LABEL_39;
          }
          goto LABEL_54;
        }
      }
LABEL_48:
      uint64_t v52 = [v2 count];
      if (v52 == [v4 count])
      {
        if ([v2 count])
        {
LABEL_55:

          goto LABEL_56;
        }
        v53 = [MEMORY[0x263F77DE8] sharedLogger];
        v54 = [v53 oslog];

        v61 = v54;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_1();
        }
      }
      else
      {
        v55 = [MEMORY[0x263F77DE8] sharedLogger];
        v56 = [v55 oslog];

        v61 = v56;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_2(v2, v4, v56);
        }
      }
LABEL_54:

      goto LABEL_55;
    }
    if (v2)
    {
      if (v3) {
        goto LABEL_48;
      }
    }
    else
    {
      long long v34 = [MEMORY[0x263F77DE8] sharedLogger];
      v35 = [v34 oslog];

      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_4(v35, v36, v37, v38, v39, v40, v41, v42);
      }

      if (v4) {
        goto LABEL_48;
      }
    }
    v43 = [MEMORY[0x263F77DE8] sharedLogger];
    v44 = [v43 oslog];

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_3(v44, v45, v46, v47, v48, v49, v50, v51);
    }

    goto LABEL_48;
  }
  uint64_t v6 = [MEMORY[0x263F77DE8] sharedLogger];
  id v2 = [v6 oslog];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_5();
  }
LABEL_56:
}

- (id)sharedMemoryStore
{
  if (sharedMemoryStore_once != -1) {
    dispatch_once(&sharedMemoryStore_once, &__block_literal_global_57);
  }
  id v2 = (void *)sharedMemoryStore_sharedMemoryStore;

  return v2;
}

uint64_t __44__SUCoreActivityScheduler_sharedMemoryStore__block_invoke()
{
  sharedMemoryStore_sharedMemoryStore = [MEMORY[0x263F34FC8] keyValueStoreWithName:@"com.apple.contextstored" size:0];

  return MEMORY[0x270F9A758]();
}

- (id)_contextStoreRegisteredActivities
{
  uint64_t v3 = [MEMORY[0x263F34FC0] knowledgeDirectory];
  long long v4 = [MEMORY[0x263F35208] persistenceWithDirectory:v3];
  BOOL v5 = (void *)MEMORY[0x263F35230];
  uint64_t v6 = [(SUCoreActivityScheduler *)self sharedMemoryStore];
  uint64_t v7 = [v5 persistenceWithSharedMemoryKeyValueStore:v6];

  long long v8 = [MEMORY[0x263F35228] persistenceWithPersistenceSurvivingReboot:v4 persistenceSurvivingRelaunch:v7];
  uint64_t v9 = [v8 loadRegistrations];

  return v9;
}

- (void)scheduleActivity:(id)a3 withHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  context = self->_context;
  uint64_t v9 = [v6 createContextualPredicate];
  LODWORD(context) = [(_CDContext *)context evaluatePredicate:v9];

  if (!context)
  {
    uint64_t v12 = [v6 createRegistrationWithHandler:v7];
    id v16 = [MEMORY[0x263F77DE8] sharedLogger];
    char v17 = [v16 oslog];

    if (v12)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v6;
        _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, "Scheduling activity = %{public}@", buf, 0xCu);
      }

      [(SUCoreActivityScheduler *)self _registerRegistration:v12 forActivity:v6];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SUCoreActivityScheduler scheduleActivity:withHandler:]((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    goto LABEL_13;
  }
  unint64_t v10 = [MEMORY[0x263F77DE8] sharedLogger];
  id v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v6;
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "Conditions met for activity: %{public}@", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v12 = [v6 activityName];
    id v13 = objc_msgSend(v6, "UUID", @"UUID");
    v24[1] = @"WasScheduled";
    v25[0] = v13;
    uint64_t v14 = [NSNumber numberWithBool:0];
    v25[1] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    v7[2](v7, v12, v15);

LABEL_13:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_registrationArray, 0);
  objc_storeStrong((id *)&self->_activityArray, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithPersistedStatePath:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "CoreDuet Context Store symbols not recognized. Returning null SUCoreActivityScheduler", v2, v3, v4, v5, v6);
}

void __41__SUCoreActivityScheduler_sharedInstance__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "Failed to create failPath. Creating failPath with filename set to bundleIdentifier", v2, v3, v4, v5, v6);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "persisted registration and activity arrays contain 0 items", v2, v3, v4, v5, v6);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_error_impl(&dword_20C8EA000, a3, OS_LOG_TYPE_ERROR, "persistedRegistrationArray(%lu) and persistedActivitiesArray(%lu) have differing counts", (uint8_t *)&v5, 0x16u);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "Failed loading persisted state", v2, v3, v4, v5, v6);
}

- (void)scheduleActivity:(uint64_t)a3 withHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end