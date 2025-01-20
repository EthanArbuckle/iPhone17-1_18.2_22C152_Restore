@interface PGZeroKeywordComputer
+ (id)contextualHolidayZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5;
+ (id)zeroKeywordLog;
- (BOOL)shouldFilterMomentNodesWithPresence;
- (PGGraphMomentNodeCollection)momentNodesWhereMeIsPresent;
- (PGSearchComputationCache)searchComputationCache;
- (PGZeroKeywordComputer)initWithPhotoLibrary:(id)a3 curationManager:(id)a4 searchComputationCache:(id)a5;
- (id)_tripZeroKeywordWithGraph:(id)a3 curationContext:(id)a4 score:(double *)a5;
- (id)_zeroKeywordDisplayMeaningNodeForMeaningNode:(id)a3;
- (id)_zeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6;
- (id)contextualDateZeroKeywordsWithGraph:(id)a3 options:(id)a4;
- (id)contextualMeaningAndTripZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6;
- (id)contextualPersonZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)contextualSceneZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)contextualSeasonZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5;
- (id)contextualSocialGroupZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)eventZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6;
- (id)meaningNodeZeroKeywordForDisplayMeaningNode:(id)a3 collectionUUIDsToAvoid:(id)a4 curationContext:(id)a5;
- (id)momentNodesOverlappingLocalDateInterval:(id)a3 inGraph:(id)a4;
- (id)peopleZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6;
- (id)placeZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)sceneZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)socialGroupKeyAssetLocalIdentifierWithPersonLocalIdentifiers:(id)a3;
- (id)socialGroupKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6;
- (id)tripRankedKeywordWithGraph:(id)a3 curationContext:(id)a4;
- (id)tripZeroKeywordWithGraph:(id)a3 curationContext:(id)a4;
- (id)zeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6;
@end

@implementation PGZeroKeywordComputer

- (id)momentNodesOverlappingLocalDateInterval:(id)a3 inGraph:(id)a4
{
  v5 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:a3 inGraph:a4];
  if ([(PGZeroKeywordComputer *)self shouldFilterMomentNodesWithPresence])
  {
    v6 = [(PGZeroKeywordComputer *)self momentNodesWhereMeIsPresent];
    uint64_t v7 = [v5 collectionByIntersecting:v6];

    v5 = (void *)v7;
  }
  return v5;
}

- (id)_zeroKeywordDisplayMeaningNodeForMeaningNode:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__33564;
  v16 = __Block_byref_object_dispose__33565;
  id v17 = 0;
  v4 = [v3 graph];
  v5 = [v4 zeroKeywordMappingByMeaningLabel];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PGZeroKeywordComputer_Contextual___zeroKeywordDisplayMeaningNodeForMeaningNode___block_invoke;
  v9[3] = &unk_1E68E91E8;
  id v6 = v3;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __82__PGZeroKeywordComputer_Contextual___zeroKeywordDisplayMeaningNodeForMeaningNode___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v6 = [v10 mappedMeaningNodes];
  if ([v6 containsObject:*(void *)(a1 + 32)])
  {
    uint64_t v7 = [v10 displayNode];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (id)contextualDateZeroKeywordsWithGraph:(id)a3 options:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 array];
  id v10 = [v7 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F76C68] currentLocalDate];
  }
  uint64_t v12 = v11;

  v13 = [MEMORY[0x1E4F76C68] dateByAddingYears:-1 toDate:v12];
  uint64_t v14 = *MEMORY[0x1E4F8B808];
  v15 = [MEMORY[0x1E4F76C68] dateByAddingDays:-*MEMORY[0x1E4F8B808] toDate:v13];
  v16 = [MEMORY[0x1E4F76C68] dateByAddingDays:v14 toDate:v13];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v16];
  v18 = [(PGZeroKeywordComputer *)self momentNodesOverlappingLocalDateInterval:v17 inGraph:v8];

  if ([v18 count])
  {
    v28 = v9;
    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"PGZeroKeywordOneYearAgoSearchableText" value:@"PGZeroKeywordOneYearAgoSearchableText" table:@"Localizable"];

    v21 = (void *)MEMORY[0x1E4F8A9D0];
    v22 = [MEMORY[0x1E4F8AB98] locale];
    LODWORD(v21) = [v21 nlpSearchSupportsLocale:v22];

    if (v21)
    {
      v23 = [v18 set];
      v24 = bestEventNodeForEventNodes(v23);

      if (v24)
      {
        v25 = [v24 localIdentifier];
        v26 = zeroKeywordWithAttributes(7, 8, v20, v20, 0, v25);

        [v28 addObject:v26];
      }
    }
    v9 = v28;
  }

  return v9;
}

- (id)contextualMeaningAndTripZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v45 = a4;
  id v9 = a5;
  id v35 = a6;
  double v10 = 0.0;
  v47 = (void (**)(void *, void *, double))_Block_copy(v35);
  v36 = v9;
  if (v47)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v51) = 0;
      v47[2](v47, &v51, 0.0);
      if ((_BYTE)v51)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t buf = 0x1CF04000202;
          LOWORD(v65) = 2080;
          *(void *)((char *)&v65 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        id v12 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_54;
      }
      double v10 = Current;
    }
  }
  v13 = [v9 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];
  uint64_t v14 = v13;
  if (v13)
  {
    id v41 = v13;
  }
  else
  {
    id v41 = [MEMORY[0x1E4F76C68] currentLocalDate];
  }

  v43 = [MEMORY[0x1E4F1CA48] array];
  v46 = [MEMORY[0x1E4F1CA80] set];
  v40 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:-2 toDate:v41];
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v40 endDate:v41];
  v38 = [(PGZeroKeywordComputer *)self momentNodesOverlappingLocalDateInterval:v39 inGraph:v42];
  v15 = [v38 set];
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  uint64_t buf = (uint64_t)v16;
  id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
  *(void *)&long long v65 = v17;
  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  *((void *)&v65 + 1) = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];

  v37 = [v15 sortedArrayUsingDescriptors:v19];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v20 = [v37 reverseObjectEnumerator];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (!v21)
  {
    char v44 = 0;
    goto LABEL_46;
  }
  char v23 = 0;
  char v44 = 0;
  uint64_t v24 = *(void *)v58;
  *(void *)&long long v22 = 67109378;
  long long v34 = v22;
  while (2)
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v58 != v24) {
        objc_enumerationMutation(v20);
      }
      v26 = *(void **)(*((void *)&v57 + 1) + 8 * v25);
      if (!objc_msgSend(v26, "isInteresting", v34)) {
        goto LABEL_34;
      }
      if ((v23 & 1) == 0)
      {
        if (![v26 isPartOfTrip])
        {
          char v23 = 0;
          goto LABEL_24;
        }
        v27 = [(PGZeroKeywordComputer *)self tripZeroKeywordWithGraph:v42 curationContext:v45];
        if (v27) {
          [v43 addObject:v27];
        }
      }
      char v23 = 1;
LABEL_24:
      uint64_t buf = 0;
      *(void *)&long long v65 = &buf;
      *((void *)&v65 + 1) = 0x3032000000;
      v66 = __Block_byref_object_copy__33564;
      v67 = __Block_byref_object_dispose__33565;
      id v68 = 0;
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__33564;
      v55 = __Block_byref_object_dispose__33565;
      id v56 = 0;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __121__PGZeroKeywordComputer_Contextual__contextualMeaningAndTripZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
      v50[3] = &unk_1E68E91C0;
      v50[4] = self;
      v50[5] = &buf;
      v50[6] = &v51;
      [v26 enumerateMeaningEdgesAndNodesUsingBlock:v50];
      if (*(void *)(v65 + 40)
        && ([v46 containsObject:v52[5]] & 1) == 0
        && ([(PGZeroKeywordComputer *)self meaningNodeZeroKeywordForDisplayMeaningNode:v52[5] collectionUUIDsToAvoid:0 curationContext:v45], (v28 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [v43 addObject:v28];

        int v29 = 0;
        int v30 = 1;
      }
      else
      {
        if (v47)
        {
          double v31 = CFAbsoluteTimeGetCurrent();
          if (v31 - v10 >= 0.01)
          {
            unsigned __int8 v49 = 0;
            ((void (**)(void *, unsigned __int8 *, double))v47)[2](v47, &v49, 0.5);
            if (v49 | v44 & 1)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                v61[0] = v34;
                v61[1] = 528;
                __int16 v62 = 2080;
                v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v61, 0x12u);
              }
              int v29 = 0;
              int v30 = 0;
              char v44 = 1;
            }
            else
            {
              int v30 = 0;
              char v44 = 0;
              int v29 = 1;
            }
            goto LABEL_32;
          }
        }
        int v30 = 0;
        int v29 = 1;
      }
      double v31 = v10;
LABEL_32:
      _Block_object_dispose(&v51, 8);

      _Block_object_dispose(&buf, 8);
      if (!v29)
      {

        if (v30) {
          goto LABEL_47;
        }
        goto LABEL_44;
      }
      double v10 = v31;
LABEL_34:
      ++v25;
    }
    while (v21 != v25);
    uint64_t v32 = [v20 countByEnumeratingWithState:&v57 objects:v69 count:16];
    uint64_t v21 = v32;
    if (v32) {
      continue;
    }
    break;
  }
LABEL_46:

  double v31 = v10;
LABEL_47:
  if (v47
    && CFAbsoluteTimeGetCurrent() - v31 >= 0.01
    && (LOBYTE(v51) = 0, v47[2](v47, &v51, 1.0), v51 | v44 & 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x21304000202;
      LOWORD(v65) = 2080;
      *(void *)((char *)&v65 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
LABEL_44:
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v12 = v43;
  }

LABEL_54:
  return v12;
}

void __121__PGZeroKeywordComputer_Contextual__contextualMeaningAndTripZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) _zeroKeywordDisplayMeaningNodeForMeaningNode:v6];
  if (v7)
  {
    if ([v11 isReliable])
    {
      if ((unint64_t)[v6 countOfEdgesWithLabel:@"MEANING" domain:700] >= 3)
      {
        [v11 confidence];
        double v9 = v8;
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) confidence];
        if (v9 > v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
        }
      }
    }
  }
}

- (id)contextualSceneZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v42 = a4;
  id v36 = a5;
  double v8 = 0.0;
  v46 = (void (**)(void *, void *, double))_Block_copy(v36);
  if (v46)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v53[0]) = 0;
      v46[2](v46, v53, 0.0);
      if (LOBYTE(v53[0]))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t buf = 0x19304000202;
          LOWORD(v62) = 2080;
          *(void *)((char *)&v62 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        id v10 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_46;
      }
      double v8 = Current;
    }
  }
  v47 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [v42 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];
  id v12 = v11;
  if (v11)
  {
    id v43 = v11;
  }
  else
  {
    id v43 = [MEMORY[0x1E4F76C68] currentLocalDate];
  }

  v40 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:-2 toDate:v43];
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v40 endDate:v43];
  id v45 = [MEMORY[0x1E4F1CA80] set];
  v38 = [(PGZeroKeywordComputer *)self momentNodesOverlappingLocalDateInterval:v39 inGraph:v41];
  v13 = [v38 set];
  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  uint64_t buf = (uint64_t)v14;
  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
  *(void *)&long long v62 = v15;
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  *((void *)&v62 + 1) = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];

  v37 = [v13 sortedArrayUsingDescriptors:v17];

  long long v57 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  v18 = [v37 reverseObjectEnumerator];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (!v19)
  {
    char v44 = 0;
    goto LABEL_38;
  }
  char v44 = 0;
  uint64_t v21 = *(void *)v55;
  *(void *)&long long v20 = 67109378;
  long long v35 = v20;
  while (2)
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v55 != v21) {
        objc_enumerationMutation(v18);
      }
      char v23 = *(void **)(*((void *)&v54 + 1) + 8 * v22);
      if (!objc_msgSend(v23, "isInteresting", v35, v36)) {
        goto LABEL_26;
      }
      uint64_t buf = 0;
      *(void *)&long long v62 = &buf;
      *((void *)&v62 + 1) = 0x3032000000;
      v63 = __Block_byref_object_copy__33564;
      v64 = __Block_byref_object_dispose__33565;
      id v65 = 0;
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x2020000000;
      v53[3] = 0;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __96__PGZeroKeywordComputer_Contextual__contextualSceneZeroKeywordsWithGraph_options_progressBlock___block_invoke;
      v49[3] = &unk_1E68E9198;
      id v24 = v45;
      id v50 = v24;
      uint64_t v51 = v53;
      p_uint64_t buf = &buf;
      [v23 enumerateSceneEdgesAndNodesUsingBlock:v49];
      uint64_t v25 = *(void **)(v62 + 40);
      if (!v25) {
        goto LABEL_51;
      }
      v26 = [v25 targetNode];
      v27 = [v26 localizedName];
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v26, "sceneIdentifier"));
      int v29 = zeroKeywordWithAttributes(3, 13, v27, 0, 0, (void *)v28);

      [v47 addObject:v29];
      [v24 addObject:v26];
      LOBYTE(v28) = (unint64_t)[v47 count] < 2;

      if ((v28 & 1) == 0)
      {
        int v32 = 0;
        int v31 = 1;
      }
      else
      {
LABEL_51:
        if (v46)
        {
          double v30 = CFAbsoluteTimeGetCurrent();
          if (v30 - v8 >= 0.01)
          {
            unsigned __int8 v48 = 0;
            ((void (**)(void *, unsigned __int8 *, double))v46)[2](v46, &v48, 0.5);
            if (v48 | v44 & 1)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                v58[0] = v35;
                v58[1] = 452;
                __int16 v59 = 2080;
                long long v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v58, 0x12u);
              }
              int v32 = 0;
              int v31 = 0;
              char v44 = 1;
            }
            else
            {
              int v31 = 0;
              char v44 = 0;
              int v32 = 1;
            }
            goto LABEL_24;
          }
        }
        int v31 = 0;
        int v32 = 1;
      }
      double v30 = v8;
