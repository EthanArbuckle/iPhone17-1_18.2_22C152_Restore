@interface SMActiveSessionZone
- (BOOL)_isActiveSessionDetailsFetchedFromCloudKitSinceBoot;
- (BOOL)_isActiveSessionDetailsLocalRecordExpired;
- (BOOL)activeSessionZoneAvailable;
- (BOOL)isActiveSessionDetailsOutOfSync;
- (BOOL)isEligibleForCacheUpdateForCurrentDeviceIdentifier:(id)a3 sessionManagerState:(id)a4;
- (CKRecord)activeSessionRecord;
- (CKSyncEngine)syncEngine;
- (NSHashTable)observers;
- (RTDefaultsManager)defaultsManager;
- (SMActiveSessionDetails)latestActiveSessionDetails;
- (SMActiveSessionZone)initWithQueue:(id)a3 defaultsManager:(id)a4;
- (id)_createActiveSessionDetailsFromCKRecord:(id)a3;
- (id)_getLatestActiveSessionDetailsLocalCopy;
- (id)_getSyncEngineMetadata;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (void)_addObserver:(id)a3;
- (void)_fetchActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4;
- (void)_fetchActiveSessionDetailsWithRetryCount:(unint64_t)a3 qosOptions:(id)a4 completion:(id)a5;
- (void)_handleFetchedRecordZoneChanges:(id)a3;
- (void)_handleStateUpdate:(id)a3;
- (void)_initializeSyncEngine;
- (void)_notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_persistSyncEngineMetadata:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)_saveLatestActiveSessionDetailsLocalCopy;
- (void)_saveLatestActiveSessionDetailsStateToDefaults:(id)a3;
- (void)_setup;
- (void)_updateActiveSessionDetailsFromCloudKitRecord;
- (void)_updateActiveSessionDetailsLocalCopy:(id)a3;
- (void)_writeActiveSessionDetails:(id)a3 pendingRetryCount:(int64_t)a4 qos:(id)a5 completion:(id)a6;
- (void)_writeActiveSessionDetailsOnCloudToInitiateHandoff:(id)a3 handler:(id)a4;
- (void)addObserver:(id)a3;
- (void)checkActiveSessionDetailsZoneAvailibilityWithQos:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4;
- (void)fetchActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4;
- (void)fetchActiveSessionDetailsWithHandler:(id)a3;
- (void)handleFetchedRecordZoneChanges:(id)a3;
- (void)handleStateUpdate:(id)a3;
- (void)initializeSyncEngine;
- (void)removeObserver:(id)a3;
- (void)setActiveSessionRecord:(id)a3;
- (void)setActiveSessionZoneAvailable:(BOOL)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setLatestActiveSessionDetails:(id)a3;
- (void)setObservers:(id)a3;
- (void)setup;
- (void)setupZoneWithQos:(id)a3 completion:(id)a4;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
- (void)updateActiveSessionDetailsFromCloudKitRecord;
- (void)writeActiveSessionDetailOnCloudToInitiateHandoff:(id)a3 handler:(id)a4;
- (void)writeActiveSessionDetailsRecord:(id)a3 qos:(id)a4 completion:(id)a5;
@end

@implementation SMActiveSessionZone

- (SMActiveSessionZone)initWithQueue:(id)a3 defaultsManager:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@", buf, 0x16u);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F1A320]);
    v14 = [v13 initWithZoneName:@"ActiveSessionZone" ownerName:*MEMORY[0x1E4F19C08]];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v14];
    v22.receiver = self;
    v22.super_class = (Class)SMActiveSessionZone;
    v16 = [(SMCloudKitZone *)&v22 initWithZone:v15 queue:v7];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_defaultsManager, a4);
      uint64_t v18 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      observers = v17->_observers;
      v17->_observers = (NSHashTable *)v18;

      [(SMActiveSessionZone *)v17 setup];
    }
    self = v17;

    v20 = self;
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

- (void)setup
{
  v3 = [(SMCloudKitZone *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SMActiveSessionZone_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __28__SMActiveSessionZone_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F99880] zelkovaHandoffEnabled])
  {
    if (+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:self->_defaultsManager defaultsKey:@"SMDefaultsBootInfoActiveSessionDetailsIsFetchedSinceBootkey"])
    {
      v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        v10 = "-[SMActiveSessionZone _setup]";
        _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, clearing up the defaults related to the local copy of ActiveSessionDetails", (uint8_t *)&v9, 0xCu);
      }

      [(RTDefaultsManager *)self->_defaultsManager setObject:0 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsKey"];
      [(RTDefaultsManager *)self->_defaultsManager setObject:0 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"];
      [(RTDefaultsManager *)self->_defaultsManager setObject:0 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"];
      [(RTDefaultsManager *)self->_defaultsManager setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"];
      v5 = [(SMActiveSessionZone *)self defaultsManager];
      +[RTBootInfo setBootSessionIDWithDefaultsManager:v5 defaultsKey:@"SMDefaultsBootInfoActiveSessionDetailsIsFetchedSinceBootkey"];

      v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v7 = (char *)objc_claimAutoreleasedReturnValue();
        int v9 = 138412546;
        v10 = v7;
        __int16 v11 = 1024;
        int v12 = 1;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, isFirstRunSinceBoot, %d, clearing ActiveSessionDetails local copy and defaults entries since device rebooted", (uint8_t *)&v9, 0x12u);
      }
    }
    [(SMActiveSessionZone *)self initializeSyncEngine];
    if ([(SMActiveSessionZone *)self isActiveSessionDetailsOutOfSync])
    {
      [(SMActiveSessionZone *)self updateActiveSessionDetailsFromCloudKitRecord];
    }
    else
    {
      id v8 = [(SMActiveSessionZone *)self _getLatestActiveSessionDetailsLocalCopy];
      [(SMActiveSessionZone *)self setLatestActiveSessionDetails:v8];
    }
  }
}

