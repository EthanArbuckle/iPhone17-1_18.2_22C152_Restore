@interface STAdminPersistenceController
+ (BOOL)isUnitTestRunning;
+ (STAdminPersistenceController)sharedController;
- (BOOL)saveContext:(id)a3 error:(id *)a4;
- (STAdminPersistenceController)init;
- (STXPCStoreServerEndpointFactory)storeServerEndpointFactory;
- (id)newBackgroundContext;
- (id)viewContext;
- (void)performBackgroundTask:(id)a3;
- (void)performBackgroundTaskAndWait:(id)a3;
- (void)setStoreServerEndpointFactory:(id)a3;
@end

@implementation STAdminPersistenceController

+ (STAdminPersistenceController)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__STAdminPersistenceController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_sharedController;
  return (STAdminPersistenceController *)v2;
}

void __48__STAdminPersistenceController_sharedController__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[STLog persistence];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = (id)objc_opt_class();
    id v1 = v5;
    _os_log_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEFAULT, "Created shared instance of “%{public}@”", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v2 = objc_opt_new();
  v3 = (void *)sharedController_sharedController;
  sharedController_sharedController = v2;
}

- (STAdminPersistenceController)init
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)STAdminPersistenceController;
  uint64_t v2 = [(STPersistenceController *)&v16 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v3 = objc_opt_new();
      storeServerEndpointFactory = v2->_storeServerEndpointFactory;
      v2->_storeServerEndpointFactory = (STXPCStoreServerEndpointFactory *)v3;
    }
    id v5 = [(STPersistenceController *)v2 persistentContainer];
    if (+[STAdminPersistenceController isUnitTestRunning])
    {
      uint64_t v6 = +[STLog persistence];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v6, OS_LOG_TYPE_INFO, "Device is running in unit test mode. Configuring a test screen time database.", buf, 2u);
      }

      v7 = +[STPersistenceConfiguration persistentStoreDescriptionForConfigurationName:@"Local" type:*MEMORY[0x1E4F1BF70]];
      v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/dev/null"];
      [v7 setURL:v8];

      [v7 setConfiguration:@"Local"];
      [v7 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BE80]];
      v22[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v5 setPersistentStoreDescriptions:v9];

      v10 = +[STLog persistence];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    else
    {
      v7 = +[STPersistenceConfiguration localPersistentXPCStoreDescription];
      if (_os_feature_enabled_impl())
      {
        v11 = [(STAdminPersistenceController *)v2 storeServerEndpointFactory];
        [v7 setOption:v11 forKey:*MEMORY[0x1E4F1BFE0]];
      }
      v17 = v7;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      [v5 setPersistentStoreDescriptions:v12];

      v10 = +[STLog persistence];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    *(_DWORD *)buf = 138543618;
    v19 = v2;
    __int16 v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_INFO, "%{public}@ loading persistent store: %{public}@", buf, 0x16u);
LABEL_13:

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__STAdminPersistenceController_init__block_invoke;
    v14[3] = &unk_1E6BC6CE8;
    v15 = v2;
    [v5 loadPersistentStoresWithCompletionHandler:v14];
  }
  return v2;
}

void __36__STAdminPersistenceController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[STLog persistence];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_fault_impl(&dword_1DA519000, v8, OS_LOG_TYPE_FAULT, "%{public}@ unable to load persistent store %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v10;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_INFO, "%{public}@ loaded persistent store %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)saveContext:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(STPersistenceController *)self localStore];

  if ([v6 hasChanges])
  {
    if (v7)
    {
      v8 = [(STPersistenceController *)self persistentContainer];
      uint64_t v9 = [v8 persistentStoreCoordinator];
      uint64_t v10 = [(STPersistenceController *)self localStore];
      v17[0] = v10;
      int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      uint64_t v12 = [v9 currentPersistentHistoryTokenFromStores:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
    BOOL v14 = +[STConsistencyChecker validateWithManagedObjectContext:v6 error:a4];
    if (a4) {
      BOOL v13 = v14;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (![v6 save:a4])
      {
        BOOL v13 = 0;
        goto LABEL_18;
      }
      if (!_os_feature_enabled_impl()
        || +[STAdminPersistenceController isUnitTestRunning])
      {
        BOOL v13 = 1;
LABEL_18:

        goto LABEL_19;
      }
      __int16 v15 = objc_opt_new();
      [v15 processSettingsChangesSinceHistoryToken:v12 withCompletion:&__block_literal_global];
    }
    else
    {
      __int16 v15 = +[STLog persistence];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[STAdminPersistenceController saveContext:error:]((uint64_t *)a4, v15);
      }
    }

    goto LABEL_18;
  }
  BOOL v13 = 1;
LABEL_19:

  return v13;
}

void __50__STAdminPersistenceController_saveContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[STLog persistence];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __50__STAdminPersistenceController_saveContext_error___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)performBackgroundTask:(id)a3
{
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  id v6 = [(STAdminPersistenceController *)self viewContext];
  if (v5)
  {
    v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v8 = __54__STAdminPersistenceController_performBackgroundTask___block_invoke;
  }
  else
  {
    v7 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v8 = __54__STAdminPersistenceController_performBackgroundTask___block_invoke_2;
  }
  v7[2] = v8;
  v7[3] = &unk_1E6BC6D30;
  v7[4] = self;
  v7[5] = v4;
  id v9 = v4;
  [v6 performBlock:v7];
}

void __54__STAdminPersistenceController_performBackgroundTask___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) viewContext];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __54__STAdminPersistenceController_performBackgroundTask___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) viewContext];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)performBackgroundTaskAndWait:(id)a3
{
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  id v6 = [(STAdminPersistenceController *)self viewContext];
  if (v5)
  {
    v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v8 = __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke;
  }
  else
  {
    v7 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v8 = __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke_2;
  }
  v7[2] = v8;
  v7[3] = &unk_1E6BC6D30;
  v7[4] = self;
  v7[5] = v4;
  id v9 = v4;
  [v6 performBlockAndWait:v7];
}

void __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) viewContext];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) viewContext];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (id)newBackgroundContext
{
  if (_os_feature_enabled_impl())
  {
    id v4 = [MEMORY[0x1E4F29060] currentThread];
    int v5 = [MEMORY[0x1E4F29060] mainThread];

    if (v4 != v5)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"STAdminPersistenceController.m" lineNumber:169 description:@"new background context is being called from a background thread"];
    }
    id v6 = [(STPersistenceController *)self persistentContainer];
    v7 = [v6 viewContext];
  }
  else
  {
    v8 = [(STPersistenceController *)self persistentContainer];
    v7 = (void *)[v8 newBackgroundContext];

    [v7 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  }
  return v7;
}

- (id)viewContext
{
  id v2 = [(STPersistenceController *)self persistentContainer];
  uint64_t v3 = [v2 viewContext];

  [v3 setAutomaticallyMergesChangesFromParent:1];
  [v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  return v3;
}

+ (BOOL)isUnitTestRunning
{
  return NSClassFromString(&cfstr_Xctestprobe.isa) != 0;
}

- (STXPCStoreServerEndpointFactory)storeServerEndpointFactory
{
  return (STXPCStoreServerEndpointFactory *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreServerEndpointFactory:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)saveContext:(uint64_t *)a1 error:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "ManagedObjectContext save failed. Error reported when running ConsistencyChecker: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __50__STAdminPersistenceController_saveContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Screen Time agent failed to process settings changes: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end