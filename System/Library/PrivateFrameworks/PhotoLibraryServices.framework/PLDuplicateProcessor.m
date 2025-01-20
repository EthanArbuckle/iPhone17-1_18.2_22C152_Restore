@interface PLDuplicateProcessor
+ (BOOL)_removeAssetsFromDuplicateAlbumUsingFetchRequest:(id)a3 library:(id)a4 error:(id *)a5;
+ (BOOL)isDuplicateProcessorEnabledForLibraryServicesManager:(id)a3;
+ (BOOL)isExitingSharedLibraryForLibrary:(id)a3;
+ (BOOL)removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:(id)a3 error:(id *)a4;
+ (BOOL)sharedLibraryDedupeEnabledWithPathManager:(id)a3;
+ (void)signalBackgroundJobServiceDuplicateProcessingWithLibrary:(id)a3;
+ (void)updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:(id)a3 cplConfiguration:(id)a4;
- (BOOL)_batchEnumerateOrGenerateAssetObjectIdsFromStartingAssetOIDs:(id)a3 library:(id)a4 error:(id *)a5 continuationHandler:(id)a6 processingBatchBlock:(id)a7;
- (BOOL)_detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:(id)a3 detector:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6;
- (BOOL)_insertIntoDuplicateAlbum:(id)a3 assets:(id)a4 duplicateType:(signed __int16)a5 photoLibrary:(id)a6 error:(id *)a7;
- (BOOL)_isAssetValidForMerge:(id)a3;
- (BOOL)_isMergeFeatureEnabled:(id *)a3;
- (BOOL)_isValidSharedLibraryStateWithLibrary:(id)a3 error:(id *)a4;
- (BOOL)_moveDuplicateAlbumAssestFromAlbums:(id)a3 toTargetAlbum:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6;
- (BOOL)_processDuplicatesWithPhotoLibrary:(id)a3 processingType:(unint64_t)a4 assetObjectIds:(id)a5 error:(id *)a6;
- (BOOL)_processMergeAlbumAssetOIDMap:(id)a3 localIdentifierMap:(id)a4 library:(id)a5 error:(id *)a6;
- (BOOL)_processMergeAssets:(id)a3 localIdentifierMap:(id)a4 library:(id)a5 error:(id *)a6;
- (BOOL)_processMergeGroup:(id)a3 processedAssetCount:(unint64_t *)a4 skippedAssetCount:(unint64_t *)a5 processedAssetCountAfterSave:(unint64_t *)a6 library:(id)a7 error:(id *)a8;
- (BOOL)_processMergeGroupContainer:(id)a3 processedAssetCount:(unint64_t *)a4 skippedAssetCount:(unint64_t *)a5 library:(id)a6 error:(id *)a7;
- (BOOL)_processedDuplicateAssetSubGroupWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6;
- (BOOL)_processedRemoveExclusionGroupAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 error:(id *)a5;
- (BOOL)assetsArePendingForDuplicateMergeProcessing:(id)a3;
- (BOOL)isMerging;
- (BOOL)processDuplicatesOfAssetObjectIds:(id)a3 processingType:(unint64_t)a4 error:(id *)a5 continuationHandler:(id)a6;
- (PLDuplicateProcessor)initWithLibraryServicesManager:(id)a3;
- (PLPhotoLibrary)unitTestLibrary;
- (id)_appPrivateData;
- (id)_buildInterruptBatchFromStartingOIDs:(id)a3 library:(id)a4;
- (id)_duplicateAlbumsFromAssets:(id)a3;
- (id)_fetchAssetOIDsForPhotoLibrary:(id)a3 error:(id *)a4;
- (id)_fetchAssetsFromOIDs:(id)a3 library:(id)a4 error:(id *)a5;
- (id)_fetchAssetsFromReference:(id)a3 isOID:(BOOL)a4 library:(id)a5 error:(id *)a6;
- (id)_fetchAssetsFromUUIDs:(id)a3 library:(id)a4 error:(id *)a5;
- (id)_fetchAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 error:(id *)a5;
- (id)_fetchCloudIdentifiersFromAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5;
- (id)_photoLibrary;
- (id)_processAlbumGroupingFromAssets:(id)a3 localIdentifierToCloudIdentifiers:(id)a4 library:(id)a5;
- (id)_processContainersAssetUUIDS:(id)a3 library:(id)a4;
- (id)_processedDuplicateAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 duplicateType:(signed __int16)a5 associatedDuplicateAlbum:(id *)a6 error:(id *)a7;
- (id)_resumeInterruptMarker;
- (void)_inFlightMergeAssetsAddUUIDs:(id)a3;
- (void)_inFlightMergeAssetsRemoveUUIDs:(id)a3;
- (void)_processCloudScopedIdentifierFromLocalIdentifiers:(id)a3 localToCloudIdentifierMap:(id)a4 cplManager:(id)a5 completionHandler:(id)a6;
- (void)_processCloudScopedIdentifiersFromAssetUUIDS:(id)a3 library:(id)a4 completionHandler:(id)a5;
- (void)_setInterruptMarker:(id)a3;
- (void)mergeDuplicateAssetsWithAssetUUIDs:(id)a3 completionHandler:(id)a4;
- (void)setUnitTestLibrary:(id)a3;
@end

@implementation PLDuplicateProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestLibrary, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_inFlightMergeAssetUuids, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

- (void)setUnitTestLibrary:(id)a3
{
}

- (PLPhotoLibrary)unitTestLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 56, 1);
}

- (void)_inFlightMergeAssetsRemoveUUIDs:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_inFlightMergeLock);
  if ([v5 count])
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    [(NSMutableSet *)self->_inFlightMergeAssetUuids minusSet:v4];
  }
  os_unfair_lock_unlock(&self->_inFlightMergeLock);
}

- (void)_inFlightMergeAssetsAddUUIDs:(id)a3
{
  p_inFlightMergeLock = &self->_inFlightMergeLock;
  id v5 = a3;
  os_unfair_lock_lock(p_inFlightMergeLock);
  [(NSMutableSet *)self->_inFlightMergeAssetUuids addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_inFlightMergeLock);
}

- (BOOL)_isMergeFeatureEnabled:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PLLibraryServicesManager *)self->_lsm cloudPhotoLibraryManager];
  id v5 = [v4 cplConfiguration];

  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v5 valueForKey:@"feature.version.duplicateprocessor"];
  v7 = v6;
  if (!v6 || [v6 unsignedShortValue] < 2)
  {

LABEL_10:
    BOOL v14 = 1;
    goto LABEL_11;
  }
  v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F8C500];
  uint64_t v18 = *MEMORY[0x1E4F28568];
  v10 = [NSString stringWithFormat:@"feature disabled by server. server version: %hu, client version: %hu", objc_msgSend(v7, "unsignedShortValue"), 1];
  v19[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v12 = [v8 errorWithDomain:v9 code:45998 userInfo:v11];

  v13 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Merged feature disabled: %{public}@", buf, 0xCu);
  }

  if (a3) {
    *a3 = v12;
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_isAssetValidForMerge:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 isTrashed];
  if ([v3 isHidden]) {
    v4 |= 2uLL;
  }
  if ([v3 cloudDeleteState] == 1) {
    uint64_t v5 = v4 | 4;
  }
  else {
    uint64_t v5 = v4;
  }
  if (v5)
  {
    v6 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v3 uuid];
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: Duplicate asset %{public}@ is invalid for merge processing. Reason: %tu", (uint8_t *)&v9, 0x16u);
    }
  }

  return v5 == 0;
}

- (id)_fetchCloudIdentifiersFromAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 1;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__687;
  v34 = __Block_byref_object_dispose__688;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__687;
  v28 = __Block_byref_object_dispose__688;
  id v29 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PLDuplicateProcessor__fetchCloudIdentifiersFromAssetUUIDs_library_error___block_invoke;
  v17[3] = &unk_1E58737F8;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  v20 = self;
  v21 = &v30;
  v22 = &v24;
  v23 = &v36;
  [v11 performBlockAndWait:v17];
  int v12 = *((unsigned __int8 *)v37 + 24);
  id v13 = (id)v31[5];
  BOOL v14 = v13;
  if (!v12 && a5) {
    *a5 = v13;
  }

  id v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v15;
}

