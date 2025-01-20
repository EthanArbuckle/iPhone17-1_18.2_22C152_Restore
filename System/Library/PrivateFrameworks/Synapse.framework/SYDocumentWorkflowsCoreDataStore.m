@interface SYDocumentWorkflowsCoreDataStore
+ (BOOL)removePersistentStoreWithError:(id *)a3;
+ (id)_persistentStoreDirURL;
- (BOOL)_saveContext:(id)a3 error:(id *)a4;
- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6;
- (NSPersistentContainer)persistentContainer;
- (NSURL)modelURL;
- (id)_fetchRecordWithRelatedUniqueIdentifier:(id)a3 context:(id)a4 error:(id *)a5;
- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4;
- (void)persistentContainer;
- (void)setPersistentContainer:(id)a3;
@end

@implementation SYDocumentWorkflowsCoreDataStore

+ (id)_persistentStoreDirURL
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [v2 URLsForDirectory:14 inDomains:1];
  v4 = [v3 firstObject];

  v5 = [v4 URLByAppendingPathComponent:@"com.apple.synapse"];

  return v5;
}

+ (BOOL)removePersistentStoreWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [a1 _persistentStoreDirURL];
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v17 = v6;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_DEFAULT, "Remove to persistent store directory at: %{private}@", buf, 0xCu);
  }

  v8 = [v6 path];
  char v9 = [v5 fileExistsAtPath:v8];

  if (v9)
  {
    id v15 = 0;
    char v10 = [v5 removeItemAtURL:v6 error:&v15];
    id v11 = v15;
    if ((v10 & 1) == 0)
    {
      v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[SYDocumentWorkflowsCoreDataStore removePersistentStoreWithError:]();
      }
    }
    if (a3) {
      *a3 = v11;
    }
  }
  else
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v17 = v6;
      _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_INFO, "Unable to find persistent store directory at: %{private}@", buf, 0xCu);
    }

    if (a3) {
      *a3 = 0;
    }
    char v10 = 1;
  }

  return v10;
}

- (NSURL)modelURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/PrivateFrameworks/Synapse.framework/SYDocumentWorkflowsModel.momd"];
}

- (NSPersistentContainer)persistentContainer
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_persistentContainer)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [(SYDocumentWorkflowsCoreDataStore *)v2 modelURL];
    v5 = [v4 path];
    char v6 = [v3 fileExistsAtPath:v5];

    if ((v6 & 1) == 0)
    {
      v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = [(SYDocumentWorkflowsCoreDataStore *)v2 modelURL];
        [(SYDocumentWorkflowsCoreDataStore *)v8 persistentContainer];
      }
    }
    id v9 = objc_alloc(MEMORY[0x1E4F1C120]);
    char v10 = [(SYDocumentWorkflowsCoreDataStore *)v2 modelURL];
    v38 = (void *)[v9 initWithContentsOfURL:v10];

    id v11 = [MEMORY[0x1E4F1C150] persistentContainerWithName:@"SYDocumentWorkflowsModel" managedObjectModel:v38];
    if (!v11)
    {
      v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[SYDocumentWorkflowsCoreDataStore persistentContainer](v12);
      }
    }
    v13 = [(id)objc_opt_class() _persistentStoreDirURL];
    v14 = [v13 path];
    int v15 = [v3 fileExistsAtPath:v14];

    v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v17 = [v16 BOOLForKey:@"SYPersistentStoreDirIsClean"];
    uint64_t v18 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v45 = v15;
      __int16 v46 = 1024;
      int v47 = v17;
      _os_log_impl(&dword_1C2C5F000, v18, OS_LOG_TYPE_DEFAULT, "Persistent store directory exists: %{BOOL}d, isClean: %{BOOL}d", buf, 0xEu);
    }

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke;
    v41[3] = &unk_1E64648F0;
    id v19 = v16;
    id v42 = v19;
    uint64_t v20 = MEMORY[0x1C8769940](v41);
    v21 = (void (**)(void, void))v20;
    if ((v15 | v17))
    {
      if (((v15 ^ 1 | v17) & 1) == 0)
      {
        v22 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2C5F000, v22, OS_LOG_TYPE_DEFAULT, "Persistent store directory needs cleanup.", buf, 2u);
        }

        id v40 = 0;
        int v23 = [(id)objc_opt_class() removePersistentStoreWithError:&v40];
        id v24 = v40;
        v25 = v24;
        if (v23)
        {
          if (v24) {
            v21[2](v21, 1);
          }
        }
        else
        {
          v26 = os_log_create("com.apple.synapse", "DocumentWorkflows");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[SYDocumentWorkflowsCoreDataStore persistentContainer]();
          }
        }
        v27 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v45 = v23;
          _os_log_impl(&dword_1C2C5F000, v27, OS_LOG_TYPE_DEFAULT, "Persistent store directory cleaned up successfully: %{BOOL}d", buf, 8u);
        }
      }
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, 1);
    }
    id v39 = 0;
    char v28 = [v3 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v29 = v39;
    if ((v28 & 1) == 0)
    {
      v30 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[SYDocumentWorkflowsCoreDataStore persistentContainer]();
      }
    }
    v31 = [v13 URLByAppendingPathComponent:@"SYDocumentWorkflowsModel.sqlite"];
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C190]) initWithURL:v31];
    v43 = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    [(NSPersistentContainer *)v11 setPersistentStoreDescriptions:v33];

    [(NSPersistentContainer *)v11 loadPersistentStoresWithCompletionHandler:&__block_literal_global_14];
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = v11;
    v35 = v11;
  }
  objc_sync_exit(v2);

  v36 = v2->_persistentContainer;
  return v36;
}

