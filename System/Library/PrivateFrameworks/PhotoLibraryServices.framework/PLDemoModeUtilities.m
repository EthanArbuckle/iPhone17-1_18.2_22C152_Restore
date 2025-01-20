@interface PLDemoModeUtilities
+ (NSString)systemDemoContentPhotoLibraryTemplatePath;
+ (NSString)systemDemoContentStagingBasePath;
+ (id)newDemoModeUtilitiesWithDefaultSystemPaths;
- (BOOL)_evalSystemSafetyCheck:(id)a3;
- (BOOL)cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary;
- (BOOL)prepareForStoreDemoModeByStagingDemoLibraryContentFromTemplate;
- (BOOL)replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists;
- (NSString)demoContentPhotoLibraryPrestagingPath;
- (NSString)demoContentPhotoLibraryStagingPath;
- (NSString)demoContentPhotoLibraryTemplatePath;
- (NSString)demoContentStagingBasePath;
- (PLDemoModeUtilities)initWithDemoContentTemplatePath:(id)a3 stagingBasePath:(id)a4 targetPhotoLibraryPathManager:(id)a5 options:(unint64_t)a6;
- (PLPhotoLibraryPathManager)targetPhotoLibraryPathManager;
- (id)fetchDemoContentResultsInLibrary:(id)a3;
- (int64_t)markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent:(BOOL)a3;
- (unint64_t)options;
- (void)kickstartStagedDemoContentInstallationByKillingAllClients;
- (void)warmUpDemoLibraryInstalledFromStagedTemplate;
@end

@implementation PLDemoModeUtilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPhotoLibraryPathManager, 0);
  objc_storeStrong((id *)&self->_demoContentPhotoLibraryTemplatePath, 0);
  objc_storeStrong((id *)&self->_demoContentStagingBasePath, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (PLPhotoLibraryPathManager)targetPhotoLibraryPathManager
{
  return self->_targetPhotoLibraryPathManager;
}

- (NSString)demoContentStagingBasePath
{
  return self->_demoContentStagingBasePath;
}

- (NSString)demoContentPhotoLibraryTemplatePath
{
  return self->_demoContentPhotoLibraryTemplatePath;
}

- (BOOL)cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  BOOL v7 = 0;
  BOOL v7 = [(PLDemoModeUtilities *)self _evalSystemSafetyCheck:&__block_literal_global_104_90116];
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __87__PLDemoModeUtilities_cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v2 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Starting legacy clean up for Store Demo Mode", buf, 2u);
    }

    if (([*(id *)(a1 + 32) options] & 2) != 0)
    {
      v3 = 0;
    }
    else
    {
      v3 = objc_alloc_init(PLPhotoLibraryOptions);
      [(PLPhotoLibraryOptions *)v3 setRequiredState:6];
      [(PLPhotoLibraryOptions *)v3 setAutomaticallyPinToFirstFetch:0];
    }
    uint64_t v4 = [*(id *)(a1 + 32) targetPhotoLibraryPathManager];
    v5 = [v4 libraryURL];
    id v17 = 0;
    id v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLDemoModeUtilities cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary]_block_invoke", v5, v3, &v17);
    id v7 = v17;

    if (v6)
    {

      v8 = (void *)MEMORY[0x19F38D3B0]();
      v9 = [v6 managedObjectContext];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __87__PLDemoModeUtilities_cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary__block_invoke_106;
      v13[3] = &unk_1E5875368;
      v13[4] = *(void *)(a1 + 32);
      v10 = v6;
      v14 = v10;
      id v15 = v9;
      uint64_t v16 = *(void *)(a1 + 40);
      id v11 = v9;
      [v11 performBlockAndWait:v13];

      goto LABEL_14;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    v12 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v7;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to cleanup demo library, unable to load photo library %{public}@", buf, 0xCu);
    }
  }
  v10 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Safety check failed: finalizeStoreDemoModeByRemovingNonDemoContentFromLibrary requires store demo mode", buf, 2u);
  }
LABEL_14:
}

