@interface PLPersistentContainer
+ (BOOL)_destroyPhotosDatabaseWithPath:(id)a3 backupToPath:(id)a4;
+ (BOOL)currentModelVersionMatchesLibrarySchemaVersionWithPathManager:(id)a3 error:(id *)a4;
+ (BOOL)shouldTrackIndexUse;
+ (NSManagedObjectModel)managedObjectModel;
+ (NSURL)managedObjectModelURL;
+ (id)newManagedObjectModel;
+ (int)librarySchemaVersionWithPathManager:(id)a3 error:(id *)a4;
+ (int64_t)_migrateOrRebuildDatabaseWithSharedPersistentStoreCoordinator:(id)a3 modelMigrator:(id)a4 migrationPolicy:(unsigned int)a5 error:(id *)a6;
+ (int64_t)_openAndMigrateStoreWithURL:(id)a3 options:(id)a4 coordinator:(id)a5 modelMigrator:(id)a6 migrationPolicy:(unsigned int)a7 error:(id *)a8;
+ (void)_getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5 enableOrderKeyNotifications:(BOOL)a6;
+ (void)getConfigurationForDatabasePath:(id)a3 withBlock:(id)a4;
+ (void)getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5;
+ (void)removePhotosDatabaseWithPathManager:(id)a3;
+ (void)unsafeRemoveManagedObjectModel;
- (BOOL)_configurePersistentStoreCoordinator:(id)a3 overrideCurrentModelVersionInStore:(BOOL)a4 error:(id *)a5;
- (BOOL)_configureXPCPersistentStoreCoordinator:(id)a3 error:(id *)a4;
- (BOOL)didConfigurePersistentStore;
- (BOOL)didConfigureXPCStore;
- (BOOL)shouldUseXPCPhotoLibraryStore;
- (NSPersistentStoreCoordinator)sharedPersistentStoreCoordinator;
- (NSURL)libraryURL;
- (PLPersistentContainer)initWithLibraryURL:(id)a3 lazyAssetsdClient:(id)a4;
- (PLXPCPhotoLibraryStorePolicy)xpcStorePolicy;
- (id)newPersistentStoreCoordinatorForMigration:(id *)a3;
- (id)newSharedPersistentStoreCoordinator;
- (int64_t)configureSharedPersistentStoreCoordinatorAndMigrateOrRebuildIfNecessaryWithModelMigrator:(id)a3 migrationPolicy:(unsigned int)a4 error:(id *)a5;
- (void)_setTestDidConfigureXPCStore:(BOOL)a3;
- (void)dealloc;
- (void)removeSharedPersistentStoreCoordinator;
- (void)setXpcStorePolicy:(id)a3;
@end

@implementation PLPersistentContainer

id __43__PLPersistentContainer_managedObjectModel__block_invoke(uint64_t a1)
{
  v2 = (void *)sSharedModel;
  if (!sSharedModel)
  {
    uint64_t v3 = [*(id *)(a1 + 32) newManagedObjectModel];
    v4 = (void *)sSharedModel;
    sSharedModel = v3;

    v2 = (void *)sSharedModel;
  }
  return v2;
}

+ (id)newManagedObjectModel
{
  v2 = [a1 managedObjectModelURL];
  if (!v2)
  {
    v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "managedObjectModel url is nil", buf, 2u);
    }
    goto LABEL_9;
  }
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v2];
  if (!v3)
  {
    [MEMORY[0x1E4F8B908] logDiagnosticInfoForURL:v2];
    v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "managedObjectModel is nil", v9, 2u);
    }

    v5 = 0;
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v4 = v3;
  [v3 _setIsEditable:0];
  v5 = v4;
  v6 = v5;
LABEL_10:

  return v6;
}

+ (NSURL)managedObjectModelURL
{
  pl_dispatch_once();
  v2 = (void *)managedObjectModelURL_url;
  return (NSURL *)v2;
}

- (NSPersistentStoreCoordinator)sharedPersistentStoreCoordinator
{
  v2 = PLResultWithUnfairLock();
  return (NSPersistentStoreCoordinator *)v2;
}

id __57__PLPersistentContainer_sharedPersistentStoreCoordinator__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    if (*(unsigned char *)(v2 + 32))
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v4 = [(id)v2 newSharedPersistentStoreCoordinator];
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    }
  }
  return v3;
}

- (id)newSharedPersistentStoreCoordinator
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotoLibraryGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "newSharedPersistentStoreCoordinator", "", buf, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F1C188]);
  v8 = [(id)objc_opt_class() managedObjectModel];
  v9 = (NSURL *)[v7 initWithManagedObjectModel:v8];

  if ([(PLPersistentContainer *)self shouldUseXPCPhotoLibraryStore])
  {
    v19 = 0;
    BOOL v10 = [(PLPersistentContainer *)self _configureXPCPersistentStoreCoordinator:v9 error:&v19];
    v11 = v19;
  }
  else
  {
    v18 = 0;
    BOOL v10 = [(PLPersistentContainer *)self _configurePersistentStoreCoordinator:v9 overrideCurrentModelVersionInStore:0 error:&v18];
    v11 = v18;
  }
  id v12 = v11;
  if (!v10)
  {
    v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      libraryURL = self->_libraryURL;
      *(_DWORD *)buf = 138412546;
      v21 = libraryURL;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to configure PSC for library %@: %@", buf, 0x16u);
    }

    v9 = 0;
  }
  v15 = v6;
  v16 = v15;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v9;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v4, "newSharedPersistentStoreCoordinator", "instance: %p", buf, 0xCu);
  }

  return v9;
}

+ (NSManagedObjectModel)managedObjectModel
{
  uint64_t v2 = PLResultWithUnfairLock();
  return (NSManagedObjectModel *)v2;
}

- (BOOL)shouldUseXPCPhotoLibraryStore
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:self->_libraryURL];
  os_signpost_id_t v4 = [v3 photosDatabasePath];
  memset(v6, 0, sizeof(v6));
  LOBYTE(v2) = [(PLXPCPhotoLibraryStorePolicy *)v2->_xpcStorePolicy shouldUseXPCStoreForDatabasePath:v4 auditToken:v6];

  return (char)v2;
}

