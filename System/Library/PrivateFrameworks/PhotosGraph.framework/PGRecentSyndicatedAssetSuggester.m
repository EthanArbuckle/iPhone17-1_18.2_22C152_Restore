@interface PGRecentSyndicatedAssetSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (id)createSuggestionWithAsset:(id)a3;
- (id)eligibleAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)reasonsForSuggestion:(id)a3;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
@end

@implementation PGRecentSyndicatedAssetSuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:306];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAssetEnumerator, 0);
  objc_storeStrong((id *)&self->_suggestedAssets, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)eligibleAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(void *, unsigned char *, double))_Block_copy(a6);
  double v14 = 0.0;
  if (!v13 || (double v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_8:
    v17 = [(PGAbstractSuggester *)self session];
    v18 = v17;
    if (!v17)
    {
      id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_53:

      goto LABEL_54;
    }
    v67 = v17;
    v19 = [v17 loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v73 = v10;
      *(_WORD *)&v73[8] = 2112;
      *(void *)&v73[10] = v11;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Computing eligible assets between %@ and %@", buf, 0x16u);
    }
    v66 = v19;
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"overallAestheticScore >= %f", 0x3FE0000000000000);
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore >= %f", *MEMORY[0x1E4F8E740]);
    uint64_t v22 = [(id)objc_opt_class() noVideoPredicate];
    uint64_t v58 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 0);
    v59 = (void *)v22;
    v60 = (void *)v21;
    v61 = (void *)v20;
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v20, v21, v22, v58, 0);
    if (v10)
    {
      v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@", v10];
      [v23 addObject:v24];
    }
    if (v11)
    {
      v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated <= %@", v11];
      [v23 addObject:v25];
    }
    id v64 = v11;
    id v65 = v10;
    v18 = v67;
    if (v12)
    {
      v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v12];
      [v23 addObject:v26];
    }
    id v63 = v12;
    uint64_t v27 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v23];
    v28 = [v67 photoLibrary];
    v29 = [v28 librarySpecificFetchOptions];

    [v29 setInternalPredicate:v27];
    v30 = +[PGCurationManager assetPropertySetsForCuration];
    [v29 setFetchPropertySets:v30];

    [v29 setIncludeGuestAssets:1];
    v68 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v29];
    v62 = (void *)v27;
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        char v70 = 0;
        v13[2](v13, &v70, 0.4);
        if (v70)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 205;
            *(_WORD *)&v73[4] = 2080;
            *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
          v32 = v66;
          v34 = v60;
          v33 = v61;
          v36 = (void *)v58;
          v35 = v59;
          goto LABEL_52;
        }
        double v14 = Current;
      }
    }
    v37 = v13;
    uint64_t v38 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
    v39 = (void *)MEMORY[0x1E4F38EB8];
    v40 = [v67 curationContext];
    v41 = [v39 clsAllAssetsFromFetchResult:v68 prefetchOptions:v38 curationContext:v40];

    v13 = v37;
    v57 = v41;
    if (v37)
    {
      double v42 = CFAbsoluteTimeGetCurrent();
      unint64_t v43 = 0x1E4F28000uLL;
      if (v42 - v14 >= 0.01)
      {
        char v70 = 0;
        v37[2](v37, &v70, 0.8);
        if (v70)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 210;
            *(_WORD *)&v73[4] = 2080;
            *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
          v32 = v66;
          v18 = v67;
          goto LABEL_51;
        }
        double v14 = v42;
      }
    }
    else
    {
      unint64_t v43 = 0x1E4F28000;
    }
    v44 = *(void **)(v43 + 3936);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __105__PGRecentSyndicatedAssetSuggester_eligibleAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v69[3] = &unk_1E68EC880;
    v69[4] = self;
    v45 = [v44 predicateWithBlock:v69];
    v46 = [v41 filteredArrayUsingPredicate:v45];

    v32 = v66;
    v47 = v66;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = [v46 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v73 = v48;
      _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: found %lu eligible assets", buf, 0xCu);
    }

    v18 = v67;
    if (v13)
    {
      double v49 = CFAbsoluteTimeGetCurrent();
      if (v49 - v14 >= 0.01)
      {
        char v70 = 0;
        v13[2](v13, &v70, 0.9);
        if (v70)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 230;
            *(_WORD *)&v73[4] = 2080;
            *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_50:

LABEL_51:
          v34 = v60;
          v33 = v61;
          v36 = (void *)v58;
          v35 = v59;

LABEL_52:
          id v11 = v64;
          id v10 = v65;
          id v12 = v63;
          goto LABEL_53;
        }
        double v14 = v49;
      }
    }
    v50 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
    v71[0] = v50;
    v51 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
    v71[1] = v51;
    v52 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v71[2] = v52;
    v53 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v71[3] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];

    v55 = [v46 sortedArrayUsingDescriptors:v54];

    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (char v70 = 0, v13[2](v13, &v70, 1.0), v70))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v73 = 241;
        *(_WORD *)&v73[4] = 2080;
        *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v16 = v55;
    }
    v32 = v66;

    v46 = v55;
    goto LABEL_50;
  }
  char v70 = 0;
  v13[2](v13, &v70, 0.0);
  if (!v70)
  {
    double v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v73 = 164;
    *(_WORD *)&v73[4] = 2080;
    *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_54:

  return v16;
}

