@interface SUCoreDocumentationDataManager
+ (id)_sharedManagerInitWithPath:(id)a3;
+ (id)sharedManager;
+ (void)setupSharedManagerWithStashPath:(id)a3;
- (BOOL)cleanupNonInstalledDocumentationWithError:(id *)a3;
- (BOOL)queue_cleanupNonInstalledDocumentationWithError:(id *)a3;
- (BOOL)queue_evictStashIfNecessary:(id *)a3;
- (BOOL)queue_getDocumentation:(id *)a3 documentationData:(id *)a4 forInstalledUpdateType:(unint64_t)a5 withError:(id *)a6;
- (BOOL)queue_stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5;
- (BOOL)stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5;
- (NSString)documentationPath;
- (OS_dispatch_queue)stateQueue;
- (SUCoreDocumentationDataManager)init;
- (SUCoreDocumentationDataManager)initWithStashPath:(id)a3;
- (id)description;
- (id)getDocumentationDataForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4;
- (id)getDocumentationForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4;
- (id)installedBuildVersionsWithError:(id *)a3;
- (id)stashedDataDirectoryForBuildVersion:(id)a3;
- (void)setDocumentationPath:(id)a3;
@end

@implementation SUCoreDocumentationDataManager

- (SUCoreDocumentationDataManager)init
{
  return [(SUCoreDocumentationDataManager *)self initWithStashPath:@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore/Documentation"];
}

- (SUCoreDocumentationDataManager)initWithStashPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SUCoreDocumentationDataManager;
  v5 = [(SUCoreDocumentationDataManager *)&v14 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.su.installedDocManager", v6);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v7;

    if (v4) {
      v9 = v4;
    }
    else {
      v9 = @"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore/Documentation";
    }
    objc_storeStrong((id *)&v5->_documentationPath, v9);
  }
  v10 = [MEMORY[0x263F77DE8] sharedLogger];
  v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(SUCoreDocumentationDataManager *)v5 documentationPath];
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Created SUCoreDocumentationDataManager with stash path: %{public}@", buf, 0xCu);
  }
  return v5;
}

+ (id)sharedManager
{
  return +[SUCoreDocumentationDataManager _sharedManagerInitWithPath:0];
}

+ (void)setupSharedManagerWithStashPath:(id)a3
{
  id v3 = +[SUCoreDocumentationDataManager _sharedManagerInitWithPath:a3];
}

+ (id)_sharedManagerInitWithPath:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUCoreDocumentationDataManager__sharedManagerInitWithPath___block_invoke;
  block[3] = &unk_2640DC338;
  id v9 = v3;
  uint64_t v4 = _sharedManagerInitWithPath__onceDocumentationDataManager;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_sharedManagerInitWithPath__onceDocumentationDataManager, block);
  }
  id v6 = (id)_sharedManagerInitWithPath____dataManager;

  return v6;
}