- (BOOL)_configurePersistentStoreCoordinator:(id)a3 overrideCurrentModelVersionInStore:(BOOL)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:self->_libraryURL];
  BOOL v10 = objc_opt_class();
  id v47 = 0;
  id v48 = 0;
  v11 = [v9 photosDatabasePath];
  [v10 _getPersistentStoreURL:&v48 options:&v47 forDatabasePath:v11 enableOrderKeyNotifications:1];
  id v12 = v48;
  id v13 = v47;

  v14 = PLMigrationGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v54 = v12;
    __int16 v55 = 2112;
    id v56 = v13;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Adding persistent store for URL: %@ with options: %@", buf, 0x16u);
  }

  uint64_t v15 = *MEMORY[0x1E4F1BF70];
  id v46 = 0;
  v16 = [v8 addPersistentStoreWithType:v15 configuration:0 URL:v12 options:v13 error:&v46];
  id v17 = v46;
  if (v16)
  {
    v43 = a5;
    v44 = [v8 metadataForPersistentStore:v16];
    v18 = [v44 objectForKey:@"PLModelVersion"];
    int v19 = [v18 intValue];
    int v20 = +[PLModelMigrator currentModelVersion];
    if (v18) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = a4;
    }
    if (v21 || v19 == v20)
    {
      self->_didConfigurePersistentStore = 1;
      v39 = v16;
    }
    else
    {
      __int16 v22 = PLMigrationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = +[PLModelMigrator currentModelVersion];
        *(_DWORD *)buf = 138412546;
        id v54 = v18;
        __int16 v55 = 1024;
        LODWORD(v56) = v23;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Incompatible version of Photos.sqlite store %@ != required version %d", buf, 0x12u);
      }

      id v45 = 0;
      char v24 = [v8 removePersistentStore:v16 error:&v45];
      id v25 = v45;
      if ((v24 & 1) == 0)
      {
        v26 = PLMigrationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v25;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Failed to remove incompatible Photos.sqlite store %@", buf, 0xCu);
        }
      }
      if (v43)
      {
        id v42 = v25;
        uint64_t v27 = [v18 description];
        if (v27) {
          v28 = (__CFString *)v27;
        }
        else {
          v28 = @"None";
        }
        int v29 = [v18 intValue];
        int v30 = +[PLModelMigrator currentModelVersion];
        v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F8C500];
        if (v29 >= v30)
        {
          v49[1] = @"CurrentVersion";
          v50[0] = v28;
          v49[0] = @"StoreVersion";
          v32 = objc_msgSend(NSNumber, "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
          v50[1] = v32;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
          v34 = v41;
          uint64_t v35 = v31;
          uint64_t v36 = 46006;
        }
        else
        {
          v51[1] = @"CurrentVersion";
          v52[0] = v28;
          v51[0] = @"StoreVersion";
          v32 = objc_msgSend(NSNumber, "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
          v52[1] = v32;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
          v34 = v41;
          uint64_t v35 = v31;
          uint64_t v36 = 46007;
        }
        id *v43 = [v34 errorWithDomain:v35 code:v36 userInfo:v33];

        v39 = 0;
        v16 = v42;
      }
      else
      {
        v39 = 0;
        v16 = v25;
      }
    }
  }
  else
  {
    v37 = PLMigrationGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = PLFilteredDescriptionForAddPersistentStoreError(v17);
      *(_DWORD *)buf = 138412546;
      id v54 = v13;
      __int16 v55 = 2112;
      id v56 = v38;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Failed to add Photos.sqlite store with options %@: %@", buf, 0x16u);
    }
    v39 = 0;
    if (a5) {
      *a5 = v17;
    }
  }

  return v39 != 0;
}

+ (void)_getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5 enableOrderKeyNotifications:(BOOL)a6
{
  BOOL v47 = a6;
  v60[3] = *MEMORY[0x1E4F143B8];
  v6 = a5;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:@"WAL" forKeyedSubscript:@"journal_mode"];
  uint64_t v8 = [MEMORY[0x1E4F8B908] proxyLockFilePathForDatabasePath:v6];
  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:@"lock_proxy_file"];
  }
  id v48 = (void *)v8;
  v52 = v6;
  if ((PLIsAssetsd() & 1) == 0) {
    [v7 setObject:@"0" forKeyedSubscript:@"wal_autocheckpoint"];
  }
  v59[0] = *MEMORY[0x1E4F1BE78];
  id v46 = +[PLAssetAnalysisState entityName];
  v58[0] = v46;
  id v45 = +[PLMediaAnalysisAssetAttributes entityName];
  v58[1] = v45;
  v44 = +[PLPhotoAnalysisAssetAttributes entityName];
  v58[2] = v44;
  v43 = +[PLComputedAssetAttributes entityName];
  v58[3] = v43;
  v9 = +[PLSceneClassification entityName];
  v58[4] = v9;
  BOOL v10 = +[PLDetectedFaceGroup entityName];
  v58[5] = v10;
  v11 = +[PLSceneprint entityName];
  v58[6] = v11;
  +[PLDetectedFaceprint entityName];
  id v12 = v51 = v7;
  v58[7] = v12;
  id v13 = +[PLCharacterRecognitionAttributes entityName];
  v58[8] = v13;
  v14 = +[PLVisualSearchAttributes entityName];
  v58[9] = v14;
  uint64_t v15 = +[PLGlobalKeyValue entityName];
  v58[10] = v15;
  v16 = +[PLBackgroundJobWorkItem entityName];
  v58[11] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:12];
  uint64_t v18 = *MEMORY[0x1E4F1BE88];
  v60[0] = v17;
  v60[1] = MEMORY[0x1E4F1CC38];
  uint64_t v19 = *MEMORY[0x1E4F1BE68];
  v59[1] = v18;
  v59[2] = v19;
  v60[2] = MEMORY[0x1E4F1CC38];
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];

  BOOL v21 = [MEMORY[0x1E4F1CA60] dictionary];
  [v21 setObject:v51 forKeyedSubscript:*MEMORY[0x1E4F1BF68]];
  [v21 setObject:&unk_1EEBECCA8 forKeyedSubscript:*MEMORY[0x1E4F1BF60]];
  [v21 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F1BE80]];
  BOOL v22 = +[PLPersistentContainer shouldTrackIndexUse];
  int v23 = [NSNumber numberWithBool:v22];
  [v21 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F1BF10]];

  [v21 setObject:*MEMORY[0x1E4F28358] forKeyedSubscript:*MEMORY[0x1E4F1BEC0]];
  if (([MEMORY[0x1E4F8B9C8] processCanWriteSandboxForPath:v52] & 1) == 0)
  {
    if (!PLIsAssetsd())
    {
      char v26 = 0;
      goto LABEL_22;
    }
    char v24 = [MEMORY[0x1E4F8B908] fileManager];
    if ([v24 fileExistsAtPath:v52 isDirectory:0])
    {
      id v25 = PLBackendGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v55 = v52;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Possibly fatal error: sandbox denied assetsd write-access for %@, but it exists", buf, 0xCu);
      }
    }
    else
    {
      char v53 = 0;
      id v25 = [v52 stringByDeletingLastPathComponent];
      int v27 = [v24 fileExistsAtPath:v25 isDirectory:&v53];
      if (!v27 || !v53)
      {
        v28 = PLBackendGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int v29 = @"does not exist";
          if (v27) {
            int v29 = @"not a directory";
          }
          *(_DWORD *)buf = 138412546;
          __int16 v55 = v25;
          __int16 v56 = 2112;
          uint64_t v57 = v29;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Possibly fatal error: parent directory %@ is %@", buf, 0x16u);
        }
      }
    }

    int v30 = PLBackendGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v55 = v52;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Assuming write-access for %@ after sandbox denied write access", buf, 0xCu);
    }
  }
  char v26 = 1;
