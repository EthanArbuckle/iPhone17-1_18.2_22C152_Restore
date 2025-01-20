@interface RTPersistenceManager
+ (id)defaultModelsDirectory;
+ (id)defaultStoresDirectory;
+ (id)protectedStoreFilesExtensions;
+ (unint64_t)storeTypeForURL:(id)a3;
- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4;
- (BOOL)_setupPersistenceContainers;
- (BOOL)initializeContainer;
- (BOOL)initializePersistenceStores;
- (BOOL)persistenceContextPerformedSave:(id)a3 error:(id *)a4;
- (BOOL)persistenceContextShouldExecute:(id)a3;
- (RTPersistenceDelegate)delegate;
- (RTPersistenceManager)init;
- (RTPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4;
- (RTPersistenceMirroringDelegate)mirroringDelegate;
- (id)URLForStoreType:(unint64_t)a3;
- (id)historyTokenForStoreType:(unint64_t)a3;
- (id)latestModel;
- (id)managedObjectContext;
- (id)modelFollowingModel:(id)a3;
- (id)modelNamed:(id)a3;
- (id)outstandingContexts;
- (id)persistenceContextWithOptions:(unint64_t)a3;
- (id)persistenceStoreConfigurations;
- (id)persistenceStoreForType:(unint64_t)a3;
- (id)sortedModelNames;
- (id)storeDescriptionForStoreWithType:(unint64_t)a3;
- (id)urlForModelWithName:(id)a3;
- (id)waitForPersistenceContext;
- (int64_t)mirroringDelegateStateForStoreType:(unint64_t)a3;
- (unint64_t)availability;
- (unint64_t)countOfPersistenceStores;
- (void)_onCoreDataResetSync:(id)a3;
- (void)_setupRemoteStoreServers;
- (void)_shutdownWithHandler:(id)a3;
- (void)_updateAvailabilityAfterSetupAttemptWithAvailability:(unint64_t)a3;
- (void)_updateStoreAvailability:(unint64_t)a3;
- (void)container:(id)a3 failedToActivateRequestsQueue:(id)a4;
- (void)container:(id)a3 willActivateRequestsQueue:(id)a4;
- (void)createManagedObjectContext:(id)a3;
- (void)dealloc;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)mirroringDelegateSetupState:(id)a3;
- (void)onCoreDataResetSync:(id)a3;
- (void)performExportMirroringRequest:(id)a3;
- (void)performExportMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4;
- (void)performImportMirroringRequest:(id)a3;
- (void)performImportMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4;
- (void)performMirroringRequestOfType:(int64_t)a3 qualityOfService:(int64_t)a4 handler:(id)a5;
- (void)performZoneResetMirroringRequest:(id)a3;
- (void)performZoneResetMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4;
- (void)persistenceContext:(id)a3 encounteredError:(id)a4;
- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setAvailability:(unint64_t)a3;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMirroringDelegate:(id)a3;
- (void)setupPersistenceContainers:(id)a3;
- (void)tearDownPersistenceStack:(id)a3;
- (void)trackContext:(id)a3;
- (void)updateStoreAvailability:(unint64_t)a3;
@end

@implementation RTPersistenceManager

- (BOOL)persistenceContextShouldExecute:(id)a3
{
  return [(RTPersistenceManager *)self availability] == 2;
}

- (unint64_t)availability
{
  return self->_availability;
}

- (RTPersistenceManager)init
{
  v3 = +[RTPersistenceManager defaultModelsDirectory];
  v4 = +[RTPersistenceManager defaultStoresDirectory];
  v5 = [(RTPersistenceManager *)self initWithModelsDirectory:v3 storesDirectory:v4];

  return v5;
}

- (RTPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isFileURL] & 1) == 0)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTPersistenceManager initWithModelsDirectory:storesDirectory:]";
      __int16 v37 = 1024;
      int v38 = 162;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: modelsDirectory.isFileURL (in %s:%d)", buf, 0x12u);
    }
  }
  if (([v7 isFileURL] & 1) == 0)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTPersistenceManager initWithModelsDirectory:storesDirectory:]";
      __int16 v37 = 1024;
      int v38 = 163;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: storesDirectory.isFileURL (in %s:%d)", buf, 0x12u);
    }
  }
  if (![v6 isFileURL] || !objc_msgSend(v7, "isFileURL")) {
    goto LABEL_18;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTPersistenceManager;
  v10 = [(RTNotifier *)&v34 init];
  self = v10;
  if (v10)
  {
    v10->_availability = 0;
    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v6 path];
    v13 = [v11 fileURLWithPath:v12 isDirectory:1];
    modelsDirectory = self->_modelsDirectory;
    self->_modelsDirectory = v13;

    v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [v7 path];
    v17 = [v15 fileURLWithPath:v16 isDirectory:1];
    storesDirectory = self->_storesDirectory;
    self->_storesDirectory = v17;

    v19 = (NSRecursiveLock *)objc_opt_new();
    pointerArrayLock = self->_pointerArrayLock;
    self->_pointerArrayLock = v19;

    v21 = (NSRecursiveLock *)objc_opt_new();
    storesArrayLock = self->_storesArrayLock;
    self->_storesArrayLock = v21;

    v23 = (NSMutableArray *)objc_opt_new();
    remoteServers = self->_remoteServers;
    self->_remoteServers = v23;

    uint64_t v25 = [(RTPersistenceManager *)self latestModel];
    if (v25)
    {
      v26 = (void *)v25;
      v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 addObserver:self selector:sel_onCoreDataResetSync_ name:*MEMORY[0x1E4F1BDA8] object:0];

      v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v28 addObserver:self selector:sel_onCoreDataResetSync_ name:*MEMORY[0x1E4F1BD98] object:0];

      v29 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
      outstandingContexts = self->_outstandingContexts;
      self->_outstandingContexts = v29;

      goto LABEL_14;
    }
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTPersistenceManager initWithModelsDirectory:storesDirectory:]";
      __int16 v37 = 1024;
      int v38 = 182;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Expected at least one model in _modelsDirectory (in %s:%d)", buf, 0x12u);
    }