uint64_t __61__SUCoreDocumentationDataManager__sharedManagerInitWithPath___block_invoke(uint64_t a1)
{
  _sharedManagerInitWithPath____dataManager = [[SUCoreDocumentationDataManager alloc] initWithStashPath:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  id v25 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a5) {
    *a5 = 0;
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__SUCoreDocumentationDataManager_stashDocumentationAssetData_forBuildVersion_error___block_invoke;
  block[3] = &unk_2640DD948;
  v18 = &v26;
  void block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v19 = &v20;
  dispatch_sync(stateQueue, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __84__SUCoreDocumentationDataManager_stashDocumentationAssetData_forBuildVersion_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = objc_msgSend(v2, "queue_stashDocumentationAssetData:forBuildVersion:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (id)getDocumentationDataForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  objc_super v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a4) {
    *a4 = 0;
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__SUCoreDocumentationDataManager_getDocumentationDataForInstalledUpdateType_withError___block_invoke;
  v10[3] = &unk_2640DD970;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[7] = a3;
  dispatch_sync(stateQueue, v10);
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

void __87__SUCoreDocumentationDataManager_getDocumentationDataForInstalledUpdateType_withError___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(a1[5] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(id *)(v5 + 40);
  id obj = v3;
  objc_msgSend(v1, "queue_getDocumentation:documentationData:forInstalledUpdateType:withError:", 0, &obj, v4, &v6);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v6);
}

- (id)getDocumentationForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  objc_super v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a4) {
    *a4 = 0;
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__SUCoreDocumentationDataManager_getDocumentationForInstalledUpdateType_withError___block_invoke;
  v10[3] = &unk_2640DD970;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[7] = a3;
  dispatch_sync(stateQueue, v10);
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

void __83__SUCoreDocumentationDataManager_getDocumentationForInstalledUpdateType_withError___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(a1[5] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(id *)(v5 + 40);
  id obj = v3;
  objc_msgSend(v1, "queue_getDocumentation:documentationData:forInstalledUpdateType:withError:", &obj, 0, v4, &v6);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v6);
}

- (BOOL)cleanupNonInstalledDocumentationWithError:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  id v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a3) {
    *a3 = 0;
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__SUCoreDocumentationDataManager_cleanupNonInstalledDocumentationWithError___block_invoke;
  block[3] = &unk_2640DCF58;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(stateQueue, block);
  if (a3) {
    *a3 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __76__SUCoreDocumentationDataManager_cleanupNonInstalledDocumentationWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = objc_msgSend(v2, "queue_cleanupNonInstalledDocumentationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)queue_stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a5) {
    *a5 = 0;
  }
  v10 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v52 = v8;
    __int16 v53 = 2114;
    id v54 = v9;
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Stashing documentation asset: %{public}@ for build version: %{public}@", buf, 0x16u);
  }

  id v12 = [MEMORY[0x263F08850] defaultManager];
  if (!v12)
  {
    id v22 = (void *)MEMORY[0x263F087E8];
    v23 = @"Failed to create NSFileManager";
    uint64_t v24 = 9000;
LABEL_13:
    id v25 = [v22 buildAndLogCheckedSUCoreError:v24 underlying:0 description:v23];
    id v20 = v25;
    if (!a5)
    {
      char v21 = 0;
      uint64_t v15 = 0;
      goto LABEL_33;
    }
    id v26 = v25;
    id v20 = v26;
    char v21 = 0;
    uint64_t v15 = 0;
LABEL_32:
    *a5 = v26;
    goto LABEL_33;
  }
  uint64_t v13 = NSURL;
  id v14 = [(SUCoreDocumentationDataManager *)self stashedDataDirectoryForBuildVersion:v9];
  uint64_t v15 = [v13 fileURLWithPath:v14];

  if (!v15)
  {
    id v22 = (void *)MEMORY[0x263F087E8];
    v23 = @"Failed to create stashURL";
    uint64_t v24 = 9004;
    goto LABEL_13;
  }
  id v16 = [v15 path];
  int v17 = [v12 fileExistsAtPath:v16];

  if (v17)
  {
    char v18 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v9;
      _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Documentation data already stashed for build version %@", buf, 0xCu);
    }

    id v20 = 0;
    char v21 = 1;
    goto LABEL_33;
  }
  id v50 = 0;
  BOOL v27 = [(SUCoreDocumentationDataManager *)self queue_evictStashIfNecessary:&v50];
  id v28 = v50;
  if (!v27)
  {
    char v29 = [MEMORY[0x263F77DE8] sharedLogger];
    v30 = [v29 oslog];

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDocumentationDataManager queue_stashDocumentationAssetData:forBuildVersion:error:]((uint64_t)v28, v30);
    }
  }
  if (([v8 refreshState] & 1) == 0)
  {
    v43 = (void *)MEMORY[0x263F087E8];
    v44 = @"Failed to refresh documentation asset";
    uint64_t v45 = 9011;
    goto LABEL_30;
  }
  if (([v8 wasLocal] & 1) == 0)
  {
    v43 = (void *)MEMORY[0x263F087E8];
    v44 = @"Documentation asset is not local";
    uint64_t v45 = 9012;
LABEL_30:
    id v20 = [v43 buildAndLogCheckedSUCoreError:v45 underlying:v28 description:v44];

    if (!a5)
    {
LABEL_35:
      char v21 = 0;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  id v49 = v28;
  char v31 = [v12 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v49];
  id v32 = v49;

  if ((v31 & 1) == 0)
  {
    id v20 = [MEMORY[0x263F087E8] buildAndLogCheckedSUCoreError:9004 underlying:v32 description:@"Failed to create documentation data stash directory"];

    if (!a5) {
      goto LABEL_35;
    }
LABEL_31:
    id v26 = v20;
    id v20 = v26;
    char v21 = 0;
    goto LABEL_32;
  }
  v33 = [v8 getLocalUrl];
  v34 = [v33 URLByDeletingLastPathComponent];

  v35 = [v34 lastPathComponent];
  uint64_t v36 = [v15 URLByAppendingPathComponent:v35];

  v37 = (void *)v36;
  v38 = [MEMORY[0x263F77DE8] sharedLogger];
  v39 = [v38 oslog];

  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v52 = v9;
    __int16 v53 = 2114;
    id v54 = v34;
    __int16 v55 = 2114;
    v56 = v37;
    _os_log_impl(&dword_20C8EA000, v39, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Copying documentation asset for %{public}@ from %{public}@ to %{public}@", buf, 0x20u);
  }

  id v48 = v32;
  char v21 = [v12 copyItemAtURL:v34 toURL:v37 error:&v48];
  id v20 = v48;

  if ((v21 & 1) == 0)
  {
    v40 = (void *)MEMORY[0x263F087E8];
    v47 = v37;
    v41 = [NSString stringWithFormat:@"Failed to copy from \"%@\" to \"%@\"", 0, v15];
    v42 = [v40 buildAndLogCheckedSUCoreError:9002 underlying:v20 description:v41];

    if (a5)
    {
      id v20 = v42;
      *a5 = v20;
    }
    else
    {
      id v20 = v42;
    }
    v37 = v47;
  }

LABEL_33:
  return v21;
}

- (BOOL)queue_getDocumentation:(id *)a3 documentationData:(id *)a4 forInstalledUpdateType:(unint64_t)a5 withError:(id *)a6
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  v76 = a4;
  if (a6) {
    *a6 = 0;
  }
  v10 = [MEMORY[0x263F77DA0] sharedDevice];
  uint64_t v11 = v10;
  if (a5 == 1)
  {
    if ([v10 hasSplatOnlyUpdateInstalled])
    {
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F77DA0] sharedDevice];
      char v14 = [v13 hasSemiSplatActive];

      if ((v14 & 1) == 0)
      {
        v72 = [MEMORY[0x263F087E8] buildAndLogCheckedSUCoreError:9009 underlying:0 description:@"Splat update not installed. No documentation data found for splat update"];
        id v65 = v72;
        if (a6)
        {
          id v65 = v72;
          BOOL v67 = 0;
          *a6 = v65;
        }
        else
        {
          BOOL v67 = 0;
        }
        goto LABEL_52;
      }
    }
    uint64_t v11 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v12 = [v11 splatCryptex1BuildVersion];
  }
  else
  {
    uint64_t v12 = [v10 buildVersion];
  }
  uint64_t v15 = (void *)v12;

  v85 = [(SUCoreDocumentationDataManager *)self stashedDataDirectoryForBuildVersion:v15];
  if (v85)
  {
    v75 = a3;
    v77 = v15;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v16 = [MEMORY[0x263F08850] defaultManager];
    id v87 = 0;
    int v17 = [v16 contentsOfDirectoryAtPath:v85 error:&v87];
    id v74 = v87;

    id obj = v17;
    uint64_t v83 = [v17 countByEnumeratingWithState:&v88 objects:v98 count:16];
    char v18 = 0;
    uint64_t v19 = 0;
    if (!v83) {
      goto LABEL_31;
    }
    uint64_t v82 = *(void *)v89;
    uint64_t v78 = *MEMORY[0x263F77E68];
    uint64_t v79 = *MEMORY[0x263F77EB8];
    while (1)
    {
      uint64_t v20 = 0;
      char v21 = v18;
      id v22 = v19;
      do
      {
        if (*(void *)v89 != v82) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v88 + 1) + 8 * v20);
        uint64_t v24 = NSURL;
        v97[0] = v85;
        v97[1] = v23;
        v97[2] = @"AssetData";
        id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:3];
        uint64_t v26 = [v24 fileURLWithPathComponents:v25];

        BOOL v27 = NSURL;
        v96[0] = v85;
        v96[1] = v23;
        v96[2] = @"Info.plist";
        id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:3];
        char v29 = [v27 fileURLWithPathComponents:v28];

        v30 = [NSDictionary dictionaryWithContentsOfURL:v29];
        char v31 = (SUCoreDocumentation *)v26;
        id v32 = [v30 safeObjectForKey:@"MobileAssetProperties" ofClass:objc_opt_class()];

        v33 = [MEMORY[0x263F77DE8] sharedLogger];
        v34 = [v33 oslog];

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v93 = v31;
          __int16 v94 = 2114;
          v95 = v32;
          _os_log_impl(&dword_20C8EA000, v34, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Initializing documentation with assetBundleURL: %{public}@, assetAttributes: %{public}@", buf, 0x16u);
        }

        char v18 = [[SUCoreDocumentation alloc] initWithLocalBundleURL:v31 attributes:v32];
        id v35 = [(SUCoreDocumentation *)v18 extendDocumentationProperties];
        if (a5 == 1)
        {
          id v36 = [NSString alloc];
          v37 = [(SUCoreDocumentation *)v18 humanReadableUpdateName];
          [MEMORY[0x263F77DA0] sharedDevice];
          v38 = v81 = v32;
          v39 = [v38 splatCryptex1ProductVersion];
          [MEMORY[0x263F77DA0] sharedDevice];
          v40 = v86 = v22;
          v41 = [v40 splatCryptex1ProductVersionExtra];
          v42 = (void *)[v36 initWithFormat:@"%@ %@ %@", v37, v39, v41];
          [(SUCoreDocumentation *)v18 setHumanReadableUpdateName:v42];

          id v43 = [NSString alloc];
          v44 = [MEMORY[0x263F77DA0] sharedDevice];
          uint64_t v45 = [v44 splatCryptex1ProductVersion];
          v46 = [MEMORY[0x263F77DA0] sharedDevice];
          v47 = [v46 splatCryptex1ProductVersionExtra];
          id v48 = (void *)[v43 initWithFormat:@"%@ %@", v45, v47];
          [(SUCoreDocumentation *)v18 setHumanReadableUpdateVersion:v48];

          id v22 = v86;
          id v32 = v81;
        }
        id v49 = [MEMORY[0x263F77DA0] sharedDevice];
        if (![v49 isBootedOSSecureInternal]) {
          goto LABEL_26;
        }
        id v50 = (void *)[objc_alloc(MEMORY[0x263F77D90]) initWithProjectName:v79];
        char v51 = [v50 getBoolConfigForKey:v78];

        if ((v51 & 1) == 0)
        {
          id v52 = [NSString alloc];
          __int16 v53 = [(SUCoreDocumentation *)v18 humanReadableUpdateName];
          id v54 = (void *)[v52 initWithFormat:@"%@ (%@)", v53, v77];
          [(SUCoreDocumentation *)v18 setHumanReadableUpdateName:v54];

          id v55 = [NSString alloc];
          id v49 = [(SUCoreDocumentation *)v18 humanReadableUpdateVersion];
          v56 = (void *)[v55 initWithFormat:@"%@ (%@)", v49, v77];
          [(SUCoreDocumentation *)v18 setHumanReadableUpdateVersion:v56];

LABEL_26:
        }
        uint64_t v19 = objc_alloc_init(SUCoreDocumentationData);

        uint64_t v57 = [(SUCoreDocumentation *)v18 humanReadableUpdateName];
        [(SUCoreDocumentationData *)v19 setHumanReadableUpdateName:v57];

        v58 = [(SUCoreDocumentation *)v18 humanReadableUpdateTitle];
        [(SUCoreDocumentationData *)v19 setHumanReadableUpdateTitle:v58];

        v59 = [(SUCoreDocumentation *)v18 humanReadableUpdateVersion];
        [(SUCoreDocumentationData *)v19 setHumanReadableUpdateVersion:v59];

        v60 = [(SUCoreDocumentation *)v18 releaseNotes];
        [(SUCoreDocumentationData *)v19 setReadme:v60];

        v61 = [(SUCoreDocumentation *)v18 releaseNotesSummary];
        [(SUCoreDocumentationData *)v19 setReadmeSummary:v61];

        v62 = [(SUCoreDocumentation *)v18 licenseAgreement];
        [(SUCoreDocumentationData *)v19 setLicense:v62];

        if (v18 && v19) {
          goto LABEL_31;
        }
        ++v20;
        char v21 = v18;
        id v22 = v19;
      }
      while (v83 != v20);
      uint64_t v83 = [obj countByEnumeratingWithState:&v88 objects:v98 count:16];
      if (!v83)
      {
LABEL_31:

        v63 = [MEMORY[0x263F77DE8] sharedLogger];
        v64 = [v63 oslog];

        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v93 = v18;
          __int16 v94 = 2114;
          v95 = v19;
          _os_log_impl(&dword_20C8EA000, v64, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Returning documentation: %{public}@, documentation data: %{public}@", buf, 0x16u);
        }

        uint64_t v15 = v77;
        id v65 = v74;
        if (v75) {
          id *v75 = v18;
        }
        if (v76) {
          id *v76 = v19;
        }
        if (v18) {
          BOOL v66 = v19 == 0;
        }
        else {
          BOOL v66 = 1;
        }
        BOOL v67 = !v66;

        goto LABEL_51;
      }
    }
  }
  v68 = [MEMORY[0x263F77DE8] sharedLogger];
  v69 = [v68 oslog];

  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDocumentationDataManager queue_getDocumentation:documentationData:forInstalledUpdateType:withError:]((uint64_t)v15, v69);
  }

  v70 = (void *)MEMORY[0x263F087E8];
  v71 = [NSString stringWithFormat:@"No available stashed documentation path for provided build version (%@)", v15];
  id v65 = [v70 buildAndLogCheckedSUCoreError:9004 underlying:0 description:v71];

  if (a6)
  {
    id v65 = v65;
    BOOL v67 = 0;
    *a6 = v65;
  }
  else
  {
    BOOL v67 = 0;
  }
