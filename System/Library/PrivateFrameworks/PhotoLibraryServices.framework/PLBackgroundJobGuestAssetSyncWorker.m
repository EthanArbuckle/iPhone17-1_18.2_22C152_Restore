@interface PLBackgroundJobGuestAssetSyncWorker
+ (BOOL)_needsInitialSyncForSourceLibrary:(id)a3 targetLibrary:(id)a4;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (BOOL)usesMultipleLibrariesConcurrently;
- (BOOL)_batchResetGuestSavedAssetTypeInManagedObjectContext:(id)a3 error:(id *)a4;
- (BOOL)_batchResetSyndicationProcessingInManagedObjectContext:(id)a3 error:(id *)a4;
- (BOOL)_checkSyndicationPreferencesEnabledAndCleanupGuestAssetsIfNeededWithPhotoLibrary:(id)a3;
- (BOOL)_deleteAllGuestAssetsInPhotoLibrary:(id)a3 reason:(id)a4 error:(id *)a5;
- (BOOL)_resetSyndicationProcessingInSourceLibrary:(id)a3 error:(id *)a4;
- (BOOL)_safeIsCancelled;
- (BOOL)_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:(id)a3 targetLibrary:(id)a4;
- (BOOL)isInterruptible;
- (PLBackgroundJobGuestAssetSyncWorker)initWithLibraryBundle:(id)a3;
- (id)_lastGuestAssetSyncTargetLibraryURLFromSourceLibrary:(id)a3 targetLibrary:(id)a4;
- (id)_sourcePhotoLibraryWithName:(const char *)a3;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)_performWorkOnItem:(id)a3 inSystemPhotoLibrary:(id)a4 completion:(id)a5;
- (void)_updateLastGuestAssetSyncTargetLibraryURLInSourceLibrary:(id)a3 targetLibrary:(id)a4;
- (void)guestAssetSyncManager:(id)a3 isTransferingAsset:(id)a4 toLibrary:(id)a5 completion:(id)a6;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)stopWorkingOnItem:(id)a3;
@end

@implementation PLBackgroundJobGuestAssetSyncWorker

- (void).cxx_destruct
{
}

- (void)guestAssetSyncManager:(id)a3 isTransferingAsset:(id)a4 toLibrary:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  v11 = [v10 uuid];
  v12 = [v10 photoLibrary];

  v13 = [v12 libraryBundle];

  v14 = [v9 libraryBundle];

  id v15 = +[PLInterLibraryTransferOptions newTransferOptionsForAssetsFromSyndicationToSystem];
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__PLBackgroundJobGuestAssetSyncWorker_guestAssetSyncManager_isTransferingAsset_toLibrary_completion___block_invoke;
  v20[3] = &unk_1E58734E8;
  id v21 = v11;
  id v22 = v8;
  id v17 = v8;
  id v18 = v11;
  id v19 = (id)[v13 transferAssets:v16 toBundle:v14 options:v15 completion:v20];
}

void __101__PLBackgroundJobGuestAssetSyncWorker_guestAssetSyncManager_isTransferingAsset_toLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLSyndicationGetLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      id v17 = v3;
      v7 = "GuestAssetSync: _syncAsset %{public}@ failed with error %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v14, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v14 = 138543362;
    uint64_t v15 = v11;
    v7 = "GuestAssetSync: _syncAsset %{public}@ succeeded";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v12, v13);
}

- (BOOL)_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(PLBackgroundJobGuestAssetSyncWorker *)self _lastGuestAssetSyncTargetLibraryURLFromSourceLibrary:a3 targetLibrary:v6];
  id v8 = [v6 pathManager];
  os_log_type_t v9 = [v8 libraryURL];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [MEMORY[0x1E4F8B908] redactedDescriptionForFileURL:v7];
      uint64_t v13 = [v6 pathManager];
      int v15 = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: System photo library URL changed since last run %{public}@ -> %@", (uint8_t *)&v15, 0x16u);
    }
  }

  return v10 ^ 1;
}

- (void)_updateLastGuestAssetSyncTargetLibraryURLInSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 pathManager];
  id v9 = [v6 libraryURL];

  v7 = [v9 path];
  id v8 = [v5 globalValues];

  [v8 setLastGuestAssetSyncTargetLibraryPath:v7];
}