LABEL_18:
    v31 = 0;
    goto LABEL_19;
  }
LABEL_14:
  self = self;
  v31 = self;
LABEL_19:

  return v31;
}

- (BOOL)initializePersistenceStores
{
  BOOL v3 = 0;
  unint64_t v4 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    uint64_t v5 = [(RTPersistenceManager *)self storeDescriptionForStoreWithType:v4];
    if (!v5) {
      break;
    }
    id v6 = (void *)v5;
    id v7 = [[RTPersistenceStore alloc] initWithStoreDescription:v5];
    if (!v7)
    {
      v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        v15 = "-[RTPersistenceManager initializePersistenceStores]";
        __int16 v16 = 1024;
        int v17 = 214;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Persistence store must not be nil (in %s:%d)", (uint8_t *)&v14, 0x12u);
      }

      v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v14) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_FAULT, "Persistence store must not be nil", (uint8_t *)&v14, 2u);
      }

      return v3;
    }
    v8 = v7;
    [(NSRecursiveLock *)self->_storesArrayLock lock];
    v9 = self->_stores[v4];
    self->_stores[v4] = v8;
    v10 = v8;

    [(NSRecursiveLock *)self->_storesArrayLock unlock];
    BOOL v3 = v4++ > 2;
    if (v4 == 4) {
      return 1;
    }
  }
  return v3;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    uint64_t v5 = v6;
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RTPersistenceManager;
  [(RTPersistenceManager *)&v4 dealloc];
}

- (BOOL)initializeContainer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_container)
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      int v14 = "-[RTPersistenceManager initializeContainer]";
      __int16 v15 = 1024;
      int v16 = 245;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Expected container to be nil (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

    if (self->_container)
    {
      WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v13) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, WeakRetained, OS_LOG_TYPE_FAULT, "Expected container to be nil", (uint8_t *)&v13, 2u);
      }
      goto LABEL_10;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v5 = WeakRetained != 0;
  if (!WeakRetained)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      int v14 = "-[RTPersistenceManager initializeContainer]";
      __int16 v15 = 1024;
      int v16 = 252;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Expected a delegate. (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

    id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_FAULT, "Expected a delegate.", (uint8_t *)&v13, 2u);
    }
    goto LABEL_15;
  }
  if ([(RTPersistenceManager *)self initializePersistenceStores])
  {
    id v6 = [(RTPersistenceManager *)self persistenceStoreConfigurations];
    id v7 = [RTPersistenceContainer alloc];
    v8 = [(RTPersistenceManager *)self latestModel];
    v9 = [(RTPersistenceContainer *)v7 initWithName:@"All" model:v8 configurations:v6];
    container = self->_container;
    self->_container = v9;

    [(RTPersistenceContainer *)self->_container setDelegate:self];
LABEL_15:

    goto LABEL_16;
  }
LABEL_10:
  BOOL v5 = 0;
LABEL_16:

  return v5;
}

+ (id)protectedStoreFilesExtensions
{
  v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  if (!protectedStoreFilesExtensions_cacheFilesExtensions)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:@"sqlite", @"sqlite-wal", @"sqlite-shm", nil];
    objc_super v4 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
    protectedStoreFilesExtensions_cacheFilesExtensions = v3;

    v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  }

  return v2;
}

- (void)createManagedObjectContext:(id)a3
{
  id v4 = a3;
  container = self->_container;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RTPersistenceManager_createManagedObjectContext___block_invoke;
  v7[3] = &unk_1E6B97278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RTPersistenceContainer *)container persistenceContextWithHandler:v7];
}

void __51__RTPersistenceManager_createManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDelegate:v3];
  [*(id *)(a1 + 32) trackContext:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)managedObjectContext
{
  uint64_t v3 = [(RTPersistenceContainer *)self->_container persistenceContext];
  [v3 setDelegate:self];
  [(RTPersistenceManager *)self trackContext:v3];

  return v3;
}