void __87__PLDemoModeUtilities_cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary__block_invoke_106(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = [*(id *)(a1 + 32) fetchDemoContentResultsInLibrary:*(void *)(a1 + 40)];
  uint64_t v4 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 assetsToRevert];
    uint64_t v6 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v79 = v6;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Reverting %lu demo content assets that have adjustments", buf, 0xCu);
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v7 = [v3 assetsToRevert];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v73 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v72 + 1) + 8 * i) revertToOriginal];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v9);
  }

  v12 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v71 = 0;
  char v14 = [v12 safeSave:v13 error:&v71];
  id v15 = v71;
  if ((v14 & 1) == 0)
  {
    uint64_t v16 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v79 = (uint64_t)v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Save failed reverting assets %{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  id v17 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v3 assetIDsToDelete];
    uint64_t v19 = [v18 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v79 = v19;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Deleting %lu assets that are not demo content", buf, 0xCu);
  }
  uint64_t v20 = [v3 assetIDsToDelete];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = +[PLAssetTransactionReason transactionReason:@"[cleanupForStoreDemoMode] Deleting assets that are not demo content."];
    v23 = *(void **)(a1 + 40);
    v24 = (void *)MEMORY[0x1E4F28F60];
    v25 = [v3 assetIDsToDelete];
    v26 = [v24 predicateWithFormat:@"self IN %@", v25];
    id v70 = 0;
    char v27 = [v23 batchDeleteAssetsWithPredicate:v26 reason:v22 error:&v70];
    id v28 = v70;

    if ((v27 & 1) == 0)
    {
      v29 = PLStoreDemoModeGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v79 = (uint64_t)v28;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Error deleting non-demo assets %{public}@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  v30 = (void *)MEMORY[0x19F38D3B0]();
  v31 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Album"];
  v32 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"((kind = %d) OR (kind = %d)) AND (assets.@count = 0)", 2, 12);
  [v31 setPredicate:v32];

  v33 = *(void **)(a1 + 48);
  id v69 = 0;
  v34 = [v33 executeFetchRequest:v31 error:&v69];
  id v35 = v69;
  if (!v34)
  {
    v36 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v79 = (uint64_t)v35;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Fetching empty albums failed %{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  v37 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = [v34 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v79 = v38;
    _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Deleting %lu empty albums", buf, 0xCu);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v39 = v34;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(v39);
        }
        [*(id *)(*((void *)&v65 + 1) + 8 * j) delete];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v41);
  }

  v44 = *(void **)(a1 + 40);
  uint64_t v45 = *(void *)(a1 + 48);
  id v64 = 0;
  char v46 = [v44 safeSave:v45 error:&v64];
  id v47 = v64;
  if ((v46 & 1) == 0)
  {
    v48 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v79 = (uint64_t)v47;
      _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Save failed deleting albums %{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }

  v49 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Forcing refresh on image well", buf, 2u);
  }

  v50 = [*(id *)(a1 + 40) libraryServicesManager];
  v51 = [v50 cameraPreviewWellManager];
  [v51 refreshPreviewWellImageWithContext:*(void *)(a1 + 48) avoidNotificationIfLinkIsAlreadySet:0];

  v52 = [MEMORY[0x1E4F8B908] fileManager];
  v53 = [*(id *)(a1 + 40) pathManager];
  v54 = [v53 photoDirectoryWithType:28];

  v55 = [v54 stringByAppendingPathComponent:@"MISC"];
  v56 = [MEMORY[0x1E4F8B9E0] cameraRollPlistName];
  v57 = [v55 stringByAppendingPathComponent:v56];

  v58 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v79 = (uint64_t)v57;
    _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEFAULT, "Removing DCIM image naming plist %{public}@", buf, 0xCu);
  }

  id v63 = 0;
  char v59 = [v52 removeItemAtPath:v57 error:&v63];
  id v60 = v63;
  if ((v59 & 1) == 0)
  {
    v61 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v79 = (uint64_t)v60;
      _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_ERROR, "Failed to remove DCIM image naming plist %{public}@", buf, 0xCu);
    }
  }
  v62 = [v54 stringByAppendingPathComponent:@"Metadata/DCIM"];
  [v52 removeItemAtPath:v62 error:0];
}

