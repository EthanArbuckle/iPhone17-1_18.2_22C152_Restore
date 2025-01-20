@interface PLBackgroundJobDuplicateDetectorWorker
+ (BOOL)_isTokenInvalidError:(id)a3;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
- (BOOL)_hasCompletedPerceptualProcessingWithLibrary:(id)a3;
- (BOOL)_isFullLibraryWorkItem:(id)a3;
- (BOOL)_processDuplicatesWithLimitedSelection:(id)a3 requiresFingerprintDedupe:(BOOL)a4 library:(id)a5 error:(id *)a6 continuationHandler:(id)a7;
- (BOOL)_shouldCancelCurrentWorkItem:(id)a3;
- (BOOL)isInterruptible;
- (NSCopying)cancelledWorkItem;
- (id)_convertToPLManagedAssetOIDsFromSelectionOIDs:(id)a3 library:(id)a4;
- (id)_lastDuplicateDetectorProcessingTokenFromLibrary:(id)a3;
- (id)_managedAssetOIDsFromAdditionalAssetAttributesOIDs:(id)a3 library:(id)a4;
- (id)_managedAssetOIDsFromDuplicateAlbumOIDs:(id)a3 library:(id)a4;
- (id)_transactionIteratorSinceTokenIfValid:(id)a3 library:(id)a4 error:(id *)a5;
- (id)_validObjectIDFromChange:(id)a3 entityDescriptionMap:(id)a4 isCPLEnabled:(BOOL)a5 requiresFingerprintDedupe:(BOOL *)a6;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)_resetCancelledWorkItem;
- (void)_resetTokenIfRequiredFromLibrary:(id)a3;
- (void)_setLastDuplicateDetectorProcessingToken:(id)a3 isCompleted:(BOOL)a4 library:(id)a5;
- (void)_setTokenMarkerWithPrivateData:(id)a3 value:(BOOL)a4 wellKnownIdentifier:(int64_t)a5;
- (void)_setupPropertiesWithLibrary:(id)a3;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)setCancelledWorkItem:(id)a3;
- (void)stopWorkingOnItem:(id)a3;
@end

@implementation PLBackgroundJobDuplicateDetectorWorker

+ (BOOL)_isTokenInvalidError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 code];
  BOOL v5 = v4 == 134501 || v4 == 134301;
  if (v5
    && ([v3 domain],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F281F8]],
        v6,
        (v7 & 1) != 0))
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Persistent history transaction iterator error was unrecognized: %@", (uint8_t *)&v11, 0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelledWorkItem, 0);
  objc_storeStrong((id *)&self->_duplicateAlbumPropertiesToInclude, 0);
  objc_storeStrong((id *)&self->_managedAssetPropertiesToInclude, 0);
  objc_storeStrong((id *)&self->_additionalAttributesPropertiesToIncludeForMetadataProcessing, 0);
  objc_storeStrong((id *)&self->_additionalAttributesPropertiesToInclude, 0);
}

- (void)setCancelledWorkItem:(id)a3
{
}

- (NSCopying)cancelledWorkItem
{
  return (NSCopying *)objc_getProperty(self, a2, 136, 1);
}

- (id)_transactionIteratorSinceTokenIfValid:(id)a3 library:(id)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = [a4 managedObjectContext];
  id v15 = 0;
  v9 = +[PLPersistentHistoryTransactionIterator iteratorSinceToken:v7 withManagedObjectObjectContext:v8 error:&v15];

  id v10 = v15;
  id v11 = v10;
  id v12 = v11;
  if (v9) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = a5 == 0;
  }
  if (!v13) {
    *a5 = v11;
  }

  return v9;
}

- (void)_setLastDuplicateDetectorProcessingToken:(id)a3 isCompleted:(BOOL)a4 library:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v15 = 138543618;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: saving token %{public}@ to library %@", (uint8_t *)&v15, 0x16u);
  }

  id v10 = [v8 globalValues];
  [v10 setLastDuplicateDetectorProcessingToken:v7];

  if (v7)
  {
    if (v6)
    {
      id v11 = [v8 globalValues];
      char v12 = [v11 isInitialDuplicateDetectorProcessingCompleted];

      if ((v12 & 1) == 0)
      {
        BOOL v13 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v15 = 138543618;
          id v16 = v7;
          __int16 v17 = 2112;
          id v18 = v8;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: saving completed initial processing token %{public}@ to library %@", (uint8_t *)&v15, 0x16u);
        }

        v14 = [v8 globalValues];
        [v14 setLastInitialDuplicateDetectorProcessingCompletedToken:v7];
      }
    }
  }
}

