@interface PLEmbeddingUtilities
+ (double)cosineSimilarityBetweenVector:(id)a3 secondVector:(id)a4;
+ (id)assetUUIDsFromEmbeddingCompareObjects:(id)a3;
+ (id)averageTop:(unint64_t)a3 forEmbeddingCompareObjectsByAssetUUID:(id)a4 sortAscending:(BOOL)a5;
+ (id)distanceByAssetUUIDFromEmbeddingCompareObjects:(id)a3;
+ (id)extractNumericalValuesForScenePrint:(id)a3;
+ (id)fetchAssetsForCLIPGenerationFromPhotoLibrary:(id)a3 limitToExtendedAssets:(BOOL)a4 assetFetchLimit:(unint64_t)a5 error:(id *)a6;
+ (id)generateMappingOfEmbeddingCompareObjectsToAssetUUIDFromEmbeddingCompareObjects:(id)a3;
+ (id)generateMaxVectorFromVectors:(id)a3;
+ (id)generateNormalizedEmbeddingCompareObjects:(id)a3 fromMaxVector:(id)a4;
+ (id)generateNormalizedVector:(id)a3 fromMaxVector:(id)a4;
+ (id)generateNormalizedVectors:(id)a3 fromMaxVector:(id)a4;
+ (id)padVector:(id)a3 withZeroesForVectorWithNumberOfDimensions:(unint64_t)a4;
+ (id)poolVectors:(id)a3;
+ (id)sortCompareObjects:(id)a3 sortAscending:(BOOL)a4;
@end

@implementation PLEmbeddingUtilities

+ (id)fetchAssetsForCLIPGenerationFromPhotoLibrary:(id)a3 limitToExtendedAssets:(BOOL)a4 assetFetchLimit:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__941;
  v30 = __Block_byref_object_dispose__942;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__941;
  v24 = __Block_byref_object_dispose__942;
  id v25 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __113__PLEmbeddingUtilities_fetchAssetsForCLIPGenerationFromPhotoLibrary_limitToExtendedAssets_assetFetchLimit_error___block_invoke;
  v14[3] = &unk_1E5864AE0;
  BOOL v19 = a4;
  unint64_t v18 = a5;
  id v10 = v9;
  id v15 = v10;
  v16 = &v26;
  v17 = &v20;
  [v10 performBlockAndWait:v14];
  v11 = (void *)v21[5];
  if (v11)
  {
    id v12 = 0;
    if (a6) {
      *a6 = v11;
    }
  }
  else
  {
    id v12 = (id)v27[5];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __113__PLEmbeddingUtilities_fetchAssetsForCLIPGenerationFromPhotoLibrary_limitToExtendedAssets_assetFetchLimit_error___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", @"visibilityState", 0);
  v4 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForSearchIndexExclusions"), 0);
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == NO", @"hidden");
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", @"trashedState", 0);
  v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  if (*(unsigned char *)(a1 + 64))
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %f", @"highlightBeingExtendedAssets.promotionScore", 0x3FC999999999999ALL);
    [v7 addObject:v8];
  }
  id v9 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  id v10 = (void *)MEMORY[0x1E4F1C0D0];
  v11 = +[PLManagedAsset entityName];
  id v12 = [v10 fetchRequestWithEntityName:v11];

  [v12 setPredicate:v9];
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
  v21[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v12 setSortDescriptors:v14];

  [v12 setFetchBatchSize:100];
  [v12 setResultType:0];
  [v12 setFetchLimit:*(void *)(a1 + 56)];
  [v12 setIncludesPendingChanges:0];
  id v15 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v16 + 40);
  uint64_t v17 = [v15 executeFetchRequest:v12 error:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

+ (id)distanceByAssetUUIDFromEmbeddingCompareObjects:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PLEmbeddingUtilities_distanceByAssetUUIDFromEmbeddingCompareObjects___block_invoke;
  v8[3] = &unk_1E5862210;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __71__PLEmbeddingUtilities_distanceByAssetUUIDFromEmbeddingCompareObjects___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSNumber;
  id v4 = a2;
  id v5 = [v3 alloc];
  [v4 distanceBetweenVectors];
  id v8 = (id)objc_msgSend(v5, "initWithDouble:");
  id v6 = *(void **)(a1 + 32);
  v7 = [v4 assetUUID];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

+ (id)assetUUIDsFromEmbeddingCompareObjects:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PLEmbeddingUtilities_assetUUIDsFromEmbeddingCompareObjects___block_invoke;
  v9[3] = &unk_1E5862210;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = (void *)[v6 copy];
  return v7;
}

void __62__PLEmbeddingUtilities_assetUUIDsFromEmbeddingCompareObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 assetUUID];
  [v2 addObject:v3];
}

