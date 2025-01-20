@interface PLDuplicateDetectorMetadata
- (BOOL)_postProcessDuplicateWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5;
- (PLDuplicateDetectorMetadata)initWithSourceOIDs:(id)a3;
- (id)_combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3;
- (id)_fingerprintIsValidPredicate;
- (id)_fingerprintRequestWithPhotoLibrary:(id)a3;
- (id)_fullSizePreviewFingerprintRequestWithPhotoLibrary:(id)a3;
- (id)_fullSizePreviewPredicateWithPhotoLibrary:(id)a3;
- (id)_fullSizePropertiesToFetch;
- (id)_fullsizeFingerprintIsValidFullSizePredicate;
- (id)_fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3;
- (id)_generateDuplicateContainerFromResults:(id)a3 fullsizeFingerprintResults:(id)a4;
- (id)_limitedSelectionFullSizePredicateWithPhotoLibrary:(id)a3;
- (id)_limitedSelectionPredicateWithPhotoLibrary:(id)a3;
- (id)_originalsIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3;
- (id)_postProcessFetchMetadataWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5;
- (id)_postProcessingRequestWithDuplicateAssetOIDs:(id)a3 pathManager:(id)a4;
- (id)_predicateWithPhotoLibrary:(id)a3;
- (id)_propertiesToFetch;
- (id)detectDuplicatesWithPhotoLibrary:(id)a3 error:(id *)a4;
- (void)_addFingerprint:(id)a3 oid:(id)a4 map:(id)a5;
- (void)_buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:(id)a3 mutableOIDFingerprintMap:(id)a4 filterOnCPLResourceType:(unint64_t)a5;
@end

@implementation PLDuplicateDetectorMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedLimitedSelectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceAssetOIDs, 0);
}

- (id)_postProcessingRequestWithDuplicateAssetOIDs:(id)a3 pathManager:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  id v7 = a3;
  v8 = +[PLManagedAsset entityName];
  v9 = [v5 fetchRequestWithEntityName:v8];

  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v7];

  [v9 setPredicate:v10];
  [v9 setResultType:2];
  v25[0] = @"additionalAttributes";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  v24[0] = @"objectID";
  v24[1] = @"duration";
  v24[2] = @"kind";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  LODWORD(v8) = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:v6];

  if (v8)
  {
    v13 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"packedBadgeAttributes"];
    v14 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1EEBEF0C0];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v15 setName:@"rjPacked"];
    v16 = (void *)MEMORY[0x1E4F28C68];
    v23[0] = v13;
    v23[1] = v14;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v18 = [v16 expressionForFunction:@"bitwiseAnd:with:" arguments:v17];
    [v15 setExpression:v18];

    [v15 setExpressionResultType:200];
    v22[0] = @"kindSubtype";
    v22[1] = @"activeLibraryScopeParticipationState";
    v22[2] = @"additionalAttributes.originalStableHash";
    v22[3] = v15;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    uint64_t v20 = [v12 arrayByAddingObjectsFromArray:v19];

    v12 = (void *)v20;
  }
  [v9 setPropertiesToFetch:v12];

  return v9;
}

- (id)_postProcessFetchMetadataWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = [*(id *)(*((void *)&v56 + 1) + 8 * i) group];
        id v15 = [v14 allObjects];
        [v9 addObjectsFromArray:v15];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v11);
  }

  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__61986;
  v54 = __Block_byref_object_dispose__61987;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__61986;
  v48 = __Block_byref_object_dispose__61987;
  id v49 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __95__PLDuplicateDetectorMetadata__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke;
  v39[3] = &unk_1E586C518;
  v39[4] = self;
  id v16 = v9;
  id v40 = v16;
  id v17 = v7;
  id v41 = v17;
  v42 = &v44;
  v43 = &v50;
  uint64_t v18 = [v17 performBlockAndWait:v39];
  v34 = v16;
  if (!v45[5])
  {
    id v30 = (id)v51[5];
    uint64_t v20 = 0;
LABEL_24:
    if (a5)
    {
      id v30 = v30;
      *a5 = v30;
    }
    goto LABEL_26;
  }
  context = (void *)MEMORY[0x19F38D3B0](v18);
  id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v20 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend((id)v45[5], "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = (id)v45[5];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v60 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v26 = [v25 objectForKeyedSubscript:@"objectID"];
        v27 = (void *)v26;
        if (v25) {
          BOOL v28 = v26 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        if (!v28) {
          [v20 setObject:v25 forKey:v26];
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v60 count:16];
    }
    while (v22);
  }

  uint64_t v29 = v45[5];
  id v30 = (id)v51[5];
  if (!v29) {
    goto LABEL_24;
  }