- (id)persistenceContextWithOptions:(unint64_t)a3
{
  id v4 = [(RTPersistenceContainer *)self->_container persistenceContextWithOptions:a3];
  [v4 setDelegate:self];
  [(RTPersistenceManager *)self trackContext:v4];

  return v4;
}

- (id)waitForPersistenceContext
{
  uint64_t v3 = [(RTPersistenceContainer *)self->_container waitForPersistenceContext];
  [v3 setDelegate:self];
  [(RTPersistenceManager *)self trackContext:v3];

  return v3;
}

- (void)trackContext:(id)a3
{
  pointerArrayLock = self->_pointerArrayLock;
  id v5 = a3;
  [(NSRecursiveLock *)pointerArrayLock lock];
  [(NSPointerArray *)self->_outstandingContexts addPointer:v5];

  id v6 = self->_pointerArrayLock;

  [(NSRecursiveLock *)v6 unlock];
}

- (void)setContainer:(id)a3
{
}

- (void)setupPersistenceContainers:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RTPersistenceManager_setupPersistenceContainers___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__RTPersistenceManager_setupPersistenceContainers___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupPersistenceContainers];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_setupPersistenceContainers
{
  if ([(RTPersistenceContainer *)self->_container storesNeedSetup])
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "setting up containers", v9, 2u);
    }

    id v4 = [(RTPersistenceManager *)self persistenceStoreConfigurations];
    BOOL v5 = [(RTPersistenceContainer *)self->_container updateContainerConfigurations:v4];
    container = self->_container;
    if (v5)
    {
      [(RTPersistenceContainer *)container setupPersistenceStores];
    }
    else
    {
      if ([(RTPersistenceContainer *)container storesNeedSetup]) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      [(RTPersistenceManager *)self _updateAvailabilityAfterSetupAttemptWithAvailability:v7];
    }
  }
  return [(RTPersistenceManager *)self availability] == 2;
}

- (void)tearDownPersistenceStack:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RTPersistenceManager_tearDownPersistenceStack___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__RTPersistenceManager_tearDownPersistenceStack___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStoreAvailability:1];
  [*(id *)(*(void *)(a1 + 32) + 88) setServeContexts:0];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 88) tearDownPersistenceStack];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 88);
  *(void *)(v2 + 88) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)_setupRemoteStoreServers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  for (uint64_t i = 0; i != 4; ++i)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [WeakRetained remoteServerOptionsForStoreWithType:i];
      if (v4)
      {
        id v5 = [(RTPersistenceManager *)self sortedModelNames];
        id v6 = [v5 lastObject];
        uint64_t v7 = [(RTPersistenceManager *)self urlForModelWithName:v6];

        id v8 = [RTPersistenceRemoteStoreServer alloc];
        v9 = [(RTPersistenceManager *)self URLForStoreType:i];
        v10 = [(RTPersistenceRemoteStoreServer *)v8 initWithStoreURL:v9 modelURL:v7 options:v4];

        if (v10 && ([(NSMutableArray *)self->_remoteServers containsObject:v10] & 1) == 0)
        {
          [(NSMutableArray *)self->_remoteServers addObject:v10];
          [(RTPersistenceRemoteStoreServer *)v10 startListening];
        }
      }
    }
  }
}

- (id)URLForStoreType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 >= 4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[RTPersistenceManager URLForStoreType:]";
      __int16 v11 = 1024;
      int v12 = 402;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= type && type < RTPersistenceStoreTypeCount (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  if (a3 > 3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = [(NSURL *)self->_storesDirectory URLByAppendingPathComponent:off_1E6B97330[a3]];
    uint64_t v7 = [v6 URLByAppendingPathExtension:@"sqlite"];
  }

  return v7;
}

+ (unint64_t)storeTypeForURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "+[RTPersistenceManager storeTypeForURL:]";
      __int16 v11 = 1024;
      int v12 = 415;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  id v5 = [v3 lastPathComponent];
  id v6 = [v5 stringByDeletingPathExtension];
  if ([v6 isEqualToString:@"Cache"])
  {
    unint64_t v7 = 0;
  }
  else if ([v6 isEqualToString:@"Cloud-V2"])
  {
    unint64_t v7 = 1;
  }
  else if ([v6 isEqualToString:@"Local"])
  {
    unint64_t v7 = 2;
  }
  else if ([v6 isEqualToString:@"SafetyCache"])
  {
    unint64_t v7 = 3;
  }
  else
  {
    unint64_t v7 = 4;
  }

  return v7;
}