void __75__PLDuplicateProcessor__fetchCloudIdentifiersFromAssetUUIDs_library_error___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLManagedAsset entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  v28[0] = @"cloudAssetGUID";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v4 setPropertiesToFetch:v6];

  [v4 setResultType:2];
  v7 = (void *)MEMORY[0x1E4F8B9B0];
  id v8 = [*(id *)(a1 + 40) managedObjectContext];
  id v9 = [v7 startedQueryStatsWithContext:v8];

  id v10 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v10 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  id v13 = objc_msgSend(v9, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v12, "count"));
  if (v13)
  {
    BOOL v14 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412802;
      v23 = v16;
      __int16 v24 = 2112;
      v25 = @"Duplicate Processing: Fetch assets from reference";
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (v12)
  {
    uint64_t v17 = PFMap();
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
    if (!*(void *)(v20 + 40)) {
      *(void *)(v20 + 40) = MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

uint64_t __75__PLDuplicateProcessor__fetchCloudIdentifiersFromAssetUUIDs_library_error___block_invoke_176(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"cloudAssetGUID"];
}

- (id)_fetchAssetsFromReference:(id)a3 isOID:(BOOL)a4 library:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__687;
  uint64_t v36 = __Block_byref_object_dispose__688;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__687;
  uint64_t v30 = __Block_byref_object_dispose__688;
  id v31 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __70__PLDuplicateProcessor__fetchAssetsFromReference_isOID_library_error___block_invoke;
  v19[3] = &unk_1E5862168;
  BOOL v25 = a4;
  id v12 = v10;
  id v20 = v12;
  id v13 = v11;
  v23 = &v26;
  __int16 v24 = &v32;
  id v21 = v13;
  v22 = self;
  [v13 performBlockAndWait:v19];
  uint64_t v14 = v27[5];
  id v15 = (id)v33[5];
  v16 = v15;
  if (!v14 && a6) {
    *a6 = v15;
  }

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17;
}

void __70__PLDuplicateProcessor__fetchAssetsFromReference_isOID_library_error___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLManagedAsset entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  if (*(unsigned char *)(a1 + 72)) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 32), v19];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", *(void *)(a1 + 32)];
  }
  [v4 setPredicate:v5];

  v6 = +[PLDuplicateAsset relationshipKeyPathsForMergePrefetching];
  [v4 setRelationshipKeyPathsForPrefetching:v6];

  v7 = (void *)MEMORY[0x1E4F8B9B0];
  id v8 = [*(id *)(a1 + 40) managedObjectContext];
  id v9 = [v7 startedQueryStatsWithContext:v8];

  id v10 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v11 + 40);
  uint64_t v12 = [v10 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  id v15 = objc_msgSend(v9, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
  if (v15)
  {
    v16 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412802;
      v22 = v18;
      __int16 v23 = 2112;
      __int16 v24 = @"Duplicate Processing: Fetch assets from reference";
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }
}

- (id)_fetchAssetsFromOIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  return [(PLDuplicateProcessor *)self _fetchAssetsFromReference:a3 isOID:1 library:a4 error:a5];
}

- (id)_fetchAssetsFromUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  return [(PLDuplicateProcessor *)self _fetchAssetsFromReference:a3 isOID:0 library:a4 error:a5];
}

- (void)_processCloudScopedIdentifierFromLocalIdentifiers:(id)a3 localToCloudIdentifierMap:(id)a4 cplManager:(id)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v27 != v18) {
        objc_enumerationMutation(v15);
      }
      [v14 addObject:*(void *)(*((void *)&v26 + 1) + 8 * v19)];
      if ((unint64_t)[v14 count] > 0x1388) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v17) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [v15 minusSet:v14];
  if (!v11) {
    id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
  }
  if ([v14 count])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __129__PLDuplicateProcessor__processCloudScopedIdentifierFromLocalIdentifiers_localToCloudIdentifierMap_cplManager_completionHandler___block_invoke;
    v20[3] = &unk_1E5862740;
    id v25 = v13;
    id v21 = v11;
    v22 = self;
    id v23 = v15;
    id v24 = v12;
    [v24 getCloudScopedIdentifiersForLocalIdentifiers:v14 completionHandler:v20];
  }
  else if (v13)
  {
    (*((void (**)(id, uint64_t, id, void))v13 + 2))(v13, 1, v11, 0);
  }
}

void __129__PLDuplicateProcessor__processCloudScopedIdentifierFromLocalIdentifiers_localToCloudIdentifierMap_cplManager_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
    [*(id *)(a1 + 40) _processCloudScopedIdentifierFromLocalIdentifiers:*(void *)(a1 + 48) localToCloudIdentifierMap:*(void *)(a1 + 32) cplManager:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    v6 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Failed to get scoped identifiers for asset merge. Error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_processCloudScopedIdentifiersFromAssetUUIDS:(id)a3 library:(id)a4 completionHandler:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isCloudPhotoLibraryEnabled])
  {
    id v11 = [v9 libraryServicesManager];
    id v12 = [v11 cloudPhotoLibraryManager];

    if (v12)
    {
      id v20 = 0;
      id v13 = [(PLDuplicateProcessor *)self _fetchCloudIdentifiersFromAssetUUIDs:v8 library:v9 error:&v20];
      id v14 = v20;
      if (v13)
      {
        id v15 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
        [(PLDuplicateProcessor *)self _processCloudScopedIdentifierFromLocalIdentifiers:v15 localToCloudIdentifierMap:0 cplManager:v12 completionHandler:v10];
      }
      else if (v10)
      {
        (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v14);
      }
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F8C500];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = @"cloudPhotolibraryManager missing for CPL enabled SPL";
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v14 = [v16 errorWithDomain:v17 code:49402 userInfo:v18];

      uint64_t v19 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v14;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Unable to access cloud library manager for asset merge. Error: %@", buf, 0xCu);
      }

      if (v10) {
        (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v14);
      }
    }
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, 1, 0, 0);
  }
}

- (id)_processContainersAssetUUIDS:(id)a3 library:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v7 count];
  id v9 = [v7 allObjects];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8 >> 1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PLDuplicateProcessor__processContainersAssetUUIDS_library___block_invoke;
  v17[3] = &unk_1E5862140;
  unint64_t v22 = v8;
  uint64_t v23 = 100;
  id v18 = v9;
  uint64_t v19 = self;
  id v20 = v6;
  id v11 = v10;
  id v21 = v11;
  id v12 = v6;
  id v13 = v9;
  [v12 performBlockAndWait:v17];
  id v14 = v21;
  id v15 = v11;

  return v15;
}

void __61__PLDuplicateProcessor__processContainersAssetUUIDS_library___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 64))
  {
    uint64_t v2 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x19F38D3B0]();
      unint64_t v3 = *(void *)(a1 + 64);
      uint64_t v4 = *(void *)(a1 + 72) + v2 <= v3 ? *(void *)(a1 + 72) : v3 - v2;
      uint64_t v24 = v2;
      uint64_t v20 = v4;
      unint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v2, v4);
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:");
      id v6 = *(void **)(a1 + 40);
      id v29 = 0;
      id v21 = (void *)v5;
      id v7 = objc_msgSend(v6, "_fetchAssetsFromUUIDs:library:error:");
      id v19 = v29;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
      if (v9) {
        break;
      }
LABEL_20:
      uint64_t v2 = v20 + v24;

      id v18 = [*(id *)(a1 + 48) managedObjectContext];
      [v18 reset];

      if ((unint64_t)(v20 + v24) >= *(void *)(a1 + 64)) {
        return;
      }
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
LABEL_8:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      id v14 = objc_msgSend(v13, "duplicateAlbum", v19);
      id v15 = [v14 objectID];
      if (v15) {
        break;
      }
      uint64_t v16 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v13 uuid];
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v17;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Duplicate asset %{public}@ is missing a duplicate album reference", buf, 0xCu);
LABEL_17:
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
        if (!v10) {
          goto LABEL_20;
        }
        goto LABEL_8;
      }
    }
    uint64_t v16 = [*(id *)(a1 + 56) objectForKeyedSubscript:v15];
    if (!v16)
    {
      uint64_t v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(a1 + 56) setObject:v16 forKeyedSubscript:v15];
    }
    uint64_t v17 = [v13 uuid];
    [v16 addObject:v17];
    goto LABEL_17;
  }
}

- (id)_processAlbumGroupingFromAssets:(id)a3 localIdentifierToCloudIdentifiers:(id)a4 library:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = objc_alloc_init(v10);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke;
  id v21 = &unk_1E5875BF8;
  id v22 = v8;
  uint64_t v23 = self;
  id v24 = v12;
  id v25 = v9;
  id v13 = v9;
  id v14 = v12;
  id v15 = v8;
  [v11 performBlockAndWait:&v18];

  uint64_t v16 = objc_msgSend(v14, "allValues", v18, v19, v20, v21);

  return v16;
}

void __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke_2;
  v4[3] = &unk_1E5862AA0;
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  [v2 enumerateObjectsUsingBlock:v4];
}

void __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke_2(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _isAssetValidForMerge:v3];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v23[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v7 = [v5 _duplicateAlbumsFromAssets:v6];
    id v8 = [v7 firstObject];

    id v9 = [v8 objectID];
    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
      if (!v10)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];
      }
      id v11 = [PLDuplicateAsset alloc];
      id v12 = *(void **)(a1 + 48);
      id v13 = [v3 cloudAssetGUID];
      id v14 = [v12 objectForKeyedSubscript:v13];
      id v15 = [(PLDuplicateAsset *)v11 initWithAsset:v3 cloudScopedIdentifier:v14 enableEXIFDataAccess:*(unsigned __int8 *)(*(void *)(a1 + 32) + 48)];

      [v10 addObject:v15];
    }
    else
    {
      uint64_t v16 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v3 uuid];
        *(_DWORD *)buf = 138543362;
        id v22 = v17;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Duplicate asset %{public}@ is not part of a duplicate album", buf, 0xCu);
      }
      uint64_t v18 = *(void **)(a1 + 32);
      id v10 = [v3 uuid];
      id v20 = v10;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      [v18 _inFlightMergeAssetsRemoveUUIDs:v15];
    }
  }
  else
  {
    id v8 = [v3 uuid];
    uint64_t v19 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v5 _inFlightMergeAssetsRemoveUUIDs:v9];
  }
}