- (void)dealloc
{
  syncEngine = self->_syncEngine;
  if (syncEngine)
  {
    self->_syncEngine = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SMActiveSessionZone;
  [(SMCloudKitZone *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(SMCloudKitZone *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SMActiveSessionZone_addObserver___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __35__SMActiveSessionZone_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addObserver:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(SMCloudKitZone *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SMActiveSessionZone_removeObserver___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __38__SMActiveSessionZone_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

- (void)_addObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    __int16 v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = "-[SMActiveSessionZone _addObserver:]";
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, adding observer, %@", (uint8_t *)&v10, 0x20u);
  }
  [(NSHashTable *)self->_observers addObject:v4];
}

- (void)_removeObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    __int16 v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = "-[SMActiveSessionZone _removeObserver:]";
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, removing observer, %@", (uint8_t *)&v10, 0x20u);
  }
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (void)_notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v10 = [(SMActiveSessionZone *)self observers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            objc_super v22 = "-[SMActiveSessionZone _notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:success:error:]";
            __int16 v23 = 2112;
            v24 = v15;
            _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%s, calling the selector in the observer, %@", buf, 0x16u);
          }

          [v15 onActiveSessionDetailsFetchAttemptFromCKCompleted:v8 success:v6 error:v9];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)setupZoneWithQos:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    long long v19 = "Invalid parameter not satisfying: qos";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    long long v19 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  int v10 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsSafetyCacheActiveSessionZoneTTLkey" value:&unk_1F3453A98];
  v23.receiver = self;
  v23.super_class = (Class)SMActiveSessionZone;
  uint64_t v11 = [(SMCloudKitZone *)&v23 zone];
  [v11 setExpirationAfterTimeInterval:v10];

  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [(SMCloudKitZone *)self zoneID];
    uint64_t v14 = [v13 zoneName];
    v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    long long v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    __int16 v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v16;
    __int16 v28 = 2112;
    v29 = v17;
    __int16 v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone TTL set to %@ seconds", buf, 0x2Au);
  }
  long long v18 = [(SMCloudKitZone *)self privateDatabase];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __51__SMActiveSessionZone_setupZoneWithQos_completion___block_invoke;
  v20[3] = &unk_1E6B90DD0;
  v20[4] = self;
  SEL v22 = a2;
  id v21 = v9;
  [(SMCloudKitZone *)self saveZoneToDatabase:v18 qos:v7 withCompletion:v20];

LABEL_9:
}

void __51__SMActiveSessionZone_setupZoneWithQos_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v15 = 138412546;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      long long v18 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,ActiveSessionZone saved successfully", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) setActiveSessionZoneAvailable:1];
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v15 = 138412802;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      long long v18 = v14;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save ActiveSessionZone with error %@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 32) setActiveSessionZoneAvailable:0];
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

- (void)checkActiveSessionDetailsZoneAvailibilityWithQos:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, void))a4;
  if (v8)
  {
    if ([(SMActiveSessionZone *)self activeSessionZoneAvailable])
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        uint64_t v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v20 = v11;
        __int16 v21 = 2112;
        SEL v22 = v12;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Active Session Zone available", buf, 0x16u);
      }
      v8[2](v8, 1, 0);
    }
    else
    {
      uint64_t v14 = [(SMCloudKitZone *)self privateDatabase];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke;
      v15[3] = &unk_1E6B90DF8;
      v15[4] = self;
      SEL v18 = a2;
      __int16 v17 = v8;
      id v16 = v7;
      [(SMCloudKitZone *)self fetchZoneFromDatabase:v14 qos:v16 withCompletion:v15];
    }
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    int v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      SEL v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      __int16 v28 = v17;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Active Session Zone fetch successful", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setActiveSessionZoneAvailable:1];
    __int16 v19 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_14;
  }
  BOOL v6 = [v4 domain];
  if (![v6 isEqualToString:*MEMORY[0x1E4F19C40]])
  {

    goto LABEL_11;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 26)
  {
LABEL_11:
    id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = (objc_class *)objc_opt_class();
      SEL v22 = NSStringFromClass(v21);
      uint64_t v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      __int16 v28 = v22;
      __int16 v29 = 2112;
      __int16 v30 = v23;
      __int16 v31 = 2112;
      uint64_t v32 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,Fetching Active Session Zone failed with error %@", buf, 0x20u);
    }
    __int16 v19 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_14:
    v19();
    goto LABEL_15;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    __int16 v28 = v10;
    __int16 v29 = 2112;
    __int16 v30 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Active Session Zone does not exist. Setting up Active Session Zone", buf, 0x16u);
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke_52;
  v25[3] = &unk_1E6B90DD0;
  v25[4] = v12;
  long long v24 = *(_OWORD *)(a1 + 48);
  id v14 = (id)v24;
  long long v26 = v24;
  [v12 setupZoneWithQos:v13 completion:v25];

LABEL_15:
}

void __83__SMActiveSessionZone_checkActiveSessionDetailsZoneAvailibilityWithQos_completion___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v14 = 138412802;
      int v15 = v12;
      __int16 v16 = 2112;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,Failed to setup Active Session Zone with error %@", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(a1 + 32) setActiveSessionZoneAvailable:0];
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v14 = 138412546;
      int v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Setup Active Session Zone Successful", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) setActiveSessionZoneAvailable:1];
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (void)writeActiveSessionDetailsRecord:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v9)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v14 = "Invalid parameter not satisfying: activeSessionDetails";
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_7;
  }
  if (!v11)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v14 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke;
  v15[3] = &unk_1E6B94C28;
  __int16 v16 = v9;
  __int16 v17 = self;
  SEL v20 = a2;
  id v19 = v12;
  id v18 = v10;
  [(SMActiveSessionZone *)self checkActiveSessionDetailsZoneAvailibilityWithQos:v18 completion:v15];

  uint64_t v13 = v16;
LABEL_7:
}

void __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = [*(id *)(a1 + 32) sessionID];
      __int16 v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      id v19 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138413058;
      __int16 v28 = v16;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      __int16 v31 = 2112;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      id v34 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v7 = [*(id *)(a1 + 40) zoneID];
    id v8 = (void *)[v6 initWithRecordName:@"ActiveSessionDetails" zoneID:v7];

    id v9 = *(void **)(a1 + 40);
    id v10 = [v9 privateDatabase];
    uint64_t v11 = *(void *)(a1 + 48);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_54;
    v21[3] = &unk_1E6B9ABB0;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v22 = v12;
    uint64_t v23 = v13;
    long long v20 = *(_OWORD *)(a1 + 56);
    id v14 = (id)v20;
    long long v26 = v20;
    id v24 = v8;
    id v25 = *(id *)(a1 + 48);
    id v15 = v8;
    [v9 fetchRecord:v15 fromDatabase:v10 qos:v11 withCompletion:v21];
  }
}