- (id)persistenceStoreConfigurations
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  unint64_t v5 = 0;
  *(void *)&long long v6 = 136315394;
  long long v18 = v6;
  do
  {
    [(NSRecursiveLock *)self->_storesArrayLock lock];
    unint64_t v7 = self->_stores[v5];
    [(NSRecursiveLock *)self->_storesArrayLock unlock];
    if (v7)
    {
      if (objc_opt_respondsToSelector())
      {
        id v8 = [WeakRetained mirroringOptionsForStoreWithType:v5];
        int v9 = [v8 objectForKeyedSubscript:@"RTPersistenceDriverMirroringDelegateOptionsKey"];
        [(RTPersistenceStore *)v7 setMirroringDelegateOptions:v9];
      }
      v10 = [RTPersistenceMigrator alloc];
      __int16 v11 = [(RTPersistenceManager *)self delegate];
      int v12 = [(RTPersistenceMigrator *)v10 initWithStore:v7 modelProvider:self delegate:v11];
      [(RTPersistenceStore *)v7 setMigrator:v12];

      uint64_t v13 = [(RTPersistenceStore *)v7 migrator];

      if (!v13)
      {
        int v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          v20 = "-[RTPersistenceManager persistenceStoreConfigurations]";
          __int16 v21 = 1024;
          int v22 = 445;
          _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Persistence store migrator must not be nil (in %s:%d)", buf, 0x12u);
        }
      }
      if (v5 > 3) {
        __int16 v15 = 0;
      }
      else {
        __int16 v15 = off_1E6B97350[v5];
      }
      int v16 = [[RTPersistenceStoreConfiguration alloc] initWithName:v15 readOnly:0 store:v7];
      if (v16) {
        [v4 addObject:v16];
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      int v16 = (RTPersistenceStoreConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v18;
        v20 = "-[RTPersistenceManager persistenceStoreConfigurations]";
        __int16 v21 = 1024;
        int v22 = 432;
        _os_log_error_impl(&dword_1D9BFA000, &v16->super, OS_LOG_TYPE_ERROR, "Persistence store must not be nil (in %s:%d)", buf, 0x12u);
      }
    }

    ++v5;
  }
  while (v5 != 4);

  return v4;
}

- (id)storeDescriptionForStoreWithType:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 >= 4)
  {
    unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTPersistenceManager storeDescriptionForStoreWithType:]";
      __int16 v27 = 1024;
      int v28 = 462;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= type && type < RTPersistenceStoreTypeCount (in %s:%d)", buf, 0x12u);
    }
  }
  long long v6 = [(RTPersistenceManager *)self URLForStoreType:a3];
  if (v6)
  {
    unint64_t v7 = objc_opt_new();
    [v7 setShouldAddStoreAsynchronously:0];
    [v7 setShouldMigrateStoreAutomatically:0];
    [v7 setShouldInferMappingModelAutomatically:0];
    [v7 setURL:v6];
    [v7 setType:*MEMORY[0x1E4F1BF70]];
    [v7 setOption:*MEMORY[0x1E4F28348] forKey:*MEMORY[0x1E4F1BEC0]];
    [v7 setValue:@"WAL" forPragmaNamed:@"journal_mode"];
    if (a3 - 1 <= 2) {
      [v7 setOption:MEMORY[0x1E4F1CC08] forKey:*MEMORY[0x1E4F1BE80]];
    }
    id v8 = [(RTPersistenceManager *)self delegate];
    if (!v8)
    {
      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[RTPersistenceManager storeDescriptionForStoreWithType:]";
        __int16 v27 = 1024;
        int v28 = 488;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "no available persistence delegate (in %s:%d)", buf, 0x12u);
      }

      int v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_FAULT, "no available persistence delegate", buf, 2u);
      }
      v10 = 0;
      goto LABEL_29;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v23 = 0;
      int v9 = [v8 optionsForStoreWithType:a3 error:&v23];
      v10 = 0;
      if (v23)
      {
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      int v9 = 0;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v9 = v9;
    uint64_t v12 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v17 = -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v16, (void)v19);
          [v7 setOption:v17 forKey:v16];
        }
        uint64_t v13 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }

    v10 = v7;
    goto LABEL_29;
  }
  unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown URL for store type", buf, 2u);
  }
  v10 = 0;
LABEL_30:

  return v10;
}

- (int64_t)mirroringDelegateStateForStoreType:(unint64_t)a3
{
  if (a3 < 4)
  {
    [(NSRecursiveLock *)self->_storesArrayLock lock];
    int64_t v7 = [(RTPersistenceStore *)self->_stores[a3] mirroringDelegateState];
    [(NSRecursiveLock *)self->_storesArrayLock unlock];
    return v7;
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= storeType && storeType < RTPersistenceStoreTypeCount", v8, 2u);
    }

    return 0;
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [[RTPersistenceManagerNotificationAvailabilityDidChange alloc] initWithAvailability:[(RTPersistenceManager *)self availability]];
    [(RTNotifier *)self postNotification:v10 toObserver:v6];
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2080;
      uint64_t v16 = "-[RTPersistenceManager internalAddObserver:name:]";
      __int16 v17 = 1024;
      int v18 = 536;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "unhandled notification %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

- (void)updateStoreAvailability:(unint64_t)a3
{
  unint64_t v5 = [(RTNotifier *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__RTPersistenceManager_updateStoreAvailability___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __48__RTPersistenceManager_updateStoreAvailability___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 88) suspendPersistenceStores];
  }
  else if (v2 == 2)
  {
    [*(id *)(*(void *)(a1 + 32) + 88) resumePersistenceStores];
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 _updateStoreAvailability:v4];
}