LABEL_51:

LABEL_52:
  return v67;
}

- (BOOL)queue_cleanupNonInstalledDocumentationWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3) {
    *a3 = 0;
  }
  v38 = [MEMORY[0x263F08850] defaultManager];
  if (!v38)
  {
    uint64_t v23 = [MEMORY[0x263F087E8] buildAndLogCheckedSUCoreError:9000 underlying:0 description:@"Failed to create NSFileManager for cleanup"];
    id v13 = v23;
    if (!a3)
    {
      BOOL v25 = 0;
      id v9 = 0;
      uint64_t v5 = 0;
      goto LABEL_36;
    }
    id v24 = v23;
    id v13 = v24;
    BOOL v25 = 0;
    id v9 = 0;
    uint64_t v5 = 0;
    goto LABEL_26;
  }
  id v45 = 0;
  uint64_t v5 = [(SUCoreDocumentationDataManager *)self installedBuildVersionsWithError:&v45];
  id v6 = v45;
  dispatch_queue_t v7 = v6;
  if (!v5 || v6)
  {
    id v13 = [MEMORY[0x263F087E8] buildAndLogCheckedSUCoreError:9005 underlying:v6 description:@"Failed to create installedBuildVersions array for cleanup"];

    if (!a3)
    {
      BOOL v25 = 0;
      id v9 = 0;
      goto LABEL_36;
    }
    id v24 = v13;
    id v13 = v24;
    BOOL v25 = 0;
    id v9 = 0;
    goto LABEL_26;
  }
  id v8 = [(SUCoreDocumentationDataManager *)self documentationPath];
  id v44 = 0;
  id v9 = [v38 contentsOfDirectoryAtPath:v8 error:&v44];
  id v10 = v44;

  if (!v9 || v10)
  {
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    BOOL v27 = NSString;
    id v28 = [(SUCoreDocumentationDataManager *)self documentationPath];
    char v29 = [v27 stringWithFormat:@"Failed to read contents of %@ for cleanup: %@", v28, v10];
    id v13 = [v26 buildAndLogCheckedSUCoreError:9003 underlying:v10 description:v29];

    if (!a3)
    {
      BOOL v25 = 0;
      goto LABEL_36;
    }
    id v24 = v13;
    id v13 = v24;
    BOOL v25 = 0;
LABEL_26:
    *a3 = v24;
    goto LABEL_36;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v9;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v37 = a3;
    id v13 = 0;
    uint64_t v14 = *(void *)v41;
LABEL_10:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v41 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * v15);
      if (([v5 containsObject:v16] & 1) == 0)
      {
        int v17 = [(SUCoreDocumentationDataManager *)self stashedDataDirectoryForBuildVersion:v16];
        if (!v17)
        {
          v30 = (void *)MEMORY[0x263F087E8];
          char v31 = [NSString stringWithFormat:@"Failed to create build version path for cleanup with build version (%@)", v16];
          id v32 = [v30 buildAndLogCheckedSUCoreError:9004 underlying:0 description:v31];

          id v13 = v32;
          v33 = v37;
          if (v37) {
            goto LABEL_33;
          }
          goto LABEL_34;
        }
        char v18 = v5;
        id v19 = v9;
        uint64_t v20 = v13;
        id v39 = v13;
        char v21 = [v38 removeItemAtPath:v17 error:&v39];
        id v22 = v39;

        if ((v21 & 1) == 0)
        {
          id v35 = (void *)MEMORY[0x263F087E8];
          id v36 = [NSString stringWithFormat:@"Failed to remove directory %@: %@", v17, v22];
          id v32 = [v35 buildAndLogCheckedSUCoreError:90007 underlying:v22 description:v36];

          id v13 = v32;
          v33 = v37;
          id v9 = v19;
          uint64_t v5 = v18;
          if (!v37) {
            goto LABEL_34;
          }
LABEL_33:
          id v13 = v32;
          id *v33 = v13;
LABEL_34:

          BOOL v25 = 0;
          goto LABEL_35;
        }

        id v13 = v22;
        id v9 = v19;
        uint64_t v5 = v18;
      }
      if (v12 == ++v15)
      {
        uint64_t v12 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v12) {
          goto LABEL_10;
        }
        goto LABEL_31;
      }
    }
  }
  id v13 = 0;
