@interface PLManagedAssetRecoveryManager
+ (id)_assetsWithJPGFilenameAndRawPrimaryImageResourcePredicate;
+ (id)_imagesWithZeroWidthHeightPredicate;
+ (id)_irisesWithZeroVideoCpDuration;
+ (id)_predicateForAdjustedAssetsFailedDeferredRendering;
+ (id)_predicateForAdjustedAssetsWithMissingResources;
- (BOOL)_fixIrisWithZeroVideoComplementDuration:(id)a3 usingExistingVideoComplementAtPath:(id)a4 error:(id *)a5;
- (BOOL)_fixRawUTIForAsset:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)workQueue;
- (PLManagedAssetRecoveryManager)initWithLibraryServicesManager:(id)a3;
- (id)_loadObjectWithObjectID:(id)a3 managedObjectContext:(id)a4;
- (id)_newPhotoLibraryWithName:(const char *)a3 nonSyncable:(BOOL)a4;
- (id)_recoveryStatesToProcessForAttributes:(id)a3;
- (int64_t)state;
- (void)_downloadResources:(id)a3 forAsset:(id)a4 usingCloudPhotoLibraryManager:(id)a5 completionHandler:(id)a6;
- (void)_fixDimensionsForAsset:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5;
- (void)_fixIrisWithZeroVideoComplementDuration:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5;
- (void)_fixMissingFullSizeAdjustedResources:(id)a3 cloudPhotoLibraryManager:(id)a4 recoveryState:(unint64_t)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7;
- (void)_fixOriginalAssetDimensionsForAsset:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5;
- (void)_generateMissingFullSizeAdjustedResourcesForAsset:(id)a3 recipesToGenerate:(id)a4 cloudPhotoLibraryManager:(id)a5 recoveryState:(unint64_t)a6 usingSyncableLibrary:(id)a7 completionBlock:(id)a8;
- (void)_performAssetRecoveryTaskForInconsistentState:(id)a3 state:(unint64_t)a4 cloudPhotoLibraryManager:(id)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7;
- (void)_performTransactionOnLibrary:(id)a3 withObjectID:(id)a4 usingBlock:(id)a5 completionBlock:(id)a6;
- (void)_recoverNextAssetWithEnumerator:(id)a3 cloudPhotoLibraryManager:(id)a4 transaction:(id)a5 usingNonSyncableLibrary:(id)a6 andSyncableLibrary:(id)a7;
- (void)_recoverNextRecoveryState:(id)a3 forAsset:(id)a4 cloudPhotoLibraryManager:(id)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7;
- (void)_setCloudRecoveryState:(unint64_t)a3 forAssetsWithFetchRequestPredicate:(id)a4 resultsFilterPredicate:(id)a5 usingNonSyncableLibrary:(id)a6;
- (void)_startRecoveryUsingCloudPhotoLibraryManager:(id)a3 transaction:(id)a4;
- (void)identifyAssetsWithInconsistentCloudState;
- (void)setState:(int64_t)a3;
- (void)setWorkQueue:(id)a3;
- (void)startRecoveryUsingCloudPhotoLibraryManager:(id)a3 transaction:(id)a4 shouldIdentifyInconsistentAssets:(BOOL)a5;
@end

@implementation PLManagedAssetRecoveryManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_videoClient, 0);
  objc_storeStrong((id *)&self->_imageClient, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
  objc_storeStrong((id *)&self->_recoveryErrors, 0);
  objc_storeStrong((id *)&self->_volumeInfo, 0);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_generateMissingFullSizeAdjustedResourcesForAsset:(id)a3 recipesToGenerate:(id)a4 cloudPhotoLibraryManager:(id)a5 recoveryState:(unint64_t)a6 usingSyncableLibrary:(id)a7 completionBlock:(id)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v38 = a5;
  id v15 = a7;
  id v36 = a8;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v48 + 1) + 8 * i) chooseIngredientsFrom:v13 version:2];
        if (v22) {
          [v16 addEntriesFromDictionary:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v19);
  }
  v23 = v15;

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke;
  v46[3] = &unk_1E586D658;
  id v47 = v24;
  id v35 = v24;
  [v16 enumerateKeysAndObjectsUsingBlock:v46];
  v25 = [v13 objectID];
  v26 = [v13 uuid];
  v27 = PLBackendGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [v16 allKeys];
    *(_DWORD *)buf = 138543874;
    v53 = v28;
    __int16 v54 = 2114;
    id v55 = v17;
    __int16 v56 = 2114;
    v57 = v26;
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Attempting to download non-locally available ingredients: %{public}@ for missing recipes: %{public}@ for asset: %{public}@", buf, 0x20u);
  }
  if (a6 == 0x40000000)
  {
    id v29 = v15;
  }
  else
  {
    id v29 = [v13 photoLibrary];
  }
  v30 = v29;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_235;
  v39[3] = &unk_1E586D6A8;
  id v40 = v29;
  v41 = self;
  id v42 = v25;
  id v43 = v26;
  id v44 = v36;
  unint64_t v45 = a6;
  id v31 = v36;
  id v32 = v26;
  id v33 = v25;
  id v34 = v30;
  [(PLManagedAssetRecoveryManager *)self _downloadResources:v35 forAsset:v13 usingCloudPhotoLibraryManager:v38 completionHandler:v39];
}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((int)[v4 localAvailability] <= 0 && objc_msgSend(v4, "cplType")) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_235(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2;
    v10[3] = &unk_1E586D680;
    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v7;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 72);
    id v12 = v8;
    uint64_t v16 = v9;
    id v13 = *(id *)(a1 + 56);
    id v15 = &v17;
    id v14 = *(id *)(a1 + 64);
    [v6 performBlockAndWait:v10];
    if (*((unsigned char *)v18 + 24)) {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  id v5 = [v2 _loadObjectWithObjectID:v3 managedObjectContext:v4];

  if (!v5)
  {
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v12;
      id v13 = "Skipping resource generation for deleted asset: %{public}@";
LABEL_11:
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    }
LABEL_12:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    goto LABEL_13;
  }
  v6 = @"Recovery resource generation for missing full size resources for asset: %@";
  if (*(void *)(a1 + 80) == 0x40000000)
  {
    if ([v5 deferredProcessingNeeded] == 9)
    {
      if (*(void *)(a1 + 80) == 0x40000000) {
        v6 = @"Recovery resource generation for deferred repair adjustment failure for asset: %@";
      }
      goto LABEL_6;
    }
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v14;
      id v13 = "Deferred processing state no longer AdjustmentFailure, skipping repair for asset: %{public}@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_6:
  v7 = objc_msgSend(NSString, "stringWithFormat:", v6, *(void *)(a1 + 56));
  id v8 = [*(id *)(*(void *)(a1 + 32) + 64) objectValue];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 72) objectValue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_242;
  v15[3] = &unk_1E5875C20;
  v15[4] = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v10 = (id)[v5 generateDeferredAdjustmentWithImageConversionClient:v8 videoConversionClient:v9 reason:v7 allowCancellationByService:0 completion:v15];

LABEL_13:
}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_242(id *a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = [a1[4] workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2_243;
  v8[3] = &unk_1E5873CA8;
  char v12 = a2;
  id v9 = v5;
  id v10 = a1[5];
  id v11 = a1[6];
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2_243(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) || PLIsErrorEqualToCode())
  {
    v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Finished generating full size render resources for asset: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v5();
  }
}