- (id)_lastDuplicateDetectorProcessingTokenFromLibrary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 globalValues];
  uint64_t v4 = [v3 lastDuplicateDetectorProcessingToken];

  BOOL v5 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Duplicate Detector Worker: last history token is %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)_setTokenMarkerWithPrivateData:(id)a3 value:(BOOL)a4 wellKnownIdentifier:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v7 = NSNumber;
  id v8 = a3;
  uint64_t v9 = [v7 numberWithBool:v6];
  id v21 = 0;
  int v10 = [v8 setValue:v9 forKey:@"DuplicateSharedLibraryEnabledMarker" error:&v21];

  id v11 = v21;
  char v12 = PLDuplicateDetectionGetLog();
  BOOL v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = @"NO";
      if (v6) {
        v14 = @"YES";
      }
      int v15 = v14;
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      __int16 v24 = 2048;
      int64_t v25 = a5;
      id v16 = "Duplicate Detector Worker: Setting the initial enable marker %{public}@ for library identifier: %td";
      __int16 v17 = v13;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      uint32_t v19 = 22;
LABEL_10:
      _os_log_impl(&dword_19B3C7000, v17, v18, v16, buf, v19);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v20 = @"NO";
    if (v6) {
      v20 = @"YES";
    }
    int v15 = v20;
    *(_DWORD *)buf = 138543874;
    v23 = v15;
    __int16 v24 = 2048;
    int64_t v25 = a5;
    __int16 v26 = 2112;
    id v27 = v11;
    id v16 = "Duplicate Detector Worker: Failed to set the initial enable marker %{public}@ for library identifier: %td. Error: %@";
    __int16 v17 = v13;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    uint32_t v19 = 32;
    goto LABEL_10;
  }
}

- (void)_resetTokenIfRequiredFromLibrary:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke;
  v7[3] = &unk_1E5875E18;
  id v8 = v4;
  uint64_t v9 = self;
  uint64_t v5 = _resetTokenIfRequiredFromLibrary__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&_resetTokenIfRequiredFromLibrary__onceToken, v7);
  }
}

void __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8B858];
  id v3 = [*(id *)(a1 + 32) pathManager];
  id v4 = [v3 libraryURL];
  uint64_t v5 = [v2 appPrivateDataForLibraryURL:v4];

  id v6 = [v5 valueForKey:@"DuplicateSharedLibraryEnabledMarker"];
  int v7 = [*(id *)(a1 + 32) pathManager];
  BOOL v8 = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:v7];

  if (v6)
  {
    int v9 = [v6 BOOLValue];
    int v10 = PLDuplicateDetectionGetLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8 == v9)
    {
      if (v11)
      {
        v22 = [*(id *)(a1 + 32) libraryServicesManager];
        *(_DWORD *)buf = 134217984;
        uint64_t v27 = [v22 wellKnownPhotoLibraryIdentifier];
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Duplicate Detector Worker: Matching enable marker for library identifier: %td", buf, 0xCu);
      }
    }
    else
    {
      if (v11)
      {
        char v12 = [*(id *)(a1 + 32) libraryServicesManager];
        *(_DWORD *)buf = 134217984;
        uint64_t v27 = [v12 wellKnownPhotoLibraryIdentifier];
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Duplicate Detector Worker: Resetting token due to enable marker mismatch for library identifier: %td", buf, 0xCu);
      }
      BOOL v13 = *(void **)(a1 + 32);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke_104;
      v24[3] = &unk_1E5875CE0;
      id v25 = v13;
      [v25 performBlockAndWait:v24];
      v14 = *(void **)(a1 + 40);
      int v15 = [*(id *)(a1 + 32) libraryServicesManager];
      objc_msgSend(v14, "_setTokenMarkerWithPrivateData:value:wellKnownIdentifier:", v5, v8, objc_msgSend(v15, "wellKnownPhotoLibraryIdentifier"));

      uint64_t v16 = *(void *)(a1 + 32);
      id v23 = 0;
      BOOL v17 = +[PLDuplicateProcessor removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:v16 error:&v23];
      id v18 = v23;
      if (!v17)
      {
        uint32_t v19 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = (uint64_t)v18;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Failed to remove Shared Library assets from duplicate albums. Error: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v20 = *(void **)(a1 + 40);
    id v21 = [*(id *)(a1 + 32) libraryServicesManager];
    objc_msgSend(v20, "_setTokenMarkerWithPrivateData:value:wellKnownIdentifier:", v5, v8, objc_msgSend(v21, "wellKnownPhotoLibraryIdentifier"));
  }
}