uint64_t __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBool:a2 forKey:@"SYPersistentStoreDirIsClean"];
}

void __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke_22_cold_1();
    }
  }
}

- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "Fetching userActivity with relatedUniqueIdentifier: %@", buf, 0xCu);
  }

  v8 = [(SYDocumentWorkflowsCoreDataStore *)self persistentContainer];
  id v9 = (void *)[v8 newBackgroundContext];
  id v16 = 0;
  char v10 = [(SYDocumentWorkflowsCoreDataStore *)self _fetchRecordWithRelatedUniqueIdentifier:v6 context:v9 error:&v16];
  id v11 = v16;

  if (v10)
  {
    v12 = [v10 userActivityData];
    if (v12)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v12];
    }
    else
    {
      v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SYDocumentWorkflowsCoreDataStore fetchUserActivityWithRelatedUniqueIdentifier:error:]();
      }

      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v13;
}

- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_INFO, "Saving userActivity: %@, relatedUniqueIdentifier: %@, sourceBundleIdentifier: %@", buf, 0x20u);
  }

  id v28 = 0;
  v14 = [v10 _createUserActivityDataWithSaving:0 options:0 error:&v28];
  id v15 = v28;
  if (v14)
  {
    v26 = a6;
    id v16 = [(SYDocumentWorkflowsCoreDataStore *)self persistentContainer];
    int v17 = (void *)[v16 newBackgroundContext];

    id v27 = 0;
    uint64_t v18 = [(SYDocumentWorkflowsCoreDataStore *)self _fetchRecordWithRelatedUniqueIdentifier:v11 context:v17 error:&v27];
    unint64_t v19 = (unint64_t)v27;
    uint64_t v20 = (void *)v19;
    if (v18 || !v19)
    {
      if (!(v18 | v19))
      {
        int v23 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v30 = v11;
          __int16 v31 = 2112;
          id v32 = v17;
          _os_log_impl(&dword_1C2C5F000, v23, OS_LOG_TYPE_INFO, "Creating new record with relatedUniqueIdentifier: %@, context: %@", buf, 0x16u);
        }

        uint64_t v18 = [[SYUserActivityRecord alloc] initWithContext:v17];
        [(id)v18 setRelatedUniqueIdentifier:v11];
      }
      if (v18 && !v20)
      {
        id v24 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v30 = v11;
          __int16 v31 = 2112;
          id v32 = v17;
          _os_log_impl(&dword_1C2C5F000, v24, OS_LOG_TYPE_INFO, "Found existing record with relatedUniqueIdentifier: %@, context: %@", buf, 0x16u);
        }
      }
      [(id)v18 setSourceBundleIdentifier:v12];
      [(id)v18 setUserActivityData:v14];
      BOOL v21 = [(SYDocumentWorkflowsCoreDataStore *)self _saveContext:v17 error:v26];
    }
    else
    {
      BOOL v21 = 0;
      if (v26) {
        id *v26 = (id) v19;
      }
    }
  }
  else
  {
    v22 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SYDocumentWorkflowsCoreDataStore saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:]();
    }

    BOOL v21 = 0;
    if (a6) {
      *a6 = v15;
    }
  }

  return v21;
}

- (id)_fetchRecordWithRelatedUniqueIdentifier:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_INFO, "Fetching record with relatedUniqueIdentifier: %@, context: %@", buf, 0x16u);
  }

  id v10 = +[SYUserActivityRecord createFetchRequest];
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"relatedUniqueIdentifier == %@", v7];
  [v10 setPredicate:v11];

  [v10 setFetchLimit:1];
  id v17 = 0;
  id v12 = [v8 executeFetchRequest:v10 error:&v17];
  id v13 = v17;
  if (v12)
  {
    v14 = [v12 firstObject];
  }
  else
  {
    id v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_error_impl(&dword_1C2C5F000, v15, OS_LOG_TYPE_ERROR, "Unable to fetch record with id: %@, context: %@, error: %@", buf, 0x20u);
    }

    v14 = 0;
    if (a5) {
      *a5 = v13;
    }
  }

  return v14;
}

- (BOOL)_saveContext:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_INFO, "Saving context: %@", buf, 0xCu);
  }

  if ([v5 hasChanges])
  {
    id v12 = 0;
    char v7 = [v5 save:&v12];
    os_log_t v8 = (os_log_t)v12;
    id v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_1C2C5F000, v10, OS_LOG_TYPE_INFO, "Context saved: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SYDocumentWorkflowsCoreDataStore _saveContext:error:]();
      }

      if (a4)
      {
        os_log_t v8 = v8;
        *a4 = v8;
      }
    }
  }
  else
  {
    os_log_t v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    char v7 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_INFO, "Context has no changes: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)removePersistentStoreWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to remove persistent store directory at: %{private}@, error: %{private}@");
}

- (void)persistentContainer
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_FAULT, "Model URL doesn't exist, URL: %@", buf, 0xCu);
}

void __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke_22_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1C2C5F000, v0, OS_LOG_TYPE_FAULT, "Unable to load persistent stores, error: %@", v1, 0xCu);
}

- (void)fetchUserActivityWithRelatedUniqueIdentifier:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1C2C5F000, v0, OS_LOG_TYPE_ERROR, "Found nil user activity data for id: %@", v1, 0xCu);
}

- (void)saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to serialize user activity with id: %@, error: %@");
}

- (void)_saveContext:error:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to save changes in context: %@, error: %@");
}

@end