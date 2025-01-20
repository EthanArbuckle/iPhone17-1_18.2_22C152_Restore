@interface ATXMotionManagerWrapper
+ (BOOL)hasMotionActivity;
+ (id)sharedInstance;
- (ATXMotionManagerWrapper)init;
- (id)_fetchMotionActivities;
- (id)_motionActivityHandler;
- (id)getCurrentActivity;
- (void)_fetchMotionActivities;
- (void)startUpdatingMotionType:(int64_t)a3 forDelegate:(id)a4;
- (void)stopUpdatingMotionType:(int64_t)a3 forDelegate:(id)a4;
- (void)updateCurrentActivity:(id)a3;
@end

@implementation ATXMotionManagerWrapper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __41__ATXMotionManagerWrapper_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (ATXMotionManagerWrapper)init
{
  v17.receiver = self;
  v17.super_class = (Class)ATXMotionManagerWrapper;
  v2 = [(ATXMotionManagerWrapper *)&v17 init];
  if (v2)
  {
    v3 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E4F22220]);
    motionActivityManager = v2->_motionActivityManager;
    v2->_motionActivityManager = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    motionActivityQueue = v2->_motionActivityQueue;
    v2->_motionActivityQueue = v5;

    [(NSOperationQueue *)v2->_motionActivityQueue setMaxConcurrentOperationCount:1];
    id v7 = objc_alloc(MEMORY[0x1E4F93B70]);
    v8 = [[ATXCachedMotion alloc] initWithATXMotion:0];
    uint64_t v9 = [v7 initWithGuardedData:v8];
    currentMotion = v2->_currentMotion;
    v2->_currentMotion = (_PASLock *)v9;

    uint64_t v11 = objc_opt_new();
    delegatesMonitoringForMotionType = v2->_delegatesMonitoringForMotionType;
    v2->_delegatesMonitoringForMotionType = (NSMutableDictionary *)v11;

    v13 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__ATXMotionManagerWrapper_init__block_invoke;
    block[3] = &unk_1E6BE74E8;
    v16 = v2;
    dispatch_async(v13, block);
  }
  return v2;
}

void __31__ATXMotionManagerWrapper_init__block_invoke(uint64_t a1)
{
  if (+[ATXMotionManagerWrapper hasMotionActivity])
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)v2[5];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __31__ATXMotionManagerWrapper_init__block_invoke_2;
    v4[3] = &unk_1E6BE7A00;
    v5 = v2;
    [v3 runWithLockAcquired:v4];
  }
}

uint64_t __31__ATXMotionManagerWrapper_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateCurrentActivity:a2];
}

+ (BOOL)hasMotionActivity
{
  if (hasMotionActivity__pasOnceToken6 != -1) {
    dispatch_once(&hasMotionActivity__pasOnceToken6, &__block_literal_global_12_0);
  }
  return hasMotionActivity__pasExprOnceResult != 0;
}

void __44__ATXMotionManagerWrapper_hasMotionActivity__block_invoke()
{
  v0 = (void *)MEMORY[0x1E0187360]();
  if ([MEMORY[0x1E4F22220] isActivityAvailable]) {
    BOOL v1 = [MEMORY[0x1E4F22220] authorizationStatus] == 3;
  }
  else {
    BOOL v1 = 0;
  }
  hasMotionActivity__pasExprOnceResult = v1;
}

- (id)_fetchMotionActivities
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__17;
  v22 = __Block_byref_object_dispose__17;
  id v23 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-30.0];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  motionActivityQueue = self->_motionActivityQueue;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __49__ATXMotionManagerWrapper__fetchMotionActivities__block_invoke;
  v15 = &unk_1E6BE7A28;
  objc_super v17 = &v18;
  v8 = v3;
  v16 = v8;
  [(CMMotionActivityManager *)motionActivityManager queryActivityStartingFromDate:v5 toDate:v6 toQueue:motionActivityQueue withHandler:&v12];

  if (objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v8, 60.0, v12, v13, v14, v15) == 1)
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXMotionManagerWrapper _fetchMotionActivities](v9);
    }

    id v10 = 0;
  }
  else
  {
    id v10 = (id)v19[5];
  }

  _Block_object_dispose(&v18, 8);

  return v10;
}

void __49__ATXMotionManagerWrapper__fetchMotionActivities__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)updateCurrentActivity:(id)a3
{
  id v6 = a3;
  id v4 = [(ATXMotionManagerWrapper *)self _fetchMotionActivities];
  if (v4)
  {
    v5 = +[ATXMotion summarizeActivityStream:v4];
    [v6 update:v5];
  }
}

- (id)getCurrentActivity
{
  if (+[ATXMotionManagerWrapper hasMotionActivity])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__17;
    uint64_t v11 = __Block_byref_object_dispose__17;
    id v12 = 0;
    currentMotion = self->_currentMotion;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__ATXMotionManagerWrapper_getCurrentActivity__block_invoke;
    v6[3] = &unk_1E6BE7A50;
    v6[4] = self;
    v6[5] = &v7;
    [(_PASLock *)currentMotion runWithLockAcquired:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = [[ATXMotion alloc] initFromCMMotionActivity:0];
  }

  return v4;
}