LABEL_24:

      _Block_object_dispose(v53, 8);
      _Block_object_dispose(&buf, 8);

      if (!v32)
      {

        if (v31) {
          goto LABEL_39;
        }
        goto LABEL_36;
      }
      double v8 = v30;
LABEL_26:
      ++v22;
    }
    while (v19 != v22);
    uint64_t v33 = [v18 countByEnumeratingWithState:&v54 objects:v66 count:16];
    uint64_t v19 = v33;
    if (v33) {
      continue;
    }
    break;
  }
LABEL_38:

  double v30 = v8;
LABEL_39:
  if (v46
    && CFAbsoluteTimeGetCurrent() - v30 >= 0.01
    && (LOBYTE(v53[0]) = 0, v46[2](v46, v53, 1.0), LOBYTE(v53[0]) | v44 & 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x1C704000202;
      LOWORD(v62) = 2080;
      *(void *)((char *)&v62 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
LABEL_36:
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v10 = v47;
  }

LABEL_46:
  return v10;
}

void __96__PGZeroKeywordComputer_Contextual__contextualSceneZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0)
  {
    if ([v9 isReliable])
    {
      if ([v9 numberOfSearchConfidenceAssets])
      {
        if ([v6 isSuitableForSuggestions])
        {
          if ([v6 isIndexed])
          {
            double v7 = (double)(unint64_t)[v9 numberOfSearchConfidenceAssets];
            double v8 = ((double)(unint64_t)([v6 level] - 1) * 0.1 + 1.0) * v7;
            if (v8 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
              *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
            }
          }
        }
      }
    }
  }
}

- (id)contextualSeasonZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v12 = [v10 array];
  v13 = [v11 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];

  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F76C68] currentLocalDate];
  }
  v15 = v14;

  v16 = [v8 seasonNodeForLocalDate:v15];
  if ([MEMORY[0x1E4F76C68] isFirstTenDaysOfSeasonForLocalDate:v15])
  {
    id v17 = [v8 previousSeasonNodeForSeasonNode:v16];
    v18 = +[PGLogging sharedLogging];
    uint64_t v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      long long v20 = [v17 name];
      int v28 = 138412290;
      int v29 = v20;
      uint64_t v21 = "Contextual Season ZK : previous season %@";
LABEL_9:
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v28, 0xCu);
    }
  }
  else
  {
    id v17 = v16;
    uint64_t v22 = +[PGLogging sharedLogging];
    uint64_t v19 = [v22 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      long long v20 = [v17 name];
      int v28 = 138412290;
      int v29 = v20;
      uint64_t v21 = "Contextual Season ZK : current season %@";
      goto LABEL_9;
    }
  }

  if (v17)
  {
    photoLibrary = self->_photoLibrary;
    curationManager = self->_curationManager;
    uint64_t v25 = [(PGZeroKeywordComputer *)self searchComputationCache];
    v26 = seasonNodeZeroKeyword(v17, photoLibrary, curationManager, v25, v9);

    if (v26)
    {
      [v12 addObject:v26];
    }
  }

  return v12;
}

- (id)contextualSocialGroupZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = 0.0;
  v71 = (void (**)(void *, unsigned char *, double))_Block_copy(v10);
  if (!v71) {
    goto LABEL_8;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current < 0.01) {
    goto LABEL_8;
  }
  char v93 = 0;
  v71[2](v71, &v93, 0.0);
  if (!v93)
  {
    double v11 = Current;
LABEL_8:
    id v62 = v10;
    id v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = [v9 objectForKeyedSubscript:@"PHMemoryOptionPeopleNamesKey"];
    v16 = [v9 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];
    id v17 = v16;
    id v63 = v9;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F76C68] currentLocalDate];
    }
    id v68 = v18;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    v73 = [MEMORY[0x1E4F1CA80] set];
    v69 = self;
    long long v20 = self->_photoLibrary;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    aBlock[3] = &unk_1E68E90D0;
    id v64 = v8;
    id v21 = v8;
    id v89 = v21;
    id v65 = v20;
    v90 = v65;
    id v61 = v19;
    id v91 = v61;
    id v67 = v14;
    id v92 = v67;
    uint64_t v70 = (void (**)(void *, void *))_Block_copy(aBlock);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    obuint64_t j = v15;
    uint64_t v22 = [obj countByEnumeratingWithState:&v84 objects:v97 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v85 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v84 + 1) + 8 * i);
          v95 = @"name";
          uint64_t v96 = v26;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
          v82[3] = &unk_1E68EF528;
          id v83 = v73;
          [v21 enumerateNodesWithLabel:@"People" domain:300 properties:v27 usingBlock:v82];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v84 objects:v97 count:16];
      }
      while (v23);
    }

    v70[2](v70, v73);
    if (v71)
    {
      double v28 = CFAbsoluteTimeGetCurrent();
      uint64_t v30 = v67;
      int v29 = v68;
      if (v28 - v11 >= 0.01)
      {
        char v93 = 0;
        v71[2](v71, &v93, 0.5);
        if (v93)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)&buf[4] = 206;
            LOWORD(v99) = 2080;
            *(void *)((char *)&v99 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v13 = (id)MEMORY[0x1E4F1CBF0];
          int v31 = v61;
          id v10 = v62;
LABEL_64:

          goto LABEL_65;
        }
        double v11 = v28;
      }
    }
    else
    {
      uint64_t v30 = v67;
      int v29 = v68;
    }
    uint64_t v66 = [v30 count];
    __int16 v59 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:-1 toDate:v29];
    id v68 = v29;
    long long v58 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v59 endDate:v29];
    long long v57 = -[PGZeroKeywordComputer momentNodesOverlappingLocalDateInterval:inGraph:](v69, "momentNodesOverlappingLocalDateInterval:inGraph:");
    int v32 = [v57 set];
    uint64_t v33 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    *(void *)uint64_t buf = v33;
    long long v34 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
    *(void *)&long long v99 = v34;
    long long v35 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
    *((void *)&v99 + 1) = v35;
    id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

    v37 = [v32 sortedArrayUsingDescriptors:v36];

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v60 = v37;
    v38 = [v37 reverseObjectEnumerator];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v94 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v79;
      while (2)
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v79 != v41) {
            objc_enumerationMutation(v38);
          }
          id v43 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          char v44 = (void *)MEMORY[0x1D25FED50]();
          [v73 removeAllObjects];
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_249;
          v76[3] = &unk_1E68EF528;
          id v45 = v73;
          id v77 = v45;
          [v43 enumeratePersonNodesUsingBlock:v76];
          v70[2](v70, v45);
          if (v71)
          {
            double v46 = CFAbsoluteTimeGetCurrent();
            if (v46 - v11 >= 0.01)
            {
              char v93 = 0;
              v71[2](v71, &v93, 0.5);
              if (v93)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)uint64_t buf = 67109378;
                  *(_DWORD *)&buf[4] = 226;
                  LOWORD(v99) = 2080;
                  *(void *)((char *)&v99 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoana"
                                                  "lysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                id v13 = (id)MEMORY[0x1E4F1CBF0];
                id v9 = v63;
                id v8 = v64;
                int v31 = v61;
                id v10 = v62;
                uint64_t v30 = v67;
                goto LABEL_63;
              }
              double v11 = v46;
            }
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v78 objects:v94 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }

    uint64_t v30 = v67;
    if ([v67 count] == v66)
    {
      v47 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:-2 toDate:v68];
      unsigned __int8 v48 = [v60 firstObject];
      unsigned __int8 v49 = [v48 previousMomentNode];

      id v8 = v64;
      id v10 = v62;
      if ([v67 count] == v66 && v49)
      {
        while (1)
        {
          id v50 = [v49 localEndDate];
          uint64_t v51 = [v50 compare:v47];

          if (v51 == -1) {
            break;
          }
          v52 = (void *)MEMORY[0x1D25FED50]();
          if ([v49 isInteresting])
          {
            [v73 removeAllObjects];
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_250;
            v74[3] = &unk_1E68EF528;
            id v53 = v73;
            id v75 = v53;
            [v49 enumeratePersonNodesUsingBlock:v74];
            v70[2](v70, v53);
            if (v71)
            {
              double v54 = CFAbsoluteTimeGetCurrent();
              if (v54 - v11 >= 0.01)
              {
                char v93 = 0;
                v71[2](v71, &v93, 0.5);
                if (v93)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)uint64_t buf = 67109378;
                    *(_DWORD *)&buf[4] = 245;
                    LOWORD(v99) = 2080;
                    *(void *)((char *)&v99 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoa"
                                                    "nalysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  id v13 = (id)MEMORY[0x1E4F1CBF0];
                  id v9 = v63;
                  int v31 = v61;
                  goto LABEL_63;
                }
                double v11 = v54;
              }
            }
          }
          long long v55 = [v49 previousMomentNode];

          if ([v67 count] == v66)
          {
            unsigned __int8 v49 = v55;
            if (v55) {
              continue;
            }
          }
          goto LABEL_55;
        }
      }
      long long v55 = v49;
LABEL_55:
    }
    else
    {
      id v8 = v64;
      id v10 = v62;
    }
    id v9 = v63;
    int v31 = v61;
    if (v71 && CFAbsoluteTimeGetCurrent() - v11 >= 0.01 && (char v93 = 0, v71[2](v71, &v93, 1.0), v93))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)&buf[4] = 252;
        LOWORD(v99) = 2080;
        *(void *)((char *)&v99 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v13 = v67;
    }
LABEL_63:

    goto LABEL_64;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)&buf[4] = 168;
    LOWORD(v99) = 2080;
    *(void *)((char *)&v99 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_65:

  return v13;
}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) maximalSocialGroupsOverlappingMemberLocalIdentifiers:a2];
  id v10 = +[PGPeopleUtilities validateSocialGroups:v3 withPhotoLibrary:*(void *)(a1 + 40) graph:*(void *)(a1 + 32)];

  BOOL v4 = [v10 count] == 1;
  v5 = v10;
  if (v4)
  {
    id v6 = [v10 firstObject];
    double v7 = personUUIDsFromPersonLocalIdentifiers(v6);
    id v8 = PLSearchSocialGroupLookupIdentifier();

    if (([*(id *)(a1 + 48) containsObject:v8] & 1) == 0)
    {
      id v9 = zeroKeywordWithAttributes(1, 5, 0, 0, v8, v6);
      [*(id *)(a1 + 56) addObject:v9];
      [*(id *)(a1 + 48) addObject:v8];
    }
    v5 = v10;
  }
}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 localIdentifier];
  [v2 addObject:v3];
}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_249(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 localIdentifier];
  [v2 addObject:v3];
}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_250(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 localIdentifier];
  [v2 addObject:v3];
}