LABEL_26:

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v20;
}

void __95__PLDuplicateDetectorMetadata__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) pathManager];
  v5 = [v2 _postProcessingRequestWithDuplicateAssetOIDs:v3 pathManager:v4];

  id v6 = (void *)MEMORY[0x1E4F8B9B0];
  id v7 = [*(id *)(a1 + 48) managedObjectContext];
  id v8 = [v6 startedQueryStatsWithContext:v7];

  v9 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  obuint64_t j = *(id *)(v10 + 40);
  uint64_t v11 = [v9 executeFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  v14 = objc_msgSend(v8, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
  if (v14)
  {
    id v15 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412802;
      v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = @"Post processing query";
      __int16 v27 = 2112;
      BOOL v28 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v18 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      id v21 = *(__CFString **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to post processing fetch request for %{public}@. Error: %@", buf, 0x16u);
    }
  }
}

- (BOOL)_postProcessDuplicateWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v41 = 0;
  v32 = v8;
  uint64_t v10 = [(PLDuplicateDetectorMetadata *)self _postProcessFetchMetadataWithPhotoLibrary:v8 resultContainer:v9 error:&v41];
  id v11 = v41;
  uint64_t v12 = v11;
  v33 = (void *)v10;
  if (v10)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v9;
    uint64_t v34 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v34)
    {
      id v29 = v9;
      uint64_t v14 = *(void *)v38;
      id v15 = off_1E585E000;
      uint64_t v30 = *(void *)v38;
      id v31 = v13;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v18 = +[PLDuplicateDetectorSortKey sortKey:@"duration" reverse:0];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __91__PLDuplicateDetectorMetadata__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke;
          v35[3] = &unk_1E586C4E8;
          id v19 = v33;
          id v36 = v19;
          +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:v17 metadataMap:v19 metadataKey:v18 secondarySortKey:0 subGroupSplitDecisionBlock:v35];

          uint64_t v20 = v15[245];
          id v21 = [v32 pathManager];
          LODWORD(v20) = [(__objc2_class *)v20 sharedLibraryDedupeEnabledWithPathManager:v21];

          if (v20)
          {
            uint64_t v22 = +[PLDuplicateDetectorSortKey sortKey:@"kindSubtype" reverse:0];
            uint64_t v23 = +[PLDuplicateDetectorSortKey sortKey:@"activeLibraryScopeParticipationState" reverse:0];
            v24 = +[PLDuplicateDetectorPostProcessing sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:v19];
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:v17 metadataMap:v19 metadataKey:v22 secondarySortKey:v23 subGroupSplitDecisionBlock:v24];

            __int16 v25 = +[PLDuplicateDetectorSortKey sortKey:@"activeLibraryScopeParticipationState" reverse:0];
            id v15 = off_1E585E000;
            uint64_t v26 = +[PLDuplicateDetectorSortKey sortKey:@"additionalAttributes.originalStableHash" reverse:0];
            __int16 v27 = +[PLDuplicateDetectorPostProcessing sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:v19];
            uint64_t v14 = v30;
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:v17 metadataMap:v19 metadataKey:v25 secondarySortKey:v26 subGroupSplitDecisionBlock:v27];

            id v13 = v31;
          }
          [v17 compactSubGroups];
        }
        uint64_t v34 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v34);

      id v9 = v29;
    }
    else
    {
    }
  }
  else if (a5)
  {
    *a5 = v11;
  }

  return v33 != 0;
}

