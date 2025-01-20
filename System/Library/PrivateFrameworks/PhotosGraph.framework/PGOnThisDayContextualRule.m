@interface PGOnThisDayContextualRule
- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3;
- (id)_contextualKeyAssetForDayHighlightItem:(id)a3 contextualLocalDate:(id)a4 sharingFilter:(unsigned __int16)a5;
- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8;
@end

@implementation PGOnThisDayContextualRule

- (id)_contextualKeyAssetForDayHighlightItem:(id)a3 contextualLocalDate:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 keyAssetForHighlightFilter:v5];
  if (+[PGUserDefaults onThisDayHighlightKeyAssetRotationIsEnabled])
  {
    v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v11 = [v7 localStartDate];
    v12 = [v10 components:16 fromDate:v8 toDate:v11 options:0];

    uint64_t v13 = [v12 day];
    v14 = [v7 extendedCuratedAssets];
    v15 = +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v14, [v7 sharingComposition], v5);

    uint64_t v16 = [v15 count];
    if (v16 < 1)
    {
      id v19 = 0;
    }
    else
    {
      uint64_t v17 = v16;
      uint64_t v18 = [v15 indexOfObject:v9];
      id v19 = [v15 objectAtIndexedSubscript:(v17 & (((v18 + v13) % v17) >> 63)) + (v18 + v13) % v17];
    }
  }
  else
  {
    id v19 = v9;
  }

  return v19;
}

- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8
{
  uint64_t v12 = a4;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, NSObject *, void *, id, unsigned char *, double))a8;
  if (!v18) {
    goto LABEL_52;
  }
  v54 = self;
  v59 = v18;
  id v56 = v17;
  id v57 = v15;
  char v76 = 0;
  id v19 = +[PGContextualRuleUtils onThisDayLocalDateForYearHighlight:v14 withOptions:v15];
  id v58 = v14;
  v20 = [v14 childHighlightItemsForHighlightFilter:v12];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __139__PGOnThisDayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke;
  v74[3] = &unk_1E68E4EF0;
  id v21 = v19;
  id v75 = v21;
  v55 = v20;
  [v20 sortedArrayUsingComparator:v74];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id obj = v22;
  uint64_t v62 = [v22 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (!v62)
  {

    goto LABEL_47;
  }
  id v23 = 0;
  uint64_t v61 = *(void *)v71;
  while (2)
  {
    uint64_t v24 = 0;
    v25 = v23;
LABEL_5:
    if (*(void *)v71 != v61) {
      objc_enumerationMutation(obj);
    }
    id v23 = *(id *)(*((void *)&v70 + 1) + 8 * v24);

    v26 = [v16 fetchChildHighlightItemsForHighlightItem:v23 sharingFilter:v12];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v81 count:16];
    if (!v27)
    {

      goto LABEL_36;
    }
    uint64_t v28 = v27;
    uint64_t v63 = v24;
    id v64 = v23;
    unsigned int v29 = 0;
    v65 = 0;
    uint64_t v30 = *(void *)v67;
    double v31 = 2.22507386e-308;
    double v32 = 978307200.0;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v67 != v30) {
          objc_enumerationMutation(v26);
        }
        v34 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if (MEMORY[0x1D25FE3E0]([v16 visibilityStateForHighlightItem:v34 sharingFilter:v12]))
        {
          id v35 = v16;
          v36 = [v34 localStartDate];
          [v36 timeIntervalSinceDate:v21];
          double v38 = v37;

          if (v38 >= 0.0) {
            double v39 = v38;
          }
          else {
            double v39 = -v38;
          }
          v40 = [v34 localEndDate];
          [v40 timeIntervalSinceDate:v21];
          double v42 = v41;

          double v43 = -v42;
          if (v42 >= 0.0) {
            double v43 = v42;
          }
          if (v39 >= v43) {
            double v39 = v43;
          }
          unsigned int v44 = [v34 enrichmentState];
          [v34 promotionScore];
          double v46 = v45;
          if (v44 <= 3 && v44 >= v29)
          {
            if (v45 > v31) {
              goto LABEL_29;
            }
          }
          else if (v44 == 4 && (v29 < 4 || v39 < v32))
          {
LABEL_29:
            id v48 = v34;

            unsigned int v29 = v44;
            double v31 = v46;
            double v32 = v39;
            v65 = v48;
          }
          id v16 = v35;
          continue;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v66 objects:v81 count:16];
    }
    while (v28);

    id v23 = v64;
    v49 = v65;
    uint64_t v24 = v63;
    if (!v65)
    {
LABEL_36:
      ++v24;
      v25 = v23;
      if (v24 == v62)
      {
        uint64_t v62 = [obj countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (!v62)
        {

          if (v23)
          {
            v50 = +[PGLogging sharedLogging];
            v51 = [v50 loggingConnection];

            v52 = v55;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v78 = v58;
              __int16 v79 = 2112;
              id v80 = v23;
              _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "No day found for highlight year %@ and month %@", buf, 0x16u);
            }
            v49 = 0;
            goto LABEL_51;
          }
LABEL_47:
          v49 = 0;
          goto LABEL_48;
        }
        continue;
      }
      goto LABEL_5;
    }
    break;
  }

  if (v64)
  {
    v51 = [(PGOnThisDayContextualRule *)v54 _contextualKeyAssetForDayHighlightItem:v65 contextualLocalDate:v21 sharingFilter:v12];
    if (v51) {
      v59[2](v59, v51, v65, v64, &v76, 0.0);
    }
    v52 = v55;
    goto LABEL_51;
  }
LABEL_48:
  v52 = v55;
  v53 = +[PGLogging sharedLogging];
  v51 = [v53 loggingConnection];

  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v78 = v58;
    _os_log_error_impl(&dword_1D1805000, v51, OS_LOG_TYPE_ERROR, "No month found for highlight year %@", buf, 0xCu);
  }
  id v23 = 0;
LABEL_51:

  id v15 = v57;
  id v14 = v58;
  id v17 = v56;
  uint64_t v18 = v59;
LABEL_52:
}

uint64_t __139__PGOnThisDayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v5 startDate];
  v9 = [v5 endDate];
  [v9 timeIntervalSinceDate:v8];
  v11 = [v8 dateByAddingTimeInterval:v10 * 0.5];
  [v11 timeIntervalSinceDate:v7];
  double v13 = v12;

  if (v13 >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = -v13;
  }

  id v15 = *(id *)(a1 + 32);
  id v16 = v6;
  id v17 = [v16 startDate];
  uint64_t v18 = [v16 endDate];

  [v18 timeIntervalSinceDate:v17];
  v20 = [v17 dateByAddingTimeInterval:v19 * 0.5];
  [v20 timeIntervalSinceDate:v15];
  double v22 = v21;

  if (v22 < 0.0) {
    double v22 = -v22;
  }

  if (v14 >= v22)
  {
    if (v14 <= v22)
    {
      uint64_t v24 = [v5 uuid];
      v25 = [v16 uuid];
      uint64_t v23 = [v24 compare:v25];
    }
    else
    {
      uint64_t v23 = 1;
    }
  }
  else
  {
    uint64_t v23 = -1;
  }

  return v23;
}

- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3
{
  return 1;
}

@end