- (BOOL)_processMergeGroup:(id)a3 processedAssetCount:(unint64_t *)a4 skippedAssetCount:(unint64_t *)a5 processedAssetCountAfterSave:(unint64_t *)a6 library:(id)a7 error:(id *)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = [a3 allObjects];
  uint64_t v16 = (void *)[v15 mutableCopy];

  [v16 sortUsingComparator:&__block_literal_global_156];
  if (!v16)
  {
    uint64_t v31 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = 0;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: merge sort failure. Error: %@", buf, 0xCu);
    }

    id v32 = 0;
    goto LABEL_17;
  }
  uint64_t v17 = [v16 objectAtIndexedSubscript:0];
  if ((unint64_t)[v16 count] < 2)
  {
    ++*a5;
    id v29 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [v17 shortDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = (uint64_t)v33;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: skipped single asset merge : %{public}@", buf, 0xCu);
    }
    id v27 = 0;
    goto LABEL_14;
  }
  v41 = self;
  uint64_t v18 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v40 = a6;
    uint64_t v19 = v17;
    id v20 = v14;
    id v21 = a8;
    uint64_t v22 = [v16 count];
    uint64_t v23 = [v16 objectAtIndexedSubscript:0];
    id v24 = [v23 shortDescription];
    *(_DWORD *)buf = 134218242;
    uint64_t v44 = v22;
    a8 = v21;
    id v14 = v20;
    uint64_t v17 = v19;
    a6 = v40;
    __int16 v45 = 2114;
    v46 = v24;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: merging %tu assets using target asset %{public}@", buf, 0x16u);
  }
  id v25 = [v17 assetObjectID];
  id v42 = 0;
  BOOL v26 = +[PLDuplicateMerge mergeAssets:v16 targetAssetOID:v25 photolibrary:v14 error:&v42];
  id v27 = v42;

  uint64_t v28 = [v16 count];
  if (v26)
  {
    *a4 += v28;
    *a6 += [v16 count];
    id v29 = PLDuplicateDetectionGetLog();
    self = v41;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v17 shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = (uint64_t)v30;
      __int16 v45 = 2114;
      v46 = @"YES";
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: completed merge to target asset %{public}@. Success: %{public}@", buf, 0x16u);
    }
LABEL_14:
    char v34 = 1;
    goto LABEL_15;
  }
  *a5 += v28;
  int HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();
  id v29 = PLDuplicateDetectionGetLog();
  BOOL v39 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
  self = v41;
  if (HasDomainAndCode)
  {
    if (v39)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = (uint64_t)v27;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: skipped merge - not ready. Error: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (v39)
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v44 = (uint64_t)v27;
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: merge failure. Error: %@", buf, 0xCu);
  }
  char v34 = 0;
LABEL_15:

  id v35 = [v16 valueForKey:@"assetUUID"];
  [(PLDuplicateProcessor *)self _inFlightMergeAssetsRemoveUUIDs:v35];

  id v32 = v27;
  if (v34)
  {
    BOOL v36 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (a8)
  {
    id v32 = v32;
    BOOL v36 = 0;
    *a8 = v32;
  }
  else
  {
    BOOL v36 = 0;
  }
LABEL_20:

  return v36;
}

uint64_t __124__PLDuplicateProcessor__processMergeGroup_processedAssetCount_skippedAssetCount_processedAssetCountAfterSave_library_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 enabledMergeComparison:1];
}

- (BOOL)_processMergeGroupContainer:(id)a3 processedAssetCount:(unint64_t *)a4 skippedAssetCount:(unint64_t *)a5 library:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  uint64_t v35 = 0;
  BOOL v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__687;
  uint64_t v33 = __Block_byref_object_dispose__688;
  id v34 = 0;
  id v14 = [[PLDuplicateMergeCrashRecovery alloc] initWithPhotoLibrary:v13];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __104__PLDuplicateProcessor__processMergeGroupContainer_processedAssetCount_skippedAssetCount_library_error___block_invoke;
  v21[3] = &unk_1E5862118;
  id v24 = &v35;
  v21[4] = self;
  id v27 = a4;
  uint64_t v28 = a5;
  id v25 = v39;
  id v15 = v13;
  id v22 = v15;
  BOOL v26 = &v29;
  uint64_t v16 = v14;
  uint64_t v23 = v16;
  [v12 enumerateObjectsUsingBlock:v21];
  LODWORD(v13) = *((unsigned __int8 *)v36 + 24);
  id v17 = (id)v30[5];
  uint64_t v18 = v17;
  if (!v13 && a7) {
    *a7 = v17;
  }

  char v19 = *((unsigned char *)v36 + 24);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);

  return v19;
}

void __104__PLDuplicateProcessor__processMergeGroupContainer_processedAssetCount_skippedAssetCount_library_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8) + 24;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(v8 + 8);
  id obj = *(id *)(v12 + 40);
  char v13 = [v10 _processMergeGroup:a2 processedAssetCount:v6 skippedAssetCount:v7 processedAssetCountAfterSave:v9 library:v11 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(void *)(v14 + 24) >= 0x65uLL)
    {
      *(void *)(v14 + 24) = 0;
      id v15 = [*(id *)(a1 + 40) managedObjectContext];
      uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
      id v20 = *(id *)(v16 + 40);
      int v17 = [v15 save:&v20];
      objc_storeStrong((id *)(v16 + 40), v20);

      if (v17)
      {
        [*(id *)(a1 + 48) removeCrashRecoveryMarkerFileWithError:0];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        uint64_t v18 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v19;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: merge save failure. Error: %@", buf, 0xCu);
        }
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)_processMergeAssets:(id)a3 localIdentifierMap:(id)a4 library:(id)a5 error:(id *)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 1;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__687;
  v49 = __Block_byref_object_dispose__688;
  id v50 = 0;
  id obj = 0;
  BOOL v13 = [(PLDuplicateProcessor *)self _isValidSharedLibraryStateWithLibrary:v12 error:&obj];
  objc_storeStrong(&v50, obj);
  if (v13)
  {
    uint64_t v14 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v10 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: start merge processing for %tu asset", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v16 = (void *)MEMORY[0x19F38D3B0]();
    int v17 = [(PLDuplicateProcessor *)self _processAlbumGroupingFromAssets:v10 localIdentifierToCloudIdentifiers:v11 library:v12];
    if (v17)
    {
      uint64_t v18 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v17 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: merging %tu duplicate groups", (uint8_t *)&buf, 0xCu);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v58 = 0x2020000000;
      uint64_t v59 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v43[3] = 0;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke;
      v36[3] = &unk_1E5874368;
      BOOL v39 = &v51;
      v36[4] = self;
      id v37 = v17;
      p_long long buf = &buf;
      v41 = v43;
      id v38 = v12;
      id v42 = &v45;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke_2;
      v31[3] = &unk_1E5871E08;
      id v32 = v38;
      uint64_t v33 = &buf;
      id v34 = v43;
      uint64_t v35 = &v51;
      [v32 performTransactionAndWait:v36 completionHandler:v31];

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      *((unsigned char *)v52 + 24) = 0;
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56 = @"Duplicate merge album grouping failed to identify groups";
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x1E4F8C500] code:49404 userInfo:v22];
      uint64_t v24 = (void *)v46[5];
      v46[5] = v23;

      id v25 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = v46[5];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v26;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Album grouping failure. Error: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    int v27 = *((unsigned __int8 *)v52 + 24);
    id v28 = (id)v46[5];
    uint64_t v29 = v28;
    if (!v27 && a6) {
      *a6 = v28;
    }

    BOOL v20 = *((unsigned char *)v52 + 24) != 0;
  }
  else
  {
    BOOL v20 = 0;
    if (a6) {
      *a6 = (id) v46[5];
    }
  }
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v20;
}

void __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8) + 24;
  uint64_t v6 = *(void *)(a1[9] + 8) + 24;
  uint64_t v7 = *(void *)(a1[10] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v2 _processMergeGroupContainer:v3 processedAssetCount:v5 skippedAssetCount:v6 library:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v8;
}

void __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[PLDuplicateMergeCrashRecovery alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
  [(PLDuplicateMergeCrashRecovery *)v2 removeCrashRecoveryMarkerFileWithError:0];
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  [v3 reset];

  uint64_t v4 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    char v8 = v7;
    int v9 = 134218498;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: completed merge, processed %tu, skipped: %tu. Success: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (BOOL)_processMergeAlbumAssetOIDMap:(id)a3 localIdentifierMap:(id)a4 library:(id)a5 error:(id *)a6
{
  id v38 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v39 = a4;
  id v10 = a5;
  __int16 v11 = [v9 allKeys];
  uint64_t v12 = (void *)[v11 copy];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
  v43 = v13;
  if (v15)
  {
    uint64_t v16 = v15;
    id v42 = v10;
    int v17 = 0;
    uint64_t v18 = *(void *)v49;
    BOOL v19 = 1;
    id v40 = v9;
    while (2)
    {
      uint64_t v20 = 0;
      uint64_t v41 = v16;
      do
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v14);
        }
        id v21 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v48 + 1) + 8 * v20), v38);
        [v13 unionSet:v21];

        if ((unint64_t)[v13 count] >= 0x65)
        {
          id v22 = v14;
          uint64_t v23 = (void *)MEMORY[0x19F38D3B0]();
          id v47 = v17;
          uint64_t v24 = [(PLDuplicateProcessor *)self _fetchAssetsFromUUIDs:v13 library:v42 error:&v47];
          id v25 = v47;

          if (v24)
          {
            id v46 = v25;
            BOOL v26 = [(PLDuplicateProcessor *)self _processMergeAssets:v24 localIdentifierMap:v39 library:v42 error:&v46];
            id v27 = v46;

            id v25 = v27;
          }
          else
          {
            BOOL v26 = 0;
          }
          id v13 = v43;
          [v43 removeAllObjects];

          BOOL v19 = v26;
          if (!v26)
          {
            id v14 = v22;

            int v17 = v25;
            id v9 = v40;
            id v10 = v42;
            goto LABEL_17;
          }
          int v17 = v25;
          id v14 = v22;
          id v9 = v40;
          uint64_t v16 = v41;
        }
        ++v20;
      }
      while (v16 != v20);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v16) {
        continue;
      }
      break;
    }

    id v10 = v42;
    if (!v19) {
      goto LABEL_17;
    }
  }
  else
  {

    int v17 = 0;
  }
  if (!objc_msgSend(v13, "count", v38))
  {
    id v28 = v17;
    BOOL v29 = 1;
    goto LABEL_27;
  }
  id v30 = v13;
  id v31 = v14;
  id v32 = (void *)MEMORY[0x19F38D3B0]();
  id v45 = v17;
  uint64_t v33 = [(PLDuplicateProcessor *)self _fetchAssetsFromUUIDs:v30 library:v10 error:&v45];
  id v34 = v45;

  if (!v33)
  {
    int v17 = v34;
    id v14 = v31;
LABEL_17:
    id v28 = v17;
    goto LABEL_18;
  }
  id v44 = v34;
  BOOL v35 = [(PLDuplicateProcessor *)self _processMergeAssets:v33 localIdentifierMap:v39 library:v10 error:&v44];
  id v36 = v44;

  id v28 = v36;
  if (v35)
  {
    BOOL v29 = 1;
    id v14 = v31;
    goto LABEL_27;
  }
  id v14 = v31;
