@interface SMReceiverService
+ (void)_submitSentinelZoneMaintenanceMetricForSuccess:(BOOL)a3 error:(id)a4;
- (BOOL)attemptedToLoadFromDisk;
- (NSHashTable)observers;
- (NSMutableArray)cacheManagerArray;
- (RTDefaultsManager)defaultsManager;
- (RTInvocationDispatcher)dispatcher;
- (RTPlatform)platform;
- (RTXPCActivityManager)xpcActivityManager;
- (SMMessagingService)messagingService;
- (SMReceiverService)initWithDefaultsManager:(id)a3 platform:(id)a4 messagingService:(id)a5 safetyCacheStore:(id)a6 xpcActivityManager:(id)a7;
- (SMSafetyCacheStore)safetyCacheStore;
- (id)createReceiverCacheManagerForSessionID:(id)a3 initiatorHandle:(id)a4;
- (id)getReceiverCacheManagerForSessionID:(id)a3;
- (id)invocationError;
- (int64_t)prevCKAccountStatus;
- (unint64_t)safetyCacheStoreAvailability;
- (void)_fetchAllReceiverSessionStatusWithCompletion:(id)a3;
- (void)_fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4;
- (void)_fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4;
- (void)_initializeSentinelZoneWithCompletion:(id)a3;
- (void)_onCKAccountChangedNotification;
- (void)_onMessageReceived:(id)a3;
- (void)_onSafetyCacheStoreNotification:(id)a3;
- (void)_receivedLowPowerModeWarningStateUpdateMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)_registerForCKAccountChangedNotification;
- (void)_registerInitializeSentinelZoneActivity;
- (void)_setup;
- (void)_setupCacheManagers:(id)a3;
- (void)_setupOnceDiskAvailable;
- (void)_userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)detailsViewOpenedForSessionID:(id)a3;
- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3;
- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4;
- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4;
- (void)notifyObserversOfReceiverSafetyCacheChangeWithSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5;
- (void)notifyObserversOfReceiverSessionStatusChangeWithSessionID:(id)a3 sessionStatus:(id)a4;
- (void)onMessageReceived:(id)a3;
- (void)onSafetyCacheStoreNotification:(id)a3;
- (void)receivedCacheUpdatedMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedEstimatedEndTimeUpdateMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedKeyReleaseInfoMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedKeyReleaseMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionEndMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionStartInfoMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)receivedSessionStartMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5;
- (void)removeObserver:(id)a3;
- (void)removeReceiverCacheManagerForSessionID:(id)a3;
- (void)setAttemptedToLoadFromDisk:(BOOL)a3;
- (void)setCacheManagerArray:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPrevCKAccountStatus:(int64_t)a3;
- (void)setSafetyCacheStoreAvailability:(unint64_t)a3;
- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4;
@end

@implementation SMReceiverService

- (SMReceiverService)initWithDefaultsManager:(id)a3 platform:(id)a4 messagingService:(id)a5 safetyCacheStore:(id)a6 xpcActivityManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v29 = v17;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_15;
  }
  if (!v14)
  {
    v29 = v17;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: platform";
    goto LABEL_14;
  }
  if (!v15)
  {
    v29 = v17;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v31 = "Invalid parameter not satisfying: messagingService";
      goto LABEL_14;
    }
LABEL_15:

    v28 = 0;
    goto LABEL_20;
  }
  id v34 = v17;
  if (v16)
  {
    v35.receiver = self;
    v35.super_class = (Class)SMReceiverService;
    v18 = [(RTNotifier *)&v35 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_defaultsManager, a3);
      objc_storeStrong((id *)&v19->_platform, a4);
      objc_storeStrong((id *)&v19->_messagingService, a5);
      objc_storeStrong((id *)&v19->_safetyCacheStore, a6);
      objc_storeStrong((id *)&v19->_xpcActivityManager, a7);
      uint64_t v20 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      observers = v19->_observers;
      v19->_observers = (NSHashTable *)v20;

      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      cacheManagerArray = v19->_cacheManagerArray;
      v19->_cacheManagerArray = v22;

      v19->_attemptedToLoadFromDisk = 0;
      v24 = [RTInvocationDispatcher alloc];
      v25 = [(RTNotifier *)v19 queue];
      uint64_t v26 = [(RTInvocationDispatcher *)v24 initWithQueue:v25];
      dispatcher = v19->_dispatcher;
      v19->_dispatcher = (RTInvocationDispatcher *)v26;

      v19->_prevCKAccountStatus = 3;
      [(RTService *)v19 setup];
    }
    self = v19;
    v28 = self;
  }
  else
  {
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: safetyCacheStore", buf, 2u);
    }

    v28 = 0;
  }
  v29 = v34;
LABEL_20:

  return v28;
}

- (void)dealloc
{
  v3 = [(SMReceiverService *)self messagingService];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SMReceiverService;
  [(SMReceiverService *)&v4 dealloc];
}

- (void)_setup
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v4 = _os_feature_enabled_impl();
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = NSStringFromSelector(a2);
      int v17 = 138412546;
      v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@", (uint8_t *)&v17, 0x16u);
    }
    v10 = [(SMReceiverService *)self safetyCacheStore];
    v11 = +[RTNotification notificationName];
    [v10 addObserver:self selector:sel_onSafetyCacheStoreNotification_ name:v11];

    v12 = [(SMReceiverService *)self messagingService];
    id v13 = +[RTNotification notificationName];
    [v12 addObserver:self selector:sel_onMessageReceived_ name:v13];

    [(SMReceiverService *)self _registerForCKAccountChangedNotification];
    [(SMReceiverService *)self _registerInitializeSentinelZoneActivity];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(a2);
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,feature not enabled", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)_setupCacheManagers:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v6 = [(SMReceiverService *)self safetyCacheStore];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SMReceiverService__setupCacheManagers___block_invoke;
  v8[3] = &unk_1E6B90C90;
  objc_copyWeak(v10, &location);
  v8[4] = self;
  v10[1] = (id)a2;
  id v7 = v5;
  id v9 = v7;
  [v6 fetchReceiverContactsWithHandler:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __41__SMReceiverService__setupCacheManagers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SMReceiverService__setupCacheManagers___block_invoke_21;
    block[3] = &unk_1E6B90C68;
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    id v29 = v10;
    uint64_t v30 = v11;
    uint64_t v34 = *(void *)(a1 + 56);
    id v33 = v12;
    id v31 = v5;
    v32 = v8;
    dispatch_async(v9, block);

    id v13 = v29;
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      int v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      v38 = v16;
      __int16 v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,receiver service released before receiver contacts fetch returned", buf, 0x16u);
    }
    v18 = NSString;
    __int16 v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    uint64_t v21 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v13 = [v18 stringWithFormat:@"%@, %@, was not able to acquire strongSelf", v20, v21];

    v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v23 = *(void *)(a1 + 40);
    if (v23)
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F5CFE8];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      v36 = v13;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v27 = [v24 errorWithDomain:v25 code:5 userInfo:v26];
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v27);
    }
  }
}

