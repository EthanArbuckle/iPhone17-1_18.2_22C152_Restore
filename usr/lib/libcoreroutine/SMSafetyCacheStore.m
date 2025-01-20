@interface SMSafetyCacheStore
- (NSMutableArray)locations;
- (RTTimer)flushTimer;
- (SMSafetyCacheStore)initWithPersistenceManager:(id)a3 timerManager:(id)a4;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (id)fetchRequestFromStoredLocationOptions:(id)a3;
- (void)_fetchLastLocationWithHandler:(id)a3;
- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)_flushCachedLocations;
- (void)_flushCachedLocationsWithHandler:(id)a3;
- (void)_invalidateFlushTimer;
- (void)_startFlushTimer;
- (void)_storeLocations:(id)a3 handler:(id)a4;
- (void)enumerateStoredLocationsWithContext:(id)a3 usingBlock:(id)a4;
- (void)fetchInitiatorContactsWithHandler:(id)a3;
- (void)fetchLastLocationWithHandler:(id)a3;
- (void)fetchMetricsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchReceiverContactsWithHandler:(id)a3;
- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7;
- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)logStoreWithHandler:(id)a3;
- (void)removeInitiatorContact:(id)a3 handler:(id)a4;
- (void)removeLocationsPredating:(id)a3 handler:(id)a4;
- (void)removeReceiverContact:(id)a3 handler:(id)a4;
- (void)storeInitiatorContact:(id)a3 handler:(id)a4;
- (void)storeLocations:(id)a3 handler:(id)a4;
- (void)storeReceiverContact:(id)a3 handler:(id)a4;
- (void)updateInitiatorContact:(id)a3 handler:(id)a4;
- (void)updateReceiverContact:(id)a3 handler:(id)a4;
@end

@implementation SMSafetyCacheStore

- (SMSafetyCacheStore)initWithPersistenceManager:(id)a3 timerManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v13 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: persistenceManager";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)SMSafetyCacheStore;
  v9 = [(RTStore *)&v17 initWithPersistenceManager:v6];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timerManager, a4);
    uint64_t v11 = objc_opt_new();
    locations = v10->_locations;
    v10->_locations = (NSMutableArray *)v11;
  }
  self = v10;
  v13 = self;
LABEL_10:

  return v13;
}

- (void)storeInitiatorContact:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__SMSafetyCacheStore_storeInitiatorContact_handler___block_invoke;
  v12[3] = &unk_1E6B90C40;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

void __52__SMSafetyCacheStore_storeInitiatorContact_handler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:*(void *)(a1 + 40), 0];
  [v4 storeWritableObjects:v5 handler:*(void *)(a1 + 48)];
}

- (void)updateInitiatorContact:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SMSafetyCacheStore_updateInitiatorContact_handler___block_invoke;
  v12[3] = &unk_1E6B90C40;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

void __53__SMSafetyCacheStore_updateInitiatorContact_handler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:*(void *)(a1 + 40), 0];
  [v4 updateWritableObjects:v5 handler:*(void *)(a1 + 48)];
}

- (void)storeReceiverContact:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SMSafetyCacheStore_storeReceiverContact_handler___block_invoke;
  v12[3] = &unk_1E6B90C40;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

void __51__SMSafetyCacheStore_storeReceiverContact_handler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:*(void *)(a1 + 40), 0];
  [v4 storeWritableObjects:v5 handler:*(void *)(a1 + 48)];
}

- (void)updateReceiverContact:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__SMSafetyCacheStore_updateReceiverContact_handler___block_invoke;
  v12[3] = &unk_1E6B90C40;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

void __52__SMSafetyCacheStore_updateReceiverContact_handler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:*(void *)(a1 + 40), 0];
  [v4 updateWritableObjects:v5 handler:*(void *)(a1 + 48)];
}

- (void)fetchInitiatorContactsWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke;
  block[3] = &unk_1E6B96A30;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_21;
  v8[3] = &unk_1E6B92A40;
  id v9 = *(id *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E016DB00](v8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_25;
  v6[3] = &unk_1E6B90C18;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v5 _performBlock:v4 contextType:1 errorHandler:v6];
}