+ (id)averageTop:(unint64_t)a3 forEmbeddingCompareObjectsByAssetUUID:(id)a4 sortAscending:(BOOL)a5
{
  id v9 = a4;
  if (!a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 266, @"Invalid parameter not satisfying: %@", @"numberOfEmbeddingObjectsPerAsset > 0" object file lineNumber description];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__PLEmbeddingUtilities_averageTop_forEmbeddingCompareObjectsByAssetUUID_sortAscending___block_invoke;
  v15[3] = &unk_1E58621E8;
  BOOL v18 = a5;
  id v16 = v10;
  unint64_t v17 = a3;
  id v11 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  id v12 = (void *)[v11 copy];

  return v12;
}

void __87__PLEmbeddingUtilities_averageTop_forEmbeddingCompareObjectsByAssetUUID_sortAscending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v7 = *(void *)(a1 + 40);
    unint64_t v8 = [v6 count];
    if (v7 >= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v7;
    }
    id v10 = +[PLEmbeddingUtilities sortCompareObjects:v6 sortAscending:*(unsigned __int8 *)(a1 + 48)];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&v23.start.value = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&v23.start.epoch = v11;
    *(_OWORD *)&v23.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
    if (v9)
    {
      uint64_t v12 = 0;
      double v13 = 0.0;
      do
      {
        v14 = [v10 objectAtIndexedSubscript:v12];
        [v14 distanceBetweenVectors];
        double v16 = v15;
        if (v14) {
          [v14 llmTimeRange];
        }
        else {
          memset(&otherRange, 0, sizeof(otherRange));
        }
        double v13 = v13 + v16;
        CMTimeRange v21 = v23;
        CMTimeRangeGetUnion(&v23, &v21, &otherRange);

        ++v12;
      }
      while (v9 != v12);
    }
    else
    {
      double v13 = 0.0;
    }
    double v18 = v13 / (double)*(unint64_t *)(a1 + 40);
    BOOL v19 = [PLAveragedEmbeddingCompareObject alloc];
    CMTimeRange v21 = v23;
    uint64_t v20 = [(PLAveragedEmbeddingCompareObject *)v19 initWithAssetUUID:v5 timeRange:&v21 averageDistanceBetweenVectors:v18];
    [*(id *)(a1 + 32) addObject:v20];

    goto LABEL_16;
  }
  if ([v6 count])
  {
    unint64_t v17 = *(void **)(a1 + 32);
    id v10 = [v6 firstObject];
    [v17 addObject:v10];
LABEL_16:
  }
}

+ (id)generateMappingOfEmbeddingCompareObjectsToAssetUUIDFromEmbeddingCompareObjects:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "assetUUID", (void)v18);
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        double v13 = v12;
        if (v12) {
          id v14 = v12;
        }
        else {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        double v15 = v14;

        [v15 addObject:v10];
        [v4 setObject:v15 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  double v16 = (void *)[v4 copy];
  return v16;
}

+ (id)generateNormalizedVector:(id)a3 fromMaxVector:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 229, @"Invalid parameter not satisfying: %@", @"vector.count == maxVector.count" object file lineNumber description];
  }
  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    if ([v7 count])
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = [v7 objectAtIndexedSubscript:v11];
        [v12 doubleValue];
        double v14 = v13;

        double v15 = [v8 objectAtIndexedSubscript:v11];
        [v15 doubleValue];
        double v17 = v16;

        long long v18 = [NSNumber numberWithDouble:v14 / v17];
        [v10 addObject:v18];

        ++v11;
      }
      while (v11 < [v7 count]);
    }
    long long v19 = (void *)[v10 copy];
  }
  else
  {
    long long v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

+ (id)generateNormalizedEmbeddingCompareObjects:(id)a3 fromMaxVector:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v5;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v13 = objc_msgSend(v12, "vector", v20);
          double v14 = +[PLEmbeddingUtilities generateNormalizedVector:v13 fromMaxVector:v6];

          double v15 = [PLEmbeddingCompareObject alloc];
          double v16 = [v12 assetUUID];
          double v17 = [(PLEmbeddingCompareObject *)v15 initWithAssetUUID:v16 vector:v14];

          [v7 addObject:v17];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    long long v18 = (void *)[v7 copy];
    id v5 = v20;
  }
  else
  {
    long long v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

+ (id)generateNormalizedVectors:(id)a3 fromMaxVector:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = +[PLEmbeddingUtilities generateNormalizedVector:fromMaxVector:](PLEmbeddingUtilities, "generateNormalizedVector:fromMaxVector:", *(void *)(*((void *)&v16 + 1) + 8 * i), v6, (void)v16);
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    double v14 = (void *)[v7 copy];
  }
  else
  {
    double v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

+ (id)generateMaxVectorFromVectors:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [v3 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0x1E4F28000uLL;
      id v25 = v4;
      do
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v9 = v3;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v29;
          double v13 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v9);
              }
              double v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              if ([v15 count] != v6)
              {
                [MEMORY[0x1E4F28B00] currentHandler];
                id v19 = v3;
                v21 = unint64_t v20 = v8;
                [v21 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 185, @"Invalid parameter not satisfying: %@", @"vector.count == vectorDimension" object file lineNumber description];

                unint64_t v8 = v20;
                id v3 = v19;
                id v4 = v25;
              }
              long long v16 = [v15 objectAtIndexedSubscript:v7];
              [v16 doubleValue];
              double v18 = v17;

              if (v13 < v18) {
                double v13 = v18;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v11);
        }
        else
        {
          double v13 = 0.0;
        }

        long long v22 = [*(id *)(v8 + 3792) numberWithDouble:v13];
        [v4 addObject:v22];

        ++v7;
      }
      while (v7 != v6);
    }
    long long v23 = (void *)[v4 copy];
  }
  else
  {
    long long v23 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

+ (id)padVector:(id)a3 withZeroesForVectorWithNumberOfDimensions:(unint64_t)a4
{
  id v7 = a3;
  if ([v7 count] <= a4)
  {
    if ([v7 count] == a4)
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
      uint64_t v11 = [v7 count];
      unint64_t v12 = a4 - v11;
      if (a4 != v11)
      {
        do
        {
          double v13 = [NSNumber numberWithDouble:0.0];
          [v10 addObject:v13];

          --v12;
        }
        while (v12);
      }
      id v9 = (id)[v10 copy];
    }
  }
  else
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 153, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];

    id v9 = 0;
  }

  return v9;
}