uint64_t __105__PGRecentSyndicatedAssetSuggester_eligibleAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) processedAssetIsValidForSuggesting:v3 allowGuestAsset:1])
  {
    if ([v3 clsPeopleCount]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [*(id *)(a1 + 32) hasSuggestableScenesWithAsset:v3];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)reasonsForSuggestion:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 keyAssets];
  uint64_t v4 = [v3 firstObject];

  v5 = NSString;
  [v4 overallAestheticScore];
  v7 = objc_msgSend(v5, "stringWithFormat:", @"aesthetics = %.3f", v6);
  v8 = NSString;
  [v4 curationScore];
  id v10 = objc_msgSend(v8, "stringWithFormat:", @"curation = %.3f", v9);
  v13[0] = v7;
  v13[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

- (id)createSuggestionWithAsset:(id)a3
{
  id v4 = a3;
  v5 = [[PGSingleAssetSuggestion alloc] initWithType:3 subtype:306 asset:v4];

  if ([(PGSuggestionOptions *)self->_options computeReasons])
  {
    float v6 = [(PGRecentSyndicatedAssetSuggester *)self reasonsForSuggestion:v5];
    [(PGSingleAssetSuggestion *)v5 setReasons:v6];
  }
  return v5;
}

- (void)reset
{
  id v3 = [(PGAbstractSuggester *)self session];
  id v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v6 = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Resetting", v6, 2u);
  }

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGAbstractSuggester *)self session];
  float v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: nextSuggestion", (uint8_t *)&v18, 2u);
  }
  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  if (!suggestedAssetEnumerator)
  {
    suggestedAssets = self->_suggestedAssets;
    if (!suggestedAssets)
    {
      uint64_t v9 = [(PGSuggestionOptions *)self->_options universalStartDate];
      id v10 = [(PGSuggestionOptions *)self->_options universalEndDate];
      id v11 = [(PGRecentSyndicatedAssetSuggester *)self eligibleAssetsBetweenStartDate:v9 andEndDate:v10 matchingAssetUUID:0 progress:v4];
      id v12 = self->_suggestedAssets;
      self->_suggestedAssets = v11;

      suggestedAssets = self->_suggestedAssets;
    }
    v13 = [(NSArray *)suggestedAssets objectEnumerator];
    double v14 = self->_suggestedAssetEnumerator;
    self->_suggestedAssetEnumerator = v13;

    suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  }
  double v15 = [(NSEnumerator *)suggestedAssetEnumerator nextObject];
  if (v15)
  {
    id v16 = [(PGRecentSyndicatedAssetSuggester *)self createSuggestionWithAsset:v15];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138477827;
      v19 = v16;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Suggesting %{private}@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Nothing to suggest", (uint8_t *)&v18, 2u);
    }
    id v16 = 0;
  }

  return v16;
}