uint64_t __41__SMReceiverService__setupCacheManagers___block_invoke_21(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      v24 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v33 = v23;
      __int16 v34 = 2112;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      v37 = v25;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,failed to fetch receiver contacts with error %@", buf, 0x20u);
    }
    uint64_t result = *(void *)(a1 + 64);
    if (result)
    {
      char v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = [v9 sessionUUID];
            v12 = (objc_class *)objc_opt_class();
            id v13 = NSStringFromClass(v12);
            id v14 = NSStringFromSelector(*(SEL *)(a1 + 72));
            *(_DWORD *)buf = 138412802;
            id v33 = v11;
            __int16 v34 = 2112;
            uint64_t v35 = v13;
            __int16 v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,loaded receiver contact from disk", buf, 0x20u);
          }
          id v15 = [SMReceiverCacheManager alloc];
          id v16 = [*(id *)(a1 + 56) safetyCacheStore];
          int v17 = [*(id *)(a1 + 56) defaultsManager];
          v18 = [*(id *)(a1 + 56) queue];
          __int16 v19 = [*(id *)(a1 + 56) messagingService];
          uint64_t v20 = [(SMReceiverCacheManager *)v15 initWithReceiverContact:v9 safetyCacheStore:v16 defaultsManager:v17 queue:v18 messagingService:v19];

          [(SMReceiverCacheManager *)v20 setDelegate:*(void *)(a1 + 56)];
          uint64_t v21 = [*(id *)(a1 + 56) cacheManagerArray];
          [v21 addObject:v20];

          [(SMReceiverCacheManager *)v20 onSessionStatusLoadedFromDisk];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v6);
    }

    uint64_t result = *(void *)(a1 + 64);
    if (result)
    {
      char v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (void)_setupOnceDiskAvailable
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(SMReceiverService *)self attemptedToLoadFromDisk])
  {
    char v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      uint64_t v7 = NSStringFromSelector(a2);
      uint64_t v8 = [(NSMutableArray *)self->_cacheManagerArray count];
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,has already run. cacheManagerArray Count, %lu", buf, 0x20u);
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  unint64_t v9 = [(SMReceiverService *)self safetyCacheStoreAvailability];
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  char v4 = v10;
  if (v9 != 2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v14 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v14);
      uint64_t v7 = NSStringFromSelector(a2);
      id v15 = +[RTStore availabilityToString:[(SMReceiverService *)self safetyCacheStoreAvailability]];
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = (uint64_t)v15;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,Deferring - Store is not available. Safety Cache Store, %@", buf, 0x20u);

      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,Setting up cache managers", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__SMReceiverService__setupOnceDiskAvailable__block_invoke;
  v16[3] = &unk_1E6B90CB8;
  v16[4] = self;
  v16[5] = a2;
  [(SMReceiverService *)self _setupCacheManagers:v16];
}

void __44__SMReceiverService__setupOnceDiskAvailable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v11 = 138412802;
    v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,attempted to load cacheManagers from disk, %@", (uint8_t *)&v11, 0x20u);
  }
  [*(id *)(a1 + 32) setAttemptedToLoadFromDisk:1];
  uint64_t v8 = [*(id *)(a1 + 32) dispatcher];
  int v9 = [v8 invocationsPending];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) dispatcher];
    [v10 dispatchPendingInvocations];
  }
}

- (void)onSafetyCacheStoreNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SMReceiverService_onSafetyCacheStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__SMReceiverService_onSafetyCacheStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onSafetyCacheStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onSafetyCacheStoreNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [v5 availability];
    if ([(SMReceiverService *)self safetyCacheStoreAvailability] != v9)
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        __int16 v13 = NSStringFromSelector(a2);
        id v14 = +[RTStore availabilityToString:self->_safetyCacheStoreAvailability];
        __int16 v15 = +[RTStore availabilityToString:v9];
        int v16 = 138413058;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        __int16 v20 = 2112;
        __int16 v21 = v14;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,safetyCacheStoreAvailability availability change from,%@,to,%@", (uint8_t *)&v16, 0x2Au);
      }
      [(SMReceiverService *)self setSafetyCacheStoreAvailability:v9];
      if ([(SMReceiverService *)self safetyCacheStoreAvailability] == 2) {
        [(SMReceiverService *)self _setupOnceDiskAvailable];
      }
    }
  }
}

- (id)invocationError
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = [v3 stringWithFormat:@"%@, %@, failed invoking pending invocation - store did not become available", v5, v6];

  int v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v7;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  __int16 v15 = v7;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];

  return v12;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__SMReceiverService_addObserver___block_invoke;
    v7[3] = &unk_1E6B90BF0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }
  }
}

void __33__SMReceiverService_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__SMReceiverService_removeObserver___block_invoke;
    v7[3] = &unk_1E6B90BF0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }
  }
}

void __36__SMReceiverService_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)notifyObserversOfReceiverSessionStatusChangeWithSessionID:(id)a3 sessionStatus:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    __int16 v20 = "Invalid parameter not satisfying: sessionID";
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_18;
  }
  if (!v8)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    __int16 v20 = "Invalid parameter not satisfying: sessionStatus";
    goto LABEL_20;
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    __int16 v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v27 = v7;
    __int16 v28 = 2112;
    long long v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sending session status update to observers", buf, 0x20u);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [(SMReceiverService *)self observers];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        __int16 v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v19 onReceiverSessionStatusChangeForSessionID:v7 sessionStatus:v9];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