+ (id)extractNumericalValuesForScenePrint:(id)a3
{
  id v3 = a3;
  id v4 = [v3 descriptorData];
  if (v4)
  {
    uint64_t v5 = [v3 elementCount];
    uint64_t v6 = [v4 bytes];
    id v7 = (id)MEMORY[0x1E4F1CBF0];
    if (v5)
    {
      unint64_t v8 = (float *)v6;
      if (v6)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        do
        {
          float v9 = *v8++;
          uint64_t v10 = [NSNumber numberWithDouble:v9];
          [v7 addObject:v10];

          --v5;
        }
        while (v5);
      }
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

+ (id)sortCompareObjects:(id)a3 sortAscending:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F29008];
  id v6 = a3;
  id v7 = [v5 sortDescriptorWithKey:@"distanceBetweenVectors" ascending:v4];
  v11[0] = v7;
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  float v9 = [v6 sortedArrayUsingDescriptors:v8];

  return v9;
}

+ (double)cosineSimilarityBetweenVector:(id)a3 secondVector:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  uint64_t v10 = [v8 count];
  if ([v7 count]) {
    BOOL v11 = [v8 count] == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v9 == v10)
  {
    if (!v11) {
      goto LABEL_6;
    }
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 84, @"Invalid parameter not satisfying: %@", @"vectorsAreEqualLength" object file lineNumber description];

    if (!v11) {
      goto LABEL_6;
    }
  }
  uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 85, @"Invalid parameter not satisfying: %@", @"bothVectorsHaveNonZeroCounts" object file lineNumber description];

LABEL_6:
  uint64_t v12 = [v7 count];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    do
    {
      double v18 = [v7 objectAtIndexedSubscript:v14];
      [v18 doubleValue];
      double v20 = v19;

      uint64_t v21 = [v8 objectAtIndexedSubscript:v14];
      [v21 doubleValue];
      double v23 = v22;

      double v17 = v17 + v20 * v23;
      double v16 = v16 + v20 * v20;
      double v15 = v15 + v23 * v23;
      ++v14;
    }
    while (v13 != v14);
    if (v16 > 0.0 && v15 > 0.0) {
      double v17 = v17 / sqrt(v16 * v15);
    }
  }
  else
  {
    double v17 = 0.0;
  }

  return v17;
}

+ (id)poolVectors:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (![v11 count])
        {

          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 50, @"Invalid parameter not satisfying: %@", @"allVectorsHaveNonZeroLength" object file lineNumber description];
          goto LABEL_16;
        }
        uint64_t v12 = [v11 count];
        if (v8)
        {
          if (v12 != v8)
          {

            uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
            [v26 handleFailureInMethod:a2, a1, @"PLEmbeddingUtilities.m", 49, @"Invalid parameter not satisfying: %@", @"allVectorsAreEqualLength" object file lineNumber description];

            id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v13 = v5;
LABEL_16:

  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8)
  {
LABEL_17:
    for (uint64_t j = 0; j != v8; ++j)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v5;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        double v19 = 0.0;
        do
        {
          for (uint64_t k = 0; k != v17; ++k)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = [*(id *)(*((void *)&v28 + 1) + 8 * k) objectAtIndexedSubscript:j];
            [v21 doubleValue];
            double v19 = v19 + v22;
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v17);
      }
      else
      {
        double v19 = 0.0;
      }

      unint64_t v23 = [v15 count];
      long long v24 = [NSNumber numberWithDouble:v19 / (double)v23];
      [v27 addObject:v24];
    }
  }

  return v27;
}

@end