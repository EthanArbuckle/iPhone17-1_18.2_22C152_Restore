@interface PLCloudResourcePrefetchPredicates
+ (double)_resourceLastPrunedPrefetchTimeInterval;
+ (id)_assetIsUnadjustedPredicate;
+ (id)_assetPredicateForCPLResourceType:(unint64_t)a3 additionalAssetPredicates:(id)a4 additionalResourcePredicates:(id)a5 options:(id)a6;
+ (id)_excludeMomentShareAssetsPredicate;
+ (id)_irisConditionPredicate;
+ (id)_masterPredicateForCPLResourceType:(unint64_t)a3 additionalAssetPredicates:(id)a4 additionalResourcePredicates:(id)a5 options:(id)a6;
+ (id)_missingThumbnailPredicate;
+ (id)_predicateForImageResourcePixelsLessOrEqual:(int64_t)a3;
+ (id)_predicateForMaxFilesize:(unint64_t)a3;
+ (id)_predicateForResourceCreatedAfterDate:(id)a3;
+ (id)_predicateToPrefetchMemoryKeyAssets:(id)a3 photoLibrary:(id)a4 options:(id)a5;
+ (id)_predicateToPrefetchSuggestions:(id)a3 photoLibrary:(id)a4 options:(id)a5;
+ (id)_prefetchResourceForAsset:(id)a3 inResourceTypes:(id)a4 options:(id)a5;
+ (id)_resourcesToPrefetchForAsset:(id)a3 options:(id)a4;
+ (id)predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:(BOOL)a3;
+ (id)predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions:(id)a3 photoLibrary:(id)a4;
+ (id)predicateToPrefetchHighlightWithUUIDs:(id)a3 photoLibrary:(id)a4;
+ (id)predicateToPrefetchMediaMetadataResourcesWithOptions:(id)a3 photoLibrary:(id)a4;
+ (id)predicateToPrefetchMemories:(id)a3 photoLibrary:(id)a4 options:(id)a5;
+ (id)predicatesForComputeSync:(id)a3 photoLibrary:(id)a4;
+ (id)predicatesForMemories:(id)a3 photoLibrary:(id)a4;
+ (id)predicatesForNonThumbnails:(id)a3 lastCompletePrefetchDate:(id)a4;
+ (id)predicatesForOriginalResources:(id)a3 additionalResourcePredicates:(id)a4;
+ (id)predicatesForThumbnails:(id)a3;
+ (id)predicatesForWidget:(id)a3 photoLibrary:(id)a4;
@end

@implementation PLCloudResourcePrefetchPredicates

+ (id)predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:(BOOL)a3
{
  BOOL v29 = a3;
  v35[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = +[PLInternalResource originalCPLResourceTypesForMaster];
  v6 = [v4 predicateWithFormat:@"%K IN %@", @"dataStoreSubtype", v5];
  v35[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"version", 0);
  v35[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v9 = [v3 andPredicateWithSubpredicates:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = (void *)MEMORY[0x1E4F28F60];
  v12 = +[PLInternalResource originalCPLResourceTypesForAsset];
  v13 = [v11 predicateWithFormat:@"%K IN %@", @"dataStoreSubtype", v12];
  v34[0] = v13;
  v14 = (void *)MEMORY[0x1E4F28BA0];
  v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"version", 2);
  v33[0] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"version", 1);
  v33[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v18 = [v14 orPredicateWithSubpredicates:v17];
  v34[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v20 = [v10 andPredicateWithSubpredicates:v19];

  if (v29)
  {
    v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"localAvailability", 1);
    v22 = (void *)MEMORY[0x1E4F28BA0];
    v31[0] = v9;
    v31[1] = v20;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    v24 = [v22 orPredicateWithSubpredicates:v23];
    v32[0] = v24;
    v32[1] = v21;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v26 = [v22 andPredicateWithSubpredicates:v25];
  }
  else
  {
    v27 = (void *)MEMORY[0x1E4F28BA0];
    v30[0] = v9;
    v30[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v26 = [v27 orPredicateWithSubpredicates:v21];
  }

  return v26;
}

+ (id)predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions:(id)a3 photoLibrary:(id)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke;
  v23 = &unk_1E5873A50;
  id v8 = v5;
  id v24 = v8;
  id v9 = v6;
  id v25 = v9;
  id v10 = v7;
  id v26 = v10;
  [v9 performBlockAndWait:&v20];
  if (![v10 count]) {
    goto LABEL_4;
  }
  v11 = (void *)MEMORY[0x1E4F28BA0];
  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset", v10, v20, v21, v22, v23, v24, v25];
  v28[0] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"cloudLocalState", 3);
  v28[1] = v13;
  v14 = [v8 prefetchConfiguration];
  v15 = +[PLInternalResource prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:](PLInternalResource, "prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:", 27, 1, [v14 cloudResourceMaxPrefetchRetry], objc_msgSend(v8, "excludeDynamicResources"), 0);
  v28[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v17 = [v11 andPredicateWithSubpredicates:v16];

  if (v17)
  {
    v27 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  }
  else
  {
LABEL_4:
    v18 = 0;
  }

  return v18;
}

void __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke(id *a1)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"additionalAssetAttributes");
  v22[0] = v4;
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NULL", @"data");
  v22[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v7 = [v3 andPredicateWithSubpredicates:v6];
  [v2 setPredicate:v7];

  [v2 setResultType:2];
  v21[0] = @"additionalAssetAttributes";
  v21[1] = @"additionalAssetAttributes.asset";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v2 setRelationshipKeyPathsForPrefetching:v8];

  uint64_t v20 = @"additionalAssetAttributes.asset";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v2 setPropertiesToFetch:v9];

  id v10 = [a1[4] prefetchConfiguration];
  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(v10, "cloudResourceMediaMetadataOverflowMaxResourcesPerFetch"));

  v11 = [a1[5] managedObjectContext];
  id v17 = 0;
  v12 = [v11 executeFetchRequest:v2 error:&v17];
  id v13 = v17;

  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke_2;
    v15[3] = &unk_1E5871D18;
    v16 = a1[6];
    [v12 enumerateObjectsUsingBlock:v15];
    v14 = v16;
  }
  else
  {
    v14 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch internal resources for metadata overflow: %@", buf, 0xCu);
    }
  }
}