- (void)_updateStoreAvailability:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(RTPersistenceManager *)self availability] != a3)
  {
    [(RTPersistenceManager *)self setAvailability:a3];
    unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = [(RTPersistenceManager *)self availability];
      id v7 = @"Unknown";
      if (v6 == 1) {
        id v7 = @"Unavailable";
      }
      if (v6 == 2) {
        id v7 = @"Available";
      }
      id v8 = v7;
      int v10 = 138412290;
      __int16 v11 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "update persistence manager available, %@", (uint8_t *)&v10, 0xCu);
    }
    int v9 = [[RTPersistenceManagerNotificationAvailabilityDidChange alloc] initWithAvailability:[(RTPersistenceManager *)self availability]];
    [(RTNotifier *)self postNotification:v9];
  }
}

- (id)latestModel
{
  latestModel = self->_latestModel;
  if (!latestModel)
  {
    uint64_t v4 = [(RTPersistenceManager *)self sortedModelNames];
    unint64_t v5 = [v4 lastObject];
    unint64_t v6 = [(RTPersistenceManager *)self modelNamed:v5];
    id v7 = self->_latestModel;
    self->_latestModel = v6;

    latestModel = self->_latestModel;
  }

  return latestModel;
}

- (id)modelFollowingModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(RTPersistenceManager *)self sortedModelNames];
    unint64_t v6 = [v4 versionIdentifiers];
    id v7 = [v6 anyObject];

    unint64_t v8 = [v5 indexOfObject:v7 inSortedRange:0 options:1536 usingComparator:&__block_literal_global_61];
    int v9 = 0;
    if (v8 < [v5 count])
    {
      int v10 = [v5 objectAtIndexedSubscript:v8];
      int v9 = [(RTPersistenceManager *)self modelNamed:v10];
    }
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v13 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: model", v13, 2u);
    }

    int v9 = 0;
  }

  return v9;
}

uint64_t __44__RTPersistenceManager_modelFollowingModel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (id)sortedModelNames
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  sortedModelNames = self->_sortedModelNames;
  if (!sortedModelNames)
  {
    id v4 = [MEMORY[0x1E4F28CB8] sortedContentsOfDirectoryAtURL:self->_modelsDirectory withExtension:@"mom"];
    if (![v4 count])
    {
      unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        int v10 = "-[RTPersistenceManager sortedModelNames]";
        __int16 v11 = 1024;
        int v12 = 606;
        _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Expected at least one model in _modelsDirectory (in %s:%d)", (uint8_t *)&v9, 0x12u);
      }
    }
    unint64_t v6 = [v4 valueForKeyPath:@"lastPathComponent.stringByDeletingPathExtension"];
    id v7 = self->_sortedModelNames;
    self->_sortedModelNames = v6;

    sortedModelNames = self->_sortedModelNames;
  }

  return sortedModelNames;
}

- (id)urlForModelWithName:(id)a3
{
  if (a3)
  {
    id v4 = [a3 stringByAppendingPathExtension:@"mom"];
    unint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1 relativeToURL:self->_modelsDirectory];
  }
  else
  {
    unint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", v8, 2u);
    }

    unint64_t v5 = 0;
  }

  return v5;
}

- (id)modelNamed:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(RTPersistenceManager *)self urlForModelWithName:v4];
    unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v5];
    if (!v6)
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412802;
        id v11 = v4;
        __int16 v12 = 2080;
        uint64_t v13 = "-[RTPersistenceManager modelNamed:]";
        __int16 v14 = 1024;
        int v15 = 630;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Model named, %@, doesn't appear to exist. (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
      }
    }
    unint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [v6 setVersionIdentifiers:v8];
  }
  else
  {
    unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", (uint8_t *)&v10, 2u);
    }
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)persistenceContext:(id)a3 encounteredError:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 domain];
  uint64_t v9 = *MEMORY[0x1E4F1BF50];
  int v10 = [v8 isEqualToString:*MEMORY[0x1E4F1BF50]];

  if (v10)
  {
    id v11 = [NSNumber numberWithInteger:[v7 code]];
    if (v11) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v23 = [v7 domain];
    int v24 = [v23 isEqual:*MEMORY[0x1E4F281F8]];

    if (!v24) {
      goto LABEL_29;
    }
    uint64_t v25 = [v7 code];
    __int16 v17 = 0;
    if (v25 == 256 || v25 == 259)
    {
      int v15 = 0;
    }
    else
    {
      int v15 = 0;
      if (v25 != 512) {
        goto LABEL_29;
      }
    }
LABEL_25:
    v26 = [(RTPersistenceManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v26 persistenceStore:v17 encounteredCriticalError:v7];
    }

    goto LABEL_28;
  }
  long long v22 = [v7 userInfo];
  id v11 = [v22 objectForKeyedSubscript:v9];

  if (!v11) {
    goto LABEL_15;
  }