void __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke_104(uint64_t a1)
{
  v2 = [PLGlobalValues alloc];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [(PLGlobalValues *)v2 initWithManagedObjectContext:v3];

  [(PLGlobalValues *)v4 setLastDuplicateDetectorProcessingToken:0];
  [(PLGlobalValues *)v4 setLastInitialDuplicateDetectorProcessingCompletedToken:0];
}

- (void)_setupPropertiesWithLibrary:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = a3;
  id v6 = +[PLAdditionalAssetAttributes entityName];
  int v7 = [v5 managedObjectContext];
  id v38 = [v4 entityForName:v6 inManagedObjectContext:v7];

  BOOL v8 = [v38 attributesByName];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v10 = [v8 objectForKeyedSubscript:@"sceneAnalysisTimestamp"];
  [v9 addObject:v10];

  BOOL v11 = [v8 objectForKeyedSubscript:@"sceneAnalysisVersion"];
  [v9 addObject:v11];

  char v12 = [v8 objectForKeyedSubscript:@"originalStableHash"];
  [v9 addObject:v12];

  BOOL v13 = (NSSet *)[v9 copy];
  additionalAttributesPropertiesToInclude = self->_additionalAttributesPropertiesToInclude;
  self->_additionalAttributesPropertiesToInclude = v13;

  int v15 = [v8 objectForKeyedSubscript:@"sceneAnalysisVersion"];
  [v9 removeObject:v15];

  uint64_t v16 = (NSSet *)[v9 copy];
  additionalAttributesPropertiesToIncludeForMetadataProcessing = self->_additionalAttributesPropertiesToIncludeForMetadataProcessing;
  self->_additionalAttributesPropertiesToIncludeForMetadataProcessing = v16;

  [v9 removeAllObjects];
  id v18 = (void *)MEMORY[0x1E4F1C0A8];
  uint32_t v19 = +[PLManagedAsset entityName];
  v20 = [v5 managedObjectContext];
  id v21 = [v18 entityForName:v19 inManagedObjectContext:v20];

  v22 = [v21 attributesByName];
  id v23 = [v22 objectForKeyedSubscript:@"hidden"];
  [v9 addObject:v23];

  __int16 v24 = [v22 objectForKeyedSubscript:@"trashedState"];
  [v9 addObject:v24];

  id v25 = [v22 objectForKeyedSubscript:@"kindSubtype"];
  [v9 addObject:v25];

  __int16 v26 = [v22 objectForKeyedSubscript:@"adjustmentTimestamp"];
  [v9 addObject:v26];

  uint64_t v27 = [v22 objectForKeyedSubscript:@"activeLibraryScopeParticipationState"];
  [v9 addObject:v27];

  uint64_t v28 = (NSSet *)[v9 copy];
  managedAssetPropertiesToInclude = self->_managedAssetPropertiesToInclude;
  self->_managedAssetPropertiesToInclude = v28;

  [v9 removeAllObjects];
  v30 = (void *)MEMORY[0x1E4F1C0A8];
  v31 = +[PLDuplicateAlbum entityName];
  v32 = [v5 managedObjectContext];

  v33 = [v30 entityForName:v31 inManagedObjectContext:v32];

  v34 = [v33 attributesByName];
  v35 = [v34 objectForKeyedSubscript:@"processingVersion"];
  [v9 addObject:v35];

  v36 = (NSSet *)[v9 copy];
  duplicateAlbumPropertiesToInclude = self->_duplicateAlbumPropertiesToInclude;
  self->_duplicateAlbumPropertiesToInclude = v36;
}

- (BOOL)_hasCompletedPerceptualProcessingWithLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 globalValues];
  char v5 = [v4 isInitialDuplicateDetectorProcessingCompleted];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    int v7 = [v3 managedObjectContext];
    BOOL v8 = [v3 pathManager];
    BOOL v6 = +[PLDuplicateDetector duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:v7 pathManager:v8];
  }
  return v6;
}