LABEL_18:
}

- (void)notifyObserversOfReceiverSafetyCacheChangeWithSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v28 = v9;
      __int16 v29 = 2112;
      __int16 v30 = v14;
      __int16 v31 = 2112;
      uint64_t v32 = v15;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sending safety cache update to observers", buf, 0x20u);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v16 = [(SMReceiverService *)self observers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v21 onReceiverSafetyCacheChangeForSessionID:v9 phoneCache:v10 watchCache:v11];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }
  }
  else
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }
}

- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SMReceiverService_fetchAllReceiverSessionStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__SMReceiverService_fetchAllReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAllReceiverSessionStatusWithCompletion:*(void *)(a1 + 40)];
}

- (void)_fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if ([(SMReceiverService *)self attemptedToLoadFromDisk])
    {
      *(void *)uint64_t v18 = 0;
      uint64_t v19 = v18;
      uint64_t v20 = 0x3032000000;
      long long v21 = __Block_byref_object_copy__3;
      long long v22 = __Block_byref_object_dispose__3;
      id v23 = [MEMORY[0x1E4F1CA48] array];
      id v6 = [(SMReceiverService *)self cacheManagerArray];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_35;
      v17[3] = &unk_1E6B90D30;
      v17[4] = v18;
      [v6 enumerateObjectsUsingBlock:v17];

      id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        int v11 = [*((id *)v19 + 5) count];
        *(_DWORD *)buf = 138412802;
        id v29 = v9;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 1024;
        int v33 = v11;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,returning array of %d session status", buf, 0x1Cu);
      }
      (*((void (**)(id, void, void))v5 + 2))(v5, *((void *)v19 + 5), 0);
      _Block_object_dispose(v18, 8);
    }
    else
    {
      __int16 v13 = [(SMReceiverService *)self dispatcher];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke;
      v26[3] = &unk_1E6B90CE0;
      v26[4] = self;
      id v27 = v5;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_2;
      v24[3] = &unk_1E6B90D08;
      v24[4] = self;
      id v25 = v27;
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(a2);
      [v13 enqueueBlock:v26, v24, @"%@-%@", v15, v16 failureBlock description];
    }
  }
  else
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v18, 2u);
    }
  }
}

uint64_t __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAllReceiverSessionStatusWithCompletion:*(void *)(a1 + 40)];
}

void __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_35(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 sessionStatus];
  [v2 addObject:v3];
}

- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SMReceiverService_fetchReceiverSessionStatusForSessionID_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __71__SMReceiverService_fetchReceiverSessionStatusForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchReceiverSessionStatusForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (!v8)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Invalid parameter not satisfying: completion";
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  if ([(SMReceiverService *)self attemptedToLoadFromDisk])
  {
    id v10 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v7];
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        id v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        uint64_t v15 = NSStringFromSelector(a2);
        uint64_t v16 = [v10 sessionStatus];
        *(_DWORD *)buf = 138413058;
        id v34 = v7;
        __int16 v35 = 2112;
        __int16 v36 = v14;
        __int16 v37 = 2112;
        uint64_t v38 = v15;
        __int16 v39 = 2112;
        v40 = v16;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning session status %@", buf, 0x2Au);
      }
      uint64_t v17 = [v10 sessionStatus];
      ((void (**)(void, void *, void))v9)[2](v9, v17, 0);
    }
    else
    {
      if (v12)
      {
        id v23 = (objc_class *)objc_opt_class();
        long long v24 = NSStringFromClass(v23);
        id v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v34 = v7;
        __int16 v35 = 2112;
        __int16 v36 = v24;
        __int16 v37 = 2112;
        uint64_t v38 = v25;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager found", buf, 0x20u);
      }
      uint64_t v41 = *MEMORY[0x1E4F28568];
      uint64_t v26 = [NSString stringWithFormat:@"no cache manager found for sessionID %@", v7];
      v42[0] = v26;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];

      id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v17];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v27);
    }
    goto LABEL_18;
  }
  uint64_t v19 = [(SMReceiverService *)self dispatcher];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke;
  v30[3] = &unk_1E6B90660;
  v30[4] = self;
  id v31 = v7;
  __int16 v32 = v9;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke_2;
  v28[3] = &unk_1E6B90D08;
  v28[4] = self;
  id v29 = v32;
  uint64_t v20 = (objc_class *)objc_opt_class();
  long long v21 = NSStringFromClass(v20);
  long long v22 = NSStringFromSelector(a2);
  [v19 enqueueBlock:v30, v28, @"%@-%@", v21, v22 failureBlock description];

LABEL_19:
}

uint64_t __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchReceiverSessionStatusForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SMReceiverService_userRequestedCacheDownloadForSessionID_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __71__SMReceiverService_userRequestedCacheDownloadForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userRequestedCacheDownloadForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v8)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "Invalid parameter not satisfying: completion";
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  if ([(SMReceiverService *)self attemptedToLoadFromDisk])
  {
    id v10 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v7];
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        uint64_t v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v35 = v7;
        __int16 v36 = 2112;
        __int16 v37 = v14;
        __int16 v38 = 2112;
        __int16 v39 = v15;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,notifying cache manager of user intent to download cache", buf, 0x20u);
      }
      [v10 onUserCacheDownloadRequest];
      v9[2](v9, 0);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        uint64_t v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v35 = v7;
        __int16 v36 = 2112;
        __int16 v37 = v25;
        __int16 v38 = 2112;
        __int16 v39 = v26;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager found", buf, 0x20u);
      }
      uint64_t v32 = *MEMORY[0x1E4F28568];
      long long v21 = [NSString stringWithFormat:@"no cache manager found for sessionID %@", v7];
      int v33 = v21;
      long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

      id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v22];
      ((void (**)(void, void *))v9)[2](v9, v23);
    }
    goto LABEL_17;
  }
  uint64_t v17 = [(SMReceiverService *)self dispatcher];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke;
  v29[3] = &unk_1E6B90660;
  v29[4] = self;
  id v30 = v7;
  id v31 = v9;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke_2;
  v27[3] = &unk_1E6B90D08;
  v27[4] = self;
  id v28 = v31;
  uint64_t v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  uint64_t v20 = NSStringFromSelector(a2);
  [v17 enqueueBlock:v29, v27, @"%@-%@", v19, v20 failureBlock description];

