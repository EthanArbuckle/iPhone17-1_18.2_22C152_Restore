@interface RTPersistenceRemoteStore
- (RTPersistenceRemoteStore)init;
- (RTPersistenceRemoteStore)initWithReadOnly:(BOOL)a3;
- (id)_createManagedObjectContext;
- (id)createManagedObjectContext;
- (void)updateCurrentDeviceMOIDWithContext:(id)a3;
@end

@implementation RTPersistenceRemoteStore

- (RTPersistenceRemoteStore)init
{
  return [(RTPersistenceRemoteStore *)self initWithReadOnly:1];
}

- (RTPersistenceRemoteStore)initWithReadOnly:(BOOL)a3
{
  BOOL v3 = a3;
  v48.receiver = self;
  v48.super_class = (Class)RTPersistenceRemoteStore;
  v4 = [(RTPersistenceRemoteStore *)&v48 init];
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v5 = objc_opt_new();
  notificationHelper = v4->_notificationHelper;
  v4->_notificationHelper = (RTDarwinNotificationHelper *)v5;

  objc_initWeak(&location, v4);
  v7 = v4->_notificationHelper;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke;
  v45[3] = &unk_1E6B91900;
  v30 = &v46;
  objc_copyWeak(&v46, &location);
  [(RTDarwinNotificationHelper *)v7 addObserverForNotificationName:@"kRTPersistenceDeviceIdentityChanged" handler:v45];
  v8 = objc_opt_new();
  id v9 = objc_alloc(MEMORY[0x1E4F1C188]);
  v10 = [v8 latestModel];
  uint64_t v11 = [v9 initWithManagedObjectModel:v10];
  coordinator = v4->_coordinator;
  v4->_coordinator = (NSPersistentStoreCoordinator *)v11;

  v13 = +[RTPersistenceManager defaultStoresDirectory];
  v14 = [v13 URLByAppendingPathComponent:@"Cache"];
  v15 = [v14 URLByAppendingPathExtension:@"sqlite"];

  v16 = +[RTPersistenceManager defaultStoresDirectory];
  v17 = [v16 URLByAppendingPathComponent:@"Cloud-V2"];
  v18 = [v17 URLByAppendingPathExtension:@"sqlite"];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C190]) initWithURL:v15];
  uint64_t v20 = *MEMORY[0x1E4F1BFF8];
  [v19 setType:*MEMORY[0x1E4F1BFF8]];
  [v19 setConfiguration:@"Cache"];
  [v19 setShouldInferMappingModelAutomatically:1];
  [v19 setShouldMigrateStoreAutomatically:0];
  [v19 setShouldAddStoreAsynchronously:0];
  [v19 setReadOnly:v3];
  uint64_t v21 = *MEMORY[0x1E4F1BFE8];
  [v19 setOption:@"com.apple.routined.store.cache" forKey:*MEMORY[0x1E4F1BFE8]];
  uint64_t v22 = *MEMORY[0x1E4F1BFC8];
  [v19 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BFC8]];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C190]) initWithURL:v18];
  [v23 setType:v20];
  [v23 setConfiguration:@"Cloud"];
  [v23 setShouldInferMappingModelAutomatically:1];
  [v23 setShouldMigrateStoreAutomatically:0];
  [v23 setShouldAddStoreAsynchronously:0];
  [v23 setReadOnly:v3];
  [v23 setOption:@"com.apple.routined.store.cloud" forKey:v21];
  [v23 setOption:MEMORY[0x1E4F1CC38] forKey:v22];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__108;
  v43 = __Block_byref_object_dispose__108;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__108;
  v37 = __Block_byref_object_dispose__108;
  id v38 = 0;
  v24 = v4->_coordinator;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_5;
  v32[3] = &unk_1E6B99E90;
  v32[4] = &v33;
  [(NSPersistentStoreCoordinator *)v24 addPersistentStoreWithDescription:v19 completionHandler:v32];
  v25 = v4->_coordinator;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_7;
  v31[3] = &unk_1E6B99E90;
  v31[4] = &v39;
  [(NSPersistentStoreCoordinator *)v25 addPersistentStoreWithDescription:v23 completionHandler:v31];
  if (v34[5] || v40[5])
  {
    int v26 = 1;
  }
  else
  {
    v29 = [(RTPersistenceRemoteStore *)v4 _createManagedObjectContext];
    [(RTPersistenceRemoteStore *)v4 updateCurrentDeviceMOIDWithContext:v29];
    if (v4->_currentDeviceManagedObjectId)
    {
      int v26 = 0;
    }
    else
    {

      v4 = 0;
      int v26 = 1;
    }
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  if (v26)
  {
    v27 = 0;
  }
  else
  {
LABEL_7:
    v4 = v4;
    v27 = v4;
  }

  return v27;
}

void __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained _createManagedObjectContext];
    [v3 updateCurrentDeviceMOIDWithContext:v2];

    id WeakRetained = v3;
  }
}

void __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

void __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (void)updateCurrentDeviceMOIDWithContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__RTPersistenceRemoteStore_updateCurrentDeviceMOIDWithContext___block_invoke;
    v7[3] = &unk_1E6B90BF0;
    id v8 = v4;
    uint64_t v9 = self;
    [v8 performBlockAndWait:v7];
    v6 = v8;
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }
  }
}

void __63__RTPersistenceRemoteStore_updateCurrentDeviceMOIDWithContext___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = +[RTPersistenceManager defaultStoresDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"Cloud-V2"];
  id v4 = [v3 URLByAppendingPathExtension:@"sqlite"];

  id v5 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  v6 = [v5 persistentStoreForURL:v4];

  int v7 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v8 = [v7 metadataForPersistentStore:v6];
  uint64_t v9 = v8;
  if (!v8) {
    id v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  v10 = (void *)[v8 mutableCopy];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"RTPersistentStoreMetadataDeviceRecordIDKey"];
  v12 = +[RTDeviceMO fetchRequest];
  v13 = (void *)MEMORY[0x1E4F28F60];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
  v15 = [v13 predicateWithFormat:@"identifier == %@", v14];
  [v12 setPredicate:v15];

  v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v26 = v11;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "fetching device record with identifier %@", buf, 0xCu);
  }

  v17 = *(void **)(a1 + 32);
  id v24 = 0;
  v18 = [v17 executeFetchRequest:v12 error:&v24];
  id v19 = v24;
  if ([v18 count])
  {
    uint64_t v20 = [v18 firstObject];
    uint64_t v21 = [v20 objectID];
    uint64_t v22 = *(void *)(a1 + 40);
    v23 = *(void **)(v22 + 16);
    *(void *)(v22 + 16) = v21;
  }
  else
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v26 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "failed to fetch device record with identifier %@", buf, 0xCu);
    }
  }
}

- (id)_createManagedObjectContext
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  id v4 = [MEMORY[0x1E4F1C130] mergeByPropertyObjectTrumpMergePolicy];
  [v3 setMergePolicy:v4];

  [v3 setPersistentStoreCoordinator:self->_coordinator];
  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  v6 = [v5 processName];
  [v3 setTransactionAuthor:v6];

  return v3;
}

- (id)createManagedObjectContext
{
  id v3 = [(RTPersistenceRemoteStore *)self _createManagedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__RTPersistenceRemoteStore_createManagedObjectContext__block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = self;
  [v4 performBlockAndWait:v7];
  id v5 = v4;

  return v5;
}

void __54__RTPersistenceRemoteStore_createManagedObjectContext__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16);
  id v5 = @"RTPersistenceDriverUserInfoDeviceMOIDKey";
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 addEntriesFromDictionary:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_currentDeviceManagedObjectId, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end