void __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = [*(id *)(a1 + 32) sessionID];
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      long long v20 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138413058;
      v57 = v17;
      __int16 v58 = 2112;
      v59 = v19;
      __int16 v60 = 2112;
      v61 = v20;
      __int16 v62 = 2112;
      v63 = 0;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ActiveSessionDetails record exists. Updating the record %@", buf, 0x2Au);
    }
    [*(id *)(a1 + 40) setActiveSessionRecord:v5];
    goto LABEL_9;
  }
  uint64_t v8 = [v6 code];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v10 = v9;
  if (v8 == 11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [*(id *)(a1 + 32) sessionID];
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138413058;
      v57 = v11;
      __int16 v58 = 2112;
      v59 = v13;
      __int16 v60 = 2112;
      v61 = v14;
      __int16 v62 = 2112;
      v63 = v7;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ActiveSessionDetails record does not exists. Creating new record %@", buf, 0x2Au);
    }
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"ActiveSessionDetailsRecord" recordID:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setActiveSessionRecord:v15];

LABEL_9:
    __int16 v21 = [*(id *)(a1 + 32) sessionID];
    id v22 = [v21 UUIDString];
    uint64_t v23 = [*(id *)(a1 + 40) activeSessionRecord];
    id v24 = [v23 encryptedValues];
    [v24 setObject:v22 forKeyedSubscript:@"SessionID"];

    id v25 = [*(id *)(a1 + 32) activeDeviceIdentifier];
    long long v26 = [v25 UUIDString];
    uint64_t v27 = [*(id *)(a1 + 40) activeSessionRecord];
    __int16 v28 = [v27 encryptedValues];
    [v28 setObject:v26 forKeyedSubscript:@"ActiveDeviceIdentifier"];

    __int16 v29 = [*(id *)(a1 + 32) cacheReleasedDate];
    __int16 v30 = [*(id *)(a1 + 40) activeSessionRecord];
    __int16 v31 = [v30 encryptedValues];
    [v31 setObject:v29 forKeyedSubscript:@"CacheReleasedDate"];

    uint64_t v32 = [*(id *)(a1 + 32) scheduledSendGUID];
    __int16 v33 = [*(id *)(a1 + 40) activeSessionRecord];
    id v34 = [v33 encryptedValues];
    [v34 setObject:v32 forKeyedSubscript:@"ScheduledSendGUID"];

    uint64_t v35 = [*(id *)(a1 + 32) receiverHandles];
    v36 = [*(id *)(a1 + 40) activeSessionRecord];
    v37 = [v36 encryptedValues];
    [v37 setObject:v35 forKeyedSubscript:@"ReceiverHandles"];

    v38 = *(void **)(a1 + 40);
    v39 = [v38 activeSessionRecord];
    v55 = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    v41 = [*(id *)(a1 + 40) privateDatabase];
    uint64_t v42 = *(void *)(a1 + 56);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_57;
    v51[3] = &unk_1E6B91A68;
    id v43 = *(id *)(a1 + 32);
    uint64_t v44 = *(void *)(a1 + 40);
    id v52 = v43;
    uint64_t v53 = v44;
    long long v50 = *(_OWORD *)(a1 + 64);
    id v45 = (id)v50;
    long long v54 = v50;
    [v38 saveRecords:v40 toDatabase:v41 qos:v42 withCompletion:v51];

    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v46 = [*(id *)(a1 + 32) sessionID];
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    v49 = NSStringFromSelector(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 138413058;
    v57 = v46;
    __int16 v58 = 2112;
    v59 = v48;
    __int16 v60 = 2112;
    v61 = v49;
    __int16 v62 = 2112;
    v63 = v7;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to fetch record to write active session details with error %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_13:
}

void __70__SMActiveSessionZone_writeActiveSessionDetailsRecord_qos_completion___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v12 = [*(id *)(a1 + 32) sessionID];
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v16 = 138413058;
      __int16 v17 = v12;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      __int16 v21 = v15;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v16, 0x2Au);
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) sessionID];
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v16 = 138412802;
      __int16 v17 = v8;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,activeSessionDetails record saved successfully", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 40) _updateActiveSessionDetailsLocalCopy:*(void *)(a1 + 32)];
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

- (void)_writeActiveSessionDetails:(id)a3 pendingRetryCount:(int64_t)a4 qos:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__SMActiveSessionZone__writeActiveSessionDetails_pendingRetryCount_qos_completion___block_invoke;
  v17[3] = &unk_1E6B9ABD8;
  objc_copyWeak(v21, &location);
  v17[4] = self;
  v21[1] = (id)a2;
  id v14 = v13;
  id v20 = v14;
  v21[2] = (id)a4;
  id v15 = v11;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [(SMActiveSessionZone *)self writeActiveSessionDetailsRecord:v15 qos:v16 completion:v17];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __83__SMActiveSessionZone__writeActiveSessionDetails_pendingRetryCount_qos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      id v19 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v31 = 138412546;
      uint64_t v32 = v18;
      __int16 v33 = 2112;
      id v34 = v19;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, activeSessionZone object was destroyed", (uint8_t *)&v31, 0x16u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_21;
  }
  if (!v5 && a2)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v31 = 138412546;
      uint64_t v32 = v9;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,active session details stored", (uint8_t *)&v31, 0x16u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_21;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v5])
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      __int16 v22 = NSStringFromSelector(*(SEL *)(a1 + 72));
      if ([(__CFString *)v5 code] == 26) {
        id v23 = &stru_1F33EAD88;
      }
      else {
        id v23 = @"non";
      }
      int v31 = 138413314;
      uint64_t v32 = v21;
      __int16 v33 = 2112;
      id v34 = v22;
      __int16 v35 = 2112;
      v36 = v23;
      __int16 v37 = 2112;
      v38 = v5;
      __int16 v39 = 2048;
      uint64_t v40 = [(__CFString *)v5 code];
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to write active session details with %@ recoverable error %@, error.code %ld", (uint8_t *)&v31, 0x34u);
    }
    if ([(__CFString *)v5 code] != 26)
    {
LABEL_20:
      id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_21:
      v11();
      goto LABEL_22;
    }
  }
  uint64_t v14 = *(void *)(a1 + 80);
  id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v14 <= 0)
  {
    if (v16)
    {
      __int16 v28 = (objc_class *)objc_opt_class();
      __int16 v29 = NSStringFromClass(v28);
      __int16 v30 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v31 = 138412802;
      uint64_t v32 = v29;
      __int16 v33 = 2112;
      id v34 = v30;
      __int16 v35 = 2112;
      v36 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@,failed to write active session details after retries with recoverable error %@", (uint8_t *)&v31, 0x20u);
    }
    goto LABEL_20;
  }
  if (v16)
  {
    uint64_t v24 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v24);
    long long v26 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v27 = *(void *)(a1 + 80);
    int v31 = 138413058;
    uint64_t v32 = v25;
    __int16 v33 = 2112;
    id v34 = v26;
    __int16 v35 = 2112;
    v36 = v5;
    __int16 v37 = 1024;
    LODWORD(v38) = v27;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@,failed to write active session details with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v31, 0x26u);
  }
  [WeakRetained _writeActiveSessionDetails:*(void *)(a1 + 40) pendingRetryCount:*(void *)(a1 + 80) - 1 qos:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
LABEL_22:
}