- (id)contextualPersonZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v7 = a4;
  id v58 = a5;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x2020000000;
  char v115 = 0;
  uint64_t v108 = 0;
  v109 = (double *)&v108;
  uint64_t v110 = 0x2020000000;
  uint64_t v111 = 0;
  id v67 = _Block_copy(v58);
  long long v57 = v7;
  if (v67
    && (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v109[3] >= 0.01)
    && (v109[3] = v8,
        char v107 = 0,
        (*((void (**)(void *, char *, double))v67 + 2))(v67, &v107, 0.0),
        char v9 = *((unsigned char *)v113 + 24) | v107,
        (*((unsigned char *)v113 + 24) = v9) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)&buf[4] = 49;
      LOWORD(v121) = 2080;
      *(void *)((char *)&v121 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    long long v60 = [MEMORY[0x1E4F1CA48] array];
    double v11 = [v7 objectForKeyedSubscript:@"PHMemoryOptionPeopleNamesKey"];
    id v12 = [v7 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];
    id v13 = v12;
    if (v12)
    {
      id v59 = v12;
    }
    else
    {
      id v59 = [MEMORY[0x1E4F76C68] currentLocalDate];
    }

    id v14 = [MEMORY[0x1E4F1CA80] set];
    v15 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    aBlock[3] = &unk_1E68E9058;
    id v55 = v14;
    id v105 = v55;
    id v63 = v15;
    id v106 = v63;
    id v65 = _Block_copy(aBlock);
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    obuint64_t j = v11;
    uint64_t v16 = [obj countByEnumeratingWithState:&v100 objects:v119 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v101;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v101 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          v117 = @"name";
          uint64_t v118 = v19;
          long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
          v94[3] = &unk_1E68E9080;
          id v95 = v65;
          id v96 = v67;
          v97 = &v108;
          uint64_t v99 = 0x3F847AE147AE147BLL;
          v98 = &v112;
          [v66 enumerateNodesWithLabel:@"People" domain:300 properties:v20 usingBlock:v94];

          if (*((unsigned char *)v113 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 67109378;
              *(_DWORD *)&buf[4] = 82;
              LOWORD(v121) = 2080;
              *(void *)((char *)&v121 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            id v10 = (id)MEMORY[0x1E4F1CBF0];
            id v27 = v95;
            long long v56 = obj;
            goto LABEL_55;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v100 objects:v119 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v21 = filteredKeywords(v63, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0.0);
    [v60 addObjectsFromArray:v21];

    [v63 removeAllObjects];
    uint64_t v22 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:-1 toDate:v59];
    uint64_t v23 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:1 toDate:v59];
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v22 endDate:v23];
    uint64_t v25 = [MEMORY[0x1E4F76C68] yearFromDate:v22];
    long long v56 = (void *)v22;
    v52 = (void *)v23;
    uint64_t v26 = [MEMORY[0x1E4F76C68] yearFromDate:v23];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_244;
    v84[3] = &unk_1E68E90A8;
    uint64_t v90 = v25;
    id v51 = v24;
    id v85 = v51;
    BOOL v93 = v25 != v26;
    id v61 = v65;
    id v86 = v61;
    uint64_t v91 = v26;
    id v62 = v67;
    id v87 = v62;
    v88 = &v108;
    uint64_t v92 = 0x3F847AE147AE147BLL;
    id v89 = &v112;
    [v66 enumerateNodesWithLabel:0 domain:300 usingBlock:v84];
    if (*((unsigned char *)v113 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)&buf[4] = 120;
        LOWORD(v121) = 2080;
        *(void *)((char *)&v121 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      double v28 = filteredKeywords(v63, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0.0);
      [v60 addObjectsFromArray:v28];

      [v63 removeAllObjects];
      unsigned __int8 v49 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v22 endDate:v59];
      unsigned __int8 v48 = -[PGZeroKeywordComputer momentNodesOverlappingLocalDateInterval:inGraph:](self, "momentNodesOverlappingLocalDateInterval:inGraph:");
      int v29 = [v48 set];
      uint64_t v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
      *(void *)uint64_t buf = v30;
      int v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
      *(void *)&long long v121 = v31;
      int v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
      *((void *)&v121 + 1) = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

      id v50 = [v29 sortedArrayUsingDescriptors:v33];

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v34 = [v50 reverseObjectEnumerator];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v80 objects:v116 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v81;
        id v54 = v34;
        while (2)
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v81 != v36) {
              objc_enumerationMutation(v54);
            }
            v38 = *(void **)(*((void *)&v80 + 1) + 8 * j);
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_245;
            v74[3] = &unk_1E68E9080;
            id v75 = v61;
            id v76 = v62;
            id v77 = &v108;
            long long v78 = &v112;
            uint64_t v79 = 0x3F847AE147AE147BLL;
            [v38 enumeratePersonNodesUsingBlock:v74];
            if (*((unsigned char *)v113 + 24))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)uint64_t buf = 67109378;
                *(_DWORD *)&buf[4] = 139;
                LOWORD(v121) = 2080;
                *(void *)((char *)&v121 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_45;
            }
          }
          long long v34 = v54;
          uint64_t v35 = [v54 countByEnumeratingWithState:&v80 objects:v116 count:16];
          if (v35) {
            continue;
          }
          break;
        }
      }

      if (![v63 count])
      {
        uint64_t v39 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:-2 toDate:v59];
        uint64_t v40 = [v50 firstObject];
        uint64_t v41 = [v40 previousMomentNode];

        while (1)
        {
          if ([v63 count]
            || !v41
            || ([v41 localEndDate],
                id v42 = objc_claimAutoreleasedReturnValue(),
                BOOL v43 = [v42 compare:v39] == -1,
                v42,
                v43))
          {

            break;
          }
          if ([v41 isInteresting])
          {
            v68[0] = MEMORY[0x1E4F143A8];
            v68[1] = 3221225472;
            v68[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_246;
            v68[3] = &unk_1E68E9080;
            id v69 = v61;
            id v70 = v62;
            v71 = &v108;
            v72 = &v112;
            uint64_t v73 = 0x3F847AE147AE147BLL;
            [v41 enumeratePersonNodesUsingBlock:v68];
            if (*((unsigned char *)v113 + 24))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)uint64_t buf = 67109378;
                *(_DWORD *)&buf[4] = 154;
                LOWORD(v121) = 2080;
                *(void *)((char *)&v121 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_45;
            }
          }
          uint64_t v44 = [v41 previousMomentNode];

          uint64_t v41 = (void *)v44;
        }
      }
      if (v67
        && (double Current = CFAbsoluteTimeGetCurrent(), Current - v109[3] >= 0.01)
        && (v109[3] = Current,
            char v107 = 0,
            (*((void (**)(id, char *, double))v62 + 2))(v62, &v107, 1.0),
            char v46 = *((unsigned char *)v113 + 24) | v107,
            (*((unsigned char *)v113 + 24) = v46) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)&buf[4] = 160;
          LOWORD(v121) = 2080;
          *(void *)((char *)&v121 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_45:
        id v10 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v10 = v60;
      }
    }
    id v27 = v52;
LABEL_55:
  }
  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v112, 8);

  return v10;
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 localIdentifier];
  BOOL v4 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v3];
  if ([v4 length] && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v4];
    v5 = [v12 name];
    id v6 = zeroKeywordWithAttributes(0, 1, v5, 0, v4, v3);

    id v7 = [v12 collection];
    double v8 = [v7 momentNodes];
    double v9 = (double)(unint64_t)[v8 count];

    id v10 = *(void **)(a1 + 40);
    double v11 = [[PGRankedZeroKeyword alloc] initWithKeyword:v6 score:v9];
    [v10 addObject:v11];
  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(void *)(a1 + 40))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_244(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 birthdayDate];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F76C68] dateBySettingYear:*(void *)(a1 + 72) ofDate:v6];
    if (([*(id *)(a1 + 32) containsDate:v7] & 1) != 0
      || *(unsigned char *)(a1 + 96)
      && ([MEMORY[0x1E4F76C68] dateBySettingYear:*(void *)(a1 + 80) ofDate:v6],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          id v7 = (void *)v8,
          [*(id *)(a1 + 32) containsDate:v8]))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    if (*(void *)(a1 + 48))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      if (Current - *(double *)(v10 + 24) >= *(double *)(a1 + 88))
      {
        *(double *)(v10 + 24) = Current;
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.5);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          *a3 = 1;
        }
      }
    }
  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_245(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(void *)(a1 + 40))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_246(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(void *)(a1 + 40))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

+ (id)contextualHolidayZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v47 = a4;
  id v40 = a5;
  id v7 = _Block_copy(v40);
  uint64_t v72 = 0;
  uint64_t v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  uint64_t v68 = 0;
  id v69 = (double *)&v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  if (!v7
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v69[3] < 0.01)
    || (v69[3] = v8,
        LOBYTE(v76) = 0,
        (*((void (**)(void *, int *, double))v7 + 2))(v7, &v76, 0.0),
        char v9 = *((unsigned char *)v73 + 24) | v76,
        (*((unsigned char *)v73 + 24) = v9) == 0))
  {
    double v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v44 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v12 = [v47 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x1E4F76C68] currentLocalDate];
    }
    v15 = v14;

    uint64_t v41 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:-1 toDate:v15];
    id v42 = [MEMORY[0x1E4F76C68] endOfDayForDate:v15];
    uint64_t v16 = (void *)MEMORY[0x1E4F76C68];
    uint64_t v17 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v15];
    uint64_t v39 = [v16 startOfDayForDate:v17];

    v38 = [MEMORY[0x1E4F76C68] dateByAddingWeeksOfYear:1 toDate:v15];
    id v45 = (void *)[objc_alloc(MEMORY[0x1E4F76CB8]) initWithLocale:v44];
    BOOL v43 = +[PGGraphNodeCollection nodesInGraph:v46];
    id v18 = (void *)MEMORY[0x1E4F71E88];
    uint64_t v19 = +[PGGraphHolidayNode datesOfCelebration];
    long long v20 = [v18 adjacencyWithSources:v43 relation:v19 targetsClass:objc_opt_class()];

    id v21 = [v20 sources];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    v66[3] = &unk_1E68EF038;
    id v23 = v22;
    id v67 = v23;
    [v21 enumerateNodesUsingBlock:v66];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v25 = [v20 targets];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
    v64[3] = &unk_1E68ED880;
    id v26 = v24;
    id v65 = v26;
    [v25 enumerateNodesUsingBlock:v64];

    id v27 = [v21 holidayNames];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_3;
    v59[3] = &unk_1E68E9120;
    id v28 = v20;
    id v60 = v28;
    id v29 = v23;
    id v61 = v29;
    id v30 = v26;
    id v62 = v30;
    id v31 = v11;
    id v63 = v31;
    [v45 enumerateEventRulesWithNames:v27 betweenLocalDate:v41 andLocalDate:v42 usingBlock:v59];
    if (*((unsigned char *)v73 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 0x13704000202;
        LOWORD(v81) = 2080;
        *(void *)((char *)&v81 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      id v10 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_29;
    }
    v37 = v7;
    if ((unint64_t)[v31 count] >= 3) {
      objc_msgSend(v31, "removeObjectsInRange:", 0, objc_msgSend(v31, "count") - 2);
    }
    uint64_t buf = 0;
    *(void *)&long long v81 = &buf;
    *((void *)&v81 + 1) = 0x2020000000;
    uint64_t v82 = 2;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_263;
    v49[3] = &unk_1E68E9170;
    id v50 = v28;
    id v51 = v29;
    id v52 = v30;
    id v32 = v31;
    id v53 = v32;
    p_uint64_t buf = &buf;
    id v33 = v7;
    id v54 = v33;
    long long v56 = &v68;
    long long v57 = &v72;
    uint64_t v58 = 0x3F847AE147AE147BLL;
    [v45 enumerateEventRulesWithNames:v27 betweenLocalDate:v39 andLocalDate:v38 usingBlock:v49];
    if (*((unsigned char *)v73 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v76 = 67109378;
        int v77 = 363;
        __int16 v78 = 2080;
        uint64_t v79 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GZeroKeywordComputer+Contextual.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v76, 0x12u);
      }
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      if (v37)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v69[3] >= 0.01)
        {
          v69[3] = Current;
          char v48 = 0;
          (*((void (**)(id, char *, double))v33 + 2))(v33, &v48, 1.0);
          char v35 = *((unsigned char *)v73 + 24) | v48;
          *((unsigned char *)v73 + 24) = v35;
          id v7 = v37;
          if (v35)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v76 = 67109378;
              int v77 = 365;
              __int16 v78 = 2080;
              uint64_t v79 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Se"
                    "arch/PGZeroKeywordComputer+Contextual.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v76, 0x12u);
            }
            id v10 = (id)MEMORY[0x1E4F1CBF0];
            goto LABEL_28;
          }
        }
      }
      id v10 = v32;
    }
    id v7 = v37;
LABEL_28:

    _Block_object_dispose(&buf, 8);
LABEL_29:

    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x10404000202;
    LOWORD(v81) = 2080;
    *(void *)((char *)&v81 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_30:
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v10;
}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v4 forKeyedSubscript:v5];
}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v4 forKeyedSubscript:v5];
}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_4;
  v10[3] = &unk_1E68E90F8;
  id v7 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v15 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateTargetsBySourceWithBlock:v10];
}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_263(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2_264;
  v16[3] = &unk_1E68E9148;
  id v9 = *(void **)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v10 = v7;
  id v18 = v10;
  id v19 = *(id *)(a1 + 48);
  id v11 = v8;
  id v20 = v11;
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  id v21 = v12;
  uint64_t v22 = v13;
  id v23 = a4;
  [v9 enumerateTargetsBySourceWithBlock:v16];
  if (*(void *)(a1 + 64))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    if (Current - *(double *)(v15 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v15 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 64) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2_264(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 elementIdentifiers];
  uint64_t v7 = [v6 firstElement];

  id v8 = *(void **)(a1 + 32);
  id v9 = [NSNumber numberWithUnsignedInteger:v7];
  id v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v41 = v10;
  id v11 = [v10 name];
  id v12 = [*(id *)(a1 + 40) name];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v37 = v5;
    id v14 = [v5 elementIdentifiers];
    uint64_t v15 = [v14 indexArray];

    obuint64_t j = v15;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v52;
      uint64_t v19 = *MEMORY[0x1E4F8B4A8];
      uint64_t v20 = *MEMORY[0x1E4F8B450];
      uint64_t v38 = *(void *)v52;
      uint64_t v39 = a1;
      do
      {
        uint64_t v21 = 0;
        uint64_t v40 = v17;
        do
        {
          if (*(void *)v52 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*((void *)&v51 + 1) + 8 * v21)];
          id v23 = [v22 localDate];
          if ([*(id *)(a1 + 56) containsObject:v23])
          {
            id v24 = holidayNodeZeroKeyword(v41);
            if (v24)
            {
              uint64_t v45 = v21;
              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              id v46 = *(id *)(a1 + 64);
              uint64_t v25 = [v46 countByEnumeratingWithState:&v47 objects:v55 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v48;
                BOOL v43 = v23;
                uint64_t v44 = v22;
                do
                {
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    if (*(void *)v48 != v27) {
                      objc_enumerationMutation(v46);
                    }
                    id v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                    id v30 = [v24 objectForKeyedSubscript:v19];
                    id v31 = [v29 objectForKeyedSubscript:v19];
                    int v32 = [v30 isEqualToString:v31];

                    id v33 = [v24 objectForKeyedSubscript:v20];
                    long long v34 = [v29 objectForKeyedSubscript:v20];
                    int v35 = [v33 isEqualToString:v34];

                    if (v32) {
                      BOOL v36 = v35 == 0;
                    }
                    else {
                      BOOL v36 = 1;
                    }
                    if (!v36)
                    {

                      uint64_t v18 = v38;
                      a1 = v39;
                      uint64_t v17 = v40;
                      uint64_t v22 = v44;
                      uint64_t v21 = v45;
                      id v23 = v43;
                      goto LABEL_23;
                    }
                  }
                  uint64_t v26 = [v46 countByEnumeratingWithState:&v47 objects:v55 count:16];
                  id v23 = v43;
                  uint64_t v22 = v44;
                }
                while (v26);
              }

              a1 = v39;
              [*(id *)(v39 + 64) addObject:v24];
              --*(void *)(*(void *)(*(void *)(v39 + 72) + 8) + 24);
              uint64_t v18 = v38;
              uint64_t v17 = v40;
              uint64_t v21 = v45;
              if (!*(void *)(*(void *)(*(void *)(v39 + 72) + 8) + 24)) {
                **(unsigned char **)(v39 + 80) = 1;
              }
            }
LABEL_23:
          }
          ++v21;
        }
        while (v21 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v17);
    }

    id v5 = v37;
  }
}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 elementIdentifiers];
  uint64_t v7 = [v6 firstElement];

  id v8 = *(void **)(a1 + 32);
  id v9 = [NSNumber numberWithUnsignedInteger:v7];
  id v10 = [v8 objectForKeyedSubscript:v9];

  id v11 = [v10 name];
  id v12 = [*(id *)(a1 + 40) name];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = objc_msgSend(v5, "elementIdentifiers", 0);
    uint64_t v15 = [v14 indexArray];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * v19)];
          uint64_t v21 = [v20 localDate];
          if ([*(id *)(a1 + 56) containsObject:v21])
          {
            uint64_t v22 = holidayNodeZeroKeyword(v10);
            if (v22) {
              [*(id *)(a1 + 64) addObject:v22];
            }
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v17);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWhereMeIsPresent, 0);
  objc_storeStrong((id *)&self->_searchComputationCache, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (BOOL)shouldFilterMomentNodesWithPresence
{
  return self->_shouldFilterMomentNodesWithPresence;
}

- (PGGraphMomentNodeCollection)momentNodesWhereMeIsPresent
{
  return self->_momentNodesWhereMeIsPresent;
}

- (PGSearchComputationCache)searchComputationCache
{
  return self->_searchComputationCache;
}

- (id)meaningNodeZeroKeywordForDisplayMeaningNode:(id)a3 collectionUUIDsToAvoid:(id)a4 curationContext:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 label];
  id v12 = [v8 graph];
  int v13 = [v12 zeroKeywordMappingByMeaningLabel];
  id v14 = [v13 objectForKeyedSubscript:v11];
  uint64_t v15 = [v14 mappedMeaningNodes];
  if ([v15 count])
  {
    if (!isSuitableForZeroKeywordWithMeanings(v15))
    {
      long long v26 = 0;
      goto LABEL_12;
    }
    long long v34 = v13;
    photoLibrary = self->_photoLibrary;
    curationManager = self->_curationManager;
    uint64_t v18 = [(PGZeroKeywordComputer *)self searchComputationCache];
    uint64_t v19 = v9;
    uint64_t v20 = v18;
    id v32 = v10;
    id v33 = v19;
    uint64_t v21 = bestAssetIdentifiersForMeaningNodes(v15, v19, photoLibrary, curationManager, v18, v12, v10);

    uint64_t v22 = zeroKeywordLocalizationKeyForMeaningLabel(v11);
    long long v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v24 = [v23 localizedStringForKey:v22 value:v22 table:@"Localizable"];

    long long v25 = [v8 localizedName];
    if ([v21 count])
    {
      long long v26 = zeroKeywordWithAttributes(5, 13, v24, v25, 0, v21);
    }
    else
    {
      long long v26 = 0;
    }

    id v10 = v32;
    id v9 = v33;
  }
  else
  {
    long long v34 = v13;
    id v27 = v10;
    uint64_t v28 = +[PGLogging sharedLogging];
    id v29 = [v28 loggingConnection];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v31 = [v8 label];
      *(_DWORD *)uint64_t buf = 138412290;
      BOOL v36 = v31;
      _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "Cannot find root applicable meaning nodes for display meaning %@", buf, 0xCu);
    }
    long long v26 = 0;
    id v10 = v27;
  }
  int v13 = v34;