- (void)_fixMissingFullSizeAdjustedResources:(id)a3 cloudPhotoLibraryManager:(id)a4 recoveryState:(unint64_t)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (!v15)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PLManagedAssetRecoveryManager.m", 824, @"Invalid parameter not satisfying: %@", @"syncableLibrary" object file lineNumber description];
  }
  id v17 = [v13 uuid];
  if (a5 == 0x40000000)
  {
    if ([v13 deferredProcessingNeeded] == 9)
    {
      id v60 = 0;
      char v18 = [v13 renderableAdjustmentDictionary:0 error:&v60];
      id v19 = v60;
      if (v18)
      {
        uint64_t v20 = PLBackendGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v62 = v17;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Generating un-rendered deferred adjustment resources for asset: %{public}@", buf, 0xCu);
        }

        v21 = +[PLResourceGenerator expectedLocalResourceRecipesForAsset:v13 versions:&unk_1EEBF2030];
        if ([v21 count])
        {
          id v41 = v19;
          v22 = v17;
          v23 = [v21 array];
          uint64_t v24 = objc_msgSend(v23, "_pl_map:", &__block_literal_global_212_65823);

          v25 = [v13 persistedAdjustedResources];
          id v40 = (void *)v24;
          v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %d AND %K IN %@", @"remoteAvailability", 1, @"recipeID", v24];
          v27 = [v25 filteredSetUsingPredicate:v26];

          uint64_t v28 = [v27 count];
          if (v28 == [v21 count])
          {
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2;
            v46[3] = &unk_1E586D630;
            void v46[4] = self;
            id v47 = v13;
            id v48 = v27;
            id v49 = v22;
            id v50 = v15;
            id v53 = v16;
            id v51 = v21;
            id v52 = v14;
            uint64_t v54 = 0x40000000;
            [v52 fetchResourcesForAsset:v47 completionHandler:v46];
          }
          else
          {
            [(PLManagedAssetRecoveryManager *)self _generateMissingFullSizeAdjustedResourcesForAsset:v13 recipesToGenerate:v21 cloudPhotoLibraryManager:v14 recoveryState:0x40000000 usingSyncableLibrary:v15 completionBlock:v16];
          }

          id v17 = v22;
          id v38 = v40;
          id v19 = v41;
        }
        else
        {
          v37 = [v13 objectID];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_231;
          v44[3] = &unk_1E586D5E0;
          id v45 = v17;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_232;
          v42[3] = &unk_1E5875198;
          id v43 = v16;
          [(PLManagedAssetRecoveryManager *)self _performTransactionOnLibrary:v15 withObjectID:v37 usingBlock:v44 completionBlock:v42];

          id v38 = v45;
        }
      }
      else
      {
        id v36 = [v13 objectID];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke;
        v57[3] = &unk_1E586D598;
        id v58 = v17;
        id v59 = v19;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_207;
        v55[3] = &unk_1E5875198;
        id v56 = v16;
        [(PLManagedAssetRecoveryManager *)self _performTransactionOnLibrary:v15 withObjectID:v36 usingBlock:v57 completionBlock:v55];

        v21 = v58;
      }
    }
    else
    {
      id v34 = PLBackendGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v17;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Deferred processing state no longer AdjustmentFailure, skipping repair for asset: %{public}@", buf, 0xCu);
      }

      (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 1, 0);
    }
  }
  else
  {
    id v29 = v14;
    v30 = PLBackendGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v17;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Generating missing full size render resources for asset: %{public}@", buf, 0xCu);
    }

    id v31 = +[PLResourceGenerator expectedLocalResourceRecipesForAsset:v13 versions:&unk_1EEBF2030];
    id v32 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEBF2030];
    id v33 = +[PLResourceGenerator locallyUnavailableRecipesFromRecipes:v31 versions:v32 asset:v13];

    if ([v33 count])
    {
      id v14 = v29;
      [(PLManagedAssetRecoveryManager *)self _generateMissingFullSizeAdjustedResourcesForAsset:v13 recipesToGenerate:v33 cloudPhotoLibraryManager:v29 recoveryState:a5 usingSyncableLibrary:v15 completionBlock:v16];
    }
    else
    {
      id v35 = PLBackendGetLog();
      id v14 = v29;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v17;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "No non-local recipes to generate, skipping repair for asset: %{public}@", buf, 0xCu);
      }

      (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 1, 0);
    }
  }
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Resetting deferredProcessingNeeded to None for asset %{public}@ because the adjustment isn't supported, error: %@ ", (uint8_t *)&v7, 0x16u);
  }

  [v3 setDeferredProcessingNeeded:0];
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_207(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_3;
  block[3] = &unk_1E586D608;
  id v15 = *(id *)(a1 + 40);
  id v16 = v5;
  id v17 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v18 = v8;
  uint64_t v19 = v9;
  id v20 = *(id *)(a1 + 64);
  id v24 = *(id *)(a1 + 88);
  id v21 = v6;
  id v22 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 96);
  id v23 = v10;
  uint64_t v25 = v11;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v7, block);
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_231(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Resetting deferredProcessingNeeded to None for asset %{public}@ because there are no required adjusted recipes for this asset", (uint8_t *)&v6, 0xCu);
  }

  [v3 setDeferredProcessingNeeded:0];
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_232(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_4;
  v8[3] = &unk_1E586D608;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 72);
  id v11 = v3;
  uint64_t v12 = v4;
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 104);
  id v15 = *(id *)(a1 + 80);
  id v16 = *(id *)(a1 + 88);
  id v6 = *(id *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 112);
  id v17 = v6;
  uint64_t v19 = v7;
  [v2 performBlockAndWait:v8];
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v27 = 0;
    uint64_t v4 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v33 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"dataStoreSubtype", objc_msgSend(v6, "resourceType"));
        id v9 = [v7 filteredSetUsingPredicate:v8];
        id v10 = [v9 anyObject];

        if (v10)
        {
          id v11 = [v10 fingerprint];
          uint64_t v12 = [v6 identity];
          id v13 = [v12 fingerPrint];
          int v14 = [v11 isEqualToString:v13];

          if (v14)
          {
            ++v27;
          }
          else
          {
            id v15 = PLBackendGetLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = [v10 fingerprint];
              id v17 = [v6 identity];
              id v18 = [v17 fingerPrint];
              uint64_t v19 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              v37 = v16;
              __int16 v38 = 2114;
              v39 = v18;
              __int16 v40 = 2114;
              uint64_t v41 = v19;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Adjusted resource fingerprint %{public}@ does not match CPL resource fingerprint %{public}@ for asset %{public}@, generating instead", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v27 = 0;
  }

  if (v27 == [*(id *)(a1 + 40) count])
  {
    id v20 = *(void **)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 64);
    id v22 = [*(id *)(a1 + 72) objectID];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_228;
    v30[3] = &unk_1E586D5E0;
    id v31 = *(id *)(a1 + 48);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_229;
    v28[3] = &unk_1E5875198;
    id v29 = *(id *)(a1 + 104);
    [v20 _performTransactionOnLibrary:v21 withObjectID:v22 usingBlock:v30 completionBlock:v28];
  }
  else
  {
    if (!*(void *)(a1 + 32))
    {
      id v23 = PLBackendGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = *(void **)(a1 + 48);
        uint64_t v25 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138543618;
        v37 = v24;
        __int16 v38 = 2112;
        v39 = v25;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Error fetching CPL resources for asset %{public}@, generating instead, error: %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 56) _generateMissingFullSizeAdjustedResourcesForAsset:*(void *)(a1 + 72) recipesToGenerate:*(void *)(a1 + 88) cloudPhotoLibraryManager:*(void *)(a1 + 96) recoveryState:*(void *)(a1 + 112) usingSyncableLibrary:*(void *)(a1 + 64) completionBlock:*(void *)(a1 + 104)];
  }
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_228(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Resetting deferredProcessingNeeded to None for asset %{public}@ because all required full size renders are available for download from CPL", (uint8_t *)&v6, 0xCu);
  }

  [v3 setDeferredProcessingNeeded:0];
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_209(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 recipeID];
  return [v2 numberWithUnsignedInt:v3];
}

- (void)_performTransactionOnLibrary:(id)a3 withObjectID:(id)a4 usingBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(PLManagedAssetRecoveryManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke;
  block[3] = &unk_1E586D570;
  id v20 = v10;
  uint64_t v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke_2;
  v8[3] = &unk_1E58710F0;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 56);
  [v2 performTransactionAndWait:v8];
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v4, v5, v6, v7);
}

