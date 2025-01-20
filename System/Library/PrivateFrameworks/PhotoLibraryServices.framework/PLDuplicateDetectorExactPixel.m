@interface PLDuplicateDetectorExactPixel
+ (id)invalidHashData;
- (BOOL)_postProcessDuplicateWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5;
- (BOOL)_postProcessIsValidDateSource:(int64_t)a3;
- (PLDuplicateDetectorExactPixel)initWithSourceOIDs:(id)a3;
- (id)_generateDuplicateContainerFromProcessedHashOIDMap:(id)a3 oidHashMap:(id)a4;
- (id)_generateDuplicateContainerFromResults:(id)a3;
- (id)_hashIsValidPredicate;
- (id)_limitedSelectionPredicateWithPhotoLibrary:(id)a3;
- (id)_postProcessFetchMetadataWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5;
- (id)_postProcessingRequestAssetsFromDuplicateAssetOIDs:(id)a3;
- (id)_postProcessingRequestWithDuplicateAssetOIDs:(id)a3 pathManager:(id)a4;
- (id)_predicateWithPhotoLibrary:(id)a3;
- (id)_propertiesToFetch;
- (id)_sceneprintRequestWithPhotoLibrary:(id)a3;
- (id)detectDuplicatesWithPhotoLibrary:(id)a3 error:(id *)a4;
- (void)_addKey:(id)a3 value:(id)a4 map:(id)a5;
- (void)_fetchLimitedSelectionHashes:(id *)a3 alternativeHashes:(id *)a4 photoLibrary:(id)a5;
- (void)_updateDuplicateAssetOIDResults:(id)a3 forAssetOID:(id)a4 relatedProcessedHashOIDMap:(id)a5 oidHashMap:(id)a6;
- (void)_updateDuplicateAssetOIDResults:(id)a3 forHash:(id)a4 relatedProcessedHashOIDMap:(id)a5 oidHashMap:(id)a6;
@end

@implementation PLDuplicateDetectorExactPixel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidHashDataToExclude, 0);
  objc_storeStrong((id *)&self->_processedHashes, 0);
  objc_storeStrong((id *)&self->_processedOIDs, 0);
  objc_storeStrong((id *)&self->_sourceAssetOIDs, 0);
}

- (id)_postProcessingRequestAssetsFromDuplicateAssetOIDs:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = a3;
  v5 = +[PLManagedAsset entityName];
  v6 = [v3 fetchRequestWithEntityName:v5];

  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v4];

  [v6 setPredicate:v7];
  [v6 setReturnsObjectsAsFaults:0];
  [v6 setFetchBatchSize:100];
  v10[0] = @"master.mediaMetadata";
  v10[1] = @"modernResources";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v6 setRelationshipKeyPathsForPrefetching:v8];

  return v6;
}

- (id)_postProcessingRequestWithDuplicateAssetOIDs:(id)a3 pathManager:(id)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  id v7 = a3;
  v8 = +[PLManagedAsset entityName];
  v9 = [v5 fetchRequestWithEntityName:v8];

  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v7];

  [v9 setPredicate:v10];
  [v9 setResultType:2];
  v40[0] = @"additionalAttributes";
  v40[1] = @"extendedAttributes";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  v12 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"width"];
  uint64_t v13 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"height"];
  uint64_t v14 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1EEBF26D0];
  v15 = (void *)MEMORY[0x1E4F28C68];
  v33 = (void *)v14;
  v34 = (void *)v13;
  v39[0] = v13;
  v39[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v17 = [v15 expressionForFunction:@"multiply:by:" arguments:v16];

  id v18 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v18 setName:@"aspectR"];
  v19 = (void *)MEMORY[0x1E4F28C68];
  v38[0] = v12;
  v38[1] = v17;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v21 = [v19 expressionForFunction:@"divide:by:" arguments:v20];
  [v18 setExpression:v21];

  [v18 setExpressionResultType:500];
  v37[0] = @"objectID";
  v37[1] = @"additionalAttributes.importedBy";
  v37[2] = @"additionalAttributes.dateCreatedSource";
  v37[3] = @"extendedAttributes.dateCreated";
  v37[4] = v18;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  LODWORD(v20) = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:v6];

  if (v20)
  {
    v23 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"packedBadgeAttributes"];
    v24 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1EEBEE868];
    v32 = v12;
    id v25 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v25 setName:@"rjPacked"];
    v26 = (void *)MEMORY[0x1E4F28C68];
    v36[0] = v23;
    v36[1] = v24;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v28 = [v26 expressionForFunction:@"bitwiseAnd:with:" arguments:v27];
    [v25 setExpression:v28];

    [v25 setExpressionResultType:200];
    v35[0] = @"kind";
    v35[1] = @"kindSubtype";
    v35[2] = @"activeLibraryScopeParticipationState";
    v35[3] = @"additionalAttributes.originalStableHash";
    v35[4] = v25;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
    uint64_t v30 = [v22 arrayByAddingObjectsFromArray:v29];

    v12 = v32;
    v22 = (void *)v30;
  }
  [v9 setPropertiesToFetch:v22];

  return v9;
}