- (id)fetchDemoContentResultsInLibrary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 managedObjectContext];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v6 = +[PLManagedAsset entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  LOWORD(v27) = 256;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F8BA10], "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, objc_msgSend(v3, "isCloudPhotoLibraryEnabled"), v27);
  uint64_t v9 = [MEMORY[0x1E4F8BA10] predicateForExcludeMask:v8 useIndex:0];
  [v7 setPredicate:v9];
  id v40 = 0;
  uint64_t v10 = [v4 executeFetchRequest:v7 error:&v40];
  id v11 = v40;
  v12 = v11;
  if (v10)
  {
    id v28 = v11;
    v30 = v9;
    v31 = v7;
    v32 = v4;
    id v33 = v3;
    id v35 = [MEMORY[0x1E4F1CA48] array];
    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v29 = v10;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      uint64_t v17 = *MEMORY[0x1E4F8C370];
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v20 = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v21 = [v19 mainFileURL];
          v22 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v21];
          *(_WORD *)buf = 0;
          [v22 getUInt16:buf forKey:v17];
          if (*(_WORD *)buf)
          {
            if ([v19 hasAdjustments]) {
              [v34 addObject:v19];
            }
          }
          else
          {
            v23 = [v19 objectID];
            [v35 addObject:v23];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v15);
    }

    v24 = objc_alloc_init(PLDemoContentResults);
    v25 = v35;
    [(PLDemoContentResults *)v24 setAssetIDsToDelete:v35];
    [(PLDemoContentResults *)v24 setAssetsToRevert:v34];

    uint64_t v4 = v32;
    id v3 = v33;
    uint64_t v9 = v30;
    id v7 = v31;
    v12 = v28;
    uint64_t v10 = v29;
  }
  else
  {
    v25 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v12;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Fetching demo assets failed %{public}@", buf, 0xCu);
    }
    v24 = 0;
  }

  return v24;
}

- (int64_t)markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v4 = [(PLDemoModeUtilities *)self targetPhotoLibraryPathManager];
  v5 = [v4 libraryURL];
  id v16 = 0;
  id v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLDemoModeUtilities markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent:]", v5, 0, &v16);
  id v7 = v16;

  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__PLDemoModeUtilities_markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent___block_invoke;
    v12[3] = &unk_1E58711C8;
    BOOL v15 = v3;
    id v13 = v6;
    uint64_t v14 = &v17;
    [v13 performBlockAndWait:v12];

    int64_t v8 = v18[3];
  }
  else
  {
    uint64_t v9 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = @"NO";
      if (v3) {
        uint64_t v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to update target library assets as demo content = %@, unable to load photo library %{public}@", buf, 0x16u);
    }

    int64_t v8 = -1;
    v18[3] = -1;
  }

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __81__PLDemoModeUtilities_markAssetOriginalsInTargetPhotoLibraryAsLegacyDemoContent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F8BA10] maskForStoreDemoContent];
  BOOL v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = +[PLManagedAsset assetsWithValidatedSavedAssetTypeMask:v2 inManagedObjectContext:v3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = *MEMORY[0x1E4F8C370];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x19F38D3B0](v6);
        id v13 = objc_msgSend(v11, "mainFileURL", (void)v15);
        uint64_t v14 = [MEMORY[0x1E4F8B900] filesystemPersistenceBatchItemForFileAtURL:v13];
        [v14 setUInt16:*(unsigned __int8 *)(a1 + 48) forKey:v9];
        [v14 persist];
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

        ++v10;
      }
      while (v7 != v10);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
}

- (void)kickstartStagedDemoContentInstallationByKillingAllClients
{
  BOOL v2 = [(PLDemoModeUtilities *)self _evalSystemSafetyCheck:&__block_literal_global_91_90177];
  BOOL v3 = PLStoreDemoModeGetLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Killing all connected photos clients to kickstart demo content installation.", buf, 2u);
    }

    uint64_t v4 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    [v4 setSqliteErrorForRebuildReason:3 allowsExit:1];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Safety check failed: kickstartStagedDemoContentInstallationByKillingAllClients requires store demo mode", v5, 2u);
  }
}

