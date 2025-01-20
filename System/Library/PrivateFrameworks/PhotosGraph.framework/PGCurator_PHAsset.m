@interface PGCurator_PHAsset
- (id)bestAssetsForFeeder:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)newMovieDeduperWithOptions:(id)a3;
- (id)newSemanticalDeduperWithOptions:(id)a3;
- (void)addMoviesToAssets:(id)a3 fromFeeder:(id)a4 maximumNumberOfAssets:(unint64_t)a5 debugInfo:(id)a6;
- (void)lastPassToCompleteItems:(id)a3 fromFeeder:(id)a4 options:(id)a5 maximumNumberOfItems:(unint64_t)a6 debugInfo:(id)a7;
@end

@implementation PGCurator_PHAsset

- (void)addMoviesToAssets:(id)a3 fromFeeder:(id)a4 maximumNumberOfAssets:(unint64_t)a5 debugInfo:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = v11;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v57 != v17) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v56 + 1) + 8 * i) mediaType] == 2) {
          ++v16;
        }
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v56 objects:v67 count:16];
    }
    while (v14);
    double v19 = (double)v16;
    id v11 = v15;
  }
  else
  {
    double v19 = 0.0;
  }
  uint64_t v20 = [v10 count];
  unint64_t v21 = (a5 - v20) & ~((uint64_t)(a5 - v20) >> 63);
  double v22 = -(v19 - (double)a5 * 0.1);
  unint64_t v23 = (uint64_t)v22 & ~((uint64_t)v22 >> 63);
  if (v23 <= v21) {
    unint64_t v24 = v21;
  }
  else {
    unint64_t v24 = (uint64_t)v22 & ~((uint64_t)v22 >> 63);
  }
  if (v24)
  {
    v51 = self;
    v25 = [MEMORY[0x1E4F744F0] sharedMediaAnalyzer];
    v26 = [v11 assetCollection];
    v27 = [v25 curateMovieAssetsForCollection:v26 withAlreadyCuratedAssets:v10 andDesiredCount:v24 allowOnDemand:0];

    double v28 = *MEMORY[0x1E4F8E750];
    v29 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore > %f", *MEMORY[0x1E4F8E750]);
    id v30 = [v27 filteredArrayUsingPredicate:v29];

    if (v30 && [v30 count])
    {
      [v12 setAgent:@"PGManager"];
      [v12 setStage:@"Last Pass to Add Movies"];
      v49 = v25;
      if ([v30 count] > v24)
      {
        uint64_t v31 = objc_msgSend(v30, "subarrayWithRange:", 0, v24);

        id v30 = (id)v31;
      }
      v32 = (void *)MEMORY[0x1E4F1CAD0];
      id v50 = v11;
      v33 = [v11 allItems];
      v34 = [v32 setWithArray:v33];

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v30 = v30;
      uint64_t v35 = [v30 countByEnumeratingWithState:&v52 objects:v66 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v53 != v37) {
              objc_enumerationMutation(v30);
            }
            v39 = [v34 member:*(void *)(*((void *)&v52 + 1) + 8 * j)];
            v40 = v39;
            if (v39)
            {
              [v39 clsContentScore];
              if (v41 > v28) {
                [v10 addObject:v40];
              }
            }
          }
          uint64_t v36 = [v30 countByEnumeratingWithState:&v52 objects:v66 count:16];
        }
        while (v36);
      }

      v42 = [(PGCurator *)v51 loggingConnection];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = [v30 count];
        *(_DWORD *)buf = 134218496;
        unint64_t v61 = v21;
        __int16 v62 = 2048;
        unint64_t v63 = v23;
        __int16 v64 = 2048;
        uint64_t v65 = v43;
        _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_DEFAULT, "Curated Assets: %lu slots left, minimum number of videos to add %lu, got %lu extra movie assets from MediaAnalysis", buf, 0x20u);
      }

      if (v12)
      {
        v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
        v45 = [v44 stringValue];
        v46 = [@"Adding " stringByAppendingString:v45];
        v47 = [v46 stringByAppendingString:@" movies curated by MediaAnalyzer"];

        v48 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
        [v12 setState:3 ofItems:v48 withReason:v47];
      }
      v25 = v49;
      id v11 = v50;
    }
  }
}

- (void)lastPassToCompleteItems:(id)a3 fromFeeder:(id)a4 options:(id)a5 maximumNumberOfItems:(unint64_t)a6 debugInfo:(id)a7
{
  id v14 = a3;
  id v12 = a4;
  id v13 = a7;
  if ([a5 lastPassMovieAdditionIsEnabled]) {
    [(PGCurator_PHAsset *)self addMoviesToAssets:v14 fromFeeder:v12 maximumNumberOfAssets:a6 debugInfo:v13];
  }
}

- (id)newMovieDeduperWithOptions:(id)a3
{
  return objc_alloc_init(PGMovieDeduper);
}

- (id)newSemanticalDeduperWithOptions:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PGSemanticalDeduper_PHAsset);
  uint64_t v5 = [v3 semanticalDedupingUsesAdaptiveSimilarStacking];

  [(PGSemanticalDeduper *)v4 setUsesAdaptiveSimilarStacking:v5];
  return v4;
}

- (id)bestAssetsForFeeder:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PGCurator_PHAsset;
  v6 = [(PGCurator *)&v8 bestItemsForFeeder:a3 options:a4 debugInfo:a5 progressBlock:a6];
  return v6;
}

@end