void __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SMInitiatorContactMO fetchRequest];
  id v27 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v27];
  id v6 = v27;
  id v7 = objc_opt_new();
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [v5 count];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v9;
    *(_WORD *)&v30[4] = 2112;
    *(void *)&v30[6] = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchInitiatorContactsWithHandler,Fetched contacts %d, error: %@", buf, 0x12u);
  }

  if (!v6 && [v5 count])
  {
    v19 = v5;
    uint64_t v20 = a1;
    v21 = v4;
    id v22 = v3;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          SEL v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_super v17 = [v15 identifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v30 = v17;
            _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchInitiatorContactsWithHandler,contact %@", buf, 0xCu);
          }
          v18 = [MEMORY[0x1E4F99890] createWithManagedObject:v15];
          if (v18) {
            [v7 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    v4 = v21;
    id v3 = v22;
    id v5 = v19;
    a1 = v20;
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchReceiverContactsWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke;
  block[3] = &unk_1E6B96A30;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_27;
  v8[3] = &unk_1E6B92A40;
  id v9 = *(id *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E016DB00](v8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_30;
  v6[3] = &unk_1E6B90C18;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v5 _performBlock:v4 contextType:1 errorHandler:v6];
}

void __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SMReceiverContactMO fetchRequest];
  id v27 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v27];
  id v6 = v27;
  id v7 = objc_opt_new();
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [v5 count];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v9;
    *(_WORD *)&v30[4] = 2112;
    *(void *)&v30[6] = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchReceiverContactsWithHandler,Fetched receiverContacts %d, error: %@", buf, 0x12u);
  }

  if (!v6 && [v5 count])
  {
    v19 = v5;
    uint64_t v20 = a1;
    v21 = v4;
    id v22 = v3;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          SEL v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_super v17 = [v15 identifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v30 = v17;
            _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchReceiverContactsWithHandler,fetched receiverContact: %@", buf, 0xCu);
          }
          v18 = [MEMORY[0x1E4F998E8] createWithManagedObject:v15];
          if (v18) {
            [v7 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    v4 = v21;
    id v3 = v22;
    id v5 = v19;
    a1 = v20;
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeInitiatorContact:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke;
  v12[3] = &unk_1E6B927F8;
  id v15 = v8;
  SEL v16 = a2;
  id v13 = v7;
  id v14 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

void __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_36;
    v14[3] = &unk_1E6B91088;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v15 = v5;
    uint64_t v16 = v6;
    id v17 = v7;
    id v8 = (void *)MEMORY[0x1E016DB00](v14);
    [*(id *)(a1 + 40) _performBlock:v8 contextType:0 errorHandler:*(void *)(a1 + 48)];

    int v9 = v15;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19 = @"requires valid initiatorContact.";
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = [v11 errorWithDomain:v12 code:0 userInfo:v9];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
  }
}

void __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_36(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SMInitiatorContactMO fetchRequest];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v4 setPredicate:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v8 setResultType:2];
  int v9 = *(void **)(a1 + 40);
  v13[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_2;
  v11[3] = &unk_1E6B90C18;
  id v12 = *(id *)(a1 + 48);
  [v9 executeDeleteRequests:v10 context:v3 handler:v11];
}

void __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,removeInitiatorContact,completed, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeReceiverContact:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke;
  v12[3] = &unk_1E6B927F8;
  id v15 = v8;
  SEL v16 = a2;
  id v13 = v7;
  id v14 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

void __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_48;
    v14[3] = &unk_1E6B91088;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v15 = v5;
    uint64_t v16 = v6;
    id v17 = v7;
    id v8 = (void *)MEMORY[0x1E016DB00](v14);
    [*(id *)(a1 + 40) _performBlock:v8 contextType:0 errorHandler:*(void *)(a1 + 48)];

    int v9 = v15;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19 = @"requires valid receiverServiceState.";
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = [v11 errorWithDomain:v12 code:0 userInfo:v9];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
  }
}

