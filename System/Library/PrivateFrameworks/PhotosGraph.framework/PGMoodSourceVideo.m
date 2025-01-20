@interface PGMoodSourceVideo
+ (id)_plistName;
- (double)weight;
- (id)_assetsByMomentIDs;
- (id)_plistMoodIdentifiersWithGraph:(id)a3;
@end

@implementation PGMoodSourceVideo

+ (id)_plistName
{
  return @"MoodSourceVideo";
}

- (id)_assetsByMomentIDs
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PGMoodSource *)self photoLibrary];
  v5 = [(PGMoodSource *)self assetCollection];
  v6 = [(PGMoodSource *)self options];
  v7 = [v6 prefetchedAssets];

  if (!v7)
  {
    v8 = [v4 librarySpecificFetchOptions];
    uint64_t v9 = *MEMORY[0x1E4F394E0];
    v59[0] = *MEMORY[0x1E4F39538];
    v59[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    [v8 setFetchPropertySets:v10];

    v11 = +[PGCurationManager defaultAssetSortDescriptors];
    [v8 setSortDescriptors:v11];

    v12 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v8];
    id v13 = objc_alloc(MEMORY[0x1E4F8E768]);
    v14 = [(PGMoodSource *)self photoLibrary];
    v15 = (void *)[v13 initWithPhotoLibrary:v14];

    v7 = [MEMORY[0x1E4F38EB8] clsAllAssetsFromFetchResult:v12 prefetchOptions:9 curationContext:v15];
    v16 = [(PGMoodSource *)self options];
    [v16 setPrefetchedAssets:v7];
  }
  if ([v7 count])
  {
    v17 = [v4 librarySpecificFetchOptions];
    v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v56 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    [v17 setSortDescriptors:v19];

    v50 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAssets:v7 withType:3 options:v17];
    v20 = [v50 fetchedObjects];
    v21 = [v20 objectEnumerator];

    v22 = [v21 nextObject];
    v23 = [v22 endDate];
    [v23 timeIntervalSinceReferenceDate];
    double v25 = v24;

    if (v22)
    {
      v46 = v17;
      v47 = v7;
      v48 = v5;
      v49 = v4;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v26 = v7;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v52 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v32 = [v31 creationDate];
            [v32 timeIntervalSinceReferenceDate];
            double v34 = v33;

            if (v34 > v25)
            {
              v35 = [v21 nextObject];

              v36 = [v35 endDate];
              [v36 timeIntervalSinceReferenceDate];
              double v25 = v37;

              if (!v35)
              {
                v43 = +[PGLogging sharedLogging];
                v44 = [v43 loggingConnection];

                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v58 = v31;
                  _os_log_error_impl(&dword_1D1805000, v44, OS_LOG_TYPE_ERROR, "Error: No Moments contain Asset \"%@\"", buf, 0xCu);
                }

                v22 = 0;
                goto LABEL_27;
              }
              v22 = v35;
            }
            v38 = [v22 uuid];
            v39 = [v3 objectForKeyedSubscript:v38];
            if (!v39)
            {
              v39 = [MEMORY[0x1E4F1CA48] array];
              [v3 setObject:v39 forKeyedSubscript:v38];
            }
            [v39 addObject:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v55 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      id v41 = v3;
      v5 = v48;
      v4 = v49;
      v17 = v46;
      v7 = v47;
    }
    else
    {
      v42 = +[PGLogging sharedLogging];
      v22 = [v42 loggingConnection];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v7;
        _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "Error: No moments contain assets: %@", buf, 0xCu);
      }
      id v41 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v40 = +[PGLogging sharedLogging];
    v17 = [v40 loggingConnection];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v5;
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Error: No assets in assetCollection: %@", buf, 0xCu);
    }
    id v41 = (id)MEMORY[0x1E4F1CC08];
  }

  return v41;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  [(PGMoodSourceVideo *)self _assetsByMomentIDs];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v23 = long long v33 = 0u;
  obuint64_t j = [v23 objectEnumerator];
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (!v4)
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (!v11)
      {

LABEL_22:
        v20 = 0;
        goto LABEL_23;
      }
      uint64_t v12 = v11;
      unint64_t v13 = 0;
      uint64_t v14 = *(void *)v27;
      double v15 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v10);
          }
          v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          if ([v17 isVideo])
          {
            ++v13;
            [v17 clsActivityScore];
            double v15 = v15 + v18;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v12);

      if (!v13) {
        goto LABEL_22;
      }
      double v19 = v15 / (double)v13;
      v20 = @"Extreme";
      if (v19 < 0.800000012)
      {
        v20 = @"Fast";
        if (v19 < 0.600000024)
        {
          v20 = @"Medium";
          if (v19 < 0.400000006) {
            v20 = @"Slowly";
          }
        }
      }
LABEL_23:
      if (v6)
      {
        if (v6 != v20) {
          goto LABEL_31;
        }
      }
      else
      {
        v6 = v20;
      }
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  }
  while (v5);

  if (v6)
  {
    double v34 = v6;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    goto LABEL_33;
  }
LABEL_32:
  v21 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_33:

  return v21;
}

- (double)weight
{
  return 0.5;
}

@end