void __45__ATXMotionManagerWrapper_getCurrentActivity__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 isExpired]) {
    [*(id *)(a1 + 32) updateCurrentActivity:v6];
  }
  uint64_t v3 = [v6 currentMotion];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_motionActivityHandler
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__ATXMotionManagerWrapper__motionActivityHandler__block_invoke;
  v8[3] = &unk_1E6BE7A78;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1E0187570](v8);
  id v6 = (void *)MEMORY[0x1E0187570](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __49__ATXMotionManagerWrapper__motionActivityHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = (id *)WeakRetained;
    objc_sync_enter(v7);
    if (v4)
    {
      v8 = v7 + 4;
      if (!v7[4] || (int v9 = [v4 walking], v9 != objc_msgSend(*v8, "walking")))
      {
        id v10 = __atxlog_handle_default();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v80 = [v4 walking];
          _os_log_impl(&dword_1DAFF9000, v10, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: WALKING state changed to %d", buf, 8u);
        }

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v11 = [v7[3] objectForKey:&unk_1F35395E0];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v78 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v67;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v67 != v13) {
                objc_enumerationMutation(v11);
              }
              objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * v14++), "didUpdateMotionType:isActive:", 0, objc_msgSend(v4, "walking"));
            }
            while (v12 != v14);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v78 count:16];
          }
          while (v12);
        }
      }
      if (!*v8 || (int v15 = [v4 running], v15 != objc_msgSend(*v8, "running")))
      {
        v16 = __atxlog_handle_default();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v17 = [v4 running];
          *(_DWORD *)buf = 67109120;
          int v80 = v17;
          _os_log_impl(&dword_1DAFF9000, v16, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: RUNNING state changed to %d", buf, 8u);
        }

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v18 = [v7[3] objectForKey:&unk_1F35395F8];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v77 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v63;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v63 != v20) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * v21++), "didUpdateMotionType:isActive:", 1, objc_msgSend(v4, "running"));
            }
            while (v19 != v21);
            uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v77 count:16];
          }
          while (v19);
        }
      }
      if (!*v8 || (int v22 = [v4 cycling], v22 != objc_msgSend(*v8, "cycling")))
      {
        id v23 = __atxlog_handle_default();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v24 = [v4 cycling];
          *(_DWORD *)buf = 67109120;
          int v80 = v24;
          _os_log_impl(&dword_1DAFF9000, v23, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: CYCLING state changed to %d", buf, 8u);
        }

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v25 = [v7[3] objectForKey:&unk_1F3539610];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v58 objects:v76 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v59;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v59 != v27) {
                objc_enumerationMutation(v25);
              }
              objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * v28++), "didUpdateMotionType:isActive:", 2, objc_msgSend(v4, "cycling"));
            }
            while (v26 != v28);
            uint64_t v26 = [v25 countByEnumeratingWithState:&v58 objects:v76 count:16];
          }
          while (v26);
        }
      }
      if (!*v8 || (int v29 = [v4 automotive], v29 != objc_msgSend(*v8, "automotive")))
      {
        v30 = __atxlog_handle_default();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = [v4 automotive];
          *(_DWORD *)buf = 67109120;
          int v80 = v31;
          _os_log_impl(&dword_1DAFF9000, v30, OS_LOG_TYPE_DEFAULT, "ATXMotionManagerWrapper: AUTOMOTIVE state changed to %d", buf, 8u);
        }

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v32 = [v7[3] objectForKey:&unk_1F3539628];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v75 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v55;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v55 != v34) {
                objc_enumerationMutation(v32);
              }
              objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * v35++), "didUpdateMotionType:isActive:", 3, objc_msgSend(v4, "automotive"));
            }
            while (v33 != v35);
            uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v75 count:16];
          }
          while (v33);
        }
      }
      if (!*v8 || (int v36 = [v4 unknown], v36 != objc_msgSend(*v8, "unknown")))
      {
        v37 = __atxlog_handle_default();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          int v38 = [v4 unknown];
          *(_DWORD *)buf = 67109120;
          int v80 = v38;
          _os_log_impl(&dword_1DAFF9000, v37, OS_LOG_TYPE_INFO, "ATXMotionManagerWrapper: UNKNOWN state changed to %d", buf, 8u);
        }

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v39 = objc_msgSend(v7[3], "objectForKey:", &unk_1F3539640, 0);
        uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v74 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v51;
          do
          {
            uint64_t v42 = 0;
            do
            {
              if (*(void *)v51 != v41) {
                objc_enumerationMutation(v39);
              }
              objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * v42++), "didUpdateMotionType:isActive:", 4, objc_msgSend(v4, "unknown"));
            }
            while (v40 != v42);
            uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v74 count:16];
          }
          while (v40);
        }
      }
      objc_storeStrong(v7 + 4, a2);
    }
    else
    {
      for (uint64_t i = 0; i != 5; ++i)
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v44 = v7[3];
        v45 = [NSNumber numberWithInteger:i];
        v46 = [v44 objectForKey:v45];

        uint64_t v47 = [v46 countByEnumeratingWithState:&v70 objects:v81 count:16];
        if (v47)
        {
          uint64_t v48 = *(void *)v71;
          do
          {
            uint64_t v49 = 0;
            do
            {
              if (*(void *)v71 != v48) {
                objc_enumerationMutation(v46);
              }
              [*(id *)(*((void *)&v70 + 1) + 8 * v49++) didUpdateMotionType:i isActive:0];
            }
            while (v47 != v49);
            uint64_t v47 = [v46 countByEnumeratingWithState:&v70 objects:v81 count:16];
          }
          while (v47);
        }
      }
    }
    objc_sync_exit(v7);
  }
}