void __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_48(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SMReceiverContactMO fetchRequest];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v4 setPredicate:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v8 setResultType:2];
  int v9 = *(void **)(a1 + 40);
  v13[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_2;
  v11[3] = &unk_1E6B90C18;
  id v12 = *(id *)(a1 + 48);
  [v9 executeDeleteRequests:v10 context:v3 handler:v11];
}

void __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,removeReceiverContact,completed, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logStoreWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_2;
  v5[3] = &unk_1E6B92A40;
  v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_49;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 40);
  [v2 _performBlock:v5 contextType:1 errorHandler:v3];
}

void __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMInitiatorContactMO fetchRequest];
  id v71 = 0;
  int v5 = [v3 executeFetchRequest:v4 error:&v71];
  unint64_t v6 = (unint64_t)v71;
  uint64_t v7 = +[SMReceiverContactMO fetchRequest];
  id v70 = 0;
  id v8 = [v3 executeFetchRequest:v7 error:&v70];
  unint64_t v9 = (unint64_t)v70;
  uint64_t v10 = (void *)v9;
  if (v6 | v9)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      id v12 = _RTSafeArray();
      id v13 = _RTMultiErrorCreate();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
    }
  }
  else
  {
    id v50 = (id)v9;
    uint64_t v51 = a1;
    id v56 = v3;
    v57 = v8;
    v52 = v7;
    unint64_t v53 = v6;
    v55 = v4;
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v5 count];
      *(_DWORD *)buf = 67109120;
      int v74 = v15;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,numInitiatorContacts,%d", buf, 8u);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v54 = v5;
    obuint64_t j = v5;
    uint64_t v16 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      int v18 = 0;
      uint64_t v60 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v67 != v60) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1E016D870]();
          uint64_t v22 = [MEMORY[0x1E4F99890] createWithManagedObject:v20];
          long long v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v74 = v18 + i + 1;
            __int16 v75 = 2112;
            v76 = v22;
            _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,InitiatorContact,%d,%@", buf, 0x12u);
          }

          long long v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            long long v25 = [v22 phoneCache];
            long long v26 = [v25 outputToDictionary];
            *(_DWORD *)buf = 67109378;
            int v74 = v18 + i + 1;
            __int16 v75 = 2112;
            v76 = v26;
            _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,InitiatorContact,%d,phoneCache,%@", buf, 0x12u);
          }
          id v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = [v22 watchCache];
            v29 = [v28 outputToDictionary];
            *(_DWORD *)buf = 67109378;
            int v74 = v18 + i + 1;
            __int16 v75 = 2112;
            v76 = v29;
            _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,InitiatorContact,%d,watchCache,%@", buf, 0x12u);
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
        v18 += i;
      }
      while (v17);
    }

    v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v31 = [v57 count];
      *(_DWORD *)buf = 67109120;
      int v74 = v31;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,numReceiverContacts,%d", buf, 8u);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obja = v57;
    uint64_t v32 = [obja countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      int v34 = 0;
      uint64_t v61 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v63 != v61) {
            objc_enumerationMutation(obja);
          }
          uint64_t v36 = *(void *)(*((void *)&v62 + 1) + 8 * j);
          v37 = (void *)MEMORY[0x1E016D870]();
          v38 = [MEMORY[0x1E4F998E8] createWithManagedObject:v36];
          v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v74 = v34 + j + 1;
            __int16 v75 = 2112;
            v76 = v38;
            _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,%@", buf, 0x12u);
          }

          v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = [v38 sessionStatus];
            v42 = [v41 outputToDictionary];
            *(_DWORD *)buf = 67109378;
            int v74 = v34 + j + 1;
            __int16 v75 = 2112;
            v76 = v42;
            _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,sessionStatus,%@", buf, 0x12u);
          }
          v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = [v38 phoneCache];
            v45 = [v44 outputToDictionary];
            *(_DWORD *)buf = 67109378;
            int v74 = v34 + j + 1;
            __int16 v75 = 2112;
            v76 = v45;
            _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,phoneCache,%@", buf, 0x12u);
          }
          v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = [v38 watchCache];
            v48 = [v47 outputToDictionary];
            *(_DWORD *)buf = 67109378;
            int v74 = v34 + j + 1;
            __int16 v75 = 2112;
            v76 = v48;
            _os_log_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,watchCache,%@", buf, 0x12u);
          }
        }
        uint64_t v33 = [obja countByEnumeratingWithState:&v62 objects:v72 count:16];
        v34 += j;
      }
      while (v33);
    }

    uint64_t v7 = v52;
    uint64_t v49 = *(void *)(v51 + 32);
    id v4 = v55;
    id v3 = v56;
    unint64_t v6 = v53;
    int v5 = v54;
    id v8 = v57;
    uint64_t v10 = v50;
    if (v49) {
      (*(void (**)(uint64_t, void))(v49 + 16))(v49, 0);
    }
  }
}