LABEL_18:
}

uint64_t __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userRequestedCacheDownloadForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SMReceiverService_fetchReceiverSafetyCacheForSessionID_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __69__SMReceiverService_fetchReceiverSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchReceiverSafetyCacheForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void, void))v8;
  if (!v7)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v22 = "Invalid parameter not satisfying: sessionID";
LABEL_13:
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v8)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v22 = "Invalid parameter not satisfying: completion";
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  if ([(SMReceiverService *)self attemptedToLoadFromDisk])
  {
    id v10 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v7];
    int v11 = v10;
    if (v10)
    {
      id v12 = [v10 sessionStatus];
      uint64_t v13 = [v12 sessionState];

      if (v13 != 6)
      {
        uint64_t v31 = [v11 phoneCache];
        uint64_t v32 = [v11 watchCache];
        int v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v31 | v32)
        {
          if (v34)
          {
            uint64_t v41 = (objc_class *)objc_opt_class();
            v42 = NSStringFromClass(v41);
            v43 = NSStringFromSelector(a2);
            v44 = [(id)v31 identifier];
            v45 = [(id)v32 identifier];
            *(_DWORD *)buf = 138413314;
            id v52 = v7;
            __int16 v53 = 2112;
            v54 = v42;
            __int16 v55 = 2112;
            v56 = v43;
            __int16 v57 = 2112;
            v58 = v44;
            __int16 v59 = 2112;
            v60 = v45;
            _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully fetched safety cache info,phoneCacheIdentifier,%@,watchCacheIdentifier,%@", buf, 0x34u);
          }
          v9[2](v9, v31, v32, 0);
        }
        else
        {
          if (v34)
          {
            id v35 = (objc_class *)objc_opt_class();
            __int16 v36 = NSStringFromClass(v35);
            __int16 v37 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            id v52 = v7;
            __int16 v53 = 2112;
            v54 = v36;
            __int16 v55 = 2112;
            v56 = v37;
            _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache info not available", buf, 0x20u);
          }
          uint64_t v61 = *MEMORY[0x1E4F28568];
          __int16 v38 = [NSString stringWithFormat:@"cache info not available for sessionID %@", v7];
          v62 = v38;
          __int16 v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];

          uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v39];
          ((void (**)(void, void, void, void *))v9)[2](v9, 0, 0, v40);

          uint64_t v32 = 0;
          uint64_t v31 = 0;
        }
        goto LABEL_19;
      }
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        uint64_t v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v52 = v7;
        __int16 v53 = 2112;
        v54 = v16;
        __int16 v55 = 2112;
        v56 = v17;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,session is being cleaned up", buf, 0x20u);
      }
      uint64_t v63 = *MEMORY[0x1E4F28568];
      uint64_t v18 = [NSString stringWithFormat:@"session is being cleaned up"];
      v64 = v18;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v20 = &v64;
      long long v21 = &v63;
    }
    else
    {
      id v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = (objc_class *)objc_opt_class();
        id v29 = NSStringFromClass(v28);
        id v30 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v52 = v7;
        __int16 v53 = 2112;
        v54 = v29;
        __int16 v55 = 2112;
        v56 = v30;
        _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager found", buf, 0x20u);
      }
      uint64_t v65 = *MEMORY[0x1E4F28568];
      uint64_t v18 = [NSString stringWithFormat:@"no cache manager found for sessionID %@", v7];
      v66[0] = v18;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v20 = (void **)v66;
      long long v21 = &v65;
    }
    uint64_t v31 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];

    uint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v31];
    v9[2](v9, 0, 0, v32);
LABEL_19:

    goto LABEL_20;
  }
  id v23 = [(SMReceiverService *)self dispatcher];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke;
  v48[3] = &unk_1E6B90660;
  v48[4] = self;
  id v49 = v7;
  v50 = v9;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2;
  v46[3] = &unk_1E6B90D08;
  v46[4] = self;
  v47 = v50;
  long long v24 = (objc_class *)objc_opt_class();
  id v25 = NSStringFromClass(v24);
  uint64_t v26 = NSStringFromSelector(a2);
  [v23 enqueueBlock:v48, v46, @"%@-%@", v25, v26 failureBlock description];

LABEL_21:
}

uint64_t __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchReceiverSafetyCacheForSessionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) invocationError];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (void)detailsViewOpenedForSessionID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
    goto LABEL_13;
  }
  if ([(SMReceiverService *)self attemptedToLoadFromDisk])
  {
    id v6 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v5];
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        int v11 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v22 = v5;
        __int16 v23 = 2112;
        long long v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@, notifying cache manager of user viewing session details", buf, 0x20u);
      }
      [v6 onViewingSessionDetails];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = (objc_class *)objc_opt_class();
        uint64_t v17 = NSStringFromClass(v16);
        uint64_t v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v22 = v5;
        __int16 v23 = 2112;
        long long v24 = v17;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@, no cache manager to remove", buf, 0x20u);
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  id v12 = [(SMReceiverService *)self dispatcher];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__SMReceiverService_detailsViewOpenedForSessionID___block_invoke;
  v19[3] = &unk_1E6B90BF0;
  v19[4] = self;
  id v20 = v5;
  uint64_t v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  uint64_t v15 = NSStringFromSelector(a2);
  [v12 enqueueBlock:v19, @"%@-%@", v14, v15 description];

LABEL_14:
}

uint64_t __51__SMReceiverService_detailsViewOpenedForSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) detailsViewOpenedForSessionID:*(void *)(a1 + 40)];
}

- (id)getReceiverCacheManagerForSessionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    *(void *)buf = 0;
    uint64_t v13 = buf;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__3;
    uint64_t v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    id v5 = [(SMReceiverService *)self cacheManagerArray];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SMReceiverService_getReceiverCacheManagerForSessionID___block_invoke;
    v9[3] = &unk_1E6B90D58;
    id v10 = v4;
    int v11 = buf;
    [v5 enumerateObjectsUsingBlock:v9];

    id v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