LABEL_31:
  BOOL v25 = 1;
LABEL_35:

LABEL_36:
  return v25;
}

- (BOOL)queue_evictStashIfNecessary:(id *)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SUCoreDocumentationDataManager *)self stateQueue];
  dispatch_assert_queue_V2(v5);

  if (a3) {
    *a3 = 0;
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  if (!v6)
  {
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = @"Failed to create NSFileManager";
    uint64_t v24 = 9000;
LABEL_16:
    BOOL v25 = [v22 buildAndLogCheckedSUCoreError:v24 underlying:0 description:v23];
    id v18 = v25;
    if (a3)
    {
      id v26 = v25;
      id v18 = v26;
      BOOL v21 = 0;
      id v13 = 0;
LABEL_21:
      id v19 = 0;
      uint64_t v20 = 0;
LABEL_22:
      *a3 = v26;
      goto LABEL_40;
    }
    BOOL v21 = 0;
    id v13 = 0;
LABEL_39:
    id v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_40;
  }
  unint64_t v7 = 0x263F77000uLL;
  id v8 = [MEMORY[0x263F77DE8] sharedLogger];
  id v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(SUCoreDocumentationDataManager *)self documentationPath];
    *(_DWORD *)buf = 138543362;
    uint64_t v60 = (uint64_t)v10;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Preparing to evict stashed documentation assets at directory %{public}@", buf, 0xCu);
  }
  uint64_t v11 = [(SUCoreDocumentationDataManager *)self documentationPath];

  if (!v11)
  {
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = @"Missing documentation path when attempting to evict documentation stash";
    uint64_t v24 = 9004;
    goto LABEL_16;
  }
  uint64_t v12 = [(SUCoreDocumentationDataManager *)self documentationPath];
  id v58 = 0;
  id v13 = [v6 contentsOfDirectoryAtPath:v12 error:&v58];
  id v14 = v58;

  if (!v13 || v14)
  {
    BOOL v27 = (void *)MEMORY[0x263F087E8];
    id v28 = NSString;
    char v29 = [(SUCoreDocumentationDataManager *)self documentationPath];
    v30 = [v28 stringWithFormat:@"Failed to read contents of %@: %@", v29, v14];
    id v18 = [v27 buildAndLogCheckedSUCoreError:9003 underlying:v14 description:v30];

    if (a3)
    {
      id v26 = v18;
      id v18 = v26;
      BOOL v21 = 0;
      goto LABEL_21;
    }
    BOOL v21 = 0;
    goto LABEL_39;
  }
  if ((unint64_t)[v13 count] <= 4)
  {
    uint64_t v15 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v13 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v60 = v17;
      __int16 v61 = 2048;
      uint64_t v62 = 5;
      _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Stashed assets (%lld) is below the minimum threshold (%lld), not evicting any assets", buf, 0x16u);
    }

    id v18 = 0;
    id v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_13;
  }
  id v57 = 0;
  uint64_t v20 = [(SUCoreDocumentationDataManager *)self installedBuildVersionsWithError:&v57];
  id v31 = v57;
  id v32 = v31;
  if (!v20 || v31)
  {
    id v18 = [MEMORY[0x263F087E8] buildAndLogCheckedSUCoreError:9005 underlying:v31 description:@"Failed to create installedBuildVersions array"];

    if (!a3)
    {
LABEL_44:
      BOOL v21 = 0;
      id v19 = 0;
      goto LABEL_40;
    }
    goto LABEL_42;
  }
  v33 = [v13 sortedArrayUsingComparator:&__block_literal_global_5];
  if (!v33)
  {
    id v18 = [MEMORY[0x263F087E8] buildAndLogCheckedSUCoreError:90007 underlying:0 description:@"Failed to create sorted build version directory"];
    if (!a3) {
      goto LABEL_44;
    }
LABEL_42:
    id v26 = v18;
    id v18 = v26;
    BOOL v21 = 0;
    id v19 = 0;
    goto LABEL_22;
  }
  id v19 = v33;
  if ((unint64_t)[v33 count] < 5)
  {
    id v18 = 0;
LABEL_13:
    BOOL v21 = 1;
    goto LABEL_40;
  }
  id v52 = v13;
  unint64_t v34 = 0;
  uint64_t v35 = 0;
  id v18 = 0;
  while (1)
  {
    if ([v19 count] <= v34)
    {
      BOOL v21 = 1;
LABEL_52:
      id v13 = v52;
      goto LABEL_40;
    }
    uint64_t v36 = [v19 objectAtIndex:v34];
    if (!v36) {
      break;
    }
    v37 = (void *)v36;
    if (([v20 containsObject:v36] & 1) == 0)
    {
      id v55 = [(SUCoreDocumentationDataManager *)self stashedDataDirectoryForBuildVersion:v37];
      if (!v55)
      {
        id v45 = (void *)MEMORY[0x263F087E8];
        v46 = [NSString stringWithFormat:@"Failed to create deletePath"];
        uint64_t v47 = [v45 buildAndLogCheckedSUCoreError:90007 underlying:0 description:v46];

        id v18 = v47;
        if (!a3) {
          goto LABEL_51;
        }
        goto LABEL_50;
      }
      id v54 = v37;
      v38 = [*(id *)(v7 + 3560) sharedLogger];
      id v39 = [v38 oslog];

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = (uint64_t)v55;
        _os_log_impl(&dword_20C8EA000, v39, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Removing documentation asset at path %{public}@", buf, 0xCu);
      }

      id v56 = v18;
      char v53 = [v6 removeItemAtPath:v55 error:&v56];
      id v40 = v56;

      if ((v53 & 1) == 0)
      {
        id v48 = (void *)MEMORY[0x263F087E8];
        id v49 = NSString;
        id v50 = [(SUCoreDocumentationDataManager *)self documentationPath];
        char v51 = [v49 stringWithFormat:@"Failed to remove directory %@: %@", v50, v40];
        uint64_t v47 = [v48 buildAndLogCheckedSUCoreError:90007 underlying:v40 description:v51];

        id v18 = v47;
        v37 = v54;
        if (!a3)
        {
LABEL_51:

          BOOL v21 = 0;
          goto LABEL_52;
        }
LABEL_50:
        id v18 = v47;
        *a3 = v18;
        goto LABEL_51;
      }
      ++v35;

      id v18 = v40;
      unint64_t v7 = 0x263F77000;
      v37 = v54;
    }
    ++v34;

    BOOL v21 = 1;
    if ((unint64_t)([v19 count] - v35) <= 4) {
      goto LABEL_52;
    }
  }
  long long v42 = (void *)MEMORY[0x263F087E8];
  long long v43 = [NSString stringWithFormat:@"Failed to create deletePath"];
  id v44 = [v42 buildAndLogCheckedSUCoreError:9005 underlying:0 description:v43];

  id v13 = v52;
  if (a3)
  {
    id v26 = v44;
    id v18 = v26;
    BOOL v21 = 0;
    goto LABEL_22;
  }
  BOOL v21 = 0;
  id v18 = v44;