LABEL_12:

  return v26;
}

- (id)_tripZeroKeywordWithGraph:(id)a3 curationContext:(id)a4 score:(double *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 longTripNodes];
  if (![v8 count])
  {
    uint64_t v9 = [v6 shortTripNodes];

    id v8 = (void *)v9;
  }
  if ([(PGZeroKeywordComputer *)self shouldFilterMomentNodesWithPresence])
  {
    id v50 = v6;
    id v52 = v7;
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v61 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v17 = [v16 collection];
          uint64_t v18 = [v17 momentNodes];
          uint64_t v19 = [(PGZeroKeywordComputer *)self momentNodesWhereMeIsPresent];
          int v20 = [v18 intersectsCollection:v19];

          if (v20) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v13);
    }

    id v6 = v50;
    id v7 = v52;
    id v8 = v10;
  }
  if (![v8 count])
  {
    id v46 = 0;
    goto LABEL_37;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v21 = v8;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (!v22)
  {
    id v46 = 0;
LABEL_34:

    long long v23 = (void *)v22;
LABEL_36:

    goto LABEL_37;
  }
  long long v48 = v8;
  long long v51 = v6;
  long long v53 = v7;
  long long v23 = 0;
  long long v24 = 0;
  uint64_t v25 = *(void *)v57;
  do
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      if (*(void *)v57 != v25) {
        objc_enumerationMutation(v21);
      }
      id v27 = *(void **)(*((void *)&v56 + 1) + 8 * j);
      uint64_t v28 = objc_msgSend(v27, "localStartDate", v48);
      if (!v23 || [MEMORY[0x1E4F76C68] compareDate:v28 toDate:v23 toUnitGranularity:16] == 1)
      {
        id v29 = v28;

        id v30 = v27;
        long long v23 = v29;
        long long v24 = v30;
      }
    }
    uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v65 count:16];
  }
  while (v22);

  if (!v24)
  {
    id v46 = 0;
    id v6 = v51;
    id v7 = v53;
    id v8 = v48;
    goto LABEL_36;
  }
  id v31 = [v24 eventEnrichmentMomentNodes];
  id v32 = [v31 uuids];
  id v33 = [(PGZeroKeywordComputer *)self searchComputationCache];
  long long v34 = [v24 UUID];
  int v35 = [v32 allObjects];
  uint64_t v22 = [v33 keyAssetLocalIdentifierForNodeIdentifier:v34 withAssociatedMomentUUIDs:v35];

  if (!v22)
  {
    BOOL v36 = [v31 temporaryArray];
    id v55 = 0;
    uint64_t v22 = bestAssetIdentifierForMomentNodes(v36, &v55, v53);
    id v37 = v55;

    uint64_t v38 = [(PGZeroKeywordComputer *)self searchComputationCache];
    uint64_t v39 = [v24 UUID];
    [v38 setKeyAssetLocalIdentifier:v22 forNodeIdentifier:v39 withAssociatedMomentUUID:v37];
  }
  if (v22)
  {
    id v6 = v51;
    id v8 = v48;
    if (a5)
    {
      uint64_t v40 = [v51 allTripNodes];
      unint64_t v41 = [v40 count];

      *a5 = (double)v41;
    }
    id v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v21 = [v42 localizedStringForKey:@"PGMeaningTripZeroKeywordText" value:@"PGMeaningTripZeroKeywordText" table:@"Localizable"];

    BOOL v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v44 = [v43 localizedStringForKey:@"PGHighlightTripSearchableText" value:@"PGHighlightTripSearchableText" table:@"Localizable"];

    uint64_t v64 = v22;
    uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    id v46 = zeroKeywordWithAttributes(5, 13, v21, v44, 0, v45);

    id v7 = v53;
    goto LABEL_34;
  }
  id v46 = 0;
  id v6 = v51;
  id v7 = v53;
  id v8 = v48;
LABEL_37:

  return v46;
}

- (id)tripRankedKeywordWithGraph:(id)a3 curationContext:(id)a4
{
  double v8 = 0.0;
  id v4 = [(PGZeroKeywordComputer *)self _tripZeroKeywordWithGraph:a3 curationContext:a4 score:&v8];
  id v5 = [PGRankedZeroKeyword alloc];
  id v6 = [(PGRankedZeroKeyword *)v5 initWithKeyword:v4 score:v8];

  return v6;
}

- (id)tripZeroKeywordWithGraph:(id)a3 curationContext:(id)a4
{
  return [(PGZeroKeywordComputer *)self _tripZeroKeywordWithGraph:a3 curationContext:a4 score:0];
}

- (id)sceneZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _Block_copy(v9);
  uint64_t v95 = 0;
  id v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = (double *)&v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  long long v54 = v7;
  long long v51 = v8;
  id v52 = v9;
  if (!v10
    || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v92[3] < 0.01)
    || (v92[3] = v11,
        v100[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v10 + 2))(v10, v100, 0.0),
        char v12 = *((unsigned char *)v96 + 24) | v100[0],
        (*((unsigned char *)v96 + 24) = v12) == 0))
  {
    id v55 = [MEMORY[0x1E4F1CA48] array];
    long long v56 = [MEMORY[0x1E4F1CA80] set];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    v86[3] = &unk_1E68F03F8;
    long long v53 = v10;
    id v14 = v10;
    id v87 = v14;
    v88 = &v91;
    id v89 = &v95;
    uint64_t v90 = 0x3F847AE147AE147BLL;
    id v50 = [(PGZeroKeywordComputer *)self contextualSceneZeroKeywordsWithGraph:v7 options:v8 progressBlock:v86];
    if (*((unsigned char *)v96 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_11:
        id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_31:

        id v10 = v53;
        goto LABEL_32;
      }
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 696;
      LOWORD(v105) = 2080;
      *(void *)((char *)&v105 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Search/PGZeroKeywordComputer.m";
      uint64_t v15 = MEMORY[0x1E4F14500];
LABEL_10:
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_11;
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v16 = v50;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v82 objects:v107 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v83;
      uint64_t v19 = *MEMORY[0x1E4F8B450];
LABEL_14:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v83 != v18) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v82 + 1) + 8 * v20);
        [v55 addObject:v21];
        uint64_t v22 = [v21 objectForKeyedSubscript:v19];
        [v56 addObject:v22];

        if ((unint64_t)[v21 count] > 2) {
          break;
        }
        if (v17 == ++v20)
        {
          uint64_t v17 = [v16 countByEnumeratingWithState:&v82 objects:v107 count:16];
          if (v17) {
            goto LABEL_14;
          }
          break;
        }
      }
    }

    if (v53)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v92[3] >= 0.01)
      {
        v92[3] = Current;
        v100[0] = 0;
        (*((void (**)(id, uint8_t *, double))v14 + 2))(v14, v100, 0.1);
        char v24 = *((unsigned char *)v96 + 24) | v100[0];
        *((unsigned char *)v96 + 24) = v24;
        if (v24)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_11;
          }
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 707;
          LOWORD(v105) = 2080;
          *(void *)((char *)&v105 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Search/PGZeroKeywordComputer.m";
          uint64_t v15 = MEMORY[0x1E4F14500];
          goto LABEL_10;
        }
      }
    }
    uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v27 = [MEMORY[0x1E4F1CA60] dictionary];
    *(void *)uint64_t buf = 0;
    *(void *)&long long v105 = buf;
    *((void *)&v105 + 1) = 0x2020000000;
    uint64_t v106 = 0x3FB999999999999ALL;
    uint64_t v28 = +[PGGraphNodeCollection nodesInGraph:v54];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_322;
    v71[3] = &unk_1E68EE580;
    id v48 = v14;
    id v77 = v48;
    __int16 v78 = &v91;
    uint64_t v81 = 0x3F847AE147AE147BLL;
    uint64_t v79 = buf;
    long long v80 = &v95;
    id v57 = v27;
    id v72 = v57;
    id v73 = v56;
    id v58 = v25;
    id v74 = v58;
    id v49 = v26;
    id v75 = v49;
    int v76 = self;
    [v28 enumerateNodesUsingBlock:v71];

    if (*((unsigned char *)v96 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long v100 = 67109378;
        int v101 = 763;
        __int16 v102 = 2080;
        long long v103 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        id v29 = MEMORY[0x1E4F14500];
LABEL_28:
        _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v100, 0x12u);
      }
    }
    else
    {
      if (v53)
      {
        double v31 = CFAbsoluteTimeGetCurrent();
        if (v31 - v92[3] >= 0.01)
        {
          v92[3] = v31;
          char v70 = 0;
          (*((void (**)(id, char *, double))v48 + 2))(v48, &v70, 0.8);
          char v32 = *((unsigned char *)v96 + 24) | v70;
          *((unsigned char *)v96 + 24) = v32;
          if (v32)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_29;
            }
            *(_DWORD *)long long v100 = 67109378;
            int v101 = 765;
            __int16 v102 = 2080;
            long long v103 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            id v29 = MEMORY[0x1E4F14500];
            goto LABEL_28;
          }
        }
      }
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v33 = v49;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v66 objects:v99 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v67 != v35) {
              objc_enumerationMutation(v33);
            }
            id v37 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            uint64_t v38 = (void *)MEMORY[0x1D25FED50]();
            uint64_t v39 = -[CLSSceneTaxonomyHierarchy nodeForIdentifier:](self->_sceneTaxonomy, "nodeForIdentifier:", [v37 unsignedLongLongValue]);
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_331;
            v60[3] = &unk_1E68EE5A8;
            id v40 = v33;
            id v61 = v40;
            id v62 = v57;
            long long v63 = v37;
            id v41 = v39;
            id v64 = v41;
            id v65 = v58;
            [v41 visitParentsUsingNameBlock:v60];
          }
          uint64_t v34 = [v40 countByEnumeratingWithState:&v66 objects:v99 count:16];
        }
        while (v34);
      }

      if (v53)
      {
        double v42 = CFAbsoluteTimeGetCurrent();
        if (v42 - v92[3] >= 0.01)
        {
          v92[3] = v42;
          char v70 = 0;
          (*((void (**)(id, char *, double))v48 + 2))(v48, &v70, 0.9);
          char v43 = *((unsigned char *)v96 + 24) | v70;
          *((unsigned char *)v96 + 24) = v43;
          if (v43)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_29;
            }
            *(_DWORD *)long long v100 = 67109378;
            int v101 = 792;
            __int16 v102 = 2080;
            long long v103 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            id v29 = MEMORY[0x1E4F14500];
            goto LABEL_28;
          }
        }
      }
      uint64_t v44 = [v58 allObjects];
      uint64_t v45 = filteredKeywords(v44, 0xAuLL, 0xFuLL, 0.9);
      [v55 addObjectsFromArray:v45];

      if ((unint64_t)[v55 count] >= 0x10) {
        objc_msgSend(v55, "removeObjectsInRange:", 15, objc_msgSend(v55, "count") - 15);
      }
      if (!v53
        || (double v46 = CFAbsoluteTimeGetCurrent(), v46 - v92[3] < 0.01)
        || (v92[3] = v46,
            char v70 = 0,
            (*((void (**)(id, char *, double))v48 + 2))(v48, &v70, 1.0),
            char v47 = *((unsigned char *)v96 + 24) | v70,
            (*((unsigned char *)v96 + 24) = v47) == 0))
      {
        id v13 = v55;
        goto LABEL_30;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long v100 = 67109378;
        int v101 = 803;
        __int16 v102 = 2080;
        long long v103 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        id v29 = MEMORY[0x1E4F14500];
        goto LABEL_28;
      }
    }