uint64_t __91__PLDuplicateDetectorMetadata__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = [v7 objectForKeyedSubscript:@"kind"];
  int v9 = [v8 shortValue];

  if (v9 == 1)
  {
    uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    id v11 = [v10 objectForKeyedSubscript:@"duration"];

    uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    id v13 = [v12 objectForKeyedSubscript:@"duration"];

    if (v13) {
      uint64_t v14 = [v11 isEqualToNumber:v13] ^ 1;
    }
    else {
      uint64_t v14 = v11 != 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = +[PLInternalResource entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  id v8 = (void *)MEMORY[0x1E4F28BA0];
  int v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"dataStoreClassID", 0);
  v28[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"dataStoreSubtype", &unk_1EEBF1F70];
  v28[1] = v10;
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset", self->_sourceAssetOIDs];
  v28[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  id v13 = [v8 andPredicateWithSubpredicates:v12];
  [v7 setPredicate:v13];

  __int16 v27 = @"fingerprint";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [v7 setPropertiesToFetch:v14];

  [v7 setResultType:2];
  id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke;
  v22[3] = &unk_1E5875BF8;
  id v23 = v4;
  id v24 = v7;
  __int16 v25 = self;
  id v16 = v15;
  id v26 = v16;
  id v17 = v7;
  id v18 = v4;
  [v18 performBlockAndWait:v22];
  id v19 = v26;
  id v20 = v16;

  return v20;
}

void __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8B9B0];
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [v2 startedQueryStatsWithContext:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v6 = *(void *)(a1 + 40);
  id v18 = 0;
  id v7 = [v5 executeFetchRequest:v6 error:&v18];
  id v8 = (__CFString *)v18;

  int v9 = objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v7, "count"));
  if (v9)
  {
    uint64_t v10 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      id v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = @"Fullsize fingerprints for Limited Selection query";
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_96;
    v16[3] = &unk_1E5871D18;
    id v17 = *(id *)(a1 + 56);
    [v7 enumerateObjectsUsingBlock:v16];
    id v13 = v17;
  }
  else
  {
    id v13 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      id v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch full size identifiers for %{public}@. Error: %@", buf, 0x16u);
    }
  }
}

void __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_96(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 allValues];
  [v2 addObjectsFromArray:v3];
}

- (id)_originalsIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v6 = +[PLAdditionalAssetAttributes entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.%K IN %@", @"asset", self->_sourceAssetOIDs];
  [v7 setPredicate:v8];

  v22[0] = @"originalStableHash";
  v22[1] = @"originatingAssetIdentifier";
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v7 setPropertiesToFetch:v9];

  [v7 setResultType:2];
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke;
  v17[3] = &unk_1E5875BF8;
  id v18 = v4;
  id v19 = v7;
  id v20 = self;
  id v11 = v10;
  id v21 = v11;
  id v12 = v7;
  id v13 = v4;
  [v13 performBlockAndWait:v17];
  uint64_t v14 = v21;
  id v15 = v11;

  return v15;
}

void __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8B9B0];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [v2 startedQueryStatsWithContext:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v6 = *(void *)(a1 + 40);
  id v18 = 0;
  id v7 = [v5 executeFetchRequest:v6 error:&v18];
  id v8 = (__CFString *)v18;

  int v9 = objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v7, "count"));
  if (v9)
  {
    uint64_t v10 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      id v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = @"Master fingerprints for Limited Selection query";
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_84;
    v16[3] = &unk_1E5871D18;
    id v17 = *(id *)(a1 + 56);
    [v7 enumerateObjectsUsingBlock:v16];
    id v13 = v17;
  }
  else
  {
    id v13 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      id v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);
    }
  }
}

void __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_84(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 allValues];
  [v2 addObjectsFromArray:v3];
}

- (id)_combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3
{
  combinedLimitedSelectionIdentifiers = self->_combinedLimitedSelectionIdentifiers;
  if (!combinedLimitedSelectionIdentifiers)
  {
    id v5 = a3;
    uint64_t v6 = [(PLDuplicateDetectorMetadata *)self _originalsIdentifiersFromLimitedSelectionWithPhotoLibrary:v5];
    id v7 = [(PLDuplicateDetectorMetadata *)self _fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary:v5];

    id v8 = [v6 setByAddingObjectsFromSet:v7];
    int v9 = self->_combinedLimitedSelectionIdentifiers;
    self->_combinedLimitedSelectionIdentifiers = v8;

    combinedLimitedSelectionIdentifiers = self->_combinedLimitedSelectionIdentifiers;
  }
  return combinedLimitedSelectionIdentifiers;
}