void __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"additionalAssetAttributes.asset"];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

+ (id)predicateToPrefetchMediaMetadataResourcesWithOptions:(id)a3 photoLibrary:(id)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __103__PLCloudResourcePrefetchPredicates_predicateToPrefetchMediaMetadataResourcesWithOptions_photoLibrary___block_invoke;
  v23 = &unk_1E5873A50;
  id v8 = v5;
  id v24 = v8;
  id v9 = v6;
  id v25 = v9;
  id v10 = v7;
  id v26 = v10;
  [v9 performBlockAndWait:&v20];
  if (![v10 count]) {
    goto LABEL_4;
  }
  v11 = (void *)MEMORY[0x1E4F28BA0];
  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset", v10, v20, v21, v22, v23, v24, v25];
  v28[0] = v12;
  id v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"cloudLocalState", 3);
  v28[1] = v13;
  v14 = [v8 prefetchConfiguration];
  v15 = +[PLInternalResource prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:](PLInternalResource, "prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:", 10, 0, [v14 cloudResourceMaxPrefetchRetry], objc_msgSend(v8, "excludeDynamicResources"), 0);
  v28[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  id v17 = [v11 andPredicateWithSubpredicates:v16];

  if (v17)
  {
    v27 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  }
  else
  {
LABEL_4:
    v18 = 0;
  }

  return v18;
}

void __103__PLCloudResourcePrefetchPredicates_predicateToPrefetchMediaMetadataResourcesWithOptions_photoLibrary___block_invoke(id *a1)
{
  void v33[2] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"cloudMaster");
  v33[0] = v4;
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NULL", @"data");
  v33[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  id v7 = [v3 andPredicateWithSubpredicates:v6];
  [v2 setPredicate:v7];

  v32[0] = @"cloudMaster";
  v32[1] = @"cloudMaster.assets";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v2 setRelationshipKeyPathsForPrefetching:v8];

  id v9 = [a1[4] prefetchConfiguration];
  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(v9, "cloudResourceMediaMetadataOverflowMaxResourcesPerFetch"));

  id v10 = [a1[5] managedObjectContext];
  id v28 = 0;
  v11 = [v10 executeFetchRequest:v2 error:&v28];
  id v12 = v28;

  if (v11)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v22 = v11;
      id v23 = v12;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) cloudMaster];
          id v19 = [v18 assets];
          uint64_t v20 = [v19 anyObject];
          uint64_t v21 = [v20 objectID];

          if (v21) {
            [a1[6] addObject:v21];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }
      while (v15);
      v11 = v22;
      id v12 = v23;
    }
  }
  else
  {
    id v13 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch internal resources for metadata overflow: %@", buf, 0xCu);
    }
  }
}