- (void)updateActiveSessionDetailsFromCloudKitRecord
{
  v3 = [(SMCloudKitZone *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SMActiveSessionZone_updateActiveSessionDetailsFromCloudKitRecord__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __67__SMActiveSessionZone_updateActiveSessionDetailsFromCloudKitRecord__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveSessionDetailsFromCloudKitRecord];
}

- (void)_updateActiveSessionDetailsFromCloudKitRecord
{
  id v4 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SMActiveSessionZone__updateActiveSessionDetailsFromCloudKitRecord__block_invoke;
  v5[3] = &unk_1E6B9AC00;
  v5[4] = self;
  v5[5] = a2;
  [(SMActiveSessionZone *)self _fetchActiveSessionDetailsWithRetryCount:2 qosOptions:v4 completion:v5];
}

void __68__SMActiveSessionZone__updateActiveSessionDetailsFromCloudKitRecord__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v13 = (void *)v12;
    int v15 = 138413314;
    uint64_t v14 = @"NO";
    BOOL v16 = v11;
    if (a3) {
      uint64_t v14 = @"YES";
    }
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = v14;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, activeSessionDetails, %@, success %@, fetchError, %@", (uint8_t *)&v15, 0x34u);
  }
  [*(id *)(a1 + 32) _onActiveSessionDetailsFetchAttemptFromCKCompleted:v7 success:a3 error:v8];
}

- (void)fetchActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SMCloudKitZone *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SMActiveSessionZone_fetchActiveSessionDetailsRecordWithQos_completion___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __73__SMActiveSessionZone_fetchActiveSessionDetailsRecordWithQos_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchActiveSessionDetailsRecordWithQos:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_fetchActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v18 = "Invalid parameter not satisfying: qos";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_10;
  }
  if (!v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v18 = "Invalid parameter not satisfying: completion";
    goto LABEL_12;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v11 = [(SMCloudKitZone *)self zoneID];
  id v12 = [v10 initWithRecordName:@"ActiveSessionDetails" zoneID:v11];

  id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v12);

  int v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  BOOL v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SMHandoffSessionFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  __int16 v17 = [(SMCloudKitZone *)self privateDatabase];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__SMActiveSessionZone__fetchActiveSessionDetailsRecordWithQos_completion___block_invoke;
  v19[3] = &unk_1E6B9AC28;
  os_signpost_id_t v21 = v14;
  SEL v22 = a2;
  v19[4] = self;
  id v20 = v9;
  [(SMCloudKitZone *)self fetchRecord:v12 fromDatabase:v17 qos:v7 withCompletion:v19];

LABEL_10:
}

void __74__SMActiveSessionZone__fetchActiveSessionDetailsRecordWithQos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMHandoffSessionFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = (objc_class *)objc_opt_class();
      __int16 v33 = NSStringFromClass(v32);
      id v34 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v33;
      __int16 v43 = 2112;
      uint64_t v44 = v34;
      __int16 v45 = 2112;
      id v46 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to fetch ActiveSessionDetailsRecord with error %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = [v5 encryptedValues];
      id v13 = [v12 objectForKeyedSubscript:@"SessionID"];
      os_signpost_id_t v14 = (objc_class *)objc_opt_class();
      int v15 = NSStringFromClass(v14);
      BOOL v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v13;
      __int16 v43 = 2112;
      uint64_t v44 = v15;
      __int16 v45 = 2112;
      id v46 = v16;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ActiveSessionDetailsRecord fetched successfully", buf, 0x20u);
    }
    __int16 v17 = [*(id *)(a1 + 32) _createActiveSessionDetailsFromCKRecord:v5];
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    __int16 v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v20 = (objc_class *)objc_opt_class();
        uint64_t v40 = NSStringFromClass(v20);
        os_signpost_id_t v21 = NSStringFromSelector(*(SEL *)(a1 + 56));
        SEL v22 = [v17 sessionID];
        [v17 activeDeviceIdentifier];
        __int16 v23 = v39 = v5;
        v38 = [v17 cacheReleasedDate];
        id v24 = [v38 stringFromDate];
        uint64_t v25 = [v17 scheduledSendGUID];
        long long v26 = [v17 receiverHandles];
        *(_DWORD *)buf = 138413826;
        uint64_t v42 = v40;
        __int16 v43 = 2112;
        uint64_t v44 = v21;
        __int16 v45 = 2112;
        id v46 = v22;
        __int16 v47 = 2112;
        v48 = v23;
        __int16 v49 = 2112;
        long long v50 = v24;
        __int16 v51 = 2112;
        id v52 = v25;
        __int16 v53 = 2112;
        long long v54 = v26;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Fetched ActiveSessionDetails from CK ,sessionID,%@,activeDeviceIdentifier,%@,cacheReleasedDate,%@,scheduledSendGUID,%@,receiverHandles%@", buf, 0x48u);

        id v5 = v39;
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        __int16 v37 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = v36;
        __int16 v43 = 2112;
        uint64_t v44 = v37;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,missing fields in activeSessionDetails record", buf, 0x16u);
      }
      uint64_t v27 = *(void *)(a1 + 40);
      __int16 v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F5CFE8];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56[0] = @"missing fields in activeSessionDetails record";
      __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      int v31 = [v28 errorWithDomain:v29 code:7 userInfo:v30];
      (*(void (**)(uint64_t, void, void, void *))(v27 + 16))(v27, 0, 0, v31);
    }
  }
}