- (id)_fullSizePropertiesToFetch
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"asset";
  v4[1] = @"asset.kind";
  v4[2] = @"asset.adjustmentsState";
  v4[3] = @"fingerprint";
  v4[4] = @"dataStoreSubtype";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

- (id)_fullSizePreviewPredicateWithPhotoLibrary:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = a3;
  uint64_t v6 = [(PLDuplicateDetectorMetadata *)self _limitedSelectionFullSizePredicateWithPhotoLibrary:v5];
  v14[0] = v6;
  id v7 = [(PLDuplicateDetectorMetadata *)self _fullsizeFingerprintIsValidFullSizePredicate];
  v14[1] = v7;
  id v8 = +[PLDuplicateDetector duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:@"fingerprint"];
  v14[2] = v8;
  int v9 = [v5 pathManager];

  uint64_t v10 = +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:@"asset" processingType:1 pathManager:v9];
  v14[3] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  id v12 = [v4 andPredicateWithSubpredicates:v11];

  return v12;
}

- (id)_fullsizeFingerprintIsValidFullSizePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"fingerprint");
}

- (id)_limitedSelectionFullSizePredicateWithPhotoLibrary:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_sourceAssetOIDs count])
  {
    id v5 = [(PLDuplicateDetectorMetadata *)self _combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:v4];
    uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"fingerprint", v5];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v6;
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"version", 2);
  v12[1] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v7 andPredicateWithSubpredicates:v9];

  return v10;
}

- (id)_fullSizePreviewFingerprintRequestWithPhotoLibrary:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  uint64_t v6 = +[PLInternalResource entityName];
  id v7 = [v4 fetchRequestWithEntityName:v6];

  id v8 = [(PLDuplicateDetectorMetadata *)self _fullSizePreviewPredicateWithPhotoLibrary:v5];

  [v7 setPredicate:v8];
  int v9 = [(PLDuplicateDetectorMetadata *)self _fullSizePropertiesToFetch];
  [v7 setPropertiesToFetch:v9];

  [v7 setResultType:2];
  v12[0] = @"asset";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 setRelationshipKeyPathsForPrefetching:v10];

  return v7;
}

- (id)_propertiesToFetch
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"asset";
  v4[1] = @"asset.kind";
  v4[2] = @"asset.adjustmentsState";
  v4[3] = @"originalStableHash";
  v4[4] = @"originatingAssetIdentifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

- (id)_predicateWithPhotoLibrary:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = a3;
  uint64_t v6 = [(PLDuplicateDetectorMetadata *)self _limitedSelectionPredicateWithPhotoLibrary:v5];
  v14[0] = v6;
  id v7 = [(PLDuplicateDetectorMetadata *)self _fingerprintIsValidPredicate];
  v14[1] = v7;
  id v8 = +[PLDuplicateDetector duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:@"originalStableHash"];
  v14[2] = v8;
  int v9 = [v5 pathManager];

  uint64_t v10 = +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:@"asset" processingType:1 pathManager:v9];
  v14[3] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  id v12 = [v4 andPredicateWithSubpredicates:v11];

  return v12;
}

- (id)_fingerprintIsValidPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"originalStableHash");
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"originatingAssetIdentifier", v3);
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = [v2 orPredicateWithSubpredicates:v5];

  return v6;
}

- (id)_limitedSelectionPredicateWithPhotoLibrary:(id)a3
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_sourceAssetOIDs count])
  {
    id v5 = [(PLDuplicateDetectorMetadata *)self _combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:v4];
    uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"originalStableHash", v5];
    v12[0] = v7;
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"originatingAssetIdentifier", v5];
    v12[1] = v8;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v10 = [v6 orPredicateWithSubpredicates:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v10;
}

- (id)_fingerprintRequestWithPhotoLibrary:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  uint64_t v6 = +[PLAdditionalAssetAttributes entityName];
  id v7 = [v4 fetchRequestWithEntityName:v6];

  id v8 = [(PLDuplicateDetectorMetadata *)self _predicateWithPhotoLibrary:v5];

  [v7 setPredicate:v8];
  int v9 = [(PLDuplicateDetectorMetadata *)self _propertiesToFetch];
  [v7 setPropertiesToFetch:v9];

  [v7 setResultType:2];
  v12[0] = @"asset";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 setRelationshipKeyPathsForPrefetching:v10];

  return v7;
}