- (BOOL)_postProcessIsValidDateSource:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (id)_postProcessFetchMetadataWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v62 + 1) + 8 * i) group];
        uint64_t v14 = [v13 allObjects];
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v10);
  }

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__49961;
  v60 = __Block_byref_object_dispose__49962;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__49961;
  v54 = __Block_byref_object_dispose__49962;
  id v55 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__49961;
  v48[4] = __Block_byref_object_dispose__49962;
  id v49 = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke;
  v42[3] = &unk_1E58737F8;
  v42[4] = self;
  id v32 = v8;
  id v43 = v32;
  id v15 = v6;
  id v44 = v15;
  v45 = &v50;
  v46 = &v56;
  v47 = v48;
  uint64_t v16 = [v15 performBlockAndWait:v42];
  if (!v51[5])
  {
    id v28 = (id)v57[5];
    id v18 = 0;
LABEL_26:
    if (a5)
    {
      id v28 = v28;
      *a5 = v28;
    }
    goto LABEL_28;
  }
  context = (void *)MEMORY[0x19F38D3B0](v16);
  id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v18 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend((id)v51[5], "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v19 = (id)v51[5];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v66 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v24 = [v23 objectForKeyedSubscript:@"objectID"];
        id v25 = (void *)v24;
        if (v23) {
          BOOL v26 = v24 == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26) {
          [v18 setObject:v23 forKey:v24];
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v66 count:16];
    }
    while (v20);
  }

  if (self->_enableEXIFDataAccess)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke_310;
    v34[3] = &unk_1E5875340;
    v37 = v48;
    id v35 = v18;
    v36 = self;
    [v15 performBlockAndWait:v34];
  }
  uint64_t v27 = v51[5];
  id v28 = (id)v57[5];
  if (!v27) {
    goto LABEL_26;
  }
LABEL_28:

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v18;
}