LABEL_22:
  uint64_t v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v52];
  if ((v26 & 1) == 0)
  {
    [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BF20]];
    v32 = [v31 absoluteString];
    v33 = [v32 stringByAppendingString:@"?readonly_shm=1"];

    uint64_t v34 = [MEMORY[0x1E4F1CB10] URLWithString:v33];

    uint64_t v31 = (void *)v34;
  }
  if (v47 && PLIsAssetsd()) {
    [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BEE0]];
  }
  if (PLIsAssetsd())
  {
    uint64_t v35 = NSNumber;
    uint64_t v36 = +[PLConcurrencyLimiter sharedLimiter];
    v37 = objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v36, "maxConcurrency"));
    [v21 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F1BE90]];

    v38 = v48;
  }
  else
  {
    v38 = v48;
    if (PLIsMobileSlideShow()) {
      [v21 setObject:&unk_1EEBECCC0 forKeyedSubscript:*MEMORY[0x1E4F1BE90]];
    }
  }
  v39 = PLBackendGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = @"NO";
    if (v22) {
      v40 = @"YES";
    }
    v41 = v40;
    id v42 = [MEMORY[0x1E4F8B908] redactedDescriptionForFileURL:v31];
    *(_DWORD *)buf = 138543618;
    __int16 v55 = v41;
    __int16 v56 = 2114;
    uint64_t v57 = v42;
    _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "Using NSPersistentStoreTrackIndexUseOptionKey = %{public}@ for store at %{public}@", buf, 0x16u);
  }
  if (a3) {
    *a3 = v31;
  }
  if (a4) {
    *a4 = v21;
  }
}

+ (BOOL)shouldTrackIndexUse
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 stringForKey:@"com.apple.photos.TrackIndexUse"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = MEMORY[0x19F38BDA0]();
  }
  BOOL v5 = v4;

  return v5;
}

- (PLPersistentContainer)initWithLibraryURL:(id)a3 lazyAssetsdClient:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLPersistentContainer;
  uint64_t v8 = [(PLPersistentContainer *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    libraryURL = v8->_libraryURL;
    v8->_libraryURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_lazyAssetdClient, a4);
    v11 = objc_alloc_init(PLXPCPhotoLibraryStorePolicySandbox);
    xpcStorePolicy = v8->_xpcStorePolicy;
    v8->_xpcStorePolicy = (PLXPCPhotoLibraryStorePolicy *)v11;

    v8->_sharedPersistentStoreCoordinatorLock._os_unfair_lock_opaque = 0;
    id v13 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v14;
      __int16 v20 = 2048;
      BOOL v21 = v8;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL:%@", buf, 0x20u);
    }

    uint64_t v15 = v8;
  }

  return v8;
}

void __46__PLPersistentContainer_managedObjectModelURL__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 URLForResource:@"photos" withExtension:@"momd"];
  char v4 = (void *)managedObjectModelURL_url;
  managedObjectModelURL_url = v3;

  if (!managedObjectModelURL_url)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PLPersistentContainer.m", 141, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcStorePolicy, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_sharedPersistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_lazyAssetdClient, 0);
}

- (BOOL)didConfigureXPCStore
{
  return self->_didConfigureXPCStore;
}

- (BOOL)didConfigurePersistentStore
{
  return self->_didConfigurePersistentStore;
}

- (void)setXpcStorePolicy:(id)a3
{
}

- (PLXPCPhotoLibraryStorePolicy)xpcStorePolicy
{
  return (PLXPCPhotoLibraryStorePolicy *)objc_getProperty(self, a2, 48, 1);
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)_configureXPCPersistentStoreCoordinator:(id)a3 error:(id *)a4
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:self->_libraryURL];
    *(_DWORD *)buf = 138412290;
    char v26 = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to XPCPhotoLibraryStore %@", buf, 0xCu);
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:self->_libraryURL];
  BOOL v10 = [(PLLazyObject *)self->_lazyAssetdClient objectValue];
  v11 = [[PLXPCPhotoLibraryStoreEndpointFactory alloc] initWithAssetsdClient:v10];
  uint64_t v12 = *MEMORY[0x1E4F1BFF0];
  v31[0] = *MEMORY[0x1E4F1BFE0];
  v31[1] = v12;
  v32[0] = v11;
  v32[1] = MEMORY[0x1E4F1CC38];
  v31[2] = *MEMORY[0x1E4F1BE80];
  v32[2] = MEMORY[0x1E4F1CC38];
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  uint64_t v14 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v15 = [v9 photosDatabasePath];
  v16 = [v14 fileURLWithPath:v15 isDirectory:0];

  objc_super v17 = PLMigrationGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    char v26 = v16;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Adding XPC store at URL: %@ with options: %@", buf, 0x16u);
  }

  uint64_t v18 = *MEMORY[0x1E4F1BFF8];
  id v24 = 0;
  uint64_t v19 = [v6 addPersistentStoreWithType:v18 configuration:0 URL:v16 options:v13 error:&v24];

  id v20 = v24;
  if (v19)
  {
    *(_WORD *)&self->_didConfigurePersistentStore = 257;
  }
  else
  {
    BOOL v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = PLFilteredDescriptionForAddPersistentStoreError(v20);
      *(_DWORD *)buf = 138412802;
      char v26 = v16;
      __int16 v27 = 2112;
      v28 = v13;
      __int16 v29 = 2112;
      int v30 = v22;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to connect to XPC PhotoLibraryStore %@ with options %@: %@", buf, 0x20u);
    }
    if (a4) {
      *a4 = v20;
    }
  }

  return v19 != 0;
}

- (void)_setTestDidConfigureXPCStore:(BOOL)a3
{
  self->_didConfigureXPCStore = a3;
}

