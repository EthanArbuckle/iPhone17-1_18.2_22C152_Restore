@interface STPersistenceController
- (BOOL)hasStoreLoaded;
- (BOOL)saveContext:(id)a3 error:(id *)a4;
- (NSManagedObjectContext)viewContext;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentStore)cloudStore;
- (NSPersistentStore)localStore;
- (OS_dispatch_queue)coreDataQueue;
- (STDebouncer)changeNotificationDebouncer;
- (STPersistenceController)init;
- (STPersistenceController)initWithPersistentContainer:(id)a3 persistentStoreChangeHandler:(id)a4 notificationDebouncer:(id)a5;
- (STPersistentStoreChangeHandler)changeHandler;
- (id)descriptionForPersistentStore:(id)a3;
- (id)newBackgroundContext;
- (void)_logAboutMissingStoreName:(id)a3;
- (void)_persistentStoreCoordinatorStoresDidChange:(id)a3;
- (void)_remotePersistentStoreChangesDidCoalesce:(id)a3;
- (void)debouncer:(id)a3 didDebounce:(id)a4;
- (void)performBackgroundTask:(id)a3;
- (void)performBackgroundTaskAndWait:(id)a3;
- (void)remotePersistentStoreDidChange:(id)a3;
- (void)setCoreDataQueue:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation STPersistenceController

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (STPersistenceController)initWithPersistentContainer:(id)a3 persistentStoreChangeHandler:(id)a4 notificationDebouncer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)STPersistenceController;
  v12 = [(STPersistenceController *)&v20 init];
  objc_storeStrong((id *)&v12->_persistentContainer, a3);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.ScreenTimeAgent.core-data", 0);
  coreDataQueue = v12->_coreDataQueue;
  v12->_coreDataQueue = (OS_dispatch_queue *)v13;

  objc_storeStrong((id *)&v12->_changeHandler, a4);
  objc_storeStrong((id *)&v12->_changeNotificationDebouncer, a5);
  v15 = [(NSPersistentContainer *)v12->_persistentContainer persistentStoreCoordinator];
  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:v12 selector:sel_remotePersistentStoreDidChange_ name:*MEMORY[0x1E4F1BEE8] object:v15];

  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:v12 selector:sel_remotePersistentStoreDidChange_ name:*MEMORY[0x1E4F1BF38] object:v15];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v12 selector:sel__persistentStoreCoordinatorStoresDidChange_ name:*MEMORY[0x1E4F1BEA0] object:v15];
  }
  return v12;
}

- (STPersistenceController)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C150]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = +[STPersistenceConfiguration managedObjectModel];
  v7 = (void *)[v3 initWithName:v5 managedObjectModel:v6];

  v8 = [[STConcretePersistentStoreChangeHandler alloc] initWithPersistentContainer:v7];
  id v9 = [[STDebouncer alloc] initWithMinCoalescenceInterval:1.0 maxCoalescenceInterval:5.0];
  [(STDebouncer *)v9 setDelegate:self];
  id v10 = [(STPersistenceController *)self initWithPersistentContainer:v7 persistentStoreChangeHandler:v8 notificationDebouncer:v9];

  return v10;
}

- (BOOL)saveContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasChanges]) {
    char v6 = [v5 save:a4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)performBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = [(STPersistenceController *)self coreDataQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__STPersistenceController_performBackgroundTask___block_invoke;
  v7[3] = &unk_1E6BC7080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__STPersistenceController_performBackgroundTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBackgroundTaskAndWait:*(void *)(a1 + 40)];
}

- (void)performBackgroundTaskAndWait:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog persistence];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = +[STLog persistence];
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DA519000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CoreData Task", "", buf, 2u);
  }

  id v9 = self->_coreDataQueue;
  objc_sync_enter(v9);
  id v10 = [(STPersistenceController *)self newBackgroundContext];
  [v10 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __56__STPersistenceController_performBackgroundTaskAndWait___block_invoke;
  v18 = &unk_1E6BC6D30;
  id v11 = v4;
  id v20 = v11;
  id v12 = v10;
  id v19 = v12;
  [v12 performBlockAndWait:&v15];

  objc_sync_exit(v9);
  dispatch_queue_t v13 = +[STLog persistence];
  v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DA519000, v14, OS_SIGNPOST_INTERVAL_END, v6, "CoreData Task", "", buf, 2u);
  }
}