void __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) pathManager];
  v5 = [v2 _postProcessingRequestWithDuplicateAssetOIDs:v3 pathManager:v4];

  id v6 = (void *)MEMORY[0x1E4F8B9B0];
  id v7 = [*(id *)(a1 + 48) managedObjectContext];
  v8 = [v6 startedQueryStatsWithContext:v7];

  id v9 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  obuint64_t j = *(id *)(v10 + 40);
  uint64_t v11 = [v9 executeFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = objc_msgSend(v8, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
  if (v14)
  {
    id v15 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412802;
      id v43 = v17;
      __int16 v44 = 2112;
      v45 = @"Post processing query";
      __int16 v46 = 2112;
      v47 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v18 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      uint64_t v21 = *(__CFString **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v43 = v20;
      __int16 v44 = 2112;
      v45 = v21;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to post processing fetch request for %{public}@. Error: %@", buf, 0x16u);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      goto LABEL_18;
    }
  }
  v22 = *(unsigned char **)(a1 + 32);
  if (v22[32])
  {
    v23 = [v22 _postProcessingRequestAssetsFromDuplicateAssetOIDs:*(void *)(a1 + 40)];

    uint64_t v24 = (void *)MEMORY[0x1E4F8B9B0];
    id v25 = [*(id *)(a1 + 48) managedObjectContext];
    BOOL v26 = [v24 startedQueryStatsWithContext:v25];

    uint64_t v27 = [*(id *)(a1 + 48) managedObjectContext];
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
    id v40 = *(id *)(v28 + 40);
    uint64_t v29 = [v27 executeFetchRequest:v23 error:&v40];
    objc_storeStrong((id *)(v28 + 40), v40);
    uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    id v32 = objc_msgSend(v26, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
    if (v32)
    {
      v33 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (objc_class *)objc_opt_class();
        id v35 = NSStringFromClass(v34);
        *(_DWORD *)buf = 138412802;
        id v43 = v35;
        __int16 v44 = 2112;
        v45 = @"Post processing EXIF query";
        __int16 v46 = 2112;
        v47 = v32;
        _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
      }
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      v36 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        long long v38 = NSStringFromClass(v37);
        long long v39 = *(__CFString **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        id v43 = v38;
        __int16 v44 = 2112;
        v45 = v39;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to post processing fetch request for %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
LABEL_18:
    BOOL v26 = v8;
    v23 = v5;
  }
}

void __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke_310(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Duplicate Processing Detector: Slow path accessing creation date", buf, 2u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    id v20 = v3;
    uint64_t v21 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = [v8 objectID];
        uint64_t v12 = [v10 objectForKeyedSubscript:v11];

        uint64_t v13 = [v12 objectForKeyedSubscript:@"extendedAttributes.dateCreated"];

        if (!v13)
        {
          uint64_t v14 = [v8 metadataFromMediaPropertiesOrOriginalResource];
          if (objc_msgSend(*(id *)(a1 + 40), "_postProcessIsValidDateSource:", objc_msgSend(v14, "creationDateSource")))
          {
            id v15 = [v14 utcCreationDate];
            if (v15)
            {
              uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v12];
              [v16 setObject:v15 forKey:@"extendedAttributes.dateCreated"];
              id v17 = *(void **)(a1 + 32);
              uint64_t v18 = [v8 objectID];
              id v19 = (void *)v18;
              if (v16 && v18) {
                [v17 setObject:v16 forKey:v18];
              }

              id v3 = v20;
            }

            uint64_t v6 = v21;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
}

- (BOOL)_postProcessDuplicateWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v43 = 0;
  uint64_t v30 = self;
  id v32 = v8;
  uint64_t v10 = [(PLDuplicateDetectorExactPixel *)self _postProcessFetchMetadataWithPhotoLibrary:v8 resultContainer:v9 error:&v43];
  id v11 = v43;
  uint64_t v12 = v11;
  v31 = (void *)v10;
  if (v10)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = v9;
    uint64_t v33 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v33)
    {
      uint64_t v29 = *(void *)v40;
      obuint64_t j = v13;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v16 = +[PLDuplicateDetectorSortKey sortKey:@"extendedAttributes.dateCreated" reverse:0];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          void v36[2] = __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke;
          v36[3] = &unk_1E586ACF0;
          id v17 = v31;
          id v37 = v17;
          long long v38 = v30;
          +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:v15 metadataMap:v17 metadataKey:v16 secondarySortKey:0 subGroupSplitDecisionBlock:v36];

          uint64_t v18 = +[PLDuplicateDetectorSortKey sortKey:@"aspectR" reverse:0];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke_2;
          v34[3] = &unk_1E586C4E8;
          id v19 = v17;
          id v35 = v19;
          +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:v15 metadataMap:v19 metadataKey:v18 secondarySortKey:0 subGroupSplitDecisionBlock:v34];

          id v20 = [v32 pathManager];
          LODWORD(v16) = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:v20];

          if (v16)
          {
            uint64_t v21 = +[PLDuplicateDetectorSortKey sortKey:@"kindSubtype" reverse:0];
            long long v22 = +[PLDuplicateDetectorSortKey sortKey:@"activeLibraryScopeParticipationState" reverse:0];
            long long v23 = +[PLDuplicateDetectorPostProcessing sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:v19];
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:v15 metadataMap:v19 metadataKey:v21 secondarySortKey:v22 subGroupSplitDecisionBlock:v23];

            long long v24 = +[PLDuplicateDetectorSortKey sortKey:@"activeLibraryScopeParticipationState" reverse:0];
            long long v25 = +[PLDuplicateDetectorSortKey sortKey:@"additionalAttributes.originalStableHash" reverse:0];
            BOOL v26 = +[PLDuplicateDetectorPostProcessing sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:v19];
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:v15 metadataMap:v19 metadataKey:v24 secondarySortKey:v25 subGroupSplitDecisionBlock:v26];
          }
          [v15 compactSubGroups];
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v33);
    }
    else
    {
    }
  }
  else if (a5)
  {
    *a5 = v11;
  }

  return v31 != 0;
}