- (id)_lastGuestAssetSyncTargetLibraryURLFromSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 globalValues];
  id v8 = [v7 lastGuestAssetSyncTargetLibraryPath];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
  }
  else
  {
    char v10 = [v6 pathManager];
    id v9 = [v10 libraryURL];

    uint64_t v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v6 pathManager];
      int v16 = 138412290;
      __int16 v17 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "GuestAssetSync: last target library URL is nil, setting to %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v13 = [v9 path];
    int v14 = [v5 globalValues];
    [v14 setLastGuestAssetSyncTargetLibraryPath:v13];
  }
  return v9;
}

- (BOOL)_safeIsCancelled
{
  v2 = PLSafeResultWithUnfairLock();
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __55__PLBackgroundJobGuestAssetSyncWorker__safeIsCancelled__block_invoke(uint64_t a1)
{
  return [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 117)];
}

- (BOOL)_batchResetSyndicationProcessingInManagedObjectContext:(id)a3 error:(id *)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F1C038];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = +[PLMediaAnalysisAssetAttributes entity];
  id v9 = (void *)[v7 initWithEntity:v8];

  char v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"syndicationProcessingVersion", 0);
  [v9 setPredicate:v10];
  [v9 setResultType:2];
  v21[0] = @"syndicationProcessingVersion";
  v21[1] = @"syndicationProcessingValue";
  v22[0] = &unk_1EEBEE3A0;
  v22[1] = &unk_1EEBEE3A0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v9 setPropertiesToUpdate:v11];

  id v18 = 0;
  uint64_t v12 = [v6 executeRequest:v9 error:&v18];

  id v13 = v18;
  int v14 = PLSyndicationGetLog();
  int v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = [v12 result];
      *(_DWORD *)buf = 138412290;
      id v20 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "GuestAssetSync: Batch reset syndicationProcessing on %@ media analysis attributes", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "GuestAssetSync: Failed to batch reset syndicationProcessing on media analysis attributes: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v13;
    }
  }

  return v12 != 0;
}

- (BOOL)_batchResetGuestSavedAssetTypeInManagedObjectContext:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F1C038];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = +[PLManagedAsset entity];
  id v9 = (void *)[v7 initWithEntity:v8];

  char v10 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
  [v9 setPredicate:v10];
  [v9 setResultType:2];
  id v22 = @"savedAssetType";
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForInsertIntoSyndicationLibrary"));
  v23[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  [v9 setPropertiesToUpdate:v12];

  id v19 = 0;
  id v13 = [v6 executeRequest:v9 error:&v19];

  id v14 = v19;
  int v15 = PLSyndicationGetLog();
  int v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = [v13 result];
      *(_DWORD *)buf = 138412290;
      id v21 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "GuestAssetSync: Batch reset savedAssetType for %@ assets", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "GuestAssetSync: Failed to batch reset savedAssetType for assets: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v14;
    }
  }

  return v13 != 0;
}

- (BOOL)_resetSyndicationProcessingInSourceLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__36231;
  id v19 = __Block_byref_object_dispose__36232;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PLBackgroundJobGuestAssetSyncWorker__resetSyndicationProcessingInSourceLibrary_error___block_invoke;
  v11[3] = &unk_1E5874900;
  id v13 = &v21;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  id v14 = &v15;
  [v7 performTransactionAndWait:v11];
  id v8 = (void *)v16[5];
  if (v8 && a4) {
    *a4 = v8;
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __88__PLBackgroundJobGuestAssetSyncWorker__resetSyndicationProcessingInSourceLibrary_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v14 = 0;
  char v4 = [v2 _batchResetGuestSavedAssetTypeInManagedObjectContext:v3 error:&v14];
  id v5 = v14;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) managedObjectContext];
    id v13 = 0;
    char v8 = [v6 _batchResetSyndicationProcessingInManagedObjectContext:v7 error:&v13];
    id v9 = v13;
    id v10 = v13;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = v5;
    id v10 = *(id *)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
}