void __57__SMReceiverService_getReceiverCacheManagerForSessionID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 sessionID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)createReceiverCacheManagerForSessionID:(id)a3 initiatorHandle:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v7];
    if (v9)
    {
      id v10 = (SMReceiverCacheManager *)v9;
      int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        uint64_t v14 = NSStringFromSelector(a2);
        int v25 = 138412802;
        id v26 = v7;
        __int16 v27 = 2112;
        id v28 = v13;
        __int16 v29 = 2112;
        id v30 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,already have a cache manager", (uint8_t *)&v25, 0x20u);
LABEL_10:
      }
    }
    else
    {
      id v17 = [SMReceiverCacheManager alloc];
      uint64_t v18 = [(SMReceiverService *)self safetyCacheStore];
      uint64_t v19 = [(SMReceiverService *)self defaultsManager];
      id v20 = [(RTNotifier *)self queue];
      long long v21 = [(SMReceiverService *)self messagingService];
      id v10 = [(SMReceiverCacheManager *)v17 initWithSessionID:v7 initiatorHandle:v8 safetyCacheStore:v18 defaultsManager:v19 queue:v20 messagingService:v21];

      [(SMReceiverCacheManager *)v10 setDelegate:self];
      id v22 = [(SMReceiverService *)self cacheManagerArray];
      [v22 addObject:v10];

      int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v23);
        uint64_t v14 = NSStringFromSelector(a2);
        int v25 = 138412802;
        id v26 = v7;
        __int16 v27 = 2112;
        id v28 = v13;
        __int16 v29 = 2112;
        id v30 = v14;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,created cache manager", (uint8_t *)&v25, 0x20u);
        goto LABEL_10;
      }
    }

    uint64_t v15 = v10;
    uint64_t v16 = v15;
    goto LABEL_12;
  }
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v25) = 0;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", (uint8_t *)&v25, 2u);
  }
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (void)removeReceiverCacheManagerForSessionID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v5];
    if (v6)
    {
      id v7 = [(SMReceiverService *)self cacheManagerArray];
      [v7 removeObject:v6];

      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v6 sessionID];
        id v10 = (objc_class *)objc_opt_class();
        int v11 = NSStringFromClass(v10);
        id v12 = NSStringFromSelector(a2);
        int v14 = 138412802;
        id v15 = v9;
        __int16 v16 = 2112;
        id v17 = v11;
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,removed cache manager", (uint8_t *)&v14, 0x20u);

LABEL_9:
      }
    }
    else
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        int v11 = NSStringFromClass(v13);
        id v12 = NSStringFromSelector(a2);
        int v14 = 138412802;
        id v15 = v5;
        __int16 v16 = 2112;
        id v17 = v11;
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager to remove", (uint8_t *)&v14, 0x20u);
        goto LABEL_9;
      }
    }

    goto LABEL_11;
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", (uint8_t *)&v14, 2u);
  }
LABEL_11:
}

- (void)onMessageReceived:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      NSStringFromSelector(a2);
      int v11 = (char *)objc_claimAutoreleasedReturnValue();
      id v12 = [v5 name];
      *(_DWORD *)buf = 138412802;
      id v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      long long v21 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,unrecognized notification,%@", buf, 0x20u);
    }
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v5 name];
      *(_DWORD *)buf = 138412802;
      id v17 = v13;
      __int16 v18 = 2080;
      uint64_t v19 = "-[SMReceiverService onMessageReceived:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 607;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
LABEL_10:

    goto LABEL_11;
  }
  id v6 = [(RTNotifier *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__SMReceiverService_onMessageReceived___block_invoke;
  v14[3] = &unk_1E6B90BF0;
  v14[4] = self;
  id v15 = v5;
  dispatch_async(v6, v14);

LABEL_11:
}

uint64_t __39__SMReceiverService_onMessageReceived___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMessageReceived:*(void *)(a1 + 40)];
}

- (void)_onMessageReceived:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if ([(SMReceiverService *)self attemptedToLoadFromDisk])
    {
      id v6 = [v5 message];
      uint64_t v7 = [(id)objc_opt_class() messageType];

      switch(v7)
      {
        case 1:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService receivedSessionStartMessage:fromHandle:fromMe:](self, "receivedSessionStartMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
          goto LABEL_22;
        case 2:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService receivedSessionEndMessage:fromHandle:fromMe:](self, "receivedSessionEndMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
          goto LABEL_22;
        case 3:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService receivedKeyReleaseMessage:fromHandle:fromMe:](self, "receivedKeyReleaseMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
          goto LABEL_22;
        case 6:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService receivedCacheUpdatedMessage:fromHandle:fromMe:](self, "receivedCacheUpdatedMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
          goto LABEL_22;
        case 7:
        case 8:
        case 9:
        case 11:
        case 12:
        case 14:
        case 16:
        case 17:
        case 18:
        case 19:
          id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
            goto LABEL_7;
          }
          uint64_t v9 = (objc_class *)objc_opt_class();
          id v10 = NSStringFromClass(v9);
          int v11 = NSStringFromSelector(a2);
          id v12 = [v5 message];
          *(_DWORD *)buf = 138412802;
          long long v24 = v10;
          __int16 v25 = 2112;
          id v26 = v11;
          __int16 v27 = 1024;
          int v28 = [(id)objc_opt_class() messageType];
          _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,ignore message type,%d", buf, 0x1Cu);
          goto LABEL_6;
        case 10:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService receivedEstimatedEndTimeUpdateMessage:fromHandle:fromMe:](self, "receivedEstimatedEndTimeUpdateMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
          goto LABEL_22;
        case 13:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService receivedSessionStartInfoMessage:fromHandle:fromMe:](self, "receivedSessionStartInfoMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
          goto LABEL_22;
        case 15:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService receivedKeyReleaseInfoMessage:fromHandle:fromMe:](self, "receivedKeyReleaseInfoMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
          goto LABEL_22;
        case 20:
          __int16 v18 = [v5 message];
          uint64_t v19 = [v5 from];
          -[SMReceiverService _receivedLowPowerModeWarningStateUpdateMessage:fromHandle:fromMe:](self, "_receivedLowPowerModeWarningStateUpdateMessage:fromHandle:fromMe:", v18, v19, [v5 fromMe]);
LABEL_22:

          break;
        default:
          id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_7;
          }
          __int16 v20 = (objc_class *)objc_opt_class();
          id v10 = NSStringFromClass(v20);
          int v11 = NSStringFromSelector(a2);
          id v12 = [v5 message];
          *(_DWORD *)buf = 138412802;
          long long v24 = v10;
          __int16 v25 = 2112;
          id v26 = v11;
          __int16 v27 = 1024;
          int v28 = [(id)objc_opt_class() messageType];
          _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,unrecognized message type,%d", buf, 0x1Cu);