LABEL_3:
  int v12 = [v11 intValue];
  if (v12 == 11 || v12 == 26)
  {
    __int16 v14 = [v7 userInfo];
    int v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28328]];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0];
      [(NSRecursiveLock *)self->_storesArrayLock lock];
      __int16 v17 = self->_stores[+[RTPersistenceManager storeTypeForURL:v16]];
      [(NSRecursiveLock *)self->_storesArrayLock unlock];
      int v18 = [v6 persistentStoreCoordinator];
      v30 = @"RTPersistentStoreMetadataStoreCorruptKey";
      v31[0] = MEMORY[0x1E4F1CC38];
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      id v27 = 0;
      [(RTPersistenceStore *)v17 updateMetadata:v19 coordinator:v18 error:&v27];
      id v20 = v27;

      if (v20)
      {
        long long v21 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v20;
          _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Failed to update metadata, %@", buf, 0xCu);
        }
      }
    }
    else
    {
      __int16 v17 = 0;
    }
    goto LABEL_25;
  }
  if (v12 == 1555)
  {
    int v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_FAULT, "Save failed due to primary key constraints. Please file a radar with sysdiagnose and \"wedge diagnose\" and attach to rdar://50515616", buf, 2u);
    }
LABEL_28:
  }
LABEL_29:
}

- (BOOL)persistenceContextPerformedSave:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mirroringDelegate);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v5 = [v20 persistentStoreCoordinator];
  id v6 = [v5 persistentStores];

  id v7 = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    uint64_t v11 = *MEMORY[0x1E4F1BED8];
    uint64_t v12 = *MEMORY[0x1E4F1BED0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v15 = [v14 options];
        uint64_t v16 = [v15 objectForKey:v11];
        __int16 v17 = [v16 objectForKey:v12];

        if (v17) {
          [WeakRetained performMirroringRequestWithType:1 affectedStore:v14 qualityOfService:[v20 mirroringQualityOfService] handler:0];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if (a4) {
    *a4 = 0;
  }

  return 1;
}

- (void)performMirroringRequestOfType:(int64_t)a3 qualityOfService:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke;
  v10[3] = &unk_1E6B972F0;
  v10[4] = self;
  id v11 = v8;
  int64_t v12 = a3;
  int64_t v13 = a4;
  id v9 = v8;
  [(RTPersistenceManager *)self createManagedObjectContext:v10];
}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke(uint64_t a1, void *a2)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
    long long v23 = objc_opt_new();
    group = dispatch_group_create();
    id v25 = v3;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v4 = [v3 persistentStoreCoordinator];
    unint64_t v5 = [v4 persistentStores];

    id obj = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      uint64_t v9 = *MEMORY[0x1E4F1BED8];
      uint64_t v10 = *MEMORY[0x1E4F1BED0];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(obj);
          }
          int64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          int64_t v13 = [v12 options];
          __int16 v14 = [v13 objectForKey:v9];
          int v15 = [v14 objectForKey:v10];

          if (v15)
          {
            dispatch_group_enter(group);
            uint64_t v16 = *(void *)(a1 + 48);
            uint64_t v17 = *(void *)(a1 + 56);
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_93;
            v30[3] = &unk_1E6B972C8;
            v30[4] = *(void *)(a1 + 32);
            id v31 = v23;
            v32 = group;
            [WeakRetained performMirroringRequestWithType:v16 affectedStore:v12 qualityOfService:v17 managedObjectContext:v25 handler:v30];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v7);
    }

    int v18 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_3;
    block[3] = &unk_1E6B90CE0;
    id v28 = v23;
    id v29 = *(id *)(a1 + 40);
    uint64_t v19 = v23;
    id v20 = group;
    dispatch_group_notify(group, v18, block);

    id v3 = v25;
  }
  else
  {
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"A managed object context is required to perform a mirroring request.";
    id WeakRetained = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:7 userInfo:nil];
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v20);
    }
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v20;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "invalid managed object context while servicing mirroring request, %@", buf, 0xCu);
    }
  }
}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_93(id *a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1[4] queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_2;
  v8[3] = &unk_1E6B972A0;
  char v12 = a2;
  id v9 = v5;
  id v10 = a1[5];
  id v11 = a1[6];
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    if (!v2) {
      goto LABEL_6;
    }
LABEL_5:
    [*(id *)(a1 + 40) addObject:];
    goto LABEL_6;
  }
  if (v2) {
    goto LABEL_5;
  }
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:0 userInfo:0];
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }

LABEL_6:
  id v3 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v3);
}

void __79__RTPersistenceManager_performMirroringRequestOfType_qualityOfService_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _RTSafeArray();
  id v3 = _RTMultiErrorCreate();

  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "multiple errors occurred while servicing mirroring request, %@", buf, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, void *))(v5 + 16))(v5, v3 == 0, v3);
  }
}

- (void)performImportMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4
{
}

- (void)performExportMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4
{
}

- (void)performZoneResetMirroringRequestWithQualityOfService:(int64_t)a3 handler:(id)a4
{
}

- (void)onCoreDataResetSync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RTPersistenceManager_onCoreDataResetSync___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __44__RTPersistenceManager_onCoreDataResetSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onCoreDataResetSync:*(void *)(a1 + 40)];
}