- (id)_sourcePhotoLibraryWithName:(const char *)a3
{
  char v4 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v5 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:3];
  id v6 = [v4 openBundleAtLibraryURL:v5];

  id v7 = [v6 libraryServicesManager];
  id v17 = 0;
  int v8 = [v7 activate:&v17];
  id v9 = v17;
  id v10 = v9;
  if (v8
    && (v9,
        id v16 = 0,
        int v11 = [v7 awaitLibraryState:7 error:&v16],
        id v10 = v16,
        v11))
  {
    id v12 = [v7 databaseContext];
    id v13 = (void *)[v12 newShortLivedLibraryWithName:a3];
  }
  else
  {
    id v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to provide source library for guest asset sync worker", v15, 2u);
    }
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_deleteAllGuestAssetsInPhotoLibrary:(id)a3 reason:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PLSyndicationGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: deleting all guest assets in library %@", buf, 0xCu);
  }

  id v10 = [v7 managedObjectContext];
  int v11 = [v7 pathManager];
  id v18 = 0;
  BOOL v12 = PLDeleteGuestAssetsInLibraryWithManagedObjectContext(v10, v11, v8, 0, &v18);

  id v13 = v18;
  if (v12)
  {
    id v14 = v13;
  }
  else
  {
    uint64_t v15 = PLSyndicationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "GuestAssetSync: failed to delete guest assets in library %@ error: %@", buf, 0x16u);
    }

    id v16 = v13;
    if (a5) {
      *a5 = v16;
    }
  }

  return v12;
}

- (BOOL)_checkSyndicationPreferencesEnabledAndCleanupGuestAssetsIfNeededWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = PLSyndicationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: checking syndication preferences...", v10, 2u);
  }

  char v6 = PLSyndicationPreferencesEnabled(0);
  if ((v6 & 1) == 0)
  {
    if (+[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:v4])
    {
      [(PLBackgroundJobGuestAssetSyncWorker *)self _deleteAllGuestAssetsInPhotoLibrary:v4 reason:@"Deleting all guest assets in SPL because syndication prefs are disabled" error:0];
    }
    else
    {
      id v7 = [v4 globalValues];
      [v7 setGuestAssetSyncStatus:0];

      id v8 = [v4 globalValues];
      [v8 setGuestAssetInitialSyncResumeMarker:0];
    }
  }

  return v6;
}

- (void)stopWorkingOnItem:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLSyndicationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "GuestAssetSync: PLBackgroundJobGuestAssetSyncWorker stopWorkingOnItem: %p", buf, 0xCu);
  }

  PLSafeRunWithUnfairLock();
}

uint64_t __57__PLBackgroundJobGuestAssetSyncWorker_stopWorkingOnItem___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 116)) {
    *(unsigned char *)(v1 + 117) = 1;
  }
  return result;
}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, id))a5;
  BOOL v12 = PLSyndicationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v37 = v9;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: PLBackgroundJobGuestAssetSyncWorker performWorkOnItem: %p %@", buf, 0x16u);
  }

  if (!v10)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLBackgroundJobGuestAssetSyncWorker.m", 236, @"Invalid parameter not satisfying: %@", @"library != nil" object file lineNumber description];
  }
  if ([(PLBackgroundJobWorker *)self hasEnoughDiskSpaceToContinue:v11])
  {
    id v13 = [(PLBackgroundJobWorker *)self libraryBundle];
    id v14 = [v13 libraryServicesManager];

    if (v14)
    {
      switch([v14 wellKnownPhotoLibraryIdentifier])
      {
        case 0:
          if (+[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:v10])
          {
            uint64_t v15 = [v10 managedObjectContext];
            if (v15)
            {
              id v16 = (void *)v15;
              id v31 = 0;
              [(PLBackgroundJobGuestAssetSyncWorker *)self _deleteAllGuestAssetsInPhotoLibrary:v10 reason:@"Guest asset sync worker on non-SPL library deleting guest assets" error:&v31];
              id v17 = v31;
            }
            else
            {
              v27 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v28 = *MEMORY[0x1E4F8C500];
              uint64_t v32 = *MEMORY[0x1E4F28228];
              v33 = @"MOC is nil during guest asset sync performWorkOnItem";
              v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
              id v17 = [v27 errorWithDomain:v28 code:41003 userInfo:v29];

              id v16 = 0;
            }
          }
          else
          {
            id v16 = [v10 globalValues];
            [v16 setGuestAssetSyncStatus:0];
            id v17 = 0;
          }

          v11[2](v11, v17);
          goto LABEL_17;
        case 1:
          [(PLBackgroundJobGuestAssetSyncWorker *)self _performWorkOnItem:v9 inSystemPhotoLibrary:v10 completion:v11];
          goto LABEL_17;
        case 2:
          id v22 = [MEMORY[0x1E4F28B00] currentHandler];
          id v20 = v22;
          uint64_t v23 = @"Guest asset sync worker should not run on messages photo library";
          SEL v24 = a2;
          v25 = self;
          uint64_t v26 = 253;
          goto LABEL_15;
        case 3:
          id v22 = [MEMORY[0x1E4F28B00] currentHandler];
          id v20 = v22;
          uint64_t v23 = @"Guest asset sync worker should not run on syndication photo library";
          SEL v24 = a2;
          v25 = self;
          uint64_t v26 = 250;
LABEL_15:
          [v22 handleFailureInMethod:v24 object:v25 file:@"PLBackgroundJobGuestAssetSyncWorker.m" lineNumber:v26 description:v23];
          goto LABEL_16;
        default:
          goto LABEL_17;
      }
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F8C500];
    uint64_t v34 = *MEMORY[0x1E4F28228];
    v35 = @"nil lsm";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    __int16 v21 = [v18 errorWithDomain:v19 code:46002 userInfo:v20];
    v11[2](v11, v21);

LABEL_16:
LABEL_17:
  }
}