- (int64_t)configureSharedPersistentStoreCoordinatorAndMigrateOrRebuildIfNecessaryWithModelMigrator:(id)a3 migrationPolicy:(unsigned int)a4 error:(id *)a5
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__290;
  id v13 = __Block_byref_object_dispose__291;
  id v14 = 0;
  id v6 = a3;
  PLRunWithUnfairLock();
  if (a5) {
    *a5 = (id) v10[5];
  }
  int64_t v7 = v16[3];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __136__PLPersistentContainer_configureSharedPersistentStoreCoordinatorAndMigrateOrRebuildIfNecessaryWithModelMigrator_migrationPolicy_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C188]);
    char v4 = [(id)objc_opt_class() managedObjectModel];
    id v2 = (id)[v3 initWithManagedObjectModel:v4];

    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(unsigned int *)(a1 + 64);
    id v15 = 0;
    uint64_t v8 = [v5 _migrateOrRebuildDatabaseWithSharedPersistentStoreCoordinator:v2 modelMigrator:v6 migrationPolicy:v7 error:&v15];
    id v9 = v15;
    id v10 = v15;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 4)
    {
      uint64_t v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to configure PSC for library %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = v2;
      uint64_t v11 = *(NSObject **)(v13 + 24);
      *(void *)(v13 + 24) = v14;
    }
  }
}

- (void)removeSharedPersistentStoreCoordinator
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    uint64_t v7 = self;
    __int16 v8 = 2080;
    id v9 = "-[PLPersistentContainer removeSharedPersistentStoreCoordinator]";
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s", buf, 0x20u);
  }

  PLRunWithUnfairLock();
}

void __63__PLPersistentContainer_removeSharedPersistentStoreCoordinator__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;

    uint64_t v5 = [v2 persistentStores];
    if ([v5 count] != 1)
    {
      __int16 v6 = PLMigrationGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = [v5 count];
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)__int16 v29 = v7;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v8;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Unexpected stores count %d in shared PSC for library %@", buf, 0x12u);
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v25;
      *(void *)&long long v11 = 138412546;
      long long v22 = v11;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * v14);
          id v23 = 0;
          char v16 = objc_msgSend(v2, "removePersistentStore:error:", v15, &v23, v22);
          id v17 = v23;
          if ((v16 & 1) == 0)
          {
            uint64_t v18 = PLMigrationGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 40);
              *(_DWORD *)buf = v22;
              *(void *)__int16 v29 = v15;
              *(_WORD *)&v29[8] = 2112;
              *(void *)&v29[10] = v19;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to remove store %@ PSC for library %@", buf, 0x16u);
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v12);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    id v20 = PLMigrationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v29 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Removed persistent store coordinator %@", buf, 0xCu);
    }
  }
}

- (id)newPersistentStoreCoordinatorForMigration:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F1C188]);
  __int16 v6 = [(id)objc_opt_class() managedObjectModel];
  int v7 = (void *)[v5 initWithManagedObjectModel:v6];

  if (![(PLPersistentContainer *)self _configurePersistentStoreCoordinator:v7 overrideCurrentModelVersionInStore:1 error:a3])
  {

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLPersistentContainer;
  [(PLPersistentContainer *)&v4 dealloc];
}

+ (BOOL)currentModelVersionMatchesLibrarySchemaVersionWithPathManager:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  uint64_t v5 = [a1 librarySchemaVersionWithPathManager:a3 error:&v22];
  id v6 = v22;
  __int16 v7 = v6;
  if (!v5)
  {
    if (a4)
    {
      BOOL v9 = 0;
      *a4 = v6;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v9 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = +[PLModelMigrator currentModelVersion];
  if (v5 != v8)
  {
    if ((int)v5 <= (int)v8)
    {
      uint64_t v10 = [NSString stringWithFormat:@"Your library needs reconfiguration.\n\nPlease install the latest app version via Xcode (copy to device), or installing a root.\n\nYou can also go to Settings › Photos › Repair Photos Library.\n\n(Library schema %d needs upgrade to %d.)", v5, v8];
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F8C500];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      long long v24 = v10;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v14 = v17;
      uint64_t v15 = v18;
      uint64_t v16 = 46007;
    }
    else
    {
      uint64_t v10 = [NSString stringWithFormat:@"Your library needs reconfiguration. This usually happens if you install an older OS build on top of a newer one.\n\nPlease install the latest app version via Xcode (copy to device), or install a newer root.\n\nYou can also go to Settings › Photos › Repair Photos Library. Doing this will require reprocessing your photos which might take a while.\n\n(Schema inversion: library (%d) newer than runtime (%d).)", v5, v8];
      long long v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F8C500];
      uint64_t v25 = *MEMORY[0x1E4F28228];
      v26[0] = v10;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v14 = v11;
      uint64_t v15 = v12;
      uint64_t v16 = 46006;
    }
    uint64_t v19 = [v14 errorWithDomain:v15 code:v16 userInfo:v13];
    id v20 = v19;
    if (a4) {
      *a4 = v19;
    }

    goto LABEL_12;
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

+ (int)librarySchemaVersionWithPathManager:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__290;
  uint64_t v23 = __Block_byref_object_dispose__291;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__290;
  id v17 = __Block_byref_object_dispose__291;
  id v18 = 0;
  id v6 = objc_opt_class();
  __int16 v7 = [v5 photosDatabasePath];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PLPersistentContainer_librarySchemaVersionWithPathManager_error___block_invoke;
  v12[3] = &unk_1E5861ED0;
  v12[4] = &v13;
  v12[5] = &v19;
  [v6 getConfigurationForDatabasePath:v7 withBlock:v12];

  uint64_t v8 = (void *)v14[5];
  if (!v8)
  {
    if (a4)
    {
      *a4 = (id) v20[5];
      uint64_t v8 = (void *)v14[5];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  BOOL v9 = [v8 objectForKey:@"PLModelVersion"];
  int v10 = [v9 intValue];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __67__PLPersistentContainer_librarySchemaVersionWithPathManager_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *MEMORY[0x1E4F1BF70];
  id v20 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v6 URL:v5 options:a3 error:&v20];
  id v8 = v20;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    long long v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Store metadata read failure: %@", buf, 0xCu);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v21[0] = *MEMORY[0x1E4F28228];
    v21[1] = v14;
    v22[0] = @"Store metadata read failure";
    v22[1] = v8;
    v21[2] = *MEMORY[0x1E4F28328];
    uint64_t v15 = [v5 path];
    v22[2] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    uint64_t v17 = [v12 errorWithDomain:v13 code:46009 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

+ (void)getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5
{
}

+ (int64_t)_migrateOrRebuildDatabaseWithSharedPersistentStoreCoordinator:(id)a3 modelMigrator:(id)a4 migrationPolicy:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2 object:a1 file:@"PLPersistentContainer.m" lineNumber:530 description:@"Must only be called by assetsd"];
  }
  uint64_t v13 = [v12 checkForceRebuildIndicatorFile];
  v70 = a6;
  if (v13 == 1)
  {
    uint64_t v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Found force rebuild indicator file, will not attempt lightweight migration", buf, 2u);
    }

    uint64_t v15 = [v12 pathManager];
    v73 = [v15 recordRebuildReason];
  }
  else
  {
    v73 = 0;
  }
  id v77 = 0;
  id v78 = 0;
  uint64_t v16 = [v12 pathManager];
  uint64_t v17 = [v16 photosDatabasePath];
  [a1 _getPersistentStoreURL:&v78 options:&v77 forDatabasePath:v17 enableOrderKeyNotifications:1];
  id v18 = v78;
  id v19 = v77;

  id v20 = 0;
  v72 = v18;
  if (v13 == 1)
  {
LABEL_9:
    id v69 = v19;
    uint64_t v21 = [v73 allValues];
    id v22 = [v21 lastObject];

    if ([v12 promptUserIfNeededForRebuildReason:v22 migrationError:v20] == 2)
    {
      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46016 userInfo:0];
      id v24 = v23;
      if (v70) {
        id *v70 = v23;
      }

      int64_t v25 = 4;
      goto LABEL_66;
    }
    id v75 = 0;
    uint64_t v30 = [v12 createNewDatabaseWithMigrationType:1 forceRebuildReason:v22 coordinator:v11 error:&v75];
    uint64_t v31 = (__CFString *)v75;
    v32 = v31;
    id v68 = v11;
    if (v30 == 4)
    {
      v33 = v31;
    }
    else
    {
      uint64_t v34 = *MEMORY[0x1E4F1BF70];
      v74 = v31;
      uint64_t v35 = [v11 addPersistentStoreWithType:v34 configuration:0 URL:v18 options:v19 error:&v74];
      v33 = v74;

      if (v35)
      {
        int v67 = 1;
        int64_t v25 = 1;
        goto LABEL_36;
      }
      uint64_t v36 = PLMigrationGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v33;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Store open/configuration failed after attempted rebuild: %@", buf, 0xCu);
      }
    }
    v37 = PLMigrationGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = @"migration failure";
      if (v13) {
        v38 = @"forced";
      }
      *(_DWORD *)buf = 138543362;
      v80 = v38;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Store migrateOrRebuild failed after attempted rebuild: %{public}@", buf, 0xCu);
    }

    if (v70)
    {
      v33 = v33;
      int v67 = 0;
      id *v70 = v33;
    }
    else
    {
      int v67 = 0;
    }
    int64_t v25 = 4;