- (void)startUpdatingMotionType:(int64_t)a3 forDelegate:(id)a4
{
  id v24 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  if (v6->_motionActivityManager)
  {
    uint64_t v7 = [(NSMutableDictionary *)v6->_delegatesMonitoringForMotionType count];
    delegatesMonitoringForMotionType = v6->_delegatesMonitoringForMotionType;
    if (v7)
    {
      int v9 = [NSNumber numberWithInteger:a3];
      id v10 = [(NSMutableDictionary *)delegatesMonitoringForMotionType objectForKey:v9];

      if (!v10)
      {
        uint64_t v11 = v6->_delegatesMonitoringForMotionType;
        uint64_t v12 = objc_opt_new();
        uint64_t v13 = [NSNumber numberWithInteger:a3];
        [(NSMutableDictionary *)v11 setObject:v12 forKey:v13];
      }
      uint64_t v14 = v6->_delegatesMonitoringForMotionType;
      int v15 = [NSNumber numberWithInteger:a3];
      v16 = [(NSMutableDictionary *)v14 objectForKey:v15];
      [v16 addObject:v24];

      mostRecentActivity = v6->_mostRecentActivity;
      if (mostRecentActivity)
      {
        switch(a3)
        {
          case 0:
            uint64_t v18 = [(CMMotionActivity *)mostRecentActivity walking];
            goto LABEL_13;
          case 1:
            uint64_t v18 = [(CMMotionActivity *)mostRecentActivity running];
            goto LABEL_13;
          case 2:
            uint64_t v18 = [(CMMotionActivity *)mostRecentActivity cycling];
            goto LABEL_13;
          case 3:
            uint64_t v18 = [(CMMotionActivity *)mostRecentActivity automotive];
            goto LABEL_13;
          case 4:
            uint64_t v18 = [(CMMotionActivity *)mostRecentActivity unknown];
LABEL_13:
            [v24 didUpdateMotionType:a3 isActive:v18];
            break;
          default:
            break;
        }
      }
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA80] setWithObject:v24];
      uint64_t v20 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)delegatesMonitoringForMotionType setObject:v19 forKey:v20];

      motionActivityManager = v6->_motionActivityManager;
      motionActivityQueue = v6->_motionActivityQueue;
      id v23 = [(ATXMotionManagerWrapper *)v6 _motionActivityHandler];
      [(CMMotionActivityManager *)motionActivityManager startActivityUpdatesToQueue:motionActivityQueue withHandler:v23];
    }
  }
  objc_sync_exit(v6);
}

- (void)stopUpdatingMotionType:(int64_t)a3 forDelegate:(id)a4
{
  id v12 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  if (v6->_motionActivityManager)
  {
    delegatesMonitoringForMotionType = v6->_delegatesMonitoringForMotionType;
    v8 = [NSNumber numberWithInteger:a3];
    int v9 = [(NSMutableDictionary *)delegatesMonitoringForMotionType objectForKey:v8];

    if (v9)
    {
      [v9 removeObject:v12];
      if (![v9 count])
      {
        id v10 = v6->_delegatesMonitoringForMotionType;
        uint64_t v11 = [NSNumber numberWithInteger:a3];
        [(NSMutableDictionary *)v10 removeObjectForKey:v11];

        if (![(NSMutableDictionary *)v6->_delegatesMonitoringForMotionType count]) {
          [(CMMotionActivityManager *)v6->_motionActivityManager stopActivityUpdates];
        }
      }
    }
  }
  objc_sync_exit(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMotion, 0);
  objc_storeStrong((id *)&self->_mostRecentActivity, 0);
  objc_storeStrong((id *)&self->_delegatesMonitoringForMotionType, 0);
  objc_storeStrong((id *)&self->_motionActivityQueue, 0);

  objc_storeStrong((id *)&self->_motionActivityManager, 0);
}

- (void)_fetchMotionActivities
{
  *(_WORD *)BOOL v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "Error: motion activity query timed out\n", v1, 2u);
}

@end