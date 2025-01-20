@interface PLAssetsdMigrationService
+ (BOOL)applyBackupExclusionToFileProviderDocumentStorage:(id *)a3;
+ (id)photosFileProviderManagerDocumentStorageURL:(id *)a3;
- (PLAssetsdMigrationService)initWithLibraryServicesManager:(id)a3;
- (void)_migrateWellknownLibraries;
- (void)cleanupModelForDataMigrationForRestoreType:(int64_t)a3 reply:(id)a4;
- (void)dataMigrationWillFinishWithReply:(id)a3;
@end

@implementation PLAssetsdMigrationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMigratordQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
}

- (void)_migrateWellknownLibraries
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [MEMORY[0x1E4F8B980] libraryCreateOptionsForWellKnownLibraryIdentifier:3];
  v15 = @"PLPhotoLibraryCreateOptions";
  v5 = [NSNumber numberWithUnsignedInteger:v4];
  v16[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v7 = [NSNumber numberWithInteger:3];
  [v3 setObject:v6 forKeyedSubscript:v7];

  v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdMigrationService _migrateWellknownLibraries]"];
  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PLAssetsdMigrationService__migrateWellknownLibraries__block_invoke;
  block[3] = &unk_1E5875E18;
  id v13 = v3;
  id v14 = v8;
  id v10 = v8;
  id v11 = v3;
  dispatch_async(backgroundQueue, block);
}

uint64_t __55__PLAssetsdMigrationService__migrateWellknownLibraries__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_28744];
  v2 = *(void **)(a1 + 40);
  return [v2 stillAlive];
}

void __55__PLAssetsdMigrationService__migrateWellknownLibraries__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 integerValue];
  id v3 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:v2];
  uint64_t v4 = PLMigrationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = PLStringFromWellKnownPhotoLibraryIdentifier();
    *(_DWORD *)buf = 138412546;
    v26 = v5;
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "migrate %@ at %@ STARTING", buf, 0x16u);
  }
  v6 = +[PLPhotoLibraryBundleController sharedBundleController];
  v7 = [v6 openBundleAtLibraryURL:v3];

  v8 = [[PLLibraryOpenerCreationOptions alloc] initWithWellKnownLibraryIdentifier:v2];
  v9 = [v7 libraryServicesManager];
  [v9 setCreateMode:1 options:v8];

  id v10 = [v7 libraryServicesManager];
  id v24 = 0;
  int v11 = [v10 activate:&v24];
  id v12 = v24;

  if (v11)
  {
    id v13 = [v7 libraryServicesManager];
    id v23 = v12;
    int v14 = [v13 awaitLibraryState:7 error:&v23];
    id v15 = v23;

    v16 = PLMigrationGetLog();
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = PLStringFromWellKnownPhotoLibraryIdentifier();
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        v19 = "migrate %@ COMPLETE";
        v20 = v17;
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        uint32_t v22 = 12;
LABEL_10:
        _os_log_impl(&dword_19B3C7000, v20, v21, v19, buf, v22);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = PLStringFromWellKnownPhotoLibraryIdentifier();
      *(_DWORD *)buf = 138412546;
      v26 = v18;
      __int16 v27 = 2112;
      id v28 = v15;
      v19 = "migrate %@ FAILED: %@";
      v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 22;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  id v15 = v12;
LABEL_12:
}

- (void)dataMigrationWillFinishWithReply:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  long long v12 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: dataMigrationWillFinishWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    qos_class_self();
    PLStringFromQoSClass();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Received data migration will finish at QoS: %{public}@", buf, 0xCu);
  }
  pl_dispatch_once();
  [(PLAssetsdMigrationService *)self _migrateWellknownLibraries];
  v4[2](v4);
  if ((_BYTE)v11) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  }
  if ((void)v12)
  {
    v8 = PLRequestGetLog();
    v9 = v8;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      id v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v12, "Received Clean up model after data migration for restore type %{public}@ at QoS: %{public}@", "%{public}s", buf, 0xCu);
    }
  }
}

void __62__PLAssetsdMigrationService_dataMigrationWillFinishWithReply___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    qos_class_self();
    PLStringFromQoSClass();
    id v3 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Running data migration will finish at QoS: %{public}@", buf, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) libraryServicesManager];
  int v5 = [v4 modelMigrator];
  v6 = [v5 deviceRestoreMigrationSupport];
  int v7 = [v6 isRestoreFromBackupSourceCloud];

  if (v7)
  {
    v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Not importing file system data in data migrator will finish due to OTA restore", buf, 2u);
    }

    v9 = [v4 modelMigrator];
    [v9 dontImportFileSystemDataIntoDatabaseWithPhotoLibrary:0];

    id v10 = [v4 modelMigrator];
    long long v11 = [v10 postProcessingToken];

    if ([v11 needsToPrepareForBackgroundRestore])
    {
      long long v12 = [v4 libraryURL];
      id v13 = objc_alloc_init(PLPhotoLibraryOptions);
      [(PLPhotoLibraryOptions *)v13 setRequiredState:6];
      id v27 = 0;
      id v14 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLAssetsdMigrationService dataMigrationWillFinishWithReply:]_block_invoke", v12, v13, &v27);
      id v15 = v27;
      if (!v14)
      {
        uint64_t v16 = PLMigrationGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          uint64_t v29 = "-[PLAssetsdMigrationService dataMigrationWillFinishWithReply:]_block_invoke";
          __int16 v30 = 2112;
          v31 = v12;
          __int16 v32 = 2112;
          id v33 = v15;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
        }
      }
    }
    if ([v4 isCloudPhotoLibraryEnabled])
    {
      v17 = PLMigrationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Importing faces file system data in data migrator will finish due to OTA restore", buf, 2u);
      }

      v18 = [v4 modelMigrator];
      [v18 loadFacesFileSystemDataIntoDatabase];
    }
  }
  v19 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdMigrationService dataMigrationWillFinishWithReply:]_block_invoke"];
  uint64_t v20 = *(void *)(a1 + 32);
  os_log_type_t v21 = *(NSObject **)(v20 + 16);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__PLAssetsdMigrationService_dataMigrationWillFinishWithReply___block_invoke_2;
  v24[3] = &unk_1E5873A50;
  v24[4] = v20;
  id v25 = v4;
  id v26 = v19;
  id v22 = v19;
  id v23 = v4;
  dispatch_async(v21, v24);
}