void __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v5 = [v2 _loadObjectWithObjectID:v3 managedObjectContext:v4];

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Not performing recovery manager transaction on deleted object: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)_fixIrisWithZeroVideoComplementDuration:(id)a3 usingExistingVideoComplementAtPath:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
  uint64_t v10 = [v7 uuid];
  id v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Getting live photo photo metadata: %{public}@ url: %{public}@", buf, 0x16u);
  }

  id v24 = 0;
  uint64_t v12 = *MEMORY[0x1E4F1C5F8];
  id v23 = 0;
  int v13 = [v9 getResourceValue:&v24 forKey:v12 error:&v23];
  id v14 = v24;
  id v15 = v23;
  if (v13)
  {
    id v16 = PFVideoComplementMetadataForVideoAtPath();
    id v17 = [v16 pairingIdentifier];
    if (v16)
    {
      [v16 videoDuration];
      [v16 imageDisplayTime];
    }
    else
    {
      memset(v22, 0, sizeof(v22));
      memset(v21, 0, sizeof(v21));
    }
    [v7 updatePhotoIrisMetadataWithMediaGroupUUID:v17 videoDuration:v22 stillDisplayTime:v21];

    [v7 persistMetadataToFilesystem];
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Live photo metadata is fixed using the attributes of the original video complement: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to read the file size of the video complement: %{public}@ %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v15;
    }
  }

  return v13;
}

- (void)_fixIrisWithZeroVideoComplementDuration:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL, id))a5;
  id v11 = [v8 uuid];
  uint64_t v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v34 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Fixing live photo with zero length videoCpDurationValue for asset: %{public}@", buf, 0xCu);
  }

  int v13 = [v8 masterResourceForCPLType:18];
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 cplFileURL];
    id v16 = [v15 path];

    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v18 = [v17 fileExistsAtPath:v16];

    uint64_t v19 = PLBackendGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138543362;
        long long v34 = v11;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Fixing video complement locally for asset: %{public}@", buf, 0xCu);
      }

      id v25 = 0;
      BOOL v21 = [(PLManagedAssetRecoveryManager *)self _fixIrisWithZeroVideoComplementDuration:v8 usingExistingVideoComplementAtPath:v16 error:&v25];
      id v22 = v25;
      v10[2](v10, v21, v22);
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138543362;
        long long v34 = v11;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Downloading original video complement for asset: %{public}@", buf, 0xCu);
      }

      long long v32 = v14;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke;
      v26[3] = &unk_1E586D548;
      id v27 = v8;
      id v28 = v11;
      uint64_t v29 = self;
      id v30 = v16;
      id v31 = v10;
      [(PLManagedAssetRecoveryManager *)self _downloadResources:v24 forAsset:v27 usingCloudPhotoLibraryManager:v9 completionHandler:v26];

      id v22 = v27;
    }
  }
  else
  {
    id v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v34 = v11;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Original video complement cloud resource is not available for asset: %{public}@", buf, 0xCu);
    }

    v10[2](v10, 0, 0);
  }
}

void __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v22 = __Block_byref_object_copy__65871;
    id v23 = __Block_byref_object_dispose__65872;
    id v24 = 0;
    uint64_t v6 = [*(id *)(a1 + 32) photoLibrary];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke_2;
    v11[3] = &unk_1E5875AE0;
    id v7 = *(id *)(a1 + 40);
    id v17 = v19;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = v7;
    uint64_t v13 = v8;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    char v18 = buf;
    id v16 = *(id *)(a1 + 64);
    [v6 performBlockAndWait:v11];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v19, 8);
  }
  else
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to download original video complement for asset: %{public}@ with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke_2(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded original video complement for asset: %{public}@", buf, 0xCu);
  }

  uint64_t v4 = (void *)a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v7 = *(void *)(a1[10] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v4 _fixIrisWithZeroVideoComplementDuration:v5 usingExistingVideoComplementAtPath:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v8;
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (BOOL)_fixRawUTIForAsset:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  uint64_t v6 = [v4 uniformTypeIdentifier];
  uint64_t v7 = +[PLManagedAsset preferredFileExtensionForType:v6];

  char v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 filename];
    uint64_t v10 = [v9 pathExtension];
    *(_DWORD *)buf = 138543874;
    id v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    BOOL v21 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Fixing wrong file extension for RAW asset: %{public}@. Changing extension from %{public}@ to %{public}@", buf, 0x20u);
  }
  id v11 = NSString;
  uint64_t v12 = [v4 filename];
  uint64_t v13 = [v12 stringByDeletingPathExtension];
  id v14 = [v11 stringWithFormat:@"%@.%@", v13, v7];
  [v4 setFilename:v14];

  return 1;
}

- (void)_fixOriginalAssetDimensionsForAsset:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 uuid];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke;
  v33[3] = &unk_1E5875C20;
  id v12 = v8;
  id v34 = v12;
  id v13 = v11;
  id v35 = v13;
  id v36 = v10;
  id v14 = (void (**)(void, void, void))MEMORY[0x19F38D650](v33);
  id v15 = [v12 imageProperties];
  if (v15)
  {
    [v12 setOriginalSizeAndOrientationFromImageProperties:v15];
    v14[2](v14, 1, 0);
  }
  else
  {
    id v16 = [v12 masterResourceForCPLType:1];
    id v17 = v16;
    if (v16)
    {
      uint64_t v18 = [v16 unorientedWidth];
      uint64_t v19 = [v17 unorientedHeight];
      if (v18 && (uint64_t v20 = v19) != 0)
      {
        [v12 setOriginalWidth:v18];
        [v12 setOriginalHeight:v20];
        v14[2](v14, 1, 0);
      }
      else if ([v17 isLocallyAvailable] {
             && ([v17 fileURL], uint64_t v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
      }
      {
        id v23 = [v17 fileURL];
        +[PLManagedAsset sizeOfImageAtURL:v23 outOrientation:0];
        double v25 = v24;
        [v12 setOriginalWidth:(uint64_t)v26];
        [v12 setOriginalHeight:(uint64_t)v25];
        v14[2](v14, 1, 0);
      }
      else
      {
        v39[0] = v17;
        id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_184;
        v28[3] = &unk_1E586D520;
        id v29 = v12;
        id v30 = v17;
        long long v32 = v14;
        id v31 = v13;
        [(PLManagedAssetRecoveryManager *)self _downloadResources:v27 forAsset:v29 usingCloudPhotoLibraryManager:v9 completionHandler:v28];
      }
    }
    else
    {
      BOOL v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v38 = v13;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Original cloud resource is not available for asset: %{public}@", buf, 0xCu);
      }

      v14[2](v14, 0, 0);
    }
  }
}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [a1[4] photoLibrary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2;
  v11[3] = &unk_1E5875340;
  id v14 = v15;
  id v12 = a1[4];
  id v13 = a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_183;
  v7[3] = &unk_1E58753C0;
  id v9 = a1[6];
  id v10 = v15;
  id v6 = v4;
  id v8 = v6;
  [v5 performTransactionAndWait:v11 completionHandler:v7];

  _Block_object_dispose(v15, 8);
}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_184(id *a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a1[4] photoLibrary];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3;
    v9[3] = &unk_1E5874818;
    id v10 = a1[5];
    id v11 = a1[4];
    id v14 = a1[7];
    id v12 = a1[6];
    id v13 = v5;
    [v6 performBlockAndWait:v9];
  }
  else
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = a1[6];
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to download original CPL resource for asset: %{public}@ error: %@", buf, 0x16u);
    }

    (*((void (**)(void))a1[7] + 2))();
  }
}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplFileURL];
  if (v2)
  {
    +[PLManagedAsset sizeOfImageAtURL:v2 outOrientation:0];
    double v4 = v3;
    [*(id *)(a1 + 40) setOriginalWidth:(uint64_t)v5];
    [*(id *)(a1 + 40) setOriginalHeight:(uint64_t)v4];
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to download original CPL resource for asset: %{public}@ error: %@", (uint8_t *)&v10, 0x16u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v6();
}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) originalWidth]) {
    BOOL v2 = [*(id *)(a1 + 32) originalHeight] != 0;
  }
  else {
    BOOL v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v4 = PLBackendGetLog();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 138543362;
      uint64_t v12 = v6;
      uint64_t v7 = "Fixed original image dimensions for the asset: %{public}@";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138543362;
    uint64_t v12 = v10;
    uint64_t v7 = "Failed to fix original image dimensions for the asset: %{public}@";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_9;
  }
}

uint64_t __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_183(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), a1[4]);
}