LABEL_18:
  if (v38)
  {
    id v28 = v28;
    BOOL v29 = 0;
    *id v38 = v28;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_27:

  return v29;
}

- (void)mergeDuplicateAssetsWithAssetUUIDs:(id)a3 completionHandler:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__687;
  v43 = __Block_byref_object_dispose__688;
  id v44 = 0;
  if ([v6 count])
  {
    char v8 = (id *)(v40 + 5);
    id obj = (id)v40[5];
    BOOL v9 = [(PLDuplicateProcessor *)self _isMergeFeatureEnabled:&obj];
    objc_storeStrong(v8, obj);
    if (v9)
    {
      id v10 = [(PLDuplicateProcessor *)self _photoLibrary];
      __int16 v11 = (id *)(v40 + 5);
      id v37 = (id)v40[5];
      BOOL v12 = [(PLDuplicateProcessor *)self _isValidSharedLibraryStateWithLibrary:v10 error:&v37];
      objc_storeStrong(v11, v37);
      if (v12)
      {
        id v13 = [v10 libraryBundle];
        int v14 = PLIsCloudPhotoLibraryDisableInProgressForPhotoLibraryBundle(v13);

        if (v14)
        {
          uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v49 = *MEMORY[0x1E4F28568];
          long long v50 = @"Cannot merge duplicates during iCPL disable";
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x1E4F8C500] code:49409 userInfo:v16];
          uint64_t v18 = (void *)v40[5];
          v40[5] = v17;
        }
        else
        {
          if ((PLIsAssetsd() & 1) != 0 || (PLIsInternalTool() & 1) != 0 || MEMORY[0x19F38C0C0]())
          {
            uint64_t v23 = [v10 managedObjectContext];
            [v23 setNonCoalescing:1];

            if (self->_enableEXIFDataAccess) {
              self->_enableEXIFDataAccess = !+[PLDuplicateDetector duplicateDetectorCompletedDateBackgroundMigrationAction:v10];
            }
            uint64_t v24 = PLDuplicateDetectionGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              if (self->_enableEXIFDataAccess) {
                id v25 = @"YES";
              }
              else {
                id v25 = @"NO";
              }
              BOOL v26 = v25;
              *(_DWORD *)long long buf = 138543362;
              long long v48 = v26;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_INFO, "Duplicate Merge Processing: enableEXIFDataAccess: %{public}@", buf, 0xCu);
            }
            id v27 = [v6 allObjects];
            [(PLDuplicateProcessor *)self _inFlightMergeAssetsAddUUIDs:v27];

            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke;
            v32[3] = &unk_1E58620F0;
            v32[4] = self;
            id v33 = v6;
            id v34 = v10;
            id v36 = &v39;
            id v35 = v7;
            [(PLDuplicateProcessor *)self _processCloudScopedIdentifiersFromAssetUUIDS:v33 library:v34 completionHandler:v32];

            goto LABEL_22;
          }
          id v28 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          id v46 = @"processing duplicates needs to be performed on the service";
          BOOL v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          uint64_t v30 = [v28 errorWithDomain:*MEMORY[0x1E4F8C500] code:41005 userInfo:v29];
          id v31 = (void *)v40[5];
          v40[5] = v30;
        }
      }
      if (v7) {
        (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v40[5]);
      }
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {
    BOOL v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"Missing asset identifiers required for merge";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    uint64_t v21 = [v19 errorWithDomain:*MEMORY[0x1E4F8C500] code:49403 userInfo:v20];
    id v22 = (void *)v40[5];
    v40[5] = v21;
  }
  if (v7) {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v40[5]);
  }
LABEL_23:
  _Block_object_dispose(&v39, 8);
}

void __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    BOOL v9 = +[PLConcurrencyLimiter sharedLimiter];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke_2;
    v14[3] = &unk_1E58643C0;
    id v10 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v10;
    id v16 = *(id *)(a1 + 48);
    id v17 = v7;
    long long v13 = *(_OWORD *)(a1 + 56);
    id v11 = (id)v13;
    long long v18 = v13;
    [v9 async:v14 identifyingBlock:0 library:0];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v8);
    }
  }
}

void __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = [*(id *)(a1 + 32) _processContainersAssetUUIDS:*(void *)(a1 + 40) library:*(void *)(a1 + 48)];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v3 _processMergeAlbumAssetOIDMap:v2 localIdentifierMap:v4 library:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  id v8 = *(void **)(a1 + 32);
  BOOL v9 = [*(id *)(a1 + 40) allObjects];
  [v8 _inFlightMergeAssetsRemoveUUIDs:v9];

  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, v7, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (BOOL)assetsArePendingForDuplicateMergeProcessing:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    p_inFlightMergeLock = &self->_inFlightMergeLock;
    os_unfair_lock_lock(&self->_inFlightMergeLock);
    char v6 = [(NSMutableSet *)self->_inFlightMergeAssetUuids intersectsSet:v4];
    os_unfair_lock_unlock(p_inFlightMergeLock);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isMerging
{
  uint64_t v2 = self;
  p_inFlightMergeLock = &self->_inFlightMergeLock;
  os_unfair_lock_lock(&self->_inFlightMergeLock);
  LOBYTE(v2) = [(NSMutableSet *)v2->_inFlightMergeAssetUuids count] != 0;
  os_unfair_lock_unlock(p_inFlightMergeLock);
  return (char)v2;
}

- (id)_duplicateAlbumsFromAssets:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = objc_msgSend(v10, "albums", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v16 isDuplicateAlbum] && (objc_msgSend(v16, "isDeleted") & 1) == 0)
              {
                [v4 addObject:v16];
                goto LABEL_17;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  id v17 = [v4 allObjects];

  return v17;
}

- (BOOL)_insertIntoDuplicateAlbum:(id)a3 assets:(id)a4 duplicateType:(signed __int16)a5 photoLibrary:(id)a6 error:(id *)a7
{
  uint64_t v9 = a5;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = v11;
  if (v11
    || (+[PLDuplicateAlbum insertIntoPhotoLibrary:v13],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v14 addAssets:v12 type:v9];
    [v14 sortAssets];
    PFMap();
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v16 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v12 count];
      if (v11) {
        long long v18 = @"e";
      }
      else {
        long long v18 = @"n";
      }
      long long v19 = [v14 uuid];
      long long v20 = [(__CFString *)v15 componentsJoinedByString:@","];
      int v31 = 134218754;
      uint64_t v32 = v17;
      __int16 v33 = 2114;
      id v34 = v18;
      __int16 v35 = 2114;
      id v36 = v19;
      __int16 v37 = 2114;
      id v38 = v20;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: Added %tu assets to duplicate album [%{public}@/%{public}@], assets:[%{public}@]", (uint8_t *)&v31, 0x2Au);
    }
    BOOL v21 = 1;
  }
  else
  {
    long long v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F8C500];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40[0] = @"Unable to create duplicate album";
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    long long v26 = [v23 errorWithDomain:v24 code:49404 userInfo:v25];

    id v27 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      int v31 = 138543618;
      uint64_t v32 = (uint64_t)v29;
      __int16 v33 = 2112;
      id v34 = v26;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to create a new duplicate album: %{public}@. Error: %@", (uint8_t *)&v31, 0x16u);
    }
    uint64_t v30 = v26;
    id v15 = v30;
    if (a7)
    {
      id v15 = v30;
      BOOL v21 = 0;
      *a7 = v15;
      uint64_t v14 = v15;
    }
    else
    {
      BOOL v21 = 0;
      uint64_t v14 = v30;
    }
  }

  return v21;
}

uint64_t __90__PLDuplicateProcessor__insertIntoDuplicateAlbum_assets_duplicateType_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _compactDebugDescription];
}