LABEL_40:

  return v21;
}

uint64_t __62__SUCoreDocumentationDataManager_queue_evictStashIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:65];
}

- (id)installedBuildVersionsWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v4)
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = @"Failed to allocate installed build version array";
    uint64_t v17 = 9000;
    goto LABEL_13;
  }
  uint64_t v5 = [MEMORY[0x263F77DA0] sharedDevice];
  id v6 = [v5 buildVersion];

  if (!v6)
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = @"No OS build version found";
    uint64_t v17 = 9006;
LABEL_13:
    id v18 = [v15 buildAndLogCheckedSUCoreError:v17 underlying:0 description:v16];
    id v14 = v18;
    if (a3)
    {
      id v14 = v18;
      id v13 = 0;
      *a3 = v14;
    }
    else
    {
      id v13 = 0;
    }
    goto LABEL_16;
  }
  [v4 addObject:v6];
  unint64_t v7 = [MEMORY[0x263F77DA0] sharedDevice];
  id v8 = [v7 splatCryptex1BuildVersion];

  if (v8 && ([v8 isEqualToString:v6] & 1) == 0) {
    [v4 addObject:v8];
  }
  id v9 = [MEMORY[0x263F77DE8] sharedLogger];
  id v10 = [v9 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v4 count];
    uint64_t v12 = [v4 componentsJoinedByString:@", "];
    int v20 = 134218242;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Found %lld installed build versions: %{public}@", (uint8_t *)&v20, 0x16u);
  }
  id v13 = v4;

  id v14 = 0;