- (void)_fetchActiveSessionDetailsWithRetryCount:(unint64_t)a3 qosOptions:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__SMActiveSessionZone__fetchActiveSessionDetailsWithRetryCount_qosOptions_completion___block_invoke;
  v13[3] = &unk_1E6B9AC50;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a2;
  id v11 = v10;
  v16[2] = (id)a3;
  id v15 = v11;
  v13[4] = self;
  id v12 = v9;
  id v14 = v12;
  [(SMActiveSessionZone *)self _fetchActiveSessionDetailsRecordWithQos:v12 completion:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __86__SMActiveSessionZone__fetchActiveSessionDetailsWithRetryCount_qosOptions_completion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v21 = (objc_class *)objc_opt_class();
      SEL v22 = NSStringFromClass(v21);
      __int16 v23 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v31 = 138412546;
      uint64_t v32 = v22;
      __int16 v33 = 2112;
      id v34 = v23;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@, activeSessionZone released during zone fetch", (uint8_t *)&v31, 0x16u);
    }
    id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_24;
  }
  if (a3)
  {
    if (!v8)
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
        int v31 = 138412546;
        uint64_t v32 = v12;
        __int16 v33 = 2112;
        id v34 = v13;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,active session details fetched and stored", (uint8_t *)&v31, 0x16u);
      }
      goto LABEL_23;
    }
  }
  else if ([v8 code] == 11 || objc_msgSend(v8, "code") == 26)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v31 = 138413314;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 1024;
      *(_DWORD *)v36 = 0;
      *(_WORD *)&v36[4] = 2048;
      *(void *)&v36[6] = [v8 code];
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@, There is no active session details and correspondingly no active session because: active session details success, %{Bool}d, error.code %ld, error is %@", (uint8_t *)&v31, 0x30u);
    }
    goto LABEL_23;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v8])
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_24:
      v15();
      goto LABEL_25;
    }
LABEL_26:
    __int16 v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    __int16 v30 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v31 = 138412802;
    uint64_t v32 = v29;
    __int16 v33 = 2112;
    id v34 = v30;
    __int16 v35 = 2112;
    *(void *)v36 = v8;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@,failed to fetch active session details after retries with recoverable error %@", (uint8_t *)&v31, 0x20u);

    goto LABEL_23;
  }
  uint64_t v19 = *(void *)(a1 + 72);
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v20 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (!v19)
  {
    if (!v20) {
      goto LABEL_23;
    }
    goto LABEL_26;
  }
  if (v20)
  {
    id v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    long long v26 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v27 = *(void *)(a1 + 72);
    int v31 = 138413058;
    uint64_t v32 = v25;
    __int16 v33 = 2112;
    id v34 = v26;
    __int16 v35 = 2112;
    *(void *)v36 = v8;
    *(_WORD *)&v36[8] = 1024;
    *(_DWORD *)&v36[10] = v27;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@,failed to fetch active session details with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v31, 0x26u);
  }
  [*(id *)(a1 + 32) _fetchActiveSessionDetailsWithRetryCount:*(void *)(a1 + 72) - 1 qosOptions:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_25:
}

- (void)_updateActiveSessionDetailsLocalCopy:(id)a3
{
  [(SMActiveSessionZone *)self setLatestActiveSessionDetails:a3];

  [(SMActiveSessionZone *)self _saveLatestActiveSessionDetailsLocalCopy];
}

- (void)deleteActiveSessionDetailsRecordWithQos:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    BOOL v16 = "Invalid parameter not satisfying: qos";
LABEL_9:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    BOOL v16 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v11 = [(SMCloudKitZone *)self zoneID];
  id v12 = (void *)[v10 initWithRecordName:@"ActiveSessionDetails" zoneID:v11];

  v23[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v14 = [(SMCloudKitZone *)self privateDatabase];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__SMActiveSessionZone_deleteActiveSessionDetailsRecordWithQos_completion___block_invoke;
  v17[3] = &unk_1E6B91A68;
  id v18 = v12;
  uint64_t v19 = self;
  SEL v21 = a2;
  id v20 = v9;
  id v15 = v12;
  [(SMCloudKitZone *)self deleteRecords:v13 fromDatabase:v14 qos:v7 withCompletion:v17];

LABEL_7:
}

void __74__SMActiveSessionZone_deleteActiveSessionDetailsRecordWithQos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v10 = *(void **)(a1 + 32);
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138413058;
      id v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to delete ActiveSessionDetailsRecord with ID %@ with error %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,ActiveSessionDetailsRecord deleted successfully", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)initializeSyncEngine
{
  v3 = [(SMCloudKitZone *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SMActiveSessionZone_initializeSyncEngine__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__SMActiveSessionZone_initializeSyncEngine__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeSyncEngine];
}

- (void)_initializeSyncEngine
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = [(SMActiveSessionZone *)self _getSyncEngineMetadata];
  id v5 = objc_alloc(MEMORY[0x1E4F1A3E0]);
  id v6 = [(SMCloudKitZone *)self privateDatabase];
  id v7 = (void *)[v5 initWithDatabase:v6 stateSerialization:v4 delegate:self];

  [v7 setApsMachServiceName:*MEMORY[0x1E4F999E8]];
  [v7 setPriority:2];
  [v7 setUseOpportunisticPushTopic:1];
  id v8 = (CKSyncEngine *)[objc_alloc(MEMORY[0x1E4F1A3D8]) initWithConfiguration:v7];
  syncEngine = self->_syncEngine;
  self->_syncEngine = v8;

  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    uint64_t v13 = NSStringFromSelector(a2);
    int v14 = (void *)v13;
    id v15 = self->_syncEngine;
    __int16 v16 = @"YES";
    int v18 = 138413058;
    uint64_t v19 = v12;
    if (v15) {
      __int16 v17 = @"YES";
    }
    else {
      __int16 v17 = @"NO";
    }
    if (!v4) {
      __int16 v16 = @"NO";
    }
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    __int16 v23 = v17;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, syncEngine initialized succesfully: %@, with metadata %@", (uint8_t *)&v18, 0x2Au);
  }
}