LABEL_29:
    id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_30:

    _Block_object_dispose(buf, 8);
    goto LABEL_31;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 687;
    LOWORD(v105) = 2080;
    *(void *)((char *)&v105 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Search/PGZeroKeywordComputer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_32:
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

  return v13;
}

void __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_322(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D25FED50]();
  if (*(void *)(a1 + 72)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v8 + 24) = Current,
        LOBYTE(v26) = 0,
        (*(void (**)(double))(*(void *)(a1 + 72) + 16))(*(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = (*(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                             + 24)
                                                                 + 0.8)
                                                                * 0.5;
    uint64_t v26 = 0;
    id v27 = (double *)&v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
    v25[3] = &unk_1E68EE558;
    v25[4] = &v26;
    [v5 enumerateMomentEdgesAndNodesUsingBlock:v25];
    uint64_t v9 = [v5 level];
    unint64_t v10 = v9 - 1;
    if (!v9) {
      unint64_t v10 = 0;
    }
    double v11 = ((double)v10 * 0.1 + 1.0) * v27[3];
    v27[3] = v11;
    if (v11 != 0.0
      && [v5 isSuitableForSuggestions]
      && [v5 isIndexed])
    {
      char v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "sceneIdentifier"));
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v12];
      if ([*(id *)(a1 + 40) containsObject:v12])
      {
        id v13 = [PGRankedZeroKeyword alloc];
        id v14 = [(PGRankedZeroKeyword *)v13 initWithKeyword:0 score:v27[3]];
        [*(id *)(a1 + 48) addObject:v14];
        [*(id *)(a1 + 56) setObject:v14 forKeyedSubscript:v12];
      }
      else
      {
        uint64_t v15 = [v5 label];
        id v14 = [NSString stringWithFormat:@"PGScene%@ZeroKeywordText", v15];

        id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v17 = [v16 localizedStringForKey:v14 value:v14 table:@"Localizable"];

        if (v17 == v14)
        {
          uint64_t v18 = +[PGLogging sharedLogging];
          uint64_t v19 = [v18 loggingConnection];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            uint64_t v20 = [v5 label];
            *(_DWORD *)uint64_t buf = 138412290;
            double v31 = v20;
            _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "No ZK title key for scene with label %@", buf, 0xCu);
          }
          uint64_t v17 = [v5 localizedName];
        }
        id v21 = [v5 localizedName];
        uint64_t v22 = zeroKeywordWithAttributes(3, 13, v17, v21, 0, v12);
        long long v23 = [PGRankedZeroKeyword alloc];
        char v24 = [(PGRankedZeroKeyword *)v23 initWithKeyword:v22 score:v27[3]];
        [*(id *)(a1 + 48) addObject:v24];
        [*(id *)(a1 + 56) setObject:v24 forKeyedSubscript:v12];
      }
    }
    _Block_object_dispose(&v26, 8);
  }
}

uint64_t __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_331(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    double v10 = (double)(unint64_t)[v8 numberOfAssets];
    double v11 = v10 / (double)(unint64_t)[v9 numberOfAssets];
    if (v11 >= 0.75)
    {
      char v12 = +[PGLogging sharedLogging];
      id v13 = [v12 loggingConnection];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [*(id *)(a1 + 56) name];
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        __int16 v20 = 2048;
        double v21 = v11;
        _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Filtering out scene ZK %@ because child scene %@ covers %f of the assets", (uint8_t *)&v16, 0x20u);
      }
      [*(id *)(a1 + 64) removeObject:v7];
    }
  }
  return 0;
}

void __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = [v5 isReliable];
  double v4 = 0.0;
  if (v3) {
    double v4 = (double)(unint64_t)objc_msgSend(v5, "numberOfSearchConfidenceAssets", 0.0);
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

- (id)eventZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v74 = a4;
  id v79 = a5;
  id v73 = a6;
  uint64_t v121 = 0;
  uint64_t v122 = &v121;
  uint64_t v123 = 0x2020000000;
  char v124 = 0;
  uint64_t v117 = 0;
  uint64_t v118 = (double *)&v117;
  uint64_t v119 = 0x2020000000;
  uint64_t v120 = 0;
  long long v82 = _Block_copy(v73);
  if (!v82
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v118[3] < 0.01)
    || (v118[3] = v9,
        v127[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v82 + 2))(v82, v127, 0.0),
        char v10 = *((unsigned char *)v122 + 24) | v127[0],
        (*((unsigned char *)v122 + 24) = v10) == 0))
  {
    char v12 = [MEMORY[0x1E4F1CA48] array];
    id v77 = [MEMORY[0x1E4F1CA80] set];
    __int16 v78 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    id v13 = objc_opt_class();
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
    v112[3] = &unk_1E68F03F8;
    id v14 = v82;
    id v113 = v14;
    uint64_t v114 = &v117;
    uint64_t v116 = 0x3F847AE147AE147BLL;
    char v115 = &v121;
    id v72 = [v13 contextualHolidayZeroKeywordsWithGraph:v80 options:v79 progressBlock:v112];
    uint64_t v81 = v12;
    if (*((unsigned char *)v122 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_11:
        id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_89:

        goto LABEL_90;
      }
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 545;
      LOWORD(v133) = 2080;
      *(void *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Search/PGZeroKeywordComputer.m";
      uint64_t v15 = MEMORY[0x1E4F14500];
LABEL_10:
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_11;
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v16 = v72;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v108 objects:v135 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v109;
LABEL_14:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v109 != v18) {
          objc_enumerationMutation(v16);
        }
        [v12 addObject:*(void *)(*((void *)&v108 + 1) + 8 * v19)];
        if ((unint64_t)[v12 count] > 2) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v16 countByEnumeratingWithState:&v108 objects:v135 count:16];
          if (v17) {
            goto LABEL_14;
          }
          break;
        }
      }
    }

    if (v82)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v118[3] >= 0.01)
      {
        v118[3] = Current;
        v127[0] = 0;
        (*((void (**)(id, uint8_t *, double))v14 + 2))(v14, v127, 0.3);
        char v21 = *((unsigned char *)v122 + 24) | v127[0];
        *((unsigned char *)v122 + 24) = v21;
        if (v21)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_11;
          }
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 554;
          LOWORD(v133) = 2080;
          *(void *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Search/PGZeroKeywordComputer.m";
          uint64_t v15 = MEMORY[0x1E4F14500];
          goto LABEL_10;
        }
      }
    }
    uint64_t v22 = [(PGZeroKeywordComputer *)self contextualDateZeroKeywordsWithGraph:v80 options:v79];
    [v12 addObjectsFromArray:v22];

    long long v23 = [(PGZeroKeywordComputer *)self contextualSeasonZeroKeywordsWithGraph:v80 curationContext:v74 options:v79];
    [v12 addObjectsFromArray:v23];

    char v24 = [MEMORY[0x1E4F1CA80] set];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_316;
    v103[3] = &unk_1E68F03F8;
    id v66 = v14;
    id v104 = v66;
    long long v105 = &v117;
    uint64_t v106 = &v121;
    uint64_t v107 = 0x3F847AE147AE147BLL;
    uint64_t v25 = [(PGZeroKeywordComputer *)self contextualMeaningAndTripZeroKeywordsWithGraph:v80 curationContext:v74 options:v79 progressBlock:v103];
    id v65 = v25;
    if (*((unsigned char *)v122 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 572;
        LOWORD(v133) = 2080;
        *(void *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Search/PGZeroKeywordComputer.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_88;
    }
    *(void *)uint64_t buf = 0;
    *(void *)&long long v133 = buf;
    *((void *)&v133 + 1) = 0x2020000000;
    uint64_t v134 = 0x3FE0000000000000;
    uint64_t v26 = v25;
    unint64_t v27 = objc_msgSend(v25, "count", v25);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    obuint64_t j = v26;
    uint64_t v28 = [obj countByEnumeratingWithState:&v99 objects:v131 count:16];
    if (v28)
    {
      unint64_t v76 = 0;
      double v29 = 0.1 / (double)v27;
      uint64_t v71 = *(void *)v100;
      uint64_t v69 = *MEMORY[0x1E4F8B4A8];
      uint64_t v68 = *MEMORY[0x1E4F8B450];
      while (2)
      {
        uint64_t v70 = v28;
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v100 != v71) {
            objc_enumerationMutation(obj);
          }
          double v31 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          if (v82)
          {
            double v32 = CFAbsoluteTimeGetCurrent();
            if (v32 - v118[3] >= 0.01)
            {
              v118[3] = v32;
              char v98 = 0;
              (*((void (**)(id, char *, double))v66 + 2))(v66, &v98, *(double *)(v133 + 24));
              char v33 = *((unsigned char *)v122 + 24) | v98;
              *((unsigned char *)v122 + 24) = v33;
              if (v33)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v127 = 67109378;
                  int v128 = 578;
                  __int16 v129 = 2080;
                  v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Search/PGZeroKeywordComputer.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
                }

                goto LABEL_71;
              }
            }
          }
          *(double *)(v133 + 24) = v29 + *(double *)(v133 + 24);
          [v81 addObject:v31];
          uint64_t v34 = [v31 objectForKeyedSubscript:v69];
          [v77 addObject:v34];

          uint64_t v35 = [v31 objectForKeyedSubscript:v68];
          if ([v35 count])
          {
            BOOL v36 = [v35 firstObject];
            id v37 = (void *)MEMORY[0x1E4F38EB8];
            v126 = v36;
            uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
            uint64_t v39 = [v37 fetchAssetsWithLocalIdentifiers:v38 options:v78];

            if ([v39 count])
            {
              id v40 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAssets:v39 withType:3 options:v78];
              long long v96 = 0u;
              long long v97 = 0u;
              long long v95 = 0u;
              long long v94 = 0u;
              id v41 = v40;
              uint64_t v42 = [v41 countByEnumeratingWithState:&v94 objects:v125 count:16];
              if (v42)
              {
                uint64_t v43 = *(void *)v95;
                do
                {
                  for (uint64_t j = 0; j != v42; ++j)
                  {
                    if (*(void *)v95 != v43) {
                      objc_enumerationMutation(v41);
                    }
                    uint64_t v45 = [*(id *)(*((void *)&v94 + 1) + 8 * j) uuid];
                    [v24 addObject:v45];
                  }
                  uint64_t v42 = [v41 countByEnumeratingWithState:&v94 objects:v125 count:16];
                }
                while (v42);
              }
            }
            if (v76 >= 2)
            {

              goto LABEL_53;
            }
            ++v76;
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v99 objects:v131 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
LABEL_53:

    if (v82)
    {
      double v46 = CFAbsoluteTimeGetCurrent();
      if (v46 - v118[3] >= 0.01)
      {
        v118[3] = v46;
        char v98 = 0;
        (*((void (**)(id, char *, double))v66 + 2))(v66, &v98, 0.6);
        char v47 = *((unsigned char *)v122 + 24) | v98;
        *((unsigned char *)v122 + 24) = v47;
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v127 = 67109378;
            int v128 = 604;
            __int16 v129 = 2080;
            v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
          }
LABEL_71:
          id v11 = (id)MEMORY[0x1E4F1CBF0];
          goto LABEL_87;
        }
      }
    }
    id v48 = [v80 zeroKeywordMappingByMeaningLabel];
    id v49 = [MEMORY[0x1E4F1CA48] array];
    *(void *)(v133 + 24) = 0x3FE3333333333333;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_317;
    v83[3] = &unk_1E68EE530;
    uint64_t v90 = buf;
    id v50 = v66;
    uint64_t v93 = 0x3F847AE147AE147BLL;
    uint64_t v91 = &v117;
    uint64_t v92 = &v121;
    id v89 = v50;
    v83[4] = self;
    id v84 = v24;
    id v51 = v74;
    id v85 = v51;
    id v86 = v78;
    id v52 = v77;
    id v87 = v52;
    id v53 = v49;
    id v88 = v53;
    [v48 enumerateKeysAndObjectsUsingBlock:v83];
    if (*((unsigned char *)v122 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v127 = 67109378;
        int v128 = 656;
        __int16 v129 = 2080;
        v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        long long v54 = MEMORY[0x1E4F14500];
LABEL_61:
        _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
      }
    }
    else
    {
      if (!v82
        || (double v55 = CFAbsoluteTimeGetCurrent(), v55 - v118[3] < 0.01)
        || (v118[3] = v55,
            char v98 = 0,
            (*((void (**)(id, char *, double))v50 + 2))(v50, &v98, 0.9),
            char v56 = *((unsigned char *)v122 + 24) | v98,
            (*((unsigned char *)v122 + 24) = v56) == 0))
      {
        id v57 = [(PGZeroKeywordComputer *)self tripRankedKeywordWithGraph:v80 curationContext:v51];
        id v58 = v57;
        if (v57)
        {
          long long v59 = [v57 zeroKeyword];
          long long v60 = [v59 objectForKeyedSubscript:*MEMORY[0x1E4F8B4A8]];

          if (([v52 containsObject:v60] & 1) == 0) {
            [v53 addObject:v58];
          }
        }
        id v61 = filteredKeywords(v53, 7uLL, 0xFuLL, 0.35);
        [v81 addObjectsFromArray:v61];

        if ((unint64_t)[v81 count] >= 0x10) {
          objc_msgSend(v81, "removeObjectsInRange:", 15, objc_msgSend(v81, "count") - 15);
        }
        if (v82
          && (double v62 = CFAbsoluteTimeGetCurrent(), v62 - v118[3] >= 0.01)
          && (v118[3] = v62,
              char v98 = 0,
              (*((void (**)(id, char *, double))v50 + 2))(v50, &v98, 1.0),
              char v63 = *((unsigned char *)v122 + 24) | v98,
              (*((unsigned char *)v122 + 24) = v63) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v127 = 67109378;
            int v128 = 679;
            __int16 v129 = 2080;
            v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
          }
          id v11 = (id)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          id v11 = v81;
        }

        goto LABEL_86;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v127 = 67109378;
        int v128 = 658;
        __int16 v129 = 2080;
        v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        long long v54 = MEMORY[0x1E4F14500];
        goto LABEL_61;
      }
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_86:

LABEL_87:
    _Block_object_dispose(buf, 8);
LABEL_88:

    goto LABEL_89;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 531;
    LOWORD(v133) = 2080;
    *(void *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Search/PGZeroKeywordComputer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_90:
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v121, 8);

  return v11;
}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_316(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_317(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v7 = a3;
  context = (void *)MEMORY[0x1D25FED50]();
  *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = (*(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                           + 24)
                                                               + 0.9)
                                                              * 0.5;
  id v37 = (void *)a1;
  char v33 = v7;
  if (*(void *)(a1 + 80)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v9 = *(void *)(*(void *)(a1 + 96) + 8),
        Current - *(double *)(v9 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v9 + 24) = Current,
        LOBYTE(v45) = 0,
        (*(void (**)(double))(*(void *)(a1 + 80) + 16))(*(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                                + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v34 = [v7 displayNode];
    BOOL v36 = [*(id *)(a1 + 32) meaningNodeZeroKeywordForDisplayMeaningNode:v34 collectionUUIDsToAvoid:*(void *)(a1 + 40) curationContext:*(void *)(a1 + 48)];
    uint64_t v35 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F8B450]];
    if ([v35 count])
    {
      char v10 = [v35 firstObject];
      id v11 = (void *)MEMORY[0x1E4F38EB8];
      v55[0] = v10;
      char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
      id v13 = [v11 fetchAssetsWithLocalIdentifiers:v12 options:*(void *)(a1 + 56)];

      if ([v13 count])
      {
        id v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAssets:v13 withType:3 options:*(void *)(a1 + 56)];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v50 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = (void *)v37[5];
              uint64_t v19 = [*(id *)(*((void *)&v49 + 1) + 8 * i) uuid];
              [v18 addObject:v19];
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
          }
          while (v15);
        }
      }
    }
    if (v36)
    {
      __int16 v20 = (void *)v37[8];
      char v21 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F8B4A8]];
      LOBYTE(v20) = [v20 containsObject:v21];

      if ((v20 & 1) == 0)
      {
        uint64_t v45 = 0;
        double v46 = &v45;
        uint64_t v47 = 0x2020000000;
        uint64_t v48 = 0;
        uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v23 = [v33 mappedMeaningNodes];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v23);
              }
              unint64_t v27 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              v38[0] = MEMORY[0x1E4F143A8];
              v38[1] = 3221225472;
              v38[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_2;
              v38[3] = &unk_1E68EE508;
              id v39 = v22;
              id v40 = &v45;
              [v27 enumerateMeaningfulEventsUsingBlock:v38];
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v53 count:16];
          }
          while (v24);
        }

        unint64_t v28 = [v22 count];
        double v29 = (void *)v37[9];
        id v30 = [[PGRankedZeroKeyword alloc] initWithKeyword:v36 score:(double)v28 + (double)(unint64_t)v46[3] * 2.22044605e-16];
        [v29 addObject:v30];

        _Block_object_dispose(&v45, 8);
      }
    }
  }
}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v5];
    int v3 = [v5 eventCollection];
    double v4 = [v3 eventMomentNodes];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v4 numberOfAssets];
  }
}