LABEL_16:

  return v13;
}

- (id)stashedDataDirectoryForBuildVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreDocumentationDataManager *)self documentationPath];

  if (v5)
  {
    if (v4)
    {
      id v6 = [(SUCoreDocumentationDataManager *)self documentationPath];
      uint64_t v5 = [v6 stringByAppendingPathComponent:v4];
    }
    else
    {
      id v6 = [MEMORY[0x263F77DA8] sharedDiag];
      [v6 trackAnomaly:@"SUCoreDocumentationDataManager" forReason:@"Missing build version to construct documentation path" withResult:8116 withError:0];
      uint64_t v5 = 0;
    }
  }
  else
  {
    id v6 = [MEMORY[0x263F77DA8] sharedDiag];
    [v6 trackAnomaly:@"SUCoreDocumentationDataManager" forReason:@"Missing base path to construct documentation path" withResult:8116 withError:0];
  }

  return v5;
}

- (id)description
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(SUCoreDocumentationDataManager *)self documentationPath];
  id v4 = [v2 stringWithFormat:@"SUCoreDocumentationDataManager(%@)", v3];

  return v4;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (NSString)documentationPath
{
  return self->_documentationPath;
}

- (void)setDocumentationPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentationPath, 0);

  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)queue_stashDocumentationAssetData:(uint64_t)a1 forBuildVersion:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "[SUCoreDocumentationDataManager] Failed to create evict stash directories: %@", (uint8_t *)&v2, 0xCu);
}

- (void)queue_getDocumentation:(uint64_t)a1 documentationData:(NSObject *)a2 forInstalledUpdateType:withError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "[SUCoreDocumentationDataManager] No available stashedDocumentationPath for build version: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end