BOOL __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 objectForKeyedSubscript:v7];
  id v9 = [v8 objectForKeyedSubscript:@"extendedAttributes.dateCreated"];

  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  id v11 = [v10 objectForKeyedSubscript:@"extendedAttributes.dateCreated"];

  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  id v13 = [v12 objectForKeyedSubscript:@"additionalAttributes.importedBy"];
  uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  id v15 = [v14 objectForKeyedSubscript:@"additionalAttributes.importedBy"];
  int v16 = [v13 isEqualToNumber:v15];

  id v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  uint64_t v18 = [v17 objectForKeyedSubscript:@"additionalAttributes.dateCreatedSource"];
  int v19 = [v18 shortValue];

  id v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v21 = [v20 objectForKeyedSubscript:@"additionalAttributes.dateCreatedSource"];
  int v22 = [v21 shortValue];

  BOOL v23 = 0;
  if (v9 && v11 && v16)
  {
    if ([*(id *)(a1 + 40) _postProcessIsValidDateSource:v19]
      && [*(id *)(a1 + 40) _postProcessIsValidDateSource:v22])
    {
      [v9 timeIntervalSinceDate:v11];
      BOOL v23 = v24 < 4.0 && v24 > 0.0;
    }
    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

BOOL __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [v7 objectForKeyedSubscript:@"aspectR"];

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 objectForKeyedSubscript:@"aspectR"];

  [v8 doubleValue];
  double v12 = v11;
  [v10 doubleValue];
  BOOL v14 = v13 > v12 + 0.01 || v13 < v12 + -0.01;

  return v14;
}

- (id)_propertiesToFetch
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"duplicateMatchingData";
  v4[1] = @"duplicateMatchingAlternateData";
  v4[2] = @"additionalAssetAttributes.asset";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (void)_fetchLimitedSelectionHashes:(id *)a3 alternativeHashes:(id *)a4 photoLibrary:(id)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    double v11 = (void *)MEMORY[0x1E4F1C0D0];
    double v12 = +[PLManagedAsset entityName];
    double v13 = [v11 fetchRequestWithEntityName:v12];

    BOOL v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", self->_sourceAssetOIDs];
    [v13 setPredicate:v14];

    v25[0] = @"additionalAttributes.sceneprint.duplicateMatchingData";
    v25[1] = @"additionalAttributes.sceneprint.duplicateMatchingAlternateData";
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    [v13 setPropertiesToFetch:v15];

    [v13 setResultType:2];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke;
    v19[3] = &unk_1E5870618;
    id v20 = v8;
    id v21 = v13;
    int v22 = self;
    id v16 = v9;
    id v23 = v16;
    id v17 = v10;
    id v24 = v17;
    id v18 = v13;
    [v20 performBlockAndWait:v19];

    if (a3) {
      *a3 = v16;
    }
    if (a4) {
      *a4 = v17;
    }
  }
}

void __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8B9B0];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = [v2 startedQueryStatsWithContext:v3];

  uint64_t v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v6 = *(void *)(a1 + 40);
  id v19 = 0;
  id v7 = [v5 executeFetchRequest:v6 error:&v19];
  id v8 = (__CFString *)v19;

  id v9 = objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v7, "count"));
  if (v9)
  {
    uint64_t v10 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = (objc_class *)objc_opt_class();
      double v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = @"Hashes for Limited Selection query";
      __int16 v24 = 2112;
      long long v25 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke_278;
    v16[3] = &unk_1E586AF70;
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    [v7 enumerateObjectsUsingBlock:v16];

    double v13 = v17;
  }
  else
  {
    double v13 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to fetch hashes for %{public}@. Error: %@", buf, 0x16u);
    }
  }
}

void __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke_278(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"additionalAttributes.sceneprint.duplicateMatchingData"];
  if (v5) {
    [v3 addObject:v5];
  }

  uint64_t v6 = *(void **)(a1 + 40);
  id v8 = [v4 objectForKeyedSubscript:@"additionalAttributes.sceneprint.duplicateMatchingAlternateData"];

  id v7 = v8;
  if (v8)
  {
    [v6 addObject:v8];
    id v7 = v8;
  }
}