- (BOOL)_moveDuplicateAlbumAssestFromAlbums:(id)a3 toTargetAlbum:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6
{
  unsigned int v40 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 count] < 2)
  {
    id v13 = 0;
LABEL_30:
    id v33 = v13;
    BOOL v34 = 1;
    goto LABEL_31;
  }
  if (v9)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v37 = v8;
    uint64_t v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v36 = a6;
      id v13 = 0;
      uint64_t v14 = *(void *)v43;
      id v38 = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isEqual:", v9, v36) & 1) == 0)
          {
            uint64_t v17 = [v16 assets];
            uint64_t v18 = [v17 count];

            if (v18)
            {
              long long v19 = PLDuplicateDetectionGetLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                long long v20 = [v16 uuid];
                *(_DWORD *)long long buf = 134218242;
                uint64_t v49 = v18;
                __int16 v50 = 2114;
                uint64_t v51 = v20;
                _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: Relocating %tu matching assets from album: %{public}@", buf, 0x16u);
              }
              if (v40 == 1)
              {
                BOOL v21 = PLDuplicateDetectionGetLog();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  long long v22 = [@"PLDuplicateTypeMetadata" substringFromIndex:objc_msgSend(@"PLDuplicateType", "length")];
                  *(_DWORD *)long long buf = 138543362;
                  uint64_t v49 = (uint64_t)v22;
                  _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Duplicate Processing: Duplicate assets from detector %{public}@ is associated with multiple albums", buf, 0xCu);
                }
              }
              long long v23 = [v16 assets];
              uint64_t v24 = [v23 array];
              id v41 = v13;
              id v25 = v9;
              BOOL v26 = [(PLDuplicateProcessor *)self _insertIntoDuplicateAlbum:v9 assets:v24 duplicateType:v40 photoLibrary:0 error:&v41];
              id v27 = v41;

              if (!v26)
              {
                a6 = v36;
                id v8 = v37;
                int v31 = v38;
                id v9 = v25;
                goto LABEL_25;
              }
              [v16 delete];
              id v13 = v27;
              uint64_t v10 = v38;
              id v9 = v25;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v13 = 0;
    }

    id v8 = v37;
    goto LABEL_30;
  }
  id v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = *MEMORY[0x1E4F8C500];
  uint64_t v46 = *MEMORY[0x1E4F28568];
  id v47 = @"Missing target album required for duplicate asset relocation";
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  id v27 = [v28 errorWithDomain:v29 code:49404 userInfo:v30];

  int v31 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v49 = (uint64_t)v27;
    _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Duplicate Processing: target album not specified for asset relocation. Error: %@", buf, 0xCu);
  }
LABEL_25:

  id v32 = v27;
  id v33 = v32;
  if (a6)
  {
    id v33 = v32;
    BOOL v34 = 0;
    *a6 = v33;
  }
  else
  {
    BOOL v34 = 0;
  }
LABEL_31:

  return v34;
}

- (id)_fetchAssetOIDsForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__687;
  long long v19 = __Block_byref_object_dispose__688;
  id v20 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PLDuplicateProcessor__fetchAssetOIDsForPhotoLibrary_error___block_invoke;
  v10[3] = &unk_1E5873DC0;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = &v15;
  uint64_t v14 = a4;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __61__PLDuplicateProcessor__fetchAssetOIDsForPhotoLibrary_error___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setResultType:1];
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v30[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v4 setSortDescriptors:v6];

  id v7 = (void *)MEMORY[0x1E4F8B9B0];
  id v8 = [*(id *)(a1 + 32) managedObjectContext];
  id v9 = [v7 startedQueryStatsWithContext:v8];

  uint64_t v10 = [*(id *)(a1 + 32) managedObjectContext];
  id v23 = 0;
  uint64_t v11 = [v10 executeFetchRequest:v4 error:&v23];
  uint64_t v12 = (__CFString *)v23;
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v11;

  uint64_t v15 = objc_msgSend(v9, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count"));
  if (v15)
  {
    id v16 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      *(_DWORD *)long long buf = 138412802;
      id v25 = v18;
      __int16 v26 = 2112;
      id v27 = @"Duplicate Processing: Fetch asset oids";
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v19 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = (objc_class *)objc_opt_class();
      BOOL v21 = NSStringFromClass(v20);
      *(_DWORD *)long long buf = 138543618;
      id v25 = v21;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);
    }
    long long v22 = *(void **)(a1 + 56);
    if (v22) {
      void *v22 = v12;
    }
  }
}

- (id)_fetchAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[PLManagedAsset entityName];
  uint64_t v11 = [v7 fetchRequestWithEntityName:v10];

  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v8];

  [v11 setPredicate:v12];
  v35[0] = @"albums";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  [v11 setRelationshipKeyPathsForPrefetching:v13];

  uint64_t v14 = (void *)MEMORY[0x1E4F8B9B0];
  uint64_t v15 = [v9 managedObjectContext];
  id v16 = [v14 startedQueryStatsWithContext:v15];

  uint64_t v17 = [v9 managedObjectContext];

  id v28 = 0;
  uint64_t v18 = [v17 executeFetchRequest:v11 error:&v28];
  long long v19 = (__CFString *)v28;

  id v20 = objc_msgSend(v16, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v18, "count"));
  if (v20)
  {
    BOOL v21 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      id v32 = @"Duplicate Processing: Fetch assets";
      __int16 v33 = 2112;
      BOOL v34 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (!v18)
  {
    uint64_t v24 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = (objc_class *)objc_opt_class();
      __int16 v26 = NSStringFromClass(v25);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v30 = v26;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);
    }
    if (a5) {
      *a5 = v19;
    }
  }

  return v18;
}

- (BOOL)_processedRemoveExclusionGroupAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[PLManagedAsset entityName];
  uint64_t v11 = [v7 fetchRequestWithEntityName:v10];

  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v8];

  [v11 setPredicate:v12];
  id v20 = 0;
  int v13 = [(id)objc_opt_class() _removeAssetsFromDuplicateAlbumUsingFetchRequest:v11 library:v9 error:&v20];

  id v14 = v20;
  uint64_t v15 = PLDuplicateDetectionGetLog();
  id v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Duplicate Processing: Removed excluded asset from duplicate albums", buf, 2u);
    }

    id v17 = v14;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to remove excluded assets from duplicate albums. Error: %@", buf, 0xCu);
    }

    id v18 = v14;
    if (a5) {
      *a5 = v18;
    }
  }

  return v13;
}

- (id)_processedDuplicateAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 duplicateType:(signed __int16)a5 associatedDuplicateAlbum:(id *)a6 error:(id *)a7
{
  uint64_t v9 = a5;
  id v32 = 0;
  uint64_t v11 = [(PLDuplicateProcessor *)self _fetchAssetsWithPhotoLibrary:a3 assetObjectIDs:a4 error:&v32];
  id v12 = v32;
  if (v11)
  {
    int v13 = (void *)[v11 mutableCopy];
    id v14 = [(PLDuplicateProcessor *)self _duplicateAlbumsFromAssets:v13];
    uint64_t v15 = [v14 firstObject];
    if (v15)
    {
      id v31 = v12;
      BOOL v16 = [(PLDuplicateProcessor *)self _moveDuplicateAlbumAssestFromAlbums:v14 toTargetAlbum:v15 duplicateType:v9 error:&v31];
      id v29 = v31;

      if (!v16)
      {
        char v18 = 0;
        id v17 = (id)MEMORY[0x1E4F1CBF0];
        id v12 = v29;
        goto LABEL_19;
      }
      if (v9 == 1) {
        [v15 metadataMatchingAssets];
      }
      else {
      long long v19 = [v15 perceptualMatchingAssets];
      }
      id v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v13];
      BOOL v21 = [v19 filteredSetUsingPredicate:v20];
      uint64_t v22 = [v21 count];

      if (v22 == [v13 count]) {
        [v13 removeAllObjects];
      }

      id v12 = v29;
    }
    if ([v13 count])
    {
      id v17 = v13;
    }
    else
    {
      uint64_t v23 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "Duplicate Processing: no new duplicate assets added, skipping", buf, 2u);
      }

      id v17 = (id)MEMORY[0x1E4F1CBF0];
    }
    char v18 = 1;
LABEL_19:

    if (!a6) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v15 = 0;
  id v17 = 0;
  char v18 = 0;
  if (a6) {
LABEL_20:
  }
    *a6 = v15;
LABEL_21:
  id v24 = v12;
  id v25 = v24;
  if (a7) {
    char v26 = v18;
  }
  else {
    char v26 = 1;
  }
  if ((v26 & 1) == 0) {
    *a7 = v24;
  }

  id v27 = v17;
  return v27;
}

- (BOOL)_processedDuplicateAssetSubGroupWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v23 = 0;
  id v24 = 0;
  uint64_t v11 = [(PLDuplicateProcessor *)self _processedDuplicateAssetsWithPhotoLibrary:v10 assetObjectIDs:a4 duplicateType:v7 associatedDuplicateAlbum:&v24 error:&v23];
  id v12 = v24;
  id v13 = v23;
  id v14 = v13;
  if (!v11)
  {
    id v17 = v13;
    if (a6) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v18 = 0;
    goto LABEL_12;
  }
  if (![v11 count])
  {
    long long v19 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v12 uuid];
      *(_DWORD *)long long buf = 138543362;
      char v26 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: no new assets to add to duplicate album %{public}@", buf, 0xCu);
    }
    id v17 = v14;
    goto LABEL_11;
  }
  id v22 = v14;
  BOOL v15 = [(PLDuplicateProcessor *)self _insertIntoDuplicateAlbum:v12 assets:v11 duplicateType:v7 photoLibrary:v10 error:&v22];
  id v16 = v22;

  id v17 = v16;
  if (v15)
  {
LABEL_11:
    BOOL v18 = 1;
    goto LABEL_12;
  }
  if (!a6) {
    goto LABEL_7;
  }
LABEL_5:
  id v17 = v17;
  BOOL v18 = 0;
  *a6 = v17;
LABEL_12:

  return v18;
}