- (void)_performWorkOnItem:(id)a3 inSystemPhotoLibrary:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if ([(PLBackgroundJobGuestAssetSyncWorker *)self _checkSyndicationPreferencesEnabledAndCleanupGuestAssetsIfNeededWithPhotoLibrary:v9])
  {
    int v11 = -[PLBackgroundJobGuestAssetSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobGuestAssetSyncWorker _performWorkOnItem:inSystemPhotoLibrary:completion:]");
    if (v11)
    {
      if ([(PLBackgroundJobGuestAssetSyncWorker *)self _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:v11 targetLibrary:v9])
      {
        id v26 = 0;
        BOOL v12 = [(PLBackgroundJobGuestAssetSyncWorker *)self _resetSyndicationProcessingInSourceLibrary:v11 error:&v26];
        id v13 = v26;
        if (!v12)
        {
          v10[2](v10, v13);
          goto LABEL_20;
        }
        [(PLBackgroundJobGuestAssetSyncWorker *)self _updateLastGuestAssetSyncTargetLibraryURLInSourceLibrary:v11 targetLibrary:v9];
      }
      if ([(id)objc_opt_class() _needsInitialSyncForSourceLibrary:v11 targetLibrary:v9])
      {
        id v14 = PLSyndicationGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Performing initial guest asset sync", buf, 2u);
        }

        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        uint64_t v23 = __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke;
        SEL v24 = &unk_1E5875CE0;
        v25 = self;
        PLSafeRunWithUnfairLock();
        manager = self->_manager;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke_2;
        v19[3] = &unk_1E5874950;
        v19[4] = self;
        id v20 = v10;
        [(PLGuestAssetSyncEngine *)manager performInitialSyncWithSourceLibrary:v11 targetLibrary:v9 completion:v19];

        goto LABEL_21;
      }
      if ([v8 type] == 2)
      {
        id v18 = self->_manager;
        id v13 = [v8 objectID];
        [(PLGuestAssetSyncEngine *)v18 processWorkItemObjectID:v13 sourceLibrary:v11 targetLibrary:v9 completion:v10];
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      id v17 = PLSyndicationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v28 = v8;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "GuestAssetSync: No work for item %p: sourceLibrary is nil", buf, 0xCu);
      }
    }
    v10[2](v10, 0);
LABEL_21:

    goto LABEL_22;
  }
  id v16 = PLSyndicationGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v28 = v8;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "GuestAssetSync: No work for item %p: syndication preference is disabled", buf, 0xCu);
  }

  v10[2](v10, 0);
LABEL_22:
}

uint64_t __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 116) = 1;
  return result;
}