- (id)_predicateWithPhotoLibrary:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = a3;
  uint64_t v6 = [(PLDuplicateDetectorExactPixel *)self _limitedSelectionPredicateWithPhotoLibrary:v5];
  id v7 = [(PLDuplicateDetectorExactPixel *)self _hashIsValidPredicate];
  v13[1] = v7;
  id v8 = [v5 pathManager];

  id v9 = +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:@"additionalAssetAttributes.asset" processingType:2 pathManager:v8];
  v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  double v11 = [v4 andPredicateWithSubpredicates:v10];

  return v11;
}

- (id)_hashIsValidPredicate
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"duplicateMatchingData");
  v11[0] = v4;
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"duplicateMatchingAlternateData");
  v11[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"duplicateMatchingData", self->_invalidHashDataToExclude];
  v11[2] = v6;
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"duplicateMatchingAlternateData", self->_invalidHashDataToExclude];
  v11[3] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  id v9 = [v3 andPredicateWithSubpredicates:v8];

  return v9;
}

- (id)_limitedSelectionPredicateWithPhotoLibrary:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_sourceAssetOIDs count])
  {
    id v13 = 0;
    id v14 = 0;
    [(PLDuplicateDetectorExactPixel *)self _fetchLimitedSelectionHashes:&v14 alternativeHashes:&v13 photoLibrary:v4];
    id v5 = v14;
    id v6 = v13;
    id v7 = (void *)MEMORY[0x1E4F28BA0];
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"duplicateMatchingData", v5];
    v15[0] = v8;
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"duplicateMatchingAlternateData", v6];
    v15[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    double v11 = [v7 orPredicateWithSubpredicates:v10];
  }
  else
  {
    double v11 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v11;
}

- (id)_sceneprintRequestWithPhotoLibrary:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = +[PLSceneprint entityName];
  id v7 = [v4 fetchRequestWithEntityName:v6];

  id v8 = [(PLDuplicateDetectorExactPixel *)self _predicateWithPhotoLibrary:v5];

  [v7 setPredicate:v8];
  id v9 = [(PLDuplicateDetectorExactPixel *)self _propertiesToFetch];
  [v7 setPropertiesToFetch:v9];

  [v7 setResultType:2];
  v12[0] = @"additionalAssetAttributes.asset";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 setRelationshipKeyPathsForPrefetching:v10];

  return v7;
}

- (void)_updateDuplicateAssetOIDResults:(id)a3 forHash:(id)a4 relatedProcessedHashOIDMap:(id)a5 oidHashMap:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([(NSMutableSet *)self->_processedHashes containsObject:v11] & 1) == 0)
  {
    [(NSMutableSet *)self->_processedHashes addObject:v11];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = objc_msgSend(v12, "objectForKeyedSubscript:", v11, 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [(PLDuplicateDetectorExactPixel *)self _updateDuplicateAssetOIDResults:v10 forAssetOID:*(void *)(*((void *)&v19 + 1) + 8 * v18++) relatedProcessedHashOIDMap:v12 oidHashMap:v13];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (void)_updateDuplicateAssetOIDResults:(id)a3 forAssetOID:(id)a4 relatedProcessedHashOIDMap:(id)a5 oidHashMap:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([(NSMutableSet *)self->_processedOIDs containsObject:v11] & 1) == 0)
  {
    [(NSMutableSet *)self->_processedOIDs addObject:v11];
    [v10 addObject:v11];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = objc_msgSend(v13, "objectForKeyedSubscript:", v11, 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [(PLDuplicateDetectorExactPixel *)self _updateDuplicateAssetOIDResults:v10 forHash:*(void *)(*((void *)&v19 + 1) + 8 * v18++) relatedProcessedHashOIDMap:v12 oidHashMap:v13];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (id)_generateDuplicateContainerFromProcessedHashOIDMap:(id)a3 oidHashMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__49961;
  v20[4] = __Block_byref_object_dispose__49962;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromProcessedHashOIDMap_oidHashMap___block_invoke;
  void v15[3] = &unk_1E586ACC8;
  long long v19 = v20;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  id v11 = v8;
  id v18 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  id v12 = v18;
  id v13 = v11;

  _Block_object_dispose(v20, 8);
  return v13;
}

void __95__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromProcessedHashOIDMap_oidHashMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 32), "_updateDuplicateAssetOIDResults:forAssetOID:relatedProcessedHashOIDMap:oidHashMap:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(*((void *)&v13 + 1) + 8 * v9++), *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v13);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] >= 2)
  {
    id v10 = [PLDuplicateGroup alloc];
    id v11 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) copy];
    id v12 = [(PLDuplicateGroup *)v10 initWithGroupResults:v11];

    [*(id *)(a1 + 56) addObject:v12];
  }
}