- (void)_fixDimensionsForAsset:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 uuid];
  uint64_t v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to fix image dimensions for the asset: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke;
  v30[3] = &unk_1E586D4D0;
  id v13 = v8;
  id v31 = v13;
  p_long long buf = &buf;
  id v14 = v11;
  id v32 = v14;
  id v33 = v10;
  id v15 = (void *)MEMORY[0x19F38D650](v30);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_180;
  v24[3] = &unk_1E5874818;
  id v16 = v13;
  id v25 = v16;
  id v17 = v15;
  id v29 = v17;
  double v26 = self;
  id v18 = v9;
  id v27 = v18;
  id v19 = v14;
  id v28 = v19;
  uint64_t v20 = (void (**)(void))MEMORY[0x19F38D650](v24);
  if ([v16 originalWidth] && objc_msgSend(v16, "originalHeight"))
  {
    v20[2](v20);
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_182;
    void v21[3] = &unk_1E586D4F8;
    uint64_t v22 = v20;
    id v23 = v17;
    [(PLManagedAssetRecoveryManager *)self _fixOriginalAssetDimensionsForAsset:v16 cloudPhotoLibraryManager:v18 completionBlock:v21];
  }
  _Block_object_dispose(&buf, 8);
}

void __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = [*(id *)(a1 + 32) photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2;
  v8[3] = &unk_1E586D4A8;
  uint64_t v13 = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v11 = v4;
  id v12 = v6;
  id v7 = v4;
  [v5 performBlockAndWait:v8];
}

void __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_180(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) hasAdjustments];
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 assetResourceForCPLType:2];
    double v5 = v4;
    if (!v4)
    {
      id v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 56);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v29 = v16;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "JPEGFull resource not available for asset %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_25;
    }
    uint64_t v6 = [v4 unorientedWidth];
    uint64_t v7 = [v5 unorientedHeight];
    id v8 = [v5 cplFileURL];
    if (v6 && v7)
    {
      [*(id *)(a1 + 32) setWidth:v6];
      [*(id *)(a1 + 32) setHeight:v7];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v18 = [v8 path];
      int v19 = [v17 fileExistsAtPath:v18];

      if (!v19)
      {
        uint64_t v20 = *(void **)(a1 + 40);
        v30[0] = v5;
        BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        uint64_t v22 = *(void **)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 48);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_181;
        v24[3] = &unk_1E5875C20;
        id v25 = v22;
        id v26 = v8;
        id v27 = *(id *)(a1 + 64);
        [v20 _downloadResources:v21 forAsset:v25 usingCloudPhotoLibraryManager:v23 completionHandler:v24];

        goto LABEL_24;
      }
      +[PLManagedAsset sizeOfImageAtURL:v8 outOrientation:0];
      objc_msgSend(*(id *)(a1 + 32), "setImageSize:");
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_24:

LABEL_25:
    return;
  }
  if ([v3 originalWidth] && objc_msgSend(*(id *)(a1 + 32), "originalHeight"))
  {
    double v9 = (double)[*(id *)(a1 + 32) originalWidth];
    double v10 = (double)[*(id *)(a1 + 32) originalHeight];
    unint64_t v11 = (int)[*(id *)(a1 + 32) originalOrientation] - 5;
    if (v11 >= 4) {
      double v12 = v9;
    }
    else {
      double v12 = v10;
    }
    if (v11 >= 4) {
      double v13 = v10;
    }
    else {
      double v13 = v9;
    }
    objc_msgSend(*(id *)(a1 + 32), "setImageSize:", v12, v13);
    id v14 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v14();
  }
}

uint64_t __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_182(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_181(id *a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a1[4] photoLibrary];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3;
    v8[3] = &unk_1E5874868;
    id v9 = a1[5];
    id v10 = a1[4];
    id v11 = a1[6];
    [v6 performBlockAndWait:v8];
  }
  else
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to download CPLResourceTypeJPEGFullSize resource: %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3(uint64_t a1)
{
  +[PLManagedAsset sizeOfImageAtURL:*(void *)(a1 + 32) outOrientation:0];
  objc_msgSend(*(id *)(a1 + 40), "setImageSize:");
  char v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) width]) {
    BOOL v2 = [*(id *)(a1 + 32) height] != 0;
  }
  else {
    BOOL v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v2;
  int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v4 = PLBackendGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v6;
      uint64_t v7 = "Fixed image dimensions for the asset: %{public}@";
LABEL_9:
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138543362;
    uint64_t v11 = v8;
    uint64_t v7 = "Failed to fix image dimensions for the asset: %{public}@";
    goto LABEL_9;
  }

  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
}