- (BOOL)_isFullLibraryWorkItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isEqualToString:@"PLBackgroundJobDuplicateDetectorProcessEntireLibrary"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_managedAssetOIDsFromDuplicateAlbumOIDs:(id)a3 library:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    int v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
    BOOL v8 = (void *)MEMORY[0x1E4F1C0D0];
    id v9 = +[PLDuplicateAlbum entityName];
    int v10 = [v8 fetchRequestWithEntityName:v9];

    BOOL v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v5];
    [v10 setPredicate:v11];

    v27[0] = @"assets";
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v10 setRelationshipKeyPathsForPrefetching:v12];

    BOOL v13 = [v6 managedObjectContext];
    id v22 = 0;
    v14 = [v13 executeFetchRequest:v10 error:&v22];
    id v15 = v22;

    if (v14)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __90__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromDuplicateAlbumOIDs_library___block_invoke;
      v20[3] = &unk_1E5871D40;
      id v21 = v7;
      [v14 enumerateObjectsUsingBlock:v20];
      uint64_t v16 = v21;
    }
    else
    {
      uint64_t v16 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        BOOL v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543618;
        __int16 v24 = v18;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Failed to fetch oids for %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

void __90__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromDuplicateAlbumOIDs_library___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 assets];
  id v6 = [v3 valueForKey:@"objectID"];

  char v4 = *(void **)(a1 + 32);
  id v5 = [v6 array];
  [v4 addObjectsFromArray:v5];
}

- (id)_managedAssetOIDsFromAdditionalAssetAttributesOIDs:(id)a3 library:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    int v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
    BOOL v8 = (void *)MEMORY[0x1E4F1C0D0];
    id v9 = +[PLAdditionalAssetAttributes entityName];
    int v10 = [v8 fetchRequestWithEntityName:v9];

    BOOL v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v5];
    [v10 setPredicate:v11];

    v27[0] = @"asset";
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v10 setPropertiesToFetch:v12];

    [v10 setResultType:2];
    BOOL v13 = [v6 managedObjectContext];
    id v22 = 0;
    v14 = [v13 executeFetchRequest:v10 error:&v22];
    id v15 = v22;

    if (v14)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __101__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromAdditionalAssetAttributesOIDs_library___block_invoke;
      v20[3] = &unk_1E5871D18;
      id v21 = v7;
      [v14 enumerateObjectsUsingBlock:v20];
      uint64_t v16 = v21;
    }
    else
    {
      uint64_t v16 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        BOOL v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543618;
        __int16 v24 = v18;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Failed to fetch oids for %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

void __101__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromAdditionalAssetAttributesOIDs_library___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 allValues];
  [v2 addObjectsFromArray:v3];
}

- (id)_convertToPLManagedAssetOIDsFromSelectionOIDs:(id)a3 library:(id)a4
{
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1E4F1C0A8];
  id v8 = a3;
  id v9 = +[PLAdditionalAssetAttributes entityName];
  int v10 = [v6 managedObjectContext];
  BOOL v11 = [v7 entityForName:v9 inManagedObjectContext:v10];

  char v12 = (void *)MEMORY[0x1E4F1C0A8];
  BOOL v13 = +[PLManagedAsset entityName];
  v14 = [v6 managedObjectContext];
  id v15 = [v12 entityForName:v13 inManagedObjectContext:v14];

  uint64_t v16 = (void *)MEMORY[0x1E4F1C0A8];
  BOOL v17 = +[PLDuplicateAlbum entityName];
  id v18 = [v6 managedObjectContext];
  uint32_t v19 = [v16 entityForName:v17 inManagedObjectContext:v18];

  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  v37 = __96__PLBackgroundJobDuplicateDetectorWorker__convertToPLManagedAssetOIDsFromSelectionOIDs_library___block_invoke;
  id v38 = &unk_1E5871CF0;
  id v39 = v11;
  id v23 = v21;
  id v40 = v23;
  id v41 = v19;
  id v24 = v22;
  id v42 = v24;
  id v43 = v15;
  id v25 = v20;
  id v44 = v25;
  id v26 = v15;
  id v27 = v19;
  id v28 = v11;
  [v8 enumerateObjectsUsingBlock:&v35];

  v29 = -[PLBackgroundJobDuplicateDetectorWorker _managedAssetOIDsFromAdditionalAssetAttributesOIDs:library:](self, "_managedAssetOIDsFromAdditionalAssetAttributesOIDs:library:", v23, v6, v35, v36, v37, v38);
  if ([v29 count])
  {
    v30 = [v29 allObjects];
    [v25 addObjectsFromArray:v30];
  }
  v31 = [(PLBackgroundJobDuplicateDetectorWorker *)self _managedAssetOIDsFromDuplicateAlbumOIDs:v24 library:v6];

  if ([v31 count])
  {
    v32 = [v31 allObjects];
    [v25 addObjectsFromArray:v32];
  }
  id v33 = v25;

  return v33;
}