- (void)_addKey:(id)a3 value:(id)a4 map:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v10 && v7)
  {
    id v9 = [v8 objectForKeyedSubscript:v10];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [v8 setObject:v9 forKeyedSubscript:v10];
    }
    [v9 addObject:v7];
  }
}

- (id)_generateDuplicateContainerFromResults:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke;
  v19[3] = &unk_1E58747C8;
  void v19[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v8 = v7;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v19];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke_2;
  id v17 = &unk_1E586ACA0;
  id v18 = v10;
  id v11 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:&v14];

  id v12 = -[PLDuplicateDetectorExactPixel _generateDuplicateContainerFromProcessedHashOIDMap:oidHashMap:](self, "_generateDuplicateContainerFromProcessedHashOIDMap:oidHashMap:", v11, v8, v14, v15, v16, v17);

  return v12;
}

void __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 objectForKeyedSubscript:@"additionalAssetAttributes.asset"];
  id v4 = [v3 objectForKeyedSubscript:@"duplicateMatchingData"];
  [*(id *)(a1 + 32) _addKey:v4 value:v6 map:*(void *)(a1 + 40)];
  id v5 = [v3 objectForKeyedSubscript:@"duplicateMatchingAlternateData"];

  [*(id *)(a1 + 32) _addKey:v5 value:v6 map:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _addKey:v6 value:v4 map:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _addKey:v6 value:v5 map:*(void *)(a1 + 48)];
}

void __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((unint64_t)[v5 count] >= 2) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)detectDuplicatesWithPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__49961;
  id v35 = __Block_byref_object_dispose__49962;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__49961;
  uint64_t v29 = __Block_byref_object_dispose__49962;
  id v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__PLDuplicateDetectorExactPixel_detectDuplicatesWithPhotoLibrary_error___block_invoke;
  v21[3] = &unk_1E5874900;
  v21[4] = self;
  id v7 = v6;
  id v22 = v7;
  id v23 = &v25;
  uint64_t v24 = &v31;
  [v7 performBlockAndWait:v21];
  if (v26[5])
  {
    id v8 = -[PLDuplicateDetectorExactPixel _generateDuplicateContainerFromResults:](self, "_generateDuplicateContainerFromResults:");
    id v9 = (void *)v26[5];
    v26[5] = 0;

    if (![v8 count])
    {
      id v10 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Duplicate Processing Detector: Post processing skipped, results container empty", buf, 2u);
      }
      goto LABEL_6;
    }
    if (self->_disablePostProcessing)
    {
      id v10 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Duplicate Processing Detector: Post processing disabled via defaults", buf, 2u);
      }
LABEL_6:

      goto LABEL_23;
    }
    self->_enableEXIFDataAccess = !+[PLDuplicateDetector duplicateDetectorCompletedDateBackgroundMigrationAction:v7];
    id v11 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (self->_enableEXIFDataAccess) {
        id v12 = @"YES";
      }
      else {
        id v12 = @"NO";
      }
      *(_DWORD *)buf = 138543362;
      long long v38 = v12;
      long long v13 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Duplicate Processing Detector: enableEXIFDataAccess: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (id *)(v32 + 5);
    obuint64_t j = (id)v32[5];
    BOOL v15 = [(PLDuplicateDetectorExactPixel *)self _postProcessDuplicateWithPhotoLibrary:v7 resultContainer:v8 error:&obj];
    objc_storeStrong(v14, obj);
    id v16 = (id)v32[5];
    id v17 = v16;
    if (a4) {
      char v18 = v15;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) == 0) {
      *a4 = v16;
    }
  }
  else
  {
    id v8 = 0;
    if (a4) {
      *a4 = (id) v32[5];
    }
  }
LABEL_23:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v8;
}