LABEL_36:
    v39 = [v12 analyticsEventManager];
    uint64_t v40 = *MEMORY[0x1E4F8BD88];
    [v39 setPayloadValue:@"failed open rebuild" forKey:*MEMORY[0x1E4F8BDC0] onEventWithName:*MEMORY[0x1E4F8BD88]];
    v41 = [NSNumber numberWithBool:v13 != 0];
    v71 = v39;
    [v39 setPayloadValue:v41 forKey:*MEMORY[0x1E4F8BD98] onEventWithName:v40];

    id v42 = (void *)MEMORY[0x1E4F8B980];
    v43 = [v12 pathManager];
    v44 = [v43 libraryURL];
    uint64_t v45 = [v42 wellKnownPhotoLibraryIdentifierForURL:v44];

    if (v20) {
      int v46 = PLIsErrorEqualToCode() ^ 1;
    }
    else {
      int v46 = 0;
    }
    id v11 = v68;
    if (v13)
    {
      int v47 = [v22 intValue];
      int v48 = 1;
      if ((unint64_t)v47 <= 0x11 && ((1 << v47) & 0x20404) != 0) {
        int v48 = v46;
      }
      if (!v48)
      {
LABEL_58:

        id v19 = v69;
        if (!v67) {
          goto LABEL_66;
        }
LABEL_59:
        v60 = [v12 pathManager];
        [v60 removeSqliteErrorIndicatorFile];

        goto LABEL_66;
      }
    }
    else if (!v46)
    {
      goto LABEL_58;
    }
    if (v45 != 3)
    {
      v49 = PLMigrationGetLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Triggering tap to radar for rebuild", buf, 2u);
      }

      id v50 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v50 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZZZ"];
      v51 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
      [v50 setLocale:v51];

      v52 = [MEMORY[0x1E4F1C9C8] date];
      v66 = [v50 stringFromDate:v52];

      char v53 = NSString;
      if (v13)
      {
        id v54 = PLRebuildReasonToShortString([v22 integerValue]);
        [v53 stringWithFormat:@"TTR: Photo Library Rebuild for reason %@", v54];
      }
      else
      {
        [(__CFString *)v20 code];
        id v54 = NSStringFromPLErrorCode();
        [v53 stringWithFormat:@"TTR: Photo Library Rebuild due to migration error %@", v54];
      __int16 v55 = };

      if (!v45)
      {
        __int16 v56 = [v12 pathManager];
        [v56 isSystemPhotoLibraryPathManager];
      }
      uint64_t v57 = PLStringFromWellKnownPhotoLibraryIdentifier();
      v58 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Library identifier: %@\n\nPhoto library was rebuilt at %@\n", v57, v66];
      v59 = v58;
      if (v13) {
        [v58 appendFormat:@"Last force rebuild date and reason: %@", v73];
      }
      else {
        [v58 appendFormat:@"Migration error: %@", v20];
      }
      +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Photo Library Rebuild Detected" message:@"Your photo library has experienced an unexpected state, please file a Radar against Photos to diagnose the issue" radarTitle:v55 radarDescription:v59];

      id v11 = v68;
    }
    goto LABEL_58;
  }
  id v76 = 0;
  int64_t v25 = [a1 _openAndMigrateStoreWithURL:v18 options:v19 coordinator:v11 modelMigrator:v12 migrationPolicy:v7 error:&v76];
  long long v26 = (__CFString *)v76;
  id v20 = v26;
  if (v25 != 4) {
    goto LABEL_59;
  }
  long long v27 = [(__CFString *)v26 domain];
  int v28 = [v27 isEqualToString:*MEMORY[0x1E4F8C500]];

  id v18 = v72;
  if (!v28) {
    goto LABEL_62;
  }
  if ([(__CFString *)v20 code] == 46007) {
    goto LABEL_63;
  }
  if ([(__CFString *)v20 code] == 46009)
  {
    if (PLIsErrorSQLiteDiskFull())
    {
      __int16 v29 = PLMigrationGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v20;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Disk full error, do not attempt rebuild, error: %@", buf, 0xCu);
      }

      goto LABEL_63;
    }
    goto LABEL_62;
  }
  if ((v7 & 4) == 0)
  {
    MEMORY[0x19F38BDA0]();
    goto LABEL_62;
  }
  if ([(__CFString *)v20 code] == 46008 || [(__CFString *)v20 code] == 46013)
  {
    v62 = PLMigrationGetLog();
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
LABEL_72:

      goto LABEL_9;
    }
    [(__CFString *)v20 code];
    NSStringFromPLErrorCode();
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v80 = v63;
    __int16 v81 = 2112;
    v82 = v20;
    v64 = "Will attempt rebuild after lightweight migration failed with %{public}@ error %@";