uint64_t __56__STPersistenceController_performBackgroundTaskAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)newBackgroundContext
{
  v2 = [(STPersistenceController *)self persistentContainer];
  id v3 = (void *)[v2 newBackgroundContext];

  [v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  return v3;
}

- (NSManagedObjectContext)viewContext
{
  v2 = [(STPersistenceController *)self persistentContainer];
  id v3 = [v2 viewContext];

  return (NSManagedObjectContext *)v3;
}

- (NSPersistentStore)localStore
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(STPersistenceController *)self persistentContainer];
  id v4 = [v3 persistentStoreCoordinator];
  id v5 = [v4 persistentStores];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      id v12 = [v11 configurationName];
      char v13 = [v12 isEqualToString:@"Local"];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (v14) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  [(STPersistenceController *)self _logAboutMissingStoreName:v6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "URL", (void)v25);
        v22 = [v21 lastPathComponent];
        int v23 = [v22 containsString:@"Local"];

        if (v23)
        {
          id v14 = v20;
          goto LABEL_21;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_21:

LABEL_22:
  return (NSPersistentStore *)v14;
}

- (NSPersistentStore)cloudStore
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(STPersistenceController *)self persistentContainer];
  id v4 = [v3 persistentStoreCoordinator];
  id v5 = [v4 persistentStores];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      id v12 = [v11 configurationName];
      char v13 = [v12 isEqualToString:@"Cloud"];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (v14) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  [(STPersistenceController *)self _logAboutMissingStoreName:v6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "URL", (void)v25);
        v22 = [v21 lastPathComponent];
        int v23 = [v22 containsString:@"Cloud"];

        if (v23)
        {
          id v14 = v20;
          goto LABEL_21;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_21:

LABEL_22:
  return (NSPersistentStore *)v14;
}

- (BOOL)hasStoreLoaded
{
  return 1;
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(STPersistenceController *)self changeNotificationDebouncer];

  uint64_t v8 = v9;
  if (v7 == v6 && v9)
  {
    [(STPersistenceController *)self _remotePersistentStoreChangesDidCoalesce:v9];
    uint64_t v8 = v9;
  }
}

- (id)descriptionForPersistentStore:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configurationName];
  id v5 = [v3 URL];
  id v6 = [v3 URL];
  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/dev/null"];
  int v8 = [v6 isEqual:v7];

  if (v8) {
    [v3 type];
  }
  else {
  id v9 = [v5 lastPathComponent];
  }
  uint64_t v10 = [v4 stringByAppendingPathComponent:v9];

  return v10;
}

- (void)remotePersistentStoreDidChange:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog persistence];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STPersistenceController remotePersistentStoreDidChange:](v5);
  }

  id v6 = [(STPersistenceController *)self changeNotificationDebouncer];
  [v6 bounce:v4];
}

- (void)_remotePersistentStoreChangesDidCoalesce:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog persistence];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STPersistenceController _remotePersistentStoreChangesDidCoalesce:](v5);
  }

  id v6 = [(STPersistenceController *)self coreDataQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__STPersistenceController__remotePersistentStoreChangesDidCoalesce___block_invoke;
  v8[3] = &unk_1E6BC7D98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __68__STPersistenceController__remotePersistentStoreChangesDidCoalesce___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) persistentContainer];
  id v4 = (id)[v2 newBackgroundContext];

  [v4 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  id v3 = [*(id *)(a1 + 32) changeHandler];
  [v3 handleRemotePersistentStoreDidChange:*(void *)(a1 + 40) inContext:v4];
}

- (void)_persistentStoreCoordinatorStoresDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(STPersistenceController *)self changeHandler];
  [v5 handlePersistentStoreCoordinatorStoresDidChange:v4];
}

- (void)_logAboutMissingStoreName:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__STPersistenceController__logAboutMissingStoreName___block_invoke;
  block[3] = &unk_1E6BC7DC0;
  id v7 = v3;
  uint64_t v4 = _logAboutMissingStoreName__onceToken[0];
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(_logAboutMissingStoreName__onceToken, block);
  }
}

void __53__STPersistenceController__logAboutMissingStoreName___block_invoke(uint64_t a1)
{
  v2 = +[STLog mirroring];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__STPersistenceController__logAboutMissingStoreName___block_invoke_cold_1(a1, v2);
  }
}

- (void)setPersistentContainer:(id)a3
{
}

- (OS_dispatch_queue)coreDataQueue
{
  return self->_coreDataQueue;
}

- (void)setCoreDataQueue:(id)a3
{
}

- (STPersistentStoreChangeHandler)changeHandler
{
  return (STPersistentStoreChangeHandler *)objc_getProperty(self, a2, 24, 1);
}

- (STDebouncer)changeNotificationDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotificationDebouncer, 0);
  objc_storeStrong((id *)&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_coreDataQueue, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)remotePersistentStoreDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "STPersistenceController received remote store change notification", v1, 2u);
}

- (void)_remotePersistentStoreChangesDidCoalesce:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "STPersistenceController remote store change notifications did coalesce", v1, 2u);
}

void __53__STPersistenceController__logAboutMissingStoreName___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v4 valueForKey:@"configurationName"];
  id v6 = [*(id *)(a1 + 32) valueForKey:@"metadata"];
  int v7 = 138412802;
  int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Unexpectedly missing store configuration names.\nStores: %@\nNames: %@\nMeta: %@", (uint8_t *)&v7, 0x20u);
}

@end