- (BOOL)_detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:(id)a3 detector:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6
{
  v48[2] = *(id *)MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!v12)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLDuplicateProcessor.m", 340, @"Invalid parameter not satisfying: %@", @"detector" object file lineNumber description];
  }
  id v13 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (objc_class *)objc_opt_class();
    BOOL v15 = NSStringFromClass(v14);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: detecting duplicates with detector: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__687;
  id v47 = __Block_byref_object_dispose__688;
  v48[0] = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  id obj = 0;
  id v16 = [v12 detectDuplicatesWithPhotoLibrary:v11 error:&obj];
  objc_storeStrong(v48, obj);
  if (v16)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke;
    v30[3] = &unk_1E5865188;
    id v17 = v16;
    BOOL v34 = &v38;
    id v31 = v17;
    id v32 = self;
    signed __int16 v36 = a5;
    id v33 = v11;
    p_long long buf = &buf;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    void v28[2] = __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke_74;
    v28[3] = &unk_1E5875CE0;
    id v29 = v33;
    [v29 performTransactionAndWait:v30 completionHandler:v28];
    if (![v17 count])
    {
      BOOL v18 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = (objc_class *)objc_opt_class();
        id v20 = NSStringFromClass(v19);
        *(_DWORD *)long long v42 = 138412290;
        long long v43 = v20;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: completed for %@ with no matches detected", v42, 0xCu);
      }
    }

    if (*((unsigned char *)v39 + 24))
    {
      id v21 = *(id *)(*((void *)&buf + 1) + 40);
      goto LABEL_18;
    }
  }
  else
  {
    *((unsigned char *)v39 + 24) = 0;
  }
  id v22 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = *(void **)(*((void *)&buf + 1) + 40);
    *(_DWORD *)long long v42 = 138412290;
    long long v43 = v23;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Duplicate Processing: failed. Error: %@", v42, 0xCu);
  }

  int v24 = *((unsigned __int8 *)v39 + 24);
  id v21 = *(id *)(*((void *)&buf + 1) + 40);
  if (!v24 && a6)
  {
    id v21 = v21;
    *a6 = v21;
  }
LABEL_18:

  BOOL v25 = *((unsigned char *)v39 + 24) != 0;
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&buf, 8);

  return v25;
}

void __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v41;
    uint64_t v30 = *(void *)v41;
LABEL_3:
    uint64_t v6 = 0;
    uint64_t v31 = v4;
    while (1)
    {
      if (*(void *)v41 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v40 + 1) + 8 * v6);
      if ([v7 hasSubGroups])
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v8 = [v7 subGroups];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          id v11 = v2;
          uint64_t v12 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v37 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              BOOL v15 = *(void **)(a1 + 40);
              uint64_t v16 = *(void *)(a1 + 48);
              uint64_t v17 = *(__int16 *)(a1 + 72);
              uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
              id obj = *(id *)(v18 + 40);
              char v19 = [v15 _processedDuplicateAssetSubGroupWithPhotoLibrary:v16 assetObjectIDs:v14 duplicateType:v17 error:&obj];
              objc_storeStrong((id *)(v18 + 40), obj);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v19;
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v10);
          id v2 = v11;
          uint64_t v5 = v30;
          uint64_t v4 = v31;
        }
      }
      else
      {
        id v20 = [v7 group];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          id v22 = *(void **)(a1 + 40);
          uint64_t v23 = *(void *)(a1 + 48);
          id v8 = [v7 group];
          uint64_t v24 = *(__int16 *)(a1 + 72);
          uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
          id v34 = *(id *)(v25 + 40);
          LOBYTE(v22) = [v22 _processedDuplicateAssetSubGroupWithPhotoLibrary:v23 assetObjectIDs:v8 duplicateType:v24 error:&v34];
          objc_storeStrong((id *)(v25 + 40), v34);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v22;
        }
        else
        {
          id v8 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Duplicate Processing: No new duplicate assets to add. Processing exclusion assets", buf, 2u);
          }
        }
      }

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
        && [v7 hasExcludedItems])
      {
        char v26 = *(void **)(a1 + 40);
        uint64_t v27 = *(void *)(a1 + 48);
        id v28 = [v7 excludedGroup];
        uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
        id v32 = *(id *)(v29 + 40);
        LOBYTE(v26) = [v26 _processedRemoveExclusionGroupAssetsWithPhotoLibrary:v27 assetObjectIDs:v28 error:&v32];
        objc_storeStrong((id *)(v29 + 40), v32);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v26;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        break;
      }
      if (++v6 == v4)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke_74(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managedObjectContext];
  [v1 refreshAllObjects];
}

- (BOOL)_processDuplicatesWithPhotoLibrary:(id)a3 processingType:(unint64_t)a4 assetObjectIds:(id)a5 error:(id *)a6
{
  char v8 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F8BA00] start];
  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
  if (PLIsInternalTool())
  {
    id v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v14 = [v13 BOOLForKey:@"com.apple.Photos.backend.disableFingerprintDuplicateProcessing"];

    if (v14)
    {
      BOOL v15 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: metadata matching disabled via defaults: com.apple.Photos.backend.disableFingerprintDuplicateProcessing", buf, 2u);
      }

LABEL_7:
      uint64_t v16 = 0;
      if ((v8 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  uint64_t v46 = v12;
  id v47 = a6;
  uint64_t v18 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: metadata duplicate matching", buf, 2u);
  }

  char v19 = [MEMORY[0x1E4F8BA00] start];
  id v20 = v11;
  uint64_t v21 = [[PLDuplicateDetectorMetadata alloc] initWithSourceOIDs:v11];
  id v49 = 0;
  uint64_t v45 = self;
  id v22 = self;
  id v23 = v10;
  BOOL v24 = [(PLDuplicateProcessor *)v22 _detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:v10 detector:v21 duplicateType:1 error:&v49];
  id v17 = v49;
  uint64_t v25 = [v19 stop];
  char v26 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v19 perfCheckLogStringWithPerfCheckInfo:v25];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v51 = v27;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: metadata matching completed%@", buf, 0xCu);
  }
  if (!v24)
  {
    BOOL v37 = 0;
    id v10 = v23;
    goto LABEL_30;
  }
  uint64_t v16 = v17;
  id v10 = v23;
  id v11 = v20;
  uint64_t v12 = v46;
  a6 = v47;
  self = v45;
  if ((v8 & 2) == 0)
  {
LABEL_8:
    id v17 = v16;
    if ((v8 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v46 = v12;
  id v47 = a6;
  id v28 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: exact pixel matching", buf, 2u);
  }

  uint64_t v29 = [MEMORY[0x1E4F8BA00] start];
  id v20 = v11;
  uint64_t v30 = [[PLDuplicateDetectorExactPixel alloc] initWithSourceOIDs:v11];
  id v48 = v16;
  BOOL v31 = [(PLDuplicateProcessor *)self _detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:v10 detector:v30 duplicateType:2 error:&v48];
  id v17 = v48;

  id v32 = [v29 stop];
  id v33 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = [v29 perfCheckLogStringWithPerfCheckInfo:v32];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v51 = v34;
    _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: exact pixel matching completed%@", buf, 0xCu);
  }
  if (v31)
  {
    id v11 = v20;
    uint64_t v12 = v46;
    a6 = v47;
    if ((v8 & 4) == 0)
    {
LABEL_27:
      BOOL v37 = 1;
      goto LABEL_31;
    }
LABEL_22:
    __int16 v35 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: similar matching", buf, 2u);
    }

    long long v36 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: Similar pixel matching currently unsupported", buf, 2u);
    }

    goto LABEL_27;
  }
  BOOL v37 = 0;
LABEL_30:
  id v11 = v20;
  uint64_t v12 = v46;
  a6 = v47;
LABEL_31:
  long long v38 = [v12 stop];
  long long v39 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    long long v40 = [v12 perfCheckLogStringWithPerfCheckInfo:v38];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v51 = v40;
    _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: completed%@", buf, 0xCu);
  }
  id v41 = v17;
  long long v42 = v41;
  if (a6) {
    char v43 = v37;
  }
  else {
    char v43 = 1;
  }
  if ((v43 & 1) == 0) {
    *a6 = v41;
  }

  return v37;
}

- (id)_buildInterruptBatchFromStartingOIDs:(id)a3 library:(id)a4
{
  id v6 = a4;
  id v7 = [a3 sortedArrayUsingComparator:&__block_literal_global_819];
  char v8 = [v6 managedObjectContext];

  uint64_t v9 = [(PLDuplicateProcessor *)self _resumeInterruptMarker];
  id v10 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v8, v9);

  uint64_t v11 = [v7 indexOfObject:v10];
  uint64_t v12 = v7;
  if (v11)
  {
    uint64_t v12 = v7;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = objc_msgSend(v7, "subarrayWithRange:", v11, objc_msgSend(v7, "count") - v11);
    }
  }

  return v12;
}

uint64_t __69__PLDuplicateProcessor__buildInterruptBatchFromStartingOIDs_library___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_resumeInterruptMarker
{
  id v2 = [(PLDuplicateProcessor *)self _appPrivateData];
  uint64_t v3 = [v2 valueForKey:@"DuplicateProcessingLibraryInterruptMarker"];

  return v3;
}

- (void)_setInterruptMarker:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 URIRepresentation];
    id v7 = [v6 description];
  }
  else
  {
    id v7 = 0;
  }
  char v8 = [(PLDuplicateProcessor *)self _appPrivateData];
  id v12 = 0;
  char v9 = [v8 setValue:v7 forKey:@"DuplicateProcessingLibraryInterruptMarker" error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to set the interrupt marker. Error: %@", buf, 0xCu);
    }
  }
}