void __96__PLBackgroundJobDuplicateDetectorWorker__convertToPLManagedAssetOIDsFromSelectionOIDs_library___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 entity];
  int v5 = [v4 isEqual:a1[4]];

  if (v5)
  {
    id v6 = (void *)a1[5];
LABEL_7:
    [v6 addObject:v3];
    goto LABEL_8;
  }
  int v7 = [v3 entity];
  int v8 = [v7 isEqual:a1[6]];

  if (v8)
  {
    id v6 = (void *)a1[7];
    goto LABEL_7;
  }
  id v9 = [v3 entity];
  int v10 = [v9 isEqual:a1[8]];

  if (v10)
  {
    id v6 = (void *)a1[9];
    goto LABEL_7;
  }
  BOOL v11 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = [v3 entity];
    BOOL v13 = [v12 name];
    int v14 = 138543362;
    id v15 = v13;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Unexpected entity type for limited selection: %{public}@", (uint8_t *)&v14, 0xCu);
  }
LABEL_8:
}

- (BOOL)_processDuplicatesWithLimitedSelection:(id)a3 requiresFingerprintDedupe:(BOOL)a4 library:(id)a5 error:(id *)a6 continuationHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__94229;
  uint64_t v35 = __Block_byref_object_dispose__94230;
  id v36 = 0;
  if ([v12 count])
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __141__PLBackgroundJobDuplicateDetectorWorker__processDuplicatesWithLimitedSelection_requiresFingerprintDedupe_library_error_continuationHandler___block_invoke;
    v27[3] = &unk_1E5875368;
    v30 = &v31;
    v27[4] = self;
    id v28 = v12;
    id v29 = v13;
    [v29 performBlockAndWait:v27];
  }
  if (v10) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  uint64_t v16 = [(PLBackgroundJobWorker *)self libraryBundle];
  BOOL v17 = [v16 libraryServicesManager];
  id v18 = [v17 duplicateProcessor];
  uint64_t v19 = v32[5];
  id v26 = 0;
  char v20 = [v18 processDuplicatesOfAssetObjectIds:v19 processingType:v15 error:&v26 continuationHandler:v14];
  id v21 = v26;

  id v22 = v21;
  id v23 = v22;
  if (a6) {
    char v24 = v20;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0) {
    *a6 = v22;
  }

  _Block_object_dispose(&v31, 8);
  return v20;
}

void __141__PLBackgroundJobDuplicateDetectorWorker__processDuplicatesWithLimitedSelection_requiresFingerprintDedupe_library_error_continuationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _convertToPLManagedAssetOIDsFromSelectionOIDs:*(void *)(a1 + 40) library:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_validObjectIDFromChange:(id)a3 entityDescriptionMap:(id)a4 isCPLEnabled:(BOOL)a5 requiresFingerprintDedupe:(BOOL *)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 changedObjectID];
  uint64_t v13 = [v10 changeType];
  if (v13 != 1)
  {
    if (v13)
    {
      LOBYTE(v7) = 0;
    }
    else if (v7)
    {
      id v14 = [v12 entity];
      uint64_t v15 = +[PLAdditionalAssetAttributes entityName];
      uint64_t v16 = [v11 objectForKeyedSubscript:v15];
      int v7 = [v14 isEqual:v16];

      int v17 = v7;
      if (!a6) {
        goto LABEL_13;
      }
LABEL_12:
      *a6 = v7;
      goto LABEL_13;
    }
    int v17 = 0;
    if (!a6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v18 = [v12 entity];
  uint64_t v19 = +[PLAdditionalAssetAttributes entityName];
  char v20 = [v11 objectForKeyedSubscript:v19];
  if ([v18 isEqual:v20])
  {
    id v21 = [v10 updatedProperties];
    int v22 = [v21 intersectsSet:self->_additionalAttributesPropertiesToInclude];

    if (v22)
    {
      id v23 = [v10 updatedProperties];
      char v24 = [v23 intersectsSet:self->_additionalAttributesPropertiesToIncludeForMetadataProcessing];

      int v22 = 1;
      if (v24)
      {
        int v25 = 0;
LABEL_25:
        char v36 = 1;
        goto LABEL_30;
      }
    }
  }
  else
  {

    int v22 = 0;
  }
  id v28 = [v12 entity];
  id v29 = +[PLManagedAsset entityName];
  v30 = [v11 objectForKeyedSubscript:v29];
  id v41 = self;
  if ([v28 isEqual:v30])
  {
    uint64_t v31 = [v10 updatedProperties];
    v32 = self;
    int v33 = v22;
    v34 = v31;
    int v35 = [v31 intersectsSet:v32->_managedAssetPropertiesToInclude];

    int v22 = v33;
  }
  else
  {
    int v35 = 0;
  }

  if (v35)
  {
    int v25 = 0;
    int v22 = 1;
    goto LABEL_25;
  }
  v22 |= v35;
  v37 = [v12 entity];
  id v38 = +[PLDuplicateAlbum entityName];
  id v39 = [v11 objectForKeyedSubscript:v38];
  if ([v37 isEqual:v39])
  {
    id v40 = [v10 updatedProperties];
    int v25 = [v40 intersectsSet:v41->_duplicateAlbumPropertiesToInclude];
  }
  else
  {
    int v25 = 0;
  }

  char v36 = 0;
LABEL_30:
  LOBYTE(v7) = v36 | v25;
  int v17 = v25 | v22;
  if (a6) {
    goto LABEL_12;
  }
LABEL_13:
  if (v17) {
    id v26 = v12;
  }
  else {
    id v26 = 0;
  }

  return v26;
}

- (void)stopWorkingOnItem:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: %{public}@ stopWorkingOnItem: %p", (uint8_t *)&v8, 0x16u);
  }
  [(PLBackgroundJobDuplicateDetectorWorker *)self setCancelledWorkItem:v4];
}