- (void)_addFingerprint:(id)a3 oid:(id)a4 map:(id)a5
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

- (void)_buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:(id)a3 mutableOIDFingerprintMap:(id)a4 filterOnCPLResourceType:(unint64_t)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __151__PLDuplicateDetectorMetadata__buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults_mutableOIDFingerprintMap_filterOnCPLResourceType___block_invoke;
  v9[3] = &unk_1E586C4C0;
  id v10 = v7;
  unint64_t v11 = a5;
  id v8 = v7;
  [a3 enumerateObjectsUsingBlock:v9];
}

void __151__PLDuplicateDetectorMetadata__buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults_mutableOIDFingerprintMap_filterOnCPLResourceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 objectForKeyedSubscript:@"fingerprint"];
  id v4 = [v3 objectForKeyedSubscript:@"asset"];
  id v5 = [v3 objectForKeyedSubscript:@"dataStoreSubtype"];

  uint64_t v6 = [v5 unsignedIntegerValue];
  uint64_t v7 = *(void *)(a1 + 40);

  if (v8 && v4 && v6 == v7) {
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v4];
  }
}

- (id)_generateDuplicateContainerFromResults:(id)a3 fullsizeFingerprintResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = (void *)MEMORY[0x19F38D3B0]();
  id v10 = [v6 arrayByAddingObjectsFromArray:v7];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PLDuplicateDetectorMetadata *)self _buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:v7 mutableOIDFingerprintMap:v11 filterOnCPLResourceType:2];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PLDuplicateDetectorMetadata *)self _buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:v7 mutableOIDFingerprintMap:v12 filterOnCPLResourceType:16];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PLDuplicateDetectorMetadata *)self _buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:v7 mutableOIDFingerprintMap:v13 filterOnCPLResourceType:6];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke;
  v23[3] = &unk_1E586C498;
  id v24 = v12;
  id v25 = v13;
  id v26 = v11;
  __int16 v27 = self;
  id v28 = v14;
  id v15 = v14;
  id v16 = v11;
  id v17 = v13;
  id v18 = v12;
  [v10 enumerateObjectsUsingBlock:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke_53;
  v21[3] = &unk_1E5873068;
  id v19 = v8;
  id v22 = v19;
  [v15 enumerateKeysAndObjectsUsingBlock:v21];

  return v19;
}

void __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"asset"];
  id v5 = [v3 objectForKeyedSubscript:@"asset.kind"];
  int v6 = [v5 shortValue];

  if (v4)
  {
    if (v6 == 1)
    {
      id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
      }
      id v11 = v9;

      if (!v11)
      {
LABEL_18:
        id v15 = [v3 objectForKeyedSubscript:@"asset.adjustmentsState"];
        int v16 = [v15 unsignedShortValue];

        if (v16)
        {
          id v17 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            id v18 = [v3 objectForKeyedSubscript:@"originalStableHash"];
            int v19 = 138543362;
            id v20 = v18;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Adjusted asset missing full size render fingerprint. Original fingerprint: %{public}@", (uint8_t *)&v19, 0xCu);
          }
          id v11 = 0;
        }
        else if (v6 != 1 {
               || ([v3 objectForKeyedSubscript:@"originatingAssetIdentifier"],
        }
                   (id v11 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v11 = [v3 objectForKeyedSubscript:@"originalStableHash"];
        }
      }
    }
    else
    {
      id v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      if (!v11) {
        goto LABEL_18;
      }
    }
    [*(id *)(a1 + 56) _addFingerprint:v11 oid:v4 map:*(void *)(a1 + 64)];
    goto LABEL_26;
  }
  if (v6 == 1
    && ([v3 objectForKeyedSubscript:@"originatingAssetIdentifier"],
        (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = v10;
    id v12 = v11;
  }
  else
  {
    uint64_t v13 = [v3 objectForKeyedSubscript:@"originalStableHash"];
    if (!v13)
    {
      uint64_t v13 = [v3 objectForKeyedSubscript:@"fingerprint"];
    }
    id v12 = (void *)v13;
    id v11 = 0;
  }
  id v14 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138543362;
    id v20 = v12;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Fetch result had missing asset oid for identifier: %{public}@", (uint8_t *)&v19, 0xCu);
  }

LABEL_26:
}