- (BOOL)prepareForStoreDemoModeByStagingDemoLibraryContentFromTemplate
{
  BOOL v2 = self;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  BOOL v11 = 0;
  BOOL v11 = [(PLDemoModeUtilities *)self _evalSystemSafetyCheck:&__block_literal_global_89_90182];
  BOOL v3 = [MEMORY[0x1E4F8B908] fileManager];
  uint64_t v4 = [(PLDemoModeUtilities *)v2 demoContentPhotoLibraryTemplatePath];
  id v6 = v3;
  id v7 = v4;
  PLSafeRunWithUnfairLock();
  LOBYTE(v2) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __85__PLDemoModeUtilities_prepareForStoreDemoModeByStagingDemoLibraryContentFromTemplate__block_invoke_2(uint64_t a1)
{
  v46[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    if ([*(id *)(a1 + 32) fileExistsAtPath:*(void *)(a1 + 40)])
    {
      BOOL v3 = PLStoreDemoModeGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v4;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Staging demo library content from template %{public}@", buf, 0xCu);
      }

      uint64_t v5 = [*(id *)(a1 + 48) demoContentPhotoLibraryStagingPath];
      [*(id *)(a1 + 48) demoContentPhotoLibraryPrestagingPath];
      uint64_t v31 = v30 = (void *)v5;
      v46[0] = v5;
      v46[1] = v31;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = 0;
        uint64_t v10 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v36 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            if ([*(id *)(a1 + 32) fileExistsAtPath:v12])
            {
              id v13 = PLStoreDemoModeGetLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v40 = v12;
                _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Removing demo library content from staging folder: %{public}@", buf, 0xCu);
              }

              uint64_t v14 = *(void **)(a1 + 32);
              id v34 = v9;
              char v15 = [v14 removeItemAtPath:v12 error:&v34];
              id v16 = v34;

              if ((v15 & 1) == 0)
              {
                long long v17 = PLStoreDemoModeGetLog();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v40 = v12;
                  __int16 v41 = 2114;
                  uint64_t v42 = (uint64_t)v16;
                  _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to remove demo library content from %{public}@: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v9 = v16;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v45 count:16];
        }
        while (v8);
      }
      else
      {
        uint64_t v9 = 0;
      }

      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      id v33 = v9;
      v22 = (void *)v31;
      char v23 = [v20 copyItemAtPath:v21 toPath:v31 error:&v33];
      id v24 = v33;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v23;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        uint64_t v25 = *(void **)(a1 + 32);
        v32 = v24;
        v26 = v30;
        char v27 = [v25 moveItemAtPath:v31 toPath:v30 error:&v32];
        long long v18 = v32;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v27;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
LABEL_33:

          goto LABEL_34;
        }
        id v28 = PLStoreDemoModeGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v40 = v31;
          __int16 v41 = 2114;
          uint64_t v42 = (uint64_t)v30;
          __int16 v43 = 2114;
          uint64_t v44 = v18;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to move demo library content from prestaging %{public}@ to staging folder %{public}@: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        id v28 = PLStoreDemoModeGetLog();
        v26 = v30;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v40 = v29;
          __int16 v41 = 2114;
          uint64_t v42 = v31;
          __int16 v43 = 2114;
          uint64_t v44 = v24;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to copy demo content from %{public}@ into pre-stage folder %{public}@: %{public}@", buf, 0x20u);
        }
        long long v18 = v24;
      }

      v22 = (void *)v31;
      goto LABEL_33;
    }
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v2 + 24) = 0;
  long long v18 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v40 = v19;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "No demo library content template found at %{public}@", buf, 0xCu);
  }
LABEL_34:
}

- (void)warmUpDemoLibraryInstalledFromStagedTemplate
{
  uint64_t v2 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Performing demo library post processing after installation [warmUpDemoLibraryInstalledFromStagedTemplate]", buf, 2u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  PLSafeRunWithUnfairLock();
}