- (BOOL)isInterruptible
{
  return 1;
}

- (BOOL)_shouldCancelCurrentWorkItem:(id)a3
{
  id v4 = a3;
  int v5 = [(PLBackgroundJobDuplicateDetectorWorker *)self cancelledWorkItem];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    int v7 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: current work item cancelled", v9, 2u);
    }
  }
  return v6;
}

- (void)_resetCancelledWorkItem
{
  uint64_t v3 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: reset cancelled work item", v4, 2u);
  }

  [(PLBackgroundJobDuplicateDetectorWorker *)self setCancelledWorkItem:0];
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLBackgroundJobDuplicateDetectorWorker.m", 103, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  uint64_t v12 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker performWorkOnItem: %p %@", buf, 0x16u);
  }

  [(PLBackgroundJobDuplicateDetectorWorker *)self _resetCancelledWorkItem];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v47 = __Block_byref_object_copy__94229;
  v48 = __Block_byref_object_dispose__94230;
  id v49 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  char v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__94229;
  v40[4] = __Block_byref_object_dispose__94230;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  char v13 = [v10 isCloudPhotoLibraryEnabled];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v28[3] = &unk_1E5871C50;
  v32 = v38;
  v28[4] = self;
  id v14 = v10;
  id v29 = v14;
  int v33 = v40;
  v34 = v42;
  id v15 = v9;
  id v30 = v15;
  id v16 = v11;
  id v31 = v16;
  int v35 = v44;
  char v36 = buf;
  char v37 = v13;
  [v14 performBlockAndWait:v28];
  if ([(PLBackgroundJobDuplicateDetectorWorker *)self _shouldCancelCurrentWorkItem:v15])
  {
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
  else
  {
    int v17 = +[PLConcurrencyLimiter sharedLimiter];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_54;
    v19[3] = &unk_1E5871CC8;
    v19[4] = self;
    id v20 = v15;
    id v21 = v14;
    id v23 = v42;
    char v24 = v40;
    int v25 = v38;
    id v26 = buf;
    id v27 = v44;
    id v22 = v16;
    [v17 async:v19 identifyingBlock:0 library:v21];
  }
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(buf, 8);
}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  v52[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = (uint64_t *)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = [*(id *)(a1 + 32) _hasCompletedPerceptualProcessingWithLibrary:*(void *)(a1 + 40)];
  id v4 = [*(id *)v2 _lastDuplicateDetectorProcessingTokenFromLibrary:*v3];
  id v5 = *(id *)v2;
  uint64_t v6 = *v3;
  id v47 = 0;
  uint64_t v7 = [v5 _transactionIteratorSinceTokenIfValid:v4 library:v6 error:&v47];
  id v8 = v47;
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    && [(id)objc_opt_class() _isTokenInvalidError:v8])
  {
    if (v4)
    {
      id v11 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: last duplicate processing token was non-null but invalid. Processing duplicates for the entire library.", (uint8_t *)&buf, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v46 = v8;
    uint64_t v14 = [v12 _transactionIteratorSinceTokenIfValid:0 library:v13 error:&v46];
    id v15 = v46;

    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v14;

    id v4 = 0;
    id v8 = v15;
  }
  if ([*(id *)(a1 + 32) _isFullLibraryWorkItem:*(void *)(a1 + 48)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                          + 24);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      [*(id *)(a1 + 32) _setupPropertiesWithLibrary:*(void *)(a1 + 40)];
      char v39 = +[PLAdditionalAssetAttributes entityName];
      v51[0] = v39;
      id v18 = (void *)MEMORY[0x1E4F1C0A8];
      id v38 = +[PLAdditionalAssetAttributes entityName];
      char v37 = [*(id *)(a1 + 40) managedObjectContext];
      char v36 = [v18 entityForName:v38 inManagedObjectContext:v37];
      v52[0] = v36;
      int v35 = +[PLManagedAsset entityName];
      v51[1] = v35;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C0A8];
      id v20 = +[PLManagedAsset entityName];
      id v21 = [*(id *)(a1 + 40) managedObjectContext];
      id v22 = [v19 entityForName:v20 inManagedObjectContext:v21];
      v52[1] = v22;
      id v23 = +[PLDuplicateAlbum entityName];
      v51[2] = v23;
      char v24 = (void *)MEMORY[0x1E4F1C0A8];
      int v25 = +[PLDuplicateAlbum entityName];
      id v26 = [*(id *)(a1 + 40) managedObjectContext];
      id v27 = [v24 entityForName:v25 inManagedObjectContext:v26];
      v52[2] = v27;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];

      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v29 = *(void *)(*(void *)(a1 + 96) + 8);
      id v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v49 = 0x2020000000;
      uint64_t v50 = 0;
      id v31 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_50;
      v40[3] = &unk_1E5871C28;
      v40[4] = *(void *)(a1 + 32);
      id v41 = *(id *)(a1 + 48);
      id v32 = v34;
      id v42 = v32;
      char v45 = *(unsigned char *)(a1 + 104);
      int8x16_t v43 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
      p_long long buf = &buf;
      [v31 enumerateRemainingTransactionsWithBlock:v40];

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    int v33 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: no transactionIterator, error: %@", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_54(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _shouldCancelCurrentWorkItem:*(void *)(a1 + 40)])
  {
    uint64_t v2 = 0;
  }
  else
  {
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    char v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__94229;
    v33[4] = __Block_byref_object_dispose__94230;
    id v34 = 0;
    uint64_t v3 = *(void **)(a1 + 48);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_2;
    v26[3] = &unk_1E5871C78;
    uint64_t v4 = *(void *)(a1 + 64);
    id v28 = v33;
    uint64_t v29 = v4;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 80);
    id v27 = v5;
    uint64_t v30 = v6;
    id v31 = v35;
    uint64_t v32 = v7;
    [v5 performBlockAndWait:v26];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
      || [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count])
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      uint64_t v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      id v25 = 0;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_3;
      v23[3] = &unk_1E5871CA0;
      v23[4] = v8;
      uint64_t v11 = *(void *)(a1 + 48);
      id v24 = *(id *)(a1 + 40);
      LODWORD(v9) = [v8 _processDuplicatesWithLimitedSelection:v9 requiresFingerprintDedupe:v10 library:v11 error:&v25 continuationHandler:v23];
      uint64_t v12 = &v24;
      id v13 = v25;
      uint64_t v2 = v13;
      if (v9)
      {
        uint64_t v14 = *(void **)(a1 + 48);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_4;
        v19[3] = &unk_1E5874900;
        v19[4] = *(void *)(a1 + 32);
        id v21 = v33;
        id v22 = v35;
        id v20 = v14;
        [v20 performBlockAndWait:v19];
      }
      else if ([v13 code] != 49406)
      {
        id v15 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v38 = v2;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: failed to process entire library duplicates. Error: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v16 = *(void **)(a1 + 48);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_56;
      v17[3] = &unk_1E5874900;
      v17[4] = *(void *)(a1 + 32);
      v18[1] = v33;
      v18[2] = v35;
      v18[0] = v16;
      [v18[0] performBlockAndWait:v17];
      uint64_t v2 = 0;
      uint64_t v12 = v18;
    }

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(unsigned __int8 *)(v4 + 24);
  if (*(unsigned char *)(v4 + 24))
  {
    v1 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v2 = [v1 persistentStoreCoordinator];
    [v2 currentPersistentHistoryTokenFromStores:0];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) lastIteratedToken];
  uint64_t v6 = };
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
  if (v5)
  {

    uint64_t v6 = v1;
  }

  BOOL v7 = (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
     || ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) hasMoreTransactions] & 1) == 0)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v7;
}