uint64_t __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_49(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = v8;
  if (!a5)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      uint64_t v11 = NSString;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = [v11 stringWithFormat:@"error of type, %@, is not supported", v13];

      int v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = v14;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      int v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];

      id v19 = v18;
      *a5 = v19;

LABEL_8:
      v21 = 0;
      goto LABEL_13;
    }
    v21 = [(SMSafetyCacheStore *)self fetchRequestFromStoredLocationOptions:v9];
    [v21 setFetchOffset:a4];
  }
  else
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"options");
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v21;
}

- (void)_startFlushTimer
{
  if (!self->_flushTimer)
  {
    objc_initWeak(&location, self);
    timerManager = self->_timerManager;
    int v5 = [(RTNotifier *)self queue];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __38__SMSafetyCacheStore__startFlushTimer__block_invoke;
    uint64_t v11 = &unk_1E6B9CBF8;
    id v12 = self;
    v13[1] = (id)a2;
    objc_copyWeak(v13, &location);
    unint64_t v6 = [(RTTimerManager *)timerManager timerWithIdentifier:@"com.apple.routined.SafetyCache.flushTimer" queue:v5 handler:&v8];
    flushTimer = self->_flushTimer;
    self->_flushTimer = v6;

    -[RTTimer fireAfterDelay:interval:leeway:](self->_flushTimer, "fireAfterDelay:interval:leeway:", 75.0, 75.0, 15.0, v8, v9, v10, v11, v12);
    [(RTTimer *)self->_flushTimer resume];
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __38__SMSafetyCacheStore__startFlushTimer__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, %@, flushTimer timer expiry", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SMSafetyCacheStore__startFlushTimer__block_invoke_58;
  v8[3] = &unk_1E6B90CB8;
  uint64_t v4 = *(void *)(a1 + 48);
  void v8[4] = *(void *)(a1 + 32);
  v8[5] = v4;
  [WeakRetained _flushCachedLocationsWithHandler:v8];
}

void __38__SMSafetyCacheStore__startFlushTimer__block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, flushed cached locations, error, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_invalidateFlushTimer
{
  [(RTTimer *)self->_flushTimer invalidate];
  flushTimer = self->_flushTimer;
  self->_flushTimer = 0;
}

- (void)_flushCachedLocations
{
}

void __43__SMSafetyCacheStore__flushCachedLocations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "failed to flush cached location, error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_flushCachedLocationsWithHandler:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(NSMutableArray *)self->_locations count])
  {
    uint64_t v6 = (void *)[(NSMutableArray *)self->_locations copy];
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      __int16 v10 = NSStringFromSelector(a2);
      uint64_t v11 = [v6 count];
      __int16 v12 = [v6 firstObject];
      [v6 lastObject];
      id v13 = v21 = a2;
      *(_DWORD *)buf = 138413314;
      int v31 = v9;
      __int16 v32 = 2112;
      uint64_t v33 = v10;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      __int16 v36 = 2112;
      v37 = v12;
      __int16 v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, flushing %lu locations to cache, first, %@, last, %@", buf, 0x34u);

      a2 = v21;
    }

    [(NSMutableArray *)self->_locations removeAllObjects];
    [(SMSafetyCacheStore *)self _invalidateFlushTimer];
    uint64_t v14 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F99898]) initWithCLLocation:*(void *)(*((void *)&v25 + 1) + 8 * v19)];
          [v14 addObject:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __55__SMSafetyCacheStore__flushCachedLocationsWithHandler___block_invoke;
    v22[3] = &unk_1E6B916B8;
    v22[4] = self;
    SEL v24 = a2;
    id v23 = v5;
    [(RTStore *)self storeWritableObjects:v14 handler:v22];
  }
  else if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