+ (id)predicatesForComputeSync:(id)a3 photoLibrary:(id)a4
{
  v24[8] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  uint64_t v20 = [v6 dateByAddingTimeInterval:-86400.0];

  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v22 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreClassID", 0);
  v24[0] = v22;
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"resourceType", 14);
  v24[1] = v21;
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"recipeID", 327689);
  v24[2] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"localAvailability", 0xFFFFFFFFLL);
  v24[3] = v9;
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"remoteAvailability", 1);
  v24[4] = v10;
  v11 = (void *)MEMORY[0x1E4F28F60];
  id v12 = [v5 prefetchConfiguration];

  id v13 = objc_msgSend(v11, "predicateWithFormat:", @"%K <= %d", @"cloudPrefetchCount", objc_msgSend(v12, "cloudResourceMaxPrefetchRetry"));
  v24[5] = v13;
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"cloudLastPrefetchDate", v20];
  v24[6] = v14;
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"cloudPrunedAt");
  v24[7] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:8];
  id v17 = [v7 andPredicateWithSubpredicates:v16];

  id v23 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];

  return v18;
}

+ (id)predicatesForWidget:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  if (![v6 prefetchMode])
  {
    id v9 = [v7 managedObjectContext];
    id v10 = +[PLSuggestion suggestionsToPrefetchInManagedObjectContext:v9];

    v11 = [a1 _predicateToPrefetchSuggestions:v10 photoLibrary:v7 options:v6];
    if (v11) {
      [v8 addObject:v11];
    }
    id v12 = [v7 managedObjectContext];
    id v13 = +[PLMemory memoriesToPrefetchForWidgetInManagedObjectContext:v12];

    uint64_t v14 = [a1 _predicateToPrefetchMemoryKeyAssets:v13 photoLibrary:v7 options:v6];
    if (v14) {
      [v8 addObject:v14];
    }
  }
  return v8;
}

+ (id)predicatesForMemories:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  if (![v6 prefetchMode])
  {
    id v9 = [v6 prefetchConfiguration];
    id v10 = +[PLMemory memoriesToPrefetchInPhotoLibrary:v7 prefetchConfiguration:v9];

    v11 = [a1 predicateToPrefetchMemories:v10 photoLibrary:v7 options:v6];
    if (v11) {
      [v8 addObject:v11];
    }
  }
  return v8;
}