- (void)_downloadResources:(id)a3 forAsset:(id)a4 usingCloudPhotoLibraryManager:(id)a5 completionHandler:(id)a6
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v58 = a5;
  id v52 = v10;
  id v53 = a6;
  if ([v10 count])
  {
    id v51 = self;
    v57 = [v11 uuid];
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = v10;
    uint64_t v12 = 0;
    uint64_t v13 = [obj countByEnumeratingWithState:&v98 objects:v114 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v99 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = [*(id *)(*((void *)&v98 + 1) + 8 * i) cplType];
          id v17 = +[PLInternalResource originalCPLResourceTypesForMaster];
          id v18 = [NSNumber numberWithUnsignedInteger:v16];
          int v19 = [v17 containsObject:v18];

          if (v19) {
            objc_msgSend(v11, "rm_cplMasterResourceForResourceType:", v16);
          }
          else {
          uint64_t v20 = objc_msgSend(v11, "rm_cplResourceForResourceType:", v16);
          }
          if (v20)
          {
            BOOL v21 = [NSNumber numberWithUnsignedInteger:v16];
            [v61 setObject:v20 forKeyedSubscript:v21];

            uint64_t v22 = [v20 identity];
            uint64_t v23 = [v22 fileSize];

            v12 += v23;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v98 objects:v114 count:16];
      }
      while (v13);
    }

    unint64_t v24 = [v61 count];
    if (v24 >= [obj count])
    {
      uint64_t v31 = [(PLVolumeInfo *)v51->_volumeInfo availableSpace];
      unint64_t v32 = [(PLVolumeInfo *)v51->_volumeInfo nearLowDiskThreshold];
      unint64_t v33 = v31 - v12;
      if (v31 - v12 < v32
        || (unint64_t v34 = v51->_totalDownloadedResourceBytes) != 0 && v34 + v12 >= v51->_resourceDownloadBytesLimit)
      {
        id v44 = PLBackendGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          totalDownloadedResourceBytes = (uint64_t (*)(uint64_t, uint64_t))v51->_totalDownloadedResourceBytes;
          unint64_t resourceDownloadBytesLimit = v51->_resourceDownloadBytesLimit;
          id v47 = @"no";
          if (v33 < v32) {
            id v47 = @"yes";
          }
          *(_DWORD *)long long buf = 138544386;
          *(void *)&uint8_t buf[4] = v57;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v12;
          *(_WORD *)&buf[22] = 2048;
          v112 = totalDownloadedResourceBytes;
          *(_WORD *)v113 = 2048;
          *(void *)&v113[2] = resourceDownloadBytesLimit;
          *(_WORD *)&v113[10] = 2114;
          *(void *)&v113[12] = v47;
          _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "Recovery manager exceeded resource download limit for asset %{public}@, resourcesBytesToDownload: %lu, totalDownloadedResourceBytes: %lu, resourceDownloadBytesLimit: %lu, availableSpaceBelowNearLowThreshold: %{public}@", buf, 0x34u);
        }

        id v48 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PLManagedAssetRecoveryManager" code:1 userInfo:0];
        id v49 = [(PLManagedAssetRecoveryManager *)v51 workQueue];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_172;
        v92[3] = &unk_1E58742F0;
        id v94 = v53;
        id v93 = v48;
        id v50 = v48;
        dispatch_async(v49, v92);
      }
      else
      {
        v90[0] = 0;
        v90[1] = v90;
        v90[2] = 0x2020000000;
        char v91 = 1;
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v112 = __Block_byref_object_copy__65871;
        *(void *)v113 = __Block_byref_object_dispose__65872;
        *(void *)&v113[8] = 0;
        v88[0] = 0;
        v88[1] = v88;
        v88[2] = 0x2020000000;
        int v89 = 0;
        v87[0] = 0;
        v87[1] = v87;
        v87[2] = 0x2020000000;
        v87[3] = 0;
        group = dispatch_group_create();
        id v55 = (void *)[objc_alloc(MEMORY[0x1E4F59958]) initWithIntent:4 priority:2];
        id v35 = PLBackendGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [obj count];
          *(_DWORD *)v105 = 134218498;
          uint64_t v106 = v36;
          __int16 v107 = 2114;
          v108 = v57;
          __int16 v109 = 2114;
          id v110 = v61;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Downloading %lu resources for asset: %{public}@, resources: %{public}@", v105, 0x20u);
        }

        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        char v37 = [v61 allValues];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v83 objects:v104 count:16];
        if (v38)
        {
          id obja = *(id *)v84;
          id v54 = v37;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(id *)v84 != obja) {
                objc_enumerationMutation(v54);
              }
              uint64_t v40 = *(void *)(*((void *)&v83 + 1) + 8 * j);
              dispatch_group_enter(group);
              v78[0] = MEMORY[0x1E4F143A8];
              v78[1] = 3221225472;
              v78[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_174;
              v78[3] = &unk_1E586D430;
              id v41 = v57;
              id v79 = v41;
              v81 = v90;
              v82 = buf;
              id v42 = group;
              v80 = v42;
              v70[0] = MEMORY[0x1E4F143A8];
              v70[1] = 3221225472;
              v70[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_177;
              v70[3] = &unk_1E586D458;
              id v71 = v41;
              v74 = v90;
              v75 = buf;
              v76 = v88;
              v77 = v87;
              id v72 = v61;
              v73 = v42;
              [v58 downloadResource:v40 options:v55 clientBundleID:0 proposedTaskIdentifier:0 taskDidBeginHandler:v78 progressBlock:0 completionHandler:v70];
            }
            char v37 = v54;
            uint64_t v38 = [v54 countByEnumeratingWithState:&v83 objects:v104 count:16];
          }
          while (v38);
        }

        uint64_t v43 = [(PLManagedAssetRecoveryManager *)v51 workQueue];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_179;
        v62[3] = &unk_1E586D480;
        v66 = v88;
        v67 = v87;
        v68 = v90;
        v69 = buf;
        id v63 = v57;
        v64 = v51;
        id v65 = v53;
        dispatch_group_notify(group, v43, v62);

        _Block_object_dispose(v87, 8);
        _Block_object_dispose(v88, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(v90, 8);
      }
    }
    else
    {
      id v25 = PLBackendGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v57;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Recovery manager download failed to create CPLResources for all requested resources for asset: %{public}@", buf, 0xCu);
      }

      id v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PLManagedAssetRecoveryManager" code:3 userInfo:0];
      id v27 = [(PLManagedAssetRecoveryManager *)v51 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_165;
      block[3] = &unk_1E58742F0;
      id v97 = v53;
      id v96 = v26;
      id v28 = v26;
      dispatch_async(v27, block);
    }
    id v30 = v57;
  }
  else
  {
    uint64_t v29 = [(PLManagedAssetRecoveryManager *)self workQueue];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke;
    v102[3] = &unk_1E5875198;
    id v103 = v53;
    dispatch_async(v29, v102);

    id v30 = v103;
  }
}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_165(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_172(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_174(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [MEMORY[0x1E4F59940] shortDescriptionForResourceType:a3];
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412802;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2114;
      uint64_t v22 = v9;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to download resource (%@) for asset recovery: %@. Asset: %{public}@ ", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      id v16 = v6;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v12 = [v10 initWithDomain:@"PLManagedAssetRecoveryManager" code:3 userInfo:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_177(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [MEMORY[0x1E4F59940] shortDescriptionForResourceType:a3];
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412802;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2114;
      uint64_t v31 = v14;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to download resource (%@) for asset recovery: %@. Asset: %{public}@ ", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      id v25 = v11;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v17 = [v15 initWithDomain:@"PLManagedAssetRecoveryManager" code:3 userInfo:v16];
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      __int16 v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    id v20 = *(void **)(a1 + 40);
    __int16 v21 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v22 = [v20 objectForKeyedSubscript:v21];
    uint64_t v23 = [v22 identity];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v23 fileSize];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_179(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v4 = *(void *)(*(void *)(a1[8] + 8) + 24);
    uint64_t v5 = a1[4];
    int v10 = 67109634;
    *(_DWORD *)id v11 = v3;
    *(_WORD *)&void v11[4] = 2048;
    *(void *)&v11[6] = v4;
    *(_WORD *)&v11[14] = 2114;
    *(void *)&v11[16] = v5;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded %d resources with size %ld for asset %{public}@ as a part of the recovery from inconsistent cloud states", (uint8_t *)&v10, 0x1Cu);
  }

  if (!*(unsigned char *)(*(void *)(a1[9] + 8) + 24))
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = *(void *)(*(void *)(a1[10] + 8) + 40);
      int v10 = 138543618;
      *(void *)id v11 = v7;
      *(_WORD *)&v11[8] = 2112;
      *(void *)&v11[10] = v8;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to download all CPL resources for asset: %{public}@ error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  *(void *)(a1[5] + 32) += *(void *)(*(void *)(a1[8] + 8) + 24);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_performAssetRecoveryTaskForInconsistentState:(id)a3 state:(unint64_t)a4 cloudPhotoLibraryManager:(id)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke;
  v23[3] = &unk_1E58748D8;
  id v16 = v12;
  id v25 = v15;
  unint64_t v26 = a4;
  id v24 = v16;
  uint64_t v17 = MEMORY[0x19F38D650](v23);
  uint64_t v18 = (void (**)(void, void, void))v17;
  switch(a4)
  {
    case 0uLL:
      __int16 v19 = *(void (**)(void))(v17 + 16);
      goto LABEL_6;
    case 1uLL:
      [(PLManagedAssetRecoveryManager *)self _fixDimensionsForAsset:v16 cloudPhotoLibraryManager:v13 completionBlock:v17];
      goto LABEL_11;
    case 2uLL:
      id v22 = 0;
      BOOL v20 = [(PLManagedAssetRecoveryManager *)self _fixRawUTIForAsset:v16 error:&v22];
      id v21 = v22;
      ((void (**)(void, BOOL, id))v18)[2](v18, v20, v21);

      goto LABEL_11;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_11;
    case 4uLL:
      [(PLManagedAssetRecoveryManager *)self _fixIrisWithZeroVideoComplementDuration:v16 cloudPhotoLibraryManager:v13 completionBlock:v17];
      goto LABEL_11;
    case 8uLL:
      goto LABEL_7;
    default:
      if (a4 == 0x40000000)
      {
LABEL_7:
        [(PLManagedAssetRecoveryManager *)self _fixMissingFullSizeAdjustedResources:v16 cloudPhotoLibraryManager:v13 recoveryState:a4 usingSyncableLibrary:v14 completionBlock:v17];
      }
      else if (a4 == 0x80000000)
      {
        __int16 v19 = *(void (**)(void))(v17 + 16);
LABEL_6:
        v19();
      }
LABEL_11:

      return;
  }
}

void __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) photoLibrary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2;
  void v15[3] = &unk_1E5873588;
  char v19 = a2;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v16 = v7;
  uint64_t v18 = v8;
  id v17 = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_161;
  v11[3] = &unk_1E5871E30;
  id v9 = *(id *)(a1 + 40);
  char v14 = a2;
  id v12 = v17;
  id v13 = v9;
  id v10 = v17;
  [v6 performTransactionAndWait:v15 completionHandler:v11];
}

void __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = [*(id *)(a1 + 32) additionalAttributes];
    [v6 removeCloudRecoveryStateFlag:*(void *)(a1 + 48)];
  }
  else
  {
    BOOL v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = [*(id *)(a1 + 32) uuid];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Asset recovery failed for asset: %{public}@, recovery state: %lld, error: %@", buf, 0x20u);
    }
  }
}