- (id)placeZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  if (v10 && CFAbsoluteTimeGetCurrent() >= 0.01 && (char v25 = 0, v10[2](v10, &v25, 0.0), v25))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      int v28 = 516;
      __int16 v29 = 2080;
      id v30 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PGZ"
            "eroKeywordComputer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    char v12 = [[PGPlaceZeroKeywordGenerator alloc] initWithGraph:v8 photoLibrary:self->_photoLibrary searchComputationCache:self->_searchComputationCache options:v9];
    id v13 = [(PGPlaceZeroKeywordGenerator *)v12 generatePlaceZeroKeywords];
    id v11 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "getZeroKeywordDict", (void)v21);
          [v11 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }
  }
  return v11;
}

- (id)socialGroupKeyAssetLocalIdentifierWithPersonLocalIdentifiers:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"type" ascending:1];
  v28[0] = v6;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:0];
  v28[1] = v7;
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v28[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  [v5 setSortDescriptors:v9];

  char v10 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v4 options:v5];
  id v11 = (void *)MEMORY[0x1E4F1CA48];
  char v12 = [v10 fetchedObjects];
  id v13 = [v11 arrayWithArray:v12];

  id v14 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"uuid", 1, v15);
  v27[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  [v14 setSortDescriptors:v17];

  [v14 setFetchLimit:100];
  uint64_t v18 = 0;
  do
  {
    uint64_t v19 = v18;
    uint64_t v18 = [MEMORY[0x1E4F38EB8] fetchAssetsContainingAllPersons:v13 options:v14];

    if ([v18 count]) {
      break;
    }
    __int16 v20 = [v13 firstObject];
    [v13 removeObject:v20];
  }
  while ([v13 count]);
  long long v21 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v18 title:&stru_1F283BC78 subtitle:&stru_1F283BC78 titleFontName:&stru_1F283BC78];
  long long v22 = objc_alloc_init(PGKeyAssetCurationOptions);
  long long v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  [(PGKeyAssetCurationOptions *)v22 setReferencePersonLocalIdentifiers:v23];

  [(PGKeyAssetCurationOptions *)v22 setFocusOnPeople:1];
  [(PGKeyAssetCurationOptions *)v22 setComplete:1];
  long long v24 = [(PGCurationManager *)self->_curationManager curatedKeyAssetForAssetCollection:v21 curatedAssetCollection:0 options:v22 criteria:0 curationContext:self->_curationContext];
  char v25 = [v24 localIdentifier];

  return v25;
}

- (id)socialGroupKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  id v88 = a4;
  id v86 = a5;
  id v9 = a6;
  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x2020000000;
  char v133 = 0;
  uint64_t v126 = 0;
  v127 = (double *)&v126;
  uint64_t v128 = 0x2020000000;
  uint64_t v129 = 0;
  long long v97 = _Block_copy(v9);
  long long v83 = v9;
  if (!v97
    || (double v10 = CFAbsoluteTimeGetCurrent(), v10 - v127[3] < 0.01)
    || (v127[3] = v10,
        char v125 = 0,
        (*((void (**)(void *, char *, double))v97 + 2))(v97, &v125, 0.0),
        char v11 = *((unsigned char *)v131 + 24) | v125,
        (*((unsigned char *)v131 + 24) = v11) == 0))
  {
    char v98 = [MEMORY[0x1E4F1CA48] array];
    long long v96 = [MEMORY[0x1E4F1CA80] set];
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __92__PGZeroKeywordComputer_socialGroupKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
    v120[3] = &unk_1E68F03F8;
    id v85 = v97;
    id v121 = v85;
    uint64_t v122 = &v126;
    uint64_t v124 = 0x3F847AE147AE147BLL;
    uint64_t v123 = &v130;
    long long v82 = [(PGZeroKeywordComputer *)self contextualSocialGroupZeroKeywordsWithGraph:v87 options:v86 progressBlock:v120];
    if (*((unsigned char *)v131 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v141 = 334;
        __int16 v142 = 2080;
        v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        id v13 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v14 = v82;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v116 objects:v139 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v117;
        uint64_t v17 = *MEMORY[0x1E4F8B450];
LABEL_14:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v117 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v116 + 1) + 8 * v18);
          [v98 addObject:v19];
          __int16 v20 = [v19 objectForKeyedSubscript:v17];
          [v96 addObject:v20];

          if ((unint64_t)[v98 count] > 2) {
            break;
          }
          if (v15 == ++v18)
          {
            uint64_t v15 = [v14 countByEnumeratingWithState:&v116 objects:v139 count:16];
            if (v15) {
              goto LABEL_14;
            }
            break;
          }
        }
      }

      if (!v97
        || (double v21 = CFAbsoluteTimeGetCurrent(), v21 - v127[3] < 0.01)
        || (v127[3] = v21,
            char v125 = 0,
            (*((void (**)(id, char *, double))v85 + 2))(v85, &v125, 0.3),
            char v22 = *((unsigned char *)v131 + 24) | v125,
            (*((unsigned char *)v131 + 24) = v22) == 0))
      {
        id v79 = [v87 socialGroupNodesSortedByImportance];
        long long v23 = [v79 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_63569];
        __int16 v78 = v23;
        if (v97
          && (double v24 = CFAbsoluteTimeGetCurrent(), v24 - v127[3] >= 0.01)
          && (v127[3] = v24,
              char v125 = 0,
              (*((void (**)(id, char *, double))v85 + 2))(v85, &v125, 0.5),
              char v25 = *((unsigned char *)v131 + 24) | v125,
              (*((unsigned char *)v131 + 24) = v25) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v141 = 366;
            __int16 v142 = 2080;
            v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v12 = (id)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          long long v99 = objc_opt_new();
          id v89 = (void *)[v23 mutableCopy];
          uint64_t v26 = [v23 count];
          unint64_t v27 = v23;
          unint64_t v28 = v26;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          obuint64_t j = v27;
          uint64_t v29 = [obj countByEnumeratingWithState:&v112 objects:v138 count:16];
          if (v29)
          {
            unint64_t v30 = 0;
            double v31 = 0.3 / (double)v28;
            uint64_t v92 = *(void *)v113;
            double v32 = 0.5;
            while (2)
            {
              id v90 = (id)v29;
              for (uint64_t i = 0; i != v90; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v113 != v92) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v34 = *(void **)(*((void *)&v112 + 1) + 8 * i);
                context = (void *)MEMORY[0x1D25FED50]();
                if (v97
                  && (double Current = CFAbsoluteTimeGetCurrent(), Current - v127[3] >= 0.01)
                  && (v127[3] = Current,
                      char v125 = 0,
                      (*((void (**)(id, char *, double))v85 + 2))(v85, &v125, v32),
                      char v36 = *((unsigned char *)v131 + 24) | v125,
                      (*((unsigned char *)v131 + 24) = v36) != 0))
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)uint64_t buf = 67109378;
                    int v141 = 377;
                    __int16 v142 = 2080;
                    v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Search/PGZeroKeywordComputer.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  int v37 = 0;
                }
                else
                {
                  uint64_t v38 = [v34 personNodes];
                  uint64_t v39 = [v38 count];
                  if (v39 == 1) {
                    ++v30;
                  }
                  [v89 removeObject:v34];
                  long long v110 = 0u;
                  long long v111 = 0u;
                  long long v108 = 0u;
                  long long v109 = 0u;
                  id v40 = v89;
                  uint64_t v41 = [v40 countByEnumeratingWithState:&v108 objects:v137 count:16];
                  if (v41)
                  {
                    uint64_t v42 = *(void *)v109;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v41; ++j)
                      {
                        if (*(void *)v109 != v42) {
                          objc_enumerationMutation(v40);
                        }
                        long long v44 = *(void **)(*((void *)&v108 + 1) + 8 * j);
                        uint64_t v45 = [v44 personNodes];
                        uint64_t v46 = [v45 count];
                        if ((unint64_t)(v39 - v46) >= 2)
                        {

                          goto LABEL_61;
                        }
                        if (v39 == 1 && v46 == 1 && v30 >= 5) {
                          [v99 addObject:v44];
                        }
                      }
                      uint64_t v41 = [v40 countByEnumeratingWithState:&v108 objects:v137 count:16];
                      if (v41) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_61:

                  double v32 = v31 + v32;
                  int v37 = 1;
                }
                if (!v37)
                {

                  goto LABEL_71;
                }
              }
              uint64_t v29 = [obj countByEnumeratingWithState:&v112 objects:v138 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }

          if (v97
            && (double v48 = CFAbsoluteTimeGetCurrent(), v48 - v127[3] >= 0.01)
            && (v127[3] = v48,
                char v125 = 0,
                (*((void (**)(id, char *, double))v85 + 2))(v85, &v125, 0.8),
                char v49 = *((unsigned char *)v131 + 24) | v125,
                (*((unsigned char *)v131 + 24) = v49) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 67109378;
              int v141 = 408;
              __int16 v142 = 2080;
              v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/S"
                     "earch/PGZeroKeywordComputer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_71:
            id v12 = (id)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            id v80 = [v87 fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:v79];
            long long v50 = objc_msgSend(v87, "memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:");
            uint64_t v93 = +[PGPeopleUtilities validateKeyedSocialGroups:v50 withPhotoLibrary:self->_photoLibrary graph:v87];

            unint64_t v51 = [v79 count];
            long long v106 = 0u;
            long long v107 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            id v91 = v79;
            uint64_t v52 = [v91 countByEnumeratingWithState:&v104 objects:v136 count:16];
            if (v52)
            {
              double v53 = 0.2 / (double)v51;
              contexta = *(void **)v105;
              double v54 = 0.8;
              while (2)
              {
                for (uint64_t k = 0; k != v52; ++k)
                {
                  if (*(void **)v105 != contexta) {
                    objc_enumerationMutation(v91);
                  }
                  char v56 = *(void **)(*((void *)&v104 + 1) + 8 * k);
                  if (v97)
                  {
                    double v57 = CFAbsoluteTimeGetCurrent();
                    if (v57 - v127[3] >= 0.01)
                    {
                      v127[3] = v57;
                      char v125 = 0;
                      (*((void (**)(id, char *, double))v85 + 2))(v85, &v125, v54);
                      char v58 = *((unsigned char *)v131 + 24) | v125;
                      *((unsigned char *)v131 + 24) = v58;
                      if (v58)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)uint64_t buf = 67109378;
                          int v141 = 418;
                          __int16 v142 = 2080;
                          v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Search/PGZeroKeywordComputer.m";
                          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

                        goto LABEL_116;
                      }
                    }
                  }
                  if ((unint64_t)[v98 count] > 0xE) {
                    goto LABEL_105;
                  }
                  if (([v99 containsObject:v56] & 1) == 0)
                  {
                    long long v59 = [v56 UUID];
                    long long v60 = [v93 objectForKey:v59];

                    if (v60)
                    {
                      id v61 = [v56 UUID];
                      double v62 = [v93 objectForKeyedSubscript:v61];

                      if ((unint64_t)[v62 count] >= 2
                        && ([v96 containsObject:v62] & 1) == 0)
                      {
                        long long v102 = 0u;
                        long long v103 = 0u;
                        long long v100 = 0u;
                        long long v101 = 0u;
                        id v63 = v62;
                        uint64_t v64 = [v63 countByEnumeratingWithState:&v100 objects:v135 count:16];
                        if (v64)
                        {
                          uint64_t v65 = *(void *)v101;
                          while (2)
                          {
                            for (uint64_t m = 0; m != v64; ++m)
                            {
                              if (*(void *)v101 != v65) {
                                objc_enumerationMutation(v63);
                              }
                              long long v67 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:*(void *)(*((void *)&v100 + 1) + 8 * m)];
                              uint64_t v68 = [v88 userFeedbackCalculator];
                              uint64_t v69 = [v68 userFeedbackTypeForPersonUUID:v67];

                              if (v69 == 2)
                              {
                                if ((unint64_t)[v63 count] < 3)
                                {
LABEL_98:
                                  uint64_t v71 = v63;
                                  goto LABEL_101;
                                }
                              }
                              else if (v69 == 3)
                              {
                                goto LABEL_98;
                              }
                            }
                            uint64_t v64 = [v63 countByEnumeratingWithState:&v100 objects:v135 count:16];
                            if (v64) {
                              continue;
                            }
                            break;
                          }
                        }

                        [v96 addObject:v63];
                        uint64_t v70 = personUUIDsFromPersonLocalIdentifiers(v63);
                        uint64_t v71 = PLSearchSocialGroupLookupIdentifier();

                        uint64_t v72 = [(PGZeroKeywordComputer *)self socialGroupKeyAssetLocalIdentifierWithPersonLocalIdentifiers:v63];
                        id v73 = (void *)v72;
                        if (v72)
                        {
                          uint64_t v134 = v72;
                          long long v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
                        }
                        else
                        {
                          long long v67 = (void *)MEMORY[0x1E4F1CBF0];
                        }
                        id v74 = zeroKeywordForSocialGroupWithIdentifier(v71, v63, v67);
                        [v98 addObject:v74];

LABEL_101:
                      }
                    }
                  }
                  double v54 = v53 + v54;
                }
                uint64_t v52 = [v91 countByEnumeratingWithState:&v104 objects:v136 count:16];
                if (v52) {
                  continue;
                }
                break;
              }
            }
LABEL_105:

            if ((unint64_t)[v98 count] >= 0x10) {
              objc_msgSend(v98, "removeObjectsInRange:", 15, objc_msgSend(v98, "count") - 15);
            }
            if (v97
              && (double v75 = CFAbsoluteTimeGetCurrent(), v75 - v127[3] >= 0.01)
              && (v127[3] = v75,
                  char v125 = 0,
                  (*((void (**)(id, char *, double))v85 + 2))(v85, &v125, 1.0),
                  char v76 = *((unsigned char *)v131 + 24) | v125,
                  (*((unsigned char *)v131 + 24) = v76) != 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)uint64_t buf = 67109378;
                int v141 = 470;
                __int16 v142 = 2080;
                v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework"
                       "/Search/PGZeroKeywordComputer.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
LABEL_116:
              id v12 = (id)MEMORY[0x1E4F1CBF0];
            }
            else
            {
              id v12 = v98;
            }
          }
        }

        goto LABEL_120;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v141 = 345;
        __int16 v142 = 2080;
        v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        id v13 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
    id v12 = (id)MEMORY[0x1E4F1CBF0];