void __62__PLAssetsdMigrationService_dataMigrationWillFinishWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  int v2 = [(id)objc_opt_class() applyBackupExclusionToFileProviderDocumentStorage:&v11];
  id v3 = v11;
  uint64_t v4 = PLMigrationGetLog();
  int v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "Wrote backup exclusion attribute on photos file provider document storage URL";
      int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    v6 = "Failed to write backup exclusion on photos file provider document storage URL, %@";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
    goto LABEL_6;
  }

  +[PLModelMigrator waitForDataMigratorToExit];
  id v10 = [*(id *)(a1 + 40) modelMigrator];
  [v10 migratePersonContactInfo];

  [*(id *)(a1 + 48) stillAlive];
}

- (void)cleanupModelForDataMigrationForRestoreType:(int64_t)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v7;
  if (v7)
  {
    os_log_type_t v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: cleanupModelForDataMigrationForRestoreType:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint32_t v9 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v10 = PLMigrationGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 2) {
      id v11 = @"none";
    }
    else {
      id v11 = off_1E5871370[a3 - 1];
    }
    long long v12 = v11;
    qos_class_self();
    id v13 = PLStringFromQoSClass();
    *(_DWORD *)buf = 138543618;
    id v27 = (const char *)v12;
    __int16 v28 = 2114;
    uint64_t v29 = v13;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Received Clean up model after data migration for restore type %{public}@ at QoS: %{public}@", buf, 0x16u);
  }
  dataMigratordQueue = self->_dataMigratordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PLAssetsdMigrationService_cleanupModelForDataMigrationForRestoreType_reply___block_invoke;
  block[3] = &unk_1E5873370;
  void block[4] = self;
  int64_t v22 = a3;
  id v15 = v6;
  id v21 = v15;
  dispatch_async(dataMigratordQueue, block);

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v16 = PLRequestGetLog();
    v17 = v16;
    os_signpost_id_t v18 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      id v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "Received Clean up model after data migration for restore type %{public}@ at QoS: %{public}@", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __78__PLAssetsdMigrationService_cleanupModelForDataMigrationForRestoreType_reply___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) libraryServicesManager];
  id v3 = [v2 modelMigrator];
  [v3 cleanupModelForDataMigrationForRestoreType:*(void *)(a1 + 48)];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (PLAssetsdMigrationService)initWithLibraryServicesManager:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PLAssetsdMigrationService;
  id v3 = [(PLAbstractLibraryServicesManagerService *)&v12 initWithLibraryServicesManager:a3];
  if (v3)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assetsd.migration-services", v4);
    id v6 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v5;

    int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    os_log_type_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.assetsd.migration-services.data-migrator", v8, *((dispatch_queue_t *)v3 + 2));
    id v10 = (void *)*((void *)v3 + 3);
    *((void *)v3 + 3) = v9;
  }
  return (PLAssetsdMigrationService *)v3;
}

+ (BOOL)applyBackupExclusionToFileProviderDocumentStorage:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v3 = [a1 photosFileProviderManagerDocumentStorageURL:&v13];
  id v4 = v13;
  if (v3)
  {
    id v12 = v4;
    char v5 = [MEMORY[0x1E4F8B988] setTimeMachineExclusionAttribute:1 url:v3 error:&v12];
    id v6 = v12;
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"Failed to apply backup exclusion, %@", v4];
    os_log_type_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F8C500];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = v7;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

    id v6 = [v8 errorWithDomain:v9 code:41003 userInfo:v10];

    char v5 = 0;
    id v4 = (id)v7;
  }

  return v5;
}

+ (id)photosFileProviderManagerDocumentStorageURL:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F25DE0]) _initWithProviderIdentifier:@"com.apple.mobileslideshow.PhotosFileProvider" groupName:@"group.com.apple.mobileslideshow.PhotosFileProvider"];
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 documentStorageURL];
    if (v6) {
      goto LABEL_8;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"Unable to retrieve photos file provider manager document storage URL";
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = (__CFString **)v18;
    id v11 = &v17;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    uint64_t v16 = @"Unable to access photos file provider manager";
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = &v16;
    id v11 = &v15;
  }
  id v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  id v13 = [v7 errorWithDomain:v8 code:41003 userInfo:v12];
  if (a3)
  {
    id v13 = v13;
    *a3 = v13;
  }

  id v6 = 0;
LABEL_8:

  return v6;
}

@end