- (id)_getSyncEngineMetadata
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(SMActiveSessionZone *)self defaultsManager];
  id v4 = [v3 objectForKey:@"RTDefaultsSafetyCacheActiveSessionZoneCKSyncEngineMetadata"];

  if (v4)
  {
    id v18 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v18];
    id v6 = v18;
    if (v6)
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        int v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        __int16 v20 = v13;
        __int16 v21 = 2112;
        __int16 v22 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to decode metadata for CKSyncEngineState", buf, 0x16u);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = v5;
    }
    id v9 = v8;

    id v10 = v9;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = (objc_class *)objc_opt_class();
      __int16 v16 = NSStringFromClass(v15);
      __int16 v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v20 = v16;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to retrieve CKSyncEngineState serialized data, %@", buf, 0x20u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)_persistSyncEngineMetadata:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    __int16 v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    __int16 v21 = v16;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator:%@,%@,ActiveSessionDetails, metadata %@", buf, 0x20u);
  }
  id v17 = 0;
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v17];
  id v8 = v17;
  if (!v8)
  {
    uint64_t v13 = [(SMActiveSessionZone *)self defaultsManager];
    [v13 setObject:v7 forKey:@"RTDefaultsSafetyCacheActiveSessionZoneCKSyncEngineMetadata"];

    id v9 = [(SMActiveSessionZone *)self defaultsManager];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setObject:v11 forKey:@"RTDefaultsSafetyCacheActiveSessionZoneCKSyncEngineMetadataDate"];
    goto LABEL_7;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    __int16 v21 = v12;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,ActiveSessionDetails, Failed to encode metadata, %@", buf, 0x20u);

LABEL_7:
  }
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = (CKSyncEngine *)a3;
  id v8 = (CKSyncEngine *)a4;
  if (!v8)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v22);
      int v14 = NSStringFromSelector(a2);
      int v23 = 138412546;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      id v15 = "#SafetyCache,Initiator:%@,%@, invalid event was nil";
      __int16 v16 = v11;
      uint32_t v17 = 22;
      goto LABEL_15;
    }
LABEL_6:

    goto LABEL_7;
  }
  syncEngine = self->_syncEngine;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v11 = v10;
  if (syncEngine != v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      int v14 = NSStringFromSelector(a2);
      int v23 = 138412802;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      __int16 v28 = v7;
      id v15 = "#SafetyCache,Initiator:%@,%@, Sync engine %@ doesn't match internal reference.";
      __int16 v16 = v11;
      uint32_t v17 = 32;
LABEL_15:
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v17);

      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    __int16 v20 = NSStringFromSelector(a2);
    int v23 = 138413058;
    uint64_t v24 = v19;
    __int16 v25 = 2112;
    uint64_t v26 = v20;
    __int16 v27 = 2112;
    __int16 v28 = v8;
    __int16 v29 = 2048;
    uint64_t v30 = [(CKSyncEngine *)v8 type];
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, CKSyncEngine incoming event %@, %lu", (uint8_t *)&v23, 0x2Au);
  }
  uint64_t v21 = [(CKSyncEngine *)v8 type];
  if (v21 == 3)
  {
    [(SMActiveSessionZone *)self handleFetchedRecordZoneChanges:v8];
  }
  else if (!v21)
  {
    [(SMActiveSessionZone *)self handleStateUpdate:v8];
  }
LABEL_7:
}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (self->_syncEngine == a3)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v55 = self;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v48 = (objc_class *)objc_opt_class();
      __int16 v49 = NSStringFromClass(v48);
      long long v50 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v71 = v49;
      __int16 v72 = 2112;
      v73 = v50;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator, %@,%@", buf, 0x16u);

      self = v55;
    }

    id v52 = v7;
    id v10 = [v7 options];
    uint64_t v11 = [v10 zoneIDs];

    id v12 = [(CKSyncEngine *)self->_syncEngine state];
    uint64_t v13 = [v12 pendingRecordZoneChanges];

    long long v54 = (void *)v11;
    if (v11)
    {
      int v14 = a2;
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v16 = v13;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v66 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            __int16 v22 = [v21 recordID];
            int v23 = [v22 zoneID];
            int v24 = [v54 containsObject:v23];

            if (v24) {
              [v15 addObject:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v65 objects:v77 count:16];
        }
        while (v18);
      }

      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v15];

      a2 = v14;
      self = v55;
    }
    id v25 = objc_alloc(MEMORY[0x1E4F1A418]);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __70__SMActiveSessionZone_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke;
    v64[3] = &unk_1E6B9AC78;
    v64[4] = self;
    v64[5] = a2;
    uint64_t v26 = a2;
    __int16 v51 = v13;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    __int16 v53 = (void *)[v25 initWithPendingChanges:v13 recordProvider:v64];
    __int16 v27 = [v53 recordsToSave];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v61 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * j);
          __int16 v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            id v34 = (objc_class *)objc_opt_class();
            __int16 v35 = NSStringFromClass(v34);
            v36 = NSStringFromSelector(v26);
            *(_DWORD *)buf = 138412803;
            v71 = v35;
            __int16 v72 = 2112;
            v73 = v36;
            __int16 v74 = 2113;
            uint64_t v75 = v32;
            _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, nextRecordZoneChangeBatch, record to save: %{private}@", buf, 0x20u);
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v29);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    __int16 v37 = [v53 recordIDsToDelete];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v57 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v56 + 1) + 8 * k);
          __int16 v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            uint64_t v44 = (objc_class *)objc_opt_class();
            __int16 v45 = NSStringFromClass(v44);
            id v46 = NSStringFromSelector(v26);
            *(_DWORD *)buf = 138412803;
            v71 = v45;
            __int16 v72 = 2112;
            v73 = v46;
            __int16 v74 = 2113;
            uint64_t v75 = v42;
            _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, nextRecordZoneChangeBatch, record to delete: %{private}@", buf, 0x20u);
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v39);
    }

    id v7 = v52;
    id v8 = v53;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __70__SMActiveSessionZone_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator, %@,%@, CKSyncEngineRecordZoneChangeBatch, callback", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (void)handleStateUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(SMCloudKitZone *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__SMActiveSessionZone_handleStateUpdate___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__SMActiveSessionZone_handleStateUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStateUpdate:*(void *)(a1 + 40)];
}

- (void)_handleStateUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 stateUpdateEvent];
  int v7 = v6;
  if (v6)
  {
    id v8 = [v6 stateSerialization];
    [(SMActiveSessionZone *)self _persistSyncEngineMetadata:v8];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(a2);
      int v12 = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,ActiveSessionDetails, Called back for invalid CKSyncEngineStateUpdateEvent (%@)", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(SMCloudKitZone *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SMActiveSessionZone_handleFetchedRecordZoneChanges___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__SMActiveSessionZone_handleFetchedRecordZoneChanges___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFetchedRecordZoneChanges:*(void *)(a1 + 40)];
}

- (void)_handleFetchedRecordZoneChanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    __int16 v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator:%@,%@,event, %@", buf, 0x20u);
  }
  id v10 = [v5 fetchedRecordZoneChangesEvent];
  uint64_t v11 = v10;
  if (v10)
  {
    int v12 = [v10 modifications];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__SMActiveSessionZone__handleFetchedRecordZoneChanges___block_invoke;
    id v16[3] = &unk_1E6B9ACA0;
    v16[4] = self;
    v16[5] = a2;
    [v12 enumerateObjectsUsingBlock:v16];
  }
  else
  {
    int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator:%@,%@, Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent %@", buf, 0x20u);
    }
  }
}

void __55__SMActiveSessionZone__handleFetchedRecordZoneChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 recordID];
  id v5 = [v4 recordName];
  int v6 = [v5 isEqualToString:@"ActiveSessionDetails"];

  if (v6)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      __int16 v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v11 = [*(id *)(a1 + 32) latestActiveSessionDetails];
      int v20 = 138412802;
      __int16 v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator:%@,%@ A Push Notifications updated ActiveSessionDetails, %@", (uint8_t *)&v20, 0x20u);
    }
    int v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v12 _createActiveSessionDetailsFromCKRecord:v3];
    [v12 _onActiveSessionDetailsFetchAttemptFromCKCompleted:v13 success:1 error:0];
  }
  __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v18 = [v3 recordID];
    __int16 v19 = [v18 recordName];
    int v20 = 138413058;
    __int16 v21 = v16;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    __int16 v24 = 2112;
    id v25 = v3;
    __int16 v26 = 2112;
    __int16 v27 = v19;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator:%@,%@,ActiveSessionDetails, ckrecord %@, activeSessionDetailsRecordID %@", (uint8_t *)&v20, 0x2Au);
  }
}

- (void)_onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315906;
    __int16 v14 = "-[SMActiveSessionZone _onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, fetchedActiveSessionDetails, %@, success, %{Bool}d, error, %@", (uint8_t *)&v13, 0x26u);
  }

  if (v9 || !v6)
  {
    if (!v6 && ([v9 code] == 11 || objc_msgSend(v9, "code") == 26))
    {
      [(SMActiveSessionZone *)self setLatestActiveSessionDetails:0];
      [(SMActiveSessionZone *)self _saveLatestActiveSessionDetailsStateToDefaults:0];
    }
    else
    {
      uint64_t v11 = [(SMActiveSessionZone *)self defaultsManager];
      int v12 = [MEMORY[0x1E4F1C9C8] date];
      [v11 setObject:v12 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"];
    }
  }
  else
  {
    [(SMActiveSessionZone *)self _updateActiveSessionDetailsLocalCopy:v8];
  }
  [(SMActiveSessionZone *)self _notifyObserversForActiveSessionDetailsFetchAttemptedFromCKCompleted:v8 success:v6 error:v9];
}

- (id)_createActiveSessionDetailsFromCKRecord:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    id v5 = [v3 encryptedValues];
    BOOL v6 = [v5 objectForKeyedSubscript:@"SessionID"];
    int v7 = (void *)[v4 initWithUUIDString:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    id v9 = [v3 encryptedValues];
    id v10 = [v9 objectForKeyedSubscript:@"ActiveDeviceIdentifier"];
    uint64_t v11 = (void *)[v8 initWithUUIDString:v10];

    int v12 = 0;
    if (v7 && v11)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F99800]);
      __int16 v14 = [v3 encryptedValues];
      __int16 v15 = [v14 objectForKeyedSubscript:@"CacheReleasedDate"];
      id v16 = [v3 encryptedValues];
      __int16 v17 = [v16 objectForKeyedSubscript:@"ScheduledSendGUID"];
      BOOL v18 = [v3 encryptedValues];
      __int16 v19 = [v18 objectForKeyedSubscript:@"ReceiverHandles"];
      int v12 = (void *)[v13 initWithSessionID:v7 activeDeviceIdentifier:v11 cacheReleasedDate:v15 scheduledSendGUID:v17 receiverHandles:v19];
    }
  }
  else
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v22 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: record", v22, 2u);
    }

    int v12 = 0;
  }

  return v12;
}

- (BOOL)isActiveSessionDetailsOutOfSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(SMActiveSessionZone *)self _isActiveSessionDetailsLocalRecordExpired])
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = ![(SMActiveSessionZone *)self _isActiveSessionDetailsFetchedFromCloudKitSinceBoot];
  }
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    int v7 = 136315394;
    id v8 = "-[SMActiveSessionZone isActiveSessionDetailsOutOfSync]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isOutOfSync, %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (BOOL)_isActiveSessionDetailsLocalRecordExpired
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(SMActiveSessionZone *)self defaultsManager];
  BOOL v3 = [v2 objectForKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    BOOL v6 = v5 < 1800.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = @"YES";
    if (v6) {
      __int16 v9 = @"NO";
    }
    int v10 = 136315394;
    uint64_t v11 = "-[SMActiveSessionZone _isActiveSessionDetailsLocalRecordExpired]";
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isExpired, %@", (uint8_t *)&v10, 0x16u);
  }

  return !v6;
}

- (BOOL)_isActiveSessionDetailsFetchedFromCloudKitSinceBoot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(SMActiveSessionZone *)self defaultsManager];
  BOOL v3 = [v2 objectForKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"];
  int v4 = [v3 BOOLValue];

  double v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = @"NO";
    if (v4) {
      int v7 = @"YES";
    }
    int v8 = 136315394;
    __int16 v9 = "-[SMActiveSessionZone _isActiveSessionDetailsFetchedFromCloudKitSinceBoot]";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isRecordFetchedFromCKSinceBoot, %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (BOOL)isEligibleForCacheUpdateForCurrentDeviceIdentifier:(id)a3 sessionManagerState:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SMActiveSessionZone *)self latestActiveSessionDetails];
  __int16 v9 = [v8 sessionID];
  __int16 v10 = [v7 configuration];

  uint64_t v11 = [v10 sessionID];
  if ([v9 isEqual:v11])
  {
    uint64_t v12 = [(SMActiveSessionZone *)self latestActiveSessionDetails];
    id v13 = [v12 activeDeviceIdentifier];
    int v14 = [v13 isEqual:v6];
  }
  else
  {
    int v14 = 0;
  }

  __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = @"NO";
    if (v14) {
      id v16 = @"YES";
    }
    int v18 = 136315394;
    __int16 v19 = "-[SMActiveSessionZone isEligibleForCacheUpdateForCurrentDeviceIdentifier:sessionManagerState:]";
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, isEligible, %@", (uint8_t *)&v18, 0x16u);
  }

  return v14;
}