void __55__SMSafetyCacheStore__flushCachedLocationsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  if (v3)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v9 = 138412546;
      __int16 v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)storeLocations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SMSafetyCacheStore_storeLocations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __45__SMSafetyCacheStore_storeLocations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeLocations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)enumerateStoredLocationsWithContext:(id)a3 usingBlock:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    char v46 = 0;
    if (v7)
    {
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      id v10 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke;
      block[3] = &unk_1E6B91220;
      block[4] = self;
      SEL v45 = a2;
      __int16 v11 = v9;
      v44 = v11;
      dispatch_async(v10, block);

      id v12 = v11;
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v14 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v12, v14))
      {
        v39 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v40 = v13;
        [v39 timeIntervalSinceDate:v13];
        double v16 = v15;
        uint64_t v17 = objc_opt_new();
        uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_223_0];
        uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v20 = [v19 filteredArrayUsingPredicate:v18];
        v21 = [v20 firstObject];

        __int16 v38 = v17;
        [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        id v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F5CFE8];
        v52[0] = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        char v25 = 1;
        long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v52 count:1];
        long long v27 = [v23 errorWithDomain:v24 code:15 userInfo:v26];

        if (v27)
        {
          id v28 = v27;

          char v25 = 0;
        }
        else
        {
          id v28 = 0;
        }
        id v13 = v40;
      }
      else
      {
        id v28 = 0;
        char v25 = 1;
      }

      id v33 = v28;
      if (v25)
      {
        __int16 v34 = [v7 options];
        uint64_t v35 = [(SMSafetyCacheStore *)self fetchRequestFromStoredLocationOptions:v34];

        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_63;
        v41[3] = &unk_1E6B97940;
        id v42 = v8;
        __int16 v36 = (void *)MEMORY[0x1E016DB00](v41);
        [(RTStore *)self enumerateType:objc_opt_class() fetchRequest:v35 enumerationBlock:v36];
      }
      else
      {
        (*((void (**)(id, void, id, char *))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], v33, &v46);
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F5CFE8];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      uint64_t v51 = @"requires non-nil options.";
      int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v12 = [v29 errorWithDomain:v30 code:7 userInfo:v31];

      __int16 v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v37 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v37;
        __int16 v48 = 2112;
        uint64_t v49 = v12;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      (*((void (**)(id, void, NSObject *, char *))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], v12, &v46);
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }
}

void __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2;
  v4[3] = &unk_1E6B90CB8;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _flushCachedLocationsWithHandler:v4];
}

void __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      long long v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_63(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        id v16 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        uint64_t v17 = [v16 initWithSMInitiatorLocation:v15, v18];
        [v9 addObject:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v8 || ![v10 count]) {
    *a4 = 1;
  }
}

- (void)fetchLastLocationWithHandler:(id)a3
{
  id v4 = a3;
  long long v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SMSafetyCacheStore_fetchLastLocationWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__SMSafetyCacheStore_fetchLastLocationWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLastLocationWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchLastLocationWithHandler:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke;
    v20[3] = &unk_1E6B96630;
    SEL v22 = a2;
    id v7 = v5;
    id v21 = v7;
    id v8 = (void *)MEMORY[0x1E016DB00](v20);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_74;
    v17[3] = &unk_1E6B97918;
    v17[4] = self;
    id v18 = v7;
    id v19 = v8;
    id v9 = v8;
    [(SMSafetyCacheStore *)self _flushCachedLocationsWithHandler:v17];

    id v10 = v21;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[SMSafetyCacheStore _fetchLastLocationWithHandler:]";
      __int16 v25 = 1024;
      LODWORD(v26) = 477;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"A handler is a required parameter.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      uint64_t v15 = (char *)objc_claimAutoreleasedReturnValue();
      id v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      long long v26 = v16;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, A handler is a required parameter, %@", buf, 0x20u);
    }
  }
}