- (BOOL)_batchEnumerateOrGenerateAssetObjectIdsFromStartingAssetOIDs:(id)a3 library:(id)a4 error:(id *)a5 continuationHandler:(id)a6 processingBatchBlock:(id)a7
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = (uint64_t (**)(void))a6;
  id v47 = (uint64_t (**)(id, id, id *))a7;
  id v15 = v12;
  if ([v15 count])
  {
    if (v14 && (unint64_t)[v15 count] >= 0x5DD)
    {
      uint64_t v16 = (void *)MEMORY[0x19F38D3B0]();
      id v17 = [(PLDuplicateProcessor *)self _buildInterruptBatchFromStartingOIDs:v15 library:v13];

      id v18 = 0;
    }
    else
    {
      id v18 = 0;
      id v17 = v15;
    }
  }
  else
  {
    char v19 = (void *)MEMORY[0x19F38D3B0]();
    id v55 = 0;
    id v20 = [(PLDuplicateProcessor *)self _fetchAssetOIDsForPhotoLibrary:v13 error:&v55];
    id v18 = v55;
    if (!v20)
    {
      id v17 = v15;
      goto LABEL_43;
    }
    unint64_t v21 = [v20 count];
    if (v21 >= 0x5DD) {
      id v22 = v20;
    }
    else {
      id v22 = 0;
    }
    id v17 = v22;

    if (v14 && v21 >= 0x5DD)
    {
      uint64_t v23 = [(PLDuplicateProcessor *)self _buildInterruptBatchFromStartingOIDs:v17 library:v13];

      id v17 = (id)v23;
    }
  }
  if ((unint64_t)[v17 count] <= 0x5DC)
  {
    id v54 = v18;
    BOOL v24 = [(PLDuplicateProcessor *)self _isValidSharedLibraryStateWithLibrary:v13 error:&v54];
    id v25 = v54;

    if (v24)
    {
      id v53 = v25;
      char v26 = v47[2](v47, v17, &v53);
      id v27 = v53;

      id v28 = v27;
      if (v26) {
        goto LABEL_41;
      }
      goto LABEL_17;
    }
    id v18 = v25;
LABEL_43:
    id v28 = v18;
    if (a5) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
  __int16 v50 = self;
  uint64_t v30 = [v17 count];
  if (v30)
  {
    unint64_t v31 = v30;
    id v48 = v13;
    id v49 = v17;
    char v43 = a5;
    id v44 = v15;
    unint64_t v32 = 0;
    uint64_t v46 = *MEMORY[0x1E4F8C500];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    while (1)
    {
      id v33 = (void *)MEMORY[0x19F38D3B0]();
      if (v32 + 1500 <= v31) {
        uint64_t v34 = 1500;
      }
      else {
        uint64_t v34 = v31 - v32;
      }
      __int16 v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v32, v34);
      long long v36 = [v49 objectsAtIndexes:v35];
      if (v14 && (v14[2](v14) & 1) == 0)
      {
        long long v39 = [v36 objectAtIndexedSubscript:0];
        [(PLDuplicateProcessor *)v50 _setInterruptMarker:v39];

        long long v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v56 = v45;
        v57[0] = @"Duplicate processing was cancelled";
        id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
        id v38 = [v40 errorWithDomain:v46 code:49406 userInfo:v41];

        int v37 = 0;
      }
      else
      {
        id v52 = v18;
        int v37 = -[PLDuplicateProcessor _isValidSharedLibraryStateWithLibrary:error:](v50, "_isValidSharedLibraryStateWithLibrary:error:", v48, &v52, v43, v44);
        id v38 = v52;

        if (v37)
        {
          id v51 = v38;
          int v37 = v47[2](v47, v36, &v51);
          id v18 = v51;

          v32 += v34;
          goto LABEL_30;
        }
      }
      id v18 = v38;
LABEL_30:

      if (!v37 || v32 >= v31)
      {
        if (v14 && ((v37 ^ 1) & 1) == 0) {
          [(PLDuplicateProcessor *)v50 _setInterruptMarker:0];
        }
        id v28 = v18;
        id v13 = v48;
        id v17 = v49;
        a5 = v43;
        id v15 = v44;
        if (v37) {
          goto LABEL_41;
        }
LABEL_17:
        if (a5)
        {
LABEL_18:
          id v28 = v28;
          BOOL v29 = 0;
          *a5 = v28;
          goto LABEL_45;
        }
LABEL_44:
        BOOL v29 = 0;
        goto LABEL_45;
      }
    }
  }
  if (v14) {
    [(PLDuplicateProcessor *)self _setInterruptMarker:0];
  }
  id v28 = v18;
LABEL_41:
  BOOL v29 = 1;
LABEL_45:

  return v29;
}

- (BOOL)processDuplicatesOfAssetObjectIds:(id)a3 processingType:(unint64_t)a4 error:(id *)a5 continuationHandler:(id)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (PLIsAssetsd() & 1) != 0 || (PLIsInternalTool() & 1) != 0 || (MEMORY[0x19F38C0C0]())
  {
    p_processingLock = &self->_processingLock;
    os_unfair_lock_lock(&self->_processingLock);
    uint64_t v13 = [(PLDuplicateProcessor *)self _photoLibrary];
    id v14 = [v10 allObjects];
    unint64_t v26 = a4;
    id v27 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __99__PLDuplicateProcessor_processDuplicatesOfAssetObjectIds_processingType_error_continuationHandler___block_invoke;
    v24[3] = &unk_1E58620A8;
    v24[4] = self;
    id v25 = (id)v13;
    id v15 = (id)v13;
    LOBYTE(v13) = [(PLDuplicateProcessor *)self _batchEnumerateOrGenerateAssetObjectIdsFromStartingAssetOIDs:v14 library:v15 error:&v27 continuationHandler:v11 processingBatchBlock:v24];
    id v16 = v27;

    os_unfair_lock_unlock(p_processingLock);
    id v17 = v16;
    if (v13)
    {
      BOOL v18 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    char v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F8C500];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"processing duplicates needs to be performed on the service";
    unint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v22 = [v19 errorWithDomain:v20 code:41005 userInfo:v21];

    id v17 = v22;
  }
  if (a5)
  {
    id v17 = v17;
    BOOL v18 = 0;
    *a5 = v17;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_10:

  return v18;
}

uint64_t __99__PLDuplicateProcessor_processDuplicatesOfAssetObjectIds_processingType_error_continuationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _processDuplicatesWithPhotoLibrary:*(void *)(a1 + 40) processingType:*(void *)(a1 + 48) assetObjectIds:a2 error:a3];
}

- (BOOL)_isValidSharedLibraryStateWithLibrary:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[PLDuplicateProcessor isExitingSharedLibraryForLibrary:a3];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F8C500];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Duplicate processing shared library is exiting";
    char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    char v9 = [v6 errorWithDomain:v7 code:49406 userInfo:v8];

    if (a4) {
      *a4 = v9;
    }
  }
  return !v5;
}

- (id)_appPrivateData
{
  return (id)[(PLLazyObject *)self->_lazyAppPrivateData objectValue];
}

- (id)_photoLibrary
{
  uint64_t v3 = [(PLDuplicateProcessor *)self unitTestLibrary];
  if (v3)
  {
    id v4 = [(PLDuplicateProcessor *)self unitTestLibrary];
  }
  else
  {
    BOOL v5 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    id v4 = objc_msgSend(v5, "newShortLivedLibraryWithName:", objc_msgSend(v7, "UTF8String"));
  }
  return v4;
}

- (PLDuplicateProcessor)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PLDuplicateProcessor;
  id v6 = [(PLDuplicateProcessor *)&v28 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lsm, a3);
    v7->_processingLock._os_unfair_lock_opaque = 0;
    char v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    inFlightMergeAssetUuids = v7->_inFlightMergeAssetUuids;
    v7->_inFlightMergeAssetUuids = v8;

    v7->_inFlightMergeLock._os_unfair_lock_opaque = 0;
    id v10 = objc_initWeak(location, v7);

    id v11 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __55__PLDuplicateProcessor_initWithLibraryServicesManager___block_invoke;
    BOOL v24 = &unk_1E5870860;
    objc_copyWeak(&v26, location);
    id v12 = v5;
    id v25 = v12;
    uint64_t v13 = [v11 initWithBlock:&v21];

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
    lazyAppPrivateData = v7->_lazyAppPrivateData;
    v7->_lazyAppPrivateData = (PLLazyObject *)v13;

    v7->_enableEXIFDataAccess = 1;
    uint64_t v15 = PLIsReallyAssetsd();
    if ((v15 & 1) == 0 && !MEMORY[0x19F38C0C0](v15, v16, v17, v18)) {
      goto LABEL_5;
    }
    if (!+[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:](PLDuplicateProcessor, "isDuplicateProcessorEnabledForLibraryServicesManager:", v12, v21, v22, v23, v24))
    {
LABEL_5:
      char v19 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Duplicate Processing: invalid platform or library", (uint8_t *)location, 2u);
      }

      id v7 = 0;
    }
  }

  return v7;
}