+ (id)predicatesForNonThumbnails:(id)a3 lastCompletePrefetchDate:(id)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:20];
  uint64_t v9 = [v6 prefetchMode];
  if (v9 == 1)
  {
    uint64_t v21 = [a1 predicatesForOriginalResources:v6 additionalResourcePredicates:0];
    [v8 addObjectsFromArray:v21];

    goto LABEL_20;
  }
  if (v9) {
    goto LABEL_20;
  }
  [MEMORY[0x1E4F59940] derivativeGenerationThreshold];
  float v11 = v10;
  unint64_t v12 = [MEMORY[0x1E4F59940] maxPixelSizeForResourceType:4];
  [MEMORY[0x1E4F59940] derivativeGenerationThreshold];
  float v14 = v13;
  unint64_t v15 = [MEMORY[0x1E4F59940] maxPixelSizeForResourceType:3];
  context = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 prefetchOptimizeMode] != 2)
  {
    id v17 = [v6 prefetchConfiguration];
    v18 = objc_msgSend(a1, "_predicateForMaxFilesize:", objc_msgSend(v17, "cloudResourcePrefetchMaxFileSize"));
    [v16 addObject:v18];
  }
  if (v7)
  {
    id v19 = [v7 dateByAddingTimeInterval:-3600.0];
    if (!v19) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if ([v6 prefetchOptimizeMode] != 2)
  {
    v22 = [v6 prefetchConfiguration];
    uint64_t v23 = [v22 optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow];

    if (v23)
    {
      long long v24 = (void *)MEMORY[0x1E4F1C9C8];
      long long v25 = [v6 prefetchConfiguration];
      id v19 = objc_msgSend(v24, "dateWithTimeIntervalSinceNow:", (double)-objc_msgSend(v25, "optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow"));

      if (v19)
      {
LABEL_7:
        uint64_t v20 = [a1 _predicateForResourceCreatedAfterDate:v19];
        [v16 addObject:v20];
      }
    }
  }
LABEL_12:
  uint64_t v26 = [v6 prefetchOptimizeMode];
  switch(v26)
  {
    case 2:
      v45 = [a1 predicatesForOriginalResources:v6 additionalResourcePredicates:v16];
      [v8 addObjectsFromArray:v45];
      goto LABEL_17;
    case 1:
      v48 = [a1 _assetPredicateForCPLResourceType:2 additionalAssetPredicates:0 additionalResourcePredicates:v16 options:v6];
      [v8 addObject:v48];

      v49 = [a1 _assetPredicateForCPLResourceType:16 additionalAssetPredicates:0 additionalResourcePredicates:v16 options:v6];
      [v8 addObject:v49];

      v50 = [a1 _predicateForImageResourcePixelsLessOrEqual:(unint64_t)(float)(v14 * (float)v15)];
      v51 = [v16 arrayByAddingObject:v50];

      v52 = [a1 _assetIsUnadjustedPredicate];
      v63 = v52;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
      v54 = [a1 _masterPredicateForCPLResourceType:1 additionalAssetPredicates:v53 additionalResourcePredicates:v51 options:v6];
      [v8 addObject:v54];

      v55 = [a1 _assetPredicateForCPLResourceType:19 additionalAssetPredicates:0 additionalResourcePredicates:v16 options:v6];
      [v8 addObject:v55];

      v56 = [a1 _assetIsUnadjustedPredicate];
      v62 = v56;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
      v58 = [a1 _masterPredicateForCPLResourceType:18 additionalAssetPredicates:v57 additionalResourcePredicates:v16 options:v6];
      [v8 addObject:v58];

      break;
    case 0:
      unint64_t v60 = (unint64_t)(float)(v11 * (float)v12);
      long long v27 = +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:2 version:2];
      id v28 = [v16 arrayByAddingObject:v27];
      BOOL v29 = [a1 _assetPredicateForCPLResourceType:4 additionalAssetPredicates:0 additionalResourcePredicates:v28 options:v6];
      [v8 addObject:v29];

      id v30 = +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:1 version:0];
      v31 = [v16 arrayByAddingObject:v30];
      v32 = [a1 _masterPredicateForCPLResourceType:4 additionalAssetPredicates:0 additionalResourcePredicates:v31 options:v6];
      [v8 addObject:v32];

      v33 = [a1 _irisConditionPredicate];
      v66[0] = v33;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
      v35 = +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:19 version:2];
      v36 = [v16 arrayByAddingObject:v35];
      v37 = [a1 _assetPredicateForCPLResourceType:6 additionalAssetPredicates:v34 additionalResourcePredicates:v36 options:v6];
      [v8 addObject:v37];

      v38 = [a1 _irisConditionPredicate];
      v65 = v38;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
      v40 = +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:18 version:0];
      v41 = [v16 arrayByAddingObject:v40];
      v42 = [a1 _masterPredicateForCPLResourceType:6 additionalAssetPredicates:v39 additionalResourcePredicates:v41 options:v6];
      [v8 addObject:v42];

      v43 = [a1 _predicateForImageResourcePixelsLessOrEqual:v60];
      [v16 addObject:v43];

      v44 = [a1 _assetPredicateForCPLResourceType:2 additionalAssetPredicates:0 additionalResourcePredicates:v16 options:v6];
      [v8 addObject:v44];

      v45 = [a1 _assetIsUnadjustedPredicate];
      v64 = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
      v47 = [a1 _masterPredicateForCPLResourceType:1 additionalAssetPredicates:v46 additionalResourcePredicates:v16 options:v6];
      [v8 addObject:v47];

LABEL_17:
      break;
  }

LABEL_20:

  return v8;
}

+ (id)predicatesForOriginalResources:(id)a3 additionalResourcePredicates:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:20];
  uint64_t v9 = +[PLInternalResource originalCPLResourceTypesForMaster];
  float v10 = [v9 arrayByAddingObject:&unk_1EEBEFDB0];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "unsignedIntegerValue"), 0, v7, v6);
        [v8 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = +[PLInternalResource originalCPLResourceTypesForAsset];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "unsignedIntegerValue"), 0, v7, v6);
        [v8 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  return v8;
}

+ (id)predicatesForThumbnails:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  if ((PLIsEDUMode() & 1) == 0)
  {
    id v6 = [a1 _missingThumbnailPredicate];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v8 = [a1 _assetPredicateForCPLResourceType:5 additionalAssetPredicates:v7 additionalResourcePredicates:0 options:v4];
    [v5 addObject:v8];

    uint64_t v9 = [a1 _missingThumbnailPredicate];
    uint64_t v13 = v9;
    float v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    id v11 = [a1 _masterPredicateForCPLResourceType:5 additionalAssetPredicates:v10 additionalResourcePredicates:0 options:v4];
    [v5 addObject:v11];
  }
  return v5;
}

+ (id)predicateToPrefetchHighlightWithUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__93697;
  uint64_t v19 = __Block_byref_object_dispose__93698;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PLCloudResourcePrefetchPredicates_predicateToPrefetchHighlightWithUUIDs_photoLibrary___block_invoke;
  v11[3] = &unk_1E5875340;
  id v7 = v5;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  uint64_t v14 = &v15;
  [v8 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __88__PLCloudResourcePrefetchPredicates_predicateToPrefetchHighlightWithUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    v40 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
    uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", *(void *)(a1 + 32)];
    uint64_t v36 = a1;
    v3 = [*(id *)(a1 + 40) managedObjectContext];
    id v59 = 0;
    v38 = (void *)v2;
    id v4 = +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:v3 predicate:v2 keyPathsForPrefetching:0 error:&v59];
    id v37 = v59;

    if (v4)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v35 = v4;
      obuint64_t j = v4;
      uint64_t v42 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
      if (v42)
      {
        uint64_t v41 = *(void *)v56;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v56 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = v5;
            id v6 = *(void **)(*((void *)&v55 + 1) + 8 * v5);
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            switch([v6 kind])
            {
              case 0u:
              case 3u:
                id v8 = [v6 assets];
                id v9 = [v8 allObjects];
                [v7 addObjectsFromArray:v9];

                goto LABEL_14;
              case 1u:
                uint64_t v10 = [v6 monthKeyAssetPrivate];
                goto LABEL_12;
              case 2u:
                uint64_t v10 = [v6 yearKeyAssetPrivate];
LABEL_12:
                id v8 = (void *)v10;
                if (v10) {
                  [v7 addObject:v10];
                }
LABEL_14:

                break;
              default:
                break;
            }
            v43 = v6;
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            id v45 = v7;
            uint64_t v12 = [v45 countByEnumeratingWithState:&v51 objects:v65 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v46 = *(void *)v52;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v52 != v46) {
                    objc_enumerationMutation(v45);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                  long long v47 = 0u;
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  uint64_t v16 = [v15 modernResources];
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v64 count:16];
                  if (v17)
                  {
                    uint64_t v18 = v17;
                    uint64_t v19 = *(void *)v48;
                    do
                    {
                      for (uint64_t j = 0; j != v18; ++j)
                      {
                        if (*(void *)v48 != v19) {
                          objc_enumerationMutation(v16);
                        }
                        uint64_t v21 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                        if (([v21 isLocallyAvailable] & 1) == 0)
                        {
                          if ([v21 isCPLOriginalResource]
                            && ([v21 uniformTypeIdentifier],
                                v22 = objc_claimAutoreleasedReturnValue(),
                                int v23 = [v22 conformsToRawImage],
                                v22,
                                !v23)
                            || [v21 cplType] == 2)
                          {
                            long long v24 = [v21 objectID];
                            [v11 addObject:v24];
                          }
                        }
                      }
                      uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v64 count:16];
                    }
                    while (v18);
                  }
                }
                uint64_t v13 = [v45 countByEnumeratingWithState:&v51 objects:v65 count:16];
              }
              while (v13);
            }

            if ([v11 count])
            {
              long long v25 = PLResourceCachingGetLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v26 = [v11 count];
                long long v27 = [v43 uuid];
                *(_DWORD *)buf = 134218242;
                uint64_t v61 = v26;
                __int16 v62 = 2112;
                v63 = v27;
                _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Will prefetch %lu resources for highlight %@", buf, 0x16u);
              }
              long long v28 = [v11 allObjects];
              [v40 addObjectsFromArray:v28];
            }
            uint64_t v5 = v44 + 1;
          }
          while (v44 + 1 != v42);
          uint64_t v42 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
        }
        while (v42);
      }

      id v4 = v35;
      long long v29 = v37;
      if (![v40 count]) {
        goto LABEL_48;
      }
      long long v30 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = [v40 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v61 = v31;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Will prefetch %lu highlight resources", buf, 0xCu);
      }

      uint64_t v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v40];
      uint64_t v33 = *(void *)(*(void *)(v36 + 48) + 8);
      uint64_t v34 = *(NSObject **)(v33 + 40);
      *(void *)(v33 + 40) = v32;
    }
    else
    {
      uint64_t v34 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v29 = v37;
        uint64_t v61 = (uint64_t)v37;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to fetch highlights: %@", buf, 0xCu);
      }
      else
      {
        long long v29 = v37;
      }
    }

LABEL_48:
  }
}