void __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SMInitiatorLocationMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v25[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v4 setSortDescriptors:v6];

  id v16 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v16];

  id v8 = v16;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v15 = [v7 count];
    *(_DWORD *)buf = 138413058;
    id v18 = v14;
    __int16 v19 = 2112;
    long long v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v8)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = [v7 firstObject];
    id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    uint64_t v13 = [MEMORY[0x1E4F99898] createWithManagedObject:v11];
    id v10 = (void *)[v12 initWithSMInitiatorLocation:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_74(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void (*)(void))*((void *)a1[5] + 2);
    v3();
  }
  else
  {
    id v4 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_2;
    block[3] = &unk_1E6B943D8;
    block[4] = a1[4];
    id v6 = a1[6];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_3;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMSafetyCacheStore_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __62__SMSafetyCacheStore_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke;
    v19[3] = &unk_1E6B91018;
    id v20 = v7;
    __int16 v21 = self;
    SEL v23 = a2;
    id v9 = v8;
    id v22 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v19);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_76;
    v16[3] = &unk_1E6B97918;
    v16[4] = self;
    id v17 = v9;
    id v18 = v10;
    id v11 = v10;
    [(SMSafetyCacheStore *)self _flushCachedLocationsWithHandler:v16];

    id v12 = v20;
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v27 = "-[SMSafetyCacheStore _fetchStoredLocationsWithContext:handler:]";
      __int16 v28 = 1024;
      int v29 = 544;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v24 = *MEMORY[0x1E4F28568];
    __int16 v25 = @"A handler is a required parameter.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "A handler is a required parameter, %@", buf, 0xCu);
    }
  }
}

void __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  id v7 = *(void **)(a1 + 40);
  id v8 = [v5 options];
  id v9 = [v7 fetchRequestFromStoredLocationOptions:v8];

  [v9 setFetchOffset:[*(id *)(a1 + 32) offset]];
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v37 = [v9 fetchLimit];
    __int16 v38 = 2048;
    uint64_t v39 = [v9 fetchOffset];
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "using options fetch limit, %lu, fetch offset, %lu", buf, 0x16u);
  }

  id v34 = 0;
  id v11 = [v3 executeFetchRequest:v9 error:&v34];
  id v12 = v34;
  id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v25 = [v11 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v37 = (uint64_t)v24;
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v9;
    __int16 v40 = 2048;
    uint64_t v41 = v25;
    __int16 v42 = 2112;
    id v43 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v9 fetchLimit]];
  if (!v12)
  {
    long long v26 = v11;
    __int16 v27 = v9;
    id v28 = v3;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v11;
    uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v20 = (void *)MEMORY[0x1E016D870]();
          id v21 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          id v22 = [MEMORY[0x1E4F99898] createWithManagedObject:v19];
          SEL v23 = (void *)[v21 initWithSMInitiatorLocation:v22];

          if (v23) {
            [v14 addObject:v23];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }

    id v3 = v28;
    id v9 = v27;
    id v12 = 0;
    id v11 = v26;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_76(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void (*)(void))*((void *)a1[5] + 2);
    v3();
  }
  else
  {
    id v4 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_2;
    block[3] = &unk_1E6B943D8;
    block[4] = a1[4];
    id v6 = a1[6];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_3;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMSafetyCacheStore_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __62__SMSafetyCacheStore_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[SMSafetyCacheStore _fetchStoredLocationsWithOptions:handler:]";
      __int16 v12 = 1024;
      int v13 = 618;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CF38]) initWithEnumerationOptions:v6];
  [(SMSafetyCacheStore *)self _fetchStoredLocationsWithContext:v9 handler:v7];
}