LABEL_6:

LABEL_7:
          break;
      }
    }
    else
    {
      int v14 = [(SMReceiverService *)self dispatcher];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __40__SMReceiverService__onMessageReceived___block_invoke;
      v21[3] = &unk_1E6B90BF0;
      v21[4] = self;
      id v22 = v5;
      id v15 = (objc_class *)objc_opt_class();
      __int16 v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(a2);
      [v14 enqueueBlock:v21, @"%@-%@", v16, v17 description];
    }
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
  }
}

uint64_t __40__SMReceiverService__onMessageReceived___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMessageReceived:*(void *)(a1 + 40)];
}

- (void)receivedSessionStartMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    LOWORD(v28) = 0;
    id v17 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v28, 2u);
    goto LABEL_16;
  }
  if (!v10)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    LOWORD(v28) = 0;
    id v17 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      int v28 = 138412546;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v9 sessionID];
      uint64_t v19 = (objc_class *)objc_opt_class();
      __int16 v20 = NSStringFromClass(v19);
      long long v21 = NSStringFromSelector(a2);
      int v28 = 138413570;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v20;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v21;
      __int16 v34 = 2112;
      id v35 = v11;
      __int16 v36 = 1024;
      int v37 = 0;
      __int16 v38 = 2112;
      id v39 = v9;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);
    }
    id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      long long v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      id v26 = NSStringFromSelector(a2);
      uint64_t v27 = [v9 lowPowerModeWarningState];
      int v28 = 138412802;
      uint64_t v29 = v25;
      __int16 v30 = 2112;
      uint64_t v31 = v26;
      __int16 v32 = 2048;
      uint64_t v33 = v27;
      _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "%@,%@ message.lowPowerModeWarningState %ld", (uint8_t *)&v28, 0x20u);
    }
    __int16 v23 = [v9 sessionID];
    uint64_t v13 = [(SMReceiverService *)self createReceiverCacheManagerForSessionID:v23 initiatorHandle:v11];

    [v13 onSessionStartMessageReceived:v9];
  }
LABEL_16:
}

- (void)receivedSessionStartInfoMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      int v28 = 138412546;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    id v17 = [v9 sessionID];
    id v12 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v17];

    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [v9 sessionID];
        long long v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        __int16 v23 = NSStringFromSelector(a2);
        int v28 = 138413570;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        id v35 = v11;
        __int16 v36 = 1024;
        int v37 = 0;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);
      }
      [v12 onSessionStartInfoMessageReceived:v9];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v9 sessionID];
        __int16 v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        uint64_t v27 = NSStringFromSelector(a2);
        int v28 = 138412802;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v26;
        __int16 v32 = 2112;
        uint64_t v33 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);
      }
      id v12 = 0;
    }
  }
LABEL_18:
}

- (void)receivedEstimatedEndTimeUpdateMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      int v28 = 138412546;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    id v17 = [v9 sessionID];
    id v12 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v17];

    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [v9 sessionID];
        long long v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        __int16 v23 = NSStringFromSelector(a2);
        int v28 = 138413570;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        id v35 = v11;
        __int16 v36 = 1024;
        int v37 = 0;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);
      }
      [v12 onEstimatedEndTimeUpdateMessageReceived:v9];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v9 sessionID];
        __int16 v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        uint64_t v27 = NSStringFromSelector(a2);
        int v28 = 138412802;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v26;
        __int16 v32 = 2112;
        uint64_t v33 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);
      }
      id v12 = 0;
    }
  }
LABEL_18:
}

- (void)_receivedLowPowerModeWarningStateUpdateMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      int v28 = 138412546;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    id v17 = [v9 sessionID];
    id v12 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v17];

    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [v9 sessionID];
        long long v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        __int16 v23 = NSStringFromSelector(a2);
        int v28 = 138413570;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        id v35 = v11;
        __int16 v36 = 1024;
        int v37 = 0;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);
      }
      [v12 onLowPowerModeWarningStateUpdateMessageReceived:v9];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v9 sessionID];
        __int16 v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        uint64_t v27 = NSStringFromSelector(a2);
        int v28 = 138412802;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v26;
        __int16 v32 = 2112;
        uint64_t v33 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);
      }
      id v12 = 0;
    }
  }
LABEL_18:
}

- (void)receivedSessionEndMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v23) = 0;
    id v17 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, 2u);
    goto LABEL_15;
  }
  if (!v10)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v23) = 0;
    id v17 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      int v23 = 138412546;
      long long v24 = v15;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v9 sessionID];
      uint64_t v19 = (objc_class *)objc_opt_class();
      __int16 v20 = NSStringFromClass(v19);
      long long v21 = NSStringFromSelector(a2);
      int v23 = 138413570;
      long long v24 = v18;
      __int16 v25 = 2112;
      id v26 = v20;
      __int16 v27 = 2112;
      int v28 = v21;
      __int16 v29 = 2112;
      __int16 v30 = v11;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v23, 0x3Au);
    }
    id v22 = [v9 sessionID];
    uint64_t v13 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v22];

    if (v13) {
      [v13 onSessionEndMessageReceived:v9];
    }
  }
LABEL_15:
}