- (void)startSuggestingWithOptions:(id)a3
{
  id v4 = (PGSuggestionOptions *)a3;
  v5 = [(PGAbstractSuggester *)self session];
  float v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Syndicated Asset: Starting suggesting", v10, 2u);
  }

  suggestedAssets = self->_suggestedAssets;
  self->_suggestedAssets = 0;

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;

  options = self->_options;
  self->_options = v4;
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  id v5 = a3;
  float v6 = [v5 uuid];
  v7 = [(PGRecentSyndicatedAssetSuggester *)self eligibleAssetsBetweenStartDate:0 andEndDate:0 matchingAssetUUID:v6 progress:&__block_literal_global_56402];

  if ([v7 count] == 1)
  {
    v8 = [v7 firstObject];
    uint64_t v9 = [v8 uuid];
    id v10 = [v5 uuid];
    char v11 = [v9 isEqualToString:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id aBlock = a4;
  objc_storeStrong((id *)&self->_options, a3);
  v7 = _Block_copy(aBlock);
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v54 = 0;
  v55 = (double *)&v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  if (!v7
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v55[3] < 0.01)
    || (v55[3] = v8,
        char v53 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v53, 0.0),
        char v9 = *((unsigned char *)v59 + 24) | v53,
        (*((unsigned char *)v59 + 24) = v9) == 0))
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = [v42 universalStartDate];
    uint64_t v13 = [v42 universalEndDate];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __68__PGRecentSyndicatedAssetSuggester_suggestionsWithOptions_progress___block_invoke;
    v48[3] = &unk_1E68F03F8;
    id v41 = v7;
    id v49 = v41;
    v50 = &v54;
    v51 = &v58;
    uint64_t v52 = 0x3F847AE147AE147BLL;
    double v14 = [(PGRecentSyndicatedAssetSuggester *)self eligibleAssetsBetweenStartDate:v12 andEndDate:v13 matchingAssetUUID:0 progress:v48];
    uint64_t v38 = (void *)v12;
    v39 = (void *)v13;
    if (*((unsigned char *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v64 = 64;
        __int16 v65 = 2080;
        v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
        double v15 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (v7)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v55[3] >= 0.01)
        {
          v55[3] = Current;
          char v53 = 0;
          (*((void (**)(id, char *, double))v41 + 2))(v41, &v53, 0.5);
          char v18 = *((unsigned char *)v59 + 24) | v53;
          *((unsigned char *)v59 + 24) = v18;
          if (v18)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_11;
            }
            *(_DWORD *)buf = 67109378;
            int v64 = 66;
            __int16 v65 = 2080;
            v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
            double v15 = MEMORY[0x1E4F14500];
            goto LABEL_10;
          }
        }
      }
      if ([v14 count])
      {
        uint64_t v19 = [v42 maximumNumberOfSuggestions];
        if (v19) {
          unint64_t v20 = v19;
        }
        else {
          unint64_t v20 = -1;
        }
        unint64_t v21 = [v14 count];
        if (v21 >= v20) {
          unint64_t v22 = v20;
        }
        else {
          unint64_t v22 = v21;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v37 = v14;
        id obj = v14;
        uint64_t v23 = [obj countByEnumeratingWithState:&v44 objects:v62 count:16];
        if (v23)
        {
          double v24 = 1.0 / (double)v22;
          uint64_t v25 = *(void *)v45;
          double v26 = 0.0;
LABEL_30:
          uint64_t v27 = 0;
          while (1)
          {
            if (*(void *)v45 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * v27);
            v29 = (void *)MEMORY[0x1D25FED50]();
            if (!v7) {
              goto LABEL_39;
            }
            double v30 = CFAbsoluteTimeGetCurrent();
            if (v30 - v55[3] >= 0.01
              && (v55[3] = v30,
                  char v53 = 0,
                  (*((void (**)(id, char *, double))v41 + 2))(v41, &v53, v26 * 0.5 + 0.5),
                  char v31 = *((unsigned char *)v59 + 24) | v53,
                  (*((unsigned char *)v59 + 24) = v31) != 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v64 = 74;
                __int16 v65 = 2080;
                v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              int v32 = 1;
            }
            else
            {
LABEL_39:
              v33 = [(PGRecentSyndicatedAssetSuggester *)self createSuggestionWithAsset:v28];
              [v11 addObject:v33];
              BOOL v34 = [v11 count] >= v20;

              double v26 = v24 + v26;
              int v32 = 2 * v34;
            }
            if (v32) {
              break;
            }
            if (v23 == ++v27)
            {
              uint64_t v23 = [obj countByEnumeratingWithState:&v44 objects:v62 count:16];
              if (v23) {
                goto LABEL_30;
              }
              goto LABEL_43;
            }
          }

          double v14 = v37;
          if (v32 != 2) {
            goto LABEL_11;
          }
        }
        else
        {
LABEL_43:

          double v14 = v37;
        }
      }
      if (!v7
        || (double v35 = CFAbsoluteTimeGetCurrent(), v35 - v55[3] < 0.01)
        || (v55[3] = v35,
            char v53 = 0,
            (*((void (**)(id, char *, double))v41 + 2))(v41, &v53, 1.0),
            char v36 = *((unsigned char *)v59 + 24) | v53,
            (*((unsigned char *)v59 + 24) = v36) == 0))
      {
        id v10 = v11;
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v64 = 85;
        __int16 v65 = 2080;
        v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
        double v15 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
LABEL_11:
    id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v64 = 55;
    __int16 v65 = 2080;
    v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentSyndicatedAssetSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_13:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v10;
}

void __68__PGRecentSyndicatedAssetSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

@end