- (void)removeLocationsPredating:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = a4;
    id v9 = [v7 predicateWithFormat:@"%K < %@", @"timestamp", v6];
    [(NSMutableArray *)self->_locations filterUsingPredicate:v9];
    uint64_t v17 = @"date";
    uint64_t v16 = objc_opt_class();
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    id v18 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    [(RTStore *)self purgePredating:v6 predicateMappings:v11 purgeLimit:50 handler:v8];
  }
  else
  {
    __int16 v12 = (void (**)(id, void *))a4;
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[SMSafetyCacheStore removeLocationsPredating:handler:]";
      __int16 v23 = 1024;
      int v24 = 629;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    id v20 = @"requires a valid date.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v11 = [v14 errorWithDomain:v15 code:7 userInfo:v9];
    v12[2](v12, v11);
  }
}

- (void)fetchMetricsWithOptions:(id)a3 handler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F5CFE8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"fetchMetricsWithOptions:handler: not supported";
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v10 = [v5 errorWithDomain:v6 code:7 userInfo:v9];
  (*((void (**)(id, void, void *))a4 + 2))(v8, 0, v10);
}

- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F5CFE8];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  v15[0] = @"fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler: not supported";
  int v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = a7;
  __int16 v12 = [v10 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  int v13 = [v8 errorWithDomain:v9 code:7 userInfo:v12];
  (*((void (**)(id, void, void *))a7 + 2))(v11, 0, v13);
}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  if ([(RTService *)self isShuttingDown])
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = [v7 count];
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "Ignoring %lu locations for storage, shutdown in progress", buf, 0xCu);
    }

LABEL_15:
    if (v8) {
      v8[2](v8, 0);
    }
    goto LABEL_17;
  }
  if ([v7 count])
  {
    [(NSMutableArray *)self->_locations addObjectsFromArray:v7];
    if ([(NSMutableArray *)self->_locations count] && !self->_flushTransaction)
    {
      int v10 = NSString;
      id v11 = (objc_class *)objc_opt_class();
      __int16 v12 = NSStringFromClass(v11);
      int v13 = NSStringFromSelector(a2);
      id v14 = [v10 stringWithFormat:@"%@-%@", v12, v13];
      [v14 UTF8String];
      uint64_t v15 = (OS_os_transaction *)os_transaction_create();
      flushTransaction = self->_flushTransaction;
      self->_flushTransaction = v15;

      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        long long v30 = (objc_class *)objc_opt_class();
        long long v31 = NSStringFromClass(v30);
        long long v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = (uint64_t)v31;
        __int16 v35 = 2112;
        __int16 v36 = v32;
        _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
      }
    }
    id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = (objc_class *)objc_opt_class();
      int v24 = NSStringFromClass(v23);
      uint64_t v25 = NSStringFromSelector(a2);
      uint64_t v26 = [v7 count];
      __int16 v27 = [v7 firstObject];
      id v28 = [v7 lastObject];
      uint64_t v29 = [(NSMutableArray *)self->_locations count];
      *(_DWORD *)buf = 138413570;
      uint64_t v34 = (uint64_t)v24;
      __int16 v35 = 2112;
      __int16 v36 = v25;
      __int16 v37 = 2048;
      uint64_t v38 = v26;
      __int16 v39 = 2112;
      __int16 v40 = v27;
      __int16 v41 = 2112;
      __int16 v42 = v28;
      __int16 v43 = 2048;
      uint64_t v44 = v29;
      _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "%@, %@, added %lu locations to cache, first, %@, last, %@, total, %lu", buf, 0x3Eu);
    }
    [(SMSafetyCacheStore *)self _startFlushTimer];
    if ((unint64_t)[(NSMutableArray *)self->_locations count] >= 0x97) {
      [(SMSafetyCacheStore *)self _flushCachedLocations];
    }
    goto LABEL_15;
  }
  if (v8)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F5CFE8];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v46[0] = @"requires valid locations.";
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    id v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];
    ((void (**)(id, void *))v8)[2](v8, v22);
  }