LABEL_71:
    _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_ERROR, v64, buf, 0x16u);

    goto LABEL_72;
  }
  if (MEMORY[0x19F38BDA0]() && [(__CFString *)v20 code] == 46006)
  {
    v62 = PLMigrationGetLog();
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    [(__CFString *)v20 code];
    NSStringFromPLErrorCode();
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v80 = v63;
    __int16 v81 = 2112;
    v82 = v20;
    v64 = "(INTERNALONLY) Will attempt rebuild after lightweight migration failed due to model inversion (%{public}@) %@";
    goto LABEL_71;
  }
LABEL_62:
  if ((v7 & 2) != 0) {
    goto LABEL_9;
  }
LABEL_63:
  if (v70)
  {
    id v20 = v20;
    id *v70 = v20;
  }
  int64_t v25 = 4;
LABEL_66:

  return v25;
}

+ (int64_t)_openAndMigrateStoreWithURL:(id)a3 options:(id)a4 coordinator:(id)a5 modelMigrator:(id)a6 migrationPolicy:(unsigned int)a7 error:(id *)a8
{
  v116[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v97 = a4;
  id v98 = a5;
  id v14 = a6;
  int v93 = +[PLModelMigrator currentModelVersion];
  uint64_t v15 = PLMigrationGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v108 = v13;
    __int16 v109 = 2112;
    *(void *)v110 = v97;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "Adding persistent store for URL: %@ with options: %@", buf, 0x16u);
  }

  uint64_t v16 = [v14 analyticsEventManager];
  uint64_t v17 = *MEMORY[0x1E4F1BF70];
  id v102 = 0;
  id v18 = [v98 addPersistentStoreWithType:v17 configuration:0 URL:v13 options:v97 error:&v102];
  id v96 = v102;
  if (v18)
  {
    id v19 = [v98 metadataForPersistentStore:v18];
    id v20 = [v19 objectForKey:@"PLModelVersion"];
    int v21 = 0;
    goto LABEL_30;
  }
  unsigned int v89 = a7;
  if ([v96 code] == 134100)
  {
    id v22 = [v96 domain];
    int v23 = [v22 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v23)
    {
      id v101 = 0;
      id v19 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v17 URL:v13 options:v97 error:&v101];
      id v88 = v101;
      if (v19)
      {
        id v20 = [v19 objectForKey:@"PLModelVersion"];
        int v24 = [v20 intValue];
        int64_t v25 = PLMigrationGetLog();
        long long v26 = v25;
        if (v24 == v93)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            long long v27 = PLFilteredDescriptionForAddPersistentStoreError(v96);
            *(_DWORD *)buf = 138543874;
            id v108 = v20;
            __int16 v109 = 1024;
            *(_DWORD *)v110 = v93;
            *(_WORD *)&v110[4] = 2114;
            *(void *)&v110[6] = v27;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Store schema incompatibility, but model version matches %{public}@ to %d. This is an internal only failure caused by reusing the same model version number on different trains.  Add store error: %{public}@", buf, 0x1Cu);
          }
          int v28 = PLMigrationGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v29 = [v98 managedObjectModel];
            uint64_t v30 = +[PLModelMigrator schemaIncompatibilityDetailsForStoreMetadata:v19 model:v29];
            *(_DWORD *)buf = 138412290;
            id v108 = v30;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Incompatibility details: %@", buf, 0xCu);
          }
          if (!a8)
          {
            a7 = v89;
            v43 = v88;
            goto LABEL_29;
          }
          v86 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v85 = *MEMORY[0x1E4F8C500];
          v113[0] = *MEMORY[0x1E4F28228];
          uint64_t v31 = [NSString stringWithFormat:@"Store schema incompatibility, but store model version %d matches current model version. A system reboot is recommended to clear this error.", objc_msgSend(v20, "intValue")];
          v114[0] = v31;
          v113[1] = *MEMORY[0x1E4F28328];
          v32 = [v13 path];
          v114[1] = v32;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
          *a8 = [v86 errorWithDomain:v85 code:46009 userInfo:v33];
        }
        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int v48 = PLFilteredDescriptionForAddPersistentStoreError(v96);
            *(_DWORD *)buf = 138543874;
            id v108 = v20;
            __int16 v109 = 1024;
            *(_DWORD *)v110 = v93;
            *(_WORD *)&v110[4] = 2114;
            *(void *)&v110[6] = v48;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Store schema incompatibility, requires migration from version %{public}@ to %d. Add store error: %{public}@", buf, 0x1Cu);
          }
          uint64_t v31 = v26;
        }
        a7 = v89;
        v43 = v88;
      }
      else
      {
        id v42 = PLMigrationGetLog();
        v43 = v88;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v44 = PLFilteredDescriptionForAddPersistentStoreError(v96);
          *(_DWORD *)buf = 138543618;
          id v108 = v88;
          __int16 v109 = 2114;
          *(void *)v110 = v44;
          _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "Store schema incompatibility and metadata read failure (%{public}@). Add store error: %{public}@", buf, 0x16u);
        }
        if (!a8)
        {
          id v20 = 0;
          a7 = v89;
          goto LABEL_29;
        }
        uint64_t v45 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v87 = *MEMORY[0x1E4F8C500];
        uint64_t v46 = *MEMORY[0x1E4F28A50];
        v115[0] = *MEMORY[0x1E4F28228];
        v115[1] = v46;
        v116[0] = @"Store schema incompatibility and metadata read failure";
        v116[1] = v88;
        v115[2] = *MEMORY[0x1E4F28328];
        uint64_t v31 = [v13 path];
        v116[2] = v31;
        int v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:3];
        *a8 = [v45 errorWithDomain:v87 code:46009 userInfo:v47];

        id v20 = 0;
        a7 = v89;
      }