+ (id)predicateToPrefetchMemories:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__93697;
  long long v24 = __Block_byref_object_dispose__93698;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__PLCloudResourcePrefetchPredicates_predicateToPrefetchMemories_photoLibrary_options___block_invoke;
  v15[3] = &unk_1E5873DC0;
  id v11 = v8;
  id v16 = v11;
  id v12 = v10;
  uint64_t v18 = &v20;
  id v19 = a1;
  id v17 = v12;
  [v9 performBlockAndWait:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __86__PLCloudResourcePrefetchPredicates_predicateToPrefetchMemories_photoLibrary_options___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v54;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v54 != v36) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v53 + 1) + 8 * v3);
        uint64_t v5 = [v4 userCuratedAssets];
        uint64_t v40 = v3;
        if ([v5 count]) {
          [v4 userCuratedAssets];
        }
        else {
        id v6 = [v4 curatedAssets];
        }

        v38 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"dateCreated" ascending:1];
        uint64_t v61 = v38;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
        v39 = v6;
        id v8 = [v6 sortedArrayUsingDescriptors:v7];

        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v42 = v8;
        uint64_t v9 = [v42 countByEnumeratingWithState:&v49 objects:v60 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          int v11 = 0;
          int v12 = 0;
          uint64_t v43 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v50 != v43) {
                objc_enumerationMutation(v42);
              }
              uint64_t v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              if ([v14 isVideo]
                && ([*(id *)(a1 + 40) prefetchConfiguration],
                    uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                    int v16 = [v15 memoryMaxPrefetchVideosCount],
                    v15,
                    v12 < v16))
              {
                [v41 addObject:v14];
                ++v12;
              }
              else if ([v14 isPhoto] {
                     && ([*(id *)(a1 + 40) prefetchConfiguration],
              }
                         id v17 = objc_claimAutoreleasedReturnValue(),
                         int v18 = [v17 memoryMaxPrefetchPhotosCount],
                         v17,
                         v11 < v18))
              {
                [v41 addObject:v14];
                ++v11;
              }
              else
              {
                id v19 = [*(id *)(a1 + 40) prefetchConfiguration];
                if (v11 >= (int)[v19 memoryMaxPrefetchPhotosCount])
                {
                  uint64_t v20 = [*(id *)(a1 + 40) prefetchConfiguration];
                  int v21 = [v20 memoryMaxPrefetchVideosCount];

                  if (v12 >= v21) {
                    goto LABEL_25;
                  }
                }
                else
                {
                }
              }
            }
            uint64_t v10 = [v42 countByEnumeratingWithState:&v49 objects:v60 count:16];
          }
          while (v10);
        }
LABEL_25:

        uint64_t v22 = [v4 keyAsset];
        if (v22) {
          [v41 addObject:v22];
        }
        uint64_t v44 = (void *)v22;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v23 = v41;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v46 != v26) {
                objc_enumerationMutation(v23);
              }
              long long v28 = [*(id *)(a1 + 56) _resourcesToPrefetchForAsset:*(void *)(*((void *)&v45 + 1) + 8 * j) options:*(void *)(a1 + 40)];
              if ([v28 count])
              {
                long long v29 = PLResourceCachingGetLog();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  long long v30 = [v4 uuid];
                  *(_DWORD *)buf = 138543362;
                  long long v58 = v30;
                  _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Will prefetch resources for memory %{public}@", buf, 0xCu);
                }
                uint64_t v31 = PLResourceCachingGetLog();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v58 = v28;
                  _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEBUG, "Memory asset resources to prefetch: %@", buf, 0xCu);
                }

                [v2 addObjectsFromArray:v28];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v59 count:16];
          }
          while (v25);
        }

        uint64_t v3 = v40 + 1;
      }
      while (v40 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v37);
  }

  if ([v2 count])
  {
    uint64_t v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v2];
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;
  }
}

+ (id)_predicateToPrefetchMemoryKeyAssets:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__93697;
  uint64_t v24 = __Block_byref_object_dispose__93698;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__PLCloudResourcePrefetchPredicates__predicateToPrefetchMemoryKeyAssets_photoLibrary_options___block_invoke;
  v15[3] = &unk_1E5873DC0;
  id v11 = v8;
  id v16 = v11;
  id v19 = a1;
  id v12 = v10;
  id v17 = v12;
  int v18 = &v20;
  [v9 performBlockAndWait:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __94__PLCloudResourcePrefetchPredicates__predicateToPrefetchMemoryKeyAssets_photoLibrary_options___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [v8 keyAsset];
        if (v9)
        {
          id v10 = [*(id *)(a1 + 56) _resourcesToPrefetchForAsset:v9 options:*(void *)(a1 + 40)];
          if ([v10 count])
          {
            id v11 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              id v12 = [v8 uuid];
              *(_DWORD *)buf = 138543362;
              uint64_t v22 = v12;
              _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Will prefetch resources for widget memory %{public}@", buf, 0xCu);
            }
            id v13 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v22 = v10;
              _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Widget Memory asset resources to prefetch: %@", buf, 0xCu);
            }

            [v2 addObjectsFromArray:v10];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v2];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