void __72__PLDuplicateDetectorExactPixel_detectDuplicatesWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _sceneprintRequestWithPhotoLibrary:*(void *)(a1 + 40)];
  id v3 = (void *)MEMORY[0x1E4F8B9B0];
  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v5 = [v3 startedQueryStatsWithContext:v4];

  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = [v6 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = objc_msgSend(v5, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count"));
  if (v11)
  {
    id v12 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412802;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = @"Main sceneprint query";
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v15 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      char v18 = *(__CFString **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v21 = v17;
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to fetch request for %{public}@. Error: %@", buf, 0x16u);
    }
  }
}

- (PLDuplicateDetectorExactPixel)initWithSourceOIDs:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLDuplicateDetectorExactPixel;
  id v6 = [(PLDuplicateDetectorExactPixel *)&v17 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceAssetOIDs, a3);
    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    processedOIDs = v7->_processedOIDs;
    v7->_processedOIDs = v8;

    id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    processedHashes = v7->_processedHashes;
    v7->_processedHashes = v10;

    v7->_enableEXIFDataAccess = 0;
    uint64_t v12 = [(id)objc_opt_class() invalidHashData];
    invalidHashDataToExclude = v7->_invalidHashDataToExclude;
    v7->_invalidHashDataToExclude = (NSArray *)v12;

    if (MEMORY[0x19F38BDA0]())
    {
      uint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v7->_enableScreenshotProcessing = [v14 BOOLForKey:@"PLDuplicateEnableScreenshotProcessing"];

      BOOL v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v7->_disablePostProcessing = [v15 BOOLForKey:@"PLDuplicateDisablePostProcessing"];
    }
  }

  return v7;
}