LABEL_29:
      int v21 = 1;
      goto LABEL_30;
    }
  }
  uint64_t v34 = PLMigrationGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    uint64_t v35 = PLFilteredDescriptionForAddPersistentStoreError(v96);
    *(_DWORD *)buf = 138412546;
    id v108 = v13;
    __int16 v109 = 2114;
    *(void *)v110 = v35;
    _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Unexpected error opening %@: %{public}@", buf, 0x16u);
  }
  if (a8)
  {
    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F8C500];
    uint64_t v38 = *MEMORY[0x1E4F28A50];
    v111[0] = *MEMORY[0x1E4F28228];
    v111[1] = v38;
    v112[0] = @"Unexpected open error";
    v112[1] = v96;
    v111[2] = *MEMORY[0x1E4F28328];
    v39 = [v13 path];
    v112[2] = v39;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:3];
    v41 = uint64_t v40 = a8;
    id *v40 = [v36 errorWithDomain:v37 code:46009 userInfo:v41];

    a8 = v40;
  }
  int v21 = 0;
  id v20 = 0;
  id v19 = 0;
  a7 = v89;
LABEL_30:
  pl_dispatch_once();
  if (v20) {
    BOOL v49 = v19 == 0;
  }
  else {
    BOOL v49 = 1;
  }
  if (v49)
  {
    id v50 = PLMigrationGetLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = [v18 URL];
      v52 = [v51 path];
      *(_DWORD *)buf = 134218498;
      id v108 = v18;
      __int16 v109 = 2112;
      *(void *)v110 = v52;
      *(_WORD *)&v110[8] = 2112;
      *(void *)&v110[10] = v19;
      _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_DEFAULT, "Store %p (%@) has no version, requires rebuild %@", buf, 0x20u);
    }
    if (a8)
    {
      if (!*a8)
      {
        v94 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v90 = *MEMORY[0x1E4F8C500];
        uint64_t v53 = *MEMORY[0x1E4F28228];
        v106[0] = @"Store has no version";
        uint64_t v54 = *MEMORY[0x1E4F28328];
        v105[0] = v53;
        v105[1] = v54;
        __int16 v55 = [v13 path];
        v106[1] = v55;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
        v57 = __int16 v56 = v19;
        *a8 = [v94 errorWithDomain:v90 code:46009 userInfo:v57];

        id v19 = v56;
      }
      uint64_t v58 = *MEMORY[0x1E4F8BD30];
      [v16 setPayloadValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F8BD70] onEventWithName:*MEMORY[0x1E4F8BD30]];
      id v59 = *a8;
      uint64_t v60 = *MEMORY[0x1E4F8BD38];
      v61 = v16;
      uint64_t v62 = v58;
    }
    else
    {
      uint64_t v60 = *MEMORY[0x1E4F8BD70];
      uint64_t v62 = *MEMORY[0x1E4F8BD30];
      id v59 = (id)MEMORY[0x1E4F1CC28];
      v61 = v16;
    }
    goto LABEL_49;
  }
  int v63 = [v20 intValue];
  if (v63 != v93)
  {
    if ((a7 & 1) == 0)
    {
      if (a8)
      {
        v65 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v66 = *MEMORY[0x1E4F8C500];
        uint64_t v103 = *MEMORY[0x1E4F28328];
        [v13 path];
        int v67 = v95 = v19;
        v104 = v67;
        id v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        *a8 = [v65 errorWithDomain:v66 code:46007 userInfo:v68];

        id v19 = v95;
      }
      goto LABEL_50;
    }
    [v16 startRecordingTimedEventToken];
    double v80 = v79;
    LODWORD(v84) = a7;
    int64_t v75 = [v14 attemptLightweightMigrationFromVersion:v20 onStore:v18 withMetadata:v19 orStoreURL:v13 options:v97 coordinator:v98 migrationPolicy:v84 error:a8];
    uint64_t v81 = *MEMORY[0x1E4F8BD30];
    [v16 stopRecordingTimedEventWithToken:*MEMORY[0x1E4F8BD48] forKey:*MEMORY[0x1E4F8BD30] onEventWithName:v80];
    v82 = [NSNumber numberWithInt:v75 == 2];
    [v16 setPayloadValue:v82 forKey:*MEMORY[0x1E4F8BD70] onEventWithName:v81];

    if (a8) {
      [v16 setPayloadValue:*a8 forKey:*MEMORY[0x1E4F8BD38] onEventWithName:v81];
    }
    goto LABEL_70;
  }
  if (!v21)
  {
    [v16 removeEventWithName:*MEMORY[0x1E4F8BD30]];
    char v100 = 0;
    if (([v14 postProcessThumbnailsOnlyIfVersionMismatchOrMissing:&v100 coordinator:v98] & 1) == 0)
    {
      id v77 = v14;
      id v78 = PLMigrationGetLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v78, OS_LOG_TYPE_ERROR, "Thumbnail processing failed, requires rebuild", buf, 2u);
      }
      int64_t v75 = 4;
      goto LABEL_69;
    }
    if (v100)
    {
      id v77 = v14;
      id v78 = PLMigrationGetLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v78, OS_LOG_TYPE_DEFAULT, "Thumbnail processing succeeded", buf, 2u);
      }
      int64_t v75 = 0;
LABEL_69:

      id v14 = v77;
      goto LABEL_70;
    }
    int64_t v75 = 0;
LABEL_70:
    if (v75 != 4) {
      goto LABEL_58;
    }
    goto LABEL_50;
  }
  uint64_t v64 = *MEMORY[0x1E4F8BD30];
  [v16 setPayloadValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F8BD70] onEventWithName:*MEMORY[0x1E4F8BD30]];
  if (a8)
  {
    id v59 = *a8;
    uint64_t v60 = *MEMORY[0x1E4F8BD38];
    v61 = v16;
    uint64_t v62 = v64;
LABEL_49:
    [v61 setPayloadValue:v59 forKey:v60 onEventWithName:v62];
  }
LABEL_50:
  id v69 = v19;
  id v70 = v14;
  v71 = PLMigrationGetLog();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
  {
    v72 = [v13 path];
    *(_DWORD *)buf = 138412290;
    id v108 = v72;
    _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_ERROR, "Failed to open store %@, requires rebuild", buf, 0xCu);
  }
  if (v18)
  {
    id v99 = 0;
    char v73 = [v98 removePersistentStore:v18 error:&v99];
    id v74 = v99;
    id v14 = v70;
    if ((v73 & 1) == 0)
    {
      uint64_t v83 = [MEMORY[0x1E4F28B00] currentHandler];
      [v83 handleFailureInMethod:a2, a1, @"PLPersistentContainer.m", 517, @"Unable to remove store: %@", v74 object file lineNumber description];
    }
    int64_t v75 = 4;
  }
  else
  {
    int64_t v75 = 4;
    id v14 = v70;
  }
  id v19 = v69;
LABEL_58:

  return v75;
}