uint64_t __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldCancelCurrentWorkItem:*(void *)(a1 + 40)] ^ 1;
}

uint64_t __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLastDuplicateDetectorProcessingToken:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCompleted:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) library:*(void *)(a1 + 40)];
}

uint64_t __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLastDuplicateDetectorProcessingToken:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCompleted:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) library:*(void *)(a1 + 40)];
}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_50(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) _shouldCancelCurrentWorkItem:*(void *)(a1 + 40)])
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v6 = [v5 changes];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
          buf[0] = 0;
          uint64_t v12 = [*(id *)(a1 + 32) _validObjectIDFromChange:v11 entityDescriptionMap:*(void *)(a1 + 48) isCPLEnabled:*(unsigned __int8 *)(a1 + 80) requiresFingerprintDedupe:buf];
          if (v12)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v12];
            if (buf[0]) {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v14 = *(void *)(v13 + 24) + 1;
    *(void *)(v13 + 24) = v14;
    if (v14 == 5000)
    {
      id v15 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
        *(_DWORD *)long long buf = 134218240;
        uint64_t v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = v17;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: reached transaction batch limit of %tu (changes per batch: %tu)", buf, 0x16u);
      }

      *a3 = 1;
    }
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 0x3E8)
    {
      id v18 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
        uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v26 = v19;
        __int16 v27 = 2048;
        uint64_t v28 = v20;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: reached changes per batch limit: %tu (transactions per batch: %tu)", buf, 0x16u);
      }

      *a3 = 1;
    }
  }
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLBackgroundJobCriteria criteriaForDuplicateDetectorWorker];
  uint64_t v6 = [(PLBackgroundJobWorker *)self libraryBundle];
  uint64_t v7 = [v6 libraryServicesManager];

  uint64_t v8 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
  if (!+[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:v7])
  {
    uint64_t v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. Library not supported";
      goto LABEL_13;
    }