void __67__PLDemoModeUtilities_warmUpDemoLibraryInstalledFromStagedTemplate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) targetPhotoLibraryPathManager];
  BOOL v3 = [v2 libraryURL];
  id v13 = 0;
  id v4 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLDemoModeUtilities warmUpDemoLibraryInstalledFromStagedTemplate]_block_invoke", v3, 0, &v13);
  id v5 = v13;

  if (v4)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    uint64_t v8 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = v7 - *(double *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      double v15 = v9;
      uint64_t v10 = "Successfully opened demo library in %2.2fs";
      BOOL v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v11, v12, v10, buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      double v15 = *(double *)&v5;
      uint64_t v10 = "Failed to open demo library %{public}@";
      BOOL v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }
}

- (BOOL)replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  [(PLDemoModeUtilities *)self _evalSystemSafetyCheck:&__block_literal_global_90195];
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __77__PLDemoModeUtilities_replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists__block_invoke_2(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  char v2 = [MEMORY[0x1E4F8B908] fileManager];
  BOOL v3 = [*(id *)(a1 + 32) demoContentPhotoLibraryStagingPath];
  v51 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 fileExistsAtPath:v3];
  }
  else
  {
    uint64_t v4 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) targetPhotoLibraryPathManager];
      uint64_t v6 = [*(id *)(a1 + 32) demoContentPhotoLibraryStagingPath];
      *(_DWORD *)buf = 138543618;
      long long v68 = v5;
      __int16 v69 = 2114;
      id v70 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "System does not allow installing staged demo photo library content. Ignoring request to replace target library %{public}@ with staged demo library %{public}@", buf, 0x16u);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v50 = a1;
    char v7 = [*(id *)(a1 + 32) targetPhotoLibraryPathManager];
    uint64_t v8 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      long long v68 = v7;
      __int16 v69 = 2112;
      id v70 = v3;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Overwriting target library %@ with staged demo library %@", buf, 0x16u);
    }

    double v9 = [v7 photoDirectoryWithType:4];
    v66[0] = v9;
    uint64_t v10 = [v7 photoDirectoryWithType:2];
    v66[1] = v10;
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];

    os_log_type_t v12 = [v7 iTunesPhotosDirectory];
    v65[0] = v12;
    v48 = v7;
    id v13 = [v7 photoStreamsDataDirectory];
    v65[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];

    v49 = v11;
    id v47 = (void *)v14;
    double v15 = [v11 arrayByAddingObjectsFromArray:v14];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(NSObject **)(*((void *)&v59 + 1) + 8 * i);
          if ([v2 fileExistsAtPath:v20])
          {
            id v58 = 0;
            char v21 = [v2 removeItemAtPath:v20 error:&v58];
            v22 = v58;
            if ((v21 & 1) == 0)
            {
              char v23 = PLStoreDemoModeGetLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                long long v68 = v20;
                __int16 v69 = 2114;
                id v70 = v22;
                _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to remove target photo library folder %{public}@: %{public}@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v17);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v24 = v15;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v63 count:16];
    v26 = v51;
    if (v25)
    {
      uint64_t v27 = v25;
      uint64_t v28 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v55 != v28) {
            objc_enumerationMutation(v24);
          }
          v30 = *(NSObject **)(*((void *)&v54 + 1) + 8 * j);
          uint64_t v31 = [v30 lastPathComponent];
          v32 = [v26 stringByAppendingPathComponent:v31];
          if ([v2 fileExistsAtPath:v32])
          {
            id v33 = PLStoreDemoModeGetLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              long long v68 = v32;
              _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Copying demo content from %{public}@...", buf, 0xCu);
            }

            id v53 = 0;
            char v34 = [v2 copyItemAtPath:v32 toPath:v30 error:&v53];
            long long v35 = v53;
            if ((v34 & 1) == 0)
            {
              long long v36 = PLStoreDemoModeGetLog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                long long v68 = v30;
                __int16 v69 = 2114;
                id v70 = v35;
                _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Error copying demo content to %{public}@ folder: %{public}@", buf, 0x16u);
              }
              goto LABEL_37;
            }
            goto LABEL_38;
          }
          if ([v49 containsObject:v30])
          {
            long long v36 = PLStoreDemoModeGetLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              long long v68 = v32;
              _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "No demo content exists for required folder %{public}@", buf, 0xCu);
            }
            long long v35 = 0;