void __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  PLSafeRunWithUnfairLock();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 117) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 116) = 0;
  return result;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLBackgroundJobCriteria criteriaForHubbleWorker];
  id v6 = [(PLBackgroundJobWorker *)self libraryBundle];
  uint64_t v7 = [v6 libraryServicesManager];

  if (v7 && ![v7 wellKnownPhotoLibraryIdentifier])
  {
    BOOL v18 = +[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:v4];
    id v14 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    if (v18)
    {
      uint64_t v15 = +[PLBackgroundJobGuestAssetSyncWorkItemContainer libraryOrPreferencesChangedWorkItem];
      v45[0] = v15;
      id v16 = (void *)MEMORY[0x1E4F1C978];
      id v17 = (void **)v45;
      goto LABEL_10;
    }
LABEL_11:
    id v20 = [(PLBackgroundJobWorkerPendingWorkItems *)v14 initWithZeroWorkItems];
    goto LABEL_31;
  }
  if ((PLSyndicationPreferencesEnabled(1) & 1) == 0)
  {
    BOOL v13 = +[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:v4];
    id v14 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    if (v13)
    {
      uint64_t v15 = +[PLBackgroundJobGuestAssetSyncWorkItemContainer libraryOrPreferencesChangedWorkItem];
      v44 = v15;
      id v16 = (void *)MEMORY[0x1E4F1C978];
      id v17 = &v44;
LABEL_10:
      uint64_t v19 = [v16 arrayWithObjects:v17 count:1];
      id v20 = [(PLBackgroundJobWorkerPendingWorkItems *)v14 initWithCriteria:v5 workItemsNeedingProcessing:v19];

      goto LABEL_31;
    }
    goto LABEL_11;
  }
  id v8 = -[PLBackgroundJobGuestAssetSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobGuestAssetSyncWorker workItemsNeedingProcessingInLibrary:]");
  if ([(PLBackgroundJobGuestAssetSyncWorker *)self _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:v8 targetLibrary:v4])
  {
    id v9 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    id v10 = +[PLBackgroundJobGuestAssetSyncWorkItemContainer libraryOrPreferencesChangedWorkItem];
    id v43 = v10;
    int v11 = (void *)MEMORY[0x1E4F1C978];
    BOOL v12 = &v43;
  }
  else
  {
    if (![(id)objc_opt_class() _needsInitialSyncForSourceLibrary:v8 targetLibrary:v4])
    {
      manager = self->_manager;
      id v38 = 0;
      uint64_t v21 = [(PLGuestAssetSyncEngine *)manager workItemObjectIDsInLibrary:v8 error:&v38];
      id v10 = v38;
      if (!v21)
      {
        uint64_t v23 = PLSyndicationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v10;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to fetch work items needed, error: %@", buf, 0xCu);
        }
      }
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v21 count])
      {
        id v32 = v10;
        v33 = v5;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v25 = v21;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v35 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = +[PLBackgroundJobGuestAssetSyncWorkItemContainer persistedJobWorkItemWithObjectID:*(void *)(*((void *)&v34 + 1) + 8 * i)];
              [v24 addObject:v30];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v27);
        }

        id v5 = v33;
        id v20 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithCriteria:v33 workItemsNeedingProcessing:v24];
        id v10 = v32;
      }
      else
      {
        id v20 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
      }

      goto LABEL_30;
    }
    id v9 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    id v10 = +[PLBackgroundJobGuestAssetSyncWorkItemContainer initialSyncWorkItem];
    id v42 = v10;
    int v11 = (void *)MEMORY[0x1E4F1C978];
    BOOL v12 = &v42;
  }
  uint64_t v21 = [v11 arrayWithObjects:v12 count:1];
  id v20 = [(PLBackgroundJobWorkerPendingWorkItems *)v9 initWithCriteria:v5 workItemsNeedingProcessing:v21];
LABEL_30:

LABEL_31:
  return v20;
}

- (PLBackgroundJobGuestAssetSyncWorker)initWithLibraryBundle:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLBackgroundJobGuestAssetSyncWorker;
  id v3 = [(PLBackgroundJobWorker *)&v8 initWithLibraryBundle:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_lock._os_unfair_lock_opaque = 0;
    id v5 = [[PLGuestAssetSyncEngine alloc] initWithDelegate:v3];
    manager = v4->_manager;
    v4->_manager = v5;
  }
  return v4;
}

+ (BOOL)_needsInitialSyncForSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 globalValues];
  uint64_t v7 = [v6 guestAssetSyncStatus];
  if (v7)
  {
    objc_super v8 = [v5 globalValues];
    id v9 = [v8 guestAssetSyncStatus];
    if (v9)
    {
      id v10 = [v5 globalValues];
      int v11 = [v10 guestAssetSyncStatus];
      BOOL v12 = ([v11 integerValue] & 4) == 0;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

+ (BOOL)usesMultipleLibrariesConcurrently
{
  return 1;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

@end