- (void)_onCoreDataResetSync:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [v4 name];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F1BDA8]];

  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v4 userInfo];
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F1BDA0]];
      int v20 = 134217984;
      uint64_t v21 = [v10 unsignedIntegerValue];
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "received will reset sync notification, reason %lu", (uint8_t *)&v20, 0xCu);
    }
    id v11 = [v4 userInfo];
    char v12 = [(RTPersistenceContainer *)self->_container persistenceContextWithOptions:1];
    [WeakRetained persistenceManagerWillStartResetSync:self userInfo:v11 context:v12];

    [(RTPersistenceContainer *)self->_container suspendPersistenceStores];
    [(RTPersistenceManager *)self _updateStoreAvailability:1];
  }
  else
  {
    int64_t v13 = [v4 name];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F1BD98]];

    if (v14)
    {
      int v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "received did reset sync notification", (uint8_t *)&v20, 2u);
      }

      uint64_t v16 = [v4 userInfo];
      [WeakRetained persistenceManagerDidFinishResetSync:self userInfo:v16];

      [(RTPersistenceContainer *)self->_container resumePersistenceStores];
      [(RTPersistenceManager *)self _updateStoreAvailability:2];
      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "initiating import after reset sync", (uint8_t *)&v20, 2u);
      }

      [(RTPersistenceManager *)self performImportMirroringRequestWithQualityOfService:3 handler:&__block_literal_global_97];
    }
    else
    {
      int v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [v4 name];
        int v20 = 138412802;
        uint64_t v21 = (uint64_t)v19;
        __int16 v22 = 2080;
        long long v23 = "-[RTPersistenceManager _onCoreDataResetSync:]";
        __int16 v24 = 1024;
        int v25 = 856;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "unknown notification name %@ (in %s:%d)", (uint8_t *)&v20, 0x1Cu);
      }
    }
  }
}

void __45__RTPersistenceManager__onCoreDataResetSync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "finished import after reset sync, error, %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)outstandingContexts
{
  [(NSRecursiveLock *)self->_pointerArrayLock lock];
  id v3 = [(NSPointerArray *)self->_outstandingContexts allObjects];
  [(NSRecursiveLock *)self->_pointerArrayLock unlock];

  return v3;
}

- (id)historyTokenForStoreType:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3 < 4)
  {
    id v3 = -[RTPersistenceManager URLForStoreType:](self, "URLForStoreType:");
    if (v3)
    {
      int v5 = [(RTPersistenceContainer *)self->_container coordinator];
      id v6 = [v5 persistentStoreForURL:v3];

      if (v6)
      {
        uint64_t v7 = [(RTPersistenceContainer *)self->_container coordinator];
        v12[0] = v6;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        id v9 = [v7 currentPersistentHistoryTokenFromStores:v8];
      }
      else
      {
        id v9 = 0;
      }

      goto LABEL_10;
    }
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= storeType && storeType < RTPersistenceStoreTypeCount", v11, 2u);
    }
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

- (id)persistenceStoreForType:(unint64_t)a3
{
  if (a3 < 4)
  {
    [(NSRecursiveLock *)self->_storesArrayLock lock];
    id v4 = self->_stores[a3];
    [(NSRecursiveLock *)self->_storesArrayLock unlock];
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0 <= storeType && storeType < RTPersistenceStoreTypeCount", v8, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (unint64_t)countOfPersistenceStores
{
  return 4;
}

+ (id)defaultModelsDirectory
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
  id v3 = [v2 URLForResource:@"CoreRoutine" withExtension:@"momd"];

  return v3;
}

+ (id)defaultStoresDirectory
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] routineCacheDirectoryPath];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)container:(id)a3 willActivateRequestsQueue:(id)a4
{
}

- (void)container:(id)a3 failedToActivateRequestsQueue:(id)a4
{
}

- (void)_updateAvailabilityAfterSetupAttemptWithAvailability:(unint64_t)a3
{
  [(RTPersistenceManager *)self _updateStoreAvailability:a3];
  if ([(RTPersistenceManager *)self availability] == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained persistenceManager:self didFinishSetup:1];
    }
    [(RTPersistenceManager *)self _setupRemoteStoreServers];
  }
}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(RTPersistenceManager *)self delegate];
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v18 = 0;
      goto LABEL_24;
    }
    aSelector = a2;
    uint64_t v27 = a4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (uint64_t i = 0; i != 4; ++i)
    {
      [(NSRecursiveLock *)self->_storesArrayLock lock];
      id v11 = self->_stores[i];
      [(NSRecursiveLock *)self->_storesArrayLock unlock];
      if (v11)
      {
        id v28 = 0;
        char v12 = [v8 copyPersistenceStore:v11 outputURL:v7 error:&v28];
        id v13 = v28;
        if ((v12 & 1) == 0)
        {
          int v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v11;
            __int16 v31 = 2112;
            uint64_t v32 = (uint64_t)v13;
            _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "copy persistence store, %@, error, %@", buf, 0x16u);
          }

          if (v13) {
            [v9 addObject:v13];
          }
        }
      }
    }
    int v15 = _RTSafeArray();
    uint64_t v16 = _RTMultiErrorCreate();

    if (v27) {
      id *v27 = v16;
    }
    uint64_t v17 = [v9 count];
    BOOL v18 = v17 == 0;
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      uint64_t v21 = (RTPersistenceStore *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = NSStringFromSelector(aSelector);
      long long v23 = (void *)v22;
      __int16 v24 = @"NO:";
      *(_DWORD *)buf = 138413058;
      v30 = v21;
      __int16 v31 = 2112;
      if (!v17) {
        __int16 v24 = @"YES";
      }
      uint64_t v32 = v22;
      __int16 v33 = 2112;
      long long v34 = v24;
      __int16 v35 = 2112;
      long long v36 = v16;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@ %@, success, %@, error, %@", buf, 0x2Au);
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: strongDelegate", buf, 2u);
    }
    BOOL v18 = 0;
  }