LABEL_120:

    goto LABEL_121;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    int v141 = 324;
    __int16 v142 = 2080;
    v143 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PGZe"
           "roKeywordComputer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v12 = (id)MEMORY[0x1E4F1CBF0];
LABEL_121:
  _Block_object_dispose(&v126, 8);
  _Block_object_dispose(&v130, 8);

  return v12;
}

void __92__PGZeroKeywordComputer_socialGroupKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __92__PGZeroKeywordComputer_socialGroupKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 personNodes];
  unint64_t v6 = [v5 count];

  uint64_t v7 = [v4 personNodes];

  unint64_t v8 = [v7 count];
  if (v6 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 < v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (id)peopleZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v102 = a3;
  id v108 = a4;
  id v9 = a5;
  id v98 = a6;
  uint64_t v143 = 0;
  uint64_t v144 = &v143;
  uint64_t v145 = 0x2020000000;
  char v146 = 0;
  uint64_t v139 = 0;
  v140 = (double *)&v139;
  uint64_t v141 = 0x2020000000;
  uint64_t v142 = 0;
  long long v109 = (void (**)(void *, unsigned char *, double))_Block_copy(v98);
  long long v97 = v9;
  if (v109)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v140[3] >= 0.01)
    {
      v140[3] = Current;
      char v138 = 0;
      v109[2](v109, &v138, 0.0);
      char v11 = *((unsigned char *)v144 + 24) | v138;
      *((unsigned char *)v144 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          int v154 = 158;
          __int16 v155 = 2080;
          v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Searc"
                 "h/PGZeroKeywordComputer.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v12 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_108;
      }
    }
  }
  long long v110 = [MEMORY[0x1E4F1CA48] array];
  id v13 = [MEMORY[0x1E4F1CA80] set];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
  v133[3] = &unk_1E68F03F8;
  long long v107 = v109;
  id v134 = v107;
  v135 = &v139;
  uint64_t v137 = 0x3F847AE147AE147BLL;
  uint64_t v136 = &v143;
  long long v96 = [(PGZeroKeywordComputer *)self contextualPersonZeroKeywordsWithGraph:v102 options:v9 progressBlock:v133];
  if (*((unsigned char *)v144 + 24))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
LABEL_11:
      id v12 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_107;
    }
    *(_DWORD *)uint64_t buf = 67109378;
    int v154 = 168;
    __int16 v155 = 2080;
    v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PGZe"
           "roKeywordComputer.m";
    id v14 = MEMORY[0x1E4F14500];
LABEL_10:
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_11;
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v15 = v96;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v129 objects:v152 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v130;
    uint64_t v18 = *MEMORY[0x1E4F8B450];
LABEL_14:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v130 != v17) {
        objc_enumerationMutation(v15);
      }
      __int16 v20 = *(void **)(*((void *)&v129 + 1) + 8 * v19);
      [v110 addObject:v20];
      double v21 = [v20 objectForKeyedSubscript:v18];
      [v13 addObject:v21];

      if ((unint64_t)[v110 count] > 2) {
        break;
      }
      if (v16 == ++v19)
      {
        uint64_t v16 = [v15 countByEnumeratingWithState:&v129 objects:v152 count:16];
        if (v16) {
          goto LABEL_14;
        }
        break;
      }
    }
  }

  if (v109)
  {
    double v22 = CFAbsoluteTimeGetCurrent();
    if (v22 - v140[3] >= 0.01)
    {
      v140[3] = v22;
      char v138 = 0;
      v107[2](v107, &v138, 0.4);
      char v23 = *((unsigned char *)v144 + 24) | v138;
      *((unsigned char *)v144 + 24) = v23;
      if (v23)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_11;
        }
        *(_DWORD *)uint64_t buf = 67109378;
        int v154 = 179;
        __int16 v155 = 2080;
        v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        id v14 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
  }
  long long v95 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v95 setPersonContext:1];
  [v95 setIncludedDetectionTypes:&unk_1F28D4908];
  double v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"type" ascending:0];
  v151[0] = v24;
  char v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:1];
  v151[1] = v25;
  uint64_t v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"detectionType" ascending:1];
  v151[2] = v26;
  unint64_t v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v151[3] = v27;
  unint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:4];
  [v95 setSortDescriptors:v28];

  uint64_t v29 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v95];
  unint64_t v30 = [v29 count];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  obuint64_t j = v29;
  uint64_t v31 = [obj countByEnumeratingWithState:&v125 objects:v150 count:16];
  if (!v31) {
    goto LABEL_45;
  }
  double v32 = 0.3 / (double)v30;
  uint64_t v33 = *(void *)v126;
  double v34 = 0.4;
  while (2)
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (*(void *)v126 != v33) {
        objc_enumerationMutation(obj);
      }
      char v36 = *(void **)(*((void *)&v125 + 1) + 8 * i);
      if (v109)
      {
        double v37 = CFAbsoluteTimeGetCurrent();
        if (v37 - v140[3] >= 0.01)
        {
          v140[3] = v37;
          char v138 = 0;
          v107[2](v107, &v138, v34);
          char v38 = *((unsigned char *)v144 + 24) | v138;
          *((unsigned char *)v144 + 24) = v38;
          if (v38)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 67109378;
              int v154 = 196;
              __int16 v155 = 2080;
              v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/S"
                     "earch/PGZeroKeywordComputer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_105;
          }
        }
      }
      if ((unint64_t)[v110 count] > 0xE) {
        goto LABEL_45;
      }
      uint64_t v39 = [v36 localIdentifier];
      if (([v13 containsObject:v39] & 1) == 0)
      {
        [v13 addObject:v39];
        id v40 = [v108 userFeedbackCalculator];
        uint64_t v41 = [v36 uuid];
        uint64_t v42 = [v40 userFeedbackTypeForPersonUUID:v41];

        if ((v42 & 0xFFFFFFFFFFFFFFFELL) != 2)
        {
          int v43 = [v36 detectionType];
          if ((v43 - 3) >= 2)
          {
            if (v43 != 1) {
              goto LABEL_43;
            }
            uint64_t v44 = 1;
          }
          else
          {
            uint64_t v44 = 6;
          }
          uint64_t v45 = [v36 name];
          uint64_t v46 = [v36 uuid];
          uint64_t v47 = zeroKeywordWithAttributes(0, v44, v45, 0, v46, v39);

          if (v47) {
            [v110 addObject:v47];
          }
        }
      }
LABEL_43:

      double v34 = v32 + v34;
    }
    uint64_t v31 = [obj countByEnumeratingWithState:&v125 objects:v150 count:16];
    if (v31) {
      continue;
    }
    break;
  }
LABEL_45:

  if ((unint64_t)[v110 count] >= 0x10) {
    objc_msgSend(v110, "removeObjectsInRange:", 15, objc_msgSend(v110, "count") - 15);
  }
  if (v109
    && (double v48 = CFAbsoluteTimeGetCurrent(), v48 - v140[3] >= 0.01)
    && (v140[3] = v48,
        char v138 = 0,
        v107[2](v107, &v138, 0.7),
        char v49 = *((unsigned char *)v144 + 24) | v138,
        (*((unsigned char *)v144 + 24) = v49) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      int v154 = 247;
      __int16 v155 = 2080;
      v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PG"
             "ZeroKeywordComputer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_105:
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    long long v50 = [v102 bestSocialGroupNodes];
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_305;
    v123[3] = &unk_1E68EE4C0;
    id v51 = v102;
    id v124 = v51;
    uint64_t v52 = [v50 indexesOfObjectsPassingTest:v123];
    double v53 = [v50 objectsAtIndexes:v52];
    long long v94 = v50;

    uint64_t v93 = [v51 fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:v53];
    double v54 = objc_msgSend(v51, "memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:");
    long long v106 = +[PGPeopleUtilities validateKeyedSocialGroups:v54 withPhotoLibrary:self->_photoLibrary graph:v51];

    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    char v56 = [v106 objectEnumerator];
    uint64_t v57 = [v56 countByEnumeratingWithState:&v119 objects:v149 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v120;
      do
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v120 != v58) {
            objc_enumerationMutation(v56);
          }
          [v55 addObjectsFromArray:*(void *)(*((void *)&v119 + 1) + 8 * j)];
        }
        uint64_t v57 = [v56 countByEnumeratingWithState:&v119 objects:v149 count:16];
      }
      while (v57);
    }

    uint64_t v92 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v55 inGraph:v51];
    long long v103 = [v92 personNodeByLocalIdentifier];
    unint64_t v60 = [v94 count];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v100 = v53;
    uint64_t v61 = [v100 countByEnumeratingWithState:&v115 objects:v148 count:16];
    if (v61)
    {
      double v62 = 0.3 / (double)v60;
      uint64_t v63 = *(void *)v116;
      double v64 = 0.7;
      while (2)
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v116 != v63) {
            objc_enumerationMutation(v100);
          }
          id v66 = *(void **)(*((void *)&v115 + 1) + 8 * k);
          long long v67 = [v66 UUID];
          uint64_t v68 = [v106 objectForKey:v67];

          double v64 = v62 + v64;
          if (v68)
          {
            uint64_t v69 = [v66 UUID];
            uint64_t v70 = [v106 objectForKeyedSubscript:v69];

            long long v99 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v70, "count"));
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            id v104 = v70;
            uint64_t v71 = [v104 countByEnumeratingWithState:&v111 objects:v147 count:16];
            if (v71)
            {
              uint64_t v72 = *(void *)v112;
              while (2)
              {
                for (uint64_t m = 0; m != v71; ++m)
                {
                  if (*(void *)v112 != v72) {
                    objc_enumerationMutation(v104);
                  }
                  id v74 = *(void **)(*((void *)&v111 + 1) + 8 * m);
                  if (v109)
                  {
                    double v75 = CFAbsoluteTimeGetCurrent();
                    if (v75 - v140[3] >= 0.01)
                    {
                      v140[3] = v75;
                      char v138 = 0;
                      v107[2](v107, &v138, v64);
                      char v76 = *((unsigned char *)v144 + 24) | v138;
                      *((unsigned char *)v144 + 24) = v76;
                      if (v76)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)uint64_t buf = 67109378;
                          int v154 = 280;
                          __int16 v155 = 2080;
                          v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Search/PGZeroKeywordComputer.m";
                          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

                        goto LABEL_100;
                      }
                    }
                  }
                  if (([v13 containsObject:v74] & 1) == 0)
                  {
                    id v77 = [v103 objectForKeyedSubscript:v74];
                    __int16 v78 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v74];
                    id v79 = [v108 userFeedbackCalculator];
                    uint64_t v80 = [v79 userFeedbackTypeForPersonUUID:v78];

                    if ((unint64_t)(v80 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
                    {
                      uint64_t v81 = [v77 name];
                      long long v82 = zeroKeywordWithAttributes(0, 1, v81, 0, v78, v74);

                      [v99 addObject:v82];
                    }
                  }
                }
                uint64_t v71 = [v104 countByEnumeratingWithState:&v111 objects:v147 count:16];
                if (v71) {
                  continue;
                }
                break;
              }
            }

            if ([v99 count] && objc_msgSend(v110, "count"))
            {
              uint64_t v83 = [v110 count];
              uint64_t v84 = [v99 count];
              uint64_t v85 = v84 + [v110 count] - 15;
              if (v85 >= 1)
              {
                uint64_t v86 = v83 - 1;
                do
                {
                  id v87 = [v110 objectAtIndexedSubscript:v86];
                  char v88 = [v99 containsObject:v87];

                  if ((v88 & 1) == 0)
                  {
                    [v110 removeObjectAtIndex:v86];
                    --v85;
                  }
                  --v86;
                }
                while (v85 > 0);
              }
              [v110 addObjectsFromArray:v99];
            }

            goto LABEL_91;
          }
        }
        uint64_t v61 = [v100 countByEnumeratingWithState:&v115 objects:v148 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }
LABEL_91:

    if (v109
      && (double v89 = CFAbsoluteTimeGetCurrent(), v89 - v140[3] >= 0.01)
      && (v140[3] = v89,
          char v138 = 0,
          v107[2](v107, &v138, 1.0),
          char v90 = *((unsigned char *)v144 + 24) | v138,
          (*((unsigned char *)v144 + 24) = v90) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v154 = 316;
        __int16 v155 = 2080;
        v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_100:
      id v12 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v12 = v110;
    }
  }
LABEL_107:

LABEL_108:
  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v143, 8);

  return v12;
}

void __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.4);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_305(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isPairSocialGroup:a2];
}

- (id)_zeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _Block_copy(v13);
  uint64_t v100 = 0;
  long long v101 = &v100;
  uint64_t v102 = 0x2020000000;
  char v103 = 0;
  uint64_t v96 = 0;
  long long v97 = (double *)&v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = 0;
  if (!v14
    || (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v97[3] < 0.01)
    || (v97[3] = v15,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v14 + 2))(v14, &info, 0.0),
        char v16 = *((unsigned char *)v101 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v101 + 24) = v16) == 0))
  {
    uint64_t v68 = [v10 meNodeCollection];
    if ([v10 isSharedLibraryEnabled])
    {
      uint64_t v18 = [v68 count];
      self->_shouldFilterMomentNodesWithPresence = v18 != 0;
      if (v18)
      {
        uint64_t v19 = [v68 momentNodesWithPresence];
        momentNodesWhereMeIsPresent = self->_momentNodesWhereMeIsPresent;
        self->_momentNodesWhereMeIsPresent = v19;
      }
    }
    else
    {
      self->_shouldFilterMomentNodesWithPresence = 0;
    }
    double v21 = [MEMORY[0x1E4F1CA60] dictionary];
    double v22 = (void *)MEMORY[0x1D25FED50]();
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
    v91[3] = &unk_1E68F03F8;
    id v23 = v14;
    id v92 = v23;
    uint64_t v93 = &v96;
    long long v94 = &v100;
    uint64_t v95 = 0x3F847AE147AE147BLL;
    double v24 = [(PGZeroKeywordComputer *)self peopleZeroKeywordsWithGraph:v10 curationContext:v11 options:v12 progressBlock:v91];
    [v21 setObject:v24 forKeyedSubscript:&unk_1F28D2B08];

    int v25 = *((unsigned __int8 *)v101 + 24);
    if (*((unsigned char *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)long long v105 = 103;
      *(_WORD *)&v105[4] = 2080;
      *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Search/PGZeroKeywordComputer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }

    if (v25) {
      goto LABEL_30;
    }
    if (v14)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v97[3] >= 0.01)
      {
        v97[3] = Current;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v23 + 2))(v23, &info, 0.2);
        char v27 = *((unsigned char *)v101 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v101 + 24) = v27;
        if (v27)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)long long v105 = 106;
            *(_WORD *)&v105[4] = 2080;
            *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Search/PGZeroKeywordComputer.m";
            unint64_t v28 = MEMORY[0x1E4F14500];
LABEL_29:
            _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_30;
          }
          goto LABEL_30;
        }
      }
    }
    uint64_t v29 = (void *)MEMORY[0x1D25FED50]();
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_273;
    v86[3] = &unk_1E68F03F8;
    id v30 = v23;
    id v87 = v30;
    char v88 = &v96;
    double v89 = &v100;
    uint64_t v90 = 0x3F847AE147AE147BLL;
    uint64_t v31 = [(PGZeroKeywordComputer *)self socialGroupKeywordsWithGraph:v10 curationContext:v11 options:v12 progressBlock:v86];
    [v21 setObject:v31 forKeyedSubscript:&unk_1F28D2B20];

    int v32 = *((unsigned __int8 *)v101 + 24);
    if (*((unsigned char *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)long long v105 = 113;
      *(_WORD *)&v105[4] = 2080;
      *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Search/PGZeroKeywordComputer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }

    if (v32) {
      goto LABEL_30;
    }
    if (v14)
    {
      double v33 = CFAbsoluteTimeGetCurrent();
      if (v33 - v97[3] >= 0.01)
      {
        v97[3] = v33;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v30 + 2))(v30, &info, 0.4);
        char v34 = *((unsigned char *)v101 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v101 + 24) = v34;
        if (v34)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)long long v105 = 116;
            *(_WORD *)&v105[4] = 2080;
            *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Search/PGZeroKeywordComputer.m";
            unint64_t v28 = MEMORY[0x1E4F14500];
            goto LABEL_29;
          }
LABEL_30:
          id v17 = (id)MEMORY[0x1E4F1CC08];
LABEL_31:

          goto LABEL_32;
        }
      }
    }
    char v36 = [(id)objc_opt_class() zeroKeywordLog];
    os_signpost_id_t v37 = os_signpost_id_generate(v36);
    char v38 = v36;
    uint64_t v39 = v38;
    os_signpost_id_t spid = v37;
    unint64_t v40 = v37 - 1;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ZeroKeywordComputerPlaceZKW", "", buf, 2u);
    }
    long long v67 = v39;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v64 = mach_absolute_time();
    uint64_t v41 = (void *)MEMORY[0x1D25FED50]();
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_276;
    v80[3] = &unk_1E68F03F8;
    id v66 = v30;
    id v81 = v66;
    long long v82 = &v96;
    uint64_t v83 = &v100;
    uint64_t v84 = 0x3F847AE147AE147BLL;
    uint64_t v42 = [(PGZeroKeywordComputer *)self placeZeroKeywordsWithGraph:v10 options:v12 progressBlock:v80];
    [v21 setObject:v42 forKeyedSubscript:&unk_1F28D2B38];

    int v43 = *((unsigned __int8 *)v101 + 24);
    if (*((unsigned char *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)long long v105 = 125;
      *(_WORD *)&v105[4] = 2080;
      *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Search/PGZeroKeywordComputer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }

    if (v43) {
      goto LABEL_71;
    }
    uint64_t v44 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    uint64_t v47 = v67;
    double v48 = v47;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v48, OS_SIGNPOST_INTERVAL_END, spid, "ZeroKeywordComputerPlaceZKW", "", buf, 2u);
    }

    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 136315394;
      *(void *)long long v105 = "ZeroKeywordComputerPlaceZKW";
      *(_WORD *)&v105[8] = 2048;
      *(double *)&v105[10] = (float)((float)((float)((float)(v44 - v64) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v14
      && (double v49 = CFAbsoluteTimeGetCurrent(), v49 - v97[3] >= 0.01)
      && (v97[3] = v49,
          char v79 = 0,
          (*((void (**)(id, char *, double))v66 + 2))(v66, &v79, 0.6),
          char v50 = *((unsigned char *)v101 + 24) | v79,
          (*((unsigned char *)v101 + 24) = v50) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)long long v105 = 130;
        *(_WORD *)&v105[4] = 2080;
        *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Search/PGZeroKeywordComputer.m";
        id v51 = MEMORY[0x1E4F14500];
LABEL_70:
        _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v52 = (void *)MEMORY[0x1D25FED50]();
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_280;
      v74[3] = &unk_1E68F03F8;
      id v53 = v66;
      id v75 = v53;
      char v76 = &v96;
      id v77 = &v100;
      uint64_t v78 = 0x3F847AE147AE147BLL;
      double v54 = [(PGZeroKeywordComputer *)self eventZeroKeywordsWithGraph:v10 curationContext:v11 options:v12 progressBlock:v74];
      [v21 setObject:v54 forKeyedSubscript:&unk_1F28D2B50];

      int v55 = *((unsigned __int8 *)v101 + 24);
      if (*((unsigned char *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)long long v105 = 137;
        *(_WORD *)&v105[4] = 2080;
        *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Search/PGZeroKeywordComputer.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      if (v55) {
        goto LABEL_71;
      }
      if (v14
        && (double v56 = CFAbsoluteTimeGetCurrent(), v56 - v97[3] >= 0.01)
        && (v97[3] = v56,
            char v79 = 0,
            (*((void (**)(id, char *, double))v53 + 2))(v53, &v79, 0.8),
            char v57 = *((unsigned char *)v101 + 24) | v79,
            (*((unsigned char *)v101 + 24) = v57) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)long long v105 = 140;
          *(_WORD *)&v105[4] = 2080;
          *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Search/PGZeroKeywordComputer.m";
          id v51 = MEMORY[0x1E4F14500];
          goto LABEL_70;
        }
      }
      else
      {
        uint64_t v58 = (void *)MEMORY[0x1D25FED50]();
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_283;
        v69[3] = &unk_1E68F03F8;
        id v59 = v53;
        id v70 = v59;
        uint64_t v71 = &v96;
        uint64_t v72 = &v100;
        uint64_t v73 = 0x3F847AE147AE147BLL;
        unint64_t v60 = [(PGZeroKeywordComputer *)self sceneZeroKeywordsWithGraph:v10 options:v12 progressBlock:v69];
        [v21 setObject:v60 forKeyedSubscript:&unk_1F28D2B68];

        int v61 = *((unsigned __int8 *)v101 + 24);
        if (*((unsigned char *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)long long v105 = 147;
          *(_WORD *)&v105[4] = 2080;
          *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Search/PGZeroKeywordComputer.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        if (!v61)
        {
          if (!v14
            || (double v62 = CFAbsoluteTimeGetCurrent(), v62 - v97[3] < 0.01)
            || (v97[3] = v62,
                char v79 = 0,
                (*((void (**)(id, char *, double))v59 + 2))(v59, &v79, 1.0),
                char v63 = *((unsigned char *)v101 + 24) | v79,
                (*((unsigned char *)v101 + 24) = v63) == 0))
          {
            id v17 = v21;
            goto LABEL_72;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)long long v105 = 150;
            *(_WORD *)&v105[4] = 2080;
            *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Search/PGZeroKeywordComputer.m";
            id v51 = MEMORY[0x1E4F14500];
            goto LABEL_70;
          }
        }
      }
    }
LABEL_71:
    id v17 = (id)MEMORY[0x1E4F1CC08];
LABEL_72:

    goto LABEL_31;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)long long v105 = 88;
    *(_WORD *)&v105[4] = 2080;
    *(void *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Search/PGZeroKeywordComputer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v17 = (id)MEMORY[0x1E4F1CC08];
LABEL_32:
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);

  return v17;
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_273(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_276(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.4);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_280(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.6);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_283(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.8);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)zeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() zeroKeywordLog];
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  char v16 = v14;
  id v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "ZeroKeywordComputer-ZeroKeywordComputing", "", buf, 2u);
  }

  uint64_t v18 = [(PGZeroKeywordComputer *)self _zeroKeywordsWithGraph:v13 curationContext:v12 options:v11 progressBlock:v10];

  uint64_t v19 = v17;
  __int16 v20 = v19;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)double v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v15, "ZeroKeywordComputer-ZeroKeywordComputing", "", v22, 2u);
  }

  return v18;
}

- (PGZeroKeywordComputer)initWithPhotoLibrary:(id)a3 curationManager:(id)a4 searchComputationCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PGZeroKeywordComputer;
  id v12 = [(PGZeroKeywordComputer *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_curationManager, a4);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v13->_photoLibrary];
    curationContext = v13->_curationContext;
    v13->_curationContext = (CLSCurationContext *)v14;

    objc_storeStrong((id *)&v13->_searchComputationCache, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
    sceneTaxonomy = v13->_sceneTaxonomy;
    v13->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v16;

    v13->_shouldFilterMomentNodesWithPresence = 0;
    momentNodesWhereMeIsPresent = v13->_momentNodesWhereMeIsPresent;
    v13->_momentNodesWhereMeIsPresent = 0;
  }
  return v13;
}

+ (id)zeroKeywordLog
{
  if (zeroKeywordLog_onceToken != -1) {
    dispatch_once(&zeroKeywordLog_onceToken, &__block_literal_global_342);
  }
  v2 = (void *)zeroKeywordLog_zeroKeywordLog;
  return v2;
}

void __39__PGZeroKeywordComputer_zeroKeywordLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PhotosGraph", "ZeroKeywordComputer");
  v1 = (void *)zeroKeywordLog_zeroKeywordLog;
  zeroKeywordLog_zeroKeywordLog = (uint64_t)v0;
}

@end