LABEL_14:

LABEL_15:
    id v15 = v8;
    goto LABEL_16;
  }
  uint64_t v9 = [v7 duplicateProcessor];
  int v10 = [v9 isMerging];

  if (v10)
  {
    uint64_t v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. Merging";
LABEL_13:
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  uint64_t v13 = [v7 libraryBundle];
  int v14 = PLIsCloudPhotoLibraryDisableInProgressForPhotoLibraryBundle(v13);

  if (v14)
  {
    uint64_t v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. CPL disable in progress";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (+[PLDuplicateProcessor isExitingSharedLibraryForLibrary:v4])
  {
    uint64_t v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. Exiting Shared Library";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v17 = (void *)MEMORY[0x19F38D3B0]();
  [(PLBackgroundJobDuplicateDetectorWorker *)self _resetTokenIfRequiredFromLibrary:v4];
  id v18 = [(PLBackgroundJobDuplicateDetectorWorker *)self _lastDuplicateDetectorProcessingTokenFromLibrary:v4];
  uint64_t v19 = [(PLBackgroundJobDuplicateDetectorWorker *)self _transactionIteratorSinceTokenIfValid:v18 library:v4 error:0];
  if (![v19 count])
  {

    goto LABEL_15;
  }
  uint64_t v20 = PLDuplicateDetectionGetLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v21)
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v29 = v18;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker returning 1 work item (lastToken %@)", buf, 0xCu);
    }

    long long v22 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    __int16 v27 = v18;
    long long v23 = (void *)MEMORY[0x1E4F1C978];
    long long v24 = (__CFString **)&v27;
  }
  else
  {
    if (v21)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker returning entire library marker", buf, 2u);
    }

    long long v22 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    uint64_t v26 = @"PLBackgroundJobDuplicateDetectorProcessEntireLibrary";
    long long v23 = (void *)MEMORY[0x1E4F1C978];
    long long v24 = &v26;
  }
  id v25 = objc_msgSend(v23, "arrayWithObjects:count:", v24, 1, v26, v27);
  id v15 = [(PLBackgroundJobWorkerPendingWorkItems *)v22 initWithCriteria:v5 workItemsNeedingProcessing:v25];

LABEL_16:

  return v15;
}

@end