uint64_t __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_161(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_recoverNextRecoveryState:(id)a3 forAsset:(id)a4 cloudPhotoLibraryManager:(id)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 nextObject];
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v17 integerValue];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke;
    v44[3] = &unk_1E586D3E0;
    void v44[4] = self;
    id v45 = v13;
    id v46 = v12;
    id v47 = v14;
    id v48 = v15;
    id v49 = v16;
    id v20 = v16;
    [(PLManagedAssetRecoveryManager *)self _performAssetRecoveryTaskForInconsistentState:v13 state:v19 cloudPhotoLibraryManager:v47 usingSyncableLibrary:v48 completionBlock:v44];
  }
  else
  {
    id v32 = v14;
    BOOL v21 = [(NSMutableArray *)self->_recoveryErrors count] == 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v22 = self->_recoveryErrors;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      id v31 = v15;
      uint64_t v25 = *(void *)v41;
LABEL_5:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        char v27 = 1;
        if (PLIsErrorEqualToCode()) {
          break;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v24) {
            goto LABEL_5;
          }
          char v27 = 0;
          break;
        }
      }
      id v15 = v31;
    }
    else
    {
      char v27 = 0;
    }

    __int16 v28 = [v13 photoLibrary];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_4;
    v36[3] = &unk_1E586EBF8;
    id v37 = v13;
    BOOL v38 = v21;
    char v39 = v27;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_5;
    v33[3] = &unk_1E586D408;
    id v34 = v16;
    BOOL v35 = v21;
    id v29 = v16;
    id v30 = v13;
    [v28 performTransactionAndWait:v36 completionHandler:v33];

    id v14 = v32;
  }
}

void __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PLManagedAssetRecoveryManager" code:4 userInfo:0];
    }
    uint64_t v8 = v7;
    [*((id *)a1[4] + 6) addObject:v7];
  }
  __int16 v9 = [a1[4] workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2;
  v12[3] = &unk_1E58751C0;
  id v10 = a1[5];
  id v11 = a1[4];
  id v13 = v10;
  id v14 = v11;
  id v15 = a1[6];
  id v16 = a1[7];
  id v17 = a1[8];
  id v18 = a1[9];
  dispatch_async(v9, v12);
}

void __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_4(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) additionalAttributes];
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = v2;
    [v2 setCloudStateRecoveryAttemptsCount:0];
    [v4 resetCloudRecoveryState];
LABEL_3:
    BOOL v2 = v4;
    goto LABEL_7;
  }
  if (!*(unsigned char *)(a1 + 41))
  {
    id v4 = v2;
    uint64_t v3 = (__int16)([v2 cloudStateRecoveryAttemptsCount] + 1);
    [v4 setCloudStateRecoveryAttemptsCount:v3];
    BOOL v2 = v4;
    if ((int)v3 >= 10)
    {
      [v4 setCloudRecoveryStateFlag:0x80000000];
      goto LABEL_3;
    }
  }
LABEL_7:
}

uint64_t __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) photoLibrary];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_3;
  v4[3] = &unk_1E58751C0;
  uint64_t v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  [v2 performBlockAndWait:v4];
}

uint64_t __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recoverNextRecoveryState:*(void *)(a1 + 40) forAsset:*(void *)(a1 + 48) cloudPhotoLibraryManager:*(void *)(a1 + 56) usingSyncableLibrary:*(void *)(a1 + 64) completionBlock:*(void *)(a1 + 72)];
}

- (void)_recoverNextAssetWithEnumerator:(id)a3 cloudPhotoLibraryManager:(id)a4 transaction:(id)a5 usingNonSyncableLibrary:(id)a6 andSyncableLibrary:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 nextObject];
  if (v17)
  {
    id v18 = [v15 managedObjectContext];
    uint64_t v19 = [(PLManagedAssetRecoveryManager *)self _loadObjectWithObjectID:v17 managedObjectContext:v18];

    if (v19)
    {
      id v20 = [v19 uuid];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke;
      v49[3] = &unk_1E586D3B8;
      v49[4] = self;
      id v21 = v20;
      id v50 = v21;
      BOOL v35 = v19;
      id v22 = v19;
      id v51 = v22;
      id v52 = v12;
      id v38 = v13;
      uint64_t v23 = v16;
      id v24 = v13;
      id v53 = v24;
      id v54 = v14;
      id v37 = v15;
      id v55 = v15;
      uint64_t v36 = v23;
      id v25 = v23;
      id v56 = v25;
      uint64_t v26 = (void (**)(void, void, void))MEMORY[0x19F38D650](v49);
      char v27 = [v22 additionalAttributes];
      if ([v27 hasConsistentCloudState])
      {
        v26[2](v26, 1, 0);
      }
      else if ((int)[v27 cloudStateRecoveryAttemptsCount] < 10)
      {
        unint64_t v33 = [(PLManagedAssetRecoveryManager *)self _recoveryStatesToProcessForAttributes:v27];
        [v33 objectEnumerator];
        id v32 = v34 = v14;
        [(PLManagedAssetRecoveryManager *)self _recoverNextRecoveryState:v32 forAsset:v22 cloudPhotoLibraryManager:v24 usingSyncableLibrary:v25 completionBlock:v26];

        id v14 = v34;
      }
      else
      {
        id v31 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PLManagedAssetRecoveryManager" code:2 userInfo:0];
        ((void (**)(void, void, void *))v26)[2](v26, 0, v31);
      }
      id v13 = v38;
      uint64_t v19 = v35;

      id v16 = v36;
      id v15 = v37;
    }
    else
    {
      id v29 = PLBackendGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v58 = v17;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Skipping recovery of deleted asset: %{public}@", buf, 0xCu);
      }

      id v30 = [(PLManagedAssetRecoveryManager *)self workQueue];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_159;
      v41[3] = &unk_1E586E860;
      long long v42 = 0;
      long long v43 = self;
      id v44 = v12;
      id v45 = v13;
      id v46 = v14;
      id v47 = v15;
      id v48 = v16;
      dispatch_async(v30, v41);

      id v21 = v42;
    }
  }
  else
  {
    __int16 v28 = [(PLManagedAssetRecoveryManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_3;
    block[3] = &unk_1E5875E18;
    void block[4] = self;
    id v40 = v14;
    dispatch_async(v28, block);
  }
}

void __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v6;

  if (a2)
  {
    ++*(void *)(*(void *)(a1 + 32) + 16);
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v28 = v10;
      id v11 = "Successfully recovered asset: %{public}@";
      id v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      id v30 = v5;
      id v11 = "Failed to recover the asset %{public}@ with error: %@";
      id v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_6;
    }
  }

  id v16 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_156;
  block[3] = &unk_1E586E860;
  id v17 = *(id *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 32);
  id v20 = v17;
  uint64_t v21 = v18;
  id v22 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  id v24 = *(id *)(a1 + 72);
  id v25 = *(id *)(a1 + 80);
  id v26 = *(id *)(a1 + 88);
  dispatch_async(v16, block);
}

void __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_159(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) photoLibrary];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2_160;
  v4[3] = &unk_1E5874110;
  uint64_t v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 performBlockAndWait:v4];
}

uint64_t __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v3 + 16);
    uint64_t v4 = *(void *)(v3 + 24);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Finished recovery of the assets in inconsistent cloud state. Fixed %lu out of %lu assets", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) setState:0];
  return [*(id *)(a1 + 40) stillAlive];
}

uint64_t __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2_160(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recoverNextAssetWithEnumerator:*(void *)(a1 + 40) cloudPhotoLibraryManager:*(void *)(a1 + 48) transaction:*(void *)(a1 + 56) usingNonSyncableLibrary:*(void *)(a1 + 64) andSyncableLibrary:*(void *)(a1 + 72)];
}

void __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_156(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) photoLibrary];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2;
  v4[3] = &unk_1E5874110;
  uint64_t v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 performBlockAndWait:v4];
}

uint64_t __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recoverNextAssetWithEnumerator:*(void *)(a1 + 40) cloudPhotoLibraryManager:*(void *)(a1 + 48) transaction:*(void *)(a1 + 56) usingNonSyncableLibrary:*(void *)(a1 + 64) andSyncableLibrary:*(void *)(a1 + 72)];
}

- (id)_recoveryStatesToProcessForAttributes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [&unk_1EEBF2018 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&unk_1EEBF2018);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v3, "hasCloudRecoveryStateFlagSet:", objc_msgSend(v9, "integerValue"))) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [&unk_1EEBF2018 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_loadObjectWithObjectID:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 objectRegisteredForID:v5];
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v6, "refreshObject:mergeChanges:", v7, objc_msgSend(v7, "hasChanges"));
  }
  else
  {
    id v8 = [v6 existingObjectWithID:v5 error:0];
  }
  if ([v8 isDeleted]) {
    id v9 = 0;
  }
  else {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

- (void)_setCloudRecoveryState:(unint64_t)a3 forAssetsWithFetchRequestPredicate:(id)a4 resultsFilterPredicate:(id)a5 usingNonSyncableLibrary:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke;
  void v15[3] = &unk_1E58735D8;
  id v16 = v9;
  id v17 = v11;
  id v18 = v10;
  unint64_t v19 = a3;
  id v12 = v10;
  id v13 = v11;
  id v14 = v9;
  [v13 performTransactionAndWait:v15];
}