void __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ((unint64_t)[v7 count] >= 2)
  {
    id v4 = [PLDuplicateGroup alloc];
    id v5 = (void *)[v7 copy];
    int v6 = [(PLDuplicateGroup *)v4 initWithGroupResults:v5];

    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (id)detectDuplicatesWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v40 = 0;
  id v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__61986;
  uint64_t v44 = __Block_byref_object_dispose__61987;
  id v45 = 0;
  id v7 = [(PLDuplicateDetectorMetadata *)self _fingerprintRequestWithPhotoLibrary:v6];
  id v8 = [(PLDuplicateDetectorMetadata *)self _fullSizePreviewFingerprintRequestWithPhotoLibrary:v6];
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__61986;
  long long v38 = __Block_byref_object_dispose__61987;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__61986;
  v32 = __Block_byref_object_dispose__61987;
  id v33 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__PLDuplicateDetectorMetadata_detectDuplicatesWithPhotoLibrary_error___block_invoke;
  v20[3] = &unk_1E586FC50;
  id v9 = v6;
  id v21 = v9;
  id v25 = &v34;
  id v10 = v7;
  id v22 = v10;
  __int16 v23 = self;
  id v26 = &v40;
  __int16 v27 = &v28;
  id v11 = v8;
  id v24 = v11;
  uint64_t v12 = [v9 performBlockAndWait:v20];
  if (v35[5] && v29[5])
  {
    uint64_t v13 = (void *)MEMORY[0x19F38D3B0](v12);
    id v14 = [(PLDuplicateDetectorMetadata *)self _generateDuplicateContainerFromResults:v35[5] fullsizeFingerprintResults:v29[5]];
    id v15 = v41;
    obuint64_t j = v41[5];
    BOOL v16 = [(PLDuplicateDetectorMetadata *)self _postProcessDuplicateWithPhotoLibrary:v9 resultContainer:v14 error:&obj];
    objc_storeStrong(v15 + 5, obj);
    id v17 = v41[5];
    if (!v16 && a4) {
      goto LABEL_5;
    }
  }
  else
  {
    id v17 = v41[5];
    id v14 = 0;
    if (a4)
    {
LABEL_5:
      id v17 = v17;
      *a4 = v17;
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v14;
}

void __70__PLDuplicateDetectorMetadata_detectDuplicatesWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8B9B0];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [v2 startedQueryStatsWithContext:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = [v5 executeFetchRequest:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "count"));
  if (v11)
  {
    uint64_t v12 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v14;
      __int16 v35 = 2112;
      uint64_t v36 = @"Main originals query";
      __int16 v37 = 2112;
      long long v38 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v15 = (void *)MEMORY[0x1E4F8B9B0];
    BOOL v16 = [*(id *)(a1 + 32) managedObjectContext];
    id v17 = [v15 startedQueryStatsWithContext:v16];

    id v18 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    id v31 = *(id *)(v20 + 40);
    uint64_t v21 = [v18 executeFetchRequest:v19 error:&v31];
    objc_storeStrong((id *)(v20 + 40), v31);
    uint64_t v22 = *(void *)(*(void *)(a1 + 80) + 8);
    __int16 v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    id v24 = objc_msgSend(v17, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "count"));
    if (v24)
    {
      id v25 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = (objc_class *)objc_opt_class();
        __int16 v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138412802;
        uint64_t v34 = v27;
        __int16 v35 = 2112;
        uint64_t v36 = @"Main fullsize query";
        __int16 v37 = 2112;
        long long v38 = v24;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
      }
    }
  }
  else
  {
    id v24 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = (objc_class *)objc_opt_class();
      id v29 = NSStringFromClass(v28);
      uint64_t v30 = *(__CFString **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v29;
      __int16 v35 = 2112;
      uint64_t v36 = v30;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to fetch request for %{public}@. Error: %@", buf, 0x16u);
    }
    id v17 = v4;
  }
}

- (PLDuplicateDetectorMetadata)initWithSourceOIDs:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLDuplicateDetectorMetadata;
  uint64_t v6 = [(PLDuplicateDetectorMetadata *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceAssetOIDs, a3);
    combinedLimitedSelectionIdentifiers = v7->_combinedLimitedSelectionIdentifiers;
    v7->_combinedLimitedSelectionIdentifiers = 0;
  }
  return v7;
}

@end