- (void)writeActiveSessionDetailOnCloudToInitiateHandoff:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SMCloudKitZone *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SMActiveSessionZone_writeActiveSessionDetailOnCloudToInitiateHandoff_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __80__SMActiveSessionZone_writeActiveSessionDetailOnCloudToInitiateHandoff_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeActiveSessionDetailsOnCloudToInitiateHandoff:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_writeActiveSessionDetailsOnCloudToInitiateHandoff:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__SMActiveSessionZone__writeActiveSessionDetailsOnCloudToInitiateHandoff_handler___block_invoke;
  v12[3] = &unk_1E6B97AC0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a2;
  id v10 = v8;
  id v15 = v10;
  id v11 = v7;
  id v13 = v11;
  int v14 = self;
  [(SMActiveSessionZone *)self _writeActiveSessionDetails:v11 pendingRetryCount:3 qos:v9 completion:v12];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __82__SMActiveSessionZone__writeActiveSessionDetailsOnCloudToInitiateHandoff_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v8 = v7;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = [*(id *)(a1 + 32) sessionID];
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 64));
      id v13 = (void *)v12;
      int v16 = 138413314;
      int v14 = @"NO";
      __int16 v17 = v9;
      if (a2) {
        int v14 = @"YES";
      }
      __int16 v18 = 2112;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Active Session Details stored in Cloud, success, %@, error, %@", (uint8_t *)&v16, 0x34u);
    }
    [*(id *)(a1 + 40) _updateActiveSessionDetailsLocalCopy:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v16 = 138412290;
      __int16 v17 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@,object has been cleaned up", (uint8_t *)&v16, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchActiveSessionDetailsWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(SMCloudKitZone *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke;
  block[3] = &unk_1E6B921E0;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isActiveSessionDetailsOutOfSync])
  {
    v2 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
    BOOL v3 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke_2;
    v8[3] = &unk_1E6B9ACC8;
    v8[4] = v3;
    *(_OWORD *)id v6 = *(_OWORD *)(a1 + 40);
    id v4 = v6[0];
    long long v9 = *(_OWORD *)v6;
    [v3 _fetchActiveSessionDetailsWithRetryCount:2 qosOptions:v2 completion:v8];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) _getLatestActiveSessionDetailsLocalCopy];
    (*(void (**)(uint64_t, void *, uint64_t, void))(v5 + 16))(v5, v7, 1, 0);
  }
}

void __60__SMActiveSessionZone_fetchActiveSessionDetailsWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  long long v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    SEL v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v13 = (void *)v12;
    int v15 = 138413314;
    int v14 = @"NO";
    int v16 = v11;
    if (a3) {
      int v14 = @"YES";
    }
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = v14;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, activeSessionDetails, %@, success %@, fetchError, %@", (uint8_t *)&v15, 0x34u);
  }
  [*(id *)(a1 + 32) _onActiveSessionDetailsFetchAttemptFromCKCompleted:v7 success:a3 error:v8];
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
}

- (void)_saveLatestActiveSessionDetailsLocalCopy
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [(SMActiveSessionZone *)self latestActiveSessionDetails];

  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "-[SMActiveSessionZone _saveLatestActiveSessionDetailsLocalCopy]";
      __int16 v18 = 1024;
      LODWORD(v19) = 1016;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.latestActiveSessionDetails (in %s:%d)", buf, 0x12u);
    }
  }
  id v6 = (void *)MEMORY[0x1E4F28DB0];
  id v7 = [(SMActiveSessionZone *)self latestActiveSessionDetails];
  id v15 = 0;
  id v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v15];
  id v9 = v15;

  if (v9)
  {
    SEL v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      uint64_t v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = NSStringFromSelector(a2);
      int v14 = [(SMActiveSessionZone *)self latestActiveSessionDetails];
      *(_DWORD *)buf = 138413058;
      __int16 v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      __int16 v21 = v14;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to serialize activeSessionDetails, %@, error, %@", buf, 0x2Au);
    }
  }
  [(SMActiveSessionZone *)self _saveLatestActiveSessionDetailsStateToDefaults:v8];
}

- (void)_saveLatestActiveSessionDetailsStateToDefaults:(id)a3
{
  defaultsManager = self->_defaultsManager;
  id v5 = a3;
  [(RTDefaultsManager *)defaultsManager setObject:MEMORY[0x1E4F1CC38] forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"];
  id v6 = [(SMActiveSessionZone *)self defaultsManager];
  [v6 setObject:v5 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsKey"];

  id v7 = [(SMActiveSessionZone *)self defaultsManager];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v7 setObject:v8 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"];

  id v9 = [(SMActiveSessionZone *)self defaultsManager];
  [v9 setObject:0 forKey:@"RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"];
}

- (id)_getLatestActiveSessionDetailsLocalCopy
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SMActiveSessionZone *)self defaultsManager];
  id v4 = [v3 objectForKey:@"RTDefaultsSafetyCacheActiveSessionDetailsKey"];

  if (v4)
  {
    id v18 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v18];
    id v6 = v18;
    if (v6)
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        int v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v20 = v13;
        __int16 v21 = 2112;
        __int16 v22 = v14;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to decode metadata for SMActiveSessionDetails, error, %@", buf, 0x20u);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = v5;
    }
    id v9 = v8;

    SEL v10 = v9;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = (objc_class *)objc_opt_class();
      int v16 = NSStringFromClass(v15);
      __int16 v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v20 = v16;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@, Failed to retrieve serialized data from defaults", buf, 0x16u);
    }
    SEL v10 = 0;
  }

  return v10;
}

- (CKRecord)activeSessionRecord
{
  return self->_activeSessionRecord;
}

- (void)setActiveSessionRecord:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)activeSessionZoneAvailable
{
  return self->_activeSessionZoneAvailable;
}

- (void)setActiveSessionZoneAvailable:(BOOL)a3
{
  self->_activeSessionZoneAvailable = a3;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (SMActiveSessionDetails)latestActiveSessionDetails
{
  return self->_latestActiveSessionDetails;
}

- (void)setLatestActiveSessionDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestActiveSessionDetails, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_activeSessionRecord, 0);
}

@end