void __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke(uint64_t a1)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  BOOL v2 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = +[PLManagedAsset predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders];
  uint64_t v4 = *(void *)(a1 + 32);
  v32[0] = v3;
  v32[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v6 = [v2 andPredicateWithSubpredicates:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = +[PLManagedAsset entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setPredicate:v6];
  [v9 setFetchBatchSize:100];
  uint64_t v31 = @"additionalAttributes";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v10];

  id v11 = [*(id *)(a1 + 40) managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke_2;
  void v19[3] = &unk_1E586D390;
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  id v20 = v12;
  uint64_t v21 = &v23;
  uint64_t v22 = v13;
  id v14 = [v11 enumerateObjectsFromFetchRequest:v9 count:0 usingDefaultBatchSizeWithBlock:v19];

  if (v14)
  {
    uint64_t v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v28 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch assets with error: %@", buf, 0xCu);
    }
  }
  if (v24[3] >= 1)
  {
    id v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)v24[3];
      uint64_t v18 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 134218240;
      uint64_t v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Assets: %lu marked with cloudRecoveryState: %lu", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

void __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke_2(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 uuid];
  id v5 = (void *)a1[4];
  if (v5)
  {
    if ([v5 evaluateWithObject:v3])
    {
      id v6 = [v3 additionalAttributes];
      char v7 = [v6 hasCloudRecoveryStateFlagSet:a1[6]];

      if ((v7 & 1) == 0)
      {
        id v8 = [v3 additionalAttributes];
        [v8 setCloudRecoveryStateFlag:a1[6]];

        id v9 = a1 + 5;
        uint64_t v10 = *(void *)(a1[5] + 8);
        uint64_t v11 = *(void *)(v10 + 24);
        if (v11 <= 24)
        {
          id v12 = PLBackendGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    uint64_t v13 = [v3 additionalAttributes];
    char v14 = [v13 hasCloudRecoveryStateFlagSet:a1[6]];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = [v3 additionalAttributes];
      [v15 setCloudRecoveryStateFlag:a1[6]];

      id v9 = a1 + 5;
      uint64_t v10 = *(void *)(a1[5] + 8);
      uint64_t v11 = *(void *)(v10 + 24);
      if (v11 <= 24)
      {
        id v12 = PLBackendGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
LABEL_10:
          uint64_t v16 = a1[6];
          int v17 = 138543618;
          uint64_t v18 = v4;
          __int16 v19 = 2048;
          uint64_t v20 = v16;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "asset: %{public}@ marking with cloudRecoveryState: %llu", (uint8_t *)&v17, 0x16u);
        }
LABEL_11:

        uint64_t v10 = *(void *)(*v9 + 8);
        uint64_t v11 = *(void *)(v10 + 24);
      }
LABEL_12:
      *(void *)(v10 + 24) = v11 + 1;
    }
  }
}

- (void)_startRecoveryUsingCloudPhotoLibraryManager:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Starting recovery of the assets in inconsistent cloud state", buf, 2u);
  }

  self->_fixedCount = 0;
  self->_totalCount = 0;
  self->_totalDownloadedResourceBytes = 0;
  id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  recoveryErrors = self->_recoveryErrors;
  self->_recoveryErrors = v9;

  id v11 = -[PLManagedAssetRecoveryManager _newPhotoLibraryWithName:nonSyncable:](self, "_newPhotoLibraryWithName:nonSyncable:", "-[PLManagedAssetRecoveryManager _startRecoveryUsingCloudPhotoLibraryManager:transaction:]", 1);
  id v12 = -[PLManagedAssetRecoveryManager _newPhotoLibraryWithName:nonSyncable:](self, "_newPhotoLibraryWithName:nonSyncable:", "-[PLManagedAssetRecoveryManager _startRecoveryUsingCloudPhotoLibraryManager:transaction:]", 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__PLManagedAssetRecoveryManager__startRecoveryUsingCloudPhotoLibraryManager_transaction___block_invoke;
  v17[3] = &unk_1E5870618;
  id v18 = v11;
  __int16 v19 = self;
  id v20 = v6;
  id v21 = v7;
  id v22 = v12;
  id v13 = v12;
  id v14 = v7;
  id v15 = v6;
  id v16 = v11;
  [v16 performBlockAndWait:v17];
}

void __89__PLManagedAssetRecoveryManager__startRecoveryUsingCloudPhotoLibraryManager_transaction___block_invoke(uint64_t a1)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLManagedAsset entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@ && %K < %llu && %K < %d", @"additionalAttributes.cloudRecoveryState", &unk_1EEBEF330, @"additionalAttributes.cloudRecoveryState", 0x80000000, @"additionalAttributes.cloudStateRecoveryAttemptsCount", 10];
  [v4 setPredicate:v5];

  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"additionalAttributes.cloudRecoveryState" ascending:1];
  v24[0] = v6;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"additionalAttributes.cloudStateRecoveryAttemptsCount" ascending:1];
  v24[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  [v4 setSortDescriptors:v8];

  [v4 setResultType:1];
  id v9 = [*(id *)(a1 + 32) managedObjectContext];
  id v21 = 0;
  uint64_t v10 = [v9 executeFetchRequest:v4 error:&v21];
  id v11 = v21;

  *(void *)(*(void *)(a1 + 40) + 24) = [v10 count];
  if (!*(void *)(*(void *)(a1 + 40) + 24))
  {
    id v15 = PLBackendGetLog();
    id v16 = v15;
    if (v10)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        int v17 = "No assets found to recover";
        id v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
        uint32_t v20 = 2;
LABEL_10:
        _os_log_impl(&dword_19B3C7000, v18, v19, v17, buf, v20);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v23 = (uint64_t)v11;
      int v17 = "Failed to fetch assets for recovery: %@";
      id v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 12;
      goto LABEL_10;
    }

    [*(id *)(a1 + 40) setState:0];
    [*(id *)(a1 + 56) stillAlive];
    goto LABEL_12;
  }
  id v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v10 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v23 = v13;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Starting recovery of %lu assets in inconsistent state.", buf, 0xCu);
  }

  id v14 = [v10 objectEnumerator];
  [*(id *)(a1 + 40) _recoverNextAssetWithEnumerator:v14 cloudPhotoLibraryManager:*(void *)(a1 + 48) transaction:*(void *)(a1 + 56) usingNonSyncableLibrary:*(void *)(a1 + 32) andSyncableLibrary:*(void *)(a1 + 64)];

LABEL_12:
}

- (id)_newPhotoLibraryWithName:(const char *)a3 nonSyncable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v7 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v7 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v7 setAutomaticallyPinToFirstFetch:0];
  id v8 = [(PLLibraryServicesManager *)self->_lsm libraryBundle];
  id v14 = 0;
  id v9 = +[PLPhotoLibrary newPhotoLibraryWithName:a3 loadedFromBundle:v8 options:v7 error:&v14];
  id v10 = v14;

  if (!v9)
  {
    id v12 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error creating context: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (v4)
  {
    id v11 = [v9 managedObjectContext];
    [v11 setChangeSource:1];

    id v12 = [v9 managedObjectContext];
    [v12 setLocalOnlyDelete:1];
LABEL_6:
  }
  return v9;
}

- (void)startRecoveryUsingCloudPhotoLibraryManager:(id)a3 transaction:(id)a4 shouldIdentifyInconsistentAssets:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PLManagedAssetRecoveryManager *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __121__PLManagedAssetRecoveryManager_startRecoveryUsingCloudPhotoLibraryManager_transaction_shouldIdentifyInconsistentAssets___block_invoke;
  v13[3] = &unk_1E5873988;
  BOOL v16 = a5;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __121__PLManagedAssetRecoveryManager_startRecoveryUsingCloudPhotoLibraryManager_transaction_shouldIdentifyInconsistentAssets___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state])
  {
    BOOL v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Recovery manager already running", v6, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setState:1];
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 32) identifyAssetsWithInconsistentCloudState];
    }
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 _startRecoveryUsingCloudPhotoLibraryManager:v4 transaction:v5];
  }
}