LABEL_24:
  return v18;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTPersistenceManager_sendDiagnosticsToURL_options_handler___block_invoke;
  block[3] = &unk_1E6B91C48;
  id v19 = v11;
  SEL v20 = a2;
  void block[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v12, block);
}

void __61__RTPersistenceManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v6 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    SEL v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = (uint64_t)v5;
    __int16 v23 = 2112;
    __int16 v24 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@ %@, options, %@", buf, 0x20u);
  }
  if ([*(id *)(a1 + 40) hasMask:1])
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v18 = 0;
    int v9 = [v7 _generateDiagnosticFilesAtURL:v8 error:&v18];
    id v10 = v18;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      id v15 = (void *)v14;
      uint64_t v16 = @"NO";
      *(_DWORD *)buf = 138413058;
      SEL v20 = v13;
      __int16 v21 = 2112;
      if (v9) {
        uint64_t v16 = @"YES";
      }
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      __int16 v24 = v16;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@ %@, success, %@, error, %@", buf, 0x2Au);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
}

- (RTPersistenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTPersistenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RTPersistenceMirroringDelegate)mirroringDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mirroringDelegate);

  return (RTPersistenceMirroringDelegate *)WeakRetained;
}

- (void)setMirroringDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mirroringDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteServers, 0);
  objc_storeStrong((id *)&self->_outstandingContexts, 0);
  objc_storeStrong((id *)&self->_storesArrayLock, 0);
  objc_storeStrong((id *)&self->_pointerArrayLock, 0);
  objc_storeStrong((id *)&self->_latestModel, 0);
  objc_storeStrong((id *)&self->_container, 0);
  for (uint64_t i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_stores[i], 0);
  objc_storeStrong((id *)&self->_sortedModelNames, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);

  objc_storeStrong((id *)&self->_modelsDirectory, 0);
}

- (void)performImportMirroringRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__RTPersistenceManager_Internal__performImportMirroringRequest___block_invoke;
  v6[3] = &unk_1E6B93658;
  id v7 = v4;
  id v5 = v4;
  [(RTPersistenceManager *)self performImportMirroringRequestWithQualityOfService:3 handler:v6];
}

void __64__RTPersistenceManager_Internal__performImportMirroringRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v4)
    {
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = [v4 domain];
      int v9 = [v7 errorWithDomain:v8 code:[v4 code] userInfo:0];

      uint64_t v5 = *(void *)(a1 + 32);
    }
    else
    {
      int v9 = 0;
    }
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);
  }
}

- (void)performExportMirroringRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__RTPersistenceManager_Internal__performExportMirroringRequest___block_invoke;
  v6[3] = &unk_1E6B93658;
  id v7 = v4;
  id v5 = v4;
  [(RTPersistenceManager *)self performExportMirroringRequestWithQualityOfService:3 handler:v6];
}

void __64__RTPersistenceManager_Internal__performExportMirroringRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v4)
    {
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = [v4 domain];
      int v9 = [v7 errorWithDomain:v8 code:[v4 code] userInfo:0];

      uint64_t v5 = *(void *)(a1 + 32);
    }
    else
    {
      int v9 = 0;
    }
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);
  }
}

- (void)performZoneResetMirroringRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__RTPersistenceManager_Internal__performZoneResetMirroringRequest___block_invoke;
  v6[3] = &unk_1E6B93658;
  id v7 = v4;
  id v5 = v4;
  [(RTPersistenceManager *)self performZoneResetMirroringRequestWithQualityOfService:3 handler:v6];
}

void __67__RTPersistenceManager_Internal__performZoneResetMirroringRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v4)
    {
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = [v4 domain];
      int v9 = [v7 errorWithDomain:v8 code:[v4 code] userInfo:0];

      uint64_t v5 = *(void *)(a1 + 32);
    }
    else
    {
      int v9 = 0;
    }
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);
  }
}

- (void)mirroringDelegateSetupState:(id)a3
{
  id v6 = a3;
  int64_t v4 = [(RTPersistenceManager *)self mirroringDelegateStateForStoreType:1];
  uint64_t v5 = v6;
  if (v6)
  {
    (*((void (**)(id, int64_t, void))v6 + 2))(v6, v4, 0);
    uint64_t v5 = v6;
  }
}

@end