- (void)receivedKeyReleaseMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v29) = 0;
    id v17 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v29, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v29) = 0;
    id v17 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      int v29 = 138412546;
      __int16 v30 = v15;
      __int16 v31 = 2112;
      int v32 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v9 sessionID];
      uint64_t v19 = (objc_class *)objc_opt_class();
      __int16 v20 = NSStringFromClass(v19);
      long long v21 = NSStringFromSelector(a2);
      int v29 = 138413570;
      __int16 v30 = v18;
      __int16 v31 = 2112;
      int v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      __int16 v36 = v11;
      __int16 v37 = 1024;
      int v38 = 0;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v29, 0x3Au);
    }
    id v22 = [v9 sessionID];
    uint64_t v13 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v22];

    if (!v13)
    {
      int v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        long long v24 = [v9 sessionID];
        __int16 v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        __int16 v27 = NSStringFromSelector(a2);
        int v29 = 138412802;
        __int16 v30 = v24;
        __int16 v31 = 2112;
        int v32 = v26;
        __int16 v33 = 2112;
        id v34 = v27;
        _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v29, 0x20u);
      }
      int v28 = [v9 sessionID];
      uint64_t v13 = [(SMReceiverService *)self createReceiverCacheManagerForSessionID:v28 initiatorHandle:v11];
    }
    [v13 onKeyReleaseMessageReceived:v9];
  }
LABEL_18:
}

- (void)receivedKeyReleaseInfoMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      int v28 = 138412546;
      int v29 = v14;
      __int16 v30 = 2112;
      __int16 v31 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    id v17 = [v9 sessionID];
    id v12 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v17];

    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [v9 sessionID];
        long long v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        int v23 = NSStringFromSelector(a2);
        int v28 = 138413570;
        int v29 = v20;
        __int16 v30 = 2112;
        __int16 v31 = v22;
        __int16 v32 = 2112;
        __int16 v33 = v23;
        __int16 v34 = 2112;
        __int16 v35 = v11;
        __int16 v36 = 1024;
        int v37 = 0;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);
      }
      [v12 onKeyReleaseInfoMessageReceived:v9];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v9 sessionID];
        __int16 v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        __int16 v27 = NSStringFromSelector(a2);
        int v28 = 138412802;
        int v29 = v24;
        __int16 v30 = 2112;
        __int16 v31 = v26;
        __int16 v32 = 2112;
        __int16 v33 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);
      }
      id v12 = 0;
    }
  }
LABEL_18:
}

- (void)receivedCacheUpdatedMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = v10;
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v28) = 0;
    __int16 v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      int v28 = 138412546;
      int v29 = v14;
      __int16 v30 = 2112;
      __int16 v31 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    id v17 = [v9 sessionID];
    id v12 = [(SMReceiverService *)self getReceiverCacheManagerForSessionID:v17];

    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [v9 sessionID];
        long long v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        int v23 = NSStringFromSelector(a2);
        int v28 = 138413570;
        int v29 = v20;
        __int16 v30 = 2112;
        __int16 v31 = v22;
        __int16 v32 = 2112;
        __int16 v33 = v23;
        __int16 v34 = 2112;
        __int16 v35 = v11;
        __int16 v36 = 1024;
        int v37 = 0;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);
      }
      [v12 onCacheUpdatedMessageReceived:v9];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v9 sessionID];
        __int16 v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        __int16 v27 = NSStringFromSelector(a2);
        int v28 = 138412802;
        int v29 = v24;
        __int16 v30 = 2112;
        __int16 v31 = v26;
        __int16 v32 = 2112;
        __int16 v33 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);
      }
      id v12 = 0;
    }
  }
LABEL_18:
}

- (void)_registerForCKAccountChangedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__onCKAccountChangedNotification name:*MEMORY[0x1E4F19BE0] object:0];
}

- (void)_onCKAccountChangedNotification
{
  id v4 = +[SMCloudKitZone getContainer];
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__SMReceiverService__onCKAccountChangedNotification__block_invoke;
    v5[3] = &unk_1E6B90DA8;
    v5[4] = self;
    v6[1] = (id)a2;
    objc_copyWeak(v6, &location);
    [v4 accountStatusWithCompletionHandler:v5];
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }
}

void __52__SMReceiverService__onCKAccountChangedNotification__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    int v28 = v16;
    __int16 v29 = 2112;
    __int16 v30 = v17;
    __int16 v31 = 2048;
    uint64_t v32 = a2;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,Receiver,%@,%@,new CKAccountStatus,%lu", buf, 0x20u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 40) != a2)
  {
    *(void *)(v7 + 40) = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    switch(a2)
    {
      case 4:
        goto LABEL_7;
      case 3:
LABEL_15:

        goto LABEL_16;
      case 0:
LABEL_7:
        id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          __int16 v18 = (objc_class *)objc_opt_class();
          uint64_t v19 = NSStringFromClass(v18);
          __int16 v20 = NSStringFromSelector(*(SEL *)(a1 + 48));
          *(_DWORD *)buf = 138413058;
          int v28 = v19;
          __int16 v29 = 2112;
          __int16 v30 = v20;
          __int16 v31 = 2048;
          uint64_t v32 = a2;
          __int16 v33 = 2112;
          id v34 = v5;
          _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,CKAccountStatus,%lu,error,%@", buf, 0x2Au);
        }
        break;
    }
    if (WeakRetained)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __52__SMReceiverService__onCKAccountChangedNotification__block_invoke_54;
      v24[3] = &unk_1E6B90D80;
      uint64_t v10 = *(void *)(a1 + 48);
      v24[4] = *(void *)(a1 + 32);
      void v24[5] = v10;
      v24[6] = a2;
      [WeakRetained _initializeSentinelZoneWithCompletion:v24];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      id v26 = @"Receiver service released before sentinel zone setup";
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id WeakRetained = (id)[v11 initWithDomain:v12 code:5 userInfo:v13];

      int v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        int v23 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412546;
        int v28 = v22;
        __int16 v29 = 2112;
        __int16 v30 = v23;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,receiver service released before account change could be processed", buf, 0x16u);
      }
      +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:0 error:WeakRetained];
    }
    goto LABEL_15;
  }
LABEL_16:
}

void __52__SMReceiverService__onCKAccountChangedNotification__block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = 138413314;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 1024;
    int v16 = a2;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,sentinel zone init success,%d,accountStatus,%lu,error,%@", (uint8_t *)&v11, 0x30u);
  }
  +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:a2 error:v5];
}