- (void)identifyAssetsWithInconsistentCloudState
{
  id v3 = -[PLManagedAssetRecoveryManager _newPhotoLibraryWithName:nonSyncable:](self, "_newPhotoLibraryWithName:nonSyncable:", "-[PLManagedAssetRecoveryManager identifyAssetsWithInconsistentCloudState]", 1);
  uint64_t v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Identifying assets in inconsistent cloud state", buf, 2u);
  }

  uint64_t v5 = [(id)objc_opt_class() _imagesWithZeroWidthHeightPredicate];
  [(PLManagedAssetRecoveryManager *)self _setCloudRecoveryState:1 forAssetsWithFetchRequestPredicate:v5 resultsFilterPredicate:0 usingNonSyncableLibrary:v3];

  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [(id)*MEMORY[0x1E4F44498] identifier];
  id v8 = [v6 predicateWithFormat:@"%K UTI-CONFORMS-TO %@", @"uniformTypeIdentifier", v7];

  id v9 = [(id)objc_opt_class() _assetsWithJPGFilenameAndRawPrimaryImageResourcePredicate];
  [(PLManagedAssetRecoveryManager *)self _setCloudRecoveryState:2 forAssetsWithFetchRequestPredicate:v9 resultsFilterPredicate:v8 usingNonSyncableLibrary:v3];

  id v10 = [(id)objc_opt_class() _irisesWithZeroVideoCpDuration];
  [(PLManagedAssetRecoveryManager *)self _setCloudRecoveryState:4 forAssetsWithFetchRequestPredicate:v10 resultsFilterPredicate:0 usingNonSyncableLibrary:v3];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_65957];
  id v12 = [(id)objc_opt_class() _predicateForAdjustedAssetsWithMissingResources];
  [(PLManagedAssetRecoveryManager *)self _setCloudRecoveryState:8 forAssetsWithFetchRequestPredicate:v12 resultsFilterPredicate:v11 usingNonSyncableLibrary:v3];

  uint64_t v13 = [(id)objc_opt_class() _predicateForAdjustedAssetsFailedDeferredRendering];
  [(PLManagedAssetRecoveryManager *)self _setCloudRecoveryState:0x40000000 forAssetsWithFetchRequestPredicate:v13 resultsFilterPredicate:0 usingNonSyncableLibrary:v3];
}

uint64_t __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 isPhoto];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke_2;
  void v15[3] = &__block_descriptor_36_e28_B16__0__PLInternalResource_8l;
  int v16 = v3 ^ 1;
  uint64_t v4 = [v2 firstPersistedResourceMatching:v15];
  uint64_t v5 = [v4 fileURL];
  id v6 = [v5 path];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v7 fileExistsAtPath:v6];
  }
  else
  {
    int v8 = 0;
  }
  if ([v2 isPhotoIris])
  {
    id v9 = [v2 firstPersistedResourceMatching:&__block_literal_global_51_65960];
    id v10 = [v9 fileURL];
    id v11 = [v10 path];

    if (!v11
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          id v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 fileExistsAtPath:v11],
          v12,
          (v13 & 1) == 0))
    {
      int v8 = 0;
    }
  }
  return v8 ^ 1u;
}

uint64_t __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resourceType] == *(_DWORD *)(a1 + 32)) {
    uint64_t v4 = [v3 isAdjustedFullSizeRenderResource];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resourceType] == 3 && objc_msgSend(v2, "isAdjustedResource")) {
    uint64_t v3 = [v2 isDerivative] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (PLManagedAssetRecoveryManager)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PLManagedAssetRecoveryManager;
  id v6 = [(PLManagedAssetRecoveryManager *)&v34 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lsm, a3);
    int v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assetsd.periodicmaintenance.managedAssetRecoveryManager.workQueue", v9);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F8BA18]);
    char v13 = [v5 pathManager];
    id v14 = [v13 photoDirectoryWithType:1];
    uint64_t v15 = [v12 initWithPath:v14];
    volumeInfo = v7->_volumeInfo;
    v7->_volumeInfo = (PLVolumeInfo *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v18 = [v17 integerForKey:@"PLRecoveryManagerResourceDownloadLimitMB"];

    uint64_t v19 = v18 << 20;
    if (!v18) {
      uint64_t v19 = 314572800;
    }
    v7->_unint64_t resourceDownloadBytesLimit = v19;
    id v20 = objc_initWeak(&location, v7);

    id v21 = objc_alloc(MEMORY[0x1E4F8B948]);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke;
    v31[3] = &unk_1E5874070;
    objc_copyWeak(&v32, &location);
    uint64_t v22 = [v21 initWithBlock:v31];
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    imageClient = v7->_imageClient;
    v7->_imageClient = (PLLazyObject *)v22;

    id v24 = objc_initWeak(&location, v7);
    id v25 = objc_alloc(MEMORY[0x1E4F8B948]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke_2;
    v29[3] = &unk_1E5874070;
    objc_copyWeak(&v30, &location);
    uint64_t v26 = [v25 initWithBlock:v29];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    videoClient = v7->_videoClient;
    v7->_videoClient = (PLLazyObject *)v26;
  }
  return v7;
}

id __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    id v2 = objc_alloc_init(MEMORY[0x1E4F74898]);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    id v2 = objc_alloc_init(MEMORY[0x1E4F748E0]);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

+ (id)_predicateForAdjustedAssetsFailedDeferredRendering
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"deferredProcessingNeeded", &unk_1EEBEF3F0];
}

+ (id)_predicateForAdjustedAssetsWithMissingResources
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1EEBEF348, &unk_1EEBEF360, 0);
  uint64_t v3 = [MEMORY[0x1E4F59940] imageDerivativeTypes];
  [v2 unionSet:v3];

  uint64_t v4 = [MEMORY[0x1E4F59940] videoDerivativeTypes];
  [v2 unionSet:v4];

  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND %K != %u AND %K == %u", @"kind", &unk_1EEBF1FE8, @"kindSubtype", 101, @"deferredProcessingNeeded", 0];
  id v5 = +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:0];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"cloudLocalState", &unk_1EEBEF390];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ and SUBQUERY(modernResources, $resource, $resource.dataStoreSubtype == %@ && $resource.remoteAvailability == %@).@count == 0", @"kind", &unk_1EEBEF378, &unk_1EEBEF3A8, &unk_1EEBEF390];
  int v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ and SUBQUERY(modernResources, $resource, $resource.dataStoreSubtype in %@ && $resource.remoteAvailability == %@).@count < 2", @"kindSubtype", &unk_1EEBEF3C0, &unk_1EEBF2000, &unk_1EEBEF390];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ and SUBQUERY(modernResources, $resource, $resource.dataStoreSubtype == %@ && $resource.remoteAvailability == %@).@count == 0", @"kind", &unk_1EEBEF390, &unk_1EEBEF3D8, &unk_1EEBEF390];
  dispatch_queue_t v10 = (void *)MEMORY[0x1E4F28BA0];
  v19[0] = v7;
  v19[1] = v8;
  v19[2] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  id v12 = [v10 orPredicateWithSubpredicates:v11];

  char v13 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v6;
  v18[1] = v5;
  v18[2] = v17;
  v18[3] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

  return v15;
}

+ (id)_irisesWithZeroVideoCpDuration
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K == 0 AND %K == %u", @"kindSubtype", 2, @"videoCpDurationValue", @"deferredProcessingNeeded", 0);
  v8[0] = v3;
  uint64_t v4 = +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:0];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)_assetsWithJPGFilenameAndRawPrimaryImageResourcePredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %d AND %K ENDSWITH[c] '.jpg' AND %K == %u AND SUBQUERY(modernResources, $resource, $resource.resourceType == 0 AND $resource.utiConformanceHint == %d).@count >= 1", @"kind", 0, @"filename", @"deferredProcessingNeeded", 0, 2];
}

+ (id)_imagesWithZeroWidthHeightPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K == 0 AND %K == 0 AND %K == %u", @"kind", 0, @"width", @"height", @"deferredProcessingNeeded", 0);
}

@end