id __55__PLDuplicateProcessor_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F8B858];
    id v4 = [*(id *)(a1 + 32) pathManager];
    id v5 = [v4 libraryURL];
    id v6 = [v3 appPrivateDataForLibraryURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:(id)a3 cplConfiguration:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1E4F8B980];
  char v9 = [v6 pathManager];
  id v10 = [v9 libraryURL];
  LODWORD(v8) = [v8 isSystemPhotoLibraryURL:v10];

  if (v8)
  {
    uint64_t v11 = [v7 valueForKey:@"feature.version.duplicateprocessorsharedlibrary"];
    if (v11) {
      id v12 = (void *)v11;
    }
    else {
      id v12 = &unk_1EEBECCD8;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F8B858];
    id v14 = [v6 pathManager];
    uint64_t v15 = [v14 libraryURL];
    uint64_t v16 = [v13 appPrivateDataForLibraryURL:v15];

    uint64_t v17 = [v16 valueForKey:@"DuplicateSharedLibraryCPLConfigurationFeatureVersion"];
    if (v17)
    {
LABEL_13:
      unsigned int v29 = [v12 unsignedIntValue];
      if (v29 <= [v17 unsignedIntValue])
      {
        long long v39 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315650;
          id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
          __int16 v55 = 2114;
          uint64_t v56 = v12;
          __int16 v57 = 2114;
          uint64_t v58 = (uint64_t)v17;
          _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "%s: Server feature version is %{public}@ and persisted feature version is %{public}@. No-op since server version is lower or equal to persisted", buf, 0x20u);
        }
        goto LABEL_32;
      }
      if (![v12 unsignedIntValue])
      {
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v30 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315650;
        id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        __int16 v55 = 2114;
        uint64_t v56 = v12;
        __int16 v57 = 2114;
        uint64_t v58 = (uint64_t)v17;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "%s: Server feature version is %{public}@ and persisted feature version is %{public}@. Going to remove all duplicate shared library assets since since server version is higher than persisted", buf, 0x20u);
      }

      id v51 = 0;
      int v31 = [a1 removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:v6 error:&v51];
      id v32 = v51;
      id v33 = PLDuplicateDetectionGetLog();
      uint64_t v34 = v33;
      if (v31)
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_DWORD *)long long buf = 136315138;
        id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        __int16 v35 = "%s: Successfully removed all duplicate shared library assets";
        long long v36 = v34;
        os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
        uint32_t v38 = 12;
      }
      else
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_DWORD *)long long buf = 136315394;
        id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        __int16 v55 = 2112;
        uint64_t v56 = v32;
        __int16 v35 = "%s: Failed to remove all duplicate shared library assets. Error: %@";
        long long v36 = v34;
        os_log_type_t v37 = OS_LOG_TYPE_ERROR;
        uint32_t v38 = 22;
      }
      _os_log_impl(&dword_19B3C7000, v36, v37, v35, buf, v38);
LABEL_25:

      id v50 = 0;
      int v40 = [v16 setValue:v12 forKey:@"DuplicateSharedLibraryCPLConfigurationFeatureVersion" error:&v50];
      long long v39 = v50;
      id v41 = PLDuplicateDetectionGetLog();
      long long v42 = v41;
      if (v40)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          char v43 = [v6 libraryServicesManager];
          uint64_t v44 = [v43 wellKnownPhotoLibraryIdentifier];
          *(_DWORD *)long long buf = 136315650;
          id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
          __int16 v55 = 2114;
          uint64_t v56 = v17;
          __int16 v57 = 2048;
          uint64_t v58 = v44;
          uint64_t v45 = "%s: Updating shared library enable marker %{public}@ for library identifier: %td";
          uint64_t v46 = v42;
          os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
          uint32_t v48 = 32;
LABEL_30:
          _os_log_impl(&dword_19B3C7000, v46, v47, v45, buf, v48);
        }
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        char v43 = [v6 libraryServicesManager];
        uint64_t v49 = [v43 wellKnownPhotoLibraryIdentifier];
        *(_DWORD *)long long buf = 136315906;
        id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        __int16 v55 = 2114;
        uint64_t v56 = v17;
        __int16 v57 = 2048;
        uint64_t v58 = v49;
        __int16 v59 = 2112;
        uint64_t v60 = v39;
        uint64_t v45 = "%s: Failed to update shared library enable marker %{public}@ for library identifier: %td. Error: %@";
        uint64_t v46 = v42;
        os_log_type_t v47 = OS_LOG_TYPE_ERROR;
        uint32_t v48 = 42;
        goto LABEL_30;
      }

LABEL_32:
      goto LABEL_33;
    }
    id v52 = 0;
    int v18 = [v16 setValue:&unk_1EEBECCD8 forKey:@"DuplicateSharedLibraryCPLConfigurationFeatureVersion" error:&v52];
    char v19 = v52;
    uint64_t v20 = PLDuplicateDetectionGetLog();
    uint64_t v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v6 libraryServicesManager];
        uint64_t v23 = [v22 wellKnownPhotoLibraryIdentifier];
        *(_DWORD *)long long buf = 136315650;
        id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        __int16 v55 = 2114;
        uint64_t v56 = &unk_1EEBECCD8;
        __int16 v57 = 2048;
        uint64_t v58 = v23;
        BOOL v24 = "%s: Setting the initial shared library enable marker %{public}@ for library identifier: %td";
        id v25 = v21;
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        uint32_t v27 = 32;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v25, v26, v24, buf, v27);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v6 libraryServicesManager];
      uint64_t v28 = [v22 wellKnownPhotoLibraryIdentifier];
      *(_DWORD *)long long buf = 136315906;
      id v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
      __int16 v55 = 2114;
      uint64_t v56 = &unk_1EEBECCD8;
      __int16 v57 = 2048;
      uint64_t v58 = v28;
      __int16 v59 = 2112;
      uint64_t v60 = v19;
      BOOL v24 = "%s: Failed to set the initial shared library enable marker %{public}@ for library identifier: %td. Error: %@";
      id v25 = v21;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 42;
      goto LABEL_11;
    }

    uint64_t v17 = &unk_1EEBECCD8;
    goto LABEL_13;
  }
LABEL_34:
}

+ (BOOL)sharedLibraryDedupeEnabledWithPathManager:(id)a3
{
  id v3 = a3;
  if ([v3 isSystemPhotoLibraryPathManager])
  {
    id v4 = (void *)MEMORY[0x1E4F8B858];
    id v5 = [v3 libraryURL];
    id v6 = [v4 appPrivateDataForLibraryURL:v5];

    id v7 = [v6 valueForKey:@"DuplicateSharedLibraryCPLConfigurationFeatureVersion"];
    char v8 = v7;
    if (v7) {
      BOOL v9 = [v7 unsignedIntValue] == 0;
    }
    else {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)_removeAssetsFromDuplicateAlbumUsingFetchRequest:(id)a3 library:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000;
  os_log_type_t v26 = __Block_byref_object_copy__687;
  uint32_t v27 = __Block_byref_object_dispose__688;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PLDuplicateProcessor__removeAssetsFromDuplicateAlbumUsingFetchRequest_library_error___block_invoke;
  v17[3] = &unk_1E586C338;
  id v10 = v9;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  uint64_t v20 = &v23;
  uint64_t v21 = &v29;
  id v22 = a1;
  [v10 performTransactionAndWait:v17];
  int v12 = *((unsigned __int8 *)v30 + 24);
  id v13 = (id)v24[5];
  id v14 = v13;
  if (!v12 && a5) {
    *a5 = v13;
  }

  char v15 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

void __87__PLDuplicateProcessor__removeAssetsFromDuplicateAlbumUsingFetchRequest_library_error___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F8B9B0];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [v2 startedQueryStatsWithContext:v3];

  v25[0] = @"albums";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [*(id *)(a1 + 40) setRelationshipKeyPathsForPrefetching:v5];

  id v6 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  id v10 = objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v9, "count"));
  if (v10)
  {
    id v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = @"Duplicate Processing: Remove assets from duplicate album";
      __int16 v23 = 2112;
      BOOL v24 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (v9)
  {
    [v9 enumerateObjectsUsingBlock:&__block_literal_global_108];
  }
  else
  {
    id v14 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      char v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = *(__CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v17;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __87__PLDuplicateProcessor__removeAssetsFromDuplicateAlbumUsingFetchRequest_library_error___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  [v2 removeFromDuplicateAlbum];
  id v3 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [v2 uuid];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Duplicate Processing: Removing asset [%{public}@] from duplicate album", (uint8_t *)&v5, 0xCu);
  }
}

+ (BOOL)removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:(id)a3 error:(id *)a4
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  uint64_t v8 = +[PLManagedAsset entityName];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  id v10 = (void *)MEMORY[0x1E4F28BA0];
  id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
  v25[0] = v11;
  int v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", 1);
  v25[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v14 = [v10 andPredicateWithSubpredicates:v13];
  [v9 setPredicate:v14];

  id v22 = 0;
  int v15 = [a1 _removeAssetsFromDuplicateAlbumUsingFetchRequest:v9 library:v7 error:&v22];

  id v16 = v22;
  uint64_t v17 = PLDuplicateDetectionGetLog();
  id v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "Duplicate Processing: Removed all duplicate shared library assets from duplicate albums", buf, 2u);
    }

    id v19 = v16;
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v16;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to remove all duplicate shared library assets from duplicate albums. Error: %@", buf, 0xCu);
    }

    id v20 = v16;
    if (a4) {
      *a4 = v20;
    }
  }

  return v15;
}

+ (void)signalBackgroundJobServiceDuplicateProcessingWithLibrary:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 libraryServicesManager];
  if (+[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:v4])
  {
    int v5 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v4 libraryBundle];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Registering duplicate detection activity on library bundle %@", (uint8_t *)&v8, 0xCu);
    }
    id v7 = [v4 backgroundJobService];
    [v7 signalBackgroundProcessingNeededOnLibrary:v3];
  }
}

+ (BOOL)isExitingSharedLibraryForLibrary:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PLDuplicateProcessor_isExitingSharedLibraryForLibrary___block_invoke;
  v7[3] = &unk_1E5875E68;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __57__PLDuplicateProcessor_isExitingSharedLibraryForLibrary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v2];

  if ([v3 exitState] - 1 <= 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

+ (BOOL)isDuplicateProcessorEnabledForLibraryServicesManager:(id)a3
{
  id v3 = a3;
  if (MEMORY[0x19F38C0C0]() & 1) != 0 || (PLIsInternalTool())
  {
    BOOL v4 = 1;
  }
  else if (v3)
  {
    BOOL v4 = (unint64_t)[v3 wellKnownPhotoLibraryIdentifier] < 2;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end