+ (id)_predicateToPrefetchSuggestions:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__93697;
  uint64_t v24 = __Block_byref_object_dispose__93698;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__PLCloudResourcePrefetchPredicates__predicateToPrefetchSuggestions_photoLibrary_options___block_invoke;
  v15[3] = &unk_1E5873DC0;
  id v11 = v8;
  id v16 = v11;
  id v19 = a1;
  id v12 = v10;
  id v17 = v12;
  long long v18 = &v20;
  [v9 performBlockAndWait:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __90__PLCloudResourcePrefetchPredicates__predicateToPrefetchSuggestions_photoLibrary_options___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v3;
        uint64_t v4 = *(void **)(*((void *)&v28 + 1) + 8 * v3);
        uint64_t v5 = [v4 keyAssets];
        uint64_t v6 = [v4 keyAssets];
        id v7 = [v5 setByAddingObjectsFromSet:v6];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = [*(id *)(a1 + 56) _resourcesToPrefetchForAsset:*(void *)(*((void *)&v24 + 1) + 8 * i) options:*(void *)(a1 + 40)];
              if ([v13 count])
              {
                uint64_t v14 = PLResourceCachingGetLog();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v15 = [v4 uuid];
                  *(_DWORD *)buf = 138543362;
                  uint64_t v33 = v15;
                  _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Will prefetch resources for suggestion %{public}@", buf, 0xCu);
                }
                id v16 = PLResourceCachingGetLog();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v33 = v13;
                  _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Suggestion asset resources to prefetch: %@", buf, 0xCu);
                }

                [v2 addObjectsFromArray:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v10);
        }

        uint64_t v3 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v22);
  }

  if ([v2 count])
  {
    uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v2];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

+ (id)_resourcesToPrefetchForAsset:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  if ([v7 prefetchOptimizeMode])
  {
    [v6 isVideo];
  }
  else
  {
    [v9 addObject:&unk_1EEBEFD50];
    if ([v6 hdrType] == 5
      && [MEMORY[0x1E4F8CC30] currentDeviceIsEligibleForHDRPlayback])
    {
      uint64_t v11 = &unk_1EEBEFD68;
    }
    else
    {
      uint64_t v11 = &unk_1EEBEFD80;
    }
    [v10 addObject:v11];
  }
  [v9 addObjectsFromArray:&unk_1EEBF2228];
  [v10 addObjectsFromArray:&unk_1EEBF2240];
  id v12 = [a1 _prefetchResourceForAsset:v6 inResourceTypes:v9 options:v7];
  if (v12) {
    [v8 addObject:v12];
  }
  id v13 = [a1 _prefetchResourceForAsset:v6 inResourceTypes:v10 options:v7];
  if (v13) {
    [v8 addObject:v13];
  }

  return v8;
}