+ (void)removePhotosDatabaseWithPathManager:(id)a3
{
  id v30 = a1;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  uint64_t v3 = [v33 photosDatabasePath];
  uint64_t v4 = [v3 stringByAppendingString:@"-wal"];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v31 = (void *)v4;
  v32 = v3;
  v47[0] = v3;
  v47[1] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v34 = 0;
    uint64_t v35 = 0;
    uint64_t v9 = *(void *)v40;
    uint64_t v10 = *MEMORY[0x1E4F1C5F8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v12, 0, v30))
        {
          id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
          id v37 = 0;
          id v38 = 0;
          int v14 = [(__CFString *)v13 getResourceValue:&v38 forKey:v10 error:&v37];
          id v15 = v38;
          uint64_t v16 = (char *)v37;
          if (v14) {
            BOOL v17 = v15 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            id v18 = PLMigrationGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v44 = v13;
              __int16 v45 = 2112;
              uint64_t v46 = v16;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Couldn't get file size for %@. Error: %@", buf, 0x16u);
            }

            char v34 = 1;
          }
          else
          {
            v35 += [v15 unsignedLongLongValue];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v8);
  }
  else
  {
    char v34 = 0;
    uint64_t v35 = 0;
  }

  id v19 = (void *)MEMORY[0x1E4F8B8D8];
  id v20 = [v33 libraryURL];
  int v21 = [v20 path];
  LOBYTE(v19) = [v19 diskSpaceAvailableForPath:v21] <= 2 * v35 + 0x40000000;

  char v22 = v34 | v19;
  int v23 = PLMigrationGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = @"Moving aside";
    if (v22) {
      int v24 = @"Destroying";
    }
    *(_DWORD *)buf = 138412290;
    v44 = v24;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "%@ photos database", buf, 0xCu);
  }

  if (v22)
  {
    [v30 _destroyPhotosDatabaseWithPath:v32 backupToPath:0];
  }
  else
  {
    int64_t v25 = [v33 photosAsideDatabasePath];
    [v30 _destroyPhotosDatabaseWithPath:v32 backupToPath:v25];
    if (v25)
    {
      uint64_t v36 = 66049;
      long long v26 = v25;
      if (fsctl((const char *)[(__CFString *)v26 fileSystemRepresentation], 0xC0084A44uLL, &v36, 0) == -1&& *__error() != 45)
      {
        long long v27 = PLMigrationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v28 = __error();
          __int16 v29 = strerror(*v28);
          *(_DWORD *)buf = 138412546;
          v44 = v26;
          __int16 v45 = 2080;
          uint64_t v46 = v29;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "error marking %@ purgeable: %s", buf, 0x16u);
        }
      }
    }
  }
}

+ (BOOL)_destroyPhotosDatabaseWithPath:(id)a3 backupToPath:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x19F38D3B0]();
  id v45 = 0;
  id v46 = 0;
  [a1 _getPersistentStoreURL:&v46 options:&v45 forDatabasePath:v6 enableOrderKeyNotifications:0];
  id v8 = v46;
  id v9 = v45;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C188]);
  id v11 = (id)*MEMORY[0x1E4F1BF70];
  long long v39 = v7;
  if (v7)
  {
    id v36 = v6;
    id v43 = 0;
    id v44 = 0;
    [a1 _getPersistentStoreURL:&v44 options:&v43 forDatabasePath:v7 enableOrderKeyNotifications:0];
    id v12 = v44;
    id v13 = v43;
    int v14 = (void *)[v9 copy];
    id v42 = 0;
    int v15 = [v10 _replacePersistentStoreAtURL:v12 destinationOptions:v13 withPersistentStoreFromURL:v8 sourceOptions:v14 storeType:v11 error:&v42];
    id v16 = v42;
    BOOL v17 = PLMigrationGetLog();
    id v18 = v17;
    char v37 = v15;
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        char v34 = [v8 path];
        uint64_t v19 = [v12 path];
        *(_DWORD *)buf = 138412546;
        int v48 = v34;
        __int16 v49 = 2112;
        uint64_t v50 = v19;
        id v20 = (void *)v19;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Moved old store aside from \"%@\" to \"%@\"", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      [v8 path];
      int v21 = v35 = v9;
      char v22 = [v12 path];
      *(_DWORD *)buf = 138412802;
      int v48 = v21;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v22;
      __int16 v51 = 2112;
      id v52 = v16;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Could not move store at \"%@\" to \"%@\": %@", buf, 0x20u);

      id v9 = v35;
    }

    id v6 = v36;
  }
  else
  {
    id v16 = 0;
    char v37 = 1;
  }
  int v23 = (void *)[v9 mutableCopy];
  [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BEC8]];
  id v41 = v16;
  char v24 = [v10 _destroyPersistentStoreAtURL:v8 withType:v11 options:v23 error:&v41];
  id v25 = v41;

  if (v24)
  {
    char v26 = 1;
    id v27 = v25;
  }
  else
  {
    int v28 = PLMigrationGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = [v8 path];
      *(_DWORD *)buf = 138412546;
      int v48 = v29;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v25;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to destroy store located at \"%@\". Attempting again with unlink option. Error: %@", buf, 0x16u);
    }
    [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BF18]];
    id v40 = v25;
    char v30 = [v10 _destroyPersistentStoreAtURL:v8 withType:v11 options:v23 error:&v40];
    id v27 = v40;

    if (v30)
    {
      char v26 = 1;
    }
    else
    {
      uint64_t v31 = PLMigrationGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = [v8 path];
        *(_DWORD *)buf = 138412546;
        int v48 = v32;
        __int16 v49 = 2112;
        uint64_t v50 = (uint64_t)v27;
        _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Could not destroy store \"%@\". Error: %@", buf, 0x16u);
      }
      char v26 = 0;
    }
  }

  return v37 & v26;
}

+ (void)getConfigurationForDatabasePath:(id)a3 withBlock:(id)a4
{
  id v9 = 0;
  id v10 = 0;
  id v6 = (void (**)(id, id, id))a4;
  [a1 _getPersistentStoreURL:&v10 options:&v9 forDatabasePath:a3 enableOrderKeyNotifications:0];
  id v7 = v10;
  id v8 = v9;
  v6[2](v6, v7, v8);
}

+ (void)unsafeRemoveManagedObjectModel
{
}

void __55__PLPersistentContainer_unsafeRemoveManagedObjectModel__block_invoke()
{
  v0 = PLMigrationGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_19B3C7000, v0, OS_LOG_TYPE_ERROR, "Removing shared managedObjectModel", v2, 2u);
  }

  v1 = (void *)sSharedModel;
  sSharedModel = 0;
}

@end