LABEL_17:
}

- (id)fetchRequestFromStoredLocationOptions:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[SMInitiatorLocationMO fetchRequest];
    [v4 setReturnsObjectsAsFaults:0];
    id v5 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:[v3 ascending]];
    v62[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
    [v4 setSortDescriptors:v6];

    id v7 = [v3 dateInterval];
    id v8 = [v7 startDate];
    uint64_t v9 = v8;
    if (v8)
    {
      int v10 = v8;
    }
    else
    {
      int v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    __int16 v12 = v10;

    int v13 = [v3 dateInterval];
    id v14 = [v13 endDate];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    id v17 = v16;

    [v3 horizontalAccuracy];
    if (v18 == 0.0)
    {
      double v20 = 1.79769313e308;
    }
    else
    {
      [v3 horizontalAccuracy];
      double v20 = v19;
    }
    if ([v3 batchSize])
    {
      unint64_t v21 = [v3 batchSize];
      uint64_t v22 = 3600;
      if (v21 < 0xE10) {
        uint64_t v22 = v21;
      }
    }
    else
    {
      uint64_t v22 = 3600;
    }
    uint64_t v55 = v22;
    [MEMORY[0x1E4F1CA48] array];
    v58 = v57 = v12;
    __int16 v23 = (void *)MEMORY[0x1E4F28BA0];
    int v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ <= %K", v12, @"date"];
    v61[0] = v24;
    id v56 = v17;
    uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"date", v17];
    v61[1] = v25;
    uint64_t v26 = (void *)MEMORY[0x1E4F28F60];
    __int16 v27 = [NSNumber numberWithDouble:v20];
    id v28 = [v26 predicateWithFormat:@"%K <= %@", @"hunc", v27];
    v61[2] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
    long long v30 = [v23 andPredicateWithSubpredicates:v29];

    long long v31 = v58;
    [v58 addObject:v30];
    long long v32 = [v3 boundingBoxLocation];

    if (v32)
    {
      *(void *)buf = 0;
      long long v33 = [v3 boundingBoxLocation];
      [v33 coordinate];
      uint64_t v34 = [v3 boundingBoxLocation];
      [v34 coordinate];
      [v3 boundingBoxLocation];
      v35 = unint64_t v53 = v30;
      [v35 horizontalAccuracy];
      RTCommonCalculateBoundingBox();

      uint64_t v50 = (void *)MEMORY[0x1E4F28BA0];
      __int16 v36 = (void *)MEMORY[0x1E4F28F60];
      v52 = [NSNumber numberWithDouble:0.0];
      uint64_t v51 = [v36 predicateWithFormat:@"%@ <= %K", v52, @"longitude"];
      v60[0] = v51;
      __int16 v37 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v38 = [NSNumber numberWithDouble:0.0];
      __int16 v39 = [v37 predicateWithFormat:@"%K <= %@", @"longitude", v38];
      v60[1] = v39;
      v54 = v4;
      __int16 v40 = (void *)MEMORY[0x1E4F28F60];
      __int16 v41 = [NSNumber numberWithDouble:0.0];
      __int16 v42 = [v40 predicateWithFormat:@"%@ <= %K", v41, @"latitude"];
      v60[2] = v42;
      __int16 v43 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v44 = [NSNumber numberWithDouble:0.0];
      uint64_t v45 = [v43 predicateWithFormat:@"%K <= %@", @"latitude", v44];
      v60[3] = v45;
      char v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
      v47 = [v50 andPredicateWithSubpredicates:v46];

      long long v30 = v53;
      id v4 = v54;

      long long v31 = v58;
      [v58 addObject:v47];
    }
    __int16 v48 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v31];
    [v4 setPredicate:v48];

    [v4 setFetchBatchSize:50];
    [v4 setFetchLimit:v55];

    id v11 = v57;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }
    id v4 = 0;
  }

  return v4;
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (RTTimer)flushTimer
{
  return self->_flushTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_flushTransaction, 0);

  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end