LABEL_37:

            *(unsigned char *)(*(void *)(*(void *)(v50 + 40) + 8) + 24) = 0;
LABEL_38:
            v26 = v51;
            goto LABEL_40;
          }
          long long v35 = 0;
LABEL_40:
        }
        uint64_t v27 = [v24 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v27);
    }

    id v52 = 0;
    char v37 = [v2 removeItemAtPath:v26 error:&v52];
    long long v38 = v52;
    long long v39 = v48;
    if ((v37 & 1) == 0)
    {
      uint64_t v40 = PLStoreDemoModeGetLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        long long v68 = v51;
        __int16 v69 = 2114;
        id v70 = v38;
        _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Error removing staged demo content from %{public}@: %{public}@", buf, 0x16u);
      }
    }
    int v41 = *(unsigned __int8 *)(*(void *)(*(void *)(v50 + 40) + 8) + 24);
    uint64_t v42 = PLStoreDemoModeGetLog();
    __int16 v43 = v42;
    if (v41)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v44 = "Demo library content installation complete";
        uint64_t v45 = v43;
        os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
LABEL_53:
        _os_log_impl(&dword_19B3C7000, v45, v46, v44, buf, 2u);
      }
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v44 = "Demo library content installation failed";
      uint64_t v45 = v43;
      os_log_type_t v46 = OS_LOG_TYPE_ERROR;
      goto LABEL_53;
    }

    BOOL v3 = v51;
    goto LABEL_55;
  }
  long long v39 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "Staged demo content library does not exist, ignoring request to replace target library", buf, 2u);
  }
LABEL_55:
}

- (BOOL)_evalSystemSafetyCheck:(id)a3
{
  if (self->_options) {
    return 1;
  }
  else {
    return (*((uint64_t (**)(id))a3 + 2))(a3);
  }
}

- (PLDemoModeUtilities)initWithDemoContentTemplatePath:(id)a3 stagingBasePath:(id)a4 targetPhotoLibraryPathManager:(id)a5 options:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLDemoModeUtilities.m", 119, @"Invalid parameter not satisfying: %@", @"stagingBase" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PLDemoModeUtilities.m", 118, @"Invalid parameter not satisfying: %@", @"templatePath" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PLDemoModeUtilities.m", 120, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PLDemoModeUtilities;
  double v15 = [(PLDemoModeUtilities *)&v21 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_demoContentPhotoLibraryTemplatePath, a3);
    objc_storeStrong((id *)&v16->_demoContentStagingBasePath, a4);
    objc_storeStrong((id *)&v16->_targetPhotoLibraryPathManager, a5);
    v16->_options = a6;
  }

  return v16;
}

- (NSString)demoContentPhotoLibraryPrestagingPath
{
  char v2 = [(PLDemoModeUtilities *)self demoContentPhotoLibraryStagingPath];
  BOOL v3 = [v2 stringByAppendingString:@"-inprogress"];

  return (NSString *)v3;
}

- (NSString)demoContentPhotoLibraryStagingPath
{
  char v2 = [(PLDemoModeUtilities *)self demoContentStagingBasePath];
  BOOL v3 = [v2 stringByAppendingPathComponent:@"DemoPhotoLibrary_STAGED.photoslibrary"];

  return (NSString *)v3;
}

+ (id)newDemoModeUtilitiesWithDefaultSystemPaths
{
  BOOL v3 = [a1 systemDemoContentPhotoLibraryTemplatePath];
  uint64_t v4 = [a1 systemDemoContentStagingBasePath];
  id v5 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  uint64_t v6 = [[PLDemoModeUtilities alloc] initWithDemoContentTemplatePath:v3 stagingBasePath:v4 targetPhotoLibraryPathManager:v5 options:0];

  return v6;
}

+ (NSString)systemDemoContentStagingBasePath
{
  return (NSString *)@"/var/mobile/Library/Photos/Libraries";
}

+ (NSString)systemDemoContentPhotoLibraryTemplatePath
{
  return (NSString *)@"/var/mobile/Documents/DemoPhotoLibraryTemplate";
}

@end