+ (id)invalidHashData
{
  v71[67] = *MEMORY[0x1E4F143B8];
  v70 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&invalidHashData_bytes length:24 freeWhenDone:0];
  v71[0] = v70;
  v69 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&invalidHashData_bytes_28 length:25 freeWhenDone:0];
  v71[1] = v69;
  uint64_t v68 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQ5vUem8/QdHTV59EXsNOt" options:0];
  v71[2] = v68;
  v67 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQJvwem8/AdHTX59ETsNOt" options:0];
  v71[3] = v67;
  v66 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQJvwem8/AdHTX79ETsJPt" options:0];
  v71[4] = v66;
  long long v65 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQJvwem8/AdHTX79ETsNPt" options:0];
  v71[5] = v65;
  long long v64 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQJvwem89AdHTX59EzsJPt" options:0];
  v71[6] = v64;
  long long v63 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQZvQek89AdHz359E3sJPt" options:0];
  v71[7] = v63;
  long long v62 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQZvQem8/AdHTX59EXsNPt" options:0];
  v71[8] = v62;
  id v61 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQZvQem8/AdHTX79ETsNOt" options:0];
  v71[9] = v61;
  v60 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQZvQem8/AdHTX79ETsNPt" options:0];
  v71[10] = v60;
  v59 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQZvwem8/AdHTX79ETsJPt" options:0];
  v71[11] = v59;
  uint64_t v58 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUQZvwem8/AdHTX79EzsJPt" options:0];
  v71[12] = v58;
  v57 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHMTSUYpvweE8/AdHz359ExsJPt" options:0];
  v71[13] = v57;
  uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHORSUQpvweG8/AdPTX7dEzsNPt" options:0];
  v71[14] = v56;
  id v55 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvweG89AdHTX59ExsJOt" options:0];
  v71[15] = v55;
  v54 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvweG89AdHTX7dExsNOt" options:0];
  v71[16] = v54;
  v53 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvwek89AdHTX79EzsNPt" options:0];
  v71[17] = v53;
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvwem8/AdHTX79E3sNPt" options:0];
  v71[18] = v52;
  v51 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvwem8/AdHTX79ETsJPt" options:0];
  v71[19] = v51;
  uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvwem8/AdHTX79ETsNOt" options:0];
  v71[20] = v50;
  id v49 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvwem8/AdHTX79ETsNPt" options:0];
  v71[21] = v49;
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvwem8/AdHTX79EzsJPt" options:0];
  v71[22] = v48;
  v47 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQJvwem89AdHTX79ExsNPt" options:0];
  v71[23] = v47;
  __int16 v46 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQpvweG8/AdPTX79ERsNPt" options:0];
  v71[24] = v46;
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQpvwem8/AdHTX59ERsNPt" options:0];
  v71[25] = v45;
  __int16 v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQpvwem89AdPTX79ExsNPt" options:0];
  v71[26] = v44;
  id v43 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQZvwem8/AdHTX79ETsJPt" options:0];
  v71[27] = v43;
  long long v42 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQZvwem8/AdHTX79ETsNPt" options:0];
  v71[28] = v42;
  long long v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQZvwem8/AdHTX79EzsJPt" options:0];
  v71[29] = v41;
  long long v40 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUQZvwem8/AdHTX79EzsNPt" options:0];
  v71[30] = v40;
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHOTSUYpvQem89AdHTX79ERsNPt" options:0];
  v71[31] = v39;
  long long v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"HFjITFHuTSUQZvQem89AdHTX59EzsJPt" options:0];
  v71[32] = v38;
  id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1j4u6PBl0eXlORE6ufoMAa1RVg/m/kBOA==" options:0];
  v71[33] = v37;
  id v36 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1j4u6PBlweXlPRE6ufoMga1RVg/m7kBOA==" options:0];
  v71[34] = v36;
  id v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1jQo6PJk0eXlMRE6+foMAa1VVwvm+kBOA==" options:0];
  v71[35] = v35;
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1jQu6PJk0eXlORE6+X4MAa1VVwum/kBOA==" options:0];
  v71[36] = v34;
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1jYq6PBlweXlFRE6ufoMga1RVw/m6kBOA==" options:0];
  v71[37] = v33;
  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PBlweXlMRE6+foMga1RVgvm7kBOA==" options:0];
  v71[38] = v32;
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PBlweXlMRE6ufoMga1RVgvm7kBOA==" options:0];
  v71[39] = v31;
  id v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PJl0eXlERE6ufoMga1RVgvm7kBOA==" options:0];
  v71[40] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PJlweXlFRE6ufsMga1RVgvm7kBOA==" options:0];
  v71[41] = v29;
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PJlweXlNRE6ufoMga1RRgvm7kBOA==" options:0];
  v71[42] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PJlweXlNRE6ufsMga1RVgvm7kBOA==" options:0];
  v71[43] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PJlweXlNRG6ufsMga1RRg/m7kBOA==" options:0];
  v71[44] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4q6PJlweXlPRE6ufsMga1RVg/m7kBOA==" options:0];
  v71[45] = v25;
  __int16 v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6OBl0eXlMRE6+foMga1RVgvm/kBOA==" options:0];
  v71[46] = v24;
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PBlweXlFRE6ufoMga1RVg/m7kBOA==" options:0];
  v71[47] = v23;
  __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PBlweXlFRE6ufoMga1RVgvm6kBOA==" options:0];
  v71[48] = v22;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PJkweXlGRE6uXsMAa1RVgvm+kBOA==" options:0];
  v71[49] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PJlweXlFRG6ufoMga1RVgvm7kBOA==" options:0];
  v71[50] = v20;
  long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PJlweXlHRE6ufsMga1RVg/m6kBOA==" options:0];
  v71[51] = v19;
  char v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PJlweXlHRE6ufsMga1RVgvm7kBOA==" options:0];
  v71[52] = v18;
  objc_super v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PJlweXlNRE6ufoMga1RRg/m7kBOA==" options:0];
  v71[53] = v17;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PJlweXlPRE6ufsMga1RRg/m7kBOA==" options:0];
  v71[54] = v16;
  BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n4u6PJlweXlPRE6ufsMga1RVgvm7kBOA==" options:0];
  v71[55] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1n6u6PJlweXlORE6uXsMAa1RVgvm7kBOA==" options:0];
  v71[56] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nau6PJkweXlHRE6+XsMAa1RVgvm6kBOA==" options:0];
  v71[57] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1niu6PJl0eXlPRE6+3sMAaxQRgvm/kBOA==" options:0];
  v71[58] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nQu6PJlweXlPRE6uXsMEaxVRkvm/kBOA==" options:0];
  v71[59] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nSu6PJkweXlHRE6+f8MAa1VVgvm/kBOA==" options:0];
  v71[60] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nwq6PJl0eXlMRE6ufoMga1RVgvm/kBOA==" options:0];
  v71[61] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nws6PJl8eXlPRE6+fsMgaxRRg+m/kBOA==" options:0];
  v71[62] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nyq6PJlweXlHRE6ufsMAaxRRgvm/kBOA==" options:0];
  v71[63] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nyu6PJlweXlGRE6uXoMAa1RV0vm+kBOA==" options:0];
  v71[64] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nYu6PJlweXlHRG6ufsMAa1RVgvm6kBOA==" options:0];
  v71[65] = v10;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"D1nYu6PJlweXlORE6+X4MgaxRV0vm+kBOA==" options:0];
  v71[66] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:67];

  return v13;
}

@end