+ (id)_prefetchResourceForAsset:(id)a3 inResourceTypes:(id)a4 options:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v38 = a1;
    uint64_t v14 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        char v17 = [v8 hasAdjustments];
        uint64_t v18 = [v16 unsignedIntegerValue];
        if (v17) {
          [v8 assetResourceForCPLType:v18];
        }
        else {
        id v19 = [v8 masterResourceForCPLType:v18];
        }
        if ([v19 isLocallyAvailable])
        {
          uint64_t v23 = 0;
          goto LABEL_26;
        }
        if (![v10 excludeDynamicResources]
          || (uint64_t v20 = (void *)MEMORY[0x1E4F59940],
              [v19 fingerprint],
              uint64_t v21 = objc_claimAutoreleasedReturnValue(),
              LOBYTE(v20) = [v20 isDynamicFingerprint:v21],
              v21,
              (v20 & 1) == 0))
        {
          if ([v19 isRemotelyAvailable])
          {
            uint64_t v22 = [v19 scopedIdentifier];

            if (v22)
            {
              long long v24 = [v19 cloudPrunedAt];
              unint64_t v25 = [v19 dataLength];
              long long v26 = [v10 prefetchConfiguration];
              if (v25 > [v26 cloudResourcePrefetchMaxFileSize]) {
                goto LABEL_23;
              }
              int v27 = [v19 cloudPrefetchCount];
              long long v28 = [v10 prefetchConfiguration];
              if (v27 > (int)[v28 cloudResourceMaxPrefetchRetry]) {
                goto LABEL_22;
              }
              long long v29 = [MEMORY[0x1E4F1C9C8] date];
              long long v30 = [v19 cloudLastPrefetchDate];
              [v29 timeIntervalSinceDate:v30];
              if (v31 >= 86400.0)
              {
                if (v24)
                {
                  uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
                  [v33 timeIntervalSinceDate:v24];
                  double v35 = v34;
                  [v38 _resourceLastPrunedPrefetchTimeInterval];
                  double v37 = v36;

                  if (v35 < v37) {
                    goto LABEL_24;
                  }
                }
                else
                {
                }
                uint64_t v23 = [v19 objectID];
              }
              else
              {

LABEL_22:
LABEL_23:

LABEL_24:
                uint64_t v23 = 0;
              }

LABEL_26:
              goto LABEL_27;
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  uint64_t v23 = 0;
LABEL_27:

  return v23;
}

+ (double)_resourceLastPrunedPrefetchTimeInterval
{
  double v2 = 86400.0;
  if (MEMORY[0x19F38BDA0](a1, a2))
  {
    if (_resourceLastPrunedPrefetchTimeInterval_onceToken != -1) {
      dispatch_once(&_resourceLastPrunedPrefetchTimeInterval_onceToken, &__block_literal_global_93735);
    }
    if (*(double *)&_resourceLastPrunedPrefetchTimeInterval_lastPrunedPrefetchTimeIntervalDefault > 0.0) {
      return *(double *)&_resourceLastPrunedPrefetchTimeInterval_lastPrunedPrefetchTimeIntervalDefault;
    }
  }
  return v2;
}

void __76__PLCloudResourcePrefetchPredicates__resourceLastPrunedPrefetchTimeInterval__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  *(double *)&_resourceLastPrunedPrefetchTimeInterval_lastPrunedPrefetchTimeIntervalDefault = (double)[v0 integerForKey:@"PLResourceLastPrunedPrefetchTimeInterval"];
}

+ (id)_masterPredicateForCPLResourceType:(unint64_t)a3 additionalAssetPredicates:(id)a4 additionalResourcePredicates:(id)a5 options:(id)a6
{
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init(v10);
  uint64_t v14 = [v11 prefetchConfiguration];
  uint64_t v15 = [v14 cloudResourceMaxPrefetchRetry];
  uint64_t v16 = [v11 excludeDynamicResources];

  uint64_t v17 = +[PLInternalResource prefetchResourcePredicateForCPLResourceType:a3 isAssetResource:0 maxRetry:v15 excludeDynamicResources:v16 additionalResourcePredicates:v12];

  [v13 addObject:v17];
  uint64_t v18 = +[PLInternalResource originalCPLResourceTypesForMaster];
  id v19 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(v17) = [v18 containsObject:v19];

  if ((v17 & 1) == 0)
  {
    uint64_t v20 = +[PLManagedAsset predicateForUnadjustedAssetsWithKeyPathToAsset:@"asset"];
    [v13 addObject:v20];
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"asset.cloudLocalState", 1);
  [v13 addObject:v21];

  if ([v9 count]) {
    [v13 addObjectsFromArray:v9];
  }
  uint64_t v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];

  return v22;
}

+ (id)_assetPredicateForCPLResourceType:(unint64_t)a3 additionalAssetPredicates:(id)a4 additionalResourcePredicates:(id)a5 options:(id)a6
{
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init(v10);
  uint64_t v14 = [v11 prefetchConfiguration];
  uint64_t v15 = [v14 cloudResourceMaxPrefetchRetry];
  uint64_t v16 = [v11 excludeDynamicResources];

  uint64_t v17 = +[PLInternalResource prefetchResourcePredicateForCPLResourceType:a3 isAssetResource:1 maxRetry:v15 excludeDynamicResources:v16 additionalResourcePredicates:v12];

  [v13 addObject:v17];
  uint64_t v18 = +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:@"asset"];
  [v13 addObject:v18];

  id v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"asset.cloudLocalState", 1);
  [v13 addObject:v19];

  if ([v9 count]) {
    [v13 addObjectsFromArray:v9];
  }
  uint64_t v20 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];

  return v20;
}

+ (id)_assetIsUnadjustedPredicate
{
  return +[PLManagedAsset predicateForUnadjustedAssetsWithKeyPathToAsset:@"asset"];
}

+ (id)_excludeMomentShareAssetsPredicate
{
  double v2 = (void *)MEMORY[0x1E4F8BA10];
  uint64_t v3 = [MEMORY[0x1E4F8BA10] maskForMomentSharedAsset];
  return (id)[v2 predicateForExcludeMask:v3 useIndex:1 keyPathPrefix:@"asset"];
}

+ (id)_irisConditionPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"asset.kindSubtype", 2);
}

+ (id)_predicateForImageResourcePixelsLessOrEqual:(int64_t)a3
{
  return +[PLInternalResource predicateForImageResourcePixelsLessOrEqual:a3];
}

+ (id)_predicateForResourceCreatedAfterDate:(id)a3
{
  return +[PLInternalResource predicateForResourceCreatedAfterDate:a3];
}

+ (id)_predicateForMaxFilesize:(unint64_t)a3
{
  return +[PLInternalResource predicateForMaxFilesize:a3];
}

+ (id)_missingThumbnailPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"asset.thumbnailIndex", 0xFFFFFFFFLL, @"asset.thumbnailIndex", 4294967293);
}

@end