- (void)_initializeSentinelZoneWithCompletion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [SMSentinelZone alloc];
    uint64_t v7 = [(RTNotifier *)self queue];
    id v8 = [(SMSentinelZone *)v6 initWithQueue:v7];

    id v9 = [(SMReceiverService *)self xpcActivityManager];
    uint64_t v10 = [v9 runningTask];
    int v11 = [v10 identifier];
    int v12 = [v11 isEqualToString:@"com.apple.routined.cloudkit.initializeSentinelZone"];

    if (v12)
    {
      __int16 v13 = [(SMReceiverService *)self xpcActivityManager];
      int v14 = [v13 runningTask];
      __int16 v15 = [v14 activity];
    }
    else
    {
      __int16 v15 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__SMReceiverService__initializeSentinelZoneWithCompletion___block_invoke;
    v16[3] = &unk_1E6B90DD0;
    v16[4] = self;
    SEL v18 = a2;
    id v17 = v5;
    [v8 saveZoneWithXPCActivity:v15 completion:v16];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __59__SMReceiverService__initializeSentinelZoneWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v10 = 138413058;
    int v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,sentinel zone init success,%d,error,%@", (uint8_t *)&v10, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_registerInitializeSentinelZoneActivity
{
  id v4 = [(SMReceiverService *)self defaultsManager];
  id v5 = [v4 objectForKey:@"RTDefaultsInitializeSentinelZoneInterval" value:&unk_1F3453618];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [(SMReceiverService *)self defaultsManager];
  id v9 = [v8 objectForKey:@"RTDefaultsInitializeSentinelZoneGracePeriod" value:&unk_1F3453628];
  [v9 doubleValue];
  double v11 = v10;

  __int16 v12 = [(SMReceiverService *)self defaultsManager];
  __int16 v13 = [v12 objectForKey:@"RTDefaultsInitializeSentinelZoneIgnoreNetworkConnectivity" value:&unk_1F344F898];
  uint64_t v14 = [v13 BOOLValue] ^ 1;

  LOBYTE(v17) = 1;
  int v15 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:v14 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:0 networkTransferUploadSize:1 networkTransferDownloadSize:v7 allowBattery:v11 powerNap:0.0 delay:v17 requireBatteryLevel:0];
  objc_initWeak(&location, self);
  __int16 v16 = [(SMReceiverService *)self xpcActivityManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke;
  v18[3] = &unk_1E6B90E48;
  v18[4] = self;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a2;
  [v16 registerActivityWithIdentifier:@"com.apple.routined.cloudkit.initializeSentinelZone" criteria:v15 handler:v18];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [a1[4] queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke_2;
  v10[3] = &unk_1E6B90E20;
  objc_copyWeak(v13, a1 + 5);
  v13[1] = a1[6];
  id v11 = v6;
  id v12 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(v13);
}

void __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke_2(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        int v15 = NSStringFromClass(v14);
        __int16 v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
        uint64_t v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        __int16 v27 = v15;
        __int16 v28 = 2112;
        __int16 v29 = v16;
        __int16 v30 = 2112;
        __int16 v31 = v17;
        _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,RTXPCActivity error,%@", buf, 0x20u);
      }
      +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:0 error:*(void *)(a1 + 32)];
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 32));
      }
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke_70;
      v21[3] = &unk_1E6B90DF8;
      id v12 = WeakRetained;
      uint64_t v13 = *(void *)(a1 + 56);
      id v22 = v12;
      uint64_t v25 = v13;
      id v24 = *(id *)(a1 + 40);
      id v23 = *(id *)(a1 + 32);
      [v12 _initializeSentinelZoneWithCompletion:v21];
    }
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Receiver service released before sentinel zone setup";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v9 = (void *)[v6 initWithDomain:v7 code:5 userInfo:v8];

    double v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      id v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      __int16 v27 = v19;
      __int16 v28 = 2112;
      __int16 v29 = v20;
      __int16 v30 = 2112;
      __int16 v31 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,error,%@", buf, 0x20u);
    }
    +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:0 error:v9];
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
    }
  }
}

void __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke_70(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      double v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v11 = 138412802;
      id v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,sentinel zone error,%@", (uint8_t *)&v11, 0x20u);
    }
  }
  +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:a2 error:v5];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 40));
  }
}

+ (void)_submitSentinelZoneMaintenanceMetricForSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v12 = a4;
  id v5 = objc_opt_new();
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setObject:v6 forKeyedSubscript:@"success"];

  [v5 setObject:&unk_1F344F8B0 forKeyedSubscript:@"attempt"];
  if (v12)
  {
    uint64_t v7 = [v12 domain];
    [v5 setObject:v7 forKeyedSubscript:@"errorDomain"];

    id v8 = [NSNumber numberWithInteger:[v12 code]];
    [v5 setObject:v8 forKeyedSubscript:@"errorCode"];
  }
  id v9 = [NSString alloc];
  double v10 = (void *)[v9 initWithCString:RTAnalyticsEventSafetyMonitorReceiverSentinelZoneMaintenance encoding:1];
  log_analytics_submission(v10, v5);
  int v11 = [NSString stringWithFormat:@"com.apple.%@", v10];
  AnalyticsSendEvent();
}

- (int64_t)prevCKAccountStatus
{
  return self->_prevCKAccountStatus;
}

- (void)setPrevCKAccountStatus:(int64_t)a3
{
  self->_prevCKAccountStatus = a3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (unint64_t)safetyCacheStoreAvailability
{
  return self->_safetyCacheStoreAvailability;
}

- (void)setSafetyCacheStoreAvailability:(unint64_t)a3
{
  self->_safetyCacheStoreAvailability = a3;
}

- (BOOL)attemptedToLoadFromDisk
{
  return self->_attemptedToLoadFromDisk;
}

- (void)setAttemptedToLoadFromDisk:(BOOL)a3
{
  self->_attemptedToLoadFromDisk = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableArray)cacheManagerArray
{
  return self->_cacheManagerArray;
}

- (void)setCacheManagerArray:(id)a3
{
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_cacheManagerArray, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_platform, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end